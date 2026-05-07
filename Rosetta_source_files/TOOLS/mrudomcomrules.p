(*mpm:::===================================================================*
 *
 *  rosetta project                                                 
 *                                                                  
 *  module title    : mrudomcomrules
 *  creation date   :                                               
 *  author          :                                               
 *                                                                  
 *  copyright (c) 1985, by nederlandse philips bedrijven bv.        
 *                                                                  
 *  remarks         :  
 *
 *emp:::===================================================================*)

(*=========================================================================*
 *  imported modules
 *=========================================================================*)
export(mrudomcomrules);
pragma c_include('mrudomcomrules.pf');
pragma c_include('mrudomcomlangspec.pf');
pragma c_include('string.pf');
pragma c_include('files.pf');
pragma c_include('mrudomcomdecl.pf');

program mrudomcomrules;

with mrudomcomlangspec,
     strng,
     files,
     mrudomcomdecl;
type
   plosident = ^losident;
   losident = record
                arg:string_string;
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
   		typename:string_string;
   		idents:setofidents			
   	      end;
   setofenums = record
   		first,last:plosenum
   		end;
   psymbol=^symbol;
   plossymbol=^lossymbol;
   lossymbol=record
   	         arg:psymbol;
   		 next:plossymbol
   	       end;
   symbol = record
   		catname:string_string;
   		character:string_string			
   	      end;
   setofsymbols = record
   		first,last:plossymbol
   		end;
   pword=^word;
   plosword=^losword;
   losword=record
   	         arg:pword;
   		 next:plosword
   	       end;
   word = record
   		catname:string_string;
   		ident:string_string			
   	      end;
   setofwords = record
   		first,last:plosword
   		end;
   psubrange=^subrange;
   plossubrange=^lossubrange;
   lossubrange=record
   	         arg:psubrange;
   		 next:plossubrange
   	       end;
   subrange = record
   		typename:string_string;
   		ident1,ident2:string_string			
   	      end;
   setofsubranges = record
   		first,last:plossubrange
   		end;
   setof = record
                 typename1,typename2:string_string
   	       end;
   psetof=^setof;
   plossetof=^lossetof;
   lossetof=record
   	         arg:psetof;
   		 next:plossetof
   	       end;
   setofsetofs = record
   		first,last:plossetof
   		end;
   tables = record
                typenames:setofidents;
                tablenames:setofidents
            end;
   genericset = record
                 identifier:string_string;
                 attribs,typenames:setofidents;
   	       end;
   pgenericset=^genericset;
   plosgenericset=^losgenericset;
   losgenericset=record
   	         arg:pgenericset;
   		 next:plosgenericset
   	       end;
   setofgenericsets = record
   		first,last:plosgenericset
   		end;
   ploscopy=^loscopy;
   pcopy = ^copy;
   copy = record
              functionname,recordname1,recordname2:string_string
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
              attribname,typename,valeu:string_string
            end;
   losattrib = record
   		arg:pattrib;
                next:plosattrib
   	       end;
   setofattribs = record
                    first,last:plosattrib
                  end;
   recordtype = record
                  recordname:string_string;
                  attribs,inhattribs,synattribs:setofattribs
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
                   recordname:string_string
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

var of1,of2,mof1,mof2,wof1:files_text;
    stringvar:string_string;
    filename:string_string;
    t:mrudomcomdecl_psnode;
    enumtable:setofenums;
    enumentryvar:penum;
    subrangetable:setofsubranges;
    subrangeentryvar:psubrange;
    filestable,texttable,stringtable:setofidents;
    textentryvar,stringentryvar:string_string;
    integertable:setofidents;
    integerentryvar:string_string;
    booleantable:setofidents;
    booleanentryvar:string_string;
    genericsettable:setofgenericsets;
    tabletable:tables;
    settable:setofsetofs;
    setentryvar:pgenericset;
    setofentryvar:psetof;
    recordtable,procrecordtable:setofrecords;
    recordentryvar:precord;
    attribvar:pattrib;
    categorytable:setofcatdefs;
    catlistentryvar:pcatdef;
    alphabettable:setofidents;
    charentryvar:string_string;
    symboltable:setofsymbols;
    symbolentryvar:psymbol;
    wordtable:setofwords;
    wordentryvar:pword;

procedure initsetofidents(var s1:setofidents);
begin
s1.first:=nil;s1.last:=nil
end;
function stillidents(s1:setofidents):boolean;
begin
if s1.first<>nil then stillidents:=true
else stillidents:=false
end;
procedure appendident(str:string_string;var s1:setofidents);
var p:plosident;
begin
new(p);
p^.arg:=str;
p^.next:=nil;
if s1.first=nil then
   begin
   s1.first:=p;
   s1.last:=p
   end
else
   begin
   s1.last^.next:=p;
   s1.last:=p
   end 
end;
procedure takeident(var str:string_string;var s1:setofidents);
begin
if s1.first=nil then string_constantempty(str)
else
   begin
   str:=s1.first^.arg;
   if s1.first=s1.last then
   	begin
   	s1.first:=nil;s1.last:=nil
   	end
   else s1.first:=s1.first^.next
   end
end;
procedure initsetofenums(var s1:setofenums);
begin
s1.first:=nil;s1.last:=nil
end;
function stillenums(s1:setofenums):boolean;
begin
if s1.first<>nil then stillenums:=true
else stillenums:=false
end;
procedure appendenum(enum1:penum;var s1:setofenums);
var p:plosenum;
begin
new(p);
p^.arg:=enum1;
p^.next:=nil;
if s1.first=nil then
   begin
   s1.first:=p;
   s1.last:=p
   end
else
   begin
   s1.last^.next:=p;
   s1.last:=p
   end 
end;
procedure takeenum(var enum1:penum;var s1:setofenums);
begin
if s1.first=nil then enum1:=nil
else
   begin
   enum1:=s1.first^.arg;
   if s1.first=s1.last then
   	begin
   	s1.first:=nil;s1.last:=nil
   	end
   else s1.first:=s1.first^.next
   end
end;
procedure initsetofsymbols(var s1:setofsymbols);
begin
s1.first:=nil;s1.last:=nil
end;
function stillsymbols(s1:setofsymbols):boolean;
begin
if s1.first<>nil then stillsymbols:=true
else stillsymbols:=false
end;
procedure appendsymbol(symbol1:psymbol;var s1:setofsymbols);
var p:plossymbol;
begin
new(p);
p^.arg:=symbol1;
p^.next:=nil;
if s1.first=nil then
   begin
   s1.first:=p;
   s1.last:=p
   end
else
   begin
   s1.last^.next:=p;
   s1.last:=p
   end 
end;
procedure takesymbol(var symbol1:psymbol;var s1:setofsymbols);
begin
if s1.first=nil then symbol1:=nil
else
   begin
   symbol1:=s1.first^.arg;
   if s1.first=s1.last then
   	begin
   	s1.first:=nil;s1.last:=nil
   	end
   else s1.first:=s1.first^.next
   end
end;
procedure initsetofwords(var s1:setofwords);
begin
s1.first:=nil;s1.last:=nil
end;
function stillwords(s1:setofwords):boolean;
begin
if s1.first<>nil then stillwords:=true
else stillwords:=false
end;
procedure appendword(word1:pword;var s1:setofwords);
var p:plosword;
begin
new(p);
p^.arg:=word1;
p^.next:=nil;
if s1.first=nil then
   begin
   s1.first:=p;
   s1.last:=p
   end
else
   begin
   s1.last^.next:=p;
   s1.last:=p
   end 
end;
procedure takeword(var word1:pword;var s1:setofwords);
begin
if s1.first=nil then word1:=nil
else
   begin
   word1:=s1.first^.arg;
   if s1.first=s1.last then
   	begin
   	s1.first:=nil;s1.last:=nil
   	end
   else s1.first:=s1.first^.next
   end
end;
procedure initsetofattribs(var s1:setofattribs);
begin
s1.first:=nil;s1.last:=nil
end;
function stillattribs(s1:setofattribs):boolean;
begin
if s1.first<>nil then stillattribs:=true
else stillattribs:=false
end;
procedure appendattrib(attrib1:pattrib;var s1:setofattribs);
var p:plosattrib;
begin
new(p);
p^.arg:=attrib1;
p^.next:=nil;
if s1.first=nil then
   begin
   s1.first:=p;
   s1.last:=p
   end
else
   begin
   s1.last^.next:=p;
   s1.last:=p
   end 
end;
procedure takeattrib(var attrib1:pattrib;var s1:setofattribs);
begin
if s1.first=nil then attrib1:=nil
else
   begin
   attrib1:=s1.first^.arg;
   if s1.first=s1.last then
   	begin
   	s1.first:=nil;s1.last:=nil
   	end
   else s1.first:=s1.first^.next
   end
end;
procedure initsetofcopies(var s1:setofcopies);
begin
s1.first:=nil;s1.last:=nil
end;
function stillcopies(s1:setofcopies):boolean;
begin
if s1.first<>nil then stillcopies:=true
else stillcopies:=false
end;
procedure appendcopy(copy1:pcopy;var s1:setofcopies);
var p:ploscopy;
begin
new(p);
p^.arg:=copy1;
p^.next:=nil;
if s1.first=nil then
   begin
   s1.first:=p;
   s1.last:=p
   end
else
   begin
   s1.last^.next:=p;
   s1.last:=p
   end 
end;
procedure takecopy(var copy1:pcopy;var s1:setofcopies);
begin
if s1.first=nil then copy1:=nil
else
   begin
   copy1:=s1.first^.arg;
   if s1.first=s1.last then
   	begin
   	s1.first:=nil;s1.last:=nil
   	end
   else s1.first:=s1.first^.next
   end
end;
procedure initsetofsubranges(var s1:setofsubranges);
begin
s1.first:=nil;s1.last:=nil
end;
function stillsubranges(s1:setofsubranges):boolean;
begin
if s1.first<>nil then stillsubranges:=true
else stillsubranges:=false
end;
procedure appendsubrange(subrange1:psubrange;var s1:setofsubranges);
var p:plossubrange;
begin
new(p);
p^.arg:=subrange1;
p^.next:=nil;
if s1.first=nil then
   begin
   s1.first:=p;
   s1.last:=p
   end
else
   begin
   s1.last^.next:=p;
   s1.last:=p
   end 
end;
procedure takesubrange(var subrange1:psubrange;var s1:setofsubranges);
begin
if s1.first=nil then subrange1:=nil
else
   begin
   subrange1:=s1.first^.arg;
   if s1.first=s1.last then
   	begin
   	s1.first:=nil;s1.last:=nil
   	end
   else s1.first:=s1.first^.next
   end
end;
procedure initsetofsetofs(var s1:setofsetofs);
begin
s1.first:=nil;s1.last:=nil
end;
function stillsetofs(s1:setofsetofs):boolean;
begin
if s1.first<>nil then stillsetofs:=true
else stillsetofs:=false
end;
procedure appendsetof(setof1:psetof;var s1:setofsetofs);
var p:plossetof;
begin
new(p);
p^.arg:=setof1;
p^.next:=nil;
if s1.first=nil then
   begin
   s1.first:=p;
   s1.last:=p
   end
else
   begin
   s1.last^.next:=p;
   s1.last:=p
   end 
end;
procedure takesetof(var setof1:psetof;var s1:setofsetofs);
begin
if s1.first=nil then setof1:=nil
else
   begin
   setof1:=s1.first^.arg;
   if s1.first=s1.last then
   	begin
   	s1.first:=nil;s1.last:=nil
   	end
   else s1.first:=s1.first^.next
   end
end;
procedure initsetofgenericsets(var s1:setofgenericsets);
begin
s1.first:=nil;s1.last:=nil
end;
function stillgenericsets(s1:setofgenericsets):boolean;
begin
if s1.first<>nil then stillgenericsets:=true
else stillgenericsets:=false
end;
procedure appendgenericset(genericset1:pgenericset;var s1:setofgenericsets);
var p:plosgenericset;
begin
new(p);
p^.arg:=genericset1;
p^.next:=nil;
if s1.first=nil then
   begin
   s1.first:=p;
   s1.last:=p
   end
else
   begin
   s1.last^.next:=p;
   s1.last:=p
   end 
end;
procedure takegenericset(var genericset1:pgenericset;var s1:setofgenericsets);
begin
if s1.first=nil then genericset1:=nil
else
   begin
   genericset1:=s1.first^.arg;
   if s1.first=s1.last then
   	begin
   	s1.first:=nil;s1.last:=nil
   	end
   else s1.first:=s1.first^.next
   end
end;
procedure initsetofrecords(var s1:setofrecords);
begin
s1.first:=nil;s1.last:=nil
end;
function stillrecords(s1:setofrecords):boolean;
begin
if s1.first<>nil then stillrecords:=true
else stillrecords:=false
end;
procedure appendrecord(record1:precord;var s1:setofrecords);
var p:plosrecord;
begin
new(p);
p^.arg:=record1;
p^.next:=nil;
if s1.first=nil then
   begin
   s1.first:=p;
   s1.last:=p
   end
else
   begin
   s1.last^.next:=p;
   s1.last:=p
   end 
end;
procedure takerecord(var record1:precord;var s1:setofrecords);
begin
if s1.first=nil then record1:=nil
else
   begin
   record1:=s1.first^.arg;
   if s1.first=s1.last then
   	begin
   	s1.first:=nil;s1.last:=nil
   	end
   else s1.first:=s1.first^.next
   end
end;
procedure initsetofcatdefs(var s1:setofcatdefs);
begin
s1.first:=nil;s1.last:=nil
end;
function stillcatdefs(s1:setofcatdefs):boolean;
begin
if s1.first<>nil then stillcatdefs:=true
else stillcatdefs:=false
end;
procedure appendcatdef(catdef1:pcatdef;var s1:setofcatdefs);
var p:ploscatdef;
begin
new(p);
p^.arg:=catdef1;
p^.next:=nil;
if s1.first=nil then
   begin
   s1.first:=p;
   s1.last:=p
   end
