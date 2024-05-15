EXPORT(auxcomrules);
pragma C_include('auxcomrules.pf');
pragma C_include('auxcomlangspec.pf');
pragma C_include('auxcommaket.pf');
pragma C_include('auxcomdecl.pf');
pragma C_include('lidomaint.pf');
pragma C_include('ldconvrec.pf');
pragma C_include('ldstrtotype.pf');
pragma C_include('ldcatsets.pf');
pragma C_include('strtokey.pf');
pragma C_include('string.pf');
pragma C_include('strings.pf');
pragma C_include('tstring.pf');
PROGRAM auxcomRULES;
WITH auxcommaket,
auxcomdecl,
auxcomlangspec,lidomaint,ldstrtotype,
ldconvrec,ldcatsets,strtokey,strng,tstring;
VAR top: auxcomDECL_psnode;
PACKAGE UTTpack: [UTTrule];
VAR basetypes: auxcomLANGSPEC_setofidents;
newentries: BOOLEAN;

PROCEDURE UTTrule(a:auxcomDECL_nodeid;b:auxcomDECL_psnode;mode:auxcomDECL_surfrulemode);
BEGIN case a of Hinit:
BEGIN newentries:=FALSE;
END;
1: CASE mode OF

loccond:auxcomDECL_assignstatus(
TRUE
);globcond: BEGIN
 auxcomDECL_assignstatus(
 TRUE
);IF auxcomDECL_status THEN BEGIN
END
END; END;

2: CASE mode OF

loccond:auxcomDECL_assignstatus(
TRUE
);globcond: BEGIN
 auxcomDECL_assignstatus(
 TRUE
);IF auxcomDECL_status THEN BEGIN newentries:=b^.ldfield.KEYSECTIONfield^.newentries
END
END; END;

3: CASE mode OF

loccond:auxcomDECL_assignstatus(
TRUE
);globcond: BEGIN
 auxcomDECL_assignstatus(
 TRUE
);IF auxcomDECL_status THEN BEGIN
END
END; END;

4: CASE mode OF

loccond:auxcomDECL_assignstatus(
TRUE
);globcond: BEGIN
 auxcomDECL_assignstatus(
 TRUE
);IF auxcomDECL_status THEN BEGIN basetypes:=b^.ldfield.ABBRSECTIONfield^.basetypes
END
END; END;

5: CASE mode OF

loccond:auxcomDECL_assignstatus(
TRUE
);globcond: BEGIN
 auxcomDECL_assignstatus(
 TRUE
);IF auxcomDECL_status THEN BEGIN
END
END; END;

Hfinal: BEGIN
 auxcomDECL_assignstatus(
 TRUE
);IF auxcomDECL_status THEN BEGIN
auxcomMAKET_UTT(top);auxcomDECL_addnewtop(top)
;
top^.ldfield.UTTfield^.newentries:=newentries;
top^.ldfield.UTTfield^.basetypes:=basetypes;
END
END; END;

END;

END;{package}
PACKAGE LANGVERSIONpack: [LANGVERSIONrule];

PROCEDURE LANGVERSIONrule(a:auxcomDECL_nodeid;b:auxcomDECL_psnode;mode:auxcomDECL_surfrulemode);
BEGIN case a of Hinit:
BEGIN
END;
1: CASE mode OF

loccond:auxcomDECL_assignstatus(
TRUE
);globcond: BEGIN
 auxcomDECL_assignstatus(
 TRUE
);IF auxcomDECL_status THEN BEGIN
END
END; END;

2: CASE mode OF

loccond:auxcomDECL_assignstatus(
TRUE
);globcond: BEGIN
 auxcomDECL_assignstatus(
 TRUE
);IF auxcomDECL_status THEN BEGIN
END
END; END;

Hfinal: BEGIN
 auxcomDECL_assignstatus(
 TRUE
);IF auxcomDECL_status THEN BEGIN
auxcomMAKET_LANGVERSION(top);auxcomDECL_addnewtop(top)
;
END
END; END;

END;

END;{package}
PACKAGE KEYSECTIONpack: [KEYSECTIONrule];
VAR newentries: BOOLEAN;

PROCEDURE KEYSECTIONrule(a:auxcomDECL_nodeid;b:auxcomDECL_psnode;mode:auxcomDECL_surfrulemode);
BEGIN case a of Hinit:
BEGIN newentries:=FALSE
END;
1: CASE mode OF

