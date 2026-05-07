pragma c_include('strings.pf');
Export(LDTYPETOSTR);
pragma c_include('str.pf');
pragma c_include('lsdomaint.pf');
 pragma c_include('limorfdef.pf');
pragma c_include('lidomaint.pf');
pragma c_include('ldtypetostr.pf');

PROGRAM LDTYPETOSTR;
WITH STR,
     LSDOMAINT,
     STRINGS,
     LIMORFDEF,
     LIDOMAINT;



PROCEDURE LDTYPETOSTR_AFFIX(
         VAR str: STRING;
         VAR l: STR_Range;
         afx: INTEGER);
BEGIN
   CASE afx OF 
SFKdiftong : BEGIN
      STR_Extract(str, l, 'SFKdiftong', 10, 1, 10);
   END;
SFKirrMedek : BEGIN
      STR_Extract(str, l, 'SFKirrMedek', 11, 1, 11);
   END;
SFKsterk : BEGIN
      STR_Extract(str, l, 'SFKsterk', 8, 1, 8);
   END;
SFKeiouHalf : BEGIN
      STR_Extract(str, l, 'SFKeiouHalf', 11, 1, 11);
   END;
SFKeiouHeel : BEGIN
      STR_Extract(str, l, 'SFKeiouHeel', 11, 1, 11);
   END;
SFKyMinPres : BEGIN
      STR_Extract(str, l, 'SFKyMinPres', 11, 1, 11);
   END;
SFKeiouPD : BEGIN
      STR_Extract(str, l, 'SFKeiouPD', 9, 1, 9);
   END;
SFKumlaut : BEGIN
      STR_Extract(str, l, 'SFKumlaut', 9, 1, 9);
   END;
SFKve : BEGIN
      STR_Extract(str, l, 'SFKve', 5, 1, 5);
   END;
SFKyPlusPres : BEGIN
      STR_Extract(str, l, 'SFKyPlusPres', 12, 1, 12);
   END;
SFKbendic : BEGIN
      STR_Extract(str, l, 'SFKbendic', 9, 1, 9);
   END;
SFKsepa : BEGIN
      STR_Extract(str, l, 'SFKsepa', 7, 1, 7);
   END;
SFK1SgIndPres : BEGIN
      STR_Extract(str, l, 'SFK1SgIndPres', 13, 1, 13);
   END;
SFK2SgIndPres : BEGIN
      STR_Extract(str, l, 'SFK2SgIndPres', 13, 1, 13);
   END;
SFK3SgIndPres : BEGIN
      STR_Extract(str, l, 'SFK3SgIndPres', 13, 1, 13);
   END;
SFK1PlIndPres : BEGIN
      STR_Extract(str, l, 'SFK1PlIndPres', 13, 1, 13);
   END;
SFK2PlIndPres : BEGIN
      STR_Extract(str, l, 'SFK2PlIndPres', 13, 1, 13);
   END;
SFK3PlIndPres : BEGIN
      STR_Extract(str, l, 'SFK3PlIndPres', 13, 1, 13);
   END;
SFK1Sg3SubjPres : BEGIN
      STR_Extract(str, l, 'SFK1Sg3SubjPres', 15, 1, 15);
   END;
SFK2SgSubjPres : BEGIN
      STR_Extract(str, l, 'SFK2SgSubjPres', 14, 1, 14);
   END;
SFK1PlSubjPres : BEGIN
      STR_Extract(str, l, 'SFK1PlSubjPres', 14, 1, 14);
   END;
SFK2PlSubjPres : BEGIN
      STR_Extract(str, l, 'SFK2PlSubjPres', 14, 1, 14);
   END;
SFK3PlSubjPres : BEGIN
      STR_Extract(str, l, 'SFK3PlSubjPres', 14, 1, 14);
   END;
SFK1Sg3Imperf : BEGIN
      STR_Extract(str, l, 'SFK1Sg3Imperf', 13, 1, 13);
   END;
SFK2SgImperf : BEGIN
      STR_Extract(str, l, 'SFK2SgImperf', 12, 1, 12);
   END;
SFK1PlImperf : BEGIN
      STR_Extract(str, l, 'SFK1PlImperf', 12, 1, 12);
   END;
SFK2PlImperf : BEGIN
      STR_Extract(str, l, 'SFK2PlImperf', 12, 1, 12);
   END;
SFK3PlImperf : BEGIN
      STR_Extract(str, l, 'SFK3PlImperf', 12, 1, 12);
   END;
SFK1SgPD : BEGIN
      STR_Extract(str, l, 'SFK1SgPD', 8, 1, 8);
   END;
SFK2SgPD : BEGIN
      STR_Extract(str, l, 'SFK2SgPD', 8, 1, 8);
   END;
SFK3SgPD : BEGIN
      STR_Extract(str, l, 'SFK3SgPD', 8, 1, 8);
   END;
SFK1PlPD : BEGIN
      STR_Extract(str, l, 'SFK1PlPD', 8, 1, 8);
   END;
SFK2PlPD : BEGIN
      STR_Extract(str, l, 'SFK2PlPD', 8, 1, 8);
   END;
SFK3PlPD : BEGIN
      STR_Extract(str, l, 'SFK3PlPD', 8, 1, 8);
   END;
SFK1SgFut : BEGIN
      STR_Extract(str, l, 'SFK1SgFut', 9, 1, 9);
   END;
SFK2SgFut : BEGIN
      STR_Extract(str, l, 'SFK2SgFut', 9, 1, 9);
   END;
SFK3SgFut : BEGIN
      STR_Extract(str, l, 'SFK3SgFut', 9, 1, 9);
   END;
SFK1PlFut : BEGIN
      STR_Extract(str, l, 'SFK1PlFut', 9, 1, 9);
   END;
SFK2PlFut : BEGIN
      STR_Extract(str, l, 'SFK2PlFut', 9, 1, 9);
   END;
SFK3PlFut : BEGIN
      STR_Extract(str, l, 'SFK3PlFut', 9, 1, 9);
   END;
SFK1Sg3Cond : BEGIN
      STR_Extract(str, l, 'SFK1Sg3Cond', 11, 1, 11);
   END;
SFK2SgCond : BEGIN
      STR_Extract(str, l, 'SFK2SgCond', 10, 1, 10);
   END;
SFK1PlCond : BEGIN
      STR_Extract(str, l, 'SFK1PlCond', 10, 1, 10);
   END;
