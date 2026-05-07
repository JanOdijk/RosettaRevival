export(mrusurcomwrite);
pragma c_include('mrusurcomwrite.pf');
pragma c_include('mrusurcomdecl.pf');
pragma c_include('string.pf');
program mrusurcomwrite;
with strng,mrusurcomdecl;
      function mrusurcomwrite_compname:string;
 VAR filestr:STRING_string;
begin
filestr:='mrucom';
STRING_LowerCase(filestr,filestr);
mrusurcomwrite_compname:=filestr;
end;
     procedure mrusurcomwrite_init(
    var of1:text);
begin
writeln(of1,'initSETOFparams(paramtable);');
writeln(of1,'initsetofsyncats(syncattable);');
writeln(of1,'initSETOFidents(leftrecords);');
writeln(of1,'initSETOFidents(rightrecords);');
writeln(of1,'initSETOFidents(otherrecords);');
end;
     procedure mrusurcomwrite_tables(
    var of1:text);
begin
writeln(of1,'paramtable              :mrucomlangspec_SETOFparams;');
writeln(of1,'syncattable              :mrucomlangspec_setofsyncats;');
writeln(of1,'leftrecords              :mrucomlangspec_SETOFidents;');
writeln(of1,'rightrecords              :mrucomlangspec_SETOFidents;');
writeln(of1,'otherrecords              :mrucomlangspec_SETOFidents;');
end;
     procedure mrusurcomwrite_inhsynatts(
    var of1:text);
begin









writeln(of1,'LEFTMODELS__name              :TSTRING_string');
write(of1,';');
writeln(of1,'LEFTMODELS__righttolefttable              :mrucomlangspec_setofidents');
write(of1,';');
writeln(of1,'LEFTMODELS__leftcom              :LOCALFILE');
write(of1,';');
writeln(of1,'LEFTMODELS__leftdecom              :LOCALFILE');
write(of1,';');
writeln(of1,'LEFTMODELS__dtreeproc              :LOCALFILE');
write(of1,';');
writeln(of1,'LEFTMODELS__levelids              :mrucomlangspec_setofidents');
write(of1,';');


writeln(of1,'RIGHTMODEL__name              :TSTRING_string');
write(of1,';');
writeln(of1,'RIGHTMODEL__righttolefttable              :mrucomlangspec_setofidents');
write(of1,';');
writeln(of1,'RIGHTMODEL__rightcom              :LOCALFILE');
write(of1,';');
writeln(of1,'RIGHTMODEL__rightdecom              :LOCALFILE');
write(of1,';');
writeln(of1,'RIGHTMODEL__dtreeproc              :LOCALFILE');
write(of1,';');
writeln(of1,'RIGHTMODEL__levelids              :mrucomlangspec_setofidents');
write(of1,';');
writeln(of1,'RIGHTMODEL__dtreelevelids              :mrucomlangspec_setofidents');
write(of1,';');


writeln(of1,'MATCHCONDS__leftMuVarList              :mrucomlangspec_SETOFidents');
write(of1,';');
writeln(of1,'MATCHCONDS__leftSigmaVarList              :mrucomlangspec_SETOFidents');
write(of1,';');
writeln(of1,'MATCHCONDS__leftRelVarList              :mrucomlangspec_SETOFidents');
write(of1,';');
writeln(of1,'MATCHCONDS__leftTreeVarList              :mrucomlangspec_SETOFidents');
write(of1,';');
writeln(of1,'MATCHCONDS__leftNodeVarList              :mrucomlangspec_SETOFidents');
write(of1,';');
writeln(of1,'MATCHCONDS__rightMuVarList              :mrucomlangspec_SETOFidents');
write(of1,';');
writeln(of1,'MATCHCONDS__rightSigmaVarList              :mrucomlangspec_SETOFidents');
write(of1,';');
writeln(of1,'MATCHCONDS__rightRelVarList              :mrucomlangspec_SETOFidents');
write(of1,';');
writeln(of1,'MATCHCONDS__rightTreeVarList              :mrucomlangspec_SETOFidents');
write(of1,';');
writeln(of1,'MATCHCONDS__rightNodeVarList              :mrucomlangspec_SETOFidents');
write(of1,';');
writeln(of1,'MATCHCONDS__indent              :mrucomlangspec_int');
write(of1,';');
writeln(of1,'MATCHCONDS__commatchfile              :LOCALFILE');
write(of1,';');
writeln(of1,'MATCHCONDS__decommatchfile              :LOCALFILE');
write(of1,';');




writeln(of1,'SUBRULES__indent              :mrucomlangspec_int');
write(of1,';');
writeln(of1,'SUBRULES__name              :TSTRING_string');
write(of1,';');
writeln(of1,'SUBRULES__leftsyncattable              :mrucomlangspec_setofsyncats');
write(of1,';');
writeln(of1,'SUBRULES__rightsyncattable              :mrucomlangspec_setofsyncats');
write(of1,';');
writeln(of1,'SUBRULES__leftrecordtable              :mrucomlangspec_setofidents');
write(of1,';');
writeln(of1,'SUBRULES__rightrecordtable              :mrucomlangspec_setofidents');
write(of1,';');
writeln(of1,'SUBRULES__prevleftrhslabels              :mrucomlangspec_setofidents');
write(of1,';');
writeln(of1,'SUBRULES__prevrightrhslabels              :mrucomlangspec_setofidents');
write(of1,';');
writeln(of1,'SUBRULES__leftmuvarlist              :mrucomlangspec_setofidents');
write(of1,';');
writeln(of1,'SUBRULES__leftsigmavarlist              :mrucomlangspec_setofidents');
write(of1,';');
writeln(of1,'SUBRULES__lefttreevarlist              :mrucomlangspec_setofidents');
write(of1,';');
writeln(of1,'SUBRULES__rightmuvarlist              :mrucomlangspec_setofidents');
write(of1,';');
writeln(of1,'SUBRULES__rightsigmavarlist              :mrucomlangspec_setofidents');
write(of1,';');
writeln(of1,'SUBRULES__righttreevarlist              :mrucomlangspec_setofidents');
write(of1,';');
writeln(of1,'SUBRULES__modelnumber              :mrucomlangspec_int');
write(of1,';');
writeln(of1,'SUBRULES__vartypes              :mrucomlangspec_setofvartypes');
write(of1,';');
writeln(of1,'SUBRULES__comsubrules              :LOCALFILE');
write(of1,';');
writeln(of1,'SUBRULES__decomsubrules              :LOCALFILE');
write(of1,';');
writeln(of1,'SUBRULES__dtreeproc              :LOCALFILE');
write(of1,';');


writeln(of1,'SUBFILTERS__indent              :mrucomlangspec_int');
write(of1,';');
writeln(of1,'SUBFILTERS__prevrightrhslabels              :mrucomlangspec_setofidents');
write(of1,';');
writeln(of1,'SUBFILTERS__vartypes              :mrucomlangspec_setofvartypes');
write(of1,';');
writeln(of1,'SUBFILTERS__comsubrules              :LOCALFILE');
write(of1,';');
writeln(of1,'SUBFILTERS__decomsubrules              :LOCALFILE');
write(of1,';');


writeln(of1,'COMCAPAIRS__actionteller              :mrucomlangspec_teller');
write(of1,';');
writeln(of1,'COMCAPAIRS__actiontellers              :mrucomlangspec_setoftellers');
write(of1,';');
writeln(of1,'COMCAPAIRS__indent              :mrucomlangspec_int');
write(of1,';');
writeln(of1,'COMCAPAIRS__syncattable              :mrucomlangspec_setofsyncats');
write(of1,';');
writeln(of1,'COMCAPAIRS__recordtable              :mrucomlangspec_setofidents');
write(of1,';');
writeln(of1,'COMCAPAIRS__modelnumber              :mrucomlangspec_int');
write(of1,';');
writeln(of1,'COMCAPAIRS__level              :mrucomlangspec_int');
write(of1,';');
writeln(of1,'COMCAPAIRS__insubrule              :mrucomlangspec_bool');
write(of1,';');
writeln(of1,'COMCAPAIRS__filter              :mrucomlangspec_bool');
write(of1,';');
writeln(of1,'COMCAPAIRS__vartypes              :mrucomlangspec_setofvartypes');
write(of1,';');
writeln(of1,'COMCAPAIRS__rhslabels              :mrucomlangspec_setofidents');
write(of1,';');
writeln(of1,'COMCAPAIRS__conditions              :LOCALFILE');
write(of1,';');
writeln(of1,'COMCAPAIRS__actions              :LOCALFILE');
write(of1,';');
writeln(of1,'COMCAPAIRS__allexist              :LOCALFILE');
write(of1,';');
writeln(of1,'COMCAPAIRS__allexistcounter              :mrucomlangspec_int');
write(of1,';');


writeln(of1,'DECOMCAPAIRS__actionteller              :mrucomlangspec_teller');
write(of1,';');
writeln(of1,'DECOMCAPAIRS__actiontellers              :mrucomlangspec_setoftellers');
write(of1,';');
writeln(of1,'DECOMCAPAIRS__indent              :mrucomlangspec_int');
write(of1,';');
writeln(of1,'DECOMCAPAIRS__syncattable              :mrucomlangspec_setofsyncats');
write(of1,';');
writeln(of1,'DECOMCAPAIRS__recordtable              :mrucomlangspec_setofidents');
write(of1,';');
writeln(of1,'DECOMCAPAIRS__modelnumber              :mrucomlangspec_int');
write(of1,';');
writeln(of1,'DECOMCAPAIRS__level              :mrucomlangspec_int');
write(of1,';');
writeln(of1,'DECOMCAPAIRS__insubrule              :mrucomlangspec_bool');
write(of1,';');
writeln(of1,'DECOMCAPAIRS__filter              :mrucomlangspec_bool');
write(of1,';');
writeln(of1,'DECOMCAPAIRS__vartypes              :mrucomlangspec_setofvartypes');
write(of1,';');
writeln(of1,'DECOMCAPAIRS__rhslabels              :mrucomlangspec_setofidents');
write(of1,';');
writeln(of1,'DECOMCAPAIRS__conditions              :LOCALFILE');
write(of1,';');
writeln(of1,'DECOMCAPAIRS__actions              :LOCALFILE');
write(of1,';');
writeln(of1,'DECOMCAPAIRS__allexist              :LOCALFILE');
write(of1,';');
writeln(of1,'DECOMCAPAIRS__allexistcounter              :mrucomlangspec_int');
write(of1,';');


writeln(of1,'CAPAIRS__actionteller              :mrucomlangspec_teller');
write(of1,';');
writeln(of1,'CAPAIRS__actiontellers              :mrucomlangspec_setoftellers');
write(of1,';');
writeln(of1,'CAPAIRS__indent              :mrucomlangspec_int');
write(of1,';');
writeln(of1,'CAPAIRS__syncattable              :mrucomlangspec_setofsyncats');
write(of1,';');
writeln(of1,'CAPAIRS__recordtable              :mrucomlangspec_setofidents');
write(of1,';');
writeln(of1,'CAPAIRS__modelnumber              :mrucomlangspec_int');
write(of1,';');
writeln(of1,'CAPAIRS__level              :mrucomlangspec_int');
write(of1,';');
writeln(of1,'CAPAIRS__insubrule              :mrucomlangspec_bool');
write(of1,';');
writeln(of1,'CAPAIRS__filter              :mrucomlangspec_bool');
write(of1,';');
writeln(of1,'CAPAIRS__vartypes              :mrucomlangspec_setofvartypes');
write(of1,';');
writeln(of1,'CAPAIRS__rhslabels              :mrucomlangspec_setofidents');
write(of1,';');
writeln(of1,'CAPAIRS__conditions              :LOCALFILE');
write(of1,';');
writeln(of1,'CAPAIRS__actions              :LOCALFILE');
write(of1,';');
writeln(of1,'CAPAIRS__allexist              :LOCALFILE');
write(of1,';');
writeln(of1,'CAPAIRS__allexistcounter              :mrucomlangspec_int');
write(of1,';');


writeln(of1,'bareCAPAIRS__actionteller              :mrucomlangspec_teller');
write(of1,';');
writeln(of1,'bareCAPAIRS__actiontellers              :mrucomlangspec_setoftellers');
write(of1,';');
writeln(of1,'bareCAPAIRS__indent              :mrucomlangspec_int');
write(of1,';');
writeln(of1,'bareCAPAIRS__syncattable              :mrucomlangspec_setofsyncats');
write(of1,';');
writeln(of1,'bareCAPAIRS__recordtable              :mrucomlangspec_setofidents');
write(of1,';');
writeln(of1,'bareCAPAIRS__modelnumber              :mrucomlangspec_int');
write(of1,';');
writeln(of1,'bareCAPAIRS__level              :mrucomlangspec_int');
write(of1,';');
writeln(of1,'bareCAPAIRS__insubrule              :mrucomlangspec_bool');
write(of1,';');
writeln(of1,'bareCAPAIRS__filter              :mrucomlangspec_bool');
write(of1,';');
writeln(of1,'bareCAPAIRS__vartypes              :mrucomlangspec_setofvartypes');
write(of1,';');
writeln(of1,'bareCAPAIRS__rhslabels              :mrucomlangspec_setofidents');
write(of1,';');
writeln(of1,'bareCAPAIRS__conditions              :LOCALFILE');
write(of1,';');
writeln(of1,'bareCAPAIRS__actions              :LOCALFILE');
write(of1,';');
writeln(of1,'bareCAPAIRS__allexist              :LOCALFILE');
write(of1,';');
writeln(of1,'bareCAPAIRS__allexistcounter              :mrucomlangspec_int');
write(of1,';');


