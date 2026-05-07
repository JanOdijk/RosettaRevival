export(mrucomlangspec);
pragma c_include('tstring.pf');
pragma c_include('mem.pf');
pragma c_include('mrucomlangspec.pf');
program mrucomlangspec;
with tstring,mem;
var
    word:array[1..mrucomlangspec_nrow] of tstring_string;
    wcat:array[1..mrucomlangspec_nrow] of mrucomlangspec_category;
    scat:array[char] of mrucomlangspec_category;
 function mrucomlangspec_scanchars:setofchar;
begin
mrucomlangspec_scanchars:=['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x',
'y','z','A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z','1','2','3',
'4','5','6','7','8','9','0']
end;
 procedure mrucomlangspec_init;
begin
scat['%'] := PROCENT;
scat[''''] := QUOTEtje;
scat['<'] := LEFTARROW;
scat['>'] := RIGHTARROW;
scat['['] := SQUAREOPEN;
scat[']'] := SQUARECLOSE;
scat['{'] := CURLYOPEN;
scat['}'] := CURLYCLOSE;
scat['('] := ROUNDOPEN;
scat[')'] := ROUNDCLOSE;
scat['/'] := SLASH;
scat[':'] := DOTDOT;
scat[';'] := SEMICOLON;
scat[','] := COMMA;
scat['='] := ISCAT;
scat['@'] := APESTAART;
scat['.'] := DOT;
scat['|'] := VERTLINE;
scat['*'] := STARCAT;
scat['+'] := PLUSCAT;
scat['-'] := MINCAT;
scat['_'] := UNDERSCORE;
scat['^'] := CHAPEAU;
wcat[  1] := ALL;
tstring_constant(word[  1],'ALL',3 );
wcat[  2] := ANDCAT;
tstring_constant(word[  2],'AND',3 );
wcat[  3] := ARGUMENT;
tstring_constant(word[  3],'ARGUMENT',8 );
wcat[  4] := AUX;
tstring_constant(word[  4],'AUX',3 );
wcat[  5] := BASIC;
tstring_constant(word[  5],'BASIC',5 );
wcat[  6] := BLEX;
tstring_constant(word[  6],'BLEX',4 );
wcat[  7] := COMP;
tstring_constant(word[  7],'COMP',4 );
wcat[  8] := COMPGETIDDICT;
tstring_constant(word[  8],'COMPGETIDDICT',13);
wcat[  9] := COMPGETSIDDICT;
tstring_constant(word[  9],'COMPGETSIDDICT',14);
wcat[ 10] := COMPINIDDICT;
tstring_constant(word[ 10],'COMPINIDDICT',12);
wcat[ 11] := COMPINSIDDICT;
tstring_constant(word[ 11],'COMPINSIDDICT',13);
wcat[ 12] := COPYT;
tstring_constant(word[ 12],'COPYT',5 );
wcat[ 13] := DECOMP;
tstring_constant(word[ 13],'DECOMP',6 );
wcat[ 14] := DECOMPGETIDDICT;
tstring_constant(word[ 14],'DECOMPGETIDDICT',15);
wcat[ 15] := DECOMPGETSIDDICT;
tstring_constant(word[ 15],'DECOMPGETSIDDICT',16);
wcat[ 16] := DECOMPINIDDICT;
tstring_constant(word[ 16],'DECOMPINIDDICT',14);
wcat[ 17] := DECOMPINSIDDICT;
tstring_constant(word[ 17],'DECOMPINSIDDICT',15);
wcat[ 18] := EQUALS;
tstring_constant(word[ 18],'EQUALS',6 );
wcat[ 19] := EXCEPT;
tstring_constant(word[ 19],'EXCEPT',6 );
wcat[ 20] := EXIST;
tstring_constant(word[ 20],'EXIST',5 );
wcat[ 21] := EXPORT;
tstring_constant(word[ 21],'EXPORT',6 );
wcat[ 22] := EXPRESSION;
tstring_constant(word[ 22],'EXPRESSION',10);
wcat[ 23] := FILTER;
tstring_constant(word[ 23],'FILTER',6 );
wcat[ 24] := FIRST;
tstring_constant(word[ 24],'FIRST',5 );
wcat[ 25] := FORCAT;
tstring_constant(word[ 25],'FOR',3 );
wcat[ 26] := FROM;
tstring_constant(word[ 26],'FROM',4 );
wcat[ 27] := HEAD;
tstring_constant(word[ 27],'HEAD',4 );
wcat[ 28] := IFCAT;
tstring_constant(word[ 28],'IF',2 );
wcat[ 29] := INCAT;
tstring_constant(word[ 29],'IN',2 );
wcat[ 30] := KEYtje;
tstring_constant(word[ 30],'KEY',3 );
wcat[ 31] := KEY1;
tstring_constant(word[ 31],'KEY1',4 );
wcat[ 32] := KEY2;
tstring_constant(word[ 32],'KEY2',4 );
wcat[ 33] := KEY3;
tstring_constant(word[ 33],'KEY3',4 );
wcat[ 34] := KEY4;
tstring_constant(word[ 34],'KEY4',4 );
wcat[ 35] := KEY5;
tstring_constant(word[ 35],'KEY5',4 );
wcat[ 36] := KEY1;
tstring_constant(word[ 36],'KEY6',4 );
wcat[ 37] := KEY2;
tstring_constant(word[ 37],'KEY7',4 );
wcat[ 38] := KEY3;
tstring_constant(word[ 38],'KEY8',4 );
wcat[ 39] := KEY4;
tstring_constant(word[ 39],'KEY9',4 );
wcat[ 40] := KEY5;
tstring_constant(word[ 40],'KEY10',5 );
wcat[ 41] := LEFTTORIGHT;
tstring_constant(word[ 41],'LEFTTORIGHT',11);
wcat[ 42] := LEVEL;
tstring_constant(word[ 42],'LEVEL',5 );
wcat[ 43] := MATCHCONDITIONS;
tstring_constant(word[ 43],'MATCHCONDITIONS',15);
wcat[ 44] := NICAT;
tstring_constant(word[ 44],'NI',2 );
wcat[ 45] := NOTCAT;
tstring_constant(word[ 45],'NOT',3 );
wcat[ 46] := ORCAT;
tstring_constant(word[ 46],'OR',2 );
wcat[ 47] := PARAMETERS;
tstring_constant(word[ 47],'PARAMETERS',10);
wcat[ 48] := POSITIVE;
tstring_constant(word[ 48],'POSITIVE',8 );
wcat[ 49] := QUOTE;
tstring_constant(word[ 49],'QUOTE',5 );
wcat[ 50] := REC;
tstring_constant(word[ 50],'REC',3 );
wcat[ 51] := RIGHTTOLEFT;
tstring_constant(word[ 51],'RIGHTTOLEFT',11);
wcat[ 52] := RULE;
tstring_constant(word[ 52],'RULE',4 );
wcat[ 53] := SBONUS;
tstring_constant(word[ 53],'SBONUS',6 );
wcat[ 54] := STOP;
tstring_constant(word[ 54],'STOP',4 );
wcat[ 55] := SUBGRAMMAR;
tstring_constant(word[ 55],'SUBGRAMMAR',10);
wcat[ 56] := SUBRULE;
tstring_constant(word[ 56],'SUBRULE',7 );
wcat[ 57] := SUBST;
tstring_constant(word[ 57],'SUBST',5 );
wcat[ 58] := THENCAT;
tstring_constant(word[ 58],'THEN',4 );
wcat[ 59] := TRANSFORMATION;
tstring_constant(word[ 59],'TRANSFORMATION',14);
wcat[ 60] := VPID;
tstring_constant(word[ 60],'VPID',4 );
wcat[ 61] := WBONUS;
tstring_constant(word[ 61],'WBONUS',6 );
wcat[ 62] := WITHje;
tstring_constant(word[ 62],'WITH',4 );
wcat[ 63] := X1;
tstring_constant(word[ 63],'X1',2 );
wcat[ 64] := X2;
tstring_constant(word[ 64],'X2',2 );
wcat[ 65] := X3;
tstring_constant(word[ 65],'X3',2 );
wcat[ 66] := X4;
tstring_constant(word[ 66],'X4',2 );
wcat[ 67] := X5;
tstring_constant(word[ 67],'X5',2 );

end;
 procedure mrucomlangspec_word(i:integer;var s:tstring_string);
begin
   s := word[i]
end;
 function mrucomlangspec_wcat(i:integer):mrucomlangspec_category;
begin
    mrucomlangspec_wcat := wcat[i]
end;
 function mrucomlangspec_scat(c:char):mrucomlangspec_category;
begin
    mrucomlangspec_scat := scat[c]
end;
 procedure mrucomlangspec_createterm(s:mrucomlangspec_category;
    w:tstring_string;var f: mrucomlangspec_fielddef);
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
procedure initsetofparams(var s:mrucomlangspec_setofparams);
begin
s.first:=nil;s.last:=nil
end;
function stillparams(var s:mrucomlangspec_setofparams):boolean;
begin
if s.first<>nil then stillparams:= true
else stillparams:= false
end;
procedure takeparam(var param1:mrucomlangspec_param
        ;var s:mrucomlangspec_setofparams);
begin
if s.first=nil then begin end
else begin param1:=s.first^.arg;
     if s.first=s.last then 
     begin s.first:=nil;s.last:=nil end
     else s.first:=s.first^.next
     end
end;
procedure appendparam(param1:mrucomlangspec_param
        ;var s:mrucomlangspec_setofparams);
var p:plosparam;
begin
MEM_newdefault(loopholes.sizeof(losparam),loopholes.retype(p,MEM_ptr));
p^.arg:=param1;
p^.next:=nil;if s.first=nil then begin
s.first:=p;s.last:=p end
else begin s.last^.next:=p;
s.last:=p end
end;
procedure initsetofsyncats(var s:mrucomlangspec_setofsyncats);
begin
s.first:=nil;s.last:=nil
end;
function stillsyncats(var s:mrucomlangspec_setofsyncats):boolean;
begin
if s.first<>nil then stillsyncats:= true
else stillsyncats:= false
end;
procedure takesyncat(var syncat1:mrucomlangspec_syncat
        ;var s:mrucomlangspec_setofsyncats);
begin
if s.first=nil then begin end
else begin syncat1:=s.first^.arg;
     if s.first=s.last then 
     begin s.first:=nil;s.last:=nil end
     else s.first:=s.first^.next
     end
end;
procedure appendsyncat(syncat1:mrucomlangspec_syncat
        ;var s:mrucomlangspec_setofsyncats);
var p:plossyncat;
begin
MEM_newdefault(loopholes.sizeof(lossyncat),loopholes.retype(p,MEM_ptr));
p^.arg:=syncat1;
p^.next:=nil;if s.first=nil then begin
s.first:=p;s.last:=p end
else begin s.last^.next:=p;
s.last:=p end
end;
procedure initsetoftellers(var s:mrucomlangspec_setoftellers);
begin
s.first:=nil;s.last:=nil
end;
function stilltellers(var s:mrucomlangspec_setoftellers):boolean;
begin
if s.first<>nil then stilltellers:= true
else stilltellers:= false
end;
procedure taketeller(var teller1:mrucomlangspec_teller
        ;var s:mrucomlangspec_setoftellers);
begin
if s.first=nil then begin end
else begin teller1:=s.first^.arg;
     if s.first=s.last then 
     begin s.first:=nil;s.last:=nil end
     else s.first:=s.first^.next
     end
end;
procedure appendteller(teller1:mrucomlangspec_teller
        ;var s:mrucomlangspec_setoftellers);
var p:plosteller;
begin
MEM_newdefault(loopholes.sizeof(losteller),loopholes.retype(p,MEM_ptr));
p^.arg:=teller1;
p^.next:=nil;if s.first=nil then begin
s.first:=p;s.last:=p end
else begin s.last^.next:=p;
s.last:=p end
end;
procedure initsetofpresents(var s:mrucomlangspec_setofpresents);
begin
s.first:=nil;s.last:=nil
end;
function stillpresents(var s:mrucomlangspec_setofpresents):boolean;
begin
if s.first<>nil then stillpresents:= true
else stillpresents:= false
end;
procedure takepresent(var present1:mrucomlangspec_present
        ;var s:mrucomlangspec_setofpresents);
begin
if s.first=nil then begin end
else begin present1:=s.first^.arg;
     if s.first=s.last then 
     begin s.first:=nil;s.last:=nil end
     else s.first:=s.first^.next
     end
end;
procedure appendpresent(present1:mrucomlangspec_present
        ;var s:mrucomlangspec_setofpresents);
var p:plospresent;
begin
MEM_newdefault(loopholes.sizeof(lospresent),loopholes.retype(p,MEM_ptr));
p^.arg:=present1;
p^.next:=nil;if s.first=nil then begin
s.first:=p;s.last:=p end
else begin s.last^.next:=p;
s.last:=p end
end;
procedure initsetofidents(var s:mrucomlangspec_setofidents);
begin
s.first:=nil;s.last:=nil
end;
function stillidents(var s:mrucomlangspec_setofidents):boolean;
begin
if s.first<>nil then stillidents:= true
else stillidents:= false
end;
procedure takeident(var ident1:mrucomlangspec_ident
        ;var s:mrucomlangspec_setofidents);
begin
if s.first=nil then begin end
else begin ident1:=s.first^.arg;
     if s.first=s.last then 
     begin s.first:=nil;s.last:=nil end
     else s.first:=s.first^.next
     end
end;
procedure appendident(ident1:mrucomlangspec_ident
        ;var s:mrucomlangspec_setofidents);
var p:plosident;
begin
MEM_newdefault(loopholes.sizeof(losident),loopholes.retype(p,MEM_ptr));
p^.arg:=ident1;
p^.next:=nil;if s.first=nil then begin
s.first:=p;s.last:=p end
else begin s.last^.next:=p;
s.last:=p end
end;
procedure initsetofitemids(var s:mrucomlangspec_setofitemids);
begin
s.first:=nil;s.last:=nil
end;
function stillitemids(var s:mrucomlangspec_setofitemids):boolean;
begin
if s.first<>nil then stillitemids:= true
else stillitemids:= false
end;
procedure takeitemid(var itemid1:mrucomlangspec_itemid
        ;var s:mrucomlangspec_setofitemids);
begin
if s.first=nil then begin end
else begin itemid1:=s.first^.arg;
     if s.first=s.last then 
     begin s.first:=nil;s.last:=nil end
     else s.first:=s.first^.next
     end
end;
procedure appenditemid(itemid1:mrucomlangspec_itemid
        ;var s:mrucomlangspec_setofitemids);
var p:plositemid;
begin
MEM_newdefault(loopholes.sizeof(lositemid),loopholes.retype(p,MEM_ptr));
p^.arg:=itemid1;
p^.next:=nil;if s.first=nil then begin
s.first:=p;s.last:=p end
else begin s.last^.next:=p;
s.last:=p end
end;
procedure initsetofvartypes(var s:mrucomlangspec_setofvartypes);
begin
s.first:=nil;s.last:=nil
end;
function stillvartypes(var s:mrucomlangspec_setofvartypes):boolean;
begin
if s.first<>nil then stillvartypes:= true
else stillvartypes:= false
end;
procedure takevartype(var vartype1:mrucomlangspec_vartype
        ;var s:mrucomlangspec_setofvartypes);
begin
if s.first=nil then begin end
else begin vartype1:=s.first^.arg;
     if s.first=s.last then 
     begin s.first:=nil;s.last:=nil end
     else s.first:=s.first^.next
     end
end;
procedure appendvartype(vartype1:mrucomlangspec_vartype
        ;var s:mrucomlangspec_setofvartypes);
var p:plosvartype;
begin
MEM_newdefault(loopholes.sizeof(losvartype),loopholes.retype(p,MEM_ptr));
p^.arg:=vartype1;
p^.next:=nil;if s.first=nil then begin
s.first:=p;s.last:=p end
else begin s.last^.next:=p;
s.last:=p end
end;
procedure initsetofrecattvals(var s:mrucomlangspec_setofrecattvals);
begin
s.first:=nil;s.last:=nil
end;
function stillrecattvals(var s:mrucomlangspec_setofrecattvals):boolean;
begin
if s.first<>nil then stillrecattvals:= true
else stillrecattvals:= false
end;
procedure takerecattval(var recattval1:mrucomlangspec_recattval
        ;var s:mrucomlangspec_setofrecattvals);
begin
if s.first=nil then begin end
else begin recattval1:=s.first^.arg;
     if s.first=s.last then 
     begin s.first:=nil;s.last:=nil end
     else s.first:=s.first^.next
     end
end;
procedure appendrecattval(recattval1:mrucomlangspec_recattval
        ;var s:mrucomlangspec_setofrecattvals);
var p:plosrecattval;
begin
MEM_newdefault(loopholes.sizeof(losrecattval),loopholes.retype(p,MEM_ptr));
p^.arg:=recattval1;
p^.next:=nil;if s.first=nil then begin
s.first:=p;s.last:=p end
else begin s.last^.next:=p;
s.last:=p end
end;
procedure initsetofrightlefts(var s:mrucomlangspec_setofrightlefts);
begin
s.first:=nil;s.last:=nil
end;
function stillrightlefts(var s:mrucomlangspec_setofrightlefts):boolean;
begin
if s.first<>nil then stillrightlefts:= true
else stillrightlefts:= false
end;
procedure takerightleft(var rightleft1:mrucomlangspec_rightleft
        ;var s:mrucomlangspec_setofrightlefts);
begin
if s.first=nil then begin end
else begin rightleft1:=s.first^.arg;
     if s.first=s.last then 
     begin s.first:=nil;s.last:=nil end
     else s.first:=s.first^.next
     end
end;
procedure appendrightleft(rightleft1:mrucomlangspec_rightleft
        ;var s:mrucomlangspec_setofrightlefts);
var p:plosrightleft;
begin
MEM_newdefault(loopholes.sizeof(losrightleft),loopholes.retype(p,MEM_ptr));
p^.arg:=rightleft1;
p^.next:=nil;if s.first=nil then begin
s.first:=p;s.last:=p end
else begin s.last^.next:=p;
s.last:=p end
end;
procedure initsetofrightvarss(var s:mrucomlangspec_setofrightvarss);
begin
s.first:=nil;s.last:=nil
end;
function stillrightvarss(var s:mrucomlangspec_setofrightvarss):boolean;
begin
if s.first<>nil then stillrightvarss:= true
else stillrightvarss:= false
end;
procedure takerightvars(var rightvars1:mrucomlangspec_rightvars
        ;var s:mrucomlangspec_setofrightvarss);
begin
if s.first=nil then begin end
else begin rightvars1:=s.first^.arg;
     if s.first=s.last then 
     begin s.first:=nil;s.last:=nil end
     else s.first:=s.first^.next
     end
end;
procedure appendrightvars(rightvars1:mrucomlangspec_rightvars
        ;var s:mrucomlangspec_setofrightvarss);
var p:plosrightvars;
begin
MEM_newdefault(loopholes.sizeof(losrightvars),loopholes.retype(p,MEM_ptr));
p^.arg:=rightvars1;
p^.next:=nil;if s.first=nil then begin
s.first:=p;s.last:=p end
else begin s.last^.next:=p;
s.last:=p end
end;
