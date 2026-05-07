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
SFKam : BEGIN
      STR_Extract(str, l, 'SFKam', 5, 1, 5);
   END;
SFKis : BEGIN
      STR_Extract(str, l, 'SFKis', 5, 1, 5);
   END;
SFKwas : BEGIN
      STR_Extract(str, l, 'SFKwas', 6, 1, 6);
   END;
SFKare : BEGIN
      STR_Extract(str, l, 'SFKare', 6, 1, 6);
   END;
SFKwere : BEGIN
      STR_Extract(str, l, 'SFKwere', 7, 1, 7);
   END;
SFKirrpp : BEGIN
      STR_Extract(str, l, 'SFKirrpp', 8, 1, 8);
   END;
SFKirring : BEGIN
      STR_Extract(str, l, 'SFKirring', 9, 1, 9);
   END;
SFKirrptpp : BEGIN
      STR_Extract(str, l, 'SFKirrptpp', 10, 1, 10);
   END;
SFKirrS : BEGIN
      STR_Extract(str, l, 'SFKirrS', 7, 1, 7);
   END;
SFKmodpt : BEGIN
      STR_Extract(str, l, 'SFKmodpt', 8, 1, 8);
   END;
SFKirrnc : BEGIN
      STR_Extract(str, l, 'SFKirrnc', 8, 1, 8);
   END;
SFKirrpt : BEGIN
      STR_Extract(str, l, 'SFKirrpt', 8, 1, 8);
   END;
SFKirrpt2 : BEGIN
      STR_Extract(str, l, 'SFKirrpt2', 9, 1, 9);
   END;
SFKirrpp2 : BEGIN
      STR_Extract(str, l, 'SFKirrpp2', 9, 1, 9);
   END;
SFKirrpp3 : BEGIN
      STR_Extract(str, l, 'SFKirrpp3', 9, 1, 9);
   END;
SFKregptpp : BEGIN
      STR_Extract(str, l, 'SFKregptpp', 10, 1, 10);
   END;
SFKcdptpp : BEGIN
      STR_Extract(str, l, 'SFKcdptpp', 9, 1, 9);
   END;
SFKcding : BEGIN
      STR_Extract(str, l, 'SFKcding', 8, 1, 8);
   END;
SFKreging : BEGIN
      STR_Extract(str, l, 'SFKreging', 9, 1, 9);
   END;
SFKregS : BEGIN
      STR_Extract(str, l, 'SFKregS', 7, 1, 7);
   END;
SFKregEs : BEGIN
      STR_Extract(str, l, 'SFKregEs', 8, 1, 8);
   END;
SFKvoicingS : BEGIN
      STR_Extract(str, l, 'SFKvoicingS', 11, 1, 11);
   END;
SFKirrplur : BEGIN
      STR_Extract(str, l, 'SFKirrplur', 10, 1, 10);
   END;
SFKlatplur : BEGIN
      STR_Extract(str, l, 'SFKlatplur', 10, 1, 10);
   END;
SFKirrcomp : BEGIN
      STR_Extract(str, l, 'SFKirrcomp', 10, 1, 10);
   END;
SFKirrsuper : BEGIN
      STR_Extract(str, l, 'SFKirrsuper', 11, 1, 11);
   END;
SFKirrcomp2 : BEGIN
      STR_Extract(str, l, 'SFKirrcomp2', 11, 1, 11);
   END;
SFKirrsuper2 : BEGIN
      STR_Extract(str, l, 'SFKirrsuper2', 12, 1, 12);
   END;
SFKcdcomp : BEGIN
      STR_Extract(str, l, 'SFKcdcomp', 9, 1, 9);
   END;
SFKcdsuper : BEGIN
      STR_Extract(str, l, 'SFKcdsuper', 10, 1, 10);
   END;
SFKregcomp : BEGIN
      STR_Extract(str, l, 'SFKregcomp', 10, 1, 10);
   END;
SFKregsuper : BEGIN
      STR_Extract(str, l, 'SFKregsuper', 11, 1, 11);
   END;
SFKacc : BEGIN
      STR_Extract(str, l, 'SFKacc', 6, 1, 6);
   END;
SFKposs : BEGIN
      STR_Extract(str, l, 'SFKposs', 7, 1, 7);
   END;
