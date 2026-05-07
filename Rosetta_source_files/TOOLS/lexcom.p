(*MPD:::===================================================================*
 *
 *  Rosetta Project                                                 
 *                                                                  
 *  Module Title    : lexcom
 *  Creation date   : june 1986
 *  Author          : Rene leermakers
 *                                                                  
 *  Copyright (c) 1985, by Nederlandse Philips Bedrijven BV.        
 *                                                                  
 *  Remarks         : lextree rule compiler
 *
 *EMP:::===================================================================*)

pragma C_include('lexcomscanner.pf');
pragma C_include('lexcomparser.pf');
pragma C_include('lexcomdecl.pf');
pragma C_include('lexcomcode.pf');
pragma C_include('logname.pf');
(*=========================================================================*
 *  Imported modules
 *=========================================================================*)
WITH LEXCOMSCANNER,
     LEXCOMPARSER,
     LEXCOMDECL,
     LEXCOMCODE,
     LOGNAME;
     

Program lexcom(LogName);

var errorptr:^INTEGER;
   LogName   : Text;
   infile    : STRING(100);
   if1,compas1{pascal compositional rule-file},decompas1{pascal decompositional
   rule-file},comenv1{environment compositional rule-file},decomenv1:text;
   if2:LEXCOMDECL_pconnectionnode;
   if3:LEXCOMDECL_plostree;
   stree1:LEXCOMDECL_psnode;
   rulenaam,language:LEXCOMDECL_string;
   revisednew:LEXCOMDECL_string;
   stillrules,allmode,phondutch1,dutch1,english1,spanish1:BOOLEAN;
   dutch2,english2,spanish2,phondutch2:BOOLEAN;
   dutch3,english3,spanish3,phondutch3:BOOLEAN;
function extracttree(plostree1:LEXCOMDECL_plostree;var stree1:LEXCOMDECL_psnode):BOOLEAN;
var result:BOOLEAN;
begin
result:=false;
if plostree1 <> nil then
   begin
   if plostree1^.next <> nil then 
   		begin 
   		writeln('more than one parse found')
   		end
   else 
      begin
      stree1:=plostree1^.arg;
      result:=true;
      writeln('parse succeeded')
      end
   end;
if not(result) and not(allmode) then writeln('parse unsuccesful');
extracttree:=result
end;


BEGIN
   reset(LogName);
   LogName_Init(LogName);
   LogName_Translate('inputfile',infile);
   infile := LogName_FindFile(infile);
   reset(if1, infile);
LEXCOMDECL_assigndebug(false);
rulenaam:='all';
LEXCOMDECL_initcounter;
LogName_Translate('compas',infile);
rewrite(compas1,infile);
LogName_Translate('decompas',infile);
rewrite(decompas1,infile);
LogName_Translate('comenv',infile);
rewrite(comenv1,infile);
LogName_Translate('decomenv',infile);
rewrite(decomenv1,infile);
allmode:=true;
language:='LINGO';
phondutch1:=false;dutch1:=false;english1:=false;spanish1:=false;
phondutch2:=false;dutch2:=false;english2:=false;spanish2:=false;
phondutch3:=false;dutch3:=false;english3:=false;spanish3:=false;
LEXCOMSCANNER_body(if1,language,allmode,if2);
if language='PHONDUTCH1' then phondutch1:=true;
if language='PHONDUTCH2' then phondutch2:=true;
if language='PHONDUTCH3' then phondutch3:=true;
if language='DUTCH1' then dutch1:=true;
if language='ENGLISH1' then english1:=true;
if language='SPANISH1' then spanish1:=true;
if language='DUTCH2' then dutch2:=true;
if language='ENGLISH2' then english2:=true;
if language='SPANISH2' then spanish2:=true;
if language='DUTCH3' then dutch3:=true;
if language='ENGLISH3' then english3:=true;
if language='SPANISH3' then spanish3:=true;
IF dutch1 or dutch2 or dutch3 THEN language:='dutch';
IF english1 or english2 or english3 THEN language:='english';
IF spanish1 or spanish2 or spanish3 THEN language:='spanish';
if phondutch1 OR dutch1 OR english1 OR spanish1 then 
     begin
     writeln(compas1,'EXPORT(comlexrules1);');
     writeln(compas1,'pragma C_include(''string.pf'');');
     writeln(compas1,'pragma C_include(''ldblex.pf'');');
     writeln(compas1,'pragma C_include(''strtokey.pf'');');
     writeln(compas1,'pragma C_include(''listree.pf'');');
     writeln(compas1,'pragma C_include(''comlexrules1.pf'');');
     writeln(compas1,'pragma C_include(''lsdomaint.pf'');');
     writeln(compas1,'pragma C_include(''maket.pf'');');
     writeln(compas1,'pragma C_include(''copyt.pf'');');
     writeln(compas1,'pragma C_include(''lsstree.pf'');');
     writeln(compas1,'PROGRAM comlexrules1;');
     writeln(compas1,
         'WITH STRNG,LDBLEX,STRTOKEY,LISTREE,LSDOMAINT,MAKET,COPYT,LSSTREE;');
     end;
