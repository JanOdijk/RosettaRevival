export(afxprlangspec);
pragma c_include('tstring.pf');
pragma c_include('mem.pf');
pragma c_include('afxprlangspec.pf');
program afxprlangspec;
with tstring,mem;
var
    word:array[1..afxprlangspec_nrow] of tstring_string;
    wcat:array[1..afxprlangspec_nrow] of afxprlangspec_category;
    scat:array[char] of afxprlangspec_category;
 function afxprlangspec_scanchars:setofchar;
begin
afxprlangspec_scanchars:=['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y',
'z','A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z','1','2','3','4',
'5','6','7','8','9','0']
end;
 procedure afxprlangspec_init;
begin
scat['='] := EQUAL;
scat['.'] := DOT;
scat['|'] := BAR;
scat['['] := LSQUARE;
scat[']'] := RSQUARE;
scat['{'] := LCURLY;
scat['}'] := RCURLY;
scat['('] := LROUND;
scat[')'] := RROUND;
wcat[  1] := AFFIXEXPR;
tstring_constant(word[  1],'AFFIXEXPR',9 );
wcat[  2] := EXPREND;
tstring_constant(word[  2],'EXPREND',7 );

end;
 procedure afxprlangspec_word(i:integer;var s:tstring_string);
begin
   s := word[i]
end;
 function afxprlangspec_wcat(i:integer):afxprlangspec_category;
begin
    afxprlangspec_wcat := wcat[i]
end;
 function afxprlangspec_scat(c:char):afxprlangspec_category;
begin
    afxprlangspec_scat := scat[c]
end;
 procedure afxprlangspec_createterm(s:afxprlangspec_category;
    w:tstring_string;var f: afxprlangspec_fielddef);
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
procedure initsetofatomnodes(var s:afxprlangspec_setofatomnodes);
begin
s.first:=nil;s.last:=nil
end;
function stillatomnodes(var s:afxprlangspec_setofatomnodes):boolean;
begin
if s.first<>nil then stillatomnodes:= true
else stillatomnodes:= false
end;
procedure takeatomnode(var atomnode1:afxprlangspec_atomnode
        ;var s:afxprlangspec_setofatomnodes);
begin
if s.first=nil then begin end
else begin atomnode1:=s.first^.arg;
     if s.first=s.last then 
     begin s.first:=nil;s.last:=nil end
     else s.first:=s.first^.next
     end
end;
procedure appendatomnode(atomnode1:afxprlangspec_atomnode
        ;var s:afxprlangspec_setofatomnodes);
var p:plosatomnode;
begin
MEM_newdefault(loopholes.sizeof(losatomnode),loopholes.retype(p,MEM_ptr));
p^.arg:=atomnode1;
p^.next:=nil;if s.first=nil then begin
s.first:=p;s.last:=p end
else begin s.last^.next:=p;
s.last:=p end
end;
