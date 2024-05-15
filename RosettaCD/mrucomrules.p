EXPORT(mrucomrules);
pragma C_include('mrucomrules.pf');
pragma C_include('mrucomlangspec.pf');
pragma C_include('mrucommaket.pf');
pragma C_include('mrucomdecl.pf');
pragma C_include('lidomaint.pf');
pragma C_include('lsdomaint.pf');
pragma C_include('lsstree.pf');
pragma C_include('maket.pf');
pragma C_include('lsconvrec.pf');
pragma C_include('ldconvrec.pf');
pragma C_include('ldstrtotype.pf');
pragma C_include('ldcatsets.pf');
pragma C_include('strtokey.pf');
pragma C_include('string.pf');
pragma C_include('strings.pf');
pragma C_include('tstring.pf');
PROGRAM mrucomRULES;
WITH mrucommaket,
mrucomdecl,
lsdomaint,lsstree,lsconvrec,maket,
mrucomlangspec,lidomaint,ldstrtotype,
ldconvrec,ldcatsets,strtokey,strng,tstring;
VAR top: mrucomDECL_psnode;
paramtable              :mrucomlangspec_SETOFparams;
syncattable              :mrucomlangspec_setofsyncats;
leftrecords              :mrucomlangspec_SETOFidents;
rightrecords              :mrucomlangspec_SETOFidents;
otherrecords              :mrucomlangspec_SETOFidents;
PACKAGE UTTpack: [UTTrule];
VAR numofrules,numoftransforms,numoffilters,numofsubgrammars: mrucomLANGSPEC_int;
language: TSTRING_string;
filenumber: TSTRING_string;
dtreenames: mrucomLANGSPEC_setofidents;
id: mrucomLANGSPEC_ident;

PROCEDURE UTTrule(a:mrucomDECL_nodeid;b:mrucomDECL_psnode;mode:mrucomDECL_surfrulemode);
BEGIN case a of Hinit:
BEGIN initsetofidents(dtreenames);
numofrules:=0;numoftransforms:=0;numofsubgrammars:=0;numoffilters:=0
END;
1 :CASE mode OF

loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN
IF b^.ldfield.RULESPECfield^.mrule THEN
numofrules:=numofrules+1
ELSE numoftransforms:=numoftransforms+1;
id.str:=b^.ldfield.RULESPECfield^.dtreename;
IF TSTRING_length(id.str)<>0 THEN
appendident(id,dtreenames);
WHILE stillidents(b^.ldfield.RULESPECfield^.setofnames) DO
BEGIN
takeident(id,b^.ldfield.RULESPECfield^.setofnames);
appendident(id,dtreenames);
END;
END
END; END;

3 :CASE mode OF

loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN numoffilters:=numoffilters+1
END
END; END;

4 :CASE mode OF

