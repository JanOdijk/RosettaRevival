(*MPD:::===================================================================*
 *
 *  Rosetta Project                                                 
 *                                                                  
 *  Module Title    : mrusurcom
 *  Creation date   :                                               
 *  Author          :                                               
 *                                                                  
 *  Copyright (c) 1985, by Nederlandse Philips Bedrijven BV.        
 *                                                                  
 *  Remarks         :  
 *
 *EMP:::===================================================================*)

pragma C_include('mrusurcomscanner.pf');
pragma C_include('mrusurcomparser.pf');
pragma C_include('mrusurcomdecl.pf');
pragma C_include('mrusurcomcode.pf');
pragma C_include('mrusurcomwrite.pf');
pragma C_include('logname.pf');
pragma C_include('string.pf');

WITH mrusurcomscanner,
     mrusurcomparser,
     mrusurcomdecl,
     mrusurcomcode,
     mrusurcomwrite,
     strng,
     LogName;

Program mrusurcom(logname);

var 
   LogName   : Text;
   infile    : STRING_string;
   if1,graphspas1,rulespas1,rulesenv1,codeenv1,codepas1:text;
   if2:pconnectionnode;
   if3:plostree;
   stree1:psnode;
   rulenaam:string;
   revisednew:string;
   stillrules:boolean;
function extracttree(plostree1:plostree;var stree1:psnode):boolean;
var result:boolean;
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
assigndebug(false);
inittable;
rulenaam:='all';
initcounter;
   reset(LogName);
   LogName_Init(LogName);
   LogName_Translate('inputfile',infile);
   infile := LogName_FindFile(infile);
   reset(if1, infile);
LogName_Translate('graphspas',infile);
rewrite(graphspas1,infile);
LogName_Translate('codepas',infile);
rewrite(codepas1,infile);
LogName_Translate('codeenv',infile);
rewrite(codeenv1,infile);
LogName_Translate('rulespas',infile);
rewrite(rulespas1,infile);
LogName_Translate('rulesenv',infile);
rewrite(rulesenv1,infile);
writeln(graphspas1,'EXPORT(',mrusurcomwrite_compname,'graphdef);');
writeln(graphspas1,'pragma C_include(''',mrusurcomwrite_compname,'graphdef.pf'');');
writeln(graphspas1,'pragma C_include(''',mrusurcomwrite_compname,'graph.pf'');');
writeln(graphspas1,'pragma C_include(''',mrusurcomwrite_compname,'langspec.pf'');');
writeln(graphspas1,'pragma C_include(''',mrusurcomwrite_compname,'decl.pf'');');
writeln(graphspas1,'PROGRAM ',MRUSURCOMwrite_compname,'GRAPHDEF;');
writeln(graphspas1,'WITH ',mrusurcomwrite_compname,'graph,');
writeln(graphspas1,mrusurcomwrite_compname,'decl,');
writeln(graphspas1,mrusurcomwrite_compname,'langspec;');

writeln(rulespas1,'EXPORT(',mrusurcomwrite_compname,'rules);');
writeln(rulespas1,'pragma C_include(''',mrusurcomwrite_compname,'rules.pf'');');
writeln(rulespas1,'pragma C_include(''',mrusurcomwrite_compname,'langspec.pf'');');
writeln(rulespas1,'pragma C_include(''',mrusurcomwrite_compname,'maket.pf'');');
writeln(rulespas1,'pragma C_include(''',mrusurcomwrite_compname,'decl.pf'');');
writeln(rulespas1,'pragma C_include(''lidomaint.pf'');');
IF MRUSURCOMwrite_compname='mrucom' THEN BEGIN
writeln(rulespas1,'pragma C_include(''lsdomaint.pf'');');
writeln(rulespas1,'pragma C_include(''lsstree.pf'');');
writeln(rulespas1,'pragma C_include(''maket.pf'');');
writeln(rulespas1,'pragma C_include(''lsconvrec.pf'');');
END;
writeln(rulespas1,'pragma C_include(''ldconvrec.pf'');');
writeln(rulespas1,'pragma C_include(''ldstrtotype.pf'');');
writeln(rulespas1,'pragma C_include(''ldcatsets.pf'');');
writeln(rulespas1,'pragma C_include(''strtokey.pf'');');
writeln(rulespas1,'pragma C_include(''string.pf'');');
writeln(rulespas1,'pragma C_include(''strings.pf'');');
writeln(rulespas1,'pragma C_include(''tstring.pf'');');
writeln(rulespas1,'PROGRAM ',MRUSURCOMwrite_compname,'RULES;');
writeln(rulespas1,'WITH ',mrusurcomwrite_compname,'maket,');
writeln(rulespas1,mrusurcomwrite_compname,'decl,');
IF MRUSURCOMwrite_compname='mrucom' THEN
writeln(rulespas1, 'lsdomaint,lsstree,lsconvrec,maket,');
writeln(rulespas1,mrusurcomwrite_compname,
 'langspec,lidomaint,ldstrtotype,');
