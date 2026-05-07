EXPORT(tracomrules);
pragma C_include('tracomrules.pf');
pragma C_include('tracomlangspec.pf');
pragma C_include('tracommaket.pf');
pragma C_include('tracomdecl.pf');
pragma C_include('lidomaint.pf');
pragma C_include('ldconvrec.pf');
pragma C_include('ldstrtotype.pf');
pragma C_include('ldcatsets.pf');
pragma C_include('strtokey.pf');
pragma C_include('string.pf');
pragma C_include('strings.pf');
pragma C_include('tstring.pf');
PROGRAM tracomRULES;
WITH tracommaket,
tracomdecl,
tracomlangspec,lidomaint,ldstrtotype,
ldconvrec,ldcatsets,strtokey,strng,tstring;
VAR top: tracomDECL_psnode;
PACKAGE UTTpack: [UTTrule];
PROCEDURE UTTrule(a:tracomDECL_nodeid;b:tracomDECL_psnode;mode:tracomDECL_surfrulemode);
 function initfun:BOOLEAN;
BEGIN
initfun:=TRUE;
assigncounter(0)
END;

BEGIN case a of Hinit:
BEGIN 
END;
1: CASE mode OF

loccond:tracomDECL_assignstatus(
initfun
);globcond: BEGIN
 tracomDECL_assignstatus(
 TRUE
);IF tracomDECL_status THEN BEGIN
END
END; END;

2: CASE mode OF

loccond:tracomDECL_assignstatus(
TRUE
);globcond: BEGIN
 tracomDECL_assignstatus(
 TRUE
);IF tracomDECL_status THEN BEGIN 
END
END; END;

3: CASE mode OF

loccond:tracomDECL_assignstatus(
TRUE
);globcond: BEGIN
 tracomDECL_assignstatus(
 TRUE
);IF tracomDECL_status THEN BEGIN 
END
END; END;

Hfinal: BEGIN
 tracomDECL_assignstatus(
 TRUE
);IF tracomDECL_status THEN BEGIN
tracomMAKET_UTT(top);tracomDECL_addnewtop(top)
;
END
END; END;

END;

END;{package}
PACKAGE PARAMETERSTRANSpack: [PARAMETERSTRANSrule];
VAR pairsets: tracomLANGSPEC_setofpairsets;

PROCEDURE PARAMETERSTRANSrule(a:tracomDECL_nodeid;b:tracomDECL_psnode;mode:tracomDECL_surfrulemode);
BEGIN case a of Hinit:
BEGIN initsetofpairsets(pairsets);
END;
1: CASE mode OF

loccond:tracomDECL_assignstatus(
TRUE
);globcond: BEGIN
 tracomDECL_assignstatus(
 TRUE
);IF tracomDECL_status THEN BEGIN
END
END; END;

2: CASE mode OF

loccond:tracomDECL_assignstatus(
TRUE
);globcond: BEGIN
 tracomDECL_assignstatus(
 TRUE
);IF tracomDECL_status THEN BEGIN appendpairset(b^.ldfield.PARAMETERTRANSfield^.pairset,pairsets);
END
END; END;

Hfinal: BEGIN
 tracomDECL_assignstatus(
 TRUE
);IF tracomDECL_status THEN BEGIN
tracomMAKET_PARAMETERSTRANS(top);tracomDECL_addnewtop(top)
;
top^.ldfield.PARAMETERSTRANSfield^.pairsets:=pairsets;
END
END; END;

END;

END;{package}
PACKAGE PARAMETERTRANSpack: [PARAMETERTRANSrule];
VAR leftpresent,rightpresent: tracomLANGSPEC_bool;
pairset: tracomLANGSPEC_pairset;

PROCEDURE PARAMETERTRANSrule(a:tracomDECL_nodeid;b:tracomDECL_psnode;mode:tracomDECL_surfrulemode);
BEGIN case a of Hinit:
BEGIN leftpresent:=false;rightpresent:=false;
initsetofpairs(pairset.pairs);
END;
1: CASE mode OF

loccond:tracomDECL_assignstatus(
TRUE
);globcond: BEGIN
 tracomDECL_assignstatus(
 TRUE
);IF tracomDECL_status THEN BEGIN
END
END; END;

2: CASE mode OF

loccond:tracomDECL_assignstatus(
TRUE
);globcond: BEGIN
 tracomDECL_assignstatus(
 TRUE
);IF tracomDECL_status THEN BEGIN pairset.mruparam:=b^.ldfield.PARAMNAMEfield^.str;
END
END; END;

3: CASE mode OF

