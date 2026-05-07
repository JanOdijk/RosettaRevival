EXPORT(auxcomcode);
pragma C_include('auxcomcode.pf');
pragma C_include('auxcomdecl.pf');
pragma C_include('auxcomlangspec.pf');
pragma C_include('ldtypetostr.pf');
pragma C_include('lduniquerels.pf');
pragma C_include('ldmrules.pf');
pragma C_include('files.pf');
pragma C_include('tfiles.pf');
pragma C_include('tstring.pf');
pragma C_include('str.pf');
pragma C_include('string.pf');
pragma C_include('strings.pf');
pragma C_include('lidomaint.pf');
pragma C_include('mem.pf');
pragma C_include('tldstrtostr.pf');
pragma C_include('ldconvrec.pf');
pragma C_include('tldconvrec.pf');
pragma C_include('ldstrtotype.pf');
pragma C_include('ldcatsets.pf');
PROGRAM auxcomCODE;
WITH auxcomlangspec,
auxcomdecl,ldtypetostr,lduniquerels,ldmrules,files,tfiles,tstring,lidomaint,str,mem,
tldstrtostr,ldconvrec,tldconvrec,ldstrtotype,ldcatsets,strng;
VAR ARGUMENTS__keyrec              :auxcomlangspec_KEY
;ARGUMENTS__maxstringlength              :auxcomlangspec_int
;ARGLIST__numb              :TSTRING_string
;NUMBER__numb              :TSTRING_string
;TERMARGUMENT__term              :TSTRING_string
;PUNCTUATION__punct              :auxcomlangspec_leesteken
;TYPESECTION__typeId              :TSTRING_string
;FIELDLIST__recassign              :LOCALFILE
;FIELDVALUE__fieldId              :TSTRING_string
;FIELDVALUE__NumberOfFieldsInh              :auxcomlangspec_INT
;FIELDVALUE__NumberOfFieldsSyn              :auxcomlangspec_INT
;FIELDVALUE__recassign              :LOCALFILE
;ABBRLIST__NumOfAbbrsInh              :auxcomlangspec_INT
;ABBRLIST__NumOfAbbrsSyn              :auxcomlangspec_INT
;NUMABBRS__NumOfAbbrsInh              :auxcomlangspec_INT
;NUMABBRS__NumOfAbbrsSyn              :auxcomlangspec_INT
;of1:files_text;
of2:files_text;
of3:files_text;
PROCEDURE auxcomCODE_UTTproc(top:auxcomDECL_psnode
);
VAR currenttree:auxcomDECL_psnode;
    rsnode1:auxcomDECL_prsnode;
 
basetypes: auxcomLANGSPEC_setofidents;
ident: auxcomLANGSPEC_ident;
newentries:BOOLEAN;
BEGIN
BEGIN basetypes:=top^.ldfield.UTTfield^.basetypes;
newentries:=top^.ldfield.UTTfield^.newentries;
END;
rsnode1:=top^.sonlist;
  while rsnode1<>nil do
  begin
  currenttree:=rsnode1^.node;
  case rsnode1^.sonnumber of

1: begin
  BEGIN END
; auxcomCODE_LANGVERSIONproc(currenttree
);
 BEGIN 
TFILES_open(of1,'auxenv',6,3);
BEGIN
TFILES_writeline(of1,TRUE);


TAB(of1,5);TFILES_writestr(of1,
'pragma C_include(''string.pf'');',FILES_maxIO,0,left);

TFILES_writeline(of1,TRUE);


TAB(of1,5);TFILES_writestr(of1,
'pragma C_include(''files.pf'');',FILES_maxIO,0,left);

TFILES_writeline(of1,TRUE);


TAB(of1,5);TFILES_writestr(of1,
'pragma C_include(''lsdomaint.pf'');',FILES_maxIO,0,left);

TFILES_writeline(of1,TRUE);

TFILES_writeline(of1,TRUE);


TFILES_writestr(of1,
'PACKAGE LSAUXDOM;',FILES_maxIO,0,left);

TFILES_writeline(of1,TRUE);

TFILES_writeline(of1,TRUE);


TFILES_writestr(of1,
'WITH strng,files,lsdomaint;',FILES_maxIO,0,left);

TFILES_writeline(of1,TRUE);


IF stillidents(basetypes) THEN BEGIN TFILES_writestr(of1,
'TYPE ',FILES_maxIO,0,left);

TFILES_writeline(of1,TRUE);

 END;
WHILE stillidents(basetypes) DO
BEGIN
takeident(ident,basetypes);
TFILES_writestr(of1,
'SETOF',FILES_maxIO,0,left);

 TFILES_writestring(of1,
ident.str,0,left);

 TFILES_writestr(of1,
'=SET OF LSDOMAINT_',FILES_maxIO,0,left);


TFILES_writestring(of1,
ident.str,0,left);

 TFILES_writestr(of1,
';',FILES_maxIO,0,left);

TFILES_writeline(of1,TRUE);


END;
END;
TFILES_open(of2,'auxpas',6,3);
BEGIN
TFILES_writeline(of2,TRUE);


TFILES_writestr(of2,
'EXPORT(lsauxdom);',FILES_maxIO,0,left);

TFILES_writeline(of2,TRUE);


IF newentries THEN
BEGIN TAB(of2,5);TFILES_writestr(of2,
'pragma C_include(''constfile.pf'');',FILES_maxIO,0,left);

TFILES_writeline(of2,TRUE);

 END;
TAB(of2,5);TFILES_writestr(of2,
'pragma C_include(''lsauxdom.pf'');',FILES_maxIO,0,left);

TFILES_writeline(of2,TRUE);


