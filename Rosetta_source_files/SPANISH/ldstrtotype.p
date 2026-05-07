Export(LDSTRTOTYPE);
pragma c_include('ldstrtotype.pf');
pragma c_include('str.pf');
pragma c_include('limorfdef.pf');
pragma c_include('lsdomaint.pf');
pragma c_include('lidomaint.pf');

PROGRAM LDSTRTOTYPE;

WITH STR,
     LIMORFDEF,
     LSDOMAINT,
     LIDOMAINT;



FUNCTION LDSTRTOTYPE_AFFIX(
         CONST str: STRING;
        l: STR_Range;
         VAR afx: INTEGER): BOOLEAN;
LABEL 99;
BEGIN
   LDSTRTOTYPE_AFFIX := false;
   IF STR_Compare(str, l,'SFKdiftong', STR_Max) = 0 THEN BEGIN
      afx := SFKdiftong;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKirrMedek', STR_Max) = 0 THEN BEGIN
      afx := SFKirrMedek;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKsterk', STR_Max) = 0 THEN BEGIN
      afx := SFKsterk;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKeiouHalf', STR_Max) = 0 THEN BEGIN
      afx := SFKeiouHalf;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKeiouHeel', STR_Max) = 0 THEN BEGIN
      afx := SFKeiouHeel;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKyMinPres', STR_Max) = 0 THEN BEGIN
      afx := SFKyMinPres;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKeiouPD', STR_Max) = 0 THEN BEGIN
      afx := SFKeiouPD;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKumlaut', STR_Max) = 0 THEN BEGIN
      afx := SFKumlaut;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKve', STR_Max) = 0 THEN BEGIN
      afx := SFKve;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKyPlusPres', STR_Max) = 0 THEN BEGIN
      afx := SFKyPlusPres;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKbendic', STR_Max) = 0 THEN BEGIN
      afx := SFKbendic;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKsepa', STR_Max) = 0 THEN BEGIN
      afx := SFKsepa;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFK1SgIndPres', STR_Max) = 0 THEN BEGIN
      afx := SFK1SgIndPres;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFK2SgIndPres', STR_Max) = 0 THEN BEGIN
      afx := SFK2SgIndPres;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFK3SgIndPres', STR_Max) = 0 THEN BEGIN
      afx := SFK3SgIndPres;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFK1PlIndPres', STR_Max) = 0 THEN BEGIN
      afx := SFK1PlIndPres;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFK2PlIndPres', STR_Max) = 0 THEN BEGIN
      afx := SFK2PlIndPres;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFK3PlIndPres', STR_Max) = 0 THEN BEGIN
      afx := SFK3PlIndPres;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFK1Sg3SubjPres', STR_Max) = 0 THEN BEGIN
      afx := SFK1Sg3SubjPres;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFK2SgSubjPres', STR_Max) = 0 THEN BEGIN
      afx := SFK2SgSubjPres;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFK1PlSubjPres', STR_Max) = 0 THEN BEGIN
      afx := SFK1PlSubjPres;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFK2PlSubjPres', STR_Max) = 0 THEN BEGIN
      afx := SFK2PlSubjPres;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFK3PlSubjPres', STR_Max) = 0 THEN BEGIN
      afx := SFK3PlSubjPres;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFK1Sg3Imperf', STR_Max) = 0 THEN BEGIN
      afx := SFK1Sg3Imperf;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFK2SgImperf', STR_Max) = 0 THEN BEGIN
      afx := SFK2SgImperf;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFK1PlImperf', STR_Max) = 0 THEN BEGIN
      afx := SFK1PlImperf;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFK2PlImperf', STR_Max) = 0 THEN BEGIN
      afx := SFK2PlImperf;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFK3PlImperf', STR_Max) = 0 THEN BEGIN
      afx := SFK3PlImperf;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFK1SgPD', STR_Max) = 0 THEN BEGIN
      afx := SFK1SgPD;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFK2SgPD', STR_Max) = 0 THEN BEGIN
      afx := SFK2SgPD;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFK3SgPD', STR_Max) = 0 THEN BEGIN
      afx := SFK3SgPD;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFK1PlPD', STR_Max) = 0 THEN BEGIN
      afx := SFK1PlPD;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFK2PlPD', STR_Max) = 0 THEN BEGIN
      afx := SFK2PlPD;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFK3PlPD', STR_Max) = 0 THEN BEGIN
      afx := SFK3PlPD;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFK1SgFut', STR_Max) = 0 THEN BEGIN
      afx := SFK1SgFut;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFK2SgFut', STR_Max) = 0 THEN BEGIN
      afx := SFK2SgFut;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFK3SgFut', STR_Max) = 0 THEN BEGIN
      afx := SFK3SgFut;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFK1PlFut', STR_Max) = 0 THEN BEGIN
      afx := SFK1PlFut;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFK2PlFut', STR_Max) = 0 THEN BEGIN
      afx := SFK2PlFut;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFK3PlFut', STR_Max) = 0 THEN BEGIN
      afx := SFK3PlFut;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFK1Sg3Cond', STR_Max) = 0 THEN BEGIN
      afx := SFK1Sg3Cond;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFK2SgCond', STR_Max) = 0 THEN BEGIN
      afx := SFK2SgCond;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFK1PlCond', STR_Max) = 0 THEN BEGIN
      afx := SFK1PlCond;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFK2PlCond', STR_Max) = 0 THEN BEGIN
      afx := SFK2PlCond;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFK3PlCond', STR_Max) = 0 THEN BEGIN
      afx := SFK3PlCond;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKsgImperat', STR_Max) = 0 THEN BEGIN
      afx := SFKsgImperat;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKplImperat', STR_Max) = 0 THEN BEGIN
      afx := SFKplImperat;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFK1Sg3SubjPas', STR_Max) = 0 THEN BEGIN
      afx := SFK1Sg3SubjPas;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFK2SgSubjPas', STR_Max) = 0 THEN BEGIN
      afx := SFK2SgSubjPas;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFK1PlSubjPas', STR_Max) = 0 THEN BEGIN
      afx := SFK1PlSubjPas;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFK2PlSubjPas', STR_Max) = 0 THEN BEGIN
      afx := SFK2PlSubjPas;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFK3PlSubjPas', STR_Max) = 0 THEN BEGIN
      afx := SFK3PlSubjPas;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFK1Sg3SubjPasa', STR_Max) = 0 THEN BEGIN
      afx := SFK1Sg3SubjPasa;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFK2SgSubjPasa', STR_Max) = 0 THEN BEGIN
      afx := SFK2SgSubjPasa;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFK1PlSubjPasa', STR_Max) = 0 THEN BEGIN
      afx := SFK1PlSubjPasa;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFK2PlSubjPasa', STR_Max) = 0 THEN BEGIN
      afx := SFK2PlSubjPasa;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFK3PlSubjPasa', STR_Max) = 0 THEN BEGIN
      afx := SFK3PlSubjPasa;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKgerundio', STR_Max) = 0 THEN BEGIN
      afx := SFKgerundio;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKPtcPasMascSg', STR_Max) = 0 THEN BEGIN
      afx := SFKPtcPasMascSg;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKPtcPasMascPl', STR_Max) = 0 THEN BEGIN
      afx := SFKPtcPasMascPl;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKPtcPasFemSg', STR_Max) = 0 THEN BEGIN
      afx := SFKPtcPasFemSg;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKPtcPasFemPl', STR_Max) = 0 THEN BEGIN
      afx := SFKPtcPasFemPl;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKcliticOD', STR_Max) = 0 THEN BEGIN
      afx := SFKcliticOD;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKcliticOD1', STR_Max) = 0 THEN BEGIN
      afx := SFKcliticOD1;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKcliticODm', STR_Max) = 0 THEN BEGIN
      afx := SFKcliticODm;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKcliticODf', STR_Max) = 0 THEN BEGIN
      afx := SFKcliticODf;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKcliticOI', STR_Max) = 0 THEN BEGIN
      afx := SFKcliticOI;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKpronFuerte', STR_Max) = 0 THEN BEGIN
      afx := SFKpronFuerte;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKposAdj', STR_Max) = 0 THEN BEGIN
      afx := SFKposAdj;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKposAdjFuerte', STR_Max) = 0 THEN BEGIN
      afx := SFKposAdjFuerte;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKregPL', STR_Max) = 0 THEN BEGIN
      afx := SFKregPL;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKirrPL', STR_Max) = 0 THEN BEGIN
      afx := SFKirrPL;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKextranPL', STR_Max) = 0 THEN BEGIN
      afx := SFKextranPL;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKapocope', STR_Max) = 0 THEN BEGIN
      afx := SFKapocope;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKregFEM', STR_Max) = 0 THEN BEGIN
      afx := SFKregFEM;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKirrImperatSG', STR_Max) = 0 THEN BEGIN
      afx := SFKirrImperatSG;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKirrPtcPasMascSg', STR_Max) = 0 THEN BEGIN
      afx := SFKirrPtcPasMascSg;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKirrPtcPasMascPl', STR_Max) = 0 THEN BEGIN
      afx := SFKirrPtcPasMascPl;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKirrPtcPasFemSg', STR_Max) = 0 THEN BEGIN
      afx := SFKirrPtcPasFemSg;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKirrPtcPasFemPl', STR_Max) = 0 THEN BEGIN
      afx := SFKirrPtcPasFemPl;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKirr1psSgInd', STR_Max) = 0 THEN BEGIN
      afx := SFKirr1psSgInd;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKirrInf', STR_Max) = 0 THEN BEGIN
      afx := SFKirrInf;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKo', STR_Max) = 0 THEN BEGIN
      afx := SFKo;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKas', STR_Max) = 0 THEN BEGIN
      afx := SFKas;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKa', STR_Max) = 0 THEN BEGIN
      afx := SFKa;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKamos', STR_Max) = 0 THEN BEGIN
      afx := SFKamos;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKemos', STR_Max) = 0 THEN BEGIN
      afx := SFKemos;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKa1is', STR_Max) = 0 THEN BEGIN
      afx := SFKa1is;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKe1is', STR_Max) = 0 THEN BEGIN
      afx := SFKe1is;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKan', STR_Max) = 0 THEN BEGIN
      afx := SFKan;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKaba', STR_Max) = 0 THEN BEGIN
      afx := SFKaba;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKabas', STR_Max) = 0 THEN BEGIN
      afx := SFKabas;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKa1bamos', STR_Max) = 0 THEN BEGIN
      afx := SFKa1bamos;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKabais', STR_Max) = 0 THEN BEGIN
      afx := SFKabais;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKaban', STR_Max) = 0 THEN BEGIN
      afx := SFKaban;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKe1', STR_Max) = 0 THEN BEGIN
      afx := SFKe1;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKaste', STR_Max) = 0 THEN BEGIN
      afx := SFKaste;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKo1', STR_Max) = 0 THEN BEGIN
      afx := SFKo1;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKasteis', STR_Max) = 0 THEN BEGIN
      afx := SFKasteis;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKaron', STR_Max) = 0 THEN BEGIN
      afx := SFKaron;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKare1', STR_Max) = 0 THEN BEGIN
      afx := SFKare1;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKara1s', STR_Max) = 0 THEN BEGIN
      afx := SFKara1s;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKara1', STR_Max) = 0 THEN BEGIN
      afx := SFKara1;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKaremos', STR_Max) = 0 THEN BEGIN
      afx := SFKaremos;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKare1is', STR_Max) = 0 THEN BEGIN
      afx := SFKare1is;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKara1n', STR_Max) = 0 THEN BEGIN
      afx := SFKara1n;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKari1a', STR_Max) = 0 THEN BEGIN
      afx := SFKari1a;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKari1as', STR_Max) = 0 THEN BEGIN
      afx := SFKari1as;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKari1amos', STR_Max) = 0 THEN BEGIN
      afx := SFKari1amos;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKari1ais', STR_Max) = 0 THEN BEGIN
      afx := SFKari1ais;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKari1an', STR_Max) = 0 THEN BEGIN
      afx := SFKari1an;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKad', STR_Max) = 0 THEN BEGIN
      afx := SFKad;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKando', STR_Max) = 0 THEN BEGIN
      afx := SFKando;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKado', STR_Max) = 0 THEN BEGIN
      afx := SFKado;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKe', STR_Max) = 0 THEN BEGIN
      afx := SFKe;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKes', STR_Max) = 0 THEN BEGIN
      afx := SFKes;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKen', STR_Max) = 0 THEN BEGIN
      afx := SFKen;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKara', STR_Max) = 0 THEN BEGIN
      afx := SFKara;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKaras', STR_Max) = 0 THEN BEGIN
      afx := SFKaras;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKa1ramos', STR_Max) = 0 THEN BEGIN
      afx := SFKa1ramos;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKarais', STR_Max) = 0 THEN BEGIN
      afx := SFKarais;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKaran', STR_Max) = 0 THEN BEGIN
      afx := SFKaran;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKase', STR_Max) = 0 THEN BEGIN
      afx := SFKase;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKases', STR_Max) = 0 THEN BEGIN
      afx := SFKases;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKa1semos', STR_Max) = 0 THEN BEGIN
      afx := SFKa1semos;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKaseis', STR_Max) = 0 THEN BEGIN
      afx := SFKaseis;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKasen', STR_Max) = 0 THEN BEGIN
      afx := SFKasen;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKi1a', STR_Max) = 0 THEN BEGIN
      afx := SFKi1a;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKi1as', STR_Max) = 0 THEN BEGIN
      afx := SFKi1as;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKi1amos', STR_Max) = 0 THEN BEGIN
      afx := SFKi1amos;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKi1ais', STR_Max) = 0 THEN BEGIN
      afx := SFKi1ais;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKi1an', STR_Max) = 0 THEN BEGIN
      afx := SFKi1an;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKi1', STR_Max) = 0 THEN BEGIN
      afx := SFKi1;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKiste', STR_Max) = 0 THEN BEGIN
      afx := SFKiste;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKio1', STR_Max) = 0 THEN BEGIN
      afx := SFKio1;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKisteis', STR_Max) = 0 THEN BEGIN
      afx := SFKisteis;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKieron', STR_Max) = 0 THEN BEGIN
      afx := SFKieron;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKere1', STR_Max) = 0 THEN BEGIN
      afx := SFKere1;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKera1s', STR_Max) = 0 THEN BEGIN
      afx := SFKera1s;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKera1', STR_Max) = 0 THEN BEGIN
      afx := SFKera1;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKeremos', STR_Max) = 0 THEN BEGIN
      afx := SFKeremos;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKere1is', STR_Max) = 0 THEN BEGIN
      afx := SFKere1is;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKera1n', STR_Max) = 0 THEN BEGIN
      afx := SFKera1n;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKeri1a', STR_Max) = 0 THEN BEGIN
      afx := SFKeri1a;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKeri1as', STR_Max) = 0 THEN BEGIN
      afx := SFKeri1as;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKeri1amos', STR_Max) = 0 THEN BEGIN
      afx := SFKeri1amos;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKeri1ais', STR_Max) = 0 THEN BEGIN
      afx := SFKeri1ais;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKeri1an', STR_Max) = 0 THEN BEGIN
      afx := SFKeri1an;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKed', STR_Max) = 0 THEN BEGIN
      afx := SFKed;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKiera', STR_Max) = 0 THEN BEGIN
      afx := SFKiera;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKieras', STR_Max) = 0 THEN BEGIN
      afx := SFKieras;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKie1ramos', STR_Max) = 0 THEN BEGIN
      afx := SFKie1ramos;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKierais', STR_Max) = 0 THEN BEGIN
      afx := SFKierais;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKieran', STR_Max) = 0 THEN BEGIN
      afx := SFKieran;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKiese', STR_Max) = 0 THEN BEGIN
      afx := SFKiese;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKieses', STR_Max) = 0 THEN BEGIN
      afx := SFKieses;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKie1semos', STR_Max) = 0 THEN BEGIN
      afx := SFKie1semos;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKieseis', STR_Max) = 0 THEN BEGIN
      afx := SFKieseis;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKiesen', STR_Max) = 0 THEN BEGIN
      afx := SFKiesen;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKiendo', STR_Max) = 0 THEN BEGIN
      afx := SFKiendo;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKido', STR_Max) = 0 THEN BEGIN
      afx := SFKido;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKimos', STR_Max) = 0 THEN BEGIN
      afx := SFKimos;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKi1s', STR_Max) = 0 THEN BEGIN
      afx := SFKi1s;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKire1', STR_Max) = 0 THEN BEGIN
      afx := SFKire1;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKira1s', STR_Max) = 0 THEN BEGIN
      afx := SFKira1s;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKira1', STR_Max) = 0 THEN BEGIN
      afx := SFKira1;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKiremos', STR_Max) = 0 THEN BEGIN
      afx := SFKiremos;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKire1is', STR_Max) = 0 THEN BEGIN
      afx := SFKire1is;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKira1n', STR_Max) = 0 THEN BEGIN
      afx := SFKira1n;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKiri1a', STR_Max) = 0 THEN BEGIN
      afx := SFKiri1a;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKiri1as', STR_Max) = 0 THEN BEGIN
      afx := SFKiri1as;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKiri1amos', STR_Max) = 0 THEN BEGIN
      afx := SFKiri1amos;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKiri1ais', STR_Max) = 0 THEN BEGIN
      afx := SFKiri1ais;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKiri1an', STR_Max) = 0 THEN BEGIN
      afx := SFKiri1an;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKid', STR_Max) = 0 THEN BEGIN
      afx := SFKid;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKir', STR_Max) = 0 THEN BEGIN
      afx := SFKir;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKer', STR_Max) = 0 THEN BEGIN
      afx := SFKer;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKar', STR_Max) = 0 THEN BEGIN
      afx := SFKar;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKada', STR_Max) = 0 THEN BEGIN
      afx := SFKada;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKida', STR_Max) = 0 THEN BEGIN
      afx := SFKida;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKados', STR_Max) = 0 THEN BEGIN
      afx := SFKados;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKidos', STR_Max) = 0 THEN BEGIN
      afx := SFKidos;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKadas', STR_Max) = 0 THEN BEGIN
      afx := SFKadas;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKidas', STR_Max) = 0 THEN BEGIN
      afx := SFKidas;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKre1', STR_Max) = 0 THEN BEGIN
      afx := SFKre1;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKra1s', STR_Max) = 0 THEN BEGIN
      afx := SFKra1s;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKra1', STR_Max) = 0 THEN BEGIN
      afx := SFKra1;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKremos', STR_Max) = 0 THEN BEGIN
      afx := SFKremos;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKre1is', STR_Max) = 0 THEN BEGIN
      afx := SFKre1is;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKra1n', STR_Max) = 0 THEN BEGIN
      afx := SFKra1n;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKdre1', STR_Max) = 0 THEN BEGIN
      afx := SFKdre1;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKdra1s', STR_Max) = 0 THEN BEGIN
      afx := SFKdra1s;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKdra1', STR_Max) = 0 THEN BEGIN
      afx := SFKdra1;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKdremos', STR_Max) = 0 THEN BEGIN
      afx := SFKdremos;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKdre1is', STR_Max) = 0 THEN BEGIN
      afx := SFKdre1is;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKdra1n', STR_Max) = 0 THEN BEGIN
      afx := SFKdra1n;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKe1s', STR_Max) = 0 THEN BEGIN
      afx := SFKe1s;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKe1n', STR_Max) = 0 THEN BEGIN
      afx := SFKe1n;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKmascDETpl', STR_Max) = 0 THEN BEGIN
      afx := SFKmascDETpl;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKfemDETpl', STR_Max) = 0 THEN BEGIN
      afx := SFKfemDETpl;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKmascDETsg', STR_Max) = 0 THEN BEGIN
      afx := SFKmascDETsg;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKfemDETsg', STR_Max) = 0 THEN BEGIN
      afx := SFKfemDETsg;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKposAdjSing', STR_Max) = 0 THEN BEGIN
      afx := SFKposAdjSing;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKposAdjPlur', STR_Max) = 0 THEN BEGIN
      afx := SFKposAdjPlur;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKirrCompar', STR_Max) = 0 THEN BEGIN
      afx := SFKirrCompar;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKfemDEMADJsg', STR_Max) = 0 THEN BEGIN
      afx := SFKfemDEMADJsg;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKmascDEMADJpl', STR_Max) = 0 THEN BEGIN
      afx := SFKmascDEMADJpl;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKfemDEMADJpl', STR_Max) = 0 THEN BEGIN
      afx := SFKfemDEMADJpl;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKfemDEMPROsg', STR_Max) = 0 THEN BEGIN
      afx := SFKfemDEMPROsg;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKmascDEMPROpl', STR_Max) = 0 THEN BEGIN
      afx := SFKmascDEMPROpl;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKfemDEMPROpl', STR_Max) = 0 THEN BEGIN
      afx := SFKfemDEMPROpl;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKneutDEMPRO', STR_Max) = 0 THEN BEGIN
      afx := SFKneutDEMPRO;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKmente', STR_Max) = 0 THEN BEGIN
      afx := SFKmente;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFK0', STR_Max) = 0 THEN BEGIN
      afx := SFK0;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFK1', STR_Max) = 0 THEN BEGIN
      afx := SFK1;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFK2', STR_Max) = 0 THEN BEGIN
      afx := SFK2;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFK3', STR_Max) = 0 THEN BEGIN
      afx := SFK3;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFK4', STR_Max) = 0 THEN BEGIN
      afx := SFK4;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFK5', STR_Max) = 0 THEN BEGIN
      afx := SFK5;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFK6', STR_Max) = 0 THEN BEGIN
      afx := SFK6;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFK7', STR_Max) = 0 THEN BEGIN
      afx := SFK7;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFK8', STR_Max) = 0 THEN BEGIN
      afx := SFK8;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFK9', STR_Max) = 0 THEN BEGIN
      afx := SFK9;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
