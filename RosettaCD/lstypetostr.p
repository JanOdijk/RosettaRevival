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
   sPositive: BEGIN
      STR_Extract(str, l, 'sPositive', 9, 1, 9);
      END;
   comparative: BEGIN
      STR_Extract(str, l, 'comparative', 11, 1, 11);
      END;
   sComparative: BEGIN
      STR_Extract(str, l, 'sComparative', 12, 1, 12);
      END;
   superlative: BEGIN
      STR_Extract(str, l, 'superlative', 11, 1, 11);
      END;
   allerSuperlative: BEGIN
      STR_Extract(str, l, 'allerSuperlative', 16, 1, 16);
      END;
   END;
END {LSTYPETOSTR_adjadvformtype};


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
   voorsubjectiveadj: BEGIN
      STR_Extract(str, l, 'voorsubjectiveadj', 17, 1, 17);
      END;
   substanceadj: BEGIN
      STR_Extract(str, l, 'substanceadj', 12, 1, 12);
      END;
   anderadj: BEGIN
      STR_Extract(str, l, 'anderadj', 8, 1, 8);
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
   causadv: BEGIN
      STR_Extract(str, l, 'causadv', 7, 1, 7);
      END;
   PREPPAdv: BEGIN
      STR_Extract(str, l, 'PREPPAdv', 8, 1, 8);
      END;
   NumAdv: BEGIN
      STR_Extract(str, l, 'NumAdv', 6, 1, 6);
      END;
   OtherAdv: BEGIN
      STR_Extract(str, l, 'OtherAdv', 8, 1, 8);
      END;
   END;
END {LSTYPETOSTR_advsubctype};


PROCEDURE LSTYPETOSTR_affixtype( 
         VAR str: STRING;
         VAR l: STR_Range;
         attr : LSDOMAINT_affixtype         );
BEGIN
   CASE attr OF 
   partaffix: BEGIN
      STR_Extract(str, l, 'partaffix', 9, 1, 9);
      END;
   exaffix: BEGIN
      STR_Extract(str, l, 'exaffix', 7, 1, 7);
      END;
   hyperaffix: BEGIN
      STR_Extract(str, l, 'hyperaffix', 10, 1, 10);
      END;
   viceaffix: BEGIN
      STR_Extract(str, l, 'viceaffix', 9, 1, 9);
      END;
   antiaffix: BEGIN
      STR_Extract(str, l, 'antiaffix', 9, 1, 9);
      END;
   proaffix: BEGIN
      STR_Extract(str, l, 'proaffix', 8, 1, 8);
      END;
   onaffix: BEGIN
      STR_Extract(str, l, 'onaffix', 7, 1, 7);
      END;
   achtigaffix: BEGIN
      STR_Extract(str, l, 'achtigaffix', 11, 1, 11);
      END;
   dimaffix: BEGIN
      STR_Extract(str, l, 'dimaffix', 8, 1, 8);
      END;
   noaffix: BEGIN
      STR_Extract(str, l, 'noaffix', 7, 1, 7);
      END;
   advaffix: BEGIN
      STR_Extract(str, l, 'advaffix', 8, 1, 8);
      END;
   ordaffix: BEGIN
      STR_Extract(str, l, 'ordaffix', 8, 1, 8);
      END;
   END;
END {LSTYPETOSTR_affixtype};


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


PROCEDURE LSTYPETOSTR_animatetype( 
         VAR str: STRING;
         VAR l: STR_Range;
         attr : LSDOMAINT_animatetype         );
BEGIN
   CASE attr OF 
   yesanimate: BEGIN
      STR_Extract(str, l, 'yesanimate', 10, 1, 10);
      END;
   noanimate: BEGIN
      STR_Extract(str, l, 'noanimate', 9, 1, 9);
      END;
   omegaAnimate: BEGIN
      STR_Extract(str, l, 'omegaAnimate', 12, 1, 12);
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


PROCEDURE LSTYPETOSTR_aspecttype( 
         VAR str: STRING;
         VAR l: STR_Range;
         attr : LSDOMAINT_aspecttype         );
BEGIN
   CASE attr OF 
   habitual: BEGIN
      STR_Extract(str, l, 'habitual', 8, 1, 8);
      END;
   imperfective: BEGIN
      STR_Extract(str, l, 'imperfective', 12, 1, 12);
      END;
   perfective: BEGIN
      STR_Extract(str, l, 'perfective', 10, 1, 10);
      END;
   omegaAspect: BEGIN
      STR_Extract(str, l, 'omegaAspect', 11, 1, 11);
      END;
   END;
END {LSTYPETOSTR_aspecttype};


PROCEDURE LSTYPETOSTR_casetype( 
         VAR str: STRING;
         VAR l: STR_Range;
         attr : LSDOMAINT_casetype         );
BEGIN
   CASE attr OF 
   nominative: BEGIN
      STR_Extract(str, l, 'nominative', 10, 1, 10);
      END;
   dative: BEGIN
      STR_Extract(str, l, 'dative', 6, 1, 6);
      END;
   accusative: BEGIN
      STR_Extract(str, l, 'accusative', 10, 1, 10);
      END;
   genitive: BEGIN
      STR_Extract(str, l, 'genitive', 8, 1, 8);
      END;
   Rcase: BEGIN
      STR_Extract(str, l, 'Rcase', 5, 1, 5);
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


PROCEDURE LSTYPETOSTR_comparativetype( 
         VAR str: STRING;
         VAR l: STR_Range;
         attr : LSDOMAINT_comparativetype         );
BEGIN
   CASE attr OF 
   erComp: BEGIN
      STR_Extract(str, l, 'erComp', 6, 1, 6);
      END;
   erIrregComp: BEGIN
      STR_Extract(str, l, 'erIrregComp', 11, 1, 11);
      END;
   meerComp: BEGIN
      STR_Extract(str, l, 'meerComp', 8, 1, 8);
      END;
   NoComp: BEGIN
      STR_Extract(str, l, 'NoComp', 6, 1, 6);
      END;
   END;
END {LSTYPETOSTR_comparativetype};


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
   Somtec: BEGIN
      STR_Extract(str, l, 'Somtec', 6, 1, 6);
      END;
   Sotec: BEGIN
      STR_Extract(str, l, 'Sotec', 5, 1, 5);
      END;
   Sctec: BEGIN
      STR_Extract(str, l, 'Sctec', 5, 1, 5);
      END;
   Sprpc: BEGIN
      STR_Extract(str, l, 'Sprpc', 5, 1, 5);
      END;
   Spapc: BEGIN
      STR_Extract(str, l, 'Spapc', 5, 1, 5);
      END;
   Scond: BEGIN
      STR_Extract(str, l, 'Scond', 5, 1, 5);
      END;
   Slaten: BEGIN
      STR_Extract(str, l, 'Slaten', 6, 1, 6);
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
   menigdef: BEGIN
      STR_Extract(str, l, 'menigdef', 8, 1, 8);
      END;
   omegadef: BEGIN
      STR_Extract(str, l, 'omegadef', 8, 1, 8);
      END;
   END;
END {LSTYPETOSTR_deftype};


PROCEDURE LSTYPETOSTR_deixistype( 
         VAR str: STRING;
         VAR l: STR_Range;
         attr : LSDOMAINT_deixistype         );
BEGIN
   CASE attr OF 
   omegadeixis: BEGIN
      STR_Extract(str, l, 'omegadeixis', 11, 1, 11);
      END;
   presentdeixis: BEGIN
      STR_Extract(str, l, 'presentdeixis', 13, 1, 13);
      END;
   pastdeixis: BEGIN
      STR_Extract(str, l, 'pastdeixis', 10, 1, 10);
      END;
   futuredeixis: BEGIN
      STR_Extract(str, l, 'futuredeixis', 12, 1, 12);
      END;
   END;
END {LSTYPETOSTR_deixistype};


PROCEDURE LSTYPETOSTR_dimformtype( 
         VAR str: STRING;
         VAR l: STR_Range;
         attr : LSDOMAINT_dimformtype         );
BEGIN
   CASE attr OF 
   jeDim: BEGIN
      STR_Extract(str, l, 'jeDim', 5, 1, 5);
      END;
   etjeDim: BEGIN
      STR_Extract(str, l, 'etjeDim', 7, 1, 7);
      END;
   irregDim: BEGIN
      STR_Extract(str, l, 'irregDim', 8, 1, 8);
      END;
   dimletterword: BEGIN
      STR_Extract(str, l, 'dimletterword', 13, 1, 13);
      END;
   noDim: BEGIN
      STR_Extract(str, l, 'noDim', 5, 1, 5);
      END;
   END;
END {LSTYPETOSTR_dimformtype};


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


PROCEDURE LSTYPETOSTR_eformationtype( 
         VAR str: STRING;
         VAR l: STR_Range;
         attr : LSDOMAINT_eformationtype         );
BEGIN
   CASE attr OF 
   NoFormation: BEGIN
      STR_Extract(str, l, 'NoFormation', 11, 1, 11);
      END;
   RegEFormation: BEGIN
      STR_Extract(str, l, 'RegEFormation', 13, 1, 13);
      END;
   IrregEformation: BEGIN
      STR_Extract(str, l, 'IrregEformation', 15, 1, 15);
      END;
   END;
END {LSTYPETOSTR_eformationtype};


