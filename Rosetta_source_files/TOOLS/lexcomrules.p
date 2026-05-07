(*MPM:::===================================================================*
 *
 *  Rosetta Project                                                 
 *                                                                  
 *  Module Title    : LEXCOMRULES 
 *  Creation date   :                                               
 *  Author          :                                               
 *                                                                  
 *  Copyright (c) 1985, by Nederlandse Philips Bedrijven BV.        
 *                                                                  
 *  Remarks         :  
 *
 *EMP:::===================================================================*)

EXPORT(LEXCOMRULES);
pragma C_include('lexcomrules.pf');
pragma C_include('lexcomdecl.pf');
pragma C_include('ldstrtotype.pf');
pragma C_include('ldcatsets.pf');
pragma C_include('lidomaint.pf');

(*=========================================================================*
 *  Imported modules
 *=========================================================================*)

PROGRAM LEXCOMRULES;

WITH LEXCOMDECL,
     LDSTRTOTYPE,
     LDCATSETS,
     LIDOMAINT;
    
var
  helpdoorgeefpar1:LEXCOMDECL_string;
  keystrstatic:string(220);
  basiccatstatic,keypresentstatic:boolean;
  records1:LEXCOMDECL_setofrecords;
  keyrecords1:LEXCOMDECL_setofrecords;
  leftrecords1:LEXCOMDECL_setofrecords;
  rightrecords1:LEXCOMDECL_setofrecords;
  basictrees1:LEXCOMDECL_setofrecords;
  numberofmodels:  INTEGER; {*used in inputmodelsrule*}
  variable2:  BOOLEAN;
  existreltreelist:  BOOLEAN; 
  nonemptyreltreelist: BOOLEAN;
  Tname2:  string(220); 			{*used in modelsrule*}
  catn:  string(220);
  rec:  string(220);
  Tname:  string(220); 
  variable:  BOOLEAN; 			{*used in nodedescriptionrule*}
  numberofsons:  INTEGER; {*used in reltreelistrule*}
  levelpar:  INTEGER;
  numberofson_ca_s:  INTEGER; 		{*used in capairsrule*}
  numberofactions:  INTEGER; {*used in actionrule*}
  andcond:BOOLEAN;
  numberofconditions:  INTEGER; {*used in conditionrule*}
  oneopen,oneclose,twoopen,twoclose,concatenated:BOOLEAN;
  doorgeefpar1,doorgeefpar2,
  doorgeefpar: string(220); {*used in charstringrules 11-14,22*}
  mstring: string(220); {*used in outputmodelrule*}
  bool:BOOLEAN;
function LEXCOMRULES_leftrecords:LEXCOMDECL_setofrecords;
begin
LEXCOMRULES_leftrecords:=leftrecords1
end;
function LEXCOMRULES_basictrees:LEXCOMDECL_setofrecords;
begin
LEXCOMRULES_basictrees:=basictrees1
end;
function LEXCOMRULES_rightrecords:LEXCOMDECL_setofrecords;
begin
LEXCOMRULES_rightrecords:=rightrecords1
end;
procedure initsetofrecords(var S1:LEXCOMDECL_setofrecords);
begin
S1.first:=nil;S1.last:=nil
end;
function LEXCOMRULES_stillrecords(S1:LEXCOMDECL_setofrecords):BOOLEAN;
begin
if S1.first<>nil then LEXCOMRULES_stillrecords:=true
else LEXCOMRULES_stillrecords:=false
end;
procedure LEXCOMRULES_appendrecord(record1:string(220);var S1:LEXCOMDECL_setofrecords);
var p:LEXCOMDECL_plosrecord;
begin
new(p);
p^.arg:=record1;
p^.next:=nil;
if S1.first = nil then
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
procedure LEXCOMRULES_takerecord(var record1:LEXCOMDECL_string;var S1:LEXCOMDECL_setofrecords);
begin
if S1.first=nil then record1:=' '
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
procedure appendsetofrecords(S1:LEXCOMDECL_setofrecords;var S2:LEXCOMDECL_setofrecords);
begin
if (S2.first=nil) then
   	begin
   	S2.first:=S1.first;S2.last:=S1.last
   	end
else
   	begin
   	if (S1.first<>nil) then
   		begin
   		S2.last^.next:=S1.first;
   		S2.last:=S1.last
   		end
   	end
end;
procedure LEXCOMRULES_recordsinit;
begin
initsetofrecords(keyrecords1);
initsetofrecords(basictrees1);
initsetofrecords(leftrecords1);
initsetofrecords(rightrecords1)
end;
function addnewtop(a:LEXCOMDECL_psnode;b:LEXCOMDECL_psinglesegmentlist):LEXCOMDECL_psinglesegmentlist;
var
   c:LEXCOMDECL_psinglesegmentlist;
begin
new(c);
with c^ do
   	begin
   	next:=b;rn:=nil;stree:=a
   	end;
addnewtop:=c
end;

function mkutt:LEXCOMDECL_psnode;
var s:LEXCOMDECL_psnode;
begin
new(s);
s^.cat:=utt;
mkutt:=s
end;

function mkmodels:LEXCOMDECL_psnode;
var s:LEXCOMDECL_psnode;
begin
new(s);
s^.cat:=models;
mkmodels:=s
end;

function mkinputmodels(number:INTEGER;records:LEXCOMDECL_setofrecords):LEXCOMDECL_psnode;
var s:LEXCOMDECL_psnode;
begin
new(s);
s^.cat:=inputmodels;
new(s^.inputmodelsfield);
s^.inputmodelsfield^.numberofmodels:=number;
s^.inputmodelsfield^.records:=records;
mkinputmodels:=s
end;

function checkmodelname(string1:string(220);numberofmodels:INTEGER):BOOLEAN;
var result:BOOLEAN;
begin
result:=false;
if length(string1)=2 then 
   begin
   if ord(string1[2])=numberofmodels + 49 then result:=true
   else writeln('modelname ',string1,' is incorrect')
   end;
checkmodelname:=result
end;

function mkoutputmodel(records:LEXCOMDECL_setofrecords):LEXCOMDECL_psnode;
var s:LEXCOMDECL_psnode;
begin
new(s);
s^.cat:=outputmodel;
new(s^.outputmodelfield);
s^.outputmodelfield^.records:=records;
mkoutputmodel:=s
end;

function outputmodelname(string1:string(220)):BOOLEAN;
begin
if (string1='m') or (string1='M') then outputmodelname:=true
else outputmodelname:=false
end;

function output_model(mstring:string(220)):BOOLEAN;
begin
if (mstring='M') or (mstring='m') then output_model:=true 
else output_model:=false
end;

function mkmodel(varia,existreltr,nonemptyreltr:BOOLEAN;records:LEXCOMDECL_setofrecords)
     :LEXCOMDECL_psnode;