99:
END;


FUNCTION LDSTRTOTYPE_CAT(
         CONST str: STRING;
        l: STR_Range;
         VAR cat: LIDOMAINT_syntcat): BOOLEAN;
LABEL 99;
BEGIN
   LDSTRTOTYPE_CAT := false;
   IF STR_Compare(str, l, 'LIBUG', 5) = 0 THEN BEGIN
      cat := LIBUG;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;   IF STR_Compare(str, l, 'LIUG', 4) = 0 THEN BEGIN
      cat := LIUG;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;   IF STR_Compare(str, l, 'LICAT0', 6) = 0 THEN BEGIN
      cat := LICAT0;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;   IF STR_Compare(str, l, 'BADJSUFF', Str_Max) = 0 THEN BEGIN
      cat := LICAT1;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'BADJ', Str_Max) = 0 THEN BEGIN
      cat := LICAT2;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'SUBADJ', Str_Max) = 0 THEN BEGIN
      cat := LICAT3;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'ADJ', Str_Max) = 0 THEN BEGIN
      cat := LICAT4;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'ADJP', Str_Max) = 0 THEN BEGIN
      cat := LICAT5;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'ADJPPROP', Str_Max) = 0 THEN BEGIN
      cat := LICAT6;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'ADJPFORMULA', Str_Max) = 0 THEN BEGIN
      cat := LICAT7;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'OPENADJPPROP', Str_Max) = 0 THEN BEGIN
      cat := LICAT8;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'CLOSEDADJPPROP', Str_Max) = 0 THEN BEGIN
      cat := LICAT9;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'BADVSUFF', Str_Max) = 0 THEN BEGIN
      cat := LICAT10;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'BADV', Str_Max) = 0 THEN BEGIN
      cat := LICAT11;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'SUBADV', Str_Max) = 0 THEN BEGIN
      cat := LICAT12;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'ADV', Str_Max) = 0 THEN BEGIN
      cat := LICAT13;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'ADVP', Str_Max) = 0 THEN BEGIN
      cat := LICAT14;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'ADVPVAR', Str_Max) = 0 THEN BEGIN
      cat := LICAT15;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'ADVPPROP', Str_Max) = 0 THEN BEGIN
      cat := LICAT16;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'ADVPFORMULA', Str_Max) = 0 THEN BEGIN
      cat := LICAT17;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'OPENADVPPROP', Str_Max) = 0 THEN BEGIN
      cat := LICAT18;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'CLOSEDADVPPROP', Str_Max) = 0 THEN BEGIN
      cat := LICAT19;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'ART', Str_Max) = 0 THEN BEGIN
      cat := LICAT20;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'BIGPRO', Str_Max) = 0 THEN BEGIN
      cat := LICAT21;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'CLAUSE', Str_Max) = 0 THEN BEGIN
      cat := LICAT22;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'CLITIC', Str_Max) = 0 THEN BEGIN
      cat := LICAT23;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'CONJ', Str_Max) = 0 THEN BEGIN
      cat := LICAT24;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'COORD', Str_Max) = 0 THEN BEGIN
      cat := LICAT25;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'BDEMADJ', Str_Max) = 0 THEN BEGIN
      cat := LICAT26;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'DEMADJ', Str_Max) = 0 THEN BEGIN
      cat := LICAT27;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'DEMPRO', Str_Max) = 0 THEN BEGIN
      cat := LICAT28;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'BDET', Str_Max) = 0 THEN BEGIN
      cat := LICAT29;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'DET', Str_Max) = 0 THEN BEGIN
      cat := LICAT30;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'DETP', Str_Max) = 0 THEN BEGIN
      cat := LICAT31;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'EC', Str_Max) = 0 THEN BEGIN
      cat := LICAT32;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'EN', Str_Max) = 0 THEN BEGIN
      cat := LICAT33;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'EMPTY', Str_Max) = 0 THEN BEGIN
      cat := LICAT34;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'EXCLAM', Str_Max) = 0 THEN BEGIN
      cat := LICAT35;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'INDEFPRO', Str_Max) = 0 THEN BEGIN
      cat := LICAT36;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'SUBINDEFPRO', Str_Max) = 0 THEN BEGIN
      cat := LICAT37;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'NEG', Str_Max) = 0 THEN BEGIN
      cat := LICAT38;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'NEGVAR', Str_Max) = 0 THEN BEGIN
      cat := LICAT39;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'DIGIT', Str_Max) = 0 THEN BEGIN
      cat := LICAT40;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'CARD', Str_Max) = 0 THEN BEGIN
      cat := LICAT41;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'BNOUNSUFF', Str_Max) = 0 THEN BEGIN
      cat := LICAT42;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'BNOUN', Str_Max) = 0 THEN BEGIN
      cat := LICAT43;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'SUBNOUN', Str_Max) = 0 THEN BEGIN
      cat := LICAT44;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'NOUN', Str_Max) = 0 THEN BEGIN
      cat := LICAT45;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'CN', Str_Max) = 0 THEN BEGIN
      cat := LICAT46;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'NP', Str_Max) = 0 THEN BEGIN
      cat := LICAT47;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'PRONP', Str_Max) = 0 THEN BEGIN
      cat := LICAT48;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'NPPROP', Str_Max) = 0 THEN BEGIN
      cat := LICAT49;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'NPFORMULA', Str_Max) = 0 THEN BEGIN
      cat := LICAT50;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'OPENNPPROP', Str_Max) = 0 THEN BEGIN
      cat := LICAT51;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'CLOSEDNPPROP', Str_Max) = 0 THEN BEGIN
      cat := LICAT52;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'NUM', Str_Max) = 0 THEN BEGIN
      cat := LICAT53;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'ORDINAL', Str_Max) = 0 THEN BEGIN
      cat := LICAT54;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'BPERSPRO', Str_Max) = 0 THEN BEGIN
      cat := LICAT55;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'PERSPRO', Str_Max) = 0 THEN BEGIN
      cat := LICAT56;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'SE', Str_Max) = 0 THEN BEGIN
      cat := LICAT57;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'POS', Str_Max) = 0 THEN BEGIN
      cat := LICAT58;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'POSVAR', Str_Max) = 0 THEN BEGIN
      cat := LICAT59;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'POSSADJ', Str_Max) = 0 THEN BEGIN
      cat := LICAT60;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'BPOSSPRO', Str_Max) = 0 THEN BEGIN
      cat := LICAT61;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'POSSPRO', Str_Max) = 0 THEN BEGIN
      cat := LICAT62;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'SUBPREP', Str_Max) = 0 THEN BEGIN
      cat := LICAT63;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'PREP', Str_Max) = 0 THEN BEGIN
      cat := LICAT64;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'PREPP', Str_Max) = 0 THEN BEGIN
      cat := LICAT65;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'PREPPPROP', Str_Max) = 0 THEN BEGIN
      cat := LICAT66;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'PREPPFORMULA', Str_Max) = 0 THEN BEGIN
      cat := LICAT67;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'OPENPREPPPROP', Str_Max) = 0 THEN BEGIN
      cat := LICAT68;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'CLOSEDPREPPPROP', Str_Max) = 0 THEN BEGIN
      cat := LICAT69;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'VARPREPP', Str_Max) = 0 THEN BEGIN
      cat := LICAT70;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'BPROPERNOUN', Str_Max) = 0 THEN BEGIN
      cat := LICAT71;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'PROPERNOUN', Str_Max) = 0 THEN BEGIN
      cat := LICAT72;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'PROSENT', Str_Max) = 0 THEN BEGIN
      cat := LICAT73;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'PUNC', Str_Max) = 0 THEN BEGIN
      cat := LICAT74;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'Q', Str_Max) = 0 THEN BEGIN
      cat := LICAT75;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'QP', Str_Max) = 0 THEN BEGIN
      cat := LICAT76;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'RECIPRO', Str_Max) = 0 THEN BEGIN
      cat := LICAT77;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'REFLPRO', Str_Max) = 0 THEN BEGIN
      cat := LICAT78;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'RELPRO', Str_Max) = 0 THEN BEGIN
      cat := LICAT79;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'SENTENCE', Str_Max) = 0 THEN BEGIN
      cat := LICAT80;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'THANAS', Str_Max) = 0 THEN BEGIN
      cat := LICAT81;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'THANP', Str_Max) = 0 THEN BEGIN
      cat := LICAT82;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'UTT', Str_Max) = 0 THEN BEGIN
      cat := LICAT83;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'ADJPPROPVAR', Str_Max) = 0 THEN BEGIN
      cat := LICAT84;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'ADVPPROPVAR', Str_Max) = 0 THEN BEGIN
      cat := LICAT85;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'CLAUSEVAR', Str_Max) = 0 THEN BEGIN
      cat := LICAT86;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'CNVAR', Str_Max) = 0 THEN BEGIN
      cat := LICAT87;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'NPPROPVAR', Str_Max) = 0 THEN BEGIN
      cat := LICAT88;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'PREPPVAR', Str_Max) = 0 THEN BEGIN
      cat := LICAT89;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'PREPPPROPVAR', Str_Max) = 0 THEN BEGIN
      cat := LICAT90;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'NPVAR', Str_Max) = 0 THEN BEGIN
      cat := LICAT91;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'SENTENCEVAR', Str_Max) = 0 THEN BEGIN
      cat := LICAT92;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'PROSENTVAR', Str_Max) = 0 THEN BEGIN
      cat := LICAT93;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'EMPTYVAR', Str_Max) = 0 THEN BEGIN
      cat := LICAT94;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'VERBPPROPVAR', Str_Max) = 0 THEN BEGIN
      cat := LICAT95;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'PRONPVAR', Str_Max) = 0 THEN BEGIN
      cat := LICAT96;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'BVERBSUFF', Str_Max) = 0 THEN BEGIN
      cat := LICAT97;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'BVERB', Str_Max) = 0 THEN BEGIN
      cat := LICAT98;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'ALOVERB', Str_Max) = 0 THEN BEGIN
      cat := LICAT99;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'SUBVERB', Str_Max) = 0 THEN BEGIN
      cat := LICAT100;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'VERB', Str_Max) = 0 THEN BEGIN
      cat := LICAT101;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'VERBP', Str_Max) = 0 THEN BEGIN
      cat := LICAT102;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'VERBPPROP', Str_Max) = 0 THEN BEGIN
      cat := LICAT103;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'VERBPFORMULA', Str_Max) = 0 THEN BEGIN
      cat := LICAT104;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'OPENVERBPPROP', Str_Max) = 0 THEN BEGIN
      cat := LICAT105;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'CLOSEDVERBPPROP', Str_Max) = 0 THEN BEGIN
      cat := LICAT106;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'BWHADJ', Str_Max) = 0 THEN BEGIN
      cat := LICAT107;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'WHADJ', Str_Max) = 0 THEN BEGIN
      cat := LICAT108;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'BWHPRO', Str_Max) = 0 THEN BEGIN
      cat := LICAT109;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'WHPRO', Str_Max) = 0 THEN BEGIN
      cat := LICAT110;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'SFCAT', Str_Max) = 0 THEN BEGIN
      cat := LICAT111;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'PFCAT', Str_Max) = 0 THEN BEGIN
      cat := LICAT112;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'GLUE', Str_Max) = 0 THEN BEGIN
      cat := LICAT113;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   99:
