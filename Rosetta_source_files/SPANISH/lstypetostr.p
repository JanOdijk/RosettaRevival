pragma C_include('strings.pf');
Export(LSTYPETOSTR);
pragma C_include('lsdomaint.pf');
pragma C_include('str.pf');
pragma C_include('ldstrtotype.pf');
pragma C_include('lstypetostr.pf');

PROGRAM LSTYPETOSTR;

WITH LSDOMAINT, STR, STRINGS, LDSTRTOTYPE;

PROCEDURE LSTYPETOSTR_adjadvformtype( 
         VAR str: STRING;
         VAR l: STR_Range;
         attr : LSDOMAINT_adjadvformtype         );
BEGIN
   CASE attr OF 
   positive: BEGIN
      STR_Extract(str, l, 'positive', 8, 1, 8);
      END;
   notpositive: BEGIN
      STR_Extract(str, l, 'notpositive', 11, 1, 11);
      END;
   END;
END {LSTYPETOSTR_adjadvformtype};


PROCEDURE LSTYPETOSTR_adjpluralformatype( 
         VAR str: STRING;
         VAR l: STR_Range;
         attr : LSDOMAINT_adjpluralformatype         );
BEGIN
   CASE attr OF 
   reg: BEGIN
      STR_Extract(str, l, 'reg', 3, 1, 3);
      END;
   irreg: BEGIN
      STR_Extract(str, l, 'irreg', 5, 1, 5);
      END;
   END;
END {LSTYPETOSTR_adjpluralformatype};


PROCEDURE LSTYPETOSTR_adjsubctype( 
         VAR str: STRING;
         VAR l: STR_Range;
         attr : LSDOMAINT_adjsubctype         );
BEGIN
   CASE attr OF 
   coloradj: BEGIN
      STR_Extract(str, l, 'coloradj', 8, 1, 8);
      END;
   modaladj: BEGIN
      STR_Extract(str, l, 'modaladj', 8, 1, 8);
      END;
   measureadj: BEGIN
      STR_Extract(str, l, 'measureadj', 10, 1, 10);
      END;
   subjectiveadj: BEGIN
      STR_Extract(str, l, 'subjectiveadj', 13, 1, 13);
      END;
   otheradj: BEGIN
      STR_Extract(str, l, 'otheradj', 8, 1, 8);
      END;
   END;
END {LSTYPETOSTR_adjsubctype};


PROCEDURE LSTYPETOSTR_adjuncttype( 
         VAR str: STRING;
         VAR l: STR_Range;
         attr : LSDOMAINT_adjuncttype         );
BEGIN
   CASE attr OF 
   ResAP: BEGIN
      STR_Extract(str, l, 'ResAP', 5, 1, 5);
      END;
   ResPP: BEGIN
      STR_Extract(str, l, 'ResPP', 5, 1, 5);
      END;
   SubjComit: BEGIN
      STR_Extract(str, l, 'SubjComit', 9, 1, 9);
      END;
   ObjComit: BEGIN
      STR_Extract(str, l, 'ObjComit', 8, 1, 8);
      END;
   BenfactNP: BEGIN
      STR_Extract(str, l, 'BenfactNP', 9, 1, 9);
      END;
   BenfactPP: BEGIN
      STR_Extract(str, l, 'BenfactPP', 9, 1, 9);
      END;
   LocAdjunct: BEGIN
      STR_Extract(str, l, 'LocAdjunct', 10, 1, 10);
      END;
   DirAdjunct: BEGIN
      STR_Extract(str, l, 'DirAdjunct', 10, 1, 10);
      END;
   ResNP: BEGIN
      STR_Extract(str, l, 'ResNP', 5, 1, 5);
      END;
   END;
END {LSTYPETOSTR_adjuncttype};


PROCEDURE LSTYPETOSTR_adjusetype( 
         VAR str: STRING;
         VAR l: STR_Range;
         attr : LSDOMAINT_adjusetype         );
BEGIN
   CASE attr OF 
   attributive: BEGIN
      STR_Extract(str, l, 'attributive', 11, 1, 11);
      END;
   predicative: BEGIN
      STR_Extract(str, l, 'predicative', 11, 1, 11);
      END;
   nominalised: BEGIN
      STR_Extract(str, l, 'nominalised', 11, 1, 11);
      END;
   END;
END {LSTYPETOSTR_adjusetype};


PROCEDURE LSTYPETOSTR_advsubctype( 
         VAR str: STRING;
         VAR l: STR_Range;
         attr : LSDOMAINT_advsubctype         );
BEGIN
   CASE attr OF 
   SentAdv: BEGIN
      STR_Extract(str, l, 'SentAdv', 7, 1, 7);
      END;
   SubjVPAdv: BEGIN
      STR_Extract(str, l, 'SubjVPAdv', 9, 1, 9);
      END;
   AgVPAdv: BEGIN
      STR_Extract(str, l, 'AgVPAdv', 7, 1, 7);
      END;
   VPAdv: BEGIN
      STR_Extract(str, l, 'VPAdv', 5, 1, 5);
      END;
   Locadv: BEGIN
      STR_Extract(str, l, 'Locadv', 6, 1, 6);
      END;
   Causadv: BEGIN
      STR_Extract(str, l, 'Causadv', 7, 1, 7);
      END;
   DirAdv: BEGIN
      STR_Extract(str, l, 'DirAdv', 6, 1, 6);
      END;
   TempAdv: BEGIN
      STR_Extract(str, l, 'TempAdv', 7, 1, 7);
      END;
   AdjAdv: BEGIN
      STR_Extract(str, l, 'AdjAdv', 6, 1, 6);
      END;
   DegreeAdv: BEGIN
      STR_Extract(str, l, 'DegreeAdv', 9, 1, 9);
      END;
   PreXPAdv: BEGIN
      STR_Extract(str, l, 'PreXPAdv', 8, 1, 8);
      END;
   PostXPAdv: BEGIN
      STR_Extract(str, l, 'PostXPAdv', 9, 1, 9);
      END;
   OtherAdv: BEGIN
      STR_Extract(str, l, 'OtherAdv', 8, 1, 8);
      END;
   VolAdv: BEGIN
      STR_Extract(str, l, 'VolAdv', 6, 1, 6);
      END;
   PrepPAdv: BEGIN
      STR_Extract(str, l, 'PrepPAdv', 8, 1, 8);
      END;
   END;
END {LSTYPETOSTR_advsubctype};


PROCEDURE LSTYPETOSTR_aktionsarttype( 
         VAR str: STRING;
         VAR l: STR_Range;
         attr : LSDOMAINT_aktionsarttype         );
BEGIN
   CASE attr OF 
   stative: BEGIN
      STR_Extract(str, l, 'stative', 7, 1, 7);
      END;
   activity: BEGIN
      STR_Extract(str, l, 'activity', 8, 1, 8);
      END;
   accomplishment: BEGIN
      STR_Extract(str, l, 'accomplishment', 14, 1, 14);
      END;
   achievement: BEGIN
      STR_Extract(str, l, 'achievement', 11, 1, 11);
      END;
   END;
END {LSTYPETOSTR_aktionsarttype};


PROCEDURE LSTYPETOSTR_aloclasetype( 
         VAR str: STRING;
         VAR l: STR_Range;
         attr : LSDOMAINT_aloclasetype         );
BEGIN
   CASE attr OF 
   diftongCLASE: BEGIN
      STR_Extract(str, l, 'diftongCLASE', 12, 1, 12);
      END;
   irrMedekCLASE: BEGIN
      STR_Extract(str, l, 'irrMedekCLASE', 13, 1, 13);
      END;
   sterkCLASE: BEGIN
      STR_Extract(str, l, 'sterkCLASE', 10, 1, 10);
      END;
   eiouHalfCLASE: BEGIN
      STR_Extract(str, l, 'eiouHalfCLASE', 13, 1, 13);
      END;
   eiouHeelCLASE: BEGIN
      STR_Extract(str, l, 'eiouHeelCLASE', 13, 1, 13);
      END;
   yMinPresCLASE: BEGIN
      STR_Extract(str, l, 'yMinPresCLASE', 13, 1, 13);
      END;
   eiouPDCLASE: BEGIN
      STR_Extract(str, l, 'eiouPDCLASE', 11, 1, 11);
      END;
   umlautCLASE: BEGIN
      STR_Extract(str, l, 'umlautCLASE', 11, 1, 11);
      END;
   veCLASE: BEGIN
      STR_Extract(str, l, 'veCLASE', 7, 1, 7);
      END;
   yPlusPresCLASE: BEGIN
      STR_Extract(str, l, 'yPlusPresCLASE', 14, 1, 14);
      END;
   bendicCLASE: BEGIN
      STR_Extract(str, l, 'bendicCLASE', 11, 1, 11);
      END;
   sepaCLASE: BEGIN
      STR_Extract(str, l, 'sepaCLASE', 9, 1, 9);
      END;
   nadaCLASE: BEGIN
      STR_Extract(str, l, 'nadaCLASE', 9, 1, 9);
      END;
   END;
END {LSTYPETOSTR_aloclasetype};


PROCEDURE LSTYPETOSTR_animatetype( 
         VAR str: STRING;
         VAR l: STR_Range;
         attr : LSDOMAINT_animatetype         );
BEGIN
   CASE attr OF 
   YesAnimate: BEGIN
      STR_Extract(str, l, 'YesAnimate', 10, 1, 10);
      END;
   NoAnimate: BEGIN
      STR_Extract(str, l, 'NoAnimate', 9, 1, 9);
      END;
   OmegaAnimate: BEGIN
      STR_Extract(str, l, 'OmegaAnimate', 12, 1, 12);
      END;
   END;
END {LSTYPETOSTR_animatetype};


PROCEDURE LSTYPETOSTR_antecedenttype( 
         VAR str: STRING;
         VAR l: STR_Range;
         attr : LSDOMAINT_antecedenttype         );