SFK2PlCond : BEGIN
      STR_Extract(str, l, 'SFK2PlCond', 10, 1, 10);
   END;
SFK3PlCond : BEGIN
      STR_Extract(str, l, 'SFK3PlCond', 10, 1, 10);
   END;
SFKsgImperat : BEGIN
      STR_Extract(str, l, 'SFKsgImperat', 12, 1, 12);
   END;
SFKplImperat : BEGIN
      STR_Extract(str, l, 'SFKplImperat', 12, 1, 12);
   END;
SFK1Sg3SubjPas : BEGIN
      STR_Extract(str, l, 'SFK1Sg3SubjPas', 14, 1, 14);
   END;
SFK2SgSubjPas : BEGIN
      STR_Extract(str, l, 'SFK2SgSubjPas', 13, 1, 13);
   END;
SFK1PlSubjPas : BEGIN
      STR_Extract(str, l, 'SFK1PlSubjPas', 13, 1, 13);
   END;
SFK2PlSubjPas : BEGIN
      STR_Extract(str, l, 'SFK2PlSubjPas', 13, 1, 13);
   END;
SFK3PlSubjPas : BEGIN
      STR_Extract(str, l, 'SFK3PlSubjPas', 13, 1, 13);
   END;
SFK1Sg3SubjPasa : BEGIN
      STR_Extract(str, l, 'SFK1Sg3SubjPasa', 15, 1, 15);
   END;
SFK2SgSubjPasa : BEGIN
      STR_Extract(str, l, 'SFK2SgSubjPasa', 14, 1, 14);
   END;
SFK1PlSubjPasa : BEGIN
      STR_Extract(str, l, 'SFK1PlSubjPasa', 14, 1, 14);
   END;
SFK2PlSubjPasa : BEGIN
      STR_Extract(str, l, 'SFK2PlSubjPasa', 14, 1, 14);
   END;
SFK3PlSubjPasa : BEGIN
      STR_Extract(str, l, 'SFK3PlSubjPasa', 14, 1, 14);
   END;
SFKgerundio : BEGIN
      STR_Extract(str, l, 'SFKgerundio', 11, 1, 11);
   END;
SFKPtcPasMascSg : BEGIN
      STR_Extract(str, l, 'SFKPtcPasMascSg', 15, 1, 15);
   END;
SFKPtcPasMascPl : BEGIN
      STR_Extract(str, l, 'SFKPtcPasMascPl', 15, 1, 15);
   END;
SFKPtcPasFemSg : BEGIN
      STR_Extract(str, l, 'SFKPtcPasFemSg', 14, 1, 14);
   END;
SFKPtcPasFemPl : BEGIN
      STR_Extract(str, l, 'SFKPtcPasFemPl', 14, 1, 14);
   END;
SFKcliticOD : BEGIN
      STR_Extract(str, l, 'SFKcliticOD', 11, 1, 11);
   END;
SFKcliticOD1 : BEGIN
      STR_Extract(str, l, 'SFKcliticOD1', 12, 1, 12);
   END;
SFKcliticODm : BEGIN
      STR_Extract(str, l, 'SFKcliticODm', 12, 1, 12);
   END;
SFKcliticODf : BEGIN
      STR_Extract(str, l, 'SFKcliticODf', 12, 1, 12);
   END;
SFKcliticOI : BEGIN
      STR_Extract(str, l, 'SFKcliticOI', 11, 1, 11);
   END;
SFKpronFuerte : BEGIN
      STR_Extract(str, l, 'SFKpronFuerte', 13, 1, 13);
   END;
SFKposAdj : BEGIN
      STR_Extract(str, l, 'SFKposAdj', 9, 1, 9);
   END;
SFKposAdjFuerte : BEGIN
      STR_Extract(str, l, 'SFKposAdjFuerte', 15, 1, 15);
   END;
SFKregPL : BEGIN
      STR_Extract(str, l, 'SFKregPL', 8, 1, 8);
   END;
SFKirrPL : BEGIN
      STR_Extract(str, l, 'SFKirrPL', 8, 1, 8);
   END;
SFKextranPL : BEGIN
      STR_Extract(str, l, 'SFKextranPL', 11, 1, 11);
   END;
SFKapocope : BEGIN
      STR_Extract(str, l, 'SFKapocope', 10, 1, 10);
   END;
SFKregFEM : BEGIN
      STR_Extract(str, l, 'SFKregFEM', 9, 1, 9);
   END;
SFKirrImperatSG : BEGIN
      STR_Extract(str, l, 'SFKirrImperatSG', 15, 1, 15);
   END;
SFKirrPtcPasMascSg : BEGIN
      STR_Extract(str, l, 'SFKirrPtcPasMascSg', 18, 1, 18);
   END;
SFKirrPtcPasMascPl : BEGIN
      STR_Extract(str, l, 'SFKirrPtcPasMascPl', 18, 1, 18);
   END;
SFKirrPtcPasFemSg : BEGIN
      STR_Extract(str, l, 'SFKirrPtcPasFemSg', 17, 1, 17);
   END;
SFKirrPtcPasFemPl : BEGIN
      STR_Extract(str, l, 'SFKirrPtcPasFemPl', 17, 1, 17);
   END;
SFKirr1psSgInd : BEGIN
      STR_Extract(str, l, 'SFKirr1psSgInd', 14, 1, 14);
   END;
SFKirrInf : BEGIN
      STR_Extract(str, l, 'SFKirrInf', 9, 1, 9);
   END;
SFKo : BEGIN
      STR_Extract(str, l, 'SFKo', 4, 1, 4);
   END;
SFKas : BEGIN
      STR_Extract(str, l, 'SFKas', 5, 1, 5);
   END;
SFKa : BEGIN
      STR_Extract(str, l, 'SFKa', 4, 1, 4);
   END;
SFKamos : BEGIN
      STR_Extract(str, l, 'SFKamos', 7, 1, 7);
   END;
SFKemos : BEGIN
      STR_Extract(str, l, 'SFKemos', 7, 1, 7);
   END;
SFKa1is : BEGIN
      STR_Extract(str, l, 'SFKa1is', 7, 1, 7);
   END;
SFKe1is : BEGIN
      STR_Extract(str, l, 'SFKe1is', 7, 1, 7);
   END;
SFKan : BEGIN
      STR_Extract(str, l, 'SFKan', 5, 1, 5);
   END;
SFKaba : BEGIN
      STR_Extract(str, l, 'SFKaba', 6, 1, 6);
   END;
