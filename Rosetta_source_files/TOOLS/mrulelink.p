
(*MPI:::===================================================================*
 *
 *  Rosetta Project
 *
 *  Module Title    : mrulelink
 *  Creation date   :  23-SEP-1987
 *  Author          : RENE LEERMAKERS
 *
 *  Copyright (c) 1987, by Nederlandse Philips Bedrijven BV.
 *
 *  Remarks         : This program links the results of the lextree compilations
 *                    It read in the files LANGUAGE:commrules1.env,
 *                    LANGUAGE:commrules2.env,.., LANGUAGE:commrules120.env 
 *                    (ifi[1],ifi[2],..,ifi[120]), in which the mrule compiler wrote some 
 *                    information as pascal comments. The result of the linker
 *                    are the files cof1, decof1 and of2, of3, of4,of4a,of4b which are the
 *                    VMS files LANGUAGE:LDANMRULES.PAS, LANGUAGE:LDGENMRULES.PAS
 *                    LANGUAGE:LDMRULES.PAS, LANGUAGE:LSPARAMS.ENV and
 *                    LANGUAGE:LDSUBGRAMMARS.PAS, HELPSUBGRAMMARS.env,
 *                    HELPSUBGRAMMARS.pas,  respectively.
 *
 *EMP:::===================================================================*)

pragma C_include('files.pf');
pragma C_include('str.pf');
pragma C_include('string.pf');
pragma C_include('strings.pf');
pragma C_include('ldstrtotype.pf');
pragma C_include('ldstrtostr.pf');
pragma C_include('lidomaint.pf');
pragma C_include('logname.pf');
WITH files,str,strng,ldstrtotype,ldstrtostr,lidomaint,logname;

PROGRAM mrulelink(LogName);
CONST numofmrulefiles = 140;
TYPE
    ploscat = ^loscat;
    loscat = record
   		arg:integer;
   		next:ploscat
   	     end;
    setofcats = record
   			first,last:ploscat;
   		end;
    plosident = ^losident;
    losident = record
   		arg:STR_string;
   		next:plosident
   	     end;
    setofidents = record
   			first,last:plosident;
   		end;
    param = record
   		paramname:STR_string;
                paramlength:FILES_IOrange;
                typename:STR_string;
                typelength:FILES_IOrange;
            end;
    plosparam = ^losparam;
    losparam = record
                arg:param;
   		next:plosparam
   	     end;
    setofparams = record
   			first,last:plosparam;
   		end;
    subgram = record
   		subgramname:STR_string;
                namelength:FILES_IOrange;
                exportcats:setofcats;
                headcats:setofcats;
              end;
    plossubgram = ^lossubgram;
    lossubgram = record
                arg:subgram;
   		next:plossubgram
   	     end;
    setofsubgrams = record
   			first,last:plossubgram;
   		end;
    pentry = ^entry;
    entry = record
                params:setofparams;
 		rulename:STR_string;
                length:STR_range;
                outputcat:integer;
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
    ppair = ^pair;
    pair = record rulenr:INTEGER;
                  subgramnr:INTEGER;
            end;
    plospair = ^lospair;
    lospair = record
    			arg:ppair;
                        next:plospair
               end;
    setofpairs = record
   			first,last:plospair
   		   end;
    
VAR ifi:ARRAY[1..numofmrulefiles] OF FILES_text;
    cof1,decof1,of2,of3,of4,of4a,of4b:FILES_text;
    logname:text;
    infile: STRING(32);
    dutch,spanish,english:boolean;
    ch:CHAR;
    error:BOOLEAN;
    errorptr:^INTEGER;
    existparams:BOOLEAN;
    entry1:pentry;
    param1:param;
    params:setofparams;
    table,filtertable:setofentries;
    subgramruletable,subgramruletable1:setofpairs;
    subgraminfotable,subgraminfotable1:setofsubgrams;
    ruleinfotable,transinfotable,filterinfotable:setofentries;
    maxtrans,i,maxrnr,maxargs:integer;
    paramtable:setofparams;

procedure initsetofpairs(var S1:setofpairs);
begin
S1.first:=nil;S1.last:=nil
end;
function stillpairs(S1:setofpairs):boolean;
begin
if S1.first<>nil then stillpairs:=true
else stillpairs:=false
end;
procedure appendpair(pair1:ppair;VAR S1:setofpairs);
var p:plospair;
begin
new(p);
p^.arg:=pair1;
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
procedure takepair(VAR pair1:ppair;VAR S1:setofpairs);
begin
if S1.first=nil then pair1:=nil
else
   begin
   pair1:=S1.first^.arg;
   if S1.first=S1.last then
   	begin
   	S1.first:=nil;S1.last:=nil
   	end
   else S1.first:=S1.first^.next
   end
end;

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
procedure appendcat(cat1:integer;VAR S1:setofcats);
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
procedure takecat(VAR cat1:integer;VAR S1:setofcats);
begin
if S1.first=nil then cat1:=0
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
procedure initsetofparams(var S1:setofparams);
begin
S1.first:=nil;S1.last:=nil
end;
function stillparams(S1:setofparams):boolean;
begin
if S1.first<>nil then stillparams:=true
else stillparams:=false
end;
procedure appendparam(param1:param;VAR S1:setofparams);
var p:plosparam;
begin
new(p);
p^.arg:=param1;
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
procedure takeparam(VAR param1:param;VAR S1:setofparams);
begin
if S1.first=nil then begin end
else
   begin
   param1:=S1.first^.arg;
   if S1.first=S1.last then
   	begin
   	S1.first:=nil;S1.last:=nil
   	end
   else S1.first:=S1.first^.next
   end
end;

FUNCTION present(ident:param;S1:setofparams):BOOLEAN;
  VAR ident1:param;
      result:boolean;
  begin
  result:=false;
  while stillparams(S1) and not(result) do
    begin
    takeparam(ident1,S1);
    result := (STR_compare(ident1.paramname,ident1.paramlength,
                ident.paramname,ident.paramlength)=0)
    end;
  present:=result
  end;

procedure initsetofsubgrams(var S1:setofsubgrams);
begin
S1.first:=nil;S1.last:=nil
end;
function stillsubgrams(S1:setofsubgrams):boolean;
begin
if S1.first<>nil then stillsubgrams:=true
else stillsubgrams:=false
end;
procedure appendsubgram(subgram1:subgram;VAR S1:setofsubgrams);
var p:plossubgram;
begin
new(p);
p^.arg:=subgram1;
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
procedure takesubgram(VAR subgram1:subgram;VAR S1:setofsubgrams);
begin
if S1.first=nil then begin end
else
   begin
   subgram1:=S1.first^.arg;
   if S1.first=S1.last then
   	begin
   	S1.first:=nil;S1.last:=nil
   	end
   else S1.first:=S1.first^.next
   end
end;
procedure initsetofidents(var S1:setofidents);
begin
S1.first:=nil;S1.last:=nil
end;
function stillidents(S1:setofidents):boolean;
begin
if S1.first<>nil then stillidents:=true
else stillidents:=false
end;
procedure appendident(ident1:STR_string;VAR S1:setofidents);
var p:plosident;
begin
new(p);
p^.arg:=ident1;
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
procedure takeident(VAR ident1:STR_string;VAR S1:setofidents);
begin
if S1.first=nil then begin {should not occur} end
else
   begin
   ident1:=S1.first^.arg;
   if S1.first=S1.last then
   	begin
   	S1.first:=nil;S1.last:=nil
   	end
   else S1.first:=S1.first^.next
   end
end;

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

PROCEDURE writemruleif;
VAR ch:CHAR;
    cat1:integer;
    cats:setofcats;
    i,j:integer;
    kindstr:STR_string;
    int:FILES_IOrange;
    table:setofentries;
 
PROCEDURE collectmruleif(VAR if1:FILES_text);
 VAR paramname,paramtype,rulename:STR_string;
     i,numofargs:integer;
     param1:param;
     cat:STR_string;
     int:FILES_IOrange;
     entry1:pentry;
     Icat:LIDOMAINT_syntcat;
 BEGIN
 FILES_readstr(if1,rulename,int);
 new(entry1);
 entry1^.rulename:=rulename;
 entry1^.length:=int;
 FILES_skipline(if1);
 FILES_skipline(if1);
 FILES_readstr(if1,paramname,int);
 FILES_skipline(if1);
 initsetofparams(entry1^.params);
 WHILE paramname[1]<>'*' DO
   BEGIN
   param1.paramname:=paramname;
   param1.paramlength:=int;
   FILES_readstr(if1,paramtype,int);
   FILES_skipline(if1);
   param1.typename:=paramtype;
   param1.typelength:=int;
   existparams:=TRUE;
   appendparam(param1,entry1^.params);
   FILES_readstr(if1,paramname,int);
   FILES_skipline(if1);
   END;
 FILES_readinteger(if1,numofargs);
 if numofargs>maxargs then maxargs:=numofargs;
 FILES_skipline(if1);
 entry1^.numofargs:=numofargs;
 initsetofcats(entry1^.inputcats);
 i:=0;
 while i<>numofargs do
   begin
   i:=i+1;
   FILES_readstr(if1,cat,int);
   FILES_skipline(if1);
   LDSTRTOTYPE_cat(cat,int,Icat);
   appendcat(ord(Icat)-ord(LICAT0),entry1^.inputcats)
   end;
 FILES_readstr(if1,cat,int);
 FILES_skipline(if1);
 LDSTRTOTYPE_cat(cat,int,Icat);
 entry1^.outputcat:=ord(Icat)-ord(LICAT0);
 maxrnr:=maxrnr+1;
 appendentry(entry1,ruleinfotable)
 END;

PROCEDURE collecttransif(VAR if1:FILES_text);
 VAR paramname,paramtype,rulename:STR_string;
     i,numofargs:integer;
     param1:param;
     cat:STR_string;
     int:FILES_IOrange;
     entry1:pentry;
     Icat:LIDOMAINT_syntcat;
 BEGIN
 FILES_readstr(if1,rulename,int);
 new(entry1);
 entry1^.rulename:=rulename;
 entry1^.length:=int;
 FILES_skipline(if1);
 FILES_skipline(if1);
 FILES_skipline(if1);
 initsetofparams(entry1^.params);
 numofargs:=1;
 if numofargs>maxargs then maxargs:=numofargs;
 FILES_skipline(if1);
 entry1^.numofargs:=numofargs;
 initsetofcats(entry1^.inputcats);
 i:=0;
 while i<>numofargs do
   begin
   i:=i+1;
   FILES_readstr(if1,cat,int);
   FILES_skipline(if1);
   LDSTRTOTYPE_cat(cat,int,Icat);
   appendcat(ord(Icat)-ord(LICAT0),entry1^.inputcats)
   end;
 FILES_readstr(if1,cat,int);
 FILES_skipline(if1);
 LDSTRTOTYPE_cat(cat,int,Icat);
 entry1^.outputcat:=ord(Icat)-ord(LICAT0);
 maxrnr:=maxrnr+1;
 appendentry(entry1,transinfotable)
 END;

 
 PROCEDURE collectsubgramif(VAR if1:FILES_text);
 VAR catname:STR_string;
     subgram1:subgram;
     int:FILES_IOrange;
     Icat:LIDOMAINT_syntcat;
 BEGIN
 FILES_readstr(if1,catname,int);
 FILES_skipline(if1);
 subgram1.subgramname:=catname;
 subgram1.namelength:=int;
 WHILE catname[1]<>'*' DO
   BEGIN
   FILES_readstr(if1,catname,int);
   FILES_skipline(if1);
   END;
 FILES_readstr(if1,catname,int);
 FILES_skipline(if1);
 initsetofcats(subgram1.headcats);
 WHILE catname[1]<>'*' DO
   BEGIN
   {read head categories:}
   LDSTRTOTYPE_cat(catname,int,Icat);
   appendcat(ord(Icat)-ord(LICAT0),subgram1.headcats);
   FILES_readstr(if1,catname,int);
   FILES_skipline(if1);
   END;
 FILES_readstr(if1,catname,int);
 FILES_skipline(if1);
 initsetofcats(subgram1.exportcats);
 WHILE catname[1]<>'*' DO
   BEGIN
   {read export categories:}
   LDSTRTOTYPE_cat(catname,int,Icat);
   appendcat(ord(Icat)-ord(LICAT0),subgram1.exportcats);
   FILES_readstr(if1,catname,int);
   FILES_skipline(if1);
   END;
 appendsubgram(subgram1,subgraminfotable);
 END;


PROCEDURE collectfilterif(VAR if1:FILES_text);
 VAR paramname,paramtype,rulename:STR_string;
     i,numofargs:integer;
     param1:param;
     cat:STR_string;
     int:FILES_IOrange;
     entry1:pentry;
     Icat:LIDOMAINT_syntcat;
 BEGIN
 FILES_readstr(if1,rulename,int);
 new(entry1);
 entry1^.rulename:=rulename;
 entry1^.length:=int;
 FILES_skipline(if1);
 initsetofparams(entry1^.params);
 numofargs:=1;
 if numofargs>maxargs then maxargs:=numofargs;
 FILES_skipline(if1);
 entry1^.numofargs:=numofargs;
 initsetofcats(entry1^.inputcats);
 i:=0;
 while i<>numofargs do
   begin
   i:=i+1;
   FILES_readstr(if1,cat,int);
   FILES_skipline(if1);
   LDSTRTOTYPE_cat(cat,int,Icat);
   appendcat(ord(Icat)-ord(LICAT0),entry1^.inputcats)
   end;
 entry1^.outputcat:=ord(Icat)-ord(LICAT0);
 maxrnr:=maxrnr+1;
 appendentry(entry1,filterinfotable)
 END;


PROCEDURE writeexportedcats;
VAR table:setofsubgrams;
    subgram1:subgram;
    cats:setofcats;
    i:INTEGER;
    cat:INTEGER;
BEGIN
FILES_writestr(decof1,
' FUNCTION LDAnMrules_InExportedCats(sg:LDMRULES_subgrammarindex;c:LIDOMAINT_syntcat):BOOLEAN;',
                                                    FILES_maxIO,0,left);
FILES_writeline(decof1,TRUE);
FILES_writestr(decof1,'BEGIN',FILES_maxIO,0,left);
IF stillsubgrams(subgraminfotable) THEN
  BEGIN
  FILES_writeline(decof1,TRUE);
  FILES_writestr(decof1,'CASE sg OF',FILES_maxIO,0,left);
  END;
FILES_writeline(decof1,TRUE);
table:=subgraminfotable;
i:=0;
WHILE stillsubgrams(table) DO
  BEGIN
  i:=i+1;
  takesubgram(subgram1,table);
  FILES_writeinteger(decof1,i,0,left);
  FILES_writestr(decof1,':LDANMRULES_inexportedcats:= c IN [',FILES_maxIO,0,left);
  FILES_writeline(decof1,TRUE);
  cats:=subgram1.exportcats;
  WHILE stillcats(cats) DO
    BEGIN
    takecat(cat,cats);
    FILES_writestr(decof1,'LICAT',FILES_maxIO,0,left);
    FILES_writeinteger(decof1,cat,0,left);
    FILES_writeline(decof1,TRUE);
    IF stillcats(cats) THEN
      BEGIN
      FILES_writestr(decof1,'     , ',FILES_maxIO,0,left);
      END;
    END;
  FILES_writestr(decof1,'];',FILES_maxIO,0,left);
  FILES_writeline(decof1,TRUE);
  END;
IF stillsubgrams(subgraminfotable) THEN
  BEGIN
  FILES_writestr(decof1,'END;',FILES_maxIO,0,left);
  FILES_writeline(decof1,TRUE);
  END
ELSE 
  BEGIN
  FILES_writestr(decof1,'LDANMRULES_inexportedcats:=FALSE;',FILES_maxIO,0,left);
  FILES_writeline(decof1,TRUE);
  END;
FILES_writestr(decof1,'END;',FILES_maxIO,0,left);
FILES_writeline(decof1,TRUE);
FILES_writestr(cof1,
' FUNCTION LDGENMrules_InExportedCats(sg:LDMRULES_subgrammarindex;c:LIDOMAINT_syntcat):BOOLEAN;',
                                                    FILES_maxIO,0,left);
FILES_writeline(cof1,TRUE);
FILES_writestr(cof1,'BEGIN',FILES_maxIO,0,left);
IF stillsubgrams(subgraminfotable) THEN
  BEGIN
  FILES_writeline(cof1,TRUE);
  FILES_writestr(cof1,'CASE sg OF',FILES_maxIO,0,left);
  END;
FILES_writeline(cof1,TRUE);
table:=subgraminfotable;
i:=0;
WHILE stillsubgrams(table) DO
  BEGIN
  i:=i+1;
  takesubgram(subgram1,table);
  FILES_writeinteger(cof1,i,0,left);
  FILES_writestr(cof1,':LDGENMRULES_inexportedcats:= c IN [',FILES_maxIO,0,left);
  FILES_writeline(cof1,TRUE);
  cats:=subgram1.exportcats;
  WHILE stillcats(cats) DO
    BEGIN
    takecat(cat,cats);
    FILES_writestr(cof1,'LICAT',FILES_maxIO,0,left);
    FILES_writeinteger(cof1,cat,0,left);
    FILES_writeline(cof1,TRUE);
    IF stillcats(cats) THEN
      BEGIN
      FILES_writestr(cof1,'     , ',FILES_maxIO,0,left);
      END;
    END;
  FILES_writestr(cof1,'];',FILES_maxIO,0,left);
  FILES_writeline(cof1,TRUE);
  END;