BEGIN
   CASE attr OF 
   subjectant: BEGIN
      STR_Extract(str, l, 'subjectant', 10, 1, 10);
      END;
   objectant: BEGIN
      STR_Extract(str, l, 'objectant', 9, 1, 9);
      END;
   indobjant: BEGIN
      STR_Extract(str, l, 'indobjant', 9, 1, 9);
      END;
   noant: BEGIN
      STR_Extract(str, l, 'noant', 5, 1, 5);
      END;
   END;
END {LSTYPETOSTR_antecedenttype};


PROCEDURE LSTYPETOSTR_aspectotype( 
         VAR str: STRING;
         VAR l: STR_Range;
         attr : LSDOMAINT_aspectotype         );
BEGIN
   CASE attr OF 
   habitual: BEGIN
      STR_Extract(str, l, 'habitual', 8, 1, 8);
      END;
   imperfectivo: BEGIN
      STR_Extract(str, l, 'imperfectivo', 12, 1, 12);
      END;
   perfectivo: BEGIN
      STR_Extract(str, l, 'perfectivo', 10, 1, 10);
      END;
   omegaaspecto: BEGIN
      STR_Extract(str, l, 'omegaaspecto', 12, 1, 12);
      END;
   END;
END {LSTYPETOSTR_aspectotype};


PROCEDURE LSTYPETOSTR_casetype( 
         VAR str: STRING;
         VAR l: STR_Range;
         attr : LSDOMAINT_casetype         );
BEGIN
   CASE attr OF 
   nominative: BEGIN
      STR_Extract(str, l, 'nominative', 10, 1, 10);
      END;
   accusative: BEGIN
      STR_Extract(str, l, 'accusative', 10, 1, 10);
      END;
   dative: BEGIN
      STR_Extract(str, l, 'dative', 6, 1, 6);
      END;
   prepositive: BEGIN
      STR_Extract(str, l, 'prepositive', 11, 1, 11);
      END;
   END;
END {LSTYPETOSTR_casetype};


PROCEDURE LSTYPETOSTR_classtype( 
         VAR str: STRING;
         VAR l: STR_Range;
         attr : LSDOMAINT_classtype         );
BEGIN
   CASE attr OF 
   stativeclass: BEGIN
      STR_Extract(str, l, 'stativeclass', 12, 1, 12);
      END;
   movementclass: BEGIN
      STR_Extract(str, l, 'movementclass', 13, 1, 13);
      END;
   durativeclass: BEGIN
      STR_Extract(str, l, 'durativeclass', 13, 1, 13);
      END;
   momentaryclass: BEGIN
      STR_Extract(str, l, 'momentaryclass', 14, 1, 14);
      END;
   iterativeclass: BEGIN
      STR_Extract(str, l, 'iterativeclass', 14, 1, 14);
      END;
   END;
END {LSTYPETOSTR_classtype};


PROCEDURE LSTYPETOSTR_concordgenerotype( 
         VAR str: STRING;
         VAR l: STR_Range;
         attr : LSDOMAINT_concordgenerotype         );
BEGIN
   CASE attr OF 
   mascul: BEGIN
      STR_Extract(str, l, 'mascul', 6, 1, 6);
      END;
   femin: BEGIN
      STR_Extract(str, l, 'femin', 5, 1, 5);
      END;
   END;
END {LSTYPETOSTR_concordgenerotype};


PROCEDURE LSTYPETOSTR_concordnumerotype( 
         VAR str: STRING;
         VAR l: STR_Range;
         attr : LSDOMAINT_concordnumerotype         );
BEGIN
   CASE attr OF 
   sing: BEGIN
      STR_Extract(str, l, 'sing', 4, 1, 4);
      END;
   plur: BEGIN
      STR_Extract(str, l, 'plur', 4, 1, 4);
      END;
   END;
END {LSTYPETOSTR_concordnumerotype};


PROCEDURE LSTYPETOSTR_conjclasetype( 
         VAR str: STRING;
         VAR l: STR_Range;
         attr : LSDOMAINT_conjclasetype         );
BEGIN
   CASE attr OF 
   CONJ0: BEGIN
      STR_Extract(str, l, 'CONJ0', 5, 1, 5);
      END;
   CONJ1: BEGIN
      STR_Extract(str, l, 'CONJ1', 5, 1, 5);
      END;
   CONJ2: BEGIN
      STR_Extract(str, l, 'CONJ2', 5, 1, 5);
      END;
   CONJ3: BEGIN
      STR_Extract(str, l, 'CONJ3', 5, 1, 5);
      END;
   CONJ4: BEGIN
      STR_Extract(str, l, 'CONJ4', 5, 1, 5);
      END;
   CONJ5: BEGIN
      STR_Extract(str, l, 'CONJ5', 5, 1, 5);
      END;
   CONJ6: BEGIN
      STR_Extract(str, l, 'CONJ6', 5, 1, 5);
      END;
   CONJ7: BEGIN
      STR_Extract(str, l, 'CONJ7', 5, 1, 5);
      END;
   CONJ8: BEGIN
      STR_Extract(str, l, 'CONJ8', 5, 1, 5);
      END;
   CONJ9: BEGIN
      STR_Extract(str, l, 'CONJ9', 5, 1, 5);
      END;
   CONJ10: BEGIN
      STR_Extract(str, l, 'CONJ10', 6, 1, 6);
      END;
   CONJ11: BEGIN
      STR_Extract(str, l, 'CONJ11', 6, 1, 6);
      END;
   CONJ12: BEGIN
      STR_Extract(str, l, 'CONJ12', 6, 1, 6);
      END;
   CONJ13: BEGIN
      STR_Extract(str, l, 'CONJ13', 6, 1, 6);
      END;
   CONJ14: BEGIN
      STR_Extract(str, l, 'CONJ14', 6, 1, 6);
      END;
   CONJ15: BEGIN
      STR_Extract(str, l, 'CONJ15', 6, 1, 6);
      END;
   CONJ16: BEGIN
      STR_Extract(str, l, 'CONJ16', 6, 1, 6);
      END;
   CONJ17: BEGIN
      STR_Extract(str, l, 'CONJ17', 6, 1, 6);
      END;
   CONJ18: BEGIN
      STR_Extract(str, l, 'CONJ18', 6, 1, 6);
      END;
   CONJ19: BEGIN
      STR_Extract(str, l, 'CONJ19', 6, 1, 6);
      END;
   CONJ20: BEGIN
      STR_Extract(str, l, 'CONJ20', 6, 1, 6);
      END;
   END;
END {LSTYPETOSTR_conjclasetype};


PROCEDURE LSTYPETOSTR_contractiontype( 
         VAR str: STRING;
         VAR l: STR_Range;
         attr : LSDOMAINT_contractiontype         );
BEGIN
   CASE attr OF 
   ADEcontraction: BEGIN
      STR_Extract(str, l, 'ADEcontraction', 14, 1, 14);
      END;
   CONcontraction: BEGIN
      STR_Extract(str, l, 'CONcontraction', 14, 1, 14);
      END;
   NOcontraction: BEGIN
      STR_Extract(str, l, 'NOcontraction', 13, 1, 13);
      END;
   END;
END {LSTYPETOSTR_contractiontype};


PROCEDURE LSTYPETOSTR_controllertype( 
         VAR str: STRING;
         VAR l: STR_Range;
         attr : LSDOMAINT_controllertype         );
BEGIN
   CASE attr OF 
   subject: BEGIN
      STR_Extract(str, l, 'subject', 7, 1, 7);
      END;
   object: BEGIN
      STR_Extract(str, l, 'object', 6, 1, 6);
      END;
   indobj: BEGIN
      STR_Extract(str, l, 'indobj', 6, 1, 6);
      END;
   prepobj: BEGIN
      STR_Extract(str, l, 'prepobj', 7, 1, 7);
      END;
   none: BEGIN
      STR_Extract(str, l, 'none', 4, 1, 4);
      END;
   END;
END {LSTYPETOSTR_controllertype};


PROCEDURE LSTYPETOSTR_coordkindtype( 
         VAR str: STRING;
         VAR l: STR_Range;
         attr : LSDOMAINT_coordkindtype         );
BEGIN
   CASE attr OF 
   simple: BEGIN
      STR_Extract(str, l, 'simple', 6, 1, 6);
      END;
   correlative1: BEGIN
      STR_Extract(str, l, 'correlative1', 12, 1, 12);
      END;
   correlative2: BEGIN
      STR_Extract(str, l, 'correlative2', 12, 1, 12);
      END;
   END;
END {LSTYPETOSTR_coordkindtype};


PROCEDURE LSTYPETOSTR_coordpatterntype( 
         VAR str: STRING;
         VAR l: STR_Range;
         attr : LSDOMAINT_coordpatterntype         );
BEGIN
   CASE attr OF 
   npc: BEGIN
      STR_Extract(str, l, 'npc', 3, 1, 3);
      END;
   apc: BEGIN
      STR_Extract(str, l, 'apc', 3, 1, 3);
      END;
   ppc: BEGIN
      STR_Extract(str, l, 'ppc', 3, 1, 3);
      END;
   vpc: BEGIN
      STR_Extract(str, l, 'vpc', 3, 1, 3);
      END;
   Smdc: BEGIN
      STR_Extract(str, l, 'Smdc', 4, 1, 4);
      END;
   Smync: BEGIN
      STR_Extract(str, l, 'Smync', 5, 1, 5);
      END;
   Smwhc: BEGIN
      STR_Extract(str, l, 'Smwhc', 5, 1, 5);
      END;
   Ssdc: BEGIN
      STR_Extract(str, l, 'Ssdc', 4, 1, 4);
      END;
   Ssync: BEGIN
      STR_Extract(str, l, 'Ssync', 5, 1, 5);
      END;
   Sswhc: BEGIN
      STR_Extract(str, l, 'Sswhc', 5, 1, 5);
      END;
   Simpc: BEGIN
      STR_Extract(str, l, 'Simpc', 5, 1, 5);
      END;
   Srelfinc: BEGIN
      STR_Extract(str, l, 'Srelfinc', 8, 1, 8);
      END;
   Sinfc: BEGIN
      STR_Extract(str, l, 'Sinfc', 5, 1, 5);
      END;
   Sgerc: BEGIN
      STR_Extract(str, l, 'Sgerc', 5, 1, 5);
      END;
   Spapc: BEGIN
      STR_Extract(str, l, 'Spapc', 5, 1, 5);
      END;
   END;
