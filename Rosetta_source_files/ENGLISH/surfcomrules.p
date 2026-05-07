EXPORT(surfcomrules);
pragma C_include('surfcomrules.pf');
pragma C_include('surfcomlangspec.pf');
pragma C_include('surfcommaket.pf');
pragma C_include('surfcomdecl.pf');
pragma C_include('lidomaint.pf');
pragma C_include('ldconvrec.pf');
pragma C_include('ldstrtotype.pf');
pragma C_include('ldcatsets.pf');
pragma C_include('strtokey.pf');
pragma C_include('string.pf');
pragma C_include('strings.pf');
pragma C_include('tstring.pf');
PROGRAM surfcomRULES;
WITH surfcommaket,
surfcomdecl,
surfcomlangspec,lidomaint,ldstrtotype,
ldconvrec,ldcatsets,strtokey,strng,tstring;
VAR top: surfcomDECL_psnode;
PACKAGE UTTpack: [UTTrule];

PROCEDURE UTTrule(a:surfcomDECL_nodeid;b:surfcomDECL_psnode;mode:surfcomDECL_surfrulemode);
BEGIN case a of Hinit:
BEGIN 
END;
1: CASE mode OF

loccond:surfcomDECL_assignstatus(
TRUE
);globcond: BEGIN
 surfcomDECL_assignstatus(
 TRUE
);IF surfcomDECL_status THEN BEGIN
END
END; END;

2: CASE mode OF

loccond:surfcomDECL_assignstatus(
TRUE
);globcond: BEGIN
 surfcomDECL_assignstatus(
 TRUE
);IF surfcomDECL_status THEN BEGIN 
END
END; END;

3: CASE mode OF

loccond:surfcomDECL_assignstatus(
TRUE
);globcond: BEGIN
 surfcomDECL_assignstatus(
 TRUE
);IF surfcomDECL_status THEN BEGIN 
END
END; END;

Hfinal: BEGIN
 surfcomDECL_assignstatus(
 TRUE
);IF surfcomDECL_status THEN BEGIN
surfcomMAKET_UTT(top);surfcomDECL_addnewtop(top)
;
END
END; END;

END;

END;{package}
PACKAGE RULESPECpack: [RULESPECrule];
VAR rulename: TSTRING_string;

PROCEDURE RULESPECrule(a:surfcomDECL_nodeid;b:surfcomDECL_psnode;mode:surfcomDECL_surfrulemode);
BEGIN case a of Hinit:
BEGIN 
END;
1: CASE mode OF

loccond:surfcomDECL_assignstatus(
TRUE
);globcond: BEGIN
 surfcomDECL_assignstatus(
 TRUE
);IF surfcomDECL_status THEN BEGIN
END
END; END;

2: CASE mode OF

loccond:surfcomDECL_assignstatus(
TRUE
);globcond: BEGIN
 surfcomDECL_assignstatus(
 TRUE
);IF surfcomDECL_status THEN BEGIN rulename:=b^.ldfield.TERMINAL^.str
END
END; END;

3: CASE mode OF

loccond:surfcomDECL_assignstatus(
TRUE
);globcond: BEGIN
 surfcomDECL_assignstatus(
 TRUE
);IF surfcomDECL_status THEN BEGIN 
END
END; END;

4: CASE mode OF

loccond:surfcomDECL_assignstatus(
TRUE
);globcond: BEGIN
 surfcomDECL_assignstatus(
 TRUE
);IF surfcomDECL_status THEN BEGIN 
END
END; END;

5: CASE mode OF

loccond:surfcomDECL_assignstatus(
TRUE
);globcond: BEGIN
 surfcomDECL_assignstatus(
 TRUE
);IF surfcomDECL_status THEN BEGIN 
END
END; END;

Hfinal: BEGIN
 surfcomDECL_assignstatus(
 TRUE
);IF surfcomDECL_status THEN BEGIN
surfcomMAKET_RULESPEC(top);surfcomDECL_addnewtop(top)
;
top^.ldfield.RULESPECfield^.rulename:=rulename;
END
END; END;

END;

END;{package}
PACKAGE GRAPHpack: [GRAPHrule];

PROCEDURE GRAPHrule(a:surfcomDECL_nodeid;b:surfcomDECL_psnode;mode:surfcomDECL_surfrulemode);
BEGIN case a of Hinit:
BEGIN
END;
1 :CASE mode OF