PROCEDURE LSTYPETOSTR_enominalisedtype( 
         VAR str: STRING;
         VAR l: STR_Range;
         attr : LSDOMAINT_enominalisedtype         );
BEGIN
   CASE attr OF 
   noNominalised: BEGIN
      STR_Extract(str, l, 'noNominalised', 13, 1, 13);
      END;
   regeNominalised: BEGIN
      STR_Extract(str, l, 'regeNominalised', 15, 1, 15);
      END;
   IrregeNominalised: BEGIN
      STR_Extract(str, l, 'IrregeNominalised', 17, 1, 17);
      END;
   END;
END {LSTYPETOSTR_enominalisedtype};


PROCEDURE LSTYPETOSTR_eorenformtype( 
         VAR str: STRING;
         VAR l: STR_Range;
         attr : LSDOMAINT_eorenformtype         );
BEGIN
   CASE attr OF 
   NoForm: BEGIN
      STR_Extract(str, l, 'NoForm', 6, 1, 6);
      END;
   eForm: BEGIN
      STR_Extract(str, l, 'eForm', 5, 1, 5);
      END;
   enForm: BEGIN
      STR_Extract(str, l, 'enForm', 6, 1, 6);
      END;
   omegaform: BEGIN
      STR_Extract(str, l, 'omegaform', 9, 1, 9);
      END;
   END;
END {LSTYPETOSTR_eorenformtype};


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


PROCEDURE LSTYPETOSTR_gelievetype( 
         VAR str: STRING;
         VAR l: STR_Range;
         attr : LSDOMAINT_gelievetype         );
BEGIN
   CASE attr OF 
   gelieve: BEGIN
      STR_Extract(str, l, 'gelieve', 7, 1, 7);
      END;
   ugelieve: BEGIN
      STR_Extract(str, l, 'ugelieve', 8, 1, 8);
      END;
   END;
END {LSTYPETOSTR_gelievetype};


PROCEDURE LSTYPETOSTR_gendertype( 
         VAR str: STRING;
         VAR l: STR_Range;
         attr : LSDOMAINT_gendertype         );
BEGIN
   CASE attr OF 
   mascgender: BEGIN
      STR_Extract(str, l, 'mascgender', 10, 1, 10);
      END;
   femgender: BEGIN
      STR_Extract(str, l, 'femgender', 9, 1, 9);
      END;
   neutgender: BEGIN
      STR_Extract(str, l, 'neutgender', 10, 1, 10);
      END;
   omegagender: BEGIN
      STR_Extract(str, l, 'omegagender', 11, 1, 11);
      END;
   END;
END {LSTYPETOSTR_gendertype};


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


PROCEDURE LSTYPETOSTR_inftype( 
         VAR str: STRING;
         VAR l: STR_Range;
         attr : LSDOMAINT_inftype         );
BEGIN
   CASE attr OF 
   inf: BEGIN
      STR_Extract(str, l, 'inf', 3, 1, 3);
      END;
   teinf: BEGIN
      STR_Extract(str, l, 'teinf', 5, 1, 5);
      END;
   omteinf: BEGIN
      STR_Extract(str, l, 'omteinf', 7, 1, 7);
      END;
   omegainf: BEGIN
      STR_Extract(str, l, 'omegainf', 8, 1, 8);
      END;
   END;
END {LSTYPETOSTR_inftype};


PROCEDURE LSTYPETOSTR_ipptype( 
         VAR str: STRING;
         VAR l: STR_Range;
         attr : LSDOMAINT_ipptype         );
BEGIN
   CASE attr OF 
   NOIPP: BEGIN
      STR_Extract(str, l, 'NOIPP', 5, 1, 5);
      END;
   optionalIPP: BEGIN
      STR_Extract(str, l, 'optionalIPP', 11, 1, 11);
      END;
   obligatoryIPP: BEGIN
      STR_Extract(str, l, 'obligatoryIPP', 13, 1, 13);
      END;
   END;
END {LSTYPETOSTR_ipptype};


PROCEDURE LSTYPETOSTR_kindstype( 
         VAR str: STRING;
         VAR l: STR_Range;
         attr : LSDOMAINT_kindstype         );
BEGIN
   CASE attr OF 
   Xk: BEGIN
      STR_Extract(str, l, 'Xk', 2, 1, 2);
      END;
   Lk: BEGIN
      STR_Extract(str, l, 'Lk', 2, 1, 2);
      END;
   Qk: BEGIN
      STR_Extract(str, l, 'Qk', 2, 1, 2);
      END;
   Pk: BEGIN
      STR_Extract(str, l, 'Pk', 2, 1, 2);
      END;
   XLk: BEGIN
      STR_Extract(str, l, 'XLk', 3, 1, 3);
      END;
   XQk: BEGIN
      STR_Extract(str, l, 'XQk', 3, 1, 3);
      END;
   XPk: BEGIN
      STR_Extract(str, l, 'XPk', 3, 1, 3);
      END;
   LQk: BEGIN
      STR_Extract(str, l, 'LQk', 3, 1, 3);
      END;
   QPk: BEGIN
      STR_Extract(str, l, 'QPk', 3, 1, 3);
      END;
   XLQk: BEGIN
      STR_Extract(str, l, 'XLQk', 4, 1, 4);
      END;
   XPQk: BEGIN
      STR_Extract(str, l, 'XPQk', 4, 1, 4);
      END;
   END;
END {LSTYPETOSTR_kindstype};


PROCEDURE LSTYPETOSTR_modustype( 
         VAR str: STRING;
         VAR l: STR_Range;
         attr : LSDOMAINT_modustype         );
BEGIN
   CASE attr OF 
   indicative: BEGIN
      STR_Extract(str, l, 'indicative', 10, 1, 10);
      END;
   subjunctive: BEGIN
      STR_Extract(str, l, 'subjunctive', 11, 1, 11);
      END;
   imperative: BEGIN
      STR_Extract(str, l, 'imperative', 10, 1, 10);
      END;
   infinitive: BEGIN
      STR_Extract(str, l, 'infinitive', 10, 1, 10);
      END;
   prespart: BEGIN
      STR_Extract(str, l, 'prespart', 8, 1, 8);
      END;
   pastpart: BEGIN
      STR_Extract(str, l, 'pastpart', 8, 1, 8);
      END;
   omegamodus: BEGIN
      STR_Extract(str, l, 'omegamodus', 10, 1, 10);
      END;
   END;
END {LSTYPETOSTR_modustype};


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
   latenmood: BEGIN
      STR_Extract(str, l, 'latenmood', 9, 1, 9);
      END;
   Relative: BEGIN
      STR_Extract(str, l, 'Relative', 8, 1, 8);
      END;
   Anterelative: BEGIN
      STR_Extract(str, l, 'Anterelative', 12, 1, 12);
      END;
   WHmod: BEGIN
      STR_Extract(str, l, 'WHmod', 5, 1, 5);
      END;
   Conditional: BEGIN
      STR_Extract(str, l, 'Conditional', 11, 1, 11);
      END;
   proobjmod: BEGIN
      STR_Extract(str, l, 'proobjmod', 9, 1, 9);
      END;
   omegamood: BEGIN
      STR_Extract(str, l, 'omegamood', 9, 1, 9);
      END;
   END;
END {LSTYPETOSTR_moodtype};


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
   plurunitnoun: BEGIN
      STR_Extract(str, l, 'plurunitnoun', 12, 1, 12);
      END;
   abstractnoun: BEGIN
      STR_Extract(str, l, 'abstractnoun', 12, 1, 12);
      END;
   monthnoun: BEGIN
      STR_Extract(str, l, 'monthnoun', 9, 1, 9);
      END;
   clocktimenoun: BEGIN
      STR_Extract(str, l, 'clocktimenoun', 13, 1, 13);
      END;
   daynoun: BEGIN
      STR_Extract(str, l, 'daynoun', 7, 1, 7);
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
   locationnoun: BEGIN
      STR_Extract(str, l, 'locationnoun', 12, 1, 12);
      END;
   othernoun: BEGIN
      STR_Extract(str, l, 'othernoun', 9, 1, 9);
      END;
   END;
END {LSTYPETOSTR_nounsubctype};


PROCEDURE LSTYPETOSTR_npheadtype( 
         VAR str: STRING;
         VAR l: STR_Range;
         attr : LSDOMAINT_npheadtype         );