writeln(of1,'LABELEDTD__indent              :mrucomlangspec_INT');
write(of1,';');
writeln(of1,'LABELEDTD__name              :TSTRING_string');
write(of1,';');
writeln(of1,'LABELEDTD__submodeltree              :mrucomlangspec_bool');
write(of1,';');
writeln(of1,'LABELEDTD__righttolefttable              :mrucomlangspec_setofidents');
write(of1,';');
writeln(of1,'LABELEDTD__root              :TSTRING_string');
write(of1,';');
writeln(of1,'LABELEDTD__leftcom              :LOCALFILE');
write(of1,';');
writeln(of1,'LABELEDTD__rightcom              :LOCALFILE');
write(of1,';');
writeln(of1,'LABELEDTD__dtreeproc              :LOCALFILE');
write(of1,';');
writeln(of1,'LABELEDTD__numberofitems              :mrucomlangspec_INT');
write(of1,';');
writeln(of1,'LABELEDTD__keymentioned              :mrucomlangspec_bool');
write(of1,';');
writeln(of1,'LABELEDTD__keyvar              :mrucomlangspec_bool');
write(of1,';');
writeln(of1,'LABELEDTD__keystr1              :TSTRING_string');
write(of1,';');
writeln(of1,'LABELEDTD__keystr2              :TSTRING_string');
write(of1,';');
writeln(of1,'LABELEDTD__levelids              :mrucomlangspec_setofidents');
write(of1,';');


writeln(of1,'LABELtje__indent              :mrucomlangspec_INT');
write(of1,';');


writeln(of1,'BARETD__indent              :mrucomlangspec_INT');
write(of1,';');
writeln(of1,'BARETD__name              :TSTRING_string');
write(of1,';');
writeln(of1,'BARETD__righttolefttable              :mrucomlangspec_SETOFidents');
write(of1,';');
writeln(of1,'BARETD__root              :TSTRING_string');
write(of1,';');
writeln(of1,'BARETD__leftcom              :LOCALFILE');
write(of1,';');
writeln(of1,'BARETD__rightcom              :LOCALFILE');
write(of1,';');
writeln(of1,'BARETD__dtreeproc              :LOCALFILE');
write(of1,';');
writeln(of1,'BARETD__NumberOfItems              :mrucomlangspec_INT');
write(of1,';');
writeln(of1,'BARETD__keymentioned              :mrucomlangspec_bool');
write(of1,';');
writeln(of1,'BARETD__keyvar              :mrucomlangspec_bool');
write(of1,';');
writeln(of1,'BARETD__keystr1              :TSTRING_string');
write(of1,';');
writeln(of1,'BARETD__levelids              :mrucomlangspec_setofidents');
write(of1,';');
writeln(of1,'BARETD__keystr2              :TSTRING_string');
write(of1,';');


writeln(of1,'LABELEDND__indent              :mrucomlangspec_INT');
write(of1,';');
writeln(of1,'LABELEDND__name              :TSTRING_string');
write(of1,';');
writeln(of1,'LABELEDND__shorthand              :TSTRING_string');
write(of1,';');
writeln(of1,'LABELEDND__leftcom              :LOCALFILE');
write(of1,';');
writeln(of1,'LABELEDND__rightcom              :LOCALFILE');
write(of1,';');
writeln(of1,'LABELEDND__dtreeproc              :LOCALFILE');
write(of1,';');
writeln(of1,'LABELEDND__keymentioned              :mrucomlangspec_bool');
write(of1,';');
writeln(of1,'LABELEDND__keyvar              :mrucomlangspec_bool');
write(of1,';');
writeln(of1,'LABELEDND__keystr1              :TSTRING_string');
write(of1,';');
writeln(of1,'LABELEDND__keystr2              :TSTRING_string');
write(of1,';');


writeln(of1,'BAREND__labeled              :mrucomlangspec_bool');
write(of1,';');
writeln(of1,'BAREND__label              :TSTRING_string');
write(of1,';');
writeln(of1,'BAREND__indent              :mrucomlangspec_INT');
write(of1,';');
writeln(of1,'BAREND__shorthand              :TSTRING_string');
write(of1,';');
writeln(of1,'BAREND__name              :TSTRING_string');
write(of1,';');
writeln(of1,'BAREND__leftcom              :LOCALFILE');
write(of1,';');
writeln(of1,'BAREND__rightcom              :LOCALFILE');
write(of1,';');
writeln(of1,'BAREND__dtreeproc              :LOCALFILE');
write(of1,';');
writeln(of1,'BAREND__keymentioned              :mrucomlangspec_bool');
write(of1,';');
writeln(of1,'BAREND__keyvar              :mrucomlangspec_bool');
write(of1,';');
writeln(of1,'BAREND__keystr1              :TSTRING_string');
write(of1,';');
writeln(of1,'BAREND__keystr2              :TSTRING_string');
write(of1,';');




writeln(of1,'LABELEDLD__indent              :mrucomlangspec_INT');
write(of1,';');
writeln(of1,'LABELEDLD__righttolefttable              :mrucomlangspec_setofidents');
write(of1,';');
writeln(of1,'LABELEDLD__submodellist              :mrucomlangspec_bool');
write(of1,';');
writeln(of1,'LABELEDLD__inexist              :mrucomlangspec_bool');
write(of1,';');
writeln(of1,'LABELEDLD__root              :TSTRING_string');
write(of1,';');
writeln(of1,'LABELEDLD__name              :TSTRING_string');
write(of1,';');
writeln(of1,'LABELEDLD__leftcom              :LOCALFILE');
write(of1,';');
writeln(of1,'LABELEDLD__rightcom              :LOCALFILE');
write(of1,';');
writeln(of1,'LABELEDLD__dtreeproc              :LOCALFILE');
write(of1,';');
writeln(of1,'LABELEDLD__NumberOfItems              :mrucomlangspec_INT');
write(of1,';');
writeln(of1,'LABELEDLD__levelids              :mrucomlangspec_setofidents');
write(of1,';');


writeln(of1,'BARELD__label              :TSTRING_string');
write(of1,';');
writeln(of1,'BARELD__labeled              :mrucomlangspec_Bool');
write(of1,';');
writeln(of1,'BARELD__indent              :mrucomlangspec_INT');
write(of1,';');
writeln(of1,'BARELD__inexist              :mrucomlangspec_bool');
write(of1,';');
writeln(of1,'BARELD__bounded              :mrucomlangspec_Bool');
write(of1,';');
writeln(of1,'BARELD__righttolefttable              :mrucomlangspec_SETOFidents');
write(of1,';');
writeln(of1,'BARELD__righttoleftmatch              :mrucomlangspec_BOOL');
write(of1,';');
writeln(of1,'BARELD__root              :TSTRING_string');
write(of1,';');
writeln(of1,'BARELD__name              :TSTRING_string');
write(of1,';');
writeln(of1,'BARELD__leftcom              :LOCALFILE');
write(of1,';');
writeln(of1,'BARELD__rightcom              :LOCALFILE');
write(of1,';');
writeln(of1,'BARELD__dtreeproc              :LOCALFILE');
write(of1,';');
writeln(of1,'BARELD__NumberOfItems              :mrucomlangspec_INT');
write(of1,';');
writeln(of1,'BARELD__levelids              :mrucomlangspec_setofidents');
write(of1,';');


writeln(of1,'TREEVAR__ident              :TSTRING_string');
write(of1,';');


writeln(of1,'CATNAME__ident              :TSTRING_string');
write(of1,';');


writeln(of1,'CATRECNAME__ident              :TSTRING_string');
write(of1,';');


writeln(of1,'NODEVAR__ident              :TSTRING_string');
write(of1,';');


writeln(of1,'ITEM__indent              :mrucomlangspec_INT');
write(of1,';');
writeln(of1,'ITEM__righttolefttable              :mrucomlangspec_SETOFidents');
write(of1,';');
writeln(of1,'ITEM__root              :TSTRING_string');
write(of1,';');
writeln(of1,'ITEM__name              :TSTRING_string');
write(of1,';');
writeln(of1,'ITEM__leftcom              :LOCALFILE');
write(of1,';');
writeln(of1,'ITEM__rightcom              :LOCALFILE');
write(of1,';');
writeln(of1,'ITEM__dtreeproc              :LOCALFILE');
write(of1,';');
writeln(of1,'ITEM__identifier              :TSTRING_string');
write(of1,';');
writeln(of1,'ITEM__levelids              :mrucomlangspec_setofidents');
write(of1,';');


writeln(of1,'LABELEDITEM__indent              :mrucomlangspec_INT');
write(of1,';');
writeln(of1,'LABELEDITEM__righttolefttable              :mrucomlangspec_setofidents');
write(of1,';');
writeln(of1,'LABELEDITEM__root              :TSTRING_string');
write(of1,';');
writeln(of1,'LABELEDITEM__name              :TSTRING_string');
write(of1,';');
writeln(of1,'LABELEDITEM__leftcom              :LOCALFILE');
write(of1,';');
writeln(of1,'LABELEDITEM__rightcom              :LOCALFILE');
write(of1,';');
writeln(of1,'LABELEDITEM__dtreeproc              :LOCALFILE');
write(of1,';');
writeln(of1,'LABELEDITEM__identifier              :TSTRING_string');
write(of1,';');
writeln(of1,'LABELEDITEM__levelids              :mrucomlangspec_setofidents');
write(of1,';');


writeln(of1,'BAREITEM__labeled              :mrucomlangspec_Bool');
write(of1,';');
writeln(of1,'BAREITEM__label              :TSTRING_string');
write(of1,';');
writeln(of1,'BAREITEM__indent              :mrucomlangspec_INT');
write(of1,';');
writeln(of1,'BAREITEM__righttoleftmatch              :mrucomlangspec_BOOL');
write(of1,';');
writeln(of1,'BAREITEM__righttolefttable              :mrucomlangspec_setofidents');
write(of1,';');
writeln(of1,'BAREITEM__root              :TSTRING_string');
write(of1,';');
writeln(of1,'BAREITEM__name              :TSTRING_string');
write(of1,';');
writeln(of1,'BAREITEM__leftcom              :LOCALFILE');
write(of1,';');
writeln(of1,'BAREITEM__rightcom              :LOCALFILE');
write(of1,';');
writeln(of1,'BAREITEM__dtreeproc              :LOCALFILE');
write(of1,';');
writeln(of1,'BAREITEM__identifier              :TSTRING_string');
write(of1,';');
writeln(of1,'BAREITEM__levelids              :mrucomlangspec_setofidents');
write(of1,';');


writeln(of1,'MUVAR__ident              :TSTRING_string');
write(of1,';');


writeln(of1,'RELVAR__ident              :TSTRING_string');
write(of1,';');


writeln(of1,'RELNAME__ident              :TSTRING_string');
write(of1,';');


writeln(of1,'SIGMAVAR__ident              :TSTRING_string');
write(of1,';');


writeln(of1,'RTD__labeled              :mrucomlangspec_Bool');
write(of1,';');
writeln(of1,'RTD__label              :TSTRING_string');
write(of1,';');
writeln(of1,'RTD__indent              :mrucomlangspec_INT');
write(of1,';');
writeln(of1,'RTD__righttolefttable              :mrucomlangspec_setofidents');
write(of1,';');
writeln(of1,'RTD__root              :TSTRING_string');
write(of1,';');
writeln(of1,'RTD__name              :TSTRING_string');
write(of1,';');
writeln(of1,'RTD__leftcom              :LOCALFILE');
write(of1,';');
writeln(of1,'RTD__rightcom              :LOCALFILE');
write(of1,';');
writeln(of1,'RTD__dtreeproc              :LOCALFILE');
write(of1,';');
writeln(of1,'RTD__variable              :TSTRING_string');
write(of1,';');
writeln(of1,'RTD__NumberOfItems              :mrucomlangspec_INT');
write(of1,';');
writeln(of1,'RTD__RelationNamed              :mrucomlangspec_Bool');
write(of1,';');
writeln(of1,'RTD__keymentioned              :mrucomlangspec_bool');
write(of1,';');
writeln(of1,'RTD__keyvar              :mrucomlangspec_bool');
write(of1,';');
writeln(of1,'RTD__keystr1              :TSTRING_string');
write(of1,';');
writeln(of1,'RTD__keystr2              :TSTRING_string');
write(of1,';');
writeln(of1,'RTD__levelids              :mrucomlangspec_setofidents');
write(of1,';');


writeln(of1,'LD__inexist              :mrucomlangspec_bool');
write(of1,';');
writeln(of1,'LD__NumberOfItems              :mrucomlangspec_INT');
write(of1,';');
writeln(of1,'LD__allexist              :LOCALFILE');
write(of1,';');
writeln(of1,'LD__levelids              :mrucomlangspec_setofidents');
write(of1,';');


writeln(of1,'RELD__labeled              :mrucomlangspec_Bool');
write(of1,';');
writeln(of1,'RELD__label              :TSTRING_string');
write(of1,';');
writeln(of1,'RELD__indent              :mrucomlangspec_INT');
write(of1,';');
writeln(of1,'RELD__leftcom              :LOCALFILE');
write(of1,';');
writeln(of1,'RELD__rightcom              :LOCALFILE');
write(of1,';');
writeln(of1,'RELD__variable              :TSTRING_string');
write(of1,';');
writeln(of1,'RELD__RelationNamed              :mrucomlangspec_Bool');
write(of1,';');