loccond:surfcomDECL_assignstatus(
TRUE
);globcond: BEGIN
 surfcomDECL_assignstatus(
 TRUE
);IF surfcomDECL_status THEN BEGIN
END
END; END;

2 :CASE mode OF

loccond:surfcomDECL_assignstatus(
 TRUE
);globcond: BEGIN
 surfcomDECL_assignstatus(
 TRUE
);IF surfcomDECL_status THEN BEGIN
END
END; END;

3 :CASE mode OF

loccond:surfcomDECL_assignstatus(
 TRUE
);globcond: BEGIN
 surfcomDECL_assignstatus(
 TRUE
);IF surfcomDECL_status THEN BEGIN
END
END; END;

4 :CASE mode OF

loccond:surfcomDECL_assignstatus(
 TRUE
);globcond: BEGIN
 surfcomDECL_assignstatus(
 TRUE
);IF surfcomDECL_status THEN BEGIN
END
END; END;

Hfinal: BEGIN
 surfcomDECL_assignstatus(
 TRUE
);IF surfcomDECL_status THEN BEGIN
surfcomMAKET_GRAPH(top);surfcomDECL_addnewtop(top)
;
END
END; END;

END;

END;{package}
PACKAGE NUMBERpack: [NUMBERrule];
VAR str: TSTRING_string;
PROCEDURE NUMBERrule(a:surfcomDECL_nodeid;b:surfcomDECL_psnode;mode:surfcomDECL_surfrulemode);
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

loccond:surfcomDECL_assignstatus(
 EXTRACT(b^.ldfield.TERMINAL^.str)
);globcond: BEGIN
 surfcomDECL_assignstatus(
 TRUE
);IF surfcomDECL_status THEN BEGIN str:=b^.ldfield.TERMINAL^.str
END
END; END;

Hfinal: BEGIN
 surfcomDECL_assignstatus(
 TRUE
);IF surfcomDECL_status THEN BEGIN
surfcomMAKET_NUMBER(top);surfcomDECL_addnewtop(top)
;
top^.ldfield.NUMBERfield^.str:=str
END
END; END;

END;

END;{package}
PACKAGE RULEBODYpack: [RULEBODYrule];

PROCEDURE RULEBODYrule(a:surfcomDECL_nodeid;b:surfcomDECL_psnode;mode:surfcomDECL_surfrulemode);
BEGIN case a of Hinit:
BEGIN 
END;
1: CASE mode OF

loccond:surfcomDECL_assignstatus(
TRUE
);globcond: BEGIN
 surfcomDECL_assignstatus(
 TRUE
);IF surfcomDECL_status THEN BEGIN
END
END; END;

2: CASE mode OF

loccond:surfcomDECL_assignstatus(
TRUE
);globcond: BEGIN
 surfcomDECL_assignstatus(
 TRUE
);IF surfcomDECL_status THEN BEGIN 
END
END; END;

3: CASE mode OF

loccond:surfcomDECL_assignstatus(
TRUE
);globcond: BEGIN
 surfcomDECL_assignstatus(
 TRUE
);IF surfcomDECL_status THEN BEGIN 
END
END; END;

4: CASE mode OF

loccond:surfcomDECL_assignstatus(
TRUE
);globcond: BEGIN
 surfcomDECL_assignstatus(
 TRUE
);IF surfcomDECL_status THEN BEGIN 
END
END; END;

5: CASE mode OF

loccond:surfcomDECL_assignstatus(
TRUE
);globcond: BEGIN
 surfcomDECL_assignstatus(
 TRUE
);IF surfcomDECL_status THEN BEGIN 
END
END; END;

6: CASE mode OF

loccond:surfcomDECL_assignstatus(
TRUE
);globcond: BEGIN
 surfcomDECL_assignstatus(
 TRUE
);IF surfcomDECL_status THEN BEGIN 
END
END; END;

7: CASE mode OF

loccond:surfcomDECL_assignstatus(
TRUE
);globcond: BEGIN
 surfcomDECL_assignstatus(
 TRUE
);IF surfcomDECL_status THEN BEGIN 
END
END; END;

Hfinal: BEGIN
 surfcomDECL_assignstatus(
 TRUE
);IF surfcomDECL_status THEN BEGIN
surfcomMAKET_RULEBODY(top);surfcomDECL_addnewtop(top)
;
END
END; END;

