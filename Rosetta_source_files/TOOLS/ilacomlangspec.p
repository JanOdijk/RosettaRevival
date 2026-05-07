export(ilacomlangspec);
pragma c_include('tstring.pf');
pragma c_include('mem.pf');
pragma c_include('ilacomlangspec.pf');
program ilacomlangspec;
with tstring,mem;
var
    word:array[1..ilacomlangspec_nrow] of tstring_string;
    wcat:array[1..ilacomlangspec_nrow] of ilacomlangspec_category;
    scat:array[char] of ilacomlangspec_category;
 function ilacomlangspec_scanchars:setofchar;
begin
ilacomlangspec_scanchars:=['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x',
'y','z','A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z','1','2','3',
'4','5','6','7','8','9','0','_']
end;
 procedure ilacomlangspec_init;
begin
scat['<'] := LEFTARROW;
scat['>'] := RIGHTARROW;
scat['['] := SQUAREOPEN;
scat[']'] := SQUARECLOSE;
scat['('] := ROUNDOPEN;
scat[')'] := ROUNDCLOSE;
scat['{'] := CURLYOPEN;
scat['}'] := CURLYCLOSE;
scat[':'] := COLON;
scat[','] := COMMA;
scat[';'] := SEMICOLON;
scat['='] := EQUIVALENT;
scat['.'] := DOT;
wcat[  1] := BOOLEANtje;
tstring_constant(word[  1],'BOOLEAN',7 );
wcat[  2] := DEFINITION;
tstring_constant(word[  2],'DEFINITION',10);
wcat[  3] := ILRULES;
tstring_constant(word[  3],'ILRULES',7 );
wcat[  4] := INTEGERtje;
tstring_constant(word[  4],'INTEGER',7 );
wcat[  5] := INTERLINGUA;
tstring_constant(word[  5],'INTERLINGUA',11);
wcat[  6] := LEVEL;
tstring_constant(word[  6],'LEVEL',5 );
wcat[  7] := OFtje;
tstring_constant(word[  7],'OF',2 );
wcat[  8] := PARAMETERS;
tstring_constant(word[  8],'PARAMETERS',10);
wcat[  9] := SETtje;
tstring_constant(word[  9],'SET',3 );
wcat[ 10] := TYPEStje;
tstring_constant(word[ 10],'TYPES',5 );

end;
 procedure ilacomlangspec_word(i:integer;var s:tstring_string);
begin
   s := word[i]
end;
 function ilacomlangspec_wcat(i:integer):ilacomlangspec_category;
begin
    ilacomlangspec_wcat := wcat[i]
end;
 function ilacomlangspec_scat(c:char):ilacomlangspec_category;
begin
    ilacomlangspec_scat := scat[c]
end;
 procedure ilacomlangspec_createterm(s:ilacomlangspec_category;
    w:tstring_string;var f: ilacomlangspec_fielddef);
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
procedure initsetoftypespecs(var s:ilacomlangspec_setoftypespecs);
begin
s.first:=nil;s.last:=nil
end;
function stilltypespecs(var s:ilacomlangspec_setoftypespecs):boolean;
begin
if s.first<>nil then stilltypespecs:= true
else stilltypespecs:= false
end;
procedure taketypespec(var typespec1:ilacomlangspec_typespec
        ;var s:ilacomlangspec_setoftypespecs);
begin
if s.first=nil then begin end
else begin typespec1:=s.first^.arg;
     if s.first=s.last then 
     begin s.first:=nil;s.last:=nil end
     else s.first:=s.first^.next
     end
end;
procedure appendtypespec(typespec1:ilacomlangspec_typespec
        ;var s:ilacomlangspec_setoftypespecs);
var p:plostypespec;
begin
MEM_newdefault(loopholes.sizeof(lostypespec),loopholes.retype(p,MEM_ptr));
p^.arg:=typespec1;
p^.next:=nil;if s.first=nil then begin
s.first:=p;s.last:=p end
else begin s.last^.next:=p;
s.last:=p end
end;
procedure initsetofidents(var s:ilacomlangspec_setofidents);
begin
s.first:=nil;s.last:=nil
end;
function stillidents(var s:ilacomlangspec_setofidents):boolean;
begin
if s.first<>nil then stillidents:= true
else stillidents:= false
end;
procedure takeident(var ident1:ilacomlangspec_ident
        ;var s:ilacomlangspec_setofidents);
begin
if s.first=nil then begin end
else begin ident1:=s.first^.arg;
     if s.first=s.last then 
     begin s.first:=nil;s.last:=nil end
     else s.first:=s.first^.next
     end
end;
procedure appendident(ident1:ilacomlangspec_ident
        ;var s:ilacomlangspec_setofidents);
var p:plosident;
begin
MEM_newdefault(loopholes.sizeof(losident),loopholes.retype(p,MEM_ptr));
p^.arg:=ident1;
p^.next:=nil;if s.first=nil then begin
s.first:=p;s.last:=p end
else begin s.last^.next:=p;
s.last:=p end
end;
procedure initsetofparams(var s:ilacomlangspec_setofparams);
begin
s.first:=nil;s.last:=nil
end;
function stillparams(var s:ilacomlangspec_setofparams):boolean;
begin
if s.first<>nil then stillparams:= true
else stillparams:= false
end;
procedure takeparam(var param1:ilacomlangspec_param
        ;var s:ilacomlangspec_setofparams);
begin
if s.first=nil then begin end
else begin param1:=s.first^.arg;
     if s.first=s.last then 
     begin s.first:=nil;s.last:=nil end
     else s.first:=s.first^.next
     end
end;
procedure appendparam(param1:ilacomlangspec_param
        ;var s:ilacomlangspec_setofparams);
var p:plosparam;
begin
MEM_newdefault(loopholes.sizeof(losparam),loopholes.retype(p,MEM_ptr));
p^.arg:=param1;
p^.next:=nil;if s.first=nil then begin
s.first:=p;s.last:=p end
else begin s.last^.next:=p;
s.last:=p end
end;
procedure initsetofrulespecs(var s:ilacomlangspec_setofrulespecs);
begin
s.first:=nil;s.last:=nil
end;
function stillrulespecs(var s:ilacomlangspec_setofrulespecs):boolean;
begin
if s.first<>nil then stillrulespecs:= true
else stillrulespecs:= false
end;
procedure takerulespec(var rulespec1:ilacomlangspec_rulespec
        ;var s:ilacomlangspec_setofrulespecs);
begin
if s.first=nil then begin end
else begin rulespec1:=s.first^.arg;
     if s.first=s.last then 
     begin s.first:=nil;s.last:=nil end
     else s.first:=s.first^.next
     end
end;
procedure appendrulespec(rulespec1:ilacomlangspec_rulespec
        ;var s:ilacomlangspec_setofrulespecs);
var p:plosrulespec;
begin
MEM_newdefault(loopholes.sizeof(losrulespec),loopholes.retype(p,MEM_ptr));
p^.arg:=rulespec1;
p^.next:=nil;if s.first=nil then begin
s.first:=p;s.last:=p end
else begin s.last^.next:=p;
s.last:=p end
end;