SFKpredposs : BEGIN
      STR_Extract(str, l, 'SFKpredposs', 11, 1, 11);
   END;
PFKanti1 : BEGIN
      STR_Extract(str, l, 'PFKanti1', 8, 1, 8);
   END;
PFKanti2 : BEGIN
      STR_Extract(str, l, 'PFKanti2', 8, 1, 8);
   END;
PFKex : BEGIN
      STR_Extract(str, l, 'PFKex', 5, 1, 5);
   END;
PFKhyper : BEGIN
      STR_Extract(str, l, 'PFKhyper', 8, 1, 8);
   END;
PFKpro : BEGIN
      STR_Extract(str, l, 'PFKpro', 6, 1, 6);
   END;
PFKre : BEGIN
      STR_Extract(str, l, 'PFKre', 5, 1, 5);
   END;
PFKvice : BEGIN
      STR_Extract(str, l, 'PFKvice', 7, 1, 7);
   END;
SFKregable : BEGIN
      STR_Extract(str, l, 'SFKregable', 10, 1, 10);
   END;
SFKtruncable : BEGIN
      STR_Extract(str, l, 'SFKtruncable', 12, 1, 12);
   END;
SFKcdable : BEGIN
      STR_Extract(str, l, 'SFKcdable', 9, 1, 9);
   END;
SFKregly : BEGIN
      STR_Extract(str, l, 'SFKregly', 8, 1, 8);
   END;
SFKirregly : BEGIN
      STR_Extract(str, l, 'SFKirregly', 10, 1, 10);
   END;
