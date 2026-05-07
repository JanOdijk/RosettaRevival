export(auxcomlangspec);
pragma c_include('tstring.pf');
pragma c_include('mem.pf');
pragma c_include('auxcomlangspec.pf');
program auxcomlangspec;
with tstring,mem;
var
    word:array[1..auxcomlangspec_nrow] of tstring_string;
    wcat:array[1..auxcomlangspec_nrow] of auxcomlangspec_category;
    scat:array[char] of auxcomlangspec_category;
 function auxcomlangspec_scanchars:setofchar;
begin
auxcomlangspec_scanchars:=['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x',
'y','z','A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z','1','2','3',
'4','5','6','7','8','9','0','_']
end;
 procedure auxcomlangspec_init;
begin
scat['<'] := LEFTARROW;
scat['>'] := RIGHTARROW;
scat['['] := SQUAREOPEN;
scat[']'] := SQUARECLOSE;
scat['('] := ROUNDOPEN;
scat[')'] := ROUNDCLOSE;
scat['{'] := CURLYOPEN;
scat['}'] := CURLYCLOSE;
scat['`'] := RIGHTQUOTE;
scat['"'] := DOUBLEQUOTE;
scat['+'] := PLUS;
scat['-'] := MINUS;
scat['*'] := ASTERISK;
scat['='] := EQUIVALENT;
scat['!'] := EXCLAMATION;
scat['?'] := QUARY;
scat[';'] := SEMICOLON;
scat['.'] := DOT;
scat[','] := COMMA;
scat[':'] := COLON;
scat['@'] := MONKEYTAIL;
scat['#'] := RAILING;
scat['$'] := DOLLAR;
scat['%'] := PERCENT;
scat['^'] := ROOF;
scat['&'] := ANDSIGN;
scat['_'] := UNDERSCORE;
scat['\'] := BACKSLASH;
scat['|'] := UPSLASH;
scat['/'] := FORWARDSLASH;
scat['¿'] := INVQUARY;
scat['¡'] := INVEXCLAMATION;
wcat[  1] := ABSTRACT;
tstring_constant(word[  1],'ABSTRACT',8 );
wcat[  2] := BASETYPE;
tstring_constant(word[  2],'BASETYPE',8 );
wcat[  3] := CATEGORY;
tstring_constant(word[  3],'CATEGORY',8 );
wcat[  4] := KEYtje;
tstring_constant(word[  4],'KEY',3 );
wcat[  5] := KEYS;
tstring_constant(word[  5],'KEYS',4 );
wcat[  6] := LANGUAGE;
tstring_constant(word[  6],'LANGUAGE',8 );
wcat[  7] := RECORDS;
tstring_constant(word[  7],'RECORDS',7 );
wcat[  8] := ABBRSETS;
tstring_constant(word[  8],'SETS',4 );
wcat[  9] := SETTYPE;
tstring_constant(word[  9],'SETTYPE',7 );
wcat[ 10] := STANDARD;
tstring_constant(word[ 10],'STANDARD',8 );
wcat[ 11] := VARCATS;
tstring_constant(word[ 11],'VARCATS',7 );
wcat[ 12] := TERM;
tstring_constant(word[ 12],'WORD',4 );

end;
 procedure auxcomlangspec_word(i:integer;var s:tstring_string);
begin
   s := word[i]
end;
 function auxcomlangspec_wcat(i:integer):auxcomlangspec_category;
begin
    auxcomlangspec_wcat := wcat[i]
end;
 function auxcomlangspec_scat(c:char):auxcomlangspec_category;
begin
    auxcomlangspec_scat := scat[c]
end;
 procedure auxcomlangspec_createterm(s:auxcomlangspec_category;
    w:tstring_string;var f: auxcomlangspec_fielddef);
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
procedure initsetofKEYs(var s:auxcomlangspec_setofKEYs);
begin
s.first:=nil;s.last:=nil
end;
function stillKEYs(var s:auxcomlangspec_setofKEYs):boolean;
begin
if s.first<>nil then stillKEYs:= true
else stillKEYs:= false
end;
procedure takeKEY(var KEY1:auxcomlangspec_KEY
        ;var s:auxcomlangspec_setofKEYs);
begin
if s.first=nil then begin end
else begin KEY1:=s.first^.arg;
     if s.first=s.last then 
     begin s.first:=nil;s.last:=nil end
     else s.first:=s.first^.next
     end
end;
procedure appendKEY(KEY1:auxcomlangspec_KEY
        ;var s:auxcomlangspec_setofKEYs);
var p:plosKEY;
begin
MEM_newdefault(loopholes.sizeof(losKEY),loopholes.retype(p,MEM_ptr));
p^.arg:=KEY1;
p^.next:=nil;if s.first=nil then begin
s.first:=p;s.last:=p end
else begin s.last^.next:=p;
s.last:=p end
end;
procedure initsetofidents(var s:auxcomlangspec_setofidents);
begin
s.first:=nil;s.last:=nil
end;
function stillidents(var s:auxcomlangspec_setofidents):boolean;
begin
if s.first<>nil then stillidents:= true
else stillidents:= false
end;
procedure takeident(var ident1:auxcomlangspec_ident
        ;var s:auxcomlangspec_setofidents);
begin
if s.first=nil then begin end
else begin ident1:=s.first^.arg;
     if s.first=s.last then 
     begin s.first:=nil;s.last:=nil end
     else s.first:=s.first^.next
     end
end;
procedure appendident(ident1:auxcomlangspec_ident
        ;var s:auxcomlangspec_setofidents);
var p:plosident;
begin
MEM_newdefault(loopholes.sizeof(losident),loopholes.retype(p,MEM_ptr));
p^.arg:=ident1;
p^.next:=nil;if s.first=nil then begin
s.first:=p;s.last:=p end
else begin s.last^.next:=p;
s.last:=p end
end;