END {LSTYPETOSTR_coordpatterntype};


PROCEDURE LSTYPETOSTR_coordtype( 
         VAR str: STRING;
         VAR l: STR_Range;
         attr : LSDOMAINT_coordtype         );
BEGIN
   CASE attr OF 
   nocoord: BEGIN
      STR_Extract(str, l, 'nocoord', 7, 1, 7);
      END;
   simplecoord: BEGIN
      STR_Extract(str, l, 'simplecoord', 11, 1, 11);
      END;
   corrcoord: BEGIN
      STR_Extract(str, l, 'corrcoord', 9, 1, 9);
      END;
   END;
END {LSTYPETOSTR_coordtype};


PROCEDURE LSTYPETOSTR_copulatype( 
         VAR str: STRING;
         VAR l: STR_Range;
         attr : LSDOMAINT_copulatype         );
BEGIN
   CASE attr OF 
   ser: BEGIN
      STR_Extract(str, l, 'ser', 3, 1, 3);
      END;
   estar: BEGIN
      STR_Extract(str, l, 'estar', 5, 1, 5);
      END;
   END;
END {LSTYPETOSTR_copulatype};


PROCEDURE LSTYPETOSTR_deftype( 
         VAR str: STRING;
         VAR l: STR_Range;
         attr : LSDOMAINT_deftype         );
BEGIN
   CASE attr OF 
   def: BEGIN
      STR_Extract(str, l, 'def', 3, 1, 3);
      END;
   adef: BEGIN
      STR_Extract(str, l, 'adef', 4, 1, 4);
      END;
   indef: BEGIN
      STR_Extract(str, l, 'indef', 5, 1, 5);
      END;
   omegadef: BEGIN
      STR_Extract(str, l, 'omegadef', 8, 1, 8);
      END;
   END;
END {LSTYPETOSTR_deftype};


PROCEDURE LSTYPETOSTR_distritype( 
         VAR str: STRING;
         VAR l: STR_Range;
         attr : LSDOMAINT_distritype         );
BEGIN
   CASE attr OF 
   initial: BEGIN
      STR_Extract(str, l, 'initial', 7, 1, 7);
      END;
   middle: BEGIN
      STR_Extract(str, l, 'middle', 6, 1, 6);
      END;
   final: BEGIN
      STR_Extract(str, l, 'final', 5, 1, 5);
      END;
   END;
END {LSTYPETOSTR_distritype};


PROCEDURE LSTYPETOSTR_femformatype( 
         VAR str: STRING;
         VAR l: STR_Range;
         attr : LSDOMAINT_femformatype         );
BEGIN
   CASE attr OF 
   normal: BEGIN
      STR_Extract(str, l, 'normal', 6, 1, 6);
      END;
   nocambio: BEGIN
      STR_Extract(str, l, 'nocambio', 8, 1, 8);
      END;
   END;
END {LSTYPETOSTR_femformatype};


PROCEDURE LSTYPETOSTR_finitenesstype( 
         VAR str: STRING;
         VAR l: STR_Range;
         attr : LSDOMAINT_finitenesstype         );
BEGIN
   CASE attr OF 
   finite: BEGIN
      STR_Extract(str, l, 'finite', 6, 1, 6);
      END;
   infinite: BEGIN
      STR_Extract(str, l, 'infinite', 8, 1, 8);
      END;
   omegafin: BEGIN
      STR_Extract(str, l, 'omegafin', 8, 1, 8);
      END;
   END;
END {LSTYPETOSTR_finitenesstype};


PROCEDURE LSTYPETOSTR_futurotype( 
         VAR str: STRING;
         VAR l: STR_Range;
         attr : LSDOMAINT_futurotype         );
BEGIN
   CASE attr OF 
   sifuturo: BEGIN
      STR_Extract(str, l, 'sifuturo', 8, 1, 8);
      END;
   nofuturo: BEGIN
      STR_Extract(str, l, 'nofuturo', 8, 1, 8);
      END;
   END;
END {LSTYPETOSTR_futurotype};


PROCEDURE LSTYPETOSTR_generictype( 
         VAR str: STRING;
         VAR l: STR_Range;
         attr : LSDOMAINT_generictype         );
BEGIN
   CASE attr OF 
   yesgeneric: BEGIN
      STR_Extract(str, l, 'yesgeneric', 10, 1, 10);
      END;
   nogeneric: BEGIN
      STR_Extract(str, l, 'nogeneric', 9, 1, 9);
      END;
   omegageneric: BEGIN
      STR_Extract(str, l, 'omegageneric', 12, 1, 12);
      END;
   END;
END {LSTYPETOSTR_generictype};


PROCEDURE LSTYPETOSTR_generotype( 
         VAR str: STRING;
         VAR l: STR_Range;
         attr : LSDOMAINT_generotype         );
BEGIN
   CASE attr OF 
   masc: BEGIN
      STR_Extract(str, l, 'masc', 4, 1, 4);
      END;
   fem: BEGIN
      STR_Extract(str, l, 'fem', 3, 1, 3);
      END;
   neutro: BEGIN
      STR_Extract(str, l, 'neutro', 6, 1, 6);
      END;
   omegagenero: BEGIN
      STR_Extract(str, l, 'omegagenero', 11, 1, 11);
      END;
   END;
END {LSTYPETOSTR_generotype};


PROCEDURE LSTYPETOSTR_humantype( 
         VAR str: STRING;
         VAR l: STR_Range;
         attr : LSDOMAINT_humantype         );
BEGIN
   CASE attr OF 
   YesHuman: BEGIN
      STR_Extract(str, l, 'YesHuman', 8, 1, 8);
      END;
   NoHuman: BEGIN
      STR_Extract(str, l, 'NoHuman', 7, 1, 7);
      END;
   OmegaHuman: BEGIN
      STR_Extract(str, l, 'OmegaHuman', 10, 1, 10);
      END;
   END;
END {LSTYPETOSTR_humantype};


PROCEDURE LSTYPETOSTR_infsorttype( 
         VAR str: STRING;
         VAR l: STR_Range;
         attr : LSDOMAINT_infsorttype         );
BEGIN
   CASE attr OF 
   inf: BEGIN
      STR_Extract(str, l, 'inf', 3, 1, 3);
      END;
   queinf: BEGIN
      STR_Extract(str, l, 'queinf', 6, 1, 6);
      END;
   parainf: BEGIN
      STR_Extract(str, l, 'parainf', 7, 1, 7);
      END;
   omegainf: BEGIN
      STR_Extract(str, l, 'omegainf', 8, 1, 8);
      END;
   END;
END {LSTYPETOSTR_infsorttype};


PROCEDURE LSTYPETOSTR_intensvtype( 
         VAR str: STRING;
         VAR l: STR_Range;
         attr : LSDOMAINT_intensvtype         );
BEGIN
   CASE attr OF 
   intens: BEGIN
      STR_Extract(str, l, 'intens', 6, 1, 6);
      END;
   notintens: BEGIN
      STR_Extract(str, l, 'notintens', 9, 1, 9);
      END;
   END;
END {LSTYPETOSTR_intensvtype};


PROCEDURE LSTYPETOSTR_modotype( 
         VAR str: STRING;
         VAR l: STR_Range;
         attr : LSDOMAINT_modotype         );
BEGIN
   CASE attr OF 
   Indicativo: BEGIN
      STR_Extract(str, l, 'Indicativo', 10, 1, 10);
      END;
   Subjuntivo: BEGIN
      STR_Extract(str, l, 'Subjuntivo', 10, 1, 10);
      END;
   Imperativo: BEGIN
      STR_Extract(str, l, 'Imperativo', 10, 1, 10);
      END;
   Infinitivo: BEGIN
      STR_Extract(str, l, 'Infinitivo', 10, 1, 10);
      END;
   Gerundio: BEGIN
      STR_Extract(str, l, 'Gerundio', 8, 1, 8);
      END;
   PtcPas: BEGIN
      STR_Extract(str, l, 'PtcPas', 6, 1, 6);
      END;
   omegamodo: BEGIN
      STR_Extract(str, l, 'omegamodo', 9, 1, 9);
      END;
   END;
END {LSTYPETOSTR_modotype};


PROCEDURE LSTYPETOSTR_moodtype( 
         VAR str: STRING;
         VAR l: STR_Range;
         attr : LSDOMAINT_moodtype         );
BEGIN
   CASE attr OF 
   declarative: BEGIN
      STR_Extract(str, l, 'declarative', 11, 1, 11);
      END;
   yesnointerrogative: BEGIN
      STR_Extract(str, l, 'yesnointerrogative', 18, 1, 18);
      END;
   WHinterrogative: BEGIN
      STR_Extract(str, l, 'WHinterrogative', 15, 1, 15);
      END;
   Imperativemood: BEGIN
      STR_Extract(str, l, 'Imperativemood', 14, 1, 14);
      END;
   Relative: BEGIN
      STR_Extract(str, l, 'Relative', 8, 1, 8);
      END;
   Absolutive: BEGIN
      STR_Extract(str, l, 'Absolutive', 10, 1, 10);
      END;
   Partrelative: BEGIN
      STR_Extract(str, l, 'Partrelative', 12, 1, 12);
      END;
   WHmod: BEGIN
      STR_Extract(str, l, 'WHmod', 5, 1, 5);
      END;
   ProObjmod: BEGIN
      STR_Extract(str, l, 'ProObjmod', 9, 1, 9);
      END;
   omegamood: BEGIN
      STR_Extract(str, l, 'omegamood', 9, 1, 9);
      END;
   END;
END {LSTYPETOSTR_moodtype};


PROCEDURE LSTYPETOSTR_negpostype( 
         VAR str: STRING;
         VAR l: STR_Range;
         attr : LSDOMAINT_negpostype         );
