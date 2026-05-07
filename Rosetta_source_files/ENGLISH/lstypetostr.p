pragma C_include('strings.pf');
Export(LSTYPETOSTR);
pragma C_include('lsdomaint.pf');
pragma C_include('str.pf');
pragma C_include('ldstrtotype.pf');
pragma C_include('lstypetostr.pf');

PROGRAM LSTYPETOSTR;

WITH LSDOMAINT, STR, STRINGS, LDSTRTOTYPE;

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
   substanceadj: BEGIN
      STR_Extract(str, l, 'substanceadj', 12, 1, 12);
      END;
   otheradj: BEGIN
      STR_Extract(str, l, 'otheradj', 8, 1, 8);
      END;
   anderadj: BEGIN
      STR_Extract(str, l, 'anderadj', 8, 1, 8);
      END;
   forsubjectiveadj: BEGIN
      STR_Extract(str, l, 'forsubjectiveadj', 16, 1, 16);
      END;
   tosubjectiveadj: BEGIN
      STR_Extract(str, l, 'tosubjectiveadj', 15, 1, 15);
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
   postposition: BEGIN
      STR_Extract(str, l, 'postposition', 12, 1, 12);
      END;
   END;
END {LSTYPETOSTR_adjusetype};


PROCEDURE LSTYPETOSTR_advformationtype( 
         VAR str: STRING;
         VAR l: STR_Range;
         attr : LSDOMAINT_advformationtype         );
BEGIN
   CASE attr OF 
   noAdv: BEGIN
      STR_Extract(str, l, 'noAdv', 5, 1, 5);
      END;
   regAdv: BEGIN
      STR_Extract(str, l, 'regAdv', 6, 1, 6);
      END;
   irregAdv: BEGIN
      STR_Extract(str, l, 'irregAdv', 8, 1, 8);
      END;
   zeroAdv: BEGIN
      STR_Extract(str, l, 'zeroAdv', 7, 1, 7);
      END;
   END;
END {LSTYPETOSTR_advformationtype};


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
   PostXPadv: BEGIN
      STR_Extract(str, l, 'PostXPadv', 9, 1, 9);
      END;
   NumAdv: BEGIN
      STR_Extract(str, l, 'NumAdv', 6, 1, 6);
      END;
   OtherAdv: BEGIN
      STR_Extract(str, l, 'OtherAdv', 8, 1, 8);
      END;
   CausAdv: BEGIN
      STR_Extract(str, l, 'CausAdv', 7, 1, 7);
      END;
   PrepPAdv: BEGIN
      STR_Extract(str, l, 'PrepPAdv', 8, 1, 8);
      END;
   END;
END {LSTYPETOSTR_advsubctype};


PROCEDURE LSTYPETOSTR_affixtype( 
         VAR str: STRING;
         VAR l: STR_Range;
         attr : LSDOMAINT_affixtype         );
BEGIN
   CASE attr OF 
   anti1: BEGIN
      STR_Extract(str, l, 'anti1', 5, 1, 5);
      END;
   anti2: BEGIN
      STR_Extract(str, l, 'anti2', 5, 1, 5);
      END;
   pro: BEGIN
      STR_Extract(str, l, 'pro', 3, 1, 3);
      END;
   re: BEGIN
      STR_Extract(str, l, 're', 2, 1, 2);
      END;
   vice: BEGIN
      STR_Extract(str, l, 'vice', 4, 1, 4);
      END;
   ex: BEGIN
      STR_Extract(str, l, 'ex', 2, 1, 2);
      END;
   hyper: BEGIN
      STR_Extract(str, l, 'hyper', 5, 1, 5);
      END;
   able: BEGIN
      STR_Extract(str, l, 'able', 4, 1, 4);
      END;
   noaffix: BEGIN
      STR_Extract(str, l, 'noaffix', 7, 1, 7);
      END;
   lyaffix: BEGIN
      STR_Extract(str, l, 'lyaffix', 7, 1, 7);
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
   dynstative: BEGIN
      STR_Extract(str, l, 'dynstative', 10, 1, 10);
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


PROCEDURE LSTYPETOSTR_auxtype( 
         VAR str: STRING;
         VAR l: STR_Range;
         attr : LSDOMAINT_auxtype         );
BEGIN
   CASE attr OF 
   aux: BEGIN
      STR_Extract(str, l, 'aux', 3, 1, 3);
      END;
   prog: BEGIN
      STR_Extract(str, l, 'prog', 4, 1, 4);
      END;
   pass: BEGIN
      STR_Extract(str, l, 'pass', 4, 1, 4);
      END;
   END;
END {LSTYPETOSTR_auxtype};


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
   omegacase: BEGIN
      STR_Extract(str, l, 'omegacase', 9, 1, 9);
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
   dynstativeclass: BEGIN
      STR_Extract(str, l, 'dynstativeclass', 15, 1, 15);
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


PROCEDURE LSTYPETOSTR_compformationtype( 
         VAR str: STRING;
         VAR l: STR_Range;
         attr : LSDOMAINT_compformationtype         );