loccond:auxcomDECL_assignstatus(
TRUE
);globcond: BEGIN
 auxcomDECL_assignstatus(
 TRUE
);IF auxcomDECL_status THEN BEGIN
END
END; END;

2: CASE mode OF

loccond:auxcomDECL_assignstatus(
 TRUE
);globcond: BEGIN
 auxcomDECL_assignstatus(
 TRUE
);IF auxcomDECL_status THEN BEGIN 
END
END; END;

3: CASE mode OF

loccond:auxcomDECL_assignstatus(
 TRUE
);globcond: BEGIN
 auxcomDECL_assignstatus(
 TRUE
);IF auxcomDECL_status THEN BEGIN IF NOT(b^.ldfield.ARGUMENTSfield^.oldentry) THEN
newentries:=TRUE
END
END; END;

Hfinal: BEGIN
 auxcomDECL_assignstatus(
 TRUE
);IF auxcomDECL_status THEN BEGIN
auxcomMAKET_KEYSECTION(top);auxcomDECL_addnewtop(top)
;
top^.ldfield.KEYSECTIONfield^.newentries:=newentries
END
END; END;

END;

END;{package}
PACKAGE ARGUMENTSpack: [ARGUMENTSrule];
VAR oldentry: BOOLEAN;

PROCEDURE ARGUMENTSrule(a:auxcomDECL_nodeid;b:auxcomDECL_psnode;mode:auxcomDECL_surfrulemode);
BEGIN case a of Hinit:
BEGIN oldentry:=FALSE
END;
1: CASE mode OF

loccond:auxcomDECL_assignstatus(
TRUE
);globcond: BEGIN
 auxcomDECL_assignstatus(
 TRUE
);IF auxcomDECL_status THEN BEGIN
END
END; END;

2: CASE mode OF

loccond:auxcomDECL_assignstatus(
 TRUE
);globcond: BEGIN
 auxcomDECL_assignstatus(
 TRUE
);IF auxcomDECL_status THEN BEGIN oldentry:=TRUE
END
END; END;

3: CASE mode OF

loccond:auxcomDECL_assignstatus(
 TRUE
);globcond: BEGIN
 auxcomDECL_assignstatus(
 TRUE
);IF auxcomDECL_status THEN BEGIN 
END
END; END;

Hfinal: BEGIN
 auxcomDECL_assignstatus(
 TRUE
);IF auxcomDECL_status THEN BEGIN
auxcomMAKET_ARGUMENTS(top);auxcomDECL_addnewtop(top)
;
top^.ldfield.ARGUMENTSfield^.oldentry:=oldentry
END
END; END;

END;

END;{package}
PACKAGE ARGLISTpack: [ARGLISTrule];

PROCEDURE ARGLISTrule(a:auxcomDECL_nodeid;b:auxcomDECL_psnode;mode:auxcomDECL_surfrulemode);
BEGIN case a of Hinit:
BEGIN 
END;
1: CASE mode OF

loccond:auxcomDECL_assignstatus(
TRUE
);globcond: BEGIN
 auxcomDECL_assignstatus(
 TRUE
);IF auxcomDECL_status THEN BEGIN
END
END; END;

2: CASE mode OF

loccond:auxcomDECL_assignstatus(
 TRUE
);globcond: BEGIN
 auxcomDECL_assignstatus(
 TRUE
);IF auxcomDECL_status THEN BEGIN 
END
END; END;

3: CASE mode OF

loccond:auxcomDECL_assignstatus(
 TRUE
);globcond: BEGIN
 auxcomDECL_assignstatus(
 TRUE
);IF auxcomDECL_status THEN BEGIN 
END
END; END;

4: CASE mode OF

loccond:auxcomDECL_assignstatus(
 TRUE
);globcond: BEGIN
 auxcomDECL_assignstatus(
 TRUE
);IF auxcomDECL_status THEN BEGIN 
END
END; END;

Hfinal: BEGIN
 auxcomDECL_assignstatus(
 TRUE
);IF auxcomDECL_status THEN BEGIN
auxcomMAKET_ARGLIST(top);auxcomDECL_addnewtop(top)
;
END
END; END;

END;

END;{package}
PACKAGE NUMBERpack: [NUMBERrule];
PROCEDURE NUMBERrule(a:auxcomDECL_nodeid;b:auxcomDECL_psnode;mode:auxcomDECL_surfrulemode);
 FUNCTION CheckNumber(str : TSTRING_string) :BOOLEAN;