BEGIN
   CASE attr OF 
   shiftneg: BEGIN
      STR_Extract(str, l, 'shiftneg', 8, 1, 8);
      END;
   subjneg: BEGIN
      STR_Extract(str, l, 'subjneg', 7, 1, 7);
      END;
   noneg: BEGIN
      STR_Extract(str, l, 'noneg', 5, 1, 5);
      END;
   END;
END {LSTYPETOSTR_negpostype};


PROCEDURE LSTYPETOSTR_nounsubctype( 
         VAR str: STRING;
         VAR l: STR_Range;
         attr : LSDOMAINT_nounsubctype         );
BEGIN
   CASE attr OF 
   vocativenoun: BEGIN
      STR_Extract(str, l, 'vocativenoun', 12, 1, 12);
      END;
   professionnoun: BEGIN
      STR_Extract(str, l, 'professionnoun', 14, 1, 14);
      END;
   relationnoun: BEGIN
      STR_Extract(str, l, 'relationnoun', 12, 1, 12);
      END;
   unitnoun: BEGIN
      STR_Extract(str, l, 'unitnoun', 8, 1, 8);
      END;
   city: BEGIN
      STR_Extract(str, l, 'city', 4, 1, 4);
      END;
   country: BEGIN
      STR_Extract(str, l, 'country', 7, 1, 7);
      END;
   firstname: BEGIN
      STR_Extract(str, l, 'firstname', 9, 1, 9);
      END;
   surname: BEGIN
      STR_Extract(str, l, 'surname', 7, 1, 7);
      END;
   institutename: BEGIN
      STR_Extract(str, l, 'institutename', 13, 1, 13);
      END;
   holidayname: BEGIN
      STR_Extract(str, l, 'holidayname', 11, 1, 11);
      END;
   othername: BEGIN
      STR_Extract(str, l, 'othername', 9, 1, 9);
      END;
   othernoun: BEGIN
      STR_Extract(str, l, 'othernoun', 9, 1, 9);
      END;
   titlenoun: BEGIN
      STR_Extract(str, l, 'titlenoun', 9, 1, 9);
      END;
   monthnoun: BEGIN
      STR_Extract(str, l, 'monthnoun', 9, 1, 9);
      END;
   daynoun: BEGIN
      STR_Extract(str, l, 'daynoun', 7, 1, 7);
      END;
   END;
END {LSTYPETOSTR_nounsubctype};


PROCEDURE LSTYPETOSTR_npheadtype( 
         VAR str: STRING;
         VAR l: STR_Range;
         attr : LSDOMAINT_npheadtype         );
BEGIN
   CASE attr OF 
   SEimpershead: BEGIN
      STR_Extract(str, l, 'SEimpershead', 12, 1, 12);
      END;
   proSEhead: BEGIN
      STR_Extract(str, l, 'proSEhead', 9, 1, 9);
      END;
   redelloNP: BEGIN
      STR_Extract(str, l, 'redelloNP', 9, 1, 9);
      END;
   redellosNP: BEGIN
      STR_Extract(str, l, 'redellosNP', 10, 1, 10);
      END;
   persproNP: BEGIN
      STR_Extract(str, l, 'persproNP', 9, 1, 9);
      END;
   QuewhproNP: BEGIN
      STR_Extract(str, l, 'QuewhproNP', 10, 1, 10);
      END;
   unoNP: BEGIN
      STR_Extract(str, l, 'unoNP', 5, 1, 5);
      END;
   esteNP: BEGIN
      STR_Extract(str, l, 'esteNP', 6, 1, 6);
      END;
   eseNP: BEGIN
      STR_Extract(str, l, 'eseNP', 5, 1, 5);
      END;
   aquelNP: BEGIN
      STR_Extract(str, l, 'aquelNP', 7, 1, 7);
      END;
   enNP: BEGIN
      STR_Extract(str, l, 'enNP', 4, 1, 4);
      END;
   cardNP: BEGIN
      STR_Extract(str, l, 'cardNP', 6, 1, 6);
      END;
   otherNP: BEGIN
      STR_Extract(str, l, 'otherNP', 7, 1, 7);
      END;
   END;
END {LSTYPETOSTR_npheadtype};


PROCEDURE LSTYPETOSTR_numerotype( 
         VAR str: STRING;
         VAR l: STR_Range;
         attr : LSDOMAINT_numerotype         );
BEGIN
   CASE attr OF 
   singular: BEGIN
      STR_Extract(str, l, 'singular', 8, 1, 8);
      END;
   plural: BEGIN
      STR_Extract(str, l, 'plural', 6, 1, 6);
      END;
   omeganumero: BEGIN
      STR_Extract(str, l, 'omeganumero', 11, 1, 11);
      END;
   END;
END {LSTYPETOSTR_numerotype};


PROCEDURE LSTYPETOSTR_persproformatype( 
         VAR str: STRING;
         VAR l: STR_Range;
         attr : LSDOMAINT_persproformatype         );
BEGIN
   CASE attr OF 
   acusCL: BEGIN
      STR_Extract(str, l, 'acusCL', 6, 1, 6);
      END;
   acusLEcl: BEGIN
      STR_Extract(str, l, 'acusLEcl', 8, 1, 8);
      END;
   datCL: BEGIN
      STR_Extract(str, l, 'datCL', 5, 1, 5);
      END;
   Nomfuerte: BEGIN
      STR_Extract(str, l, 'Nomfuerte', 9, 1, 9);
      END;
   Nomdebil: BEGIN
      STR_Extract(str, l, 'Nomdebil', 8, 1, 8);
      END;
   Prepfuerte: BEGIN
      STR_Extract(str, l, 'Prepfuerte', 10, 1, 10);
      END;
   END;
END {LSTYPETOSTR_persproformatype};


PROCEDURE LSTYPETOSTR_pluralformatype( 
         VAR str: STRING;
         VAR l: STR_Range;
         attr : LSDOMAINT_pluralformatype         );
BEGIN
   CASE attr OF 
   regular: BEGIN
      STR_Extract(str, l, 'regular', 7, 1, 7);
      END;
   extran: BEGIN
      STR_Extract(str, l, 'extran', 6, 1, 6);
      END;
   irregular: BEGIN
      STR_Extract(str, l, 'irregular', 9, 1, 9);
      END;
   sincambio: BEGIN
      STR_Extract(str, l, 'sincambio', 9, 1, 9);
      END;
   noplural: BEGIN
      STR_Extract(str, l, 'noplural', 8, 1, 8);
      END;
   nosingular: BEGIN
      STR_Extract(str, l, 'nosingular', 10, 1, 10);
      END;
   END;
END {LSTYPETOSTR_pluralformatype};


PROCEDURE LSTYPETOSTR_polaritytype( 
         VAR str: STRING;
         VAR l: STR_Range;
         attr : LSDOMAINT_polaritytype         );
BEGIN
   CASE attr OF 
   pospol: BEGIN
      STR_Extract(str, l, 'pospol', 6, 1, 6);
      END;
   negpol: BEGIN
      STR_Extract(str, l, 'negpol', 6, 1, 6);
      END;
   omegapol: BEGIN
      STR_Extract(str, l, 'omegapol', 8, 1, 8);
      END;
   END;
END {LSTYPETOSTR_polaritytype};


PROCEDURE LSTYPETOSTR_posiciontype( 
         VAR str: STRING;
         VAR l: STR_Range;
         attr : LSDOMAINT_posiciontype         );
BEGIN
   CASE attr OF 
   prePosicion: BEGIN
      STR_Extract(str, l, 'prePosicion', 11, 1, 11);
      END;
   postPosicion: BEGIN
      STR_Extract(str, l, 'postPosicion', 12, 1, 12);
      END;
   ambosPosicion: BEGIN
      STR_Extract(str, l, 'ambosPosicion', 13, 1, 13);
      END;
   END;
END {LSTYPETOSTR_posiciontype};


PROCEDURE LSTYPETOSTR_posscomatype( 
         VAR str: STRING;
         VAR l: STR_Range;
         attr : LSDOMAINT_posscomatype         );
BEGIN
   CASE attr OF 
   count: BEGIN
      STR_Extract(str, l, 'count', 5, 1, 5);
      END;
   mass: BEGIN
      STR_Extract(str, l, 'mass', 4, 1, 4);
      END;
   END;
END {LSTYPETOSTR_posscomatype};


PROCEDURE LSTYPETOSTR_prepsubctype( 
         VAR str: STRING;
         VAR l: STR_Range;
         attr : LSDOMAINT_prepsubctype         );
BEGIN
   CASE attr OF 
   loc: BEGIN
      STR_Extract(str, l, 'loc', 3, 1, 3);
      END;
   dir: BEGIN
      STR_Extract(str, l, 'dir', 3, 1, 3);
      END;
   temp: BEGIN
      STR_Extract(str, l, 'temp', 4, 1, 4);
      END;
   topic: BEGIN
      STR_Extract(str, l, 'topic', 5, 1, 5);
      END;
   approx: BEGIN
      STR_Extract(str, l, 'approx', 6, 1, 6);
      END;
   according: BEGIN
      STR_Extract(str, l, 'according', 9, 1, 9);
      END;
   excepting: BEGIN
      STR_Extract(str, l, 'excepting', 9, 1, 9);
      END;
   comitative: BEGIN
      STR_Extract(str, l, 'comitative', 10, 1, 10);
      END;
   instrum: BEGIN
      STR_Extract(str, l, 'instrum', 7, 1, 7);
      END;
   doorpor: BEGIN
      STR_Extract(str, l, 'doorpor', 7, 1, 7);
      END;
   Aio: BEGIN
      STR_Extract(str, l, 'Aio', 3, 1, 3);
      END;
   para: BEGIN
      STR_Extract(str, l, 'para', 4, 1, 4);
      END;
   caus: BEGIN
      STR_Extract(str, l, 'caus', 4, 1, 4);
      END;
   other: BEGIN
      STR_Extract(str, l, 'other', 5, 1, 5);
      END;
   END;