var s:LEXCOMDECL_psnode;
begin
new(s);
s^.cat:=model;
new(s^.modelfield);
s^.modelfield^.variable:=varia;
s^.modelfield^.existreltreelist:=existreltr;
s^.modelfield^.nonemptyreltreelist:=nonemptyreltr;
s^.modelfield^.records:=records;
mkmodel:=s
end;

function mknodedescription(ca,re:string(220);bas,varia,keypr:BOOLEAN;
                           tna,keyst:string(220)):LEXCOMDECL_psnode;
var s:LEXCOMDECL_psnode;
begin
new(s);
s^.cat:=nodedescription;
new(s^.nodedescriptionfield);
with s^.nodedescriptionfield^ do
   begin
   catn:=ca;
   rec:=re;
   variable:=varia;
   tname:=tna;
   basiccat:=bas;
   keypresent:=keypr;
   keystr:=keyst
   end;
mknodedescription:=s
end;

function checkrecname(rec:string(220);catn:string(220)):BOOLEAN;
var s,t:string(220);
    cijfers:set of char;
begin
cijfers:=['1' , '2' , '3' , '4' , '5' , '6' , '7' , '8' , '9'];
s:=catn;
t:=rec;
set_length(t,length(t)-1);
set_length(s,length(s)+3);
s[length(s)-2]:='r';s[length(s)-1]:='e';s[length(s)]:='c';
if (s = t) and (rec[length(rec)] in cijfers) then checkrecname:=true
else
   begin
   writeln('category ',catn,' does not fit to record ',rec);
   checkrecname:=false
   end
end;

function mkreltreelist(number:INTEGER;varia:BOOLEAN;records:LEXCOMDECL_setofrecords)
   								:LEXCOMDECL_psnode;
var s:LEXCOMDECL_psnode;
begin
new(s);
s^.cat:=reltreelist;
new(s^.reltreelistfield);
s^.reltreelistfield^.numberofsons:=number;
s^.reltreelistfield^.variable:=varia;
s^.reltreelistfield^.records:=records;
mkreltreelist:=s
end;

function mkcapairs(levelpar,number:INTEGER):LEXCOMDECL_psnode;
var s:LEXCOMDECL_psnode;
begin
new(s);
s^.cat:=capairs;
new(s^.capairsfield);
s^.capairsfield^.numofcas:=number;
mkcapairs:=s
end;

function mkaction(number:INTEGER):LEXCOMDECL_psnode;
var s:LEXCOMDECL_psnode;
begin
new(s);
s^.cat:=action;
new(s^.actionfield);
s^.actionfield^.numberofactions:=number;
mkaction:=s
end;

function mkcondition(number:INTEGER;andcondition:BOOLEAN):LEXCOMDECL_psnode;
var s:LEXCOMDECL_psnode;
begin
new(s);
s^.cat:=condition;
new(s^.conditionfield);
s^.conditionfield^.numberofconditions:=number;
s^.conditionfield^.andcond:=andcondition;
mkcondition:=s
end;

function mkcatname(par:string(220)):LEXCOMDECL_psnode;
var s:LEXCOMDECL_psnode;
begin
new(s);
s^.cat:=catname;
new(s^.catnamefield);
s^.catnamefield^.catfield:=par;
mkcatname:= s
end;

function mkcatrecname(par:string(220)):LEXCOMDECL_psnode;
var s:LEXCOMDECL_psnode;
begin
new(s);
s^.cat:=catrecname;
new(s^.catrecnamefield);
s^.catrecnamefield^.catrecfield:=par;
mkcatrecname:= s
end;

function mkrelname(par:string(220)):LEXCOMDECL_psnode;
var s:LEXCOMDECL_psnode;
begin
new(s);
s^.cat:=relname;
new(s^.relnamefield);
s^.relnamefield^.stringfield:=par;
mkrelname:= s
end;

function rectoprec(str:string(220)):string(220);
var str1:string(220);
    i,j:INTEGER;
    recfound:BOOLEAN;
begin
i:=0;
j:=0;
set_length(str1,length(str));
while i<>length(str) do
   begin
   i:=i+1;
   j:=j+1;
   recfound:=false;
   if (str[i] in ['R','r']) and (i+3<=length(str)) then
   	begin
   	if str[i+1] in ['E','e'] then
           begin
           if str[i+2] in ['C','c'] then 
              begin
              if str[i+3] in ['1','2','3','4','5','6','7','8','9'] then 
   		begin
                recfound:=true;
                set_length(str1,length(str1)+2);
   		str1[j]:='_';
                str1[j+1]:='r';
                str1[j+2]:='e';
                str1[j+3]:='c';
                str1[j+4]:=str[i+3];
                str1[j+5]:='^';
                i:=i+3;
                j:=j+5
 		end
              end
           end
     	end;
   if not(recfound) then str1[j]:=str[i]
   end;
rectoprec:=str1
end;

function mkpascal1(par:string(220)):LEXCOMDECL_psnode;
var s:LEXCOMDECL_psnode;
    i:INTEGER;
begin
new(s);
s^.cat:=pascal;
new(s^.pascalfield);
i:=0;
set_length(s^.pascalfield^.stringfield,length(par)+2);
s^.pascalfield^.stringfield[1]:='(';
while i<>length(par) do
   begin
   i:=i+1;
   s^.pascalfield^.stringfield[i+1]:=par[i]
   end;
s^.pascalfield^.stringfield[i+2]:=')';
mkpascal1:= s
end;

function mkpascal(par:string(220)):LEXCOMDECL_psnode;
var s:LEXCOMDECL_psnode;
begin
new(s);
s^.cat:=pascal;
new(s^.pascalfield);
s^.pascalfield^.stringfield:=par;
mkpascal:= s
end;

function mktcijfer(par:string(220)):LEXCOMDECL_psnode;
var s:LEXCOMDECL_psnode;
begin
new(s);
s^.cat:=tcijfer;
new(s^.tcijferfield);
s^.tcijferfield^.tfield:= par;
mktcijfer:= s
end;

function mkmucijfer(par:string(220)):LEXCOMDECL_psnode;
var s:LEXCOMDECL_psnode;
begin
new(s);
s^.cat:=mucijfer;
new(s^.mucijferfield);
s^.mucijferfield^.mufield:= par;
mkmucijfer:= s
end;

function mkmcijfer(par:string(220)):LEXCOMDECL_psnode;
var s:LEXCOMDECL_psnode;
begin
new(s);
s^.cat:=mcijfer;
new(s^.mcijferfield);
s^.mcijferfield^.mfield:= par;
mkmcijfer:= s
end;

function mkccijfer(par:string(220)):LEXCOMDECL_psnode;
var s:LEXCOMDECL_psnode;
begin
new(s);
s^.cat:=ccijfer;
new(s^.ccijferfield);
s^.ccijferfield^.cfield:= par;
mkccijfer:= s
end;