VAR digits : TSTRING_string;
BEGIN
digits := '0123456789';
IF TSTRING_FindFirstNotInSet(str,digits) = 0 THEN
CheckNumber:=TRUE
ELSE CheckNumber:=FALSE; 
END;

BEGIN case a of Hinit:
BEGIN
END;
1: CASE mode OF

loccond:auxcomDECL_assignstatus(
CheckNumber(b^.ldfield.TERMINAL^.str)
);globcond: BEGIN
 auxcomDECL_assignstatus(
 TRUE
);IF auxcomDECL_status THEN BEGIN
END
END; END;

Hfinal: BEGIN
 auxcomDECL_assignstatus(
 TRUE
);IF auxcomDECL_status THEN BEGIN
auxcomMAKET_NUMBER(top);auxcomDECL_addnewtop(top)
;
END
END; END;

END;

END;{package}
PACKAGE TERMARGUMENTpack: [TERMARGUMENTrule];

PROCEDURE TERMARGUMENTrule(a:auxcomDECL_nodeid;b:auxcomDECL_psnode;mode:auxcomDECL_surfrulemode);
BEGIN case a of Hinit:
BEGIN
END;
1: CASE mode OF

loccond:auxcomDECL_assignstatus(
TRUE
);globcond: BEGIN
 auxcomDECL_assignstatus(
 TRUE
);IF auxcomDECL_status THEN BEGIN
END
END; END;

2: CASE mode OF

loccond:auxcomDECL_assignstatus(
TRUE
);globcond: BEGIN
 auxcomDECL_assignstatus(
 TRUE
);IF auxcomDECL_status THEN BEGIN
END
END; END;

3: CASE mode OF

loccond:auxcomDECL_assignstatus(
TRUE
);globcond: BEGIN
 auxcomDECL_assignstatus(
 TRUE
);IF auxcomDECL_status THEN BEGIN
END
END; END;

Hfinal: BEGIN
 auxcomDECL_assignstatus(
 TRUE
);IF auxcomDECL_status THEN BEGIN
auxcomMAKET_TERMARGUMENT(top);auxcomDECL_addnewtop(top)
;
END
END; END;

END;

END;{package}
PACKAGE PUNCTUATIONpack: [PUNCTUATIONrule];

PROCEDURE PUNCTUATIONrule(a:auxcomDECL_nodeid;b:auxcomDECL_psnode;mode:auxcomDECL_surfrulemode);
BEGIN case a of Hinit:
BEGIN
END;
1: CASE mode OF

loccond:auxcomDECL_assignstatus(
TRUE
);globcond: BEGIN
 auxcomDECL_assignstatus(
 TRUE
);IF auxcomDECL_status THEN BEGIN
END
END; END;

2: CASE mode OF

loccond:auxcomDECL_assignstatus(
TRUE
);globcond: BEGIN
 auxcomDECL_assignstatus(
 TRUE
);IF auxcomDECL_status THEN BEGIN
END
END; END;

3: CASE mode OF

loccond:auxcomDECL_assignstatus(
TRUE
);globcond: BEGIN
 auxcomDECL_assignstatus(
 TRUE
);IF auxcomDECL_status THEN BEGIN
END
END; END;

4: CASE mode OF

loccond:auxcomDECL_assignstatus(
TRUE
);globcond: BEGIN
 auxcomDECL_assignstatus(
 TRUE
);IF auxcomDECL_status THEN BEGIN
END
END; END;

5: CASE mode OF

loccond:auxcomDECL_assignstatus(
TRUE
);globcond: BEGIN
 auxcomDECL_assignstatus(
 TRUE
);IF auxcomDECL_status THEN BEGIN
END
END; END;

6: CASE mode OF

loccond:auxcomDECL_assignstatus(
TRUE
);globcond: BEGIN
 auxcomDECL_assignstatus(
 TRUE
);IF auxcomDECL_status THEN BEGIN
END
END; END;

7: CASE mode OF

loccond:auxcomDECL_assignstatus(
TRUE
);globcond: BEGIN
 auxcomDECL_assignstatus(
 TRUE
);IF auxcomDECL_status THEN BEGIN
END
END; END;

8: CASE mode OF

loccond:auxcomDECL_assignstatus(
TRUE
);globcond: BEGIN
 auxcomDECL_assignstatus(
 TRUE
);IF auxcomDECL_status THEN BEGIN
END
END; END;

9: CASE mode OF

