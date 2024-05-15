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
SFKe : BEGIN
      STR_Extract(str, l, 'SFKe', 4, 1, 4);
   END;
SFKen : BEGIN
      STR_Extract(str, l, 'SFKen', 5, 1, 5);
   END;
SFKer : BEGIN
      STR_Extract(str, l, 'SFKer', 5, 1, 5);
   END;
SFKst : BEGIN
      STR_Extract(str, l, 'SFKst', 5, 1, 5);
   END;
SFKt : BEGIN
      STR_Extract(str, l, 'SFKt', 4, 1, 4);
   END;
SFKdt : BEGIN
      STR_Extract(str, l, 'SFKdt', 5, 1, 5);
   END;
SFKdete : BEGIN
      STR_Extract(str, l, 'SFKdete', 7, 1, 7);
   END;
SFKje : BEGIN
      STR_Extract(str, l, 'SFKje', 5, 1, 5);
   END;
SFKetje : BEGIN
      STR_Extract(str, l, 'SFKetje', 7, 1, 7);
   END;
SFKonregdim : BEGIN
      STR_Extract(str, l, 'SFKonregdim', 11, 1, 11);
   END;
SFKdimletterword : BEGIN
      STR_Extract(str, l, 'SFKdimletterword', 16, 1, 16);
   END;
SFKgens : BEGIN
      STR_Extract(str, l, 'SFKgens', 7, 1, 7);
   END;
SFKmvs : BEGIN
      STR_Extract(str, l, 'SFKmvs', 6, 1, 6);
   END;
SFKsIrreg : BEGIN
      STR_Extract(str, l, 'SFKsIrreg', 9, 1, 9);
   END;
SFKieAccent : BEGIN
      STR_Extract(str, l, 'SFKieAccent', 11, 1, 11);
   END;
SFKaTOaa : BEGIN
      STR_Extract(str, l, 'SFKaTOaa', 8, 1, 8);
   END;
SFKaTOee : BEGIN
      STR_Extract(str, l, 'SFKaTOee', 8, 1, 8);
   END;
SFKeTOee : BEGIN
      STR_Extract(str, l, 'SFKeTOee', 8, 1, 8);
   END;
SFKeiTOee : BEGIN
      STR_Extract(str, l, 'SFKeiTOee', 9, 1, 9);
   END;
SFKiTOee : BEGIN
      STR_Extract(str, l, 'SFKiTOee', 8, 1, 8);
   END;
SFKoTOoo : BEGIN
      STR_Extract(str, l, 'SFKoTOoo', 8, 1, 8);
   END;
SFKeren : BEGIN
      STR_Extract(str, l, 'SFKeren', 7, 1, 7);
   END;
SFKien : BEGIN
      STR_Extract(str, l, 'SFKien', 6, 1, 6);
   END;
SFKden : BEGIN
      STR_Extract(str, l, 'SFKden', 6, 1, 6);
   END;
SFKnen : BEGIN
      STR_Extract(str, l, 'SFKnen', 6, 1, 6);
   END;
SFKenIrreg : BEGIN
      STR_Extract(str, l, 'SFKenIrreg', 10, 1, 10);
   END;
SFKadjs : BEGIN
      STR_Extract(str, l, 'SFKadjs', 7, 1, 7);
   END;
SFKonrege : BEGIN
      STR_Extract(str, l, 'SFKonrege', 9, 1, 9);
   END;
SFKonreger : BEGIN
      STR_Extract(str, l, 'SFKonreger', 10, 1, 10);
   END;
SFKonregst : BEGIN
      STR_Extract(str, l, 'SFKonregst', 10, 1, 10);
   END;
SFKlat : BEGIN
      STR_Extract(str, l, 'SFKlat', 6, 1, 6);
   END;
SFKlatIrreg : BEGIN
      STR_Extract(str, l, 'SFKlatIrreg', 11, 1, 11);
   END;
SFKlui : BEGIN
      STR_Extract(str, l, 'SFKlui', 6, 1, 6);
   END;
SFKlieden : BEGIN
      STR_Extract(str, l, 'SFKlieden', 9, 1, 9);
   END;
SFKirrottenk0 : BEGIN
      STR_Extract(str, l, 'SFKirrottenk0', 13, 1, 13);
   END;
SFKirrottenk2 : BEGIN
      STR_Extract(str, l, 'SFKirrottenk2', 13, 1, 13);
   END;
SFKirrottenk3 : BEGIN
      STR_Extract(str, l, 'SFKirrottenk3', 13, 1, 13);
   END;
SFKirrott4 : BEGIN
      STR_Extract(str, l, 'SFKirrott4', 10, 1, 10);
   END;
SFKirrott5 : BEGIN
      STR_Extract(str, l, 'SFKirrott5', 10, 1, 10);
   END;
SFKirrottmv : BEGIN
      STR_Extract(str, l, 'SFKirrottmv', 11, 1, 11);
   END;
SFKirrovtenk : BEGIN
      STR_Extract(str, l, 'SFKirrovtenk', 12, 1, 12);
   END;
SFKirrovt5 : BEGIN
      STR_Extract(str, l, 'SFKirrovt5', 10, 1, 10);
   END;
SFKirrovtmv : BEGIN
      STR_Extract(str, l, 'SFKirrovtmv', 11, 1, 11);
   END;
SFKirrvd : BEGIN
      STR_Extract(str, l, 'SFKirrvd', 8, 1, 8);
   END;
SFKirrgb : BEGIN
      STR_Extract(str, l, 'SFKirrgb', 8, 1, 8);
   END;
SFKirrconjott : BEGIN
      STR_Extract(str, l, 'SFKirrconjott', 13, 1, 13);
   END;
