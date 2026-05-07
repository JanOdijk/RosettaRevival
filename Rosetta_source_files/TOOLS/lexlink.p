
(*MPI:::===================================================================*
 *
 *  Rosetta Project
 *
 *  Module Title    : lexlink
 *  Creation date   :  3-NOV-1986
 *  Author          : RENE LEERMAKERS
 *
 *  Copyright (c) 1986, by Nederlandse Philips Bedrijven BV.
 *
 *  Remarks         : This program links the results of the lextree compilations
 *                    It read in the files LANGUAGE:comlexrules1.env,
 *                    LANGUAGE:comlexrules2.env, LANGUAGE:comlexrules3.env
 *                    (if1,if2,if3), in which the lextree compiler wrote some 
 *                    information as pascal comments. The result of the linker
 *                    are the files cof1 and decof1, which are the VMS
 *                    files LANGUAGE:ANLEXIF.PAS, LANGUAGE:GENLEXIF.PAS,
 *                    respectively.
 *
 *EMP:::===================================================================*)


(*=========================================================================*
 *  Imported modules
 *=========================================================================*)
pragma C_include('files.pf');
pragma C_include('str.pf');
pragma C_include('string.pf');
pragma C_include('ldstrtotype.pf');
pragma C_include('lidomaint.pf');
pragma C_include('lidomaint.pf');
pragma C_include('logname.pf');
WITH files,str,strng,ldstrtotype,lidomaint,logname;

PROGRAM lexlink(lognames);
TYPE
    cattype = record
               old:INTEGER;
               len:FILES_iorange;
               str:STR_string;
              end;
    ploscat = ^loscat;
    loscat = record
   		arg:cattype;
   		next:ploscat
   	     end;
    setofcats = record
   			first,last:ploscat;
   		end;
    pentry = ^entry;
    entry = record
 		rulename:STR_string;
                length:integer;
                outputcat:cattype;
                numofargs:integer;
                inputcats:setofcats
            end;
    plosentry = ^losentry;
    losentry = record
    			arg:pentry;
                        next:plosentry
               end;
    setofentries = record
   			first,last:plosentry
   		   end;
VAR if1,if2,if3,cof1,decof1:FILES_text;
    lognames:text;    ch:CHAR;
    entry1:pentry;
    ruleinfotable:setofentries;
    maxrnr,maxargs:integer;
procedure initsetofentries(var S1:setofentries);
begin
S1.first:=nil;S1.last:=nil
end;
function stillentries(S1:setofentries):boolean;
begin
if S1.first<>nil then stillentries:=true
else stillentries:=false
end;
procedure appendentry(entry1:pentry;VAR S1:setofentries);
var p:plosentry;
begin
new(p);
p^.arg:=entry1;
p^.next:=nil;
if S1.first=nil then
   begin
   S1.first:=p;
   S1.last:=p
   end
else
   begin
   S1.last^.next:=p;
   S1.last:=p
   end
end;
procedure takeentry(VAR entry1:pentry;VAR S1:setofentries);
begin
if S1.first=nil then entry1:=nil
else
   begin
   entry1:=S1.first^.arg;
   if S1.first=S1.last then
   	begin
   	S1.first:=nil;S1.last:=nil
   	end
   else S1.first:=S1.first^.next
   end
end;
procedure initsetofcats(var S1:setofcats);
begin
S1.first:=nil;S1.last:=nil
end;
function stillcats(S1:setofcats):boolean;
begin
if S1.first<>nil then stillcats:=true
else stillcats:=false
end;
procedure appendcat(cat1:cattype;VAR S1:setofcats);
var p:ploscat;
begin
new(p);
p^.arg:=cat1;
p^.next:=nil;
if S1.first=nil then
   begin
   S1.first:=p;
   S1.last:=p
   end
else
   begin
   S1.last^.next:=p;
   S1.last:=p
   end
end;
procedure takecat(VAR cat1:cattype;VAR S1:setofcats);
begin
if S1.first=nil then cat1.old:=0
else
   begin
   cat1:=S1.first^.arg;
   if S1.first=S1.last then
   	begin
   	S1.first:=nil;S1.last:=nil
   	end
   else S1.first:=S1.first^.next
   end
