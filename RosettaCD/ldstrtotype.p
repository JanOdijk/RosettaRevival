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
   IF STR_Compare(str, l,'SFKe', STR_Max) = 0 THEN BEGIN
      afx := SFKe;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKen', STR_Max) = 0 THEN BEGIN
      afx := SFKen;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKer', STR_Max) = 0 THEN BEGIN
      afx := SFKer;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKst', STR_Max) = 0 THEN BEGIN
      afx := SFKst;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKt', STR_Max) = 0 THEN BEGIN
      afx := SFKt;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKdt', STR_Max) = 0 THEN BEGIN
      afx := SFKdt;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKdete', STR_Max) = 0 THEN BEGIN
      afx := SFKdete;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKje', STR_Max) = 0 THEN BEGIN
      afx := SFKje;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKetje', STR_Max) = 0 THEN BEGIN
      afx := SFKetje;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKonregdim', STR_Max) = 0 THEN BEGIN
      afx := SFKonregdim;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKdimletterword', STR_Max) = 0 THEN BEGIN
      afx := SFKdimletterword;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKgens', STR_Max) = 0 THEN BEGIN
      afx := SFKgens;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKmvs', STR_Max) = 0 THEN BEGIN
      afx := SFKmvs;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKsIrreg', STR_Max) = 0 THEN BEGIN
      afx := SFKsIrreg;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKieAccent', STR_Max) = 0 THEN BEGIN
      afx := SFKieAccent;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKaTOaa', STR_Max) = 0 THEN BEGIN
      afx := SFKaTOaa;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKaTOee', STR_Max) = 0 THEN BEGIN
      afx := SFKaTOee;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKeTOee', STR_Max) = 0 THEN BEGIN
      afx := SFKeTOee;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKeiTOee', STR_Max) = 0 THEN BEGIN
      afx := SFKeiTOee;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKiTOee', STR_Max) = 0 THEN BEGIN
      afx := SFKiTOee;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKoTOoo', STR_Max) = 0 THEN BEGIN
      afx := SFKoTOoo;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKeren', STR_Max) = 0 THEN BEGIN
      afx := SFKeren;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKien', STR_Max) = 0 THEN BEGIN
      afx := SFKien;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKden', STR_Max) = 0 THEN BEGIN
      afx := SFKden;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKnen', STR_Max) = 0 THEN BEGIN
      afx := SFKnen;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKenIrreg', STR_Max) = 0 THEN BEGIN
      afx := SFKenIrreg;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKadjs', STR_Max) = 0 THEN BEGIN
      afx := SFKadjs;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKonrege', STR_Max) = 0 THEN BEGIN
      afx := SFKonrege;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKonreger', STR_Max) = 0 THEN BEGIN
      afx := SFKonreger;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKonregst', STR_Max) = 0 THEN BEGIN
      afx := SFKonregst;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKlat', STR_Max) = 0 THEN BEGIN
      afx := SFKlat;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKlatIrreg', STR_Max) = 0 THEN BEGIN
      afx := SFKlatIrreg;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKlui', STR_Max) = 0 THEN BEGIN
      afx := SFKlui;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKlieden', STR_Max) = 0 THEN BEGIN
      afx := SFKlieden;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKirrottenk0', STR_Max) = 0 THEN BEGIN
      afx := SFKirrottenk0;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKirrottenk2', STR_Max) = 0 THEN BEGIN
      afx := SFKirrottenk2;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKirrottenk3', STR_Max) = 0 THEN BEGIN
      afx := SFKirrottenk3;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKirrott4', STR_Max) = 0 THEN BEGIN
      afx := SFKirrott4;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKirrott5', STR_Max) = 0 THEN BEGIN
      afx := SFKirrott5;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKirrottmv', STR_Max) = 0 THEN BEGIN
      afx := SFKirrottmv;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKirrovtenk', STR_Max) = 0 THEN BEGIN
      afx := SFKirrovtenk;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKirrovt5', STR_Max) = 0 THEN BEGIN
      afx := SFKirrovt5;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKirrovtmv', STR_Max) = 0 THEN BEGIN
      afx := SFKirrovtmv;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKirrvd', STR_Max) = 0 THEN BEGIN
      afx := SFKirrvd;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKirrgb', STR_Max) = 0 THEN BEGIN
      afx := SFKirrgb;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKirrconjott', STR_Max) = 0 THEN BEGIN
      afx := SFKirrconjott;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKirrconjovt', STR_Max) = 0 THEN BEGIN
      afx := SFKirrconjovt;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKovt1', STR_Max) = 0 THEN BEGIN
      afx := SFKovt1;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKovtvd1', STR_Max) = 0 THEN BEGIN
      afx := SFKovtvd1;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKovtvd2', STR_Max) = 0 THEN BEGIN
      afx := SFKovtvd2;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKovt2', STR_Max) = 0 THEN BEGIN
      afx := SFKovt2;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKvd1', STR_Max) = 0 THEN BEGIN
      afx := SFKvd1;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKovt3', STR_Max) = 0 THEN BEGIN
      afx := SFKovt3;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKvd2', STR_Max) = 0 THEN BEGIN
      afx := SFKvd2;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKsgnomred', STR_Max) = 0 THEN BEGIN
      afx := SFKsgnomred;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKsgnom', STR_Max) = 0 THEN BEGIN
      afx := SFKsgnom;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKplnomred', STR_Max) = 0 THEN BEGIN
      afx := SFKplnomred;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKplnom', STR_Max) = 0 THEN BEGIN
      afx := SFKplnom;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKplacc', STR_Max) = 0 THEN BEGIN
      afx := SFKplacc;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKpldat', STR_Max) = 0 THEN BEGIN
      afx := SFKpldat;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKsgpossadjred', STR_Max) = 0 THEN BEGIN
      afx := SFKsgpossadjred;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKsgpossadj', STR_Max) = 0 THEN BEGIN
      afx := SFKsgpossadj;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKplpossadj', STR_Max) = 0 THEN BEGIN
      afx := SFKplpossadj;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKplpossadjons', STR_Max) = 0 THEN BEGIN
      afx := SFKplpossadjons;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKplpossadjonze', STR_Max) = 0 THEN BEGIN
      afx := SFKplpossadjonze;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKsgpossadjgen', STR_Max) = 0 THEN BEGIN
      afx := SFKsgpossadjgen;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKplpossadjgen', STR_Max) = 0 THEN BEGIN
      afx := SFKplpossadjgen;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKsgposs', STR_Max) = 0 THEN BEGIN
      afx := SFKsgposs;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKplposs', STR_Max) = 0 THEN BEGIN
      afx := SFKplposs;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKsgpossnvorm', STR_Max) = 0 THEN BEGIN
      afx := SFKsgpossnvorm;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKplpossnvorm', STR_Max) = 0 THEN BEGIN
      afx := SFKplpossnvorm;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKpossadjwiens', STR_Max) = 0 THEN BEGIN
      afx := SFKpossadjwiens;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKpossadjwier', STR_Max) = 0 THEN BEGIN
      afx := SFKpossadjwier;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKpossadjdiens', STR_Max) = 0 THEN BEGIN
      afx := SFKpossadjdiens;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKeDet', STR_Max) = 0 THEN BEGIN
      afx := SFKeDet;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKenDet', STR_Max) = 0 THEN BEGIN
      afx := SFKenDet;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKsgaccdat', STR_Max) = 0 THEN BEGIN
      afx := SFKsgaccdat;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKsgaccdatred', STR_Max) = 0 THEN BEGIN
      afx := SFKsgaccdatred;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKplaccdat', STR_Max) = 0 THEN BEGIN
      afx := SFKplaccdat;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKplaccdatred', STR_Max) = 0 THEN BEGIN
      afx := SFKplaccdatred;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKdelD', STR_Max) = 0 THEN BEGIN
      afx := SFKdelD;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKstreepCompound', STR_Max) = 0 THEN BEGIN
      afx := SFKstreepCompound;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKsCompound', STR_Max) = 0 THEN BEGIN
      afx := SFKsCompound;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKeCompound', STR_Max) = 0 THEN BEGIN
      afx := SFKeCompound;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKleegCompound', STR_Max) = 0 THEN BEGIN
      afx := SFKleegCompound;
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
   IF STR_Compare(str, l,'PFKge', STR_Max) = 0 THEN BEGIN
      afx := PFKge;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'PFKaller', STR_Max) = 0 THEN BEGIN
      afx := PFKaller;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKnDELETION', STR_Max) = 0 THEN BEGIN
      afx := SFKnDELETION;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKFINDEV', STR_Max) = 0 THEN BEGIN
      afx := SFKFINDEV;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKenOSL', STR_Max) = 0 THEN BEGIN
      afx := SFKenOSL;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKenAtoe', STR_Max) = 0 THEN BEGIN
      afx := SFKenAtoe;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKenItoe', STR_Max) = 0 THEN BEGIN
      afx := SFKenItoe;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKhydtoheden', STR_Max) = 0 THEN BEGIN
      afx := SFKhydtoheden;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKjen', STR_Max) = 0 THEN BEGIN
      afx := SFKjen;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKNOnDeletion', STR_Max) = 0 THEN BEGIN
      afx := SFKNOnDeletion;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKsIrregPlur', STR_Max) = 0 THEN BEGIN
      afx := SFKsIrregPlur;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKs', STR_Max) = 0 THEN BEGIN
      afx := SFKs;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'PARTaan', STR_Max) = 0 THEN BEGIN
      afx := PARTaan;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'PARTaaneen', STR_Max) = 0 THEN BEGIN
      afx := PARTaaneen;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'PARTachter', STR_Max) = 0 THEN BEGIN
      afx := PARTachter;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'PARTachteraan', STR_Max) = 0 THEN BEGIN
      afx := PARTachteraan;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'PARTachterna', STR_Max) = 0 THEN BEGIN
      afx := PARTachterna;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'PARTachterom', STR_Max) = 0 THEN BEGIN
      afx := PARTachterom;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'PARTachterop', STR_Max) = 0 THEN BEGIN
      afx := PARTachterop;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'PARTachterover', STR_Max) = 0 THEN BEGIN
      afx := PARTachterover;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'PARTachteruit', STR_Max) = 0 THEN BEGIN
      afx := PARTachteruit;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'PARTadem', STR_Max) = 0 THEN BEGIN
      afx := PARTadem;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'PARTader', STR_Max) = 0 THEN BEGIN
      afx := PARTader;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'PARTaf', STR_Max) = 0 THEN BEGIN
      afx := PARTaf;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'PARTauto', STR_Max) = 0 THEN BEGIN
      afx := PARTauto;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'PARTbakzeil', STR_Max) = 0 THEN BEGIN
      afx := PARTbakzeil;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'PARTbeet', STR_Max) = 0 THEN BEGIN
      afx := PARTbeet;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'PARTbekend', STR_Max) = 0 THEN BEGIN
      afx := PARTbekend;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'PARTbelang', STR_Max) = 0 THEN BEGIN
      afx := PARTbelang;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'PARTbellen', STR_Max) = 0 THEN BEGIN
      afx := PARTbellen;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'PARTbezig', STR_Max) = 0 THEN BEGIN
      afx := PARTbezig;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'PARTbij', STR_Max) = 0 THEN BEGIN
      afx := PARTbij;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'PARTbijeen', STR_Max) = 0 THEN BEGIN
      afx := PARTbijeen;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'PARTbinnen', STR_Max) = 0 THEN BEGIN
      afx := PARTbinnen;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'PARTbloot', STR_Max) = 0 THEN BEGIN
      afx := PARTbloot;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'PARTboek', STR_Max) = 0 THEN BEGIN
      afx := PARTboek;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'PARTbot', STR_Max) = 0 THEN BEGIN
      afx := PARTbot;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'PARTboven', STR_Max) = 0 THEN BEGIN
      afx := PARTboven;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'PARTbuiten', STR_Max) = 0 THEN BEGIN
      afx := PARTbuiten;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'PARTbuitenom', STR_Max) = 0 THEN BEGIN
      afx := PARTbuitenom;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'PARTdaar', STR_Max) = 0 THEN BEGIN
      afx := PARTdaar;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'PARTdank', STR_Max) = 0 THEN BEGIN
      afx := PARTdank;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'PARTdeel', STR_Max) = 0 THEN BEGIN
      afx := PARTdeel;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'PARTdicht', STR_Max) = 0 THEN BEGIN
      afx := PARTdicht;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'PARTdiep', STR_Max) = 0 THEN BEGIN
      afx := PARTdiep;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'PARTdol', STR_Max) = 0 THEN BEGIN
      afx := PARTdol;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'PARTdood', STR_Max) = 0 THEN BEGIN
      afx := PARTdood;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'PARTdoor', STR_Max) = 0 THEN BEGIN
      afx := PARTdoor;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'PARTdroog', STR_Max) = 0 THEN BEGIN
      afx := PARTdroog;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'PARTdubbel', STR_Max) = 0 THEN BEGIN
      afx := PARTdubbel;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'PARTdwars', STR_Max) = 0 THEN BEGIN
      afx := PARTdwars;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'PARTeruit', STR_Max) = 0 THEN BEGIN
      afx := PARTeruit;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'PARTfeest', STR_Max) = 0 THEN BEGIN
      afx := PARTfeest;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'PARTfijn', STR_Max) = 0 THEN BEGIN
      afx := PARTfijn;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'PARTflauw', STR_Max) = 0 THEN BEGIN
      afx := PARTflauw;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'PARTgade', STR_Max) = 0 THEN BEGIN
      afx := PARTgade;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'PARTgeheim', STR_Max) = 0 THEN BEGIN
      afx := PARTgeheim;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'PARTgelijk', STR_Max) = 0 THEN BEGIN
      afx := PARTgelijk;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'PARTgeluk', STR_Max) = 0 THEN BEGIN
      afx := PARTgeluk;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'PARTgevaar', STR_Max) = 0 THEN BEGIN
      afx := PARTgevaar;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'PARTgereed', STR_Max) = 0 THEN BEGIN
      afx := PARTgereed;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'PARTgering', STR_Max) = 0 THEN BEGIN
      afx := PARTgering;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'PARTgerust', STR_Max) = 0 THEN BEGIN
      afx := PARTgerust;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'PARTgevangen', STR_Max) = 0 THEN BEGIN
      afx := PARTgevangen;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'PARTgewaar', STR_Max) = 0 THEN BEGIN
      afx := PARTgewaar;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'PARTglad', STR_Max) = 0 THEN BEGIN
      afx := PARTglad;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'PARTgoed', STR_Max) = 0 THEN BEGIN
      afx := PARTgoed;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'PARTgroot', STR_Max) = 0 THEN BEGIN
      afx := PARTgroot;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'PARThard', STR_Max) = 0 THEN BEGIN
      afx := PARThard;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'PARTheen', STR_Max) = 0 THEN BEGIN
      afx := PARTheen;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'PARTheet', STR_Max) = 0 THEN BEGIN
      afx := PARTheet;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'PARTheruit', STR_Max) = 0 THEN BEGIN
      afx := PARTheruit;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'PARThoog', STR_Max) = 0 THEN BEGIN
      afx := PARThoog;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'PARTin', STR_Max) = 0 THEN BEGIN
      afx := PARTin;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'PARTineen', STR_Max) = 0 THEN BEGIN
      afx := PARTineen;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'PARTja', STR_Max) = 0 THEN BEGIN
      afx := PARTja;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'PARTkaal', STR_Max) = 0 THEN BEGIN
      afx := PARTkaal;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'PARTkaart', STR_Max) = 0 THEN BEGIN
      afx := PARTkaart;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'PARTkapot', STR_Max) = 0 THEN BEGIN
      afx := PARTkapot;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'PARTkennis', STR_Max) = 0 THEN BEGIN
      afx := PARTkennis;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'PARTklaar', STR_Max) = 0 THEN BEGIN
      afx := PARTklaar;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'PARTklein', STR_Max) = 0 THEN BEGIN
      afx := PARTklein;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'PARTkomedie', STR_Max) = 0 THEN BEGIN
      afx := PARTkomedie;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'PARTkopje', STR_Max) = 0 THEN BEGIN
      afx := PARTkopje;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'PARTkort', STR_Max) = 0 THEN BEGIN
      afx := PARTkort;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'PARTkrom', STR_Max) = 0 THEN BEGIN
      afx := PARTkrom;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'PARTkuit', STR_Max) = 0 THEN BEGIN
      afx := PARTkuit;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'PARTkwaad', STR_Max) = 0 THEN BEGIN
      afx := PARTkwaad;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'PARTkwijt', STR_Max) = 0 THEN BEGIN
      afx := PARTkwijt;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'PARTlam', STR_Max) = 0 THEN BEGIN
      afx := PARTlam;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'PARTledig', STR_Max) = 0 THEN BEGIN
      afx := PARTledig;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'PARTles', STR_Max) = 0 THEN BEGIN
      afx := PARTles;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'PARTleeg', STR_Max) = 0 THEN BEGIN
      afx := PARTleeg;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'PARTlief', STR_Max) = 0 THEN BEGIN
      afx := PARTlief;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'PARTlos', STR_Max) = 0 THEN BEGIN
      afx := PARTlos;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'PARTmaat', STR_Max) = 0 THEN BEGIN
      afx := PARTmaat;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'PARTmat', STR_Max) = 0 THEN BEGIN
      afx := PARTmat;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'PARTmede', STR_Max) = 0 THEN BEGIN
      afx := PARTmede;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'PARTmee', STR_Max) = 0 THEN BEGIN
      afx := PARTmee;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'PARTmis', STR_Max) = 0 THEN BEGIN
      afx := PARTmis;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'PARTmodel', STR_Max) = 0 THEN BEGIN
      afx := PARTmodel;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'PARTmooi', STR_Max) = 0 THEN BEGIN
      afx := PARTmooi;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'PARTna', STR_Max) = 0 THEN BEGIN
      afx := PARTna;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'PARTnabij', STR_Max) = 0 THEN BEGIN
      afx := PARTnabij;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'PARTnat', STR_Max) = 0 THEN BEGIN
      afx := PARTnat;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'PARTneder', STR_Max) = 0 THEN BEGIN
      afx := PARTneder;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'PARTneer', STR_Max) = 0 THEN BEGIN
      afx := PARTneer;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'PARTom', STR_Max) = 0 THEN BEGIN
      afx := PARTom;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'PARTomhoog', STR_Max) = 0 THEN BEGIN
      afx := PARTomhoog;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'PARTomlaag', STR_Max) = 0 THEN BEGIN
      afx := PARTomlaag;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'PARTomver', STR_Max) = 0 THEN BEGIN
      afx := PARTomver;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'PARTonder', STR_Max) = 0 THEN BEGIN
      afx := PARTonder;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'PARTonderdoor', STR_Max) = 0 THEN BEGIN
      afx := PARTonderdoor;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'PARTonderuit', STR_Max) = 0 THEN BEGIN
      afx := PARTonderuit;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'PARTop', STR_Max) = 0 THEN BEGIN
      afx := PARTop;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'PARTopeen', STR_Max) = 0 THEN BEGIN
      afx := PARTopeen;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'PARTover', STR_Max) = 0 THEN BEGIN
      afx := PARTover;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'PARTovereen', STR_Max) = 0 THEN BEGIN
      afx := PARTovereen;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'PARToverhoop', STR_Max) = 0 THEN BEGIN
      afx := PARToverhoop;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'PARTpaardje', STR_Max) = 0 THEN BEGIN
      afx := PARTpaardje;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'PARTpaard', STR_Max) = 0 THEN BEGIN
      afx := PARTpaard;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'PARTplaats', STR_Max) = 0 THEN BEGIN
      afx := PARTplaats;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'PARTplat', STR_Max) = 0 THEN BEGIN
      afx := PARTplat;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'PARTpost', STR_Max) = 0 THEN BEGIN
      afx := PARTpost;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'PARTprijs', STR_Max) = 0 THEN BEGIN
      afx := PARTprijs;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'PARTraak', STR_Max) = 0 THEN BEGIN
      afx := PARTraak;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'PARTrecht', STR_Max) = 0 THEN BEGIN
      afx := PARTrecht;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'PARTrond', STR_Max) = 0 THEN BEGIN
      afx := PARTrond;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'PARTsamen', STR_Max) = 0 THEN BEGIN
      afx := PARTsamen;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'PARTschaak', STR_Max) = 0 THEN BEGIN
      afx := PARTschaak;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'PARTschadeloos', STR_Max) = 0 THEN BEGIN
      afx := PARTschadeloos;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'PARTscheef', STR_Max) = 0 THEN BEGIN
      afx := PARTscheef;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'PARTschool', STR_Max) = 0 THEN BEGIN
      afx := PARTschool;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'PARTschoon', STR_Max) = 0 THEN BEGIN
      afx := PARTschoon;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'PARTschoot', STR_Max) = 0 THEN BEGIN
      afx := PARTschoot;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'PARTschuil', STR_Max) = 0 THEN BEGIN
      afx := PARTschuil;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'PARTstand', STR_Max) = 0 THEN BEGIN
      afx := PARTstand;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'PARTsteek', STR_Max) = 0 THEN BEGIN
      afx := PARTsteek;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'PARTstijf', STR_Max) = 0 THEN BEGIN
      afx := PARTstijf;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'PARTstil', STR_Max) = 0 THEN BEGIN
      afx := PARTstil;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'PARTstop', STR_Max) = 0 THEN BEGIN
      afx := PARTstop;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'PARTstorm', STR_Max) = 0 THEN BEGIN
      afx := PARTstorm;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'PARTstuk', STR_Max) = 0 THEN BEGIN
      afx := PARTstuk;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'PARTtegen', STR_Max) = 0 THEN BEGIN
      afx := PARTtegen;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'PARTtegenover', STR_Max) = 0 THEN BEGIN
      afx := PARTtegenover;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'PARTtekeer', STR_Max) = 0 THEN BEGIN
      afx := PARTtekeer;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'PARTteleur', STR_Max) = 0 THEN BEGIN
      afx := PARTteleur;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'PARTteloor', STR_Max) = 0 THEN BEGIN
      afx := PARTteloor;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'PARTteniet', STR_Max) = 0 THEN BEGIN
      afx := PARTteniet;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'PARTtentoon', STR_Max) = 0 THEN BEGIN
      afx := PARTtentoon;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'PARTterecht', STR_Max) = 0 THEN BEGIN
      afx := PARTterecht;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'PARTterneder', STR_Max) = 0 THEN BEGIN
      afx := PARTterneder;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'PARTterneer', STR_Max) = 0 THEN BEGIN
      afx := PARTterneer;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'PARTterug', STR_Max) = 0 THEN BEGIN
      afx := PARTterug;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'PARTtevreden', STR_Max) = 0 THEN BEGIN
      afx := PARTtevreden;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'PARTteweeg', STR_Max) = 0 THEN BEGIN
      afx := PARTteweeg;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'PARTtewerk', STR_Max) = 0 THEN BEGIN
      afx := PARTtewerk;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'PARTthee', STR_Max) = 0 THEN BEGIN
      afx := PARTthee;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'PARTthuis', STR_Max) = 0 THEN BEGIN
      afx := PARTthuis;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'PARTtoe', STR_Max) = 0 THEN BEGIN
      afx := PARTtoe;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'PARTtoneel', STR_Max) = 0 THEN BEGIN
      afx := PARTtoneel;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'PARTtussen', STR_Max) = 0 THEN BEGIN
      afx := PARTtussen;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'PARTuit', STR_Max) = 0 THEN BEGIN
      afx := PARTuit;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'PARTuiteen', STR_Max) = 0 THEN BEGIN
      afx := PARTuiteen;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'PARTvaarwel', STR_Max) = 0 THEN BEGIN
      afx := PARTvaarwel;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'PARTvast', STR_Max) = 0 THEN BEGIN
      afx := PARTvast;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'PARTvet', STR_Max) = 0 THEN BEGIN
      afx := PARTvet;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'PARTvol', STR_Max) = 0 THEN BEGIN
      afx := PARTvol;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'PARTvoor', STR_Max) = 0 THEN BEGIN
      afx := PARTvoor;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'PARTvooraf', STR_Max) = 0 THEN BEGIN
      afx := PARTvooraf;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'PARTvoorbij', STR_Max) = 0 THEN BEGIN
      afx := PARTvoorbij;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'PARTvoorop', STR_Max) = 0 THEN BEGIN
      afx := PARTvoorop;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'PARTvoort', STR_Max) = 0 THEN BEGIN
      afx := PARTvoort;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'PARTvooruit', STR_Max) = 0 THEN BEGIN
      afx := PARTvooruit;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'PARTvreemd', STR_Max) = 0 THEN BEGIN
      afx := PARTvreemd;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'PARTvrij', STR_Max) = 0 THEN BEGIN
      afx := PARTvrij;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'PARTvuil', STR_Max) = 0 THEN BEGIN
      afx := PARTvuil;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'PARTwaar', STR_Max) = 0 THEN BEGIN
      afx := PARTwaar;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'PARTwacht', STR_Max) = 0 THEN BEGIN
      afx := PARTwacht;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'PARTwarm', STR_Max) = 0 THEN BEGIN
      afx := PARTwarm;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'PARTweder', STR_Max) = 0 THEN BEGIN
      afx := PARTweder;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'PARTweer', STR_Max) = 0 THEN BEGIN
      afx := PARTweer;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'PARTweerom', STR_Max) = 0 THEN BEGIN
      afx := PARTweerom;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'PARTweg', STR_Max) = 0 THEN BEGIN
      afx := PARTweg;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'PARTwel', STR_Max) = 0 THEN BEGIN
      afx := PARTwel;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'PARTwijs', STR_Max) = 0 THEN BEGIN
      afx := PARTwijs;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'PARTzoek', STR_Max) = 0 THEN BEGIN
      afx := PARTzoek;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'PARTzwart', STR_Max) = 0 THEN BEGIN
      afx := PARTzwart;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'PARTlangs', STR_Max) = 0 THEN BEGIN
      afx := PARTlangs;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'PARTopen', STR_Max) = 0 THEN BEGIN
      afx := PARTopen;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'PARTtijd', STR_Max) = 0 THEN BEGIN
      afx := PARTtijd;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'PARTver', STR_Max) = 0 THEN BEGIN
      afx := PARTver;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'PARTverbeurd', STR_Max) = 0 THEN BEGIN
      afx := PARTverbeurd;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'PARTvandaan', STR_Max) = 0 THEN BEGIN
      afx := PARTvandaan;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'PARTaantoe', STR_Max) = 0 THEN BEGIN
      afx := PARTaantoe;
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
   IF STR_Compare(str, l, 'ALLOADJ', Str_Max) = 0 THEN BEGIN
      cat := LICAT5;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'ADJP', Str_Max) = 0 THEN BEGIN
      cat := LICAT6;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'ADJPPROP', Str_Max) = 0 THEN BEGIN
      cat := LICAT7;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'ADJPFORMULA', Str_Max) = 0 THEN BEGIN
      cat := LICAT8;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'OPENADJPPROP', Str_Max) = 0 THEN BEGIN
      cat := LICAT9;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'CLOSEDADJPPROP', Str_Max) = 0 THEN BEGIN
      cat := LICAT10;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'BADVSUFF', Str_Max) = 0 THEN BEGIN
      cat := LICAT11;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'BADV', Str_Max) = 0 THEN BEGIN
      cat := LICAT12;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'SUBADV', Str_Max) = 0 THEN BEGIN
      cat := LICAT13;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'ADV', Str_Max) = 0 THEN BEGIN
      cat := LICAT14;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'ALLOADV', Str_Max) = 0 THEN BEGIN
      cat := LICAT15;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'ADVP', Str_Max) = 0 THEN BEGIN
      cat := LICAT16;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'ADVPPROP', Str_Max) = 0 THEN BEGIN
      cat := LICAT17;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'ADVPFORMULA', Str_Max) = 0 THEN BEGIN
      cat := LICAT18;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'OPENADVPPROP', Str_Max) = 0 THEN BEGIN
      cat := LICAT19;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'CLOSEDADVPPROP', Str_Max) = 0 THEN BEGIN
      cat := LICAT20;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'RADV', Str_Max) = 0 THEN BEGIN
      cat := LICAT21;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'RADVP', Str_Max) = 0 THEN BEGIN
      cat := LICAT22;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'ADVPVAR', Str_Max) = 0 THEN BEGIN
      cat := LICAT23;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'ART', Str_Max) = 0 THEN BEGIN
      cat := LICAT24;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'ASP', Str_Max) = 0 THEN BEGIN
      cat := LICAT25;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'BIGPRO', Str_Max) = 0 THEN BEGIN
      cat := LICAT26;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'BBIGPRO', Str_Max) = 0 THEN BEGIN
      cat := LICAT27;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'CARD', Str_Max) = 0 THEN BEGIN
      cat := LICAT28;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'CLAUSE', Str_Max) = 0 THEN BEGIN
      cat := LICAT29;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'CONJ', Str_Max) = 0 THEN BEGIN
      cat := LICAT30;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'COORD', Str_Max) = 0 THEN BEGIN
      cat := LICAT31;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'DEMADJ', Str_Max) = 0 THEN BEGIN
      cat := LICAT32;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'DEMPRO', Str_Max) = 0 THEN BEGIN
      cat := LICAT33;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'BDET', Str_Max) = 0 THEN BEGIN
      cat := LICAT34;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'DET', Str_Max) = 0 THEN BEGIN
      cat := LICAT35;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'ALLODET', Str_Max) = 0 THEN BEGIN
      cat := LICAT36;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'DETP', Str_Max) = 0 THEN BEGIN
      cat := LICAT37;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'DIGIT', Str_Max) = 0 THEN BEGIN
      cat := LICAT38;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'EC', Str_Max) = 0 THEN BEGIN
      cat := LICAT39;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'EN', Str_Max) = 0 THEN BEGIN
      cat := LICAT40;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'EMPTY', Str_Max) = 0 THEN BEGIN
      cat := LICAT41;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'EXCLAM', Str_Max) = 0 THEN BEGIN
      cat := LICAT42;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'BINDEFPRO', Str_Max) = 0 THEN BEGIN
      cat := LICAT43;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'INDEFPRO', Str_Max) = 0 THEN BEGIN
      cat := LICAT44;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'NEG', Str_Max) = 0 THEN BEGIN
      cat := LICAT45;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'NEGVAR', Str_Max) = 0 THEN BEGIN
      cat := LICAT46;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'BNOUNSUFF', Str_Max) = 0 THEN BEGIN
      cat := LICAT47;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'BNOUN', Str_Max) = 0 THEN BEGIN
      cat := LICAT48;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'SUBNOUN', Str_Max) = 0 THEN BEGIN
      cat := LICAT49;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'NOUN', Str_Max) = 0 THEN BEGIN
      cat := LICAT50;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'ALLONOUN', Str_Max) = 0 THEN BEGIN
      cat := LICAT51;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'CN', Str_Max) = 0 THEN BEGIN
      cat := LICAT52;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'NP', Str_Max) = 0 THEN BEGIN
      cat := LICAT53;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'NPPROP', Str_Max) = 0 THEN BEGIN
      cat := LICAT54;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'NPFORMULA', Str_Max) = 0 THEN BEGIN
      cat := LICAT55;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'OPENNPPROP', Str_Max) = 0 THEN BEGIN
      cat := LICAT56;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'CLOSEDNPPROP', Str_Max) = 0 THEN BEGIN
      cat := LICAT57;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'NUM', Str_Max) = 0 THEN BEGIN
      cat := LICAT58;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'ORDINAL', Str_Max) = 0 THEN BEGIN
      cat := LICAT59;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'PART', Str_Max) = 0 THEN BEGIN
      cat := LICAT60;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'BPERSPRO', Str_Max) = 0 THEN BEGIN
      cat := LICAT61;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'PERSPRO', Str_Max) = 0 THEN BEGIN
      cat := LICAT62;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'POS', Str_Max) = 0 THEN BEGIN
      cat := LICAT63;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'POSVAR', Str_Max) = 0 THEN BEGIN
      cat := LICAT64;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'POSSADJ', Str_Max) = 0 THEN BEGIN
      cat := LICAT65;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'POSSPRO', Str_Max) = 0 THEN BEGIN
      cat := LICAT66;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'SUBPREP', Str_Max) = 0 THEN BEGIN
      cat := LICAT67;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'PREP', Str_Max) = 0 THEN BEGIN
      cat := LICAT68;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'PREPP', Str_Max) = 0 THEN BEGIN
      cat := LICAT69;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'PREPPPROP', Str_Max) = 0 THEN BEGIN
      cat := LICAT70;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'PREPPFORMULA', Str_Max) = 0 THEN BEGIN
      cat := LICAT71;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'OPENPREPPPROP', Str_Max) = 0 THEN BEGIN
      cat := LICAT72;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'CLOSEDPREPPPROP', Str_Max) = 0 THEN BEGIN
      cat := LICAT73;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'VARPREPP', Str_Max) = 0 THEN BEGIN
      cat := LICAT74;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'PREPPVAR', Str_Max) = 0 THEN BEGIN
      cat := LICAT75;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'BPROPERNOUN', Str_Max) = 0 THEN BEGIN
      cat := LICAT76;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'PROPERNOUN', Str_Max) = 0 THEN BEGIN
      cat := LICAT77;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'PUNC', Str_Max) = 0 THEN BEGIN
      cat := LICAT78;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'PROSENT', Str_Max) = 0 THEN BEGIN
      cat := LICAT79;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'PROSENTVAR', Str_Max) = 0 THEN BEGIN
      cat := LICAT80;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'Q', Str_Max) = 0 THEN BEGIN
      cat := LICAT81;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'QP', Str_Max) = 0 THEN BEGIN
      cat := LICAT82;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'RECIPRO', Str_Max) = 0 THEN BEGIN
      cat := LICAT83;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'REFLPRO', Str_Max) = 0 THEN BEGIN
      cat := LICAT84;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'RELANTPRO', Str_Max) = 0 THEN BEGIN
      cat := LICAT85;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'RELPRO', Str_Max) = 0 THEN BEGIN
      cat := LICAT86;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'SENTENCE', Str_Max) = 0 THEN BEGIN
      cat := LICAT87;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'TE', Str_Max) = 0 THEN BEGIN
      cat := LICAT88;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'THANAS', Str_Max) = 0 THEN BEGIN
      cat := LICAT89;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'THANP', Str_Max) = 0 THEN BEGIN
      cat := LICAT90;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'UTT', Str_Max) = 0 THEN BEGIN
      cat := LICAT91;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'ADJPPROPVAR', Str_Max) = 0 THEN BEGIN
      cat := LICAT92;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'ADVPPROPVAR', Str_Max) = 0 THEN BEGIN
      cat := LICAT93;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'CLAUSEVAR', Str_Max) = 0 THEN BEGIN
      cat := LICAT94;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'CNVAR', Str_Max) = 0 THEN BEGIN
      cat := LICAT95;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'NPPROPVAR', Str_Max) = 0 THEN BEGIN
      cat := LICAT96;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'PREPPPROPVAR', Str_Max) = 0 THEN BEGIN
      cat := LICAT97;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'NPVAR', Str_Max) = 0 THEN BEGIN
      cat := LICAT98;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'SENTENCEVAR', Str_Max) = 0 THEN BEGIN
      cat := LICAT99;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'EMPTYVAR', Str_Max) = 0 THEN BEGIN
      cat := LICAT100;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'VERBPPROPVAR', Str_Max) = 0 THEN BEGIN
      cat := LICAT101;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'BVERBSUFF', Str_Max) = 0 THEN BEGIN
      cat := LICAT102;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'BVERB', Str_Max) = 0 THEN BEGIN
      cat := LICAT103;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'SUBVERB', Str_Max) = 0 THEN BEGIN
      cat := LICAT104;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'VERB', Str_Max) = 0 THEN BEGIN
      cat := LICAT105;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'ALLOVERB', Str_Max) = 0 THEN BEGIN
      cat := LICAT106;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'VERBP', Str_Max) = 0 THEN BEGIN
      cat := LICAT107;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'VERBPPROP', Str_Max) = 0 THEN BEGIN
      cat := LICAT108;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'VERBPFORMULA', Str_Max) = 0 THEN BEGIN
      cat := LICAT109;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'OPENVERBPPROP', Str_Max) = 0 THEN BEGIN
      cat := LICAT110;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'CLOSEDVERBPPROP', Str_Max) = 0 THEN BEGIN
      cat := LICAT111;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'BWHPRO', Str_Max) = 0 THEN BEGIN
      cat := LICAT112;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'WHPRO', Str_Max) = 0 THEN BEGIN
      cat := LICAT113;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'SFCAT', Str_Max) = 0 THEN BEGIN
      cat := LICAT114;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'PFCAT', Str_Max) = 0 THEN BEGIN
      cat := LICAT115;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'GLUE', Str_Max) = 0 THEN BEGIN
      cat := LICAT116;
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
   ELSE   IF STR_Compare(str, l, 'FONleegleeg', STR_Max) = 0 THEN 
      ph := LIFON1
   ELSE   IF STR_Compare(str, l, 'FONleegsjwa', STR_Max) = 0 THEN 
      ph := LIFON2
   ELSE   IF STR_Compare(str, l, 'FONleegonwissel', STR_Max) = 0 THEN 
      ph := LIFON3
   ELSE   IF STR_Compare(str, l, 'FONsjwasjwa', STR_Max) = 0 THEN 
      ph := LIFON4
   ELSE   IF STR_Compare(str, l, 'FONonsjwasjwa', STR_Max) = 0 THEN 
      ph := LIFON5
   ELSE   IF STR_Compare(str, l, 'FONsjwaonsjwa', STR_Max) = 0 THEN 
      ph := LIFON6
   ELSE   IF STR_Compare(str, l, 'FONwisselsjwa', STR_Max) = 0 THEN 
      ph := LIFON7
   ELSE   IF STR_Compare(str, l, 'FONonwisselsjwa', STR_Max) = 0 THEN 
      ph := LIFON8
   ELSE   IF STR_Compare(str, l, 'FONwisselonwissel', STR_Max) = 0 THEN 
      ph := LIFON9
   ELSE   IF STR_Compare(str, l, 'FONonwisselonwissel', STR_Max) = 0 THEN 
      ph := LIFON10
   ELSE   IF STR_Compare(str, l, 'FONonwisselwissel', STR_Max) = 0 THEN 
      ph := LIFON11
   ELSE   IF STR_Compare(str, l, 'FONwisselwissel', STR_Max) = 0 THEN 
      ph := LIFON12
   ELSE   LDSTRTOTYPE_FON := false
END;