if phondutch2 OR dutch2 OR english2 OR spanish2 then 
     begin
     writeln(compas1,'EXPORT(comlexrules2);');
     writeln(compas1,'pragma C_include(''string.pf'');');
     writeln(compas1,'pragma C_include(''ldblex.pf'');');
     writeln(compas1,'pragma C_include(''strtokey.pf'');');
     writeln(compas1,'pragma C_include(''listree.pf'');');
     writeln(compas1,'pragma C_include(''comlexrules2.pf'');');
     writeln(compas1,'pragma C_include(''lsdomaint.pf'');');
     writeln(compas1,'pragma C_include(''maket.pf'');');
     writeln(compas1,'pragma C_include(''copyt.pf'');');
     writeln(compas1,'pragma C_include(''lsstree.pf'');');
     writeln(compas1,'PROGRAM comlexrules2;');
     writeln(compas1,
         'WITH STRNG,LDBLEX,STRTOKEY,LISTREE,LSDOMAINT,MAKET,COPYT,LSSTREE;');
     end;
if phondutch3 OR dutch3 OR english3 OR spanish3 then 
     begin
     writeln(compas1,'EXPORT(comlexrules3);');
     writeln(compas1,'pragma C_include(''string.pf'');');
     writeln(compas1,'pragma C_include(''strtokey.pf'');');
     writeln(compas1,'pragma C_include(''ldblex.pf'');');
     writeln(compas1,'pragma C_include(''listree.pf'');');
     writeln(compas1,'pragma C_include(''comlexrules3.pf'');');
     writeln(compas1,'pragma C_include(''lsdomaint.pf'');');
     writeln(compas1,'pragma C_include(''maket.pf'');');
     writeln(compas1,'pragma C_include(''copyt.pf'');');
     writeln(compas1,'pragma C_include(''lsstree.pf'');');
     writeln(compas1,'PROGRAM comlexrules3;');
     writeln(compas1,
         'WITH STRNG,LDBLEX,STRTOKEY,LISTREE,LSDOMAINT,MAKET,COPYT,LSSTREE;');
     end;

writeln(compas1);
writeln(compas1,'PROCEDURE skip;');
writeln(compas1,'begin');
writeln(compas1,'end;');

writeln(compas1,'FUNCTION numberofelements(L:LSSTREE_pRelNode):INTEGER;');
writeln(compas1,'VAR result:INTEGER;');
writeln(compas1,'BEGIN');
writeln(compas1,'result:=0;');
writeln(compas1,'WHILE L<>NIL DO');
writeln(compas1,' BEGIN');
writeln(compas1,' result:=result+1;');
writeln(compas1,' L:=L^.brother');
writeln(compas1,' END;');
writeln(compas1,'numberofelements:=result');
writeln(compas1,'END;');

writeln(compas1,'FUNCTION intkey(str:STRING_string):INTEGER;');
writeln(compas1,'VAR result:INTEGER;');
writeln(compas1,'BEGIN');
writeln(compas1,'STRTOKEY_getskey(str,result);');
writeln(compas1,'intkey:=result');
writeln(compas1,'END;');