END;

END;{package}
PACKAGE BLOCKpack: [BLOCKrule];
VAR blocknumber: TSTRING_string;

PROCEDURE BLOCKrule(a:surfcomDECL_nodeid;b:surfcomDECL_psnode;mode:surfcomDECL_surfrulemode);
BEGIN case a of Hinit:
BEGIN 
END;
1: CASE mode OF

loccond:surfcomDECL_assignstatus(
TRUE
);globcond: BEGIN
 surfcomDECL_assignstatus(
 TRUE
);IF surfcomDECL_status THEN BEGIN
END
END; END;

2: CASE mode OF

loccond:surfcomDECL_assignstatus(
TRUE
);globcond: BEGIN
 surfcomDECL_assignstatus(
 TRUE
);IF surfcomDECL_status THEN BEGIN blocknumber:=b^.ldfield.NUMBERfield^.str
END
END; END;

3: CASE mode OF

loccond:surfcomDECL_assignstatus(
TRUE
);globcond: BEGIN
 surfcomDECL_assignstatus(
 TRUE
);IF surfcomDECL_status THEN BEGIN 
END
END; END;

4: CASE mode OF

loccond:surfcomDECL_assignstatus(
TRUE
);globcond: BEGIN
 surfcomDECL_assignstatus(
 TRUE
);IF surfcomDECL_status THEN BEGIN 
END
END; END;

5: CASE mode OF

loccond:surfcomDECL_assignstatus(
TRUE
);globcond: BEGIN
 surfcomDECL_assignstatus(
 TRUE
);IF surfcomDECL_status THEN BEGIN 
END
END; END;

Hfinal: BEGIN
 surfcomDECL_assignstatus(
 TRUE
);IF surfcomDECL_status THEN BEGIN
surfcomMAKET_BLOCK(top);surfcomDECL_addnewtop(top)
;
top^.ldfield.BLOCKfield^.number:=blocknumber;
END;
END; END;

END;

END;{package}
PACKAGE INITBLOCKpack: [INITBLOCKrule];

PROCEDURE INITBLOCKrule(a:surfcomDECL_nodeid;b:surfcomDECL_psnode;mode:surfcomDECL_surfrulemode);
BEGIN case a of Hinit:
BEGIN 
END;
1: CASE mode OF

loccond:surfcomDECL_assignstatus(
TRUE
);globcond: BEGIN
 surfcomDECL_assignstatus(
 TRUE
);IF surfcomDECL_status THEN BEGIN
END
END; END;

2: CASE mode OF

loccond:surfcomDECL_assignstatus(
TRUE
);globcond: BEGIN
 surfcomDECL_assignstatus(
 TRUE
);IF surfcomDECL_status THEN BEGIN 
END
END; END;

3: CASE mode OF

loccond:surfcomDECL_assignstatus(
TRUE
);globcond: BEGIN
 surfcomDECL_assignstatus(
 TRUE
);IF surfcomDECL_status THEN BEGIN 
END
END; END;

Hfinal: BEGIN
 surfcomDECL_assignstatus(
 TRUE
);IF surfcomDECL_status THEN BEGIN
surfcomMAKET_INITBLOCK(top);surfcomDECL_addnewtop(top)
;
END;
END; END;

END;

END;{package}
PACKAGE FINALBLOCKpack: [FINALBLOCKrule];

PROCEDURE FINALBLOCKrule(a:surfcomDECL_nodeid;b:surfcomDECL_psnode;mode:surfcomDECL_surfrulemode);
BEGIN case a of Hinit:
BEGIN 
END;
1: CASE mode OF

loccond:surfcomDECL_assignstatus(
TRUE
);globcond: BEGIN
 surfcomDECL_assignstatus(
 TRUE
);IF surfcomDECL_status THEN BEGIN
END
END; END;

2: CASE mode OF

loccond:surfcomDECL_assignstatus(
TRUE
);globcond: BEGIN
 surfcomDECL_assignstatus(
 TRUE
);IF surfcomDECL_status THEN BEGIN 
END
END; END;

3: CASE mode OF

loccond:surfcomDECL_assignstatus(
TRUE
);globcond: BEGIN
 surfcomDECL_assignstatus(
 TRUE
);IF surfcomDECL_status THEN BEGIN 
END
END; END;

4: CASE mode OF

