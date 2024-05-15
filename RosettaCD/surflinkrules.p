EXPORT(surflinkrules);
pragma C_include('surflinkrules.pf');
pragma C_include('surflinklangspec.pf');
pragma C_include('surflinkmaket.pf');
pragma C_include('surflinkdecl.pf');
pragma C_include('lidomaint.pf');
pragma C_include('ldconvrec.pf');
pragma C_include('ldstrtotype.pf');
pragma C_include('ldcatsets.pf');
pragma C_include('strtokey.pf');
pragma C_include('string.pf');
pragma C_include('strings.pf');
pragma C_include('tstring.pf');
PROGRAM surflinkRULES;
WITH surflinkmaket,
surflinkdecl,
surflinklangspec,lidomaint,ldstrtotype,
ldconvrec,ldcatsets,strtokey,strng,tstring;
VAR top: surflinkDECL_psnode;
PACKAGE UTTpack: [UTTrule];
VAR rulenames1,rulenames2: surflinkLANGSPEC_setofidts;
id: surflinkLANGSPEC_idt;
shorthands: surflinkLANGSPEC_setofshds;
shd: surflinkLANGSPEC_shd;

PROCEDURE UTTrule(a:surflinkDECL_nodeid;b:surflinkDECL_psnode;mode:surflinkDECL_surfrulemode);
BEGIN case a of Hinit:
BEGIN initsetofidts(rulenames1);
initsetofshds(shorthands);
END;
1: CASE mode OF

loccond:surflinkDECL_assignstatus(
TRUE
);globcond: BEGIN
 surflinkDECL_assignstatus(
 TRUE
);IF surflinkDECL_status THEN BEGIN
END
END; END;

2: CASE mode OF

loccond:surflinkDECL_assignstatus(
TRUE
);globcond: BEGIN
 surflinkDECL_assignstatus(
 TRUE
);IF surflinkDECL_status THEN BEGIN shd.str:=b^.ldfield.TERMINAL^.str
END
END; END;

3: CASE mode OF

loccond:surflinkDECL_assignstatus(
TRUE
);globcond: BEGIN
 surflinkDECL_assignstatus(
 TRUE
);IF surflinkDECL_status THEN BEGIN 
END
END; END;

4: CASE mode OF

loccond:surflinkDECL_assignstatus(
TRUE
);globcond: BEGIN
 surflinkDECL_assignstatus(
 TRUE
);IF surflinkDECL_status THEN BEGIN rulenames2:=b^.ldfield.PARAMSfield^.rulenames;
WHILE stillidts(rulenames2) DO
BEGIN
takeidt(id,rulenames2);
appendidt(id,rulenames1)
END;
END
END; END;

5: CASE mode OF

loccond:surflinkDECL_assignstatus(
TRUE
);globcond: BEGIN
 surflinkDECL_assignstatus(
 TRUE
);IF surflinkDECL_status THEN BEGIN 
END
END; END;

6: CASE mode OF

loccond:surflinkDECL_assignstatus(
TRUE
);globcond: BEGIN
 surflinkDECL_assignstatus(
 TRUE
);IF surflinkDECL_status THEN BEGIN 
END
END; END;

Hfinal: BEGIN
 surflinkDECL_assignstatus(
 TRUE
);IF surflinkDECL_status THEN BEGIN
surflinkMAKET_UTT(top);surflinkDECL_addnewtop(top)
;
top^.ldfield.UTTfield^.shorthands:=shorthands;
top^.ldfield.UTTfield^.rulenames:=rulenames1;
END
END; END;

END;

END;{package}
PACKAGE PARAMSpack: [PARAMSrule];
VAR id: surflinkLANGSPEC_idt;
rulenames: surflinkLANGSPEC_setofidts;

PROCEDURE PARAMSrule(a:surflinkDECL_nodeid;b:surflinkDECL_psnode;mode:surflinkDECL_surfrulemode);
BEGIN case a of Hinit:
BEGIN initsetofidts(rulenames);
END;
1: CASE mode OF

loccond:surflinkDECL_assignstatus(
TRUE
);globcond: BEGIN
 surflinkDECL_assignstatus(
 TRUE
);IF surflinkDECL_status THEN BEGIN
END
END; END;

2: CASE mode OF

loccond:surflinkDECL_assignstatus(
TRUE
);globcond: BEGIN
 surflinkDECL_assignstatus(
 TRUE
);IF surflinkDECL_status THEN BEGIN 
END
END; END;

3: CASE mode OF

loccond:surflinkDECL_assignstatus(
TRUE
);globcond: BEGIN
 surflinkDECL_assignstatus(
 TRUE
);IF surflinkDECL_status THEN BEGIN id.str:=b^.ldfield.TERMINAL^.str;
appendidt(id,rulenames);
END
END; END;