end;
PROCEDURE writelexif;
VAR ch:CHAR;
    cat1:cattype;
    cats:setofcats;
    i,j:integer;
    table:setofentries;
 FUNCTION findinfo(VAR if1:FILES_text):BOOLEAN;
 VAR done:BOOLEAN;
    ch:CHAR;
 BEGIN
 done:=true;
 ch:=' ';
 WHILE (ch<>'*') and done DO
  BEGIN
  FILES_readchar(if1,ch);
  done:=FILES_done
  END;
 findinfo:=done;
 FILES_skipline(if1);
 END;

 PROCEDURE collectlexif(VAR if1:FILES_text);
 VAR rulename:STR_string;
     i,numofargs:integer;
     cat:cattype;
     int:FILES_IOrange;
     entry1:pentry;
     Icat:LIDOMAINT_syntcat;
     iolen:FILES_iorange;
 BEGIN
 FILES_readstr(if1,rulename,int);
 FILES_skipline(if1);
 numofargs:=0;
 FILES_readinteger(if1,numofargs);
 if numofargs>maxargs then maxargs:=numofargs;
 FILES_skipline(if1);
 new(entry1);
 entry1^.rulename:=rulename;
 entry1^.length:=int;
 entry1^.numofargs:=numofargs;
 initsetofcats(entry1^.inputcats);
 i:=0;
 while i<>numofargs do
   begin
   i:=i+1;
   FILES_readstr(if1,cat.str,cat.len);
   FILES_skipline(if1);
   LDSTRTOTYPE_cat(cat.str,cat.len,Icat);
   cat.old:=ord(Icat);
   appendcat(cat,entry1^.inputcats)
   end;
 FILES_readstr(if1,cat.str,cat.len);
 FILES_skipline(if1);
 LDSTRTOTYPE_cat(cat.str,cat.len,Icat);
 cat.old:=ord(Icat);
 entry1^.outputcat:=cat;
 maxrnr:=maxrnr+1;
 appendentry(entry1,ruleinfotable)
 END;

BEGIN{writelexif}
initsetofentries(ruleinfotable);
maxrnr:=0;
maxargs:=0;
WHILE findinfo(if1) DO
   BEGIN
   collectlexif(if1)
   END;
FILES_skipline(if2);
WHILE findinfo(if2) DO
   BEGIN
   collectlexif(if2)
   END;
FILES_skipline(if3);
WHILE findinfo(if3) DO
   BEGIN
   collectlexif(if3)
   END;
FILES_writestr(cof1,'CONST',FILES_maxIO,0,left);
FILES_writeline(cof1,true);
FILES_writestr(cof1,'     maxrnr=',FILES_maxIO,0,left);
FILES_writeinteger(cof1,maxrnr,0,left);
FILES_writechar(cof1,';');
FILES_writeline(cof1,true);
FILES_writestr(cof1,'     maxargs=',FILES_maxIO,0,left);
FILES_writeinteger(cof1,maxargs,0,left);
FILES_writechar(cof1,';');
FILES_writeline(cof1,true);
FILES_writestr(cof1,'VAR licat:LIDOMAINT_syntcat;lscat:LSDOMAINT_syntcat;',FILES_maxIO,0,left);
FILES_writeline(cof1,true);
FILES_writestr(cof1,
      '   rulearray:ARRAY[1..maxrnr] OF ANLEXIF_ruleinfo;',FILES_maxIO,0,left);
FILES_writeline(cof1,true);
FILES_writestr(cof1,
     '   catarray:ARRAY[LIDOMAINT_syntcat] OF ANLEXIF_setofrules;'
                                                         ,FILES_maxIO,0,left);
FILES_writeline(cof1,true);
FILES_writeline(cof1,true);
FILES_writestr(decof1,'CONST',FILES_maxIO,0,left);
FILES_writeline(decof1,true);
FILES_writestr(decof1,'     maxrnr=',FILES_maxIO,0,left);
FILES_writeinteger(decof1,maxrnr,0,left);
FILES_writechar(decof1,';');
FILES_writeline(decof1,true);
FILES_writestr(decof1,'VAR licat:LIDOMAINT_syntcat;lscat:LSDOMAINT_syntcat;',FILES_maxIO,0,left);
FILES_writeline(decof1,true);
FILES_writestr(decof1,
   '   catarray:ARRAY[LIDOMAINT_syntcat] OF GENLEXIF_setofrules;'
                                                          ,FILES_maxIO,0,left);
FILES_writeline(decof1,true);
FILES_writeline(decof1,true);

FILES_writestr(cof1,'PROCEDURE MakePlosrule(VAR p:ANLEXIF_plosrule);',
   							FILES_maxIO,0,left);
FILES_writeline(cof1,true);
FILES_writestr(cof1,'begin',FILES_maxIO,0,left);
FILES_writeline(cof1,true);
FILES_writestr(cof1,'MEM_NewDefault(LoopHoles.SIZEof(ANLEXIF_losrule),LoopHoles.Retype(p,Mem_Ptr));',FILES_maxIO,0,left);
FILES_writeline(cof1,true);
FILES_writestr(cof1,'end;',FILES_maxIO,0,left);
FILES_writeline(cof1,true);

{ABSTRACT DATA TYPE SETOFRULES:}
FILES_writestr(cof1,'PROCEDURE initsetofrules(VAR S1:ANLEXIF_setofrules);',
   							FILES_maxIO,0,left);