SFKirrconjovt : BEGIN
      STR_Extract(str, l, 'SFKirrconjovt', 13, 1, 13);
   END;
SFKovt1 : BEGIN
      STR_Extract(str, l, 'SFKovt1', 7, 1, 7);
   END;
SFKovtvd1 : BEGIN
      STR_Extract(str, l, 'SFKovtvd1', 9, 1, 9);
   END;
SFKovtvd2 : BEGIN
      STR_Extract(str, l, 'SFKovtvd2', 9, 1, 9);
   END;
SFKovt2 : BEGIN
      STR_Extract(str, l, 'SFKovt2', 7, 1, 7);
   END;
SFKvd1 : BEGIN
      STR_Extract(str, l, 'SFKvd1', 6, 1, 6);
   END;
SFKovt3 : BEGIN
      STR_Extract(str, l, 'SFKovt3', 7, 1, 7);
   END;
SFKvd2 : BEGIN
      STR_Extract(str, l, 'SFKvd2', 6, 1, 6);
   END;
SFKsgnomred : BEGIN
      STR_Extract(str, l, 'SFKsgnomred', 11, 1, 11);
   END;
SFKsgnom : BEGIN
      STR_Extract(str, l, 'SFKsgnom', 8, 1, 8);
   END;
SFKplnomred : BEGIN
      STR_Extract(str, l, 'SFKplnomred', 11, 1, 11);
   END;
SFKplnom : BEGIN
      STR_Extract(str, l, 'SFKplnom', 8, 1, 8);
   END;
SFKplacc : BEGIN
      STR_Extract(str, l, 'SFKplacc', 8, 1, 8);
   END;
SFKpldat : BEGIN
      STR_Extract(str, l, 'SFKpldat', 8, 1, 8);
   END;
SFKsgpossadjred : BEGIN
      STR_Extract(str, l, 'SFKsgpossadjred', 15, 1, 15);
   END;
SFKsgpossadj : BEGIN
      STR_Extract(str, l, 'SFKsgpossadj', 12, 1, 12);
   END;
SFKplpossadj : BEGIN
      STR_Extract(str, l, 'SFKplpossadj', 12, 1, 12);
   END;
SFKplpossadjons : BEGIN
      STR_Extract(str, l, 'SFKplpossadjons', 15, 1, 15);
   END;
SFKplpossadjonze : BEGIN
      STR_Extract(str, l, 'SFKplpossadjonze', 16, 1, 16);
   END;
SFKsgpossadjgen : BEGIN
      STR_Extract(str, l, 'SFKsgpossadjgen', 15, 1, 15);
   END;
SFKplpossadjgen : BEGIN
      STR_Extract(str, l, 'SFKplpossadjgen', 15, 1, 15);
   END;
SFKsgposs : BEGIN
      STR_Extract(str, l, 'SFKsgposs', 9, 1, 9);
   END;
SFKplposs : BEGIN
      STR_Extract(str, l, 'SFKplposs', 9, 1, 9);
   END;
SFKsgpossnvorm : BEGIN
      STR_Extract(str, l, 'SFKsgpossnvorm', 14, 1, 14);
   END;
SFKplpossnvorm : BEGIN
      STR_Extract(str, l, 'SFKplpossnvorm', 14, 1, 14);
   END;
SFKpossadjwiens : BEGIN
      STR_Extract(str, l, 'SFKpossadjwiens', 15, 1, 15);
   END;
SFKpossadjwier : BEGIN
      STR_Extract(str, l, 'SFKpossadjwier', 14, 1, 14);
   END;
SFKpossadjdiens : BEGIN
      STR_Extract(str, l, 'SFKpossadjdiens', 15, 1, 15);
   END;
SFKeDet : BEGIN
      STR_Extract(str, l, 'SFKeDet', 7, 1, 7);
   END;
SFKenDet : BEGIN
      STR_Extract(str, l, 'SFKenDet', 8, 1, 8);
   END;
SFKsgaccdat : BEGIN
      STR_Extract(str, l, 'SFKsgaccdat', 11, 1, 11);
   END;
SFKsgaccdatred : BEGIN
      STR_Extract(str, l, 'SFKsgaccdatred', 14, 1, 14);
   END;
SFKplaccdat : BEGIN
      STR_Extract(str, l, 'SFKplaccdat', 11, 1, 11);
   END;
SFKplaccdatred : BEGIN
      STR_Extract(str, l, 'SFKplaccdatred', 14, 1, 14);
   END;
SFKdelD : BEGIN
      STR_Extract(str, l, 'SFKdelD', 7, 1, 7);
   END;
SFKstreepCompound : BEGIN
      STR_Extract(str, l, 'SFKstreepCompound', 17, 1, 17);
   END;
SFKsCompound : BEGIN
      STR_Extract(str, l, 'SFKsCompound', 12, 1, 12);
   END;
SFKeCompound : BEGIN
      STR_Extract(str, l, 'SFKeCompound', 12, 1, 12);
   END;
SFKleegCompound : BEGIN
      STR_Extract(str, l, 'SFKleegCompound', 15, 1, 15);
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
PFKge : BEGIN
      STR_Extract(str, l, 'PFKge', 5, 1, 5);
   END;
PFKaller : BEGIN
      STR_Extract(str, l, 'PFKaller', 8, 1, 8);
   END;
SFKnDELETION : BEGIN
      STR_Extract(str, l, 'SFKnDELETION', 12, 1, 12);
   END;
SFKFINDEV : BEGIN
      STR_Extract(str, l, 'SFKFINDEV', 9, 1, 9);
   END;
SFKenOSL : BEGIN
      STR_Extract(str, l, 'SFKenOSL', 8, 1, 8);
   END;