BEGIN
   CASE attr OF 
   regcomp: BEGIN
      STR_Extract(str, l, 'regcomp', 7, 1, 7);
      END;
   cdcomp: BEGIN
      STR_Extract(str, l, 'cdcomp', 6, 1, 6);
      END;
   noComp: BEGIN
      STR_Extract(str, l, 'noComp', 6, 1, 6);
      END;
   moreComp: BEGIN
      STR_Extract(str, l, 'moreComp', 8, 1, 8);
      END;
   irrcomp: BEGIN
      STR_Extract(str, l, 'irrcomp', 7, 1, 7);
      END;
   irrcomp2: BEGIN
      STR_Extract(str, l, 'irrcomp2', 8, 1, 8);
      END;
   irrAdvComp: BEGIN
      STR_Extract(str, l, 'irrAdvComp', 10, 1, 10);
      END;
   END;
END {LSTYPETOSTR_compformationtype};


PROCEDURE LSTYPETOSTR_compformtype( 
         VAR str: STRING;
         VAR l: STR_Range;
         attr : LSDOMAINT_compformtype         );
BEGIN
   CASE attr OF 
   compar: BEGIN
      STR_Extract(str, l, 'compar', 6, 1, 6);
      END;
   super: BEGIN
      STR_Extract(str, l, 'super', 5, 1, 5);
      END;
   basic: BEGIN
      STR_Extract(str, l, 'basic', 5, 1, 5);
      END;
   END;
END {LSTYPETOSTR_compformtype};


PROCEDURE LSTYPETOSTR_complcattype( 
         VAR str: STRING;
         VAR l: STR_Range;
         attr : LSDOMAINT_complcattype         );
BEGIN
   CASE attr OF 
   Vcomplcat: BEGIN
      STR_Extract(str, l, 'Vcomplcat', 9, 1, 9);
      END;
   Ncomplcat: BEGIN
      STR_Extract(str, l, 'Ncomplcat', 9, 1, 9);
      END;
   Acomplcat: BEGIN
      STR_Extract(str, l, 'Acomplcat', 9, 1, 9);
      END;
   Advcomplcat: BEGIN
      STR_Extract(str, l, 'Advcomplcat', 11, 1, 11);
      END;
   END;
END {LSTYPETOSTR_complcattype};


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
   Sfortoc: BEGIN
      STR_Extract(str, l, 'Sfortoc', 7, 1, 7);
      END;
   Sotoc: BEGIN
      STR_Extract(str, l, 'Sotoc', 5, 1, 5);
      END;
   Sctoc: BEGIN
      STR_Extract(str, l, 'Sctoc', 5, 1, 5);
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
   Slets: BEGIN
      STR_Extract(str, l, 'Slets', 5, 1, 5);
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


PROCEDURE LSTYPETOSTR_distritype( 
         VAR str: STRING;
         VAR l: STR_Range;
         attr : LSDOMAINT_distritype         );
BEGIN
   CASE attr OF 
   initial: BEGIN
      STR_Extract(str, l, 'initial', 7, 1, 7);
      END;
   final: BEGIN
      STR_Extract(str, l, 'final', 5, 1, 5);
      END;
   END;
END {LSTYPETOSTR_distritype};


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


PROCEDURE LSTYPETOSTR_gendertype( 
         VAR str: STRING;
         VAR l: STR_Range;
         attr : LSDOMAINT_gendertype         );
BEGIN
   CASE attr OF 
   femininegender: BEGIN
      STR_Extract(str, l, 'femininegender', 14, 1, 14);
      END;
   masculinegender: BEGIN
      STR_Extract(str, l, 'masculinegender', 15, 1, 15);
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


PROCEDURE LSTYPETOSTR_headtype( 
         VAR str: STRING;
         VAR l: STR_Range;
         attr : LSDOMAINT_headtype         );
BEGIN
   CASE attr OF 
   nounhead: BEGIN
      STR_Extract(str, l, 'nounhead', 8, 1, 8);
      END;
   verbhead: BEGIN
      STR_Extract(str, l, 'verbhead', 8, 1, 8);
      END;
   adjhead: BEGIN
      STR_Extract(str, l, 'adjhead', 7, 1, 7);
      END;
   advhead: BEGIN
      STR_Extract(str, l, 'advhead', 7, 1, 7);
      END;
   propernounhead: BEGIN
      STR_Extract(str, l, 'propernounhead', 14, 1, 14);
      END;
   END;
END {LSTYPETOSTR_headtype};


PROCEDURE LSTYPETOSTR_humantype( 
         VAR str: STRING;
         VAR l: STR_Range;
         attr : LSDOMAINT_humantype         );
BEGIN
   CASE attr OF 
   yeshuman: BEGIN
      STR_Extract(str, l, 'yeshuman', 8, 1, 8);
      END;
   nohuman: BEGIN
      STR_Extract(str, l, 'nohuman', 7, 1, 7);
      END;
   omegahuman: BEGIN
      STR_Extract(str, l, 'omegahuman', 10, 1, 10);
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
   toinf: BEGIN
      STR_Extract(str, l, 'toinf', 5, 1, 5);
      END;
   fortoinf: BEGIN
      STR_Extract(str, l, 'fortoinf', 8, 1, 8);
      END;
   accing: BEGIN
      STR_Extract(str, l, 'accing', 6, 1, 6);
      END;
   possing: BEGIN
      STR_Extract(str, l, 'possing', 7, 1, 7);
      END;
   opening: BEGIN
      STR_Extract(str, l, 'opening', 7, 1, 7);
      END;
   omegainf: BEGIN
      STR_Extract(str, l, 'omegainf', 8, 1, 8);
      END;
   END;
END {LSTYPETOSTR_inftype};