END {LSTYPETOSTR_prepsubctype};


PROCEDURE LSTYPETOSTR_quesitype( 
         VAR str: STRING;
         VAR l: STR_Range;
         attr : LSDOMAINT_quesitype         );
BEGIN
   CASE attr OF 
   quesisent: BEGIN
      STR_Extract(str, l, 'quesisent', 9, 1, 9);
      END;
   quenosent: BEGIN
      STR_Extract(str, l, 'quenosent', 9, 1, 9);
      END;
   omegaprosent: BEGIN
      STR_Extract(str, l, 'omegaprosent', 12, 1, 12);
      END;
   END;
END {LSTYPETOSTR_quesitype};


PROCEDURE LSTYPETOSTR_reflexivetype( 
         VAR str: STRING;
         VAR l: STR_Range;
         attr : LSDOMAINT_reflexivetype         );
BEGIN
   CASE attr OF 
   notreflexive: BEGIN
      STR_Extract(str, l, 'notreflexive', 12, 1, 12);
      END;
   reflexive: BEGIN
      STR_Extract(str, l, 'reflexive', 9, 1, 9);
      END;
   END;
END {LSTYPETOSTR_reflexivetype};


PROCEDURE LSTYPETOSTR_senttypetype( 
         VAR str: STRING;
         VAR l: STR_Range;
         attr : LSDOMAINT_senttypetype         );
BEGIN
   CASE attr OF 
   mainclause: BEGIN
      STR_Extract(str, l, 'mainclause', 10, 1, 10);
      END;
   subordinateclause: BEGIN
      STR_Extract(str, l, 'subordinateclause', 17, 1, 17);
      END;
   omegaclause: BEGIN
      STR_Extract(str, l, 'omegaclause', 11, 1, 11);
      END;
   END;
END {LSTYPETOSTR_senttypetype};


PROCEDURE LSTYPETOSTR_sinotype( 
         VAR str: STRING;
         VAR l: STR_Range;
         attr : LSDOMAINT_sinotype         );
BEGIN
   CASE attr OF 
   si: BEGIN
      STR_Extract(str, l, 'si', 2, 1, 2);
      END;
   no: BEGIN
      STR_Extract(str, l, 'no', 2, 1, 2);
      END;
   END;
END {LSTYPETOSTR_sinotype};


PROCEDURE LSTYPETOSTR_specqtype( 
         VAR str: STRING;
         VAR l: STR_Range;
         attr : LSDOMAINT_specqtype         );
BEGIN
   CASE attr OF 
   omegaspec: BEGIN
      STR_Extract(str, l, 'omegaspec', 9, 1, 9);
      END;
   yesspec: BEGIN
      STR_Extract(str, l, 'yesspec', 7, 1, 7);
      END;
   nospec: BEGIN
      STR_Extract(str, l, 'nospec', 6, 1, 6);
      END;
   END;
END {LSTYPETOSTR_specqtype};


PROCEDURE LSTYPETOSTR_synpatterntype( 
         VAR str: STRING;
         VAR l: STR_Range;
         attr : LSDOMAINT_synpatterntype         );
