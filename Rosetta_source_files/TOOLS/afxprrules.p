EXPORT(afxprrules);
pragma C_include('afxprrules.pf');
pragma C_include('afxprlangspec.pf');
pragma C_include('afxprmaket.pf');
pragma C_include('afxprdecl.pf');
pragma C_include('lidomaint.pf');
pragma C_include('ldconvrec.pf');
pragma C_include('ldstrtotype.pf');
pragma C_include('ldcatsets.pf');
pragma C_include('strtokey.pf');
pragma C_include('string.pf');
pragma C_include('strings.pf');
pragma C_include('tstring.pf');
PROGRAM afxprRULES;
WITH afxprmaket,
afxprdecl,
afxprlangspec,lidomaint,ldstrtotype,
ldconvrec,ldcatsets,strtokey,strng,tstring;
VAR top: afxprDECL_psnode;
afxid              :afxprlangspec_int;
PACKAGE UTTpack: [UTTrule];
VAR
Eps :  BOOLEAN;
First : afxprLANGSPEC_SETOFatomnodes;
Kind : afxprLANGSPEC_KindType;

PROCEDURE UTTrule(a:afxprDECL_nodeid;b:afxprDECL_psnode;mode:afxprDECL_surfrulemode);
BEGIN case a of Hinit:
 BEGIN
Eps := TRUE;
INITsetofatomnodes(First);
AfxId:=0;
END;
1 : CASE mode OF

loccond:afxprDECL_assignstatus(
 TRUE
);globcond: BEGIN
 afxprDECL_assignstatus(
 TRUE
);IF afxprDECL_status THEN BEGIN
END
END; END;

2 : CASE mode OF

loccond:afxprDECL_assignstatus(
 TRUE
);globcond: BEGIN
 afxprDECL_assignstatus(
 TRUE
);IF afxprDECL_status THEN BEGIN
END
END; END;

3 : CASE mode OF

loccond:afxprDECL_assignstatus(
TRUE
);globcond: BEGIN
 afxprDECL_assignstatus(
 TRUE
);IF afxprDECL_status THEN BEGIN
Eps := b^.ldfield.EXPRfield^.Eps;
First := b^.ldfield.EXPRfield^.First;
Kind := b^.ldfield.EXPRfield^.Kind;
END
END; END;

Hfinal: BEGIN
 afxprDECL_assignstatus(
 TRUE
);IF afxprDECL_status THEN BEGIN afxprMAKET_UTT(top);afxprDECL_addnewtop(top)
;
top^.ldfield.UTTfield^.Eps := Eps;
top^.ldfield.UTTfield^.First := First;
top^.ldfield.UTTfield^.Kind := Kind;
END
END; END;

END;

END;{package}
PACKAGE EXPRpack: [EXPRrule];
VAR
Eps :  BOOLEAN;
First : afxprLANGSPEC_SETOFatomnodes;
Kind : afxprLANGSPEC_KindType;

PROCEDURE EXPRrule(a:afxprDECL_nodeid;b:afxprDECL_psnode;mode:afxprDECL_surfrulemode);
BEGIN case a of Hinit:
 BEGIN
Eps := TRUE;
INITsetofatomnodes(First);
END;
1 : CASE mode OF

loccond:afxprDECL_assignstatus(
TRUE
);globcond: BEGIN
 afxprDECL_assignstatus(
 TRUE
);IF afxprDECL_status THEN BEGIN
Eps := b^.ldfield.ROUNDfield^.Eps;
First := b^.ldfield.ROUNDfield^.First;
Kind := b^.ldfield.ROUNDfield^.Kind;
END
END; END;

2 : CASE mode OF

loccond:afxprDECL_assignstatus(
TRUE
);globcond: BEGIN
 afxprDECL_assignstatus(
 TRUE
);IF afxprDECL_status THEN BEGIN
Eps := b^.ldfield.LANDfield^.Eps;
First := b^.ldfield.LANDfield^.First;
Kind := b^.ldfield.LANDfield^.Kind;
END
END; END;

3 : CASE mode OF

loccond:afxprDECL_assignstatus(
TRUE
);globcond: BEGIN
 afxprDECL_assignstatus(
 TRUE
);IF afxprDECL_status THEN BEGIN
Eps := b^.ldfield.LORfield^.Eps;
First := b^.ldfield.LORfield^.First;
Kind := b^.ldfield.LORfield^.Kind;
END
END; END;

4 : CASE mode OF

loccond:afxprDECL_assignstatus(
TRUE
);globcond: BEGIN
 afxprDECL_assignstatus(
 TRUE
);IF afxprDECL_status THEN BEGIN
Eps := b^.ldfield.LOPTfield^.Eps;
First := b^.ldfield.LOPTfield^.First;
Kind := b^.ldfield.LOPTfield^.Kind;
END
END; END;