SFKabas : BEGIN
      STR_Extract(str, l, 'SFKabas', 7, 1, 7);
   END;
SFKa1bamos : BEGIN
      STR_Extract(str, l, 'SFKa1bamos', 10, 1, 10);
   END;
SFKabais : BEGIN
      STR_Extract(str, l, 'SFKabais', 8, 1, 8);
   END;
SFKaban : BEGIN
      STR_Extract(str, l, 'SFKaban', 7, 1, 7);
   END;
SFKe1 : BEGIN
      STR_Extract(str, l, 'SFKe1', 5, 1, 5);
   END;
SFKaste : BEGIN
      STR_Extract(str, l, 'SFKaste', 7, 1, 7);
   END;
SFKo1 : BEGIN
      STR_Extract(str, l, 'SFKo1', 5, 1, 5);
   END;
SFKasteis : BEGIN
      STR_Extract(str, l, 'SFKasteis', 9, 1, 9);
   END;
SFKaron : BEGIN
      STR_Extract(str, l, 'SFKaron', 7, 1, 7);
   END;
SFKare1 : BEGIN
      STR_Extract(str, l, 'SFKare1', 7, 1, 7);
   END;
SFKara1s : BEGIN
      STR_Extract(str, l, 'SFKara1s', 8, 1, 8);
   END;
SFKara1 : BEGIN
      STR_Extract(str, l, 'SFKara1', 7, 1, 7);
   END;
SFKaremos : BEGIN
      STR_Extract(str, l, 'SFKaremos', 9, 1, 9);
   END;
SFKare1is : BEGIN
      STR_Extract(str, l, 'SFKare1is', 9, 1, 9);
   END;
SFKara1n : BEGIN
      STR_Extract(str, l, 'SFKara1n', 8, 1, 8);
   END;
SFKari1a : BEGIN
      STR_Extract(str, l, 'SFKari1a', 8, 1, 8);
   END;
SFKari1as : BEGIN
      STR_Extract(str, l, 'SFKari1as', 9, 1, 9);
   END;
SFKari1amos : BEGIN
      STR_Extract(str, l, 'SFKari1amos', 11, 1, 11);
   END;
SFKari1ais : BEGIN
      STR_Extract(str, l, 'SFKari1ais', 10, 1, 10);
   END;
SFKari1an : BEGIN
      STR_Extract(str, l, 'SFKari1an', 9, 1, 9);
   END;
SFKad : BEGIN
      STR_Extract(str, l, 'SFKad', 5, 1, 5);
   END;
SFKando : BEGIN
      STR_Extract(str, l, 'SFKando', 7, 1, 7);
   END;
SFKado : BEGIN
      STR_Extract(str, l, 'SFKado', 6, 1, 6);
   END;
SFKe : BEGIN
      STR_Extract(str, l, 'SFKe', 4, 1, 4);
   END;
SFKes : BEGIN
      STR_Extract(str, l, 'SFKes', 5, 1, 5);
   END;
SFKen : BEGIN
      STR_Extract(str, l, 'SFKen', 5, 1, 5);
   END;
SFKara : BEGIN
      STR_Extract(str, l, 'SFKara', 6, 1, 6);
   END;
SFKaras : BEGIN
      STR_Extract(str, l, 'SFKaras', 7, 1, 7);
   END;
SFKa1ramos : BEGIN
      STR_Extract(str, l, 'SFKa1ramos', 10, 1, 10);
   END;
SFKarais : BEGIN
      STR_Extract(str, l, 'SFKarais', 8, 1, 8);
   END;
SFKaran : BEGIN
      STR_Extract(str, l, 'SFKaran', 7, 1, 7);
   END;
SFKase : BEGIN
      STR_Extract(str, l, 'SFKase', 6, 1, 6);
   END;
SFKases : BEGIN
      STR_Extract(str, l, 'SFKases', 7, 1, 7);
   END;
SFKa1semos : BEGIN
      STR_Extract(str, l, 'SFKa1semos', 10, 1, 10);
   END;
SFKaseis : BEGIN
      STR_Extract(str, l, 'SFKaseis', 8, 1, 8);
   END;
SFKasen : BEGIN
      STR_Extract(str, l, 'SFKasen', 7, 1, 7);
   END;
SFKi1a : BEGIN
      STR_Extract(str, l, 'SFKi1a', 6, 1, 6);
   END;
SFKi1as : BEGIN
      STR_Extract(str, l, 'SFKi1as', 7, 1, 7);
   END;
SFKi1amos : BEGIN
      STR_Extract(str, l, 'SFKi1amos', 9, 1, 9);
   END;
SFKi1ais : BEGIN
      STR_Extract(str, l, 'SFKi1ais', 8, 1, 8);
   END;
SFKi1an : BEGIN
      STR_Extract(str, l, 'SFKi1an', 7, 1, 7);
   END;
SFKi1 : BEGIN
      STR_Extract(str, l, 'SFKi1', 5, 1, 5);
   END;
SFKiste : BEGIN
      STR_Extract(str, l, 'SFKiste', 7, 1, 7);
   END;
SFKio1 : BEGIN
      STR_Extract(str, l, 'SFKio1', 6, 1, 6);
   END;
SFKisteis : BEGIN
      STR_Extract(str, l, 'SFKisteis', 9, 1, 9);
   END;
SFKieron : BEGIN
      STR_Extract(str, l, 'SFKieron', 8, 1, 8);
   END;
SFKere1 : BEGIN
      STR_Extract(str, l, 'SFKere1', 7, 1, 7);
   END;
SFKera1s : BEGIN
      STR_Extract(str, l, 'SFKera1s', 8, 1, 8);
   END;
SFKera1 : BEGIN
      STR_Extract(str, l, 'SFKera1', 7, 1, 7);
   END;
SFKeremos : BEGIN
      STR_Extract(str, l, 'SFKeremos', 9, 1, 9);
   END;
SFKere1is : BEGIN
      STR_Extract(str, l, 'SFKere1is', 9, 1, 9);
   END;
SFKera1n : BEGIN
      STR_Extract(str, l, 'SFKera1n', 8, 1, 8);
   END;
SFKeri1a : BEGIN
      STR_Extract(str, l, 'SFKeri1a', 8, 1, 8);
   END;
SFKeri1as : BEGIN
      STR_Extract(str, l, 'SFKeri1as', 9, 1, 9);
   END;
