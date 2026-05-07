EXPORT(afxprcode);
pragma C_include('afxprcode.pf');
pragma C_include('afxprdecl.pf');
pragma C_include('afxprlangspec.pf');
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
PROGRAM afxprCODE;
WITH afxprlangspec,
afxprdecl,ldtypetostr,lduniquerels,ldmrules,files,tfiles,tstring,lidomaint,str,mem,
tldstrtostr,ldconvrec,tldconvrec,ldstrtotype,ldcatsets,strng;
VAR EXPR__Succ              :afxprlangspec_SETOFatomnodes
;LEAVE__Succ              :afxprlangspec_SETOFatomnodes
;ROUND__Succ              :afxprlangspec_SETOFatomnodes
;REP__Succ              :afxprlangspec_SETOFatomnodes
;LOR__Succ              :afxprlangspec_SETOFatomnodes
;LOPT__Succ              :afxprlangspec_SETOFatomnodes
;LAND__Succ              :afxprlangspec_SETOFatomnodes
;of1:files_text;
PROCEDURE afxprCODE_UTTproc(top:afxprDECL_psnode
);
VAR currenttree:afxprDECL_psnode;
    rsnode1:afxprDECL_prsnode;

s : afxprLANGSPEC_SETOFatomnodes;
AtomStr,
a : afxprLANGSPEC_atomnode;
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

BEGIN
END
END;

2: begin
  
BEGIN
END
;

BEGIN
END
END;

3: begin
  
BEGIN
TFILES_Open(of1, 'ldsucc', 6, 3);
BEGIN
 
TFILES_writestr(of1,
'EXPORT(LDSUCC);',FILES_maxIO,0,left);

TFILES_writeline(of1,TRUE);


TFILES_writestr(of1,
'pragma C_include(''mem.pf'');',FILES_maxIO,0,left);

 TFILES_writeline(of1,TRUE);


TFILES_writestr(of1,
'pragma C_include(''lsdomaint.pf'');',FILES_maxIO,0,left);

 TFILES_writeline(of1,TRUE);

 
TFILES_writestr(of1,
'pragma C_include(''ldsucc.pf'');',FILES_maxIO,0,left);

 TFILES_writeline(of1,TRUE);

 TFILES_writeline(of1,TRUE);


TFILES_writestr(of1,
'PROGRAM LDSUCC;',FILES_maxIO,0,left);

 TFILES_writeline(of1,TRUE);


TFILES_writestr(of1,
'WITH MEM, LSDOMAINT;',FILES_maxIO,0,left);

 TFILES_writeline(of1,TRUE);

 TFILES_writeline(of1,TRUE);


TFILES_writestr(of1,
'VAR FirstItems : LDSUCC_ItemSetType;',FILES_maxIO,0,left);

 TFILES_writeline(of1,TRUE);


TFILES_writeline(of1,TRUE);


TFILES_writestr(of1,
'PROCEDURE LDSUCC_INITSETOFItems(VAR items:LDSUCC_ItemSetType);',FILES_maxIO,0,left);

 TFILES_writeline(of1,TRUE);


TFILES_writestr(of1,
'BEGIN',FILES_maxIO,0,left);

TFILES_writeline(of1,TRUE);


TAB(of1, 3); TFILES_writestr(of1,
'items.first := NIL; items.last := NIL;',FILES_maxIO,0,left);

 TFILES_writeline(of1,TRUE);


TFILES_writestr(of1,
'END; {LDSUCC_INITSETOFItems}',FILES_maxIO,0,left);

TFILES_writeline(of1,TRUE);


TFILES_writeline(of1,TRUE);


TFILES_writestr(of1,
'FUNCTION LDSUCC_STILLItems(items:LDSUCC_ItemSetType): BOOLEAN;',FILES_maxIO,0,left);

 TFILES_writeline(of1,TRUE);


TFILES_writestr(of1,
'BEGIN',FILES_maxIO,0,left);