loccond:tracomDECL_assignstatus(
TRUE
);globcond: BEGIN
 tracomDECL_assignstatus(
 TRUE
);IF tracomDECL_status THEN BEGIN pairset.ilparam:=b^.ldfield.PARAMNAMEfield^.str;
END
END; END;

4: CASE mode OF

loccond:tracomDECL_assignstatus(
TRUE
);globcond: BEGIN
 tracomDECL_assignstatus(
 TRUE
);IF tracomDECL_status THEN BEGIN leftpresent:=true
END
END; END;

5: CASE mode OF

loccond:tracomDECL_assignstatus(
TRUE
);globcond: BEGIN
 tracomDECL_assignstatus(
 TRUE
);IF tracomDECL_status THEN BEGIN rightpresent:=true
END
END; END;

6: CASE mode OF

loccond:tracomDECL_assignstatus(
TRUE
);globcond: BEGIN
 tracomDECL_assignstatus(
 TRUE
);IF tracomDECL_status THEN BEGIN appendpair(b^.ldfield.ELEMENTTRANSfield^.pair,pairset.pairs);
END
END; END;

7: CASE mode OF

loccond:tracomDECL_assignstatus(
TRUE
);globcond: BEGIN
 tracomDECL_assignstatus(
 TRUE
);IF tracomDECL_status THEN BEGIN pairset.mrutype:=b^.ldfield.TYPENAMEfield^.str
END
END; END;

8: CASE mode OF

loccond:tracomDECL_assignstatus(
TRUE
);globcond: BEGIN
 tracomDECL_assignstatus(
 TRUE
);IF tracomDECL_status THEN BEGIN pairset.iltype:=b^.ldfield.TYPENAMEfield^.str
END
END; END;

Hfinal: BEGIN
 tracomDECL_assignstatus(
 leftpresent or rightpresent
);IF tracomDECL_status THEN BEGIN
tracomMAKET_PARAMETERTRANS(top);tracomDECL_addnewtop(top)
;
top^.ldfield.PARAMETERTRANSfield^.pairset:=pairset;
END
END; END;

END;

END;{package}
PACKAGE ELEMENTTRANSpack: [ELEMENTTRANSrule];
VAR leftpresent,rightpresent: tracomLANGSPEC_bool;
pair: tracomLANGSPEC_pair;
identset: tracomLANGSPEC_identset;
ident: tracomLANGSPEC_ident;

PROCEDURE ELEMENTTRANSrule(a:tracomDECL_nodeid;b:tracomDECL_psnode;mode:tracomDECL_surfrulemode);
BEGIN case a of Hinit:
BEGIN leftpresent:=false;rightpresent:=false;
initsetofidents(pair.lefts);
initsetofidents(pair.rights);
initsetofidentsets(pair.leftsets);
initsetofidentsets(pair.rightsets);
pair.leftsetvalued:=false;
pair.rightsetvalued:=false;
pair.leftpresent:=false;
pair.rightpresent:=false;
leftpresent:=false;
rightpresent:=false;
END;
1: CASE mode OF

loccond:tracomDECL_assignstatus(
TRUE
);globcond: BEGIN
 tracomDECL_assignstatus(
 TRUE
);IF tracomDECL_status THEN BEGIN
END
END; END;

2: CASE mode OF

loccond:tracomDECL_assignstatus(
TRUE
);globcond: BEGIN
 tracomDECL_assignstatus(
 TRUE
);IF tracomDECL_status THEN BEGIN ident.str:=b^.ldfield.VALUENAMEfield^.str;
appendident(ident,pair.lefts);
END
END; END;

3: CASE mode OF

loccond:tracomDECL_assignstatus(
TRUE
);globcond: BEGIN
 tracomDECL_assignstatus(
 TRUE
);IF tracomDECL_status THEN BEGIN ident.str:=b^.ldfield.VALUENAMEfield^.str;
appendident(ident,pair.rights);
END
END; END;

4: CASE mode OF

loccond:tracomDECL_assignstatus(
TRUE
);globcond: BEGIN
 tracomDECL_assignstatus(
 TRUE
);IF tracomDECL_status THEN BEGIN leftpresent:=true;
pair.leftpresent:=true;
END
END; END;

5: CASE mode OF

loccond:tracomDECL_assignstatus(
TRUE
);globcond: BEGIN
 tracomDECL_assignstatus(
 TRUE
);IF tracomDECL_status THEN BEGIN rightpresent:=true;
pair.rightpresent:=true;
END
END; END;

6: CASE mode OF