loccond:mrucomDECL_assignstatus(
 TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN
numofsubgrammars:=numofsubgrammars+1
END
END; END;

5 :CASE mode OF

loccond:mrucomDECL_assignstatus(
 TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN
END
END; END;

6 :CASE mode OF

loccond:mrucomDECL_assignstatus(
 TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN language:=b^.ldfield.TERMINAL^.str
END
END; END;

7 :CASE mode OF

loccond:mrucomDECL_assignstatus(
 TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN filenumber:=b^.ldfield.TERMINAL^.str
END
END; END;

Hfinal: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN
mrucomMAKET_UTT(top);mrucomDECL_addnewtop(top)
;
top^.ldfield.UTTfield^.dtreenames:=dtreenames;
top^.ldfield.UTTfield^.numofrules:=numofrules;
top^.ldfield.UTTfield^.numoftransforms:=numoftransforms;
top^.ldfield.UTTfield^.numofsubgrammars:=numofsubgrammars;
top^.ldfield.UTTfield^.numoffilters:=numoffilters;
top^.ldfield.UTTfield^.language:=language;
top^.ldfield.UTTfield^.filenumber:=filenumber
END
END; END;

END;

END;{package}
PACKAGE SUBGRAMMARSPECpack: [SUBGRAMMARSPECrule];

PROCEDURE SUBGRAMMARSPECrule(a:mrucomDECL_nodeid;b:mrucomDECL_psnode;mode:mrucomDECL_surfrulemode);
BEGIN case a of Hinit:
BEGIN 
END;
1 :CASE mode OF

loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN
END
END; END;

2 :CASE mode OF

loccond:mrucomDECL_assignstatus(
 TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN
END
END; END;

3 :CASE mode OF

loccond:mrucomDECL_assignstatus(
 TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN
END
END; END;

4 :CASE mode OF

loccond:mrucomDECL_assignstatus(
 TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN
END
END; END;

5 :CASE mode OF

loccond:mrucomDECL_assignstatus(
 TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN
END
END; END;

6 :CASE mode OF

loccond:mrucomDECL_assignstatus(
 TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN
END
END; END;

7 :CASE mode OF

loccond:mrucomDECL_assignstatus(
 TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN
END
END; END;

8 :CASE mode OF

loccond:mrucomDECL_assignstatus(
 TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN
END
END; END;

9 :CASE mode OF

loccond:mrucomDECL_assignstatus(
 TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN
END
END; END;

10 :CASE mode OF

loccond:mrucomDECL_assignstatus(
 TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN
END
END; END;

11 :CASE mode OF

loccond:mrucomDECL_assignstatus(
 TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN
END
END; END;

12 :CASE mode OF

loccond:mrucomDECL_assignstatus(
 TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN
END
END; END;

Hfinal: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN
mrucomMAKET_SUBGRAMMARSPEC(top);mrucomDECL_addnewtop(top)
;
END
END; END;

END;

END;{package}
PACKAGE GRAPHpack: [GRAPHrule];
VAR numofconcgraphs: mrucomLANGSPEC_int;

PROCEDURE GRAPHrule(a:mrucomDECL_nodeid;b:mrucomDECL_psnode;mode:mrucomDECL_surfrulemode);
BEGIN case a of Hinit:
BEGIN
numofconcgraphs:=0
END;
1 :CASE mode OF

loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN
END
END; END;

2 :CASE mode OF

loccond:mrucomDECL_assignstatus(
 TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN
numofconcgraphs:=numofconcgraphs+1
END
END; END;

Hfinal: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN
mrucomMAKET_GRAPH(top);mrucomDECL_addnewtop(top)
;
top^.ldfield.GRAPHfield^.numofconcgraphs:=numofconcgraphs
END
END; END;

END;

END;{package}
PACKAGE CONCGRAPHpack: [CONCGRAPHrule];
VAR numofelemgraphs: mrucomLANGSPEC_int;

PROCEDURE CONCGRAPHrule(a:mrucomDECL_nodeid;b:mrucomDECL_psnode;mode:mrucomDECL_surfrulemode);
BEGIN case a of Hinit:
BEGIN
numofelemgraphs:=0
END;
1 :CASE mode OF

loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN
END
END; END;

2 :CASE mode OF

loccond:mrucomDECL_assignstatus(
 TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN
numofelemgraphs:=numofelemgraphs+1
END
END; END;

Hfinal: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN
mrucomMAKET_CONCGRAPH(top);mrucomDECL_addnewtop(top)
;
top^.ldfield.CONCGRAPHfield^.numofelemgraphs:=numofelemgraphs
END
END; END;

END;

END;{package}
PACKAGE ELEMENTARYGRAPHpack: [ELEMENTARYGRAPHrule];
VAR graphtype: mrucomLANGSPEC_graphtypetype;

PROCEDURE ELEMENTARYGRAPHrule(a:mrucomDECL_nodeid;b:mrucomDECL_psnode;mode:mrucomDECL_surfrulemode);
BEGIN case a of Hinit:
BEGIN
graphtype:=atomgraph
END;
1 :CASE mode OF

loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN
END
END; END;

2 :CASE mode OF

loccond:mrucomDECL_assignstatus(
 TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN
graphtype:=enclosedgraph
END
END; END;

3 :CASE mode OF

loccond:mrucomDECL_assignstatus(
 TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN
graphtype:=optgraph
END
END; END;

4 :CASE mode OF

loccond:mrucomDECL_assignstatus(
 TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN
graphtype:=stargraph
END
END; END;

5 :CASE mode OF

loccond:mrucomDECL_assignstatus(
 TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN
graphtype:=atomgraph
END
END; END;

6 :CASE mode OF

loccond:mrucomDECL_assignstatus(
 TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN
graphtype:=atomgraph
END
END; END;

Hfinal: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN
mrucomMAKET_ELEMENTARYGRAPH(top);mrucomDECL_addnewtop(top)
;
top^.ldfield.ELEMENTARYGRAPHfield^.graphtype:=graphtype
END
END; END;

END;

END;{package}
PACKAGE NUMBERpack: [NUMBERrule];
VAR str: TSTRING_string;
PROCEDURE NUMBERrule(a:mrucomDECL_nodeid;b:mrucomDECL_psnode;mode:mrucomDECL_surfrulemode);
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

loccond:mrucomDECL_assignstatus(
 EXTRACT(b^.ldfield.TERMINAL^.str)
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN str:=b^.ldfield.TERMINAL^.str
END
END; END;

Hfinal: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN
mrucomMAKET_NUMBER(top);mrucomDECL_addnewtop(top)
;
top^.ldfield.NUMBERfield^.str:=str
END
END; END;

END;

END;{package}
PACKAGE RULESPECpack: [RULESPECrule];
VAR linksrecords,rechtsrecords,leftSigmaVarList,rightSigmaVarList,otherSigmaVarlist,leftMuVarList,
rightMuVarList,otherMuVarList,leftNodeVarList,rightNodeVarList,otherNodeVarList,
leftTreeVarList,rightTreeVarList,otherTreeVarList,leftRelVarList,rightRelVarList,
otherRelVarList,righttolefttable,anderrecords: mrucomLANGSPEC_SetOfIdents;
setofnames1,setofnames,modellabels: mrucomLANGSPEC_setofidents;
rulenaam,dtreename: TSTRING_string;
compresent,decompresent,Mrule: mrucomLANGSPEC_bool;
leftsyncattable,rightsyncattable: mrucomLANGSPEC_setofsyncats;
id,id1: mrucomLANGSPEC_ident;
PROCEDURE RULESPECrule(a:mrucomDECL_nodeid;b:mrucomDECL_psnode;mode:mrucomDECL_surfrulemode);
 PROCEDURE APPENDSETS(S1: mrucomLANGSPEC_SETOFidents;VAR S2: mrucomLANGSPEC_SETOFidents);
VAR ident1: mrucomLANGSPEC_ident;
BEGIN
WHILE STILLidents(S1) DO
BEGIN
TAKEident(ident1,S1);
APPENDident(ident1,S2)
END
END;
FUNCTION initnowarning:BOOLEAN;
BEGIN
initnowarning:=TRUE;
assignwarning(FALSE);
END;
FUNCTION initfun:BOOLEAN;
BEGIN
initfun:=TRUE;
assigncounter(0);
assignwarning(TRUE);
INITsetofparams(paramtable); {5 global tables!}
INITsetofidents(rightrecords);
INITsetofidents(leftrecords);
INITsetofidents(otherrecords);
initsetofsyncats(syncattable);
END;
FUNCTION syncatstore(VAR table: mrucomLANGSPEC_setofsyncats):BOOLEAN;
BEGIN
syncatstore:=TRUE;
table:=syncattable;
initsetofsyncats(syncattable);
END;
FUNCTION present(ident: mrucomLANGSPEC_ident;S1: mrucomLANGSPEC_setofidents):BOOLEAN;
VAR ident1: mrucomLANGSPEC_ident;
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
PROCEDURE MERGESETS(S1: mrucomLANGSPEC_SETOFidents;VAR S2: mrucomLANGSPEC_SETOFidents);
VAR ident1: mrucomLANGSPEC_ident;
BEGIN
WHILE STILLidents(S1) DO
BEGIN
TAKEident(ident1,S1);
IF not(present(ident1,S2)) THEN APPENDident(ident1,S2) ELSE
writeln('WARNING, variable ',
ident1.str,' used more than once in rule ',rulenaam);
END
END;
PROCEDURE MERGESETS1(S1: mrucomLANGSPEC_SETOFidents;VAR S2: mrucomLANGSPEC_SETOFidents);
VAR ident1: mrucomLANGSPEC_ident;
BEGIN
WHILE STILLidents(S1) DO
BEGIN
TAKEident(ident1,S1);
IF not(present(ident1,S2)) THEN APPENDident(ident1,S2)
END
END;

BEGIN case a of Hinit:
 BEGIN 
compresent:=FALSE;decompresent:=FALSE;
INITSETOFidents(righttolefttable);
INITSETOFidents(setofnames);
INITSETOFidents(linksrecords);
INITSETOFidents(rechtsrecords);
INITSETOFidents(anderrecords);
INITSETOFidents(leftMuVarlist);
INITSETOFidents(rightMuVarlist);
INITSETOFidents(otherMuVarlist);
INITSETOFidents(leftSigmaVarlist);
INITSETOFidents(rightSigmaVarlist);
INITSETOFidents(otherSigmaVarlist);
INITSETOFidents(leftNodeVarlist);
INITSETOFidents(rightNodeVarlist);
INITSETOFidents(otherNodeVarlist);
INITSETOFidents(leftTreeVarlist);
INITSETOFidents(rightTreeVarlist);
INITSETOFidents(otherTreeVarlist);
INITSETOFidents(leftRelVarlist);
INITSETOFidents(rightRelVarlist);
INITSETOFidents(otherRelVarlist);
INITSETOFidents(modellabels);
END;
1 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
initfun
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN Mrule:=TRUE;
END
END; END;

2 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN rulenaam:=b^.ldfield.TERMINAL^.str END
END; END;

3 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
 syncatstore(leftsyncattable)
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN
setofnames1:=b^.ldfield.LEFTMODELSfield^.setofnames;
WHILE stillidents(setofnames1) DO
BEGIN
takeident(id,setofnames1);
id1.str:=rulenaam;
TSTRING_append(id1.str,'_');
TSTRING_append(id1.str,id.str);
appendident(id1,setofnames);
END;
APPENDSETS(b^.ldfield.LEFTMODELSfield^.records,linksRecords);
APPENDSETS(b^.ldfield.LEFTMODELSfield^.MuVarList,leftMuVarList);
APPENDSETS(b^.ldfield.LEFTMODELSfield^.SigmaVarList,leftSigmaVarList);
APPENDSETS(b^.ldfield.LEFTMODELSfield^.TreeVarList,leftTreeVarlist);
APPENDSETS(b^.ldfield.LEFTMODELSfield^.NodeVarList,leftNodeVarList);
APPENDSETS(b^.ldfield.LEFTMODELSfield^.RelVarList,leftrelVarList);
END
END; END;

4 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
 syncatstore(rightsyncattable)
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN dtreename:=b^.ldfield.RIGHTMODELfield^.dtreename;
setofnames1:=b^.ldfield.RIGHTMODELfield^.setofnames;
WHILE stillidents(setofnames1) DO
BEGIN
takeident(id,setofnames1);
id1.str:=rulenaam;
TSTRING_append(id1.str,'_');
TSTRING_append(id1.str,id.str);
appendident(id1,setofnames);
END;
APPENDSETS(b^.ldfield.RIGHTMODELfield^.records,rechtsRecords);
APPENDSETS(b^.ldfield.RIGHTMODELfield^.MuVarList,rightMuVarList);
APPENDSETS(b^.ldfield.RIGHTMODELfield^.SigmaVarList,rightSigmaVarList);
APPENDSETS(b^.ldfield.RIGHTMODELfield^.TreeVarList,rightTreeVarlist);
APPENDSETS(b^.ldfield.RIGHTMODELfield^.NodeVarList,rightNodeVarList);
APPENDSETS(b^.ldfield.RIGHTMODELfield^.RelVarList,rightrelVarList);
END
END; END;

5 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
initnowarning
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN
righttolefttable:=b^.ldfield.MATCHCONDSfield^.righttolefttable;
mergeSETS1(b^.ldfield.MATCHCONDSfield^.records,anderRecords);
APPENDSETS(b^.ldfield.MATCHCONDSfield^.MuVarList,otherMuVarList);
APPENDSETS(b^.ldfield.MATCHCONDSfield^.SigmaVarList,otherSigmaVarList);
APPENDSETS(b^.ldfield.MATCHCONDSfield^.TreeVarList,otherTreeVarlist);
APPENDSETS(b^.ldfield.MATCHCONDSfield^.NodeVarList,otherNodeVarList);
APPENDSETS(b^.ldfield.MATCHCONDSfield^.RelVarList,otherrelVarList);
modellabels:=b^.ldfield.MATCHCONDSfield^.modellabels;
END
END; END;

6 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN END
END; END;

7 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN compresent:=b^.ldfield.SUBRULESfield^.compresent;
decompresent:=b^.ldfield.SUBRULESfield^.decompresent;
setofnames1:=b^.ldfield.SUBRULESfield^.setofnames;
WHILE stillidents(setofnames1) DO
BEGIN
takeident(id,setofnames1);
id1.str:=rulenaam;
TSTRING_append(id1.str,'_');
TSTRING_append(id1.str,id.str);
appendident(id1,setofnames);
END;
MERGESETS(b^.ldfield.SUBRULESfield^.leftrecords,linksrecords);
MERGESETS(b^.ldfield.SUBRULESfield^.leftmuvarlist,leftmuvarlist);
MERGESETS(b^.ldfield.SUBRULESfield^.leftsigmavarlist,leftsigmavarlist);
MERGESETS(b^.ldfield.SUBRULESfield^.lefttreevarlist,lefttreevarlist);
MERGESETS(b^.ldfield.SUBRULESfield^.leftnodevarlist,leftnodevarlist);
MERGESETS(b^.ldfield.SUBRULESfield^.leftrelvarlist,leftrelvarlist);
MERGESETS(b^.ldfield.SUBRULESfield^.rightrecords,rechtsrecords);
MERGESETS(b^.ldfield.SUBRULESfield^.rightmuvarlist,rightmuvarlist);
MERGESETS(b^.ldfield.SUBRULESfield^.rightsigmavarlist,rightsigmavarlist);
MERGESETS(b^.ldfield.SUBRULESfield^.righttreevarlist,righttreevarlist);
MERGESETS(b^.ldfield.SUBRULESfield^.rightnodevarlist,rightnodevarlist);
MERGESETS(b^.ldfield.SUBRULESfield^.rightrelvarlist,rightrelvarlist);
END
END; END;

8 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
initnowarning
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN 
compresent:=TRUE;
MERGESETS(b^.ldfield.COMCAPAIRSfield^.muvarlist,leftmuvarlist);
MERGESETS(b^.ldfield.COMCAPAIRSfield^.muvarlist,rightmuvarlist);
MERGESETS(b^.ldfield.COMCAPAIRSfield^.sigmavarlist,leftsigmavarlist);
MERGESETS(b^.ldfield.COMCAPAIRSfield^.sigmavarlist,rightsigmavarlist);
MERGESETS(b^.ldfield.COMCAPAIRSfield^.treevarlist,lefttreevarlist);
MERGESETS(b^.ldfield.COMCAPAIRSfield^.treevarlist,righttreevarlist);
MERGESETS(b^.ldfield.COMCAPAIRSfield^.nodevarlist,leftnodevarlist);
MERGESETS(b^.ldfield.COMCAPAIRSfield^.nodevarlist,rightnodevarlist);
MERGESETS(b^.ldfield.COMCAPAIRSfield^.relvarlist,leftrelvarlist);
MERGESETS(b^.ldfield.COMCAPAIRSfield^.relvarlist,rightrelvarlist);
END
END; END;

9 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
initnowarning
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN 
decompresent:=TRUE;
mergesets(b^.ldfield.DECOMCAPAIRSfield^.muvarlist,leftmuvarlist);
mergesets(b^.ldfield.DECOMCAPAIRSfield^.muvarlist,rightmuvarlist);
mergesets(b^.ldfield.DECOMCAPAIRSfield^.sigmavarlist,leftsigmavarlist);
mergesets(b^.ldfield.DECOMCAPAIRSfield^.sigmavarlist,rightsigmavarlist);
mergesets(b^.ldfield.DECOMCAPAIRSfield^.treevarlist,lefttreevarlist);
mergesets(b^.ldfield.DECOMCAPAIRSfield^.treevarlist,righttreevarlist);
mergesets(b^.ldfield.DECOMCAPAIRSfield^.nodevarlist,leftnodevarlist);
mergesets(b^.ldfield.DECOMCAPAIRSfield^.nodevarlist,rightnodevarlist);
mergesets(b^.ldfield.DECOMCAPAIRSfield^.relvarlist,leftrelvarlist);
mergesets(b^.ldfield.DECOMCAPAIRSfield^.relvarlist,rightrelvarlist);
END
END; END;

10 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
initfun
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN 
Mrule:=FALSE
END
END; END;

Hfinal: BEGIN
 mrucomDECL_assignstatus(
TRUE
);IF mrucomDECL_status THEN BEGIN mrucomMAKET_RULESPEC(top);mrucomDECL_addnewtop(top)
;
IF TSTRING_length(dtreename)<>0 THEN
top^.ldfield.RULESPECfield^.dtreename:=rulenaam
ELSE top^.ldfield.RULESPECfield^.dtreename:=dtreename;
top^.ldfield.RULESPECfield^.setofnames:=setofnames;
top^.ldfield.RULESPECfield^.mrule:=mrule;
top^.ldfield.RULESPECfield^.compresent:=compresent;
top^.ldfield.RULESPECfield^.decompresent:=decompresent;
top^.ldfield.RULESPECfield^.righttolefttable:=righttolefttable;
top^.ldfield.RULESPECfield^.paramtable:=paramtable;
top^.ldfield.RULESPECfield^.leftsyncattable:=leftsyncattable;
top^.ldfield.RULESPECfield^.rightsyncattable:=rightsyncattable;
top^.ldfield.RULESPECfield^.LeftRecords:=linksRecords;
top^.ldfield.RULESPECfield^.RightRecords:=rechtsRecords;
top^.ldfield.RULESPECfield^.OtherRecords:=anderRecords;
top^.ldfield.RULESPECfield^.leftMuVarlist:=leftMuVarList;
top^.ldfield.RULESPECfield^.leftSigmaVarlist:=leftSigmaVarList;
top^.ldfield.RULESPECfield^.leftNodeVarlist:=leftNodeVarList;
top^.ldfield.RULESPECfield^.leftTreeVarlist:=leftTreeVarList;
top^.ldfield.RULESPECfield^.leftRelVarlist:=leftRelVarList;
top^.ldfield.RULESPECfield^.rightMuVarlist:=rightMuVarList;
top^.ldfield.RULESPECfield^.rightSigmaVarlist:=rightSigmaVarList;
top^.ldfield.RULESPECfield^.rightNodeVarlist:=rightNodeVarList;
top^.ldfield.RULESPECfield^.rightTreeVarlist:=rightTreeVarList;
top^.ldfield.RULESPECfield^.rightRelVarlist:=rightRelVarList;
top^.ldfield.RULESPECfield^.otherMuVarlist:=otherMuVarList;
top^.ldfield.RULESPECfield^.otherSigmaVarlist:=otherSigmaVarList;
top^.ldfield.RULESPECfield^.otherNodeVarlist:=otherNodeVarList;
top^.ldfield.RULESPECfield^.otherTreeVarlist:=otherTreeVarList;
top^.ldfield.RULESPECfield^.otherRelVarlist:=otherRelVarList;
top^.ldfield.RULESPECfield^.modellabels:=modellabels;
END
END; END;

END;

END;{package}
PACKAGE FILTERSPECpack: [FILTERSPECrule];
VAR rechtsrecords,rightSigmaVarList,otherSigmaVarlist,
rightMuVarList,otherMuVarList,rightNodeVarList,otherNodeVarList,
rightTreeVarList,otherTreeVarList,rightRelVarList,
otherRelVarList,righttolefttable,anderrecords: mrucomLANGSPEC_SetOfIdents;
modellabels: mrucomLANGSPEC_setofidents;
rulenaam: TSTRING_string;
PROCEDURE FILTERSPECrule(a:mrucomDECL_nodeid;b:mrucomDECL_psnode;mode:mrucomDECL_surfrulemode);
 PROCEDURE APPENDSETS(S1: mrucomLANGSPEC_SETOFidents;VAR S2: mrucomLANGSPEC_SETOFidents);
VAR ident1: mrucomLANGSPEC_ident;
BEGIN
WHILE STILLidents(S1) DO
BEGIN
TAKEident(ident1,S1);
APPENDident(ident1,S2)
END
END;
FUNCTION initfun:BOOLEAN;
BEGIN
assignwarning(FALSE);
assigncounter(0);
initfun:=TRUE;
INITsetofparams(paramtable); {4 global tables!}
INITsetofidents(rightrecords);
INITsetofidents(leftrecords);
INITsetofidents(otherrecords);
END;
FUNCTION present(ident: mrucomLANGSPEC_ident;S1: mrucomLANGSPEC_setofidents):BOOLEAN;
VAR ident1: mrucomLANGSPEC_ident;
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
PROCEDURE MERGESETS(S1: mrucomLANGSPEC_SETOFidents;VAR S2: mrucomLANGSPEC_SETOFidents);
VAR ident1: mrucomLANGSPEC_ident;
BEGIN
WHILE STILLidents(S1) DO
BEGIN
TAKEident(ident1,S1);
IF not(present(ident1,S2)) THEN APPENDident(ident1,S2) ELSE
writeln('WARNING, variable ',
ident1.str,' used more than once in rule ',rulenaam);
END
END;
PROCEDURE MERGESETS1(S1: mrucomLANGSPEC_SETOFidents;VAR S2: mrucomLANGSPEC_SETOFidents);
VAR ident1: mrucomLANGSPEC_ident;
BEGIN
WHILE STILLidents(S1) DO
BEGIN
TAKEident(ident1,S1);
IF not(present(ident1,S2)) THEN APPENDident(ident1,S2)
END
END;

BEGIN case a of Hinit:
 BEGIN 
INITSETOFidents(righttolefttable);
INITSETOFidents(rechtsrecords);
INITSETOFidents(anderrecords);
INITSETOFidents(rightMuVarlist);
INITSETOFidents(otherMuVarlist);
INITSETOFidents(rightSigmaVarlist);
INITSETOFidents(otherSigmaVarlist);
INITSETOFidents(rightNodeVarlist);
INITSETOFidents(otherNodeVarlist);
INITSETOFidents(rightTreeVarlist);
INITSETOFidents(otherTreeVarlist);
INITSETOFidents(rightRelVarlist);
INITSETOFidents(otherRelVarlist);
INITSETOFidents(modellabels);
END;
1 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
initfun
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN END
END; END;

2 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN rulenaam:=b^.ldfield.TERMINAL^.str END
END; END;

3 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN 
APPENDSETS(b^.ldfield.RIGHTMODELfield^.records,rechtsRecords);
APPENDSETS(b^.ldfield.RIGHTMODELfield^.MuVarList,rightMuVarList);
APPENDSETS(b^.ldfield.RIGHTMODELfield^.SigmaVarList,rightSigmaVarList);
APPENDSETS(b^.ldfield.RIGHTMODELfield^.TreeVarList,rightTreeVarlist);
APPENDSETS(b^.ldfield.RIGHTMODELfield^.NodeVarList,rightNodeVarList);
APPENDSETS(b^.ldfield.RIGHTMODELfield^.RelVarList,rightrelVarList);
END
END; END;

4 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN
righttolefttable:=b^.ldfield.MATCHCONDSfield^.righttolefttable;
mergeSETS1(b^.ldfield.MATCHCONDSfield^.records,anderRecords);
APPENDSETS(b^.ldfield.MATCHCONDSfield^.MuVarList,otherMuVarList);
APPENDSETS(b^.ldfield.MATCHCONDSfield^.SigmaVarList,otherSigmaVarList);
APPENDSETS(b^.ldfield.MATCHCONDSfield^.TreeVarList,otherTreeVarlist);
APPENDSETS(b^.ldfield.MATCHCONDSfield^.NodeVarList,otherNodeVarList);
APPENDSETS(b^.ldfield.MATCHCONDSfield^.RelVarList,otherrelVarList);
modellabels:=b^.ldfield.MATCHCONDSfield^.modellabels;
END
END; END;

5 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN 
mergesets(b^.ldfield.CAPAIRSfield^.muvarlist,rightmuvarlist);
mergesets(b^.ldfield.CAPAIRSfield^.sigmavarlist,rightsigmavarlist);
mergesets(b^.ldfield.CAPAIRSfield^.treevarlist,righttreevarlist);
mergesets(b^.ldfield.CAPAIRSfield^.nodevarlist,rightnodevarlist);
mergesets(b^.ldfield.CAPAIRSfield^.relvarlist,rightrelvarlist);
END
END; END;

6 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN 
MERGESETS(b^.ldfield.SUBFILTERSfield^.rightrecords,rechtsrecords);
MERGESETS(b^.ldfield.SUBFILTERSfield^.rightmuvarlist,rightmuvarlist);
MERGESETS(b^.ldfield.SUBFILTERSfield^.rightsigmavarlist,rightsigmavarlist);
MERGESETS(b^.ldfield.SUBFILTERSfield^.righttreevarlist,righttreevarlist);
MERGESETS(b^.ldfield.SUBFILTERSfield^.rightnodevarlist,rightnodevarlist);
MERGESETS(b^.ldfield.SUBFILTERSfield^.rightrelvarlist,rightrelvarlist);
END
END; END;

7 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN END
END; END;

8 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN END
END; END;

9 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN END
END; END;

Hfinal: BEGIN
 mrucomDECL_assignstatus(
TRUE
);IF mrucomDECL_status THEN BEGIN mrucomMAKET_FILTERSPEC(top);mrucomDECL_addnewtop(top)
; 
top^.ldfield.FILTERSPECfield^.rightrecords:=rechtsrecords;
top^.ldfield.FILTERSPECfield^.righttolefttable:=righttolefttable;
top^.ldfield.FILTERSPECfield^.OtherRecords:=anderRecords;
top^.ldfield.FILTERSPECfield^.rightMuVarlist:=rightMuVarList;
top^.ldfield.FILTERSPECfield^.rightSigmaVarlist:=rightSigmaVarList;
top^.ldfield.FILTERSPECfield^.rightNodeVarlist:=rightNodeVarList;
top^.ldfield.FILTERSPECfield^.rightTreeVarlist:=rightTreeVarList;
top^.ldfield.FILTERSPECfield^.rightRelVarlist:=rightRelVarList;
top^.ldfield.FILTERSPECfield^.otherMuVarlist:=otherMuVarList;
top^.ldfield.FILTERSPECfield^.otherSigmaVarlist:=otherSigmaVarList;
top^.ldfield.FILTERSPECfield^.otherNodeVarlist:=otherNodeVarList;
top^.ldfield.FILTERSPECfield^.otherTreeVarlist:=otherTreeVarList;
top^.ldfield.FILTERSPECfield^.otherRelVarlist:=otherRelVarList;
top^.ldfield.FILTERSPECfield^.modellabels:=modellabels;
END
END; END;

END;

END;{package}
PACKAGE LEFTMODELSpack: [LEFTMODELSrule];
VAR numberofmodels: mrucomLANGSPEC_int;catident: mrucomLANGSPEC_ident;
setofnames: mrucomLANGSPEC_setofidents;
substcounter,substituent: mrucomLANGSPEC_int;
leftcats,MuVarList,SigmaVarList,TreeVarList,NodeVarList,RelVarList: mrucomLANGSPEC_SETOFidents;
PROCEDURE LEFTMODELSrule(a:mrucomDECL_nodeid;b:mrucomDECL_psnode;mode:mrucomDECL_surfrulemode);
 PROCEDURE APPENDSETS(S1: mrucomLANGSPEC_SETOFidents;VAR S2: mrucomLANGSPEC_SETOFidents);
VAR ident1: mrucomLANGSPEC_ident;
BEGIN
WHILE STILLidents(S1) DO
BEGIN
TAKEident(ident1,S1);
APPENDident(ident1,S2)
END
END;

BEGIN case a of Hinit:
 BEGIN initsetofidents(leftcats);
initsetofidents(setofnames);
numberofmodels:=0;
substcounter:=1;
substituent:=-1;
INITsetofidents(MuVarlist);
INITsetofidents(SigmaVarlist);
INITsetofidents(NodeVarlist);
INITsetofidents(TreeVarlist);
INITsetofidents(RelVarlist);
END;
1 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN END
END; END;

2 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN substcounter:=substcounter+1;
appendsets(b^.ldfield.LABELEDTDfield^.setofnames,setofnames);
APPENDSETS(b^.ldfield.LABELEDTDfield^.records,LeftRecords);
APPENDSETS(b^.ldfield.LABELEDTDfield^.MuVarList,MuVarList);
APPENDSETS(b^.ldfield.LABELEDTDfield^.SigmaVarList,SigmaVarList);
APPENDSETS(b^.ldfield.LABELEDTDfield^.TreeVarList,TreeVarlist);
APPENDSETS(b^.ldfield.LABELEDTDfield^.NodeVarList,NodeVarList);
APPENDSETS(b^.ldfield.LABELEDTDfield^.RelVarList,relVarList);
numberofmodels:=numberofmodels+1;
catident.str:=b^.ldfield.LABELEDTDfield^.category;
APPENDident(catident,leftcats);
END
END; END;

3 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN substituent:=substcounter END
END; END;

Hfinal: BEGIN
 mrucomDECL_assignstatus(
TRUE
);IF mrucomDECL_status THEN BEGIN mrucomMAKET_LEFTMODELS(top);mrucomDECL_addnewtop(top)
;
top^.ldfield.LEFTMODELSfield^.setofnames:=setofnames;
top^.ldfield.LEFTMODELSfield^.substituent:=substituent;
top^.ldfield.LEFTMODELSfield^.numberofmodels:=numberofmodels;
top^.ldfield.LEFTMODELSfield^.records:=LeftRecords;
top^.ldfield.LEFTMODELSfield^.MuVarList:=MuVarList;
top^.ldfield.LEFTMODELSfield^.SigmaVarList:=SigmaVarList;
top^.ldfield.LEFTMODELSfield^.TreeVarList:=TreeVarList;
top^.ldfield.LEFTMODELSfield^.NodeVarList:=NodeVarList;
top^.ldfield.LEFTMODELSfield^.RelVarList:=RelVarList;
top^.ldfield.LEFTMODELSfield^.leftcats:=leftcats;
END
END; END;

END;

END;{package}
PACKAGE RIGHTMODELpack: [RIGHTMODELrule];
VAR rightcat: mrucomLANGSPEC_ident;
dtreename: TSTRING_string;
setofnames,MuVarList,SigmaVarList,TreeVarList,NodeVarList,RelVarList: mrucomLANGSPEC_SETOFidents;
PROCEDURE RIGHTMODELrule(a:mrucomDECL_nodeid;b:mrucomDECL_psnode;mode:mrucomDECL_surfrulemode);
 PROCEDURE APPENDSETS(S1: mrucomLANGSPEC_SETOFidents;VAR S2: mrucomLANGSPEC_SETOFidents);
VAR ident1: mrucomLANGSPEC_ident;
BEGIN
WHILE STILLidents(S1) DO
BEGIN
TAKEident(ident1,S1);
APPENDident(ident1,S2)
END
END;

BEGIN case a of Hinit:
 BEGIN TSTRING_constantempty(dtreename);
INITsetofidents(MuVarlist);
INITsetofidents(SigmaVarlist);
INITsetofidents(NodeVarlist);
INITsetofidents(TreeVarlist);
INITsetofidents(RelVarlist);
initsetofidents(setofnames);
END;
1 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN END
END; END;

2 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN 
APPENDSETS(b^.ldfield.LABELEDTDfield^.records,RightRecords);
APPENDSETS(b^.ldfield.LABELEDTDfield^.MuVarList,MuVarList);
APPENDSETS(b^.ldfield.LABELEDTDfield^.SigmaVarList,SigmaVarList);
APPENDSETS(b^.ldfield.LABELEDTDfield^.TreeVarList,TreeVarlist);
APPENDSETS(b^.ldfield.LABELEDTDfield^.NodeVarList,NodeVarList);
APPENDSETS(b^.ldfield.LABELEDTDfield^.RelVarList,relVarList);
rightcat.str:=b^.ldfield.LABELEDTDfield^.category;
setofnames:=b^.ldfield.LABELEDTDfield^.setofnames;
END
END; END;

3 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN dtreename:=b^.ldfield.LABELEDDTREEfield^.str;
APPENDSETS(b^.ldfield.LABELEDDTREEfield^.records,RightRecords);
APPENDSETS(b^.ldfield.LABELEDDTREEfield^.MuVarList,MuVarList);
APPENDSETS(b^.ldfield.LABELEDDTREEfield^.SigmaVarList,SigmaVarList);
APPENDSETS(b^.ldfield.LABELEDDTREEfield^.TreeVarList,TreeVarlist);
APPENDSETS(b^.ldfield.LABELEDDTREEfield^.NodeVarList,NodeVarList);
APPENDSETS(b^.ldfield.LABELEDDTREEfield^.RelVarList,relVarList);
END
END; END;

Hfinal: BEGIN
 mrucomDECL_assignstatus(
TRUE
);IF mrucomDECL_status THEN BEGIN mrucomMAKET_RIGHTMODEL(top);mrucomDECL_addnewtop(top)
;
top^.ldfield.RIGHTMODELfield^.setofnames:=setofnames;
top^.ldfield.RIGHTMODELfield^.dtreename:=dtreename;
top^.ldfield.RIGHTMODELfield^.records:=RightRecords;
top^.ldfield.RIGHTMODELfield^.MuVarList:=MuVarList;
top^.ldfield.RIGHTMODELfield^.SigmaVarList:=SigmaVarList;
top^.ldfield.RIGHTMODELfield^.TreeVarList:=TreeVarList;
top^.ldfield.RIGHTMODELfield^.NodeVarList:=NodeVarList;
top^.ldfield.RIGHTMODELfield^.RelVarList:=RelVarList;
top^.ldfield.RIGHTMODELfield^.rightcat:=rightcat;
END
END; END;

END;

END;{package}
PACKAGE LABELEDTDpack: [LABELEDTDrule];
VAR setofnames,records: mrucomLANGSPEC_SETOFidents;
minnum,maxnum: mrucomLANGSPEC_INT;
rhslabel: mrucomLANGSPEC_ident;
category,treevarname,nodevarname: TSTRING_string;
relationlist: mrucomLANGSPEC_setofidents;
basiccat,containsTi,varcat,noderiv: mrucomLANGSPEC_bool;
recordname: TSTRING_string;
MuVarList,SigmaVarList,TreeVarList,NodeVarList,RelVarList: mrucomLANGSPEC_SETOFidents;

PROCEDURE LABELEDTDrule(a:mrucomDECL_nodeid;b:mrucomDECL_psnode;mode:mrucomDECL_surfrulemode);
BEGIN case a of Hinit:
 BEGIN
minnum:=0;maxnum:=0;
INITSETOFidents(relationlist);
INITsetofidents(records);
INITsetofidents(MuVarlist);
INITsetofidents(SigmaVarlist);
INITsetofidents(NodeVarlist);
INITsetofidents(TreeVarlist);
INITsetofidents(RelVarlist);
INITsetofidents(setofnames);
END;
1 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN END
END; END;

2 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN rhslabel.str:= b^.ldfield.Ilabeltjefield^.str END
END; END;

3 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN rhslabel.str:= b^.ldfield.Mlabeltjefield^.str END
END; END;

4 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN setofnames:=b^.ldfield.BARETDfield^.setofnames;
noderiv:=b^.ldfield.BARETDfield^.noderiv;
varcat:=b^.ldfield.BARETDfield^.varcat;
nodevarname:=b^.ldfield.BARETDfield^.nodevarname;
treevarname:=b^.ldfield.BARETDfield^.treevarname;
category:=b^.ldfield.BARETDfield^.category;
recordname:=b^.ldfield.BARETDfield^.recordname;
relationlist:=b^.ldfield.BARETDfield^.relationlist;
basiccat:=b^.ldfield.BARETDfield^.basiccat;
minnum:=b^.ldfield.BARETDfield^.minnum;
maxnum:=b^.ldfield.BARETDfield^.maxnum; 
records:=b^.ldfield.BARETDfield^.records;
MuVarList:=b^.ldfield.BARETDfield^.MuVarList;
SigmaVarList:=b^.ldfield.BARETDfield^.SigmaVarList;
treeVarList:=b^.ldfield.BARETDfield^.TreeVarList;
NodeVarList:=b^.ldfield.BARETDfield^.NodeVarList;
RelVarList:=b^.ldfield.BARETDfield^.RelVarList;
containsTi:=b^.ldfield.BARETDfield^.containsTi;
END
END; END;

5 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN rhslabel.str:= b^.ldfield.TREEVARfield^.str END
END; END;

Hfinal: BEGIN
 mrucomDECL_assignstatus(
TRUE
);IF mrucomDECL_status THEN BEGIN mrucomMAKET_LABELEDTD(top);mrucomDECL_addnewtop(top)
;
top^.ldfield.LABELEDTDfield^.noderiv:=noderiv;
top^.ldfield.LABELEDTDfield^.setofnames:=setofnames;
top^.ldfield.LABELEDTDfield^.varcat:=varcat;
top^.ldfield.LABELEDTDfield^.relationlist:=relationlist;
top^.ldfield.LABELEDTDfield^.category:=category;
top^.ldfield.LABELEDTDfield^.recordname:=recordname;
top^.ldfield.LABELEDTDfield^.nodevarname:=nodevarname;
top^.ldfield.LABELEDTDfield^.treevarname:=treevarname;
top^.ldfield.LABELEDTDfield^.basiccat:=basiccat;
top^.ldfield.LABELEDTDfield^.minnum:=minnum;
top^.ldfield.LABELEDTDfield^.maxnum:=maxnum;
top^.ldfield.LABELEDTDfield^.records:=records;
top^.ldfield.LABELEDTDfield^.MuVarList:=MuVarList;
top^.ldfield.LABELEDTDfield^.SigmaVarList:=SigMaVarList;
top^.ldfield.LABELEDTDfield^.TreeVarList:=TreeVarList;
top^.ldfield.LABELEDTDfield^.NodeVarList:=NodeVarList;
top^.ldfield.LABELEDTDfield^.RelVarList:=RelVarList;
top^.ldfield.LABELEDTDfield^.rhslabel:=rhslabel;
top^.ldfield.LABELEDTDfield^.containsTi:=containsTi;
END
END; END;

END;

END;{package}
PACKAGE BARETDpack: [BARETDrule];
VAR setofnames,records: mrucomLANGSPEC_SETOFidents;
minnum,maxnum: mrucomLANGSPEC_INT;
relationlist: mrucomLANGSPEC_setofidents;
treevar,ident1: mrucomLANGSPEC_ident;
varcat,containsTi,basiccat,noderiv: mrucomLANGSPEC_bool;
basictree,category,treevarname,nodevarname: TSTRING_string;
MuVarList,SigmaVarList,TreeVarList,NodeVarList,RelVarList: mrucomLANGSPEC_SETOFidents;
PROCEDURE BARETDrule(a:mrucomDECL_nodeid;b:mrucomDECL_psnode;mode:mrucomDECL_surfrulemode);
 PROCEDURE APPENDSETS(S1: mrucomLANGSPEC_SETOFidents;VAR S2: mrucomLANGSPEC_SETOFidents);
VAR ident1: mrucomLANGSPEC_ident;
BEGIN
WHILE STILLidents(S1) DO
BEGIN
TAKEident(ident1,S1);
APPENDident(ident1,S2)
END
END;

BEGIN case a of Hinit:
 BEGIN minnum:=0;maxnum:=0;
basiccat:=FALSE;
noderiv:=TRUE;
TSTRING_constantempty(basictree);
initsetofidents(setofnames);
INITsetofidents(relationlist); 
INITsetofidents(records); 
INITsetofidents(MuVarlist);
INITsetofidents(SigmaVarlist);
INITsetofidents(NodeVarlist);
INITsetofidents(TreeVarlist);
INITsetofidents(RelVarlist);
TSTRING_constantempty(ident1.str);
TSTRING_constantempty(treevarname);
TSTRING_constantempty(nodevarname);
TSTRING_constantempty(category);
containsTi:=false;
varcat:=FALSE;
END;
1 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN treevar.str:=b^.ldfield.TREEVARfield^.str; 
maxnum:=1000;
containsTi:=true;
treevarname:=b^.ldfield.TREEVARfield^.str;
IF (TSTRING_length(treevarname) <> 0) THEN
APPENDident(treevar,TreeVarList);
END
END; END;

2 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN
noderiv:=b^.ldfield.LABELEDNDfield^.noderiv;
APPENDSETS(b^.ldfield.LABELEDNDfield^.records,records);
APPENDSETS(b^.ldfield.LABELEDNDfield^.MuVarList,MuVarList);
APPENDSETS(b^.ldfield.LABELEDNDfield^.SigmaVarList,sigmaVarList);
APPENDSETS(b^.ldfield.LABELEDNDfield^.TreeVarList,TreeVarlist);
APPENDSETS(b^.ldfield.LABELEDNDfield^.NodeVarList,NodeVarList);
APPENDSETS(b^.ldfield.LABELEDNDfield^.RelVarList,relVarList);
appendsets(b^.ldfield.LABELEDNDfield^.setofnames,setofnames);
varcat:=b^.ldfield.LABELEDNDfield^.varcat;
category:=b^.ldfield.LABELEDNDfield^.categoryname;
basiccat:=b^.ldfield.LABELEDNDfield^.basiccat;
ident1.str:=b^.ldfield.LABELEDNDfield^.recordname;
IF TSTRING_length(ident1.str)<>0 THEN
APPENDident(ident1,records) ;
nodevarname:=b^.ldfield.LABELEDNDfield^.nodevarname;
NodeVarList:=b^.ldfield.LABELEDNDfield^.NodeVarList;
IF b^.ldfield.LABELEDNDfield^.basiccat OR b^.ldfield.LABELEDNDfield^.syncatpresent THEN
IF TSTRING_length(ident1.str) <> 0 THEN
BEGIN
TSTRING_appendchars(basictree,ident1.str,'tree',4);
ident1.str:=basictree;
APPENDident(ident1,treevarlist);
ident1.str:=b^.ldfield.LABELEDNDfield^.recordname;
END;
END
END; END;

3 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN
noderiv:=b^.ldfield.BARENDfield^.noderiv;
APPENDSETS(b^.ldfield.BARENDfield^.records,records);
APPENDSETS(b^.ldfield.BARENDfield^.MuVarList,MuVarList);
APPENDSETS(b^.ldfield.BARENDfield^.SigmaVarList,sigmaVarList);
APPENDSETS(b^.ldfield.BARENDfield^.TreeVarList,TreeVarlist);
APPENDSETS(b^.ldfield.BARENDfield^.NodeVarList,NodeVarList);
APPENDSETS(b^.ldfield.BARENDfield^.RelVarList,relVarList);
appendsets(b^.ldfield.BARENDfield^.setofnames,setofnames);
varcat:=b^.ldfield.BARENDfield^.varcat;
nodevarname:=b^.ldfield.BARENDfield^.nodevarname;
category:=b^.ldfield.BARENDfield^.categoryname;
basiccat:=b^.ldfield.BARENDfield^.basiccat;
ident1.str:=b^.ldfield.BARENDfield^.recordname;
IF TSTRING_length(ident1.str)<>0 THEN
APPENDident(ident1,records);
NodeVarList:=b^.ldfield.BARENDfield^.NodeVarList;
IF b^.ldfield.BARENDfield^.basiccat OR b^.ldfield.BARENDfield^.syncatpresent THEN
IF TSTRING_length(ident1.str) <> 0 THEN
BEGIN
TSTRING_appendchars(basictree,ident1.str,'tree',4);
ident1.str:=basictree;
APPENDident(ident1,treevarlist);
ident1.str:=b^.ldfield.BARENDfield^.recordname;
END;
END
END; END;

4 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN
appendsets(b^.ldfield.LABELEDLDfield^.setofnames,setofnames);
APPENDSETS(b^.ldfield.LABELEDLDfield^.records,records);
APPENDSETS(b^.ldfield.LABELEDLDfield^.MuVarList,MuVarList);
APPENDSETS(b^.ldfield.LABELEDLDfield^.SigmaVarList,sigmaVarList);
APPENDSETS(b^.ldfield.LABELEDLDfield^.TreeVarList,TreeVarlist);
APPENDSETS(b^.ldfield.LABELEDLDfield^.NodeVarList,NodeVarList);
APPENDSETS(b^.ldfield.LABELEDLDfield^.RelVarList,relVarList);
relationlist:=b^.ldfield.LABELEDLDfield^.relationlist;
minnum:=b^.ldfield.LABELEDLDfield^.minnum;
maxnum:=b^.ldfield.LABELEDLDfield^.maxnum;
END
END; END;

5 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN
appendsets(b^.ldfield.BARELDfield^.setofnames,setofnames);
APPENDSETS(b^.ldfield.BARELDfield^.records,records);
APPENDSETS(b^.ldfield.BARELDfield^.MuVarList,MuVarList);
APPENDSETS(b^.ldfield.BARELDfield^.SigmaVarList,sigmaVarList);
APPENDSETS(b^.ldfield.BARELDfield^.TreeVarList,TreeVarlist);
APPENDSETS(b^.ldfield.BARELDfield^.NodeVarList,NodeVarList);
APPENDSETS(b^.ldfield.BARELDfield^.RelVarList,relVarList);
relationlist:=b^.ldfield.BARELDfield^.relationlist;
minnum:=b^.ldfield.BARELDfield^.minnum;
maxnum:=b^.ldfield.BARELDfield^.maxnum;
END
END; END;

6 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN
END
END; END;

7 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN
appendsets(b^.ldfield.BARETDfield^.setofnames,setofnames);
APPENDSETS(b^.ldfield.BARETDfield^.records,records);
APPENDSETS(b^.ldfield.BARETDfield^.MuVarList,MuVarList);
APPENDSETS(b^.ldfield.BARETDfield^.SigmaVarList,sigmaVarList);
APPENDSETS(b^.ldfield.BARETDfield^.TreeVarList,TreeVarlist);
APPENDSETS(b^.ldfield.BARETDfield^.NodeVarList,NodeVarList);
APPENDSETS(b^.ldfield.BARETDfield^.RelVarList,relVarList);
END
END; END;

8 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN
END
END; END;

9 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN
treevar.str:=b^.ldfield.TREEVARfield^.str;
APPENDident(treevar,TreeVarList);
END
END; END;

Hfinal: BEGIN
 mrucomDECL_assignstatus(
TRUE
);IF mrucomDECL_status THEN BEGIN mrucomMAKET_BARETD(top);mrucomDECL_addnewtop(top)
;
top^.ldfield.BARETDfield^.noderiv:=noderiv;
top^.ldfield.BARETDfield^.setofnames:=setofnames;
top^.ldfield.BARETDfield^.varcat:=varcat;
top^.ldfield.BARETDfield^.category:=category;
top^.ldfield.BARETDfield^.nodevarname:=nodevarname;
top^.ldfield.BARETDfield^.relationlist:=relationlist;
top^.ldfield.BARETDfield^.minnum:=minnum;
top^.ldfield.BARETDfield^.basiccat:=basiccat;
top^.ldfield.BARETDfield^.maxnum:=maxnum;
top^.ldfield.BARETDfield^.records:=records;
top^.ldfield.BARETDfield^.MuVarList:=MuVarList;
top^.ldfield.BARETDfield^.recordname:=ident1.str;
top^.ldfield.BARETDfield^.SigmaVarList:=SigMaVarList;
top^.ldfield.BARETDfield^.TreeVarList:=TreeVarList;
top^.ldfield.BARETDfield^.NodeVarList:=NodeVarList;
top^.ldfield.BARETDfield^.RelVarList:=RelVarList;
top^.ldfield.BARETDfield^.containsTi:=containsTi;
top^.ldfield.BARETDfield^.treevarname:=treevarname;
END
END; END;

END;

END;{package}
PACKAGE LABELEDNDpack: [LABELEDNDrule];
VAR nodevarname,categoryname,recordname: TSTRING_string;
NodeVarList,relvarlist,muvarlist,sigmavarlist,treevarlist,recordsvar,setofnames: mrucomLANGSPEC_SETOFidents;
noderiv,basiccat,syncatpresent,varcat: mrucomLANGSPEC_bool;

PROCEDURE LABELEDNDrule(a:mrucomDECL_nodeid;b:mrucomDECL_psnode;mode:mrucomDECL_surfrulemode);
BEGIN case a of Hinit:
 BEGIN TSTRING_constantempty(recordname);
INITsetofidents(NodeVarlist);
TSTRING_constantempty(categoryname);
TSTRING_constantempty(nodevarname);
END;
1 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN END
END; END;

2 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN END
END; END;

3 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN categoryname:=b^.ldfield.BARENDfield^.categoryname;
noderiv:=b^.ldfield.BARENDfield^.noderiv;
varcat:=b^.ldfield.BARENDfield^.varcat;
setofnames:=b^.ldfield.BARENDfield^.setofnames;
nodevarname:=b^.ldfield.BARENDfield^.nodevarname;
IF b^.ldfield.BARENDfield^.nodekind = normaal THEN
recordname:=b^.ldfield.BARENDfield^.recordname;
recordsvar:=b^.ldfield.BARENDfield^.records;
muvarlist:=b^.ldfield.BARENDfield^.MuVarList;
sigmavarlist:=b^.ldfield.BARENDfield^.SigmaVarList;
treevarlist:=b^.ldfield.BARENDfield^.TreeVarList;
nodevarlist:=b^.ldfield.BARENDfield^.NodeVarList;
relvarlist:=b^.ldfield.BARENDfield^.RelVarList;
basiccat:=b^.ldfield.BARENDfield^.basiccat;
syncatpresent:=b^.ldfield.BARENDfield^.syncatpresent;
END
END; END;

Hfinal: BEGIN
 mrucomDECL_assignstatus(
TRUE
);IF mrucomDECL_status THEN BEGIN mrucomMAKET_LABELEDND(top);mrucomDECL_addnewtop(top)
;
top^.ldfield.LABELEDNDfield^.noderiv:=noderiv;
top^.ldfield.LABELEDNDfield^.setofnames:=setofnames;
top^.ldfield.LABELEDNDfield^.varcat:=varcat;
top^.ldfield.LABELEDNDfield^.nodevarname:=nodevarname;
top^.ldfield.LABELEDNDfield^.basiccat:=basiccat;
top^.ldfield.LABELEDNDfield^.syncatpresent:=syncatpresent;
top^.ldfield.LABELEDNDfield^.categoryname:=categoryname;
top^.ldfield.LABELEDNDfield^.recordname:=recordname;
top^.ldfield.LABELEDNDfield^.NodeVarList:=NodeVarList;
top^.ldfield.LABELEDNDfield^.treeVarList:=treeVarList;
top^.ldfield.LABELEDNDfield^.relVarList:=relVarList;
top^.ldfield.LABELEDNDfield^.muVarList:=muVarList;
top^.ldfield.LABELEDNDfield^.sigmaVarList:=sigmaVarList;
top^.ldfield.LABELEDNDfield^.records:=recordsvar;
END
END; END;

END;

END;{package}
PACKAGE LABELEDLDpack: [LABELEDLDrule];
VAR records: mrucomLANGSPEC_SETOFidents;
minnum,maxnum: mrucomLANGSPEC_INT;
setofnames,relationlist: mrucomLANGSPEC_setofidents;
rhslabel: mrucomLANGSPEC_ident;
MuVarList,SigmaVarList,TreeVarList,NodeVarList,RelVarList: mrucomLANGSPEC_SETOFidents;

PROCEDURE LABELEDLDrule(a:mrucomDECL_nodeid;b:mrucomDECL_psnode;mode:mrucomDECL_surfrulemode);
BEGIN case a of Hinit:
 BEGIN 
INITsetofidents(relationlist);
minnum:=0;
maxnum:=0;
INITsetofidents(setofnames);
INITsetofidents(records);
INITsetofidents(MuVarlist);
INITsetofidents(SigmaVarlist);
INITsetofidents(NodeVarlist);
INITsetofidents(TreeVarlist);
INITsetofidents(RelVarlist);
END;
1 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN END
END; END;

2 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN rhslabel.str:= b^.ldfield.Ilabeltjefield^.str END
END; END;

3 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN
setofnames:=b^.ldfield.BARELDfield^.setofnames;
relationlist:=b^.ldfield.BARELDfield^.relationlist;
minnum:=b^.ldfield.BARELDfield^.minnum;
maxnum:=b^.ldfield.BARELDfield^.maxnum;
records:=b^.ldfield.BARELDfield^.records;
MuVarList:=b^.ldfield.BARELDfield^.MuVarList;
SigmaVarList:=b^.ldfield.BARELDfield^.SigmaVarList;
TreeVarList:=b^.ldfield.BARELDfield^.TreeVarList;
NodeVarList:=b^.ldfield.BARELDfield^.NodevarList;
RelVarList:=b^.ldfield.BARELDfield^.RelVarList;
END
END; END;

4 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN rhslabel.str:= b^.ldfield.MUVARfield^.str END
END; END;

5 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN rhslabel.str:= b^.ldfield.SIGMAVARfield^.str END
END; END;

Hfinal: BEGIN
 mrucomDECL_assignstatus(
TRUE
);IF mrucomDECL_status THEN BEGIN mrucomMAKET_LABELEDLD(top);mrucomDECL_addnewtop(top)
; 
top^.ldfield.LABELEDLDfield^.setofnames:=setofnames;
top^.ldfield.LABELEDLDfield^.relationlist:=relationlist;
top^.ldfield.LABELEDLDfield^.minnum:=minnum;
top^.ldfield.LABELEDLDfield^.maxnum:=maxnum;
top^.ldfield.LABELEDLDfield^.records:=records;
top^.ldfield.LABELEDLDfield^.MuVarList:=MuVarList;
top^.ldfield.LABELEDLDfield^.SigmaVarList:=SigmaVarlist;
top^.ldfield.LABELEDLDfield^.TreeVarList:=TreeVarList;
top^.ldfield.LABELEDLDfield^.NodeVarList:=NodevarList;
top^.ldfield.LABELEDLDfield^.RelVarList:=RelVarList;
top^.ldfield.LABELEDLDfield^.rhslabel:=rhslabel;
END
END; END;

END;

END;{package}
PACKAGE BARENDpack: [BARENDrule];
TYPE stringtype = STRING(30);
VAR nodekind: mrucomLANGSPEC_nodekindtype;
id1,nodevar: mrucomLANGSPEC_ident;
str1,str2: TSTRING_string;
categoryname: TSTRING_string;
counterstr,recordname: TSTRING_string;
setofnames,relvarlist,treevarlist,muvarlist,sigmavarlist,recordsvar,NodeVarList: mrucomLANGSPEC_SETOFidents;
str:  stringtype;
noderiv,varcat,basiccat,syncatpresent: mrucomLANGSPEC_bool;
syncat: mrucomLANGSPEC_syncat;
keyIvar: mrucomLANGSPEC_bool;
len: INTEGER;
category: LIDOMAINT_syntcat;
PROCEDURE BARENDrule(a:mrucomDECL_nodeid;b:mrucomDECL_psnode;mode:mrucomDECL_surfrulemode);
 FUNCTION checkrecname(str1,str2:TSTRING_string):BOOLEAN;
VAR result:BOOLEAN;
BEGIN
result:=(TSTRING_comparebegin(str2,str1)=0);
checkrecname:=result
END;
PROCEDURE APPENDSETS(S1: mrucomLANGSPEC_SETOFidents;VAR S2: mrucomLANGSPEC_SETOFidents);
VAR ident1: mrucomLANGSPEC_ident;
BEGIN
WHILE STILLidents(S1) DO
BEGIN
TAKEident(ident1,S1);
APPENDident(ident1,S2)
END
END;
PROCEDURE converSTRING(CONST str1:TSTRING_string;VAR str2:stringtype;VAR len:INTEGER);
VAR i:INTEGER;ch:CHAR;
BEGIN
i:=0;
str2:='';
WHILE i<>TSTRING_length(str1) DO
BEGIN
i:=i+1;
TSTRING_extractchar(ch,str1,i);
str2:=str2 || ch;
END;
len:=i;
END;

BEGIN case a of Hinit:
 BEGIN nodekind:=normaal;TSTRING_constantempty(categoryname);
TSTRING_constantempty(nodevar.str);
TSTRING_constantempty(recordname);
INITsetofidents(setofnames);
INITsetofidents(NodeVarlist);
INITsetofidents(relVarlist);
INITsetofidents(treeVarlist);
INITsetofidents(sigmaVarlist);
INITsetofidents(muVarlist);
INITsetofidents(recordsvar);
basiccat:=FALSE;
noderiv:=TRUE;
syncatpresent:=FALSE;
TSTRING_constantempty(counterstr);
varcat:=FALSE;
END;
1 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN END
END; END;

2 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN categoryname:=b^.ldfield.CATNAMEfield^.str;
converSTRING(categoryname,str,len);
LDSTRTOTYPE_cat(str,len,category);
basiccat:=LDCATSETS_blexcat(category) AND
NOT(LDCATSETS_varcatset(category));
END
END; END;

3 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 checkrecname(categoryname,b^.ldfield.CATRECNAMEfield^.str)
);IF mrucomDECL_status THEN BEGIN recordname:=b^.ldfield.CATRECNAMEfield^.str
END
END; END;

4 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN nodekind:=nodevariable;
nodevar.str:=b^.ldfield.NODEVARfield^.str; 
APPENDident(nodevar,NodeVarList);
END
END; END;

5 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN syncatpresent:=TRUE;
str1:=b^.ldfield.KEYNAMEfield^.str1;
keyIvar:=b^.ldfield.KEYNAMEfield^.keyIvar;
str2:=b^.ldfield.KEYNAMEfield^.str2; 
END
END; END;

6 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN IF b^.ldfield.LABELEDDTREEfield^.variable THEN varcat:=TRUE
ELSE
BEGIN
noderiv:=FALSE;
assigncounter(counter+1);
counterstr:=MRUCOMDECL_convinttostring(counter);
TSTRING_constantempty(id1.str);
TSTRING_append(id1.str,counterstr);
appendident(id1,setofnames);
APPENDSETS(b^.ldfield.LABELEDDTREEfield^.records,recordsvar);
APPENDSETS(b^.ldfield.LABELEDDTREEfield^.MuVarList,MuVarList);
APPENDSETS(b^.ldfield.LABELEDDTREEfield^.SigmaVarList,SigmaVarList);
APPENDSETS(b^.ldfield.LABELEDDTREEfield^.TreeVarList,TreeVarlist);
APPENDSETS(b^.ldfield.LABELEDDTREEfield^.NodeVarList,NodeVarList);
APPENDSETS(b^.ldfield.LABELEDDTREEfield^.RelVarList,relVarList);
END;
END
END; END;

Hfinal: BEGIN
 mrucomDECL_assignstatus(
TRUE
);IF mrucomDECL_status THEN BEGIN mrucomMAKET_BAREND(top);mrucomDECL_addnewtop(top)
;
top^.ldfield.BARENDfield^.noderiv:=noderiv;
top^.ldfield.BARENDfield^.counterstr:=counterstr;
top^.ldfield.BARENDfield^.setofnames:=setofnames;
IF syncatpresent THEN
BEGIN
syncat.keyIvar:=keyIvar;
syncat.str1:=str1;
syncat.str2:=str2;
syncat.recordname:=recordname;
IF (TSTRING_length(recordname)=0) AND warning THEN
writeln('syncategorimatically introduced node must contain record variable');
appendsyncat(syncat,syncattable);
END;
top^.ldfield.BARENDfield^.varcat:=varcat;
top^.ldfield.BARENDfield^.nodekind:=nodekind;
top^.ldfield.BARENDfield^.nodevarname:=nodevar.str;
top^.ldfield.BARENDfield^.syncatpresent:=syncatpresent;
top^.ldfield.BARENDfield^.basiccat:=basiccat;
top^.ldfield.BARENDfield^.categoryname:=categoryname;
top^.ldfield.BARENDfield^.recordname:=recordname;
top^.ldfield.BARENDfield^.NodeVarList:=NodeVarList;
top^.ldfield.BARENDfield^.relvarlist:=relvarlist;
top^.ldfield.BARENDfield^.muvarlist:=muvarlist;
top^.ldfield.BARENDfield^.sigmavarlist:=sigmavarlist;
top^.ldfield.BARENDfield^.treevarlist:=treevarlist;
top^.ldfield.BARENDfield^.records:=recordsvar;
END
END; END;

END;

END;{package}
PACKAGE BARELDpack: [BARELDrule];
VAR records,setofnames: mrucomLANGSPEC_setofidents;
minnum,maxnum: mrucomLANGSPEC_int;
id: mrucomLANGSPEC_ident;
relationlist: mrucomLANGSPEC_setofidents;
NumberOfItems: INTEGER;
MuVarList,SigmaVarList,TreeVarList,NodeVarList,RelVarList: mrucomLANGSPEC_SETOFidents;
PROCEDURE BARELDrule(a:mrucomDECL_nodeid;b:mrucomDECL_psnode;mode:mrucomDECL_surfrulemode);
 PROCEDURE APPENDSETS(S1: mrucomLANGSPEC_SETOFidents;VAR S2: mrucomLANGSPEC_SETOFidents);
VAR ident1: mrucomLANGSPEC_ident;
BEGIN
WHILE STILLidents(S1) DO
BEGIN
TAKEident(ident1,S1);
APPENDident(ident1,S2)
END
END;

BEGIN case a of Hinit:
 BEGIN 
INITsetofidents(relationlist);
minnum:=0;maxnum:=0;
INITsetofidents(setofnames);
INITsetofidents(records);
INITsetofidents(MuVarlist);
INITsetofidents(SigmaVarlist);
INITsetofidents(NodeVarlist);
INITsetofidents(TreeVarlist);
INITsetofidents(RelVarlist);
NumberOfItems:=0;
END;
1 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN END
END; END;

2 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN appendsets(b^.ldfield.ITEMfield^.setofnames,setofnames);
APPENDSETS(b^.ldfield.ITEMfield^.relationlist,relationlist);
minnum:=minnum+b^.ldfield.ITEMfield^.minnum;
maxnum:=maxnum+b^.ldfield.ITEMfield^.maxnum;
APPENDSETS(b^.ldfield.ITEMfield^.records,records);
APPENDSETS(b^.ldfield.ITEMfield^.MuVarList,MuVarList);
APPENDSETS(b^.ldfield.ITEMfield^.SigmaVarList,SigmaVarList);
APPENDSETS(b^.ldfield.ITEMfield^.TreeVarList,TreeVarList);
APPENDSETS(b^.ldfield.ITEMfield^.NodeVarList,NodeVarList);
APPENDSETS(b^.ldfield.ITEMfield^.RelVarList,RelVarList);
NumberOfItems:=NumberOfItems+1; 
END
END; END;

3 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN id.str:=b^.ldfield.MUVARfield^.str;
appendident(id,muvarlist);
END
END; END;

Hfinal: BEGIN
 mrucomDECL_assignstatus(
TRUE
);IF mrucomDECL_status THEN BEGIN mrucomMAKET_BARELD(top);mrucomDECL_addnewtop(top)
;
top^.ldfield.BARELDfield^.setofnames:=setofnames;
top^.ldfield.BARELDfield^.relationlist:=relationlist;
top^.ldfield.BARELDfield^.minnum:=minnum;
top^.ldfield.BARELDfield^.maxnum:=maxnum;
top^.ldfield.BARELDfield^.NumberOfItems:=NumberOfItems;
top^.ldfield.BARELDfield^.records:=records;
top^.ldfield.BARELDfield^.MuVarList:=MuVarList;
top^.ldfield.BARELDfield^.SigmaVarList:=SigmaVarList;
top^.ldfield.BARELDfield^.TreeVarList:=TreeVarList;
top^.ldfield.BARELDfield^.NodeVarList:=NodeVarList;
top^.ldfield.BARELDfield^.RelVarList:=RelVarList;
END
END; END;

END;

END;{package}
PACKAGE ITEMpack: [ITEMrule];
VAR setofnames,relationlist,records: mrucomLANGSPEC_SETOFidents;
minnum,maxnum: mrucomLANGSPEC_int;issublist: mrucomLANGSPEC_bool;
MuVarList,SigmaVarList,TreeVarList,NodeVarList,RelVarList: mrucomLANGSPEC_SETOFidents;

PROCEDURE ITEMrule(a:mrucomDECL_nodeid;b:mrucomDECL_psnode;mode:mrucomDECL_surfrulemode);
BEGIN case a of Hinit:
 BEGIN INITsetofidents(records);
INITsetofidents(MuVarlist);
INITsetofidents(SigmaVarlist);
INITsetofidents(NodeVarlist);
INITsetofidents(TreeVarlist);
INITsetofidents(RelVarlist);
INITsetofidents(Relationlist);
minnum:=0;maxnum:=0;
END;
1 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN records:=b^.ldfield.LABELEDITEMfield^.records; 
MuVarlist:=b^.ldfield.LABELEDITEMfield^.MuVarList;
SigmaVarlist:=b^.ldfield.LABELEDITEMfield^.SigmaVarList;
NodeVarlist:=b^.ldfield.LABELEDITEMfield^.NodeVarList;
TreeVarlist:=b^.ldfield.LABELEDITEMfield^.TreeVarList;
RelVarlist:=b^.ldfield.LABELEDITEMfield^.RelVarList;
relationlist:=b^.ldfield.LABELEDITEMfield^.relationlist;
minnum:=b^.ldfield.LABELEDITEMfield^.minnum;
maxnum:=b^.ldfield.LABELEDITEMfield^.maxnum;
issublist:=b^.ldfield.LABELEDITEMfield^.issublist;
setofnames:=b^.ldfield.LABELEDITEMfield^.setofnames;
END
END; END;

2 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN records:=b^.ldfield.BAREITEMfield^.records;
MuVarlist:=b^.ldfield.BAREITEMfield^.MuVarList;
SigmaVarlist:=b^.ldfield.BAREITEMfield^.SigmaVarList;
NodeVarlist:=b^.ldfield.BAREITEMfield^.NodeVarList;
TreeVarlist:=b^.ldfield.BAREITEMfield^.TreeVarList;
RelVarlist:=b^.ldfield.BAREITEMfield^.RelVarList;
relationlist:=b^.ldfield.BAREITEMfield^.relationlist;
minnum:=b^.ldfield.BAREITEMfield^.minnum;
maxnum:=b^.ldfield.BAREITEMfield^.maxnum;
issublist:=b^.ldfield.BAREITEMfield^.issublist;
setofnames:=b^.ldfield.BAREITEMfield^.setofnames;
END
END; END;

Hfinal: BEGIN
 mrucomDECL_assignstatus(
TRUE
);IF mrucomDECL_status THEN BEGIN 
mrucomMAKET_ITEM(top);mrucomDECL_addnewtop(top)
;
top^.ldfield.ITEMfield^.issublist:=issublist;
top^.ldfield.ITEMfield^.setofnames:=setofnames;
top^.ldfield.ITEMfield^.relationlist:=relationlist;
top^.ldfield.ITEMfield^.minnum:=minnum;
top^.ldfield.ITEMfield^.maxnum:=maxnum;
top^.ldfield.ITEMfield^.records:=records;
top^.ldfield.ITEMfield^.MuVarlist:=MuVarList;
top^.ldfield.ITEMfield^.SigmaVarlist:=SigmaVarList;
top^.ldfield.ITEMfield^.NodeVarlist:=NodeVarList;
top^.ldfield.ITEMfield^.TreeVarlist:=TreeVarList;
top^.ldfield.ITEMfield^.RelVarlist:=RelVarList;
END
END; END;

END;

END;{package}
PACKAGE LABELEDITEMpack: [LABELEDITEMrule];
VAR setofnames,relationlist,records: mrucomLANGSPEC_SETOFidents;
minnum,maxnum: mrucomLANGSPEC_int;issublist: mrucomLANGSPEC_bool;
MuVarList,SigmaVarList,TreeVarList,NodeVarList,RelVarList: mrucomLANGSPEC_SETOFidents;

PROCEDURE LABELEDITEMrule(a:mrucomDECL_nodeid;b:mrucomDECL_psnode;mode:mrucomDECL_surfrulemode);
BEGIN case a of Hinit:
 BEGIN INITsetofidents(records);
INITsetofidents(MuVarlist);
INITsetofidents(SigmaVarlist);
INITsetofidents(NodeVarlist);
INITsetofidents(TreeVarlist);
INITsetofidents(RelVarlist);
INITsetofidents(relationlist);
minnum:=0;maxnum:=0
END;
1 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN END
END; END;

2 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN END
END; END;

3 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN records:=b^.ldfield.BAREITEMfield^.records;
setofnames:=b^.ldfield.BAREITEMfield^.setofnames;
MuVarlist:=b^.ldfield.BAREITEMfield^.MuVarList;
SigmaVarlist:=b^.ldfield.BAREITEMfield^.SigmaVarList;
NodeVarlist:=b^.ldfield.BAREITEMfield^.NodeVarList;
TreeVarlist:=b^.ldfield.BAREITEMfield^.TreeVarList;
RelVarlist:=b^.ldfield.BAREITEMfield^.RelVarList;
relationlist:=b^.ldfield.BAREITEMfield^.relationlist;
minnum:=b^.ldfield.BAREITEMfield^.minnum;
maxnum:=b^.ldfield.BAREITEMfield^.maxnum;
issublist:=b^.ldfield.BAREITEMfield^.issublist;
END
END; END;

Hfinal: BEGIN
 mrucomDECL_assignstatus(
TRUE
);IF mrucomDECL_status THEN BEGIN mrucomMAKET_LABELEDITEM(top);mrucomDECL_addnewtop(top)
;
top^.ldfield.LABELEDITEMfield^.issublist:=issublist;
top^.ldfield.LABELEDITEMfield^.setofnames:=setofnames;
top^.ldfield.LABELEDITEMfield^.relationlist:=relationlist;
top^.ldfield.LABELEDITEMfield^.minnum:=minnum;
top^.ldfield.LABELEDITEMfield^.maxnum:=maxnum;
top^.ldfield.LABELEDITEMfield^.records:=records;
top^.ldfield.LABELEDITEMfield^.MuVarlist:=MuVarList;
top^.ldfield.LABELEDITEMfield^.SigmaVarlist:=SigmaVarList;
top^.ldfield.LABELEDITEMfield^.NodeVarlist:=NodeVarList;
top^.ldfield.LABELEDITEMfield^.TreeVarlist:=TreeVarList;
top^.ldfield.LABELEDITEMfield^.RelVarlist:=RelVarList;
END
END; END;

END;

END;{package}
PACKAGE BAREITEMpack: [BAREITEMrule];
VAR setofnames,records: mrucomLANGSPEC_SETOFidents;
minnum,maxnum: mrucomLANGSPEC_int;
relationlist: mrucomLANGSPEC_setofidents;
MuVarList,SigmaVarList,TreeVarList,NodeVarList,RelVarList: mrucomLANGSPEC_SETOFidents;
Varident: mrucomLANGSPEC_ident;
issublist: mrucomLANGSPEC_bool;

PROCEDURE BAREITEMrule(a:mrucomDECL_nodeid;b:mrucomDECL_psnode;mode:mrucomDECL_surfrulemode);
BEGIN case a of Hinit:
 BEGIN INITsetofidents(records);
INITsetofidents(setofnames);
INITsetofidents(MuVarlist);
INITsetofidents(SigmaVarlist);
INITsetofidents(NodeVarlist);
INITsetofidents(TreeVarlist);
INITsetofidents(RelVarlist);
INITsetofidents(relationlist);
minnum:=0;maxnum:=0;issublist:=FALSE;
END;
1 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN Varident.str:=b^.ldfield.MUVARfield^.str;
maxnum:=1000;
APPENDident(Varident,MuVarList);
END
END; END;

2 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN Varident.str:=b^.ldfield.SIGMAVARfield^.str;
maxnum:=1;
APPENDident(Varident,SigmaVarList);
END
END; END;

3 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN records:=b^.ldfield.BARELDfield^.records;
setofnames:=b^.ldfield.BARELDfield^.setofnames;
relationlist:=b^.ldfield.BARELDfield^.relationlist;
minnum:=b^.ldfield.BARELDfield^.minnum;
maxnum:=b^.ldfield.BARELDfield^.maxnum;
MuVarlist:=b^.ldfield.BARELDfield^.MuVarList;
SigmaVarlist:=b^.ldfield.BARELDfield^.SigmaVarList;
NodeVarlist:=b^.ldfield.BARELDfield^.NodeVarList;
TreeVarlist:=b^.ldfield.BARELDfield^.TreeVarList;
RelVarlist:=b^.ldfield.BARELDfield^.RelVarList;
issublist:=TRUE;
END
END; END;

4 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN records:=b^.ldfield.RTDfield^.records;
setofnames:=b^.ldfield.RTDfield^.setofnames;
relationlist:=b^.ldfield.RTDfield^.relationlist;
minnum:=1;
maxnum:=1;
MuVarlist:=b^.ldfield.RTDfield^.MuVarList;
SigmaVarlist:=b^.ldfield.RTDfield^.SigmaVarList;
NodeVarlist:=b^.ldfield.RTDfield^.NodeVarList;
TreeVarlist:=b^.ldfield.RTDfield^.TreeVarList;
RelVarlist:=b^.ldfield.RTDfield^.RelVarList;
END
END; END;

Hfinal: BEGIN
 mrucomDECL_assignstatus(
TRUE
);IF mrucomDECL_status THEN BEGIN mrucomMAKET_BAREITEM(top);mrucomDECL_addnewtop(top)
;
top^.ldfield.BAREITEMfield^.issublist:=issublist;
top^.ldfield.BAREITEMfield^.setofnames:=setofnames;
top^.ldfield.BAREITEMfield^.relationlist:=relationlist;
top^.ldfield.BAREITEMfield^.minnum:=minnum;
top^.ldfield.BAREITEMfield^.maxnum:=maxnum;
top^.ldfield.BAREITEMfield^.records:=records;
top^.ldfield.BAREITEMfield^.MuVarlist:=MuVarList;
top^.ldfield.BAREITEMfield^.SigmaVarlist:=SigmaVarList;
top^.ldfield.BAREITEMfield^.NodeVarlist:=NodeVarList;
top^.ldfield.BAREITEMfield^.TreeVarlist:=TreeVarList;
top^.ldfield.BAREITEMfield^.RelVarlist:=RelVarList;
END
END; END;

END;

END;{package}
PACKAGE LDpack: [LDrule];
VAR records: mrucomLANGSPEC_SETOFidents;
MuVarList,SigmaVarList,TreeVarList,NodeVarList,
RelVarList: mrucomLANGSPEC_SETOFidents;

PROCEDURE LDrule(a:mrucomDECL_nodeid;b:mrucomDECL_psnode;mode:mrucomDECL_surfrulemode);
BEGIN case a of Hinit:
 BEGIN 
INITsetofidents(records);
INITsetofidents(MuVarlist);
INITsetofidents(SigmaVarlist);
INITsetofidents(NodeVarlist);
INITsetofidents(TreeVarlist);
INITsetofidents(RelVarlist);
END;
1 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN 
records:=b^.ldfield.LABELEDLDfield^.records;
MuVarlist:=b^.ldfield.LABELEDLDfield^.MuVarList;
SigmaVarlist:=b^.ldfield.LABELEDLDfield^.SigmaVarList;
NodeVarlist:=b^.ldfield.LABELEDLDfield^.nodeVarList;
TreeVarlist:=b^.ldfield.LABELEDLDfield^.TreeVarList;
RelVarlist:=b^.ldfield.LABELEDLDfield^.RelVarList;
END
END; END;

2 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN
records:=b^.ldfield.BARELDfield^.records;
MuVarlist:=b^.ldfield.BARELDfield^.MuVarList;
SigmaVarlist:=b^.ldfield.BARELDfield^.SigmaVarList;
NodeVarlist:=b^.ldfield.BARELDfield^.nodeVarList;
TreeVarlist:=b^.ldfield.BARELDfield^.TreeVarList;
RelVarlist:=b^.ldfield.BARELDfield^.RelVarList;
END
END; END;

Hfinal: BEGIN
 mrucomDECL_assignstatus(
TRUE
);IF mrucomDECL_status THEN BEGIN mrucomMAKET_LD(top);mrucomDECL_addnewtop(top)
; 
top^.ldfield.LDfield^.records:=records;
top^.ldfield.LDfield^.MuVarlist:=MuVarList;
top^.ldfield.LDfield^.SigmaVarlist:=SigmaVarList;
top^.ldfield.LDfield^.NodeVarlist:=NodeVarList;
top^.ldfield.LDfield^.TreeVarlist:=TreeVarList;
top^.ldfield.LDfield^.RelVarlist:=RelVarList;
END
END; END;

END;

END;{package}
PACKAGE RTDpack: [RTDrule];
VAR setofnames,records: mrucomLANGSPEC_SETOFidents;
MuVarList,SigmaVarList,TreeVarList,NodeVarList,
RelVarList,RelVarList1: mrucomLANGSPEC_SETOFidents;
minnum,maxnum: mrucomLANGSPEC_INT;
noderiv,basiccat,containsTi: mrucomLANGSPEC_bool;
recordname,Treevarname,nodevarname,category: TSTRING_string;
relationlist,treerellist: mrucomLANGSPEC_setofidents;
PROCEDURE RTDrule(a:mrucomDECL_nodeid;b:mrucomDECL_psnode;mode:mrucomDECL_surfrulemode);
 PROCEDURE APPENDSETS(S1: mrucomLANGSPEC_SETOFidents;VAR S2: mrucomLANGSPEC_SETOFidents);
VAR ident1: mrucomLANGSPEC_ident;
BEGIN
WHILE STILLidents(S1) DO
BEGIN
TAKEident(ident1,S1);
APPENDident(ident1,S2)
END
END;

BEGIN case a of Hinit:
 BEGIN INITsetofidents(records);
INITsetofidents(MuVarlist);
INITsetofidents(SigmaVarlist);
INITsetofidents(NodeVarlist);
INITsetofidents(TreeVarlist);
INITsetofidents(RelVarlist1);
INITsetofidents(RelVarlist);
INITsetofidents(relationlist);
INITsetofidents(treerellist);
TSTRING_constantempty(treevarname);
containsTi:=false;
minnum:=0;maxnum:=0;
END;
1 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN END
END; END;

2 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN 
RelVarList1:=b^.ldfield.RELDfield^.RelVarList;
IF TSTRING_length(b^.ldfield.RELDfield^.relationname.str)<>0 THEN
appendident(b^.ldfield.RELDfield^.relationname,relationlist)
END
END; END;

3 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN setofnames:=b^.ldfield.BARETDfield^.setofnames;
noderiv:=b^.ldfield.BARETDfield^.noderiv;
records:=b^.ldfield.BARETDfield^.records; 
MuVarlist:=b^.ldfield.BARETDfield^.MuVarList;
SigmaVarlist:=b^.ldfield.BARETDfield^.SigmaVarList;
NodeVarlist:=b^.ldfield.BARETDfield^.NodeVarList;
TreeVarlist:=b^.ldfield.BARETDfield^.TreeVarList;
RelVarlist:=b^.ldfield.BARETDfield^.RelVarList;
APPENDSETS(RelVarList1,RelVarList);
basiccat:=b^.ldfield.BARETDfield^.basiccat;
recordname:=b^.ldfield.BARETDfield^.recordname;
minnum:=b^.ldfield.BARETDfield^.minnum;
maxnum:=b^.ldfield.BARETDfield^.maxnum;
treerellist:=b^.ldfield.BARETDfield^.relationlist;
containsTi:=b^.ldfield.BARETDfield^.containsTi;
treevarname:=b^.ldfield.BARETDfield^.treevarname;
nodevarname:=b^.ldfield.BARETDfield^.nodevarname;
category:=b^.ldfield.BARETDfield^.category;
END
END; END;

Hfinal: BEGIN
 mrucomDECL_assignstatus(
TRUE
);IF mrucomDECL_status THEN BEGIN mrucomMAKET_RTD(top);mrucomDECL_addnewtop(top)
;
top^.ldfield.RTDfield^.noderiv:=noderiv;
top^.ldfield.RTDfield^.setofnames:=setofnames;
top^.ldfield.RTDfield^.relationlist:=relationlist;
top^.ldfield.RTDfield^.treerellist:=treerellist;
top^.ldfield.RTDfield^.minnum:=minnum;
top^.ldfield.RTDfield^.maxnum:=maxnum;
top^.ldfield.RTDfield^.records:=records;
top^.ldfield.RTDfield^.basiccat:=basiccat;
top^.ldfield.RTDfield^.recordname:=recordname;
top^.ldfield.RTDfield^.MuVarlist:=MuVarList;
top^.ldfield.RTDfield^.SigmaVarlist:=SigmaVarList;
top^.ldfield.RTDfield^.NodeVarlist:=NodeVarList;
top^.ldfield.RTDfield^.TreeVarlist:=TreeVarList;
top^.ldfield.RTDfield^.RelVarlist:=RelVarList;
top^.ldfield.RTDfield^.containsTi:=containsTi;
top^.ldfield.RTDfield^.treevarname:=treevarname;
top^.ldfield.RTDfield^.nodevarname:=nodevarname;
top^.ldfield.RTDfield^.category:=category;
END
END; END;

END;

END;{package}
PACKAGE RELDpack: [RELDrule];
VAR
RelVarIdent: mrucomLANGSPEC_ident;
RelVarList: mrucomLANGSPEC_SETOFidents;
relationname: mrucomLANGSPEC_ident;

PROCEDURE RELDrule(a:mrucomDECL_nodeid;b:mrucomDECL_psnode;mode:mrucomDECL_surfrulemode);
BEGIN case a of Hinit:
 BEGIN
TSTRING_constantempty(relationname.str);
INITsetofidents(RelVarlist);
END;
1 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN relationname.str:= b^.ldfield.RELNAMEfield^.str END
END; END;

2 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN RelVarIdent.str:=b^.ldfield.RELVARfield^.str;
IF TSTRING_length(b^.ldfield.RELVARfield^.str)<>0 THEN
APPENDident(RelVarIdent,RelVarList);
END
END; END;

Hfinal: BEGIN
 mrucomDECL_assignstatus(
TRUE
);IF mrucomDECL_status THEN BEGIN mrucomMAKET_RELD(top);mrucomDECL_addnewtop(top)
;
top^.ldfield.RELDfield^.relationname:=relationname;
top^.ldfield.RELDfield^.RelVarList:=RelVarList;
END
END; END;

END;

END;{package}
PACKAGE MATCHCONDSpack: [MATCHCONDSrule];
VAR righttolefttable,alltable: mrucomLANGSPEC_SETOFidents;
labelname: mrucomLANGSPEC_ident;
MuVarList,SigmaVarList,TreeVarList,NodeVarList,
otherrecordsvar,RelVarList: mrucomLANGSPEC_SETOFidents;
modellabels: mrucomLANGSPEC_setofidents;
vartypes: mrucomLANGSPEC_setofvartypes;
vartypes1: mrucomLANGSPEC_setofvartypes;
vartype: mrucomLANGSPEC_vartype;
PROCEDURE MATCHCONDSrule(a:mrucomDECL_nodeid;b:mrucomDECL_psnode;mode:mrucomDECL_surfrulemode);
 PROCEDURE APPENDSETS(S1: mrucomLANGSPEC_SETOFidents;VAR S2: mrucomLANGSPEC_SETOFidents);
VAR ident1: mrucomLANGSPEC_ident;
BEGIN
WHILE STILLidents(S1) DO
BEGIN
TAKEident(ident1,S1);
APPENDident(ident1,S2)
END
END;
FUNCTION present(ident: mrucomLANGSPEC_ident;S1: mrucomLANGSPEC_setofidents):BOOLEAN;
VAR ident1: mrucomLANGSPEC_ident;
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
PROCEDURE MERGESETS(S1: mrucomLANGSPEC_SETOFidents;VAR S2: mrucomLANGSPEC_SETOFidents);
VAR ident1: mrucomLANGSPEC_ident;
BEGIN
WHILE STILLidents(S1) DO
BEGIN
TAKEident(ident1,S1);
IF not(present(ident1,S2)) THEN APPENDident(ident1,S2)
END
END;
FUNCTION SUBTRACTSETS(S1: mrucomLANGSPEC_SETOFidents;S2: mrucomLANGSPEC_SETOFidents): mrucomLANGSPEC_setofidents;
VAR ident1: mrucomLANGSPEC_ident;
result: mrucomLANGSPEC_setofidents;
BEGIN
initsetofidents(result);
WHILE STILLidents(S1) DO
BEGIN
TAKEident(ident1,S1);
If stillidents(S2) THEN TAKEident(ident1,S2) ELSE APPENDident(ident1,result)
END;
subtractsets:=result
END;
FUNCTION recassign:BOOLEAN;
BEGIN
otherrecordsvar:=otherrecords;
recassign:=TRUE;
END;

BEGIN case a of Hinit:
 BEGIN 
INITSETOFvartypes(vartypes);
INITSETOFIDENTS(righttolefttable);
INITSETOFIDENTS(alltable);
INITsetofidents(MuVarlist);
INITsetofidents(SigmaVarlist);
INITsetofidents(NodeVarlist);
INITsetofidents(TreeVarlist);
INITsetofidents(RelVarlist);
INITsetofidents(modellabels);
END;
1 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN END
END; END;

2 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN labelname.str:=b^.ldfield.LABELTJEfield^.str; 
IF (b^.ldfield.LABELTJEfield^.labelkind=MLABEL) OR
(b^.ldfield.LABELTJEfield^.labelkind=RLABEL) OR
(b^.ldfield.LABELTJEfield^.labelkind=MULABEL) OR
(b^.ldfield.LABELTJEfield^.labelkind=SIGLABEL) OR
(b^.ldfield.LABELTJEfield^.labelkind=TLABEL) OR
(b^.ldfield.LABELTJEfield^.labelkind=LLABEL) THEN
appendident(labelname,modellabels);
END
END; END;

3 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN END
END; END;

4 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN appendident(labelname,righttolefttable) END
END; END;

5 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN
vartypes1:=b^.ldfield.ANDCONDfield^.vartypes;
WHILE stillvartypes(vartypes1) DO
BEGIN
takevartype(vartype,vartypes1);
appendvartype(vartype,vartypes)
END;
MERGESETS(b^.ldfield.ANDCONDfield^.MuVarList,MuVarList);
MERGESETS(b^.ldfield.ANDCONDfield^.SigmaVarList,SigmaVarList);
MERGESETS(b^.ldfield.ANDCONDfield^.TreeVarList,TreeVarList);
MERGESETS(b^.ldfield.ANDCONDfield^.NodeVarList,NodeVarList);
MERGESETS(b^.ldfield.ANDCONDfield^.RelVarList,RelVarList);
END
END; END;

6 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN appendident(labelname,alltable) END
END; END;

7 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
recassign
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN END
END; END;

Hfinal: BEGIN
 mrucomDECL_assignstatus(
TRUE
);IF mrucomDECL_status THEN BEGIN mrucomMAKET_MATCHCONDS(top);mrucomDECL_addnewtop(top)
;
top^.ldfield.MATCHCONDSfield^.vartypes:=vartypes;
top^.ldfield.MATCHCONDSfield^.righttolefttable:=righttolefttable;
top^.ldfield.MATCHCONDSfield^.alltable:=alltable;
top^.ldfield.MATCHCONDSfield^.records:=subtractsets(otherrecords,OtherRecordsvar);
top^.ldfield.MATCHCONDSfield^.MuVarlist:=MuVarList;
top^.ldfield.MATCHCONDSfield^.SigmaVarlist:=SigmaVarList;
top^.ldfield.MATCHCONDSfield^.NodeVarlist:=NodeVarList;
top^.ldfield.MATCHCONDSfield^.TreeVarlist:=TreeVarList;
top^.ldfield.MATCHCONDSfield^.RelVarlist:=RelVarList;
top^.ldfield.MATCHCONDSfield^.modellabels:=modellabels;
END
END; END;

END;

END;{package}
PACKAGE ANDCONDpack: [ANDCONDrule];
VAR vartypes: mrucomLANGSPEC_setofvartypes;
vartype: mrucomLANGSPEC_vartype;
vartypes1: mrucomLANGSPEC_setofvartypes;
MuVarList,SigmaVarList,TreeVarList,NodeVarList,
RelVarList: mrucomLANGSPEC_SETOFidents;
PROCEDURE ANDCONDrule(a:mrucomDECL_nodeid;b:mrucomDECL_psnode;mode:mrucomDECL_surfrulemode);
 PROCEDURE APPENDSETS(S1: mrucomLANGSPEC_SETOFidents;VAR S2: mrucomLANGSPEC_SETOFidents);
VAR ident1: mrucomLANGSPEC_ident;
BEGIN
WHILE STILLidents(S1) DO
BEGIN
TAKEident(ident1,S1);
APPENDident(ident1,S2)
END
END;

BEGIN case a of Hinit:
 BEGIN 
INITsetofvartypes(vartypes);
INITsetofidents(MuVarlist);
INITsetofidents(SigmaVarlist);
INITsetofidents(NodeVarlist);
INITsetofidents(TreeVarlist);
INITsetofidents(RelVarlist);
END;
1 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN END
END; END;

2 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN
vartypes1:=b^.ldfield.ORCONDfield^.vartypes;
WHILE stillvartypes(vartypes1) DO
BEGIN
takevartype(vartype,vartypes1);
appendvartype(vartype,vartypes);
END;
APPENDSETS(b^.ldfield.ORCONDfield^.MuVarList,MuVarList);
APPENDSETS(b^.ldfield.ORCONDfield^.SigmaVarList,SigmaVarList);
APPENDSETS(b^.ldfield.ORCONDfield^.TreeVarList,TreeVarList);
APPENDSETS(b^.ldfield.ORCONDfield^.NodeVarList,NodeVarList);
APPENDSETS(b^.ldfield.ORCONDfield^.RelVarList,RelVarList);
END
END; END;

3 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN 
vartype.varname:=b^.ldfield.TERMINAL^.str;
END
END; END;

4 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN END
END; END;

5 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN 
vartype.cattable:=b^.ldfield.SETVALUENAMEfield^.valuetable;
appendvartype(vartype,vartypes);
END
END; END;

6 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN END
END; END;

7 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN
vartype.varname:=b^.ldfield.TERMINAL^.str;
END
END; END;

8 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN END
END; END;

9 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN END
END; END;

10 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN END
END; END;

Hfinal: BEGIN
 mrucomDECL_assignstatus(
TRUE
);IF mrucomDECL_status THEN BEGIN mrucomMAKET_ANDCOND(top);mrucomDECL_addnewtop(top)
;
top^.ldfield.ANDCONDfield^.vartypes:=vartypes;
top^.ldfield.ANDCONDfield^.MuVarlist:=MuVarList;
top^.ldfield.ANDCONDfield^.SigmaVarlist:=SigmaVarList;
top^.ldfield.ANDCONDfield^.NodeVarlist:=NodeVarList;
top^.ldfield.ANDCONDfield^.TreeVarlist:=TreeVarList;
top^.ldfield.ANDCONDfield^.RelVarlist:=RelVarList;
END
END; END;

END;

END;{package}
PACKAGE ORCONDpack: [ORCONDrule];
VAR vartypes: mrucomLANGSPEC_setofvartypes;
vartype: mrucomLANGSPEC_vartype;
vartypes1: mrucomLANGSPEC_setofvartypes;
MuVarList,SigmaVarList,TreeVarList,NodeVarList,
RelVarList: mrucomLANGSPEC_SETOFidents;
PROCEDURE ORCONDrule(a:mrucomDECL_nodeid;b:mrucomDECL_psnode;mode:mrucomDECL_surfrulemode);
 PROCEDURE APPENDSETS(S1: mrucomLANGSPEC_SETOFidents;VAR S2: mrucomLANGSPEC_SETOFidents);
VAR ident1: mrucomLANGSPEC_ident;
BEGIN
WHILE STILLidents(S1) DO
BEGIN
TAKEident(ident1,S1);
APPENDident(ident1,S2)
END
END;

BEGIN case a of Hinit:
 BEGIN 
INITsetofvartypes(vartypes);
INITsetofidents(MuVarlist);
INITsetofidents(SigmaVarlist);
INITsetofidents(NodeVarlist);
INITsetofidents(TreeVarlist);
INITsetofidents(RelVarlist);
END;
1 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN END
END; END;

2 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN
vartypes1:=b^.ldfield.ELEMENTARYCONDfield^.vartypes;
WHILE stillvartypes(vartypes1) DO
BEGIN
takevartype(vartype,vartypes1);
appendvartype(vartype,vartypes);
END;
APPENDSETS(b^.ldfield.ELEMENTARYCONDfield^.MuVarList,MuVarList);
APPENDSETS(b^.ldfield.ELEMENTARYCONDfield^.SigmaVarList,SigmaVarList);
APPENDSETS(b^.ldfield.ELEMENTARYCONDfield^.TreeVarList,TreeVarList);
APPENDSETS(b^.ldfield.ELEMENTARYCONDfield^.NodeVarList,NodeVarList);
APPENDSETS(b^.ldfield.ELEMENTARYCONDfield^.RelVarList,RelVarList);
END
END; END;

Hfinal: BEGIN
 mrucomDECL_assignstatus(
TRUE
);IF mrucomDECL_status THEN BEGIN mrucomMAKET_ORCOND(top);mrucomDECL_addnewtop(top)
;
top^.ldfield.ORCONDfield^.MuVarlist:=MuVarList;
top^.ldfield.ORCONDfield^.SigmaVarlist:=SigmaVarList;
top^.ldfield.ORCONDfield^.NodeVarlist:=NodeVarList;
top^.ldfield.ORCONDfield^.TreeVarlist:=TreeVarList;
top^.ldfield.ORCONDfield^.RelVarlist:=RelVarList;
top^.ldfield.ORCONDfield^.vartypes:=vartypes;
END
END; END;

END;

END;{package}
PACKAGE ELEMENTARYCONDpack: [ELEMENTARYCONDrule];
VAR
vartypes: mrucomLANGSPEC_setofvartypes;
MuVarList,SigmaVarList,TreeVarList,NodeVarList,
RelVarList: mrucomLANGSPEC_SETOFidents;
notpresent: mrucomLANGSPEC_bool;
PROCEDURE ELEMENTARYCONDrule(a:mrucomDECL_nodeid;b:mrucomDECL_psnode;mode:mrucomDECL_surfrulemode);
 PROCEDURE APPENDSETS(S1: mrucomLANGSPEC_SETOFidents;VAR S2: mrucomLANGSPEC_SETOFidents);
VAR ident1: mrucomLANGSPEC_ident;
BEGIN
WHILE STILLidents(S1) DO
BEGIN
TAKEident(ident1,S1);
APPENDident(ident1,S2)
END
END;

BEGIN case a of Hinit:
 BEGIN notpresent:=false;
INITsetofvartypes(vartypes);
INITsetofidents(MuVarlist);
INITsetofidents(SigmaVarlist);
INITsetofidents(NodeVarlist);
INITsetofidents(TreeVarlist);
INITsetofidents(RelVarlist);
END;
1 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN END
END; END;

2 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN
vartypes:=b^.ldfield.ANDCONDfield^.vartypes;
APPENDSETS(b^.ldfield.ANDCONDfield^.MuVarList,MuVarList);
APPENDSETS(b^.ldfield.ANDCONDfield^.SigmaVarList,SigmaVarList);
APPENDSETS(b^.ldfield.ANDCONDfield^.TreeVarList,TreeVarList);
APPENDSETS(b^.ldfield.ANDCONDfield^.NodeVarList,NodeVarList);
APPENDSETS(b^.ldfield.ANDCONDfield^.RelVarList,RelVarList);
END
END; END;

3 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN 
APPENDSETS(b^.ldfield.MATCHBOOLEANfield^.MuVarList,MuVarList);
APPENDSETS(b^.ldfield.MATCHBOOLEANfield^.SigmaVarList,SigmaVarList);
APPENDSETS(b^.ldfield.MATCHBOOLEANfield^.TreeVarList,TreeVarList);
APPENDSETS(b^.ldfield.MATCHBOOLEANfield^.NodeVarList,NodeVarList);
APPENDSETS(b^.ldfield.MATCHBOOLEANfield^.RelVarList,RelVarList);
END
END; END;

4 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN 
IF TSTRING_length(b^.ldfield.BOOLEANEXPRfield^.vartype.varname)<>0 THEN
APPENDvartype(b^.ldfield.BOOLEANEXPRfield^.vartype,vartypes) 
END
END; END;

5 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN END
END; END;

6 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN END
END; END;

7 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN END
END; END;

8 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN END
END; END;

11: CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN END
END; END;

12: CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN notpresent:=TRUE END
END; END;

13: CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 notpresent
);IF mrucomDECL_status THEN BEGIN END
END; END;

14: CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN END
END; END;

15: CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN END
END; END;

16: CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN END
END; END;

17: CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN END
END; END;

18: CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN END
END; END;

19: CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN END
END; END;

20: CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN END
END; END;

21: CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN END
END; END;

22: CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN END
END; END;

23: CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN END
END; END;

24: CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN END
END; END;

25: CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN 
APPENDSETS(b^.ldfield.ANDCONDfield^.MuVarList,MuVarList);
APPENDSETS(b^.ldfield.ANDCONDfield^.SigmaVarList,SigmaVarList);
APPENDSETS(b^.ldfield.ANDCONDfield^.TreeVarList,TreeVarList);
APPENDSETS(b^.ldfield.ANDCONDfield^.NodeVarList,NodeVarList);
APPENDSETS(b^.ldfield.ANDCONDfield^.RelVarList,RelVarList);
END
END; END;

26: CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN
APPENDSETS(b^.ldfield.ANDCONDfield^.MuVarList,MuVarList);
APPENDSETS(b^.ldfield.ANDCONDfield^.SigmaVarList,SigmaVarList);
APPENDSETS(b^.ldfield.ANDCONDfield^.TreeVarList,TreeVarList);
APPENDSETS(b^.ldfield.ANDCONDfield^.NodeVarList,NodeVarList);
APPENDSETS(b^.ldfield.ANDCONDfield^.RelVarList,RelVarList);
END
END; END;

Hfinal: BEGIN
 mrucomDECL_assignstatus(
TRUE
);IF mrucomDECL_status THEN BEGIN mrucomMAKET_ELEMENTARYCOND(top);mrucomDECL_addnewtop(top)
;
top^.ldfield.ELEMENTARYCONDfield^.vartypes:=vartypes;
top^.ldfield.ELEMENTARYCONDfield^.MuVarlist:=MuVarList;
top^.ldfield.ELEMENTARYCONDfield^.SigmaVarlist:=SigmaVarList;
top^.ldfield.ELEMENTARYCONDfield^.NodeVarlist:=NodeVarList;
top^.ldfield.ELEMENTARYCONDfield^.TreeVarlist:=TreeVarList;
top^.ldfield.ELEMENTARYCONDfield^.RelVarlist:=RelVarList;
END
END; END;

END;

END;{package}
PACKAGE BOOLEANEXPRpack: [BOOLEANEXPRrule];
VAR vartype: mrucomLANGSPEC_vartype;

PROCEDURE BOOLEANEXPRrule(a:mrucomDECL_nodeid;b:mrucomDECL_psnode;mode:mrucomDECL_surfrulemode);
BEGIN case a of Hinit:
 BEGIN TSTRING_constantempty(vartype.varname);
INITsetofidents(vartype.cattable);
END;
1 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN vartype:=b^.ldfield.PASCALEXPRfield^.vartype END
END; END;

2 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN END
END; END;

3 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN END
END; END;

4 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN END
END; END;

5 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN END
END; END;

6 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN END
END; END;

7 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN END
END; END;

8 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN END
END; END;

9 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN END
END; END;

Hfinal: BEGIN
 mrucomDECL_assignstatus(
TRUE
);IF mrucomDECL_status THEN BEGIN mrucomMAKET_BOOLEANEXPR(top);mrucomDECL_addnewtop(top)
;
top^.ldfield.BOOLEANEXPRfield^.vartype:=vartype;
END
END; END;

END;

END;{package}
PACKAGE MATCHBOOLEANpack: [MATCHBOOLEANrule];
VAR
MuVarList,SigmaVarList,TreeVarList,NodeVarList,
RelVarList: mrucomLANGSPEC_SETOFidents;
PROCEDURE MATCHBOOLEANrule(a:mrucomDECL_nodeid;b:mrucomDECL_psnode;mode:mrucomDECL_surfrulemode);
 PROCEDURE APPENDSETS(S1: mrucomLANGSPEC_SETOFidents;VAR S2: mrucomLANGSPEC_SETOFidents);
VAR ident1: mrucomLANGSPEC_ident;
BEGIN
WHILE STILLidents(S1) DO
BEGIN
TAKEident(ident1,S1);
APPENDident(ident1,S2)
END
END;
FUNCTION present(ident: mrucomLANGSPEC_ident;S1: mrucomLANGSPEC_setofidents):BOOLEAN;
VAR ident1: mrucomLANGSPEC_ident;
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
PROCEDURE MERGESETS(S1: mrucomLANGSPEC_SETOFidents;VAR S2: mrucomLANGSPEC_SETOFidents);
VAR ident1: mrucomLANGSPEC_ident;
BEGIN
WHILE STILLidents(S1) DO
BEGIN
TAKEident(ident1,S1);
IF not(present(ident1,S2)) THEN APPENDident(ident1,S2)
END
END;

BEGIN case a of Hinit:
 BEGIN
INITsetofidents(MuVarlist);
INITsetofidents(SigmaVarlist);
INITsetofidents(NodeVarlist);
INITsetofidents(TreeVarlist);
INITsetofidents(RelVarlist);
END;
1 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN END
END; END;

2 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN END
END; END;

3 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN END
END; END;

4 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN END
END; END;

5 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN END
END; END;

6 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN
APPENDSETS(b^.ldfield.LDfield^.records,otherrecords);
APPENDSETS(b^.ldfield.LDfield^.MuVarList,MuVarList);
APPENDSETS(b^.ldfield.LDfield^.SigmaVarList,SigmaVarList);
APPENDSETS(b^.ldfield.LDfield^.TreeVarList,TreeVarList);
APPENDSETS(b^.ldfield.LDfield^.NodeVarList,NodeVarList);
APPENDSETS(b^.ldfield.LDfield^.RelVarList,RelVarList);
END
END; END;

7 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN END
END; END;

8 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN
APPENDSETS(b^.ldfield.ITEMfield^.records,otherrecords);
APPENDSETS(b^.ldfield.ITEMfield^.MuVarList,MuVarList);
APPENDSETS(b^.ldfield.ITEMfield^.SigmaVarList,SigmaVarList);
APPENDSETS(b^.ldfield.ITEMfield^.TreeVarList,TreeVarList);
APPENDSETS(b^.ldfield.ITEMfield^.NodeVarList,NodeVarList);
APPENDSETS(b^.ldfield.ITEMfield^.RelVarList,RelVarList);
END
END; END;

9 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN END
END; END;

10 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN 
APPENDSETS(b^.ldfield.LDfield^.records,otherrecords);
APPENDSETS(b^.ldfield.LDfield^.MuVarList,MuVarList);
APPENDSETS(b^.ldfield.LDfield^.SigmaVarList,SigmaVarList);
APPENDSETS(b^.ldfield.LDfield^.TreeVarList,TreeVarList);
APPENDSETS(b^.ldfield.LDfield^.NodeVarList,NodeVarList);
APPENDSETS(b^.ldfield.LDfield^.RelVarList,RelVarList);
END
END; END;

11 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN 
APPENDSETS(b^.ldfield.LDfield^.records,otherrecords);
APPENDSETS(b^.ldfield.LDfield^.MuVarList,MuVarList);
APPENDSETS(b^.ldfield.LDfield^.SigmaVarList,SigmaVarList);
APPENDSETS(b^.ldfield.LDfield^.TreeVarList,TreeVarList);
APPENDSETS(b^.ldfield.LDfield^.NodeVarList,NodeVarList);
APPENDSETS(b^.ldfield.LDfield^.RelVarList,RelVarList);
END
END; END;

Hfinal: BEGIN
 mrucomDECL_assignstatus(
TRUE
);IF mrucomDECL_status THEN BEGIN mrucomMAKET_MATCHBOOLEAN(top);mrucomDECL_addnewtop(top)
;
top^.ldfield.MATCHBOOLEANfield^.MuVarlist:=MuVarList;
top^.ldfield.MATCHBOOLEANfield^.SigmaVarlist:=SigmaVarList;
top^.ldfield.MATCHBOOLEANfield^.NodeVarlist:=NodeVarList;
top^.ldfield.MATCHBOOLEANfield^.TreeVarlist:=TreeVarList;
top^.ldfield.MATCHBOOLEANfield^.RelVarlist:=RelVarList;
END
END; END;

END;

END;{package}
PACKAGE PARAMETERSspecpack: [PARAMETERSspecrule];
VAR param1: mrucomLANGSPEC_param;
levelpar: mrucomLANGSPEC_bool;

PROCEDURE PARAMETERSspecrule(a:mrucomDECL_nodeid;b:mrucomDECL_psnode;mode:mrucomDECL_surfrulemode);
BEGIN case a of Hinit:
 BEGIN levelpar:=FALSE END;
1 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN END
END; END;

2 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN param1.parname:=b^.ldfield.TERMINAL^.str END
END; END;

3 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN param1.typename:=b^.ldfield.PARTYPEfield^.str;
appendparam(param1,paramtable)
END
END; END;

4 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN levelpar:=TRUE;
TSTRING_constantempty(param1.parname);
TSTRING_constantempty(param1.typename);
TSTRING_APPENDCHARS(param1.parname,
param1.parname,'LEVEL',5);
TSTRING_APPENDCHARS(param1.typename,
param1.typename,'INTEGER',7);
appendparam(param1,paramtable);
END
END; END;

Hfinal: BEGIN
 mrucomDECL_assignstatus(
TRUE
);IF mrucomDECL_status THEN BEGIN mrucomMAKET_PARAMETERSspec(top);mrucomDECL_addnewtop(top)
;
top^.ldfield.PARAMETERSspecfield^.level:=levelpar
END
END; END;

END;

END;{package}
PACKAGE ASSIGNRECORDpack: [ASSIGNRECORDrule];
PROCEDURE ASSIGNRECORDrule(a:mrucomDECL_nodeid;b:mrucomDECL_psnode;mode:mrucomDECL_surfrulemode);
 FUNCTION RECDEFSTRING:TSTRING_string;
VAR str:TSTRING_string;
begin
TSTRING_constant(str,'RECDEF',6);
RECDEFSTRING:=str
end;
FUNCTION checkrecname(str:TSTRING_string):BOOLEAN;
VAR recordtable1: mrucomLANGSPEC_setofidents;
ident1: mrucomLANGSPEC_ident;
found:BOOLEAN;
BEGIN
found:=false;
recordtable1:=leftrecords;
while stillidents(recordtable1) and not(found) do
begin
takeident(ident1,recordtable1);
found:=(TSTRING_compare(ident1.str,str)=0)
end;
recordtable1:=rightrecords;
while stillidents(recordtable1) and not(found) do
begin
takeident(ident1,recordtable1);
found:=(TSTRING_compare(ident1.str,str)=0)
end;
recordtable1:=otherrecords;
while stillidents(recordtable1) and not(found) do
begin
takeident(ident1,recordtable1);
found:=(TSTRING_compare(ident1.str,str)=0)
end;
found:=found OR (TSTRING_compareEnd(str,RECDEFstring)=0);
IF NOT found THEN writeln('Strange Record Name ',str,
' appears in record assignment');
checkrecname:=found
END;

BEGIN case a of Hinit:
 BEGIN END;
1 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN END
END; END;

2 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
checkrecname(b^.ldfield.CATRECNAMEfield^.str)
);IF mrucomDECL_status THEN BEGIN END
END; END;

3 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN END
END; END;

4 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN END
END; END;

5 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
checkrecname(b^.ldfield.CATRECNAMEfield^.str)
);IF mrucomDECL_status THEN BEGIN END
END; END;

6 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
TRUE
);IF mrucomDECL_status THEN BEGIN END
END; END;

7 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
TRUE
);IF mrucomDECL_status THEN BEGIN END
END; END;

8 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
TRUE
);IF mrucomDECL_status THEN BEGIN END
END; END;

9 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
checkrecname(b^.ldfield.CATRECNAMEfield^.str)
);IF mrucomDECL_status THEN BEGIN END
END; END;

10 :CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
TRUE
);IF mrucomDECL_status THEN BEGIN END
END; END;

11 :CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
TRUE
);IF mrucomDECL_status THEN BEGIN END
END; END;

12 :CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
TRUE
);IF mrucomDECL_status THEN BEGIN END
END; END;

13 :CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
TRUE
);IF mrucomDECL_status THEN BEGIN END
END; END;

Hfinal: BEGIN
 mrucomDECL_assignstatus(
TRUE
);IF mrucomDECL_status THEN BEGIN mrucomMAKET_ASSIGNRECORD(top);mrucomDECL_addnewtop(top)
; END
END; END;

END;

END;{package}
PACKAGE CONDRECORDpack: [CONDRECORDrule];
VAR unequal,excond: mrucomLANGSPEC_bool;
exceptset: mrucomLANGSPEC_setofidents;
exceptident: mrucomLANGSPEC_ident;
PROCEDURE CONDRECORDrule(a:mrucomDECL_nodeid;b:mrucomDECL_psnode;mode:mrucomDECL_surfrulemode);
 FUNCTION RECDEFSTRING:TSTRING_string;
VAR str:TSTRING_string;
begin
TSTRING_constant(str,'RECDEF',6);
RECDEFSTRING:=str
end;
FUNCTION checkrecname(str:TSTRING_string):BOOLEAN;
VAR recordtable1: mrucomLANGSPEC_setofidents;
ident1: mrucomLANGSPEC_ident;
found:BOOLEAN;
def:BOOLEAN;
BEGIN
found:=false;
recordtable1:=leftrecords;
while stillidents(recordtable1) and not(found) do
begin
takeident(ident1,recordtable1);
found:=(TSTRING_compare(ident1.str,str)=0)
end;
recordtable1:=rightrecords;
while stillidents(recordtable1) and not(found) do
begin
takeident(ident1,recordtable1);
found:=(TSTRING_compare(ident1.str,str)=0)
end;
recordtable1:=otherrecords;
while stillidents(recordtable1) and not(found) do
begin
takeident(ident1,recordtable1);
found:=(TSTRING_compare(ident1.str,str)=0)
end;
def:=(TSTRING_compareEnd(str,RECDEFstring)=0);
found:=found OR def;
IF NOT found THEN writeln('Strange Record Name ',str,
' appears in record condition');
checkrecname:=found
END;

BEGIN case a of Hinit:
 BEGIN excond:=false;initsetofidents(exceptset) END;
1 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN END
END; END;

2 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
checkrecname(b^.ldfield.CATRECNAMEfield^.str)
);IF mrucomDECL_status THEN BEGIN
END
END; END;

3 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN END
END; END;

4 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN END
END; END;

5 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN END
END; END;

6 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
checkrecname(b^.ldfield.CATRECNAMEfield^.str) 
);IF mrucomDECL_status THEN BEGIN 
IF (TSTRING_compareEnd(b^.ldfield.CATRECNAMEfield^.str,RECDEFstring)=0) THEN
excond:=true;
END
END; END;

7 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN exceptident.str:=b^.ldfield.TERMINAL^.str;
APPENDident(exceptident,exceptset) 
END
END; END;

8 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN END
END; END;

9 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
checkrecname(b^.ldfield.CATRECNAMEfield^.str)
);IF mrucomDECL_status THEN BEGIN excond:=true
END
END; END;

10: CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
TRUE
);IF mrucomDECL_status THEN BEGIN END
END; END;

11: CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
TRUE
);IF mrucomDECL_status THEN BEGIN END
END; END;

12: CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
TRUE
);IF mrucomDECL_status THEN BEGIN END
END; END;

13: CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
TRUE
);IF mrucomDECL_status THEN BEGIN END
END; END;

14: CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
TRUE
);IF mrucomDECL_status THEN BEGIN END
END; END;

15: CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
TRUE
);IF mrucomDECL_status THEN BEGIN END
END; END;

16: CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
TRUE
);IF mrucomDECL_status THEN BEGIN END
END; END;

17: CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
checkrecname(b^.ldfield.CATRECNAMEfield^.str)
);IF mrucomDECL_status THEN BEGIN END
END; END;

