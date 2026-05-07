EXPORT(ilacomrules);
pragma C_include('ilacomrules.pf');
pragma C_include('ilacomlangspec.pf');
pragma C_include('ilacommaket.pf');
pragma C_include('ilacomdecl.pf');
pragma C_include('lidomaint.pf');
pragma C_include('ldconvrec.pf');
pragma C_include('ldstrtotype.pf');
pragma C_include('ldcatsets.pf');
pragma C_include('strtokey.pf');
pragma C_include('string.pf');
pragma C_include('strings.pf');
pragma C_include('tstring.pf');
PROGRAM ilacomRULES;
WITH ilacommaket,
ilacomdecl,
ilacomlangspec,lidomaint,ldstrtotype,
ldconvrec,ldcatsets,strtokey,strng,tstring;
VAR top: ilacomDECL_psnode;
TYPEStable              :ilacomlangspec_setoftypespecs;
RULEStable              :ilacomlangspec_setofrulespecs;
PACKAGE UTTpack: [UTTrule];
VAR table1,table2,table3: ilacomLANGSPEC_setoftypespecs;
typespec1,typespec2: ilacomLANGSPEC_typespec;

PROCEDURE UTTrule(a:ilacomDECL_nodeid;b:ilacomDECL_psnode;mode:ilacomDECL_surfrulemode);
BEGIN case a of Hinit:
BEGIN 
END;
1: CASE mode OF

loccond:ilacomDECL_assignstatus(
TRUE
);globcond: BEGIN
 ilacomDECL_assignstatus(
 TRUE
);IF ilacomDECL_status THEN BEGIN
END
END; END;

2: CASE mode OF

loccond:ilacomDECL_assignstatus(
TRUE
);globcond: BEGIN
 ilacomDECL_assignstatus(
 TRUE
);IF ilacomDECL_status THEN BEGIN 
END
END; END;

3: CASE mode OF

loccond:ilacomDECL_assignstatus(
TRUE
);globcond: BEGIN
 ilacomDECL_assignstatus(
 TRUE
);IF ilacomDECL_status THEN BEGIN 
END
END; END;

Hfinal: BEGIN
 ilacomDECL_assignstatus(
 TRUE
);IF ilacomDECL_status THEN BEGIN
ilacomMAKET_UTT(top);ilacomDECL_addnewtop(top)
;
table1:=typestable;
initsetoftypespecs(table3);
WHILE stilltypespecs(table1) DO
BEGIN
taketypespec(typespec1,table1);
IF (typespec1.typekind = setkind) THEN
BEGIN
table2:=typestable;
WHILE stilltypespecs(table2) DO
BEGIN
taketypespec(typespec2,table2);
IF (TSTRING_compare(typespec1.basetype,
typespec2.typename)=0) THEN
BEGIN
typespec1.basefirst:=typespec2.basefirst; 
typespec1.baselast:=typespec2.baselast; 
END;
END;
END;
appendtypespec(typespec1,table3);
END;
top^.ldfield.UTTfield^.typestable:=table3; 
top^.ldfield.UTTfield^.rulestable:=rulestable; 
END
END; END;

END;

END;{package}
PACKAGE TYPESPECpack: [TYPESPECrule];

PROCEDURE TYPESPECrule(a:ilacomDECL_nodeid;b:ilacomDECL_psnode;mode:ilacomDECL_surfrulemode);
BEGIN case a of Hinit:
BEGIN
END;
1: CASE mode OF

loccond:ilacomDECL_assignstatus(
TRUE
);globcond: BEGIN
 ilacomDECL_assignstatus(
 TRUE
);IF ilacomDECL_status THEN BEGIN
END
END; END;

2: CASE mode OF

loccond:ilacomDECL_assignstatus(
TRUE
);globcond: BEGIN
 ilacomDECL_assignstatus(
 TRUE
);IF ilacomDECL_status THEN BEGIN
END
END; END;