if phondutch1 OR dutch1 OR english1 OR spanish1 then 
     begin
     writeln(decompas1,'EXPORT(decomlexrules1);');
     writeln(decompas1,'pragma C_include(''string.pf'');');
     writeln(decompas1,'pragma C_include(''ldblex.pf'');');
     writeln(decompas1,'pragma C_include(''strtokey.pf'');');
     writeln(decompas1,'pragma C_include(''listree.pf'');');
     writeln(decompas1,'pragma C_include(''decomlexrules1.pf'');');
     writeln(decompas1,'pragma C_include(''lsdomaint.pf'');');
     writeln(decompas1,'pragma C_include(''maket.pf'');');
     writeln(decompas1,'pragma C_include(''copyt.pf'');');
     writeln(decompas1,'pragma C_include(''lsstree.pf'');');
     writeln(decompas1,'PROGRAM decomlexrules1;');
     writeln(decompas1,
         'WITH STRNG,LDBLEX,STRTOKEY,LISTREE,LSDOMAINT,MAKET,COPYT,LSSTREE;');     end;
if phondutch2 OR dutch2 OR english2 OR spanish2 then 
     begin
     writeln(decompas1,'EXPORT(decomlexrules2);');
     writeln(decompas1,'pragma C_include(''string.pf'');');
     writeln(decompas1,'pragma C_include(''ldblex.pf'');');
     writeln(decompas1,'pragma C_include(''strtokey.pf'');');
     writeln(decompas1,'pragma C_include(''listree.pf'');');
     writeln(decompas1,'pragma C_include(''decomlexrules2.pf'');');
     writeln(decompas1,'pragma C_include(''lsdomaint.pf'');');
     writeln(decompas1,'pragma C_include(''maket.pf'');');
     writeln(decompas1,'pragma C_include(''copyt.pf'');');
     writeln(decompas1,'pragma C_include(''lsstree.pf'');');
     writeln(decompas1,'PROGRAM decomlexrules2;');
     writeln(decompas1,
         'WITH STRNG,LDBLEX,STRTOKEY,LISTREE,LSDOMAINT,MAKET,COPYT,LSSTREE;');      end;
if phondutch3 OR dutch3 OR english3 OR spanish3 then 
     begin
     writeln(decompas1,'EXPORT(decomlexrules3);');
     writeln(decompas1,'pragma C_include(''string.pf'');');
     writeln(decompas1,'pragma C_include(''strtokey.pf'');');
     writeln(decompas1,'pragma C_include(''ldblex.pf'');');
     writeln(decompas1,'pragma C_include(''listree.pf'');');
     writeln(decompas1,'pragma C_include(''decomlexrules3.pf'');');
     writeln(decompas1,'pragma C_include(''lsdomaint.pf'');');
     writeln(decompas1,'pragma C_include(''maket.pf'');');
     writeln(decompas1,'pragma C_include(''copyt.pf'');');
     writeln(decompas1,'pragma C_include(''lsstree.pf'');');
     writeln(decompas1,'PROGRAM decomlexrules3;');
     writeln(decompas1,
         'WITH STRNG,LDBLEX,STRTOKEY,LISTREE,LSDOMAINT,MAKET,COPYT,LSSTREE;');     end;

writeln(decompas1);
writeln(decompas1,'PROCEDURE skip;');
writeln(decompas1,'begin');
writeln(decompas1,'end;');

writeln(decompas1,'FUNCTION numberofelements(L:LSSTREE_pRelNode):INTEGER;');
writeln(decompas1,'VAR result:INTEGER;');
writeln(decompas1,'BEGIN');
writeln(decompas1,'result:=0;');
writeln(decompas1,'WHILE L<>NIL DO');
writeln(decompas1,' BEGIN');
writeln(decompas1,' result:=result+1;');
writeln(decompas1,' L:=L^.brother');
writeln(decompas1,' END;');
writeln(decompas1,'numberofelements:=result');
writeln(decompas1,'END;');