18: CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
TRUE
);IF mrucomDECL_status THEN BEGIN unequal:=true END
END; END;

19: CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
TRUE
);IF mrucomDECL_status THEN BEGIN unequal:=false END
END; END;

20: CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
TRUE
);IF mrucomDECL_status THEN BEGIN END
END; END;

21: CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
TRUE
);IF mrucomDECL_status THEN BEGIN excond:=true END
END; END;

Hfinal: BEGIN
 mrucomDECL_assignstatus(
TRUE
);IF mrucomDECL_status THEN BEGIN mrucomMAKET_CONDRECORD(top);mrucomDECL_addnewtop(top)
;
top^.ldfield.CONDRECORDfield^.excond:=excond;
top^.ldfield.CONDRECORDfield^.unequal:=unequal;
top^.ldfield.CONDRECORDfield^.exceptset:=exceptset;
END
END; END;

END;

END;{package}
PACKAGE SUBRULESpack: [SUBRULESrule];
VAR righttolefttable: mrucomLANGSPEC_setofrightlefts;
rightleft: mrucomLANGSPEC_rightleft;
id,id1: mrucomLANGSPEC_ident;
numofsubrules: mrucomLANGSPEC_int;
rightvars: mrucomLANGSPEC_rightvars;
rightvarsset: mrucomLANGSPEC_setofrightvarss;
compresent,decompresent: mrucomLANGSPEC_bool;
LeftRecords,leftmuvarlist,leftsigmavarlist,lefttreevarlist,leftnodevarlist,
setofnames,setofnames1,leftrelvarlist: mrucomLANGSPEC_setofidents;
rightRecords,rightmuvarlist,rightsigmavarlist,righttreevarlist,rightnodevarlist,
rightrelvarlist: mrucomLANGSPEC_setofidents;
compresents,decompresents: mrucomLANGSPEC_setofpresents;
compresent1,decompresent1: mrucomLANGSPEC_present;
PROCEDURE SUBRULESrule(a:mrucomDECL_nodeid;b:mrucomDECL_psnode;mode:mrucomDECL_surfrulemode);
 