END;


FUNCTION LDSTRTOTYPE_CC(
         CONST str: STRING;
        l: STR_Range;
         VAR cxt: LIMORFDEF_contextconds): BOOLEAN;
BEGIN
   LDSTRTOTYPE_CC := true;
   IF STR_Compare(str, l, 'LICC0', 5) = 0 THEN 
      cxt := LICC0
   ELSE   LDSTRTOTYPE_CC := false
END;


FUNCTION LDSTRTOTYPE_FON(
         CONST str: STRING;
        l: STR_Range;
         VAR ph: LIMORFDEF_phonmarker): BOOLEAN;
BEGIN
   LDSTRTOTYPE_FON := true;
   IF STR_Compare(str, l, 'LIFON0', 6) = 0 THEN 
      ph := LIFON0
   ELSE   IF STR_Compare(str, l, 'FONgg', STR_Max) = 0 THEN 
      ph := LIFON1
   ELSE   IF STR_Compare(str, l, 'FONch', STR_Max) = 0 THEN 
      ph := LIFON2
   ELSE   IF STR_Compare(str, l, 'FONkk', STR_Max) = 0 THEN 
      ph := LIFON3
   ELSE   IF STR_Compare(str, l, 'FONth', STR_Max) = 0 THEN 
      ph := LIFON4
   ELSE   LDSTRTOTYPE_FON := false
END;