Hfinal: BEGIN
 ilacomDECL_assignstatus(
 TRUE
);IF ilacomDECL_status THEN BEGIN
ilacomMAKET_TYPESPEC(top);ilacomDECL_addnewtop(top)
;
END
END; END;

END;

END;{package}
PACKAGE TYPEDEFINITIONpack: [TYPEDEFINITIONrule];

PROCEDURE TYPEDEFINITIONrule(a:ilacomDECL_nodeid;b:ilacomDECL_psnode;mode:ilacomDECL_surfrulemode);
BEGIN case a of Hinit:
BEGIN
END;
1: CASE mode OF

loccond:ilacomDECL_assignstatus(
TRUE
);globcond: BEGIN
 ilacomDECL_assignstatus(
 TRUE
);IF ilacomDECL_status THEN BEGIN
END
END; END;

2: CASE mode OF

loccond:ilacomDECL_assignstatus(
TRUE
);globcond: BEGIN
 ilacomDECL_assignstatus(
 TRUE
);IF ilacomDECL_status THEN BEGIN
END
END; END;

3: CASE mode OF

loccond:ilacomDECL_assignstatus(
TRUE
);globcond: BEGIN
 ilacomDECL_assignstatus(
 TRUE
);IF ilacomDECL_status THEN BEGIN
END
END; END;

4: CASE mode OF

loccond:ilacomDECL_assignstatus(
TRUE
);globcond: BEGIN
 ilacomDECL_assignstatus(
 TRUE
);IF ilacomDECL_status THEN BEGIN
END
END; END;

5: CASE mode OF

loccond:ilacomDECL_assignstatus(
TRUE
);globcond: BEGIN
 ilacomDECL_assignstatus(
 TRUE
);IF ilacomDECL_status THEN BEGIN
END
END; END;

Hfinal: BEGIN
 ilacomDECL_assignstatus(
 TRUE
);IF ilacomDECL_status THEN BEGIN
ilacomMAKET_TYPEDEFINITION(top);ilacomDECL_addnewtop(top)
;
END
END; END;

END;

END;{package}
PACKAGE ENUMDEFpack: [ENUMDEFrule];
VAR teller: ilacomLANGSPEC_int;
str: TSTRING_string;
typespec: ilacomLANGSPEC_typespec;

PROCEDURE ENUMDEFrule(a:ilacomDECL_nodeid;b:ilacomDECL_psnode;mode:ilacomDECL_surfrulemode);
BEGIN case a of Hinit:
BEGIN teller:=0;
END;
1: CASE mode OF

loccond:ilacomDECL_assignstatus(
TRUE
);globcond: BEGIN
 ilacomDECL_assignstatus(
 TRUE
);IF ilacomDECL_status THEN BEGIN
END
END; END;

2: CASE mode OF

loccond:ilacomDECL_assignstatus(
TRUE
);globcond: BEGIN
 ilacomDECL_assignstatus(
 TRUE
);IF ilacomDECL_status THEN BEGIN typespec.typename:=b^.ldfield.TYPENAMEfield^.str;
typespec.typekind:=enumkind;
TSTRING_constantempty(typespec.basetype);
TSTRING_constantempty(typespec.basefirst);
TSTRING_constantempty(typespec.baselast);
END
END; END;

3: CASE mode OF

loccond:ilacomDECL_assignstatus(
TRUE
);globcond: BEGIN
 ilacomDECL_assignstatus(
 TRUE
);IF ilacomDECL_status THEN BEGIN teller:=teller+1;
str:=b^.ldfield.TERMINAL^.str;
IF teller=1 THEN
BEGIN
typespec.basefirst:=str
END;
END
END; END;

4: CASE mode OF

loccond:ilacomDECL_assignstatus(
TRUE
);globcond: BEGIN
 ilacomDECL_assignstatus(
 TRUE
);IF ilacomDECL_status THEN BEGIN
END
END; END;

