(*MPM:::===================================================================*
 *
 *  Rosetta Project                                                 
 *                                                                  
 *  Module Title    : DOMCOMRULES
 *  Creation date   :                                               
 *  Author          :                                               
 *                                                                  
 *  Copyright (c) 1985, by Nederlandse Philips Bedrijven BV.        
 *                                                                  
 *  Remarks         :  
 *
 *EMP:::===================================================================*)

pragma C_Include('strings.pf');
Export(DOMCOMRULES);
pragma C_include('files.pf');
pragma C_include('str.pf');
pragma C_include('string.pf');
pragma C_include('domcomdecl.pf');
pragma C_include('domcomlangspec.pf');
pragma C_include('domcomrules.pf');

(*=========================================================================*
 *  Imported modules
 *=========================================================================*)
PROGRAM DOMCOMRULES;

WITH DOMCOMLANGSPEC,
     STRINGS,
     STR,
     STRNG,
     FILES,
     DOMCOMDECL;

CONST
   maxcats = 150;
   maxrels = 80;
   maxCC   = 80;
   maxFON  = 80;
TYPE
   indicatortype = (EnumSet,Subrang,Enumeration,Key,Int,Bool,String);
   plosident = ^losident;
   losident = record
                arg:STRING_string;
                next:plosident
              end;
   setofidents = record
                   first,last:plosident
                 end;
   penum=^enum;
   plosenum=^losenum;
   losenum=record
   	         arg:penum;
   		 next:plosenum
   	       end;
   enum = record
   		typename:STRING_string;
   		idents:setofidents			
   	      end;
   setofenums = record
   		first,last:plosenum
   		end;
   psubrange=^subrange;
   plossubrange=^lossubrange;
   lossubrange=record
   	         arg:psubrange;
   		 next:plossubrange
   	       end;
   subrange = record
   		typename:STRING_string;
   		ident1,ident2:STRING_string			
   	      end;
   setofsubranges = record
   		first,last:plossubrange
   		end;
   SETOF = record
                 typename1,typename2:STRING_string
   	       end;
   pSETOF=^SETOF;
   plosSETOF=^losSETOF;
   losSETOF=record
   	         arg:pSETOF;
   		 next:plosSETOF
   	       end;
   setofSETOFs = record
   		first,last:plosSETOF
   		end;
   ploscopy=^loscopy;
   pcopy = ^copy;
   copy = record
              functionname,recordname1,recordname2:STRING_string
            end;
   loscopy = record
   		arg:pcopy;
                next:ploscopy
   	       end;
   setofcopies = record
                    first,last:ploscopy
                  end;
   plosattrib=^losattrib;
   pattrib = ^attrib;
   attrib = record
              attribname,typename,valeu:STRING_string;
              kind:indicatortype;
              basetype:STRING_string;
              typecode:INTEGER
            end;
   losattrib = record
   		arg:pattrib;
                next:plosattrib
   	       end;
   setofattribs = record
                    first,last:plosattrib
                  end;
   plosderiv=^losderiv;
   pderiv = ^deriv;
   deriv = record
              derivname:STRING_string;
              keyvaleu :STRING_String
            end;
   losderiv = record
   		arg:pderiv;
                next:plosderiv
   	       end;
   setofderivs = record
                    first,last:plosderiv
                  end;
   recordtype = record
                  recordname:STRING_string;
                  attribs:setofattribs;
                  keypresent,indexpresent:boolean;
                  lb, ub: STRING_String;
                  oneofthecats: STRING_String
   		end;
   precord = ^recordtype;
   plosrecord = ^losrecord;
   losrecord = record
                 arg:precord;
                 next:plosrecord
               end;
   setofrecords = record
                    first,last:plosrecord
   		  end;
   catdef = record
                   catnames:setofidents;
                   recordname:STRING_string
            end;
   ploscatdef = ^loscatdef;
   pcatdef = ^catdef;
   loscatdef = record
                 arg:pcatdef;
                 next:ploscatdef
               end;
   setofcatdefs = record
                    first,last:ploscatdef
                  end;

VAR of1,mof1,mof2,cof1,cof2,convof1,convof2,convof3,convof4,
    morfdef1,donvof1,catsetsof1,lsconvof1,lsconvof2,
    lsconvof3, lsconvof4, ldconvof4,equalof1, ldcat1,ldownmem1 :FILES_text;
    stringvar:STRING_string;
    t:DOMCOMDECL_psnode;
    contexttablevar,contexttable,
    phonetictablevar,phonetictable,
    affixkeystablevar,affixkeystable:setofidents;
    catsetstable,enumtable:setofenums;
    enumentryvar,catsetsentryvar:penum;
    subrangetable:setofsubranges;
    subrangeentryvar:psubrange;
    integertable:setofidents;
    integerentryvar:STRING_string;
    booleantable:setofidents;
    booleanentryvar:STRING_string;
    settable:setofSETOFs;
    SETOFentryvar:pSETOF;
    recordtable:setofrecords;
    recordentryvar:precord;
    attribvar:pattrib;
    derivkeystablevar, derivkeystable:setofderivs;
    categorytable:setofcatdefs;
    catlistentryvar:pcatdef;
    relationtable:setofidents;
    relationtablevar:setofidents;
    copiestable:setofcopies;
    copyentryvar:pcopy;
    copyfound,dutch,english,spanish:boolean;
    keynr : integer;
    derivconstant : pderiv;
    oneofthecats : STRING_String;
    langstr : String_String;

procedure initsetofidents(var S1:setofidents);
begin
S1.first:=nil;S1.last:=nil
end;
function stillidents(S1:setofidents):boolean;
begin
if S1.first<>nil then stillidents:=true
else stillidents:=false
end;
procedure appendident(str:STRING_string;var S1:setofidents);
var p:plosident;
begin
new(p);
p^.arg:=str;
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
procedure takeident(var str:STRING_string;var S1:setofidents);
begin
if S1.first=nil then STRING_constantempty(str)
else
   begin
   str:=S1.first^.arg;
   if S1.first=S1.last then
   	begin
   	S1.first:=nil;S1.last:=nil
   	end
   else S1.first:=S1.first^.next
   end
end;
procedure initsetofenums(var S1:setofenums);
begin
S1.first:=nil;S1.last:=nil
end;
function stillenums(S1:setofenums):boolean;
begin
if S1.first<>nil then stillenums:=true
else stillenums:=false
end;
procedure appendenum(enum1:penum;var S1:setofenums);
var p:plosenum;
begin
new(p);
p^.arg:=enum1;
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
procedure takeenum(var enum1:penum;var S1:setofenums);
begin
if S1.first=nil then enum1:=nil
else
   begin
   enum1:=S1.first^.arg;
   if S1.first=S1.last then
   	begin
   	S1.first:=nil;S1.last:=nil
   	end
   else S1.first:=S1.first^.next
   end
end;
procedure initsetofattribs(var S1:setofattribs);
begin
S1.first:=nil;S1.last:=nil
end;
function stillattribs(S1:setofattribs):boolean;
begin
if S1.first<>nil then stillattribs:=true
else stillattribs:=false
end;
procedure appendattrib(attrib1:pattrib;var S1:setofattribs);
var p:plosattrib;
begin
new(p);
p^.arg:=attrib1;
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
procedure takeattrib(var attrib1:pattrib;var S1:setofattribs);
begin
if S1.first=nil then attrib1:=nil
else
   begin
   attrib1:=S1.first^.arg;
   if S1.first=S1.last then
   	begin
   	S1.first:=nil;S1.last:=nil
   	end
   else S1.first:=S1.first^.next
   end
end;
procedure initsetofderivs(var S1:setofderivs);
begin
S1.first:=nil;S1.last:=nil
end;
function stillderivs(S1:setofderivs):boolean;
begin
if S1.first<>nil then stillderivs:=true
else stillderivs:=false
end;
procedure appendderiv(deriv1:pderiv;var S1:setofderivs);
var p:plosderiv;
begin
new(p);
p^.arg:=deriv1;
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
procedure takederiv(var deriv1:pderiv;var S1:setofderivs);
begin
if S1.first=nil then deriv1:=nil
else
   begin
   deriv1:=S1.first^.arg;
   if S1.first=S1.last then
   	begin
   	S1.first:=nil;S1.last:=nil
   	end
   else S1.first:=S1.first^.next
   end
end;
procedure initsetofcopies(var S1:setofcopies);
begin
S1.first:=nil;S1.last:=nil
end;
function stillcopies(S1:setofcopies):boolean;
begin
if S1.first<>nil then stillcopies:=true
else stillcopies:=false
end;
procedure appendcopy(copy1:pcopy;var S1:setofcopies);
var p:ploscopy;
begin
new(p);
p^.arg:=copy1;
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
procedure takecopy(var copy1:pcopy;var S1:setofcopies);
begin
if S1.first=nil then copy1:=nil
else
   begin
   copy1:=S1.first^.arg;
   if S1.first=S1.last then
   	begin
   	S1.first:=nil;S1.last:=nil
   	end
   else S1.first:=S1.first^.next
   end
end;
procedure initsetofsubranges(var S1:setofsubranges);
begin
S1.first:=nil;S1.last:=nil
end;
function stillsubranges(S1:setofsubranges):boolean;
begin
if S1.first<>nil then stillsubranges:=true
else stillsubranges:=false
end;
procedure appendsubrange(subrange1:psubrange;var S1:setofsubranges);
var p:plossubrange;
begin
new(p);
p^.arg:=subrange1;
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
procedure takesubrange(var subrange1:psubrange;var S1:setofsubranges);
begin
if S1.first=nil then subrange1:=nil
else
   begin
   subrange1:=S1.first^.arg;
   if S1.first=S1.last then
   	begin
   	S1.first:=nil;S1.last:=nil
   	end
   else S1.first:=S1.first^.next
   end
end;
procedure initsetofSETOFs(var S1:setofSETOFs);
begin
S1.first:=nil;S1.last:=nil
end;
function stillSETOFs(S1:setofSETOFs):boolean;
begin
if S1.first<>nil then stillSETOFs:=true
else stillSETOFs:=false
end;
procedure appendSETOF(SETOF1:pSETOF;var S1:setofSETOFs);
var p:plosSETOF;
begin
new(p);
p^.arg:=SETOF1;
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
procedure takeSETOF(var SETOF1:pSETOF;var S1:setofSETOFs);
begin
if S1.first=nil then SETOF1:=nil
else
   begin
   SETOF1:=S1.first^.arg;
   if S1.first=S1.last then
   	begin
   	S1.first:=nil;S1.last:=nil
   	end
   else S1.first:=S1.first^.next
   end
end;
procedure initsetofrecords(var S1:setofrecords);
begin
S1.first:=nil;S1.last:=nil
end;
function stillrecords(S1:setofrecords):boolean;
begin
if S1.first<>nil then stillrecords:=true
else stillrecords:=false
end;
procedure appendrecord(record1:precord;var S1:setofrecords);
var p:plosrecord;
begin
new(p);
p^.arg:=record1;
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
procedure takerecord(var record1:precord;var S1:setofrecords);
begin
if S1.first=nil then record1:=nil
else
   begin
   record1:=S1.first^.arg;
   if S1.first=S1.last then
   	begin
   	S1.first:=nil;S1.last:=nil
   	end
   else S1.first:=S1.first^.next
   end
end;
procedure initsetofcatdefs(var S1:setofcatdefs);
begin
S1.first:=nil;S1.last:=nil
end;
function stillcatdefs(S1:setofcatdefs):boolean;
begin
if S1.first<>nil then stillcatdefs:=true
else stillcatdefs:=false
end;
procedure appendcatdef(catdef1:pcatdef;var S1:setofcatdefs);
var p:ploscatdef;
begin
new(p);
p^.arg:=catdef1;
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
procedure takecatdef(var catdef1:pcatdef;var S1:setofcatdefs);
begin
if S1.first=nil then catdef1:=nil
else
   begin
   catdef1:=S1.first^.arg;
   if S1.first=S1.last then
   	begin
   	S1.first:=nil;S1.last:=nil
   	end
   else S1.first:=S1.first^.next
   end
end;
function converttoIO(n:STRING_range):FILES_IOrange;
begin
converttoIO:=n
end;

PROCEDURE SetOneOfTheCats(cat, rec: STRING_string);
VAR record1:precord;
    recordtable1:setofrecords;
    recordfound:boolean;
BEGIN{writeomega}
   recordtable1:=recordtable;
   recordfound:=false;
   WHILE stillrecords(recordtable1) and not(recordfound) DO BEGIN
      takerecord(record1,recordtable1);
      IF STRING_compare(record1^.recordname,rec)=0 THEN recordfound:=true
   END;
   IF recordfound THEN BEGIN
      record1^.oneofthecats := cat
   END
END;{SetOneOfTheCats}

PROCEDURE DOMCOMRULES_init;
BEGIN {DOMCOMRULES_init}
initsetofidents(affixkeystable);
initsetofderivs(derivkeystable);
initsetofenums(catsetstable);
initsetofenums(enumtable);
initsetofsubranges(subrangetable);
initsetofidents(integertable);
initsetofidents(booleantable);
initsetofSETOFs(settable);
initsetofrecords(recordtable);
initsetofcatdefs(categorytable);
initsetofidents(relationtable);
initsetofcopies(copiestable)
END {DOMCOMRULES_init};

PROCEDURE DOMCOMRULES_writeresults;
procedure writeconstants(var of1:FILES_text);
var str:STRING_string;
    i:integer;
    affixkeystable1:setofidents;
    derivkeystable1:setofderivs;
    derivconst     : pderiv;
begin
if stillidents(affixkeystable) then FILES_WriteStr(of1,'CONST',
               FILES_maxIO,0,left);
FILES_Writeline(of1,true);
i:=0;
affixkeystable1:=affixkeystable;
while stillidents(affixkeystable1) do
   begin
   i:=i-1;
   takeident(str,affixkeystable1);
   FILES_writestr(of1,'       ',FILES_maxIO,0,left);
   FILES_writestring(of1,str,converttoIO(STRING_length(str)),right);
   FILES_writestr(of1,' = ',FILES_MaxIO,0,left);
   FILES_writeinteger(of1,i,4,right);
   FILES_writechar(of1,';');
   FILES_writeline(of1,true)
   end;

if stillderivs(derivkeystable) then FILES_WriteStr(of1,'CONST',
               FILES_maxIO,0,left);
FILES_Writeline(of1,true);
i:=0;
derivkeystable1:=derivkeystable;
while stillderivs(derivkeystable1) do
   begin
   i:=i+1;
   takederiv(derivconst,derivkeystable1);
   FILES_writestr(of1,'       ',FILES_maxIO,0,left);
   FILES_writestring(of1,derivconst^.derivname,
                     converttoIO(STRING_length(derivconst^.derivname)),right);
   FILES_writestr(of1,' = ',FILES_MaxIO,0,left);
   FILES_writestring(of1,derivconst^.keyvaleu,
                     converttoIO(STRING_length(derivconst^.keyvaleu)),right);
   FILES_writechar(of1,';');
   FILES_writeline(of1,true)
   end

end;

procedure writetypes(var of1:FILES_text);
var relationtable1:setofidents;
    str:STRING_string;
    recordtable1:setofrecords;
    record1:precord;
    recordname:STRING_string;
    attribs:setofattribs;
    attrib1:pattrib;
    keypresent:boolean;
    indexpresent:boolean;
    categorytable1:setofcatdefs;
    catdef1:pcatdef;
    catnames:setofidents;
    settable1:setofSETOFs;
    SETOF1:pSETOF;
    subrangetable1:setofsubranges;
    subrange1:psubrange;
    enumtable1:setofenums;
    enum1:penum;
    idents:setofidents;
    integertable1:setofidents;
    booleantable1:setofidents;
    i,j:integer;

   FUNCTION haskey (recordname:STRING_string): BOOLEAN;
   VAR record1:precord;
       recordtable1:setofrecords;
       recordfound:boolean;
   BEGIN{writeomega}
      recordtable1:=recordtable;
      recordfound:=false;
      haskey := false;
      WHILE stillrecords(recordtable1) and not(recordfound) DO BEGIN
	 takerecord(record1,recordtable1);
	 IF STRING_compare(record1^.recordname,recordname)=0 THEN recordfound:=true
      END;
      IF recordfound THEN BEGIN
	 IF record1^.keypresent THEN haskey := true;
      END
   END;{haskey}

begin
FILES_WriteStr(of1,'TYPE',FILES_maxIO,0,left);
FILES_writeline(of1,true);



{write synrel:}
relationtable1:=relationtable;
FILES_writeStr(of1,'     LSDOMAINT_synrel = (LSREL0',FILES_maxIO,0,left);
i:=0;
while stillidents(relationtable1) do
   begin
   FILES_writechar(of1,',');
   takeident(str,relationtable1);
   FILES_writestring(of1,str,converttoIO(STRING_length(str)),right);
   i:=i+1
   end;
FOR j := i+1 to maxrels DO BEGIN
   FILES_writechar(of1,',');
   IF FILES_position(of1) > (FILES_maxIO - 20) then FILES_writeline(of1,true);
   FILES_writeStr(of1,'LSREL',FILES_maxIO,0,left);
   FILES_writeinteger(of1,j,0,left);
   i:=i+1
END;
FILES_writechar(of1,')');
FILES_writechar(of1,';');
FILES_writeline(of1,true);



{write integer types:}
integertable1:=integertable;
while stillidents(integertable1) do
   begin
   takeident(str,integertable1);
   FILES_writestr(of1,'     LSDOMAINT_',FILES_maxIO,0,left);
   FILES_writestring(of1,str,0,left);
   FILES_writestr(of1,'=INTEGER;',FILES_maxIO,0,left);
   FILES_writeline(of1,true)
   end;



{write boolean types:}
booleantable1:=booleantable;
while stillidents(booleantable1) do
   begin
   takeident(str,booleantable1);
   FILES_writestr(of1,'     LSDOMAINT_',FILES_maxIO,0,left);
   FILES_writestring(of1,str,0,left);
   FILES_writestr(of1,'=BOOLEAN;',FILES_maxIO,0,left);
   FILES_writeline(of1,true)
   end;



{write enumerative types:}
enumtable1:=enumtable;
while stillenums(enumtable1) do
   begin
   takeenum(enum1,enumtable1);
   FILES_writestr(of1,'     LSDOMAINT_',FILES_maxIO,0,left);
   FILES_writestring(of1,enum1^.typename,0,left);
   FILES_writestr(of1,' = (',FILES_maxIO,0,left);
   idents:=enum1^.idents;
   takeident(str,idents);
   FILES_writestring(of1,str,0,left);
   while stillidents(idents) do
   	begin
        takeident(str,idents);
   	FILES_writestr(of1,',',FILES_maxIO,0,left);
        FILES_writestring(of1,str,0,left);
   	end;
   FILES_writechar(of1,')');
   FILES_writechar(of1,';');
   FILES_writeline(of1,true)
   end;



{write subrange types:}
subrangetable1:=subrangetable;
while stillsubranges(subrangetable1) do
   begin
   takesubrange(subrange1,subrangetable1);
   FILES_writestr(of1,'     LSDOMAINT_',FILES_maxIO,0,left);
   FILES_writestring(of1,subrange1^.typename,0,left);
   FILES_writestr(of1,' = ',FILES_maxIO,0,left);
   FILES_writestring(of1,subrange1^.ident1,0,left);
   FILES_writestr(of1,'..',FILES_maxIO,0,left);
   FILES_writestring(of1,subrange1^.ident2,0,left);
   FILES_writechar(of1,';');
   FILES_writeline(of1,true)
   end;