function mkacijfer(par:string(220)):LEXCOMDECL_psnode;
var s:LEXCOMDECL_psnode;
begin
new(s);
s^.cat:=acijfer;
new(s^.acijferfield);
s^.acijferfield^.afield:= par;
mkacijfer:= s
end;

function checktcijfer(s:string(220)):BOOLEAN;
var i:INTEGER;
    cijfers:set of char;
    result:BOOLEAN;
begin
cijfers:= ['0','1','2','3','4','5','6','7','8','9'];
if (s[1] = 'T') or (s[1] = 't') then 
   begin
   i:=1;
   result:=true;
   while (i<>length(s)) and result do
   	begin
   	i:=i+1;
   	if not(s[i] in cijfers) and (s[i] <> ' ') then result:=false
   	end
   end
else result:=false;
checktcijfer:=result
end;

function checkmucijfer(s:string(220)):BOOLEAN;
var i:INTEGER;
    cijfers:set of char;
    result:BOOLEAN;
begin
cijfers:= ['0','1','2','3','4','5','6','7','8','9'];
if length(s)>2 then
 begin
 if ((s[1] = 'M') or (s[1] = 'm')) and ((s[2] = 'U') or (s[2] = 'u')) then 
   begin
   i:=2;
   result:=true;
   while (i<>length(s)) and result do
   	begin
   	i:=i+1;
   	if not(s[i] in cijfers) and (s[i] <> ' ') then result:=false
   	end
   end
 else result:=false
 end
else result:=false;
checkmucijfer:=result
end;

function checkmcijfer(s:string(220)):BOOLEAN;
var i:INTEGER;
    cijfers: set of char;
    result:BOOLEAN;
begin
cijfers:= ['0','1','2','3','4','5','6','7','8','9'];
if (s[1] = 'M') or (s[1] = 'm') then 
   begin
   i:=1;
   result:=true;
   while (i<>length(s)) and result do
   	begin
   	i:=i+1;
   	if not(s[i] in cijfers) and (s[i] <> ' ') then result:=false
   	end
   end
else result:=false;
checkmcijfer:=result
end;

function checkccijfer(s:string(220)):BOOLEAN;
var i:INTEGER;
    cijfers: set of char;
    result:BOOLEAN;
begin
cijfers:= ['0','1','2','3','4','5','6','7','8','9'];
if (s[1] = 'C') or (s[1] = 'c') then 
   begin
   i:=1;
   result:=true;
   while (i<>length(s)) and result do
   	begin
   	i:=i+1;
   	if not(s[i] in cijfers) and (s[i] <> ' ') then result:=false
   	end
   end
else result:=false;
checkccijfer:=result
end;

function checkacijfer(s:string(220)):BOOLEAN;
var i:INTEGER;
    cijfers:set of char;
    result:BOOLEAN;
begin
cijfers:= ['0','1','2','3','4','5','6','7','8','9'];
if (s[1] = 'A') or (s[1] = 'a') then 
   begin
   i:=1;
   result:=true;
   while (i<>length(s)) and result do
   	begin
   	i:=i+1;
   	if not(s[i] in cijfers) and (s[i] <> ' ') then result:=false
   	end
   end
else result:=false;
checkacijfer:=result
end;

function mkapestaart:LEXCOMDECL_psnode;
var s:LEXCOMDECL_psnode;
begin
new(s);
s^.cat:=apestaart;
mkapestaart:=s
end;

function checkapestaart(s:string(220)):BOOLEAN;
var apestaartgezien:BOOLEAN;
    faultycharseen:BOOLEAN;
    i:INTEGER;
begin
i:=0;
apestaartgezien:=false;
faultycharseen:=false;
while i<> length(s) do
   begin
   i:=i+1;
   if s[i] <> ' ' then
   	begin
   	if s[i] = '@' then apestaartgezien:=true
        else faultycharseen:=true
   	end
   end;
if apestaartgezien and not(faultycharseen) then checkapestaart:=true
else checkapestaart:=false
end;

function mkcomp:LEXCOMDECL_psnode;
var s:LEXCOMDECL_psnode;
begin
new(s);
s^.cat:=comp;
mkcomp:=s
end;

function checkcomp(s:string(220)):BOOLEAN;
var i:INTEGER;
    result:BOOLEAN;
begin
i:=0;
if s='comp' then result:=true else result:=false;
checkcomp:=result
end;

function mkdecomp:LEXCOMDECL_psnode;
var s:LEXCOMDECL_psnode;
begin
new(s);
s^.cat:=decomp;
mkdecomp:=s
end;

function checkdecomp(s:string(220)):BOOLEAN;
var i:INTEGER;
    result:BOOLEAN;
begin
i:=0;
if s='decomp' then result:=true else result:=false;
checkdecomp:=result
end;

function mkcharstring(string1:string(220)):LEXCOMDECL_psnode;
var s:LEXCOMDECL_psnode;
begin
new(s);
new(s^.charstringfield);
s^.cat:=charstring;
s^.charstringfield^.alreadyconcatenated:=true;
s^.charstringfield^.stringfield:=string1;
mkcharstring:=s
end;

procedure addstring(var doorgeefpar:LEXCOMDECL_string;string1:LEXCOMDECL_string);
var l:INTEGER;
begin
if doorgeefpar=' ' then 
   begin
   if length(string1)>0 then doorgeefpar:=string1
   end
else
   begin
   l:=0;
   set_length(doorgeefpar,length(doorgeefpar)+1);
   doorgeefpar[length(doorgeefpar)]:=' ';
   while l<>length(string1) do
   	begin
   	l:=l+1;
        set_length(doorgeefpar,length(doorgeefpar)+1);
   	doorgeefpar[length(doorgeefpar)]:=string1[l]
   	end
   end
end;

 procedure LEXCOMRULES_rule(rnr:INTEGER;a:LEXCOMDECL_nodeid;b:LEXCOMDECL_psnode;mode:LEXCOMDECL_surfrulemode);

procedure uttrule(a:LEXCOMDECL_nodeid;b:LEXCOMDECL_psnode;mode:LEXCOMDECL_surfrulemode);
begin
case a of
LEXCOMDECL_Hinit: begin end;
1: case mode of
   loccond: LEXCOMDECL_assignstatus(true);
   globcond: begin LEXCOMDECL_assignstatus(true) end;
   end;
2: case mode of
   loccond: LEXCOMDECL_assignstatus(true);
   globcond: begin LEXCOMDECL_assignstatus(true) end;
   end;
3: case mode of
   loccond: LEXCOMDECL_assignstatus(true);
   globcond: begin LEXCOMDECL_assignstatus(true) end;
   end;
4: case mode of
   loccond: LEXCOMDECL_assignstatus(true);
   globcond: begin LEXCOMDECL_assignstatus(true) end;
   end;
5: case mode of
   loccond: LEXCOMDECL_assignstatus(true);
   globcond: begin LEXCOMDECL_assignstatus(true) end;
   end;