TFILES_writeline(of1,TRUE);


TAB(of1, 3); TFILES_writestr(of1,
'LDSUCC_STILLItems := NOT((items.first=NIL ) AND (items.last=NIL));',FILES_maxIO,0,left);

TFILES_writeline(of1,TRUE);


TFILES_writestr(of1,
'END; {LDSUCC_STILLItems}',FILES_maxIO,0,left);

TFILES_writeline(of1,TRUE);


TFILES_writeline(of1,TRUE);


TFILES_writestr(of1,
'PROCEDURE LDSUCC_APPENDItem(afx, afxid: INTEGER;',FILES_maxIO,0,left);

TFILES_writeline(of1,TRUE);


TAB(of1, 25); TFILES_writestr(of1,
'VAR items:LDSUCC_ItemSetType);',FILES_maxIO,0,left);

 TFILES_writeline(of1,TRUE);


TFILES_writestr(of1,
'VAR n: LDSUCC_pItemType;',FILES_maxIO,0,left);

TFILES_writeline(of1,TRUE);


TFILES_writestr(of1,
'BEGIN',FILES_maxIO,0,left);

TFILES_writeline(of1,TRUE);


TAB(of1, 3); TFILES_writestr(of1,
'MEM_NewDefault(loopholes.SIZEof(LDSUCC_ItemType), loopholes.retype(n,Mem_Ptr));',FILES_maxIO,0,left);

TFILES_writeline(of1,TRUE);


TAB(of1, 3); TFILES_writestr(of1,
'WITH n^ DO BEGIN',FILES_maxIO,0,left);

 TFILES_writeline(of1,TRUE);


TAB(of1, 6); TFILES_writestr(of1,
'afxkey := afx; afxnode := afxid; nxt := NIL',FILES_maxIO,0,left);

TFILES_writeline(of1,TRUE);


TAB(of1, 3); TFILES_writestr(of1,
'END;',FILES_maxIO,0,left);

TFILES_writeline(of1,TRUE);


TAB(of1, 3); TFILES_writestr(of1,
'IF items.first = NIL THEN BEGIN',FILES_maxIO,0,left);

 TFILES_writeline(of1,TRUE);


TAB(of1, 6); TFILES_writestr(of1,
'items.first := n; items.last := items.first;',FILES_maxIO,0,left);

TFILES_writeline(of1,TRUE);


TAB(of1, 6); TFILES_writestr(of1,
'END',FILES_maxIO,0,left);

TFILES_writeline(of1,TRUE);


TAB(of1, 3); TFILES_writestr(of1,
'ELSE BEGIN',FILES_maxIO,0,left);

 TFILES_writeline(of1,TRUE);


TAB(of1, 6); TFILES_writestr(of1,
'items.last^.nxt := n; items.last := n;',FILES_maxIO,0,left);

 TFILES_writeline(of1,TRUE);


TAB(of1, 3); TFILES_writestr(of1,
'END',FILES_maxIO,0,left);

 TFILES_writeline(of1,TRUE);


TFILES_writestr(of1,
'END; {LDSUCC_APPENDItem}',FILES_maxIO,0,left);

TFILES_writeline(of1,TRUE);


TFILES_writeline(of1,TRUE);


TFILES_writestr(of1,
'PROCEDURE LDSUCC_TAKEItem(VAR afx, afxid: INTEGER; ',FILES_maxIO,0,left);

TFILES_writeline(of1,TRUE);


TAB(of1, 25); TFILES_writestr(of1,
'VAR items:LDSUCC_ItemSetType);',FILES_maxIO,0,left);

 TFILES_writeline(of1,TRUE);


TFILES_writestr(of1,
'BEGIN',FILES_maxIO,0,left);

TFILES_writeline(of1,TRUE);


TAB(of1, 3); TFILES_writestr(of1,
'WITH items.first^ DO BEGIN',FILES_maxIO,0,left);

 TFILES_writeline(of1,TRUE);