5 : CASE mode OF

loccond:afxprDECL_assignstatus(
TRUE
);globcond: BEGIN
 afxprDECL_assignstatus(
 TRUE
);IF afxprDECL_status THEN BEGIN
Eps := b^.ldfield.REPfield^.Eps;
First := b^.ldfield.REPfield^.First;
Kind := b^.ldfield.REPfield^.Kind;
END
END; END;

6 : CASE mode OF

loccond:afxprDECL_assignstatus(
TRUE
);globcond: BEGIN
 afxprDECL_assignstatus(
 TRUE
);IF afxprDECL_status THEN BEGIN
Eps := b^.ldfield.LEAVEfield^.Eps;
First := b^.ldfield.LEAVEfield^.First;
Kind := b^.ldfield.LEAVEfield^.Kind;
END
END; END;

Hfinal: BEGIN
 afxprDECL_assignstatus(
 TRUE
);IF afxprDECL_status THEN BEGIN afxprMAKET_EXPR(top);afxprDECL_addnewtop(top)
;
top^.ldfield.EXPRfield^.Eps := Eps;
top^.ldfield.EXPRfield^.First := First;
top^.ldfield.EXPRfield^.Kind := Kind;
END
END; END;

END;

END;{package}
PACKAGE ROUNDpack: [ROUNDrule];
VAR
Eps :  BOOLEAN;
First : afxprLANGSPEC_SETOFatomnodes;

PROCEDURE ROUNDrule(a:afxprDECL_nodeid;b:afxprDECL_psnode;mode:afxprDECL_surfrulemode);
BEGIN case a of Hinit:
 BEGIN
Eps := TRUE;
INITsetofatomnodes(First);
END;
1 : CASE mode OF

loccond:afxprDECL_assignstatus(
TRUE
);globcond: BEGIN
 afxprDECL_assignstatus(
 TRUE
);IF afxprDECL_status THEN BEGIN
Eps := b^.ldfield.EXPRfield^.Eps;
First := b^.ldfield.EXPRfield^.First;
END
END; END;

10 : CASE mode OF

loccond:afxprDECL_assignstatus(
TRUE
);globcond: BEGIN
 afxprDECL_assignstatus(
 TRUE
);IF afxprDECL_status THEN BEGIN
END
END; END;

11 : CASE mode OF

loccond:afxprDECL_assignstatus(
TRUE
);globcond: BEGIN
 afxprDECL_assignstatus(
 TRUE
);IF afxprDECL_status THEN BEGIN
END
END; END;

Hfinal: BEGIN
 afxprDECL_assignstatus(
 TRUE
);IF afxprDECL_status THEN BEGIN afxprMAKET_ROUND(top);afxprDECL_addnewtop(top)
;
top^.ldfield.ROUNDfield^.Eps := Eps;
top^.ldfield.ROUNDfield^.First := First;
top^.ldfield.ROUNDfield^.Kind := RoundKind;
END
END; END;

END;

END;{package}
PACKAGE LANDpack: [LANDrule];
VAR
Eps :  BOOLEAN;
Eps1 :  BOOLEAN;
Eps2 :  BOOLEAN;
First : afxprLANGSPEC_SETOFatomnodes;
First1 : afxprLANGSPEC_SETOFatomnodes;
First2 : afxprLANGSPEC_SETOFatomnodes;
PROCEDURE LANDrule(a:afxprDECL_nodeid;b:afxprDECL_psnode;mode:afxprDECL_surfrulemode);
 FUNCTION Union(a1, a2: afxprLANGSPEC_SETOFatomnodes): afxprLANGSPEC_SETOFatomnodes;
VAR
a3: afxprLANGSPEC_SETOFatomnodes;
a : afxprLANGSPEC_atomnode;
BEGIN
a3 := a1;
WHILE STILLatomnodes(a2) DO BEGIN
TAKEatomnode(a, a2);
APPENDatomnode(a, a3);
END;
Union := a3
END;

BEGIN case a of Hinit:
 BEGIN
Eps := TRUE;
Eps1 := TRUE;
Eps2 := TRUE;
INITsetofatomnodes(First);
INITsetofatomnodes(First1);
INITsetofatomnodes(First2);
END;
1 : CASE mode OF

loccond:afxprDECL_assignstatus(
 ( b^.ldfield.EXPRfield^.Kind <> ConcKind )
);globcond: BEGIN
 afxprDECL_assignstatus(
 TRUE
);IF afxprDECL_status THEN BEGIN
Eps1 := b^.ldfield.EXPRfield^.Eps;
First1 := b^.ldfield.EXPRfield^.First;
END
END; END;