writeln(rulespas1,
 'ldconvrec,ldcatsets,strtokey,strng,tstring;');

writeln(rulespas1,'VAR top: ',MRUSURCOMwrite_compname,'DECL_psnode;');
MRUSURCOMWRITE_tables(rulespas1);

writeln(rulesenv1,'pragma C_include(''',mrusurcomwrite_compname,'decl.pf'');');
writeln(rulesenv1,'pragma C_include(''',mrusurcomwrite_compname,'rules.pf'');');
writeln(rulesenv1,'PACKAGE ',MRUSURCOMwrite_compname,'RULES;');
writeln(rulesenv1,'WITH ',mrusurcomwrite_compname,'decl;');

writeln(codepas1,'EXPORT(',mrusurcomwrite_compname,'code);');
writeln(codepas1,'pragma C_include(''',mrusurcomwrite_compname,'code.pf'');');
writeln(codepas1,'pragma C_include(''',mrusurcomwrite_compname,'decl.pf'');');
writeln(codepas1,'pragma C_include(''',mrusurcomwrite_compname,'langspec.pf'');');IF MRUSURCOMwrite_compname='tracom' THEN
writeln(codepas1,'pragma C_include(''liilrules.pf'');');
writeln(codepas1,'pragma C_include(''ldtypetostr.pf'');');
writeln(codepas1,'pragma C_include(''lduniquerels.pf'');');
writeln(codepas1,'pragma C_include(''ldmrules.pf'');');
writeln(codepas1,'pragma C_include(''files.pf'');');
writeln(codepas1,'pragma C_include(''tfiles.pf'');');
writeln(codepas1,'pragma C_include(''tstring.pf'');');
writeln(codepas1,'pragma C_include(''str.pf'');');
writeln(codepas1,'pragma C_include(''string.pf'');');
writeln(codepas1,'pragma C_include(''strings.pf'');');
writeln(codepas1,'pragma C_include(''lidomaint.pf'');');
writeln(codepas1,'pragma C_include(''mem.pf'');');
writeln(codepas1,'pragma C_include(''tldstrtostr.pf'');');
writeln(codepas1,'pragma C_include(''ldconvrec.pf'');');
writeln(codepas1,'pragma C_include(''tldconvrec.pf'');');
writeln(codepas1,'pragma C_include(''ldstrtotype.pf'');');
writeln(codepas1,'pragma C_include(''ldcatsets.pf'');');
writeln(codepas1,'PROGRAM ',MRUSURCOMwrite_compname,'CODE;');
writeln(codepas1,'WITH ',mrusurcomwrite_compname,'langspec,');
IF MRUSURCOMwrite_compname='tracom' THEN 
writeln(codepas1,'liilrules,');
writeln(codepas1,mrusurcomwrite_compname,
'decl,ldtypetostr,lduniquerels,ldmrules,files,tfiles,tstring,lidomaint,str,mem,');
writeln(codepas1,'tldstrtostr,ldconvrec,tldconvrec,ldstrtotype,ldcatsets,strng;');
write(codepas1,'VAR ');
MRUSURCOMWRITE_inhsynatts(codepas1);

writeln(codeenv1,'pragma C_include(''tstring.pf'');');
writeln(codeenv1,'pragma C_include(''',mrusurcomwrite_compname,'decl.pf'');');
writeln(codeenv1,'pragma C_include(''',mrusurcomwrite_compname,'langspec.pf'');');
writeln(codeenv1,'PACKAGE ',MRUSURCOMwrite_compname,'CODE;');
writeln(codeenv1,'WITH ',mrusurcomwrite_compname,'decl,');
writeln(codeenv1,mrusurcomwrite_compname,'langspec,tstring;');
stillrules:=true;
while stillrules do
   	begin
   	if2:=nil;
        STRING_constantempty(rulenaam);
   	scanner(if1,rulenaam,if2,rulespas1,codeenv1,codepas1);
   					{rulenaam gets a value}
   	if STRING_length(rulenaam) <> 0 then 
           begin
           write('GENSUR... ',rulenaam,'  ');
           surfparser(if2,if3);
           stillrules:=extracttree(if3,stree1);
           end
   	else 
           begin
           writeln('GENSUR... FINISHED');
           stillrules:=false
           end;
   	if stillrules then
             writerulecode(rulenaam,stree1,graphspas1)
   	end;
close(if1);
writeswitches(graphspas1,rulespas1,rulesenv1);
writeln(rulesenv1,'END;');
writeln(codeenv1,'END;');
end.
