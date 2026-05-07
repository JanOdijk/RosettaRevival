EXPORT(LDSUCC);
pragma C_include('mem.pf');
pragma C_include('lsdomaint.pf');
pragma C_include('ldsucc.pf');

PROGRAM LDSUCC;
WITH MEM, LSDOMAINT;

VAR FirstItems : LDSUCC_ItemSetType;

PROCEDURE LDSUCC_INITSETOFItems(VAR items:LDSUCC_ItemSetType);
BEGIN
   items.first := NIL; items.last := NIL;
END; {LDSUCC_INITSETOFItems}

FUNCTION LDSUCC_STILLItems(items:LDSUCC_ItemSetType): BOOLEAN;
BEGIN
   LDSUCC_STILLItems := NOT((items.first=NIL ) AND (items.last=NIL));
END; {LDSUCC_STILLItems}

PROCEDURE LDSUCC_APPENDItem(afx, afxid: INTEGER;
                         VAR items:LDSUCC_ItemSetType);
VAR n: LDSUCC_pItemType;
BEGIN
   MEM_NewDefault(loopholes.SIZEof(LDSUCC_ItemType), loopholes.retype(n,Mem_Ptr));
   WITH n^ DO BEGIN
      afxkey := afx; afxnode := afxid; nxt := NIL
   END;
   IF items.first = NIL THEN BEGIN
      items.first := n; items.last := items.first;
      END
   ELSE BEGIN
      items.last^.nxt := n; items.last := n;
   END
END; {LDSUCC_APPENDItem}

PROCEDURE LDSUCC_TAKEItem(VAR afx, afxid: INTEGER; 
                         VAR items:LDSUCC_ItemSetType);
BEGIN
   WITH items.first^ DO BEGIN
      afx := afxkey; afxid := afxnode
   END;
   IF items.last = items.first THEN BEGIN
      items.first := NIL; items.last := items.first;
      END
   ELSE BEGIN
      items.first := items.first^.nxt;
   END;
END; {LDSUCC_TAKEItem}

FUNCTION LDSUCC_UNIONItems(items1, items2: LDSUCC_ItemSetType):
                         LDSUCC_ItemSetType;
VAR n: LDSUCC_pItemType;
     items3: LDSUCC_ItemSetType;
     a1, a2: INTEGER;
BEGIN
   items3 := items1;
   WHILE LDSUCC_STILLItems(items2) DO BEGIN
      LDSUCC_TAKEItem(a1, a2, items2);
      LDSUCC_APPENDItem(a1, a2, items3);
   END;
   LDSUCC_UNIONItems := items3;
END; {LDSUCC_APPENDItem}

PROCEDURE LDSUCC_ReduceItems(afx: INTEGER; S1: LDSUCC_ItemSetType;
                         VAR S2: LDSUCC_ItemSetType);
VAR
   k1, k2: INTEGER;
BEGIN
   LDSUCC_InitSetOfItems(S2);
   WHILE LDSUCC_StillItems(S1) DO BEGIN
      LDSUCC_TAKEItem(k1, k2, S1);
      IF afx = k1 THEN LDSUCC_AppendItem(k1, k2, S2);
   END;
END {LDSUCC_ReduceItems};

FUNCTION LDSUCC_Succ(afx: INTEGER): LDSUCC_ItemSetType;
VAR
 result : LDSUCC_ItemSetType;