SFKenAtoe : BEGIN
      STR_Extract(str, l, 'SFKenAtoe', 9, 1, 9);
   END;
SFKenItoe : BEGIN
      STR_Extract(str, l, 'SFKenItoe', 9, 1, 9);
   END;
SFKhydtoheden : BEGIN
      STR_Extract(str, l, 'SFKhydtoheden', 13, 1, 13);
   END;
SFKjen : BEGIN
      STR_Extract(str, l, 'SFKjen', 6, 1, 6);
   END;
SFKNOnDeletion : BEGIN
      STR_Extract(str, l, 'SFKNOnDeletion', 14, 1, 14);
   END;
SFKsIrregPlur : BEGIN
      STR_Extract(str, l, 'SFKsIrregPlur', 13, 1, 13);
   END;
SFKs : BEGIN
      STR_Extract(str, l, 'SFKs', 4, 1, 4);
   END;
PARTaan : BEGIN
      STR_Extract(str, l, 'PARTaan', 7, 1, 7);
   END;
PARTaaneen : BEGIN
      STR_Extract(str, l, 'PARTaaneen', 10, 1, 10);
   END;
PARTachter : BEGIN
      STR_Extract(str, l, 'PARTachter', 10, 1, 10);
   END;
PARTachteraan : BEGIN
      STR_Extract(str, l, 'PARTachteraan', 13, 1, 13);
   END;
PARTachterna : BEGIN
      STR_Extract(str, l, 'PARTachterna', 12, 1, 12);
   END;
PARTachterom : BEGIN
      STR_Extract(str, l, 'PARTachterom', 12, 1, 12);
   END;
PARTachterop : BEGIN
      STR_Extract(str, l, 'PARTachterop', 12, 1, 12);
   END;
PARTachterover : BEGIN
      STR_Extract(str, l, 'PARTachterover', 14, 1, 14);
   END;
PARTachteruit : BEGIN
      STR_Extract(str, l, 'PARTachteruit', 13, 1, 13);
   END;
PARTadem : BEGIN
      STR_Extract(str, l, 'PARTadem', 8, 1, 8);
   END;
PARTader : BEGIN
      STR_Extract(str, l, 'PARTader', 8, 1, 8);
   END;
PARTaf : BEGIN
      STR_Extract(str, l, 'PARTaf', 6, 1, 6);
   END;
PARTauto : BEGIN
      STR_Extract(str, l, 'PARTauto', 8, 1, 8);
   END;
PARTbakzeil : BEGIN
      STR_Extract(str, l, 'PARTbakzeil', 11, 1, 11);
   END;
PARTbeet : BEGIN
      STR_Extract(str, l, 'PARTbeet', 8, 1, 8);
   END;
PARTbekend : BEGIN
      STR_Extract(str, l, 'PARTbekend', 10, 1, 10);
   END;
PARTbelang : BEGIN
      STR_Extract(str, l, 'PARTbelang', 10, 1, 10);
   END;
PARTbellen : BEGIN
      STR_Extract(str, l, 'PARTbellen', 10, 1, 10);
   END;
PARTbezig : BEGIN
      STR_Extract(str, l, 'PARTbezig', 9, 1, 9);
   END;
PARTbij : BEGIN
      STR_Extract(str, l, 'PARTbij', 7, 1, 7);
   END;
PARTbijeen : BEGIN
      STR_Extract(str, l, 'PARTbijeen', 10, 1, 10);
   END;
PARTbinnen : BEGIN
      STR_Extract(str, l, 'PARTbinnen', 10, 1, 10);
   END;
PARTbloot : BEGIN
      STR_Extract(str, l, 'PARTbloot', 9, 1, 9);
   END;
PARTboek : BEGIN
      STR_Extract(str, l, 'PARTboek', 8, 1, 8);
   END;
PARTbot : BEGIN
      STR_Extract(str, l, 'PARTbot', 7, 1, 7);
   END;
PARTboven : BEGIN
      STR_Extract(str, l, 'PARTboven', 9, 1, 9);
   END;
PARTbuiten : BEGIN
      STR_Extract(str, l, 'PARTbuiten', 10, 1, 10);
   END;
PARTbuitenom : BEGIN
      STR_Extract(str, l, 'PARTbuitenom', 12, 1, 12);
   END;
PARTdaar : BEGIN
      STR_Extract(str, l, 'PARTdaar', 8, 1, 8);
   END;
PARTdank : BEGIN
      STR_Extract(str, l, 'PARTdank', 8, 1, 8);
   END;
PARTdeel : BEGIN
      STR_Extract(str, l, 'PARTdeel', 8, 1, 8);
   END;
PARTdicht : BEGIN
      STR_Extract(str, l, 'PARTdicht', 9, 1, 9);
   END;
PARTdiep : BEGIN
      STR_Extract(str, l, 'PARTdiep', 8, 1, 8);
   END;
PARTdol : BEGIN
      STR_Extract(str, l, 'PARTdol', 7, 1, 7);
   END;
PARTdood : BEGIN
      STR_Extract(str, l, 'PARTdood', 8, 1, 8);
   END;
PARTdoor : BEGIN
      STR_Extract(str, l, 'PARTdoor', 8, 1, 8);
   END;
PARTdroog : BEGIN
      STR_Extract(str, l, 'PARTdroog', 9, 1, 9);
   END;
PARTdubbel : BEGIN
      STR_Extract(str, l, 'PARTdubbel', 10, 1, 10);
   END;
PARTdwars : BEGIN
      STR_Extract(str, l, 'PARTdwars', 9, 1, 9);
   END;
PARTeruit : BEGIN
      STR_Extract(str, l, 'PARTeruit', 9, 1, 9);
   END;
