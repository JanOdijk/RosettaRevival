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
   IF STR_Compare(str, l,'SFKam', STR_Max) = 0 THEN BEGIN
      afx := SFKam;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKis', STR_Max) = 0 THEN BEGIN
      afx := SFKis;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKwas', STR_Max) = 0 THEN BEGIN
      afx := SFKwas;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKare', STR_Max) = 0 THEN BEGIN
      afx := SFKare;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKwere', STR_Max) = 0 THEN BEGIN
      afx := SFKwere;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKirrpp', STR_Max) = 0 THEN BEGIN
      afx := SFKirrpp;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKirring', STR_Max) = 0 THEN BEGIN
      afx := SFKirring;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKirrptpp', STR_Max) = 0 THEN BEGIN
      afx := SFKirrptpp;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKirrS', STR_Max) = 0 THEN BEGIN
      afx := SFKirrS;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKmodpt', STR_Max) = 0 THEN BEGIN
      afx := SFKmodpt;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKirrnc', STR_Max) = 0 THEN BEGIN
      afx := SFKirrnc;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKirrpt', STR_Max) = 0 THEN BEGIN
      afx := SFKirrpt;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKirrpt2', STR_Max) = 0 THEN BEGIN
      afx := SFKirrpt2;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKirrpp2', STR_Max) = 0 THEN BEGIN
      afx := SFKirrpp2;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKirrpp3', STR_Max) = 0 THEN BEGIN
      afx := SFKirrpp3;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKregptpp', STR_Max) = 0 THEN BEGIN
      afx := SFKregptpp;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKcdptpp', STR_Max) = 0 THEN BEGIN
      afx := SFKcdptpp;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKcding', STR_Max) = 0 THEN BEGIN
      afx := SFKcding;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKreging', STR_Max) = 0 THEN BEGIN
      afx := SFKreging;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKregS', STR_Max) = 0 THEN BEGIN
      afx := SFKregS;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKregEs', STR_Max) = 0 THEN BEGIN
      afx := SFKregEs;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKvoicingS', STR_Max) = 0 THEN BEGIN
      afx := SFKvoicingS;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKirrplur', STR_Max) = 0 THEN BEGIN
      afx := SFKirrplur;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKlatplur', STR_Max) = 0 THEN BEGIN
      afx := SFKlatplur;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKirrcomp', STR_Max) = 0 THEN BEGIN
      afx := SFKirrcomp;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKirrsuper', STR_Max) = 0 THEN BEGIN
      afx := SFKirrsuper;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKirrcomp2', STR_Max) = 0 THEN BEGIN
      afx := SFKirrcomp2;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKirrsuper2', STR_Max) = 0 THEN BEGIN
      afx := SFKirrsuper2;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKcdcomp', STR_Max) = 0 THEN BEGIN
      afx := SFKcdcomp;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKcdsuper', STR_Max) = 0 THEN BEGIN
      afx := SFKcdsuper;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKregcomp', STR_Max) = 0 THEN BEGIN
      afx := SFKregcomp;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKregsuper', STR_Max) = 0 THEN BEGIN
      afx := SFKregsuper;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKacc', STR_Max) = 0 THEN BEGIN
      afx := SFKacc;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKposs', STR_Max) = 0 THEN BEGIN
      afx := SFKposs;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKpredposs', STR_Max) = 0 THEN BEGIN
      afx := SFKpredposs;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'PFKanti1', STR_Max) = 0 THEN BEGIN
      afx := PFKanti1;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'PFKanti2', STR_Max) = 0 THEN BEGIN
      afx := PFKanti2;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'PFKex', STR_Max) = 0 THEN BEGIN
      afx := PFKex;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'PFKhyper', STR_Max) = 0 THEN BEGIN
      afx := PFKhyper;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'PFKpro', STR_Max) = 0 THEN BEGIN
      afx := PFKpro;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'PFKre', STR_Max) = 0 THEN BEGIN
      afx := PFKre;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'PFKvice', STR_Max) = 0 THEN BEGIN
      afx := PFKvice;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKregable', STR_Max) = 0 THEN BEGIN
      afx := SFKregable;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKtruncable', STR_Max) = 0 THEN BEGIN
      afx := SFKtruncable;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKcdable', STR_Max) = 0 THEN BEGIN
      afx := SFKcdable;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKregly', STR_Max) = 0 THEN BEGIN
      afx := SFKregly;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKirregly', STR_Max) = 0 THEN BEGIN
      afx := SFKirregly;
      LDSTRTOTYPE_AFFIX := true;
      GOTO 99
   END;
   IF STR_Compare(str, l,'SFKnoly', STR_Max) = 0 THEN BEGIN
      afx := SFKnoly;
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
   IF STR_Compare(str, l,'SFKregord', STR_Max) = 0 THEN BEGIN
      afx := SFKregord;
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
   IF STR_Compare(str, l, 'ADVPPROP', Str_Max) = 0 THEN BEGIN
      cat := LICAT15;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'ADVPFORMULA', Str_Max) = 0 THEN BEGIN
      cat := LICAT16;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'OPENADVPPROP', Str_Max) = 0 THEN BEGIN
      cat := LICAT17;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'CLOSEDADVPPROP', Str_Max) = 0 THEN BEGIN
      cat := LICAT18;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'ART', Str_Max) = 0 THEN BEGIN
      cat := LICAT19;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'ASP', Str_Max) = 0 THEN BEGIN
      cat := LICAT20;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'BBIGPRO', Str_Max) = 0 THEN BEGIN
      cat := LICAT21;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'BIGPRO', Str_Max) = 0 THEN BEGIN
      cat := LICAT22;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'BIRRPREF', Str_Max) = 0 THEN BEGIN
      cat := LICAT23;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'CARD', Str_Max) = 0 THEN BEGIN
      cat := LICAT24;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'CLAUSE', Str_Max) = 0 THEN BEGIN
      cat := LICAT25;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'CONJ', Str_Max) = 0 THEN BEGIN
      cat := LICAT26;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'COORD', Str_Max) = 0 THEN BEGIN
      cat := LICAT27;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'DEMADJ', Str_Max) = 0 THEN BEGIN
      cat := LICAT28;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'DEMPRO', Str_Max) = 0 THEN BEGIN
      cat := LICAT29;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'BDET', Str_Max) = 0 THEN BEGIN
      cat := LICAT30;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'DET', Str_Max) = 0 THEN BEGIN
      cat := LICAT31;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'DETP', Str_Max) = 0 THEN BEGIN
      cat := LICAT32;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'DIGIT', Str_Max) = 0 THEN BEGIN
      cat := LICAT33;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'EN', Str_Max) = 0 THEN BEGIN
      cat := LICAT34;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'EMPTY', Str_Max) = 0 THEN BEGIN
      cat := LICAT35;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'EXCLAM', Str_Max) = 0 THEN BEGIN
      cat := LICAT36;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'GEN', Str_Max) = 0 THEN BEGIN
      cat := LICAT37;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'INDEFPRO', Str_Max) = 0 THEN BEGIN
      cat := LICAT38;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'SUBINDEFPRO', Str_Max) = 0 THEN BEGIN
      cat := LICAT39;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'NEG', Str_Max) = 0 THEN BEGIN
      cat := LICAT40;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'BNOUNSUFF', Str_Max) = 0 THEN BEGIN
      cat := LICAT41;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'BNOUN', Str_Max) = 0 THEN BEGIN
      cat := LICAT42;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'SUBNOUN', Str_Max) = 0 THEN BEGIN
      cat := LICAT43;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'NOUN', Str_Max) = 0 THEN BEGIN
      cat := LICAT44;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'CN', Str_Max) = 0 THEN BEGIN
      cat := LICAT45;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'NP', Str_Max) = 0 THEN BEGIN
      cat := LICAT46;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'VARNP', Str_Max) = 0 THEN BEGIN
      cat := LICAT47;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'NPPROP', Str_Max) = 0 THEN BEGIN
      cat := LICAT48;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'NPFORMULA', Str_Max) = 0 THEN BEGIN
      cat := LICAT49;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'OPENNPPROP', Str_Max) = 0 THEN BEGIN
      cat := LICAT50;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'CLOSEDNPPROP', Str_Max) = 0 THEN BEGIN
      cat := LICAT51;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'NUM', Str_Max) = 0 THEN BEGIN
      cat := LICAT52;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'ORDINAL', Str_Max) = 0 THEN BEGIN
      cat := LICAT53;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'PART', Str_Max) = 0 THEN BEGIN
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
   IF STR_Compare(str, l, 'POS', Str_Max) = 0 THEN BEGIN
      cat := LICAT57;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'POSSADJ', Str_Max) = 0 THEN BEGIN
      cat := LICAT58;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'POSSPRO', Str_Max) = 0 THEN BEGIN
      cat := LICAT59;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'BPREFIX', Str_Max) = 0 THEN BEGIN
      cat := LICAT60;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'SUBPREP', Str_Max) = 0 THEN BEGIN
      cat := LICAT61;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'PREP', Str_Max) = 0 THEN BEGIN
      cat := LICAT62;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'PREPP', Str_Max) = 0 THEN BEGIN
      cat := LICAT63;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'PREPPPROP', Str_Max) = 0 THEN BEGIN
      cat := LICAT64;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'PREPPFORMULA', Str_Max) = 0 THEN BEGIN
      cat := LICAT65;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'OPENPREPPPROP', Str_Max) = 0 THEN BEGIN
      cat := LICAT66;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'CLOSEDPREPPPROP', Str_Max) = 0 THEN BEGIN
      cat := LICAT67;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'VARPREPP', Str_Max) = 0 THEN BEGIN
      cat := LICAT68;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'BPROPERNOUN', Str_Max) = 0 THEN BEGIN
      cat := LICAT69;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'PROPERNOUN', Str_Max) = 0 THEN BEGIN
      cat := LICAT70;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'PROSENT', Str_Max) = 0 THEN BEGIN
      cat := LICAT71;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'PUNC', Str_Max) = 0 THEN BEGIN
      cat := LICAT72;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'Q', Str_Max) = 0 THEN BEGIN
      cat := LICAT73;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'QP', Str_Max) = 0 THEN BEGIN
      cat := LICAT74;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'RECIPRO', Str_Max) = 0 THEN BEGIN
      cat := LICAT75;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'REFLPRO', Str_Max) = 0 THEN BEGIN
      cat := LICAT76;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'RELPRO', Str_Max) = 0 THEN BEGIN
      cat := LICAT77;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'SENTENCE', Str_Max) = 0 THEN BEGIN
      cat := LICAT78;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'TOCAT', Str_Max) = 0 THEN BEGIN
      cat := LICAT79;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'THANAS', Str_Max) = 0 THEN BEGIN
      cat := LICAT80;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'THANP', Str_Max) = 0 THEN BEGIN
      cat := LICAT81;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'THERE', Str_Max) = 0 THEN BEGIN
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
   IF STR_Compare(str, l, 'ADVPVAR', Str_Max) = 0 THEN BEGIN
      cat := LICAT85;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'ADVPPROPVAR', Str_Max) = 0 THEN BEGIN
      cat := LICAT86;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'CLAUSEVAR', Str_Max) = 0 THEN BEGIN
      cat := LICAT87;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'CNVAR', Str_Max) = 0 THEN BEGIN
      cat := LICAT88;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'NPVAR', Str_Max) = 0 THEN BEGIN
      cat := LICAT89;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'NPPROPVAR', Str_Max) = 0 THEN BEGIN
      cat := LICAT90;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'PREPPVAR', Str_Max) = 0 THEN BEGIN
      cat := LICAT91;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'PREPPPROPVAR', Str_Max) = 0 THEN BEGIN
      cat := LICAT92;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'PROSENTVAR', Str_Max) = 0 THEN BEGIN
      cat := LICAT93;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'SENTENCEVAR', Str_Max) = 0 THEN BEGIN
      cat := LICAT94;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'VERBPPROPVAR', Str_Max) = 0 THEN BEGIN
      cat := LICAT95;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'EMPTYVAR', Str_Max) = 0 THEN BEGIN
      cat := LICAT96;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'NEGVAR', Str_Max) = 0 THEN BEGIN
      cat := LICAT97;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'POSVAR', Str_Max) = 0 THEN BEGIN
      cat := LICAT98;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'BVERBSUFF', Str_Max) = 0 THEN BEGIN
      cat := LICAT99;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'BVERB', Str_Max) = 0 THEN BEGIN
      cat := LICAT100;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'SUBVERB', Str_Max) = 0 THEN BEGIN
      cat := LICAT101;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'VERB', Str_Max) = 0 THEN BEGIN
      cat := LICAT102;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'VERBP', Str_Max) = 0 THEN BEGIN
      cat := LICAT103;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'VERBPPROP', Str_Max) = 0 THEN BEGIN
      cat := LICAT104;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'VERBPFORMULA', Str_Max) = 0 THEN BEGIN
      cat := LICAT105;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'OPENVERBPPROP', Str_Max) = 0 THEN BEGIN
      cat := LICAT106;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'CLOSEDVERBPPROP', Str_Max) = 0 THEN BEGIN
      cat := LICAT107;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'BWHPRO', Str_Max) = 0 THEN BEGIN
      cat := LICAT108;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'WHPRO', Str_Max) = 0 THEN BEGIN
      cat := LICAT109;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'SFCAT', Str_Max) = 0 THEN BEGIN
      cat := LICAT110;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'PFCAT', Str_Max) = 0 THEN BEGIN
      cat := LICAT111;
      LDSTRTOTYPE_CAT := true;
      GOTO 99
   END;
   IF STR_Compare(str, l, 'GLUE', Str_Max) = 0 THEN BEGIN
      cat := LICAT112;
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
   ELSE   IF STR_Compare(str, l, 'CCcons', STR_Max) = 0 THEN 
      cxt := LICC1
   ELSE   IF STR_Compare(str, l, 'CCVowel', STR_Max) = 0 THEN 
      cxt := LICC2
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
   ELSE   LDSTRTOTYPE_FON := false
END;