SFKeri1amos : BEGIN
      STR_Extract(str, l, 'SFKeri1amos', 11, 1, 11);
   END;
SFKeri1ais : BEGIN
      STR_Extract(str, l, 'SFKeri1ais', 10, 1, 10);
   END;
SFKeri1an : BEGIN
      STR_Extract(str, l, 'SFKeri1an', 9, 1, 9);
   END;
SFKed : BEGIN
      STR_Extract(str, l, 'SFKed', 5, 1, 5);
   END;
SFKiera : BEGIN
      STR_Extract(str, l, 'SFKiera', 7, 1, 7);
   END;
SFKieras : BEGIN
      STR_Extract(str, l, 'SFKieras', 8, 1, 8);
   END;
SFKie1ramos : BEGIN
      STR_Extract(str, l, 'SFKie1ramos', 11, 1, 11);
   END;
SFKierais : BEGIN
      STR_Extract(str, l, 'SFKierais', 9, 1, 9);
   END;
SFKieran : BEGIN
      STR_Extract(str, l, 'SFKieran', 8, 1, 8);
   END;
SFKiese : BEGIN
      STR_Extract(str, l, 'SFKiese', 7, 1, 7);
   END;
SFKieses : BEGIN
      STR_Extract(str, l, 'SFKieses', 8, 1, 8);
   END;
SFKie1semos : BEGIN
      STR_Extract(str, l, 'SFKie1semos', 11, 1, 11);
   END;
SFKieseis : BEGIN
      STR_Extract(str, l, 'SFKieseis', 9, 1, 9);
   END;
SFKiesen : BEGIN
      STR_Extract(str, l, 'SFKiesen', 8, 1, 8);
   END;
SFKiendo : BEGIN
      STR_Extract(str, l, 'SFKiendo', 8, 1, 8);
   END;
SFKido : BEGIN
      STR_Extract(str, l, 'SFKido', 6, 1, 6);
   END;
SFKimos : BEGIN
      STR_Extract(str, l, 'SFKimos', 7, 1, 7);
   END;
SFKi1s : BEGIN
      STR_Extract(str, l, 'SFKi1s', 6, 1, 6);
   END;
SFKire1 : BEGIN
      STR_Extract(str, l, 'SFKire1', 7, 1, 7);
   END;
SFKira1s : BEGIN
      STR_Extract(str, l, 'SFKira1s', 8, 1, 8);
   END;
SFKira1 : BEGIN
      STR_Extract(str, l, 'SFKira1', 7, 1, 7);
   END;
SFKiremos : BEGIN
      STR_Extract(str, l, 'SFKiremos', 9, 1, 9);
   END;
SFKire1is : BEGIN
      STR_Extract(str, l, 'SFKire1is', 9, 1, 9);
   END;
SFKira1n : BEGIN
      STR_Extract(str, l, 'SFKira1n', 8, 1, 8);
   END;
SFKiri1a : BEGIN
      STR_Extract(str, l, 'SFKiri1a', 8, 1, 8);
   END;
SFKiri1as : BEGIN
      STR_Extract(str, l, 'SFKiri1as', 9, 1, 9);
   END;
SFKiri1amos : BEGIN
      STR_Extract(str, l, 'SFKiri1amos', 11, 1, 11);
   END;
SFKiri1ais : BEGIN
      STR_Extract(str, l, 'SFKiri1ais', 10, 1, 10);
   END;
SFKiri1an : BEGIN
      STR_Extract(str, l, 'SFKiri1an', 9, 1, 9);
   END;
SFKid : BEGIN
      STR_Extract(str, l, 'SFKid', 5, 1, 5);
   END;
SFKir : BEGIN
      STR_Extract(str, l, 'SFKir', 5, 1, 5);
   END;
SFKer : BEGIN
      STR_Extract(str, l, 'SFKer', 5, 1, 5);
   END;
SFKar : BEGIN
      STR_Extract(str, l, 'SFKar', 5, 1, 5);
   END;
SFKada : BEGIN
      STR_Extract(str, l, 'SFKada', 6, 1, 6);
   END;
SFKida : BEGIN
      STR_Extract(str, l, 'SFKida', 6, 1, 6);
   END;
SFKados : BEGIN
      STR_Extract(str, l, 'SFKados', 7, 1, 7);
   END;
SFKidos : BEGIN
      STR_Extract(str, l, 'SFKidos', 7, 1, 7);
   END;
SFKadas : BEGIN
      STR_Extract(str, l, 'SFKadas', 7, 1, 7);
   END;
SFKidas : BEGIN
      STR_Extract(str, l, 'SFKidas', 7, 1, 7);
   END;
SFKre1 : BEGIN
      STR_Extract(str, l, 'SFKre1', 6, 1, 6);
   END;
SFKra1s : BEGIN
      STR_Extract(str, l, 'SFKra1s', 7, 1, 7);
   END;
SFKra1 : BEGIN
      STR_Extract(str, l, 'SFKra1', 6, 1, 6);
   END;
SFKremos : BEGIN
      STR_Extract(str, l, 'SFKremos', 8, 1, 8);
   END;
SFKre1is : BEGIN
      STR_Extract(str, l, 'SFKre1is', 8, 1, 8);
   END;
SFKra1n : BEGIN
      STR_Extract(str, l, 'SFKra1n', 7, 1, 7);
   END;
SFKdre1 : BEGIN
      STR_Extract(str, l, 'SFKdre1', 7, 1, 7);
   END;
SFKdra1s : BEGIN
      STR_Extract(str, l, 'SFKdra1s', 8, 1, 8);
   END;
SFKdra1 : BEGIN
      STR_Extract(str, l, 'SFKdra1', 7, 1, 7);
   END;
SFKdremos : BEGIN
      STR_Extract(str, l, 'SFKdremos', 9, 1, 9);
   END;
SFKdre1is : BEGIN
      STR_Extract(str, l, 'SFKdre1is', 9, 1, 9);
   END;
SFKdra1n : BEGIN
      STR_Extract(str, l, 'SFKdra1n', 8, 1, 8);
   END;
SFKe1s : BEGIN
      STR_Extract(str, l, 'SFKe1s', 6, 1, 6);
   END;
SFKe1n : BEGIN
      STR_Extract(str, l, 'SFKe1n', 6, 1, 6);
   END;
SFKmascDETpl : BEGIN
      STR_Extract(str, l, 'SFKmascDETpl', 12, 1, 12);
   END;