FILES_writeline(cof1,true);
FILES_writestr(cof1,'begin',FILES_maxIO,0,left);
FILES_writeline(cof1,true);
FILES_writestr(cof1,'S1.first:=nil;S1.last:=nil',FILES_maxIO,0,left);
FILES_writeline(cof1,true);
FILES_writestr(cof1,'end;',FILES_maxIO,0,left);
FILES_writeline(cof1,true);
FILES_writestr(cof1,
' FUNCTION ANLEXIF_stillrules(setofrules:ANLEXIF_setofrules):BOOLEAN;'
                                                 ,FILES_maxIO,0,left);
FILES_writeline(cof1,true);
FILES_writestr(cof1,'begin',FILES_maxIO,0,left);
FILES_writeline(cof1,true);
FILES_writestr(cof1,
 'if setofrules.first<>nil then ANLEXIF_stillrules:=true',FILES_maxIO,0,left);
FILES_writeline(cof1,true);
FILES_writestr(cof1,'else ANLEXIF_stillrules:=false',FILES_maxIO,0,left);
FILES_writeline(cof1,true);
FILES_writestr(cof1,'end;',FILES_maxIO,0,left);
FILES_writeline(cof1,true);
FILES_writestr(cof1,
'PROCEDURE appendrule(rule:ANLEXIF_lexruletype;VAR S1:ANLEXIF_setofrules);'
   						,FILES_maxIO,0,left);
FILES_writeline(cof1,true);
FILES_writestr(cof1,'VAR p:ANLEXIF_plosrule;',FILES_maxIO,0,left);
FILES_writeline(cof1,true);
FILES_writestr(cof1,'begin',FILES_maxIO,0,left);
FILES_writeline(cof1,true);
FILES_writestr(cof1,'makeplosrule(p);',FILES_maxIO,0,left);
FILES_writeline(cof1,true);
FILES_writestr(cof1,'p^.arg:=rule;',FILES_maxIO,0,left);
FILES_writeline(cof1,true);
FILES_writestr(cof1,'p^.next:=nil;',FILES_maxIO,0,left);
FILES_writeline(cof1,true);
FILES_writestr(cof1,'if S1.first=nil then',FILES_maxIO,0,left);
FILES_writeline(cof1,true);
FILES_writestr(cof1,'  begin',FILES_maxIO,0,left);
FILES_writeline(cof1,true);
FILES_writestr(cof1,'  S1.first:=p;',FILES_maxIO,0,left);
FILES_writeline(cof1,true);
FILES_writestr(cof1,'  S1.last:=p',FILES_maxIO,0,left);
FILES_writeline(cof1,true);
FILES_writestr(cof1,'  end',FILES_maxIO,0,left);
FILES_writeline(cof1,true);
FILES_writestr(cof1,'else',FILES_maxIO,0,left);
FILES_writeline(cof1,true);
FILES_writestr(cof1,'  begin',FILES_maxIO,0,left);
FILES_writeline(cof1,true);
FILES_writestr(cof1,'  S1.last^.next:=p;',FILES_maxIO,0,left);
FILES_writeline(cof1,true);
FILES_writestr(cof1,'  S1.last:=p',FILES_maxIO,0,left);
FILES_writeline(cof1,true);
FILES_writestr(cof1,'  end',FILES_maxIO,0,left);
FILES_writeline(cof1,true);
FILES_writestr(cof1,'end;',FILES_maxIO,0,left);
FILES_writeline(cof1,true);
FILES_writestr(cof1,
' PROCEDURE ANLEXIF_takerule(VAR rule:ANLEXIF_lexruletype;'
   						,FILES_maxIO,0,left);
FILES_writeline(cof1,true);
FILES_writestr(cof1,
'                                       VAR setofRules:ANLEXIF_setofRules);'
 						,FILES_maxIO,0,left);
FILES_writeline(cof1,true);
FILES_writestr(cof1,'begin',FILES_maxIO,0,left);
FILES_writeline(cof1,true);
FILES_writestr(cof1,'if setofrules.first=nil then rule:=0',FILES_maxIO,0,left);
FILES_writeline(cof1,true);
FILES_writestr(cof1,'else',FILES_maxIO,0,left);
FILES_writeline(cof1,true);
FILES_writestr(cof1,'  begin',FILES_maxIO,0,left);
FILES_writeline(cof1,true);
FILES_writestr(cof1,'  rule:=setofrules.first^.arg;',FILES_maxIO,0,left);
FILES_writeline(cof1,true);
FILES_writestr(cof1,'  if setofrules.first=setofrules.last then'
   							,FILES_maxIO,0,left);
FILES_writeline(cof1,true);
FILES_writestr(cof1,'    begin',FILES_maxIO,0,left);
FILES_writeline(cof1,true);
FILES_writestr(cof1,'    setofrules.first:=nil;setofrules.last:=nil'
   						,FILES_maxIO,0,left);