loccond:auxcomDECL_assignstatus(
TRUE
);globcond: BEGIN
 auxcomDECL_assignstatus(
 TRUE
);IF auxcomDECL_status THEN BEGIN
END
END; END;

11: CASE mode OF

loccond:auxcomDECL_assignstatus(
TRUE
);globcond: BEGIN
 auxcomDECL_assignstatus(
 TRUE
);IF auxcomDECL_status THEN BEGIN
END
END; END;

12: CASE mode OF

loccond:auxcomDECL_assignstatus(
TRUE
);globcond: BEGIN
 auxcomDECL_assignstatus(
 TRUE
);IF auxcomDECL_status THEN BEGIN
END
END; END;

13: CASE mode OF

loccond:auxcomDECL_assignstatus(
TRUE
);globcond: BEGIN
 auxcomDECL_assignstatus(
 TRUE
);IF auxcomDECL_status THEN BEGIN
END
END; END;

14: CASE mode OF

loccond:auxcomDECL_assignstatus(
TRUE
);globcond: BEGIN
 auxcomDECL_assignstatus(
 TRUE
);IF auxcomDECL_status THEN BEGIN
END
END; END;

15: CASE mode OF

loccond:auxcomDECL_assignstatus(
TRUE
);globcond: BEGIN
 auxcomDECL_assignstatus(
 TRUE
);IF auxcomDECL_status THEN BEGIN
END
END; END;

16: CASE mode OF

loccond:auxcomDECL_assignstatus(
TRUE
);globcond: BEGIN
 auxcomDECL_assignstatus(
 TRUE
);IF auxcomDECL_status THEN BEGIN
END
END; END;

17: CASE mode OF

loccond:auxcomDECL_assignstatus(
TRUE
);globcond: BEGIN
 auxcomDECL_assignstatus(
 TRUE
);IF auxcomDECL_status THEN BEGIN
END
END; END;

18: CASE mode OF

loccond:auxcomDECL_assignstatus(
TRUE
);globcond: BEGIN
 auxcomDECL_assignstatus(
 TRUE
);IF auxcomDECL_status THEN BEGIN
END
END; END;

19: CASE mode OF

loccond:auxcomDECL_assignstatus(
TRUE
);globcond: BEGIN
 auxcomDECL_assignstatus(
 TRUE
);IF auxcomDECL_status THEN BEGIN
END
END; END;

20: CASE mode OF

loccond:auxcomDECL_assignstatus(
TRUE
);globcond: BEGIN
 auxcomDECL_assignstatus(
 TRUE
);IF auxcomDECL_status THEN BEGIN
END
END; END;

21: CASE mode OF

loccond:auxcomDECL_assignstatus(
TRUE
);globcond: BEGIN
 auxcomDECL_assignstatus(
 TRUE
);IF auxcomDECL_status THEN BEGIN
END
END; END;

22: CASE mode OF

loccond:auxcomDECL_assignstatus(
TRUE
);globcond: BEGIN
 auxcomDECL_assignstatus(
 TRUE
);IF auxcomDECL_status THEN BEGIN
END
END; END;

23: CASE mode OF

loccond:auxcomDECL_assignstatus(
TRUE
);globcond: BEGIN
 auxcomDECL_assignstatus(
 TRUE
);IF auxcomDECL_status THEN BEGIN
END
END; END;

24: CASE mode OF

loccond:auxcomDECL_assignstatus(
TRUE
);globcond: BEGIN
 auxcomDECL_assignstatus(
 TRUE
);IF auxcomDECL_status THEN BEGIN
END
END; END;

25: CASE mode OF

loccond:auxcomDECL_assignstatus(
TRUE
);globcond: BEGIN
 auxcomDECL_assignstatus(
 TRUE
);IF auxcomDECL_status THEN BEGIN
END
END; END;

26: CASE mode OF

loccond:auxcomDECL_assignstatus(
TRUE
);globcond: BEGIN
 auxcomDECL_assignstatus(
 TRUE
);IF auxcomDECL_status THEN BEGIN
END
END; END;

27: CASE mode OF

loccond:auxcomDECL_assignstatus(
TRUE
);globcond: BEGIN
 auxcomDECL_assignstatus(
 TRUE
);IF auxcomDECL_status THEN BEGIN
END
END; END;

28: CASE mode OF

loccond:auxcomDECL_assignstatus(
TRUE
);globcond: BEGIN
 auxcomDECL_assignstatus(
 TRUE
);IF auxcomDECL_status THEN BEGIN
END
END; END;