loccond:tracomDECL_assignstatus(
TRUE
);globcond: BEGIN
 tracomDECL_assignstatus(
 TRUE
);IF tracomDECL_status THEN BEGIN pair.leftsetvalued:=true;
identset.val:=b^.ldfield.SETVALUENAMEfield^.copy;
appendidentset(identset,pair.leftsets);
END
END; END;

7: CASE mode OF

loccond:tracomDECL_assignstatus(
TRUE
);globcond: BEGIN
 tracomDECL_assignstatus(
 TRUE
);IF tracomDECL_status THEN BEGIN identset.val:=b^.ldfield.SETVALUENAMEfield^.copy;
pair.rightsetvalued:=true;
appendidentset(identset,pair.rightsets);
END
END; END;

8: CASE mode OF

loccond:tracomDECL_assignstatus(
TRUE
);globcond: BEGIN
 tracomDECL_assignstatus(
 TRUE
);IF tracomDECL_status THEN BEGIN 
END
END; END;

9: CASE mode OF

loccond:tracomDECL_assignstatus(
TRUE
);globcond: BEGIN
 tracomDECL_assignstatus(
 TRUE
);IF tracomDECL_status THEN BEGIN
END
END; END;

Hfinal: BEGIN
 tracomDECL_assignstatus(
 leftpresent or rightpresent
);IF tracomDECL_status THEN BEGIN
tracomMAKET_ELEMENTTRANS(top);tracomDECL_addnewtop(top)
;
top^.ldfield.ELEMENTTRANSfield^.pair:=pair;
END
END; END;

END;

END;{package}
PACKAGE LANGVERSIONpack: [LANGVERSIONrule];
PROCEDURE LANGVERSIONrule(a:tracomDECL_nodeid;b:tracomDECL_psnode;mode:tracomDECL_surfrulemode);
 FUNCTION CheckLanguage(str:TSTRING_String):BOOLEAN;
BEGIN
IF (str='DUTCH') OR (str='ENGLISH') OR (str='SPANISH') 
THEN CheckLanguage:=TRUE
ELSE CheckLanguage:=FALSE;
END; 

BEGIN case a of Hinit:
BEGIN
END;
1: CASE mode OF

loccond:tracomDECL_assignstatus(
CheckLanguage(b^.ldfield.TERMINAL^.str)
);globcond: BEGIN
 tracomDECL_assignstatus(
 TRUE
);IF tracomDECL_status THEN BEGIN
END
END; END;

2: CASE mode OF

loccond:tracomDECL_assignstatus(
TRUE
);globcond: BEGIN
 tracomDECL_assignstatus(
 TRUE
);IF tracomDECL_status THEN BEGIN
END
END; END;

Hfinal: BEGIN
 tracomDECL_assignstatus(
 TRUE
);IF tracomDECL_status THEN BEGIN
tracomMAKET_LANGVERSION(top);tracomDECL_addnewtop(top)
;
END
END; END;

END;

END;{package}
PACKAGE RULESTRANSpack: [RULESTRANSrule];

PROCEDURE RULESTRANSrule(a:tracomDECL_nodeid;b:tracomDECL_psnode;mode:tracomDECL_surfrulemode);
BEGIN case a of Hinit:
BEGIN 
END;
1: CASE mode OF

loccond:tracomDECL_assignstatus(
TRUE
);globcond: BEGIN
 tracomDECL_assignstatus(
 TRUE
);IF tracomDECL_status THEN BEGIN
END
END; END;

2: CASE mode OF

loccond:tracomDECL_assignstatus(
 TRUE
);globcond: BEGIN
 tracomDECL_assignstatus(
 TRUE
);IF tracomDECL_status THEN BEGIN 
END
END; END;

Hfinal: BEGIN
 tracomDECL_assignstatus(
 TRUE
);IF tracomDECL_status THEN BEGIN
tracomMAKET_RULESTRANS(top);tracomDECL_addnewtop(top)
;
END
END; END;

END;

END;{package}
PACKAGE RULETRANSpack: [RULETRANSrule];
VAR leftpresent,rightpresent,leftsimple,rightsimple: tracomLANGSPEC_bool;
str: TSTRING_string;
len: STRING_range;
str1: STRING(5);
minus: tracomLANGSPEC_bool;
sbonuspres,wbonuspres: tracomLANGSPEC_bool;
sbonusval,wbonusval: tracomLANGSPEC_int;