writeln(of1,'ANDCOND__indent              :mrucomlangspec_int');
write(of1,';');
writeln(of1,'ANDCOND__toplevel              :mrucomlangspec_bool');
write(of1,';');
writeln(of1,'ANDCOND__vartypes              :mrucomlangspec_setofvartypes');
write(of1,';');
writeln(of1,'ANDCOND__commatchfile              :LOCALFILE');
write(of1,';');
writeln(of1,'ANDCOND__decommatchfile              :LOCALFILE');
write(of1,';');
writeln(of1,'ANDCOND__allexist              :LOCALFILE');
write(of1,';');
writeln(of1,'ANDCOND__allexistcounter              :mrucomlangspec_int');
write(of1,';');


writeln(of1,'ORCOND__vartypes              :mrucomlangspec_setofvartypes');
write(of1,';');
writeln(of1,'ORCOND__commatchfile              :LOCALFILE');
write(of1,';');
writeln(of1,'ORCOND__decommatchfile              :LOCALFILE');
write(of1,';');
writeln(of1,'ORCOND__allexist              :LOCALFILE');
write(of1,';');
writeln(of1,'ORCOND__allexistcounter              :mrucomlangspec_int');
write(of1,';');


writeln(of1,'ELEMENTARYCOND__vartypes              :mrucomlangspec_setofvartypes');
write(of1,';');
writeln(of1,'ELEMENTARYCOND__commatchfile              :LOCALFILE');
write(of1,';');
writeln(of1,'ELEMENTARYCOND__decommatchfile              :LOCALFILE');
write(of1,';');
writeln(of1,'ELEMENTARYCOND__allexist              :LOCALFILE');
write(of1,';');
writeln(of1,'ELEMENTARYCOND__allexistcounter              :mrucomlangspec_int');
write(of1,';');


writeln(of1,'MATCHBOOLEAN__commatchfile              :LOCALFILE');
write(of1,';');
writeln(of1,'MATCHBOOLEAN__decommatchfile              :LOCALFILE');
write(of1,';');
writeln(of1,'MATCHBOOLEAN__allexist              :LOCALFILE');
write(of1,';');
writeln(of1,'MATCHBOOLEAN__allexistcounter              :mrucomlangspec_int');
write(of1,';');


writeln(of1,'BOOLEANEXPR__vartypes              :mrucomlangspec_setofvartypes');
write(of1,';');
writeln(of1,'BOOLEANEXPR__commatchfile              :LOCALFILE');
write(of1,';');
writeln(of1,'BOOLEANEXPR__decommatchfile              :LOCALFILE');
write(of1,';');
writeln(of1,'BOOLEANEXPR__allexist              :LOCALFILE');
write(of1,';');
writeln(of1,'BOOLEANEXPR__allexistcounter              :mrucomlangspec_int');
write(of1,';');


writeln(of1,'PASCALEXPR__vartypes              :mrucomlangspec_setofvartypes');
write(of1,';');
writeln(of1,'PASCALEXPR__commatchfile              :LOCALFILE');
write(of1,';');
writeln(of1,'PASCALEXPR__decommatchfile              :LOCALFILE');
write(of1,';');
writeln(of1,'PASCALEXPR__casefile              :LOCALFILE');
write(of1,';');
writeln(of1,'PASCALEXPR__allexistcounter              :mrucomlangspec_int');
write(of1,';');


writeln(of1,'CONDRECORD__commatchfile              :LOCALFILE');
write(of1,';');
writeln(of1,'CONDRECORD__decommatchfile              :LOCALFILE');
write(of1,';');
writeln(of1,'CONDRECORD__allexist              :LOCALFILE');
write(of1,';');
writeln(of1,'CONDRECORD__allexistcounter              :mrucomlangspec_int');
write(of1,';');


writeln(of1,'ASSIGNRECORD__copy              :LOCALFILE');
write(of1,';');


writeln(of1,'PARNAME__ident              :TSTRING_string');
write(of1,';');


writeln(of1,'PARTYPE__ident              :TSTRING_string');
write(of1,';');


writeln(of1,'LEFTSUBMODELS__righttolefttable              :mrucomlangspec_setofidents');
write(of1,';');
writeln(of1,'LEFTSUBMODELS__indent              :mrucomlangspec_int');
write(of1,';');
writeln(of1,'LEFTSUBMODELS__name              :TSTRING_string');
write(of1,';');
writeln(of1,'LEFTSUBMODELS__prevrhslabels              :mrucomlangspec_setofidents');
write(of1,';');
writeln(of1,'LEFTSUBMODELS__rightmuvarlist              :mrucomlangspec_setofidents');
write(of1,';');
writeln(of1,'LEFTSUBMODELS__rightsigmavarl              :mrucomlangspec_setofidents');
write(of1,';');
writeln(of1,'LEFTSUBMODELS__righttreevarl              :mrucomlangspec_setofidents');
write(of1,';');
writeln(of1,'LEFTSUBMODELS__leftcom              :LOCALFILE');
write(of1,';');
writeln(of1,'LEFTSUBMODELS__leftdecom              :LOCALFILE');
write(of1,';');
writeln(of1,'LEFTSUBMODELS__dtreeproc              :LOCALFILE');
write(of1,';');
writeln(of1,'LEFTSUBMODELS__levelids              :mrucomlangspec_setofidents');
write(of1,';');


writeln(of1,'RIGHTSUBMODELS__righttolefttabl              :mrucomlangspec_setofidents');
write(of1,';');
writeln(of1,'RIGHTSUBMODELS__name              :TSTRING_string');
write(of1,';');
writeln(of1,'RIGHTSUBMODELS__indent              :mrucomlangspec_int');
write(of1,';');
writeln(of1,'RIGHTSUBMODELS__prevrhslabels              :mrucomlangspec_setofidents');
write(of1,';');
writeln(of1,'RIGHTSUBMODELS__leftmuvarlist              :mrucomlangspec_setofidents');
write(of1,';');
writeln(of1,'RIGHTSUBMODELS__leftsigmavarl              :mrucomlangspec_setofidents');
write(of1,';');
writeln(of1,'RIGHTSUBMODELS__lefttreevarl              :mrucomlangspec_setofidents');
write(of1,';');
writeln(of1,'RIGHTSUBMODELS__rightcom              :LOCALFILE');
write(of1,';');
writeln(of1,'RIGHTSUBMODELS__rightdecom              :LOCALFILE');
write(of1,';');
writeln(of1,'RIGHTSUBMODELS__dtreeproc              :LOCALFILE');
write(of1,';');
writeln(of1,'RIGHTSUBMODELS__levelids              :mrucomlangspec_setofidents');
write(of1,';');


writeln(of1,'CONDITION__actiontellers              :mrucomlangspec_setoftellers');
write(of1,';');
writeln(of1,'CONDITION__vartypes              :mrucomlangspec_setofvartypes');
write(of1,';');
writeln(of1,'CONDITION__copy              :LOCALFILE');
write(of1,';');
writeln(of1,'CONDITION__allexist              :LOCALFILE');
write(of1,';');
writeln(of1,'CONDITION__allexistcounter              :mrucomlangspec_int');
write(of1,';');
writeln(of1,'CONDITION__recattvals              :mrucomlangspec_setofrecattvals');
write(of1,';');


writeln(of1,'ACTION__vartypes              :mrucomlangspec_setofvartypes');
write(of1,';');
writeln(of1,'ACTION__deepestlevel              :mrucomlangspec_bool');
write(of1,';');
writeln(of1,'ACTION__actions              :LOCALFILE');
write(of1,';');


writeln(of1,'STATEMENTS__vartypes              :mrucomlangspec_setofvartypes');
write(of1,';');
writeln(of1,'STATEMENTS__copy              :LOCALFILE');
write(of1,';');


writeln(of1,'PASCALSTATEMENT__vartypes              :mrucomlangspec_setofvartypes');
write(of1,';');
writeln(of1,'PASCALSTATEMENT__copy              :LOCALFILE');
write(of1,';');


writeln(of1,'CLABEL__ident              :TSTRING_string');
write(of1,';');


writeln(of1,'ALABEL__ident              :TSTRING_string');
write(of1,';');


writeln(of1,'ILABELtje__ident              :TSTRING_string');
write(of1,';');


writeln(of1,'MLABELtje__ident              :TSTRING_string');
write(of1,';');


writeln(of1,'RLABELtje__ident              :TSTRING_string');
write(of1,';');


writeln(of1,'LLABELtje__ident              :TSTRING_string');
write(of1,';');


writeln(of1,'TRUECAT__ident              :TSTRING_string');
write(of1,';');


writeln(of1,'CATCAT__ident              :TSTRING_string');
write(of1,';');


writeln(of1,'GRAPH__make              :LOCALFILE');
write(of1,';');


writeln(of1,'CONCGRAPH__number              :mrucomlangspec_int');
write(of1,';');
writeln(of1,'CONCGRAPH__make              :LOCALFILE');
write(of1,';');


writeln(of1,'ELEMENTARYGRAPH__number              :mrucomlangspec_int');
write(of1,';');
writeln(of1,'ELEMENTARYGRAPH__make              :LOCALFILE');
write(of1,';');




writeln(of1,'VARNAME__string              :TSTRING_string');
write(of1,';');


writeln(of1,'VALUENAME__string              :TSTRING_string');
write(of1,';');


writeln(of1,'SETVALUENAME__copy              :LOCALFILE');
write(of1,';');


writeln(of1,'BONUSspec__bonusfile              :LOCALFILE');
write(of1,';');


writeln(of1,'DTREE__name              :TSTRING_string');
write(of1,';');
writeln(of1,'DTREE__rightcom              :LOCALFILE');
write(of1,';');
writeln(of1,'DTREE__comactions              :LOCALFILE');
write(of1,';');
writeln(of1,'DTREE__decomactions              :LOCALFILE');
write(of1,';');
writeln(of1,'DTREE__extern              :LOCALFILE');
write(of1,';');
writeln(of1,'DTREE__levelids              :mrucomlangspec_setofidents');
write(of1,';');
writeln(of1,'DTREE__counter              :mrucomlangspec_int');
write(of1,';');
writeln(of1,'DTREE__externcounter              :mrucomlangspec_int');
write(of1,';');


writeln(of1,'LABELEDDTREE__name              :TSTRING_string');
write(of1,';');
writeln(of1,'LABELEDDTREE__rightcom              :LOCALFILE');
write(of1,';');
writeln(of1,'LABELEDDTREE__levelids              :mrucomlangspec_setofidents');
write(of1,';');
writeln(of1,'LABELEDDTREE__comactions              :LOCALFILE');
write(of1,';');
writeln(of1,'LABELEDDTREE__decomactions              :LOCALFILE');
write(of1,';');
writeln(of1,'LABELEDDTREE__extern              :LOCALFILE');
write(of1,';');

writeln(of1,'cofenv1:files_text;');
writeln(of1,'decofenv1:files_text;');
writeln(of1,'cofpas1:files_text;');
writeln(of1,'decofpas1:files_text;');
end;
     procedure mrusurcomwrite_heading(catname:string;
    var of1:text);
begin
if catname = 'UTT' then begin 



end
;if catname = 'RULESPEC' then begin 



end
;if catname = 'FILTERSPEC' then begin 



end
;if catname = 'SUBGRAMMARSPEC' then begin 



end
;if catname = 'LEFTMODELS' then begin 

write(of1,';');
writeln(of1,'LEFTMODELS_name              :TSTRING_string');

write(of1,';');
writeln(of1,'LEFTMODELS_righttolefttable              :mrucomlangspec_setofidents');

write(of1,';');
writeln(of1,'var LEFTMODELS_leftcom              :LOCALFILE');

write(of1,';');
writeln(of1,'var LEFTMODELS_leftdecom              :LOCALFILE');

write(of1,';');
writeln(of1,'var LEFTMODELS_dtreeproc              :LOCALFILE');

write(of1,';');
writeln(of1,'var LEFTMODELS_levelids              :mrucomlangspec_setofidents');

end
;if catname = 'RIGHTMODEL' then begin 

write(of1,';');
writeln(of1,'RIGHTMODEL_name              :TSTRING_string');

write(of1,';');
writeln(of1,'RIGHTMODEL_righttolefttable              :mrucomlangspec_setofidents');

write(of1,';');
writeln(of1,'var RIGHTMODEL_rightcom              :LOCALFILE');

write(of1,';');
writeln(of1,'var RIGHTMODEL_rightdecom              :LOCALFILE');

write(of1,';');
writeln(of1,'var RIGHTMODEL_dtreeproc              :LOCALFILE');

write(of1,';');
writeln(of1,'var RIGHTMODEL_levelids              :mrucomlangspec_setofidents');

write(of1,';');
writeln(of1,'var RIGHTMODEL_dtreelevelids              :mrucomlangspec_setofidents');

end
;if catname = 'MATCHCONDS' then begin 

write(of1,';');
writeln(of1,'MATCHCONDS_leftMuVarList              :mrucomlangspec_SETOFidents');

write(of1,';');
writeln(of1,'MATCHCONDS_leftSigmaVarList              :mrucomlangspec_SETOFidents');

write(of1,';');
writeln(of1,'MATCHCONDS_leftRelVarList              :mrucomlangspec_SETOFidents');

write(of1,';');
writeln(of1,'MATCHCONDS_leftTreeVarList              :mrucomlangspec_SETOFidents');

write(of1,';');
writeln(of1,'MATCHCONDS_leftNodeVarList              :mrucomlangspec_SETOFidents');

write(of1,';');
writeln(of1,'MATCHCONDS_rightMuVarList              :mrucomlangspec_SETOFidents');

write(of1,';');
writeln(of1,'MATCHCONDS_rightSigmaVarList              :mrucomlangspec_SETOFidents');