IF stillsubgrams(subgraminfotable) THEN
  BEGIN
  FILES_writestr(cof1,'END;',FILES_maxIO,0,left);
  FILES_writeline(cof1,TRUE);
  END
ELSE 
  BEGIN
  FILES_writestr(cof1,'LDGENMRULES_inexportedcats:=FALSE;',FILES_maxIO,0,left);
  FILES_writeline(cof1,TRUE);
  END;
FILES_writestr(cof1,'END;',FILES_maxIO,0,left);
FILES_writeline(cof1,TRUE);
END;


BEGIN{writemruleif}
initsetofentries(transinfotable);
initsetofsubgrams(subgraminfotable);
initsetofentries(filterinfotable);
initsetofentries(ruleinfotable);
maxrnr:=0;
maxargs:=0;
WHILE findinfo(ifi[1]) DO
   BEGIN
   FILES_readstr(ifi[1],kindstr,int);
   FILES_skipline(ifi[1]);
   CASE int OF
    4: collectmruleif(ifi[1]);
    6: collectfilterif(ifi[1]);
    10:collectsubgramif(ifi[1]);
    14:collecttransif(ifi[1]);
   END;
   END;
FILES_close(ifi[1]);
i:=1;
WHILE i<>numofmrulefiles DO
  BEGIN
  i:=i+1;
  CASE i OF
  2: FILES_open(ifi[i],'inputfile2',10,1);
  3: FILES_open(ifi[i],'inputfile3',10,1);
  4: FILES_open(ifi[i],'inputfile4',10,1);
  5: FILES_open(ifi[i],'inputfile5',10,1);
  6: FILES_open(ifi[i],'inputfile6',10,1);
  7: FILES_open(ifi[i],'inputfile7',10,1);
  8: FILES_open(ifi[i],'inputfile8',10,1);
  9: FILES_open(ifi[i],'inputfile9',10,1);
 10: FILES_open(ifi[i],'inputfile10',11,1);
 11: FILES_open(ifi[i],'inputfile11',11,1);
 12: FILES_open(ifi[i],'inputfile12',11,1);
 13: FILES_open(ifi[i],'inputfile13',11,1);
 14: FILES_open(ifi[i],'inputfile14',11,1);
 15: FILES_open(ifi[i],'inputfile15',11,1);
 16: FILES_open(ifi[i],'inputfile16',11,1);
 17: FILES_open(ifi[i],'inputfile17',11,1);
 18: FILES_open(ifi[i],'inputfile18',11,1);
 19: FILES_open(ifi[i],'inputfile19',11,1);
 20: FILES_open(ifi[i],'inputfile20',11,1);
 21: FILES_open(ifi[i],'inputfile21',11,1);
 22: FILES_open(ifi[i],'inputfile22',11,1);
 23: FILES_open(ifi[i],'inputfile23',11,1);
 24: FILES_open(ifi[i],'inputfile24',11,1);
 25: FILES_open(ifi[i],'inputfile25',11,1);
 26: FILES_open(ifi[i],'inputfile26',11,1);
 27: FILES_open(ifi[i],'inputfile27',11,1);
 28: FILES_open(ifi[i],'inputfile28',11,1);
 29: FILES_open(ifi[i],'inputfile29',11,1);
 30: FILES_open(ifi[i],'inputfile30',11,1);
 31: FILES_open(ifi[i],'inputfile31',11,1);
 32: FILES_open(ifi[i],'inputfile32',11,1);
 33: FILES_open(ifi[i],'inputfile33',11,1);
 34: FILES_open(ifi[i],'inputfile34',11,1);
 35: FILES_open(ifi[i],'inputfile35',11,1);
 36: FILES_open(ifi[i],'inputfile36',11,1);
 37: FILES_open(ifi[i],'inputfile37',11,1);
 38: FILES_open(ifi[i],'inputfile38',11,1);
 39: FILES_open(ifi[i],'inputfile39',11,1);
 40: FILES_open(ifi[i],'inputfile40',11,1);
 41: FILES_open(ifi[i],'inputfile41',11,1);
 42: FILES_open(ifi[i],'inputfile42',11,1);
 43: FILES_open(ifi[i],'inputfile43',11,1);
 44: FILES_open(ifi[i],'inputfile44',11,1);
 45: FILES_open(ifi[i],'inputfile45',11,1);
 46: FILES_open(ifi[i],'inputfile46',11,1);
 47: FILES_open(ifi[i],'inputfile47',11,1);
 48: FILES_open(ifi[i],'inputfile48',11,1);
 49: FILES_open(ifi[i],'inputfile49',11,1);
 50: FILES_open(ifi[i],'inputfile50',11,1);
 51: FILES_open(ifi[i],'inputfile51',11,1);
 52: FILES_open(ifi[i],'inputfile52',11,1);
 53: FILES_open(ifi[i],'inputfile53',11,1);
 54: FILES_open(ifi[i],'inputfile54',11,1);
 55: FILES_open(ifi[i],'inputfile55',11,1);
 56: FILES_open(ifi[i],'inputfile56',11,1);
 57: FILES_open(ifi[i],'inputfile57',11,1);
 58: FILES_open(ifi[i],'inputfile58',11,1);
 59: FILES_open(ifi[i],'inputfile59',11,1);
 60: FILES_open(ifi[i],'inputfile60',11,1);
 61: FILES_open(ifi[i],'inputfile61',11,1);
 62: FILES_open(ifi[i],'inputfile62',11,1);
 63: FILES_open(ifi[i],'inputfile63',11,1);
 64: FILES_open(ifi[i],'inputfile64',11,1);
 65: FILES_open(ifi[i],'inputfile65',11,1);
 66: FILES_open(ifi[i],'inputfile66',11,1);
 67: FILES_open(ifi[i],'inputfile67',11,1);
 68: FILES_open(ifi[i],'inputfile68',11,1);
 69: FILES_open(ifi[i],'inputfile69',11,1);
 70: FILES_open(ifi[i],'inputfile70',11,1);
 71: FILES_open(ifi[i],'inputfile71',11,1);
 72: FILES_open(ifi[i],'inputfile72',11,1);
 73: FILES_open(ifi[i],'inputfile73',11,1);
 74: FILES_open(ifi[i],'inputfile74',11,1);
 75: FILES_open(ifi[i],'inputfile75',11,1);
 76: FILES_open(ifi[i],'inputfile76',11,1);
 77: FILES_open(ifi[i],'inputfile77',11,1);
 78: FILES_open(ifi[i],'inputfile78',11,1);
 79: FILES_open(ifi[i],'inputfile79',11,1);
 80: FILES_open(ifi[i],'inputfile80',11,1);
 81: FILES_open(ifi[i],'inputfile81',11,1);
 82: FILES_open(ifi[i],'inputfile82',11,1);
 83: FILES_open(ifi[i],'inputfile83',11,1);
 84: FILES_open(ifi[i],'inputfile84',11,1);
 85: FILES_open(ifi[i],'inputfile85',11,1);
 86: FILES_open(ifi[i],'inputfile86',11,1);
 87: FILES_open(ifi[i],'inputfile87',11,1);
 88: FILES_open(ifi[i],'inputfile88',11,1);
 89: FILES_open(ifi[i],'inputfile89',11,1);
 90: FILES_open(ifi[i],'inputfile90',11,1);
 91: FILES_open(ifi[i],'inputfile91',11,1);
 92: FILES_open(ifi[i],'inputfile92',11,1);
 93: FILES_open(ifi[i],'inputfile93',11,1);
 94: FILES_open(ifi[i],'inputfile94',11,1);
 95: FILES_open(ifi[i],'inputfile95',11,1);
 96: FILES_open(ifi[i],'inputfile96',11,1);
 97: FILES_open(ifi[i],'inputfile97',11,1);
 98: FILES_open(ifi[i],'inputfile98',11,1);
 99: FILES_open(ifi[i],'inputfile99',11,1);
 100: FILES_open(ifi[i],'inputfile100',12,1);
 101: FILES_open(ifi[i],'inputfile101',12,1);
 102: FILES_open(ifi[i],'inputfile102',12,1);
 103: FILES_open(ifi[i],'inputfile103',12,1);
 104: FILES_open(ifi[i],'inputfile104',12,1);
 105: FILES_open(ifi[i],'inputfile105',12,1);
 106: FILES_open(ifi[i],'inputfile106',12,1);
 107: FILES_open(ifi[i],'inputfile107',12,1);
 108: FILES_open(ifi[i],'inputfile108',12,1);
 109: FILES_open(ifi[i],'inputfile109',12,1);
 110: FILES_open(ifi[i],'inputfile110',12,1);
 111: FILES_open(ifi[i],'inputfile111',12,1);
 112: FILES_open(ifi[i],'inputfile112',12,1);
 113: FILES_open(ifi[i],'inputfile113',12,1);
 114: FILES_open(ifi[i],'inputfile114',12,1);
 115: FILES_open(ifi[i],'inputfile115',12,1);
 116: FILES_open(ifi[i],'inputfile116',12,1);
 117: FILES_open(ifi[i],'inputfile117',12,1);
 118: FILES_open(ifi[i],'inputfile118',12,1);
 119: FILES_open(ifi[i],'inputfile119',12,1);
 120: FILES_open(ifi[i],'inputfile120',12,1);
 121: FILES_open(ifi[i],'inputfile121',12,1);
 122: FILES_open(ifi[i],'inputfile122',12,1);
 123: FILES_open(ifi[i],'inputfile123',12,1);
 124: FILES_open(ifi[i],'inputfile124',12,1);
 125: FILES_open(ifi[i],'inputfile125',12,1);
 126: FILES_open(ifi[i],'inputfile126',12,1);
 127: FILES_open(ifi[i],'inputfile127',12,1);
 128: FILES_open(ifi[i],'inputfile128',12,1);
 129: FILES_open(ifi[i],'inputfile129',12,1);
 130: FILES_open(ifi[i],'inputfile130',12,1);
 131: FILES_open(ifi[i],'inputfile131',12,1);
 132: FILES_open(ifi[i],'inputfile132',12,1);
 133: FILES_open(ifi[i],'inputfile133',12,1);
 134: FILES_open(ifi[i],'inputfile134',12,1);
 135: FILES_open(ifi[i],'inputfile135',12,1);
 136: FILES_open(ifi[i],'inputfile136',12,1);
 137: FILES_open(ifi[i],'inputfile137',12,1);
 138: FILES_open(ifi[i],'inputfile138',12,1);
 139: FILES_open(ifi[i],'inputfile139',12,1);
 140: FILES_open(ifi[i],'inputfile140',12,1);
  END;
  IF FILES_done THEN
    BEGIN
    FILES_skipline(ifi[i]);
    WHILE findinfo(ifi[i]) DO
      BEGIN
      FILES_readstr(ifi[i],kindstr,int);
      FILES_skipline(ifi[i]);
      CASE int OF
       4: collectmruleif(ifi[i]);
       6: collectfilterif(ifi[i]);
       10:collectsubgramif(ifi[i]);
       14:collecttransif(ifi[i]);
      END;
      END;
    FILES_close(ifi[i]);
    END;
  END;
FILES_writestr(cof1,'PROCEDURE LDGENMRULES_init;',FILES_maxIO,0,left);
FILES_writeline(cof1,true);
FILES_writestr(cof1,'BEGIN',FILES_maxIO,0,left);
FILES_writeline(cof1,true);
FILES_writestr(cof1,'commrules107_init;',FILES_maxIO,0,left);
FILES_writeline(cof1,true);
FILES_writestr(cof1,'commrules117_init;',FILES_maxIO,0,left);
FILES_writeline(cof1,true);
FILES_writestr(cof1,'END;',FILES_maxIO,0,left);
FILES_writeline(cof1,true);
FILES_writestr(cof1,
        ' FUNCTION LDGENMRULES_FR(sg:LDMRULES_subgrammarindex;Rk:LDMRULES_Ruleindex;',
   							FILES_maxIO,0,left);
FILES_writeline(cof1,true);
FILES_writestr(cof1,
         ' ps:LDMRULES_liparameters;t:LISTREE_tupleofstrees)',
                                                        FILES_maxIO,0,left);
FILES_writeline(cof1,true);
FILES_writestr(cof1,
         '                : LISTREE_setofstrees;',FILES_maxIO,0,left);
FILES_writeline(cof1,true);
FILES_writestr(cof1,'VAR',FILES_maxIO,0,left);
FILES_writeline(cof1,true);
FILES_writestr(cof1,'   s1,s2,s3,s4,s5:LISTREE_pstree;',FILES_maxIO,0,left);
FILES_writeline(cof1,true);
IF NOT(stillentries(ruleinfotable)) THEN
  BEGIN
  FILES_writestr(cof1,'    result:LISTREE_setofstrees;',FILES_maxIO,0,left);
  FILES_writeline(cof1,true);
  END;
FILES_writestr(cof1,' lsps:LSPARAMS_precord;',FILES_maxIO,0,left);
FILES_writeline(cof1,true);
table:=ruleinfotable;
i:=0;
WHILE stillentries(table) DO
   BEGIN
   i:=i+1;
   takeentry(entry1,table);
   params:=entry1^.params;
   WHILE stillparams(params) DO
     BEGIN
       takeparam(param1,params);
       appendparam(param1,paramtable);
       FILES_writestr(cof1,'X',FILES_maxIO,0,left);
       FILES_writeinteger(cof1,i,0,left);
       FILES_writestr(cof1,param1.paramname,param1.paramlength,param1.paramlength,left);
       FILES_writestr(cof1,':',FILES_maxIO,0,left);
       IF (STR_compare(param1.typename,param1.typelength,'INTEGER',7) <>0) THEN 
         FILES_writestr(cof1,'LSDOMAINT_',FILES_maxIO,0,left);
       FILES_writestr(cof1,param1.typename,param1.typelength,param1.typelength,left);
       FILES_writechar(cof1,';');
       FILES_writeline(cof1,true);
     END;
   END;
FILES_writestr(cof1,'BEGIN',FILES_maxIO,0,left);
FILES_writeline(cof1,true);
FILES_writestr(cof1,'lsps:=loopholes.retype(ps.ls,LSPARAMS_precord);',FILES_maxIO,0,left);
IF stillentries(ruleinfotable) THEN
  BEGIN
  FILES_writestr(cof1,'IF Rk <= 254 THEN CASE Rk of',FILES_maxIO,0,left);
  FILES_writeline(cof1,true);
  END;
i:=0;
table:=ruleinfotable;
while stillentries(table) and (i<254) do
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
     FILES_writestr(cof1,',t);',FILES_maxIO,0,left);
     FILES_writeline(cof1,true)
     end;
   params:=entry1^.params;
   WHILE stillparams(params) DO
     BEGIN
     takeparam(param1,params);
     FILES_writestr(cof1,'X',FILES_maxIO,0,left);
     FILES_writeinteger(cof1,i,0,left);
     FILES_writestr(cof1,param1.paramname,param1.paramlength,param1.paramlength,left);
     FILES_writestr(cof1,':=',FILES_maxIO,0,left);
     IF (STR_compare(param1.paramname,5,'LEVEL',5)<>0) THEN
       BEGIN
       FILES_writestr(cof1,'lsps^.',FILES_maxIO,0,left);
       FILES_writestr(cof1,'X',FILES_maxIO,0,left);
       FILES_writeinteger(cof1,i,0,left);
       FILES_writestr(cof1,param1.paramname,param1.paramlength,param1.paramlength,left);
       END
     ELSE
       BEGIN
       FILES_writestr(cof1,'ps.index',FILES_maxIO,0,left);
       END;
     FILES_writestr(cof1,';',FILES_maxIO,0,left);
     FILES_writeline(cof1,TRUE);
     END;
   FILES_writestr(cof1,'    LDGENMRULES_FR:= com',FILES_maxIO,0,left);
   FILES_writestr(cof1,entry1^.rulename,entry1^.length,entry1^.length,left);
   FILES_writestr(cof1,'(',FILES_maxIO,0,left);
   params:=entry1^.params;
   WHILE stillparams(params) DO
     BEGIN
     takeparam(param1,params);
     FILES_writestr(cof1,'X',FILES_maxIO,0,left);
     FILES_writeinteger(cof1,i,0,left);
     FILES_writestr(cof1,param1.paramname,param1.paramlength,param1.paramlength,left);
     FILES_writechar(cof1,',');
     FILES_writeline(cof1,TRUE);
     END;
   FILES_writechar(cof1,'s');
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
IF stillentries(ruleinfotable) THEN
  BEGIN
  FILES_writestr(cof1,'END;',FILES_maxIO,0,left);
  FILES_writeline(cof1,true);
  END