29: CASE mode OF

loccond:auxcomDECL_assignstatus(
TRUE
);globcond: BEGIN
 auxcomDECL_assignstatus(
 TRUE
);IF auxcomDECL_status THEN BEGIN
END
END; END;

30: CASE mode OF

loccond:auxcomDECL_assignstatus(
TRUE
);globcond: BEGIN
 auxcomDECL_assignstatus(
 TRUE
);IF auxcomDECL_status THEN BEGIN
END
END; END;

31: CASE mode OF

loccond:auxcomDECL_assignstatus(
TRUE
);globcond: BEGIN
 auxcomDECL_assignstatus(
 TRUE
);IF auxcomDECL_status THEN BEGIN
END
END; END;

32: CASE mode OF

loccond:auxcomDECL_assignstatus(
TRUE
);globcond: BEGIN
 auxcomDECL_assignstatus(
 TRUE
);IF auxcomDECL_status THEN BEGIN
END
END; END;

33: CASE mode OF

loccond:auxcomDECL_assignstatus(
TRUE
);globcond: BEGIN
 auxcomDECL_assignstatus(
 TRUE
);IF auxcomDECL_status THEN BEGIN
END
END; END;

Hfinal: BEGIN
 auxcomDECL_assignstatus(
 TRUE
);IF auxcomDECL_status THEN BEGIN
auxcomMAKET_PUNCTUATION(top);auxcomDECL_addnewtop(top)
;
END
END; END;

END;

END;{package}
PACKAGE RECSECTIONpack: [RECSECTIONrule];

PROCEDURE RECSECTIONrule(a:auxcomDECL_nodeid;b:auxcomDECL_psnode;mode:auxcomDECL_surfrulemode);
BEGIN case a of Hinit:
BEGIN
END;
1: CASE mode OF

loccond:auxcomDECL_assignstatus(
TRUE
);globcond: BEGIN
 auxcomDECL_assignstatus(
 TRUE
);IF auxcomDECL_status THEN BEGIN
END
END; END;

2: CASE mode OF

loccond:auxcomDECL_assignstatus(
TRUE
);globcond: BEGIN
 auxcomDECL_assignstatus(
 TRUE
);IF auxcomDECL_status THEN BEGIN
END
END; END;

Hfinal: BEGIN
 auxcomDECL_assignstatus(
 TRUE
);IF auxcomDECL_status THEN BEGIN
auxcomMAKET_RECSECTION(top);auxcomDECL_addnewtop(top)
;
END
END; END;

END;

END;{package}
PACKAGE NUMRECORDSpack: [NUMRECORDSrule];

PROCEDURE NUMRECORDSrule(a:auxcomDECL_nodeid;b:auxcomDECL_psnode;mode:auxcomDECL_surfrulemode);
BEGIN case a of Hinit:
BEGIN
END;
1: CASE mode OF

loccond:auxcomDECL_assignstatus(
TRUE
);globcond: BEGIN
 auxcomDECL_assignstatus(
 TRUE
);IF auxcomDECL_status THEN BEGIN
END
END; END;

2: CASE mode OF

loccond:auxcomDECL_assignstatus(
 TRUE
);globcond: BEGIN
 auxcomDECL_assignstatus(
 TRUE
);IF auxcomDECL_status THEN BEGIN
END
END; END;

3: CASE mode OF

loccond:auxcomDECL_assignstatus(
 TRUE
);globcond: BEGIN
 auxcomDECL_assignstatus(
 TRUE
);IF auxcomDECL_status THEN BEGIN
END
END; END;

4: CASE mode OF

loccond:auxcomDECL_assignstatus(
 TRUE
);globcond: BEGIN
 auxcomDECL_assignstatus(
 TRUE
);IF auxcomDECL_status THEN BEGIN
END
END; END;

Hfinal: BEGIN
 auxcomDECL_assignstatus(
 TRUE
);IF auxcomDECL_status THEN BEGIN
auxcomMAKET_NUMRECORDS(top);auxcomDECL_addnewtop(top)
;
END
END; END;

END;

END;{package}
PACKAGE TYPESECTIONpack: [TYPESECTIONrule];

PROCEDURE TYPESECTIONrule(a:auxcomDECL_nodeid;b:auxcomDECL_psnode;mode:auxcomDECL_surfrulemode);
BEGIN case a of Hinit:
BEGIN
END;
1: CASE mode OF