BEGIN
   CASE attr OF 
   menNP: BEGIN
      STR_Extract(str, l, 'menNP', 5, 1, 5);
      END;
   datNP: BEGIN
      STR_Extract(str, l, 'datNP', 5, 1, 5);
      END;
   ditNP: BEGIN
      STR_Extract(str, l, 'ditNP', 5, 1, 5);
      END;
   dieNP: BEGIN
      STR_Extract(str, l, 'dieNP', 5, 1, 5);
      END;
   zichzelfNP: BEGIN
      STR_Extract(str, l, 'zichzelfNP', 10, 1, 10);
      END;
   jegenNP: BEGIN
      STR_Extract(str, l, 'jegenNP', 7, 1, 7);
      END;
   hetNP: BEGIN
      STR_Extract(str, l, 'hetNP', 5, 1, 5);
      END;
   watwhproNP: BEGIN
      STR_Extract(str, l, 'watwhproNP', 10, 1, 10);
      END;
   watindefproNP: BEGIN
      STR_Extract(str, l, 'watindefproNP', 13, 1, 13);
      END;
   persproNP: BEGIN
      STR_Extract(str, l, 'persproNP', 9, 1, 9);
      END;
   reducedpersproNP: BEGIN
      STR_Extract(str, l, 'reducedpersproNP', 16, 1, 16);
      END;
   ecNP: BEGIN
      STR_Extract(str, l, 'ecNP', 4, 1, 4);
      END;
   otherNP: BEGIN
      STR_Extract(str, l, 'otherNP', 7, 1, 7);
      END;
   zegenNP: BEGIN
      STR_Extract(str, l, 'zegenNP', 7, 1, 7);
      END;
   enNP: BEGIN
      STR_Extract(str, l, 'enNP', 4, 1, 4);
      END;
   enOKNP: BEGIN
      STR_Extract(str, l, 'enOKNP', 6, 1, 6);
      END;
   allesNP: BEGIN
      STR_Extract(str, l, 'allesNP', 7, 1, 7);
      END;
   ietsNP: BEGIN
      STR_Extract(str, l, 'ietsNP', 6, 1, 6);
      END;
   elkaarNP: BEGIN
      STR_Extract(str, l, 'elkaarNP', 8, 1, 8);
      END;
   cardNP: BEGIN
      STR_Extract(str, l, 'cardNP', 6, 1, 6);
      END;
   END;
END {LSTYPETOSTR_npheadtype};


PROCEDURE LSTYPETOSTR_numbertype( 
         VAR str: STRING;
         VAR l: STR_Range;
         attr : LSDOMAINT_numbertype         );
BEGIN
   CASE attr OF 
   singular: BEGIN
      STR_Extract(str, l, 'singular', 8, 1, 8);
      END;
   plural: BEGIN
      STR_Extract(str, l, 'plural', 6, 1, 6);
      END;
   omeganumber: BEGIN
      STR_Extract(str, l, 'omeganumber', 11, 1, 11);
      END;
   END;
END {LSTYPETOSTR_numbertype};


PROCEDURE LSTYPETOSTR_perfauxtype( 
         VAR str: STRING;
         VAR l: STR_Range;
         attr : LSDOMAINT_perfauxtype         );
BEGIN
   CASE attr OF 
   isaux: BEGIN
      STR_Extract(str, l, 'isaux', 5, 1, 5);
      END;
   hebaux: BEGIN
      STR_Extract(str, l, 'hebaux', 6, 1, 6);
      END;
   END;
END {LSTYPETOSTR_perfauxtype};


PROCEDURE LSTYPETOSTR_pluralformtype( 
         VAR str: STRING;
         VAR l: STR_Range;
         attr : LSDOMAINT_pluralformtype         );
BEGIN
   CASE attr OF 
   enPlural: BEGIN
      STR_Extract(str, l, 'enPlural', 8, 1, 8);
      END;
   sPlural: BEGIN
      STR_Extract(str, l, 'sPlural', 7, 1, 7);
      END;
   aTOaaPlural: BEGIN
      STR_Extract(str, l, 'aTOaaPlural', 11, 1, 11);
      END;
   aTOeePlural: BEGIN
      STR_Extract(str, l, 'aTOeePlural', 11, 1, 11);
      END;
   eTOeePlural: BEGIN
      STR_Extract(str, l, 'eTOeePlural', 11, 1, 11);
      END;
   eiTOeePlural: BEGIN
      STR_Extract(str, l, 'eiTOeePlural', 12, 1, 12);
      END;
   iTOeePlural: BEGIN
      STR_Extract(str, l, 'iTOeePlural', 11, 1, 11);
      END;
   oTOooPlural: BEGIN
      STR_Extract(str, l, 'oTOooPlural', 11, 1, 11);
      END;
   erenPlural: BEGIN
      STR_Extract(str, l, 'erenPlural', 10, 1, 10);
      END;
   ienPlural: BEGIN
      STR_Extract(str, l, 'ienPlural', 9, 1, 9);
      END;
   jenPlural: BEGIN
      STR_Extract(str, l, 'jenPlural', 9, 1, 9);
      END;
   denPlural: BEGIN
      STR_Extract(str, l, 'denPlural', 9, 1, 9);
      END;
   nenPlural: BEGIN
      STR_Extract(str, l, 'nenPlural', 9, 1, 9);
      END;
   ieAccentPlural: BEGIN
      STR_Extract(str, l, 'ieAccentPlural', 14, 1, 14);
      END;
   luiPlural: BEGIN
      STR_Extract(str, l, 'luiPlural', 9, 1, 9);
      END;
   liedenPlural: BEGIN
      STR_Extract(str, l, 'liedenPlural', 12, 1, 12);
      END;
   LatPlural: BEGIN
      STR_Extract(str, l, 'LatPlural', 9, 1, 9);
      END;
   enIrregPlural: BEGIN
      STR_Extract(str, l, 'enIrregPlural', 13, 1, 13);
      END;
   sIrregPlural: BEGIN
      STR_Extract(str, l, 'sIrregPlural', 12, 1, 12);
      END;
   LatIrregPlural: BEGIN
      STR_Extract(str, l, 'LatIrregPlural', 14, 1, 14);
      END;
   NoPlural: BEGIN
      STR_Extract(str, l, 'NoPlural', 8, 1, 8);
      END;
   OnlyPlural: BEGIN
      STR_Extract(str, l, 'OnlyPlural', 10, 1, 10);
      END;
   enOSLPlural: BEGIN
      STR_Extract(str, l, 'enOSLPlural', 11, 1, 11);
      END;
   enATOePlural: BEGIN
      STR_Extract(str, l, 'enATOePlural', 12, 1, 12);
      END;
   hydTOhedenPlural: BEGIN
      STR_Extract(str, l, 'hydTOhedenPlural', 16, 1, 16);
      END;
   enITOePlural: BEGIN
      STR_Extract(str, l, 'enITOePlural', 12, 1, 12);
      END;
   END;
END {LSTYPETOSTR_pluralformtype};


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


PROCEDURE LSTYPETOSTR_postformtype( 
         VAR str: STRING;
         VAR l: STR_Range;
         attr : LSDOMAINT_postformtype         );
BEGIN
   CASE attr OF 
   pre: BEGIN
      STR_Extract(str, l, 'pre', 3, 1, 3);
      END;
   post: BEGIN
      STR_Extract(str, l, 'post', 4, 1, 4);
      END;
   both: BEGIN
      STR_Extract(str, l, 'both', 4, 1, 4);
      END;
   END;
END {LSTYPETOSTR_postformtype};


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
   doorby: BEGIN
      STR_Extract(str, l, 'doorby', 6, 1, 6);
      END;
   aan: BEGIN
      STR_Extract(str, l, 'aan', 3, 1, 3);
      END;
   voor: BEGIN
      STR_Extract(str, l, 'voor', 4, 1, 4);
      END;
   caus: BEGIN
      STR_Extract(str, l, 'caus', 4, 1, 4);
      END;
   restprep: BEGIN
      STR_Extract(str, l, 'restprep', 8, 1, 8);
      END;
   other: BEGIN
      STR_Extract(str, l, 'other', 5, 1, 5);
      END;
   END;
END {LSTYPETOSTR_prepsubctype};


PROCEDURE LSTYPETOSTR_preptypetype( 
         VAR str: STRING;
         VAR l: STR_Range;
         attr : LSDOMAINT_preptypetype         );
BEGIN
   CASE attr OF 
   normalprep: BEGIN
      STR_Extract(str, l, 'normalprep', 10, 1, 10);
      END;
   splitprep: BEGIN
      STR_Extract(str, l, 'splitprep', 9, 1, 9);
      END;
   postprep: BEGIN
      STR_Extract(str, l, 'postprep', 8, 1, 8);
      END;
   END;
END {LSTYPETOSTR_preptypetype};


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
   reciprocal: BEGIN
      STR_Extract(str, l, 'reciprocal', 10, 1, 10);
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


PROCEDURE LSTYPETOSTR_sextype( 
         VAR str: STRING;
         VAR l: STR_Range;
         attr : LSDOMAINT_sextype         );
BEGIN
   CASE attr OF 
   masculine: BEGIN
      STR_Extract(str, l, 'masculine', 9, 1, 9);
      END;
   feminine: BEGIN
      STR_Extract(str, l, 'feminine', 8, 1, 8);
      END;
   END;
END {LSTYPETOSTR_sextype};


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


PROCEDURE LSTYPETOSTR_superlativetype( 
         VAR str: STRING;
         VAR l: STR_Range;
         attr : LSDOMAINT_superlativetype         );
BEGIN
   CASE attr OF 
   stSup: BEGIN
      STR_Extract(str, l, 'stSup', 5, 1, 5);
      END;
   stIrregSup: BEGIN
      STR_Extract(str, l, 'stIrregSup', 10, 1, 10);
      END;
   allerSup: BEGIN
      STR_Extract(str, l, 'allerSup', 8, 1, 8);
      END;
   allerIrregSup: BEGIN
      STR_Extract(str, l, 'allerIrregSup', 13, 1, 13);
      END;
   meestSup: BEGIN
      STR_Extract(str, l, 'meestSup', 8, 1, 8);
      END;
   noSup: BEGIN
      STR_Extract(str, l, 'noSup', 5, 1, 5);
      END;
   END;
END {LSTYPETOSTR_superlativetype};


PROCEDURE LSTYPETOSTR_synpatterntype( 
         VAR str: STRING;
         VAR l: STR_Range;
         attr : LSDOMAINT_synpatterntype         );