ELSE
  BEGIN
  FILES_writestr(cof1,'result.first:=NIL;result.last:=NIL;',FILES_maxIO,0,left);
  FILES_writeline(cof1,true);
  FILES_writestr(cof1,'LDGENMRULES_FR:=result;',FILES_maxIO,0,left);
  FILES_writeline(cof1,true);
  END;
IF stillentries(table) THEN
  BEGIN
  FILES_writestr(cof1,'IF Rk >254 THEN CASE Rk of',FILES_maxIO,0,left);
  FILES_writeline(cof1,true);
  END;
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
     FILES_writestr(cof1,',t);',FILES_maxIO,0,left);
     FILES_writeline(cof1,true)
     end;
   params:=entry1^.params;
   WHILE stillparams(params) DO
     BEGIN
     takeparam(param1,params);
     FILES_writestr(cof1,'X',FILES_maxIO,0,left);
     FILES_writeinteger(cof1,i,0,left);
     FILES_writestr(cof1,param1.paramname,param1.paramlength,param1.paramlength,left);
     FILES_writestr(cof1,':=',FILES_maxIO,0,left);
     IF (STR_compare(param1.paramname,5,'LEVEL',5)<>0) THEN
       BEGIN
       FILES_writestr(cof1,'lsps^.',FILES_maxIO,0,left);
       FILES_writestr(cof1,'X',FILES_maxIO,0,left);
       FILES_writeinteger(cof1,i,0,left);
       FILES_writestr(cof1,param1.paramname,param1.paramlength,param1.paramlength,left);
       END
     ELSE
       BEGIN
       FILES_writestr(cof1,'ps.index',FILES_maxIO,0,left);
       END;
     FILES_writestr(cof1,';',FILES_maxIO,0,left);
     FILES_writeline(cof1,TRUE);
     END;
   FILES_writestr(cof1,'    LDGENMRULES_FR:= com',FILES_maxIO,0,left);
   FILES_writestr(cof1,entry1^.rulename,entry1^.length,entry1^.length,left);
   FILES_writestr(cof1,'(',FILES_maxIO,0,left);
   params:=entry1^.params;
   WHILE stillparams(params) DO
     BEGIN
     takeparam(param1,params);
     FILES_writestr(cof1,'X',FILES_maxIO,0,left);
     FILES_writeinteger(cof1,i,0,left);
     FILES_writestr(cof1,param1.paramname,param1.paramlength,param1.paramlength,left);
     FILES_writechar(cof1,',');
     FILES_writeline(cof1,TRUE);
     END;
   FILES_writechar(cof1,'s');
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
IF i>254 THEN
  BEGIN
  FILES_writestr(cof1,'END;',FILES_maxIO,0,left);
  FILES_writeline(cof1,true);
  END;
FILES_writestr(cof1,'END;',FILES_maxIO,0,left);
FILES_writeline(cof1,true);
FILES_writestr(decof1,'PROCEDURE LDANMRULES_init;',FILES_maxIO,0,left);
FILES_writeline(decof1,true);
FILES_writestr(decof1,'BEGIN',FILES_maxIO,0,left);
FILES_writeline(decof1,true);
FILES_writestr(decof1,'decommrules107_init;',FILES_maxIO,0,left);
FILES_writeline(decof1,true);
FILES_writestr(decof1,'decommrules117_init;',FILES_maxIO,0,left);
FILES_writeline(decof1,true);
FILES_writestr(decof1,'END;',FILES_maxIO,0,left);
FILES_writeline(decof1,true);
FILES_writestr(decof1,
        ' FUNCTION LDANMRULES_FRaccent(sg:LDMRULES_SubgrammarIndex;',
   							FILES_maxIO,0,left);
FILES_writeline(decof1,true);
FILES_writestr(decof1,'            Rk:LDMRULES_Ruleindex;',FILES_maxIO,0,left);
FILES_writeline(decof1,true);
FILES_writestr(decof1,'            VAR ps:LDMRULES_liParameters;',FILES_maxIO,0,left);
FILES_writeline(decof1,true);
FILES_writestr(decof1,
                      '            t:LISTREE_pstree)',
                                                        FILES_maxIO,0,left);
FILES_writeline(decof1,true);
FILES_writestr(decof1,
         '                : LISTREE_setoftupleofstrees;',FILES_maxIO,0,left);
FILES_writeline(decof1,true);
FILES_writestr(decof1,' VAR subst:INTEGER;lsps:LSPARAMS_precord;',FILES_maxIO,0,left);
FILES_writeline(decof1,true);
FILES_writestr(decof1,'    result:LISTREE_setoftupleofstrees;',FILES_maxIO,0,left);
FILES_writeline(decof1,true);
table:=ruleinfotable;
i:=0;
WHILE stillentries(table) DO
   BEGIN
   i:=i+1;
   takeentry(entry1,table);
   params:=entry1^.params;
   WHILE stillparams(params) DO
     BEGIN
       takeparam(param1,params);
       appendparam(param1,paramtable);
       FILES_writestr(decof1,'X',FILES_maxIO,0,left);
       FILES_writeinteger(decof1,i,0,left);
       FILES_writestr(decof1,param1.paramname,param1.paramlength,param1.paramlength,left);
       FILES_writestr(decof1,':',FILES_maxIO,0,left);
       IF (STR_compare(param1.typename,param1.typelength,'INTEGER',7) <>0) THEN 
         FILES_writestr(decof1,'LSDOMAINT_',FILES_maxIO,0,left);
       FILES_writestr(decof1,param1.typename,param1.typelength,param1.typelength,left);
       FILES_writechar(decof1,';');
       FILES_writeline(decof1,true);
     END;
   END;
FILES_writestr(decof1,'BEGIN',FILES_maxIO,0,left);
FILES_writeline(decof1,true);
IF stillentries(ruleinfotable) THEN
  BEGIN
  FILES_writestr(decof1,'IF Rk<=254 THEN CASE Rk of',FILES_maxIO,0,left);
  FILES_writeline(decof1,true);
  END;
i:=0;
table:=ruleinfotable;
while stillentries(table) and (i<254) do
   begin
   takeentry(entry1,table);
   i:=i+1;
   params:=entry1^.params;
   IF stillparams(params) THEN
     BEGIN
     FILES_writeinteger(of3,i,0,left);
     FILES_writestr(of3,':(',FILES_maxIO,0,left);
     END;
   WHILE stillparams(params) DO
     BEGIN
     takeparam(param1,params);
     IF (STR_compare(param1.paramname,5,'LEVEL',5)<>0) THEN
       BEGIN
       FILES_writechar(of3,'X');
       FILES_writeinteger(of3,i,0,left);
       FILES_writestr(of3,param1.paramname,param1.paramlength,param1.paramlength,left);
       IF (STR_compare(param1.typename,param1.typelength,'INTEGER',7) <>0) THEN 
       FILES_writestr(of3,':LSDOMAINT_',FILES_maxIO,0,left)
       ELSE FILES_writestr(of3,':',FILES_maxIO,0,left);
       FILES_writestr(of3,param1.typename,param1.typelength,param1.typelength,left);
       IF stillparams(params) THEN FILES_writechar(of3,';');
       FILES_writeline(of3,TRUE);
       END;
     END;
   IF stillparams(entry1^.params) THEN FILES_writestr(of3,');',FILES_maxIO,0,left);
   FILES_writeline(of3,TRUE);
   FILES_writeinteger(decof1,i,0,left);
   FILES_writestr(decof1,': BEGIN subst:=-1;',FILES_maxIO,0,left);
   FILES_writeline(decof1,TRUE);
   params:=entry1^.params;
   WHILE stillparams(params) DO
     BEGIN
     takeparam(param1,params);
     IF (STR_compare(param1.paramname,5,'LEVEL',5)=0) THEN
       BEGIN
       FILES_writestr(decof1,'LIMATCHES_setlevel(ps.index);',FILES_maxIO,0,left);
       FILES_writeline(decof1,TRUE);
       END;
     END;
   FILES_writestr(decof1,'    result:= dec',FILES_maxIO,0,left);
   FILES_writestr(decof1,entry1^.rulename,entry1^.length,entry1^.length,left);
   FILES_writechar(decof1,'(');
   params:=entry1^.params;
   WHILE stillparams(params) DO
     BEGIN
     takeparam(param1,params);
     FILES_writestr(decof1,'X',FILES_maxIO,0,left);
     FILES_writeinteger(decof1,i,0,left);
     FILES_writestr(decof1,param1.paramname,param1.paramlength,param1.paramlength,left);
     IF (STR_compare(param1.typename,param1.typelength,'INTEGER',7) = 0) THEN 
       BEGIN
       FILES_writestr(decof1,',subst',FILES_maxIO,0,left);
       END;
     FILES_writechar(decof1,',');
     FILES_writeline(decof1,TRUE);
     END;
   FILES_writestr(decof1,'t);',FILES_maxIO,0,left);
   FILES_writeline(decof1,true);
   FILES_writestr(decof1,'LDANMRULES_FRaccent:=result;',FILES_maxIO,0,left);
   FILES_writeline(decof1,true);
   params:=entry1^.params;
   FILES_writestr(decof1,'IF LISTREE_STILLtupleofstrees(result) THEN BEGIN',FILES_maxIO,0,left);
   FILES_writeline(decof1,true);
   FILES_writestr(decof1,'    ps.index:=-1;',FILES_maxIO,0,left);
   FILES_writeline(decof1,TRUE);
   FILES_writestr(decof1,'    ps.subst:=subst;',FILES_maxIO,0,left);
   FILES_writeline(decof1,TRUE);
   FILES_writestr(decof1,'    ps.rulenr:=',FILES_maxIO,0,left);
   FILES_writeinteger(decof1,i,0,left);
   FILES_writechar(decof1,';');
   FILES_writeline(decof1,TRUE);
   FILES_writestr(decof1,
'    MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));',FILES_maxIO,0,left);
   FILES_writeline(decof1,TRUE);
   FILES_writestr(decof1,'    lsps^.rulenr:=',FILES_maxIO,0,left);
   FILES_writeinteger(decof1,i,0,left);
   FILES_writechar(decof1,';');
   FILES_writeline(decof1,TRUE);
   WHILE stillparams(params) DO
     BEGIN
     takeparam(param1,params);
     IF (STR_compare(param1.paramname,5,'LEVEL',5)<>0) THEN
       BEGIN
       FILES_writestr(decof1,'    lsps^.',FILES_maxIO,0,left);
       FILES_writestr(decof1,'X',FILES_maxIO,0,left);
       FILES_writeinteger(decof1,i,0,left);
       FILES_writestr(decof1,param1.paramname,param1.paramlength,param1.paramlength,left);
       END
     ELSE
       BEGIN
       FILES_writestr(decof1,'ps.index',FILES_maxIO,0,left);
       END;
     FILES_writestr(decof1,':=',FILES_maxIO,0,left);
     FILES_writestr(decof1,'X',FILES_maxIO,0,left);
     FILES_writeinteger(decof1,i,0,left);
     FILES_writestr(decof1,param1.paramname,param1.paramlength,param1.paramlength,left);
     FILES_writestr(decof1,';',FILES_maxIO,0,left);
     FILES_writeline(decof1,TRUE);
     END;
   FILES_writestr(decof1,'END;',FILES_maxIO,0,left);
   FILES_writeline(decof1,true);
   FILES_writestr(decof1,'    ps.ls:=loopholes.retype(lsps,LDMRULES_lsParams);',FILES_maxIO,0,left);
   FILES_writestr(decof1,' END;',FILES_maxIO,0,left);
   FILES_writeline(decof1,TRUE);
   END;
IF stillentries(ruleinfotable) THEN
  BEGIN
  FILES_writeline(decof1,true);
  FILES_writestr(decof1,'END;',FILES_maxIO,0,left);
  END
ELSE
  BEGIN
  FILES_writestr(decof1,'result.first:=NIL;result.last:=NIL;',FILES_maxIO,0,left);
  FILES_writeline(decof1,true);
  FILES_writestr(decof1,'LDANMRULES_FRaccent:=result;',FILES_maxIO,0,left);
  FILES_writeline(decof1,true);
  END;
FILES_writeline(decof1,true);
IF stillentries(table) THEN
  BEGIN
  FILES_writestr(decof1,'IF Rk>254 THEN CASE Rk of',FILES_maxIO,0,left);
  FILES_writeline(decof1,true);
  END;
while stillentries(table) do
   begin
   takeentry(entry1,table);
   i:=i+1;
   params:=entry1^.params;
   IF stillparams(params) THEN
     BEGIN
     FILES_writeinteger(of3,i,0,left);
     FILES_writestr(of3,':(',FILES_maxIO,0,left);
     END;
   WHILE stillparams(params) DO
     BEGIN
     takeparam(param1,params);
     IF (STR_compare(param1.paramname,5,'LEVEL',5)<>0) THEN
       BEGIN
       FILES_writechar(of3,'X');
       FILES_writeinteger(of3,i,0,left);
       FILES_writestr(of3,param1.paramname,param1.paramlength,param1.paramlength,left);
       IF (STR_compare(param1.typename,param1.typelength,'INTEGER',7) <>0) THEN 
       FILES_writestr(of3,':LSDOMAINT_',FILES_maxIO,0,left)
       ELSE FILES_writestr(of3,':',FILES_maxIO,0,left);
       FILES_writestr(of3,param1.typename,param1.typelength,param1.typelength,left);
       IF stillparams(params) THEN FILES_writechar(of3,';');
       FILES_writeline(of3,TRUE);
       END;
     END;
   IF stillparams(entry1^.params) THEN FILES_writestr(of3,');',FILES_maxIO,0,left);
   FILES_writeline(of3,TRUE);
   FILES_writeinteger(decof1,i,0,left);
   FILES_writestr(decof1,': BEGIN subst:=-1;',FILES_maxIO,0,left);
   FILES_writeline(decof1,TRUE);
   params:=entry1^.params;
   WHILE stillparams(params) DO
     BEGIN
     takeparam(param1,params);
     IF (STR_compare(param1.paramname,5,'LEVEL',5)=0) THEN
       BEGIN
       FILES_writestr(decof1,'LIMATCHES_setlevel(ps.index);',FILES_maxIO,0,left);
       FILES_writeline(decof1,TRUE);
       END;
     END;
   FILES_writestr(decof1,'    result:= dec',FILES_maxIO,0,left);
   FILES_writestr(decof1,entry1^.rulename,entry1^.length,entry1^.length,left);
   FILES_writechar(decof1,'(');
   params:=entry1^.params;
   WHILE stillparams(params) DO
     BEGIN
     takeparam(param1,params);
     FILES_writestr(decof1,'X',FILES_maxIO,0,left);
     FILES_writeinteger(decof1,i,0,left);
     FILES_writestr(decof1,param1.paramname,param1.paramlength,param1.paramlength,left);
     IF (STR_compare(param1.typename,param1.typelength,'INTEGER',7) = 0) THEN 
       BEGIN
       FILES_writestr(decof1,',subst',FILES_maxIO,0,left);
       END;
     FILES_writechar(decof1,',');
     FILES_writeline(decof1,TRUE);
     END;
   FILES_writestr(decof1,'t);',FILES_maxIO,0,left);
   FILES_writeline(decof1,true);
   FILES_writestr(decof1,'LDANMRULES_FRaccent:=result;',FILES_maxIO,0,left);
   FILES_writeline(decof1,true);
   params:=entry1^.params;
   FILES_writestr(decof1,'IF LISTREE_STILLtupleofstrees(result) THEN BEGIN',FILES_maxIO,0,left);
   FILES_writeline(decof1,true);
   FILES_writestr(decof1,'    ps.index:=-1;',FILES_maxIO,0,left);
   FILES_writeline(decof1,TRUE);
   FILES_writestr(decof1,'    ps.subst:=subst;',FILES_maxIO,0,left);
   FILES_writeline(decof1,TRUE);
   FILES_writestr(decof1,'    ps.rulenr:=',FILES_maxIO,0,left);
   FILES_writeinteger(decof1,i,0,left);
   FILES_writechar(decof1,';');
   FILES_writeline(decof1,TRUE);
   FILES_writestr(decof1,
'    MEM_newdefault(loopholes.sizeof(LSPARAMS_record),loopholes.retype(lsps,MEM_ptr));',FILES_maxIO,0,left);
   FILES_writeline(decof1,TRUE);
   FILES_writestr(decof1,'    lsps^.rulenr:=',FILES_maxIO,0,left);
   FILES_writeinteger(decof1,i,0,left);
   FILES_writechar(decof1,';');
   FILES_writeline(decof1,TRUE);
   WHILE stillparams(params) DO
     BEGIN
     takeparam(param1,params);
     IF (STR_compare(param1.paramname,5,'LEVEL',5)<>0) THEN
       BEGIN
       FILES_writestr(decof1,'    lsps^.',FILES_maxIO,0,left);
       FILES_writestr(decof1,'X',FILES_maxIO,0,left);
       FILES_writeinteger(decof1,i,0,left);
       FILES_writestr(decof1,param1.paramname,param1.paramlength,param1.paramlength,left);
       END
     ELSE
       BEGIN
       FILES_writestr(decof1,'ps.index',FILES_maxIO,0,left);
       END;
     FILES_writestr(decof1,':=',FILES_maxIO,0,left);
     FILES_writestr(decof1,'X',FILES_maxIO,0,left);
     FILES_writeinteger(decof1,i,0,left);
     FILES_writestr(decof1,param1.paramname,param1.paramlength,param1.paramlength,left);
     FILES_writestr(decof1,';',FILES_maxIO,0,left);
     FILES_writeline(decof1,TRUE);
     END;
   FILES_writestr(decof1,'END;',FILES_maxIO,0,left);
   FILES_writeline(decof1,true);
   FILES_writestr(decof1,'    ps.ls:=loopholes.retype(lsps,LDMRULES_lsParams);',FILES_maxIO,0,left);
   FILES_writestr(decof1,' END;',FILES_maxIO,0,left);
   FILES_writeline(decof1,TRUE);
   END;