2 : CASE mode OF

loccond:afxprDECL_assignstatus(
TRUE
);globcond: BEGIN
 afxprDECL_assignstatus(
 TRUE
);IF afxprDECL_status THEN BEGIN
Eps2 := b^.ldfield.EXPRfield^.Eps;
First2 := b^.ldfield.EXPRfield^.First;
END
END; END;

10 : CASE mode OF

loccond:afxprDECL_assignstatus(
TRUE
);globcond: BEGIN
 afxprDECL_assignstatus(
 TRUE
);IF afxprDECL_status THEN BEGIN
END
END; END;

Hfinal: BEGIN
 afxprDECL_assignstatus(
 TRUE
);IF afxprDECL_status THEN BEGIN afxprMAKET_LAND(top);afxprDECL_addnewtop(top)
;
IF Eps1 
THEN First := Union(First1, First2)
ELSE First := First1;
Eps := Eps1 AND Eps2;
top^.ldfield.LANDfield^.Eps := Eps;
top^.ldfield.LANDfield^.First := First;
top^.ldfield.LANDfield^.Eps2 := Eps2;
top^.ldfield.LANDfield^.First2 := First2;
top^.ldfield.LANDfield^.Kind := ConcKind;
END
END; END;

END;

END;{package}
PACKAGE LORpack: [LORrule];
VAR
Eps1 :  BOOLEAN;
Eps2 :  BOOLEAN;
First1 : afxprLANGSPEC_SETOFatomnodes;
First2 : afxprLANGSPEC_SETOFatomnodes;
PROCEDURE LORrule(a:afxprDECL_nodeid;b:afxprDECL_psnode;mode:afxprDECL_surfrulemode);
 FUNCTION Union(a1, a2: afxprLANGSPEC_SETOFatomnodes): afxprLANGSPEC_SETOFatomnodes;
VAR
a3: afxprLANGSPEC_SETOFatomnodes;
a : afxprLANGSPEC_atomnode;
BEGIN
a3 := a1;
WHILE STILLatomnodes(a2) DO BEGIN
TAKEatomnode(a, a2);
APPENDatomnode(a, a3);
END;
Union := a3
END;

BEGIN case a of Hinit:
 BEGIN
Eps1 := TRUE;
Eps2 := TRUE;
INITsetofatomnodes(First1);
INITsetofatomnodes(First2);
END;
1 : CASE mode OF

loccond:afxprDECL_assignstatus(
 ( b^.ldfield.EXPRfield^.Kind <> AltKind )
);globcond: BEGIN
 afxprDECL_assignstatus(
 TRUE
);IF afxprDECL_status THEN BEGIN
Eps1 := b^.ldfield.EXPRfield^.Eps;
First1 := b^.ldfield.EXPRfield^.First;
END
END; END;

2 : CASE mode OF

loccond:afxprDECL_assignstatus(
TRUE
);globcond: BEGIN
 afxprDECL_assignstatus(
 TRUE
);IF afxprDECL_status THEN BEGIN
Eps2 := b^.ldfield.EXPRfield^.Eps;
First2 := b^.ldfield.EXPRfield^.First;
END
END; END;

10 : CASE mode OF

loccond:afxprDECL_assignstatus(
TRUE
);globcond: BEGIN
 afxprDECL_assignstatus(
 TRUE
);IF afxprDECL_status THEN BEGIN
END
END; END;

Hfinal: BEGIN
 afxprDECL_assignstatus(
 TRUE
);IF afxprDECL_status THEN BEGIN afxprMAKET_LOR(top);afxprDECL_addnewtop(top)
;
top^.ldfield.LORfield^.Eps := Eps1 OR Eps2;
top^.ldfield.LORfield^.First := Union(First1, First2);
top^.ldfield.LORfield^.Kind := AltKind;
END
END; END;

END;

END;{package}
PACKAGE LOPTpack: [LOPTrule];
VAR
First1 : afxprLANGSPEC_SETOFatomnodes;

PROCEDURE LOPTrule(a:afxprDECL_nodeid;b:afxprDECL_psnode;mode:afxprDECL_surfrulemode);
BEGIN case a of Hinit:
 BEGIN
INITsetofatomnodes(First1);
END;
1 : CASE mode OF

loccond:afxprDECL_assignstatus(
 TRUE
);globcond: BEGIN
 afxprDECL_assignstatus(
 TRUE
);IF afxprDECL_status THEN BEGIN
First1 := b^.ldfield.EXPRfield^.First;
END
END; END;