PROCEDURE RULETRANSrule(a:tracomDECL_nodeid;b:tracomDECL_psnode;mode:tracomDECL_surfrulemode);
BEGIN case a of Hinit:
BEGIN leftpresent:=false;
rightpresent:=false;
leftsimple:=true;
rightsimple:=true;
wbonuspres:=false;
sbonuspres:=false;
wbonusval:=0;
sbonusval:=0;
minus:=false;
END;
1: CASE mode OF

loccond:tracomDECL_assignstatus(
TRUE
);globcond: BEGIN
 tracomDECL_assignstatus(
 TRUE
);IF tracomDECL_status THEN BEGIN
END
END; END;

2: CASE mode OF

loccond:tracomDECL_assignstatus(
TRUE
);globcond: BEGIN
 tracomDECL_assignstatus(
 TRUE
);IF tracomDECL_status THEN BEGIN str:=b^.ldfield.MRULENAMEfield^.str
END
END; END;

3: CASE mode OF

loccond:tracomDECL_assignstatus(
TRUE
);globcond: BEGIN
 tracomDECL_assignstatus(
 TRUE
);IF tracomDECL_status THEN BEGIN
END
END; END;

4: CASE mode OF

loccond:tracomDECL_assignstatus(
TRUE
);globcond: BEGIN
 tracomDECL_assignstatus(
 TRUE
);IF tracomDECL_status THEN BEGIN leftpresent:=true;
IF not leftsimple THEN
writeln('left hand side of translation of Mrules including ',str,' not simple');
END
END; END;

5: CASE mode OF

loccond:tracomDECL_assignstatus(
TRUE
);globcond: BEGIN
 tracomDECL_assignstatus(
 TRUE
);IF tracomDECL_status THEN BEGIN rightpresent:=true;
END
END; END;

6: CASE mode OF

loccond:tracomDECL_assignstatus(
TRUE
);globcond: BEGIN
 tracomDECL_assignstatus(
 TRUE
);IF tracomDECL_status THEN BEGIN leftsimple:=leftsimple AND b^.ldfield.ANDCONDfield^.simple
END
END; END;

7: CASE mode OF

loccond:tracomDECL_assignstatus(
TRUE
);globcond: BEGIN
 tracomDECL_assignstatus(
 TRUE
);IF tracomDECL_status THEN BEGIN rightsimple:=rightsimple AND b^.ldfield.ANDCONDfield^.simple;
IF rightpresent and (not rightsimple) THEN
writeln('right hand side of translation of Mrule ',str,' not simple');
END
END; END;

8: CASE mode OF

loccond:tracomDECL_assignstatus(
TRUE
);globcond: BEGIN
 tracomDECL_assignstatus(
 TRUE
);IF tracomDECL_status THEN BEGIN
END
END; END;

9: CASE mode OF

loccond:tracomDECL_assignstatus(
TRUE
);globcond: BEGIN
 tracomDECL_assignstatus(
 TRUE
);IF tracomDECL_status THEN BEGIN
END
END; END;

10: CASE mode OF

loccond:tracomDECL_assignstatus(
TRUE
);globcond: BEGIN
 tracomDECL_assignstatus(
 TRUE
);IF tracomDECL_status THEN BEGIN sbonuspres:=TRUE
END
END; END;

11: CASE mode OF

loccond:tracomDECL_assignstatus(
TRUE
);globcond: BEGIN
 tracomDECL_assignstatus(
 TRUE
);IF tracomDECL_status THEN BEGIN wbonuspres:=TRUE
END
END; END;

12: CASE mode OF

loccond:tracomDECL_assignstatus(
TRUE
);globcond: BEGIN
 tracomDECL_assignstatus(
 TRUE
);IF tracomDECL_status THEN BEGIN minus:=TRUE
END
END; END;

13: CASE mode OF

loccond:tracomDECL_assignstatus(
TRUE
);globcond: BEGIN
 tracomDECL_assignstatus(
 TRUE
);IF tracomDECL_status THEN BEGIN
END
END; END;

14: CASE mode OF

loccond:tracomDECL_assignstatus(
TRUE
);globcond: BEGIN
 tracomDECL_assignstatus(
 TRUE
);IF tracomDECL_status THEN BEGIN
IF sbonuspres THEN
BEGIN
TSTRING_extractchars(str1,len,b^.ldfield.TERMINAL^.str,1,
STRING_length(b^.ldfield.TERMINAL^.str));
sbonusval:=converttointeger(str1,len);
IF minus THEN sbonusval:=-sbonusval;
END
ELSE
BEGIN
TSTRING_extractchars(str1,len,b^.ldfield.TERMINAL^.str,1,
STRING_length(b^.ldfield.TERMINAL^.str));
wbonusval:=converttointeger(str1,len);
IF minus THEN wbonusval:=-wbonusval;
END
END
END; END;