BEGIN
   CASE attr OF 
   synnoVPargs: BEGIN
      STR_Extract(str, l, 'synnoVPargs', 11, 1, 11);
      END;
   synnoadjpargs: BEGIN
      STR_Extract(str, l, 'synnoadjpargs', 13, 1, 13);
      END;
   synAANNP: BEGIN
      STR_Extract(str, l, 'synAANNP', 8, 1, 8);
      END;
   synAANNP_DONP: BEGIN
      STR_Extract(str, l, 'synAANNP_DONP', 13, 1, 13);
      END;
   synAANNP_PREPNP: BEGIN
      STR_Extract(str, l, 'synAANNP_PREPNP', 15, 1, 15);
      END;
   synAANNP_HETOPENOMTESENT: BEGIN
      STR_Extract(str, l, 'synAANNP_HETOPENOMTESENT', 24, 1, 24);
      END;
   synAANNP_HETOPENTESENT: BEGIN
      STR_Extract(str, l, 'synAANNP_HETOPENTESENT', 22, 1, 22);
      END;
   synAANNP_HETTHATSENT: BEGIN
      STR_Extract(str, l, 'synAANNP_HETTHATSENT', 20, 1, 20);
      END;
   synAANNP_HETQSENT: BEGIN
      STR_Extract(str, l, 'synAANNP_HETQSENT', 17, 1, 17);
      END;
   synAANNP_OPENOMTESENT: BEGIN
      STR_Extract(str, l, 'synAANNP_OPENOMTESENT', 21, 1, 21);
      END;
   synAANNP_OPENTESENT: BEGIN
      STR_Extract(str, l, 'synAANNP_OPENTESENT', 19, 1, 19);
      END;
   synAANNP_QSENT: BEGIN
      STR_Extract(str, l, 'synAANNP_QSENT', 14, 1, 14);
      END;
   synAANNP_THATSENT: BEGIN
      STR_Extract(str, l, 'synAANNP_THATSENT', 17, 1, 17);
      END;
   synASIFCLOSEDADJPPROP: BEGIN
      STR_Extract(str, l, 'synASIFCLOSEDADJPPROP', 21, 1, 21);
      END;
   synCLOSEDADJPPROP: BEGIN
      STR_Extract(str, l, 'synCLOSEDADJPPROP', 17, 1, 17);
      END;
   synCLOSEDINFSENT: BEGIN
      STR_Extract(str, l, 'synCLOSEDINFSENT', 16, 1, 16);
      END;
   synCLOSEDNPPROP: BEGIN
      STR_Extract(str, l, 'synCLOSEDNPPROP', 15, 1, 15);
      END;
   synCLOSEDTESENT: BEGIN
      STR_Extract(str, l, 'synCLOSEDTESENT', 15, 1, 15);
      END;
   synCLOSEDVERBPPROP: BEGIN
      STR_Extract(str, l, 'synCLOSEDVERBPPROP', 18, 1, 18);
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
   synDONP_DIREMPTY: BEGIN
      STR_Extract(str, l, 'synDONP_DIREMPTY', 16, 1, 16);
      END;
   synDONP_LOCOPENPREPPPROP: BEGIN
      STR_Extract(str, l, 'synDONP_LOCOPENPREPPPROP', 24, 1, 24);
      END;
   synDONP_OTHEROPENPREPPPROP: BEGIN
      STR_Extract(str, l, 'synDONP_OTHEROPENPREPPPROP', 26, 1, 26);
      END;
   synDONP_OPENADJPPROP: BEGIN
      STR_Extract(str, l, 'synDONP_OPENADJPPROP', 20, 1, 20);
      END;
   synDONP_OPENNPPROP: BEGIN
      STR_Extract(str, l, 'synDONP_OPENNPPROP', 18, 1, 18);
      END;
   synDONP_OPENTESENT: BEGIN
      STR_Extract(str, l, 'synDONP_OPENTESENT', 18, 1, 18);
      END;
   synDONP_OPENOMTESENT: BEGIN
      STR_Extract(str, l, 'synDONP_OPENOMTESENT', 20, 1, 20);
      END;
   synDONP_PREPNP: BEGIN
      STR_Extract(str, l, 'synDONP_PREPNP', 14, 1, 14);
      END;
   synDONP_PREPEMPTY: BEGIN
      STR_Extract(str, l, 'synDONP_PREPEMPTY', 17, 1, 17);
      END;
   synDONP_PREPOPENNPPROP: BEGIN
      STR_Extract(str, l, 'synDONP_PREPOPENNPPROP', 22, 1, 22);
      END;
   synDONP_PREPOPENOMTESENT: BEGIN
      STR_Extract(str, l, 'synDONP_PREPOPENOMTESENT', 24, 1, 24);
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
   synEMPTY_CLOSEDTESENT: BEGIN
      STR_Extract(str, l, 'synEMPTY_CLOSEDTESENT', 21, 1, 21);
      END;
   synEMPTY_DONP: BEGIN
      STR_Extract(str, l, 'synEMPTY_DONP', 13, 1, 13);
      END;
   synEMPTY_HETOPENTESENT: BEGIN
      STR_Extract(str, l, 'synEMPTY_HETOPENTESENT', 22, 1, 22);
      END;
   synEMPTY_HETOPENOMTESENT: BEGIN
      STR_Extract(str, l, 'synEMPTY_HETOPENOMTESENT', 24, 1, 24);
      END;
   synEMPTY_HETTHATSENT: BEGIN
      STR_Extract(str, l, 'synEMPTY_HETTHATSENT', 20, 1, 20);
      END;
   synEMPTY_MEASUREPHRASE: BEGIN
      STR_Extract(str, l, 'synEMPTY_MEASUREPHRASE', 22, 1, 22);
      END;
   synEMPTY_OPENOMTESENT: BEGIN
      STR_Extract(str, l, 'synEMPTY_OPENOMTESENT', 21, 1, 21);
      END;
   synEMPTY_OPENTESENT: BEGIN
      STR_Extract(str, l, 'synEMPTY_OPENTESENT', 19, 1, 19);
      END;
   synEMPTY_OTHERCLOSEDPREPPPROP: BEGIN
      STR_Extract(str, l, 'synEMPTY_OTHERCLOSEDPREPPPROP', 29, 1, 29);
      END;
   synEMPTY_QSENT: BEGIN
      STR_Extract(str, l, 'synEMPTY_QSENT', 14, 1, 14);
      END;
   synEMPTY_THATSENT: BEGIN
      STR_Extract(str, l, 'synEMPTY_THATSENT', 17, 1, 17);
      END;
   synHETASIFCLOSEDADJPPROP: BEGIN
      STR_Extract(str, l, 'synHETASIFCLOSEDADJPPROP', 24, 1, 24);
      END;
   synHETOPENOMTESENT: BEGIN
      STR_Extract(str, l, 'synHETOPENOMTESENT', 18, 1, 18);
      END;
   synHETOPENTESENT: BEGIN
      STR_Extract(str, l, 'synHETOPENTESENT', 16, 1, 16);
      END;
   synHETTHATSENT: BEGIN
      STR_Extract(str, l, 'synHETTHATSENT', 14, 1, 14);
      END;
   synIOEMPTY_DONP: BEGIN
      STR_Extract(str, l, 'synIOEMPTY_DONP', 15, 1, 15);
      END;
   synIOEMPTY_HETTHATSENT: BEGIN
      STR_Extract(str, l, 'synIOEMPTY_HETTHATSENT', 22, 1, 22);
      END;
   synIOEMPTY_HETQSENT: BEGIN
      STR_Extract(str, l, 'synIOEMPTY_HETQSENT', 19, 1, 19);
      END;
   synIOEMPTY_THATSENT: BEGIN
      STR_Extract(str, l, 'synIOEMPTY_THATSENT', 19, 1, 19);
      END;
   synIOEMPTY_QSENT: BEGIN
      STR_Extract(str, l, 'synIOEMPTY_QSENT', 16, 1, 16);
      END;
   synIONP: BEGIN
      STR_Extract(str, l, 'synIONP', 7, 1, 7);
      END;
   synIOEMPTY_HETOPENOMTESENT: BEGIN
      STR_Extract(str, l, 'synIOEMPTY_HETOPENOMTESENT', 26, 1, 26);
      END;
   synIOEMPTY_OPENOMTESENT: BEGIN
      STR_Extract(str, l, 'synIOEMPTY_OPENOMTESENT', 23, 1, 23);
      END;
   synIONP_CLOSEDADJPPROP: BEGIN
      STR_Extract(str, l, 'synIONP_CLOSEDADJPPROP', 22, 1, 22);
      END;
   synIONP_CLOSEDNPPROP: BEGIN
      STR_Extract(str, l, 'synIONP_CLOSEDNPPROP', 20, 1, 20);
      END;
   synIONP_DONP: BEGIN
      STR_Extract(str, l, 'synIONP_DONP', 12, 1, 12);
      END;
   synIONP_HETOPENOMTESENT: BEGIN
      STR_Extract(str, l, 'synIONP_HETOPENOMTESENT', 23, 1, 23);
      END;
   synIONP_HETOPENTESENT: BEGIN
      STR_Extract(str, l, 'synIONP_HETOPENTESENT', 21, 1, 21);
      END;
   synIONP_HETTHATSENT: BEGIN
      STR_Extract(str, l, 'synIONP_HETTHATSENT', 19, 1, 19);
      END;
   synIONP_HETQSENT: BEGIN
      STR_Extract(str, l, 'synIONP_HETQSENT', 16, 1, 16);
      END;
   synIONP_MEASUREPHRASE: BEGIN
      STR_Extract(str, l, 'synIONP_MEASUREPHRASE', 21, 1, 21);
      END;
   synIONP_OPENOMTESENT: BEGIN
      STR_Extract(str, l, 'synIONP_OPENOMTESENT', 20, 1, 20);
      END;
   synIONP_OPENINFSENT: BEGIN
      STR_Extract(str, l, 'synIONP_OPENINFSENT', 19, 1, 19);
      END;
   synIONP_OPENTESENT: BEGIN
      STR_Extract(str, l, 'synIONP_OPENTESENT', 18, 1, 18);
      END;
   synIONP_OTHERCLOSEDPREPPPROP: BEGIN
      STR_Extract(str, l, 'synIONP_OTHERCLOSEDPREPPPROP', 28, 1, 28);
      END;
   synIONP_PREPCLOSEDADJPPROP: BEGIN
      STR_Extract(str, l, 'synIONP_PREPCLOSEDADJPPROP', 26, 1, 26);
      END;
   synIONP_QSENT: BEGIN
      STR_Extract(str, l, 'synIONP_QSENT', 13, 1, 13);
      END;
   synIONP_SOPROSENT: BEGIN
      STR_Extract(str, l, 'synIONP_SOPROSENT', 17, 1, 17);
      END;
   synIONP_THATSENT: BEGIN
      STR_Extract(str, l, 'synIONP_THATSENT', 16, 1, 16);
      END;
   synLOCCLOSEDPREPPPROP: BEGIN
      STR_Extract(str, l, 'synLOCCLOSEDPREPPPROP', 21, 1, 21);
      END;
   synLOCOPENPREPPPROP: BEGIN
      STR_Extract(str, l, 'synLOCOPENPREPPPROP', 19, 1, 19);
      END;
   synLOCPREPP: BEGIN
      STR_Extract(str, l, 'synLOCPREPP', 11, 1, 11);
      END;
   synLOCEMPTY: BEGIN
      STR_Extract(str, l, 'synLOCEMPTY', 11, 1, 11);
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
   synOPENINFSENT: BEGIN
      STR_Extract(str, l, 'synOPENINFSENT', 14, 1, 14);
      END;
   synOPENNPPROP: BEGIN
      STR_Extract(str, l, 'synOPENNPPROP', 13, 1, 13);
      END;
   synOPENOMTESENT: BEGIN
      STR_Extract(str, l, 'synOPENOMTESENT', 15, 1, 15);
      END;
   synOPENTESENT: BEGIN
      STR_Extract(str, l, 'synOPENTESENT', 13, 1, 13);
      END;
   synOPENVERBPPROP: BEGIN
      STR_Extract(str, l, 'synOPENVERBPPROP', 16, 1, 16);
      END;
   synOTHERCLOSEDPREPPPROP: BEGIN
      STR_Extract(str, l, 'synOTHERCLOSEDPREPPPROP', 23, 1, 23);
      END;
   synPAPREPOPENOMTESENT: BEGIN
      STR_Extract(str, l, 'synPAPREPOPENOMTESENT', 21, 1, 21);
      END;
   synPAPREPOPENTESENT: BEGIN
      STR_Extract(str, l, 'synPAPREPOPENTESENT', 19, 1, 19);
      END;
   synPAPREPTHATSENT: BEGIN
      STR_Extract(str, l, 'synPAPREPTHATSENT', 17, 1, 17);
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
   synPREPCLOSEDADJPPROP: BEGIN
      STR_Extract(str, l, 'synPREPCLOSEDADJPPROP', 21, 1, 21);
      END;
   synPREPCLOSEDNPPROP: BEGIN
      STR_Extract(str, l, 'synPREPCLOSEDNPPROP', 19, 1, 19);
      END;
   synPREPEMPTY: BEGIN
      STR_Extract(str, l, 'synPREPEMPTY', 12, 1, 12);
      END;
   synPREPNP: BEGIN
      STR_Extract(str, l, 'synPREPNP', 9, 1, 9);
      END;
   synPREPNP_PREPNP: BEGIN
      STR_Extract(str, l, 'synPREPNP_PREPNP', 16, 1, 16);
      END;
   synPREPOPENNPPROP: BEGIN
      STR_Extract(str, l, 'synPREPOPENNPPROP', 17, 1, 17);
      END;
   synPREPOPENOMTESENT: BEGIN
      STR_Extract(str, l, 'synPREPOPENOMTESENT', 19, 1, 19);
      END;
   synPREPOPENTESENT: BEGIN
      STR_Extract(str, l, 'synPREPOPENTESENT', 17, 1, 17);
      END;
   synPREPQSENT: BEGIN
      STR_Extract(str, l, 'synPREPQSENT', 12, 1, 12);
      END;
   synPREPTHATSENT: BEGIN
      STR_Extract(str, l, 'synPREPTHATSENT', 15, 1, 15);
      END;
   synPROSENT: BEGIN
      STR_Extract(str, l, 'synPROSENT', 10, 1, 10);
      END;
   synQSENT: BEGIN
      STR_Extract(str, l, 'synQSENT', 8, 1, 8);
      END;
   synSOPROSENT: BEGIN
      STR_Extract(str, l, 'synSOPROSENT', 12, 1, 12);
      END;
   synTHATSENT: BEGIN
      STR_Extract(str, l, 'synTHATSENT', 11, 1, 11);
      END;
   synTHATSENT_LOCOPENPREPPPROP: BEGIN
      STR_Extract(str, l, 'synTHATSENT_LOCOPENPREPPPROP', 28, 1, 28);
      END;
   synVOORNP_DONP: BEGIN
      STR_Extract(str, l, 'synVOORNP_DONP', 14, 1, 14);
      END;
   synVOORNP: BEGIN
      STR_Extract(str, l, 'synVOORNP', 9, 1, 9);
      END;
   synVOOREMPTY: BEGIN
      STR_Extract(str, l, 'synVOOREMPTY', 12, 1, 12);
      END;
   synzijn: BEGIN
      STR_Extract(str, l, 'synzijn', 7, 1, 7);
      END;
   syndooractive: BEGIN
      STR_Extract(str, l, 'syndooractive', 13, 1, 13);
      END;
   synaanactive: BEGIN
      STR_Extract(str, l, 'synaanactive', 12, 1, 12);
      END;
   synactCVPP: BEGIN
      STR_Extract(str, l, 'synactCVPP', 10, 1, 10);
      END;
   synOPENOMTESENTPROOBJ: BEGIN
      STR_Extract(str, l, 'synOPENOMTESENTPROOBJ', 21, 1, 21);
      END;
   synLOCPREPEMPTY: BEGIN
      STR_Extract(str, l, 'synLOCPREPEMPTY', 15, 1, 15);
      END;
   synDIREMPTY: BEGIN
      STR_Extract(str, l, 'synDIREMPTY', 11, 1, 11);
      END;
   synDONP_PREPTHATSENT: BEGIN
      STR_Extract(str, l, 'synDONP_PREPTHATSENT', 20, 1, 20);
      END;
   synDONP_RESULTEMPTY: BEGIN
      STR_Extract(str, l, 'synDONP_RESULTEMPTY', 19, 1, 19);
      END;
   synDONP_THATSENT: BEGIN
      STR_Extract(str, l, 'synDONP_THATSENT', 16, 1, 16);
      END;
   synEMPTY_PREPEMPTY: BEGIN
      STR_Extract(str, l, 'synEMPTY_PREPEMPTY', 18, 1, 18);
      END;
   synEMPTY_PREPNP: BEGIN
      STR_Extract(str, l, 'synEMPTY_PREPNP', 15, 1, 15);
      END;
   synHETIFSENT: BEGIN
      STR_Extract(str, l, 'synHETIFSENT', 12, 1, 12);
      END;
   synHETQSENT: BEGIN
      STR_Extract(str, l, 'synHETQSENT', 11, 1, 11);
      END;
   synIONP_PREPNP: BEGIN
      STR_Extract(str, l, 'synIONP_PREPNP', 14, 1, 14);
      END;
   synIONP_PROSENT: BEGIN
      STR_Extract(str, l, 'synIONP_PROSENT', 15, 1, 15);
      END;
   synAANNP_PROSENT: BEGIN
      STR_Extract(str, l, 'synAANNP_PROSENT', 16, 1, 16);
      END;
   synEMPTY_PROSENT: BEGIN
      STR_Extract(str, l, 'synEMPTY_PROSENT', 16, 1, 16);
      END;
   synPREPEMPTY_PREPEMPTY: BEGIN
      STR_Extract(str, l, 'synPREPEMPTY_PREPEMPTY', 22, 1, 22);
      END;
   synPREPEMPTY_PREPNP: BEGIN
      STR_Extract(str, l, 'synPREPEMPTY_PREPNP', 19, 1, 19);
      END;
   synPREPNP_PREPEMPTY: BEGIN
      STR_Extract(str, l, 'synPREPNP_PREPEMPTY', 19, 1, 19);
      END;
   synPREPNP_PREPOPENOMTESENT: BEGIN
      STR_Extract(str, l, 'synPREPNP_PREPOPENOMTESENT', 26, 1, 26);
      END;
   synPREPEMPTY_PREPOPENOMTESENT: BEGIN
      STR_Extract(str, l, 'synPREPEMPTY_PREPOPENOMTESENT', 29, 1, 29);
      END;
   synPREPNP_PREPTHATSENT: BEGIN
      STR_Extract(str, l, 'synPREPNP_PREPTHATSENT', 22, 1, 22);
      END;
   synPREPEMPTY_PREPTHATSENT: BEGIN
      STR_Extract(str, l, 'synPREPEMPTY_PREPTHATSENT', 25, 1, 25);
      END;
   synPREPNP_THATSENT: BEGIN
      STR_Extract(str, l, 'synPREPNP_THATSENT', 18, 1, 18);
      END;
   synTEMPOPENPREPPPROP: BEGIN
      STR_Extract(str, l, 'synTEMPOPENPREPPPROP', 20, 1, 20);
      END;
   synDONP_TEMPOPENPREPPPROP: BEGIN
      STR_Extract(str, l, 'synDONP_TEMPOPENPREPPPROP', 25, 1, 25);
      END;
   synPREPOPENINFSENT: BEGIN
      STR_Extract(str, l, 'synPREPOPENINFSENT', 18, 1, 18);
      END;
   synPREPNP_OPENOMTESENT: BEGIN
      STR_Extract(str, l, 'synPREPNP_OPENOMTESENT', 22, 1, 22);
      END;
   synPREPNP_QSENT: BEGIN
      STR_Extract(str, l, 'synPREPNP_QSENT', 15, 1, 15);
      END;
   synDONP_PREPOPENTESENT: BEGIN
      STR_Extract(str, l, 'synDONP_PREPOPENTESENT', 22, 1, 22);
      END;
   synEMPTY_RESULTEMPTY: BEGIN
      STR_Extract(str, l, 'synEMPTY_RESULTEMPTY', 20, 1, 20);
      END;
   synDONP_PREPPROSENT: BEGIN
      STR_Extract(str, l, 'synDONP_PREPPROSENT', 19, 1, 19);
      END;
   synDONP_OPENINFSENT: BEGIN
      STR_Extract(str, l, 'synDONP_OPENINFSENT', 19, 1, 19);
      END;
   synTempADVP: BEGIN
      STR_Extract(str, l, 'synTempADVP', 11, 1, 11);
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
   vpid41: BEGIN
      STR_Extract(str, l, 'vpid41', 6, 1, 6);
      END;
   vpid42: BEGIN
      STR_Extract(str, l, 'vpid42', 6, 1, 6);
      END;
   vpid43: BEGIN
      STR_Extract(str, l, 'vpid43', 6, 1, 6);
      END;
   vpid44: BEGIN
      STR_Extract(str, l, 'vpid44', 6, 1, 6);
      END;
   vpid45: BEGIN
      STR_Extract(str, l, 'vpid45', 6, 1, 6);
      END;
   vpid46: BEGIN
      STR_Extract(str, l, 'vpid46', 6, 1, 6);
      END;
   vpid47: BEGIN
      STR_Extract(str, l, 'vpid47', 6, 1, 6);
      END;
   vpid48: BEGIN
      STR_Extract(str, l, 'vpid48', 6, 1, 6);
      END;
   vpid49: BEGIN
      STR_Extract(str, l, 'vpid49', 6, 1, 6);
      END;
   vpid50: BEGIN
      STR_Extract(str, l, 'vpid50', 6, 1, 6);
      END;
   vpid51: BEGIN
      STR_Extract(str, l, 'vpid51', 6, 1, 6);
      END;
   vpid52: BEGIN
      STR_Extract(str, l, 'vpid52', 6, 1, 6);
      END;
   vpid53: BEGIN
      STR_Extract(str, l, 'vpid53', 6, 1, 6);
      END;
   vpid54: BEGIN
      STR_Extract(str, l, 'vpid54', 6, 1, 6);
      END;
   vpid55: BEGIN
      STR_Extract(str, l, 'vpid55', 6, 1, 6);
      END;
   vpid56: BEGIN
      STR_Extract(str, l, 'vpid56', 6, 1, 6);
      END;
   vpid57: BEGIN
      STR_Extract(str, l, 'vpid57', 6, 1, 6);
      END;
   vpid58: BEGIN
      STR_Extract(str, l, 'vpid58', 6, 1, 6);
      END;
   vpid59: BEGIN
      STR_Extract(str, l, 'vpid59', 6, 1, 6);
      END;
   vpid60: BEGIN
      STR_Extract(str, l, 'vpid60', 6, 1, 6);
      END;
   vpid61: BEGIN
      STR_Extract(str, l, 'vpid61', 6, 1, 6);
      END;
   vpid62: BEGIN
      STR_Extract(str, l, 'vpid62', 6, 1, 6);
      END;
   vpid63: BEGIN
      STR_Extract(str, l, 'vpid63', 6, 1, 6);
      END;
   vpid64: BEGIN
      STR_Extract(str, l, 'vpid64', 6, 1, 6);
      END;
   vpid65: BEGIN
      STR_Extract(str, l, 'vpid65', 6, 1, 6);
      END;
   vpid66: BEGIN
      STR_Extract(str, l, 'vpid66', 6, 1, 6);
      END;
   vpid67: BEGIN
      STR_Extract(str, l, 'vpid67', 6, 1, 6);
      END;
   vpid68: BEGIN
      STR_Extract(str, l, 'vpid68', 6, 1, 6);
      END;
   vpid69: BEGIN
      STR_Extract(str, l, 'vpid69', 6, 1, 6);
      END;
   vpid70: BEGIN
      STR_Extract(str, l, 'vpid70', 6, 1, 6);
      END;
   vpid71: BEGIN
      STR_Extract(str, l, 'vpid71', 6, 1, 6);
      END;
   vpid72: BEGIN
      STR_Extract(str, l, 'vpid72', 6, 1, 6);
      END;
   vpid73: BEGIN
      STR_Extract(str, l, 'vpid73', 6, 1, 6);
      END;
   vpid74: BEGIN
      STR_Extract(str, l, 'vpid74', 6, 1, 6);
      END;
   vpid75: BEGIN
      STR_Extract(str, l, 'vpid75', 6, 1, 6);
      END;
   vpid76: BEGIN
      STR_Extract(str, l, 'vpid76', 6, 1, 6);
      END;
   vpid77: BEGIN
      STR_Extract(str, l, 'vpid77', 6, 1, 6);
      END;
   vpid78: BEGIN
      STR_Extract(str, l, 'vpid78', 6, 1, 6);
      END;
   vpid79: BEGIN
      STR_Extract(str, l, 'vpid79', 6, 1, 6);
      END;
   vpid80: BEGIN
      STR_Extract(str, l, 'vpid80', 6, 1, 6);
      END;
   vpid81: BEGIN
      STR_Extract(str, l, 'vpid81', 6, 1, 6);
      END;
   vpid82: BEGIN
      STR_Extract(str, l, 'vpid82', 6, 1, 6);
      END;
   vpid83: BEGIN
      STR_Extract(str, l, 'vpid83', 6, 1, 6);
      END;
   vpid84: BEGIN
      STR_Extract(str, l, 'vpid84', 6, 1, 6);
      END;
   vpid85: BEGIN
      STR_Extract(str, l, 'vpid85', 6, 1, 6);
      END;
   vpid86: BEGIN
      STR_Extract(str, l, 'vpid86', 6, 1, 6);
      END;
   vpid87: BEGIN
      STR_Extract(str, l, 'vpid87', 6, 1, 6);
      END;
   vpid88: BEGIN
      STR_Extract(str, l, 'vpid88', 6, 1, 6);
      END;
   vpid89: BEGIN
      STR_Extract(str, l, 'vpid89', 6, 1, 6);
      END;
   vpid90: BEGIN
      STR_Extract(str, l, 'vpid90', 6, 1, 6);
      END;
   vpid91: BEGIN
      STR_Extract(str, l, 'vpid91', 6, 1, 6);
      END;
   vpid92: BEGIN
      STR_Extract(str, l, 'vpid92', 6, 1, 6);
      END;
   vpid93: BEGIN
      STR_Extract(str, l, 'vpid93', 6, 1, 6);
      END;
   vpid94: BEGIN
      STR_Extract(str, l, 'vpid94', 6, 1, 6);
      END;
   vpid95: BEGIN
      STR_Extract(str, l, 'vpid95', 6, 1, 6);
      END;
   vpid96: BEGIN
      STR_Extract(str, l, 'vpid96', 6, 1, 6);
      END;
   vpid97: BEGIN
      STR_Extract(str, l, 'vpid97', 6, 1, 6);
      END;
   vpid98: BEGIN
      STR_Extract(str, l, 'vpid98', 6, 1, 6);
      END;
   vpid99: BEGIN
      STR_Extract(str, l, 'vpid99', 6, 1, 6);
      END;
   vpid100: BEGIN
      STR_Extract(str, l, 'vpid100', 7, 1, 7);
      END;
   vpid101: BEGIN
      STR_Extract(str, l, 'vpid101', 7, 1, 7);
      END;
   vpid102: BEGIN
      STR_Extract(str, l, 'vpid102', 7, 1, 7);
      END;
   vpid103: BEGIN
      STR_Extract(str, l, 'vpid103', 7, 1, 7);
      END;
   vpid104: BEGIN
      STR_Extract(str, l, 'vpid104', 7, 1, 7);
      END;
   vpid105: BEGIN
      STR_Extract(str, l, 'vpid105', 7, 1, 7);
      END;
   vpid106: BEGIN
      STR_Extract(str, l, 'vpid106', 7, 1, 7);
      END;
   vpid107: BEGIN
      STR_Extract(str, l, 'vpid107', 7, 1, 7);
      END;
   vpid108: BEGIN
      STR_Extract(str, l, 'vpid108', 7, 1, 7);
      END;
   vpid109: BEGIN
      STR_Extract(str, l, 'vpid109', 7, 1, 7);
      END;
   vpid110: BEGIN
      STR_Extract(str, l, 'vpid110', 7, 1, 7);
      END;
   vpid111: BEGIN
      STR_Extract(str, l, 'vpid111', 7, 1, 7);
      END;
   vpid112: BEGIN
      STR_Extract(str, l, 'vpid112', 7, 1, 7);
      END;
   vpid113: BEGIN
      STR_Extract(str, l, 'vpid113', 7, 1, 7);
      END;
   vpid114: BEGIN
      STR_Extract(str, l, 'vpid114', 7, 1, 7);
      END;
   vpid115: BEGIN
      STR_Extract(str, l, 'vpid115', 7, 1, 7);
      END;
   vpid116: BEGIN
      STR_Extract(str, l, 'vpid116', 7, 1, 7);
      END;
   vpid117: BEGIN
      STR_Extract(str, l, 'vpid117', 7, 1, 7);
      END;
   vpid118: BEGIN
      STR_Extract(str, l, 'vpid118', 7, 1, 7);
      END;
   vpid119: BEGIN
      STR_Extract(str, l, 'vpid119', 7, 1, 7);
      END;
   vpid120: BEGIN
      STR_Extract(str, l, 'vpid120', 7, 1, 7);
      END;
   vpid121: BEGIN
      STR_Extract(str, l, 'vpid121', 7, 1, 7);
      END;
   vpid122: BEGIN
      STR_Extract(str, l, 'vpid122', 7, 1, 7);
      END;
   vpid123: BEGIN
      STR_Extract(str, l, 'vpid123', 7, 1, 7);
      END;
   vpid124: BEGIN
      STR_Extract(str, l, 'vpid124', 7, 1, 7);
      END;
   vpid125: BEGIN
      STR_Extract(str, l, 'vpid125', 7, 1, 7);
      END;
   vpid126: BEGIN
      STR_Extract(str, l, 'vpid126', 7, 1, 7);
      END;
   vpid127: BEGIN
      STR_Extract(str, l, 'vpid127', 7, 1, 7);
      END;
   vpid128: BEGIN
      STR_Extract(str, l, 'vpid128', 7, 1, 7);
      END;
   vpid129: BEGIN
      STR_Extract(str, l, 'vpid129', 7, 1, 7);
      END;
   vpid130: BEGIN
      STR_Extract(str, l, 'vpid130', 7, 1, 7);
      END;
   vpid131: BEGIN
      STR_Extract(str, l, 'vpid131', 7, 1, 7);
      END;
   vpid132: BEGIN
      STR_Extract(str, l, 'vpid132', 7, 1, 7);
      END;
   vpid133: BEGIN
      STR_Extract(str, l, 'vpid133', 7, 1, 7);
      END;
   vpid134: BEGIN
      STR_Extract(str, l, 'vpid134', 7, 1, 7);
      END;
   vpid135: BEGIN
      STR_Extract(str, l, 'vpid135', 7, 1, 7);
      END;
   vpid136: BEGIN
      STR_Extract(str, l, 'vpid136', 7, 1, 7);
      END;
   vpid137: BEGIN
      STR_Extract(str, l, 'vpid137', 7, 1, 7);
      END;
   vpid138: BEGIN
      STR_Extract(str, l, 'vpid138', 7, 1, 7);
      END;
   vpid139: BEGIN
      STR_Extract(str, l, 'vpid139', 7, 1, 7);
      END;
   vpid140: BEGIN
      STR_Extract(str, l, 'vpid140', 7, 1, 7);
      END;
   vpid141: BEGIN
      STR_Extract(str, l, 'vpid141', 7, 1, 7);
      END;
   vpid142: BEGIN
      STR_Extract(str, l, 'vpid142', 7, 1, 7);
      END;
   vpid143: BEGIN
      STR_Extract(str, l, 'vpid143', 7, 1, 7);
      END;
   vpid144: BEGIN
      STR_Extract(str, l, 'vpid144', 7, 1, 7);
      END;
   vpid145: BEGIN
      STR_Extract(str, l, 'vpid145', 7, 1, 7);
      END;
   vpid146: BEGIN
      STR_Extract(str, l, 'vpid146', 7, 1, 7);
      END;
   vpid147: BEGIN
      STR_Extract(str, l, 'vpid147', 7, 1, 7);
      END;
   vpid148: BEGIN
      STR_Extract(str, l, 'vpid148', 7, 1, 7);
      END;
   vpid149: BEGIN
      STR_Extract(str, l, 'vpid149', 7, 1, 7);
      END;
   vpid150: BEGIN
      STR_Extract(str, l, 'vpid150', 7, 1, 7);
      END;
   vpid151: BEGIN
      STR_Extract(str, l, 'vpid151', 7, 1, 7);
      END;
   vpid152: BEGIN
      STR_Extract(str, l, 'vpid152', 7, 1, 7);
      END;
   vpid153: BEGIN
      STR_Extract(str, l, 'vpid153', 7, 1, 7);
      END;
   vpid154: BEGIN
      STR_Extract(str, l, 'vpid154', 7, 1, 7);
      END;
   vpid155: BEGIN
      STR_Extract(str, l, 'vpid155', 7, 1, 7);
      END;
   vpid156: BEGIN
      STR_Extract(str, l, 'vpid156', 7, 1, 7);
      END;
   vpid157: BEGIN
      STR_Extract(str, l, 'vpid157', 7, 1, 7);
      END;
   vpid158: BEGIN
      STR_Extract(str, l, 'vpid158', 7, 1, 7);
      END;
   vpid159: BEGIN
      STR_Extract(str, l, 'vpid159', 7, 1, 7);
      END;
   vpid160: BEGIN
      STR_Extract(str, l, 'vpid160', 7, 1, 7);
      END;
   vpid161: BEGIN
      STR_Extract(str, l, 'vpid161', 7, 1, 7);
      END;
   vpid162: BEGIN
      STR_Extract(str, l, 'vpid162', 7, 1, 7);
      END;
   vpid163: BEGIN
      STR_Extract(str, l, 'vpid163', 7, 1, 7);
      END;
   vpid164: BEGIN
      STR_Extract(str, l, 'vpid164', 7, 1, 7);
      END;
   vpid165: BEGIN
      STR_Extract(str, l, 'vpid165', 7, 1, 7);
      END;
   vpid166: BEGIN
      STR_Extract(str, l, 'vpid166', 7, 1, 7);
      END;
   vpid167: BEGIN
      STR_Extract(str, l, 'vpid167', 7, 1, 7);
      END;
   vpid168: BEGIN
      STR_Extract(str, l, 'vpid168', 7, 1, 7);
      END;
   vpid169: BEGIN
      STR_Extract(str, l, 'vpid169', 7, 1, 7);
      END;
   vpid170: BEGIN
      STR_Extract(str, l, 'vpid170', 7, 1, 7);
      END;
   vpid171: BEGIN
      STR_Extract(str, l, 'vpid171', 7, 1, 7);
      END;
   vpid172: BEGIN
      STR_Extract(str, l, 'vpid172', 7, 1, 7);
      END;
   vpid173: BEGIN
      STR_Extract(str, l, 'vpid173', 7, 1, 7);
      END;
   vpid174: BEGIN
      STR_Extract(str, l, 'vpid174', 7, 1, 7);
      END;
   vpid175: BEGIN
      STR_Extract(str, l, 'vpid175', 7, 1, 7);
      END;
   vpid176: BEGIN
      STR_Extract(str, l, 'vpid176', 7, 1, 7);
      END;
   vpid177: BEGIN
      STR_Extract(str, l, 'vpid177', 7, 1, 7);
      END;
   vpid178: BEGIN
      STR_Extract(str, l, 'vpid178', 7, 1, 7);
      END;
   vpid179: BEGIN
      STR_Extract(str, l, 'vpid179', 7, 1, 7);
      END;
   vpid180: BEGIN
      STR_Extract(str, l, 'vpid180', 7, 1, 7);
      END;
   vpid181: BEGIN
      STR_Extract(str, l, 'vpid181', 7, 1, 7);
      END;
   vpid182: BEGIN
      STR_Extract(str, l, 'vpid182', 7, 1, 7);
      END;
   vpid183: BEGIN
      STR_Extract(str, l, 'vpid183', 7, 1, 7);
      END;
   vpid184: BEGIN
      STR_Extract(str, l, 'vpid184', 7, 1, 7);
      END;
   vpid185: BEGIN
      STR_Extract(str, l, 'vpid185', 7, 1, 7);
      END;
   vpid186: BEGIN
      STR_Extract(str, l, 'vpid186', 7, 1, 7);
      END;
   vpid187: BEGIN
      STR_Extract(str, l, 'vpid187', 7, 1, 7);
      END;
   vpid188: BEGIN
      STR_Extract(str, l, 'vpid188', 7, 1, 7);
      END;
   vpid189: BEGIN
      STR_Extract(str, l, 'vpid189', 7, 1, 7);
      END;
   vpid190: BEGIN
      STR_Extract(str, l, 'vpid190', 7, 1, 7);
      END;
   vpid191: BEGIN
      STR_Extract(str, l, 'vpid191', 7, 1, 7);
      END;
   vpid192: BEGIN
      STR_Extract(str, l, 'vpid192', 7, 1, 7);
      END;
   vpid193: BEGIN
      STR_Extract(str, l, 'vpid193', 7, 1, 7);
      END;
   vpid194: BEGIN
      STR_Extract(str, l, 'vpid194', 7, 1, 7);
      END;
   vpid195: BEGIN
      STR_Extract(str, l, 'vpid195', 7, 1, 7);
      END;
   vpid196: BEGIN
      STR_Extract(str, l, 'vpid196', 7, 1, 7);
      END;
   vpid197: BEGIN
      STR_Extract(str, l, 'vpid197', 7, 1, 7);
      END;
   vpid198: BEGIN
      STR_Extract(str, l, 'vpid198', 7, 1, 7);
      END;
   vpid199: BEGIN
      STR_Extract(str, l, 'vpid199', 7, 1, 7);
      END;
   vpid200: BEGIN
      STR_Extract(str, l, 'vpid200', 7, 1, 7);
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
   Omegaquant: BEGIN
      STR_Extract(str, l, 'Omegaquant', 10, 1, 10);
      END;
   END;