else
   begin
   s1.last^.next:=p;
   s1.last:=p
   end 
end;
procedure takecatdef(var catdef1:pcatdef;var s1:setofcatdefs);
begin
if s1.first=nil then catdef1:=nil
else
   begin
   catdef1:=s1.first^.arg;
   if s1.first=s1.last then
   	begin
   	s1.first:=nil;s1.last:=nil
   	end
   else s1.first:=s1.first^.next
   end
end;
function converttoio(n:string_range):files_iorange;
begin
converttoio:=n
end;

 procedure mrudomcomrules_init;
begin {mrudomcomrules_init}
initsetofenums(enumtable);
initsetofsubranges(subrangetable);
initsetofidents(integertable);
initsetofidents(stringtable);
initsetofidents(booleantable);
initsetofidents(filestable);
initsetofidents(texttable);
initsetofsetofs(settable);
initsetofidents(tabletable.tablenames);
initsetofidents(tabletable.typenames);
initsetofgenericsets(genericsettable);
initsetofrecords(recordtable);
initsetofrecords(procrecordtable);
initsetofcatdefs(categorytable);
initsetofidents(alphabettable);
initsetofsymbols(symboltable);
initsetofwords(wordtable);
end {mrudomcomrules_init};

function checkchar(str:string_string):boolean;
begin
if string_length(str)=1 then checkchar:=true
else checkchar:=false
end;

 procedure mrudomcomrules_writeresults;
var i,nrow:integer;
    str:string_string;
    symbol1:psymbol;
    word1:pword;
    symboltable1:setofsymbols;
    wordtable1:setofwords;
    alphabettable1:setofidents;

procedure writeconstants(var of1:files_text);
begin
files_writestr(of1,'const',files_maxio,0,left);
files_writeline(of1,true);
files_writestr(of1,'     ',files_maxio,0,left);
files_writestring(of1,filename,0,left);
files_writestr(of1,'langspec_nrow = ',files_maxio,0,left);
files_writeinteger(of1,nrow,3,left);
files_writechar(of1,';');
files_writeline(of1,true)
end;

procedure writetypes(var of1:files_text);
var 
    str:string_string;
    recordtable1:setofrecords;
    record1:precord;
    recordname:string_string;
    attribs:setofattribs;
    attrib1:pattrib;
    attribname1,typename1:string_string;
    categorytable1:setofcatdefs;
    catdef1:pcatdef;
    catnames:setofidents;
    genericsettable1:setofgenericsets;
    settable1:setofsetofs;
    attribnames1,typenames1:setofidents;
    genericset1:pgenericset;
    setof1:psetof;
    subrangetable1:setofsubranges;
    subrange1:psubrange;
    enumtable1:setofenums;
    enum1:penum;
    idents:setofidents;
    stringtable1:setofidents;
    integertable1:setofidents;
    texttable1,booleantable1:setofidents;
    i,j:integer;

begin
files_writestr(of1,'type',files_maxio,0,left);
files_writeline(of1,true);


{write integer types:}
integertable1:=integertable;
while stillidents(integertable1) do
   begin
   takeident(str,integertable1);
   files_writestr(of1,'     ',files_maxio,0,left);
   files_writestring(of1,filename,0,left);
   files_writestr(of1,'langspec_',files_maxio,0,left);
   files_writestring(of1,str,0,left);
   files_writestr(of1,'=integer;',files_maxio,0,left);
   files_writeline(of1,true)
   end;

{write string types:}
{stringtable1:=stringtable;
while stillidents(stringtable1) do
   begin
   takeident(str,stringtable1);
   files_writestr(of1,'     ',files_maxio,0,left);
   files_writestring(of1,filename,0,left);
   files_writestr(of1,'langspec_',files_maxio,0,left);
   files_writestring(of1,str,0,left);
   files_writestr(of1,'=tstring_string;',files_maxio,0,left);
   files_writeline(of1,true)
   end;
}

{write boolean types:}
booleantable1:=booleantable;
while stillidents(booleantable1) do
   begin
   takeident(str,booleantable1);
   files_writestr(of1,'     ',files_maxio,0,left);
   files_writestring(of1,filename,0,left);
   files_writestr(of1,'langspec_',files_maxio,0,left);
   files_writestring(of1,str,0,left);
   files_writestr(of1,'=boolean;',files_maxio,0,left);
   files_writeline(of1,true)
   end;

{write text types:}
{texttable1:=texttable;
while stillidents(texttable1) do
   begin
   takeident(str,texttable1);
   files_writestr(of1,'     ',files_maxio,0,left);
   files_writestring(of1,filename,0,left);
   files_writestr(of1,'langspec_',files_maxio,0,left);
   files_writestring(of1,str,0,left);
   files_writestr(of1,'=boolean;',files_maxio,0,left);
   files_writeline(of1,true)
   end;
}

{write enumerative types:}
enumtable1:=enumtable;
while stillenums(enumtable1) do
   begin
   takeenum(enum1,enumtable1);
   files_writestr(of1,'     ',files_maxio,0,left);
   files_writestring(of1,filename,0,left);
   files_writestr(of1,'langspec_',files_maxio,0,left);
   files_writestring(of1,enum1^.typename,0,left);
   files_writestr(of1,' = (',files_maxio,0,left);
   idents:=enum1^.idents;
   takeident(str,idents);
   files_writestring(of1,str,0,left);
   while stillidents(idents) do
   	begin
        takeident(str,idents);
   	files_writestr(of1,',',files_maxio,0,left);
        files_writestring(of1,str,0,left);
   	end;
   files_writechar(of1,')');
   files_writechar(of1,';');
   files_writeline(of1,true)
   end;



{write subrange types:}
subrangetable1:=subrangetable;
while stillsubranges(subrangetable1) do
   begin
   takesubrange(subrange1,subrangetable1);
   files_writestr(of1,'     ',files_maxio,0,left);
   files_writestring(of1,filename,0,left);
   files_writestr(of1,'langspec_',files_maxio,0,left);
   files_writestring(of1,subrange1^.typename,0,left);
   files_writestr(of1,' = ',files_maxio,0,left);
   files_writestring(of1,subrange1^.ident1,0,left);
   files_writestr(of1,'..',files_maxio,0,left);
   files_writestring(of1,subrange1^.ident2,0,left);
   files_writechar(of1,';');
   files_writeline(of1,true)
   end;