6: case mode of
   loccond: LEXCOMDECL_assignstatus(true);
   globcond: begin LEXCOMDECL_assignstatus(true) end;
   end;
LEXCOMDECL_Hfinal: begin LEXCOMDECL_assignnewtop(addnewtop(mkutt,LEXCOMDECL_newtop));LEXCOMDECL_assignstatus(true) end
end
end;

procedure modelsrule(a:LEXCOMDECL_nodeid;b:LEXCOMDECL_psnode;mode:LEXCOMDECL_surfrulemode);
var keyrectable:LEXCOMDECL_setofrecords;
    rec1:LEXCOMDECL_string;
begin
case a of
LEXCOMDECL_Hinit: begin
                  initsetofrecords(leftrecords1);
                  initsetofrecords(rightrecords1)
                  end;
1: case mode of
   loccond: LEXCOMDECL_assignstatus(true);
   globcond: begin leftrecords1:=b^.inputmodelsfield^.records;
                   keyrectable:=keyrecords1;
                   while LEXCOMRULES_stillrecords(keyrectable) do
                     begin
                     LEXCOMRULES_takerecord(rec1,keyrectable);
                     LEXCOMRULES_appendrecord(rec1,leftrecords1);
                     end;
                   LEXCOMDECL_assignstatus(true) 
             end;
   end;
2: case mode of
   loccond: LEXCOMDECL_assignstatus(true);
   globcond: begin LEXCOMDECL_assignstatus(true);
                   rightrecords1:=b^.outputmodelfield^.records;
                   keyrectable:=keyrecords1;
                   while LEXCOMRULES_stillrecords(keyrectable) do
                     begin
                     LEXCOMRULES_takerecord(rec1,keyrectable);
                     LEXCOMRULES_appendrecord(rec1,rightrecords1);
                     end;
             end;
   end;
LEXCOMDECL_Hfinal: begin LEXCOMDECL_assignnewtop(addnewtop(mkmodels,LEXCOMDECL_newtop));LEXCOMDECL_assignstatus(true) end
end
end;

procedure inputmodelsrule(a:LEXCOMDECL_nodeid;b:LEXCOMDECL_psnode;mode:LEXCOMDECL_surfrulemode);
begin
case a of
LEXCOMDECL_Hinit: begin numberofmodels:=0; initsetofrecords(records1)
       end;
1: case mode of
   loccond: LEXCOMDECL_assignstatus(not(outputmodelname(b^.mcijferfield^.mfield)));
   globcond: begin LEXCOMDECL_assignstatus(checkmodelname(b^.mcijferfield^.mfield,
                   numberofmodels)) 
             end;
   end;
2: case mode of
   loccond: LEXCOMDECL_assignstatus(true);
   globcond: begin numberofmodels:=numberofmodels + 1;
                   appendsetofrecords(b^.modelfield^.records,records1);
                   LEXCOMDECL_assignstatus(true)  
             end;
   end;
3: case mode of 
   loccond: LEXCOMDECL_assignstatus(true);
   globcond: begin LEXCOMDECL_assignstatus(true) end;
   end;
LEXCOMDECL_Hfinal: begin LEXCOMDECL_assignnewtop(addnewtop(mkinputmodels(numberofmodels,records1),
                                                              LEXCOMDECL_newtop));
              LEXCOMDECL_assignstatus(true) end
end
end;

procedure outputmodelrule(a:LEXCOMDECL_nodeid;b:LEXCOMDECL_psnode;mode:LEXCOMDECL_surfrulemode);
begin
case a of
LEXCOMDECL_Hinit: begin initsetofrecords(records1) end;
1: case mode of
   loccond: LEXCOMDECL_assignstatus(outputmodelname(b^.mcijferfield^.mfield));
   globcond: begin LEXCOMDECL_assignstatus(true); mstring:=b^.mcijferfield^.mfield end;
   end;
2: case mode of
   loccond: LEXCOMDECL_assignstatus(true);
   globcond: begin 
             LEXCOMDECL_assignstatus(true);
             appendsetofrecords(b^.modelfield^.records,records1);
             if b^.modelfield^.variable and output_model(mstring) then
                 begin
                 writeln('error :output model ',mstring,' may not be variable');
                 LEXCOMDECL_assignstatus(false)
   		 end
             end;
   end;
3: case mode of 
   loccond: LEXCOMDECL_assignstatus(true);
   globcond: begin LEXCOMDECL_assignstatus(true) end;
   end;
LEXCOMDECL_Hfinal: begin LEXCOMDECL_assignnewtop(addnewtop(mkoutputmodel(records1),LEXCOMDECL_newtop));
        LEXCOMDECL_assignstatus(true) 
        end
end
end;

procedure modelrule(a:LEXCOMDECL_nodeid;b:LEXCOMDECL_psnode;mode:LEXCOMDECL_surfrulemode);
begin
case a of
LEXCOMDECL_Hinit: begin variable2:=false; existreltreelist:=false; 
             set_length(Tname2,1); initsetofrecords(records1);
             Tname2[1]:=' ' ;nonemptyreltreelist:=false
       end;
1: case mode of
   loccond: LEXCOMDECL_assignstatus(true);
   globcond: begin if b^.nodedescriptionfield^.variable then
                   begin
   		   variable2:=true;
                   Tname2:=b^.nodedescriptionfield^.Tname
                   end;
             IF b^.nodedescriptionfield^.keypresent THEN
               LEXCOMRULES_appendrecord(b^.nodedescriptionfield^.rec,keyrecords1)
             ELSE
               LEXCOMRULES_appendrecord(b^.nodedescriptionfield^.rec,records1);
             LEXCOMDECL_assignstatus(true)
             end;
   end;
2: case mode of
   loccond: LEXCOMDECL_assignstatus(true);
   globcond: begin LEXCOMDECL_assignstatus(true);existreltreelist:=true end;
   end;
3: case mode of
   loccond: LEXCOMDECL_assignstatus(true);
   globcond: begin 
    	     nonemptyreltreelist:=true;
             LEXCOMDECL_assignstatus(true);
   	     appendsetofrecords(b^.reltreelistfield^.records,records1);
             if variable2 then
   			begin
   			write('error: reltreelist not allowed after ',Tname2);
   			writeln;
   			LEXCOMDECL_assignstatus(false)
   			end
             end
   end;
4: case mode of
   loccond: LEXCOMDECL_assignstatus(true);
   globcond: begin LEXCOMDECL_assignstatus(true) end;
   end;
LEXCOMDECL_Hfinal: begin
        LEXCOMDECL_assignnewtop(addnewtop(mkmodel(variable2,existreltreelist,
   			nonemptyreltreelist,records1),LEXCOMDECL_newtop));
        LEXCOMDECL_assignstatus(true)
        end
end
end;

