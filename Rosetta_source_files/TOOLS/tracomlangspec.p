export(tracomlangspec);
pragma c_include('tstring.pf');
pragma c_include('mem.pf');
pragma c_include('tracomlangspec.pf');
program tracomlangspec;
with tstring,mem;
var
    word:array[1..tracomlangspec_nrow] of tstring_string;
    wcat:array[1..tracomlangspec_nrow] of tracomlangspec_category;
    scat:array[char] of tracomlangspec_category;
 function tracomlangspec_scanchars:setofchar;
begin
tracomlangspec_scanchars:=['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x',
'y','z','A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z','1','2','3',
'4','5','6','7','8','9','0','_']
end;
 procedure tracomlangspec_init;
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
scat['='] := EQUIVALENT;
scat['-'] := DASH;
scat['|'] := BAR;
scat['+'] := PLUS;
wcat[  1] := ANDCAT;
tstring_constant(word[  1],'AND',3 );
wcat[  2] := INCAT;
tstring_constant(word[  2],'IN',2 );
wcat[  3] := LANGUAGE;
tstring_constant(word[  3],'LANGUAGE',8 );
wcat[  4] := LEVEL;
tstring_constant(word[  4],'LEVEL',5 );
wcat[  5] := NICAT;
tstring_constant(word[  5],'NI',2 );
wcat[  6] := NOTCAT;
tstring_constant(word[  6],'NOT',3 );
wcat[  7] := ORCAT;
tstring_constant(word[  7],'OR',2 );
wcat[  8] := PARAMETER;
tstring_constant(word[  8],'PARAMETER',9 );
wcat[  9] := RULE;
tstring_constant(word[  9],'RULE',4 );
wcat[ 10] := SBONUS;
tstring_constant(word[ 10],'SBONUS',6 );
wcat[ 11] := TRANSLATION;
tstring_constant(word[ 11],'TRANSLATION',11);
wcat[ 12] := WBONUS;
tstring_constant(word[ 12],'WBONUS',6 );
wcat[ 13] := X1;
tstring_constant(word[ 13],'X1',2 );
wcat[ 14] := X2;
tstring_constant(word[ 14],'X2',2 );
wcat[ 15] := X3;
tstring_constant(word[ 15],'X3',2 );

end;
 procedure tracomlangspec_word(i:integer;var s:tstring_string);
begin
   s := word[i]
end;
 function tracomlangspec_wcat(i:integer):tracomlangspec_category;
begin
    tracomlangspec_wcat := wcat[i]
end;
 function tracomlangspec_scat(c:char):tracomlangspec_category;
begin
    tracomlangspec_scat := scat[c]
end;
 procedure tracomlangspec_createterm(s:tracomlangspec_category;
    w:tstring_string;var f: tracomlangspec_fielddef);
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
procedure initsetofidents(var s:tracomlangspec_setofidents);
begin
s.first:=nil;s.last:=nil
end;
function stillidents(var s:tracomlangspec_setofidents):boolean;
begin
if s.first<>nil then stillidents:= true
else stillidents:= false
end;
procedure takeident(var ident1:tracomlangspec_ident
        ;var s:tracomlangspec_setofidents);
begin
if s.first=nil then begin end
else begin ident1:=s.first^.arg;
     if s.first=s.last then 
     begin s.first:=nil;s.last:=nil end
     else s.first:=s.first^.next
     end
end;
procedure appendident(ident1:tracomlangspec_ident
        ;var s:tracomlangspec_setofidents);
var p:plosident;
begin
MEM_newdefault(loopholes.sizeof(losident),loopholes.retype(p,MEM_ptr));
p^.arg:=ident1;
p^.next:=nil;if s.first=nil then begin
s.first:=p;s.last:=p end
else begin s.last^.next:=p;
s.last:=p end
end;
procedure initsetofidentsets(var s:tracomlangspec_setofidentsets);
begin
s.first:=nil;s.last:=nil
end;
function stillidentsets(var s:tracomlangspec_setofidentsets):boolean;
begin
if s.first<>nil then stillidentsets:= true
else stillidentsets:= false
end;
procedure takeidentset(var identset1:tracomlangspec_identset
        ;var s:tracomlangspec_setofidentsets);
begin
if s.first=nil then begin end
else begin identset1:=s.first^.arg;
     if s.first=s.last then 
     begin s.first:=nil;s.last:=nil end
     else s.first:=s.first^.next
     end
end;
procedure appendidentset(identset1:tracomlangspec_identset
        ;var s:tracomlangspec_setofidentsets);
var p:plosidentset;
begin
MEM_newdefault(loopholes.sizeof(losidentset),loopholes.retype(p,MEM_ptr));
p^.arg:=identset1;
p^.next:=nil;if s.first=nil then begin
s.first:=p;s.last:=p end
else begin s.last^.next:=p;
s.last:=p end
end;
procedure initsetofpairs(var s:tracomlangspec_setofpairs);
begin
s.first:=nil;s.last:=nil
end;
function stillpairs(var s:tracomlangspec_setofpairs):boolean;
begin
if s.first<>nil then stillpairs:= true
else stillpairs:= false
end;
procedure takepair(var pair1:tracomlangspec_pair
        ;var s:tracomlangspec_setofpairs);