TAB(of2,5);TFILES_writestr(of2,
'pragma C_include(''string.pf'');',FILES_maxIO,0,left);

TFILES_writeline(of2,TRUE);


TAB(of2,5);TFILES_writestr(of2,
'pragma C_include(''files.pf'');',FILES_maxIO,0,left);

TFILES_writeline(of2,TRUE);


TAB(of2,5);TFILES_writestr(of2,
'pragma C_include(''lsdomaint.pf'');',FILES_maxIO,0,left);

TFILES_writeline(of2,TRUE);

 
TAB(of2,5);TFILES_writestr(of2,
'pragma C_include(''strtokey.pf'');',FILES_maxIO,0,left);

TFILES_writeline(of2,TRUE);


TFILES_writestr(of2,
'PROGRAM LSAUXDOM;',FILES_maxIO,0,left);

TFILES_writeline(of2,TRUE);

TFILES_writeline(of2,TRUE);


TFILES_writestr(of2,
'WITH strng,files,lsdomaint,strtokey;',FILES_maxIO,0,left);

TFILES_writeline(of2,TRUE);


TFILES_writestr(of2,
'FUNCTION auxkey(strkey:STRING_string):INTEGER;',FILES_maxIO,0,left);

TFILES_writeline(of2,TRUE);


TFILES_writestr(of2,
'VAR int:INTEGER;',FILES_maxIO,0,left);

TFILES_writeline(of2,TRUE);


TFILES_writestr(of2,
'BEGIN',FILES_maxIO,0,left);

TFILES_writeline(of2,TRUE);


TFILES_writestr(of2,
' STRTOKEY_getSkey(strkey,int); auxkey:=int;',FILES_maxIO,0,left);

TFILES_writeline(of2,TRUE);


TFILES_writestr(of2,
'END;',FILES_maxIO,0,left);

TFILES_writeline(of2,TRUE);


END;
TFILES_open(of3,'substpas',8,3);
BEGIN
TFILES_writeline(of3,TRUE);


TFILES_writestr(of3,
'EXPORT(ldsubsttovar);',FILES_maxIO,0,left);

TFILES_writeline(of3,TRUE);


TAB(of3,5);TFILES_writestr(of3,
'pragma C_include(''ldsubsttovar.pf'');',FILES_maxIO,0,left);

TFILES_writeline(of3,TRUE);

 
TAB(of3,5);TFILES_writestr(of3,
'pragma C_include(''lsdomaint.pf'');',FILES_maxIO,0,left);

TFILES_writeline(of3,TRUE);

 
TAB(of3,5);TFILES_writestr(of3,
'pragma C_include(''listree.pf'');',FILES_maxIO,0,left);

TFILES_writeline(of3,TRUE);

 
TAB(of3,5);TFILES_writestr(of3,
'pragma C_include(''lsstree.pf'');',FILES_maxIO,0,left);

TFILES_writeline(of3,TRUE);


TAB(of3,5);TFILES_writestr(of3,
'pragma C_include(''maket.pf'');',FILES_maxIO,0,left);

TFILES_writeline(of3,TRUE);

 
TFILES_writestr(of3,
'PROGRAM LDSUBSTTOVAR;',FILES_maxIO,0,left);

TFILES_writeline(of3,TRUE);

TFILES_writeline(of3,TRUE);


TFILES_writestr(of3,
'WITH lsdomaint,listree,lsstree,maket;',FILES_maxIO,0,left);

TFILES_writeline(of3,TRUE);


END;
END
END;

2: begin
  BEGIN END
; auxcomCODE_KEYSECTIONproc(currenttree
);
 BEGIN 
END
END;

3: begin
  BEGIN END
; auxcomCODE_RECSECTIONproc(currenttree
);
 BEGIN END
END;

4: begin
  BEGIN END
; auxcomCODE_ABBRSECTIONproc(currenttree
);
 BEGIN END
END;

5: begin
  BEGIN END
; auxcomCODE_VARCATSECTIONproc(currenttree
);
 BEGIN END
END;

END;

rsnode1:=rsnode1^.brother END;
 BEGIN
BEGIN
TFILES_writeline(of1,TRUE);

TFILES_writeline(of1,TRUE);


TFILES_writestr(of1,
'END; {LSAUXDOM}',FILES_maxIO,0,left);


END;
BEGIN
TFILES_writeline(of2,TRUE);

TFILES_writeline(of2,TRUE);


END;
BEGIN
TFILES_writeline(of3,TRUE);

TFILES_writeline(of3,TRUE);


END
END
END;
PROCEDURE auxcomCODE_LANGVERSIONproc(top:auxcomDECL_psnode
);
VAR currenttree:auxcomDECL_psnode;
    rsnode1:auxcomDECL_prsnode;

BEGIN
 BEGIN 
END;
rsnode1:=top^.sonlist;
  while rsnode1<>nil do
  begin
  currenttree:=rsnode1^.node;
  case rsnode1^.sonnumber of

1: begin
  BEGIN
END
;
 BEGIN END
END;

2: begin
  BEGIN END
;
 BEGIN END
END;

END;

rsnode1:=rsnode1^.brother END;
BEGIN
END
END;
PROCEDURE auxcomCODE_KEYSECTIONproc(top:auxcomDECL_psnode
);
VAR currenttree:auxcomDECL_psnode;
    rsnode1:auxcomDECL_prsnode;
 tempkey : auxcomLANGSPEC_KEY;
keytable: auxcomLANGSPEC_setofKEYS;
newkeytable: auxcomLANGSPEC_setofKEYS;
maxstringlength:INTEGER;
BEGIN
 BEGIN 
INITSETOFkeys(newkeytable);
INITSETOFkeys(keytable);
maxstringlength:=0;
END;
rsnode1:=top^.sonlist;
  while rsnode1<>nil do
  begin
  currenttree:=rsnode1^.node;
  case rsnode1^.sonnumber of