writeln(decompas1,'FUNCTION intkey(str:STRING_string):INTEGER;');
writeln(decompas1,'VAR result:INTEGER;');
writeln(decompas1,'BEGIN');
writeln(decompas1,'STRTOKEY_getskey(str,result);');
writeln(decompas1,'intkey:=result');
writeln(decompas1,'END;');

if dutch1 OR dutch2 OR dutch3 then 
     begin
     writeln(comenv1,'{*DUTCH}');
     end;
if phondutch1 OR phondutch2 OR phondutch3 then 
     begin
     writeln(comenv1,'{*PHONDUTCH}');
     end;
if english1 OR english2 OR english3 then 
     begin
     writeln(comenv1,'{*ENGLISH}');
     end;
if spanish1 OR spanish2 OR spanish3 then 
     begin
     writeln(comenv1,'{*SPANISH}');
     end;

if phondutch1 OR dutch1 OR english1 OR spanish1 then 
     begin
     writeln(comenv1,'pragma C_include(''listree.pf'');');
     write(comenv1,'pragma C_include(''');
     writeln(comenv1,'lsstree.pf'');');
     writeln(comenv1,'PACKAGE comlexrules1;');
     writeln(comenv1,'WITH listree,lsstree;');
     writeln(decomenv1,'pragma C_include(''listree.pf'');');
     write(decomenv1,'pragma C_include(''');
     writeln(decomenv1,'lsstree.pf'');');
     writeln(decomenv1,'PACKAGE decomlexrules1;');
     writeln(decomenv1,'WITH listree,lsstree;');
     end;

if phondutch2 OR dutch2 OR english2 OR spanish2 then 
     begin
     writeln(comenv1,'pragma C_include(''listree.pf'');');
     write(comenv1,'pragma C_include(''');
     writeln(comenv1,'lsstree.pf'');');
     writeln(comenv1,'PACKAGE comlexrules2;');
     writeln(comenv1,'WITH listree,lsstree;');
     writeln(decomenv1,'pragma C_include(''listree.pf'');');
     write(decomenv1,'pragma C_include(''');
     writeln(decomenv1,'lsstree.pf'');');
     writeln(decomenv1,'PACKAGE decomlexrules2;');
     writeln(decomenv1,'WITH listree,lsstree;');
     end;

if phondutch3 OR dutch3 OR english3 OR spanish3 then 
     begin
     writeln(comenv1,'pragma C_include(''listree.pf'');');
     write(comenv1,'pragma C_include(''');
     writeln(comenv1,'lsstree.pf'');');
     writeln(comenv1,'PACKAGE comlexrules3;');
     writeln(comenv1,'WITH listree,lsstree;');
     writeln(decomenv1,'pragma C_include(''listree.pf'');');
     write(decomenv1,'pragma C_include(''');
     writeln(decomenv1,'lsstree.pf'');');
     writeln(decomenv1,'PACKAGE decomlexrules3;');
     writeln(decomenv1,'WITH listree,lsstree;');
     end;

stillrules:=true;
while stillrules do
   	begin
   	if2:=nil;
        set_length(rulenaam,0);
   	LEXCOMSCANNER_body(if1,rulenaam,allmode,if2);{rulenaam gets a value}
   	if length(rulenaam)<> 0 then write('LEX... ',rulenaam,'  ')
   	else writeln('LEX... FINISHED');
   	LEXCOMPARSER_body(if2,if3);
        stillrules:=extracttree(if3,stree1);
        IF NOT (stillrules) AND (length(rulenaam)<>0) THEN
          BEGIN
        writeln('ERROR in LEXfile, please neglect the following error message');
          errorptr:=NIL;
          dispose(errorptr);
          END;
   	if stillrules then
             begin
             LEXCOMCODE_writerulecode(rulenaam,stree1,compas1,decompas1);
             LEXCOMCODE_writeintercode(rulenaam,stree1,comenv1,decomenv1)
   	     end;
   	end;
close(if1);
writeln(comenv1,'END;');
writeln(decomenv1,'END;')
end.