PROCEDURE LSTYPETOSTR_ingformtype( 
         VAR str: STRING;
         VAR l: STR_Range;
         attr : LSDOMAINT_ingformtype         );
BEGIN
   CASE attr OF 
   reging: BEGIN
      STR_Extract(str, l, 'reging', 6, 1, 6);
      END;
   cding: BEGIN
      STR_Extract(str, l, 'cding', 5, 1, 5);
      END;
   cdreging: BEGIN
      STR_Extract(str, l, 'cdreging', 8, 1, 8);
      END;
   noing: BEGIN
      STR_Extract(str, l, 'noing', 5, 1, 5);
      END;
   irring: BEGIN
      STR_Extract(str, l, 'irring', 6, 1, 6);
      END;
   END;
END {LSTYPETOSTR_ingformtype};


PROCEDURE LSTYPETOSTR_modustype( 
         VAR str: STRING;
         VAR l: STR_Range;
         attr : LSDOMAINT_modustype         );
BEGIN
   CASE attr OF 
   infinitive: BEGIN
      STR_Extract(str, l, 'infinitive', 10, 1, 10);
      END;
   indicative: BEGIN
      STR_Extract(str, l, 'indicative', 10, 1, 10);
      END;
   imperative: BEGIN
      STR_Extract(str, l, 'imperative', 10, 1, 10);
      END;
   subjunctive: BEGIN
      STR_Extract(str, l, 'subjunctive', 11, 1, 11);
      END;
   ingform: BEGIN
      STR_Extract(str, l, 'ingform', 7, 1, 7);
      END;
   participle: BEGIN
      STR_Extract(str, l, 'participle', 10, 1, 10);
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
   letsmood: BEGIN
      STR_Extract(str, l, 'letsmood', 8, 1, 8);
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
   omegamood: BEGIN
      STR_Extract(str, l, 'omegamood', 9, 1, 9);
      END;
   proobjmod: BEGIN
      STR_Extract(str, l, 'proobjmod', 9, 1, 9);
      END;
   END;
END {LSTYPETOSTR_moodtype};


PROCEDURE LSTYPETOSTR_nounsubctype( 
         VAR str: STRING;
         VAR l: STR_Range;
         attr : LSDOMAINT_nounsubctype         );
BEGIN
   CASE attr OF 
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
   othernoun: BEGIN
      STR_Extract(str, l, 'othernoun', 9, 1, 9);
      END;
   monthnoun: BEGIN
      STR_Extract(str, l, 'monthnoun', 9, 1, 9);
      END;
   daynoun: BEGIN
      STR_Extract(str, l, 'daynoun', 7, 1, 7);
      END;
   clocktimenoun: BEGIN
      STR_Extract(str, l, 'clocktimenoun', 13, 1, 13);
      END;
   othername: BEGIN
      STR_Extract(str, l, 'othername', 9, 1, 9);
      END;
   END;
END {LSTYPETOSTR_nounsubctype};


PROCEDURE LSTYPETOSTR_npheadtype( 
         VAR str: STRING;
         VAR l: STR_Range;
         attr : LSDOMAINT_npheadtype         );
BEGIN
   CASE attr OF 
   thisNP: BEGIN
      STR_Extract(str, l, 'thisNP', 6, 1, 6);
      END;
   thatNP: BEGIN
      STR_Extract(str, l, 'thatNP', 6, 1, 6);
      END;
   theseNP: BEGIN
      STR_Extract(str, l, 'theseNP', 7, 1, 7);
      END;
   thoseNP: BEGIN
      STR_Extract(str, l, 'thoseNP', 7, 1, 7);
      END;
   reflNP: BEGIN
      STR_Extract(str, l, 'reflNP', 6, 1, 6);
      END;
   oneNP: BEGIN
      STR_Extract(str, l, 'oneNP', 5, 1, 5);
      END;
   itNP: BEGIN
      STR_Extract(str, l, 'itNP', 4, 1, 4);
      END;
   whatwhproNP: BEGIN
      STR_Extract(str, l, 'whatwhproNP', 11, 1, 11);
      END;
   sentNP: BEGIN
      STR_Extract(str, l, 'sentNP', 6, 1, 6);
      END;
   openIngNP: BEGIN
      STR_Extract(str, l, 'openIngNP', 9, 1, 9);
      END;
   persproNP: BEGIN
      STR_Extract(str, l, 'persproNP', 9, 1, 9);
      END;
   otherNP: BEGIN
      STR_Extract(str, l, 'otherNP', 7, 1, 7);
      END;
   theyNP: BEGIN
      STR_Extract(str, l, 'theyNP', 6, 1, 6);
      END;
   reciproNP: BEGIN
      STR_Extract(str, l, 'reciproNP', 9, 1, 9);
      END;
   thereNP: BEGIN
      STR_Extract(str, l, 'thereNP', 7, 1, 7);
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


PROCEDURE LSTYPETOSTR_oblcontroltype( 
         VAR str: STRING;
         VAR l: STR_Range;
         attr : LSDOMAINT_oblcontroltype         );
BEGIN
   CASE attr OF 
   yesoblcontrol: BEGIN
      STR_Extract(str, l, 'yesoblcontrol', 13, 1, 13);
      END;
   noOblcontrol: BEGIN
      STR_Extract(str, l, 'noOblcontrol', 12, 1, 12);
      END;
   omegaOblcontrol: BEGIN
      STR_Extract(str, l, 'omegaOblcontrol', 15, 1, 15);
      END;
   END;