BEGIN
   CASE attr OF 
   synSER: BEGIN
      STR_Extract(str, l, 'synSER', 6, 1, 6);
      END;
   synESTAR: BEGIN
      STR_Extract(str, l, 'synESTAR', 8, 1, 8);
      END;
   synHABER: BEGIN
      STR_Extract(str, l, 'synHABER', 8, 1, 8);
      END;
   synANP_CLOSEDADJPPROP: BEGIN
      STR_Extract(str, l, 'synANP_CLOSEDADJPPROP', 21, 1, 21);
      END;
   synANP_CLOSEDNPPROP: BEGIN
      STR_Extract(str, l, 'synANP_CLOSEDNPPROP', 19, 1, 19);
      END;
   synANP_DONP: BEGIN
      STR_Extract(str, l, 'synANP_DONP', 11, 1, 11);
      END;
   synANP_MEASUREPHRASE: BEGIN
      STR_Extract(str, l, 'synANP_MEASUREPHRASE', 20, 1, 20);
      END;
   synANP_OPENINFSENT: BEGIN
      STR_Extract(str, l, 'synANP_OPENINFSENT', 18, 1, 18);
      END;
   synANP_OTHERCLOSEDPREPPPROP: BEGIN
      STR_Extract(str, l, 'synANP_OTHERCLOSEDPREPPPROP', 27, 1, 27);
      END;
   synANP_PREPCLOSEDADJPPROP: BEGIN
      STR_Extract(str, l, 'synANP_PREPCLOSEDADJPPROP', 25, 1, 25);
      END;
   synANP_QSENT: BEGIN
      STR_Extract(str, l, 'synANP_QSENT', 12, 1, 12);
      END;
   synANP_QUESENTind: BEGIN
      STR_Extract(str, l, 'synANP_QUESENTind', 17, 1, 17);
      END;
   synANP_QUESENTsubj: BEGIN
      STR_Extract(str, l, 'synANP_QUESENTsubj', 18, 1, 18);
      END;
   synANP_QUESISENT: BEGIN
      STR_Extract(str, l, 'synANP_QUESISENT', 16, 1, 16);
      END;
   synCLOSEDADJPPROP: BEGIN
      STR_Extract(str, l, 'synCLOSEDADJPPROP', 17, 1, 17);
      END;
   synQUECLOSEDINFSENT: BEGIN
      STR_Extract(str, l, 'synQUECLOSEDINFSENT', 19, 1, 19);
      END;
   synCLOSEDINFSENT: BEGIN
      STR_Extract(str, l, 'synCLOSEDINFSENT', 16, 1, 16);
      END;
   synCLOSEDNPPROP: BEGIN
      STR_Extract(str, l, 'synCLOSEDNPPROP', 15, 1, 15);
      END;
   synCLOSEDVERBPPROP: BEGIN
      STR_Extract(str, l, 'synCLOSEDVERBPPROP', 18, 1, 18);
      END;
   synCOMOCLOSEDADJPPROP: BEGIN
      STR_Extract(str, l, 'synCOMOCLOSEDADJPPROP', 21, 1, 21);
      END;
   synDIRCLOSEDPREPPPROP: BEGIN
      STR_Extract(str, l, 'synDIRCLOSEDPREPPPROP', 21, 1, 21);
      END;
   synDIROPENPREPPPROP: BEGIN
      STR_Extract(str, l, 'synDIROPENPREPPPROP', 19, 1, 19);
      END;
   synDONP_DIROPENPREPPPROP: BEGIN
      STR_Extract(str, l, 'synDONP_DIROPENPREPPPROP', 24, 1, 24);
      END;
   synDONP_LOCOPENPREPPPROP: BEGIN
      STR_Extract(str, l, 'synDONP_LOCOPENPREPPPROP', 24, 1, 24);
      END;
   synDONP_OPENADJPPROP: BEGIN
      STR_Extract(str, l, 'synDONP_OPENADJPPROP', 20, 1, 20);
      END;
   synDONP_OPENINFSENT: BEGIN
      STR_Extract(str, l, 'synDONP_OPENINFSENT', 19, 1, 19);
      END;
   synDONP_OPENNPPROP: BEGIN
      STR_Extract(str, l, 'synDONP_OPENNPPROP', 18, 1, 18);
      END;
   synDONP_PREPNP: BEGIN
      STR_Extract(str, l, 'synDONP_PREPNP', 14, 1, 14);
      END;
   synDONP_PREPEMPTY: BEGIN
      STR_Extract(str, l, 'synDONP_PREPEMPTY', 17, 1, 17);
      END;
   synANP_PREPOPENINFSENT: BEGIN
      STR_Extract(str, l, 'synANP_PREPOPENINFSENT', 22, 1, 22);
      END;
   synPREPMEASUREPHRASE: BEGIN
      STR_Extract(str, l, 'synPREPMEASUREPHRASE', 20, 1, 20);
      END;
   synDONP_OTHERCLOSEDPREPPPROP: BEGIN
      STR_Extract(str, l, 'synDONP_OTHERCLOSEDPREPPPROP', 28, 1, 28);
      END;
   synEMPTY_PREPEMPTY: BEGIN
      STR_Extract(str, l, 'synEMPTY_PREPEMPTY', 18, 1, 18);
      END;
   synSOPROSENT: BEGIN
      STR_Extract(str, l, 'synSOPROSENT', 12, 1, 12);
      END;
   synEMPTY_PROSENT: BEGIN
      STR_Extract(str, l, 'synEMPTY_PROSENT', 16, 1, 16);
      END;
   synEMPTY_PREPNP: BEGIN
      STR_Extract(str, l, 'synEMPTY_PREPNP', 15, 1, 15);
      END;
   synPREPEMPTY_PREPNP: BEGIN
      STR_Extract(str, l, 'synPREPEMPTY_PREPNP', 19, 1, 19);
      END;
   synDONP_OPENGERSENT: BEGIN
      STR_Extract(str, l, 'synDONP_OPENGERSENT', 19, 1, 19);
      END;
   synDONP_RESULTEMPTY: BEGIN
      STR_Extract(str, l, 'synDONP_RESULTEMPTY', 19, 1, 19);
      END;
   synANP_PREPNP: BEGIN
      STR_Extract(str, l, 'synANP_PREPNP', 13, 1, 13);
      END;
   synANP_PREPQUESENTind: BEGIN
      STR_Extract(str, l, 'synANP_PREPQUESENTind', 21, 1, 21);
      END;
   synANP_PREPQUESENTsubj: BEGIN
      STR_Extract(str, l, 'synANP_PREPQUESENTsubj', 22, 1, 22);
      END;
   synEMPTY_PREPQUESENTsubj: BEGIN
      STR_Extract(str, l, 'synEMPTY_PREPQUESENTsubj', 24, 1, 24);
      END;
   synEMPTY_ANP: BEGIN
      STR_Extract(str, l, 'synEMPTY_ANP', 12, 1, 12);
      END;
   synDONP_QUESENTind: BEGIN
      STR_Extract(str, l, 'synDONP_QUESENTind', 18, 1, 18);
      END;
   synDONP_QUESENTsubj: BEGIN
      STR_Extract(str, l, 'synDONP_QUESENTsubj', 19, 1, 19);
      END;
   synPREPNP_PREPEMPTY: BEGIN
      STR_Extract(str, l, 'synPREPNP_PREPEMPTY', 19, 1, 19);
      END;
   synDONP_OTHEROPENPREPPPROP: BEGIN
      STR_Extract(str, l, 'synDONP_OTHEROPENPREPPPROP', 26, 1, 26);
      END;
   synANP_PROSENT: BEGIN
      STR_Extract(str, l, 'synANP_PROSENT', 14, 1, 14);
      END;
   synDIREMPTY: BEGIN
      STR_Extract(str, l, 'synDIREMPTY', 11, 1, 11);
      END;
   synPREPOPENADJPPROP: BEGIN
      STR_Extract(str, l, 'synPREPOPENADJPPROP', 19, 1, 19);
      END;
   synEMPTY_QUESISENT: BEGIN
      STR_Extract(str, l, 'synEMPTY_QUESISENT', 18, 1, 18);
      END;
   synOPENDESENTPROOBJ: BEGIN
      STR_Extract(str, l, 'synOPENDESENTPROOBJ', 19, 1, 19);
      END;
   synDONP_PREPOPENADJPPROP: BEGIN
      STR_Extract(str, l, 'synDONP_PREPOPENADJPPROP', 24, 1, 24);
      END;
   synDONP_PREPOPENNPPROP: BEGIN
      STR_Extract(str, l, 'synDONP_PREPOPENNPPROP', 22, 1, 22);
      END;
   synELOPENINFSENT: BEGIN
      STR_Extract(str, l, 'synELOPENINFSENT', 16, 1, 16);
      END;
   synELQUESENTsubj: BEGIN
      STR_Extract(str, l, 'synELQUESENTsubj', 16, 1, 16);
      END;
   synEMPTY: BEGIN
      STR_Extract(str, l, 'synEMPTY', 8, 1, 8);
      END;
   synEMPTY_CLOSEDADJPPROP: BEGIN
      STR_Extract(str, l, 'synEMPTY_CLOSEDADJPPROP', 23, 1, 23);
      END;
   synEMPTY_CLOSEDNPPROP: BEGIN
      STR_Extract(str, l, 'synEMPTY_CLOSEDNPPROP', 21, 1, 21);
      END;
   synEMPTY_DONP: BEGIN
      STR_Extract(str, l, 'synEMPTY_DONP', 13, 1, 13);
      END;
   synEMPTY_MEASUREPHRASE: BEGIN
      STR_Extract(str, l, 'synEMPTY_MEASUREPHRASE', 22, 1, 22);
      END;
   synEMPTY_OPENINFSENT: BEGIN
      STR_Extract(str, l, 'synEMPTY_OPENINFSENT', 20, 1, 20);
      END;
   synEMPTY_OTHERCLOSEDPREPPPROP: BEGIN
      STR_Extract(str, l, 'synEMPTY_OTHERCLOSEDPREPPPROP', 29, 1, 29);
      END;
   synEMPTY_QSENT: BEGIN
      STR_Extract(str, l, 'synEMPTY_QSENT', 14, 1, 14);
      END;
   synEMPTY_QUESENTind: BEGIN
      STR_Extract(str, l, 'synEMPTY_QUESENTind', 19, 1, 19);
      END;
   synEMPTY_QUESENTsubj: BEGIN
      STR_Extract(str, l, 'synEMPTY_QUESENTsubj', 20, 1, 20);
      END;
   synnoVPargs: BEGIN
      STR_Extract(str, l, 'synnoVPargs', 11, 1, 11);
      END;
   synEMPTY_PREPOPENINFSENT: BEGIN
      STR_Extract(str, l, 'synEMPTY_PREPOPENINFSENT', 24, 1, 24);
      END;
   synnoADVPargs: BEGIN
      STR_Extract(str, l, 'synnoADVPargs', 13, 1, 13);
      END;
   synOPENGERSENT: BEGIN
      STR_Extract(str, l, 'synOPENGERSENT', 14, 1, 14);
      END;
   synLOCCLOSEDPREPPPROP: BEGIN
      STR_Extract(str, l, 'synLOCCLOSEDPREPPPROP', 21, 1, 21);
      END;
   synLOCOPENPREPPPROP: BEGIN
      STR_Extract(str, l, 'synLOCOPENPREPPPROP', 19, 1, 19);
      END;
   synMEASUREPHRASE: BEGIN
      STR_Extract(str, l, 'synMEASUREPHRASE', 16, 1, 16);
      END;
   synNP: BEGIN
      STR_Extract(str, l, 'synNP', 5, 1, 5);
      END;
   synOPENADJPPROP: BEGIN
      STR_Extract(str, l, 'synOPENADJPPROP', 15, 1, 15);
      END;
   synOPENADVPPROP: BEGIN
      STR_Extract(str, l, 'synOPENADVPPROP', 15, 1, 15);
      END;
   synOPENINFSENT: BEGIN
      STR_Extract(str, l, 'synOPENINFSENT', 14, 1, 14);
      END;
   synQUEOPENINFSENT: BEGIN
      STR_Extract(str, l, 'synQUEOPENINFSENT', 17, 1, 17);
      END;
   synOPENNPPROP: BEGIN
      STR_Extract(str, l, 'synOPENNPPROP', 13, 1, 13);
      END;
   synOTHERCLOSEDPREPPPROP: BEGIN
      STR_Extract(str, l, 'synOTHERCLOSEDPREPPPROP', 23, 1, 23);
      END;
   synPARANP_DONP: BEGIN
      STR_Extract(str, l, 'synPARANP_DONP', 14, 1, 14);
      END;
   synPREPCLOSEDADJPPROP: BEGIN
      STR_Extract(str, l, 'synPREPCLOSEDADJPPROP', 21, 1, 21);
      END;
   synPREPCLOSEDNPPROP: BEGIN
      STR_Extract(str, l, 'synPREPCLOSEDNPPROP', 19, 1, 19);
      END;
   synPREPNP: BEGIN
      STR_Extract(str, l, 'synPREPNP', 9, 1, 9);
      END;
   synPREPNP_PREPNP: BEGIN
      STR_Extract(str, l, 'synPREPNP_PREPNP', 16, 1, 16);
      END;
   synPREPNP_PREPOPENINFSENT: BEGIN
      STR_Extract(str, l, 'synPREPNP_PREPOPENINFSENT', 25, 1, 25);
      END;
   synPREPNP_QUESENTsubj: BEGIN
      STR_Extract(str, l, 'synPREPNP_QUESENTsubj', 21, 1, 21);
      END;
   synOTHEROPENPREPPPROP: BEGIN
      STR_Extract(str, l, 'synOTHEROPENPREPPPROP', 21, 1, 21);
      END;
   synPREPOPENNPPROP: BEGIN
      STR_Extract(str, l, 'synPREPOPENNPPROP', 17, 1, 17);
      END;
   synPREPOPENINFSENT: BEGIN
      STR_Extract(str, l, 'synPREPOPENINFSENT', 18, 1, 18);
      END;
   synPREPQSENT: BEGIN
      STR_Extract(str, l, 'synPREPQSENT', 12, 1, 12);
      END;
   synPREPQUESENTind: BEGIN
      STR_Extract(str, l, 'synPREPQUESENTind', 17, 1, 17);
      END;
   synPREPQUESENTsubj: BEGIN
      STR_Extract(str, l, 'synPREPQUESENTsubj', 18, 1, 18);
      END;
   synPROSENT: BEGIN
      STR_Extract(str, l, 'synPROSENT', 10, 1, 10);
      END;
   synQSENT: BEGIN
      STR_Extract(str, l, 'synQSENT', 8, 1, 8);
      END;
   synQUESENTind: BEGIN
      STR_Extract(str, l, 'synQUESENTind', 13, 1, 13);
      END;
   synQUESENTsubj: BEGIN
      STR_Extract(str, l, 'synQUESENTsubj', 14, 1, 14);
      END;
   synQUESISENT: BEGIN
      STR_Extract(str, l, 'synQUESISENT', 12, 1, 12);
      END;
   synLOCPREPP: BEGIN
      STR_Extract(str, l, 'synLOCPREPP', 11, 1, 11);
      END;
   synDONP_PREPQUESENTind: BEGIN
      STR_Extract(str, l, 'synDONP_PREPQUESENTind', 22, 1, 22);
      END;
   synDONP_PREPQUESENTsubj: BEGIN
      STR_Extract(str, l, 'synDONP_PREPQUESENTsubj', 23, 1, 23);
      END;
   synnoadjpargs: BEGIN
      STR_Extract(str, l, 'synnoadjpargs', 13, 1, 13);
      END;
   synDONP_DIREMPTY: BEGIN
      STR_Extract(str, l, 'synDONP_DIREMPTY', 16, 1, 16);
      END;
   synDONP_PREPOPENINFSENT: BEGIN
      STR_Extract(str, l, 'synDONP_PREPOPENINFSENT', 23, 1, 23);
      END;
   synEMPTY_CLOSEDINFSENT: BEGIN
      STR_Extract(str, l, 'synEMPTY_CLOSEDINFSENT', 22, 1, 22);
      END;
   synAEMPTY_DONP: BEGIN
      STR_Extract(str, l, 'synAEMPTY_DONP', 14, 1, 14);
      END;
   synAEMPTY_QUESENTind: BEGIN
      STR_Extract(str, l, 'synAEMPTY_QUESENTind', 20, 1, 20);
      END;
   synAEMPTY_QUESENTsubj: BEGIN
      STR_Extract(str, l, 'synAEMPTY_QUESENTsubj', 21, 1, 21);
      END;
   synAEMPTY_QSENT: BEGIN
      STR_Extract(str, l, 'synAEMPTY_QSENT', 15, 1, 15);
      END;
   synANP: BEGIN
      STR_Extract(str, l, 'synANP', 6, 1, 6);
      END;
   synLOCEMPTY: BEGIN
      STR_Extract(str, l, 'synLOCEMPTY', 11, 1, 11);
      END;
   synOPENVERBPPROP: BEGIN
      STR_Extract(str, l, 'synOPENVERBPPROP', 16, 1, 16);
      END;
   synPAPREPOPENINFSENT: BEGIN
      STR_Extract(str, l, 'synPAPREPOPENINFSENT', 20, 1, 20);
      END;
   synPAPREPQUESENTind: BEGIN
      STR_Extract(str, l, 'synPAPREPQUESENTind', 19, 1, 19);
      END;
   synPAPREPQUESENTsubj: BEGIN
      STR_Extract(str, l, 'synPAPREPQUESENTsubj', 20, 1, 20);
      END;
   synPAPREPQSENT: BEGIN
      STR_Extract(str, l, 'synPAPREPQSENT', 14, 1, 14);
      END;
   synPATHPREPP: BEGIN
      STR_Extract(str, l, 'synPATHPREPP', 12, 1, 12);
      END;
   synPOSTADJPREPNP: BEGIN
      STR_Extract(str, l, 'synPOSTADJPREPNP', 16, 1, 16);
      END;
   synPREPEMPTY: BEGIN
      STR_Extract(str, l, 'synPREPEMPTY', 12, 1, 12);
      END;
   synQUESENTind_LOCOPENPREPPPROP: BEGIN
      STR_Extract(str, l, 'synQUESENTind_LOCOPENPREPPPROP', 30, 1, 30);
      END;
   synPARANP: BEGIN
      STR_Extract(str, l, 'synPARANP', 9, 1, 9);
      END;
   synPARAEMPTY: BEGIN
      STR_Extract(str, l, 'synPARAEMPTY', 12, 1, 12);
      END;
   synOPENINFSENTPROOBJ: BEGIN
      STR_Extract(str, l, 'synOPENINFSENTPROOBJ', 20, 1, 20);
      END;
   synLOCPREPEMPTY: BEGIN
      STR_Extract(str, l, 'synLOCPREPEMPTY', 15, 1, 15);
      END;
   vpid1: BEGIN
      STR_Extract(str, l, 'vpid1', 5, 1, 5);
      END;
   vpid2: BEGIN
      STR_Extract(str, l, 'vpid2', 5, 1, 5);
      END;
   vpid3: BEGIN
      STR_Extract(str, l, 'vpid3', 5, 1, 5);
      END;
   vpid4: BEGIN
      STR_Extract(str, l, 'vpid4', 5, 1, 5);
      END;
   vpid5: BEGIN
      STR_Extract(str, l, 'vpid5', 5, 1, 5);
      END;
   vpid6: BEGIN
      STR_Extract(str, l, 'vpid6', 5, 1, 5);
      END;
   vpid7: BEGIN
      STR_Extract(str, l, 'vpid7', 5, 1, 5);
      END;
   vpid8: BEGIN
      STR_Extract(str, l, 'vpid8', 5, 1, 5);
      END;
   vpid9: BEGIN
      STR_Extract(str, l, 'vpid9', 5, 1, 5);
      END;
   vpid10: BEGIN
      STR_Extract(str, l, 'vpid10', 6, 1, 6);
      END;
   vpid11: BEGIN
      STR_Extract(str, l, 'vpid11', 6, 1, 6);
      END;
   vpid12: BEGIN
      STR_Extract(str, l, 'vpid12', 6, 1, 6);
      END;
   vpid13: BEGIN
      STR_Extract(str, l, 'vpid13', 6, 1, 6);
      END;
   vpid14: BEGIN
      STR_Extract(str, l, 'vpid14', 6, 1, 6);
      END;
   vpid15: BEGIN
      STR_Extract(str, l, 'vpid15', 6, 1, 6);
      END;
   vpid16: BEGIN
      STR_Extract(str, l, 'vpid16', 6, 1, 6);
      END;
   vpid17: BEGIN
      STR_Extract(str, l, 'vpid17', 6, 1, 6);
      END;
   vpid18: BEGIN
      STR_Extract(str, l, 'vpid18', 6, 1, 6);
      END;
   vpid19: BEGIN
      STR_Extract(str, l, 'vpid19', 6, 1, 6);
      END;
   vpid20: BEGIN
      STR_Extract(str, l, 'vpid20', 6, 1, 6);
      END;
   vpid21: BEGIN
      STR_Extract(str, l, 'vpid21', 6, 1, 6);
      END;
   vpid22: BEGIN
      STR_Extract(str, l, 'vpid22', 6, 1, 6);
      END;
   vpid23: BEGIN
      STR_Extract(str, l, 'vpid23', 6, 1, 6);
      END;
   vpid24: BEGIN
      STR_Extract(str, l, 'vpid24', 6, 1, 6);
      END;
   vpid25: BEGIN
      STR_Extract(str, l, 'vpid25', 6, 1, 6);
      END;
   vpid26: BEGIN
      STR_Extract(str, l, 'vpid26', 6, 1, 6);
      END;
   vpid27: BEGIN
      STR_Extract(str, l, 'vpid27', 6, 1, 6);
      END;
   vpid28: BEGIN
      STR_Extract(str, l, 'vpid28', 6, 1, 6);
      END;
   vpid29: BEGIN
      STR_Extract(str, l, 'vpid29', 6, 1, 6);
      END;
   vpid30: BEGIN
      STR_Extract(str, l, 'vpid30', 6, 1, 6);
      END;
   vpid31: BEGIN
      STR_Extract(str, l, 'vpid31', 6, 1, 6);
      END;
   vpid32: BEGIN
      STR_Extract(str, l, 'vpid32', 6, 1, 6);
      END;
   vpid33: BEGIN
      STR_Extract(str, l, 'vpid33', 6, 1, 6);
      END;
   vpid34: BEGIN
      STR_Extract(str, l, 'vpid34', 6, 1, 6);
      END;
   vpid35: BEGIN
      STR_Extract(str, l, 'vpid35', 6, 1, 6);
      END;
   vpid36: BEGIN
      STR_Extract(str, l, 'vpid36', 6, 1, 6);
      END;
   vpid37: BEGIN
      STR_Extract(str, l, 'vpid37', 6, 1, 6);
      END;
   vpid38: BEGIN
      STR_Extract(str, l, 'vpid38', 6, 1, 6);
      END;
   vpid39: BEGIN
      STR_Extract(str, l, 'vpid39', 6, 1, 6);
      END;
   vpid40: BEGIN
      STR_Extract(str, l, 'vpid40', 6, 1, 6);
      END;
   synCLAUSE: BEGIN
      STR_Extract(str, l, 'synCLAUSE', 9, 1, 9);
      END;
   synVERBPPROP: BEGIN
      STR_Extract(str, l, 'synVERBPPROP', 12, 1, 12);
      END;
   END;