PARTfeest : BEGIN
      STR_Extract(str, l, 'PARTfeest', 9, 1, 9);
   END;
PARTfijn : BEGIN
      STR_Extract(str, l, 'PARTfijn', 8, 1, 8);
   END;
PARTflauw : BEGIN
      STR_Extract(str, l, 'PARTflauw', 9, 1, 9);
   END;
PARTgade : BEGIN
      STR_Extract(str, l, 'PARTgade', 8, 1, 8);
   END;
PARTgeheim : BEGIN
      STR_Extract(str, l, 'PARTgeheim', 10, 1, 10);
   END;
PARTgelijk : BEGIN
      STR_Extract(str, l, 'PARTgelijk', 10, 1, 10);
   END;
PARTgeluk : BEGIN
      STR_Extract(str, l, 'PARTgeluk', 9, 1, 9);
   END;
PARTgevaar : BEGIN
      STR_Extract(str, l, 'PARTgevaar', 10, 1, 10);
   END;
PARTgereed : BEGIN
      STR_Extract(str, l, 'PARTgereed', 10, 1, 10);
   END;
PARTgering : BEGIN
      STR_Extract(str, l, 'PARTgering', 10, 1, 10);
   END;
PARTgerust : BEGIN
      STR_Extract(str, l, 'PARTgerust', 10, 1, 10);
   END;
PARTgevangen : BEGIN
      STR_Extract(str, l, 'PARTgevangen', 12, 1, 12);
   END;
PARTgewaar : BEGIN
      STR_Extract(str, l, 'PARTgewaar', 10, 1, 10);
   END;
PARTglad : BEGIN
      STR_Extract(str, l, 'PARTglad', 8, 1, 8);
   END;
PARTgoed : BEGIN
      STR_Extract(str, l, 'PARTgoed', 8, 1, 8);
   END;
PARTgroot : BEGIN
      STR_Extract(str, l, 'PARTgroot', 9, 1, 9);
   END;
PARThard : BEGIN
      STR_Extract(str, l, 'PARThard', 8, 1, 8);
   END;
PARTheen : BEGIN
      STR_Extract(str, l, 'PARTheen', 8, 1, 8);
   END;
PARTheet : BEGIN
      STR_Extract(str, l, 'PARTheet', 8, 1, 8);
   END;
PARTheruit : BEGIN
      STR_Extract(str, l, 'PARTheruit', 10, 1, 10);
   END;
PARThoog : BEGIN
      STR_Extract(str, l, 'PARThoog', 8, 1, 8);
   END;
PARTin : BEGIN
      STR_Extract(str, l, 'PARTin', 6, 1, 6);
   END;
PARTineen : BEGIN
      STR_Extract(str, l, 'PARTineen', 9, 1, 9);
   END;
PARTja : BEGIN
      STR_Extract(str, l, 'PARTja', 6, 1, 6);
   END;
PARTkaal : BEGIN
      STR_Extract(str, l, 'PARTkaal', 8, 1, 8);
   END;
PARTkaart : BEGIN
      STR_Extract(str, l, 'PARTkaart', 9, 1, 9);
   END;
PARTkapot : BEGIN
      STR_Extract(str, l, 'PARTkapot', 9, 1, 9);
   END;
PARTkennis : BEGIN
      STR_Extract(str, l, 'PARTkennis', 10, 1, 10);
   END;
PARTklaar : BEGIN
      STR_Extract(str, l, 'PARTklaar', 9, 1, 9);
   END;
PARTklein : BEGIN
      STR_Extract(str, l, 'PARTklein', 9, 1, 9);
   END;
PARTkomedie : BEGIN
      STR_Extract(str, l, 'PARTkomedie', 11, 1, 11);
   END;
PARTkopje : BEGIN
      STR_Extract(str, l, 'PARTkopje', 9, 1, 9);
   END;
PARTkort : BEGIN
      STR_Extract(str, l, 'PARTkort', 8, 1, 8);
   END;
PARTkrom : BEGIN
      STR_Extract(str, l, 'PARTkrom', 8, 1, 8);
   END;
PARTkuit : BEGIN
      STR_Extract(str, l, 'PARTkuit', 8, 1, 8);
   END;
PARTkwaad : BEGIN
      STR_Extract(str, l, 'PARTkwaad', 9, 1, 9);
   END;
PARTkwijt : BEGIN
      STR_Extract(str, l, 'PARTkwijt', 9, 1, 9);
   END;
PARTlam : BEGIN
      STR_Extract(str, l, 'PARTlam', 7, 1, 7);
   END;
PARTledig : BEGIN
      STR_Extract(str, l, 'PARTledig', 9, 1, 9);
   END;
PARTles : BEGIN
      STR_Extract(str, l, 'PARTles', 7, 1, 7);
   END;
PARTleeg : BEGIN
      STR_Extract(str, l, 'PARTleeg', 8, 1, 8);
   END;
PARTlief : BEGIN
      STR_Extract(str, l, 'PARTlief', 8, 1, 8);
   END;
PARTlos : BEGIN
      STR_Extract(str, l, 'PARTlos', 7, 1, 7);
   END;
PARTmaat : BEGIN
      STR_Extract(str, l, 'PARTmaat', 8, 1, 8);
   END;
PARTmat : BEGIN
      STR_Extract(str, l, 'PARTmat', 7, 1, 7);
   END;
PARTmede : BEGIN
      STR_Extract(str, l, 'PARTmede', 8, 1, 8);
   END;
PARTmee : BEGIN
      STR_Extract(str, l, 'PARTmee', 7, 1, 7);
   END;