TAB(of1, 6); TFILES_writestr(of1,
'afx := afxkey; afxid := afxnode',FILES_maxIO,0,left);

TFILES_writeline(of1,TRUE);


TAB(of1, 3); TFILES_writestr(of1,
'END;',FILES_maxIO,0,left);

TFILES_writeline(of1,TRUE);


TAB(of1, 3); TFILES_writestr(of1,
'IF items.last = items.first THEN BEGIN',FILES_maxIO,0,left);

 TFILES_writeline(of1,TRUE);


TAB(of1, 6); TFILES_writestr(of1,
'items.first := NIL; items.last := items.first;',FILES_maxIO,0,left);

TFILES_writeline(of1,TRUE);


TAB(of1, 6); TFILES_writestr(of1,
'END',FILES_maxIO,0,left);

TFILES_writeline(of1,TRUE);


TAB(of1, 3); TFILES_writestr(of1,
'ELSE BEGIN',FILES_maxIO,0,left);

 TFILES_writeline(of1,TRUE);


TAB(of1, 6); TFILES_writestr(of1,
'items.first := items.first^.nxt;',FILES_maxIO,0,left);

 TFILES_writeline(of1,TRUE);


TAB(of1, 3); TFILES_writestr(of1,
'END;',FILES_maxIO,0,left);

 TFILES_writeline(of1,TRUE);


TFILES_writestr(of1,
'END; {LDSUCC_TAKEItem}',FILES_maxIO,0,left);

TFILES_writeline(of1,TRUE);


TFILES_writeline(of1,TRUE);


TFILES_writestr(of1,
'FUNCTION LDSUCC_UNIONItems(items1, items2: LDSUCC_ItemSetType):',FILES_maxIO,0,left);

TFILES_writeline(of1,TRUE);


TAB(of1, 25); TFILES_writestr(of1,
'LDSUCC_ItemSetType;',FILES_maxIO,0,left);

 TFILES_writeline(of1,TRUE);


TFILES_writestr(of1,
'VAR n: LDSUCC_pItemType;',FILES_maxIO,0,left);

TFILES_writeline(of1,TRUE);


TAB(of1, 5); TFILES_writestr(of1,
'items3: LDSUCC_ItemSetType;',FILES_maxIO,0,left);

TFILES_writeline(of1,TRUE);


TAB(of1, 5); TFILES_writestr(of1,
'a1, a2: INTEGER;',FILES_maxIO,0,left);

TFILES_writeline(of1,TRUE);


TFILES_writestr(of1,
'BEGIN',FILES_maxIO,0,left);

TFILES_writeline(of1,TRUE);


TAB(of1, 3); TFILES_writestr(of1,
'items3 := items1;',FILES_maxIO,0,left);

TFILES_writeline(of1,TRUE);


TAB(of1, 3); TFILES_writestr(of1,
'WHILE LDSUCC_STILLItems(items2) DO BEGIN',FILES_maxIO,0,left);

 TFILES_writeline(of1,TRUE);


TAB(of1, 6); TFILES_writestr(of1,
'LDSUCC_TAKEItem(a1, a2, items2);',FILES_maxIO,0,left);

TFILES_writeline(of1,TRUE);


TAB(of1, 6); TFILES_writestr(of1,
'LDSUCC_APPENDItem(a1, a2, items3);',FILES_maxIO,0,left);

TFILES_writeline(of1,TRUE);


TAB(of1, 3); TFILES_writestr(of1,
'END;',FILES_maxIO,0,left);

TFILES_writeline(of1,TRUE);


TAB(of1, 3); TFILES_writestr(of1,
'LDSUCC_UNIONItems := items3;',FILES_maxIO,0,left);

 TFILES_writeline(of1,TRUE);


TFILES_writestr(of1,
'END; {LDSUCC_APPENDItem}',FILES_maxIO,0,left);

TFILES_writeline(of1,TRUE);


TFILES_writeline(of1,TRUE);