begin
if s.first=nil then begin end
else begin pair1:=s.first^.arg;
     if s.first=s.last then 
     begin s.first:=nil;s.last:=nil end
     else s.first:=s.first^.next
     end
end;
procedure appendpair(pair1:tracomlangspec_pair
        ;var s:tracomlangspec_setofpairs);
var p:plospair;
begin
MEM_newdefault(loopholes.sizeof(lospair),loopholes.retype(p,MEM_ptr));
p^.arg:=pair1;
p^.next:=nil;if s.first=nil then begin
s.first:=p;s.last:=p end
else begin s.last^.next:=p;
s.last:=p end
end;
procedure initsetofnumcodes(var s:tracomlangspec_setofnumcodes);
begin
s.first:=nil;s.last:=nil
end;
function stillnumcodes(var s:tracomlangspec_setofnumcodes):boolean;
begin
if s.first<>nil then stillnumcodes:= true
else stillnumcodes:= false
end;
procedure takenumcode(var numcode1:tracomlangspec_numcode
        ;var s:tracomlangspec_setofnumcodes);
begin
if s.first=nil then begin end
else begin numcode1:=s.first^.arg;
     if s.first=s.last then 
     begin s.first:=nil;s.last:=nil end
     else s.first:=s.first^.next
     end
end;
procedure appendnumcode(numcode1:tracomlangspec_numcode
        ;var s:tracomlangspec_setofnumcodes);
var p:plosnumcode;
begin
MEM_newdefault(loopholes.sizeof(losnumcode),loopholes.retype(p,MEM_ptr));
p^.arg:=numcode1;
p^.next:=nil;if s.first=nil then begin
s.first:=p;s.last:=p end
else begin s.last^.next:=p;
s.last:=p end
end;
procedure initsetofpairsets(var s:tracomlangspec_setofpairsets);
begin
s.first:=nil;s.last:=nil
end;
function stillpairsets(var s:tracomlangspec_setofpairsets):boolean;
begin
if s.first<>nil then stillpairsets:= true
else stillpairsets:= false
end;
procedure takepairset(var pairset1:tracomlangspec_pairset
        ;var s:tracomlangspec_setofpairsets);
begin
if s.first=nil then begin end
else begin pairset1:=s.first^.arg;
     if s.first=s.last then 
     begin s.first:=nil;s.last:=nil end
     else s.first:=s.first^.next
     end
end;
procedure appendpairset(pairset1:tracomlangspec_pairset
        ;var s:tracomlangspec_setofpairsets);
var p:plospairset;
begin
MEM_newdefault(loopholes.sizeof(lospairset),loopholes.retype(p,MEM_ptr));
p^.arg:=pairset1;
p^.next:=nil;if s.first=nil then begin
s.first:=p;s.last:=p end
else begin s.last^.next:=p;
s.last:=p end
end;
procedure initsetofsimples(var s:tracomlangspec_setofsimples);
begin
s.first:=nil;s.last:=nil
end;
function stillsimples(var s:tracomlangspec_setofsimples):boolean;
begin
if s.first<>nil then stillsimples:= true
else stillsimples:= false
end;
procedure takesimple(var simple1:tracomlangspec_simple
        ;var s:tracomlangspec_setofsimples);
begin
if s.first=nil then begin end
else begin simple1:=s.first^.arg;
     if s.first=s.last then 
     begin s.first:=nil;s.last:=nil end
     else s.first:=s.first^.next
     end
end;
procedure appendsimple(simple1:tracomlangspec_simple
        ;var s:tracomlangspec_setofsimples);
var p:plossimple;
begin
MEM_newdefault(loopholes.sizeof(lossimple),loopholes.retype(p,MEM_ptr));
p^.arg:=simple1;
p^.next:=nil;if s.first=nil then begin
s.first:=p;s.last:=p end
else begin s.last^.next:=p;
s.last:=p end
end;
procedure initsetofsimplesets(var s:tracomlangspec_setofsimplesets);
begin
s.first:=nil;s.last:=nil
end;
function stillsimplesets(var s:tracomlangspec_setofsimplesets):boolean;
begin
if s.first<>nil then stillsimplesets:= true
else stillsimplesets:= false
end;
procedure takesimpleset(var simpleset1:tracomlangspec_simpleset
        ;var s:tracomlangspec_setofsimplesets);
begin
if s.first=nil then begin end
else begin simpleset1:=s.first^.arg;
     if s.first=s.last then 
     begin s.first:=nil;s.last:=nil end
     else s.first:=s.first^.next
     end
end;
procedure appendsimpleset(simpleset1:tracomlangspec_simpleset
        ;var s:tracomlangspec_setofsimplesets);
var p:plossimpleset;
begin
MEM_newdefault(loopholes.sizeof(lossimpleset),loopholes.retype(p,MEM_ptr));
p^.arg:=simpleset1;
p^.next:=nil;if s.first=nil then begin
s.first:=p;s.last:=p end
else begin s.last^.next:=p;
s.last:=p end
end;