write(of1,';');
writeln(of1,'MATCHCONDS_rightRelVarList              :mrucomlangspec_SETOFidents');

write(of1,';');
writeln(of1,'MATCHCONDS_rightTreeVarList              :mrucomlangspec_SETOFidents');

write(of1,';');
writeln(of1,'MATCHCONDS_rightNodeVarList              :mrucomlangspec_SETOFidents');

write(of1,';');
writeln(of1,'MATCHCONDS_indent              :mrucomlangspec_int');

write(of1,';');
writeln(of1,'var MATCHCONDS_commatchfile              :LOCALFILE');

write(of1,';');
writeln(of1,'var MATCHCONDS_decommatchfile              :LOCALFILE');

end
;if catname = 'PARAMETERSspec' then begin 



end
;if catname = 'SUBRULES' then begin 

write(of1,';');
writeln(of1,'SUBRULES_indent              :mrucomlangspec_int');

write(of1,';');
writeln(of1,'SUBRULES_name              :TSTRING_string');

write(of1,';');
writeln(of1,'SUBRULES_leftsyncattable              :mrucomlangspec_setofsyncats');

write(of1,';');
writeln(of1,'SUBRULES_rightsyncattable              :mrucomlangspec_setofsyncats');

write(of1,';');
writeln(of1,'SUBRULES_leftrecordtable              :mrucomlangspec_setofidents');

write(of1,';');
writeln(of1,'SUBRULES_rightrecordtable              :mrucomlangspec_setofidents');

write(of1,';');
writeln(of1,'SUBRULES_prevleftrhslabels              :mrucomlangspec_setofidents');

write(of1,';');
writeln(of1,'SUBRULES_prevrightrhslabels              :mrucomlangspec_setofidents');

write(of1,';');
writeln(of1,'SUBRULES_leftmuvarlist              :mrucomlangspec_setofidents');

write(of1,';');
writeln(of1,'SUBRULES_leftsigmavarlist              :mrucomlangspec_setofidents');

write(of1,';');
writeln(of1,'SUBRULES_lefttreevarlist              :mrucomlangspec_setofidents');

write(of1,';');
writeln(of1,'SUBRULES_rightmuvarlist              :mrucomlangspec_setofidents');

write(of1,';');
writeln(of1,'SUBRULES_rightsigmavarlist              :mrucomlangspec_setofidents');

write(of1,';');
writeln(of1,'SUBRULES_righttreevarlist              :mrucomlangspec_setofidents');

write(of1,';');
writeln(of1,'SUBRULES_modelnumber              :mrucomlangspec_int');

write(of1,';');
writeln(of1,'SUBRULES_vartypes              :mrucomlangspec_setofvartypes');

write(of1,';');
writeln(of1,'var SUBRULES_comsubrules              :LOCALFILE');

write(of1,';');
writeln(of1,'var SUBRULES_decomsubrules              :LOCALFILE');

write(of1,';');
writeln(of1,'var SUBRULES_dtreeproc              :LOCALFILE');

end
;if catname = 'SUBFILTERS' then begin 

write(of1,';');
writeln(of1,'SUBFILTERS_indent              :mrucomlangspec_int');

write(of1,';');
writeln(of1,'SUBFILTERS_prevrightrhslabels              :mrucomlangspec_setofidents');

write(of1,';');
writeln(of1,'SUBFILTERS_vartypes              :mrucomlangspec_setofvartypes');

write(of1,';');
writeln(of1,'var SUBFILTERS_comsubrules              :LOCALFILE');

write(of1,';');
writeln(of1,'var SUBFILTERS_decomsubrules              :LOCALFILE');

end
;if catname = 'COMCAPAIRS' then begin 

write(of1,';');
writeln(of1,'COMCAPAIRS_actionteller              :mrucomlangspec_teller');

write(of1,';');
writeln(of1,'COMCAPAIRS_actiontellers              :mrucomlangspec_setoftellers');

write(of1,';');
writeln(of1,'COMCAPAIRS_indent              :mrucomlangspec_int');

write(of1,';');
writeln(of1,'COMCAPAIRS_syncattable              :mrucomlangspec_setofsyncats');

write(of1,';');
writeln(of1,'COMCAPAIRS_recordtable              :mrucomlangspec_setofidents');

write(of1,';');
writeln(of1,'COMCAPAIRS_modelnumber              :mrucomlangspec_int');

write(of1,';');
writeln(of1,'COMCAPAIRS_level              :mrucomlangspec_int');

write(of1,';');
writeln(of1,'COMCAPAIRS_insubrule              :mrucomlangspec_bool');

write(of1,';');
writeln(of1,'COMCAPAIRS_filter              :mrucomlangspec_bool');

write(of1,';');
writeln(of1,'COMCAPAIRS_vartypes              :mrucomlangspec_setofvartypes');

write(of1,';');
writeln(of1,'COMCAPAIRS_rhslabels              :mrucomlangspec_setofidents');

write(of1,';');
writeln(of1,'var COMCAPAIRS_conditions              :LOCALFILE');

write(of1,';');
writeln(of1,'var COMCAPAIRS_actions              :LOCALFILE');

write(of1,';');
writeln(of1,'var COMCAPAIRS_allexist              :LOCALFILE');

write(of1,';');
writeln(of1,'var COMCAPAIRS_allexistcounter              :mrucomlangspec_int');

end
;if catname = 'DECOMCAPAIRS' then begin 

write(of1,';');
writeln(of1,'DECOMCAPAIRS_actionteller              :mrucomlangspec_teller');

write(of1,';');
writeln(of1,'DECOMCAPAIRS_actiontellers              :mrucomlangspec_setoftellers');

write(of1,';');
writeln(of1,'DECOMCAPAIRS_indent              :mrucomlangspec_int');

write(of1,';');
writeln(of1,'DECOMCAPAIRS_syncattable              :mrucomlangspec_setofsyncats');

write(of1,';');
writeln(of1,'DECOMCAPAIRS_recordtable              :mrucomlangspec_setofidents');

write(of1,';');
writeln(of1,'DECOMCAPAIRS_modelnumber              :mrucomlangspec_int');

write(of1,';');
writeln(of1,'DECOMCAPAIRS_level              :mrucomlangspec_int');

write(of1,';');
writeln(of1,'DECOMCAPAIRS_insubrule              :mrucomlangspec_bool');

write(of1,';');
writeln(of1,'DECOMCAPAIRS_filter              :mrucomlangspec_bool');

write(of1,';');
writeln(of1,'DECOMCAPAIRS_vartypes              :mrucomlangspec_setofvartypes');

write(of1,';');
writeln(of1,'DECOMCAPAIRS_rhslabels              :mrucomlangspec_setofidents');

write(of1,';');
writeln(of1,'var DECOMCAPAIRS_conditions              :LOCALFILE');

write(of1,';');
writeln(of1,'var DECOMCAPAIRS_actions              :LOCALFILE');

write(of1,';');
writeln(of1,'var DECOMCAPAIRS_allexist              :LOCALFILE');

write(of1,';');
writeln(of1,'var DECOMCAPAIRS_allexistcounter              :mrucomlangspec_int');

end
;if catname = 'CAPAIRS' then begin 

write(of1,';');
writeln(of1,'CAPAIRS_actionteller              :mrucomlangspec_teller');

write(of1,';');
writeln(of1,'CAPAIRS_actiontellers              :mrucomlangspec_setoftellers');

write(of1,';');
writeln(of1,'CAPAIRS_indent              :mrucomlangspec_int');

write(of1,';');
writeln(of1,'CAPAIRS_syncattable              :mrucomlangspec_setofsyncats');

write(of1,';');
writeln(of1,'CAPAIRS_recordtable              :mrucomlangspec_setofidents');

write(of1,';');
writeln(of1,'CAPAIRS_modelnumber              :mrucomlangspec_int');

write(of1,';');
writeln(of1,'CAPAIRS_level              :mrucomlangspec_int');

write(of1,';');
writeln(of1,'CAPAIRS_insubrule              :mrucomlangspec_bool');

write(of1,';');
writeln(of1,'CAPAIRS_filter              :mrucomlangspec_bool');

write(of1,';');
writeln(of1,'CAPAIRS_vartypes              :mrucomlangspec_setofvartypes');

write(of1,';');
writeln(of1,'CAPAIRS_rhslabels              :mrucomlangspec_setofidents');

write(of1,';');
writeln(of1,'var CAPAIRS_conditions              :LOCALFILE');

write(of1,';');
writeln(of1,'var CAPAIRS_actions              :LOCALFILE');

write(of1,';');
writeln(of1,'var CAPAIRS_allexist              :LOCALFILE');

write(of1,';');
writeln(of1,'var CAPAIRS_allexistcounter              :mrucomlangspec_int');

end
;if catname = 'bareCAPAIRS' then begin 

write(of1,';');
writeln(of1,'bareCAPAIRS_actionteller              :mrucomlangspec_teller');

write(of1,';');
writeln(of1,'bareCAPAIRS_actiontellers              :mrucomlangspec_setoftellers');

write(of1,';');
writeln(of1,'bareCAPAIRS_indent              :mrucomlangspec_int');

write(of1,';');
writeln(of1,'bareCAPAIRS_syncattable              :mrucomlangspec_setofsyncats');

write(of1,';');
writeln(of1,'bareCAPAIRS_recordtable              :mrucomlangspec_setofidents');

write(of1,';');
writeln(of1,'bareCAPAIRS_modelnumber              :mrucomlangspec_int');

write(of1,';');
writeln(of1,'bareCAPAIRS_level              :mrucomlangspec_int');

write(of1,';');
writeln(of1,'bareCAPAIRS_insubrule              :mrucomlangspec_bool');

write(of1,';');
writeln(of1,'bareCAPAIRS_filter              :mrucomlangspec_bool');

write(of1,';');
writeln(of1,'bareCAPAIRS_vartypes              :mrucomlangspec_setofvartypes');

write(of1,';');
writeln(of1,'bareCAPAIRS_rhslabels              :mrucomlangspec_setofidents');

write(of1,';');
writeln(of1,'var bareCAPAIRS_conditions              :LOCALFILE');

write(of1,';');
writeln(of1,'var bareCAPAIRS_actions              :LOCALFILE');

write(of1,';');
writeln(of1,'var bareCAPAIRS_allexist              :LOCALFILE');

write(of1,';');
writeln(of1,'var bareCAPAIRS_allexistcounter              :mrucomlangspec_int');

end
;if catname = 'LABELEDTD' then begin 

write(of1,';');
writeln(of1,'LABELEDTD_indent              :mrucomlangspec_INT');

write(of1,';');
writeln(of1,'LABELEDTD_name              :TSTRING_string');

write(of1,';');
writeln(of1,'LABELEDTD_submodeltree              :mrucomlangspec_bool');

write(of1,';');
writeln(of1,'LABELEDTD_righttolefttable              :mrucomlangspec_setofidents');

write(of1,';');
writeln(of1,'LABELEDTD_root              :TSTRING_string');

write(of1,';');
writeln(of1,'var LABELEDTD_leftcom              :LOCALFILE');

write(of1,';');
writeln(of1,'var LABELEDTD_rightcom              :LOCALFILE');

write(of1,';');
writeln(of1,'var LABELEDTD_dtreeproc              :LOCALFILE');

write(of1,';');
writeln(of1,'var LABELEDTD_numberofitems              :mrucomlangspec_INT');

write(of1,';');
writeln(of1,'var LABELEDTD_keymentioned              :mrucomlangspec_bool');

write(of1,';');
writeln(of1,'var LABELEDTD_keyvar              :mrucomlangspec_bool');

write(of1,';');
writeln(of1,'var LABELEDTD_keystr1              :TSTRING_string');

write(of1,';');
writeln(of1,'var LABELEDTD_keystr2              :TSTRING_string');

write(of1,';');
writeln(of1,'var LABELEDTD_levelids              :mrucomlangspec_setofidents');

end
;if catname = 'LABELtje' then begin 

write(of1,';');
writeln(of1,'LABELtje_indent              :mrucomlangspec_INT');

end
;if catname = 'BARETD' then begin 

write(of1,';');
writeln(of1,'BARETD_indent              :mrucomlangspec_INT');

write(of1,';');
writeln(of1,'BARETD_name              :TSTRING_string');

write(of1,';');
writeln(of1,'BARETD_righttolefttable              :mrucomlangspec_SETOFidents');

write(of1,';');
writeln(of1,'BARETD_root              :TSTRING_string');

write(of1,';');
writeln(of1,'var BARETD_leftcom              :LOCALFILE');

write(of1,';');
writeln(of1,'var BARETD_rightcom              :LOCALFILE');

write(of1,';');
writeln(of1,'var BARETD_dtreeproc              :LOCALFILE');

write(of1,';');
writeln(of1,'var BARETD_NumberOfItems              :mrucomlangspec_INT');

write(of1,';');
writeln(of1,'var BARETD_keymentioned              :mrucomlangspec_bool');

write(of1,';');
writeln(of1,'var BARETD_keyvar              :mrucomlangspec_bool');

write(of1,';');
writeln(of1,'var BARETD_keystr1              :TSTRING_string');

write(of1,';');
writeln(of1,'var BARETD_levelids              :mrucomlangspec_setofidents');

write(of1,';');
writeln(of1,'var BARETD_keystr2              :TSTRING_string');

end
;if catname = 'LABELEDND' then begin 

write(of1,';');
writeln(of1,'LABELEDND_indent              :mrucomlangspec_INT');

write(of1,';');
writeln(of1,'LABELEDND_name              :TSTRING_string');