TFILES_writestr(of1,
'PROCEDURE LDSUCC_ReduceItems(afx: INTEGER; S1: LDSUCC_ItemSetType;',FILES_maxIO,0,left);

TFILES_writeline(of1,TRUE);


TAB(of1, 25); TFILES_writestr(of1,
'VAR S2: LDSUCC_ItemSetType);',FILES_maxIO,0,left);

TFILES_writeline(of1,TRUE);


TFILES_writestr(of1,
'VAR',FILES_maxIO,0,left);

TFILES_writeline(of1,TRUE);


TAB(of1,3); TFILES_writestr(of1,
'k1, k2: INTEGER;',FILES_maxIO,0,left);

TFILES_writeline(of1,TRUE);


TFILES_writestr(of1,
'BEGIN',FILES_maxIO,0,left);

TFILES_writeline(of1,TRUE);


TAB(of1,3); TFILES_writestr(of1,
'LDSUCC_InitSetOfItems(S2);',FILES_maxIO,0,left);

TFILES_writeline(of1,TRUE);


TAB(of1,3); TFILES_writestr(of1,
'WHILE LDSUCC_StillItems(S1) DO BEGIN',FILES_maxIO,0,left);

TFILES_writeline(of1,TRUE);


TAB(of1,6); TFILES_writestr(of1,
'LDSUCC_TAKEItem(k1, k2, S1);',FILES_maxIO,0,left);

TFILES_writeline(of1,TRUE);


TAB(of1,6); TFILES_writestr(of1,
'IF afx = k1 THEN LDSUCC_AppendItem(k1, k2, S2);',FILES_maxIO,0,left);

TFILES_writeline(of1,TRUE);


TAB(of1,3); TFILES_writestr(of1,
'END;',FILES_maxIO,0,left);

TFILES_writeline(of1,TRUE);


TFILES_writestr(of1,
'END {LDSUCC_ReduceItems};',FILES_maxIO,0,left);

TFILES_writeline(of1,TRUE);


TFILES_writeline(of1,TRUE);


TFILES_writestr(of1,
'FUNCTION LDSUCC_Succ(afx: INTEGER): LDSUCC_ItemSetType;',FILES_maxIO,0,left);

 TFILES_writeline(of1,TRUE);


TFILES_writestr(of1,
'VAR',FILES_maxIO,0,left);

 TFILES_writeline(of1,TRUE);


TFILES_writestr(of1,
' result : LDSUCC_ItemSetType;',FILES_maxIO,0,left);

 TFILES_writeline(of1,TRUE);


TFILES_writestr(of1,
'BEGIN',FILES_maxIO,0,left);

 TFILES_writeline(of1,TRUE);


TAB(of1, 3); TFILES_writestr(of1,
'LDSUCC_INITSETOFItems(result);',FILES_maxIO,0,left);

 TFILES_writeline(of1,TRUE);


TAB(of1, 3); TFILES_writestr(of1,
'CASE afx OF',FILES_maxIO,0,left);

 TFILES_writeline(of1,TRUE);


TAB(of1, 3); TFILES_writestr(of1,
'LDSUCC_FirstAffix : BEGIN',FILES_maxIO,0,left);

 TFILES_writeline(of1,TRUE);


s := currenttree^.ldfield.EXPRfield^.First;
WHILE STILLatomnodes(s) DO BEGIN
TAKEatomnode(a, s);
TAB(of1, 15); 
TFILES_writestr(of1,
'LDSUCC_APPENDItem(',FILES_maxIO,0,left);


TFILES_writestring(of1,
a.str,0,left);

 TFILES_writestr(of1,
',',FILES_maxIO,0,left);


TFILES_writeinteger(of1,
a.afxid,0,left);

 TFILES_writestr(of1,
', result);',FILES_maxIO,0,left);

 TFILES_writeline(of1,TRUE);