procedure nodedescriptionrule(a:LEXCOMDECL_nodeid;b:LEXCOMDECL_psnode;mode:LEXCOMDECL_surfrulemode);
VAR str: PACKED ARRAY[1..30] OF CHAR;
    len: INTEGER;
    str1:string(220);
    category: LIDOMAINT_syntcat;
procedure convertstring(catn:string(220);
           VAR str:PACKED ARRAY [lb2..ub2:INTEGER] OF CHAR;VAR len:INTEGER);
begin
len:=0;
while len<>length(catn) do
  begin
  len:=len+1;
  str[len]:=catn[len]
  end;
end;
begin
case a of
LEXCOMDECL_Hinit: begin set_length(catn,1);set_length(rec,1);
             set_length(Tname,1);basiccatstatic:=false;keypresentstatic:=false;
             catn[1]:=' ';rec[1]:=' ';Tname[1]:=' ';
             set_length(keystrstatic,1);keystrstatic[1]:=' '; end;
1: case mode of
   loccond: LEXCOMDECL_assignstatus(true);
   globcond: begin variable:=false; 
             catn:=b^.catnamefield^.catfield;
             convertstring(catn,str,len);
             LDSTRTOTYPE_cat(str,len,category);
             basiccatstatic:=LDCATSETS_blexcat(category);
             LEXCOMDECL_assignstatus(true) 
             end;
   end;
2: case mode of
   loccond: LEXCOMDECL_assignstatus(true);
   globcond: begin LEXCOMDECL_assignstatus(true) end;
   end;
3: case mode of
   loccond: LEXCOMDECL_assignstatus(true);
   globcond: begin 
             rec:=b^.catrecnamefield^.catrecfield;
             if basiccatstatic then
               begin
               str1:=rec;
               set_length(str1,length(str1)+4);
               str1[length(rec)+1]:='t';
               str1[length(rec)+2]:='r';
               str1[length(rec)+3]:='e';
               str1[length(rec)+4]:='e';
               LEXCOMRULES_appendrecord(str1,basictrees1);
               end;
             LEXCOMDECL_assignstatus(checkrecname(rec,catn))
             end;
   end;
4: case mode of
   loccond: LEXCOMDECL_assignstatus(true);
   globcond: begin LEXCOMDECL_assignstatus(true) end;
   end;
5: case mode of
   loccond: LEXCOMDECL_assignstatus(true);
   globcond: begin variable:=true; Tname:=b^.tcijferfield^.tfield;
             LEXCOMRULES_appendrecord(tname,basictrees1);
             LEXCOMDECL_assignstatus(true)
             end;
   end;
6: case mode of
   loccond: LEXCOMDECL_assignstatus(true);
   globcond: begin LEXCOMDECL_assignstatus(true) end;
   end;
7: case mode of
   loccond: LEXCOMDECL_assignstatus(true);
   globcond: begin keypresentstatic:=true; 
                   keystrstatic:=b^.charstringfield^.stringfield;
                   LEXCOMDECL_assignstatus(true) 
             end;
   end;
LEXCOMDECL_Hfinal: begin
     LEXCOMDECL_assignnewtop(addnewtop(
          mknodedescription(catn,rec,basiccatstatic,variable,keypresentstatic,Tname,keystrstatic),LEXCOMDECL_newtop));
     LEXCOMDECL_assignstatus(true)
     end
end
end;

procedure reltreelistrule(a:LEXCOMDECL_nodeid;b:LEXCOMDECL_psnode;mode:LEXCOMDECL_surfrulemode);
begin
case a of
LEXCOMDECL_Hinit: begin initsetofrecords(records1);numberofsons:=0;variable2:=false end;
1: case mode of
   loccond: LEXCOMDECL_assignstatus(true);
   globcond: begin numberofsons := numberofsons + 1; LEXCOMDECL_assignstatus(true) end;
   end;
2: case mode of
   loccond: LEXCOMDECL_assignstatus(true);
   globcond: begin LEXCOMDECL_assignstatus(true) end;
   end;
3: case mode of
   loccond: LEXCOMDECL_assignstatus(true);
   globcond: begin LEXCOMDECL_assignstatus(true) end;
   end;
4: case mode of
   loccond: LEXCOMDECL_assignstatus(true);
   globcond: begin LEXCOMDECL_assignstatus(true);
                   appendsetofrecords(b^.modelfield^.records,records1)
             end;
   end;
5: case mode of
   loccond:LEXCOMDECL_assignstatus(true);
   globcond: begin LEXCOMDECL_assignstatus(true); variable2:=true end;
   end;
LEXCOMDECL_Hfinal: begin
        LEXCOMDECL_assignnewtop(addnewtop(mkreltreelist(numberofsons,variable2,records1),
 						LEXCOMDECL_newtop));
        LEXCOMDECL_assignstatus(true)
        end
end
end;

procedure capairsrule(a:LEXCOMDECL_nodeid;b:LEXCOMDECL_psnode;mode:LEXCOMDECL_surfrulemode);
begin
case a of
LEXCOMDECL_Hinit: begin levelpar:=1; numberofson_ca_s:=0 end;
1: case mode of
   loccond: LEXCOMDECL_assignstatus(true);
   globcond: begin numberofson_ca_s:= numberofson_ca_s + 1;
             LEXCOMDECL_assignstatus(true) 
             end;
   end;
2: case mode of
   loccond: LEXCOMDECL_assignstatus(true);
   globcond: begin levelpar:= b^.capairsfield^.level + 1;LEXCOMDECL_assignstatus(true) end;
   end;
3: case mode of
   loccond: LEXCOMDECL_assignstatus(true);
   globcond: begin LEXCOMDECL_assignstatus(true) end;
   end;
LEXCOMDECL_Hfinal: begin
        LEXCOMDECL_assignnewtop(addnewtop(mkcapairs(levelpar,numberofson_ca_s),LEXCOMDECL_newtop));
        LEXCOMDECL_assignstatus(true)
        end
end
end;

procedure actionrule(a:LEXCOMDECL_nodeid;b:LEXCOMDECL_psnode;mode:LEXCOMDECL_surfrulemode);
begin
case a of
LEXCOMDECL_Hinit: numberofactions:=0;
1: case mode of
   loccond: LEXCOMDECL_assignstatus(true);
   globcond: begin LEXCOMDECL_assignstatus(true) end;
   end;
2: case mode of
   loccond: LEXCOMDECL_assignstatus(not(checkapestaart(b^.pascalfield^.stringfield)));
   globcond: begin numberofactions:=numberofactions + 1;LEXCOMDECL_assignstatus(true) end;
   end;
3: case mode of
   loccond: LEXCOMDECL_assignstatus(true);
   globcond: begin LEXCOMDECL_assignstatus(true) end;
   end;
4: case mode of
   loccond: LEXCOMDECL_assignstatus(true);
   globcond: begin LEXCOMDECL_assignstatus(true) end;
   end;