Hfinal: BEGIN
 ilacomDECL_assignstatus(
 TRUE
);IF ilacomDECL_status THEN BEGIN
ilacomMAKET_ENUMDEF(top);ilacomDECL_addnewtop(top)
;
typespec.baselast:=str;
appendtypespec(typespec,typestable);
END
END; END;

END;

END;{package}
PACKAGE SUBRANGEDEFpack: [SUBRANGEDEFrule];
VAR typespec: ilacomLANGSPEC_typespec;

PROCEDURE SUBRANGEDEFrule(a:ilacomDECL_nodeid;b:ilacomDECL_psnode;mode:ilacomDECL_surfrulemode);
BEGIN case a of Hinit:
BEGIN
END;
1: CASE mode OF

loccond:ilacomDECL_assignstatus(
TRUE
);globcond: BEGIN
 ilacomDECL_assignstatus(
 TRUE
);IF ilacomDECL_status THEN BEGIN
END
END; END;

2: CASE mode OF

loccond:ilacomDECL_assignstatus(
TRUE
);globcond: BEGIN
 ilacomDECL_assignstatus(
 TRUE
);IF ilacomDECL_status THEN BEGIN typespec.typename:=b^.ldfield.TYPENAMEfield^.str;
typespec.typekind:=subrangekind;
TSTRING_constantempty(typespec.basefirst);
END
END; END;

3: CASE mode OF

loccond:ilacomDECL_assignstatus(
TRUE
);globcond: BEGIN
 ilacomDECL_assignstatus(
 TRUE
);IF ilacomDECL_status THEN BEGIN typespec.basefirst:=b^.ldfield.TERMINAL^.str
END
END; END;

4: CASE mode OF

loccond:ilacomDECL_assignstatus(
TRUE
);globcond: BEGIN
 ilacomDECL_assignstatus(
 TRUE
);IF ilacomDECL_status THEN BEGIN typespec.baselast:=b^.ldfield.TERMINAL^.str
END
END; END;

Hfinal: BEGIN
 ilacomDECL_assignstatus(
 TRUE
);IF ilacomDECL_status THEN BEGIN
appendtypespec(typespec,typestable);
ilacomMAKET_SUBRANGEDEF(top);ilacomDECL_addnewtop(top)
;
END
END; END;

END;

END;{package}
PACKAGE INTEGERDEFpack: [INTEGERDEFrule];
VAR typespec: ilacomLANGSPEC_typespec;

PROCEDURE INTEGERDEFrule(a:ilacomDECL_nodeid;b:ilacomDECL_psnode;mode:ilacomDECL_surfrulemode);
BEGIN case a of Hinit:
BEGIN
END;
1: CASE mode OF

loccond:ilacomDECL_assignstatus(
TRUE
);globcond: BEGIN
 ilacomDECL_assignstatus(
 TRUE
);IF ilacomDECL_status THEN BEGIN
END
END; END;

2: CASE mode OF

loccond:ilacomDECL_assignstatus(
TRUE
);globcond: BEGIN
 ilacomDECL_assignstatus(
 TRUE
);IF ilacomDECL_status THEN BEGIN typespec.typename:=b^.ldfield.TYPENAMEfield^.str;
typespec.typekind:=intkind;
TSTRING_constantempty(typespec.basetype);
TSTRING_constantempty(typespec.basefirst);
TSTRING_constantempty(typespec.baselast);
appendtypespec(typespec,typestable);
END
END; END;

Hfinal: BEGIN
 ilacomDECL_assignstatus(
 TRUE
);IF ilacomDECL_status THEN BEGIN
ilacomMAKET_INTEGERDEF(top);ilacomDECL_addnewtop(top)
;
END
END; END;

END;

END;{package}
PACKAGE BOOLEANDEFpack: [BOOLEANDEFrule];
VAR typespec: ilacomLANGSPEC_typespec;