Hfinal: BEGIN
 tracomDECL_assignstatus(
 (NOT(leftpresent) OR leftsimple) AND
(NOT(rightpresent) OR rightsimple) AND
(leftpresent OR rightpresent)
);IF tracomDECL_status THEN BEGIN
tracomMAKET_RULETRANS(top);tracomDECL_addnewtop(top)
;
top^.ldfield.RULETRANSfield^.leftpresent:=leftpresent;
top^.ldfield.RULETRANSfield^.rightpresent:=rightpresent;
top^.ldfield.RULETRANSfield^.wbonus:=wbonusval+1000*sbonusval;
top^.ldfield.RULETRANSfield^.sbonus:=sbonusval;
END
END; END;

END;

END;{package}
PACKAGE ANDCONDpack: [ANDCONDrule];
VAR simple: tracomLANGSPEC_bool;

PROCEDURE ANDCONDrule(a:tracomDECL_nodeid;b:tracomDECL_psnode;mode:tracomDECL_surfrulemode);
BEGIN case a of Hinit:
 BEGIN simple:=true;
END;
1 : CASE mode OF
 loccond:tracomDECL_assignstatus(
TRUE
);globcond: BEGIN
 tracomDECL_assignstatus(
 TRUE
);IF tracomDECL_status THEN BEGIN simple:=false END
END; END;

2 : CASE mode OF
 loccond:tracomDECL_assignstatus(
TRUE
);globcond: BEGIN
 tracomDECL_assignstatus(
 TRUE
);IF tracomDECL_status THEN BEGIN simple:=simple and b^.ldfield.ORCONDfield^.simple
END
END; END;

Hfinal: BEGIN
 tracomDECL_assignstatus(
TRUE
);IF tracomDECL_status THEN BEGIN tracomMAKET_ANDCOND(top);tracomDECL_addnewtop(top)
;
top^.ldfield.ANDCONDfield^.simple:=simple
END
END; END;

END;

END;{package}
PACKAGE ORCONDpack: [ORCONDrule];
VAR simple: tracomLANGSPEC_bool;

PROCEDURE ORCONDrule(a:tracomDECL_nodeid;b:tracomDECL_psnode;mode:tracomDECL_surfrulemode);
BEGIN case a of Hinit:
 BEGIN simple:=true;
END;
1 : CASE mode OF
 loccond:tracomDECL_assignstatus(
TRUE
);globcond: BEGIN
 tracomDECL_assignstatus(
 TRUE
);IF tracomDECL_status THEN BEGIN simple:=false END
END; END;

2 : CASE mode OF
 loccond:tracomDECL_assignstatus(
TRUE
);globcond: BEGIN
 tracomDECL_assignstatus(
 TRUE
);IF tracomDECL_status THEN BEGIN simple:=simple and b^.ldfield.ELEMENTARYCONDfield^.simple
END
END; END;

Hfinal: BEGIN
 tracomDECL_assignstatus(
TRUE
);IF tracomDECL_status THEN BEGIN tracomMAKET_ORCOND(top);tracomDECL_addnewtop(top)
;
top^.ldfield.ORCONDfield^.simple:=simple
END
END; END;

END;

END;{package}
PACKAGE ELEMENTARYCONDpack: [ELEMENTARYCONDrule];
VAR simple: tracomLANGSPEC_bool;

PROCEDURE ELEMENTARYCONDrule(a:tracomDECL_nodeid;b:tracomDECL_psnode;mode:tracomDECL_surfrulemode);
BEGIN case a of Hinit:
 BEGIN
END;
1 : CASE mode OF
 loccond:tracomDECL_assignstatus(
TRUE
);globcond: BEGIN
 tracomDECL_assignstatus(
 TRUE
);IF tracomDECL_status THEN BEGIN END
END; END;

2 : CASE mode OF
 loccond:tracomDECL_assignstatus(
TRUE
);globcond: BEGIN
 tracomDECL_assignstatus(
 TRUE
);IF tracomDECL_status THEN BEGIN simple:=b^.ldfield.ANDCONDfield^.simple
END
END; END;

3 : CASE mode OF
 loccond:tracomDECL_assignstatus(
TRUE
);globcond: BEGIN
 tracomDECL_assignstatus(
 TRUE
);IF tracomDECL_status THEN BEGIN simple:=b^.ldfield.PASCALEXPRfield^.simple
END
END; END;