BEGIN
   LDSUCC_INITSETOFItems(result);
   CASE afx OF
   LDSUCC_FirstAffix : BEGIN
               LDSUCC_APPENDItem(SFKAM,1, result);
               LDSUCC_APPENDItem(SFKIS,2, result);
               LDSUCC_APPENDItem(SFKWAS,3, result);
               LDSUCC_APPENDItem(SFKARE,4, result);
               LDSUCC_APPENDItem(SFKWERE,5, result);
               LDSUCC_APPENDItem(SFKIRRPP,6, result);
               LDSUCC_APPENDItem(SFKIRRING,7, result);
               LDSUCC_APPENDItem(SFKIRRPTPP,8, result);
               LDSUCC_APPENDItem(SFKIRRS,9, result);
               LDSUCC_APPENDItem(SFKMODPT,10, result);
               LDSUCC_APPENDItem(SFKIRRNC,11, result);
               LDSUCC_APPENDItem(SFKIRRPT,12, result);
               LDSUCC_APPENDItem(SFKIRRPT2,13, result);
               LDSUCC_APPENDItem(SFKIRRPP2,14, result);
               LDSUCC_APPENDItem(SFKIRRPP3,15, result);
               LDSUCC_APPENDItem(SFKREGPTPP,16, result);
               LDSUCC_APPENDItem(SFKCDPTPP,17, result);
               LDSUCC_APPENDItem(SFKCDING,18, result);
               LDSUCC_APPENDItem(SFKREGING,19, result);
               LDSUCC_APPENDItem(SFKREGS,20, result);
               LDSUCC_APPENDItem(SFKREGES,21, result);
               LDSUCC_APPENDItem(SFKIRRCOMP,22, result);
               LDSUCC_APPENDItem(SFKIRRSUPER,23, result);
               LDSUCC_APPENDItem(SFKREGLY,24, result);
               LDSUCC_APPENDItem(SFKIRRCOMP,25, result);
               LDSUCC_APPENDItem(SFKIRRSUPER,26, result);
               LDSUCC_APPENDItem(SFKIRREGLY,27, result);
               LDSUCC_APPENDItem(SFKNOLY,28, result);
               LDSUCC_APPENDItem(SFKREGABLE,29, result);
               LDSUCC_APPENDItem(SFKCDABLE,30, result);
               LDSUCC_APPENDItem(SFKTRUNCABLE,31, result);
               LDSUCC_APPENDItem(SFKVOICINGS,32, result);
               LDSUCC_APPENDItem(SFKIRRPLUR,33, result);
               LDSUCC_APPENDItem(SFKLATPLUR,34, result);
               LDSUCC_APPENDItem(SFKIRRCOMP,35, result);
               LDSUCC_APPENDItem(SFKIRRSUPER,36, result);
               LDSUCC_APPENDItem(SFKIRRCOMP2,37, result);
               LDSUCC_APPENDItem(SFKIRRSUPER2,38, result);
               LDSUCC_APPENDItem(SFKCDCOMP,39, result);
               LDSUCC_APPENDItem(SFKCDSUPER,40, result);
               LDSUCC_APPENDItem(SFKREGCOMP,41, result);
               LDSUCC_APPENDItem(SFKREGSUPER,42, result);
               LDSUCC_APPENDItem(SFKACC,43, result);
               LDSUCC_APPENDItem(SFKPOSS,44, result);
               LDSUCC_APPENDItem(SFKPREDPOSS,45, result);
               LDSUCC_APPENDItem(SFKREGORD,46, result);
               LDSUCC_APPENDItem(SFK0,47, result);
               LDSUCC_APPENDItem(SFK1,48, result);
               LDSUCC_APPENDItem(SFK2,49, result);
               LDSUCC_APPENDItem(SFK3,50, result);
               LDSUCC_APPENDItem(SFK4,51, result);
               LDSUCC_APPENDItem(SFK5,52, result);
               LDSUCC_APPENDItem(SFK6,53, result);
               LDSUCC_APPENDItem(SFK7,54, result);
               LDSUCC_APPENDItem(SFK8,55, result);
               LDSUCC_APPENDItem(SFK9,56, result);