1: begin
  BEGIN END
;
 BEGIN END
END;

2: begin
  BEGIN END
;
 BEGIN END
END;

3: begin
  BEGIN
ARGUMENTS__maxstringlength:=maxstringlength;
END
; auxcomCODE_ARGUMENTSproc(currenttree
,ARGUMENTS__keyrec
,ARGUMENTS__maxstringlength
);
 BEGIN
maxstringlength := ARGUMENTS__maxstringlength;
IF currenttree^.ldfield.ARGUMENTSfield^.oldentry THEN
APPENDkey(ARGUMENTS__keyrec,keytable) 
ELSE APPENDkey(ARGUMENTS__keyrec,newkeytable)
END
END;

END;

rsnode1:=rsnode1^.brother END;
BEGIN
IF stillkeys(keytable) THEN BEGIN  TFILES_writestr(of1,
'CONST',FILES_maxIO,0,left);

 TFILES_writeline(of1,TRUE);

 END;
WHILE STILLkeys(keytable) do
BEGIN
TAKEkey(tempkey,keytable);
BEGIN  
TAB(of1,2);
TFILES_writestring(of1,
tempkey.string,0,left);

;
TAB(of1,maxstringlength-tempkey.stringlength);
TFILES_writestr(of1,
' = ',FILES_maxIO,0,left);

;
TFILES_writestring(of1,
tempkey.number,0,left);

;
TFILES_writestr(of1,
';',FILES_maxIO,0,left);

 TFILES_writeline(of1,TRUE);


END
END;
WHILE STILLkeys(newkeytable) DO
BEGIN
takekey(tempkey,newkeytable);

TFILES_writestr(of1,
' FUNCTION LSAUXDOM_',FILES_maxIO,0,left);

 TFILES_writestring(of1,
tempkey.string,0,left);


TFILES_writestr(of1,
':INTEGER; EXTERNAL;',FILES_maxIO,0,left);

TFILES_writeline(of1,TRUE);

 

TFILES_writestr(of2,
' FUNCTION LSAUXDOM_',FILES_maxIO,0,left);

 TFILES_writestring(of2,
tempkey.string,0,left);


TFILES_writestr(of2,
':INTEGER;',FILES_maxIO,0,left);

TFILES_writeline(of2,TRUE);


TFILES_writestr(of2,
'BEGIN',FILES_maxIO,0,left);

TFILES_writeline(of2,TRUE);


TFILES_writestr(of2,
'LSAUXDOM_',FILES_maxIO,0,left);

 TFILES_writestring(of2,
tempkey.string,0,left);

 TFILES_writestr(of2,
':=',FILES_maxIO,0,left);


TFILES_writestr(of2,
'CONSTFILE_',FILES_maxIO,0,left);

 TFILES_writestring(of2,
tempkey.string,0,left);

TFILES_writeline(of2,TRUE);


TFILES_writestr(of2,
'END;',FILES_maxIO,0,left);

TFILES_writeline(of2,TRUE);


END
END
END;
PROCEDURE auxcomCODE_ARGUMENTSproc(top:auxcomDECL_psnode
;var ARGUMENTS_keyrec              :auxcomlangspec_KEY
;var ARGUMENTS_maxstringlength              :auxcomlangspec_int
);
VAR currenttree:auxcomDECL_psnode;
    rsnode1:auxcomDECL_prsnode;
 StringLength : integer; 
tempkey : auxcomLANGSPEC_KEY;
TempString : TSTRING_string;
oldentry :BOOLEAN;
BEGIN
 BEGIN oldentry:=top^.ldfield.ARGUMENTSfield^.oldentry END;
rsnode1:=top^.sonlist;
  while rsnode1<>nil do
  begin
  currenttree:=rsnode1^.node;
  case rsnode1^.sonnumber of

1: begin
  BEGIN
TempString:=currenttree^.ldfield.TERMINAL^.str;
TSTRING_Concat(tempkey.string,'LSAUXDOM_',TempString);
StringLength:=TSTRING_length(currenttree^.ldfield.TERMINAL^.str);
tempkey.StringLength:=StringLength;
END
;
 BEGIN END
END;

2: begin
  BEGIN END
;
 BEGIN END
END;

3: begin
  BEGIN END
; auxcomCODE_ARGLISTproc(currenttree
,ARGLIST__numb
);
 BEGIN 
tempkey.number:=ARGLIST__numb;
END
END;

END;

rsnode1:=rsnode1^.brother END;
BEGIN
IF not oldentry THEN tempkey.string:=tempstring;
ARGUMENTS_keyrec:=tempkey;
IF StringLength > ARGUMENTS_maxstringlength THEN
ARGUMENTS_maxstringlength:=StringLength 
END
END;
PROCEDURE auxcomCODE_ARGLISTproc(top:auxcomDECL_psnode
;var ARGLIST_numb              :TSTRING_string
);
VAR currenttree:auxcomDECL_psnode;
    rsnode1:auxcomDECL_prsnode;
 KeyNumber,
KeyTerm,
KeyCat : TSTRING_string;
BEGIN
 BEGIN END;
rsnode1:=top^.sonlist;
  while rsnode1<>nil do
  begin
  currenttree:=rsnode1^.node;
  case rsnode1^.sonnumber of

1: begin
  BEGIN
END
;
 BEGIN END
END;

2: begin
  BEGIN END
; auxcomCODE_NUMBERproc(currenttree
,NUMBER__numb
);
 BEGIN
KeyNumber:=NUMBER__numb
END
END;

3: begin
  BEGIN 