END {LSTYPETOSTR_syntquanttype};


PROCEDURE LSTYPETOSTR_tensetype( 
         VAR str: STRING;
         VAR l: STR_Range;
         attr : LSDOMAINT_tensetype         );
BEGIN
   CASE attr OF 
   omegatense: BEGIN
      STR_Extract(str, l, 'omegatense', 10, 1, 10);
      END;
   presenttense: BEGIN
      STR_Extract(str, l, 'presenttense', 12, 1, 12);
      END;
   pasttense: BEGIN
      STR_Extract(str, l, 'pasttense', 9, 1, 9);
      END;
   END;
END {LSTYPETOSTR_tensetype};


PROCEDURE LSTYPETOSTR_thanascompltype( 
         VAR str: STRING;
         VAR l: STR_Range;
         attr : LSDOMAINT_thanascompltype         );
BEGIN
   CASE attr OF 
   omegacompl: BEGIN
      STR_Extract(str, l, 'omegacompl', 10, 1, 10);
      END;
   vancompl: BEGIN
      STR_Extract(str, l, 'vancompl', 8, 1, 8);
      END;
   dancompl: BEGIN
      STR_Extract(str, l, 'dancompl', 8, 1, 8);
      END;
   omcompl: BEGIN
      STR_Extract(str, l, 'omcompl', 7, 1, 7);
      END;
   datcompl: BEGIN
      STR_Extract(str, l, 'datcompl', 8, 1, 8);
      END;
   alscompl: BEGIN
      STR_Extract(str, l, 'alscompl', 8, 1, 8);
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
   adjp123: BEGIN
      STR_Extract(str, l, 'adjp123', 7, 1, 7);
      END;
   adjp012: BEGIN
      STR_Extract(str, l, 'adjp012', 7, 1, 7);
      END;
   adjp010: BEGIN
      STR_Extract(str, l, 'adjp010', 7, 1, 7);
      END;
   adjp210: BEGIN
      STR_Extract(str, l, 'adjp210', 7, 1, 7);
      END;
   adjp021: BEGIN
      STR_Extract(str, l, 'adjp021', 7, 1, 7);
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
   adjp321: BEGIN
      STR_Extract(str, l, 'adjp321', 7, 1, 7);
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
   pp010: BEGIN
      STR_Extract(str, l, 'pp010', 5, 1, 5);
      END;
   pp100: BEGIN
      STR_Extract(str, l, 'pp100', 5, 1, 5);
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
   vp123: BEGIN
      STR_Extract(str, l, 'vp123', 5, 1, 5);
      END;
   thetavpaux: BEGIN
      STR_Extract(str, l, 'thetavpaux', 10, 1, 10);
      END;
   vp210: BEGIN
      STR_Extract(str, l, 'vp210', 5, 1, 5);
      END;
   vp021: BEGIN
      STR_Extract(str, l, 'vp021', 5, 1, 5);
      END;
   vp321: BEGIN
      STR_Extract(str, l, 'vp321', 5, 1, 5);
      END;
   vp312: BEGIN
      STR_Extract(str, l, 'vp312', 5, 1, 5);
      END;
   vp132: BEGIN
      STR_Extract(str, l, 'vp132', 5, 1, 5);
      END;
   vp231: BEGIN
      STR_Extract(str, l, 'vp231', 5, 1, 5);
      END;
   vp213: BEGIN
      STR_Extract(str, l, 'vp213', 5, 1, 5);
      END;
   END;