IF i>254 THEN
  BEGIN
  FILES_writeline(decof1,true);
  FILES_writestr(decof1,'END;',FILES_maxIO,0,left);
  END;
FILES_writestr(decof1,'END;',FILES_maxIO,0,left);
FILES_writeline(decof1,true);


FILES_writestr(decof1,
        ' FUNCTION LDANMRULES_FTaccent(sg:LDMRULES_SubgrammarIndex;',
   							FILES_maxIO,0,left);
FILES_writeline(decof1,true);
FILES_writestr(decof1,'            Tk:LDMRULES_TransformationIndex;',FILES_maxIO,0,left);
FILES_writeline(decof1,true);
FILES_writestr(decof1,
                      '            t:LISTREE_pstree)',
                                                        FILES_maxIO,0,left);
FILES_writeline(decof1,true);
FILES_writestr(decof1,
         '                : LISTREE_setoftupleofstrees;',FILES_maxIO,0,left);
FILES_writeline(decof1,true);
FILES_writestr(decof1,
'VAR tupleresult:LISTREE_setoftupleofstrees;stree:LISTREE_pstree;tuple:LISTREE_tupleofstrees;',
                                                        FILES_maxIO,0,left);
FILES_writeline(decof1,true);
FILES_writestr(decof1,'BEGIN',FILES_maxIO,0,left);
FILES_writeline(decof1,true);
FILES_writestr(decof1,'      LISTREE_initsetoftupleofstrees(tupleresult);',FILES_maxIO,0,left);
FILES_writeline(decof1,true);
IF stillentries(transinfotable) THEN
  BEGIN
  FILES_writestr(decof1,'IF Tk<=254 THEN CASE Tk of',FILES_maxIO,0,left);
  FILES_writeline(decof1,true);
  END;
i:=0;
table:=transinfotable;
while stillentries(table) AND (i<254) do
   begin
   takeentry(entry1,table);
   i:=i+1;
   FILES_writeinteger(decof1,i,0,left);
   FILES_writestr(decof1,': BEGIN',FILES_maxIO,0,left);
   FILES_writeline(decof1,TRUE);
   FILES_writestr(decof1,'    tupleresult:= dec',FILES_maxIO,0,left);
   FILES_writestr(decof1,entry1^.rulename,entry1^.length,entry1^.length,left);
   FILES_writestr(decof1,'(t);',FILES_maxIO,0,left);
   FILES_writeline(decof1,true);
   FILES_writestr(decof1,' END;',FILES_maxIO,0,left);
   FILES_writeline(decof1,TRUE);
   END;
filtertable:=filterinfotable;
while stillentries(filtertable) AND (i<254) do
   begin
   takeentry(entry1,filtertable);
   i:=i+1;
   FILES_writeinteger(decof1,i,0,left);
   FILES_writestr(decof1,': BEGIN',FILES_maxIO,0,left);
   FILES_writeline(decof1,TRUE);
   FILES_writestr(decof1,'    stree:= dec',FILES_maxIO,0,left);
   FILES_writestr(decof1,entry1^.rulename,entry1^.length,entry1^.length,left);
   FILES_writestr(decof1,'(t);',FILES_maxIO,0,left);
   FILES_writeline(decof1,true);
   FILES_writestr(decof1,'      LISTREE_emptytuple(tuple);',FILES_maxIO,0,left);
   FILES_writeline(decof1,true);
   FILES_writestr(decof1,'      IF stree<>NIL THEN BEGIN LISTREE_addtotuple(stree,tuple);',FILES_maxIO,0,left);
   FILES_writeline(decof1,true);
   FILES_writestr(decof1,'      LISTREE_appendtupleofstrees(tuple,tupleresult) END;',FILES_maxIO,0,left);
   FILES_writeline(decof1,true);
   FILES_writestr(decof1,'      END;',FILES_maxIO,0,left);
   FILES_writeline(decof1,true);
   END;
IF stillentries(transinfotable) THEN
  BEGIN
  FILES_writestr(decof1,'END;',FILES_maxIO,0,left);
  FILES_writeline(decof1,true);
  END;
IF stillentries(table) OR stillentries(filtertable) THEN
  BEGIN
  FILES_writestr(decof1,'IF Tk>',FILES_maxIO,0,left);
  FILES_writeinteger(decof1,i,0,left);
  FILES_writestr(decof1,' THEN CASE Tk of',FILES_maxIO,0,left);
  FILES_writeline(decof1,true);
  END;
while stillentries(table) do
   begin
   takeentry(entry1,table);
   i:=i+1;
   FILES_writeinteger(decof1,i,0,left);
   FILES_writestr(decof1,': BEGIN',FILES_maxIO,0,left);
   FILES_writeline(decof1,TRUE);
   FILES_writestr(decof1,'    tupleresult:= dec',FILES_maxIO,0,left);
   FILES_writestr(decof1,entry1^.rulename,entry1^.length,entry1^.length,left);
   FILES_writestr(decof1,'(t);',FILES_maxIO,0,left);
   FILES_writeline(decof1,true);
   FILES_writestr(decof1,' END;',FILES_maxIO,0,left);
   FILES_writeline(decof1,TRUE);
   END;
while stillentries(filtertable) do
   begin
   takeentry(entry1,filtertable);
   i:=i+1;
   FILES_writeinteger(decof1,i,0,left);
   FILES_writestr(decof1,': BEGIN',FILES_maxIO,0,left);
   FILES_writeline(decof1,TRUE);
   FILES_writestr(decof1,'    stree:= dec',FILES_maxIO,0,left);
   FILES_writestr(decof1,entry1^.rulename,entry1^.length,entry1^.length,left);
   FILES_writestr(decof1,'(t);',FILES_maxIO,0,left);
   FILES_writeline(decof1,true);
   FILES_writestr(decof1,'      LISTREE_emptytuple(tuple);',FILES_maxIO,0,left);
   FILES_writeline(decof1,true);
   FILES_writestr(decof1,'      IF stree<>NIL THEN BEGIN LISTREE_addtotuple(stree,tuple);',FILES_maxIO,0,left);
   FILES_writeline(decof1,true);
   FILES_writestr(decof1,'      LISTREE_appendtupleofstrees(tuple,tupleresult) END;',FILES_maxIO,0,left);
   FILES_writeline(decof1,true);
   FILES_writestr(decof1,'      END;',FILES_maxIO,0,left);
   FILES_writeline(decof1,true);
   END;
IF i>254 THEN
  BEGIN
  FILES_writestr(decof1,'END;',FILES_maxIO,0,left);
  FILES_writeline(decof1,true);
  END;
FILES_writestr(decof1,'    LDANMRULES_FTaccent:= tupleresult',FILES_maxIO,0,left);
FILES_writeline(decof1,true);
FILES_writestr(decof1,'END;',FILES_maxIO,0,left);
FILES_writeline(decof1,true);


FILES_writestr(cof1,
        ' FUNCTION LDGENMRULES_FT(sg:LDMRULES_SubgrammarIndex;',
   							FILES_maxIO,0,left);
FILES_writeline(cof1,true);
FILES_writestr(cof1,'            Tk:LDMRULES_TransformationIndex;',FILES_maxIO,0,left);
FILES_writeline(cof1,true);
FILES_writestr(cof1,
                      '            t:LISTREE_tupleofstrees)',
                                                        FILES_maxIO,0,left);
FILES_writeline(cof1,true);
FILES_writestr(cof1,
         '                : LISTREE_setofstrees;',FILES_maxIO,0,left);
FILES_writeline(cof1,true);
FILES_writestr(cof1,
'VAR result:LISTREE_setofstrees;stree,stree1:LISTREE_pstree;',FILES_maxIO,0,left);
FILES_writeline(cof1,true);
FILES_writestr(cof1,'BEGIN',FILES_maxIO,0,left);
FILES_writeline(cof1,true);
FILES_writestr(cof1,'      LISTREE_initsetofstrees(result);',FILES_maxIO,0,left);
FILES_writeline(cof1,true);
IF stillentries(transinfotable) THEN
  BEGIN
  FILES_writestr(cof1,'IF Tk<=254 THEN CASE Tk of',FILES_maxIO,0,left);
  FILES_writeline(cof1,true);
  END;
i:=0;
table:=transinfotable;
while stillentries(table) AND (i<254) do
   begin
   takeentry(entry1,table);
   i:=i+1;
   FILES_writeinteger(cof1,i,0,left);
   FILES_writestr(cof1,': BEGIN',FILES_maxIO,0,left);
   FILES_writeline(cof1,TRUE);
   FILES_writestr(cof1,' LISTREE_EXTRACTfromtuple(stree1,t);',FILES_maxIO,0,left);
   FILES_writeline(cof1,TRUE);
   FILES_writestr(cof1,'    result:= com',FILES_maxIO,0,left);
   FILES_writestr(cof1,entry1^.rulename,entry1^.length,entry1^.length,left);
   FILES_writestr(cof1,'(stree1);',FILES_maxIO,0,left);
   FILES_writeline(cof1,true);
   FILES_writestr(cof1,' END;',FILES_maxIO,0,left);
   FILES_writeline(cof1,TRUE);
   END;
filtertable:=filterinfotable;
while stillentries(filtertable) and (i<254)do
   begin
   takeentry(entry1,filtertable);
   i:=i+1;
   FILES_writeinteger(cof1,i,0,left);
   FILES_writestr(cof1,': BEGIN',FILES_maxIO,0,left);
   FILES_writeline(cof1,TRUE);
   FILES_writestr(cof1,' LISTREE_EXTRACTfromtuple(stree1,t);',FILES_maxIO,0,left);
   FILES_writeline(cof1,TRUE);
   FILES_writestr(cof1,'    stree:= com',FILES_maxIO,0,left);
   FILES_writestr(cof1,entry1^.rulename,entry1^.length,entry1^.length,left);
   FILES_writestr(cof1,'(stree1);',FILES_maxIO,0,left);
   FILES_writeline(cof1,true);
   FILES_writestr(cof1,'    IF stree<>NIL THEN LISTREE_appendstree(stree,result);',FILES_maxIO,0,left);
   FILES_writeline(cof1,true);
   FILES_writestr(cof1,'      END;',FILES_maxIO,0,left);
   FILES_writeline(cof1,true);
   END;
IF stillentries(transinfotable) THEN
  BEGIN
  FILES_writestr(cof1,'END;',FILES_maxIO,0,left);
  FILES_writeline(cof1,true);
  END;
IF stillentries(table) OR stillentries(filtertable) THEN
  BEGIN
  FILES_writestr(cof1,'IF Tk>',FILES_maxIO,0,left);
  FILES_writeinteger(cof1,i,0,left);
  FILES_writestr(cof1,' THEN CASE Tk of',FILES_maxIO,0,left);
  FILES_writeline(cof1,true);
  END;
while stillentries(table) do
   begin
   takeentry(entry1,table);
   i:=i+1;
   FILES_writeinteger(cof1,i,0,left);
   FILES_writestr(cof1,': BEGIN',FILES_maxIO,0,left);
   FILES_writeline(cof1,TRUE);
   FILES_writestr(cof1,' LISTREE_EXTRACTfromtuple(stree1,t);',FILES_maxIO,0,left);
   FILES_writeline(cof1,TRUE);
   FILES_writestr(cof1,'    result:= com',FILES_maxIO,0,left);
   FILES_writestr(cof1,entry1^.rulename,entry1^.length,entry1^.length,left);
   FILES_writestr(cof1,'(stree1);',FILES_maxIO,0,left);
   FILES_writeline(cof1,true);
   FILES_writestr(cof1,' END;',FILES_maxIO,0,left);
   FILES_writeline(cof1,TRUE);
   END;
while stillentries(filtertable) do
   begin
   takeentry(entry1,filtertable);
   i:=i+1;
   FILES_writeinteger(cof1,i,0,left);
   FILES_writestr(cof1,': BEGIN',FILES_maxIO,0,left);
   FILES_writeline(cof1,TRUE);
   FILES_writestr(cof1,' LISTREE_EXTRACTfromtuple(stree1,t);',FILES_maxIO,0,left);
   FILES_writeline(cof1,TRUE);
   FILES_writestr(cof1,'    stree:= com',FILES_maxIO,0,left);
   FILES_writestr(cof1,entry1^.rulename,entry1^.length,entry1^.length,left);
   FILES_writestr(cof1,'(stree1);',FILES_maxIO,0,left);
   FILES_writeline(cof1,true);
   FILES_writestr(cof1,'    IF stree<>NIL THEN LISTREE_appendstree(stree,result);',FILES_maxIO,0,left);
   FILES_writeline(cof1,true);
   FILES_writestr(cof1,'      END;',FILES_maxIO,0,left);
   FILES_writeline(cof1,true);
   END;
IF i>254 THEN
  BEGIN
  FILES_writestr(cof1,'END;',FILES_maxIO,0,left);
  FILES_writeline(cof1,true);
  END;
FILES_writestr(cof1,'    LDGENMRULES_FT:= result',FILES_maxIO,0,left);
FILES_writeline(cof1,true);
FILES_writestr(cof1,'END;',FILES_maxIO,0,left);
FILES_writeline(cof1,true);
writeexportedcats;
END;

PROCEDURE writesubgrammarif;
VAR i,j,k,sg,m:INTEGER;
    kindstr:STR_string;
    int:FILES_IOrange;
    subgram1:subgram;
    entry1:pentry;
    param1:param;
    params:setofparams;
    table:setofentries;
    basetype,min,max,helpstr:STRING_string;
    kind:INTEGER;
    pair1:ppair;
  PROCEDURE skiprule(VAR if1:FILES_text);
  VAR str:STR_string;
     len1:FILES_iorange;
  BEGIN
  FILES_skipline(if1);
  FILES_skipline(if1);
  FILES_readstr(if1,str,len1);
  FILES_skipline(if1);
  WHILE str[1]<>'*' DO
   BEGIN
   FILES_skipline(if1);
   FILES_readstr(if1,str,len1);
   FILES_skipline(if1);
   END;
  END;

  PROCEDURE transducesubgramif(VAR if1:FILES_text;sg:INTEGER);
  VAR subgram1:subgram;
      string:STR_string;
      rule,transformation:BOOLEAN;
      number:INTEGER;
      pair1:ppair;
  PROCEDURE checkname(string:STR_string;int:STR_range;
           VAR rule,transformation:BOOLEAN;VAR number:INTEGER);
  VAR i:INTEGER;
      table:setofentries;
      entry1:pentry;
      found:BOOLEAN;
      ch:CHAR;
  BEGIN
  number:=8888;
  found:=FALSE;
  i:=0;
  table:=ruleinfotable;
  WHILE stillentries(table) and NOT(found) DO
    BEGIN
    i:=i+1;
    takeentry(entry1,table);
    STR_uppercase(entry1^.rulename,entry1^.length,entry1^.rulename,entry1^.length);
    STR_uppercase(string,int,string,int);
    found:=(STR_compare(entry1^.rulename,entry1^.length,string,int)=0);
    END;
  rule:=found;
  IF rule THEN number:=i;
  i:=0;
  table:=transinfotable;
  WHILE stillentries(table) and NOT(found) DO
    BEGIN
    i:=i+1;
    takeentry(entry1,table);
    STR_uppercase(entry1^.rulename,entry1^.length,entry1^.rulename,entry1^.length);
    STR_uppercase(string,int,string,int);
    found:=(STR_compare(entry1^.rulename,entry1^.length,string,int)=0);
    END;
  table:=filterinfotable;
  WHILE stillentries(table) and NOT(found) DO
    BEGIN
    i:=i+1;
    takeentry(entry1,table);
    STR_uppercase(entry1^.rulename,entry1^.length,entry1^.rulename,entry1^.length);
    STR_uppercase(string,int,string,int);
    found:=(STR_compare(entry1^.rulename,entry1^.length,string,int)=0);
    END;
  transformation:=NOT(rule) AND found;
  IF transformation THEN number:=i;
  IF not found THEN
    BEGIN
    error:=TRUE;