KeyCat:=currenttree^.ldfield.TERMINAL^.str
END
;
 BEGIN 
END
END;

4: begin
  BEGIN END
; auxcomCODE_TERMARGUMENTproc(currenttree
,TERMARGUMENT__term
);
 BEGIN 
KeyTerm:=TERMARGUMENT__term
END
END;

END;

rsnode1:=rsnode1^.brother END;
BEGIN
ARGLIST_numb:=KeyNumber;
END
END;
PROCEDURE auxcomCODE_NUMBERproc(top:auxcomDECL_psnode
;var NUMBER_numb              :TSTRING_string
);
VAR currenttree:auxcomDECL_psnode;
    rsnode1:auxcomDECL_prsnode;
 str : TSTRING_string;
BEGIN
 BEGIN END;
rsnode1:=top^.sonlist;
  while rsnode1<>nil do
  begin
  currenttree:=rsnode1^.node;
  case rsnode1^.sonnumber of

1: begin
  BEGIN
str:=currenttree^.ldfield.TERMINAL^.str;
END
;
 BEGIN END
END;

END;

rsnode1:=rsnode1^.brother END;
BEGIN 
NUMBER_numb:=str;
END
END;
PROCEDURE auxcomCODE_TERMARGUMENTproc(top:auxcomDECL_psnode
;var TERMARGUMENT_term              :TSTRING_string
);
VAR currenttree:auxcomDECL_psnode;
    rsnode1:auxcomDECL_prsnode;
 term : TSTRING_string;
punct: auxcomLANGSPEC_leesteken;
BEGIN
 BEGIN 
term:='';
punct:=GeenLeesteken;
END;
rsnode1:=top^.sonlist;
  while rsnode1<>nil do
  begin
  currenttree:=rsnode1^.node;
  case rsnode1^.sonnumber of

1: begin
  BEGIN
term:=currenttree^.ldfield.TERMINAL^.str;
END
;
 BEGIN END
END;

2: begin
  BEGIN
term:='ABSTRACT';
END
;
 BEGIN END
END;

3: begin
  BEGIN
END
; auxcomCODE_PUNCTUATIONproc(currenttree
,PUNCTUATION__punct
);
 BEGIN
punct:=PUNCTUATION__punct;
END
END;

END;

rsnode1:=rsnode1^.brother END;
BEGIN 
TERMARGUMENT_term:=term;
END
END;
PROCEDURE auxcomCODE_PUNCTUATIONproc(top:auxcomDECL_psnode
;var PUNCTUATION_punct              :auxcomlangspec_leesteken
);
VAR currenttree:auxcomDECL_psnode;
    rsnode1:auxcomDECL_prsnode;
 punct : auxcomLANGSPEC_leesteken;
BEGIN
 BEGIN END;
rsnode1:=top^.sonlist;
  while rsnode1<>nil do
  begin
  currenttree:=rsnode1^.node;
  case rsnode1^.sonnumber of

1: begin
  BEGIN
punct:=haakopen
END
;
 BEGIN END
END;

2: begin
  BEGIN
punct:=haaksluit
END
;
 BEGIN END
END;

3: begin
  BEGIN
punct:=rechtopen
END
;
 BEGIN END
END;

4: begin
  BEGIN
punct:=rechtsluit
END
;
 BEGIN END
END;

5: begin
  BEGIN
punct:=rondopen
END
;
 BEGIN END
END;

6: begin
  BEGIN
punct:=rondsluit
END
;
 BEGIN END
END;

7: begin
  BEGIN
punct:=acculadeopen
END
;
 BEGIN END
END;

8: begin
  BEGIN
punct:=acculadesluit
END
;
 BEGIN END
END;

9: begin
  BEGIN
punct:=quoterechts
END
;
 BEGIN END
END;

11: begin
  BEGIN
punct:=dubbelequote
END
;
 BEGIN END
END;

12: begin
  BEGIN
punct:=min
END
;
 BEGIN END
END;

13: begin
  BEGIN
punct:=sterretje
END
;
 BEGIN END
END;

14: begin
  BEGIN
punct:=is
END
;
 BEGIN END
END;

15: begin
  BEGIN
punct:=uitroepteken
END
;
 BEGIN END
END;

16: begin
  BEGIN
punct:=vraagteken
END
;
 BEGIN END
END;

17: begin
  BEGIN
punct:=dubbelepunt
END
;
 BEGIN END
END;

18: begin
  BEGIN
punct:=komma
END
;
 BEGIN END
END;

19: begin
  BEGIN
punct:=puntcomma
END
;
 BEGIN END
END;

20: begin
  BEGIN
punct:=punt
END
;
 BEGIN END
END;

21: begin
  BEGIN
punct:=apestaartje
END
;
 BEGIN END
END;

22: begin
  BEGIN
punct:=hekje
END
;
 BEGIN END
END;

23: begin
  BEGIN
punct:=dollarteken
END
;
 BEGIN END
END;

24: begin
  BEGIN
punct:=procent
END
;
 BEGIN END
END;

25: begin
  BEGIN
punct:=dakje
END
;
 BEGIN END
END;

26: begin
  BEGIN
punct:=en
END
;
 BEGIN END
END;

27: begin
  BEGIN
punct:=onderstreepje
END
;
 BEGIN END
END;

28: begin
  BEGIN
punct:=terugslash
END
;
 BEGIN END
END;

29: begin
  BEGIN
punct:=verticaleslash
END
;
 BEGIN END
END;

30: begin
  BEGIN
punct:=vooruitslash
END
;
 BEGIN END
END;

31: begin
  BEGIN
punct:=plusteken
END
;
 BEGIN END
END;

32: begin
  BEGIN
punct:=invvraagteken
END
;
 BEGIN END