PROCEDURE APPENDSETS(S1: mrucomLANGSPEC_SETOFidents;VAR S2: mrucomLANGSPEC_SETOFidents);
VAR ident1: mrucomLANGSPEC_ident;
BEGIN
WHILE STILLidents(S1) DO
BEGIN
TAKEident(ident1,S1);
APPENDident(ident1,S2)
END 
END;
FUNCTION initnowarning:BOOLEAN;
BEGIN
initnowarning:=TRUE;
assignwarning(FALSE);
END;
FUNCTION initwarning:BOOLEAN;
BEGIN
initwarning:=TRUE;
assignwarning(TRUE);
initsetofsyncats(syncattable);
END;
FUNCTION present(ident: mrucomLANGSPEC_ident;S1: mrucomLANGSPEC_setofidents):BOOLEAN;
VAR ident1: mrucomLANGSPEC_ident;
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
PROCEDURE MERGESETS(S1: mrucomLANGSPEC_SETOFidents;VAR S2: mrucomLANGSPEC_SETOFidents);
VAR ident1: mrucomLANGSPEC_ident;
BEGIN
WHILE STILLidents(S1) DO
BEGIN
TAKEident(ident1,S1);
IF not(present(ident1,S2)) THEN APPENDident(ident1,S2)
END
END;