FILES_writeline(cof1,true);
FILES_writestr(cof1,'    end',FILES_maxIO,0,left);
FILES_writeline(cof1,true);
FILES_writestr(cof1,'  else setofrules.first:=setofrules.first^.next'
   						,FILES_maxIO,0,left);
FILES_writeline(cof1,true);
FILES_writestr(cof1,'  end',FILES_maxIO,0,left);
FILES_writeline(cof1,true);
FILES_writestr(cof1,'end;',FILES_maxIO,0,left);
FILES_writeline(cof1,true);

FILES_writestr(decof1,'PROCEDURE MakePlosrule(VAR p:GENLEXIF_plosrule);',
   							FILES_maxIO,0,left);
FILES_writeline(decof1,true);
FILES_writestr(decof1,'begin',FILES_maxIO,0,left);
FILES_writeline(decof1,true);
FILES_writestr(decof1,'MEM_NewDefault(LoopHoles.SIZEof(GENLEXIF_losrule),LoopHoles.Retype(p,Mem_Ptr));',FILES_maxIO,0,left);
FILES_writeline(decof1,true);
FILES_writestr(decof1,'end;',FILES_maxIO,0,left);
FILES_writeline(decof1,true);

FILES_writestr(decof1,'PROCEDURE initsetofrules(VAR S1:GENLEXIF_setofrules);',
   							FILES_maxIO,0,left);
FILES_writeline(decof1,true);
FILES_writestr(decof1,'begin',FILES_maxIO,0,left);
FILES_writeline(decof1,true);
FILES_writestr(decof1,'S1.first:=nil;S1.last:=nil',FILES_maxIO,0,left);
FILES_writeline(decof1,true);
FILES_writestr(decof1,'end;',FILES_maxIO,0,left);
FILES_writeline(decof1,true);
FILES_writestr(decof1,
' FUNCTION GENLEXIF_stillrules(setofrules:GENLEXIF_setofrules):BOOLEAN;'
                                                 ,FILES_maxIO,0,left);
FILES_writeline(decof1,true);
FILES_writestr(decof1,'begin',FILES_maxIO,0,left);
FILES_writeline(decof1,true);
FILES_writestr(decof1,
 'if setofrules.first<>nil then GENLEXIF_stillrules:=true',FILES_maxIO,0,left);
FILES_writeline(decof1,true);
FILES_writestr(decof1,'else GENLEXIF_stillrules:=false',FILES_maxIO,0,left);
FILES_writeline(decof1,true);
FILES_writestr(decof1,'end;',FILES_maxIO,0,left);
FILES_writeline(decof1,true);
FILES_writestr(decof1,
'PROCEDURE appendrule(rule:GENLEXIF_lexruletype;VAR S1:GENLEXIF_setofrules);'
   						,FILES_maxIO,0,left);
FILES_writeline(decof1,true);
FILES_writestr(decof1,'VAR p:GENLEXIF_plosrule;',FILES_maxIO,0,left);
FILES_writeline(decof1,true);
FILES_writestr(decof1,'begin',FILES_maxIO,0,left);
FILES_writeline(decof1,true);
FILES_writestr(decof1,'makeplosrule(p);',FILES_maxIO,0,left);
FILES_writeline(decof1,true);
FILES_writestr(decof1,'p^.arg:=rule;',FILES_maxIO,0,left);
FILES_writeline(decof1,true);
FILES_writestr(decof1,'p^.next:=nil;',FILES_maxIO,0,left);
FILES_writeline(decof1,true);
FILES_writestr(decof1,'if S1.first=nil then',FILES_maxIO,0,left);
FILES_writeline(decof1,true);
FILES_writestr(decof1,'  begin',FILES_maxIO,0,left);
FILES_writeline(decof1,true);
FILES_writestr(decof1,'  S1.first:=p;',FILES_maxIO,0,left);
FILES_writeline(decof1,true);
FILES_writestr(decof1,'  S1.last:=p',FILES_maxIO,0,left);
FILES_writeline(decof1,true);
FILES_writestr(decof1,'  end',FILES_maxIO,0,left);
FILES_writeline(decof1,true);
FILES_writestr(decof1,'else',FILES_maxIO,0,left);
FILES_writeline(decof1,true);
FILES_writestr(decof1,'  begin',FILES_maxIO,0,left);
FILES_writeline(decof1,true);
FILES_writestr(decof1,'  S1.last^.next:=p;',FILES_maxIO,0,left);
FILES_writeline(decof1,true);
FILES_writestr(decof1,'  S1.last:=p',FILES_maxIO,0,left);
FILES_writeline(decof1,true);
FILES_writestr(decof1,'  end',FILES_maxIO,0,left);
FILES_writeline(decof1,true);
FILES_writestr(decof1,'end;',FILES_maxIO,0,left);
FILES_writeline(decof1,true);
FILES_writestr(decof1,
' PROCEDURE GENLEXIF_takerule(VAR rule:GENLEXIF_lexruletype;'
   						,FILES_maxIO,0,left);