write(of1,';');
writeln(of1,'LABELEDND_shorthand              :TSTRING_string');

write(of1,';');
writeln(of1,'var LABELEDND_leftcom              :LOCALFILE');

write(of1,';');
writeln(of1,'var LABELEDND_rightcom              :LOCALFILE');

write(of1,';');
writeln(of1,'var LABELEDND_dtreeproc              :LOCALFILE');

write(of1,';');
writeln(of1,'var LABELEDND_keymentioned              :mrucomlangspec_bool');

write(of1,';');
writeln(of1,'var LABELEDND_keyvar              :mrucomlangspec_bool');

write(of1,';');
writeln(of1,'var LABELEDND_keystr1              :TSTRING_string');

write(of1,';');
writeln(of1,'var LABELEDND_keystr2              :TSTRING_string');

end
;if catname = 'BAREND' then begin 

write(of1,';');
writeln(of1,'BAREND_labeled              :mrucomlangspec_bool');

write(of1,';');
writeln(of1,'BAREND_label              :TSTRING_string');

write(of1,';');
writeln(of1,'BAREND_indent              :mrucomlangspec_INT');

write(of1,';');
writeln(of1,'BAREND_shorthand              :TSTRING_string');

write(of1,';');
writeln(of1,'BAREND_name              :TSTRING_string');

write(of1,';');
writeln(of1,'var BAREND_leftcom              :LOCALFILE');

write(of1,';');
writeln(of1,'var BAREND_rightcom              :LOCALFILE');

write(of1,';');
writeln(of1,'var BAREND_dtreeproc              :LOCALFILE');

write(of1,';');
writeln(of1,'var BAREND_keymentioned              :mrucomlangspec_bool');

write(of1,';');
writeln(of1,'var BAREND_keyvar              :mrucomlangspec_bool');

write(of1,';');
writeln(of1,'var BAREND_keystr1              :TSTRING_string');

write(of1,';');
writeln(of1,'var BAREND_keystr2              :TSTRING_string');

end
;if catname = 'KEYNAME' then begin 



end
;if catname = 'LABELEDLD' then begin 

write(of1,';');
writeln(of1,'LABELEDLD_indent              :mrucomlangspec_INT');

write(of1,';');
writeln(of1,'LABELEDLD_righttolefttable              :mrucomlangspec_setofidents');

write(of1,';');
writeln(of1,'LABELEDLD_submodellist              :mrucomlangspec_bool');

write(of1,';');
writeln(of1,'LABELEDLD_inexist              :mrucomlangspec_bool');

write(of1,';');
writeln(of1,'LABELEDLD_root              :TSTRING_string');

write(of1,';');
writeln(of1,'LABELEDLD_name              :TSTRING_string');

write(of1,';');
writeln(of1,'var LABELEDLD_leftcom              :LOCALFILE');

write(of1,';');
writeln(of1,'var LABELEDLD_rightcom              :LOCALFILE');

write(of1,';');
writeln(of1,'var LABELEDLD_dtreeproc              :LOCALFILE');

write(of1,';');
writeln(of1,'var LABELEDLD_NumberOfItems              :mrucomlangspec_INT');

write(of1,';');
writeln(of1,'var LABELEDLD_levelids              :mrucomlangspec_setofidents');

end
;if catname = 'BARELD' then begin 

write(of1,';');
writeln(of1,'BARELD_label              :TSTRING_string');

write(of1,';');
writeln(of1,'BARELD_labeled              :mrucomlangspec_Bool');

write(of1,';');
writeln(of1,'BARELD_indent              :mrucomlangspec_INT');

write(of1,';');
writeln(of1,'BARELD_inexist              :mrucomlangspec_bool');

write(of1,';');
writeln(of1,'BARELD_bounded              :mrucomlangspec_Bool');

write(of1,';');
writeln(of1,'BARELD_righttolefttable              :mrucomlangspec_SETOFidents');

write(of1,';');
writeln(of1,'BARELD_righttoleftmatch              :mrucomlangspec_BOOL');

write(of1,';');
writeln(of1,'BARELD_root              :TSTRING_string');

write(of1,';');
writeln(of1,'BARELD_name              :TSTRING_string');

write(of1,';');
writeln(of1,'var BARELD_leftcom              :LOCALFILE');

write(of1,';');
writeln(of1,'var BARELD_rightcom              :LOCALFILE');

write(of1,';');
writeln(of1,'var BARELD_dtreeproc              :LOCALFILE');

write(of1,';');
writeln(of1,'var BARELD_NumberOfItems              :mrucomlangspec_INT');

write(of1,';');
writeln(of1,'var BARELD_levelids              :mrucomlangspec_setofidents');

end
;if catname = 'TREEVAR' then begin 

write(of1,';');
writeln(of1,'var TREEVAR_ident              :TSTRING_string');

end
;if catname = 'CATNAME' then begin 

write(of1,';');
writeln(of1,'var CATNAME_ident              :TSTRING_string');

end
;if catname = 'CATRECNAME' then begin 

write(of1,';');
writeln(of1,'var CATRECNAME_ident              :TSTRING_string');

end
;if catname = 'NODEVAR' then begin 

write(of1,';');
writeln(of1,'var NODEVAR_ident              :TSTRING_string');

end
;if catname = 'ITEM' then begin 

write(of1,';');
writeln(of1,'ITEM_indent              :mrucomlangspec_INT');

write(of1,';');
writeln(of1,'ITEM_righttolefttable              :mrucomlangspec_SETOFidents');

write(of1,';');
writeln(of1,'ITEM_root              :TSTRING_string');

write(of1,';');
writeln(of1,'ITEM_name              :TSTRING_string');

write(of1,';');
writeln(of1,'var ITEM_leftcom              :LOCALFILE');

write(of1,';');
writeln(of1,'var ITEM_rightcom              :LOCALFILE');

write(of1,';');
writeln(of1,'var ITEM_dtreeproc              :LOCALFILE');

write(of1,';');
writeln(of1,'var ITEM_identifier              :TSTRING_string');

write(of1,';');
writeln(of1,'var ITEM_levelids              :mrucomlangspec_setofidents');

end
;if catname = 'LABELEDITEM' then begin 

write(of1,';');
writeln(of1,'LABELEDITEM_indent              :mrucomlangspec_INT');

write(of1,';');
writeln(of1,'LABELEDITEM_righttolefttable              :mrucomlangspec_setofidents');

write(of1,';');
writeln(of1,'LABELEDITEM_root              :TSTRING_string');

write(of1,';');
writeln(of1,'LABELEDITEM_name              :TSTRING_string');

write(of1,';');
writeln(of1,'var LABELEDITEM_leftcom              :LOCALFILE');

write(of1,';');
writeln(of1,'var LABELEDITEM_rightcom              :LOCALFILE');

write(of1,';');
writeln(of1,'var LABELEDITEM_dtreeproc              :LOCALFILE');

write(of1,';');
writeln(of1,'var LABELEDITEM_identifier              :TSTRING_string');

write(of1,';');
writeln(of1,'var LABELEDITEM_levelids              :mrucomlangspec_setofidents');

end
;if catname = 'BAREITEM' then begin 

write(of1,';');
writeln(of1,'BAREITEM_labeled              :mrucomlangspec_Bool');

write(of1,';');
writeln(of1,'BAREITEM_label              :TSTRING_string');

write(of1,';');
writeln(of1,'BAREITEM_indent              :mrucomlangspec_INT');

write(of1,';');
writeln(of1,'BAREITEM_righttoleftmatch              :mrucomlangspec_BOOL');

write(of1,';');
writeln(of1,'BAREITEM_righttolefttable              :mrucomlangspec_setofidents');

write(of1,';');
writeln(of1,'BAREITEM_root              :TSTRING_string');

write(of1,';');
writeln(of1,'BAREITEM_name              :TSTRING_string');

write(of1,';');
writeln(of1,'var BAREITEM_leftcom              :LOCALFILE');

write(of1,';');
writeln(of1,'var BAREITEM_rightcom              :LOCALFILE');

write(of1,';');
writeln(of1,'var BAREITEM_dtreeproc              :LOCALFILE');

write(of1,';');
writeln(of1,'var BAREITEM_identifier              :TSTRING_string');

write(of1,';');
writeln(of1,'var BAREITEM_levelids              :mrucomlangspec_setofidents');

end
;if catname = 'MUVAR' then begin 

write(of1,';');
writeln(of1,'var MUVAR_ident              :TSTRING_string');

end
;if catname = 'RELVAR' then begin 

write(of1,';');
writeln(of1,'var RELVAR_ident              :TSTRING_string');

end
;if catname = 'RELNAME' then begin 

write(of1,';');
writeln(of1,'var RELNAME_ident              :TSTRING_string');

end
;if catname = 'SIGMAVAR' then begin 

write(of1,';');
writeln(of1,'var SIGMAVAR_ident              :TSTRING_string');

end
;if catname = 'RTD' then begin 

write(of1,';');
writeln(of1,'RTD_labeled              :mrucomlangspec_Bool');

write(of1,';');
writeln(of1,'RTD_label              :TSTRING_string');

write(of1,';');
writeln(of1,'RTD_indent              :mrucomlangspec_INT');

write(of1,';');
writeln(of1,'RTD_righttolefttable              :mrucomlangspec_setofidents');

write(of1,';');
writeln(of1,'RTD_root              :TSTRING_string');

write(of1,';');
writeln(of1,'RTD_name              :TSTRING_string');

write(of1,';');
writeln(of1,'var RTD_leftcom              :LOCALFILE');

write(of1,';');
writeln(of1,'var RTD_rightcom              :LOCALFILE');

write(of1,';');
writeln(of1,'var RTD_dtreeproc              :LOCALFILE');

write(of1,';');
writeln(of1,'var RTD_variable              :TSTRING_string');

write(of1,';');
writeln(of1,'var RTD_NumberOfItems              :mrucomlangspec_INT');

write(of1,';');
writeln(of1,'var RTD_RelationNamed              :mrucomlangspec_Bool');

write(of1,';');
writeln(of1,'var RTD_keymentioned              :mrucomlangspec_bool');

write(of1,';');
writeln(of1,'var RTD_keyvar              :mrucomlangspec_bool');

write(of1,';');
writeln(of1,'var RTD_keystr1              :TSTRING_string');

write(of1,';');
writeln(of1,'var RTD_keystr2              :TSTRING_string');

write(of1,';');
writeln(of1,'var RTD_levelids              :mrucomlangspec_setofidents');

end
;if catname = 'LD' then begin 

write(of1,';');
writeln(of1,'LD_inexist              :mrucomlangspec_bool');

write(of1,';');
writeln(of1,'var LD_NumberOfItems              :mrucomlangspec_INT');

write(of1,';');
writeln(of1,'var LD_allexist              :LOCALFILE');

write(of1,';');
writeln(of1,'var LD_levelids              :mrucomlangspec_setofidents');

end
;if catname = 'RELD' then begin 

write(of1,';');
writeln(of1,'RELD_labeled              :mrucomlangspec_Bool');

write(of1,';');
writeln(of1,'RELD_label              :TSTRING_string');

write(of1,';');
writeln(of1,'RELD_indent              :mrucomlangspec_INT');

write(of1,';');
writeln(of1,'var RELD_leftcom              :LOCALFILE');

write(of1,';');
writeln(of1,'var RELD_rightcom              :LOCALFILE');

write(of1,';');
writeln(of1,'var RELD_variable              :TSTRING_string');

write(of1,';');
writeln(of1,'var RELD_RelationNamed              :mrucomlangspec_Bool');

end
;if catname = 'ANDCOND' then begin 

write(of1,';');
writeln(of1,'ANDCOND_indent              :mrucomlangspec_int');

write(of1,';');
writeln(of1,'ANDCOND_toplevel              :mrucomlangspec_bool');

write(of1,';');
writeln(of1,'ANDCOND_vartypes              :mrucomlangspec_setofvartypes');

write(of1,';');
writeln(of1,'var ANDCOND_commatchfile              :LOCALFILE');

write(of1,';');
writeln(of1,'var ANDCOND_decommatchfile              :LOCALFILE');

write(of1,';');
writeln(of1,'var ANDCOND_allexist              :LOCALFILE');

write(of1,';');
writeln(of1,'var ANDCOND_allexistcounter              :mrucomlangspec_int');

end
;if catname = 'ORCOND' then begin 

write(of1,';');
writeln(of1,'ORCOND_vartypes              :mrucomlangspec_setofvartypes');

write(of1,';');
writeln(of1,'var ORCOND_commatchfile              :LOCALFILE');

write(of1,';');
writeln(of1,'var ORCOND_decommatchfile              :LOCALFILE');

write(of1,';');
writeln(of1,'var ORCOND_allexist              :LOCALFILE');

write(of1,';');
writeln(of1,'var ORCOND_allexistcounter              :mrucomlangspec_int');

end
;if catname = 'ELEMENTARYCOND' then begin 

write(of1,';');
writeln(of1,'ELEMENTARYCOND_vartypes              :mrucomlangspec_setofvartypes');

write(of1,';');
writeln(of1,'var ELEMENTARYCOND_commatchfile              :LOCALFILE');

write(of1,';');
writeln(of1,'var ELEMENTARYCOND_decommatchfile              :LOCALFILE');

write(of1,';');
writeln(of1,'var ELEMENTARYCOND_allexist              :LOCALFILE');

write(of1,';');
writeln(of1,'var ELEMENTARYCOND_allexistcounter              :mrucomlangspec_int');

end
;if catname = 'MATCHBOOLEAN' then begin 