BEGIN case a of Hinit:
 BEGIN INITSETOFrightlefts(righttolefttable);
initsetofpresents(compresents);
initsetofpresents(decompresents);
numofsubrules:=0;
compresent:=FALSE;decompresent:=FALSE;
initsetofrightvarss(rightvarsset);
initsetofidents(setofnames);
initsetofidents(LeftRecords);
initsetofidents(leftmuvarlist);
initsetofidents(leftsigmavarlist);
initsetofidents(lefttreevarlist);
initsetofidents(leftnodevarlist);
initsetofidents(leftrelvarlist);
initsetofidents(rightRecords);
initsetofidents(rightmuvarlist);
initsetofidents(rightsigmavarlist);
initsetofidents(righttreevarlist);
initsetofidents(rightnodevarlist);
initsetofidents(rightrelvarlist);
END;
1 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN END
END; END;

2 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
 TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN 
mergesets(b^.ldfield.LEFTSUBMODELSfield^.setofnames,setofnames);
MERGESETS(b^.ldfield.LEFTSUBMODELSfield^.records,LeftRecords);
MERGESETS(b^.ldfield.LEFTSUBMODELSfield^.MuVarList,leftMuVarList);
MERGESETS(b^.ldfield.LEFTSUBMODELSfield^.SigmaVarList,leftSigmaVarList);
MERGESETS(b^.ldfield.LEFTSUBMODELSfield^.TreeVarList,leftTreeVarlist);
MERGESETS(b^.ldfield.LEFTSUBMODELSfield^.NodeVarList,leftNodeVarList);
MERGESETS(b^.ldfield.LEFTSUBMODELSfield^.RelVarList,leftrelVarList);
END
END; END;

3 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
 TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN
setofnames1:=b^.ldfield.RIGHTSUBMODELSfield^.setofnames;
WHILE stillidents(setofnames1) DO
BEGIN
takeident(id,setofnames1);
appendident(id,setofnames);
END;
MERGESETS(b^.ldfield.RIGHTSUBMODELSfield^.records,rightRecords);
MERGESETS(b^.ldfield.RIGHTSUBMODELSfield^.MuVarList,rightMuVarList);
MERGESETS(b^.ldfield.RIGHTSUBMODELSfield^.SigmaVarList,rightSigmaVarList);
MERGESETS(b^.ldfield.RIGHTSUBMODELSfield^.TreeVarList,rightTreeVarlist);
MERGESETS(b^.ldfield.RIGHTSUBMODELSfield^.NodeVarList,rightNodeVarList);
MERGESETS(b^.ldfield.RIGHTSUBMODELSfield^.RelVarList,rightrelVarList);
rightvars.muvars:=b^.ldfield.RIGHTSUBMODELSfield^.muvarlist;
rightvars.sigmavars:=b^.ldfield.RIGHTSUBMODELSfield^.sigmavarlist;
rightvars.treevars:=b^.ldfield.RIGHTSUBMODELSfield^.treevarlist;
appendrightvars(rightvars,rightvarsset);
END
END; END;

4 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
initnowarning
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN rightleft.table:= b^.ldfield.MATCHCONDSfield^.righttolefttable;
END
END; END;

5 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN compresent:=b^.ldfield.SUBRULESfield^.compresent;
decompresent:=b^.ldfield.SUBRULESfield^.decompresent;
setofnames1:=b^.ldfield.SUBRULESfield^.setofnames;
WHILE stillidents(setofnames1) DO
BEGIN
takeident(id1,setofnames1);
appendident(id1,setofnames);
END;
MERGESETS(b^.ldfield.SUBRULESfield^.rightrecords,rightrecords);
MERGESETS(b^.ldfield.SUBRULESfield^.rightmuvarlist,rightmuvarlist);
MERGESETS(b^.ldfield.SUBRULESfield^.rightsigmavarlist,rightsigmavarlist);
MERGESETS(b^.ldfield.SUBRULESfield^.righttreevarlist,righttreevarlist);
MERGESETS(b^.ldfield.SUBRULESfield^.rightnodevarlist,rightnodevarlist);
MERGESETS(b^.ldfield.SUBRULESfield^.rightrelvarlist,rightrelvarlist);
MERGESETS(b^.ldfield.SUBRULESfield^.leftrecords,leftrecords);
MERGESETS(b^.ldfield.SUBRULESfield^.leftmuvarlist,leftmuvarlist);
MERGESETS(b^.ldfield.SUBRULESfield^.leftsigmavarlist,leftsigmavarlist);
MERGESETS(b^.ldfield.SUBRULESfield^.lefttreevarlist,lefttreevarlist);
MERGESETS(b^.ldfield.SUBRULESfield^.leftnodevarlist,leftnodevarlist);
MERGESETS(b^.ldfield.SUBRULESfield^.leftrelvarlist,leftrelvarlist);
END
END; END;

6 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
initnowarning
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN compresent:=TRUE;
mergesets(b^.ldfield.COMCAPAIRSfield^.muvarlist,leftmuvarlist);
mergesets(b^.ldfield.COMCAPAIRSfield^.muvarlist,rightmuvarlist);
mergesets(b^.ldfield.COMCAPAIRSfield^.sigmavarlist,leftsigmavarlist);
mergesets(b^.ldfield.COMCAPAIRSfield^.sigmavarlist,rightsigmavarlist);
mergesets(b^.ldfield.COMCAPAIRSfield^.treevarlist,lefttreevarlist);
mergesets(b^.ldfield.COMCAPAIRSfield^.treevarlist,righttreevarlist);
mergesets(b^.ldfield.COMCAPAIRSfield^.nodevarlist,leftnodevarlist);
mergesets(b^.ldfield.COMCAPAIRSfield^.nodevarlist,rightnodevarlist);
mergesets(b^.ldfield.COMCAPAIRSfield^.relvarlist,leftrelvarlist);
mergesets(b^.ldfield.COMCAPAIRSfield^.relvarlist,rightrelvarlist);
END
END; END;

7 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
initnowarning
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN decompresent:=TRUE;
mergesets(b^.ldfield.DECOMCAPAIRSfield^.muvarlist,leftmuvarlist);
mergesets(b^.ldfield.DECOMCAPAIRSfield^.muvarlist,rightmuvarlist);
mergesets(b^.ldfield.DECOMCAPAIRSfield^.sigmavarlist,leftsigmavarlist);
mergesets(b^.ldfield.DECOMCAPAIRSfield^.sigmavarlist,rightsigmavarlist);
mergesets(b^.ldfield.DECOMCAPAIRSfield^.treevarlist,lefttreevarlist);
mergesets(b^.ldfield.DECOMCAPAIRSfield^.treevarlist,righttreevarlist);
mergesets(b^.ldfield.DECOMCAPAIRSfield^.nodevarlist,leftnodevarlist);
mergesets(b^.ldfield.DECOMCAPAIRSfield^.nodevarlist,rightnodevarlist);
mergesets(b^.ldfield.DECOMCAPAIRSfield^.relvarlist,leftrelvarlist);
mergesets(b^.ldfield.DECOMCAPAIRSfield^.relvarlist,rightrelvarlist);
END
END; END;

8 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
initwarning
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN 
IF numofsubrules<>0 THEN
BEGIN
compresent1.valeu:=compresent;
decompresent1.valeu:=decompresent;
appendpresent(compresent1,compresents);
appendpresent(decompresent1,decompresents);
appendrightleft(rightleft,righttolefttable);
END;
INITSETofidents(rightleft.table);
numofsubrules:=numofsubrules + 1;
END
END; END;

Hfinal: BEGIN
 mrucomDECL_assignstatus(
TRUE
);IF mrucomDECL_status THEN BEGIN mrucomMAKET_SUBRULES(top);mrucomDECL_addnewtop(top)
;
IF numofsubrules<>0 THEN
BEGIN
compresent1.valeu:=compresent;
decompresent1.valeu:=decompresent;
appendpresent(compresent1,compresents);
appendrightleft(rightleft,righttolefttable);
appendpresent(decompresent1,decompresents);
END;
top^.ldfield.SUBRULESfield^.setofnames:=setofnames;
top^.ldfield.SUBRULESfield^.rightvarsset:=rightvarsset;
top^.ldfield.SUBRULESfield^.compresent:=compresent;
top^.ldfield.SUBRULESfield^.decompresent:=decompresent;
top^.ldfield.SUBRULESfield^.compresents:=compresents;
top^.ldfield.SUBRULESfield^.decompresents:=decompresents;
top^.ldfield.SUBRULESfield^.righttolefttable:=righttolefttable;
top^.ldfield.SUBRULESfield^.numofsubrules:=numofsubrules;
top^.ldfield.SUBRULESfield^.leftrecords:=leftrecords;
top^.ldfield.SUBRULESfield^.leftmuvarlist:=leftmuvarlist;
top^.ldfield.SUBRULESfield^.leftsigmavarlist:=leftsigmavarlist;
top^.ldfield.SUBRULESfield^.lefttreevarlist:=lefttreevarlist;
top^.ldfield.SUBRULESfield^.leftnodevarlist:=leftnodevarlist;
top^.ldfield.SUBRULESfield^.leftrelvarlist:=leftrelvarlist;
top^.ldfield.SUBRULESfield^.rightrecords:=rightrecords;
top^.ldfield.SUBRULESfield^.rightmuvarlist:=rightmuvarlist;
top^.ldfield.SUBRULESfield^.rightsigmavarlist:=rightsigmavarlist;
top^.ldfield.SUBRULESfield^.righttreevarlist:=righttreevarlist;
top^.ldfield.SUBRULESfield^.rightnodevarlist:=rightnodevarlist;
top^.ldfield.SUBRULESfield^.rightrelvarlist:=rightrelvarlist;
END
END; END;

END;

END;{package}
PACKAGE SUBFILTERSpack: [SUBFILTERSrule];
VAR numofsubfilters: mrucomLANGSPEC_int;
rightleft: mrucomLANGSPEC_rightleft;
righttolefttable: mrucomLANGSPEC_setofrightlefts;
rightRecords,rightmuvarlist,rightsigmavarlist,righttreevarlist,rightnodevarlist,
rightrelvarlist: mrucomLANGSPEC_setofidents;
PROCEDURE SUBFILTERSrule(a:mrucomDECL_nodeid;b:mrucomDECL_psnode;mode:mrucomDECL_surfrulemode);
 
PROCEDURE APPENDSETS(S1: mrucomLANGSPEC_SETOFidents;VAR S2: mrucomLANGSPEC_SETOFidents);
VAR ident1: mrucomLANGSPEC_ident;
BEGIN
WHILE STILLidents(S1) DO
BEGIN
TAKEident(ident1,S1);
APPENDident(ident1,S2)
END 
END;
FUNCTION present(ident: mrucomLANGSPEC_ident;S1: mrucomLANGSPEC_setofidents):BOOLEAN;
VAR ident1: mrucomLANGSPEC_ident;
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
PROCEDURE MERGESETS(S1: mrucomLANGSPEC_SETOFidents;VAR S2: mrucomLANGSPEC_SETOFidents);
VAR ident1: mrucomLANGSPEC_ident;
BEGIN
WHILE STILLidents(S1) DO
BEGIN
TAKEident(ident1,S1);
IF not(present(ident1,S2)) THEN APPENDident(ident1,S2)
END
END;

BEGIN case a of Hinit:
 BEGIN numofsubfilters:=0;
INITSETOFrightleftS(righttolefttable);
initsetofidents(rightRecords);
initsetofidents(rightmuvarlist);
initsetofidents(rightsigmavarlist);
initsetofidents(righttreevarlist);
initsetofidents(rightnodevarlist);
initsetofidents(rightrelvarlist);
END;
1 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN 
END
END; END;

2 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN 
MERGESETS(b^.ldfield.RIGHTSUBMODELSfield^.records,rightRecords);
MERGESETS(b^.ldfield.RIGHTSUBMODELSfield^.MuVarList,rightMuVarList);
MERGESETS(b^.ldfield.RIGHTSUBMODELSfield^.SigmaVarList,rightSigmaVarList);
MERGESETS(b^.ldfield.RIGHTSUBMODELSfield^.TreeVarList,rightTreeVarlist);
MERGESETS(b^.ldfield.RIGHTSUBMODELSfield^.NodeVarList,rightNodeVarList);
MERGESETS(b^.ldfield.RIGHTSUBMODELSfield^.RelVarList,rightrelVarList);
END
END; END;

3 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN rightleft.table:= b^.ldfield.MATCHCONDSfield^.righttolefttable;
END
END; END;

4 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN 
MERGESETS(b^.ldfield.SUBFILTERSfield^.rightrecords,rightrecords);
MERGESETS(b^.ldfield.SUBFILTERSfield^.rightmuvarlist,rightmuvarlist);
MERGESETS(b^.ldfield.SUBFILTERSfield^.rightsigmavarlist,rightsigmavarlist);
MERGESETS(b^.ldfield.SUBFILTERSfield^.righttreevarlist,righttreevarlist);
MERGESETS(b^.ldfield.SUBFILTERSfield^.rightnodevarlist,rightnodevarlist);
MERGESETS(b^.ldfield.SUBFILTERSfield^.rightrelvarlist,rightrelvarlist);
END
END; END;

5 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN 
mergesets(b^.ldfield.CAPAIRSfield^.muvarlist,rightmuvarlist);
mergesets(b^.ldfield.CAPAIRSfield^.sigmavarlist,rightsigmavarlist);
mergesets(b^.ldfield.CAPAIRSfield^.treevarlist,righttreevarlist);
mergesets(b^.ldfield.CAPAIRSfield^.nodevarlist,rightnodevarlist);
mergesets(b^.ldfield.CAPAIRSfield^.relvarlist,rightrelvarlist);
END
END; END;

