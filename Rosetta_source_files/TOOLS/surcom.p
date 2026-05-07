(*MPD:::===================================================================*
 *
 *  Rosetta Project                                                 
 *                                                                  
 *  Module Title    : surcom
 *  Creation date   : january 1987
 *  Author          : rene leermakers                                  
 *                                                                  
 *  Copyright (c) 1985, by Nederlandse Philips Bedrijven BV.        
 *                                                                  
 *  Remarks         : The surface rule compiler. It scans, parses, and 
 *                    generates code for one surface rule at the time.
 *                    The first scanner action is to read the language
 *                    the rules describe, i.e. DUTCH, ENGLISH or SPANISH.
 *                    The file graphspas1 (VMS file 
 *                    LANGUAGE:SURFRULESGRAPHS.PAS) contains the translated 
 *                    regular expressions, the file rulespas1 (VMS file
 *                    LANGUAGE:SURFRULES.PAS) the transduced rules
 *                    as far as the conditions and actions are concerned.
 *                    The file primspas1 (LANGUAGE:LDPRIMS.PAS) some functions
 *                    needed by the surface parser, which depend
 *                    (in)directly on the number of surface rules.
 *
 *EMP:::===================================================================*)
pragma C_include('surcomparser.pf');
pragma C_include('surcomdecl.pf');
pragma C_include('surcomcode.pf');
pragma C_include('surcomscanner.pf');
pragma C_include('logname.pf');

WITH SURCOMSCANNER,
     SURCOMPARSER,
     SURCOMDECL,
     SURCOMCODE,
     LOGNAME;


Program surcom(LogName);
var
   LogName   : Text;
   infile    : STRING(100);
   if1,graphspas1,rulespas1,primspas1:text;
   if2:SURCOMDECL_pconnectionnode;
   if3:SURCOMDECL_plostree;
   stree1:SURCOMDECL_psnode;
   rulenaam,language:SURCOMDECL_string;
   revisednew:SURCOMDECL_string;
   stillrules,dutch,english,spanish:BOOLEAN;
function extracttree(plostree1:SURCOMDECL_plostree;var stree1:SURCOMDECL_psnode):BOOLEAN;
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
if not(result) then writeln('parse unsuccesful');
extracttree:=result
end;

begin
   reset(LogName);
   LogName_Init(LogName);
   LogName_Translate('inputfile',infile);
   infile := LogName_FindFile(infile);
   reset(if1, infile);
SURCOMDECL_assigndebug(false);
SURCOMCODE_inittable;
rulenaam:='all';
SURCOMDECL_initcounter;
LogName_Translate('graphspas',infile);
rewrite(graphspas1,infile);
LogName_Translate('rulespas',infile);
rewrite(rulespas1,infile);
LogName_Translate('primspas',infile);
rewrite(primspas1,infile);
language:='LINGO';
dutch:=false;english:=false;spanish:=false;
SURCOMSCANNER_body(if1,language,if2,rulespas1);
if language='DUTCH' then dutch:=true;
if language='ENGLISH' then english:=true;
if language='SPANISH' then spanish:=true;
     writeln(graphspas1,
        'EXPORT(surfrulesgraphs);');
     writeln(graphspas1,
        'pragma C_include(''liprims.pf'');');
     writeln(graphspas1,
        'pragma C_include(''lidomaint.pf'');');
     writeln(graphspas1,
        'pragma C_include(''surfrulesgraphs.pf'');');
     writeln(graphspas1,'PROGRAM surfrulesgraphs;');
     writeln(graphspas1,
        'WITH liprims,lidomaint;');
     writeln(rulespas1,
        'EXPORT(surfrules);');
     writeln(rulespas1,
        'pragma C_include(''listree.pf'');');
     writeln(rulespas1,
        'pragma C_include(''lsauxdom.pf'');');
     writeln(rulespas1,
        'pragma C_include(''lidomaint.pf'');');
     writeln(rulespas1,
        'pragma C_include(''lsdomaint.pf'');');
     writeln(rulespas1,
        'pragma C_include(''lssurfquo.pf'');');
     writeln(rulespas1,
        'pragma C_include(''maket.pf'');');
     writeln(rulespas1,
        'pragma C_include(''copyt.pf'');');
     writeln(rulespas1,
        'pragma C_include(''strtokey.pf'');');
     writeln(rulespas1,
        'pragma C_include(''string.pf'');');
     writeln(rulespas1,
        'pragma C_include(''surfrules.pf'');');
     writeln(rulespas1,
        'pragma C_include(''lsstree.pf'');');
     writeln(rulespas1,
        'pragma C_include(''liprims.pf'');');
     writeln(rulespas1,'PROGRAM surfrules;');
     writeln(rulespas1,'WITH listree,lsauxdom,lidomaint,lsdomaint,lssurfquo,');
     writeln(rulespas1,'maket,copyt,strtokey,strng,lsstree,liprims;');
     writeln(rulespas1,'VAR top:LSSTREE_pStree;litop:LISTREE_pstree;');
     writeln(rulespas1,'    synrel:LSDOMAINT_synrel;');
     writeln(rulespas1,'function auxkey(strkey:STRING_string):INTEGER;');
     writeln(rulespas1,'VAR int:INTEGER;');
     writeln(rulespas1,'begin');
     writeln(rulespas1,'STRtoKey_getSkeyHash(strkey,int);');
     writeln(rulespas1,'auxkey:=int end;');
     writeln(primspas1,
        'EXPORT(ldprims);');
     writeln(primspas1,
        'pragma C_include(''liprims.pf'');');
     writeln(primspas1,
        'pragma C_include(''ldprims.pf'');');
     writeln(primspas1,
        'pragma C_include(''items.pf'');');
     writeln(primspas1,'PROGRAM ldprims;');
     writeln(primspas1,'WITH liprims,items;');

stillrules:=true;
while stillrules do
   	begin
   	if2:=nil;
        set_length(rulenaam,0);
   	SURCOMSCANNER_body(if1,rulenaam,if2,rulespas1);{rulenaam gets a value}
        IF (rulenaam='%') THEN SURCOMSCANNER_body(if1,rulenaam,if2,rulespas1);
   	if length(rulenaam) <> 0 then 
           begin
           IF rulenaam<>'%' THEN BEGIN
             write('SUR... ',rulenaam,'  ');
             SURCOMPARSER_body(if2,if3);
             stillrules:=extracttree(if3,stree1);
             END
           ELSE BEGIN
             writeln('SUR... FINISHED');
             stillrules:=false
             END
           end
   	else 
           begin
           writeln('SUR... FINISHED');
           stillrules:=false
           end;
   	if stillrules then
             SURCOMCODE_writerulecode(rulenaam,stree1,graphspas1)
   	end;
close(if1);
SURCOMCODE_writeswitches(graphspas1,rulespas1,primspas1);
end;