write(of1,';');
writeln(of1,'var MATCHBOOLEAN_commatchfile              :LOCALFILE');

write(of1,';');
writeln(of1,'var MATCHBOOLEAN_decommatchfile              :LOCALFILE');

write(of1,';');
writeln(of1,'var MATCHBOOLEAN_allexist              :LOCALFILE');

write(of1,';');
writeln(of1,'var MATCHBOOLEAN_allexistcounter              :mrucomlangspec_int');

end
;if catname = 'BOOLEANEXPR' then begin 

write(of1,';');
writeln(of1,'BOOLEANEXPR_vartypes              :mrucomlangspec_setofvartypes');

write(of1,';');
writeln(of1,'var BOOLEANEXPR_commatchfile              :LOCALFILE');

write(of1,';');
writeln(of1,'var BOOLEANEXPR_decommatchfile              :LOCALFILE');

write(of1,';');
writeln(of1,'var BOOLEANEXPR_allexist              :LOCALFILE');

write(of1,';');
writeln(of1,'var BOOLEANEXPR_allexistcounter              :mrucomlangspec_int');

end
;if catname = 'PASCALEXPR' then begin 

write(of1,';');
writeln(of1,'PASCALEXPR_vartypes              :mrucomlangspec_setofvartypes');

write(of1,';');
writeln(of1,'var PASCALEXPR_commatchfile              :LOCALFILE');

write(of1,';');
writeln(of1,'var PASCALEXPR_decommatchfile              :LOCALFILE');

write(of1,';');
writeln(of1,'var PASCALEXPR_casefile              :LOCALFILE');

write(of1,';');
writeln(of1,'var PASCALEXPR_allexistcounter              :mrucomlangspec_int');

end
;if catname = 'CONDRECORD' then begin 

write(of1,';');
writeln(of1,'var CONDRECORD_commatchfile              :LOCALFILE');

write(of1,';');
writeln(of1,'var CONDRECORD_decommatchfile              :LOCALFILE');

write(of1,';');
writeln(of1,'var CONDRECORD_allexist              :LOCALFILE');

write(of1,';');
writeln(of1,'var CONDRECORD_allexistcounter              :mrucomlangspec_int');

end
;if catname = 'ASSIGNRECORD' then begin 

write(of1,';');
writeln(of1,'var ASSIGNRECORD_copy              :LOCALFILE');

end
;if catname = 'PARNAME' then begin 

write(of1,';');
writeln(of1,'var PARNAME_ident              :TSTRING_string');

end
;if catname = 'PARTYPE' then begin 

write(of1,';');
writeln(of1,'var PARTYPE_ident              :TSTRING_string');

end
;if catname = 'LEFTSUBMODELS' then begin 

write(of1,';');
writeln(of1,'LEFTSUBMODELS_righttolefttable              :mrucomlangspec_setofidents');

write(of1,';');
writeln(of1,'LEFTSUBMODELS_indent              :mrucomlangspec_int');

write(of1,';');
writeln(of1,'LEFTSUBMODELS_name              :TSTRING_string');

write(of1,';');
writeln(of1,'LEFTSUBMODELS_prevrhslabels              :mrucomlangspec_setofidents');

write(of1,';');
writeln(of1,'LEFTSUBMODELS_rightmuvarlist              :mrucomlangspec_setofidents');

write(of1,';');
writeln(of1,'LEFTSUBMODELS_rightsigmavarl              :mrucomlangspec_setofidents');

write(of1,';');
writeln(of1,'LEFTSUBMODELS_righttreevarl              :mrucomlangspec_setofidents');

write(of1,';');
writeln(of1,'var LEFTSUBMODELS_leftcom              :LOCALFILE');

write(of1,';');
writeln(of1,'var LEFTSUBMODELS_leftdecom              :LOCALFILE');

write(of1,';');
writeln(of1,'var LEFTSUBMODELS_dtreeproc              :LOCALFILE');

write(of1,';');
writeln(of1,'var LEFTSUBMODELS_levelids              :mrucomlangspec_setofidents');

end
;if catname = 'RIGHTSUBMODELS' then begin 

write(of1,';');
writeln(of1,'RIGHTSUBMODELS_righttolefttabl              :mrucomlangspec_setofidents');

write(of1,';');
writeln(of1,'RIGHTSUBMODELS_name              :TSTRING_string');

write(of1,';');
writeln(of1,'RIGHTSUBMODELS_indent              :mrucomlangspec_int');

write(of1,';');
writeln(of1,'RIGHTSUBMODELS_prevrhslabels              :mrucomlangspec_setofidents');

write(of1,';');
writeln(of1,'RIGHTSUBMODELS_leftmuvarlist              :mrucomlangspec_setofidents');

write(of1,';');
writeln(of1,'RIGHTSUBMODELS_leftsigmavarl              :mrucomlangspec_setofidents');

write(of1,';');
writeln(of1,'RIGHTSUBMODELS_lefttreevarl              :mrucomlangspec_setofidents');

write(of1,';');
writeln(of1,'var RIGHTSUBMODELS_rightcom              :LOCALFILE');

write(of1,';');
writeln(of1,'var RIGHTSUBMODELS_rightdecom              :LOCALFILE');

write(of1,';');
writeln(of1,'var RIGHTSUBMODELS_dtreeproc              :LOCALFILE');

write(of1,';');
writeln(of1,'var RIGHTSUBMODELS_levelids              :mrucomlangspec_setofidents');

end
;if catname = 'CONDITION' then begin 

write(of1,';');
writeln(of1,'CONDITION_actiontellers              :mrucomlangspec_setoftellers');

write(of1,';');
writeln(of1,'CONDITION_vartypes              :mrucomlangspec_setofvartypes');

write(of1,';');
writeln(of1,'var CONDITION_copy              :LOCALFILE');

write(of1,';');
writeln(of1,'var CONDITION_allexist              :LOCALFILE');

write(of1,';');
writeln(of1,'var CONDITION_allexistcounter              :mrucomlangspec_int');

write(of1,';');
writeln(of1,'var CONDITION_recattvals              :mrucomlangspec_setofrecattvals');

end
;if catname = 'ACTION' then begin 

write(of1,';');
writeln(of1,'ACTION_vartypes              :mrucomlangspec_setofvartypes');

write(of1,';');
writeln(of1,'ACTION_deepestlevel              :mrucomlangspec_bool');

write(of1,';');
writeln(of1,'var ACTION_actions              :LOCALFILE');

end
;if catname = 'STATEMENTS' then begin 

write(of1,';');
writeln(of1,'STATEMENTS_vartypes              :mrucomlangspec_setofvartypes');

write(of1,';');
writeln(of1,'var STATEMENTS_copy              :LOCALFILE');

end
;if catname = 'PASCALSTATEMENT' then begin 

write(of1,';');
writeln(of1,'PASCALSTATEMENT_vartypes              :mrucomlangspec_setofvartypes');

write(of1,';');
writeln(of1,'var PASCALSTATEMENT_copy              :LOCALFILE');

end
;if catname = 'CLABEL' then begin 

write(of1,';');
writeln(of1,'var CLABEL_ident              :TSTRING_string');

end
;if catname = 'ALABEL' then begin 

write(of1,';');
writeln(of1,'var ALABEL_ident              :TSTRING_string');

end
;if catname = 'ILABELtje' then begin 

write(of1,';');
writeln(of1,'var ILABELtje_ident              :TSTRING_string');

end
;if catname = 'MLABELtje' then begin 

write(of1,';');
writeln(of1,'var MLABELtje_ident              :TSTRING_string');

end
;if catname = 'RLABELtje' then begin 

write(of1,';');
writeln(of1,'var RLABELtje_ident              :TSTRING_string');

end
;if catname = 'LLABELtje' then begin 

write(of1,';');
writeln(of1,'var LLABELtje_ident              :TSTRING_string');

end
;if catname = 'TRUECAT' then begin 

write(of1,';');
writeln(of1,'var TRUECAT_ident              :TSTRING_string');

end
;if catname = 'CATCAT' then begin 

write(of1,';');
writeln(of1,'var CATCAT_ident              :TSTRING_string');

end
;if catname = 'GRAPH' then begin 

write(of1,';');
writeln(of1,'var GRAPH_make              :LOCALFILE');

end
;if catname = 'CONCGRAPH' then begin 

write(of1,';');
writeln(of1,'CONCGRAPH_number              :mrucomlangspec_int');

write(of1,';');
writeln(of1,'var CONCGRAPH_make              :LOCALFILE');

end
;if catname = 'ELEMENTARYGRAPH' then begin 

write(of1,';');
writeln(of1,'ELEMENTARYGRAPH_number              :mrucomlangspec_int');

write(of1,';');
writeln(of1,'var ELEMENTARYGRAPH_make              :LOCALFILE');

end
;if catname = 'NUMBER' then begin 



end
;if catname = 'VARNAME' then begin 

write(of1,';');
writeln(of1,'var VARNAME_string              :TSTRING_string');

end
;if catname = 'VALUENAME' then begin 

write(of1,';');
writeln(of1,'var VALUENAME_string              :TSTRING_string');

end
;if catname = 'SETVALUENAME' then begin 

write(of1,';');
writeln(of1,'var SETVALUENAME_copy              :LOCALFILE');

end
;if catname = 'BONUSspec' then begin 

write(of1,';');
writeln(of1,'var BONUSspec_bonusfile              :LOCALFILE');

end
;if catname = 'DTREE' then begin 

write(of1,';');
writeln(of1,'DTREE_name              :TSTRING_string');

write(of1,';');
writeln(of1,'var DTREE_rightcom              :LOCALFILE');

write(of1,';');
writeln(of1,'var DTREE_comactions              :LOCALFILE');

write(of1,';');
writeln(of1,'var DTREE_decomactions              :LOCALFILE');

write(of1,';');
writeln(of1,'var DTREE_extern              :LOCALFILE');

write(of1,';');
writeln(of1,'var DTREE_levelids              :mrucomlangspec_setofidents');

write(of1,';');
writeln(of1,'var DTREE_counter              :mrucomlangspec_int');

write(of1,';');
writeln(of1,'var DTREE_externcounter              :mrucomlangspec_int');

end
;if catname = 'LABELEDDTREE' then begin 

write(of1,';');
writeln(of1,'LABELEDDTREE_name              :TSTRING_string');

write(of1,';');
writeln(of1,'var LABELEDDTREE_rightcom              :LOCALFILE');

write(of1,';');
writeln(of1,'var LABELEDDTREE_levelids              :mrucomlangspec_setofidents');

write(of1,';');
writeln(of1,'var LABELEDDTREE_comactions              :LOCALFILE');

write(of1,';');
writeln(of1,'var LABELEDDTREE_decomactions              :LOCALFILE');

write(of1,';');
writeln(of1,'var LABELEDDTREE_extern              :LOCALFILE');

end
end;
     procedure mrusurcomwrite_callist(catname:string;
    var of1:text);
begin
if catname = 'UTT' then begin 

end
;;if catname = 'RULESPEC' then begin 

end
;;if catname = 'FILTERSPEC' then begin 

end
;;if catname = 'SUBGRAMMARSPEC' then begin 

end
;;if catname = 'LEFTMODELS' then begin 
write(of1,',');writeln(of1,'LEFTMODELS__name');

write(of1,',');
writeln(of1,'LEFTMODELS__righttolefttable');

write(of1,',');
writeln(of1,'LEFTMODELS__leftcom');

write(of1,',');
writeln(of1,'LEFTMODELS__leftdecom');

write(of1,',');
writeln(of1,'LEFTMODELS__dtreeproc');

write(of1,',');
writeln(of1,'LEFTMODELS__levelids');

end
;;if catname = 'RIGHTMODEL' then begin 
write(of1,',');writeln(of1,'RIGHTMODEL__name');

write(of1,',');
writeln(of1,'RIGHTMODEL__righttolefttable');

write(of1,',');
writeln(of1,'RIGHTMODEL__rightcom');

write(of1,',');
writeln(of1,'RIGHTMODEL__rightdecom');

write(of1,',');
writeln(of1,'RIGHTMODEL__dtreeproc');

write(of1,',');
writeln(of1,'RIGHTMODEL__levelids');

write(of1,',');
writeln(of1,'RIGHTMODEL__dtreelevelids');

end
;;if catname = 'MATCHCONDS' then begin 
write(of1,',');writeln(of1,'MATCHCONDS__leftMuVarList');

write(of1,',');
writeln(of1,'MATCHCONDS__leftSigmaVarList');

write(of1,',');
writeln(of1,'MATCHCONDS__leftRelVarList');

write(of1,',');
writeln(of1,'MATCHCONDS__leftTreeVarList');

write(of1,',');
writeln(of1,'MATCHCONDS__leftNodeVarList');

write(of1,',');
writeln(of1,'MATCHCONDS__rightMuVarList');

write(of1,',');
writeln(of1,'MATCHCONDS__rightSigmaVarList');

write(of1,',');
writeln(of1,'MATCHCONDS__rightRelVarList');

write(of1,',');
writeln(of1,'MATCHCONDS__rightTreeVarList');

write(of1,',');
writeln(of1,'MATCHCONDS__rightNodeVarList');

write(of1,',');
writeln(of1,'MATCHCONDS__indent');

write(of1,',');
writeln(of1,'MATCHCONDS__commatchfile');

write(of1,',');
writeln(of1,'MATCHCONDS__decommatchfile');

end
;;if catname = 'PARAMETERSspec' then begin 

end
;;if catname = 'SUBRULES' then begin 
write(of1,',');writeln(of1,'SUBRULES__indent');

write(of1,',');
writeln(of1,'SUBRULES__name');