FILES_writeline(decof1,true);
FILES_writestr(decof1,
'                                       VAR setofRules:GENLEXIF_setofRules);'
 						,FILES_maxIO,0,left);
FILES_writeline(decof1,true);
FILES_writestr(decof1,'begin',FILES_maxIO,0,left);
FILES_writeline(decof1,true);
FILES_writestr(decof1,'if setofrules.first=nil then rule:=0',FILES_maxIO,0,left);
FILES_writeline(decof1,true);
FILES_writestr(decof1,'else',FILES_maxIO,0,left);
FILES_writeline(decof1,true);
FILES_writestr(decof1,'  begin',FILES_maxIO,0,left);
FILES_writeline(decof1,true);
FILES_writestr(decof1,'  rule:=setofrules.first^.arg;',FILES_maxIO,0,left);
FILES_writeline(decof1,true);
FILES_writestr(decof1,'  if setofrules.first=setofrules.last then'
   							,FILES_maxIO,0,left);
FILES_writeline(decof1,true);
FILES_writestr(decof1,'    begin',FILES_maxIO,0,left);
FILES_writeline(decof1,true);
FILES_writestr(decof1,'    setofrules.first:=nil;setofrules.last:=nil'
   						,FILES_maxIO,0,left);
FILES_writeline(decof1,true);
FILES_writestr(decof1,'    end',FILES_maxIO,0,left);
FILES_writeline(decof1,true);
FILES_writestr(decof1,'  else setofrules.first:=setofrules.first^.next'
   						,FILES_maxIO,0,left);
FILES_writeline(decof1,true);
FILES_writestr(decof1,'  end',FILES_maxIO,0,left);
FILES_writeline(decof1,true);
FILES_writestr(decof1,'end;',FILES_maxIO,0,left);
FILES_writeline(decof1,true);

{LEXRULE DEPENDENT PROCEDURES:}
FILES_writestr(cof1,
       'FUNCTION ANLEXIF_maxlexrulenr:INTEGER;',FILES_maxIO,0,left);
FILES_writeline(cof1,true);
FILES_writestr(cof1,'BEGIN',FILES_maxIO,0,left);
FILES_writeline(cof1,true);
FILES_writestr(cof1,'ANLEXIF_maxlexrulenr:=maxrnr',FILES_maxIO,0,left);
FILES_writeline(cof1,true);
FILES_writestr(cof1,'END;',FILES_maxIO,0,left);
FILES_writeline(cof1,true);
FILES_writestr(cof1,
       'FUNCTION ANLEXIF_maxargs:INTEGER;',FILES_maxIO,0,left);
FILES_writeline(cof1,true);
FILES_writestr(cof1,'BEGIN',FILES_maxIO,0,left);
FILES_writeline(cof1,true);
FILES_writestr(cof1,'ANLEXIF_maxargs:=maxargs',FILES_maxIO,0,left);
FILES_writeline(cof1,true);
FILES_writestr(cof1,'END;',FILES_maxIO,0,left);
FILES_writeline(cof1,true);
FILES_writestr(decof1,
       'FUNCTION GENLEXIF_maxlexrulenr:INTEGER;',FILES_maxIO,0,left);
FILES_writeline(decof1,true);
FILES_writestr(decof1,'BEGIN',FILES_maxIO,0,left);
FILES_writeline(decof1,true);
FILES_writestr(decof1,'GENLEXIF_maxlexrulenr:=maxrnr',FILES_maxIO,0,left);
FILES_writeline(decof1,true);
FILES_writestr(decof1,'END;',FILES_maxIO,0,left);
FILES_writeline(decof1,true);
FILES_writestr(cof1,' PROCEDURE ANLEXIF_init;',FILES_maxIO,0,left);
FILES_writeline(cof1,true);
FILES_writestr(cof1,'BEGIN',FILES_maxIO,0,left);
FILES_writeline(cof1,true);
table:=ruleinfotable;
i:=0;
while stillentries(table) do
   begin
   i:=i+1;
   takeentry(entry1,table);
   FILES_writestr(cof1,'rulearray[',FILES_maxIO,0,left);
   FILES_writeinteger(cof1,i,0,left);
   FILES_writestr(cof1,'].args:=',FILES_maxIO,0,left);
   FILES_writeinteger(cof1,entry1^.numofargs,0,left);
   FILES_writechar(cof1,';');
   FILES_writeline(cof1,true);
   j:=0;
   cats:=entry1^.inputcats;
   while stillcats(cats) do
   	begin
        j:=j+1;
        takecat(cat1,cats);
        FILES_writestr(cof1,'lscat:=',FILES_maxIO,0,left);
        FILES_writestr(cof1,cat1.str,cat1.len,cat1.len,left);
        FILES_writestr(cof1,';licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);',FILES_maxIO,0,left);
        FILES_writestr(cof1,'rulearray[',FILES_maxIO,0,left);
        FILES_writeinteger(cof1,i,0,left);
        FILES_writestr(cof1,'].cat[',FILES_maxIO,0,left);
        FILES_writeinteger(cof1,j,0,left);
        FILES_writestr(cof1,']:=licat;',FILES_maxIO,0,left);
        FILES_writechar(cof1,';');
        FILES_writeline(cof1,true)
        end;
   end;