END {LSTYPETOSTR_synpatterntype};


PROCEDURE LSTYPETOSTR_syntquanttype( 
         VAR str: STRING;
         VAR l: STR_Range;
         attr : LSDOMAINT_syntquanttype         );
BEGIN
   CASE attr OF 
   Aquant: BEGIN
      STR_Extract(str, l, 'Aquant', 6, 1, 6);
      END;
   Equant: BEGIN
      STR_Extract(str, l, 'Equant', 6, 1, 6);
      END;
   omegaquant: BEGIN
      STR_Extract(str, l, 'omegaquant', 10, 1, 10);
      END;
   END;
END {LSTYPETOSTR_syntquanttype};


PROCEDURE LSTYPETOSTR_thanascompltype( 
         VAR str: STRING;
         VAR l: STR_Range;
         attr : LSDOMAINT_thanascompltype         );
BEGIN
   CASE attr OF 
   omegacompl: BEGIN
      STR_Extract(str, l, 'omegacompl', 10, 1, 10);
      END;
   decompl: BEGIN
      STR_Extract(str, l, 'decompl', 7, 1, 7);
      END;
   quecompl: BEGIN
      STR_Extract(str, l, 'quecompl', 8, 1, 8);
      END;
   paracompl: BEGIN
      STR_Extract(str, l, 'paracompl', 9, 1, 9);
      END;
   comocompl: BEGIN
      STR_Extract(str, l, 'comocompl', 9, 1, 9);
      END;
   END;
END {LSTYPETOSTR_thanascompltype};


PROCEDURE LSTYPETOSTR_thetaadjtype( 
         VAR str: STRING;
         VAR l: STR_Range;
         attr : LSDOMAINT_thetaadjtype         );
BEGIN
   CASE attr OF 
   omegathetaadjp: BEGIN
      STR_Extract(str, l, 'omegathetaadjp', 14, 1, 14);
      END;
   adjp000: BEGIN
      STR_Extract(str, l, 'adjp000', 7, 1, 7);
      END;
   adjp100: BEGIN
      STR_Extract(str, l, 'adjp100', 7, 1, 7);
      END;
   adjp120: BEGIN
      STR_Extract(str, l, 'adjp120', 7, 1, 7);
      END;
   adjp210: BEGIN
      STR_Extract(str, l, 'adjp210', 7, 1, 7);
      END;
   adjp123: BEGIN
      STR_Extract(str, l, 'adjp123', 7, 1, 7);
      END;
   adjp132: BEGIN
      STR_Extract(str, l, 'adjp132', 7, 1, 7);
      END;
   adjp213: BEGIN
      STR_Extract(str, l, 'adjp213', 7, 1, 7);
      END;
   adjp231: BEGIN
      STR_Extract(str, l, 'adjp231', 7, 1, 7);
      END;
   adjp312: BEGIN
      STR_Extract(str, l, 'adjp312', 7, 1, 7);
      END;
   END;
END {LSTYPETOSTR_thetaadjtype};


PROCEDURE LSTYPETOSTR_thetaadvtype( 
         VAR str: STRING;
         VAR l: STR_Range;
         attr : LSDOMAINT_thetaadvtype         );
