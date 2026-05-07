export(surflinklangspec);
pragma c_include('tstring.pf');
pragma c_include('mem.pf');
pragma c_include('surflinklangspec.pf');
program surflinklangspec;
with tstring,mem;
var
    word:array[1..surflinklangspec_nrow] of tstring_string;
    wcat:array[1..surflinklangspec_nrow] of surflinklangspec_category;
    scat:array[char] of surflinklangspec_category;
 function surflinklangspec_scanchars:setofchar;
begin
surflinklangspec_scanchars:=['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x',
'y','z','A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z','1','2','3',
'4','5','6','7','8','9','0','_']
end;
 procedure surflinklangspec_init;
begin
scat['%'] := PROCENT;
scat['/'] := SLASH;
scat['.'] := DOT;
scat['|'] := VERTLINE;
scat['='] := ISCAT;
scat[')'] := ROUNDCLOSE;
scat['('] := ROUNDOPEN;
scat['}'] := CURLYCLOSE;
scat['{'] := CURLYOPEN;
scat[']'] := SQUARECLOSE;
scat['['] := SQUAREOPEN;
scat['#'] := HEKJE;
scat[':'] := COLON;
scat[';'] := SEMICOLON;
scat['+'] := PLUS;
wcat[  1] := XXXX;
tstring_constant(word[  1],'XXXX',4 );

end;
 procedure surflinklangspec_word(i:integer;var s:tstring_string);
begin
   s := word[i]
end;
 function surflinklangspec_wcat(i:integer):surflinklangspec_category;
begin
    surflinklangspec_wcat := wcat[i]
end;
 function surflinklangspec_scat(c:char):surflinklangspec_category;
begin
    surflinklangspec_scat := scat[c]
end;
 procedure surflinklangspec_createterm(s:surflinklangspec_category;
    w:tstring_string;var f: surflinklangspec_fielddef);
begin
   new(f.terminal);
   tstring_uppercase(f.terminal^.str,w)
end;
procedure initint(var s:integer);
begin
s:=0;
end;
procedure initbool(var s:boolean);
begin
s:=false;
end;
procedure initsetofptrs(var s:surflinklangspec_setofptrs);
begin
s.first:=nil;s.last:=nil
end;
function stillptrs(var s:surflinklangspec_setofptrs):boolean;
begin
if s.first<>nil then stillptrs:= true
else stillptrs:= false
end;
procedure takeptr(var ptr1:surflinklangspec_ptr
        ;var s:surflinklangspec_setofptrs);
begin
if s.first=nil then begin end
else begin ptr1:=s.first^.arg;
     if s.first=s.last then 
     begin s.first:=nil;s.last:=nil end
     else s.first:=s.first^.next
     end
end;
procedure appendptr(ptr1:surflinklangspec_ptr
        ;var s:surflinklangspec_setofptrs);
var p:plosptr;
begin
MEM_newdefault(loopholes.sizeof(losptr),loopholes.retype(p,MEM_ptr));
p^.arg:=ptr1;
p^.next:=nil;if s.first=nil then begin
s.first:=p;s.last:=p end
else begin s.last^.next:=p;
s.last:=p end
end;
procedure initsetofidts(var s:surflinklangspec_setofidts);
begin
s.first:=nil;s.last:=nil
end;
function stillidts(var s:surflinklangspec_setofidts):boolean;
begin
if s.first<>nil then stillidts:= true
else stillidts:= false
end;
procedure takeidt(var idt1:surflinklangspec_idt
        ;var s:surflinklangspec_setofidts);
begin
if s.first=nil then begin end
else begin idt1:=s.first^.arg;
     if s.first=s.last then 
     begin s.first:=nil;s.last:=nil end
     else s.first:=s.first^.next
     end
end;
procedure appendidt(idt1:surflinklangspec_idt
        ;var s:surflinklangspec_setofidts);