i:=0;
while i<>LIDOMAINT_maxrelcat do
   begin
   i:=i+1;
   FILES_writestr(cof1,'initsetofrules(catarray[licat',FILES_maxIO,0,left);
   FILES_writeinteger(cof1,i,0,left);
   FILES_writestr(cof1,']);',FILES_maxIO,0,left);
   FILES_writeline(cof1,true);
   end;
i:=0;
while i<>LIDOMAINT_maxrelcat do
   begin
   i:=i+1;
   table:=ruleinfotable;
   j:=0;
   while stillentries(table) do
      begin
      j:=j+1;
      takeentry(entry1,table);
      cat1:=entry1^.inputcats.first^.arg;
      if cat1.old=i then
        begin
        FILES_writestr(cof1,'lscat:=',FILES_maxIO,0,left);
        FILES_writestr(cof1,cat1.str,cat1.len,cat1.len,left);
        FILES_writestr(cof1,';licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);',FILES_maxIO,0,left);
   	FILES_writestr(cof1,'appendrule(',FILES_maxIO,0,left);
        FILES_writeinteger(cof1,j,0,left);
        FILES_writestr(cof1,',catarray[licat]);',FILES_maxIO,0,left);
        FILES_writeline(cof1,true)
        end
      end
   end;
FILES_writestr(cof1,'END;',FILES_maxIO,0,left);
FILES_writeline(cof1,true);
FILES_writestr(decof1,' PROCEDURE GENLEXIF_init;',FILES_maxIO,0,left);
FILES_writeline(decof1,true);
FILES_writestr(decof1,'BEGIN',FILES_maxIO,0,left);
FILES_writeline(decof1,true);
i:=0;
while i<>LIDOMAINT_maxrelcat do
   begin
   i:=i+1;
   FILES_writestr(decof1,'initsetofrules(catarray[licat',FILES_maxIO,0,left);
   FILES_writeinteger(decof1,i,0,left);
   FILES_writestr(decof1,']);',FILES_maxIO,0,left);
   FILES_writeline(decof1,true);
   end;
i:=0;
while i<>LIDOMAINT_maxrelcat do
   begin
   i:=i+1;
   table:=ruleinfotable;
   j:=0;
   while stillentries(table) do
      begin
      j:=j+1;
      takeentry(entry1,table);
      cat1:=entry1^.outputcat;
      if cat1.old=i then
        begin
        FILES_writestr(decof1,'lscat:=',FILES_maxIO,0,left);
        FILES_writestr(decof1,cat1.str,cat1.len,cat1.len,left);
        FILES_writestr(decof1,';licat:=LoopHoles.Retype(lscat,LIDOMAINT_syntcat);',FILES_maxIO,0,left);
   	FILES_writestr(decof1,'appendrule(',FILES_maxIO,0,left);
        FILES_writeinteger(decof1,j,0,left);
        FILES_writestr(decof1,',catarray[licat]);',FILES_maxIO,0,left);
        FILES_writeline(decof1,true)
        end
      end
   end;
FILES_writestr(decof1,'END;',FILES_maxIO,0,left);
FILES_writeline(decof1,true);
FILES_writestr(cof1,
' FUNCTION ANLEXIF_info(L:ANLEXIF_lexruletype)',FILES_maxIO,0,left);
FILES_writeline(cof1,true);
FILES_writestr(cof1,':ANLEXIF_ruleinfo;',FILES_maxIO,0,left);
FILES_writeline(cof1,true);
FILES_writestr(cof1,'BEGIN',FILES_maxIO,0,left);
FILES_writeline(cof1,true);
FILES_writestr(cof1,'ANLEXIF_info:=rulearray[L]',FILES_maxIO,0,left);
FILES_writeline(cof1,true);
FILES_writestr(cof1,'END;',FILES_maxIO,0,left);
FILES_writeline(cof1,true);
FILES_writestr(cof1,
' FUNCTION ANLEXIF_switch(t:LISTREE_pstree)',FILES_maxIO,0,left);
FILES_writeline(cof1,true);
FILES_writestr(cof1,':ANLEXIF_setofRules;',FILES_maxIO,0,left);
FILES_writeline(cof1,true);
FILES_writestr(cof1,'BEGIN',FILES_maxIO,0,left);
FILES_writeline(cof1,true);
FILES_writestr(cof1,'ANLEXIF_switch:=catarray[t^.cat]',FILES_maxIO,0,left);
FILES_writeline(cof1,true);
FILES_writestr(cof1,'END;',FILES_maxIO,0,left);
FILES_writeline(cof1,true);
FILES_writestr(decof1,
' FUNCTION GENLEXIF_switch(t:LISTREE_pstree)',FILES_maxIO,0,left);
FILES_writeline(decof1,true);
FILES_writestr(decof1,':GENLEXIF_setofRules;',FILES_maxIO,0,left);
FILES_writeline(decof1,true);
FILES_writestr(decof1,'BEGIN',FILES_maxIO,0,left);
FILES_writeline(decof1,true);
FILES_writestr(decof1,'GENLEXIF_switch:=catarray[t^.cat]',FILES_maxIO,0,left);
FILES_writeline(decof1,true);
FILES_writestr(decof1,'END;',FILES_maxIO,0,left);
FILES_writeline(decof1,true);
FILES_writestr(cof1,
        ' FUNCTION ANLEXIF_lexrule(L:ANLEXIF_lexruletype;',
   							FILES_maxIO,0,left);