SFKnoly : BEGIN
      STR_Extract(str, l, 'SFKnoly', 7, 1, 7);
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
SFKregord : BEGIN
      STR_Extract(str, l, 'SFKregord', 9, 1, 9);
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
      ASP: BEGIN 
         STR_Extract(str, l, 'ASP', 3, 1, 3);
         END;
      BBIGPRO: BEGIN 
         STR_Extract(str, l, 'BBIGPRO', 7, 1, 7);
         END;
      BIGPRO: BEGIN 
         STR_Extract(str, l, 'BIGPRO', 6, 1, 6);
         END;
      BIRRPREF: BEGIN 
         STR_Extract(str, l, 'BIRRPREF', 8, 1, 8);
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
      DETP: BEGIN 
         STR_Extract(str, l, 'DETP', 4, 1, 4);
         END;
      DIGIT: BEGIN 
         STR_Extract(str, l, 'DIGIT', 5, 1, 5);
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
      GEN: BEGIN 
         STR_Extract(str, l, 'GEN', 3, 1, 3);
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
      VARNP: BEGIN 
         STR_Extract(str, l, 'VARNP', 5, 1, 5);
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
      POSSADJ: BEGIN 
         STR_Extract(str, l, 'POSSADJ', 7, 1, 7);
         END;
      POSSPRO: BEGIN 
         STR_Extract(str, l, 'POSSPRO', 7, 1, 7);
         END;
      BPREFIX: BEGIN 
         STR_Extract(str, l, 'BPREFIX', 7, 1, 7);
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
      TOCAT: BEGIN 
         STR_Extract(str, l, 'TOCAT', 5, 1, 5);
         END;
      THANAS: BEGIN 
         STR_Extract(str, l, 'THANAS', 6, 1, 6);
         END;
      THANP: BEGIN 
         STR_Extract(str, l, 'THANP', 5, 1, 5);
         END;
      THERE: BEGIN 
         STR_Extract(str, l, 'THERE', 5, 1, 5);
         END;
      UTT: BEGIN 
         STR_Extract(str, l, 'UTT', 3, 1, 3);
         END;
      ADJPPROPVAR: BEGIN 
         STR_Extract(str, l, 'ADJPPROPVAR', 11, 1, 11);
         END;
      ADVPVAR: BEGIN 
         STR_Extract(str, l, 'ADVPVAR', 7, 1, 7);
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
      NPVAR: BEGIN 
         STR_Extract(str, l, 'NPVAR', 5, 1, 5);
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
      PROSENTVAR: BEGIN 
         STR_Extract(str, l, 'PROSENTVAR', 10, 1, 10);
         END;
      SENTENCEVAR: BEGIN 
         STR_Extract(str, l, 'SENTENCEVAR', 11, 1, 11);
         END;
      VERBPPROPVAR: BEGIN 
         STR_Extract(str, l, 'VERBPPROPVAR', 12, 1, 12);
         END;
      EMPTYVAR: BEGIN 
         STR_Extract(str, l, 'EMPTYVAR', 8, 1, 8);
         END;
      NEGVAR: BEGIN 
         STR_Extract(str, l, 'NEGVAR', 6, 1, 6);
         END;
      POSVAR: BEGIN 
         STR_Extract(str, l, 'POSVAR', 6, 1, 6);
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
      degreemodrel: BEGIN 
         STR_Extract(str, l, 'degreemodrel', 12, 1, 12);
         END;
      detrel: BEGIN 
         STR_Extract(str, l, 'detrel', 6, 1, 6);
         END;
      dirargrel: BEGIN 
         STR_Extract(str, l, 'dirargrel', 9, 1, 9);
         END;
      dobjreflrel: BEGIN 
         STR_Extract(str, l, 'dobjreflrel', 11, 1, 11);
         END;
      extraposrel: BEGIN 
         STR_Extract(str, l, 'extraposrel', 11, 1, 11);
         END;
      forobjrel: BEGIN 
         STR_Extract(str, l, 'forobjrel', 9, 1, 9);
         END;
      gluerel: BEGIN 
         STR_Extract(str, l, 'gluerel', 7, 1, 7);
         END;
      head: BEGIN 
         STR_Extract(str, l, 'head', 4, 1, 4);
         END;
      hoprel: BEGIN 
         STR_Extract(str, l, 'hoprel', 6, 1, 6);
         END;
      idrel: BEGIN 
         STR_Extract(str, l, 'idrel', 5, 1, 5);
         END;
      indobjreflrel: BEGIN 
         STR_Extract(str, l, 'indobjreflrel', 13, 1, 13);
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
      ofcomplrel: BEGIN 
         STR_Extract(str, l, 'ofcomplrel', 10, 1, 10);
         END;
      partrel: BEGIN 
         STR_Extract(str, l, 'partrel', 7, 1, 7);
         END;
      passauxrel: BEGIN 
         STR_Extract(str, l, 'passauxrel', 10, 1, 10);
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
      postmodrel: BEGIN 
         STR_Extract(str, l, 'postmodrel', 10, 1, 10);
         END;
      postsentadvrel: BEGIN 
         STR_Extract(str, l, 'postsentadvrel', 14, 1, 14);
         END;
      progauxrel: BEGIN 
         STR_Extract(str, l, 'progauxrel', 10, 1, 10);
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
      puncrel: BEGIN 
         STR_Extract(str, l, 'puncrel', 7, 1, 7);
         END;
      relsentrel: BEGIN 
         STR_Extract(str, l, 'relsentrel', 10, 1, 10);
         END;
      resultrel: BEGIN 
         STR_Extract(str, l, 'resultrel', 9, 1, 9);
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
      strandedrel: BEGIN 
         STR_Extract(str, l, 'strandedrel', 11, 1, 11);
         END;
      tempadvrel: BEGIN 
         STR_Extract(str, l, 'tempadvrel', 10, 1, 10);
         END;
      thanascomplrel: BEGIN 
         STR_Extract(str, l, 'thanascomplrel', 14, 1, 14);
         END;
      thancomplrel: BEGIN 
         STR_Extract(str, l, 'thancomplrel', 12, 1, 12);
         END;
      toinfmodrel: BEGIN 
         STR_Extract(str, l, 'toinfmodrel', 11, 1, 11);
         END;
      toinfcomplrel: BEGIN 
         STR_Extract(str, l, 'toinfcomplrel', 13, 1, 13);
         END;
      toomodrel: BEGIN 
         STR_Extract(str, l, 'toomodrel', 9, 1, 9);
         END;
      torel: BEGIN 
         STR_Extract(str, l, 'torel', 5, 1, 5);
         END;
      toobjrel: BEGIN 
         STR_Extract(str, l, 'toobjrel', 8, 1, 8);
         END;
      vpadvrel: BEGIN 
         STR_Extract(str, l, 'vpadvrel', 8, 1, 8);
         END;
      END
   END
END;