LEXCOMDECL_Hfinal: begin
        LEXCOMDECL_assignnewtop(addnewtop(mkaction(numberofactions),LEXCOMDECL_newtop));
        LEXCOMDECL_assignstatus(true) 
        end
end
end;

procedure conditionrule(a:LEXCOMDECL_nodeid;b:LEXCOMDECL_psnode;mode:LEXCOMDECL_surfrulemode);
begin
case a of
LEXCOMDECL_Hinit: begin numberofconditions:=0;andcond:=false end;
1: case mode of
   loccond: LEXCOMDECL_assignstatus(true);
   globcond: begin LEXCOMDECL_assignstatus(true) end;
   end;
2: case mode of
   loccond: LEXCOMDECL_assignstatus(true);
   globcond: begin numberofconditions:=numberofconditions + 1;
             LEXCOMDECL_assignstatus(true) 
             end;
   end;
3: case mode of
   loccond: LEXCOMDECL_assignstatus(true);
   globcond: begin LEXCOMDECL_assignstatus(true) end;
   end;
4: case mode of
   loccond: LEXCOMDECL_assignstatus(true);
   globcond: begin andcond:=true;LEXCOMDECL_assignstatus(true) end;
   end;
5: case mode of
   loccond: LEXCOMDECL_assignstatus(true);
   globcond: begin andcond:=false;LEXCOMDECL_assignstatus(true) end;
   end;
LEXCOMDECL_Hfinal: begin
        LEXCOMDECL_assignnewtop(addnewtop(mkcondition(numberofconditions,andcond),LEXCOMDECL_newtop));
        LEXCOMDECL_assignstatus(true)
        end
end
end;

procedure catnamerule(a:LEXCOMDECL_nodeid;b:LEXCOMDECL_psnode;rule:LEXCOMDECL_surfrulemode);
begin
case a of
LEXCOMDECL_Hinit: begin set_length(doorgeefpar,1);doorgeefpar[1]:=' ' end;
1: case mode of
   loccond: LEXCOMDECL_assignstatus(true);
   globcond: begin LEXCOMDECL_assignstatus(not(b^.charstringfield^.alreadyconcatenated));
             doorgeefpar:= b^.charstringfield^.stringfield 
             end;
   end;
LEXCOMDECL_Hfinal: begin
        LEXCOMDECL_assignnewtop(addnewtop(mkcatname(doorgeefpar),LEXCOMDECL_newtop));
        LEXCOMDECL_assignstatus(true) 
        end
end
end;


procedure catrecnamerule(a:LEXCOMDECL_nodeid;b:LEXCOMDECL_psnode;rule:LEXCOMDECL_surfrulemode);
begin
case a of
LEXCOMDECL_Hinit:  begin set_length(doorgeefpar,1);doorgeefpar[1]:=' ' end;
1: case mode of
   loccond: LEXCOMDECL_assignstatus(not(b^.charstringfield^.alreadyconcatenated));
   globcond: begin LEXCOMDECL_assignstatus(true);
             doorgeefpar:= b^.charstringfield^.stringfield
             end;
   end;
LEXCOMDECL_Hfinal: begin
        LEXCOMDECL_assignnewtop(addnewtop(mkcatrecname(doorgeefpar),LEXCOMDECL_newtop));
        LEXCOMDECL_assignstatus(true) 
        end
end
end;


procedure relnamerule(a:LEXCOMDECL_nodeid;b:LEXCOMDECL_psnode;rule:LEXCOMDECL_surfrulemode);
begin
case a of
LEXCOMDECL_Hinit:  begin set_length(doorgeefpar,1);doorgeefpar[1]:=' ' end;
1: case mode of
   loccond: LEXCOMDECL_assignstatus(not(b^.charstringfield^.alreadyconcatenated));
   globcond: begin LEXCOMDECL_assignstatus(true);
             doorgeefpar:= b^.charstringfield^.stringfield
             end;
   end;
LEXCOMDECL_Hfinal: begin 
        LEXCOMDECL_assignnewtop(addnewtop(mkrelname(doorgeefpar),LEXCOMDECL_newtop));
        LEXCOMDECL_assignstatus(true) 
        end
end
end;


procedure pascalrule(a:LEXCOMDECL_nodeid;b:LEXCOMDECL_psnode;rule:LEXCOMDECL_surfrulemode);
begin
case a of
LEXCOMDECL_Hinit:  begin set_length(doorgeefpar,1);doorgeefpar[1]:=' ';andcond:=false;
              bool:=false
        end;
1: case mode of
   loccond: LEXCOMDECL_assignstatus(not(checkapestaart(b^.charstringfield^.stringfield))
                        and not(checkcomp(b^.charstringfield^.stringfield)) 
                        and not(checkdecomp(b^.charstringfield^.stringfield)) 
                        and not(checkacijfer(b^.charstringfield^.stringfield)) 
                        and not(checkccijfer(b^.charstringfield^.stringfield)) 
                        and not(checktcijfer(b^.charstringfield^.stringfield)) 
                        and not(checkmcijfer(b^.charstringfield^.stringfield))
                        );
   globcond: begin LEXCOMDECL_assignstatus(true);
             doorgeefpar:= b^.charstringfield^.stringfield;
             bool:=true
             end;
   end;
2: case mode of
   loccond: LEXCOMDECL_assignstatus(true);
   globcond: begin LEXCOMDECL_assignstatus(true);
   		   if doorgeefpar=' ' then 
   				doorgeefpar:=b^.pascalfield^.stringfield
   		   else
   			begin
                        helpdoorgeefpar1:=doorgeefpar;
   			if andcond then addstring(helpdoorgeefpar1,' and ')
   			else addstring(helpdoorgeefpar1,' or ');
   		 	addstring(helpdoorgeefpar1,b^.pascalfield^.stringfield);
                        doorgeefpar:=helpdoorgeefpar1;
   			end
             end;
   end;
3: case mode of
   loccond: LEXCOMDECL_assignstatus(true);
   globcond: begin LEXCOMDECL_assignstatus(true) end;
   end;
4: case mode of
   loccond: LEXCOMDECL_assignstatus(true);
   globcond: begin andcond:=true;LEXCOMDECL_assignstatus(true) end;
   end;
5: case mode of
   loccond: LEXCOMDECL_assignstatus(true);
   globcond: begin andcond:=false;LEXCOMDECL_assignstatus(true) end;
   end;
6: case mode of
   loccond: LEXCOMDECL_assignstatus(true);
   globcond: begin LEXCOMDECL_assignstatus(true);bool:=true;
             helpdoorgeefpar1:=doorgeefpar;
             addstring(helpdoorgeefpar1,'not(');
             addstring(helpdoorgeefpar1,b^.pascalfield^.stringfield);
             addstring(helpdoorgeefpar1,') ');
             doorgeefpar:=helpdoorgeefpar1;
             end;
   end;