PROCEDURE BOOLEANDEFrule(a:ilacomDECL_nodeid;b:ilacomDECL_psnode;mode:ilacomDECL_surfrulemode);
BEGIN case a of Hinit:
BEGIN
END;
1: CASE mode OF

loccond:ilacomDECL_assignstatus(
TRUE
);globcond: BEGIN
 ilacomDECL_assignstatus(
 TRUE
);IF ilacomDECL_status THEN BEGIN
END
END; END;

2: CASE mode OF

loccond:ilacomDECL_assignstatus(
TRUE
);globcond: BEGIN
 ilacomDECL_assignstatus(
 TRUE
);IF ilacomDECL_status THEN BEGIN typespec.typename:=b^.ldfield.TYPENAMEfield^.str;
typespec.typekind:=boolkind;
TSTRING_constantempty(typespec.basetype);
TSTRING_constantempty(typespec.basefirst);
TSTRING_constantempty(typespec.baselast);
appendtypespec(typespec,typestable);
END
END; END;

Hfinal: BEGIN
 ilacomDECL_assignstatus(
 TRUE
);IF ilacomDECL_status THEN BEGIN
ilacomMAKET_BOOLEANDEF(top);ilacomDECL_addnewtop(top)
;
END
END; END;

END;

END;{package}
PACKAGE SETDEFpack: [SETDEFrule];
VAR typespec: ilacomLANGSPEC_typespec;

PROCEDURE SETDEFrule(a:ilacomDECL_nodeid;b:ilacomDECL_psnode;mode:ilacomDECL_surfrulemode);
BEGIN case a of Hinit:
BEGIN
END;
1: CASE mode OF

loccond:ilacomDECL_assignstatus(
TRUE
);globcond: BEGIN
 ilacomDECL_assignstatus(
 TRUE
);IF ilacomDECL_status THEN BEGIN
END
END; END;

2: CASE mode OF

loccond:ilacomDECL_assignstatus(
TRUE
);globcond: BEGIN
 ilacomDECL_assignstatus(
 TRUE
);IF ilacomDECL_status THEN BEGIN typespec.typename:=b^.ldfield.TYPENAMEfield^.str;
END
END; END;

3: CASE mode OF

loccond:ilacomDECL_assignstatus(
TRUE
);globcond: BEGIN
 ilacomDECL_assignstatus(
 TRUE
);IF ilacomDECL_status THEN BEGIN typespec.typekind:=setkind;
typespec.basetype:=b^.ldfield.TERMINAL^.str;
TSTRING_constantempty(typespec.basefirst);
TSTRING_constantempty(typespec.baselast);
appendtypespec(typespec,typestable);
END
END; END;

Hfinal: BEGIN
 ilacomDECL_assignstatus(
 TRUE
);IF ilacomDECL_status THEN BEGIN
ilacomMAKET_SETDEF(top);ilacomDECL_addnewtop(top)
;
END
END; END;

END;

END;{package}
PACKAGE LANGVERSIONpack: [LANGVERSIONrule];

PROCEDURE LANGVERSIONrule(a:ilacomDECL_nodeid;b:ilacomDECL_psnode;mode:ilacomDECL_surfrulemode);
BEGIN case a of Hinit:
BEGIN
END;
1: CASE mode OF

loccond:ilacomDECL_assignstatus(
TRUE
);globcond: BEGIN
 ilacomDECL_assignstatus(
 TRUE
);IF ilacomDECL_status THEN BEGIN
END
END; END;

2: CASE mode OF

loccond:ilacomDECL_assignstatus(
TRUE
);globcond: BEGIN
 ilacomDECL_assignstatus(
 TRUE
);IF ilacomDECL_status THEN BEGIN
END
END; END;

Hfinal: BEGIN
 ilacomDECL_assignstatus(
 TRUE
);IF ilacomDECL_status THEN BEGIN
assigncounter(0);
ilacomMAKET_LANGVERSION(top);ilacomDECL_addnewtop(top)
;
END
END; END;