{write set of's:}
settable1:=settable;
while stillsetofs(settable1) do
   begin
   takesetof(setof1,settable1);
   files_writestr(of1,'     ',files_maxio,0,left); 
   files_writestring(of1,filename,0,left);
   files_writestr(of1,'langspec_',files_maxio,0,left);
   files_writestring(of1,setof1^.typename1,0,left);
   files_writestr(of1,' = set of ',files_maxio,0,left);
   files_writestring(of1,filename,0,left);
   files_writestr(of1,'langspec_',files_maxio,0,left);
   files_writestring(of1,setof1^.typename2,0,left);
   files_writechar(of1,';');
   files_writeline(of1,true)
   end;
{write local file type:}
   files_writestr(of1,'plosstring',files_maxio,0,left);
   files_writestr(of1,' = ^losstring;',files_maxio,0,left);
   files_writeline(of1,true);
   files_writestr(of1,'losstring',files_maxio,0,left);
   files_writestr(of1,' = record',files_maxio,0,left);
   files_writeline(of1,true);
   files_writestr(of1,'   next:plosstring;',files_maxio,0,left);
   files_writeline(of1,true);
   files_writestr(of1,'   carriage:boolean;',files_maxio,0,left);
   files_writeline(of1,true);
   files_writestr(of1,'   arg:tstring_string',files_maxio,0,left);
   files_writeline(of1,true);
   files_writestr(of1,' end; ',files_maxio,0,left);
   files_writeline(of1,true);
   files_writestr(of1,'localfile',files_maxio,0,left);
   files_writestr(of1,' = record ',files_maxio,0,left);
   files_writeline(of1,true);
   files_writestr(of1,'first,last:plosstring',files_maxio,0,left);
   files_writeline(of1,true);
   files_writestr(of1,' end; ',files_maxio,0,left);
   files_writeline(of1,true);
   
{write generic set types:}

genericsettable1:=genericsettable;
while stillgenericsets(genericsettable1) do
   begin
   takegenericset(genericset1,genericsettable1);
   files_writestring(of1,filename,0,left);
   files_writestr(of1,'langspec_',files_maxio,0,left);
   files_writestring(of1,genericset1^.identifier,0,left);
   files_writestr(of1,' = record ',files_maxio,0,left);
   files_writeline(of1,true);
   attribnames1:=genericset1^.attribs;
   typenames1:=genericset1^.typenames;
   while stillidents(attribnames1) do
   	begin
        takeident(attribname1,attribnames1);
        takeident(typename1,typenames1);
        files_writestring(of1,attribname1,0,left);
        files_writechar(of1,':');
        if (string_comparechars(typename1,'tstring_string',14)<>0) and
           (string_comparechars(typename1,'localfile',9)<>0) then
               begin
               files_writestring(of1,filename,0,left);
               files_writestr(of1,'langspec_',files_maxio,0,left)
               end;
        files_writestring(of1,typename1,0,left);
        files_writechar(of1,';');
        files_writeline(of1,true)
        end;
   files_writeline(of1,true);
   files_writestr(of1,' end; ',files_maxio,0,left);
   files_writeline(of1,true);
   files_writestr(of1,'plos',files_maxio,0,left);
   files_writestring(of1,genericset1^.identifier,0,left);
   files_writestr(of1,' = ^los',files_maxio,0,left);
   files_writestring(of1,genericset1^.identifier,0,left);
   files_writechar(of1,';');
   files_writeline(of1,true);
   files_writestr(of1,'los',files_maxio,0,left);
   files_writestring(of1,genericset1^.identifier,0,left);
   files_writestr(of1,' = record',files_maxio,0,left);
   files_writeline(of1,true);
   files_writestr(of1,'   next:plos',files_maxio,0,left);
   files_writestring(of1,genericset1^.identifier,0,left);
   files_writechar(of1,';');
   files_writeline(of1,true);
   files_writestr(of1,'   arg:',files_maxio,0,left);
   files_writestring(of1,filename,0,left);
   files_writestr(of1,'langspec_',files_maxio,0,left);
   files_writestring(of1,genericset1^.identifier,0,left);
   files_writeline(of1,true);
   files_writestr(of1,' end; ',files_maxio,0,left);
   files_writeline(of1,true);
   files_writestring(of1,filename,0,left);
   files_writestr(of1,'langspec_setof',files_maxio,0,left);
   files_writestring(of1,genericset1^.identifier,0,left);
   files_writestr(of1,'s = record ',files_maxio,0,left);
   files_writeline(of1,true);
   files_writestr(of1,'first,last:plos',files_maxio,0,left);
   files_writestring(of1,genericset1^.identifier,0,left);
   files_writeline(of1,true);
   files_writestr(of1,' end; ',files_maxio,0,left);
   files_writeline(of1,true)
   end;


{write declared records:}
files_writestr(of1,'     ',files_maxio,0,left);
files_writestring(of1,filename,0,left);
files_writestr(of1,'langspec_p',files_maxio,0,left);
files_writestr(of1,'terminal = ^',files_maxio,0,left);
files_writestring(of1,filename,0,left);
files_writestr(of1,'langspec_',files_maxio,0,left);
files_writestr(of1,'terminal',files_maxio,0,left);
files_writechar(of1,';');
files_writeline(of1,true);
files_writestr(of1,'     ',files_maxio,0,left);
files_writestring(of1,filename,0,left);
files_writestr(of1,'langspec_',files_maxio,0,left);
files_writestr(of1,'terminal',files_maxio,0,left);
files_writestr(of1,' = ',files_maxio,0,left);
files_writeline(of1,true);
files_writestr(of1,'record',files_maxio,15,right);
files_writeline(of1,true);
files_writestr(of1,'                       str:tstring_string',
                                                 files_maxio,0,left);
files_writeline(of1,true);
files_writestr(of1,'end;',files_maxio,15,right);
files_writeline(of1,true);

recordtable1:=recordtable;
while stillrecords(recordtable1) do
   begin
   takerecord(record1,recordtable1);
   recordname:=record1^.recordname;
   attribs:=record1^.attribs;
   files_writestr(of1,'     ',files_maxio,0,left);
   files_writestring(of1,filename,0,left);
   files_writestr(of1,'langspec_p',files_maxio,0,left);
   files_writestring(of1,recordname,0,right);
   files_writestr(of1,' = ^',files_maxio,0,left);
   files_writestring(of1,filename,0,left);
   files_writestr(of1,'langspec_',files_maxio,0,left);
   files_writestring(of1,recordname,0,right);
   files_writechar(of1,';');
   files_writeline(of1,true);
   files_writestr(of1,'     ',files_maxio,0,left);
   files_writestring(of1,filename,0,left);
   files_writestr(of1,'langspec_',files_maxio,0,left);
   files_writestring(of1,recordname,0,right);
   files_writestr(of1,' = ',files_maxio,0,left);
   files_writeline(of1,true);
   files_writestr(of1,'record',files_maxio,15,right);
   files_writeline(of1,true);
   while stillattribs(attribs) do
   	begin
        takeattrib(attrib1,attribs);
   	files_writestring(of1,attrib1^.attribname,
                                      converttoio(string_length(str)+18),right);
        files_writechar(of1,':');
        if (string_comparechars(attrib1^.typename,'tstring_string',14)<>0) and
           (string_comparechars(attrib1^.typename,'localfile',9)<>0) then
                begin
                files_writestring(of1,filename,0,left);
   		files_writestr(of1,'langspec_',files_maxio,0,left)
                end;
        files_writestring(of1,attrib1^.typename,0,left);
        files_writechar(of1,';');
        files_writeline(of1,true)
   	end;
   files_writestr(of1,'end;',files_maxio,15,right);
   files_writeline(of1,true)
   end;



{write syntcat:}
categorytable1:=categorytable;
files_writestr(of1,'     ',files_maxio,0,left);
files_writestring(of1,filename,0,left);
files_writestr(of1,'langspec_category = (comment,identifier'
   							,files_maxio,0,left);
i:=0;
takecatdef(catdef1,categorytable1);
catnames:=catdef1^.catnames;
while stillidents(catnames) do
   begin
   takeident(str,catnames);
   files_writechar(of1,',');
   files_writestring(of1,str,0,left);
   i:=i+1;
   end;
while stillcatdefs(categorytable1) do
   begin
   takecatdef(catdef1,categorytable1);
   catnames:=catdef1^.catnames;
   while stillidents(catnames) do
      begin
      takeident(str,catnames);
      files_writechar(of1,',');
      files_writestring(of1,str,0,left);
      i:=i+1
      end
   end;
files_writechar(of1,')');
files_writechar(of1,';');
files_writeline(of1,true);
files_writeline(of1,true);


{write main record:}
files_writestring(of1,filename,0,left);
files_writestr(of1,'langspec_pfielddef = ^',files_maxio,0,left);
files_writestring(of1,filename,0,left);
files_writestr(of1,'langspec_fielddef;',
   					files_maxio,0,left);
files_writeline(of1,true);
files_writestring(of1,filename,0,left);
files_writestr(of1,'langspec_fielddef =',files_maxio,0,left);
files_writeline(of1,true);
files_writestr(of1,'record',files_maxio,15,right);
files_writeline(of1,true);
files_writestr(of1,'case cat:',files_maxio,15,right);
files_writestring(of1,filename,0,left);
files_writestr(of1,'langspec_category of',files_maxio,0,left);
files_writeline(of1,true);
categorytable1:=categorytable;
while stillcatdefs(categorytable1) do
   begin
   takecatdef(catdef1,categorytable1);
   catnames:=catdef1^.catnames;
   if string_comparechars(catdef1^.recordname,'terminal',8)<>0 then
     begin
     while stillidents(catnames) do
        begin
        takeident(str,catnames);
        files_writestring(of1,str,converttoio(string_length(str)+18),right);
        files_writechar(of1,':');
        files_writeline(of1,true);
        files_writestr(of1,' ',files_maxio,21,right);
        files_writechar(of1,'(');
        files_writestring(of1,str,0,left);
        files_writestr(of1,'field:',files_maxio,0,left);
        files_writestring(of1,filename,0,left);
        files_writestr(of1,'langspec_p',files_maxio,0,left);
        files_writestring(of1,catdef1^.recordname,0,left);
        files_writechar(of1,')');
        files_writechar(of1,';');
        files_writeline(of1,true)
        end
     end
   else
     begin
     files_writestr(of1,'identifier',files_maxio,0,left);
     if stillidents(catnames) then files_writechar(of1,',')
       else files_writechar(of1,':');
     while stillidents(catnames) do
        begin
        takeident(str,catnames);
        files_writestring(of1,str,converttoio(string_length(str)+18),right);
        if stillidents(catnames) then files_writechar(of1,',')
          else files_writechar(of1,':');
        files_writeline(of1,true)
        end;
     files_writestr(of1,' ',files_maxio,21,right);
     files_writechar(of1,'(');
     files_writestr(of1,'terminal:',files_maxio,15,right);
     files_writestring(of1,filename,0,left);
     files_writestr(of1,'langspec_pterminal',files_maxio,0,left);
     files_writechar(of1,')');
     files_writechar(of1,';');
     files_writeline(of1,true)
     end
   end;
files_writestr(of1,'end;',files_maxio,15,right);
files_writeline(of1,true);
files_writeline(of1,true)
end;

procedure writesetfunctions(var of1,of2:files_text);
var genericsettable1:setofgenericsets;
    genericset1:pgenericset;
    identifier1:string_string;
    
begin
   files_writestr(of1,'procedure initint',files_maxio,0,left);
   files_writestr(of1,'(var s:integer);external;',files_maxio,0,left);
   files_writeline(of1,true);
   files_writestr(of2,'procedure initint',files_maxio,0,left);
   files_writestr(of2,'(var s:integer);',files_maxio,0,left);
   files_writeline(of2,true);
   files_writestr(of2,'begin',files_maxio,0,left);
   files_writeline(of2,true);
   files_writestr(of2,'s:=0;',files_maxio,0,left);
   files_writeline(of2,true);
   files_writestr(of2,'end;',files_maxio,0,left);
   files_writeline(of2,true);
   files_writestr(of1,'procedure initbool',files_maxio,0,left);
   files_writestr(of1,'(var s:boolean);external;',files_maxio,0,left);
   files_writeline(of1,true);
   files_writestr(of2,'procedure initbool',files_maxio,0,left);
   files_writestr(of2,'(var s:boolean);',files_maxio,0,left);
   files_writeline(of2,true);
   files_writestr(of2,'begin',files_maxio,0,left);
   files_writeline(of2,true);
   files_writestr(of2,'s:=false;',files_maxio,0,left);
   files_writeline(of2,true);
   files_writestr(of2,'end;',files_maxio,0,left);
   files_writeline(of2,true);
genericsettable1:=genericsettable;
while stillgenericsets(genericsettable1) do
   begin
   takegenericset(genericset1,genericsettable1);
   identifier1:=genericset1^.identifier;
   files_writestr(of1,'procedure initsetof',files_maxio,0,left);
   files_writestring(of1,identifier1,0,left);
   files_writestr(of1,'s(var s:',files_maxio,0,left);
   files_writestring(of1,filename,0,left);
   files_writestr(of1,'langspec_setof',files_maxio,0,left);
   files_writestring(of1,identifier1,0,left);
   files_writestr(of1,'s); external;',files_maxio,0,left);
   files_writeline(of1,true);
   files_writestr(of2,'procedure initsetof',files_maxio,0,left);
   files_writestring(of2,identifier1,0,left);
   files_writestr(of2,'s(var s:',files_maxio,0,left);
   files_writestring(of2,filename,0,left);
   files_writestr(of2,'langspec_setof',files_maxio,0,left);
   files_writestring(of2,identifier1,0,left);
   files_writestr(of2,'s);',files_maxio,0,left);
   files_writeline(of2,true);
   files_writestr(of2,'begin',files_maxio,0,left);
   files_writeline(of2,true);
   files_writestr(of2,'s.first:=nil;s.last:=nil',files_maxio,0,left);
   files_writeline(of2,true);
   files_writestr(of2,'end;',files_maxio,0,left);
   files_writeline(of2,true);

   files_writestr(of1,'function still',files_maxio,0,left);
   files_writestring(of1,identifier1,0,left);
   files_writestr(of1,'s(var s:',files_maxio,0,left);
   files_writestring(of1,filename,0,left);
   files_writestr(of1,'langspec_setof',files_maxio,0,left);
   files_writestring(of1,identifier1,0,left);
   files_writestr(of1,'s):boolean; external;',files_maxio,0,left);
   files_writeline(of1,true);
   files_writestr(of2,'function still',files_maxio,0,left);
   files_writestring(of2,identifier1,0,left);
   files_writestr(of2,'s(var s:',files_maxio,0,left);
   files_writestring(of2,filename,0,left);
   files_writestr(of2,'langspec_setof',files_maxio,0,left);
   files_writestring(of2,identifier1,0,left);
   files_writestr(of2,'s):boolean;',files_maxio,0,left);
   files_writeline(of2,true);
   files_writestr(of2,'begin',files_maxio,0,left);
   files_writeline(of2,true);
   files_writestr(of2,'if s.first<>nil then still'
   						,files_maxio,0,left);
   files_writestring(of2,identifier1,0,left);
   files_writestr(of2,'s:= true',files_maxio,0,left);
   files_writeline(of2,true);
   files_writestr(of2,'else still',files_maxio,0,left);
   files_writestring(of2,identifier1,0,left);
   files_writestr(of2,'s:= false',files_maxio,0,left);
   files_writeline(of2,true);
   files_writestr(of2,'end;',files_maxio,0,left);
   files_writeline(of2,true);

   files_writestr(of1,'procedure take',files_maxio,0,left);
   files_writestring(of1,identifier1,0,left);
   files_writestr(of1,'(var ',files_maxio,0,left);
   files_writestring(of1,identifier1,0,left);
   files_writestr(of1,'1:',files_maxio,0,left);
   files_writestring(of1,filename,0,left);
   files_writestr(of1,'langspec_',files_maxio,0,left);
   files_writestring(of1,identifier1,0,left);
   files_writeline(of1,true);
   files_writestr(of1,';var s:',files_maxio,15,right);
   files_writestring(of1,filename,0,left);
   files_writestr(of1,'langspec_setof',files_maxio,0,left);
   files_writestring(of1,identifier1,0,left);
   files_writestr(of1,'s); external;',files_maxio,0,left);
   files_writeline(of1,true);

   files_writestr(of2,'procedure take',files_maxio,0,left);
   files_writestring(of2,identifier1,0,left);
   files_writestr(of2,'(var ',files_maxio,0,left);
   files_writestring(of2,identifier1,0,left);
   files_writestr(of2,'1:',files_maxio,0,left);
   files_writestring(of2,filename,0,left);
   files_writestr(of2,'langspec_',files_maxio,0,left);
   files_writestring(of2,identifier1,0,left);
   files_writeline(of2,true);
   files_writestr(of2,';var s:',files_maxio,15,right);
   files_writestring(of2,filename,0,left);
   files_writestr(of2,'langspec_setof',files_maxio,0,left);
   files_writestring(of2,identifier1,0,left);
   files_writestr(of2,'s);',files_maxio,0,left);
   files_writeline(of2,true);

   files_writestr(of2,'begin',files_maxio,0,left);
   files_writeline(of2,true);
   files_writestr(of2,'if s.first=nil then '
   						,files_maxio,0,left);
   files_writestr(of2,'begin end',files_maxio,0,left);
   files_writeline(of2,true);
   files_writestr(of2,'else begin ',files_maxio,0,left);
   files_writestring(of2,identifier1,0,left);
   files_writestr(of2,'1:=s.first^.arg;',files_maxio,0,left);
   files_writeline(of2,true);
   files_writestr(of2,'     if s.first=s.last then ',files_maxio,0,left);
   files_writeline(of2,true);
   files_writestr(of2,'     begin s.first:=nil;s.last:=nil end',files_maxio,0,left);
   files_writeline(of2,true);
   files_writestr(of2,'     else s.first:=s.first^.next',files_maxio,0,left);
   files_writeline(of2,true);
   files_writestr(of2,'     end',files_maxio,0,left);
   files_writeline(of2,true);
   files_writestr(of2,'end;',files_maxio,0,left);
   files_writeline(of2,true);

   files_writestr(of1,'procedure append',files_maxio,0,left);
   files_writestring(of1,identifier1,0,left);
   files_writestr(of1,'(',files_maxio,0,left);
   files_writestring(of1,identifier1,0,left);
   files_writestr(of1,'1:',files_maxio,0,left);
   files_writestring(of1,filename,0,left);
   files_writestr(of1,'langspec_',files_maxio,0,left);
   files_writestring(of1,identifier1,0,left);
   files_writeline(of1,true);
   files_writestr(of1,';var s:',files_maxio,15,right);
   files_writestring(of1,filename,0,left);
   files_writestr(of1,'langspec_setof',files_maxio,0,left);
   files_writestring(of1,identifier1,0,left);
   files_writestr(of1,'s); external;',files_maxio,0,left);
   files_writeline(of1,true);

   files_writestr(of2,'procedure append',files_maxio,0,left);
   files_writestring(of2,identifier1,0,left);
   files_writestr(of2,'(',files_maxio,0,left);
   files_writestring(of2,identifier1,0,left);
   files_writestr(of2,'1:',files_maxio,0,left);
   files_writestring(of2,filename,0,left);
   files_writestr(of2,'langspec_',files_maxio,0,left);
   files_writestring(of2,identifier1,0,left);
   files_writeline(of2,true);
   files_writestr(of2,';var s:',files_maxio,15,right);
   files_writestring(of2,filename,0,left);
   files_writestr(of2,'langspec_setof',files_maxio,0,left);
   files_writestring(of2,identifier1,0,left);
   files_writestr(of2,'s);',files_maxio,0,left);
   files_writeline(of2,true);
   files_writestr(of2,'var p:plos',files_maxio,0,left);
   files_writestring(of2,identifier1,0,left);
   files_writechar(of2,';');
   files_writeline(of2,true);
   files_writestr(of2,'begin',files_maxio,0,left);
   files_writeline(of2,true);
   files_writestr(of2,'MEM_newdefault(loopholes.sizeof(los',files_maxio,0,left);
   files_writestring(of2,identifier1,0,left);
   files_writestr(of2,'),loopholes.retype(p,MEM_ptr));',files_maxio,0,left);
   files_writeline(of2,true);
   files_writestr(of2,'p^.arg:=',files_maxio,0,left);
   files_writestring(of2,identifier1,0,left);
   files_writestr(of2,'1;',files_maxio,0,left);
   files_writeline(of2,true);
   files_writestr(of2,'p^.next:=nil;',files_maxio,0,left);
   files_writestr(of2,'if s.first=nil then begin',files_maxio,0,left);
   files_writeline(of2,true);
   files_writestr(of2,'s.first:=p;s.last:=p end',files_maxio,0,left);
   files_writeline(of2,true);
   files_writestr(of2,'else begin s.last^.next:=p;',files_maxio,0,left);
   files_writeline(of2,true);
   files_writestr(of2,'s.last:=p end',files_maxio,0,left);
   files_writeline(of2,true);
   files_writestr(of2,'end;',files_maxio,0,left);
   files_writeline(of2,true)
   end
end;

procedure writemakefunctions(var of1,of2:files_text);
var notfirst:boolean;
    categorytable1:setofcatdefs;
    catdef1:pcatdef;
    catnames:setofidents;
    str:string_string;

procedure writeomegarecordbody(var of1:files_text;recordname:string_string);
var 
    record1:precord;
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
   if string_compare(record1^.recordname,recordname)=0 then recordfound:=true
   end;
if recordfound then
  begin
  files_writestr(of1,'begin',files_maxio,0,left);
  files_writeline(of1,true); 
      files_writestr(of1,'MEM_newdefault(loopholes.sizeof(',files_maxio,0,left);
   files_writestring(of1,filename,0,left);
   files_writestr(of1,'langspec_',files_maxio,0,left);
   files_writestring(of1,recordname,0,left);   files_writestr(of1,'),loopholes.retype(rec,MEM_ptr));',files_maxio,0,left);
   files_writeline(of1,true);
 attribs:=record1^.attribs;
  while stillattribs(attribs) do
   begin
   takeattrib(attrib1,attribs);
   files_writechar(of1,';');
   files_writeline(of1,true);

   if string_comparechars(attrib1^.valeu,'empty',5)=0 then
   	begin
   	{files_writestr(of1,'string_constantempty(',files_maxio,0,left);
        files_writestr(of1,'rec^.',files_maxio,0,left);
        files_writestring(of1,attrib1^.attribname,0,left);
        files_writechar(of1,')')}
        end
   else
        begin
        files_writestr(of1,'rec^.',files_maxio,0,left);
      	files_writestring(of1,attrib1^.attribname,0,left);
   	files_writechar(of1,':');
   	files_writechar(of1,'=');
   	files_writestring(of1,attrib1^.valeu,0,left)
        end
   end;
  files_writeline(of1,true);
  files_writestr(of1,'end;',files_maxio,0,left);
  files_writeline(of1,true)
  end
else begin
     if (string_comparechars(recordname,'terminal',8)<>0) then
       writeln('record ',recordname,' has been used but not defined')
     end
end;{writeomega}

begin{writemakefunctions}
categorytable1:=categorytable;
while stillcatdefs(categorytable1) do
   begin
   takecatdef(catdef1,categorytable1);
   catnames:=catdef1^.catnames;
   if string_comparechars(catdef1^.recordname,'terminal',8)<>0 then
     begin
     while stillidents(catnames) do
   	begin
        takeident(str,catnames);
        files_writestr(of1,' procedure ',files_maxio,15,right);
        files_writestring(of1,filename,0,left);
        files_writestr(of1,'maket_',files_maxio,0,left); 
        files_writestring(of1,str,0,left);
        files_writestr(of1,'(',files_maxio,0,left);
        files_writeline(of1,true);
        files_writestr(of1,'     var stree1: ',files_maxio,15,right); 
        files_writestring(of1,filename,0,left);
        files_writestr(of1,'decl_psnode',
   						files_maxio,0,left);
        files_writestr(of1,');   external;',files_maxio,0,left);
        files_writeline(of1,true);
        files_writestr(of2,' procedure ',files_maxio,15,right);
        files_writestring(of2,filename,0,left);
        files_writestr(of2,'maket_',files_maxio,0,left); 
        files_writestring(of2,str,0,left);
        files_writestr(of2,'(',files_maxio,0,left);
        files_writeline(of2,true);
        files_writestr(of2,'    var stree1:',files_maxio,0,left);
        files_writestring(of2,filename,0,left);
        files_writestr(of2,'decl_psnode',files_maxio,0,left);
        files_writestr(of2,');',files_maxio,0,left);
        files_writeline(of2,true);

{!!!!
 !!!!   write body make functions for snodes:}
  
        files_writestr(of2,'begin',files_maxio,0,left);
        files_writeline(of2,true);
        files_writestr(of2,'MEM_newdefault(loopholes.sizeof(',files_maxio,0,left);
        files_writestring(of2,filename,0,left);
        files_writestr(of2,'decl_snode',files_maxio,0,left);
files_writestr(of2,'),loopholes.retype(stree1,MEM_ptr));',files_maxio,0,left);
        files_writeline(of2,true);
        files_writestr(of2,'stree1^.cat:=',files_maxio,0,left);
        files_writestring(of2,str,0,left);
        files_writechar(of2,';');
        files_writeline(of2,true);
        files_writestring(of2,filename,0,left);
        files_writestr(of2,'maket_',files_maxio,0,left);
        files_writestring(of2,str,0,left);
        files_writestr(of2,'rec(stree1^.ldfield.',files_maxio,0,left);
        files_writestring(of2,str,0,left);
        files_writestr(of2,'field)',files_maxio,0,left);
        files_writeline(of2,true);
        files_writestr(of2,'end;',files_maxio,0,left);
        files_writeline(of2,true);
{!!!!
!!!!}
        files_writestr(of1,' procedure ',files_maxio,15,right);
        files_writestring(of1,filename,0,left);
        files_writestr(of1,'maket_',files_maxio,0,left); 
        files_writestring(of1,str,0,left);
        files_writestr(of1,'rec(',files_maxio,0,left);
        files_writeline(of1,true);
        files_writestr(of1,'    var rec:',files_maxio,0,left);
        files_writestring(of1,filename,0,left);
        files_writestr(of1,'langspec_p',files_maxio,0,left);
        files_writestring(of1,catdef1^.recordname,0,left);
        files_writestr(of1,');   external;',files_maxio,0,left);
        files_writeline(of1,true);
        files_writestr(of2,' procedure ',files_maxio,15,right);
        files_writestring(of2,filename,0,left);
        files_writestr(of2,'maket_',files_maxio,0,left); 
        files_writestring(of2,str,0,left);
        files_writestr(of2,'rec(',files_maxio,0,left);
        files_writeline(of2,true);
        files_writestr(of2,'     var rec:',files_maxio,0,left);
        files_writestring(of2,filename,0,left);
        files_writestr(of2,'langspec_p',files_maxio,0,left);
        files_writestring(of2,catdef1^.recordname,0,left);
        files_writestr(of2,');',files_maxio,0,left);
        files_writeline(of2,true);
        writeomegarecordbody(of2,catdef1^.recordname)
   	end
     end
   end
end;

procedure writewritefunctions(var of2:files_text);
var notfirst:boolean;
    categorytable1:setofcatdefs;
    catdef1:pcatdef;
    catnames:setofidents;
    str:string_string;
procedure writetableinits(var of1:files_text);
var table1:tables;
    ident1,ident2:string_string;
begin
table1:=tabletable;
while stillidents(table1.tablenames) do
   begin
   takeident(ident1,table1.tablenames);
   takeident(ident2,table1.typenames);
   files_writestr(of1,'writeln(of1,''init',files_maxio,0,left);
   files_writestring(of1,ident2,0,left);
   files_writestr(of1,'(',files_maxio,0,left);
   files_writestring(of1,ident1,0,left);
   files_writestr(of1,');'');',files_maxio,0,left);
   files_writeline(of1,true)
   end;
end;
procedure writetablenames(var of1:files_text);
var table1:tables;
    ident1,ident2:string_string;
begin
table1:=tabletable;
while stillidents(table1.tablenames) do
   begin
   takeident(ident1,table1.tablenames);
   takeident(ident2,table1.typenames);
   files_writestr(of1,'writeln(of1,''',files_maxio,0,left);
   files_writestring(of1,ident1,0,left);
   files_writestr(of1,':',files_maxio,15,right);
   files_writestring(of1,filename,0,left);
   files_writestr(of1,'langspec_',files_maxio,0,left);
   files_writestring(of1,ident2,0,left);
   files_writestr(of1,';'');',files_maxio,0,left);
   files_writeline(of1,true)
   end
end;

procedure writefilenames(var of1:files_text);
var
    filestable1:setofidents;
    filename1:string_string;
begin
filestable1:=filestable;
while stillidents(filestable1) do
   begin
   takeident(filename1,filestable1);
   files_writestr(of1,'writeln(of1,''',files_maxio,0,left);
   files_writestring(of1,filename1,0,left);
   files_writestr(of1,':files_text;'');',files_maxio,0,left);
   files_writeline(of1,true)
   end
end;

procedure writebodygheadings(var of1:files_text;catname,recordname:string_string);
var record1:precord;
    recordtable1:setofrecords;
    recordfound:boolean;
    attribs:setofattribs;
    attrib1:pattrib;
begin{writebodygheadings}
recordtable1:=recordtable;
recordfound:=false;
while stillrecords(recordtable1) and not(recordfound) do
   begin
   takerecord(record1,recordtable1);
   if string_compare(record1^.recordname,recordname)=0 then recordfound:=true
   end;
if recordfound then
   begin
   attribs:=record1^.inhattribs;
   files_writeline(of1,true);
   while stillattribs(attribs) do
  	 begin
         takeattrib(attrib1,attribs);
         files_writestr(of1,'writeln(of1,''',files_maxio,0,left);
         files_writestring(of1,catname,0,left);
         files_writestr(of1,'__',files_maxio,0,left);
         files_writestring(of1,attrib1^.attribname,0,left);
         files_writestr(of1,':',files_maxio,15,right);
         if (string_comparechars(attrib1^.typename,'tstring_string',14)<>0) and
            (string_comparechars(attrib1^.typename,'localfile',9)<>0) then
                begin
                files_writestring(of1,filename,0,left);
                files_writestr(of1,'langspec_',files_maxio,0,left);
                end;
         files_writestring(of1,attrib1^.typename,0,left);
         files_writestr(of1,''');',files_maxio,0,left);
         files_writeline(of1,true);
         files_writestr(of1,'write(of1,'';'');',files_maxio,0,left);
         files_writeline(of1,true)
         end;
   attribs:=record1^.synattribs;
   while stillattribs(attribs) do
  	 begin
         takeattrib(attrib1,attribs);
         files_writestr(of1,'writeln(of1,''',files_maxio,0,left);
         files_writestring(of1,catname,0,left);
         files_writestr(of1,'__',files_maxio,0,left);
         files_writestring(of1,attrib1^.attribname,0,left);
         files_writestr(of1,':',files_maxio,15,right);
         if (string_comparechars(attrib1^.typename,'tstring_string',14)<>0) and
            (string_comparechars(attrib1^.typename,'localfile',9)<>0) then
                begin
                files_writestring(of1,filename,0,left);
                files_writestr(of1,'langspec_',files_maxio,0,left);
                end;
         files_writestring(of1,attrib1^.typename,0,left);
         files_writestr(of1,''');',files_maxio,0,left);
         files_writeline(of1,true);
         files_writestr(of1,'write(of1,'';'');',files_maxio,0,left);
         files_writeline(of1,true)
         end;
   files_writeline(of1,true)
   end
end;

procedure writebodyhheadings(var of1:files_text;catname,recordname:string_string);
var record1:precord;
    recordtable1:setofrecords;
    recordfound:boolean;
    attribs:setofattribs;
    attrib1:pattrib;
begin{writebodyhheadings}
recordtable1:=recordtable;
recordfound:=false;
while stillrecords(recordtable1) and not(recordfound) do
   begin
   takerecord(record1,recordtable1);
   if string_compare(record1^.recordname,recordname)=0 then recordfound:=true
   end;
if recordfound then
   begin
   attribs:=record1^.inhattribs;
   files_writeline(of1,true);
   if stillattribs(attribs) or stillattribs(record1^.synattribs) then
       files_writestr(of1,'write(of1,'';'');',files_maxio,0,left);
   files_writeline(of1,true);
   while stillattribs(attribs) do
  	 begin
         takeattrib(attrib1,attribs);
         files_writestr(of1,'writeln(of1,''',files_maxio,0,left);
         files_writestring(of1,catname,0,left);
         files_writechar(of1,'_');
         files_writestring(of1,attrib1^.attribname,0,left);
         files_writestr(of1,':',files_maxio,15,right);
         if (string_comparechars(attrib1^.typename,'tstring_string',14)<>0) and
            (string_comparechars(attrib1^.typename,'localfile',9)<>0) then
                begin
                files_writestring(of1,filename,0,left);
                files_writestr(of1,'langspec_',files_maxio,0,left);
                end;
         files_writestring(of1,attrib1^.typename,0,left);
         files_writestr(of1,''');',files_maxio,0,left);
         files_writeline(of1,true);
         if stillattribs(attribs) or stillattribs(record1^.synattribs) then
                begin
                files_writeline(of1,true);
   		files_writestr(of1,'write(of1,'';'');',
   							files_maxio,0,left);
                files_writeline(of1,true)
                end
         end;
   attribs:=record1^.synattribs;
   while stillattribs(attribs) do
  	 begin
         takeattrib(attrib1,attribs);
         files_writestr(of1,'writeln(of1,''var ',files_maxio,0,left);
         files_writestring(of1,catname,0,left);
         files_writechar(of1,'_');
         files_writestring(of1,attrib1^.attribname,0,left);
         files_writestr(of1,':',files_maxio,15,right);
         if (string_comparechars(attrib1^.typename,'tstring_string',14)<>0) and
            (string_comparechars(attrib1^.typename,'localfile',9)<>0) then
                begin
                files_writestring(of1,filename,0,left);
                files_writestr(of1,'langspec_',files_maxio,0,left);
                end;
         files_writestring(of1,attrib1^.typename,0,left);
         files_writestr(of1,''');',files_maxio,0,left);
         files_writeline(of1,true);
         if stillattribs(attribs) then
                begin
                files_writeline(of1,true);
   		files_writestr(of1,'write(of1,'';'');',
                                                      files_maxio,0,left);
                files_writeline(of1,true)
                end
         end;
   files_writeline(of1,true)
   end
end;

procedure writebodyiheadings(var of1:files_text;catname,recordname:string_string);
var record1:precord;
    recordtable1:setofrecords;
    recordfound:boolean;
    attribs:setofattribs;
    attrib1:pattrib;
begin{writebodyiheadings}
recordtable1:=recordtable;
recordfound:=false;
while stillrecords(recordtable1) and not(recordfound) do
   begin
   takerecord(record1,recordtable1);
   if string_compare(record1^.recordname,recordname)=0 then recordfound:=true
   end;
if recordfound then
   begin
   attribs:=record1^.inhattribs;
   if stillattribs(attribs) or stillattribs(record1^.synattribs) then
   	files_writestr(of1,'write(of1,'','');',files_maxio,0,left);
   while stillattribs(attribs) do
  	 begin
         takeattrib(attrib1,attribs);
         files_writestr(of1,'writeln(of1,''',files_maxio,0,left);
         files_writestring(of1,catname,0,left);
         files_writestr(of1,'__',files_maxio,0,left);
         files_writestring(of1,attrib1^.attribname,0,left);
         files_writestr(of1,''');',files_maxio,0,left);
         files_writeline(of1,true);
         if stillattribs(attribs) or stillattribs(record1^.synattribs) then
                begin
                files_writeline(of1,true);
   		files_writestr(of1,'write(of1,'','');',files_maxio,0,left);
                files_writeline(of1,true)
                end
         end;
   attribs:=record1^.synattribs;
   while stillattribs(attribs) do
  	 begin
         takeattrib(attrib1,attribs);
         files_writestr(of1,'writeln(of1,''',files_maxio,0,left);
         files_writestring(of1,catname,0,left);
         files_writestr(of1,'__',files_maxio,0,left);
         files_writestring(of1,attrib1^.attribname,0,left);
         files_writestr(of1,''');',files_maxio,0,left);
         files_writeline(of1,true);
         if stillattribs(attribs) then
                begin
                files_writeline(of1,true);
   		files_writestr(of1,'write(of1,'','');',
                                                      files_maxio,0,left);
                files_writeline(of1,true)
                end
         end;
   files_writeline(of1,true)
   end
end;

begin{writewritefunctions}
files_writestr(of2,' function ',files_maxio,15,right);
files_writestr(of2,'mrusurcomwrite_compname:string;',files_maxio,0,left); 
files_writeline(of2,true);
files_writestr(of2,' VAR filestr:STRING_string;',files_maxio,15,right);
files_writeline(of2,true);
files_writestr(of2,'begin',files_maxio,0,left);
files_writeline(of2,true);
files_writestr(of2,'filestr:=''',files_maxio,0,left);
files_writestring(of2,filename,0,left);
files_writestr(of2,''';',files_maxio,0,left);
files_writeline(of2,true);
files_writestr(of2,'STRING_LowerCase(',files_maxio,0,left);
files_writestring(of2,'filestr',0,left);
files_writestr(of2,',',files_maxio,0,left);
files_writestring(of2,'filestr',0,left);
files_writestr(of2,');',files_maxio,0,left);
files_writeline(of2,true);
files_writestr(of2,'mrusurcomwrite_compname:=filestr;',files_maxio,0,left);
files_writeline(of2,true);
files_writestr(of2,'end;',files_maxio,0,left);
files_writeline(of2,true);

files_writestr(of2,' procedure ',files_maxio,15,right);
files_writestr(of2,'mrusurcomwrite_',files_maxio,0,left); 
files_writestr(of2,'init(',files_maxio,0,left);
files_writeline(of2,true);
files_writestr(of2,'    var of1:text',
   						files_maxio,0,left);
files_writestr(of2,');',files_maxio,0,left);
files_writeline(of2,true);
files_writestr(of2,'begin',files_maxio,0,left);
files_writeline(of2,true);
writetableinits(of2);
files_writestr(of2,'end;',files_maxio,0,left);
files_writeline(of2,true);
files_writestr(of2,' procedure ',files_maxio,15,right);
files_writestr(of2,'mrusurcomwrite_',files_maxio,0,left); 
files_writestr(of2,'tables(',files_maxio,0,left);
files_writeline(of2,true);
files_writestr(of2,'    var of1:text',
   						files_maxio,0,left);
files_writestr(of2,');',files_maxio,0,left);
files_writeline(of2,true);
files_writestr(of2,'begin',files_maxio,0,left);
files_writeline(of2,true);
writetablenames(of2);
files_writestr(of2,'end;',files_maxio,0,left);
files_writeline(of2,true);
files_writestr(of2,' procedure ',files_maxio,15,right);
files_writestr(of2,'mrusurcomwrite_',files_maxio,0,left); 
files_writestr(of2,'inhsynatts(',files_maxio,0,left);
files_writeline(of2,true);
files_writestr(of2,'    var of1:text',
   						files_maxio,0,left);
files_writestr(of2,');',files_maxio,0,left);
files_writeline(of2,true);
files_writestr(of2,'begin',files_maxio,0,left);
files_writeline(of2,true);
        
categorytable1:=categorytable;
while stillcatdefs(categorytable1) do
   begin
   takecatdef(catdef1,categorytable1);
   catnames:=catdef1^.catnames;
   if string_comparechars(catdef1^.recordname,'terminal',8)<>0 then
     begin
     while stillidents(catnames) do
   	begin
        takeident(str,catnames);
        writebodygheadings(of2,str,catdef1^.recordname)
        end
     end
   end;
writefilenames(of2);
files_writestr(of2,'end;',files_maxio,0,left);
files_writeline(of2,true);
files_writestr(of2,' procedure ',files_maxio,15,right);
files_writestr(of2,'mrusurcomwrite_',files_maxio,0,left); 
files_writestr(of2,'heading(catname:string;',files_maxio,0,left);
files_writeline(of2,true);
files_writestr(of2,'    var of1:text',
   						files_maxio,0,left);
files_writestr(of2,');',files_maxio,0,left);
files_writeline(of2,true);
files_writestr(of2,'begin',files_maxio,0,left);
files_writeline(of2,true);
        
categorytable1:=categorytable;
while stillcatdefs(categorytable1) do
   begin
   if categorytable.first<>categorytable1.first then notfirst:=true
   else notfirst:=false;
   takecatdef(catdef1,categorytable1);
   catnames:=catdef1^.catnames;
   if string_comparechars(catdef1^.recordname,'terminal',8)<>0 then
     begin
     if notfirst then files_writechar(of2,';');
     while stillidents(catnames) do
   	begin
        takeident(str,catnames);
        files_writestr(of2,'if catname = ''',files_maxio,0,left);
        files_writestring(of2,str,0,left);
        files_writestr(of2,''' then begin ',files_maxio,0,left);
        files_writeline(of2,true);
        writebodyhheadings(of2,str,catdef1^.recordname);
        files_writestr(of2,'end',files_maxio,0,left);
        if stillidents(catnames) then files_writechar(of2,';');
        files_writeline(of2,true)
        end
     end
   end;
files_writestr(of2,'end;',files_maxio,0,left);
files_writeline(of2,true);
files_writestr(of2,' procedure ',files_maxio,15,right);
files_writestr(of2,'mrusurcomwrite_',files_maxio,0,left); 
files_writestr(of2,'callist(catname:string;',files_maxio,0,left);
files_writeline(of2,true);
files_writestr(of2,'    var of1:text',
   						files_maxio,0,left);
files_writestr(of2,');',files_maxio,0,left);
files_writeline(of2,true);
files_writestr(of2,'begin',files_maxio,0,left);
files_writeline(of2,true);
        
categorytable1:=categorytable;
while stillcatdefs(categorytable1) do
   begin
   if categorytable.first<>categorytable1.first then notfirst:=true 
   else notfirst:=false;
   takecatdef(catdef1,categorytable1);
   catnames:=catdef1^.catnames;
   if string_comparechars(catdef1^.recordname,'terminal',8)<>0 then
     begin
     if notfirst then files_writechar(of2,';');
     while stillidents(catnames) do
   	begin
        takeident(str,catnames);
        files_writestr(of2,'if catname = ''',files_maxio,0,left);
        files_writestring(of2,str,0,left);
        files_writestr(of2,''' then begin ',files_maxio,0,left);
        files_writeline(of2,true);
        writebodyiheadings(of2,str,catdef1^.recordname);
        files_writestr(of2,'end',files_maxio,0,left);
        if stillidents(catnames) then files_writechar(of2,';');
        files_writeline(of2,true)
        end
     end;
   if stillcatdefs(categorytable1) then files_writechar(of2,';')
   end;
files_writestr(of2,'end;',files_maxio,0,left);
files_writeline(of2,true);
end;

begin {mrudomcomrules_writeresults}


{write domain definitions:}
files_open(of1,'domainenv',10,3);
files_writestr(of1,'pragma c_include(',files_maxio,0,left);
files_writechar(of1,chr(39));
files_writestr(of1,'tstring.pf',files_maxio,0,left);
files_writechar(of1,chr(39));
files_writestr(of1,');', files_maxio,0,left);
files_writeline(of1,true);
files_writestr(of1,'package ',files_maxio,0,left);
files_writestring(of1,filename,0,left);
files_writestr(of1,'langspec;',
               files_maxio,0,left);
files_writeline(of1,true);
files_writestr(of1,'with tstring;', files_maxio,0,left);
files_writeline(of1,true);

{implementation:}

files_open(of2,'domainpas',10,3);
files_writestr(of2,'export(',files_maxio,0,left);
files_writestring(of2,filename,0,left);
files_writestr(of2,'langspec);',files_maxio,0,left);
files_writeline(of2,true);
files_writestr(of2,'pragma c_include(',files_maxio,0,left);
files_writechar(of2,chr(39));
files_writestr(of2,'tstring.pf',files_maxio,0,left);
files_writechar(of2,chr(39));
files_writestr(of2,');', files_maxio,0,left);
files_writeline(of2,true);
files_writestr(of2,'pragma c_include(',files_maxio,0,left);
files_writechar(of2,chr(39));
files_writestr(of2,'mem.pf',files_maxio,0,left);
files_writechar(of2,chr(39));
files_writestr(of2,');', files_maxio,0,left);
files_writeline(of2,true);
files_writestr(of2,'pragma c_include(',files_maxio,0,left);
files_writechar(of2,chr(39));
files_writestring(of2,filename,0,left);
files_writestr(of2,'langspec.pf',files_maxio,0,left);
files_writechar(of2,chr(39));
files_writestr(of2,');', files_maxio,0,left);

files_writeline(of2,true);
files_writestr(of2,'program ',files_maxio,0,left);
files_writestring(of2,filename,0,left);
files_writestr(of2,'langspec;',files_maxio,0,left);
files_writeline(of2,true);
files_writestr(of2,'with tstring,mem;',files_maxio,0,left);
files_writeline(of2,true);

files_writestr(of2,'var',files_maxio,0,left);
files_writeline(of2,true);
files_writestr(of2,'    word:array[1..',files_maxio,0,left);
files_writestring(of2,filename,0,left);
files_writestr(of2,'langspec_nrow] of tstring_string;',files_maxio,0,left);
files_writeline(of2,true);
files_writestr(of2,'    wcat:array[1..',files_maxio,0,left);
files_writestring(of2,filename,0,left);
files_writestr(of2,'langspec_nrow] of ',files_maxio,0,left);
files_writestring(of2,filename,0,left);
files_writestr(of2,'langspec_category;',files_maxio,0,left);
files_writeline(of2,true);
files_writestr(of2,'    scat:array[char] of ',files_maxio,0,left);
files_writestring(of2,filename,0,left);
files_writestr(of2,'langspec_category;',files_maxio,0,left);
files_writeline(of2,true);
files_writestr(of2,' function ',files_maxio,0,left);
files_writestring(of2,filename,0,left);
files_writestr(of2,'langspec_scanchars:setofchar;'
   						,files_maxio,0,left);
files_writeline(of2,true);
files_writestr(of2,'begin',files_maxio,0,left);
files_writeline(of2,true);
files_writestring(of2,filename,0,left);
files_writestr(of2,'langspec_scanchars:=[',files_maxio,0,left);
alphabettable1:=alphabettable;
while stillidents(alphabettable1) do
   begin
   takeident(str,alphabettable1);
   if files_position(of2) > (files_maxio - 10) then files_writeline(of2,true);
   files_writechar(of2,'''');
   files_writestring(of2,str,0,left);
   files_writechar(of2,'''');
   if stillidents(alphabettable1) then files_writechar(of2,',')
   end;
files_writechar(of2,']');
files_writeline(of2,true);
files_writestr(of2,'end;',files_maxio,0,left);
files_writeline(of2,true);
files_writestr(of2,' procedure ',files_maxio,0,left);
files_writestring(of2,filename,0,left);
files_writestr(of2,'langspec_init;',files_maxio,0,left);
files_writeline(of2,true);
files_writestr(of2,'begin',files_maxio,0,left);
files_writeline(of2,true);
symboltable1:=symboltable;
while stillsymbols(symboltable1) do
   begin
   takesymbol(symbol1,symboltable1);
   files_writestr(of2,'scat[''',files_maxio,0,left);
   if (string_comparechars(symbol1^.character,'''',1)=0) then
       files_writechar(of2,'''');
   files_writestring(of2,symbol1^.character,0,left);
   files_writestr(of2,'''] := ',files_maxio,0,left);
   files_writestring(of2,symbol1^.catname,0,left);
   files_writechar(of2,';');
   files_writeline(of2,true)
   end;
wordtable1:=wordtable;
i:=0;
while stillwords(wordtable1) do
   begin
   i:=i+1;
   takeword(word1,wordtable1);
   files_writestr(of2,'wcat[',files_maxio,0,left);
   files_writeinteger(of2,i,3,right);
   files_writestr(of2,'] := ',files_maxio,0,left);
   files_writestring(of2,word1^.catname,0,left);
   files_writechar(of2,';');
   files_writeline(of2,true);
   files_writestr(of2,'tstring_constant(word[',files_maxio,0,left);
   files_writeinteger(of2,i,3,right);
   files_writestr(of2,'],''',files_maxio,0,left);
   files_writestring(of2,word1^.ident,0,left);
   files_writestr(of2,''',',files_maxio,0,left);
   files_writeinteger(of2,string_length(word1^.ident),2,left);
   files_writestr(of2,');',files_maxio,0,left);
   files_writeline(of2,true);
   end;
nrow:=i;
files_writeline(of2,true);
files_writestr(of2,'end;',files_maxio,0,left);
files_writeline(of2,true);
files_writestr(of2,' procedure ',files_maxio,0,left);
files_writestring(of2,filename,0,left);
files_writestr(of2,'langspec_word(i:integer;var s:tstring_string);'
   						,files_maxio,0,left);
files_writeline(of2,true);
files_writestr(of2,'begin',files_maxio,0,left);
files_writeline(of2,true);
files_writestr(of2,'   s := word[i]',files_maxio,0,left);
files_writeline(of2,true);
files_writestr(of2,'end;',files_maxio,0,left);
files_writeline(of2,true);
files_writestr(of2,' function ',files_maxio,0,left);
files_writestring(of2,filename,0,left);
files_writestr(of2,'langspec_wcat(i:integer):',files_maxio,0,left);
files_writestring(of2,filename,0,left);
files_writestr(of2,'langspec_category;',files_maxio,0,left);
files_writeline(of2,true);
files_writestr(of2,'begin',files_maxio,0,left);
files_writeline(of2,true);
files_writestr(of2,'    ',files_maxio,0,left);
files_writestring(of2,filename,0,left);
files_writestr(of2,'langspec_wcat := wcat[i]',files_maxio,0,left);
files_writeline(of2,true);
files_writestr(of2,'end;',files_maxio,0,left);
files_writeline(of2,true);
files_writestr(of2,' function ',files_maxio,0,left);
files_writestring(of2,filename,0,left);
files_writestr(of2,'langspec_scat(c:char):',files_maxio,0,left);
files_writestring(of2,filename,0,left);
files_writestr(of2,'langspec_category;',files_maxio,0,left);
files_writeline(of2,true);
files_writestr(of2,'begin',files_maxio,0,left);
files_writeline(of2,true);
files_writestr(of2,'    ',files_maxio,0,left);
files_writestring(of2,filename,0,left);
files_writestr(of2,'langspec_scat := scat[c]',files_maxio,0,left);
files_writeline(of2,true);
files_writestr(of2,'end;',files_maxio,0,left);
files_writeline(of2,true);
files_writestr(of2,' procedure ',files_maxio,0,left);
files_writestring(of2,filename,0,left);
files_writestr(of2,'langspec_createterm(s:',files_maxio,0,left);
files_writestring(of2,filename,0,left);
files_writestr(of2,'langspec_category;',files_maxio,0,left);
files_writeline(of2,true);
files_writestr(of2,'    w:tstring_string;var f: ',files_maxio,0,left);
files_writestring(of2,filename,0,left);
files_writestr(of2,'langspec_fielddef);',files_maxio,0,left);
files_writeline(of2,true);
files_writestr(of2,'begin',files_maxio,0,left);
files_writeline(of2,true);
files_writestr(of2,'   new(f.terminal);',files_maxio,0,left);
files_writeline(of2,true);
files_writestr(of2,'   tstring_uppercase(f.terminal^.str,w)',files_maxio,0,left);
files_writeline(of2,true);
files_writestr(of2,'end;',files_maxio,0,left);
files_writeline(of2,true);


{definition:}
writeconstants(of1);
files_writestr(of1,'type setofchar = set of char;',files_maxio,0,left);
files_writeline(of1,true);
writetypes(of1);

writesetfunctions(of1,of2);
files_writestr(of1,' function ',files_maxio,0,left);
files_writestring(of1,filename,0,left);
files_writestr(of1,'langspec_scanchars:setofchar;'
   						,files_maxio,0,left);
files_writeline(of1,true);
files_writestr(of1,'         external;',files_maxio,0,left);
files_writeline(of1,true);
files_writestr(of1,' procedure ',files_maxio,0,left);
files_writestring(of1,filename,0,left);
files_writestr(of1,'langspec_init; external;',
   						files_maxio,0,left);
files_writeline(of1,true);
files_writestr(of1,' procedure ',files_maxio,0,left);
files_writestring(of1,filename,0,left);
files_writestr(of1,'langspec_word(i:integer;var s:tstring_string);'
   						,files_maxio,0,left);
files_writeline(of1,true);
files_writestr(of1,'         external;',files_maxio,0,left);
files_writeline(of1,true);
files_writestr(of1,' function ',files_maxio,0,left);
files_writestring(of1,filename,0,left);
files_writestr(of1,'langspec_wcat(i:integer):',files_maxio,0,left);
files_writestring(of1,filename,0,left);
files_writestr(of1,'langspec_category;',files_maxio,0,left);
files_writeline(of1,true);
files_writestr(of1,'         external;',files_maxio,0,left);
files_writeline(of1,true);
files_writestr(of1,' function ',files_maxio,0,left);
files_writestring(of1,filename,0,left);
files_writestr(of1,'langspec_scat(c:char):',files_maxio,0,left);
files_writestring(of1,filename,0,left);
files_writestr(of1,'langspec_category;',files_maxio,0,left);
files_writeline(of1,true);
files_writestr(of1,'         external;',files_maxio,0,left);
files_writeline(of1,true);
files_writestr(of1,' procedure ',files_maxio,0,left);
files_writestring(of1,filename,0,left);
files_writestr(of1,'langspec_createterm(s:',files_maxio,0,left);
files_writestring(of1,filename,0,left);
files_writestr(of1,'langspec_category;',files_maxio,0,left);
files_writeline(of1,true);
files_writestr(of1,'           w:tstring_string;var f:',files_maxio,0,left);
files_writestring(of1,filename,0,left);
files_writestr(of1,'langspec_fielddef);',files_maxio,0,left);
files_writeline(of1,true);
files_writestr(of1,'         external;',files_maxio,0,left);
files_writeline(of1,true);

files_writestr(of1,'end{langspec};',files_maxio,0,left);

{write make and write functions:}
files_open(mof1,'makeenv',7,3);
files_open(mof2,'makepas',7,3);
files_open(wof1,'writepas',8,3);
files_writestr(mof1,'pragma c_include(',files_maxio,0,left);
files_writechar(mof1,chr(39));
files_writestring(mof1,filename,0,left);
files_writestr(mof1,'langspec.pf',files_maxio,0,left);
files_writechar(mof1,chr(39));
files_writestr(mof1,');',files_maxio,0,left);
files_writeline(mof1,true);
files_writestr(mof1,'pragma c_include(',files_maxio,0,left);
files_writechar(mof1,chr(39));
files_writestring(mof1,filename,0,left);
files_writestr(mof1,'decl.pf',files_maxio,0,left);
files_writechar(mof1,chr(39));
files_writestr(mof1,');', files_maxio,0,left);
files_writeline(mof1,true);
files_writestr(mof1,'package ',files_maxio,0,left);
files_writestring(mof1,filename,0,left);
files_writestr(mof1,'maket;',
               files_maxio,0,left);
files_writeline(mof1,true);
files_writestr(mof1,'with ',
               files_maxio,0,left);
files_writestring(mof1,filename,0,left);
files_writestr(mof1,'decl,',files_maxio,0,left);
files_writeline(mof1,true);
files_writestring(mof1,filename,0,left);
files_writestr(mof1,'langspec;',files_maxio,0,left);
files_writeline(mof1,true);

files_writestr(wof1,'export(',files_maxio,0,left);
files_writestr(wof1,'mrusurcomwrite);',files_maxio,0,left);
files_writeline(wof1,true);
files_writestr(wof1,'pragma c_include(',files_maxio,0,left);
files_writechar(wof1,chr(39));
files_writestr(wof1,'mrusurcomwrite.pf',files_maxio,0,left);
files_writechar(wof1,chr(39));
files_writestr(wof1,');',files_maxio,0,left);
files_writeline(wof1,true);
files_writestr(wof1,'pragma c_include(',files_maxio,0,left);
files_writechar(wof1,chr(39));
files_writestr(wof1,'mrusurcomdecl.pf',files_maxio,0,left);
files_writechar(wof1,chr(39));
files_writestr(wof1,');',files_maxio,0,left);
files_writeline(wof1,true);
files_writestr(wof1,'pragma c_include(',files_maxio,0,left);
files_writechar(wof1,chr(39));
files_writestr(wof1,'string.pf',files_maxio,0,left);
files_writechar(wof1,chr(39));
files_writestr(wof1,');',files_maxio,0,left);
files_writeline(wof1,true);
files_writestr(wof1,'program ',files_maxio,0,left);
files_writestr(wof1,'mrusurcomwrite;',files_maxio,0,left);
files_writeline(wof1,true);
files_writestr(wof1,'with ',files_maxio,0,left);
files_writestr(wof1,'strng,mrusurcomdecl;',files_maxio,0,left);
files_writeline(wof1,true);

files_writestr(mof2,'export(',files_maxio,0,left);
files_writestring(mof2,filename,0,left);
files_writestr(mof2,'maket);', files_maxio,0,left);
files_writeline(mof2,true);
files_writestr(mof2,'pragma c_include(',files_maxio,0,left);
files_writechar(mof2,chr(39));
files_writestring(mof2,filename,0,left);
files_writestr(mof2,'maket.pf',files_maxio,0,left);
files_writechar(mof2,chr(39));
files_writestr(mof2,');',files_maxio,0,left);
files_writeline(mof2,true);
files_writestr(mof2,'pragma c_include(',files_maxio,0,left);
files_writechar(mof2,chr(39));
files_writestring(mof2,filename,0,left);
files_writestr(mof2,'langspec.pf',files_maxio,0,left);
files_writechar(mof2,chr(39));
files_writestr(mof2,');',files_maxio,0,left);
files_writeline(mof2,true);
files_writestr(mof2,'pragma c_include(',files_maxio,0,left);
files_writechar(mof2,chr(39));
files_writestr(mof2,'string.pf',files_maxio,0,left);
files_writechar(mof2,chr(39));
files_writestr(mof2,');',files_maxio,0,left);
files_writeline(mof2,true);
files_writestr(mof2,'pragma c_include(',files_maxio,0,left);
files_writechar(mof2,chr(39));
files_writestr(mof2,'mem.pf',files_maxio,0,left);
files_writechar(mof2,chr(39));
files_writestr(mof2,');',files_maxio,0,left);
files_writeline(mof2,true);
files_writestr(mof2,'pragma c_include(',files_maxio,0,left);
files_writechar(mof2,chr(39));
files_writestring(mof2,filename,0,left);
files_writestr(mof2,'decl.pf',files_maxio,0,left);
files_writechar(mof2,chr(39));
files_writestr(mof2,');',
               files_maxio,0,left);
files_writeline(mof2,true);
files_writestr(mof2,'program ',files_maxio,0,left);
files_writestring(mof2,filename,0,left);
files_writestr(mof2,'maket;',
               files_maxio,0,left);
files_writeline(mof2,true);
files_writestr(mof2,'WITH ',
               files_maxio,0,left);
files_writestring(mof2,filename,0,left);
files_writestr(mof2,'langspec,',files_maxio,0,left);
files_writeline(mof2,true);
files_writestr(mof2,'strng,mem,',files_maxio,0,left);
files_writeline(mof2,true);
files_writestring(mof2,filename,0,left);
files_writestr(mof2,'decl;',files_maxio,0,left);
files_writeline(mof2,true);

writemakefunctions(mof1,mof2);
writewritefunctions(wof1);
files_writestr(mof1,'end{maket};',files_maxio,0,left);
end;

 procedure mrudomcomrules_rule(rnr:integer;a:mrudomcomdecl_nodeid;
       b:mrudomcomdecl_psnode;la:mrudomcomdecl_psnode;mode:mrudomcomdecl_surfrulemode);

procedure uttrule(a:mrudomcomdecl_nodeid;b:mrudomcomdecl_psnode;
   	mode:mrudomcomdecl_surfrulemode);
begin
case a of
   hinit:begin end;
   1:case mode of
     loccond:begin mrudomcomdecl_assignstatus(true) end;
     globcond:begin mrudomcomdecl_assignstatus(true) end;
     end;
   2:case mode of
     loccond:begin mrudomcomdecl_assignstatus(true) end;
     globcond:begin mrudomcomdecl_assignstatus(true);
                    filename:= b^.ldfield.terminal^.str;
                    STRING_LowerCase(filename,filename);
              end;
     end;
   hfinal:begin mrudomcomdecl_assignstatus(true);
                mrudomcomdecl_addnewtop(mrudomcomdecl_makenonterminal(utt))
          end;
   end;
end;

procedure typespecrule(a:mrudomcomdecl_nodeid;b:mrudomcomdecl_psnode;
   	mode:mrudomcomdecl_surfrulemode);
begin
case a of
   hinit:begin end;
   1:case mode of
     loccond:begin mrudomcomdecl_assignstatus(true) end;
     globcond:begin mrudomcomdecl_assignstatus(true) end;
     end;
   2:case mode of
     loccond:begin mrudomcomdecl_assignstatus(true) end;
     globcond:begin mrudomcomdecl_assignstatus(true) end;
     end;
   hfinal:begin mrudomcomdecl_assignstatus(true);
                mrudomcomdecl_addnewtop(mrudomcomdecl_makenonterminal(typespec))
          end;
   end;
end;

procedure recordspecrule(a:mrudomcomdecl_nodeid;b:mrudomcomdecl_psnode;
   	mode:mrudomcomdecl_surfrulemode);
begin
case a of
   hinit:begin end;
   1:case mode of
     loccond:begin mrudomcomdecl_assignstatus(true) end;
     globcond:begin mrudomcomdecl_assignstatus(true) end;
     end;
   2:case mode of
     loccond:begin mrudomcomdecl_assignstatus(true) end;
     globcond:begin mrudomcomdecl_assignstatus(true) end;
     end;
   hfinal:begin mrudomcomdecl_assignstatus(true);
                mrudomcomdecl_addnewtop(mrudomcomdecl_makenonterminal(recordspec))
          end;
   end;
end;

procedure categoriespecrule(a:mrudomcomdecl_nodeid;b:mrudomcomdecl_psnode;
   	mode:mrudomcomdecl_surfrulemode);
begin
case a of
   hinit:begin end;
   1:case mode of
     loccond:begin mrudomcomdecl_assignstatus(true) end;
     globcond:begin mrudomcomdecl_assignstatus(true) end;
     end;
   2:case mode of
     loccond:begin mrudomcomdecl_assignstatus(true) end;
     globcond:begin mrudomcomdecl_assignstatus(true) end;
     end;
   hfinal:begin mrudomcomdecl_assignstatus(true);
                mrudomcomdecl_addnewtop(mrudomcomdecl_makenonterminal(categoriespec))
          end;
   end;
end;

procedure setspecrule(a:mrudomcomdecl_nodeid;b:mrudomcomdecl_psnode;
   	mode:mrudomcomdecl_surfrulemode);
begin
case a of
   hinit:begin end;
   1:case mode of
     loccond:begin mrudomcomdecl_assignstatus(true) end;
     globcond:begin mrudomcomdecl_assignstatus(true) end;
     end;
   2:case mode of
     loccond:begin mrudomcomdecl_assignstatus(true) end;
     globcond:begin mrudomcomdecl_assignstatus(true) end;
     end;
   hfinal:begin mrudomcomdecl_assignstatus(true);
                mrudomcomdecl_addnewtop(mrudomcomdecl_makenonterminal(setspec))
          end;
   end;
end;

procedure typedefinitionrule(a:mrudomcomdecl_nodeid;b:mrudomcomdecl_psnode;
   	mode:mrudomcomdecl_surfrulemode);
begin
case a of
   hinit:begin end;
   1:case mode of
     loccond:begin mrudomcomdecl_assignstatus(true) end;
     globcond:begin mrudomcomdecl_assignstatus(true) end;
     end;
   2:case mode of
     loccond:begin mrudomcomdecl_assignstatus(true) end;
     globcond:begin mrudomcomdecl_assignstatus(true) end;
     end;
   3:case mode of
     loccond:begin mrudomcomdecl_assignstatus(true) end;
     globcond:begin mrudomcomdecl_assignstatus(true) end;
     end;
   4:case mode of
     loccond:begin mrudomcomdecl_assignstatus(true) end;
     globcond:begin mrudomcomdecl_assignstatus(true) end;
     end;
   5:case mode of
     loccond:begin mrudomcomdecl_assignstatus(true) end;
     globcond:begin mrudomcomdecl_assignstatus(true) end;
     end;
   hfinal:begin mrudomcomdecl_assignstatus(true);
                mrudomcomdecl_addnewtop(mrudomcomdecl_makenonterminal(typedefinition))
          end;
   end;
end;

procedure enumdefrule(a:mrudomcomdecl_nodeid;b:mrudomcomdecl_psnode;
   	mode:mrudomcomdecl_surfrulemode);
begin
case a of
   hinit:begin new(enumentryvar);
               string_constantempty(enumentryvar^.typename);
               initsetofidents(enumentryvar^.idents)
         end;
   1:case mode of
     loccond:begin mrudomcomdecl_assignstatus(true) end;
     globcond:begin mrudomcomdecl_assignstatus(true) end;
     end;
   2:case mode of
     loccond:begin mrudomcomdecl_assignstatus(true) end;
     globcond:begin mrudomcomdecl_assignstatus(true);
                    enumentryvar^.typename:=b^.ldfield.preterminal^.str
              end;
     end;
   3:case mode of
     loccond:begin mrudomcomdecl_assignstatus(true) end;
     globcond:begin mrudomcomdecl_assignstatus(true);
                    appendident(b^.ldfield.terminal^.str,enumentryvar^.idents)
              end;
     end;
   hfinal:begin mrudomcomdecl_assignstatus(true);
                appendenum(enumentryvar,enumtable);
                mrudomcomdecl_addnewtop(mrudomcomdecl_makenonterminal(enumdef))
          end;
   end;
end;

procedure subrangedefrule(a:mrudomcomdecl_nodeid;b:mrudomcomdecl_psnode;
   	mode:mrudomcomdecl_surfrulemode);
begin
case a of
   hinit:begin new(subrangeentryvar);
               string_constantempty(subrangeentryvar^.typename);
               string_constantempty(subrangeentryvar^.ident1);
               string_constantempty(subrangeentryvar^.ident2)
         end;
   1:case mode of
     loccond:begin mrudomcomdecl_assignstatus(true) end;
     globcond:begin mrudomcomdecl_assignstatus(true) end;
     end;
   2:case mode of
     loccond:begin mrudomcomdecl_assignstatus(true) end;
     globcond:begin mrudomcomdecl_assignstatus(true);
                    subrangeentryvar^.typename:=b^.ldfield.preterminal^.str
              end;
     end;
   3:case mode of
     loccond:begin mrudomcomdecl_assignstatus(true) end;
     globcond:begin mrudomcomdecl_assignstatus(true);
                    subrangeentryvar^.ident1:=b^.ldfield.terminal^.str
              end;
     end;
   4:case mode of
     loccond:begin mrudomcomdecl_assignstatus(true) end;
     globcond:begin mrudomcomdecl_assignstatus(true);
                    subrangeentryvar^.ident2:=b^.ldfield.terminal^.str
              end;
     end;
   hfinal:begin mrudomcomdecl_assignstatus(true);
                appendsubrange(subrangeentryvar,subrangetable);
                mrudomcomdecl_addnewtop(mrudomcomdecl_makenonterminal(subrangedef))
          end;
   end;
end;

procedure integerdefrule(a:mrudomcomdecl_nodeid;b:mrudomcomdecl_psnode;
   	mode:mrudomcomdecl_surfrulemode);
begin
case a of
   hinit:begin string_constantempty(integerentryvar) end;
   1:case mode of
     loccond:begin mrudomcomdecl_assignstatus(true) end;
     globcond:begin mrudomcomdecl_assignstatus(true) end;
     end;
   2:case mode of
     loccond:begin mrudomcomdecl_assignstatus(true) end;
     globcond:begin mrudomcomdecl_assignstatus(true);
                    integerentryvar:=b^.ldfield.preterminal^.str
              end;
     end;
   hfinal:begin mrudomcomdecl_assignstatus(true);
                appendident(integerentryvar,integertable);
                mrudomcomdecl_addnewtop(mrudomcomdecl_makenonterminal(integerdef)) 
          end;
   end;
end;

procedure outputfilesrule(a:mrudomcomdecl_nodeid;b:mrudomcomdecl_psnode;
   	mode:mrudomcomdecl_surfrulemode);
begin
case a of
   hinit:begin  end;
   1:case mode of
     loccond:begin mrudomcomdecl_assignstatus(true) end;
     globcond:begin mrudomcomdecl_assignstatus(true) end;
     end;
   2:case mode of
     loccond:begin mrudomcomdecl_assignstatus(true) end;
     globcond:begin mrudomcomdecl_assignstatus(true);
                    appendident(b^.ldfield.terminal^.str,filestable)
              end;
     end;
   hfinal:begin mrudomcomdecl_assignstatus(true);
                mrudomcomdecl_addnewtop(mrudomcomdecl_makenonterminal(outputfiles)) 
          end;
   end;
end;

procedure tablespecrule(a:mrudomcomdecl_nodeid;b:mrudomcomdecl_psnode;
   	mode:mrudomcomdecl_surfrulemode);
begin
case a of
   hinit:begin  end;
   1:case mode of
     loccond:begin mrudomcomdecl_assignstatus(true) end;
     globcond:begin mrudomcomdecl_assignstatus(true) end;
     end;
   2:case mode of
     loccond:begin mrudomcomdecl_assignstatus(true) end;
     globcond:begin mrudomcomdecl_assignstatus(true);
                    appendident(b^.ldfield.terminal^.str,tabletable.tablenames)
              end;
     end;
   3:case mode of
     loccond:begin mrudomcomdecl_assignstatus(true) end;
     globcond:begin mrudomcomdecl_assignstatus(true);
                    appendident(b^.ldfield.preterminal^.str,tabletable.typenames)
              end;
     end;
   hfinal:begin mrudomcomdecl_assignstatus(true);
                mrudomcomdecl_addnewtop(mrudomcomdecl_makenonterminal(tablespec)) 
          end;
   end;
end;

procedure booleandefrule(a:mrudomcomdecl_nodeid;b:mrudomcomdecl_psnode;
   	mode:mrudomcomdecl_surfrulemode);
begin
case a of
   hinit:begin string_constantempty(booleanentryvar) end;
   1:case mode of
     loccond:begin mrudomcomdecl_assignstatus(true) end;
     globcond:begin mrudomcomdecl_assignstatus(true) end;
     end;
   2:case mode of
     loccond:begin mrudomcomdecl_assignstatus(true) end;
     globcond:begin mrudomcomdecl_assignstatus(true);
                    booleanentryvar:=b^.ldfield.preterminal^.str
              end;
     end;
   hfinal:begin mrudomcomdecl_assignstatus(true);
                appendident(booleanentryvar,booleantable);
                mrudomcomdecl_addnewtop(mrudomcomdecl_makenonterminal(booleandef)) 
          end;
   end;
end;

procedure setdefrule(a:mrudomcomdecl_nodeid;b:mrudomcomdecl_psnode;
   	mode:mrudomcomdecl_surfrulemode);
begin
case a of
   hinit:begin new(setofentryvar);
               string_constantempty(setofentryvar^.typename1);
               string_constantempty(setofentryvar^.typename2)
         end;
   1:case mode of
     loccond:begin mrudomcomdecl_assignstatus(true) end;
     globcond:begin mrudomcomdecl_assignstatus(true) end;
     end;
   2:case mode of
     loccond:begin mrudomcomdecl_assignstatus(true) end;
     globcond:begin mrudomcomdecl_assignstatus(true);
                    setofentryvar^.typename1:=b^.ldfield.preterminal^.str
              end;
     end;
   3:case mode of
     loccond:begin mrudomcomdecl_assignstatus(true) end;
     globcond:begin mrudomcomdecl_assignstatus(true);
                    setofentryvar^.typename2:=b^.ldfield.preterminal^.str
              end;
     end;
   hfinal:begin mrudomcomdecl_assignstatus(true);
                appendsetof(setofentryvar,settable);
                mrudomcomdecl_addnewtop(mrudomcomdecl_makenonterminal(setdef))
          end;
   end;
end;

procedure setelementrule(a:mrudomcomdecl_nodeid;b:mrudomcomdecl_psnode;
   	mode:mrudomcomdecl_surfrulemode);
begin
case a of
   hinit:begin new(setentryvar);
               string_constantempty(setentryvar^.identifier);
               initsetofidents(setentryvar^.attribs);
               initsetofidents(setentryvar^.typenames)
         end;
   1:case mode of
     loccond:begin mrudomcomdecl_assignstatus(true) end;
     globcond:begin mrudomcomdecl_assignstatus(true) end;
     end;
   2:case mode of
     loccond:begin mrudomcomdecl_assignstatus(true) end;
     globcond:begin mrudomcomdecl_assignstatus(true);
                    setentryvar^.identifier:=b^.ldfield.terminal^.str
              end;
     end;
   3:case mode of
     loccond:begin mrudomcomdecl_assignstatus(true) end;
     globcond:begin mrudomcomdecl_assignstatus(true);
                    appendident(b^.ldfield.preterminal^.str,
                                 setentryvar^.attribs)
              end;
     end;
   4:case mode of
     loccond:begin mrudomcomdecl_assignstatus(true) end;
     globcond:begin mrudomcomdecl_assignstatus(true);
                    appendident(b^.ldfield.preterminal^.str,
                                 setentryvar^.typenames)
              end;
     end;
   hfinal:begin mrudomcomdecl_assignstatus(true);
                appendgenericset(setentryvar,genericsettable);
                mrudomcomdecl_addnewtop(mrudomcomdecl_makenonterminal(setelement))
          end;
   end;
end;

procedure typenamerule(a:mrudomcomdecl_nodeid;b:mrudomcomdecl_psnode;
   	mode:mrudomcomdecl_surfrulemode);
begin
case a of
   hinit:begin string_constantempty(stringvar) end;
   1:case mode of
     loccond:begin mrudomcomdecl_assignstatus(true) end;
     globcond:begin string_concat(stringvar,stringvar,b^.ldfield.terminal^.str);
                    mrudomcomdecl_assignstatus(true) 
              end;
     end;
   hfinal:begin t:=mrudomcomdecl_makenonterminal(typename);
                new(t^.ldfield.preterminal);
                t^.ldfield.preterminal^.str:=stringvar;
                mrudomcomdecl_assignstatus(true);
   		mrudomcomdecl_addnewtop(t)
          end;
   end;
end;

procedure recorddefinitionrule(a:mrudomcomdecl_nodeid;b:mrudomcomdecl_psnode;
   	mode:mrudomcomdecl_surfrulemode);
begin
case a of
   hinit:begin new(recordentryvar);
               string_constantempty(recordentryvar^.recordname);
               initsetofattribs(recordentryvar^.attribs);
               initsetofattribs(recordentryvar^.inhattribs);
               initsetofattribs(recordentryvar^.synattribs)
         end;
   1:case mode of
     loccond:begin mrudomcomdecl_assignstatus(true) end;
     globcond:begin mrudomcomdecl_assignstatus(true) end;
     end;
   2:case mode of
     loccond:begin mrudomcomdecl_assignstatus(true) end;
     globcond:begin mrudomcomdecl_assignstatus(true);
                    recordentryvar^.recordname:=b^.ldfield.preterminal^.str
              end;
     end;
   3:case mode of
     loccond:begin mrudomcomdecl_assignstatus(true) end;
     globcond:begin mrudomcomdecl_assignstatus(true);
                    new(attribvar);
                    attribvar^.attribname:=b^.ldfield.preterminal^.str;
                    string_constantempty(attribvar^.typename);
   		    string_constantempty(attribvar^.valeu)
              end;
     end;
   4:case mode of
     loccond:begin mrudomcomdecl_assignstatus(true) end;
     globcond:begin mrudomcomdecl_assignstatus(true);
                    attribvar^.typename:=b^.ldfield.preterminal^.str
              end;
     end;
   5:case mode of
     loccond:begin mrudomcomdecl_assignstatus(true) end;
     globcond:begin mrudomcomdecl_assignstatus(true);
                    attribvar^.valeu:=b^.ldfield.preterminal^.str;
                    appendattrib(attribvar,recordentryvar^.attribs)
              end;
     end;
   6:case mode of
     loccond:begin mrudomcomdecl_assignstatus(true) end;
     globcond:begin mrudomcomdecl_assignstatus(true);
                    attribvar^.typename:=b^.ldfield.preterminal^.str;
                    appendattrib(attribvar,recordentryvar^.inhattribs)
              end;
     end;
   7:case mode of
     loccond:begin mrudomcomdecl_assignstatus(true) end;
     globcond:begin mrudomcomdecl_assignstatus(true);
                    attribvar^.typename:=b^.ldfield.preterminal^.str;
                    appendattrib(attribvar,recordentryvar^.synattribs)
              end;
     end;
   hfinal:begin mrudomcomdecl_assignstatus(true);
             appendrecord(recordentryvar,recordtable);
             mrudomcomdecl_addnewtop(mrudomcomdecl_makenonterminal(
                     recorddefinition)) 
          end;
   end;
end;

procedure attribnamerule(a:mrudomcomdecl_nodeid;b:mrudomcomdecl_psnode;
   	mode:mrudomcomdecl_surfrulemode);
begin
case a of
   hinit:begin string_constantempty(stringvar) end;
   1:case mode of
     loccond:begin mrudomcomdecl_assignstatus(true) end;
     globcond:begin string_concat(stringvar,stringvar,b^.ldfield.terminal^.str);
                    mrudomcomdecl_assignstatus(true) 
              end;
     end;
   hfinal:begin t:=mrudomcomdecl_makenonterminal(attribname);
                new(t^.ldfield.preterminal);
                t^.ldfield.preterminal^.str:=stringvar;
                mrudomcomdecl_assignstatus(true);
   		mrudomcomdecl_addnewtop(t)
          end;
   end;
end;

procedure defaultvaleurule(a:mrudomcomdecl_nodeid;b:mrudomcomdecl_psnode;
   	mode:mrudomcomdecl_surfrulemode);
begin
case a of
   hinit:begin string_constantempty(stringvar) end;
   1:case mode of
     loccond:begin mrudomcomdecl_assignstatus(true) end;
     globcond:begin string_concat(stringvar,stringvar,b^.ldfield.terminal^.str);
                    mrudomcomdecl_assignstatus(true) 
              end;
     end;
   2:case mode of
     loccond:begin mrudomcomdecl_assignstatus(true) end;
     globcond:begin string_appendchar(stringvar,stringvar,',');
                    mrudomcomdecl_assignstatus(true) 
              end;
     end;
   3:case mode of
     loccond:begin mrudomcomdecl_assignstatus(true) end;
     globcond:begin string_appendchar(stringvar,stringvar,'[');
                    mrudomcomdecl_assignstatus(true) 
              end;
     end;
   4:case mode of
     loccond:begin mrudomcomdecl_assignstatus(true) end;
     globcond:begin string_appendchar(stringvar,stringvar,']');
                    mrudomcomdecl_assignstatus(true) 
              end;
     end;
   hfinal:begin t:=mrudomcomdecl_makenonterminal(defaultvalue);
                new(t^.ldfield.preterminal);
                t^.ldfield.preterminal^.str:=stringvar;
                mrudomcomdecl_assignstatus(true);
   		mrudomcomdecl_addnewtop(t)
          end;
   end;
end;

procedure recordnamerule(a:mrudomcomdecl_nodeid;b:mrudomcomdecl_psnode;
   	mode:mrudomcomdecl_surfrulemode);
begin
case a of
   hinit:begin string_constantempty(stringvar) end;
   1:case mode of
     loccond:begin mrudomcomdecl_assignstatus(true) end;
     globcond:begin string_concat(stringvar,stringvar,b^.ldfield.terminal^.str);
                    mrudomcomdecl_assignstatus(true) 
              end;
     end;
   hfinal:begin t:=mrudomcomdecl_makenonterminal(recordname);
                new(t^.ldfield.preterminal);
                t^.ldfield.preterminal^.str:=stringvar;
                mrudomcomdecl_assignstatus(true);
   		mrudomcomdecl_addnewtop(t)
          end;
   end;
end;

procedure catdefinitionrule(a:mrudomcomdecl_nodeid;b:mrudomcomdecl_psnode;
   	mode:mrudomcomdecl_surfrulemode);
begin
case a of
   hinit:begin end;
   1:case mode of
     loccond:begin mrudomcomdecl_assignstatus(true) end;
     globcond:begin mrudomcomdecl_assignstatus(true) end;
     end;
   hfinal:begin t:=mrudomcomdecl_makenonterminal(catdefinition);
                mrudomcomdecl_assignstatus(true);
   		mrudomcomdecl_addnewtop(t)
          end;
   end;
end;

procedure catlistrule(a:mrudomcomdecl_nodeid;b:mrudomcomdecl_psnode;
   	mode:mrudomcomdecl_surfrulemode);
begin
case a of
   hinit:begin new(catlistentryvar);
               initsetofidents(catlistentryvar^.catnames);
               string_constantempty(catlistentryvar^.recordname)
         end;
   1:case mode of
     loccond:begin mrudomcomdecl_assignstatus(true) end;
     globcond:begin mrudomcomdecl_assignstatus(true) end;
     end;
   2:case mode of
     loccond:begin mrudomcomdecl_assignstatus(true) end;
     globcond:begin mrudomcomdecl_assignstatus(true);
              appendident(b^.ldfield.preterminal^.str,catlistentryvar^.catnames)
              end;
     end;
   3:case mode of
     loccond:begin mrudomcomdecl_assignstatus(true) end;
     globcond:begin mrudomcomdecl_assignstatus(true);
                    catlistentryvar^.recordname:=b^.ldfield.preterminal^.str
              end;
     end;
   hfinal:begin mrudomcomdecl_assignstatus(true);
             appendcatdef(catlistentryvar,categorytable);
             mrudomcomdecl_addnewtop(mrudomcomdecl_makenonterminal(catlist)) 
          end;
   end;
end;

procedure catnamerule(a:mrudomcomdecl_nodeid;b:mrudomcomdecl_psnode;
   	mode:mrudomcomdecl_surfrulemode);
begin
case a of
   hinit:begin string_constantempty(stringvar) end;
   1:case mode of
     loccond:begin mrudomcomdecl_assignstatus(true) end;
     globcond:begin string_concat(stringvar,stringvar,b^.ldfield.terminal^.str);
                    mrudomcomdecl_assignstatus(true) 
              end;
     end;
   hfinal:begin t:=mrudomcomdecl_makenonterminal(catname);
                new(t^.ldfield.preterminal);
                t^.ldfield.preterminal^.str:=stringvar;
                mrudomcomdecl_assignstatus(true);
   		mrudomcomdecl_addnewtop(t)
          end;
   end;
end;

procedure alphabetspecrule(a:mrudomcomdecl_nodeid;b:mrudomcomdecl_psnode;
   	mode:mrudomcomdecl_surfrulemode);
begin
case a of
  hinit:string_constantempty(charentryvar);
  1:case mode of
    loccond:begin mrudomcomdecl_assignstatus(true) end;
    globcond:begin mrudomcomdecl_assignstatus(true) end;
    end;
  2:case mode of
    loccond:begin mrudomcomdecl_assignstatus(
                               checkchar(b^.ldfield.preterminal^.str))
            end;
    globcond:begin charentryvar:=b^.ldfield.preterminal^.str;
                   appendident(charentryvar,alphabettable);
                   mrudomcomdecl_assignstatus(true)
             end;
    end;
  hfinal:begin t:=mrudomcomdecl_makenonterminal(alphabetspec);
               mrudomcomdecl_assignstatus(true);
               mrudomcomdecl_addnewtop(t)
         end;
  end;
end;
procedure symbolspecrule(a:mrudomcomdecl_nodeid;b:mrudomcomdecl_psnode;
   	mode:mrudomcomdecl_surfrulemode);
begin
case a of
  hinit:begin end;
  1:case mode of
    loccond:mrudomcomdecl_assignstatus(true);
    globcond:mrudomcomdecl_assignstatus(true);
    end;
  hfinal:begin t:=mrudomcomdecl_makenonterminal(symbolspec);
               mrudomcomdecl_assignstatus(true);
               mrudomcomdecl_addnewtop(t)
         end;
  end;
end;
procedure wordspecrule(a:mrudomcomdecl_nodeid;b:mrudomcomdecl_psnode;
   	mode:mrudomcomdecl_surfrulemode);
begin
case a of
  hinit:begin end;
  1:case mode of
    loccond:mrudomcomdecl_assignstatus(true);
    globcond:mrudomcomdecl_assignstatus(true);
    end;
  hfinal:begin t:=mrudomcomdecl_makenonterminal(wordspec);
               mrudomcomdecl_assignstatus(true);
               mrudomcomdecl_addnewtop(t)
         end;
  end;
end;
procedure symboldefinitionrule(a:mrudomcomdecl_nodeid;b:mrudomcomdecl_psnode;
   	mode:mrudomcomdecl_surfrulemode);
begin
case a of
  hinit:begin new(symbolentryvar) end;
  1:case mode of
    loccond:mrudomcomdecl_assignstatus(true);
    globcond:mrudomcomdecl_assignstatus(true);
    end;
  2:case mode of
    loccond:mrudomcomdecl_assignstatus(true);
    globcond:begin mrudomcomdecl_assignstatus(true);
                   symbolentryvar^.catname:=b^.ldfield.preterminal^.str
             end;
    end;
  3:case mode of
    loccond:mrudomcomdecl_assignstatus(true);
    globcond:begin mrudomcomdecl_assignstatus(true);
                   symbolentryvar^.character:=b^.ldfield.preterminal^.str
             end;
    end;
  hfinal:begin t:=mrudomcomdecl_makenonterminal(symboldefinition);
               mrudomcomdecl_assignstatus(true);
               appendsymbol(symbolentryvar,symboltable);
               mrudomcomdecl_addnewtop(t)
         end;
  end;
end;
procedure worddefinitionrule(a:mrudomcomdecl_nodeid;b:mrudomcomdecl_psnode;
   	mode:mrudomcomdecl_surfrulemode);
begin
case a of
  hinit:begin new(wordentryvar) end;
  1:case mode of
    loccond:mrudomcomdecl_assignstatus(true);
    globcond:mrudomcomdecl_assignstatus(true);
    end;
  2:case mode of
    loccond:mrudomcomdecl_assignstatus(true);
    globcond:begin mrudomcomdecl_assignstatus(true);
                   wordentryvar^.catname:=b^.ldfield.preterminal^.str
             end;
    end;
  3:case mode of
    loccond:mrudomcomdecl_assignstatus(true);
    globcond:begin mrudomcomdecl_assignstatus(true);
                   wordentryvar^.ident:=b^.ldfield.preterminal^.str
             end;
    end;
  hfinal:begin t:=mrudomcomdecl_makenonterminal(worddefinition);
               mrudomcomdecl_assignstatus(true);
               appendword(wordentryvar,wordtable);
               mrudomcomdecl_addnewtop(t)
         end;
  end;
end;
procedure characterrule(a:mrudomcomdecl_nodeid;b:mrudomcomdecl_psnode;
   	mode:mrudomcomdecl_surfrulemode);
begin
case a of
  hinit:begin string_constantempty(stringvar) end;
  1:case mode of
    loccond:mrudomcomdecl_assignstatus(checkchar(b^.ldfield.terminal^.str));
    globcond:begin mrudomcomdecl_assignstatus(true);
                   stringvar:=b^.ldfield.terminal^.str
             end;
    end;
  hfinal:begin t:=mrudomcomdecl_makenonterminal(character);
               new(t^.ldfield.preterminal);
               t^.ldfield.preterminal^.str:=stringvar;
               mrudomcomdecl_assignstatus(true);
               mrudomcomdecl_addnewtop(t)
         end;
  end;
end;

begin
   case rnr of
   1 :  uttrule(a,b,mode); 
   2 :  typespecrule(a,b,mode); 
   3 :  recordspecrule(a,b,mode); 
   4 :  categoriespecrule(a,b,mode); 
   5 :  typedefinitionrule(a,b,mode); 
   6 :  enumdefrule(a,b,mode); 
   7 :  subrangedefrule(a,b,mode); 
   8 :  integerdefrule(a,b,mode);
   9 :  booleandefrule(a,b,mode); 
   10:  setdefrule(a,b,mode); 
   11:  typenamerule(a,b,mode);
   12:  recorddefinitionrule(a,b,mode);
   13:  attribnamerule(a,b,mode);
   14:  defaultvaleurule(a,b,mode);
   15:  recordnamerule(a,b,mode);
   16:  catdefinitionrule(a,b,mode);
   17:  catlistrule(a,b,mode);
   18:  catnamerule(a,b,mode);
   19:  alphabetspecrule(a,b,mode);
   20:  symbolspecrule(a,b,mode);
   21:  wordspecrule(a,b,mode);
   22:  symboldefinitionrule(a,b,mode);
   23:  worddefinitionrule(a,b,mode);
   24:  characterrule(a,b,mode);
   25:  outputfilesrule(a,b,mode);
   26:  setspecrule(a,b,mode);
   27:  setelementrule(a,b,mode);
   28:  tablespecrule(a,b,mode);
   end;
end;