FILES_writeline(cof1,true);
FILES_writestr(cof1,
         '                                    tuple:LISTREE_tupleofstrees)',
                                                        FILES_maxIO,0,left);
FILES_writeline(cof1,true);
FILES_writestr(cof1,
         '                : LISTREE_setofstrees;',FILES_maxIO,0,left);
FILES_writeline(cof1,true);
FILES_writestr(cof1,'VAR',FILES_maxIO,0,left);
FILES_writeline(cof1,true);
FILES_writestr(cof1,'   s1,s2,s3,s4,s5:LISTREE_pstree;',FILES_maxIO,0,left);
FILES_writeline(cof1,true);
FILES_writestr(cof1,'BEGIN',FILES_maxIO,0,left);
FILES_writeline(cof1,true);
FILES_writestr(cof1,'CASE L of',FILES_maxIO,0,left);
FILES_writeline(cof1,true);
i:=0;
table:=ruleinfotable;
while stillentries(table) do
   begin
   i:=i+1;
   FILES_writeinteger(cof1,i,0,left);
   FILES_writestr(cof1,': BEGIN',FILES_maxIO,0,left);
   FILES_writeline(cof1,true);
   takeentry(entry1,table);
   j:=0;
   while j<>entry1^.numofargs do
     begin
     j:=j+1;
     FILES_writestr(cof1,'    LISTREE_extractfromtuple(s',FILES_maxIO,0,left);
     FILES_writeinteger(cof1,j,0,left);
     FILES_writestr(cof1,',tuple);',FILES_maxIO,0,left);
     FILES_writeline(cof1,true)
     end;
   FILES_writestr(cof1,'    ANLEXIF_lexrule:= com',FILES_maxIO,0,left);
   FILES_writestr(cof1,entry1^.rulename,entry1^.length,entry1^.length,left);
   FILES_writestr(cof1,'(s',FILES_maxIO,0,left);
   j:=1;
   FILES_writeinteger(cof1,j,0,left);
   while j<>entry1^.numofargs do
     begin
     j:=j+1;
     FILES_writestr(cof1,',s',FILES_maxIO,0,left);
     FILES_writeinteger(cof1,j,0,left)
     end;
   FILES_writechar(cof1,')');
   FILES_writeline(cof1,true);
   FILES_writestr(cof1,'    END;',FILES_maxIO,0,left);
   FILES_writeline(cof1,true)
   end;
FILES_writestr(cof1,'END;',FILES_maxIO,0,left);
FILES_writeline(cof1,true);
FILES_writestr(cof1,'END;',FILES_maxIO,0,left);
FILES_writeline(cof1,true);
FILES_writestr(decof1,
        ' FUNCTION GENLEXIF_lexrule(L:GENLEXIF_lexruletype;',
   							FILES_maxIO,0,left);
FILES_writeline(decof1,true);
FILES_writestr(decof1,
         '                                    t:LISTREE_pstree)',
                                                        FILES_maxIO,0,left);
FILES_writeline(decof1,true);
FILES_writestr(decof1,
         '                : LISTREE_setoftupleofstrees;',FILES_maxIO,0,left);
FILES_writeline(decof1,true);
FILES_writestr(decof1,'BEGIN',FILES_maxIO,0,left);
FILES_writeline(decof1,true);
FILES_writestr(decof1,'CASE L of',FILES_maxIO,0,left);
FILES_writeline(decof1,true);
i:=0;
table:=ruleinfotable;
while stillentries(table) do
   begin
   i:=i+1;
   FILES_writeinteger(decof1,i,0,left);
   takeentry(entry1,table);
   FILES_writestr(decof1,': GENLEXIF_lexrule:= dec',FILES_maxIO,0,left);
   FILES_writestr(decof1,entry1^.rulename,entry1^.length,entry1^.length,left);
   FILES_writestr(decof1,'(t);',FILES_maxIO,0,left);
   FILES_writeline(decof1,true)
   end;