END;

END;{package}
PACKAGE ILRULESspecpack: [ILRULESspecrule];

PROCEDURE ILRULESspecrule(a:ilacomDECL_nodeid;b:ilacomDECL_psnode;mode:ilacomDECL_surfrulemode);
BEGIN case a of Hinit:
BEGIN 
END;
1: CASE mode OF

loccond:ilacomDECL_assignstatus(
TRUE
);globcond: BEGIN
 ilacomDECL_assignstatus(
 TRUE
);IF ilacomDECL_status THEN BEGIN
END
END; END;

2: CASE mode OF

loccond:ilacomDECL_assignstatus(
 TRUE
);globcond: BEGIN
 ilacomDECL_assignstatus(
 TRUE
);IF ilacomDECL_status THEN BEGIN 
END
END; END;

Hfinal: BEGIN
 ilacomDECL_assignstatus(
 TRUE
);IF ilacomDECL_status THEN BEGIN
ilacomMAKET_ILrulesspec(top);ilacomDECL_addnewtop(top)
;
END
END; END;

END;

END;{package}
PACKAGE ILRULEpack: [ILRULErule];
VAR rulespec: ilacomLANGSPEC_rulespec;
params: ilacomLANGSPEC_setofparams;
param: ilacomLANGSPEC_param;
PROCEDURE ILRULErule(a:ilacomDECL_nodeid;b:ilacomDECL_psnode;mode:ilacomDECL_surfrulemode);
 FUNCTION checktypename(str:TSTRING_string):BOOLEAN;
VAR found: ilacomLANGSPEC_bool;
table: ilacomLANGSPEC_setoftypespecs;
typespec: ilacomLANGSPEC_typespec;
BEGIN
found:=false;
table:=typestable;
WHILE stilltypespecs(table) AND not(found) DO
BEGIN
taketypespec(typespec,table);
found:=(TSTRING_compare(typespec.typename,str)=0);
END;
IF not found THEN writeln('type ',str, ' used but not defined');
checktypename:=found
END;

BEGIN case a of Hinit:
BEGIN initsetofparams(params);
END;
1: CASE mode OF

loccond:ilacomDECL_assignstatus(
TRUE
);globcond: BEGIN
 ilacomDECL_assignstatus(
 TRUE
);IF ilacomDECL_status THEN BEGIN
END
END; END;

2: CASE mode OF

loccond:ilacomDECL_assignstatus(
TRUE
);globcond: BEGIN
 ilacomDECL_assignstatus(
 TRUE
);IF ilacomDECL_status THEN BEGIN assigncounter(counter+1);
rulespec.rulename:=b^.ldfield.TERMINAL^.str;
rulespec.rulenr:=counter;
END
END; END;

3: CASE mode OF

loccond:ilacomDECL_assignstatus(
TRUE
);globcond: BEGIN
 ilacomDECL_assignstatus(
 TRUE
);IF ilacomDECL_status THEN BEGIN param.name:=b^.ldfield.PARAMNAMEfield^.str;
END
END; END;

4: CASE mode OF

loccond:ilacomDECL_assignstatus(
 checktypename(b^.ldfield.TYPENAMEfield^.str)
);globcond: BEGIN
 ilacomDECL_assignstatus(
 TRUE
);IF ilacomDECL_status THEN BEGIN param.typename:=b^.ldfield.TYPENAMEfield^.str;
appendparam(param,params);
END
END; END;

5: CASE mode OF

loccond:ilacomDECL_assignstatus(
TRUE
);globcond: BEGIN
 ilacomDECL_assignstatus(
 TRUE
);IF ilacomDECL_status THEN BEGIN TSTRING_constantempty(param.name);
TSTRING_appendchars(param.name,
param.name,'LEVEL',5);
TSTRING_constantempty(param.typename);
TSTRING_appendchars(param.typename,
param.typename,'INTEGER',7);
appendparam(param,params);
END
END; END;