loccond:auxcomDECL_assignstatus(
TRUE
);globcond: BEGIN
 auxcomDECL_assignstatus(
 TRUE
);IF auxcomDECL_status THEN BEGIN
END
END; END;

Hfinal: BEGIN
 auxcomDECL_assignstatus(
 TRUE
);IF auxcomDECL_status THEN BEGIN
auxcomMAKET_TYPESECTION(top);auxcomDECL_addnewtop(top)
;
END
END; END;

END;

END;{package}
PACKAGE FIELDLISTpack: [FIELDLISTrule];
VAR RecFieldCount :  INTEGER;

PROCEDURE FIELDLISTrule(a:auxcomDECL_nodeid;b:auxcomDECL_psnode;mode:auxcomDECL_surfrulemode);
BEGIN case a of Hinit:
BEGIN
RecFieldCount:=0;
END;
1: CASE mode OF

loccond:auxcomDECL_assignstatus(
TRUE
);globcond: BEGIN
 auxcomDECL_assignstatus(
 TRUE
);IF auxcomDECL_status THEN BEGIN
END
END; END;

2: CASE mode OF

loccond:auxcomDECL_assignstatus(
 TRUE
);globcond: BEGIN
 auxcomDECL_assignstatus(
 TRUE
);IF auxcomDECL_status THEN BEGIN
END
END; END;

3: CASE mode OF

loccond:auxcomDECL_assignstatus(
 TRUE
);globcond: BEGIN
 auxcomDECL_assignstatus(
 TRUE
);IF auxcomDECL_status THEN BEGIN
RecFieldCount:=RecFieldCount + 1;
END
END; END;

4: CASE mode OF

loccond:auxcomDECL_assignstatus(
 TRUE
);globcond: BEGIN
 auxcomDECL_assignstatus(
 TRUE
);IF auxcomDECL_status THEN BEGIN
END
END; END;

Hfinal: BEGIN
 auxcomDECL_assignstatus(
 TRUE
);IF auxcomDECL_status THEN BEGIN
auxcomMAKET_FIELDLIST(top);auxcomDECL_addnewtop(top)
;
top^.ldfield.FIELDLISTfield^.RecFieldCount:=RecFieldCount;
END
END; END;

END;

END;{package}
PACKAGE FIELDVALUEpack: [FIELDVALUErule];

PROCEDURE FIELDVALUErule(a:auxcomDECL_nodeid;b:auxcomDECL_psnode;mode:auxcomDECL_surfrulemode);
BEGIN case a of Hinit:
BEGIN
END;
1: CASE mode OF

loccond:auxcomDECL_assignstatus(
TRUE
);globcond: BEGIN
 auxcomDECL_assignstatus(
 TRUE
);IF auxcomDECL_status THEN BEGIN
END
END; END;

2: CASE mode OF

loccond:auxcomDECL_assignstatus(
 TRUE
);globcond: BEGIN
 auxcomDECL_assignstatus(
 TRUE
);IF auxcomDECL_status THEN BEGIN
END
END; END;

3: CASE mode OF

loccond:auxcomDECL_assignstatus(
TRUE
);globcond: BEGIN
 auxcomDECL_assignstatus(
 TRUE
);IF auxcomDECL_status THEN BEGIN
END
END; END;

4: CASE mode OF

loccond:auxcomDECL_assignstatus(
 TRUE
);globcond: BEGIN
 auxcomDECL_assignstatus(
 TRUE
);IF auxcomDECL_status THEN BEGIN
END
END; END;

Hfinal: BEGIN
 auxcomDECL_assignstatus(
 TRUE
);IF auxcomDECL_status THEN BEGIN
auxcomMAKET_FIELDVALUE(top);auxcomDECL_addnewtop(top)
;
END
END; END;

END;

END;{package}
PACKAGE ABBRSECTIONpack: [ABBRSECTIONrule];
VAR AbbrCounter : auxcomLANGSPEC_INT;
ident: auxcomLANGSPEC_ident;
basetypes : auxcomLANGSPEC_setofidents;
PROCEDURE ABBRSECTIONrule(a:auxcomDECL_nodeid;b:auxcomDECL_psnode;mode:auxcomDECL_surfrulemode);
 FUNCTION present(ident: auxcomLANGSPEC_ident;S1: auxcomLANGSPEC_setofidents):BOOLEAN;