Hfinal: BEGIN
 tracomDECL_assignstatus(
TRUE
);IF tracomDECL_status THEN BEGIN tracomMAKET_ELEMENTARYCOND(top);tracomDECL_addnewtop(top)
;
top^.ldfield.ELEMENTARYCONDfield^.simple:=simple;
END
END; END;

END;

END;{package}
PACKAGE PASCALEXPRpack: [PASCALEXPRrule];
VAR simple: tracomLANGSPEC_bool;
initialcounter: tracomLANGSPEC_int;
notpresent,openpresent: tracomLANGSPEC_bool;

PROCEDURE PASCALEXPRrule(a:tracomDECL_nodeid;b:tracomDECL_psnode;mode:tracomDECL_surfrulemode);
BEGIN case a of Hinit:
 BEGIN simple:=true;notpresent:=false;openpresent:=false;
initialcounter:=counter;
END;
1 : CASE mode OF
 loccond:tracomDECL_assignstatus(
TRUE
);globcond: BEGIN
 tracomDECL_assignstatus(
 TRUE
);IF tracomDECL_status THEN BEGIN END
END; END;

2 : CASE mode OF
 loccond:tracomDECL_assignstatus(
TRUE
);globcond: BEGIN
 tracomDECL_assignstatus(
 TRUE
);IF tracomDECL_status THEN BEGIN
END
END; END;

3 : CASE mode OF
 loccond:tracomDECL_assignstatus(
TRUE
);globcond: BEGIN
 tracomDECL_assignstatus(
 TRUE
);IF tracomDECL_status THEN BEGIN simple:=false END
END; END;

4 : CASE mode OF
 loccond:tracomDECL_assignstatus(
TRUE
);globcond: BEGIN
 tracomDECL_assignstatus(
 TRUE
);IF tracomDECL_status THEN BEGIN notpresent:=true
END
END; END;

5 : CASE mode OF
 loccond:tracomDECL_assignstatus(
TRUE
);globcond: BEGIN
 tracomDECL_assignstatus(
 notpresent
);IF tracomDECL_status THEN BEGIN openpresent:=true END
END; END;

6 : CASE mode OF
 loccond:tracomDECL_assignstatus(
TRUE
);globcond: BEGIN
 tracomDECL_assignstatus(
 TRUE
);IF tracomDECL_status THEN BEGIN END
END; END;

7 : CASE mode OF
 loccond:tracomDECL_assignstatus(
TRUE
);globcond: BEGIN
 tracomDECL_assignstatus(
 TRUE
);IF tracomDECL_status THEN BEGIN END
END; END;

8 : CASE mode OF
 loccond:tracomDECL_assignstatus(
TRUE
);globcond: BEGIN
 tracomDECL_assignstatus(
 TRUE
);IF tracomDECL_status THEN BEGIN END
END; END;

9 : CASE mode OF
 loccond:tracomDECL_assignstatus(
TRUE
);globcond: BEGIN
 tracomDECL_assignstatus(
 openpresent
);IF tracomDECL_status THEN BEGIN 
END
END; END;

10: CASE mode OF
 loccond:tracomDECL_assignstatus(
TRUE
);globcond: BEGIN
 tracomDECL_assignstatus(
 TRUE
);IF tracomDECL_status THEN BEGIN END
END; END;

11: CASE mode OF
 loccond:tracomDECL_assignstatus(
TRUE
);globcond: BEGIN
 tracomDECL_assignstatus(
 TRUE
);IF tracomDECL_status THEN BEGIN
END
END; END;

12: CASE mode OF
 loccond:tracomDECL_assignstatus(
TRUE
);globcond: BEGIN
 tracomDECL_assignstatus(
 TRUE
);IF tracomDECL_status THEN BEGIN END
END; END;

13: CASE mode OF
 loccond:tracomDECL_assignstatus(
TRUE
);globcond: BEGIN
 tracomDECL_assignstatus(
 TRUE
);IF tracomDECL_status THEN BEGIN simple:=false END
END; END;

14: CASE mode OF
 loccond:tracomDECL_assignstatus(
TRUE
);globcond: BEGIN
 tracomDECL_assignstatus(
 TRUE
);IF tracomDECL_status THEN BEGIN END
END; END;

15: CASE mode OF
 loccond:tracomDECL_assignstatus(
TRUE
);globcond: BEGIN
 tracomDECL_assignstatus(
 TRUE
);IF tracomDECL_status THEN BEGIN END
END; END;

16: CASE mode OF
 loccond:tracomDECL_assignstatus(
TRUE
);globcond: BEGIN
 tracomDECL_assignstatus(
 TRUE
);IF tracomDECL_status THEN BEGIN END
END; END;