PARTmis : BEGIN
      STR_Extract(str, l, 'PARTmis', 7, 1, 7);
   END;
PARTmodel : BEGIN
      STR_Extract(str, l, 'PARTmodel', 9, 1, 9);
   END;
PARTmooi : BEGIN
      STR_Extract(str, l, 'PARTmooi', 8, 1, 8);
   END;
PARTna : BEGIN
      STR_Extract(str, l, 'PARTna', 6, 1, 6);
   END;
PARTnabij : BEGIN
      STR_Extract(str, l, 'PARTnabij', 9, 1, 9);
   END;
PARTnat : BEGIN
      STR_Extract(str, l, 'PARTnat', 7, 1, 7);
   END;
PARTneder : BEGIN
      STR_Extract(str, l, 'PARTneder', 9, 1, 9);
   END;
PARTneer : BEGIN
      STR_Extract(str, l, 'PARTneer', 8, 1, 8);
   END;
PARTom : BEGIN
      STR_Extract(str, l, 'PARTom', 6, 1, 6);
   END;
PARTomhoog : BEGIN
      STR_Extract(str, l, 'PARTomhoog', 10, 1, 10);
   END;
PARTomlaag : BEGIN
      STR_Extract(str, l, 'PARTomlaag', 10, 1, 10);
   END;
PARTomver : BEGIN
      STR_Extract(str, l, 'PARTomver', 9, 1, 9);
   END;
PARTonder : BEGIN
      STR_Extract(str, l, 'PARTonder', 9, 1, 9);
   END;
PARTonderdoor : BEGIN
      STR_Extract(str, l, 'PARTonderdoor', 13, 1, 13);
   END;
PARTonderuit : BEGIN
      STR_Extract(str, l, 'PARTonderuit', 12, 1, 12);
   END;
PARTop : BEGIN
      STR_Extract(str, l, 'PARTop', 6, 1, 6);
   END;
PARTopeen : BEGIN
      STR_Extract(str, l, 'PARTopeen', 9, 1, 9);
   END;
PARTover : BEGIN
      STR_Extract(str, l, 'PARTover', 8, 1, 8);
   END;
PARTovereen : BEGIN
      STR_Extract(str, l, 'PARTovereen', 11, 1, 11);
   END;
PARToverhoop : BEGIN
      STR_Extract(str, l, 'PARToverhoop', 12, 1, 12);
   END;
PARTpaardje : BEGIN
      STR_Extract(str, l, 'PARTpaardje', 11, 1, 11);
   END;
PARTpaard : BEGIN
      STR_Extract(str, l, 'PARTpaard', 9, 1, 9);
   END;
PARTplaats : BEGIN
      STR_Extract(str, l, 'PARTplaats', 10, 1, 10);
   END;
PARTplat : BEGIN
      STR_Extract(str, l, 'PARTplat', 8, 1, 8);
   END;
PARTpost : BEGIN
      STR_Extract(str, l, 'PARTpost', 8, 1, 8);
   END;
PARTprijs : BEGIN
      STR_Extract(str, l, 'PARTprijs', 9, 1, 9);
   END;
PARTraak : BEGIN
      STR_Extract(str, l, 'PARTraak', 8, 1, 8);
   END;
PARTrecht : BEGIN
      STR_Extract(str, l, 'PARTrecht', 9, 1, 9);
   END;
PARTrond : BEGIN
      STR_Extract(str, l, 'PARTrond', 8, 1, 8);
   END;
PARTsamen : BEGIN
      STR_Extract(str, l, 'PARTsamen', 9, 1, 9);
   END;
PARTschaak : BEGIN
      STR_Extract(str, l, 'PARTschaak', 10, 1, 10);
   END;
PARTschadeloos : BEGIN
      STR_Extract(str, l, 'PARTschadeloos', 14, 1, 14);
   END;
PARTscheef : BEGIN
      STR_Extract(str, l, 'PARTscheef', 10, 1, 10);
   END;
PARTschool : BEGIN
      STR_Extract(str, l, 'PARTschool', 10, 1, 10);
   END;
PARTschoon : BEGIN
      STR_Extract(str, l, 'PARTschoon', 10, 1, 10);
   END;
PARTschoot : BEGIN
      STR_Extract(str, l, 'PARTschoot', 10, 1, 10);
   END;
PARTschuil : BEGIN
      STR_Extract(str, l, 'PARTschuil', 10, 1, 10);
   END;
PARTstand : BEGIN
      STR_Extract(str, l, 'PARTstand', 9, 1, 9);
   END;
PARTsteek : BEGIN
      STR_Extract(str, l, 'PARTsteek', 9, 1, 9);
   END;
PARTstijf : BEGIN
      STR_Extract(str, l, 'PARTstijf', 9, 1, 9);
   END;
PARTstil : BEGIN
      STR_Extract(str, l, 'PARTstil', 8, 1, 8);
   END;
PARTstop : BEGIN
      STR_Extract(str, l, 'PARTstop', 8, 1, 8);
   END;
PARTstorm : BEGIN
      STR_Extract(str, l, 'PARTstorm', 9, 1, 9);
   END;
PARTstuk : BEGIN
      STR_Extract(str, l, 'PARTstuk', 8, 1, 8);
   END;
PARTtegen : BEGIN
      STR_Extract(str, l, 'PARTtegen', 9, 1, 9);
   END;
PARTtegenover : BEGIN
      STR_Extract(str, l, 'PARTtegenover', 13, 1, 13);
   END;
PARTtekeer : BEGIN
      STR_Extract(str, l, 'PARTtekeer', 10, 1, 10);
   END;
PARTteleur : BEGIN
      STR_Extract(str, l, 'PARTteleur', 10, 1, 10);
   END;