END;
IF currenttree^.ldfield.EXPRfield^.Eps THEN BEGIN
TFILES_writestr(of1,
'LDSUCC_APPENDItem(LDSUCC_TrailerAffix, LDSUCC_TrailerAffix, result);',FILES_maxIO,0,left);

 TFILES_writeline(of1,TRUE);


END;
TAB(of1, 15); TFILES_writestr(of1,
'END;',FILES_maxIO,0,left);

 TFILES_writeline(of1,TRUE);


END;
INITsetofatomnodes(EXPR__Succ);
AtomStr.str := 'LDSUCC_TrailerAffix';
AtomStr.afxid := -1;
APPENDatomnode(AtomStr, EXPR__Succ);
END
; afxprCODE_EXPRproc(currenttree
,EXPR__Succ
);

BEGIN
BEGIN
 
TAB(of1, 3); TFILES_writestr(of1,
'END {CASE};',FILES_maxIO,0,left);

 TFILES_writeline(of1,TRUE);


TAB(of1, 3); TFILES_writestr(of1,
'LDSUCC_Succ := result;',FILES_maxIO,0,left);

 TFILES_writeline(of1,TRUE);


TFILES_writestr(of1,
'END {LDSUCC_Succ};',FILES_maxIO,0,left);

 TFILES_writeline(of1,TRUE);


TFILES_writeline(of1,TRUE);


TFILES_writestr(of1,
'PROCEDURE LDSUCC_PredictItems(S1: LDSUCC_ItemSetType;',FILES_maxIO,0,left);

TFILES_writeline(of1,TRUE);


TAB(of1,25); TFILES_writestr(of1,
'VAR S2: LDSUCC_ItemSetType);',FILES_maxIO,0,left);

TFILES_writeline(of1,TRUE);


TFILES_writestr(of1,
'VAR',FILES_maxIO,0,left);

TFILES_writeline(of1,TRUE);


TAB(of1,3); TFILES_writestr(of1,
'k1, k2: INTEGER;',FILES_maxIO,0,left);

TFILES_writeline(of1,TRUE);


TFILES_writestr(of1,
'BEGIN',FILES_maxIO,0,left);

TFILES_writeline(of1,TRUE);


TAB(of1,3); TFILES_writestr(of1,
'LDSUCC_InitSetOfItems(S2);',FILES_maxIO,0,left);

TFILES_writeline(of1,TRUE);


TAB(of1,3); TFILES_writestr(of1,
'WHILE LDSUCC_StillItems(S1) DO BEGIN',FILES_maxIO,0,left);

TFILES_writeline(of1,TRUE);


TAB(of1,6); TFILES_writestr(of1,
'LDSUCC_TAKEItem(k1, k2, S1);',FILES_maxIO,0,left);

TFILES_writeline(of1,TRUE);


TAB(of1,6); TFILES_writestr(of1,
'S2 := LDSUCC_UNIONItems(S2, LDSUCC_Succ(k2));',FILES_maxIO,0,left);

TFILES_writeline(of1,TRUE);


TAB(of1,3); TFILES_writestr(of1,
'END;',FILES_maxIO,0,left);

TFILES_writeline(of1,TRUE);


TFILES_writestr(of1,
'END {LDSUCC_PredictItems};',FILES_maxIO,0,left);

TFILES_writeline(of1,TRUE);


TFILES_writeline(of1,TRUE);


TFILES_writestr(of1,
'PROCEDURE LDSUCC_Init;',FILES_maxIO,0,left);

 TFILES_writeline(of1,TRUE);


TFILES_writestr(of1,
'BEGIN',FILES_maxIO,0,left);

TFILES_writeline(of1,TRUE);


TAB(of1, 3); TFILES_writestr(of1,
'FirstItems := LDSUCC_Succ(LDSUCC_FirstAffix);',FILES_maxIO,0,left);

 TFILES_writeline(of1,TRUE);


TFILES_writestr(of1,
'END; {LDSUCC_Init}',FILES_maxIO,0,left);

TFILES_writeline(of1,TRUE);


TFILES_writeline(of1,TRUE);