BEGIN
   CASE attr OF 
   omegathetaadv: BEGIN
      STR_Extract(str, l, 'omegathetaadv', 13, 1, 13);
      END;
   thetaadv100: BEGIN
      STR_Extract(str, l, 'thetaadv100', 11, 1, 11);
      END;
   thetaadv010: BEGIN
      STR_Extract(str, l, 'thetaadv010', 11, 1, 11);
      END;
   thetaadv120: BEGIN
      STR_Extract(str, l, 'thetaadv120', 11, 1, 11);
      END;
   END;
END {LSTYPETOSTR_thetaadvtype};


PROCEDURE LSTYPETOSTR_thetanptype( 
         VAR str: STRING;
         VAR l: STR_Range;
         attr : LSDOMAINT_thetanptype         );
BEGIN
   CASE attr OF 
   omegathetanp: BEGIN
      STR_Extract(str, l, 'omegathetanp', 12, 1, 12);
      END;
   thetanp0: BEGIN
      STR_Extract(str, l, 'thetanp0', 8, 1, 8);
      END;
   thetanp1: BEGIN
      STR_Extract(str, l, 'thetanp1', 8, 1, 8);
      END;
   thetanp2: BEGIN
      STR_Extract(str, l, 'thetanp2', 8, 1, 8);
      END;
   END;
END {LSTYPETOSTR_thetanptype};


PROCEDURE LSTYPETOSTR_thetapptype( 
         VAR str: STRING;
         VAR l: STR_Range;
         attr : LSDOMAINT_thetapptype         );
BEGIN
   CASE attr OF 
   omegathetapp: BEGIN
      STR_Extract(str, l, 'omegathetapp', 12, 1, 12);
      END;
   pp000: BEGIN
      STR_Extract(str, l, 'pp000', 5, 1, 5);
      END;
   pp100: BEGIN
      STR_Extract(str, l, 'pp100', 5, 1, 5);
      END;
   pp010: BEGIN
      STR_Extract(str, l, 'pp010', 5, 1, 5);
      END;
   pp120: BEGIN
      STR_Extract(str, l, 'pp120', 5, 1, 5);
      END;
   END;
END {LSTYPETOSTR_thetapptype};


PROCEDURE LSTYPETOSTR_thetavptype( 
         VAR str: STRING;
         VAR l: STR_Range;
         attr : LSDOMAINT_thetavptype         );
BEGIN
   CASE attr OF 
   omegathetavp: BEGIN
      STR_Extract(str, l, 'omegathetavp', 12, 1, 12);
      END;
   vp000: BEGIN
      STR_Extract(str, l, 'vp000', 5, 1, 5);
      END;
   vp100: BEGIN
      STR_Extract(str, l, 'vp100', 5, 1, 5);
      END;
   vp010: BEGIN
      STR_Extract(str, l, 'vp010', 5, 1, 5);
      END;
   vp120: BEGIN
      STR_Extract(str, l, 'vp120', 5, 1, 5);
      END;
   vp012: BEGIN
      STR_Extract(str, l, 'vp012', 5, 1, 5);
      END;
   vp021: BEGIN
      STR_Extract(str, l, 'vp021', 5, 1, 5);
      END;
   vp210: BEGIN
      STR_Extract(str, l, 'vp210', 5, 1, 5);
      END;
   vp123: BEGIN
      STR_Extract(str, l, 'vp123', 5, 1, 5);
      END;
   vp132: BEGIN
      STR_Extract(str, l, 'vp132', 5, 1, 5);
      END;
   vp213: BEGIN
      STR_Extract(str, l, 'vp213', 5, 1, 5);
      END;
   vp231: BEGIN
      STR_Extract(str, l, 'vp231', 5, 1, 5);
      END;
   vp312: BEGIN
      STR_Extract(str, l, 'vp312', 5, 1, 5);
      END;
   vp321: BEGIN
      STR_Extract(str, l, 'vp321', 5, 1, 5);
      END;
   thetavpAUX: BEGIN
      STR_Extract(str, l, 'thetavpAUX', 10, 1, 10);
      END;
   END;
END {LSTYPETOSTR_thetavptype};


PROCEDURE LSTYPETOSTR_tiempotype( 
         VAR str: STRING;
         VAR l: STR_Range;
         attr : LSDOMAINT_tiempotype         );
BEGIN
   CASE attr OF 
   Presente: BEGIN
      STR_Extract(str, l, 'Presente', 8, 1, 8);
      END;
   Pasado: BEGIN
      STR_Extract(str, l, 'Pasado', 6, 1, 6);
      END;
   Futuro: BEGIN
      STR_Extract(str, l, 'Futuro', 6, 1, 6);
      END;
   omegatiempo: BEGIN
      STR_Extract(str, l, 'omegatiempo', 11, 1, 11);
      END;
   END;
END {LSTYPETOSTR_tiempotype};


PROCEDURE LSTYPETOSTR_timeadvclasstype( 
         VAR str: STRING;
         VAR l: STR_Range;
         attr : LSDOMAINT_timeadvclasstype         );
BEGIN
   CASE attr OF 
   duration: BEGIN
      STR_Extract(str, l, 'duration', 8, 1, 8);
      END;
   reference: BEGIN
      STR_Extract(str, l, 'reference', 9, 1, 9);
      END;
   frequential: BEGIN
      STR_Extract(str, l, 'frequential', 11, 1, 11);
      END;
   omegaTimeAdvClass: BEGIN
      STR_Extract(str, l, 'omegaTimeAdvClass', 17, 1, 17);
      END;
   END;
END {LSTYPETOSTR_timeadvclasstype};


PROCEDURE LSTYPETOSTR_clusteringtype( 
         VAR str: STRING;
         VAR l: STR_Range;
         attr : LSDOMAINT_clusteringtype         );
BEGIN
   CASE attr OF 
   NoClustering: BEGIN
      STR_Extract(str, l, 'NoClustering', 12, 1, 12);
      END;
   Restructuring: BEGIN
      STR_Extract(str, l, 'Restructuring', 13, 1, 13);
      END;
   OptVR: BEGIN
      STR_Extract(str, l, 'OptVR', 5, 1, 5);
      END;
   OblVR: BEGIN
      STR_Extract(str, l, 'OblVR', 5, 1, 5);
      END;
   END;
END {LSTYPETOSTR_clusteringtype};


PROCEDURE LSTYPETOSTR_verbsubctype( 
         VAR str: STRING;
         VAR l: STR_Range;
         attr : LSDOMAINT_verbsubctype         );
BEGIN
   CASE attr OF 
   Mainverb: BEGIN
      STR_Extract(str, l, 'Mainverb', 8, 1, 8);
      END;
   haberaux: BEGIN
      STR_Extract(str, l, 'haberaux', 8, 1, 8);
      END;
   estaraux: BEGIN
      STR_Extract(str, l, 'estaraux', 8, 1, 8);
      END;
   seraux: BEGIN
      STR_Extract(str, l, 'seraux', 6, 1, 6);
      END;
   Modalverb: BEGIN
      STR_Extract(str, l, 'Modalverb', 9, 1, 9);
      END;
   END;
END {LSTYPETOSTR_verbsubctype};


PROCEDURE LSTYPETOSTR_voicetype( 
         VAR str: STRING;
         VAR l: STR_Range;
         attr : LSDOMAINT_voicetype         );
BEGIN
   CASE attr OF 
   Active: BEGIN
      STR_Extract(str, l, 'Active', 6, 1, 6);
      END;
   Passive: BEGIN
      STR_Extract(str, l, 'Passive', 7, 1, 7);
      END;
   SEactive: BEGIN
      STR_Extract(str, l, 'SEactive', 8, 1, 8);
      END;
   SEpassive: BEGIN
      STR_Extract(str, l, 'SEpassive', 9, 1, 9);
      END;
   Omegavoice: BEGIN
      STR_Extract(str, l, 'Omegavoice', 10, 1, 10);
      END;
   END;
END {LSTYPETOSTR_voicetype};


PROCEDURE LSTYPETOSTR_vstatustype( 
         VAR str: STRING;
         VAR l: STR_Range;
         attr : LSDOMAINT_vstatustype         );
BEGIN
   CASE attr OF 
   bareV: BEGIN
      STR_Extract(str, l, 'bareV', 5, 1, 5);
      END;
   VV: BEGIN
      STR_Extract(str, l, 'VV', 2, 1, 2);
      END;
   AuxV: BEGIN
      STR_Extract(str, l, 'AuxV', 4, 1, 4);
      END;
   prepV: BEGIN
      STR_Extract(str, l, 'prepV', 5, 1, 5);
      END;
   END;
END {LSTYPETOSTR_vstatustype};


PROCEDURE LSTYPETOSTR_xpmoodtype( 
         VAR str: STRING;
         VAR l: STR_Range;
         attr : LSDOMAINT_xpmoodtype         );
BEGIN
   CASE attr OF 
   wh: BEGIN
      STR_Extract(str, l, 'wh', 2, 1, 2);
      END;
   declxpmood: BEGIN
      STR_Extract(str, l, 'declxpmood', 10, 1, 10);
      END;
   relativexpmood: BEGIN
      STR_Extract(str, l, 'relativexpmood', 14, 1, 14);
      END;
   topicxpmood: BEGIN
      STR_Extract(str, l, 'topicxpmood', 11, 1, 11);
      END;
   ProObjxpmood: BEGIN
      STR_Extract(str, l, 'ProObjxpmood', 12, 1, 12);
      END;
   END;
END {LSTYPETOSTR_xpmoodtype};



PROCEDURE LSTYPETOSTR_personatype( 
         VAR str: STRING;
         VAR l: STR_Range;
         attr : LSDOMAINT_personatype         );
BEGIN
   STR_IntegerToStr(attr, str, l);
END {LSTYPETOSTR_personatype};


PROCEDURE LSTYPETOSTR_valuetype( 
         VAR str: STRING;
         VAR l: STR_Range;
         attr : LSDOMAINT_valuetype         );
BEGIN
   STR_IntegerToStr(attr, str, l);
END {LSTYPETOSTR_valuetype};