LDSUCC_APPENDItem(LDSUCC_TrailerAffix, LDSUCC_TrailerAffix, result);
               END;
   1{SFKAM} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   2{SFKIS} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   3{SFKWAS} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   4{SFKARE} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   5{SFKWERE} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   6{SFKIRRPP} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   7{SFKIRRING} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   8{SFKIRRPTPP} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   9{SFKIRRS} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   10{SFKMODPT} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   11{SFKIRRNC} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   12{SFKIRRPT} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   13{SFKIRRPT2} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   14{SFKIRRPP2} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   15{SFKIRRPP3} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   16{SFKREGPTPP} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   17{SFKCDPTPP} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   18{SFKCDING} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   19{SFKREGING} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   20{SFKREGS} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   21{SFKREGES} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   22{SFKIRRCOMP} : BEGIN
               LDSUCC_APPENDItem(SFKREGLY,24, result);
               END;
   23{SFKIRRSUPER} : BEGIN
               LDSUCC_APPENDItem(SFKREGLY,24, result);
               END;
   24{SFKREGLY} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   25{SFKIRRCOMP} : BEGIN
               LDSUCC_APPENDItem(SFKIRREGLY,27, result);
               END;
   26{SFKIRRSUPER} : BEGIN
               LDSUCC_APPENDItem(SFKIRREGLY,27, result);
               END;
   27{SFKIRREGLY} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   28{SFKNOLY} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   29{SFKREGABLE} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   30{SFKCDABLE} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   31{SFKTRUNCABLE} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   32{SFKVOICINGS} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   33{SFKIRRPLUR} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   34{SFKLATPLUR} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   35{SFKIRRCOMP} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   36{SFKIRRSUPER} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   37{SFKIRRCOMP2} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   38{SFKIRRSUPER2} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   39{SFKCDCOMP} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   40{SFKCDSUPER} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   41{SFKREGCOMP} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   42{SFKREGSUPER} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   43{SFKACC} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   44{SFKPOSS} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   45{SFKPREDPOSS} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   46{SFKREGORD} : BEGIN
               LDSUCC_APPENDItem(SFK0,47, result);
               LDSUCC_APPENDItem(SFK1,48, result);
               LDSUCC_APPENDItem(SFK2,49, result);
               LDSUCC_APPENDItem(SFK3,50, result);
               LDSUCC_APPENDItem(SFK4,51, result);
               LDSUCC_APPENDItem(SFK5,52, result);
               LDSUCC_APPENDItem(SFK6,53, result);
               LDSUCC_APPENDItem(SFK7,54, result);
               LDSUCC_APPENDItem(SFK8,55, result);
               LDSUCC_APPENDItem(SFK9,56, result);
               END;
   47{SFK0} : BEGIN
               LDSUCC_APPENDItem(SFK0,57, result);
               LDSUCC_APPENDItem(SFK1,58, result);
               LDSUCC_APPENDItem(SFK2,59, result);
               LDSUCC_APPENDItem(SFK3,60, result);
               LDSUCC_APPENDItem(SFK4,61, result);
               LDSUCC_APPENDItem(SFK5,62, result);
               LDSUCC_APPENDItem(SFK6,63, result);
               LDSUCC_APPENDItem(SFK7,64, result);
               LDSUCC_APPENDItem(SFK8,65, result);
               LDSUCC_APPENDItem(SFK9,66, result);
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   48{SFK1} : BEGIN
               LDSUCC_APPENDItem(SFK0,57, result);
               LDSUCC_APPENDItem(SFK1,58, result);
               LDSUCC_APPENDItem(SFK2,59, result);
               LDSUCC_APPENDItem(SFK3,60, result);
               LDSUCC_APPENDItem(SFK4,61, result);
               LDSUCC_APPENDItem(SFK5,62, result);
               LDSUCC_APPENDItem(SFK6,63, result);
               LDSUCC_APPENDItem(SFK7,64, result);
               LDSUCC_APPENDItem(SFK8,65, result);
               LDSUCC_APPENDItem(SFK9,66, result);
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   49{SFK2} : BEGIN
               LDSUCC_APPENDItem(SFK0,57, result);
               LDSUCC_APPENDItem(SFK1,58, result);
               LDSUCC_APPENDItem(SFK2,59, result);
               LDSUCC_APPENDItem(SFK3,60, result);
               LDSUCC_APPENDItem(SFK4,61, result);
               LDSUCC_APPENDItem(SFK5,62, result);
               LDSUCC_APPENDItem(SFK6,63, result);
               LDSUCC_APPENDItem(SFK7,64, result);
               LDSUCC_APPENDItem(SFK8,65, result);
               LDSUCC_APPENDItem(SFK9,66, result);
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   50{SFK3} : BEGIN
               LDSUCC_APPENDItem(SFK0,57, result);
               LDSUCC_APPENDItem(SFK1,58, result);
               LDSUCC_APPENDItem(SFK2,59, result);
               LDSUCC_APPENDItem(SFK3,60, result);
               LDSUCC_APPENDItem(SFK4,61, result);
               LDSUCC_APPENDItem(SFK5,62, result);
               LDSUCC_APPENDItem(SFK6,63, result);
               LDSUCC_APPENDItem(SFK7,64, result);
               LDSUCC_APPENDItem(SFK8,65, result);
               LDSUCC_APPENDItem(SFK9,66, result);
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   51{SFK4} : BEGIN
               LDSUCC_APPENDItem(SFK0,57, result);
               LDSUCC_APPENDItem(SFK1,58, result);
               LDSUCC_APPENDItem(SFK2,59, result);
               LDSUCC_APPENDItem(SFK3,60, result);
               LDSUCC_APPENDItem(SFK4,61, result);
               LDSUCC_APPENDItem(SFK5,62, result);
               LDSUCC_APPENDItem(SFK6,63, result);
               LDSUCC_APPENDItem(SFK7,64, result);
               LDSUCC_APPENDItem(SFK8,65, result);
               LDSUCC_APPENDItem(SFK9,66, result);
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   52{SFK5} : BEGIN
               LDSUCC_APPENDItem(SFK0,57, result);
               LDSUCC_APPENDItem(SFK1,58, result);
               LDSUCC_APPENDItem(SFK2,59, result);
               LDSUCC_APPENDItem(SFK3,60, result);
               LDSUCC_APPENDItem(SFK4,61, result);
               LDSUCC_APPENDItem(SFK5,62, result);
               LDSUCC_APPENDItem(SFK6,63, result);
               LDSUCC_APPENDItem(SFK7,64, result);
               LDSUCC_APPENDItem(SFK8,65, result);
               LDSUCC_APPENDItem(SFK9,66, result);
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   53{SFK6} : BEGIN
               LDSUCC_APPENDItem(SFK0,57, result);
               LDSUCC_APPENDItem(SFK1,58, result);
               LDSUCC_APPENDItem(SFK2,59, result);
               LDSUCC_APPENDItem(SFK3,60, result);
               LDSUCC_APPENDItem(SFK4,61, result);
               LDSUCC_APPENDItem(SFK5,62, result);
               LDSUCC_APPENDItem(SFK6,63, result);
               LDSUCC_APPENDItem(SFK7,64, result);
               LDSUCC_APPENDItem(SFK8,65, result);
               LDSUCC_APPENDItem(SFK9,66, result);
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   54{SFK7} : BEGIN
               LDSUCC_APPENDItem(SFK0,57, result);
               LDSUCC_APPENDItem(SFK1,58, result);
               LDSUCC_APPENDItem(SFK2,59, result);
               LDSUCC_APPENDItem(SFK3,60, result);
               LDSUCC_APPENDItem(SFK4,61, result);
               LDSUCC_APPENDItem(SFK5,62, result);
               LDSUCC_APPENDItem(SFK6,63, result);
               LDSUCC_APPENDItem(SFK7,64, result);
               LDSUCC_APPENDItem(SFK8,65, result);
               LDSUCC_APPENDItem(SFK9,66, result);
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   55{SFK8} : BEGIN
               LDSUCC_APPENDItem(SFK0,57, result);
               LDSUCC_APPENDItem(SFK1,58, result);
               LDSUCC_APPENDItem(SFK2,59, result);
               LDSUCC_APPENDItem(SFK3,60, result);
               LDSUCC_APPENDItem(SFK4,61, result);
               LDSUCC_APPENDItem(SFK5,62, result);
               LDSUCC_APPENDItem(SFK6,63, result);
               LDSUCC_APPENDItem(SFK7,64, result);
               LDSUCC_APPENDItem(SFK8,65, result);
               LDSUCC_APPENDItem(SFK9,66, result);
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   56{SFK9} : BEGIN
               LDSUCC_APPENDItem(SFK0,57, result);
               LDSUCC_APPENDItem(SFK1,58, result);
               LDSUCC_APPENDItem(SFK2,59, result);
               LDSUCC_APPENDItem(SFK3,60, result);
               LDSUCC_APPENDItem(SFK4,61, result);
               LDSUCC_APPENDItem(SFK5,62, result);
               LDSUCC_APPENDItem(SFK6,63, result);
               LDSUCC_APPENDItem(SFK7,64, result);
               LDSUCC_APPENDItem(SFK8,65, result);
               LDSUCC_APPENDItem(SFK9,66, result);
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   57{SFK0} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               LDSUCC_APPENDItem(SFK0,57, result);
               LDSUCC_APPENDItem(SFK1,58, result);
               LDSUCC_APPENDItem(SFK2,59, result);
               LDSUCC_APPENDItem(SFK3,60, result);
               LDSUCC_APPENDItem(SFK4,61, result);
               LDSUCC_APPENDItem(SFK5,62, result);
               LDSUCC_APPENDItem(SFK6,63, result);
               LDSUCC_APPENDItem(SFK7,64, result);
               LDSUCC_APPENDItem(SFK8,65, result);
               LDSUCC_APPENDItem(SFK9,66, result);
               END;
   58{SFK1} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               LDSUCC_APPENDItem(SFK0,57, result);
               LDSUCC_APPENDItem(SFK1,58, result);
               LDSUCC_APPENDItem(SFK2,59, result);
               LDSUCC_APPENDItem(SFK3,60, result);
               LDSUCC_APPENDItem(SFK4,61, result);
               LDSUCC_APPENDItem(SFK5,62, result);
               LDSUCC_APPENDItem(SFK6,63, result);
               LDSUCC_APPENDItem(SFK7,64, result);
               LDSUCC_APPENDItem(SFK8,65, result);
               LDSUCC_APPENDItem(SFK9,66, result);
               END;
   59{SFK2} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               LDSUCC_APPENDItem(SFK0,57, result);
               LDSUCC_APPENDItem(SFK1,58, result);
               LDSUCC_APPENDItem(SFK2,59, result);
               LDSUCC_APPENDItem(SFK3,60, result);
               LDSUCC_APPENDItem(SFK4,61, result);
               LDSUCC_APPENDItem(SFK5,62, result);
               LDSUCC_APPENDItem(SFK6,63, result);
               LDSUCC_APPENDItem(SFK7,64, result);
               LDSUCC_APPENDItem(SFK8,65, result);
               LDSUCC_APPENDItem(SFK9,66, result);
               END;
   60{SFK3} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               LDSUCC_APPENDItem(SFK0,57, result);
               LDSUCC_APPENDItem(SFK1,58, result);
               LDSUCC_APPENDItem(SFK2,59, result);
               LDSUCC_APPENDItem(SFK3,60, result);
               LDSUCC_APPENDItem(SFK4,61, result);
               LDSUCC_APPENDItem(SFK5,62, result);
               LDSUCC_APPENDItem(SFK6,63, result);
               LDSUCC_APPENDItem(SFK7,64, result);
               LDSUCC_APPENDItem(SFK8,65, result);
               LDSUCC_APPENDItem(SFK9,66, result);
               END;
   61{SFK4} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               LDSUCC_APPENDItem(SFK0,57, result);
               LDSUCC_APPENDItem(SFK1,58, result);
               LDSUCC_APPENDItem(SFK2,59, result);
               LDSUCC_APPENDItem(SFK3,60, result);
               LDSUCC_APPENDItem(SFK4,61, result);
               LDSUCC_APPENDItem(SFK5,62, result);
               LDSUCC_APPENDItem(SFK6,63, result);
               LDSUCC_APPENDItem(SFK7,64, result);
               LDSUCC_APPENDItem(SFK8,65, result);
               LDSUCC_APPENDItem(SFK9,66, result);
               END;
   62{SFK5} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               LDSUCC_APPENDItem(SFK0,57, result);
               LDSUCC_APPENDItem(SFK1,58, result);
               LDSUCC_APPENDItem(SFK2,59, result);
               LDSUCC_APPENDItem(SFK3,60, result);
               LDSUCC_APPENDItem(SFK4,61, result);
               LDSUCC_APPENDItem(SFK5,62, result);
               LDSUCC_APPENDItem(SFK6,63, result);
               LDSUCC_APPENDItem(SFK7,64, result);
               LDSUCC_APPENDItem(SFK8,65, result);
               LDSUCC_APPENDItem(SFK9,66, result);
               END;
   63{SFK6} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               LDSUCC_APPENDItem(SFK0,57, result);
               LDSUCC_APPENDItem(SFK1,58, result);
               LDSUCC_APPENDItem(SFK2,59, result);
               LDSUCC_APPENDItem(SFK3,60, result);
               LDSUCC_APPENDItem(SFK4,61, result);
               LDSUCC_APPENDItem(SFK5,62, result);
               LDSUCC_APPENDItem(SFK6,63, result);
               LDSUCC_APPENDItem(SFK7,64, result);
               LDSUCC_APPENDItem(SFK8,65, result);
               LDSUCC_APPENDItem(SFK9,66, result);
               END;
   64{SFK7} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               LDSUCC_APPENDItem(SFK0,57, result);
               LDSUCC_APPENDItem(SFK1,58, result);
               LDSUCC_APPENDItem(SFK2,59, result);
               LDSUCC_APPENDItem(SFK3,60, result);
               LDSUCC_APPENDItem(SFK4,61, result);
               LDSUCC_APPENDItem(SFK5,62, result);
               LDSUCC_APPENDItem(SFK6,63, result);
               LDSUCC_APPENDItem(SFK7,64, result);
               LDSUCC_APPENDItem(SFK8,65, result);
               LDSUCC_APPENDItem(SFK9,66, result);
               END;
   65{SFK8} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               LDSUCC_APPENDItem(SFK0,57, result);
               LDSUCC_APPENDItem(SFK1,58, result);
               LDSUCC_APPENDItem(SFK2,59, result);
               LDSUCC_APPENDItem(SFK3,60, result);
               LDSUCC_APPENDItem(SFK4,61, result);
               LDSUCC_APPENDItem(SFK5,62, result);
               LDSUCC_APPENDItem(SFK6,63, result);
               LDSUCC_APPENDItem(SFK7,64, result);
               LDSUCC_APPENDItem(SFK8,65, result);
               LDSUCC_APPENDItem(SFK9,66, result);
               END;
   66{SFK9} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               LDSUCC_APPENDItem(SFK0,57, result);
               LDSUCC_APPENDItem(SFK1,58, result);
               LDSUCC_APPENDItem(SFK2,59, result);
               LDSUCC_APPENDItem(SFK3,60, result);
               LDSUCC_APPENDItem(SFK4,61, result);
               LDSUCC_APPENDItem(SFK5,62, result);
               LDSUCC_APPENDItem(SFK6,63, result);
               LDSUCC_APPENDItem(SFK7,64, result);
               LDSUCC_APPENDItem(SFK8,65, result);
               LDSUCC_APPENDItem(SFK9,66, result);
               END;
   END {CASE};
   LDSUCC_Succ := result;
END {LDSUCC_Succ};

PROCEDURE LDSUCC_PredictItems(S1: LDSUCC_ItemSetType;
                         VAR S2: LDSUCC_ItemSetType);
VAR
   k1, k2: INTEGER;
BEGIN
   LDSUCC_InitSetOfItems(S2);
   WHILE LDSUCC_StillItems(S1) DO BEGIN
      LDSUCC_TAKEItem(k1, k2, S1);
      S2 := LDSUCC_UNIONItems(S2, LDSUCC_Succ(k2));
   END;
END {LDSUCC_PredictItems};

PROCEDURE LDSUCC_Init;
BEGIN
   FirstItems := LDSUCC_Succ(LDSUCC_FirstAffix);
END; {LDSUCC_Init}

FUNCTION LDSUCC_FirstItems: LDSUCC_ItemSetType;
BEGIN
   LDSUCC_FirstItems := FirstItems;
END; {LDSUCC_FirstItems}