writeln('WARNING, rule ',string:int,' appears in subgrammar but is not defined');
    END;
  END;

  BEGIN {transduce the subgrammar graph construction function to module
         LDSUBGRAMMARS = file of4}
  FILES_readtoendofline(if1,string,int);
  IF sg>6 THEN
   BEGIN
   FILES_writestr(of4b,'',FILES_maxIO,0,left);
   FILES_writestr(of4a,' FUNCTION ',FILES_maxIO,0,left);
   FILES_writestr(of4a,string,int,int,left);
   FILES_writestr(of4a,':LDMRULES_pCtrlExpr;EXTERNAL;',FILES_maxIO,0,left);
   FILES_writeline(of4a,true);
   END;
  FILES_skipline(if1);
  FILES_readtoendofline(if1,string,int);
  WHILE string[1]<>'*' DO
    BEGIN
    IF sg>6 THEN
     BEGIN
     IF (STR_compare(string,int,'NAME:',5)<>0) THEN
       BEGIN
       FILES_writestr(of4b,string,int,int,left);
       FILES_writechar(of4b,' ');
       FILES_readtoendofline(if1,string,int);
       FILES_writestr(of4b,string,int,int,left);
       FILES_skipline(if1);FILES_writeline(of4b,true);
       END
     ELSE 
       BEGIN
       FILES_readchar(if1,ch);
       FILES_readtoendofline(if1,string,int);
       checkname(string,int,rule,transformation,number);
       if rule then 
          begin
          new(pair1);
          pair1^.rulenr:=number;
          pair1^.subgramnr:=sg;
          appendpair(pair1,subgramruletable);
          end;
       FILES_writestr(of4b,'result^.kind:=',FILES_maxIO,0,left);
       IF rule THEN FILES_writestr(of4b,'RULE;',FILES_maxIO,0,left)
       ELSE FILES_writestr(of4b,'TRANSFORMATION;',FILES_maxIO,0,left);
       FILES_writeline(of4b,true);
       IF rule THEN FILES_writestr(of4b,'result^.R:=',FILES_maxIO,0,left)
       ELSE FILES_writestr(of4b,'result^.T:=',FILES_maxIO,0,left);
       FILES_writeinteger(of4b,number,0,left);
       FILES_writechar(of4b,';');
       FILES_skipline(if1);
       FILES_writeline(of4b,true);
       END;
     END
    ELSE
     BEGIN
     IF (STR_compare(string,int,'NAME:',5)<>0) THEN
       BEGIN
       FILES_writestr(of4,string,int,int,left);
       FILES_writechar(of4,' ');
       FILES_readtoendofline(if1,string,int);
       FILES_writestr(of4,string,int,int,left);
       FILES_skipline(if1);FILES_writeline(of4,true);
       END
     ELSE 
       BEGIN
       FILES_readchar(if1,ch);
       FILES_readtoendofline(if1,string,int);
       checkname(string,int,rule,transformation,number);
       if rule then 
          begin
          new(pair1);
          pair1^.rulenr:=number;
          pair1^.subgramnr:=sg;
          appendpair(pair1,subgramruletable);
          end;
       FILES_writestr(of4,'result^.kind:=',FILES_maxIO,0,left);
       IF rule THEN FILES_writestr(of4,'RULE;',FILES_maxIO,0,left)
       ELSE FILES_writestr(of4,'TRANSFORMATION;',FILES_maxIO,0,left);
       FILES_writeline(of4,true);
       IF rule THEN FILES_writestr(of4,'result^.R:=',FILES_maxIO,0,left)
       ELSE FILES_writestr(of4,'result^.T:=',FILES_maxIO,0,left);
       FILES_writeinteger(of4,number,0,left);
       FILES_writechar(of4,';');
       FILES_skipline(if1);
       FILES_writeline(of4,true);
       END;
     END;
    FILES_readstr(if1,string,int);
    END;
  {skip head,export info:}
  FILES_skipline(if1);
  FILES_readstr(if1,string,int);
  FILES_skipline(if1);
  WHILE string[1]<>'*' DO
    BEGIN
    FILES_readstr(if1,string,int);
    FILES_skipline(if1);
    END;
  FILES_readstr(if1,string,int);
  FILES_skipline(if1);
  WHILE string[1]<>'*' DO
    BEGIN
    FILES_readstr(if1,string,int);
    FILES_skipline(if1);
    END;
  END;
BEGIN
subgraminfotable1:=subgraminfotable;
i:=0;
WHILE stillsubgrams(subgraminfotable1) DO
  BEGIN
  i:=i+1;
  takesubgram(subgram1,subgraminfotable1)
  END;
FILES_writestr(of4,'VAR ctrlexpr:ARRAY[1..',FILES_maxIO,0,left);
IF i>0 THEN
  BEGIN
  FILES_writeinteger(of4,i,0,left);
  END
ELSE FILES_writeinteger(of4,i+1,0,left);
FILES_writestr(of4,'] OF LDMRULES_pCtrlExpr;',FILES_maxIO,0,left);
FILES_writeline(of4,true);

FILES_writestr(of2,
' PROCEDURE LDMRULES_MakeCtrlExpr(VAR p:LDMRULES_pCtrlExpr);',
                                                FILES_maxIO,0,left);
FILES_writeline(of2,true);
FILES_writestr(of2,'BEGIN',FILES_maxIO,0,left);
FILES_writeline(of2,true);
FILES_writestr(of2,
'MEM_newdefault(loopholes.sizeof(LDMRULES_CtrlExpr),loopholes.retype(p,MEM_ptr));',FILES_maxIO,0,left);
FILES_writeline(of2,true);
FILES_writestr(of2,'END;',FILES_maxIO,0,left);
FILES_writeline(of2,true);

FILES_writestr(of2,
' PROCEDURE LDMRULES_MakeParamlist(VAR p:LDMRULES_paramlist);',
                                                FILES_maxIO,0,left);
FILES_writeline(of2,true);
FILES_writestr(of2,'BEGIN',FILES_maxIO,0,left);
FILES_writeline(of2,true);
FILES_writestr(of2,
'MEM_newdefault(loopholes.sizeof(LDMRULES_aramlist),loopholes.retype(p,MEM_ptr));',FILES_maxIO,0,left);
FILES_writeline(of2,true);
FILES_writestr(of2,'END;',FILES_maxIO,0,left);
FILES_writeline(of2,true);

FILES_writestr(of2,
' PROCEDURE LDMRULES_PrintParameters(w:WINDOWS_device;parameters:LDMRULES_liparameters);',
                                                FILES_maxIO,0,left);
FILES_writeline(of2,true);
FILES_writestr(of2,'VAR convlen:INTEGER;lsps:LSPARAMS_precord;',FILES_maxIO,0,left);
FILES_writeline(of2,true);
FILES_writestr(of2,'    p,attrstruct:LDCONVREC_pattrstruct;',FILES_maxIO,0,left);
FILES_writeline(of2,true);
FILES_writestr(of2,'    q:LDCONVREC_psetvaluetype;',FILES_maxIO,0,left);
FILES_writeline(of2,true);
table:=ruleinfotable;
j:=0;
WHILE stillentries(table) DO
  BEGIN
  j:=j+1;
  takeentry(entry1,table);
  params:=entry1^.params;
  k:=0;
  WHILE stillparams(params) DO
    BEGIN
    k:=k+1;
    takeparam(param1,params);
    STRING_constantempty(helpstr);
    m:=0;
    WHILE m<>param1.typelength DO
      BEGIN
      m:=m+1;
      STRING_appendchar(helpstr,helpstr,param1.typename[m]);
      LDSTRTOSTR_typeinfo(helpstr,kind,basetype,min,max);
      END;
    IF kind=5 THEN
      BEGIN
      FILES_writestr(of2,'val',FILES_maxIO,0,left);
      FILES_writeinteger(of2,j,0,left);
      FILES_writechar(of2,'X');
      FILES_writeinteger(of2,k,0,left);
      FILES_writestr(of2,':LSDOMAINT_',FILES_maxIO,0,left);
      FILES_writestring(of2,basetype,0,left);
      FILES_writechar(of2,';');
      FILES_writeline(of2,true);
      END;
    END;
END;
FILES_writestr(of2,'BEGIN',FILES_maxIO,0,left);
FILES_writeline(of2,true);
FILES_writestr(of2,'attrstruct:=NIL;',FILES_maxIO,0,left);
FILES_writeline(of2,true);
FILES_writestr(of2,'lsps:=loopholes.retype(parameters.ls,LSPARAMS_precord);',FILES_maxIO,0,left);
FILES_writeline(of2,true);
FILES_writestr(of2,'IF lsps<>NIL THEN',FILES_maxIO,0,left);
FILES_writeline(of2,true);
FILES_writestr(of2,'BEGIN',FILES_maxIO,0,left);
FILES_writeline(of2,true);
FILES_writestr(of2,'IF parameters.rulenr<0 THEN BEGIN',FILES_maxIO,0,left);
FILES_writeline(of2,true);
  FILES_writestr(of2,
'MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));',FILES_maxIO,0,left);
  FILES_writeline(of2,true);
  FILES_writestr(of2,' p^.nextattr:=attrstruct;',FILES_maxIO,0,left);
  FILES_writeline(of2,true);
  FILES_writestr(of2,' attrstruct:=p;',FILES_maxIO,0,left);
  FILES_writeline(of2,true);
  FILES_writestr(of2,' p^.setvalue:=NIL;',FILES_maxIO,0,left);
  FILES_writeline(of2,true);
  FILES_writestr(of2,' p^.typeindicator:=enumeration;',FILES_maxIO,0,left);
  FILES_writeline(of2,true);
  FILES_writestr(of2,' p^.fieldname.str:=''TRANSFORMATION'';',FILES_maxIO,0,left);
  FILES_writeline(of2,true);
  FILES_writestr(of2,' p^.fieldname.len:=14;',FILES_maxIO,0,left);
  FILES_writeline(of2,true);
  FILES_writestr(of2,'LDMRULES_transformationname(1,-parameters.rulenr',FILES_maxIO,0,left);
  FILES_writeline(of2,true);
  FILES_writestr(of2,',p^.fieldvalue.str,convlen);',FILES_maxIO,0,left);
  FILES_writeline(of2,true);
FILES_writestr(of2,'p^.fieldvalue.len:=convlen;',FILES_maxIO,0,left);
FILES_writeline(of2,true);
FILES_writestr(of2,'END;',FILES_maxIO,0,left);
FILES_writeline(of2,true);
IF stillentries(ruleinfotable) THEN
  BEGIN
  FILES_writestr(of2,'CASE parameters.rulenr OF',FILES_maxIO,0,left);
  FILES_writeline(of2,true);
  END;