Hfinal: BEGIN
 ilacomDECL_assignstatus(
 TRUE
);IF ilacomDECL_status THEN BEGIN
rulespec.params:=params;
appendrulespec(rulespec,rulestable);
ilacomMAKET_ILRULE(top);ilacomDECL_addnewtop(top)
;
END
END; END;

END;

END;{package}
PACKAGE PARAMNAMEpack: [PARAMNAMErule];
VAR str: TSTRING_string;

PROCEDURE PARAMNAMErule(a:ilacomDECL_nodeid;b:ilacomDECL_psnode;mode:ilacomDECL_surfrulemode);
BEGIN case a of Hinit:
BEGIN 
END;
1: CASE mode OF

loccond:ilacomDECL_assignstatus(
TRUE
);globcond: BEGIN
 ilacomDECL_assignstatus(
 TRUE
);IF ilacomDECL_status THEN BEGIN str:=b^.ldfield.TERMINAL^.str
END
END; END;

Hfinal: BEGIN
 ilacomDECL_assignstatus(
 TRUE
);IF ilacomDECL_status THEN BEGIN
ilacomMAKET_PARAMNAME(top);ilacomDECL_addnewtop(top)
;
top^.ldfield.PARAMNAMEfield^.str:=str;
END
END; END;

END;

END;{package}
PACKAGE TYPENAMEpack: [TYPENAMErule];
VAR str: TSTRING_string;

PROCEDURE TYPENAMErule(a:ilacomDECL_nodeid;b:ilacomDECL_psnode;mode:ilacomDECL_surfrulemode);
BEGIN case a of Hinit:
BEGIN 
END;
1: CASE mode OF

loccond:ilacomDECL_assignstatus(
TRUE
);globcond: BEGIN
 ilacomDECL_assignstatus(
 TRUE
);IF ilacomDECL_status THEN BEGIN str:=b^.ldfield.TERMINAL^.str
END
END; END;

Hfinal: BEGIN
 ilacomDECL_assignstatus(
 TRUE
);IF ilacomDECL_status THEN BEGIN
ilacomMAKET_TYPENAME(top);ilacomDECL_addnewtop(top)
;
top^.ldfield.TYPENAMEfield^.str:=str;
END
END; END;

END;

END;{package}
 PROCEDURE ilacomRULES_init;
BEGIN
initsetoftypespecs(TYPEStable);
initsetofrulespecs(RULEStable);
END;
 procedure ilacomRULES_rule(rnr:INTEGER;a:ilacomDECL_nodeid;
        b,la:ilacomDECL_psnode;mode:ilacomDECL_surfrulemode);
BEGIN
CASE rnr OF
  1:WITH UTTpack DO UTTrule(a,b,mode);
  2:WITH TYPESPECpack DO TYPESPECrule(a,b,mode);
  3:WITH TYPEDEFINITIONpack DO TYPEDEFINITIONrule(a,b,mode);
  4:WITH ENUMDEFpack DO ENUMDEFrule(a,b,mode);
  5:WITH SUBRANGEDEFpack DO SUBRANGEDEFrule(a,b,mode);
  6:WITH INTEGERDEFpack DO INTEGERDEFrule(a,b,mode);
  7:WITH BOOLEANDEFpack DO BOOLEANDEFrule(a,b,mode);
  8:WITH SETDEFpack DO SETDEFrule(a,b,mode);
  9:WITH LANGVERSIONpack DO LANGVERSIONrule(a,b,mode);
 10:WITH ILRULESspecpack DO ILRULESspecrule(a,b,mode);
 11:WITH ILRULEpack DO ILRULErule(a,b,mode);
 12:WITH PARAMNAMEpack DO PARAMNAMErule(a,b,mode);
 13:WITH TYPENAMEpack DO TYPENAMErule(a,b,mode);
END
END;