END;

33: begin
  BEGIN
punct:=invuitroepteken
END
;
 BEGIN END
END;

END;

rsnode1:=rsnode1^.brother END;
BEGIN 
PUNCTUATION_punct:=punct
END
END;
PROCEDURE auxcomCODE_RECSECTIONproc(top:auxcomDECL_psnode
);
VAR currenttree:auxcomDECL_psnode;
    rsnode1:auxcomDECL_prsnode;

BEGIN 
 BEGIN 
END;
rsnode1:=top^.sonlist;
  while rsnode1<>nil do
  begin
  currenttree:=rsnode1^.node;
  case rsnode1^.sonnumber of

1: begin
  BEGIN
END
;
 BEGIN END
END;

2: begin
  BEGIN END
; auxcomCODE_NUMRECORDSproc(currenttree
);
 BEGIN END
END;

END;

rsnode1:=rsnode1^.brother END;
BEGIN END
END;
PROCEDURE auxcomCODE_NUMRECORDSproc(top:auxcomDECL_psnode
);
VAR currenttree:auxcomDECL_psnode;
    rsnode1:auxcomDECL_prsnode;
 ConcTypeId,
functionId,
recordId,
typeId:TSTRING_string;
recassign:LOCALFILE;
BEGIN
 BEGIN INITLOCALFILE(recassign) END;
rsnode1:=top^.sonlist;
  while rsnode1<>nil do
  begin
  currenttree:=rsnode1^.node;
  case rsnode1^.sonnumber of

1: begin
  BEGIN
recordId:=currenttree^.ldfield.TERMINAL^.str; 
END
;
 BEGIN END
END;

2: begin
  BEGIN END
;
 BEGIN END
END;

3: begin
  BEGIN 
END
; auxcomCODE_FIELDLISTproc(currenttree
,FIELDLIST__recassign
);
 BEGIN 

appendstring(' PROCEDURE LSAUXDOM_As',recassign);
 
appendstring(recordId,recassign);
 appendstring('(VAR rec:',recassign);
 appendstring(ConctypeId,recassign);

appendstring(');',recassign);
appendstring('\\',recassign);

appendstring('BEGIN',recassign);
appendstring('\\',recassign);

appendstring('WITH rec DO',recassign);
appendstring('\\',recassign);

appendstring('BEGIN',recassign);
appendstring('\\',recassign);

APPENDLOCFILE(FIELDLIST__recassign,recassign);
appendstring('END',recassign);
appendstring('\\',recassign);

appendstring('END;',recassign);
appendstring('\\',recassign);

END
END;

4: begin
  BEGIN 
END
; auxcomCODE_TYPESECTIONproc(currenttree
,TYPESECTION__typeId
);
 BEGIN 
typeId:=TYPESECTION__typeId;
TSTRING_Concat(functionId,'LSAUXDOM_Cp',recordId);
TSTRING_Concat(ConcTypeId,'LSDOMAINT_',typeId);
BEGIN
 TFILES_writeline(of1,TRUE);


TFILES_writestr(of1,
' FUNCTION ',FILES_maxIO,0,left);

;TFILES_writestring(of1,
functionId,0,left);

TFILES_writeline(of1,TRUE);


TAB(of1,25); TFILES_writestr(of1,
'(rec:',FILES_maxIO,0,left);

;TFILES_writestring(of1,
ConcTypeId,0,left);

;TFILES_writestr(of1,
'):BOOLEAN;',FILES_maxIO,0,left);

TFILES_writeline(of1,TRUE);


TAB(of1,11);TFILES_writestr(of1,
'EXTERNAL;',FILES_maxIO,0,left);

TFILES_writeline(of1,TRUE);

;
TFILES_writestr(of1,
' PROCEDURE LSAUXDOM_As',FILES_maxIO,0,left);

 TFILES_writestring(of1,
recordId,0,left);

TFILES_writeline(of1,TRUE);


TAB(of1,25); TFILES_writestr(of1,
'(VAR rec:',FILES_maxIO,0,left);

;TFILES_writestring(of1,
ConcTypeId,0,left);

;TFILES_writestr(of1,
');',FILES_maxIO,0,left);

TFILES_writeline(of1,TRUE);


TAB(of1,11);TFILES_writestr(of1,
'EXTERNAL;',FILES_maxIO,0,left);

TFILES_writeline(of1,TRUE);

;
 TFILES_writeline(of2,TRUE);


TFILES_writestr(of2,
' FUNCTION ',FILES_maxIO,0,left);

;TFILES_writestring(of2,
functionId,0,left);

TFILES_writeline(of2,TRUE);


TAB(of2,25); TFILES_writestr(of2,
'(rec:',FILES_maxIO,0,left);

;TFILES_writestring(of2,
ConcTypeId,0,left);

;TFILES_writestr(of2,
'):BOOLEAN;',FILES_maxIO,0,left);

TFILES_writeline(of2,TRUE);


TFILES_writestr(of2,
'VAR Bool : BOOLEAN;',FILES_maxIO,0,left);

TFILES_writeline(of2,TRUE);


TFILES_writestr(of2,
'BEGIN ',FILES_maxIO,0,left);

 TFILES_writeline(of2,TRUE);


TAB(of2,2); 
TFILES_writestr(of2,
'Bool := FALSE;',FILES_maxIO,0,left);

TFILES_writeline(of2,TRUE);


TAB(of2,2); 
TFILES_writestr(of2,
'WITH rec DO',FILES_maxIO,0,left);

TFILES_writeline(of2,TRUE);


TAB(of2,2);
TFILES_writestr(of2,
'BEGIN',FILES_maxIO,0,left);

TFILES_writeline(of2,TRUE);


TAB(of2,4);
END;
END
END;