{write SET OF's:}
settable1:=settable;
while stillSETOFs(settable1) do
   begin
   takeSETOF(SETOF1,settable1);
   FILES_writestr(of1,'     LSDOMAINT_',FILES_maxIO,0,left);
   FILES_writestring(of1,SETOF1^.typename1,0,left);
   FILES_writestr(of1,' = SET OF ',FILES_maxIO,0,left);
   FILES_writestr(of1,'LSDOMAINT_',FILES_maxIO,0,left);
   FILES_writestring(of1,SETOF1^.typename2,0,left);
   FILES_writechar(of1,';');
   FILES_writeline(of1,true)
   end;



{write declared records:}
recordtable1:=recordtable;
while stillrecords(recordtable1) do
   begin
   takerecord(record1,recordtable1);
   recordname:=record1^.recordname;
   attribs:=record1^.attribs;
   indexpresent:=record1^.indexpresent;
   keypresent:=record1^.keypresent;
   FILES_writestr(of1,'     LSDOMAINT_p',FILES_maxIO,0,left);
   FILES_writestring(of1,recordname,0,right);
   FILES_writestr(of1,' = ^LSDOMAINT_',FILES_maxIO,0,left);
   FILES_writestring(of1,recordname,0,right);
   FILES_writechar(of1,';');
   FILES_writeline(of1,true);
   FILES_writestr(of1,'     LSDOMAINT_',FILES_maxIO,0,left);
   FILES_writestring(of1,recordname,0,right);
   FILES_writestr(of1,' = ',FILES_maxIO,0,left);
   FILES_writeline(of1,true);
   FILES_writestr(of1,'RECORD',FILES_maxIO,15,right);
   FILES_writeline(of1,true);
   if keypresent then 
   	begin 
        FILES_writestr(of1,'key:integer;',FILES_maxIO,22,right);
        FILES_writeline(of1,true)
        end;
   if indexpresent then 
   	begin 
        FILES_writestr(of1,'index:integer;',FILES_maxIO,22,right);
        FILES_writeline(of1,true)
        end;
   while stillattribs(attribs) do
   	begin
        takeattrib(attrib1,attribs);
   	FILES_writestring(of1,attrib1^.attribname,
                                      converttoIO(STRING_length(str)+18),right);
        FILES_writechar(of1,':');
        FILES_writestr(of1,'LSDOMAINT_',FILES_maxIO,0,left);
        FILES_writestring(of1,attrib1^.typename,0,left);
        IF stillattribs(attribs) THEN FILES_writechar(of1,';');
        FILES_writeline(of1,true)
   	end;
   FILES_writestr(of1,'END;',FILES_maxIO,15,right);
   FILES_writeline(of1,true)
   end;



{write syntcat:}
categorytable1:=categorytable;
FILES_writestr(of1,'     LSDOMAINT_syntcat = (LSBUG,LSUG,LSCAT0',FILES_maxIO,0,left);
i:=0;
takecatdef(catdef1,categorytable1);
catnames:=catdef1^.catnames;
while stillidents(catnames) do
   begin
   takeident(str,catnames);
   FILES_writechar(of1,',');
   FILES_writestring(of1,str,0,left);
   i:=i+1;
   end;
while stillcatdefs(categorytable1) do
   begin
   takecatdef(catdef1,categorytable1);
   catnames:=catdef1^.catnames;
   while stillidents(catnames) do
      begin
      takeident(str,catnames);
      FILES_writechar(of1,',');
      FILES_writestring(of1,str,0,left);
      i:=i+1
      end
   end;
FOR j:=i+1 TO maxcats DO BEGIN
   FILES_writechar(of1,',');
   IF FILES_position(of1) > (FILES_maxIO - 20) then FILES_writeline(of1,true);
   FILES_writestr(of1,'LSCAT',FILES_maxIO,0,left);
   FILES_writeinteger(of1,j,0,left);
END;
FILES_writechar(of1,')');
FILES_writechar(of1,';');
FILES_writeline(of1,true);
FILES_writeline(of1,true);



{write main record:}
FILES_writestr(of1,'LSDOMAINT_pLSrecord = ^LSDOMAINT_LSrecord;',
   					FILES_maxIO,0,left);
FILES_writeline(of1,true);
FILES_writestr(of1,'LSDOMAINT_LSrecord =',FILES_maxIO,0,left);
FILES_writeline(of1,true);
FILES_writestr(of1,'RECORD',FILES_maxIO,15,right);
FILES_writeline(of1,true);
FILES_writestr(of1,'CASE cat:LSDOMAINT_syntcat of',FILES_maxIO,41,right);
FILES_writeline(of1,true);
categorytable1:=categorytable;
while stillcatdefs(categorytable1) do
   begin
   takecatdef(catdef1,categorytable1);
   catnames:=catdef1^.catnames;
   while stillidents(catnames) do
        begin
        takeident(str,catnames);
        FILES_writestring(of1,str,converttoIO(STRING_length(str)+18),right);
        FILES_writechar(of1,':');
        FILES_writeline(of1,true);
        FILES_writestr(of1,' ',FILES_maxIO,21,right);
        FILES_writechar(of1,'(');
        FILES_writestring(of1,str,0,left);
        FILES_writestr(of1,'field:LSDOMAINT_p',FILES_maxIO,0,left);
        FILES_writestring(of1,catdef1^.recordname,0,left);
        FILES_writechar(of1,')');
        FILES_writechar(of1,';');
        FILES_writeline(of1,true)
        end
   end;
FILES_writestr(of1,'END;',FILES_maxIO,15,right);
FILES_writeline(of1,true);


   FILES_WriteStr(of1,'   LSDOMAINT_BLexStruct = RECORD',FILES_MaxIO,0,LEFT);
   FILES_WriteLine(of1, TRUE);
   FILES_WriteStr(of1,'                   KEY : INTEGER;',FILES_MaxIO,0,LEFT);
   FILES_WriteLine(of1, TRUE);
   FILES_WriteStr(of1,'                   IsBxpr : BOOLEAN;',FILES_MaxIO,0,LEFT);
   FILES_WriteLine(of1, TRUE);
   FILES_WriteStr(of1,'                   CASE CAT:LSDOMAINT_SyntCat OF',FILES_MaxIO,0,LEFT);
   FILES_WriteLine(of1, TRUE);
   categorytable1:=categorytable;
   IF stillcatdefs(categorytable1) THEN BEGIN
      takecatdef(catdef1,categorytable1);
      catnames:=catdef1^.catnames;
      while stillidents(catnames) and haskey(catdef1^.recordname) do begin
	   takeident(str,catnames);
           FILES_WriteStr(of1,'                   ',FILES_MaxIO,0,LEFT);
           FILES_WriteString(of1,str,0,LEFT);
           FILES_WriteStr(of1,': (',FILES_MaxIO,0,LEFT);
           FILES_WriteString(of1,str,0,LEFT);
           FILES_WriteStr(of1,'Rec : LSDOMAINT_',FILES_MaxIO,0,LEFT);
           FILES_WriteString(of1,catdef1^.recordname,0,LEFT);
           FILES_WriteStr(of1,')',FILES_MaxIO,0,LEFT);
      end
   END;
   while stillcatdefs(categorytable1) do begin
      takecatdef(catdef1,categorytable1);
      catnames:=catdef1^.catnames;
      while stillidents(catnames) and haskey(catdef1^.recordname) do begin
	   takeident(str,catnames);
           FILES_WriteStr(of1,';',FILES_MaxIO,0,LEFT);
   FILES_WriteLine(of1, TRUE);
           FILES_WriteStr(of1,'                   ',FILES_MaxIO,0,LEFT);
           FILES_WriteString(of1,str,0,LEFT);
           FILES_WriteStr(of1,': (',FILES_MaxIO,0,LEFT);
           FILES_WriteString(of1,str,0,LEFT);
           FILES_WriteStr(of1,'Rec : LSDOMAINT_',FILES_MaxIO,0,LEFT);
           FILES_WriteString(of1,catdef1^.recordname,0,LEFT);
           FILES_WriteStr(of1,')',FILES_MaxIO,0,LEFT);
      end
   end;
   
   FILES_WriteLine(of1, TRUE);
   FILES_WriteStr(of1,'                END;',FILES_MaxIO,0,LEFT);
   FILES_WriteLine(of1, TRUE);

end;



procedure writemorfdeftypes(var of1:FILES_text);
VAR i,j: integer;
    str: STRING_string;
    phonetictable1,
    contexttable1: setofidents;
BEGIN

{write context:}
contexttable1:=contexttable;
FILES_writeStr(of1,'     LSMORFDEF_ContextConds = (LSCC0',FILES_maxIO,0,left);
i:=0;
while stillidents(contexttable1) do
   begin
   FILES_writechar(of1,',');
   takeident(str,contexttable1);
   FILES_writestring(of1,str,converttoIO(STRING_length(str)),right);
   i:=i+1
   end;
FOR j := i+1 to maxCC DO BEGIN
   FILES_writechar(of1,',');
   IF FILES_position(of1) > (FILES_maxIO - 20) then FILES_writeline(of1,true);
   FILES_writeStr(of1,'LSCC',FILES_maxIO,0,left);
   FILES_writeinteger(of1,j,0,left);
   i:=i+1
END;
FILES_writechar(of1,')');
FILES_writechar(of1,';');
FILES_writeline(of1,true);



{write phonetic:}
phonetictable1:=phonetictable;
FILES_writeStr(of1,'     LSMORFDEF_PhonMarker = (LSFON0',FILES_maxIO,0,left);
i:=0;
while stillidents(phonetictable1) do
   begin
   FILES_writechar(of1,',');
   takeident(str,phonetictable1);
   FILES_writestring(of1,str,converttoIO(STRING_length(str)),right);
   i:=i+1
   end;
FOR j := i+1 to maxFON DO BEGIN
   FILES_writechar(of1,',');
   IF FILES_position(of1) > (FILES_maxIO - 20) then FILES_writeline(of1,true);
   FILES_writeStr(of1,'LSFON',FILES_maxIO,0,left);
   FILES_writeinteger(of1,j,0,left);
   i:=i+1
END;
FILES_writechar(of1,')');
FILES_writechar(of1,';');
FILES_writeline(of1,true);

END;

procedure writeequalfunctions(var of1:FILES_text);
VAR categorytable1:setofcatdefs;
    catdef1:pcatdef;
    catnames1:setofidents;
    catname1:STRING_string;
    recordtable1:setofrecords;
    record1:precord;
    recordname:STRING_string;
    attribs1:setofattribs;
    attrib1:pattrib;

begin
recordtable1:=recordtable;
WHILE stillrecords(recordtable1) DO
   BEGIN
   takerecord(record1,recordtable1);
   recordname:=record1^.recordname;
   FILES_writestr(of1,'FUNCTION EQUAL_',FILES_maxIO,0,left);
   FILES_writestring(of1,recordname,0,left);
   FILES_writeline(of1,true);
   FILES_writestr(of1,'(rec1,rec2:LSDOMAINT_',FILES_maxIO,0,left);
   FILES_writestring(of1,recordname,0,left);
   FILES_writestr(of1,'):BOOLEAN;',FILES_maxIO,0,left);
   FILES_writeline(of1,true);
   FILES_writestr(of1,'VAR result:BOOLEAN;',FILES_maxIO,0,left);
   FILES_writeline(of1,true);
   FILES_writestr(of1,'BEGIN',FILES_maxIO,0,left);
   FILES_writeline(of1,true);
   FILES_writestr(of1,'result := FALSE;',FILES_maxIO,0,left);
   FILES_writeline(of1,true);
   attribs1:=record1^.attribs;
   WHILE stillattribs(attribs1) DO
     BEGIN
     takeattrib(attrib1,attribs1);
     FILES_writestr(of1,'IF ( rec1.',FILES_maxIO,0,left);
     FILES_writestring(of1,attrib1^.attribname,0,left);
     FILES_writestr(of1,' = rec2.',FILES_maxIO,0,left);
     FILES_writestring(of1,attrib1^.attribname,0,left);
     FILES_writestr(of1,' ) THEN',FILES_maxIO,0,left);
     FILES_writeline(of1,true);
     END;
   FILES_writestr(of1,'result := TRUE;',FILES_maxIO,0,left);
   FILES_writeline(of1,true);
   FILES_writestr(of1,'EQUAL_',FILES_maxIO,0,left);
   FILES_writestring(of1,recordname,0,left);
   FILES_writestr(of1,':= result',FILES_maxIO,0,left);
   FILES_writeline(of1,true);
   FILES_writestr(of1,'END;',FILES_maxIO,0,left);
   FILES_writeline(of1,true);
   END;
FILES_writestr(of1,'FUNCTION LDEQUAL_top(s1,s2:LISTREE_pstree):BOOLEAN;',
   							FILES_maxIO,0,left);
FILES_writeline(of1,true);
FILES_writestr(of1,'VAR lss1,lss2:LSSTREE_pstree;',FILES_maxIO,0,left);
FILES_writeline(of1,true);
FILES_writestr(of1,'    result:BOOLEAN;',FILES_maxIO,0,left);
FILES_writeline(of1,true);
FILES_writestr(of1,'BEGIN',FILES_maxIO,0,left);
FILES_writeline(of1,true);
FILES_writestr(of1,'lss1:=LoopHoles.Retype(s1,LSSTREE_pstree);',FILES_maxIO,0,left);
FILES_writeline(of1,true);
FILES_writestr(of1,'lss2:=LoopHoles.Retype(s2,LSSTREE_pstree);',FILES_maxIO,0,left);
FILES_writeline(of1,true);
FILES_writestr(of1,'result:=(lss1^.cat=lss2^.cat);',FILES_maxIO,0,left);
FILES_writeline(of1,true);
FILES_writestr(of1,'IF result THEN',FILES_maxIO,0,left);
FILES_writeline(of1,true);
FILES_writestr(of1,'  BEGIN',FILES_maxIO,0,left);
FILES_writeline(of1,true);
FILES_writestr(of1,'  CASE lss1^.cat OF',FILES_maxIO,0,left);
FILES_writeline(of1,true);
categorytable1:=categorytable;
WHILE stillcatdefs(categorytable1) DO
   BEGIN
   takecatdef(catdef1,categorytable1);
   catnames1:=catdef1^.catnames;
   while stillidents(catnames1) do
     BEGIN
     takeident(catname1,catnames1);
     FILES_writestring(of1,catname1,0,left);
     FILES_writestr(of1,' : ',FILES_maxIO,0,left);
     FILES_writestr(of1,'result := equal_',FILES_maxIO,0,left);  
     FILES_writestring(of1,catdef1^.recordname,0,left);
     FILES_writeline(of1,true);
     FILES_writestr(of1,'(lss1^.ls^.',FILES_maxIO,0,left);
     FILES_writestring(of1,catname1,0,left);
     FILES_writestr(of1,'field^,lss2^.ls^.',FILES_maxIO,0,left);
     FILES_writestring(of1,catname1,0,left);
     FILES_writestr(of1,'field^);',FILES_maxIO,0,left);
     FILES_writeline(of1,true);
     END;
   END;
FILES_writestr(of1,'  END;',FILES_maxIO,0,left);
FILES_writeline(of1,true);
FILES_writestr(of1,'  END;',FILES_maxIO,0,left);
FILES_writeline(of1,true);
FILES_writestr(of1,'LDEQUAL_top:=result',FILES_maxIO,0,left);
FILES_writeline(of1,true);
FILES_writestr(of1,'END;',FILES_maxIO,0,left);
FILES_writeline(of1,true);


end;

procedure writecatsetsfunctions(var of1:FILES_text);
VAR table:setofenums;
    categorytable1:setofcatdefs;
    catdef1:pcatdef;
    catnames1:setofidents;
    catname1,catname2:STRING_string;
    entry:penum;
    found:boolean;
    i:integer;
    cats:setofidents;
begin
table:=catsetstable;
while stillenums(table) do
   begin
   takeenum(entry,table);
   cats:=entry^.idents;
   FILES_writestr(of1,'FUNCTION LDCATSETS_',FILES_maxIO,0,left);
   FILES_writestring(of1,entry^.typename,0,left);
   FILES_writestr(of1,'(cat:LIDOMAINT_syntcat):BOOLEAN;',FILES_maxIO,0,left);
   FILES_writeline(of1,true);
   FILES_writestr(of1,'VAR catset:SET OF LIDOMAINT_syntcat;',FILES_maxIO,0,left);
   FILES_writeline(of1,true);
   FILES_writestr(of1,'BEGIN',FILES_maxIO,0,left);
   FILES_writeline(of1,true);
   FILES_writestr(of1,'catset:=[',FILES_maxIO,0,left);
   FILES_writeline(of1,true);

   while stillidents(cats) do
   	begin
        takeident(catname1,cats);
        i:=0;
        found:=false;
        categorytable1:=categorytable;
        while stillcatdefs(categorytable1) and not(found) do
             begin
   	     takecatdef(catdef1,categorytable1);
             catnames1:=catdef1^.catnames;
             while stillidents(catnames1) and not(found) do
   		begin
   		takeident(catname2,catnames1);
                i:=i+1;
                IF STRING_compare(catname1,catname2)=0 THEN found:=true
                else found:=false
   		end
   	     end;
        IF found THEN
           begin
 	   FILES_writestr(of1,'LICAT',FILES_maxIO,0,left);
           FILES_writeinteger(of1,i,0,left);
           FILES_writeline(of1,true);
           if stillidents(cats) then FILES_writechar(of1,',')
   	   end
        ELSE writeln('category used in CATSETS was not defined: ',catname1)
        end;
   FILES_writestr(of1,'  ];',FILES_maxIO,0,left);
   FILES_writeline(of1,true);
   FILES_writestr(of1,'IF cat in catset THEN LDCATSETS_',FILES_maxIO,0,left);
   FILES_writestring(of1,entry^.typename,0,left);
   FILES_writestr(of1,':=TRUE',FILES_maxIO,0,left);
   FILES_writeline(of1,true);
   FILES_writestr(of1,'ELSE LDCATSETS_',FILES_maxIO,0,left);
   FILES_writestring(of1,entry^.typename,0,left);
   FILES_writestr(of1,':=FALSE',FILES_maxIO,0,left);
   FILES_writeline(of1,true);
   FILES_writestr(of1,'END;',FILES_maxIO,0,left);
   FILES_writeline(of1,true)
   end
end;

procedure writemakefunctions(var of1,of2:FILES_text);
var 
    categorytable1:setofcatdefs;
    catdef1:pcatdef;
    catnames:setofidents;
    str:STRING_string;


   FUNCTION haskey (recordname:STRING_string): BOOLEAN;
   VAR record1:precord;
       recordtable1:setofrecords;
       recordfound:boolean;
   BEGIN{writeomega}
      recordtable1:=recordtable;
      recordfound:=false;
      haskey := false;
      WHILE stillrecords(recordtable1) and not(recordfound) DO BEGIN
	 takerecord(record1,recordtable1);
	 IF STRING_compare(record1^.recordname,recordname)=0 THEN recordfound:=true
      END;
      IF recordfound THEN BEGIN
	 IF record1^.keypresent THEN haskey := true;
      END
   END;{haskey}



procedure writeomegarecordbody(var of1:FILES_text;recordname:STRING_string);
var record1:precord;
    recordtable1:setofrecords;
    recordfound:boolean;
    attribs:setofattribs;
    attrib1:pattrib;
begin{writeomega}
recordtable1:=recordtable;
recordfound:=false;
while stillrecords(recordtable1) and not(recordfound) do
   begin
   takerecord(record1,recordtable1);
   if STRING_compare(record1^.recordname,recordname)=0 then recordfound:=true
   end;
if recordfound then
  begin
  FILES_writestr(of1,'BEGIN',FILES_maxIO,0,left);
  FILES_writeline(of1,true); 
  attribs:=record1^.attribs;
  while stillattribs(attribs) do
   begin
   takeattrib(attrib1,attribs);
   FILES_writechar(of1,';');
   FILES_writeline(of1,true);
   FILES_writestr(of1,'rec.',FILES_maxIO,0,left);
   FILES_writestring(of1,attrib1^.attribname,0,left);
   FILES_writechar(of1,':');
   FILES_writechar(of1,'=');
   FILES_writestring(of1,attrib1^.valeu,0,left)
   end;
  if record1^.keypresent then
      begin
      FILES_writechar(of1,';');
      FILES_writeline(of1,true);
      FILES_writestr(of1,'rec.key:=0',FILES_maxIO,0,left)
      end;
  if record1^.indexpresent then
      begin
      FILES_writechar(of1,';');
      FILES_writeline(of1,true);
      FILES_writestr(of1,'rec.index:=0',FILES_maxIO,0,left)
      end;
  FILES_writeline(of1,true);
  FILES_writestr(of1,'END;',FILES_maxIO,0,left);
  FILES_writeline(of1,true)
  end
else writeln('record ',recordname,' has been used but not defined')
end;{writeomega}


procedure writeblexomegarecordbody(var of1:FILES_text;
                                   catname: STRING_String;
                                   recordname:STRING_string);
var record1:precord;
    recordtable1:setofrecords;
    recordfound:boolean;
    attribs:setofattribs;
    attrib1:pattrib;
begin{writeblexomega}
recordtable1:=recordtable;
recordfound:=false;
while stillrecords(recordtable1) and not(recordfound) do
   begin
   takerecord(record1,recordtable1);
   if STRING_compare(record1^.recordname,recordname)=0 then recordfound:=true
   end;
if recordfound then
  begin
  FILES_writestr(of1,'BEGIN',FILES_maxIO,0,left);
  FILES_writeline(of1,true); 
  FILES_writestr(of1,'rec.KEY := 0;',FILES_maxIO,0,left);
  FILES_writestr(of1,'rec.CAT := ',FILES_maxIO,0,left);
  FILES_writestring(of1,catname,0,left);
  FILES_writechar(of1,';');
  FILES_writeline(of1,true);
  attribs:=record1^.attribs;
  while stillattribs(attribs) do
   begin
   takeattrib(attrib1,attribs);
   FILES_writeline(of1,true);
   FILES_writestr(of1,'      ',FILES_maxIO,0,left);
   FILES_writestr(of1,'rec.',FILES_maxIO,0,left);
   FILES_writestring(of1,catname,0,left);
   FILES_writestr(of1,'rec.',FILES_maxIO,0,left);
   FILES_writestring(of1,attrib1^.attribname,0,left);
   FILES_writechar(of1,':');
   FILES_writechar(of1,'=');
   FILES_writestring(of1,attrib1^.valeu,0,left);
   FILES_writechar(of1,';');
   end;
  if record1^.keypresent then
      begin
      FILES_writeline(of1,true);
      FILES_writestr(of1,'      ',FILES_maxIO,0,left);
      FILES_writestr(of1,'rec.',FILES_maxIO,0,left);
      FILES_writestring(of1,catname,0,left);
      FILES_writestr(of1,'rec.key := 0',FILES_maxIO,0,left);
      FILES_writechar(of1,';');
      end;
  FILES_writeline(of1,true);
  FILES_writestr(of1,'      ',FILES_maxIO,0,left);
  FILES_writestr(of1,'END;',FILES_maxIO,0,left);
  FILES_writeline(of1,true)
  end
else writeln('record ',recordname,' has been used but not defined')
end;{writeblexomega}


procedure writearguments(var of1:FILES_text;recordname:STRING_string);
var record1:precord;
    recordtable1:setofrecords;
    recordfound:boolean;
    attribs:setofattribs;
    attrib1:pattrib;
begin{writearguments}
recordtable1:=recordtable;
recordfound:=false;
while stillrecords(recordtable1) and not(recordfound) do
   begin
   takerecord(record1,recordtable1);
   if STRING_compare(record1^.recordname,recordname)=0 then recordfound:=true
   end;
if recordfound then
  begin
  attribs:=record1^.attribs;
  while stillattribs(attribs) do
   begin
   takeattrib(attrib1,attribs);
   FILES_writeline(of1,true);
   FILES_writestr(of1,'      ',FILES_maxIO,0,left);
   FILES_writestring(of1,attrib1^.attribname,0,left);
   FILES_writestr(of1,' : LSDOMAINT_',FILES_maxIO,0,left);
   FILES_writestring(of1,attrib1^.typename,0,left);
   FILES_writechar(of1,';');
   end;
  if record1^.keypresent then
      begin
      FILES_writeline(of1,true);
      FILES_writestr(of1,'key: INTEGER',FILES_maxIO,0,left)
      end;
  FILES_writeline(of1,true);
  end
else writeln('record ',recordname,' has been used but not defined')
end;{writearguments}


procedure writefillrecordbody(var of1:FILES_text;
                              catname: STRING_String;
                              recordname:STRING_string);
var record1:precord;
    recordtable1:setofrecords;
    recordfound:boolean;
    attribs:setofattribs;
    attrib1:pattrib;
begin{writefillrecord}
recordtable1:=recordtable;
recordfound:=false;
while stillrecords(recordtable1) and not(recordfound) do
   begin
   takerecord(record1,recordtable1);
   if STRING_compare(record1^.recordname,recordname)=0 then recordfound:=true
   end;
if recordfound then
  begin
  FILES_writestr(of1,'BEGIN',FILES_maxIO,0,left);
  FILES_writeline(of1,true); 
  FILES_writestr(of1,'      ',FILES_maxIO,0,left);
  FILES_writestr(of1,'rec.KEY := KEY;',FILES_maxIO,0,left);
  FILES_writeline(of1,true); 
  FILES_writestr(of1,'      ',FILES_maxIO,0,left);
  FILES_writestr(of1,'rec.CAT := ',FILES_maxIO,0,left);
  FILES_writestring(of1,catname,0,left);
  FILES_writechar(of1,';');
  FILES_writeline(of1,true);
  attribs:=record1^.attribs;
  while stillattribs(attribs) do
   begin
   takeattrib(attrib1,attribs);
   FILES_writeline(of1,true);
   FILES_writestr(of1,'      ',FILES_maxIO,0,left);
   FILES_writestr(of1,'rec.',FILES_maxIO,0,left);
   FILES_writestring(of1,catname,0,left);
   FILES_writestr(of1,'rec.',FILES_maxIO,0,left);
   FILES_writestring(of1,attrib1^.attribname,0,left);
   FILES_writechar(of1,':');
   FILES_writechar(of1,'=');
   FILES_writestring(of1,attrib1^.attribname,0,left);
   FILES_writechar(of1,';');
   end;
  if record1^.keypresent then
      begin
      FILES_writeline(of1,true);
      FILES_writestr(of1,'      ',FILES_maxIO,0,left);
      FILES_writestr(of1,'rec.',FILES_maxIO,0,left);
      FILES_writestring(of1,catname,0,left);
      FILES_writestr(of1,'rec.key := KEY',FILES_maxIO,0,left);
      FILES_writechar(of1,';');
      end;
  FILES_writeline(of1,true);
  FILES_writestr(of1,'      ',FILES_maxIO,0,left);
  FILES_writestr(of1,'MAKET_BLEX',FILES_maxIO,0,left);
  FILES_writestring(of1,catname,0,left);
  FILES_writestr(of1,'rec := rec;',FILES_maxIO,0,left);
  FILES_writeline(of1,true);
  FILES_writestr(of1,'END;',FILES_maxIO,0,left);
  FILES_writeline(of1,true)
  end
else writeln('record ',recordname,' has been used but not defined')
end;{writefillrecord}




begin{writemakefunctions}
categorytable1:=categorytable;
while stillcatdefs(categorytable1) do
   begin
   takecatdef(catdef1,categorytable1);
   catnames:=catdef1^.catnames;

   while stillidents(catnames) do
   	begin

        takeident(str,catnames);
        FILES_writestr(of1,'PROCEDURE MAKET_',
   					      FILES_maxIO,0,left); 
        FILES_writestring(of1,str,0,left);
        FILES_writestr(of1,'rec(',FILES_maxIO,0,left);
        FILES_writeline(of1,true);
        FILES_writestr(of1,'    VAR rec:LSDOMAINT_',FILES_maxIO,0,left);
        FILES_writestring(of1,catdef1^.recordname,0,left);
        FILES_writestr(of1,');   EXTERNAL;',FILES_maxIO,0,left);
        FILES_writeline(of1,true);


        FILES_writestr(of2,'PROCEDURE MAKET_',
                                               FILES_maxIO,0,left);
        FILES_writestring(of2,str,0,left);
        FILES_writestr(of2,'rec(',FILES_maxIO,0,left);
        FILES_writeline(of2,true);
        FILES_writestr(of2,'    VAR rec:LSDOMAINT_',FILES_maxIO,0,left);
        FILES_writestring(of2,catdef1^.recordname,0,left);
        FILES_writestr(of2,');',FILES_maxIO,0,left);
        FILES_writeline(of2,true);
        writeomegarecordbody(of2,catdef1^.recordname)
   	end
   end;

   FILES_writeline(of1,true);

     FILES_writestr(of1,'PROCEDURE MAKET_BLEXStruct(',
					   FILES_maxIO,0,left); 
     FILES_writeline(of1,true);
     FILES_writestr(of1,'    Cat:LIDOMAINT_SyntCat;',FILES_maxIO,0,left);
     FILES_writeline(of1,true);
     FILES_writestr(of1,'    VAR rec:LSDOMAINT_BLEXStruct',FILES_maxIO,0,left);
     FILES_writestr(of1,');   EXTERNAL;',FILES_maxIO,0,left);
     FILES_writeline(of1,true);

     FILES_writeline(of2,true);
     FILES_writestr(of2,'PROCEDURE MAKET_BLEXStruct(',
					   FILES_maxIO,0,left); 
     FILES_writeline(of2,true);
     FILES_writestr(of2,'    Cat:LIDOMAINT_SyntCat;',FILES_maxIO,0,left);
     FILES_writeline(of2,true);
     FILES_writestr(of2,'    VAR rec:LSDOMAINT_BLEXStruct',FILES_maxIO,0,left);
     FILES_writestr(of2,');',FILES_maxIO,0,left);
     FILES_writeline(of2,true);
     FILES_WriteStr(of2,'BEGIN', FILES_MaxIO, 0, LEFT);
     FILES_writeline(of2,true);
     FILES_WriteStr(of2,'   CASE LoopHoles.Retype(Cat,LSDOMAINT_SyntCat) OF ', FILES_MaxIO, 0, LEFT);
     FILES_writeline(of2,true);


categorytable1:=categorytable;
while stillcatdefs(categorytable1) do
   begin
   takecatdef(catdef1,categorytable1);
   catnames:=catdef1^.catnames;

   while stillidents(catnames) and haskey(catdef1^.recordname) do
   	begin

        takeident(str,catnames);
        FILES_WriteStr(of2, '      ', FILES_MaxIO, 0, LEFT);
        FILES_WriteString(of2, str, 0, LEFT);
        FILES_WriteStr(of2, ' : ', FILES_MaxIO, 0, LEFT);
        writeblexomegarecordbody(of2,str,catdef1^.recordname)

   	end
   end;
FILES_WriteStr(of2,'   END;', FILES_MaxIO, 0, LEFT);
FILES_writeline(of2,true);
FILES_WriteStr(of2,'END {MAKET_BLEXSTRUCT};', FILES_MaxIO, 0, LEFT);
FILES_writeline(of2,true);

   FILES_writeline(of1,true);
   FILES_writestr(of1,'FUNCTION MAKET_Stree(', FILES_maxIO,0,left); 
   FILES_writestr(of1,'cat:LSDOMAINT_syntcat): LSSTREE_pStree;',
                  FILES_maxIO,0,left);
   FILES_writeline(of1,true);
   FILES_writestr(of1,'   EXTERNAL;',FILES_maxIO,0,left);
   FILES_writeline(of1,true);
   FILES_writeline(of1,true);

   FILES_writeline(of2,true);
   FILES_writestr(of2,'FUNCTION MAKET_Stree(', FILES_maxIO,0,left); 
   FILES_writestr(of2,'cat:LSDOMAINT_syntcat): LSSTREE_pStree;',
                  FILES_maxIO,0,left);
   FILES_writeline(of2,true);
   FILES_writestr(of2,'VAR t: LSSTREE_pStree;',FILES_maxIO, 0, left);
   FILES_writeline(of2, true);
   FILES_writestr(of2,'BEGIN',FILES_maxIO, 0, left);
   FILES_writeline(of2, true);
   FILES_writestr(of2,'   CASE cat OF',FILES_maxIO, 0, left);
   FILES_writeline(of2, true);

categorytable1:=categorytable;
while stillcatdefs(categorytable1) do
   begin
   takecatdef(catdef1,categorytable1);
   catnames:=catdef1^.catnames;

   while stillidents(catnames) do
   	begin

        takeident(str,catnames);
        
        FILES_writestring(of2,str,0,left);
        FILES_writestr(of2,':',FILES_maxIO, 0, left);
        FILES_writestr(of2,' BEGIN',FILES_maxIO, 0, left);
        FILES_writeline(of2, true);
        FILES_writestr(of2,'         LISTREE_MakeStree(LoopHoles.Retype(t,LISTREE_pStree)); t^.cat := ',FILES_maxIO, 0, left);
        FILES_writestring(of2,str,0,left);
        FILES_writestr(of2,';',FILES_maxIO, 0, left);
        FILES_writeline(of2, true);
        FILES_writestr(of2,'         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_LSRecord),LoopHoles.Retype(t^.LS,Mem_Ptr)); t^.LS^.cat := ',FILES_maxIO, 0, left);          
        FILES_writestring(of2,str,0,left);
        FILES_writestr(of2,';',FILES_maxIO, 0, left);
        FILES_writeline(of2, true);
        FILES_writestr(of2,'         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_',FILES_maxIO, 0, left);
        FILES_writestring(of2,catdef1^.recordname,0,left);
        FILES_writestr(of2,'), Loopholes.Retype(t^.LS^.',FILES_maxIO, 0, left);
        FILES_writestring(of2,str,0,left);
        FILES_writestr(of2,'field,Mem_Ptr));',FILES_maxIO, 0, left);
        FILES_writeline(of2, true);
        FILES_writestr(of2,'         MAKET_',FILES_maxIO, 0, left);
        FILES_writestring(of2,str,0,left);
        FILES_writestr(of2,'rec(t^.LS^.',FILES_maxIO, 0, left);
        FILES_writestring(of2,str,0,left);
        FILES_writestr(of2,'field^);',FILES_maxIO, 0, left);
        FILES_writeline(of2, true);
        FILES_writestr(of2,'      END;',FILES_maxIO, 0, left);
        FILES_writeline(of2, true);
   	end
   end;

   FILES_writestr(of2,'   END;',FILES_maxIO, 0, left);
   FILES_writeline(of2, true);
   FILES_writestr(of2,'   MAKET_Stree := t;',FILES_maxIO, 0, left);
   FILES_writeline(of2, true);
   FILES_writestr(of2,'END;',FILES_maxIO, 0, left);
   FILES_writeline(of2, true);
   FILES_writeline(of2, true);

categorytable1:=categorytable;
while stillcatdefs(categorytable1) do
   begin
   takecatdef(catdef1,categorytable1);
   catnames:=catdef1^.catnames;

   while stillidents(catnames) and haskey(catdef1^.recordname) do
   	begin

        takeident(str,catnames);
        FILES_writestr(of1,'FUNCTION MAKET_BLEX',
   					      FILES_maxIO,0,left); 
        FILES_writestring(of1,str,0,left);
        FILES_writestr(of1,'rec(',FILES_maxIO,0,left);
        writearguments(of1,catdef1^.recordname);
        FILES_writestr(of1,'): LSDOMAINT_BLEXStruct',FILES_maxIO,0,left);
        FILES_writestr(of1,';   EXTERNAL;',FILES_maxIO,0,left);
        FILES_writeline(of1,true);
        FILES_writeline(of1,true);


        FILES_writestr(of2,'FUNCTION MAKET_BLEX',
                                               FILES_maxIO,0,left);
        FILES_writestring(of2,str,0,left);
        FILES_writestr(of2,'rec(',FILES_maxIO,0,left);
        writearguments(of2,catdef1^.recordname);
        FILES_writestr(of2,'): LSDOMAINT_BLEXStruct;',FILES_maxIO,0,left);
        FILES_writeline(of2,true);
        FILES_writestr(of2,'VAR rec:LSDOMAINT_BLEXStruct;',FILES_maxIO,0,left);
        FILES_writeline(of2,true);
        writefillrecordbody(of2,str,catdef1^.recordname);
        FILES_writeline(of2,true);
   	end
   end;

   FILES_writeline(of1,true);

   FILES_writeline(of1,true);
   FILES_writestr(of1,'FUNCTION MAKET_StreeFromBLEXrec(', FILES_maxIO,0,left); 
   FILES_writestr(of1,'cat:LSDOMAINT_syntcat;',FILES_maxIO,0,left);
   FILES_writeline(of1,true);
   FILES_writestr(of1,'rec:LSDOMAINT_BLEXStruct): LSSTREE_pStree;',
                  FILES_maxIO,0,left);
   FILES_writeline(of1,true);
   FILES_writestr(of1,'   EXTERNAL;',FILES_maxIO,0,left);
   FILES_writeline(of1,true);

   FILES_writeline(of2,true);
   FILES_writestr(of2,'FUNCTION MAKET_StreeFromBLEXrec(', FILES_maxIO,0,left); 
   FILES_writestr(of2,'cat:LSDOMAINT_syntcat;',FILES_maxIO,0,left);
   FILES_writeline(of2,true);
   FILES_writestr(of2,'rec:LSDOMAINT_BLEXStruct): LSSTREE_pStree;',FILES_maxIO,0,left);
   FILES_writeline(of2,true);
   FILES_writestr(of2,'VAR t: LSSTREE_pStree;',FILES_maxIO, 0, left);
   FILES_writeline(of2, true);
   FILES_writestr(of2,'BEGIN',FILES_maxIO, 0, left);
   FILES_writeline(of2, true);
   FILES_writestr(of2,'   CASE cat OF',FILES_maxIO, 0, left);
   FILES_writeline(of2, true);

categorytable1:=categorytable;
while stillcatdefs(categorytable1) do
   begin
   takecatdef(catdef1,categorytable1);
   catnames:=catdef1^.catnames;

   while stillidents(catnames) and haskey(catdef1^.recordname) do
   	begin

        takeident(str,catnames);
        
        FILES_writestring(of2,str,0,left);
        FILES_writestr(of2,':',FILES_maxIO, 0, left);
        FILES_writestr(of2,' BEGIN',FILES_maxIO, 0, left);
        FILES_writeline(of2, true);
        FILES_writestr(of2,'         LISTREE_MakeStree(LoopHoles.Retype(t,LISTREE_pStree)); t^.cat := ',FILES_maxIO, 0, left);
        FILES_writestring(of2,str,0,left);
        FILES_writestr(of2,';',FILES_maxIO, 0, left);
        FILES_writeline(of2, true);
        FILES_writestr(of2,'         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_LSRecord),LoopHoles.Retype(t^.LS,Mem_Ptr)); t^.LS^.cat := ',FILES_maxIO, 0, left);          
        FILES_writestring(of2,str,0,left);
        FILES_writestr(of2,';',FILES_maxIO, 0, left);
        FILES_writeline(of2, true);
        FILES_writestr(of2,'         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_',FILES_maxIO, 0, left);
        FILES_writestring(of2,catdef1^.recordname,0,left);
        FILES_writestr(of2,'), LoopHoles.Retype(t^.LS^.',FILES_maxIO, 0, left);
        FILES_writestring(of2,str,0,left);
        FILES_writestr(of2,'field,Mem_Ptr));',FILES_maxIO, 0, left);
        FILES_writeline(of2, true);
        FILES_writestr(of2,'         t^.LS^.',FILES_maxIO, 0, left);
        FILES_writestring(of2,str,0,left);
        FILES_writestr(of2,'field^ := rec.',FILES_maxIO, 0, left);
        FILES_writestring(of2,str,0,left);
        FILES_writestr(of2,'rec;',FILES_maxIO, 0, left);
        FILES_writeline(of2, true);
        FILES_writestr(of2,'      END;',FILES_maxIO, 0, left);
        FILES_writeline(of2, true);
   	end
   end;

   FILES_writestr(of2,'   END;',FILES_maxIO, 0, left);
   FILES_writeline(of2, true);
   FILES_writestr(of2,'   MAKET_StreeFromBLEXrec := t;',FILES_maxIO, 0, left);
   FILES_writeline(of2, true);
   FILES_writestr(of2,'END;',FILES_maxIO, 0, left);
   FILES_writeline(of2, true);

   FILES_writeline(of1,true);

   FILES_writeline(of1,true);
   FILES_writestr(of1,'FUNCTION MAKET_BlexrecFromStree(', FILES_maxIO,0,left); 
   FILES_writestr(of1,'key: INTEGER;',FILES_maxIO,0,left);
   FILES_writeline(of1,true);
   FILES_writestr(of1,'t:LSSTREE_pStree): LSDOMAINT_BlexStruct;',
                  FILES_maxIO,0,left);
   FILES_writeline(of1,true);
   FILES_writestr(of1,'   EXTERNAL;',FILES_maxIO,0,left);
   FILES_writeline(of1,true);

   FILES_writeline(of2,true);

   FILES_writestr(of2,'FUNCTION MAKET_BlexrecFromStree(', FILES_maxIO,0,left); 
   FILES_writestr(of2,'key: INTEGER;',FILES_maxIO,0,left);
   FILES_writeline(of2,true);
   FILES_writestr(of2,'t:LSSTREE_pStree): LSDOMAINT_BlexStruct;',
                  FILES_maxIO,0,left);
   FILES_writeline(of2,true);

   FILES_writestr(of2,'VAR b: LSDOMAINT_BlexStruct;',FILES_maxIO, 0, left);
   FILES_writeline(of2, true);
   FILES_writestr(of2,'BEGIN',FILES_maxIO, 0, left);
   FILES_writeline(of2, true);
   FILES_writestr(of2,'   b.key := key;',FILES_maxIO, 0, left);
   FILES_writeline(of2, true);
   FILES_writestr(of2,'   b.IsBxpr := true;',FILES_maxIO, 0, left);
   FILES_writeline(of2, true);
   FILES_writestr(of2,'   b.cat := t^.LS^.cat;',FILES_maxIO, 0, left);
   FILES_writeline(of2, true);
   FILES_writestr(of2,'   CASE t^.LS^.cat OF',FILES_maxIO, 0, left);
   FILES_writeline(of2, true);

categorytable1:=categorytable;
while stillcatdefs(categorytable1) do
   begin
   takecatdef(catdef1,categorytable1);
   catnames:=catdef1^.catnames;

   while stillidents(catnames) and haskey(catdef1^.recordname) do
   	begin

        takeident(str,catnames);
        
        FILES_writestr(of2,'        ',FILES_maxIO, 0, left);
        FILES_writestring(of2,str,0,left);
        FILES_writestr(of2,':',FILES_maxIO, 0, left);
        FILES_writestr(of2,' b.',FILES_maxIO, 0, left);
        FILES_writestring(of2,str,0,left);
        FILES_writestr(of2,'rec := t^.LS^.',FILES_maxIO, 0, left);
        FILES_writestring(of2,str,0,left);
        FILES_writestr(of2,'field^;',FILES_maxIO, 0, left);
        FILES_writeline(of2, true);
   	end
   end;

   FILES_writestr(of2,'   END;',FILES_maxIO, 0, left);
   FILES_writeline(of2, true);
   FILES_writestr(of2,'   MAKET_BlexrecFromStree := b;',FILES_maxIO, 0, left);
   FILES_writeline(of2, true);
   FILES_writestr(of2,'END;',FILES_maxIO, 0, left);
   FILES_writeline(of2, true);

end;


procedure writeldgetkeyfunction(var of2:FILES_text);
var 
    categorytable1:setofcatdefs;
    catdef1:pcatdef;
    catnames:setofidents;
    str:STRING_string;

FUNCTION haskey (recordname:STRING_string): BOOLEAN;
VAR record1:precord;
    recordtable1:setofrecords;
    recordfound:boolean;
BEGIN{writeomega}
   recordtable1:=recordtable;
   recordfound:=false;
   haskey := false;
   WHILE stillrecords(recordtable1) and not(recordfound) DO BEGIN
      takerecord(record1,recordtable1);
      IF STRING_compare(record1^.recordname,recordname)=0 THEN recordfound:=true
   END;
   IF recordfound THEN BEGIN
      IF record1^.keypresent THEN haskey := true;
   END
END;{haskey}

FUNCTION hasindex (recordname:STRING_string): BOOLEAN;
VAR record1:precord;
    recordtable1:setofrecords;
    recordfound:boolean;
BEGIN{writeomega}
   recordtable1:=recordtable;
   recordfound:=false;
   hasindex := false;
   WHILE stillrecords(recordtable1) and not(recordfound) DO BEGIN
      takerecord(record1,recordtable1);
      IF STRING_compare(record1^.recordname,recordname)=0 THEN recordfound:=true
   END;
   IF recordfound THEN BEGIN
      IF record1^.indexpresent THEN hasindex := true;
   END
END;{hasindex}

begin{writemakefunctions}

   FILES_writeline(of2,true);
   FILES_writestr(of2,'FUNCTION LDGETKEY_Get(', FILES_maxIO,0,left); 
   FILES_writestr(of2,'s:LISTREE_pStree): INTEGER;',FILES_maxIO,0,left);
   FILES_writeline(of2,true);
   FILES_writestr(of2,'VAR t: LSSTREE_pStree;',FILES_maxIO, 0, left);
   FILES_writeline(of2,true);
   FILES_writestr(of2,'BEGIN',FILES_maxIO, 0, left);
   FILES_writeline(of2, true);
   FILES_writestr(of2,'   t := LoopHoles.Retype(s,LSSTREE_pStree);',FILES_maxIO, 0, left);
   FILES_writeline(of2,true);
   FILES_writestr(of2,'   CASE t^.cat OF',FILES_maxIO, 0, left);
   FILES_writeline(of2, true);

categorytable1:=categorytable;
while stillcatdefs(categorytable1) do begin
   takecatdef(catdef1,categorytable1);
   catnames:=catdef1^.catnames;
   IF haskey(catdef1^.recordname) THEN BEGIN
     while stillidents(catnames) do begin

        takeident(str,catnames);
        
        FILES_writestr(of2,'   ',FILES_maxIO, 0, left);
        FILES_writestring(of2,str,0,left);
        FILES_writestr(of2,':',FILES_maxIO, 0, left);
        FILES_writestr(of2,' BEGIN',FILES_maxIO, 0, left);
        FILES_writeline(of2, true);
        FILES_writestr(of2,'         LDGETKEY_Get := t^.LS^.',FILES_maxIO, 0, left);
        FILES_writestring(of2,str,0,left);
        FILES_writestr(of2,'field^.KEY;',FILES_maxIO, 0, left);
        FILES_writeline(of2, true);
        FILES_writestr(of2,'      END;',FILES_maxIO, 0, left);
        FILES_writeline(of2, true);
     end
   END;
   IF hasindex(catdef1^.recordname) THEN BEGIN
     while stillidents(catnames) do begin

        takeident(str,catnames);
        
        FILES_writestr(of2,'   ',FILES_maxIO, 0, left);
        FILES_writestring(of2,str,0,left);
        FILES_writestr(of2,':',FILES_maxIO, 0, left);
        FILES_writestr(of2,' BEGIN',FILES_maxIO, 0, left);
        FILES_writeline(of2, true);
        FILES_writestr(of2,'         LDGETKEY_Get := t^.LS^.',FILES_maxIO, 0, left);
        FILES_writestring(of2,str,0,left);
        FILES_writestr(of2,'field^.INDEX;',FILES_maxIO, 0, left);
        FILES_writeline(of2, true);
        FILES_writestr(of2,'      END;',FILES_maxIO, 0, left);
        FILES_writeline(of2, true);
     end
   END;
end;

   FILES_writestr(of2,'   END;',FILES_maxIO, 0, left);
   FILES_writeline(of2, true);

   FILES_writestr(of2,'END {LDGETKEY_Get};',FILES_maxIO, 0, left);
   FILES_writeline(of2, true);

   FILES_writeline(of2,true);
   FILES_writestr(of2,'PROCEDURE LDGETKEY_Put(', FILES_maxIO,0,left); 
   FILES_writestr(of2,'VAR s:LISTREE_pStree; k: INTEGER);',FILES_maxIO,0,left);
   FILES_writeline(of2,true);
   FILES_writestr(of2,'VAR t: LSSTREE_pStree;',FILES_maxIO, 0, left);
   FILES_writeline(of2,true);
   FILES_writestr(of2,'BEGIN',FILES_maxIO, 0, left);
   FILES_writeline(of2, true);
   FILES_writestr(of2,'   t := LoopHoles.Retype(s,LSSTREE_pStree);',FILES_maxIO, 0, left);
   FILES_writeline(of2,true);
   FILES_writestr(of2,'   CASE t^.cat OF',FILES_maxIO, 0, left);
   FILES_writeline(of2, true);

categorytable1:=categorytable;
while stillcatdefs(categorytable1) do begin
   takecatdef(catdef1,categorytable1);
   catnames:=catdef1^.catnames;
   IF haskey(catdef1^.recordname) THEN BEGIN
     while stillidents(catnames) do begin

        takeident(str,catnames);
        
        FILES_writestr(of2,'   ',FILES_maxIO, 0, left);
        FILES_writestring(of2,str,0,left);
        FILES_writestr(of2,':',FILES_maxIO, 0, left);
        FILES_writestr(of2,' BEGIN',FILES_maxIO, 0, left);
        FILES_writeline(of2, true);
        FILES_writestr(of2,'         t^.LS^.',FILES_maxIO, 0, left);
        FILES_writestring(of2,str,0,left);
        FILES_writestr(of2,'field^.KEY := k;',FILES_maxIO, 0, left);
        FILES_writeline(of2, true);
        FILES_writestr(of2,'      END;',FILES_maxIO, 0, left);
        FILES_writeline(of2, true);
     end
   END;
   IF hasindex(catdef1^.recordname) THEN BEGIN
     while stillidents(catnames) do begin

        takeident(str,catnames);
        
        FILES_writestr(of2,'   ',FILES_maxIO, 0, left);
        FILES_writestring(of2,str,0,left);
        FILES_writestr(of2,':',FILES_maxIO, 0, left);
        FILES_writestr(of2,' BEGIN',FILES_maxIO, 0, left);
        FILES_writeline(of2, true);
        FILES_writestr(of2,'         t^.LS^.',FILES_maxIO, 0, left);
        FILES_writestring(of2,str,0,left);
        FILES_writestr(of2,'field^.INDEX := k;',FILES_maxIO, 0, left);
        FILES_writeline(of2, true);
        FILES_writestr(of2,'      END;',FILES_maxIO, 0, left);
        FILES_writeline(of2, true);
     end
   END;
end;



   FILES_writestr(of2,'   END;',FILES_maxIO, 0, left);
   FILES_writeline(of2, true);

   FILES_writestr(of2,'END {LDGETKEY_Put};',FILES_maxIO, 0, left);
   FILES_writeline(of2, true);
end;


procedure writecopyfunctions(VAR of1,of2:FILES_text);
var copiestable1:setofcopies;
    copy1:pcopy;

    integertable1,booleantable1:setofidents;
    enumtable1:setofenums;
    subrangetable1:setofsubranges;
    settable1:setofSETOFs;
    i:INTEGER;
    enum1:penum;
    subrange1:psubrange;
    setof1:psetof;                                                 
    ident:STRING_string;




procedure writecopybody(VAR of1:FILES_text;recordname1,recordname2,
                                           functionname1:STRING_string);
var recordtable1:setofrecords;
    attribs1,attribs2:setofattribs;
    attrib1,attrib2:pattrib;
    record1,record2:precord;
    record1found,record2found,attribmatch,semicolon:boolean;
begin
recordtable1:=recordtable;
record1found:=false;
while stillrecords(recordtable1) and not(record1found) do
	begin
	takerecord(record1,recordtable1);
	if STRING_compare(record1^.recordname,recordname1)=0 then 
						record1found:=true
	end;
recordtable1:=recordtable;
record2found:=false;
while stillrecords(recordtable1) and not(record2found) do
	begin
	takerecord(record2,recordtable1);
	if STRING_compare(record2^.recordname,recordname2)=0 then 
						record2found:=true
	end;
if record1found and record2found then
	begin
        FILES_writestr(of1,'VAR rec2:LSDOMAINT_',FILES_maxIO,0,left);
        FILES_writestring(of1,recordname2,0,left);
        FILES_writechar(of1,';');
        FILES_writeline(of1,true);
	FILES_writestr(of1,'BEGIN',FILES_maxIO,0,left);
	FILES_writeline(of1,true);
	attribs2:=record2^.attribs;
        FILES_writestr(of1,'WITH rec2 DO',FILES_maxIO,0,left);
	FILES_writeline(of1,true);
        FILES_writestr(of1,'     BEGIN',FILES_maxIO,0,left);
	FILES_writeline(of1,true);
        semicolon:=false;
	while stillattribs(attribs2) do
		begin
		takeattrib(attrib2,attribs2);
		attribs1:=record1^.attribs;
                attribmatch:=false;
		while stillattribs(attribs1) and not(attribmatch) do
		      begin
		      takeattrib(attrib1,attribs1);
		      if (STRING_compare(attrib1^.attribname,
					attrib2^.attribname)=0) and
                         (STRING_compare(attrib1^.typename,
                                        attrib2^.typename)=0) then
			  begin
			  attribmatch:=true;
                          if semicolon then 
                               begin
                               FILES_writechar(of1,';');
                               FILES_writeline(of1,true)
                               end
                          else semicolon:=true;
                          FILES_writestr(of1,'     ',FILES_maxIO,0,left);
			  FILES_writestring(of1,attrib2^.attribname,0,left);
                          FILES_writestr(of1,':= rec1.',FILES_maxIO,0,left);
			  FILES_writestring(of1,attrib1^.attribname,0,left)
			  end
	              end;
                IF not attribmatch THEN
   			BEGIN
                        if semicolon then 
                               begin
                               FILES_writechar(of1,';');
                               FILES_writeline(of1,true)
                               end
                        else semicolon:=true;
                        FILES_writestr(of1,'     ',FILES_maxIO,0,left);
			FILES_writestring(of1,attrib2^.attribname,0,left);
                        FILES_writestr(of1,':= ',FILES_maxIO,0,left);
			FILES_writestring(of1,attrib2^.valeu,0,left)
   			END
		end;
       if record1^.keypresent and record2^.keypresent then
   		begin
	        FILES_writechar(of1,';');
                FILES_writeline(of1,true);
                FILES_writestr(of1,'     key:=rec1.key',FILES_maxIO,0,left)
                end;
       if record1^.indexpresent and record2^.indexpresent then
   		begin
	        FILES_writechar(of1,';');
                FILES_writeline(of1,true);
                FILES_writestr(of1,'     index:=rec1.index',FILES_maxIO,0,left)
                end;
        FILES_writeline(of1,true);
        FILES_writestr(of1,'     END;',FILES_maxIO,0,left);
	FILES_writeline(of1,true);
        FILES_writestr(of1,'COPYT_',FILES_maxIO,0,left);
        FILES_writestring(of1,functionname1,0,left);
        FILES_writestr(of1,':=rec2',FILES_maxIO,0,left);
        FILES_writeline(of1,true);
        FILES_writestr(of1,'END;',FILES_maxIO,0,left);
	FILES_writeline(of1,true)
	end
else
	begin
	if not(record1found) then writeln('record ',recordname1,
                                ' has been used but not defined');
	if not(record2found) then writeln('record ',recordname2,
                                ' has been used but not defined')
	end
end;{writecopybody}
procedure writecopycondbody(VAR of1:FILES_text;recordname1,recordname2,
                                           functionname1:STRING_string);
var recordtable1:setofrecords;
    attribs1,attribs2:setofattribs;
    attrib1,attrib2:pattrib;
    record1,record2:precord;
    record1found,record2found,attribmatch,writeAND:boolean;
begin
recordtable1:=recordtable;
record1found:=false;
while stillrecords(recordtable1) and not(record1found) do
	begin
	takerecord(record1,recordtable1);
	if STRING_compare(record1^.recordname,recordname1)=0 then 
						record1found:=true
	end;
recordtable1:=recordtable;
record2found:=false;
while stillrecords(recordtable1) and not(record2found) do
	begin
	takerecord(record2,recordtable1);
	if STRING_compare(record2^.recordname,recordname2)=0 then 
						record2found:=true
	end;
if record1found and record2found then
	begin
	FILES_writestr(of1,'BEGIN',FILES_maxIO,0,left);
	FILES_writeline(of1,true);
        FILES_writestr(of1,'COPYX_',FILES_maxIO,0,left);
        FILES_writestring(of1,functionname1,0,left);
	FILES_writestr(of1,':=',FILES_maxIO,0,left);
	FILES_writeline(of1,true);
	attribs2:=record2^.attribs;
        writeAND:=false;
	while stillattribs(attribs2) do
		begin
		takeattrib(attrib2,attribs2);
		attribs1:=record1^.attribs;
                attribmatch:=false;
		while stillattribs(attribs1) and not(attribmatch) do
		      begin
		      takeattrib(attrib1,attribs1);
		      if (STRING_compare(attrib1^.attribname,
					attrib2^.attribname)=0) and
                         (STRING_compare(attrib1^.typename,
                                        attrib2^.typename)=0) then
			  begin
			  attribmatch:=true;
                          if writeAND then 
                               begin
                               FILES_writestr(of1,' AND',FILES_maxio,0,left);
                               FILES_writeline(of1,true)
                               end
                          else writeAND:=true;
                          FILES_writestr(of1,'  (rec2.',FILES_maxIO,0,left);
			  FILES_writestring(of1,attrib2^.attribname,0,left);
                          FILES_writestr(of1,'= rec1.',FILES_maxIO,0,left);
			  FILES_writestring(of1,attrib1^.attribname,0,left);
                          FILES_writechar(of1,')');
			  end
	              end;
		end;
       if record1^.keypresent and record2^.keypresent then
   		begin
	        FILES_writestr(of1,' AND',FILES_maxIO,0,left);
                FILES_writeline(of1,true);
                FILES_writestr(of1,'  (rec2.key=rec1.key)',FILES_maxIO,0,left)
                end;
       if record1^.indexpresent and record2^.indexpresent then
   		begin
	        FILES_writestr(of1,' AND',FILES_maxIO,0,left);
                FILES_writeline(of1,true);
                FILES_writestr(of1,'  (rec2.index=rec1.index)',FILES_maxIO,0,left)
                end;
        IF NOT writeAND THEN
                FILES_writestr(of1,' TRUE',FILES_maxIO,0,left);
        FILES_writeline(of1,true);
        FILES_writestr(of1,'END;',FILES_maxIO,0,left);
	FILES_writeline(of1,true)
	end
end;
begin{writecopyfunctions}
copiestable1:=copiestable;
while stillcopies(copiestable1) do
   begin
   takecopy(copy1,copiestable1);
   FILES_writestr(of1,'FUNCTION COPYT_',
   					      FILES_maxIO,0,left); 
   FILES_writestring(of1,copy1^.functionname,0,left);
   FILES_writestr(of1,'(',FILES_maxIO,0,left);
   FILES_writeline(of1,true);
   FILES_writestr(of1,'  rec1:LSDOMAINT_',FILES_maxIO,0,left);
   FILES_writestring(of1,copy1^.recordname1,0,left);
   FILES_writestr(of1,'):LSDOMAINT_',FILES_maxIO,0,left);
   FILES_writestring(of1,copy1^.recordname2,0,left);
   FILES_writeline(of1,true);
   FILES_writestr(of1,'                     ;EXTERNAL;',FILES_maxIO,0,left);
   FILES_writeline(of1,true);
   FILES_writestr(of2,'FUNCTION COPYT_',
   					      FILES_maxIO,0,left); 
   FILES_writestring(of2,copy1^.functionname,0,left);
   FILES_writestr(of2,'(',FILES_maxIO,0,left);
   FILES_writeline(of2,true);
   FILES_writestr(of2,'  rec1:LSDOMAINT_',FILES_maxIO,0,left);
   FILES_writestring(of2,copy1^.recordname1,0,left);
   FILES_writestr(of2,'):LSDOMAINT_',FILES_maxIO,0,left);
   FILES_writestring(of2,copy1^.recordname2,0,left);
   FILES_writestr(of2,';',FILES_maxIO,0,left);
   FILES_writeline(of2,true);
   writecopybody(of2,copy1^.recordname1,copy1^.recordname2,copy1^.functionname);
   FILES_writestr(of1,'FUNCTION COPYX_',
   					      FILES_maxIO,0,left); 
   FILES_writestring(of1,copy1^.functionname,0,left);
   FILES_writestr(of1,'(',FILES_maxIO,0,left);
   FILES_writeline(of1,true);
   FILES_writestr(of1,'  rec2:LSDOMAINT_',FILES_maxIO,0,left);
   FILES_writestring(of1,copy1^.recordname2,0,left);
   FILES_writestr(of1,';',FILES_maxIO,0,left);
   FILES_writeline(of1,true);
   FILES_writestr(of1,'  rec1:LSDOMAINT_',FILES_maxIO,0,left);
   FILES_writestring(of1,copy1^.recordname1,0,left);
   FILES_writestr(of1,'):BOOLEAN; EXTERNAL;',FILES_maxIO,0,left);
   FILES_writeline(of1,true);
   FILES_writestr(of2,'FUNCTION COPYX_',
   					      FILES_maxIO,0,left); 
   FILES_writestring(of2,copy1^.functionname,0,left);
   FILES_writestr(of2,'(',FILES_maxIO,0,left);
   FILES_writeline(of2,true);
   FILES_writestr(of2,'  rec2:LSDOMAINT_',FILES_maxIO,0,left);
   FILES_writestring(of2,copy1^.recordname2,0,left);
   FILES_writestr(of2,';',FILES_maxIO,0,left);
   FILES_writeline(of2,true);
   FILES_writestr(of2,'  rec1:LSDOMAINT_',FILES_maxIO,0,left);
   FILES_writestring(of2,copy1^.recordname1,0,left);
   FILES_writestr(of2,'):BOOLEAN;',FILES_maxIO,0,left);
   FILES_writeline(of2,true);
   writecopycondbody(of2,copy1^.recordname1,copy1^.recordname2,copy1^.functionname)

   end;

i:=0;
integertable1:=integertable;
booleantable1:=booleantable;
enumtable1:=enumtable;
subrangetable1:=subrangetable;
settable1:=settable;
WHILE stillidents(integertable1) DO
   BEGIN
   i:=i+1;
   takeident(ident,integertable1);
   END;
WHILE stillidents(booleantable1) DO
   BEGIN
   i:=i+1;
   takeident(ident,booleantable1);
   END;
WHILE stillenums(enumtable1) DO
   BEGIN
   i:=i+1;
   takeenum(enum1,enumtable1);
   FILES_writestr(of1,'FUNCTION COPYT_id',FILES_maxIO,0,left);
   FILES_WriteInteger(of1,i,0,TRUE);
   FILES_writestr(of1,'(s: SET OF LSDOMAINT_',FILES_maxIO,0,left);
   FILES_writestring(of1,enum1^.typename,0,left);
   FILES_writestr(of1,'): SET OF LSDOMAINT_',FILES_maxIO,0,left);
   FILES_writestring(of1,enum1^.typename,0,left);
   FILES_writestr(of1,'; EXTERNAL;',FILES_maxIO,0,left);
   FILES_writeline(of1,true);
   FILES_writestr(of2,'FUNCTION COPYT_id',FILES_maxIO,0,left);
   FILES_WriteInteger(of2,i,0,TRUE);
   FILES_writestr(of2,'(s: SET OF LSDOMAINT_',FILES_maxIO,0,left);
   FILES_writestring(of2,enum1^.typename,0,left);
   FILES_writestr(of2,'): SET OF LSDOMAINT_',FILES_maxIO,0,left);
   FILES_writestring(of2,enum1^.typename,0,left);
   FILES_writestr(of2,';',FILES_maxIO,0,left);
   FILES_writeline(of2,true);
   FILES_writestr(of2,'BEGIN COPYT_id',FILES_maxIO,0,left);
   FILES_WriteInteger(of2,i,0,TRUE);
   FILES_writestr(of2,':= s END;',FILES_maxIO,0,left);
   FILES_writeline(of2,true);
   FILES_writeline(of2,true);
   END;



end;
PROCEDURE writedonvfunctions(VAR of1: FILES_text);
var table:setofcatdefs;
    catdef1:pcatdef;
    catnames1:setofidents;
    catname1:STRING_string;
    typecode:INTEGER;
    basetype:STRING_string;
    integertable1,booleantable1:setofidents;
    enumtable1:setofenums;
    subrangetable1:setofsubranges;
    settable1:setofSETOFs;
    enum1:penum;
    subrange1:psubrange;
    setof1:psetof;                                                 
    ident,upperident,min,max:STRING_string;
  PROCEDURE FindMinMax(typename : STRING_String;
                           VAR Min, Max : STRING_String);
      VAR
         enumtable1     : SetOfEnums;
         enum1          : pEnum;
         subrangetable1 : SetOfSubRanges;
         subrange1      : pSubRange;
         found          : BOOLEAN;
         idents         : SetOfIdents;
  BEGIN
         enumtable1:=enumtable; found := FALSE;
         WHILE stillenums(enumtable1) and not found DO 
            BEGIN
            takeenum(enum1,enumtable1);
            IF enum1^.typename = typename THEN 
               BEGIN
               idents:=enum1^.idents;
               takeident(Min,idents);
               Max:=Min;
               WHILE stillidents(idents) DO 
                  BEGIN
                  takeident(Max,idents);
                  END;
               found:= TRUE
               END
            END;
         subrangetable1:=subrangetable;
         WHILE stillsubranges(subrangetable1) and not found DO BEGIN
            takesubrange(subrange1,subrangetable1);
            IF subrange1^.typename = typename THEN BEGIN
               Min := subrange1^.ident1;
               Max := subrange1^.ident2;
               found := TRUE
            END
         END;
  END; 

BEGIN
FILES_writestr(of1,'PROCEDURE LDSTRTOSTR_typeinfo(',
		     FILES_maxIO, 0, left);
FILES_writeline(of1, true);
FILES_writestr(of1,
 'typestr:STRING_string;VAR kind:INTEGER;VAR basetype,min,max:STRING_string);'
		     ,FILES_maxIO, 0, left);
FILES_writeline(of1, true);
FILES_writestr(of1,'BEGIN',FILES_maxIO, 0, left);
FILES_writeline(of1, true);
integertable1:=integertable;
booleantable1:=booleantable;
enumtable1:=enumtable;
subrangetable1:=subrangetable;
settable1:=settable;
WHILE stillidents(integertable1) DO
   BEGIN
   takeident(ident,integertable1);
   STRING_uppercase(upperident,ident);
   FILES_writestr(of1,'IF STRING_comparechars(typestr,''',FILES_maxIO,0,left);
   FILES_writestring(of1,upperident,0,left);
   FILES_writestr(of1,''',STRING_max)=0 THEN BEGIN',FILES_maxIO,0,left);
   FILES_writeline(of1,true);
   FILES_writestr(of1,'kind:=1;',FILES_maxIO, 0, left);
   FILES_writeline(of1,true);
   FILES_writestr(of1,'STRING_constantempty(basetype);',FILES_maxIO, 0, left);
   FILES_writeline(of1,true);
   FILES_writestr(of1,'END;',FILES_maxIO,0,left);
   FILES_writeline(of1,true);
   END;
WHILE stillidents(booleantable1) DO
   BEGIN
   takeident(ident,booleantable1);
   STRING_uppercase(upperident,ident);
   FILES_writestr(of1,'IF STRING_comparechars(typestr,''',FILES_maxIO,0,left);
   FILES_writestring(of1,upperident,0,left);
   FILES_writestr(of1,''',STRING_max)=0 THEN BEGIN',FILES_maxIO,0,left);
   FILES_writeline(of1,true);
   FILES_writestr(of1,'kind:=2;',FILES_maxIO, 0, left);
   FILES_writeline(of1,true);
   FILES_writestr(of1,'STRING_constantempty(basetype);',FILES_maxIO, 0, left);
   FILES_writeline(of1,true);
   FILES_writestr(of1,'END;',FILES_maxIO,0,left);
   FILES_writeline(of1,true);
   END;
WHILE stillenums(enumtable1) DO
   BEGIN
   takeenum(enum1,enumtable1);
   STRING_uppercase(upperident,enum1^.typename);
   FILES_writestr(of1,'IF STRING_comparechars(typestr,''',FILES_maxIO,0,left);
   FILES_writestring(of1,upperident,0,left);
   FILES_writestr(of1,''',STRING_max)=0 THEN BEGIN',FILES_maxIO,0,left);
   FILES_writeline(of1,true);
   FILES_writestr(of1,'kind:=3;',FILES_maxIO, 0, left);
   FILES_writeline(of1,true);
   FILES_writestr(of1,'STRING_constantempty(basetype);',FILES_maxIO, 0, left);
   FILES_writeline(of1,true);
   FILES_writestr(of1,'END;',FILES_maxIO,0,left);
   FILES_writeline(of1,true);
   END;
WHILE stillsubranges(subrangetable1) DO
   BEGIN
   takesubrange(subrange1,subrangetable1);
   STRING_uppercase(upperident,subrange1^.typename);
   FILES_writestr(of1,'IF STRING_comparechars(typestr,''',FILES_maxIO,0,left);
   FILES_writestring(of1,upperident,0,left);
   FILES_writestr(of1,''',STRING_max)=0 THEN BEGIN',FILES_maxIO,0,left);
   FILES_writeline(of1,true);
   FILES_writestr(of1,'kind:=4;',FILES_maxIO, 0, left);
   FILES_writeline(of1,true);
   FILES_writestr(of1,'STRING_constantempty(basetype);',FILES_maxIO, 0, left);
   FILES_writeline(of1,true);
   FILES_writestr(of1,'END;',FILES_maxIO,0,left);
   FILES_writeline(of1,true);
   END;
WHILE stillsetofs(settable1) DO
   BEGIN
   takesetof(setof1,settable1);
   STRING_uppercase(upperident,setof1^.typename1);
   FILES_writestr(of1,'IF STRING_comparechars(typestr,''',FILES_maxIO,0,left);
   FILES_writestring(of1,upperident,0,left);
   FILES_writestr(of1,''',STRING_max)=0 THEN BEGIN',FILES_maxIO,0,left);
   FILES_writeline(of1,true);
   FILES_writestr(of1,'kind:=5;',FILES_maxIO, 0, left);
   FILES_writeline(of1,true);
   basetype:=setof1^.typename2;
   FILES_writestr(of1,'STRING_constantempty(basetype);',FILES_maxIO, 0, left);
   FILES_writeline(of1,true);
   FILES_writestr(of1,'STRING_appendchars(basetype,basetype,''',FILES_maxIO, 0, left);
   FILES_writestring(of1,basetype,0, left);
   FILES_writestr(of1,''',STRING_max);',FILES_maxIO,0,left);
   FILES_writeline(of1,true);
   findminmax(basetype,min,max);
   FILES_writestr(of1,'STRING_constantempty(min);',FILES_maxIO, 0, left);
   FILES_writeline(of1,true);
   FILES_writestr(of1,'STRING_appendchars(min,min,''',FILES_maxIO, 0, left);
   FILES_writestring(of1,min,0, left);
   FILES_writestr(of1,''',STRING_max);',FILES_maxIO,0,left);
   FILES_writeline(of1,true);
   FILES_writestr(of1,'STRING_constantempty(max);',FILES_maxIO, 0, left);
   FILES_writeline(of1,true);
   FILES_writestr(of1,'STRING_appendchars(max,max,''',FILES_maxIO, 0, left);
   FILES_writestring(of1,max,0, left);
   FILES_writestr(of1,''',STRING_max);',FILES_maxIO,0,left);
   FILES_writeline(of1,true);
   FILES_writestr(of1,'END;',FILES_maxIO,0,left);
   FILES_writeline(of1,true);
   END;
FILES_writestr(of1,'END;',FILES_maxIO, 0, left);
FILES_writeline(of1, true);

FILES_writestr(of1,'FUNCTION LDSTRTOSTR_CATtoRECTYPE(',
		     FILES_maxIO, 0, left);
FILES_writeline(of1, true);
FILES_writestr(of1,'    cat:STRING_string):STRING_string;',
		     FILES_maxIO, 0, left);
FILES_writeline(of1,true);
FILES_writestr(of1,'VAR result:STRING_string;',FILES_maxIO, 0, left);
FILES_writeline(of1,true);
FILES_writestr(of1,'BEGIN',FILES_maxIO, 0, left);
FILES_writeline(of1,true);
FILES_writestr(of1, 'STRING_constantempty(result);',FILES_maxIO, 0, left);
FILES_writeline(of1,true);
table:=categorytable;
while stillcatdefs(table) do
   begin
   takecatdef(catdef1,table);
   catnames1:=catdef1^.catnames;
   while stillidents(catnames1) do
   	begin
        takeident(catname1,catnames1);
        FILES_writestr(of1,'IF (STRING_comparechars(cat,''',FILES_maxIO, 0, left);
        FILES_writestring(of1,catname1,0,left);
        FILES_writestr(of1,''',STRING_max)=0) THEN',FILES_maxIO, 0, left);
        FILES_writeline(of1,true);
        FILES_writestr(of1,'     STRING_appendchars(result,result,''',FILES_maxIO, 0, left);
        FILES_writestring(of1,catdef1^.recordname,0,left);
        FILES_writestr(of1,''',STRING_max);',FILES_maxIO, 0, left);
        FILES_writeline(of1,true)
        end
   end;
FILES_writestr(of1,'LDSTRTOSTR_CATtoRECTYPE:=result',FILES_maxIO, 0, left);
FILES_writeline(of1,true);
FILES_writestr(of1,'END;',FILES_maxIO, 0, left);
FILES_writeline(of1,true)
end;


PROCEDURE writeconvfunctions(VAR of2: FILES_text);
VAR str:STRING_string;
    i:integer;
    affixkeystable1:setofidents;

   PROCEDURE writeimpmodaffix(VAR of2: FILES_text);
   VAR
      affixkeystable1: setofidents;
      derivkeystable1: setofderivs;
      derivconst     : pderiv;
      i              : integer;
      str            : STRING_string;
   BEGIN
      affixkeystable1:=affixkeystable;
      derivkeystable1:=derivkeystable;
      FILES_writeline(of2, true);
      FILES_writeline(of2, true);
      FILES_writestr(of2, 'FUNCTION LDSTRTOTYPE_AFFIX(',
		     FILES_maxIO, 0, left);
      FILES_writeline(of2, true);
      FILES_writestr(of2, '         CONST str: STRING;',
		     FILES_maxIO, 0, left);
      FILES_writeline(of2, true);
      FILES_writestr(of2, '        l: STR_Range;',FILES_maxIO, 0, left);
      FILES_writeline(of2, true);
      FILES_writestr(of2, '         VAR afx: INTEGER): BOOLEAN;',
		     FILES_maxIO, 0, left);
      FILES_writeline(of2, true);
      FILES_writestr(of2, 'LABEL 99;', FILES_maxIO, 0, left);
      FILES_writeline(of2, true);
      FILES_writestr(of2, 'BEGIN', FILES_maxIO, 0, left);
      FILES_writeline(of2, true);
      FILES_writestr(of2, '   LDSTRTOTYPE_AFFIX := false', 
                     FILES_maxIO, 0, left);
      FILES_writechar(of2, ';');
      FILES_writeline(of2, true);
      i := 0; 
      WHILE stillidents(affixkeystable1) DO BEGIN
         takeident(str, affixkeystable1);
         i := i+1;
         FILES_writestr(of2, '   IF STR_Compare(str, l,''', FILES_maxIO, 0, left); 
         FILES_writestring(of2, str, converttoIO(STRING_length(str)), left);
         FILES_writestr(of2, ''', STR_Max) = 0 THEN BEGIN', FILES_maxIO, 0, left);
         FILES_writeline(of2, true);
         FILES_writestr(of2, '      afx := ', FILES_maxIO, 0, left);
         FILES_writestring(of2, str, converttoIO(STRING_length(str)), left);
         FILES_writechar(of2, ';');
         FILES_writeline(of2, true);
         FILES_writestr(of2, '      LDSTRTOTYPE_AFFIX := true', 
                        FILES_maxIO, 0, left);
         FILES_writechar(of2, ';');
         FILES_writeline(of2, true);
         FILES_writestr(of2, '      GOTO 99', FILES_maxIO, 0, left);
         FILES_writeline(of2, true);
         FILES_writestr(of2, '   END;', files_maxIO, 0, left);
         FILES_writeline(of2, true);
      END;      
      WHILE stillderivs(derivkeystable1) DO BEGIN
         takederiv(derivconst, derivkeystable1);
         i := i+1;
         FILES_writestr(of2, '   IF STR_Compare(str, l,''', FILES_maxIO, 0, left); 
         FILES_writestring(of2, derivconst^.derivname, 
                           converttoIO(STRING_length(derivconst^.derivname)), left);
         FILES_writestr(of2, ''', STR_Max) = 0 THEN BEGIN', FILES_maxIO, 0, left);
         FILES_writeline(of2, true);
         FILES_writestr(of2, '      afx := ', FILES_maxIO, 0, left);
         FILES_writestring(of2, derivconst^.derivname, 
                           converttoIO(STRING_length(derivconst^.derivname)), left);
         FILES_writechar(of2, ';');
         FILES_writeline(of2, true);
         FILES_writestr(of2, '      LDSTRTOTYPE_AFFIX := true', 
                        FILES_maxIO, 0, left);
         FILES_writechar(of2, ';');
         FILES_writeline(of2, true);
         FILES_writestr(of2, '      GOTO 99', FILES_maxIO, 0, left);
         FILES_writeline(of2, true);
         FILES_writestr(of2, '   END;', files_maxIO, 0, left);
         FILES_writeline(of2, true);
      END;      
      FILES_writestr(of2, '99:', FILES_maxIO, 0, left);
      FILES_writeline(of2, true);
      FILES_writestr(of2, 'END;', FILES_maxIO, 0, left);
      FILES_writeline(of2, true);

   END {writeimpmodaffix};


   PROCEDURE writeimpmodCAT(VAR of2: FILES_text);
   VAR
      categorytable1 : setofcatdefs;
      catdef1        : pcatdef;
      catnames       : setofidents;
      affixkeystable1: setofidents;
      i              : integer;
      str            : STRING_string;
   BEGIN
      categorytable1 := categorytable;
      FILES_writeline(of2, true);
      FILES_writeline(of2, true);
      FILES_writestr(of2, 'FUNCTION LDSTRTOTYPE_CAT(',
		     FILES_maxIO, 0, left);
      FILES_writeline(of2, true);
      FILES_writestr(of2, '         CONST str: STRING;',
		     FILES_maxIO, 0, left);
      FILES_writeline(of2, true);
      FILES_writestr(of2, '        l: STR_Range;',FILES_maxIO, 0, left);
      FILES_writeline(of2, true);
      FILES_writestr(of2, '         VAR cat: LIDOMAINT_syntcat): BOOLEAN;',
		     FILES_maxIO, 0, left);
      FILES_writeline(of2, true);
      FILES_writestr(of2, 'LABEL 99;', FILES_maxIO, 0, left);
      FILES_writeline(of2, true);
      FILES_writestr(of2, 'BEGIN', FILES_maxIO, 0, left);
      FILES_writeline(of2, true);
      FILES_writestr(of2, '   LDSTRTOTYPE_CAT := false', FILES_maxIO, 0, left);
      FILES_writechar(of2, ';');
      FILES_writeline(of2, true);
      FILES_writestr(of2, '   IF STR_Compare(str, l, ''LIBUG'', 5) = 0 THEN BEGIN',
                     FILES_maxIO, 0, left); 
      FILES_writeline(of2, true);
      FILES_writestr(of2, '      cat := LIBUG;', FILES_maxIO, 0, left);
      FILES_writeline(of2, true);
      FILES_writestr(of2, '      LDSTRTOTYPE_CAT := true', FILES_maxIO, 0, left);
      FILES_writechar(of2, ';');
      FILES_writeline(of2, true);
      FILES_writestr(of2, '      GOTO 99', FILES_maxIO, 0, left);
      FILES_writeline(of2, true);
      FILES_writestr(of2, '   END;', files_maxIO, 0, left);
      FILES_writestr(of2, '   IF STR_Compare(str, l, ''LIUG'', 4) = 0 THEN BEGIN',
                     FILES_maxIO, 0, left); 
      FILES_writeline(of2, true);
      FILES_writestr(of2, '      cat := LIUG;', FILES_maxIO, 0, left);
      FILES_writeline(of2, true);
      FILES_writestr(of2, '      LDSTRTOTYPE_CAT := true', FILES_maxIO, 0, left);
      FILES_writechar(of2, ';');
      FILES_writeline(of2, true);
      FILES_writestr(of2, '      GOTO 99', FILES_maxIO, 0, left);
      FILES_writeline(of2, true);
      FILES_writestr(of2, '   END;', files_maxIO, 0, left);
      i := 0; 
      FILES_writestr(of2, '   IF STR_Compare(str, l, ''LICAT0'', 6) = 0 THEN BEGIN',
                     FILES_maxIO, 0, left); 
      FILES_writeline(of2, true);
      FILES_writestr(of2, '      cat := ', FILES_maxIO, 0, left);
      FILES_writestr(of2, 'LICAT', FILES_maxIO, 0, left);
      FILES_writeinteger(of2, i, 0, left);
      FILES_writechar(of2, ';');
      FILES_writeline(of2, true);
      FILES_writestr(of2, '      LDSTRTOTYPE_CAT := true', FILES_maxIO, 0, left);
      FILES_writechar(of2, ';');
      FILES_writeline(of2, true);
      FILES_writestr(of2, '      GOTO 99', FILES_maxIO, 0, left);
      FILES_writeline(of2, true);
      FILES_writestr(of2, '   END;', files_maxIO, 0, left);
      WHILE stillcatdefs(categorytable1) DO BEGIN
         takecatdef(catdef1, categorytable1);
         catnames := catdef1^.catnames;
	 WHILE stillidents(catnames) DO BEGIN
	    takeident(str, catnames);
	    i := i+1;
	    FILES_writestr(of2, 
                           '   IF STR_Compare(str, l, ''', FILES_maxIO, 0, left); 
	    FILES_writestring(of2, str, converttoIO(STRING_length(str)), left);
	    FILES_writestr(of2, ''', Str_Max) = 0 THEN BEGIN', FILES_maxIO, 0, left);
	    FILES_writeline(of2, true);
	    FILES_writestr(of2, '      cat := ', FILES_maxIO, 0, left);
	    FILES_writestr(of2, 'LICAT', FILES_maxIO, 0, left);
	    FILES_writeinteger(of2, i, 0, left);
            FILES_writechar(of2, ';');
	    FILES_writeline(of2, true);
            FILES_writestr(of2, '      LDSTRTOTYPE_CAT := true', FILES_maxIO, 0, left);
            FILES_writechar(of2, ';');
            FILES_writeline(of2, true);
            FILES_writestr(of2, '      GOTO 99', FILES_maxIO, 0, left);
            FILES_writeline(of2, true);
	    FILES_writestr(of2, '   END;', files_maxIO, 0, left);
	    FILES_writeline(of2, true);
	 END      
      END;
      FILES_writestr(of2, '   99:', FILES_maxIO, 0, left);
      FILES_writeline(of2, true);
      FILES_writestr(of2, 'END;', FILES_maxIO, 0, left);
      FILES_writeline(of2, true);

   END {writeimpmodcat};


   PROCEDURE writeimpmodCC(VAR of2: FILES_text);
   VAR
      contexttable1  : setofidents;
      i              : integer;
      str            : STRING_string;
   BEGIN
      contexttable1:=contexttable;
      FILES_writeline(of2, true);
      FILES_writeline(of2, true);
      FILES_writestr(of2, 'FUNCTION LDSTRTOTYPE_CC(',
		     FILES_maxIO, 0, left);
      FILES_writeline(of2, true);
      FILES_writestr(of2, '         CONST str: STRING;',
		     FILES_maxIO, 0, left);
      FILES_writeline(of2, true);
      FILES_writestr(of2, '        l: STR_Range;',FILES_maxIO, 0, left);
      FILES_writeline(of2, true);
      FILES_writestr(of2, '         VAR cxt: LIMORFDEF_contextconds): BOOLEAN;',
		     FILES_maxIO, 0, left);
      FILES_writeline(of2, true);
      FILES_writestr(of2, 'BEGIN', FILES_maxIO, 0, left);
      FILES_writeline(of2, true);
      FILES_writestr(of2, '   LDSTRTOTYPE_CC := true', 
                     FILES_maxIO, 0, left);
      FILES_writechar(of2, ';');
      FILES_writeline(of2, true);
      i := 0; 
      FILES_writestr(of2, '   IF STR_Compare(str, l, ''LICC0'', 5) = 0 THEN ',
                     FILES_maxIO, 0, left); 
      FILES_writeline(of2, true);
      FILES_writestr(of2, '      cxt := ', FILES_maxIO, 0, left);
      FILES_writestr(of2, 'LICC', FILES_maxIO, 0, left);
      FILES_writeinteger(of2, i, 0, left);
      FILES_writeline(of2, true);
      FILES_writestr(of2, '   ELSE', files_maxIO, 0, left);
      WHILE stillidents(contexttable1) DO BEGIN
         takeident(str, contexttable1);
         i := i+1;
         FILES_writestr(of2, '   IF STR_Compare(str, l, ''', FILES_maxIO, 0, left); 
         FILES_writestring(of2, str, converttoIO(STRING_length(str)), left);
         FILES_writestr(of2, ''', STR_Max) = 0 THEN ', FILES_maxIO, 0, left);
         FILES_writeline(of2, true);
         FILES_writestr(of2, '      cxt := ', FILES_maxIO, 0, left);
         FILES_writestr(of2, 'LICC', FILES_maxIO, 0, left);
         FILES_writeinteger(of2, i, 0, left);
         FILES_writeline(of2, true);
         FILES_writestr(of2, '   ELSE', files_maxIO, 0, left);
      END;      
      FILES_writestr(of2, '   LDSTRTOTYPE_CC := false', FILES_maxIO, 0, left);
      FILES_writeline(of2, true);
      FILES_writestr(of2, 'END;', FILES_maxIO, 0, left);
      FILES_writeline(of2, true);

   END {writeimpmodCC};


   PROCEDURE writeimpmodFON(VAR of2: FILES_text);
   VAR
      phonetictable1  : setofidents;
      i              : integer;
      str            : STRING_string;
   BEGIN
      phonetictable1:=phonetictable;
      FILES_writeline(of2, true);
      FILES_writeline(of2, true);
      FILES_writestr(of2, 'FUNCTION LDSTRTOTYPE_FON(',
		     FILES_maxIO, 0, left);
      FILES_writeline(of2, true);
      FILES_writestr(of2, '         CONST str: STRING;',
		     FILES_maxIO, 0, left);
      FILES_writeline(of2, true);
      FILES_writestr(of2, '        l: STR_Range;',FILES_maxIO, 0, left);
      FILES_writeline(of2, true);
      FILES_writestr(of2, '         VAR ph: LIMORFDEF_phonmarker): BOOLEAN;',
		     FILES_maxIO, 0, left);
      FILES_writeline(of2, true);
      FILES_writestr(of2, 'BEGIN', FILES_maxIO, 0, left);
      FILES_writeline(of2, true);
      FILES_writestr(of2, '   LDSTRTOTYPE_FON := true', 
                     FILES_maxIO, 0, left);
      FILES_writechar(of2, ';');
      FILES_writeline(of2, true);
      i := 0; 
      FILES_writestr(of2, '   IF STR_Compare(str, l, ''LIFON0'', 6) = 0 THEN ',
                     FILES_maxIO, 0, left); 
      FILES_writeline(of2, true);
      FILES_writestr(of2, '      ph := ', FILES_maxIO, 0, left);
      FILES_writestr(of2, 'LIFON', FILES_maxIO, 0, left);
      FILES_writeinteger(of2, i, 0, left);
      FILES_writeline(of2, true);
      FILES_writestr(of2, '   ELSE', files_maxIO, 0, left);
      WHILE stillidents(phonetictable1) DO BEGIN
         takeident(str, phonetictable1);
         i := i+1;
         FILES_writestr(of2, '   IF STR_Compare(str, l, ''', FILES_maxIO, 0, left); 
         FILES_writestring(of2, str, converttoIO(STRING_length(str)), left);
         FILES_writestr(of2, ''', STR_Max) = 0 THEN ', FILES_maxIO, 0, left);
         FILES_writeline(of2, true);
         FILES_writestr(of2, '      ph := ', FILES_maxIO, 0, left);
         FILES_writestr(of2, 'LIFON', FILES_maxIO, 0, left);
         FILES_writeinteger(of2, i, 0, left);
         FILES_writeline(of2, true);
         FILES_writestr(of2, '   ELSE', files_maxIO, 0, left);
      END;      
      FILES_writestr(of2, '   LDSTRTOTYPE_FON := false', FILES_maxIO, 0, left);
      FILES_writeline(of2, true);
      FILES_writestr(of2, 'END;', FILES_maxIO, 0, left);
      FILES_writeline(of2, true);

   END {writeimpmodFON};



BEGIN
   writeimpmodaffix(of2);
   writeimpmodCAT(of2);
   writeimpmodCC(of2);
   writeimpmodFON(of2)
END;


PROCEDURE writetypeconvfunctions(VAR of2: FILES_text);
VAR str:STRING_string;
    i:integer;
    affixkeystable1:setofidents;

   PROCEDURE writeimpmodaffix(VAR of2: FILES_text);
   VAR
      affixkeystable1: setofidents;
      derivkeystable1: setofderivs;
      derivconst     : pderiv;
      i              : integer;
      str            : STRING_string;
   BEGIN
      affixkeystable1:=affixkeystable;
      derivkeystable1:=derivkeystable;
      FILES_writeline(of2, true);
      FILES_writeline(of2, true);
      FILES_writestr(of2, 'PROCEDURE LDTYPETOSTR_AFFIX(',
		     FILES_maxIO, 0, left);
      FILES_writeline(of2, true);
      FILES_writestr(of2, '         VAR str: STRING;',
		     FILES_maxIO, 0, left);
      FILES_writeline(of2, true);
      FILES_writestr(of2, '         VAR l: STR_Range;',FILES_maxIO, 0, left);
      FILES_writeline(of2, true);
      FILES_writestr(of2, '         afx: INTEGER);',
		     FILES_maxIO, 0, left);
      FILES_writeline(of2, true);
      FILES_writestr(of2, 'BEGIN', FILES_maxIO, 0, left);
      FILES_writeline(of2, true);
      FILES_writestr(of2, '   CASE afx OF ', FILES_maxIO, 0, left);
      FILES_writeline(of2, true);
      i := 0; 
      WHILE stillidents(affixkeystable1) DO BEGIN
         takeident(str, affixkeystable1);
         i := i+1;
         FILES_writestring(of2, str, converttoIO(STRING_length(str)), left);
         FILES_writestr(of2, ' : BEGIN', FILES_maxIO, 0, left); 
         FILES_writeline(of2, true);
         FILES_writestr(of2, '      STR_Extract(str, l, ''', FILES_maxIO, 0, left);
         FILES_writestring(of2, str, converttoIO(STRING_length(str)), left);
         FILES_writestr(of2, ''', ', FILES_maxIO, 0, left);
         FILES_writeinteger(of2, STRING_length(str), 0, left); 
         FILES_writestr(of2, ', 1, ', FILES_maxIO, 0, left);
         FILES_writeinteger(of2, STRING_length(str), 0, left); 
         FILES_writestr(of2, ');', FILES_maxIO, 0, left);
         FILES_writeline(of2, true);
         FILES_writestr(of2, '   END;', files_maxIO, 0, left);
         FILES_writeline(of2, true);
      END;      
      WHILE stillderivs(derivkeystable1) DO BEGIN
         takederiv(derivconst, derivkeystable1);
         i := i+1;
         FILES_writestring(of2, derivconst^.derivname, 
                           converttoIO(STRING_length(derivconst^.derivname)), left);
         FILES_writestr(of2, ' : BEGIN', FILES_maxIO, 0, left); 
         FILES_writeline(of2, true);
         FILES_writestr(of2, '      STR_Extract(str, l, ''', FILES_maxIO, 0, left);
         FILES_writestring(of2, derivconst^.derivname, 
                                converttoIO(STRING_length(derivconst^.derivname)), left);
         FILES_writestr(of2, ''', ', FILES_maxIO, 0, left);
         FILES_writeinteger(of2, STRING_length(derivconst^.derivname), 0, left); 
         FILES_writestr(of2, ', 1, ', FILES_maxIO, 0, left);
         FILES_writeinteger(of2, STRING_length(derivconst^.derivname), 0, left); 
         FILES_writestr(of2, ');', FILES_maxIO, 0, left);
         FILES_writeline(of2, true);
         FILES_writestr(of2, '   END;', files_maxIO, 0, left);
         FILES_writeline(of2, true);
      END;      
      FILES_writestr(of2, '   END;', FILES_maxIO, 0, left);
      FILES_writeline(of2, true);
      FILES_writestr(of2, 'END;', FILES_maxIO, 0, left);
      FILES_writeline(of2, true);
      FILES_writeline(of2, true);
      FILES_writeline(of2, true);

   END {writeimpmodaffix};


   PROCEDURE writeimpmodCAT(VAR of2: FILES_text);
   VAR
      categorytable1 : setofcatdefs;
      catdef1        : pcatdef;
      catnames       : setofidents;
      affixkeystable1: setofidents;
      i              : integer;
      str            : STRING_string;
   BEGIN
      categorytable1 := categorytable;
      FILES_writeline(of2, true);
      FILES_writeline(of2, true);
      FILES_writestr(of2, 'PROCEDURE LDTYPETOSTR_CAT(',
		     FILES_maxIO, 0, left);
      FILES_writeline(of2, true);
      FILES_writestr(of2, '         VAR str: STRING;',
		     FILES_maxIO, 0, left);
      FILES_writeline(of2, true);
      FILES_writestr(of2, '         VAR l: STR_Range;',FILES_maxIO, 0, left);
      FILES_writeline(of2, true);
      FILES_writestr(of2, '         cat: LIDOMAINT_syntcat);',
		     FILES_maxIO, 0, left);
      FILES_writeline(of2, true);
      FILES_writestr(of2, 'BEGIN', FILES_maxIO, 0, left);
      FILES_writeline(of2, true);
      FILES_writestr(of2, '   IF cat = LIBUG THEN BEGIN',
                     FILES_maxIO, 0, left); 
      FILES_writeline(of2, true);
      FILES_writestr(of2, '      STR_Extract(str, l, ''LIBUG'', 5, 1, 5);',
                     FILES_maxIO, 0, left);
      FILES_writeline(of2, true);
      FILES_writestr(of2, '      END', files_maxIO, 0, left);
      FILES_writeline(of2, true);
      FILES_writestr(of2, '   ELSE ', files_maxIO, 0, left);
      FILES_writestr(of2, '   IF cat = LIUG THEN BEGIN',
                     FILES_maxIO, 0, left); 
      FILES_writeline(of2, true);
      FILES_writestr(of2, '      STR_Extract(str, l, ''LIUG'', 4, 1, 4);',
                     FILES_maxIO, 0, left);
      FILES_writeline(of2, true);
      FILES_writestr(of2, '      END', files_maxIO, 0, left);
      FILES_writeline(of2, true);
      FILES_writestr(of2, '   ELSE ', files_maxIO, 0, left);
      i := 0; 
      FILES_writestr(of2, '   IF cat = LICAT0 THEN BEGIN',
                     FILES_maxIO, 0, left); 
      FILES_writeline(of2, true);
      FILES_writestr(of2, '      STR_Extract(str, l, ''LICAT0'', 6, 1, 6);',
                     FILES_maxIO, 0, left);
      FILES_writeline(of2, true);
      FILES_writestr(of2, '      END', files_maxIO, 0, left);
      FILES_writeline(of2, true);
      FILES_writestr(of2, '   ELSE BEGIN', files_maxIO, 0, left);
      FILES_writeline(of2, true);
      FILES_writestr(of2, '      CASE LoopHoles.Retype(cat,LSDOMAINT_syntcat) OF', FILES_maxIO, 0, left);
      FILES_writeline(of2, true);
      WHILE stillcatdefs(categorytable1) DO BEGIN
         takecatdef(catdef1, categorytable1);
         catnames := catdef1^.catnames;
	 WHILE stillidents(catnames) DO BEGIN
	    takeident(str, catnames);
	    i := i+1;
	    FILES_writestr(of2, '      ', FILES_maxIO, 0, left); 
	    FILES_writestring(of2, str, converttoIO(STRING_length(str)), left);
	    FILES_writestr(of2, ': BEGIN ', FILES_maxIO, 0, left); 
	    FILES_writeline(of2, true);
            FILES_writestr(of2, '         STR_Extract(str, l, ''', FILES_maxIO, 0, left);
            FILES_writestring(of2, str, converttoIO(STRING_length(str)), left);
            FILES_writestr(of2, ''', ', FILES_maxIO, 0, left);
            FILES_writeinteger(of2, STRING_length(str), 0, left); 
            FILES_writestr(of2, ', 1, ', FILES_maxIO, 0, left);
            FILES_writeinteger(of2, STRING_length(str), 0, left); 
            FILES_writestr(of2, ');', FILES_maxIO, 0, left);
            FILES_writeline(of2, true);
            FILES_writestr(of2, '         END;', FILES_maxIO, 0, left);
            FILES_writeline(of2, true);
	 END      
      END;
      FILES_writestr(of2, '      END', FILES_maxIO, 0, left);
      FILES_writeline(of2, true);
      FILES_writestr(of2, '   END', FILES_maxIO, 0, left);
      FILES_writeline(of2, true);
      FILES_writestr(of2, 'END;', FILES_maxIO, 0, left);
      FILES_writeline(of2, true);
      FILES_writeline(of2, true);
      FILES_writeline(of2, true);

   END {writeimpmodcat};


   PROCEDURE writeimpmodREL(VAR of2: FILES_text);
   VAR
      relationtable1  : setofidents;
      str             : STRING_string;
   BEGIN
      relationtable1 := relationtable;
      FILES_writeline(of2, true);
      FILES_writeline(of2, true);
      FILES_writestr(of2, 'PROCEDURE LDTYPETOSTR_REL(',
		     FILES_maxIO, 0, left);
      FILES_writeline(of2, true);
      FILES_writestr(of2, '         VAR str: STRING;',
		     FILES_maxIO, 0, left);
      FILES_writeline(of2, true);
      FILES_writestr(of2, '         VAR l: STR_Range;',FILES_maxIO, 0, left);
      FILES_writeline(of2, true);
      FILES_writestr(of2, '         rel: LIDOMAINT_synrel);',
		     FILES_maxIO, 0, left);
      FILES_writeline(of2, true);
      FILES_writestr(of2, 'BEGIN', FILES_maxIO, 0, left);
      FILES_writeline(of2, true);
      i := 0; 
      FILES_writestr(of2, '   IF rel = LIREL0 THEN BEGIN',
                     FILES_maxIO, 0, left); 
      FILES_writeline(of2, true);
      FILES_writestr(of2, '      STR_Extract(str, l, ''LIREL0'', 6, 1, 6);',
                     FILES_maxIO, 0, left);
      FILES_writeline(of2, true);
      FILES_writestr(of2, '      END', files_maxIO, 0, left);
      FILES_writeline(of2, true);
      FILES_writestr(of2, '   ELSE BEGIN', files_maxIO, 0, left);
      FILES_writeline(of2, true);
      FILES_writestr(of2, '      CASE LoopHoles.Retype(rel,LSDOMAINT_synrel) OF', FILES_maxIO, 0, left);
      FILES_writeline(of2, true);
      WHILE stillidents(relationtable1) DO BEGIN
         takeident(str, relationtable1);
	 i := i+1;
	 FILES_writestr(of2, '      ', FILES_maxIO, 0, left); 
	 FILES_writestring(of2, str, converttoIO(STRING_length(str)), left);
	 FILES_writestr(of2, ': BEGIN ', FILES_maxIO, 0, left); 
	 FILES_writeline(of2, true);
	 FILES_writestr(of2, '         STR_Extract(str, l, ''', FILES_maxIO, 0, left);
	 FILES_writestring(of2, str, converttoIO(STRING_length(str)), left);
	 FILES_writestr(of2, ''', ', FILES_maxIO, 0, left);
	 FILES_writeinteger(of2, STRING_length(str), 0, left); 
	 FILES_writestr(of2, ', 1, ', FILES_maxIO, 0, left);
	 FILES_writeinteger(of2, STRING_length(str), 0, left); 
	 FILES_writestr(of2, ');', FILES_maxIO, 0, left);
	 FILES_writeline(of2, true);
	 FILES_writestr(of2, '         END;', FILES_maxIO, 0, left);
	 FILES_writeline(of2, true);
      END;
      FILES_writestr(of2, '      END', FILES_maxIO, 0, left);
      FILES_writeline(of2, true);
      FILES_writestr(of2, '   END', FILES_maxIO, 0, left);
      FILES_writeline(of2, true);
      FILES_writestr(of2, 'END;', FILES_maxIO, 0, left);
      FILES_writeline(of2, true);
      FILES_writeline(of2, true);
      FILES_writeline(of2, true);

   END {writeimpmodrel};


BEGIN
   writeimpmodaffix(of2);
   writeimpmodCAT(of2);
   writeimpmodREL(of2);
END;



PROCEDURE writelstypeconvfunctions(VAR of1, of2: FILES_text);

   PROCEDURE writedefmodenum(VAR of1: FILES_text);
   VAR
      enumtable1     : setofenums;
      str            : STRING_string;
      enum1          : penum;
      idents         : setofidents;
   BEGIN

   enumtable1:=enumtable;
   while stillenums(enumtable1) do
      begin
      takeenum(enum1,enumtable1);
      FILES_writestr(of1,'PROCEDURE LSTYPETOSTR_',FILES_maxIO,0,left);
      FILES_writestring(of1,enum1^.typename,0,left);
      FILES_writestr(of1,'( ',FILES_maxIO,0,left);
      FILES_writeline(of1, true);
      FILES_writestr(of1, '         VAR str: STRING;',
		     FILES_maxIO, 0, left);
      FILES_writeline(of1, true);
      FILES_writestr(of1, '         VAR l: STR_Range;',FILES_maxIO, 0, left);
      FILES_writeline(of1, true);
      FILES_writestr(of1, '         attr : LSDOMAINT_',FILES_maxIO, 0, left);
      FILES_writestring(of1,enum1^.typename,0,left);
      FILES_writestr(of1, '         ); EXTERNAL;',FILES_maxIO, 0, left);
      FILES_writeline(of1, true);
      FILES_writeline(of1, true);
      FILES_writeline(of1, true);
   END;
   FILES_writeline(of1, true);

   END {writedefmodenum};



   PROCEDURE writeimpmodenum(VAR of2: FILES_text);
   VAR
      enumtable1     : setofenums;
      str            : STRING_string;
      enum1          : penum;
      idents         : setofidents;
   BEGIN

   enumtable1:=enumtable;
   while stillenums(enumtable1) do
      begin
      takeenum(enum1,enumtable1);
      FILES_writestr(of2,'PROCEDURE LSTYPETOSTR_',FILES_maxIO,0,left);
      FILES_writestring(of2,enum1^.typename,0,left);
      FILES_writestr(of2,'( ',FILES_maxIO,0,left);
      FILES_writeline(of2, true);
      FILES_writestr(of2, '         VAR str: STRING;',
		     FILES_maxIO, 0, left);
      FILES_writeline(of2, true);
      FILES_writestr(of2, '         VAR l: STR_Range;',FILES_maxIO, 0, left);
      FILES_writeline(of2, true);
      FILES_writestr(of2, '         attr : LSDOMAINT_',FILES_maxIO, 0, left);
      FILES_writestring(of2,enum1^.typename,0,left);
      FILES_writestr(of2, '         );',FILES_maxIO, 0, left);
      FILES_writeline(of2, true);
      FILES_writestr(of2, 'BEGIN', FILES_maxIO, 0, left);
      FILES_writeline(of2, true);
      FILES_writestr(of2, '   CASE attr OF ', FILES_maxIO, 0, left);
      FILES_writeline(of2, true);
      idents:=enum1^.idents;
      while stillidents(idents) do
	   begin
	   takeident(str,idents);
	   FILES_writestr(of2,'   ',FILES_maxIO,0,left);
	   FILES_writestring(of2,str,0,left);
	   FILES_writestr(of2,': BEGIN',FILES_maxIO,0,left);
           FILES_writeline(of2, true);
           FILES_writestr(of2, '      STR_Extract(str, l, ''', FILES_maxIO, 0, left);
           FILES_writestring(of2, str, converttoIO(STRING_length(str)), left);
           FILES_writestr(of2, ''', ', FILES_maxIO, 0, left);
           FILES_writeinteger(of2, STRING_length(str), 0, left); 
           FILES_writestr(of2, ', 1, ', FILES_maxIO, 0, left);
           FILES_writeinteger(of2, STRING_length(str), 0, left); 
           FILES_writestr(of2, ');', FILES_maxIO, 0, left);
           FILES_writeline(of2, true);
           FILES_writestr(of2, '      END;', files_maxIO, 0, left);
           FILES_writeline(of2, true);
      END;      

      FILES_writestr(of2, '   END;', FILES_maxIO, 0, left);
      FILES_writeline(of2, true);
      FILES_writestr(of2, 'END {LSTYPETOSTR_', FILES_maxIO, 0, left);
      FILES_writestring(of2,enum1^.typename,0,left);
      FILES_writestr(of2,'};',FILES_maxIO,0,left);
      FILES_writeline(of2, true);
      FILES_writeline(of2, true);
      FILES_writeline(of2, true);
   END;
   FILES_writeline(of2, true);

   END {writeimpmodenum};


   PROCEDURE writedefmodsubrange(VAR of1: FILES_text);
   VAR
      subrangetable1     : setofsubranges;
      str                : STRING_string;
      subrange1          : psubrange;
      idents             : setofidents;
   BEGIN

   subrangetable1:=subrangetable;
   while stillsubranges(subrangetable1) do
      begin
      takesubrange(subrange1,subrangetable1);
      FILES_writestr(of1,'PROCEDURE LSTYPETOSTR_',FILES_maxIO,0,left);
      FILES_writestring(of1,subrange1^.typename,0,left);
      FILES_writestr(of1,'( ',FILES_maxIO,0,left);
      FILES_writeline(of1, true);
      FILES_writestr(of1, '         VAR str: STRING;',
		     FILES_maxIO, 0, left);
      FILES_writeline(of1, true);
      FILES_writestr(of1, '         VAR l: STR_Range;',FILES_maxIO, 0, left);
      FILES_writeline(of1, true);
      FILES_writestr(of1, '         attr : LSDOMAINT_',FILES_maxIO, 0, left);
      FILES_writestring(of1,subrange1^.typename,0,left);
      FILES_writestr(of1, '         ); EXTERNAL;',FILES_maxIO, 0, left);
      FILES_writeline(of1, true);
      FILES_writeline(of1, true);
      FILES_writeline(of1, true);
   END;
   FILES_writeline(of1, true);

   END {writedefmodsubrange};


   PROCEDURE writeimpmodsubrange(VAR of2: FILES_text);
   VAR
      subrangetable1     : setofsubranges;
      str                : STRING_string;
      subrange1          : psubrange;
      idents             : setofidents;
   BEGIN

   subrangetable1:=subrangetable;
   while stillsubranges(subrangetable1) do
      begin
      takesubrange(subrange1,subrangetable1);
      FILES_writestr(of2,'PROCEDURE LSTYPETOSTR_',FILES_maxIO,0,left);
      FILES_writestring(of2,subrange1^.typename,0,left);
      FILES_writestr(of2,'( ',FILES_maxIO,0,left);
      FILES_writeline(of2, true);
      FILES_writestr(of2, '         VAR str: STRING;',
		     FILES_maxIO, 0, left);
      FILES_writeline(of2, true);
      FILES_writestr(of2, '         VAR l: STR_Range;',FILES_maxIO, 0, left);
      FILES_writeline(of2, true);
      FILES_writestr(of2, '         attr : LSDOMAINT_',FILES_maxIO, 0, left);
      FILES_writestring(of2,subrange1^.typename,0,left);
      FILES_writestr(of2, '         );',FILES_maxIO, 0, left);
      FILES_writeline(of2, true);
      FILES_writestr(of2, 'BEGIN', FILES_maxIO, 0, left);
      FILES_writeline(of2, true);
      FILES_writestr(of2, '   STR_IntegerToStr(attr, str, l);', FILES_maxIO, 0, left);
      FILES_writeline(of2, true);
      FILES_writestr(of2, 'END {LSTYPETOSTR_', FILES_maxIO, 0, left);
      FILES_writestring(of2,subrange1^.typename,0,left);
      FILES_writestr(of2,'};',FILES_maxIO,0,left);
      FILES_writeline(of2, true);
      FILES_writeline(of2, true);
      FILES_writeline(of2, true);
   END;
   FILES_writeline(of2, true);

   END {writeimpmodsubrange};


BEGIN {writelstypeconvfunctions}
   writedefmodenum(of1);
   writedefmodsubrange(of1);
   writeimpmodenum(of2);
   writeimpmodsubrange(of2);
END {writelstypeconvfunctions};


PROCEDURE writelsstrconvfunctions(VAR of1, of2: FILES_text);

   PROCEDURE writedefmodenum(VAR of1: FILES_text);
   VAR
      enumtable1     : setofenums;
      str            : STRING_string;
      enum1          : penum;
      idents         : setofidents;
   BEGIN

   enumtable1:=enumtable;
   while stillenums(enumtable1) do
      begin
      takeenum(enum1,enumtable1);
      FILES_writestr(of1,'FUNCTION LSSTRTOTYPE_',FILES_maxIO,0,left);
      FILES_writestring(of1,enum1^.typename,0,left);
      FILES_writestr(of1,'( ',FILES_maxIO,0,left);
      FILES_writeline(of1, true);
      FILES_writestr(of1, '         CONST str: STRING;',
		     FILES_maxIO, 0, left);
      FILES_writeline(of1, true);
      FILES_writestr(of1, '         l: STR_Range;',FILES_maxIO, 0, left);
      FILES_writeline(of1, true);
      FILES_writestr(of1, '         VAR attr : LSDOMAINT_',FILES_maxIO, 0, left);
      FILES_writestring(of1,enum1^.typename,0,left);
      FILES_writestr(of1, '         ): BOOLEAN; EXTERNAL;',FILES_maxIO, 0, left);
      FILES_writeline(of1, true);
      FILES_writeline(of1, true);
      FILES_writeline(of1, true);
   END;
   FILES_writeline(of1, true);

   END {writedefmodenum};



   PROCEDURE writeimpmodenum(VAR of2: FILES_text);
   VAR
      enumtable1     : setofenums;
      str            : STRING_string;
      enum1          : penum;
      idents         : setofidents;
   BEGIN

   enumtable1:=enumtable;
   while stillenums(enumtable1) do
      begin
      takeenum(enum1,enumtable1);
      FILES_writestr(of2,'FUNCTION LSSTRTOTYPE_',FILES_maxIO,0,left);
      FILES_writestring(of2,enum1^.typename,0,left);
      FILES_writestr(of2,'( ',FILES_maxIO,0,left);
      FILES_writeline(of2, true);
      FILES_writestr(of2, '         CONST str: STRING;',
		     FILES_maxIO, 0, left);
      FILES_writeline(of2, true);
      FILES_writestr(of2, '         l: STR_Range;',FILES_maxIO, 0, left);
      FILES_writeline(of2, true);
      FILES_writestr(of2, '         VAR attr : LSDOMAINT_',FILES_maxIO, 0, left);
      FILES_writestring(of2,enum1^.typename,0,left);
      FILES_writestr(of2, '         ): BOOLEAN;',FILES_maxIO, 0, left);
      FILES_writeline(of2, true);
      FILES_writestr(of2, 'VAR found: BOOLEAN;', FILES_maxIO, 0, left);
      FILES_writeline(of2, true);
      FILES_writestr(of2, 'BEGIN', FILES_maxIO, 0, left);
      FILES_writeline(of2, true);
      FILES_writestr(of2, '   found := FALSE;', FILES_maxIO, 0, left);
      FILES_writeline(of2, true);
      FILES_writestr(of2, '   IF FALSE THEN BEGIN', FILES_maxIO, 0, left);
      FILES_writeline(of2, true);
      FILES_writestr(of2, '      END', FILES_maxIO, 0, left);
      idents:=enum1^.idents;
      while stillidents(idents) do
	   begin
	   takeident(str,idents);
           FILES_writeline(of2, true);
           FILES_WriteStr(of2, '   ELSE IF STR_Compare(str, l, ''', FILES_MaxIO, 0, LEFT);
           FILES_writestring(of2, str, 0, left);
           FILES_WriteStr(of2, ''',', FILES_MaxIO, 0, LEFT);
           FILES_writeinteger(of2, STRING_length(str), 0, left); 
           FILES_WriteStr(of2, ') = 0 THEN BEGIN', FILES_MaxIO, 0, LEFT);
           FILES_writeline(of2, true);
           FILES_WriteStr(of2, '       attr := ', FILES_MaxIO, 0, LEFT);
           FILES_writestring(of2, str, 0, left);
           FILES_WriteStr(of2, ';', FILES_MaxIO, 0, LEFT);
           FILES_writeline(of2, true);
           FILES_WriteStr(of2, '       found := TRUE', FILES_MaxIO, 0, LEFT);
           FILES_writeline(of2, true);
           FILES_WriteStr(of2, '       END', FILES_MaxIO, 0, LEFT);

      END;      

      FILES_writestr(of2, ';', FILES_maxIO, 0, left);
      FILES_writeline(of2, true);
      FILES_writestr(of2, '   LSSTRTOTYPE_', FILES_maxIO, 0, left);
      FILES_writestring(of2,enum1^.typename,0,left);
      FILES_writestr(of2,' := found;',FILES_maxIO,0,left);
      FILES_writeline(of2, true);
      FILES_writestr(of2, 'END {LSSTRTOTYPE_', FILES_maxIO, 0, left);
      FILES_writestring(of2,enum1^.typename,0,left);
      FILES_writestr(of2,'};',FILES_maxIO,0,left);
      FILES_writeline(of2, true);
      FILES_writeline(of2, true);
      FILES_writeline(of2, true);
   END;
   FILES_writeline(of2, true);

   END {writeimpmodenum};


   PROCEDURE writedefmodsubrange(VAR of1: FILES_text);
   VAR
      subrangetable1     : setofsubranges;
      str                : STRING_string;
      subrange1          : psubrange;
      idents             : setofidents;
   BEGIN

   subrangetable1:=subrangetable;
   while stillsubranges(subrangetable1) do
      begin
      takesubrange(subrange1,subrangetable1);
      FILES_writestr(of1,'FUNCTION LSSTRTOTYPE_',FILES_maxIO,0,left);
      FILES_writestring(of1,subrange1^.typename,0,left);
      FILES_writestr(of1,'( ',FILES_maxIO,0,left);
      FILES_writeline(of1, true);
      FILES_writestr(of1, '         CONST str: STRING;',
		     FILES_maxIO, 0, left);
      FILES_writeline(of1, true);
      FILES_writestr(of1, '         l: STR_Range;',FILES_maxIO, 0, left);
      FILES_writeline(of1, true);
      FILES_writestr(of1, '         VAR attr : LSDOMAINT_',FILES_maxIO, 0, left);
      FILES_writestring(of1,subrange1^.typename,0,left);
      FILES_writestr(of1, '         ): BOOLEAN; EXTERNAL;',FILES_maxIO, 0, left);
      FILES_writeline(of1, true);
      FILES_writeline(of1, true);
      FILES_writeline(of1, true);
   END;
   FILES_writeline(of1, true);

   END {writedefmodsubrange};


   PROCEDURE writeimpmodsubrange(VAR of2: FILES_text);
   VAR
      subrangetable1     : setofsubranges;
      str                : STRING_string;
      subrange1          : psubrange;
      idents             : setofidents;
   BEGIN

   subrangetable1:=subrangetable;
   while stillsubranges(subrangetable1) do
      begin
      takesubrange(subrange1,subrangetable1);
      FILES_writestr(of2,'FUNCTION LSSTRTOTYPE_',FILES_maxIO,0,left);
      FILES_writestring(of2,subrange1^.typename,0,left);
      FILES_writestr(of2,'( ',FILES_maxIO,0,left);
      FILES_writeline(of2, true);
      FILES_writestr(of2, '         CONST str: STRING;',
		     FILES_maxIO, 0, left);
      FILES_writeline(of2, true);
      FILES_writestr(of2, '         l: STR_Range;',FILES_maxIO, 0, left);
      FILES_writeline(of2, true);
      FILES_writestr(of2, '         VAR attr : LSDOMAINT_',FILES_maxIO, 0, left);
      FILES_writestring(of2,subrange1^.typename,0,left);
      FILES_writestr(of2, '         ): BOOLEAN;',FILES_maxIO, 0, left);
      FILES_writeline(of2, true);
      FILES_writestr(of2, 'VAR tmp   : INTEGER;', FILES_maxIO, 0, left);
      FILES_writeline(of2, true);
      FILES_writestr(of2, '    result: BOOLEAN;', FILES_maxIO, 0, left);
      FILES_writeline(of2, true);
      FILES_writestr(of2, 'BEGIN', FILES_maxIO, 0, left);
      FILES_writeline(of2, true);
      FILES_writestr(of2, '   tmp := -1;', FILES_maxIO, 0, left);
      FILES_writeline(of2, true);
      FILES_writestr(of2, '   result := STR_StrToInteger(str, l, tmp);', FILES_maxIO, 0, left);
      FILES_writeline(of2, true);
      FILES_WriteStr(of2,'   IF result AND ( ', FILES_MaxIO, 0, LEFT);
      FILES_writestring(of2,subrange1^.ident1,0,left);
      FILES_WriteStr(of2,' <= tmp ) AND ( tmp <= ', FILES_MaxIO, 0, LEFT);
      FILES_writestring(of2,subrange1^.ident2,0,left);
      FILES_WriteStr(of2,' ) THEN BEGIN', FILES_MaxIO, 0, LEFT);
      FILES_writeline(of2, true);
      FILES_WriteStr(of2,'      attr := tmp; LSSTRTOTYPE_', FILES_MaxIO, 0, LEFT);
      FILES_writestring(of2,subrange1^.typename,0,left);
      FILES_WriteStr(of2,' := TRUE', FILES_MaxIO, 0, LEFT);
      FILES_writeline(of2, true);
      FILES_WriteStr(of2,'      END', FILES_MaxIO, 0, LEFT);
      FILES_writeline(of2, true);
      FILES_WriteStr(of2,' ELSE BEGIN', FILES_MaxIO, 0, LEFT);
      FILES_writeline(of2, true);
      FILES_WriteStr(of2,'      LSSTRTOTYPE_', FILES_MaxIO, 0, LEFT);
      FILES_writestring(of2,subrange1^.typename,0,left);
      FILES_WriteStr(of2,' := FALSE', FILES_MaxIO, 0, LEFT);
      FILES_writeline(of2, true);
      FILES_WriteStr(of2,'   END;', FILES_MaxIO, 0, LEFT);
      FILES_writestr(of2, 'END {LSSTRTOTYPE_', FILES_maxIO, 0, left);
      FILES_writestring(of2,subrange1^.typename,0,left);
      FILES_writestr(of2,'};',FILES_maxIO,0,left);
      FILES_writeline(of2, true);
      FILES_writeline(of2, true);
      FILES_writeline(of2, true);
   END;
   FILES_writeline(of2, true);

   END {writeimpmodsubrange};


BEGIN {writelsstrconvfunctions}
   writedefmodenum(of1);
   writedefmodsubrange(of1);
   writeimpmodenum(of2);
   writeimpmodsubrange(of2);
END {writelsstrconvfunctions};


PROCEDURE writelsconvrecfunctions(VAR of1, of2: FILES_text);


   PROCEDURE writedefmod1(VAR of1: FILES_text);
   VAR
      recordtable1 : SetOfRecords;
      record1      : pRecord;
      recordname   : STRING_String;
   BEGIN
      recordtable1 := recordtable;
      WHILE stillrecords(recordtable1) DO BEGIN
         takerecord(record1, recordtable1);
         recordname := record1^.recordname;
         FILES_WriteStr(of1,'FUNCTION LSCONVREC_',FILES_MaxIO, 0, LEFT);
         FILES_WriteString(of1,recordname, 0, LEFT);
         FILES_WriteStr(of1,'(rec: LSDOMAINT_',FILES_MaxIO, 0, LEFT);
         FILES_WriteString(of1,recordname, 0, LEFT);
         FILES_WriteStr(of1,'): LDCONVREC_pAttrStruct;',FILES_MaxIO, 0, LEFT);
         FILES_WriteLine(of1, TRUE);
         FILES_WriteStr(of1,'EXTERNAL;',FILES_MaxIO, 0, LEFT);
         FILES_WriteLine(of1, TRUE);
      END;
      FILES_WriteLine(of1, TRUE);
      FILES_WriteLine(of1, TRUE);
      FILES_WriteStr(of1,'PROCEDURE LSCONVREC_RecToAttr(rec: LSDOMAINT_LSrecord;',FILES_MaxIO, 0, LEFT);
      FILES_WriteLine(of1, TRUE);
      FILES_WriteStr(of1,'                                      VAR attr: LDCONVREC_pAttrStruct);',FILES_MaxIO, 0, LEFT);
      FILES_WriteLine(of1, TRUE);
      FILES_WriteStr(of1,'EXTERNAL;',FILES_MaxIO, 0, LEFT);
      FILES_WriteLine(of1, TRUE);
      FILES_WriteLine(of1, TRUE);
   END {writedefmod1};


   PROCEDURE writeimpmod1(VAR of1: FILES_text);
   VAR
      categorytable1: setofcatdefs;
      catdef1       : pcatdef;
      catnames      : SetOfIdents;
      catname       : STRING_String;
      recordtable1 : SetOfRecords;
      record1      : pRecord;
      attribs      : SetOfAttribs;
      attrib1      : pAttrib;
      recordname   : STRING_String;
      AttrMin,
      AttrMax      : STRING_String;

      PROCEDURE WriteHelpVars(record1: pRecord);
      VAR
         attribs      : SetOfAttribs;
         attrib1      : pAttrib;
      BEGIN
         attribs := record1^.attribs;
         WHILE stillattribs(attribs) DO BEGIN
            takeattrib(attrib1, attribs);
            IF attrib1^.kind = EnumSet THEN BEGIN
               FILES_WriteStr(of1,'    ',FILES_MaxIO, 0, LEFT);
               FILES_WriteString(of1,attrib1^.attribname, 0, LEFT);
               FILES_WriteStr(of1,' : LSDOMAINT_',FILES_MaxIO, 0, LEFT);
               FILES_WriteString(of1,attrib1^.basetype, 0, LEFT);
               FILES_WriteStr(of1,'; ',FILES_MaxIO, 0, LEFT);
               FILES_WriteLine(of1, TRUE);
            END;
         END;
      END {WriteHelpVars};


      PROCEDURE FindMinMax(typename : STRING_String;
                           VAR Min, Max : STRING_String);
      VAR
         enumtable1     : SetOfEnums;
         enum1          : pEnum;
         subrangetable1 : SetOfSubRanges;
         subrange1      : pSubRange;
         found          : BOOLEAN;
         idents         : SetOfIdents;
      BEGIN
         enumtable1:=enumtable; found := FALSE;
         WHILE stillenums(enumtable1) and not found DO BEGIN
            takeenum(enum1,enumtable1);
            IF enum1^.typename = typename THEN BEGIN
               idents:=enum1^.idents;
               takeident(Min,idents);
               Max:=Min;
               WHILE stillidents(idents) DO BEGIN
                  takeident(Max,idents);
               END;
               found := TRUE
            END
         END; 

         subrangetable1:=subrangetable;
         WHILE stillsubranges(subrangetable1) and not found DO BEGIN
            takesubrange(subrange1,subrangetable1);
            IF subrange1^.typename = typename THEN BEGIN
               Min := subrange1^.ident1;
               Max := subrange1^.ident2;
               found := TRUE
            END
         END;
      END {FindMinMax};
 
   BEGIN
      FILES_WriteStr(of1,'FUNCTION LSCONVREC_MakeAttr(a: LDCONVREC_pAttrStruct):', FILES_MaxIO, 0, LEFT);
      FILES_WriteLine(of1, TRUE);
      FILES_WriteStr(of1,'                            LDCONVREC_pAttrStruct;', FILES_MaxIO, 0, LEFT);
      FILES_WriteLine(of1, TRUE);
      FILES_WriteStr(of1,'VAR h: LDCONVREC_pAttrStruct;', FILES_MaxIO, 0, LEFT);
      FILES_WriteLine(of1, TRUE);
      FILES_WriteStr(of1,'BEGIN', FILES_MaxIO, 0, LEFT);
      FILES_WriteLine(of1, TRUE);
      FILES_WriteStr(of1,'   Mem_NewDefault(LOOPHOLES.SIZEOF(LDCONVREC_AttrStruct), LoopHoles.Retype(h,Mem_Ptr));', FILES_MaxIO, 0, LEFT);
      FILES_WriteLine(of1, TRUE);
      FILES_WriteStr(of1,'   WITH h^ DO BEGIN', FILES_MaxIO, 0, LEFT);
      FILES_WriteLine(of1, TRUE);
      FILES_WriteStr(of1,'      SetValue := NIL;', FILES_MaxIO, 0, LEFT);
      FILES_WriteLine(of1, TRUE);
      FILES_WriteStr(of1,'      NextAttr := a', FILES_MaxIO, 0, LEFT);
      FILES_WriteLine(of1, TRUE);
      FILES_WriteStr(of1,'   END;', FILES_MaxIO, 0, LEFT);
      FILES_WriteLine(of1, TRUE);
      FILES_WriteStr(of1,'   LSCONVREC_MakeAttr := h', FILES_MaxIO, 0, LEFT);
      FILES_WriteLine(of1, TRUE);
      FILES_WriteStr(of1,'END;', FILES_MaxIO, 0, LEFT);
      FILES_WriteLine(of1, TRUE);
      FILES_WriteLine(of1, TRUE);
      FILES_WriteStr(of1,'FUNCTION LSCONVREC_MakeSetElt(a: LDCONVREC_pSetValueType):', FILES_MaxIO, 0, LEFT);
      FILES_WriteLine(of1, TRUE);
      FILES_WriteStr(of1,'                            LDCONVREC_pSetValueType;', FILES_MaxIO, 0, LEFT);
      FILES_WriteLine(of1, TRUE);
      FILES_WriteStr(of1,'VAR h: LDCONVREC_pSetValueType;', FILES_MaxIO, 0, LEFT);
      FILES_WriteLine(of1, TRUE);
      FILES_WriteStr(of1,'BEGIN', FILES_MaxIO, 0, LEFT);
      FILES_WriteLine(of1, TRUE);
      FILES_WriteStr(of1,'   Mem_NewDefault(LOOPHOLES.SIZEOF(LDCONVREC_SetValueType), LoopHoles.Retype(h,Mem_Ptr));', FILES_MaxIO, 0, LEFT);
      FILES_WriteLine(of1, TRUE);
      FILES_WriteStr(of1,'   WITH h^ DO BEGIN', FILES_MaxIO, 0, LEFT);
      FILES_WriteLine(of1, TRUE);
      FILES_WriteStr(of1,'      NextValue := a', FILES_MaxIO, 0, LEFT);
      FILES_WriteLine(of1, TRUE);
      FILES_WriteStr(of1,'   END;', FILES_MaxIO, 0, LEFT);
      FILES_WriteLine(of1, TRUE);
      FILES_WriteStr(of1,'   LSCONVREC_MakeSetElt := h', FILES_MaxIO, 0, LEFT);
      FILES_WriteLine(of1, TRUE);
      FILES_WriteStr(of1,'END;', FILES_MaxIO, 0, LEFT);
      FILES_WriteLine(of1, TRUE);
      FILES_WriteLine(of1, TRUE);
      recordtable1 := recordtable;
      WHILE stillrecords(recordtable1) DO BEGIN
         takerecord(record1, recordtable1);
         recordname := record1^.recordname;
         FILES_WriteStr(of1,'FUNCTION LSCONVREC_',FILES_MaxIO, 0, LEFT);
         FILES_WriteString(of1,recordname, 0, LEFT);
         FILES_WriteStr(of1,'(rec: LSDOMAINT_',FILES_MaxIO, 0, LEFT);
         FILES_WriteString(of1,recordname, 0, LEFT);
         FILES_WriteStr(of1,'): LDCONVREC_pAttrStruct;',FILES_MaxIO, 0, LEFT);
         FILES_WriteLine(of1, TRUE);
         FILES_WriteStr(of1,'VAR result : LDCONVREC_pAttrStruct;',FILES_MaxIO, 0, LEFT);
         FILES_WriteLine(of1, TRUE);
         WriteHelpVars(record1);
         FILES_WriteStr(of1,'BEGIN',FILES_MaxIO, 0, LEFT);
         FILES_WriteLine(of1, TRUE);
         FILES_WriteStr(of1,'   result := NIL;',FILES_MaxIO, 0, LEFT);
         FILES_WriteLine(of1, TRUE);
         IF record1^.keypresent THEN BEGIN
            FILES_WriteStr(of1,'   result := LSCONVREC_MakeAttr(result);',FILES_MaxIO, 0, LEFT);
            FILES_WriteLine(of1, TRUE);
            FILES_WriteStr(of1,'   WITH result^ DO BEGIN',FILES_MaxIO, 0, LEFT);
            FILES_WriteLine(of1, TRUE);
            FILES_WriteStr(of1,'      fieldname.str := ''KEY'';',FILES_MaxIO, 0, LEFT);
            FILES_WriteLine(of1, TRUE);
            FILES_WriteStr(of1,'      fieldname.len := 3;',FILES_MaxIO, 0, LEFT);
            FILES_WriteLine(of1, TRUE);
            FILES_WriteStr(of1,'      typecode := 0;',FILES_MaxIO, 0, LEFT);
            FILES_WriteLine(of1, TRUE);
            FILES_WriteStr(of1,'      typeindicator := Int;',FILES_MaxIO, 0, LEFT);
            FILES_WriteLine(of1, TRUE);
            FILES_WriteStr(of1,'      STR_IntegerToStr(rec.KEY, ',FILES_MaxIO, 0, LEFT);
            FILES_WriteStr(of1,' fieldvalue.str,',FILES_MaxIO, 0, LEFT);
            FILES_WriteStr(of1,' fieldvalue.len);',FILES_MaxIO, 0, LEFT);
            FILES_WriteLine(of1, TRUE);
            FILES_WriteStr(of1,'   END;',FILES_MaxIO, 0, LEFT);
            FILES_WriteLine(of1, TRUE);
         END;
         IF record1^.indexpresent THEN BEGIN
            FILES_WriteStr(of1,'   result := LSCONVREC_MakeAttr(result);',FILES_MaxIO, 0, LEFT);
            FILES_WriteLine(of1, TRUE);
            FILES_WriteStr(of1,'   WITH result^ DO BEGIN',FILES_MaxIO, 0, LEFT);
            FILES_WriteLine(of1, TRUE);
            FILES_WriteStr(of1,'      fieldname.str := ''INDEX'';',FILES_MaxIO, 0, LEFT);
            FILES_WriteLine(of1, TRUE);
            FILES_WriteStr(of1,'      fieldname.len := 5;',FILES_MaxIO, 0, LEFT);
            FILES_WriteLine(of1, TRUE);
            FILES_WriteStr(of1,'      typecode := 0;',FILES_MaxIO, 0, LEFT);
            FILES_WriteLine(of1, TRUE);
            FILES_WriteStr(of1,'      typeindicator := Int;',FILES_MaxIO, 0, LEFT);
            FILES_WriteLine(of1, TRUE);
            FILES_WriteStr(of1,'      STR_IntegerToStr(rec.INDEX, ',FILES_MaxIO, 0, LEFT);
            FILES_WriteStr(of1,' fieldvalue.str,',FILES_MaxIO, 0, LEFT);
            FILES_WriteStr(of1,' fieldvalue.len);',FILES_MaxIO, 0, LEFT);
            FILES_WriteLine(of1, TRUE);
            FILES_WriteStr(of1,'   END;',FILES_MaxIO, 0, LEFT);
            FILES_WriteLine(of1, TRUE);
         END;
         attribs := record1^.attribs;
         WHILE stillattribs(attribs) DO BEGIN
            takeattrib(attrib1, attribs);
            FILES_WriteStr(of1,'   result := LSCONVREC_MakeAttr(result);',FILES_MaxIO, 0, LEFT);
            FILES_WriteLine(of1, TRUE);
            FILES_WriteStr(of1,'   WITH result^ DO BEGIN',FILES_MaxIO, 0, LEFT);
            FILES_WriteLine(of1, TRUE);
            FILES_WriteStr(of1,'      fieldname.str := ''',FILES_MaxIO, 0, LEFT);
            FILES_WriteString(of1,attrib1^.attribname, 0, LEFT);
            FILES_WriteStr(of1,''';',FILES_MaxIO, 0, LEFT);
            FILES_WriteLine(of1, TRUE);
            FILES_WriteStr(of1,'      fieldname.len := ',FILES_MaxIO, 0, LEFT);
            FILES_WriteInteger(of1, STRING_Length(attrib1^.attribname), 0, LEFT);
            FILES_WriteStr(of1,';',FILES_MaxIO, 0, LEFT);
            FILES_WriteLine(of1, TRUE);
            FILES_WriteStr(of1,'      typecode := ',FILES_MaxIO, 0, LEFT);
            FILES_WriteInteger(of1,attrib1^.typecode, 0, LEFT);
            FILES_WriteStr(of1,';',FILES_MaxIO, 0, LEFT);
            FILES_WriteLine(of1, TRUE);
            FILES_WriteStr(of1,'   END;',FILES_MaxIO, 0, LEFT);
            FILES_WriteLine(of1, TRUE);
            CASE attrib1^.kind OF
            EnumSet: BEGIN
               FindMinMax(attrib1^.basetype, AttrMin, AttrMax);
               FILES_WriteStr(of1,'   result^.typeindicator := EnumSet;',FILES_MaxIO, 0, LEFT);
               FILES_WriteLine(of1, TRUE);
               FILES_WriteStr(of1,'   FOR ',FILES_MaxIO, 0, LEFT);
               FILES_WriteString(of1,attrib1^.attribname, 0, LEFT);
               FILES_WriteStr(of1,':=',FILES_MaxIO, 0, LEFT);
               FILES_WriteString(of1,AttrMin, 0, LEFT);
               FILES_WriteStr(of1,' TO ',FILES_MaxIO, 0, LEFT);
               FILES_WriteString(of1,AttrMax, 0, LEFT);
               FILES_WriteStr(of1,' DO BEGIN',FILES_MaxIO, 0, LEFT);
               FILES_WriteLine(of1, TRUE);
               FILES_WriteStr(of1,'      IF ',FILES_MaxIO, 0, LEFT);
               FILES_WriteString(of1,attrib1^.attribname, 0, LEFT);
               FILES_WriteStr(of1,' IN rec.',FILES_MaxIO, 0, LEFT);
               FILES_WriteString(of1,attrib1^.attribname, 0, LEFT);
               FILES_WriteStr(of1,' THEN BEGIN',FILES_MaxIO, 0, LEFT);
               FILES_WriteLine(of1, TRUE);
               FILES_WriteStr(of1,'         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);',FILES_MaxIO, 0, LEFT);
               FILES_WriteLine(of1, TRUE);
               FILES_WriteStr(of1,'         LSTYPETOSTR_',FILES_MaxIO, 0, LEFT);
               FILES_WriteString(of1,attrib1^.basetype, 0, LEFT);
               FILES_WriteStr(of1,'( result^.setvalue^.eltvalue.str,',FILES_MaxIO, 0, LEFT);
               FILES_WriteStr(of1,' result^.setvalue^.eltvalue.len,',FILES_MaxIO, 0, LEFT);
               FILES_WriteString(of1,attrib1^.attribname, 0, LEFT);
               FILES_WriteStr(of1,');',FILES_MaxIO, 0, LEFT);
               FILES_WriteLine(of1, TRUE);
               FILES_WriteStr(of1,'      END;',FILES_MaxIO, 0, LEFT);
               FILES_WriteLine(of1, TRUE);
               FILES_WriteStr(of1,'   END;',FILES_MaxIO, 0, LEFT);
               FILES_WriteLine(of1, TRUE);
               END;            
            SubRang: BEGIN
               FILES_WriteStr(of1,'   result^.typeindicator := SubRange;',FILES_MaxIO, 0, LEFT);
               FILES_WriteLine(of1, TRUE);
               FILES_WriteStr(of1,'   LSTYPETOSTR_',FILES_MaxIO, 0, LEFT);
               FILES_WriteString(of1,attrib1^.typename, 0, LEFT);
               FILES_WriteStr(of1,'( result^.fieldvalue.str,',FILES_MaxIO, 0, LEFT);
               FILES_WriteStr(of1,' result^.fieldvalue.len, rec.',FILES_MaxIO, 0, LEFT);
               FILES_WriteString(of1,attrib1^.attribname, 0, LEFT);
               FILES_WriteStr(of1,');',FILES_MaxIO, 0, LEFT);
               FILES_WriteLine(of1, TRUE);
               END;            
            Enumeration: BEGIN
               FILES_WriteStr(of1,'   result^.typeindicator := Enumeration;',FILES_MaxIO, 0, LEFT);
               FILES_WriteLine(of1, TRUE);
               FILES_WriteStr(of1,'   LSTYPETOSTR_',FILES_MaxIO, 0, LEFT);
               FILES_WriteString(of1,attrib1^.typename, 0, LEFT);
               FILES_WriteStr(of1,'( result^.fieldvalue.str,',FILES_MaxIO, 0, LEFT);
               FILES_WriteStr(of1,' result^.fieldvalue.len, rec.',FILES_MaxIO, 0, LEFT);
               FILES_WriteString(of1,attrib1^.attribname, 0, LEFT);
               FILES_WriteStr(of1,');',FILES_MaxIO, 0, LEFT);
               FILES_WriteLine(of1, TRUE);
               END;            
            Key: BEGIN
               END;            
            Int: BEGIN
               FILES_WriteStr(of1,'   result^.typeindicator := Int;',FILES_MaxIO, 0, LEFT);
               FILES_WriteLine(of1, TRUE);
               FILES_WriteStr(of1,'   STR_IntegerToStr',FILES_MaxIO, 0, LEFT);
               FILES_WriteStr(of1,'( rec.',FILES_MaxIO, 0, LEFT);
               FILES_WriteString(of1,attrib1^.attribname, 0, LEFT);
               FILES_WriteStr(of1,', result^.fieldvalue.str,',FILES_MaxIO, 0, LEFT);
               FILES_WriteStr(of1,' result^.fieldvalue.len',FILES_MaxIO, 0, LEFT);
               FILES_WriteStr(of1,');',FILES_MaxIO, 0, LEFT);
               FILES_WriteLine(of1, TRUE);
               END;            
            Bool: BEGIN
               FILES_WriteStr(of1,'   result^.typeindicator := Bool;',FILES_MaxIO, 0, LEFT);
               FILES_WriteLine(of1, TRUE);
               FILES_WriteStr(of1,'   IF rec.',FILES_MaxIO, 0, LEFT);
               FILES_WriteString(of1,attrib1^.attribname, 0, LEFT);
               FILES_WriteStr(of1,' = TRUE THEN BEGIN',FILES_MaxIO, 0, LEFT);
               FILES_WriteLine(of1, TRUE);
               FILES_WriteStr(of1,'      result^.fieldvalue.str := ''TRUE'';',FILES_MaxIO, 0, LEFT);
               FILES_WriteLine(of1, TRUE);
               FILES_WriteStr(of1,'      result^.fieldvalue.len := 4;',FILES_MaxIO, 0, LEFT);
               FILES_WriteLine(of1, TRUE);
               FILES_WriteStr(of1,'      END',FILES_MaxIO, 0, LEFT);
               FILES_WriteLine(of1, TRUE);
               FILES_WriteStr(of1,'   ELSE BEGIN',FILES_MaxIO, 0, LEFT);
               FILES_WriteLine(of1, TRUE);
               FILES_WriteStr(of1,'      result^.fieldvalue.str := ''FALSE'';',FILES_MaxIO, 0, LEFT);
               FILES_WriteLine(of1, TRUE);
               FILES_WriteStr(of1,'      result^.fieldvalue.len := 5;',FILES_MaxIO, 0, LEFT);
               FILES_WriteLine(of1, TRUE);
               FILES_WriteStr(of1,'   END;',FILES_MaxIO, 0, LEFT);
               FILES_WriteLine(of1, TRUE);
               END;            
            String: BEGIN
               END;            
            END;
         END;
         FILES_WriteStr(of1,'   LSCONVREC_',FILES_MaxIO, 0, LEFT);
         FILES_WriteString(of1,recordname, 0, LEFT);
         FILES_WriteStr(of1,' := result;',FILES_MaxIO, 0, LEFT);
         FILES_WriteLine(of1, TRUE);
         FILES_WriteStr(of1,'END {LSCONVREC_',FILES_MaxIO, 0, LEFT);
         FILES_WriteString(of1,recordname, 0, LEFT);
         FILES_WriteStr(of1,'};',FILES_MaxIO, 0, LEFT);
         FILES_WriteLine(of1, TRUE);
         FILES_WriteLine(of1, TRUE);
      END;
      FILES_WriteLine(of1, TRUE);
      FILES_WriteStr(of1,'PROCEDURE LSCONVREC_RecToAttr(rec: LSDOMAINT_LSrecord;',FILES_MaxIO, 0, LEFT);
      FILES_WriteLine(of1, TRUE);
      FILES_WriteStr(of1,'                                      VAR attr: LDCONVREC_pAttrStruct);',FILES_MaxIO, 0, LEFT);
      FILES_WriteLine(of1, TRUE);
      FILES_WriteStr(of1,'BEGIN',FILES_MaxIO, 0, LEFT);
      FILES_WriteLine(of1, TRUE);
      FILES_WriteStr(of1,'   CASE rec.cat OF ',FILES_MaxIO, 0, LEFT);
      FILES_WriteLine(of1, TRUE);
      categorytable1 := categorytable;
      WHILE stillcatdefs(categorytable1) DO BEGIN
	 takecatdef( catdef1, categorytable1 );
	 recordname := catdef1^.recordname;
	 catnames   := catdef1^.catnames;
	 WHILE stillidents(catnames) DO BEGIN
	    takeident(catname, catnames);
	    FILES_WriteStr(of1,'   ',FILES_MaxIO, 0, LEFT);
	    FILES_WriteString(of1,catname, 0, LEFT);
	    FILES_WriteStr(of1,': BEGIN',FILES_MaxIO, 0, LEFT);
	    FILES_WriteLine(of1, TRUE);
	    FILES_WriteStr(of1,'      attr := LSCONVREC_',FILES_MaxIO, 0, LEFT);
	    FILES_WriteString(of1,recordname, 0, LEFT);
	    FILES_WriteStr(of1,'( rec.',FILES_MaxIO, 0, LEFT);
	    FILES_WriteString(of1,catname, 0, LEFT);
	    FILES_WriteStr(of1,'field^);',FILES_MaxIO, 0, LEFT);
	    FILES_WriteLine(of1, TRUE);
	    FILES_WriteStr(of1,'      END;',FILES_MaxIO, 0, LEFT);
	    FILES_WriteLine(of1, TRUE);
	 END;
      END;
      FILES_WriteStr(of1,'   END;',FILES_MaxIO, 0, LEFT);      
      FILES_WriteLine(of1, TRUE);
      FILES_WriteStr(of1,'END {LSCONVREC_RecToAttr};',FILES_MaxIO, 0, LEFT);
      FILES_WriteLine(of1, TRUE);
   END {writeimpmod1};


BEGIN {writelsconvrecfunctions}
   writedefmod1(of1);
   writeimpmod1(of2);
END {writelsconvrecfunction};

PROCEDURE writelsconvattrfunctions(VAR of1, of2: FILES_text);


   PROCEDURE writedefmod1(VAR of1: FILES_text);
   VAR
      recordtable1 : SetOfRecords;
      record1      : pRecord;
      recordname   : STRING_String;
   BEGIN
      recordtable1 := recordtable;
      WHILE stillrecords(recordtable1) DO BEGIN
         takerecord(record1, recordtable1);
         recordname := record1^.recordname;
         FILES_WriteStr(of1, 'FUNCTION LSCONVATTR_', FILES_MaxIO, 0, LEFT);
         FILES_WriteString(of1,recordname, 0, LEFT);
         FILES_WriteStr(of1, '(VAR rec: LSDOMAINT_', FILES_MaxIO, 0, LEFT);
         FILES_WriteString(of1,recordname, 0, LEFT);
         FILES_WriteStr(of1, ';', FILES_MaxIO, 0, LEFT);
         FILES_WriteLine(of1, TRUE);
         FILES_WriteStr(of1, '                    VAR pattr: LDCONVREC_pAttrStruct): BOOLEAN;', FILES_MaxIO, 0, LEFT);
         FILES_WriteLine(of1, TRUE);
         FILES_WriteStr(of1, 'EXTERNAL;', FILES_MaxIO, 0, LEFT);
         FILES_WriteLine(of1, TRUE);
      END;
      FILES_WriteLine(of1, TRUE);
      FILES_WriteLine(of1, TRUE);
      FILES_WriteStr(of1,'FUNCTION LSCONVATTR_AttrToRec(CONST catstr: STRING;',FILES_MaxIO, 0, LEFT);
      FILES_WriteLine(of1, TRUE);
      FILES_WriteStr(of1,'                                       catlen: INTEGER;',FILES_MaxIO, 0, LEFT);
      FILES_WriteLine(of1, TRUE);
      FILES_WriteStr(of1,'                                       VAR pattr: LDCONVREC_pAttrStruct;',FILES_MaxIO, 0, LEFT);
      FILES_WriteLine(of1, TRUE);
      FILES_WriteStr(of1,'                                       VAR rec: LSDOMAINT_LSrecord):',FILES_MaxIO, 0, LEFT);
      FILES_WriteLine(of1, TRUE);
      FILES_WriteStr(of1,'                                       BOOLEAN; EXTERNAL;',FILES_MaxIO, 0, LEFT);
      FILES_WriteLine(of1, TRUE);
      FILES_WriteLine(of1, TRUE);
      FILES_WriteStr(of1,'FUNCTION LSCONVATTR_AttrToBlexRec(CONST catstr: STRING;',FILES_MaxIO, 0, LEFT);
      FILES_WriteLine(of1, TRUE);
      FILES_WriteStr(of1,'                                       catlen: INTEGER;',FILES_MaxIO, 0, LEFT);
      FILES_WriteLine(of1, TRUE);
      FILES_WriteStr(of1,'                                       VAR pattr: LDCONVREC_pAttrStruct;',FILES_MaxIO, 0, LEFT);
      FILES_WriteLine(of1, TRUE);
      FILES_WriteStr(of1,'                                       VAR rec: LSDOMAINT_BlexStruct):',FILES_MaxIO, 0, LEFT);
      FILES_WriteLine(of1, TRUE);
      FILES_WriteStr(of1,'                                       BOOLEAN; EXTERNAL;',FILES_MaxIO, 0, LEFT);
      FILES_WriteLine(of1, TRUE);
   END {writedefmod1};


   PROCEDURE writeimpmod1(VAR of1: FILES_text);
   VAR
      categorytable1: setofcatdefs;
      catdef1       : pcatdef;
      catnames      : SetOfIdents;
      catname       : STRING_String;
      recordtable1 : SetOfRecords;
      record1      : pRecord;
      attribs      : SetOfAttribs;
      attrib1      : pAttrib;
      recordname   : STRING_String;
      AttrMin,
      AttrMax      : STRING_String;

      FUNCTION haskey (recordname:STRING_string): BOOLEAN;
      VAR record1:precord;
	  recordtable1:setofrecords;
	  recordfound:boolean;
      BEGIN{writeomega}
	 recordtable1:=recordtable;
	 recordfound:=false;
	 haskey := false;
	 WHILE stillrecords(recordtable1) and not(recordfound) DO BEGIN
	    takerecord(record1,recordtable1);
	    IF STRING_compare(record1^.recordname,recordname)=0 THEN recordfound:=true
	 END;
	 IF recordfound THEN BEGIN
	    IF record1^.keypresent THEN haskey := true;
	 END
      END;{haskey}

      PROCEDURE WriteHelpVars(record1: pRecord);
      VAR
         attribs      : SetOfAttribs;
         attrib1      : pAttrib;
      BEGIN
         attribs := record1^.attribs;
         WHILE stillattribs(attribs) DO BEGIN
            takeattrib(attrib1, attribs);
            IF attrib1^.kind = EnumSet THEN BEGIN
               FILES_WriteStr(of1, '    ', FILES_MaxIO, 0, LEFT);
               FILES_WriteString(of1,attrib1^.attribname, 0, LEFT);
               FILES_WriteStr(of1, ' : LSDOMAINT_', FILES_MaxIO, 0, LEFT);
               FILES_WriteString(of1,attrib1^.basetype, 0, LEFT);
               FILES_WriteStr(of1, '; ', FILES_MaxIO, 0, LEFT);
               FILES_WriteLine(of1, TRUE);
            END;
         END;
      END {WriteHelpVars};

   BEGIN
      recordtable1 := recordtable;
      WHILE stillrecords(recordtable1) DO BEGIN
         takerecord(record1, recordtable1);
         recordname := record1^.recordname;
         FILES_WriteStr(of1, 'FUNCTION LSCONVATTR_', FILES_MaxIO, 0, LEFT);
         FILES_WriteString(of1,recordname, 0, LEFT);
         FILES_WriteStr(of1, '(VAR rec: LSDOMAINT_', FILES_MaxIO, 0, LEFT);
         FILES_WriteString(of1,recordname, 0, LEFT);
         FILES_WriteStr(of1, ';', FILES_MaxIO, 0, LEFT);
         FILES_WriteLine(of1, TRUE);
         FILES_WriteStr(of1, '                  VAR pattr: LDCONVREC_pAttrStruct): BOOLEAN;', FILES_MaxIO, 0, LEFT);
         FILES_WriteLine(of1, TRUE);
         FILES_WriteStr(of1, 'VAR result : BOOLEAN;', FILES_MaxIO, 0, LEFT);
         FILES_WriteLine(of1, TRUE);
         FILES_WriteStr(of1, '    setp   : LDCONVREC_pSetValueType;', FILES_MaxIO, 0, LEFT);
         FILES_WriteLine(of1, TRUE);
         FILES_WriteStr(of1, '    attr   : LDCONVREC_pAttrStruct;', FILES_MaxIO, 0, LEFT);
         FILES_WriteLine(of1, TRUE);
         FILES_WriteLine(of1, TRUE);
         WriteHelpVars(record1);
         FILES_WriteStr(of1, 'BEGIN', FILES_MaxIO, 0, LEFT);
         FILES_WriteLine(of1, TRUE);
         FILES_WriteStr(of1, '   result := TRUE; attr := pattr;', FILES_MaxIO, 0, LEFT);
         FILES_WriteLine(of1, TRUE);
         FILES_WriteStr(of1, '   MAKET_', FILES_MaxIO, 0, LEFT);
         FILES_WriteString(of1,record1^.oneofthecats, 0, LEFT);
         FILES_WriteStr(of1, 'rec(rec);', FILES_MaxIO, 0, LEFT);
         FILES_WriteLine(of1, TRUE);
         FILES_WriteStr(of1, '   WHILE (attr <> NIL) AND result DO BEGIN', FILES_MaxIO, 0, LEFT);
         FILES_WriteLine(of1, TRUE);
         FILES_WriteStr(of1, '   WITH attr^ DO BEGIN', FILES_MaxIO, 0, LEFT);
         FILES_WriteLine(of1, TRUE);
         FILES_WriteStr(of1, '      IF FALSE THEN BEGIN', FILES_MaxIO, 0, LEFT);
         FILES_WriteLine(of1, TRUE);
         FILES_WriteStr(of1, '         END', FILES_MaxIO, 0, LEFT);
         IF record1^.keypresent THEN BEGIN
            FILES_WriteLine(of1, TRUE);
            FILES_WriteStr(of1, '      ELSE IF STR_Compare(fieldname.str, fieldname.len,', FILES_MaxIO, 0, LEFT);
            FILES_WriteLine(of1, TRUE);
            FILES_WriteStr(of1, '                          ''KEY'', 3) = 0 THEN BEGIN', FILES_MaxIO, 0, LEFT);
            FILES_WriteLine(of1, TRUE);
            FILES_WriteStr(of1, '         result := STR_StrToInteger(fieldvalue.str,', FILES_MaxIO, 0, LEFT);
            FILES_WriteLine(of1, TRUE);
            FILES_WriteStr(of1, '                                 fieldvalue.len, rec.key);', FILES_MaxIO, 0, LEFT);
            FILES_WriteLine(of1, TRUE);
            FILES_WriteStr(of1, '         END', FILES_MaxIO, 0, LEFT);
         END;
         attribs := record1^.attribs;
         WHILE stillattribs(attribs) DO BEGIN
            takeattrib(attrib1, attribs);
            FILES_WriteLine(of1, TRUE);
            FILES_WriteStr(of1, '      ELSE IF STR_Compare(fieldname.str, fieldname.len,', FILES_MaxIO, 0, LEFT);
            FILES_WriteLine(of1, TRUE);
            FILES_WriteStr(of1, '                       ''', FILES_MaxIO, 0, LEFT);
            FILES_WriteString(of1,attrib1^.attribname, 0, LEFT);
            FILES_WriteStr(of1, ''',', FILES_MaxIO, 0, LEFT);
            FILES_WriteInteger(of1, STRING_Length(attrib1^.attribname), 0, LEFT);
            FILES_WriteStr(of1, ') = 0 THEN BEGIN', FILES_MaxIO, 0, LEFT);
            FILES_WriteLine(of1, TRUE);
            CASE attrib1^.kind OF
            EnumSet: BEGIN
               FILES_WriteStr(of1, '         setp := setvalue;', FILES_MaxIO, 0, LEFT);
               FILES_WriteLine(of1, TRUE);
               FILES_WriteStr(of1, '         rec.', FILES_MaxIO, 0, LEFT);
               FILES_WriteString(of1,attrib1^.attribname, 0, LEFT);
               FILES_WriteStr(of1, ' := [];', FILES_MaxIO, 0, LEFT);
               FILES_WriteLine(of1, TRUE);
               FILES_WriteStr(of1, '         WHILE (setp <> NIL) AND result DO BEGIN', FILES_MaxIO, 0, LEFT);
               FILES_WriteLine(of1, TRUE);
               FILES_WriteStr(of1, '            result := LSSTRTOTYPE_', FILES_MaxIO, 0, LEFT);
               FILES_WriteString(of1,attrib1^.basetype, 0, LEFT);
               FILES_WriteStr(of1, '(', FILES_MaxIO, 0, LEFT);
               FILES_WriteLine(of1, TRUE);
               FILES_WriteStr(of1, '                         setp^.eltvalue.str,', FILES_MaxIO, 0, LEFT);
               FILES_WriteLine(of1, TRUE);
               FILES_WriteStr(of1, '                         setp^.eltvalue.len,', FILES_MaxIO, 0, LEFT);
               FILES_WriteLine(of1, TRUE);
               FILES_WriteStr(of1, '                         ', FILES_MaxIO, 0, LEFT);
               FILES_WriteString(of1,attrib1^.attribname, 0, LEFT);
               FILES_WriteStr(of1, ');', FILES_MaxIO, 0, LEFT);
               FILES_WriteLine(of1, TRUE);
               FILES_WriteStr(of1, '            IF result THEN BEGIN', FILES_MaxIO, 0, LEFT);
               FILES_WriteLine(of1, TRUE);
               FILES_WriteStr(of1, '               rec.', FILES_MaxIO, 0, LEFT);
               FILES_WriteString(of1,attrib1^.attribname, 0, LEFT);
               FILES_WriteStr(of1, ' := rec.', FILES_MaxIO, 0, LEFT);
               FILES_WriteString(of1,attrib1^.attribname, 0, LEFT); 
               FILES_WriteStr(of1, ' + [', FILES_MaxIO, 0, LEFT);
               FILES_WriteString(of1,attrib1^.attribname, 0, LEFT);
               FILES_WriteStr(of1, '];', FILES_MaxIO, 0, LEFT);
               FILES_WriteLine(of1, TRUE);
               FILES_WriteStr(of1, '            END;', FILES_MaxIO, 0, LEFT);
               FILES_WriteLine(of1, TRUE);
               FILES_WriteStr(of1, '            setp := setp^.NextValue', FILES_MaxIO, 0, LEFT);
               FILES_WriteStr(of1, '         END', FILES_MaxIO, 0, LEFT);
               FILES_WriteLine(of1, TRUE);
               FILES_WriteLine(of1, TRUE);
               END;            
            SubRang: BEGIN
               FILES_WriteStr(of1, '         result := LSSTRTOTYPE_', FILES_MaxIO, 0, LEFT);
               FILES_WriteString(of1,attrib1^.typename, 0, LEFT);
               FILES_WriteStr(of1, '( fieldvalue.str,', FILES_MaxIO, 0, LEFT);
               FILES_WriteStr(of1, ' fieldvalue.len, rec.', FILES_MaxIO, 0, LEFT);
               FILES_WriteString(of1,attrib1^.attribname, 0, LEFT);
               FILES_WriteStr(of1, ');', FILES_MaxIO, 0, LEFT);
               FILES_WriteLine(of1, TRUE);
               END;            
            Enumeration: BEGIN
               FILES_WriteStr(of1, '         result := LSSTRTOTYPE_', FILES_MaxIO, 0, LEFT);
               FILES_WriteString(of1,attrib1^.typename, 0, LEFT);
               FILES_WriteStr(of1, '( fieldvalue.str,', FILES_MaxIO, 0, LEFT);
               FILES_WriteStr(of1, ' fieldvalue.len, rec.', FILES_MaxIO, 0, LEFT);
               FILES_WriteString(of1,attrib1^.attribname, 0, LEFT);
               FILES_WriteStr(of1, ');', FILES_MaxIO, 0, LEFT);
               FILES_WriteLine(of1, TRUE);
               END;            
            Key: BEGIN
               END;            
            Int: BEGIN
               FILES_WriteStr(of1, '         result := STR_StrToInteger', FILES_MaxIO, 0, LEFT);
               FILES_WriteStr(of1, '(fieldvalue.str,', FILES_MaxIO, 0, LEFT);
               FILES_WriteStr(of1, ' fieldvalue.len,', FILES_MaxIO, 0, LEFT);
               FILES_WriteStr(of1, ' rec.', FILES_MaxIO, 0, LEFT);
               FILES_WriteString(of1,attrib1^.attribname, 0, LEFT);
               FILES_WriteStr(of1, ');', FILES_MaxIO, 0, LEFT);
               FILES_WriteLine(of1, TRUE);
               END;            
            Bool: BEGIN
               FILES_WriteStr(of1, '         result := FALSE;', FILES_MaxIO, 0, LEFT);
               FILES_WriteLine(of1, TRUE);
               FILES_WriteStr(of1, '         IF STR_Compare(fieldvalue.str, fieldvalue.len,', FILES_MaxIO, 0, LEFT);
               FILES_WriteLine(of1, TRUE);
               FILES_WriteStr(of1, '                       ''TRUE'', 4) = 0 THEN BEGIN', FILES_MaxIO, 0, LEFT);
               FILES_WriteLine(of1, TRUE);
               FILES_WriteStr(of1, '            rec.', FILES_MaxIO, 0, LEFT);
               FILES_WriteString(of1,attrib1^.attribname, 0, LEFT);
               FILES_WriteStr(of1, ' := TRUE; result := TRUE ', FILES_MaxIO, 0, LEFT);
               FILES_WriteLine(of1, TRUE);
               FILES_WriteStr(of1, '            END', FILES_MaxIO, 0, LEFT);
               FILES_WriteLine(of1, TRUE);
               FILES_WriteStr(of1, '         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,', FILES_MaxIO, 0, LEFT);
               FILES_WriteLine(of1, TRUE);
               FILES_WriteStr(of1, '                             ''FALSE'', 5) = 0 THEN BEGIN', FILES_MaxIO, 0, LEFT);
               FILES_WriteLine(of1, TRUE);
               FILES_WriteStr(of1, '            rec.', FILES_MaxIO, 0, LEFT);
               FILES_WriteString(of1,attrib1^.attribname, 0, LEFT);
               FILES_WriteStr(of1, ' := FALSE; result := TRUE ', FILES_MaxIO, 0, LEFT);
               FILES_WriteLine(of1, TRUE);
               FILES_WriteStr(of1, '         END;', FILES_MaxIO, 0, LEFT);
               FILES_WriteLine(of1, TRUE);
               END;            
            String: BEGIN
               END;            
            END;
            FILES_WriteStr(of1, '         END', FILES_MaxIO, 0, LEFT);
         END;
         FILES_WriteStr(of1, ';', FILES_MaxIO, 0, LEFT);
         FILES_WriteLine(of1, TRUE);
         FILES_WriteStr(of1, '      END;', FILES_MaxIO, 0, LEFT);
         FILES_WriteLine(of1, TRUE);
         FILES_WriteStr(of1, '      attr^.Error := (NOT result);', FILES_MaxIO, 0, LEFT);
         FILES_WriteLine(of1, TRUE);
         FILES_WriteStr(of1, '      attr := attr^.NextAttr', FILES_MaxIO, 0, LEFT);
         FILES_WriteLine(of1, TRUE);
         FILES_WriteStr(of1, '   END;', FILES_MaxIO, 0, LEFT);
         FILES_WriteLine(of1, TRUE);
         FILES_WriteStr(of1, '   LSCONVATTR_', FILES_MaxIO, 0, LEFT);
         FILES_WriteString(of1,recordname, 0, LEFT);
         FILES_WriteStr(of1, ' := result;', FILES_MaxIO, 0, LEFT);
         FILES_WriteLine(of1, TRUE);
         FILES_WriteStr(of1, 'END {LSCONVATTR_', FILES_MaxIO, 0, LEFT);
         FILES_WriteString(of1,recordname, 0, LEFT);
         FILES_WriteStr(of1, '};', FILES_MaxIO, 0, LEFT);
         FILES_WriteLine(of1, TRUE);
         FILES_WriteLine(of1, TRUE);
      END;
      FILES_WriteLine(of1, TRUE);
      FILES_WriteLine(of1, TRUE);
      FILES_WriteStr(of1,'FUNCTION LSCONVATTR_AttrToRec(CONST catstr: STRING;',FILES_MaxIO, 0, LEFT);
      FILES_WriteLine(of1, TRUE);
      FILES_WriteStr(of1,'                                       catlen: INTEGER;',FILES_MaxIO, 0, LEFT);
      FILES_WriteLine(of1, TRUE);
      FILES_WriteStr(of1,'                                       VAR pattr: LDCONVREC_pAttrStruct;',FILES_MaxIO, 0, LEFT);
      FILES_WriteLine(of1, TRUE);
      FILES_WriteStr(of1,'                                       VAR rec: LSDOMAINT_LSrecord):',FILES_MaxIO, 0, LEFT);
      FILES_WriteLine(of1, TRUE);
      FILES_WriteStr(of1,'                                       BOOLEAN;',FILES_MaxIO, 0, LEFT);
      FILES_WriteLine(of1, TRUE);
      FILES_WriteStr(of1,'VAR result : BOOLEAN;',FILES_MaxIO, 0, LEFT);
      FILES_WriteLine(of1, TRUE);
      FILES_WriteStr(of1,'    attr   : LDCONVREC_pAttrStruct;',FILES_MaxIO, 0, LEFT);
      FILES_WriteLine(of1, TRUE);
      FILES_WriteStr(of1,'    catli  : LIDOMAINT_syntcat;',FILES_MaxIO, 0, LEFT);
      FILES_WriteLine(of1, TRUE);
      FILES_WriteStr(of1,'BEGIN',FILES_MaxIO, 0, LEFT);
      FILES_WriteLine(of1, TRUE);
      FILES_WriteStr(of1,'   result := LDSTRTOTYPE_Cat(catstr, catlen, catli);',FILES_MaxIO, 0, LEFT);
      FILES_WriteLine(of1, TRUE);
      FILES_WriteStr(of1,'   attr := pattr;',FILES_MaxIO, 0, LEFT);
      FILES_WriteLine(of1, TRUE);
      FILES_WriteStr(of1,'   IF result THEN BEGIN',FILES_MaxIO, 0, LEFT);
      FILES_WriteLine(of1, TRUE);
      FILES_WriteStr(of1,'      rec.cat := LoopHoles.Retype(catli,LSDOMAINT_syntcat);',FILES_MaxIO, 0, LEFT);
      FILES_WriteLine(of1, TRUE);
      FILES_WriteStr(of1,'      CASE rec.cat OF ',FILES_MaxIO, 0, LEFT);
      FILES_WriteLine(of1, TRUE);
      categorytable1 := categorytable;
      WHILE stillcatdefs(categorytable1) DO BEGIN
	 takecatdef( catdef1, categorytable1 );
	 recordname := catdef1^.recordname;
	 catnames   := catdef1^.catnames;
	 WHILE stillidents(catnames) DO BEGIN
	    takeident(catname, catnames);
	    FILES_WriteStr(of1,'      ',FILES_MaxIO, 0, LEFT);
	    FILES_WriteString(of1,catname, 0, LEFT);
	    FILES_WriteStr(of1,': BEGIN',FILES_MaxIO, 0, LEFT);
	    FILES_WriteLine(of1, TRUE);
	    FILES_WriteStr(of1,'         result := LSCONVATTR_',FILES_MaxIO, 0, LEFT);
	    FILES_WriteString(of1,recordname, 0, LEFT);
	    FILES_WriteStr(of1,'(rec.',FILES_MaxIO, 0, LEFT);
	    FILES_WriteString(of1,catname, 0, LEFT);
	    FILES_WriteStr(of1,'field^, attr);',FILES_MaxIO, 0, LEFT);
	    FILES_WriteLine(of1, TRUE);
	    FILES_WriteStr(of1,'         END;',FILES_MaxIO, 0, LEFT);
	    FILES_WriteLine(of1, TRUE);
	 END;
      END;
      FILES_WriteStr(of1,'      END;',FILES_MaxIO, 0, LEFT);      
      FILES_WriteLine(of1, TRUE);
      FILES_WriteStr(of1,'   END;',FILES_MaxIO, 0, LEFT);      
      FILES_WriteLine(of1, TRUE);
      FILES_WriteStr(of1,'   LSCONVATTR_AttrToRec := result;',FILES_MaxIO, 0, LEFT);      
      FILES_WriteLine(of1, TRUE);
      FILES_WriteStr(of1,'END {LSCONVATTR_AttrToRec};',FILES_MaxIO, 0, LEFT);
      FILES_WriteLine(of1, TRUE);
      FILES_WriteLine(of1, TRUE);
      FILES_WriteStr(of1,'FUNCTION LSCONVATTR_AttrToBlexRec(CONST catstr: STRING;',FILES_MaxIO, 0, LEFT);
      FILES_WriteLine(of1, TRUE);
      FILES_WriteStr(of1,'                                       catlen: INTEGER;',FILES_MaxIO, 0, LEFT);
      FILES_WriteLine(of1, TRUE);
      FILES_WriteStr(of1,'                                       VAR pattr: LDCONVREC_pAttrStruct;',FILES_MaxIO, 0, LEFT);
      FILES_WriteLine(of1, TRUE);
      FILES_WriteStr(of1,'                                       VAR rec: LSDOMAINT_BlexStruct):',FILES_MaxIO, 0, LEFT);
      FILES_WriteLine(of1, TRUE);
      FILES_WriteStr(of1,'                                       BOOLEAN;',FILES_MaxIO, 0, LEFT);
      FILES_WriteLine(of1, TRUE);
      FILES_WriteStr(of1,'VAR result : BOOLEAN;',FILES_MaxIO, 0, LEFT);
      FILES_WriteLine(of1, TRUE);
      FILES_WriteStr(of1,'    attr   : LDCONVREC_pAttrStruct;',FILES_MaxIO, 0, LEFT);
      FILES_WriteLine(of1, TRUE);
      FILES_WriteStr(of1,'    catli  : LIDOMAINT_syntcat;',FILES_MaxIO, 0, LEFT);
      FILES_WriteLine(of1, TRUE);
      FILES_WriteStr(of1,'BEGIN',FILES_MaxIO, 0, LEFT);
      FILES_WriteLine(of1, TRUE);
      FILES_WriteStr(of1,'   result := LDSTRTOTYPE_Cat(catstr, catlen, catli);',FILES_MaxIO, 0, LEFT);
      FILES_WriteLine(of1, TRUE);
      FILES_WriteStr(of1,'   attr := pattr;',FILES_MaxIO, 0, LEFT);
      FILES_WriteLine(of1, TRUE);
      FILES_WriteStr(of1,'   IF result THEN BEGIN',FILES_MaxIO, 0, LEFT);
      FILES_WriteLine(of1, TRUE);
      FILES_WriteStr(of1,'      rec.cat := LoopHoles.Retype(catli,LSDOMAINT_syntcat);',FILES_MaxIO, 0, LEFT);
      FILES_WriteLine(of1, TRUE);
      FILES_WriteStr(of1,'      CASE rec.cat OF ',FILES_MaxIO, 0, LEFT);
      FILES_WriteLine(of1, TRUE);
      categorytable1 := categorytable;
      WHILE stillcatdefs(categorytable1) DO BEGIN
         takecatdef( catdef1, categorytable1 );
         recordname := catdef1^.recordname;
         catnames   := catdef1^.catnames;
         WHILE stillidents(catnames) and haskey(recordname) DO BEGIN
            takeident(catname, catnames);
            FILES_WriteStr(of1,'      ',FILES_MaxIO, 0, LEFT);
            FILES_WriteString(of1,catname, 0, LEFT);
            FILES_WriteStr(of1,': BEGIN',FILES_MaxIO, 0, LEFT);
            FILES_WriteLine(of1, TRUE);
            FILES_WriteStr(of1,'         result := LSCONVATTR_',FILES_MaxIO, 0, LEFT);
            FILES_WriteString(of1,recordname, 0, LEFT);
            FILES_WriteStr(of1,'(rec.',FILES_MaxIO, 0, LEFT);
            FILES_WriteString(of1,catname, 0, LEFT);
            FILES_WriteStr(of1,'rec, attr);',FILES_MaxIO, 0, LEFT);
            FILES_WriteLine(of1, TRUE);
            FILES_WriteStr(of1,'         END;',FILES_MaxIO, 0, LEFT);
            FILES_WriteLine(of1, TRUE);
         END;
      END;
      FILES_WriteStr(of1,'      END;',FILES_MaxIO, 0, LEFT);      
      FILES_WriteLine(of1, TRUE);
      FILES_WriteStr(of1,'   END;',FILES_MaxIO, 0, LEFT);      
      FILES_WriteLine(of1, TRUE);
      FILES_WriteStr(of1,'   LSCONVATTR_AttrToBlexRec := result;',FILES_MaxIO, 0, LEFT);      
      FILES_WriteLine(of1, TRUE);
      FILES_WriteStr(of1,'END {LSCONVATTR_AttrToBlexRec};',FILES_MaxIO, 0, LEFT);
      FILES_WriteLine(of1, TRUE);
   END {writeimpmod1};


BEGIN {writelsconvattrfunctions}
   writedefmod1(of1);
   writeimpmod1(of2);
END {writelsconvattrfunction};



PROCEDURE writeldconvrecfunction(VAR of2: FILES_text);


   PROCEDURE writeimpmod2(VAR of1: FILES_text);
   VAR
      recordtable1: setofrecords;
      categorytable1: setofcatdefs;
      catdef1       : pcatdef;
      catnames      : SetOfIdents;
      catname       : STRING_String;
      recordname   : STRING_String;
      recordfound  :BOOLEAN;
      record1      : pRecord;
      attribs        :setofattribs;
      attrib        :pattrib;
      attribname    :STRING_string;
   BEGIN
      FILES_WriteStr(of1,'FUNCTION LDCONVREC_CatAttrbs(CONST catstring:STRING_string): LDCONVREC_pAttrStruct;'
                              ,FILES_MaxIO, 0, LEFT);
      FILES_WriteLine(of1, TRUE);
      FILES_WriteStr(of1,' VAR result,p:LDCONVREC_pAttrStruct;',FILES_MaxIO,0,left);
      FILES_WriteLine(of1, TRUE);
      FILES_WriteStr(of1,'BEGIN',FILES_MaxIO,0,left);
      FILES_WriteLine(of1, TRUE);
      FILES_WriteStr(of1,'result:=NIL;',FILES_MaxIO,0,left);
      FILES_WriteLine(of1, TRUE);
      categorytable1:=categorytable;
      WHILE stillcatdefs(categorytable1) DO
        BEGIN
        takecatdef(catdef1,categorytable1);
        recordname := catdef1^.recordname;
        catnames   := catdef1^.catnames;
        recordtable1:=recordtable;
        recordfound:=FALSE;
        WHILE stillrecords(recordtable1) AND NOT(recordfound) DO
	  BEGIN
	  takerecord(record1,recordtable1);
	  IF STRING_compare(record1^.recordname,recordname)=0 THEN 
						recordfound:=TRUE
	  END;
        WHILE stillidents(catnames) DO
          BEGIN
          takeident(catname,catnames);
          FILES_writestr(of1,'IF STRING_comparechars(catstring,''',FILES_MaxIO,0,left);
          FILES_writestring(of1,catname,0,left);
          FILES_writestr(of1,''',STRING_Max)=0 THEN',FILES_MaxIO,0,left);
          FILES_writeline(of1,TRUE);
          FILES_writestr(of1,'  BEGIN',FILES_MaxIO,0,left);
          FILES_writeline(of1,TRUE);
          attribs:=record1^.attribs;
          IF record1^.indexpresent THEN
            BEGIN
            FILES_writestr(of1,'  Mem_NewDefault(LOOPHOLES.SIZEOF(LDCONVREC_AttrStruct), LoopHoles.Retype(p,Mem_Ptr));',FILES_MaxIO,0,left);
            FILES_writeline(of1,TRUE);
            FILES_writestr(of1,'  p^.fieldname.str := ''INDEX'';',FILES_MaxIO,0,left);
            FILES_writeline(of1,TRUE);
            FILES_writestr(of1,'  p^.fieldname.len := 5;',FILES_MaxIO,0,left);
            FILES_writeline(of1,TRUE);
            FILES_writestr(of1,'  p^.nextattr:=result;',FILES_MaxIO,0,left);
            FILES_writeline(of1,TRUE);
            FILES_writestr(of1,'  result:=p;',FILES_MaxIO,0,left);
            FILES_writeline(of1,TRUE);
            END;
          WHILE stillattribs(attribs) DO
            BEGIN
            takeattrib(attrib,attribs);
            attribname:=attrib^.attribname;
            FILES_writestr(of1,'  Mem_NewDefault(LOOPHOLES.SIZEOF(LDCONVREC_AttrStruct), LoopHoles.Retype(p,Mem_Ptr));',FILES_MaxIO,0,left);
            FILES_writeline(of1,TRUE);
            FILES_writestr(of1,'  p^.fieldname.str := ''',FILES_MaxIO,0,left);
            FILES_writestring(of1,attribname,0,left);
            FILES_writestr(of1,''';',FILES_MaxIO,0,left);
            FILES_writeline(of1,TRUE);
            FILES_writestr(of1,'  p^.fieldname.len := ',FILES_MaxIO,0,left);
            FILES_writeinteger(of1,STRING_Length(attribname),0,LEFT);
            FILES_writestr(of1,';',FILES_MaxIO,0,left);
            FILES_writeline(of1,TRUE);
            FILES_writestr(of1,'  p^.nextattr:=result;',FILES_MaxIO,0,left);
            FILES_writeline(of1,TRUE);
            FILES_writestr(of1,'  result:=p;',FILES_MaxIO,0,left);
            FILES_writeline(of1,TRUE);
            END;
          FILES_writestr(of1,'  END;',FILES_MaxIO,0,left);
          FILES_writeline(of1,TRUE);
          END;
        END;
      FILES_WriteLine(of1, TRUE);
      FILES_WriteStr(of1,'LDCONVREC_CatAttrbs:=result',FILES_MaxIO,0,left);
      FILES_WriteLine(of1, TRUE);
      FILES_WriteStr(of1,'END;',FILES_MaxIO,0,left);
      FILES_WriteLine(of1, TRUE);
      FILES_WriteStr(of1,'FUNCTION LDCONVREC_GetAttrbs(s: LISTREE_pStree): LDCONVREC_pAttrStruct;',FILES_MaxIO, 0, LEFT);
      FILES_WriteLine(of1, TRUE);
      FILES_WriteStr(of1,'VAR t: LSSTREE_pStree;',FILES_MaxIO, 0, LEFT);
      FILES_WriteLine(of1, TRUE);
      FILES_WriteStr(of1,'BEGIN',FILES_MaxIO, 0, LEFT);
      FILES_WriteLine(of1, TRUE);
      FILES_WriteStr(of1,'   t := LoopHoles.Retype(s,LSSTREE_pStree);',FILES_MaxIO, 0, LEFT);
      FILES_WriteLine(of1, TRUE);
      FILES_WriteStr(of1,'   CASE t^.cat OF ',FILES_MaxIO, 0, LEFT);
      FILES_WriteLine(of1, TRUE);
      categorytable1 := categorytable;
      WHILE stillcatdefs(categorytable1) DO BEGIN
         takecatdef( catdef1, categorytable1 );
         recordname := catdef1^.recordname;
         catnames   := catdef1^.catnames;
         WHILE stillidents(catnames) DO BEGIN
            takeident(catname, catnames);
            FILES_WriteStr(of1,'   ',FILES_MaxIO, 0, LEFT);
            FILES_WriteString(of1,catname, 0, LEFT);
            FILES_WriteStr(of1,': BEGIN',FILES_MaxIO, 0, LEFT);
            FILES_WriteLine(of1, TRUE);
            FILES_WriteStr(of1,'      LDCONVREC_GetAttrbs := LSCONVREC_',FILES_MaxIO, 0, LEFT);
            FILES_WriteString(of1,recordname, 0, LEFT);
            FILES_WriteStr(of1,'( t^.LS^.',FILES_MaxIO, 0, LEFT);
            FILES_WriteString(of1,catname, 0, LEFT);
            FILES_WriteStr(of1,'field^);',FILES_MaxIO, 0, LEFT);
            FILES_WriteLine(of1, TRUE);
            FILES_WriteStr(of1,'      END;',FILES_MaxIO, 0, LEFT);
            FILES_WriteLine(of1, TRUE);
         END;
      END;
      FILES_WriteStr(of1,'   END;',FILES_MaxIO, 0, LEFT);      
      FILES_WriteLine(of1, TRUE);
      FILES_WriteStr(of1,'END {LDCONVREC_GetAttrbs};',FILES_MaxIO, 0, LEFT);
      FILES_WriteLine(of1, TRUE);
      FILES_WriteLine(of1, TRUE);
      FILES_WriteStr(of1,'FUNCTION LDCONVREC_GetNode(t: LDCONVREC_pAttrStruct;',FILES_MaxIO, 0, LEFT);
      FILES_WriteLine(of1, TRUE);
      FILES_WriteStr(of1,'                                    VAR s: LISTREE_pStree): BOOLEAN;',FILES_MaxIO, 0, LEFT);
      FILES_WriteLine(of1, TRUE);
      FILES_WriteStr(of1,'VAR ls: LSSTREE_pStree;',FILES_MaxIO, 0, LEFT);
      FILES_WriteLine(of1, TRUE);
      FILES_WriteStr(of1,'    catstr: STR_STRING;',FILES_MaxIO, 0, LEFT);
      FILES_WriteLine(of1, TRUE);
      FILES_WriteStr(of1,'    catlen: STR_Range;',FILES_MaxIO, 0, LEFT);
      FILES_WriteLine(of1, TRUE);
      FILES_WriteStr(of1,'    correct: BOOLEAN;',FILES_MaxIO, 0, LEFT);
      FILES_WriteLine(of1, TRUE);
      FILES_WriteStr(of1,'    dummy: LSDOMAINT_LSrecord;',FILES_MaxIO, 0, LEFT);
      FILES_WriteLine(of1, TRUE);
      FILES_WriteStr(of1,'BEGIN',FILES_MaxIO, 0, LEFT);
      FILES_WriteLine(of1, TRUE);
      FILES_WriteStr(of1,'   ls := LoopHoles.Retype(s,LSSTREE_pStree);',FILES_MaxIO, 0, LEFT);
      FILES_WriteLine(of1, TRUE);
      FILES_WriteStr(of1,'   dummy := ls^.LS^;',FILES_MaxIO, 0, LEFT);
      FILES_WriteLine(of1, TRUE);
      FILES_WriteStr(of1,'   LDTYPETOSTR_Cat(catstr, catlen, s^.cat);',FILES_MaxIO, 0, LEFT);
      FILES_WriteLine(of1, TRUE);
      FILES_WriteStr(of1,'   correct := LSCONVATTR_AttrToRec(catstr, catlen, t, dummy);',FILES_MaxIO, 0, LEFT);
      FILES_WriteLine(of1, TRUE);
      FILES_WriteStr(of1,'   IF correct THEN ls^.LS^ := dummy;',FILES_MaxIO, 0, LEFT);
      FILES_WriteLine(of1, TRUE);
      FILES_WriteStr(of1,'   LDCONVREC_GetNode := correct;',FILES_MaxIO, 0, LEFT);
      FILES_WriteLine(of1, TRUE);
      FILES_WriteStr(of1,'END {LDCONVREC_GetNode};',FILES_MaxIO, 0, LEFT);
      FILES_WriteLine(of1, TRUE);
      FILES_WriteLine(of1, TRUE);
   END {writeimpmod2};


BEGIN {writeldconvrecfunction}
   writeimpmod2(of2);
END {writeldconvrecfunction};

procedure writeldcatfunction(var of2:FILES_text);
var 
    categorytable1:setofcatdefs;
    catdef1:pcatdef;
    catnames:setofidents;
    lb, ub,
    firststr,
    laststr,
    str:STRING_string;
    recwithkey : BOOLEAN;

   FUNCTION haskey (recordname:STRING_string): BOOLEAN;
   VAR record1:precord;
       recordtable1:setofrecords;
       recordfound:boolean;
   BEGIN{writeomega}
      recordtable1:=recordtable;
      recordfound:=false;
      haskey := false;
      WHILE stillrecords(recordtable1) and not(recordfound) DO BEGIN
	 takerecord(record1,recordtable1);
	 IF STRING_compare(record1^.recordname,recordname)=0 THEN recordfound:=true
      END;
      IF recordfound THEN BEGIN
	 IF record1^.keypresent THEN haskey := true;
      END
   END;{haskey}

   PROCEDURE catlbub(recordname:STRING_string; VAR lb, ub: STRING_String);
   VAR record1:precord;
       recordtable1:setofrecords;
       recordfound:boolean;
   BEGIN{writeomega}
      recordtable1:=recordtable;
      recordfound:=false;
      WHILE stillrecords(recordtable1) and not(recordfound) DO BEGIN
	 takerecord(record1,recordtable1);
	 IF STRING_compare(record1^.recordname,recordname)=0 THEN recordfound:=true
      END;
      IF recordfound THEN BEGIN
	 IF record1^.keypresent THEN BEGIN
            lb    := record1^.lb;
            ub    := record1^.ub
         END
      END
   END;{catlb}

begin{writeldcat}

   categorytable1:=categorytable;
   IF stillcatdefs(categorytable1) THEN BEGIN
      takecatdef(catdef1,categorytable1);
      catnames:=catdef1^.catnames;
      takeident(firststr,catnames);
      laststr := firststr;
      while stillidents(catnames) do begin
	   takeident(laststr,catnames);
      end
   END;
   while stillcatdefs(categorytable1) do begin
      takecatdef(catdef1,categorytable1);
      catnames:=catdef1^.catnames;
      takeident(laststr,catnames);
      while stillidents(catnames) do begin
	   takeident(laststr,catnames);
      end
   end;

   FILES_WriteStr(of2,'FUNCTION LDCAT_MinCat: LIDOMAINT_SyntCat;', FILES_MaxIO, 0, LEFT);
   FILES_WriteLine(of2, TRUE);
   FILES_WriteStr(of2,'VAR cat : LIDOMAINT_SyntCat;', FILES_MaxIO, 0, LEFT);
   FILES_WriteLine(of2, TRUE);
   FILES_WriteStr(of2,'BEGIN', FILES_MaxIO, 0, LEFT);
   FILES_WriteLine(of2, TRUE);
   FILES_WriteStr(of2,'   LoopHoles.Retype(cat,LSDOMAINT_SyntCat) := ', FILES_MaxIO, 0, LEFT);
   FILES_WriteString(of2,firststr, 0, LEFT);
   FILES_WriteStr(of2,';', FILES_MaxIO, 0, LEFT);
   FILES_WriteLine(of2, TRUE);
   FILES_WriteStr(of2,'   LDCAT_MinCat := cat;', FILES_MaxIO, 0, LEFT);
   FILES_WriteLine(of2, TRUE);
   FILES_WriteStr(of2,'END {LDCAT_MinCat};', FILES_MaxIO, 0, LEFT);
   FILES_WriteLine(of2, TRUE);
   
   FILES_WriteLine(of2, TRUE);
   FILES_WriteStr(of2,'FUNCTION LDCAT_MaxCat: LIDOMAINT_SyntCat;', FILES_MaxIO, 0, LEFT);
   FILES_WriteLine(of2, TRUE);
   FILES_WriteStr(of2,'VAR cat : LIDOMAINT_SyntCat;', FILES_MaxIO, 0, LEFT);
   FILES_WriteLine(of2, TRUE);
   FILES_WriteStr(of2,'BEGIN', FILES_MaxIO, 0, LEFT);
   FILES_WriteLine(of2, TRUE);
   FILES_WriteStr(of2,'    LoopHoles.Retype(cat,LSDOMAINT_SyntCat) := ', FILES_MaxIO, 0, LEFT);
   FILES_WriteString(of2, laststr, 0, LEFT);
   FILES_WriteStr(of2,';', FILES_MaxIO, 0, LEFT);
   FILES_WriteLine(of2, TRUE);
   FILES_WriteStr(of2,'   LDCAT_MaxCat := cat;', FILES_MaxIO, 0, LEFT);
   FILES_WriteLine(of2, TRUE);
   FILES_WriteStr(of2,'END {LDCAT_MaxCat};', FILES_MaxIO, 0, LEFT);
   FILES_WriteLine(of2, TRUE);
   
   FILES_WriteLine(of2, TRUE);
   FILES_WriteStr(of2,'FUNCTION LDCAT_ConvertStrToEnum(', FILES_MaxIO, 0, LEFT);
   FILES_WriteLine(of2, TRUE);
   FILES_WriteStr(of2,'                        VAR Cat     : LIDOMAINT_SyntCat;', FILES_MaxIO, 0, LEFT);
   FILES_WriteLine(of2, TRUE);
   FILES_WriteStr(of2,'                            CatArray: CATDEF_CatArrayType;', FILES_MaxIO, 0, LEFT);
   FILES_WriteLine(of2, TRUE);
   FILES_WriteStr(of2,'                            LenCat  : INTEGER): BOOLEAN;', FILES_MaxIO, 0, LEFT);
   FILES_WriteLine(of2, TRUE);
   FILES_WriteStr(of2,'BEGIN', FILES_MaxIO, 0, LEFT);
   FILES_WriteLine(of2, TRUE);
   FILES_WriteStr(of2,'   LDCAT_ConvertStrToEnum := LDSTRTOTYPE_Cat(CatArray,LenCat,Cat);', FILES_MaxIO, 0, LEFT);
   FILES_WriteLine(of2, TRUE);
   FILES_WriteStr(of2,'END {LDCAT_ConvertStrToEnum};', FILES_MaxIO, 0, LEFT);
   FILES_WriteLine(of2, TRUE);
   
   FILES_WriteLine(of2, TRUE);
   FILES_WriteStr(of2,'PROCEDURE LDCAT_ConvertEnumToStr(', FILES_MaxIO, 0, LEFT);
   FILES_WriteLine(of2, TRUE);
   FILES_WriteStr(of2,'                        VAR CatArray: CATDEF_CatArrayType;', FILES_MaxIO, 0, LEFT);
   FILES_WriteLine(of2, TRUE);
   FILES_WriteStr(of2,'                        VAR LenCat  : INTEGER;', FILES_MaxIO, 0, LEFT);
   FILES_WriteLine(of2, TRUE);
   FILES_WriteStr(of2,'                            Cat     : LIDOMAINT_SyntCat);', FILES_MaxIO, 0, LEFT);
   FILES_WriteLine(of2, TRUE);
   FILES_WriteStr(of2,'BEGIN', FILES_MaxIO, 0, LEFT);
   FILES_WriteLine(of2, TRUE);
   FILES_WriteStr(of2,'   LDTYPETOSTR_Cat(CatArray,LenCat,Cat);', FILES_MaxIO, 0, LEFT);
   FILES_WriteLine(of2, TRUE);
   FILES_WriteStr(of2,'END {LDCAT_ConvertEnumToStr};', FILES_MaxIO, 0, LEFT);
   FILES_WriteLine(of2, TRUE);
   
   FILES_WriteLine(of2, TRUE);
   FILES_WriteStr(of2,'PROCEDURE LDCAT_LbUb(Cat: LIDOMAINT_SyntCat;', FILES_MaxIO, 0, LEFT);
   FILES_WriteLine(of2, TRUE);
   FILES_WriteStr(of2,'                              VAR lb, ub: INTEGER);', FILES_MaxIO, 0, LEFT);
   FILES_WriteLine(of2, TRUE);
   FILES_WriteStr(of2,'BEGIN', FILES_MaxIO, 0, LEFT);
   FILES_WriteLine(of2, TRUE);
   FILES_WriteStr(of2,'   CASE  LoopHoles.Retype(Cat,LSDOMAINT_SyntCat) OF', FILES_MaxIO, 0, LEFT);
   FILES_WriteLine(of2, TRUE);
   categorytable1:=categorytable;
   while stillcatdefs(categorytable1) do begin
      takecatdef(catdef1,categorytable1);
      catnames:=catdef1^.catnames;
      IF haskey(catdef1^.recordname) THEN BEGIN
         recwithkey := TRUE;
         catlbub(catdef1^.recordname, lb, ub)
         END
      ELSE BEGIN
         recwithkey := FALSE
      END;
      while stillidents(catnames) and recwithkey do begin
	   takeident(str,catnames);
           FILES_WriteStr(of2,'   ', FILES_MaxIO, 0, LEFT);
           FILES_WriteString(of2,str, 0, LEFT);
           FILES_WriteStr(of2,': BEGIN lb:=', FILES_MaxIO, 0, LEFT);
           FILES_WriteString(of2,lb, 0, LEFT);
           FILES_WriteStr(of2,'; ub:=', FILES_MaxIO, 0, LEFT);
           FILES_WriteString(of2,ub, 0, LEFT);
           FILES_WriteStr(of2,' END;', FILES_MaxIO, 0, LEFT);
           FILES_WriteLine(of2, TRUE);
      end
   end;
   FILES_WriteStr(of2,'   END', FILES_MaxIO, 0, LEFT);
   FILES_WriteLine(of2, TRUE);
   FILES_WriteStr(of2,'END {LDCAT_LbUb};', FILES_MaxIO, 0, LEFT);
   FILES_WriteLine(of2, TRUE);

end {WRITELDCATFUNCTION};


BEGIN {DOMCOMRULES_writeresults}



(*-------------------------------------------------------------------------*
 * Code generation part
 *-------------------------------------------------------------------------*)


(*-------------------------------------------------------------------------*
 * Domain definitions: The module LSDOMAINT for the specified language
 *-------------------------------------------------------------------------*)
FILES_Open(of1,'domainenv',10,3);
FILES_WriteStr(of1,'PACKAGE LSDOMAINT;',
               FILES_maxIO,0,left);
FILES_WriteLine(of1,true);
writeconstants(of1);
writetypes(of1);
FILES_WriteStr(of1,'END{LSDOMAINT};',FILES_maxIO,0,left);
FILES_Close(of1);

(*-------------------------------------------------------------------------*
 * Domain definitions: The module LSMORFDEF for the specified language
 *-------------------------------------------------------------------------*)
FILES_Open(morfdef1,'morfdefenv',10,3);
FILES_WriteStr(morfdef1,'PACKAGE LSMORFDEF;',
               FILES_maxIO,0,left);
FILES_WriteLine(morfdef1,true);
FILES_WriteStr(morfdef1,'TYPE', FILES_maxIO,0,left);
FILES_WriteLine(morfdef1,true);
writemorfdeftypes(morfdef1);
FILES_WriteStr(morfdef1,'END{LSMORFDEF};',FILES_maxIO,0,left);
FILES_Close(morfdef1);

(*-------------------------------------------------------------------------*
 * Conversion functions: The module LDSTRTOTYPE ( Only implementation module)
 *-------------------------------------------------------------------------*)
FILES_Open(convof2,'convpas',7,3);

files_writestr(convof2,'Export(LDSTRTOTYPE);',files_maxio,0,left);
files_writeline(convof2,true);
files_writestr(convof2,'pragma c_include(''ldstrtotype.pf'');',
               files_maxio,0,left);
files_writeline(convof2,true);
files_writestr(convof2,'pragma c_include(''str.pf'');',
               files_maxio,0,left);
files_writeline(convof2,true);
files_writestr(convof2,'pragma c_include(''limorfdef.pf'');',
               files_maxio,0,left);
files_writeline(convof2,true);
files_writestr(convof2,'pragma c_include(''lsdomaint.pf'');',
               files_maxio,0,left);
files_writeline(convof2,true);
files_writestr(convof2,'pragma c_include(''lidomaint.pf'');',
               files_maxio,0,left);

FILES_WriteLine(convof2,true);
FILES_WriteLine(convof2,true);
FILES_WriteStr(convof2,'PROGRAM LDSTRTOTYPE;',
               FILES_maxIO,0,left);
FILES_WriteLine(convof2,true);
FILES_WriteLine(convof2,true);
FILES_WriteStr(convof2,'WITH STR,',
               FILES_maxIO,0,left);
FILES_WriteLine(convof2,true);
FILES_WriteStr(convof2,'     LIMORFDEF,',
               FILES_maxIO,0,left);
FILES_WriteLine(convof2,true);
FILES_WriteStr(convof2,'     LSDOMAINT,',
               FILES_maxIO,0,left);
FILES_WriteLine(convof2,true);
FILES_WriteStr(convof2,'     LIDOMAINT;',
               FILES_maxIO,0,left);
FILES_WriteLine(convof2,true);
FILES_WriteLine(convof2,true);

writeconvfunctions(convof2);

FILES_Close(convof2);

(*-------------------------------------------------------------------------*
 * Conversion functions: The module LDTYPETOSTR ( Only implementation module)
 *-------------------------------------------------------------------------*)

FILES_Open(convof3,'convtypepas',11,3);

files_writestr(convof3,'pragma c_include(''strings.pf'');',
               files_maxio,0,left);
files_writeline(convof3,true);
FILES_WriteStr(convof3,'Export(LDTYPETOSTR);',FILES_maxIO,0,left);
files_writeline(convof3,true);
files_writestr(convof3,'pragma c_include(''str.pf'');',
               files_maxio,0,left);
files_writeline(convof3,true);
files_writestr(convof3,'pragma c_include(''lsdomaint.pf'');',
               files_maxio,0,left);
files_writeline(convof3,true);
files_writestr(convof3,' pragma c_include(''limorfdef.pf'');',
               files_maxio,0,left);
files_writeline(convof3,true);
files_writestr(convof3,'pragma c_include(''lidomaint.pf'');',
               files_maxio,0,left);
files_writeline(convof3,true);
files_writestr(convof3,'pragma c_include(''ldtypetostr.pf'');',
               files_maxio,0,left);

FILES_WriteLine(convof3,true);
FILES_WriteLine(convof3,true);
FILES_WriteStr(convof3,'PROGRAM LDTYPETOSTR;',
               FILES_maxIO,0,left);
FILES_WriteLine(convof3,true);
FILES_WriteStr(convof3,'WITH STR,',
               FILES_maxIO,0,left);
FILES_WriteLine(convof3,true);
FILES_WriteStr(convof3,'     LSDOMAINT,',FILES_maxIO,0,left);
FILES_WriteLine(convof3,true);
FILES_WriteStr(convof3,'     STRINGS,',FILES_maxIO,0,left);
FILES_WriteLine(convof3,true);
FILES_WriteStr(convof3,'     LIMORFDEF,',
               FILES_maxIO,0,left);
FILES_WriteLine(convof3,true);
FILES_WriteStr(convof3,'     LIDOMAINT;',
               FILES_maxIO,0,left);
FILES_WriteLine(convof3,true);
FILES_WriteLine(convof3,true);

writetypeconvfunctions(convof3);

FILES_Close(convof3);

(*-------------------------------------------------------------------------*
 * Conversion functions: The module LDGETKEY ( Only implementation module)
 *-------------------------------------------------------------------------*)


FILES_Open(convof4,'getkeypas',9,3);


files_writestr(convof4,'pragma c_include(''strings.pf'');',
               files_maxio,0,left);
files_writeline(convof4,true);
FILES_WriteStr(convof4,'Export(LDGETKEY);',
               FILES_maxIO,0,left);
FILES_WriteLine(convof4,true);files_writestr(convof4,'pragma c_include(''listree.pf'');',
               files_maxio,0,left);
files_writeline(convof4,true);
files_writestr(convof4,'pragma c_include(''lsstree.pf'');',files_maxio,0,left);
files_writeline(convof4,true);
files_writestr(convof4,'pragma c_include(''lsdomaint.pf'');',files_maxio,0,left);
FILES_WriteLine(convof4,true);
files_writestr(convof4,'pragma c_include(''ldgetkey.pf'');',
               files_maxio,0,left);
files_writeline(convof4,true);
files_writeline(convof4,true);

FILES_WriteStr(convof4,'WITH STRINGS,',
               FILES_maxIO,0,left);
FILES_WriteLine(convof4,true);
FILES_WriteStr(convof4,'     LISTREE,',
               FILES_maxIO,0,left);
FILES_WriteLine(convof4,true);
FILES_WriteStr(convof4,'     LSSTREE,',FILES_maxIO,0,left);
FILES_WriteLine(convof4,true);
FILES_WriteStr(convof4,'     LSDOMAINT;',FILES_maxIO,0,left);
FILES_WriteLine(convof4,true);
FILES_WriteLine(convof4,true);
FILES_WriteStr(convof4,'PROGRAM LDGETKEY;',
               FILES_maxIO,0,left);
FILES_WriteLine(convof4,true);

writeldgetkeyfunction(convof4);

FILES_Close(convof4);

(*-------------------------------------------------------------------------*
 * Conversion functions: The module LDSTRTOSTR ( Only implementation module)
 *-------------------------------------------------------------------------*)

{write cat string to record type string conversion functions:}
FILES_Open(donvof1,'donvpas',7,3);

{only implementation module}
FILES_WriteStr(donvof1,'pragma C_include(''strings.pf'');',
               FILES_maxIO,0,left);
FILES_WriteLine(donvof1,true);
FILES_WriteStr(donvof1,'Export(ldstrtostr);',
               FILES_maxIO,0,left);
FILES_WriteLine(donvof1,true);
FILES_WriteStr(donvof1,'pragma C_include(''string.pf'');',
               FILES_maxIO,0,left);
FILES_WriteLine(donvof1,true);
FILES_WriteStr(donvof1,'pragma C_include(''ldstrtostr.pf'');',
               FILES_maxIO,0,left);
FILES_WriteLine(donvof1,true);
FILES_WriteStr(donvof1,'PROGRAM LDSTRTOSTR;',
               FILES_maxIO,0,left);
FILES_WriteLine(donvof1,true);
FILES_WriteStr(donvof1,'WITH STRNG, STRINGS;',
               FILES_maxIO,0,left);
FILES_WriteLine(donvof1,true);

writedonvfunctions(donvof1);

FILES_Close(donvof1);



(*-------------------------------------------------------------------------*
 * Language specific conversion functions: The module LSTYPETOSTR
 *-------------------------------------------------------------------------*)

FILES_Open(lsconvof1,'lsconvenv',10,3);
FILES_Open(lsconvof2,'lsconvpas',10,3);

FILES_WriteStr(lsconvof1,'pragma C_include(''strings.pf'');',
               FILES_maxIO,0,left);
FILES_WriteLine(lsconvof1,true);
FILES_WriteStr(lsconvof1,'pragma C_include(''lsdomaint.pf'');',FILES_maxIO,0,left);
FILES_WriteLine(lsconvof1,true);
FILES_WriteStr(lsconvof1,'pragma C_include(''str.pf'');',
               FILES_maxIO,0,left);
FILES_WriteLine(lsconvof1,true);
FILES_WriteLine(lsconvof1,true);
FILES_WriteStr(lsconvof1,'PACKAGE LSTYPETOSTR;',
               FILES_maxIO,0,left);
FILES_WriteLine(lsconvof1,true);
FILES_WriteStr(lsconvof1,'WITH LSDOMAINT, STR, STRINGS;',FILES_maxIO,0,left);
FILES_WriteLine(lsconvof1,true);
FILES_WriteLine(lsconvof1,true);

FILES_WriteStr(lsconvof2,'pragma C_include(''strings.pf'');',
               FILES_maxIO,0,left);
FILES_WriteLine(lsconvof2,true);
FILES_WriteStr(lsconvof2,'Export(LSTYPETOSTR);',FILES_maxIO,0,left);
FILES_WriteLine(lsconvof2,true);
FILES_WriteStr(lsconvof2,'pragma C_include(''lsdomaint.pf'');',FILES_maxIO,0,left);
FILES_WriteLine(lsconvof2,true);
FILES_WriteStr(lsconvof2,'pragma C_include(''str.pf'');',
               FILES_maxIO,0,left);
FILES_WriteLine(lsconvof2,true);
FILES_WriteStr(lsconvof2,'pragma C_include(''ldstrtotype.pf'');',FILES_maxIO,0,left);
FILES_WriteLine(lsconvof2,true);
FILES_WriteStr(lsconvof2,'pragma C_include(''lstypetostr.pf'');',FILES_maxIO,0,left);
FILES_WriteLine(lsconvof2,true);
FILES_WriteLine(lsconvof2,true);

FILES_WriteStr(lsconvof2,'PROGRAM LSTYPETOSTR;',
               FILES_maxIO,0,left);
FILES_WriteLine(lsconvof2,true);
FILES_WriteLine(lsconvof2,true);

FILES_WriteStr(lsconvof2,'WITH LSDOMAINT, STR, STRINGS, LDSTRTOTYPE;',FILES_maxIO,0,left);
FILES_WriteLine(lsconvof2,true);
FILES_WriteLine(lsconvof2,true);

writelstypeconvfunctions(lsconvof1,lsconvof2);
FILES_WriteStr(lsconvof1,'END{LSTYPETOSTR};',FILES_maxIO,0,left);
FILES_Close(lsconvof1);
FILES_Close(lsconvof2);

(*-------------------------------------------------------------------------*
 * Language specific conversion functions: The module LSSTRTOTYPE
 *-------------------------------------------------------------------------*)

FILES_Open(lsconvof3,'lsstrtypeenv',12,3);
FILES_Open(lsconvof4,'lsstrtypepas',12,3);

FILES_WriteStr(lsconvof3,'pragma C_include(''strings.pf'');',
               FILES_maxIO,0,left);
FILES_WriteLine(lsconvof3,true);
FILES_WriteStr(lsconvof3,'pragma C_include(''lsdomaint.pf'');',FILES_maxIO,0,left);
FILES_WriteLine(lsconvof3,true);
FILES_WriteStr(lsconvof3,'pragma C_include(''str.pf'');',
               FILES_maxIO,0,left);
FILES_WriteLine(lsconvof3,true);
FILES_WriteLine(lsconvof3,true);
FILES_WriteStr(lsconvof3,'PACKAGE LSSTRTOTYPE;',
               FILES_maxIO,0,left);
FILES_WriteLine(lsconvof3,true);
FILES_WriteStr(lsconvof3,'WITH LSDOMAINT, STR, STRINGS;',FILES_maxIO,0,left);
FILES_WriteLine(lsconvof3,true);
FILES_WriteLine(lsconvof3,true);

FILES_WriteStr(lsconvof4,'pragma C_include(''strings.pf'');',
               FILES_maxIO,0,left);
FILES_WriteLine(lsconvof4,true);
FILES_WriteStr(lsconvof4,'Export(LSSTRTOTYPE);',FILES_maxIO,0,left);
FILES_WriteLine(lsconvof4,true);
FILES_WriteStr(lsconvof4,'pragma C_include(''lsdomaint.pf'');',FILES_maxIO,0,left);
FILES_WriteLine(lsconvof4,true);
FILES_WriteStr(lsconvof4,'pragma C_include(''str.pf'');',
               FILES_maxIO,0,left);
FILES_WriteLine(lsconvof4,true);
FILES_WriteStr(lsconvof4,'pragma C_include(''lsstrtotype.pf'');',FILES_maxIO,0,left);
FILES_WriteLine(lsconvof4,true);
FILES_WriteLine(lsconvof4,true);

FILES_WriteStr(lsconvof4,'PROGRAM LSSTRTOTYPE;',
               FILES_maxIO,0,left);
FILES_WriteLine(lsconvof4,true);
FILES_WriteLine(lsconvof4,true);

FILES_WriteStr(lsconvof4,'WITH LSDOMAINT, STR, STRINGS;',FILES_maxIO,0,left);
FILES_WriteLine(lsconvof4,true);
FILES_WriteLine(lsconvof4,true);

writelsstrconvfunctions(lsconvof3,lsconvof4);
FILES_WriteStr(lsconvof3,'END{LSSTRTOTYPE};',FILES_maxIO,0,left);
FILES_Close(lsconvof3);
FILES_Close(lsconvof4);

(*-------------------------------------------------------------------------*
 * Language specific record conversion functions: The module LSCONVREC
 *-------------------------------------------------------------------------*)

FILES_Open(lsconvof3,'lsconvrecenv',13,3);
FILES_Open(lsconvof4,'lsconvrecpas',13,3);

FILES_WriteStr(lsconvof3,'pragma C_include(''lsdomaint.pf'');',FILES_maxIO,0,left);
FILES_WriteLine(lsconvof3,true);
FILES_WriteStr(lsconvof3,'pragma C_include(''ldconvrec.pf'');',
               FILES_maxIO,0,left);
FILES_WriteLine(lsconvof3,true);
FILES_WriteLine(lsconvof3,true);
FILES_WriteStr(lsconvof3,'PACKAGE LSCONVREC;',
               FILES_maxIO,0,left);
FILES_WriteLine(lsconvof3,true);
FILES_WriteStr(lsconvof3,'WITH LSDOMAINT, LDCONVREC;',FILES_maxIO,0,left);
FILES_WriteLine(lsconvof3,true);
FILES_WriteLine(lsconvof3,true);

FILES_WriteStr(lsconvof4,'Export(LSCONVREC);',FILES_maxIO,0,left);
FILES_WriteLine(lsconvof4,true);
FILES_WriteStr(lsconvof4,'pragma C_include(''lsdomaint.pf'');',FILES_maxIO,0,left);
FILES_WriteLine(lsconvof4,true);
FILES_WriteStr(lsconvof4,'pragma C_include(''lstypetostr.pf'');',FILES_maxIO,0,left);
FILES_WriteLine(lsconvof4,true);
FILES_WriteStr(lsconvof4,'pragma C_include(''ldconvrec.pf'');',
               FILES_maxIO,0,left);
FILES_WriteLine(lsconvof4,true);
FILES_WriteStr(lsconvof4,'pragma C_include(''str.pf'');',
               FILES_maxIO,0,left);
FILES_WriteLine(lsconvof4,true);
FILES_WriteStr(lsconvof4,'pragma C_include(''mem.pf'');',
               FILES_maxIO,0,left);
FILES_WriteLine(lsconvof4,true);
FILES_WriteStr(lsconvof4,'pragma C_include(''lsconvrec.pf'');',FILES_maxIO,0,left);
FILES_WriteLine(lsconvof4,true);
FILES_WriteLine(lsconvof4,true);

FILES_WriteLine(lsconvof4,true);
FILES_WriteStr(lsconvof4,'PROGRAM LSCONVREC;',
               FILES_maxIO,0,left);
FILES_WriteLine(lsconvof4,true);
FILES_WriteStr(lsconvof4,'WITH LSDOMAINT, LSTYPETOSTR, STR, MEM, LDCONVREC;',
                          FILES_maxIO,0,left);
FILES_WriteLine(lsconvof4,true);

writelsconvrecfunctions(lsconvof3,lsconvof4);
FILES_WriteStr(lsconvof3,'END{LSCONVREC};',FILES_maxIO,0,left);
FILES_Close(lsconvof3);
FILES_Close(lsconvof4);

(*-------------------------------------------------------------------------*
 * Language specific record conversion functions: The module LSCONVATTR
 *-------------------------------------------------------------------------*)


FILES_Open(lsconvof3,'lsconvattrenv',13,3);
FILES_Open(lsconvof4,'lsconvattrpas',13,3);

FILES_WriteStr(lsconvof3,'pragma C_include(''strings.pf'');',
               FILES_maxIO,0,left);
FILES_WriteLine(lsconvof3,true);
FILES_WriteStr(lsconvof3,'pragma C_include(''lsdomaint.pf'');',FILES_maxIO,0,left);
FILES_WriteLine(lsconvof3,true);
FILES_WriteStr(lsconvof3,'pragma C_include(''ldconvrec.pf'');',
               FILES_maxIO,0,left);
FILES_WriteLine(lsconvof3,true);
FILES_WriteLine(lsconvof3,true);
FILES_WriteStr(lsconvof3,'PACKAGE LSCONVATTR;',FILES_maxIO,0,left);
FILES_WriteLine(lsconvof3,true);
FILES_WriteStr(lsconvof3,'WITH STRINGS,LSDOMAINT, LDCONVREC;',FILES_maxIO,0,left);
FILES_WriteLine(lsconvof3,true);
FILES_WriteLine(lsconvof3,true);


FILES_WriteStr(lsconvof4,'pragma C_include(''strings.pf'');',
               FILES_maxIO,0,left);
FILES_WriteLine(lsconvof4,true);
FILES_WriteStr(lsconvof4,'Export(LSCONVATTR);',FILES_maxIO,0,left);
FILES_WriteLine(lsconvof4,true);
FILES_WriteStr(lsconvof4,'pragma C_include(''lsdomaint.pf'');',FILES_maxIO,0,left);
FILES_WriteLine(lsconvof4,true);
FILES_WriteStr(lsconvof4,'pragma C_include(''lsstrtotype.pf'');',FILES_maxIO,0,left);
FILES_WriteLine(lsconvof4,true);
FILES_WriteStr(lsconvof4,'pragma C_include(''ldstrtotype.pf'');',FILES_maxIO,0,left);
FILES_WriteLine(lsconvof4,true);
FILES_WriteStr(lsconvof4,'pragma C_include(''maket.pf'');',FILES_maxIO,0,left);
FILES_WriteLine(lsconvof4,true);
FILES_WriteStr(lsconvof4,'pragma C_include(''ldconvrec.pf'');',
               FILES_maxIO,0,left);
FILES_WriteLine(lsconvof4,true);
FILES_WriteStr(lsconvof4,'pragma C_include(''str.pf'');',
               FILES_maxIO,0,left);
FILES_WriteLine(lsconvof4,true);
FILES_WriteStr(lsconvof4,'pragma C_include(''lidomaint.pf'');',
               FILES_maxIO,0,left);
FILES_WriteLine(lsconvof4,true);
FILES_WriteStr(lsconvof4,'pragma C_include(''lsconvattr.pf'');',FILES_maxIO,0,left);
FILES_WriteLine(lsconvof4,true);
FILES_WriteLine(lsconvof4,true);

FILES_WriteLine(lsconvof4,true);
FILES_WriteStr(lsconvof4,'PROGRAM LSCONVATTR;',
               FILES_maxIO,0,left);
FILES_WriteLine(lsconvof4,true);
FILES_WriteStr(lsconvof4,'WITH LSDOMAINT,MAKET,STRINGS,LSSTRTOTYPE,STR,LIDOMAINT,LDCONVREC,',
                          FILES_maxIO,0,left);
FILES_WriteLine(lsconvof4,true);
FILES_WriteStr(lsconvof4,'   LDSTRTOTYPE;', FILES_maxIO,0,left);
FILES_WriteLine(lsconvof4,true);

writeLSCONVATTRfunctions(lsconvof3,lsconvof4);
FILES_WriteStr(lsconvof3,'END{LSCONVATTR};',FILES_maxIO,0,left);
FILES_Close(lsconvof3);
FILES_Close(lsconvof4);

(*-------------------------------------------------------------------------*
 * Language dependent record conversion function: The module LDCONVREC
 *-------------------------------------------------------------------------*)
{@@@@@@@@@@@@@@@@}
FILES_Open(ldconvof4,'ldconvrecpas',13,3);

FILES_WriteStr(ldconvof4,'pragma C_include(''strings.pf'');',
               FILES_maxIO,0,left);
FILES_WriteLine(ldconvof4,true);
FILES_WriteStr(ldconvof4,'Export(LDCONVREC);',FILES_maxIO,0,left);
FILES_WriteLine(ldconvof4,true);
FILES_WriteStr(ldconvof4,'pragma C_include(''lsdomaint.pf'');',FILES_maxIO,0,left);
FILES_WriteLine(ldconvof4,true);
FILES_WriteStr(ldconvof4,'pragma C_include(''lsstree.pf'');',FILES_maxIO,0,left);
FILES_WriteLine(ldconvof4,true);
FILES_WriteStr(ldconvof4,'pragma C_include(''lsconvrec.pf'');',FILES_maxIO,0,left);
FILES_WriteLine(ldconvof4,true);
FILES_WriteStr(ldconvof4,'pragma C_include(''lsconvattr.pf'');',FILES_maxIO,0,left);
FILES_WriteLine(ldconvof4,true);
FILES_WriteStr(ldconvof4,'pragma C_include(''string.pf'');',
               FILES_maxIO,0,left);
FILES_WriteLine(ldconvof4,true);
FILES_WriteStr(ldconvof4,'pragma C_include(''str.pf'');',
               FILES_maxIO,0,left);
FILES_WriteLine(ldconvof4,true);
FILES_WriteStr(ldconvof4,'pragma C_include(''mem.pf'');',
               FILES_maxIO,0,left);
FILES_WriteLine(ldconvof4,true);
FILES_WriteStr(ldconvof4,'pragma C_include(''listree.pf'');',
               FILES_maxIO,0,left);
FILES_WriteLine(ldconvof4,true);
FILES_WriteStr(ldconvof4,'pragma C_include(''ldtypetostr.pf'');',
               FILES_maxIO,0,left);
FILES_WriteLine(ldconvof4,true);
FILES_WriteStr(ldconvof4,'pragma C_include(''ldconvrec.pf'');',
               FILES_maxIO,0,left);
FILES_WriteLine(ldconvof4,true);
FILES_WriteLine(ldconvof4,true);

FILES_WriteLine(ldconvof4,true);
FILES_WriteStr(ldconvof4,'PROGRAM LDCONVREC;',
               FILES_maxIO,0,left);
FILES_WriteLine(ldconvof4,true);
FILES_WriteStr(ldconvof4,'WITH LSDOMAINT,LSSTREE,LSCONVREC,LSCONVATTR,STR,STRINGS,LDTYPETOSTR,STRNG,MEM,',
                          FILES_maxIO,0,left);
FILES_WriteLine(ldconvof4,true);
FILES_WriteStr(ldconvof4,'LISTREE;',
                          FILES_maxIO,0,left);
FILES_WriteLine(ldconvof4,true);

writeldconvrecfunction(ldconvof4);
FILES_Close(ldconvof4);

(*-------------------------------------------------------------------------*
 * Language dependent BLEX editor function: The module LDCAT
 *-------------------------------------------------------------------------*)

FILES_Open(ldcat1,'ldcatpas',9,3);

FILES_WriteStr(ldcat1,'[INHERIT(',FILES_maxIO,0,left);
FILES_WriteStr(ldcat1,'''LANGUAGE:LSDOMAINT'',',FILES_maxIO,0,left);
FILES_WriteLine(ldcat1,true);
FILES_WriteStr(ldcat1,'         ''GENERAL:LIDOMAINT'',',
               FILES_maxIO,0,left);
FILES_WriteLine(ldcat1,true);
FILES_WriteStr(ldcat1,'         ''LEXICON:CATDEF'',',
               FILES_maxIO,0,left);
FILES_WriteLine(ldcat1,true);
FILES_WriteStr(ldcat1,'         ''GENERAL:LDSTRTOTYPE'',',
               FILES_maxIO,0,left);
FILES_WriteLine(ldcat1,true);
FILES_WriteStr(ldcat1,'         ''GENERAL:LDTYPETOSTR'')]',
               FILES_maxIO,0,left);
FILES_WriteLine(ldcat1,true);
FILES_WriteLine(ldcat1,true);
FILES_WriteStr(ldcat1,'MODULE LDCAT;',
               FILES_maxIO,0,left);
FILES_WriteLine(ldcat1,true);
FILES_WriteLine(ldcat1,true);

writeldcatfunction(ldcat1);
FILES_WriteStr(ldcat1,'END{LDCAT}.',FILES_maxIO,0,left);
FILES_Close(ldcat1);

(*-------------------------------------------------------------------------*
 * "Make" modules: The module MAKET
 *-------------------------------------------------------------------------*)

FILES_Open(mof1,'makeenv',7,3);
FILES_Open(mof2,'makepas',7,3);
FILES_WriteStr(mof1,'pragma C_include(''lsdomaint.pf'');',FILES_maxIO,0,left);
FILES_WriteLine(mof1,true);
FILES_WriteStr(mof1,'pragma C_include(''lsstree.pf'');',FILES_maxIO,0,left);
FILES_WriteLine(mof1,true);
FILES_WriteStr(mof1,'pragma C_include(''lidomaint.pf'');',
               FILES_maxIO,0,left);
FILES_WriteLine(mof1,true);
FILES_WriteLine(mof1,true);
FILES_WriteStr(mof1,'PACKAGE MAKET;',
               FILES_maxIO,0,left);
FILES_WriteLine(mof1,true);
FILES_WriteStr(mof1,'WITH LSDOMAINT, LIDOMAINT, LSSTREE;',FILES_maxIO,0,left);
FILES_WriteLine(mof1,true);
FILES_WriteLine(mof1,true);

FILES_WriteStr(mof2,'Export(MAKET);',FILES_maxIO,0,left);
FILES_WriteLine(mof2,true);
FILES_WriteStr(mof2,'pragma C_include(''lsdomaint.pf'');',FILES_maxIO,0,left);
FILES_WriteLine(mof2,true);
FILES_WriteStr(mof2,'pragma C_include(''lsstree.pf'');',FILES_maxIO,0,left);
FILES_WriteLine(mof2,true);
FILES_WriteStr(mof2,'pragma C_include(''lidomaint.pf'');',
               FILES_maxIO,0,left);
FILES_WriteLine(mof2,true);
FILES_WriteStr(mof2,'pragma C_include(''listree.pf'');',
               FILES_maxIO,0,left);
FILES_WriteLine(mof2,true);
FILES_WriteStr(mof2,'pragma C_include(''mem.pf'');',
               FILES_maxIO,0,left);
FILES_WriteLine(mof2,true);
FILES_WriteStr(mof2,'pragma C_include(''maket.pf'');',FILES_maxIO,0,left);
FILES_WriteLine(mof2,true);
FILES_WriteLine(mof2,true);

FILES_WriteLine(mof2,true);
FILES_WriteStr(mof2,'PROGRAM MAKET;',
               FILES_maxIO,0,left);
FILES_WriteLine(mof2,true);
FILES_WriteStr(mof2,'WITH LSDOMAINT, LSSTREE, LIDOMAINT, MEM, LISTREE;',
                          FILES_maxIO,0,left);
FILES_WriteLine(mof2,true);


writemakefunctions(mof1,mof2);
FILES_WriteStr(mof1,'END{MAKET};',FILES_maxIO,0,left);
FILES_Close(mof1);
FILES_Close(mof2);

{write characteristic functions for sets of categories:}
FILES_open(catsetsof1,'catsetspas',10,3);

FILES_WriteStr(catsetsof1,'Export(LDCATSETS);',FILES_maxIO,0,left);
FILES_WriteLine(catsetsof1,true);
FILES_WriteStr(catsetsof1,'pragma C_include(''lidomaint.pf'');',
               FILES_maxIO,0,left);
FILES_WriteLine(catsetsof1,true);
FILES_WriteStr(catsetsof1,'pragma C_include(''ldcatsets.pf'');',
               FILES_maxIO,0,left);
FILES_WriteLine(catsetsof1,true);
FILES_WriteStr(catsetsof1,'PROGRAM LDCATSETS;',
               FILES_maxIO,0,left);
FILES_WriteLine(catsetsof1,true);
FILES_WriteStr(catsetsof1,'WITH LIDOMAINT;',
                          FILES_maxIO,0,left);
FILES_WriteLine(catsetsof1,true);
writecatsetsfunctions(catsetsof1);
FILES_Close(catsetsof1);

{write functions for equality :}
FILES_open(equalof1,'equalpas',10,3);
FILES_WriteStr(equalof1,'Export(LDEQUAL);',FILES_maxIO,0,left);
FILES_WriteLine(equalof1,true);
FILES_WriteStr(equalof1,'pragma C_include(''lsdomaint.pf'');',FILES_maxIO,0,left);
FILES_WriteLine(equalof1,true);
FILES_WriteStr(equalof1,'pragma C_include(''lsstree.pf'');',FILES_maxIO,0,left);
FILES_WriteLine(equalof1,true);
FILES_WriteStr(equalof1,'pragma C_include(''listree.pf'');',
               FILES_maxIO,0,left);
FILES_WriteLine(equalof1,true);
FILES_WriteStr(equalof1,'pragma C_include(''ldequal.pf'');',
               FILES_maxIO,0,left);
FILES_WriteLine(equalof1,true);
FILES_WriteLine(equalof1,true);

FILES_WriteStr(equalof1,'PROGRAM LDEQUAL;',
               FILES_maxIO,0,left);
FILES_WriteLine(equalof1,true);
FILES_WriteStr(equalof1,'WITH LSDOMAINT,LSSTREE,LISTREE;',
               FILES_maxIO,0,left);
FILES_WriteLine(equalof1,true);
writeequalfunctions(equalof1);
FILES_Close(equalof1);

{write copy functions:}
FILES_Open(cof1,'copyenv',7,3);
FILES_Open(cof2,'copypas',7,3);

FILES_WriteStr(cof1,'pragma C_include(''lsdomaint.pf'');',FILES_maxIO,0,left);
FILES_WriteLine(cof1,true);
FILES_WriteLine(cof1,true);
FILES_WriteStr(cof1,'PACKAGE COPYT;',
               FILES_maxIO,0,left);
FILES_WriteLine(cof1,true);
FILES_WriteStr(cof1,'WITH LSDOMAINT;',FILES_maxIO,0,left);
FILES_WriteLine(cof1,true);
FILES_WriteLine(cof1,true);

FILES_WriteStr(cof2,'Export(COPYT);',FILES_maxIO,0,left);
FILES_WriteLine(cof2,true);
FILES_WriteStr(cof2,'pragma C_include(''lsdomaint.pf'');',FILES_maxIO,0,left);
FILES_WriteLine(cof2,true);
FILES_WriteStr(cof2,'pragma C_include(''copyt.pf'');',FILES_maxIO,0,left);
FILES_WriteLine(cof2,true);
FILES_WriteLine(cof2,true);

FILES_WriteLine(cof2,true);
FILES_WriteStr(cof2,'PROGRAM COPYT;',
               FILES_maxIO,0,left);
FILES_WriteLine(cof2,true);
FILES_WriteStr(cof2,'WITH LSDOMAINT;',
                          FILES_maxIO,0,left);
FILES_WriteLine(cof2,true);

writecopyfunctions(cof1,cof2);
FILES_WriteStr(cof1,'END{COPYT};',FILES_maxIO,0,left);
FILES_Close(cof1);
FILES_Close(cof2);


END {DOMCOMRULES_writeresults};


procedure DOMCOMRULES_rule(rnr:integer;a:DOMCOMDECL_nodeid;
       b:DOMCOMDECL_psnode;la:DOMCOMDECL_psnode;mode:DOMCOMDECL_surfrulemode);

procedure uttrule(a:DOMCOMDECL_nodeid;b:DOMCOMDECL_psnode;
   	mode:DOMCOMDECL_surfrulemode);
begin
CASE a of
   Hinit:begin dutch:=false;english:=false;spanish:=false end;
   1:case mode of
     loccond:begin DOMCOMDECL_assignstatus(true) end;
     globcond:begin DOMCOMDECL_assignstatus(true) end;
     end;
   2:case mode of
     loccond:begin DOMCOMDECL_assignstatus(true) end;
     globcond:begin DOMCOMDECL_assignstatus(true) end;
     end;
   3:case mode of
     loccond:begin DOMCOMDECL_assignstatus(true) end;
     globcond:begin DOMCOMDECL_assignstatus(true) end;
     end;
   4:case mode of
     loccond:begin DOMCOMDECL_assignstatus(true) end;
     globcond:begin DOMCOMDECL_assignstatus(true) end;
     end;
   5:case mode of
     loccond:begin DOMCOMDECL_assignstatus(true) end;
     globcond:begin DOMCOMDECL_assignstatus(true) end;
     end;
   6:case mode of
     loccond:begin DOMCOMDECL_assignstatus(true) end;
     globcond:begin DOMCOMDECL_assignstatus(true) end;
     end;
   7:case mode of
     loccond:begin DOMCOMDECL_assignstatus(true) end;
     globcond:begin DOMCOMDECL_assignstatus(true) end;
     end;
   8:case mode of
     loccond:begin DOMCOMDECL_assignstatus(true) end;
     globcond:begin dutch:=true; langstr := 'dutch';
                    DOMCOMDECL_assignstatus(true) end;
     end;
   9:case mode of
     loccond:begin DOMCOMDECL_assignstatus(true) end;
     globcond:begin english:=true; langstr := 'english';
                    DOMCOMDECL_assignstatus(true) end;
     end;
   10:case mode of
     loccond:begin DOMCOMDECL_assignstatus(true) end;
     globcond:begin spanish:=true; langstr := 'spanish';
                    DOMCOMDECL_assignstatus(true) end;
     end;
   11:case mode of
     loccond:begin DOMCOMDECL_assignstatus(true) end;
     globcond:begin DOMCOMDECL_assignstatus(true) end;
     end;
   12:case mode of
     loccond:begin DOMCOMDECL_assignstatus(true) end;
     globcond:begin DOMCOMDECL_assignstatus(true) end;
     end;
   26:case mode of
     loccond:begin DOMCOMDECL_assignstatus(true) end;
     globcond:begin DOMCOMDECL_assignstatus(true) end;
     end;
   
   Hfinal:begin DOMCOMDECL_assignstatus(true);

   (*----------------------------------------------------------------------*
    * The categories SFCAT, PFCAT and GLUE are generated by the compiler.
    * This is also true for the recordtypes 'keyrecord' and 'emptyrecord'
    *----------------------------------------------------------------------*)
    new(recordentryvar);
    STRING_Constant(recordentryvar^.recordname,'xxkeyrecord',11);
    recordentryvar^.indexpresent := FALSE;
    recordentryvar^.keypresent := TRUE;
    initsetofattribs(recordentryvar^.attribs);
    STRING_Constant(recordentryvar^.oneofthecats, 'SFCAT', 5); 
    STRING_Constant(recordentryvar^.lb,'1',1);
    STRING_Constant(recordentryvar^.ub,'10',2);
    appendrecord(recordentryvar, recordtable);
    new(recordentryvar);
    STRING_Constant(recordentryvar^.recordname,'xxemptyrecord',13);
    recordentryvar^.keypresent := FALSE;
    recordentryvar^.indexpresent := FALSE;
    initsetofattribs(recordentryvar^.attribs);
    STRING_Constant(recordentryvar^.oneofthecats, 'GLUE', 4); 
    STRING_Constant(recordentryvar^.lb,'1',1);
    STRING_Constant(recordentryvar^.ub,'10',2);
    appendrecord(recordentryvar, recordtable);

    new(catlistentryvar);
    initsetofidents(catlistentryvar^.catnames);
    appendident('SFCAT', catlistentryvar^.catnames);
    catlistentryvar^.recordname := 'xxkeyrecord';
    appendcatdef(catlistentryvar, categorytable);
    new(catlistentryvar);
    initsetofidents(catlistentryvar^.catnames);
    appendident('PFCAT', catlistentryvar^.catnames);
    catlistentryvar^.recordname := 'xxkeyrecord';
    appendcatdef(catlistentryvar, categorytable);
    new(catlistentryvar);
    initsetofidents(catlistentryvar^.catnames);
    appendident('GLUE', catlistentryvar^.catnames);
    catlistentryvar^.recordname := 'xxemptyrecord';
    appendcatdef(catlistentryvar, categorytable);

                DOMCOMDECL_addnewtop(DOMCOMDECL_MakeNonTerminal(utt))
          end;
   end;
end;

procedure affixspecrule(a:DOMCOMDECL_nodeid;b:DOMCOMDECL_psnode;
   	mode:DOMCOMDECL_surfrulemode);
begin
CASE a of
   Hinit:begin initsetofidents(affixkeystablevar) end;
   1:case mode of
     loccond:begin DOMCOMDECL_assignstatus(true) end;
     globcond:begin DOMCOMDECL_assignstatus(true) end;
     end;
   2:case mode of
     loccond:begin DOMCOMDECL_assignstatus(true) end;
     globcond:begin DOMCOMDECL_assignstatus(true);
      		    appendident(b^.ldfield.terminal^.str,affixkeystablevar)
              end;
     end;
   Hfinal:begin DOMCOMDECL_assignstatus(true);
                affixkeystable:=affixkeystablevar;
                DOMCOMDECL_addnewtop(DOMCOMDECL_MakeNonTerminal(affixspec))
          end;
   end;
end;

procedure derivspecrule(a:DOMCOMDECL_nodeid;b:DOMCOMDECL_psnode;
   	mode:DOMCOMDECL_surfrulemode);
VAR
   key   : Str_STRING;
   len   : Str_Range;
   len2  : String_Range;
   stat  : BOOLEAN;
begin
CASE a of
   Hinit:begin initsetofderivs(derivkeystablevar);
               keynr := -1; 
               derivconstant := NIL;
         end;
   1:case mode of
     loccond:begin DOMCOMDECL_assignstatus(true) end;
     globcond:begin DOMCOMDECL_assignstatus(true) end;
     end;
   2:case mode of
     loccond:begin DOMCOMDECL_assignstatus(true) end;
     globcond:begin DOMCOMDECL_assignstatus(true);
                    IF derivconstant <> NIL THEN 
      		       appendderiv(derivconstant,derivkeystablevar);
                    new(derivconstant);
                    derivconstant^.derivname := b^.ldfield.terminal^.str;
                    keynr := keynr+1;
                    stat := STR_IntegerToStr(keynr,key,len);
IF len = 0 THEN writeln(keynr, ' ', key,' ', len);
                    STRING_Constant(derivconstant^.keyvaleu,key,len);
              end;
     end;
   3:case mode of
     loccond:begin DOMCOMDECL_assignstatus(true) end;
     globcond:begin DOMCOMDECL_assignstatus(true);
                    len := STRING_Length(b^.ldfield.terminal^.str);
                    STRING_ExtractChars(key,len2,b^.ldfield.terminal^.str,1,len);
                    stat := STR_StrToInteger(key,len,keynr);
                    derivconstant^.keyvaleu := b^.ldfield.terminal^.str;
              end;
     end;
   Hfinal:begin DOMCOMDECL_assignstatus(true);
                IF derivconstant <> NIL THEN 
  		   appendderiv(derivconstant,derivkeystablevar);
                derivkeystable:=derivkeystablevar;
                DOMCOMDECL_addnewtop(DOMCOMDECL_MakeNonTerminal(derivspec))
          end;
   end;
end;

procedure typespecrule(a:DOMCOMDECL_nodeid;b:DOMCOMDECL_psnode;
   	mode:DOMCOMDECL_surfrulemode);
begin
CASE a of
   Hinit:begin end;
   1:case mode of
     loccond:begin DOMCOMDECL_assignstatus(true) end;
     globcond:begin DOMCOMDECL_assignstatus(true) end;
     end;
   2:case mode of
     loccond:begin DOMCOMDECL_assignstatus(true) end;
     globcond:begin DOMCOMDECL_assignstatus(true) end;
     end;
   Hfinal:begin DOMCOMDECL_assignstatus(true);
                DOMCOMDECL_addnewtop(DOMCOMDECL_MakeNonTerminal(typespec))
          end;
   end;
end;

procedure recordspecrule(a:DOMCOMDECL_nodeid;b:DOMCOMDECL_psnode;
   	mode:DOMCOMDECL_surfrulemode);
begin
CASE a of
   Hinit:begin end;
   1:case mode of
     loccond:begin DOMCOMDECL_assignstatus(true) end;
     globcond:begin DOMCOMDECL_assignstatus(true) end;
     end;
   2:case mode of
     loccond:begin DOMCOMDECL_assignstatus(true) end;
     globcond:begin DOMCOMDECL_assignstatus(true) end;
     end;
   Hfinal:begin DOMCOMDECL_assignstatus(true);
                DOMCOMDECL_addnewtop(DOMCOMDECL_MakeNonTerminal(recordspec))
          end;
   end;
end;

procedure relationspecrule(a:DOMCOMDECL_nodeid;b:DOMCOMDECL_psnode;
   	mode:DOMCOMDECL_surfrulemode);
begin
CASE a of
   Hinit:begin initsetofidents(relationtablevar) end;
   1:case mode of
     loccond:begin DOMCOMDECL_assignstatus(true) end;
     globcond:begin DOMCOMDECL_assignstatus(true) end;
     end;
   2:case mode of
     loccond:begin DOMCOMDECL_assignstatus(true) end;
     globcond:begin DOMCOMDECL_assignstatus(true);
                    appendident(b^.ldfield.terminal^.str,relationtablevar)
              end;
     end;
   Hfinal:begin DOMCOMDECL_assignstatus(true);
                relationtable:=relationtablevar;
                DOMCOMDECL_addnewtop(DOMCOMDECL_MakeNonTerminal(relationspec))
          end;
   end;
end;

procedure categoriespecrule(a:DOMCOMDECL_nodeid;b:DOMCOMDECL_psnode;
   	mode:DOMCOMDECL_surfrulemode);
begin
CASE a of
   Hinit:begin end;
   1:case mode of
     loccond:begin DOMCOMDECL_assignstatus(true) end;
     globcond:begin DOMCOMDECL_assignstatus(true) end;
     end;
   2:case mode of
     loccond:begin DOMCOMDECL_assignstatus(true) end;
     globcond:begin DOMCOMDECL_assignstatus(true) end;
     end;
   Hfinal:begin DOMCOMDECL_assignstatus(true);
                DOMCOMDECL_addnewtop(DOMCOMDECL_MakeNonTerminal(categoriespec))
          end;
   end;
end;

procedure typedefinitionrule(a:DOMCOMDECL_nodeid;b:DOMCOMDECL_psnode;
   	mode:DOMCOMDECL_surfrulemode);
begin
CASE a of
   Hinit:begin end;
   1:case mode of
     loccond:begin DOMCOMDECL_assignstatus(true) end;
     globcond:begin DOMCOMDECL_assignstatus(true) end;
     end;
   2:case mode of
     loccond:begin DOMCOMDECL_assignstatus(true) end;
     globcond:begin DOMCOMDECL_assignstatus(true) end;
     end;
   3:case mode of
     loccond:begin DOMCOMDECL_assignstatus(true) end;
     globcond:begin DOMCOMDECL_assignstatus(true) end;
     end;
   4:case mode of
     loccond:begin DOMCOMDECL_assignstatus(true) end;
     globcond:begin DOMCOMDECL_assignstatus(true) end;
     end;
   5:case mode of
     loccond:begin DOMCOMDECL_assignstatus(true) end;
     globcond:begin DOMCOMDECL_assignstatus(true) end;
     end;
   Hfinal:begin DOMCOMDECL_assignstatus(true);
                DOMCOMDECL_addnewtop(DOMCOMDECL_MakeNonTerminal(typedefinition))
          end;
   end;
end;

procedure enumdefrule(a:DOMCOMDECL_nodeid;b:DOMCOMDECL_psnode;
   	mode:DOMCOMDECL_surfrulemode);
begin
CASE a of
   Hinit:begin new(enumentryvar);
               STRING_constantempty(enumentryvar^.typename);
               initsetofidents(enumentryvar^.idents)
         end;
   1:case mode of
     loccond:begin DOMCOMDECL_assignstatus(true) end;
     globcond:begin DOMCOMDECL_assignstatus(true) end;
     end;
   2:case mode of
     loccond:begin DOMCOMDECL_assignstatus(true) end;
     globcond:begin DOMCOMDECL_assignstatus(true);
                    enumentryvar^.typename:=b^.ldfield.preterminal^.str
              end;
     end;
   3:case mode of
     loccond:begin DOMCOMDECL_assignstatus(true) end;
     globcond:begin DOMCOMDECL_assignstatus(true);
                    appendident(b^.ldfield.terminal^.str,enumentryvar^.idents)
              end;
     end;
   Hfinal:begin DOMCOMDECL_assignstatus(true);
                appendenum(enumentryvar,enumtable);
                DOMCOMDECL_addnewtop(DOMCOMDECL_MakeNonTerminal(enumdef))
          end;
   end;
end;

procedure subrangedefrule(a:DOMCOMDECL_nodeid;b:DOMCOMDECL_psnode;
   	mode:DOMCOMDECL_surfrulemode);
begin
CASE a of
   Hinit:begin new(subrangeentryvar);
               STRING_constantempty(subrangeentryvar^.typename);
               STRING_constantempty(subrangeentryvar^.ident1);
               STRING_constantempty(subrangeentryvar^.ident2)
         end;
   1:case mode of
     loccond:begin DOMCOMDECL_assignstatus(true) end;
     globcond:begin DOMCOMDECL_assignstatus(true) end;
     end;
   2:case mode of
     loccond:begin DOMCOMDECL_assignstatus(true) end;
     globcond:begin DOMCOMDECL_assignstatus(true);
                    subrangeentryvar^.typename:=b^.ldfield.preterminal^.str
              end;
     end;
   3:case mode of
     loccond:begin DOMCOMDECL_assignstatus(true) end;
     globcond:begin DOMCOMDECL_assignstatus(true);
                    subrangeentryvar^.ident1:=b^.ldfield.terminal^.str
              end;
     end;
   4:case mode of
     loccond:begin DOMCOMDECL_assignstatus(true) end;
     globcond:begin DOMCOMDECL_assignstatus(true);
                    subrangeentryvar^.ident2:=b^.ldfield.terminal^.str
              end;
     end;
   Hfinal:begin DOMCOMDECL_assignstatus(true);
                appendsubrange(subrangeentryvar,subrangetable);
                DOMCOMDECL_addnewtop(DOMCOMDECL_MakeNonTerminal(subrangedef))
          end;
   end;
end;

procedure integerdefrule(a:DOMCOMDECL_nodeid;b:DOMCOMDECL_psnode;
   	mode:DOMCOMDECL_surfrulemode);
begin
CASE a of
   Hinit:begin STRING_constantempty(integerentryvar) end;
   1:case mode of
     loccond:begin DOMCOMDECL_assignstatus(true) end;
     globcond:begin DOMCOMDECL_assignstatus(true) end;
     end;
   2:case mode of
     loccond:begin DOMCOMDECL_assignstatus(true) end;
     globcond:begin DOMCOMDECL_assignstatus(true);
                    integerentryvar:=b^.ldfield.preterminal^.str
              end;
     end;
   Hfinal:begin DOMCOMDECL_assignstatus(true);
                appendident(integerentryvar,integertable);
                DOMCOMDECL_addnewtop(DOMCOMDECL_MakeNonTerminal(integerdef)) 
          end;
   end;
end;

procedure booleandefrule(a:DOMCOMDECL_nodeid;b:DOMCOMDECL_psnode;
   	mode:DOMCOMDECL_surfrulemode);
begin
CASE a of
   Hinit:begin STRING_constantempty(booleanentryvar) end;
   1:case mode of
     loccond:begin DOMCOMDECL_assignstatus(true) end;
     globcond:begin DOMCOMDECL_assignstatus(true) end;
     end;
   2:case mode of
     loccond:begin DOMCOMDECL_assignstatus(true) end;
     globcond:begin DOMCOMDECL_assignstatus(true);
                    booleanentryvar:=b^.ldfield.preterminal^.str
              end;
     end;
   Hfinal:begin DOMCOMDECL_assignstatus(true);
                appendident(booleanentryvar,booleantable);
                DOMCOMDECL_addnewtop(DOMCOMDECL_MakeNonTerminal(booleandef)) 
          end;
   end;
end;

procedure setdefrule(a:DOMCOMDECL_nodeid;b:DOMCOMDECL_psnode;
   	mode:DOMCOMDECL_surfrulemode);
begin
CASE a of
   Hinit:begin new(SETOFentryvar);
               STRING_constantempty(SETOFentryvar^.typename1);
               STRING_constantempty(SETOFentryvar^.typename2)
         end;
   1:case mode of
     loccond:begin DOMCOMDECL_assignstatus(true) end;
     globcond:begin DOMCOMDECL_assignstatus(true) end;
     end;
   2:case mode of
     loccond:begin DOMCOMDECL_assignstatus(true) end;
     globcond:begin DOMCOMDECL_assignstatus(true);
                    SETOFentryvar^.typename1:=b^.ldfield.preterminal^.str
              end;
     end;
   3:case mode of
     loccond:begin DOMCOMDECL_assignstatus(true) end;
     globcond:begin DOMCOMDECL_assignstatus(true);
                    SETOFentryvar^.typename2:=b^.ldfield.preterminal^.str
              end;
     end;
   Hfinal:begin DOMCOMDECL_assignstatus(true);
                appendSETOF(SETOFentryvar,settable);
                DOMCOMDECL_addnewtop(DOMCOMDECL_MakeNonTerminal(setdef))
          end;
   end;
end;

procedure typenamerule(a:DOMCOMDECL_nodeid;b:DOMCOMDECL_psnode;
   	mode:DOMCOMDECL_surfrulemode);
begin
CASE a of
   Hinit:begin STRING_constantempty(stringvar) end;
   1:case mode of
     loccond:begin DOMCOMDECL_assignstatus(true) end;
     globcond:begin STRING_LowerCase(stringvar, b^.ldfield.terminal^.str);
                    DOMCOMDECL_assignstatus(true) 
              end;
     end;
   Hfinal:begin t:=DOMCOMDECL_MakeNonTerminal(typename);
                new(t^.ldfield.preterminal);
                t^.ldfield.preterminal^.str:=stringvar;
                DOMCOMDECL_assignstatus(true);
   		DOMCOMDECL_addnewtop(t)
          end;
   end;
end;

function checktypename(str:STRING_string;VAR kind:indicatortype;
   				VAR typecode:INTEGER;VAR basetype:STRING_string)
                      :BOOLEAN;
VAR found:boolean;
    integertable1,booleantable1:setofidents;
    enumtable1:setofenums;
    subrangetable1:setofsubranges;
    settable1:setofSETOFs;
    i:INTEGER;
    enum1:penum;
    subrange1:psubrange;
    setof1:psetof;                                                 
    ident:STRING_string;
BEGIN
i:=0;
found:=false;
integertable1:=integertable;
booleantable1:=booleantable;
enumtable1:=enumtable;
subrangetable1:=subrangetable;
settable1:=settable;
WHILE stillidents(integertable1) AND NOT(found) DO
   BEGIN
   i:=i+1;
   takeident(ident,integertable1);
   IF STRING_compare(ident,str) = 0 THEN 
   	BEGIN
        found:=true;
        kind:=int;
        STRING_ConstantEmpty(basetype);
        END
   END;
WHILE stillidents(booleantable1) AND NOT(found) DO
   BEGIN
   i:=i+1;
   takeident(ident,booleantable1);
   IF STRING_compare(ident,str) = 0 THEN 
   	BEGIN
        found:=true;
        kind:=bool;
        STRING_ConstantEmpty(basetype);
        END
   END;
WHILE stillenums(enumtable1) AND NOT(found) DO
   BEGIN
   i:=i+1;
   takeenum(enum1,enumtable1);
   IF STRING_compare(enum1^.typename,str) = 0 THEN 
   	BEGIN
        found:=true;
        kind:=enumeration;
        STRING_ConstantEmpty(basetype);
        END
   END;
WHILE stillsubranges(subrangetable1) AND NOT(found) DO
   BEGIN
   i:=i+1;
   takesubrange(subrange1,subrangetable1);
   IF STRING_compare(subrange1^.typename,str) = 0 THEN 
   	BEGIN
        found:=true;
        kind:=subrang;
        STRING_ConstantEmpty(basetype);
        END
   END;
WHILE stillsetofs(settable1) AND NOT(found) DO
   BEGIN
   i:=i+1;
   takesetof(setof1,settable1);
   IF STRING_compare(setof1^.typename1,str) = 0 THEN 
   	BEGIN
        found:=true;
        kind:=enumset;
        basetype:=setof1^.typename2
        END
   END;
IF not(found) THEN writeln('type ',str,' used but not defined');
typecode:=i;
checktypename:=found
END;
procedure recorddefinitionrule(a:DOMCOMDECL_nodeid;b:DOMCOMDECL_psnode;
   	mode:DOMCOMDECL_surfrulemode);
VAR kind:indicatortype;
    typecode:INTEGER;
    basetype:STRING_string;
begin
CASE a of
   Hinit:begin new(recordentryvar);
               STRING_constantempty(recordentryvar^.recordname);
               STRING_constant(recordentryvar^.lb,'1',1);
               STRING_constant(recordentryvar^.ub,'10',2);
               initsetofattribs(recordentryvar^.attribs);
               recordentryvar^.indexpresent:=false;
               recordentryvar^.keypresent:=false;
         end;
   1:case mode of
     loccond:begin DOMCOMDECL_assignstatus(true) end;
     globcond:begin DOMCOMDECL_assignstatus(true) end;
     end;
   2:case mode of
     loccond:begin DOMCOMDECL_assignstatus(true) end;
     globcond:begin DOMCOMDECL_assignstatus(true);
                    recordentryvar^.recordname:=b^.ldfield.preterminal^.str
              end;
     end;
   3:case mode of
     loccond:begin DOMCOMDECL_assignstatus(true) end;
     globcond:begin DOMCOMDECL_assignstatus(true);
                    new(attribvar);
                    attribvar^.attribname:=b^.ldfield.preterminal^.str;
                    STRING_constantempty(attribvar^.typename);
   		    STRING_constantempty(attribvar^.valeu)
              end;
     end;
   4:case mode of
     loccond:begin DOMCOMDECL_assignstatus(true) 
             end;
     globcond:begin DOMCOMDECL_assignstatus(checktypename(
                                                 b^.ldfield.preterminal^.str,
                                                 kind,
                                                 typecode,
                                                 basetype
                                                        )
                                           );
                    attribvar^.typename:=b^.ldfield.preterminal^.str;
                    attribvar^.kind:=kind;
                    attribvar^.typecode:=typecode;
                    attribvar^.basetype:=basetype
              end;
     end;
   5:case mode of
     loccond:begin DOMCOMDECL_assignstatus(true) end;
     globcond:begin DOMCOMDECL_assignstatus(true);
                    attribvar^.valeu:=b^.ldfield.preterminal^.str;
                    appendattrib(attribvar,recordentryvar^.attribs)
              end;
     end;
   6:case mode of
     loccond:begin DOMCOMDECL_assignstatus(true) end;
     globcond:begin DOMCOMDECL_assignstatus(true);
                    recordentryvar^.keypresent:=true
              end;
     end;
   7:case mode of
     loccond:begin DOMCOMDECL_assignstatus(true) end;
     globcond:begin DOMCOMDECL_assignstatus(true);
                    recordentryvar^.lb := b^.ldfield.terminal^.str;
              end;
     end;
   8:case mode of
     loccond:begin DOMCOMDECL_assignstatus(true) end;
     globcond:begin DOMCOMDECL_assignstatus(true);
                    recordentryvar^.ub := b^.ldfield.terminal^.str;
              end;
     end;
   9:case mode of
     loccond:begin DOMCOMDECL_assignstatus(true) end;
     globcond:begin DOMCOMDECL_assignstatus(true);
                    recordentryvar^.indexpresent:=true
              end;
     end;
   Hfinal:begin DOMCOMDECL_assignstatus(true);
             appendrecord(recordentryvar,recordtable);
             DOMCOMDECL_addnewtop(DOMCOMDECL_MakeNonTerminal(recorddefinition)) 
          end;
   end;
end;

procedure attribnamerule(a:DOMCOMDECL_nodeid;b4:DOMCOMDECL_psnode;
   	mode:DOMCOMDECL_surfrulemode);
begin
CASE a of
   Hinit:begin STRING_constantempty(stringvar) end;
   1:case mode of
     loccond:begin DOMCOMDECL_assignstatus(true) end;
     globcond:begin STRING_concat(stringvar,stringvar,b^.ldfield.terminal^.str);
                    DOMCOMDECL_assignstatus(true) 
              end;
     end;
   Hfinal:begin t:=DOMCOMDECL_MakeNonTerminal(attribname);
                new(t^.ldfield.preterminal);
                t^.ldfield.preterminal^.str:=stringvar;
                DOMCOMDECL_assignstatus(true);
   		DOMCOMDECL_addnewtop(t)
          end;
   end;
end;

procedure defaultvaleurule(a:DOMCOMDECL_nodeid;b:DOMCOMDECL_psnode;
   	mode:DOMCOMDECL_surfrulemode);
begin
CASE a of
   Hinit:begin STRING_constantempty(stringvar) end;
   1:case mode of
     loccond:begin DOMCOMDECL_assignstatus(true) end;
     globcond:begin STRING_concat(stringvar,stringvar,b^.ldfield.terminal^.str);
                    DOMCOMDECL_assignstatus(true) 
              end;
     end;
   2:case mode of
     loccond:begin DOMCOMDECL_assignstatus(true) end;
     globcond:begin STRING_appendchar(stringvar,stringvar,',');
                    DOMCOMDECL_assignstatus(true) 
              end;
     end;
   3:case mode of
     loccond:begin DOMCOMDECL_assignstatus(true) end;
     globcond:begin STRING_appendchar(stringvar,stringvar,'[');
                    DOMCOMDECL_assignstatus(true) 
              end;
     end;
   4:case mode of
     loccond:begin DOMCOMDECL_assignstatus(true) end;
     globcond:begin STRING_appendchar(stringvar,stringvar,']');
                    DOMCOMDECL_assignstatus(true) 
              end;
     end;
   Hfinal:begin t:=DOMCOMDECL_MakeNonTerminal(defaultvalue);
                new(t^.ldfield.preterminal);
                t^.ldfield.preterminal^.str:=stringvar;
                DOMCOMDECL_assignstatus(true);
   		DOMCOMDECL_addnewtop(t)
          end;
   end;
end;

procedure recordnamerule(a:DOMCOMDECL_nodeid;b:DOMCOMDECL_psnode;
   	mode:DOMCOMDECL_surfrulemode);
begin
CASE a of
   Hinit:begin STRING_constantempty(stringvar) end;
   1:case mode of
     loccond:begin DOMCOMDECL_assignstatus(true) end;
     globcond:begin STRING_concat(stringvar,stringvar,b^.ldfield.terminal^.str);
                    DOMCOMDECL_assignstatus(true) 
              end;
     end;
   Hfinal:begin t:=DOMCOMDECL_MakeNonTerminal(recordname);
                new(t^.ldfield.preterminal);
                t^.ldfield.preterminal^.str:=stringvar;
                DOMCOMDECL_assignstatus(true);
   		DOMCOMDECL_addnewtop(t)
          end;
   end;
end;

procedure catdefinitionrule(a:DOMCOMDECL_nodeid;b:DOMCOMDECL_psnode;
   	mode:DOMCOMDECL_surfrulemode);
begin
CASE a of
   Hinit:begin end;
   1:case mode of
     loccond:begin DOMCOMDECL_assignstatus(true) end;
     globcond:begin DOMCOMDECL_assignstatus(true) end;
     end;
   Hfinal:begin t:=DOMCOMDECL_MakeNonTerminal(catdefinition);
                DOMCOMDECL_assignstatus(true);
   		DOMCOMDECL_addnewtop(t)
          end;
   end;
end;

procedure catlistrule(a:DOMCOMDECL_nodeid;b:DOMCOMDECL_psnode;
   	mode:DOMCOMDECL_surfrulemode);
begin
CASE a of
   Hinit:begin new(catlistentryvar);
               initsetofidents(catlistentryvar^.catnames);
               STRING_constantempty(catlistentryvar^.recordname);
               STRING_constantempty(oneofthecats)
         end;
   1:case mode of
     loccond:begin DOMCOMDECL_assignstatus(true) end;
     globcond:begin DOMCOMDECL_assignstatus(true) end;
     end;
   2:case mode of
     loccond:begin DOMCOMDECL_assignstatus(true) end;
     globcond:begin DOMCOMDECL_assignstatus(true);
              appendident(b^.ldfield.preterminal^.str,catlistentryvar^.catnames);
              oneofthecats := b^.ldfield.preterminal^.str
              end;
     end;
   3:case mode of
     loccond:begin DOMCOMDECL_assignstatus(true) end;
     globcond:begin DOMCOMDECL_assignstatus(true);
                    catlistentryvar^.recordname:=b^.ldfield.preterminal^.str;
                    SetOneOfTheCats(oneofthecats, b^.ldfield.preterminal^.str)
              end;
     end;
   Hfinal:begin DOMCOMDECL_assignstatus(true);
             appendcatdef(catlistentryvar,categorytable);
             DOMCOMDECL_addnewtop(DOMCOMDECL_MakeNonTerminal(catlist)) 
          end;
   end;
end;

procedure catnamerule(a:DOMCOMDECL_nodeid;b:DOMCOMDECL_psnode;
   	mode:DOMCOMDECL_surfrulemode);
begin
CASE a of
   Hinit:begin STRING_constantempty(stringvar) end;
   1:case mode of
     loccond:begin DOMCOMDECL_assignstatus(true) end;
     globcond:begin STRING_concat(stringvar,stringvar,b^.ldfield.terminal^.str);
                    DOMCOMDECL_assignstatus(true) 
              end;
     end;
   Hfinal:begin t:=DOMCOMDECL_MakeNonTerminal(catname);
                new(t^.ldfield.preterminal);
                t^.ldfield.preterminal^.str:=stringvar;
                DOMCOMDECL_assignstatus(true);
   		DOMCOMDECL_addnewtop(t)
          end;
   end;
end;

procedure functionnamerule(a:DOMCOMDECL_nodeid;b:DOMCOMDECL_psnode;
   	mode:DOMCOMDECL_surfrulemode);
begin
CASE a of
   Hinit:begin STRING_constantempty(stringvar) end;
   1:case mode of
     loccond:begin DOMCOMDECL_assignstatus(true) end;
     globcond:begin STRING_concat(stringvar,stringvar,b^.ldfield.terminal^.str);
                    DOMCOMDECL_assignstatus(true) 
              end;
     end;
   Hfinal:begin t:=DOMCOMDECL_MakeNonTerminal(functionname);
                new(t^.ldfield.preterminal);
                t^.ldfield.preterminal^.str:=stringvar;
                DOMCOMDECL_assignstatus(true);
   		DOMCOMDECL_addnewtop(t)
          end;
   end;
end;

procedure copyspecrule(a:DOMCOMDECL_nodeid;b:DOMCOMDECL_psnode;
           mode:DOMCOMDECL_surfrulemode);
begin
CASE a of
  Hinit: begin new(copyentryvar);
               STRING_constantempty(copyentryvar^.functionname);
               STRING_constantempty(copyentryvar^.recordname1);
               STRING_constantempty(copyentryvar^.recordname2);
               copyfound:=false
         end;
  1:case mode of
      loccond:begin DOMCOMDECL_assignstatus(true) end;
      globcond:begin DOMCOMDECL_assignstatus(true) end;
    end;
  2:case mode of
      loccond:begin DOMCOMDECL_assignstatus(true) end;
      globcond:begin DOMCOMDECL_assignstatus(true);copyfound:=true;
                     copyentryvar^.functionname:=b^.ldfield.preterminal^.str
               end;
    end;
  3:case mode of
      loccond:begin DOMCOMDECL_assignstatus(true) end;
      globcond:begin DOMCOMDECL_assignstatus(true);
                     copyentryvar^.recordname1:=b^.ldfield.preterminal^.str
               end;
    end;
  4:case mode of
      loccond:begin DOMCOMDECL_assignstatus(true) end;
      globcond:begin DOMCOMDECL_assignstatus(true);
                     copyentryvar^.recordname2:=b^.ldfield.preterminal^.str
               end;
    end;
  Hfinal:begin DOMCOMDECL_assignstatus(true);
               if copyfound then appendcopy(copyentryvar,copiestable);
               DOMCOMDECL_addnewtop(DOMCOMDECL_MakeNonTerminal(copyspec))
          end;
  end;
end;

procedure contextspecrule(a:DOMCOMDECL_nodeid;b:DOMCOMDECL_psnode;
   	mode:DOMCOMDECL_surfrulemode);
begin
CASE a of
   Hinit:begin initsetofidents(contexttablevar) end;
   1:case mode of
     loccond:begin DOMCOMDECL_assignstatus(true) end;
     globcond:begin DOMCOMDECL_assignstatus(true) end;
     end;
   2:case mode of
     loccond:begin DOMCOMDECL_assignstatus(true) end;
     globcond:begin DOMCOMDECL_assignstatus(true);
      		    appendident(b^.ldfield.terminal^.str,contexttablevar)
              end;
     end;
   Hfinal:begin DOMCOMDECL_assignstatus(true);
                contexttable:=contexttablevar;
                DOMCOMDECL_addnewtop(DOMCOMDECL_MakeNonTerminal(contextspec))
          end;
   end;
end;

procedure phoneticspecrule(a:DOMCOMDECL_nodeid;b:DOMCOMDECL_psnode;
   	mode:DOMCOMDECL_surfrulemode);
begin
CASE a of
   Hinit:begin initsetofidents(phonetictablevar) end;
   1:case mode of
     loccond:begin DOMCOMDECL_assignstatus(true) end;
     globcond:begin DOMCOMDECL_assignstatus(true) end;
     end;
   2:case mode of
     loccond:begin DOMCOMDECL_assignstatus(true) end;
     globcond:begin DOMCOMDECL_assignstatus(true);
      		    appendident(b^.ldfield.terminal^.str,phonetictablevar)
              end;
     end;
   Hfinal:begin DOMCOMDECL_assignstatus(true);
                phonetictable:=phonetictablevar;
                DOMCOMDECL_addnewtop(DOMCOMDECL_MakeNonTerminal(phoneticspec))
          end;
   end;
end;
procedure catsetspecrule(a:DOMCOMDECL_nodeid;b:DOMCOMDECL_psnode;
   	mode:DOMCOMDECL_surfrulemode);
begin
CASE a of
   Hinit:begin  end;
   1:case mode of
     loccond:begin DOMCOMDECL_assignstatus(true) end;
     globcond:begin DOMCOMDECL_assignstatus(true) end;
     end;
   2:case mode of
     loccond:begin DOMCOMDECL_assignstatus(true) end;
     globcond:begin DOMCOMDECL_assignstatus(true);
                    new(catsetsentryvar);
                    initsetofidents(catsetsentryvar^.idents);
                    catsetsentryvar^.typename:=b^.ldfield.terminal^.str
              end;
     end;
   3:case mode of
     loccond:begin DOMCOMDECL_assignstatus(true) end;
     globcond:begin DOMCOMDECL_assignstatus(true);
                    appendident(b^.ldfield.terminal^.str,catsetsentryvar^.idents)
              end;
     end;
   4:case mode of
     loccond:begin DOMCOMDECL_assignstatus(true) end;
     globcond:begin DOMCOMDECL_assignstatus(true);
                    appendenum(catsetsentryvar,catsetstable)
              end;
     end;
   Hfinal:begin DOMCOMDECL_assignstatus(true);
                DOMCOMDECL_addnewtop(DOMCOMDECL_MakeNonTerminal(catsetspec))
          end;
   end;
end;

BEGIN
   CASE rnr OF
   1 :  uttrule(a,b,mode); 
   2 :  affixspecrule(a,b,mode); 
   3 :  typespecrule(a,b,mode); 
   4 :  recordspecrule(a,b,mode); 
   5 :  relationspecrule(a,b,mode); 
   6 :  categoriespecrule(a,b,mode); 
   7 :  typedefinitionrule(a,b,mode); 
   8 :  enumdefrule(a,b,mode); 
   9 :  subrangedefrule(a,b,mode); 
   10:  integerdefrule(a,b,mode); 
   11:  booleandefrule(a,b,mode); 
   12:  setdefrule(a,b,mode); 
   13:  typenamerule(a,b,mode);
   14:  recorddefinitionrule(a,b,mode);
   15:  attribnamerule(a,b,mode);
   16:  defaultvaleurule(a,b,mode);
   17:  recordnamerule(a,b,mode);
   18:  catdefinitionrule(a,b,mode);
   19:  catlistrule(a,b,mode);
   20:  catnamerule(a,b,mode);
   21:  functionnamerule(a,b,mode);
   22:  copyspecrule(a,b,mode);
   23:  contextspecrule(a,b,mode);
   24:  phoneticspecrule(a,b,mode);
   25:  catsetspecrule(a,b,mode);
   26:  derivspecrule(a,b,mode); 
   end;
END;