7: case mode of
   loccond: LEXCOMDECL_assignstatus(true);
   globcond: begin helpdoorgeefpar1:=doorgeefpar;
                   addstring(helpdoorgeefpar1,
                               rectoprec(b^.pascalfield^.stringfield));
                   doorgeefpar:=helpdoorgeefpar1;
                   LEXCOMDECL_assignstatus(true) 
             end;
   end;
8: case mode of
   loccond: LEXCOMDECL_assignstatus(true);
   globcond: begin bool:=true; helpdoorgeefpar1:=doorgeefpar;
                   addstring(helpdoorgeefpar1,':=');LEXCOMDECL_assignstatus(true);                
                   doorgeefpar:=helpdoorgeefpar1;
             end;
   end;
9: case mode of
   loccond: LEXCOMDECL_assignstatus(true);
   globcond: begin helpdoorgeefpar1:=doorgeefpar;
                   addstring(helpdoorgeefpar1,b^.pascalfield^.stringfield);
                   LEXCOMDECL_assignstatus(true);
                   doorgeefpar:=helpdoorgeefpar1;
             end;
   end;
LEXCOMDECL_Hfinal: begin 
        if bool then LEXCOMDECL_assignnewtop(addnewtop(mkpascal(doorgeefpar),LEXCOMDECL_newtop))
   	else LEXCOMDECL_assignnewtop(addnewtop(mkpascal1(doorgeefpar),LEXCOMDECL_newtop));
        LEXCOMDECL_assignstatus(true) 
        end
end
end;

procedure tcijferrule(a:LEXCOMDECL_nodeid;b:LEXCOMDECL_psnode;rule:LEXCOMDECL_surfrulemode);
begin
case a of 
LEXCOMDECL_Hinit:  begin set_length(doorgeefpar,1);doorgeefpar[1] := ' ' end;
1: case mode of
   loccond: LEXCOMDECL_assignstatus(checktcijfer(b^.charstringfield^.stringfield));
   globcond: begin LEXCOMDECL_assignstatus(true);
             doorgeefpar:= b^.charstringfield^.stringfield
             end;
   end;

LEXCOMDECL_Hfinal: begin
        LEXCOMDECL_assignstatus(true);
        LEXCOMDECL_assignnewtop(addnewtop(mktcijfer(doorgeefpar),LEXCOMDECL_newtop))
        end
end
end;

procedure mucijferrule(a:LEXCOMDECL_nodeid;b:LEXCOMDECL_psnode;rule:LEXCOMDECL_surfrulemode);
begin
case a of 
LEXCOMDECL_Hinit:  begin set_length(doorgeefpar,1);doorgeefpar[1] := ' ' end;
1: case mode of
   loccond: LEXCOMDECL_assignstatus(checkmucijfer(b^.charstringfield^.stringfield));
   globcond: begin LEXCOMDECL_assignstatus(true);
             doorgeefpar:= b^.charstringfield^.stringfield
             end;
   end;

LEXCOMDECL_Hfinal: begin
        LEXCOMDECL_assignstatus(true);
        LEXCOMDECL_assignnewtop(addnewtop(mkmucijfer(doorgeefpar),LEXCOMDECL_newtop))
        end
end
end;

procedure mcijferrule(a:LEXCOMDECL_nodeid;b:LEXCOMDECL_psnode;rule:LEXCOMDECL_surfrulemode);
begin
case a of 
LEXCOMDECL_Hinit:  begin set_length(doorgeefpar,1);doorgeefpar[1] := ' ' end;
1: case mode of
   loccond: LEXCOMDECL_assignstatus(checkmcijfer(b^.charstringfield^.stringfield));
   globcond: begin 
             doorgeefpar:= b^.charstringfield^.stringfield;LEXCOMDECL_assignstatus(true) 
             end;
   end;
LEXCOMDECL_Hfinal: begin
        LEXCOMDECL_assignstatus(true);
        LEXCOMDECL_assignnewtop(addnewtop(mkmcijfer(doorgeefpar),LEXCOMDECL_newtop))
        end
end
end;

procedure ccijferrule(a:LEXCOMDECL_nodeid;b:LEXCOMDECL_psnode;rule:LEXCOMDECL_surfrulemode);
begin
case a of 
LEXCOMDECL_Hinit:  begin set_length(doorgeefpar,1);doorgeefpar[1] := ' ' end;
1: case mode of
   loccond: LEXCOMDECL_assignstatus(checkccijfer(b^.charstringfield^.stringfield));
   globcond: begin 
             doorgeefpar:= b^.charstringfield^.stringfield;LEXCOMDECL_assignstatus(true) 
             end;
   end;
LEXCOMDECL_Hfinal: begin
        LEXCOMDECL_assignstatus(true);
        LEXCOMDECL_assignnewtop(addnewtop(mkccijfer(doorgeefpar),LEXCOMDECL_newtop))
        end
end
end;

procedure acijferrule(a:LEXCOMDECL_nodeid;b:LEXCOMDECL_psnode;rule:LEXCOMDECL_surfrulemode);
begin
case a of 
LEXCOMDECL_Hinit:  begin set_length(doorgeefpar,1);doorgeefpar[1] := ' ' end;
1: case mode of
   loccond: LEXCOMDECL_assignstatus(checkacijfer(b^.charstringfield^.stringfield));
   globcond: begin 
             doorgeefpar:= b^.charstringfield^.stringfield;LEXCOMDECL_assignstatus(true) 
             end;
   end;
LEXCOMDECL_Hfinal: begin
        LEXCOMDECL_assignstatus(true);
        LEXCOMDECL_assignnewtop(addnewtop(mkacijfer(doorgeefpar),LEXCOMDECL_newtop))
        end
end
end;

procedure apestaartrule(a:LEXCOMDECL_nodeid;b:LEXCOMDECL_psnode;mode:LEXCOMDECL_surfrulemode);
begin
case a of
LEXCOMDECL_Hinit: begin end;
1: case mode of
   loccond: begin 
            LEXCOMDECL_assignstatus(checkapestaart(b^.charstringfield^.stringfield)) end;
   globcond: begin LEXCOMDECL_assignstatus(true) end;
   end;
LEXCOMDECL_Hfinal: begin LEXCOMDECL_assignstatus(true);LEXCOMDECL_assignnewtop(addnewtop(mkapestaart,LEXCOMDECL_newtop)) 
        end;
end
end;

procedure comprule(a:LEXCOMDECL_nodeid;b:LEXCOMDECL_psnode;mode:LEXCOMDECL_surfrulemode);
begin
case a of
LEXCOMDECL_Hinit: begin end;
1: case mode of
   loccond: begin LEXCOMDECL_assignstatus(checkcomp(b^.charstringfield^.stringfield)) end;
   globcond: begin LEXCOMDECL_assignstatus(true) end;
   end;