PARTteloor : BEGIN
      STR_Extract(str, l, 'PARTteloor', 10, 1, 10);
   END;
PARTteniet : BEGIN
      STR_Extract(str, l, 'PARTteniet', 10, 1, 10);
   END;
PARTtentoon : BEGIN
      STR_Extract(str, l, 'PARTtentoon', 11, 1, 11);
   END;
PARTterecht : BEGIN
      STR_Extract(str, l, 'PARTterecht', 11, 1, 11);
   END;
PARTterneder : BEGIN
      STR_Extract(str, l, 'PARTterneder', 12, 1, 12);
   END;
PARTterneer : BEGIN
      STR_Extract(str, l, 'PARTterneer', 11, 1, 11);
   END;
PARTterug : BEGIN
      STR_Extract(str, l, 'PARTterug', 9, 1, 9);
   END;
PARTtevreden : BEGIN
      STR_Extract(str, l, 'PARTtevreden', 12, 1, 12);
   END;
PARTteweeg : BEGIN
      STR_Extract(str, l, 'PARTteweeg', 10, 1, 10);
   END;
PARTtewerk : BEGIN
      STR_Extract(str, l, 'PARTtewerk', 10, 1, 10);
   END;
PARTthee : BEGIN
      STR_Extract(str, l, 'PARTthee', 8, 1, 8);
   END;
PARTthuis : BEGIN
      STR_Extract(str, l, 'PARTthuis', 9, 1, 9);
   END;
PARTtoe : BEGIN
      STR_Extract(str, l, 'PARTtoe', 7, 1, 7);
   END;
PARTtoneel : BEGIN
      STR_Extract(str, l, 'PARTtoneel', 10, 1, 10);
   END;
PARTtussen : BEGIN
      STR_Extract(str, l, 'PARTtussen', 10, 1, 10);
   END;
PARTuit : BEGIN
      STR_Extract(str, l, 'PARTuit', 7, 1, 7);
   END;
PARTuiteen : BEGIN
      STR_Extract(str, l, 'PARTuiteen', 10, 1, 10);
   END;
PARTvaarwel : BEGIN
      STR_Extract(str, l, 'PARTvaarwel', 11, 1, 11);
   END;
PARTvast : BEGIN
      STR_Extract(str, l, 'PARTvast', 8, 1, 8);
   END;
PARTvet : BEGIN
      STR_Extract(str, l, 'PARTvet', 7, 1, 7);
   END;
PARTvol : BEGIN
      STR_Extract(str, l, 'PARTvol', 7, 1, 7);
   END;
PARTvoor : BEGIN
      STR_Extract(str, l, 'PARTvoor', 8, 1, 8);
   END;
PARTvooraf : BEGIN
      STR_Extract(str, l, 'PARTvooraf', 10, 1, 10);
   END;
PARTvoorbij : BEGIN
      STR_Extract(str, l, 'PARTvoorbij', 11, 1, 11);
   END;
PARTvoorop : BEGIN
      STR_Extract(str, l, 'PARTvoorop', 10, 1, 10);
   END;
PARTvoort : BEGIN
      STR_Extract(str, l, 'PARTvoort', 9, 1, 9);
   END;
PARTvooruit : BEGIN
      STR_Extract(str, l, 'PARTvooruit', 11, 1, 11);
   END;
PARTvreemd : BEGIN
      STR_Extract(str, l, 'PARTvreemd', 10, 1, 10);
   END;
PARTvrij : BEGIN
      STR_Extract(str, l, 'PARTvrij', 8, 1, 8);
   END;
PARTvuil : BEGIN
      STR_Extract(str, l, 'PARTvuil', 8, 1, 8);
   END;
PARTwaar : BEGIN
      STR_Extract(str, l, 'PARTwaar', 8, 1, 8);
   END;
PARTwacht : BEGIN
      STR_Extract(str, l, 'PARTwacht', 9, 1, 9);
   END;
PARTwarm : BEGIN
      STR_Extract(str, l, 'PARTwarm', 8, 1, 8);
   END;
PARTweder : BEGIN
      STR_Extract(str, l, 'PARTweder', 9, 1, 9);
   END;
PARTweer : BEGIN
      STR_Extract(str, l, 'PARTweer', 8, 1, 8);
   END;
PARTweerom : BEGIN
      STR_Extract(str, l, 'PARTweerom', 10, 1, 10);
   END;
PARTweg : BEGIN
      STR_Extract(str, l, 'PARTweg', 7, 1, 7);
   END;
PARTwel : BEGIN
      STR_Extract(str, l, 'PARTwel', 7, 1, 7);
   END;
PARTwijs : BEGIN
      STR_Extract(str, l, 'PARTwijs', 8, 1, 8);
   END;
PARTzoek : BEGIN
      STR_Extract(str, l, 'PARTzoek', 8, 1, 8);
   END;
PARTzwart : BEGIN
      STR_Extract(str, l, 'PARTzwart', 9, 1, 9);
   END;
PARTlangs : BEGIN
      STR_Extract(str, l, 'PARTlangs', 9, 1, 9);
   END;
PARTopen : BEGIN
      STR_Extract(str, l, 'PARTopen', 8, 1, 8);
   END;
PARTtijd : BEGIN
      STR_Extract(str, l, 'PARTtijd', 8, 1, 8);
   END;
PARTver : BEGIN
      STR_Extract(str, l, 'PARTver', 7, 1, 7);
   END;
PARTverbeurd : BEGIN
      STR_Extract(str, l, 'PARTverbeurd', 12, 1, 12);
   END;
PARTvandaan : BEGIN
      STR_Extract(str, l, 'PARTvandaan', 11, 1, 11);
   END;