var p:plosidt;
begin
MEM_newdefault(loopholes.sizeof(losidt),loopholes.retype(p,MEM_ptr));
p^.arg:=idt1;
p^.next:=nil;if s.first=nil then begin
s.first:=p;s.last:=p end
else begin s.last^.next:=p;
s.last:=p end
end;
procedure initsetofshds(var s:surflinklangspec_setofshds);
begin
s.first:=nil;s.last:=nil
end;
function stillshds(var s:surflinklangspec_setofshds):boolean;
begin
if s.first<>nil then stillshds:= true
else stillshds:= false
end;
procedure takeshd(var shd1:surflinklangspec_shd
        ;var s:surflinklangspec_setofshds);
begin
if s.first=nil then begin end
else begin shd1:=s.first^.arg;
     if s.first=s.last then 
     begin s.first:=nil;s.last:=nil end
     else s.first:=s.first^.next
     end
end;
procedure appendshd(shd1:surflinklangspec_shd
        ;var s:surflinklangspec_setofshds);
var p:plosshd;
begin
MEM_newdefault(loopholes.sizeof(losshd),loopholes.retype(p,MEM_ptr));
p^.arg:=shd1;
p^.next:=nil;if s.first=nil then begin
s.first:=p;s.last:=p end
else begin s.last^.next:=p;
s.last:=p end
end;
procedure initsetoftrans(var s:surflinklangspec_setoftrans);
begin
s.first:=nil;s.last:=nil
end;
function stilltrans(var s:surflinklangspec_setoftrans):boolean;
begin
if s.first<>nil then stilltrans:= true
else stilltrans:= false
end;
procedure taketran(var tran1:surflinklangspec_tran
        ;var s:surflinklangspec_setoftrans);
begin
if s.first=nil then begin end
else begin tran1:=s.first^.arg;
     if s.first=s.last then 
     begin s.first:=nil;s.last:=nil end
     else s.first:=s.first^.next
     end
end;
procedure appendtran(tran1:surflinklangspec_tran
        ;var s:surflinklangspec_setoftrans);
var p:plostran;
begin
MEM_newdefault(loopholes.sizeof(lostran),loopholes.retype(p,MEM_ptr));
p^.arg:=tran1;
p^.next:=nil;if s.first=nil then begin
s.first:=p;s.last:=p end
else begin s.last^.next:=p;
s.last:=p end
end;
procedure initsetofnodes(var s:surflinklangspec_setofnodes);
begin
s.first:=nil;s.last:=nil
end;
function stillnodes(var s:surflinklangspec_setofnodes):boolean;
begin
if s.first<>nil then stillnodes:= true
else stillnodes:= false
end;
procedure takenode(var node1:surflinklangspec_node
        ;var s:surflinklangspec_setofnodes);
begin
if s.first=nil then begin end
else begin node1:=s.first^.arg;
     if s.first=s.last then 
     begin s.first:=nil;s.last:=nil end
     else s.first:=s.first^.next
     end
end;
procedure appendnode(node1:surflinklangspec_node
        ;var s:surflinklangspec_setofnodes);
var p:plosnode;
begin
MEM_newdefault(loopholes.sizeof(losnode),loopholes.retype(p,MEM_ptr));
p^.arg:=node1;
p^.next:=nil;if s.first=nil then begin
s.first:=p;s.last:=p end
else begin s.last^.next:=p;
s.last:=p end
end;
procedure initsetofautos(var s:surflinklangspec_setofautos);
begin
s.first:=nil;s.last:=nil
end;
function stillautos(var s:surflinklangspec_setofautos):boolean;
begin
if s.first<>nil then stillautos:= true
else stillautos:= false
end;
procedure takeauto(var auto1:surflinklangspec_auto
        ;var s:surflinklangspec_setofautos);
begin
if s.first=nil then begin end
else begin auto1:=s.first^.arg;
     if s.first=s.last then 
     begin s.first:=nil;s.last:=nil end
     else s.first:=s.first^.next
     end
end;
procedure appendauto(auto1:surflinklangspec_auto
        ;var s:surflinklangspec_setofautos);
var p:plosauto;
begin
MEM_newdefault(loopholes.sizeof(losauto),loopholes.retype(p,MEM_ptr));
p^.arg:=auto1;
p^.next:=nil;if s.first=nil then begin
s.first:=p;s.last:=p end
else begin s.last^.next:=p;
s.last:=p end
end;