SFKfemDETpl : BEGIN
      STR_Extract(str, l, 'SFKfemDETpl', 11, 1, 11);
   END;
SFKmascDETsg : BEGIN
      STR_Extract(str, l, 'SFKmascDETsg', 12, 1, 12);
   END;
SFKfemDETsg : BEGIN
      STR_Extract(str, l, 'SFKfemDETsg', 11, 1, 11);
   END;
SFKposAdjSing : BEGIN
      STR_Extract(str, l, 'SFKposAdjSing', 13, 1, 13);
   END;
SFKposAdjPlur : BEGIN
      STR_Extract(str, l, 'SFKposAdjPlur', 13, 1, 13);
   END;
SFKirrCompar : BEGIN
      STR_Extract(str, l, 'SFKirrCompar', 12, 1, 12);
   END;
SFKfemDEMADJsg : BEGIN
      STR_Extract(str, l, 'SFKfemDEMADJsg', 14, 1, 14);
   END;
SFKmascDEMADJpl : BEGIN
      STR_Extract(str, l, 'SFKmascDEMADJpl', 15, 1, 15);
   END;
SFKfemDEMADJpl : BEGIN
      STR_Extract(str, l, 'SFKfemDEMADJpl', 14, 1, 14);
   END;
SFKfemDEMPROsg : BEGIN
      STR_Extract(str, l, 'SFKfemDEMPROsg', 14, 1, 14);
   END;
SFKmascDEMPROpl : BEGIN
      STR_Extract(str, l, 'SFKmascDEMPROpl', 15, 1, 15);
   END;
SFKfemDEMPROpl : BEGIN
      STR_Extract(str, l, 'SFKfemDEMPROpl', 14, 1, 14);
   END;
SFKneutDEMPRO : BEGIN
      STR_Extract(str, l, 'SFKneutDEMPRO', 13, 1, 13);
   END;
SFKmente : BEGIN
      STR_Extract(str, l, 'SFKmente', 8, 1, 8);
   END;
SFK0 : BEGIN
      STR_Extract(str, l, 'SFK0', 4, 1, 4);
   END;
SFK1 : BEGIN
      STR_Extract(str, l, 'SFK1', 4, 1, 4);
   END;
SFK2 : BEGIN
      STR_Extract(str, l, 'SFK2', 4, 1, 4);
   END;
SFK3 : BEGIN
      STR_Extract(str, l, 'SFK3', 4, 1, 4);
   END;
SFK4 : BEGIN
      STR_Extract(str, l, 'SFK4', 4, 1, 4);
   END;
SFK5 : BEGIN
      STR_Extract(str, l, 'SFK5', 4, 1, 4);
   END;
SFK6 : BEGIN
      STR_Extract(str, l, 'SFK6', 4, 1, 4);
   END;
SFK7 : BEGIN
      STR_Extract(str, l, 'SFK7', 4, 1, 4);
   END;
SFK8 : BEGIN
      STR_Extract(str, l, 'SFK8', 4, 1, 4);
   END;
SFK9 : BEGIN
      STR_Extract(str, l, 'SFK9', 4, 1, 4);
   END;
   END;
END;




PROCEDURE LDTYPETOSTR_CAT(
         VAR str: STRING;
         VAR l: STR_Range;
         cat: LIDOMAINT_syntcat);