TFILES_writestr(of1,
'FUNCTION LDSUCC_FirstItems: LDSUCC_ItemSetType;',FILES_maxIO,0,left);

 TFILES_writeline(of1,TRUE);


TFILES_writestr(of1,
'BEGIN',FILES_maxIO,0,left);

TFILES_writeline(of1,TRUE);


TAB(of1, 3); TFILES_writestr(of1,
'LDSUCC_FirstItems := FirstItems;',FILES_maxIO,0,left);

 TFILES_writeline(of1,TRUE);


TFILES_writestr(of1,
'END; {LDSUCC_FirstItems}',FILES_maxIO,0,left);

TFILES_writeline(of1,TRUE);


TFILES_writeline(of1,TRUE);


END;
END
END;

END;

rsnode1:=rsnode1^.brother END;
 BEGIN
END
END;
PROCEDURE afxprCODE_EXPRproc(top:afxprDECL_psnode
;EXPR_Succ              :afxprlangspec_SETOFatomnodes
);
VAR currenttree:afxprDECL_psnode;
    rsnode1:afxprDECL_prsnode;

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
ROUND__Succ := EXPR_Succ
END
; afxprCODE_ROUNDproc(currenttree
,ROUND__Succ
);

BEGIN
END
END;

2: begin
  
BEGIN
LAND__Succ := EXPR_Succ
END
; afxprCODE_LANDproc(currenttree
,LAND__Succ
);

BEGIN
END
END;

3: begin
  
BEGIN
LOR__Succ := EXPR_Succ
END
; afxprCODE_LORproc(currenttree
,LOR__Succ
);

BEGIN
END
END;

4: begin
  
BEGIN
LOPT__Succ := EXPR_Succ
END
; afxprCODE_LOPTproc(currenttree
,LOPT__Succ
);

BEGIN
END
END;

5: begin
  
BEGIN
REP__Succ := EXPR_Succ
END
; afxprCODE_REPproc(currenttree
,REP__Succ
);

BEGIN
END
END;

6: begin
  
BEGIN
LEAVE__Succ := EXPR_Succ
END
; afxprCODE_LEAVEproc(currenttree
,LEAVE__Succ
);

BEGIN
END
END;

END;

rsnode1:=rsnode1^.brother END;
 BEGIN
END
END;
PROCEDURE afxprCODE_ROUNDproc(top:afxprDECL_psnode
;ROUND_Succ              :afxprlangspec_SETOFatomnodes
);
VAR currenttree:afxprDECL_psnode;
    rsnode1:afxprDECL_prsnode;

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
EXPR__Succ := ROUND_Succ
END
; afxprCODE_EXPRproc(currenttree
,EXPR__Succ
);

BEGIN
END
END;

10: begin
  
BEGIN
END
;

BEGIN
END
END;

11: begin
  
BEGIN
END
;

BEGIN
END
END;

END;

rsnode1:=rsnode1^.brother END;
 BEGIN
END
END;
PROCEDURE afxprCODE_LANDproc(top:afxprDECL_psnode
;LAND_Succ              :afxprlangspec_SETOFatomnodes
);
VAR currenttree:afxprDECL_psnode;
    rsnode1:afxprDECL_prsnode;

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
EXPR__Succ := top^.ldfield.LANDfield^.First2;
IF top^.ldfield.LANDfield^.Eps2 THEN BEGIN
EXPR__Succ := Union(EXPR__Succ, LAND_Succ);
END
END
; afxprCODE_EXPRproc(currenttree
,EXPR__Succ
);

BEGIN
END
END;

2: begin
  
BEGIN
EXPR__Succ := LAND_Succ;
END
; afxprCODE_EXPRproc(currenttree
,EXPR__Succ
);

BEGIN
END
END;

10: begin
  
BEGIN
END
;

BEGIN
END
END;

END;

rsnode1:=rsnode1^.brother END;
 BEGIN