6 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN END
END; END;

7 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN END
END; END;

8 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN 
IF numofsubfilters<>0 THEN
BEGIN
appendrightleft(rightleft,righttolefttable);
END;
INITSETofidents(rightleft.table);
numofsubfilters:=numofsubfilters+1 
END
END; END;

Hfinal: BEGIN
 mrucomDECL_assignstatus(
TRUE
);IF mrucomDECL_status THEN BEGIN mrucomMAKET_SUBFILTERS(top);mrucomDECL_addnewtop(top)
; 
IF numofsubfilters<>0 THEN
BEGIN
appendrightleft(rightleft,righttolefttable);
END;
top^.ldfield.SUBFILTERSfield^.numofsubfilters:=numofsubfilters;
top^.ldfield.SUBFILTERSfield^.righttolefttable:=righttolefttable;
top^.ldfield.SUBFILTERSfield^.rightrecords:=rightrecords;
top^.ldfield.SUBFILTERSfield^.rightmuvarlist:=rightmuvarlist;
top^.ldfield.SUBFILTERSfield^.rightsigmavarlist:=rightsigmavarlist;
top^.ldfield.SUBFILTERSfield^.righttreevarlist:=righttreevarlist;
top^.ldfield.SUBFILTERSfield^.rightnodevarlist:=rightnodevarlist;
top^.ldfield.SUBFILTERSfield^.rightrelvarlist:=rightrelvarlist;
END
END; END;

END;

END;{package}
PACKAGE LEFTSUBMODELSpack: [LEFTSUBMODELSrule];
VAR records,muvarlist,sigmavarlist,treevarlist,nodevarlist,
setofnames,relvarlist,{righthandside}rhslabels: mrucomLANGSPEC_setofidents;
PROCEDURE LEFTSUBMODELSrule(a:mrucomDECL_nodeid;b:mrucomDECL_psnode;mode:mrucomDECL_surfrulemode);
 PROCEDURE APPENDSETS(S1: mrucomLANGSPEC_SETOFidents;VAR S2: mrucomLANGSPEC_SETOFidents);
VAR ident1: mrucomLANGSPEC_ident;
BEGIN
WHILE STILLidents(S1) DO
BEGIN
TAKEident(ident1,S1);
APPENDident(ident1,S2)
END
END;

BEGIN case a of Hinit:
 BEGIN initsetofidents(setofnames);
initsetofidents(rhslabels);
initsetofidents(records);
initsetofidents(muvarlist);
initsetofidents(sigmavarlist);
initsetofidents(treevarlist);
initsetofidents(nodevarlist);
initsetofidents(relvarlist);
END;
1 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN END
END; END;

2 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN APPENDSETS(b^.ldfield.LABELEDTDfield^.records,leftrecords);
APPENDSETS(b^.ldfield.LABELEDTDfield^.records,records);
APPENDSETS(b^.ldfield.LABELEDTDfield^.muvarlist,muvarlist);
APPENDSETS(b^.ldfield.LABELEDTDfield^.sigmavarlist,sigmavarlist);
APPENDSETS(b^.ldfield.LABELEDTDfield^.treevarlist,treevarlist);
APPENDSETS(b^.ldfield.LABELEDTDfield^.nodevarlist,nodevarlist);
APPENDSETS(b^.ldfield.LABELEDTDfield^.relvarlist,relvarlist);
appendident(b^.ldfield.LABELEDTDfield^.rhslabel,rhslabels);
appendsets(b^.ldfield.LABELEDTDfield^.setofnames,setofnames);
END
END; END;

3 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN APPENDSETS(b^.ldfield.LABELEDLDfield^.records,leftrecords);
APPENDSETS(b^.ldfield.LABELEDLDfield^.records,records);
APPENDSETS(b^.ldfield.LABELEDLDfield^.muvarlist,muvarlist);
APPENDSETS(b^.ldfield.LABELEDLDfield^.sigmavarlist,sigmavarlist);
APPENDSETS(b^.ldfield.LABELEDLDfield^.treevarlist,treevarlist);
APPENDSETS(b^.ldfield.LABELEDLDfield^.nodevarlist,nodevarlist);
APPENDSETS(b^.ldfield.LABELEDLDfield^.relvarlist,relvarlist);
appendident(b^.ldfield.LABELEDLDfield^.rhslabel,rhslabels);
appendsets(b^.ldfield.LABELEDLDfield^.setofnames,setofnames);
END
END; END;

Hfinal: BEGIN
 mrucomDECL_assignstatus(
TRUE
);IF mrucomDECL_status THEN BEGIN mrucomMAKET_LEFTSUBMODELS(top);mrucomDECL_addnewtop(top)
;
top^.ldfield.LEFTSUBMODELSfield^.syncattable:=syncattable;
initsetofsyncats(syncattable);
top^.ldfield.LEFTSUBMODELSfield^.setofnames:=setofnames;
top^.ldfield.LEFTSUBMODELSfield^.records:=records;
top^.ldfield.LEFTSUBMODELSfield^.muvarlist:=muvarlist;
top^.ldfield.LEFTSUBMODELSfield^.sigmavarlist:=sigmavarlist;
top^.ldfield.LEFTSUBMODELSfield^.treevarlist:=treevarlist;
top^.ldfield.LEFTSUBMODELSfield^.nodevarlist:=nodevarlist;
top^.ldfield.LEFTSUBMODELSfield^.relvarlist:=relvarlist;
top^.ldfield.LEFTSUBMODELSfield^.rhslabels:=rhslabels;
END
END; END;

END;

END;{package}
PACKAGE RIGHTSUBMODELSpack: [RIGHTSUBMODELSrule];
VAR rhslabels,records,muvarlist,sigmavarlist,treevarlist,nodevarlist,
setofnames,relvarlist: mrucomLANGSPEC_setofidents;
id,id1: mrucomLANGSPEC_ident;
dtreename: TSTRING_string;
PROCEDURE RIGHTSUBMODELSrule(a:mrucomDECL_nodeid;b:mrucomDECL_psnode;mode:mrucomDECL_surfrulemode);
 PROCEDURE APPENDSETS(S1: mrucomLANGSPEC_SETOFidents;VAR S2: mrucomLANGSPEC_SETOFidents);
VAR ident1: mrucomLANGSPEC_ident;
BEGIN
WHILE STILLidents(S1) DO
BEGIN
TAKEident(ident1,S1);
APPENDident(ident1,S2)
END
END;

BEGIN case a of Hinit:
 BEGIN initsetofidents(rhslabels);
initsetofidents(setofnames);
assigncounter(counter+1);
initsetofidents(records);
initsetofidents(muvarlist);
initsetofidents(sigmavarlist);
initsetofidents(treevarlist);
initsetofidents(nodevarlist);
initsetofidents(relvarlist);
TSTRING_constantempty(dtreename);
END;
1 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN END
END; END;

2 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN APPENDSETS(b^.ldfield.LABELEDTDfield^.records,rightrecords);
appendident(b^.ldfield.LABELEDTDfield^.rhslabel,rhslabels);
APPENDSETS(b^.ldfield.LABELEDTDfield^.records,records);
appendsets(b^.ldfield.LABELEDTDfield^.setofnames,setofnames);
APPENDSETS(b^.ldfield.LABELEDTDfield^.muvarlist,muvarlist);
APPENDSETS(b^.ldfield.LABELEDTDfield^.sigmavarlist,sigmavarlist);
APPENDSETS(b^.ldfield.LABELEDTDfield^.treevarlist,treevarlist);
APPENDSETS(b^.ldfield.LABELEDTDfield^.nodevarlist,nodevarlist);
APPENDSETS(b^.ldfield.LABELEDTDfield^.relvarlist,relvarlist);
END
END; END;

3 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN APPENDSETS(b^.ldfield.LABELEDLDfield^.records,rightrecords);
appendident(b^.ldfield.LABELEDLDfield^.rhslabel,rhslabels);
appendsets(b^.ldfield.LABELEDLDfield^.setofnames,setofnames);
APPENDSETS(b^.ldfield.LABELEDLDfield^.records,records);
APPENDSETS(b^.ldfield.LABELEDLDfield^.muvarlist,muvarlist);
APPENDSETS(b^.ldfield.LABELEDLDfield^.sigmavarlist,sigmavarlist);
APPENDSETS(b^.ldfield.LABELEDLDfield^.treevarlist,treevarlist);
APPENDSETS(b^.ldfield.LABELEDLDfield^.nodevarlist,nodevarlist);
APPENDSETS(b^.ldfield.LABELEDLDfield^.relvarlist,relvarlist);
END
END; END;

4 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN dtreename:=b^.ldfield.LABELEDDTREEfield^.str;
id.str:=b^.ldfield.LABELEDDTREEfield^.labelstr;
appendident(id,rhslabels);
assigncounter(counter + 1);
id1.str:=MRUCOMDECL_Convinttostring(counter);
TSTRING_append(id1.str,'_');
TSTRING_append(id1.str,id.str);
appendident(id1,setofnames);
APPENDSETS(b^.ldfield.LABELEDDTREEfield^.records,RightRecords);
APPENDSETS(b^.ldfield.LABELEDDTREEfield^.MuVarList,MuVarList);
APPENDSETS(b^.ldfield.LABELEDDTREEfield^.SigmaVarList,SigmaVarList);
APPENDSETS(b^.ldfield.LABELEDDTREEfield^.TreeVarList,TreeVarlist);
APPENDSETS(b^.ldfield.LABELEDDTREEfield^.NodeVarList,NodeVarList);
APPENDSETS(b^.ldfield.LABELEDDTREEfield^.RelVarList,relVarList);
END
END; END;

Hfinal: BEGIN
 mrucomDECL_assignstatus(
TRUE
);IF mrucomDECL_status THEN BEGIN mrucomMAKET_RIGHTSUBMODELS(top);mrucomDECL_addnewtop(top)
;
top^.ldfield.RIGHTSUBMODELSfield^.setofnames:=setofnames;
top^.ldfield.RIGHTSUBMODELSfield^.syncattable:=syncattable;
initsetofsyncats(syncattable);
top^.ldfield.RIGHTSUBMODELSfield^.counterstr:=MRUCOMDECL_Convinttostring(counter);
top^.ldfield.RIGHTSUBMODELSfield^.rhslabels:=rhslabels;
top^.ldfield.RIGHTSUBMODELSfield^.records:=records;
top^.ldfield.RIGHTSUBMODELSfield^.muvarlist:=muvarlist;
top^.ldfield.RIGHTSUBMODELSfield^.sigmavarlist:=sigmavarlist;
top^.ldfield.RIGHTSUBMODELSfield^.treevarlist:=treevarlist;
top^.ldfield.RIGHTSUBMODELSfield^.nodevarlist:=nodevarlist;
top^.ldfield.RIGHTSUBMODELSfield^.relvarlist:=relvarlist;
END
END; END;

END;

END;{package}
PACKAGE COMCAPAIRSpack: [COMCAPAIRSrule];
VAR MuVarList,SigmaVarList,TreeVarList,NodeVarList,
RelVarList: mrucomLANGSPEC_SETOFidents;

PROCEDURE COMCAPAIRSrule(a:mrucomDECL_nodeid;b:mrucomDECL_psnode;mode:mrucomDECL_surfrulemode);
BEGIN case a of Hinit:
 BEGIN END;
1 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN END
END; END;

2 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN 
muvarlist:=b^.ldfield.CAPAIRSfield^.muvarlist;
sigmavarlist:=b^.ldfield.CAPAIRSfield^.sigmavarlist;
treevarlist:=b^.ldfield.CAPAIRSfield^.treevarlist;
nodevarlist:=b^.ldfield.CAPAIRSfield^.nodevarlist;
relvarlist:=b^.ldfield.CAPAIRSfield^.relvarlist;
END
END; END;

Hfinal: BEGIN
 mrucomDECL_assignstatus(
TRUE
);IF mrucomDECL_status THEN BEGIN mrucomMAKET_COMCAPAIRS(top);mrucomDECL_addnewtop(top)
; 
top^.ldfield.COMCAPAIRSfield^.muvarlist:=muvarlist;
top^.ldfield.COMCAPAIRSfield^.sigmavarlist:=sigmavarlist;
top^.ldfield.COMCAPAIRSfield^.treevarlist:=treevarlist;
top^.ldfield.COMCAPAIRSfield^.nodevarlist:=nodevarlist;
top^.ldfield.COMCAPAIRSfield^.relvarlist:=relvarlist;
END
END; END;

END;

END;{package}
PACKAGE DECOMCAPAIRSpack: [DECOMCAPAIRSrule];
VAR MuVarList,SigmaVarList,TreeVarList,NodeVarList,
RelVarList: mrucomLANGSPEC_SETOFidents;

PROCEDURE DECOMCAPAIRSrule(a:mrucomDECL_nodeid;b:mrucomDECL_psnode;mode:mrucomDECL_surfrulemode);
BEGIN case a of Hinit:
 BEGIN END;
1 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN END
END; END;

2 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN
muvarlist:=b^.ldfield.CAPAIRSfield^.muvarlist;
sigmavarlist:=b^.ldfield.CAPAIRSfield^.sigmavarlist;
treevarlist:=b^.ldfield.CAPAIRSfield^.treevarlist;
nodevarlist:=b^.ldfield.CAPAIRSfield^.nodevarlist;
relvarlist:=b^.ldfield.CAPAIRSfield^.relvarlist;
END
END; END;

Hfinal: BEGIN
 mrucomDECL_assignstatus(
TRUE
);IF mrucomDECL_status THEN BEGIN mrucomMAKET_DECOMCAPAIRS(top);mrucomDECL_addnewtop(top)
;
top^.ldfield.DECOMCAPAIRSfield^.muvarlist:=muvarlist;
top^.ldfield.DECOMCAPAIRSfield^.sigmavarlist:=sigmavarlist;
top^.ldfield.DECOMCAPAIRSfield^.treevarlist:=treevarlist;
top^.ldfield.DECOMCAPAIRSfield^.nodevarlist:=nodevarlist;
top^.ldfield.DECOMCAPAIRSfield^.relvarlist:=relvarlist;
END
END; END;

END;

END;{package}
PACKAGE CAPAIRSpack: [CAPAIRSrule];
VAR actioncounter: mrucomLANGSPEC_teller;
capresent: mrucomLANGSPEC_bool;
actioncounters: mrucomLANGSPEC_setoftellers;
MuVarList,SigmaVarList,TreeVarList,NodeVarList,
RelVarList: mrucomLANGSPEC_SETOFidents;
PROCEDURE CAPAIRSrule(a:mrucomDECL_nodeid;b:mrucomDECL_psnode;mode:mrucomDECL_surfrulemode);
 PROCEDURE APPENDSETS(S1: mrucomLANGSPEC_SETOFidents;VAR S2: mrucomLANGSPEC_SETOFidents);
VAR ident1: mrucomLANGSPEC_ident;
BEGIN
WHILE STILLidents(S1) DO
BEGIN
TAKEident(ident1,S1);
APPENDident(ident1,S2)
END
END;

BEGIN case a of Hinit:
 BEGIN INITsetoftellers(actioncounters);
INITsetofidents(MuVarlist);
INITsetofidents(SigmaVarlist);
INITsetofidents(NodeVarlist);
INITsetofidents(TreeVarlist);
INITsetofidents(RelVarlist);
END;
1 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN END
END; END;

2 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN capresent:=false;
appendsets(b^.ldfield.CONDITIONfield^.muvarlist,muvarlist);
appendsets(b^.ldfield.CONDITIONfield^.sigmavarlist,sigmavarlist);
appendsets(b^.ldfield.CONDITIONfield^.nodevarlist,nodevarlist);
appendsets(b^.ldfield.CONDITIONfield^.treevarlist,treevarlist);
appendsets(b^.ldfield.CONDITIONfield^.relvarlist,relvarlist);
END
END; END;

3 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN capresent:=true;
appendsets(b^.ldfield.bareCAPAIRSfield^.muvarlist,muvarlist);
appendsets(b^.ldfield.bareCAPAIRSfield^.sigmavarlist,sigmavarlist);
appendsets(b^.ldfield.bareCAPAIRSfield^.nodevarlist,nodevarlist);
appendsets(b^.ldfield.bareCAPAIRSfield^.treevarlist,treevarlist);
appendsets(b^.ldfield.bareCAPAIRSfield^.relvarlist,relvarlist);
END
END; END;

4 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN actioncounter.int:=b^.ldfield.ACTIONfield^.counter;
IF capresent THEN
appendteller(actioncounter,actioncounters);
END
END; END;

Hfinal: BEGIN
 mrucomDECL_assignstatus(
TRUE
);IF mrucomDECL_status THEN BEGIN mrucomMAKET_CAPAIRS(top);mrucomDECL_addnewtop(top)
;
top^.ldfield.CAPAIRSfield^.actioncounters:=actioncounters;
top^.ldfield.CAPAIRSfield^.muvarlist:=muvarlist;
top^.ldfield.CAPAIRSfield^.sigmavarlist:=sigmavarlist;
top^.ldfield.CAPAIRSfield^.treevarlist:=treevarlist;
top^.ldfield.CAPAIRSfield^.nodevarlist:=nodevarlist;
top^.ldfield.CAPAIRSfield^.relvarlist:=relvarlist;
END
END; END;

END;

END;{package}
PACKAGE bareCAPAIRSpack: [bareCAPAIRSrule];
VAR actioncounter: mrucomLANGSPEC_teller;
capresent: mrucomLANGSPEC_bool;
actioncounters: mrucomLANGSPEC_setoftellers;
MuVarList,SigmaVarList,TreeVarList,NodeVarList,
RelVarList: mrucomLANGSPEC_SETOFidents;
PROCEDURE bareCAPAIRSrule(a:mrucomDECL_nodeid;b:mrucomDECL_psnode;mode:mrucomDECL_surfrulemode);
 PROCEDURE APPENDSETS(S1: mrucomLANGSPEC_SETOFidents;VAR S2: mrucomLANGSPEC_SETOFidents);
VAR ident1: mrucomLANGSPEC_ident;
BEGIN
WHILE STILLidents(S1) DO
BEGIN
TAKEident(ident1,S1);
APPENDident(ident1,S2)
END
END;

BEGIN case a of Hinit:
 BEGIN INITsetoftellers(actioncounters);
INITsetofidents(MuVarlist);
INITsetofidents(SigmaVarlist);
INITsetofidents(NodeVarlist);
INITsetofidents(TreeVarlist);
INITsetofidents(RelVarlist);
END;
2 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN capresent:=false;
appendsets(b^.ldfield.CONDITIONfield^.muvarlist,muvarlist);
appendsets(b^.ldfield.CONDITIONfield^.sigmavarlist,sigmavarlist);
appendsets(b^.ldfield.CONDITIONfield^.nodevarlist,nodevarlist);
appendsets(b^.ldfield.CONDITIONfield^.treevarlist,treevarlist);
appendsets(b^.ldfield.CONDITIONfield^.relvarlist,relvarlist);
END
END; END;

3 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN capresent:=true END
END; END;

4 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN actioncounter.int:=b^.ldfield.ACTIONfield^.counter;
IF capresent THEN
appendteller(actioncounter,actioncounters);
END
END; END;

Hfinal: BEGIN
 mrucomDECL_assignstatus(
TRUE
);IF mrucomDECL_status THEN BEGIN mrucomMAKET_bareCAPAIRS(top);mrucomDECL_addnewtop(top)
; 
top^.ldfield.bareCAPAIRSfield^.actioncounters:=actioncounters;
top^.ldfield.bareCAPAIRSfield^.muvarlist:=muvarlist;
top^.ldfield.bareCAPAIRSfield^.sigmavarlist:=sigmavarlist;
top^.ldfield.bareCAPAIRSfield^.treevarlist:=treevarlist;
top^.ldfield.bareCAPAIRSfield^.nodevarlist:=nodevarlist;
top^.ldfield.bareCAPAIRSfield^.relvarlist:=relvarlist;
END
END; END;

END;

END;{package}
PACKAGE CONDITIONpack: [CONDITIONrule];
VAR vartypes: mrucomLANGSPEC_setofvartypes;
MuVarList,SigmaVarList,TreeVarList,NodeVarList,
RelVarList: mrucomLANGSPEC_SETOFidents;

PROCEDURE CONDITIONrule(a:mrucomDECL_nodeid;b:mrucomDECL_psnode;mode:mrucomDECL_surfrulemode);
BEGIN case a of Hinit:
 BEGIN END;
1 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN END
END; END;

2 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN END
END; END;

3 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN vartypes:=b^.ldfield.ANDCONDfield^.vartypes;
sigmavarlist:=b^.ldfield.ANDCONDfield^.sigmavarlist;
muvarlist:=b^.ldfield.ANDCONDfield^.muvarlist;
treevarlist:=b^.ldfield.ANDCONDfield^.treevarlist;
nodevarlist:=b^.ldfield.ANDCONDfield^.nodevarlist;
relvarlist:=b^.ldfield.ANDCONDfield^.relvarlist;
END
END; END;

Hfinal: BEGIN
 mrucomDECL_assignstatus(
TRUE
);IF mrucomDECL_status THEN BEGIN mrucomMAKET_CONDITION(top);mrucomDECL_addnewtop(top)
; 
top^.ldfield.CONDITIONfield^.vartypes:=vartypes;
top^.ldfield.CONDITIONfield^.muvarlist:=muvarlist;
top^.ldfield.CONDITIONfield^.sigmavarlist:=sigmavarlist;
top^.ldfield.CONDITIONfield^.treevarlist:=treevarlist;
top^.ldfield.CONDITIONfield^.nodevarlist:=nodevarlist;
top^.ldfield.CONDITIONfield^.relvarlist:=relvarlist;
END
END; END;

END;

END;{package}
PACKAGE ACTIONpack: [ACTIONrule];

PROCEDURE ACTIONrule(a:mrucomDECL_nodeid;b:mrucomDECL_psnode;mode:mrucomDECL_surfrulemode);
BEGIN case a of Hinit:
 BEGIN END;
1 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN END
END; END;

2 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN END
END; END;

3 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN END
END; END;

4 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN END
END; END;

5 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN END
END; END;

Hfinal: BEGIN
 mrucomDECL_assignstatus(
TRUE
);IF mrucomDECL_status THEN BEGIN mrucomMAKET_ACTION(top);mrucomDECL_addnewtop(top)
;
top^.ldfield.ACTIONfield^.counter:=counter;
assigncounter(counter+1);
END
END; END;

END;

END;{package}
PACKAGE STATEMENTSpack: [STATEMENTSrule];

PROCEDURE STATEMENTSrule(a:mrucomDECL_nodeid;b:mrucomDECL_psnode;mode:mrucomDECL_surfrulemode);
BEGIN case a of Hinit:
 BEGIN END;
1 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN END
END; END;

2 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN END
END; END;

3 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN END
END; END;

Hfinal: BEGIN
 mrucomDECL_assignstatus(
TRUE
);IF mrucomDECL_status THEN BEGIN mrucomMAKET_STATEMENTS(top);mrucomDECL_addnewtop(top)
; END
END; END;

END;

END;{package}
PACKAGE KEYNAMEpack: [KEYNAMErule];
VAR keyvar,keyIvar: mrucomLANGSPEC_bool;
str1,str2: TSTRING_string;
str3: TSTRING_string;int: mrucomLANGSPEC_int;
beginquote,endquote: mrucomLANGSPEC_bool;

PROCEDURE KEYNAMErule(a:mrucomDECL_nodeid;b:mrucomDECL_psnode;mode:mrucomDECL_surfrulemode);
BEGIN case a of Hinit:
 BEGIN keyvar:=false; keyIvar:=false;TSTRING_constantempty(str1);
TSTRING_constantempty(str3);
TSTRING_constantempty(str2);
beginquote:=FALSE;endquote:=FALSE;
END;
1 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN END
END; END;

2 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN str1:=b^.ldfield.TERMINAL^.str;
IF TSTRING_length(str3)<>0 THEN
BEGIN
TSTRING_append(str3,'_');
TSTRING_append(str3,str1);
END
ELSE
BEGIN
str3:=str1;
END;
END
END; END;

3 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN str1:=b^.ldfield.TERMINAL^.str END
END; END;

4 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN keyvar:= TRUE; str2:=b^.ldfield.TERMINAL^.str END
END; END;

5 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN keyIvar:= TRUE; str1:=b^.ldfield.TERMINAL^.str END
END; END;

6 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN END
END; END;

7 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN beginquote:=TRUE END
END; END;

8 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN endquote:=TRUE END
END; END;

Hfinal: BEGIN
 mrucomDECL_assignstatus(
NOT(beginquote) OR endquote
);IF mrucomDECL_status THEN BEGIN mrucomMAKET_KEYNAME(top);mrucomDECL_addnewtop(top)
;
IF TSTRING_length(str3)<>0 THEN
BEGIN
str1:=str3;
IF NOT(STRTOKEY_getSkey(str3,int)) THEN
BEGIN
writeln('Skey ',str3,' must still be added to SKEYDEF.KDF!!');
writeln('OR string key must occur between quotes (if underscores in it)');
END;
END;
top^.ldfield.KEYNAMEfield^.keyvar:=keyvar;
top^.ldfield.KEYNAMEfield^.keyIvar:=keyIvar;
top^.ldfield.KEYNAMEfield^.str1:=str1; top^.ldfield.KEYNAMEfield^.str2:=str2
END
END; END;

END;

END;{package}
PACKAGE TREEVARpack: [TREEVARrule];
VAR str: TSTRING_string;
PROCEDURE TREEVARrule(a:mrucomDECL_nodeid;b:mrucomDECL_psnode;mode:mrucomDECL_surfrulemode);
 FUNCTION STRING:TSTRING_string;
VAR str:TSTRING_string;
begin
TSTRING_constant(str,'T',1);
STRING:=str
end;
FUNCTION EXTRACT(str:TSTRING_string):BOOLEAN;
VAR ch:CHAR;
BEGIN
TSTRING_extractchar(ch,str,2);
EXTRACT:=(ch IN ['1','2','3','4','5','6','7','8','9'])
END;

BEGIN case a of Hinit:
 BEGIN TSTRING_constantempty(str) END;
1 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
(TSTRING_comparebegin(b^.ldfield.TERMINAL^.str,STRING)=0) AND
EXTRACT(b^.ldfield.TERMINAL^.str)
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN str:=b^.ldfield.TERMINAL^.str END
END; END;

2 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN END
END; END;

Hfinal: BEGIN
 mrucomDECL_assignstatus(
TRUE
);IF mrucomDECL_status THEN BEGIN mrucomMAKET_TREEVAR(top);mrucomDECL_addnewtop(top)
; top^.ldfield.TREEVARfield^.str:=str END
END; END;