PARTaantoe : BEGIN
      STR_Extract(str, l, 'PARTaantoe', 10, 1, 10);
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
      ALLOADJ: BEGIN 
         STR_Extract(str, l, 'ALLOADJ', 7, 1, 7);
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
      ALLOADV: BEGIN 
         STR_Extract(str, l, 'ALLOADV', 7, 1, 7);
         END;
      ADVP: BEGIN 
         STR_Extract(str, l, 'ADVP', 4, 1, 4);
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
      RADV: BEGIN 
         STR_Extract(str, l, 'RADV', 4, 1, 4);
         END;
      RADVP: BEGIN 
         STR_Extract(str, l, 'RADVP', 5, 1, 5);
         END;
      ADVPVAR: BEGIN 
         STR_Extract(str, l, 'ADVPVAR', 7, 1, 7);
         END;
      ART: BEGIN 
         STR_Extract(str, l, 'ART', 3, 1, 3);
         END;
      ASP: BEGIN 
         STR_Extract(str, l, 'ASP', 3, 1, 3);
         END;
      BIGPRO: BEGIN 
         STR_Extract(str, l, 'BIGPRO', 6, 1, 6);
         END;
      BBIGPRO: BEGIN 
         STR_Extract(str, l, 'BBIGPRO', 7, 1, 7);
         END;
      CARD: BEGIN 
         STR_Extract(str, l, 'CARD', 4, 1, 4);
         END;
      CLAUSE: BEGIN 
         STR_Extract(str, l, 'CLAUSE', 6, 1, 6);
         END;
      CONJ: BEGIN 
         STR_Extract(str, l, 'CONJ', 4, 1, 4);
         END;
      COORD: BEGIN 
         STR_Extract(str, l, 'COORD', 5, 1, 5);
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
      ALLODET: BEGIN 
         STR_Extract(str, l, 'ALLODET', 7, 1, 7);
         END;
      DETP: BEGIN 
         STR_Extract(str, l, 'DETP', 4, 1, 4);
         END;
      DIGIT: BEGIN 
         STR_Extract(str, l, 'DIGIT', 5, 1, 5);
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
      BINDEFPRO: BEGIN 
         STR_Extract(str, l, 'BINDEFPRO', 9, 1, 9);
         END;
      INDEFPRO: BEGIN 
         STR_Extract(str, l, 'INDEFPRO', 8, 1, 8);
         END;
      NEG: BEGIN 
         STR_Extract(str, l, 'NEG', 3, 1, 3);
         END;
      NEGVAR: BEGIN 
         STR_Extract(str, l, 'NEGVAR', 6, 1, 6);
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
      ALLONOUN: BEGIN 
         STR_Extract(str, l, 'ALLONOUN', 8, 1, 8);
         END;
      CN: BEGIN 
         STR_Extract(str, l, 'CN', 2, 1, 2);
         END;
      NP: BEGIN 
         STR_Extract(str, l, 'NP', 2, 1, 2);
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
      PART: BEGIN 
         STR_Extract(str, l, 'PART', 4, 1, 4);
         END;
      BPERSPRO: BEGIN 
         STR_Extract(str, l, 'BPERSPRO', 8, 1, 8);
         END;
      PERSPRO: BEGIN 
         STR_Extract(str, l, 'PERSPRO', 7, 1, 7);
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
      PREPPVAR: BEGIN 
         STR_Extract(str, l, 'PREPPVAR', 8, 1, 8);
         END;
      BPROPERNOUN: BEGIN 
         STR_Extract(str, l, 'BPROPERNOUN', 11, 1, 11);
         END;
      PROPERNOUN: BEGIN 
         STR_Extract(str, l, 'PROPERNOUN', 10, 1, 10);
         END;
      PUNC: BEGIN 
         STR_Extract(str, l, 'PUNC', 4, 1, 4);
         END;
      PROSENT: BEGIN 
         STR_Extract(str, l, 'PROSENT', 7, 1, 7);
         END;
      PROSENTVAR: BEGIN 
         STR_Extract(str, l, 'PROSENTVAR', 10, 1, 10);
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
      RELANTPRO: BEGIN 
         STR_Extract(str, l, 'RELANTPRO', 9, 1, 9);
         END;
      RELPRO: BEGIN 
         STR_Extract(str, l, 'RELPRO', 6, 1, 6);
         END;
      SENTENCE: BEGIN 
         STR_Extract(str, l, 'SENTENCE', 8, 1, 8);
         END;
      TE: BEGIN 
         STR_Extract(str, l, 'TE', 2, 1, 2);
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
      PREPPPROPVAR: BEGIN 
         STR_Extract(str, l, 'PREPPPROPVAR', 12, 1, 12);
         END;
      NPVAR: BEGIN 
         STR_Extract(str, l, 'NPVAR', 5, 1, 5);
         END;
      SENTENCEVAR: BEGIN 
         STR_Extract(str, l, 'SENTENCEVAR', 11, 1, 11);
         END;
      EMPTYVAR: BEGIN 
         STR_Extract(str, l, 'EMPTYVAR', 8, 1, 8);
         END;
      VERBPPROPVAR: BEGIN 
         STR_Extract(str, l, 'VERBPPROPVAR', 12, 1, 12);
         END;
      BVERBSUFF: BEGIN 
         STR_Extract(str, l, 'BVERBSUFF', 9, 1, 9);
         END;
      BVERB: BEGIN 
         STR_Extract(str, l, 'BVERB', 5, 1, 5);
         END;
      SUBVERB: BEGIN 
         STR_Extract(str, l, 'SUBVERB', 7, 1, 7);
         END;
      VERB: BEGIN 
         STR_Extract(str, l, 'VERB', 4, 1, 4);
         END;
      ALLOVERB: BEGIN 
         STR_Extract(str, l, 'ALLOVERB', 8, 1, 8);
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
      aanobjrel: BEGIN 
         STR_Extract(str, l, 'aanobjrel', 9, 1, 9);
         END;
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
      byobjrel: BEGIN 
         STR_Extract(str, l, 'byobjrel', 8, 1, 8);
         END;
      causadvrel: BEGIN 
         STR_Extract(str, l, 'causadvrel', 10, 1, 10);
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
      defRadvrel: BEGIN 
         STR_Extract(str, l, 'defRadvrel', 10, 1, 10);
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
      erposrel: BEGIN 
         STR_Extract(str, l, 'erposrel', 8, 1, 8);
         END;
      erqrel: BEGIN 
         STR_Extract(str, l, 'erqrel', 6, 1, 6);
         END;
      errel: BEGIN 
         STR_Extract(str, l, 'errel', 5, 1, 5);
         END;
      extraposrel: BEGIN 
         STR_Extract(str, l, 'extraposrel', 11, 1, 11);
         END;
      firstclrel: BEGIN 
         STR_Extract(str, l, 'firstclrel', 10, 1, 10);
         END;
      gluerel: BEGIN 
         STR_Extract(str, l, 'gluerel', 7, 1, 7);
         END;
      head: BEGIN 
         STR_Extract(str, l, 'head', 4, 1, 4);
         END;
      hetclrel: BEGIN 
         STR_Extract(str, l, 'hetclrel', 8, 1, 8);
         END;
      hoprel: BEGIN 
         STR_Extract(str, l, 'hoprel', 6, 1, 6);
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
      omtemodrel: BEGIN 
         STR_Extract(str, l, 'omtemodrel', 10, 1, 10);
         END;
      objrel: BEGIN 
         STR_Extract(str, l, 'objrel', 6, 1, 6);
         END;
      paprepobjrel: BEGIN 
         STR_Extract(str, l, 'paprepobjrel', 12, 1, 12);
         END;
      partrel: BEGIN 
         STR_Extract(str, l, 'partrel', 7, 1, 7);
         END;
      posrel: BEGIN 
         STR_Extract(str, l, 'posrel', 6, 1, 6);
         END;
      possrel: BEGIN 
         STR_Extract(str, l, 'possrel', 7, 1, 7);
         END;
      postadjrel: BEGIN 
         STR_Extract(str, l, 'postadjrel', 10, 1, 10);
         END;
      postsentadvrel: BEGIN 
         STR_Extract(str, l, 'postsentadvrel', 14, 1, 14);
         END;
      posttemprel: BEGIN 
         STR_Extract(str, l, 'posttemprel', 11, 1, 11);
         END;
      postsubjrel: BEGIN 
         STR_Extract(str, l, 'postsubjrel', 11, 1, 11);
         END;
      postverbrel: BEGIN 
         STR_Extract(str, l, 'postverbrel', 11, 1, 11);
         END;
      postvporel: BEGIN 
         STR_Extract(str, l, 'postvporel', 10, 1, 10);
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
      preprepobjrel: BEGIN 
         STR_Extract(str, l, 'preprepobjrel', 13, 1, 13);
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
      relsentrel: BEGIN 
         STR_Extract(str, l, 'relsentrel', 10, 1, 10);
         END;
      resultrel: BEGIN 
         STR_Extract(str, l, 'resultrel', 9, 1, 9);
         END;
      secondclrel: BEGIN 
         STR_Extract(str, l, 'secondclrel', 11, 1, 11);
         END;
      sentadvrel: BEGIN 
         STR_Extract(str, l, 'sentadvrel', 10, 1, 10);
         END;
      shiftrel: BEGIN 
         STR_Extract(str, l, 'shiftrel', 8, 1, 8);
         END;
      spostverbrel: BEGIN 
         STR_Extract(str, l, 'spostverbrel', 12, 1, 12);
         END;
      subjrel: BEGIN 
         STR_Extract(str, l, 'subjrel', 7, 1, 7);
         END;
      subjvpadvrel: BEGIN 
         STR_Extract(str, l, 'subjvpadvrel', 12, 1, 12);
         END;
      strandedrel: BEGIN 
         STR_Extract(str, l, 'strandedrel', 11, 1, 11);
         END;
      tempadvrel: BEGIN 
         STR_Extract(str, l, 'tempadvrel', 10, 1, 10);
         END;
      terel: BEGIN 
         STR_Extract(str, l, 'terel', 5, 1, 5);
         END;
      thancomplrel: BEGIN 
         STR_Extract(str, l, 'thancomplrel', 12, 1, 12);
         END;
      vancomplrel: BEGIN 
         STR_Extract(str, l, 'vancomplrel', 11, 1, 11);
         END;
      voorobjrel: BEGIN 
         STR_Extract(str, l, 'voorobjrel', 10, 1, 10);
         END;
      vpadvrel: BEGIN 
         STR_Extract(str, l, 'vpadvrel', 8, 1, 8);
         END;
      thanascomplrel: BEGIN 
         STR_Extract(str, l, 'thanascomplrel', 14, 1, 14);
         END;
      omcomplrel: BEGIN 
         STR_Extract(str, l, 'omcomplrel', 10, 1, 10);
         END;
      postmodrel: BEGIN 
         STR_Extract(str, l, 'postmodrel', 10, 1, 10);
         END;
      temodrel: BEGIN 
         STR_Extract(str, l, 'temodrel', 8, 1, 8);
         END;
      zocomplrel: BEGIN 
         STR_Extract(str, l, 'zocomplrel', 10, 1, 10);
         END;
      END
   END
END;