VAR ident1: auxcomLANGSPEC_ident;
result:boolean;
begin
result:=false;
while stillidents(S1) and not(result) do
begin
takeident(ident1,S1);
result := (ident1.str=ident.str)
end;
present:=result
end;

BEGIN case a of Hinit:
BEGIN
AbbrCounter:=0;
INITsetofidents(basetypes);
END;
1: CASE mode OF

loccond:auxcomDECL_assignstatus(
TRUE
);globcond: BEGIN
 auxcomDECL_assignstatus(
 TRUE
);IF auxcomDECL_status THEN BEGIN
END
END; END;

2: CASE mode OF

loccond:auxcomDECL_assignstatus(
 TRUE
);globcond: BEGIN
 auxcomDECL_assignstatus(
 TRUE
);IF auxcomDECL_status THEN BEGIN
END
END; END;

3: CASE mode OF

loccond:auxcomDECL_assignstatus(
 TRUE
);globcond: BEGIN
 auxcomDECL_assignstatus(
 TRUE
);IF auxcomDECL_status THEN BEGIN
IF b^.ldfield.NUMABBRSfield^.basementioned THEN
BEGIN
ident.str:=b^.ldfield.NUMABBRSfield^.typeident;
IF NOT(present(ident,basetypes)) THEN 
appendident(ident,basetypes);
END;
AbbrCounter:=AbbrCounter + 1; 
END
END; END;

Hfinal: BEGIN
 auxcomDECL_assignstatus(
 TRUE
);IF auxcomDECL_status THEN BEGIN
auxcomMAKET_ABBRSECTION(top);auxcomDECL_addnewtop(top)
;
top^.ldfield.ABBRSECTIONfield^.basetypes:=basetypes;
top^.ldfield.ABBRSECTIONfield^.AbbrCounter:=AbbrCounter;
END
END; END;

END;

END;{package}
PACKAGE NUMABBRSpack: [NUMABBRSrule];
VAR typeident: TSTRING_string;
basementioned: BOOLEAN;

PROCEDURE NUMABBRSrule(a:auxcomDECL_nodeid;b:auxcomDECL_psnode;mode:auxcomDECL_surfrulemode);
BEGIN case a of Hinit:
BEGIN basementioned:=FALSE;
TSTRING_constantempty(typeident);
END;
1: CASE mode OF

loccond:auxcomDECL_assignstatus(
TRUE
);globcond: BEGIN
 auxcomDECL_assignstatus(
 TRUE
);IF auxcomDECL_status THEN BEGIN
END
END; END;

2: CASE mode OF

loccond:auxcomDECL_assignstatus(
 TRUE
);globcond: BEGIN
 auxcomDECL_assignstatus(
 TRUE
);IF auxcomDECL_status THEN BEGIN
END
END; END;

3: CASE mode OF

loccond:auxcomDECL_assignstatus(
 TRUE
);globcond: BEGIN
 auxcomDECL_assignstatus(
 TRUE
);IF auxcomDECL_status THEN BEGIN
END
END; END;

4: CASE mode OF

loccond:auxcomDECL_assignstatus(
 TRUE
);globcond: BEGIN
 auxcomDECL_assignstatus(
 TRUE
);IF auxcomDECL_status THEN BEGIN
END
END; END;

5: CASE mode OF

loccond:auxcomDECL_assignstatus(
 TRUE
);globcond: BEGIN
 auxcomDECL_assignstatus(
 TRUE
);IF auxcomDECL_status THEN BEGIN typeident:=b^.ldfield.TERMINAL^.str
END
END; END;

6: CASE mode OF

loccond:auxcomDECL_assignstatus(
 TRUE
);globcond: BEGIN
 auxcomDECL_assignstatus(
 TRUE
);IF auxcomDECL_status THEN BEGIN basementioned:=TRUE
END
END; END;

Hfinal: BEGIN
 auxcomDECL_assignstatus(
 TRUE
);IF auxcomDECL_status THEN BEGIN
auxcomMAKET_NUMABBRS(top);auxcomDECL_addnewtop(top)
;
top^.ldfield.NUMABBRSfield^.typeident:=typeident;
top^.ldfield.NUMABBRSfield^.basementioned:=basementioned;
END
END; END;

END;

END;{package}
PACKAGE ABBRLISTpack: [ABBRLISTrule];

PROCEDURE ABBRLISTrule(a:auxcomDECL_nodeid;b:auxcomDECL_psnode;mode:auxcomDECL_surfrulemode);
BEGIN case a of Hinit:
BEGIN
END;
1 : CASE mode OF

