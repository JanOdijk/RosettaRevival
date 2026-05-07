export(surfcomlangspec);
pragma c_include('tstring.pf');
pragma c_include('mem.pf');
pragma c_include('surfcomlangspec.pf');
program surfcomlangspec;
with tstring,mem;
var
    word:array[1..surfcomlangspec_nrow] of tstring_string;
    wcat:array[1..surfcomlangspec_nrow] of surfcomlangspec_category;
    scat:array[char] of surfcomlangspec_category;
 function surfcomlangspec_scanchars:setofchar;
begin
surfcomlangspec_scanchars:=['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x',
'y','z','A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z','1','2','3',
'4','5','6','7','8','9','0','>','<','*','|','[',']','{','}','+','-','^']
end;
 procedure surfcomlangspec_init;
begin
scat['%'] := PROCENT;
scat['/'] := SLASH;
scat['.'] := DOT;
scat['#'] := HEKJE;
scat[','] := COMMA;
scat['('] := ROUNDOPEN;
scat[')'] := ROUNDCLOSE;
scat[':'] := COLON;
scat['='] := ISCAT;
scat[';'] := SEMICOLON;
scat['$'] := DOLLAR;
scat['_'] := UNDERSCORE;
wcat[  1] := STARRIGHT;
tstring_constant(word[  1],'*>',2 );
wcat[  2] := LEFTSTAR;
tstring_constant(word[  2],'<*',2 );
wcat[  3] := ACTION;
tstring_constant(word[  3],'ACTION',6 );
wcat[  4] := AUX;
tstring_constant(word[  4],'AUX',3 );
wcat[  5] := CONDITION;
tstring_constant(word[  5],'CONDITION',9 );
wcat[  6] := CONDITIONSANDACTIONS;
tstring_constant(word[  6],'CONDITIONSANDACTIONS',20);
wcat[  7] := GLOBAL;
tstring_constant(word[  7],'GLOBAL',6 );
wcat[  8] := HFINALCAT;
tstring_constant(word[  8],'HFINAL',6 );
wcat[  9] := HINITCAT;
tstring_constant(word[  9],'HINIT',5 );
wcat[ 10] := KEYtje;
tstring_constant(word[ 10],'KEY',3 );
wcat[ 11] := LOCALCONDITION;
tstring_constant(word[ 11],'LOCALCONDITION',14);
wcat[ 12] := MAKE;
tstring_constant(word[ 12],'MAKET',5 );
wcat[ 13] := REGULAREXPRESSION;
tstring_constant(word[ 13],'REGULAREXPRESSION',17);
wcat[ 14] := VARCAT;
tstring_constant(word[ 14],'VAR',3 );

end;
 procedure surfcomlangspec_word(i:integer;var s:tstring_string);
begin
   s := word[i]
end;
 function surfcomlangspec_wcat(i:integer):surfcomlangspec_category;
begin
    surfcomlangspec_wcat := wcat[i]
end;
 function surfcomlangspec_scat(c:char):surfcomlangspec_category;
begin
    surfcomlangspec_scat := scat[c]
end;
 procedure surfcomlangspec_createterm(s:surfcomlangspec_category;
    w:tstring_string;var f: surfcomlangspec_fielddef);
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
procedure initsetofidents(var s:surfcomlangspec_setofidents);
begin
s.first:=nil;s.last:=nil
end;
function stillidents(var s:surfcomlangspec_setofidents):boolean;
begin
if s.first<>nil then stillidents:= true
else stillidents:= false
end;
procedure takeident(var ident1:surfcomlangspec_ident
        ;var s:surfcomlangspec_setofidents);
begin
if s.first=nil then begin end
else begin ident1:=s.first^.arg;
     if s.first=s.last then 
     begin s.first:=nil;s.last:=nil end
     else s.first:=s.first^.next
     end
end;
procedure appendident(ident1:surfcomlangspec_ident
        ;var s:surfcomlangspec_setofidents);
var p:plosident;
begin
MEM_newdefault(loopholes.sizeof(losident),loopholes.retype(p,MEM_ptr));
p^.arg:=ident1;
p^.next:=nil;if s.first=nil then begin
s.first:=p;s.last:=p end
else begin s.last^.next:=p;
s.last:=p end
end;