END {LSTYPETOSTR_oblcontroltype};


PROCEDURE LSTYPETOSTR_plurformtype( 
         VAR str: STRING;
         VAR l: STR_Range;
         attr : LSDOMAINT_plurformtype         );
BEGIN
   CASE attr OF 
   onlyplur: BEGIN
      STR_Extract(str, l, 'onlyplur', 8, 1, 8);
      END;
   noplur: BEGIN
      STR_Extract(str, l, 'noplur', 6, 1, 6);
      END;
   irrplur: BEGIN
      STR_Extract(str, l, 'irrplur', 7, 1, 7);
      END;
   irrSplur: BEGIN
      STR_Extract(str, l, 'irrSplur', 8, 1, 8);
      END;
   regplur: BEGIN
      STR_Extract(str, l, 'regplur', 7, 1, 7);
      END;
   regEplur: BEGIN
      STR_Extract(str, l, 'regEplur', 8, 1, 8);
      END;
   latplur: BEGIN
      STR_Extract(str, l, 'latplur', 7, 1, 7);
      END;
   voicingplur: BEGIN
      STR_Extract(str, l, 'voicingplur', 11, 1, 11);
      END;
   singandplur: BEGIN
      STR_Extract(str, l, 'singandplur', 11, 1, 11);
      END;
   END;
END {LSTYPETOSTR_plurformtype};


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
   aanto: BEGIN
      STR_Extract(str, l, 'aanto', 5, 1, 5);
      END;
   voorfor: BEGIN
      STR_Extract(str, l, 'voorfor', 7, 1, 7);
      END;
   caus: BEGIN
      STR_Extract(str, l, 'caus', 4, 1, 4);
      END;
   other: BEGIN
      STR_Extract(str, l, 'other', 5, 1, 5);
      END;
   rest: BEGIN
      STR_Extract(str, l, 'rest', 4, 1, 4);
      END;
   END;
END {LSTYPETOSTR_prepsubctype};


PROCEDURE LSTYPETOSTR_reflexivetype( 
         VAR str: STRING;
         VAR l: STR_Range;
         attr : LSDOMAINT_reflexivetype         );
BEGIN
   CASE attr OF 
   notreflexive: BEGIN
      STR_Extract(str, l, 'notreflexive', 12, 1, 12);
      END;
   dobjrefl: BEGIN
      STR_Extract(str, l, 'dobjrefl', 8, 1, 8);
      END;
   indobjrefl: BEGIN
      STR_Extract(str, l, 'indobjrefl', 10, 1, 10);
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


PROCEDURE LSTYPETOSTR_sformtype( 
         VAR str: STRING;
         VAR l: STR_Range;
         attr : LSDOMAINT_sformtype         );
BEGIN
   CASE attr OF 
   regS: BEGIN
      STR_Extract(str, l, 'regS', 4, 1, 4);
      END;
   regEs: BEGIN
      STR_Extract(str, l, 'regEs', 5, 1, 5);
      END;
   noS: BEGIN
      STR_Extract(str, l, 'noS', 3, 1, 3);
      END;
   irrS: BEGIN
      STR_Extract(str, l, 'irrS', 4, 1, 4);
      END;
   END;
END {LSTYPETOSTR_sformtype};


PROCEDURE LSTYPETOSTR_specqtype( 
         VAR str: STRING;
         VAR l: STR_Range;
         attr : LSDOMAINT_specqtype         );
BEGIN
   CASE attr OF 
   yesspec: BEGIN
      STR_Extract(str, l, 'yesspec', 7, 1, 7);
      END;
   nospec: BEGIN
      STR_Extract(str, l, 'nospec', 6, 1, 6);
      END;
   omegaspec: BEGIN
      STR_Extract(str, l, 'omegaspec', 9, 1, 9);
      END;
   END;
END {LSTYPETOSTR_specqtype};


PROCEDURE LSTYPETOSTR_synpatterntype( 
         VAR str: STRING;
         VAR l: STR_Range;
         attr : LSDOMAINT_synpatterntype         );