17: CASE mode OF
 loccond:tracomDECL_assignstatus(
TRUE
);globcond: BEGIN
 tracomDECL_assignstatus(
 TRUE
);IF tracomDECL_status THEN BEGIN assigncounter(counter+1) END
END; END;

18: CASE mode OF
 loccond:tracomDECL_assignstatus(
TRUE
);globcond: BEGIN
 tracomDECL_assignstatus(
 TRUE
);IF tracomDECL_status THEN BEGIN END
END; END;

Hfinal: BEGIN
 tracomDECL_assignstatus(
TRUE
);IF tracomDECL_status THEN BEGIN tracomMAKET_PASCALEXPR(top);tracomDECL_addnewtop(top)
;
top^.ldfield.PASCALEXPRfield^.initialcounter:=initialcounter;
top^.ldfield.PASCALEXPRfield^.simple:=simple;
top^.ldfield.PASCALEXPRfield^.notpresent:=notpresent;
END
END; END;

END;

END;{package}
PACKAGE SETVALUENAMEpack: [SETVALUENAMErule];
VAR copy: tracomLANGSPEC_setofidents;
ident: tracomLANGSPEC_ident;

PROCEDURE SETVALUENAMErule(a:tracomDECL_nodeid;b:tracomDECL_psnode;mode:tracomDECL_surfrulemode);
BEGIN case a of Hinit:
 BEGIN initsetofidents(copy) END;
1 : CASE mode OF
 loccond:tracomDECL_assignstatus(
TRUE
);globcond: BEGIN
 tracomDECL_assignstatus(
 TRUE
);IF tracomDECL_status THEN BEGIN END
END; END;

2 : CASE mode OF
 loccond:tracomDECL_assignstatus(
TRUE
);globcond: BEGIN
 tracomDECL_assignstatus(
 TRUE
);IF tracomDECL_status THEN BEGIN ident.str:=b^.ldfield.VALUENAMEfield^.str;
appendident(ident,copy);
END
END; END;

3 : CASE mode OF
 loccond:tracomDECL_assignstatus(
TRUE
);globcond: BEGIN
 tracomDECL_assignstatus(
 TRUE
);IF tracomDECL_status THEN BEGIN 
END
END; END;

Hfinal: BEGIN
 tracomDECL_assignstatus(
TRUE
);IF tracomDECL_status THEN BEGIN tracomMAKET_SETVALUENAME(top);tracomDECL_addnewtop(top)
;
top^.ldfield.SETVALUENAMEfield^.copy:=copy;
END
END; END;

END;

END;{package}
PACKAGE VALUENAMEpack: [VALUENAMErule];
VAR str: TSTRING_string;

PROCEDURE VALUENAMErule(a:tracomDECL_nodeid;b:tracomDECL_psnode;mode:tracomDECL_surfrulemode);
BEGIN case a of Hinit:
 BEGIN END;
1 : CASE mode OF
 loccond:tracomDECL_assignstatus(
TRUE
);globcond: BEGIN
 tracomDECL_assignstatus(
 TRUE
);IF tracomDECL_status THEN BEGIN str:=b^.ldfield.TERMINAL^.str END
END; END;

Hfinal: BEGIN
 tracomDECL_assignstatus(
TRUE
);IF tracomDECL_status THEN BEGIN tracomMAKET_VALUENAME(top);tracomDECL_addnewtop(top)
; 
top^.ldfield.VALUENAMEfield^.str:=str
END
END; END;

END;

END;{package}
PACKAGE PARAMNAMEpack: [PARAMNAMErule];
VAR str: TSTRING_string;

PROCEDURE PARAMNAMErule(a:tracomDECL_nodeid;b:tracomDECL_psnode;mode:tracomDECL_surfrulemode);
BEGIN case a of Hinit:
 BEGIN END;
1 : CASE mode OF
 loccond:tracomDECL_assignstatus(
TRUE
);globcond: BEGIN
 tracomDECL_assignstatus(
 TRUE
);IF tracomDECL_status THEN BEGIN str:=b^.ldfield.TERMINAL^.str END
END; END;

Hfinal: BEGIN
 tracomDECL_assignstatus(
TRUE
);IF tracomDECL_status THEN BEGIN tracomMAKET_PARAMNAME(top);tracomDECL_addnewtop(top)
; 
top^.ldfield.PARAMNAMEfield^.str:=str
END
END; END;

END;

END;{package}
PACKAGE TYPENAMEpack: [TYPENAMErule];
VAR str: TSTRING_string;