2: case mode of
   loccond: LEXCOMDECL_assignstatus(true);
   globcond: LEXCOMDECL_assignstatus(true);
   end;
LEXCOMDECL_Hfinal: begin LEXCOMDECL_assignstatus(true);LEXCOMDECL_assignnewtop(addnewtop(mkcomp,LEXCOMDECL_newtop)) end;
end 
end;

procedure decomprule(a:LEXCOMDECL_nodeid;b:LEXCOMDECL_psnode;mode:LEXCOMDECL_surfrulemode);
begin
case a of
LEXCOMDECL_Hinit: begin end;
1: case mode of
   loccond: begin 
            LEXCOMDECL_assignstatus(checkdecomp(b^.charstringfield^.stringfield)) end;
   globcond: begin LEXCOMDECL_assignstatus(true) end;
   end;
2: case mode of
   loccond: LEXCOMDECL_assignstatus(true);
   globcond: LEXCOMDECL_assignstatus(true);
   end;
LEXCOMDECL_Hfinal: begin LEXCOMDECL_assignstatus(true);LEXCOMDECL_assignnewtop(addnewtop(mkdecomp,LEXCOMDECL_newtop)) end;
end 
end;

procedure charstringrule(a:LEXCOMDECL_nodeid;b:LEXCOMDECL_psnode;rule:LEXCOMDECL_surfrulemode);
begin
case a of
LEXCOMDECL_Hinit:  begin set_length(doorgeefpar,1);doorgeefpar[1]:=' ';concatenated:=false;
              oneopen:=false;oneclose:=false;twoopen:=false;twoclose:=false;
              doorgeefpar1:=' ';doorgeefpar2:=' '
        end;
1: case mode of
   loccond: LEXCOMDECL_assignstatus(not(checkapestaart(b^.charstringfield^.stringfield))
                        and not(checkcomp(b^.charstringfield^.stringfield)) 
                        and not(checkdecomp(b^.charstringfield^.stringfield)) 
                        and not(checkacijfer(b^.charstringfield^.stringfield)) 
                        and not(checkccijfer(b^.charstringfield^.stringfield)) 
                        and not(checktcijfer(b^.charstringfield^.stringfield)) 
                        and not(checkmcijfer(b^.charstringfield^.stringfield)) 
                        );
   globcond: begin LEXCOMDECL_assignstatus(true);
             helpdoorgeefpar1:=doorgeefpar1;
             addstring(helpdoorgeefpar1,b^.charstringfield^.stringfield);
             doorgeefpar1:=helpdoorgeefpar1;
             end;
   end;
2: case mode of
   loccond:begin
             LEXCOMDECL_assignstatus(not(checkapestaart(b^.charstringfield^.stringfield))
                        and not(checkcomp(b^.charstringfield^.stringfield)) 
                        and not(checkdecomp(b^.charstringfield^.stringfield)) 
                        and not(checkacijfer(b^.charstringfield^.stringfield)) 
                        and not(checkccijfer(b^.charstringfield^.stringfield)) 
                        and not(checktcijfer(b^.charstringfield^.stringfield)) 
                        and not(checkmcijfer(b^.charstringfield^.stringfield))
                        )
             end;
   globcond: begin LEXCOMDECL_assignstatus(true);
             concatenated:=b^.charstringfield^.alreadyconcatenated;
             helpdoorgeefpar1:=doorgeefpar2;
             addstring(helpdoorgeefpar1,b^.charstringfield^.stringfield);
             doorgeefpar2:=helpdoorgeefpar1;
             end;
   end;
3: case mode of
   loccond: LEXCOMDECL_assignstatus(true);
   globcond:begin oneopen:=true; LEXCOMDECL_assignstatus(true) end;
   end;
4: case mode of
   loccond: LEXCOMDECL_assignstatus(true);
   globcond: begin oneclose:=true; LEXCOMDECL_assignstatus(true) end;
   end;
5: case mode of
   loccond: LEXCOMDECL_assignstatus(true);
   globcond: begin twoopen:=true;LEXCOMDECL_assignstatus(true) end;
   end;
6: case mode of
   loccond: LEXCOMDECL_assignstatus(true);
   globcond: begin twoclose:=true;LEXCOMDECL_assignstatus(true) end;
   end;
LEXCOMDECL_Hfinal: begin
        if oneopen and oneclose then
   		begin
                helpdoorgeefpar1:='(';addstring(helpdoorgeefpar1,doorgeefpar1);
                addstring(helpdoorgeefpar1,')');
                doorgeefpar:=helpdoorgeefpar1;
   		end;
        if not(oneopen) and not(oneclose) then doorgeefpar:=doorgeefpar1;
        if twoopen and twoclose then
   		begin
                helpdoorgeefpar1:=doorgeefpar;
                addstring(helpdoorgeefpar1,'(');
                addstring(helpdoorgeefpar1,doorgeefpar2);
                addstring(helpdoorgeefpar1,')');
                doorgeefpar:=helpdoorgeefpar1;
                concatenated:=false
   		end;
        if not(twoopen) and not(twoclose) then begin
                helpdoorgeefpar1:=doorgeefpar;
   		addstring(helpdoorgeefpar1,doorgeefpar2);
                doorgeefpar:=doorgeefpar1;
           end;
        LEXCOMDECL_assignstatus(true);
        if oneopen and not(oneclose) then LEXCOMDECL_assignstatus(false);
        if oneclose and not(oneopen) then LEXCOMDECL_assignstatus(false);
        if twoopen and not(twoclose) then LEXCOMDECL_assignstatus(false);
        if twoclose and not(twoopen) then LEXCOMDECL_assignstatus(false);
        if concatenated then LEXCOMDECL_assignstatus(false);
        if LEXCOMDECL_status then
   	        LEXCOMDECL_assignnewtop(addnewtop(mkcharstring(doorgeefpar),LEXCOMDECL_newtop))
        end
end
end;


begin
case rnr of
1: uttrule(a,b,mode);
2: modelsrule(a,b,mode);
3: inputmodelsrule(a,b,mode);
4: outputmodelrule(a,b,mode);
5: modelrule(a,b,mode);
6: nodedescriptionrule(a,b,mode);
7: reltreelistrule(a,b,mode);
8: capairsrule(a,b,mode);
9: actionrule(a,b,mode);
10: conditionrule(a,b,mode);
11: catnamerule(a,b,mode);
12: catrecnamerule(a,b,mode);
13: relnamerule(a,b,mode);
14: pascalrule(a,b,mode);
15: tcijferrule(a,b,mode);
16: mcijferrule(a,b,mode);
17: ccijferrule(a,b,mode);
18: acijferrule(a,b,mode);
19: apestaartrule(a,b,mode);
20: comprule(a,b,mode);
21: decomprule(a,b,mode);
22: charstringrule(a,b,mode);
23: mucijferrule(a,b,mode)
end
end;