loccond:surfcomDECL_assignstatus(
TRUE
);globcond: BEGIN
 surfcomDECL_assignstatus(
 TRUE
);IF surfcomDECL_status THEN BEGIN 
END
END; END;

5: CASE mode OF

loccond:surfcomDECL_assignstatus(
TRUE
);globcond: BEGIN
 surfcomDECL_assignstatus(
 TRUE
);IF surfcomDECL_status THEN BEGIN 
END
END; END;

Hfinal: BEGIN
 surfcomDECL_assignstatus(
 TRUE
);IF surfcomDECL_status THEN BEGIN
surfcomMAKET_FINALBLOCK(top);surfcomDECL_addnewtop(top)
;
END;
END; END;

END;

END;{package}
PACKAGE PASCALTOHEKJEpack: [PASCALTOHEKJErule];

PROCEDURE PASCALTOHEKJErule(a:surfcomDECL_nodeid;b:surfcomDECL_psnode;mode:surfcomDECL_surfrulemode);
BEGIN case a of Hinit:
BEGIN 
END;
1: CASE mode OF

loccond:surfcomDECL_assignstatus(
TRUE
);globcond: BEGIN
 surfcomDECL_assignstatus(
 TRUE
);IF surfcomDECL_status THEN BEGIN
END
END; END;

2: CASE mode OF

loccond:surfcomDECL_assignstatus(
TRUE
);globcond: BEGIN
 surfcomDECL_assignstatus(
 TRUE
);IF surfcomDECL_status THEN BEGIN 
END
END; END;

3: CASE mode OF

loccond:surfcomDECL_assignstatus(
TRUE
);globcond: BEGIN
 surfcomDECL_assignstatus(
 TRUE
);IF surfcomDECL_status THEN BEGIN 
END
END; END;

4: CASE mode OF

loccond:surfcomDECL_assignstatus(
TRUE
);globcond: BEGIN
 surfcomDECL_assignstatus(
 TRUE
);IF surfcomDECL_status THEN BEGIN 
END
END; END;

5: CASE mode OF

loccond:surfcomDECL_assignstatus(
TRUE
);globcond: BEGIN
 surfcomDECL_assignstatus(
 TRUE
);IF surfcomDECL_status THEN BEGIN 
END
END; END;

6: CASE mode OF

loccond:surfcomDECL_assignstatus(
TRUE
);globcond: BEGIN
 surfcomDECL_assignstatus(
 TRUE
);IF surfcomDECL_status THEN BEGIN 
END
END; END;

7: CASE mode OF

loccond:surfcomDECL_assignstatus(
TRUE
);globcond: BEGIN
 surfcomDECL_assignstatus(
 TRUE
);IF surfcomDECL_status THEN BEGIN 
END
END; END;

8: CASE mode OF

loccond:surfcomDECL_assignstatus(
TRUE
);globcond: BEGIN
 surfcomDECL_assignstatus(
 TRUE
);IF surfcomDECL_status THEN BEGIN 
END
END; END;

Hfinal: BEGIN
 surfcomDECL_assignstatus(
 TRUE
);IF surfcomDECL_status THEN BEGIN
surfcomMAKET_PASCALTOHEKJE(top);surfcomDECL_addnewtop(top)
;
END
END; END;

END;

END;{package}
PACKAGE PASCALTOGLOBALpack: [PASCALTOGLOBALrule];

PROCEDURE PASCALTOGLOBALrule(a:surfcomDECL_nodeid;b:surfcomDECL_psnode;mode:surfcomDECL_surfrulemode);
BEGIN case a of Hinit:
BEGIN 
END;
1: CASE mode OF

loccond:surfcomDECL_assignstatus(
TRUE
);globcond: BEGIN
 surfcomDECL_assignstatus(
 TRUE
);IF surfcomDECL_status THEN BEGIN
END
END; END;

2: CASE mode OF

loccond:surfcomDECL_assignstatus(
TRUE
);globcond: BEGIN
 surfcomDECL_assignstatus(
 TRUE
);IF surfcomDECL_status THEN BEGIN 
END
END; END;

3: CASE mode OF

loccond:surfcomDECL_assignstatus(
TRUE
);globcond: BEGIN
 surfcomDECL_assignstatus(
 TRUE
);IF surfcomDECL_status THEN BEGIN 
END
END; END;

4: CASE mode OF