BEGIN
   CASE attr OF 
   synASIFSENT: BEGIN
      STR_Extract(str, l, 'synASIFSENT', 11, 1, 11);
      END;
   synBE: BEGIN
      STR_Extract(str, l, 'synBE', 5, 1, 5);
      END;
   synCLAUSE: BEGIN
      STR_Extract(str, l, 'synCLAUSE', 9, 1, 9);
      END;
   synCLOSEDADJPPROP: BEGIN
      STR_Extract(str, l, 'synCLOSEDADJPPROP', 17, 1, 17);
      END;
   synCLOSEDADJPPROP_EMPTY: BEGIN
      STR_Extract(str, l, 'synCLOSEDADJPPROP_EMPTY', 23, 1, 23);
      END;
   synCLOSEDADJPPROP_PREPNP: BEGIN
      STR_Extract(str, l, 'synCLOSEDADJPPROP_PREPNP', 24, 1, 24);
      END;
   synCLOSEDGERUND: BEGIN
      STR_Extract(str, l, 'synCLOSEDGERUND', 15, 1, 15);
      END;
   synCLOSEDINFSENT: BEGIN
      STR_Extract(str, l, 'synCLOSEDINFSENT', 16, 1, 16);
      END;
   synCLOSEDNPPROP: BEGIN
      STR_Extract(str, l, 'synCLOSEDNPPROP', 15, 1, 15);
      END;
   synCLOSEDNPPROP_EMPTY: BEGIN
      STR_Extract(str, l, 'synCLOSEDNPPROP_EMPTY', 21, 1, 21);
      END;
   synCLOSEDNPPROP_PREPNP: BEGIN
      STR_Extract(str, l, 'synCLOSEDNPPROP_PREPNP', 22, 1, 22);
      END;
   synCLOSEDTOSENT: BEGIN
      STR_Extract(str, l, 'synCLOSEDTOSENT', 15, 1, 15);
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
   synDONP_EMPTY: BEGIN
      STR_Extract(str, l, 'synDONP_EMPTY', 13, 1, 13);
      END;
   synDONP_LOCOPENPREPPPROP: BEGIN
      STR_Extract(str, l, 'synDONP_LOCOPENPREPPPROP', 24, 1, 24);
      END;
   synDONP_OPENADJPPROP: BEGIN
      STR_Extract(str, l, 'synDONP_OPENADJPPROP', 20, 1, 20);
      END;
   synDONP_OPENGERUND: BEGIN
      STR_Extract(str, l, 'synDONP_OPENGERUND', 18, 1, 18);
      END;
   synDONP_OPENNPPROP: BEGIN
      STR_Extract(str, l, 'synDONP_OPENNPPROP', 18, 1, 18);
      END;
   synDONP_OPENTOSENT: BEGIN
      STR_Extract(str, l, 'synDONP_OPENTOSENT', 18, 1, 18);
      END;
   synDONP_OTHEROPENPREPPPROP: BEGIN
      STR_Extract(str, l, 'synDONP_OTHEROPENPREPPPROP', 26, 1, 26);
      END;
   synDONP_PREPNP: BEGIN
      STR_Extract(str, l, 'synDONP_PREPNP', 14, 1, 14);
      END;
   synDONP_PREPOPENADJPPROP: BEGIN
      STR_Extract(str, l, 'synDONP_PREPOPENADJPPROP', 24, 1, 24);
      END;
   synDONP_PREPOPENGERUND: BEGIN
      STR_Extract(str, l, 'synDONP_PREPOPENGERUND', 22, 1, 22);
      END;
   synDONP_PREPOPENNPPROP: BEGIN
      STR_Extract(str, l, 'synDONP_PREPOPENNPPROP', 22, 1, 22);
      END;
   synDONP_PREPOTHEROPENPREPPPROP: BEGIN
      STR_Extract(str, l, 'synDONP_PREPOTHEROPENPREPPPROP', 30, 1, 30);
      END;
   synDONP_PREPQSENT: BEGIN
      STR_Extract(str, l, 'synDONP_PREPQSENT', 17, 1, 17);
      END;
   synDONP_PROSENT: BEGIN
      STR_Extract(str, l, 'synDONP_PROSENT', 15, 1, 15);
      END;
   synDONP_QSENT: BEGIN
      STR_Extract(str, l, 'synDONP_QSENT', 13, 1, 13);
      END;
   synDONP_THATSENT: BEGIN
      STR_Extract(str, l, 'synDONP_THATSENT', 16, 1, 16);
      END;
   synEMPTY: BEGIN
      STR_Extract(str, l, 'synEMPTY', 8, 1, 8);
      END;
   synEMPTY_DONP: BEGIN
      STR_Extract(str, l, 'synEMPTY_DONP', 13, 1, 13);
      END;
   synEMPTY_CLOSEDTOSENT: BEGIN
      STR_Extract(str, l, 'synEMPTY_CLOSEDTOSENT', 21, 1, 21);
      END;
   synEMPTY_MEASUREPHRASE: BEGIN
      STR_Extract(str, l, 'synEMPTY_MEASUREPHRASE', 22, 1, 22);
      END;
   synEMPTY_OPENGERUND: BEGIN
      STR_Extract(str, l, 'synEMPTY_OPENGERUND', 19, 1, 19);
      END;
   synEMPTY_OPENTOSENT: BEGIN
      STR_Extract(str, l, 'synEMPTY_OPENTOSENT', 19, 1, 19);
      END;
   synEMPTY_PREPOPENGERUND: BEGIN
      STR_Extract(str, l, 'synEMPTY_PREPOPENGERUND', 23, 1, 23);
      END;
   synEMPTY_PROSENT: BEGIN
      STR_Extract(str, l, 'synEMPTY_PROSENT', 16, 1, 16);
      END;
   synEMPTY_PREPNP: BEGIN
      STR_Extract(str, l, 'synEMPTY_PREPNP', 15, 1, 15);
      END;
   synEMPTY_PREP2NP: BEGIN
      STR_Extract(str, l, 'synEMPTY_PREP2NP', 16, 1, 16);
      END;
   synEMPTY_QSENT: BEGIN
      STR_Extract(str, l, 'synEMPTY_QSENT', 14, 1, 14);
      END;
   synEMPTY_THATSENT: BEGIN
      STR_Extract(str, l, 'synEMPTY_THATSENT', 17, 1, 17);
      END;
   synFOREMPTY: BEGIN
      STR_Extract(str, l, 'synFOREMPTY', 11, 1, 11);
      END;
   synFORTOSENT: BEGIN
      STR_Extract(str, l, 'synFORTOSENT', 12, 1, 12);
      END;
   synFRONTSOPROSENT: BEGIN
      STR_Extract(str, l, 'synFRONTSOPROSENT', 17, 1, 17);
      END;
   synIOEMPTY_DONP: BEGIN
      STR_Extract(str, l, 'synIOEMPTY_DONP', 15, 1, 15);
      END;
   synIOEMPTY_THATSENT: BEGIN
      STR_Extract(str, l, 'synIOEMPTY_THATSENT', 19, 1, 19);
      END;
   synIOEMPTY_QSENT: BEGIN
      STR_Extract(str, l, 'synIOEMPTY_QSENT', 16, 1, 16);
      END;
   synIONP_DONP: BEGIN
      STR_Extract(str, l, 'synIONP_DONP', 12, 1, 12);
      END;
   synIONP_EMPTY: BEGIN
      STR_Extract(str, l, 'synIONP_EMPTY', 13, 1, 13);
      END;
   synIONP_MEASUREPHRASE: BEGIN
      STR_Extract(str, l, 'synIONP_MEASUREPHRASE', 21, 1, 21);
      END;
   synIONP_OPENINFSENT: BEGIN
      STR_Extract(str, l, 'synIONP_OPENINFSENT', 19, 1, 19);
      END;
   synIONP_OPENNPPROP: BEGIN
      STR_Extract(str, l, 'synIONP_OPENNPPROP', 18, 1, 18);
      END;
   synIONP_OPENTOSENT: BEGIN
      STR_Extract(str, l, 'synIONP_OPENTOSENT', 18, 1, 18);
      END;
   synIONP_PREPCLOSEDADJPPROP: BEGIN
      STR_Extract(str, l, 'synIONP_PREPCLOSEDADJPPROP', 26, 1, 26);
      END;
   synIONP_PREPNP: BEGIN
      STR_Extract(str, l, 'synIONP_PREPNP', 14, 1, 14);
      END;
   synIONP_PREPOPENGERUND: BEGIN
      STR_Extract(str, l, 'synIONP_PREPOPENGERUND', 22, 1, 22);
      END;
   synIONP_PROSENT: BEGIN
      STR_Extract(str, l, 'synIONP_PROSENT', 15, 1, 15);
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
   synITTHATSENT: BEGIN
      STR_Extract(str, l, 'synITTHATSENT', 13, 1, 13);
      END;
   synLOCCLOSEDPREPPPROP: BEGIN
      STR_Extract(str, l, 'synLOCCLOSEDPREPPPROP', 21, 1, 21);
      END;
   synLOCEMPTY: BEGIN
      STR_Extract(str, l, 'synLOCEMPTY', 11, 1, 11);
      END;
   synLOCOPENPREPPPROP: BEGIN
      STR_Extract(str, l, 'synLOCOPENPREPPPROP', 19, 1, 19);
      END;
   synLOCPREPP: BEGIN
      STR_Extract(str, l, 'synLOCPREPP', 11, 1, 11);
      END;
   synMEASUREPHRASE: BEGIN
      STR_Extract(str, l, 'synMEASUREPHRASE', 16, 1, 16);
      END;
   synNOTPROSENT: BEGIN
      STR_Extract(str, l, 'synNOTPROSENT', 13, 1, 13);
      END;
   synNoVpArgs: BEGIN
      STR_Extract(str, l, 'synNoVpArgs', 11, 1, 11);
      END;
   synNP: BEGIN
      STR_Extract(str, l, 'synNP', 5, 1, 5);
      END;
   synnoadjpargs: BEGIN
      STR_Extract(str, l, 'synnoadjpargs', 13, 1, 13);
      END;
   synOPENADJPPROP: BEGIN
      STR_Extract(str, l, 'synOPENADJPPROP', 15, 1, 15);
      END;
   synOPENGERUND: BEGIN
      STR_Extract(str, l, 'synOPENGERUND', 13, 1, 13);
      END;
   synOPENGERUND_PREPNP: BEGIN
      STR_Extract(str, l, 'synOPENGERUND_PREPNP', 20, 1, 20);
      END;
   synOPENINFSENT: BEGIN
      STR_Extract(str, l, 'synOPENINFSENT', 14, 1, 14);
      END;
   synOPENTOINFSENTPROOBJ: BEGIN
      STR_Extract(str, l, 'synOPENTOINFSENTPROOBJ', 22, 1, 22);
      END;
   synOPENNPPROP: BEGIN
      STR_Extract(str, l, 'synOPENNPPROP', 13, 1, 13);
      END;
   synOPENTOSENT: BEGIN
      STR_Extract(str, l, 'synOPENTOSENT', 13, 1, 13);
      END;
   synOPENVERBPPROP: BEGIN
      STR_Extract(str, l, 'synOPENVERBPPROP', 16, 1, 16);
      END;
   synOTHERCLOSEDPREPPPROP: BEGIN
      STR_Extract(str, l, 'synOTHERCLOSEDPREPPPROP', 23, 1, 23);
      END;
   synOTHERCLOSEDPREPPPROP_EMPTY: BEGIN
      STR_Extract(str, l, 'synOTHERCLOSEDPREPPPROP_EMPTY', 29, 1, 29);
      END;
   synOTHERCLOSEDPREPPPROP_PREPNP: BEGIN
      STR_Extract(str, l, 'synOTHERCLOSEDPREPPPROP_PREPNP', 30, 1, 30);
      END;
   synOTHEROPENPREPPPROP: BEGIN
      STR_Extract(str, l, 'synOTHEROPENPREPPPROP', 21, 1, 21);
      END;
   synPREPCLOSEDADJPPROP: BEGIN
      STR_Extract(str, l, 'synPREPCLOSEDADJPPROP', 21, 1, 21);
      END;
   synPREPCLOSEDGERUND: BEGIN
      STR_Extract(str, l, 'synPREPCLOSEDGERUND', 19, 1, 19);
      END;
   synPREPCLOSEDNPPROP: BEGIN
      STR_Extract(str, l, 'synPREPCLOSEDNPPROP', 19, 1, 19);
      END;
   synPREPCLOSEDTOSENT: BEGIN
      STR_Extract(str, l, 'synPREPCLOSEDTOSENT', 19, 1, 19);
      END;
   synPREPEMPTY: BEGIN
      STR_Extract(str, l, 'synPREPEMPTY', 12, 1, 12);
      END;
   synPREPMEASUREPHRASE: BEGIN
      STR_Extract(str, l, 'synPREPMEASUREPHRASE', 20, 1, 20);
      END;
   synPREPNP: BEGIN
      STR_Extract(str, l, 'synPREPNP', 9, 1, 9);
      END;
   synPREPNP_CLOSEDTOSENT: BEGIN
      STR_Extract(str, l, 'synPREPNP_CLOSEDTOSENT', 22, 1, 22);
      END;
   synPREPNP_EMPTY: BEGIN
      STR_Extract(str, l, 'synPREPNP_EMPTY', 15, 1, 15);
      END;
   synPREPNP_ITOPENTOSENT: BEGIN
      STR_Extract(str, l, 'synPREPNP_ITOPENTOSENT', 22, 1, 22);
      END;
   synPREPNP_OPENTOSENT: BEGIN
      STR_Extract(str, l, 'synPREPNP_OPENTOSENT', 20, 1, 20);
      END;
   synPREPNP_PREPNP: BEGIN
      STR_Extract(str, l, 'synPREPNP_PREPNP', 16, 1, 16);
      END;
   synPREPNP_PREPOPENGERUND: BEGIN
      STR_Extract(str, l, 'synPREPNP_PREPOPENGERUND', 24, 1, 24);
      END;
   synPREPNP_QSENT: BEGIN
      STR_Extract(str, l, 'synPREPNP_QSENT', 15, 1, 15);
      END;
   synPREPNP_THATSENT: BEGIN
      STR_Extract(str, l, 'synPREPNP_THATSENT', 18, 1, 18);
      END;
   synPREPOPENGERUND: BEGIN
      STR_Extract(str, l, 'synPREPOPENGERUND', 17, 1, 17);
      END;
   synPREPOPENNPPROP: BEGIN
      STR_Extract(str, l, 'synPREPOPENNPPROP', 17, 1, 17);
      END;
   synPREPOTHERCLOSEDPREPPPROP: BEGIN
      STR_Extract(str, l, 'synPREPOTHERCLOSEDPREPPPROP', 27, 1, 27);
      END;
   synPREPOPENTOSENT: BEGIN
      STR_Extract(str, l, 'synPREPOPENTOSENT', 17, 1, 17);
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
   synSOPROSENT_EMPTY: BEGIN
      STR_Extract(str, l, 'synSOPROSENT_EMPTY', 18, 1, 18);
      END;
   synSOPROSENT_PREPNP: BEGIN
      STR_Extract(str, l, 'synSOPROSENT_PREPNP', 19, 1, 19);
      END;
   synTHATSENT: BEGIN
      STR_Extract(str, l, 'synTHATSENT', 11, 1, 11);
      END;
   synTHATSENT_EMPTY: BEGIN
      STR_Extract(str, l, 'synTHATSENT_EMPTY', 17, 1, 17);
      END;
   synTHATSENT_LOCOPENPREPPPROP: BEGIN
      STR_Extract(str, l, 'synTHATSENT_LOCOPENPREPPPROP', 28, 1, 28);
      END;
   synTONP: BEGIN
      STR_Extract(str, l, 'synTONP', 7, 1, 7);
      END;
   synTONP_DONP: BEGIN
      STR_Extract(str, l, 'synTONP_DONP', 12, 1, 12);
      END;
   synTONP_THATSENT: BEGIN
      STR_Extract(str, l, 'synTONP_THATSENT', 16, 1, 16);
      END;
   synTONP_QSENT: BEGIN
      STR_Extract(str, l, 'synTONP_QSENT', 13, 1, 13);
      END;
   synVERBPPROP: BEGIN
      STR_Extract(str, l, 'synVERBPPROP', 12, 1, 12);
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
   synDONP_OPENINFSENT: BEGIN
      STR_Extract(str, l, 'synDONP_OPENINFSENT', 19, 1, 19);
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
   pastfuttense: BEGIN
      STR_Extract(str, l, 'pastfuttense', 12, 1, 12);
      END;
   presfuttense: BEGIN
      STR_Extract(str, l, 'presfuttense', 12, 1, 12);
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
   thancompl: BEGIN
      STR_Extract(str, l, 'thancompl', 9, 1, 9);
      END;
   ascompl: BEGIN
      STR_Extract(str, l, 'ascompl', 7, 1, 7);
      END;
   tocompl: BEGIN
      STR_Extract(str, l, 'tocompl', 7, 1, 7);
      END;
   thatcompl: BEGIN
      STR_Extract(str, l, 'thatcompl', 9, 1, 9);
      END;
   ofcompl: BEGIN
      STR_Extract(str, l, 'ofcompl', 7, 1, 7);
      END;
   END;