FILES_writestr(decof1,'END;',FILES_maxIO,0,left);
FILES_writeline(decof1,true);
FILES_writestr(decof1,'END;',FILES_maxIO,0,left);
FILES_writeline(decof1,true)
END;
BEGIN
reset(lognames);
LOGNAME_init(lognames);
FILES_open(if1,'inputfile1',10,1);
FILES_open(if2,'inputfile2',10,1);
FILES_open(if3,'inputfile3',10,1);
FILES_open(cof1,'comfile',7,3);
FILES_open(decof1,'decomfile',9,3);
FILES_skipline(if1);
FILES_writestr(cof1,'EXPORT(anlexif);',FILES_maxIO,0,left);
FILES_writeline(cof1,true);
FILES_writestr(cof1,'pragma C_include(''anlexif.pf'');',FILES_maxIO,0,left);
FILES_writeline(cof1,true);
FILES_writestr(cof1,'pragma C_include(''lsdomaint.pf'');',FILES_maxIO,0,left);
FILES_writeline(cof1,true);
FILES_writestr(cof1,'pragma C_include(''listree.pf'');',FILES_maxIO,0,left);
FILES_writeline(cof1,true);
FILES_writestr(cof1,'pragma C_include(''lidomaint.pf'');',FILES_maxIO,0,left);
FILES_writeline(cof1,true);
FILES_writestr(cof1,'pragma C_include(''mem.pf'');',FILES_maxIO,0,left);
FILES_writeline(cof1,true);
FILES_writestr(cof1,'pragma C_include(''comlexrules1.pf'');',FILES_maxIO,0,left);
FILES_writeline(cof1,true);
FILES_writestr(cof1,'pragma C_include(''comlexrules2.pf'');',FILES_maxIO,0,left);
FILES_writeline(cof1,true);
FILES_writestr(cof1,'pragma C_include(''comlexrules3.pf'');',FILES_maxIO,0,left);
FILES_writeline(cof1,true);
FILES_writestr(cof1,'WITH anlexif;',FILES_maxIO,0,left);
FILES_writeline(cof1,true);

FILES_writestr(decof1,'EXPORT(genlexif);',FILES_maxIO,0,left);
FILES_writeline(decof1,true);
FILES_writestr(decof1,'pragma C_include(''genlexif.pf'');',FILES_maxIO,0,left);
FILES_writeline(decof1,true);
FILES_writestr(decof1,'pragma C_include(''lsdomaint.pf'');',FILES_maxIO,0,left);
FILES_writeline(decof1,true);
FILES_writestr(decof1,'pragma C_include(''listree.pf'');',FILES_maxIO,0,left);
FILES_writeline(decof1,true);
FILES_writestr(decof1,'pragma C_include(''lidomaint.pf'');',FILES_maxIO,0,left);
FILES_writeline(decof1,true);
FILES_writestr(decof1,'pragma C_include(''mem.pf'');',FILES_maxIO,0,left);
FILES_writeline(decof1,true);
FILES_writestr(decof1,'pragma C_include(''decomlexrules1.pf'');',FILES_maxIO,0,left);
FILES_writeline(decof1,true);
FILES_writestr(decof1,'pragma C_include(''decomlexrules2.pf'');',FILES_maxIO,0,left);
FILES_writeline(decof1,true);
FILES_writestr(decof1,'WITH genlexif;',FILES_maxIO,0,left);
FILES_writeline(decof1,true);
FILES_writestr(decof1,'pragma C_include(''decomlexrules3.pf'');',FILES_maxIO,0,left);
FILES_writeline(decof1,true);
FILES_writestr(cof1,'PROGRAM ANLEXIF;',FILES_maxIO,0,left);
FILES_writeline(cof1,true);
FILES_writestr(cof1,'WITH lsdomaint,listree,lidomaint,mem,',FILES_maxIO,0,left);
FILES_writeline(cof1,true);
FILES_writestr(cof1,'comlexrules1,comlexrules2,comlexrules3;',FILES_maxIO,0,left);
FILES_writeline(cof1,true);
FILES_writestr(decof1,'PROGRAM GENLEXIF;',FILES_maxIO,0,left);
FILES_writestr(decof1,'WITH lsdomaint,listree,lidomaint,mem,',FILES_maxIO,0,left);
FILES_writeline(decof1,true);
FILES_writestr(decof1,'decomlexrules1,decomlexrules2,decomlexrules3;',FILES_maxIO,0,left);
FILES_writeline(decof1,true);FILES_writeline(decof1,true);
writelexif;
FILES_close(if1);
FILES_close(if2);
FILES_close(if3);
FILES_close(cof1);
FILES_close(decof1)
END {lexlink}.