BEGIN
   IF cat = LIBUG THEN BEGIN
      STR_Extract(str, l, 'LIBUG', 5, 1, 5);
      END
   ELSE    IF cat = LIUG THEN BEGIN
      STR_Extract(str, l, 'LIUG', 4, 1, 4);
      END
   ELSE    IF cat = LICAT0 THEN BEGIN
      STR_Extract(str, l, 'LICAT0', 6, 1, 6);
      END
   ELSE BEGIN
      CASE LoopHoles.Retype(cat,LSDOMAINT_syntcat) OF
      BADJSUFF: BEGIN 
         STR_Extract(str, l, 'BADJSUFF', 8, 1, 8);
         END;
      BADJ: BEGIN 
         STR_Extract(str, l, 'BADJ', 4, 1, 4);
         END;
      SUBADJ: BEGIN 
         STR_Extract(str, l, 'SUBADJ', 6, 1, 6);
         END;
      ADJ: BEGIN 
         STR_Extract(str, l, 'ADJ', 3, 1, 3);
         END;
      ADJP: BEGIN 
         STR_Extract(str, l, 'ADJP', 4, 1, 4);
         END;
      ADJPPROP: BEGIN 
         STR_Extract(str, l, 'ADJPPROP', 8, 1, 8);
         END;
      ADJPFORMULA: BEGIN 
         STR_Extract(str, l, 'ADJPFORMULA', 11, 1, 11);
         END;
      OPENADJPPROP: BEGIN 
         STR_Extract(str, l, 'OPENADJPPROP', 12, 1, 12);
         END;
      CLOSEDADJPPROP: BEGIN 
         STR_Extract(str, l, 'CLOSEDADJPPROP', 14, 1, 14);
         END;
      BADVSUFF: BEGIN 
         STR_Extract(str, l, 'BADVSUFF', 8, 1, 8);
         END;
      BADV: BEGIN 
         STR_Extract(str, l, 'BADV', 4, 1, 4);
         END;
      SUBADV: BEGIN 
         STR_Extract(str, l, 'SUBADV', 6, 1, 6);
         END;
      ADV: BEGIN 
         STR_Extract(str, l, 'ADV', 3, 1, 3);
         END;
      ADVP: BEGIN 
         STR_Extract(str, l, 'ADVP', 4, 1, 4);
         END;
      ADVPVAR: BEGIN 
         STR_Extract(str, l, 'ADVPVAR', 7, 1, 7);
         END;
      ADVPPROP: BEGIN 
         STR_Extract(str, l, 'ADVPPROP', 8, 1, 8);
         END;
      ADVPFORMULA: BEGIN 
         STR_Extract(str, l, 'ADVPFORMULA', 11, 1, 11);
         END;
      OPENADVPPROP: BEGIN 
         STR_Extract(str, l, 'OPENADVPPROP', 12, 1, 12);
         END;
      CLOSEDADVPPROP: BEGIN 
         STR_Extract(str, l, 'CLOSEDADVPPROP', 14, 1, 14);
         END;
      ART: BEGIN 
         STR_Extract(str, l, 'ART', 3, 1, 3);
         END;
      BIGPRO: BEGIN 
         STR_Extract(str, l, 'BIGPRO', 6, 1, 6);
         END;
      CLAUSE: BEGIN 
         STR_Extract(str, l, 'CLAUSE', 6, 1, 6);
         END;
      CLITIC: BEGIN 
         STR_Extract(str, l, 'CLITIC', 6, 1, 6);
         END;
      CONJ: BEGIN 
         STR_Extract(str, l, 'CONJ', 4, 1, 4);
         END;
      COORD: BEGIN 
         STR_Extract(str, l, 'COORD', 5, 1, 5);
         END;
      BDEMADJ: BEGIN 
         STR_Extract(str, l, 'BDEMADJ', 7, 1, 7);
         END;
      DEMADJ: BEGIN 
         STR_Extract(str, l, 'DEMADJ', 6, 1, 6);
         END;
      DEMPRO: BEGIN 
         STR_Extract(str, l, 'DEMPRO', 6, 1, 6);
         END;
      BDET: BEGIN 
         STR_Extract(str, l, 'BDET', 4, 1, 4);
         END;
      DET: BEGIN 
         STR_Extract(str, l, 'DET', 3, 1, 3);
         END;
      DETP: BEGIN 
         STR_Extract(str, l, 'DETP', 4, 1, 4);
         END;
      EC: BEGIN 
         STR_Extract(str, l, 'EC', 2, 1, 2);
         END;
      EN: BEGIN 
         STR_Extract(str, l, 'EN', 2, 1, 2);
         END;
      EMPTY: BEGIN 
         STR_Extract(str, l, 'EMPTY', 5, 1, 5);
         END;
      EXCLAM: BEGIN 
         STR_Extract(str, l, 'EXCLAM', 6, 1, 6);
         END;
      INDEFPRO: BEGIN 
         STR_Extract(str, l, 'INDEFPRO', 8, 1, 8);
         END;
      SUBINDEFPRO: BEGIN 
         STR_Extract(str, l, 'SUBINDEFPRO', 11, 1, 11);
         END;
      NEG: BEGIN 
         STR_Extract(str, l, 'NEG', 3, 1, 3);
         END;
      NEGVAR: BEGIN 
         STR_Extract(str, l, 'NEGVAR', 6, 1, 6);
         END;
      DIGIT: BEGIN 
         STR_Extract(str, l, 'DIGIT', 5, 1, 5);
         END;
      CARD: BEGIN 
         STR_Extract(str, l, 'CARD', 4, 1, 4);
         END;
      BNOUNSUFF: BEGIN 
         STR_Extract(str, l, 'BNOUNSUFF', 9, 1, 9);
         END;
      BNOUN: BEGIN 
         STR_Extract(str, l, 'BNOUN', 5, 1, 5);
         END;
      SUBNOUN: BEGIN 
         STR_Extract(str, l, 'SUBNOUN', 7, 1, 7);
         END;
      NOUN: BEGIN 
         STR_Extract(str, l, 'NOUN', 4, 1, 4);
         END;
      CN: BEGIN 
         STR_Extract(str, l, 'CN', 2, 1, 2);
         END;
      NP: BEGIN 
         STR_Extract(str, l, 'NP', 2, 1, 2);
         END;
      PRONP: BEGIN 
         STR_Extract(str, l, 'PRONP', 5, 1, 5);
         END;
      NPPROP: BEGIN 
         STR_Extract(str, l, 'NPPROP', 6, 1, 6);
         END;
      NPFORMULA: BEGIN 
         STR_Extract(str, l, 'NPFORMULA', 9, 1, 9);
         END;
      OPENNPPROP: BEGIN 
         STR_Extract(str, l, 'OPENNPPROP', 10, 1, 10);
         END;
      CLOSEDNPPROP: BEGIN 
         STR_Extract(str, l, 'CLOSEDNPPROP', 12, 1, 12);
         END;
      NUM: BEGIN 
         STR_Extract(str, l, 'NUM', 3, 1, 3);
         END;
      ORDINAL: BEGIN 
         STR_Extract(str, l, 'ORDINAL', 7, 1, 7);
         END;
      BPERSPRO: BEGIN 
         STR_Extract(str, l, 'BPERSPRO', 8, 1, 8);
         END;
      PERSPRO: BEGIN 
         STR_Extract(str, l, 'PERSPRO', 7, 1, 7);
         END;
      SE: BEGIN 
         STR_Extract(str, l, 'SE', 2, 1, 2);
         END;
      POS: BEGIN 
         STR_Extract(str, l, 'POS', 3, 1, 3);
         END;
      POSVAR: BEGIN 
         STR_Extract(str, l, 'POSVAR', 6, 1, 6);
         END;
      POSSADJ: BEGIN 
         STR_Extract(str, l, 'POSSADJ', 7, 1, 7);
         END;
      BPOSSPRO: BEGIN 
         STR_Extract(str, l, 'BPOSSPRO', 8, 1, 8);
         END;
      POSSPRO: BEGIN 
         STR_Extract(str, l, 'POSSPRO', 7, 1, 7);
         END;
      SUBPREP: BEGIN 
         STR_Extract(str, l, 'SUBPREP', 7, 1, 7);
         END;
      PREP: BEGIN 
         STR_Extract(str, l, 'PREP', 4, 1, 4);
         END;
      PREPP: BEGIN 
         STR_Extract(str, l, 'PREPP', 5, 1, 5);
         END;
      PREPPPROP: BEGIN 
         STR_Extract(str, l, 'PREPPPROP', 9, 1, 9);
         END;
      PREPPFORMULA: BEGIN 
         STR_Extract(str, l, 'PREPPFORMULA', 12, 1, 12);
         END;
      OPENPREPPPROP: BEGIN 
         STR_Extract(str, l, 'OPENPREPPPROP', 13, 1, 13);
         END;
      CLOSEDPREPPPROP: BEGIN 
         STR_Extract(str, l, 'CLOSEDPREPPPROP', 15, 1, 15);
         END;
      VARPREPP: BEGIN 
         STR_Extract(str, l, 'VARPREPP', 8, 1, 8);
         END;
      BPROPERNOUN: BEGIN 
         STR_Extract(str, l, 'BPROPERNOUN', 11, 1, 11);
         END;
      PROPERNOUN: BEGIN 
         STR_Extract(str, l, 'PROPERNOUN', 10, 1, 10);
         END;
      PROSENT: BEGIN 
         STR_Extract(str, l, 'PROSENT', 7, 1, 7);
         END;
      PUNC: BEGIN 
         STR_Extract(str, l, 'PUNC', 4, 1, 4);
         END;
      Q: BEGIN 
         STR_Extract(str, l, 'Q', 1, 1, 1);
         END;
      QP: BEGIN 
         STR_Extract(str, l, 'QP', 2, 1, 2);
         END;
      RECIPRO: BEGIN 
         STR_Extract(str, l, 'RECIPRO', 7, 1, 7);
         END;
      REFLPRO: BEGIN 
         STR_Extract(str, l, 'REFLPRO', 7, 1, 7);
         END;
      RELPRO: BEGIN 
         STR_Extract(str, l, 'RELPRO', 6, 1, 6);
         END;
      SENTENCE: BEGIN 
         STR_Extract(str, l, 'SENTENCE', 8, 1, 8);
         END;
      THANAS: BEGIN 
         STR_Extract(str, l, 'THANAS', 6, 1, 6);
         END;
      THANP: BEGIN 
         STR_Extract(str, l, 'THANP', 5, 1, 5);
         END;
      UTT: BEGIN 
         STR_Extract(str, l, 'UTT', 3, 1, 3);
         END;
      ADJPPROPVAR: BEGIN 
         STR_Extract(str, l, 'ADJPPROPVAR', 11, 1, 11);
         END;
      ADVPPROPVAR: BEGIN 
         STR_Extract(str, l, 'ADVPPROPVAR', 11, 1, 11);
         END;
      CLAUSEVAR: BEGIN 
         STR_Extract(str, l, 'CLAUSEVAR', 9, 1, 9);
         END;
      CNVAR: BEGIN 
         STR_Extract(str, l, 'CNVAR', 5, 1, 5);
         END;
      NPPROPVAR: BEGIN 
         STR_Extract(str, l, 'NPPROPVAR', 9, 1, 9);
         END;
      PREPPVAR: BEGIN 
         STR_Extract(str, l, 'PREPPVAR', 8, 1, 8);
         END;
      PREPPPROPVAR: BEGIN 
         STR_Extract(str, l, 'PREPPPROPVAR', 12, 1, 12);
         END;
      NPVAR: BEGIN 
         STR_Extract(str, l, 'NPVAR', 5, 1, 5);
         END;
      SENTENCEVAR: BEGIN 
         STR_Extract(str, l, 'SENTENCEVAR', 11, 1, 11);
         END;
      PROSENTVAR: BEGIN 
         STR_Extract(str, l, 'PROSENTVAR', 10, 1, 10);
         END;
      EMPTYVAR: BEGIN 
         STR_Extract(str, l, 'EMPTYVAR', 8, 1, 8);
         END;
      VERBPPROPVAR: BEGIN 
         STR_Extract(str, l, 'VERBPPROPVAR', 12, 1, 12);
         END;
      PRONPVAR: BEGIN 
         STR_Extract(str, l, 'PRONPVAR', 8, 1, 8);
         END;
      BVERBSUFF: BEGIN 
         STR_Extract(str, l, 'BVERBSUFF', 9, 1, 9);
         END;
      BVERB: BEGIN 
         STR_Extract(str, l, 'BVERB', 5, 1, 5);
         END;
      ALOVERB: BEGIN 
         STR_Extract(str, l, 'ALOVERB', 7, 1, 7);
         END;
      SUBVERB: BEGIN 
         STR_Extract(str, l, 'SUBVERB', 7, 1, 7);
         END;
      VERB: BEGIN 
         STR_Extract(str, l, 'VERB', 4, 1, 4);
         END;
      VERBP: BEGIN 
         STR_Extract(str, l, 'VERBP', 5, 1, 5);
         END;
      VERBPPROP: BEGIN 
         STR_Extract(str, l, 'VERBPPROP', 9, 1, 9);
         END;
      VERBPFORMULA: BEGIN 
         STR_Extract(str, l, 'VERBPFORMULA', 12, 1, 12);
         END;
      OPENVERBPPROP: BEGIN 
         STR_Extract(str, l, 'OPENVERBPPROP', 13, 1, 13);
         END;
      CLOSEDVERBPPROP: BEGIN 
         STR_Extract(str, l, 'CLOSEDVERBPPROP', 15, 1, 15);
         END;
      BWHADJ: BEGIN 
         STR_Extract(str, l, 'BWHADJ', 6, 1, 6);
         END;
      WHADJ: BEGIN 
         STR_Extract(str, l, 'WHADJ', 5, 1, 5);
         END;
      BWHPRO: BEGIN 
         STR_Extract(str, l, 'BWHPRO', 6, 1, 6);
         END;
      WHPRO: BEGIN 
         STR_Extract(str, l, 'WHPRO', 5, 1, 5);
         END;
      SFCAT: BEGIN 
         STR_Extract(str, l, 'SFCAT', 5, 1, 5);
         END;
      PFCAT: BEGIN 
         STR_Extract(str, l, 'PFCAT', 5, 1, 5);
         END;
      GLUE: BEGIN 
         STR_Extract(str, l, 'GLUE', 4, 1, 4);
         END;
      END
   END