END {LSTYPETOSTR_thanascompltype};


PROCEDURE LSTYPETOSTR_thatdeltype( 
         VAR str: STRING;
         VAR l: STR_Range;
         attr : LSDOMAINT_thatdeltype         );
BEGIN
   CASE attr OF 
   yesdel: BEGIN
      STR_Extract(str, l, 'yesdel', 6, 1, 6);
      END;
   nodel: BEGIN
      STR_Extract(str, l, 'nodel', 5, 1, 5);
      END;
   omegadel: BEGIN
      STR_Extract(str, l, 'omegadel', 8, 1, 8);
      END;
   END;
END {LSTYPETOSTR_thatdeltype};


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
   adjp010: BEGIN
      STR_Extract(str, l, 'adjp010', 7, 1, 7);
      END;
   adjp120: BEGIN
      STR_Extract(str, l, 'adjp120', 7, 1, 7);
      END;
   adjp012: BEGIN
      STR_Extract(str, l, 'adjp012', 7, 1, 7);
      END;
   adjp123: BEGIN
      STR_Extract(str, l, 'adjp123', 7, 1, 7);
      END;
   END;
END {LSTYPETOSTR_thetaadjtype};


PROCEDURE LSTYPETOSTR_thetaadvtype( 
         VAR str: STRING;
         VAR l: STR_Range;
         attr : LSDOMAINT_thetaadvtype         );