10 : CASE mode OF

loccond:afxprDECL_assignstatus(
TRUE
);globcond: BEGIN
 afxprDECL_assignstatus(
 TRUE
);IF afxprDECL_status THEN BEGIN
END
END; END;

11 : CASE mode OF

loccond:afxprDECL_assignstatus(
TRUE
);globcond: BEGIN
 afxprDECL_assignstatus(
 TRUE
);IF afxprDECL_status THEN BEGIN
END
END; END;

Hfinal: BEGIN
 afxprDECL_assignstatus(
 TRUE
);IF afxprDECL_status THEN BEGIN afxprMAKET_LOPT(top);afxprDECL_addnewtop(top)
;
top^.ldfield.LOPTfield^.Eps := TRUE;
top^.ldfield.LOPTfield^.First := First1;
top^.ldfield.LOPTfield^.Kind := OptKind;
END
END; END;

END;

END;{package}
PACKAGE REPpack: [REPrule];
VAR
First1 : afxprLANGSPEC_SETOFatomnodes;

PROCEDURE REPrule(a:afxprDECL_nodeid;b:afxprDECL_psnode;mode:afxprDECL_surfrulemode);
BEGIN case a of Hinit:
 BEGIN
INITsetofatomnodes(First1);
END;
1 : CASE mode OF

loccond:afxprDECL_assignstatus(
 TRUE
);globcond: BEGIN
 afxprDECL_assignstatus(
 TRUE
);IF afxprDECL_status THEN BEGIN
First1 := b^.ldfield.EXPRfield^.First;
END
END; END;

10 : CASE mode OF

loccond:afxprDECL_assignstatus(
TRUE
);globcond: BEGIN
 afxprDECL_assignstatus(
 TRUE
);IF afxprDECL_status THEN BEGIN
END
END; END;

11 : CASE mode OF

loccond:afxprDECL_assignstatus(
TRUE
);globcond: BEGIN
 afxprDECL_assignstatus(
 TRUE
);IF afxprDECL_status THEN BEGIN
END
END; END;

Hfinal: BEGIN
 afxprDECL_assignstatus(
 TRUE
);IF afxprDECL_status THEN BEGIN afxprMAKET_REP(top);afxprDECL_addnewtop(top)
;
top^.ldfield.REPfield^.Eps := TRUE;
top^.ldfield.REPfield^.First := First1;
top^.ldfield.REPfield^.Kind := RepKind;
END
END; END;

END;

END;{package}
PACKAGE LEAVEpack: [LEAVErule];
VAR
First1 : afxprLANGSPEC_SETOFatomnodes;
AtomStr : afxprLANGSPEC_atomnode; 

PROCEDURE LEAVErule(a:afxprDECL_nodeid;b:afxprDECL_psnode;mode:afxprDECL_surfrulemode);
BEGIN case a of Hinit:
 BEGIN
INITsetofatomnodes(First1);
END;
1 : CASE mode OF

loccond:afxprDECL_assignstatus(
 TRUE
);globcond: BEGIN
 afxprDECL_assignstatus(
 TRUE
);IF afxprDECL_status THEN BEGIN
AtomStr.str := b^.ldfield.TERMINAL^.str;
Afxid:=Afxid+1;
AtomStr.afxid :=AfxId; 
APPENDatomnode(AtomStr, First1);
END
END; END;

Hfinal: BEGIN
 afxprDECL_assignstatus(
 TRUE
);IF afxprDECL_status THEN BEGIN afxprMAKET_LEAVE(top);afxprDECL_addnewtop(top)
;
top^.ldfield.LEAVEfield^.Eps := FALSE;
top^.ldfield.LEAVEfield^.First := First1;
top^.ldfield.LEAVEfield^.Kind := AtomKind;
END
END; END;

END;

END;{package}
 PROCEDURE afxprRULES_init;
BEGIN
initint(afxid);
END;
 procedure afxprRULES_rule(rnr:INTEGER;a:afxprDECL_nodeid;
        b,la:afxprDECL_psnode;mode:afxprDECL_surfrulemode);
BEGIN
CASE rnr OF
  1:WITH UTTpack DO UTTrule(a,b,mode);
  2:WITH EXPRpack DO EXPRrule(a,b,mode);
  3:WITH ROUNDpack DO ROUNDrule(a,b,mode);
  4:WITH LANDpack DO LANDrule(a,b,mode);
  5:WITH LORpack DO LORrule(a,b,mode);
  6:WITH LOPTpack DO LOPTrule(a,b,mode);
  7:WITH REPpack DO REPrule(a,b,mode);
  8:WITH LEAVEpack DO LEAVErule(a,b,mode);
END
END;