loccond:auxcomDECL_assignstatus(
TRUE
);globcond: BEGIN
 auxcomDECL_assignstatus(
 TRUE
);IF auxcomDECL_status THEN BEGIN
END
END; END;

2: CASE mode OF

loccond:auxcomDECL_assignstatus(
TRUE
);globcond: BEGIN
 auxcomDECL_assignstatus(
 TRUE
);IF auxcomDECL_status THEN BEGIN
END
END; END;

3: CASE mode OF

loccond:auxcomDECL_assignstatus(
TRUE
);globcond: BEGIN
 auxcomDECL_assignstatus(
 TRUE
);IF auxcomDECL_status THEN BEGIN
END
END; END;

4: CASE mode OF

loccond:auxcomDECL_assignstatus(
TRUE
);globcond: BEGIN
 auxcomDECL_assignstatus(
 TRUE
);IF auxcomDECL_status THEN BEGIN
END
END; END;

Hfinal: BEGIN
 auxcomDECL_assignstatus(
 TRUE
);IF auxcomDECL_status THEN BEGIN
auxcomMAKET_ABBRLIST(top);auxcomDECL_addnewtop(top)
;
END
END; END;

END;

END;{package}
PACKAGE VARCATSECTIONpack: [VARCATSECTIONrule];

PROCEDURE VARCATSECTIONrule(a:auxcomDECL_nodeid;b:auxcomDECL_psnode;mode:auxcomDECL_surfrulemode);
BEGIN case a of Hinit:
BEGIN 
END;
1 : CASE mode OF

loccond:auxcomDECL_assignstatus(
TRUE
);globcond: BEGIN
 auxcomDECL_assignstatus(
 TRUE
);IF auxcomDECL_status THEN BEGIN
END
END; END;

2: CASE mode OF

loccond:auxcomDECL_assignstatus(
TRUE
);globcond: BEGIN
 auxcomDECL_assignstatus(
 TRUE
);IF auxcomDECL_status THEN BEGIN
END
END; END;

3: CASE mode OF

loccond:auxcomDECL_assignstatus(
TRUE
);globcond: BEGIN
 auxcomDECL_assignstatus(
 TRUE
);IF auxcomDECL_status THEN BEGIN
END
END; END;

Hfinal: BEGIN
 auxcomDECL_assignstatus(
 TRUE
);IF auxcomDECL_status THEN BEGIN
auxcomMAKET_VARCATSECTION(top);auxcomDECL_addnewtop(top)
;
END
END; END;

END;

END;{package}
 PROCEDURE auxcomRULES_init;
BEGIN
END;
 procedure auxcomRULES_rule(rnr:INTEGER;a:auxcomDECL_nodeid;
        b,la:auxcomDECL_psnode;mode:auxcomDECL_surfrulemode);
BEGIN
CASE rnr OF
  1:WITH UTTpack DO UTTrule(a,b,mode);
  2:WITH LANGVERSIONpack DO LANGVERSIONrule(a,b,mode);
  3:WITH KEYSECTIONpack DO KEYSECTIONrule(a,b,mode);
  4:WITH ARGUMENTSpack DO ARGUMENTSrule(a,b,mode);
  5:WITH ARGLISTpack DO ARGLISTrule(a,b,mode);
  6:WITH NUMBERpack DO NUMBERrule(a,b,mode);
  7:WITH TERMARGUMENTpack DO TERMARGUMENTrule(a,b,mode);
  8:WITH PUNCTUATIONpack DO PUNCTUATIONrule(a,b,mode);
  9:WITH RECSECTIONpack DO RECSECTIONrule(a,b,mode);
 10:WITH NUMRECORDSpack DO NUMRECORDSrule(a,b,mode);
 11:WITH TYPESECTIONpack DO TYPESECTIONrule(a,b,mode);
 12:WITH FIELDLISTpack DO FIELDLISTrule(a,b,mode);
 13:WITH FIELDVALUEpack DO FIELDVALUErule(a,b,mode);
 14:WITH ABBRSECTIONpack DO ABBRSECTIONrule(a,b,mode);
 15:WITH NUMABBRSpack DO NUMABBRSrule(a,b,mode);
 16:WITH ABBRLISTpack DO ABBRLISTrule(a,b,mode);
 17:WITH VARCATSECTIONpack DO VARCATSECTIONrule(a,b,mode);
END
END;