END;




PROCEDURE LDTYPETOSTR_REL(
         VAR str: STRING;
         VAR l: STR_Range;
         rel: LIDOMAINT_synrel);
BEGIN
   IF rel = LIREL0 THEN BEGIN
      STR_Extract(str, l, 'LIREL0', 6, 1, 6);
      END
   ELSE BEGIN
      CASE LoopHoles.Retype(rel,LSDOMAINT_synrel) OF
      adjoinrel: BEGIN 
         STR_Extract(str, l, 'adjoinrel', 9, 1, 9);
         END;
      agvpadvrel: BEGIN 
         STR_Extract(str, l, 'agvpadvrel', 10, 1, 10);
         END;
      apposrel: BEGIN 
         STR_Extract(str, l, 'apposrel', 8, 1, 8);
         END;
      argrel: BEGIN 
         STR_Extract(str, l, 'argrel', 6, 1, 6);
         END;
      artrel: BEGIN 
         STR_Extract(str, l, 'artrel', 6, 1, 6);
         END;
      ascomplrel: BEGIN 
         STR_Extract(str, l, 'ascomplrel', 10, 1, 10);
         END;
      auxrel: BEGIN 
         STR_Extract(str, l, 'auxrel', 6, 1, 6);
         END;
      causadvrel: BEGIN 
         STR_Extract(str, l, 'causadvrel', 10, 1, 10);
         END;
      cliticrel: BEGIN 
         STR_Extract(str, l, 'cliticrel', 9, 1, 9);
         END;
      complrel: BEGIN 
         STR_Extract(str, l, 'complrel', 8, 1, 8);
         END;
      conjrel: BEGIN 
         STR_Extract(str, l, 'conjrel', 7, 1, 7);
         END;
      csubjrel: BEGIN 
         STR_Extract(str, l, 'csubjrel', 8, 1, 8);
         END;
      decomplrel: BEGIN 
         STR_Extract(str, l, 'decomplrel', 10, 1, 10);
         END;
      degreemodrel: BEGIN 
         STR_Extract(str, l, 'degreemodrel', 12, 1, 12);
         END;
      detrel: BEGIN 
         STR_Extract(str, l, 'detrel', 6, 1, 6);
         END;
      dirargrel: BEGIN 
         STR_Extract(str, l, 'dirargrel', 9, 1, 9);
         END;
      dosCLrel: BEGIN 
         STR_Extract(str, l, 'dosCLrel', 8, 1, 8);
         END;
      extraposrel: BEGIN 
         STR_Extract(str, l, 'extraposrel', 11, 1, 11);
         END;
      gluerel: BEGIN 
         STR_Extract(str, l, 'gluerel', 7, 1, 7);
         END;
      head: BEGIN 
         STR_Extract(str, l, 'head', 4, 1, 4);
         END;
      idrel: BEGIN 
         STR_Extract(str, l, 'idrel', 5, 1, 5);
         END;
      indobjrel: BEGIN 
         STR_Extract(str, l, 'indobjrel', 9, 1, 9);
         END;
      instradvrel: BEGIN 
         STR_Extract(str, l, 'instradvrel', 11, 1, 11);
         END;
      leftdislocrel: BEGIN 
         STR_Extract(str, l, 'leftdislocrel', 13, 1, 13);
         END;
      locadvrel: BEGIN 
         STR_Extract(str, l, 'locadvrel', 9, 1, 9);
         END;
      locargrel: BEGIN 
         STR_Extract(str, l, 'locargrel', 9, 1, 9);
         END;
      meltnegrel: BEGIN 
         STR_Extract(str, l, 'meltnegrel', 10, 1, 10);
         END;
      modrel: BEGIN 
         STR_Extract(str, l, 'modrel', 6, 1, 6);
         END;
      negrel: BEGIN 
         STR_Extract(str, l, 'negrel', 6, 1, 6);
         END;
      objrel: BEGIN 
         STR_Extract(str, l, 'objrel', 6, 1, 6);
         END;
      paracomplrel: BEGIN 
         STR_Extract(str, l, 'paracomplrel', 12, 1, 12);
         END;
      paramodrel: BEGIN 
         STR_Extract(str, l, 'paramodrel', 10, 1, 10);
         END;
      paraobjrel: BEGIN 
         STR_Extract(str, l, 'paraobjrel', 10, 1, 10);
         END;
      partrel: BEGIN 
         STR_Extract(str, l, 'partrel', 7, 1, 7);
         END;
      porobjrel: BEGIN 
         STR_Extract(str, l, 'porobjrel', 9, 1, 9);
         END;
      posrel: BEGIN 
         STR_Extract(str, l, 'posrel', 6, 1, 6);
         END;
      postsubjrel: BEGIN 
         STR_Extract(str, l, 'postsubjrel', 11, 1, 11);
         END;
      postmodrel: BEGIN 
         STR_Extract(str, l, 'postmodrel', 10, 1, 10);
         END;
      postsentadvrel: BEGIN 
         STR_Extract(str, l, 'postsentadvrel', 14, 1, 14);
         END;
      preadjrel: BEGIN 
         STR_Extract(str, l, 'preadjrel', 9, 1, 9);
         END;
      preadvrel: BEGIN 
         STR_Extract(str, l, 'preadvrel', 9, 1, 9);
         END;
      predrel: BEGIN 
         STR_Extract(str, l, 'predrel', 7, 1, 7);
         END;
      premodrel: BEGIN 
         STR_Extract(str, l, 'premodrel', 9, 1, 9);
         END;
      prepobjrel: BEGIN 
         STR_Extract(str, l, 'prepobjrel', 10, 1, 10);
         END;
      progauxrel: BEGIN 
         STR_Extract(str, l, 'progauxrel', 10, 1, 10);
         END;
      puncrel: BEGIN 
         STR_Extract(str, l, 'puncrel', 7, 1, 7);
         END;
      reflrel: BEGIN 
         STR_Extract(str, l, 'reflrel', 7, 1, 7);
         END;
      apreprel: BEGIN 
         STR_Extract(str, l, 'apreprel', 8, 1, 8);
         END;
      relsentrel: BEGIN 
         STR_Extract(str, l, 'relsentrel', 10, 1, 10);
         END;
      resultrel: BEGIN 
         STR_Extract(str, l, 'resultrel', 9, 1, 9);
         END;
      seCLrel: BEGIN 
         STR_Extract(str, l, 'seCLrel', 7, 1, 7);
         END;
      sentadvrel: BEGIN 
         STR_Extract(str, l, 'sentadvrel', 10, 1, 10);
         END;
      shiftrel: BEGIN 
         STR_Extract(str, l, 'shiftrel', 8, 1, 8);
         END;
      subjrel: BEGIN 
         STR_Extract(str, l, 'subjrel', 7, 1, 7);
         END;
      subjvpadvrel: BEGIN 
         STR_Extract(str, l, 'subjvpadvrel', 12, 1, 12);
         END;
      tempadvrel: BEGIN 
         STR_Extract(str, l, 'tempadvrel', 10, 1, 10);
         END;
      thancomplrel: BEGIN 
         STR_Extract(str, l, 'thancomplrel', 12, 1, 12);
         END;
      thanascomplrel: BEGIN 
         STR_Extract(str, l, 'thanascomplrel', 14, 1, 14);
         END;
      tresCLrel: BEGIN 
         STR_Extract(str, l, 'tresCLrel', 9, 1, 9);
         END;
      unoCLrel: BEGIN 
         STR_Extract(str, l, 'unoCLrel', 8, 1, 8);
         END;
      vpadvrel: BEGIN 
         STR_Extract(str, l, 'vpadvrel', 8, 1, 8);
         END;
      END
   END
END;