END {LSTYPETOSTR_thetavptype};


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


PROCEDURE LSTYPETOSTR_verbraisertype( 
         VAR str: STRING;
         VAR l: STR_Range;
         attr : LSDOMAINT_verbraisertype         );
BEGIN
   CASE attr OF 
   OptionalVR: BEGIN
      STR_Extract(str, l, 'OptionalVR', 10, 1, 10);
      END;
   obligatoryVR: BEGIN
      STR_Extract(str, l, 'obligatoryVR', 12, 1, 12);
      END;
   noVR: BEGIN
      STR_Extract(str, l, 'noVR', 4, 1, 4);
      END;
   END;
END {LSTYPETOSTR_verbraisertype};


PROCEDURE LSTYPETOSTR_verbsubctype( 
         VAR str: STRING;
         VAR l: STR_Range;
         attr : LSDOMAINT_verbsubctype         );
BEGIN
   CASE attr OF 
   Mainverb: BEGIN
      STR_Extract(str, l, 'Mainverb', 8, 1, 8);
      END;
   Modalverb: BEGIN
      STR_Extract(str, l, 'Modalverb', 9, 1, 9);
      END;
   progaux: BEGIN
      STR_Extract(str, l, 'progaux', 7, 1, 7);
      END;
   hebbenaux: BEGIN
      STR_Extract(str, l, 'hebbenaux', 9, 1, 9);
      END;
   zijnaux: BEGIN
      STR_Extract(str, l, 'zijnaux', 7, 1, 7);
      END;
   latenverb: BEGIN
      STR_Extract(str, l, 'latenverb', 9, 1, 9);
      END;
   wordenaux: BEGIN
      STR_Extract(str, l, 'wordenaux', 9, 1, 9);
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
   AanActive: BEGIN
      STR_Extract(str, l, 'AanActive', 9, 1, 9);
      END;
   DoorActive: BEGIN
      STR_Extract(str, l, 'DoorActive', 10, 1, 10);
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
   teV: BEGIN
      STR_Extract(str, l, 'teV', 3, 1, 3);
      END;
   partV: BEGIN
      STR_Extract(str, l, 'partV', 5, 1, 5);
      END;
   VV: BEGIN
      STR_Extract(str, l, 'VV', 2, 1, 2);
      END;
   AuxV: BEGIN
      STR_Extract(str, l, 'AuxV', 4, 1, 4);
      END;
   PartTeV: BEGIN
      STR_Extract(str, l, 'PartTeV', 7, 1, 7);
      END;
   aanhetV: BEGIN
      STR_Extract(str, l, 'aanhetV', 7, 1, 7);
      END;
   teVV: BEGIN
      STR_Extract(str, l, 'teVV', 4, 1, 4);
      END;
   teAuxV: BEGIN
      STR_Extract(str, l, 'teAuxV', 6, 1, 6);
      END;
   prepV: BEGIN
      STR_Extract(str, l, 'prepV', 5, 1, 5);
      END;
   prepteV: BEGIN
      STR_Extract(str, l, 'prepteV', 7, 1, 7);
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
   proobjxpmood: BEGIN
      STR_Extract(str, l, 'proobjxpmood', 12, 1, 12);
      END;
   END;
END {LSTYPETOSTR_xpmoodtype};



PROCEDURE LSTYPETOSTR_conjclasstype( 
         VAR str: STRING;
         VAR l: STR_Range;
         attr : LSDOMAINT_conjclasstype         );
BEGIN
   STR_IntegerToStr(attr, str, l);
END {LSTYPETOSTR_conjclasstype};


PROCEDURE LSTYPETOSTR_persontype( 
         VAR str: STRING;
         VAR l: STR_Range;
         attr : LSDOMAINT_persontype         );
BEGIN
   STR_IntegerToStr(attr, str, l);
END {LSTYPETOSTR_persontype};


PROCEDURE LSTYPETOSTR_pronpersontype( 
         VAR str: STRING;
         VAR l: STR_Range;
         attr : LSDOMAINT_pronpersontype         );
BEGIN
   STR_IntegerToStr(attr, str, l);
END {LSTYPETOSTR_pronpersontype};


PROCEDURE LSTYPETOSTR_valuetype( 
         VAR str: STRING;
         VAR l: STR_Range;
         attr : LSDOMAINT_valuetype         );
BEGIN
   STR_IntegerToStr(attr, str, l);
END {LSTYPETOSTR_valuetype};