loccond:surfcomDECL_assignstatus(
TRUE
);globcond: BEGIN
 surfcomDECL_assignstatus(
 TRUE
);IF surfcomDECL_status THEN BEGIN 
END
END; END;

5: CASE mode OF

loccond:surfcomDECL_assignstatus(
TRUE
);globcond: BEGIN
 surfcomDECL_assignstatus(
 TRUE
);IF surfcomDECL_status THEN BEGIN 
END
END; END;

6: CASE mode OF

loccond:surfcomDECL_assignstatus(
TRUE
);globcond: BEGIN
 surfcomDECL_assignstatus(
 TRUE
);IF surfcomDECL_status THEN BEGIN 
END
END; END;

7: CASE mode OF

loccond:surfcomDECL_assignstatus(
TRUE
);globcond: BEGIN
 surfcomDECL_assignstatus(
 TRUE
);IF surfcomDECL_status THEN BEGIN 
END
END; END;

8: CASE mode OF

loccond:surfcomDECL_assignstatus(
TRUE
);globcond: BEGIN
 surfcomDECL_assignstatus(
 TRUE
);IF surfcomDECL_status THEN BEGIN 
END
END; END;

Hfinal: BEGIN
 surfcomDECL_assignstatus(
 TRUE
);IF surfcomDECL_status THEN BEGIN
surfcomMAKET_PASCALTOGLOBAL(top);surfcomDECL_addnewtop(top)
;
END
END; END;

END;

END;{package}
PACKAGE PSTOSTARRIGHTpack: [PSTOSTARRIGHTrule];

PROCEDURE PSTOSTARRIGHTrule(a:surfcomDECL_nodeid;b:surfcomDECL_psnode;mode:surfcomDECL_surfrulemode);
BEGIN case a of Hinit:
BEGIN 
END;
1: CASE mode OF

loccond:surfcomDECL_assignstatus(
TRUE
);globcond: BEGIN
 surfcomDECL_assignstatus(
 TRUE
);IF surfcomDECL_status THEN BEGIN
END
END; END;

2: CASE mode OF

loccond:surfcomDECL_assignstatus(
TRUE
);globcond: BEGIN
 surfcomDECL_assignstatus(
 TRUE
);IF surfcomDECL_status THEN BEGIN 
END
END; END;

3: CASE mode OF

loccond:surfcomDECL_assignstatus(
TRUE
);globcond: BEGIN
 surfcomDECL_assignstatus(
 TRUE
);IF surfcomDECL_status THEN BEGIN 
END
END; END;

4: CASE mode OF

loccond:surfcomDECL_assignstatus(
TRUE
);globcond: BEGIN
 surfcomDECL_assignstatus(
 TRUE
);IF surfcomDECL_status THEN BEGIN 
END
END; END;

5: CASE mode OF

loccond:surfcomDECL_assignstatus(
TRUE
);globcond: BEGIN
 surfcomDECL_assignstatus(
 TRUE
);IF surfcomDECL_status THEN BEGIN 
END
END; END;

6: CASE mode OF

loccond:surfcomDECL_assignstatus(
TRUE
);globcond: BEGIN
 surfcomDECL_assignstatus(
 TRUE
);IF surfcomDECL_status THEN BEGIN 
END
END; END;

7: CASE mode OF

loccond:surfcomDECL_assignstatus(
TRUE
);globcond: BEGIN
 surfcomDECL_assignstatus(
 TRUE
);IF surfcomDECL_status THEN BEGIN 
END
END; END;

8: CASE mode OF

loccond:surfcomDECL_assignstatus(
TRUE
);globcond: BEGIN
 surfcomDECL_assignstatus(
 TRUE
);IF surfcomDECL_status THEN BEGIN 
END
END; END;

9: CASE mode OF

loccond:surfcomDECL_assignstatus(
TRUE
);globcond: BEGIN
 surfcomDECL_assignstatus(
 TRUE
);IF surfcomDECL_status THEN BEGIN 
END
END; END;

10: CASE mode OF

loccond:surfcomDECL_assignstatus(
TRUE
);globcond: BEGIN
 surfcomDECL_assignstatus(
 TRUE
);IF surfcomDECL_status THEN BEGIN 
END
END; END;

11: CASE mode OF

loccond:surfcomDECL_assignstatus(
TRUE
);globcond: BEGIN
 surfcomDECL_assignstatus(
 TRUE
);IF surfcomDECL_status THEN BEGIN 
END
END; END;

