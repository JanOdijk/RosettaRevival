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
               LDSUCC_APPENDItem(SFKPTCPASMASCSG,1, result);
               LDSUCC_APPENDItem(SFKPTCPASFEMSG,2, result);
               LDSUCC_APPENDItem(SFKPTCPASMASCPL,3, result);
               LDSUCC_APPENDItem(SFKPTCPASFEMPL,4, result);
               LDSUCC_APPENDItem(SFKGERUNDIO,5, result);
               LDSUCC_APPENDItem(SFK1SGINDPRES,6, result);
               LDSUCC_APPENDItem(SFK2SGINDPRES,7, result);
               LDSUCC_APPENDItem(SFK3SGINDPRES,8, result);
               LDSUCC_APPENDItem(SFK1PLINDPRES,9, result);
               LDSUCC_APPENDItem(SFK2PLINDPRES,10, result);
               LDSUCC_APPENDItem(SFK3PLINDPRES,11, result);
               LDSUCC_APPENDItem(SFK1SG3SUBJPRES,12, result);
               LDSUCC_APPENDItem(SFK2SGSUBJPRES,13, result);
               LDSUCC_APPENDItem(SFK1SG3SUBJPRES,14, result);
               LDSUCC_APPENDItem(SFK1PLSUBJPRES,15, result);
               LDSUCC_APPENDItem(SFK2PLSUBJPRES,16, result);
               LDSUCC_APPENDItem(SFK3PLSUBJPRES,17, result);
               LDSUCC_APPENDItem(SFK1SG3IMPERF,18, result);
               LDSUCC_APPENDItem(SFK2SGIMPERF,19, result);
               LDSUCC_APPENDItem(SFK1SG3IMPERF,20, result);
               LDSUCC_APPENDItem(SFK1PLIMPERF,21, result);
               LDSUCC_APPENDItem(SFK2PLIMPERF,22, result);
               LDSUCC_APPENDItem(SFK3PLIMPERF,23, result);
               LDSUCC_APPENDItem(SFK1SGPD,24, result);
               LDSUCC_APPENDItem(SFK2SGPD,25, result);
               LDSUCC_APPENDItem(SFK3SGPD,26, result);
               LDSUCC_APPENDItem(SFK1PLPD,27, result);
               LDSUCC_APPENDItem(SFK2PLPD,28, result);
               LDSUCC_APPENDItem(SFK3PLPD,29, result);
               LDSUCC_APPENDItem(SFK1SG3SUBJPAS,30, result);
               LDSUCC_APPENDItem(SFK2SGSUBJPAS,31, result);
               LDSUCC_APPENDItem(SFK1SG3SUBJPAS,32, result);
               LDSUCC_APPENDItem(SFK1PLSUBJPAS,33, result);
               LDSUCC_APPENDItem(SFK2PLSUBJPAS,34, result);
               LDSUCC_APPENDItem(SFK3PLSUBJPAS,35, result);
               LDSUCC_APPENDItem(SFK1SG3SUBJPASA,36, result);
               LDSUCC_APPENDItem(SFK2SGSUBJPASA,37, result);
               LDSUCC_APPENDItem(SFK1SG3SUBJPASA,38, result);
               LDSUCC_APPENDItem(SFK1PLSUBJPASA,39, result);
               LDSUCC_APPENDItem(SFK2PLSUBJPASA,40, result);
               LDSUCC_APPENDItem(SFK3PLSUBJPASA,41, result);
               LDSUCC_APPENDItem(SFK1SGFUT,42, result);
               LDSUCC_APPENDItem(SFK2SGFUT,43, result);
               LDSUCC_APPENDItem(SFK3SGFUT,44, result);
               LDSUCC_APPENDItem(SFK1PLFUT,45, result);
               LDSUCC_APPENDItem(SFK2PLFUT,46, result);
               LDSUCC_APPENDItem(SFK3PLFUT,47, result);
               LDSUCC_APPENDItem(SFK1SG3COND,48, result);
               LDSUCC_APPENDItem(SFK2SGCOND,49, result);
               LDSUCC_APPENDItem(SFK1SG3COND,50, result);
               LDSUCC_APPENDItem(SFK1PLCOND,51, result);
               LDSUCC_APPENDItem(SFK2PLCOND,52, result);
               LDSUCC_APPENDItem(SFK3PLCOND,53, result);
               LDSUCC_APPENDItem(SFKSGIMPERAT,54, result);
               LDSUCC_APPENDItem(SFKPLIMPERAT,55, result);
               LDSUCC_APPENDItem(SFKO,56, result);
               LDSUCC_APPENDItem(SFKAS,61, result);
               LDSUCC_APPENDItem(SFKES,62, result);
               LDSUCC_APPENDItem(SFKE1S,63, result);
               LDSUCC_APPENDItem(SFKA,72, result);
               LDSUCC_APPENDItem(SFKE,73, result);
               LDSUCC_APPENDItem(SFKE1,74, result);
               LDSUCC_APPENDItem(SFKAMOS,79, result);
               LDSUCC_APPENDItem(SFKEMOS,80, result);
               LDSUCC_APPENDItem(SFKIMOS,81, result);
               LDSUCC_APPENDItem(SFKA1IS,82, result);
               LDSUCC_APPENDItem(SFKE1IS,83, result);
               LDSUCC_APPENDItem(SFKI1S,84, result);
               LDSUCC_APPENDItem(SFKAN,85, result);
               LDSUCC_APPENDItem(SFKEN,86, result);
               LDSUCC_APPENDItem(SFKE1N,87, result);
               LDSUCC_APPENDItem(SFKE,92, result);
               LDSUCC_APPENDItem(SFKA,93, result);
               LDSUCC_APPENDItem(SFKES,94, result);
               LDSUCC_APPENDItem(SFKAS,95, result);
               LDSUCC_APPENDItem(SFKEMOS,102, result);
               LDSUCC_APPENDItem(SFKAMOS,103, result);
               LDSUCC_APPENDItem(SFKE1IS,110, result);
               LDSUCC_APPENDItem(SFKA1IS,111, result);
               LDSUCC_APPENDItem(SFKEN,118, result);
               LDSUCC_APPENDItem(SFKAN,119, result);
               LDSUCC_APPENDItem(SFKABA,126, result);
               LDSUCC_APPENDItem(SFKI1A,127, result);
               LDSUCC_APPENDItem(SFKABAS,128, result);
               LDSUCC_APPENDItem(SFKI1AS,129, result);
               LDSUCC_APPENDItem(SFKABA,130, result);
               LDSUCC_APPENDItem(SFKI1A,131, result);
               LDSUCC_APPENDItem(SFKA1BAMOS,133, result);
               LDSUCC_APPENDItem(SFKI1AMOS,134, result);
               LDSUCC_APPENDItem(SFKABAIS,135, result);
               LDSUCC_APPENDItem(SFKI1AIS,136, result);
               LDSUCC_APPENDItem(SFKABAN,137, result);
               LDSUCC_APPENDItem(SFKI1AN,138, result);
               LDSUCC_APPENDItem(SFKE1,140, result);
               LDSUCC_APPENDItem(SFKI1,141, result);
               LDSUCC_APPENDItem(SFKE,142, result);
               LDSUCC_APPENDItem(SFKASTE,145, result);
               LDSUCC_APPENDItem(SFKISTE,146, result);
               LDSUCC_APPENDItem(SFKISTE,147, result);
               LDSUCC_APPENDItem(SFKO1,150, result);
               LDSUCC_APPENDItem(SFKIO1,151, result);
               LDSUCC_APPENDItem(SFKO,152, result);
               LDSUCC_APPENDItem(SFKAMOS,158, result);
               LDSUCC_APPENDItem(SFKIMOS,159, result);
               LDSUCC_APPENDItem(SFKASTEIS,162, result);
               LDSUCC_APPENDItem(SFKISTEIS,163, result);
               LDSUCC_APPENDItem(SFKARON,166, result);
               LDSUCC_APPENDItem(SFKIERON,167, result);
               LDSUCC_APPENDItem(SFKARA,173, result);
               LDSUCC_APPENDItem(SFKIERA,174, result);
               LDSUCC_APPENDItem(SFKASE,175, result);
               LDSUCC_APPENDItem(SFKIESE,176, result);
               LDSUCC_APPENDItem(SFKARAS,177, result);
               LDSUCC_APPENDItem(SFKIERAS,178, result);
               LDSUCC_APPENDItem(SFKASES,179, result);
               LDSUCC_APPENDItem(SFKIESES,180, result);
               LDSUCC_APPENDItem(SFKARA,181, result);
               LDSUCC_APPENDItem(SFKIERA,182, result);
               LDSUCC_APPENDItem(SFKASE,183, result);
               LDSUCC_APPENDItem(SFKIESE,184, result);
               LDSUCC_APPENDItem(SFKA1RAMOS,191, result);
               LDSUCC_APPENDItem(SFKIE1RAMOS,192, result);
               LDSUCC_APPENDItem(SFKA1SEMOS,193, result);
               LDSUCC_APPENDItem(SFKIE1SEMOS,194, result);
               LDSUCC_APPENDItem(SFKARAIS,195, result);
               LDSUCC_APPENDItem(SFKIERAIS,196, result);
               LDSUCC_APPENDItem(SFKASEIS,197, result);
               LDSUCC_APPENDItem(SFKIESEIS,198, result);
               LDSUCC_APPENDItem(SFKARAN,199, result);
               LDSUCC_APPENDItem(SFKIERAN,200, result);
               LDSUCC_APPENDItem(SFKASEN,201, result);
               LDSUCC_APPENDItem(SFKIESEN,202, result);
               LDSUCC_APPENDItem(SFKARE1,209, result);
               LDSUCC_APPENDItem(SFKERE1,210, result);
               LDSUCC_APPENDItem(SFKIRE1,211, result);
               LDSUCC_APPENDItem(SFKARA1S,212, result);
               LDSUCC_APPENDItem(SFKERA1S,213, result);
               LDSUCC_APPENDItem(SFKIRA1S,214, result);
               LDSUCC_APPENDItem(SFKARA1,215, result);
               LDSUCC_APPENDItem(SFKERA1,216, result);
               LDSUCC_APPENDItem(SFKIRA1,217, result);
               LDSUCC_APPENDItem(SFKAREMOS,218, result);
               LDSUCC_APPENDItem(SFKEREMOS,219, result);
               LDSUCC_APPENDItem(SFKIREMOS,220, result);
               LDSUCC_APPENDItem(SFKARE1IS,221, result);
               LDSUCC_APPENDItem(SFKERE1IS,222, result);
               LDSUCC_APPENDItem(SFKIRE1IS,223, result);
               LDSUCC_APPENDItem(SFKARA1N,224, result);
               LDSUCC_APPENDItem(SFKERA1N,225, result);
               LDSUCC_APPENDItem(SFKIRA1N,226, result);
               LDSUCC_APPENDItem(SFKARI1A,227, result);
               LDSUCC_APPENDItem(SFKERI1A,228, result);
               LDSUCC_APPENDItem(SFKIRI1A,229, result);
               LDSUCC_APPENDItem(SFKARI1AS,230, result);
               LDSUCC_APPENDItem(SFKERI1AS,231, result);
               LDSUCC_APPENDItem(SFKIRI1AS,232, result);
               LDSUCC_APPENDItem(SFKARI1A,233, result);
               LDSUCC_APPENDItem(SFKERI1A,234, result);
               LDSUCC_APPENDItem(SFKIRI1A,235, result);
               LDSUCC_APPENDItem(SFKARI1AMOS,236, result);
               LDSUCC_APPENDItem(SFKERI1AMOS,237, result);
               LDSUCC_APPENDItem(SFKIRI1AMOS,238, result);
               LDSUCC_APPENDItem(SFKARI1AIS,239, result);
               LDSUCC_APPENDItem(SFKERI1AIS,240, result);
               LDSUCC_APPENDItem(SFKIRI1AIS,241, result);
               LDSUCC_APPENDItem(SFKARI1AN,242, result);
               LDSUCC_APPENDItem(SFKERI1AN,243, result);
               LDSUCC_APPENDItem(SFKIRI1AN,244, result);
               LDSUCC_APPENDItem(SFKAR,245, result);
               LDSUCC_APPENDItem(SFKER,246, result);
               LDSUCC_APPENDItem(SFKIR,247, result);
               LDSUCC_APPENDItem(SFKIRRINF,248, result);
               LDSUCC_APPENDItem(SFKA,249, result);
               LDSUCC_APPENDItem(SFKE,250, result);
               LDSUCC_APPENDItem(SFKE1,251, result);
               LDSUCC_APPENDItem(SFKAD,255, result);
               LDSUCC_APPENDItem(SFKED,256, result);
               LDSUCC_APPENDItem(SFKID,257, result);
               LDSUCC_APPENDItem(SFKIRRIMPERATSG,258, result);
               LDSUCC_APPENDItem(SFKADO,259, result);
               LDSUCC_APPENDItem(SFKIDO,260, result);
               LDSUCC_APPENDItem(SFKADA,261, result);
               LDSUCC_APPENDItem(SFKIDA,262, result);
               LDSUCC_APPENDItem(SFKADOS,263, result);
               LDSUCC_APPENDItem(SFKIDOS,264, result);
               LDSUCC_APPENDItem(SFKADAS,265, result);
               LDSUCC_APPENDItem(SFKIDAS,266, result);
               LDSUCC_APPENDItem(SFKIRRPTCPASMASCSG,267, result);
               LDSUCC_APPENDItem(SFKIRRPTCPASMASCPL,268, result);
               LDSUCC_APPENDItem(SFKIRRPTCPASFEMSG,269, result);
               LDSUCC_APPENDItem(SFKIRRPTCPASFEMPL,270, result);
               LDSUCC_APPENDItem(SFKANDO,271, result);
               LDSUCC_APPENDItem(SFKIENDO,272, result);
               LDSUCC_APPENDItem(SFKIRR1PSSGIND,279, result);
               LDSUCC_APPENDItem(SFKREGPL,280, result);
               LDSUCC_APPENDItem(SFKIRRPL,281, result);
               LDSUCC_APPENDItem(SFKEXTRANPL,282, result);
               LDSUCC_APPENDItem(SFKAPOCOPE,283, result);
               LDSUCC_APPENDItem(SFKREGPL,284, result);
               LDSUCC_APPENDItem(SFKIRRPL,285, result);
               LDSUCC_APPENDItem(SFKIRRCOMPAR,287, result);
               LDSUCC_APPENDItem(SFKREGPL,288, result);
               LDSUCC_APPENDItem(SFKIRRPL,289, result);
               LDSUCC_APPENDItem(SFKREGFEM,290, result);
               LDSUCC_APPENDItem(SFKO,291, result);
               LDSUCC_APPENDItem(SFKAPOCOPE,292, result);
               LDSUCC_APPENDItem(SFKCLITICOD,294, result);
               LDSUCC_APPENDItem(SFKCLITICODM,295, result);
               LDSUCC_APPENDItem(SFKCLITICODF,296, result);
               LDSUCC_APPENDItem(SFKCLITICOD1,297, result);
               LDSUCC_APPENDItem(SFKCLITICOI,298, result);
               LDSUCC_APPENDItem(SFKPRONFUERTE,299, result);
               LDSUCC_APPENDItem(SFKPOSADJ,300, result);
               LDSUCC_APPENDItem(SFKREGPL,301, result);
               LDSUCC_APPENDItem(SFKPOSADJFUERTE,302, result);
               LDSUCC_APPENDItem(SFKREGFEM,303, result);
               LDSUCC_APPENDItem(SFKREGPL,304, result);
               LDSUCC_APPENDItem(SFKMASCDEMADJPL,305, result);
               LDSUCC_APPENDItem(SFKFEMDEMADJSG,306, result);
               LDSUCC_APPENDItem(SFKFEMDEMADJPL,307, result);
               LDSUCC_APPENDItem(SFKMASCDEMPROPL,308, result);
               LDSUCC_APPENDItem(SFKFEMDEMPROSG,309, result);
               LDSUCC_APPENDItem(SFKFEMDEMPROPL,310, result);
               LDSUCC_APPENDItem(SFKNEUTDEMPRO,311, result);
               LDSUCC_APPENDItem(SFKREGFEM,312, result);
               LDSUCC_APPENDItem(SFKREGFEM,313, result);
               LDSUCC_APPENDItem(SFKREGPL,314, result);
               LDSUCC_APPENDItem(SFKIRRPL,315, result);
               LDSUCC_APPENDItem(SFKREGFEM,316, result);
               LDSUCC_APPENDItem(SFKO,317, result);
               LDSUCC_APPENDItem(SFK0,318, result);
               LDSUCC_APPENDItem(SFK1,319, result);
               LDSUCC_APPENDItem(SFK2,320, result);
               LDSUCC_APPENDItem(SFK3,321, result);
               LDSUCC_APPENDItem(SFK4,322, result);
               LDSUCC_APPENDItem(SFK5,323, result);
               LDSUCC_APPENDItem(SFK6,324, result);
               LDSUCC_APPENDItem(SFK7,325, result);
               LDSUCC_APPENDItem(SFK8,326, result);
               LDSUCC_APPENDItem(SFK9,327, result);