END
END;
PROCEDURE afxprCODE_LORproc(top:afxprDECL_psnode
;LOR_Succ              :afxprlangspec_SETOFatomnodes
);
VAR currenttree:afxprDECL_psnode;
    rsnode1:afxprDECL_prsnode;

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
EXPR__Succ := LOR_Succ;
END
; afxprCODE_EXPRproc(currenttree
,EXPR__Succ
);

BEGIN
END
END;

2: begin
  
BEGIN
EXPR__Succ := LOR_Succ;
END
; afxprCODE_EXPRproc(currenttree
,EXPR__Succ
);

BEGIN
END
END;

10: begin
  
BEGIN
END
;

BEGIN
END
END;

END;

rsnode1:=rsnode1^.brother END;
 BEGIN
END
END;
PROCEDURE afxprCODE_LOPTproc(top:afxprDECL_psnode
;LOPT_Succ              :afxprlangspec_SETOFatomnodes
);
VAR currenttree:afxprDECL_psnode;
    rsnode1:afxprDECL_prsnode;

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
EXPR__Succ := LOPT_Succ;
END
; afxprCODE_EXPRproc(currenttree
,EXPR__Succ
);

BEGIN
END
END;

10: begin
  
BEGIN
END
;

BEGIN
END
END;

11: begin
  
BEGIN
END
;

BEGIN
END
END;

END;

rsnode1:=rsnode1^.brother END;
 BEGIN
END
END;
PROCEDURE afxprCODE_REPproc(top:afxprDECL_psnode
;REP_Succ              :afxprlangspec_SETOFatomnodes
);
VAR currenttree:afxprDECL_psnode;
    rsnode1:afxprDECL_prsnode;

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
EXPR__Succ := Union(REP_Succ, top^.ldfield.REPfield^.First);
END
; afxprCODE_EXPRproc(currenttree
,EXPR__Succ
);

BEGIN
END
END;

10: begin
  
BEGIN
END
;

BEGIN
END
END;

11: begin
  
BEGIN
END
;

BEGIN
END
END;

END;

rsnode1:=rsnode1^.brother END;
 BEGIN
END
END;
PROCEDURE afxprCODE_LEAVEproc(top:afxprDECL_psnode
;LEAVE_Succ              :afxprlangspec_SETOFatomnodes
);
VAR currenttree:afxprDECL_psnode;
    rsnode1:afxprDECL_prsnode;

AtomStr : afxprLANGSPEC_atomnode; 
str : TSTRING_String;
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
TAKEatomnode(AtomStr, top^.ldfield.LEAVEfield^.First);
BEGIN

TAB(of1, 3); TFILES_writeinteger(of1,
AtomStr.afxid,0,left);


TFILES_writestr(of1,
'{',FILES_maxIO,0,left);

 TFILES_writestring(of1,
AtomStr.str,0,left);

 TFILES_writestr(of1,
'}',FILES_maxIO,0,left);


TFILES_writestr(of1,
' : BEGIN',FILES_maxIO,0,left);

 TFILES_writeline(of1,TRUE);


WHILE STILLatomnodes(LEAVE_Succ) DO BEGIN
TAKEatomnode(AtomStr, LEAVE_Succ);
TAB(of1, 15); 
TFILES_writestr(of1,
'LDSUCC_APPENDItem(',FILES_maxIO,0,left);


TFILES_writestring(of1,
ATOMStr.str,0,left);

 TFILES_writestr(of1,
',',FILES_maxIO,0,left);


TFILES_writeinteger(of1,
ATOMStr.afxid,0,left);

 TFILES_writestr(of1,
', result);',FILES_maxIO,0,left);

 TFILES_writeline(of1,TRUE);


END;
TAB(of1, 15); TFILES_writestr(of1,
'END;',FILES_maxIO,0,left);

 TFILES_writeline(of1,TRUE);


END;
END
;

BEGIN
END
END;

END;

rsnode1:=rsnode1^.brother END;
 BEGIN
END
END;