BEGIN
   CASE attr OF 
   omegathetaadvp: BEGIN
      STR_Extract(str, l, 'omegathetaadvp', 14, 1, 14);
      END;
   advp000: BEGIN
      STR_Extract(str, l, 'advp000', 7, 1, 7);
      END;
   advp100: BEGIN
      STR_Extract(str, l, 'advp100', 7, 1, 7);
      END;
   advp120: BEGIN
      STR_Extract(str, l, 'advp120', 7, 1, 7);
      END;
   advp123: BEGIN
      STR_Extract(str, l, 'advp123', 7, 1, 7);
      END;
   advp010: BEGIN
      STR_Extract(str, l, 'advp010', 7, 1, 7);
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
   np000: BEGIN
      STR_Extract(str, l, 'np000', 5, 1, 5);
      END;
   np100: BEGIN
      STR_Extract(str, l, 'np100', 5, 1, 5);
      END;
   np120: BEGIN
      STR_Extract(str, l, 'np120', 5, 1, 5);
      END;
   np123: BEGIN
      STR_Extract(str, l, 'np123', 5, 1, 5);
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
   pp120: BEGIN
      STR_Extract(str, l, 'pp120', 5, 1, 5);
      END;
   pp123: BEGIN
      STR_Extract(str, l, 'pp123', 5, 1, 5);
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
   vp132: BEGIN
      STR_Extract(str, l, 'vp132', 5, 1, 5);
      END;
   thetavpaux: BEGIN
      STR_Extract(str, l, 'thetavpaux', 10, 1, 10);
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