PROCEDURE TYPENAMErule(a:tracomDECL_nodeid;b:tracomDECL_psnode;mode:tracomDECL_surfrulemode);
BEGIN case a of Hinit:
 BEGIN END;
1 : CASE mode OF
 loccond:tracomDECL_assignstatus(
TRUE
);globcond: BEGIN
 tracomDECL_assignstatus(
 TRUE
);IF tracomDECL_status THEN BEGIN str:=b^.ldfield.TERMINAL^.str END
END; END;

Hfinal: BEGIN
 tracomDECL_assignstatus(
TRUE
);IF tracomDECL_status THEN BEGIN tracomMAKET_TYPENAME(top);tracomDECL_addnewtop(top)
; 
top^.ldfield.TYPENAMEfield^.str:=str
END
END; END;

END;

END;{package}
PACKAGE MRULENAMEpack: [MRULENAMErule];
VAR str: TSTRING_string;

PROCEDURE MRULENAMErule(a:tracomDECL_nodeid;b:tracomDECL_psnode;mode:tracomDECL_surfrulemode);
BEGIN case a of Hinit:
 BEGIN END;
1 : CASE mode OF
 loccond:tracomDECL_assignstatus(
TRUE
);globcond: BEGIN
 tracomDECL_assignstatus(
 TRUE
);IF tracomDECL_status THEN BEGIN str:=b^.ldfield.TERMINAL^.str END
END; END;

Hfinal: BEGIN
 tracomDECL_assignstatus(
TRUE
);IF tracomDECL_status THEN BEGIN tracomMAKET_MRULENAME(top);tracomDECL_addnewtop(top)
; 
top^.ldfield.MRULENAMEfield^.str:=str
END
END; END;

END;

END;{package}
PACKAGE ILRULENAMEpack: [ILRULENAMErule];
VAR str: TSTRING_string;

PROCEDURE ILRULENAMErule(a:tracomDECL_nodeid;b:tracomDECL_psnode;mode:tracomDECL_surfrulemode);
BEGIN case a of Hinit:
 BEGIN END;
1 : CASE mode OF
 loccond:tracomDECL_assignstatus(
TRUE
);globcond: BEGIN
 tracomDECL_assignstatus(
 TRUE
);IF tracomDECL_status THEN BEGIN str:=b^.ldfield.TERMINAL^.str END
END; END;

Hfinal: BEGIN
 tracomDECL_assignstatus(
TRUE
);IF tracomDECL_status THEN BEGIN tracomMAKET_ILRULENAME(top);tracomDECL_addnewtop(top)
; 
top^.ldfield.ILRULENAMEfield^.str:=str
END
END; END;

END;

END;{package}
 PROCEDURE tracomRULES_init;
BEGIN
END;
 procedure tracomRULES_rule(rnr:INTEGER;a:tracomDECL_nodeid;
        b,la:tracomDECL_psnode;mode:tracomDECL_surfrulemode);
BEGIN
CASE rnr OF
  1:WITH UTTpack DO UTTrule(a,b,mode);
  2:WITH PARAMETERSTRANSpack DO PARAMETERSTRANSrule(a,b,mode);
  3:WITH PARAMETERTRANSpack DO PARAMETERTRANSrule(a,b,mode);
  4:WITH ELEMENTTRANSpack DO ELEMENTTRANSrule(a,b,mode);
  5:WITH LANGVERSIONpack DO LANGVERSIONrule(a,b,mode);
  6:WITH RULESTRANSpack DO RULESTRANSrule(a,b,mode);
  7:WITH RULETRANSpack DO RULETRANSrule(a,b,mode);
  8:WITH ANDCONDpack DO ANDCONDrule(a,b,mode);
  9:WITH ORCONDpack DO ORCONDrule(a,b,mode);
 10:WITH ELEMENTARYCONDpack DO ELEMENTARYCONDrule(a,b,mode);
 11:WITH PASCALEXPRpack DO PASCALEXPRrule(a,b,mode);
 12:WITH SETVALUENAMEpack DO SETVALUENAMErule(a,b,mode);
 13:WITH VALUENAMEpack DO VALUENAMErule(a,b,mode);
 14:WITH PARAMNAMEpack DO PARAMNAMErule(a,b,mode);
 15:WITH TYPENAMEpack DO TYPENAMErule(a,b,mode);
 16:WITH MRULENAMEpack DO MRULENAMErule(a,b,mode);
 17:WITH ILRULENAMEpack DO ILRULENAMErule(a,b,mode);
END
END;
