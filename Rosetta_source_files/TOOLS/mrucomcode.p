EXPORT(mrucomcode);
pragma C_include('mrucomcode.pf');
pragma C_include('mrucomdecl.pf');
pragma C_include('mrucomlangspec.pf');
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
PROGRAM mrucomCODE;
WITH mrucomlangspec,
mrucomdecl,ldtypetostr,lduniquerels,ldmrules,files,tfiles,tstring,lidomaint,str,mem,
tldstrtostr,ldconvrec,tldconvrec,ldstrtotype,ldcatsets,strng;
VAR LEFTMODELS__name              :TSTRING_string
;LEFTMODELS__righttolefttable              :mrucomlangspec_setofidents
;LEFTMODELS__leftcom              :LOCALFILE
;LEFTMODELS__leftdecom              :LOCALFILE
;LEFTMODELS__dtreeproc              :LOCALFILE
;LEFTMODELS__levelids              :mrucomlangspec_setofidents
;RIGHTMODEL__name              :TSTRING_string
;RIGHTMODEL__righttolefttable              :mrucomlangspec_setofidents
;RIGHTMODEL__rightcom              :LOCALFILE
;RIGHTMODEL__rightdecom              :LOCALFILE
;RIGHTMODEL__dtreeproc              :LOCALFILE
;RIGHTMODEL__levelids              :mrucomlangspec_setofidents
;RIGHTMODEL__dtreelevelids              :mrucomlangspec_setofidents
;MATCHCONDS__leftMuVarList              :mrucomlangspec_SETOFidents
;MATCHCONDS__leftSigmaVarList              :mrucomlangspec_SETOFidents
;MATCHCONDS__leftRelVarList              :mrucomlangspec_SETOFidents
;MATCHCONDS__leftTreeVarList              :mrucomlangspec_SETOFidents
;MATCHCONDS__leftNodeVarList              :mrucomlangspec_SETOFidents
;MATCHCONDS__rightMuVarList              :mrucomlangspec_SETOFidents
;MATCHCONDS__rightSigmaVarList              :mrucomlangspec_SETOFidents
;MATCHCONDS__rightRelVarList              :mrucomlangspec_SETOFidents
;MATCHCONDS__rightTreeVarList              :mrucomlangspec_SETOFidents
;MATCHCONDS__rightNodeVarList              :mrucomlangspec_SETOFidents
;MATCHCONDS__indent              :mrucomlangspec_int
;MATCHCONDS__commatchfile              :LOCALFILE
;MATCHCONDS__decommatchfile              :LOCALFILE
;SUBRULES__indent              :mrucomlangspec_int
;SUBRULES__name              :TSTRING_string
;SUBRULES__leftsyncattable              :mrucomlangspec_setofsyncats
;SUBRULES__rightsyncattable              :mrucomlangspec_setofsyncats
;SUBRULES__leftrecordtable              :mrucomlangspec_setofidents
;SUBRULES__rightrecordtable              :mrucomlangspec_setofidents
;SUBRULES__prevleftrhslabels              :mrucomlangspec_setofidents
;SUBRULES__prevrightrhslabels              :mrucomlangspec_setofidents
;SUBRULES__leftmuvarlist              :mrucomlangspec_setofidents
;SUBRULES__leftsigmavarlist              :mrucomlangspec_setofidents
;SUBRULES__lefttreevarlist              :mrucomlangspec_setofidents
;SUBRULES__rightmuvarlist              :mrucomlangspec_setofidents
;SUBRULES__rightsigmavarlist              :mrucomlangspec_setofidents
;SUBRULES__righttreevarlist              :mrucomlangspec_setofidents
;SUBRULES__modelnumber              :mrucomlangspec_int
;SUBRULES__vartypes              :mrucomlangspec_setofvartypes
;SUBRULES__comsubrules              :LOCALFILE
;SUBRULES__decomsubrules              :LOCALFILE
;SUBRULES__dtreeproc              :LOCALFILE
;SUBFILTERS__indent              :mrucomlangspec_int
;SUBFILTERS__prevrightrhslabels              :mrucomlangspec_setofidents
;SUBFILTERS__vartypes              :mrucomlangspec_setofvartypes
;SUBFILTERS__comsubrules              :LOCALFILE
;SUBFILTERS__decomsubrules              :LOCALFILE
;COMCAPAIRS__actionteller              :mrucomlangspec_teller
;COMCAPAIRS__actiontellers              :mrucomlangspec_setoftellers
;COMCAPAIRS__indent              :mrucomlangspec_int
;COMCAPAIRS__syncattable              :mrucomlangspec_setofsyncats
;COMCAPAIRS__recordtable              :mrucomlangspec_setofidents
;COMCAPAIRS__modelnumber              :mrucomlangspec_int
;COMCAPAIRS__level              :mrucomlangspec_int
;COMCAPAIRS__insubrule              :mrucomlangspec_bool
;COMCAPAIRS__filter              :mrucomlangspec_bool
;COMCAPAIRS__vartypes              :mrucomlangspec_setofvartypes
;COMCAPAIRS__rhslabels              :mrucomlangspec_setofidents
;COMCAPAIRS__conditions              :LOCALFILE
;COMCAPAIRS__actions              :LOCALFILE
;COMCAPAIRS__allexist              :LOCALFILE
;COMCAPAIRS__allexistcounter              :mrucomlangspec_int
;DECOMCAPAIRS__actionteller              :mrucomlangspec_teller
;DECOMCAPAIRS__actiontellers              :mrucomlangspec_setoftellers
;DECOMCAPAIRS__indent              :mrucomlangspec_int
;DECOMCAPAIRS__syncattable              :mrucomlangspec_setofsyncats
;DECOMCAPAIRS__recordtable              :mrucomlangspec_setofidents
;DECOMCAPAIRS__modelnumber              :mrucomlangspec_int
;DECOMCAPAIRS__level              :mrucomlangspec_int
;DECOMCAPAIRS__insubrule              :mrucomlangspec_bool
;DECOMCAPAIRS__filter              :mrucomlangspec_bool
;DECOMCAPAIRS__vartypes              :mrucomlangspec_setofvartypes
;DECOMCAPAIRS__rhslabels              :mrucomlangspec_setofidents
;DECOMCAPAIRS__conditions              :LOCALFILE
;DECOMCAPAIRS__actions              :LOCALFILE
;DECOMCAPAIRS__allexist              :LOCALFILE
;DECOMCAPAIRS__allexistcounter              :mrucomlangspec_int
;CAPAIRS__actionteller              :mrucomlangspec_teller
;CAPAIRS__actiontellers              :mrucomlangspec_setoftellers
;CAPAIRS__indent              :mrucomlangspec_int
;CAPAIRS__syncattable              :mrucomlangspec_setofsyncats
;CAPAIRS__recordtable              :mrucomlangspec_setofidents
;CAPAIRS__modelnumber              :mrucomlangspec_int
;CAPAIRS__level              :mrucomlangspec_int
;CAPAIRS__insubrule              :mrucomlangspec_bool
;CAPAIRS__filter              :mrucomlangspec_bool
;CAPAIRS__vartypes              :mrucomlangspec_setofvartypes
;CAPAIRS__rhslabels              :mrucomlangspec_setofidents
;CAPAIRS__conditions              :LOCALFILE
;CAPAIRS__actions              :LOCALFILE
;CAPAIRS__allexist              :LOCALFILE
;CAPAIRS__allexistcounter              :mrucomlangspec_int
;bareCAPAIRS__actionteller              :mrucomlangspec_teller
;bareCAPAIRS__actiontellers              :mrucomlangspec_setoftellers
;bareCAPAIRS__indent              :mrucomlangspec_int
;bareCAPAIRS__syncattable              :mrucomlangspec_setofsyncats
;bareCAPAIRS__recordtable              :mrucomlangspec_setofidents
;bareCAPAIRS__modelnumber              :mrucomlangspec_int
;bareCAPAIRS__level              :mrucomlangspec_int
;bareCAPAIRS__insubrule              :mrucomlangspec_bool
;bareCAPAIRS__filter              :mrucomlangspec_bool
;bareCAPAIRS__vartypes              :mrucomlangspec_setofvartypes
;bareCAPAIRS__rhslabels              :mrucomlangspec_setofidents
;bareCAPAIRS__conditions              :LOCALFILE
;bareCAPAIRS__actions              :LOCALFILE
;bareCAPAIRS__allexist              :LOCALFILE
;bareCAPAIRS__allexistcounter              :mrucomlangspec_int
;LABELEDTD__indent              :mrucomlangspec_INT
;LABELEDTD__name              :TSTRING_string
;LABELEDTD__submodeltree              :mrucomlangspec_bool
;LABELEDTD__righttolefttable              :mrucomlangspec_setofidents
;LABELEDTD__root              :TSTRING_string
;LABELEDTD__leftcom              :LOCALFILE
;LABELEDTD__rightcom              :LOCALFILE
;LABELEDTD__dtreeproc              :LOCALFILE
;LABELEDTD__numberofitems              :mrucomlangspec_INT
;LABELEDTD__keymentioned              :mrucomlangspec_bool
;LABELEDTD__keyvar              :mrucomlangspec_bool
;LABELEDTD__keystr1              :TSTRING_string
;LABELEDTD__keystr2              :TSTRING_string
;LABELEDTD__levelids              :mrucomlangspec_setofidents
;LABELtje__indent              :mrucomlangspec_INT
;BARETD__indent              :mrucomlangspec_INT
;BARETD__name              :TSTRING_string
;BARETD__righttolefttable              :mrucomlangspec_SETOFidents
;BARETD__root              :TSTRING_string
;BARETD__leftcom              :LOCALFILE
;BARETD__rightcom              :LOCALFILE
;BARETD__dtreeproc              :LOCALFILE
;BARETD__NumberOfItems              :mrucomlangspec_INT
;BARETD__keymentioned              :mrucomlangspec_bool
;BARETD__keyvar              :mrucomlangspec_bool
;BARETD__keystr1              :TSTRING_string
;BARETD__levelids              :mrucomlangspec_setofidents
;BARETD__keystr2              :TSTRING_string
;LABELEDND__indent              :mrucomlangspec_INT
;LABELEDND__name              :TSTRING_string
;LABELEDND__shorthand              :TSTRING_string
;LABELEDND__leftcom              :LOCALFILE
;LABELEDND__rightcom              :LOCALFILE
;LABELEDND__dtreeproc              :LOCALFILE
;LABELEDND__keymentioned              :mrucomlangspec_bool
;LABELEDND__keyvar              :mrucomlangspec_bool
;LABELEDND__keystr1              :TSTRING_string
;LABELEDND__keystr2              :TSTRING_string
;BAREND__labeled              :mrucomlangspec_bool
;BAREND__label              :TSTRING_string
;BAREND__indent              :mrucomlangspec_INT
;BAREND__shorthand              :TSTRING_string
;BAREND__name              :TSTRING_string
;BAREND__leftcom              :LOCALFILE
;BAREND__rightcom              :LOCALFILE
;BAREND__dtreeproc              :LOCALFILE
;BAREND__keymentioned              :mrucomlangspec_bool
;BAREND__keyvar              :mrucomlangspec_bool
;BAREND__keystr1              :TSTRING_string
;BAREND__keystr2              :TSTRING_string
;LABELEDLD__indent              :mrucomlangspec_INT
;LABELEDLD__righttolefttable              :mrucomlangspec_setofidents
;LABELEDLD__submodellist              :mrucomlangspec_bool
;LABELEDLD__inexist              :mrucomlangspec_bool
;LABELEDLD__root              :TSTRING_string
;LABELEDLD__name              :TSTRING_string
;LABELEDLD__leftcom              :LOCALFILE
;LABELEDLD__rightcom              :LOCALFILE
;LABELEDLD__dtreeproc              :LOCALFILE
;LABELEDLD__NumberOfItems              :mrucomlangspec_INT
;LABELEDLD__levelids              :mrucomlangspec_setofidents
;BARELD__label              :TSTRING_string
;BARELD__labeled              :mrucomlangspec_Bool
;BARELD__indent              :mrucomlangspec_INT
;BARELD__inexist              :mrucomlangspec_bool
;BARELD__bounded              :mrucomlangspec_Bool
;BARELD__righttolefttable              :mrucomlangspec_SETOFidents
;BARELD__righttoleftmatch              :mrucomlangspec_BOOL
;BARELD__root              :TSTRING_string
;BARELD__name              :TSTRING_string
;BARELD__leftcom              :LOCALFILE
;BARELD__rightcom              :LOCALFILE
;BARELD__dtreeproc              :LOCALFILE
;BARELD__NumberOfItems              :mrucomlangspec_INT
;BARELD__levelids              :mrucomlangspec_setofidents
;TREEVAR__ident              :TSTRING_string
;CATNAME__ident              :TSTRING_string
;CATRECNAME__ident              :TSTRING_string
;NODEVAR__ident              :TSTRING_string
;ITEM__indent              :mrucomlangspec_INT
;ITEM__righttolefttable              :mrucomlangspec_SETOFidents
;ITEM__root              :TSTRING_string
;ITEM__name              :TSTRING_string
;ITEM__leftcom              :LOCALFILE
;ITEM__rightcom              :LOCALFILE
;ITEM__dtreeproc              :LOCALFILE
;ITEM__identifier              :TSTRING_string
;ITEM__levelids              :mrucomlangspec_setofidents
;LABELEDITEM__indent              :mrucomlangspec_INT
;LABELEDITEM__righttolefttable              :mrucomlangspec_setofidents
;LABELEDITEM__root              :TSTRING_string
;LABELEDITEM__name              :TSTRING_string
;LABELEDITEM__leftcom              :LOCALFILE
;LABELEDITEM__rightcom              :LOCALFILE
;LABELEDITEM__dtreeproc              :LOCALFILE
;LABELEDITEM__identifier              :TSTRING_string
;LABELEDITEM__levelids              :mrucomlangspec_setofidents
;BAREITEM__labeled              :mrucomlangspec_Bool
;BAREITEM__label              :TSTRING_string
;BAREITEM__indent              :mrucomlangspec_INT
;BAREITEM__righttoleftmatch              :mrucomlangspec_BOOL
;BAREITEM__righttolefttable              :mrucomlangspec_setofidents
;BAREITEM__root              :TSTRING_string
;BAREITEM__name              :TSTRING_string
;BAREITEM__leftcom              :LOCALFILE
;BAREITEM__rightcom              :LOCALFILE
;BAREITEM__dtreeproc              :LOCALFILE
;BAREITEM__identifier              :TSTRING_string
;BAREITEM__levelids              :mrucomlangspec_setofidents
;MUVAR__ident              :TSTRING_string
;RELVAR__ident              :TSTRING_string
;RELNAME__ident              :TSTRING_string
;SIGMAVAR__ident              :TSTRING_string
;RTD__labeled              :mrucomlangspec_Bool
;RTD__label              :TSTRING_string
;RTD__indent              :mrucomlangspec_INT
;RTD__righttolefttable              :mrucomlangspec_setofidents
;RTD__root              :TSTRING_string
;RTD__name              :TSTRING_string
;RTD__leftcom              :LOCALFILE
;RTD__rightcom              :LOCALFILE
;RTD__dtreeproc              :LOCALFILE
;RTD__variable              :TSTRING_string
;RTD__NumberOfItems              :mrucomlangspec_INT
;RTD__RelationNamed              :mrucomlangspec_Bool
;RTD__keymentioned              :mrucomlangspec_bool
;RTD__keyvar              :mrucomlangspec_bool
;RTD__keystr1              :TSTRING_string
;RTD__keystr2              :TSTRING_string
;RTD__levelids              :mrucomlangspec_setofidents
;LD__inexist              :mrucomlangspec_bool
;LD__NumberOfItems              :mrucomlangspec_INT
;LD__allexist              :LOCALFILE
;LD__levelids              :mrucomlangspec_setofidents
;RELD__labeled              :mrucomlangspec_Bool
;RELD__label              :TSTRING_string
;RELD__indent              :mrucomlangspec_INT
;RELD__leftcom              :LOCALFILE
;RELD__rightcom              :LOCALFILE
;RELD__variable              :TSTRING_string
;RELD__RelationNamed              :mrucomlangspec_Bool
;ANDCOND__indent              :mrucomlangspec_int
;ANDCOND__toplevel              :mrucomlangspec_bool
;ANDCOND__vartypes              :mrucomlangspec_setofvartypes
;ANDCOND__commatchfile              :LOCALFILE
;ANDCOND__decommatchfile              :LOCALFILE
;ANDCOND__allexist              :LOCALFILE
;ANDCOND__allexistcounter              :mrucomlangspec_int
;ORCOND__vartypes              :mrucomlangspec_setofvartypes
;ORCOND__commatchfile              :LOCALFILE
;ORCOND__decommatchfile              :LOCALFILE
;ORCOND__allexist              :LOCALFILE
;ORCOND__allexistcounter              :mrucomlangspec_int
;ELEMENTARYCOND__vartypes              :mrucomlangspec_setofvartypes
;ELEMENTARYCOND__commatchfile              :LOCALFILE
;ELEMENTARYCOND__decommatchfile              :LOCALFILE
;ELEMENTARYCOND__allexist              :LOCALFILE
;ELEMENTARYCOND__allexistcounter              :mrucomlangspec_int
;MATCHBOOLEAN__commatchfile              :LOCALFILE
;MATCHBOOLEAN__decommatchfile              :LOCALFILE
;MATCHBOOLEAN__allexist              :LOCALFILE
;MATCHBOOLEAN__allexistcounter              :mrucomlangspec_int
;BOOLEANEXPR__vartypes              :mrucomlangspec_setofvartypes
;BOOLEANEXPR__commatchfile              :LOCALFILE
;BOOLEANEXPR__decommatchfile              :LOCALFILE
;BOOLEANEXPR__allexist              :LOCALFILE
;BOOLEANEXPR__allexistcounter              :mrucomlangspec_int
;PASCALEXPR__vartypes              :mrucomlangspec_setofvartypes
;PASCALEXPR__commatchfile              :LOCALFILE
;PASCALEXPR__decommatchfile              :LOCALFILE
;PASCALEXPR__casefile              :LOCALFILE
;PASCALEXPR__allexistcounter              :mrucomlangspec_int
;CONDRECORD__commatchfile              :LOCALFILE
;CONDRECORD__decommatchfile              :LOCALFILE
;CONDRECORD__allexist              :LOCALFILE
;CONDRECORD__allexistcounter              :mrucomlangspec_int
;ASSIGNRECORD__copy              :LOCALFILE
;PARNAME__ident              :TSTRING_string
;PARTYPE__ident              :TSTRING_string
;LEFTSUBMODELS__righttolefttable              :mrucomlangspec_setofidents
;LEFTSUBMODELS__indent              :mrucomlangspec_int
;LEFTSUBMODELS__name              :TSTRING_string
;LEFTSUBMODELS__prevrhslabels              :mrucomlangspec_setofidents
;LEFTSUBMODELS__rightmuvarlist              :mrucomlangspec_setofidents
;LEFTSUBMODELS__rightsigmavarl              :mrucomlangspec_setofidents
;LEFTSUBMODELS__righttreevarl              :mrucomlangspec_setofidents
;LEFTSUBMODELS__leftcom              :LOCALFILE
;LEFTSUBMODELS__leftdecom              :LOCALFILE
;LEFTSUBMODELS__dtreeproc              :LOCALFILE
;LEFTSUBMODELS__levelids              :mrucomlangspec_setofidents
;RIGHTSUBMODELS__righttolefttabl              :mrucomlangspec_setofidents
;RIGHTSUBMODELS__name              :TSTRING_string
;RIGHTSUBMODELS__indent              :mrucomlangspec_int
;RIGHTSUBMODELS__prevrhslabels              :mrucomlangspec_setofidents
;RIGHTSUBMODELS__leftmuvarlist              :mrucomlangspec_setofidents
;RIGHTSUBMODELS__leftsigmavarl              :mrucomlangspec_setofidents
;RIGHTSUBMODELS__lefttreevarl              :mrucomlangspec_setofidents
;RIGHTSUBMODELS__rightcom              :LOCALFILE
;RIGHTSUBMODELS__rightdecom              :LOCALFILE
;RIGHTSUBMODELS__dtreeproc              :LOCALFILE
;RIGHTSUBMODELS__levelids              :mrucomlangspec_setofidents
;CONDITION__actiontellers              :mrucomlangspec_setoftellers
;CONDITION__vartypes              :mrucomlangspec_setofvartypes
;CONDITION__copy              :LOCALFILE
;CONDITION__allexist              :LOCALFILE
;CONDITION__allexistcounter              :mrucomlangspec_int
;CONDITION__recattvals              :mrucomlangspec_setofrecattvals
;ACTION__vartypes              :mrucomlangspec_setofvartypes
;ACTION__deepestlevel              :mrucomlangspec_bool
;ACTION__actions              :LOCALFILE
;STATEMENTS__vartypes              :mrucomlangspec_setofvartypes
;STATEMENTS__copy              :LOCALFILE
;PASCALSTATEMENT__vartypes              :mrucomlangspec_setofvartypes
;PASCALSTATEMENT__copy              :LOCALFILE
;CLABEL__ident              :TSTRING_string
;ALABEL__ident              :TSTRING_string
;ILABELtje__ident              :TSTRING_string
;MLABELtje__ident              :TSTRING_string
;RLABELtje__ident              :TSTRING_string
;LLABELtje__ident              :TSTRING_string
;TRUECAT__ident              :TSTRING_string
;CATCAT__ident              :TSTRING_string
;GRAPH__make              :LOCALFILE
;CONCGRAPH__number              :mrucomlangspec_int
;CONCGRAPH__make              :LOCALFILE
;ELEMENTARYGRAPH__number              :mrucomlangspec_int
;ELEMENTARYGRAPH__make              :LOCALFILE
;VARNAME__string              :TSTRING_string
;VALUENAME__string              :TSTRING_string
;SETVALUENAME__copy              :LOCALFILE
;BONUSspec__bonusfile              :LOCALFILE
;DTREE__name              :TSTRING_string
;DTREE__rightcom              :LOCALFILE
;DTREE__comactions              :LOCALFILE
;DTREE__decomactions              :LOCALFILE
;DTREE__extern              :LOCALFILE
;DTREE__levelids              :mrucomlangspec_setofidents
;DTREE__counter              :mrucomlangspec_int
;DTREE__externcounter              :mrucomlangspec_int
;LABELEDDTREE__name              :TSTRING_string
;LABELEDDTREE__rightcom              :LOCALFILE
;LABELEDDTREE__levelids              :mrucomlangspec_setofidents
;LABELEDDTREE__comactions              :LOCALFILE
;LABELEDDTREE__decomactions              :LOCALFILE
;LABELEDDTREE__extern              :LOCALFILE
;cofenv1:files_text;
decofenv1:files_text;
cofpas1:files_text;
decofpas1:files_text;
PROCEDURE mrucomCODE_UTTproc(top:mrucomDECL_psnode
);
VAR currenttree:mrucomDECL_psnode;
    rsnode1:mrucomDECL_prsnode;
 filenumber:TSTRING_string;
language:TSTRING_string;
dtreenames,dtreenames1: mrucomLANGSPEC_setofidents;
id: mrucomLANGSPEC_ident;
H: MEM_Stackptr;
BEGIN
BEGIN TFILES_open(cofenv1,'cofenv',6,3);
TFILES_open(cofpas1,'cofpas',6,3);
{ TFILES_open(varpool1,'varpool',7,3);}
TFILES_open(decofenv1,'decofenv',8,3);
TFILES_open(decofpas1,'decofpas',8,3);
dtreenames:=top^.ldfield.UTTfield^.dtreenames;
language:=top^.ldfield.UTTfield^.language;
filenumber:=top^.ldfield.UTTfield^.filenumber;
BEGIN 
TFILES_writestr(cofpas1,
'EXPORT(commrules);',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);


TFILES_writestr(cofpas1,
'pragma C_include(''globsubst.pf'');',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);


TFILES_writestr(cofpas1,
'pragma C_include(''listree.pf'');',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);


TFILES_writestr(cofpas1,
'pragma C_include(''limatches.pf'');',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);


TFILES_writestr(cofpas1,
'pragma C_include(''lsmatches.pf'');',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);


TFILES_writestr(cofpas1,
'pragma C_include(''lidomaint.pf'');',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);


TFILES_writestr(cofpas1,
'pragma C_include(''liiddict.pf'');',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);


TFILES_writestr(cofpas1,
'pragma C_include(''lsdomaint.pf'');',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);


TFILES_writestr(cofpas1,
'pragma C_include(''maket.pf'');',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);


TFILES_writestr(cofpas1,
'pragma C_include(''lsstree.pf'');',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);


TFILES_writestr(cofpas1,
'pragma C_include(''copyt.pf'');',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);


TFILES_writestr(cofpas1,
'pragma C_include(''string.pf'');',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);


TFILES_writestr(cofpas1,
'pragma C_include(''mem.pf'');',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);


IF stillidents(dtreenames) THEN BEGIN
TFILES_writestr(cofpas1,
'pragma C_include(''lsparams.pf'');',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);


TFILES_writestr(cofpas1,
'pragma C_include(''ldmrules.pf'');',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);


END;
TFILES_writestr(cofpas1,
'pragma C_include(''gidderiv.pf'');',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);


TFILES_writestr(cofpas1,
'pragma C_include(''hyperdtree.pf'');',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);


TFILES_writestr(cofpas1,
'pragma C_include(''strtokey.pf'');',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);


TFILES_writestr(cofpas1,
'pragma C_include(''lsmruquo.pf'');',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);


TFILES_writestr(cofpas1,
'pragma C_include(''lsauxdom.pf'');',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);


TFILES_writestr(cofpas1,
'pragma C_include(''ldblex.pf'');',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);


TFILES_writestr(cofpas1,
'PACKAGE comMrules;',FILES_maxIO,0,left);

 TFILES_writeline(cofpas1,TRUE);


TFILES_writestr(cofpas1,
'WITH listree,lsdomaint;',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);


TFILES_writestr(cofpas1,
'pragma C_include(''commrules',FILES_maxIO,0,left);

 TFILES_writestring(cofpas1,
filenumber,0,left);

 TFILES_writestr(cofpas1,
'.pf'');',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);


TFILES_writestr(cofpas1,
'END;',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);


TFILES_writestr(cofpas1,
'PROGRAM comMrules',FILES_maxIO,0,left);

 TFILES_writestring(cofpas1,
filenumber,0,left);

 TFILES_writestr(cofpas1,
';',FILES_maxIO,0,left);

 TFILES_writeline(cofpas1,TRUE);


TFILES_writestr(cofpas1,
'WITH globsubst,listree,limatches,lsmatches,',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);


TFILES_writestr(cofpas1,
'lidomaint,liiddict,lsdomaint,maket,lsstree,',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);


TFILES_writestr(cofpas1,
'copyt,mem,',FILES_maxIO,0,left);


IF stillidents(dtreenames) THEN BEGIN
TFILES_writestr(cofpas1,
'lsparams,ldmrules,',FILES_maxIO,0,left);

 END;TFILES_writeline(cofpas1,TRUE);


TFILES_writestr(cofpas1,
'gidderiv,hyperdtree,strtokey,lsmruquo,',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);


TFILES_writestr(cofpas1,
'lsauxdom,ldblex;',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);


TFILES_writestr(cofpas1,
'TYPE synrelset=SET OF LSDOMAINT_synrel;',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);


TFILES_writestr(cofpas1,
'VAR hulpstree:LISTREE_pstree;',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);


TFILES_writestr(cofpas1,
' VPID:LSDOMAINT_synpatternsettype;',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);


TFILES_writestr(cofpas1,
'hulplsstree:LSSTREE_pstree;',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);


dtreenames1:=dtreenames;
WHILE stillidents(dtreenames1) DO
BEGIN
takeident(id,dtreenames1);
TFILES_writestr(cofpas1,
'dtree',FILES_maxIO,0,left);

 TFILES_writestring(cofpas1,
id.str,0,left);

 TFILES_writestr(cofpas1,
':HYPERDTREE_pHYPERDTREE;',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);


END;
IF stillidents(dtreenames) THEN
BEGIN
TFILES_writestr(cofpas1,
'X1,X2,X3,X4,X5:INTEGER;',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);


END;
dtreenames1:=dtreenames;
WHILE stillidents(dtreenames1) DO
BEGIN
takeident(id,dtreenames1);
TFILES_writestring(cofpas1,
id.str,0,left);

 TFILES_writestr(cofpas1,
'd1,',FILES_maxIO,0,left);

 TFILES_writestring(cofpas1,
id.str,0,left);

 TFILES_writestr(cofpas1,
'd2,',FILES_maxIO,0,left);

 TFILES_writeline(cofpas1,TRUE);

TFILES_writestring(cofpas1,
id.str,0,left);

 TFILES_writestr(cofpas1,
'd3,',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);


TFILES_writestring(cofpas1,
id.str,0,left);

 TFILES_writestr(cofpas1,
'd4,',FILES_maxIO,0,left);

 TFILES_writestring(cofpas1,
id.str,0,left);

 TFILES_writestr(cofpas1,
'd5,',FILES_maxIO,0,left);

 TFILES_writeline(cofpas1,TRUE);

TFILES_writestring(cofpas1,
id.str,0,left);

 TFILES_writestr(cofpas1,
'd6,',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);


TFILES_writestring(cofpas1,
id.str,0,left);

 TFILES_writestr(cofpas1,
'd7,',FILES_maxIO,0,left);

 TFILES_writestring(cofpas1,
id.str,0,left);

 TFILES_writestr(cofpas1,
'd8,',FILES_maxIO,0,left);

 TFILES_writeline(cofpas1,TRUE);

TFILES_writestring(cofpas1,
id.str,0,left);

 TFILES_writestr(cofpas1,
'd9,',FILES_maxIO,0,left);

 
TFILES_writestring(cofpas1,
id.str,0,left);

 TFILES_writestr(cofpas1,
'd10,',FILES_maxIO,0,left);

 TFILES_writestring(cofpas1,
id.str,0,left);

 TFILES_writestr(cofpas1,
'd11,',FILES_maxIO,0,left);

 TFILES_writeline(cofpas1,TRUE);

TFILES_writestring(cofpas1,
id.str,0,left);

 TFILES_writestr(cofpas1,
'd12,',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);

 
TFILES_writestring(cofpas1,
id.str,0,left);

 TFILES_writestr(cofpas1,
'd13,',FILES_maxIO,0,left);

 TFILES_writestring(cofpas1,
id.str,0,left);

 TFILES_writestr(cofpas1,
'd14,',FILES_maxIO,0,left);

 TFILES_writeline(cofpas1,TRUE);


TFILES_writestring(cofpas1,
id.str,0,left);

 TFILES_writestr(cofpas1,
'd15:HYPERDTREE_pHyperDtree;',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);


TFILES_writestring(cofpas1,
id.str,0,left);

 TFILES_writestr(cofpas1,
'delt1,',FILES_maxIO,0,left);

 TFILES_writestring(cofpas1,
id.str,0,left);

 TFILES_writestr(cofpas1,
'delt2,',FILES_maxIO,0,left);

 TFILES_writeline(cofpas1,TRUE);


TFILES_writestring(cofpas1,
id.str,0,left);

 TFILES_writestr(cofpas1,
'delt3,',FILES_maxIO,0,left);

 TFILES_writestring(cofpas1,
id.str,0,left);

 TFILES_writestr(cofpas1,
'delt4,',FILES_maxIO,0,left);

 TFILES_writeline(cofpas1,TRUE);


TFILES_writestring(cofpas1,
id.str,0,left);

 TFILES_writestr(cofpas1,
'delt5,',FILES_maxIO,0,left);

 TFILES_writestring(cofpas1,
id.str,0,left);

 TFILES_writestr(cofpas1,
'delt6,',FILES_maxIO,0,left);

 TFILES_writeline(cofpas1,TRUE);


TFILES_writestring(cofpas1,
id.str,0,left);

 TFILES_writestr(cofpas1,
'delt7,',FILES_maxIO,0,left);

 TFILES_writestring(cofpas1,
id.str,0,left);

 TFILES_writestr(cofpas1,
'delt8,',FILES_maxIO,0,left);

 TFILES_writeline(cofpas1,TRUE);


TFILES_writestring(cofpas1,
id.str,0,left);

 TFILES_writestr(cofpas1,
'delt9,',FILES_maxIO,0,left);

 TFILES_writestring(cofpas1,
id.str,0,left);

 TFILES_writestr(cofpas1,
'delt10,',FILES_maxIO,0,left);

 TFILES_writeline(cofpas1,TRUE);


TFILES_writestring(cofpas1,
id.str,0,left);

 TFILES_writestr(cofpas1,
'delt11,',FILES_maxIO,0,left);

 TFILES_writestring(cofpas1,
id.str,0,left);

 TFILES_writestr(cofpas1,
'delt12,',FILES_maxIO,0,left);

 TFILES_writeline(cofpas1,TRUE);


TFILES_writestring(cofpas1,
id.str,0,left);

 TFILES_writestr(cofpas1,
'delt13,',FILES_maxIO,0,left);

 TFILES_writestring(cofpas1,
id.str,0,left);

 TFILES_writestr(cofpas1,
'delt14,',FILES_maxIO,0,left);

 TFILES_writeline(cofpas1,TRUE);


TFILES_writestring(cofpas1,
id.str,0,left);

 TFILES_writestr(cofpas1,
'delt15,',FILES_maxIO,0,left);

 TFILES_writestring(cofpas1,
id.str,0,left);

 TFILES_writestr(cofpas1,
'delt16,',FILES_maxIO,0,left);

 TFILES_writeline(cofpas1,TRUE);


TFILES_writestring(cofpas1,
id.str,0,left);

 TFILES_writestr(cofpas1,
'delt17:HYPERDTREE_pHyperNodeElt;',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);


END;
BEGIN
dtreenames1:=dtreenames;
WHILE stillidents(dtreenames1) DO
BEGIN
takeident(id,dtreenames1);
TFILES_writestr(cofpas1,
'FUNCTION crdtree',FILES_maxIO,0,left);

 TFILES_writestring(cofpas1,
id.str,0,left);


TFILES_writestr(cofpas1,
':HYPERDTREE_phyperdtree;FORWARD;',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);


END;
TFILES_writestr(cofpas1,
' PROCEDURE commrules',FILES_maxIO,0,left);

 TFILES_writestring(cofpas1,
filenumber,0,left);

 
TFILES_writestr(cofpas1,
'_init;',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);


TFILES_writestr(cofpas1,
'BEGIN',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);


dtreenames1:=dtreenames;
WHILE stillidents(dtreenames1) DO
BEGIN
takeident(id,dtreenames1);
TFILES_writestr(cofpas1,
'dtree',FILES_maxIO,0,left);

 TFILES_writestring(cofpas1,
id.str,0,left);

 
TFILES_writestr(cofpas1,
':=crdtree',FILES_maxIO,0,left);

 TFILES_writestring(cofpas1,
id.str,0,left);

 TFILES_writestr(cofpas1,
';',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);


END;
TFILES_writestr(cofpas1,
'END;',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);


{ TFILES_writestr(cofpas1,
'FUNCTION auxkey(strkey:STRING_string):INTEGER;',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);


TFILES_writestr(cofpas1,
'VAR int:INTEGER;',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);


TFILES_writestr(cofpas1,
'BEGIN',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);


TFILES_writestr(cofpas1,
' STRTOKEY_getSkey(strkey,int); auxkey:=int;',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);


TFILES_writestr(cofpas1,
'END;',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);


TFILES_writestr(cofpas1,
'PROCEDURE MatchList0Items',FILES_maxIO,0,left);

;
TFILES_writestr(cofpas1,
'(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);


TFILES_writestr(cofpas1,
'BEGIN',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);


TAB(cofpas1,2);
TFILES_writestr(cofpas1,
'IF first THEN match := (L=NIL) ELSE match:=FALSE',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);


TFILES_writestr(cofpas1,
'END;',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);


END;
BEGIN
TFILES_writestr(cofpas1,
'FUNCTION numberofelements(L:LSMRUQUO_Listofstrees):INTEGER;',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);


TFILES_writestr(cofpas1,
'VAR result:INTEGER;',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);


TFILES_writestr(cofpas1,
'BEGIN',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);


TFILES_writestr(cofpas1,
'result:=0;',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);


TFILES_writestr(cofpas1,
'WHILE L.first<>NIL DO',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);


TFILES_writestr(cofpas1,
' BEGIN',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);


TFILES_writestr(cofpas1,
' result:=result+1;',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);


TFILES_writestr(cofpas1,
' L.first:=L.first^.brother',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);


TFILES_writestr(cofpas1,
' END;',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);


TFILES_writestr(cofpas1,
'numberofelements:=result',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);


TFILES_writestr(cofpas1,
'END;',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);


TFILES_writestr(cofpas1,
'PROCEDURE copylist(L1:LSMRUQUO_Listofstrees;',FILES_maxIO,0,left);


TFILES_writestr(cofpas1,
'VAR L2:LSMRUQUO_Listofstrees);',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);


TFILES_writestr(cofpas1,
'VAR p,p1:LSSTREE_prelnode;',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);


TFILES_writestr(cofpas1,
'BEGIN',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);


TFILES_writestr(cofpas1,
'IF L1.first=NIL THEN L2:=L1',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);


TFILES_writestr(cofpas1,
'ELSE',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);


TFILES_writestr(cofpas1,
' BEGIN',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);


TFILES_writestr(cofpas1,
' LISTREE_makerelnode(loopholes.retype',FILES_maxIO,0,left);


TFILES_writestr(cofpas1,
'(p1,LISTREE_prelnode));',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);


TFILES_writestr(cofpas1,
' p:=p1;',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);


TFILES_writestr(cofpas1,
' p1^:=L1.first^;',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);


TFILES_writestr(cofpas1,
' p1^.brother:=NIL;',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);


TFILES_writestr(cofpas1,
' L2.first:=p1;',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);


TFILES_writestr(cofpas1,
' WHILE L1.first<>L1.last DO',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);


TFILES_writestr(cofpas1,
' BEGIN',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);


TFILES_writestr(cofpas1,
' L1.first:=L1.first^.brother;',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);


TFILES_writestr(cofpas1,
' LISTREE_makerelnode(loopholes.retype',FILES_maxIO,0,left);


TFILES_writestr(cofpas1,
'(p1,LISTREE_prelnode));',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);


TFILES_writestr(cofpas1,
' p^.brother:=p1;',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);


TFILES_writestr(cofpas1,
' p:=p1;',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);


TFILES_writestr(cofpas1,
' p1^:=L1.first^;',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);


TFILES_writestr(cofpas1,
' p1^.brother:=NIL;',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);


TFILES_writestr(cofpas1,
' END;',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);


TFILES_writestr(cofpas1,
' L2.last:=p',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);


TFILES_writestr(cofpas1,
' END;',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);


TFILES_writestr(cofpas1,
'END;',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);

}
END;
BEGIN
{ TFILES_writestr(cofpas1,
'PROCEDURE SelectLfirstAndLlast',FILES_maxIO,0,left);

;
TFILES_writestr(cofpas1,
'(VAR Lfirst,Llast,Lrest:LSSTREE_pRelNode;',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);


TAB(cofpas1,10);
TFILES_writestr(cofpas1,
'VAR NoMoreTrees:BOOLEAN;',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);


TAB(cofpas1,10);
TFILES_writestr(cofpas1,
'L:LSSTREE_pRelNode);',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);


TFILES_writestr(cofpas1,
'BEGIN',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);


TAB(cofpas1,2);
TFILES_writestr(cofpas1,
'IF L=NIL THEN nomoretrees:=TRUE',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);


TAB(cofpas1,2);
TFILES_writestr(cofpas1,
'ELSE',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);


TAB(cofpas1,4);
TFILES_writestr(cofpas1,
'BEGIN',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);


TAB(cofpas1,4);
TFILES_writestr(cofpas1,
'IF Lfirst=NIL THEN',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);


TAB(cofpas1,6);
TFILES_writestr(cofpas1,
'BEGIN',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);


TAB(cofpas1,6);
TFILES_writestr(cofpas1,
'Lfirst:=L;',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);


TAB(cofpas1,6);
TFILES_writestr(cofpas1,
'Llast:=Lfirst;',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);


TAB(cofpas1,6);
TFILES_writestr(cofpas1,
'Lrest:=Llast^.brother;',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);


TAB(cofpas1,6);
TFILES_writestr(cofpas1,
'END',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);


TAB(cofpas1,4);
TFILES_writestr(cofpas1,
'ELSE',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);


TAB(cofpas1,6);
TFILES_writestr(cofpas1,
'IF Lrest=NIL THEN ',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);


TAB(cofpas1,8);
TFILES_writestr(cofpas1,
'NoMoreTrees:=TRUE',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);


TAB(cofpas1,6);
TFILES_writestr(cofpas1,
'ELSE',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);


TAB(cofpas1,6);
TFILES_writestr(cofpas1,
'BEGIN',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);


TAB(cofpas1,8);
TFILES_writestr(cofpas1,
'Llast:=Llast^.brother;',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);


TAB(cofpas1,8);
TFILES_writestr(cofpas1,
'Lrest:=Llast^.brother;',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);


TAB(cofpas1,6);
TFILES_writestr(cofpas1,
'END',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);


TAB(cofpas1,4);
TFILES_writestr(cofpas1,
'END',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);


TFILES_writestr(cofpas1,
'END;{SelectLfirstAndLlast',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);

TFILES_writeline(cofpas1,TRUE);

 }
{ TFILES_writestr(cofpas1,
'PROCEDURE TcelesLfirstAndLlast',FILES_maxIO,0,left);

;
TFILES_writestr(cofpas1,
'(VAR Lfirst,Llast,Lrest:LSSTREE_pRelNode;',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);


TAB(cofpas1,10);
TFILES_writestr(cofpas1,
'VAR NoMoreTrees:BOOLEAN;',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);


TAB(cofpas1,10);
TFILES_writestr(cofpas1,
'L:LSSTREE_pRelNode);',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);


TFILES_writestr(cofpas1,
'BEGIN',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);


TFILES_writestr(cofpas1,
'IF (L=NIL) OR (Lrest=NIL) THEN nomoretrees:=TRUE',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);


TFILES_writestr(cofpas1,
'ELSE',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);


TAB(cofpas1,2);
TFILES_writestr(cofpas1,
'BEGIN',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);


TAB(cofpas1,2);
TFILES_writestr(cofpas1,
'IF Lfirst=NIL THEN',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);


TAB(cofpas1,4);
TFILES_writestr(cofpas1,
'BEGIN',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);


TAB(cofpas1,4);
TFILES_writestr(cofpas1,
'Llast:=Lrest;',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);


TAB(cofpas1,4);
TFILES_writestr(cofpas1,
'Lfirst:=Lrest',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);


TAB(cofpas1,4);
TFILES_writestr(cofpas1,
'END',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);


TAB(cofpas1,2);
TFILES_writestr(cofpas1,
'ELSE',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);


TAB(cofpas1,4);
TFILES_writestr(cofpas1,
'BEGIN',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);


TAB(cofpas1,4);
TFILES_writestr(cofpas1,
'Lfirst:=Lrest',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);


TAB(cofpas1,4);
TFILES_writestr(cofpas1,
'END;',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);


TAB(cofpas1,2);
TFILES_writestr(cofpas1,
'IF Lfirst=L THEN Lrest:=NIL',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);


TAB(cofpas1,2);
TFILES_writestr(cofpas1,
'ELSE',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);


TAB(cofpas1,4);
TFILES_writestr(cofpas1,
'BEGIN',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);


TAB(cofpas1,4);
TFILES_writestr(cofpas1,
'Lrest:=L;',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);


TAB(cofpas1,4);
TFILES_writestr(cofpas1,
'WHILE Lrest^.brother<>Lfirst DO',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);


TAB(cofpas1,6);
TFILES_writestr(cofpas1,
'BEGIN',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);


TAB(cofpas1,6);
TFILES_writestr(cofpas1,
'Lrest:=Lrest^.brother',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);


TAB(cofpas1,6);
TFILES_writestr(cofpas1,
'END',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);


TAB(cofpas1,4);
TFILES_writestr(cofpas1,
'END',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);


TAB(cofpas1,2);
TFILES_writestr(cofpas1,
'END',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);


TFILES_writestr(cofpas1,
'END;{TcelesLfirstAndLlast',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);

TFILES_writeline(cofpas1,TRUE);

 }
END
END;
BEGIN 
TFILES_writestr(decofpas1,
'EXPORT(decommrules);',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);


TFILES_writestr(decofpas1,
'pragma C_include(''globsubst.pf'');',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);


TFILES_writestr(decofpas1,
'pragma C_include(''listree.pf'');',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);


TFILES_writestr(decofpas1,
'pragma C_include(''limatches.pf'');',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);


TFILES_writestr(decofpas1,
'pragma C_include(''lsmatches.pf'');',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);


TFILES_writestr(decofpas1,
'pragma C_include(''lidomaint.pf'');',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);


TFILES_writestr(decofpas1,
'pragma C_include(''liiddict.pf'');',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);


TFILES_writestr(decofpas1,
'pragma C_include(''lsdomaint.pf'');',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);


TFILES_writestr(decofpas1,
'pragma C_include(''maket.pf'');',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);


TFILES_writestr(decofpas1,
'pragma C_include(''lsstree.pf'');',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);


TFILES_writestr(decofpas1,
'pragma C_include(''copyt.pf'');',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);


TFILES_writestr(decofpas1,
'pragma C_include(''string.pf'');',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);


TFILES_writestr(decofpas1,
'pragma C_include(''mem.pf'');',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);


IF stillidents(dtreenames) THEN BEGIN
TFILES_writestr(decofpas1,
'pragma C_include(''lsparams.pf'');',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);


TFILES_writestr(decofpas1,
'pragma C_include(''ldmrules.pf'');',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);


END;
TFILES_writestr(decofpas1,
'pragma C_include(''aidderiv.pf'');',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);


TFILES_writestr(decofpas1,
'pragma C_include(''hyperdtree.pf'');',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);


TFILES_writestr(decofpas1,
'pragma C_include(''strtokey.pf'');',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);


TFILES_writestr(decofpas1,
'pragma C_include(''lsmruquo.pf'');',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);


TFILES_writestr(decofpas1,
'pragma C_include(''lsauxdom.pf'');',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);


TFILES_writestr(decofpas1,
'pragma C_include(''ldblex.pf'');',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);


TFILES_writestr(decofpas1,
'PACKAGE decommrules;',FILES_maxIO,0,left);

 TFILES_writeline(decofpas1,TRUE);


TFILES_writestr(decofpas1,
'WITH listree,lsdomaint;',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);


TFILES_writestr(decofpas1,
'pragma C_include(''decommrules',FILES_maxIO,0,left);

 TFILES_writestring(decofpas1,
filenumber,0,left);

 TFILES_writestr(decofpas1,
'.pf'');',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);


TFILES_writestr(decofpas1,
'END;',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);


TFILES_writestr(decofpas1,
'PROGRAM decomMrules',FILES_maxIO,0,left);

 TFILES_writestring(decofpas1,
filenumber,0,left);

 TFILES_writestr(decofpas1,
';',FILES_maxIO,0,left);

 TFILES_writeline(decofpas1,TRUE);


TFILES_writestr(decofpas1,
'WITH globsubst,listree,limatches,lsmatches,',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);


TFILES_writestr(decofpas1,
'lidomaint,liiddict,lsdomaint,maket,lsstree,',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);


TFILES_writestr(decofpas1,
'copyt,mem,',FILES_maxIO,0,left);


IF stillidents(dtreenames) THEN BEGIN
TFILES_writestr(decofpas1,
'lsparams,ldmrules,',FILES_maxIO,0,left);

 END;TFILES_writeline(decofpas1,TRUE);


TFILES_writestr(decofpas1,
'aidderiv,hyperdtree,strtokey,lsmruquo,',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);


TFILES_writestr(decofpas1,
'lsauxdom,ldblex;',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);


TFILES_writestr(decofpas1,
'TYPE synrelset=SET OF LSDOMAINT_synrel;',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);


TFILES_writestr(decofpas1,
'VAR hulpstree:LISTREE_pstree;',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);


TFILES_writestr(decofpas1,
' VPID:LSDOMAINT_synpatternsettype;',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);


TFILES_writestr(decofpas1,
'hulplsstree:LSSTREE_pstree;',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);


IF stillidents(dtreenames) THEN
BEGIN
TFILES_writestr(decofpas1,
' lsps:LSPARAMS_precord;',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);


END;
dtreenames1:=dtreenames;
WHILE stillidents(dtreenames1) DO
BEGIN
takeident(id,dtreenames1);
TFILES_writestr(decofpas1,
'dtree',FILES_maxIO,0,left);

 TFILES_writestring(decofpas1,
id.str,0,left);

 TFILES_writestr(decofpas1,
':HYPERDTREE_pHYPERDTREE;',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);


END;
dtreenames1:=dtreenames;
WHILE stillidents(dtreenames1) DO
BEGIN
takeident(id,dtreenames1);
TFILES_writestring(decofpas1,
id.str,0,left);

 TFILES_writestr(decofpas1,
'd1,',FILES_maxIO,0,left);

 TFILES_writestring(decofpas1,
id.str,0,left);

 TFILES_writestr(decofpas1,
'd2,',FILES_maxIO,0,left);

 TFILES_writeline(decofpas1,TRUE);

TFILES_writestring(decofpas1,
id.str,0,left);

 TFILES_writestr(decofpas1,
'd3,',FILES_maxIO,0,left);

 TFILES_writeline(decofpas1,TRUE);


TFILES_writestring(decofpas1,
id.str,0,left);

 TFILES_writestr(decofpas1,
'd4,',FILES_maxIO,0,left);

 TFILES_writestring(decofpas1,
id.str,0,left);

 TFILES_writestr(decofpas1,
'd5,',FILES_maxIO,0,left);

 TFILES_writeline(decofpas1,TRUE);

TFILES_writestring(decofpas1,
id.str,0,left);

 TFILES_writestr(decofpas1,
'd6,',FILES_maxIO,0,left);

 TFILES_writeline(decofpas1,TRUE);


TFILES_writestring(decofpas1,
id.str,0,left);

 TFILES_writestr(decofpas1,
'd7,',FILES_maxIO,0,left);

 TFILES_writestring(decofpas1,
id.str,0,left);

 TFILES_writestr(decofpas1,
'd8,',FILES_maxIO,0,left);

 TFILES_writeline(decofpas1,TRUE);

TFILES_writestring(decofpas1,
id.str,0,left);

 TFILES_writestr(decofpas1,
'd9,',FILES_maxIO,0,left);

 
TFILES_writestring(decofpas1,
id.str,0,left);

 TFILES_writestr(decofpas1,
'd10,',FILES_maxIO,0,left);

 TFILES_writestring(decofpas1,
id.str,0,left);

 TFILES_writestr(decofpas1,
'd11,',FILES_maxIO,0,left);

 TFILES_writeline(decofpas1,TRUE);

TFILES_writestring(decofpas1,
id.str,0,left);

 TFILES_writestr(decofpas1,
'd12,',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);

 
TFILES_writestring(decofpas1,
id.str,0,left);

 TFILES_writestr(decofpas1,
'd13,',FILES_maxIO,0,left);

 TFILES_writestring(decofpas1,
id.str,0,left);

 TFILES_writestr(decofpas1,
'd14,',FILES_maxIO,0,left);

 TFILES_writeline(decofpas1,TRUE);

TFILES_writestring(decofpas1,
id.str,0,left);

 
TFILES_writestr(decofpas1,
'd15:HYPERDTREE_pHyperDtree;',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);


TFILES_writestring(decofpas1,
id.str,0,left);

 TFILES_writestr(decofpas1,
'delt1,',FILES_maxIO,0,left);

 TFILES_writestring(decofpas1,
id.str,0,left);

 TFILES_writestr(decofpas1,
'delt2,',FILES_maxIO,0,left);

 TFILES_writeline(decofpas1,TRUE);


TFILES_writestring(decofpas1,
id.str,0,left);

 TFILES_writestr(decofpas1,
'delt3,',FILES_maxIO,0,left);

 TFILES_writestring(decofpas1,
id.str,0,left);

 TFILES_writestr(decofpas1,
'delt4,',FILES_maxIO,0,left);

 TFILES_writeline(decofpas1,TRUE);


TFILES_writestring(decofpas1,
id.str,0,left);

 TFILES_writestr(decofpas1,
'delt5,',FILES_maxIO,0,left);

 TFILES_writestring(decofpas1,
id.str,0,left);

 TFILES_writestr(decofpas1,
'delt6,',FILES_maxIO,0,left);

 TFILES_writeline(decofpas1,TRUE);


TFILES_writestring(decofpas1,
id.str,0,left);

 TFILES_writestr(decofpas1,
'delt7,',FILES_maxIO,0,left);

 TFILES_writestring(decofpas1,
id.str,0,left);

 TFILES_writestr(decofpas1,
'delt8,',FILES_maxIO,0,left);

 TFILES_writeline(decofpas1,TRUE);


TFILES_writestring(decofpas1,
id.str,0,left);

 TFILES_writestr(decofpas1,
'delt9,',FILES_maxIO,0,left);

 TFILES_writestring(decofpas1,
id.str,0,left);

 TFILES_writestr(decofpas1,
'delt10,',FILES_maxIO,0,left);

 TFILES_writeline(decofpas1,TRUE);


TFILES_writestring(decofpas1,
id.str,0,left);

 TFILES_writestr(decofpas1,
'delt11,',FILES_maxIO,0,left);

 TFILES_writestring(decofpas1,
id.str,0,left);

 TFILES_writestr(decofpas1,
'delt12,',FILES_maxIO,0,left);

 TFILES_writeline(decofpas1,TRUE);


TFILES_writestring(decofpas1,
id.str,0,left);

 TFILES_writestr(decofpas1,
'delt13,',FILES_maxIO,0,left);

 TFILES_writestring(decofpas1,
id.str,0,left);

 TFILES_writestr(decofpas1,
'delt14,',FILES_maxIO,0,left);

 TFILES_writeline(decofpas1,TRUE);


TFILES_writestring(decofpas1,
id.str,0,left);

 TFILES_writestr(decofpas1,
'delt15,',FILES_maxIO,0,left);

 TFILES_writestring(decofpas1,
id.str,0,left);

 TFILES_writestr(decofpas1,
'delt16,',FILES_maxIO,0,left);

 TFILES_writeline(decofpas1,TRUE);


TFILES_writestring(decofpas1,
id.str,0,left);

 TFILES_writestr(decofpas1,
'delt17:HYPERDTREE_pHyperNodeElt;',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);


END;
IF stillidents(dtreenames) THEN
BEGIN
TFILES_writestr(decofpas1,
'X1,X2,X3,X4,X5:INTEGER;',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);


END;
BEGIN
dtreenames1:=dtreenames;
WHILE stillidents(dtreenames1) DO
BEGIN
takeident(id,dtreenames1);
TFILES_writestr(decofpas1,
'FUNCTION crdtree',FILES_maxIO,0,left);

 TFILES_writestring(decofpas1,
id.str,0,left);


TFILES_writestr(decofpas1,
':HYPERDTREE_phyperdtree;FORWARD;',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);


END;
TFILES_writestr(decofpas1,
' PROCEDURE decommrules',FILES_maxIO,0,left);

 TFILES_writestring(decofpas1,
filenumber,0,left);

 
TFILES_writestr(decofpas1,
'_init;',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);


TFILES_writestr(decofpas1,
'BEGIN',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);


dtreenames1:=dtreenames;
WHILE stillidents(dtreenames1) DO
BEGIN
takeident(id,dtreenames1);
TFILES_writestr(decofpas1,
'dtree',FILES_maxIO,0,left);

 TFILES_writestring(decofpas1,
id.str,0,left);

 
TFILES_writestr(decofpas1,
':=crdtree',FILES_maxIO,0,left);

 TFILES_writestring(decofpas1,
id.str,0,left);

 TFILES_writestr(decofpas1,
';',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);


END;
TFILES_writestr(decofpas1,
'END;',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);


{ TFILES_writestr(decofpas1,
'FUNCTION auxkey(strkey:STRING_string):INTEGER;',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);


TFILES_writestr(decofpas1,
'VAR int:INTEGER;',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);


TFILES_writestr(decofpas1,
'BEGIN',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);


TFILES_writestr(decofpas1,
' STRTOKEY_getSkey(strkey,int); auxkey:=int;',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);


TFILES_writestr(decofpas1,
'END;',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);


TFILES_writestr(decofpas1,
'PROCEDURE MatchList0Items',FILES_maxIO,0,left);

;
TFILES_writestr(decofpas1,
'(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);


TFILES_writestr(decofpas1,
'BEGIN',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);


TAB(decofpas1,2);
TFILES_writestr(decofpas1,
'IF first THEN match := (L=NIL) ELSE match:=FALSE',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);


TFILES_writestr(decofpas1,
'END;',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);


END;
BEGIN
TFILES_writestr(decofpas1,
'FUNCTION numberofelements',FILES_maxIO,0,left);


TFILES_writestr(decofpas1,
'(L:LSMRUQUO_Listofstrees):INTEGER;',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);


TFILES_writestr(decofpas1,
'VAR result:INTEGER;',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);


TFILES_writestr(decofpas1,
'BEGIN',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);


TFILES_writestr(decofpas1,
'result:=0;',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);


TFILES_writestr(decofpas1,
'WHILE L.first<>NIL DO',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);


TFILES_writestr(decofpas1,
' BEGIN',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);


TFILES_writestr(decofpas1,
' result:=result+1;',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);


TFILES_writestr(decofpas1,
' L.first:=L.first^.brother',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);


TFILES_writestr(decofpas1,
' END;',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);


TFILES_writestr(decofpas1,
'numberofelements:=result',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);


TFILES_writestr(decofpas1,
'END;',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);


TFILES_writestr(decofpas1,
'PROCEDURE copylist(L1:LSMRUQUO_Listofstrees;',FILES_maxIO,0,left);


TFILES_writestr(decofpas1,
'VAR L2:LSMRUQUO_Listofstrees);',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);


TFILES_writestr(decofpas1,
'VAR p,p1:LSSTREE_prelnode;',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);


TFILES_writestr(decofpas1,
'BEGIN',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);


TFILES_writestr(decofpas1,
'IF L1.first=NIL THEN L2:=L1',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);


TFILES_writestr(decofpas1,
'ELSE',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);


TFILES_writestr(decofpas1,
' BEGIN',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);


TFILES_writestr(decofpas1,
' LISTREE_makerelnode(loopholes.retype',FILES_maxIO,0,left);


TFILES_writestr(decofpas1,
'(p1,LISTREE_prelnode));',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);


TFILES_writestr(decofpas1,
' p:=p1;',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);


TFILES_writestr(decofpas1,
' p1^:=L1.first^;',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);


TFILES_writestr(decofpas1,
' p1^.brother:=NIL;',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);


TFILES_writestr(decofpas1,
' L2.first:=p1;',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);


TFILES_writestr(decofpas1,
' WHILE L1.first<>L1.last DO',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);


TFILES_writestr(decofpas1,
' BEGIN',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);


TFILES_writestr(decofpas1,
' L1.first:=L1.first^.brother;',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);


TFILES_writestr(decofpas1,
' LISTREE_makerelnode(loopholes.retype',FILES_maxIO,0,left);


TFILES_writestr(decofpas1,
'(p1,LISTREE_prelnode));',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);


TFILES_writestr(decofpas1,
' p^.brother:=p1;',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);


TFILES_writestr(decofpas1,
' p:=p1;',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);


TFILES_writestr(decofpas1,
' p1^:=L1.first^;',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);


TFILES_writestr(decofpas1,
' p1^.brother:=NIL;',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);


TFILES_writestr(decofpas1,
' END;',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);


TFILES_writestr(decofpas1,
' L2.last:=p',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);


TFILES_writestr(decofpas1,
' END;',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);


TFILES_writestr(decofpas1,
'END;',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);

}
END;
BEGIN
{ TFILES_writestr(decofpas1,
'PROCEDURE SelectLfirstAndLlast',FILES_maxIO,0,left);

;
TFILES_writestr(decofpas1,
'(VAR Lfirst,Llast,Lrest:LSSTREE_pRelNode;',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);


TAB(decofpas1,10);
TFILES_writestr(decofpas1,
'VAR NoMoreTrees:BOOLEAN;',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);


TAB(decofpas1,10);
TFILES_writestr(decofpas1,
'L:LSSTREE_pRelNode);',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);


TFILES_writestr(decofpas1,
'BEGIN',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);


TAB(decofpas1,2);
TFILES_writestr(decofpas1,
'IF L=NIL THEN nomoretrees:=TRUE',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);


TAB(decofpas1,2);
TFILES_writestr(decofpas1,
'ELSE',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);


TAB(decofpas1,4);
TFILES_writestr(decofpas1,
'BEGIN',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);


TAB(decofpas1,4);
TFILES_writestr(decofpas1,
'IF Lfirst=NIL THEN',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);


TAB(decofpas1,6);
TFILES_writestr(decofpas1,
'BEGIN',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);


TAB(decofpas1,6);
TFILES_writestr(decofpas1,
'Lfirst:=L;',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);


TAB(decofpas1,6);
TFILES_writestr(decofpas1,
'Llast:=Lfirst;',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);


TAB(decofpas1,6);
TFILES_writestr(decofpas1,
'Lrest:=Llast^.brother;',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);


TAB(decofpas1,6);
TFILES_writestr(decofpas1,
'END',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);


TAB(decofpas1,4);
TFILES_writestr(decofpas1,
'ELSE',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);


TAB(decofpas1,6);
TFILES_writestr(decofpas1,
'IF Lrest=NIL THEN ',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);


TAB(decofpas1,8);
TFILES_writestr(decofpas1,
'NoMoreTrees:=TRUE',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);


TAB(decofpas1,6);
TFILES_writestr(decofpas1,
'ELSE',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);


TAB(decofpas1,6);
TFILES_writestr(decofpas1,
'BEGIN',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);


TAB(decofpas1,8);
TFILES_writestr(decofpas1,
'Llast:=Llast^.brother;',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);


TAB(decofpas1,8);
TFILES_writestr(decofpas1,
'Lrest:=Llast^.brother;',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);


TAB(decofpas1,6);
TFILES_writestr(decofpas1,
'END',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);


TAB(decofpas1,4);
TFILES_writestr(decofpas1,
'END',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);


TFILES_writestr(decofpas1,
'END;{SelectLfirstAndLlast',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);

TFILES_writeline(decofpas1,TRUE);

 }
{ TFILES_writestr(decofpas1,
'PROCEDURE TcelesLfirstAndLlast',FILES_maxIO,0,left);

;
TFILES_writestr(decofpas1,
'(VAR Lfirst,Llast,Lrest:LSSTREE_pRelNode;',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);


TAB(decofpas1,10);
TFILES_writestr(decofpas1,
'VAR NoMoreTrees:BOOLEAN;',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);


TAB(decofpas1,10);
TFILES_writestr(decofpas1,
'L:LSSTREE_pRelNode);',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);


TFILES_writestr(decofpas1,
'BEGIN',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);


TFILES_writestr(decofpas1,
'IF (L=NIL) OR (Lrest=NIL) THEN nomoretrees:=TRUE',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);


TFILES_writestr(decofpas1,
'ELSE',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);


TAB(decofpas1,2);
TFILES_writestr(decofpas1,
'BEGIN',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);


TAB(decofpas1,2);
TFILES_writestr(decofpas1,
'IF Lfirst=NIL THEN',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);


TAB(decofpas1,4);
TFILES_writestr(decofpas1,
'BEGIN',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);


TAB(decofpas1,4);
TFILES_writestr(decofpas1,
'Llast:=Lrest;',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);


TAB(decofpas1,4);
TFILES_writestr(decofpas1,
'Lfirst:=Lrest',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);


TAB(decofpas1,4);
TFILES_writestr(decofpas1,
'END',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);


TAB(decofpas1,2);
TFILES_writestr(decofpas1,
'ELSE',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);


TAB(decofpas1,4);
TFILES_writestr(decofpas1,
'BEGIN',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);


TAB(decofpas1,4);
TFILES_writestr(decofpas1,
'Lfirst:=Lrest',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);


TAB(decofpas1,4);
TFILES_writestr(decofpas1,
'END;',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);


TAB(decofpas1,2);
TFILES_writestr(decofpas1,
'IF Lfirst=L THEN Lrest:=NIL',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);


TAB(decofpas1,2);
TFILES_writestr(decofpas1,
'ELSE',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);


TAB(decofpas1,4);
TFILES_writestr(decofpas1,
'BEGIN',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);


TAB(decofpas1,4);
TFILES_writestr(decofpas1,
'Lrest:=L;',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);


TAB(decofpas1,4);
TFILES_writestr(decofpas1,
'WHILE Lrest^.brother<>Lfirst DO',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);


TAB(decofpas1,6);
TFILES_writestr(decofpas1,
'BEGIN',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);


TAB(decofpas1,6);
TFILES_writestr(decofpas1,
'Lrest:=Lrest^.brother',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);


TAB(decofpas1,6);
TFILES_writestr(decofpas1,
'END',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);


TAB(decofpas1,4);
TFILES_writestr(decofpas1,
'END',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);


TAB(decofpas1,2);
TFILES_writestr(decofpas1,
'END',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);


TFILES_writestr(decofpas1,
'END;{TcelesLfirstAndLlast',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);

TFILES_writeline(decofpas1,TRUE);

 }
END
END;
BEGIN 
TFILES_writestr(cofenv1,
'{*',FILES_maxIO,0,left);

 TFILES_writestring(cofenv1,
language,0,left);

 TFILES_writestr(cofenv1,
'}',FILES_maxIO,0,left);

TFILES_writeline(cofenv1,TRUE);


TFILES_writestr(cofenv1,
' PROCEDURE commrules',FILES_maxIO,0,left);

 TFILES_writestring(cofenv1,
filenumber,0,left);

 
TFILES_writestr(cofenv1,
'_init;EXTERNAL;',FILES_maxIO,0,left);

TFILES_writeline(cofenv1,TRUE);


END;
BEGIN 
TFILES_writestr(decofenv1,
' PROCEDURE decommrules',FILES_maxIO,0,left);

 TFILES_writestring(decofenv1,
filenumber,0,left);

 
TFILES_writestr(decofenv1,
'_init;EXTERNAL;',FILES_maxIO,0,left);

TFILES_writeline(decofenv1,TRUE);


END;
END;
rsnode1:=top^.sonlist;
  while rsnode1<>nil do
  begin
  currenttree:=rsnode1^.node;
  case rsnode1^.sonnumber of

1: begin
  BEGIN MEM_markdefault(H) END
; mrucomCODE_RULESPECproc(currenttree
);
 BEGIN MEM_releasedefault(H)
END
END;

3: begin
  BEGIN MEM_markdefault(H) END
; mrucomCODE_FILTERSPECproc(currenttree
);
 BEGIN MEM_releasedefault(H)
END
END;

4: begin
  BEGIN MEM_markdefault(H) END
; mrucomCODE_SUBGRAMMARSPECproc(currenttree
);
 BEGIN MEM_releasedefault(H)
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

END;

rsnode1:=rsnode1^.brother END;
 BEGIN BEGIN  TFILES_writeline(cofenv1,TRUE);

 END;
BEGIN  TFILES_writeline(decofenv1,TRUE);

 END;
TFILES_close(cofenv1);
TFILES_close(cofpas1); 
TFILES_close(decofenv1);
TFILES_close(decofpas1);
END
END;
PROCEDURE mrucomCODE_SUBGRAMMARSPECproc(top:mrucomDECL_psnode
);
VAR currenttree:mrucomDECL_psnode;
    rsnode1:mrucomDECL_prsnode;
 str:TSTRING_string;
id: mrucomLANGSPEC_ident;
headtable,exporttable: mrucomLANGSPEC_setofidents;
BEGIN
 BEGIN  TFILES_writestr(cofenv1,
'{*',FILES_maxIO,0,left);

 TFILES_writeline(cofenv1,TRUE);

 
initsetofidents(headtable);
initsetofidents(exporttable);
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
; mrucomCODE_GRAPHproc(currenttree
,GRAPH__make
);
 BEGIN APPENDfile(GRAPH__make,cofenv1);
TFILES_writestr(cofenv1,
'BEGIN',FILES_maxIO,0,left);

TFILES_writeline(cofenv1,TRUE);


TFILES_writestring(cofenv1,
str,0,left);

 TFILES_writestr(cofenv1,
':=GRAPH',FILES_maxIO,0,left);

TFILES_writeline(cofenv1,TRUE);


TFILES_writestr(cofenv1,
'END;',FILES_maxIO,0,left);

TFILES_writeline(cofenv1,TRUE);


END
END;

3: begin
  BEGIN str:=currenttree^.ldfield.TERMINAL^.str;
TFILES_writestr(cofenv1,
'SUBGRAMMAR',FILES_maxIO,0,left);

TFILES_writeline(cofenv1,TRUE);


TFILES_writestring(cofenv1,
str,0,left);

TFILES_writeline(cofenv1,TRUE);


TFILES_writestr(cofenv1,
'FUNCTION ',FILES_maxIO,0,left);

 TFILES_writestring(cofenv1,
str,0,left);

 TFILES_writestr(cofenv1,
':LDMRULES_pCtrlExpr;',FILES_maxIO,0,left);

TFILES_writeline(cofenv1,TRUE);


END
;
 BEGIN END
END;

4: begin
  BEGIN id.str:=currenttree^.ldfield.CATNAMEfield^.str;appendident(id,headtable) END
;
 BEGIN END
END;

5: begin
  BEGIN END
;
 BEGIN END
END;

6: begin
  BEGIN END
;
 BEGIN END
END;

7: begin
  BEGIN END
;
 BEGIN END
END;

8: begin
  BEGIN END
;
 BEGIN END
END;

9: begin
  BEGIN id.str:=currenttree^.ldfield.CATNAMEfield^.str;appendident(id,exporttable) END
;
 BEGIN END
END;

10:begin
  BEGIN END
;
 BEGIN END
END;

11:begin
  BEGIN END
;
 BEGIN END
END;

12:begin
  BEGIN END
;
 BEGIN END
END;

END;

rsnode1:=rsnode1^.brother END;
BEGIN 
TFILES_writestr(cofenv1,
'*',FILES_maxIO,0,left);

TFILES_writeline(cofenv1,TRUE);


WHILE stillidents(headtable) DO
BEGIN
takeident(id,headtable);
TFILES_writestring(cofenv1,
id.str,0,left);

TFILES_writeline(cofenv1,TRUE);


END;
TFILES_writestr(cofenv1,
'*',FILES_maxIO,0,left);

TFILES_writeline(cofenv1,TRUE);


WHILE stillidents(exporttable) DO
BEGIN
takeident(id,exporttable);
TFILES_writestring(cofenv1,
id.str,0,left);

TFILES_writeline(cofenv1,TRUE);


END;
TFILES_writestr(cofenv1,
'*',FILES_maxIO,0,left);

TFILES_writeline(cofenv1,TRUE);


TFILES_writestr(cofenv1,
'}',FILES_maxIO,0,left);

 TFILES_writeline(cofenv1,TRUE);

 
END
END;
PROCEDURE mrucomCODE_GRAPHproc(top:mrucomDECL_psnode
;var GRAPH_make              :LOCALFILE
);
VAR currenttree:mrucomDECL_psnode;
    rsnode1:mrucomDECL_prsnode;
 make:LOCALFILE;
i,number: mrucomLANGSPEC_int;
BEGIN
 BEGIN initlocalfile(make);number:=0;

appendstring('FUNCTION GRAPH:LDMRULES_pCtrlExpr;',make);
appendstring('\\',make);

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
  BEGIN number:=number+1; CONCGRAPH__number:=number END
; mrucomCODE_CONCGRAPHproc(currenttree
,CONCGRAPH__number
,CONCGRAPH__make
);
 BEGIN 
APPENDlocfile(CONCGRAPH__make,make);
END
END;

END;

rsnode1:=rsnode1^.brother END;
BEGIN
appendstring('VAR result:LDMRULES_pCtrlExpr;',make);
appendstring('\\',make);

appendstring('BEGIN',make);
appendstring('\\',make);

appendstring('LDMRULES_makectrlexpr(result);',make);
appendstring('\\',make);

appendstring('result^.kind:=alternative;',make);
appendstring('\\',make);

appendstring('InitCtrlExprLst(result);',make);
appendstring('\\',make);

i:=0;
WHILE i<>number DO
BEGIN
i:=i+1;
appendstring('AppendCtrlExpr(CONCGRAPH',make);
 appendstring(mrucomDECL_convinttostring(i),make);
 appendstring(',result);',make);
appendstring('\\',make);

END;
appendstring('GRAPH:=result;',make);
appendstring('\\',make);

appendstring('END;',make);
appendstring('\\',make);

GRAPH_make:=make 
END
END;
PROCEDURE mrucomCODE_CONCGRAPHproc(top:mrucomDECL_psnode
;CONCGRAPH_number              :mrucomlangspec_int
;var CONCGRAPH_make              :LOCALFILE
);
VAR currenttree:mrucomDECL_psnode;
    rsnode1:mrucomDECL_prsnode;
 make:LOCALFILE;
i,number,number1: mrucomLANGSPEC_int;
BEGIN
 BEGIN INITlocalfile(make);number1:=CONCGRAPH_number;number:=0;

appendstring('FUNCTION CONCGRAPH',make);
 appendstring(mrucomDECL_convinttostring(number1),make);
 appendstring(':LDMRULES_pCtrlExpr;',make);
appendstring('\\',make);

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
  BEGIN number:=number+1; ELEMENTARYGRAPH__number:=number END
; mrucomCODE_ELEMENTARYGRAPHproc(currenttree
,ELEMENTARYGRAPH__number
,ELEMENTARYGRAPH__make
);
 BEGIN
APPENDlocfile(ELEMENTARYGRAPH__make,make);
END
END;

END;

rsnode1:=rsnode1^.brother END;
BEGIN
appendstring('VAR result:LDMRULES_pCtrlExpr;',make);
appendstring('\\',make);

appendstring('BEGIN',make);
appendstring('\\',make);

appendstring('LDMRULES_makectrlexpr(result);',make);
appendstring('\\',make);

appendstring('result^.kind:=concatenation;',make);
appendstring('\\',make);

appendstring('InitCtrlExprLst(result);',make);
appendstring('\\',make);

i:=0;
WHILE i<>number DO
BEGIN
i:=i+1;
appendstring('AppendCtrlExpr(ELEMGRAPH',make);
 appendstring(mrucomDECL_convinttostring(i),make);
 appendstring(',result);',make);
appendstring('\\',make);

END;
appendstring('CONCGRAPH',make);
 appendstring(mrucomDECL_convinttostring(number1),make);
 appendstring(':=result;',make);
appendstring('\\',make);

appendstring('END;',make);
appendstring('\\',make);

CONCGRAPH_make:=make 
END
END;
PROCEDURE mrucomCODE_ELEMENTARYGRAPHproc(top:mrucomDECL_psnode
;ELEMENTARYGRAPH_number              :mrucomlangspec_int
;var ELEMENTARYGRAPH_make              :LOCALFILE
);
VAR currenttree:mrucomDECL_psnode;
    rsnode1:mrucomDECL_prsnode;
 make:LOCALFILE;
number: mrucomLANGSPEC_int;
str:TSTRING_string;
BEGIN
 BEGIN initlocalfile(make);number:=ELEMENTARYGRAPH_number;

appendstring('FUNCTION ELEMGRAPH',make);
 appendstring(mrucomDECL_convinttostring(number),make);
 appendstring(':LDMRULES_pCtrlExpr;',make);
appendstring('\\',make);

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
; mrucomCODE_GRAPHproc(currenttree
,GRAPH__make
);
 BEGIN APPENDlocfile(GRAPH__make,make);
appendstring('BEGIN',make);
appendstring('\\',make);

appendstring('ELEMGRAPH',make);
 appendstring(mrucomDECL_convinttostring(number),make);
 appendstring(':=GRAPH',make);
appendstring('\\',make);

appendstring('END;',make);
appendstring('\\',make);

END
END;

3: begin
  BEGIN 
END
; mrucomCODE_GRAPHproc(currenttree
,GRAPH__make
);
 BEGIN 
APPENDlocfile(GRAPH__make,make);
appendstring('VAR result:LDMRULES_pCtrlExpr;',make);
appendstring('\\',make);

appendstring('BEGIN',make);
appendstring('\\',make);

appendstring('LDMRULES_makectrlexpr(result);',make);
appendstring('\\',make);

appendstring('result^.kind:=option;',make);
appendstring('\\',make);

appendstring('result^.ce:=GRAPH;',make);
appendstring('\\',make);

appendstring('ELEMGRAPH',make);
 appendstring(mrucomDECL_convinttostring(number),make);
 appendstring(':=result;',make);
appendstring('\\',make);

appendstring('END;',make);
appendstring('\\',make);

END
END;

4: begin
  BEGIN 
END
; mrucomCODE_GRAPHproc(currenttree
,GRAPH__make
);
 BEGIN 
APPENDlocfile(GRAPH__make,make);appendstring('\\',make);

appendstring('VAR result:LDMRULES_pCtrlExpr;',make);
appendstring('\\',make);

appendstring('BEGIN',make);
appendstring('\\',make);

appendstring('LDMRULES_makectrlexpr(result);',make);
appendstring('\\',make);

appendstring('result^.kind:=iteration;',make);
appendstring('\\',make);

appendstring('result^.ce:=GRAPH;',make);
appendstring('\\',make);

appendstring('ELEMGRAPH',make);
 appendstring(mrucomDECL_convinttostring(number),make);
 appendstring(':=result;',make);
appendstring('\\',make);

appendstring('END;',make);
appendstring('\\',make);

END
END;

5: begin
  BEGIN 
str:=currenttree^.ldfield.TERMINAL^.str;
appendstring('VAR result:LDMRULES_pCtrlExpr;',make);
appendstring('\\',make);

appendstring('BEGIN',make);
appendstring('\\',make);

appendstring('LDMRULES_makectrlexpr(result);',make);
appendstring('\\',make);

appendstring('NAME: ',make);
 appendstring(str,make);
appendstring('\\',make);

appendstring('ELEMGRAPH',make);
 appendstring(mrucomDECL_convinttostring(number),make);
 appendstring(':=result;',make);
appendstring('\\',make);

appendstring('END;',make);
appendstring('\\',make);

END
;
 BEGIN END
END;

6: begin
  BEGIN END
;
 BEGIN END
END;

END;

rsnode1:=rsnode1^.brother END;
BEGIN ELEMENTARYGRAPH_make:=make END
END;
PROCEDURE mrucomCODE_NUMBERproc(top:mrucomDECL_psnode
);
VAR currenttree:mrucomDECL_psnode;
    rsnode1:mrucomDECL_prsnode;

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
PROCEDURE mrucomCODE_RULESPECproc(top:mrucomDECL_psnode
);
VAR currenttree:mrucomDECL_psnode;
    rsnode1:mrucomDECL_prsnode;
 rulenaam,CatName:TSTRING_string;
numberofleftmodels: mrucomLANGSPEC_int;
compresent1,decompresent1: mrucomLANGSPEC_present;
compresents1,decompresents1: mrucomLANGSPEC_setofpresents;
substituent,i: mrucomLANGSPEC_int;
levelpar: mrucomLANGSPEC_bool;
param: mrucomLANGSPEC_param;
leftlevelids,rightlevelids: mrucomLANGSPEC_setofidents;
paramtable,paramtable1: mrucomLANGSPEC_setofparams;
leftsyncattable,rightsyncattable: mrucomLANGSPEC_setofsyncats;
j:INTEGER;
labelname: mrucomLANGSPEC_ident;
mrule,primitiverule,writewhile:BOOLEAN;
insidewhile: ARRAY[0..10] OF BOOLEAN;
righttolefttable,alltable,alltable1: mrucomLANGSPEC_setofidents;
comactions,decomactions:LOCALFILE;
dtreeproc,dtreeproc1,comsubrulespar,decomsubrulespar,leftcompar,rightcompar,commatchfilepar,
leftdecompar,rightdecompar,comconditions,decomconditions,decommatchfilepar:LOCALFILE;
id,id1: mrucomLANGSPEC_ident;
numberofwhiles: mrucomLANGSPEC_int;
LeftRecords,MergeRecords,RightRecords,
leftSigmaVarList,leftMuVarList,leftNodeVarList,leftTreeVarList,leftRelVarList,
commonSigmaVarList,commonMuVarList,commonNodeVarList,commonTreeVarList,commonRelVarList,
rightSigmaVarList,rightMuVarList,rightNodeVarList,rightTreeVarList,rightRelVarList,
otherSigmaVarList,otherMuVarList,otherNodeVarList,otherTreeVarList,otherRelVarList,
OtherRecords,commonrecords: mrucomLANGSPEC_SetOfIdents;
lefttreevarlist1,leftmuvarlist1,leftsigmavarlist1,
righttreevarlist1,rightmuvarlist1,rightsigmavarlist1: mrucomLANGSPEC_setofidents;
modellabels,modellabels1,identtable: mrucomLANGSPEC_setofidents;
numofsubrules: mrucomLANGSPEC_int;
compresent,decompresent: mrucomLANGSPEC_bool;
leftcats: mrucomLANGSPEC_setofidents;
rightcat: mrucomLANGSPEC_ident;
vartypes: mrucomLANGSPEC_setofvartypes;
 PROCEDURE SelectCatName(recordname:TSTRING_string;
VAR catname:TSTRING_string);
VAR length:integer;
BEGIN
length:=TSTRING_Length(recordname);
IF recordname[length]='_' THEN length:=length-1;
IF recordname[length] IN ['0','1','2','3','4','5','6','7','8','9'] THEN
TSTRING_ExtractBegin(catname,recordname,length-4)
ELSE
TSTRING_ExtractBegin(catname,recordname,length-6);
END;
FUNCTION Idpresent(id: mrucomLANGSPEC_ident;table: mrucomLANGSPEC_setofidents):BOOLEAN;
VAR result:BOOLEAN;
ident: mrucomLANGSPEC_ident;
BEGIN
result:=FALSE;
While stillidents(table) and NOT(result) do
begin
takeident(ident,table);
result:= (ident.str=id.str)
end;
Idpresent:=result
END;
FUNCTION present(ident: mrucomLANGSPEC_ident;S1: mrucomLANGSPEC_setofidents):BOOLEAN;
VAR ident1: mrucomLANGSPEC_ident;
result:boolean;
begin
result:=false;
while stillidents(S1) and not(result) do
begin
takeident(ident1,S1);
result := (ident1.str=ident.str)
end;
present:=result
end;
PROCEDURE APPENDSETS(S1: mrucomLANGSPEC_SETOFidents;VAR S2: mrucomLANGSPEC_SETOFidents);
VAR ident1: mrucomLANGSPEC_ident;
BEGIN
WHILE STILLidents(S1) DO
BEGIN
TAKEident(ident1,S1);
APPENDident(ident1,S2)
END
END;
PROCEDURE REVERSESET(S1: mrucomLANGSPEC_SETOFidents;VAR S2: mrucomLANGSPEC_SETOFidents);
VAR ident1: mrucomLANGSPEC_ident;
BEGIN
IF stillidents(S1) THEN 
BEGIN
TAKEident(ident1,S1);
REVERSESET(S1,S2);
APPENDident(ident1,S2)
END
ELSE S2:=S1
END;
FUNCTION EXTRACT(str:TSTRING_string; VAR int:INTEGER):BOOLEAN;
VAR ch:CHAR;
result:BOOLEAN;
BEGIN
int:=0;
IF TSTRING_length(str)>1 THEN 
BEGIN
TSTRING_extractchar(ch,str,1);
result:= (ch='M') or (ch='m');
TSTRING_extractchar(ch,str,2);
if result then result:=(ch IN ['1','2','3','4','5','6','7','8','9']);
IF result THEN int:=ORD(ch)-48;
END
ELSE
BEGIN
TSTRING_extractchar(ch,str,1);
result:= (ch='M') or (ch='m')
END;
extract:=result
END;
FUNCTION DOORSNEDE(S1: mrucomLANGSPEC_SETOFidents;S2: mrucomLANGSPEC_SETOFidents): mrucomLANGSPEC_setofidents;
VAR ident1: mrucomLANGSPEC_ident;
result: mrucomLANGSPEC_setofidents;
BEGIN
initsetofidents(result);
WHILE STILLidents(S1) DO
BEGIN
TAKEident(ident1,S1);
IF present(ident1,S2) THEN APPENDident(ident1,result)
END;
doorsnede:=result
{result contains those elements of S1 that also belong to S2}
END;
FUNCTION SUBTRACTSETS(S1: mrucomLANGSPEC_SETOFidents;S2: mrucomLANGSPEC_SETOFidents): mrucomLANGSPEC_setofidents;
VAR ident1: mrucomLANGSPEC_ident;
result: mrucomLANGSPEC_setofidents;
BEGIN
initsetofidents(result);
WHILE STILLidents(S1) DO
BEGIN
TAKEident(ident1,S1);
IF not(present(ident1,S2)) THEN APPENDident(ident1,result)
END;
subtractsets:=result
{result contains those elements of S1 that do not belong to S2}
END;
BEGIN
 BEGIN numberofleftmodels:=0;TSTRING_constantempty(rulenaam);
TSTRING_constantempty(CatName);
leftsyncattable:=top^.ldfield.RULESPECfield^.leftsyncattable;
rightsyncattable:=top^.ldfield.RULESPECfield^.rightsyncattable;
paramtable:=top^.ldfield.RULESPECfield^.paramtable;
compresent:=top^.ldfield.RULESPECfield^.compresent;
decompresent:=top^.ldfield.RULESPECfield^.decompresent;
INITLOCALFILE(dtreeproc);
INITLOCALFILE(comsubrulespar);
INITLOCALFILE(decomsubrulespar);
INITLOCALFILE(leftcompar);INITLOCALFILE(leftdecompar);
INITLOCALFILE(rightcompar);INITLOCALFILE(rightdecompar);
INITLOCALFILE(commatchfilepar);INITLOCALFILE(comconditions);
INITLOCALFILE(comactions);INITLOCALFILE(decomactions);
INITLOCALFILE(decomconditions);INITLOCALFILE(decommatchfilepar);
INITSETOFidents(Leftrecords);
INITSETOFidents(MergeRecords);
INITSETOFidents(RightRecords);
INITSETOFidents(OtherRecords);
primitiverule:=FALSE;mrule:=TRUE;
righttolefttable:=top^.ldfield.RULESPECfield^.righttolefttable;
LeftRecords:=top^.ldfield.RULESPECfield^.LeftRecords;
RightRecords:=top^.ldfield.RULESPECfield^.RightRecords;
OtherRecords:=top^.ldfield.RULESPECfield^.OtherRecords;
leftMuVarList:=top^.ldfield.RULESPECfield^.leftMuVarList;
leftSigmaVarList:=top^.ldfield.RULESPECfield^.leftSigmaVarList;
leftTreeVarList:=top^.ldfield.RULESPECfield^.leftTreeVarList;
leftNodeVarList:=top^.ldfield.RULESPECfield^.leftNodeVarList;
leftRelVarList:=top^.ldfield.RULESPECfield^.leftRelVarList;
rightMuVarList:=top^.ldfield.RULESPECfield^.rightMuVarList;
rightSigmaVarList:=top^.ldfield.RULESPECfield^.rightSigmaVarList;
rightTreeVarList:=top^.ldfield.RULESPECfield^.rightTreeVarList;
rightNodeVarList:=top^.ldfield.RULESPECfield^.rightNodeVarList;
rightRelVarList:=top^.ldfield.RULESPECfield^.rightRelVarList;
otherMuVarList:=top^.ldfield.RULESPECfield^.otherMuVarList;
otherSigmaVarList:=top^.ldfield.RULESPECfield^.otherSigmaVarList;
otherTreeVarList:=top^.ldfield.RULESPECfield^.otherTreeVarList;
otherNodeVarList:=top^.ldfield.RULESPECfield^.otherNodeVarList;
otherRelVarList:=top^.ldfield.RULESPECfield^.otherRelVarList;
modellabels:=top^.ldfield.RULESPECfield^.modellabels;
numofsubrules:=0;
levelpar:=FALSE;
initsetofidents(alltable);
initsetofvartypes(vartypes);
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
;
 BEGIN rulenaam:=currenttree^.ldfield.TERMINAL^.str;
END
END;

3: begin
  BEGIN 
substituent:=currenttree^.ldfield.LEFTMODELSfield^.substituent;
LEFTMODELS__righttolefttable:=righttolefttable;
leftcats:=currenttree^.ldfield.LEFTMODELSfield^.leftcats;
lefttreevarlist1:=currenttree^.ldfield.LEFTMODELSfield^.treevarlist;
leftmuvarlist1:=currenttree^.ldfield.LEFTMODELSfield^.muvarlist;
leftsigmavarlist1:=currenttree^.ldfield.LEFTMODELSfield^.sigmavarlist;
LEFTMODELS__name:=rulenaam;
END 
; mrucomCODE_LEFTMODELSproc(currenttree
,LEFTMODELS__name
,LEFTMODELS__righttolefttable
,LEFTMODELS__leftcom
,LEFTMODELS__leftdecom
,LEFTMODELS__dtreeproc
,LEFTMODELS__levelids
);
 BEGIN {leftcom contains match and leftdecom create functions}
APPENDlocfile(LEFTMODELS__leftcom,leftcompar);
APPENDlocfile(LEFTMODELS__leftdecom,leftdecompar);
numberofleftmodels:=currenttree^.ldfield.LEFTMODELSfield^.numberofmodels;
leftlevelids:=LEFTMODELS__levelids;
appendlocfile(LEFTMODELS__dtreeproc,dtreeproc);
END
END;

4: begin
  BEGIN RIGHTMODEL__righttolefttable:=righttolefttable;
RIGHTMODEL__name:=rulenaam;
rightcat:=currenttree^.ldfield.RIGHTMODELfield^.rightcat;
righttreevarlist1:=currenttree^.ldfield.RIGHTMODELfield^.treevarlist;
rightmuvarlist1:=currenttree^.ldfield.RIGHTMODELfield^.muvarlist;
rightsigmavarlist1:=currenttree^.ldfield.RIGHTMODELfield^.sigmavarlist;
END
; mrucomCODE_RIGHTMODELproc(currenttree
,RIGHTMODEL__name
,RIGHTMODEL__righttolefttable
,RIGHTMODEL__rightcom
,RIGHTMODEL__rightdecom
,RIGHTMODEL__dtreeproc
,RIGHTMODEL__levelids
,RIGHTMODEL__dtreelevelids
);
 BEGIN {rightcom contains create and rightdecom match functions}
appendlocfile(RIGHTMODEL__dtreeproc,dtreeproc);
APPENDlocfile(RIGHTMODEL__rightcom,rightcompar);
APPENDlocfile(RIGHTMODEL__rightdecom,rightdecompar);
rightlevelids:=RIGHTMODEL__levelids;
appendsets(RIGHTMODEL__dtreelevelids,rightlevelids);
appendsets(RIGHTMODEL__dtreelevelids,leftlevelids);
END
END;

5: begin
  BEGIN 
vartypes:=currenttree^.ldfield.MATCHCONDSfield^.vartypes;
MATCHCONDS__leftMuVarList:=leftMuVarList;
MATCHCONDS__leftSigmaVarList:=leftSigmaVarList;
MATCHCONDS__leftTreeVarList:=leftTreeVarList;
MATCHCONDS__leftNodeVarList:=leftNodeVarList;
MATCHCONDS__leftRelVarList:=leftRelVarList;
MATCHCONDS__rightMuVarList:=rightMuVarList;
MATCHCONDS__rightSigmaVarList:=rightSigmaVarList;
MATCHCONDS__rightTreeVarList:=rightTreeVarList;
MATCHCONDS__rightNodeVarList:=rightNodeVarList;
MATCHCONDS__rightRelVarList:=rightRelVarList;
MATCHCONDS__indent:=0;
alltable:=currenttree^.ldfield.MATCHCONDSfield^.alltable;
END
; mrucomCODE_MATCHCONDSproc(currenttree
,MATCHCONDS__leftMuVarList
,MATCHCONDS__leftSigmaVarList
,MATCHCONDS__leftRelVarList
,MATCHCONDS__leftTreeVarList
,MATCHCONDS__leftNodeVarList
,MATCHCONDS__rightMuVarList
,MATCHCONDS__rightSigmaVarList
,MATCHCONDS__rightRelVarList
,MATCHCONDS__rightTreeVarList
,MATCHCONDS__rightNodeVarList
,MATCHCONDS__indent
,MATCHCONDS__commatchfile
,MATCHCONDS__decommatchfile
);
 BEGIN {matchfile contains functions for matching}
APPENDlocfile(MATCHCONDS__commatchfile,commatchfilepar);
APPENDlocfile(MATCHCONDS__decommatchfile,decommatchfilepar);
END
END;

6: begin
  BEGIN END
; mrucomCODE_PARAMETERSspecproc(currenttree
);
 BEGIN levelpar:= currenttree^.ldfield.PARAMETERSspecfield^.level;
IF levelpar THEN IF substituent=-1 THEN
writeln('WARNING, SUBSTituent not marked in rule ',rulenaam);
END
END;

7: begin
  BEGIN numofsubrules:= currenttree^.ldfield.SUBRULESfield^.numofsubrules;
compresents1:=currenttree^.ldfield.SUBRULESfield^.compresents;
decompresents1:=currenttree^.ldfield.SUBRULESfield^.decompresents;
SUBRULES__indent:=0;
SUBRULES__name:=rulenaam;
SUBRULES__vartypes:=vartypes;
TSTRING_constantempty(id.str);
TSTRING_appendchar(id.str,id.str,'M');
INITsetofidents(SUBRULES__prevrightrhslabels);
APPENDident(id,SUBRULES__prevrightrhslabels);
i:=0;
INITsetofidents(SUBRULES__prevleftrhslabels);
WHILE i<>numberofleftmodels DO
BEGIN
i:=i+1;
TSTRING_appendchar(id1.str,id.str,chr(i+48));
APPENDident(id1,SUBRULES__prevleftrhslabels);
END;
commonrecords:=DOORSNEDE(rightrecords,leftrecords);
commonMuVarList:=DOORSNEDE(rightMuVarList,leftMuVarList);
commonSigmaVarList:=DOORSNEDE(rightSigmaVarList,leftSigmaVarList);
commonTreeVarList:=DOORSNEDE(rightTreeVarList,leftTreeVarList);
commonNodeVarList:=DOORSNEDE(rightNodeVarList,leftNodeVarList);
commonRelVarList:=DOORSNEDE(rightRelVarList,leftRelVarList);
identtable:=SUBTRACTSETS(leftrecords,commonrecords);
SUBRULES__leftrecordtable:=identtable;
SUBRULES__leftsyncattable:=leftsyncattable;
SUBRULES__rightsyncattable:=rightsyncattable;
identtable:=SUBTRACTSETS(rightrecords,commonrecords);
SUBRULES__rightrecordtable:=identtable;
SUBRULES__leftmuvarlist:=leftmuvarlist1;
SUBRULES__rightmuvarlist:=rightmuvarlist1;
SUBRULES__leftsigmavarlist:=leftsigmavarlist1;
SUBRULES__rightsigmavarlist:=rightsigmavarlist1;
SUBRULES__lefttreevarlist:=lefttreevarlist1;
SUBRULES__righttreevarlist:=righttreevarlist1;
SUBRULES__modelnumber:=numberofleftmodels;
END
; mrucomCODE_SUBRULESproc(currenttree
,SUBRULES__indent
,SUBRULES__name
,SUBRULES__leftsyncattable
,SUBRULES__rightsyncattable
,SUBRULES__leftrecordtable
,SUBRULES__rightrecordtable
,SUBRULES__prevleftrhslabels
,SUBRULES__prevrightrhslabels
,SUBRULES__leftmuvarlist
,SUBRULES__leftsigmavarlist
,SUBRULES__lefttreevarlist
,SUBRULES__rightmuvarlist
,SUBRULES__rightsigmavarlist
,SUBRULES__righttreevarlist
,SUBRULES__modelnumber
,SUBRULES__vartypes
,SUBRULES__comsubrules
,SUBRULES__decomsubrules
,SUBRULES__dtreeproc
);
 BEGIN APPENDlocfile(SUBRULES__comsubrules,comsubrulespar);
APPENDlocfile(SUBRULES__decomsubrules,decomsubrulespar);
APPENDlocfile(SUBRULES__dtreeproc,dtreeproc);
{com and decomsubrulespar contain accumulated subrules}
END
END;

8: begin
  BEGIN COMCAPAIRS__indent:=0;
INITSETOFidents(COMCAPAIRS__rhslabels);
COMCAPAIRS__insubrule:=FALSE;
primitiverule:=TRUE;
COMCAPAIRS__vartypes:=vartypes;
commonrecords:=DOORSNEDE(rightrecords,leftrecords);
commonMuVarList:=DOORSNEDE(rightMuVarList,leftMuVarList);
commonSigmaVarList:=DOORSNEDE(rightSigmaVarList,leftSigmaVarList);
commonTreeVarList:=DOORSNEDE(rightTreeVarList,leftTreeVarList);
commonNodeVarList:=DOORSNEDE(rightNodeVarList,leftNodeVarList);
commonRelVarList:=DOORSNEDE(rightRelVarList,leftRelVarList);
identtable:=SUBTRACTSETS(rightrecords,commonrecords);
COMCAPAIRS__recordtable:=identtable;
COMCAPAIRS__syncattable:=rightsyncattable;
END
; mrucomCODE_COMCAPAIRSproc(currenttree
,COMCAPAIRS__actionteller
,COMCAPAIRS__actiontellers
,COMCAPAIRS__indent
,COMCAPAIRS__syncattable
,COMCAPAIRS__recordtable
,COMCAPAIRS__modelnumber
,COMCAPAIRS__level
,COMCAPAIRS__insubrule
,COMCAPAIRS__filter
,COMCAPAIRS__vartypes
,COMCAPAIRS__rhslabels
,COMCAPAIRS__conditions
,COMCAPAIRS__actions
,COMCAPAIRS__allexist
,COMCAPAIRS__allexistcounter
);
 BEGIN {file comCA is written}
APPENDlocfile(COMCAPAIRS__actions,comactions);
APPENDlocfile(COMCAPAIRS__conditions,comconditions);
END
END;

9: begin
  BEGIN primitiverule:=TRUE;
DECOMCAPAIRS__indent:=0;
DECOMCAPAIRS__modelnumber:=numberofleftmodels;
INITSETOFidents(DECOMCAPAIRS__rhslabels);
DECOMCAPAIRS__insubrule:=FALSE;
DECOMCAPAIRS__vartypes:=vartypes;
IF not compresent THEN
BEGIN
commonrecords:=DOORSNEDE(rightrecords,leftrecords);
commonMuVarList:=DOORSNEDE(rightMuVarList,leftMuVarList);
commonSigmaVarList:=DOORSNEDE(rightSigmaVarList,leftSigmaVarList);
commonTreeVarList:=DOORSNEDE(rightTreeVarList,leftTreeVarList);
commonNodeVarList:=DOORSNEDE(rightNodeVarList,leftNodeVarList);
commonRelVarList:=DOORSNEDE(rightRelVarList,leftRelVarList);
END;
identtable:=SUBTRACTSETS(leftrecords,commonrecords);
DECOMCAPAIRS__recordtable:=identtable;
DECOMCAPAIRS__syncattable:=leftsyncattable;
END
; mrucomCODE_DECOMCAPAIRSproc(currenttree
,DECOMCAPAIRS__actionteller
,DECOMCAPAIRS__actiontellers
,DECOMCAPAIRS__indent
,DECOMCAPAIRS__syncattable
,DECOMCAPAIRS__recordtable
,DECOMCAPAIRS__modelnumber
,DECOMCAPAIRS__level
,DECOMCAPAIRS__insubrule
,DECOMCAPAIRS__filter
,DECOMCAPAIRS__vartypes
,DECOMCAPAIRS__rhslabels
,DECOMCAPAIRS__conditions
,DECOMCAPAIRS__actions
,DECOMCAPAIRS__allexist
,DECOMCAPAIRS__allexistcounter
);
 BEGIN {file decomCA is written}
APPENDlocfile(DECOMCAPAIRS__conditions,decomconditions);
APPENDlocfile(DECOMCAPAIRS__actions,decomactions);
END
END;

10:begin
  BEGIN mrule:=FALSE;
END
;
 BEGIN 
END
END;

END;

rsnode1:=rsnode1^.brother END;
BEGIN 
MergeRecords:=Leftrecords;
APPENDSETS(OtherRecords,MergeRecords);
REVERSESET(MergeRecords,MergeRecords);
BEGIN  TFILES_writestr(cofenv1,
'{rule:}',FILES_maxIO,0,left);

 TFILES_writeline(cofenv1,TRUE);

 
TFILES_writestr(cofenv1,
'{:',FILES_maxIO,0,left);

 TFILES_writestring(cofenv1,
rulenaam,0,left);

 TFILES_writestr(cofenv1,
'}',FILES_maxIO,0,left);

 TFILES_writeline(cofenv1,TRUE);

 END;
BEGIN  TFILES_writestr(decofenv1,
'{rule:}',FILES_maxIO,0,left);

 TFILES_writeline(decofenv1,TRUE);

 
TFILES_writestr(decofenv1,
'{:',FILES_maxIO,0,left);

 TFILES_writestring(decofenv1,
rulenaam,0,left);

 TFILES_writestr(decofenv1,
'}',FILES_maxIO,0,left);

 TFILES_writeline(decofenv1,TRUE);

 END;
BEGIN  TFILES_writestr(cofpas1,
'{rule:}',FILES_maxIO,0,left);

 TFILES_writeline(cofpas1,TRUE);

 
TFILES_writestr(cofpas1,
'{:',FILES_maxIO,0,left);

 TFILES_writestring(cofpas1,
rulenaam,0,left);

 TFILES_writestr(cofpas1,
'}',FILES_maxIO,0,left);

 TFILES_writeline(cofpas1,TRUE);

 END;
BEGIN  TFILES_writestr(decofpas1,
'{rule:}',FILES_maxIO,0,left);

 TFILES_writeline(decofpas1,TRUE);

 
TFILES_writestr(decofpas1,
'{:',FILES_maxIO,0,left);

 TFILES_writestring(decofpas1,
rulenaam,0,left);

 TFILES_writestr(decofpas1,
'}',FILES_maxIO,0,left);

 TFILES_writeline(decofpas1,TRUE);

 END;
i:=0;
BEGIN  
TFILES_writestr(cofenv1,
' FUNCTION COM',FILES_maxIO,0,left);

 TFILES_writestring(cofenv1,
rulenaam,0,left);

 TFILES_writestr(cofenv1,
'(',FILES_maxIO,0,left);

 END;
paramtable1:=paramtable;
WHILE stillparams(paramtable1) DO
BEGIN
takeparam(param,paramtable1);
TFILES_writestring(cofenv1,
param.parname,0,left);

 
IF TSTRING_comparechars(param.typename,'INTEGER',7)<>0
THEN BEGIN TFILES_writestr(cofenv1,
':LSDOMAINT_',FILES_maxIO,0,left);

 END ELSE BEGIN TFILES_writestr(cofenv1,
':',FILES_maxIO,0,left);

 END;
TFILES_writestring(cofenv1,
param.typename,0,left);


TFILES_writestr(cofenv1,
';',FILES_maxIO,0,left);

TFILES_writeline(cofenv1,TRUE);


END;
while i<>numberofleftmodels do
begin
i:=i+1;
BEGIN  TFILES_writestr(cofenv1,
'Is',FILES_maxIO,0,left);

 TFILES_writeinteger(cofenv1,
i,0,left);

 TFILES_writestr(cofenv1,
':LISTREE_pStree',FILES_maxIO,0,left);

 END;
if i<>numberofleftmodels then BEGIN  TFILES_writestr(cofenv1,
';',FILES_maxIO,0,left);

 END
end;
BEGIN  TFILES_writeline(cofenv1,TRUE);

 TFILES_writestr(cofenv1,
'):LISTREE_SetOfStrees;',FILES_maxIO,0,left);

TFILES_writeline(cofenv1,TRUE);


TFILES_writestr(cofenv1,
'EXTERNAL;',FILES_maxIO,0,left);

 TFILES_writeline(cofenv1,TRUE);

 
TFILES_writestr(cofenv1,
'{*',FILES_maxIO,0,left);

TFILES_writeline(cofenv1,TRUE);


IF mrule THEN BEGIN TFILES_writestr(cofenv1,
'RULE',FILES_maxIO,0,left);

TFILES_writeline(cofenv1,TRUE);

 END ELSE 
BEGIN TFILES_writestr(cofenv1,
'TRANSFORMATION',FILES_maxIO,0,left);

 TFILES_writeline(cofenv1,TRUE);

 END;
TFILES_writestring(cofenv1,
rulenaam,0,left);

TFILES_writeline(cofenv1,TRUE);


TFILES_writestr(cofenv1,
'*',FILES_maxIO,0,left);

TFILES_writeline(cofenv1,TRUE);


paramtable1:=paramtable;
WHILE stillparams(paramtable1) DO
BEGIN
takeparam(param,paramtable1);
TFILES_writestring(cofenv1,
param.parname,0,left);

TFILES_writeline(cofenv1,TRUE);

TFILES_writestring(cofenv1,
param.typename,0,left);

TFILES_writeline(cofenv1,TRUE);


END;
TFILES_writestr(cofenv1,
'*',FILES_maxIO,0,left);

TFILES_writeline(cofenv1,TRUE);


TFILES_writeinteger(cofenv1,
numberofleftmodels,0,left);

TFILES_writeline(cofenv1,TRUE);


WHILE stillidents(leftcats) DO
BEGIN
takeident(id,leftcats);
TFILES_writestring(cofenv1,
id.str,0,left);

TFILES_writeline(cofenv1,TRUE);


END;
TFILES_writestring(cofenv1,
rightcat.str,0,left);

TFILES_writeline(cofenv1,TRUE);


TFILES_writestr(cofenv1,
'}',FILES_maxIO,0,left);

TFILES_writeline(cofenv1,TRUE);


END;
BEGIN 
dtreeproc1:=dtreeproc;
appendfile(dtreeproc1,cofpas1);
TFILES_writestr(cofpas1,
' FUNCTION COM',FILES_maxIO,0,left);

 TFILES_writestring(cofpas1,
rulenaam,0,left);

 TFILES_writestr(cofpas1,
'(',FILES_maxIO,0,left);

 END;
paramtable1:=paramtable;
WHILE stillparams(paramtable1) DO
BEGIN
takeparam(param,paramtable1);
TFILES_writestring(cofpas1,
param.parname,0,left);

 
IF TSTRING_comparechars(param.typename,'INTEGER',7)<>0
THEN BEGIN TFILES_writestr(cofpas1,
':LSDOMAINT_',FILES_maxIO,0,left);

 END ELSE BEGIN TFILES_writestr(cofpas1,
':',FILES_maxIO,0,left);

 END;
TFILES_writestring(cofpas1,
param.typename,0,left);


TFILES_writestr(cofpas1,
';',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);


END;
i:=0;
while i<>numberofleftmodels do
begin
i:=i+1;
BEGIN  TFILES_writestr(cofpas1,
'Is',FILES_maxIO,0,left);

 TFILES_writeinteger(cofpas1,
i,0,left);

 TFILES_writestr(cofpas1,
':LISTREE_pStree',FILES_maxIO,0,left);

 END;
if i<>numberofleftmodels then BEGIN  TFILES_writestr(cofpas1,
';',FILES_maxIO,0,left);

 END
end;
BEGIN  TFILES_writeline(cofpas1,TRUE);

 TFILES_writestr(cofpas1,
'):LISTREE_SetOfStrees;',FILES_maxIO,0,left);

 TFILES_writeline(cofpas1,TRUE);

 END;
BEGIN  
TFILES_writestr(decofenv1,
' FUNCTION DEC',FILES_maxIO,0,left);

 TFILES_writestring(decofenv1,
rulenaam,0,left);

 TFILES_writestr(decofenv1,
'(',FILES_maxIO,0,left);

 END;
paramtable1:=paramtable;
WHILE stillparams(paramtable1) DO
BEGIN
takeparam(param,paramtable1);
TFILES_writestr(decofenv1,
'VAR ',FILES_maxIO,0,left);


TFILES_writestring(decofenv1,
param.parname,0,left);


IF TSTRING_comparechars(param.typename,'INTEGER',7)<>0
THEN BEGIN TFILES_writestr(decofenv1,
':LSDOMAINT_',FILES_maxIO,0,left);

 END ELSE BEGIN TFILES_writestr(decofenv1,
',subst:',FILES_maxIO,0,left);

 END;
TFILES_writestring(decofenv1,
param.typename,0,left);


TFILES_writestr(decofenv1,
';',FILES_maxIO,0,left);

TFILES_writeline(decofenv1,TRUE);


END;
BEGIN  
TFILES_writestr(decofenv1,
'Is:LISTREE_pStree):LISTREE_SetOfTupleOfStrees; EXTERNAL;',FILES_maxIO,0,left);

 TFILES_writeline(decofenv1,TRUE);


END;
BEGIN  
dtreeproc1:=dtreeproc;
appendfile(dtreeproc1,decofpas1);
TFILES_writestr(decofpas1,
' FUNCTION DEC',FILES_maxIO,0,left);

 TFILES_writestring(decofpas1,
rulenaam,0,left);

 TFILES_writestr(decofpas1,
'(',FILES_maxIO,0,left);

 END;
paramtable1:=paramtable;
WHILE stillparams(paramtable1) DO
BEGIN
takeparam(param,paramtable1);
TFILES_writestr(decofpas1,
'VAR ',FILES_maxIO,0,left);


TFILES_writestring(decofpas1,
param.parname,0,left);

 
IF TSTRING_comparechars(param.typename,'INTEGER',7)<>0
THEN BEGIN TFILES_writestr(decofpas1,
':LSDOMAINT_',FILES_maxIO,0,left);

 END ELSE BEGIN TFILES_writestr(decofpas1,
',subst:',FILES_maxIO,0,left);

 END;
TFILES_writestring(decofpas1,
param.typename,0,left);


TFILES_writestr(decofpas1,
';',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);


END;
BEGIN  
TFILES_writestr(decofpas1,
'Is:LISTREE_pStree):LISTREE_SetOfTupleOfStrees;',FILES_maxIO,0,left);

 TFILES_writeline(decofpas1,TRUE);


END;
BEGIN  TFILES_writestr(decofenv1,
'{:',FILES_maxIO,0,left);

 TFILES_writestring(decofenv1,
rulenaam,0,left);

 TFILES_writestr(decofenv1,
'}',FILES_maxIO,0,left);

 TFILES_writeline(decofenv1,TRUE);

 END;
BEGIN  TFILES_writestr(cofenv1,
'{:',FILES_maxIO,0,left);

 TFILES_writestring(cofenv1,
rulenaam,0,left);

 TFILES_writestr(cofenv1,
'}',FILES_maxIO,0,left);

 TFILES_writeline(cofenv1,TRUE);

 END;
IF compresent THEN
BEGIN
BEGIN  END;
i:=0;
BEGIN TFILES_writestr(cofpas1,
'VAR result:LISTREE_SetOfStrees;',FILES_maxIO,0,left);

 TFILES_writeline(cofpas1,TRUE);

 
{varpool1.GLOBAL.}
TFILES_writestr(cofpas1,
' wbonus,sbonus:INTEGER;',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);


TFILES_writestr(cofpas1,
' m:LSSTREE_pstree;',FILES_maxIO,0,left);

 TFILES_writeline(cofpas1,TRUE);

 
TFILES_writestr(cofpas1,
' Is:LISTREE_pstree;',FILES_maxIO,0,left);

 TFILES_writeline(cofpas1,TRUE);

 
TFILES_writestr(cofpas1,
' setofstrees:LISTREE_setofstrees;',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);


TFILES_writestr(cofpas1,
' first:BOOLEAN;',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);


TFILES_writestr(cofpas1,
' match:BOOLEAN;',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);


TFILES_writestr(cofpas1,
' idargs:LIIDDICT_idargs;',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);


TFILES_writestr(cofpas1,
'dtree:HYPERDTREE_phyperdtree;',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);


TFILES_writestr(cofpas1,
' key1,key2,key3,key4,key5,key6,key7,key8,key9,key10:INTEGER;',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);


END;
WHILE stillidents(leftlevelids) DO
BEGIN
takeident(id,leftlevelids);
TFILES_writestr(cofpas1,
'Linit',FILES_maxIO,0,left);

 TFILES_writestring(cofpas1,
id.str,0,left);

 TFILES_writestr(cofpas1,
',Lrest',FILES_maxIO,0,left);

 TFILES_writestring(cofpas1,
id.str,0,left);


TFILES_writestr(cofpas1,
',Lfirst',FILES_maxIO,0,left);

 TFILES_writestring(cofpas1,
id.str,0,left);

 TFILES_writestr(cofpas1,
',Llast',FILES_maxIO,0,left);

 TFILES_writestring(cofpas1,
id.str,0,left);


TFILES_writestr(cofpas1,
':LSSTREE_prelnode;',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);


TFILES_writestr(cofpas1,
'i',FILES_maxIO,0,left);

 TFILES_writestring(cofpas1,
id.str,0,left);

 TFILES_writestr(cofpas1,
':INTEGER;',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);


TFILES_writestr(cofpas1,
'nomoretrees',FILES_maxIO,0,left);

 TFILES_writestring(cofpas1,
id.str,0,left);

 TFILES_writestr(cofpas1,
',lastmatch',FILES_maxIO,0,left);


TFILES_writestring(cofpas1,
id.str,0,left);

 TFILES_writestr(cofpas1,
':BOOLEAN;',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);


END;
while i<>numberofleftmodels do
begin
i:=i+1;
BEGIN TFILES_writestr(cofpas1,
' m',FILES_maxIO,0,left);

 TFILES_writeinteger(cofpas1,
i,0,left);

 TFILES_writestr(cofpas1,
':LSSTREE_pstree;',FILES_maxIO,0,left);

 TFILES_writeline(cofpas1,TRUE);

 END
end;
identtable:=leftrelvarlist;
While STILLidents(identtable) DO
Begin
TAKEident(id,identtable);
BEGIN TFILES_writestring(cofpas1,
id.str,0,left);

;TFILES_writestr(cofpas1,
':LSDOMAINT_synrel;',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);

 END
END;
identtable:=otherRelvarlist;
While STILLidents(identtable) DO
Begin
TAKEident(id,identtable);
BEGIN TFILES_writestring(cofpas1,
id.str,0,left);

;TFILES_writestr(cofpas1,
':LSDOMAINT_synrel;',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);

 END
END;
identtable:=SUBTRACTSETS(rightrelvarlist,
commonrelvarlist);
WHILE STILLidents(identtable) DO
Begin
TAKEident(id,identtable);
BEGIN TFILES_writestring(cofpas1,
id.str,0,left);

;TFILES_writestr(cofpas1,
':LSDOMAINT_synrel;',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);

 END;
END;
identtable:=leftnodevarlist;
While STILLidents(identtable) DO
Begin
TAKEident(id,identtable);
BEGIN TFILES_writestring(cofpas1,
id.str,0,left);

;TFILES_writestr(cofpas1,
':LSDOMAINT_lsrecord;',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);

 END
END;
identtable:=othernodevarlist;
While STILLidents(identtable) DO
Begin
TAKEident(id,identtable);
BEGIN TFILES_writestring(cofpas1,
id.str,0,left);

;TFILES_writestr(cofpas1,
':LSDOMAINT_lsrecord;',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);

 END
END;
identtable:=SUBTRACTSETS(rightnodevarlist,
commonnodevarlist);
WHILE STILLidents(identtable) DO
Begin
TAKEident(id,identtable);
BEGIN TFILES_writestring(cofpas1,
id.str,0,left);

;TFILES_writestr(cofpas1,
':LSDOMAINT_lsrecord;',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);

 
END
END;
identtable:=lefttreevarlist;
While STILLidents(identtable) DO
Begin
TAKEident(id,identtable);
BEGIN TFILES_writestring(cofpas1,
id.str,0,left);

 TFILES_writestr(cofpas1,
':LSSTREE_pStree;',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);

 END
END;
identtable:=othertreevarlist;
While STILLidents(identtable) DO
Begin
TAKEident(id,identtable);
BEGIN TFILES_writestring(cofpas1,
id.str,0,left);

;TFILES_writestr(cofpas1,
':LSSTREE_pStree;',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);

 END
END;
identtable:=SUBTRACTSETS(righttreevarlist,
commontreevarlist);
WHILE STILLidents(identtable) DO
Begin
TAKEident(id,identtable);
BEGIN TFILES_writestring(cofpas1,
id.str,0,left);

;TFILES_writestr(cofpas1,
':LSSTREE_pStree;',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);

 END
END;
identtable:=leftmuvarlist;
While STILLidents(identtable) DO
Begin
TAKEident(id,identtable);
BEGIN TFILES_writestring(cofpas1,
id.str,0,left);

 TFILES_writestr(cofpas1,
':LSMRUQUO_ListOfStrees;',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);

 END
END;
identtable:=othermuvarlist;
While STILLidents(identtable) DO
Begin
TAKEident(id,identtable);
BEGIN TFILES_writestring(cofpas1,
id.str,0,left);

;TFILES_writestr(cofpas1,
':LSMRUQUO_ListOfStrees;',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);

 END
END;
identtable:=SUBTRACTSETS(rightmuvarlist,
commonmuvarlist);
WHILE STILLidents(identtable) DO
Begin
TAKEident(id,identtable);
BEGIN TFILES_writestring(cofpas1,
id.str,0,left);

;TFILES_writestr(cofpas1,
':LSMRUQUO_ListOfStrees;',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);

 END
END;
identtable:=leftsigmavarlist;
While STILLidents(identtable) DO
Begin
TAKEident(id,identtable);
BEGIN TFILES_writestring(cofpas1,
id.str,0,left);

;TFILES_writestr(cofpas1,
':LSMRUQUO_ListOfStrees;',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);

 END
END;
identtable:=otherSigmavarlist;
While STILLidents(identtable) DO
Begin
TAKEident(id,identtable);
BEGIN TFILES_writestring(cofpas1,
id.str,0,left);

;TFILES_writestr(cofpas1,
':LSMRUQUO_ListOfStrees;',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);

 END
END;
identtable:=SUBTRACTSETS(rightsigmavarlist,
commonsigmavarlist);
WHILE STILLidents(identtable) DO
Begin
TAKEident(id,identtable);
BEGIN TFILES_writestring(cofpas1,
id.str,0,left);

;TFILES_writestr(cofpas1,
':LSMRUQUO_ListOfStrees;',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);

 END
END;
identtable:=mergerecords;
While STILLidents(identtable) DO
Begin
TAKEident(id,identtable);
IF TSTRING_length(id.str)<>0 THEN
BEGIN
selectCatName(id.str,CatName);
BEGIN
TFILES_writestring(cofpas1,
id.str,0,left);

;TFILES_writestr(cofpas1,
':LSDOMAINT_',FILES_maxIO,0,left);

;
TFILES_writestring(cofpas1,
TLDStrToStr_cattorectype(CatName),0,left);

;
TFILES_writestr(cofpas1,
';',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);


END
END
END;
identtable:=SUBTRACTSETS(rightrecords,commonrecords);
While STILLidents(identtable) DO
Begin
TAKEident(id,identtable);
IF TSTRING_length(id.str)<>0 THEN
BEGIN
selectCatName(id.str,CatName);
BEGIN 
TFILES_writestring(cofpas1,
id.str,0,left);

 TFILES_writestr(cofpas1,
':LSDOMAINT_',FILES_maxIO,0,left);

;
TFILES_writestring(cofpas1,
TLDStrToStr_cattorectype(CatName),0,left);

;
TFILES_writestr(cofpas1,
';',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);


END
END
END;

APPENDfile(commatchfilepar,cofpas1);
APPENDfile(leftcompar,cofpas1);
APPENDfile(rightcompar,cofpas1);
IF NOT primitiverule THEN 
APPENDfile(comsubrulespar,cofpas1)
ELSE APPENDFILE(comactions,cofpas1);
BEGIN 
TFILES_writestr(cofpas1,
'BEGIN',FILES_maxIO,0,left);

 TFILES_writeline(cofpas1,TRUE);

 
TFILES_writestr(cofpas1,
'LISTREE_InitSetOfStrees(result);',FILES_maxIO,0,left);

 TFILES_writeline(cofpas1,TRUE);


writewhile:=FALSE;
numberofwhiles:=0;
For i:=1 TO numberofleftmodels DO
BEGIN
alltable1:=alltable;
insidewhile[i]:=false;
WHILE stillidents(alltable1) and 
not(insidewhile[i]) DO
BEGIN
takeident(id,alltable1);
IF EXTRACT(id.str,j) THEN
BEGIN
insidewhile[i]:=(i=j);
writewhile:=writewhile or (i=j);
IF i=j THEN numberofwhiles:=numberofwhiles+1;
END;
END;
TFILES_writestr(cofpas1,
'm',FILES_maxIO,0,left);

 TFILES_writeinteger(cofpas1,
i,0,left);

 TFILES_writestr(cofpas1,
':=loopholes.retype(Is',FILES_maxIO,0,left);


TFILES_writeinteger(cofpas1,
i,0,left);

 TFILES_writestr(cofpas1,
',LSSTREE_pStree);',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);


END;
TFILES_writestr(cofpas1,
'match:= TRUE;',FILES_maxIO,0,left);

 TFILES_writeline(cofpas1,TRUE);


END; 
For i := 1 To numberofleftmodels Do
BEGIN 
IF not(insidewhile[i]) THEN
BEGIN 
TAB(cofpas1,i*2);
TFILES_writestr(cofpas1,
'MatchModel',FILES_maxIO,0,left);

 TFILES_writeinteger(cofpas1,
i,0,left);

 TFILES_writestr(cofpas1,
'(m',FILES_maxIO,0,left);


TFILES_writeinteger(cofpas1,
i,0,left);

 TFILES_writestr(cofpas1,
',TRUE,match);',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);


modellabels1:=modellabels;
WHILE stillidents(modellabels1) DO
BEGIN
takeident(labelname,modellabels1);
IF EXTRACT(labelname.str,j) THEN
IF j=i THEN
BEGIN
TAB(cofpas1,i*2);
TFILES_writestr(cofpas1,
'If match Then',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);


TAB(cofpas1,i*2);
TFILES_writestr(cofpas1,
'WHILE match AND NOT matchcond',FILES_maxIO,0,left);

 
TFILES_writestring(cofpas1,
labelname.str,0,left);

 TFILES_writestr(cofpas1,
' DO',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);


TAB(cofpas1,i*2);
TFILES_writestr(cofpas1,
'BEGIN',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);


TAB(cofpas1,i*2);
TFILES_writestr(cofpas1,
'MatchModel',FILES_maxIO,0,left);

 TFILES_writeinteger(cofpas1,
i,0,left);

 TFILES_writestr(cofpas1,
'(m',FILES_maxIO,0,left);


TFILES_writeinteger(cofpas1,
i,0,left);

 TFILES_writestr(cofpas1,
',FALSE,match);',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);


TAB(cofpas1,i*2);
TFILES_writestr(cofpas1,
'END;',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);


END;
END;
TAB(cofpas1,i*2);
TFILES_writestr(cofpas1,
'If match Then',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);


TAB(cofpas1,i*2);
TFILES_writestr(cofpas1,
'BEGIN',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);


END;
END;
IF writewhile THEN
BEGIN
FOR i:=1 TO numberofleftmodels DO
BEGIN
IF insidewhile[i] THEN
BEGIN
TAB(cofpas1,i*2);
TFILES_writestr(cofpas1,
'first:=TRUE;',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);


TAB(cofpas1,i*2);
TFILES_writestr(cofpas1,
'WHILE match DO BEGIN',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);


TAB(cofpas1,i*2);
TFILES_writestr(cofpas1,
'MatchModel',FILES_maxIO,0,left);

 TFILES_writeinteger(cofpas1,
i,0,left);

 TFILES_writestr(cofpas1,
'(m',FILES_maxIO,0,left);


TFILES_writeinteger(cofpas1,
i,0,left);

 TFILES_writestr(cofpas1,
',first,match);',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);


TFILES_writestr(cofpas1,
'first:=FALSE;',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);


modellabels1:=modellabels;
WHILE stillidents(modellabels1) DO
BEGIN
takeident(labelname,modellabels1);
IF EXTRACT(labelname.str,j) THEN
IF j=i THEN
BEGIN
TAB(cofpas1,i*2);
TFILES_writestr(cofpas1,
'If match Then',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);


TAB(cofpas1,i*2);
TFILES_writestr(cofpas1,
'WHILE match AND NOT matchcond',FILES_maxIO,0,left);

 
TFILES_writestring(cofpas1,
labelname.str,0,left);

 TFILES_writestr(cofpas1,
' DO',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);


TAB(cofpas1,i*2);
TFILES_writestr(cofpas1,
'BEGIN',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);


TAB(cofpas1,i*2);
TFILES_writestr(cofpas1,
'MatchModel',FILES_maxIO,0,left);

 TFILES_writeinteger(cofpas1,
i,0,left);

 TFILES_writestr(cofpas1,
'(m',FILES_maxIO,0,left);


TFILES_writeinteger(cofpas1,
i,0,left);

 TFILES_writestr(cofpas1,
',FALSE,match);',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);


TAB(cofpas1,i*2);
TFILES_writestr(cofpas1,
'END;',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);


END;
END;
TAB(cofpas1,i*2);
TFILES_writestr(cofpas1,
'If match Then',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);


TAB(cofpas1,i*2);
TFILES_writestr(cofpas1,
'BEGIN',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);


END;
END;
END;
i:=0;
WHILE i<>numofsubrules DO
BEGIN
i:=i+1;
takepresent(compresent1,compresents1);
IF compresent1.valeu THEN
BEGIN
TAB(cofpas1,numberofleftmodels*2);
TFILES_writestr(cofpas1,
'LISTREE_mergesetsofstrees(subrule0X',FILES_maxIO,0,left);

 TFILES_writeinteger(cofpas1,
i,0,left);


TFILES_writestr(cofpas1,
',result);',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);


END;
END;
TFILES_writestr(cofpas1,
' END;',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);


IF primitiverule THEN 
BEGIN
APPENDfile(comconditions,cofpas1);
END;
FOR i := 1 To numberofwhiles DO
BEGIN
TFILES_writestr(cofpas1,
'END;{WHILE}',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);


IF NOT((i=numberofwhiles) AND 
(i=numberofleftmodels))THEN
BEGIN
TFILES_writestr(cofpas1,
'match:=TRUE;',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);


TFILES_writestr(cofpas1,
'END;{IF}',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);


END;
END;
FOR i := 1 To numberofleftmodels -numberofwhiles -1 DO
BEGIN
BEGIN TAB(cofpas1,(numberofleftmodels-i+1)*2);
TFILES_writestr(cofpas1,
'END;',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);


END;
END;
BEGIN TFILES_writestr(cofpas1,
'COM',FILES_maxIO,0,left);

 TFILES_writestring(cofpas1,
rulenaam,0,left);

 TFILES_writestr(cofpas1,
':=result',FILES_maxIO,0,left);

 TFILES_writeline(cofpas1,TRUE);

 END;
BEGIN TFILES_writestr(cofpas1,
'END;',FILES_maxIO,0,left);

 TFILES_writeline(cofpas1,TRUE);

 END;
BEGIN TFILES_writestr(cofpas1,
'{:',FILES_maxIO,0,left);

 TFILES_writestring(cofpas1,
rulenaam,0,left);

 TFILES_writestr(cofpas1,
'}',FILES_maxIO,0,left);

 TFILES_writeline(cofpas1,TRUE);

 END;
END
ELSE
BEGIN
TFILES_writestr(cofpas1,
'VAR result:LISTREE_setofstrees;',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);


TFILES_writestr(cofpas1,
'BEGIN',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);


TFILES_writestr(cofpas1,
'LISTREE_initsetofstrees(result);',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);


TFILES_writestr(cofpas1,
'COM',FILES_maxIO,0,left);

 TFILES_writestring(cofpas1,
rulenaam,0,left);

 TFILES_writestr(cofpas1,
':=result',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);


TFILES_writestr(cofpas1,
'END;',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);


END;
IF decompresent THEN
BEGIN
BEGIN  END;
BEGIN TFILES_writestr(decofpas1,
'VAR result:LISTREE_SetOfTupleOfStrees;',FILES_maxIO,0,left);

 TFILES_writeline(decofpas1,TRUE);

 END;
{varpool1.GLOBAL.}
TFILES_writestr(decofpas1,
' wbonus,sbonus:INTEGER;',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);


BEGIN TFILES_writestr(decofpas1,
' m:LSSTREE_pstree;',FILES_maxIO,0,left);

 TFILES_writeline(decofpas1,TRUE);

 END;
BEGIN TFILES_writestr(decofpas1,
' tuple:LISTREE_TupleOfStrees;',FILES_maxIO,0,left);

 TFILES_writeline(decofpas1,TRUE);

 END;
BEGIN TFILES_writestr(decofpas1,
' first:BOOLEAN;',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);

 END;
BEGIN TFILES_writestr(decofpas1,
' match:BOOLEAN;',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);

 END;
TFILES_writestr(decofpas1,
' idargs:LIIDDICT_idargs;',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);


TFILES_writestr(decofpas1,
'dtree:HYPERDTREE_phyperdtree;',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);


TFILES_writestr(decofpas1,
' key1,key2,key3,key4,key5,key6,key7,key8,key9,key10:INTEGER;',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);


WHILE stillidents(rightlevelids) DO
BEGIN
takeident(id,rightlevelids);
TFILES_writestr(decofpas1,
'Linit',FILES_maxIO,0,left);

 TFILES_writestring(decofpas1,
id.str,0,left);

 TFILES_writestr(decofpas1,
',Lrest',FILES_maxIO,0,left);

 TFILES_writestring(decofpas1,
id.str,0,left);


TFILES_writestr(decofpas1,
',Lfirst',FILES_maxIO,0,left);

 TFILES_writestring(decofpas1,
id.str,0,left);

 TFILES_writestr(decofpas1,
',Llast',FILES_maxIO,0,left);

 TFILES_writestring(decofpas1,
id.str,0,left);


TFILES_writestr(decofpas1,
':LSSTREE_prelnode;',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);


TFILES_writestr(decofpas1,
'i',FILES_maxIO,0,left);

 TFILES_writestring(decofpas1,
id.str,0,left);

 TFILES_writestr(decofpas1,
':INTEGER;',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);


TFILES_writestr(decofpas1,
'nomoretrees',FILES_maxIO,0,left);

 TFILES_writestring(decofpas1,
id.str,0,left);

 TFILES_writestr(decofpas1,
',lastmatch',FILES_maxIO,0,left);


TFILES_writestring(decofpas1,
id.str,0,left);

 TFILES_writestr(decofpas1,
':BOOLEAN;',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);


END;
i:=0; 
while i<>numberofleftmodels do
begin
i:=i+1;
BEGIN TFILES_writestr(decofpas1,
' m',FILES_maxIO,0,left);

 TFILES_writeinteger(decofpas1,
i,0,left);

 TFILES_writestr(decofpas1,
':LSSTREE_pstree;',FILES_maxIO,0,left);

 TFILES_writeline(decofpas1,TRUE);

 END;
BEGIN TFILES_writestr(decofpas1,
' Is',FILES_maxIO,0,left);

 TFILES_writeinteger(decofpas1,
i,0,left);

 TFILES_writestr(decofpas1,
':LISTREE_pstree;',FILES_maxIO,0,left);

 TFILES_writeline(decofpas1,TRUE);

 END
end;
identtable:=leftrelvarlist;
While STILLidents(identtable) DO
Begin
TAKEident(id,identtable);
BEGIN TFILES_writestring(decofpas1,
id.str,0,left);

;TFILES_writestr(decofpas1,
':LSDOMAINT_synrel;',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);

 END
END;
identtable:=otherRelvarlist;
While STILLidents(identtable) DO
Begin
TAKEident(id,identtable);
BEGIN TFILES_writestring(decofpas1,
id.str,0,left);

;TFILES_writestr(decofpas1,
':LSDOMAINT_synrel;',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);

 END
END;
identtable:=SUBTRACTSETS(rightrelvarlist,
commonrelvarlist);
WHILE STILLidents(identtable) DO
Begin
TAKEident(id,identtable);
BEGIN TFILES_writestring(decofpas1,
id.str,0,left);

;TFILES_writestr(decofpas1,
':LSDOMAINT_synrel;',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);

 END;
END;
identtable:=leftnodevarlist;
While STILLidents(identtable) DO
Begin
TAKEident(id,identtable);
BEGIN TFILES_writestring(decofpas1,
id.str,0,left);

;TFILES_writestr(decofpas1,
':LSDOMAINT_lsrecord;',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);

 
END
END;
identtable:=othernodevarlist;
While STILLidents(identtable) DO
Begin
TAKEident(id,identtable);
BEGIN TFILES_writestring(decofpas1,
id.str,0,left);

;TFILES_writestr(decofpas1,
':LSDOMAINT_lsrecord;',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);

 END
END;
identtable:=SUBTRACTSETS(rightnodevarlist,
commonnodevarlist);
WHILE STILLidents(identtable) DO
Begin
TAKEident(id,identtable);
BEGIN TFILES_writestring(decofpas1,
id.str,0,left);

;TFILES_writestr(decofpas1,
':LSDOMAINT_lsrecord;',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);

 END
END;
identtable:=lefttreevarlist;
While STILLidents(identtable) DO
Begin
TAKEident(id,identtable);
BEGIN TFILES_writestring(decofpas1,
id.str,0,left);

;TFILES_writestr(decofpas1,
':LSSTREE_pStree;',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);

 END
END;
identtable:=othertreevarlist;
While STILLidents(identtable) DO
Begin
TAKEident(id,identtable);
BEGIN TFILES_writestring(decofpas1,
id.str,0,left);

;TFILES_writestr(decofpas1,
':LSSTREE_pStree;',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);

 END
END;
identtable:=SUBTRACTSETS(righttreevarlist,
commontreevarlist);
WHILE STILLidents(identtable) DO
Begin
TAKEident(id,identtable);
BEGIN TFILES_writestring(decofpas1,
id.str,0,left);

;TFILES_writestr(decofpas1,
':LSSTREE_pStree;',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);

 END
END;
identtable:=leftmuvarlist;
While STILLidents(identtable) DO
Begin
TAKEident(id,identtable);
BEGIN TFILES_writestring(decofpas1,
id.str,0,left);

;TFILES_writestr(decofpas1,
':LSMRUQUO_ListOfStrees;',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);

 END
END;
identtable:=othermuvarlist;
While STILLidents(identtable) DO
Begin
TAKEident(id,identtable);
BEGIN TFILES_writestring(decofpas1,
id.str,0,left);

;TFILES_writestr(decofpas1,
':LSMRUQUO_ListOfStrees;',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);

 END
END;
identtable:=SUBTRACTSETS(rightmuvarlist,
commonmuvarlist);
WHILE STILLidents(identtable) DO
Begin
TAKEident(id,identtable);
BEGIN TFILES_writestring(decofpas1,
id.str,0,left);

;TFILES_writestr(decofpas1,
':LSMRUQUO_ListOfStrees;',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);

 END
END;
identtable:=leftsigmavarlist;
While STILLidents(identtable) DO
Begin
TAKEident(id,identtable);
BEGIN TFILES_writestring(decofpas1,
id.str,0,left);

;TFILES_writestr(decofpas1,
':LSMRUQUO_ListOfStrees;',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);

 END
END;
identtable:=otherSigmavarlist;
While STILLidents(identtable) DO
Begin
TAKEident(id,identtable);
BEGIN TFILES_writestring(decofpas1,
id.str,0,left);

;TFILES_writestr(decofpas1,
':LSMRUQUO_ListOfStrees;',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);

 END
END;
identtable:=SUBTRACTSETS(rightsigmavarlist,
commonsigmavarlist);
WHILE STILLidents(identtable) DO
Begin
TAKEident(id,identtable);
BEGIN TFILES_writestring(decofpas1,
id.str,0,left);

;TFILES_writestr(decofpas1,
':LSMRUQUO_ListOfStrees;',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);

 END
END;
identtable:=SUBTRACTSETS(mergerecords,commonrecords);
While STILLidents(identtable) DO
Begin
TAKEident(id,identtable);
IF TSTRING_length(id.str)<>0 THEN
BEGIN
selectCatName(id.str,CatName);
BEGIN
TFILES_writestring(decofpas1,
id.str,0,left);

;TFILES_writestr(decofpas1,
':LSDOMAINT_',FILES_maxIO,0,left);

;
TFILES_writestring(decofpas1,
TLDStrToStr_cattorectype(CatName),0,left);

;
TFILES_writestr(decofpas1,
';',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);


END
END
END;
identtable:=rightrecords;
REVERSESET(identtable,identtable);
While STILLidents(identtable) DO
Begin
TAKEident(id,identtable);
IF TSTRING_length(id.str)<>0 THEN
BEGIN
selectCatName(id.str,CatName);
BEGIN 
TFILES_writestring(decofpas1,
id.str,0,left);

 TFILES_writestr(decofpas1,
':LSDOMAINT_',FILES_maxIO,0,left);

;
TFILES_writestring(decofpas1,
TLDStrToStr_cattorectype(CatName),0,left);

;
TFILES_writestr(decofpas1,
';',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);


END
END
END;

APPENDfile(decommatchfilepar,decofpas1);
APPENDfile(leftdecompar,decofpas1);
APPENDfile(rightdecompar,decofpas1);
IF NOT primitiverule THEN 
APPENDfile(decomsubrulespar,decofpas1)
ELSE APPENDfile(decomactions,decofpas1);
BEGIN TFILES_writestr(decofpas1,
'BEGIN',FILES_maxIO,0,left);

 TFILES_writeline(decofpas1,TRUE);

 END;
alltable1:=alltable;
writewhile:=false;
WHILE stillidents(alltable1) and 
not(writewhile) DO
BEGIN
takeident(id,alltable1);
IF EXTRACT(id.str,j) THEN
BEGIN
writewhile:=(j=0)
END;
END;
TFILES_writestr(decofpas1,
'm:=loopholes.retype(Is,LSSTREE_pstree);',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);


TFILES_writestr(decofpas1,
'LISTREE_InitSetOfTupleOfStrees(result);',FILES_maxIO,0,left);

 TFILES_writeline(decofpas1,TRUE);


TFILES_writestr(decofpas1,
'match:=TRUE;',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);


TFILES_writestr(decofpas1,
'first:=TRUE;',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);


IF writewhile THEN
BEGIN
TFILES_writestr(decofpas1,
'WHILE match DO BEGIN',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);


END;
TFILES_writestr(decofpas1,
'matchmodel(m,first,match);',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);


TFILES_writestr(decofpas1,
'first:=FALSE;',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);


modellabels1:=modellabels;
WHILE stillidents(modellabels1) DO
BEGIN
takeident(labelname,modellabels1);
IF EXTRACT(labelname.str,j) THEN
IF j=0 THEN
BEGIN
TAB(decofpas1,2);
TFILES_writestr(decofpas1,
'If match Then',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);


TAB(decofpas1,2);
TFILES_writestr(decofpas1,
'WHILE match AND NOT matchcond',FILES_maxIO,0,left);

 
TFILES_writestring(decofpas1,
labelname.str,0,left);

 TFILES_writestr(decofpas1,
' DO',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);


TAB(decofpas1,2);
TFILES_writestr(decofpas1,
'BEGIN',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);


TAB(decofpas1,2);
TFILES_writestr(decofpas1,
'MatchModel',FILES_maxIO,0,left);

 TFILES_writestr(decofpas1,
'(m,FALSE,match);',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);


TAB(decofpas1,2);
TFILES_writestr(decofpas1,
'END;',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);


END;
END;
TFILES_writestr(decofpas1,
'IF match THEN',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);


TFILES_writestr(decofpas1,
' BEGIN',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);


IF levelpar THEN 
BEGIN TFILES_writestr(decofpas1,
' level:=LIMATCHES_newlevel;',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);

 
TFILES_writestr(decofpas1,
' subst:=',FILES_maxIO,0,left);

 TFILES_writeinteger(decofpas1,
substituent,0,left);

 TFILES_writestr(decofpas1,
';',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);


END;
i:=0;
WHILE i<>numofsubrules DO
BEGIN
i:=i+1;
takepresent(decompresent1,decompresents1);
IF decompresent1.valeu THEN
BEGIN
TAB(decofpas1,2);
TFILES_writestr(decofpas1,
'LISTREE_mergesetsoftuplestrees(subrule0X',FILES_maxIO,0,left);

 TFILES_writeinteger(decofpas1,
i,0,left);


TFILES_writestr(decofpas1,
',result);',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);


END;
END;
TFILES_writestr(decofpas1,
' END;',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);


IF primitiverule THEN APPENDfile(decomconditions,decofpas1);
IF writewhile THEN
BEGIN
TFILES_writestr(decofpas1,
'END;{WHILE}',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);


END;
BEGIN TFILES_writestr(decofpas1,
'DEC',FILES_maxIO,0,left);

 TFILES_writestring(decofpas1,
rulenaam,0,left);

 TFILES_writestr(decofpas1,
':=result',FILES_maxIO,0,left);

 TFILES_writeline(decofpas1,TRUE);

 END;
BEGIN TFILES_writestr(decofpas1,
'END;',FILES_maxIO,0,left);

 TFILES_writeline(decofpas1,TRUE);

 END;
BEGIN TFILES_writestr(decofpas1,
'{:',FILES_maxIO,0,left);

 TFILES_writestring(decofpas1,
rulenaam,0,left);

 TFILES_writestr(decofpas1,
'}',FILES_maxIO,0,left);

 TFILES_writeline(decofpas1,TRUE);

 END;
END
ELSE
BEGIN
TFILES_writestr(decofpas1,
'VAR result:LISTREE_setoftupleofstrees;',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);


TFILES_writestr(decofpas1,
'BEGIN',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);


TFILES_writestr(decofpas1,
'LISTREE_initsetoftupleofstrees(result);',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);


TFILES_writestr(decofpas1,
'DEC',FILES_maxIO,0,left);

 TFILES_writestring(decofpas1,
rulenaam,0,left);

 TFILES_writestr(decofpas1,
':=result',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);


TFILES_writestr(decofpas1,
'END;',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);


END;
END
END;
PROCEDURE mrucomCODE_FILTERSPECproc(top:mrucomDECL_psnode
);
VAR currenttree:mrucomDECL_psnode;
    rsnode1:mrucomDECL_prsnode;
 rulenaam,CatName:TSTRING_string;
i: mrucomLANGSPEC_int;
numofsubfilters,j:INTEGER;
primitiverule,compresent,decompresent: mrucomLANGSPEC_bool;
rightcat,labelname: mrucomLANGSPEC_ident;
rightlevelids,rightlevelids1: mrucomLANGSPEC_setofidents;
righttolefttable: mrucomLANGSPEC_setofidents;
rightcompar,rightdecompar,decommatchfilepar,commatchfilepar,comsubrulespar,
decomsubrulespar,comconditions,decomconditions,comactions,decomactions:LOCALFILE;
id,id1: mrucomLANGSPEC_ident;
MergeRecords,RightRecords,
rightSigmaVarList,rightMuVarList,rightNodeVarList,rightTreeVarList,rightRelVarList,
otherSigmaVarList,otherMuVarList,otherNodeVarList,otherTreeVarList,otherRelVarList,
OtherRecords: mrucomLANGSPEC_SetOfIdents;
modellabels,modellabels1,identtable: mrucomLANGSPEC_setofidents;
positive: mrucomLANGSPEC_bool;
 PROCEDURE SelectCatName(recordname:TSTRING_string;
VAR catname:TSTRING_string);
VAR length:integer;
BEGIN
length:=TSTRING_Length(recordname);
IF recordname[length]='_' THEN length:=length-1;
IF recordname[length] IN ['0','1','2','3','4','5','6','7','8','9'] THEN
TSTRING_ExtractBegin(catname,recordname,length-4)
ELSE
TSTRING_ExtractBegin(catname,recordname,length-6);
END;
FUNCTION Idpresent(id: mrucomLANGSPEC_ident;table: mrucomLANGSPEC_setofidents):BOOLEAN;
VAR result:BOOLEAN;
ident: mrucomLANGSPEC_ident;
BEGIN
result:=FALSE;
While stillidents(table) and NOT(result) do
begin
takeident(ident,table);
result:= (ident.str=id.str)
end;
Idpresent:=result
END;
PROCEDURE APPENDSETS(S1: mrucomLANGSPEC_SETOFidents;VAR S2: mrucomLANGSPEC_SETOFidents);
VAR ident1: mrucomLANGSPEC_ident;
BEGIN
WHILE STILLidents(S1) DO
BEGIN
TAKEident(ident1,S1);
APPENDident(ident1,S2)
END
END;
FUNCTION present(ident: mrucomLANGSPEC_ident;S1: mrucomLANGSPEC_setofidents):BOOLEAN;
VAR ident1: mrucomLANGSPEC_ident;
result:boolean;
begin
result:=false;
while stillidents(S1) and not(result) do
begin
takeident(ident1,S1);
result := (ident1.str=ident.str)
end;
present:=result
end;
FUNCTION EXTRACT(str:TSTRING_string; VAR int:INTEGER):BOOLEAN;
VAR ch:CHAR;
result:BOOLEAN;
BEGIN
int:=0;
IF TSTRING_length(str)>1 THEN 
BEGIN
TSTRING_extractchar(ch,str,1);
result:= (ch='M') or (ch='m');
TSTRING_extractchar(ch,str,2);
if result then result:=(ch IN ['1','2','3','4','5','6','7','8','9']);
IF result THEN int:=ORD(ch)-48;
END
ELSE
BEGIN
TSTRING_extractchar(ch,str,1);
result:= (ch='M') or (ch='m')
END;
extract:=result
END;
FUNCTION DOORSNEDE(S1: mrucomLANGSPEC_SETOFidents;S2: mrucomLANGSPEC_SETOFidents): mrucomLANGSPEC_setofidents;
VAR ident1: mrucomLANGSPEC_ident;
result: mrucomLANGSPEC_setofidents;
BEGIN
initsetofidents(result);
WHILE STILLidents(S1) DO
BEGIN
TAKEident(ident1,S1);
IF present(ident1,S2) THEN APPENDident(ident1,result)
END;
doorsnede:=result
{result contains those elements of S1 that also belong to S2}
END;
PROCEDURE REVERSESET(S1: mrucomLANGSPEC_SETOFidents;VAR S2: mrucomLANGSPEC_SETOFidents);
VAR ident1: mrucomLANGSPEC_ident;
BEGIN
IF stillidents(S1) THEN 
BEGIN
TAKEident(ident1,S1);
REVERSESET(S1,S2);
APPENDident(ident1,S2)
END
ELSE S2:=S1
END;
FUNCTION SUBTRACTSETS(S1: mrucomLANGSPEC_SETOFidents;S2: mrucomLANGSPEC_SETOFidents): mrucomLANGSPEC_setofidents;
VAR ident1: mrucomLANGSPEC_ident;
result: mrucomLANGSPEC_setofidents;
BEGIN
initsetofidents(result);
WHILE STILLidents(S1) DO
BEGIN
TAKEident(ident1,S1);
IF not(present(ident1,S2)) THEN APPENDident(ident1,result)
END;
subtractsets:=result
{result contains those elements of S1 that do not belong to S2}
END;
BEGIN
 BEGIN TSTRING_constantempty(rulenaam);
TSTRING_constantempty(CatName);
decompresent:=TRUE;
compresent:=TRUE;
primitiverule:=TRUE;
positive:=FALSE;
INITLOCALFILE(rightcompar);
INITLOCALFILE(rightdecompar);
INITLOCALFILE(comsubrulespar);INITLOCALFILE(decomsubrulespar);
INITLOCALFILE(commatchfilepar);INITLOCALFILE(comconditions);
INITLOCALFILE(comactions);INITLOCALFILE(decomactions);
INITLOCALFILE(decomconditions);INITLOCALFILE(decommatchfilepar);
INITSETOFidents(MergeRecords);
INITSETOFidents(RightRecords);
INITSETOFidents(OtherRecords);
righttolefttable:=top^.ldfield.FILTERSPECfield^.righttolefttable;
RightRecords:=top^.ldfield.FILTERSPECfield^.RightRecords;
OtherRecords:=top^.ldfield.FILTERSPECfield^.OtherRecords;
rightMuVarList:=top^.ldfield.FILTERSPECfield^.rightMuVarList;
rightSigmaVarList:=top^.ldfield.FILTERSPECfield^.rightSigmaVarList;
rightTreeVarList:=top^.ldfield.FILTERSPECfield^.rightTreeVarList;
rightNodeVarList:=top^.ldfield.FILTERSPECfield^.rightNodeVarList;
rightRelVarList:=top^.ldfield.FILTERSPECfield^.rightRelVarList;
otherMuVarList:=top^.ldfield.FILTERSPECfield^.otherMuVarList;
otherSigmaVarList:=top^.ldfield.FILTERSPECfield^.otherSigmaVarList;
otherTreeVarList:=top^.ldfield.FILTERSPECfield^.otherTreeVarList;
otherNodeVarList:=top^.ldfield.FILTERSPECfield^.otherNodeVarList;
otherRelVarList:=top^.ldfield.FILTERSPECfield^.otherRelVarList;
modellabels:=top^.ldfield.FILTERSPECfield^.modellabels;
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
;
 BEGIN rulenaam:=currenttree^.ldfield.TERMINAL^.str;
END
END;

3: begin
  BEGIN RIGHTMODEL__righttolefttable:=righttolefttable;
RIGHTMODEL__name:=rulenaam;
rightcat:=currenttree^.ldfield.RIGHTMODELfield^.rightcat;
END
; mrucomCODE_RIGHTMODELproc(currenttree
,RIGHTMODEL__name
,RIGHTMODEL__righttolefttable
,RIGHTMODEL__rightcom
,RIGHTMODEL__rightdecom
,RIGHTMODEL__dtreeproc
,RIGHTMODEL__levelids
,RIGHTMODEL__dtreelevelids
);
 BEGIN {rightcom contains create and rightdecom match functions}
APPENDlocfile(RIGHTMODEL__rightdecom,rightdecompar);
savelocfile(rightdecompar,rightcompar);
rightlevelids:=RIGHTMODEL__levelids;
END
END;

4: begin
  BEGIN 
MATCHCONDS__rightMuVarList:=rightMuVarList;
MATCHCONDS__rightSigmaVarList:=rightSigmaVarList;
MATCHCONDS__rightTreeVarList:=rightTreeVarList;
MATCHCONDS__rightNodeVarList:=rightNodeVarList;
MATCHCONDS__rightRelVarList:=rightRelVarList;
MATCHCONDS__indent:=0;
END
; mrucomCODE_MATCHCONDSproc(currenttree
,MATCHCONDS__leftMuVarList
,MATCHCONDS__leftSigmaVarList
,MATCHCONDS__leftRelVarList
,MATCHCONDS__leftTreeVarList
,MATCHCONDS__leftNodeVarList
,MATCHCONDS__rightMuVarList
,MATCHCONDS__rightSigmaVarList
,MATCHCONDS__rightRelVarList
,MATCHCONDS__rightTreeVarList
,MATCHCONDS__rightNodeVarList
,MATCHCONDS__indent
,MATCHCONDS__commatchfile
,MATCHCONDS__decommatchfile
);
 BEGIN {matchfile contains functions for matching}
APPENDlocfile(MATCHCONDS__commatchfile,commatchfilepar);
APPENDlocfile(MATCHCONDS__decommatchfile,decommatchfilepar);
END
END;

5: begin
  BEGIN CAPAIRS__filter:=TRUE;
CAPAIRS__allexistcounter:=0;
CAPAIRS__indent:=2;
CAPAIRS__level:=0;
CAPAIRS__insubrule:=FALSE;
CAPAIRS__modelnumber:=0;
INITsetofidents(CAPAIRS__rhslabels);
END
; mrucomCODE_CAPAIRSproc(currenttree
,CAPAIRS__actionteller
,CAPAIRS__actiontellers
,CAPAIRS__indent
,CAPAIRS__syncattable
,CAPAIRS__recordtable
,CAPAIRS__modelnumber
,CAPAIRS__level
,CAPAIRS__insubrule
,CAPAIRS__filter
,CAPAIRS__vartypes
,CAPAIRS__rhslabels
,CAPAIRS__conditions
,CAPAIRS__actions
,CAPAIRS__allexist
,CAPAIRS__allexistcounter
);
 BEGIN 
APPENDlocfile(CAPAIRS__conditions,comconditions);
APPENDlocfile(CAPAIRS__allexist,comactions);
savelocfile(comconditions,decomconditions);
savelocfile(comactions,decomactions);
END
END;

6: begin
  BEGIN INITsetofidents(SUBFILTERS__prevrightrhslabels);
SUBFILTERS__indent:=0;
END
; mrucomCODE_SUBFILTERSproc(currenttree
,SUBFILTERS__indent
,SUBFILTERS__prevrightrhslabels
,SUBFILTERS__vartypes
,SUBFILTERS__comsubrules
,SUBFILTERS__decomsubrules
);
 BEGIN primitiverule:=FALSE;
numofsubfilters:=currenttree^.ldfield.SUBFILTERSfield^.numofsubfilters;
APPENDlocfile(SUBFILTERS__comsubrules,comsubrulespar);
APPENDlocfile(SUBFILTERS__decomsubrules,decomsubrulespar);
{com and decomsubrulespar contain accumulated subrules}
END
END;

7: begin
  BEGIN END
;
 BEGIN decompresent:=FALSE END
END;

8: begin
  BEGIN END
;
 BEGIN compresent:=FALSE END
END;

9: begin
  BEGIN END
;
 BEGIN positive:=TRUE END
END;

END;

rsnode1:=rsnode1^.brother END;
BEGIN 
MergeRecords:=otherrecords;
BEGIN  TFILES_writestr(cofenv1,
'{rule:}',FILES_maxIO,0,left);

 TFILES_writeline(cofenv1,TRUE);

 
TFILES_writestr(cofenv1,
'{:',FILES_maxIO,0,left);

 TFILES_writestring(cofenv1,
rulenaam,0,left);

 TFILES_writestr(cofenv1,
'}',FILES_maxIO,0,left);

 TFILES_writeline(cofenv1,TRUE);

 END;
BEGIN  TFILES_writestr(decofenv1,
'{rule:}',FILES_maxIO,0,left);

 TFILES_writeline(decofenv1,TRUE);

 
TFILES_writestr(decofenv1,
'{:',FILES_maxIO,0,left);

 TFILES_writestring(decofenv1,
rulenaam,0,left);

 TFILES_writestr(decofenv1,
'}',FILES_maxIO,0,left);

 TFILES_writeline(decofenv1,TRUE);

 END;
BEGIN  TFILES_writestr(cofpas1,
'{rule:}',FILES_maxIO,0,left);

 TFILES_writeline(cofpas1,TRUE);

 
TFILES_writestr(cofpas1,
'{:',FILES_maxIO,0,left);

 TFILES_writestring(cofpas1,
rulenaam,0,left);

 TFILES_writestr(cofpas1,
'}',FILES_maxIO,0,left);

 TFILES_writeline(cofpas1,TRUE);

 END;
BEGIN  TFILES_writestr(decofpas1,
'{rule:}',FILES_maxIO,0,left);

 TFILES_writeline(decofpas1,TRUE);

 
TFILES_writestr(decofpas1,
'{:',FILES_maxIO,0,left);

 TFILES_writestring(decofpas1,
rulenaam,0,left);

 TFILES_writestr(decofpas1,
'}',FILES_maxIO,0,left);

 TFILES_writeline(decofpas1,TRUE);

 END;
BEGIN  
TFILES_writestr(cofenv1,
' FUNCTION COM',FILES_maxIO,0,left);

 TFILES_writestring(cofenv1,
rulenaam,0,left);

 
TFILES_writestr(cofenv1,
'(Is:LISTREE_pStree):LISTREE_pstree;',FILES_maxIO,0,left);

TFILES_writeline(cofenv1,TRUE);


TFILES_writestr(cofenv1,
'EXTERNAL;',FILES_maxIO,0,left);

 TFILES_writeline(cofenv1,TRUE);

 END;
TFILES_writestr(cofenv1,
'{*',FILES_maxIO,0,left);

TFILES_writeline(cofenv1,TRUE);


TFILES_writestr(cofenv1,
'FILTER',FILES_maxIO,0,left);

 TFILES_writeline(cofenv1,TRUE);


TFILES_writestring(cofenv1,
rulenaam,0,left);

TFILES_writeline(cofenv1,TRUE);


TFILES_writestr(cofenv1,
'1',FILES_maxIO,0,left);

TFILES_writeline(cofenv1,TRUE);


TFILES_writestring(cofenv1,
rightcat.str,0,left);

TFILES_writeline(cofenv1,TRUE);


TFILES_writestr(cofenv1,
'}',FILES_maxIO,0,left);

TFILES_writeline(cofenv1,TRUE);


BEGIN  
TFILES_writestr(cofpas1,
' FUNCTION COM',FILES_maxIO,0,left);

 TFILES_writestring(cofpas1,
rulenaam,0,left);

 
TFILES_writestr(cofpas1,
'(Is:LISTREE_pStree):LISTREE_pstree;',FILES_maxIO,0,left);

 END;
BEGIN  
TFILES_writestr(decofenv1,
' FUNCTION DEC',FILES_maxIO,0,left);

 TFILES_writestring(decofenv1,
rulenaam,0,left);

 
TFILES_writestr(decofenv1,
'(Is:LISTREE_pStree):LISTREE_pstree; EXTERNAL;',FILES_maxIO,0,left);

 END;
BEGIN  
TFILES_writestr(decofpas1,
' FUNCTION DEC',FILES_maxIO,0,left);

 TFILES_writestring(decofpas1,
rulenaam,0,left);

 
TFILES_writestr(decofpas1,
'(Is:LISTREE_pStree):LISTREE_pstree;',FILES_maxIO,0,left);

 END;
BEGIN  TFILES_writestr(decofenv1,
'{:',FILES_maxIO,0,left);

 TFILES_writestring(decofenv1,
rulenaam,0,left);

 TFILES_writestr(decofenv1,
'}',FILES_maxIO,0,left);

 TFILES_writeline(decofenv1,TRUE);

 END;
BEGIN  TFILES_writestr(cofenv1,
'{:',FILES_maxIO,0,left);

 TFILES_writestring(cofenv1,
rulenaam,0,left);

 TFILES_writestr(cofenv1,
'}',FILES_maxIO,0,left);

 TFILES_writeline(cofenv1,TRUE);

 END;
IF compresent THEN
BEGIN 
BEGIN TFILES_writestr(cofpas1,
'VAR result:LISTREE_pStree;',FILES_maxIO,0,left);

 TFILES_writeline(cofpas1,TRUE);

 
{varpool1.GLOBAL.}
TFILES_writestr(cofpas1,
' m:LSSTREE_pstree;',FILES_maxIO,0,left);

 TFILES_writeline(cofpas1,TRUE);

 
TFILES_writestr(cofpas1,
' match:BOOLEAN;',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);

 
END;
rightlevelids1:=rightlevelids;
WHILE stillidents(rightlevelids1) DO
BEGIN
takeident(id,rightlevelids1);
TFILES_writestr(cofpas1,
'Linit',FILES_maxIO,0,left);

 TFILES_writestring(cofpas1,
id.str,0,left);

 TFILES_writestr(cofpas1,
',Lrest',FILES_maxIO,0,left);

 TFILES_writestring(cofpas1,
id.str,0,left);


TFILES_writestr(cofpas1,
',Lfirst',FILES_maxIO,0,left);

 TFILES_writestring(cofpas1,
id.str,0,left);

 TFILES_writestr(cofpas1,
',Llast',FILES_maxIO,0,left);

 TFILES_writestring(cofpas1,
id.str,0,left);


TFILES_writestr(cofpas1,
':LSSTREE_prelnode;',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);


TFILES_writestr(cofpas1,
'i',FILES_maxIO,0,left);

 TFILES_writestring(cofpas1,
id.str,0,left);

 TFILES_writestr(cofpas1,
':INTEGER;',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);


TFILES_writestr(cofpas1,
'nomoretrees',FILES_maxIO,0,left);

 TFILES_writestring(cofpas1,
id.str,0,left);

 TFILES_writestr(cofpas1,
',lastmatch',FILES_maxIO,0,left);


TFILES_writestring(cofpas1,
id.str,0,left);

 TFILES_writestr(cofpas1,
':BOOLEAN;',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);


END;
TFILES_writestr(cofpas1,
' key1,key2,key3,key4,key5,key6,key7,key8,key9,key10:INTEGER;',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);


identtable:=otherRelvarlist;
While STILLidents(identtable) DO
Begin
TAKEident(id,identtable);
BEGIN TFILES_writestring(cofpas1,
id.str,0,left);

;TFILES_writestr(cofpas1,
':LSDOMAINT_synrel;',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);

 END
END;
identtable:=rightrelvarlist;
WHILE STILLidents(identtable) DO
Begin
TAKEident(id,identtable);
BEGIN TFILES_writestring(cofpas1,
id.str,0,left);

 TFILES_writestr(cofpas1,
':LSDOMAINT_synrel;',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);

 END;
END;
identtable:=othernodevarlist;
While STILLidents(identtable) DO
Begin
TAKEident(id,identtable);
BEGIN TFILES_writestring(cofpas1,
id.str,0,left);

;TFILES_writestr(cofpas1,
':LSDOMAINT_lsrecord;',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);

 END
END;
identtable:=rightnodevarlist;
While STILLidents(identtable) DO
Begin
TAKEident(id,identtable);
BEGIN TFILES_writestring(cofpas1,
id.str,0,left);

;TFILES_writestr(cofpas1,
':LSDOMAINT_lsrecord;',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);

 END
END;
identtable:=othertreevarlist;
While STILLidents(identtable) DO
Begin
TAKEident(id,identtable);
BEGIN TFILES_writestring(cofpas1,
id.str,0,left);

;TFILES_writestr(cofpas1,
':LSSTREE_pStree;',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);

 END
END;
identtable:=righttreevarlist;
While STILLidents(identtable) DO
Begin
TAKEident(id,identtable);
BEGIN TFILES_writestring(cofpas1,
id.str,0,left);

;TFILES_writestr(cofpas1,
':LSSTREE_pStree;',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);

 END
END;
identtable:=othermuvarlist;
While STILLidents(identtable) DO
Begin
TAKEident(id,identtable);
BEGIN TFILES_writestring(cofpas1,
id.str,0,left);

;TFILES_writestr(cofpas1,
':LSMRUQUO_ListOfStrees;',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);

 END
END;
identtable:=rightmuvarlist;
While STILLidents(identtable) DO
Begin
TAKEident(id,identtable);
BEGIN TFILES_writestring(cofpas1,
id.str,0,left);

;TFILES_writestr(cofpas1,
':LSMRUQUO_ListOfStrees;',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);

 END
END;
identtable:=otherSigmavarlist;
While STILLidents(identtable) DO
Begin
TAKEident(id,identtable);
BEGIN TFILES_writestring(cofpas1,
id.str,0,left);

;TFILES_writestr(cofpas1,
':LSMRUQUO_ListOfStrees;',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);

 END
END;
identtable:=rightSigmavarlist;
While STILLidents(identtable) DO
Begin
TAKEident(id,identtable);
BEGIN TFILES_writestring(cofpas1,
id.str,0,left);

;TFILES_writestr(cofpas1,
':LSMRUQUO_ListOfStrees;',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);

 END
END;
identtable:=mergerecords;
REVERSESET(identtable,identtable);
While STILLidents(identtable) DO
Begin
TAKEident(id,identtable);
IF TSTRING_length(id.str)<>0 THEN
BEGIN
selectCatName(id.str,CatName);
BEGIN
TFILES_writestring(cofpas1,
id.str,0,left);

;TFILES_writestr(cofpas1,
':LSDOMAINT_',FILES_maxIO,0,left);

;
TFILES_writestring(cofpas1,
TLDStrToStr_cattorectype(CatName),0,left);

;
TFILES_writestr(cofpas1,
';',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);


END
END
END;
identtable:=rightrecords;
REVERSESET(identtable,identtable);
While STILLidents(identtable) DO
Begin
TAKEident(id,identtable);
IF TSTRING_length(id.str)<>0 THEN
BEGIN
selectCatName(id.str,CatName);
BEGIN 
TFILES_writestring(cofpas1,
id.str,0,left);

 TFILES_writestr(cofpas1,
':LSDOMAINT_',FILES_maxIO,0,left);

;
TFILES_writestring(cofpas1,
TLDStrToStr_cattorectype(CatName),0,left);

;
TFILES_writestr(cofpas1,
';',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);


END
END
END;

APPENDfile(commatchfilepar,cofpas1);
APPENDfile(rightcompar,cofpas1);
APPENDFILE(comactions,cofpas1);
IF NOT primitiverule THEN
appendfile(comsubrulespar,cofpas1);
TFILES_writestr(cofpas1,
'BEGIN',FILES_maxIO,0,left);

 TFILES_writeline(cofpas1,TRUE);

 
TFILES_writestr(cofpas1,
'result:=Is;',FILES_maxIO,0,left);

 TFILES_writeline(cofpas1,TRUE);


TFILES_writestr(cofpas1,
'm:=loopholes.retype(Is,LSSTREE_pstree);',FILES_maxIO,0,left);

 TFILES_writeline(cofpas1,TRUE);


TFILES_writestr(cofpas1,
'match:= TRUE;',FILES_maxIO,0,left);

 TFILES_writeline(cofpas1,TRUE);


TFILES_writestr(cofpas1,
'MatchModel(m,TRUE,match);',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);


modellabels1:=modellabels;
WHILE stillidents(modellabels1) DO
BEGIN
takeident(labelname,modellabels1);
IF EXTRACT(labelname.str,j) THEN
IF j=0 THEN
BEGIN
TAB(cofpas1,2);
TFILES_writestr(cofpas1,
'If match Then',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);


TAB(cofpas1,2);
TFILES_writestr(cofpas1,
'WHILE match AND NOT matchcondM DO',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);

 
TAB(cofpas1,2);
TFILES_writestr(cofpas1,
'BEGIN',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);


TAB(cofpas1,2);
TFILES_writestr(cofpas1,
'MatchModel(m,FALSE,match);',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);


TAB(cofpas1,2);
TFILES_writestr(cofpas1,
'END;',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);


END;
END;
TFILES_writestr(cofpas1,
' IF match THEN BEGIN',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);


IF primitiverule THEN
appendfile(comconditions,cofpas1)
ELSE
BEGIN
j:=0;
WHILE j<>numofsubfilters DO
BEGIN
j:=j+1;
TFILES_writestr(cofpas1,
' IF result<>NIL THEN SUBFILTER0X',FILES_maxIO,0,left);

 TFILES_writeinteger(cofpas1,
j,0,left);

 TFILES_writestr(cofpas1,
';',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);


END;
END;
TFILES_writestr(cofpas1,
' END;',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);


IF not positive THEN
BEGIN TFILES_writestr(cofpas1,
'COM',FILES_maxIO,0,left);

 TFILES_writestring(cofpas1,
rulenaam,0,left);

 TFILES_writestr(cofpas1,
':=result',FILES_maxIO,0,left);

 TFILES_writeline(cofpas1,TRUE);

 
END
ELSE
BEGIN TFILES_writestr(cofpas1,
'IF (result=NIL) THEN COM',FILES_maxIO,0,left);

 
TFILES_writestring(cofpas1,
rulenaam,0,left);

 TFILES_writestr(cofpas1,
':=Is',FILES_maxIO,0,left);

 TFILES_writeline(cofpas1,TRUE);


TFILES_writestr(cofpas1,
'ELSE COM',FILES_maxIO,0,left);

 TFILES_writestring(cofpas1,
rulenaam,0,left);

 TFILES_writestr(cofpas1,
':=NIL;',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);

 
END
END
ELSE
BEGIN
TFILES_writestr(cofpas1,
'BEGIN',FILES_maxIO,0,left);

TFILES_writeline(cofpas1,TRUE);


TFILES_writestr(cofpas1,
'COM',FILES_maxIO,0,left);

 TFILES_writestring(cofpas1,
rulenaam,0,left);

 TFILES_writestr(cofpas1,
':=Is;',FILES_maxIO,0,left);

 TFILES_writeline(cofpas1,TRUE);

 
END;
BEGIN TFILES_writestr(cofpas1,
'END;',FILES_maxIO,0,left);

 TFILES_writeline(cofpas1,TRUE);

 END;
BEGIN TFILES_writestr(cofpas1,
'{:',FILES_maxIO,0,left);

 TFILES_writestring(cofpas1,
rulenaam,0,left);

 TFILES_writestr(cofpas1,
'}',FILES_maxIO,0,left);

 TFILES_writeline(cofpas1,TRUE);

 END;
IF decompresent THEN
BEGIN 
BEGIN TFILES_writestr(decofpas1,
'VAR result:LISTREE_pStree;',FILES_maxIO,0,left);

 TFILES_writeline(decofpas1,TRUE);

 
{varpool1.GLOBAL.}
TFILES_writestr(decofpas1,
' m:LSSTREE_pstree;',FILES_maxIO,0,left);

 TFILES_writeline(decofpas1,TRUE);

 
TFILES_writestr(decofpas1,
' match:BOOLEAN;',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);

 
END;
TFILES_writestr(decofpas1,
' key1,key2,key3,key4,key5,key6,key7,key8,key9,key10:INTEGER;',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);


rightlevelids1:=rightlevelids;
WHILE stillidents(rightlevelids1) DO
BEGIN
takeident(id,rightlevelids1);
TFILES_writestr(decofpas1,
'Linit',FILES_maxIO,0,left);

 TFILES_writestring(decofpas1,
id.str,0,left);

 TFILES_writestr(decofpas1,
',Lrest',FILES_maxIO,0,left);

 TFILES_writestring(decofpas1,
id.str,0,left);


TFILES_writestr(decofpas1,
',Lfirst',FILES_maxIO,0,left);

 TFILES_writestring(decofpas1,
id.str,0,left);

 TFILES_writestr(decofpas1,
',Llast',FILES_maxIO,0,left);

 TFILES_writestring(decofpas1,
id.str,0,left);


TFILES_writestr(decofpas1,
':LSSTREE_prelnode;',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);


TFILES_writestr(decofpas1,
'i',FILES_maxIO,0,left);

 TFILES_writestring(decofpas1,
id.str,0,left);

 TFILES_writestr(decofpas1,
':INTEGER;',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);


TFILES_writestr(decofpas1,
'nomoretrees',FILES_maxIO,0,left);

 TFILES_writestring(decofpas1,
id.str,0,left);

 TFILES_writestr(decofpas1,
',lastmatch',FILES_maxIO,0,left);


TFILES_writestring(decofpas1,
id.str,0,left);

 TFILES_writestr(decofpas1,
':BOOLEAN;',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);


END;
identtable:=otherRelvarlist;
While STILLidents(identtable) DO
Begin
TAKEident(id,identtable);
BEGIN TFILES_writestring(decofpas1,
id.str,0,left);

;TFILES_writestr(decofpas1,
':LSDOMAINT_synrel;',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);

 END
END;
identtable:=rightrelvarlist;
WHILE STILLidents(identtable) DO
Begin
TAKEident(id,identtable);
BEGIN TFILES_writestring(decofpas1,
id.str,0,left);

 TFILES_writestr(decofpas1,
':LSDOMAINT_synrel;',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);

 END;
END;
identtable:=othernodevarlist;
While STILLidents(identtable) DO
Begin
TAKEident(id,identtable);
BEGIN TFILES_writestring(decofpas1,
id.str,0,left);

;TFILES_writestr(decofpas1,
':LSDOMAINT_lsrecord;',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);

 END
END;
identtable:=rightnodevarlist;
While STILLidents(identtable) DO
Begin
TAKEident(id,identtable);
BEGIN TFILES_writestring(decofpas1,
id.str,0,left);

;TFILES_writestr(decofpas1,
':LSDOMAINT_lsrecord;',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);

 END
END;
identtable:=othertreevarlist;
While STILLidents(identtable) DO
Begin
TAKEident(id,identtable);
BEGIN TFILES_writestring(decofpas1,
id.str,0,left);

;TFILES_writestr(decofpas1,
':LSSTREE_pStree;',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);

 END
END;
identtable:=righttreevarlist;
While STILLidents(identtable) DO
Begin
TAKEident(id,identtable);
BEGIN TFILES_writestring(decofpas1,
id.str,0,left);

;TFILES_writestr(decofpas1,
':LSSTREE_pStree;',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);

 END
END;
identtable:=othermuvarlist;
While STILLidents(identtable) DO
Begin
TAKEident(id,identtable);
BEGIN TFILES_writestring(decofpas1,
id.str,0,left);

;TFILES_writestr(decofpas1,
':LSMRUQUO_ListOfStrees;',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);

 END
END;
identtable:=rightmuvarlist;
While STILLidents(identtable) DO
Begin
TAKEident(id,identtable);
BEGIN TFILES_writestring(decofpas1,
id.str,0,left);

;TFILES_writestr(decofpas1,
':LSMRUQUO_ListOfStrees;',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);

 END
END;
identtable:=otherSigmavarlist;
While STILLidents(identtable) DO
Begin
TAKEident(id,identtable);
BEGIN TFILES_writestring(decofpas1,
id.str,0,left);

;TFILES_writestr(decofpas1,
':LSMRUQUO_ListOfStrees;',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);

 END
END;
identtable:=rightSigmavarlist;
While STILLidents(identtable) DO
Begin
TAKEident(id,identtable);
BEGIN TFILES_writestring(decofpas1,
id.str,0,left);

;TFILES_writestr(decofpas1,
':LSMRUQUO_ListOfStrees;',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);

 END
END;
identtable:=mergerecords;
REVERSESET(identtable,identtable);
While STILLidents(identtable) DO
Begin
TAKEident(id,identtable);
IF TSTRING_length(id.str)<>0 THEN
BEGIN
selectCatName(id.str,CatName);
BEGIN
TFILES_writestring(decofpas1,
id.str,0,left);

;TFILES_writestr(decofpas1,
':LSDOMAINT_',FILES_maxIO,0,left);

;
TFILES_writestring(decofpas1,
TLDStrToStr_cattorectype(CatName),0,left);

;
TFILES_writestr(decofpas1,
';',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);


END
END
END;
identtable:=rightrecords;
REVERSESET(identtable,identtable);
While STILLidents(identtable) DO
Begin
TAKEident(id,identtable);
IF TSTRING_length(id.str)<>0 THEN
BEGIN
selectCatName(id.str,CatName);
BEGIN 
TFILES_writestring(decofpas1,
id.str,0,left);

 TFILES_writestr(decofpas1,
':LSDOMAINT_',FILES_maxIO,0,left);

;
TFILES_writestring(decofpas1,
TLDStrToStr_cattorectype(CatName),0,left);

;
TFILES_writestr(decofpas1,
';',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);


END
END
END;

APPENDfile(decommatchfilepar,decofpas1);
APPENDfile(rightdecompar,decofpas1);
APPENDFILE(decomactions,decofpas1);
IF NOT primitiverule THEN
appendfile(decomsubrulespar,decofpas1);
TFILES_writestr(decofpas1,
'BEGIN',FILES_maxIO,0,left);

 TFILES_writeline(decofpas1,TRUE);

 
TFILES_writestr(decofpas1,
'result:=Is;',FILES_maxIO,0,left);

 TFILES_writeline(decofpas1,TRUE);


TFILES_writestr(decofpas1,
'm:=loopholes.retype(Is,LSSTREE_pstree);',FILES_maxIO,0,left);

 TFILES_writeline(decofpas1,TRUE);


TFILES_writestr(decofpas1,
'match:= TRUE;',FILES_maxIO,0,left);

 TFILES_writeline(decofpas1,TRUE);


TFILES_writestr(decofpas1,
'MatchModel(m,TRUE,match);',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);


modellabels1:=modellabels;
WHILE stillidents(modellabels1) DO
BEGIN
takeident(labelname,modellabels1);
IF EXTRACT(labelname.str,j) THEN
IF j=0 THEN
BEGIN
TAB(decofpas1,2);
TFILES_writestr(decofpas1,
'If match Then',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);


TAB(decofpas1,2);
TFILES_writestr(decofpas1,
'WHILE match AND NOT matchcondM DO',FILES_maxIO,0,left);

 TFILES_writeline(decofpas1,TRUE);

 
TAB(decofpas1,2);
TFILES_writestr(decofpas1,
'BEGIN',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);


TAB(decofpas1,2);
TFILES_writestr(decofpas1,
'MatchModel(m,FALSE,match);',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);


TAB(decofpas1,2);
TFILES_writestr(decofpas1,
'END;',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);


END;
END;
TFILES_writestr(decofpas1,
' IF match THEN BEGIN',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);


IF primitiverule THEN
appendfile(decomconditions,decofpas1)
ELSE
BEGIN
j:=0;
WHILE j<>numofsubfilters DO
BEGIN
j:=j+1;
TFILES_writestr(decofpas1,
' IF result<>NIL THEN SUBFILTER0X',FILES_maxIO,0,left);

 TFILES_writeinteger(decofpas1,
j,0,left);

 TFILES_writestr(decofpas1,
';',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);


END;
END;
TFILES_writestr(decofpas1,
' END;',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);


IF not positive THEN
BEGIN TFILES_writestr(decofpas1,
'DEC',FILES_maxIO,0,left);

 TFILES_writestring(decofpas1,
rulenaam,0,left);

 TFILES_writestr(decofpas1,
':=result',FILES_maxIO,0,left);

 TFILES_writeline(decofpas1,TRUE);

 
END
ELSE
BEGIN TFILES_writestr(decofpas1,
'IF (result=NIL) THEN DEC',FILES_maxIO,0,left);

 
TFILES_writestring(decofpas1,
rulenaam,0,left);

 TFILES_writestr(decofpas1,
':=Is',FILES_maxIO,0,left);

 TFILES_writeline(decofpas1,TRUE);


TFILES_writestr(decofpas1,
'ELSE DEC',FILES_maxIO,0,left);

 TFILES_writestring(decofpas1,
rulenaam,0,left);

 TFILES_writestr(decofpas1,
':=NIL;',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);

 
END
END
ELSE
BEGIN
TFILES_writestr(decofpas1,
'BEGIN',FILES_maxIO,0,left);

TFILES_writeline(decofpas1,TRUE);


TFILES_writestr(decofpas1,
'DEC',FILES_maxIO,0,left);

 TFILES_writestring(decofpas1,
rulenaam,0,left);

 TFILES_writestr(decofpas1,
':=Is;',FILES_maxIO,0,left);

 TFILES_writeline(decofpas1,TRUE);

 
END;
BEGIN TFILES_writestr(decofpas1,
'END;',FILES_maxIO,0,left);

 TFILES_writeline(decofpas1,TRUE);

 END;
BEGIN TFILES_writestr(decofpas1,
'{:',FILES_maxIO,0,left);

 TFILES_writestring(decofpas1,
rulenaam,0,left);

 TFILES_writestr(decofpas1,
'}',FILES_maxIO,0,left);

 TFILES_writeline(decofpas1,TRUE);

 END;
END
END;
PROCEDURE mrucomCODE_LEFTMODELSproc(top:mrucomDECL_psnode
;LEFTMODELS_name              :TSTRING_string
;LEFTMODELS_righttolefttable              :mrucomlangspec_setofidents
;var LEFTMODELS_leftcom              :LOCALFILE
;var LEFTMODELS_leftdecom              :LOCALFILE
;var LEFTMODELS_dtreeproc              :LOCALFILE
;var LEFTMODELS_levelids              :mrucomlangspec_setofidents
);
VAR currenttree:mrucomDECL_psnode;
    rsnode1:mrucomDECL_prsnode;
 dtreeproc,leftcom,leftdecom:LOCALFILE;
minnum,maxnum: mrucomLANGSPEC_INT;
levelids: mrucomLANGSPEC_setofidents;
relationlist: mrucomLANGSPEC_setofidents;
numberofitems,indent,modelnumber:Integer;
righttolefttable: mrucomLANGSPEC_setofidents;
id: mrucomLANGSPEC_ident;
name:TSTRING_string;
relationname: mrucomLANGSPEC_ident;
i,j:integer;
keymentioned,keyvar: mrucomLANGSPEC_bool;
recordname,treevarname,nodevarname,category,keystr1,keystr2:TSTRING_string;
 PROCEDURE APPENDSETS(S1: mrucomLANGSPEC_SETOFidents;VAR S2: mrucomLANGSPEC_SETOFidents);
VAR ident1: mrucomLANGSPEC_ident;
BEGIN
WHILE STILLidents(S1) DO
BEGIN
TAKEident(ident1,S1);
APPENDident(ident1,S2)
END
END;
BEGIN
 BEGIN name:=LEFTMODELS_name;
TSTRING_constantempty(relationname.str);
minnum:=0;maxnum:=0;
INITsetofidents(relationlist);
modelnumber:=1;
indent:=0;
initsetofidents(levelids);
Initlocalfile(leftdecom);
InitLOCALFILE(leftcom);
InitLOCALFILE(dtreeproc);
righttolefttable:=LEFTMODELS_righttolefttable;
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
  BEGIN
BEGIN  END;
BEGIN
appendstring('PROCEDURE MatchModel',leftcom);
;appendstring(mrucomDECL_convinttostring(modelnumber),leftcom);
;
appendstring('(VAR s:LSSTREE_pStree;',leftcom);

appendstring('first:BOOLEAN;VAR match:Boolean);',leftcom);
appendstring('\\',leftcom);

END;
IF NOT(currenttree^.ldfield.LABELEDTDfield^.containsTi) THEN
BEGIN
relationlist:=currenttree^.ldfield.LABELEDTDfield^.relationlist;
appendstring('VAR',leftcom);
appendstring('\\',leftcom);

LOCALTAB(leftcom,2);
appendstring('lisons:LISTREE_pRelnode;',leftcom);
appendstring('\\',leftcom);

i:=0;
WHILE stillidents(relationlist) DO
BEGIN
takeident(relationname,relationlist);
i:=i+1;
LOCALTAB(leftcom,2);
appendstring('lirel',leftcom);
 appendstring(mrucomDECL_convinttostring(i),leftcom);
 appendstring(':LIDOMAINT_synrel;',leftcom);
appendstring('\\',leftcom);

LOCALTAB(leftcom,2);
appendstring('lsrel',leftcom);
 appendstring(mrucomDECL_convinttostring(i),leftcom);
 appendstring(':LSDOMAINT_synrel;',leftcom);
appendstring('\\',leftcom);

END;
j:=i; IF i>4 THEN j:=4;
LABELEDTD__indent:=indent+2;
LABELEDTD__submodeltree:=FALSE;
LABELEDTD__righttolefttable:=righttolefttable;
END;
LABELEDTD__name:=name;
LABELEDTD__root:=currenttree^.ldfield.LABELEDTDfield^.rhslabel.str;
END
; mrucomCODE_LABELEDTDproc(currenttree
,LABELEDTD__indent
,LABELEDTD__name
,LABELEDTD__submodeltree
,LABELEDTD__righttolefttable
,LABELEDTD__root
,LABELEDTD__leftcom
,LABELEDTD__rightcom
,LABELEDTD__dtreeproc
,LABELEDTD__numberofitems
,LABELEDTD__keymentioned
,LABELEDTD__keyvar
,LABELEDTD__keystr1
,LABELEDTD__keystr2
,LABELEDTD__levelids
);
 BEGIN
appendlocfile(LABELEDTD__dtreeproc,dtreeproc);
appendsets(LABELEDTD__levelids,levelids);
AppendLocFile(LABELEDTD__leftcom,leftcom);
numberofitems:=LABELEDTD__numberofitems;
relationlist:=currenttree^.ldfield.LABELEDTDfield^.relationlist;
minnum:=currenttree^.ldfield.LABELEDTDfield^.minnum;
maxnum:=currenttree^.ldfield.LABELEDTDfield^.maxnum;
recordname:=currenttree^.ldfield.LABELEDTDfield^.recordname;
IF (NOT currenttree^.ldfield.LABELEDTDfield^.containsTi) THEN
BEGIN{normal case}
appendstring('VAR lastmatch:BOOLEAN;',leftcom);
appendstring('\\',leftcom);

appendstring('BEGIN{matchmodel}',leftcom);

IF currenttree^.ldfield.LABELEDTDfield^.basiccat AND (TSTRING_length(recordname)<>0) THEN
BEGIN
appendstring(recordname,leftcom);
 appendstring('tree:=s;',leftcom);
appendstring('\\',leftcom);

END;
IF (maxnum<100) OR (minnum>0) THEN
BEGIN
appendstring('IF first THEN match:= ',leftcom);

IF minnum>0 THEN 
BEGIN appendstring('(s^.li^.n >=',leftcom);
 appendstring(mrucomDECL_convinttostring(minnum),leftcom);

appendstring(')',leftcom);
 END;
IF (maxnum<100) AND (minnum>0) THEN appendstring(' AND ',leftcom);

IF (maxnum<100) THEN BEGIN
appendstring('(s^.li^.n <=',leftcom);
 appendstring(mrucomDECL_convinttostring(maxnum),leftcom);
 appendstring(')',leftcom);
 END;
appendstring('ELSE BEGIN match:=TRUE;lastmatch:=TRUE END;',leftcom);

appendstring('IF match THEN',leftcom);
 appendstring('\\',leftcom);

END;
appendstring('LSMATCHES_matchtreeVar',leftcom);
 
appendstring(mrucomDECL_convinttostring(j),leftcom);
 appendstring('rels(',leftcom);

appendstring('s,first',leftcom);
 
i:=0;
WHILE stillidents(relationlist) AND (i<4) DO BEGIN
i:=i+1;
takeident(relationname,relationlist);
appendstring(',',leftcom);
 appendstring(relationname.str,leftcom);

END;
appendstring(',match,matchnode,matchlist',leftcom);
 appendstring(mrucomDECL_convinttostring(numberofitems),leftcom);
 appendstring('items',leftcom);

appendstring(',lastmatch) END;',leftcom);
appendstring('\\',leftcom);

END;{normal case}
IF FALSE {NOT(currenttree^.ldfield.LABELEDTDfield^.containsTi)} THEN
BEGIN
BEGIN  END;
appendstring('BEGIN{matchmodel}',leftcom);
appendstring('\\',leftcom);

LOCALTAB(leftcom,indent+4);
appendstring('IF first THEN',leftcom);
appendstring('\\',leftcom);

LOCALTAB(leftcom,indent+4);
appendstring('BEGIN',leftcom);
appendstring('\\',leftcom);

LOCALTAB(leftcom,indent+6);
appendstring('MatchNode(s,match);',leftcom);
appendstring('\\',leftcom);

IF currenttree^.ldfield.LABELEDTDfield^.basiccat AND (TSTRING_length(recordname)<>0) THEN
BEGIN
LOCALTAB(leftcom,indent+6);
appendstring(recordname,leftcom);
 appendstring('tree:=s;',leftcom);
appendstring('\\',leftcom);

END;
IF (maxnum<100) OR (minnum>0) THEN
BEGIN
LOCALTAB(leftcom,indent+4); appendstring('IF match THEN',leftcom);
appendstring('\\',leftcom);

LOCALTAB(leftcom,indent+6);
appendstring('match:= ',leftcom);

IF minnum>0 THEN 
BEGIN appendstring('(s^.li^.n >=',leftcom);
 appendstring(mrucomDECL_convinttostring(minnum),leftcom);

appendstring(')',leftcom);
 END;
IF (maxnum<100) AND (minnum>0) THEN appendstring(' AND ',leftcom);

IF (maxnum<100) THEN BEGIN
appendstring('(s^.li^.n <=',leftcom);
 appendstring(mrucomDECL_convinttostring(maxnum),leftcom);
 appendstring(')',leftcom);
 END;
appendstring(';',leftcom);
 appendstring('\\',leftcom);

END;
LOCALTAB(leftcom,indent+4);
appendstring('IF match THEN',leftcom);
appendstring('\\',leftcom);

LOCALTAB(leftcom,indent+6);
appendstring('BEGIN',leftcom);
appendstring('\\',leftcom);

i:=0;
WHILE stillidents(relationlist) DO
BEGIN
i:=i+1;
takeident(relationname,relationlist);
LOCALTAB(leftcom,indent+6);
appendstring('lsrel',leftcom);
 appendstring(mrucomDECL_convinttostring(i),leftcom);
 appendstring(':=',leftcom);
 
appendstring(relationname.str,leftcom);
 appendstring(';',leftcom);
appendstring('\\',leftcom);

LOCALTAB(leftcom,indent+6);
appendstring('lirel',leftcom);
 appendstring(mrucomDECL_convinttostring(i),leftcom);
 appendstring(':= loopholes.retype(lsrel',leftcom);
 
appendstring(mrucomDECL_convinttostring(i),leftcom);
 appendstring(',LIDOMAINT_synrel);',leftcom);
appendstring('\\',leftcom);

END;
IF (j<>0) THEN
BEGIN
LOCALTAB(leftcom,indent+6);
appendstring('lisons:=loopholes.retype(s^.sons,LISTREE_pRelnode);',leftcom);
appendstring('\\',leftcom);

LOCALTAB(leftcom,indent+6);
appendstring('match:= LIMATCHES_TEST',leftcom);
 appendstring(mrucomDECL_convinttostring(j),leftcom);
 appendstring('rels(',leftcom);

i:=0;
WHILE i<>j DO
BEGIN
i:=i+1;
appendstring('lirel',leftcom);
 appendstring(mrucomDECL_convinttostring(i),leftcom);
 appendstring(',',leftcom);

END;
appendstring('lisons,FALSE);',leftcom);
appendstring('\\',leftcom);

END;
LOCALTAB(leftcom,indent+6);
appendstring('END;',leftcom);
appendstring('\\',leftcom);

LOCALTAB(leftcom,indent+6);
appendstring('IF match THEN',leftcom);
appendstring('\\',leftcom);

LOCALTAB(leftcom,indent+6);
appendstring('BEGIN',leftcom);
appendstring('\\',leftcom);

LOCALTAB(leftcom,indent+8);
appendstring('MatchList',leftcom);
 appendstring(mrucomDECL_convinttostring(NumberOfItems),leftcom);
 appendstring('Items(s^.sons,TRUE,match);',leftcom);
appendstring('\\',leftcom);

LOCALTAB(leftcom,indent+6);
appendstring('END',leftcom);
appendstring('\\',leftcom);

LOCALTAB(leftcom,indent+4);
appendstring('END',leftcom);
appendstring('\\',leftcom);

BEGIN  END;
BEGIN
LOCALTAB(leftcom,indent+4);
appendstring('ELSE',leftcom);
appendstring('\\',leftcom);

LOCALTAB(leftcom,indent+6);
appendstring('BEGIN',leftcom);
appendstring('\\',leftcom);

LOCALTAB(leftcom,indent+8);
appendstring('MatchList',leftcom);
;appendstring(mrucomDECL_convinttostring(NumberOfItems),leftcom);
;appendstring('Items(s^.sons,FALSE,match);',leftcom);
appendstring('\\',leftcom);

LOCALTAB(leftcom,indent+6);
appendstring('END',leftcom);
appendstring('\\',leftcom);

END;
appendstring('END;{matchmodel}',leftcom);
appendstring('\\',leftcom);

END;
nodevarname:=currenttree^.ldfield.LABELEDTDfield^.nodevarname;
treevarname:=currenttree^.ldfield.LABELEDTDfield^.treevarname;
category:=currenttree^.ldfield.LABELEDTDfield^.category;
IF currenttree^.ldfield.LABELEDTDfield^.containsTi THEN
BEGIN

appendstring('BEGIN{matchmodel}',leftcom);
appendstring('\\',leftcom);

appendstring(treevarname,leftcom);
 appendstring(':=s;',leftcom);
appendstring('\\',leftcom);

appendstring('match:=first;',leftcom);
appendstring('\\',leftcom);

appendstring('END;{matchmodel}',leftcom);
appendstring('\\',leftcom);

END;
BEGIN  END;
appendstring('PROCEDURE createM',leftdecom);
 appendstring(mrucomDECL_convinttostring(modelnumber),leftdecom);
 appendstring(';',leftdecom);
appendstring('\\',leftdecom);

appendstring('VAR list:LSMRUQUO_ListOfStrees;',leftdecom);
appendstring('\\',leftdecom);

APPENDlocfile(LABELEDTD__rightcom,leftdecom);
appendstring('BEGIN{createM}',leftdecom);
appendstring('\\',leftdecom);

keymentioned:=LABELEDTD__keymentioned;
keyvar:=LABELEDTD__keyvar;
keystr1:=LABELEDTD__keystr1;
keystr2:=LABELEDTD__keystr2;
IF keymentioned THEN
BEGIN
appendstring('m',leftdecom);
 appendstring(mrucomDECL_convinttostring(modelnumber),leftdecom);
 appendstring(':=',leftdecom);

appendstring(recordname,leftdecom);
 appendstring('tree;',leftdecom);
appendstring('\\',leftdecom);

END
ELSE 
IF currenttree^.ldfield.LABELEDTDfield^.basiccat THEN
BEGIN
IF TSTRING_comparechars(category,'GLUE',4)<>0 THEN
BEGIN
appendstring('m',leftdecom);
 appendstring(mrucomDECL_convinttostring(modelnumber),leftdecom);
 appendstring(':=',leftdecom);

appendstring(recordname,leftdecom);
 appendstring('tree;',leftdecom);
appendstring('\\',leftdecom);

END
ELSE
BEGIN
appendstring('m',leftdecom);
 appendstring(mrucomDECL_convinttostring(modelnumber),leftdecom);
 appendstring(':=MAKET_stree(GLUE);',leftdecom);
appendstring('\\',leftdecom);

END
END
ELSE
BEGIN
IF (TSTRING_length(category)<>0) THEN
BEGIN
IF currenttree^.ldfield.LABELEDTDfield^.noderiv THEN
BEGIN
appendstring('m',leftdecom);
 appendstring(mrucomDECL_convinttostring(modelnumber),leftdecom);
 
appendstring(':=MAKET_stree(',leftdecom);
 appendstring(category,leftdecom);
 appendstring(');',leftdecom);
appendstring('\\',leftdecom);

END;
IF TSTRING_comparechars(category,'GLUE',4)<>0 THEN
BEGIN
appendstring('createnode(m',leftdecom);
 appendstring(mrucomDECL_convinttostring(modelnumber),leftdecom);
 
appendstring(');',leftdecom);
appendstring('\\',leftdecom);

END;
IF currenttree^.ldfield.LABELEDTDfield^.noderiv THEN 
BEGIN
appendstring('createlist1(list);',leftdecom);
appendstring('\\',leftdecom);

appendstring('IF list.first<>NIL THEN list.last^.brother:=NIL;',leftdecom);
appendstring('\\',leftdecom);

appendstring('m',leftdecom);
 appendstring(mrucomDECL_convinttostring(modelnumber),leftdecom);

appendstring('^.li^.n:=numberofelements(list);',leftdecom);
appendstring('\\',leftdecom);

appendstring('m',leftdecom);
 appendstring(mrucomDECL_convinttostring(modelnumber),leftdecom);
 
appendstring('^.sons:=list.first;',leftdecom);
appendstring('\\',leftdecom);

END;
END
ELSE
BEGIN
IF TSTRING_length(treevarname)<>0 THEN
BEGIN
appendstring('m',leftdecom);
 appendstring(mrucomDECL_convinttostring(modelnumber),leftdecom);
 appendstring(':=',leftdecom);
 
appendstring(treevarname,leftdecom);
 appendstring(';',leftdecom);
appendstring('\\',leftdecom);

END
ELSE
BEGIN
appendstring('m',leftdecom);
 appendstring(mrucomDECL_convinttostring(modelnumber),leftdecom);
 appendstring(':=MAKET_stree(',leftdecom);

appendstring(nodevarname,leftdecom);
 appendstring('.cat);',leftdecom);
appendstring('\\',leftdecom);

appendstring('m',leftdecom);
 appendstring(mrucomDECL_convinttostring(modelnumber),leftdecom);

appendstring('^.ls^:=',leftdecom);
 appendstring(nodevarname,leftdecom);
 appendstring(';',leftdecom);
appendstring('\\',leftdecom);

IF currenttree^.ldfield.LABELEDTDfield^.noderiv THEN
BEGIN
appendstring('createlist1(list);',leftdecom);
appendstring('\\',leftdecom);

appendstring('IF list.first<>NIL THEN list.last^.brother:=NIL;',leftdecom);
appendstring('\\',leftdecom);

appendstring('m',leftdecom);
 appendstring(mrucomDECL_convinttostring(modelnumber),leftdecom);

appendstring('^.li^.n:=numberofelements(list);',leftdecom);
appendstring('\\',leftdecom);

appendstring('m',leftdecom);
 appendstring(mrucomDECL_convinttostring(modelnumber),leftdecom);
 
appendstring('^.sons:=list.first;',leftdecom);
appendstring('\\',leftdecom);

END;
END
END;
END;
appendstring('END{createM};',leftdecom);
appendstring('\\',leftdecom);

modelnumber:=modelnumber+1; 
END
END;

3: begin
  BEGIN END
;
 BEGIN END
END;

END;

rsnode1:=rsnode1^.brother END;
BEGIN
LEFTMODELS_levelids:=levelids;
LEFTMODELS_dtreeproc:=dtreeproc;
LEFTMODELS_leftcom:=leftcom;
LEFTMODELS_leftdecom:=leftdecom;
END
END;
PROCEDURE mrucomCODE_RIGHTMODELproc(top:mrucomDECL_psnode
;RIGHTMODEL_name              :TSTRING_string
;RIGHTMODEL_righttolefttable              :mrucomlangspec_setofidents
;var RIGHTMODEL_rightcom              :LOCALFILE
;var RIGHTMODEL_rightdecom              :LOCALFILE
;var RIGHTMODEL_dtreeproc              :LOCALFILE
;var RIGHTMODEL_levelids              :mrucomlangspec_setofidents
;var RIGHTMODEL_dtreelevelids              :mrucomlangspec_setofidents
);
VAR currenttree:mrucomDECL_psnode;
    rsnode1:mrucomDECL_prsnode;
 
righttolefttable: mrucomLANGSPEC_setofidents;
dtreeproc,extern,rightcom,rightdecom:LOCALFILE;
keymentioned,keyvar: mrucomLANGSPEC_bool;
j,i,minnum,maxnum,numberofitems: mrucomLANGSPEC_int;
dtreelevelids,relationlist,levelids: mrucomLANGSPEC_setofidents;
id: mrucomLANGSPEC_ident;
relationname: mrucomLANGSPEC_ident;
name,str,treevarname,recordname,nodevarname,category,keystr1,keystr2:TSTRING_string;
BEGIN
 BEGIN initsetofidents(levelids);
initsetofidents(dtreelevelids);
initsetofidents(relationlist);
initlocalfile(extern);
initlocalfile(dtreeproc);
INITlocalfile(rightdecom);
INITlocalfile(rightcom);
righttolefttable:=RIGHTMODEL_righttolefttable;
name:=RIGHTMODEL_name;
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
  BEGIN
nodevarname:=currenttree^.ldfield.LABELEDTDfield^.nodevarname;
treevarname:=currenttree^.ldfield.LABELEDTDfield^.treevarname;
category:=currenttree^.ldfield.LABELEDTDfield^.category;
LABELEDTD__submodeltree:=FALSE;
LABELEDTD__righttolefttable:=righttolefttable;
BEGIN  END;
BEGIN
appendstring('PROCEDURE MatchModel',rightdecom);

appendstring('(VAR s:LSSTREE_pStree;',rightdecom);

appendstring('first:BOOLEAN;VAR match:Boolean);',rightdecom);
appendstring('\\',rightdecom);

END;
relationlist:=currenttree^.ldfield.LABELEDTDfield^.relationlist;
IF NOT(currenttree^.ldfield.LABELEDTDfield^.containsTi) THEN
BEGIN
appendstring('VAR',rightdecom);
appendstring('\\',rightdecom);

LOCALTAB(rightdecom,2);
appendstring('lisons:LISTREE_pRelnode;',rightdecom);
appendstring('\\',rightdecom);

i:=0;
WHILE stillidents(relationlist) DO
BEGIN
takeident(relationname,relationlist);
i:=i+1;
LOCALTAB(rightdecom,2);
appendstring('lirel',rightdecom);
 appendstring(mrucomDECL_convinttostring(i),rightdecom);
 appendstring(':LIDOMAINT_synrel;',rightdecom);
appendstring('\\',rightdecom);

LOCALTAB(rightdecom,2);
appendstring('lsrel',rightdecom);
 appendstring(mrucomDECL_convinttostring(i),rightdecom);
 appendstring(':LSDOMAINT_synrel;',rightdecom);
appendstring('\\',rightdecom);

END;
j:=i; IF i>4 THEN j:=4;
LABELEDTD__indent:=2;
END;
LABELEDTD__name:=name;
LABELEDTD__root:=currenttree^.ldfield.LABELEDTDfield^.rhslabel.str;
END
; mrucomCODE_LABELEDTDproc(currenttree
,LABELEDTD__indent
,LABELEDTD__name
,LABELEDTD__submodeltree
,LABELEDTD__righttolefttable
,LABELEDTD__root
,LABELEDTD__leftcom
,LABELEDTD__rightcom
,LABELEDTD__dtreeproc
,LABELEDTD__numberofitems
,LABELEDTD__keymentioned
,LABELEDTD__keyvar
,LABELEDTD__keystr1
,LABELEDTD__keystr2
,LABELEDTD__levelids
);
 BEGIN appendlocfile(LABELEDTD__dtreeproc,dtreeproc);
levelids:=LABELEDTD__levelids;
AppendLocFile(LABELEDTD__leftcom,rightdecom);
numberofitems:=LABELEDTD__numberofitems;
relationlist:=currenttree^.ldfield.LABELEDTDfield^.relationlist;
minnum:=currenttree^.ldfield.LABELEDTDfield^.minnum;
maxnum:=currenttree^.ldfield.LABELEDTDfield^.maxnum;
recordname:=currenttree^.ldfield.LABELEDTDfield^.recordname;
BEGIN  END;
IF (NOT currenttree^.ldfield.LABELEDTDfield^.containsTi) THEN
BEGIN{normal case}
appendstring('VAR lastmatch:BOOLEAN;',rightdecom);
appendstring('\\',rightdecom);

appendstring('BEGIN{matchmodel}',rightdecom);
appendstring('\\',rightdecom);

IF currenttree^.ldfield.LABELEDTDfield^.basiccat AND (TSTRING_length(recordname)<>0) THEN
BEGIN
appendstring(recordname,rightdecom);
 appendstring('tree:=s;',rightdecom);
appendstring('\\',rightdecom);

END;
IF (maxnum<100) OR (minnum>0) THEN
BEGIN
appendstring('IF first THEN match:= ',rightdecom);

IF minnum>0 THEN 
BEGIN appendstring('(s^.li^.n >=',rightdecom);
 appendstring(mrucomDECL_convinttostring(minnum),rightdecom);

appendstring(')',rightdecom);
 END;
IF (maxnum<100) AND (minnum>0) THEN appendstring(' AND ',rightdecom);

IF (maxnum<100) THEN BEGIN
appendstring('(s^.li^.n <=',rightdecom);
 appendstring(mrucomDECL_convinttostring(maxnum),rightdecom);
 appendstring(')',rightdecom);
 END;
appendstring('ELSE BEGIN match:=TRUE;lastmatch:=TRUE END;',rightdecom);
appendstring('\\',rightdecom);

appendstring('IF match THEN',rightdecom);
 appendstring('\\',rightdecom);

END;
appendstring('LSMATCHES_matchtreeVar',rightdecom);
 
appendstring(mrucomDECL_convinttostring(j),rightdecom);
 appendstring('rels(',rightdecom);

appendstring('s,first',rightdecom);
 
i:=0;
WHILE stillidents(relationlist) AND (i<4) DO BEGIN
i:=i+1;
takeident(relationname,relationlist);
appendstring(',',rightdecom);
 appendstring(relationname.str,rightdecom);

END;
appendstring(',match,matchnode,matchlist',rightdecom);
 appendstring(mrucomDECL_convinttostring(numberofitems),rightdecom);
 appendstring('items',rightdecom);

appendstring(',lastmatch) END;',rightdecom);
appendstring('\\',rightdecom);

END;{normal case}
IF FALSE {NOT(currenttree^.ldfield.LABELEDTDfield^.containsTi)} THEN
BEGIN
appendstring('BEGIN{matchmodel}',rightdecom);
appendstring('\\',rightdecom);

LOCALTAB(rightdecom,4);
appendstring('IF first THEN',rightdecom);
appendstring('\\',rightdecom);

LOCALTAB(rightdecom,4);
appendstring('BEGIN',rightdecom);
appendstring('\\',rightdecom);

LOCALTAB(rightdecom,6);
appendstring(' MatchNode(s,match);',rightdecom);
appendstring('\\',rightdecom);

IF currenttree^.ldfield.LABELEDTDfield^.basiccat AND (TSTRING_length(recordname)<>0) THEN
BEGIN
appendstring(recordname,rightdecom);
 appendstring('tree:=s;',rightdecom);
appendstring('\\',rightdecom);

END;
IF (maxnum<100) OR (minnum>0) THEN
BEGIN
LOCALTAB(rightdecom,4); appendstring('IF match THEN',rightdecom);
appendstring('\\',rightdecom);

LOCALTAB(rightdecom,6);
appendstring('match:= ',rightdecom);

IF minnum>0 THEN 
BEGIN appendstring('(s^.li^.n >=',rightdecom);
 appendstring(mrucomDECL_convinttostring(minnum),rightdecom);

appendstring(')',rightdecom);
 END;
IF (maxnum<100) AND (minnum>0) THEN appendstring(' AND ',rightdecom);

IF (maxnum<100) THEN BEGIN
appendstring('(s^.li^.n <=',rightdecom);
 appendstring(mrucomDECL_convinttostring(maxnum),rightdecom);
 appendstring(')',rightdecom);
 END;
appendstring(';',rightdecom);
 appendstring('\\',rightdecom);

END;
LOCALTAB(rightdecom,4);
appendstring('IF match THEN',rightdecom);
appendstring('\\',rightdecom);

LOCALTAB(rightdecom,6);
appendstring('BEGIN',rightdecom);
appendstring('\\',rightdecom);

i:=0;
WHILE stillidents(relationlist) DO
BEGIN
i:=i+1;
takeident(relationname,relationlist);
LOCALTAB(rightdecom,6);
appendstring('lsrel',rightdecom);
 appendstring(mrucomDECL_convinttostring(i),rightdecom);
 appendstring(':=',rightdecom);
 
appendstring(relationname.str,rightdecom);
 appendstring(';',rightdecom);
appendstring('\\',rightdecom);

LOCALTAB(rightdecom,6);
appendstring('lirel',rightdecom);
 appendstring(mrucomDECL_convinttostring(i),rightdecom);
 appendstring(':= loopholes.retype(lsrel',rightdecom);
 
appendstring(mrucomDECL_convinttostring(i),rightdecom);
 appendstring(',LIDOMAINT_synrel);',rightdecom);
appendstring('\\',rightdecom);

END;
IF (j<>0) THEN
BEGIN
LOCALTAB(rightdecom,6);
appendstring('lisons:=loopholes.retype(s^.sons,LISTREE_pRelnode);',rightdecom);
appendstring('\\',rightdecom);

LOCALTAB(rightdecom,6);
appendstring('match:= LIMATCHES_TEST',rightdecom);
 appendstring(mrucomDECL_convinttostring(j),rightdecom);
 appendstring('rels(',rightdecom);

i:=0;
WHILE i<>j DO
BEGIN
i:=i+1;
appendstring('lirel',rightdecom);
 appendstring(mrucomDECL_convinttostring(i),rightdecom);
 appendstring(',',rightdecom);

END;
appendstring('lisons,FALSE);',rightdecom);
appendstring('\\',rightdecom);

END;
LOCALTAB(rightdecom,6);
appendstring('END;',rightdecom);
appendstring('\\',rightdecom);

LOCALTAB(rightdecom,6);
appendstring('IF match THEN',rightdecom);
appendstring('\\',rightdecom);

LOCALTAB(rightdecom,6);
appendstring('BEGIN',rightdecom);
appendstring('\\',rightdecom);

LOCALTAB(rightdecom,8);
appendstring('MatchList',rightdecom);
 appendstring(mrucomDECL_convinttostring(NumberOfItems),rightdecom);
 appendstring('Items(s^.sons,TRUE,match);',rightdecom);
appendstring('\\',rightdecom);

LOCALTAB(rightdecom,6);
appendstring('END',rightdecom);
appendstring('\\',rightdecom);

LOCALTAB(rightdecom,4);
appendstring('END',rightdecom);
appendstring('\\',rightdecom);

BEGIN  END;
BEGIN
LOCALTAB(rightdecom,4);
appendstring('ELSE',rightdecom);
appendstring('\\',rightdecom);

LOCALTAB(rightdecom,6);
appendstring('BEGIN',rightdecom);
appendstring('\\',rightdecom);

LOCALTAB(rightdecom,8);
appendstring('MatchList',rightdecom);
;appendstring(mrucomDECL_convinttostring(NumberOfItems),rightdecom);
;appendstring('Items(s^.sons,FALSE,match);',rightdecom);
appendstring('\\',rightdecom);

LOCALTAB(rightdecom,6);
appendstring('END',rightdecom);
appendstring('\\',rightdecom);

END;
appendstring('END;{matchmodel}',rightdecom);
appendstring('\\',rightdecom);

END;
IF currenttree^.ldfield.LABELEDTDfield^.containsTi THEN
BEGIN

appendstring('BEGIN{matchmodel}',rightdecom);
appendstring('\\',rightdecom);

appendstring(treevarname,rightdecom);
 appendstring(':=s;',rightdecom);
appendstring('\\',rightdecom);

appendstring('match:=first;',rightdecom);
appendstring('\\',rightdecom);

appendstring('END;{matchmodel}',rightdecom);
appendstring('\\',rightdecom);

END;
BEGIN  END;
appendstring('PROCEDURE createM;',rightcom);
appendstring('\\',rightcom);

appendstring('VAR list:LSMRUQUO_ListOfStrees;',rightcom);
appendstring('\\',rightcom);

APPENDlocfile(LABELEDTD__rightcom,rightcom);
appendstring('BEGIN{createM}',rightcom);
appendstring('\\',rightcom);

keymentioned:=LABELEDTD__keymentioned;
keyvar:=LABELEDTD__keyvar;
keystr1:=LABELEDTD__keystr1;
keystr2:=LABELEDTD__keystr2;
recordname:=currenttree^.ldfield.LABELEDTDfield^.recordname;
IF keymentioned THEN
BEGIN
appendstring('m:=',rightcom);
 appendstring(recordname,rightcom);
 appendstring('tree;',rightcom);
appendstring('\\',rightcom);

END
ELSE
IF currenttree^.ldfield.LABELEDTDfield^.basiccat THEN
BEGIN
IF TSTRING_comparechars(category,'GLUE',4)<>0 THEN
BEGIN
appendstring('m := ',rightcom);

appendstring(recordname,rightcom);
 appendstring('tree;',rightcom);
appendstring('\\',rightcom);

END
ELSE
BEGIN
appendstring('m := MAKET_stree(GLUE);',rightcom);
appendstring('\\',rightcom);

END
END
ELSE
BEGIN
IF (TSTRING_length(category)<>0) THEN
BEGIN
IF currenttree^.ldfield.LABELEDTDfield^.noderiv THEN
BEGIN
appendstring('m:=MAKET_stree(',rightcom);
 appendstring(category,rightcom);
 appendstring(');',rightcom);
appendstring('\\',rightcom);

END;
IF TSTRING_comparechars(category,'GLUE',4)<>0 THEN
BEGIN
appendstring('createnode(m);',rightcom);
appendstring('\\',rightcom);

END;
IF currenttree^.ldfield.LABELEDTDfield^.noderiv THEN
BEGIN
appendstring('createlist1(list);',rightcom);
appendstring('\\',rightcom);

appendstring('IF list.first<>NIL THEN list.last^.brother:=NIL;',rightcom);
appendstring('\\',rightcom);

appendstring('m^.li^.n:=numberofelements(list);',rightcom);
appendstring('\\',rightcom);

appendstring('m^.sons:=list.first;',rightcom);
appendstring('\\',rightcom);

END;
END
ELSE
BEGIN
IF TSTRING_length(treevarname)<>0 THEN
BEGIN
appendstring('m:=',rightcom);
 appendstring(treevarname,rightcom);
 appendstring(';',rightcom);
appendstring('\\',rightcom);

END
ELSE
BEGIN
appendstring('m:=MAKET_stree(',rightcom);
 appendstring(nodevarname,rightcom);
 appendstring('.cat);',rightcom);

appendstring('m^.ls^:=',rightcom);
 appendstring(nodevarname,rightcom);
 appendstring(';',rightcom);
appendstring('\\',rightcom);

IF currenttree^.ldfield.LABELEDTDfield^.noderiv THEN
BEGIN
appendstring('createlist1(list);',rightcom);
appendstring('\\',rightcom);

appendstring('IF list.first<>NIL THEN list.last^.brother:=NIL;',rightcom);
appendstring('\\',rightcom);

appendstring('m^.li^.n:=numberofelements(list);',rightcom);
appendstring('\\',rightcom);

appendstring('m^.sons:=list.first;',rightcom);
appendstring('\\',rightcom);

END;
END
END;
END;
appendstring('END{createM};',rightcom);
appendstring('\\',rightcom);

END
END;

3: begin
  BEGIN str:=currenttree^.ldfield.LABELEDDTREEfield^.str;
LABELEDDTREE__name:=name;

appendstring('PROCEDURE createM;',rightcom);
appendstring('\\',rightcom);


appendstring('PROCEDURE MatchModel',rightdecom);

appendstring('(VAR s:LSSTREE_pStree;',rightdecom);

appendstring('first:BOOLEAN;VAR match:Boolean);',rightdecom);
appendstring('\\',rightdecom);

END
; mrucomCODE_LABELEDDTREEproc(currenttree
,LABELEDDTREE__name
,LABELEDDTREE__rightcom
,LABELEDDTREE__levelids
,LABELEDDTREE__comactions
,LABELEDDTREE__decomactions
,LABELEDDTREE__extern
);
 BEGIN appendlocfile(LABELEDDTREE__rightcom,dtreeproc);
extern:=LABELEDDTREE__extern;
dtreelevelids:=LABELEDDTREE__levelids;
appendlocfile(extern,rightcom);
savelocfile(extern,extern);
appendlocfile(extern,rightdecom);

appendstring('BEGIN',rightdecom);
appendstring('\\',rightdecom);

appendstring('dtree:=dtree',rightdecom);
 appendstring(name,rightdecom);
 appendstring(';',rightdecom);
appendstring('\\',rightdecom);

appendstring('match:=AIDDERIV_analyse(dtree,loopholes.retype',rightdecom);

appendstring('(m,LISTREE_pstree));',rightdecom);
appendstring('\\',rightdecom);

appendlocfile(LABELEDDTREE__decomactions,rightdecom);
appendstring('END;',rightdecom);
appendstring('\\',rightdecom);


appendstring('BEGIN',rightcom);
appendstring('\\',rightcom);

appendstring('dtree:=dtree',rightcom);
 appendstring(name,rightcom);
 appendstring(';',rightcom);
appendstring('\\',rightcom);

appendlocfile(LABELEDDTREE__comactions,rightcom);
appendstring('m:=NIL;',rightcom);
appendstring('\\',rightcom);

appendstring('result:=GIDDERIV_generate(dtree);',rightcom);
appendstring('\\',rightcom);

appendstring('END;',rightcom);
appendstring('\\',rightcom);

END
END;

END;

rsnode1:=rsnode1^.brother END;
BEGIN RIGHTMODEL_rightcom:=rightcom;
RIGHTMODEL_rightdecom:=rightdecom;
RIGHTMODEL_levelids:=levelids;
RIGHTMODEL_dtreelevelids:=dtreelevelids;
RIGHTMODEL_dtreeproc:=dtreeproc;
END
END;
PROCEDURE mrucomCODE_LABELEDTDproc(top:mrucomDECL_psnode
;LABELEDTD_indent              :mrucomlangspec_INT
;LABELEDTD_name              :TSTRING_string
;LABELEDTD_submodeltree              :mrucomlangspec_bool
;LABELEDTD_righttolefttable              :mrucomlangspec_setofidents
;LABELEDTD_root              :TSTRING_string
;var LABELEDTD_leftcom              :LOCALFILE
;var LABELEDTD_rightcom              :LOCALFILE
;var LABELEDTD_dtreeproc              :LOCALFILE
;var LABELEDTD_numberofitems              :mrucomlangspec_INT
;var LABELEDTD_keymentioned              :mrucomlangspec_bool
;var LABELEDTD_keyvar              :mrucomlangspec_bool
;var LABELEDTD_keystr1              :TSTRING_string
;var LABELEDTD_keystr2              :TSTRING_string
;var LABELEDTD_levelids              :mrucomlangspec_setofidents
);
VAR currenttree:mrucomDECL_psnode;
    rsnode1:mrucomDECL_prsnode;
 dtreeproc,leftcom,rightcom:LOCALFILE;
numberofitems,indent:Integer;
righttolefttable,levelids: mrucomLANGSPEC_setofidents;
submodeltree,keymentioned,keyvar: mrucomLANGSPEC_bool;
keystr1,keystr2,treevarname,recordname:TSTRING_string;
rhslabel: mrucomLANGSPEC_ident;
minnum,maxnum: mrucomLANGSPEC_int;
relationlist: mrucomLANGSPEC_setofidents;
relationname: mrucomLANGSPEC_ident;
i,j:INTEGER;
root,name:TSTRING_string;
BEGIN
BEGIN initlocalfile(dtreeproc);
name:=LABELEDTD_name;
root:=LABELEDTD_root;
submodeltree:=LABELEDTD_submodeltree;
indent:=LABELEDTD_indent;
righttolefttable:=LABELEDTD_righttolefttable;
rhslabel:=top^.ldfield.LABELEDTDfield^.rhslabel;
InitLOCALFILE(leftcom);
InitLOCALFILE(rightcom);
minnum:=top^.ldfield.LABELEDTDfield^.minnum;
maxnum:=top^.ldfield.LABELEDTDfield^.maxnum;
relationlist:=top^.ldfield.LABELEDTDfield^.relationlist;
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
;
 BEGIN END
END;

3: begin
  BEGIN END
;
 BEGIN END
END;

4: begin
  BEGIN 
treevarname:=currenttree^.ldfield.BARETDfield^.treevarname;
BARETD__indent:=indent;
BARETD__righttolefttable:=righttolefttable;
IF submodeltree THEN
BEGIN
BEGIN   END;
LOCALTAB(leftcom,indent);
appendstring('PROCEDURE matchtree',leftcom);
 appendstring(rhslabel.str,leftcom);
 appendstring('(VAR match:BOOLEAN;first:BOOLEAN);',leftcom);
appendstring('\\',leftcom);

LOCALTAB(leftcom,indent);
appendstring('VAR s:LSSTREE_pStree;',leftcom);
appendstring('\\',leftcom);

LOCALTAB(leftcom,indent+2);
appendstring('lisons:LISTREE_pRelnode;',leftcom);
appendstring('\\',leftcom);

i:=0;
WHILE stillidents(relationlist) DO
BEGIN
takeident(relationname,relationlist);
i:=i+1;
LOCALTAB(leftcom,indent+2);
appendstring('lirel',leftcom);
 appendstring(mrucomDECL_convinttostring(i),leftcom);
 appendstring(':LIDOMAINT_synrel;',leftcom);
appendstring('\\',leftcom);

LOCALTAB(leftcom,indent+2);
appendstring('lsrel',leftcom);
 appendstring(mrucomDECL_convinttostring(i),leftcom);
 appendstring(':LSDOMAINT_synrel;',leftcom);
appendstring('\\',leftcom);

END;
j:=i; IF i>4 THEN j:=4;
END;
BARETD__name:=name;
BARETD__root:=root;
END
; mrucomCODE_BARETDproc(currenttree
,BARETD__indent
,BARETD__name
,BARETD__righttolefttable
,BARETD__root
,BARETD__leftcom
,BARETD__rightcom
,BARETD__dtreeproc
,BARETD__NumberOfItems
,BARETD__keymentioned
,BARETD__keyvar
,BARETD__keystr1
,BARETD__levelids
,BARETD__keystr2
);
 BEGIN
levelids:=BARETD__levelids;
AppendLocFile(BARETD__leftcom,leftcom);
AppendLocFile(BARETD__rightcom,rightcom);
appendlocfile(BARETD__dtreeproc,dtreeproc);
numberofitems:=BARETD__numberofitems;
relationlist:=currenttree^.ldfield.BARETDfield^.relationlist;
keymentioned:=BARETD__keymentioned;
keyvar:=BARETD__keyvar;
keystr1:=BARETD__keystr1;
keystr2:=BARETD__keystr2;
recordname:=currenttree^.ldfield.BARETDfield^.recordname;
IF submodeltree THEN
BEGIN
BEGIN   END;
LOCALTAB(leftcom,indent);
appendstring('BEGIN',leftcom);
appendstring('\\',leftcom);

LOCALTAB(leftcom,indent);
appendstring('s:= ',leftcom);
 appendstring(rhslabel.str,leftcom);
 appendstring(';',leftcom);
appendstring('\\',leftcom);

LOCALTAB(leftcom,indent);
IF currenttree^.ldfield.BARETDfield^.basiccat AND (TSTRING_length(recordname)<>0) THEN
BEGIN
LOCALTAB(leftcom,indent);
appendstring(recordname,leftcom);
 appendstring('tree:=s;',leftcom);
appendstring('\\',leftcom);

END;
IF currenttree^.ldfield.BARETDfield^.containsTi THEN
BEGIN
appendstring('match:=first;',leftcom);
appendstring('\\',leftcom);

LOCALTAB(leftcom,indent);
appendstring(treevarname,leftcom);
 appendstring(':=s;',leftcom);
appendstring('\\',leftcom);

END
ELSE
BEGIN
appendstring('matchnode(s,match);',leftcom);
appendstring('\\',leftcom);

IF (maxnum<100) OR (minnum>0) THEN
BEGIN
LOCALTAB(leftcom,indent+4); appendstring('IF match THEN',leftcom);
appendstring('\\',leftcom);

LOCALTAB(leftcom,indent+6);
appendstring('match:= ',leftcom);

IF minnum>0 THEN 
BEGIN appendstring('(s^.li^.n >=',leftcom);
 appendstring(mrucomDECL_convinttostring(minnum),leftcom);

appendstring(')',leftcom);
 END;
IF (maxnum<100) AND (minnum>0) THEN appendstring(' AND ',leftcom);

IF (maxnum<100) THEN BEGIN
appendstring('(s^.li^.n <=',leftcom);
 appendstring(mrucomDECL_convinttostring(maxnum),leftcom);
 appendstring(')',leftcom);
 END;
appendstring(';',leftcom);
 appendstring('\\',leftcom);

END;
LOCALTAB(leftcom,indent+4);
appendstring('IF match THEN',leftcom);
appendstring('\\',leftcom);

LOCALTAB(leftcom,indent+6);
appendstring('BEGIN',leftcom);
appendstring('\\',leftcom);

i:=0;
WHILE stillidents(relationlist) DO
BEGIN
i:=i+1;
takeident(relationname,relationlist);
LOCALTAB(leftcom,indent+6);
appendstring('lsrel',leftcom);
 appendstring(mrucomDECL_convinttostring(i),leftcom);
 appendstring(':=',leftcom);
 
appendstring(relationname.str,leftcom);
 appendstring(';',leftcom);
appendstring('\\',leftcom);

LOCALTAB(leftcom,indent+6);
appendstring('lirel',leftcom);
 appendstring(mrucomDECL_convinttostring(i),leftcom);
 appendstring(':= loopholes.retype(lsrel',leftcom);
 
appendstring(mrucomDECL_convinttostring(i),leftcom);
 appendstring(',LIDOMAINT_synrel);',leftcom);
appendstring('\\',leftcom);

END;
IF (j<>0) THEN
BEGIN
LOCALTAB(leftcom,indent+6);
appendstring('lisons:=loopholes.retype',leftcom);

appendstring('(s^.sons,LISTREE_pRelnode);',leftcom);
appendstring('\\',leftcom);

LOCALTAB(leftcom,indent+6);
appendstring('match:= LIMATCHES_TEST',leftcom);
 appendstring(mrucomDECL_convinttostring(j),leftcom);
 appendstring('rels(',leftcom);

i:=0;
WHILE i<>j DO
BEGIN
i:=i+1;
appendstring('lirel',leftcom);
 appendstring(mrucomDECL_convinttostring(i),leftcom);
 appendstring(',',leftcom);

END;
appendstring('lisons,FALSE);',leftcom);
appendstring('\\',leftcom);

END;
LOCALTAB(leftcom,indent+6);
appendstring('END;',leftcom);
appendstring('\\',leftcom);

appendstring('IF match THEN',leftcom);

appendstring(' matchlist',leftcom);
 appendstring(mrucomDECL_convinttostring(numberofitems),leftcom);
 appendstring('items(s^.sons,first,match);',leftcom);
appendstring('\\',leftcom);

END;
LOCALTAB(leftcom,indent);
appendstring('END;',leftcom);
appendstring('\\',leftcom);

END 
END
END;

5: begin
  BEGIN END
;
 BEGIN 
END
END;

END;

rsnode1:=rsnode1^.brother END;
BEGIN 
LABELEDTD_dtreeproc:=dtreeproc;
LABELEDTD_levelids:=levelids;
LABELEDTD_keymentioned:=keymentioned;
LABELEDTD_keyvar:=keyvar;
LABELEDTD_keystr1:=keystr1;
LABELEDTD_keystr2:=keystr2;
LABELEDTD_leftcom:=leftcom; 
LABELEDTD_rightcom:=rightcom; 
LABELEDTD_numberofitems:=numberofitems;
END;
END;
PROCEDURE mrucomCODE_BARETDproc(top:mrucomDECL_psnode
;BARETD_indent              :mrucomlangspec_INT
;BARETD_name              :TSTRING_string
;BARETD_righttolefttable              :mrucomlangspec_SETOFidents
;BARETD_root              :TSTRING_string
;var BARETD_leftcom              :LOCALFILE
;var BARETD_rightcom              :LOCALFILE
;var BARETD_dtreeproc              :LOCALFILE
;var BARETD_NumberOfItems              :mrucomlangspec_INT
;var BARETD_keymentioned              :mrucomlangspec_bool
;var BARETD_keyvar              :mrucomlangspec_bool
;var BARETD_keystr1              :TSTRING_string
;var BARETD_levelids              :mrucomlangspec_setofidents
;var BARETD_keystr2              :TSTRING_string
);
VAR currenttree:mrucomDECL_psnode;
    rsnode1:mrucomDECL_prsnode;
 leftcom,rightcom,dtreeproc,hoedjematch:LOCALFILE;
i,j,hoedjenumberofitems,NumberOfItems,indent,maxnum,minnum:Integer;
category,treevariable,keystr1,keystr2:TSTRING_string;
righttolefttable: mrucomLANGSPEC_setofidents;
relationlist,levelids: mrucomLANGSPEC_setofidents;
relationname: mrucomLANGSPEC_ident;
listpresent,keymentioned,keyvar,hoedjepresent: mrucomLANGSPEC_bool;
shorthand,root,name:TSTRING_string;
BEGIN
 BEGIN
name:=BARETD_name;
root:=BARETD_root;
initlocalfile(dtreeproc);
initsetofidents(levelids);
hoedjepresent:=false;
listpresent:=false;
numberofitems:=0;
indent:=BARETD_indent;
righttolefttable:=BARETD_righttolefttable;
InitLOCALFILE(leftcom);
InitLOCALFILE(rightcom);
keymentioned:=false;
keyvar:=false;
TSTRING_constantempty(keystr1);
TSTRING_constantempty(keystr2);
TSTRING_constantempty(treevariable);
TSTRING_constantempty(shorthand);
END;
rsnode1:=top^.sonlist;
  while rsnode1<>nil do
  begin
  currenttree:=rsnode1^.node;
  case rsnode1^.sonnumber of

1: begin
  BEGIN END
; mrucomCODE_TREEVARproc(currenttree
,TREEVAR__ident
);
 BEGIN
treevariable:=TREEVAR__ident;
END
END;

2: begin
  BEGIN 
LABELEDND__indent:=indent;
LABELEDND__name:=name;
LABELEDND__shorthand:=shorthand;
END
; mrucomCODE_LABELEDNDproc(currenttree
,LABELEDND__indent
,LABELEDND__name
,LABELEDND__shorthand
,LABELEDND__leftcom
,LABELEDND__rightcom
,LABELEDND__dtreeproc
,LABELEDND__keymentioned
,LABELEDND__keyvar
,LABELEDND__keystr1
,LABELEDND__keystr2
);
 BEGIN
appendlocfile(LABELEDND__dtreeproc,dtreeproc);
category:=currenttree^.ldfield.LABELEDNDfield^.categoryname;
keymentioned:=LABELEDND__keymentioned;
keyvar:=LABELEDND__keyvar;
keystr1:=LABELEDND__keystr1;
keystr2:=LABELEDND__keystr2;
AppendLocFile(LABELEDND__leftcom,leftcom);
AppendLocFile(LABELEDND__rightcom,rightcom);
END
END;

3: begin
  BEGIN 
BAREND__labeled:=FALSE;
BAREND__indent:=indent;
BAREND__name:=name;
BAREND__shorthand:=shorthand;
END
; mrucomCODE_BARENDproc(currenttree
,BAREND__labeled
,BAREND__label
,BAREND__indent
,BAREND__shorthand
,BAREND__name
,BAREND__leftcom
,BAREND__rightcom
,BAREND__dtreeproc
,BAREND__keymentioned
,BAREND__keyvar
,BAREND__keystr1
,BAREND__keystr2
);
 BEGIN
appendlocfile(BAREND__dtreeproc,dtreeproc);
category:=currenttree^.ldfield.BARENDfield^.categoryname;
keymentioned:=BAREND__keymentioned;
keyvar:=BAREND__keyvar;
keystr1:=BAREND__keystr1;
keystr2:=BAREND__keystr2;
AppendLocFile(BAREND__leftcom,leftcom);
AppendLocFile(BAREND__rightcom,rightcom);
END
END;

4: begin
  BEGIN
LABELEDLD__submodellist:=FALSE;
LABELEDLD__indent:=indent;
LABELEDLD__inexist:=FALSE;
LABELEDLD__righttolefttable:=righttolefttable;
listpresent:=true;
LABELEDLD__name:=name;
LABELEDLD__root:=root;
END
; mrucomCODE_LABELEDLDproc(currenttree
,LABELEDLD__indent
,LABELEDLD__righttolefttable
,LABELEDLD__submodellist
,LABELEDLD__inexist
,LABELEDLD__root
,LABELEDLD__name
,LABELEDLD__leftcom
,LABELEDLD__rightcom
,LABELEDLD__dtreeproc
,LABELEDLD__NumberOfItems
,LABELEDLD__levelids
);
 BEGIN appendlocfile(LABELEDLD__dtreeproc,dtreeproc);
levelids:=LABELEDLD__levelids; 
NumberOfItems:=LABELEDLD__NumberOfItems;
AppendLocFile(LABELEDLD__leftcom,leftcom);
AppendLocFile(LABELEDLD__rightcom,rightcom);
END
END;

5: begin
  BEGIN
TSTRING_constantempty(BARELD__label);
BARELD__indent:=indent;
BARELD__righttolefttable:=righttolefttable;
BARELD__labeled:=FALSE;
BARELD__bounded:=FALSE;
BARELD__inexist:=FALSE;
BARELD__righttoleftmatch:=FALSE;
listpresent:=true;
BARELD__name:=name;
BARELD__root:=root;
END
; mrucomCODE_BARELDproc(currenttree
,BARELD__label
,BARELD__labeled
,BARELD__indent
,BARELD__inexist
,BARELD__bounded
,BARELD__righttolefttable
,BARELD__righttoleftmatch
,BARELD__root
,BARELD__name
,BARELD__leftcom
,BARELD__rightcom
,BARELD__dtreeproc
,BARELD__NumberOfItems
,BARELD__levelids
);
 BEGIN appendlocfile(BARELD__dtreeproc,dtreeproc);
levelids:=BARELD__levelids; 
NumberOfItems:=BARELD__NumberOfItems;
AppendLocFile(BARELD__leftcom,leftcom);
AppendLocFile(BARELD__rightcom,rightcom);
END
END;

6: begin
  BEGIN hoedjepresent:=true
END
;
 BEGIN 
END
END;

7: begin
  BEGIN INITlocalfile(hoedjematch);

appendstring('PROCEDURE matchnode',hoedjematch);

appendstring('(s:LSSTREE_pstree;VAR match:BOOLEAN);',hoedjematch);
appendstring('\\',hoedjematch);

relationlist:=currenttree^.ldfield.BARETDfield^.relationlist;
LOCALTAB(hoedjematch,indent+2);
appendstring('VAR lisons:LISTREE_pRelnode;',hoedjematch);
appendstring('\\',hoedjematch);

i:=0;
WHILE stillidents(relationlist) DO
BEGIN
takeident(relationname,relationlist);
i:=i+1;
LOCALTAB(hoedjematch,indent+2);
appendstring('lirel',hoedjematch);
 appendstring(mrucomDECL_convinttostring(i),hoedjematch);
 appendstring(':LIDOMAINT_synrel;',hoedjematch);
appendstring('\\',hoedjematch);

LOCALTAB(hoedjematch,indent+2);
appendstring('lsrel',hoedjematch);
 appendstring(mrucomDECL_convinttostring(i),hoedjematch);
 appendstring(':LSDOMAINT_synrel;',hoedjematch);
appendstring('\\',hoedjematch);

END;
j:=i; IF i>4 THEN j:=4;
appendstring('PROCEDURE matchvarnode',hoedjematch);

appendstring('(s:LSSTREE_pstree;VAR match:BOOLEAN);',hoedjematch);
appendstring('\\',hoedjematch);

appendlocfile(leftcom,hoedjematch);
appendstring('BEGIN',hoedjematch);
appendstring('\\',hoedjematch);

appendstring('matchnode(s,match)',hoedjematch);
appendstring('\\',hoedjematch);

appendstring('END;',hoedjematch);
appendstring('\\',hoedjematch);

BARETD__name:=name;
BARETD__root:=root;
END
; mrucomCODE_BARETDproc(currenttree
,BARETD__indent
,BARETD__name
,BARETD__righttolefttable
,BARETD__root
,BARETD__leftcom
,BARETD__rightcom
,BARETD__dtreeproc
,BARETD__NumberOfItems
,BARETD__keymentioned
,BARETD__keyvar
,BARETD__keystr1
,BARETD__levelids
,BARETD__keystr2
);
 BEGIN appendlocfile(BARETD__leftcom,hoedjematch);
hoedjenumberofitems:=BARETD__numberofitems;
minnum:=currenttree^.ldfield.BARETDfield^.minnum;
maxnum:=currenttree^.ldfield.BARETDfield^.maxnum;
relationlist:=currenttree^.ldfield.BARETDfield^.relationlist;
levelids:=BARETD__levelids;
END
END;

8: begin
  BEGIN 
END
;
 BEGIN 
END
END;

9: begin
  BEGIN shorthand:=currenttree^.ldfield.TREEVARfield^.str
END
;
 BEGIN 
END
END;

END;

rsnode1:=rsnode1^.brother END;
BEGIN
IF NOT listpresent THEN
BEGIN
BEGIN  END;
LOCALTAB(rightcom,indent);
appendstring('PROCEDURE createlist1',rightcom);

appendstring('(VAR wholelist:LSMRUQUO_ListOfStrees);',rightcom);
appendstring('\\',rightcom);

LOCALTAB(rightcom,indent);
appendstring('BEGIN',rightcom);
appendstring('\\',rightcom);

LOCALTAB(rightcom,indent);
appendstring('wholelist.first:=NIL;wholelist.last:=NIL;',rightcom);
appendstring('\\',rightcom);

LOCALTAB(rightcom,indent);
appendstring('END;',rightcom);
appendstring('\\',rightcom);

END;
IF hoedjepresent THEN
BEGIN 
appendstring('BEGIN',hoedjematch);
appendstring('\\',hoedjematch);

appendstring('matchvarnode(s,match);',hoedjematch);
appendstring('\\',hoedjematch);

appendstring('IF match THEN BEGIN',hoedjematch);
appendstring('\\',hoedjematch);

appendstring('hulpstree:=GLOBSUBST_get(s^.ls^.',hoedjematch);
 appendstring(category,hoedjematch);

appendstring('field^.index);',hoedjematch);
appendstring('\\',hoedjematch);

appendstring('s:=loopholes.retype(hulpstree,LSSTREE_pstree);',hoedjematch);
appendstring('\\',hoedjematch);

appendstring('matchnode(s,match);',hoedjematch);
appendstring('\\',hoedjematch);

IF (maxnum<100) OR (minnum>0) THEN
BEGIN
LOCALTAB(hoedjematch,indent+4); appendstring('IF match THEN',hoedjematch);
appendstring('\\',hoedjematch);

LOCALTAB(hoedjematch,indent+6);
appendstring('match:= ',hoedjematch);

IF minnum>0 THEN 
BEGIN appendstring('(s^.li^.n >=',hoedjematch);
 appendstring(mrucomDECL_convinttostring(minnum),hoedjematch);

appendstring(')',hoedjematch);
 END;
IF (maxnum<100) AND (minnum>0) THEN appendstring(' AND ',hoedjematch);

IF (maxnum<100) THEN BEGIN
appendstring('(s^.li^.n <=',hoedjematch);
 appendstring(mrucomDECL_convinttostring(maxnum),hoedjematch);
 appendstring(')',hoedjematch);
 END;
appendstring(';',hoedjematch);
 appendstring('\\',hoedjematch);

END;
LOCALTAB(hoedjematch,indent+4);
appendstring('IF match THEN',hoedjematch);
appendstring('\\',hoedjematch);

LOCALTAB(hoedjematch,indent+6);
appendstring('BEGIN',hoedjematch);
appendstring('\\',hoedjematch);

i:=0;
WHILE stillidents(relationlist) DO
BEGIN
i:=i+1;
takeident(relationname,relationlist);
LOCALTAB(hoedjematch,indent+6);
appendstring('lsrel',hoedjematch);
 appendstring(mrucomDECL_convinttostring(i),hoedjematch);
 appendstring(':=',hoedjematch);
 
appendstring(relationname.str,hoedjematch);
 appendstring(';',hoedjematch);
appendstring('\\',hoedjematch);

LOCALTAB(hoedjematch,indent+6);
appendstring('lirel',hoedjematch);
 appendstring(mrucomDECL_convinttostring(i),hoedjematch);
 appendstring(':= loopholes.retype(lsrel',hoedjematch);
 
appendstring(mrucomDECL_convinttostring(i),hoedjematch);
 appendstring(',LIDOMAINT_synrel);',hoedjematch);
appendstring('\\',hoedjematch);

END;
IF (j<>0) THEN
BEGIN
LOCALTAB(hoedjematch,indent+6);
appendstring('lisons:=loopholes.retype(s^.sons,LISTREE_pRelnode);',hoedjematch);
appendstring('\\',hoedjematch);

LOCALTAB(hoedjematch,indent+6);
appendstring('match:= LIMATCHES_TEST',hoedjematch);
 appendstring(mrucomDECL_convinttostring(j),hoedjematch);
 appendstring('rels(',hoedjematch);

i:=0;
WHILE i<>j DO
BEGIN
i:=i+1;
appendstring('lirel',hoedjematch);
 appendstring(mrucomDECL_convinttostring(i),hoedjematch);
 appendstring(',',hoedjematch);

END;
appendstring('lisons,FALSE);',hoedjematch);
appendstring('\\',hoedjematch);

END;
LOCALTAB(hoedjematch,indent+6);
appendstring('END;',hoedjematch);
appendstring('\\',hoedjematch);

appendstring('IF match THEN',hoedjematch);

appendstring(' matchlist',hoedjematch);
 appendstring(mrucomDECL_convinttostring(hoedjenumberofitems),hoedjematch);
 appendstring('items(s^.sons,TRUE,match);',hoedjematch);
appendstring('\\',hoedjematch);

appendstring(' END;',hoedjematch);
appendstring('\\',hoedjematch);

appendstring('END;',hoedjematch);
appendstring('\\',hoedjematch);

leftcom:=hoedjematch;
END;
BARETD_levelids:=levelids;
BARETD_keymentioned:=keymentioned;
BARETD_keyvar:=keyvar;
BARETD_keystr1:=keystr1;
BARETD_keystr2:=keystr2;
BARETD_leftcom:=leftcom;
BARETD_rightcom:=rightcom;
BARETD_dtreeproc:=dtreeproc;
BARETD_NumberOfItems:=NumberOfItems;
END
END;
PROCEDURE mrucomCODE_LABELEDNDproc(top:mrucomDECL_psnode
;LABELEDND_indent              :mrucomlangspec_INT
;LABELEDND_name              :TSTRING_string
;LABELEDND_shorthand              :TSTRING_string
;var LABELEDND_leftcom              :LOCALFILE
;var LABELEDND_rightcom              :LOCALFILE
;var LABELEDND_dtreeproc              :LOCALFILE
;var LABELEDND_keymentioned              :mrucomlangspec_bool
;var LABELEDND_keyvar              :mrucomlangspec_bool
;var LABELEDND_keystr1              :TSTRING_string
;var LABELEDND_keystr2              :TSTRING_string
);
VAR currenttree:mrucomDECL_psnode;
    rsnode1:mrucomDECL_prsnode;
 leftcom,rightcom:LOCALFILE;
ilabel :TSTRING_string;
indent:Integer;
keymentioned,keyvar: mrucomLANGSPEC_bool;
shorthand,keystr1,keystr2:TSTRING_string;
BEGIN
 BEGIN InitLOCALFILE(leftcom);
Initlocalfile(rightcom);
indent:=LABELEDND_indent;
TSTRING_constantempty(ilabel);
shorthand:=LABELEDND_shorthand;
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
; mrucomCODE_ILABELtjeproc(currenttree
,ILABELtje__ident
);
 BEGIN
ilabel:=ILABELtje__ident;
END
END;

3: begin
  BEGIN 
BAREND__indent:=indent;
BAREND__label:=ilabel;
BAREND__labeled:=TRUE;
BAREND__shorthand:=shorthand;
END
; mrucomCODE_BARENDproc(currenttree
,BAREND__labeled
,BAREND__label
,BAREND__indent
,BAREND__shorthand
,BAREND__name
,BAREND__leftcom
,BAREND__rightcom
,BAREND__dtreeproc
,BAREND__keymentioned
,BAREND__keyvar
,BAREND__keystr1
,BAREND__keystr2
);
 BEGIN
keymentioned:=BAREND__keymentioned;
keyvar:=BAREND__keyvar;
keystr1:=BAREND__keystr1;
keystr2:=BAREND__keystr2;
AppendLocFile(BAREND__leftcom,leftcom);
AppendLocFile(BAREND__rightcom,rightcom);
END
END;

END;

rsnode1:=rsnode1^.brother END;
BEGIN 
LABELEDND_leftcom:=leftcom; 
LABELEDND_rightcom:=rightcom; 
LABELEDND_keymentioned:=keymentioned;
LABELEDND_keyvar:=keyvar;
LABELEDND_keystr1:=keystr1;
LABELEDND_keystr2:=keystr2;
END
END;
PROCEDURE mrucomCODE_LABELEDLDproc(top:mrucomDECL_psnode
;LABELEDLD_indent              :mrucomlangspec_INT
;LABELEDLD_righttolefttable              :mrucomlangspec_setofidents
;LABELEDLD_submodellist              :mrucomlangspec_bool
;LABELEDLD_inexist              :mrucomlangspec_bool
;LABELEDLD_root              :TSTRING_string
;LABELEDLD_name              :TSTRING_string
;var LABELEDLD_leftcom              :LOCALFILE
;var LABELEDLD_rightcom              :LOCALFILE
;var LABELEDLD_dtreeproc              :LOCALFILE
;var LABELEDLD_NumberOfItems              :mrucomlangspec_INT
;var LABELEDLD_levelids              :mrucomlangspec_setofidents
);
VAR currenttree:mrucomDECL_psnode;
    rsnode1:mrucomDECL_prsnode;
 leftcom,rightcom,dtreeproc:LOCALFILE;
righttolefttable: mrucomLANGSPEC_setofidents;
NumberOfItems,indent:Integer;
labeltje:TSTRING_string;
righttoleftmatch:BOOLEAN;
submodellist,inexist:BOOLEAN;
rhslabel: mrucomLANGSPEC_ident;
root,name:TSTRING_string;
relationlist,levelids: mrucomLANGSPEC_setofidents;
relationname: mrucomLANGSPEC_ident;
i,j: mrucomLANGSPEC_int;
 FUNCTION labelpresent(labeltje:TSTRING_string;table: mrucomLANGSPEC_setofidents):BOOLEAN;
VAR result:BOOLEAN;
ident: mrucomLANGSPEC_ident;
BEGIN
result:=FALSE;
WHILE stillidents(table) AND NOT(result) DO
BEGIN
takeident(ident,table);
result:= (labeltje=ident.str)
END;
labelpresent:=result
END;
BEGIN
 BEGIN InitLOCALFILE(leftcom);
INITlocalfile(rightcom);
INITlocalfile(dtreeproc);
name:=LABELEDLD_name;
root:=LABELEDLD_root;
indent:=LABELEDLD_indent;
inexist:=LABELEDLD_inexist;
righttolefttable:=LABELEDLD_righttolefttable;
TSTRING_constantempty(labeltje);
righttoleftmatch:=FALSE;
submodellist:=LABELEDLD_submodellist;
rhslabel:=top^.ldfield.LABELEDLDfield^.rhslabel;
relationlist:=top^.ldfield.LABELEDLDfield^.relationlist;
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
; mrucomCODE_ILABELtjeproc(currenttree
,ILABELtje__ident
);
 BEGIN labeltje:=ILABELtje__ident;
righttoleftmatch:=labelpresent(labeltje,righttolefttable);
END
END;

3: begin
  BEGIN 
BARELD__indent:=indent; 
BARELD__label:=labeltje;
BARELD__labeled:=TRUE;
BARELD__inexist:=inexist;
BARELD__bounded:=submodellist;
BARELD__righttolefttable:=righttolefttable;
BARELD__righttoleftmatch:=righttoleftmatch;
IF submodellist THEN
BEGIN
BEGIN   END;
LOCALTAB(leftcom,indent);
appendstring('PROCEDURE matchlist',leftcom);
 appendstring(rhslabel.str,leftcom);
 
appendstring('(Lfirst,Lfinal:LSSTREE_pRelNode;',leftcom);

appendstring('VAR match:BOOLEAN;first:BOOLEAN);',leftcom);
appendstring('\\',leftcom);

LOCALTAB(leftcom,indent);
appendstring('VAR lisons:LISTREE_pRelnode;',leftcom);
appendstring('\\',leftcom);

i:=0;
WHILE stillidents(relationlist) DO
BEGIN
takeident(relationname,relationlist);
i:=i+1;
LOCALTAB(leftcom,indent+2);
appendstring('lirel',leftcom);
 appendstring(mrucomDECL_convinttostring(i),leftcom);
 appendstring(':LIDOMAINT_synrel;',leftcom);
appendstring('\\',leftcom);

LOCALTAB(leftcom,indent+2);
appendstring('lsrel',leftcom);
 appendstring(mrucomDECL_convinttostring(i),leftcom);
 appendstring(':LSDOMAINT_synrel;',leftcom);
appendstring('\\',leftcom);

END;
j:=i; IF i>4 THEN j:=4;
END;
BARELD__name:=name;
BARELD__root:=root;
END
; mrucomCODE_BARELDproc(currenttree
,BARELD__label
,BARELD__labeled
,BARELD__indent
,BARELD__inexist
,BARELD__bounded
,BARELD__righttolefttable
,BARELD__righttoleftmatch
,BARELD__root
,BARELD__name
,BARELD__leftcom
,BARELD__rightcom
,BARELD__dtreeproc
,BARELD__NumberOfItems
,BARELD__levelids
);
 BEGIN appendlocfile(BARELD__dtreeproc,dtreeproc);
levelids:=BARELD__levelids;
relationlist:=currenttree^.ldfield.BARELDfield^.relationlist;
NumberOfItems:=BARELD__NumberOfItems;
AppendLocFile(BARELD__leftcom,leftcom);
AppendLocFile(BARELD__rightcom,rightcom);
IF submodellist THEN
BEGIN
BEGIN   END;
LOCALTAB(leftcom,indent);
appendstring('BEGIN',leftcom);
appendstring('\\',leftcom);

i:=0;
WHILE stillidents(relationlist) DO
BEGIN
i:=i+1;
takeident(relationname,relationlist);
LOCALTAB(leftcom,indent+6);
appendstring('lsrel',leftcom);
 appendstring(mrucomDECL_convinttostring(i),leftcom);
 appendstring(':=',leftcom);
 
appendstring(relationname.str,leftcom);
 appendstring(';',leftcom);
appendstring('\\',leftcom);

LOCALTAB(leftcom,indent+6);
appendstring('lirel',leftcom);
 appendstring(mrucomDECL_convinttostring(i),leftcom);
 appendstring(':= loopholes.retype(lsrel',leftcom);
 
appendstring(mrucomDECL_convinttostring(i),leftcom);
 appendstring(',LIDOMAINT_synrel);',leftcom);
appendstring('\\',leftcom);

END;
IF (j<>0) THEN
BEGIN
LOCALTAB(leftcom,indent+6);
appendstring('lisons:=loopholes.retype(',leftcom);
 appendstring(rhslabel.str,leftcom);

appendstring('.first,LISTREE_pRelnode);',leftcom);
appendstring('\\',leftcom);

LOCALTAB(leftcom,indent+6);
appendstring('match:= LIMATCHES_TEST',leftcom);
 appendstring(mrucomDECL_convinttostring(j),leftcom);
 appendstring('rels(',leftcom);

i:=0;
WHILE i<>j DO
BEGIN
i:=i+1;
appendstring('lirel',leftcom);
 appendstring(mrucomDECL_convinttostring(i),leftcom);
 appendstring(',',leftcom);

END;
appendstring('lisons,FALSE);',leftcom);
appendstring('\\',leftcom);

END;
appendstring('IF match THEN matchlist',leftcom);
 appendstring(mrucomDECL_convinttostring(numberofitems),leftcom);
 appendstring('items(',leftcom);

appendstring(rhslabel.str,leftcom);
 appendstring('.first,first,match);',leftcom);
appendstring('\\',leftcom);

LOCALTAB(leftcom,indent);
appendstring('END;',leftcom);
appendstring('\\',leftcom);

END;
END
END;

4: begin
  BEGIN END
; mrucomCODE_MUVARproc(currenttree
,MUVAR__ident
);
 BEGIN labeltje:=MUVAR__ident;
righttoleftmatch:=labelpresent(labeltje,righttolefttable);
END
END;

5: begin
  BEGIN END
; mrucomCODE_SIGMAVARproc(currenttree
,SIGMAVAR__ident
);
 BEGIN labeltje:=SIGMAVAR__ident;
righttoleftmatch:=labelpresent(labeltje,righttolefttable);
END
END;

END;

rsnode1:=rsnode1^.brother END;
BEGIN LABELEDLD_dtreeproc:=dtreeproc;
LABELEDLD_levelids:=levelids;
LABELEDLD_leftcom:=leftcom;
LABELEDLD_rightcom:=rightcom;
LABELEDLD_NumberOfItems:=NumberOfItems;
END
END;
PROCEDURE mrucomCODE_BARENDproc(top:mrucomDECL_psnode
;BAREND_labeled              :mrucomlangspec_bool
;BAREND_label              :TSTRING_string
;BAREND_indent              :mrucomlangspec_INT
;BAREND_shorthand              :TSTRING_string
;BAREND_name              :TSTRING_string
;var BAREND_leftcom              :LOCALFILE
;var BAREND_rightcom              :LOCALFILE
;var BAREND_dtreeproc              :LOCALFILE
;var BAREND_keymentioned              :mrucomlangspec_bool
;var BAREND_keyvar              :mrucomlangspec_bool
;var BAREND_keystr1              :TSTRING_string
;var BAREND_keystr2              :TSTRING_string
);
VAR currenttree:mrucomDECL_psnode;
    rsnode1:mrucomDECL_prsnode;
 labeled: mrucomLANGSPEC_Bool;
ilabel,
category,
catrec,
shorthand,counterstr,Xiname,NiName,keystr1,keystr2,name :TSTRING_string;
dtreeproc,extern,leftcom,rightcom:LOCALFILE;
indent:Integer;
dtreepresent,Xivar,NiVar,keymentioned,keyIvar,keyvar: mrucomLANGSPEC_bool;
BEGIN
 BEGIN 
initlocalfile(dtreeproc);
counterstr:=top^.ldfield.BARENDfield^.counterstr;
name:=BAREND_name;
shorthand:=BAREND_shorthand;
Xivar:=FALSE;
Nivar:=FALSE;
keymentioned:=FALSE;
TSTRING_constantempty(keystr1);
TSTRING_constantempty(keystr2);
TSTRING_constantempty(catrec);
TSTRING_constantempty(ilabel);
TSTRING_constantempty(category);
TSTRING_constantempty(NiName);
dtreepresent:=FALSE;
indent:=BAREND_indent;
InitLOCALFILE(leftcom);
InitLOCALFILE(rightcom);
labeled:=BAREND_labeled;
IF labeled THEN
ilabel:=BAREND_label;
BEGIN  END;
BEGIN
LOCALTAB(leftcom,indent);
appendstring('PROCEDURE MatchNode(s:LSSTREE_pStree;',leftcom);

appendstring('VAR match:Boolean);',leftcom);
appendstring('\\',leftcom);

END;
BEGIN  END;
BEGIN
LOCALTAB(rightcom,indent);
appendstring('PROCEDURE CreateNode(VAR N:LSSTREE_pStree);',rightcom);
appendstring('\\',rightcom);

END;
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
; mrucomCODE_CATNAMEproc(currenttree
,CATNAME__ident
);
 BEGIN
category:=CATNAME__ident;
END
END;

3: begin
  BEGIN END
; mrucomCODE_CATRECNAMEproc(currenttree
,CATRECNAME__ident
);
 BEGIN
catrec:=CATRECNAME__ident;
END
END;

4: begin
  BEGIN NiVar:=TRUE END
;
 BEGIN NiName:=currenttree^.ldfield.NODEVARfield^.str END
END;

5: begin
  BEGIN keymentioned:=TRUE END
;
 BEGIN keystr1:=currenttree^.ldfield.KEYNAMEfield^.str1;
keystr2:=currenttree^.ldfield.KEYNAMEfield^.str2;
keyvar:=currenttree^.ldfield.KEYNAMEfield^.keyvar;
keyIvar:=currenttree^.ldfield.KEYNAMEfield^.keyIvar;
END
END;

6: begin
  BEGIN TSTRING_append(name,'_');
TSTRING_append(name,counterstr);
LABELEDDTREE__name:=name;
END
; mrucomCODE_LABELEDDTREEproc(currenttree
,LABELEDDTREE__name
,LABELEDDTREE__rightcom
,LABELEDDTREE__levelids
,LABELEDDTREE__comactions
,LABELEDDTREE__decomactions
,LABELEDDTREE__extern
);
 BEGIN IF currenttree^.ldfield.LABELEDDTREEfield^.variable THEN 
BEGIN 
Xivar:=TRUE;
Xiname:=currenttree^.ldfield.LABELEDDTREEfield^.str;
TSTRING_extractend(Xiname,Xiname,2);
END
ELSE 
BEGIN
dtreepresent:=TRUE;
dtreeproc:=LABELEDDTREE__rightcom;
extern:=LABELEDDTREE__extern;
appendlocfile(extern,rightcom);
savelocfile(extern,extern);
appendlocfile(extern,leftcom);
END;
END
END;

END;

rsnode1:=rsnode1^.brother END;
BEGIN

IF Nivar THEN
BEGIN
LOCALTAB(leftcom,indent);
appendstring('BEGIN{MatchNode}',leftcom);
appendstring('\\',leftcom);

LOCALTAB(leftcom,indent+2);
appendstring(NiName,leftcom);
 appendstring(':= s^.ls^;match:=TRUE;',leftcom);
appendstring('\\',leftcom);

LOCALTAB(leftcom,indent);
IF labeled THEN
BEGIN
BEGIN  END;
BEGIN
LOCALTAB(leftcom,indent+2);
appendstring('IF match THEN',leftcom);
appendstring('\\',leftcom);

LOCALTAB(leftcom,indent+4);
appendstring('match:= matchcond',leftcom);
 appendstring(ilabel,leftcom);
 appendstring(';',leftcom);
appendstring('\\',leftcom);

END;
END;
IF Xivar THEN
BEGIN
LOCALTAB(leftcom,indent+2);
appendstring('IF match THEN match:=(s^.ls^.',leftcom);
 appendstring(category,leftcom);
 appendstring('field^.index=X',leftcom);

appendstring(Xiname,leftcom);
 appendstring(');',leftcom);
appendstring('\\',leftcom);

END;
IF TSTRING_length(shorthand)<>0 THEN BEGIN
appendstring(shorthand,leftcom);
 appendstring(':=s;',leftcom);
appendstring('\\',leftcom);

END;
END;
IF NOT Nivar THEN
BEGIN
BEGIN
LOCALTAB(leftcom,indent);
appendstring('BEGIN{MatchNode}',leftcom);
appendstring('\\',leftcom);

LOCALTAB(leftcom,indent+2);
appendstring('IF s^.ls^.cat<>',leftcom);
 appendstring(category,leftcom);
 appendstring(' THEN',leftcom);
appendstring('\\',leftcom);

LOCALTAB(leftcom,indent+4);
appendstring('match:=FALSE;',leftcom);
appendstring('\\',leftcom);

LOCALTAB(leftcom,indent+2);
appendstring('IF match THEN',leftcom);
appendstring('\\',leftcom);

END;
BEGIN  END;
BEGIN
LOCALTAB(leftcom,indent+4);
IF TSTRING_length(catrec)<>0 THEN BEGIN
appendstring(catrec,leftcom);
 appendstring(':=s^.ls^.',leftcom);
 appendstring(category,leftcom);
 appendstring('field^;',leftcom);
appendstring('\\',leftcom);
 END
ELSE BEGIN appendstring(';',leftcom);
 appendstring('\\',leftcom);
 END;
IF keymentioned THEN IF keyIvar THEN
BEGIN
LOCALTAB(leftcom,indent+2);
appendstring('IF match THEN ',leftcom);
 appendstring(keystr1,leftcom);
 appendstring(':=s^.ls^.',leftcom);
 
appendstring(category,leftcom);
 appendstring('field^.key;',leftcom);
 appendstring('\\',leftcom);

END;
IF labeled THEN
BEGIN
BEGIN  END;
BEGIN
LOCALTAB(leftcom,indent+2);
appendstring('IF match THEN',leftcom);
appendstring('\\',leftcom);

LOCALTAB(leftcom,indent+4);
appendstring('match:= matchcond',leftcom);
 appendstring(ilabel,leftcom);
 appendstring(';',leftcom);
appendstring('\\',leftcom);

END;
END;
IF TSTRING_length(shorthand)<>0 THEN BEGIN
appendstring(shorthand,leftcom);
 appendstring(':=s;',leftcom);
appendstring('\\',leftcom);
 
END;
IF Xivar THEN
BEGIN
LOCALTAB(leftcom,indent+2);
appendstring('IF match THEN match:=(s^.ls^.',leftcom);
 appendstring(category,leftcom);
 appendstring('field^.index=X',leftcom);

appendstring(Xiname,leftcom);
 appendstring(');',leftcom);
appendstring('\\',leftcom);

END;
IF keymentioned THEN IF NOT keyvar THEN IF not keyIvar THEN
BEGIN
LOCALTAB(leftcom,indent+2);
appendstring('IF match THEN match:=(s^.ls^.',leftcom);
 appendstring(category,leftcom);
 appendstring('field^.key=',leftcom);

appendstring('auxkey(''',leftcom);
 appendstring(keystr1,leftcom);
 appendstring('''));',leftcom);
appendstring('\\',leftcom);

END;
END;
END; {IF NOT NIVAR currenttree:mrucomDECL_psnode;
    rsnode1:mrucomDECL_prsnode;
} 
IF dtreepresent THEN
BEGIN
appendstring('dtree:=dtree',leftcom);
 appendstring(name,leftcom);
 appendstring(';',leftcom);
appendstring('\\',leftcom);

appendstring('IF match THEN ',leftcom);
 
appendstring('match:=AIDDERIV_analyse(dtree,loopholes.retype',leftcom);

appendstring('(s,LISTREE_pstree));',leftcom);
appendstring('\\',leftcom);

appendlocfile(LABELEDDTREE__decomactions,leftcom);
END;
LOCALTAB(leftcom,indent);
appendstring('END{MatchNode};',leftcom);
appendstring('\\',leftcom);

IF dtreepresent THEN
BEGIN

appendstring('VAR result:LISTREE_setofstrees;',rightcom);
appendstring('\\',rightcom);

appendstring('BEGIN',rightcom);
appendstring('\\',rightcom);

appendstring('dtree:=dtree',rightcom);
 appendstring(name,rightcom);
 appendstring(';',rightcom);
appendstring('\\',rightcom);

appendlocfile(LABELEDDTREE__comactions,rightcom);
appendstring('result:=GIDDERIV_generate(dtree);',rightcom);
appendstring('\\',rightcom);

appendstring('LISTREE_takestree(loopholes.retype',rightcom);

appendstring('(N,LISTREE_pstree),result);',rightcom);
appendstring('\\',rightcom);

appendstring('END;',rightcom);
appendstring('\\',rightcom);
 
END
ELSE
BEGIN 
IF Nivar THEN
BEGIN
LOCALTAB(rightcom,indent);
appendstring('BEGIN{CreateNode}',rightcom);
appendstring('\\',rightcom);

LOCALTAB(rightcom,indent+2);
appendstring('N^.ls^:=',rightcom);
 appendstring(NiName,rightcom);
 appendstring(';',rightcom);
appendstring('\\',rightcom);

LOCALTAB(rightcom,indent);
IF Xivar THEN
BEGIN
appendstring('N^.ls^.',rightcom);
 appendstring(category,rightcom);
 appendstring('field^.index:=-1-',rightcom);

appendstring(Xiname,rightcom);
 appendstring(';',rightcom);
appendstring('\\',rightcom);

END;
appendstring('END;{CreateNode}',rightcom);
appendstring('\\',rightcom);

END;
IF NOT Nivar THEN
BEGIN
BEGIN  END;
LOCALTAB(rightcom,indent);
appendstring('BEGIN{CreateNode}',rightcom);
appendstring('\\',rightcom);

LOCALTAB(rightcom,indent+2);
appendstring('N^.ls^.cat := ',rightcom);
 appendstring(category,rightcom);
 appendstring(';',rightcom);
appendstring('\\',rightcom);

IF TSTRING_length(catrec)<>0 THEN 
BEGIN
LOCALTAB(rightcom,indent+2);
appendstring('N^.ls^.',rightcom);
 appendstring(category,rightcom);
 appendstring('field^ := ',rightcom);

appendstring(catrec,rightcom);
 appendstring(';',rightcom);
appendstring('\\',rightcom);
 
END;
LOCALTAB(rightcom,indent);
IF Xivar THEN
BEGIN
appendstring('N^.ls^.',rightcom);
 appendstring(category,rightcom);
 appendstring('field^.index:=-1-',rightcom);

appendstring(Xiname,rightcom);
 appendstring(';',rightcom);
appendstring('\\',rightcom);

END;
appendstring('END{CreateNode};',rightcom);
appendstring('\\',rightcom);

END; {IF NOT NIVAR currenttree:mrucomDECL_psnode;
    rsnode1:mrucomDECL_prsnode;
} 
END;
BAREND_dtreeproc:=dtreeproc;
BAREND_leftcom:=leftcom;
BAREND_rightcom:=rightcom;
BAREND_keymentioned:=keymentioned;
BAREND_keyvar:=keyvar;
BAREND_keystr1:=keystr1;
BAREND_keystr2:=keystr2;
END;
END;
PROCEDURE mrucomCODE_BARELDproc(top:mrucomDECL_psnode
;BARELD_label              :TSTRING_string
;BARELD_labeled              :mrucomlangspec_Bool
;BARELD_indent              :mrucomlangspec_INT
;BARELD_inexist              :mrucomlangspec_bool
;BARELD_bounded              :mrucomlangspec_Bool
;BARELD_righttolefttable              :mrucomlangspec_SETOFidents
;BARELD_righttoleftmatch              :mrucomlangspec_BOOL
;BARELD_root              :TSTRING_string
;BARELD_name              :TSTRING_string
;var BARELD_leftcom              :LOCALFILE
;var BARELD_rightcom              :LOCALFILE
;var BARELD_dtreeproc              :LOCALFILE
;var BARELD_NumberOfItems              :mrucomlangspec_INT
;var BARELD_levelids              :mrucomlangspec_setofidents
);
TYPE stringtype = STRING(30);
VAR currenttree:mrucomDECL_psnode;
    rsnode1:mrucomDECL_prsnode;
 dtreeproc,leftcom,rightcom:LOCALFILE;
ItemId: mrucomLANGSPEC_itemid;
levelident: mrucomLANGSPEC_ident;
ItemIds,ItemIds1: mrucomLANGSPEC_SETOFitemids;
ilabel,levelid,Linitid,str1:TSTRING_string;
shorthandpresent,labeled:Boolean;
i,j,indent:Integer;
relation:LIDOMAINT_synrel;
M,MUM,MUMUM,RM,MR,MMUM,RMUM,MRM,MUMR,bounded,inexist: mrucomLANGSPEC_BOOL;
ItemNumber,
StaticNumberOfItems:Integer;
righttolefttable,levelids,levelids1: mrucomLANGSPEC_setofidents;
shorthand,root,name,relstr:TSTRING_string;
righttoleftmatch,uniquerelseen:BOOLEAN;
level:INTEGER;
totalminnum:INTEGER;
str:STRINGTYPE;len:INTEGER;len1:STR_range;
 PROCEDURE GetLastItem(recs: mrucomLANGSPEC_SETOFitemIds;VAR ItemId: mrucomLANGSPEC_itemId;Nmb: mrucomLANGSPEC_INT);
VAR TempItem: mrucomLANGSPEC_itemId;
i: mrucomLANGSPEC_INT;
BEGIN
i:=1;
While i < Nmb Do
BEGIN
TAKEitemId(TempItem,recs);
i:=i+1;
END;
TAKEitemId(ItemId,recs);
END;
PROCEDURE converSTRING(VAR str1:TSTRING_string;CONST str2:stringtype;len:INTEGER);
VAR i:INTEGER;ch:CHAR;
BEGIN
i:=0;
str1:='';
WHILE i<>LEN DO
BEGIN
i:=i+1;
str1:=str1 || str2[i];
END;
END;
PROCEDURE APPENDSETS(S1: mrucomLANGSPEC_SETOFidents;VAR S2: mrucomLANGSPEC_SETOFidents);
VAR ident1: mrucomLANGSPEC_ident;
BEGIN
WHILE STILLidents(S1) DO
BEGIN
TAKEident(ident1,S1);
APPENDident(ident1,S2)
END
END;
BEGIN
 BEGIN
shorthandpresent:=FALSE;
name:=BARELD_name;
root:=BARELD_root;
initsetofidents(levelids);
Itemid.minnum:=0;Itemid.maxnum:=0;
TSTRING_constantempty(Itemid.str);
Initlocalfile(itemid.leftcom);
inexist:=BARELD_inexist;
INITSETOFitemids(itemIds);
INITSETOFitemids(itemIds1);
InitLOCALFILE(dtreeproc);
InitLOCALFILE(leftcom);
InitLOCALFILE(rightcom);
TSTRING_constantempty(ilabel);
bounded:=BARELD_bounded;
indent:=BARELD_indent;
righttolefttable:=BARELD_righttolefttable;
righttoleftmatch:=BARELD_righttoleftmatch;
ItemNumber:=0;
StaticNumberOfItems:=top^.ldfield.BARELDfield^.NumberOfItems;
Linitid:=root;
TSTRING_append(Linitid,'_');
str1:=MRUCOMDECL_Convinttostring(staticnumberofitems);
TSTRING_append(Linitid,str1);
labeled:=BARELD_labeled;
IF labeled THEN
ilabel:=BARELD_label;
level:=(indent+4) DIV 6;
BEGIN   END;
LOCALTAB(rightcom,indent);
appendstring('PROCEDURE createlist1',rightcom);

appendstring('(VAR wholelist:LSMRUQUO_ListOfStrees);',rightcom);
appendstring('\\',rightcom);

LOCALTAB(rightcom,indent);
appendstring('VAR list:LSMRUQUO_ListOfStrees;',rightcom);
appendstring('\\',rightcom);

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
  BEGIN
ITEM__indent:=indent+2;
ITEM__righttolefttable:=righttolefttable;
ItemNumber:=ItemNumber+1;
BEGIN   END;
LOCALTAB(rightcom,indent);
appendstring('PROCEDURE createitem',rightcom);
 appendstring(mrucomDECL_convinttostring(level),rightcom);
 appendstring(mrucomDECL_convinttostring(itemnumber),rightcom);

appendstring('(VAR list:LSMRUQUO_ListOfStrees);',rightcom);
appendstring('\\',rightcom);

str1:=MRUCOMDECL_Convinttostring(level);
levelid:=root;
TSTRING_append(levelid,'_');
str1:=MRUCOMDECL_Convinttostring(itemnumber);
TSTRING_append(levelid,str1);
levelident.str:=levelid;
appendident(levelident,levelids);
ITEM__name:=name;
ITEM__root:=levelid;
END
; mrucomCODE_ITEMproc(currenttree
,ITEM__indent
,ITEM__righttolefttable
,ITEM__root
,ITEM__name
,ITEM__leftcom
,ITEM__rightcom
,ITEM__dtreeproc
,ITEM__identifier
,ITEM__levelids
);
 BEGIN appendlocfile(ITEM__dtreeproc,dtreeproc);
levelids1:=ITEM__levelids;
appendsets(levelids1,levelids);
itemId.str:=ITEM__identifier;
itemId.minnum:=currenttree^.ldfield.ITEMfield^.minnum;
itemId.maxnum:=currenttree^.ldfield.ITEMfield^.maxnum;
itemid.levelid:=levelid;
itemid.issublist:=currenttree^.ldfield.ITEMfield^.issublist;
appendLocFile(ITEM__rightcom,rightcom);
itemId.leftcom:=ITEM__leftcom;
AppendItemid(itemId,ItemIds);
BEGIN   END;
LOCALTAB(rightcom,indent);
appendstring('BEGIN{createitem',rightcom);
 appendstring(mrucomDECL_convinttostring(level),rightcom);
 
appendstring(mrucomDECL_convinttostring(itemnumber),rightcom);
 appendstring('}',rightcom);
appendstring('\\',rightcom);

LOCALTAB(rightcom,indent);
appendstring('create',rightcom);
 appendstring(ItemId.str,rightcom);
 appendstring('(list);',rightcom);
appendstring('\\',rightcom);

LOCALTAB(rightcom,indent);
appendstring('END;',rightcom);
appendstring('\\',rightcom);

END
END;

3: begin
  BEGIN END
; mrucomCODE_MUVARproc(currenttree
,MUVAR__ident
);
 BEGIN shorthandpresent:=TRUE;
shorthand:=currenttree^.ldfield.MUVARfield^.str; 
END
END;

END;

rsnode1:=rsnode1^.brother END;
BEGIN 
ItemIds1:=ItemIds;
Itemnumber:=StaticNumberOfItems;
indent:=BARELD_indent;
BEGIN   END;
LOCALTAB(rightcom,indent);
appendstring('BEGIN{createlist1}',rightcom);
appendstring('\\',rightcom);

IF NOT(stillitemIds(itemids1)) THEN
BEGIN
LOCALTAB(rightcom,indent);
appendstring('wholelist.first:=NIL;',rightcom);
appendstring('\\',rightcom);

LOCALTAB(rightcom,indent);
appendstring('wholelist.last:=NIL;',rightcom);
appendstring('\\',rightcom);

END
ELSE
BEGIN
appendstring('LSMATCHES_createlist',rightcom);
 
IF staticnumberofitems<5 THEN BEGIN appendstring(mrucomDECL_convinttostring(staticnumberofitems),rightcom);
 END
ELSE appendstring('4',rightcom);
 appendstring('items',rightcom);

i:=0;
WHILE stillItemIds(Itemids1) AND (i<4) DO
BEGIN
i:=i+1;
TakeItemId(ItemId,ItemIds1);
IF ItemId.minnum=0 THEN BEGIN appendstring('0',rightcom);
 END ELSE appendstring('1',rightcom);

END;
appendstring('(wholelist',rightcom);

i:=0;ItemIds1:=Itemids;totalminnum:=0;
WHILE stillItemIds(Itemids1) AND (i<4) DO
BEGIN
i:=i+1;
TakeItemId(ItemId,ItemIds1);
totalminnum:=totalminnum+ItemId.minnum;
appendstring(',createitem',rightcom);
 appendstring(mrucomDECL_convinttostring(level),rightcom);
 appendstring(mrucomDECL_convinttostring(i),rightcom);

END;
appendstring(');',rightcom);
appendstring('\\',rightcom);

END;
WHILE stillItemIds(ItemIds1) DO
BEGIN
i:=i+1;
TakeItemId(ItemId,ItemIds1);
LOCALTAB(rightcom,indent);
IF i=1 THEN BEGIN appendstring('createitem',rightcom);
 appendstring(mrucomDECL_convinttostring(level),rightcom);

appendstring(mrucomDECL_convinttostring(i),rightcom);
 appendstring('(wholelist);',rightcom);
appendstring('\\',rightcom);
 END
ELSE BEGIN appendstring('createitem',rightcom);
 appendstring(mrucomDECL_convinttostring(level),rightcom);
 
appendstring(mrucomDECL_convinttostring(i),rightcom);
 appendstring('(list);',rightcom);
appendstring('\\',rightcom);
 END;
IF i<>1 THEN
BEGIN
IF totalminnum=0 THEN
BEGIN
LOCALTAB(rightcom,indent);
appendstring('IF wholelist.first=NIL THEN',rightcom);
appendstring('\\',rightcom);

LOCALTAB(rightcom,indent);
appendstring(' BEGIN',rightcom);
appendstring('\\',rightcom);

LOCALTAB(rightcom,indent);
appendstring(' wholelist:=list',rightcom);
appendstring('\\',rightcom);

LOCALTAB(rightcom,indent);
appendstring(' END ELSE',rightcom);
appendstring('\\',rightcom);

LOCALTAB(rightcom,indent);
END;
LOCALTAB(rightcom,indent);
appendstring('IF list.first<>NIL THEN',rightcom);
appendstring('\\',rightcom);

LOCALTAB(rightcom,indent+2);
appendstring('BEGIN',rightcom);
appendstring('\\',rightcom);

LOCALTAB(rightcom,indent+2);
appendstring('wholelist.last^.brother:=list.first;',rightcom);
appendstring('\\',rightcom);

LOCALTAB(rightcom,indent+2);
appendstring('wholelist.last:=list.last;',rightcom);
appendstring('\\',rightcom);

LOCALTAB(rightcom,indent+2);
appendstring('END;',rightcom);
appendstring('\\',rightcom);

END;
totalminnum:=totalminnum + itemid.minnum;
END;
LOCALTAB(rightcom,indent);
appendstring('END{createlist1};',rightcom);
appendstring('\\',rightcom);

ItemIds1:=ItemIds;
M:=(staticnumberofitems=1);{check M}
IF M THEN BEGIN
takeitemid(itemid,itemids1);
M:=((itemid.minnum=0) AND (itemid.maxnum>100) AND NOT(itemid.issublist));
END;
ItemIds1:=ItemIds;
RM:=(staticnumberofitems=2);{check RM}
IF RM THEN BEGIN
takeitemid(itemid,itemids1);
RM:=((itemid.minnum=1) AND (itemid.maxnum=1));
END;
IF RM THEN BEGIN
takeitemid(itemid,itemids1);
RM:=((itemid.minnum=0) AND (itemid.maxnum>100) AND NOT(itemid.issublist));
END;
ItemIds1:=ItemIds;
MR:=(staticnumberofitems=2);{check MR}
IF MR THEN BEGIN
takeitemid(itemid,itemids1);
MR:=((itemid.minnum=0) AND (itemid.maxnum>100) AND NOT(itemid.issublist));
END;
IF MR THEN BEGIN
takeitemid(itemid,itemids1);
MR:=((itemid.minnum=1) AND (itemid.maxnum=1));
END;
ItemIds1:=ItemIds;
MMUM:=(staticnumberofitems=4);{check MMUM}
IF MMUM THEN BEGIN
takeitemid(itemid,itemids1);
MMUM:=((itemid.minnum=0) AND (itemid.maxnum>100) AND NOT(itemid.issublist));
END;
IF MMUM THEN BEGIN
takeitemid(itemid,itemids1);
MMUM:=((itemid.minnum=0) AND (itemid.maxnum>100) AND NOT(itemid.issublist));
END;
IF MMUM THEN BEGIN
takeitemid(itemid,itemids1);
uniquerelseen:=FALSE;
MMUM:=((itemid.minnum=1) AND (itemid.maxnum=1));
IF MMUM THEN FOR relation:=lirel0 TO lirel80 DO BEGIN
IF LDUNIQUERELS_body(relation) AND NOT(uniquerelseen) THEN BEGIN
LDTYPETOSTR_rel(str,len1,relation);
len:=len1;
converstring(relstr,str,len);
IF TSTRING_compare(relstr,itemid.str)=0 THEN uniquerelseen:=TRUE;
END;
END;
END;
MMUM:=MMUM AND uniquerelseen;
IF MMUM THEN BEGIN
takeitemid(itemid,itemids1);
MMUM:=((itemid.minnum=0) AND (itemid.maxnum>100) AND NOT(itemid.issublist));
END;
ItemIds1:=ItemIds;
RMUM:=(staticnumberofitems=4);{check RMUM}
IF RMUM THEN BEGIN
takeitemid(itemid,itemids1);
RMUM:=((itemid.minnum=1) AND (itemid.maxnum=1));
END;
IF RMUM THEN BEGIN
takeitemid(itemid,itemids1);
RMUM:=((itemid.minnum=0) AND (itemid.maxnum>100) AND NOT(itemid.issublist));
END;
IF RMUM THEN BEGIN
takeitemid(itemid,itemids1);
uniquerelseen:=FALSE;
RMUM:=((itemid.minnum=1) AND (itemid.maxnum=1));
IF RMUM THEN FOR relation:=lirel0 TO lirel80 DO BEGIN
IF LDUNIQUERELS_body(relation) AND NOT(uniquerelseen) THEN BEGIN
LDTYPETOSTR_rel(str,len1,relation);
len:=len1;
converstring(relstr,str,len);
IF TSTRING_compare(relstr,itemid.str)=0 THEN uniquerelseen:=TRUE;
END;
END;
END;
RMUM:=RMUM AND uniquerelseen;
IF RMUM THEN BEGIN
takeitemid(itemid,itemids1);
RMUM:=((itemid.minnum=0) AND (itemid.maxnum>100) AND NOT(itemid.issublist));
END;
ItemIds1:=ItemIds;
MUMR:=(staticnumberofitems=4);{check MUMR}
IF MUMR THEN BEGIN
takeitemid(itemid,itemids1);
MUMR:=((itemid.minnum=0) AND (itemid.maxnum>100) AND NOT(itemid.issublist));
END;
IF MUMR THEN BEGIN
takeitemid(itemid,itemids1);
uniquerelseen:=FALSE;
MUMR:=((itemid.minnum=1) AND (itemid.maxnum=1));
IF MUMR THEN FOR relation:=lirel0 TO lirel80 DO BEGIN
IF LDUNIQUERELS_body(relation) AND NOT(uniquerelseen) THEN BEGIN
LDTYPETOSTR_rel(str,len1,relation);
len:=len1;
converstring(relstr,str,len);
IF TSTRING_compare(relstr,itemid.str)=0 THEN uniquerelseen:=TRUE;
END;
END;
END;
MUMR:=MUMR AND uniquerelseen;
IF MUMR THEN BEGIN
takeitemid(itemid,itemids1);
MUMR:=((itemid.minnum=0) AND (itemid.maxnum>100) AND NOT(itemid.issublist));
END;
IF MUMR THEN BEGIN
takeitemid(itemid,itemids1);
MUMR:=((itemid.minnum=1) AND (itemid.maxnum=1));
END;
MUM:=(staticnumberofitems=3);{check MUM}
IF MUM THEN BEGIN
takeitemid(itemid,itemids1);
MUM:=((itemid.minnum=0) AND (itemid.maxnum>100) AND NOT(itemid.issublist));
END;
IF MUM THEN BEGIN
takeitemid(itemid,itemids1);
uniquerelseen:=FALSE;
MUM:=((itemid.minnum=1) AND (itemid.maxnum=1));
IF MUM THEN FOR relation:=lirel0 TO lirel80 DO BEGIN
IF LDUNIQUERELS_body(relation) AND NOT(uniquerelseen) THEN BEGIN
LDTYPETOSTR_rel(str,len1,relation);
len:=len1;
converstring(relstr,str,len);
IF TSTRING_compare(relstr,itemid.str)=0 THEN uniquerelseen:=TRUE;
END;
END;
END;
MUM:=MUM AND uniquerelseen;
IF MUM THEN BEGIN
takeitemid(itemid,itemids1);
MUM:=((itemid.minnum=0) AND (itemid.maxnum>100) AND NOT(itemid.issublist));
END;
ItemIds1:=ItemIds;
MRM:=(staticnumberofitems=3) AND NOT(MUM);{check MRM}
IF MRM THEN BEGIN
takeitemid(itemid,itemids1);
MRM:=((itemid.minnum=0) AND (itemid.maxnum>100) AND NOT(itemid.issublist));
END;
IF MRM THEN BEGIN
takeitemid(itemid,itemids1);
MRM:=((itemid.minnum=1) AND (itemid.maxnum=1));
END;
IF MRM THEN BEGIN
takeitemid(itemid,itemids1);
MRM:=((itemid.minnum=0) AND (itemid.maxnum>100) AND NOT(itemid.issublist));
END;
itemids1:=itemids;
MUMUM:=(staticnumberofitems=5);{check MUMUM}
IF MUMUM THEN BEGIN
takeitemid(itemid,itemids1);
MUMUM:=((itemid.minnum=0) AND (itemid.maxnum>100) AND NOT(itemid.issublist));
END;
IF MUMUM THEN BEGIN
takeitemid(itemid,itemids1);
MUMUM:=((itemid.minnum=1) AND (itemid.maxnum=1));
uniquerelseen:=FALSE;
IF MUMUM THEN FOR relation:=lirel0 TO lirel80 DO BEGIN
IF LDUNIQUERELS_body(relation) AND NOT(uniquerelseen) THEN BEGIN
LDTYPETOSTR_rel(str,len1,relation);
len:=len1;
converstring(relstr,str,len);
IF TSTRING_compare(relstr,itemid.str)=0 THEN uniquerelseen:=TRUE;
END;
END;
END;
MUMUM:=MUMUM AND uniquerelseen;
IF MUMUM THEN BEGIN
takeitemid(itemid,itemids1);
MUMUM:=((itemid.minnum=0) AND (itemid.maxnum>100) AND NOT(itemid.issublist));
END;
IF MUMUM THEN BEGIN
takeitemid(itemid,itemids1);
MUMUM:=((itemid.minnum=1) AND (itemid.maxnum=1));
uniquerelseen:=FALSE;
IF MUMUM THEN FOR relation:=lirel0 TO lirel80 DO BEGIN
IF LDUNIQUERELS_body(relation) AND NOT(uniquerelseen) THEN BEGIN
LDTYPETOSTR_rel(str,len1,relation);
len:=len1;
converstring(relstr,str,len);
IF TSTRING_compare(relstr,itemid.str)=0 THEN uniquerelseen:=TRUE;
END;
END;
END;
MUMUM:=MUMUM AND uniquerelseen;
IF MUMUM THEN BEGIN
takeitemid(itemid,itemids1);
MUMUM:=((itemid.minnum=0) AND (itemid.maxnum>100) AND NOT(itemid.issublist));
END;
IF bounded OR inexist OR labeled OR righttoleftmatch THEN BEGIN
MUM:=FALSE;
MUMUM:=FALSE;
RMUM:=FALSE;
MUMR:=FALSE;
MMUM:=FALSE;
M:=FALSE;
MR:=FALSE;
RM:=FALSE;
MRM:=FALSE;
END;
IF NOT (MUMR OR M OR MMUM OR RMUM OR MUMUM OR MUM OR MRM OR MR OR RM) THEN
BEGIN
ItemIds1:=ItemIds;
WHILE itemnumber>=1 DO
BEGIN
IF righttoleftmatch THEN Getlastitem(ItemIds1,ItemId,itemnumber)
ELSE TakeItemid(ItemId,ItemIds1);
BEGIN END;
BEGIN
LOCALTAB(leftcom,indent);
appendstring('PROCEDURE MatchList',leftcom);
 appendstring(mrucomDECL_convinttostring(ItemNumber),leftcom);
 appendstring('Items',leftcom);

appendstring('(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);',leftcom);
appendstring('\\',leftcom);

LOCALTAB(leftcom,indent);
appendstring('VAR',leftcom);
appendstring('\\',leftcom);

LOCALTAB(leftcom,indent+2);
appendstring('itemmatch,listmatch:Boolean;',leftcom);
appendstring('\\',leftcom);

END;
itemnumber:=itemnumber - 1;
indent:=indent+2;
AppendLocFile(ItemId.leftcom,Leftcom);
END;
END
ELSE BEGIN
appendstring('PROCEDURE MatchList',leftcom);
 appendstring(mrucomDECL_convinttostring(StaticNumberOfItems),leftcom);
 appendstring('Items',leftcom);

appendstring('(L:LSSTREE_pRelNode;first:Boolean;VAR match:Boolean);',leftcom);
appendstring('\\',leftcom);

itemids1:=itemids;
i:=1;
WHILE stillitemids(itemids1) DO BEGIN
takeitemid(itemid,itemids1);
appendlocfile(itemid.leftcom,leftcom);
appendstring('PROCEDURE item',leftcom);
 appendstring(mrucomDECL_convinttostring(i),leftcom);
 appendstring('(Lfirst,Llast:LSSTREE_prelnode;VAR match:BOOLEAN);',leftcom);

appendstring('BEGIN match_',leftcom);
 appendstring(itemid.str,leftcom);
 appendstring('(Lfirst,Llast,TRUE,match);',leftcom);
appendstring('\\',leftcom);

appendstring('END;',leftcom);
appendstring('\\',leftcom);

i:=i+1;
END;
IF RM THEN BEGIN
appendstring('BEGIN IF first THEN LSMATCHES_RMfirst(L,match',leftcom);

itemids1:=itemids;
i:=1;
WHILE stillitemids(itemids1) DO BEGIN
takeitemid(itemid,itemids1);
appendstring(',item',leftcom);
 appendstring(mrucomDECL_convinttostring(i),leftcom);
 appendstring(',Lfirst',leftcom);
 appendstring(itemid.levelid,leftcom);

appendstring(',Llast',leftcom);
 appendstring(itemid.levelid,leftcom);
appendstring('\\',leftcom);

i:=i+1;
END;
itemids1:=itemids;takeitemid(itemid,itemids1);
appendstring(') ELSE match_',leftcom);
 appendstring(itemid.str,leftcom);

appendstring('(Lfirst',leftcom);
 appendstring(itemid.levelid,leftcom);
 appendstring(',Lfirst',leftcom);
 appendstring(itemid.levelid,leftcom);

appendstring(',FALSE,match) END;',leftcom);
appendstring('\\',leftcom);

END;
IF MR THEN BEGIN
appendstring('BEGIN IF first THEN LSMATCHES_MRfirst(L,match',leftcom);

itemids1:=itemids;
i:=1;
WHILE stillitemids(itemids1) DO BEGIN
takeitemid(itemid,itemids1);
appendstring(',item',leftcom);
 appendstring(mrucomDECL_convinttostring(i),leftcom);
 appendstring(',Lfirst',leftcom);
 appendstring(itemid.levelid,leftcom);

appendstring(',Llast',leftcom);
 appendstring(itemid.levelid,leftcom);
appendstring('\\',leftcom);

i:=i+1;
END;
itemids1:=itemids;takeitemid(itemid,itemids1);takeitemid(itemid,itemids1);
appendstring(') ELSE match_',leftcom);
 appendstring(itemid.str,leftcom);

appendstring('(Lfirst',leftcom);
 appendstring(itemid.levelid,leftcom);
 appendstring(',Lfirst',leftcom);
 appendstring(itemid.levelid,leftcom);

appendstring(',FALSE,match) END;',leftcom);
appendstring('\\',leftcom);

END;
IF M THEN BEGIN
itemids1:=itemids;takeitemid(itemid,itemids1);
appendstring('BEGIN IF first THEN BEGIN IF L=NIL THEN',leftcom);
appendstring('\\',leftcom);

appendstring('match_',leftcom);
 appendstring(itemid.str,leftcom);
 appendstring('(NIL,NIL,TRUE,match) ELSE BEGIN',leftcom);
appendstring('\\',leftcom);

appendstring('Llast',leftcom);
 appendstring(itemid.levelid,leftcom);
 appendstring(':=L;',leftcom);

appendstring('WHILE Llast',leftcom);
 appendstring(itemid.levelid,leftcom);
 appendstring('^.brother<>NIL DO',leftcom);
appendstring('\\',leftcom);

appendstring('Llast',leftcom);
 appendstring(itemid.levelid,leftcom);
 appendstring(':=Llast',leftcom);
 appendstring(itemid.levelid,leftcom);
 appendstring('^.brother;',leftcom);
appendstring('\\',leftcom);

appendstring('match_',leftcom);
 appendstring(itemid.str,leftcom);
 appendstring('(L,Llast',leftcom);
 appendstring(itemid.levelid,leftcom);
 appendstring(',TRUE,match) ',leftcom);

appendstring('END END ELSE match:=FALSE END;',leftcom);
appendstring('\\',leftcom);

END;
IF MMUM THEN BEGIN
appendstring('BEGIN IF first THEN LSMATCHES_MMUMfirst(L,match',leftcom);

itemids1:=itemids;
i:=1;
WHILE stillitemids(itemids1) DO BEGIN
takeitemid(itemid,itemids1);
IF i=3 THEN BEGIN appendstring(',',leftcom);
 appendstring(itemid.str,leftcom);
 END;
appendstring(',item',leftcom);
 appendstring(mrucomDECL_convinttostring(i),leftcom);
 appendstring(',Lfirst',leftcom);
 appendstring(itemid.levelid,leftcom);

appendstring(',Llast',leftcom);
 appendstring(itemid.levelid,leftcom);
appendstring('\\',leftcom);

i:=i+1;
END;
itemids1:=itemids;takeitemid(itemid,itemids1);takeitemid(itemid,itemids1);
takeitemid(itemid,itemids1);
appendstring(') ELSE BEGIN match_',leftcom);
 appendstring(itemid.str,leftcom);

appendstring('(Lfirst',leftcom);
 appendstring(itemid.levelid,leftcom);
 appendstring(',Lfirst',leftcom);
 appendstring(itemid.levelid,leftcom);

appendstring(',FALSE,match);',leftcom);
appendstring('\\',leftcom);

takeitemid(itemid,itemids1);takeitemid(itemid,itemids1);
appendstring('IF NOT match THEN LSMATCHES_MMUMnext(L,match',leftcom);

itemids1:=itemids;
i:=1;
WHILE stillitemids(itemids1) DO BEGIN
takeitemid(itemid,itemids1);
IF i=3 THEN BEGIN appendstring(',',leftcom);
 appendstring(itemid.str,leftcom);
 END;
appendstring(',item',leftcom);
 appendstring(mrucomDECL_convinttostring(i),leftcom);
 appendstring(',Lfirst',leftcom);
 appendstring(itemid.levelid,leftcom);

appendstring(',Llast',leftcom);
 appendstring(itemid.levelid,leftcom);
appendstring('\\',leftcom);

i:=i+1;
END;
appendstring(') END END;',leftcom);
appendstring('\\',leftcom);

END;
IF RMUM THEN BEGIN
appendstring('BEGIN IF first THEN LSMATCHES_RMUMfirst(L,match',leftcom);

itemids1:=itemids;
i:=1;
WHILE stillitemids(itemids1) DO BEGIN
takeitemid(itemid,itemids1);
IF i=3 THEN BEGIN appendstring(',',leftcom);
 appendstring(itemid.str,leftcom);
 END;
appendstring(',item',leftcom);
 appendstring(mrucomDECL_convinttostring(i),leftcom);
 appendstring(',Lfirst',leftcom);
 appendstring(itemid.levelid,leftcom);

appendstring(',Llast',leftcom);
 appendstring(itemid.levelid,leftcom);
appendstring('\\',leftcom);

i:=i+1;
END;
itemids1:=itemids;takeitemid(itemid,itemids1);
appendstring(') ELSE BEGIN match_',leftcom);
 appendstring(itemid.str,leftcom);

appendstring('(Lfirst',leftcom);
 appendstring(itemid.levelid,leftcom);
 appendstring(',Lfirst',leftcom);
 appendstring(itemid.levelid,leftcom);

appendstring(',FALSE,match);',leftcom);
appendstring('\\',leftcom);

takeitemid(itemid,itemids1);takeitemid(itemid,itemids1);
appendstring('IF NOT match THEN match_',leftcom);
 appendstring(itemid.str,leftcom);

appendstring('(Lfirst',leftcom);
 appendstring(itemid.levelid,leftcom);
 appendstring(',Lfirst',leftcom);
 appendstring(itemid.levelid,leftcom);

appendstring(',FALSE,match) END END;',leftcom);
appendstring('\\',leftcom);

END;
IF MUMR THEN BEGIN
appendstring('BEGIN IF first THEN LSMATCHES_MUMRfirst(L,match',leftcom);

itemids1:=itemids;
i:=1;
WHILE stillitemids(itemids1) DO BEGIN
takeitemid(itemid,itemids1);
IF i=2 THEN BEGIN appendstring(',',leftcom);
 appendstring(itemid.str,leftcom);
 END;
appendstring(',item',leftcom);
 appendstring(mrucomDECL_convinttostring(i),leftcom);
 appendstring(',Lfirst',leftcom);
 appendstring(itemid.levelid,leftcom);

appendstring(',Llast',leftcom);
 appendstring(itemid.levelid,leftcom);
appendstring('\\',leftcom);

i:=i+1;
END;
itemids1:=itemids;takeitemid(itemid,itemids1);takeitemid(itemid,itemids1);
appendstring(') ELSE BEGIN match_',leftcom);
 appendstring(itemid.str,leftcom);

appendstring('(Lfirst',leftcom);
 appendstring(itemid.levelid,leftcom);
 appendstring(',Lfirst',leftcom);
 appendstring(itemid.levelid,leftcom);

appendstring(',FALSE,match);',leftcom);
appendstring('\\',leftcom);

takeitemid(itemid,itemids1);takeitemid(itemid,itemids1);
appendstring('IF NOT match THEN match_',leftcom);
 appendstring(itemid.str,leftcom);

appendstring('(Lfirst',leftcom);
 appendstring(itemid.levelid,leftcom);
 appendstring(',Lfirst',leftcom);
 appendstring(itemid.levelid,leftcom);

appendstring(',FALSE,match) END END;',leftcom);
appendstring('\\',leftcom);

END;
IF MUM THEN BEGIN
appendstring('BEGIN IF first THEN LSMATCHES_MUMfirst(L,match',leftcom);

itemids1:=itemids;
i:=1;
WHILE stillitemids(itemids1) DO BEGIN
takeitemid(itemid,itemids1);
IF i=2 THEN BEGIN appendstring(',',leftcom);
 appendstring(itemid.str,leftcom);
 END;
appendstring(',item',leftcom);
 appendstring(mrucomDECL_convinttostring(i),leftcom);
 appendstring(',Lfirst',leftcom);
 appendstring(itemid.levelid,leftcom);

appendstring(',Llast',leftcom);
 appendstring(itemid.levelid,leftcom);
appendstring('\\',leftcom);

i:=i+1;
END;
itemids1:=itemids;takeitemid(itemid,itemids1);takeitemid(itemid,itemids1);
appendstring(') ELSE match_',leftcom);
 appendstring(itemid.str,leftcom);

appendstring('(Lfirst',leftcom);
 appendstring(itemid.levelid,leftcom);
 appendstring(',Lfirst',leftcom);
 appendstring(itemid.levelid,leftcom);

appendstring(',FALSE,match) END;',leftcom);
appendstring('\\',leftcom);

END;
IF MRM THEN BEGIN
appendstring('BEGIN IF first THEN LSMATCHES_MRMfirst(L,match',leftcom);

itemids1:=itemids;
i:=1;
WHILE stillitemids(itemids1) DO BEGIN
takeitemid(itemid,itemids1);
appendstring(',item',leftcom);
 appendstring(mrucomDECL_convinttostring(i),leftcom);
 appendstring(',Lfirst',leftcom);
 appendstring(itemid.levelid,leftcom);

appendstring(',Llast',leftcom);
 appendstring(itemid.levelid,leftcom);
appendstring('\\',leftcom);

i:=i+1;
END;
itemids1:=itemids;takeitemid(itemid,itemids1);takeitemid(itemid,itemids1);
appendstring(') ELSE BEGIN match_',leftcom);
 appendstring(itemid.str,leftcom);

appendstring('(Lfirst',leftcom);
 appendstring(itemid.levelid,leftcom);
 appendstring(',Lfirst',leftcom);
 appendstring(itemid.levelid,leftcom);

appendstring(',FALSE,match);',leftcom);
appendstring('\\',leftcom);

appendstring('IF NOT match THEN LSMATCHES_MRMnext(L,match',leftcom);

itemids1:=itemids;
i:=1;
WHILE stillitemids(itemids1) DO BEGIN
takeitemid(itemid,itemids1);
appendstring(',item',leftcom);
 appendstring(mrucomDECL_convinttostring(i),leftcom);
 appendstring(',Lfirst',leftcom);
 appendstring(itemid.levelid,leftcom);

appendstring(',Llast',leftcom);
 appendstring(itemid.levelid,leftcom);
appendstring('\\',leftcom);

i:=i+1;
END;
appendstring(') END END;',leftcom);
appendstring('\\',leftcom);

END;
IF MUMUM THEN BEGIN
appendstring('BEGIN IF first THEN LSMATCHES_MUMUMfirst(L,match',leftcom);

itemids1:=itemids;
i:=1;
WHILE stillitemids(itemids1) DO BEGIN
takeitemid(itemid,itemids1);
IF i=2 THEN BEGIN appendstring(',',leftcom);
 appendstring(itemid.str,leftcom);
 END;
IF i=4 THEN BEGIN appendstring(',',leftcom);
 appendstring(itemid.str,leftcom);
 END;
appendstring(',item',leftcom);
 appendstring(mrucomDECL_convinttostring(i),leftcom);
 appendstring(',Lfirst',leftcom);
 appendstring(itemid.levelid,leftcom);

appendstring(',Llast',leftcom);
 appendstring(itemid.levelid,leftcom);
appendstring('\\',leftcom);

i:=i+1;
END;
itemids1:=itemids;takeitemid(itemid,itemids1);takeitemid(itemid,itemids1);
appendstring(') ELSE BEGIN match_',leftcom);
 appendstring(itemid.str,leftcom);

appendstring('(Lfirst',leftcom);
 appendstring(itemid.levelid,leftcom);
 appendstring(',Lfirst',leftcom);
 appendstring(itemid.levelid,leftcom);

appendstring(',FALSE,match);',leftcom);
appendstring('\\',leftcom);

takeitemid(itemid,itemids1);takeitemid(itemid,itemids1);
appendstring('IF NOT match THEN match_',leftcom);
 appendstring(itemid.str,leftcom);

appendstring('(Lfirst',leftcom);
 appendstring(itemid.levelid,leftcom);
 appendstring(',Lfirst',leftcom);
 appendstring(itemid.levelid,leftcom);

appendstring(',FALSE,match) END END;',leftcom);
appendstring('\\',leftcom);

END;
END;
itemnumber:=Staticnumberofitems;
ItemIds1:=ItemIds;
i:=1;
WHILE i <= StaticNumberOfItems DO
BEGIN
indent:=indent-2;
IF NOT(righttoleftmatch) THEN
GetLastItem(itemIds1,ItemId,ItemNumber)
ELSE takeitemId(itemid,itemIds1);
levelid:=itemid.levelid;
IF NOT( bounded OR RM OR MR OR M OR MMUM OR RMUM OR MUMR OR MUM OR MRM OR MUMUM OR
(inexist AND (i=1)) OR 
(labeled AND (i=staticnumberofitems)) OR
righttoleftmatch) AND
(((itemid.minnum=0) AND (itemid.maxnum=1) AND NOT(itemid.issublist)) OR
((itemid.minnum=0) AND (itemid.maxnum>100) AND NOT(itemid.issublist)) OR
((itemid.minnum=1) AND (itemid.maxnum=1))) THEN
BEGIN {normal cases}
IF (itemid.minnum=0) AND (itemid.maxnum=1) THEN 
BEGIN
appendstring('BEGIN LSMATCHES_matchlistsigma',leftcom);
appendstring('\\',leftcom);
 appendstring('(L,first,match,match_',leftcom);

appendstring(itemid.str,leftcom);
 appendstring(',matchlist',leftcom);
 appendstring(mrucomDECL_convinttostring(i-1),leftcom);
 
appendstring('items,',leftcom);
appendstring('\\',leftcom);

appendstring('Llast',leftcom);
 appendstring(levelid,leftcom);
 appendstring(',Lfirst',leftcom);
 appendstring(levelid,leftcom);

appendstring(',Lrest',leftcom);
 appendstring(levelid,leftcom);
 appendstring(',nomoretrees',leftcom);
 appendstring(levelid,leftcom);

appendstring(',i',leftcom);
 appendstring(levelid,leftcom);
 appendstring(') END;',leftcom);
appendstring('\\',leftcom);

END;
IF (itemid.minnum=0) AND (itemid.maxnum>100) THEN 
BEGIN
appendstring('BEGIN LSMATCHES_matchlistmu',leftcom);
appendstring('\\',leftcom);
 appendstring('(L,first,match,match_',leftcom);

appendstring(itemid.str,leftcom);
 appendstring(',matchlist',leftcom);
 appendstring(mrucomDECL_convinttostring(i-1),leftcom);
 
appendstring('items,',leftcom);
appendstring('\\',leftcom);

appendstring('Llast',leftcom);
 appendstring(levelid,leftcom);
 appendstring(',Lfirst',leftcom);
 appendstring(levelid,leftcom);

appendstring(',Lrest',leftcom);
 appendstring(levelid,leftcom);
 appendstring(',nomoretrees',leftcom);
 appendstring(levelid,leftcom);

appendstring(') END;',leftcom);
appendstring('\\',leftcom);

END;
IF (itemid.minnum=1) AND (itemid.maxnum=1) THEN 
BEGIN
appendstring('BEGIN LSMATCHES_matchlistreltree',leftcom);
appendstring('\\',leftcom);
 appendstring('(L,first,match,match_',leftcom);

appendstring(itemid.str,leftcom);
 appendstring(',matchlist',leftcom);
 appendstring(mrucomDECL_convinttostring(i-1),leftcom);
 
appendstring('items,',leftcom);
appendstring('\\',leftcom);

appendstring('Llast',leftcom);
 appendstring(levelid,leftcom);
 appendstring(',Lfirst',leftcom);
 appendstring(levelid,leftcom);

appendstring(',Lrest',leftcom);
 appendstring(levelid,leftcom);
 appendstring(',nomoretrees',leftcom);
 appendstring(levelid,leftcom);

appendstring(') END;',leftcom);
appendstring('\\',leftcom);

END;
END; {normal cases}
IF bounded OR 
(inexist AND (i=1)) OR 
(labeled AND (i=staticnumberofitems)) OR
righttoleftmatch OR
NOT (((itemid.minnum=0) AND (itemid.maxnum=1) AND NOT(itemid.issublist)) OR
((itemid.minnum=0) AND (itemid.maxnum>100) AND NOT(itemid.issublist)) OR
((itemid.minnum=1) AND (itemid.maxnum=1))) THEN
BEGIN {special cases}
BEGIN END;
BEGIN
LOCALTAB(leftcom,indent);
appendstring('BEGIN {MatchList',leftcom);
;appendstring(mrucomDECL_convinttostring(i),leftcom);
;appendstring('Items}',leftcom);
appendstring('\\',leftcom);

LOCALTAB(leftcom,indent+2);
appendstring('match:=FALSE;',leftcom);
appendstring('\\',leftcom);

IF shorthandpresent THEN BEGIN
appendstring(shorthand,leftcom);
 appendstring('.first:=L;',leftcom);
appendstring('\\',leftcom);

appendstring(shorthand,leftcom);
 appendstring('.last:=NIL;',leftcom);
appendstring('\\',leftcom);

IF bounded THEN BEGIN
appendstring(shorthand,leftcom);
 appendstring('.last:=Lfinal;',leftcom);
appendstring('\\',leftcom);

END;
END;
LOCALTAB(leftcom,indent+2);
appendstring('IF first THEN',leftcom);
appendstring('\\',leftcom);

LOCALTAB(leftcom,indent+4);
appendstring('BEGIN ',leftcom);
appendstring('\\',leftcom);

LOCALTAB(leftcom,indent+2);
appendstring('nomoretrees',leftcom);
 appendstring(levelid,leftcom);
 appendstring(':=False;',leftcom);
appendstring('\\',leftcom);

IF righttoleftmatch THEN
BEGIN
IF i=staticnumberofitems THEN
BEGIN
IF bounded THEN
BEGIN
LOCALTAB(leftcom,indent+4);
appendstring('Lrest',leftcom);
 appendstring(levelid,leftcom);
 appendstring(':=Lfinal;',leftcom);
appendstring('\\',leftcom);

END
ELSE
BEGIN
LOCALTAB(leftcom,indent+4);
appendstring('Lrest',leftcom);
 appendstring(levelid,leftcom);
 appendstring(':=L;',leftcom);
appendstring('\\',leftcom);

LOCALTAB(leftcom,indent+4);
appendstring('IF Lrest',leftcom);
 appendstring(levelid,leftcom);
 appendstring('<>NIL THEN',leftcom);
appendstring('\\',leftcom);

LOCALTAB(leftcom,indent+6);
appendstring('WHILE Lrest',leftcom);
 appendstring(levelid,leftcom);
 appendstring('^.brother<>NIL DO',leftcom);
appendstring('\\',leftcom);

LOCALTAB(leftcom,indent+8);
appendstring('BEGIN',leftcom);
appendstring('\\',leftcom);

LOCALTAB(leftcom,indent+8);
appendstring('Lrest',leftcom);
 appendstring(levelid,leftcom);
 appendstring(':=Lrest',leftcom);
 
appendstring(levelid,leftcom);
 appendstring('^.brother',leftcom);
appendstring('\\',leftcom);

LOCALTAB(leftcom,indent+8);
appendstring('END;',leftcom);
appendstring('\\',leftcom);

END;
LOCALTAB(leftcom,indent+4);
appendstring('Linit',leftcom);
 appendstring(Linitid,leftcom);
 appendstring(':=L;',leftcom);
appendstring('\\',leftcom);

END
ELSE 
BEGIN
LOCALTAB(leftcom,indent+4);
appendstring('Lrest',leftcom);
 appendstring(levelid,leftcom);
 appendstring(':=L;',leftcom);
appendstring('\\',leftcom);

LOCALTAB(leftcom,indent+4);
appendstring('L:=Linit',leftcom);
 appendstring(Linitid,leftcom);
 appendstring(';',leftcom);
appendstring('\\',leftcom);

END
END;
LOCALTAB(leftcom,indent+4);
IF (ItemId.minnum=0) and not(righttoleftmatch) THEN 
BEGIN appendstring('Llast',leftcom);
 appendstring(levelid,leftcom);
 
appendstring(':=NIL;Lrest',leftcom);
 appendstring(levelid,leftcom);
 appendstring(':=L;',leftcom);
 END;
appendstring('Lfirst',leftcom);
 appendstring(levelid,leftcom);
 appendstring(':=NIL;',leftcom);
appendstring('\\',leftcom);

j:=0;
WHILE j<>itemId.minnum DO
BEGIN
j:=j+1;
IF j>1 THEN
BEGIN
LOCALTAB(leftcom,indent+4);
appendstring('IF NOT nomoretrees',leftcom);
 appendstring(levelid,leftcom);
 appendstring(' THEN ',leftcom);
 appendstring('\\',leftcom);

LOCALTAB(leftcom,2)
END;
LOCALTAB(leftcom,indent+4);
IF NOT(righttoleftmatch) then
BEGIN
appendstring('SelectLfirstAndLlast(Lfirst',leftcom);
 appendstring(levelid,leftcom);
 appendstring(',Llast',leftcom);

appendstring(levelid,leftcom);
 appendstring(',Lrest',leftcom);

appendstring(levelid,leftcom);
appendstring('\\',leftcom);
 appendstring(',nomoretrees',leftcom);

appendstring(levelid,leftcom);
 appendstring(',L);',leftcom);
appendstring('\\',leftcom);

IF bounded THEN
BEGIN
LOCALTAB(leftcom,indent+4);
appendstring('IF Llast',leftcom);
 appendstring(levelid,leftcom);
 
appendstring('=Lfinal THEN Lrest',leftcom);
 appendstring(levelid,leftcom);
 appendstring(':=NIL;',leftcom);
appendstring('\\',leftcom);

END;
END
ELSE 
BEGIN
appendstring('TcelesLfirstAndLlast(Lfirst',leftcom);
 appendstring(levelid,leftcom);
 appendstring(',Llast',leftcom);

appendstring(levelid,leftcom);
 appendstring(',Lrest',leftcom);

appendstring(levelid,leftcom);
 appendstring('\\',leftcom);
appendstring(',nomoretrees',leftcom);

appendstring(levelid,leftcom);
 appendstring(',L);',leftcom);
appendstring('\\',leftcom);

END
END;
IF ItemId.minnum=ItemId.maxnum THEN
BEGIN
LOCALTAB(leftcom,indent+4);
appendstring('IF NOT nomoretrees',leftcom);
 appendstring(levelid,leftcom);
 appendstring(' THEN',leftcom);
 appendstring('\\',leftcom);

LOCALTAB(leftcom,indent+6);
appendstring('BEGIN',leftcom);
 appendstring('\\',leftcom);

LOCALTAB(leftcom,indent+6);
appendstring('Match_',leftcom);
;appendstring(ItemId.str,leftcom);
;appendstring('(Lfirst',leftcom);
 appendstring(levelid,leftcom);
 
appendstring(',Llast',leftcom);
 appendstring(levelid,leftcom);
 appendstring(',TRUE,itemmatch);',leftcom);
appendstring('\\',leftcom);

LOCALTAB(leftcom,indent+6);
IF NOT((i=1) AND inexist) THEN
BEGIN
appendstring('IF itemmatch THEN',leftcom);
appendstring('\\',leftcom);

IF NOT (bounded and (i=1) and not(righttoleftmatch)) THEN
BEGIN
LOCALTAB(leftcom,indent+8);
appendstring('MatchList',leftcom);
;appendstring(mrucomDECL_convinttostring(i-1),leftcom);
;appendstring('Items(Lrest',leftcom);

appendstring(levelid,leftcom);
 appendstring(',TRUE,listmatch);',leftcom);
appendstring('\\',leftcom);

END
ELSE
BEGIN
LOCALTAB(leftcom,indent+8);
appendstring('listmatch:= (Lrest',leftcom);
 appendstring(levelid,leftcom);
 
appendstring('=NIL) AND ((Lfirst',leftcom);
 appendstring(levelid,leftcom);
 appendstring('<>NIL) OR (L=NIL));',leftcom);
appendstring('\\',leftcom);

END;
LOCALTAB(leftcom,indent+6);
appendstring('match:=(itemmatch AND listmatch);',leftcom);
appendstring('\\',leftcom);

LOCALTAB(leftcom,indent+6);
END
ELSE
BEGIN
appendstring('match:=itemmatch;',leftcom);
appendstring('\\',leftcom);

END;
appendstring('END',leftcom);
 appendstring('\\',leftcom);

END;
LOCALTAB(leftcom,indent+4);
appendstring('END',leftcom);
appendstring('\\',leftcom);

LOCALTAB(leftcom,indent+2);
appendstring('ELSE',leftcom);
appendstring('\\',leftcom);
 
LOCALTAB(leftcom,indent+2);
appendstring('BEGIN',leftcom);
appendstring('\\',leftcom);

IF NOT righttoleftmatch THEN 
BEGIN 
IF bounded THEN
BEGIN
appendstring('IF Llast',leftcom);
 appendstring(levelid,leftcom);
 
appendstring('=Lfinal THEN Lrest',leftcom);
 appendstring(levelid,leftcom);
 appendstring(':=NIL;',leftcom);
appendstring('\\',leftcom);

END;
END
ELSE
BEGIN
appendstring('L:=Linit',leftcom);
 appendstring(Linitid,leftcom);
 appendstring(';',leftcom);
appendstring('\\',leftcom);

END;
LOCALTAB(leftcom,indent+4);
appendstring('Match_',leftcom);
;appendstring(ItemId.str,leftcom);
;appendstring('(Lfirst',leftcom);
 appendstring(levelid,leftcom);
 
appendstring(',Llast',leftcom);
 appendstring(levelid,leftcom);
 appendstring(',FALSE,match);',leftcom);
appendstring('\\',leftcom);

LOCALTAB(leftcom,indent+4);
IF NOT((i=1) AND inexist) THEN
BEGIN
appendstring('IF NOT match THEN',leftcom);
appendstring('\\',leftcom);

LOCALTAB(leftcom,indent+6);
appendstring('MatchList',leftcom);
;appendstring(mrucomDECL_convinttostring(i-1),leftcom);
;appendstring('Items(Lrest',leftcom);
 
appendstring(levelid,leftcom);
 appendstring(',FALSE,match);',leftcom);
appendstring('\\',leftcom);

LOCALTAB(leftcom,indent+2);
END;
appendstring('END;',leftcom);
appendstring('\\',leftcom);

IF itemId.maxnum <> ItemId.minnum THEN
BEGIN
LOCALTAB(leftcom,indent+2);
appendstring('IF NOT(first OR nomoretrees',leftcom);
 appendstring(levelid,leftcom);
 appendstring(' OR match) THEN',leftcom);
appendstring('\\',leftcom);

LOCALTAB(leftcom,indent+4);
IF NOT(righttoleftmatch) then
BEGIN
appendstring('SelectLfirstAndLlast(Lfirst',leftcom);
 appendstring(levelid,leftcom);
 appendstring(',Llast',leftcom);

appendstring(levelid,leftcom);
 appendstring(',Lrest',leftcom);

appendstring(levelid,leftcom);
appendstring('\\',leftcom);
 appendstring(',nomoretrees',leftcom);

appendstring(levelid,leftcom);
 appendstring(',L);',leftcom);
appendstring('\\',leftcom);

END
ELSE 
BEGIN
appendstring('TcelesLfirstAndLlast(Lfirst',leftcom);
 appendstring(levelid,leftcom);
 appendstring(',Llast',leftcom);

appendstring(levelid,leftcom);
 appendstring(',Lrest',leftcom);

appendstring(levelid,leftcom);
 appendstring('\\',leftcom);
 appendstring(',nomoretrees',leftcom);

appendstring(levelid,leftcom);
 appendstring(',L);',leftcom);
appendstring('\\',leftcom);

END;
LOCALTAB(leftcom,indent+2);
IF ItemId.maxnum < 100 THEN 
BEGIN
appendstring('IF first THEN i',leftcom);
 appendstring(levelid,leftcom);
 
appendstring(':=',leftcom);
 appendstring(mrucomDECL_convinttostring(ItemId.minnum),leftcom);
 
appendstring(';',leftcom);
 appendstring('\\',leftcom);

LOCALTAB(leftcom,indent+2)
END;
appendstring('While (NOT match) AND (NOT nomoretrees',leftcom);
 appendstring(levelid,leftcom);
 appendstring(')',leftcom);

IF ItemId.maxnum < 100 THEN 
BEGIN 
appendstring(' AND (i',leftcom);
 appendstring(levelid,leftcom);
 
appendstring('<=',leftcom);
 appendstring(mrucomDECL_convinttostring(ItemId.maxnum),leftcom);
 appendstring(')',leftcom);
 
END;
appendstring(' DO',leftcom);
appendstring('\\',leftcom);

LOCALTAB(leftcom,indent+2);
appendstring('BEGIN',leftcom);
appendstring('\\',leftcom);

IF ItemId.maxnum < 100 THEN
BEGIN
LOCALTAB(leftcom,indent+4);
appendstring('i',leftcom);
 appendstring(levelid,leftcom);
 appendstring(':=i',leftcom);

appendstring(levelid,leftcom);
 appendstring('+1;',leftcom);
 appendstring('\\',leftcom);

END;
LOCALTAB(leftcom,indent+4);
appendstring('Match_',leftcom);
;appendstring(ItemId.str,leftcom);
;appendstring('(Lfirst',leftcom);
 appendstring(levelid,leftcom);
 
appendstring(',Llast',leftcom);
 appendstring(levelid,leftcom);
 appendstring(',TRUE,itemmatch);',leftcom);
appendstring('\\',leftcom);

IF bounded and not(righttoleftmatch) THEN
BEGIN
LOCALTAB(leftcom,indent+4);
appendstring('IF Llast',leftcom);
 appendstring(levelid,leftcom);
 
appendstring('=Lfinal THEN Lrest',leftcom);
 appendstring(levelid,leftcom);
 appendstring(':=NIL;',leftcom);
appendstring('\\',leftcom);

END;
LOCALTAB(leftcom,indent+4);
IF NOT((i=1) AND inexist) THEN
BEGIN
appendstring('IF itemmatch THEN',leftcom);
appendstring('\\',leftcom);

IF NOT (bounded and (i=1) and not(righttoleftmatch)) THEN
BEGIN
LOCALTAB(leftcom,indent+6);
appendstring('MatchList',leftcom);
;appendstring(mrucomDECL_convinttostring(i-1),leftcom);
;appendstring('Items(Lrest',leftcom);

appendstring(levelid,leftcom);
 appendstring(',TRUE,listmatch);',leftcom);
appendstring('\\',leftcom);

END
ELSE
BEGIN
LOCALTAB(leftcom,indent+6);
appendstring('listmatch:=(Lrest',leftcom);
 appendstring(levelid,leftcom);
 
appendstring('=NIL) AND ((Lfirst',leftcom);
 appendstring(levelid,leftcom);
 appendstring('<>NIL) OR (L=NIL));',leftcom);
appendstring('\\',leftcom);

END;
LOCALTAB(leftcom,indent+4);
appendstring('match:=(itemmatch AND listmatch);',leftcom);
appendstring('\\',leftcom);

LOCALTAB(leftcom,indent+4);
END
ELSE
BEGIN
appendstring('match:=itemmatch;',leftcom);
appendstring('\\',leftcom);

END;
appendstring('IF (NOT match) THEN',leftcom);
appendstring('\\',leftcom);

LOCALTAB(leftcom,indent+6);
IF NOT(righttoleftmatch) THEN 
BEGIN
appendstring('SelectLfirstAndLlast(Lfirst',leftcom);
 appendstring(levelid,leftcom);
 appendstring(',Llast',leftcom);
 
appendstring(levelid,leftcom);
 appendstring(',Lrest',leftcom);

appendstring(levelid,leftcom);
 appendstring('\\',leftcom);
appendstring(',nomoretrees',leftcom);

appendstring(levelid,leftcom);
 appendstring(',L);',leftcom);
appendstring('\\',leftcom);
 
END
ELSE
BEGIN
appendstring('TcelesLfirstAndLlast(Lfirst',leftcom);
 appendstring(levelid,leftcom);
 appendstring(',Llast',leftcom);

appendstring(levelid,leftcom);
 appendstring(',Lrest',leftcom);

appendstring(levelid,leftcom);
 appendstring('\\',leftcom);
 appendstring(',nomoretrees',leftcom);

appendstring(levelid,leftcom);
 appendstring(',L);',leftcom);
appendstring('\\',leftcom);

END;
LOCALTAB(leftcom,indent+2);
appendstring('END;{while}',leftcom);
appendstring('\\',leftcom);

END;
IF bounded and (i=1) and not(righttoleftmatch) THEN
IF NOT(inexist and (i=1)) THEN
BEGIN
LOCALTAB(leftcom,indent);
appendstring('IF (Lfirst',leftcom);
 appendstring(levelid,leftcom);
 
appendstring('<>NIL) THEN match:=match AND (Llast',leftcom);
 appendstring(levelid,leftcom);
 appendstring('=Lfinal);',leftcom);
 appendstring('\\',leftcom);

END
END;
IF labeled AND (i=staticnumberofitems) THEN
BEGIN
BEGIN  END;
BEGIN 
LOCALTAB(leftcom,indent+2);
appendstring('IF match THEN IF NOT Matchcond',leftcom);
 appendstring(ilabel,leftcom);
 appendstring(' THEN',leftcom);
appendstring('\\',leftcom);

LOCALTAB(leftcom,indent+4);
appendstring('MatchList',leftcom);
;appendstring(mrucomDECL_convinttostring(i),leftcom);
;appendstring('Items(Lrest',leftcom);

appendstring(levelid,leftcom);
 appendstring(',FALSE,match);',leftcom);
appendstring('\\',leftcom);

END;
END;
BEGIN  END;
BEGIN
LOCALTAB(leftcom,indent);
appendstring('END;{MatchList',leftcom);
;appendstring(mrucomDECL_convinttostring(i),leftcom);
;appendstring('Items}',leftcom);
appendstring('\\',leftcom);

END;
END;{special cases}
ItemNumber:=ItemNumber-1;
i:=i+1;
END;
BARELD_levelids:=levelids;
BARELD_NumberOfItems:=StaticNumberOfItems;
BARELD_leftcom:=leftcom;
BARELD_rightcom:=rightcom;
BARELD_dtreeproc:=dtreeproc;
END;
END;
PROCEDURE mrucomCODE_ITEMproc(top:mrucomDECL_psnode
;ITEM_indent              :mrucomlangspec_INT
;ITEM_righttolefttable              :mrucomlangspec_SETOFidents
;ITEM_root              :TSTRING_string
;ITEM_name              :TSTRING_string
;var ITEM_leftcom              :LOCALFILE
;var ITEM_rightcom              :LOCALFILE
;var ITEM_dtreeproc              :LOCALFILE
;var ITEM_identifier              :TSTRING_string
;var ITEM_levelids              :mrucomlangspec_setofidents
);
VAR currenttree:mrucomDECL_psnode;
    rsnode1:mrucomDECL_prsnode;
 leftcom,rightcom,dtreeproc:LOCALFILE;
identifier:TSTRING_string;
indent:Integer;
root,name:TSTRING_string;
righttolefttable,levelids: mrucomLANGSPEC_setofidents;
BEGIN
 BEGIN root:=ITEM_root;
name:=ITEM_name;
InitLOCALFILE(leftcom);
InitLOCALFILE(rightcom);
indent:=ITEM_indent;
righttolefttable:=ITEM_righttolefttable;
TSTRING_constantempty(identifier)
END;
rsnode1:=top^.sonlist;
  while rsnode1<>nil do
  begin
  currenttree:=rsnode1^.node;
  case rsnode1^.sonnumber of

1: begin
  BEGIN 
LABELEDITEM__indent:=indent;
LABELEDITEM__righttolefttable:=righttolefttable;
LABELEDITEM__name:=name;
LABELEDITEM__root:=root;
END
; mrucomCODE_LABELEDITEMproc(currenttree
,LABELEDITEM__indent
,LABELEDITEM__righttolefttable
,LABELEDITEM__root
,LABELEDITEM__name
,LABELEDITEM__leftcom
,LABELEDITEM__rightcom
,LABELEDITEM__dtreeproc
,LABELEDITEM__identifier
,LABELEDITEM__levelids
);
 BEGIN dtreeproc:=LABELEDITEM__dtreeproc;
levelids:=LABELEDITEM__levelids;
identifier:=LABELEDITEM__identifier;
AppendLocFile(LABELEDITEM__leftcom,leftcom);
AppendLocFile(LABELEDITEM__rightcom,rightcom);
END
END;

2: begin
  BEGIN
BAREITEM__labeled:=FALSE;
BAREITEM__indent:=indent;
BAREITEM__righttolefttable:=righttolefttable;
BAREITEM__name:=name;
BAREITEM__root:=root;
END
; mrucomCODE_BAREITEMproc(currenttree
,BAREITEM__labeled
,BAREITEM__label
,BAREITEM__indent
,BAREITEM__righttoleftmatch
,BAREITEM__righttolefttable
,BAREITEM__root
,BAREITEM__name
,BAREITEM__leftcom
,BAREITEM__rightcom
,BAREITEM__dtreeproc
,BAREITEM__identifier
,BAREITEM__levelids
);
 BEGIN dtreeproc:=BAREITEM__dtreeproc;
levelids:=BAREITEM__levelids;
identifier:=BAREITEM__identifier;
AppendLocFile(BAREITEM__leftcom,leftcom);
AppendLocFile(BAREITEM__rightcom,rightcom);
END
END;

END;

rsnode1:=rsnode1^.brother END;
BEGIN
ITEM_dtreeproc:=dtreeproc;
ITEM_levelids:=levelids;
ITEM_leftcom:=leftcom;
ITEM_rightcom:=rightcom;
ITEM_identifier:=identifier
END
END;
PROCEDURE mrucomCODE_LABELEDITEMproc(top:mrucomDECL_psnode
;LABELEDITEM_indent              :mrucomlangspec_INT
;LABELEDITEM_righttolefttable              :mrucomlangspec_setofidents
;LABELEDITEM_root              :TSTRING_string
;LABELEDITEM_name              :TSTRING_string
;var LABELEDITEM_leftcom              :LOCALFILE
;var LABELEDITEM_rightcom              :LOCALFILE
;var LABELEDITEM_dtreeproc              :LOCALFILE
;var LABELEDITEM_identifier              :TSTRING_string
;var LABELEDITEM_levelids              :mrucomlangspec_setofidents
);
VAR currenttree:mrucomDECL_psnode;
    rsnode1:mrucomDECL_prsnode;
 dtreeproc,leftcom,rightcom:LOCALFILE;
ilabel,
identifier,root,name :TSTRING_string;
indent:Integer;
righttolefttable,levelids: mrucomLANGSPEC_setofidents;
righttoleftmatch:BOOLEAN;
 FUNCTION labelpresent(labeltje:TSTRING_string;table: mrucomLANGSPEC_setofidents):BOOLEAN;
VAR result:BOOLEAN;
ident: mrucomLANGSPEC_ident;
BEGIN
result:=FALSE;
WHILE stillidents(table) AND NOT(result) DO
BEGIN
takeident(ident,table);
result:= (labeltje=ident.str)
END;
labelpresent:=result
END;
BEGIN
 BEGIN root:=LABELEDITEM_root;
name:=LABELEDITEM_name;
InitLOCALFILE(leftcom);
InitLOCALFILE(rightcom);
indent:=LABELEDITEM_indent;
righttolefttable:=LABELEDITEM_righttolefttable;
righttoleftmatch:=FALSE;
TSTRING_constantempty(ilabel);
TSTRING_constantempty(identifier)
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
; mrucomCODE_ILABELtjeproc(currenttree
,ILABELtje__ident
);
 BEGIN ilabel:=ILABELtje__ident;
righttoleftmatch:=labelpresent(ilabel,righttolefttable)
END
END;

3: begin
  BEGIN BAREITEM__labeled:=TRUE;
BAREITEM__label:=ilabel;
BAREITEM__indent:=indent;
BAREITEM__righttolefttable:=righttolefttable;
BAREITEM__righttoleftmatch:=righttoleftmatch;
BAREITEM__name:=name;
BAREITEM__root:=root;
END
; mrucomCODE_BAREITEMproc(currenttree
,BAREITEM__labeled
,BAREITEM__label
,BAREITEM__indent
,BAREITEM__righttoleftmatch
,BAREITEM__righttolefttable
,BAREITEM__root
,BAREITEM__name
,BAREITEM__leftcom
,BAREITEM__rightcom
,BAREITEM__dtreeproc
,BAREITEM__identifier
,BAREITEM__levelids
);
 BEGIN dtreeproc:=BAREITEM__dtreeproc;
levelids:=BAREITEM__levelids;
identifier:=BAREITEM__identifier;
AppendLocFile(BAREITEM__leftcom,leftcom);
AppendLocFile(BAREITEM__rightcom,rightcom);
END
END;

END;

rsnode1:=rsnode1^.brother END;
BEGIN
LABELEDITEM_dtreeproc:=dtreeproc;
LABELEDITEM_levelids:=levelids;
LABELEDITEM_leftcom:=leftcom;
LABELEDITEM_rightcom:=rightcom;
LABELEDITEM_identifier:=identifier;
END
END;
PROCEDURE mrucomCODE_BAREITEMproc(top:mrucomDECL_psnode
;BAREITEM_labeled              :mrucomlangspec_Bool
;BAREITEM_label              :TSTRING_string
;BAREITEM_indent              :mrucomlangspec_INT
;BAREITEM_righttoleftmatch              :mrucomlangspec_BOOL
;BAREITEM_righttolefttable              :mrucomlangspec_setofidents
;BAREITEM_root              :TSTRING_string
;BAREITEM_name              :TSTRING_string
;var BAREITEM_leftcom              :LOCALFILE
;var BAREITEM_rightcom              :LOCALFILE
;var BAREITEM_dtreeproc              :LOCALFILE
;var BAREITEM_identifier              :TSTRING_string
;var BAREITEM_levelids              :mrucomlangspec_setofidents
);
VAR currenttree:mrucomDECL_psnode;
    rsnode1:mrucomDECL_prsnode;
 leftcom,rightcom,dtreeproc:LOCALFILE;
minnum,maxnum: mrucomLANGSPEC_INT;
relationlist: mrucomLANGSPEC_setofidents;
i,j:INTEGER;
RelationNamed,labeled: mrucomLANGSPEC_bool;
identifier,
ilabel,root,name:TSTRING_string;
relationname: mrucomLANGSPEC_ident;
NumberOfItems,k,indent,level:Integer;
levelids,righttolefttable: mrucomLANGSPEC_setofidents;
righttoleftmatch:BOOLEAN;
keymentioned,keyvar: mrucomLANGSPEC_bool;
treevarname,nodevarname,recordname,category,keystr1,keystr2:TSTRING_string;
BEGIN
 BEGIN TSTRING_constantempty(ilabel);
TSTRING_constantempty(relationname.str);
TSTRING_constantempty(identifier);
InitLOCALFILE(leftcom);
initsetofidents(levelids);
InitLOCALFILE(dtreeproc);
InitLOCALFILE(rightcom);
indent:=BAREITEM_indent;
level:=(indent DIV 6) + 1;
labeled:=BAREITEM_labeled;
name:=BAREITEM_name;
root:=BAREITEM_root;
k:=0;
righttolefttable:=BAREITEM_righttolefttable;
righttoleftmatch:=FALSE;
IF labeled THEN
BEGIN
righttoleftmatch:=BAREITEM_righttoleftmatch;
ilabel:=BAREITEM_label;
END;
END;
rsnode1:=top^.sonlist;
  while rsnode1<>nil do
  begin
  currenttree:=rsnode1^.node;
  case rsnode1^.sonnumber of

1: begin
  BEGIN
END
; mrucomCODE_MUVARproc(currenttree
,MUVAR__ident
);
 BEGIN
identifier:=MUVAR__ident;
BEGIN  END;
LOCALTAB(rightcom,indent);
appendstring('PROCEDURE create',rightcom);
 appendstring(identifier,rightcom);
 appendstring('(VAR list:LSMRUQUO_ListOfStrees);',rightcom);
appendstring('\\',rightcom);

LOCALTAB(rightcom,indent);
appendstring('BEGIN{',rightcom);
 appendstring(identifier,rightcom);
 appendstring('}',rightcom);
appendstring('\\',rightcom);

LOCALTAB(rightcom,indent);
appendstring('copylist(',rightcom);
 appendstring(identifier,rightcom);
 appendstring(',list);',rightcom);
appendstring('\\',rightcom);

LOCALTAB(rightcom,indent);
appendstring('END{',rightcom);
 appendstring(identifier,rightcom);
 appendstring('};',rightcom);
appendstring('\\',rightcom);

BEGIN  END;
BEGIN
LOCALTAB(leftcom,indent);
appendstring('PROCEDURE Match_',leftcom);
;appendstring(identifier,leftcom);
;
appendstring('(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;',leftcom);

appendstring('VAR match:Boolean);',leftcom);
appendstring('\\',leftcom);

LOCALTAB(leftcom,indent);
appendstring('BEGIN{match}',leftcom);
appendstring('\\',leftcom);

LOCALTAB(leftcom,indent+2);
appendstring('IF first THEN BEGIN',leftcom);
 appendstring('\\',leftcom);

LOCALTAB(leftcom,indent+4);
appendstring(identifier,leftcom);
;appendstring('.first:=Lfirst;',leftcom);
appendstring('\\',leftcom);

LOCALTAB(leftcom,indent+4);
appendstring(identifier,leftcom);
;appendstring('.last:=Llast;',leftcom);
appendstring('\\',leftcom);

END;
IF labeled THEN
BEGIN
LOCALTAB(leftcom,indent+4);
appendstring('match:= matchcond',leftcom);
 appendstring(ilabel,leftcom);
 appendstring(';',leftcom);
appendstring('\\',leftcom);

LOCALTAB(leftcom,indent+2);
appendstring('END',leftcom);
appendstring('\\',leftcom);
 
END
ELSE
BEGIN 
LOCALTAB(leftcom,indent+4);
appendstring('match:=TRUE;',leftcom);
appendstring('\\',leftcom);

LOCALTAB(leftcom,indent+2);
appendstring('END',leftcom);
appendstring('\\',leftcom);

END;
LOCALTAB(leftcom,indent+2);
appendstring('ELSE match:=FALSE',leftcom);
 appendstring('\\',leftcom);

LOCALTAB(leftcom,indent);
appendstring('END;',leftcom);
appendstring('\\',leftcom);

END
END;

2: begin
  BEGIN 
END
; mrucomCODE_SIGMAVARproc(currenttree
,SIGMAVAR__ident
);
 BEGIN
identifier:=SIGMAVAR__ident;
BEGIN  END;
LOCALTAB(rightcom,indent);
appendstring('PROCEDURE create',rightcom);
 appendstring(identifier,rightcom);
 appendstring('(VAR list:LSMRUQUO_ListOfStrees);',rightcom);
appendstring('\\',rightcom);

LOCALTAB(rightcom,indent);
appendstring('BEGIN{',rightcom);
 appendstring(identifier,rightcom);
 appendstring('}',rightcom);
appendstring('\\',rightcom);

LOCALTAB(rightcom,indent);
appendstring('copylist(',rightcom);
 appendstring(identifier,rightcom);
 appendstring(',list);',rightcom);
appendstring('\\',rightcom);

LOCALTAB(rightcom,indent);
appendstring('END{',rightcom);
 appendstring(identifier,rightcom);
 appendstring('};',rightcom);
appendstring('\\',rightcom);

BEGIN  END;
BEGIN
LOCALTAB(leftcom,indent);
appendstring('PROCEDURE Match_',leftcom);
;appendstring(identifier,leftcom);
;
appendstring('(Lfirst,Llast:LSSTREE_pRelNode;first:Boolean;',leftcom);

appendstring('VAR match:Boolean);',leftcom);
appendstring('\\',leftcom);

LOCALTAB(leftcom,indent);
appendstring('BEGIN{match}',leftcom);
appendstring('\\',leftcom);

LOCALTAB(leftcom,indent+2);
appendstring('IF first THEN BEGIN',leftcom);
 appendstring('\\',leftcom);

LOCALTAB(leftcom,indent+4);
appendstring(identifier,leftcom);
;appendstring('.first:=Lfirst;',leftcom);
appendstring('\\',leftcom);

LOCALTAB(leftcom,indent+4);
appendstring(identifier,leftcom);
;appendstring('.last:=Llast;',leftcom);
appendstring('\\',leftcom);

END;
IF labeled THEN
BEGIN
LOCALTAB(leftcom,indent+4);
appendstring('match:= matchcond',leftcom);
 appendstring(ilabel,leftcom);
 appendstring(';',leftcom);
appendstring('\\',leftcom);

LOCALTAB(leftcom,indent+2);
appendstring('END',leftcom);
appendstring('\\',leftcom);
 
END
ELSE
BEGIN 
LOCALTAB(leftcom,indent+4);
appendstring('match:=TRUE;',leftcom);
appendstring('\\',leftcom);

LOCALTAB(leftcom,indent+2);
appendstring('END',leftcom);
appendstring('\\',leftcom);

END;
LOCALTAB(leftcom,indent+2);
appendstring('ELSE match:=FALSE',leftcom);
 appendstring('\\',leftcom);

LOCALTAB(leftcom,indent);
appendstring('END;',leftcom);
appendstring('\\',leftcom);

END
END;

3: begin
  BEGIN 
BARELD__indent:=indent+2;
BARELD__labeled:=labeled;
BARELD__label:=ilabel;
BARELD__bounded:=TRUE;
BARELD__inexist:=FALSE;
BARELD__righttolefttable:=righttolefttable;
BARELD__righttoleftmatch:=righttoleftmatch;
TSTRING_appendchars(identifier,identifier,'list',4);
BEGIN  END;
LOCALTAB(leftcom,indent);
BEGIN
appendstring('PROCEDURE Match_',leftcom);
;appendstring(identifier,leftcom);
;
appendstring('(Lfirst,Lfinal:LSSTREE_pRelNode;',leftcom);

appendstring('first:Boolean;VAR match:Boolean);',leftcom);
appendstring('\\',leftcom);

END;
BARELD__name:=name;
BARELD__root:=root;
END
; mrucomCODE_BARELDproc(currenttree
,BARELD__label
,BARELD__labeled
,BARELD__indent
,BARELD__inexist
,BARELD__bounded
,BARELD__righttolefttable
,BARELD__righttoleftmatch
,BARELD__root
,BARELD__name
,BARELD__leftcom
,BARELD__rightcom
,BARELD__dtreeproc
,BARELD__NumberOfItems
,BARELD__levelids
);
 BEGIN dtreeproc:=BARELD__dtreeproc;
levelids:=BARELD__levelids;
BEGIN  END;
AppendLocFile(BARELD__leftcom,leftcom);
LOCALTAB(leftcom,indent);
appendstring('BEGIN{matchlist}',leftcom);
appendstring('\\',leftcom);

k:=BARELD__numberofitems;
LOCALTAB(leftcom,indent);
appendstring('IF first OR lastmatch',leftcom);
 appendstring(root,leftcom);

appendstring(' THEN matchlist',leftcom);
 appendstring(mrucomDECL_convinttostring(k),leftcom);
 appendstring('items(L,first,match)',leftcom);
 appendstring('\\',leftcom);

LOCALTAB(leftcom,indent);
appendstring('ELSE match:=FALSE;',leftcom);
appendstring('\\',leftcom);

LOCALTAB(leftcom,indent);
appendstring('lastmatch',leftcom);
 appendstring(root,leftcom);
 appendstring(':=match;',leftcom);
appendstring('\\',leftcom);

LOCALTAB(leftcom,indent);
appendstring('END;{matchlist}',leftcom);
appendstring('\\',leftcom);

BEGIN  END;
LOCALTAB(rightcom,indent);
appendstring('PROCEDURE create',rightcom);
 appendstring(identifier,rightcom);
 appendstring('(VAR list:LSMRUQUO_ListOfStrees);',rightcom);
appendstring('\\',rightcom);

AppendLocFile(BARELD__rightcom,rightcom);
LOCALTAB(rightcom,indent);
appendstring('BEGIN{',rightcom);
 appendstring(identifier,rightcom);
 appendstring('}',rightcom);
appendstring('\\',rightcom);

LOCALTAB(rightcom,indent);
appendstring('createlist1(list);',rightcom);
appendstring('\\',rightcom);

LOCALTAB(rightcom,indent);
appendstring('END{',rightcom);
 appendstring(identifier,rightcom);
 appendstring('};',rightcom);
appendstring('\\',rightcom);

END
END;

4: begin
  BEGIN 
RTD__indent:=indent;
RTD__righttolefttable:=righttolefttable;
RTD__name:=name;
RTD__root:=root;
END
; mrucomCODE_RTDproc(currenttree
,RTD__labeled
,RTD__label
,RTD__indent
,RTD__righttolefttable
,RTD__root
,RTD__name
,RTD__leftcom
,RTD__rightcom
,RTD__dtreeproc
,RTD__variable
,RTD__NumberOfItems
,RTD__RelationNamed
,RTD__keymentioned
,RTD__keyvar
,RTD__keystr1
,RTD__keystr2
,RTD__levelids
);
 BEGIN dtreeproc:=RTD__dtreeproc;
levelids:=RTD__levelids;
minnum:=currenttree^.ldfield.RTDfield^.minnum;
maxnum:=currenttree^.ldfield.RTDfield^.maxnum;
relationlist:=currenttree^.ldfield.RTDfield^.treerellist;
identifier:=RTD__variable;
nodevarname:=currenttree^.ldfield.RTDfield^.nodevarname;
recordname:=currenttree^.ldfield.RTDfield^.recordname;
category:=currenttree^.ldfield.RTDfield^.category;
treevarname:=currenttree^.ldfield.RTDfield^.treevarname;
NumberOfItems:=RTD__NumberOfItems;
RelationNamed:=RTD__RelationNamed;
BEGIN  END;
BEGIN
LOCALTAB(leftcom,indent);
appendstring('PROCEDURE Match_',leftcom);
;appendstring(identifier,leftcom);
;appendstring('(Lfirst,Llast:LSSTREE_pRelNode;',leftcom);
;
appendstring('first:Boolean;VAR match:Boolean);',leftcom);
appendstring('\\',leftcom);

LOCALTAB(leftcom,indent);
appendstring('VAR matchcond:BOOLEAN;',leftcom);
appendstring('\\',leftcom);

LOCALTAB(leftcom,indent+2);
appendstring('Stree:LSSTREE_pStree;',leftcom);
appendstring('\\',leftcom);

LOCALTAB(leftcom,indent+2);
appendstring('lisons:LISTREE_pRelnode;',leftcom);
appendstring('\\',leftcom);

i:=0;
WHILE stillidents(relationlist) DO
BEGIN
takeident(relationname,relationlist);
i:=i+1;
LOCALTAB(leftcom,indent+2);
appendstring('lirel',leftcom);
 appendstring(mrucomDECL_convinttostring(i),leftcom);
 appendstring(':LIDOMAINT_synrel;',leftcom);
appendstring('\\',leftcom);

LOCALTAB(leftcom,indent+2);
appendstring('lsrel',leftcom);
 appendstring(mrucomDECL_convinttostring(i),leftcom);
 appendstring(':LSDOMAINT_synrel;',leftcom);
appendstring('\\',leftcom);

END;
j:=i; IF i>4 THEN j:=4;
END;
AppendLocFile(RTD__leftcom,leftcom);
appendstring('BEGIN{MatchTree}',leftcom);
appendstring('\\',leftcom);

LOCALTAB(leftcom,indent+4);
IF RelationNamed THEN
BEGIN 
BEGIN  END;
IF FALSE THEN {special case}
BEGIN
LOCALTAB(leftcom,indent);
appendstring('IF first THEN match:= (Lfirst^.relation = ',leftcom);
 appendstring(identifier,leftcom);
 appendstring(')',leftcom);

appendstring(' ELSE match:= TRUE;',leftcom);
appendstring('\\',leftcom);

END;
END
ELSE
BEGIN
BEGIN  END;
IF NOT(currenttree^.ldfield.RTDfield^.containsTi) THEN
BEGIN 
LOCALTAB(leftcom,indent);
IF TSTRING_length(identifier)<>0 THEN
BEGIN
appendstring('IF first THEN ',leftcom);
 appendstring(identifier,leftcom);
 appendstring(':= Lfirst^.relation;',leftcom);
 
END;
appendstring('match:=TRUE;',leftcom);
appendstring('\\',leftcom);

END;
END;
BEGIN  END;
IF currenttree^.ldfield.RTDfield^.containsTi THEN
BEGIN{normal case}
appendstring('LSMATCHES_matchtree',leftcom);

IF NOT(relationnamed) THEN
BEGIN
IF TSTRING_length(identifier)<>0 THEN BEGIN appendstring('Var',leftcom);
 END
ELSE appendstring('Emp',leftcom);

END;
IF labeled THEN appendstring('Con',leftcom);

IF TSTRING_length(treevarname)<>0 THEN BEGIN appendstring('Var',leftcom);
 END
ELSE appendstring('Emp',leftcom);

appendstring('(Lfirst,Llast,first,',leftcom);

IF NOT(relationnamed) THEN
BEGIN
IF TSTRING_length(identifier)<>0 THEN 
BEGIN appendstring(identifier,leftcom);
 appendstring(',',leftcom);
 END;
END
ELSE BEGIN appendstring(identifier,leftcom);
 appendstring(',',leftcom);
 END;
IF TSTRING_length(treevarname)<>0 THEN
BEGIN appendstring(treevarname,leftcom);
 appendstring(',',leftcom);
 END;
appendstring('match,',leftcom);

IF labeled THEN
BEGIN appendstring('matchcond',leftcom);
 appendstring(ilabel,leftcom);
 appendstring(',',leftcom);
 END;
appendstring('lastmatch',leftcom);
 appendstring(root,leftcom);
 appendstring(');',leftcom);
appendstring('\\',leftcom);

appendstring('END;',leftcom);
appendstring('\\',leftcom);

END;
IF currenttree^.ldfield.RTDfield^.containsTi THEN
IF (TSTRING_length(identifier)=0) AND (TSTRING_length(treevarname)=0) THEN
BEGIN {special case}
LOCALTAB(leftcom,indent+2);
appendstring('IF match THEN',leftcom);
appendstring('\\',leftcom);

LOCALTAB(leftcom,indent+2);
appendstring('BEGIN',leftcom);
appendstring('\\',leftcom);

LOCALTAB(leftcom,indent+4);
appendstring('Stree:=Lfirst^.node;',leftcom);
appendstring('\\',leftcom);

LOCALTAB(leftcom,indent+4);
appendstring('IF first THEN',leftcom);
appendstring('\\',leftcom);

LOCALTAB(leftcom,indent+6);
appendstring('BEGIN',leftcom);
appendstring('\\',leftcom);

IF TSTRING_length(treevarname)<>0 THEN
BEGIN
LOCALTAB(leftcom,indent+6);
appendstring(treevarname,leftcom);
 appendstring(':=Stree;',leftcom);
appendstring('\\',leftcom);

END; 
LOCALTAB(leftcom,indent+6);
appendstring('END',leftcom);
appendstring('\\',leftcom);

LOCALTAB(leftcom,indent+4);
appendstring('ELSE',leftcom);
appendstring('\\',leftcom);

LOCALTAB(leftcom,indent+6);
appendstring('BEGIN',leftcom);
appendstring('\\',leftcom);

LOCALTAB(leftcom,indent+6);
appendstring('match:=FALSE',leftcom);
appendstring('\\',leftcom);

LOCALTAB(leftcom,indent+6);
appendstring('END;',leftcom);
appendstring('\\',leftcom);

LOCALTAB(leftcom,indent+2);
appendstring('END;',leftcom);
appendstring('\\',leftcom);

LOCALTAB(leftcom,indent);
IF labeled THEN
BEGIN
BEGIN  END;
BEGIN
LOCALTAB(leftcom,indent+8);
appendstring('if match then matchcond:=matchcond',leftcom);
 appendstring(ilabel,leftcom);
 appendstring(';',leftcom);
appendstring('\\',leftcom);

LOCALTAB(leftcom,indent+8);
appendstring('IF match THEN IF NOT(matchcond) THEN',leftcom);
appendstring('\\',leftcom);

LOCALTAB(leftcom,indent+10);
appendstring('Match_',leftcom);
;appendstring(identifier,leftcom);
;appendstring('(Lfirst,Llast,false,match);',leftcom);
appendstring('\\',leftcom);

LOCALTAB(leftcom,indent+8);
appendstring('IF match AND matchcond THEN',leftcom);
appendstring('\\',leftcom);

LOCALTAB(leftcom,indent+10);
appendstring('match:=TRUE',leftcom);
appendstring('\\',leftcom);

LOCALTAB(leftcom,indent+6);
appendstring('END;{MatchTree',leftcom);
 appendstring(identifier,leftcom);
 appendstring('}',leftcom);
appendstring('\\',leftcom);

END; 
END
ELSE
BEGIN
BEGIN  END;
BEGIN
LOCALTAB(leftcom,indent+6);
appendstring('END;{MatchTree',leftcom);
 appendstring(identifier,leftcom);
 appendstring('}',leftcom);
appendstring('\\',leftcom);

END;
END;
END;
IF (NOT currenttree^.ldfield.RTDfield^.containsTi) AND (TSTRING_length(identifier)<>0) THEN
BEGIN{normal case}
IF currenttree^.ldfield.RTDfield^.basiccat AND (TSTRING_length(recordname)<>0) THEN
BEGIN
LOCALTAB(leftcom,indent+4);
appendstring(recordname,leftcom);
 appendstring('tree:=Lfirst^.node;',leftcom);
appendstring('\\',leftcom);

END;
IF (maxnum<100) OR (minnum>0) THEN
BEGIN
LOCALTAB(leftcom,indent+6);
appendstring('IF first THEN match:= ',leftcom);

IF minnum>0 THEN 
BEGIN appendstring('(Lfirst^.node^.li^.n >=',leftcom);
 appendstring(mrucomDECL_convinttostring(minnum),leftcom);

appendstring(')',leftcom);
 END;
IF (maxnum<100) AND (minnum>0) THEN appendstring(' AND ',leftcom);

IF (maxnum<100) THEN BEGIN
appendstring('(Lfirst^.node^.li^.n <=',leftcom);
 appendstring(mrucomDECL_convinttostring(maxnum),leftcom);
 appendstring(')',leftcom);
 END;
appendstring('ELSE match:=TRUE;IF match THEN',leftcom);
 appendstring('\\',leftcom);

END;
relationlist:=currenttree^.ldfield.RTDfield^.treerellist;
appendstring('LSMATCHES_matchtree',leftcom);
 
IF labeled THEN appendstring('Con',leftcom);

IF not relationnamed THEN appendstring('Var',leftcom);
;
appendstring(mrucomDECL_convinttostring(j),leftcom);
 appendstring('rels(',leftcom);

IF relationnamed THEN BEGIN appendstring('Lfirst,Llast,',leftcom);
 END
ELSE appendstring('Lfirst^.node,',leftcom);
 
appendstring('first',leftcom);
 
IF relationnamed THEN BEGIN appendstring(',',leftcom);
 appendstring(identifier,leftcom);
 END;appendstring('\\',leftcom);

i:=0;
WHILE stillidents(relationlist) AND (i<4) DO BEGIN
i:=i+1;
takeident(relationname,relationlist);
appendstring(',',leftcom);
 appendstring(relationname.str,leftcom);

END;
appendstring(',match,matchnode,matchlist',leftcom);
 appendstring(mrucomDECL_convinttostring(numberofitems),leftcom);
 appendstring('items',leftcom);

appendstring(',lastmatch',leftcom);
 appendstring(root,leftcom);
 
IF labeled THEN BEGIN appendstring(',matchcond',leftcom);
 appendstring(ilabel,leftcom);
 END;
appendstring(') END;',leftcom);
appendstring('\\',leftcom);

END;{normal case}
IF NOT currenttree^.ldfield.RTDfield^.containsTi THEN
IF TSTRING_length(identifier)=0 THEN {special case}
BEGIN
BEGIN
LOCALTAB(leftcom,indent+2);
appendstring('IF match THEN',leftcom);
appendstring('\\',leftcom);

LOCALTAB(leftcom,indent+2);
appendstring('BEGIN',leftcom);
appendstring('\\',leftcom);

LOCALTAB(leftcom,indent+4);
appendstring('Stree:=Lfirst^.node;',leftcom);
appendstring('\\',leftcom);

IF currenttree^.ldfield.RTDfield^.basiccat AND (TSTRING_length(recordname)<>0) THEN
BEGIN
LOCALTAB(leftcom,indent+4);
appendstring(recordname,leftcom);
 appendstring('tree:=stree;',leftcom);
appendstring('\\',leftcom);
 
END;
LOCALTAB(leftcom,indent+4);
appendstring('IF first THEN',leftcom);
appendstring('\\',leftcom);

LOCALTAB(leftcom,indent+4);
appendstring('BEGIN',leftcom);
appendstring('\\',leftcom);

LOCALTAB(leftcom,indent+6);
appendstring('MatchNode(Stree,match);',leftcom);
appendstring('\\',leftcom);

IF (maxnum<100) OR (minnum>0) THEN
BEGIN
LOCALTAB(leftcom,indent+4); appendstring('IF match THEN',leftcom);
appendstring('\\',leftcom);

LOCALTAB(leftcom,indent+6);
appendstring('match:= ',leftcom);

IF minnum>0 THEN 
BEGIN appendstring('(Stree^.li^.n >=',leftcom);
 appendstring(mrucomDECL_convinttostring(minnum),leftcom);

appendstring(')',leftcom);
 END;
IF (maxnum<100) AND (minnum>0) THEN appendstring(' AND ',leftcom);

IF (maxnum<100) THEN BEGIN
appendstring('(Stree^.li^.n <=',leftcom);
 appendstring(mrucomDECL_convinttostring(maxnum),leftcom);
 appendstring(')',leftcom);
 END;
appendstring(';',leftcom);
 appendstring('\\',leftcom);

END;
LOCALTAB(leftcom,indent+4);
appendstring('IF match THEN',leftcom);
appendstring('\\',leftcom);

LOCALTAB(leftcom,indent+6);
appendstring('BEGIN',leftcom);
appendstring('\\',leftcom);

relationlist:=currenttree^.ldfield.RTDfield^.treerellist;
i:=0;
WHILE stillidents(relationlist) DO
BEGIN
i:=i+1;
takeident(relationname,relationlist);
LOCALTAB(leftcom,indent+6);
appendstring('lsrel',leftcom);
 appendstring(mrucomDECL_convinttostring(i),leftcom);
 appendstring(':=',leftcom);
 
appendstring(relationname.str,leftcom);
 appendstring(';',leftcom);
appendstring('\\',leftcom);

LOCALTAB(leftcom,indent+6);
appendstring('lirel',leftcom);
 appendstring(mrucomDECL_convinttostring(i),leftcom);
 appendstring(':= loopholes.retype(lsrel',leftcom);
 
appendstring(mrucomDECL_convinttostring(i),leftcom);
 appendstring(',LIDOMAINT_synrel);',leftcom);
appendstring('\\',leftcom);

END;
IF (j<>0) THEN
BEGIN
LOCALTAB(leftcom,indent+6);
appendstring('lisons:=loopholes.retype',leftcom);

appendstring('(Stree^.sons,LISTREE_pRelnode);',leftcom);
appendstring('\\',leftcom);

LOCALTAB(leftcom,indent+6);
appendstring('match:= LIMATCHES_TEST',leftcom);
 appendstring(mrucomDECL_convinttostring(j),leftcom);
 appendstring('rels(',leftcom);

i:=0;
WHILE i<>j DO
BEGIN
i:=i+1;
appendstring('lirel',leftcom);
 appendstring(mrucomDECL_convinttostring(i),leftcom);
 appendstring(',',leftcom);

END;
appendstring('lisons,FALSE);',leftcom);
appendstring('\\',leftcom);

END;
LOCALTAB(leftcom,indent+6);
appendstring('END;',leftcom);
appendstring('\\',leftcom);

LOCALTAB(leftcom,indent+6);
appendstring('IF match THEN',leftcom);
appendstring('\\',leftcom);

LOCALTAB(leftcom,indent+6);
appendstring('BEGIN',leftcom);
appendstring('\\',leftcom);

LOCALTAB(leftcom,indent+8);
appendstring('MatchList',leftcom);
 appendstring(mrucomDECL_convinttostring(NumberOfItems),leftcom);
 appendstring('Items(Stree^.sons,TRUE,match);',leftcom);
appendstring('\\',leftcom);

END; 
IF labeled THEN
BEGIN
BEGIN  END;
BEGIN
LOCALTAB(leftcom,indent+8);
appendstring('if match then matchcond:=matchcond',leftcom);
 appendstring(ilabel,leftcom);
 appendstring(';',leftcom);
appendstring('\\',leftcom);

LOCALTAB(leftcom,indent+8);
appendstring('IF match THEN IF NOT(matchcond) THEN',leftcom);
appendstring('\\',leftcom);

LOCALTAB(leftcom,indent+10);
appendstring('Match_',leftcom);
;appendstring(identifier,leftcom);
;appendstring('(Lfirst,Llast,false,match);',leftcom);
appendstring('\\',leftcom);

LOCALTAB(leftcom,indent+8);
appendstring('IF match AND matchcond THEN',leftcom);
appendstring('\\',leftcom);

LOCALTAB(leftcom,indent+10);
appendstring('match:=TRUE',leftcom);
appendstring('\\',leftcom);

LOCALTAB(leftcom,indent+6);
appendstring('END',leftcom);
appendstring('\\',leftcom);

END; 
END
ELSE
BEGIN
BEGIN  END;
BEGIN
LOCALTAB(leftcom,indent+6);
appendstring('END',leftcom);
appendstring('\\',leftcom);

END;
END;
LOCALTAB(leftcom,indent+4);
appendstring('END',leftcom);
appendstring('\\',leftcom);

BEGIN  END;
BEGIN
LOCALTAB(leftcom,indent+4);
appendstring('ELSE',leftcom);
appendstring('\\',leftcom);

LOCALTAB(leftcom,indent+6);
appendstring('BEGIN',leftcom);
appendstring('\\',leftcom);

LOCALTAB(leftcom,indent+8);
appendstring('IF lastmatch',leftcom);
 appendstring(root,leftcom);
 appendstring(' THEN',leftcom);
appendstring('\\',leftcom);

LOCALTAB(leftcom,indent+8);
appendstring('MatchList',leftcom);
;appendstring(mrucomDECL_convinttostring(NumberOfItems),leftcom);
 appendstring('Items(Stree^.sons,FALSE,match)',leftcom);
appendstring('\\',leftcom);

LOCALTAB(leftcom,indent+8);
appendstring('ELSE match:=FALSE;',leftcom);
appendstring('\\',leftcom);

END;
IF labeled THEN
BEGIN
BEGIN  END;
BEGIN
LOCALTAB(leftcom,indent+8);
appendstring('if match then matchcond:=matchcond',leftcom);
 appendstring(ilabel,leftcom);
 appendstring(';',leftcom);
appendstring('\\',leftcom);

LOCALTAB(leftcom,indent+8);
appendstring('IF match THEN IF NOT(matchcond) THEN',leftcom);
appendstring('\\',leftcom);

LOCALTAB(leftcom,indent+10);
appendstring('Match_',leftcom);
;appendstring(identifier,leftcom);
;appendstring('(Lfirst,Llast,false,match);',leftcom);
appendstring('\\',leftcom);

LOCALTAB(leftcom,indent+8);
appendstring('IF match AND matchcond THEN',leftcom);
appendstring('\\',leftcom);

LOCALTAB(leftcom,indent+10);
appendstring('match:=TRUE;',leftcom);
appendstring('\\',leftcom);

LOCALTAB(leftcom,indent+6);
appendstring('END;',leftcom);
appendstring('\\',leftcom);

END; 
END
ELSE
BEGIN
BEGIN  END;
BEGIN
LOCALTAB(leftcom,indent+6);
appendstring('END',leftcom);
appendstring('\\',leftcom);

END;
END;
BEGIN  END;
BEGIN
LOCALTAB(leftcom,indent+2);
appendstring('END;',leftcom);
appendstring('\\',leftcom);

LOCALTAB(leftcom,indent);
appendstring('lastmatch',leftcom);
 appendstring(root,leftcom);
 appendstring(':=match;',leftcom);
appendstring('\\',leftcom);

LOCALTAB(leftcom,indent);
appendstring('END;{MatchTree',leftcom);
;appendstring(identifier,leftcom);
;appendstring('}',leftcom);
appendstring('\\',leftcom);

END;
END; {IF NOT RTD.containsTi}
keymentioned:=RTD__keymentioned;
keyvar:=RTD__keyvar;
keystr1:=RTD__keystr1;
keystr2:=RTD__keystr2;
recordname:=currenttree^.ldfield.RTDfield^.recordname;
level:=level - 1;
BEGIN  END;
LOCALTAB(rightcom,indent);
appendstring('PROCEDURE create',rightcom);
 appendstring(identifier,rightcom);
 appendstring('(VAR list:LSMRUQUO_ListOfStrees);',rightcom);
appendstring('\\',rightcom);

LOCALTAB(rightcom,indent);
appendstring('VAR s:LSSTREE_pStree;relnode:LSSTREE_prelnode;',rightcom);
appendstring('\\',rightcom);

LOCALTAB(rightcom,indent);
appendstring(' list1:LSMRUQUO_ListOfStrees;',rightcom);
appendstring('\\',rightcom);

AppendLocFile(RTD__rightcom,rightcom);
LOCALTAB(rightcom,indent);
appendstring('BEGIN{',rightcom);
 appendstring(identifier,rightcom);
 appendstring('}',rightcom);
appendstring('\\',rightcom);

IF (NOT currenttree^.ldfield.RTDfield^.basiccat) AND (NOT keymentioned) AND
((TSTRING_length(category)<>0) OR (TSTRING_length(treevarname)<>0))
THEN BEGIN
IF (TSTRING_length(category)<>0) THEN
BEGIN
appendstring('LSMATCHES_createitem(list,',rightcom);
 appendstring(identifier,rightcom);
 appendstring(',',rightcom);

appendstring(category,rightcom);
 appendstring(',createnode,createlist1);',rightcom);
appendstring('\\',rightcom);

END;
IF (TSTRING_length(treevarname)<>0) THEN
BEGIN
appendstring('LSMATCHES_createitemVar(list,',rightcom);
 appendstring(identifier,rightcom);
 appendstring(',',rightcom);

appendstring(treevarname,rightcom);
 appendstring(');',rightcom);
appendstring('\\',rightcom);

END;
END
ELSE BEGIN{special case}
LOCALTAB(rightcom,indent);
appendstring('LISTREE_makerelnode(loopholes.retype',rightcom);

appendstring('(relnode,LISTREE_prelnode));',rightcom);
appendstring('\\',rightcom);

LOCALTAB(rightcom,indent);
appendstring('list.first:=relnode;',rightcom);
appendstring('\\',rightcom);

LOCALTAB(rightcom,indent);
appendstring('list.last:=relnode;',rightcom);
appendstring('\\',rightcom);

LOCALTAB(rightcom,indent);
appendstring('relnode^.relation:=',rightcom);
 appendstring(identifier,rightcom);
 appendstring(';',rightcom);
appendstring('\\',rightcom);

keymentioned:=RTD__keymentioned;
keyvar:=RTD__keyvar;
keystr1:=RTD__keystr1;
keystr2:=RTD__keystr2;
recordname:=currenttree^.ldfield.RTDfield^.recordname;
IF keymentioned THEN
BEGIN
appendstring('s:=',rightcom);
 appendstring(recordname,rightcom);
 appendstring('tree;',rightcom);
appendstring('\\',rightcom);

END
ELSE
BEGIN
IF currenttree^.ldfield.RTDfield^.containsTi THEN
BEGIN
LOCALTAB(rightcom,indent);
appendstring('s:=',rightcom);
 appendstring(treevarname,rightcom);
 appendstring(';',rightcom);
appendstring('\\',rightcom);

END
ELSE
BEGIN
IF currenttree^.ldfield.RTDfield^.basiccat THEN
BEGIN
IF TSTRING_comparechars(category,'GLUE',4)<>0 THEN
BEGIN
appendstring('s:=',rightcom);
 appendstring(recordname,rightcom);
 appendstring('tree;',rightcom);
appendstring('\\',rightcom);

END
ELSE
BEGIN
appendstring('s:=MAKET_stree(GLUE);',rightcom);
appendstring('\\',rightcom);

END
END
ELSE
IF (TSTRING_length(category)<>0) THEN
BEGIN
IF currenttree^.ldfield.RTDfield^.noderiv THEN
BEGIN
LOCALTAB(rightcom,indent);
appendstring('s:=MAKET_stree(',rightcom);
 appendstring(category,rightcom);
 appendstring(');',rightcom);
appendstring('\\',rightcom);

END;
LOCALTAB(rightcom,indent);
IF TSTRING_comparechars(category,'GLUE',4)<>0 THEN
BEGIN
appendstring('createnode(s);',rightcom);
appendstring('\\',rightcom);

LOCALTAB(rightcom,indent);
END;
IF currenttree^.ldfield.RTDfield^.noderiv THEN 
BEGIN
appendstring('createlist1(list1);',rightcom);
appendstring('\\',rightcom);

LOCALTAB(rightcom,indent);
appendstring('IF (list1.first<>NIL) THEN list1.last^.brother:=NIL;',rightcom);
appendstring('\\',rightcom);

LOCALTAB(rightcom,indent);
appendstring('s^.li^.n:=numberofelements(list1);',rightcom);
appendstring('\\',rightcom);

LOCALTAB(rightcom,indent);
appendstring('s^.sons:=list1.first;',rightcom);
appendstring('\\',rightcom);

END;
END
ELSE
BEGIN
IF TSTRING_length(treevarname)<>0 THEN
BEGIN
LOCALTAB(rightcom,indent);
appendstring('s:=',rightcom);
 appendstring(treevarname,rightcom);
 appendstring(';',rightcom);
appendstring('\\',rightcom);

END
ELSE
BEGIN
LOCALTAB(rightcom,indent);
appendstring('s:=MAKET_stree(',rightcom);
 appendstring(nodevarname,rightcom);
 appendstring('.cat);',rightcom);
appendstring('\\',rightcom);

LOCALTAB(rightcom,indent);
appendstring('createnode(s);',rightcom);
appendstring('\\',rightcom);

LOCALTAB(rightcom,indent);
IF currenttree^.ldfield.RTDfield^.noderiv THEN
BEGIN
appendstring('createlist1(list1);',rightcom);
appendstring('\\',rightcom);

LOCALTAB(rightcom,indent);
appendstring('IF (list1.first<>NIL) THEN list1.last^.brother:=NIL;',rightcom);
appendstring('\\',rightcom);

LOCALTAB(rightcom,indent);
appendstring('s^.li^.n:=numberofelements(list1);',rightcom);
appendstring('\\',rightcom);

LOCALTAB(rightcom,indent);
appendstring('s^.sons:=list1.first;',rightcom);
appendstring('\\',rightcom);

END;
END
END;
END;
END;
LOCALTAB(rightcom,indent);
appendstring('relnode^.node:=s;',rightcom);
appendstring('\\',rightcom);

END;
LOCALTAB(rightcom,indent);
appendstring('END{',rightcom);
 appendstring(identifier,rightcom);
 appendstring('};',rightcom);
appendstring('\\',rightcom);

END;
END;

END;

rsnode1:=rsnode1^.brother END;
BEGIN
BAREITEM_dtreeproc:=dtreeproc;
BAREITEM_levelids:=levelids;
BAREITEM_identifier:=identifier;
BAREITEM_leftcom:=leftcom; 
BAREITEM_rightcom:=rightcom; 
END
END;
PROCEDURE mrucomCODE_LDproc(top:mrucomDECL_psnode
;LD_inexist              :mrucomlangspec_bool
;var LD_NumberOfItems              :mrucomlangspec_INT
;var LD_allexist              :LOCALFILE
;var LD_levelids              :mrucomlangspec_setofidents
);
VAR currenttree:mrucomDECL_psnode;
    rsnode1:mrucomDECL_prsnode;
 allexist:LOCALFILE;
NumberOfItems:Integer;
levelids: mrucomLANGSPEC_setofidents;
inexist: mrucomLANGSPEC_bool;
BEGIN
 BEGIN inexist:=LD_inexist;
INITLOCALFILE(allexist);
END;
rsnode1:=top^.sonlist;
  while rsnode1<>nil do
  begin
  currenttree:=rsnode1^.node;
  case rsnode1^.sonnumber of

1: begin
  BEGIN LABELEDLD__submodellist:=FALSE;
LABELEDLD__indent:=0;
LABELEDLD__inexist:=inexist;
INITSETOFIDENTS(LABELEDLD__righttolefttable);
TSTRING_constantempty(LABELEDLD__root);
TSTRING_constantempty(LABELEDLD__name);
END
; mrucomCODE_LABELEDLDproc(currenttree
,LABELEDLD__indent
,LABELEDLD__righttolefttable
,LABELEDLD__submodellist
,LABELEDLD__inexist
,LABELEDLD__root
,LABELEDLD__name
,LABELEDLD__leftcom
,LABELEDLD__rightcom
,LABELEDLD__dtreeproc
,LABELEDLD__NumberOfItems
,LABELEDLD__levelids
);
 BEGIN 
levelids:=LABELEDLD__levelids;
NumberOfItems:=LABELEDLD__NumberOfItems;
AppendLocFile(LABELEDLD__leftcom,allexist); 
END
END;

2: begin
  BEGIN 
TSTRING_constantempty(BARELD__label);
BARELD__indent:=0;
BARELD__inexist:=inexist;
BARELD__labeled:=FALSE;
BARELD__bounded:=TRUE;
BARELD__righttoleftmatch:=FALSE;
TSTRING_constantempty(BARELD__root);
TSTRING_constantempty(BARELD__name);
END
; mrucomCODE_BARELDproc(currenttree
,BARELD__label
,BARELD__labeled
,BARELD__indent
,BARELD__inexist
,BARELD__bounded
,BARELD__righttolefttable
,BARELD__righttoleftmatch
,BARELD__root
,BARELD__name
,BARELD__leftcom
,BARELD__rightcom
,BARELD__dtreeproc
,BARELD__NumberOfItems
,BARELD__levelids
);
 BEGIN
levelids:=BARELD__levelids;
NumberOfItems:=BARELD__NumberOfItems;
AppendLocFile(BARELD__leftcom,allexist); 
END
END;

END;

rsnode1:=rsnode1^.brother END;
BEGIN 
LD_levelids:=levelids;
LD_allexist:=allexist;
LD_NumberOfItems:=NumberOfItems;
END
END;
PROCEDURE mrucomCODE_RTDproc(top:mrucomDECL_psnode
;RTD_labeled              :mrucomlangspec_Bool
;RTD_label              :TSTRING_string
;RTD_indent              :mrucomlangspec_INT
;RTD_righttolefttable              :mrucomlangspec_setofidents
;RTD_root              :TSTRING_string
;RTD_name              :TSTRING_string
;var RTD_leftcom              :LOCALFILE
;var RTD_rightcom              :LOCALFILE
;var RTD_dtreeproc              :LOCALFILE
;var RTD_variable              :TSTRING_string
;var RTD_NumberOfItems              :mrucomlangspec_INT
;var RTD_RelationNamed              :mrucomlangspec_Bool
;var RTD_keymentioned              :mrucomlangspec_bool
;var RTD_keyvar              :mrucomlangspec_bool
;var RTD_keystr1              :TSTRING_string
;var RTD_keystr2              :TSTRING_string
;var RTD_levelids              :mrucomlangspec_setofidents
);
VAR currenttree:mrucomDECL_psnode;
    rsnode1:mrucomDECL_prsnode;
 variable,keystr1,keystr2,root,name:TSTRING_string;
RelationNamed,keymentioned,keyvar: mrucomLANGSPEC_Bool;
leftcom,rightcom,dtreeproc:LOCALFILE;
indent,NumberOfItems:Integer;
righttolefttable,levelids: mrucomLANGSPEC_setofidents;
BEGIN
 BEGIN
TSTRING_constantempty(variable);
indent:=RTD_indent;
righttolefttable:=RTD_righttolefttable;
InitLOCALFILE(leftcom);
InitLOCALFILE(rightcom);
name:=RTD_name;
root:=RTD_root;
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
  BEGIN
END
; mrucomCODE_RELDproc(currenttree
,RELD__labeled
,RELD__label
,RELD__indent
,RELD__leftcom
,RELD__rightcom
,RELD__variable
,RELD__RelationNamed
);
 BEGIN
variable:=RELD__variable;
RelationNamed:=RELD__RelationNamed;
END
END;

3: begin
  BEGIN BARETD__indent:=indent+2;
BARETD__righttolefttable:=righttolefttable;
BARETD__name:=name;
BARETD__root:=root;
END
; mrucomCODE_BARETDproc(currenttree
,BARETD__indent
,BARETD__name
,BARETD__righttolefttable
,BARETD__root
,BARETD__leftcom
,BARETD__rightcom
,BARETD__dtreeproc
,BARETD__NumberOfItems
,BARETD__keymentioned
,BARETD__keyvar
,BARETD__keystr1
,BARETD__levelids
,BARETD__keystr2
);
 BEGIN dtreeproc:=BARETD__dtreeproc;
levelids:=BARETD__levelids;
keymentioned:=BARETD__keymentioned;
keyvar:=BARETD__keyvar;
keystr1:=BARETD__keystr1;
keystr2:=BARETD__keystr2;
NumberOfItems:=BARETD__NumberOfItems;
AppendLocFile(BARETD__leftcom,leftcom);
AppendLocFile(BARETD__rightcom,rightcom);
END
END;

END;

rsnode1:=rsnode1^.brother END;
BEGIN
RTD_dtreeproc:=dtreeproc;
RTD_levelids:=levelids;
RTD_keymentioned:=keymentioned;
RTD_keyvar:=keyvar;
RTD_keystr1:=keystr1;
RTD_keystr2:=keystr2;
RTD_leftcom:=leftcom; 
RTD_rightcom:=rightcom; 
RTD_RelationNamed:=RelationNamed;
RTD_variable:=variable;
RTD_NumberOfItems:=NumberOfItems;
END
END;
PROCEDURE mrucomCODE_RELDproc(top:mrucomDECL_psnode
;RELD_labeled              :mrucomlangspec_Bool
;RELD_label              :TSTRING_string
;RELD_indent              :mrucomlangspec_INT
;var RELD_leftcom              :LOCALFILE
;var RELD_rightcom              :LOCALFILE
;var RELD_variable              :TSTRING_string
;var RELD_RelationNamed              :mrucomlangspec_Bool
);
VAR currenttree:mrucomDECL_psnode;
    rsnode1:mrucomDECL_prsnode;
 leftcom:LOCALFILE;
relvariable,
ilabel :TSTRING_string;
labeled,RelationNamed: mrucomLANGSPEC_Bool;
indent:Integer;
BEGIN
 BEGIN TSTRING_constantempty(relvariable);
TSTRING_constantempty(ilabel);
END;
rsnode1:=top^.sonlist;
  while rsnode1<>nil do
  begin
  currenttree:=rsnode1^.node;
  case rsnode1^.sonnumber of

1: begin
  BEGIN END
; mrucomCODE_RELNAMEproc(currenttree
,RELNAME__ident
);
 BEGIN relvariable:=RELNAME__ident;
RelationNamed:=TRUE;
END;
END;

2: begin
  BEGIN END
; mrucomCODE_RELVARproc(currenttree
,RELVAR__ident
);
 BEGIN
relvariable:=RELVAR__ident;
RelationNamed:=False;
END
END;

END;

rsnode1:=rsnode1^.brother END;
BEGIN
RELD_variable:=relvariable;
RELD_RelationNamed:=RelationNamed;
END
END;
PROCEDURE mrucomCODE_MATCHCONDSproc(top:mrucomDECL_psnode
;MATCHCONDS_leftMuVarList              :mrucomlangspec_SETOFidents
;MATCHCONDS_leftSigmaVarList              :mrucomlangspec_SETOFidents
;MATCHCONDS_leftRelVarList              :mrucomlangspec_SETOFidents
;MATCHCONDS_leftTreeVarList              :mrucomlangspec_SETOFidents
;MATCHCONDS_leftNodeVarList              :mrucomlangspec_SETOFidents
;MATCHCONDS_rightMuVarList              :mrucomlangspec_SETOFidents
;MATCHCONDS_rightSigmaVarList              :mrucomlangspec_SETOFidents
;MATCHCONDS_rightRelVarList              :mrucomlangspec_SETOFidents
;MATCHCONDS_rightTreeVarList              :mrucomlangspec_SETOFidents
;MATCHCONDS_rightNodeVarList              :mrucomlangspec_SETOFidents
;MATCHCONDS_indent              :mrucomlangspec_int
;var MATCHCONDS_commatchfile              :LOCALFILE
;var MATCHCONDS_decommatchfile              :LOCALFILE
);
VAR currenttree:mrucomDECL_psnode;
    rsnode1:mrucomDECL_prsnode;
 commatchfile:LOCALFILE;
decommatchfile:LOCALFILE;
commatchfile1:LOCALFILE;
decommatchfile1,helpdecommatchfile:LOCALFILE;
decomallexist:LOCALFILE;
labelname:TSTRING_string;
andcondabsent:BOOLEAN;
numofmatchconds:INTEGER;
indent: mrucomLANGSPEC_int;
leftMuvarlist,leftsigmavarlist,leftnodevarlist,leftrelvarlist,lefttreevarlist: mrucomLANGSPEC_setofidents;
rightMuvarlist,rightsigmavarlist,rightnodevarlist,rightrelvarlist,righttreevarlist: mrucomLANGSPEC_setofidents;
BEGIN
 BEGIN indent:=MATCHCONDS_indent;
leftMuvarlist:=MATCHCONDS_leftMuVarlist;
leftSigmaVarlist:=MATCHCONDS_leftSigmaVarlist;
leftNodeVarlist:=MATCHCONDS_leftNodeVarlist;
leftTreeVarlist:=MATCHCONDS_leftTreeVarlist;
leftRelVarlist:=MATCHCONDS_leftRelVarlist;
rightMuvarlist:=MATCHCONDS_rightMuVarlist;
rightSigmaVarlist:=MATCHCONDS_rightSigmaVarlist;
rightNodeVarlist:=MATCHCONDS_rightNodeVarlist;
rightTreeVarlist:=MATCHCONDS_rightTreeVarlist;
rightRelVarlist:=MATCHCONDS_rightRelVarlist;
TSTRING_constantempty(labelname);
INITLOCALFILE(commatchfile);
INITLOCALFILE(decommatchfile);
INITLOCALFILE(commatchfile1);
INITLOCALFILE(decommatchfile1);
INITLOCALFILE(decomallexist);
andcondabsent:=true;
numofmatchconds:=0;
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
;
 
BEGIN 
IF andcondabsent and (numofmatchconds<>0) THEN
BEGIN
BEGIN  END;
LOCALTAB(commatchfile,indent);
appendstring('FUNCTION matchcond',commatchfile);
 appendstring(labelname,commatchfile);
 appendstring(':BOOLEAN;',commatchfile);
 appendstring('\\',commatchfile);
 
LOCALTAB(commatchfile,indent);
appendstring('BEGIN',commatchfile);
 appendstring('\\',commatchfile);

LOCALTAB(commatchfile,indent+2);
appendstring('matchcond',commatchfile);
 appendstring(labelname,commatchfile);
 appendstring(':= TRUE',commatchfile);
 appendstring('\\',commatchfile);

LOCALTAB(commatchfile,indent);
appendstring('END;{matchcond',commatchfile);
 appendstring(labelname,commatchfile);
 appendstring('}',commatchfile);
appendstring('\\',commatchfile);

BEGIN  END;
LOCALTAB(decommatchfile,indent);
appendstring('FUNCTION matchcond',decommatchfile);
 appendstring(labelname,decommatchfile);
 appendstring(':BOOLEAN;',decommatchfile);
 appendstring('\\',decommatchfile);

LOCALTAB(decommatchfile,indent);
appendstring('BEGIN',decommatchfile);
 appendstring('\\',decommatchfile);

LOCALTAB(decommatchfile,indent+2);
appendstring('matchcond',decommatchfile);
 appendstring(labelname,decommatchfile);
 appendstring(':= TRUE',decommatchfile);
 appendstring('\\',decommatchfile);

LOCALTAB(decommatchfile,indent);
appendstring('END;{matchcond',decommatchfile);
 appendstring(labelname,decommatchfile);
 appendstring('}',decommatchfile);
appendstring('\\',decommatchfile);

{invert order of match conditions:}
appendlocfile(commatchfile1,commatchfile);
INITLOCALFILE(commatchfile1);
appendlocfile(commatchfile,commatchfile1);
INITLOCALFILE(commatchfile);
appendlocfile(decommatchfile1,decommatchfile);
INITLOCALFILE(decommatchfile1);
appendlocfile(decommatchfile,decommatchfile1);
INITLOCALFILE(decommatchfile);
END;
andcondabsent:=true;
numofmatchconds:=numofmatchconds+1;
labelname:=currenttree^.ldfield.LABELTJEfield^.str;
END
END;

3: begin
  BEGIN END
;
 BEGIN END
END;

4: begin
  BEGIN END
;
 BEGIN END
END;

5: begin
  BEGIN ANDCOND__allexistcounter:=0; andcondabsent:=false;
ANDCOND__indent:=indent+2;
ANDCOND__toplevel:=TRUE;
INITSETOFvartypes(ANDCOND__vartypes);
END
; mrucomCODE_ANDCONDproc(currenttree
,ANDCOND__indent
,ANDCOND__toplevel
,ANDCOND__vartypes
,ANDCOND__commatchfile
,ANDCOND__decommatchfile
,ANDCOND__allexist
,ANDCOND__allexistcounter
);
 BEGIN
BEGIN  END;
BEGIN 
LOCALTAB(commatchfile,indent);
appendstring('FUNCTION matchcond',commatchfile);
 appendstring(labelname,commatchfile);
 appendstring(':BOOLEAN;',commatchfile);
 appendstring('\\',commatchfile);
 
END;
AppendLocFile(ANDCOND__allexist,commatchfile);
BEGIN  END;
BEGIN
appendstring('BEGIN',commatchfile);
 appendstring('\\',commatchfile);

appendstring('matchcond',commatchfile);
 appendstring(labelname,commatchfile);
 appendstring(':=FALSE;',commatchfile);
 appendstring('\\',commatchfile);

LOCALTAB(commatchfile,indent+2);
appendstring('IF',commatchfile);
appendstring('\\',commatchfile);

END;
AppendLocFile(ANDCOND__commatchfile,commatchfile);
BEGIN  END;
BEGIN 
appendstring('THEN ',commatchfile);
appendstring('\\',commatchfile);

appendstring('matchcond',commatchfile);
 appendstring(labelname,commatchfile);
 appendstring(':=TRUE;',commatchfile);
 appendstring('\\',commatchfile);

appendstring('\\',commatchfile);
 LOCALTAB(commatchfile,indent);appendstring('END;{matchcond',commatchfile);
 appendstring(labelname,commatchfile);
 appendstring('}',commatchfile);
appendstring('\\',commatchfile);

END;
BEGIN  END;
BEGIN
LOCALTAB(decommatchfile,indent); 
appendstring('FUNCTION matchcond',decommatchfile);
 appendstring(labelname,decommatchfile);
 appendstring(':BOOLEAN;',decommatchfile);
 appendstring('\\',decommatchfile);

END;
SAVElocfile(ANDCOND__allexist,decomallexist);
AppendLocFile(decomallexist,decommatchfile);
BEGIN  END;
BEGIN
LOCALTAB(decommatchfile,indent);
appendstring('BEGIN',decommatchfile);
 appendstring('\\',decommatchfile);

appendstring('matchcond',decommatchfile);
 appendstring(labelname,decommatchfile);
 appendstring(':=FALSE;',decommatchfile);
 appendstring('\\',decommatchfile);

LOCALTAB(decommatchfile,indent+2);
appendstring('IF',decommatchfile);
appendstring('\\',decommatchfile);

LOCALTAB(decommatchfile,indent+10);
END;
SAVElocfile(ANDCOND__commatchfile,helpdecommatchfile);
AppendLocFile(helpdecommatchfile,decommatchfile);
BEGIN  END;
BEGIN 
appendstring('THEN ',decommatchfile);
appendstring('\\',decommatchfile);

appendstring('matchcond',decommatchfile);
 appendstring(labelname,decommatchfile);
 appendstring(':=TRUE;',decommatchfile);
 appendstring('\\',decommatchfile);

appendstring('\\',decommatchfile);
 LOCALTAB(decommatchfile,indent);appendstring('END;{matchcond',decommatchfile);
 appendstring(labelname,decommatchfile);
 appendstring('}',decommatchfile);
appendstring('\\',decommatchfile);

END;
{invert order of match conditions:}
appendlocfile(commatchfile1,commatchfile);
INITLOCALFILE(commatchfile1);
appendlocfile(commatchfile,commatchfile1);
INITLOCALFILE(commatchfile);
appendlocfile(decommatchfile1,decommatchfile);
INITLOCALFILE(decommatchfile1);
appendlocfile(decommatchfile,decommatchfile1);
INITLOCALFILE(decommatchfile);
END
END;

6: begin
  BEGIN END
;
 BEGIN END
END;

7: begin
  BEGIN END
;
 BEGIN END
END;

END;

rsnode1:=rsnode1^.brother END;
BEGIN
IF andcondabsent THEN
BEGIN
BEGIN  END;
LOCALTAB(commatchfile,indent);
appendstring('FUNCTION matchcond',commatchfile);
 appendstring(labelname,commatchfile);
 appendstring(':BOOLEAN;',commatchfile);
 appendstring('\\',commatchfile);
 
LOCALTAB(commatchfile,indent);
appendstring('BEGIN',commatchfile);
 appendstring('\\',commatchfile);

LOCALTAB(commatchfile,indent+2);
appendstring('matchcond',commatchfile);
 appendstring(labelname,commatchfile);
 appendstring(':= TRUE',commatchfile);
 appendstring('\\',commatchfile);

LOCALTAB(commatchfile,indent);
appendstring('END;{matchcond',commatchfile);
 appendstring(labelname,commatchfile);
 appendstring('}',commatchfile);
appendstring('\\',commatchfile);

BEGIN  END;
LOCALTAB(decommatchfile,indent);
appendstring('FUNCTION matchcond',decommatchfile);
 appendstring(labelname,decommatchfile);
 appendstring(':BOOLEAN;',decommatchfile);
 appendstring('\\',decommatchfile);

appendstring('BEGIN',decommatchfile);
 appendstring('\\',decommatchfile);

LOCALTAB(decommatchfile,2);
appendstring('matchcond',decommatchfile);
 appendstring(labelname,decommatchfile);
 appendstring(':= TRUE',decommatchfile);
 appendstring('\\',decommatchfile);

LOCALTAB(decommatchfile,indent);
appendstring('END;{matchcond',decommatchfile);
 appendstring(labelname,decommatchfile);
 appendstring('}',decommatchfile);
appendstring('\\',decommatchfile);

{invert order of match conditions:}
appendlocfile(commatchfile1,commatchfile);
INITLOCALFILE(commatchfile1);
appendlocfile(commatchfile,commatchfile1);
INITLOCALFILE(commatchfile);
appendlocfile(decommatchfile1,decommatchfile);
INITLOCALFILE(decommatchfile1);
appendlocfile(decommatchfile,decommatchfile1);
INITLOCALFILE(decommatchfile);
END;
INITLOCALFILE(MATCHCONDS_commatchfile);
appendlocfile(commatchfile1,MATCHCONDS_commatchfile);
INITLOCALFILE(MATCHCONDS_decommatchfile);
appendlocfile(decommatchfile1,MATCHCONDS_decommatchfile);
END
END;
PROCEDURE mrucomCODE_ANDCONDproc(top:mrucomDECL_psnode
;ANDCOND_indent              :mrucomlangspec_int
;ANDCOND_toplevel              :mrucomlangspec_bool
;ANDCOND_vartypes              :mrucomlangspec_setofvartypes
;var ANDCOND_commatchfile              :LOCALFILE
;var ANDCOND_decommatchfile              :LOCALFILE
;var ANDCOND_allexist              :LOCALFILE
;var ANDCOND_allexistcounter              :mrucomlangspec_int
);
VAR currenttree:mrucomDECL_psnode;
    rsnode1:mrucomDECL_prsnode;
 commatchfile,decommatchfile:LOCALFILE;
allexist:LOCALFILE;
allexistcounter: mrucomLANGSPEC_int;
vartype: mrucomLANGSPEC_vartype;
string:TSTRING_string;
vartypes: mrucomLANGSPEC_setofvartypes;
toplevel,notpresent: mrucomLANGSPEC_bool;
 PROCEDURE APPENDSETS(S1: mrucomLANGSPEC_SETOFidents;VAR S2: mrucomLANGSPEC_SETOFidents);
VAR ident1: mrucomLANGSPEC_ident;
BEGIN
WHILE STILLidents(S1) DO
BEGIN
TAKEident(ident1,S1);
APPENDident(ident1,S2)
END
END;
BEGIN
 BEGIN notpresent:=FALSE;
vartypes:=ANDCOND_vartypes;
allexistcounter:=ANDCOND_allexistcounter;
INITLOCALFILE(commatchfile);
INITLOCALFILE(decommatchfile);
INITLOCALFILE(allexist);
toplevel:=ANDCOND_toplevel;
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
BEGIN  END;
BEGIN
IF toplevel THEN BEGIN appendstring('THEN IF',commatchfile);
appendstring('\\',commatchfile);
 END
ELSE BEGIN appendstring('AND',commatchfile);
appendstring('\\',commatchfile);
 END;
LOCALTAB(commatchfile,10);
END;
END
END;

2: begin
  BEGIN ORCOND__allexistcounter:=allexistcounter;
ORCOND__vartypes:=vartypes;
END
; mrucomCODE_ORCONDproc(currenttree
,ORCOND__vartypes
,ORCOND__commatchfile
,ORCOND__decommatchfile
,ORCOND__allexist
,ORCOND__allexistcounter
);
 BEGIN
allexistcounter:=ORCOND__allexistcounter;
BEGIN  END;
BEGIN
appendstring('(',commatchfile);

END;
AppendLocFile(ORCOND__commatchfile,commatchfile);
BEGIN  END;
BEGIN
appendstring(')',commatchfile);
 appendstring('\\',commatchfile);

END;
AppendLocFile(ORCOND__decommatchfile,decommatchfile);
AppendLocFile(ORCOND__allexist,allexist);
END
END;

3: begin
  BEGIN string:=currenttree^.ldfield.TREEVARfield^.str END
;
 BEGIN appendstring('(',commatchfile);
 appendstring(string,commatchfile);
 appendstring('^.cat',commatchfile);

vartype.varname:=string;
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
; mrucomCODE_SETVALUENAMEproc(currenttree
,SETVALUENAME__copy
);
 BEGIN vartype.cattable:=currenttree^.ldfield.SETVALUENAMEfield^.valuetable;
appendvartype(vartype,vartypes);
APPENDLOCFILE(SETVALUENAME__copy,commatchfile);
END
END;

6: begin
  BEGIN END
;
 BEGIN appendstring(') AND ',commatchfile);
appendstring('\\',commatchfile);

toplevel:=FALSE;
END
END;

7: begin
  BEGIN string:=currenttree^.ldfield.NODEVARfield^.str END
;
 BEGIN appendstring('(',commatchfile);
 appendstring(string,commatchfile);
 appendstring('.cat',commatchfile);
appendstring('\\',commatchfile);

vartype.varname:=string;
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
appendstring(' IN ',commatchfile);

END
END;

10: begin
  BEGIN notpresent:=TRUE END
;
 BEGIN 
appendstring('NOT(',commatchfile);

END
END;

END;

rsnode1:=rsnode1^.brother END;
BEGIN 
IF notpresent THEN appendstring(')',commatchfile);

ANDCOND_commatchfile:=commatchfile;
ANDCOND_decommatchfile:=decommatchfile;
ANDCOND_allexist:=allexist;
ANDCOND_allexistcounter:=allexistcounter;
END
END;
PROCEDURE mrucomCODE_ORCONDproc(top:mrucomDECL_psnode
;ORCOND_vartypes              :mrucomlangspec_setofvartypes
;var ORCOND_commatchfile              :LOCALFILE
;var ORCOND_decommatchfile              :LOCALFILE
;var ORCOND_allexist              :LOCALFILE
;var ORCOND_allexistcounter              :mrucomlangspec_int
);
VAR currenttree:mrucomDECL_psnode;
    rsnode1:mrucomDECL_prsnode;
 commatchfile,decommatchfile:LocalFile;
allexist:LOCALFILE;
allexistcounter: mrucomLANGSPEC_int;
vartypes: mrucomLANGSPEC_setofvartypes;
 PROCEDURE APPENDSETS(S1: mrucomLANGSPEC_SETOFidents;VAR S2: mrucomLANGSPEC_SETOFidents);
VAR ident1: mrucomLANGSPEC_ident;
BEGIN
WHILE STILLidents(S1) DO
BEGIN
TAKEident(ident1,S1);
APPENDident(ident1,S2)
END
END;
BEGIN
 BEGIN
vartypes:=ORCOND_vartypes;
allexistcounter:=ORCOND_allexistcounter;
INITLOCALFILE(commatchfile);
INITLOCALFILE(decommatchfile);
INITLOCALFILE(allexist);
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
BEGIN  END;
BEGIN
appendstring('OR',commatchfile);
appendstring('\\',commatchfile);

LOCALTAB(commatchfile,10);
END;
END
END;

2: begin
  BEGIN ELEMENTARYCOND__allexistcounter:=allexistcounter;
ELEMENTARYCOND__vartypes:=vartypes;
END
; mrucomCODE_ELEMENTARYCONDproc(currenttree
,ELEMENTARYCOND__vartypes
,ELEMENTARYCOND__commatchfile
,ELEMENTARYCOND__decommatchfile
,ELEMENTARYCOND__allexist
,ELEMENTARYCOND__allexistcounter
);
 BEGIN
allexistcounter:= ELEMENTARYCOND__allexistcounter;
BEGIN  END;
BEGIN
appendstring('(',commatchfile);

END;
AppendLocFile(ELEMENTARYCOND__commatchfile,commatchfile);
BEGIN  END;
BEGIN
appendstring(')',commatchfile);
 appendstring('\\',commatchfile);

END;
AppendLocFile(ELEMENTARYCOND__decommatchfile,decommatchfile);
AppendLocFile(ELEMENTARYCOND__allexist,allexist);
END
END;

END;

rsnode1:=rsnode1^.brother END;
BEGIN 
ORCOND_commatchfile:=commatchfile;
ORCOND_decommatchfile:=decommatchfile;
ORCOND_allexist:=allexist;
ORCOND_allexistcounter:=allexistcounter;
END
END;
PROCEDURE mrucomCODE_ELEMENTARYCONDproc(top:mrucomDECL_psnode
;ELEMENTARYCOND_vartypes              :mrucomlangspec_setofvartypes
;var ELEMENTARYCOND_commatchfile              :LOCALFILE
;var ELEMENTARYCOND_decommatchfile              :LOCALFILE
;var ELEMENTARYCOND_allexist              :LOCALFILE
;var ELEMENTARYCOND_allexistcounter              :mrucomlangspec_int
);
VAR currenttree:mrucomDECL_psnode;
    rsnode1:mrucomDECL_prsnode;
 commatchfile,decommatchfile:LocalFile;
idargs,allexist,allexist1:LOCALFILE;
str:TSTRING_string;
allexistcounter1,allexistcounter: mrucomLANGSPEC_int;
vartypes: mrucomLANGSPEC_setofvartypes;
notpresent,idargspresent: mrucomLANGSPEC_bool;
keypresent,writevpid: mrucomLANGSPEC_bool;
argcounter: mrucomLANGSPEC_int;
BEGIN
 BEGIN
argcounter:=0;
keypresent:=false;
vartypes:=ELEMENTARYCOND_vartypes;
allexistcounter:=ELEMENTARYCOND_allexistcounter;
INITLOCALFILE(commatchfile);
INITLOCALFILE(decommatchfile);
INITLOCALFILE(idargs);
INITLOCALFILE(allexist1);
INITLOCALFILE(allexist);
notpresent:=false;
writevpid:=false;
idargspresent:=FALSE;
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
  BEGIN ANDCOND__allexistcounter:= allexistcounter;
ANDCOND__vartypes:=vartypes;
ANDCOND__toplevel:=FALSE;
END
; mrucomCODE_ANDCONDproc(currenttree
,ANDCOND__indent
,ANDCOND__toplevel
,ANDCOND__vartypes
,ANDCOND__commatchfile
,ANDCOND__decommatchfile
,ANDCOND__allexist
,ANDCOND__allexistcounter
);
 BEGIN
allexistcounter:=ANDCOND__allexistcounter;
AppendLocFile(ANDCOND__commatchfile,commatchfile);
AppendLocFile(ANDCOND__decommatchfile,decommatchfile);
AppendLocFile(ANDCOND__allexist,allexist);
END
END;

3: begin
  BEGIN MATCHBOOLEAN__allexistcounter:= allexistcounter END
; mrucomCODE_MATCHBOOLEANproc(currenttree
,MATCHBOOLEAN__commatchfile
,MATCHBOOLEAN__decommatchfile
,MATCHBOOLEAN__allexist
,MATCHBOOLEAN__allexistcounter
);
 BEGIN 
allexistcounter:= MATCHBOOLEAN__allexistcounter;
AppendLocFile(MATCHBOOLEAN__commatchfile,commatchfile);
AppendLocFile(MATCHBOOLEAN__decommatchfile,decommatchfile);
AppendLocFile(MATCHBOOLEAN__allexist,allexist);
END
END;

4: begin
  BEGIN BOOLEANEXPR__allexistcounter:=allexistcounter;
BOOLEANEXPR__vartypes:=vartypes;
END
; mrucomCODE_BOOLEANEXPRproc(currenttree
,BOOLEANEXPR__vartypes
,BOOLEANEXPR__commatchfile
,BOOLEANEXPR__decommatchfile
,BOOLEANEXPR__allexist
,BOOLEANEXPR__allexistcounter
);
 BEGIN 
allexistcounter:=BOOLEANEXPR__allexistcounter;
AppendLocFile(BOOLEANEXPR__allexist,allexist);
AppendLocFile(BOOLEANEXPR__commatchfile,commatchfile);
AppendLocFile(BOOLEANEXPR__decommatchfile,decommatchfile);
END
END;

5: begin
  BEGIN END
;
 BEGIN  
IF notpresent THEN appendstring('NOT(',commatchfile);
 
appendstring('LSMRUQUO_',commatchfile);
 
END
END;

6: begin
  BEGIN END
;
 BEGIN appendstring('(',commatchfile);
 END
END;

7: begin
  BEGIN str:=currenttree^.ldfield.TERMINAL^.str END
;
 BEGIN  appendstring(str,commatchfile);
 END
END;

8: begin
  BEGIN END
;
 BEGIN  appendstring(')',commatchfile);

IF notpresent THEN appendstring(')',commatchfile);

{ IF writevpid THEN BEGIN appendstring(' AND (VPID=',commatchfile);
 appendstring(str,commatchfile);
 appendstring(')',commatchfile);
 END;}
writevpid:=false;
savelocfile(commatchfile,decommatchfile);
END
END;

11: begin
  BEGIN str:=currenttree^.ldfield.TERMINAL^.str END
;
 BEGIN  
if keypresent then appendstring('(''',commatchfile);

appendstring(str,commatchfile);

if keypresent then appendstring(''')',commatchfile);

appendstring('\\',commatchfile);

END
END;

12: begin
  BEGIN notpresent:=true END
;
 BEGIN END
END;

13: begin
  BEGIN END
;
 BEGIN END
END;

14: begin
  BEGIN END
;
 BEGIN appendstring('.',commatchfile);
 END
END;

15: begin
  BEGIN END
;
 BEGIN appendstring('[',commatchfile);
 END
END;

16: begin
  BEGIN END
;
 BEGIN appendstring(',',commatchfile);
 END
END;

17: begin
  BEGIN END
;
 BEGIN appendstring(']',commatchfile);
 END
END;

18: begin
  BEGIN END
;
 BEGIN appendstring('LSAUXDOM_',commatchfile);
 END
END;

19: begin
  BEGIN str:=currenttree^.ldfield.KEYNAMEfield^.str1 END
;
 BEGIN appendstring(str,commatchfile);
 END
END;

20: begin
  BEGIN str:=currenttree^.ldfield.TERMINAL^.str END
;
 BEGIN appendstring('LIMATCHES_',commatchfile);
 appendstring(str,commatchfile);
 END
END;

21: begin
  BEGIN keypresent:=true END
;
 BEGIN appendstring('auxkey',commatchfile);
 END
END;

22: begin
  BEGIN argcounter:=argcounter + 1;
str:=currenttree^.ldfield.KEYNAMEfield^.str1
END 
;
 BEGIN 
appendstring('idargs.argkeys[',idargs);
 appendstring(mrucomDECL_convinttostring(argcounter),idargs);
 
appendstring(']:=',idargs);
 appendstring(str,idargs);
 appendstring(';',idargs);
appendstring('\\',idargs);


END
END;

23: begin
  BEGIN str:=currenttree^.ldfield.TERMINAL^.str END
;
 BEGIN appendstring('ORD(',commatchfile);
 appendstring(str,commatchfile);
 appendstring(')',commatchfile);
 END
END;

24: begin
  BEGIN idargspresent:=TRUE END
;
 BEGIN appendstring('LIMATCHES_decompiniddict(idargs',commatchfile);

writevpid:=TRUE;

allexistcounter:=allexistcounter+1;
appendstring('FUNCTION idargs',allexist);
 appendstring(mrucomDECL_convinttostring(allexistcounter),allexist);
 appendstring(':BOOLEAN;',allexist);
appendstring('\\',allexist);

appendstring('BEGIN',allexist);
appendstring('\\',allexist);

appendlocfile(idargs,allexist);
appendstring('idargs.nrargs:=',allexist);
 appendstring(mrucomDECL_convinttostring(argcounter),allexist);
 appendstring(';',allexist);
 appendstring('\\',allexist);


END
END;

25: begin
  BEGIN allexistcounter:=allexistcounter+1;
ANDCOND__allexistcounter:= allexistcounter;
ANDCOND__vartypes:=vartypes;
ANDCOND__toplevel:=FALSE;
allexistcounter1:=allexistcounter;
appendstring('imply',commatchfile);
 appendstring(mrucomDECL_convinttostring(allexistcounter1),commatchfile);


appendstring('FUNCTION imply',allexist1);
 appendstring(mrucomDECL_convinttostring(allexistcounter1),allexist1);
 appendstring(':BOOLEAN;',allexist1);
appendstring('\\',allexist1);

appendstring('BEGIN',allexist1);
appendstring('\\',allexist1);

appendstring('IF ',allexist1);

END
; mrucomCODE_ANDCONDproc(currenttree
,ANDCOND__indent
,ANDCOND__toplevel
,ANDCOND__vartypes
,ANDCOND__commatchfile
,ANDCOND__decommatchfile
,ANDCOND__allexist
,ANDCOND__allexistcounter
);
 BEGIN appendlocfile(ANDCOND__commatchfile,allexist1);appendstring('\\',allexist1);

appendstring('THEN imply',allexist1);
 appendstring(mrucomDECL_convinttostring(allexistcounter1),allexist1);

appendstring(':=',allexist1);
appendstring('\\',allexist1);

allexistcounter:=ANDCOND__allexistcounter;
appendlocfile(ANDCOND__allexist,allexist);
END
END;

26: begin
  BEGIN 
ANDCOND__allexistcounter:= allexistcounter;
ANDCOND__vartypes:=vartypes;
ANDCOND__toplevel:=FALSE;
END
; mrucomCODE_ANDCONDproc(currenttree
,ANDCOND__indent
,ANDCOND__toplevel
,ANDCOND__vartypes
,ANDCOND__commatchfile
,ANDCOND__decommatchfile
,ANDCOND__allexist
,ANDCOND__allexistcounter
);
 BEGIN appendlocfile(ANDCOND__commatchfile,allexist1);
appendstring(' ELSE imply',allexist1);
 appendstring(mrucomDECL_convinttostring(allexistcounter1),allexist1);
 
appendstring(':=TRUE;',allexist1);
appendstring('\\',allexist1);

appendstring('END;',allexist1);
appendstring('\\',allexist1);

allexistcounter:=ANDCOND__allexistcounter;
appendlocfile(ANDCOND__allexist,allexist);
appendlocfile(allexist1,allexist);
END
END;

END;

rsnode1:=rsnode1^.brother END;
BEGIN
IF idargspresent THEN
BEGIN

appendstring('idargs',allexist);
 appendstring(mrucomDECL_convinttostring(allexistcounter),allexist);
 appendstring(':=',allexist);
appendstring('\\',allexist);

appendlocfile(commatchfile,allexist);
appendstring('END;',allexist);
appendstring('\\',allexist);

initlocalfile(commatchfile);

appendstring('idargs',commatchfile);
 appendstring(mrucomDECL_convinttostring(allexistcounter),commatchfile);

END;
ELEMENTARYCOND_commatchfile:=commatchfile;
ELEMENTARYCOND_decommatchfile:=decommatchfile;
ELEMENTARYCOND_allexist:=allexist;
ELEMENTARYCOND_allexistcounter:=allexistcounter;
END
END;
PROCEDURE mrucomCODE_BOOLEANEXPRproc(top:mrucomDECL_psnode
;BOOLEANEXPR_vartypes              :mrucomlangspec_setofvartypes
;var BOOLEANEXPR_commatchfile              :LOCALFILE
;var BOOLEANEXPR_decommatchfile              :LOCALFILE
;var BOOLEANEXPR_allexist              :LOCALFILE
;var BOOLEANEXPR_allexistcounter              :mrucomlangspec_int
);
VAR currenttree:mrucomDECL_psnode;
    rsnode1:mrucomDECL_prsnode;
 commatchfile,decommatchfile,allexist:LocalFile;
listvar:TSTRING_string;
equal: mrucomLANGSPEC_bool;
allexistcounter: mrucomLANGSPEC_int;
vartypes: mrucomLANGSPEC_setofvartypes;
BEGIN
 BEGIN
vartypes:=BOOLEANEXPR_vartypes;
allexistcounter:=BOOLEANEXPR_allexistcounter;
INITLOCALFILE(allexist);
INITLOCALFILE(commatchfile);
INITLOCALFILE(decommatchfile);
END;
rsnode1:=top^.sonlist;
  while rsnode1<>nil do
  begin
  currenttree:=rsnode1^.node;
  case rsnode1^.sonnumber of

1: begin
  BEGIN PASCALEXPR__vartypes:=vartypes;
PASCALEXPR__allexistcounter:=allexistcounter;
END
; mrucomCODE_PASCALEXPRproc(currenttree
,PASCALEXPR__vartypes
,PASCALEXPR__commatchfile
,PASCALEXPR__decommatchfile
,PASCALEXPR__casefile
,PASCALEXPR__allexistcounter
);
 BEGIN 
allexistcounter:=PASCALEXPR__allexistcounter;
Appendlocfile(PASCALEXPR__casefile,allexist);
AppendLocFile(PASCALEXPR__commatchfile,commatchfile);
AppendLocFile(PASCALEXPR__decommatchfile,decommatchfile);
END
END;

2: begin
  BEGIN CONDRECORD__allexistcounter:=allexistcounter END
; mrucomCODE_CONDRECORDproc(currenttree
,CONDRECORD__commatchfile
,CONDRECORD__decommatchfile
,CONDRECORD__allexist
,CONDRECORD__allexistcounter
);
 BEGIN 
allexistcounter:=CONDRECORD__allexistcounter;
AppendLocFile(CONDRECORD__allexist,allexist);
AppendLocFile(CONDRECORD__commatchfile,commatchfile);
AppendLocFile(CONDRECORD__decommatchfile,decommatchfile);
END
END;

3: begin
  BEGIN END
;
 BEGIN 
BEGIN  END;
BEGIN
appendstring('TRUE',commatchfile);

END;
END
END;

4: begin
  BEGIN listvar:=currenttree^.ldfield.MUVARfield^.str END
;
 BEGIN 
END
END;

5: begin
  BEGIN equal:=TRUE END
;
 BEGIN 
END
END;

6: begin
  BEGIN equal:=FALSE END
;
 BEGIN 
END
END;

7: begin
  BEGIN END
;
 BEGIN 
IF equal THEN
BEGIN
appendstring('((',commatchfile);
 appendstring(listvar,commatchfile);
 appendstring('.first=NIL) AND',commatchfile);

appendstring('(',commatchfile);
 appendstring(listvar,commatchfile);
 appendstring('.last=NIL))',commatchfile);
appendstring('\\',commatchfile);

END
ELSE
BEGIN
appendstring('(',commatchfile);
 appendstring(listvar,commatchfile);
 appendstring('.first<>NIL)',commatchfile);
appendstring('\\',commatchfile);

END
END
END;

8: begin
  BEGIN listvar:=currenttree^.ldfield.SIGMAVARfield^.str END
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
BOOLEANEXPR_allexist:=allexist;
BOOLEANEXPR_allexistcounter:=allexistcounter;
BOOLEANEXPR_commatchfile:=commatchfile;
BOOLEANEXPR_decommatchfile:=decommatchfile;
END
END;
PROCEDURE mrucomCODE_MATCHBOOLEANproc(top:mrucomDECL_psnode
;var MATCHBOOLEAN_commatchfile              :LOCALFILE
;var MATCHBOOLEAN_decommatchfile              :LOCALFILE
;var MATCHBOOLEAN_allexist              :LOCALFILE
;var MATCHBOOLEAN_allexistcounter              :mrucomlangspec_int
);
VAR currenttree:mrucomDECL_psnode;
    rsnode1:mrucomDECL_prsnode;
 nottest:Boolean;
NumberOfItems:Integer;
functionname,variable:TSTRING_string;
commatchfile,decommatchfile,
allexist:LOCALFILE;
id: mrucomLANGSPEC_ident;
levelids: mrucomLANGSPEC_setofidents;
allexistcounter: mrucomLANGSPEC_int;
BEGIN
 BEGIN 
allexistcounter:=MATCHBOOLEAN_allexistcounter;
nottest:=FALSE;
INITLOCALFILE(commatchfile);
INITLOCALFILE(decommatchfile);
INITLOCALFILE(allexist);
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
;
 BEGIN 
nottest:=TRUE;
END
END;

3: begin
  BEGIN
END
;
 BEGIN END
END;

4: begin
  BEGIN END
; mrucomCODE_MUVARproc(currenttree
,MUVAR__ident
);
 BEGIN
variable:=MUVAR__ident;
END
END;

5: begin
  BEGIN END
; mrucomCODE_SIGMAVARproc(currenttree
,SIGMAVAR__ident
);
 BEGIN 
variable:=SIGMAVAR__ident;
END
END;

6: begin
  BEGIN LD__inexist:=TRUE;
END
; mrucomCODE_LDproc(currenttree
,LD__inexist
,LD__NumberOfItems
,LD__allexist
,LD__levelids
);
 BEGIN
allexistcounter:=allexistcounter+1;
NumberOfItems:=LD__NumberOfItems;
BEGIN  END;
BEGIN
appendstring('FUNCTION EXIST',allexist);
 appendstring(mrucomDECL_convinttostring(allexistcounter),allexist);

appendstring('(mu:LSMRUQUO_ListOfStrees):Boolean;',allexist);
appendstring('\\',allexist);

LOCALTAB(allexist,2);
appendstring('VAR next:LSSTREE_pRelNode;',allexist);
appendstring('\\',allexist);

levelids:=LD__levelids;
WHILE stillidents(levelids) DO
BEGIN
takeident(id,levelids);
appendstring('Linit',allexist);
 appendstring(id.str,allexist);
 appendstring(',Lrest',allexist);
 appendstring(id.str,allexist);

appendstring(',Lfirst',allexist);
 appendstring(id.str,allexist);
 appendstring(',Llast',allexist);
 appendstring(id.str,allexist);

appendstring(':LSSTREE_prelnode;',allexist);
appendstring('\\',allexist);

appendstring('i',allexist);
 appendstring(id.str,allexist);
 appendstring(':INTEGER;',allexist);
appendstring('\\',allexist);

appendstring('nomoretrees',allexist);
 appendstring(id.str,allexist);
 appendstring(',lastmatch',allexist);

appendstring(id.str,allexist);
 appendstring(':BOOLEAN;',allexist);
appendstring('\\',allexist);

END;
LOCALTAB(allexist,6);
appendstring('Lfinal:LSSTREE_prelnode;',allexist);
appendstring('\\',allexist);

appendstring('match:Boolean;',allexist);
appendstring('\\',allexist);

END;
appendlocfile(LD__allexist,allexist);
BEGIN  END;
BEGIN
LOCALTAB(allexist,2);
appendstring('BEGIN{Exist',allexist);
 appendstring(mrucomDECL_convinttostring(allexistcounter),allexist);

appendstring('}',allexist);
appendstring('\\',allexist);

LOCALTAB(allexist,4);
appendstring('next:=mu.first;match:=False;Lfinal:=mu.last;',allexist);
appendstring('\\',allexist);

LOCALTAB(allexist,4);
appendstring('IF next =NIL THEN',allexist);
appendstring('\\',allexist);

LOCALTAB(allexist,6);
appendstring('EXIST',allexist);
 appendstring(mrucomDECL_convinttostring(allexistcounter),allexist);

appendstring(':=False',allexist);
appendstring('\\',allexist);

LOCALTAB(allexist,4);
appendstring('ELSE',allexist);
appendstring('\\',allexist);

LOCALTAB(allexist,4);
appendstring('BEGIN',allexist);
appendstring('\\',allexist);

LOCALTAB(allexist,6);
appendstring('WHILE (next<>mu.last) AND NOT(match) DO',allexist);
appendstring('\\',allexist);

LOCALTAB(allexist,6);
appendstring('BEGIN',allexist);
appendstring('\\',allexist);

LOCALTAB(allexist,8);
appendstring('matchlist',allexist);
 appendstring(mrucomDECL_convinttostring(NumberOfItems),allexist);
 
appendstring('items(next,TRUE,match);',allexist);
appendstring('\\',allexist);

LOCALTAB(allexist,8);
appendstring('next:=next^.brother;',allexist);
appendstring('\\',allexist);

LOCALTAB(allexist,6);
appendstring('END;',allexist);
appendstring('\\',allexist);

LOCALTAB(allexist,6);
appendstring('IF match = False THEN',allexist);
appendstring('\\',allexist);

LOCALTAB(allexist,8);
appendstring('matchlist',allexist);
 appendstring(mrucomDECL_convinttostring(NumberOfItems),allexist);
 
appendstring('items(next,TRUE,match);',allexist);
appendstring('\\',allexist);

LOCALTAB(allexist,6);
appendstring('EXIST',allexist);
 appendstring(mrucomDECL_convinttostring(allexistcounter),allexist);

appendstring(':=match;',allexist);
appendstring('\\',allexist);

LOCALTAB(allexist,4);
appendstring('END;',allexist);
appendstring('\\',allexist);

LOCALTAB(allexist,2);
appendstring('END;{Exist}',allexist);
appendstring('\\',allexist);

END;
IF nottest THEN
BEGIN
BEGIN  END;
BEGIN
appendstring('NOT Exist',commatchfile);
 appendstring(mrucomDECL_convinttostring(allexistcounter),commatchfile);

appendstring('(',commatchfile);
 appendstring(variable,commatchfile);
 appendstring(')',commatchfile);

END;
END
ELSE 
BEGIN
BEGIN  END;
BEGIN
appendstring('Exist',commatchfile);
 appendstring(mrucomDECL_convinttostring(allexistcounter),commatchfile);

appendstring('(',commatchfile);
 appendstring(variable,commatchfile);
 appendstring(')',commatchfile);

END;
END
END
END;

7: begin
  BEGIN END
;
 BEGIN
END
END;

8: begin
  BEGIN
ITEM__indent:=0;
TSTRING_constantempty(ITEM__name);
TSTRING_constantempty(ITEM__root);
END
; mrucomCODE_ITEMproc(currenttree
,ITEM__indent
,ITEM__righttolefttable
,ITEM__root
,ITEM__name
,ITEM__leftcom
,ITEM__rightcom
,ITEM__dtreeproc
,ITEM__identifier
,ITEM__levelids
);
 BEGIN
allexistcounter:=allexistcounter+1;
functionname:=ITEM__identifier;
BEGIN  END;
BEGIN
appendstring('FUNCTION ALL',allexist);
 appendstring(mrucomDECL_convinttostring(allexistcounter),allexist);

appendstring('(mu:LSMRUQUO_ListOfStrees):Boolean;',allexist);
appendstring('\\',allexist);

LOCALTAB(allexist,2);
appendstring('VAR next:LSSTREE_pRelNode;',allexist);
appendstring('\\',allexist);

appendstring('lastmatch:BOOLEAN;',allexist);
appendstring('\\',allexist);

LOCALTAB(allexist,6);
levelids:=ITEM__levelids;
WHILE stillidents(levelids) DO
BEGIN
takeident(id,levelids);
appendstring('Linit',allexist);
 appendstring(id.str,allexist);
 appendstring(',Lrest',allexist);
 appendstring(id.str,allexist);

appendstring(',Lfirst',allexist);
 appendstring(id.str,allexist);
 appendstring(',Llast',allexist);
 appendstring(id.str,allexist);

appendstring(':LSSTREE_prelnode;',allexist);
appendstring('\\',allexist);

appendstring('i',allexist);
 appendstring(id.str,allexist);
 appendstring(':INTEGER;',allexist);
appendstring('\\',allexist);

appendstring('nomoretrees',allexist);
 appendstring(id.str,allexist);
 appendstring(',lastmatch',allexist);

appendstring(id.str,allexist);
 appendstring(':BOOLEAN;',allexist);
appendstring('\\',allexist);

END;
appendstring('match:Boolean;',allexist);
appendstring('\\',allexist);

END;
appendlocfile(ITEM__leftcom,allexist);
BEGIN  END;
BEGIN
LOCALTAB(allexist,2);
appendstring('BEGIN{All',allexist);
 appendstring(mrucomDECL_convinttostring(allexistcounter),allexist);
 
appendstring('}',allexist);
appendstring('\\',allexist);

LOCALTAB(allexist,4);
appendstring('next:=mu.first;match:=TRUE;',allexist);
appendstring('\\',allexist);

LOCALTAB(allexist,4);
appendstring('IF next =NIL THEN',allexist);
appendstring('\\',allexist);

LOCALTAB(allexist,6);
appendstring('ALL',allexist);
 appendstring(mrucomDECL_convinttostring(allexistcounter),allexist);
 
appendstring(':=TRUE',allexist);
appendstring('\\',allexist);

LOCALTAB(allexist,4);
appendstring('ELSE',allexist);
appendstring('\\',allexist);

LOCALTAB(allexist,4);
appendstring('BEGIN',allexist);
appendstring('\\',allexist);

LOCALTAB(allexist,6);
appendstring('WHILE (next<>mu.last) AND (match) DO',allexist);
appendstring('\\',allexist);

LOCALTAB(allexist,6);
appendstring('BEGIN',allexist);
appendstring('\\',allexist);

LOCALTAB(allexist,8);
appendstring('match_',allexist);
 appendstring(functionname,allexist);
 appendstring('(next,next,TRUE,match);',allexist);
appendstring('\\',allexist);

LOCALTAB(allexist,8);
appendstring('next:=next^.brother;',allexist);
appendstring('\\',allexist);

LOCALTAB(allexist,6);
appendstring('END;',allexist);
appendstring('\\',allexist);

LOCALTAB(allexist,6);
appendstring('IF match THEN',allexist);
appendstring('\\',allexist);

LOCALTAB(allexist,6);
appendstring('BEGIN',allexist);
appendstring('\\',allexist);

LOCALTAB(allexist,8);
appendstring('match_',allexist);
 appendstring(functionname,allexist);
 appendstring('(next,mu.last,TRUE,match);',allexist);
appendstring('\\',allexist);

LOCALTAB(allexist,8);
appendstring('ALL',allexist);
 appendstring(mrucomDECL_convinttostring(allexistcounter),allexist);

appendstring(':=match;',allexist);
appendstring('\\',allexist);

LOCALTAB(allexist,6);
appendstring('END',allexist);
appendstring('\\',allexist);
 
LOCALTAB(allexist,6);
appendstring('ELSE',allexist);
appendstring('\\',allexist);
 
LOCALTAB(allexist,8);
appendstring('ALL',allexist);
 appendstring(mrucomDECL_convinttostring(allexistcounter),allexist);

appendstring(':=FALSE;',allexist);
appendstring('\\',allexist);

LOCALTAB(allexist,4);
appendstring('END;',allexist);
appendstring('\\',allexist);

LOCALTAB(allexist,2);
appendstring('END;{All}',allexist);
appendstring('\\',allexist);

END;
IF nottest THEN
BEGIN
BEGIN  END;
BEGIN
appendstring('NOT ALL',commatchfile);
 appendstring(mrucomDECL_convinttostring(allexistcounter),commatchfile);

appendstring('(',commatchfile);
 appendstring(variable,commatchfile);
 appendstring(')',commatchfile);

END;
END
ELSE 
BEGIN
BEGIN  END;
BEGIN
appendstring('ALL',commatchfile);
 appendstring(mrucomDECL_convinttostring(allexistcounter),commatchfile);

appendstring('(',commatchfile);
 appendstring(variable,commatchfile);
 appendstring(')',commatchfile);

END;
END
END
END;

9: begin
  BEGIN
END
;
 BEGIN END
END;

10: begin
  BEGIN LD__inexist:=TRUE;
END
; mrucomCODE_LDproc(currenttree
,LD__inexist
,LD__NumberOfItems
,LD__allexist
,LD__levelids
);
 BEGIN
allexistcounter:=allexistcounter+1;
NumberOfItems:=LD__NumberOfItems;
BEGIN  END;
BEGIN
appendstring('FUNCTION FIRST',allexist);
 appendstring(mrucomDECL_convinttostring(allexistcounter),allexist);

appendstring('(mu:LSMRUQUO_ListOfStrees):Boolean;',allexist);
appendstring('\\',allexist);

LOCALTAB(allexist,2);
appendstring('VAR next:LSSTREE_pRelNode;',allexist);
appendstring('\\',allexist);

levelids:=LD__levelids;
WHILE stillidents(levelids) DO
BEGIN
takeident(id,levelids);
appendstring('Linit',allexist);
 appendstring(id.str,allexist);
 appendstring(',Lrest',allexist);
 appendstring(id.str,allexist);

appendstring(',Lfirst',allexist);
 appendstring(id.str,allexist);
 appendstring(',Llast',allexist);
 appendstring(id.str,allexist);

appendstring(':LSSTREE_prelnode;',allexist);
appendstring('\\',allexist);

appendstring('i',allexist);
 appendstring(id.str,allexist);
 appendstring(':INTEGER;',allexist);
appendstring('\\',allexist);

appendstring('nomoretrees',allexist);
 appendstring(id.str,allexist);
 appendstring(',lastmatch',allexist);

appendstring(id.str,allexist);
 appendstring(':BOOLEAN;',allexist);
appendstring('\\',allexist);

END;
LOCALTAB(allexist,6);
appendstring('Lfinal:LSSTREE_prelnode;',allexist);
appendstring('\\',allexist);

appendstring('match:Boolean;',allexist);
appendstring('\\',allexist);

END;
appendlocfile(LD__allexist,allexist);
BEGIN  END;
BEGIN
LOCALTAB(allexist,2);
appendstring('BEGIN{FIRST',allexist);
 appendstring(mrucomDECL_convinttostring(allexistcounter),allexist);

appendstring('}',allexist);
appendstring('\\',allexist);

LOCALTAB(allexist,4);
appendstring('next:=mu.first;match:=False;Lfinal:=mu.last;',allexist);
appendstring('\\',allexist);

LOCALTAB(allexist,4);
appendstring('IF next =NIL THEN',allexist);
appendstring('\\',allexist);

LOCALTAB(allexist,6);
appendstring('FIRST',allexist);
 appendstring(mrucomDECL_convinttostring(allexistcounter),allexist);

appendstring(':=False',allexist);
appendstring('\\',allexist);

LOCALTAB(allexist,4);
appendstring('ELSE',allexist);
appendstring('\\',allexist);

LOCALTAB(allexist,4);
appendstring('BEGIN',allexist);
appendstring('\\',allexist);

LOCALTAB(allexist,6);
appendstring('matchlist',allexist);
 appendstring(mrucomDECL_convinttostring(NumberOfItems),allexist);
 
appendstring('items(next,TRUE,match);',allexist);
appendstring('\\',allexist);

LOCALTAB(allexist,6);
appendstring('FIRST',allexist);
 appendstring(mrucomDECL_convinttostring(allexistcounter),allexist);

appendstring(':=match;',allexist);
appendstring('\\',allexist);

LOCALTAB(allexist,4);
appendstring('END;',allexist);
appendstring('\\',allexist);

LOCALTAB(allexist,2);
appendstring('END;{FIRST}',allexist);
appendstring('\\',allexist);

END;
IF nottest THEN
BEGIN
BEGIN  END;
BEGIN
appendstring('NOT FIRST',commatchfile);
 appendstring(mrucomDECL_convinttostring(allexistcounter),commatchfile);

appendstring('(',commatchfile);
 appendstring(variable,commatchfile);
 appendstring(')',commatchfile);

END;
END
ELSE 
BEGIN
BEGIN  END;
BEGIN
appendstring('FIRST',commatchfile);
 appendstring(mrucomDECL_convinttostring(allexistcounter),commatchfile);

appendstring('(',commatchfile);
 appendstring(variable,commatchfile);
 appendstring(')',commatchfile);

END;
END
END
END;

11: begin
  BEGIN LD__inexist:=FALSE;
END
; mrucomCODE_LDproc(currenttree
,LD__inexist
,LD__NumberOfItems
,LD__allexist
,LD__levelids
);
 BEGIN
allexistcounter:=allexistcounter+1;
NumberOfItems:=LD__NumberOfItems;
BEGIN  END;
BEGIN
appendstring('FUNCTION EQUALS',allexist);
 appendstring(mrucomDECL_convinttostring(allexistcounter),allexist);

appendstring('(mu:LSMRUQUO_ListOfStrees):Boolean;',allexist);
appendstring('\\',allexist);

LOCALTAB(allexist,2);
appendstring('VAR next:LSSTREE_pRelNode;',allexist);
appendstring('\\',allexist);

levelids:=LD__levelids;
WHILE stillidents(levelids) DO
BEGIN
takeident(id,levelids);
appendstring('Linit',allexist);
 appendstring(id.str,allexist);
 appendstring(',Lrest',allexist);
 appendstring(id.str,allexist);

appendstring(',Lfirst',allexist);
 appendstring(id.str,allexist);
 appendstring(',Llast',allexist);
 appendstring(id.str,allexist);

appendstring(':LSSTREE_prelnode;',allexist);
appendstring('\\',allexist);

appendstring('i',allexist);
 appendstring(id.str,allexist);
 appendstring(':INTEGER;',allexist);
appendstring('\\',allexist);

appendstring('nomoretrees',allexist);
 appendstring(id.str,allexist);
 appendstring(',lastmatch',allexist);

appendstring(id.str,allexist);
 appendstring(':BOOLEAN;',allexist);
appendstring('\\',allexist);

END;
LOCALTAB(allexist,6);
appendstring('Lfinal:LSSTREE_prelnode;',allexist);
appendstring('\\',allexist);

appendstring('match:Boolean;',allexist);
appendstring('\\',allexist);

END;
appendlocfile(LD__allexist,allexist);
BEGIN  END;
BEGIN
LOCALTAB(allexist,2);
appendstring('BEGIN{EQUALS',allexist);
 appendstring(mrucomDECL_convinttostring(allexistcounter),allexist);

appendstring('}',allexist);
appendstring('\\',allexist);

LOCALTAB(allexist,4);
appendstring('next:=mu.first;match:=False;Lfinal:=mu.last;',allexist);
appendstring('\\',allexist);

LOCALTAB(allexist,4);
appendstring('IF next =NIL THEN',allexist);
appendstring('\\',allexist);

LOCALTAB(allexist,6);
appendstring('EQUALS',allexist);
 appendstring(mrucomDECL_convinttostring(allexistcounter),allexist);

appendstring(':=False',allexist);
appendstring('\\',allexist);

LOCALTAB(allexist,4);
appendstring('ELSE',allexist);
appendstring('\\',allexist);

LOCALTAB(allexist,4);
appendstring('BEGIN',allexist);
appendstring('\\',allexist);

LOCALTAB(allexist,6);
appendstring('matchlist',allexist);
 appendstring(mrucomDECL_convinttostring(NumberOfItems),allexist);
 
appendstring('items(next,TRUE,match);',allexist);
appendstring('\\',allexist);

LOCALTAB(allexist,6);
appendstring('EQUALS',allexist);
 appendstring(mrucomDECL_convinttostring(allexistcounter),allexist);

appendstring(':=match;',allexist);
appendstring('\\',allexist);

LOCALTAB(allexist,4);
appendstring('END;',allexist);
appendstring('\\',allexist);

LOCALTAB(allexist,2);
appendstring('END;{EQUALS}',allexist);
appendstring('\\',allexist);

END;
IF nottest THEN
BEGIN
BEGIN  END;
BEGIN
appendstring('NOT EQUALS',commatchfile);
 appendstring(mrucomDECL_convinttostring(allexistcounter),commatchfile);

appendstring('(',commatchfile);
 appendstring(variable,commatchfile);
 appendstring(')',commatchfile);

END;
END
ELSE 
BEGIN
BEGIN  END;
BEGIN
appendstring('EQUALS',commatchfile);
 appendstring(mrucomDECL_convinttostring(allexistcounter),commatchfile);

appendstring('(',commatchfile);
 appendstring(variable,commatchfile);
 appendstring(')',commatchfile);

END;
END
END
END;

END;

rsnode1:=rsnode1^.brother END;
BEGIN 
MATCHBOOLEAN_commatchfile:=commatchfile;
MATCHBOOLEAN_decommatchfile:=decommatchfile;
MATCHBOOLEAN_allexist:=allexist;
MATCHBOOLEAN_allexistcounter:=allexistcounter;
END
END;
PROCEDURE mrucomCODE_PARAMETERSspecproc(top:mrucomDECL_psnode
);
VAR currenttree:mrucomDECL_psnode;
    rsnode1:mrucomDECL_prsnode;

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

2: begin
  BEGIN END
;
 BEGIN END
END;

3: begin
  BEGIN END
;
 BEGIN END
END;

4: begin
  BEGIN END
;
 BEGIN END
END;

END;

rsnode1:=rsnode1^.brother END;
BEGIN END
END;
PROCEDURE mrucomCODE_ASSIGNRECORDproc(top:mrucomDECL_psnode
;var ASSIGNRECORD_copy              :LOCALFILE
);
VAR currenttree:mrucomDECL_psnode;
    rsnode1:mrucomDECL_prsnode;
 copy:LOCALFILE;
str,catname,recname,attname:TSTRING_string;
auxrecord: mrucomLANGSPEC_bool;
copyident:TSTRING_string;
 FUNCTION RECDEFSTRING:TSTRING_string;
VAR str:TSTRING_string;
begin
TSTRING_constant(str,'RECDEF',6);
RECDEFSTRING:=str
end;
PROCEDURE SelectCatName(recordname:TSTRING_string;
VAR catname:TSTRING_string);
VAR length:integer;
BEGIN
length:=TSTRING_Length(recordname);
IF recordname[length]='_' THEN length:=length-1;
IF recordname[length] IN ['0','1','2','3','4','5','6','7','8','9'] THEN
TSTRING_ExtractBegin(catname,recordname,length-4)
ELSE
TSTRING_ExtractBegin(catname,recordname,length-6);
END;
BEGIN
 BEGIN INITLOCALFILE(copy) END;
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
  BEGIN recname:=currenttree^.ldfield.CATRECNAMEfield^.str;
END
;
 BEGIN END
END;

3: begin
  BEGIN END
; mrucomCODE_VALUENAMEproc(currenttree
,VALUENAME__string
);
 BEGIN str:=VALUENAME__string;

appendstring(recname,copy);
 appendstring('.',copy);
 appendstring(attname,copy);

appendstring(':=',copy);
 appendstring(str,copy);
 appendstring(';',copy);
appendstring('\\',copy);

END
END;

4: begin
  BEGIN END
;
 BEGIN copyident:=currenttree^.ldfield.TERMINAL^.str END
END;

5: begin
  BEGIN END
;
 BEGIN str:=currenttree^.ldfield.CATRECNAMEfield^.str;

appendstring(recname,copy);
 appendstring(':=COPYT_',copy);
 appendstring(copyident,copy);
 appendstring('(',copy);

appendstring(str,copy);
 appendstring(');',copy);

END
END;

6: begin
  BEGIN attname:=currenttree^.ldfield.TERMINAL^.str END
;
 BEGIN END
END;

7: begin
  BEGIN END
; mrucomCODE_SETVALUENAMEproc(currenttree
,SETVALUENAME__copy
);
 BEGIN 

appendstring(recname,copy);
 appendstring('.',copy);
 appendstring(attname,copy);
 appendstring(':=',copy);
 appendstring('\\',copy);

APPENDLOCFILE(SETVALUENAME__copy,copy);
appendstring(';',copy);

END
END;

8: begin
  BEGIN END
; mrucomCODE_VARNAMEproc(currenttree
,VARNAME__string
);
 BEGIN str:= VARNAME__string;

appendstring(recname,copy);
 appendstring('.',copy);
 appendstring(attname,copy);

appendstring(':=',copy);
 appendstring(str,copy);
 appendstring(';',copy);
appendstring('\\',copy);

END
END;

9: begin
  BEGIN str:=currenttree^.ldfield.CATRECNAMEfield^.str;
 
IF (TSTRING_compareEnd(str,RECDEFstring)=0) THEN
BEGIN
Selectcatname(str,catname);
appendstring('MAKET_',copy);
 appendstring(catname,copy);
 appendstring('rec(',copy);
 appendstring(recname,copy);
 
appendstring(');',copy);

END
ELSE
BEGIN
appendstring(recname,copy);
 appendstring(':=',copy);
 appendstring(str,copy);

appendstring(';',copy);

END;
END
;
 BEGIN END
END;

10: begin
  BEGIN str:=currenttree^.ldfield.TERMINAL^.str;
 
appendstring('LSAUXDOM_As',copy);
 appendstring(str,copy);
 appendstring('(',copy);

appendstring(recname,copy);
 appendstring(');',copy);

END
;
 BEGIN END
END;

11: begin
  BEGIN END
;
 BEGIN END
END;

12: begin
  BEGIN END
;
 BEGIN END
END;

13: begin
  BEGIN auxrecord:=TRUE END
;
 BEGIN END
END;

END;

rsnode1:=rsnode1^.brother END;
BEGIN ASSIGNRECORD_copy:=copy END
END;
PROCEDURE mrucomCODE_CONDRECORDproc(top:mrucomDECL_psnode
;var CONDRECORD_commatchfile              :LOCALFILE
;var CONDRECORD_decommatchfile              :LOCALFILE
;var CONDRECORD_allexist              :LOCALFILE
;var CONDRECORD_allexistcounter              :mrucomlangspec_int
);
VAR currenttree:mrucomDECL_psnode;
    rsnode1:mrucomDECL_prsnode;
 recname,name,recordattribute:TSTRING_string;
NItest,intest:Boolean;
exceptident: mrucomLANGSPEC_ident;
exceptset,exceptattrs: mrucomLANGSPEC_setofidents;
def,unequal,excond: mrucomLANGSPEC_bool;
str,catname,copyident:TSTRING_string;
allexistcounter: mrucomLANGSPEC_int;
commatchfile,decommatchfile,allexist:LOCALFILE;
attrstruct:TLDCONVREC_pCATattrstruct;
setname:LOCALFILE;
 FUNCTION RECDEFSTRING:TSTRING_string;
VAR str:TSTRING_string;
begin
TSTRING_constant(str,'RECDEF',6);
RECDEFSTRING:=str
end;
FUNCTION surviveattrs(exceptset: mrucomLANGSPEC_setofidents;
p:TLDCONVREC_pCATattrstruct): mrucomLANGSPEC_setofidents;
VAR result: mrucomLANGSPEC_setofidents;
ident1: mrucomLANGSPEC_ident;
FUNCTION present(ident: mrucomLANGSPEC_ident;S1: mrucomLANGSPEC_setofidents):BOOLEAN;
VAR ident1: mrucomLANGSPEC_ident;
result:boolean;
begin
result:=false;
while stillidents(S1) and not(result) do
begin
takeident(ident1,S1);
TSTRING_uppercase(ident.str,ident.str);
result := (ident1.str=ident.str)
end;
present:=result
end;
BEGIN{surviveattrs}
INITsetofidents(result);
WHILE p<>NIL DO
BEGIN
ident1.str:=p^.fieldname;
IF NOT(present(ident1,exceptset)) THEN
appendident(ident1,result);
p:=p^.nextattr;
END;
surviveattrs:=result
END;
FUNCTION surviveattrs1(exceptset: mrucomLANGSPEC_setofidents;
p:TLDCONVREC_pCATattrstruct): mrucomLANGSPEC_setofidents;
VAR result: mrucomLANGSPEC_setofidents;
ident1: mrucomLANGSPEC_ident;
FUNCTION present(ident: mrucomLANGSPEC_ident;S1: mrucomLANGSPEC_setofidents):BOOLEAN;
VAR ident1: mrucomLANGSPEC_ident;
result:boolean;
begin
result:=false;
while stillidents(S1) and not(result) do
begin
takeident(ident1,S1);
TSTRING_uppercase(ident.str,ident.str);
result := (ident1.str=ident.str)
end;
present:=result
end;
BEGIN{surviveattrs1}
INITsetofidents(result);
WHILE p<>NIL DO
BEGIN
ident1.str:=p^.fieldname;
IF NOT(present(ident1,exceptset)) THEN
IF NOT(TSTRING_compare(ident1.str,'INDEX')=0) THEN
appendident(ident1,result);
p:=p^.nextattr;
END;
surviveattrs1:=result
END;
PROCEDURE SelectCatName(recordname:TSTRING_string;
VAR catname:TSTRING_string);
VAR length:integer;
BEGIN
length:=TSTRING_Length(recordname);
IF recordname[length]='_' THEN length:=length-1;
IF recordname[length] IN ['0','1','2','3','4','5','6','7','8','9'] THEN
TSTRING_ExtractBegin(catname,recordname,length-4)
ELSE
TSTRING_ExtractBegin(catname,recordname,length-6);
END;
BEGIN
 BEGIN 
INITLOCALFILE(setname);
excond:=top^.ldfield.CONDRECORDfield^.excond;
allexistcounter:=CONDRECORD_allexistcounter;
unequal:=top^.ldfield.CONDRECORDfield^.unequal;
exceptset:=top^.ldfield.CONDRECORDfield^.exceptset;
INITLOCALFILE(allexist);
INITLOCALFILE(commatchfile);
INITLOCALFILE(decommatchfile);
IF unequal THEN BEGIN  appendstring('NOT(',commatchfile);
appendstring('\\',commatchfile);
 END;
IF excond THEN
BEGIN

allexistcounter:=allexistcounter + 1;
appendstring('FUNCTION except',allexist);
 appendstring(mrucomDECL_convinttostring(allexistcounter),allexist);
 appendstring(':BOOLEAN;',allexist);
appendstring('\\',allexist);

appendstring('VAR result:BOOLEAN;',allexist);
appendstring('\\',allexist);

END;
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
;
 BEGIN 
recname:=currenttree^.ldfield.CATRECNAMEfield^.str;
END
END;
 
3: begin
  BEGIN END
; mrucomCODE_VALUENAMEproc(currenttree
,VALUENAME__string
);
 BEGIN
name:=VALUENAME__string;
IF NItest THEN
BEGIN
BEGIN  END;
BEGIN 
appendstring('(',commatchfile);
 appendstring(name,commatchfile);
 appendstring(' IN ',commatchfile);
 appendstring(recname,commatchfile);
 appendstring('.',commatchfile);
 appendstring(recordattribute,commatchfile);
 appendstring(')',commatchfile);
 
appendstring(' AND ',commatchfile);
appendstring('\\',commatchfile);
 LOCALTAB(commatchfile,10);
END;
END
ELSE
BEGIN
IF intest THEN writeln('IN ',name,' is nonsense');
BEGIN  END;
BEGIN 
appendstring('(',commatchfile);
 appendstring(recname,commatchfile);
 appendstring('.',commatchfile);
 appendstring(recordattribute,commatchfile);
 appendstring('=',commatchfile);
 appendstring(name,commatchfile);
 appendstring(')',commatchfile);
 
appendstring(' AND ',commatchfile);
 appendstring('\\',commatchfile);
 LOCALTAB(commatchfile,10);
END;
END;
END
END;

4: begin
  BEGIN END
;
 BEGIN NItest:=False; intest:=false END
END;

5: begin
  BEGIN END
;
 BEGIN NItest:=True; intest:=FALSE END
END;

6: begin
  BEGIN END
;
 BEGIN 
str:=currenttree^.ldfield.CATRECNAMEfield^.str;
selectcatname(str,catname);
def:=(TSTRING_compareEnd(str,RECDEFstring)=0);
IF NOT def THEN
BEGIN
attrstruct:=TLDCONVREC_catattrbs(catname);
WHILE attrstruct<>nil DO
BEGIN
 appendstring('(',commatchfile);

appendstring(recname,commatchfile);
 appendstring('.',commatchfile);
 appendstring(attrstruct^.fieldname,commatchfile);
 appendstring('=',commatchfile);

appendstring(str,commatchfile);
 appendstring('.',commatchfile);
 appendstring(attrstruct^.fieldname,commatchfile);
 appendstring(')',commatchfile);

attrstruct:=attrstruct^.nextattr;
IF attrstruct<>NIL THEN appendstring('AND',commatchfile);
 appendstring('\\',commatchfile);

END;
END
ELSE
BEGIN

selectcatname(recname,catname);
appendstring(str,allexist);
 appendstring('loc:LSDOMAINT_',allexist);
 
appendstring(TLDStrToStr_cattorectype(CatName),allexist);
 appendstring(';',allexist);
appendstring('\\',allexist);

appendstring('BEGIN',allexist);
appendstring('\\',allexist);

appendstring('MAKET_',allexist);
 appendstring(catname,allexist);
 appendstring('rec(',allexist);

appendstring(str,allexist);
 appendstring('loc);',allexist);
appendstring('\\',allexist);

appendstring('result:=',allexist);
appendstring('\\',allexist);

attrstruct:=TLDCONVREC_catattrbs(catname);
WHILE attrstruct<>nil DO
BEGIN appendstring('(',allexist);

appendstring(recname,allexist);
 appendstring('.',allexist);
 appendstring(attrstruct^.fieldname,allexist);
 appendstring('=',allexist);

appendstring(str,allexist);
 appendstring('loc.',allexist);
 appendstring(attrstruct^.fieldname,allexist);
 
appendstring(')',allexist);

attrstruct:=attrstruct^.nextattr;
IF attrstruct<>NIL THEN appendstring('AND',allexist);
 appendstring('\\',allexist);

END;
END;
END
END;

7: begin
  BEGIN END
;
 BEGIN END
END;

8: begin
  BEGIN copyident:=currenttree^.ldfield.TERMINAL^.str END
;
 BEGIN END
END;

9: begin
  BEGIN END
;
 BEGIN str:=currenttree^.ldfield.CATRECNAMEfield^.str;

appendstring('BEGIN',allexist);
appendstring('\\',allexist);

appendstring('result:=COPYX_',allexist);
 appendstring(copyident,allexist);
 appendstring('(',allexist);
appendstring('\\',allexist);

appendstring(recname,allexist);
 appendstring(',',allexist);
 appendstring(str,allexist);
 appendstring(');',allexist);
appendstring('\\',allexist);

END
END;

10:begin
  BEGIN END
;
 BEGIN
recordattribute:=currenttree^.ldfield.TERMINAL^.str;
END
END;

11:begin
  BEGIN END
; mrucomCODE_SETVALUENAMEproc(currenttree
,SETVALUENAME__copy
);
 BEGIN
setname:=SETVALUENAME__copy;
IF intest THEN
BEGIN

appendstring('(',commatchfile);
 appendstring(recname,commatchfile);
 appendstring('.',commatchfile);
 appendstring(recordattribute,commatchfile);
 appendstring(' IN ',commatchfile);
 
APPENDLOCFILE(setname,commatchfile);
appendstring(') AND ',commatchfile);
appendstring('\\',commatchfile);
 LOCALTAB(commatchfile,10);
LOCALTAB(commatchfile,10);
END
ELSE
BEGIN

appendstring('(',commatchfile);
 appendstring(recname,commatchfile);
 appendstring('.',commatchfile);
 appendstring(recordattribute,commatchfile);
 appendstring('=',commatchfile);

APPENDLOCFILE(setname,commatchfile);
appendstring(') AND ',commatchfile);
appendstring('\\',commatchfile);
 LOCALTAB(commatchfile,10);
LOCALTAB(commatchfile,10);
END
END
END;

12:begin
  BEGIN END
; mrucomCODE_VARNAMEproc(currenttree
,VARNAME__string
);
 BEGIN
name:=VARNAME__string;
IF NItest THEN
BEGIN
BEGIN  END;
BEGIN 
appendstring('(',commatchfile);
 appendstring(name,commatchfile);
 appendstring(' IN ',commatchfile);
 appendstring(recname,commatchfile);
 appendstring('.',commatchfile);
 appendstring(recordattribute,commatchfile);
 appendstring(')',commatchfile);
 
appendstring(' AND ',commatchfile);
appendstring('\\',commatchfile);
 LOCALTAB(commatchfile,10);
END;
END
ELSE
BEGIN
IF intest THEN
BEGIN 

appendstring('(',commatchfile);
 appendstring(recname,commatchfile);
 appendstring('.',commatchfile);
 appendstring(recordattribute,commatchfile);
 appendstring(' IN ',commatchfile);
 appendstring(name,commatchfile);
 appendstring(')',commatchfile);

appendstring(' AND ',commatchfile);
appendstring('\\',commatchfile);
 LOCALTAB(commatchfile,10);
LOCALTAB(commatchfile,10);
END
ELSE
BEGIN

appendstring('(',commatchfile);
 appendstring(recname,commatchfile);
 appendstring('.',commatchfile);
 appendstring(recordattribute,commatchfile);
 appendstring('=',commatchfile);
 appendstring(name,commatchfile);
 appendstring(')',commatchfile);

appendstring(' AND ',commatchfile);
appendstring('\\',commatchfile);
 LOCALTAB(commatchfile,10);
LOCALTAB(commatchfile,10);
END
END;
END
END;

13:begin
  BEGIN END
;
 BEGIN str:=currenttree^.ldfield.TERMINAL^.str;

appendstring('LSAUXDOM_Cp',commatchfile);
 appendstring(str,commatchfile);
 appendstring('(',commatchfile);

appendstring(recname,commatchfile);
 appendstring(')',commatchfile);
 appendstring('\\',commatchfile);

END
END;

14:begin
  BEGIN END
;
 BEGIN
BEGIN  END;
BEGIN 
appendstring('TRUE',commatchfile);
 appendstring('\\',commatchfile);
 LOCALTAB(commatchfile,10);
END;
END
END;

15:begin
  BEGIN END
;
 BEGIN intest:=TRUE;nitest:=FALSE END
END;

16:begin
  BEGIN END
;
 BEGIN str:=currenttree^.ldfield.TERMINAL^.str;

selectcatname(recname,catname);
appendstring(str,allexist);
 appendstring('loc:LSDOMAINT_',allexist);
 
appendstring(TLDStrToStr_cattorectype(CatName),allexist);
 appendstring(';',allexist);
appendstring('\\',allexist);

appendstring('BEGIN',allexist);
appendstring('\\',allexist);

appendstring('LSAUXDOM_As',allexist);
 appendstring(str,allexist);
 appendstring('(',allexist);

appendstring(str,allexist);
 appendstring('loc);',allexist);
appendstring('\\',allexist);

appendstring('result:=TRUE',allexist);
appendstring('\\',allexist);

attrstruct:=TLDCONVREC_catattrbs(catname);
exceptattrs:=surviveattrs(exceptset,attrstruct);
WHILE stillidents(exceptattrs) DO
BEGIN
appendstring('AND',allexist);
 appendstring('\\',allexist);

takeident(exceptident,exceptattrs);
appendstring('(',allexist);

appendstring(recname,allexist);
 appendstring('.',allexist);
 appendstring(exceptident.str,allexist);
 appendstring('=',allexist);

appendstring(str,allexist);
 appendstring('loc.',allexist);
 appendstring(exceptident.str,allexist);
 
appendstring(')',allexist);

END;
END
END;

17:begin
  BEGIN END
;
 BEGIN
str:=currenttree^.ldfield.CATRECNAMEfield^.str;
selectcatname(recname,catname);
def:=(TSTRING_compareEnd(str,RECDEFstring)=0);
IF def THEN
BEGIN
appendstring(str,allexist);
 appendstring(':LSDOMAINT_',allexist);
 
appendstring(TLDStrToStr_cattorectype(CatName),allexist);
 appendstring(';',allexist);
appendstring('\\',allexist);

END;

appendstring('BEGIN',allexist);
appendstring('\\',allexist);

IF def THEN
BEGIN
appendstring('MAKET_',allexist);
 appendstring(catname,allexist);
 appendstring('rec(',allexist);

appendstring(str,allexist);
 appendstring(');',allexist);
appendstring('\\',allexist);

END;
appendstring('result:=TRUE',allexist);
appendstring('\\',allexist);

attrstruct:=TLDCONVREC_catattrbs(catname);
exceptattrs:=surviveattrs(exceptset,attrstruct);
WHILE stillidents(exceptattrs) DO
BEGIN
appendstring('AND',allexist);
 appendstring('\\',allexist);

takeident(exceptident,exceptattrs);
appendstring('(',allexist);

appendstring(recname,allexist);
 appendstring('.',allexist);
 appendstring(exceptident.str,allexist);
 appendstring('=',allexist);

appendstring(str,allexist);
 appendstring('.',allexist);
 appendstring(exceptident.str,allexist);
 
appendstring(')',allexist);

END;
END
END;

18:begin
  BEGIN END
;
 BEGIN END
END;

19:begin
  BEGIN END
;
 BEGIN END
END;

20:begin
  BEGIN END
;
 BEGIN 
str:=currenttree^.ldfield.CATRECNAMEfield^.str;

selectcatname(recname,catname);
appendstring(str,allexist);
 appendstring('loc:LSDOMAINT_',allexist);
 
appendstring(TLDStrToStr_cattorectype(CatName),allexist);
 appendstring(';',allexist);
appendstring('\\',allexist);

appendstring('BEGIN',allexist);
appendstring('\\',allexist);

appendstring(str,allexist);
 appendstring('loc:=COPYT_',allexist);
 appendstring(copyident,allexist);

appendstring('(',allexist);
 appendstring(str,allexist);
 appendstring(');',allexist);
appendstring('\\',allexist);

appendstring('result:=TRUE',allexist);
appendstring('\\',allexist);

attrstruct:=TLDCONVREC_catattrbs(catname);
exceptattrs:=surviveattrs1(exceptset,attrstruct);
WHILE stillidents(exceptattrs) DO
BEGIN 
appendstring('AND',allexist);
 appendstring('\\',allexist);

takeident(exceptident,exceptattrs);
appendstring('(',allexist);

appendstring(recname,allexist);
 appendstring('.',allexist);
 appendstring(exceptident.str,allexist);
 appendstring('=',allexist);

appendstring(str,allexist);
 appendstring('loc.',allexist);
 appendstring(exceptident.str,allexist);
 
appendstring(')',allexist);

END;
END
END;

21:begin
  BEGIN END
;
 BEGIN END
END;

END;

rsnode1:=rsnode1^.brother END;
BEGIN
IF excond THEN BEGIN appendstring('\\',allexist);

appendstring(';except',allexist);
 appendstring(mrucomDECL_convinttostring(allexistcounter),allexist);
appendstring(':=result',allexist);
appendstring('\\',allexist);

appendstring('END;',allexist);
appendstring('\\',allexist);
 

appendstring('except',commatchfile);
 appendstring(mrucomDECL_convinttostring(allexistcounter),commatchfile);

END;
IF unequal THEN BEGIN  appendstring(')',commatchfile);
appendstring('\\',commatchfile);
 END;
CONDRECORD_allexist:=allexist;
CONDRECORD_commatchfile:=commatchfile;
CONDRECORD_decommatchfile:=decommatchfile;
CONDRECORD_allexistcounter:=allexistcounter;
END
END;
PROCEDURE mrucomCODE_SUBRULESproc(top:mrucomDECL_psnode
;SUBRULES_indent              :mrucomlangspec_int
;SUBRULES_name              :TSTRING_string
;SUBRULES_leftsyncattable              :mrucomlangspec_setofsyncats
;SUBRULES_rightsyncattable              :mrucomlangspec_setofsyncats
;SUBRULES_leftrecordtable              :mrucomlangspec_setofidents
;SUBRULES_rightrecordtable              :mrucomlangspec_setofidents
;SUBRULES_prevleftrhslabels              :mrucomlangspec_setofidents
;SUBRULES_prevrightrhslabels              :mrucomlangspec_setofidents
;SUBRULES_leftmuvarlist              :mrucomlangspec_setofidents
;SUBRULES_leftsigmavarlist              :mrucomlangspec_setofidents
;SUBRULES_lefttreevarlist              :mrucomlangspec_setofidents
;SUBRULES_rightmuvarlist              :mrucomlangspec_setofidents
;SUBRULES_rightsigmavarlist              :mrucomlangspec_setofidents
;SUBRULES_righttreevarlist              :mrucomlangspec_setofidents
;SUBRULES_modelnumber              :mrucomlangspec_int
;SUBRULES_vartypes              :mrucomlangspec_setofvartypes
;var SUBRULES_comsubrules              :LOCALFILE
;var SUBRULES_decomsubrules              :LOCALFILE
;var SUBRULES_dtreeproc              :LOCALFILE
);
VAR currenttree:mrucomDECL_psnode;
    rsnode1:mrucomDECL_prsnode;
 comsubrulespar,decomsubrulespar,leftcompar,leftdecompar,rightcompar,
rightdecompar,commatchfilepar,decommatchfilepar,comconditions,decomconditions,
dtreeproc,comsubrulespar1,decomsubrulespar1,comactions,decomactions:LOCALFILE;
primitiverule,writewhile,insidewhile:BOOLEAN; subrulenumber: mrucomLANGSPEC_int;
righttolefttable: mrucomLANGSPEC_setofrightlefts;
leftlevelids,rightlevelids: mrucomLANGSPEC_setofidents;
rightleft: mrucomLANGSPEC_rightleft;
rightvars: mrucomLANGSPEC_rightvars;
rightvarsset: mrucomLANGSPEC_setofrightvarss;
alltable,alltable1: mrucomLANGSPEC_setofidents;
otherrecords,leftrecords,rightrecords,mergerecords,
leftmuvarlist,leftsigmavarlist,lefttreevarlist,
leftmuvarlist1,leftsigmavarlist1,lefttreevarlist1,
rightmuvarlist1,rightsigmavarlist1,righttreevarlist1,
leftmuvarlist2,leftsigmavarlist2,lefttreevarlist2,
rightmuvarlist2,rightsigmavarlist2,righttreevarlist2,
leftnodevarlist,leftrelvarlist,
rightmuvarlist,rightsigmavarlist,righttreevarlist,
rightnodevarlist,rightrelvarlist,
othermuvarlist,othersigmavarlist,othertreevarlist,
othernodevarlist,otherrelvarlist: mrucomLANGSPEC_setofidents;
id,id1: mrucomLANGSPEC_ident;
leftrhslabels,rightrhslabels,leftrhslabels1,rightrhslabels1,modellabels: mrucomLANGSPEC_setofidents;
voidlabels,identtable: mrucomLANGSPEC_setofidents;
indent,i: mrucomLANGSPEC_int;
catname,name:TSTRING_string;
numofsubrules: mrucomLANGSPEC_int;
sublevel,numberofwhiles:INTEGER;
prevleftrhslabels: mrucomLANGSPEC_setofidents;
prevrightrhslabels: mrucomLANGSPEC_setofidents;
compresent,decompresent: mrucomLANGSPEC_bool;
compresents,decompresents: mrucomLANGSPEC_setofpresents;
compresents1,decompresents1: mrucomLANGSPEC_setofpresents;
compresent1,decompresent1: mrucomLANGSPEC_present;
modelnumber: mrucomLANGSPEC_int;
vartype: mrucomLANGSPEC_vartype;
vartypes,vartypes1,vartypes2: mrucomLANGSPEC_setofvartypes;
syncat: mrucomLANGSPEC_syncat;
leftsyncattable,rightsyncattable,leftsyncattable1,rightsyncattable1,temptable: mrucomLANGSPEC_setofsyncats;
leftrecordtable,rightrecordtable: mrucomLANGSPEC_setofidents;
 PROCEDURE APPENDSETS(S1: mrucomLANGSPEC_SETOFidents;VAR S2: mrucomLANGSPEC_SETOFidents);
VAR ident1: mrucomLANGSPEC_ident;
BEGIN
WHILE STILLidents(S1) DO
BEGIN
TAKEident(ident1,S1);
APPENDident(ident1,S2)
END
END;
FUNCTION present(ident: mrucomLANGSPEC_ident;S1: mrucomLANGSPEC_setofidents):BOOLEAN;
VAR ident1: mrucomLANGSPEC_ident;
result:boolean;
begin
result:=false;
while stillidents(S1) and not(result) do
begin
takeident(ident1,S1);
result := (ident1.str=ident.str)
end;
present:=result
end;
PROCEDURE MERGESETS(S1: mrucomLANGSPEC_SETOFidents;VAR S2: mrucomLANGSPEC_SETOFidents);
VAR ident1: mrucomLANGSPEC_ident;
BEGIN
WHILE STILLidents(S1) DO
BEGIN
TAKEident(ident1,S1);
IF not(present(ident1,S2)) THEN APPENDident(ident1,S2)
END
END;
FUNCTION SUBTRACTSETS(S1: mrucomLANGSPEC_SETOFidents;S2: mrucomLANGSPEC_SETOFidents): mrucomLANGSPEC_setofidents;
VAR ident1: mrucomLANGSPEC_ident;
result: mrucomLANGSPEC_setofidents;
BEGIN
initsetofidents(result);
WHILE STILLidents(S1) DO
BEGIN
TAKEident(ident1,S1);
IF not(present(ident1,S2)) THEN APPENDident(ident1,result)
END;
subtractsets:=result
{result contains those elements of S1 that do not belong to S2}
END;
FUNCTION DOORSNEDE(S1: mrucomLANGSPEC_SETOFidents;S2: mrucomLANGSPEC_SETOFidents): mrucomLANGSPEC_setofidents;
VAR ident1: mrucomLANGSPEC_ident;
result: mrucomLANGSPEC_setofidents;
BEGIN
initsetofidents(result);
WHILE STILLidents(S1) DO
BEGIN
TAKEident(ident1,S1);
IF present(ident1,S2) THEN APPENDident(ident1,result)
END;
doorsnede:=result
{result contains those elements of S1 that also belong to S2}
END;
PROCEDURE SelectCatName(recordname:TSTRING_string;
VAR catname:TSTRING_string);
VAR length:integer;
BEGIN
length:=TSTRING_Length(recordname);
IF recordname[length]='_' THEN length:=length-1;
IF recordname[length] IN ['0','1','2','3','4','5','6','7','8','9'] THEN
TSTRING_ExtractBegin(catname,recordname,length-4)
ELSE
TSTRING_ExtractBegin(catname,recordname,length-6);
END;
BEGIN
 BEGIN TSTRING_constantempty(catname);
rightvarsset:=top^.ldfield.SUBRULESfield^.rightvarsset;
leftsyncattable:=SUBRULES_leftsyncattable;
rightsyncattable:=SUBRULES_rightsyncattable;
rightrecordtable:=SUBRULES_rightrecordtable;
leftrecordtable:=SUBRULES_leftrecordtable;
name:=SUBRULES_name;
compresent:=top^.ldfield.SUBRULESfield^.compresent;
decompresent:=top^.ldfield.SUBRULESfield^.decompresent;
compresents:=top^.ldfield.SUBRULESfield^.compresents;
decompresents:=top^.ldfield.SUBRULESfield^.decompresents;
initsetofidents(alltable);
initsetofpresents(compresents1);
initsetofpresents(decompresents1);
initsetofidents(rightrhslabels);
initsetofidents(leftrhslabels);
initsetofidents(modellabels);
initsetofidents(otherrecords);
initsetofidents(leftrecords);
initsetofidents(rightrecords);
initsetofidents(leftmuvarlist);
initsetofidents(leftsigmavarlist);
initsetofidents(lefttreevarlist);
initsetofidents(leftnodevarlist);
initsetofidents(leftrelvarlist);
initsetofidents(rightmuvarlist);
initsetofidents(rightsigmavarlist);
initsetofidents(righttreevarlist);
initsetofidents(rightnodevarlist);
initsetofidents(rightrelvarlist);
initsetofidents(othermuvarlist);
initsetofidents(othersigmavarlist);
initsetofidents(othertreevarlist);
initsetofidents(othernodevarlist);
initsetofidents(otherrelvarlist);
leftmuvarlist1:=SUBRULES_leftmuvarlist;
leftsigmavarlist1:=SUBRULES_leftsigmavarlist;
lefttreevarlist1:=SUBRULES_lefttreevarlist;
rightmuvarlist1:=SUBRULES_rightmuvarlist;
rightsigmavarlist1:=SUBRULES_rightsigmavarlist;
righttreevarlist1:=SUBRULES_righttreevarlist;
INITLOCALFILE(dtreeproc);
INITLOCALFILE(comactions);
INITLOCALFILE(decomactions);
INITLOCALFILE(comsubrulespar);
INITLOCALFILE(decomsubrulespar);
INITLOCALFILE(leftcompar);INITLOCALFILE(leftdecompar);
INITLOCALFILE(rightcompar);INITLOCALFILE(rightdecompar);
INITLOCALFILE(commatchfilepar);INITLOCALFILE(decommatchfilepar);
INITLOCALFILE(comconditions);
INITLOCALFILE(decomconditions); primitiverule:=FALSE;
INITLOCALFILE(comsubrulespar);INITLOCALFILE(decomsubrulespar);
INITLOCALFILE(comsubrulespar1);
INITLOCALFILE(decomsubrulespar1);
subrulenumber:=0;
righttolefttable:=top^.ldfield.SUBRULESfield^.righttolefttable;
indent:=SUBRULES_indent;
sublevel:=indent DIV 2;
numofsubrules:=0;
prevleftrhslabels:=SUBRULES_prevleftrhslabels;
modelnumber:=SUBRULES_modelnumber;
prevrightrhslabels:=SUBRULES_prevrightrhslabels;
vartypes1:=SUBRULES_vartypes;
initsetofvartypes(vartypes);
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
  BEGIN takerightvars(rightvars,rightvarsset);
rightmuvarlist2:=rightmuvarlist1;
rightsigmavarlist2:=rightsigmavarlist1;
righttreevarlist2:=righttreevarlist1;
APPENDSETS(rightvars.sigmavars,rightsigmavarlist2);
APPENDSETS(rightvars.treevars,righttreevarlist2);
APPENDSETS(rightvars.muvars,rightmuvarlist2);
LEFTSUBMODELS__righttolefttable:= rightleft.table;
leftrhslabels:=currenttree^.ldfield.LEFTSUBMODELSfield^.rhslabels;
LEFTSUBMODELS__prevrhslabels:=prevleftrhslabels;
LEFTSUBMODELS__rightmuvarlist:=rightmuvarlist2;
LEFTSUBMODELS__rightsigmavarl:=rightsigmavarlist2;
LEFTSUBMODELS__righttreevarl:=righttreevarlist2;
LEFTSUBMODELS__indent:=indent+2;
leftsyncattable1:=currenttree^.ldfield.LEFTSUBMODELSfield^.syncattable;
LEFTSUBMODELS__name:=name;
END
; mrucomCODE_LEFTSUBMODELSproc(currenttree
,LEFTSUBMODELS__righttolefttable
,LEFTSUBMODELS__indent
,LEFTSUBMODELS__name
,LEFTSUBMODELS__prevrhslabels
,LEFTSUBMODELS__rightmuvarlist
,LEFTSUBMODELS__rightsigmavarl
,LEFTSUBMODELS__righttreevarl
,LEFTSUBMODELS__leftcom
,LEFTSUBMODELS__leftdecom
,LEFTSUBMODELS__dtreeproc
,LEFTSUBMODELS__levelids
);
 BEGIN APPENDlocfile(LEFTSUBMODELS__leftcom,leftcompar);
APPENDlocfile(LEFTSUBMODELS__leftdecom,leftdecompar);
appendlocfile(LEFTSUBMODELS__dtreeproc,dtreeproc);
lefttreevarlist2:=lefttreevarlist1;
leftmuvarlist2:=leftmuvarlist1;
leftsigmavarlist2:=leftsigmavarlist1;
leftlevelids:=LEFTSUBMODELS__levelids;
APPENDSETS(currenttree^.ldfield.LEFTSUBMODELSfield^.sigmavarlist,leftsigmavarlist2);
APPENDSETS(currenttree^.ldfield.LEFTSUBMODELSfield^.treevarlist,lefttreevarlist2);
APPENDSETS(currenttree^.ldfield.LEFTSUBMODELSfield^.muvarlist,leftmuvarlist2);
APPENDSETS(currenttree^.ldfield.LEFTSUBMODELSfield^.records,LeftRecords);
APPENDSETS(currenttree^.ldfield.LEFTSUBMODELSfield^.MuVarList,leftMuVarList);
APPENDSETS(currenttree^.ldfield.LEFTSUBMODELSfield^.SigmaVarList,leftSigmaVarList);
APPENDSETS(currenttree^.ldfield.LEFTSUBMODELSfield^.TreeVarList,leftTreeVarlist);
APPENDSETS(currenttree^.ldfield.LEFTSUBMODELSfield^.NodeVarList,leftNodeVarList);
APPENDSETS(currenttree^.ldfield.LEFTSUBMODELSfield^.RelVarList,leftrelVarList);
END
END;

3: begin
  BEGIN RIGHTSUBMODELS__righttolefttabl:= rightleft.table;
RIGHTSUBMODELS__indent:=indent+2;
RIGHTSUBMODELS__name:=name;
rightrhslabels:=currenttree^.ldfield.RIGHTSUBMODELSfield^.rhslabels;
RIGHTSUBMODELS__prevrhslabels:=prevrightrhslabels;
RIGHTSUBMODELS__leftmuvarlist:=leftmuvarlist2;
RIGHTSUBMODELS__leftsigmavarl:=leftsigmavarlist2;
RIGHTSUBMODELS__lefttreevarl:=lefttreevarlist2;
rightsyncattable1:=currenttree^.ldfield.RIGHTSUBMODELSfield^.syncattable;
END
; mrucomCODE_RIGHTSUBMODELSproc(currenttree
,RIGHTSUBMODELS__righttolefttabl
,RIGHTSUBMODELS__name
,RIGHTSUBMODELS__indent
,RIGHTSUBMODELS__prevrhslabels
,RIGHTSUBMODELS__leftmuvarlist
,RIGHTSUBMODELS__leftsigmavarl
,RIGHTSUBMODELS__lefttreevarl
,RIGHTSUBMODELS__rightcom
,RIGHTSUBMODELS__rightdecom
,RIGHTSUBMODELS__dtreeproc
,RIGHTSUBMODELS__levelids
);
 BEGIN APPENDlocfile(RIGHTSUBMODELS__rightcom,rightcompar);
APPENDlocfile(RIGHTSUBMODELS__rightdecom,rightdecompar);
APPENDlocfile(RIGHTSUBMODELS__dtreeproc,dtreeproc);
APPENDSETS(currenttree^.ldfield.RIGHTSUBMODELSfield^.records,rightRecords);
APPENDSETS(currenttree^.ldfield.RIGHTSUBMODELSfield^.MuVarList,rightMuVarList);
APPENDSETS(currenttree^.ldfield.RIGHTSUBMODELSfield^.SigmaVarList,rightSigmaVarList);
APPENDSETS(currenttree^.ldfield.RIGHTSUBMODELSfield^.TreeVarList,rightTreeVarlist);
APPENDSETS(currenttree^.ldfield.RIGHTSUBMODELSfield^.NodeVarList,rightNodeVarList);
APPENDSETS(currenttree^.ldfield.RIGHTSUBMODELSfield^.RelVarList,rightrelVarList);
rightlevelids:=RIGHTSUBMODELS__levelids;
END
END;

4: begin
  BEGIN 
alltable:=currenttree^.ldfield.MATCHCONDSfield^.alltable;
MATCHCONDS__leftMuVarList:=leftMuVarList;
MATCHCONDS__leftSigmaVarList:=leftSigmaVarList;
MATCHCONDS__leftTreeVarList:=leftTreeVarList;
MATCHCONDS__leftNodeVarList:=leftNodeVarList;
MATCHCONDS__leftRelVarList:=leftRelVarList;
MATCHCONDS__rightMuVarList:=rightMuVarList;
MATCHCONDS__rightSigmaVarList:=rightSigmaVarList;
MATCHCONDS__rightTreeVarList:=rightTreeVarList;
MATCHCONDS__rightNodeVarList:=rightNodeVarList;
MATCHCONDS__rightRelVarList:=rightRelVarList;
MATCHCONDS__indent:=indent+2;
vartypes:=currenttree^.ldfield.MATCHCONDSfield^.vartypes;
END
; mrucomCODE_MATCHCONDSproc(currenttree
,MATCHCONDS__leftMuVarList
,MATCHCONDS__leftSigmaVarList
,MATCHCONDS__leftRelVarList
,MATCHCONDS__leftTreeVarList
,MATCHCONDS__leftNodeVarList
,MATCHCONDS__rightMuVarList
,MATCHCONDS__rightSigmaVarList
,MATCHCONDS__rightRelVarList
,MATCHCONDS__rightTreeVarList
,MATCHCONDS__rightNodeVarList
,MATCHCONDS__indent
,MATCHCONDS__commatchfile
,MATCHCONDS__decommatchfile
);
 BEGIN APPENDlocfile(MATCHCONDS__commatchfile,commatchfilepar);
APPENDlocfile(MATCHCONDS__decommatchfile,decommatchfilepar);
mergeSETS(currenttree^.ldfield.MATCHCONDSfield^.records,otherRecords);
APPENDSETS(currenttree^.ldfield.MATCHCONDSfield^.MuVarList,otherMuVarList);
APPENDSETS(currenttree^.ldfield.MATCHCONDSfield^.SigmaVarList,otherSigmaVarList);
APPENDSETS(currenttree^.ldfield.MATCHCONDSfield^.TreeVarList,otherTreeVarlist);
APPENDSETS(currenttree^.ldfield.MATCHCONDSfield^.NodeVarList,otherNodeVarList);
APPENDSETS(currenttree^.ldfield.MATCHCONDSfield^.RelVarList,otherrelVarList);
modellabels:=currenttree^.ldfield.MATCHCONDSfield^.modellabels
END
END;

5: begin
  BEGIN SUBRULES__indent:=indent+2;
vartypes2:=vartypes1;
WHILE stillvartypes(vartypes2) DO
BEGIN
takevartype(vartype,vartypes2);
appendvartype(vartype,vartypes)
END;
SUBRULES__vartypes:=vartypes;
numofsubrules:=currenttree^.ldfield.SUBRULESfield^.numofsubrules;
SUBRULES__prevleftrhslabels:=leftrhslabels;
SUBRULES__prevrightrhslabels:=rightrhslabels;
compresents1:=currenttree^.ldfield.SUBRULESfield^.compresents;
decompresents1:=currenttree^.ldfield.SUBRULESfield^.decompresents;
SUBRULES__name:=name;
SUBRULES__leftmuvarlist:=leftmuvarlist2;
SUBRULES__leftsigmavarlist:=leftsigmavarlist2;
SUBRULES__lefttreevarlist:=lefttreevarlist2;
SUBRULES__rightmuvarlist:=rightmuvarlist2;
SUBRULES__rightsigmavarlist:=rightsigmavarlist2;
SUBRULES__righttreevarlist:=righttreevarlist2;
SUBRULES__modelnumber:=modelnumber;
temptable:=leftsyncattable;
WHILE stillsyncats(leftsyncattable1) DO
BEGIN
takesyncat(syncat,leftsyncattable1);
appendsyncat(syncat,temptable);
END;
SUBRULES__leftsyncattable:=temptable;
temptable:=rightsyncattable;
WHILE stillsyncats(rightsyncattable1) DO
BEGIN
takesyncat(syncat,rightsyncattable1);
appendsyncat(syncat,temptable);
END;
SUBRULES__rightsyncattable:=temptable;
SUBRULES__leftrecordtable:=leftrecordtable;
SUBRULES__rightrecordtable:=rightrecordtable;
END
; mrucomCODE_SUBRULESproc(currenttree
,SUBRULES__indent
,SUBRULES__name
,SUBRULES__leftsyncattable
,SUBRULES__rightsyncattable
,SUBRULES__leftrecordtable
,SUBRULES__rightrecordtable
,SUBRULES__prevleftrhslabels
,SUBRULES__prevrightrhslabels
,SUBRULES__leftmuvarlist
,SUBRULES__leftsigmavarlist
,SUBRULES__lefttreevarlist
,SUBRULES__rightmuvarlist
,SUBRULES__rightsigmavarlist
,SUBRULES__righttreevarlist
,SUBRULES__modelnumber
,SUBRULES__vartypes
,SUBRULES__comsubrules
,SUBRULES__decomsubrules
,SUBRULES__dtreeproc
);
 BEGIN APPENDlocfile(SUBRULES__comsubrules,comsubrulespar);
APPENDlocfile(SUBRULES__decomsubrules,decomsubrulespar);
APPENDlocfile(SUBRULES__dtreeproc,dtreeproc);
END
END;

6: begin
  BEGIN primitiverule:=TRUE; 
COMCAPAIRS__rhslabels:=rightrhslabels;
COMCAPAIRS__indent:=indent+2;
COMCAPAIRS__insubrule:=TRUE;
vartypes2:=vartypes1;
WHILE stillvartypes(vartypes2) DO
BEGIN
takevartype(vartype,vartypes2);
appendvartype(vartype,vartypes)
END;
COMCAPAIRS__vartypes:=vartypes;
temptable:=rightsyncattable;
WHILE stillsyncats(rightsyncattable1) DO
BEGIN
takesyncat(syncat,rightsyncattable1);
appendsyncat(syncat,temptable);
END;
COMCAPAIRS__syncattable:=temptable;
COMCAPAIRS__recordtable:=rightrecordtable;
END
; mrucomCODE_COMCAPAIRSproc(currenttree
,COMCAPAIRS__actionteller
,COMCAPAIRS__actiontellers
,COMCAPAIRS__indent
,COMCAPAIRS__syncattable
,COMCAPAIRS__recordtable
,COMCAPAIRS__modelnumber
,COMCAPAIRS__level
,COMCAPAIRS__insubrule
,COMCAPAIRS__filter
,COMCAPAIRS__vartypes
,COMCAPAIRS__rhslabels
,COMCAPAIRS__conditions
,COMCAPAIRS__actions
,COMCAPAIRS__allexist
,COMCAPAIRS__allexistcounter
);
 BEGIN APPENDlocfile(COMCAPAIRS__conditions,comconditions);
APPENDlocfile(COMCAPAIRS__actions,comactions);
END
END;

7: begin
  BEGIN primitiverule:=TRUE;
DECOMCAPAIRS__indent:=indent+2;
DECOMCAPAIRS__rhslabels:=leftrhslabels;
DECOMCAPAIRS__insubrule:=TRUE;
DECOMCAPAIRS__modelnumber:=modelnumber;
IF not compresent THEN
BEGIN
vartypes2:=vartypes1;
WHILE stillvartypes(vartypes2) DO
BEGIN
takevartype(vartype,vartypes2);
appendvartype(vartype,vartypes)
END;
END;
DECOMCAPAIRS__vartypes:=vartypes;
temptable:=leftsyncattable;
WHILE stillsyncats(leftsyncattable1) DO
BEGIN
takesyncat(syncat,leftsyncattable1);
appendsyncat(syncat,temptable);
END;
DECOMCAPAIRS__syncattable:=temptable;
DECOMCAPAIRS__recordtable:=leftrecordtable;
END
; mrucomCODE_DECOMCAPAIRSproc(currenttree
,DECOMCAPAIRS__actionteller
,DECOMCAPAIRS__actiontellers
,DECOMCAPAIRS__indent
,DECOMCAPAIRS__syncattable
,DECOMCAPAIRS__recordtable
,DECOMCAPAIRS__modelnumber
,DECOMCAPAIRS__level
,DECOMCAPAIRS__insubrule
,DECOMCAPAIRS__filter
,DECOMCAPAIRS__vartypes
,DECOMCAPAIRS__rhslabels
,DECOMCAPAIRS__conditions
,DECOMCAPAIRS__actions
,DECOMCAPAIRS__allexist
,DECOMCAPAIRS__allexistcounter
);
 BEGIN APPENDlocfile(DECOMCAPAIRS__conditions,decomconditions);
APPENDlocfile(DECOMCAPAIRS__actions,decomactions);
END
END;

8: begin
  BEGIN TAKErightleft(rightleft,righttolefttable) END
;
 BEGIN 
MergeRecords:=Leftrecords;
APPENDSETS(OtherRecords,MergeRecords);
IF subrulenumber<>0 THEN {one subrule has been seen but it is
not the last one}
BEGIN
takepresent(compresent1,compresents);
IF compresent1.valeu THEN
BEGIN
BEGIN  END;
BEGIN 
LOCALTAB(comsubrulespar1,indent);
appendstring(' FUNCTION subrule',comsubrulespar1);
 
appendstring(mrucomDECL_convinttostring(sublevel),comsubrulespar1);
 appendstring('X',comsubrulespar1);
 appendstring(mrucomDECL_convinttostring(subrulenumber),comsubrulespar1);

appendstring(' :LISTREE_SetOfStrees;',comsubrulespar1);
 appendstring('\\',comsubrulespar1);
 
LOCALTAB(comsubrulespar1,indent);
appendstring(' VAR result:LISTREE_SetOfStrees;',comsubrulespar1);
 appendstring('\\',comsubrulespar1);
 
LOCALTAB(comsubrulespar1,indent);
appendstring(' match,first:BOOLEAN;',comsubrulespar1);
appendstring('\\',comsubrulespar1);

WHILE stillidents(leftlevelids) DO
BEGIN
takeident(id,leftlevelids);
appendstring('Linit',comsubrulespar1);
 appendstring(id.str,comsubrulespar1);
 appendstring(',Lrest',comsubrulespar1);
 appendstring(id.str,comsubrulespar1);

appendstring(',Lfirst',comsubrulespar1);
 appendstring(id.str,comsubrulespar1);
 appendstring(',Llast',comsubrulespar1);
 appendstring(id.str,comsubrulespar1);

appendstring(':LSSTREE_prelnode;',comsubrulespar1);
appendstring('\\',comsubrulespar1);

appendstring('i',comsubrulespar1);
 appendstring(id.str,comsubrulespar1);
 appendstring(':INTEGER;',comsubrulespar1);
appendstring('\\',comsubrulespar1);

appendstring('nomoretrees',comsubrulespar1);
 appendstring(id.str,comsubrulespar1);
 appendstring(',lastmatch',comsubrulespar1);

appendstring(id.str,comsubrulespar1);
 appendstring(':BOOLEAN;',comsubrulespar1);
appendstring('\\',comsubrulespar1);

END;
END; 
identtable:=otherrelvarlist;
While STILLidents(identtable) DO
Begin
TAKEident(id,identtable);
LOCALTAB(comsubrulespar1,indent);
BEGIN appendstring(' ',comsubrulespar1);
 appendstring(id.str,comsubrulespar1);
 appendstring(':LSDOMAINT_synrel;',comsubrulespar1);
appendstring('\\',comsubrulespar1);
 END
END;
identtable:=othernodevarlist;
While STILLidents(identtable) DO
Begin
TAKEident(id,identtable);
LOCALTAB(comsubrulespar1,indent);
BEGIN appendstring(' ',comsubrulespar1);
 appendstring(id.str,comsubrulespar1);
 appendstring(':LSDOMAINT_lsrecord;',comsubrulespar1);
appendstring('\\',comsubrulespar1);
 END
END;
identtable:=othertreevarlist;
While STILLidents(identtable) DO
Begin
TAKEident(id,identtable);
LOCALTAB(comsubrulespar1,indent);
BEGIN appendstring(' ',comsubrulespar1);
;appendstring(id.str,comsubrulespar1);
;appendstring(':LSSTREE_pStree;',comsubrulespar1);
appendstring('\\',comsubrulespar1);
 END
END;
identtable:=othermuvarlist;
While STILLidents(identtable) DO
Begin
TAKEident(id,identtable);
LOCALTAB(comsubrulespar1,indent);
BEGIN appendstring(' ',comsubrulespar1);
;appendstring(id.str,comsubrulespar1);
;appendstring(':LSMRUQUO_ListOfStrees;',comsubrulespar1);
appendstring('\\',comsubrulespar1);
 END
END;
identtable:=othersigmavarlist;
While STILLidents(identtable) DO
Begin
TAKEident(id,identtable);
LOCALTAB(comsubrulespar1,indent);
BEGIN appendstring(' ',comsubrulespar1);
;appendstring(id.str,comsubrulespar1);
;appendstring(':LSMRUQUO_ListOfStrees;',comsubrulespar1);
appendstring('\\',comsubrulespar1);
 END
END;
identtable:=otherrecords;
While STILLidents(identtable) DO
Begin
TAKEident(id,identtable);
IF TSTRING_length(id.str)<>0 THEN
BEGIN
selectCatName(id.str,CatName);
BEGIN
LOCALTAB(comsubrulespar1,indent);
appendstring(' ',comsubrulespar1);
;appendstring(id.str,comsubrulespar1);
;appendstring(':LSDOMAINT_',comsubrulespar1);
;
appendstring(TLDStrToStr_cattorectype(CatName),comsubrulespar1);
;
appendstring(';',comsubrulespar1);
appendstring('\\',comsubrulespar1);

END
END
END;
voidlabels:=SUBTRACTSETS(leftrhslabels,modellabels);
WHILE stillidents(voidlabels) DO
BEGIN
TAKEident(id,voidlabels);
LOCALTAB(comsubrulespar1,indent);
appendstring('FUNCTION MATCHCOND',comsubrulespar1);
 appendstring(id.str,comsubrulespar1);
 appendstring(':BOOLEAN;',comsubrulespar1);
appendstring('\\',comsubrulespar1);

LOCALTAB(comsubrulespar1,indent);
appendstring('BEGIN MATCHCOND',comsubrulespar1);
 appendstring(id.str,comsubrulespar1);
 appendstring(':=TRUE END;',comsubrulespar1);
appendstring('\\',comsubrulespar1);

END;
APPENDlocfile(commatchfilepar,comsubrulespar1);
APPENDlocfile(rightcompar,comsubrulespar1);
APPENDlocfile(leftcompar,comsubrulespar1);
IF NOT primitiverule THEN
APPENDlocfile(comsubrulespar,comsubrulespar1)
ELSE APPENDlocfile(comactions,comsubrulespar1);
BEGIN
LOCALTAB(comsubrulespar1,indent);
appendstring(' BEGIN{',comsubrulespar1);
 appendstring(mrucomDECL_convinttostring(sublevel),comsubrulespar1);
 appendstring(mrucomDECL_convinttostring(subrulenumber),comsubrulespar1);
 
appendstring('}',comsubrulespar1);
 appendstring('\\',comsubrulespar1);

LOCALTAB(comsubrulespar1,indent);
appendstring(' match:= TRUE;',comsubrulespar1);
appendstring('\\',comsubrulespar1);

LOCALTAB(comsubrulespar1,indent);
appendstring(' LISTREE_INITsetOFstrees(result);',comsubrulespar1);
 appendstring('\\',comsubrulespar1);
 END;
i:=0;
writewhile:=false;
numberofwhiles:=0;
leftrhslabels1:=leftrhslabels;
WHILE stillidents(leftrhslabels1) DO
BEGIN
i:=i+1;
TAKEident(id,leftrhslabels1);
insidewhile:=false;
alltable1:=alltable;
WHILE stillidents(alltable1) and not(insidewhile) DO
BEGIN
takeident(id1,alltable1);
insidewhile:=(TSTRING_compare(id.str,id1.str)=0);
writewhile:=writewhile OR insidewhile
END;
if insidewhile THEN numberofwhiles:=numberofwhiles+1;
IF TSTRING_comparechar(id.str,1,'T')=0 THEN
BEGIN
IF not insidewhile THEN
BEGIN
IF i<>1 THEN
BEGIN
LOCALTAB(comsubrulespar1,indent);
appendstring(' IF match THEN',comsubrulespar1);

END;
LOCALTAB(comsubrulespar1,indent);
appendstring(' matchtree',comsubrulespar1);
 appendstring(id.str,comsubrulespar1);
 appendstring('(match,TRUE);',comsubrulespar1);
appendstring('\\',comsubrulespar1);

LOCALTAB(comsubrulespar1,indent);
appendstring('If match Then',comsubrulespar1);
appendstring('\\',comsubrulespar1);

LOCALTAB(comsubrulespar1,indent);
appendstring('WHILE match AND NOT matchcond',comsubrulespar1);
 
appendstring(id.str,comsubrulespar1);
 appendstring(' DO',comsubrulespar1);
appendstring('\\',comsubrulespar1);

LOCALTAB(comsubrulespar1,indent);
appendstring('BEGIN',comsubrulespar1);
appendstring('\\',comsubrulespar1);

LOCALTAB(comsubrulespar1,indent);
appendstring('Matchtree',comsubrulespar1);
 appendstring(id.str,comsubrulespar1);
 appendstring('(match,FALSE);',comsubrulespar1);
appendstring('\\',comsubrulespar1);

LOCALTAB(comsubrulespar1,indent);
appendstring('END;',comsubrulespar1);
appendstring('\\',comsubrulespar1);

END;
END
ELSE
BEGIN
IF not insidewhile THEN
BEGIN
IF i<>1 THEN
BEGIN
LOCALTAB(comsubrulespar1,indent);
appendstring(' IF match THEN',comsubrulespar1);

END;
LOCALTAB(comsubrulespar1,indent);
appendstring(' matchlist',comsubrulespar1);
 appendstring(id.str,comsubrulespar1);
 appendstring('(',comsubrulespar1);

appendstring(id.str,comsubrulespar1);
 appendstring('.first,',comsubrulespar1);

appendstring(id.str,comsubrulespar1);
 appendstring('.last,match,TRUE);',comsubrulespar1);
appendstring('\\',comsubrulespar1);

END
END
END;
IF writewhile THEN
BEGIN
leftrhslabels1:=leftrhslabels;
WHILE stillidents(leftrhslabels1) DO
BEGIN
i:=i+1;
TAKEident(id,leftrhslabels1);
insidewhile:=false;
alltable1:=alltable;
WHILE stillidents(alltable1) and not(insidewhile) DO
BEGIN
takeident(id1,alltable1);
insidewhile:=(TSTRING_compare(id.str,id1.str)=0);
END;
IF TSTRING_comparechar(id.str,1,'T')=0 THEN
BEGIN
IF insidewhile THEN
BEGIN
LOCALTAB(comsubrulespar1,indent);
appendstring('IF match THEN BEGIN first:=TRUE;',comsubrulespar1);
appendstring('\\',comsubrulespar1);

LOCALTAB(comsubrulespar1,indent);
appendstring('WHILE match DO BEGIN',comsubrulespar1);
appendstring('\\',comsubrulespar1);

LOCALTAB(comsubrulespar1,indent);
appendstring(' matchtree',comsubrulespar1);
 appendstring(id.str,comsubrulespar1);
 appendstring('(match,first);',comsubrulespar1);
appendstring('\\',comsubrulespar1);

LOCALTAB(comsubrulespar1,indent);
appendstring('If match Then',comsubrulespar1);
appendstring('\\',comsubrulespar1);

LOCALTAB(comsubrulespar1,indent);
appendstring('WHILE match AND NOT matchcond',comsubrulespar1);
 
appendstring(id.str,comsubrulespar1);
 appendstring(' DO',comsubrulespar1);
appendstring('\\',comsubrulespar1);

LOCALTAB(comsubrulespar1,indent);
appendstring('BEGIN',comsubrulespar1);
appendstring('\\',comsubrulespar1);

LOCALTAB(comsubrulespar1,indent);
appendstring('Matchtree',comsubrulespar1);
 appendstring(id.str,comsubrulespar1);
 appendstring('(match,FALSE);',comsubrulespar1);
appendstring('\\',comsubrulespar1);

LOCALTAB(comsubrulespar1,indent);
appendstring('END;',comsubrulespar1);
appendstring('\\',comsubrulespar1);

END;
END
ELSE
BEGIN
IF insidewhile THEN
BEGIN
LOCALTAB(comsubrulespar1,indent);
appendstring('IF match THEN BEGIN first:=TRUE;',comsubrulespar1);
appendstring('\\',comsubrulespar1);

LOCALTAB(comsubrulespar1,indent);
appendstring('WHILE match DO BEGIN',comsubrulespar1);
appendstring('\\',comsubrulespar1);

LOCALTAB(comsubrulespar1,indent);
appendstring(' matchlist',comsubrulespar1);
 appendstring(id.str,comsubrulespar1);
 appendstring('(',comsubrulespar1);

appendstring(id.str,comsubrulespar1);
 appendstring('.first,',comsubrulespar1);

appendstring(id.str,comsubrulespar1);
 appendstring('.last,match,first);',comsubrulespar1);
appendstring('\\',comsubrulespar1);

END
END
END;
END;
IF primitiverule THEN 
APPENDlocfile(comconditions,comsubrulespar1);
IF NOT primitiverule THEN
BEGIN
i:=0;
LOCALTAB(comsubrulespar1,indent);
appendstring(' IF match THEN',comsubrulespar1);
appendstring('\\',comsubrulespar1);

LOCALTAB(comsubrulespar1,indent+4);
appendstring(' BEGIN',comsubrulespar1);
appendstring('\\',comsubrulespar1);

WHILE i<>numofsubrules DO
BEGIN
takepresent(compresent1,compresents1);
i:=i+1;
IF compresent1.valeu THEN
BEGIN
LOCALTAB(comsubrulespar1,indent+4);
appendstring(' LISTREE_mergesetsofstrees(subrule',comsubrulespar1);
 
appendstring(mrucomDECL_convinttostring((sublevel+1)),comsubrulespar1);
 appendstring('X',comsubrulespar1);
 appendstring(mrucomDECL_convinttostring(i),comsubrulespar1);

appendstring(',result);',comsubrulespar1);
appendstring('\\',comsubrulespar1);

END;
END;
LOCALTAB(comsubrulespar1,indent+4);
appendstring(' END;',comsubrulespar1);
appendstring('\\',comsubrulespar1);

END;
FOR i:=1 TO numberofwhiles DO
BEGIN
IF i=numberofwhiles THEN
BEGIN
LOCALTAB(comsubrulespar1,indent);
appendstring('first:=FALSE;',comsubrulespar1);
appendstring('\\',comsubrulespar1);

END;
LOCALTAB(comsubrulespar1,indent);
appendstring('END;{WHILE}',comsubrulespar1);
appendstring('\\',comsubrulespar1);

LOCALTAB(comsubrulespar1,indent);
appendstring('match:=TRUE;',comsubrulespar1);
appendstring('\\',comsubrulespar1);

LOCALTAB(comsubrulespar1,indent);
appendstring('END;{IF}',comsubrulespar1);
appendstring('\\',comsubrulespar1);

END;
BEGIN
LOCALTAB(comsubrulespar1,indent);
appendstring(' subrule',comsubrulespar1);
 appendstring(mrucomDECL_convinttostring(sublevel),comsubrulespar1);
 appendstring('X',comsubrulespar1);

appendstring(mrucomDECL_convinttostring(subrulenumber),comsubrulespar1);
 
appendstring(':=result',comsubrulespar1);
 appendstring('\\',comsubrulespar1);

LOCALTAB(comsubrulespar1,indent);
appendstring(' END;',comsubrulespar1);
 appendstring('\\',comsubrulespar1);
 END;
END;
takepresent(decompresent1,decompresents);
IF decompresent1.valeu THEN
BEGIN
BEGIN  END;
BEGIN 
LOCALTAB(decomsubrulespar1,indent);
appendstring(' FUNCTION subrule',decomsubrulespar1);
 
appendstring(mrucomDECL_convinttostring(sublevel),decomsubrulespar1);
 appendstring('X',decomsubrulespar1);
 appendstring(mrucomDECL_convinttostring(subrulenumber),decomsubrulespar1);

appendstring(' :LISTREE_SetOfTupleOfStrees;',decomsubrulespar1);
 appendstring('\\',decomsubrulespar1);
 
LOCALTAB(decomsubrulespar1,indent);
appendstring(' VAR result:LISTREE_SetOfTupleOfStrees;',decomsubrulespar1);
 appendstring('\\',decomsubrulespar1);
 END;
appendstring(' match,first:BOOLEAN;',decomsubrulespar1);
appendstring('\\',decomsubrulespar1);

WHILE stillidents(rightlevelids) DO
BEGIN
takeident(id,rightlevelids);
appendstring('Linit',decomsubrulespar1);
 appendstring(id.str,decomsubrulespar1);
 appendstring(',Lrest',decomsubrulespar1);
 appendstring(id.str,decomsubrulespar1);

appendstring(',Lfirst',decomsubrulespar1);
 appendstring(id.str,decomsubrulespar1);
 appendstring(',Llast',decomsubrulespar1);
 appendstring(id.str,decomsubrulespar1);

appendstring(':LSSTREE_prelnode;',decomsubrulespar1);
appendstring('\\',decomsubrulespar1);

appendstring('i',decomsubrulespar1);
 appendstring(id.str,decomsubrulespar1);
 appendstring(':INTEGER;',decomsubrulespar1);
appendstring('\\',decomsubrulespar1);

appendstring('nomoretrees',decomsubrulespar1);
 appendstring(id.str,decomsubrulespar1);
 appendstring(',lastmatch',decomsubrulespar1);

appendstring(id.str,decomsubrulespar1);
 appendstring(':BOOLEAN;',decomsubrulespar1);
appendstring('\\',decomsubrulespar1);

END;
identtable:=otherrelvarlist;
While STILLidents(identtable) DO
Begin
TAKEident(id,identtable);
LOCALTAB(decomsubrulespar1,indent);
BEGIN appendstring(' ',decomsubrulespar1);
 appendstring(id.str,decomsubrulespar1);
 appendstring(':LSDOMAINT_synrel;',decomsubrulespar1);
appendstring('\\',decomsubrulespar1);
 END
END;
identtable:=othernodevarlist;
While STILLidents(identtable) DO
Begin
TAKEident(id,identtable);
LOCALTAB(decomsubrulespar1,indent);
BEGIN appendstring(' ',decomsubrulespar1);
 appendstring(id.str,decomsubrulespar1);
 appendstring(':LSDOMAINT_lsrecord;',decomsubrulespar1);
appendstring('\\',decomsubrulespar1);
 END
END;
identtable:=othertreevarlist;
While STILLidents(identtable) DO
Begin
TAKEident(id,identtable);
LOCALTAB(decomsubrulespar1,indent);
BEGIN appendstring(' ',decomsubrulespar1);
;appendstring(id.str,decomsubrulespar1);
;appendstring(':LSSTREE_pStree;',decomsubrulespar1);
appendstring('\\',decomsubrulespar1);
 END
END;
identtable:=othermuvarlist;
While STILLidents(identtable) DO
Begin
TAKEident(id,identtable);
LOCALTAB(decomsubrulespar1,indent);
BEGIN appendstring(' ',decomsubrulespar1);
;appendstring(id.str,decomsubrulespar1);
;appendstring(':LSMRUQUO_ListOfStrees;',decomsubrulespar1);
appendstring('\\',decomsubrulespar1);
 END
END;
identtable:=othersigmavarlist;
While STILLidents(identtable) DO
Begin
TAKEident(id,identtable);
LOCALTAB(decomsubrulespar1,indent);
BEGIN appendstring(' ',decomsubrulespar1);
;appendstring(id.str,decomsubrulespar1);
;appendstring(':LSMRUQUO_ListOfStrees;',decomsubrulespar1);
appendstring('\\',decomsubrulespar1);
 END
END;
identtable:=otherrecords;
While STILLidents(identtable) DO
Begin
TAKEident(id,identtable);
IF TSTRING_length(id.str)<>0 THEN
BEGIN
selectCatName(id.str,CatName);
BEGIN
LOCALTAB(decomsubrulespar1,indent);
appendstring(' ',decomsubrulespar1);
;appendstring(id.str,decomsubrulespar1);
;appendstring(':LSDOMAINT_',decomsubrulespar1);
;
appendstring(TLDStrToStr_cattorectype(CatName),decomsubrulespar1);
;
appendstring(';',decomsubrulespar1);
appendstring('\\',decomsubrulespar1);

END
END
END;
voidlabels:=SUBTRACTSETS(rightrhslabels,modellabels);
WHILE stillidents(voidlabels) DO
BEGIN
TAKEident(id,voidlabels);
LOCALTAB(decomsubrulespar1,indent);
appendstring('FUNCTION MATCHCOND',decomsubrulespar1);
 appendstring(id.str,decomsubrulespar1);
 appendstring(':BOOLEAN;',decomsubrulespar1);
appendstring('\\',decomsubrulespar1);

LOCALTAB(decomsubrulespar1,indent);
appendstring('BEGIN MATCHCOND',decomsubrulespar1);
 appendstring(id.str,decomsubrulespar1);
 appendstring(':=TRUE END;',decomsubrulespar1);
appendstring('\\',decomsubrulespar1);

END;
APPENDlocfile(decommatchfilepar,decomsubrulespar1);
APPENDlocfile(rightdecompar,decomsubrulespar1);
APPENDlocfile(leftdecompar,decomsubrulespar1);
IF NOT primitiverule THEN
APPENDlocfile(decomsubrulespar,decomsubrulespar1)
ELSE APPENDlocfile(decomactions,decomsubrulespar1);
BEGIN
LOCALTAB(decomsubrulespar1,indent);
appendstring(' BEGIN',decomsubrulespar1);
 appendstring('\\',decomsubrulespar1);

LOCALTAB(decomsubrulespar1,indent);
appendstring('match:=TRUE;',decomsubrulespar1);
appendstring('\\',decomsubrulespar1);

LOCALTAB(decomsubrulespar1,indent);
appendstring(' LISTREE_INITsetOFtupleOFstrees(result);',decomsubrulespar1);
 appendstring('\\',decomsubrulespar1);
 END;
i:=0;
rightrhslabels1:=rightrhslabels;
numberofwhiles:=0;
writewhile:=FALSE;
WHILE stillidents(rightrhslabels1) DO
BEGIN
i:=i+1;
TAKEident(id,rightrhslabels1);
insidewhile:=false;
alltable1:=alltable;
WHILE stillidents(alltable1) and not(insidewhile) DO
BEGIN
takeident(id1,alltable1);
insidewhile:=(TSTRING_compare(id.str,id1.str)=0);
writewhile:=writewhile OR insidewhile
END;
IF insidewhile THEN numberofwhiles:=numberofwhiles+1;
IF TSTRING_comparechar(id.str,1,'T')=0 THEN
BEGIN
IF not insidewhile THEN
BEGIN
IF i<>1 THEN
BEGIN
LOCALTAB(decomsubrulespar1,indent);
appendstring(' IF match THEN',decomsubrulespar1);

END;
LOCALTAB(decomsubrulespar1,indent);
appendstring(' matchtree',decomsubrulespar1);
 appendstring(id.str,decomsubrulespar1);
 appendstring('(match,TRUE);',decomsubrulespar1);
appendstring('\\',decomsubrulespar1);

LOCALTAB(decomsubrulespar1,indent);
appendstring('If match Then',decomsubrulespar1);
appendstring('\\',decomsubrulespar1);

LOCALTAB(decomsubrulespar1,indent);
appendstring('WHILE match AND NOT matchcond',decomsubrulespar1);
 
appendstring(id.str,decomsubrulespar1);
 appendstring(' DO',decomsubrulespar1);
appendstring('\\',decomsubrulespar1);

LOCALTAB(decomsubrulespar1,indent);
appendstring('BEGIN',decomsubrulespar1);
appendstring('\\',decomsubrulespar1);

LOCALTAB(decomsubrulespar1,indent);
appendstring('Matchtree',decomsubrulespar1);
 appendstring(id.str,decomsubrulespar1);
 appendstring('(match,FALSE);',decomsubrulespar1);
appendstring('\\',decomsubrulespar1);

LOCALTAB(decomsubrulespar1,indent);
appendstring('END;',decomsubrulespar1);
appendstring('\\',decomsubrulespar1);

END;
END
ELSE
BEGIN
IF not insidewhile THEN
BEGIN
IF i<>1 THEN
BEGIN
LOCALTAB(decomsubrulespar1,indent);
appendstring(' IF match THEN',decomsubrulespar1);

END;
LOCALTAB(decomsubrulespar1,indent);
appendstring(' matchlist',decomsubrulespar1);
 appendstring(id.str,decomsubrulespar1);
 appendstring('(',decomsubrulespar1);

appendstring(id.str,decomsubrulespar1);
 appendstring('.first,',decomsubrulespar1);

appendstring(id.str,decomsubrulespar1);
 appendstring('.last,match,TRUE);',decomsubrulespar1);
appendstring('\\',decomsubrulespar1);

END
END
END;
IF writewhile THEN
BEGIN
rightrhslabels1:=rightrhslabels;
WHILE stillidents(rightrhslabels1) DO
BEGIN
i:=i+1;
TAKEident(id,rightrhslabels1);
alltable1:=alltable;
insidewhile:=false;
WHILE stillidents(alltable1) and not(insidewhile) DO
BEGIN
takeident(id1,alltable1);
insidewhile:=(TSTRING_compare(id.str,id1.str)=0);
END;
LOCALTAB(decomsubrulespar1,indent);
IF TSTRING_comparechar(id.str,1,'T')=0 THEN
BEGIN
IF insidewhile THEN
BEGIN
LOCALTAB(decomsubrulespar1,indent);
appendstring('IF match THEN BEGIN first:=TRUE;',decomsubrulespar1);
appendstring('\\',decomsubrulespar1);

LOCALTAB(decomsubrulespar1,indent);
appendstring('WHILE match DO BEGIN',decomsubrulespar1);
appendstring('\\',decomsubrulespar1);

LOCALTAB(decomsubrulespar1,indent);
appendstring(' matchtree',decomsubrulespar1);
 appendstring(id.str,decomsubrulespar1);
 appendstring('(match,first);',decomsubrulespar1);
appendstring('\\',decomsubrulespar1);

LOCALTAB(decomsubrulespar1,indent);
appendstring('If match Then',decomsubrulespar1);
appendstring('\\',decomsubrulespar1);

LOCALTAB(decomsubrulespar1,indent);
appendstring('WHILE match AND NOT matchcond',decomsubrulespar1);
 
appendstring(id.str,decomsubrulespar1);
 appendstring(' DO',decomsubrulespar1);
appendstring('\\',decomsubrulespar1);

LOCALTAB(decomsubrulespar1,indent);
appendstring('BEGIN',decomsubrulespar1);
appendstring('\\',decomsubrulespar1);

LOCALTAB(decomsubrulespar1,indent);
appendstring('Matchtree',decomsubrulespar1);
 appendstring(id.str,decomsubrulespar1);
 appendstring('(match,FALSE);',decomsubrulespar1);
appendstring('\\',decomsubrulespar1);

LOCALTAB(decomsubrulespar1,indent);
appendstring('END;',decomsubrulespar1);
appendstring('\\',decomsubrulespar1);

END;
END
ELSE
BEGIN
IF insidewhile THEN
BEGIN
LOCALTAB(decomsubrulespar1,indent);
appendstring('IF match THEN BEGIN first:=TRUE;',decomsubrulespar1);
appendstring('\\',decomsubrulespar1);

LOCALTAB(decomsubrulespar1,indent);
appendstring('WHILE match DO BEGIN',decomsubrulespar1);
appendstring('\\',decomsubrulespar1);

LOCALTAB(decomsubrulespar1,indent);
appendstring(' matchlist',decomsubrulespar1);
 appendstring(id.str,decomsubrulespar1);
 appendstring('(',decomsubrulespar1);

appendstring(id.str,decomsubrulespar1);
 appendstring('.first,',decomsubrulespar1);

appendstring(id.str,decomsubrulespar1);
 appendstring('.last,match,first);',decomsubrulespar1);
appendstring('\\',decomsubrulespar1);

END
END
END;
END;
IF primitiverule THEN 
APPENDlocfile(decomconditions,decomsubrulespar1);
IF NOT primitiverule THEN
BEGIN
i:=0;
LOCALTAB(decomsubrulespar1,indent);
appendstring(' IF match THEN',decomsubrulespar1);
appendstring('\\',decomsubrulespar1);

LOCALTAB(decomsubrulespar1,indent+4);
appendstring(' BEGIN',decomsubrulespar1);
appendstring('\\',decomsubrulespar1);

WHILE i<>numofsubrules DO
BEGIN
i:=i+1;
takepresent(decompresent1,decompresents1);
IF decompresent1.valeu THEN
BEGIN
LOCALTAB(decomsubrulespar1,indent+4);
appendstring(' LISTREE_mergesetsoftuplestrees(subrule',decomsubrulespar1);
 
appendstring(mrucomDECL_convinttostring((sublevel+1)),decomsubrulespar1);
 appendstring('X',decomsubrulespar1);
 appendstring(mrucomDECL_convinttostring(i),decomsubrulespar1);

appendstring(',result);',decomsubrulespar1);
appendstring('\\',decomsubrulespar1);

END;
END;
LOCALTAB(decomsubrulespar1,indent+4);
appendstring(' END;',decomsubrulespar1);
appendstring('\\',decomsubrulespar1);

END;
FOR i:=1 TO numberofwhiles DO
BEGIN
IF i=numberofwhiles THEN
BEGIN
LOCALTAB(comsubrulespar1,indent);
appendstring('first:=FALSE;',decomsubrulespar1);
appendstring('\\',decomsubrulespar1);

END;
LOCALTAB(comsubrulespar1,indent);
appendstring('END;{WHILE}',decomsubrulespar1);
appendstring('\\',decomsubrulespar1);

LOCALTAB(comsubrulespar1,indent);
appendstring('match:=TRUE;',decomsubrulespar1);
appendstring('\\',decomsubrulespar1);

LOCALTAB(comsubrulespar1,indent);
appendstring('END;{IF}',decomsubrulespar1);
appendstring('\\',decomsubrulespar1);

END;
BEGIN
LOCALTAB(decomsubrulespar1,indent);
appendstring(' subrule',decomsubrulespar1);
 appendstring(mrucomDECL_convinttostring(sublevel),decomsubrulespar1);
 appendstring('X',decomsubrulespar1);

appendstring(mrucomDECL_convinttostring(subrulenumber),decomsubrulespar1);
 
appendstring(':=result',decomsubrulespar1);
 appendstring('\\',decomsubrulespar1);

LOCALTAB(decomsubrulespar1,indent);
appendstring(' END;',decomsubrulespar1);
 appendstring('\\',decomsubrulespar1);
 END;
END;
END;
INITLOCALFILE(comsubrulespar);
INITLOCALFILE(decomsubrulespar);
INITLOCALFILE(leftcompar);INITLOCALFILE(leftdecompar);
INITLOCALFILE(rightcompar);INITLOCALFILE(rightdecompar);
INITLOCALFILE(commatchfilepar);INITLOCALFILE(decommatchfilepar);
INITLOCALFILE(comconditions); numofsubrules:=0;
INITLOCALFILE(decomconditions); primitiverule:=FALSE;
INITLOCALFILE(comactions);INITLOCALFILE(decomactions);
initsetofvartypes(vartypes);
initsetofidents(rightrhslabels);
initsetofidents(leftrhslabels);
initsetofidents(modellabels);
initsetofidents(alltable);
initsetofidents(otherrecords);
initsetofidents(leftrecords);
initsetofidents(rightrecords);
initsetofidents(leftmuvarlist);
initsetofidents(leftsigmavarlist);
initsetofidents(lefttreevarlist);
initsetofidents(leftnodevarlist);
initsetofidents(leftrelvarlist);
initsetofidents(rightmuvarlist);
initsetofidents(rightsigmavarlist);
initsetofidents(righttreevarlist);
initsetofidents(rightnodevarlist);
initsetofidents(rightrelvarlist);
initsetofidents(othermuvarlist);
initsetofidents(othersigmavarlist);
initsetofidents(othertreevarlist);
initsetofidents(othernodevarlist);
initsetofidents(otherrelvarlist);
subrulenumber:=subrulenumber+1
END
END;

END;

rsnode1:=rsnode1^.brother END;
BEGIN 
MergeRecords:=Leftrecords;
APPENDSETS(OtherRecords,MergeRecords);
IF subrulenumber<>0 THEN
BEGIN
takepresent(compresent1,compresents);
IF compresent1.valeu THEN
BEGIN
BEGIN  END;
BEGIN 
LOCALTAB(comsubrulespar1,indent);
appendstring(' FUNCTION subrule',comsubrulespar1);
 
appendstring(mrucomDECL_convinttostring(sublevel),comsubrulespar1);
 appendstring('X',comsubrulespar1);
 appendstring(mrucomDECL_convinttostring(subrulenumber),comsubrulespar1);

appendstring(' :LISTREE_SetOfStrees;',comsubrulespar1);
 appendstring('\\',comsubrulespar1);
 
LOCALTAB(comsubrulespar1,indent);
appendstring(' VAR result:LISTREE_SetOfStrees;',comsubrulespar1);
 appendstring('\\',comsubrulespar1);
 
LOCALTAB(comsubrulespar1,indent);
appendstring(' match,first:BOOLEAN;',comsubrulespar1);
appendstring('\\',comsubrulespar1);

WHILE stillidents(leftlevelids) DO
BEGIN
takeident(id,leftlevelids);
appendstring('Linit',comsubrulespar1);
 appendstring(id.str,comsubrulespar1);
 appendstring(',Lrest',comsubrulespar1);
 appendstring(id.str,comsubrulespar1);

appendstring(',Lfirst',comsubrulespar1);
 appendstring(id.str,comsubrulespar1);
 appendstring(',Llast',comsubrulespar1);
 appendstring(id.str,comsubrulespar1);

appendstring(':LSSTREE_prelnode;',comsubrulespar1);
appendstring('\\',comsubrulespar1);

appendstring('i',comsubrulespar1);
 appendstring(id.str,comsubrulespar1);
 appendstring(':INTEGER;',comsubrulespar1);
appendstring('\\',comsubrulespar1);

appendstring('nomoretrees',comsubrulespar1);
 appendstring(id.str,comsubrulespar1);
 appendstring(',lastmatch',comsubrulespar1);

appendstring(id.str,comsubrulespar1);
 appendstring(':BOOLEAN;',comsubrulespar1);
appendstring('\\',comsubrulespar1);

END;
END; 
identtable:=otherrelvarlist;
While STILLidents(identtable) DO
Begin
TAKEident(id,identtable);
LOCALTAB(comsubrulespar1,indent);
BEGIN appendstring(' ',comsubrulespar1);
 appendstring(id.str,comsubrulespar1);
 appendstring(':LSDOMAINT_synrel;',comsubrulespar1);
appendstring('\\',comsubrulespar1);
 END
END;
identtable:=othernodevarlist;
While STILLidents(identtable) DO
Begin
TAKEident(id,identtable);
LOCALTAB(comsubrulespar1,indent);
BEGIN appendstring(' ',comsubrulespar1);
 appendstring(id.str,comsubrulespar1);
 appendstring(':LSDOMAINT_lsrecord;',comsubrulespar1);
appendstring('\\',comsubrulespar1);
 END
END;
identtable:=othertreevarlist;
While STILLidents(identtable) DO
Begin
TAKEident(id,identtable);
LOCALTAB(comsubrulespar1,indent);
BEGIN appendstring(' ',comsubrulespar1);
;appendstring(id.str,comsubrulespar1);
;appendstring(':LSSTREE_pStree;',comsubrulespar1);
appendstring('\\',comsubrulespar1);
 END
END;
identtable:=othermuvarlist;
While STILLidents(identtable) DO
Begin
TAKEident(id,identtable);
LOCALTAB(comsubrulespar1,indent);
BEGIN appendstring(' ',comsubrulespar1);
;appendstring(id.str,comsubrulespar1);
;appendstring(':LSMRUQUO_ListOfStrees;',comsubrulespar1);
appendstring('\\',comsubrulespar1);
 END
END;
identtable:=othersigmavarlist;
While STILLidents(identtable) DO
Begin
TAKEident(id,identtable);
LOCALTAB(comsubrulespar1,indent);
BEGIN appendstring(' ',comsubrulespar1);
;appendstring(id.str,comsubrulespar1);
;appendstring(':LSMRUQUO_ListOfStrees;',comsubrulespar1);
appendstring('\\',comsubrulespar1);
 END
END;
identtable:=otherrecords;
While STILLidents(identtable) DO
Begin
TAKEident(id,identtable);
IF TSTRING_length(id.str)<>0 THEN
BEGIN
selectCatName(id.str,CatName);
BEGIN
LOCALTAB(comsubrulespar1,indent);
appendstring(' ',comsubrulespar1);
;appendstring(id.str,comsubrulespar1);
;appendstring(':LSDOMAINT_',comsubrulespar1);
;
appendstring(TLDStrToStr_cattorectype(CatName),comsubrulespar1);
;
appendstring(';',comsubrulespar1);
appendstring('\\',comsubrulespar1);

END
END
END;
voidlabels:=SUBTRACTSETS(leftrhslabels,modellabels);
WHILE stillidents(voidlabels) DO
BEGIN
TAKEident(id,voidlabels);
LOCALTAB(comsubrulespar1,indent);
appendstring('FUNCTION MATCHCOND',comsubrulespar1);
 appendstring(id.str,comsubrulespar1);
 appendstring(':BOOLEAN;',comsubrulespar1);
appendstring('\\',comsubrulespar1);

LOCALTAB(comsubrulespar1,indent);
appendstring('BEGIN MATCHCOND',comsubrulespar1);
 appendstring(id.str,comsubrulespar1);
 appendstring(':=TRUE END;',comsubrulespar1);
appendstring('\\',comsubrulespar1);

END;
APPENDlocfile(commatchfilepar,comsubrulespar1);
APPENDlocfile(rightcompar,comsubrulespar1);
APPENDlocfile(leftcompar,comsubrulespar1);
IF NOT primitiverule THEN
APPENDlocfile(comsubrulespar,comsubrulespar1)
ELSE APPENDlocfile(comactions,comsubrulespar1);
BEGIN
LOCALTAB(comsubrulespar1,indent);
appendstring(' BEGIN{',comsubrulespar1);
 appendstring(mrucomDECL_convinttostring(sublevel),comsubrulespar1);
 appendstring(mrucomDECL_convinttostring(subrulenumber),comsubrulespar1);
 
appendstring('}',comsubrulespar1);
 appendstring('\\',comsubrulespar1);

LOCALTAB(comsubrulespar1,indent);
appendstring(' match:= TRUE;',comsubrulespar1);
appendstring('\\',comsubrulespar1);

LOCALTAB(comsubrulespar1,indent);
appendstring(' LISTREE_INITsetOFstrees(result);',comsubrulespar1);
 appendstring('\\',comsubrulespar1);
 END;
i:=0;
writewhile:=false;
numberofwhiles:=0;
leftrhslabels1:=leftrhslabels;
WHILE stillidents(leftrhslabels1) DO
BEGIN
i:=i+1;
TAKEident(id,leftrhslabels1);
insidewhile:=false;
alltable1:=alltable;
WHILE stillidents(alltable1) and not(insidewhile) DO
BEGIN
takeident(id1,alltable1);
insidewhile:=(TSTRING_compare(id.str,id1.str)=0);
writewhile:=writewhile OR insidewhile
END;
if insidewhile THEN numberofwhiles:=numberofwhiles+1;
IF TSTRING_comparechar(id.str,1,'T')=0 THEN
BEGIN
IF not insidewhile THEN
BEGIN
IF i<>1 THEN
BEGIN
LOCALTAB(comsubrulespar1,indent);
appendstring(' IF match THEN',comsubrulespar1);

END;
LOCALTAB(comsubrulespar1,indent);
appendstring(' matchtree',comsubrulespar1);
 appendstring(id.str,comsubrulespar1);
 appendstring('(match,TRUE);',comsubrulespar1);
appendstring('\\',comsubrulespar1);

LOCALTAB(comsubrulespar1,indent);
appendstring('If match Then',comsubrulespar1);
appendstring('\\',comsubrulespar1);

LOCALTAB(comsubrulespar1,indent);
appendstring('WHILE match AND NOT matchcond',comsubrulespar1);
 
appendstring(id.str,comsubrulespar1);
 appendstring(' DO',comsubrulespar1);
appendstring('\\',comsubrulespar1);

LOCALTAB(comsubrulespar1,indent);
appendstring('BEGIN',comsubrulespar1);
appendstring('\\',comsubrulespar1);

LOCALTAB(comsubrulespar1,indent);
appendstring('Matchtree',comsubrulespar1);
 appendstring(id.str,comsubrulespar1);
 appendstring('(match,FALSE);',comsubrulespar1);
appendstring('\\',comsubrulespar1);

LOCALTAB(comsubrulespar1,indent);
appendstring('END;',comsubrulespar1);
appendstring('\\',comsubrulespar1);

END;
END
ELSE
BEGIN
IF not insidewhile THEN
BEGIN
IF i<>1 THEN
BEGIN
LOCALTAB(comsubrulespar1,indent);
appendstring(' IF match THEN',comsubrulespar1);

END;
LOCALTAB(comsubrulespar1,indent);
appendstring(' matchlist',comsubrulespar1);
 appendstring(id.str,comsubrulespar1);
 appendstring('(',comsubrulespar1);

appendstring(id.str,comsubrulespar1);
 appendstring('.first,',comsubrulespar1);

appendstring(id.str,comsubrulespar1);
 appendstring('.last,match,TRUE);',comsubrulespar1);
appendstring('\\',comsubrulespar1);

END
END
END;
IF writewhile THEN
BEGIN
leftrhslabels1:=leftrhslabels;
WHILE stillidents(leftrhslabels1) DO
BEGIN
i:=i+1;
TAKEident(id,leftrhslabels1);
insidewhile:=false;
alltable1:=alltable;
WHILE stillidents(alltable1) and not(insidewhile) DO
BEGIN
takeident(id1,alltable1);
insidewhile:=(TSTRING_compare(id.str,id1.str)=0);
END;
IF TSTRING_comparechar(id.str,1,'T')=0 THEN
BEGIN
IF insidewhile THEN
BEGIN
LOCALTAB(comsubrulespar1,indent);
appendstring('IF match THEN BEGIN first:=TRUE;',comsubrulespar1);
appendstring('\\',comsubrulespar1);

LOCALTAB(comsubrulespar1,indent);
appendstring('WHILE match DO BEGIN',comsubrulespar1);
appendstring('\\',comsubrulespar1);

LOCALTAB(comsubrulespar1,indent);
appendstring(' matchtree',comsubrulespar1);
 appendstring(id.str,comsubrulespar1);
 appendstring('(match,first);',comsubrulespar1);
appendstring('\\',comsubrulespar1);

LOCALTAB(comsubrulespar1,indent);
appendstring('If match Then',comsubrulespar1);
appendstring('\\',comsubrulespar1);

LOCALTAB(comsubrulespar1,indent);
appendstring('WHILE match AND NOT matchcond',comsubrulespar1);
 
appendstring(id.str,comsubrulespar1);
 appendstring(' DO',comsubrulespar1);
appendstring('\\',comsubrulespar1);

LOCALTAB(comsubrulespar1,indent);
appendstring('BEGIN',comsubrulespar1);
appendstring('\\',comsubrulespar1);

LOCALTAB(comsubrulespar1,indent);
appendstring('Matchtree',comsubrulespar1);
 appendstring(id.str,comsubrulespar1);
 appendstring('(match,FALSE);',comsubrulespar1);
appendstring('\\',comsubrulespar1);

LOCALTAB(comsubrulespar1,indent);
appendstring('END;',comsubrulespar1);
appendstring('\\',comsubrulespar1);

END;
END
ELSE
BEGIN
IF insidewhile THEN
BEGIN
LOCALTAB(comsubrulespar1,indent);
appendstring('IF match THEN BEGIN first:=TRUE;',comsubrulespar1);
appendstring('\\',comsubrulespar1);

LOCALTAB(comsubrulespar1,indent);
appendstring('WHILE match DO BEGIN',comsubrulespar1);
appendstring('\\',comsubrulespar1);

LOCALTAB(comsubrulespar1,indent);
appendstring(' matchlist',comsubrulespar1);
 appendstring(id.str,comsubrulespar1);
 appendstring('(',comsubrulespar1);

appendstring(id.str,comsubrulespar1);
 appendstring('.first,',comsubrulespar1);

appendstring(id.str,comsubrulespar1);
 appendstring('.last,match,first);',comsubrulespar1);
appendstring('\\',comsubrulespar1);

END
END
END;
END;
IF primitiverule THEN 
APPENDlocfile(comconditions,comsubrulespar1);
IF NOT primitiverule THEN
BEGIN
i:=0;
LOCALTAB(comsubrulespar1,indent);
appendstring(' IF match THEN',comsubrulespar1);
appendstring('\\',comsubrulespar1);

LOCALTAB(comsubrulespar1,indent+4);
appendstring(' BEGIN',comsubrulespar1);
appendstring('\\',comsubrulespar1);

WHILE i<>numofsubrules DO
BEGIN
takepresent(compresent1,compresents1);
i:=i+1;
IF compresent1.valeu THEN
BEGIN
LOCALTAB(comsubrulespar1,indent+4);
appendstring(' LISTREE_mergesetsofstrees(subrule',comsubrulespar1);
 
appendstring(mrucomDECL_convinttostring((sublevel+1)),comsubrulespar1);
 appendstring('X',comsubrulespar1);
 appendstring(mrucomDECL_convinttostring(i),comsubrulespar1);

appendstring(',result);',comsubrulespar1);
appendstring('\\',comsubrulespar1);

END;
END;
LOCALTAB(comsubrulespar1,indent+4);
appendstring(' END;',comsubrulespar1);
appendstring('\\',comsubrulespar1);

END;
FOR i:=1 TO numberofwhiles DO
BEGIN
IF i=numberofwhiles THEN
BEGIN
LOCALTAB(comsubrulespar1,indent);
appendstring('first:=FALSE;',comsubrulespar1);
appendstring('\\',comsubrulespar1);

END;
LOCALTAB(comsubrulespar1,indent);
appendstring('END;{WHILE}',comsubrulespar1);
appendstring('\\',comsubrulespar1);

LOCALTAB(comsubrulespar1,indent);
appendstring('match:=TRUE;',comsubrulespar1);
appendstring('\\',comsubrulespar1);

LOCALTAB(comsubrulespar1,indent);
appendstring('END;{IF}',comsubrulespar1);
appendstring('\\',comsubrulespar1);

END;
BEGIN
LOCALTAB(comsubrulespar1,indent);
appendstring(' subrule',comsubrulespar1);
 appendstring(mrucomDECL_convinttostring(sublevel),comsubrulespar1);
 appendstring('X',comsubrulespar1);

appendstring(mrucomDECL_convinttostring(subrulenumber),comsubrulespar1);
 
appendstring(':=result',comsubrulespar1);
 appendstring('\\',comsubrulespar1);

LOCALTAB(comsubrulespar1,indent);
appendstring(' END;',comsubrulespar1);
 appendstring('\\',comsubrulespar1);
 END;
END;
takepresent(decompresent1,decompresents);
IF decompresent1.valeu THEN
BEGIN 
BEGIN  END;
BEGIN 
LOCALTAB(decomsubrulespar1,indent);
appendstring(' FUNCTION subrule',decomsubrulespar1);
 
appendstring(mrucomDECL_convinttostring(sublevel),decomsubrulespar1);
 appendstring('X',decomsubrulespar1);
 appendstring(mrucomDECL_convinttostring(subrulenumber),decomsubrulespar1);

appendstring(' :LISTREE_SetOfTupleOfStrees;',decomsubrulespar1);
 appendstring('\\',decomsubrulespar1);
 
LOCALTAB(decomsubrulespar1,indent);
appendstring(' VAR result:LISTREE_SetOfTupleOfStrees;',decomsubrulespar1);
 appendstring('\\',decomsubrulespar1);
 END;
appendstring(' match,first:BOOLEAN;',decomsubrulespar1);
appendstring('\\',decomsubrulespar1);

WHILE stillidents(rightlevelids) DO
BEGIN
takeident(id,rightlevelids);
appendstring('Linit',decomsubrulespar1);
 appendstring(id.str,decomsubrulespar1);
 appendstring(',Lrest',decomsubrulespar1);
 appendstring(id.str,decomsubrulespar1);

appendstring(',Lfirst',decomsubrulespar1);
 appendstring(id.str,decomsubrulespar1);
 appendstring(',Llast',decomsubrulespar1);
 appendstring(id.str,decomsubrulespar1);

appendstring(':LSSTREE_prelnode;',decomsubrulespar1);
appendstring('\\',decomsubrulespar1);

appendstring('i',decomsubrulespar1);
 appendstring(id.str,decomsubrulespar1);
 appendstring(':INTEGER;',decomsubrulespar1);
appendstring('\\',decomsubrulespar1);

appendstring('nomoretrees',decomsubrulespar1);
 appendstring(id.str,decomsubrulespar1);
 appendstring(',lastmatch',decomsubrulespar1);

appendstring(id.str,decomsubrulespar1);
 appendstring(':BOOLEAN;',decomsubrulespar1);
appendstring('\\',decomsubrulespar1);

END;
identtable:=otherrelvarlist;
While STILLidents(identtable) DO
Begin
TAKEident(id,identtable);
LOCALTAB(decomsubrulespar1,indent);
BEGIN appendstring(' ',decomsubrulespar1);
 appendstring(id.str,decomsubrulespar1);
 appendstring(':LSDOMAINT_synrel;',decomsubrulespar1);
appendstring('\\',decomsubrulespar1);
 END
END;
identtable:=othernodevarlist;
While STILLidents(identtable) DO
Begin
TAKEident(id,identtable);
LOCALTAB(decomsubrulespar1,indent);
BEGIN appendstring(' ',decomsubrulespar1);
 appendstring(id.str,decomsubrulespar1);
 appendstring(':LSDOMAINT_lsrecord;',decomsubrulespar1);
appendstring('\\',decomsubrulespar1);
 END
END;
identtable:=othertreevarlist;
While STILLidents(identtable) DO
Begin
TAKEident(id,identtable);
LOCALTAB(decomsubrulespar1,indent);
BEGIN appendstring(' ',decomsubrulespar1);
;appendstring(id.str,decomsubrulespar1);
;appendstring(':LSSTREE_pStree;',decomsubrulespar1);
appendstring('\\',decomsubrulespar1);
 END
END;
identtable:=othermuvarlist;
While STILLidents(identtable) DO
Begin
TAKEident(id,identtable);
LOCALTAB(decomsubrulespar1,indent);
BEGIN appendstring(' ',decomsubrulespar1);
;appendstring(id.str,decomsubrulespar1);
;appendstring(':LSMRUQUO_ListOfStrees;',decomsubrulespar1);
appendstring('\\',decomsubrulespar1);
 END
END;
identtable:=othersigmavarlist;
While STILLidents(identtable) DO
Begin
TAKEident(id,identtable);
LOCALTAB(decomsubrulespar1,indent);
BEGIN appendstring(' ',decomsubrulespar1);
;appendstring(id.str,decomsubrulespar1);
;appendstring(':LSMRUQUO_ListOfStrees;',decomsubrulespar1);
appendstring('\\',decomsubrulespar1);
 END
END;
identtable:=otherrecords;
While STILLidents(identtable) DO
Begin
TAKEident(id,identtable);
IF TSTRING_length(id.str)<>0 THEN
BEGIN
selectCatName(id.str,CatName);
BEGIN
LOCALTAB(decomsubrulespar1,indent);
appendstring(' ',decomsubrulespar1);
;appendstring(id.str,decomsubrulespar1);
;appendstring(':LSDOMAINT_',decomsubrulespar1);
;
appendstring(TLDStrToStr_cattorectype(CatName),decomsubrulespar1);
;
appendstring(';',decomsubrulespar1);
appendstring('\\',decomsubrulespar1);

END
END
END;
voidlabels:=SUBTRACTSETS(rightrhslabels,modellabels);
WHILE stillidents(voidlabels) DO
BEGIN
TAKEident(id,voidlabels);
LOCALTAB(decomsubrulespar1,indent);
appendstring('FUNCTION MATCHCOND',decomsubrulespar1);
 appendstring(id.str,decomsubrulespar1);
 appendstring(':BOOLEAN;',decomsubrulespar1);
appendstring('\\',decomsubrulespar1);

LOCALTAB(decomsubrulespar1,indent);
appendstring('BEGIN MATCHCOND',decomsubrulespar1);
 appendstring(id.str,decomsubrulespar1);
 appendstring(':=TRUE END;',decomsubrulespar1);
appendstring('\\',decomsubrulespar1);

END;
APPENDlocfile(decommatchfilepar,decomsubrulespar1);
APPENDlocfile(rightdecompar,decomsubrulespar1);
APPENDlocfile(leftdecompar,decomsubrulespar1);
IF NOT primitiverule THEN
APPENDlocfile(decomsubrulespar,decomsubrulespar1)
ELSE APPENDlocfile(decomactions,decomsubrulespar1);
BEGIN
LOCALTAB(decomsubrulespar1,indent);
appendstring(' BEGIN',decomsubrulespar1);
 appendstring('\\',decomsubrulespar1);

LOCALTAB(decomsubrulespar1,indent);
appendstring('match:=TRUE;',decomsubrulespar1);
appendstring('\\',decomsubrulespar1);

LOCALTAB(decomsubrulespar1,indent);
appendstring(' LISTREE_INITsetOFtupleOFstrees(result);',decomsubrulespar1);
 appendstring('\\',decomsubrulespar1);
 END;
i:=0;
rightrhslabels1:=rightrhslabels;
numberofwhiles:=0;
writewhile:=FALSE;
WHILE stillidents(rightrhslabels1) DO
BEGIN
i:=i+1;
TAKEident(id,rightrhslabels1);
insidewhile:=false;
alltable1:=alltable;
WHILE stillidents(alltable1) and not(insidewhile) DO
BEGIN
takeident(id1,alltable1);
insidewhile:=(TSTRING_compare(id.str,id1.str)=0);
writewhile:=writewhile OR insidewhile
END;
IF insidewhile THEN numberofwhiles:=numberofwhiles+1;
IF TSTRING_comparechar(id.str,1,'T')=0 THEN
BEGIN
IF not insidewhile THEN
BEGIN
IF i<>1 THEN
BEGIN
LOCALTAB(decomsubrulespar1,indent);
appendstring(' IF match THEN',decomsubrulespar1);

END;
LOCALTAB(decomsubrulespar1,indent);
appendstring(' matchtree',decomsubrulespar1);
 appendstring(id.str,decomsubrulespar1);
 appendstring('(match,TRUE);',decomsubrulespar1);
appendstring('\\',decomsubrulespar1);

LOCALTAB(decomsubrulespar1,indent);
appendstring('If match Then',decomsubrulespar1);
appendstring('\\',decomsubrulespar1);

LOCALTAB(decomsubrulespar1,indent);
appendstring('WHILE match AND NOT matchcond',decomsubrulespar1);
 
appendstring(id.str,decomsubrulespar1);
 appendstring(' DO',decomsubrulespar1);
appendstring('\\',decomsubrulespar1);

LOCALTAB(decomsubrulespar1,indent);
appendstring('BEGIN',decomsubrulespar1);
appendstring('\\',decomsubrulespar1);

LOCALTAB(decomsubrulespar1,indent);
appendstring('Matchtree',decomsubrulespar1);
 appendstring(id.str,decomsubrulespar1);
 appendstring('(match,FALSE);',decomsubrulespar1);
appendstring('\\',decomsubrulespar1);

LOCALTAB(decomsubrulespar1,indent);
appendstring('END;',decomsubrulespar1);
appendstring('\\',decomsubrulespar1);

END;
END
ELSE
BEGIN
IF not insidewhile THEN
BEGIN
IF i<>1 THEN
BEGIN
LOCALTAB(decomsubrulespar1,indent);
appendstring(' IF match THEN',decomsubrulespar1);

END;
LOCALTAB(decomsubrulespar1,indent);
appendstring(' matchlist',decomsubrulespar1);
 appendstring(id.str,decomsubrulespar1);
 appendstring('(',decomsubrulespar1);

appendstring(id.str,decomsubrulespar1);
 appendstring('.first,',decomsubrulespar1);

appendstring(id.str,decomsubrulespar1);
 appendstring('.last,match,TRUE);',decomsubrulespar1);
appendstring('\\',decomsubrulespar1);

END
END
END;
IF writewhile THEN
BEGIN
rightrhslabels1:=rightrhslabels;
WHILE stillidents(rightrhslabels1) DO
BEGIN
i:=i+1;
TAKEident(id,rightrhslabels1);
alltable1:=alltable;
insidewhile:=false;
WHILE stillidents(alltable1) and not(insidewhile) DO
BEGIN
takeident(id1,alltable1);
insidewhile:=(TSTRING_compare(id.str,id1.str)=0);
END;
LOCALTAB(decomsubrulespar1,indent);
IF TSTRING_comparechar(id.str,1,'T')=0 THEN
BEGIN
IF insidewhile THEN
BEGIN
LOCALTAB(decomsubrulespar1,indent);
appendstring('IF match THEN BEGIN first:=TRUE;',decomsubrulespar1);
appendstring('\\',decomsubrulespar1);

LOCALTAB(decomsubrulespar1,indent);
appendstring('WHILE match DO BEGIN',decomsubrulespar1);
appendstring('\\',decomsubrulespar1);

LOCALTAB(decomsubrulespar1,indent);
appendstring(' matchtree',decomsubrulespar1);
 appendstring(id.str,decomsubrulespar1);
 appendstring('(match,first);',decomsubrulespar1);
appendstring('\\',decomsubrulespar1);

LOCALTAB(decomsubrulespar1,indent);
appendstring('If match Then',decomsubrulespar1);
appendstring('\\',decomsubrulespar1);

LOCALTAB(decomsubrulespar1,indent);
appendstring('WHILE match AND NOT matchcond',decomsubrulespar1);
 
appendstring(id.str,decomsubrulespar1);
 appendstring(' DO',decomsubrulespar1);
appendstring('\\',decomsubrulespar1);

LOCALTAB(decomsubrulespar1,indent);
appendstring('BEGIN',decomsubrulespar1);
appendstring('\\',decomsubrulespar1);

LOCALTAB(decomsubrulespar1,indent);
appendstring('Matchtree',decomsubrulespar1);
 appendstring(id.str,decomsubrulespar1);
 appendstring('(match,FALSE);',decomsubrulespar1);
appendstring('\\',decomsubrulespar1);

LOCALTAB(decomsubrulespar1,indent);
appendstring('END;',decomsubrulespar1);
appendstring('\\',decomsubrulespar1);

END;
END
ELSE
BEGIN
IF insidewhile THEN
BEGIN
LOCALTAB(decomsubrulespar1,indent);
appendstring('IF match THEN BEGIN first:=TRUE;',decomsubrulespar1);
appendstring('\\',decomsubrulespar1);

LOCALTAB(decomsubrulespar1,indent);
appendstring('WHILE match DO BEGIN',decomsubrulespar1);
appendstring('\\',decomsubrulespar1);

LOCALTAB(decomsubrulespar1,indent);
appendstring(' matchlist',decomsubrulespar1);
 appendstring(id.str,decomsubrulespar1);
 appendstring('(',decomsubrulespar1);

appendstring(id.str,decomsubrulespar1);
 appendstring('.first,',decomsubrulespar1);

appendstring(id.str,decomsubrulespar1);
 appendstring('.last,match,first);',decomsubrulespar1);
appendstring('\\',decomsubrulespar1);

END
END
END;
END;
IF primitiverule THEN 
APPENDlocfile(decomconditions,decomsubrulespar1);
IF NOT primitiverule THEN
BEGIN
i:=0;
LOCALTAB(decomsubrulespar1,indent);
appendstring(' IF match THEN',decomsubrulespar1);
appendstring('\\',decomsubrulespar1);

LOCALTAB(decomsubrulespar1,indent+4);
appendstring(' BEGIN',decomsubrulespar1);
appendstring('\\',decomsubrulespar1);

WHILE i<>numofsubrules DO
BEGIN
i:=i+1;
takepresent(decompresent1,decompresents1);
IF decompresent1.valeu THEN
BEGIN
LOCALTAB(decomsubrulespar1,indent+4);
appendstring(' LISTREE_mergesetsoftuplestrees(subrule',decomsubrulespar1);
 
appendstring(mrucomDECL_convinttostring((sublevel+1)),decomsubrulespar1);
 appendstring('X',decomsubrulespar1);
 appendstring(mrucomDECL_convinttostring(i),decomsubrulespar1);

appendstring(',result);',decomsubrulespar1);
appendstring('\\',decomsubrulespar1);

END;
END;
LOCALTAB(decomsubrulespar1,indent+4);
appendstring(' END;',decomsubrulespar1);
appendstring('\\',decomsubrulespar1);

END;
FOR i:=1 TO numberofwhiles DO
BEGIN
IF i=numberofwhiles THEN
BEGIN
LOCALTAB(comsubrulespar1,indent);
appendstring('first:=FALSE;',decomsubrulespar1);
appendstring('\\',decomsubrulespar1);

END;
LOCALTAB(comsubrulespar1,indent);
appendstring('END;{WHILE}',decomsubrulespar1);
appendstring('\\',decomsubrulespar1);

LOCALTAB(comsubrulespar1,indent);
appendstring('match:=TRUE;',decomsubrulespar1);
appendstring('\\',decomsubrulespar1);

LOCALTAB(comsubrulespar1,indent);
appendstring('END;{IF}',decomsubrulespar1);
appendstring('\\',decomsubrulespar1);

END;
BEGIN
LOCALTAB(decomsubrulespar1,indent);
appendstring(' subrule',decomsubrulespar1);
 appendstring(mrucomDECL_convinttostring(sublevel),decomsubrulespar1);
 appendstring('X',decomsubrulespar1);

appendstring(mrucomDECL_convinttostring(subrulenumber),decomsubrulespar1);
 
appendstring(':=result',decomsubrulespar1);
 appendstring('\\',decomsubrulespar1);

LOCALTAB(decomsubrulespar1,indent);
appendstring(' END;',decomsubrulespar1);
 appendstring('\\',decomsubrulespar1);
 END;
END;
END;
SUBRULES_dtreeproc:=dtreeproc;
INITLOCALFILE(SUBRULES_comsubrules);
INITLOCALFILE(SUBRULES_decomsubrules);
APPENDlocfile(comsubrulespar1,SUBRULES_comsubrules);
APPENDlocfile(decomsubrulespar1,SUBRULES_decomsubrules);
END
END;
PROCEDURE mrucomCODE_SUBFILTERSproc(top:mrucomDECL_psnode
;SUBFILTERS_indent              :mrucomlangspec_int
;SUBFILTERS_prevrightrhslabels              :mrucomlangspec_setofidents
;SUBFILTERS_vartypes              :mrucomlangspec_setofvartypes
;var SUBFILTERS_comsubrules              :LOCALFILE
;var SUBFILTERS_decomsubrules              :LOCALFILE
);
VAR currenttree:mrucomDECL_psnode;
    rsnode1:mrucomDECL_prsnode;
 primitiverule: mrucomLANGSPEC_bool;
identtable: mrucomLANGSPEC_setofidents;
compresent,decompresent: mrucomLANGSPEC_bool;
numofsubfilters,subfilternumber: mrucomLANGSPEC_int;
rightleft: mrucomLANGSPEC_rightleft;
rightlevelids,rightlevelids1: mrucomLANGSPEC_setofidents;
righttolefttable: mrucomLANGSPEC_setofrightlefts;
i,sublevel,indent: mrucomLANGSPEC_int;
id: mrucomLANGSPEC_ident;catname:TSTRING_string;
rightrhslabels,rhslabels,voidlabels,modellabels: mrucomLANGSPEC_setofidents;
prevrightrhslabels: mrucomLANGSPEC_setofidents;
rightcompar,rightdecompar:LOCALFILE;
comactions,decomactions,commatchfilepar,decommatchfilepar,
comconditions,decomconditions,comsubrulespar1,decomsubrulespar1,comsubrulespar,
decomsubrulespar:LOCALFILE;
rightrecords,rightmuvarlist,rightsigmavarlist,righttreevarlist,
rightnodevarlist,rightrelvarlist: mrucomLANGSPEC_setofidents;
otherrecords,othermuvarlist,othersigmavarlist,othertreevarlist,
othernodevarlist,otherrelvarlist: mrucomLANGSPEC_setofidents;
vartype: mrucomLANGSPEC_vartype;
vartypes,vartypes1,vartypes2: mrucomLANGSPEC_setofvartypes;
 PROCEDURE APPENDSETS(S1: mrucomLANGSPEC_SETOFidents;VAR S2: mrucomLANGSPEC_SETOFidents);
VAR ident1: mrucomLANGSPEC_ident;
BEGIN
WHILE STILLidents(S1) DO
BEGIN
TAKEident(ident1,S1);
APPENDident(ident1,S2)
END
END;
FUNCTION present(ident: mrucomLANGSPEC_ident;S1: mrucomLANGSPEC_setofidents):BOOLEAN;
VAR ident1: mrucomLANGSPEC_ident;
result:boolean;
begin
result:=false;
while stillidents(S1) and not(result) do
begin
takeident(ident1,S1);
result := (ident1.str=ident.str)
end;
present:=result
end;
PROCEDURE MERGESETS(S1: mrucomLANGSPEC_SETOFidents;VAR S2: mrucomLANGSPEC_SETOFidents);
VAR ident1: mrucomLANGSPEC_ident;
BEGIN
WHILE STILLidents(S1) DO
BEGIN
TAKEident(ident1,S1);
IF not(present(ident1,S2)) THEN APPENDident(ident1,S2)
END
END;
FUNCTION SUBTRACTSETS(S1: mrucomLANGSPEC_SETOFidents;S2: mrucomLANGSPEC_SETOFidents): mrucomLANGSPEC_setofidents;
VAR ident1: mrucomLANGSPEC_ident;
result: mrucomLANGSPEC_setofidents;
BEGIN
initsetofidents(result);
WHILE STILLidents(S1) DO
BEGIN
TAKEident(ident1,S1);
IF not(present(ident1,S2)) THEN APPENDident(ident1,result)
END;
subtractsets:=result
{result contains those elements of S1 that do not belong to S2}
END;
PROCEDURE SelectCatName(recordname:TSTRING_string;
VAR catname:TSTRING_string);
VAR length:integer;
BEGIN
length:=TSTRING_Length(recordname);
IF recordname[length]='_' THEN length:=length-1;
IF recordname[length] IN ['0','1','2','3','4','5','6','7','8','9'] THEN
TSTRING_ExtractBegin(catname,recordname,length-4)
ELSE
TSTRING_ExtractBegin(catname,recordname,length-6);
END;
BEGIN
 BEGIN subfilternumber:=0;
primitiverule:=true;
indent:=SUBFILTERS_indent;
initsetofidents(rightrhslabels);
initsetofidents(modellabels);
initsetofidents(otherrecords);
initsetofidents(rightrecords);
initsetofidents(rightmuvarlist);
initsetofidents(rightsigmavarlist);
initsetofidents(righttreevarlist);
initsetofidents(rightnodevarlist);
initsetofidents(rightrelvarlist);
initsetofidents(othermuvarlist);
initsetofidents(othersigmavarlist);
initsetofidents(othertreevarlist);
initsetofidents(othernodevarlist);
initsetofidents(otherrelvarlist);
INITLOCALFILE(comactions);
INITLOCALFILE(decomactions);
INITLOCALFILE(comsubrulespar);
INITLOCALFILE(decomsubrulespar);
INITLOCALFILE(rightcompar);INITLOCALFILE(rightdecompar);
INITLOCALFILE(commatchfilepar);INITLOCALFILE(decommatchfilepar);
INITLOCALFILE(comconditions);
INITLOCALFILE(decomconditions);
INITLOCALFILE(comsubrulespar1);
INITLOCALFILE(decomsubrulespar1);
righttolefttable:=top^.ldfield.SUBFILTERSfield^.righttolefttable;
indent:=SUBFILTERS_indent;
sublevel:=indent DIV 2;
prevrightrhslabels:=SUBFILTERS_prevrightrhslabels;
vartypes1:=SUBFILTERS_vartypes;
initsetofvartypes(vartypes);
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
  BEGIN RIGHTSUBMODELS__righttolefttabl:= rightleft.table;
RIGHTSUBMODELS__indent:=indent+2;
rightrhslabels:=currenttree^.ldfield.RIGHTSUBMODELSfield^.rhslabels;
RIGHTSUBMODELS__prevrhslabels:=prevrightrhslabels;
INITsetofidents(RIGHTSUBMODELS__leftmuvarlist);
INITsetofidents(RIGHTSUBMODELS__leftsigmavarl);
INITsetofidents(RIGHTSUBMODELS__lefttreevarl);
TSTRING_constantempty(RIGHTSUBMODELS__name);
END
; mrucomCODE_RIGHTSUBMODELSproc(currenttree
,RIGHTSUBMODELS__righttolefttabl
,RIGHTSUBMODELS__name
,RIGHTSUBMODELS__indent
,RIGHTSUBMODELS__prevrhslabels
,RIGHTSUBMODELS__leftmuvarlist
,RIGHTSUBMODELS__leftsigmavarl
,RIGHTSUBMODELS__lefttreevarl
,RIGHTSUBMODELS__rightcom
,RIGHTSUBMODELS__rightdecom
,RIGHTSUBMODELS__dtreeproc
,RIGHTSUBMODELS__levelids
);
 BEGIN APPENDlocfile(RIGHTSUBMODELS__rightdecom,rightdecompar);
savelocfile(rightdecompar,rightcompar);
APPENDSETS(currenttree^.ldfield.RIGHTSUBMODELSfield^.records,rightRecords);
APPENDSETS(currenttree^.ldfield.RIGHTSUBMODELSfield^.MuVarList,rightMuVarList);
APPENDSETS(currenttree^.ldfield.RIGHTSUBMODELSfield^.SigmaVarList,rightSigmaVarList);
APPENDSETS(currenttree^.ldfield.RIGHTSUBMODELSfield^.TreeVarList,rightTreeVarlist);
APPENDSETS(currenttree^.ldfield.RIGHTSUBMODELSfield^.NodeVarList,rightNodeVarList);
APPENDSETS(currenttree^.ldfield.RIGHTSUBMODELSfield^.RelVarList,rightrelVarList);
rightlevelids:=RIGHTSUBMODELS__levelids;
END
END;

3: begin
  BEGIN MATCHCONDS__indent:=indent+2;
MATCHCONDS__rightMuVarList:=rightMuVarList;
MATCHCONDS__rightSigmaVarList:=rightSigmaVarList;
MATCHCONDS__rightTreeVarList:=rightTreeVarList;
MATCHCONDS__rightNodeVarList:=rightNodeVarList;
MATCHCONDS__rightRelVarList:=rightRelVarList;
vartypes:=currenttree^.ldfield.MATCHCONDSfield^.vartypes;
END
; mrucomCODE_MATCHCONDSproc(currenttree
,MATCHCONDS__leftMuVarList
,MATCHCONDS__leftSigmaVarList
,MATCHCONDS__leftRelVarList
,MATCHCONDS__leftTreeVarList
,MATCHCONDS__leftNodeVarList
,MATCHCONDS__rightMuVarList
,MATCHCONDS__rightSigmaVarList
,MATCHCONDS__rightRelVarList
,MATCHCONDS__rightTreeVarList
,MATCHCONDS__rightNodeVarList
,MATCHCONDS__indent
,MATCHCONDS__commatchfile
,MATCHCONDS__decommatchfile
);
 BEGIN 
APPENDlocfile(MATCHCONDS__commatchfile,commatchfilepar);
APPENDlocfile(MATCHCONDS__decommatchfile,decommatchfilepar);
mergeSETS(currenttree^.ldfield.MATCHCONDSfield^.records,otherRecords);
APPENDSETS(currenttree^.ldfield.MATCHCONDSfield^.MuVarList,otherMuVarList);
APPENDSETS(currenttree^.ldfield.MATCHCONDSfield^.SigmaVarList,otherSigmaVarList);
APPENDSETS(currenttree^.ldfield.MATCHCONDSfield^.TreeVarList,otherTreeVarlist);
APPENDSETS(currenttree^.ldfield.MATCHCONDSfield^.NodeVarList,otherNodeVarList);
APPENDSETS(currenttree^.ldfield.MATCHCONDSfield^.RelVarList,otherrelVarList);
modellabels:=currenttree^.ldfield.MATCHCONDSfield^.modellabels
END
END;

4: begin
  BEGIN
SUBFILTERS__prevrightrhslabels:=rightrhslabels;
vartypes2:=vartypes1;
WHILE stillvartypes(vartypes2) DO
BEGIN
takevartype(vartype,vartypes2);
appendvartype(vartype,vartypes)
END;
SUBFILTERS__vartypes:=vartypes;
SUBFILTERS__indent:=indent+2;
END
; mrucomCODE_SUBFILTERSproc(currenttree
,SUBFILTERS__indent
,SUBFILTERS__prevrightrhslabels
,SUBFILTERS__vartypes
,SUBFILTERS__comsubrules
,SUBFILTERS__decomsubrules
);
 BEGIN APPENDlocfile(SUBFILTERS__comsubrules,comsubrulespar);
APPENDlocfile(SUBFILTERS__decomsubrules,decomsubrulespar);
primitiverule:=FALSE;
numofsubfilters:=currenttree^.ldfield.SUBFILTERSfield^.numofsubfilters;
END
END;

5: begin
  BEGIN CAPAIRS__filter:=TRUE;
CAPAIRS__allexistcounter:=0;
CAPAIRS__indent:=indent+2;
CAPAIRS__insubrule:=TRUE;
CAPAIRS__rhslabels:=rightrhslabels;
vartypes2:=vartypes1;
WHILE stillvartypes(vartypes2) DO
BEGIN
takevartype(vartype,vartypes2);
appendvartype(vartype,vartypes)
END;
CAPAIRS__vartypes:=vartypes;
END
; mrucomCODE_CAPAIRSproc(currenttree
,CAPAIRS__actionteller
,CAPAIRS__actiontellers
,CAPAIRS__indent
,CAPAIRS__syncattable
,CAPAIRS__recordtable
,CAPAIRS__modelnumber
,CAPAIRS__level
,CAPAIRS__insubrule
,CAPAIRS__filter
,CAPAIRS__vartypes
,CAPAIRS__rhslabels
,CAPAIRS__conditions
,CAPAIRS__actions
,CAPAIRS__allexist
,CAPAIRS__allexistcounter
);
 BEGIN primitiverule:=true; 
APPENDlocfile(CAPAIRS__conditions,comconditions);
APPENDlocfile(CAPAIRS__allexist,comactions);
savelocfile(comconditions,decomconditions);
savelocfile(comactions,decomactions);
END
END;

6: begin
  BEGIN END
;
 BEGIN decompresent:=FALSE END
END;

7: begin
  BEGIN compresent:=FALSE END
;
 BEGIN END
END;

8: begin
  BEGIN
takerightleft(rightleft,righttolefttable);
IF subfilternumber<>0 THEN
BEGIN

LOCALTAB(comsubrulespar1,indent);
appendstring(' PROCEDURE subfilter',comsubrulespar1);
 
appendstring(mrucomDECL_convinttostring(sublevel),comsubrulespar1);
 appendstring('X',comsubrulespar1);
 appendstring(mrucomDECL_convinttostring(subfilternumber),comsubrulespar1);

appendstring(';',comsubrulespar1);
 appendstring('\\',comsubrulespar1);
 
IF compresent THEN
BEGIN 
LOCALTAB(comsubrulespar1,indent);
appendstring(' VAR match:BOOLEAN;',comsubrulespar1);
 appendstring('\\',comsubrulespar1);
 
rightlevelids1:=rightlevelids;
WHILE stillidents(rightlevelids1) DO
BEGIN
takeident(id,rightlevelids1);
appendstring('Linit',comsubrulespar1);
 appendstring(id.str,comsubrulespar1);
 appendstring(',Lrest',comsubrulespar1);
 appendstring(id.str,comsubrulespar1);

appendstring(',Lfirst',comsubrulespar1);
 appendstring(id.str,comsubrulespar1);
 appendstring(',Llast',comsubrulespar1);
 appendstring(id.str,comsubrulespar1);

appendstring(':LSSTREE_prelnode;',comsubrulespar1);
appendstring('\\',comsubrulespar1);

appendstring('i',comsubrulespar1);
 appendstring(id.str,comsubrulespar1);
 appendstring(':INTEGER;',comsubrulespar1);
appendstring('\\',comsubrulespar1);

appendstring('nomoretrees',comsubrulespar1);
 appendstring(id.str,comsubrulespar1);
 appendstring(',lastmatch',comsubrulespar1);

appendstring(id.str,comsubrulespar1);
 appendstring(':BOOLEAN;',comsubrulespar1);
appendstring('\\',comsubrulespar1);

END;
identtable:=otherrelvarlist;
While STILLidents(identtable) DO
Begin
TAKEident(id,identtable);
LOCALTAB(comsubrulespar1,indent);
BEGIN appendstring(' ',comsubrulespar1);
 appendstring(id.str,comsubrulespar1);
 appendstring(':LSDOMAINT_synrel;',comsubrulespar1);
appendstring('\\',comsubrulespar1);
 END
END;
identtable:=othernodevarlist;
While STILLidents(identtable) DO
Begin
TAKEident(id,identtable);
LOCALTAB(comsubrulespar1,indent);
BEGIN appendstring(' ',comsubrulespar1);
 appendstring(id.str,comsubrulespar1);
 appendstring(':LSDOMAINT_lsrecord;',comsubrulespar1);
appendstring('\\',comsubrulespar1);
 END
END;
identtable:=othertreevarlist;
While STILLidents(identtable) DO
Begin
TAKEident(id,identtable);
LOCALTAB(comsubrulespar1,indent);
BEGIN appendstring(' ',comsubrulespar1);
;appendstring(id.str,comsubrulespar1);
;appendstring(':LSSTREE_pStree;',comsubrulespar1);
appendstring('\\',comsubrulespar1);
 END
END;
identtable:=othermuvarlist;
While STILLidents(identtable) DO
Begin
TAKEident(id,identtable);
LOCALTAB(comsubrulespar1,indent);
BEGIN appendstring(' ',comsubrulespar1);
;appendstring(id.str,comsubrulespar1);
;appendstring(':LSMRUQUO_ListOfStrees;',comsubrulespar1);
appendstring('\\',comsubrulespar1);
 END
END;
identtable:=othersigmavarlist;
While STILLidents(identtable) DO
Begin
TAKEident(id,identtable);
LOCALTAB(comsubrulespar1,indent);
BEGIN appendstring(' ',comsubrulespar1);
;appendstring(id.str,comsubrulespar1);
;appendstring(':LSMRUQUO_ListOfStrees;',comsubrulespar1);
appendstring('\\',comsubrulespar1);
 END
END;
identtable:=otherrecords;
While STILLidents(identtable) DO
Begin
TAKEident(id,identtable);
IF TSTRING_length(id.str)<>0 THEN
BEGIN
selectCatName(id.str,CatName);
BEGIN
LOCALTAB(comsubrulespar1,indent);
appendstring(' ',comsubrulespar1);
;appendstring(id.str,comsubrulespar1);
;appendstring(':LSDOMAINT_',comsubrulespar1);
;
appendstring(TLDStrToStr_cattorectype(CatName),comsubrulespar1);
;
appendstring(';',comsubrulespar1);
appendstring('\\',comsubrulespar1);

END
END
END;
voidlabels:=SUBTRACTSETS(rightrhslabels,modellabels);
WHILE stillidents(voidlabels) DO
BEGIN
TAKEident(id,voidlabels);
LOCALTAB(comsubrulespar1,indent);
appendstring('FUNCTION MATCHCOND',comsubrulespar1);
 appendstring(id.str,comsubrulespar1);
 appendstring(':BOOLEAN;',comsubrulespar1);
appendstring('\\',comsubrulespar1);

LOCALTAB(comsubrulespar1,indent);
appendstring('BEGIN MATCHCOND',comsubrulespar1);
 appendstring(id.str,comsubrulespar1);
 appendstring(':=TRUE END;',comsubrulespar1);
appendstring('\\',comsubrulespar1);

END;
APPENDlocfile(commatchfilepar,comsubrulespar1);
APPENDlocfile(rightcompar,comsubrulespar1);
IF NOT primitiverule THEN
APPENDlocfile(comsubrulespar,comsubrulespar1)
ELSE APPENDlocfile(comactions,comsubrulespar1);
LOCALTAB(comsubrulespar1,indent);
appendstring('BEGIN',comsubrulespar1);
appendstring('\\',comsubrulespar1);

appendstring(' match:=TRUE;',comsubrulespar1);
appendstring('\\',comsubrulespar1);

i:=0;
identtable:=rightrhslabels;
WHILE stillidents(identtable) DO
BEGIN
i:=i+1;
TAKEident(id,identtable);
IF i<>1 THEN
BEGIN
LOCALTAB(comsubrulespar1,indent);
appendstring(' IF match THEN',comsubrulespar1);

END;
IF TSTRING_comparechar(id.str,1,'T')=0 THEN
BEGIN
LOCALTAB(comsubrulespar1,indent);
appendstring(' matchtree',comsubrulespar1);
 appendstring(id.str,comsubrulespar1);
 appendstring('(match,TRUE);',comsubrulespar1);
appendstring('\\',comsubrulespar1);

LOCALTAB(comsubrulespar1,indent);
appendstring('If match Then',comsubrulespar1);
appendstring('\\',comsubrulespar1);

LOCALTAB(comsubrulespar1,indent);
appendstring('WHILE match AND NOT matchcond',comsubrulespar1);
 
appendstring(id.str,comsubrulespar1);
 appendstring(' DO',comsubrulespar1);
appendstring('\\',comsubrulespar1);

LOCALTAB(comsubrulespar1,indent);
appendstring('BEGIN',comsubrulespar1);
appendstring('\\',comsubrulespar1);

LOCALTAB(comsubrulespar1,indent);
appendstring('Matchtree',comsubrulespar1);
 appendstring(id.str,comsubrulespar1);
 appendstring('(match,FALSE);',comsubrulespar1);
appendstring('\\',comsubrulespar1);

LOCALTAB(comsubrulespar1,indent);
appendstring('END;',comsubrulespar1);
appendstring('\\',comsubrulespar1);

END
ELSE
BEGIN
LOCALTAB(comsubrulespar1,indent);
appendstring(' matchlist',comsubrulespar1);
 appendstring(id.str,comsubrulespar1);
 appendstring('(',comsubrulespar1);

appendstring(id.str,comsubrulespar1);
 appendstring('.first,',comsubrulespar1);

appendstring(id.str,comsubrulespar1);
 appendstring('.last,match,TRUE);',comsubrulespar1);
appendstring('\\',comsubrulespar1);

END
END;
IF primitiverule THEN 
BEGIN
LOCALTAB(comsubrulespar1,indent);
appendstring('IF match THEN BEGIN',comsubrulespar1);
appendstring('\\',comsubrulespar1);

APPENDlocfile(comconditions,comsubrulespar1);
LOCALTAB(comsubrulespar1,indent);
appendstring('END;',comsubrulespar1);
appendstring('\\',comsubrulespar1);

END;
IF NOT primitiverule THEN
BEGIN
i:=0;
LOCALTAB(comsubrulespar1,indent);
appendstring(' IF match THEN',comsubrulespar1);
appendstring('\\',comsubrulespar1);

LOCALTAB(comsubrulespar1,indent+4);
appendstring(' BEGIN',comsubrulespar1);
appendstring('\\',comsubrulespar1);

WHILE i<>numofsubfilters DO
BEGIN
i:=i+1;
LOCALTAB(comsubrulespar1,indent+4);
appendstring('IF match THEN subfilter',comsubrulespar1);
 
appendstring(mrucomDECL_convinttostring((sublevel+1)),comsubrulespar1);
 appendstring('X',comsubrulespar1);
 appendstring(mrucomDECL_convinttostring(i),comsubrulespar1);

appendstring(';',comsubrulespar1);
appendstring('\\',comsubrulespar1);

END;
LOCALTAB(comsubrulespar1,indent+4);
appendstring(' END;',comsubrulespar1);
appendstring('\\',comsubrulespar1);

END;
LOCALTAB(comsubrulespar1,indent);
appendstring('END;',comsubrulespar1);
appendstring('\\',comsubrulespar1);

END
ELSE
BEGIN
LOCALTAB(comsubrulespar1,indent);
appendstring('BEGIN END;',comsubrulespar1);
appendstring('\\',comsubrulespar1);

END;

LOCALTAB(decomsubrulespar1,indent);
appendstring(' PROCEDURE subfilter',decomsubrulespar1);
 
appendstring(mrucomDECL_convinttostring(sublevel),decomsubrulespar1);
 appendstring('X',decomsubrulespar1);
 appendstring(mrucomDECL_convinttostring(subfilternumber),decomsubrulespar1);

appendstring(';',decomsubrulespar1);
 appendstring('\\',decomsubrulespar1);
 
IF decompresent THEN
BEGIN 
LOCALTAB(decomsubrulespar1,indent);
appendstring(' VAR match:BOOLEAN;',decomsubrulespar1);
 appendstring('\\',decomsubrulespar1);
 
rightlevelids1:=rightlevelids;
WHILE stillidents(rightlevelids1) DO
BEGIN
takeident(id,rightlevelids1);
appendstring('Linit',decomsubrulespar1);
 appendstring(id.str,decomsubrulespar1);
 appendstring(',Lrest',decomsubrulespar1);
 appendstring(id.str,decomsubrulespar1);

appendstring(',Lfirst',decomsubrulespar1);
 appendstring(id.str,decomsubrulespar1);
 appendstring(',Llast',decomsubrulespar1);
 appendstring(id.str,decomsubrulespar1);

appendstring(':LSSTREE_prelnode;',decomsubrulespar1);
appendstring('\\',decomsubrulespar1);

appendstring('i',decomsubrulespar1);
 appendstring(id.str,decomsubrulespar1);
 appendstring(':INTEGER;',decomsubrulespar1);
appendstring('\\',decomsubrulespar1);

appendstring('nomoretrees',decomsubrulespar1);
 appendstring(id.str,decomsubrulespar1);
 appendstring(',lastmatch',decomsubrulespar1);

appendstring(id.str,decomsubrulespar1);
 appendstring(':BOOLEAN;',decomsubrulespar1);
appendstring('\\',decomsubrulespar1);

END;
identtable:=otherrelvarlist;
While STILLidents(identtable) DO
Begin
TAKEident(id,identtable);
LOCALTAB(decomsubrulespar1,indent);
BEGIN appendstring(' ',decomsubrulespar1);
 appendstring(id.str,decomsubrulespar1);
 appendstring(':LSDOMAINT_synrel;',decomsubrulespar1);
appendstring('\\',decomsubrulespar1);
 END
END;
identtable:=othernodevarlist;
While STILLidents(identtable) DO
Begin
TAKEident(id,identtable);
LOCALTAB(decomsubrulespar1,indent);
BEGIN appendstring(' ',decomsubrulespar1);
 appendstring(id.str,decomsubrulespar1);
 appendstring(':LSDOMAINT_lsrecord;',decomsubrulespar1);
appendstring('\\',decomsubrulespar1);
 END
END;
identtable:=othertreevarlist;
While STILLidents(identtable) DO
Begin
TAKEident(id,identtable);
LOCALTAB(decomsubrulespar1,indent);
BEGIN appendstring(' ',decomsubrulespar1);
;appendstring(id.str,decomsubrulespar1);
;appendstring(':LSSTREE_pStree;',decomsubrulespar1);
appendstring('\\',decomsubrulespar1);
 END
END;
identtable:=othermuvarlist;
While STILLidents(identtable) DO
Begin
TAKEident(id,identtable);
LOCALTAB(decomsubrulespar1,indent);
BEGIN appendstring(' ',decomsubrulespar1);
;appendstring(id.str,decomsubrulespar1);
;appendstring(':LSMRUQUO_ListOfStrees;',decomsubrulespar1);
appendstring('\\',decomsubrulespar1);
 END
END;
identtable:=othersigmavarlist;
While STILLidents(identtable) DO
Begin
TAKEident(id,identtable);
LOCALTAB(decomsubrulespar1,indent);
BEGIN appendstring(' ',decomsubrulespar1);
;appendstring(id.str,decomsubrulespar1);
;appendstring(':LSMRUQUO_ListOfStrees;',decomsubrulespar1);
appendstring('\\',decomsubrulespar1);
 END
END;
identtable:=otherrecords;
While STILLidents(identtable) DO
Begin
TAKEident(id,identtable);
IF TSTRING_length(id.str)<>0 THEN
BEGIN
selectCatName(id.str,CatName);
BEGIN
LOCALTAB(decomsubrulespar1,indent);
appendstring(' ',decomsubrulespar1);
;appendstring(id.str,decomsubrulespar1);
;appendstring(':LSDOMAINT_',decomsubrulespar1);
;
appendstring(TLDStrToStr_cattorectype(CatName),decomsubrulespar1);
;
appendstring(';',decomsubrulespar1);
appendstring('\\',decomsubrulespar1);

END
END
END;
voidlabels:=SUBTRACTSETS(rightrhslabels,modellabels);
WHILE stillidents(voidlabels) DO
BEGIN
TAKEident(id,voidlabels);
LOCALTAB(decomsubrulespar1,indent);
appendstring('FUNCTION MATCHCOND',decomsubrulespar1);
 appendstring(id.str,decomsubrulespar1);
 appendstring(':BOOLEAN;',decomsubrulespar1);
appendstring('\\',decomsubrulespar1);

LOCALTAB(decomsubrulespar1,indent);
appendstring('BEGIN MATCHCOND',decomsubrulespar1);
 appendstring(id.str,decomsubrulespar1);
 appendstring(':=TRUE END;',decomsubrulespar1);
appendstring('\\',decomsubrulespar1);

END;
APPENDlocfile(decommatchfilepar,decomsubrulespar1);
APPENDlocfile(rightdecompar,decomsubrulespar1);
IF NOT primitiverule THEN
APPENDlocfile(decomsubrulespar,decomsubrulespar1)
ELSE APPENDlocfile(decomactions,decomsubrulespar1);
LOCALTAB(decomsubrulespar1,indent);
appendstring('BEGIN',decomsubrulespar1);
appendstring('\\',decomsubrulespar1);

appendstring(' match:=TRUE;',decomsubrulespar1);
appendstring('\\',decomsubrulespar1);

i:=0;
WHILE stillidents(rightrhslabels) DO
BEGIN
i:=i+1;
TAKEident(id,rightrhslabels);
IF i<>1 THEN
BEGIN
LOCALTAB(decomsubrulespar1,indent);
appendstring(' IF match THEN',decomsubrulespar1);

END;
IF TSTRING_comparechar(id.str,1,'T')=0 THEN
BEGIN
LOCALTAB(decomsubrulespar1,indent);
appendstring(' matchtree',decomsubrulespar1);
 appendstring(id.str,decomsubrulespar1);
 appendstring('(match,TRUE);',decomsubrulespar1);
appendstring('\\',decomsubrulespar1);

LOCALTAB(decomsubrulespar1,indent);
appendstring('If match Then',decomsubrulespar1);
appendstring('\\',decomsubrulespar1);

LOCALTAB(decomsubrulespar1,indent);
appendstring('WHILE match AND NOT matchcond',decomsubrulespar1);
 
appendstring(id.str,decomsubrulespar1);
 appendstring(' DO',decomsubrulespar1);
appendstring('\\',decomsubrulespar1);

LOCALTAB(decomsubrulespar1,indent);
appendstring('BEGIN',decomsubrulespar1);
appendstring('\\',decomsubrulespar1);

LOCALTAB(decomsubrulespar1,indent);
appendstring('Matchtree',decomsubrulespar1);
 appendstring(id.str,decomsubrulespar1);
 appendstring('(match,FALSE);',decomsubrulespar1);
appendstring('\\',decomsubrulespar1);

LOCALTAB(decomsubrulespar1,indent);
appendstring('END;',decomsubrulespar1);
appendstring('\\',decomsubrulespar1);

END
ELSE
BEGIN
LOCALTAB(decomsubrulespar1,indent);
appendstring(' matchlist',decomsubrulespar1);
 appendstring(id.str,decomsubrulespar1);
 appendstring('(',decomsubrulespar1);

appendstring(id.str,decomsubrulespar1);
 appendstring('.first,',decomsubrulespar1);

appendstring(id.str,decomsubrulespar1);
 appendstring('.last,match,TRUE);',decomsubrulespar1);
appendstring('\\',decomsubrulespar1);

END
END;
IF primitiverule THEN 
BEGIN
LOCALTAB(decomsubrulespar1,indent);
appendstring('IF match THEN BEGIN',decomsubrulespar1);
appendstring('\\',decomsubrulespar1);

APPENDlocfile(decomconditions,decomsubrulespar1);
LOCALTAB(decomsubrulespar1,indent);
appendstring('END;',decomsubrulespar1);
appendstring('\\',decomsubrulespar1);

END;
IF NOT primitiverule THEN
BEGIN
i:=0;
LOCALTAB(decomsubrulespar1,indent);
appendstring(' IF match THEN',decomsubrulespar1);
appendstring('\\',decomsubrulespar1);

LOCALTAB(decomsubrulespar1,indent+4);
appendstring(' BEGIN',decomsubrulespar1);
appendstring('\\',decomsubrulespar1);

WHILE i<>numofsubfilters DO
BEGIN
i:=i+1;
LOCALTAB(decomsubrulespar1,indent+4);
appendstring('IF match THEN subfilter',decomsubrulespar1);
 
appendstring(mrucomDECL_convinttostring((sublevel+1)),decomsubrulespar1);
 appendstring('X',decomsubrulespar1);
 appendstring(mrucomDECL_convinttostring(i),decomsubrulespar1);

appendstring(';',decomsubrulespar1);
appendstring('\\',decomsubrulespar1);

END;
LOCALTAB(decomsubrulespar1,indent+4);
appendstring(' END;',decomsubrulespar1);
appendstring('\\',decomsubrulespar1);

END;
LOCALTAB(decomsubrulespar1,indent);
appendstring('END;',decomsubrulespar1);
appendstring('\\',decomsubrulespar1);

END
ELSE
BEGIN
LOCALTAB(decomsubrulespar1,indent);
appendstring('BEGIN END;',decomsubrulespar1);
appendstring('\\',decomsubrulespar1);

END;
END;
subfilternumber:=subfilternumber+1;
primitiverule:=TRUE;
compresent:=TRUE;
decompresent:=TRUE;
INITLOCALFILE(comsubrulespar);
INITLOCALFILE(decomsubrulespar);
INITLOCALFILE(rightcompar);INITLOCALFILE(rightdecompar);
INITLOCALFILE(commatchfilepar);INITLOCALFILE(decommatchfilepar);
INITLOCALFILE(comconditions); numofsubfilters:=0;
INITLOCALFILE(decomconditions); primitiverule:=FALSE;
INITLOCALFILE(comactions);INITLOCALFILE(decomactions);
initsetofvartypes(vartypes);
initsetofidents(rightrhslabels);
initsetofidents(modellabels);
initsetofidents(otherrecords);
initsetofidents(othermuvarlist);
initsetofidents(othersigmavarlist);
initsetofidents(othertreevarlist);
initsetofidents(othernodevarlist);
initsetofidents(otherrelvarlist);
END
;
 BEGIN END
END;

END;

rsnode1:=rsnode1^.brother END;
BEGIN 
IF subfilternumber<>0 THEN
BEGIN

LOCALTAB(comsubrulespar1,indent);
appendstring(' PROCEDURE subfilter',comsubrulespar1);
 
appendstring(mrucomDECL_convinttostring(sublevel),comsubrulespar1);
 appendstring('X',comsubrulespar1);
 appendstring(mrucomDECL_convinttostring(subfilternumber),comsubrulespar1);

appendstring(';',comsubrulespar1);
 appendstring('\\',comsubrulespar1);
 
IF compresent THEN
BEGIN 
LOCALTAB(comsubrulespar1,indent);
appendstring(' VAR match:BOOLEAN;',comsubrulespar1);
 appendstring('\\',comsubrulespar1);
 
rightlevelids1:=rightlevelids;
WHILE stillidents(rightlevelids1) DO
BEGIN
takeident(id,rightlevelids1);
appendstring('Linit',comsubrulespar1);
 appendstring(id.str,comsubrulespar1);
 appendstring(',Lrest',comsubrulespar1);
 appendstring(id.str,comsubrulespar1);

appendstring(',Lfirst',comsubrulespar1);
 appendstring(id.str,comsubrulespar1);
 appendstring(',Llast',comsubrulespar1);
 appendstring(id.str,comsubrulespar1);

appendstring(':LSSTREE_prelnode;',comsubrulespar1);
appendstring('\\',comsubrulespar1);

appendstring('i',comsubrulespar1);
 appendstring(id.str,comsubrulespar1);
 appendstring(':INTEGER;',comsubrulespar1);
appendstring('\\',comsubrulespar1);

appendstring('nomoretrees',comsubrulespar1);
 appendstring(id.str,comsubrulespar1);
 appendstring(',lastmatch',comsubrulespar1);

appendstring(id.str,comsubrulespar1);
 appendstring(':BOOLEAN;',comsubrulespar1);
appendstring('\\',comsubrulespar1);

END;
identtable:=otherrelvarlist;
While STILLidents(identtable) DO
Begin
TAKEident(id,identtable);
LOCALTAB(comsubrulespar1,indent);
BEGIN appendstring(' ',comsubrulespar1);
 appendstring(id.str,comsubrulespar1);
 appendstring(':LSDOMAINT_synrel;',comsubrulespar1);
appendstring('\\',comsubrulespar1);
 END
END;
identtable:=othernodevarlist;
While STILLidents(identtable) DO
Begin
TAKEident(id,identtable);
LOCALTAB(comsubrulespar1,indent);
BEGIN appendstring(' ',comsubrulespar1);
 appendstring(id.str,comsubrulespar1);
 appendstring(':LSDOMAINT_lsrecord;',comsubrulespar1);
appendstring('\\',comsubrulespar1);
 END
END;
identtable:=othertreevarlist;
While STILLidents(identtable) DO
Begin
TAKEident(id,identtable);
LOCALTAB(comsubrulespar1,indent);
BEGIN appendstring(' ',comsubrulespar1);
;appendstring(id.str,comsubrulespar1);
;appendstring(':LSSTREE_pStree;',comsubrulespar1);
appendstring('\\',comsubrulespar1);
 END
END;
identtable:=othermuvarlist;
While STILLidents(identtable) DO
Begin
TAKEident(id,identtable);
LOCALTAB(comsubrulespar1,indent);
BEGIN appendstring(' ',comsubrulespar1);
;appendstring(id.str,comsubrulespar1);
;appendstring(':LSMRUQUO_ListOfStrees;',comsubrulespar1);
appendstring('\\',comsubrulespar1);
 END
END;
identtable:=othersigmavarlist;
While STILLidents(identtable) DO
Begin
TAKEident(id,identtable);
LOCALTAB(comsubrulespar1,indent);
BEGIN appendstring(' ',comsubrulespar1);
;appendstring(id.str,comsubrulespar1);
;appendstring(':LSMRUQUO_ListOfStrees;',comsubrulespar1);
appendstring('\\',comsubrulespar1);
 END
END;
identtable:=otherrecords;
While STILLidents(identtable) DO
Begin
TAKEident(id,identtable);
IF TSTRING_length(id.str)<>0 THEN
BEGIN
selectCatName(id.str,CatName);
BEGIN
LOCALTAB(comsubrulespar1,indent);
appendstring(' ',comsubrulespar1);
;appendstring(id.str,comsubrulespar1);
;appendstring(':LSDOMAINT_',comsubrulespar1);
;
appendstring(TLDStrToStr_cattorectype(CatName),comsubrulespar1);
;
appendstring(';',comsubrulespar1);
appendstring('\\',comsubrulespar1);

END
END
END;
voidlabels:=SUBTRACTSETS(rightrhslabels,modellabels);
WHILE stillidents(voidlabels) DO
BEGIN
TAKEident(id,voidlabels);
LOCALTAB(comsubrulespar1,indent);
appendstring('FUNCTION MATCHCOND',comsubrulespar1);
 appendstring(id.str,comsubrulespar1);
 appendstring(':BOOLEAN;',comsubrulespar1);
appendstring('\\',comsubrulespar1);

LOCALTAB(comsubrulespar1,indent);
appendstring('BEGIN MATCHCOND',comsubrulespar1);
 appendstring(id.str,comsubrulespar1);
 appendstring(':=TRUE END;',comsubrulespar1);
appendstring('\\',comsubrulespar1);

END;
APPENDlocfile(commatchfilepar,comsubrulespar1);
APPENDlocfile(rightcompar,comsubrulespar1);
IF NOT primitiverule THEN
APPENDlocfile(comsubrulespar,comsubrulespar1)
ELSE APPENDlocfile(comactions,comsubrulespar1);
LOCALTAB(comsubrulespar1,indent);
appendstring('BEGIN',comsubrulespar1);
appendstring('\\',comsubrulespar1);

appendstring(' match:=TRUE;',comsubrulespar1);
appendstring('\\',comsubrulespar1);

i:=0;
identtable:=rightrhslabels;
WHILE stillidents(identtable) DO
BEGIN
i:=i+1;
TAKEident(id,identtable);
IF i<>1 THEN
BEGIN
LOCALTAB(comsubrulespar1,indent);
appendstring(' IF match THEN',comsubrulespar1);

END;
IF TSTRING_comparechar(id.str,1,'T')=0 THEN
BEGIN
LOCALTAB(comsubrulespar1,indent);
appendstring(' matchtree',comsubrulespar1);
 appendstring(id.str,comsubrulespar1);
 appendstring('(match,TRUE);',comsubrulespar1);
appendstring('\\',comsubrulespar1);

LOCALTAB(comsubrulespar1,indent);
appendstring('If match Then',comsubrulespar1);
appendstring('\\',comsubrulespar1);

LOCALTAB(comsubrulespar1,indent);
appendstring('WHILE match AND NOT matchcond',comsubrulespar1);
 
appendstring(id.str,comsubrulespar1);
 appendstring(' DO',comsubrulespar1);
appendstring('\\',comsubrulespar1);

LOCALTAB(comsubrulespar1,indent);
appendstring('BEGIN',comsubrulespar1);
appendstring('\\',comsubrulespar1);

LOCALTAB(comsubrulespar1,indent);
appendstring('Matchtree',comsubrulespar1);
 appendstring(id.str,comsubrulespar1);
 appendstring('(match,FALSE);',comsubrulespar1);
appendstring('\\',comsubrulespar1);

LOCALTAB(comsubrulespar1,indent);
appendstring('END;',comsubrulespar1);
appendstring('\\',comsubrulespar1);

END
ELSE
BEGIN
LOCALTAB(comsubrulespar1,indent);
appendstring(' matchlist',comsubrulespar1);
 appendstring(id.str,comsubrulespar1);
 appendstring('(',comsubrulespar1);

appendstring(id.str,comsubrulespar1);
 appendstring('.first,',comsubrulespar1);

appendstring(id.str,comsubrulespar1);
 appendstring('.last,match,TRUE);',comsubrulespar1);
appendstring('\\',comsubrulespar1);

END
END;
IF primitiverule THEN 
BEGIN
LOCALTAB(comsubrulespar1,indent);
appendstring('IF match THEN BEGIN',comsubrulespar1);
appendstring('\\',comsubrulespar1);

APPENDlocfile(comconditions,comsubrulespar1);
LOCALTAB(comsubrulespar1,indent);
appendstring('END;',comsubrulespar1);
appendstring('\\',comsubrulespar1);

END;
IF NOT primitiverule THEN
BEGIN
i:=0;
LOCALTAB(comsubrulespar1,indent);
appendstring(' IF match THEN',comsubrulespar1);
appendstring('\\',comsubrulespar1);

LOCALTAB(comsubrulespar1,indent+4);
appendstring(' BEGIN',comsubrulespar1);
appendstring('\\',comsubrulespar1);

WHILE i<>numofsubfilters DO
BEGIN
i:=i+1;
LOCALTAB(comsubrulespar1,indent+4);
appendstring('IF match THEN subfilter',comsubrulespar1);
 
appendstring(mrucomDECL_convinttostring((sublevel+1)),comsubrulespar1);
 appendstring('X',comsubrulespar1);
 appendstring(mrucomDECL_convinttostring(i),comsubrulespar1);

appendstring(';',comsubrulespar1);
appendstring('\\',comsubrulespar1);

END;
LOCALTAB(comsubrulespar1,indent+4);
appendstring(' END;',comsubrulespar1);
appendstring('\\',comsubrulespar1);

END;
LOCALTAB(comsubrulespar1,indent);
appendstring('END;',comsubrulespar1);
appendstring('\\',comsubrulespar1);

END
ELSE
BEGIN
LOCALTAB(comsubrulespar1,indent);
appendstring('BEGIN END;',comsubrulespar1);
appendstring('\\',comsubrulespar1);

END;

LOCALTAB(decomsubrulespar1,indent);
appendstring(' PROCEDURE subfilter',decomsubrulespar1);
 
appendstring(mrucomDECL_convinttostring(sublevel),decomsubrulespar1);
 appendstring('X',decomsubrulespar1);
 appendstring(mrucomDECL_convinttostring(subfilternumber),decomsubrulespar1);

appendstring(';',decomsubrulespar1);
 appendstring('\\',decomsubrulespar1);
 
IF decompresent THEN
BEGIN 
LOCALTAB(decomsubrulespar1,indent);
appendstring(' VAR match:BOOLEAN;',decomsubrulespar1);
 appendstring('\\',decomsubrulespar1);
 
rightlevelids1:=rightlevelids;
WHILE stillidents(rightlevelids1) DO
BEGIN
takeident(id,rightlevelids1);
appendstring('Linit',decomsubrulespar1);
 appendstring(id.str,decomsubrulespar1);
 appendstring(',Lrest',decomsubrulespar1);
 appendstring(id.str,decomsubrulespar1);

appendstring(',Lfirst',decomsubrulespar1);
 appendstring(id.str,decomsubrulespar1);
 appendstring(',Llast',decomsubrulespar1);
 appendstring(id.str,decomsubrulespar1);

appendstring(':LSSTREE_prelnode;',decomsubrulespar1);
appendstring('\\',decomsubrulespar1);

appendstring('i',decomsubrulespar1);
 appendstring(id.str,decomsubrulespar1);
 appendstring(':INTEGER;',decomsubrulespar1);
appendstring('\\',decomsubrulespar1);

appendstring('nomoretrees',decomsubrulespar1);
 appendstring(id.str,decomsubrulespar1);
 appendstring(',lastmatch',decomsubrulespar1);

appendstring(id.str,decomsubrulespar1);
 appendstring(':BOOLEAN;',decomsubrulespar1);
appendstring('\\',decomsubrulespar1);

END;
identtable:=otherrelvarlist;
While STILLidents(identtable) DO
Begin
TAKEident(id,identtable);
LOCALTAB(decomsubrulespar1,indent);
BEGIN appendstring(' ',decomsubrulespar1);
 appendstring(id.str,decomsubrulespar1);
 appendstring(':LSDOMAINT_synrel;',decomsubrulespar1);
appendstring('\\',decomsubrulespar1);
 END
END;
identtable:=othernodevarlist;
While STILLidents(identtable) DO
Begin
TAKEident(id,identtable);
LOCALTAB(decomsubrulespar1,indent);
BEGIN appendstring(' ',decomsubrulespar1);
 appendstring(id.str,decomsubrulespar1);
 appendstring(':LSDOMAINT_lsrecord;',decomsubrulespar1);
appendstring('\\',decomsubrulespar1);
 END
END;
identtable:=othertreevarlist;
While STILLidents(identtable) DO
Begin
TAKEident(id,identtable);
LOCALTAB(decomsubrulespar1,indent);
BEGIN appendstring(' ',decomsubrulespar1);
;appendstring(id.str,decomsubrulespar1);
;appendstring(':LSSTREE_pStree;',decomsubrulespar1);
appendstring('\\',decomsubrulespar1);
 END
END;
identtable:=othermuvarlist;
While STILLidents(identtable) DO
Begin
TAKEident(id,identtable);
LOCALTAB(decomsubrulespar1,indent);
BEGIN appendstring(' ',decomsubrulespar1);
;appendstring(id.str,decomsubrulespar1);
;appendstring(':LSMRUQUO_ListOfStrees;',decomsubrulespar1);
appendstring('\\',decomsubrulespar1);
 END
END;
identtable:=othersigmavarlist;
While STILLidents(identtable) DO
Begin
TAKEident(id,identtable);
LOCALTAB(decomsubrulespar1,indent);
BEGIN appendstring(' ',decomsubrulespar1);
;appendstring(id.str,decomsubrulespar1);
;appendstring(':LSMRUQUO_ListOfStrees;',decomsubrulespar1);
appendstring('\\',decomsubrulespar1);
 END
END;
identtable:=otherrecords;
While STILLidents(identtable) DO
Begin
TAKEident(id,identtable);
IF TSTRING_length(id.str)<>0 THEN
BEGIN
selectCatName(id.str,CatName);
BEGIN
LOCALTAB(decomsubrulespar1,indent);
appendstring(' ',decomsubrulespar1);
;appendstring(id.str,decomsubrulespar1);
;appendstring(':LSDOMAINT_',decomsubrulespar1);
;
appendstring(TLDStrToStr_cattorectype(CatName),decomsubrulespar1);
;
appendstring(';',decomsubrulespar1);
appendstring('\\',decomsubrulespar1);

END
END
END;
voidlabels:=SUBTRACTSETS(rightrhslabels,modellabels);
WHILE stillidents(voidlabels) DO
BEGIN
TAKEident(id,voidlabels);
LOCALTAB(decomsubrulespar1,indent);
appendstring('FUNCTION MATCHCOND',decomsubrulespar1);
 appendstring(id.str,decomsubrulespar1);
 appendstring(':BOOLEAN;',decomsubrulespar1);
appendstring('\\',decomsubrulespar1);

LOCALTAB(decomsubrulespar1,indent);
appendstring('BEGIN MATCHCOND',decomsubrulespar1);
 appendstring(id.str,decomsubrulespar1);
 appendstring(':=TRUE END;',decomsubrulespar1);
appendstring('\\',decomsubrulespar1);

END;
APPENDlocfile(decommatchfilepar,decomsubrulespar1);
APPENDlocfile(rightdecompar,decomsubrulespar1);
IF NOT primitiverule THEN
APPENDlocfile(decomsubrulespar,decomsubrulespar1)
ELSE APPENDlocfile(decomactions,decomsubrulespar1);
LOCALTAB(decomsubrulespar1,indent);
appendstring('BEGIN',decomsubrulespar1);
appendstring('\\',decomsubrulespar1);

appendstring(' match:=TRUE;',decomsubrulespar1);
appendstring('\\',decomsubrulespar1);

i:=0;
WHILE stillidents(rightrhslabels) DO
BEGIN
i:=i+1;
TAKEident(id,rightrhslabels);
IF i<>1 THEN
BEGIN
LOCALTAB(decomsubrulespar1,indent);
appendstring(' IF match THEN',decomsubrulespar1);

END;
IF TSTRING_comparechar(id.str,1,'T')=0 THEN
BEGIN
LOCALTAB(decomsubrulespar1,indent);
appendstring(' matchtree',decomsubrulespar1);
 appendstring(id.str,decomsubrulespar1);
 appendstring('(match,TRUE);',decomsubrulespar1);
appendstring('\\',decomsubrulespar1);

LOCALTAB(decomsubrulespar1,indent);
appendstring('If match Then',decomsubrulespar1);
appendstring('\\',decomsubrulespar1);

LOCALTAB(decomsubrulespar1,indent);
appendstring('WHILE match AND NOT matchcond',decomsubrulespar1);
 
appendstring(id.str,decomsubrulespar1);
 appendstring(' DO',decomsubrulespar1);
appendstring('\\',decomsubrulespar1);

LOCALTAB(decomsubrulespar1,indent);
appendstring('BEGIN',decomsubrulespar1);
appendstring('\\',decomsubrulespar1);

LOCALTAB(decomsubrulespar1,indent);
appendstring('Matchtree',decomsubrulespar1);
 appendstring(id.str,decomsubrulespar1);
 appendstring('(match,FALSE);',decomsubrulespar1);
appendstring('\\',decomsubrulespar1);

LOCALTAB(decomsubrulespar1,indent);
appendstring('END;',decomsubrulespar1);
appendstring('\\',decomsubrulespar1);

END
ELSE
BEGIN
LOCALTAB(decomsubrulespar1,indent);
appendstring(' matchlist',decomsubrulespar1);
 appendstring(id.str,decomsubrulespar1);
 appendstring('(',decomsubrulespar1);

appendstring(id.str,decomsubrulespar1);
 appendstring('.first,',decomsubrulespar1);

appendstring(id.str,decomsubrulespar1);
 appendstring('.last,match,TRUE);',decomsubrulespar1);
appendstring('\\',decomsubrulespar1);

END
END;
IF primitiverule THEN 
BEGIN
LOCALTAB(decomsubrulespar1,indent);
appendstring('IF match THEN BEGIN',decomsubrulespar1);
appendstring('\\',decomsubrulespar1);

APPENDlocfile(decomconditions,decomsubrulespar1);
LOCALTAB(decomsubrulespar1,indent);
appendstring('END;',decomsubrulespar1);
appendstring('\\',decomsubrulespar1);

END;
IF NOT primitiverule THEN
BEGIN
i:=0;
LOCALTAB(decomsubrulespar1,indent);
appendstring(' IF match THEN',decomsubrulespar1);
appendstring('\\',decomsubrulespar1);

LOCALTAB(decomsubrulespar1,indent+4);
appendstring(' BEGIN',decomsubrulespar1);
appendstring('\\',decomsubrulespar1);

WHILE i<>numofsubfilters DO
BEGIN
i:=i+1;
LOCALTAB(decomsubrulespar1,indent+4);
appendstring('IF match THEN subfilter',decomsubrulespar1);
 
appendstring(mrucomDECL_convinttostring((sublevel+1)),decomsubrulespar1);
 appendstring('X',decomsubrulespar1);
 appendstring(mrucomDECL_convinttostring(i),decomsubrulespar1);

appendstring(';',decomsubrulespar1);
appendstring('\\',decomsubrulespar1);

END;
LOCALTAB(decomsubrulespar1,indent+4);
appendstring(' END;',decomsubrulespar1);
appendstring('\\',decomsubrulespar1);

END;
LOCALTAB(decomsubrulespar1,indent);
appendstring('END;',decomsubrulespar1);
appendstring('\\',decomsubrulespar1);

END
ELSE
BEGIN
LOCALTAB(decomsubrulespar1,indent);
appendstring('BEGIN END;',decomsubrulespar1);
appendstring('\\',decomsubrulespar1);

END;
END;
SUBFILTERS_comsubrules:=comsubrulespar1;
SUBFILTERS_decomsubrules:=decomsubrulespar1;
END
END;
PROCEDURE mrucomCODE_LEFTSUBMODELSproc(top:mrucomDECL_psnode
;LEFTSUBMODELS_righttolefttable              :mrucomlangspec_setofidents
;LEFTSUBMODELS_indent              :mrucomlangspec_int
;LEFTSUBMODELS_name              :TSTRING_string
;LEFTSUBMODELS_prevrhslabels              :mrucomlangspec_setofidents
;LEFTSUBMODELS_rightmuvarlist              :mrucomlangspec_setofidents
;LEFTSUBMODELS_rightsigmavarl              :mrucomlangspec_setofidents
;LEFTSUBMODELS_righttreevarl              :mrucomlangspec_setofidents
;var LEFTSUBMODELS_leftcom              :LOCALFILE
;var LEFTSUBMODELS_leftdecom              :LOCALFILE
;var LEFTSUBMODELS_dtreeproc              :LOCALFILE
;var LEFTSUBMODELS_levelids              :mrucomlangspec_setofidents
);
VAR currenttree:mrucomDECL_psnode;
    rsnode1:mrucomDECL_prsnode;
 dtreeproc,leftcom,leftdecom:LOCALFILE;
righttolefttable: mrucomLANGSPEC_setofidents;
level,indent: mrucomLANGSPEC_int;
levelids: mrucomLANGSPEC_setofidents;
rhslabel,id: mrucomLANGSPEC_ident;
keymentioned,keyvar: mrucomLANGSPEC_bool;
prevrhslabels,commonmuvarlist,commonsigmavarlist,commontreevarlist: mrucomLANGSPEC_setofidents;
name,recordname,category,treevarname,nodevarname,keystr1,keystr2:TSTRING_string;
 FUNCTION present(ident: mrucomLANGSPEC_ident;S1: mrucomLANGSPEC_setofidents):BOOLEAN;
VAR ident1: mrucomLANGSPEC_ident;
result:boolean;
begin
result:=false;
while stillidents(S1) and not(result) do
begin
takeident(ident1,S1);
result := (ident1.str=ident.str)
end;
present:=result
end;
PROCEDURE APPENDSETS(S1: mrucomLANGSPEC_SETOFidents;VAR S2: mrucomLANGSPEC_SETOFidents);
VAR ident1: mrucomLANGSPEC_ident;
BEGIN
WHILE STILLidents(S1) DO
BEGIN
TAKEident(ident1,S1);
APPENDident(ident1,S2)
END
END;
BEGIN
 BEGIN INITLOCALFILE(leftcom);
INITLOCALFILE(leftdecom);
INITLOCALFILE(dtreeproc);
initsetofidents(levelids);
name:=LEFTSUBMODELS_name;
indent:=LEFTSUBMODELS_indent;
commonmuvarlist:=LEFTSUBMODELS_rightmuvarlist;
commonsigmavarlist:=LEFTSUBMODELS_rightsigmavarl;
commontreevarlist:=LEFTSUBMODELS_righttreevarl;
level:=indent DIV 2;
prevrhslabels:=LEFTSUBMODELS_prevrhslabels;
righttolefttable:=LEFTSUBMODELS_righttolefttable;
BEGIN  END;
LOCALTAB(leftdecom,indent);
appendstring('PROCEDURE previous',leftdecom);
 appendstring(mrucomDECL_convinttostring(level),leftdecom);
 appendstring(';',leftdecom);
appendstring('\\',leftdecom);

LOCALTAB(leftdecom,indent);
appendstring('BEGIN',leftdecom);
appendstring('\\',leftdecom);

WHILE stillidents(prevrhslabels) DO
BEGIN
takeident(id,prevrhslabels);
LOCALTAB(leftdecom,indent);
appendstring('create',leftdecom);
 appendstring(id.str,leftdecom);
 appendstring(';',leftdecom);
appendstring('\\',leftdecom);

END;
IF level<>1 THEN
BEGIN
LOCALTAB(leftdecom,indent);
appendstring('previous',leftdecom);
 appendstring(mrucomDECL_convinttostring(level-1),leftdecom);
 appendstring(';',leftdecom);
appendstring('\\',leftdecom);

END;
LOCALTAB(leftdecom,indent);
appendstring('END;',leftdecom);
appendstring('\\',leftdecom);

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
  BEGIN 
LABELEDTD__righttolefttable:=righttolefttable;
LABELEDTD__submodeltree:=TRUE;
LABELEDTD__indent:=indent+2;
category:=currenttree^.ldfield.LABELEDTDfield^.category;
treevarname:=currenttree^.ldfield.LABELEDTDfield^.treevarname;
nodevarname:=currenttree^.ldfield.LABELEDTDfield^.nodevarname;
LABELEDTD__root:=currenttree^.ldfield.LABELEDTDfield^.rhslabel.str;
LABELEDTD__name:=name;
END
; mrucomCODE_LABELEDTDproc(currenttree
,LABELEDTD__indent
,LABELEDTD__name
,LABELEDTD__submodeltree
,LABELEDTD__righttolefttable
,LABELEDTD__root
,LABELEDTD__leftcom
,LABELEDTD__rightcom
,LABELEDTD__dtreeproc
,LABELEDTD__numberofitems
,LABELEDTD__keymentioned
,LABELEDTD__keyvar
,LABELEDTD__keystr1
,LABELEDTD__keystr2
,LABELEDTD__levelids
);
 BEGIN APPENDlocfile(LABELEDTD__leftcom,leftcom);
appendlocfile(LABELEDTD__dtreeproc,dtreeproc);
appendsets(LABELEDTD__levelids,levelids);
keymentioned:=LABELEDTD__keymentioned;
keyvar:=LABELEDTD__keyvar;
keystr1:=LABELEDTD__keystr1;
keystr2:=LABELEDTD__keystr2;
recordname:=currenttree^.ldfield.LABELEDTDfield^.recordname;
rhslabel:=currenttree^.ldfield.LABELEDTDfield^.rhslabel;
BEGIN  END;
LOCALTAB(leftdecom,indent);
appendstring('PROCEDURE create',leftdecom);
 appendstring(rhslabel.str,leftdecom);
 appendstring(';',leftdecom);
appendstring('\\',leftdecom);

IF NOT(present(rhslabel,commontreevarlist)) THEN 
BEGIN
LOCALTAB(leftdecom,indent);
appendstring('VAR s:LSSTREE_pstree;',leftdecom);
appendstring('\\',leftdecom);

LOCALTAB(leftdecom,indent+4);
appendstring('list:LSMRUQUO_ListOfStrees;',leftdecom);
appendstring('\\',leftdecom);

APPENDlocfile(LABELEDTD__rightcom,leftdecom);
END;
LOCALTAB(leftdecom,indent);
appendstring('BEGIN{',leftdecom);
 appendstring(rhslabel.str,leftdecom);
 appendstring('}',leftdecom);
appendstring('\\',leftdecom);

IF NOT(present(rhslabel,commontreevarlist)) THEN 
BEGIN
IF keymentioned THEN
BEGIN
appendstring('s:=',leftdecom);
 appendstring(recordname,leftdecom);
 appendstring('tree;',leftdecom);
appendstring('\\',leftdecom);

END
ELSE
IF currenttree^.ldfield.LABELEDTDfield^.basiccat THEN
BEGIN
IF TSTRING_comparechars(category,'GLUE',4)<>0 THEN
BEGIN
appendstring('s:=',leftdecom);
 appendstring(recordname,leftdecom);
 appendstring('tree;',leftdecom);
appendstring('\\',leftdecom);

END
ELSE
BEGIN
appendstring('s:=MAKET_stree(GLUE);',leftdecom);
appendstring('\\',leftdecom);

END
END
ELSE
BEGIN
IF (TSTRING_length(category)<>0) THEN
BEGIN
IF currenttree^.ldfield.LABELEDTDfield^.noderiv THEN
BEGIN
LOCALTAB(leftdecom,indent);
appendstring('s:=MAKET_stree(',leftdecom);
 appendstring(category,leftdecom);
 appendstring(');',leftdecom);
appendstring('\\',leftdecom);

END;
LOCALTAB(leftdecom,indent);
IF TSTRING_comparechars(category,'GLUE',4)<>0 THEN
BEGIN
appendstring('createnode(s);',leftdecom);
appendstring('\\',leftdecom);

LOCALTAB(leftdecom,indent);
END;
IF currenttree^.ldfield.LABELEDTDfield^.noderiv THEN 
BEGIN
appendstring('createlist1(list);',leftdecom);
appendstring('\\',leftdecom);

LOCALTAB(leftdecom,indent);
appendstring('IF list.first<>NIL THEN list.last^.brother:=NIL;',leftdecom);
appendstring('\\',leftdecom);

LOCALTAB(leftdecom,indent);
appendstring('s^.li^.n:=numberofelements(list);',leftdecom);
appendstring('\\',leftdecom);

LOCALTAB(leftdecom,indent);
appendstring('s^.sons:=list.first;',leftdecom);
appendstring('\\',leftdecom);

END;
END
ELSE
BEGIN
IF TSTRING_length(treevarname)<>0 THEN
BEGIN
LOCALTAB(leftdecom,indent);
appendstring('s:=',leftdecom);
 appendstring(treevarname,leftdecom);
 appendstring(';',leftdecom);
appendstring('\\',leftdecom);

END
ELSE
BEGIN
LOCALTAB(leftdecom,indent);
appendstring('s:=MAKET_stree(',leftdecom);
 appendstring(nodevarname,leftdecom);
 appendstring('.cat);',leftdecom);
appendstring('\\',leftdecom);

LOCALTAB(leftdecom,indent);
appendstring('createnode(s);',leftdecom);
appendstring('\\',leftdecom);

LOCALTAB(leftdecom,indent);
IF currenttree^.ldfield.LABELEDTDfield^.noderiv THEN
BEGIN
appendstring('createlist1(list);',leftdecom);
appendstring('\\',leftdecom);

LOCALTAB(leftdecom,indent);
appendstring('IF list.first<>NIL THEN list.last^.brother:=NIL;',leftdecom);
appendstring('\\',leftdecom);

LOCALTAB(leftdecom,indent);
appendstring('s^.li^.n:=numberofelements(list);',leftdecom);
appendstring('\\',leftdecom);

LOCALTAB(leftdecom,indent);
appendstring('s^.sons:=list.first;',leftdecom);
appendstring('\\',leftdecom);

END;
END
END;
END;
LOCALTAB(leftdecom,indent);
appendstring(rhslabel.str,leftdecom);
 appendstring(':=s;',leftdecom);
appendstring('\\',leftdecom);

END;
LOCALTAB(leftdecom,indent);
appendstring('END{',leftdecom);
 appendstring(rhslabel.str,leftdecom);
 appendstring('};',leftdecom);
appendstring('\\',leftdecom);

END
END;

3: begin
  BEGIN LABELEDLD__submodellist:=TRUE;
LABELEDLD__righttolefttable:=righttolefttable;
LABELEDLD__indent:=indent;
LABELEDLD__inexist:=FALSE;
LABELEDLD__root:=currenttree^.ldfield.LABELEDLDfield^.rhslabel.str;
LABELEDLD__name:=name;
END
; mrucomCODE_LABELEDLDproc(currenttree
,LABELEDLD__indent
,LABELEDLD__righttolefttable
,LABELEDLD__submodellist
,LABELEDLD__inexist
,LABELEDLD__root
,LABELEDLD__name
,LABELEDLD__leftcom
,LABELEDLD__rightcom
,LABELEDLD__dtreeproc
,LABELEDLD__NumberOfItems
,LABELEDLD__levelids
);
 BEGIN APPENDlocfile(LABELEDLD__leftcom,leftcom);
appendlocfile(LABELEDLD__dtreeproc,dtreeproc);
appendsets(LABELEDLD__levelids,levelids);
rhslabel:=currenttree^.ldfield.LABELEDLDfield^.rhslabel;
BEGIN  END;
LOCALTAB(leftdecom,indent);
appendstring('PROCEDURE create',leftdecom);
 appendstring(rhslabel.str,leftdecom);
 appendstring(';',leftdecom);
appendstring('\\',leftdecom);

IF NOT(present(rhslabel,commonmuvarlist)) THEN
IF NOT(present(rhslabel,commonsigmavarlist)) THEN 
BEGIN
APPENDlocfile(LABELEDLD__rightcom,leftdecom);
END;
LOCALTAB(leftdecom,indent);
appendstring('BEGIN{',leftdecom);
 appendstring(rhslabel.str,leftdecom);
 appendstring('}',leftdecom);
appendstring('\\',leftdecom);

IF NOT(present(rhslabel,commonmuvarlist)) THEN
IF NOT(present(rhslabel,commonsigmavarlist)) THEN 
BEGIN
LOCALTAB(leftdecom,indent);
appendstring('createlist1(',leftdecom);
 appendstring(rhslabel.str,leftdecom);
 appendstring(');',leftdecom);
appendstring('\\',leftdecom);

END;
LOCALTAB(leftdecom,indent);
appendstring('END{',leftdecom);
 appendstring(rhslabel.str,leftdecom);
 appendstring('};',leftdecom);
appendstring('\\',leftdecom);

END
END;

END;

rsnode1:=rsnode1^.brother END;
BEGIN LEFTSUBMODELS_leftcom:=leftcom;
LEFTSUBMODELS_leftdecom:=leftdecom;
LEFTSUBMODELS_dtreeproc:=dtreeproc;
LEFTSUBMODELS_levelids:=levelids
END
END;
PROCEDURE mrucomCODE_RIGHTSUBMODELSproc(top:mrucomDECL_psnode
;RIGHTSUBMODELS_righttolefttabl              :mrucomlangspec_setofidents
;RIGHTSUBMODELS_name              :TSTRING_string
;RIGHTSUBMODELS_indent              :mrucomlangspec_int
;RIGHTSUBMODELS_prevrhslabels              :mrucomlangspec_setofidents
;RIGHTSUBMODELS_leftmuvarlist              :mrucomlangspec_setofidents
;RIGHTSUBMODELS_leftsigmavarl              :mrucomlangspec_setofidents
;RIGHTSUBMODELS_lefttreevarl              :mrucomlangspec_setofidents
;var RIGHTSUBMODELS_rightcom              :LOCALFILE
;var RIGHTSUBMODELS_rightdecom              :LOCALFILE
;var RIGHTSUBMODELS_dtreeproc              :LOCALFILE
;var RIGHTSUBMODELS_levelids              :mrucomlangspec_setofidents
);
VAR currenttree:mrucomDECL_psnode;
    rsnode1:mrucomDECL_prsnode;
 dtreeproc,extern,rightcom,rightdecom:LOCALFILE;
levelids,righttolefttable: mrucomLANGSPEC_setofidents;
rhslabel,id: mrucomLANGSPEC_ident;
level,indent: mrucomLANGSPEC_int;
keymentioned,keyvar: mrucomLANGSPEC_bool;
prevrhslabels,commonmuvarlist,commonsigmavarlist,commontreevarlist: mrucomLANGSPEC_setofidents;
counterstr,name,str,recordname,category,treevarname,nodevarname,keystr1,keystr2:TSTRING_string;
 FUNCTION present(ident: mrucomLANGSPEC_ident;S1: mrucomLANGSPEC_setofidents):BOOLEAN;
VAR ident1: mrucomLANGSPEC_ident;
result:boolean;
begin
result:=false;
while stillidents(S1) and not(result) do
begin
takeident(ident1,S1);
result := (ident1.str=ident.str)
end;
present:=result
end;
PROCEDURE APPENDSETS(S1: mrucomLANGSPEC_SETOFidents;VAR S2: mrucomLANGSPEC_SETOFidents);
VAR ident1: mrucomLANGSPEC_ident;
BEGIN
WHILE STILLidents(S1) DO
BEGIN
TAKEident(ident1,S1);
APPENDident(ident1,S2)
END
END;
BEGIN
 BEGIN INITLOCALFILE(rightcom);
INITLOCALFILE(rightdecom);
INITLOCALFILE(dtreeproc);
INITLOCALFILE(extern);
initsetofidents(levelids);
counterstr:=top^.ldfield.RIGHTSUBMODELSfield^.counterstr;
commonmuvarlist:=RIGHTSUBMODELS_leftmuvarlist;
commonsigmavarlist:=RIGHTSUBMODELS_leftsigmavarl;
commontreevarlist:=RIGHTSUBMODELS_lefttreevarl;
righttolefttable:=RIGHTSUBMODELS_righttolefttabl;
indent:=RIGHTSUBMODELS_indent;
name:=RIGHTSUBMODELS_name;
level:=indent DIV 2;
prevrhslabels:=RIGHTSUBMODELS_prevrhslabels;
BEGIN  END;
LOCALTAB(rightcom,indent);
appendstring('PROCEDURE previous',rightcom);
 appendstring(mrucomDECL_convinttostring(level),rightcom);
 appendstring(';',rightcom);
appendstring('\\',rightcom);

LOCALTAB(rightcom,indent);
appendstring('BEGIN',rightcom);
appendstring('\\',rightcom);

WHILE stillidents(prevrhslabels) DO
BEGIN
takeident(id,prevrhslabels);
LOCALTAB(rightcom,indent);
appendstring('create',rightcom);
 appendstring(id.str,rightcom);
 appendstring(';',rightcom);
appendstring('\\',rightcom);

END;
IF level<>1 THEN
BEGIN
LOCALTAB(rightcom,indent);
appendstring('previous',rightcom);
 appendstring(mrucomDECL_convinttostring(level-1),rightcom);
 appendstring(';',rightcom);
appendstring('\\',rightcom);

END;
LOCALTAB(rightcom,indent);
appendstring('END;',rightcom);
appendstring('\\',rightcom);

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
  BEGIN 
LABELEDTD__submodeltree:=TRUE;
LABELEDTD__indent:=indent+2;
category:=currenttree^.ldfield.LABELEDTDfield^.category;
treevarname:=currenttree^.ldfield.LABELEDTDfield^.treevarname;
nodevarname:=currenttree^.ldfield.LABELEDTDfield^.nodevarname;
LABELEDTD__righttolefttable:=righttolefttable;
LABELEDTD__root:=currenttree^.ldfield.LABELEDTDfield^.rhslabel.str;
LABELEDTD__name:=name;
END
; mrucomCODE_LABELEDTDproc(currenttree
,LABELEDTD__indent
,LABELEDTD__name
,LABELEDTD__submodeltree
,LABELEDTD__righttolefttable
,LABELEDTD__root
,LABELEDTD__leftcom
,LABELEDTD__rightcom
,LABELEDTD__dtreeproc
,LABELEDTD__numberofitems
,LABELEDTD__keymentioned
,LABELEDTD__keyvar
,LABELEDTD__keystr1
,LABELEDTD__keystr2
,LABELEDTD__levelids
);
 BEGIN appendsets(LABELEDTD__levelids,levelids);
APPENDLOCFILE(LABELEDTD__leftcom,rightdecom);
appendlocfile(LABELEDTD__dtreeproc,dtreeproc);
keymentioned:=LABELEDTD__keymentioned;
keyvar:=LABELEDTD__keyvar;
keystr1:=LABELEDTD__keystr1;
keystr2:=LABELEDTD__keystr2;
rhslabel:=currenttree^.ldfield.LABELEDTDfield^.rhslabel;
recordname:=currenttree^.ldfield.LABELEDTDfield^.recordname;
BEGIN  END;
LOCALTAB(rightcom,indent);
appendstring('PROCEDURE create',rightcom);
 appendstring(rhslabel.str,rightcom);
 appendstring(';',rightcom);
appendstring('\\',rightcom);

IF NOT(present(rhslabel,commontreevarlist)) THEN
BEGIN
LOCALTAB(rightcom,indent);
appendstring('VAR s:LSSTREE_pstree;',rightcom);
appendstring('\\',rightcom);

LOCALTAB(rightcom,indent+4);
appendstring('list:LSMRUQUO_ListOfStrees;',rightcom);
appendstring('\\',rightcom);

APPENDlocfile(LABELEDTD__rightcom,rightcom);
END;
LOCALTAB(rightcom,indent);
appendstring('BEGIN{',rightcom);
 appendstring(rhslabel.str,rightcom);
 appendstring('}',rightcom);
appendstring('\\',rightcom);

IF NOT(present(rhslabel,commontreevarlist)) THEN
BEGIN
IF keymentioned THEN
BEGIN
appendstring('s:=',rightcom);
 appendstring(recordname,rightcom);
 appendstring('tree;',rightcom);
appendstring('\\',rightcom);

END
ELSE
IF currenttree^.ldfield.LABELEDTDfield^.basiccat THEN
BEGIN
IF TSTRING_comparechars(category,'GLUE',4)<>0 THEN
BEGIN
appendstring('s:=',rightcom);
 appendstring(recordname,rightcom);
 appendstring('tree;',rightcom);
appendstring('\\',rightcom);

END
ELSE
BEGIN
appendstring('s:=MAKET_stree(GLUE);',rightcom);
appendstring('\\',rightcom);

END
END
ELSE
BEGIN
IF (TSTRING_length(category)<>0) THEN
BEGIN
IF currenttree^.ldfield.LABELEDTDfield^.noderiv THEN
BEGIN
LOCALTAB(rightcom,indent);
appendstring('s:=MAKET_stree(',rightcom);
 appendstring(category,rightcom);
 appendstring(');',rightcom);
appendstring('\\',rightcom);

END;
LOCALTAB(rightcom,indent);
IF TSTRING_comparechars(category,'GLUE',4)<>0 THEN
BEGIN
appendstring('createnode(s);',rightcom);
appendstring('\\',rightcom);

END;
LOCALTAB(rightcom,indent);
IF currenttree^.ldfield.LABELEDTDfield^.noderiv THEN
BEGIN
appendstring('createlist1(list);',rightcom);
appendstring('\\',rightcom);

LOCALTAB(rightcom,indent);
appendstring('IF list.first<>NIL THEN list.last^.brother:=NIL;',rightcom);
appendstring('\\',rightcom);

LOCALTAB(rightcom,indent);
appendstring('s^.li^.n:=numberofelements(list);',rightcom);
appendstring('\\',rightcom);

LOCALTAB(rightcom,indent);
appendstring('s^.sons:=list.first;',rightcom);
appendstring('\\',rightcom);

END;
END
ELSE
BEGIN
IF TSTRING_length(treevarname)<>0 THEN
BEGIN
LOCALTAB(rightcom,indent);
appendstring('s:=',rightcom);
 appendstring(treevarname,rightcom);
 appendstring(';',rightcom);
appendstring('\\',rightcom);

END
ELSE
BEGIN
LOCALTAB(rightcom,indent);
appendstring('s:=MAKET_stree(',rightcom);
 appendstring(nodevarname,rightcom);
 appendstring('.cat);',rightcom);
appendstring('\\',rightcom);

LOCALTAB(rightcom,indent);
appendstring('createnode(s);',rightcom);
appendstring('\\',rightcom);

LOCALTAB(rightcom,indent);
IF currenttree^.ldfield.LABELEDTDfield^.noderiv THEN
BEGIN
appendstring('createlist1(list);',rightcom);
appendstring('\\',rightcom);

LOCALTAB(rightcom,indent);
appendstring('IF list.first<>NIL THEN list.last^.brother:=NIL;',rightcom);
appendstring('\\',rightcom);

LOCALTAB(rightcom,indent);
appendstring('s^.li^.n:=numberofelements(list);',rightcom);
appendstring('\\',rightcom);

LOCALTAB(rightcom,indent);
appendstring('s^.sons:=list.first;',rightcom);
appendstring('\\',rightcom);

END;
END
END;
END;
LOCALTAB(rightcom,indent);
appendstring(rhslabel.str,rightcom);
 appendstring(':=s;',rightcom);
appendstring('\\',rightcom);

END;
LOCALTAB(rightcom,indent);
appendstring('END{',rightcom);
 appendstring(rhslabel.str,rightcom);
 appendstring('};',rightcom);
appendstring('\\',rightcom);

END
END;

3: begin
  BEGIN LABELEDLD__submodellist:=TRUE;
LABELEDLD__indent:=indent+2;
LABELEDLD__inexist:=FALSE;
LABELEDLD__righttolefttable:=righttolefttable;
LABELEDLD__root:=currenttree^.ldfield.LABELEDLDfield^.rhslabel.str;
LABELEDLD__name:=name;
END
; mrucomCODE_LABELEDLDproc(currenttree
,LABELEDLD__indent
,LABELEDLD__righttolefttable
,LABELEDLD__submodellist
,LABELEDLD__inexist
,LABELEDLD__root
,LABELEDLD__name
,LABELEDLD__leftcom
,LABELEDLD__rightcom
,LABELEDLD__dtreeproc
,LABELEDLD__NumberOfItems
,LABELEDLD__levelids
);
 BEGIN 
appendlocfile(LABELEDLD__dtreeproc,dtreeproc);
APPENDLOCFILE(LABELEDLD__leftcom,rightdecom);
appendsets(LABELEDLD__levelids,levelids);
rhslabel:=currenttree^.ldfield.LABELEDLDfield^.rhslabel;
BEGIN  END;
LOCALTAB(rightcom,indent);
appendstring('PROCEDURE create',rightcom);
 appendstring(rhslabel.str,rightcom);
 appendstring(';',rightcom);
appendstring('\\',rightcom);

IF NOT(present(rhslabel,commonmuvarlist)) THEN
IF NOT(present(rhslabel,commonsigmavarlist)) THEN 
BEGIN
APPENDlocfile(LABELEDLD__rightcom,rightcom);
END;
LOCALTAB(rightcom,indent);
appendstring('BEGIN{',rightcom);
 appendstring(rhslabel.str,rightcom);
 appendstring('}',rightcom);
appendstring('\\',rightcom);

IF NOT(present(rhslabel,commonmuvarlist)) THEN
IF NOT(present(rhslabel,commonsigmavarlist)) THEN 
BEGIN
LOCALTAB(rightcom,indent);
appendstring('createlist1(',rightcom);
 appendstring(rhslabel.str,rightcom);
 appendstring(');',rightcom);
appendstring('\\',rightcom);

END;
LOCALTAB(rightcom,indent);
appendstring('END{',rightcom);
 appendstring(rhslabel.str,rightcom);
 appendstring('};',rightcom);
appendstring('\\',rightcom);

END
END;

4: begin
  BEGIN str:=currenttree^.ldfield.LABELEDDTREEfield^.str;
rhslabel.str:=currenttree^.ldfield.LABELEDDTREEfield^.labelstr;
TSTRING_append(name,'_');
TSTRING_append(name,counterstr);
TSTRING_append(name,'_');
TSTRING_append(name,rhslabel.str);
LABELEDDTREE__name:=name;

appendstring('PROCEDURE create',rightcom);
 appendstring(rhslabel.str,rightcom);
 appendstring(';',rightcom);
appendstring('\\',rightcom);

appendstring('VAR result:LISTREE_setofstrees;',rightcom);
appendstring('\\',rightcom);


appendstring('PROCEDURE Matchtree',rightdecom);
 appendstring(rhslabel.str,rightdecom);

appendstring('(VAR match:BOOLEAN;first:Boolean);',rightdecom);
appendstring('\\',rightdecom);

END
; mrucomCODE_LABELEDDTREEproc(currenttree
,LABELEDDTREE__name
,LABELEDDTREE__rightcom
,LABELEDDTREE__levelids
,LABELEDDTREE__comactions
,LABELEDDTREE__decomactions
,LABELEDDTREE__extern
);
 BEGIN appendlocfile(LABELEDDTREE__rightcom,dtreeproc);
extern:=LABELEDDTREE__extern;
appendlocfile(extern,rightcom);
savelocfile(extern,extern);
appendlocfile(extern,rightdecom);

appendstring('BEGIN',rightdecom);
appendstring('\\',rightdecom);

appendstring('dtree:=dtree',rightdecom);
 appendstring(name,rightdecom);
 appendstring(';',rightdecom);
appendstring('\\',rightdecom);

appendstring('match:=AIDDERIV_analyse(dtree,loopholes.retype(',rightdecom);
 
appendstring(rhslabel.str,rightdecom);
 appendstring(',LISTREE_pstree));',rightdecom);
appendstring('\\',rightdecom);

appendlocfile(LABELEDDTREE__decomactions,rightdecom);
appendstring('END;',rightdecom);
appendstring('\\',rightdecom);


appendstring('BEGIN',rightcom);
appendstring('\\',rightcom);

appendstring('dtree:=dtree',rightcom);
 appendstring(name,rightcom);
 appendstring(';',rightcom);
appendstring('\\',rightcom);

appendlocfile(LABELEDDTREE__comactions,rightcom);
appendstring('result:=GIDDERIV_generate(dtree);',rightcom);
appendstring('\\',rightcom);

appendstring('LISTREE_takestree(loopholes.retype(',rightcom);
 appendstring(rhslabel.str,rightcom);
 
appendstring(',LISTREE_pstree),result);',rightcom);
appendstring('\\',rightcom);

appendstring('END;',rightcom);
appendstring('\\',rightcom);

END
END;

END;

rsnode1:=rsnode1^.brother END;
BEGIN RIGHTSUBMODELS_rightcom:=rightcom;
RIGHTSUBMODELS_rightdecom:=rightdecom;
RIGHTSUBMODELS_levelids:=levelids;
RIGHTSUBMODELS_dtreeproc:=dtreeproc;
END
END;
PROCEDURE mrucomCODE_COMCAPAIRSproc(top:mrucomDECL_psnode
;COMCAPAIRS_actionteller              :mrucomlangspec_teller
;COMCAPAIRS_actiontellers              :mrucomlangspec_setoftellers
;COMCAPAIRS_indent              :mrucomlangspec_int
;COMCAPAIRS_syncattable              :mrucomlangspec_setofsyncats
;COMCAPAIRS_recordtable              :mrucomlangspec_setofidents
;COMCAPAIRS_modelnumber              :mrucomlangspec_int
;COMCAPAIRS_level              :mrucomlangspec_int
;COMCAPAIRS_insubrule              :mrucomlangspec_bool
;COMCAPAIRS_filter              :mrucomlangspec_bool
;COMCAPAIRS_vartypes              :mrucomlangspec_setofvartypes
;COMCAPAIRS_rhslabels              :mrucomlangspec_setofidents
;var COMCAPAIRS_conditions              :LOCALFILE
;var COMCAPAIRS_actions              :LOCALFILE
;var COMCAPAIRS_allexist              :LOCALFILE
;var COMCAPAIRS_allexistcounter              :mrucomlangspec_int
);
VAR currenttree:mrucomDECL_psnode;
    rsnode1:mrucomDECL_prsnode;
 actions,conditions:LOCALFILE;
rhslabels: mrucomLANGSPEC_setofidents;
indent: mrucomLANGSPEC_int;
insubrule: mrucomLANGSPEC_bool;
vartypes: mrucomLANGSPEC_setofvartypes;
recordtable: mrucomLANGSPEC_setofidents;
syncattable: mrucomLANGSPEC_setofsyncats;
BEGIN
 BEGIN rhslabels:=COMCAPAIRS_rhslabels;
indent:=COMCAPAIRS_indent;
insubrule:=COMCAPAIRS_insubrule;
vartypes:=COMCAPAIRS_vartypes;
syncattable:=COMCAPAIRS_syncattable;
recordtable:=COMCAPAIRS_recordtable;
INITLOCALFILE(conditions);

LOCALTAB(conditions,indent);
appendstring('IF match THEN',conditions);
appendstring('\\',conditions);

LOCALTAB(conditions,indent+2);
appendstring('BEGIN',conditions);
appendstring('\\',conditions);

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
  BEGIN CAPAIRS__vartypes:=vartypes;
CAPAIRS__allexistcounter:=0;
CAPAIRS__indent:=indent+2;
CAPAIRS__level:=indent DIV 2;
CAPAIRS__modelnumber:=0;
CAPAIRS__rhslabels:=rhslabels;
CAPAIRS__insubrule:=insubrule;
CAPAIRS__filter:=FALSE;
CAPAIRS__syncattable:=syncattable;
CAPAIRS__recordtable:=recordtable;
END
; mrucomCODE_CAPAIRSproc(currenttree
,CAPAIRS__actionteller
,CAPAIRS__actiontellers
,CAPAIRS__indent
,CAPAIRS__syncattable
,CAPAIRS__recordtable
,CAPAIRS__modelnumber
,CAPAIRS__level
,CAPAIRS__insubrule
,CAPAIRS__filter
,CAPAIRS__vartypes
,CAPAIRS__rhslabels
,CAPAIRS__conditions
,CAPAIRS__actions
,CAPAIRS__allexist
,CAPAIRS__allexistcounter
);
 BEGIN actions:=CAPAIRS__actions;
APPENDlocfile(CAPAIRS__conditions,conditions);
APPENDlocfile(CAPAIRS__allexist,actions);
END
END;

END;

rsnode1:=rsnode1^.brother END;
BEGIN COMCAPAIRS_actions:=actions;

LOCALTAB(conditions,indent+2);
appendstring('END;',CONDITIONS);
appendstring('\\',CONDITIONS);

COMCAPAIRS_conditions:=conditions;
END
END;
PROCEDURE mrucomCODE_DECOMCAPAIRSproc(top:mrucomDECL_psnode
;DECOMCAPAIRS_actionteller              :mrucomlangspec_teller
;DECOMCAPAIRS_actiontellers              :mrucomlangspec_setoftellers
;DECOMCAPAIRS_indent              :mrucomlangspec_int
;DECOMCAPAIRS_syncattable              :mrucomlangspec_setofsyncats
;DECOMCAPAIRS_recordtable              :mrucomlangspec_setofidents
;DECOMCAPAIRS_modelnumber              :mrucomlangspec_int
;DECOMCAPAIRS_level              :mrucomlangspec_int
;DECOMCAPAIRS_insubrule              :mrucomlangspec_bool
;DECOMCAPAIRS_filter              :mrucomlangspec_bool
;DECOMCAPAIRS_vartypes              :mrucomlangspec_setofvartypes
;DECOMCAPAIRS_rhslabels              :mrucomlangspec_setofidents
;var DECOMCAPAIRS_conditions              :LOCALFILE
;var DECOMCAPAIRS_actions              :LOCALFILE
;var DECOMCAPAIRS_allexist              :LOCALFILE
;var DECOMCAPAIRS_allexistcounter              :mrucomlangspec_int
);
VAR currenttree:mrucomDECL_psnode;
    rsnode1:mrucomDECL_prsnode;
 actions,conditions:LOCALFILE;
rhslabels: mrucomLANGSPEC_setofidents;
indent,modelnumber: mrucomLANGSPEC_int;
insubrule: mrucomLANGSPEC_bool;
vartypes: mrucomLANGSPEC_setofvartypes;
recordtable: mrucomLANGSPEC_setofidents;
syncattable: mrucomLANGSPEC_setofsyncats;
BEGIN
 BEGIN rhslabels:=DECOMCAPAIRS_rhslabels;
indent:=DECOMCAPAIRS_indent;
insubrule:=DECOMCAPAIRS_insubrule;
modelnumber:=DECOMCAPAIRS_modelnumber;
vartypes:=DECOMCAPAIRS_vartypes;
syncattable:=DECOMCAPAIRS_syncattable;
recordtable:=DECOMCAPAIRS_recordtable;
INITLOCALFILE(conditions);

LOCALTAB(conditions,indent);
appendstring('IF match THEN',conditions);
appendstring('\\',conditions);

LOCALTAB(conditions,indent+2);
appendstring('BEGIN',conditions);
appendstring('\\',conditions);

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
  BEGIN CAPAIRS__allexistcounter:=0;
CAPAIRS__indent:=indent;
CAPAIRS__level:=indent DIV 2;
CAPAIRS__rhslabels:=rhslabels;
CAPAIRS__modelnumber:=modelnumber;
CAPAIRS__filter:=FALSE;
CAPAIRS__insubrule:=insubrule;
CAPAIRS__vartypes:=vartypes;
CAPAIRS__syncattable:=syncattable;
CAPAIRS__recordtable:=recordtable;
END
; mrucomCODE_CAPAIRSproc(currenttree
,CAPAIRS__actionteller
,CAPAIRS__actiontellers
,CAPAIRS__indent
,CAPAIRS__syncattable
,CAPAIRS__recordtable
,CAPAIRS__modelnumber
,CAPAIRS__level
,CAPAIRS__insubrule
,CAPAIRS__filter
,CAPAIRS__vartypes
,CAPAIRS__rhslabels
,CAPAIRS__conditions
,CAPAIRS__actions
,CAPAIRS__allexist
,CAPAIRS__allexistcounter
);
 BEGIN actions:=CAPAIRS__actions;
APPENDlocfile(CAPAIRS__conditions,conditions);
APPENDlocfile(CAPAIRS__allexist,actions);
END
END;

END;

rsnode1:=rsnode1^.brother END;
BEGIN DECOMCAPAIRS_actions:= actions;

LOCALTAB(conditions,indent+2);
appendstring('END;',CONDITIONS);
appendstring('\\',CONDITIONS);

DECOMCAPAIRS_conditions:= conditions;
END
END;
PROCEDURE mrucomCODE_CAPAIRSproc(top:mrucomDECL_psnode
;CAPAIRS_actionteller              :mrucomlangspec_teller
;CAPAIRS_actiontellers              :mrucomlangspec_setoftellers
;CAPAIRS_indent              :mrucomlangspec_int
;CAPAIRS_syncattable              :mrucomlangspec_setofsyncats
;CAPAIRS_recordtable              :mrucomlangspec_setofidents
;CAPAIRS_modelnumber              :mrucomlangspec_int
;CAPAIRS_level              :mrucomlangspec_int
;CAPAIRS_insubrule              :mrucomlangspec_bool
;CAPAIRS_filter              :mrucomlangspec_bool
;CAPAIRS_vartypes              :mrucomlangspec_setofvartypes
;CAPAIRS_rhslabels              :mrucomlangspec_setofidents
;var CAPAIRS_conditions              :LOCALFILE
;var CAPAIRS_actions              :LOCALFILE
;var CAPAIRS_allexist              :LOCALFILE
;var CAPAIRS_allexistcounter              :mrucomlangspec_int
);
VAR currenttree:mrucomDECL_psnode;
    rsnode1:mrucomDECL_prsnode;
 actions,conditions,allexist:LOCALFILE;
actioncounters: mrucomLANGSPEC_setoftellers;
actionteller: mrucomLANGSPEC_teller;
actiontellers,actiontellers1: mrucomLANGSPEC_setoftellers;
allexistcounter,actioncounter,i: mrucomLANGSPEC_int;
modelnumber,indent,level: mrucomLANGSPEC_int;
keyIvar,insubrule,filter,deepestlevel: mrucomLANGSPEC_bool;
rhslabels,rhslabels1: mrucomLANGSPEC_setofidents;
id,ident: mrucomLANGSPEC_ident;
catname:TSTRING_string;
vartype: mrucomLANGSPEC_vartype;
syncat: mrucomLANGSPEC_syncat;
vartypes,vartypes1,vartypes2: mrucomLANGSPEC_setofvartypes;
syncattable1,syncattable: mrucomLANGSPEC_setofsyncats;
recordtable1,recordtable: mrucomLANGSPEC_setofidents;
 FUNCTION lastaction(VAR actiontellers: mrucomLANGSPEC_setoftellers):INTEGER;
VAR tellers1: mrucomLANGSPEC_setoftellers;
teller1: mrucomLANGSPEC_teller;
i: mrucomLANGSPEC_int;
BEGIN
i:=0;
initsetoftellers(tellers1);
WHILE stilltellers(actiontellers) DO
BEGIN
i:=i+1;
IF i<>1 THEN appendteller(teller1,tellers1);
taketeller(teller1,actiontellers)
END;
actiontellers:=tellers1;
lastaction:=teller1.int;
END;
PROCEDURE SelectCatName(recordname:TSTRING_string;
VAR catname:TSTRING_string);
VAR length:integer;
BEGIN
length:=TSTRING_Length(recordname);
IF recordname[length]='_' THEN length:=length-1;
IF recordname[length] IN ['0','1','2','3','4','5','6','7','8','9'] THEN
TSTRING_ExtractBegin(catname,recordname,length-4)
ELSE
TSTRING_ExtractBegin(catname,recordname,length-6);
END;
PROCEDURE APPENDSETS(S1: mrucomLANGSPEC_SETOFidents;VAR S2: mrucomLANGSPEC_SETOFidents);
VAR ident1: mrucomLANGSPEC_ident;
BEGIN
WHILE STILLidents(S1) DO
BEGIN
TAKEident(ident1,S1);
APPENDident(ident1,S2)
END
END;BEGIN
 BEGIN INITLOCALFILE(actions);
INITLOCALFILE(conditions);
actioncounters:=top^.ldfield.CAPAIRSfield^.actioncounters;
actiontellers:=CAPAIRS_actiontellers;
allexistcounter:=CAPAIRS_allexistcounter;
indent:=CAPAIRS_indent;
level:=CAPAIRS_level;
syncattable:=CAPAIRS_syncattable;
recordtable:=CAPAIRS_recordtable;
deepestlevel:=true;
INITLOCALFILE(allexist);
rhslabels:=CAPAIRS_rhslabels;
modelnumber:=CAPAIRS_modelnumber;
filter:=CAPAIRS_filter;
insubrule:=CAPAIRS_insubrule;
vartypes1:=CAPAIRS_vartypes;
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
  BEGIN CONDITION__actiontellers:=actiontellers;
CONDITION__allexistcounter:=allexistcounter;
CONDITION__vartypes:=vartypes1;
vartypes:=currenttree^.ldfield.CONDITIONfield^.vartypes;
vartypes2:=vartypes1;
WHILE stillvartypes(vartypes2) DO
BEGIN
takevartype(vartype,vartypes2);
appendvartype(vartype,vartypes);
END;
END
; mrucomCODE_CONDITIONproc(currenttree
,CONDITION__actiontellers
,CONDITION__vartypes
,CONDITION__copy
,CONDITION__allexist
,CONDITION__allexistcounter
,CONDITION__recattvals
);
 BEGIN allexistcounter:=CONDITION__allexistcounter;
APPENDlocfile(CONDITION__allexist,allexist);
BEGIN  END;
LOCALTAB(conditions,indent);
appendstring('IF ',conditions);

APPENDlocfile(CONDITION__copy,conditions);
appendstring(' THEN',conditions);
appendstring('\\',conditions);

LOCALTAB(conditions,indent+2);
appendstring('BEGIN',conditions);
appendstring('\\',conditions);

END
END;

3: begin
  BEGIN
deepestlevel:=false;
bareCAPAIRS__vartypes:=vartypes;
bareCAPAIRS__level:=level;
bareCAPAIRS__rhslabels:=rhslabels;
bareCAPAIRS__allexistcounter:=allexistcounter;
bareCAPAIRS__actiontellers:=actiontellers;
taketeller(actionteller,actioncounters);
APPENDteller(actionteller,bareCAPAIRS__actiontellers);
bareCAPAIRS__indent:=indent+2;
bareCAPAIRS__modelnumber:=modelnumber;
bareCAPAIRS__filter:=filter;
bareCAPAIRS__insubrule:=insubrule;
bareCAPAIRS__syncattable:=syncattable;
bareCAPAIRS__recordtable:=recordtable;
END
; mrucomCODE_bareCAPAIRSproc(currenttree
,bareCAPAIRS__actionteller
,bareCAPAIRS__actiontellers
,bareCAPAIRS__indent
,bareCAPAIRS__syncattable
,bareCAPAIRS__recordtable
,bareCAPAIRS__modelnumber
,bareCAPAIRS__level
,bareCAPAIRS__insubrule
,bareCAPAIRS__filter
,bareCAPAIRS__vartypes
,bareCAPAIRS__rhslabels
,bareCAPAIRS__conditions
,bareCAPAIRS__actions
,bareCAPAIRS__allexist
,bareCAPAIRS__allexistcounter
);
 BEGIN
APPENDlocfile(bareCAPAIRS__allexist,allexist);
allexistcounter:=bareCAPAIRS__allexistcounter;
APPENDlocfile(bareCAPAIRS__actions,actions);
APPENDlocfile(bareCAPAIRS__conditions,conditions);
END
END;

4: begin
  BEGIN ACTION__vartypes:=vartypes;
ACTION__deepestlevel:=deepestlevel;
END
; mrucomCODE_ACTIONproc(currenttree
,ACTION__vartypes
,ACTION__deepestlevel
,ACTION__actions
);
 BEGIN APPENDlocfile(ACTION__actions,actions);
BEGIN  END;
actioncounter:=currenttree^.ldfield.ACTIONfield^.counter;
IF deepestlevel AND not(filter) THEN
BEGIN
recordtable1:=recordtable;
WHILE stillidents(recordtable1) DO
BEGIN
takeident(ident,recordtable1);
selectcatname(ident.str,catname);
LOCALTAB(conditions,indent+2);
appendstring('MAKET_',conditions);
 appendstring(catname,conditions);
 appendstring('rec(',conditions);

appendstring(ident.str,conditions);
 appendstring(');',conditions);
appendstring('\\',conditions);

END;
syncattable1:=syncattable;
keyIvar:=FALSE;
WHILE stillsyncats(syncattable1) AND NOT(keyIvar) DO
BEGIN {bepaal of acties twee maal moeten, eerste keer om 
waarde van keyappendstring('i',conditions);
 te bepalen}
takesyncat(syncat,syncattable1);
keyIvar:=syncat.keyIvar
END;
IF keyIvar THEN
BEGIN
LOCALTAB(conditions,indent+2);
appendstring('action',conditions);
 appendstring(mrucomDECL_convinttostring(actioncounter),conditions);
 appendstring(';',conditions);
appendstring('\\',conditions);

actiontellers1:=actiontellers;
WHILE stilltellers(actiontellers1) DO
BEGIN
LOCALTAB(conditions,indent+2);
appendstring('action',conditions);
 appendstring(mrucomDECL_convinttostring(lastaction(actiontellers1)),conditions);
 appendstring(';',conditions);
appendstring('\\',conditions);

END;
END;
syncattable1:=syncattable;
WHILE stillsyncats(syncattable1) DO
BEGIN
takesyncat(syncat,syncattable1);
IF syncat.keyIvar THEN
BEGIN
LOCALTAB(conditions,indent+2);
appendstring('hulpstree:=LDBLEX_read(',conditions);

IF TSTRING_length(syncat.str2)=0 THEN 
IF NOT(syncat.keyIvar) THEN appendstring('auxkey(''',conditions);
 
appendstring(syncat.str1,conditions);
 
IF TSTRING_length(syncat.str2)=0 THEN 
IF NOT(syncat.keyIvar) THEN appendstring(''')',conditions);

IF TSTRING_length(syncat.str2)<>0 THEN 
BEGIN
appendstring('.',conditions);
 appendstring(syncat.str2,conditions);
 
END;
appendstring(');',conditions);
appendstring('\\',conditions);

LOCALTAB(conditions,indent+2);
appendstring(syncat.recordname,conditions);
 appendstring('tree:=loopholes.retype',conditions);

appendstring('(hulpstree,LSSTREE_pstree);',conditions);
appendstring('\\',conditions);

LOCALTAB(conditions,indent+2);
selectcatname(syncat.recordname,catname);
appendstring(syncat.recordname,conditions);
 appendstring(':=',conditions);
 appendstring(syncat.recordname,conditions);

appendstring('tree^.ls^.',conditions);
 appendstring(catname,conditions);

appendstring('field^;',conditions);
appendstring('\\',conditions);

END;
END;
syncattable1:=syncattable;
WHILE stillsyncats(syncattable1) DO
BEGIN
takesyncat(syncat,syncattable1);
IF NOT syncat.keyIvar THEN
BEGIN
LOCALTAB(conditions,indent+2);
appendstring('hulpstree:=LDBLEX_read(',conditions);

IF TSTRING_length(syncat.str2)=0 THEN 
IF NOT(syncat.keyIvar) THEN appendstring('auxkey(''',conditions);
 
appendstring(syncat.str1,conditions);
 
IF TSTRING_length(syncat.str2)=0 THEN 
IF NOT(syncat.keyIvar) THEN appendstring(''')',conditions);

IF TSTRING_length(syncat.str2)<>0 THEN 
BEGIN
appendstring('.',conditions);
 appendstring(syncat.str2,conditions);
 
END;
appendstring(');',conditions);
appendstring('\\',conditions);

LOCALTAB(conditions,indent+2);
appendstring(syncat.recordname,conditions);
 appendstring('tree:=loopholes.retype',conditions);

appendstring('(hulpstree,LSSTREE_pstree);',conditions);
appendstring('\\',conditions);

LOCALTAB(conditions,indent+2);
selectcatname(syncat.recordname,catname);
appendstring(syncat.recordname,conditions);
 appendstring(':=',conditions);
 appendstring(syncat.recordname,conditions);

appendstring('tree^.ls^.',conditions);
 appendstring(catname,conditions);

appendstring('field^;',conditions);
appendstring('\\',conditions);

END;
END;
LOCALTAB(conditions,indent+2);
appendstring('action',conditions);
 appendstring(mrucomDECL_convinttostring(actioncounter),conditions);
 appendstring(';',conditions);
appendstring('\\',conditions);

actiontellers1:=actiontellers;
WHILE stilltellers(actiontellers1) DO
BEGIN
LOCALTAB(conditions,indent+2);
appendstring('action',conditions);
 appendstring(mrucomDECL_convinttostring(lastaction(actiontellers1)),conditions);
 appendstring(';',conditions);
appendstring('\\',conditions);

END;
rhslabels1:=rhslabels;
WHILE stillidents(rhslabels1) DO
BEGIN
takeident(id,rhslabels1);
LOCALTAB(conditions,indent+2);
appendstring('create',conditions);
 appendstring(id.str,conditions);
 appendstring(';',conditions);
appendstring('\\',conditions);

END;
IF insubrule THEN
BEGIN
LOCALTAB(conditions,indent+2);
appendstring('previous',conditions);
 appendstring(mrucomDECL_convinttostring(level),conditions);
 appendstring(';',conditions);
appendstring('\\',conditions);

END
ELSE
BEGIN
IF modelnumber=0 THEN
BEGIN
LOCALTAB(conditions,indent+2);
appendstring('createM;',conditions);
appendstring('\\',conditions);

END
ELSE
BEGIN
i:=0;
WHILE i<>modelnumber DO
BEGIN
i:=i+1;
LOCALTAB(conditions,indent+2);
appendstring('createM',conditions);
 appendstring(mrucomDECL_convinttostring(i),conditions);
 appendstring(';',conditions);
appendstring('\\',conditions);

END;
END;
END;
IF modelnumber=0 THEN
BEGIN
LOCALTAB(conditions,indent+2);
appendstring('Is:=loopholes.retype(m,LISTREE_pstree);',conditions);
appendstring('\\',conditions);

LOCALTAB(conditions,indent+2);
appendstring('IF Is<>NIL THEN ',conditions);

appendstring('LISTREE_appendstreebonus(Is,result,wbonus);',conditions);
appendstring('\\',conditions);

END
ELSE
BEGIN
LOCALTAB(conditions,indent+2);
appendstring('LISTREE_emptytuple(tuple);',conditions);
appendstring('\\',conditions);

i:=0;
WHILE i<>modelnumber DO
BEGIN
i:=i+1;
LOCALTAB(conditions,indent+2);
appendstring('Is',conditions);
 appendstring(mrucomDECL_convinttostring(i),conditions);
 appendstring(':=loopholes.retype(m',conditions);

appendstring(mrucomDECL_convinttostring(i),conditions);
 appendstring(',LISTREE_pstree);',conditions);
appendstring('\\',conditions);

LOCALTAB(conditions,indent+2);
appendstring('LISTREE_addtotuple(Is',conditions);
 appendstring(mrucomDECL_convinttostring(i),conditions);
 appendstring(',tuple);',conditions);
appendstring('\\',conditions);

END;
LOCALTAB(conditions,indent+2);
appendstring('LISTREE_appendtupleofstreesbon(tuple,result,wbonus);',conditions);
appendstring('\\',conditions);

END;
END;
IF deepestlevel AND filter THEN
BEGIN
LOCALTAB(conditions,indent+2);
appendstring('result:=NIL;',conditions);
appendstring('\\',conditions);

END;
LOCALTAB(conditions,indent+2);
appendstring('END;',conditions);
appendstring('\\',conditions);

deepestlevel:=true;
END
END;

END;

rsnode1:=rsnode1^.brother END;
BEGIN 
CAPAIRS_allexist:=allexist;
CAPAIRS_actions:=actions;
CAPAIRS_conditions:=conditions;
CAPAIRS_allexistcounter:=allexistcounter;
END
END;
PROCEDURE mrucomCODE_bareCAPAIRSproc(top:mrucomDECL_psnode
;bareCAPAIRS_actionteller              :mrucomlangspec_teller
;bareCAPAIRS_actiontellers              :mrucomlangspec_setoftellers
;bareCAPAIRS_indent              :mrucomlangspec_int
;bareCAPAIRS_syncattable              :mrucomlangspec_setofsyncats
;bareCAPAIRS_recordtable              :mrucomlangspec_setofidents
;bareCAPAIRS_modelnumber              :mrucomlangspec_int
;bareCAPAIRS_level              :mrucomlangspec_int
;bareCAPAIRS_insubrule              :mrucomlangspec_bool
;bareCAPAIRS_filter              :mrucomlangspec_bool
;bareCAPAIRS_vartypes              :mrucomlangspec_setofvartypes
;bareCAPAIRS_rhslabels              :mrucomlangspec_setofidents
;var bareCAPAIRS_conditions              :LOCALFILE
;var bareCAPAIRS_actions              :LOCALFILE
;var bareCAPAIRS_allexist              :LOCALFILE
;var bareCAPAIRS_allexistcounter              :mrucomlangspec_int
);
VAR currenttree:mrucomDECL_psnode;
    rsnode1:mrucomDECL_prsnode;
 actionteller: mrucomLANGSPEC_teller;
actiontellers,actiontellers1,actioncounters: mrucomLANGSPEC_setoftellers;
allexist,actions,conditions:LOCALFILE;
modelnumber,allexistcounter,level,indent,actioncounter,i: mrucomLANGSPEC_int;
keyIvar,insubrule,filter,deepestlevel: mrucomLANGSPEC_bool;
rhslabels,rhslabels1: mrucomLANGSPEC_setofidents;
id,ident: mrucomLANGSPEC_ident;
catname:TSTRING_string;
vartype: mrucomLANGSPEC_vartype;
syncat: mrucomLANGSPEC_syncat;
vartypes,vartypes1,vartypes2: mrucomLANGSPEC_setofvartypes;
syncattable1,syncattable: mrucomLANGSPEC_setofsyncats;
recordtable1,recordtable: mrucomLANGSPEC_setofidents;
 FUNCTION lastaction(VAR actiontellers: mrucomLANGSPEC_setoftellers):INTEGER;
VAR tellers1: mrucomLANGSPEC_setoftellers;
teller1: mrucomLANGSPEC_teller;
i: mrucomLANGSPEC_int;
BEGIN
i:=0;
initsetoftellers(tellers1);
WHILE stilltellers(actiontellers) DO
BEGIN
i:=i+1;
IF i<>1 THEN appendteller(teller1,tellers1);
taketeller(teller1,actiontellers)
END;
actiontellers:=tellers1;
lastaction:=teller1.int;
END;
PROCEDURE SelectCatName(recordname:TSTRING_string;
VAR catname:TSTRING_string);
VAR length:integer;
BEGIN
length:=TSTRING_Length(recordname);
IF recordname[length]='_' THEN length:=length-1;
IF recordname[length] IN ['0','1','2','3','4','5','6','7','8','9'] THEN
TSTRING_ExtractBegin(catname,recordname,length-4)
ELSE
TSTRING_ExtractBegin(catname,recordname,length-6);
END;
PROCEDURE APPENDSETS(S1: mrucomLANGSPEC_SETOFidents;VAR S2: mrucomLANGSPEC_SETOFidents);
VAR ident1: mrucomLANGSPEC_ident;
BEGIN
WHILE STILLidents(S1) DO
BEGIN
TAKEident(ident1,S1);
APPENDident(ident1,S2)
END
END;BEGIN
 BEGIN vartypes:=bareCAPAIRS_vartypes;
actioncounters:= top^.ldfield.bareCAPAIRSfield^.actioncounters;
actiontellers:= bareCAPAIRS_actiontellers;
INITLOCALFILE(actions); INITLOCALFILE(conditions);
INITLOCALFILE(allexist);
allexistcounter:=bareCAPAIRS_allexistcounter;
indent:=bareCAPAIRS_indent;
level:=bareCAPAIRS_level;
syncattable:=bareCAPAIRS_syncattable;
recordtable:=bareCAPAIRS_recordtable;
deepestlevel:=true;
modelnumber:=bareCAPAIRS_modelnumber;
rhslabels:=bareCAPAIRS_rhslabels;
insubrule:=bareCAPAIRS_insubrule;
filter:=bareCAPAIRS_filter;
END;
rsnode1:=top^.sonlist;
  while rsnode1<>nil do
  begin
  currenttree:=rsnode1^.node;
  case rsnode1^.sonnumber of

2: begin
  BEGIN CONDITION__actiontellers:=actiontellers;
CONDITION__allexistcounter:=allexistcounter;
CONDITION__vartypes:=vartypes;
vartypes1:=currenttree^.ldfield.CONDITIONfield^.vartypes;
vartypes2:=vartypes;
WHILE stillvartypes(vartypes2) DO
BEGIN
takevartype(vartype,vartypes2);
appendvartype(vartype,vartypes1);
END;
END
; mrucomCODE_CONDITIONproc(currenttree
,CONDITION__actiontellers
,CONDITION__vartypes
,CONDITION__copy
,CONDITION__allexist
,CONDITION__allexistcounter
,CONDITION__recattvals
);
 BEGIN allexistcounter:=CONDITION__allexistcounter;
APPENDlocfile(CONDITION__allexist,allexist);
BEGIN  END;
LOCALTAB(conditions,indent);
appendstring('IF ',conditions);

APPENDlocfile(CONDITION__copy,conditions);
appendstring(' THEN',conditions);
appendstring('\\',conditions);

LOCALTAB(conditions,indent+2);
appendstring('BEGIN',conditions);
appendstring('\\',conditions);

END
END;

3: begin
  BEGIN
deepestlevel:=false;
bareCAPAIRS__vartypes:=vartypes1;
bareCAPAIRS__level:=level;
bareCAPAIRS__rhslabels:=rhslabels;
bareCAPAIRS__allexistcounter:=allexistcounter;
bareCAPAIRS__actiontellers:=actiontellers;
taketeller(actionteller,actioncounters);
APPENDteller(actionteller,bareCAPAIRS__actiontellers) ;
bareCAPAIRS__indent:=indent+2;
bareCAPAIRS__modelnumber:=modelnumber;
bareCAPAIRS__filter:=filter;
bareCAPAIRS__insubrule:=insubrule;
bareCAPAIRS__syncattable:=syncattable;
bareCAPAIRS__recordtable:=recordtable;
END
; mrucomCODE_bareCAPAIRSproc(currenttree
,bareCAPAIRS__actionteller
,bareCAPAIRS__actiontellers
,bareCAPAIRS__indent
,bareCAPAIRS__syncattable
,bareCAPAIRS__recordtable
,bareCAPAIRS__modelnumber
,bareCAPAIRS__level
,bareCAPAIRS__insubrule
,bareCAPAIRS__filter
,bareCAPAIRS__vartypes
,bareCAPAIRS__rhslabels
,bareCAPAIRS__conditions
,bareCAPAIRS__actions
,bareCAPAIRS__allexist
,bareCAPAIRS__allexistcounter
);
 BEGIN
APPENDlocfile(bareCAPAIRS__allexist,allexist);
allexistcounter:=bareCAPAIRS__allexistcounter;
APPENDlocfile(bareCAPAIRS__actions,actions);
APPENDlocfile(bareCAPAIRS__conditions,conditions);
END
END;

4: begin
  BEGIN ACTION__vartypes:=vartypes1;
ACTION__deepestlevel:=deepestlevel;
END
; mrucomCODE_ACTIONproc(currenttree
,ACTION__vartypes
,ACTION__deepestlevel
,ACTION__actions
);
 BEGIN APPENDlocfile(ACTION__actions,actions);
BEGIN  END;
actioncounter:=currenttree^.ldfield.ACTIONfield^.counter;
IF deepestlevel AND not(filter) THEN
BEGIN
recordtable1:=recordtable;
WHILE stillidents(recordtable1) DO
BEGIN
takeident(ident,recordtable1);
selectcatname(ident.str,catname);
LOCALTAB(conditions,indent+2);
appendstring('MAKET_',conditions);
 appendstring(catname,conditions);
 appendstring('rec(',conditions);

appendstring(ident.str,conditions);
 appendstring(');',conditions);
appendstring('\\',conditions);

END;
syncattable1:=syncattable;
keyIvar:=FALSE;
WHILE stillsyncats(syncattable1) AND NOT(keyIvar) DO
BEGIN {bepaal of acties twee maal moeten, eerste keer om 
waarde van keyappendstring('i',conditions);
 te bepalen}
takesyncat(syncat,syncattable1);
keyIvar:=syncat.keyIvar
END;
IF keyIvar THEN
BEGIN
LOCALTAB(conditions,indent+2);
appendstring('action',conditions);
 appendstring(mrucomDECL_convinttostring(actioncounter),conditions);
 appendstring(';',conditions);
appendstring('\\',conditions);

actiontellers1:=actiontellers;
WHILE stilltellers(actiontellers1) DO
BEGIN
LOCALTAB(conditions,indent+2);
appendstring('action',conditions);
 appendstring(mrucomDECL_convinttostring(lastaction(actiontellers1)),conditions);
 appendstring(';',conditions);
appendstring('\\',conditions);

END;
END;
syncattable1:=syncattable;
WHILE stillsyncats(syncattable1) DO
BEGIN
takesyncat(syncat,syncattable1);
IF syncat.keyIvar THEN
BEGIN
LOCALTAB(conditions,indent+2);
appendstring('hulpstree:=LDBLEX_read(',conditions);

IF TSTRING_length(syncat.str2)=0 THEN 
IF NOT(syncat.keyIvar) THEN appendstring('auxkey(''',conditions);
 
appendstring(syncat.str1,conditions);
 
IF TSTRING_length(syncat.str2)=0 THEN 
IF NOT(syncat.keyIvar) THEN appendstring(''')',conditions);

IF TSTRING_length(syncat.str2)<>0 THEN 
BEGIN
appendstring('.',conditions);
 appendstring(syncat.str2,conditions);
 
END;
appendstring(');',conditions);
appendstring('\\',conditions);

LOCALTAB(conditions,indent+2);
appendstring(syncat.recordname,conditions);
 appendstring('tree:=loopholes.retype',conditions);

appendstring('(hulpstree,LSSTREE_pstree);',conditions);
appendstring('\\',conditions);

LOCALTAB(conditions,indent+2);
selectcatname(syncat.recordname,catname);
appendstring(syncat.recordname,conditions);
 appendstring(':=',conditions);
 appendstring(syncat.recordname,conditions);

appendstring('tree^.ls^.',conditions);
 appendstring(catname,conditions);

appendstring('field^;',conditions);
appendstring('\\',conditions);

END;
END;
syncattable1:=syncattable;
WHILE stillsyncats(syncattable1) DO
BEGIN
takesyncat(syncat,syncattable1);
IF NOT syncat.keyIvar THEN
BEGIN
LOCALTAB(conditions,indent+2);
appendstring('hulpstree:=LDBLEX_read(',conditions);

IF TSTRING_length(syncat.str2)=0 THEN 
IF NOT(syncat.keyIvar) THEN appendstring('auxkey(''',conditions);
 
appendstring(syncat.str1,conditions);
 
IF TSTRING_length(syncat.str2)=0 THEN 
IF NOT(syncat.keyIvar) THEN appendstring(''')',conditions);

IF TSTRING_length(syncat.str2)<>0 THEN 
BEGIN
appendstring('.',conditions);
 appendstring(syncat.str2,conditions);
 
END;
appendstring(');',conditions);
appendstring('\\',conditions);

LOCALTAB(conditions,indent+2);
appendstring(syncat.recordname,conditions);
 appendstring('tree:=loopholes.retype',conditions);

appendstring('(hulpstree,LSSTREE_pstree);',conditions);
appendstring('\\',conditions);

LOCALTAB(conditions,indent+2);
selectcatname(syncat.recordname,catname);
appendstring(syncat.recordname,conditions);
 appendstring(':=',conditions);
 appendstring(syncat.recordname,conditions);

appendstring('tree^.ls^.',conditions);
 appendstring(catname,conditions);

appendstring('field^;',conditions);
appendstring('\\',conditions);

END;
END;
LOCALTAB(conditions,indent+2);
appendstring('action',conditions);
 appendstring(mrucomDECL_convinttostring(actioncounter),conditions);
 appendstring(';',conditions);
appendstring('\\',conditions);

actiontellers1:=actiontellers;
WHILE stilltellers(actiontellers1) DO
BEGIN
LOCALTAB(conditions,indent+2);
appendstring('action',conditions);
 appendstring(mrucomDECL_convinttostring(lastaction(actiontellers1)),conditions);
 appendstring(';',conditions);
appendstring('\\',conditions);

END;
rhslabels1:=rhslabels;
WHILE stillidents(rhslabels1) DO
BEGIN
takeident(id,rhslabels1);
LOCALTAB(conditions,indent+2);
appendstring('create',conditions);
 appendstring(id.str,conditions);
 appendstring(';',conditions);
appendstring('\\',conditions);

END;
IF insubrule THEN
BEGIN
LOCALTAB(conditions,indent+2);
appendstring('previous',conditions);
 appendstring(mrucomDECL_convinttostring(level),conditions);
 appendstring(';',conditions);
appendstring('\\',conditions);

END
ELSE
BEGIN
IF modelnumber=0 THEN
BEGIN
LOCALTAB(conditions,indent+2);
appendstring('createM;',conditions);
appendstring('\\',conditions);

END
ELSE
BEGIN
i:=0;
WHILE i<>modelnumber DO
BEGIN
i:=i+1;
LOCALTAB(conditions,indent+2);
appendstring('createM',conditions);
 appendstring(mrucomDECL_convinttostring(i),conditions);
 appendstring(';',conditions);
appendstring('\\',conditions);

END;
END;
END;
IF modelnumber=0 THEN
BEGIN
LOCALTAB(conditions,indent+2);
appendstring('Is:=loopholes.retype(m,LISTREE_pstree);',conditions);
appendstring('\\',conditions);

LOCALTAB(conditions,indent+2);
appendstring('LISTREE_appendstreebonus(Is,result,wbonus);',conditions);
appendstring('\\',conditions);

END
ELSE
BEGIN
LOCALTAB(conditions,indent+2);
appendstring('LISTREE_emptytuple(tuple);',conditions);
appendstring('\\',conditions);

i:=0;
WHILE i<>modelnumber DO
BEGIN
i:=i+1;
LOCALTAB(conditions,indent+2);
appendstring('Is',conditions);
 appendstring(mrucomDECL_convinttostring(i),conditions);
 appendstring(':=loopholes.retype(m',conditions);

appendstring(mrucomDECL_convinttostring(i),conditions);
 appendstring(',LISTREE_pstree);',conditions);
appendstring('\\',conditions);

LOCALTAB(conditions,indent+2);
appendstring('LISTREE_addtotuple(Is',conditions);
 appendstring(mrucomDECL_convinttostring(i),conditions);
 appendstring(',tuple);',conditions);
appendstring('\\',conditions);

END;
LOCALTAB(conditions,indent+2);
appendstring('LISTREE_appendtupleofstreesbon(tuple,result,wbonus);',conditions);
appendstring('\\',conditions);

END;
END;
IF deepestlevel AND filter THEN
BEGIN
LOCALTAB(conditions,indent+2);
appendstring('result:=NIL;',conditions);
appendstring('\\',conditions);

END;
LOCALTAB(conditions,indent+2);
appendstring('END;',conditions);
appendstring('\\',conditions);

deepestlevel:=true;
END
END;

END;

rsnode1:=rsnode1^.brother END;
BEGIN 
bareCAPAIRS_allexist:=allexist;
bareCAPAIRS_conditions:=conditions;
bareCAPAIRS_actions:=actions;
bareCAPAIRS_allexistcounter:=allexistcounter;
END
END;
PROCEDURE mrucomCODE_CONDITIONproc(top:mrucomDECL_psnode
;CONDITION_actiontellers              :mrucomlangspec_setoftellers
;CONDITION_vartypes              :mrucomlangspec_setofvartypes
;var CONDITION_copy              :LOCALFILE
;var CONDITION_allexist              :LOCALFILE
;var CONDITION_allexistcounter              :mrucomlangspec_int
;var CONDITION_recattvals              :mrucomlangspec_setofrecattvals
);
VAR currenttree:mrucomDECL_psnode;
    rsnode1:mrucomDECL_prsnode;
 copy,allexist:LOCALFILE;
allexistcounter: mrucomLANGSPEC_int;
vartypes: mrucomLANGSPEC_setofvartypes;
BEGIN
 BEGIN allexistcounter:=CONDITION_allexistcounter;
vartypes:=CONDITION_vartypes;
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
;
 BEGIN END
END;

3: begin
  BEGIN ANDCOND__allexistcounter:=allexistcounter;
ANDCOND__vartypes:=vartypes;
ANDCOND__toplevel:=TRUE;
END
; mrucomCODE_ANDCONDproc(currenttree
,ANDCOND__indent
,ANDCOND__toplevel
,ANDCOND__vartypes
,ANDCOND__commatchfile
,ANDCOND__decommatchfile
,ANDCOND__allexist
,ANDCOND__allexistcounter
);
 BEGIN copy:=ANDCOND__commatchfile;
allexist:=ANDCOND__allexist;
allexistcounter:=ANDCOND__allexistcounter;
END
END;

END;

rsnode1:=rsnode1^.brother END;
BEGIN CONDITION_copy:=copy;
CONDITION_allexist:=allexist;
CONDITION_allexistcounter:=allexistcounter;
END
END;
PROCEDURE mrucomCODE_ACTIONproc(top:mrucomDECL_psnode
;ACTION_vartypes              :mrucomlangspec_setofvartypes
;ACTION_deepestlevel              :mrucomlangspec_bool
;var ACTION_actions              :LOCALFILE
);
VAR currenttree:mrucomDECL_psnode;
    rsnode1:mrucomDECL_prsnode;
 actioncounter:INTEGER;
actions:LOCALFILE;
vartypes: mrucomLANGSPEC_setofvartypes;
deepestlevel,bonuspres: mrucomLANGSPEC_bool;
BEGIN
 BEGIN actioncounter:= top^.ldfield.ACTIONfield^.counter;
deepestlevel:=ACTION_deepestlevel;
bonuspres:=FALSE;
vartypes:=ACTION_vartypes;
INITLOCALFILE(actions);
BEGIN  END;
appendstring('PROCEDURE ACTION',actions);
 appendstring(mrucomDECL_convinttostring(actioncounter),actions);
 appendstring(';',actions);
appendstring('\\',actions);

appendstring('BEGIN',actions);
appendstring('\\',actions);

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
;
 BEGIN END
END;

3: begin
  BEGIN STATEMENTS__vartypes:=vartypes END
; mrucomCODE_STATEMENTSproc(currenttree
,STATEMENTS__vartypes
,STATEMENTS__copy
);
 BEGIN APPENDlocfile(STATEMENTS__copy,actions) END
END;

4: begin
  BEGIN END
;
 BEGIN END
END;

5: begin
  BEGIN bonuspres:=TRUE;
END
; mrucomCODE_BONUSspecproc(currenttree
,BONUSspec__bonusfile
);
 BEGIN APPENDLOCFILE(BONUSSPEC__bonusfile,actions) END
END;

END;

rsnode1:=rsnode1^.brother END;
BEGIN 
BEGIN  END;
IF deepestlevel THEN IF NOT bonuspres THEN BEGIN appendstring(';wbonus:=0;sbonus:=0',actions);
appendstring('\\',actions);
 END;
appendstring('\\',actions);
appendstring('END;',actions);
appendstring('\\',actions);

ACTION_actions:=actions 
END
END;
PROCEDURE mrucomCODE_STATEMENTSproc(top:mrucomDECL_psnode
;STATEMENTS_vartypes              :mrucomlangspec_setofvartypes
;var STATEMENTS_copy              :LOCALFILE
);
VAR currenttree:mrucomDECL_psnode;
    rsnode1:mrucomDECL_prsnode;
 copy:LOCALFILE;
vartypes: mrucomLANGSPEC_setofvartypes;
BEGIN
 BEGIN INITlocalfile(copy);vartypes:=STATEMENTS_vartypes; END;
rsnode1:=top^.sonlist;
  while rsnode1<>nil do
  begin
  currenttree:=rsnode1^.node;
  case rsnode1^.sonnumber of

1: begin
  BEGIN BEGIN  appendstring(';',copy);
 appendstring('\\',copy);
 END;
END
;
 BEGIN END
END;

2: begin
  BEGIN PASCALSTATEMENT__vartypes:=vartypes END
; mrucomCODE_PASCALSTATEMENTproc(currenttree
,PASCALSTATEMENT__vartypes
,PASCALSTATEMENT__copy
);
 BEGIN APPENDLOCFILE(PASCALSTATEMENT__copy,copy) END
END;

3: begin
  BEGIN END
; mrucomCODE_ASSIGNRECORDproc(currenttree
,ASSIGNRECORD__copy
);
 BEGIN APPENDLOCFILE(ASSIGNRECORD__copy,copy) END
END;

END;

rsnode1:=rsnode1^.brother END;
BEGIN STATEMENTS_copy:=copy 
END
END;
PROCEDURE mrucomCODE_KEYNAMEproc(top:mrucomDECL_psnode
);
VAR currenttree:mrucomDECL_psnode;
    rsnode1:mrucomDECL_prsnode;

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

2: begin
  BEGIN END
;
 BEGIN END
END;

3: begin
  BEGIN END
;
 BEGIN END
END;

4: begin
  BEGIN END
;
 BEGIN END
END;

5: begin
  BEGIN END
;
 BEGIN END
END;

6: begin
  BEGIN END
;
 BEGIN END
END;

7: begin
  BEGIN END
;
 BEGIN END
END;

8: begin
  BEGIN END
;
 BEGIN END
END;

END;

rsnode1:=rsnode1^.brother END;
BEGIN END
END;
PROCEDURE mrucomCODE_TREEVARproc(top:mrucomDECL_psnode
;var TREEVAR_ident              :TSTRING_string
);
VAR currenttree:mrucomDECL_psnode;
    rsnode1:mrucomDECL_prsnode;
 variable:TSTRING_string;
BEGIN
 BEGIN TSTRING_constantempty(variable) END;
rsnode1:=top^.sonlist;
  while rsnode1<>nil do
  begin
  currenttree:=rsnode1^.node;
  case rsnode1^.sonnumber of

1: begin
  BEGIN variable:=currenttree^.ldfield.TERMINAL^.str END
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
TREEVAR_ident:=variable;
END
END;
PROCEDURE mrucomCODE_MUVARproc(top:mrucomDECL_psnode
;var MUVAR_ident              :TSTRING_string
);
VAR currenttree:mrucomDECL_psnode;
    rsnode1:mrucomDECL_prsnode;
 variable:TSTRING_string; 
BEGIN
 BEGIN TSTRING_constantempty(variable)
END;
rsnode1:=top^.sonlist;
  while rsnode1<>nil do
  begin
  currenttree:=rsnode1^.node;
  case rsnode1^.sonnumber of

1: begin
  BEGIN variable:=currenttree^.ldfield.TERMINAL^.str END
;
 BEGIN END
END;

END;

rsnode1:=rsnode1^.brother END;
BEGIN 
MUVAR_ident:=variable;
END;
END;
PROCEDURE mrucomCODE_SIGMAVARproc(top:mrucomDECL_psnode
;var SIGMAVAR_ident              :TSTRING_string
);
VAR currenttree:mrucomDECL_psnode;
    rsnode1:mrucomDECL_prsnode;
 variable:TSTRING_string;
BEGIN
 BEGIN TSTRING_constantempty(variable)
END;
rsnode1:=top^.sonlist;
  while rsnode1<>nil do
  begin
  currenttree:=rsnode1^.node;
  case rsnode1^.sonnumber of

1: begin
  BEGIN variable:=currenttree^.ldfield.TERMINAL^.str END
;
 BEGIN END
END;

END;

rsnode1:=rsnode1^.brother END;
BEGIN
SIGMAVAR_ident:=variable;
END
END;
PROCEDURE mrucomCODE_NODEVARproc(top:mrucomDECL_psnode
;var NODEVAR_ident              :TSTRING_string
);
VAR currenttree:mrucomDECL_psnode;
    rsnode1:mrucomDECL_prsnode;
 variable:TSTRING_string; 
BEGIN
 BEGIN END;
rsnode1:=top^.sonlist;
  while rsnode1<>nil do
  begin
  currenttree:=rsnode1^.node;
  case rsnode1^.sonnumber of

1: begin
  BEGIN variable:=currenttree^.ldfield.TERMINAL^.str END
;
 BEGIN END
END;

END;

rsnode1:=rsnode1^.brother END;
BEGIN 
NODEVAR_ident:=variable;
END
END;
PROCEDURE mrucomCODE_RELVARproc(top:mrucomDECL_psnode
;var RELVAR_ident              :TSTRING_string
);
VAR currenttree:mrucomDECL_psnode;
    rsnode1:mrucomDECL_prsnode;
 variable:TSTRING_string;
BEGIN
 BEGIN TSTRING_constantempty(variable) END;
rsnode1:=top^.sonlist;
  while rsnode1<>nil do
  begin
  currenttree:=rsnode1^.node;
  case rsnode1^.sonnumber of

1: begin
  BEGIN variable:=currenttree^.ldfield.TERMINAL^.str END
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
RELVAR_ident:=variable;
END
END;
PROCEDURE mrucomCODE_CLABELproc(top:mrucomDECL_psnode
;var CLABEL_ident              :TSTRING_string
);
VAR currenttree:mrucomDECL_psnode;
    rsnode1:mrucomDECL_prsnode;

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
PROCEDURE mrucomCODE_ALABELproc(top:mrucomDECL_psnode
;var ALABEL_ident              :TSTRING_string
);
VAR currenttree:mrucomDECL_psnode;
    rsnode1:mrucomDECL_prsnode;

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
PROCEDURE mrucomCODE_ILABELtjeproc(top:mrucomDECL_psnode
;var ILABELtje_ident              :TSTRING_string
);
VAR currenttree:mrucomDECL_psnode;
    rsnode1:mrucomDECL_prsnode;
 ilabel:TSTRING_string;
BEGIN
 BEGIN TSTRING_constantempty(ilabel) END;
rsnode1:=top^.sonlist;
  while rsnode1<>nil do
  begin
  currenttree:=rsnode1^.node;
  case rsnode1^.sonnumber of

1: begin
  BEGIN ilabel:=currenttree^.ldfield.TERMINAL^.str END
;
 BEGIN END
END;

END;

rsnode1:=rsnode1^.brother END;
BEGIN 
ILABELtje_ident:=ilabel;
END
END;
PROCEDURE mrucomCODE_MLABELtjeproc(top:mrucomDECL_psnode
;var MLABELtje_ident              :TSTRING_string
);
VAR currenttree:mrucomDECL_psnode;
    rsnode1:mrucomDECL_prsnode;

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
PROCEDURE mrucomCODE_RLABELtjeproc(top:mrucomDECL_psnode
;var RLABELtje_ident              :TSTRING_string
);
VAR currenttree:mrucomDECL_psnode;
    rsnode1:mrucomDECL_prsnode;

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
PROCEDURE mrucomCODE_LLABELtjeproc(top:mrucomDECL_psnode
;var LLABELtje_ident              :TSTRING_string
);
VAR currenttree:mrucomDECL_psnode;
    rsnode1:mrucomDECL_prsnode;

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
PROCEDURE mrucomCODE_LABELtjeproc(top:mrucomDECL_psnode
;LABELtje_indent              :mrucomlangspec_INT
);
VAR currenttree:mrucomDECL_psnode;
    rsnode1:mrucomDECL_prsnode;

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
PROCEDURE mrucomCODE_CATNAMEproc(top:mrucomDECL_psnode
;var CATNAME_ident              :TSTRING_string
);
VAR currenttree:mrucomDECL_psnode;
    rsnode1:mrucomDECL_prsnode;
 category:TSTRING_string;
BEGIN
 BEGIN END;
rsnode1:=top^.sonlist;
  while rsnode1<>nil do
  begin
  currenttree:=rsnode1^.node;
  case rsnode1^.sonnumber of

1: begin
  BEGIN category:=currenttree^.ldfield.TERMINAL^.str END
;
 BEGIN END
END;

END;

rsnode1:=rsnode1^.brother END;
BEGIN
CATNAME_ident:=category;
END
END;
PROCEDURE mrucomCODE_CATRECNAMEproc(top:mrucomDECL_psnode
;var CATRECNAME_ident              :TSTRING_string
);
VAR currenttree:mrucomDECL_psnode;
    rsnode1:mrucomDECL_prsnode;
 rec:TSTRING_string;
BEGIN
 BEGIN END;
rsnode1:=top^.sonlist;
  while rsnode1<>nil do
  begin
  currenttree:=rsnode1^.node;
  case rsnode1^.sonnumber of

1: begin
  BEGIN rec:=currenttree^.ldfield.TERMINAL^.str END
;
 BEGIN END
END;

2: begin
  BEGIN TSTRING_appendchar(rec,rec,'_') END
;
 BEGIN END
END;

END;

rsnode1:=rsnode1^.brother END;
BEGIN
CATRECNAME_ident:=rec;
END
END;
PROCEDURE mrucomCODE_RELNAMEproc(top:mrucomDECL_psnode
;var RELNAME_ident              :TSTRING_string
);
VAR currenttree:mrucomDECL_psnode;
    rsnode1:mrucomDECL_prsnode;
 relation:TSTRING_string;
BEGIN
 BEGIN END;
rsnode1:=top^.sonlist;
  while rsnode1<>nil do
  begin
  currenttree:=rsnode1^.node;
  case rsnode1^.sonnumber of

1: begin
  BEGIN relation:=currenttree^.ldfield.TERMINAL^.str END
;
 BEGIN END
END;

END;

rsnode1:=rsnode1^.brother END;
BEGIN RELNAME_ident:=relation END
END;
PROCEDURE mrucomCODE_PARNAMEproc(top:mrucomDECL_psnode
;var PARNAME_ident              :TSTRING_string
);
VAR currenttree:mrucomDECL_psnode;
    rsnode1:mrucomDECL_prsnode;

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
PROCEDURE mrucomCODE_PARTYPEproc(top:mrucomDECL_psnode
;var PARTYPE_ident              :TSTRING_string
);
VAR currenttree:mrucomDECL_psnode;
    rsnode1:mrucomDECL_prsnode;

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
PROCEDURE mrucomCODE_PASCALSTATEMENTproc(top:mrucomDECL_psnode
;PASCALSTATEMENT_vartypes              :mrucomlangspec_setofvartypes
;var PASCALSTATEMENT_copy              :LOCALFILE
);
VAR currenttree:mrucomDECL_psnode;
    rsnode1:mrucomDECL_prsnode;
 copy,copy1:LOCALFILE;
decomkeyname,str1,str2,str3,str4,attrstr,nodetreestr:TSTRING_string;
vartype: mrucomLANGSPEC_vartype;
vartypes,vartypes1: mrucomLANGSPEC_setofvartypes;
found:BOOLEAN;
varkind: mrucomLANGSPEC_varkindtype;
cattable: mrucomLANGSPEC_setofidents;
cat: mrucomLANGSPEC_ident;
before,after: mrucomLANGSPEC_bool;
idargs:LOCALFILE;
ch:CHAR;
argcounter: mrucomLANGSPEC_int;
keypresent,treeornodecat,nodecatje: mrucomLANGSPEC_bool;
BEGIN
 BEGIN found:=FALSE; INITLOCALFILE(copy1);treeornodecat:=FALSE;nodecatje:=FALSE;
INITLOCALFILE(copy);vartypes:=PASCALSTATEMENT_vartypes;
INITLOCALFILE(idargs);
keypresent:=false;
argcounter:=0;
before:=FALSE;after:=FALSE;
END;
rsnode1:=top^.sonlist;
  while rsnode1<>nil do
  begin
  currenttree:=rsnode1^.node;
  case rsnode1^.sonnumber of

1: begin
  BEGIN  IF NOT treeornodecat THEN appendstring(':',copy);
 END
;
 BEGIN END
END;

2: begin
  BEGIN END
;
 BEGIN BEGIN  END;
str1:=currenttree^.ldfield.VARNAMEfield^.str1;
str2:=currenttree^.ldfield.VARNAMEfield^.str2;
IF (currenttree^.ldfield.VARNAMEfield^.varkind=treecat) THEN 
writeln('WARNING, ',str1,'.CAT:= not implemented, but Ni.CAT:= is');
treeornodecat:=(currenttree^.ldfield.VARNAMEfield^.varkind=nodecat) OR
(currenttree^.ldfield.VARNAMEfield^.varkind=treecat);
nodecatje:=(currenttree^.ldfield.VARNAMEfield^.varkind=nodecat);
IF (currenttree^.ldfield.VARNAMEfield^.varkind<>noderec) AND (currenttree^.ldfield.VARNAMEfield^.varkind<>treerec)
THEN IF NOT treeornodecat THEN
BEGIN
appendstring(str1,copy);

IF TSTRING_length(str2)<>0
THEN 
BEGIN
appendstring('.',copy);
 appendstring(str2,copy);

END;
END;
IF (currenttree^.ldfield.VARNAMEfield^.varkind=noderec) OR (currenttree^.ldfield.VARNAMEfield^.varkind=treerec)
THEN
BEGIN
before:=TRUE;
varkind:=currenttree^.ldfield.VARNAMEfield^.varkind;
vartypes1:=vartypes;
found:=FALSE;
WHILE stillvartypes(vartypes1) AND NOT(found) DO
BEGIN
takevartype(vartype,vartypes1);
found:=TSTRING_compare(str1,vartype.varname)=0;
END;
IF found THEN cattable:=vartype.cattable
ELSE writeln('ERROR, ',str1,'.REC not guarded');
END;
END
END;

3: begin
  BEGIN END
; mrucomCODE_VALUENAMEproc(currenttree
,VALUENAME__string
);
 BEGIN IF treeornodecat THEN
BEGIN
nodetreestr:=str1;

IF nodecatje THEN BEGIN appendstring('hulplsstree',copy);
 END
ELSE appendstring(nodetreestr,copy);
 
appendstring(':= MAKET_stree(',copy);

END;
str1:=VALUENAME__string;
appendstring(str1,copy);

IF treeornodecat THEN appendstring(');',copy);
appendstring('\\',copy);

IF nodecatje THEN
BEGIN
appendstring(nodetreestr,copy);
 appendstring(':=hulplsstree^.ls^;',copy);
appendstring('\\',copy);
 
END;
END
END;

4: begin
  BEGIN END
; mrucomCODE_SETVALUENAMEproc(currenttree
,SETVALUENAME__copy
);
 BEGIN
BEGIN  END;
APPENDLOCFILE(SETVALUENAME__copy,copy);
END
END;

5: begin
  BEGIN END
; mrucomCODE_VARNAMEproc(currenttree
,VARNAME__string
);
 BEGIN BEGIN  END;
IF treeornodecat THEN
BEGIN
nodetreestr:=str1;
IF nodecatje THEN BEGIN appendstring('hulplsstree',copy);
 END
ELSE appendstring(nodetreestr,copy);
 
appendstring(':= MAKET_stree(',copy);

END;
str3:=currenttree^.ldfield.VARNAMEfield^.str1;
str4:=currenttree^.ldfield.VARNAMEfield^.str2;
IF (currenttree^.ldfield.VARNAMEfield^.varkind<>noderec) AND (currenttree^.ldfield.VARNAMEfield^.varkind<>treerec)
THEN
BEGIN
appendstring(str3,copy);

IF TSTRING_length(str4)<>0 THEN 
BEGIN
appendstring('.',copy);
 appendstring(str4,copy);

END;
END;
IF (currenttree^.ldfield.VARNAMEfield^.varkind=noderec) OR (currenttree^.ldfield.VARNAMEfield^.varkind=treerec)
THEN
BEGIN
varkind:=currenttree^.ldfield.VARNAMEfield^.varkind;
after:=TRUE;
vartypes1:=vartypes;
found:=FALSE;
WHILE stillvartypes(vartypes1) AND NOT(found) DO
BEGIN
takevartype(vartype,vartypes1);
found:=TSTRING_compare(str3,vartype.varname)=0;
END;
IF found THEN cattable:=vartype.cattable
ELSE writeln('ERROR, ',str3,'.REC not guarded');
END;
IF treeornodecat THEN appendstring(');',copy);
appendstring('\\',copy);

IF nodecatje THEN
BEGIN
appendstring(nodetreestr,copy);
 appendstring(':=hulplsstree^.ls^;',copy);
appendstring('\\',copy);
 
END;
END
END;

6: begin
  BEGIN  appendstring('*',copy);
 END
;
 BEGIN END
END;

7: begin
  BEGIN END
; mrucomCODE_SETVALUENAMEproc(currenttree
,SETVALUENAME__copy
);
 BEGIN
BEGIN  END;
APPENDLOCFILE(SETVALUENAME__copy,copy);
END
END;

8: begin
  BEGIN END
; mrucomCODE_VARNAMEproc(currenttree
,VARNAME__string
);
 BEGIN BEGIN  END;
str3:=currenttree^.ldfield.VARNAMEfield^.str1;
str4:=currenttree^.ldfield.VARNAMEfield^.str2;
IF (currenttree^.ldfield.VARNAMEfield^.varkind<>noderec) AND (currenttree^.ldfield.VARNAMEfield^.varkind<>treerec)
THEN
BEGIN
appendstring(str3,copy);

IF TSTRING_length(str4)<>0 THEN 
BEGIN
appendstring('.',copy);
 appendstring(str4,copy);

END;
END;
IF (currenttree^.ldfield.VARNAMEfield^.varkind=noderec) OR (currenttree^.ldfield.VARNAMEfield^.varkind=treerec)
THEN
BEGIN
after:=TRUE;
varkind:=currenttree^.ldfield.VARNAMEfield^.varkind;
vartypes1:=vartypes;
found:=FALSE;
WHILE stillvartypes(vartypes1) AND NOT(found) DO
BEGIN
takevartype(vartype,vartypes1);
found:=TSTRING_compare(str3,vartype.varname)=0;
END;
IF found THEN cattable:=vartype.cattable
ELSE writeln('ERROR, ',str3,'.REC not guarded');
END;
END
END;

9: begin
  BEGIN  appendstring('+',copy);
END
;
 BEGIN END
END;

10:begin
  BEGIN  IF NOT treeornodecat THEN appendstring('=',copy);
 END
;
 BEGIN END
END;

11: begin
  BEGIN END
;
 BEGIN END
END;

12: begin
  BEGIN str1:=currenttree^.ldfield.TERMINAL^.str END
;
 BEGIN  appendstring('LSMRUQUO_',copy);
 appendstring(str1,copy);
 END
END;

13: begin
  BEGIN str1:=currenttree^.ldfield.TERMINAL^.str END
;
 BEGIN  
if keypresent then appendstring('(''',copy);

appendstring(str1,copy);

if keypresent then appendstring(''')',copy);

END
END;

14: begin
  BEGIN str1:=currenttree^.ldfield.TERMINAL^.str END
;
 BEGIN  appendstring(str1,copy);
appendstring('\\',copy);
 END
END;

15: begin
  BEGIN END
;
 BEGIN  appendstring(')',copy);
 END
END;

16: begin
  BEGIN END
;
 BEGIN  appendstring('[',copy);
 END
END;

17: begin
  BEGIN END
;
 BEGIN  appendstring(']',copy);
 END
END;

18: begin
  BEGIN END
;
 BEGIN  appendstring('(',copy);
 END
END;

19: begin
  BEGIN END
;
 BEGIN  appendstring(',',copy);
 END
END;

20: begin
  BEGIN END
;
 BEGIN  appendstring('LSAUXDOM_',copy);
 END
END;

21: begin
  BEGIN  appendstring('-',copy);
 END
;
 BEGIN END
END;

22: begin
  BEGIN  str1:=currenttree^.ldfield.KEYNAMEfield^.str1 END
;
 BEGIN appendstring(str1,copy);
 END
END;

23: begin
  BEGIN  str1:=currenttree^.ldfield.TERMINAL^.str END
;
 BEGIN appendstring('LIMATCHES_',copy);
 appendstring(str1,copy);
 END
END;

24: begin
  BEGIN keypresent:=true END
;
 BEGIN appendstring('auxkey',copy);
 END
END;

25: begin
  BEGIN argcounter:=argcounter+1;str1:=currenttree^.ldfield.KEYNAMEfield^.str1 END
;
 BEGIN appendstring('idargs.argkeys[',copy);
 appendstring(mrucomDECL_convinttostring(argcounter),copy);
 appendstring(']:=',copy);

appendstring(str1,copy);
 appendstring(';',copy);
appendstring('\\',copy);
 
END
END;

26: begin
  BEGIN str1:=currenttree^.ldfield.TERMINAL^.str END
;
 BEGIN appendstring('ORD(',copy);
 appendstring(str1,copy);
 appendstring(')',copy);
END
END;

27: begin
  BEGIN argcounter:=argcounter+1;str1:=currenttree^.ldfield.KEYNAMEfield^.str1 END
;
 BEGIN 
appendstring(str1,idargs);
 appendstring(':=idargs.argkeys[',idargs);
 
appendstring(mrucomDECL_convinttostring(argcounter),idargs);
 appendstring('];',idargs);
appendstring('\\',idargs);


END
END;

28: begin
  BEGIN END
;
 BEGIN appendstring('idargs.nrargs:=',copy);
 appendstring(mrucomDECL_convinttostring(argcounter),copy);
 appendstring(';',copy);
appendstring('\\',copy);

appendstring(decomkeyname,copy);
 appendstring(':=LIMATCHES_DECOMPGETIDDICT(idargs',copy);

END
END;

29: begin
  BEGIN END
;
 BEGIN appendstring('idargs',copy);
 END
END;

30: begin
  BEGIN END
;
 BEGIN appendstring(')',copy);
 END
END;

31: begin
  BEGIN END
;
 BEGIN  appendstring(');VPID:=[',copy);
 appendstring(str1,copy);
 appendstring('];',copy);

appendlocfile(idargs,copy);
END
END;

32: begin
  BEGIN END
;
 BEGIN decomkeyname:=currenttree^.ldfield.KEYNAMEfield^.str1
END
END;

END;

rsnode1:=rsnode1^.brother END;
BEGIN
IF found THEN
BEGIN

appendstring('CASE ',copy1);
 
IF before THEN BEGIN appendstring(str1,copy1);
 END ELSE appendstring(str3,copy1);

appendstring('^.cat OF',copy1);

WHILE stillidents(cattable) DO
BEGIN
takeident(cat,cattable);
appendstring('\\',copy1);
appendstring(cat.str,copy1);
 appendstring(':',copy1);

IF after THEN
BEGIN
appendlocfile(copy,copy1);appendstring('\\',copy1);

savelocfile(copy,copy);
END;
IF before THEN BEGIN appendstring(str1,copy1);
 END ELSE appendstring(str3,copy1);

IF varkind=treerec THEN BEGIN appendstring('^.ls^.',copy1);
 END ELSE 
writeln('Ni.REC.attr := value not yet implemented, but Ti.REC is');
appendstring(cat.str,copy1);
 appendstring('field^.',copy1);

IF before THEN BEGIN appendstring(str2,copy1);
 END ELSE BEGIN appendstring(str4,copy1);
 appendstring(';',copy1);
 END;
IF before THEN
BEGIN
appendlocfile(copy,copy1);appendstring(';',copy1);
appendstring('\\',copy1);

savelocfile(copy,copy);
END;
END;
appendstring('otherwise begin ',copy1);

appendstring('writeln(''ERROR from MRUCOM.GENSUR'') end;',copy1);
appendstring('\\',copy1);
 appendstring('END;',copy1);
appendstring('\\',copy1);

copy:=copy1;
END;
PASCALSTATEMENT_copy:=copy 
END
END;
PROCEDURE mrucomCODE_PASCALEXPRproc(top:mrucomDECL_psnode
;PASCALEXPR_vartypes              :mrucomlangspec_setofvartypes
;var PASCALEXPR_commatchfile              :LOCALFILE
;var PASCALEXPR_decommatchfile              :LOCALFILE
;var PASCALEXPR_casefile              :LOCALFILE
;var PASCALEXPR_allexistcounter              :mrucomlangspec_int
);
VAR currenttree:mrucomDECL_psnode;
    rsnode1:mrucomDECL_prsnode;
 commatchfile,commatchfile1,helpfile,casefile,decommatchfile:LOCALFILE;
string,waarde:TSTRING_string;
found,found1:BOOLEAN;
vartypes,vartypes1: mrucomLANGSPEC_setofvartypes;
vartype,vartype1: mrucomLANGSPEC_vartype;
cattable,cattable1: mrucomLANGSPEC_setofidents;
cat: mrucomLANGSPEC_ident;
str1,str2,str3,str4:TSTRING_string;
allexistcounter:INTEGER;
varkind,varkind1: mrucomLANGSPEC_varkindtype;
notpresent,before,after,inaanwezig,haakjetoegevoegd,nogeenhaakje,
uitgesteldhaakje:BOOLEAN;
haakjesopen, zoalsbijIN:INTEGER;
BEGIN
 BEGIN
nogeenhaakje:=FALSE;
uitgesteldhaakje:=FALSE;
haakjetoegevoegd:=FALSE;
inaanwezig:=FALSE;
haakjesopen:=0;
after:=FALSE;
before:=FALSE;
notpresent:=FALSE;
vartypes:=PASCALEXPR_vartypes;
allexistcounter:=PASCALEXPR_allexistcounter;
found:=FALSE;
INITLOCALFILE(commatchfile); 
INITLOCALFILE(commatchfile1); 
INITLOCALFILE(casefile); 
INITLOCALFILE(helpfile); 
INITLOCALFILE(decommatchfile); 
END;
rsnode1:=top^.sonlist;
  while rsnode1<>nil do
  begin
  currenttree:=rsnode1^.node;
  case rsnode1^.sonnumber of

1: begin
  BEGIN inaanwezig:=TRUE; zoalsbijIN:=haakjesopen END
;
 BEGIN 
 
appendstring(' IN ',commatchfile);

END
END;

2: begin
  BEGIN END
; mrucomCODE_VARNAMEproc(currenttree
,VARNAME__string
);
 BEGIN 
str3:=currenttree^.ldfield.VARNAMEfield^.str1;
str4:=currenttree^.ldfield.VARNAMEfield^.str2;
string:=VARNAME__string;
varkind1:=currenttree^.ldfield.VARNAMEfield^.varkind;
IF (currenttree^.ldfield.VARNAMEfield^.varkind<>noderec) AND (currenttree^.ldfield.VARNAMEfield^.varkind<>treerec) THEN
BEGIN

appendstring(string,commatchfile);

END
ELSE
BEGIN
after:=true;
vartypes1:=vartypes;
found:=FALSE;
WHILE stillvartypes(vartypes1) DO
BEGIN
takevartype(vartype1,vartypes1);
found1:=TSTRING_compare(str3,vartype1.varname)=0;
if found1 then 
begin
found:=TRUE;
vartype:=vartype1
end;
END;
IF found THEN cattable:=vartype.cattable
ELSE writeln('ERROR, ',str3,'.REC not guarded');
END;
END
END;

3: begin
  BEGIN END
; mrucomCODE_VALUENAMEproc(currenttree
,VALUENAME__string
);
 BEGIN
string:=VALUENAME__string;
BEGIN  END;
BEGIN 
appendstring(string,commatchfile);

END; 
END
END;

4: begin
  BEGIN END
; mrucomCODE_VARNAMEproc(currenttree
,VARNAME__string
);
 BEGIN
str1:=currenttree^.ldfield.VARNAMEfield^.str1;
str2:=currenttree^.ldfield.VARNAMEfield^.str2;
string:=VARNAME__string;
varkind:=currenttree^.ldfield.VARNAMEfield^.varkind;
IF (currenttree^.ldfield.VARNAMEfield^.varkind<>noderec) AND (currenttree^.ldfield.VARNAMEfield^.varkind<>treerec) THEN
BEGIN

appendstring(string,commatchfile);

END
ELSE
BEGIN
before:=TRUE;
vartypes1:=vartypes;
found:=FALSE;
WHILE stillvartypes(vartypes1) DO
BEGIN
takevartype(vartype1,vartypes1);
found1:=TSTRING_compare(str1,vartype1.varname)=0;
if found1 then 
begin
found:=TRUE;
vartype:=vartype1
end;
END;
IF found THEN cattable:=vartype.cattable
ELSE writeln('ERROR, ',str1,'.REC not guarded');
END;
END
END;

5: begin
  BEGIN END
; mrucomCODE_VALUENAMEproc(currenttree
,VALUENAME__string
);
 BEGIN 
string:=VALUENAME__string;
BEGIN  END;
BEGIN 
appendstring(string,commatchfile);

END; 
END
END;

6: begin
  BEGIN END
; mrucomCODE_SETVALUENAMEproc(currenttree
,SETVALUENAME__copy
);
 BEGIN
APPENDLOCFILE(SETVALUENAME__copy,commatchfile);
END
END;

7: begin
  BEGIN END
; mrucomCODE_SETVALUENAMEproc(currenttree
,SETVALUENAME__copy
);
 BEGIN 
APPENDLOCFILE(SETVALUENAME__copy,commatchfile);
END
END;

8: begin
  BEGIN END
; mrucomCODE_SETVALUENAMEproc(currenttree
,SETVALUENAME__copy
);
 BEGIN 
BEGIN  END;
BEGIN
APPENDLOCFILE(SETVALUENAME__copy,commatchfile);
END; 
END
END;

9: begin
  BEGIN END
; mrucomCODE_VARNAMEproc(currenttree
,VARNAME__string
);
 BEGIN 
str3:=currenttree^.ldfield.VARNAMEfield^.str1;
str4:=currenttree^.ldfield.VARNAMEfield^.str2;
string:=VARNAME__string;
varkind1:=currenttree^.ldfield.VARNAMEfield^.varkind;
IF (currenttree^.ldfield.VARNAMEfield^.varkind<>noderec) AND (currenttree^.ldfield.VARNAMEfield^.varkind<>treerec) THEN
BEGIN

appendstring(string,commatchfile);

END
ELSE
BEGIN
after:=true;
vartypes1:=vartypes;
found:=FALSE;
WHILE stillvartypes(vartypes1) DO
BEGIN
takevartype(vartype1,vartypes1);
found1:=TSTRING_compare(str3,vartype1.varname)=0;
if found1 then 
begin
found:=TRUE;
vartype:=vartype1
end;
END;
IF found THEN cattable:=vartype.cattable
ELSE writeln('ERROR, ',str3,'.REC not guarded');
END;
END
END;

10: begin
  BEGIN END
; mrucomCODE_SETVALUENAMEproc(currenttree
,SETVALUENAME__copy
);
 BEGIN 
BEGIN  END;
BEGIN 
APPENDLOCFILE(SETVALUENAME__copy,commatchfile);
END; 
END
END;

11: begin
  BEGIN END
; mrucomCODE_VARNAMEproc(currenttree
,VARNAME__string
);
 BEGIN 
str3:=currenttree^.ldfield.VARNAMEfield^.str1;
str4:=currenttree^.ldfield.VARNAMEfield^.str2;
string:=VARNAME__string;
varkind1:=currenttree^.ldfield.VARNAMEfield^.varkind;
IF (currenttree^.ldfield.VARNAMEfield^.varkind<>noderec) AND (currenttree^.ldfield.VARNAMEfield^.varkind<>treerec) THEN
BEGIN

appendstring(string,commatchfile);

END
ELSE
BEGIN
after:=true;
vartypes1:=vartypes;
found:=FALSE;
WHILE stillvartypes(vartypes1) DO
BEGIN
takevartype(vartype1,vartypes1);
found1:=TSTRING_compare(str3,vartype1.varname)=0;
if found1 then 
begin
found:=TRUE;
vartype:=vartype1
end;
END;
IF found THEN cattable:=vartype.cattable
ELSE writeln('ERROR, ',str3,'.REC not guarded');
END;
END
END;

12: begin
  BEGIN END
;
 BEGIN
BEGIN  END;
BEGIN 
appendstring(' =',commatchfile);

END; 
END
END;

13: begin
  BEGIN END
;
 BEGIN
BEGIN  END;
BEGIN 
appendstring('>',commatchfile);

END; 
END
END;

14: begin
  BEGIN END
; mrucomCODE_SETVALUENAMEproc(currenttree
,SETVALUENAME__copy
);
 BEGIN 
APPENDLOCFILE(SETVALUENAME__copy,commatchfile);
END
END;

15: begin
  BEGIN END
; mrucomCODE_VARNAMEproc(currenttree
,VARNAME__string
);
 BEGIN 
str1:=currenttree^.ldfield.VARNAMEfield^.str1;
str2:=currenttree^.ldfield.VARNAMEfield^.str2;
string:=VARNAME__string;
varkind:=currenttree^.ldfield.VARNAMEfield^.varkind;
IF (currenttree^.ldfield.VARNAMEfield^.varkind<>noderec) AND (currenttree^.ldfield.VARNAMEfield^.varkind<>treerec) THEN
BEGIN

appendstring(string,commatchfile);

END
ELSE
BEGIN
before:=TRUE;
vartypes1:=vartypes;
found:=FALSE;
WHILE stillvartypes(vartypes1) DO
BEGIN
takevartype(vartype1,vartypes1);
found1:=TSTRING_compare(str1,vartype1.varname)=0;
if found1 then 
begin
found:=TRUE;
vartype:=vartype1
end;
END;
IF found THEN cattable:=vartype.cattable
ELSE writeln('ERROR, ',str1,'.REC not guarded');
END;
END
END;

16: begin
  BEGIN END
; mrucomCODE_VALUENAMEproc(currenttree
,VALUENAME__string
);
 BEGIN 
string:=VALUENAME__string;
waarde:=string;
BEGIN  END;
BEGIN 
appendstring('(',commatchfile);
 appendstring(string,commatchfile);

nogeenhaakje:=TRUE;
END; 
END
END;

17: begin
  BEGIN END
; mrucomCODE_VARNAMEproc(currenttree
,VARNAME__string
);
 BEGIN 
str3:=currenttree^.ldfield.VARNAMEfield^.str1;
str4:=currenttree^.ldfield.VARNAMEfield^.str2;
string:=VARNAME__string;
waarde:=string;
varkind1:=currenttree^.ldfield.VARNAMEfield^.varkind;
IF (currenttree^.ldfield.VARNAMEfield^.varkind<>noderec) AND (currenttree^.ldfield.VARNAMEfield^.varkind<>treerec) THEN
BEGIN

appendstring('(',commatchfile);
 appendstring(string,commatchfile);

nogeenhaakje:=TRUE;
END
ELSE
BEGIN
after:=true;
vartypes1:=vartypes;
found:=FALSE;
WHILE stillvartypes(vartypes1) DO
BEGIN
takevartype(vartype1,vartypes1);
found1:=TSTRING_compare(str3,vartype1.varname)=0;
if found1 then 
begin
found:=TRUE;
vartype:=vartype1
end;
END;
IF found THEN cattable:=vartype.cattable
ELSE writeln('ERROR, ',str3,'.REC not guarded');
END;
END
END;

18: begin
  BEGIN END
; mrucomCODE_SETVALUENAMEproc(currenttree
,SETVALUENAME__copy
);
 BEGIN
APPENDLOCFILE(SETVALUENAME__copy,commatchfile);
END
END;

19: begin
  BEGIN END
; mrucomCODE_VARNAMEproc(currenttree
,VARNAME__string
);
 BEGIN 
str1:=currenttree^.ldfield.VARNAMEfield^.str1;
str2:=currenttree^.ldfield.VARNAMEfield^.str2;
string:=VARNAME__string;
varkind:=currenttree^.ldfield.VARNAMEfield^.varkind;
IF (currenttree^.ldfield.VARNAMEfield^.varkind<>noderec) AND (currenttree^.ldfield.VARNAMEfield^.varkind<>treerec) THEN
BEGIN

appendstring(string,commatchfile);

END
ELSE
BEGIN
uitgesteldhaakje:=nogeenhaakje;
nogeenhaakje:=FALSE;
before:=TRUE;
vartypes1:=vartypes;
found:=FALSE;
WHILE stillvartypes(vartypes1) DO
BEGIN
takevartype(vartype1,vartypes1);
found1:=TSTRING_compare(str1,vartype1.varname)=0;
if found1 then 
begin
found:=TRUE;
vartype:=vartype1
end;
END;
IF found THEN cattable:=vartype.cattable
ELSE writeln('ERROR, ',str1,'.REC not guarded');
END;
END
END;

20: begin
  BEGIN END
;
 BEGIN 
BEGIN  END;
BEGIN 
appendstring(' =',commatchfile);

END; 
END
END;

21: begin
  BEGIN END
;
 BEGIN
BEGIN  END;
BEGIN 
appendstring('<',commatchfile);

END; 
END
END;

22: begin
  BEGIN END
;
 BEGIN 
notpresent:=TRUE;
BEGIN  END;
BEGIN 
appendstring(' NOT(',commatchfile);

END; 
END
END;

23: begin
  BEGIN END
;
 BEGIN
END
END;

24: begin
  BEGIN END
;
 BEGIN 
BEGIN  END;
BEGIN IF inaanwezig THEN
BEGIN
IF NOT (haakjesopen=zoalsbijIN) THEN appendstring(')',commatchfile);

appendstring(') AND ((',commatchfile);
 appendstring(waarde,commatchfile);
 appendstring(' IN ',commatchfile);

haakjetoegevoegd:=TRUE;
If NOT (haakjesopen=zoalsbijIN) THEN appendstring('(',commatchfile);

END
ELSE appendstring(' *',commatchfile);

END; 
END
END;

25: begin
  BEGIN END
; mrucomCODE_SETVALUENAMEproc(currenttree
,SETVALUENAME__copy
);
 BEGIN
APPENDLOCFILE(SETVALUENAME__copy,commatchfile);
If haakjetoegevoegd Then appendstring(')',commatchfile);

haakjetoegevoegd:=FALSE;
END
END;

26: begin
  BEGIN END
; mrucomCODE_VARNAMEproc(currenttree
,VARNAME__string
);
 BEGIN
string:=VARNAME__string;
BEGIN  END;
BEGIN 
appendstring(string,commatchfile);

END; 
If haakjetoegevoegd Then appendstring(')',commatchfile);

haakjetoegevoegd:=FALSE; 
END
END;

27: begin
  BEGIN END
;
 BEGIN
BEGIN  END;
BEGIN 
appendstring(' +',commatchfile);

END; 
END
END;

28: begin
  BEGIN END
;
 BEGIN 
BEGIN  END;
BEGIN 
appendstring(' +',commatchfile);

END; 
END
END;

29: begin
  BEGIN END
; mrucomCODE_SETVALUENAMEproc(currenttree
,SETVALUENAME__copy
);
 BEGIN
APPENDLOCFILE(SETVALUENAME__copy,commatchfile);
END
END;

30: begin
  BEGIN END
;
 BEGIN 
END
END;

31: begin
  BEGIN END
;
 BEGIN 
BEGIN  END;
BEGIN 
appendstring(' =',commatchfile);

END; 
END
END;

32: begin
  BEGIN END
;
 BEGIN 
BEGIN  END;
BEGIN 
appendstring('<',commatchfile);

END; 
END
END;

33: begin
  BEGIN END
;
 BEGIN 
BEGIN  END;
BEGIN 
appendstring('<',commatchfile);

END; 
END
END;

34: begin
  BEGIN END
;
 BEGIN 
BEGIN  END;
BEGIN 
appendstring('>',commatchfile);

END; 
END
END;

35: begin
  BEGIN END
;
 BEGIN 
BEGIN  END;
BEGIN 
appendstring('>',commatchfile);

END; 
END
END;

36: begin
  BEGIN END
;
 BEGIN 
BEGIN  END;
BEGIN 
appendstring(' *',commatchfile);

END; 
END
END;

37: begin
  BEGIN END
;
 BEGIN 
BEGIN  END;
BEGIN 
appendstring(' -',commatchfile);

END; 
END
END;

38: begin
  BEGIN haakjesopen:=haakjesopen+1 END
;
 BEGIN 
BEGIN  END;
BEGIN 
appendstring(' (',commatchfile);

END; 
END
END;

39: begin
  BEGIN END
;
 BEGIN 
BEGIN  END;
BEGIN 
haakjesopen:=haakjesopen-1;
appendstring(' )',commatchfile);

END; 
END
END;

END;

rsnode1:=rsnode1^.brother END;
BEGIN 
If nogeenhaakje THEN appendstring(')',commatchfile);

IF notpresent THEN
BEGIN  
appendstring(')',commatchfile);

END; 
IF found THEN
BEGIN
allexistcounter:=allexistcounter + 1;

appendstring('FUNCTION casefile',casefile);
 appendstring(mrucomDECL_convinttostring(allexistcounter),casefile);
 appendstring(':BOOLEAN;',casefile);
appendstring('\\',casefile);

appendstring('BEGIN IF',casefile);
appendstring('\\',casefile);

IF before THEN BEGIN appendstring(str1,casefile);
 END
ELSE BEGIN appendstring(str3,casefile);
 END;
IF (before AND (varkind=treerec)) OR (after AND (varkind1=treerec))
THEN BEGIN appendstring('^.cat',casefile);
 END
ELSE BEGIN appendstring('.cat',casefile);
 END;appendstring(' IN [',casefile);
appendstring('\\',casefile);

cattable1:=cattable;
WHILE stillidents(cattable1) DO
BEGIN
takeident(cat,cattable1);
appendstring(cat.str,casefile);

IF stillidents(cattable1) THEN appendstring(',',casefile);
 
END; 
appendstring('] THEN CASE ',casefile);
 
IF before THEN BEGIN appendstring(str1,casefile);
 END
ELSE BEGIN appendstring(str3,casefile);
 END;
IF (before AND (varkind=treerec)) OR (after AND (varkind1=treerec))
THEN BEGIN appendstring('^.cat',casefile);
 END
ELSE BEGIN appendstring('.cat',casefile);
 END;appendstring(' OF',casefile);
appendstring('\\',casefile);

WHILE stillidents(cattable) DO
BEGIN
takeident(cat,cattable);
appendstring(cat.str,casefile);
 appendstring(':casefile',casefile);

appendstring(mrucomDECL_convinttostring(allexistcounter),casefile);
 appendstring(':=(',casefile);
 
if after then 
BEGIN
appendstring(str3,casefile);

IF varkind1=treerec THEN BEGIN appendstring('^.ls^',casefile);
 END;
appendstring('.',casefile);
 appendstring(cat.str,casefile);
 
appendstring('field^.',casefile);
 appendstring(str4,casefile);

appendlocfile(commatchfile,casefile);
END;
if before then 
BEGIN
appendlocfile(commatchfile,casefile);
appendstring(str1,casefile);

IF varkind=treerec THEN BEGIN appendstring('^.ls^',casefile);
 END;
appendstring('.',casefile);
 appendstring(cat.str,casefile);
 
appendstring('field^.',casefile);
 appendstring(str2,casefile);

If uitgesteldhaakje Then appendstring(')',casefile);

END;
appendstring(');',casefile);
appendstring('\\',casefile);

savelocfile(commatchfile,commatchfile);
END;
appendstring('END',casefile);
appendstring('\\',casefile);

appendstring('END;',casefile);
appendstring('\\',casefile);


appendstring('casefile',commatchfile1);
 appendstring(mrucomDECL_convinttostring(allexistcounter),commatchfile1);

commatchfile:=commatchfile1;
END;
PASCALEXPR_allexistcounter:=allexistcounter;
PASCALEXPR_commatchfile:=commatchfile;
PASCALEXPR_decommatchfile:=decommatchfile;
PASCALEXPR_casefile:=casefile;
END
END;
PROCEDURE mrucomCODE_VARNAMEproc(top:mrucomDECL_psnode
;var VARNAME_string              :TSTRING_string
);
VAR currenttree:mrucomDECL_psnode;
    rsnode1:mrucomDECL_prsnode;
 variable,string:TSTRING_string;
BEGIN
 BEGIN variable:=''; END;
rsnode1:=top^.sonlist;
  while rsnode1<>nil do
  begin
  currenttree:=rsnode1^.node;
  case rsnode1^.sonnumber of

1: begin
  BEGIN END
;
 BEGIN
TSTRING_append(variable,'.');
END
END;

2: begin
  BEGIN END
; mrucomCODE_PARNAMEproc(currenttree
,PARNAME__ident
);
 BEGIN
TSTRING_append(variable,currenttree^.ldfield.PARNAMEfield^.str);
END
END;

3: begin
  BEGIN END
; mrucomCODE_CATRECNAMEproc(currenttree
,CATRECNAME__ident
);
 BEGIN
string:=currenttree^.ldfield.CATRECNAMEfield^.str;
TSTRING_append(variable,string);
END
END;

4: begin
  BEGIN END
;
 BEGIN
TSTRING_append(variable,currenttree^.ldfield.TERMINAL^.str);
END
END;

5: begin
  BEGIN END
; mrucomCODE_TREEVARproc(currenttree
,TREEVAR__ident
);
 BEGIN
TSTRING_append(variable,currenttree^.ldfield.TREEVARfield^.str);
TSTRING_appendchars(variable,variable,'^',1);
END
END;

6: begin
  BEGIN END
; mrucomCODE_NODEVARproc(currenttree
,NODEVAR__ident
);
 BEGIN 
TSTRING_append(variable,currenttree^.ldfield.NODEVARfield^.str);
END
END;

7: begin
  BEGIN END
; mrucomCODE_CATCATproc(currenttree
,CATCAT__ident
);
 BEGIN
TSTRING_append(variable,currenttree^.ldfield.CATCATfield^.str);
END
END;

8: begin
  BEGIN END
; mrucomCODE_RELVARproc(currenttree
,RELVAR__ident
);
 BEGIN
TSTRING_append(variable,currenttree^.ldfield.RELVARfield^.str);
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
 BEGIN
END
END;

11: begin
  BEGIN END
;
 BEGIN
END
END;

12: begin
  BEGIN END
;
 BEGIN
TSTRING_append(variable,currenttree^.ldfield.TERMINAL^.str);
END
END;

END;

rsnode1:=rsnode1^.brother END;
BEGIN VARNAME_string:=variable; END
END;
PROCEDURE mrucomCODE_SETVALUENAMEproc(top:mrucomDECL_psnode
;var SETVALUENAME_copy              :LOCALFILE
);
VAR currenttree:mrucomDECL_psnode;
    rsnode1:mrucomDECL_prsnode;
 setvalue:LOCALFILE;
str:TSTRING_string;
keypresent: mrucomLANGSPEC_bool;
beginquote: mrucomLANGSPEC_bool;
typecode: mrucomLANGSPEC_int;
varfound,relationtype: mrucomLANGSPEC_bool;
BEGIN
 BEGIN INITLOCALFILE(setvalue);
keypresent:=false;
beginquote:=false;
 
varfound:=top^.ldfield.SETVALUENAMEfield^.varfound;
relationtype:=top^.ldfield.SETVALUENAMEfield^.relationtype;
typecode:=top^.ldfield.SETVALUENAMEfield^.typecode;
IF relationtype THEN BEGIN 
appendstring('loopholes.retype(',setvalue);
 END;
IF varfound THEN BEGIN
appendstring('COPYT_id',setvalue);
 appendstring(mrucomDECL_convinttostring(typecode),setvalue);
 appendstring('(',setvalue);
 END;
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
appendstring('[',setvalue);

END
END;

2: begin
  BEGIN END
; mrucomCODE_VALUENAMEproc(currenttree
,VALUENAME__string
);
 BEGIN
str:=VALUENAME__string;
appendstring(str,setvalue);

END
END;

3: begin
  BEGIN END
;
 BEGIN
str:=currenttree^.ldfield.TERMINAL^.str;
if not(beginquote) then 
begin
if keypresent then BEGIN appendstring('(''',setvalue);
 END ELSE appendstring('LSAUXDOM_',setvalue);
 
end;
appendstring(str,setvalue);

if keypresent and not(beginquote) then appendstring(''')',setvalue);

END
END;

4: begin
  BEGIN END
; mrucomCODE_VARNAMEproc(currenttree
,VARNAME__string
);
 BEGIN
str:=VARNAME__string;
appendstring(str,setvalue);

END
END;

5: begin
  BEGIN END
;
 BEGIN
appendstring(',',setvalue);
appendstring('\\',setvalue);

END
END;

6: begin
  BEGIN END
;
 BEGIN
appendstring(']',setvalue);

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
 BEGIN if beginquote then appendstring('_',setvalue);

END
END;

9: begin
  BEGIN END
;
 BEGIN keypresent:=true;
appendstring('auxkey',setvalue);

END
END;

10: begin
  BEGIN END
;
 BEGIN beginquote:=true; appendstring('(''',setvalue);

END
END;

11: begin
  BEGIN END
;
 BEGIN appendstring(''')',setvalue);

END
END;

12: begin
  BEGIN END
;
 BEGIN if beginquote then appendstring('_',setvalue);

END
END;

END;

rsnode1:=rsnode1^.brother END;
BEGIN 
IF relationtype THEN BEGIN 
appendstring(',synrelset)',setvalue);
 END;
IF varfound THEN appendstring(')',setvalue);

SETVALUENAME_copy:=setvalue; 
END
END;
PROCEDURE mrucomCODE_VALUENAMEproc(top:mrucomDECL_psnode
;var VALUENAME_string              :TSTRING_string
);
VAR currenttree:mrucomDECL_psnode;
    rsnode1:mrucomDECL_prsnode;
 valeu:TSTRING_string;
BEGIN
 BEGIN TSTRING_constantempty(valeu); END;
rsnode1:=top^.sonlist;
  while rsnode1<>nil do
  begin
  currenttree:=rsnode1^.node;
  case rsnode1^.sonnumber of

1: begin
  BEGIN END
;
 BEGIN 
TSTRING_append(valeu,currenttree^.ldfield.TERMINAL^.str);
END
END;

2: begin
  BEGIN END
;
 BEGIN 
TSTRING_append(valeu,'_');
END
END;

3: begin
  BEGIN END
;
 BEGIN 
TSTRING_append(valeu,currenttree^.ldfield.TERMINAL^.str);
END
END;

4: begin
  BEGIN END
;
 BEGIN TSTRING_appendchars(valeu,valeu,
'level',5);
END
END;

END;

rsnode1:=rsnode1^.brother END;
BEGIN VALUENAME_string:=valeu; END
END;
PROCEDURE mrucomCODE_TRUECATproc(top:mrucomDECL_psnode
;var TRUECAT_ident              :TSTRING_string
);
VAR currenttree:mrucomDECL_psnode;
    rsnode1:mrucomDECL_prsnode;

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
PROCEDURE mrucomCODE_CATCATproc(top:mrucomDECL_psnode
;var CATCAT_ident              :TSTRING_string
);
VAR currenttree:mrucomDECL_psnode;
    rsnode1:mrucomDECL_prsnode;

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
PROCEDURE mrucomCODE_BONUSspecproc(top:mrucomDECL_psnode
;var BONUSspec_bonusfile              :LOCALFILE
);
VAR currenttree:mrucomDECL_psnode;
    rsnode1:mrucomDECL_prsnode;
 minus: mrucomLANGSPEC_bool;
sbonuspres,wbonuspres: mrucomLANGSPEC_bool;
sbonusval,wbonusval: mrucomLANGSPEC_int;
len:INTEGER;len1:STRING_range;
bonusfile:LOCALFILE;
str1:STRING(5);
BEGIN
 BEGIN minus:=FALSE;sbonuspres:=FALSE;wbonuspres:=FALSE;
sbonusval:=0;wbonusval:=0;
 INITLOCALFILE(bonusfile);
END;
rsnode1:=top^.sonlist;
  while rsnode1<>nil do
  begin
  currenttree:=rsnode1^.node;
  case rsnode1^.sonnumber of

1: begin
  BEGIN END
;
 BEGIN sbonuspres:=TRUE END
END;

2: begin
  BEGIN END
;
 BEGIN wbonuspres:=TRUE END
END;

3: begin
  BEGIN END
;
 BEGIN minus:=TRUE END
END;

4: begin
  BEGIN END
;
 BEGIN END
END;

5: begin
  BEGIN END
;
 BEGIN IF sbonuspres THEN
BEGIN
TSTRING_extractchars(str1,len1,currenttree^.ldfield.NUMBERfield^.str,1,
length(currenttree^.ldfield.NUMBERfield^.str));
len:=len1;
sbonusval:=converttointeger(str1,len);
IF minus THEN sbonusval:=-sbonusval;
END
ELSE
BEGIN
TSTRING_extractchars(str1,len1,currenttree^.ldfield.TERMINAL^.str,1,
length(currenttree^.ldfield.TERMINAL^.str));
len:=len1;
wbonusval:=converttointeger(str1,len);
IF minus THEN wbonusval:=-wbonusval;
END;
IF sbonuspres THEN
BEGIN
IF sbonusval>=0 THEN BEGIN 
appendstring('wbonus:=1000*',bonusfile);
 appendstring(mrucomDECL_convinttostring(sbonusval),bonusfile);
 appendstring(';',bonusfile);
appendstring('\\',bonusfile);
 END
ELSE BEGIN appendstring('wbonus:=-1000*',bonusfile);
 appendstring(mrucomDECL_convinttostring(-sbonusval),bonusfile);
 appendstring(';',bonusfile);
 appendstring('\\',bonusfile);
 END;
END
ELSE
BEGIN
IF wbonusval>=0 THEN BEGIN appendstring('wbonus:=',bonusfile);
 appendstring(mrucomDECL_convinttostring(wbonusval),bonusfile);
 appendstring(';',bonusfile);
appendstring('\\',bonusfile);
 END
ELSE BEGIN appendstring('wbonus:=-',bonusfile);
 appendstring(mrucomDECL_convinttostring(-wbonusval),bonusfile);
 appendstring(';',bonusfile);
 appendstring('\\',bonusfile);
 END;
END;
END
END;

6: begin
  BEGIN END
;
 BEGIN END
END;

END;

rsnode1:=rsnode1^.brother END;
BEGIN BONUSspec_bonusfile:=bonusfile;
END
END;
PROCEDURE mrucomCODE_DTREEproc(top:mrucomDECL_psnode
;DTREE_name              :TSTRING_string
;var DTREE_rightcom              :LOCALFILE
;var DTREE_comactions              :LOCALFILE
;var DTREE_decomactions              :LOCALFILE
;var DTREE_extern              :LOCALFILE
;var DTREE_levelids              :mrucomlangspec_setofidents
;var DTREE_counter              :mrucomlangspec_int
;var DTREE_externcounter              :mrucomlangspec_int
);
VAR currenttree:mrucomDECL_psnode;
    rsnode1:mrucomDECL_prsnode;
 rightcom,externprocedures,procedures,body,comactions,decomactions:LOCALFILE;
subgrammarname,category,paramname,name,treevarname,procedurename,str:TSTRING_string;
counter,externcounter,nrargs,nrofrules,len,number,numberofitems:INTEGER;
levelids: mrucomLANGSPEC_setofidents;
len1:STRING_range;
str1:STRING(30);
ptr:^INTEGER;
crash,substpar,paramspresent,normalnode,rulenode: mrucomLANGSPEC_bool;
 PROCEDURE APPENDSETS(S1: mrucomLANGSPEC_SETOFidents;VAR S2: mrucomLANGSPEC_SETOFidents);
VAR ident1: mrucomLANGSPEC_ident;
BEGIN
WHILE STILLidents(S1) DO
BEGIN
TAKEident(ident1,S1);
APPENDident(ident1,S2)
END
END;
BEGIN
 BEGIN initlocalfile(rightcom);
initlocalfile(procedures);
initlocalfile(externprocedures);
initlocalfile(body);
initlocalfile(comactions);
initlocalfile(decomactions);
crash:=FALSE;
nrargs:=top^.ldfield.DTREEfield^.nrargs;
nrofrules:=0;
initsetofidents(levelids);
substpar:=FALSE;
paramspresent:=FALSE;
rulenode:=top^.ldfield.DTREEfield^.rulenode;
normalnode:=top^.ldfield.DTREEfield^.normalnode;
counter:=DTREE_counter;
externcounter:=DTREE_externcounter;
procedurename:=top^.ldfield.DTREEfield^.str;
name:=DTREE_name;

appendstring('function crdtree',rightcom);
 appendstring(procedurename,rightcom);
 
IF not normalnode THEN appendstring(mrucomDECL_convinttostring(externcounter + 1),rightcom);

appendstring(':HYPERDTREE_pHyperdtree;',rightcom);
appendstring('\\',rightcom);

appendstring('VAR d,dson:HYPERDTREE_pHyperDtree;',rightcom);
appendstring('\\',rightcom);

appendstring(' number:INTEGER;',rightcom);
appendstring('\\',rightcom);

appendstring(' hypernodeelt:HYPERDTREE_phypernodeelt;',rightcom);
appendstring('\\',rightcom);

appendstring(' params:LDMRULES_LiParameters;',rightcom);
appendstring('\\',rightcom);

appendstring(' lsps:LSPARAMS_precord;',rightcom);
appendstring('\\',rightcom);

appendstring(' elts:HYPERDTREE_SetOfHyperNodeElt;',rightcom);
appendstring('\\',rightcom);


appendstring('BEGIN',body);
appendstring('\\',body);

appendstring('HYPERDTREE_emptynode(elts);',body);
appendstring('\\',body);

appendstring('lsps:=NIL;',body);
appendstring('\\',body);

IF rulenode THEN
BEGIN appendstring('HYPERDTREE_NewHyperDtree(d);',body);
appendstring('\\',body);
 END
ELSE
BEGIN appendstring('HYPERDTREE_NewHyperDtreeLeave(d);',body);
appendstring('\\',body);
 
appendstring('d^.basicnodekind:=HYPERDTREE_basicnode;',body);
appendstring('\\',body);

END;
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
;
 BEGIN subgrammarname:=currenttree^.ldfield.TERMINAL^.str END
END;

3: begin
  BEGIN END
;
 BEGIN END
END;

4: begin
  BEGIN DTREE__counter:=counter;
DTREE__externcounter:=externcounter;
DTREE__name:=name;
END
; mrucomCODE_DTREEproc(currenttree
,DTREE__name
,DTREE__rightcom
,DTREE__comactions
,DTREE__decomactions
,DTREE__extern
,DTREE__levelids
,DTREE__counter
,DTREE__externcounter
);
 BEGIN appendlocfile(DTREE__rightcom,procedures);
appendlocfile(DTREE__extern,externprocedures);
appendlocfile(DTREE__comactions,comactions);
appendlocfile(DTREE__decomactions,decomactions);
appendsets(DTREE__levelids,levelids);
counter:=DTREE__counter;
externcounter:=DTREE__externcounter;
str:=currenttree^.ldfield.DTREEfield^.str;
appendstring('dson:=crdtree',body);
 appendstring(str,body);
 
IF not currenttree^.ldfield.DTREEfield^.normalnode THEN appendstring(mrucomDECL_convinttostring(externcounter),body);
 appendstring(';',body);
appendstring('\\',body);

appendstring('HYPERDTREE_AddToTuple(dson,d^.args);',body);
appendstring('\\',body);

END
END;

5: begin
  BEGIN str:=currenttree^.ldfield.TERMINAL^.str;paramname:=str; END
;
 BEGIN appendstring('lsps^.X',body);
 appendstring(mrucomDECL_convinttostring(number),body);
 
appendstring(str,body);
 appendstring(':=',body);

END
END;

6: begin
  BEGIN str:=currenttree^.ldfield.TERMINAL^.str END
;
 BEGIN appendstring(str,body);
 appendstring(';',body);
appendstring('\\',body);
 

IF not substpar THEN
BEGIN
appendstring('lsps:=loopholes.retype(',decomactions);
 appendstring(name,decomactions);
 appendstring('delt',decomactions);
 appendstring(mrucomDECL_convinttostring(counter),decomactions);

appendstring('^.parameters.ls,LSPARAMS_precord);',decomactions);
appendstring('\\',decomactions);

appendstring('match:=match AND (',decomactions);
 appendstring(str,decomactions);
 appendstring('=',decomactions);
 appendstring('\\',decomactions);

appendstring('lsps^.X',decomactions);
 appendstring(mrucomDECL_convinttostring(number),decomactions);
 
appendstring(paramname,decomactions);
 appendstring(');',decomactions);
 appendstring('\\',decomactions);
 
END ELSE substpar:=FALSE;

END
END;

7: begin
  BEGIN str:=currenttree^.ldfield.TERMINAL^.str END
;
 BEGIN TSTRING_ExtractEND(str,str,2);
appendstring('-',body);
 appendstring(str,body);
 appendstring('-1;',body);
 appendstring('\\',body);

appendstring('params.index:=-',body);
 appendstring(str,body);
 appendstring('-1;',body);
appendstring('\\',body);


str:=currenttree^.ldfield.TERMINAL^.str;
appendstring(str,decomactions);
 appendstring(':=',decomactions);
 
appendstring(name,decomactions);
 appendstring('delt',decomactions);
 appendstring(mrucomDECL_convinttostring(counter),decomactions);

appendstring('^.parameters.index;',decomactions);
 appendstring('\\',decomactions);
 

END
END;

8: begin
  BEGIN str:=currenttree^.ldfield.KEYNAMEfield^.str1 END
;
 BEGIN 
appendstring('d^.Isrulenode:=FALSE;',body);
appendstring('\\',body);

appendstring('d^.basicnodekind:=HYPERDTREE_basicnode;',body);
appendstring('\\',body);

IF NOT(currenttree^.ldfield.KEYNAMEfield^.keyIvar) THEN
BEGIN
appendstring('HYPERDTREE_NewHyperDtreeBxpr(hypernodeelt,auxkey(''',body);
 appendstring(str,body);

appendstring('''));',body);
appendstring('\\',body);

END
ELSE
BEGIN
appendstring('HYPERDTREE_NewHyperDtreeBxpr(hypernodeelt,0);',body);
appendstring('\\',body);

END;
appendstring('HYPERDTREE_AddToNode(hypernodeelt,elts);',body);
appendstring('\\',body);

IF currenttree^.ldfield.KEYNAMEfield^.keyIvar THEN 
BEGIN
counter:=counter+1;
appendstring(name,body);
 appendstring('d',body);
 appendstring(mrucomDECL_convinttostring(counter),body);
 appendstring(':=d;',body);
appendstring('\\',body);


appendstring('hulpstree:=LDBLEX_read(',comactions);
 appendstring(str,comactions);
 appendstring(');',comactions);
appendstring('\\',comactions);

appendstring(name,comactions);
 appendstring('d',comactions);
 appendstring(mrucomDECL_convinttostring(counter),comactions);
 
appendstring('^.li^.stree:=loopholes.retype',comactions);

appendstring('(hulpstree,HYPERDTREE_pstree);',comactions);
appendstring('\\',comactions);


appendstring('hulplsstree:=loopholes.retype(',decomactions);
 appendstring('\\',decomactions);
appendstring(name,decomactions);
 appendstring('d',decomactions);
 appendstring(mrucomDECL_convinttostring(counter),decomactions);

appendstring('^.li^.stree,LSSTREE_pstree);',decomactions);
appendstring('\\',decomactions);

appendstring('IF match THEN ',decomactions);
 
appendstring(str,decomactions);
 appendstring(':=hulplsstree^.ls^.',decomactions);
 appendstring(category,decomactions);

appendstring('field^.key;',decomactions);
appendstring('\\',decomactions);
 

END;
END
END;

9: begin
  BEGIN str:=currenttree^.ldfield.LABELEDTDfield^.rhslabel.str END
; mrucomCODE_LABELEDTDproc(currenttree
,LABELEDTD__indent
,LABELEDTD__name
,LABELEDTD__submodeltree
,LABELEDTD__righttolefttable
,LABELEDTD__root
,LABELEDTD__leftcom
,LABELEDTD__rightcom
,LABELEDTD__dtreeproc
,LABELEDTD__numberofitems
,LABELEDTD__keymentioned
,LABELEDTD__keyvar
,LABELEDTD__keystr1
,LABELEDTD__keystr2
,LABELEDTD__levelids
);
 BEGIN treevarname:=currenttree^.ldfield.LABELEDTDfield^.treevarname;
levelids:=LABELEDTD__levelids;
category:=currenttree^.ldfield.LABELEDTDfield^.category;

externcounter:=externcounter+1;
appendstring('PROCEDURE matchtree',externprocedures);
 appendstring(mrucomDECL_convinttostring(externcounter),externprocedures);

appendstring('(s:LSSTREE_pstree;VAR match:BOOLEAN);',externprocedures);
appendstring('\\',externprocedures);

appendlocfile(LABELEDTD__leftcom,externprocedures);
appendstring('BEGIN',externprocedures);
appendstring('\\',externprocedures);

IF currenttree^.ldfield.LABELEDTDfield^.containsTi THEN
BEGIN
appendstring(treevarname,externprocedures);
 appendstring(':=s;',externprocedures);
appendstring('\\',externprocedures);

appendstring('match:=TRUE;',externprocedures);
appendstring('\\',externprocedures);

END
ELSE
BEGIN
appendstring('matchnode(s,match);',externprocedures);
appendstring('\\',externprocedures);

appendstring('match:=match AND (s^.sons=NIL);',externprocedures);
appendstring('\\',externprocedures);

END;
appendstring('IF match THEN match:= matchcond',externprocedures);
 appendstring(str,externprocedures);
 appendstring(';',externprocedures);
appendstring('\\',externprocedures);

appendstring('END;',externprocedures);
appendstring('\\',externprocedures);

appendstring('PROCEDURE createtree',externprocedures);
 appendstring(mrucomDECL_convinttostring(externcounter),externprocedures);
 appendstring('(VAR s:LSSTREE_pstree);',externprocedures);
appendstring('\\',externprocedures);

appendlocfile(LABELEDTD__rightcom,externprocedures);
appendstring('BEGIN',externprocedures);
appendstring('\\',externprocedures);

IF currenttree^.ldfield.LABELEDTDfield^.containsTi THEN
BEGIN
appendstring('s:=',externprocedures);
 appendstring(treevarname,externprocedures);
 appendstring(';',externprocedures);
appendstring('\\',externprocedures);

END
ELSE
BEGIN
appendstring('s:=MAKET_stree(',externprocedures);
 appendstring(category,externprocedures);
 appendstring(');',externprocedures);
appendstring('\\',externprocedures);

appendstring('createnode(s);s^.sons:=NIL',externprocedures);
appendstring('\\',externprocedures);

END;
appendstring('END;',externprocedures);
appendstring('\\',externprocedures);

counter:=counter+1;

appendstring('createtree',comactions);
 appendstring(mrucomDECL_convinttostring(externcounter),comactions);
 appendstring('(hulplsstree);',comactions);
appendstring('\\',comactions);

appendstring(name,comactions);
 appendstring('d',comactions);
 appendstring(mrucomDECL_convinttostring(counter),comactions);
 
appendstring('^.li^.stree:=loopholes.retype',comactions);

appendstring('(hulplsstree,Hyperdtree_pstree);',comactions);
appendstring('\\',comactions);


appendstring('hulplsstree:=loopholes.retype(',decomactions);
 appendstring('\\',decomactions);
appendstring(name,decomactions);
 appendstring('d',decomactions);
 appendstring(mrucomDECL_convinttostring(counter),decomactions);

appendstring('^.li^.stree,LSSTREE_pstree);',decomactions);
appendstring('\\',decomactions);

appendstring('IF match THEN matchtree',decomactions);
 appendstring(mrucomDECL_convinttostring(externcounter),decomactions);

appendstring('(hulplsstree,match);',decomactions);
appendstring('\\',decomactions);


IF currenttree^.ldfield.LABELEDTDfield^.varcat THEN
BEGIN
appendstring('HYPERDTREE_NewHyperDtreeVar(hypernodeelt,0,LICAT0);',body);
appendstring('\\',body);

appendstring('d^.basicnodekind:=HYPERDTREE_varnode;',body);
appendstring('\\',body);

END
ELSE
BEGIN
appendstring('HYPERDTREE_NewHyperDtreeBxpr(hypernodeelt,0);',body);
appendstring('\\',body);

END;
appendstring('HYPERDTREE_AddToNode(hypernodeelt,elts);',body);
appendstring('\\',body);

appendstring(name,body);
 appendstring('d',body);
 appendstring(mrucomDECL_convinttostring(counter),body);
 appendstring(':=d;',body);
appendstring('\\',body);

END
END;

10: begin
  BEGIN END
;
 BEGIN appendstring('params.index:=',body);

END
END;

11: begin
  BEGIN END
; mrucomCODE_BARETDproc(currenttree
,BARETD__indent
,BARETD__name
,BARETD__righttolefttable
,BARETD__root
,BARETD__leftcom
,BARETD__rightcom
,BARETD__dtreeproc
,BARETD__NumberOfItems
,BARETD__keymentioned
,BARETD__keyvar
,BARETD__keystr1
,BARETD__levelids
,BARETD__keystr2
);
 BEGIN 
category:=currenttree^.ldfield.BARETDfield^.category;
appendsets(BARETD__levelids,levelids);
treevarname:=currenttree^.ldfield.BARETDfield^.treevarname;
externcounter:=externcounter+1;
appendstring('PROCEDURE matchtree',externprocedures);
 appendstring(mrucomDECL_convinttostring(externcounter),externprocedures);

appendstring('(s:LSSTREE_pstree;VAR match:BOOLEAN);',externprocedures);
appendstring('\\',externprocedures);

appendlocfile(BARETD__leftcom,externprocedures);
appendstring('BEGIN',externprocedures);
appendstring('\\',externprocedures);

IF currenttree^.ldfield.BARETDfield^.containsTi THEN
BEGIN
appendstring(treevarname,externprocedures);
 appendstring(':=s;',externprocedures);
appendstring('\\',externprocedures);

appendstring('match:=TRUE;',externprocedures);
appendstring('\\',externprocedures);

END
ELSE
BEGIN
appendstring('matchnode(s,match);',externprocedures);
appendstring('\\',externprocedures);

IF BARETD__numberofitems=0 THEN BEGIN
appendstring('match:=match AND (s^.sons=NIL);',externprocedures);
appendstring('\\',externprocedures);
 END
ELSE BEGIN
numberofitems:=BARETD__numberofitems;
appendstring('IF match THEN matchlist',externprocedures);

appendstring(mrucomDECL_convinttostring(numberofitems),externprocedures);

appendstring('items(s^.sons,TRUE,match);',externprocedures);
appendstring('\\',externprocedures);

END;
END;
appendstring('END;',externprocedures);
appendstring('\\',externprocedures);

appendstring('PROCEDURE createtree',externprocedures);
 appendstring(mrucomDECL_convinttostring(externcounter),externprocedures);
 appendstring('(VAR s:LSSTREE_pstree);',externprocedures);
appendstring('\\',externprocedures);

appendstring('VAR list:LSMRUQUO_listofstrees;',externprocedures);
appendstring('\\',externprocedures);

appendlocfile(BARETD__rightcom,externprocedures);
appendstring('BEGIN',externprocedures);
appendstring('\\',externprocedures);

IF currenttree^.ldfield.BARETDfield^.containsTi THEN
BEGIN
appendstring('s:=',externprocedures);
 appendstring(treevarname,externprocedures);
 appendstring(';',externprocedures);
appendstring('\\',externprocedures);

END
ELSE
BEGIN
appendstring('s:=MAKET_stree(',externprocedures);
 appendstring(category,externprocedures);
 appendstring(');',externprocedures);
appendstring('\\',externprocedures);

appendstring('createnode(s);',externprocedures);
appendstring('\\',externprocedures);

appendstring('createlist1(list);s^.sons:=list.first;',externprocedures);
appendstring('\\',externprocedures);

appendstring('IF list.first<>NIL THEN',externprocedures);
 appendstring(' list.last^.brother:=NIL;',externprocedures);
appendstring('\\',externprocedures);

END;
appendstring('END;',externprocedures);
appendstring('\\',externprocedures);

counter:=counter+1;

appendstring('createtree',comactions);
 appendstring(mrucomDECL_convinttostring(externcounter),comactions);
 appendstring('(hulplsstree);',comactions);
appendstring('\\',comactions);

appendstring(name,comactions);
 appendstring('d',comactions);
 appendstring(mrucomDECL_convinttostring(counter),comactions);
 
appendstring('^.li^.stree:=loopholes.retype',comactions);

appendstring('(hulplsstree,hyperdtree_pstree);',comactions);
appendstring('\\',comactions);


appendstring('hulplsstree:=loopholes.retype(',decomactions);
 appendstring('\\',decomactions);
appendstring(name,decomactions);
 appendstring('d',decomactions);
 appendstring(mrucomDECL_convinttostring(counter),decomactions);

appendstring('^.li^.stree,LSSTREE_pstree);',decomactions);
appendstring('\\',decomactions);

appendstring('IF match THEN matchtree',decomactions);
 appendstring(mrucomDECL_convinttostring(externcounter),decomactions);

appendstring('(hulplsstree,match);',decomactions);
appendstring('\\',decomactions);


IF currenttree^.ldfield.BARETDfield^.varcat THEN
BEGIN
appendstring('HYPERDTREE_NewHyperDtreeVar(hypernodeelt,0,LICAT0);',body);
appendstring('\\',body);

appendstring('d^.basicnodekind:=HYPERDTREE_varnode;',body);
appendstring('\\',body);

END
ELSE
BEGIN
appendstring('HYPERDTREE_NewHyperDtreeBxpr(hypernodeelt,0);',body);
appendstring('\\',body);

END;
appendstring('HYPERDTREE_AddToNode(hypernodeelt,elts);',body);
appendstring('\\',body);

appendstring(name,body);
 appendstring('d',body);
 appendstring(mrucomDECL_convinttostring(counter),body);
 appendstring(':=d;',body);
appendstring('\\',body);

END
END;

12: begin
  BEGIN str:=currenttree^.ldfield.TERMINAL^.str END
;
 BEGIN 
nrofrules:=nrofrules + 1;
IF nrofrules>1 THEN
BEGIN
appendstring('params.ls:=loopholes.retype(lsps,LDMRULES_lsparams);',body);
appendstring('\\',body);

appendstring('HYPERDTREE_NewHyperDtreeRule',body);

appendstring('(hypernodeelt,0,number,params);',body);
appendstring('\\',body);

appendstring('HYPERDTREE_AddToNode(hypernodeelt,elts);',body);
appendstring('\\',body);

IF paramspresent THEN
BEGIN appendstring(name,body);

appendstring('delt',body);
 appendstring(mrucomDECL_convinttostring(counter),body);
 appendstring(':=hypernodeelt;',body);
appendstring('\\',body);

END;
END;
paramspresent:=FALSE;
number:=0;
TSTRING_extractchars(str1,len1,str,1,length(str));
len:=len1;
appendstring('number:=',body);
 
LDMRULES_rulenumber(number,str1,len);
IF number=0 THEN
BEGIN
appendstring('-',body);

LDMRULES_transformationnumber(number,str1,len);
END;
appendstring(mrucomDECL_convinttostring(number),body);
 appendstring(';',body);
appendstring('\\',body);

{ appendstring('LDMRULES_rulenumber(number,',body);
 appendstring('''',body);
 appendstring(str,body);
 appendstring('''',body);

appendstring(',',body);
 appendstring(mrucomDECL_convinttostring(TSTRING_length(str)),body);
 appendstring(');',body);
appendstring('\\',body);

appendstring('IF number=0 THEN BEGIN',body);
appendstring('\\',body);

appendstring('LDMRULES_transformationnumber(number,',body);
 appendstring('''',body);
 appendstring(str,body);
 appendstring('''',body);

appendstring(',',body);
 appendstring(mrucomDECL_convinttostring(TSTRING_length(str)),body);
 appendstring(');',body);
 appendstring('\\',body);

appendstring('number:=-number;',body);
appendstring('\\',body);
 
appendstring('END;',body);
appendstring('\\',body);
}
appendstring('MEM_NewDefault(loopholes.sizeof(LSPARAMS_record),',body);

appendstring('loopholes.retype(lsps,MEM_ptr));',body);
 appendstring('\\',body);

appendstring('params.index:=-1;params.subst:=-1;',body);
appendstring('\\',body);

IF number=0 THEN 
BEGIN
writeln('WARNING, ',str,' not known as rule or transformation');
IF TSTRING_comparechars(subgrammarname,'IDFORMATION',11)<>0 
THEN crash:=TRUE;
END;
END
END;

13: begin
  BEGIN paramspresent:=TRUE END
;
 BEGIN counter:=counter+1
END
END;

14: begin
  BEGIN substpar:=TRUE END
;
 BEGIN appendstring('params.subst:=',body);
 END
END;

15: begin
  BEGIN END
;
 BEGIN
appendstring('params.ls:=loopholes.retype(lsps,LDMRULES_lsparams);',body);
appendstring('\\',body);

appendstring('HYPERDTREE_NewHyperDtreeRule',body);

appendstring('(hypernodeelt,0,number,params);',body);
appendstring('\\',body);

appendstring('HYPERDTREE_AddToNode(hypernodeelt,elts);',body);
appendstring('\\',body);

IF paramspresent THEN
BEGIN appendstring(name,body);

appendstring('delt',body);
 appendstring(mrucomDECL_convinttostring(counter),body);
 appendstring(':=hypernodeelt;',body);
appendstring('\\',body);

END;
END
END;

16: begin
  BEGIN END
;
 BEGIN category:=currenttree^.ldfield.TERMINAL^.str
END
END;

17: begin
  BEGIN END
;
 BEGIN  appendstring('loopholes.retype(',comactions);

appendstring(name,comactions);
 appendstring('delt',comactions);
 appendstring(mrucomDECL_convinttostring(counter),comactions);

appendstring('^.parameters.ls,LSPARAMS_precord)^.X',comactions);
 appendstring(mrucomDECL_convinttostring(number),comactions);

appendstring('vpid:=VPID;',comactions);
 appendstring('\\',comactions);
 

appendstring('VPID:=loopholes.retype(',decomactions);
 appendstring(name,decomactions);
 appendstring('delt',decomactions);
 
appendstring(mrucomDECL_convinttostring(counter),decomactions);
 appendstring('^.parameters.ls,LSPARAMS_precord)^.X',decomactions);
 
appendstring(mrucomDECL_convinttostring(number),decomactions);
 appendstring('vpid;',decomactions);
 appendstring('\\',decomactions);
 
END
END;

END;

rsnode1:=rsnode1^.brother END;
BEGIN appendlocfile(procedures,rightcom);
IF FALSE{crash} THEN
BEGIN
ptr:=NIL;
dispose(ptr);
END;

IF nrargs>0 THEN
BEGIN
appendstring('d^.nrofargs:=',body);
 appendstring(mrucomDECL_convinttostring(nrargs),body);
 appendstring(';',body);
appendstring('\\',body);

END;
appendstring('HYPERDTREE_addcluster(elts,d^.elts);',body);
appendstring('\\',body);

appendstring('crdtree',body);
 appendstring(procedurename,body);
 
IF not normalnode THEN appendstring(mrucomDECL_convinttostring(externcounter),body);
 appendstring(':=d;',body);
appendstring('\\',body);

appendstring('END;',body);
appendstring('\\',body);

appendlocfile(body,rightcom);
DTREE_rightcom:=rightcom; 
DTREE_comactions:=comactions; 
DTREE_extern:=externprocedures;
DTREE_decomactions:=decomactions; 
DTREE_counter:=counter; 
DTREE_levelids:=levelids; 
DTREE_externcounter:=externcounter; 
END
END;
PROCEDURE mrucomCODE_LABELEDDTREEproc(top:mrucomDECL_psnode
;LABELEDDTREE_name              :TSTRING_string
;var LABELEDDTREE_rightcom              :LOCALFILE
;var LABELEDDTREE_levelids              :mrucomlangspec_setofidents
;var LABELEDDTREE_comactions              :LOCALFILE
;var LABELEDDTREE_decomactions              :LOCALFILE
;var LABELEDDTREE_extern              :LOCALFILE
);
VAR currenttree:mrucomDECL_psnode;
    rsnode1:mrucomDECL_prsnode;
 extern,rightcom,comactions,decomactions:LOCALFILE;
name,str:TSTRING_string;
levelids: mrucomLANGSPEC_setofidents;
BEGIN
 BEGIN initlocalfile(rightcom);name:=LABELEDDTREE_name;
str:=top^.ldfield.LABELEDDTREEfield^.str;
initsetofidents(levelids);

appendstring('function crdtree',rightcom);
 appendstring(name,rightcom);
 appendstring(';',rightcom);
appendstring('\\',rightcom);

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
  BEGIN DTREE__counter:=0;
DTREE__externcounter:=0;
DTREE__name:=name;
END
; mrucomCODE_DTREEproc(currenttree
,DTREE__name
,DTREE__rightcom
,DTREE__comactions
,DTREE__decomactions
,DTREE__extern
,DTREE__levelids
,DTREE__counter
,DTREE__externcounter
);
 BEGIN appendlocfile(DTREE__rightcom,rightcom);
comactions:=DTREE__comactions;
levelids:=DTREE__levelids;
decomactions:=DTREE__decomactions;
extern:=DTREE__extern;
END
END;

3: begin
  BEGIN END
;
 BEGIN END
END;

END;

rsnode1:=rsnode1^.brother END;
BEGIN 
appendstring('BEGIN',rightcom);
appendstring('\\',rightcom);

appendstring('crdtree',rightcom);
 appendstring(name,rightcom);
 appendstring(':=crdtree',rightcom);
 appendstring(str,rightcom);
appendstring('\\',rightcom);

appendstring('END;',rightcom);
appendstring('\\',rightcom);

LABELEDDTREE_rightcom:=rightcom;
LABELEDDTREE_extern:=extern; 
LABELEDDTREE_levelids:=levelids;
LABELEDDTREE_comactions:=comactions;
LABELEDDTREE_decomactions:=decomactions;
END
END;