PROCEDURE LSTYPETOSTR_verbsubctype( 
         VAR str: STRING;
         VAR l: STR_Range;
         attr : LSDOMAINT_verbsubctype         );
BEGIN
   CASE attr OF 
   mainverb: BEGIN
      STR_Extract(str, l, 'mainverb', 8, 1, 8);
      END;
   modalverb: BEGIN
      STR_Extract(str, l, 'modalverb', 9, 1, 9);
      END;
   doaux: BEGIN
      STR_Extract(str, l, 'doaux', 5, 1, 5);
      END;
   beverb: BEGIN
      STR_Extract(str, l, 'beverb', 6, 1, 6);
      END;
   haveverb: BEGIN
      STR_Extract(str, l, 'haveverb', 8, 1, 8);
      END;
   notaux: BEGIN
      STR_Extract(str, l, 'notaux', 6, 1, 6);
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
   Omegavoice: BEGIN
      STR_Extract(str, l, 'Omegavoice', 10, 1, 10);
      END;
   END;
END {LSTYPETOSTR_voicetype};


PROCEDURE LSTYPETOSTR_xpmoodtype( 
         VAR str: STRING;
         VAR l: STR_Range;
         attr : LSDOMAINT_xpmoodtype         );
BEGIN
   CASE attr OF 
   wh: BEGIN
      STR_Extract(str, l, 'wh', 2, 1, 2);
      END;
   nowh: BEGIN
      STR_Extract(str, l, 'nowh', 4, 1, 4);
      END;
   relativexpmood: BEGIN
      STR_Extract(str, l, 'relativexpmood', 14, 1, 14);
      END;
   topicmood: BEGIN
      STR_Extract(str, l, 'topicmood', 9, 1, 9);
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


PROCEDURE LSTYPETOSTR_positiontype( 
         VAR str: STRING;
         VAR l: STR_Range;
         attr : LSDOMAINT_positiontype         );
BEGIN
   STR_IntegerToStr(attr, str, l);
END {LSTYPETOSTR_positiontype};


PROCEDURE LSTYPETOSTR_valuetype( 
         VAR str: STRING;
         VAR l: STR_Range;
         attr : LSDOMAINT_valuetype         );
BEGIN
   STR_IntegerToStr(attr, str, l);
END {LSTYPETOSTR_valuetype};