END;

END;{package}
PACKAGE MUVARpack: [MUVARrule];
VAR str: TSTRING_string;
PROCEDURE MUVARrule(a:mrucomDECL_nodeid;b:mrucomDECL_psnode;mode:mrucomDECL_surfrulemode);
 FUNCTION MUSTRING:TSTRING_string;
VAR str:TSTRING_string;
begin
TSTRING_constant(str,'MU',2);
MUSTRING:=str
end;
FUNCTION EXTRACT(str:TSTRING_string):BOOLEAN;
VAR ch:CHAR;
BEGIN
TSTRING_extractchar(ch,str,3);
EXTRACT:=(ch IN ['1','2','3','4','5','6','7','8','9'])
END;

BEGIN case a of Hinit:
 BEGIN END;
1 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
(TSTRING_comparebegin(b^.ldfield.TERMINAL^.str,MUstring)=0) AND
EXTRACT(b^.ldfield.TERMINAL^.str)
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN str:=b^.ldfield.TERMINAL^.str END
END; END;

Hfinal: BEGIN
 mrucomDECL_assignstatus(
TRUE
);IF mrucomDECL_status THEN BEGIN mrucomMAKET_MUVAR(top);mrucomDECL_addnewtop(top)
; top^.ldfield.MUVARfield^.str:=str END
END; END;

END;

END;{package}
PACKAGE SIGMAVARpack: [SIGMAVARrule];
VAR str: TSTRING_string;
PROCEDURE SIGMAVARrule(a:mrucomDECL_nodeid;b:mrucomDECL_psnode;mode:mrucomDECL_surfrulemode);
 FUNCTION SIGSTRING:TSTRING_string;
VAR str:TSTRING_string;
begin
TSTRING_constant(str,'SIG',3);
SIGSTRING:=str
end;
FUNCTION EXTRACT(str:TSTRING_string):BOOLEAN;
VAR ch:CHAR;
BEGIN
TSTRING_extractchar(ch,str,4);
EXTRACT:=(ch IN ['1','2','3','4','5','6','7','8','9'])
END;

BEGIN case a of Hinit:
 BEGIN 
END;
1 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
(TSTRING_comparebegin(b^.ldfield.TERMINAL^.str,SIGstring)=0) AND
EXTRACT(b^.ldfield.TERMINAL^.str)
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN str:=b^.ldfield.TERMINAL^.str END
END; END;

Hfinal: BEGIN
 mrucomDECL_assignstatus(
TRUE
);IF mrucomDECL_status THEN BEGIN mrucomMAKET_SIGMAVAR(top);mrucomDECL_addnewtop(top)
; top^.ldfield.SIGMAVARfield^.str:=str END
END; END;

END;

END;{package}
PACKAGE NODEVARpack: [NODEVARrule];
VAR str: TSTRING_string;
PROCEDURE NODEVARrule(a:mrucomDECL_nodeid;b:mrucomDECL_psnode;mode:mrucomDECL_surfrulemode);
 FUNCTION NSTRING:TSTRING_string;
VAR str:TSTRING_string;
begin
TSTRING_constant(str,'N',1);
NSTRING:=str
end;
FUNCTION EXTRACT(str:TSTRING_string):BOOLEAN;
VAR ch:CHAR;
BEGIN
TSTRING_extractchar(ch,str,2);
EXTRACT:=(ch IN ['1','2','3','4','5','6','7','8','9'])
END;

BEGIN case a of Hinit:
 BEGIN END;
1 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
(TSTRING_comparebegin(b^.ldfield.TERMINAL^.str,Nstring)=0) AND
EXTRACT(b^.ldfield.TERMINAL^.str)
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN str:=b^.ldfield.TERMINAL^.str END
END; END;

Hfinal: BEGIN
 mrucomDECL_assignstatus(
TRUE
);IF mrucomDECL_status THEN BEGIN mrucomMAKET_NODEVAR(top);mrucomDECL_addnewtop(top)
; top^.ldfield.NODEVARfield^.str:=str END
END; END;

END;

END;{package}
PACKAGE RELVARpack: [RELVARrule];
VAR str: TSTRING_string;
ch: CHAR;
PROCEDURE RELVARrule(a:mrucomDECL_nodeid;b:mrucomDECL_psnode;mode:mrucomDECL_surfrulemode);
 FUNCTION RELSTRING:TSTRING_string;
VAR str:TSTRING_string;
begin
TSTRING_constant(str,'REL',3);
RELSTRING:=str
end;
FUNCTION EXTRACT(str:TSTRING_string):BOOLEAN;
VAR ch:CHAR;
BEGIN
TSTRING_extractchar(ch,str,4);
EXTRACT:=(ch IN ['1','2','3','4','5','6','7','8','9'])
END;

BEGIN case a of Hinit:
 BEGIN TSTRING_constantempty(str) END;
1 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
(TSTRING_comparebegin(b^.ldfield.TERMINAL^.str,RELstring)=0) AND
EXTRACT(b^.ldfield.TERMINAL^.str)
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN str:=b^.ldfield.TERMINAL^.str END
END; END;

2 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN END
END; END;

Hfinal: BEGIN
 mrucomDECL_assignstatus(
TRUE
);IF mrucomDECL_status THEN BEGIN mrucomMAKET_RELVAR(top);mrucomDECL_addnewtop(top)
; top^.ldfield.RELVARfield^.str:=str END
END; END;

END;

END;{package}
PACKAGE CLABELpack: [CLABELrule];
VAR str: TSTRING_string;
PROCEDURE CLABELrule(a:mrucomDECL_nodeid;b:mrucomDECL_psnode;mode:mrucomDECL_surfrulemode);
 FUNCTION CSTRING:TSTRING_string;
VAR str:TSTRING_string;
begin
TSTRING_constant(str,'C',1);
CSTRING:=str
end;
FUNCTION EXTRACT(str:TSTRING_string):BOOLEAN;
VAR ch:CHAR;
BEGIN
TSTRING_extractchar(ch,str,2);
EXTRACT:=(ch IN ['1','2','3','4','5','6','7','8','9'])
END;

BEGIN case a of Hinit:
 BEGIN END;
1 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
(TSTRING_comparebegin(b^.ldfield.TERMINAL^.str,Cstring)=0) AND
EXTRACT(b^.ldfield.TERMINAL^.str)
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN str:=b^.ldfield.TERMINAL^.str END
END; END;

Hfinal: BEGIN
 mrucomDECL_assignstatus(
TRUE
);IF mrucomDECL_status THEN BEGIN mrucomMAKET_CLABEL(top);mrucomDECL_addnewtop(top)
; top^.ldfield.CLABELfield^.str:=str END
END; END;

END;

END;{package}
PACKAGE ALABELpack: [ALABELrule];
VAR str: TSTRING_string;
PROCEDURE ALABELrule(a:mrucomDECL_nodeid;b:mrucomDECL_psnode;mode:mrucomDECL_surfrulemode);
 FUNCTION ASTRING:TSTRING_string;
VAR str:TSTRING_string;
begin
TSTRING_constant(str,'A',1);
ASTRING:=str
end;
FUNCTION EXTRACT(str:TSTRING_string):BOOLEAN;
VAR ch:CHAR;
BEGIN
TSTRING_extractchar(ch,str,2);
EXTRACT:=(ch IN ['1','2','3','4','5','6','7','8','9'])
END;

BEGIN case a of Hinit:
 BEGIN END;
1 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
(TSTRING_comparebegin(b^.ldfield.TERMINAL^.str,Astring)=0) AND
EXTRACT(b^.ldfield.TERMINAL^.str)
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN str:=b^.ldfield.TERMINAL^.str END
END; END;

Hfinal: BEGIN
 mrucomDECL_assignstatus(
TRUE
);IF mrucomDECL_status THEN BEGIN mrucomMAKET_ALABEL(top);mrucomDECL_addnewtop(top)
; top^.ldfield.ALABELfield^.str:=str END
END; END;

END;

END;{package}
PACKAGE ILABELtjepack: [ILABELtjerule];
VAR str: TSTRING_string;
PROCEDURE ILABELtjerule(a:mrucomDECL_nodeid;b:mrucomDECL_psnode;mode:mrucomDECL_surfrulemode);
 FUNCTION ISTRING:TSTRING_string;
VAR str:TSTRING_string;
begin
TSTRING_constant(str,'I',1);
ISTRING:=str
end;
FUNCTION EXTRACT(str:TSTRING_string):BOOLEAN;
VAR ch:CHAR;
BEGIN
TSTRING_extractchar(ch,str,2);
EXTRACT:=(ch IN ['1','2','3','4','5','6','7','8','9'])
END;

BEGIN case a of Hinit:
 BEGIN END;
1 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
(TSTRING_comparebegin(b^.ldfield.TERMINAL^.str,Istring)=0) AND
EXTRACT(b^.ldfield.TERMINAL^.str)
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN str:=b^.ldfield.TERMINAL^.str END
END; END;

Hfinal: BEGIN
 mrucomDECL_assignstatus(
TRUE
);IF mrucomDECL_status THEN BEGIN mrucomMAKET_ILABELtje(top);mrucomDECL_addnewtop(top)
; top^.ldfield.ILABELtjefield^.str:=str END
END; END;

END;

END;{package}
PACKAGE MLABELtjepack: [MLABELtjerule];
VAR str: TSTRING_string;
PROCEDURE MLABELtjerule(a:mrucomDECL_nodeid;b:mrucomDECL_psnode;mode:mrucomDECL_surfrulemode);
 FUNCTION MSTRING:TSTRING_string;
VAR str:TSTRING_string;
begin
TSTRING_constant(str,'M',1);
MSTRING:=str
end;
FUNCTION EXTRACT(str:TSTRING_string):BOOLEAN;
VAR ch:CHAR;
BEGIN
TSTRING_extractchar(ch,str,2);
EXTRACT:=(ch IN ['1','2','3','4','5','6','7','8','9'])
END;

BEGIN case a of Hinit:
 BEGIN END;
1 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
(TSTRING_comparebegin(b^.ldfield.TERMINAL^.str,Mstring)=0) AND
(EXTRACT(b^.ldfield.TERMINAL^.str) OR (TSTRING_length(b^.ldfield.TERMINAL^.str)=1))
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN str:=b^.ldfield.TERMINAL^.str END
END; END;

Hfinal: BEGIN
 mrucomDECL_assignstatus(
TRUE
);IF mrucomDECL_status THEN BEGIN mrucomMAKET_MLABELtje(top);mrucomDECL_addnewtop(top)
; top^.ldfield.MLABELtjefield^.str:=str END
END; END;

END;

END;{package}
PACKAGE RLABELtjepack: [RLABELtjerule];
VAR str: TSTRING_string;

PROCEDURE RLABELtjerule(a:mrucomDECL_nodeid;b:mrucomDECL_psnode;mode:mrucomDECL_surfrulemode);
BEGIN case a of Hinit:
 BEGIN END;
1 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
(TSTRING_comparechars(b^.ldfield.TERMINAL^.str,'R',1)=0) 
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN str:=b^.ldfield.TERMINAL^.str END
END; END;

Hfinal: BEGIN
 mrucomDECL_assignstatus(
TRUE
);IF mrucomDECL_status THEN BEGIN mrucomMAKET_RLABELtje(top);mrucomDECL_addnewtop(top)
; top^.ldfield.RLABELtjefield^.str:=str END
END; END;

END;

END;{package}
PACKAGE LLABELtjepack: [LLABELtjerule];
VAR str: TSTRING_string;

PROCEDURE LLABELtjerule(a:mrucomDECL_nodeid;b:mrucomDECL_psnode;mode:mrucomDECL_surfrulemode);
BEGIN case a of Hinit:
 BEGIN END;
1 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
(TSTRING_comparechars(b^.ldfield.TERMINAL^.str,'L',1)=0)
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN str:=b^.ldfield.TERMINAL^.str END
END; END;

Hfinal: BEGIN
 mrucomDECL_assignstatus(
TRUE
);IF mrucomDECL_status THEN BEGIN mrucomMAKET_LLABELtje(top);mrucomDECL_addnewtop(top)
; top^.ldfield.LLABELtjefield^.str:=str END
END; END;

END;

END;{package}
PACKAGE LABELtjepack: [LABELtjerule];
VAR 
labelkind: mrucomLANGSPEC_labelkindtype;
str: TSTRING_string;

PROCEDURE LABELtjerule(a:mrucomDECL_nodeid;b:mrucomDECL_psnode;mode:mrucomDECL_surfrulemode);
BEGIN case a of Hinit:
 BEGIN TSTRING_constantempty(str);
labelkind:=Ilabel 
END;
1 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
 TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN str:=b^.ldfield.MLABELtjefield^.str;
labelkind:=Mlabel
END
END; END;

2 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
 TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN str:=b^.ldfield.ILABELtjefield^.str;
labelkind:=ILABEL
END
END; END;

3 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
 TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN str:=b^.ldfield.RLABELtjefield^.str;
labelkind:=RLABEL
END
END; END;

4 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
 TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN str:=b^.ldfield.LLABELtjefield^.str;
labelkind:=LLABEL
END
END; END;

5 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
 TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN str:=b^.ldfield.TREEVARfield^.str;
labelkind:=TLABEL
END
END; END;

6 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
 TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN str:=b^.ldfield.MUVARfield^.str;
labelkind:=MULABEL
END
END; END;

7 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
 TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN str:=b^.ldfield.SIGMAVARfield^.str;
labelkind:=SIGLABEL
END
END; END;

Hfinal: BEGIN
 mrucomDECL_assignstatus(
TRUE
);IF mrucomDECL_status THEN BEGIN mrucomMAKET_LABELtje(top);mrucomDECL_addnewtop(top)
; 
top^.ldfield.LABELtjefield^.labelkind:=labelkind;
top^.ldfield.LABELtjefield^.str:=str
END
END; END;

END;

END;{package}
PACKAGE CATNAMEpack: [CATNAMErule];
VAR str: TSTRING_string;

PROCEDURE CATNAMErule(a:mrucomDECL_nodeid;b:mrucomDECL_psnode;mode:mrucomDECL_surfrulemode);
BEGIN case a of Hinit:
 BEGIN END;
1 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN str:=b^.ldfield.TERMINAL^.str END
END; END;

Hfinal: BEGIN
 mrucomDECL_assignstatus(
TRUE
);IF mrucomDECL_status THEN BEGIN mrucomMAKET_CATNAME(top);mrucomDECL_addnewtop(top)
; top^.ldfield.CATNAMEfield^.str:=str END
END; END;

END;

END;{package}
PACKAGE CATRECNAMEpack: [CATRECNAMErule];
VAR str: TSTRING_string;
PROCEDURE CATRECNAMErule(a:mrucomDECL_nodeid;b:mrucomDECL_psnode;mode:mrucomDECL_surfrulemode);
 FUNCTION RELSTRING:TSTRING_string;
VAR str:TSTRING_string;
begin
TSTRING_constant(str,'REL',3);
RELSTRING:=str
end;
FUNCTION EXTRACT(str:TSTRING_string):BOOLEAN;
VAR ch:CHAR;
BEGIN
TSTRING_extractchar(ch,str,4);
EXTRACT:=(ch IN ['1','2','3','4','5','6','7','8','9'])
END;
FUNCTION checkparname(str:TSTRING_string):BOOLEAN;
VAR paramtable1: mrucomLANGSPEC_setofparams;
param1: mrucomLANGSPEC_param;
found:BOOLEAN;
BEGIN
paramtable1:=paramtable;
found:=false;
while stillparams(paramtable1) and not(found) do
begin
takeparam(param1,paramtable1);
found:=(TSTRING_compare(param1.parname,str)=0)
end;
checkparname:=found
END;

BEGIN case a of Hinit:
 BEGIN END;
1 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
((TSTRING_COMPAREbegin(b^.ldfield.TERMINAL^.str,RELstring)<>0)
OR NOT(EXTRACT(b^.ldfield.TERMINAL^.str))) AND
(NOT(checkparname(b^.ldfield.TERMINAL^.str)))
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN str:=b^.ldfield.TERMINAL^.str END
END; END;

2 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
 TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN TSTRING_appendchar(str,str,'_')END
END; END;

Hfinal: BEGIN
 mrucomDECL_assignstatus(
TRUE
);IF mrucomDECL_status THEN BEGIN mrucomMAKET_CATRECNAME(top);mrucomDECL_addnewtop(top)
; 
top^.ldfield.CATRECNAMEfield^.str:=str 
END
END; END;

END;

END;{package}
PACKAGE RELNAMEpack: [RELNAMErule];
VAR str: TSTRING_string;
PROCEDURE RELNAMErule(a:mrucomDECL_nodeid;b:mrucomDECL_psnode;mode:mrucomDECL_surfrulemode);
 FUNCTION RELSTRING:TSTRING_string;
VAR str:TSTRING_string;
begin
TSTRING_constant(str,'REL',3);
RELSTRING:=str
end;
FUNCTION EXTRACT(str:TSTRING_string):BOOLEAN;
VAR ch:CHAR;
BEGIN
TSTRING_extractchar(ch,str,4);
EXTRACT:=(ch IN ['1','2','3','4','5','6','7','8','9'])
END;

BEGIN case a of Hinit:
 BEGIN END;
1 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
(TSTRING_comparebegin(b^.ldfield.TERMINAL^.str,RELSTRING)<>0) OR
NOT(EXTRACT(b^.ldfield.TERMINAL^.str))
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN str:=b^.ldfield.TERMINAL^.str END
END; END;

Hfinal: BEGIN
 mrucomDECL_assignstatus(
TRUE
);IF mrucomDECL_status THEN BEGIN mrucomMAKET_RELNAME(top);mrucomDECL_addnewtop(top)
; top^.ldfield.RELNAMEfield^.str:=str END
END; END;

END;

END;{package}
PACKAGE PARNAMEpack: [PARNAMErule];
VAR str: TSTRING_string;
PROCEDURE PARNAMErule(a:mrucomDECL_nodeid;b:mrucomDECL_psnode;mode:mrucomDECL_surfrulemode);
 FUNCTION checkparname(str:TSTRING_string):BOOLEAN;
VAR paramtable1: mrucomLANGSPEC_setofparams;
param1: mrucomLANGSPEC_param;
found:BOOLEAN;
BEGIN
paramtable1:=paramtable;
found:=false;
while stillparams(paramtable1) and not(found) do
begin
takeparam(param1,paramtable1);
found:=(TSTRING_compare(param1.parname,str)=0)
end;
checkparname:=found
END;

BEGIN case a of Hinit:
 BEGIN END;
1 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
checkparname(b^.ldfield.TERMINAL^.str)
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN str:=b^.ldfield.TERMINAL^.str END
END; END;

Hfinal: BEGIN
 mrucomDECL_assignstatus(
TRUE
);IF mrucomDECL_status THEN BEGIN mrucomMAKET_PARNAME(top);mrucomDECL_addnewtop(top)
; top^.ldfield.PARNAMEfield^.str:=str END
END; END;

END;

END;{package}
PACKAGE PARTYPEpack: [PARTYPErule];
VAR str: TSTRING_string;

PROCEDURE PARTYPErule(a:mrucomDECL_nodeid;b:mrucomDECL_psnode;mode:mrucomDECL_surfrulemode);
BEGIN case a of Hinit:
 BEGIN END;
1 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN str:=b^.ldfield.TERMINAL^.str END
END; END;

Hfinal: BEGIN
 mrucomDECL_assignstatus(
TRUE
);IF mrucomDECL_status THEN BEGIN mrucomMAKET_PARTYPE(top);mrucomDECL_addnewtop(top)
; top^.ldfield.PARTYPEfield^.str:=str END
END; END;

END;

END;{package}
PACKAGE PASCALSTATEMENTpack: [PASCALSTATEMENTrule];
VAR haakjescounter: mrucomLANGSPEC_int;

PROCEDURE PASCALSTATEMENTrule(a:mrucomDECL_nodeid;b:mrucomDECL_psnode;mode:mrucomDECL_surfrulemode);
BEGIN case a of Hinit:
 BEGIN haakjescounter:=0 END;
1 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN END
END; END;

2 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN END
END; END;

3 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN END
END; END;

4 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN END
END; END;

5 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN END
END; END;

6 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN END
END; END;

7 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN END
END; END;

8 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN END
END; END;

9 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN END
END; END;

10: CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN END
END; END;

11: CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN END
END; END;

12: CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN END
END; END;

13: CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN END
END; END;

14: CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN END
END; END;

15: CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN haakjescounter:=haakjescounter +1 END
END; END;

16: CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN END
END; END;

17: CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN END
END; END;

18: CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN haakjescounter:=haakjescounter -1 END
END; END;

19: CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN END
END; END;

20: CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN END
END; END;

21: CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN END
END; END;

22: CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN END
END; END;

23: CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN END
END; END;

24: CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN END
END; END;

25: CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN END
END; END;

26: CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN END
END; END;

27: CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN END
END; END;

28: CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN END
END; END;

29: CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN END
END; END;

30: CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN END
END; END;

31: CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN haakjescounter:=haakjescounter +1 END
END; END;

32: CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN END
END; END;

Hfinal: BEGIN
 mrucomDECL_assignstatus(
 haakjescounter=0
);IF mrucomDECL_status THEN BEGIN mrucomMAKET_PASCALSTATEMENT(top);mrucomDECL_addnewtop(top)
; END
END; END;

END;

END;{package}
PACKAGE PASCALEXPRpack: [PASCALEXPRrule];
VAR NOTpresent,beginhaakjepresent: mrucomLANGSPEC_bool;
CATpresent: mrucomLANGSPEC_bool;
INpresent: mrucomLANGSPEC_bool;
vartype: mrucomLANGSPEC_vartype;
str1: TSTRING_string;
cattable: mrucomLANGSPEC_setofidents;
cat: mrucomLANGSPEC_ident;
haakjescounter: mrucomLANGSPEC_int;

PROCEDURE PASCALEXPRrule(a:mrucomDECL_nodeid;b:mrucomDECL_psnode;mode:mrucomDECL_surfrulemode);
BEGIN case a of Hinit:
 BEGIN
haakjescounter:=0;
TSTRING_constantempty(vartype.varname);
INITsetofidents(vartype.cattable); 
INITsetofidents(cattable); 
TSTRING_constantempty(str1);
beginhaakjepresent:=FALSE;
NOTpresent:=false;CATpresent:=FALSE;INpresent:=FALSE 
END;
1 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN INpresent:=TRUE END
END; END;

2 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN
END
END; END;

3 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN END
END; END;

4 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN 
END
END; END;

5 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN END
END; END;

6 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN END
END; END;

7 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN END
END; END;

8 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN END
END; END;

9 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN
END
END; END;

10: CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN END
END; END;

11: CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN
END
END; END;

12: CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN END
END; END;

13: CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN END
END; END;

14: CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN END
END; END;

15: CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN
END
END; END;

16: CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN END
END; END;

17: CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN
catpresent:=TSTRING_comparechars(b^.ldfield.VARNAMEfield^.str2,'CAT',3)=0;
IF catpresent THEN str1:=b^.ldfield.VARNAMEfield^.str1
END
END; END;

18: CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN IF catpresent AND inpresent THEN
cattable:= b^.ldfield.SETVALUENAMEfield^.valuetable;
END
END; END;

19: CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN
END
END; END;

20: CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN END
END; END;

21: CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN END
END; END;

22: CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN NOTpresent:=true END
END; END;

23: CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 NOTpresent
);IF mrucomDECL_status THEN BEGIN beginhaakjepresent:=TRUE END
END; END;

24: CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
TRUE
);IF mrucomDECL_status THEN BEGIN END
END; END;

25: CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
TRUE
);IF mrucomDECL_status THEN BEGIN END
END; END;

26: CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
TRUE
);IF mrucomDECL_status THEN BEGIN
END
END; END;

27: CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
TRUE
);IF mrucomDECL_status THEN BEGIN END
END; END;

28: CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
TRUE
);IF mrucomDECL_status THEN BEGIN END
END; END;

29: CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
TRUE
);IF mrucomDECL_status THEN BEGIN END
END; END;

30: CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
NOTpresent and beginhaakjepresent
);IF mrucomDECL_status THEN BEGIN END
END; END;

31: CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
TRUE
);IF mrucomDECL_status THEN BEGIN END
END; END;

32: CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
TRUE
);IF mrucomDECL_status THEN BEGIN END
END; END;

33: CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
TRUE
);IF mrucomDECL_status THEN BEGIN END
END; END;

34: CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
TRUE
);IF mrucomDECL_status THEN BEGIN END
END; END;

35: CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
TRUE
);IF mrucomDECL_status THEN BEGIN END
END; END;

36: CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
TRUE
);IF mrucomDECL_status THEN BEGIN END
END; END;

37: CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
TRUE
);IF mrucomDECL_status THEN BEGIN END
END; END;

38: CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
TRUE
);IF mrucomDECL_status THEN BEGIN haakjescounter:=haakjescounter+1 END
END; END;

39: CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
TRUE
);IF mrucomDECL_status THEN BEGIN haakjescounter:=haakjescounter-1 END
END; END;

Hfinal: BEGIN
 mrucomDECL_assignstatus(
haakjescounter=0
);IF mrucomDECL_status THEN BEGIN mrucomMAKET_PASCALEXPR(top);mrucomDECL_addnewtop(top)
;
IF catpresent AND inpresent THEN
BEGIN
vartype.varname:=str1;
vartype.cattable:=cattable;
END
ELSE TSTRING_constantempty(vartype.varname);
top^.ldfield.PASCALEXPRfield^.vartype:=vartype
END
END; END;

END;

END;{package}
PACKAGE VARNAMEpack: [VARNAMErule];
VAR varkind: mrucomLANGSPEC_varkindtype;
str1,str2: TSTRING_string;
PROCEDURE VARNAMErule(a:mrucomDECL_nodeid;b:mrucomDECL_psnode;mode:mrucomDECL_surfrulemode);
 FUNCTION CASTRING:TSTRING_string;
VAR str:TSTRING_string;
begin
TSTRING_constant(str,'CAT',3);
CASTRING:=str
end;
FUNCTION checkrecname(str:TSTRING_string):BOOLEAN;
VAR recordtable1: mrucomLANGSPEC_setofidents;
ident1: mrucomLANGSPEC_ident;
found:BOOLEAN;
ch1,ch2:CHAR;
BEGIN
found:=false;
recordtable1:=leftrecords;
while stillidents(recordtable1) and not(found) do
begin
takeident(ident1,recordtable1);
found:=(TSTRING_compare(ident1.str,str)=0)
end;
recordtable1:=rightrecords;
while stillidents(recordtable1) and not(found) do
begin
takeident(ident1,recordtable1);
found:=(TSTRING_compare(ident1.str,str)=0)
end;
recordtable1:=otherrecords;
while stillidents(recordtable1) and not(found) do
begin
takeident(ident1,recordtable1);
found:=(TSTRING_compare(ident1.str,str)=0)
end;
TSTRING_extractchar(ch1,str,1);
TSTRING_extractchar(ch2,str,1);
IF found OR
((ch1='T') OR (ch1='N') AND (ch2 IN ['0','1','2','3','4','5','6','7','8','9']))
THEN BEGIN {ok} END ELSE
writeln('Strange Record Name ',str,' encountered');
checkrecname:=found
END;