4: CASE mode OF

loccond:surflinkDECL_assignstatus(
TRUE
);globcond: BEGIN
 surflinkDECL_assignstatus(
 TRUE
);IF surflinkDECL_status THEN BEGIN 
END
END; END;

Hfinal: BEGIN
 surflinkDECL_assignstatus(
 TRUE
);IF surflinkDECL_status THEN BEGIN
surflinkMAKET_PARAMS(top);surflinkDECL_addnewtop(top)
;
top^.ldfield.PARAMSfield^.rulenames:=rulenames;
END
END; END;

END;

END;{package}
PACKAGE GRAPHpack: [GRAPHrule];
VAR numofconcgraphs: surflinkLANGSPEC_int;
numberofstates: surflinkLANGSPEC_int;

PROCEDURE GRAPHrule(a:surflinkDECL_nodeid;b:surflinkDECL_psnode;mode:surflinkDECL_surfrulemode);
BEGIN case a of Hinit:
BEGIN 
numberofstates:=0;
numofconcgraphs:=0
END;
1 :CASE mode OF

loccond:surflinkDECL_assignstatus(
TRUE
);globcond: BEGIN
 surflinkDECL_assignstatus(
 TRUE
);IF surflinkDECL_status THEN BEGIN
END
END; END;

2 :CASE mode OF

loccond:surflinkDECL_assignstatus(
 TRUE
);globcond: BEGIN
 surflinkDECL_assignstatus(
 TRUE
);IF surflinkDECL_status THEN BEGIN
numberofstates:=numberofstates+b^.ldfield.CONCGRAPHfield^.numberofstates;
numofconcgraphs:=numofconcgraphs+1
END
END; END;

Hfinal: BEGIN
 surflinkDECL_assignstatus(
 TRUE
);IF surflinkDECL_status THEN BEGIN
surflinkMAKET_GRAPH(top);surflinkDECL_addnewtop(top)
;
top^.ldfield.GRAPHfield^.numberofstates:=numberofstates;
top^.ldfield.GRAPHfield^.numofconcgraphs:=numofconcgraphs
END
END; END;

END;

END;{package}
PACKAGE CONCGRAPHpack: [CONCGRAPHrule];
VAR numofelemgraphs,numberofstates: surflinkLANGSPEC_int;

PROCEDURE CONCGRAPHrule(a:surflinkDECL_nodeid;b:surflinkDECL_psnode;mode:surflinkDECL_surfrulemode);
BEGIN case a of Hinit:
BEGIN 
numberofstates:=0;
numofelemgraphs:=0;
END;
1 :CASE mode OF

loccond:surflinkDECL_assignstatus(
TRUE
);globcond: BEGIN
 surflinkDECL_assignstatus(
 TRUE
);IF surflinkDECL_status THEN BEGIN
END
END; END;

2 :CASE mode OF

loccond:surflinkDECL_assignstatus(
 TRUE
);globcond: BEGIN
 surflinkDECL_assignstatus(
 TRUE
);IF surflinkDECL_status THEN BEGIN
numberofstates:=numberofstates+b^.ldfield.ELEMGRAPHfield^.numberofstates;
numofelemgraphs:=numofelemgraphs+1
END
END; END;

Hfinal: BEGIN
 surflinkDECL_assignstatus(
 TRUE
);IF surflinkDECL_status THEN BEGIN
surflinkMAKET_CONCGRAPH(top);surflinkDECL_addnewtop(top)
;
top^.ldfield.CONCGRAPHfield^.numberofstates:=numberofstates+numofelemgraphs-1;
top^.ldfield.CONCGRAPHfield^.numofelemgraphs:=numofelemgraphs
END
END; END;

END;

END;{package}
PACKAGE ELEMGRAPHpack: [ELEMGRAPHrule];
VAR graphtype: surflinkLANGSPEC_graphtypetype;
numberofstates: surflinkLANGSPEC_int;

PROCEDURE ELEMGRAPHrule(a:surflinkDECL_nodeid;b:surflinkDECL_psnode;mode:surflinkDECL_surfrulemode);
BEGIN case a of Hinit:
BEGIN
graphtype:=atomgraph
END;
1 :CASE mode OF

loccond:surflinkDECL_assignstatus(
TRUE
);globcond: BEGIN
 surflinkDECL_assignstatus(
 TRUE
);IF surflinkDECL_status THEN BEGIN
END
END; END;

2 :CASE mode OF