write(of1,',');
writeln(of1,'SUBRULES__leftsyncattable');

write(of1,',');
writeln(of1,'SUBRULES__rightsyncattable');

write(of1,',');
writeln(of1,'SUBRULES__leftrecordtable');

write(of1,',');
writeln(of1,'SUBRULES__rightrecordtable');

write(of1,',');
writeln(of1,'SUBRULES__prevleftrhslabels');

write(of1,',');
writeln(of1,'SUBRULES__prevrightrhslabels');

write(of1,',');
writeln(of1,'SUBRULES__leftmuvarlist');

write(of1,',');
writeln(of1,'SUBRULES__leftsigmavarlist');

write(of1,',');
writeln(of1,'SUBRULES__lefttreevarlist');

write(of1,',');
writeln(of1,'SUBRULES__rightmuvarlist');

write(of1,',');
writeln(of1,'SUBRULES__rightsigmavarlist');

write(of1,',');
writeln(of1,'SUBRULES__righttreevarlist');

write(of1,',');
writeln(of1,'SUBRULES__modelnumber');

write(of1,',');
writeln(of1,'SUBRULES__vartypes');

write(of1,',');
writeln(of1,'SUBRULES__comsubrules');

write(of1,',');
writeln(of1,'SUBRULES__decomsubrules');

write(of1,',');
writeln(of1,'SUBRULES__dtreeproc');

end
;;if catname = 'SUBFILTERS' then begin 
write(of1,',');writeln(of1,'SUBFILTERS__indent');

write(of1,',');
writeln(of1,'SUBFILTERS__prevrightrhslabels');

write(of1,',');
writeln(of1,'SUBFILTERS__vartypes');

write(of1,',');
writeln(of1,'SUBFILTERS__comsubrules');

write(of1,',');
writeln(of1,'SUBFILTERS__decomsubrules');

end
;;if catname = 'COMCAPAIRS' then begin 
write(of1,',');writeln(of1,'COMCAPAIRS__actionteller');

write(of1,',');
writeln(of1,'COMCAPAIRS__actiontellers');

write(of1,',');
writeln(of1,'COMCAPAIRS__indent');

write(of1,',');
writeln(of1,'COMCAPAIRS__syncattable');

write(of1,',');
writeln(of1,'COMCAPAIRS__recordtable');

write(of1,',');
writeln(of1,'COMCAPAIRS__modelnumber');

write(of1,',');
writeln(of1,'COMCAPAIRS__level');

write(of1,',');
writeln(of1,'COMCAPAIRS__insubrule');

write(of1,',');
writeln(of1,'COMCAPAIRS__filter');

write(of1,',');
writeln(of1,'COMCAPAIRS__vartypes');

write(of1,',');
writeln(of1,'COMCAPAIRS__rhslabels');

write(of1,',');
writeln(of1,'COMCAPAIRS__conditions');

write(of1,',');
writeln(of1,'COMCAPAIRS__actions');

write(of1,',');
writeln(of1,'COMCAPAIRS__allexist');

write(of1,',');
writeln(of1,'COMCAPAIRS__allexistcounter');

end
;;if catname = 'DECOMCAPAIRS' then begin 
write(of1,',');writeln(of1,'DECOMCAPAIRS__actionteller');

write(of1,',');
writeln(of1,'DECOMCAPAIRS__actiontellers');

write(of1,',');
writeln(of1,'DECOMCAPAIRS__indent');

write(of1,',');
writeln(of1,'DECOMCAPAIRS__syncattable');

write(of1,',');
writeln(of1,'DECOMCAPAIRS__recordtable');

write(of1,',');
writeln(of1,'DECOMCAPAIRS__modelnumber');

write(of1,',');
writeln(of1,'DECOMCAPAIRS__level');

write(of1,',');
writeln(of1,'DECOMCAPAIRS__insubrule');

write(of1,',');
writeln(of1,'DECOMCAPAIRS__filter');

write(of1,',');
writeln(of1,'DECOMCAPAIRS__vartypes');

write(of1,',');
writeln(of1,'DECOMCAPAIRS__rhslabels');

write(of1,',');
writeln(of1,'DECOMCAPAIRS__conditions');

write(of1,',');
writeln(of1,'DECOMCAPAIRS__actions');

write(of1,',');
writeln(of1,'DECOMCAPAIRS__allexist');

write(of1,',');
writeln(of1,'DECOMCAPAIRS__allexistcounter');

end
;;if catname = 'CAPAIRS' then begin 
write(of1,',');writeln(of1,'CAPAIRS__actionteller');

write(of1,',');
writeln(of1,'CAPAIRS__actiontellers');

write(of1,',');
writeln(of1,'CAPAIRS__indent');

write(of1,',');
writeln(of1,'CAPAIRS__syncattable');

write(of1,',');
writeln(of1,'CAPAIRS__recordtable');

write(of1,',');
writeln(of1,'CAPAIRS__modelnumber');

write(of1,',');
writeln(of1,'CAPAIRS__level');

write(of1,',');
writeln(of1,'CAPAIRS__insubrule');

write(of1,',');
writeln(of1,'CAPAIRS__filter');

write(of1,',');
writeln(of1,'CAPAIRS__vartypes');

write(of1,',');
writeln(of1,'CAPAIRS__rhslabels');

write(of1,',');
writeln(of1,'CAPAIRS__conditions');

write(of1,',');
writeln(of1,'CAPAIRS__actions');

write(of1,',');
writeln(of1,'CAPAIRS__allexist');

write(of1,',');
writeln(of1,'CAPAIRS__allexistcounter');

end
;;if catname = 'bareCAPAIRS' then begin 
write(of1,',');writeln(of1,'bareCAPAIRS__actionteller');

write(of1,',');
writeln(of1,'bareCAPAIRS__actiontellers');

write(of1,',');
writeln(of1,'bareCAPAIRS__indent');

write(of1,',');
writeln(of1,'bareCAPAIRS__syncattable');

write(of1,',');
writeln(of1,'bareCAPAIRS__recordtable');

write(of1,',');
writeln(of1,'bareCAPAIRS__modelnumber');

write(of1,',');
writeln(of1,'bareCAPAIRS__level');

write(of1,',');
writeln(of1,'bareCAPAIRS__insubrule');

write(of1,',');
writeln(of1,'bareCAPAIRS__filter');

write(of1,',');
writeln(of1,'bareCAPAIRS__vartypes');

write(of1,',');
writeln(of1,'bareCAPAIRS__rhslabels');

write(of1,',');
writeln(of1,'bareCAPAIRS__conditions');

write(of1,',');
writeln(of1,'bareCAPAIRS__actions');

write(of1,',');
writeln(of1,'bareCAPAIRS__allexist');

write(of1,',');
writeln(of1,'bareCAPAIRS__allexistcounter');

end
;;if catname = 'LABELEDTD' then begin 
write(of1,',');writeln(of1,'LABELEDTD__indent');

write(of1,',');
writeln(of1,'LABELEDTD__name');

write(of1,',');
writeln(of1,'LABELEDTD__submodeltree');

write(of1,',');
writeln(of1,'LABELEDTD__righttolefttable');

write(of1,',');
writeln(of1,'LABELEDTD__root');

write(of1,',');
writeln(of1,'LABELEDTD__leftcom');

write(of1,',');
writeln(of1,'LABELEDTD__rightcom');

write(of1,',');
writeln(of1,'LABELEDTD__dtreeproc');

write(of1,',');
writeln(of1,'LABELEDTD__numberofitems');

write(of1,',');
writeln(of1,'LABELEDTD__keymentioned');

write(of1,',');
writeln(of1,'LABELEDTD__keyvar');

write(of1,',');
writeln(of1,'LABELEDTD__keystr1');

write(of1,',');
writeln(of1,'LABELEDTD__keystr2');

write(of1,',');
writeln(of1,'LABELEDTD__levelids');

end
;;if catname = 'LABELtje' then begin 
write(of1,',');writeln(of1,'LABELtje__indent');

end
;;if catname = 'BARETD' then begin 
write(of1,',');writeln(of1,'BARETD__indent');

write(of1,',');
writeln(of1,'BARETD__name');

write(of1,',');
writeln(of1,'BARETD__righttolefttable');

write(of1,',');
writeln(of1,'BARETD__root');

write(of1,',');
writeln(of1,'BARETD__leftcom');

write(of1,',');
writeln(of1,'BARETD__rightcom');

write(of1,',');
writeln(of1,'BARETD__dtreeproc');

write(of1,',');
writeln(of1,'BARETD__NumberOfItems');

write(of1,',');
writeln(of1,'BARETD__keymentioned');

write(of1,',');
writeln(of1,'BARETD__keyvar');

write(of1,',');
writeln(of1,'BARETD__keystr1');

write(of1,',');
writeln(of1,'BARETD__levelids');

write(of1,',');
writeln(of1,'BARETD__keystr2');

end
;;if catname = 'LABELEDND' then begin 
write(of1,',');writeln(of1,'LABELEDND__indent');

write(of1,',');
writeln(of1,'LABELEDND__name');

write(of1,',');
writeln(of1,'LABELEDND__shorthand');

write(of1,',');
writeln(of1,'LABELEDND__leftcom');

write(of1,',');
writeln(of1,'LABELEDND__rightcom');

write(of1,',');
writeln(of1,'LABELEDND__dtreeproc');

write(of1,',');
writeln(of1,'LABELEDND__keymentioned');

write(of1,',');
writeln(of1,'LABELEDND__keyvar');

write(of1,',');
writeln(of1,'LABELEDND__keystr1');

write(of1,',');
writeln(of1,'LABELEDND__keystr2');

end
;;if catname = 'BAREND' then begin 
write(of1,',');writeln(of1,'BAREND__labeled');

write(of1,',');
writeln(of1,'BAREND__label');

write(of1,',');
writeln(of1,'BAREND__indent');

write(of1,',');
writeln(of1,'BAREND__shorthand');

write(of1,',');
writeln(of1,'BAREND__name');

write(of1,',');
writeln(of1,'BAREND__leftcom');

write(of1,',');
writeln(of1,'BAREND__rightcom');

write(of1,',');
writeln(of1,'BAREND__dtreeproc');

write(of1,',');
writeln(of1,'BAREND__keymentioned');

write(of1,',');
writeln(of1,'BAREND__keyvar');

write(of1,',');
writeln(of1,'BAREND__keystr1');

write(of1,',');
writeln(of1,'BAREND__keystr2');

end
;;if catname = 'KEYNAME' then begin 

end
;;if catname = 'LABELEDLD' then begin 
write(of1,',');writeln(of1,'LABELEDLD__indent');

write(of1,',');
writeln(of1,'LABELEDLD__righttolefttable');

write(of1,',');
writeln(of1,'LABELEDLD__submodellist');

write(of1,',');
writeln(of1,'LABELEDLD__inexist');

write(of1,',');
writeln(of1,'LABELEDLD__root');

write(of1,',');
writeln(of1,'LABELEDLD__name');

write(of1,',');
writeln(of1,'LABELEDLD__leftcom');

write(of1,',');
writeln(of1,'LABELEDLD__rightcom');

write(of1,',');
writeln(of1,'LABELEDLD__dtreeproc');

write(of1,',');
writeln(of1,'LABELEDLD__NumberOfItems');

write(of1,',');
writeln(of1,'LABELEDLD__levelids');

end
;;if catname = 'BARELD' then begin 
write(of1,',');writeln(of1,'BARELD__label');

write(of1,',');
writeln(of1,'BARELD__labeled');

write(of1,',');
writeln(of1,'BARELD__indent');

write(of1,',');
writeln(of1,'BARELD__inexist');

write(of1,',');
writeln(of1,'BARELD__bounded');

write(of1,',');
writeln(of1,'BARELD__righttolefttable');

write(of1,',');
writeln(of1,'BARELD__righttoleftmatch');

write(of1,',');
writeln(of1,'BARELD__root');

write(of1,',');
writeln(of1,'BARELD__name');

write(of1,',');
writeln(of1,'BARELD__leftcom');

write(of1,',');
writeln(of1,'BARELD__rightcom');

write(of1,',');
writeln(of1,'BARELD__dtreeproc');

write(of1,',');
writeln(of1,'BARELD__NumberOfItems');

write(of1,',');
writeln(of1,'BARELD__levelids');

end
;;if catname = 'TREEVAR' then begin 
write(of1,',');writeln(of1,'TREEVAR__ident');

end
;;if catname = 'CATNAME' then begin 
write(of1,',');writeln(of1,'CATNAME__ident');

end
;;if catname = 'CATRECNAME' then begin 
write(of1,',');writeln(of1,'CATRECNAME__ident');

end
;;if catname = 'NODEVAR' then begin 
write(of1,',');writeln(of1,'NODEVAR__ident');

end
;;if catname = 'ITEM' then begin 
write(of1,',');writeln(of1,'ITEM__indent');

write(of1,',');
writeln(of1,'ITEM__righttolefttable');

write(of1,',');
writeln(of1,'ITEM__root');

write(of1,',');
writeln(of1,'ITEM__name');

write(of1,',');
writeln(of1,'ITEM__leftcom');

write(of1,',');
writeln(of1,'ITEM__rightcom');

write(of1,',');
writeln(of1,'ITEM__dtreeproc');

write(of1,',');
writeln(of1,'ITEM__identifier');

write(of1,',');
writeln(of1,'ITEM__levelids');

end
;;if catname = 'LABELEDITEM' then begin 
write(of1,',');writeln(of1,'LABELEDITEM__indent');

write(of1,',');
writeln(of1,'LABELEDITEM__righttolefttable');