END;

rsnode1:=rsnode1^.brother END;
BEGIN
BEGIN

TAB(of2,2);
TFILES_writestr(of2,
'END;{with}',FILES_maxIO,0,left);

TFILES_writeline(of2,TRUE);


TAB(of2,2);
TFILES_writestring(of2,
functionId,0,left);

;TFILES_writestr(of2,
':=Bool;',FILES_maxIO,0,left);

TFILES_writeline(of2,TRUE);


TFILES_writestr(of2,
'END;{function}',FILES_maxIO,0,left);

TFILES_writeline(of2,TRUE);


END;
APPENDFILE(recassign,of2);
END;
END;
PROCEDURE auxcomCODE_TYPESECTIONproc(top:auxcomDECL_psnode
;var TYPESECTION_typeId              :TSTRING_string
);
VAR currenttree:auxcomDECL_psnode;
    rsnode1:auxcomDECL_prsnode;
 typeId : TSTRING_string;
BEGIN
 BEGIN 
END;
rsnode1:=top^.sonlist;
  while rsnode1<>nil do
  begin
  currenttree:=rsnode1^.node;
  case rsnode1^.sonnumber of

1: begin
  BEGIN 
typeId:=currenttree^.ldfield.TERMINAL^.str;
END
;
 BEGIN END
END;

END;

rsnode1:=rsnode1^.brother END;
BEGIN
TYPESECTION_typeId:=typeId;
END
END;
PROCEDURE auxcomCODE_FIELDLISTproc(top:auxcomDECL_psnode
;var FIELDLIST_recassign              :LOCALFILE
);
VAR currenttree:auxcomDECL_psnode;
    rsnode1:auxcomDECL_prsnode;
 fieldId : TSTRING_string;
NumberOfFields : INTEGER;
recassign:LOCALFILE;
BEGIN
 BEGIN 
INITLOCALFILE(recassign);
NumberOfFields:=top^.ldfield.FIELDLISTfield^.RecFieldCount
END;
rsnode1:=top^.sonlist;
  while rsnode1<>nil do
  begin
  currenttree:=rsnode1^.node;
  case rsnode1^.sonnumber of

1: begin
  BEGIN END
;
 BEGIN END
END;

2: begin
  BEGIN
fieldId:=currenttree^.ldfield.TERMINAL^.str;
END
;
 BEGIN END
END;

3: begin
  BEGIN END
;
 BEGIN END
END;

4: begin
  BEGIN
FIELDVALUE__fieldId:=fieldId;
FIELDVALUE__NumberOfFieldsInh:=NumberOfFields;
END
; auxcomCODE_FIELDVALUEproc(currenttree
,FIELDVALUE__fieldId
,FIELDVALUE__NumberOfFieldsInh
,FIELDVALUE__NumberOfFieldsSyn
,FIELDVALUE__recassign
);
 BEGIN 
APPENDLOCFILE(FIELDVALUE__recassign,recassign);
NumberOfFields:=FIELDVALUE__NumberOfFieldsSyn; 
END
END;

END;

rsnode1:=rsnode1^.brother END;
BEGIN
FIELDLIST_recassign:=recassign;
END
END;
PROCEDURE auxcomCODE_FIELDVALUEproc(top:auxcomDECL_psnode
;FIELDVALUE_fieldId              :TSTRING_string
;FIELDVALUE_NumberOfFieldsInh              :auxcomlangspec_INT
;var FIELDVALUE_NumberOfFieldsSyn              :auxcomlangspec_INT
;var FIELDVALUE_recassign              :LOCALFILE
);
VAR currenttree:auxcomDECL_psnode;
    rsnode1:auxcomDECL_prsnode;
 field_value,
fieldId,
string : TSTRING_string;
NumberOfFields : INTEGER;
recassign:LOCALFILE;
BEGIN
 BEGIN
INITLOCALFILE(recassign);
field_value:='';
fieldId:=FIELDVALUE_fieldId;
NumberOfFields:=FIELDVALUE_NumberOfFieldsInh;
END;
rsnode1:=top^.sonlist;
  while rsnode1<>nil do
  begin
  currenttree:=rsnode1^.node;
  case rsnode1^.sonnumber of

1: begin
  BEGIN