table:=ruleinfotable;
j:=0;
WHILE stillentries(table) DO
  BEGIN
  j:=j+1;
  FILES_writeinteger(of2,j,0,left);
  FILES_writeline(of2,true);
  FILES_writestr(of2,':BEGIN',FILES_maxIO,0,left);
  FILES_writeline(of2,true);
  takeentry(entry1,table);
  params:=entry1^.params;
  k:=0;
  WHILE stillparams(params) DO
    BEGIN
    k:=k+1;
    takeparam(param1,params);
    FILES_writestr(of2,
'MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));',FILES_maxIO,0,left);
    FILES_writeline(of2,true);
    FILES_writestr(of2,' p^.nextattr:=attrstruct;',FILES_maxIO,0,left);
    FILES_writeline(of2,true);
    FILES_writestr(of2,' attrstruct:=p;',FILES_maxIO,0,left);
    FILES_writeline(of2,true);
    FILES_writestr(of2,' p^.setvalue:=NIL;',FILES_maxIO,0,left);
    FILES_writeline(of2,true);
    FILES_writestr(of2,' p^.typeindicator:=enumeration;',FILES_maxIO,0,left);
    FILES_writeline(of2,true);
    FILES_writestr(of2,' p^.fieldname.str:=''',FILES_maxIO,0,left);
    IF (STR_compare(param1.paramname,5,'LEVEL',5)<>0) THEN
      BEGIN
      STRING_constantempty(helpstr);
      m:=0;
      WHILE m<>param1.typelength DO
        BEGIN
        m:=m+1;
        STRING_appendchar(helpstr,helpstr,param1.typename[m]);
        END;
      LDSTRTOSTR_typeinfo(helpstr,kind,basetype,min,max);
      IF STR_compare(param1.typename,6,'SYNREL',6)=0 THEN kind:=1;
      IF STR_compare(param1.typename,7,'SYNTCAT',7)=0 THEN kind:=1;
      FILES_writestr(of2,param1.paramname,param1.paramlength,param1.paramlength,left);
      FILES_writestr(of2,''' ; p^.fieldname.len:=',FILES_maxIO,0,left);
      FILES_writeinteger(of2,param1.paramlength,0,left);
      FILES_writechar(of2,';');
      FILES_writeline(of2,true);
      IF (kind<>2) AND (kind<>5) AND (kind<>1) THEN
        BEGIN
        FILES_writestr(of2,'  LSTYPETOSTR_',FILES_maxIO,0,left);
        FILES_writestr(of2,param1.typename,param1.typelength,param1.typelength,left);
        FILES_writestr(of2,
         '(p^.fieldvalue.str,p^.fieldvalue.len,lsps^.',FILES_maxIO,0,left);
        FILES_writestr(of2,'X',FILES_maxIO,0,left);
        FILES_writeinteger(of2,j,0,left);
        FILES_writestr(of2,param1.paramname,param1.paramlength,param1.paramlength,left);
        FILES_writestr(of2,');',FILES_maxIO,0,left);
        FILES_writeline(of2,true);
        END
      ELSE
        BEGIN
        IF kind=1 THEN
          BEGIN
        FILES_writestr(of2,'  STR_integertostr',FILES_maxIO,0,left);
        IF (STR_compare(param1.typename,6,'SYNREL',6)=0) OR 
           (STR_compare(param1.typename,7,'SYNTCAT',7)=0) THEN
         FILES_writestr(of2,'(ORD(lsps^.',FILES_maxIO,0,left)
        ELSE
         FILES_writestr(of2,'(lsps^.',FILES_maxIO,0,left);
        FILES_writestr(of2,'X',FILES_maxIO,0,left);
        FILES_writeinteger(of2,j,0,left);
        FILES_writestr(of2,param1.paramname,param1.paramlength,param1.paramlength,left);
        IF (STR_compare(param1.typename,6,'SYNREL',6)=0) OR 
           (STR_compare(param1.typename,7,'SYNTCAT',7)=0)THEN
         FILES_writestr(of2,')',FILES_maxIO,0,left);
        FILES_writestr(of2,',p^.fieldvalue.str,p^.fieldvalue.len);',FILES_maxIO,0,left);
        FILES_writeline(of2,true);
          END;
        IF kind=2 THEN
          BEGIN
          FILES_writestr(of2,'IF lsps^.',FILES_maxIO,0,left);
          FILES_writestr(of2,'X',FILES_maxIO,0,left);
          FILES_writeinteger(of2,j,0,left);
          FILES_writestr(of2,param1.paramname,param1.paramlength,param1.paramlength,left);
          FILES_writestr(of2,' THEN',FILES_maxIO,0,left);
          FILES_writeline(of2,true);
          FILES_writestr(of2,'  BEGIN',FILES_maxIO,0,left);
          FILES_writeline(of2,true);
          FILES_writestr(of2,'  p^.fieldvalue.str:=''TRUE'';',FILES_maxIO,0,left);
          FILES_writeline(of2,true);
          FILES_writestr(of2,'  p^.fieldvalue.len:=4;',FILES_maxIO,0,left);
          FILES_writeline(of2,true);
          FILES_writestr(of2,'  END',FILES_maxIO,0,left);
          FILES_writeline(of2,true);
          FILES_writestr(of2,'ELSE',FILES_maxIO,0,left);
          FILES_writeline(of2,true);
          FILES_writestr(of2,'  BEGIN',FILES_maxIO,0,left);
          FILES_writeline(of2,true);
          FILES_writestr(of2,'  p^.fieldvalue.str:=''FALSE'';',FILES_maxIO,0,left);
          FILES_writeline(of2,true);
          FILES_writestr(of2,'  p^.fieldvalue.len:=5;',FILES_maxIO,0,left);
          FILES_writeline(of2,true);
          FILES_writestr(of2,'  END;',FILES_maxIO,0,left);
          FILES_writeline(of2,true);
          END;
        IF kind=5 THEN
          BEGIN
          FILES_writestr(of2,'p^.typeindicator:=enumset;',FILES_maxIO,0,left);
          FILES_writeline(of2,true);
          FILES_writestr(of2,'FOR ',FILES_maxIO,0,left);
          FILES_writestr(of2,'val',FILES_maxIO,0,left);
          FILES_writeinteger(of2,j,0,left);
          FILES_writechar(of2,'X');
          FILES_writeinteger(of2,k,0,left);
          FILES_writestr(of2,' := ',FILES_maxIO,0,left);
          FILES_writestring(of2,min,0,left);
          FILES_writestr(of2,' TO ',FILES_maxIO,0,left);
          FILES_writestring(of2,max,0,left);
          FILES_writestr(of2,' DO',FILES_maxIO,0,left);
          FILES_writeline(of2,true);
          FILES_writestr(of2,'  BEGIN',FILES_maxIO,0,left);
          FILES_writeline(of2,true);
          FILES_writestr(of2,'  IF val',FILES_maxIO,0,left);
          FILES_writeinteger(of2,j,0,left);
          FILES_writechar(of2,'X');
          FILES_writeinteger(of2,k,0,left);
          FILES_writestr(of2,' IN lsps^.',FILES_maxIO,0,left);
          FILES_writestr(of2,'X',FILES_maxIO,0,left);
          FILES_writeinteger(of2,j,0,left);
          FILES_writestr(of2,param1.paramname,param1.paramlength,param1.paramlength,left);
          FILES_writestr(of2,' THEN',FILES_maxIO,0,left);
          FILES_writeline(of2,true);
          FILES_writestr(of2,'    BEGIN',FILES_maxIO,0,left);
          FILES_writeline(of2,true);
          FILES_writestr(of2,'    new(q);',FILES_maxio,0,left);
          FILES_writeline(of2,true);
          FILES_writestr(of2,'    q^.nextvalue:=p^.setvalue;',FILES_maxio,0,left);
          FILES_writeline(of2,true);
          FILES_writestr(of2,'    p^.setvalue:=q;',FILES_maxio,0,left);
          FILES_writeline(of2,true);
          FILES_writestr(of2,'    LSTYPETOSTR_',FILES_maxIO,0,left);
          FILES_writestring(of2,basetype,0,left);
          FILES_writestr(of2,
            '(p^.setvalue^.eltvalue.str,p^.setvalue^.eltvalue.len,val',FILES_maxIO,0,left);
          FILES_writeinteger(of2,j,0,left);
          FILES_writechar(of2,'X');
          FILES_writeinteger(of2,k,0,left);
          FILES_writestr(of2,');',FILES_maxIO,0,left);
          FILES_writeline(of2,true);
          FILES_writestr(of2,'    END;',FILES_maxIO,0,left);
          FILES_writeline(of2,true);
          FILES_writestr(of2,'  END;',FILES_maxIO,0,left);
          FILES_writeline(of2,true);
          END;
        END
      END
    ELSE
      BEGIN
      FILES_writestr(of2,'LEVEL',5,5,left);
      FILES_writestr(of2,''' ; p^.fieldname.len:=5;',FILES_maxIO,0,left);
      FILES_writeline(of2,true);
      FILES_writestr(of2,'STR_integertostr(parameters.index',FILES_maxIO,0,left);
      FILES_writestr(of2,',p^.fieldvalue.str,p^.fieldvalue.len);',FILES_maxIO,0,left);
      FILES_writeline(of2,true);
      END;
    END;
  FILES_writestr(of2,
'MEM_newdefault(loopholes.sizeof(LDCONVREC_attrstruct),loopholes.retype(p,MEM_ptr));',FILES_maxIO,0,left);
  FILES_writeline(of2,true);
  FILES_writestr(of2,' p^.nextattr:=attrstruct;',FILES_maxIO,0,left);
  FILES_writeline(of2,true);
  FILES_writestr(of2,' attrstruct:=p;',FILES_maxIO,0,left);
  FILES_writeline(of2,true);
  FILES_writestr(of2,' p^.setvalue:=NIL;',FILES_maxIO,0,left);
  FILES_writeline(of2,true);
  FILES_writestr(of2,' p^.typeindicator:=enumeration;',FILES_maxIO,0,left);
  FILES_writeline(of2,true);
  FILES_writestr(of2,' p^.fieldname.str:=''RULE'';',FILES_maxIO,0,left);
  FILES_writeline(of2,true);
  FILES_writestr(of2,' p^.fieldname.len:=4;',FILES_maxIO,0,left);
  FILES_writeline(of2,true);
  FILES_writestr(of2,'LDMRULES_rulename(1,lsps^.rulenr',FILES_maxIO,0,left);
  FILES_writeline(of2,true);
  FILES_writestr(of2,',p^.fieldvalue.str,convlen);',FILES_maxIO,0,left);
  FILES_writeline(of2,true);
  FILES_writestr(of2,'p^.fieldvalue.len:=convlen;',FILES_maxIO,0,left);
  FILES_writeline(of2,true);
  FILES_writestr(of2,' END;',FILES_maxIO,0,left);
  FILES_writeline(of2,true);
  END;
IF stillentries(ruleinfotable) THEN
  BEGIN
  FILES_writestr(of2,'END;',FILES_maxIO,0,left);
  FILES_writeline(of2,true);
  END;
FILES_writestr(of2,'END;',FILES_maxIO,0,left);
FILES_writeline(of2,true);
FILES_writestr(of2,'LIRECTOSCREEN_write(w,attrstruct);',FILES_maxIO,0,left);
FILES_writeline(of2,true);
FILES_writestr(of2,'END;',FILES_maxIO,0,left);
FILES_writeline(of2,true);
table:=ruleinfotable;
i:=0;
FILES_writestr(of2,
' PROCEDURE LDMrules_Rulenumber(VAR R:LDMrules_ruleindex;',
                                                FILES_maxIO,0,left);
FILES_writeline(of2,true);
FILES_writestr(of2,
'const name:string;length:INTEGER);',FILES_maxIO,0,left);
FILES_writeline(of2,true);
FILES_writestr(of2,'BEGIN',FILES_maxIO,0,left);
FILES_writeline(of2,true);
WHILE stillentries(table) DO
  BEGIN
  i:=i+1;
  FILES_writestr(of2,'IF STR_compare(name,length,''',FILES_maxIO,0,left);
  takeentry(entry1,table);
  FILES_writestr(of2,entry1^.rulename,entry1^.length,entry1^.length,left);
  FILES_writestr(of2,''',',FILES_maxIO,0,left);
  FILES_writeinteger(of2,entry1^.length,0,left);
  FILES_writestr(of2,')=0 THEN',FILES_maxIO,0,left);
  FILES_writeline(of2,true);
  FILES_writestr(of2,'  R:=',FILES_maxIO,0,left);
  FILES_writeinteger(of2,i,0,left);
  FILES_writestr(of2,';',FILES_maxIO,0,left);
  FILES_writeline(of2,true);
  END;
FILES_writestr(of2,'END;',FILES_maxIO,0,left);
FILES_writeline(of2,true);
table:=transinfotable;
i:=0;
FILES_writestr(of2,
' PROCEDURE LDMrules_Transformationnumber(VAR R:LDMrules_transformationindex;',
                                                FILES_maxIO,0,left);
FILES_writeline(of2,true);
FILES_writestr(of2,
'const name:string;length:INTEGER);',FILES_maxIO,0,left);
FILES_writeline(of2,true);
FILES_writestr(of2,'BEGIN',FILES_maxIO,0,left);
FILES_writeline(of2,true);
WHILE stillentries(table) DO
  BEGIN
  i:=i+1;
  FILES_writestr(of2,'IF STR_compare(name,length,''',FILES_maxIO,0,left);
  takeentry(entry1,table);
  FILES_writestr(of2,entry1^.rulename,entry1^.length,entry1^.length,left);
  FILES_writestr(of2,''',',FILES_maxIO,0,left);
  FILES_writeinteger(of2,entry1^.length,0,left);
  FILES_writestr(of2,')=0 THEN',FILES_maxIO,0,left);
  FILES_writeline(of2,true);
  FILES_writestr(of2,'  R:=',FILES_maxIO,0,left);
  FILES_writeinteger(of2,i,0,left);
  FILES_writestr(of2,';',FILES_maxIO,0,left);
  FILES_writeline(of2,true);
  END;
maxtrans:=i;
table:=filterinfotable;
WHILE stillentries(table) DO
  BEGIN
  i:=i+1;
  FILES_writestr(of2,'IF STR_compare(name,length,''',FILES_maxIO,0,left);
  takeentry(entry1,table);
  FILES_writestr(of2,entry1^.rulename,entry1^.length,entry1^.length,left);
  FILES_writestr(of2,''',',FILES_maxIO,0,left);
  FILES_writeinteger(of2,entry1^.length,0,left);
  FILES_writestr(of2,')=0 THEN',FILES_maxIO,0,left);
  FILES_writeline(of2,true);
  FILES_writestr(of2,'  R:=',FILES_maxIO,0,left);
  FILES_writeinteger(of2,i,0,left);
  FILES_writestr(of2,';',FILES_maxIO,0,left);
  FILES_writeline(of2,true);
  END;
FILES_writestr(of2,'END;',FILES_maxIO,0,left);
FILES_writeline(of2,true);
table:=ruleinfotable;
i:=0;
FILES_writestr(of2,
' PROCEDURE LDMrules_Rulename(sg:LDMrules_subgrammarindex;R:LDMrules_ruleindex;',
                                                FILES_maxIO,0,left);
FILES_writeline(of2,true);
FILES_writestr(of2,
'VAR name:string;VAR length:INTEGER);',FILES_maxIO,0,left);
FILES_writeline(of2,true);
FILES_writestr(of2,'BEGIN',FILES_maxIO,0,left);
FILES_writeline(of2,true);
IF stillentries(ruleinfotable) THEN
  BEGIN
  FILES_writestr(of2,'CASE R OF',FILES_maxIO,0,left);
  FILES_writeline(of2,true);
  END;
WHILE stillentries(table) DO
  BEGIN
  i:=i+1;
  FILES_writeinteger(of2,i,0,left);
  FILES_writestr(of2,': BEGIN name:=''',FILES_maxIO,0,left);
  takeentry(entry1,table);
  FILES_writestr(of2,entry1^.rulename,entry1^.length,entry1^.length,left);
  FILES_writestr(of2,''';',FILES_maxIO,0,left);
  FILES_writeline(of2,true);
  FILES_writestr(of2,'    length:=',FILES_maxIO,0,left);
  FILES_writeinteger(of2,entry1^.length,0,left);
  FILES_writestr(of2,' END;',FILES_maxIO,0,left);
  FILES_writeline(of2,true);
  END;
IF stillentries(ruleinfotable) THEN
  BEGIN
  FILES_writestr(of2,'END;',FILES_maxIO,0,left);
  FILES_writeline(of2,true);
  END;
FILES_writestr(of2,'END;',FILES_maxIO,0,left);
FILES_writeline(of2,true);
table:=transinfotable;
i:=0;
FILES_writestr(of2,
' FUNCTION LDMrules_IsFilter(',FILES_maxIO,0,left);
FILES_writeline(of2,true);
FILES_writestr(of2,'T:LDMrules_transformationindex):BOOLEAN;',FILES_maxIO,0,left);
FILES_writeline(of2,true);
FILES_writestr(of2,'BEGIN',FILES_maxIO,0,left);
FILES_writeline(of2,true);
FILES_writestr(of2,'LDMRULES_IsFilter:=(T>',FILES_maxIO,0,left);
FILES_writeinteger(of2,maxtrans,0,left);
FILES_writestr(of2,')',FILES_maxIO,0,left);
FILES_writeline(of2,true);
FILES_writestr(of2,'END;',FILES_maxIO,0,left);
FILES_writeline(of2,true);
FILES_writestr(of2,
' PROCEDURE LDMrules_Transformationname(sg:LDMrules_subgrammarindex;',
                                                FILES_maxIO,0,left);
FILES_writeline(of2,true);
FILES_writestr(of2,
'T:LDMrules_transformationindex;VAR name:string;VAR length:INTEGER);',FILES_maxIO,0,left);
FILES_writeline(of2,true);
FILES_writestr(of2,'BEGIN',FILES_maxIO,0,left);
FILES_writeline(of2,true);
IF stillentries(transinfotable) OR stillentries(filterinfotable) THEN
  BEGIN
FILES_writestr(of2,'CASE T OF',FILES_maxIO,0,left);
FILES_writeline(of2,true);
  END;
WHILE stillentries(table) DO
  BEGIN
  i:=i+1;
  FILES_writeinteger(of2,i,0,left);
  FILES_writestr(of2,': BEGIN name:=''',FILES_maxIO,0,left);
  takeentry(entry1,table);
  FILES_writestr(of2,entry1^.rulename,entry1^.length,entry1^.length,left);
  FILES_writestr(of2,''';',FILES_maxIO,0,left);
  FILES_writeline(of2,true);
  FILES_writestr(of2,'    length:=',FILES_maxIO,0,left);
  FILES_writeinteger(of2,entry1^.length,0,left);
  FILES_writestr(of2,' END;',FILES_maxIO,0,left);
  FILES_writeline(of2,true);
  END;
table:=filterinfotable;
WHILE stillentries(table) DO
  BEGIN
  i:=i+1;
  FILES_writeinteger(of2,i,0,left);
  FILES_writestr(of2,': BEGIN name:=''',FILES_maxIO,0,left);
  takeentry(entry1,table);
  FILES_writestr(of2,entry1^.rulename,entry1^.length,entry1^.length,left);
  FILES_writestr(of2,''';',FILES_maxIO,0,left);
  FILES_writeline(of2,true);
  FILES_writestr(of2,'    length:=',FILES_maxIO,0,left);
  FILES_writeinteger(of2,entry1^.length,0,left);
  FILES_writestr(of2,' END;',FILES_maxIO,0,left);
  FILES_writeline(of2,true);
  END;
IF stillentries(transinfotable) OR stillentries(filterinfotable) THEN
  BEGIN
  FILES_writestr(of2,'END;',FILES_maxIO,0,left);
  FILES_writeline(of2,true);
  END;
FILES_writestr(of2,'END;',FILES_maxIO,0,left);
FILES_writeline(of2,true);
subgraminfotable1:=subgraminfotable;
i:=0;
FILES_writestr(of2,
' PROCEDURE LDMrules_subgrammarname(sg:LDMrules_subgrammarindex;',
                                                FILES_maxIO,0,left);
FILES_writeline(of2,true);
FILES_writestr(of2,
'VAR name:string;VAR length:INTEGER);',FILES_maxIO,0,left);
FILES_writeline(of2,true);
FILES_writestr(of2,'BEGIN',FILES_maxIO,0,left);
FILES_writeline(of2,true);
IF stillsubgrams(subgraminfotable) THEN
  BEGIN
  FILES_writestr(of2,'CASE sg OF',FILES_maxIO,0,left);
  FILES_writeline(of2,true);
  END;
WHILE stillsubgrams(subgraminfotable1) DO
  BEGIN
  i:=i+1;
  FILES_writeinteger(of2,i,0,left);
  FILES_writestr(of2,': BEGIN name:=''',FILES_maxIO,0,left);
  takesubgram(subgram1,subgraminfotable1);
  FILES_writestr(of2,subgram1.subgramname,subgram1.namelength,subgram1.namelength,left);
  FILES_writestr(of2,''';',FILES_maxIO,0,left);
  FILES_writeline(of2,true);
  FILES_writestr(of2,'    length:=',FILES_maxIO,0,left);
  FILES_writeinteger(of2,subgram1.namelength,0,left);
  FILES_writestr(of2,' END;',FILES_maxIO,0,left);
  FILES_writeline(of2,true);
  END;
IF stillsubgrams(subgraminfotable) THEN
  BEGIN
  FILES_writestr(of2,'END;',FILES_maxIO,0,left);
  FILES_writeline(of2,true);
  END;
FILES_writestr(of2,'END;',FILES_maxIO,0,left);
FILES_writeline(of2,true);
FILES_writestr(of2,
' FUNCTION LDMrules_MinSubgrammarIndex:LDMrules_Subgrammarindex;',
                                                FILES_maxIO,0,left);
FILES_writeline(of2,true);
FILES_writestr(of2,'BEGIN',FILES_maxIO,0,left);
FILES_writeline(of2,true);
FILES_writestr(of2,'LDMrules_MinSubgrammarIndex:=1',FILES_maxIO,0,left);
FILES_writeline(of2,true);
FILES_writestr(of2,'END;',FILES_maxIO,0,left);
FILES_writeline(of2,true);
FILES_writestr(of2,
' FUNCTION LDMrules_MaxSubgrammarIndex:LDMrules_Subgrammarindex;',
                                                FILES_maxIO,0,left);
FILES_writeline(of2,true);
FILES_writestr(of2,'BEGIN',FILES_maxIO,0,left);
FILES_writeline(of2,true);
FILES_writestr(of2,'LDMrules_MaxSubgrammarIndex:=',FILES_maxIO,0,left);
FILES_writeinteger(of2,i,0,left);
FILES_writeline(of2,true);
FILES_writestr(of2,'END;',FILES_maxIO,0,left);
FILES_writeline(of2,true);

FILES_writestr(of2,
' PROCEDURE LDMrules_TheCtrlExpr(sg:LDMrules_SubgrammarIndex;VAR ce:LDMRULES_CtrlExpr);'
                                                ,FILES_maxIO,0,left);
FILES_writeline(of2,true);
FILES_writestr(of2,'BEGIN',FILES_maxIO,0,left);
FILES_writeline(of2,true);
FILES_writestr(of2,'LDSUBGRAMMARS_TheCtrlExpr(sg,ce);',FILES_maxIO,0,left);
FILES_writeline(of2,true);
FILES_writestr(of2,'END;',FILES_maxIO,0,left);
FILES_writeline(of2,true);

FILES_writestr(of4,
' PROCEDURE LDsubgrammars_TheCtrlExpr(sg:LDMrules_SubgrammarIndex;VAR ce:LDMRULES_CtrlExpr);'
                                                ,FILES_maxIO,0,left);
FILES_writeline(of4,true);
FILES_writestr(of4,'BEGIN',FILES_maxIO,0,left);
FILES_writeline(of4,true);
FILES_writestr(of4,'ce:=ctrlexpr[sg]^',FILES_maxIO,0,left);
FILES_writeline(of4,true);
FILES_writestr(of4,'END;',FILES_maxIO,0,left);
FILES_writeline(of4,true);


FILES_writestr(of4,'PROCEDURE initctrlexprlst(VAR C:LDMRULES_pCtrlExpr);',FILES_maxIO,0,left);
FILES_writeline(of4,true);
FILES_writestr(of4,'BEGIN',FILES_maxIO,0,left);
FILES_writeline(of4,true);
FILES_writestr(of4,'C^.left:=NIL;C^.right:=NIL;',FILES_maxIO,0,left);
FILES_writeline(of4,true);
FILES_writestr(of4,'END;',FILES_maxIO,0,left);
FILES_writeline(of4,true);

FILES_writestr(of4,'PROCEDURE appendctrlexpr(C1:LDMRULES_pCtrlExpr;VAR C2:LDMRULES_pCtrlExpr);',FILES_maxIO,0,left);
FILES_writeline(of4,true);
FILES_writestr(of4,'VAR p:LDMRULES_pCTRlExprLst;',FILES_maxIO,0,left);
FILES_writeline(of4,true);
FILES_writestr(of4,'BEGIN',FILES_maxIO,0,left);
FILES_writeline(of4,true);
FILES_writestr(of4,
'MEM_newdefault(loopholes.sizeof(LDMRULES_CtrlExprLst),loopholes.retype(p,MEM_ptr));',FILES_maxIO,0,left);
FILES_writeline(of4,true);
FILES_writestr(of4,'IF C2^.left=NIL THEN',FILES_maxIO,0,left);
FILES_writeline(of4,true);
FILES_writestr(of4,'  BEGIN',FILES_maxIO,0,left);
FILES_writeline(of4,true);
FILES_writestr(of4,'  C2^.left:=p;C2^.right:=p;p^.left:=NIL;p^.right:=NIL;p^.ce:=C1^;',FILES_maxIO,0,left);
FILES_writeline(of4,true);
FILES_writestr(of4,'  END',FILES_maxIO,0,left);
FILES_writeline(of4,true);
FILES_writestr(of4,'ELSE',FILES_maxIO,0,left);
FILES_writeline(of4,true);
FILES_writestr(of4,'  BEGIN',FILES_maxIO,0,left);
FILES_writeline(of4,true);
FILES_writestr(of4,'  C2^.right^.right:=p;',FILES_maxIO,0,left);
FILES_writeline(of4,true);
FILES_writestr(of4,'  p^.left:=C2^.right;',FILES_maxIO,0,left);
FILES_writeline(of4,true);
FILES_writestr(of4,'  C2^.right:=p;',FILES_maxIO,0,left);
FILES_writeline(of4,true);
FILES_writestr(of4,'  p^.right:=NIL;',FILES_maxIO,0,left);
FILES_writeline(of4,true);
FILES_writestr(of4,'  p^.ce:=C1^;',FILES_maxIO,0,left);
FILES_writeline(of4,true);
FILES_writestr(of4,'  END',FILES_maxIO,0,left);
FILES_writeline(of4,true);
FILES_writestr(of4,'END;',FILES_maxIO,0,left);
FILES_writeline(of4,true);


FILES_writestr(of4b,'PROCEDURE initctrlexprlst(VAR C:LDMRULES_pCtrlExpr);',FILES_maxIO,0,left);
FILES_writeline(of4b,true);
FILES_writestr(of4b,'BEGIN',FILES_maxIO,0,left);
FILES_writeline(of4b,true);
FILES_writestr(of4b,'C^.left:=NIL;C^.right:=NIL;',FILES_maxIO,0,left);
FILES_writeline(of4b,true);
FILES_writestr(of4b,'END;',FILES_maxIO,0,left);
FILES_writeline(of4b,true);

FILES_writestr(of4b,'PROCEDURE appendctrlexpr(C1:LDMRULES_pCtrlExpr;VAR C2:LDMRULES_pCtrlExpr);',FILES_maxIO,0,left);
FILES_writeline(of4b,true);
FILES_writestr(of4b,'VAR p:LDMRULES_pCTRlExprLst;',FILES_maxIO,0,left);
FILES_writeline(of4b,true);
FILES_writestr(of4b,'BEGIN',FILES_maxIO,0,left);
FILES_writeline(of4b,true);
FILES_writestr(of4b,
'MEM_newdefault(loopholes.sizeof(LDMRULES_CtrlExprLst),loopholes.retype(p,MEM_ptr));',FILES_maxIO,0,left);
FILES_writeline(of4b,true);
FILES_writestr(of4b,'IF C2^.left=NIL THEN',FILES_maxIO,0,left);
FILES_writeline(of4b,true);
FILES_writestr(of4b,'  BEGIN',FILES_maxIO,0,left);
FILES_writeline(of4b,true);
FILES_writestr(of4b,'  C2^.left:=p;C2^.right:=p;p^.left:=NIL;p^.right:=NIL;p^.ce:=C1^;',FILES_maxIO,0,left);
FILES_writeline(of4b,true);
FILES_writestr(of4b,'  END',FILES_maxIO,0,left);
FILES_writeline(of4b,true);
FILES_writestr(of4b,'ELSE',FILES_maxIO,0,left);
FILES_writeline(of4b,true);
FILES_writestr(of4b,'  BEGIN',FILES_maxIO,0,left);
FILES_writeline(of4b,true);
FILES_writestr(of4b,'  C2^.right^.right:=p;',FILES_maxIO,0,left);
FILES_writeline(of4b,true);
FILES_writestr(of4b,'  p^.left:=C2^.right;',FILES_maxIO,0,left);
FILES_writeline(of4b,true);
FILES_writestr(of4b,'  C2^.right:=p;',FILES_maxIO,0,left);
FILES_writeline(of4b,true);
FILES_writestr(of4b,'  p^.right:=NIL;',FILES_maxIO,0,left);
FILES_writeline(of4b,true);
FILES_writestr(of4b,'  p^.ce:=C1^;',FILES_maxIO,0,left);
FILES_writeline(of4b,true);
FILES_writestr(of4b,'  END',FILES_maxIO,0,left);
FILES_writeline(of4b,true);
FILES_writestr(of4b,'END;',FILES_maxIO,0,left);
FILES_writeline(of4b,true);


FILES_writestr(of2,' PROCEDURE LDMrules_Init;',FILES_maxIO,0,left);
FILES_writeline(of2,true);
FILES_writestr(of4,' PROCEDURE LDsubgrammars_Init;',FILES_maxIO,0,left);
FILES_writeline(of4,true);
initsetofpairs(subgramruletable);
i:=0;
sg:=0;
WHILE i<>numofmrulefiles DO
  BEGIN
  i:=i+1;
  CASE i OF
  1: FILES_open(ifi[i],'inputfile1',10,1);
  2: FILES_open(ifi[i],'inputfile2',10,1);
  3: FILES_open(ifi[i],'inputfile3',10,1);
  4: FILES_open(ifi[i],'inputfile4',10,1);
  5: FILES_open(ifi[i],'inputfile5',10,1);
  6: FILES_open(ifi[i],'inputfile6',10,1);
  7: FILES_open(ifi[i],'inputfile7',10,1);
  8: FILES_open(ifi[i],'inputfile8',10,1);
  9: FILES_open(ifi[i],'inputfile9',10,1);
 10: FILES_open(ifi[i],'inputfile10',11,1);
 11: FILES_open(ifi[i],'inputfile11',11,1);
 12: FILES_open(ifi[i],'inputfile12',11,1);
 13: FILES_open(ifi[i],'inputfile13',11,1);
 14: FILES_open(ifi[i],'inputfile14',11,1);
 15: FILES_open(ifi[i],'inputfile15',11,1);
 16: FILES_open(ifi[i],'inputfile16',11,1);
 17: FILES_open(ifi[i],'inputfile17',11,1);
 18: FILES_open(ifi[i],'inputfile18',11,1);
 19: FILES_open(ifi[i],'inputfile19',11,1);
 20: FILES_open(ifi[i],'inputfile20',11,1);
 21: FILES_open(ifi[i],'inputfile21',11,1);
 22: FILES_open(ifi[i],'inputfile22',11,1);
 23: FILES_open(ifi[i],'inputfile23',11,1);
 24: FILES_open(ifi[i],'inputfile24',11,1);
 25: FILES_open(ifi[i],'inputfile25',11,1);
 26: FILES_open(ifi[i],'inputfile26',11,1);
 27: FILES_open(ifi[i],'inputfile27',11,1);
 28: FILES_open(ifi[i],'inputfile28',11,1);
 29: FILES_open(ifi[i],'inputfile29',11,1);
 30: FILES_open(ifi[i],'inputfile30',11,1);
 31: FILES_open(ifi[i],'inputfile31',11,1);
 32: FILES_open(ifi[i],'inputfile32',11,1);
 33: FILES_open(ifi[i],'inputfile33',11,1);
 34: FILES_open(ifi[i],'inputfile34',11,1);
 35: FILES_open(ifi[i],'inputfile35',11,1);
 36: FILES_open(ifi[i],'inputfile36',11,1);
 37: FILES_open(ifi[i],'inputfile37',11,1);
 38: FILES_open(ifi[i],'inputfile38',11,1);
 39: FILES_open(ifi[i],'inputfile39',11,1);
 40: FILES_open(ifi[i],'inputfile40',11,1);
 41: FILES_open(ifi[i],'inputfile41',11,1);
 42: FILES_open(ifi[i],'inputfile42',11,1);
 43: FILES_open(ifi[i],'inputfile43',11,1);
 44: FILES_open(ifi[i],'inputfile44',11,1);
 45: FILES_open(ifi[i],'inputfile45',11,1);
 46: FILES_open(ifi[i],'inputfile46',11,1);
 47: FILES_open(ifi[i],'inputfile47',11,1);
 48: FILES_open(ifi[i],'inputfile48',11,1);
 49: FILES_open(ifi[i],'inputfile49',11,1);
 50: FILES_open(ifi[i],'inputfile50',11,1);
 51: FILES_open(ifi[i],'inputfile51',11,1);
 52: FILES_open(ifi[i],'inputfile52',11,1);
 53: FILES_open(ifi[i],'inputfile53',11,1);
 54: FILES_open(ifi[i],'inputfile54',11,1);
 55: FILES_open(ifi[i],'inputfile55',11,1);
 56: FILES_open(ifi[i],'inputfile56',11,1);
 57: FILES_open(ifi[i],'inputfile57',11,1);
 58: FILES_open(ifi[i],'inputfile58',11,1);
 59: FILES_open(ifi[i],'inputfile59',11,1);
 60: FILES_open(ifi[i],'inputfile60',11,1);
 61: FILES_open(ifi[i],'inputfile61',11,1);
 62: FILES_open(ifi[i],'inputfile62',11,1);
 63: FILES_open(ifi[i],'inputfile63',11,1);
 64: FILES_open(ifi[i],'inputfile64',11,1);
 65: FILES_open(ifi[i],'inputfile65',11,1);
 66: FILES_open(ifi[i],'inputfile66',11,1);
 67: FILES_open(ifi[i],'inputfile67',11,1);
 68: FILES_open(ifi[i],'inputfile68',11,1);
 69: FILES_open(ifi[i],'inputfile69',11,1);
 70: FILES_open(ifi[i],'inputfile70',11,1);
 71: FILES_open(ifi[i],'inputfile71',11,1);
 72: FILES_open(ifi[i],'inputfile72',11,1);
 73: FILES_open(ifi[i],'inputfile73',11,1);
 74: FILES_open(ifi[i],'inputfile74',11,1);
 75: FILES_open(ifi[i],'inputfile75',11,1);
 76: FILES_open(ifi[i],'inputfile76',11,1);
 77: FILES_open(ifi[i],'inputfile77',11,1);
 78: FILES_open(ifi[i],'inputfile78',11,1);
 79: FILES_open(ifi[i],'inputfile79',11,1);
 80: FILES_open(ifi[i],'inputfile80',11,1);
 81: FILES_open(ifi[i],'inputfile81',11,1);
 82: FILES_open(ifi[i],'inputfile82',11,1);
 83: FILES_open(ifi[i],'inputfile83',11,1);
 84: FILES_open(ifi[i],'inputfile84',11,1);
 85: FILES_open(ifi[i],'inputfile85',11,1);
 86: FILES_open(ifi[i],'inputfile86',11,1);
 87: FILES_open(ifi[i],'inputfile87',11,1);
 88: FILES_open(ifi[i],'inputfile88',11,1);
 89: FILES_open(ifi[i],'inputfile89',11,1);
 90: FILES_open(ifi[i],'inputfile90',11,1);
 91: FILES_open(ifi[i],'inputfile91',11,1);
 92: FILES_open(ifi[i],'inputfile92',11,1);
 93: FILES_open(ifi[i],'inputfile93',11,1);
 94: FILES_open(ifi[i],'inputfile94',11,1);
 95: FILES_open(ifi[i],'inputfile95',11,1);
 96: FILES_open(ifi[i],'inputfile96',11,1);
 97: FILES_open(ifi[i],'inputfile97',11,1);
 98: FILES_open(ifi[i],'inputfile98',11,1);
 99: FILES_open(ifi[i],'inputfile99',11,1);
 100: FILES_open(ifi[i],'inputfile100',12,1);
 101: FILES_open(ifi[i],'inputfile101',12,1);
 102: FILES_open(ifi[i],'inputfile102',12,1);
 103: FILES_open(ifi[i],'inputfile103',12,1);
 104: FILES_open(ifi[i],'inputfile104',12,1);
 105: FILES_open(ifi[i],'inputfile105',12,1);
 106: FILES_open(ifi[i],'inputfile106',12,1);
 107: FILES_open(ifi[i],'inputfile107',12,1);
 108: FILES_open(ifi[i],'inputfile108',12,1);
 109: FILES_open(ifi[i],'inputfile109',12,1);
 110: FILES_open(ifi[i],'inputfile110',12,1);
 111: FILES_open(ifi[i],'inputfile111',12,1);
 112: FILES_open(ifi[i],'inputfile112',12,1);
 113: FILES_open(ifi[i],'inputfile113',12,1);
 114: FILES_open(ifi[i],'inputfile114',12,1);
 115: FILES_open(ifi[i],'inputfile115',12,1);
 116: FILES_open(ifi[i],'inputfile116',12,1);
 117: FILES_open(ifi[i],'inputfile117',12,1);
 118: FILES_open(ifi[i],'inputfile118',12,1);
 119: FILES_open(ifi[i],'inputfile119',12,1);
 120: FILES_open(ifi[i],'inputfile120',12,1);
 121: FILES_open(ifi[i],'inputfile121',12,1);
 122: FILES_open(ifi[i],'inputfile122',12,1);
 123: FILES_open(ifi[i],'inputfile123',12,1);
 124: FILES_open(ifi[i],'inputfile124',12,1);
 125: FILES_open(ifi[i],'inputfile125',12,1);
 126: FILES_open(ifi[i],'inputfile126',12,1);
 127: FILES_open(ifi[i],'inputfile127',12,1);
 128: FILES_open(ifi[i],'inputfile128',12,1);
 129: FILES_open(ifi[i],'inputfile129',12,1);
 130: FILES_open(ifi[i],'inputfile130',12,1);
 131: FILES_open(ifi[i],'inputfile131',12,1);
 132: FILES_open(ifi[i],'inputfile132',12,1);
 133: FILES_open(ifi[i],'inputfile133',12,1);
 134: FILES_open(ifi[i],'inputfile134',12,1);
 135: FILES_open(ifi[i],'inputfile135',12,1);
 136: FILES_open(ifi[i],'inputfile136',12,1);
 137: FILES_open(ifi[i],'inputfile137',12,1);
 138: FILES_open(ifi[i],'inputfile138',12,1);
 139: FILES_open(ifi[i],'inputfile139',12,1);
 140: FILES_open(ifi[i],'inputfile140',12,1);
  END;
  IF FILES_done THEN
    BEGIN
    FILES_skipline(ifi[i]);
    WHILE findinfo(ifi[i]) DO
      BEGIN
      FILES_readstr(ifi[i],kindstr,int);
      FILES_skipline(ifi[i]);
      If int=4 THEN skiprule(ifi[i]);
      IF (int=10) THEN
        BEGIN
        sg:=sg+1;
        transducesubgramif(ifi[i],sg);
        END;
      END;
    FILES_close(ifi[i]);
    END;
  END;
FILES_writestr(of2,'BEGIN',FILES_maxIO,0,left);
FILES_writeline(of2,true);
FILES_writestr(of4,'BEGIN',FILES_maxIO,0,left);
FILES_writeline(of4,true);
subgraminfotable1:=subgraminfotable;
i:=0;
WHILE stillsubgrams(subgraminfotable1) DO
  BEGIN
  takesubgram(subgram1,subgraminfotable1);
  i:=i+1;
  FILES_writestr(of4,'  CtrlExpr[',FILES_maxIO,0,left);
  FILES_writeinteger(of4,i,0,left);
  FILES_writestr(of4,']:=',FILES_maxIO,0,left);
  FILES_writestr(of4,subgram1.subgramname,subgram1.namelength,
                                 subgram1.namelength,left);
  FILES_writechar(of4,';');
  FILES_writeline(of4,true);
  END;
FILES_writestr(of2,'LDSUBGRAMMARS_init;',FILES_maxIO,0,left);
FILES_writeline(of2,true);
FILES_writestr(of2,'LSMRUQUO_init;',FILES_maxIO,0,left);
FILES_writeline(of2,true);
FILES_writestr(of2,'END;',FILES_maxIO,0,left);
FILES_writeline(of2,true);
FILES_writestr(of4,'END;',FILES_maxIO,0,left);
FILES_writeline(of4,true);

FILES_writestr(of2,' PROCEDURE LDMRULES_subgrammarnumber(',FILES_maxIO,0,left);
FILES_writeline(of2,true);
FILES_writestr(of2,'R1:LDMRULES_RuleIndex;VAR R2:LDMRULES_SubgrammarIndex);',
                                                FILES_maxIO,0,left);
FILES_writeline(of2,true);
subgramruletable1:=subgramruletable;
FILES_writestr(of2,'BEGIN',FILES_maxIO,0,left);
FILES_writeline(of2,true);
FILES_writestr(of2,'CASE R1 OF',FILES_maxIO,0,left);
FILES_writeline(of2,true);
WHILE stillpairs(subgramruletable1) DO
  BEGIN
  takepair(pair1,subgramruletable1);
  FILES_writeinteger(of2,pair1^.rulenr,0,left);
  FILES_writestr(of2,': R2:=',FILES_maxIO,0,left);
  FILES_writeinteger(of2,pair1^.subgramnr,0,left);
  FILES_writechar(of2,';');
  FILES_writeline(of2,true);
  END;
FILES_writestr(of2,'END;{CASE}',FILES_maxIO,0,left);
FILES_writeline(of2,true);
FILES_writestr(of2,'END;',FILES_maxIO,0,left);
FILES_writeline(of2,true);

FILES_writestr(of2,' PROCEDURE LDMRULES_ruleparameters(',FILES_maxIO,0,left);
FILES_writeline(of2,true);
FILES_writestr(of2,'R:LDMRULES_ruleindex;VAR params:LDMRULES_paramlist);',FILES_maxIO,0,left);
FILES_writeline(of2,true);
FILES_writestr(of2,'VAR paramlist,p:LDMRULES_paramlist;',FILES_maxio,0,left);
FILES_writeline(of2,true);
table:=ruleinfotable;
FILES_writestr(of2,'BEGIN',FILES_maxIO,0,left);
FILES_writeline(of2,true);
FILES_writestr(of2,'paramlist:=NIL;',FILES_maxIO,0,left);
FILES_writeline(of2,true);
i:=0;
FILES_writestr(of2,'CASE R OF',FILES_maxIO,0,left);
FILES_writeline(of2,true);
WHILE stillentries(table) DO
  BEGIN
  i:=i+1;
  takeentry(entry1,table);
  params:=entry1^.params;
  FILES_writeinteger(of2,i,0,left);
  FILES_writestr(of2,': BEGIN',FILES_maxIO,0,left);
  FILES_writeline(of2,true);
  while stillparams(params) do
    begin
    takeparam(param1,params);
    FILES_writestr(of2,'LDMRULES_makeparamlist(p);',FILES_maxIO,0,left);
    FILES_writeline(of2,true);
    FILES_writestr(of2,'p^.paramname:=''',FILES_maxIO,0,left);
    FILES_writestr(of2,param1.paramname,param1.paramlength,param1.paramlength,left);
    FILES_writestr(of2,''';',FILES_maxIO,0,left);
    FILES_writeline(of2,true);
    FILES_writestr(of2,'p^.length:=',FILES_maxIO,0,left);
    FILES_writeinteger(of2,param1.paramlength,0,left);
    FILES_writechar(of2,';');
    FILES_writeline(of2,true);
    FILES_writestr(of2,'p^.next:=paramlist;',FILES_maxio,0,left);
    FILES_writeline(of2,true);
    FILES_writestr(of2,'paramlist:=p;',FILES_maxio,0,left);
    end;
  FILES_writeline(of2,true);
  FILES_writestr(of2,'  END;',FILES_maxIO,0,left);
  FILES_writeline(of2,true);
  END;
FILES_writestr(of2,'END{CASE};',FILES_maxIO,0,left);
FILES_writeline(of2,true);
FILES_writestr(of2,'params:=paramlist;',FILES_maxIO,0,left);
FILES_writeline(of2,true);
FILES_writestr(of2,'END;',FILES_maxIO,0,left);
FILES_writeline(of2,true);

END;


BEGIN 
error:=FALSE;
   reset(LogName);
   LogName_Init(LogName);
FILES_open(ifi[1],'inputfile1',10,1);
FILES_open(cof1,'comfile',7,3);
FILES_open(decof1,'decomfile',9,3);
FILES_open(of2,'commonfile',10,3);
FILES_open(of4,'subgramfile',11,3);
FILES_open(of4a,'helpsubgramenv',14,3);
FILES_open(of4b,'helpsubgrampas',14,3);
FILES_open(of3,'paramfile',9,3);
FILES_readchar(ifi[1],ch);
FILES_readchar(ifi[1],ch);
FILES_readchar(ifi[1],ch);
dutch:=false;english:=false;spanish:=false;
IF ch='D' THEN dutch:=true;
IF ch='E' THEN english:=true;
IF ch='S' THEN spanish:=true;
FILES_skipline(ifi[1]);
FILES_writestr(cof1,'EXPORT(LDGENMRULES);',FILES_maxIO,0,left);
  FILES_writeline(cof1,true);
FILES_writestr(cof1,'pragma C_include(''ldmrules.pf'');',FILES_maxIO,0,left);
  FILES_writeline(cof1,true);
FILES_writestr(cof1,'pragma C_include(''ldgenmrules.pf'');',FILES_maxIO,0,left);
  FILES_writeline(cof1,true);
FILES_writestr(cof1,'pragma C_include(''lsparams.pf'');',FILES_maxIO,0,left);
  FILES_writeline(cof1,true);
FILES_writestr(cof1,'pragma C_include(''listree.pf'');',FILES_maxIO,0,left);
  FILES_writeline(cof1,true);
FILES_writestr(cof1,'pragma C_include(''lsdomaint.pf'');',FILES_maxIO,0,left);
  FILES_writeline(cof1,true);
FILES_writestr(cof1,'pragma C_include(''lidomaint.pf'');',FILES_maxIO,0,left);
  FILES_writeline(cof1,true);
FILES_writestr(cof1,'PACKAGE commrules;WITH listree,lsdomaint;',FILES_maxIO,0,left);
  FILES_writeline(cof1,true);
i:=0;
WHILE i<>numofmrulefiles DO
  BEGIN
  i:=i+1;
  FILES_writeline(cof1,true);
  FILES_writestr(cof1,'pragma C_include(''commrules',FILES_maxIO,0,left);
  FILES_writeinteger(cof1,i,0,left);
  FILES_writestr(cof1,'.pf'');',FILES_maxIO,0,left);
  END;
FILES_writeline(cof1,true);
FILES_writestr(cof1,'END;',FILES_maxIO,0,left);
  FILES_writeline(cof1,true);
FILES_writestr(decof1,'EXPORT(LDANMRULES);',FILES_maxIO,0,left);
  FILES_writeline(decof1,true);
FILES_writestr(decof1,'pragma C_include(''ldmrules.pf'');',FILES_maxIO,0,left);
  FILES_writeline(decof1,true);
FILES_writestr(decof1,'pragma C_include(''ldanmrules.pf'');',FILES_maxIO,0,left);
  FILES_writeline(decof1,true);
FILES_writestr(decof1,'pragma C_include(''lsparams.pf'');',FILES_maxIO,0,left);
  FILES_writeline(decof1,true);
FILES_writestr(decof1,'pragma C_include(''listree.pf'');',FILES_maxIO,0,left);
  FILES_writeline(decof1,true);
FILES_writestr(decof1,'pragma C_include(''lsdomaint.pf'');',FILES_maxIO,0,left);
  FILES_writeline(decof1,true);
FILES_writestr(decof1,'pragma C_include(''mem.pf'');',FILES_maxIO,0,left);
  FILES_writeline(decof1,true);
FILES_writestr(decof1,'pragma C_include(''limatches.pf'');',FILES_maxIO,0,left);
  FILES_writeline(decof1,true);
FILES_writestr(decof1,'pragma C_include(''lidomaint.pf'');',FILES_maxIO,0,left);
  FILES_writeline(decof1,true);
FILES_writestr(decof1,'PACKAGE decommrules;WITH listree,lsdomaint;',FILES_maxIO,0,left);
  FILES_writeline(decof1,true);
i:=0;
WHILE i<>numofmrulefiles DO
  BEGIN
  i:=i+1;
  FILES_writeline(decof1,true);
  FILES_writestr(decof1,'pragma C_include(''decommrules',FILES_maxIO,0,left);
  FILES_writeinteger(decof1,i,0,left);
  FILES_writestr(decof1,'.pf'');',FILES_maxIO,0,left);
  END;
FILES_writeline(decof1,true);
FILES_writestr(decof1,'END;',FILES_maxIO,0,left);
  FILES_writeline(decof1,true);
FILES_writestr(of4,'EXPORT(LDSUBGRAMMARS);',FILES_maxIO,0,left);
  FILES_writeline(of4,true);
FILES_writestr(of4,'pragma C_include(''ldsubgrammars.pf'');',FILES_maxIO,0,left);
  FILES_writeline(of4,true);
FILES_writestr(of4,'pragma C_include(''helpsubgrammars.pf'');',FILES_maxIO,0,left);
  FILES_writeline(of4,true);
FILES_writestr(of4,'pragma C_include(''ldmrules.pf'');',FILES_maxIO,0,left);
  FILES_writeline(of4,true);
FILES_writestr(of4,'pragma C_include(''mem.pf'');',FILES_maxIO,0,left);
  FILES_writeline(of4,true);
FILES_writestr(of4a,'pragma C_include(''ldmrules.pf'');',FILES_maxIO,0,left);
  FILES_writeline(of4a,true);
FILES_writestr(of4b,'EXPORT(HELPSUBGRAMMARS);',FILES_maxIO,0,left);
  FILES_writeline(of4b,true);
FILES_writestr(of4b,'pragma C_include(''helpsubgrammars.pf'');',FILES_maxIO,0,left);
  FILES_writeline(of4a,true);
FILES_writestr(of4b,'pragma C_include(''ldmrules.pf'');',FILES_maxIO,0,left);
  FILES_writeline(of4,true);
FILES_writestr(of4b,'pragma C_include(''mem.pf'');',FILES_maxIO,0,left);
  FILES_writeline(of4b,true);
FILES_writestr(of2,'EXPORT(LDMRULES);',FILES_maxIO,0,left);
  FILES_writeline(of2,true);
FILES_writestr(of2,'pragma C_include(''ldmrules.pf'');',FILES_maxIO,0,left);
  FILES_writeline(of2,true);
FILES_writestr(of2,'pragma C_include(''limatches.pf'');',FILES_maxIO,0,left);
  FILES_writeline(of2,true);
FILES_writestr(of2,'pragma C_include(''ldconvrec.pf'');',FILES_maxIO,0,left);
  FILES_writeline(of2,true);
FILES_writestr(of2,'pragma C_include(''lsparams.pf'');',FILES_maxIO,0,left);
  FILES_writeline(of2,true);
FILES_writestr(of2,'pragma C_include(''lsdomaint.pf'');',FILES_maxIO,0,left);
  FILES_writeline(of2,true);
FILES_writestr(of2,'pragma C_include(''mem.pf'');',FILES_maxIO,0,left);
  FILES_writeline(of2,true);
FILES_writestr(of2,'pragma C_include(''str.pf'');',FILES_maxIO,0,left);
  FILES_writeline(of2,true);
FILES_writestr(of2,'pragma C_include(''lirectoscreen.pf'');',FILES_maxIO,0,left);
  FILES_writeline(of2,true);
FILES_writestr(of2,'pragma C_include(''ldsubgrammars.pf'');',FILES_maxIO,0,left);
  FILES_writeline(of2,true);
FILES_writestr(of2,'pragma C_include(''lstypetostr.pf'');',FILES_maxIO,0,left);
  FILES_writeline(of2,true);
FILES_writestr(of2,'pragma C_include(''lsmruquo.pf'');',FILES_maxIO,0,left);
  FILES_writeline(of2,true);
FILES_writestr(of2,'pragma C_include(''windows.pf'');',FILES_maxIO,0,left);
  FILES_writeline(of2,true);
FILES_writestr(of3,'pragma C_include(''lsdomaint.pf'');',FILES_maxIO,0,left);
  FILES_writeline(of3,true);
FILES_writestr(of3,'pragma C_include(''ldmrules.pf'');',FILES_maxIO,0,left);
  FILES_writeline(of3,true);
FILES_writestr(cof1,'PROGRAM LDGENMRULES;',FILES_maxIO,0,left);
FILES_writeline(cof1,true);
FILES_writestr(cof1,
'WITH ldmrules,lsparams,listree,lsdomaint,lidomaint,commrules;',FILES_maxIO,0,left);
FILES_writeline(cof1,true);
FILES_writestr(decof1,'PROGRAM LDANMRULES;',FILES_maxIO,0,left);
FILES_writeline(decof1,true);
FILES_writestr(decof1,'WITH ldmrules,lsparams,listree,lsdomaint,mem,',FILES_maxIO,0,left);
FILES_writeline(decof1,true);
FILES_writestr(decof1,'limatches,lidomaint,decommrules;',FILES_maxIO,0,left);
FILES_writeline(decof1,true);
FILES_writestr(of4,'PROGRAM LDSUBGRAMMARS;',FILES_maxIO,0,left);
FILES_writeline(of4,true);
FILES_writestr(of4,'WITH helpsubgrammars,ldmrules,mem,ldmrules;',FILES_maxIO,0,left);
FILES_writeline(of4,true);
FILES_writestr(of4a,'PACKAGE HELPSUBGRAMMARS;',FILES_maxIO,0,left);
FILES_writeline(of4a,true);
FILES_writestr(of4a,'WITH ldmrules;',FILES_maxIO,0,left);
FILES_writeline(of4a,true);
FILES_writestr(of4b,'PROGRAM HELPSUBGRAMMARS;',FILES_maxIO,0,left);
FILES_writeline(of4b,true);
FILES_writestr(of4b,'WITH ldmrules,mem;',FILES_maxIO,0,left);
FILES_writeline(of4b,true);
FILES_writestr(of2,'PROGRAM LDMRULES;',FILES_maxIO,0,left);
FILES_writeline(of2,true);
FILES_writestr(of2,'WITH limatches,ldconvrec,lsparams,lsdomaint,mem,',FILES_maxIO,0,left);
FILES_writestr(of2,'str,lirectoscreen,ldsubgrammars,lstypetostr,',FILES_maxIO,0,left);
FILES_writeline(of2,true);
FILES_writestr(of2,'lsmruquo,windows;',FILES_maxIO,0,left);
FILES_writeline(of2,true);
FILES_writestr(of3,'PACKAGE LSPARAMS;',FILES_maxIO,0,left);
FILES_writeline(of3,true);
FILES_writestr(of3,'WITH lsdomaint,ldmrules;',FILES_maxIO,0,left);
FILES_writeline(of3,true);
FILES_writestr(of3,'TYPE LSPARAMS_precord = ^LSPARAMS_record;',FILES_maxIO,0,left);
FILES_writeline(of3,true);
FILES_writestr(of3,'     LSPARAMS_record = RECORD',FILES_maxIO,0,left);
FILES_writeline(of3,true);
existparams:=FALSE;
FILES_writestr(of3,'CASE rulenr:LDMRULES_Ruleindex OF',FILES_maxIO,0,left);
FILES_writeline(of3,true);
writemruleif;
writesubgrammarif;
IF not existparams THEN
  BEGIN
  FILES_writestr(of3,'-1:(nepveldtje:BOOLEAN);',FILES_maxIO,0,left);
  FILES_writeline(of3,true);
  END;
FILES_writestr(of3,'END;',FILES_maxIO,0,left);
FILES_writeline(of3,true);
FILES_writestr(of3,'END;',FILES_maxIO,0,left);
FILES_writeline(of3,true);
FILES_writestr(of4a,' END;',FILES_maxIO,0,left);
FILES_writeline(cof1,true);
FILES_writeline(decof1,true);
FILES_close(of2);FILES_close(of3);
FILES_close(cof1);
FILES_close(decof1);
IF error THEN
  BEGIN
  errorptr:=NIL;
  writeln('please neglect the following error message');
  dispose(errorptr);
  END;
END {mrulelink}.