Hfinal: BEGIN
 surfcomDECL_assignstatus(
 TRUE
);IF surfcomDECL_status THEN BEGIN
surfcomMAKET_PSTOSTARRIGHT(top);surfcomDECL_addnewtop(top)
;
END
END; END;

END;

END;{package}
PACKAGE PASCALTOENDpack: [PASCALTOENDrule];
VAR str: TSTRING_string;

PROCEDURE PASCALTOENDrule(a:surfcomDECL_nodeid;b:surfcomDECL_psnode;mode:surfcomDECL_surfrulemode);
BEGIN case a of Hinit:
BEGIN 
END;
1: CASE mode OF

loccond:surfcomDECL_assignstatus(
TRUE
);globcond: BEGIN
 surfcomDECL_assignstatus(
 TRUE
);IF surfcomDECL_status THEN BEGIN str:=b^.ldfield.TERMINAL^.str;
END
END; END;

2: CASE mode OF

loccond:surfcomDECL_assignstatus(
TRUE
);globcond: BEGIN
 surfcomDECL_assignstatus(
 TRUE
);IF surfcomDECL_status THEN BEGIN
END
END; END;

3: CASE mode OF

loccond:surfcomDECL_assignstatus(
TRUE
);globcond: BEGIN
 surfcomDECL_assignstatus(
 TRUE
);IF surfcomDECL_status THEN BEGIN
END
END; END;

4: CASE mode OF

loccond:surfcomDECL_assignstatus(
TRUE
);globcond: BEGIN
 surfcomDECL_assignstatus(
 TRUE
);IF surfcomDECL_status THEN BEGIN
END
END; END;

5: CASE mode OF

loccond:surfcomDECL_assignstatus(
TRUE
);globcond: BEGIN
 surfcomDECL_assignstatus(
 TRUE
);IF surfcomDECL_status THEN BEGIN
END
END; END;

7: CASE mode OF

loccond:surfcomDECL_assignstatus(
TRUE
);globcond: BEGIN
 surfcomDECL_assignstatus(
 TRUE
);IF surfcomDECL_status THEN BEGIN
END
END; END;

8: CASE mode OF

loccond:surfcomDECL_assignstatus(
TRUE
);globcond: BEGIN
 surfcomDECL_assignstatus(
 TRUE
);IF surfcomDECL_status THEN BEGIN
END
END; END;

9: CASE mode OF

loccond:surfcomDECL_assignstatus(
TRUE
);globcond: BEGIN
 surfcomDECL_assignstatus(
 TRUE
);IF surfcomDECL_status THEN BEGIN
END
END; END;

Hfinal: BEGIN
 surfcomDECL_assignstatus(
 (TSTRING_compare(str,'END')=0) 
);IF surfcomDECL_status THEN BEGIN
surfcomMAKET_PASCALTOEND(top);surfcomDECL_addnewtop(top)
;
END
END; END;

END;

END;{package}
 PROCEDURE surfcomRULES_init;
BEGIN
END;
 procedure surfcomRULES_rule(rnr:INTEGER;a:surfcomDECL_nodeid;
        b,la:surfcomDECL_psnode;mode:surfcomDECL_surfrulemode);
BEGIN
CASE rnr OF
  1:WITH UTTpack DO UTTrule(a,b,mode);
  2:WITH RULESPECpack DO RULESPECrule(a,b,mode);
  3:WITH GRAPHpack DO GRAPHrule(a,b,mode);
  4:WITH NUMBERpack DO NUMBERrule(a,b,mode);
  5:WITH RULEBODYpack DO RULEBODYrule(a,b,mode);
  6:WITH BLOCKpack DO BLOCKrule(a,b,mode);
  7:WITH INITBLOCKpack DO INITBLOCKrule(a,b,mode);
  8:WITH FINALBLOCKpack DO FINALBLOCKrule(a,b,mode);
  9:WITH PASCALTOHEKJEpack DO PASCALTOHEKJErule(a,b,mode);
 10:WITH PASCALTOGLOBALpack DO PASCALTOGLOBALrule(a,b,mode);
 11:WITH PSTOSTARRIGHTpack DO PSTOSTARRIGHTrule(a,b,mode);
 12:WITH PASCALTOENDpack DO PASCALTOENDrule(a,b,mode);
END
END;