string:=currenttree^.ldfield.TERMINAL^.str;
IF TSTRING_comparebegin(string,'KEY_')=0 THEN
BEGIN
TSTRING_extractend(string,string,5);
TSTRING_Append(field_value,'auxkey(''');
TSTRING_Append(field_value,string);
TSTRING_Append(field_value,''')');
END
ELSE TSTRING_Append(field_value,string);
END
;
 BEGIN END
END;

2: begin
  BEGIN 
TSTRING_Append(field_value,'[');
END
;
 BEGIN END
END;

3: begin
  BEGIN
TSTRING_Append(field_value,']');
END
;
 BEGIN END
END;

4: begin
  BEGIN 
TSTRING_Append(field_value,',');
END
;
 BEGIN END
END;

END;

rsnode1:=rsnode1^.brother END;
BEGIN
BEGIN

TFILES_writestr(of2,
'IF (',FILES_maxIO,0,left);

 TFILES_writestring(of2,
fieldId,0,left);

 TFILES_writestr(of2,
' = ',FILES_maxIO,0,left);

 TFILES_writestring(of2,
field_value,0,left);

 
TFILES_writestr(of2,
' ) THEN',FILES_maxIO,0,left);

TFILES_writeline(of2,TRUE);


END;
IF NumberOfFields = 1 THEN
BEGIN

TAB(of2,6);
TFILES_writestr(of2,
'Bool:=TRUE;',FILES_maxIO,0,left);

TFILES_writeline(of2,TRUE);


END;

appendstring(fieldId,recassign);
 appendstring(' := ',recassign);
 appendstring(field_value,recassign);
 
appendstring(';',recassign);
appendstring('\\',recassign);

FIELDVALUE_recassign:=recassign;
FIELDVALUE_NumberOfFieldsSyn:=NumberOfFields-1; 
END;
END;
PROCEDURE auxcomCODE_ABBRSECTIONproc(top:auxcomDECL_psnode
);
VAR currenttree:auxcomDECL_psnode;
    rsnode1:auxcomDECL_prsnode;
 NumOfAbbrs : auxcomLANGSPEC_INT;
BEGIN
 BEGIN 
NumOfAbbrs:=top^.ldfield.ABBRSECTIONfield^.AbbrCounter;
BEGIN
END;
END;
rsnode1:=top^.sonlist;
  while rsnode1<>nil do
  begin
  currenttree:=rsnode1^.node;
  case rsnode1^.sonnumber of

1: begin
  BEGIN
END
;
 BEGIN END
END;

2: begin
  BEGIN END
;
 BEGIN END
END;

3: begin
  BEGIN
NUMABBRS__NumOfAbbrsInh:=NumOfAbbrs;
END
; auxcomCODE_NUMABBRSproc(currenttree
,NUMABBRS__NumOfAbbrsInh
,NUMABBRS__NumOfAbbrsSyn
);
 BEGIN
NumOfAbbrs:=NUMABBRS__NumOfAbbrsSyn;
END
END;

END;

rsnode1:=rsnode1^.brother END;
BEGIN
END;
END;
PROCEDURE auxcomCODE_NUMABBRSproc(top:auxcomDECL_psnode
;NUMABBRS_NumOfAbbrsInh              :auxcomlangspec_INT
;var NUMABBRS_NumOfAbbrsSyn              :auxcomlangspec_INT
);
VAR currenttree:auxcomDECL_psnode;
    rsnode1:auxcomDECL_prsnode;
 tempabbr : TSTRING_string;
NumOfAbbrs : auxcomLANGSPEC_INT;
typeident: TSTRING_string;
basementioned: auxcomLANGSPEC_bool;
BEGIN
 BEGIN 
typeident:=top^.ldfield.NUMABBRSfield^.typeident;
basementioned:=top^.ldfield.NUMABBRSfield^.basementioned;
NumOfAbbrs:=NUMABBRS_NumOfAbbrsInh;
END;
rsnode1:=top^.sonlist;
  while rsnode1<>nil do
  begin
  currenttree:=rsnode1^.node;
  case rsnode1^.sonnumber of

1: begin
  BEGIN
tempabbr:=currenttree^.ldfield.TERMINAL^.str;

TFILES_writestr(of1,
' FUNCTION LSAUXDOM_',FILES_maxIO,0,left);

 TFILES_writestring(of1,
tempabbr,0,left);


IF basementioned then
BEGIN TFILES_writestr(of1,
':SETOF',FILES_maxIO,0,left);

 END
ELSE BEGIN TFILES_writestr(of1,
':LSDOMAINT_',FILES_maxIO,0,left);

 END;
TFILES_writestring(of1,
typeident,0,left);

 TFILES_writestr(of1,
';EXTERNAL;',FILES_maxIO,0,left);

TFILES_writeline(of1,TRUE);



TFILES_writestr(of2,
' FUNCTION LSAUXDOM_',FILES_maxIO,0,left);

 TFILES_writestring(of2,
tempabbr,0,left);


IF basementioned then
BEGIN TFILES_writestr(of2,
':SETOF',FILES_maxIO,0,left);

 END
ELSE BEGIN TFILES_writestr(of2,
':LSDOMAINT_',FILES_maxIO,0,left);

 END;
TFILES_writestring(of2,
typeident,0,left);

 TFILES_writestr(of2,
';',FILES_maxIO,0,left);

TFILES_writeline(of2,TRUE);


TFILES_writestr(of2,
'BEGIN',FILES_maxIO,0,left);

TFILES_writeline(of2,TRUE);


TFILES_writestr(of2,
'LSAUXDOM_',FILES_maxIO,0,left);

 TFILES_writestring(of2,
tempabbr,0,left);

 TFILES_writestr(of2,
':=',FILES_maxIO,0,left);

TFILES_writeline(of2,TRUE);


END
;
 BEGIN END
END;

2: begin
  BEGIN END
;
 BEGIN END
END;

3: begin
  BEGIN
ABBRLIST__NumOfAbbrsInh:=NumOfAbbrs;
END
; auxcomCODE_ABBRLISTproc(currenttree
,ABBRLIST__NumOfAbbrsInh
,ABBRLIST__NumOfAbbrsSyn
);
 BEGIN 
NumOfAbbrs:=ABBRLIST__NumOfAbbrsSyn;
END
END;

4: begin
  BEGIN
END
;
 BEGIN 
END
END;

5: begin
  BEGIN
END
;
 BEGIN 
END
END;

6: begin
  BEGIN
END
;
 BEGIN 
END
END;

END;

rsnode1:=rsnode1^.brother END;
BEGIN
 TFILES_writestr(of2,
'END;',FILES_maxIO,0,left);

TFILES_writeline(of2,TRUE);


NUMABBRS_NumOfAbbrsSyn:=NumOfAbbrs;
END 
END;
PROCEDURE auxcomCODE_ABBRLISTproc(top:auxcomDECL_psnode
;ABBRLIST_NumOfAbbrsInh              :auxcomlangspec_INT
;var ABBRLIST_NumOfAbbrsSyn              :auxcomlangspec_INT
);
VAR currenttree:auxcomDECL_psnode;
    rsnode1:auxcomDECL_prsnode;
 str : TSTRING_string;
AbbrCounter : auxcomLANGSPEC_INT;
BEGIN
 BEGIN
AbbrCounter:=ABBRLIST_NumOfAbbrsInh; 
BEGIN
END; 
END;
rsnode1:=top^.sonlist;
  while rsnode1<>nil do
  begin
  currenttree:=rsnode1^.node;
  case rsnode1^.sonnumber of

1: begin
  BEGIN 
BEGIN

TFILES_writestr(of2,
'[',FILES_maxIO,0,left);


END;
END
;
 BEGIN END
END;

2: begin
  BEGIN 
str:=currenttree^.ldfield.TERMINAL^.str;

TFILES_writestring(of2,
str,0,left);


END
;
 BEGIN END
END;

3: begin
  BEGIN 
BEGIN

TFILES_writestr(of2,
',',FILES_maxIO,0,left);

TFILES_writeline(of2,TRUE);


END;
END
;
 BEGIN END
END;

4: begin
  BEGIN 
BEGIN

TFILES_writestr(of2,
']',FILES_maxIO,0,left);

TFILES_writeline(of2,TRUE);


END;
END
;
 BEGIN END
END;

END;

rsnode1:=rsnode1^.brother END;
BEGIN
AbbrCounter:=AbbrCounter - 1;
ABBRLIST_NumOfAbbrsSyn:=AbbrCounter;
END
END;
PROCEDURE auxcomCODE_VARCATSECTIONproc(top:auxcomDECL_psnode
);
VAR currenttree:auxcomDECL_psnode;
    rsnode1:auxcomDECL_prsnode;
 catname,varcatname:TSTRING_string;
attrstruct:TLDCONVREC_pCATattrstruct;
BEGIN
 BEGIN 
TFILES_writestr(of3,
' PROCEDURE LDSUBSTTOVAR_copy(t1:LISTREE_pstree;',FILES_maxIO,0,left);

TFILES_writeline(of3,TRUE);


TFILES_writestr(of3,
' VAR t2:LISTREE_pstree;ind:INTEGER);',FILES_maxIO,0,left);

TFILES_writeline(of3,TRUE);


TFILES_writestr(of3,
'VAR lst1,lst2:LSSTREE_pstree;',FILES_maxIO,0,left);

TFILES_writeline(of3,TRUE);


TFILES_writestr(of3,
'BEGIN',FILES_maxIO,0,left);

TFILES_writeline(of3,TRUE);


TFILES_writestr(of3,
'lst1:=loopholes.retype(t1,LSSTREE_pstree);',FILES_maxIO,0,left);

TFILES_writeline(of3,TRUE);


TFILES_writestr(of3,
'CASE lst1^.cat OF',FILES_maxIO,0,left);

 TFILES_writeline(of3,TRUE);

 
END;
rsnode1:=top^.sonlist;
  while rsnode1<>nil do
  begin
  currenttree:=rsnode1^.node;
  case rsnode1^.sonnumber of

1: begin
  BEGIN 
END
;
 BEGIN END
END;

2: begin
  BEGIN catname:=currenttree^.ldfield.TERMINAL^.str;
TFILES_writestring(of3,
catname,0,left);

 TFILES_writestr(of3,
' : BEGIN',FILES_maxIO,0,left);

 TFILES_writeline(of3,TRUE);


END
;
 BEGIN END
END;

3: begin
  BEGIN varcatname:=currenttree^.ldfield.TERMINAL^.str;

TFILES_writestr(of3,
'lst2:=MAKET_stree(',FILES_maxIO,0,left);

 TFILES_writestring(of3,
varcatname,0,left);

 TFILES_writestr(of3,
');',FILES_maxIO,0,left);

TFILES_writeline(of3,TRUE);


attrstruct:=TLDCONVREC_catattrbs(catname);
TFILES_writestr(of3,
'lst2^.ls^.',FILES_maxIO,0,left);

 TFILES_writestring(of3,
varcatname,0,left);

 TFILES_writestr(of3,
'field^.index:=ind;',FILES_maxIO,0,left);

TFILES_writeline(of3,TRUE);


WHILE attrstruct<>nil DO
BEGIN
TFILES_writestr(of3,
'lst2^.ls^.',FILES_maxIO,0,left);

 TFILES_writestring(of3,
varcatname,0,left);

 TFILES_writestr(of3,
'field^.',FILES_maxIO,0,left);

 
TFILES_writestring(of3,
attrstruct^.fieldname,0,left);

 TFILES_writestr(of3,
':=',FILES_maxIO,0,left);


TFILES_writestr(of3,
'lst1^.ls^.',FILES_maxIO,0,left);

 TFILES_writestring(of3,
catname,0,left);

 TFILES_writestr(of3,
'field^.',FILES_maxIO,0,left);


TFILES_writestring(of3,
attrstruct^.fieldname,0,left);

 TFILES_writestr(of3,
';',FILES_maxIO,0,left);

TFILES_writeline(of3,TRUE);


attrstruct:=attrstruct^.nextattr;
END;
TFILES_writestr(of3,
'END;',FILES_maxIO,0,left);

TFILES_writeline(of3,TRUE);


END
;
 BEGIN END
END;

END;

rsnode1:=rsnode1^.brother END;
BEGIN 
TFILES_writestr(of3,
'END;',FILES_maxIO,0,left);

TFILES_writeline(of3,TRUE);


TFILES_writestr(of3,
't2:=loopholes.retype(lst2,LISTREE_pstree);',FILES_maxIO,0,left);

TFILES_writeline(of3,TRUE);


TFILES_writestr(of3,
'END;',FILES_maxIO,0,left);

TFILES_writeline(of3,TRUE);


END
END;