BEGIN case a of Hinit:
 BEGIN varkind:=recfield; TSTRING_constantempty(str1);
TSTRING_constantempty(str2);
END;
1 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN END
END; END;

2 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN str1:=b^.ldfield.PARNAMEfield^.str;
varkind:=parkind
END
END; END;

3 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 checkrecname(b^.ldfield.CATRECNAMEfield^.str)
);IF mrucomDECL_status THEN BEGIN
str1:=b^.ldfield.CATRECNAMEfield^.str;
END
END; END;

4 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TSTRING_compare(b^.ldfield.TERMINAL^.str,CASTRING)<>0
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN str2:=b^.ldfield.TERMINAL^.str END
END; END;

5 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN str1:=b^.ldfield.TREEVARfield^.str;
varkind:=treecat
END
END; END;

6 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN str1:=b^.ldfield.NODEVARfield^.str;
varkind:=nodecat
END
END; END;

7 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN str2:=CASTRING END
END; END;

8 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN 
str1:=b^.ldfield.RELVARfield^.str;
varkind:=relkind
END
END; END;

9 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN str1:=b^.ldfield.TREEVARfield^.str;
varkind:=treerec
END
END; END;

10: CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN str1:=b^.ldfield.NODEVARfield^.str;
varkind:=noderec
END
END; END;

11: CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN str2:=b^.ldfield.TERMINAL^.str
END
END; END;

12: CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN str1:=b^.ldfield.TERMINAL^.str;
varkind:=keykind
END
END; END;

Hfinal: BEGIN
 mrucomDECL_assignstatus(
TRUE
);IF mrucomDECL_status THEN BEGIN mrucomMAKET_VARNAME(top);mrucomDECL_addnewtop(top)
; 
top^.ldfield.VARNAMEfield^.varkind:=varkind;
top^.ldfield.VARNAMEfield^.str1:=str1; 
top^.ldfield.VARNAMEfield^.str2:=str2
END
END; END;

END;

END;{package}
PACKAGE SETVALUENAMEpack: [SETVALUENAMErule];
{de KEY hierboven lijkt gek maar staat voor een VALUENAME (ivm ambiguiteiten}
VAR valuetable: mrucomLANGSPEC_setofidents;
ident: mrucomLANGSPEC_ident;
int: mrucomLANGSPEC_int;
keystr: TSTRING_string;
beginquote,endquote,keypresent: mrucomLANGSPEC_bool;
category: TSTRING_string;
licat: LIDOMAINT_syntcat;
stree: LSSTREE_pstree;
attrstruct: LDCONVREC_pattrstruct;
varfound,relationtype: mrucomLANGSPEC_bool;
typecode: mrucomLANGSPEC_int;
PROCEDURE SETVALUENAMErule(a:mrucomDECL_nodeid;b:mrucomDECL_psnode;mode:mrucomDECL_surfrulemode);

PROCEDURE getcategory(rec:TSTRING_string; VAR category: TSTRING_string);
VAR potrec:TSTRING_string;
BEGIN
TSTRING_extractend(potrec,rec,TSTRING_length(rec)-3);
IF TSTRING_comparebegin(potrec,'rec')<>0 THEN BEGIN
TSTRING_extractend(potrec,rec,TSTRING_length(rec)-4);
TSTRING_extractbegin(category,rec,TSTRING_length(rec)-5);
IF TSTRING_comparebegin(potrec,'rec')<>0 THEN BEGIN
writeln('error in recordname: ',rec);
END;
END
ELSE BEGIN
TSTRING_extractbegin(category,rec,TSTRING_length(rec)-4);
END;
END;

BEGIN case a of Hinit:
 BEGIN keypresent:=FALSE;initsetofidents(valuetable);beginquote:=false;
endquote:=false; TSTRING_constantempty(keystr);varfound:=false;
relationtype:=false;
END;
1 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN END
END; END;

2 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN 
ident.str:=b^.ldfield.VALUENAMEfield^.str;
appendident(ident,valuetable)
END
END; END;

3 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN TSTRING_append(keystr,b^.ldfield.TERMINAL^.str);
END
END; END;

4 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN 
IF STRING_comparebegin(b^.ldfield.VARNAMEfield^.str1,'rel')<>0 THEN BEGIN
getcategory(b^.ldfield.VARNAMEfield^.str1,category);
LDSTRTOTYPE_cat(category,TSTRING_length(category),licat);
stree:= MAKET_stree(loopholes.retype(licat,LSDOMAINT_syntcat));
LSCONVREC_rectoattr(stree^.ls^,attrstruct);
WHILE (attrstruct<>NIL) and NOT(varfound) DO BEGIN
typecode:=attrstruct^.typecode;
varfound:=
(TSTRING_compare(b^.ldfield.VARNAMEfield^.str2,attrstruct^.fieldname.str)=0)
AND (attrstruct^.typeindicator=enumeration);
attrstruct:=attrstruct^.nextattr;
END;
END ELSE relationtype:=TRUE;
END
END; END;

5 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN END
END; END;

6 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN END
END; END;

7 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN END
END; END;

8 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN END
END; END;

9 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN keypresent:=TRUE END
END; END;

10 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN beginquote:=true END
END; END;

11 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN endquote:=true END
END; END;

12 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN TSTRING_append(keystr,'_') END
END; END;

Hfinal: BEGIN
 mrucomDECL_assignstatus(
not(beginquote) or endquote
);IF mrucomDECL_status THEN BEGIN mrucomMAKET_SETVALUENAME(top);mrucomDECL_addnewtop(top)
;
IF keypresent THEN
BEGIN
IF NOT(STRTOKEY_getSkey(keystr,int)) THEN
BEGIN
writeln('Skey ',keystr,' must still be added to SKEYDEF.KDF!!');
writeln('OR string key must occur between quotes (if underscores in it)');
END;
END;
top^.ldfield.SETVALUENAMEfield^.valuetable:=valuetable;
top^.ldfield.SETVALUENAMEfield^.varfound:=varfound;
top^.ldfield.SETVALUENAMEfield^.relationtype:=relationtype;
top^.ldfield.SETVALUENAMEfield^.typecode:=typecode;
END
END; END;

END;

END;{package}
PACKAGE VALUENAMEpack: [VALUENAMErule];
VAR str: TSTRING_string;
PROCEDURE VALUENAMErule(a:mrucomDECL_nodeid;b:mrucomDECL_psnode;mode:mrucomDECL_surfrulemode);
 FUNCTION checkparname(str:TSTRING_string):BOOLEAN;
VAR paramtable1: mrucomLANGSPEC_setofparams;
param1: mrucomLANGSPEC_param;
found:BOOLEAN;
BEGIN
paramtable1:=paramtable;
found:=false;
while stillparams(paramtable1) and not(found) do
begin
takeparam(param1,paramtable1);
found:=(TSTRING_compare(param1.parname,str)=0)
end;
checkparname:=found
END;
FUNCTION checkrecname(str:TSTRING_string):BOOLEAN;
VAR recordtable1: mrucomLANGSPEC_setofidents;
ident1: mrucomLANGSPEC_ident;
found:BOOLEAN;
BEGIN
found:=false;
recordtable1:=leftrecords;
while stillidents(recordtable1) and not(found) do
begin
takeident(ident1,recordtable1);
found:=(TSTRING_compare(ident1.str,str)=0)
end;
recordtable1:=rightrecords;
while stillidents(recordtable1) and not(found) do
begin
takeident(ident1,recordtable1);
found:=(TSTRING_compare(ident1.str,str)=0)
end;
recordtable1:=otherrecords;
while stillidents(recordtable1) and not(found) do
begin
takeident(ident1,recordtable1);
found:=(TSTRING_compare(ident1.str,str)=0)
end;
checkrecname:=found
END;
FUNCTION EXTRACT(str:TSTRING_string;num:INTEGER):BOOLEAN;
VAR ch:CHAR;
BEGIN
TSTRING_extractchar(ch,str,num);
EXTRACT:=(ch IN ['1','2','3','4','5','6','7','8','9'])
END;
FUNCTION RELSTRING:TSTRING_string;
VAR str:TSTRING_string;
begin
TSTRING_constant(str,'REL',3);
RELSTRING:=str
end;
FUNCTION SIGSTRING:TSTRING_string;
VAR str:TSTRING_string;
begin
TSTRING_constant(str,'SIG',3);
SIGSTRING:=str
end;
FUNCTION MUSTRING:TSTRING_string;
VAR str:TSTRING_string;
begin
TSTRING_constant(str,'MU',2);
MUSTRING:=str
end;

BEGIN case a of Hinit:
 BEGIN TSTRING_constantempty(str) END;
1 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
not(checkparname(b^.ldfield.TERMINAL^.str)) 
AND not(checkrecname(b^.ldfield.TERMINAL^.str))
AND ((TSTRING_comparebegin(b^.ldfield.TERMINAL^.str,RELSTRING)<>0) OR
NOT(EXTRACT(b^.ldfield.TERMINAL^.str,4))
)
AND ((TSTRING_comparebegin(b^.ldfield.TERMINAL^.str,SIGSTRING)<>0) OR
NOT(EXTRACT(b^.ldfield.TERMINAL^.str,4))
)
AND ((TSTRING_comparebegin(b^.ldfield.TERMINAL^.str,MUSTRING)<>0) OR
NOT(EXTRACT(b^.ldfield.TERMINAL^.str,3))
)
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN str:=b^.ldfield.TERMINAL^.str END
END; END;

2 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN END
END; END;

3 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN END
END; END;

4 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN END
END; END;

Hfinal: BEGIN
 mrucomDECL_assignstatus(
TRUE
);IF mrucomDECL_status THEN BEGIN mrucomMAKET_VALUENAME(top);mrucomDECL_addnewtop(top)
; 
top^.ldfield.VALUENAMEfield^.str:=str
END
END; END;

END;

END;{package}
PACKAGE TRUECATpack: [TRUECATrule];
VAR str: TSTRING_string;

PROCEDURE TRUECATrule(a:mrucomDECL_nodeid;b:mrucomDECL_psnode;mode:mrucomDECL_surfrulemode);
BEGIN case a of Hinit:
 BEGIN END;
1 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
(TSTRING_comparechars(b^.ldfield.TERMINAL^.str,'TRUE',4)=0)
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN str:=b^.ldfield.TERMINAL^.str END
END; END;

Hfinal: BEGIN
 mrucomDECL_assignstatus(
TRUE
);IF mrucomDECL_status THEN BEGIN mrucomMAKET_TRUECAT(top);mrucomDECL_addnewtop(top)
; top^.ldfield.TRUECATfield^.str:=str END
END; END;

END;

END;{package}
PACKAGE CATCATpack: [CATCATrule];
VAR str: TSTRING_string;

PROCEDURE CATCATrule(a:mrucomDECL_nodeid;b:mrucomDECL_psnode;mode:mrucomDECL_surfrulemode);
BEGIN case a of Hinit:
 BEGIN END;
1 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
(TSTRING_comparechars(b^.ldfield.TERMINAL^.str,'CAT',3)=0)
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN str:=b^.ldfield.TERMINAL^.str END
END; END;

Hfinal: BEGIN
 mrucomDECL_assignstatus(
TRUE
);IF mrucomDECL_status THEN BEGIN mrucomMAKET_CATCAT(top);mrucomDECL_addnewtop(top)
; top^.ldfield.CATCATfield^.str:=str END
END; END;

END;

END;{package}
PACKAGE BONUSspecpack: [BONUSspecrule];

PROCEDURE BONUSspecrule(a:mrucomDECL_nodeid;b:mrucomDECL_psnode;mode:mrucomDECL_surfrulemode);
BEGIN case a of Hinit:
 BEGIN
END;
1 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
 TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN END
END; END;

2 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
 TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN END
END; END;

3 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
 TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN END
END; END;

4 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
 TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN END
END; END;

5 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
 TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN 
END
END; END;

6 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
 TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN 
END
END; END;

Hfinal: BEGIN
 mrucomDECL_assignstatus(
TRUE
);IF mrucomDECL_status THEN BEGIN mrucomMAKET_BONUSspec(top);mrucomDECL_addnewtop(top)
; 
END
END; END;

END;

END;{package}
PACKAGE DTREEpack: [DTREErule];
VAR rulenode,normalnode,variable: mrucomLANGSPEC_bool;
nrargs: mrucomLANGSPEC_int;
str1,str: TSTRING_string;
recordsvar,muvarlist,sigmavarlist,treevarlist,nodevarlist,
relvarlist: mrucomLANGSPEC_setofidents;
PROCEDURE DTREErule(a:mrucomDECL_nodeid;b:mrucomDECL_psnode;mode:mrucomDECL_surfrulemode);
 PROCEDURE APPENDSETS(S1: mrucomLANGSPEC_SETOFidents;VAR S2: mrucomLANGSPEC_SETOFidents);
VAR ident1: mrucomLANGSPEC_ident;
BEGIN
WHILE STILLidents(S1) DO
BEGIN
TAKEident(ident1,S1);
APPENDident(ident1,S2)
END
END;

BEGIN case a of Hinit:
 BEGIN initsetofidents(recordsvar);
initsetofidents(muvarlist);
initsetofidents(sigmavarlist);
initsetofidents(treevarlist);
initsetofidents(nodevarlist);
initsetofidents(relvarlist);
TSTRING_constantempty(str);
nrargs:=0;
variable:=FALSE;rulenode:=FALSE;normalnode:=FALSE;
END;
1 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN END
END; END;

2 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN END
END; END;

3 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN variable:=TRUE;
str:=b^.ldfield.TERMINAL^.str;
END
END; END;

4 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN 
APPENDSETS(b^.ldfield.DTREEfield^.records,recordsvar);
APPENDSETS(b^.ldfield.DTREEfield^.MuVarList,MuVarList);
APPENDSETS(b^.ldfield.DTREEfield^.SigmaVarList,SigmaVarList);
APPENDSETS(b^.ldfield.DTREEfield^.TreeVarList,TreeVarlist);
APPENDSETS(b^.ldfield.DTREEfield^.NodeVarList,NodeVarList);
APPENDSETS(b^.ldfield.DTREEfield^.RelVarList,relVarList);
nrargs:=nrargs+1;
END
END; END;

5 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN END
END; END;

6 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN END
END; END;

7 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN END
END; END;

8 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN str:=b^.ldfield.KEYNAMEfield^.str1;normalnode:=TRUE END
END; END;

9 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN
APPENDSETS(b^.ldfield.LABELEDTDfield^.records,recordsvar);
APPENDSETS(b^.ldfield.LABELEDTDfield^.MuVarList,MuVarList);
APPENDSETS(b^.ldfield.LABELEDTDfield^.SigmaVarList,SigmaVarList);
APPENDSETS(b^.ldfield.LABELEDTDfield^.TreeVarList,TreeVarlist);
APPENDSETS(b^.ldfield.LABELEDTDfield^.NodeVarList,NodeVarList);
APPENDSETS(b^.ldfield.LABELEDTDfield^.RelVarList,relVarList);
END
END; END;

10 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN END
END; END;

11 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN
APPENDSETS(b^.ldfield.BARETDfield^.records,recordsvar);
APPENDSETS(b^.ldfield.BARETDfield^.MuVarList,MuVarList);
APPENDSETS(b^.ldfield.BARETDfield^.SigmaVarList,SigmaVarList);
APPENDSETS(b^.ldfield.BARETDfield^.TreeVarList,TreeVarlist);
APPENDSETS(b^.ldfield.BARETDfield^.NodeVarList,NodeVarList);
APPENDSETS(b^.ldfield.BARETDfield^.RelVarList,relVarList);
END
END; END;

12 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN rulenode:=TRUE;normalnode:=TRUE;
str1:=MRUCOMDECL_Convinttostring(counter);
TSTRING_constantempty(str);
TSTRING_append(str,'_');
TSTRING_append(str,str1);
assigncounter(counter+1);
END
END; END;

13 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN END
END; END;

14 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN END
END; END;

15 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN END
END; END;

16 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN END
END; END;

17 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN END
END; END;

Hfinal: BEGIN
 mrucomDECL_assignstatus(
TRUE
);IF mrucomDECL_status THEN BEGIN mrucomMAKET_DTREE(top);mrucomDECL_addnewtop(top)
;
top^.ldfield.DTREEfield^.nrargs:=nrargs;
top^.ldfield.DTREEfield^.rulenode:=rulenode;
top^.ldfield.DTREEfield^.normalnode:=normalnode;
top^.ldfield.DTREEfield^.variable:=variable;
top^.ldfield.DTREEfield^.str:=str;
top^.ldfield.DTREEfield^.records:=recordsvar;
top^.ldfield.DTREEfield^.muvarlist:=muvarlist;
top^.ldfield.DTREEfield^.sigmavarlist:=sigmavarlist;
top^.ldfield.DTREEfield^.treevarlist:=treevarlist;
top^.ldfield.DTREEfield^.nodevarlist:=nodevarlist;
top^.ldfield.DTREEfield^.relvarlist:=relvarlist;
END
END; END;

END;

END;{package}
PACKAGE LABELEDDTREEpack: [LABELEDDTREErule];
VAR str,labelstr: TSTRING_string;
recordsvar,muvarlist,sigmavarlist,treevarlist,nodevarlist,
relvarlist: mrucomLANGSPEC_setofidents;
variable: BOOLEAN;
PROCEDURE LABELEDDTREErule(a:mrucomDECL_nodeid;b:mrucomDECL_psnode;mode:mrucomDECL_surfrulemode);
 PROCEDURE APPENDSETS(S1: mrucomLANGSPEC_SETOFidents;VAR S2: mrucomLANGSPEC_SETOFidents);
VAR ident1: mrucomLANGSPEC_ident;
BEGIN
WHILE STILLidents(S1) DO
BEGIN
TAKEident(ident1,S1);
APPENDident(ident1,S2)
END
END;

BEGIN case a of Hinit:
 BEGIN initsetofidents(recordsvar);
initsetofidents(muvarlist);
initsetofidents(sigmavarlist);
initsetofidents(treevarlist);
initsetofidents(nodevarlist);
initsetofidents(relvarlist);
TSTRING_constantempty(labelstr);
END;
1 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN END
END; END;

2 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN str:=b^.ldfield.DTREEfield^.str;
variable:=b^.ldfield.DTREEfield^.variable;
APPENDSETS(b^.ldfield.DTREEfield^.records,recordsvar);
APPENDSETS(b^.ldfield.DTREEfield^.MuVarList,MuVarList);
APPENDSETS(b^.ldfield.DTREEfield^.SigmaVarList,SigmaVarList);
APPENDSETS(b^.ldfield.DTREEfield^.TreeVarList,TreeVarlist);
APPENDSETS(b^.ldfield.DTREEfield^.NodeVarList,NodeVarList);
APPENDSETS(b^.ldfield.DTREEfield^.RelVarList,relVarList);
END
END; END;

3 : CASE mode OF
 loccond:mrucomDECL_assignstatus(
TRUE
);globcond: BEGIN
 mrucomDECL_assignstatus(
 TRUE
);IF mrucomDECL_status THEN BEGIN labelstr:=b^.ldfield.LABELtjefield^.str END
END; END;

Hfinal: BEGIN
 mrucomDECL_assignstatus(
TRUE
);IF mrucomDECL_status THEN BEGIN mrucomMAKET_LABELEDDTREE(top);mrucomDECL_addnewtop(top)
;
top^.ldfield.LABELEDDTREEfield^.variable:=variable;
top^.ldfield.LABELEDDTREEfield^.labelstr:=labelstr;
top^.ldfield.LABELEDDTREEfield^.str:=str;
top^.ldfield.LABELEDDTREEfield^.records:=recordsvar;
top^.ldfield.LABELEDDTREEfield^.muvarlist:=muvarlist;
top^.ldfield.LABELEDDTREEfield^.sigmavarlist:=sigmavarlist;
top^.ldfield.LABELEDDTREEfield^.treevarlist:=treevarlist;
top^.ldfield.LABELEDDTREEfield^.nodevarlist:=nodevarlist;
top^.ldfield.LABELEDDTREEfield^.relvarlist:=relvarlist;
END
END; END;

END;

END;{package}
 PROCEDURE mrucomRULES_init;
BEGIN
initSETOFparams(paramtable);
initsetofsyncats(syncattable);
initSETOFidents(leftrecords);
initSETOFidents(rightrecords);
initSETOFidents(otherrecords);
END;
 procedure mrucomRULES_rule(rnr:INTEGER;a:mrucomDECL_nodeid;
        b,la:mrucomDECL_psnode;mode:mrucomDECL_surfrulemode);
BEGIN
CASE rnr OF
  1:WITH UTTpack DO UTTrule(a,b,mode);
  2:WITH SUBGRAMMARSPECpack DO SUBGRAMMARSPECrule(a,b,mode);
  3:WITH GRAPHpack DO GRAPHrule(a,b,mode);
  4:WITH CONCGRAPHpack DO CONCGRAPHrule(a,b,mode);
  5:WITH ELEMENTARYGRAPHpack DO ELEMENTARYGRAPHrule(a,b,mode);
  6:WITH NUMBERpack DO NUMBERrule(a,b,mode);
  7:WITH RULESPECpack DO RULESPECrule(a,b,mode);
  8:WITH FILTERSPECpack DO FILTERSPECrule(a,b,mode);
  9:WITH LEFTMODELSpack DO LEFTMODELSrule(a,b,mode);
 10:WITH RIGHTMODELpack DO RIGHTMODELrule(a,b,mode);
 11:WITH LABELEDTDpack DO LABELEDTDrule(a,b,mode);
 12:WITH BARETDpack DO BARETDrule(a,b,mode);
 13:WITH LABELEDNDpack DO LABELEDNDrule(a,b,mode);
 14:WITH LABELEDLDpack DO LABELEDLDrule(a,b,mode);
 15:WITH BARENDpack DO BARENDrule(a,b,mode);
 16:WITH BARELDpack DO BARELDrule(a,b,mode);
 17:WITH ITEMpack DO ITEMrule(a,b,mode);
 18:WITH LABELEDITEMpack DO LABELEDITEMrule(a,b,mode);
 19:WITH BAREITEMpack DO BAREITEMrule(a,b,mode);
 20:WITH LDpack DO LDrule(a,b,mode);
 21:WITH RTDpack DO RTDrule(a,b,mode);
 22:WITH RELDpack DO RELDrule(a,b,mode);
 23:WITH MATCHCONDSpack DO MATCHCONDSrule(a,b,mode);
 24:WITH ANDCONDpack DO ANDCONDrule(a,b,mode);
 25:WITH ORCONDpack DO ORCONDrule(a,b,mode);
 26:WITH ELEMENTARYCONDpack DO ELEMENTARYCONDrule(a,b,mode);
 27:WITH BOOLEANEXPRpack DO BOOLEANEXPRrule(a,b,mode);
 28:WITH MATCHBOOLEANpack DO MATCHBOOLEANrule(a,b,mode);
 29:WITH PARAMETERSspecpack DO PARAMETERSspecrule(a,b,mode);
 30:WITH ASSIGNRECORDpack DO ASSIGNRECORDrule(a,b,mode);
 31:WITH CONDRECORDpack DO CONDRECORDrule(a,b,mode);
 32:WITH SUBRULESpack DO SUBRULESrule(a,b,mode);
 33:WITH SUBFILTERSpack DO SUBFILTERSrule(a,b,mode);
 34:WITH LEFTSUBMODELSpack DO LEFTSUBMODELSrule(a,b,mode);
 35:WITH RIGHTSUBMODELSpack DO RIGHTSUBMODELSrule(a,b,mode);
 36:WITH COMCAPAIRSpack DO COMCAPAIRSrule(a,b,mode);
 37:WITH DECOMCAPAIRSpack DO DECOMCAPAIRSrule(a,b,mode);
 38:WITH CAPAIRSpack DO CAPAIRSrule(a,b,mode);
 39:WITH bareCAPAIRSpack DO bareCAPAIRSrule(a,b,mode);
 40:WITH CONDITIONpack DO CONDITIONrule(a,b,mode);
 41:WITH ACTIONpack DO ACTIONrule(a,b,mode);
 42:WITH STATEMENTSpack DO STATEMENTSrule(a,b,mode);
 43:WITH KEYNAMEpack DO KEYNAMErule(a,b,mode);
 44:WITH TREEVARpack DO TREEVARrule(a,b,mode);
 45:WITH MUVARpack DO MUVARrule(a,b,mode);
 46:WITH SIGMAVARpack DO SIGMAVARrule(a,b,mode);
 47:WITH NODEVARpack DO NODEVARrule(a,b,mode);
 48:WITH RELVARpack DO RELVARrule(a,b,mode);
 49:WITH CLABELpack DO CLABELrule(a,b,mode);
 50:WITH ALABELpack DO ALABELrule(a,b,mode);
 51:WITH ILABELtjepack DO ILABELtjerule(a,b,mode);
 52:WITH MLABELtjepack DO MLABELtjerule(a,b,mode);
 53:WITH RLABELtjepack DO RLABELtjerule(a,b,mode);
 54:WITH LLABELtjepack DO LLABELtjerule(a,b,mode);
 55:WITH LABELtjepack DO LABELtjerule(a,b,mode);
 56:WITH CATNAMEpack DO CATNAMErule(a,b,mode);
 57:WITH CATRECNAMEpack DO CATRECNAMErule(a,b,mode);
 58:WITH RELNAMEpack DO RELNAMErule(a,b,mode);
 59:WITH PARNAMEpack DO PARNAMErule(a,b,mode);
 60:WITH PARTYPEpack DO PARTYPErule(a,b,mode);
 61:WITH PASCALSTATEMENTpack DO PASCALSTATEMENTrule(a,b,mode);
 62:WITH PASCALEXPRpack DO PASCALEXPRrule(a,b,mode);
 63:WITH VARNAMEpack DO VARNAMErule(a,b,mode);
 64:WITH SETVALUENAMEpack DO SETVALUENAMErule(a,b,mode);
 65:WITH VALUENAMEpack DO VALUENAMErule(a,b,mode);
 66:WITH TRUECATpack DO TRUECATrule(a,b,mode);
 67:WITH CATCATpack DO CATCATrule(a,b,mode);
 68:WITH BONUSspecpack DO BONUSspecrule(a,b,mode);
 69:WITH DTREEpack DO DTREErule(a,b,mode);
 70:WITH LABELEDDTREEpack DO LABELEDDTREErule(a,b,mode);
END
END;