write(of1,',');
writeln(of1,'LABELEDITEM__root');

write(of1,',');
writeln(of1,'LABELEDITEM__name');

write(of1,',');
writeln(of1,'LABELEDITEM__leftcom');

write(of1,',');
writeln(of1,'LABELEDITEM__rightcom');

write(of1,',');
writeln(of1,'LABELEDITEM__dtreeproc');

write(of1,',');
writeln(of1,'LABELEDITEM__identifier');

write(of1,',');
writeln(of1,'LABELEDITEM__levelids');

end
;;if catname = 'BAREITEM' then begin 
write(of1,',');writeln(of1,'BAREITEM__labeled');

write(of1,',');
writeln(of1,'BAREITEM__label');

write(of1,',');
writeln(of1,'BAREITEM__indent');

write(of1,',');
writeln(of1,'BAREITEM__righttoleftmatch');

write(of1,',');
writeln(of1,'BAREITEM__righttolefttable');

write(of1,',');
writeln(of1,'BAREITEM__root');

write(of1,',');
writeln(of1,'BAREITEM__name');

write(of1,',');
writeln(of1,'BAREITEM__leftcom');

write(of1,',');
writeln(of1,'BAREITEM__rightcom');

write(of1,',');
writeln(of1,'BAREITEM__dtreeproc');

write(of1,',');
writeln(of1,'BAREITEM__identifier');

write(of1,',');
writeln(of1,'BAREITEM__levelids');

end
;;if catname = 'MUVAR' then begin 
write(of1,',');writeln(of1,'MUVAR__ident');

end
;;if catname = 'RELVAR' then begin 
write(of1,',');writeln(of1,'RELVAR__ident');

end
;;if catname = 'RELNAME' then begin 
write(of1,',');writeln(of1,'RELNAME__ident');

end
;;if catname = 'SIGMAVAR' then begin 
write(of1,',');writeln(of1,'SIGMAVAR__ident');

end
;;if catname = 'RTD' then begin 
write(of1,',');writeln(of1,'RTD__labeled');

write(of1,',');
writeln(of1,'RTD__label');

write(of1,',');
writeln(of1,'RTD__indent');

write(of1,',');
writeln(of1,'RTD__righttolefttable');

write(of1,',');
writeln(of1,'RTD__root');

write(of1,',');
writeln(of1,'RTD__name');

write(of1,',');
writeln(of1,'RTD__leftcom');

write(of1,',');
writeln(of1,'RTD__rightcom');

write(of1,',');
writeln(of1,'RTD__dtreeproc');

write(of1,',');
writeln(of1,'RTD__variable');

write(of1,',');
writeln(of1,'RTD__NumberOfItems');

write(of1,',');
writeln(of1,'RTD__RelationNamed');

write(of1,',');
writeln(of1,'RTD__keymentioned');

write(of1,',');
writeln(of1,'RTD__keyvar');

write(of1,',');
writeln(of1,'RTD__keystr1');

write(of1,',');
writeln(of1,'RTD__keystr2');

write(of1,',');
writeln(of1,'RTD__levelids');

end
;;if catname = 'LD' then begin 
write(of1,',');writeln(of1,'LD__inexist');

write(of1,',');
writeln(of1,'LD__NumberOfItems');

write(of1,',');
writeln(of1,'LD__allexist');

write(of1,',');
writeln(of1,'LD__levelids');

end
;;if catname = 'RELD' then begin 
write(of1,',');writeln(of1,'RELD__labeled');

write(of1,',');
writeln(of1,'RELD__label');

write(of1,',');
writeln(of1,'RELD__indent');

write(of1,',');
writeln(of1,'RELD__leftcom');

write(of1,',');
writeln(of1,'RELD__rightcom');

write(of1,',');
writeln(of1,'RELD__variable');

write(of1,',');
writeln(of1,'RELD__RelationNamed');

end
;;if catname = 'ANDCOND' then begin 
write(of1,',');writeln(of1,'ANDCOND__indent');

write(of1,',');
writeln(of1,'ANDCOND__toplevel');

write(of1,',');
writeln(of1,'ANDCOND__vartypes');

write(of1,',');
writeln(of1,'ANDCOND__commatchfile');

write(of1,',');
writeln(of1,'ANDCOND__decommatchfile');

write(of1,',');
writeln(of1,'ANDCOND__allexist');

write(of1,',');
writeln(of1,'ANDCOND__allexistcounter');

end
;;if catname = 'ORCOND' then begin 
write(of1,',');writeln(of1,'ORCOND__vartypes');

write(of1,',');
writeln(of1,'ORCOND__commatchfile');

write(of1,',');
writeln(of1,'ORCOND__decommatchfile');

write(of1,',');
writeln(of1,'ORCOND__allexist');

write(of1,',');
writeln(of1,'ORCOND__allexistcounter');

end
;;if catname = 'ELEMENTARYCOND' then begin 
write(of1,',');writeln(of1,'ELEMENTARYCOND__vartypes');

write(of1,',');
writeln(of1,'ELEMENTARYCOND__commatchfile');

write(of1,',');
writeln(of1,'ELEMENTARYCOND__decommatchfile');

write(of1,',');
writeln(of1,'ELEMENTARYCOND__allexist');

write(of1,',');
writeln(of1,'ELEMENTARYCOND__allexistcounter');

end
;;if catname = 'MATCHBOOLEAN' then begin 
write(of1,',');writeln(of1,'MATCHBOOLEAN__commatchfile');

write(of1,',');
writeln(of1,'MATCHBOOLEAN__decommatchfile');

write(of1,',');
writeln(of1,'MATCHBOOLEAN__allexist');

write(of1,',');
writeln(of1,'MATCHBOOLEAN__allexistcounter');

end
;;if catname = 'BOOLEANEXPR' then begin 
write(of1,',');writeln(of1,'BOOLEANEXPR__vartypes');

write(of1,',');
writeln(of1,'BOOLEANEXPR__commatchfile');

write(of1,',');
writeln(of1,'BOOLEANEXPR__decommatchfile');

write(of1,',');
writeln(of1,'BOOLEANEXPR__allexist');

write(of1,',');
writeln(of1,'BOOLEANEXPR__allexistcounter');

end
;;if catname = 'PASCALEXPR' then begin 
write(of1,',');writeln(of1,'PASCALEXPR__vartypes');

write(of1,',');
writeln(of1,'PASCALEXPR__commatchfile');

write(of1,',');
writeln(of1,'PASCALEXPR__decommatchfile');

write(of1,',');
writeln(of1,'PASCALEXPR__casefile');

write(of1,',');
writeln(of1,'PASCALEXPR__allexistcounter');

end
;;if catname = 'CONDRECORD' then begin 
write(of1,',');writeln(of1,'CONDRECORD__commatchfile');

write(of1,',');
writeln(of1,'CONDRECORD__decommatchfile');

write(of1,',');
writeln(of1,'CONDRECORD__allexist');

write(of1,',');
writeln(of1,'CONDRECORD__allexistcounter');

end
;;if catname = 'ASSIGNRECORD' then begin 
write(of1,',');writeln(of1,'ASSIGNRECORD__copy');

end
;;if catname = 'PARNAME' then begin 
write(of1,',');writeln(of1,'PARNAME__ident');

end
;;if catname = 'PARTYPE' then begin 
write(of1,',');writeln(of1,'PARTYPE__ident');

end
;;if catname = 'LEFTSUBMODELS' then begin 
write(of1,',');writeln(of1,'LEFTSUBMODELS__righttolefttable');

write(of1,',');
writeln(of1,'LEFTSUBMODELS__indent');

write(of1,',');
writeln(of1,'LEFTSUBMODELS__name');

write(of1,',');
writeln(of1,'LEFTSUBMODELS__prevrhslabels');

write(of1,',');
writeln(of1,'LEFTSUBMODELS__rightmuvarlist');

write(of1,',');
writeln(of1,'LEFTSUBMODELS__rightsigmavarl');

write(of1,',');
writeln(of1,'LEFTSUBMODELS__righttreevarl');

write(of1,',');
writeln(of1,'LEFTSUBMODELS__leftcom');

write(of1,',');
writeln(of1,'LEFTSUBMODELS__leftdecom');

write(of1,',');
writeln(of1,'LEFTSUBMODELS__dtreeproc');

write(of1,',');
writeln(of1,'LEFTSUBMODELS__levelids');

end
;;if catname = 'RIGHTSUBMODELS' then begin 
write(of1,',');writeln(of1,'RIGHTSUBMODELS__righttolefttabl');

write(of1,',');
writeln(of1,'RIGHTSUBMODELS__name');

write(of1,',');
writeln(of1,'RIGHTSUBMODELS__indent');

write(of1,',');
writeln(of1,'RIGHTSUBMODELS__prevrhslabels');

write(of1,',');
writeln(of1,'RIGHTSUBMODELS__leftmuvarlist');

write(of1,',');
writeln(of1,'RIGHTSUBMODELS__leftsigmavarl');

write(of1,',');
writeln(of1,'RIGHTSUBMODELS__lefttreevarl');

write(of1,',');
writeln(of1,'RIGHTSUBMODELS__rightcom');

write(of1,',');
writeln(of1,'RIGHTSUBMODELS__rightdecom');

write(of1,',');
writeln(of1,'RIGHTSUBMODELS__dtreeproc');

write(of1,',');
writeln(of1,'RIGHTSUBMODELS__levelids');

end
;;if catname = 'CONDITION' then begin 
write(of1,',');writeln(of1,'CONDITION__actiontellers');

write(of1,',');
writeln(of1,'CONDITION__vartypes');

write(of1,',');
writeln(of1,'CONDITION__copy');

write(of1,',');
writeln(of1,'CONDITION__allexist');

write(of1,',');
writeln(of1,'CONDITION__allexistcounter');

write(of1,',');
writeln(of1,'CONDITION__recattvals');

end
;;if catname = 'ACTION' then begin 
write(of1,',');writeln(of1,'ACTION__vartypes');

write(of1,',');
writeln(of1,'ACTION__deepestlevel');

write(of1,',');
writeln(of1,'ACTION__actions');

end
;;if catname = 'STATEMENTS' then begin 
write(of1,',');writeln(of1,'STATEMENTS__vartypes');

write(of1,',');
writeln(of1,'STATEMENTS__copy');

end
;;if catname = 'PASCALSTATEMENT' then begin 
write(of1,',');writeln(of1,'PASCALSTATEMENT__vartypes');

write(of1,',');
writeln(of1,'PASCALSTATEMENT__copy');

end
;;if catname = 'CLABEL' then begin 
write(of1,',');writeln(of1,'CLABEL__ident');

end
;;if catname = 'ALABEL' then begin 
write(of1,',');writeln(of1,'ALABEL__ident');

end
;;if catname = 'ILABELtje' then begin 
write(of1,',');writeln(of1,'ILABELtje__ident');

end
;;if catname = 'MLABELtje' then begin 
write(of1,',');writeln(of1,'MLABELtje__ident');

end
;;if catname = 'RLABELtje' then begin 
write(of1,',');writeln(of1,'RLABELtje__ident');

end
;;if catname = 'LLABELtje' then begin 
write(of1,',');writeln(of1,'LLABELtje__ident');

end
;;if catname = 'TRUECAT' then begin 
write(of1,',');writeln(of1,'TRUECAT__ident');

end
;;if catname = 'CATCAT' then begin 
write(of1,',');writeln(of1,'CATCAT__ident');

end
;;if catname = 'GRAPH' then begin 
write(of1,',');writeln(of1,'GRAPH__make');

end
;;if catname = 'CONCGRAPH' then begin 
write(of1,',');writeln(of1,'CONCGRAPH__number');

write(of1,',');
writeln(of1,'CONCGRAPH__make');

end
;;if catname = 'ELEMENTARYGRAPH' then begin 
write(of1,',');writeln(of1,'ELEMENTARYGRAPH__number');

write(of1,',');
writeln(of1,'ELEMENTARYGRAPH__make');

end
;;if catname = 'NUMBER' then begin 

end
;;if catname = 'VARNAME' then begin 
write(of1,',');writeln(of1,'VARNAME__string');

end
;;if catname = 'VALUENAME' then begin 
write(of1,',');writeln(of1,'VALUENAME__string');

end
;;if catname = 'SETVALUENAME' then begin 
write(of1,',');writeln(of1,'SETVALUENAME__copy');

end
;;if catname = 'BONUSspec' then begin 
write(of1,',');writeln(of1,'BONUSspec__bonusfile');

end
;;if catname = 'DTREE' then begin 
write(of1,',');writeln(of1,'DTREE__name');

write(of1,',');
writeln(of1,'DTREE__rightcom');

write(of1,',');
writeln(of1,'DTREE__comactions');

write(of1,',');
writeln(of1,'DTREE__decomactions');

write(of1,',');
writeln(of1,'DTREE__extern');

write(of1,',');
writeln(of1,'DTREE__levelids');

write(of1,',');
writeln(of1,'DTREE__counter');

write(of1,',');
writeln(of1,'DTREE__externcounter');

end
;;if catname = 'LABELEDDTREE' then begin 
write(of1,',');writeln(of1,'LABELEDDTREE__name');

write(of1,',');
writeln(of1,'LABELEDDTREE__rightcom');

write(of1,',');
writeln(of1,'LABELEDDTREE__levelids');

write(of1,',');
writeln(of1,'LABELEDDTREE__comactions');

write(of1,',');
writeln(of1,'LABELEDDTREE__decomactions');

write(of1,',');
writeln(of1,'LABELEDDTREE__extern');

end
;end;