LDSUCC_APPENDItem(LDSUCC_TrailerAffix, LDSUCC_TrailerAffix, result);
               END;
   1{SFKPTCPASMASCSG} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   2{SFKPTCPASFEMSG} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   3{SFKPTCPASMASCPL} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   4{SFKPTCPASFEMPL} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   5{SFKGERUNDIO} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   6{SFK1SGINDPRES} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   7{SFK2SGINDPRES} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   8{SFK3SGINDPRES} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   9{SFK1PLINDPRES} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   10{SFK2PLINDPRES} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   11{SFK3PLINDPRES} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   12{SFK1SG3SUBJPRES} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   13{SFK2SGSUBJPRES} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   14{SFK1SG3SUBJPRES} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   15{SFK1PLSUBJPRES} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   16{SFK2PLSUBJPRES} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   17{SFK3PLSUBJPRES} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   18{SFK1SG3IMPERF} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   19{SFK2SGIMPERF} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   20{SFK1SG3IMPERF} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   21{SFK1PLIMPERF} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   22{SFK2PLIMPERF} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   23{SFK3PLIMPERF} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   24{SFK1SGPD} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   25{SFK2SGPD} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   26{SFK3SGPD} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   27{SFK1PLPD} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   28{SFK2PLPD} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   29{SFK3PLPD} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   30{SFK1SG3SUBJPAS} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   31{SFK2SGSUBJPAS} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   32{SFK1SG3SUBJPAS} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   33{SFK1PLSUBJPAS} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   34{SFK2PLSUBJPAS} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   35{SFK3PLSUBJPAS} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   36{SFK1SG3SUBJPASA} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   37{SFK2SGSUBJPASA} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   38{SFK1SG3SUBJPASA} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   39{SFK1PLSUBJPASA} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   40{SFK2PLSUBJPASA} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   41{SFK3PLSUBJPASA} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   42{SFK1SGFUT} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   43{SFK2SGFUT} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   44{SFK3SGFUT} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   45{SFK1PLFUT} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   46{SFK2PLFUT} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   47{SFK3PLFUT} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   48{SFK1SG3COND} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   49{SFK2SGCOND} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   50{SFK1SG3COND} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   51{SFK1PLCOND} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   52{SFK2PLCOND} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   53{SFK3PLCOND} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   54{SFKSGIMPERAT} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   55{SFKPLIMPERAT} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   56{SFKO} : BEGIN
               LDSUCC_APPENDItem(SFKDIFTONG,57, result);
               LDSUCC_APPENDItem(SFKIRRMEDEK,58, result);
               LDSUCC_APPENDItem(SFKEIOUHEEL,59, result);
               LDSUCC_APPENDItem(SFKVE,60, result);
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   57{SFKDIFTONG} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   58{SFKIRRMEDEK} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   59{SFKEIOUHEEL} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   60{SFKVE} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   61{SFKAS} : BEGIN
               LDSUCC_APPENDItem(SFKDIFTONG,64, result);
               LDSUCC_APPENDItem(SFKEIOUHEEL,65, result);
               LDSUCC_APPENDItem(SFKYPLUSPRES,66, result);
               LDSUCC_APPENDItem(SFKBENDIC,67, result);
               LDSUCC_APPENDItem(SFKDIFTONG,68, result);
               LDSUCC_APPENDItem(SFKEIOUHEEL,69, result);
               LDSUCC_APPENDItem(SFKYPLUSPRES,70, result);
               LDSUCC_APPENDItem(SFKBENDIC,71, result);
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   62{SFKES} : BEGIN
               LDSUCC_APPENDItem(SFKDIFTONG,64, result);
               LDSUCC_APPENDItem(SFKEIOUHEEL,65, result);
               LDSUCC_APPENDItem(SFKYPLUSPRES,66, result);
               LDSUCC_APPENDItem(SFKBENDIC,67, result);
               LDSUCC_APPENDItem(SFKDIFTONG,68, result);
               LDSUCC_APPENDItem(SFKEIOUHEEL,69, result);
               LDSUCC_APPENDItem(SFKYPLUSPRES,70, result);
               LDSUCC_APPENDItem(SFKBENDIC,71, result);
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   63{SFKE1S} : BEGIN
               LDSUCC_APPENDItem(SFKDIFTONG,64, result);
               LDSUCC_APPENDItem(SFKEIOUHEEL,65, result);
               LDSUCC_APPENDItem(SFKYPLUSPRES,66, result);
               LDSUCC_APPENDItem(SFKBENDIC,67, result);
               LDSUCC_APPENDItem(SFKDIFTONG,68, result);
               LDSUCC_APPENDItem(SFKEIOUHEEL,69, result);
               LDSUCC_APPENDItem(SFKYPLUSPRES,70, result);
               LDSUCC_APPENDItem(SFKBENDIC,71, result);
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   64{SFKDIFTONG} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   65{SFKEIOUHEEL} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   66{SFKYPLUSPRES} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   67{SFKBENDIC} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   68{SFKDIFTONG} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   69{SFKEIOUHEEL} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   70{SFKYPLUSPRES} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   71{SFKBENDIC} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   72{SFKA} : BEGIN
               LDSUCC_APPENDItem(SFKDIFTONG,75, result);
               LDSUCC_APPENDItem(SFKEIOUHEEL,76, result);
               LDSUCC_APPENDItem(SFKYPLUSPRES,77, result);
               LDSUCC_APPENDItem(SFKBENDIC,78, result);
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   73{SFKE} : BEGIN
               LDSUCC_APPENDItem(SFKDIFTONG,75, result);
               LDSUCC_APPENDItem(SFKEIOUHEEL,76, result);
               LDSUCC_APPENDItem(SFKYPLUSPRES,77, result);
               LDSUCC_APPENDItem(SFKBENDIC,78, result);
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   74{SFKE1} : BEGIN
               LDSUCC_APPENDItem(SFKDIFTONG,75, result);
               LDSUCC_APPENDItem(SFKEIOUHEEL,76, result);
               LDSUCC_APPENDItem(SFKYPLUSPRES,77, result);
               LDSUCC_APPENDItem(SFKBENDIC,78, result);
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   75{SFKDIFTONG} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   76{SFKEIOUHEEL} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   77{SFKYPLUSPRES} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   78{SFKBENDIC} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   79{SFKAMOS} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   80{SFKEMOS} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   81{SFKIMOS} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   82{SFKA1IS} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   83{SFKE1IS} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   84{SFKI1S} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   85{SFKAN} : BEGIN
               LDSUCC_APPENDItem(SFKDIFTONG,88, result);
               LDSUCC_APPENDItem(SFKEIOUHEEL,89, result);
               LDSUCC_APPENDItem(SFKYPLUSPRES,90, result);
               LDSUCC_APPENDItem(SFKBENDIC,91, result);
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   86{SFKEN} : BEGIN
               LDSUCC_APPENDItem(SFKDIFTONG,88, result);
               LDSUCC_APPENDItem(SFKEIOUHEEL,89, result);
               LDSUCC_APPENDItem(SFKYPLUSPRES,90, result);
               LDSUCC_APPENDItem(SFKBENDIC,91, result);
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   87{SFKE1N} : BEGIN
               LDSUCC_APPENDItem(SFKDIFTONG,88, result);
               LDSUCC_APPENDItem(SFKEIOUHEEL,89, result);
               LDSUCC_APPENDItem(SFKYPLUSPRES,90, result);
               LDSUCC_APPENDItem(SFKBENDIC,91, result);
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   88{SFKDIFTONG} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   89{SFKEIOUHEEL} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   90{SFKYPLUSPRES} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   91{SFKBENDIC} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   92{SFKE} : BEGIN
               LDSUCC_APPENDItem(SFKDIFTONG,96, result);
               LDSUCC_APPENDItem(SFKIRRMEDEK,97, result);
               LDSUCC_APPENDItem(SFKEIOUHEEL,98, result);
               LDSUCC_APPENDItem(SFKUMLAUT,99, result);
               LDSUCC_APPENDItem(SFKVE,100, result);
               LDSUCC_APPENDItem(SFKSEPA,101, result);
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   93{SFKA} : BEGIN
               LDSUCC_APPENDItem(SFKDIFTONG,96, result);
               LDSUCC_APPENDItem(SFKIRRMEDEK,97, result);
               LDSUCC_APPENDItem(SFKEIOUHEEL,98, result);
               LDSUCC_APPENDItem(SFKUMLAUT,99, result);
               LDSUCC_APPENDItem(SFKVE,100, result);
               LDSUCC_APPENDItem(SFKSEPA,101, result);
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   94{SFKES} : BEGIN
               LDSUCC_APPENDItem(SFKDIFTONG,96, result);
               LDSUCC_APPENDItem(SFKIRRMEDEK,97, result);
               LDSUCC_APPENDItem(SFKEIOUHEEL,98, result);
               LDSUCC_APPENDItem(SFKUMLAUT,99, result);
               LDSUCC_APPENDItem(SFKVE,100, result);
               LDSUCC_APPENDItem(SFKSEPA,101, result);
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   95{SFKAS} : BEGIN
               LDSUCC_APPENDItem(SFKDIFTONG,96, result);
               LDSUCC_APPENDItem(SFKIRRMEDEK,97, result);
               LDSUCC_APPENDItem(SFKEIOUHEEL,98, result);
               LDSUCC_APPENDItem(SFKUMLAUT,99, result);
               LDSUCC_APPENDItem(SFKVE,100, result);
               LDSUCC_APPENDItem(SFKSEPA,101, result);
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   96{SFKDIFTONG} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   97{SFKIRRMEDEK} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   98{SFKEIOUHEEL} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   99{SFKUMLAUT} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   100{SFKVE} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   101{SFKSEPA} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   102{SFKEMOS} : BEGIN
               LDSUCC_APPENDItem(SFKIRRMEDEK,104, result);
               LDSUCC_APPENDItem(SFKEIOUHALF,105, result);
               LDSUCC_APPENDItem(SFKEIOUHEEL,106, result);
               LDSUCC_APPENDItem(SFKUMLAUT,107, result);
               LDSUCC_APPENDItem(SFKVE,108, result);
               LDSUCC_APPENDItem(SFKSEPA,109, result);
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   103{SFKAMOS} : BEGIN
               LDSUCC_APPENDItem(SFKIRRMEDEK,104, result);
               LDSUCC_APPENDItem(SFKEIOUHALF,105, result);
               LDSUCC_APPENDItem(SFKEIOUHEEL,106, result);
               LDSUCC_APPENDItem(SFKUMLAUT,107, result);
               LDSUCC_APPENDItem(SFKVE,108, result);
               LDSUCC_APPENDItem(SFKSEPA,109, result);
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   104{SFKIRRMEDEK} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   105{SFKEIOUHALF} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   106{SFKEIOUHEEL} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   107{SFKUMLAUT} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   108{SFKVE} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   109{SFKSEPA} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   110{SFKE1IS} : BEGIN
               LDSUCC_APPENDItem(SFKIRRMEDEK,112, result);
               LDSUCC_APPENDItem(SFKEIOUHALF,113, result);
               LDSUCC_APPENDItem(SFKEIOUHEEL,114, result);
               LDSUCC_APPENDItem(SFKUMLAUT,115, result);
               LDSUCC_APPENDItem(SFKVE,116, result);
               LDSUCC_APPENDItem(SFKSEPA,117, result);
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   111{SFKA1IS} : BEGIN
               LDSUCC_APPENDItem(SFKIRRMEDEK,112, result);
               LDSUCC_APPENDItem(SFKEIOUHALF,113, result);
               LDSUCC_APPENDItem(SFKEIOUHEEL,114, result);
               LDSUCC_APPENDItem(SFKUMLAUT,115, result);
               LDSUCC_APPENDItem(SFKVE,116, result);
               LDSUCC_APPENDItem(SFKSEPA,117, result);
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   112{SFKIRRMEDEK} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   113{SFKEIOUHALF} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   114{SFKEIOUHEEL} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   115{SFKUMLAUT} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   116{SFKVE} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   117{SFKSEPA} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   118{SFKEN} : BEGIN
               LDSUCC_APPENDItem(SFKDIFTONG,120, result);
               LDSUCC_APPENDItem(SFKIRRMEDEK,121, result);
               LDSUCC_APPENDItem(SFKEIOUHEEL,122, result);
               LDSUCC_APPENDItem(SFKUMLAUT,123, result);
               LDSUCC_APPENDItem(SFKVE,124, result);
               LDSUCC_APPENDItem(SFKSEPA,125, result);
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   119{SFKAN} : BEGIN
               LDSUCC_APPENDItem(SFKDIFTONG,120, result);
               LDSUCC_APPENDItem(SFKIRRMEDEK,121, result);
               LDSUCC_APPENDItem(SFKEIOUHEEL,122, result);
               LDSUCC_APPENDItem(SFKUMLAUT,123, result);
               LDSUCC_APPENDItem(SFKVE,124, result);
               LDSUCC_APPENDItem(SFKSEPA,125, result);
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   120{SFKDIFTONG} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   121{SFKIRRMEDEK} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   122{SFKEIOUHEEL} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   123{SFKUMLAUT} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   124{SFKVE} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   125{SFKSEPA} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   126{SFKABA} : BEGIN
               LDSUCC_APPENDItem(SFKVE,132, result);
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   127{SFKI1A} : BEGIN
               LDSUCC_APPENDItem(SFKVE,132, result);
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   128{SFKABAS} : BEGIN
               LDSUCC_APPENDItem(SFKVE,132, result);
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   129{SFKI1AS} : BEGIN
               LDSUCC_APPENDItem(SFKVE,132, result);
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   130{SFKABA} : BEGIN
               LDSUCC_APPENDItem(SFKVE,132, result);
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   131{SFKI1A} : BEGIN
               LDSUCC_APPENDItem(SFKVE,132, result);
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   132{SFKVE} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   133{SFKA1BAMOS} : BEGIN
               LDSUCC_APPENDItem(SFKVE,139, result);
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   134{SFKI1AMOS} : BEGIN
               LDSUCC_APPENDItem(SFKVE,139, result);
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   135{SFKABAIS} : BEGIN
               LDSUCC_APPENDItem(SFKVE,139, result);
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   136{SFKI1AIS} : BEGIN
               LDSUCC_APPENDItem(SFKVE,139, result);
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   137{SFKABAN} : BEGIN
               LDSUCC_APPENDItem(SFKVE,139, result);
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   138{SFKI1AN} : BEGIN
               LDSUCC_APPENDItem(SFKVE,139, result);
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   139{SFKVE} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   140{SFKE1} : BEGIN
               LDSUCC_APPENDItem(SFKSTERK,143, result);
               LDSUCC_APPENDItem(SFKEIOUPD,144, result);
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   141{SFKI1} : BEGIN
               LDSUCC_APPENDItem(SFKSTERK,143, result);
               LDSUCC_APPENDItem(SFKEIOUPD,144, result);
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   142{SFKE} : BEGIN
               LDSUCC_APPENDItem(SFKSTERK,143, result);
               LDSUCC_APPENDItem(SFKEIOUPD,144, result);
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   143{SFKSTERK} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   144{SFKEIOUPD} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   145{SFKASTE} : BEGIN
               LDSUCC_APPENDItem(SFKSTERK,148, result);
               LDSUCC_APPENDItem(SFKEIOUPD,149, result);
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   146{SFKISTE} : BEGIN
               LDSUCC_APPENDItem(SFKSTERK,148, result);
               LDSUCC_APPENDItem(SFKEIOUPD,149, result);
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   147{SFKISTE} : BEGIN
               LDSUCC_APPENDItem(SFKSTERK,148, result);
               LDSUCC_APPENDItem(SFKEIOUPD,149, result);
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   148{SFKSTERK} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   149{SFKEIOUPD} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   150{SFKO1} : BEGIN
               LDSUCC_APPENDItem(SFKSTERK,153, result);
               LDSUCC_APPENDItem(SFKEIOUHALF,154, result);
               LDSUCC_APPENDItem(SFKEIOUHEEL,155, result);
               LDSUCC_APPENDItem(SFKYMINPRES,156, result);
               LDSUCC_APPENDItem(SFKEIOUPD,157, result);
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   151{SFKIO1} : BEGIN
               LDSUCC_APPENDItem(SFKSTERK,153, result);
               LDSUCC_APPENDItem(SFKEIOUHALF,154, result);
               LDSUCC_APPENDItem(SFKEIOUHEEL,155, result);
               LDSUCC_APPENDItem(SFKYMINPRES,156, result);
               LDSUCC_APPENDItem(SFKEIOUPD,157, result);
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   152{SFKO} : BEGIN
               LDSUCC_APPENDItem(SFKSTERK,153, result);
               LDSUCC_APPENDItem(SFKEIOUHALF,154, result);
               LDSUCC_APPENDItem(SFKEIOUHEEL,155, result);
               LDSUCC_APPENDItem(SFKYMINPRES,156, result);
               LDSUCC_APPENDItem(SFKEIOUPD,157, result);
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   153{SFKSTERK} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   154{SFKEIOUHALF} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   155{SFKEIOUHEEL} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   156{SFKYMINPRES} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   157{SFKEIOUPD} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   158{SFKAMOS} : BEGIN
               LDSUCC_APPENDItem(SFKSTERK,160, result);
               LDSUCC_APPENDItem(SFKEIOUPD,161, result);
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   159{SFKIMOS} : BEGIN
               LDSUCC_APPENDItem(SFKSTERK,160, result);
               LDSUCC_APPENDItem(SFKEIOUPD,161, result);
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   160{SFKSTERK} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   161{SFKEIOUPD} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   162{SFKASTEIS} : BEGIN
               LDSUCC_APPENDItem(SFKSTERK,164, result);
               LDSUCC_APPENDItem(SFKEIOUPD,165, result);
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   163{SFKISTEIS} : BEGIN
               LDSUCC_APPENDItem(SFKSTERK,164, result);
               LDSUCC_APPENDItem(SFKEIOUPD,165, result);
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   164{SFKSTERK} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   165{SFKEIOUPD} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   166{SFKARON} : BEGIN
               LDSUCC_APPENDItem(SFKSTERK,168, result);
               LDSUCC_APPENDItem(SFKEIOUHALF,169, result);
               LDSUCC_APPENDItem(SFKEIOUHEEL,170, result);
               LDSUCC_APPENDItem(SFKYMINPRES,171, result);
               LDSUCC_APPENDItem(SFKEIOUPD,172, result);
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   167{SFKIERON} : BEGIN
               LDSUCC_APPENDItem(SFKSTERK,168, result);
               LDSUCC_APPENDItem(SFKEIOUHALF,169, result);
               LDSUCC_APPENDItem(SFKEIOUHEEL,170, result);
               LDSUCC_APPENDItem(SFKYMINPRES,171, result);
               LDSUCC_APPENDItem(SFKEIOUPD,172, result);
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   168{SFKSTERK} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   169{SFKEIOUHALF} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   170{SFKEIOUHEEL} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   171{SFKYMINPRES} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   172{SFKEIOUPD} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   173{SFKARA} : BEGIN
               LDSUCC_APPENDItem(SFKSTERK,185, result);
               LDSUCC_APPENDItem(SFKEIOUHALF,186, result);
               LDSUCC_APPENDItem(SFKEIOUHEEL,187, result);
               LDSUCC_APPENDItem(SFKYMINPRES,188, result);
               LDSUCC_APPENDItem(SFKEIOUPD,189, result);
               LDSUCC_APPENDItem(SFKYPLUSPRES,190, result);
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   174{SFKIERA} : BEGIN
               LDSUCC_APPENDItem(SFKSTERK,185, result);
               LDSUCC_APPENDItem(SFKEIOUHALF,186, result);
               LDSUCC_APPENDItem(SFKEIOUHEEL,187, result);
               LDSUCC_APPENDItem(SFKYMINPRES,188, result);
               LDSUCC_APPENDItem(SFKEIOUPD,189, result);
               LDSUCC_APPENDItem(SFKYPLUSPRES,190, result);
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   175{SFKASE} : BEGIN
               LDSUCC_APPENDItem(SFKSTERK,185, result);
               LDSUCC_APPENDItem(SFKEIOUHALF,186, result);
               LDSUCC_APPENDItem(SFKEIOUHEEL,187, result);
               LDSUCC_APPENDItem(SFKYMINPRES,188, result);
               LDSUCC_APPENDItem(SFKEIOUPD,189, result);
               LDSUCC_APPENDItem(SFKYPLUSPRES,190, result);
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   176{SFKIESE} : BEGIN
               LDSUCC_APPENDItem(SFKSTERK,185, result);
               LDSUCC_APPENDItem(SFKEIOUHALF,186, result);
               LDSUCC_APPENDItem(SFKEIOUHEEL,187, result);
               LDSUCC_APPENDItem(SFKYMINPRES,188, result);
               LDSUCC_APPENDItem(SFKEIOUPD,189, result);
               LDSUCC_APPENDItem(SFKYPLUSPRES,190, result);
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   177{SFKARAS} : BEGIN
               LDSUCC_APPENDItem(SFKSTERK,185, result);
               LDSUCC_APPENDItem(SFKEIOUHALF,186, result);
               LDSUCC_APPENDItem(SFKEIOUHEEL,187, result);
               LDSUCC_APPENDItem(SFKYMINPRES,188, result);
               LDSUCC_APPENDItem(SFKEIOUPD,189, result);
               LDSUCC_APPENDItem(SFKYPLUSPRES,190, result);
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   178{SFKIERAS} : BEGIN
               LDSUCC_APPENDItem(SFKSTERK,185, result);
               LDSUCC_APPENDItem(SFKEIOUHALF,186, result);
               LDSUCC_APPENDItem(SFKEIOUHEEL,187, result);
               LDSUCC_APPENDItem(SFKYMINPRES,188, result);
               LDSUCC_APPENDItem(SFKEIOUPD,189, result);
               LDSUCC_APPENDItem(SFKYPLUSPRES,190, result);
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   179{SFKASES} : BEGIN
               LDSUCC_APPENDItem(SFKSTERK,185, result);
               LDSUCC_APPENDItem(SFKEIOUHALF,186, result);
               LDSUCC_APPENDItem(SFKEIOUHEEL,187, result);
               LDSUCC_APPENDItem(SFKYMINPRES,188, result);
               LDSUCC_APPENDItem(SFKEIOUPD,189, result);
               LDSUCC_APPENDItem(SFKYPLUSPRES,190, result);
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   180{SFKIESES} : BEGIN
               LDSUCC_APPENDItem(SFKSTERK,185, result);
               LDSUCC_APPENDItem(SFKEIOUHALF,186, result);
               LDSUCC_APPENDItem(SFKEIOUHEEL,187, result);
               LDSUCC_APPENDItem(SFKYMINPRES,188, result);
               LDSUCC_APPENDItem(SFKEIOUPD,189, result);
               LDSUCC_APPENDItem(SFKYPLUSPRES,190, result);
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   181{SFKARA} : BEGIN
               LDSUCC_APPENDItem(SFKSTERK,185, result);
               LDSUCC_APPENDItem(SFKEIOUHALF,186, result);
               LDSUCC_APPENDItem(SFKEIOUHEEL,187, result);
               LDSUCC_APPENDItem(SFKYMINPRES,188, result);
               LDSUCC_APPENDItem(SFKEIOUPD,189, result);
               LDSUCC_APPENDItem(SFKYPLUSPRES,190, result);
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   182{SFKIERA} : BEGIN
               LDSUCC_APPENDItem(SFKSTERK,185, result);
               LDSUCC_APPENDItem(SFKEIOUHALF,186, result);
               LDSUCC_APPENDItem(SFKEIOUHEEL,187, result);
               LDSUCC_APPENDItem(SFKYMINPRES,188, result);
               LDSUCC_APPENDItem(SFKEIOUPD,189, result);
               LDSUCC_APPENDItem(SFKYPLUSPRES,190, result);
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   183{SFKASE} : BEGIN
               LDSUCC_APPENDItem(SFKSTERK,185, result);
               LDSUCC_APPENDItem(SFKEIOUHALF,186, result);
               LDSUCC_APPENDItem(SFKEIOUHEEL,187, result);
               LDSUCC_APPENDItem(SFKYMINPRES,188, result);
               LDSUCC_APPENDItem(SFKEIOUPD,189, result);
               LDSUCC_APPENDItem(SFKYPLUSPRES,190, result);
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   184{SFKIESE} : BEGIN
               LDSUCC_APPENDItem(SFKSTERK,185, result);
               LDSUCC_APPENDItem(SFKEIOUHALF,186, result);
               LDSUCC_APPENDItem(SFKEIOUHEEL,187, result);
               LDSUCC_APPENDItem(SFKYMINPRES,188, result);
               LDSUCC_APPENDItem(SFKEIOUPD,189, result);
               LDSUCC_APPENDItem(SFKYPLUSPRES,190, result);
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   185{SFKSTERK} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   186{SFKEIOUHALF} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   187{SFKEIOUHEEL} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   188{SFKYMINPRES} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   189{SFKEIOUPD} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   190{SFKYPLUSPRES} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   191{SFKA1RAMOS} : BEGIN
               LDSUCC_APPENDItem(SFKSTERK,203, result);
               LDSUCC_APPENDItem(SFKEIOUHALF,204, result);
               LDSUCC_APPENDItem(SFKEIOUHEEL,205, result);
               LDSUCC_APPENDItem(SFKYMINPRES,206, result);
               LDSUCC_APPENDItem(SFKEIOUPD,207, result);
               LDSUCC_APPENDItem(SFKYPLUSPRES,208, result);
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   192{SFKIE1RAMOS} : BEGIN
               LDSUCC_APPENDItem(SFKSTERK,203, result);
               LDSUCC_APPENDItem(SFKEIOUHALF,204, result);
               LDSUCC_APPENDItem(SFKEIOUHEEL,205, result);
               LDSUCC_APPENDItem(SFKYMINPRES,206, result);
               LDSUCC_APPENDItem(SFKEIOUPD,207, result);
               LDSUCC_APPENDItem(SFKYPLUSPRES,208, result);
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   193{SFKA1SEMOS} : BEGIN
               LDSUCC_APPENDItem(SFKSTERK,203, result);
               LDSUCC_APPENDItem(SFKEIOUHALF,204, result);
               LDSUCC_APPENDItem(SFKEIOUHEEL,205, result);
               LDSUCC_APPENDItem(SFKYMINPRES,206, result);
               LDSUCC_APPENDItem(SFKEIOUPD,207, result);
               LDSUCC_APPENDItem(SFKYPLUSPRES,208, result);
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   194{SFKIE1SEMOS} : BEGIN
               LDSUCC_APPENDItem(SFKSTERK,203, result);
               LDSUCC_APPENDItem(SFKEIOUHALF,204, result);
               LDSUCC_APPENDItem(SFKEIOUHEEL,205, result);
               LDSUCC_APPENDItem(SFKYMINPRES,206, result);
               LDSUCC_APPENDItem(SFKEIOUPD,207, result);
               LDSUCC_APPENDItem(SFKYPLUSPRES,208, result);
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   195{SFKARAIS} : BEGIN
               LDSUCC_APPENDItem(SFKSTERK,203, result);
               LDSUCC_APPENDItem(SFKEIOUHALF,204, result);
               LDSUCC_APPENDItem(SFKEIOUHEEL,205, result);
               LDSUCC_APPENDItem(SFKYMINPRES,206, result);
               LDSUCC_APPENDItem(SFKEIOUPD,207, result);
               LDSUCC_APPENDItem(SFKYPLUSPRES,208, result);
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   196{SFKIERAIS} : BEGIN
               LDSUCC_APPENDItem(SFKSTERK,203, result);
               LDSUCC_APPENDItem(SFKEIOUHALF,204, result);
               LDSUCC_APPENDItem(SFKEIOUHEEL,205, result);
               LDSUCC_APPENDItem(SFKYMINPRES,206, result);
               LDSUCC_APPENDItem(SFKEIOUPD,207, result);
               LDSUCC_APPENDItem(SFKYPLUSPRES,208, result);
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   197{SFKASEIS} : BEGIN
               LDSUCC_APPENDItem(SFKSTERK,203, result);
               LDSUCC_APPENDItem(SFKEIOUHALF,204, result);
               LDSUCC_APPENDItem(SFKEIOUHEEL,205, result);
               LDSUCC_APPENDItem(SFKYMINPRES,206, result);
               LDSUCC_APPENDItem(SFKEIOUPD,207, result);
               LDSUCC_APPENDItem(SFKYPLUSPRES,208, result);
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   198{SFKIESEIS} : BEGIN
               LDSUCC_APPENDItem(SFKSTERK,203, result);
               LDSUCC_APPENDItem(SFKEIOUHALF,204, result);
               LDSUCC_APPENDItem(SFKEIOUHEEL,205, result);
               LDSUCC_APPENDItem(SFKYMINPRES,206, result);
               LDSUCC_APPENDItem(SFKEIOUPD,207, result);
               LDSUCC_APPENDItem(SFKYPLUSPRES,208, result);
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   199{SFKARAN} : BEGIN
               LDSUCC_APPENDItem(SFKSTERK,203, result);
               LDSUCC_APPENDItem(SFKEIOUHALF,204, result);
               LDSUCC_APPENDItem(SFKEIOUHEEL,205, result);
               LDSUCC_APPENDItem(SFKYMINPRES,206, result);
               LDSUCC_APPENDItem(SFKEIOUPD,207, result);
               LDSUCC_APPENDItem(SFKYPLUSPRES,208, result);
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   200{SFKIERAN} : BEGIN
               LDSUCC_APPENDItem(SFKSTERK,203, result);
               LDSUCC_APPENDItem(SFKEIOUHALF,204, result);
               LDSUCC_APPENDItem(SFKEIOUHEEL,205, result);
               LDSUCC_APPENDItem(SFKYMINPRES,206, result);
               LDSUCC_APPENDItem(SFKEIOUPD,207, result);
               LDSUCC_APPENDItem(SFKYPLUSPRES,208, result);
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   201{SFKASEN} : BEGIN
               LDSUCC_APPENDItem(SFKSTERK,203, result);
               LDSUCC_APPENDItem(SFKEIOUHALF,204, result);
               LDSUCC_APPENDItem(SFKEIOUHEEL,205, result);
               LDSUCC_APPENDItem(SFKYMINPRES,206, result);
               LDSUCC_APPENDItem(SFKEIOUPD,207, result);
               LDSUCC_APPENDItem(SFKYPLUSPRES,208, result);
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   202{SFKIESEN} : BEGIN
               LDSUCC_APPENDItem(SFKSTERK,203, result);
               LDSUCC_APPENDItem(SFKEIOUHALF,204, result);
               LDSUCC_APPENDItem(SFKEIOUHEEL,205, result);
               LDSUCC_APPENDItem(SFKYMINPRES,206, result);
               LDSUCC_APPENDItem(SFKEIOUPD,207, result);
               LDSUCC_APPENDItem(SFKYPLUSPRES,208, result);
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   203{SFKSTERK} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   204{SFKEIOUHALF} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   205{SFKEIOUHEEL} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   206{SFKYMINPRES} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   207{SFKEIOUPD} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   208{SFKYPLUSPRES} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   209{SFKARE1} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   210{SFKERE1} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   211{SFKIRE1} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   212{SFKARA1S} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   213{SFKERA1S} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   214{SFKIRA1S} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   215{SFKARA1} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   216{SFKERA1} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   217{SFKIRA1} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   218{SFKAREMOS} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   219{SFKEREMOS} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   220{SFKIREMOS} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   221{SFKARE1IS} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   222{SFKERE1IS} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   223{SFKIRE1IS} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   224{SFKARA1N} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   225{SFKERA1N} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   226{SFKIRA1N} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   227{SFKARI1A} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   228{SFKERI1A} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   229{SFKIRI1A} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   230{SFKARI1AS} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   231{SFKERI1AS} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   232{SFKIRI1AS} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   233{SFKARI1A} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   234{SFKERI1A} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   235{SFKIRI1A} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   236{SFKARI1AMOS} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   237{SFKERI1AMOS} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   238{SFKIRI1AMOS} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   239{SFKARI1AIS} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   240{SFKERI1AIS} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   241{SFKIRI1AIS} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   242{SFKARI1AN} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   243{SFKERI1AN} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   244{SFKIRI1AN} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   245{SFKAR} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   246{SFKER} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   247{SFKIR} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   248{SFKIRRINF} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   249{SFKA} : BEGIN
               LDSUCC_APPENDItem(SFKDIFTONG,252, result);
               LDSUCC_APPENDItem(SFKEIOUHEEL,253, result);
               LDSUCC_APPENDItem(SFKVE,254, result);
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   250{SFKE} : BEGIN
               LDSUCC_APPENDItem(SFKDIFTONG,252, result);
               LDSUCC_APPENDItem(SFKEIOUHEEL,253, result);
               LDSUCC_APPENDItem(SFKVE,254, result);
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   251{SFKE1} : BEGIN
               LDSUCC_APPENDItem(SFKDIFTONG,252, result);
               LDSUCC_APPENDItem(SFKEIOUHEEL,253, result);
               LDSUCC_APPENDItem(SFKVE,254, result);
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   252{SFKDIFTONG} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   253{SFKEIOUHEEL} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   254{SFKVE} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   255{SFKAD} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   256{SFKED} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   257{SFKID} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   258{SFKIRRIMPERATSG} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   259{SFKADO} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   260{SFKIDO} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   261{SFKADA} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   262{SFKIDA} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   263{SFKADOS} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   264{SFKIDOS} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   265{SFKADAS} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   266{SFKIDAS} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   267{SFKIRRPTCPASMASCSG} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   268{SFKIRRPTCPASMASCPL} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   269{SFKIRRPTCPASFEMSG} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   270{SFKIRRPTCPASFEMPL} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   271{SFKANDO} : BEGIN
               LDSUCC_APPENDItem(SFKEIOUHALF,273, result);
               LDSUCC_APPENDItem(SFKEIOUHEEL,274, result);
               LDSUCC_APPENDItem(SFKYMINPRES,275, result);
               LDSUCC_APPENDItem(SFKEIOUPD,276, result);
               LDSUCC_APPENDItem(SFKYPLUSPRES,277, result);
               LDSUCC_APPENDItem(SFKBENDIC,278, result);
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   272{SFKIENDO} : BEGIN
               LDSUCC_APPENDItem(SFKEIOUHALF,273, result);
               LDSUCC_APPENDItem(SFKEIOUHEEL,274, result);
               LDSUCC_APPENDItem(SFKYMINPRES,275, result);
               LDSUCC_APPENDItem(SFKEIOUPD,276, result);
               LDSUCC_APPENDItem(SFKYPLUSPRES,277, result);
               LDSUCC_APPENDItem(SFKBENDIC,278, result);
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   273{SFKEIOUHALF} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   274{SFKEIOUHEEL} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   275{SFKYMINPRES} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   276{SFKEIOUPD} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   277{SFKYPLUSPRES} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   278{SFKBENDIC} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   279{SFKIRR1PSSGIND} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   280{SFKREGPL} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   281{SFKIRRPL} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   282{SFKEXTRANPL} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   283{SFKAPOCOPE} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   284{SFKREGPL} : BEGIN
               LDSUCC_APPENDItem(SFKREGFEM,286, result);
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   285{SFKIRRPL} : BEGIN
               LDSUCC_APPENDItem(SFKREGFEM,286, result);
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   286{SFKREGFEM} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   287{SFKIRRCOMPAR} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   288{SFKREGPL} : BEGIN
               LDSUCC_APPENDItem(SFKREGFEM,290, result);
               LDSUCC_APPENDItem(SFKO,291, result);
               END;
   289{SFKIRRPL} : BEGIN
               LDSUCC_APPENDItem(SFKREGFEM,290, result);
               LDSUCC_APPENDItem(SFKO,291, result);
               END;
   290{SFKREGFEM} : BEGIN
               LDSUCC_APPENDItem(SFKO,291, result);
               END;
   291{SFKO} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   292{SFKAPOCOPE} : BEGIN
               LDSUCC_APPENDItem(SFKO,293, result);
               END;
   293{SFKO} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   294{SFKCLITICOD} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   295{SFKCLITICODM} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   296{SFKCLITICODF} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   297{SFKCLITICOD1} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   298{SFKCLITICOI} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   299{SFKPRONFUERTE} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   300{SFKPOSADJ} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   301{SFKREGPL} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   302{SFKPOSADJFUERTE} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   303{SFKREGFEM} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   304{SFKREGPL} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   305{SFKMASCDEMADJPL} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   306{SFKFEMDEMADJSG} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   307{SFKFEMDEMADJPL} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   308{SFKMASCDEMPROPL} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   309{SFKFEMDEMPROSG} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   310{SFKFEMDEMPROPL} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   311{SFKNEUTDEMPRO} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   312{SFKREGFEM} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   313{SFKREGFEM} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   314{SFKREGPL} : BEGIN
               LDSUCC_APPENDItem(SFKREGFEM,316, result);
               LDSUCC_APPENDItem(SFKO,317, result);
               LDSUCC_APPENDItem(SFK0,318, result);
               LDSUCC_APPENDItem(SFK1,319, result);
               LDSUCC_APPENDItem(SFK2,320, result);
               LDSUCC_APPENDItem(SFK3,321, result);
               LDSUCC_APPENDItem(SFK4,322, result);
               LDSUCC_APPENDItem(SFK5,323, result);
               LDSUCC_APPENDItem(SFK6,324, result);
               LDSUCC_APPENDItem(SFK7,325, result);
               LDSUCC_APPENDItem(SFK8,326, result);
               LDSUCC_APPENDItem(SFK9,327, result);
               END;
   315{SFKIRRPL} : BEGIN
               LDSUCC_APPENDItem(SFKREGFEM,316, result);
               LDSUCC_APPENDItem(SFKO,317, result);
               LDSUCC_APPENDItem(SFK0,318, result);
               LDSUCC_APPENDItem(SFK1,319, result);
               LDSUCC_APPENDItem(SFK2,320, result);
               LDSUCC_APPENDItem(SFK3,321, result);
               LDSUCC_APPENDItem(SFK4,322, result);
               LDSUCC_APPENDItem(SFK5,323, result);
               LDSUCC_APPENDItem(SFK6,324, result);
               LDSUCC_APPENDItem(SFK7,325, result);
               LDSUCC_APPENDItem(SFK8,326, result);
               LDSUCC_APPENDItem(SFK9,327, result);
               END;
   316{SFKREGFEM} : BEGIN
               LDSUCC_APPENDItem(SFKO,317, result);
               LDSUCC_APPENDItem(SFK0,318, result);
               LDSUCC_APPENDItem(SFK1,319, result);
               LDSUCC_APPENDItem(SFK2,320, result);
               LDSUCC_APPENDItem(SFK3,321, result);
               LDSUCC_APPENDItem(SFK4,322, result);
               LDSUCC_APPENDItem(SFK5,323, result);
               LDSUCC_APPENDItem(SFK6,324, result);
               LDSUCC_APPENDItem(SFK7,325, result);
               LDSUCC_APPENDItem(SFK8,326, result);
               LDSUCC_APPENDItem(SFK9,327, result);
               END;
   317{SFKO} : BEGIN
               LDSUCC_APPENDItem(SFK0,318, result);
               LDSUCC_APPENDItem(SFK1,319, result);
               LDSUCC_APPENDItem(SFK2,320, result);
               LDSUCC_APPENDItem(SFK3,321, result);
               LDSUCC_APPENDItem(SFK4,322, result);
               LDSUCC_APPENDItem(SFK5,323, result);
               LDSUCC_APPENDItem(SFK6,324, result);
               LDSUCC_APPENDItem(SFK7,325, result);
               LDSUCC_APPENDItem(SFK8,326, result);
               LDSUCC_APPENDItem(SFK9,327, result);
               END;
   318{SFK0} : BEGIN
               LDSUCC_APPENDItem(SFK0,328, result);
               LDSUCC_APPENDItem(SFK1,329, result);
               LDSUCC_APPENDItem(SFK2,330, result);
               LDSUCC_APPENDItem(SFK3,331, result);
               LDSUCC_APPENDItem(SFK4,332, result);
               LDSUCC_APPENDItem(SFK5,333, result);
               LDSUCC_APPENDItem(SFK6,334, result);
               LDSUCC_APPENDItem(SFK7,335, result);
               LDSUCC_APPENDItem(SFK8,336, result);
               LDSUCC_APPENDItem(SFK9,337, result);
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   319{SFK1} : BEGIN
               LDSUCC_APPENDItem(SFK0,328, result);
               LDSUCC_APPENDItem(SFK1,329, result);
               LDSUCC_APPENDItem(SFK2,330, result);
               LDSUCC_APPENDItem(SFK3,331, result);
               LDSUCC_APPENDItem(SFK4,332, result);
               LDSUCC_APPENDItem(SFK5,333, result);
               LDSUCC_APPENDItem(SFK6,334, result);
               LDSUCC_APPENDItem(SFK7,335, result);
               LDSUCC_APPENDItem(SFK8,336, result);
               LDSUCC_APPENDItem(SFK9,337, result);
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   320{SFK2} : BEGIN
               LDSUCC_APPENDItem(SFK0,328, result);
               LDSUCC_APPENDItem(SFK1,329, result);
               LDSUCC_APPENDItem(SFK2,330, result);
               LDSUCC_APPENDItem(SFK3,331, result);
               LDSUCC_APPENDItem(SFK4,332, result);
               LDSUCC_APPENDItem(SFK5,333, result);
               LDSUCC_APPENDItem(SFK6,334, result);
               LDSUCC_APPENDItem(SFK7,335, result);
               LDSUCC_APPENDItem(SFK8,336, result);
               LDSUCC_APPENDItem(SFK9,337, result);
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   321{SFK3} : BEGIN
               LDSUCC_APPENDItem(SFK0,328, result);
               LDSUCC_APPENDItem(SFK1,329, result);
               LDSUCC_APPENDItem(SFK2,330, result);
               LDSUCC_APPENDItem(SFK3,331, result);
               LDSUCC_APPENDItem(SFK4,332, result);
               LDSUCC_APPENDItem(SFK5,333, result);
               LDSUCC_APPENDItem(SFK6,334, result);
               LDSUCC_APPENDItem(SFK7,335, result);
               LDSUCC_APPENDItem(SFK8,336, result);
               LDSUCC_APPENDItem(SFK9,337, result);
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   322{SFK4} : BEGIN
               LDSUCC_APPENDItem(SFK0,328, result);
               LDSUCC_APPENDItem(SFK1,329, result);
               LDSUCC_APPENDItem(SFK2,330, result);
               LDSUCC_APPENDItem(SFK3,331, result);
               LDSUCC_APPENDItem(SFK4,332, result);
               LDSUCC_APPENDItem(SFK5,333, result);
               LDSUCC_APPENDItem(SFK6,334, result);
               LDSUCC_APPENDItem(SFK7,335, result);
               LDSUCC_APPENDItem(SFK8,336, result);
               LDSUCC_APPENDItem(SFK9,337, result);
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   323{SFK5} : BEGIN
               LDSUCC_APPENDItem(SFK0,328, result);
               LDSUCC_APPENDItem(SFK1,329, result);
               LDSUCC_APPENDItem(SFK2,330, result);
               LDSUCC_APPENDItem(SFK3,331, result);
               LDSUCC_APPENDItem(SFK4,332, result);
               LDSUCC_APPENDItem(SFK5,333, result);
               LDSUCC_APPENDItem(SFK6,334, result);
               LDSUCC_APPENDItem(SFK7,335, result);
               LDSUCC_APPENDItem(SFK8,336, result);
               LDSUCC_APPENDItem(SFK9,337, result);
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   324{SFK6} : BEGIN
               LDSUCC_APPENDItem(SFK0,328, result);
               LDSUCC_APPENDItem(SFK1,329, result);
               LDSUCC_APPENDItem(SFK2,330, result);
               LDSUCC_APPENDItem(SFK3,331, result);
               LDSUCC_APPENDItem(SFK4,332, result);
               LDSUCC_APPENDItem(SFK5,333, result);
               LDSUCC_APPENDItem(SFK6,334, result);
               LDSUCC_APPENDItem(SFK7,335, result);
               LDSUCC_APPENDItem(SFK8,336, result);
               LDSUCC_APPENDItem(SFK9,337, result);
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   325{SFK7} : BEGIN
               LDSUCC_APPENDItem(SFK0,328, result);
               LDSUCC_APPENDItem(SFK1,329, result);
               LDSUCC_APPENDItem(SFK2,330, result);
               LDSUCC_APPENDItem(SFK3,331, result);
               LDSUCC_APPENDItem(SFK4,332, result);
               LDSUCC_APPENDItem(SFK5,333, result);
               LDSUCC_APPENDItem(SFK6,334, result);
               LDSUCC_APPENDItem(SFK7,335, result);
               LDSUCC_APPENDItem(SFK8,336, result);
               LDSUCC_APPENDItem(SFK9,337, result);
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   326{SFK8} : BEGIN
               LDSUCC_APPENDItem(SFK0,328, result);
               LDSUCC_APPENDItem(SFK1,329, result);
               LDSUCC_APPENDItem(SFK2,330, result);
               LDSUCC_APPENDItem(SFK3,331, result);
               LDSUCC_APPENDItem(SFK4,332, result);
               LDSUCC_APPENDItem(SFK5,333, result);
               LDSUCC_APPENDItem(SFK6,334, result);
               LDSUCC_APPENDItem(SFK7,335, result);
               LDSUCC_APPENDItem(SFK8,336, result);
               LDSUCC_APPENDItem(SFK9,337, result);
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   327{SFK9} : BEGIN
               LDSUCC_APPENDItem(SFK0,328, result);
               LDSUCC_APPENDItem(SFK1,329, result);
               LDSUCC_APPENDItem(SFK2,330, result);
               LDSUCC_APPENDItem(SFK3,331, result);
               LDSUCC_APPENDItem(SFK4,332, result);
               LDSUCC_APPENDItem(SFK5,333, result);
               LDSUCC_APPENDItem(SFK6,334, result);
               LDSUCC_APPENDItem(SFK7,335, result);
               LDSUCC_APPENDItem(SFK8,336, result);
               LDSUCC_APPENDItem(SFK9,337, result);
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               END;
   328{SFK0} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               LDSUCC_APPENDItem(SFK0,328, result);
               LDSUCC_APPENDItem(SFK1,329, result);
               LDSUCC_APPENDItem(SFK2,330, result);
               LDSUCC_APPENDItem(SFK3,331, result);
               LDSUCC_APPENDItem(SFK4,332, result);
               LDSUCC_APPENDItem(SFK5,333, result);
               LDSUCC_APPENDItem(SFK6,334, result);
               LDSUCC_APPENDItem(SFK7,335, result);
               LDSUCC_APPENDItem(SFK8,336, result);
               LDSUCC_APPENDItem(SFK9,337, result);
               END;
   329{SFK1} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               LDSUCC_APPENDItem(SFK0,328, result);
               LDSUCC_APPENDItem(SFK1,329, result);
               LDSUCC_APPENDItem(SFK2,330, result);
               LDSUCC_APPENDItem(SFK3,331, result);
               LDSUCC_APPENDItem(SFK4,332, result);
               LDSUCC_APPENDItem(SFK5,333, result);
               LDSUCC_APPENDItem(SFK6,334, result);
               LDSUCC_APPENDItem(SFK7,335, result);
               LDSUCC_APPENDItem(SFK8,336, result);
               LDSUCC_APPENDItem(SFK9,337, result);
               END;
   330{SFK2} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               LDSUCC_APPENDItem(SFK0,328, result);
               LDSUCC_APPENDItem(SFK1,329, result);
               LDSUCC_APPENDItem(SFK2,330, result);
               LDSUCC_APPENDItem(SFK3,331, result);
               LDSUCC_APPENDItem(SFK4,332, result);
               LDSUCC_APPENDItem(SFK5,333, result);
               LDSUCC_APPENDItem(SFK6,334, result);
               LDSUCC_APPENDItem(SFK7,335, result);
               LDSUCC_APPENDItem(SFK8,336, result);
               LDSUCC_APPENDItem(SFK9,337, result);
               END;
   331{SFK3} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               LDSUCC_APPENDItem(SFK0,328, result);
               LDSUCC_APPENDItem(SFK1,329, result);
               LDSUCC_APPENDItem(SFK2,330, result);
               LDSUCC_APPENDItem(SFK3,331, result);
               LDSUCC_APPENDItem(SFK4,332, result);
               LDSUCC_APPENDItem(SFK5,333, result);
               LDSUCC_APPENDItem(SFK6,334, result);
               LDSUCC_APPENDItem(SFK7,335, result);
               LDSUCC_APPENDItem(SFK8,336, result);
               LDSUCC_APPENDItem(SFK9,337, result);
               END;
   332{SFK4} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               LDSUCC_APPENDItem(SFK0,328, result);
               LDSUCC_APPENDItem(SFK1,329, result);
               LDSUCC_APPENDItem(SFK2,330, result);
               LDSUCC_APPENDItem(SFK3,331, result);
               LDSUCC_APPENDItem(SFK4,332, result);
               LDSUCC_APPENDItem(SFK5,333, result);
               LDSUCC_APPENDItem(SFK6,334, result);
               LDSUCC_APPENDItem(SFK7,335, result);
               LDSUCC_APPENDItem(SFK8,336, result);
               LDSUCC_APPENDItem(SFK9,337, result);
               END;
   333{SFK5} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               LDSUCC_APPENDItem(SFK0,328, result);
               LDSUCC_APPENDItem(SFK1,329, result);
               LDSUCC_APPENDItem(SFK2,330, result);
               LDSUCC_APPENDItem(SFK3,331, result);
               LDSUCC_APPENDItem(SFK4,332, result);
               LDSUCC_APPENDItem(SFK5,333, result);
               LDSUCC_APPENDItem(SFK6,334, result);
               LDSUCC_APPENDItem(SFK7,335, result);
               LDSUCC_APPENDItem(SFK8,336, result);
               LDSUCC_APPENDItem(SFK9,337, result);
               END;
   334{SFK6} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               LDSUCC_APPENDItem(SFK0,328, result);
               LDSUCC_APPENDItem(SFK1,329, result);
               LDSUCC_APPENDItem(SFK2,330, result);
               LDSUCC_APPENDItem(SFK3,331, result);
               LDSUCC_APPENDItem(SFK4,332, result);
               LDSUCC_APPENDItem(SFK5,333, result);
               LDSUCC_APPENDItem(SFK6,334, result);
               LDSUCC_APPENDItem(SFK7,335, result);
               LDSUCC_APPENDItem(SFK8,336, result);
               LDSUCC_APPENDItem(SFK9,337, result);
               END;
   335{SFK7} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               LDSUCC_APPENDItem(SFK0,328, result);
               LDSUCC_APPENDItem(SFK1,329, result);
               LDSUCC_APPENDItem(SFK2,330, result);
               LDSUCC_APPENDItem(SFK3,331, result);
               LDSUCC_APPENDItem(SFK4,332, result);
               LDSUCC_APPENDItem(SFK5,333, result);
               LDSUCC_APPENDItem(SFK6,334, result);
               LDSUCC_APPENDItem(SFK7,335, result);
               LDSUCC_APPENDItem(SFK8,336, result);
               LDSUCC_APPENDItem(SFK9,337, result);
               END;
   336{SFK8} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               LDSUCC_APPENDItem(SFK0,328, result);
               LDSUCC_APPENDItem(SFK1,329, result);
               LDSUCC_APPENDItem(SFK2,330, result);
               LDSUCC_APPENDItem(SFK3,331, result);
               LDSUCC_APPENDItem(SFK4,332, result);
               LDSUCC_APPENDItem(SFK5,333, result);
               LDSUCC_APPENDItem(SFK6,334, result);
               LDSUCC_APPENDItem(SFK7,335, result);
               LDSUCC_APPENDItem(SFK8,336, result);
               LDSUCC_APPENDItem(SFK9,337, result);
               END;
   337{SFK9} : BEGIN
               LDSUCC_APPENDItem(LDSUCC_TrailerAffix,-1, result);
               LDSUCC_APPENDItem(SFK0,328, result);
               LDSUCC_APPENDItem(SFK1,329, result);
               LDSUCC_APPENDItem(SFK2,330, result);
               LDSUCC_APPENDItem(SFK3,331, result);
               LDSUCC_APPENDItem(SFK4,332, result);
               LDSUCC_APPENDItem(SFK5,333, result);
               LDSUCC_APPENDItem(SFK6,334, result);
               LDSUCC_APPENDItem(SFK7,335, result);
               LDSUCC_APPENDItem(SFK8,336, result);
               LDSUCC_APPENDItem(SFK9,337, result);
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