loccond:surflinkDECL_assignstatus(
 TRUE
);globcond: BEGIN
 surflinkDECL_assignstatus(
 TRUE
);IF surflinkDECL_status THEN BEGIN
numberofstates:=b^.ldfield.GRAPHfield^.numberofstates;
graphtype:=enclosedgraph
END
END; END;

3 :CASE mode OF

loccond:surflinkDECL_assignstatus(
 TRUE
);globcond: BEGIN
 surflinkDECL_assignstatus(
 TRUE
);IF surflinkDECL_status THEN BEGIN
numberofstates:=b^.ldfield.GRAPHfield^.numberofstates;
graphtype:=optgraph
END
END; END;

4 :CASE mode OF

loccond:surflinkDECL_assignstatus(
 TRUE
);globcond: BEGIN
 surflinkDECL_assignstatus(
 TRUE
);IF surflinkDECL_status THEN BEGIN
numberofstates:=b^.ldfield.GRAPHfield^.numberofstates;
graphtype:=stargraph
END
END; END;

5 :CASE mode OF

loccond:surflinkDECL_assignstatus(
 TRUE
);globcond: BEGIN
 surflinkDECL_assignstatus(
 TRUE
);IF surflinkDECL_status THEN BEGIN
numberofstates:=0;
graphtype:=atomgraph
END
END; END;

6 :CASE mode OF

loccond:surflinkDECL_assignstatus(
 TRUE
);globcond: BEGIN
 surflinkDECL_assignstatus(
 TRUE
);IF surflinkDECL_status THEN BEGIN
graphtype:=atomgraph
END
END; END;

7 :CASE mode OF

loccond:surflinkDECL_assignstatus(
 TRUE
);globcond: BEGIN
 surflinkDECL_assignstatus(
 TRUE
);IF surflinkDECL_status THEN BEGIN 
numberofstates:=0;
graphtype:=shorthand
END
END; END;

Hfinal: BEGIN
 surflinkDECL_assignstatus(
 TRUE
);IF surflinkDECL_status THEN BEGIN
surflinkMAKET_ELEMGRAPH(top);surflinkDECL_addnewtop(top)
;
top^.ldfield.ELEMGRAPHfield^.numberofstates:=numberofstates;
top^.ldfield.ELEMGRAPHfield^.graphtype:=graphtype
END
END; END;

END;

END;{package}
PACKAGE NUMBERpack: [NUMBERrule];
VAR str1: STRING(5);
int,len: STRING_range;
PROCEDURE NUMBERrule(a:surflinkDECL_nodeid;b:surflinkDECL_psnode;mode:surflinkDECL_surfrulemode);
 FUNCTION EXTRACT(str:TSTRING_string):BOOLEAN;
VAR ch:CHAR;result:BOOLEAN;
BEGIN
TSTRING_extractchar(ch,str,1);
result:=(ch IN ['1','2','3','4','5','6','7','8','9']);
IF TSTRING_length(str)=2 THEN 
BEGIN
TSTRING_extractchar(ch,str,2);
result:=(ch IN ['0','1','2','3','4','5','6','7','8','9']) AND result
END;
EXTRACT:=result
END;

BEGIN case a of Hinit:
BEGIN
END;
1 :CASE mode OF

loccond:surflinkDECL_assignstatus(
 EXTRACT(b^.ldfield.TERMINAL^.str)
);globcond: BEGIN
 surflinkDECL_assignstatus(
 TRUE
);IF surflinkDECL_status THEN BEGIN
TSTRING_extractchars(str1,len,b^.ldfield.TERMINAL^.str,1,STRING_length(b^.ldfield.TERMINAL^.str));
int:=converttointeger(str1,len);
END
END; END;

Hfinal: BEGIN
 surflinkDECL_assignstatus(
 TRUE
);IF surflinkDECL_status THEN BEGIN
surflinkMAKET_NUMBER(top);surflinkDECL_addnewtop(top)
;
top^.ldfield.NUMBERfield^.int:=int;
END
END; END;

END;

END;{package}
 PROCEDURE surflinkRULES_init;
BEGIN
END;
 procedure surflinkRULES_rule(rnr:INTEGER;a:surflinkDECL_nodeid;
        b,la:surflinkDECL_psnode;mode:surflinkDECL_surfrulemode);
BEGIN
CASE rnr OF
  1:WITH UTTpack DO UTTrule(a,b,mode);
  2:WITH PARAMSpack DO PARAMSrule(a,b,mode);
  3:WITH GRAPHpack DO GRAPHrule(a,b,mode);
  4:WITH CONCGRAPHpack DO CONCGRAPHrule(a,b,mode);
  5:WITH ELEMGRAPHpack DO ELEMGRAPHrule(a,b,mode);
  6:WITH NUMBERpack DO NUMBERrule(a,b,mode);
END
END;
