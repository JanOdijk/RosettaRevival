pragma C_include('strings.pf');
Export(LSSTRTOTYPE);
pragma C_include('lsdomaint.pf');
pragma C_include('str.pf');
pragma C_include('lsstrtotype.pf');

PROGRAM LSSTRTOTYPE;

WITH LSDOMAINT, STR, STRINGS;

FUNCTION LSSTRTOTYPE_adjadvformtype( 
         CONST str: STRING;
         l: STR_Range;
         VAR attr : LSDOMAINT_adjadvformtype         ): BOOLEAN;
VAR found: BOOLEAN;
BEGIN
   found := FALSE;
   IF FALSE THEN BEGIN
      END
   ELSE IF STR_Compare(str, l, 'positive',8) = 0 THEN BEGIN
       attr := positive;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'sPositive',9) = 0 THEN BEGIN
       attr := sPositive;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'comparative',11) = 0 THEN BEGIN
       attr := comparative;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'sComparative',12) = 0 THEN BEGIN
       attr := sComparative;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'superlative',11) = 0 THEN BEGIN
       attr := superlative;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'allerSuperlative',16) = 0 THEN BEGIN
       attr := allerSuperlative;
       found := TRUE
       END;
   LSSTRTOTYPE_adjadvformtype := found;
END {LSSTRTOTYPE_adjadvformtype};


FUNCTION LSSTRTOTYPE_adjsubctype( 
         CONST str: STRING;
         l: STR_Range;
         VAR attr : LSDOMAINT_adjsubctype         ): BOOLEAN;
VAR found: BOOLEAN;
BEGIN
   found := FALSE;
   IF FALSE THEN BEGIN
      END
   ELSE IF STR_Compare(str, l, 'coloradj',8) = 0 THEN BEGIN
       attr := coloradj;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'modaladj',8) = 0 THEN BEGIN
       attr := modaladj;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'measureadj',10) = 0 THEN BEGIN
       attr := measureadj;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'subjectiveadj',13) = 0 THEN BEGIN
       attr := subjectiveadj;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'voorsubjectiveadj',17) = 0 THEN BEGIN
       attr := voorsubjectiveadj;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'substanceadj',12) = 0 THEN BEGIN
       attr := substanceadj;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'anderadj',8) = 0 THEN BEGIN
       attr := anderadj;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'otheradj',8) = 0 THEN BEGIN
       attr := otheradj;
       found := TRUE
       END;
   LSSTRTOTYPE_adjsubctype := found;
END {LSSTRTOTYPE_adjsubctype};


FUNCTION LSSTRTOTYPE_adjuncttype( 
         CONST str: STRING;
         l: STR_Range;
         VAR attr : LSDOMAINT_adjuncttype         ): BOOLEAN;
VAR found: BOOLEAN;
BEGIN
   found := FALSE;
   IF FALSE THEN BEGIN
      END
   ELSE IF STR_Compare(str, l, 'ResAP',5) = 0 THEN BEGIN
       attr := ResAP;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'ResPP',5) = 0 THEN BEGIN
       attr := ResPP;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'SubjComit',9) = 0 THEN BEGIN
       attr := SubjComit;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'ObjComit',8) = 0 THEN BEGIN
       attr := ObjComit;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'BenfactNP',9) = 0 THEN BEGIN
       attr := BenfactNP;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'BenfactPP',9) = 0 THEN BEGIN
       attr := BenfactPP;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'LocAdjunct',10) = 0 THEN BEGIN
       attr := LocAdjunct;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'DirAdjunct',10) = 0 THEN BEGIN
       attr := DirAdjunct;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'ResNP',5) = 0 THEN BEGIN
       attr := ResNP;
       found := TRUE
       END;
   LSSTRTOTYPE_adjuncttype := found;
END {LSSTRTOTYPE_adjuncttype};


FUNCTION LSSTRTOTYPE_adjusetype( 
         CONST str: STRING;
         l: STR_Range;
         VAR attr : LSDOMAINT_adjusetype         ): BOOLEAN;
VAR found: BOOLEAN;
BEGIN
   found := FALSE;
   IF FALSE THEN BEGIN
      END
   ELSE IF STR_Compare(str, l, 'attributive',11) = 0 THEN BEGIN
       attr := attributive;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'predicative',11) = 0 THEN BEGIN
       attr := predicative;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'nominalised',11) = 0 THEN BEGIN
       attr := nominalised;
       found := TRUE
       END;
   LSSTRTOTYPE_adjusetype := found;
END {LSSTRTOTYPE_adjusetype};


FUNCTION LSSTRTOTYPE_advsubctype( 
         CONST str: STRING;
         l: STR_Range;
         VAR attr : LSDOMAINT_advsubctype         ): BOOLEAN;
VAR found: BOOLEAN;
BEGIN
   found := FALSE;
   IF FALSE THEN BEGIN
      END
   ELSE IF STR_Compare(str, l, 'SentAdv',7) = 0 THEN BEGIN
       attr := SentAdv;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'SubjVPAdv',9) = 0 THEN BEGIN
       attr := SubjVPAdv;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'AgVPAdv',7) = 0 THEN BEGIN
       attr := AgVPAdv;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'VPAdv',5) = 0 THEN BEGIN
       attr := VPAdv;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'Locadv',6) = 0 THEN BEGIN
       attr := Locadv;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'DirAdv',6) = 0 THEN BEGIN
       attr := DirAdv;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'TempAdv',7) = 0 THEN BEGIN
       attr := TempAdv;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'AdjAdv',6) = 0 THEN BEGIN
       attr := AdjAdv;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'DegreeAdv',9) = 0 THEN BEGIN
       attr := DegreeAdv;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'PreXPAdv',8) = 0 THEN BEGIN
       attr := PreXPAdv;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'causadv',7) = 0 THEN BEGIN
       attr := causadv;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'PREPPAdv',8) = 0 THEN BEGIN
       attr := PREPPAdv;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'NumAdv',6) = 0 THEN BEGIN
       attr := NumAdv;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'OtherAdv',8) = 0 THEN BEGIN
       attr := OtherAdv;
       found := TRUE
       END;
   LSSTRTOTYPE_advsubctype := found;
END {LSSTRTOTYPE_advsubctype};


FUNCTION LSSTRTOTYPE_affixtype( 
         CONST str: STRING;
         l: STR_Range;
         VAR attr : LSDOMAINT_affixtype         ): BOOLEAN;
VAR found: BOOLEAN;
BEGIN
   found := FALSE;
   IF FALSE THEN BEGIN
      END
   ELSE IF STR_Compare(str, l, 'partaffix',9) = 0 THEN BEGIN
       attr := partaffix;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'exaffix',7) = 0 THEN BEGIN
       attr := exaffix;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'hyperaffix',10) = 0 THEN BEGIN
       attr := hyperaffix;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'viceaffix',9) = 0 THEN BEGIN
       attr := viceaffix;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'antiaffix',9) = 0 THEN BEGIN
       attr := antiaffix;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'proaffix',8) = 0 THEN BEGIN
       attr := proaffix;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'onaffix',7) = 0 THEN BEGIN
       attr := onaffix;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'achtigaffix',11) = 0 THEN BEGIN
       attr := achtigaffix;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'dimaffix',8) = 0 THEN BEGIN
       attr := dimaffix;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'noaffix',7) = 0 THEN BEGIN
       attr := noaffix;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'advaffix',8) = 0 THEN BEGIN
       attr := advaffix;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'ordaffix',8) = 0 THEN BEGIN
       attr := ordaffix;
       found := TRUE
       END;
   LSSTRTOTYPE_affixtype := found;
END {LSSTRTOTYPE_affixtype};


FUNCTION LSSTRTOTYPE_aktionsarttype( 
         CONST str: STRING;
         l: STR_Range;
         VAR attr : LSDOMAINT_aktionsarttype         ): BOOLEAN;
VAR found: BOOLEAN;
BEGIN
   found := FALSE;
   IF FALSE THEN BEGIN
      END
   ELSE IF STR_Compare(str, l, 'stative',7) = 0 THEN BEGIN
       attr := stative;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'activity',8) = 0 THEN BEGIN
       attr := activity;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'accomplishment',14) = 0 THEN BEGIN
       attr := accomplishment;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'achievement',11) = 0 THEN BEGIN
       attr := achievement;
       found := TRUE
       END;
   LSSTRTOTYPE_aktionsarttype := found;
END {LSSTRTOTYPE_aktionsarttype};


FUNCTION LSSTRTOTYPE_animatetype( 
         CONST str: STRING;
         l: STR_Range;
         VAR attr : LSDOMAINT_animatetype         ): BOOLEAN;
VAR found: BOOLEAN;
BEGIN
   found := FALSE;
   IF FALSE THEN BEGIN
      END
   ELSE IF STR_Compare(str, l, 'yesanimate',10) = 0 THEN BEGIN
       attr := yesanimate;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'noanimate',9) = 0 THEN BEGIN
       attr := noanimate;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'omegaAnimate',12) = 0 THEN BEGIN
       attr := omegaAnimate;
       found := TRUE
       END;
   LSSTRTOTYPE_animatetype := found;
END {LSSTRTOTYPE_animatetype};


FUNCTION LSSTRTOTYPE_antecedenttype( 
         CONST str: STRING;
         l: STR_Range;
         VAR attr : LSDOMAINT_antecedenttype         ): BOOLEAN;
VAR found: BOOLEAN;
BEGIN
   found := FALSE;
   IF FALSE THEN BEGIN
      END
   ELSE IF STR_Compare(str, l, 'subjectant',10) = 0 THEN BEGIN
       attr := subjectant;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'objectant',9) = 0 THEN BEGIN
       attr := objectant;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'indobjant',9) = 0 THEN BEGIN
       attr := indobjant;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'noant',5) = 0 THEN BEGIN
       attr := noant;
       found := TRUE
       END;
   LSSTRTOTYPE_antecedenttype := found;
END {LSSTRTOTYPE_antecedenttype};


FUNCTION LSSTRTOTYPE_aspecttype( 
         CONST str: STRING;
         l: STR_Range;
         VAR attr : LSDOMAINT_aspecttype         ): BOOLEAN;
VAR found: BOOLEAN;
BEGIN
   found := FALSE;
   IF FALSE THEN BEGIN
      END
   ELSE IF STR_Compare(str, l, 'habitual',8) = 0 THEN BEGIN
       attr := habitual;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'imperfective',12) = 0 THEN BEGIN
       attr := imperfective;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'perfective',10) = 0 THEN BEGIN
       attr := perfective;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'omegaAspect',11) = 0 THEN BEGIN
       attr := omegaAspect;
       found := TRUE
       END;
   LSSTRTOTYPE_aspecttype := found;
END {LSSTRTOTYPE_aspecttype};


FUNCTION LSSTRTOTYPE_casetype( 
         CONST str: STRING;
         l: STR_Range;
         VAR attr : LSDOMAINT_casetype         ): BOOLEAN;
VAR found: BOOLEAN;
BEGIN
   found := FALSE;
   IF FALSE THEN BEGIN
      END
   ELSE IF STR_Compare(str, l, 'nominative',10) = 0 THEN BEGIN
       attr := nominative;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'dative',6) = 0 THEN BEGIN
       attr := dative;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'accusative',10) = 0 THEN BEGIN
       attr := accusative;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'genitive',8) = 0 THEN BEGIN
       attr := genitive;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'Rcase',5) = 0 THEN BEGIN
       attr := Rcase;
       found := TRUE
       END;
   LSSTRTOTYPE_casetype := found;
END {LSSTRTOTYPE_casetype};


FUNCTION LSSTRTOTYPE_classtype( 
         CONST str: STRING;
         l: STR_Range;
         VAR attr : LSDOMAINT_classtype         ): BOOLEAN;
VAR found: BOOLEAN;
BEGIN
   found := FALSE;
   IF FALSE THEN BEGIN
      END
   ELSE IF STR_Compare(str, l, 'stativeclass',12) = 0 THEN BEGIN
       attr := stativeclass;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'movementclass',13) = 0 THEN BEGIN
       attr := movementclass;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'durativeclass',13) = 0 THEN BEGIN
       attr := durativeclass;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'momentaryclass',14) = 0 THEN BEGIN
       attr := momentaryclass;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'iterativeclass',14) = 0 THEN BEGIN
       attr := iterativeclass;
       found := TRUE
       END;
   LSSTRTOTYPE_classtype := found;
END {LSSTRTOTYPE_classtype};


FUNCTION LSSTRTOTYPE_comparativetype( 
         CONST str: STRING;
         l: STR_Range;
         VAR attr : LSDOMAINT_comparativetype         ): BOOLEAN;
VAR found: BOOLEAN;
BEGIN
   found := FALSE;
   IF FALSE THEN BEGIN
      END
   ELSE IF STR_Compare(str, l, 'erComp',6) = 0 THEN BEGIN
       attr := erComp;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'erIrregComp',11) = 0 THEN BEGIN
       attr := erIrregComp;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'meerComp',8) = 0 THEN BEGIN
       attr := meerComp;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'NoComp',6) = 0 THEN BEGIN
       attr := NoComp;
       found := TRUE
       END;
   LSSTRTOTYPE_comparativetype := found;
END {LSSTRTOTYPE_comparativetype};


FUNCTION LSSTRTOTYPE_controllertype( 
         CONST str: STRING;
         l: STR_Range;
         VAR attr : LSDOMAINT_controllertype         ): BOOLEAN;
VAR found: BOOLEAN;
BEGIN
   found := FALSE;
   IF FALSE THEN BEGIN
      END
   ELSE IF STR_Compare(str, l, 'subject',7) = 0 THEN BEGIN
       attr := subject;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'object',6) = 0 THEN BEGIN
       attr := object;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'indobj',6) = 0 THEN BEGIN
       attr := indobj;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'prepobj',7) = 0 THEN BEGIN
       attr := prepobj;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'none',4) = 0 THEN BEGIN
       attr := none;
       found := TRUE
       END;
   LSSTRTOTYPE_controllertype := found;
END {LSSTRTOTYPE_controllertype};


FUNCTION LSSTRTOTYPE_coordkindtype( 
         CONST str: STRING;
         l: STR_Range;
         VAR attr : LSDOMAINT_coordkindtype         ): BOOLEAN;
VAR found: BOOLEAN;
BEGIN
   found := FALSE;
   IF FALSE THEN BEGIN
      END
   ELSE IF STR_Compare(str, l, 'simple',6) = 0 THEN BEGIN
       attr := simple;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'correlative1',12) = 0 THEN BEGIN
       attr := correlative1;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'correlative2',12) = 0 THEN BEGIN
       attr := correlative2;
       found := TRUE
       END;
   LSSTRTOTYPE_coordkindtype := found;
END {LSSTRTOTYPE_coordkindtype};


FUNCTION LSSTRTOTYPE_coordpatterntype( 
         CONST str: STRING;
         l: STR_Range;
         VAR attr : LSDOMAINT_coordpatterntype         ): BOOLEAN;
VAR found: BOOLEAN;
BEGIN
   found := FALSE;
   IF FALSE THEN BEGIN
      END
   ELSE IF STR_Compare(str, l, 'npc',3) = 0 THEN BEGIN
       attr := npc;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'apc',3) = 0 THEN BEGIN
       attr := apc;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'ppc',3) = 0 THEN BEGIN
       attr := ppc;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vpc',3) = 0 THEN BEGIN
       attr := vpc;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'Smdc',4) = 0 THEN BEGIN
       attr := Smdc;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'Smync',5) = 0 THEN BEGIN
       attr := Smync;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'Smwhc',5) = 0 THEN BEGIN
       attr := Smwhc;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'Ssdc',4) = 0 THEN BEGIN
       attr := Ssdc;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'Ssync',5) = 0 THEN BEGIN
       attr := Ssync;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'Sswhc',5) = 0 THEN BEGIN
       attr := Sswhc;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'Simpc',5) = 0 THEN BEGIN
       attr := Simpc;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'Srelfinc',8) = 0 THEN BEGIN
       attr := Srelfinc;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'Somtec',6) = 0 THEN BEGIN
       attr := Somtec;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'Sotec',5) = 0 THEN BEGIN
       attr := Sotec;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'Sctec',5) = 0 THEN BEGIN
       attr := Sctec;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'Sprpc',5) = 0 THEN BEGIN
       attr := Sprpc;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'Spapc',5) = 0 THEN BEGIN
       attr := Spapc;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'Scond',5) = 0 THEN BEGIN
       attr := Scond;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'Slaten',6) = 0 THEN BEGIN
       attr := Slaten;
       found := TRUE
       END;
   LSSTRTOTYPE_coordpatterntype := found;
END {LSSTRTOTYPE_coordpatterntype};


FUNCTION LSSTRTOTYPE_coordtype( 
         CONST str: STRING;
         l: STR_Range;
         VAR attr : LSDOMAINT_coordtype         ): BOOLEAN;
VAR found: BOOLEAN;
BEGIN
   found := FALSE;
   IF FALSE THEN BEGIN
      END
   ELSE IF STR_Compare(str, l, 'nocoord',7) = 0 THEN BEGIN
       attr := nocoord;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'simplecoord',11) = 0 THEN BEGIN
       attr := simplecoord;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'corrcoord',9) = 0 THEN BEGIN
       attr := corrcoord;
       found := TRUE
       END;
   LSSTRTOTYPE_coordtype := found;
END {LSSTRTOTYPE_coordtype};


FUNCTION LSSTRTOTYPE_deftype( 
         CONST str: STRING;
         l: STR_Range;
         VAR attr : LSDOMAINT_deftype         ): BOOLEAN;
VAR found: BOOLEAN;
BEGIN
   found := FALSE;
   IF FALSE THEN BEGIN
      END
   ELSE IF STR_Compare(str, l, 'def',3) = 0 THEN BEGIN
       attr := def;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'adef',4) = 0 THEN BEGIN
       attr := adef;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'indef',5) = 0 THEN BEGIN
       attr := indef;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'menigdef',8) = 0 THEN BEGIN
       attr := menigdef;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'omegadef',8) = 0 THEN BEGIN
       attr := omegadef;
       found := TRUE
       END;
   LSSTRTOTYPE_deftype := found;
END {LSSTRTOTYPE_deftype};


FUNCTION LSSTRTOTYPE_deixistype( 
         CONST str: STRING;
         l: STR_Range;
         VAR attr : LSDOMAINT_deixistype         ): BOOLEAN;
VAR found: BOOLEAN;
BEGIN
   found := FALSE;
   IF FALSE THEN BEGIN
      END
   ELSE IF STR_Compare(str, l, 'omegadeixis',11) = 0 THEN BEGIN
       attr := omegadeixis;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'presentdeixis',13) = 0 THEN BEGIN
       attr := presentdeixis;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'pastdeixis',10) = 0 THEN BEGIN
       attr := pastdeixis;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'futuredeixis',12) = 0 THEN BEGIN
       attr := futuredeixis;
       found := TRUE
       END;
   LSSTRTOTYPE_deixistype := found;
END {LSSTRTOTYPE_deixistype};


FUNCTION LSSTRTOTYPE_dimformtype( 
         CONST str: STRING;
         l: STR_Range;
         VAR attr : LSDOMAINT_dimformtype         ): BOOLEAN;
VAR found: BOOLEAN;
BEGIN
   found := FALSE;
   IF FALSE THEN BEGIN
      END
   ELSE IF STR_Compare(str, l, 'jeDim',5) = 0 THEN BEGIN
       attr := jeDim;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'etjeDim',7) = 0 THEN BEGIN
       attr := etjeDim;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'irregDim',8) = 0 THEN BEGIN
       attr := irregDim;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'dimletterword',13) = 0 THEN BEGIN
       attr := dimletterword;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'noDim',5) = 0 THEN BEGIN
       attr := noDim;
       found := TRUE
       END;
   LSSTRTOTYPE_dimformtype := found;
END {LSSTRTOTYPE_dimformtype};


FUNCTION LSSTRTOTYPE_distritype( 
         CONST str: STRING;
         l: STR_Range;
         VAR attr : LSDOMAINT_distritype         ): BOOLEAN;
VAR found: BOOLEAN;
BEGIN
   found := FALSE;
   IF FALSE THEN BEGIN
      END
   ELSE IF STR_Compare(str, l, 'initial',7) = 0 THEN BEGIN
       attr := initial;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'middle',6) = 0 THEN BEGIN
       attr := middle;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'final',5) = 0 THEN BEGIN
       attr := final;
       found := TRUE
       END;
   LSSTRTOTYPE_distritype := found;
END {LSSTRTOTYPE_distritype};


FUNCTION LSSTRTOTYPE_eformationtype( 
         CONST str: STRING;
         l: STR_Range;
         VAR attr : LSDOMAINT_eformationtype         ): BOOLEAN;
VAR found: BOOLEAN;
BEGIN
   found := FALSE;
   IF FALSE THEN BEGIN
      END
   ELSE IF STR_Compare(str, l, 'NoFormation',11) = 0 THEN BEGIN
       attr := NoFormation;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'RegEFormation',13) = 0 THEN BEGIN
       attr := RegEFormation;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'IrregEformation',15) = 0 THEN BEGIN
       attr := IrregEformation;
       found := TRUE
       END;
   LSSTRTOTYPE_eformationtype := found;
END {LSSTRTOTYPE_eformationtype};


FUNCTION LSSTRTOTYPE_enominalisedtype( 
         CONST str: STRING;
         l: STR_Range;
         VAR attr : LSDOMAINT_enominalisedtype         ): BOOLEAN;
VAR found: BOOLEAN;
BEGIN
   found := FALSE;
   IF FALSE THEN BEGIN
      END
   ELSE IF STR_Compare(str, l, 'noNominalised',13) = 0 THEN BEGIN
       attr := noNominalised;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'regeNominalised',15) = 0 THEN BEGIN
       attr := regeNominalised;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'IrregeNominalised',17) = 0 THEN BEGIN
       attr := IrregeNominalised;
       found := TRUE
       END;
   LSSTRTOTYPE_enominalisedtype := found;
END {LSSTRTOTYPE_enominalisedtype};


FUNCTION LSSTRTOTYPE_eorenformtype( 
         CONST str: STRING;
         l: STR_Range;
         VAR attr : LSDOMAINT_eorenformtype         ): BOOLEAN;
VAR found: BOOLEAN;
BEGIN
   found := FALSE;
   IF FALSE THEN BEGIN
      END
   ELSE IF STR_Compare(str, l, 'NoForm',6) = 0 THEN BEGIN
       attr := NoForm;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'eForm',5) = 0 THEN BEGIN
       attr := eForm;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'enForm',6) = 0 THEN BEGIN
       attr := enForm;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'omegaform',9) = 0 THEN BEGIN
       attr := omegaform;
       found := TRUE
       END;
   LSSTRTOTYPE_eorenformtype := found;
END {LSSTRTOTYPE_eorenformtype};


FUNCTION LSSTRTOTYPE_finitenesstype( 
         CONST str: STRING;
         l: STR_Range;
         VAR attr : LSDOMAINT_finitenesstype         ): BOOLEAN;
VAR found: BOOLEAN;
BEGIN
   found := FALSE;
   IF FALSE THEN BEGIN
      END
   ELSE IF STR_Compare(str, l, 'finite',6) = 0 THEN BEGIN
       attr := finite;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'infinite',8) = 0 THEN BEGIN
       attr := infinite;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'omegafin',8) = 0 THEN BEGIN
       attr := omegafin;
       found := TRUE
       END;
   LSSTRTOTYPE_finitenesstype := found;
END {LSSTRTOTYPE_finitenesstype};


FUNCTION LSSTRTOTYPE_gelievetype( 
         CONST str: STRING;
         l: STR_Range;
         VAR attr : LSDOMAINT_gelievetype         ): BOOLEAN;
VAR found: BOOLEAN;
BEGIN
   found := FALSE;
   IF FALSE THEN BEGIN
      END
   ELSE IF STR_Compare(str, l, 'gelieve',7) = 0 THEN BEGIN
       attr := gelieve;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'ugelieve',8) = 0 THEN BEGIN
       attr := ugelieve;
       found := TRUE
       END;
   LSSTRTOTYPE_gelievetype := found;
END {LSSTRTOTYPE_gelievetype};


FUNCTION LSSTRTOTYPE_gendertype( 
         CONST str: STRING;
         l: STR_Range;
         VAR attr : LSDOMAINT_gendertype         ): BOOLEAN;
VAR found: BOOLEAN;
BEGIN
   found := FALSE;
   IF FALSE THEN BEGIN
      END
   ELSE IF STR_Compare(str, l, 'mascgender',10) = 0 THEN BEGIN
       attr := mascgender;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'femgender',9) = 0 THEN BEGIN
       attr := femgender;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'neutgender',10) = 0 THEN BEGIN
       attr := neutgender;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'omegagender',11) = 0 THEN BEGIN
       attr := omegagender;
       found := TRUE
       END;
   LSSTRTOTYPE_gendertype := found;
END {LSSTRTOTYPE_gendertype};


FUNCTION LSSTRTOTYPE_generictype( 
         CONST str: STRING;
         l: STR_Range;
         VAR attr : LSDOMAINT_generictype         ): BOOLEAN;
VAR found: BOOLEAN;
BEGIN
   found := FALSE;
   IF FALSE THEN BEGIN
      END
   ELSE IF STR_Compare(str, l, 'yesgeneric',10) = 0 THEN BEGIN
       attr := yesgeneric;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'nogeneric',9) = 0 THEN BEGIN
       attr := nogeneric;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'omegageneric',12) = 0 THEN BEGIN
       attr := omegageneric;
       found := TRUE
       END;
   LSSTRTOTYPE_generictype := found;
END {LSSTRTOTYPE_generictype};


FUNCTION LSSTRTOTYPE_humantype( 
         CONST str: STRING;
         l: STR_Range;
         VAR attr : LSDOMAINT_humantype         ): BOOLEAN;
VAR found: BOOLEAN;
BEGIN
   found := FALSE;
   IF FALSE THEN BEGIN
      END
   ELSE IF STR_Compare(str, l, 'YesHuman',8) = 0 THEN BEGIN
       attr := YesHuman;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'NoHuman',7) = 0 THEN BEGIN
       attr := NoHuman;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'OmegaHuman',10) = 0 THEN BEGIN
       attr := OmegaHuman;
       found := TRUE
       END;
   LSSTRTOTYPE_humantype := found;
END {LSSTRTOTYPE_humantype};


FUNCTION LSSTRTOTYPE_inftype( 
         CONST str: STRING;
         l: STR_Range;
         VAR attr : LSDOMAINT_inftype         ): BOOLEAN;
VAR found: BOOLEAN;
BEGIN
   found := FALSE;
   IF FALSE THEN BEGIN
      END
   ELSE IF STR_Compare(str, l, 'inf',3) = 0 THEN BEGIN
       attr := inf;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'teinf',5) = 0 THEN BEGIN
       attr := teinf;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'omteinf',7) = 0 THEN BEGIN
       attr := omteinf;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'omegainf',8) = 0 THEN BEGIN
       attr := omegainf;
       found := TRUE
       END;
   LSSTRTOTYPE_inftype := found;
END {LSSTRTOTYPE_inftype};


FUNCTION LSSTRTOTYPE_ipptype( 
         CONST str: STRING;
         l: STR_Range;
         VAR attr : LSDOMAINT_ipptype         ): BOOLEAN;
VAR found: BOOLEAN;
BEGIN
   found := FALSE;
   IF FALSE THEN BEGIN
      END
   ELSE IF STR_Compare(str, l, 'NOIPP',5) = 0 THEN BEGIN
       attr := NOIPP;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'optionalIPP',11) = 0 THEN BEGIN
       attr := optionalIPP;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'obligatoryIPP',13) = 0 THEN BEGIN
       attr := obligatoryIPP;
       found := TRUE
       END;
   LSSTRTOTYPE_ipptype := found;
END {LSSTRTOTYPE_ipptype};


FUNCTION LSSTRTOTYPE_kindstype( 
         CONST str: STRING;
         l: STR_Range;
         VAR attr : LSDOMAINT_kindstype         ): BOOLEAN;
VAR found: BOOLEAN;
BEGIN
   found := FALSE;
   IF FALSE THEN BEGIN
      END
   ELSE IF STR_Compare(str, l, 'Xk',2) = 0 THEN BEGIN
       attr := Xk;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'Lk',2) = 0 THEN BEGIN
       attr := Lk;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'Qk',2) = 0 THEN BEGIN
       attr := Qk;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'Pk',2) = 0 THEN BEGIN
       attr := Pk;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'XLk',3) = 0 THEN BEGIN
       attr := XLk;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'XQk',3) = 0 THEN BEGIN
       attr := XQk;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'XPk',3) = 0 THEN BEGIN
       attr := XPk;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'LQk',3) = 0 THEN BEGIN
       attr := LQk;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'QPk',3) = 0 THEN BEGIN
       attr := QPk;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'XLQk',4) = 0 THEN BEGIN
       attr := XLQk;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'XPQk',4) = 0 THEN BEGIN
       attr := XPQk;
       found := TRUE
       END;
   LSSTRTOTYPE_kindstype := found;
END {LSSTRTOTYPE_kindstype};


FUNCTION LSSTRTOTYPE_modustype( 
         CONST str: STRING;
         l: STR_Range;
         VAR attr : LSDOMAINT_modustype         ): BOOLEAN;
VAR found: BOOLEAN;
BEGIN
   found := FALSE;
   IF FALSE THEN BEGIN
      END
   ELSE IF STR_Compare(str, l, 'indicative',10) = 0 THEN BEGIN
       attr := indicative;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'subjunctive',11) = 0 THEN BEGIN
       attr := subjunctive;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'imperative',10) = 0 THEN BEGIN
       attr := imperative;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'infinitive',10) = 0 THEN BEGIN
       attr := infinitive;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'prespart',8) = 0 THEN BEGIN
       attr := prespart;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'pastpart',8) = 0 THEN BEGIN
       attr := pastpart;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'omegamodus',10) = 0 THEN BEGIN
       attr := omegamodus;
       found := TRUE
       END;
   LSSTRTOTYPE_modustype := found;
END {LSSTRTOTYPE_modustype};


FUNCTION LSSTRTOTYPE_moodtype( 
         CONST str: STRING;
         l: STR_Range;
         VAR attr : LSDOMAINT_moodtype         ): BOOLEAN;
VAR found: BOOLEAN;
BEGIN
   found := FALSE;
   IF FALSE THEN BEGIN
      END
   ELSE IF STR_Compare(str, l, 'declarative',11) = 0 THEN BEGIN
       attr := declarative;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'yesnointerrogative',18) = 0 THEN BEGIN
       attr := yesnointerrogative;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'WHinterrogative',15) = 0 THEN BEGIN
       attr := WHinterrogative;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'Imperativemood',14) = 0 THEN BEGIN
       attr := Imperativemood;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'latenmood',9) = 0 THEN BEGIN
       attr := latenmood;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'Relative',8) = 0 THEN BEGIN
       attr := Relative;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'Anterelative',12) = 0 THEN BEGIN
       attr := Anterelative;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'WHmod',5) = 0 THEN BEGIN
       attr := WHmod;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'Conditional',11) = 0 THEN BEGIN
       attr := Conditional;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'proobjmod',9) = 0 THEN BEGIN
       attr := proobjmod;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'omegamood',9) = 0 THEN BEGIN
       attr := omegamood;
       found := TRUE
       END;
   LSSTRTOTYPE_moodtype := found;
END {LSSTRTOTYPE_moodtype};


FUNCTION LSSTRTOTYPE_nounsubctype( 
         CONST str: STRING;
         l: STR_Range;
         VAR attr : LSDOMAINT_nounsubctype         ): BOOLEAN;
VAR found: BOOLEAN;
BEGIN
   found := FALSE;
   IF FALSE THEN BEGIN
      END
   ELSE IF STR_Compare(str, l, 'vocativenoun',12) = 0 THEN BEGIN
       attr := vocativenoun;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'professionnoun',14) = 0 THEN BEGIN
       attr := professionnoun;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'relationnoun',12) = 0 THEN BEGIN
       attr := relationnoun;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'unitnoun',8) = 0 THEN BEGIN
       attr := unitnoun;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'plurunitnoun',12) = 0 THEN BEGIN
       attr := plurunitnoun;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'abstractnoun',12) = 0 THEN BEGIN
       attr := abstractnoun;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'monthnoun',9) = 0 THEN BEGIN
       attr := monthnoun;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'clocktimenoun',13) = 0 THEN BEGIN
       attr := clocktimenoun;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'daynoun',7) = 0 THEN BEGIN
       attr := daynoun;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'city',4) = 0 THEN BEGIN
       attr := city;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'country',7) = 0 THEN BEGIN
       attr := country;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'firstname',9) = 0 THEN BEGIN
       attr := firstname;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'surname',7) = 0 THEN BEGIN
       attr := surname;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'institutename',13) = 0 THEN BEGIN
       attr := institutename;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'holidayname',11) = 0 THEN BEGIN
       attr := holidayname;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'othername',9) = 0 THEN BEGIN
       attr := othername;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'locationnoun',12) = 0 THEN BEGIN
       attr := locationnoun;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'othernoun',9) = 0 THEN BEGIN
       attr := othernoun;
       found := TRUE
       END;
   LSSTRTOTYPE_nounsubctype := found;
END {LSSTRTOTYPE_nounsubctype};


FUNCTION LSSTRTOTYPE_npheadtype( 
         CONST str: STRING;
         l: STR_Range;
         VAR attr : LSDOMAINT_npheadtype         ): BOOLEAN;
VAR found: BOOLEAN;
BEGIN
   found := FALSE;
   IF FALSE THEN BEGIN
      END
   ELSE IF STR_Compare(str, l, 'menNP',5) = 0 THEN BEGIN
       attr := menNP;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'datNP',5) = 0 THEN BEGIN
       attr := datNP;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'ditNP',5) = 0 THEN BEGIN
       attr := ditNP;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'dieNP',5) = 0 THEN BEGIN
       attr := dieNP;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'zichzelfNP',10) = 0 THEN BEGIN
       attr := zichzelfNP;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'jegenNP',7) = 0 THEN BEGIN
       attr := jegenNP;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'hetNP',5) = 0 THEN BEGIN
       attr := hetNP;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'watwhproNP',10) = 0 THEN BEGIN
       attr := watwhproNP;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'watindefproNP',13) = 0 THEN BEGIN
       attr := watindefproNP;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'persproNP',9) = 0 THEN BEGIN
       attr := persproNP;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'reducedpersproNP',16) = 0 THEN BEGIN
       attr := reducedpersproNP;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'ecNP',4) = 0 THEN BEGIN
       attr := ecNP;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'otherNP',7) = 0 THEN BEGIN
       attr := otherNP;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'zegenNP',7) = 0 THEN BEGIN
       attr := zegenNP;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'enNP',4) = 0 THEN BEGIN
       attr := enNP;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'enOKNP',6) = 0 THEN BEGIN
       attr := enOKNP;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'allesNP',7) = 0 THEN BEGIN
       attr := allesNP;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'ietsNP',6) = 0 THEN BEGIN
       attr := ietsNP;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'elkaarNP',8) = 0 THEN BEGIN
       attr := elkaarNP;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'cardNP',6) = 0 THEN BEGIN
       attr := cardNP;
       found := TRUE
       END;
   LSSTRTOTYPE_npheadtype := found;
END {LSSTRTOTYPE_npheadtype};


FUNCTION LSSTRTOTYPE_numbertype( 
         CONST str: STRING;
         l: STR_Range;
         VAR attr : LSDOMAINT_numbertype         ): BOOLEAN;
VAR found: BOOLEAN;
BEGIN
   found := FALSE;
   IF FALSE THEN BEGIN
      END
   ELSE IF STR_Compare(str, l, 'singular',8) = 0 THEN BEGIN
       attr := singular;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'plural',6) = 0 THEN BEGIN
       attr := plural;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'omeganumber',11) = 0 THEN BEGIN
       attr := omeganumber;
       found := TRUE
       END;
   LSSTRTOTYPE_numbertype := found;
END {LSSTRTOTYPE_numbertype};


FUNCTION LSSTRTOTYPE_perfauxtype( 
         CONST str: STRING;
         l: STR_Range;
         VAR attr : LSDOMAINT_perfauxtype         ): BOOLEAN;
VAR found: BOOLEAN;
BEGIN
   found := FALSE;
   IF FALSE THEN BEGIN
      END
   ELSE IF STR_Compare(str, l, 'isaux',5) = 0 THEN BEGIN
       attr := isaux;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'hebaux',6) = 0 THEN BEGIN
       attr := hebaux;
       found := TRUE
       END;
   LSSTRTOTYPE_perfauxtype := found;
END {LSSTRTOTYPE_perfauxtype};


FUNCTION LSSTRTOTYPE_pluralformtype( 
         CONST str: STRING;
         l: STR_Range;
         VAR attr : LSDOMAINT_pluralformtype         ): BOOLEAN;
VAR found: BOOLEAN;
BEGIN
   found := FALSE;
   IF FALSE THEN BEGIN
      END
   ELSE IF STR_Compare(str, l, 'enPlural',8) = 0 THEN BEGIN
       attr := enPlural;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'sPlural',7) = 0 THEN BEGIN
       attr := sPlural;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'aTOaaPlural',11) = 0 THEN BEGIN
       attr := aTOaaPlural;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'aTOeePlural',11) = 0 THEN BEGIN
       attr := aTOeePlural;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'eTOeePlural',11) = 0 THEN BEGIN
       attr := eTOeePlural;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'eiTOeePlural',12) = 0 THEN BEGIN
       attr := eiTOeePlural;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'iTOeePlural',11) = 0 THEN BEGIN
       attr := iTOeePlural;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'oTOooPlural',11) = 0 THEN BEGIN
       attr := oTOooPlural;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'erenPlural',10) = 0 THEN BEGIN
       attr := erenPlural;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'ienPlural',9) = 0 THEN BEGIN
       attr := ienPlural;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'jenPlural',9) = 0 THEN BEGIN
       attr := jenPlural;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'denPlural',9) = 0 THEN BEGIN
       attr := denPlural;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'nenPlural',9) = 0 THEN BEGIN
       attr := nenPlural;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'ieAccentPlural',14) = 0 THEN BEGIN
       attr := ieAccentPlural;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'luiPlural',9) = 0 THEN BEGIN
       attr := luiPlural;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'liedenPlural',12) = 0 THEN BEGIN
       attr := liedenPlural;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'LatPlural',9) = 0 THEN BEGIN
       attr := LatPlural;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'enIrregPlural',13) = 0 THEN BEGIN
       attr := enIrregPlural;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'sIrregPlural',12) = 0 THEN BEGIN
       attr := sIrregPlural;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'LatIrregPlural',14) = 0 THEN BEGIN
       attr := LatIrregPlural;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'NoPlural',8) = 0 THEN BEGIN
       attr := NoPlural;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'OnlyPlural',10) = 0 THEN BEGIN
       attr := OnlyPlural;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'enOSLPlural',11) = 0 THEN BEGIN
       attr := enOSLPlural;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'enATOePlural',12) = 0 THEN BEGIN
       attr := enATOePlural;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'hydTOhedenPlural',16) = 0 THEN BEGIN
       attr := hydTOhedenPlural;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'enITOePlural',12) = 0 THEN BEGIN
       attr := enITOePlural;
       found := TRUE
       END;
   LSSTRTOTYPE_pluralformtype := found;
END {LSSTRTOTYPE_pluralformtype};


FUNCTION LSSTRTOTYPE_polaritytype( 
         CONST str: STRING;
         l: STR_Range;
         VAR attr : LSDOMAINT_polaritytype         ): BOOLEAN;
VAR found: BOOLEAN;
BEGIN
   found := FALSE;
   IF FALSE THEN BEGIN
      END
   ELSE IF STR_Compare(str, l, 'pospol',6) = 0 THEN BEGIN
       attr := pospol;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'negpol',6) = 0 THEN BEGIN
       attr := negpol;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'omegapol',8) = 0 THEN BEGIN
       attr := omegapol;
       found := TRUE
       END;
   LSSTRTOTYPE_polaritytype := found;
END {LSSTRTOTYPE_polaritytype};


FUNCTION LSSTRTOTYPE_posscomatype( 
         CONST str: STRING;
         l: STR_Range;
         VAR attr : LSDOMAINT_posscomatype         ): BOOLEAN;
VAR found: BOOLEAN;
BEGIN
   found := FALSE;
   IF FALSE THEN BEGIN
      END
   ELSE IF STR_Compare(str, l, 'count',5) = 0 THEN BEGIN
       attr := count;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'mass',4) = 0 THEN BEGIN
       attr := mass;
       found := TRUE
       END;
   LSSTRTOTYPE_posscomatype := found;
END {LSSTRTOTYPE_posscomatype};


FUNCTION LSSTRTOTYPE_postformtype( 
         CONST str: STRING;
         l: STR_Range;
         VAR attr : LSDOMAINT_postformtype         ): BOOLEAN;
VAR found: BOOLEAN;
BEGIN
   found := FALSE;
   IF FALSE THEN BEGIN
      END
   ELSE IF STR_Compare(str, l, 'pre',3) = 0 THEN BEGIN
       attr := pre;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'post',4) = 0 THEN BEGIN
       attr := post;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'both',4) = 0 THEN BEGIN
       attr := both;
       found := TRUE
       END;
   LSSTRTOTYPE_postformtype := found;
END {LSSTRTOTYPE_postformtype};


FUNCTION LSSTRTOTYPE_prepsubctype( 
         CONST str: STRING;
         l: STR_Range;
         VAR attr : LSDOMAINT_prepsubctype         ): BOOLEAN;
VAR found: BOOLEAN;
BEGIN
   found := FALSE;
   IF FALSE THEN BEGIN
      END
   ELSE IF STR_Compare(str, l, 'loc',3) = 0 THEN BEGIN
       attr := loc;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'dir',3) = 0 THEN BEGIN
       attr := dir;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'temp',4) = 0 THEN BEGIN
       attr := temp;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'topic',5) = 0 THEN BEGIN
       attr := topic;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'approx',6) = 0 THEN BEGIN
       attr := approx;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'according',9) = 0 THEN BEGIN
       attr := according;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'excepting',9) = 0 THEN BEGIN
       attr := excepting;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'comitative',10) = 0 THEN BEGIN
       attr := comitative;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'instrum',7) = 0 THEN BEGIN
       attr := instrum;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'doorby',6) = 0 THEN BEGIN
       attr := doorby;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'aan',3) = 0 THEN BEGIN
       attr := aan;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'voor',4) = 0 THEN BEGIN
       attr := voor;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'caus',4) = 0 THEN BEGIN
       attr := caus;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'restprep',8) = 0 THEN BEGIN
       attr := restprep;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'other',5) = 0 THEN BEGIN
       attr := other;
       found := TRUE
       END;
   LSSTRTOTYPE_prepsubctype := found;
END {LSSTRTOTYPE_prepsubctype};


FUNCTION LSSTRTOTYPE_preptypetype( 
         CONST str: STRING;
         l: STR_Range;
         VAR attr : LSDOMAINT_preptypetype         ): BOOLEAN;
VAR found: BOOLEAN;
BEGIN
   found := FALSE;
   IF FALSE THEN BEGIN
      END
   ELSE IF STR_Compare(str, l, 'normalprep',10) = 0 THEN BEGIN
       attr := normalprep;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'splitprep',9) = 0 THEN BEGIN
       attr := splitprep;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'postprep',8) = 0 THEN BEGIN
       attr := postprep;
       found := TRUE
       END;
   LSSTRTOTYPE_preptypetype := found;
END {LSSTRTOTYPE_preptypetype};


FUNCTION LSSTRTOTYPE_reflexivetype( 
         CONST str: STRING;
         l: STR_Range;
         VAR attr : LSDOMAINT_reflexivetype         ): BOOLEAN;
VAR found: BOOLEAN;
BEGIN
   found := FALSE;
   IF FALSE THEN BEGIN
      END
   ELSE IF STR_Compare(str, l, 'notreflexive',12) = 0 THEN BEGIN
       attr := notreflexive;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'reflexive',9) = 0 THEN BEGIN
       attr := reflexive;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'reciprocal',10) = 0 THEN BEGIN
       attr := reciprocal;
       found := TRUE
       END;
   LSSTRTOTYPE_reflexivetype := found;
END {LSSTRTOTYPE_reflexivetype};


FUNCTION LSSTRTOTYPE_senttypetype( 
         CONST str: STRING;
         l: STR_Range;
         VAR attr : LSDOMAINT_senttypetype         ): BOOLEAN;
VAR found: BOOLEAN;
BEGIN
   found := FALSE;
   IF FALSE THEN BEGIN
      END
   ELSE IF STR_Compare(str, l, 'mainclause',10) = 0 THEN BEGIN
       attr := mainclause;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'subordinateclause',17) = 0 THEN BEGIN
       attr := subordinateclause;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'omegaclause',11) = 0 THEN BEGIN
       attr := omegaclause;
       found := TRUE
       END;
   LSSTRTOTYPE_senttypetype := found;
END {LSSTRTOTYPE_senttypetype};


FUNCTION LSSTRTOTYPE_sextype( 
         CONST str: STRING;
         l: STR_Range;
         VAR attr : LSDOMAINT_sextype         ): BOOLEAN;
VAR found: BOOLEAN;
BEGIN
   found := FALSE;
   IF FALSE THEN BEGIN
      END
   ELSE IF STR_Compare(str, l, 'masculine',9) = 0 THEN BEGIN
       attr := masculine;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'feminine',8) = 0 THEN BEGIN
       attr := feminine;
       found := TRUE
       END;
   LSSTRTOTYPE_sextype := found;
END {LSSTRTOTYPE_sextype};


FUNCTION LSSTRTOTYPE_specqtype( 
         CONST str: STRING;
         l: STR_Range;
         VAR attr : LSDOMAINT_specqtype         ): BOOLEAN;
VAR found: BOOLEAN;
BEGIN
   found := FALSE;
   IF FALSE THEN BEGIN
      END
   ELSE IF STR_Compare(str, l, 'omegaspec',9) = 0 THEN BEGIN
       attr := omegaspec;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'yesspec',7) = 0 THEN BEGIN
       attr := yesspec;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'nospec',6) = 0 THEN BEGIN
       attr := nospec;
       found := TRUE
       END;
   LSSTRTOTYPE_specqtype := found;
END {LSSTRTOTYPE_specqtype};


FUNCTION LSSTRTOTYPE_superlativetype( 
         CONST str: STRING;
         l: STR_Range;
         VAR attr : LSDOMAINT_superlativetype         ): BOOLEAN;
VAR found: BOOLEAN;
BEGIN
   found := FALSE;
   IF FALSE THEN BEGIN
      END
   ELSE IF STR_Compare(str, l, 'stSup',5) = 0 THEN BEGIN
       attr := stSup;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'stIrregSup',10) = 0 THEN BEGIN
       attr := stIrregSup;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'allerSup',8) = 0 THEN BEGIN
       attr := allerSup;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'allerIrregSup',13) = 0 THEN BEGIN
       attr := allerIrregSup;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'meestSup',8) = 0 THEN BEGIN
       attr := meestSup;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'noSup',5) = 0 THEN BEGIN
       attr := noSup;
       found := TRUE
       END;
   LSSTRTOTYPE_superlativetype := found;
END {LSSTRTOTYPE_superlativetype};


FUNCTION LSSTRTOTYPE_synpatterntype( 
         CONST str: STRING;
         l: STR_Range;
         VAR attr : LSDOMAINT_synpatterntype         ): BOOLEAN;
VAR found: BOOLEAN;
BEGIN
   found := FALSE;
   IF FALSE THEN BEGIN
      END
   ELSE IF STR_Compare(str, l, 'synnoVPargs',11) = 0 THEN BEGIN
       attr := synnoVPargs;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synnoadjpargs',13) = 0 THEN BEGIN
       attr := synnoadjpargs;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synAANNP',8) = 0 THEN BEGIN
       attr := synAANNP;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synAANNP_DONP',13) = 0 THEN BEGIN
       attr := synAANNP_DONP;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synAANNP_PREPNP',15) = 0 THEN BEGIN
       attr := synAANNP_PREPNP;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synAANNP_HETOPENOMTESENT',24) = 0 THEN BEGIN
       attr := synAANNP_HETOPENOMTESENT;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synAANNP_HETOPENTESENT',22) = 0 THEN BEGIN
       attr := synAANNP_HETOPENTESENT;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synAANNP_HETTHATSENT',20) = 0 THEN BEGIN
       attr := synAANNP_HETTHATSENT;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synAANNP_HETQSENT',17) = 0 THEN BEGIN
       attr := synAANNP_HETQSENT;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synAANNP_OPENOMTESENT',21) = 0 THEN BEGIN
       attr := synAANNP_OPENOMTESENT;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synAANNP_OPENTESENT',19) = 0 THEN BEGIN
       attr := synAANNP_OPENTESENT;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synAANNP_QSENT',14) = 0 THEN BEGIN
       attr := synAANNP_QSENT;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synAANNP_THATSENT',17) = 0 THEN BEGIN
       attr := synAANNP_THATSENT;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synASIFCLOSEDADJPPROP',21) = 0 THEN BEGIN
       attr := synASIFCLOSEDADJPPROP;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synCLOSEDADJPPROP',17) = 0 THEN BEGIN
       attr := synCLOSEDADJPPROP;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synCLOSEDINFSENT',16) = 0 THEN BEGIN
       attr := synCLOSEDINFSENT;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synCLOSEDNPPROP',15) = 0 THEN BEGIN
       attr := synCLOSEDNPPROP;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synCLOSEDTESENT',15) = 0 THEN BEGIN
       attr := synCLOSEDTESENT;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synCLOSEDVERBPPROP',18) = 0 THEN BEGIN
       attr := synCLOSEDVERBPPROP;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synDIRCLOSEDPREPPPROP',21) = 0 THEN BEGIN
       attr := synDIRCLOSEDPREPPPROP;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synDIROPENPREPPPROP',19) = 0 THEN BEGIN
       attr := synDIROPENPREPPPROP;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synDONP_DIROPENPREPPPROP',24) = 0 THEN BEGIN
       attr := synDONP_DIROPENPREPPPROP;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synDONP_DIREMPTY',16) = 0 THEN BEGIN
       attr := synDONP_DIREMPTY;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synDONP_LOCOPENPREPPPROP',24) = 0 THEN BEGIN
       attr := synDONP_LOCOPENPREPPPROP;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synDONP_OTHEROPENPREPPPROP',26) = 0 THEN BEGIN
       attr := synDONP_OTHEROPENPREPPPROP;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synDONP_OPENADJPPROP',20) = 0 THEN BEGIN
       attr := synDONP_OPENADJPPROP;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synDONP_OPENNPPROP',18) = 0 THEN BEGIN
       attr := synDONP_OPENNPPROP;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synDONP_OPENTESENT',18) = 0 THEN BEGIN
       attr := synDONP_OPENTESENT;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synDONP_OPENOMTESENT',20) = 0 THEN BEGIN
       attr := synDONP_OPENOMTESENT;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synDONP_PREPNP',14) = 0 THEN BEGIN
       attr := synDONP_PREPNP;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synDONP_PREPEMPTY',17) = 0 THEN BEGIN
       attr := synDONP_PREPEMPTY;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synDONP_PREPOPENNPPROP',22) = 0 THEN BEGIN
       attr := synDONP_PREPOPENNPPROP;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synDONP_PREPOPENOMTESENT',24) = 0 THEN BEGIN
       attr := synDONP_PREPOPENOMTESENT;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synEMPTY',8) = 0 THEN BEGIN
       attr := synEMPTY;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synEMPTY_CLOSEDADJPPROP',23) = 0 THEN BEGIN
       attr := synEMPTY_CLOSEDADJPPROP;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synEMPTY_CLOSEDNPPROP',21) = 0 THEN BEGIN
       attr := synEMPTY_CLOSEDNPPROP;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synEMPTY_CLOSEDTESENT',21) = 0 THEN BEGIN
       attr := synEMPTY_CLOSEDTESENT;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synEMPTY_DONP',13) = 0 THEN BEGIN
       attr := synEMPTY_DONP;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synEMPTY_HETOPENTESENT',22) = 0 THEN BEGIN
       attr := synEMPTY_HETOPENTESENT;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synEMPTY_HETOPENOMTESENT',24) = 0 THEN BEGIN
       attr := synEMPTY_HETOPENOMTESENT;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synEMPTY_HETTHATSENT',20) = 0 THEN BEGIN
       attr := synEMPTY_HETTHATSENT;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synEMPTY_MEASUREPHRASE',22) = 0 THEN BEGIN
       attr := synEMPTY_MEASUREPHRASE;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synEMPTY_OPENOMTESENT',21) = 0 THEN BEGIN
       attr := synEMPTY_OPENOMTESENT;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synEMPTY_OPENTESENT',19) = 0 THEN BEGIN
       attr := synEMPTY_OPENTESENT;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synEMPTY_OTHERCLOSEDPREPPPROP',29) = 0 THEN BEGIN
       attr := synEMPTY_OTHERCLOSEDPREPPPROP;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synEMPTY_QSENT',14) = 0 THEN BEGIN
       attr := synEMPTY_QSENT;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synEMPTY_THATSENT',17) = 0 THEN BEGIN
       attr := synEMPTY_THATSENT;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synHETASIFCLOSEDADJPPROP',24) = 0 THEN BEGIN
       attr := synHETASIFCLOSEDADJPPROP;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synHETOPENOMTESENT',18) = 0 THEN BEGIN
       attr := synHETOPENOMTESENT;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synHETOPENTESENT',16) = 0 THEN BEGIN
       attr := synHETOPENTESENT;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synHETTHATSENT',14) = 0 THEN BEGIN
       attr := synHETTHATSENT;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synIOEMPTY_DONP',15) = 0 THEN BEGIN
       attr := synIOEMPTY_DONP;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synIOEMPTY_HETTHATSENT',22) = 0 THEN BEGIN
       attr := synIOEMPTY_HETTHATSENT;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synIOEMPTY_HETQSENT',19) = 0 THEN BEGIN
       attr := synIOEMPTY_HETQSENT;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synIOEMPTY_THATSENT',19) = 0 THEN BEGIN
       attr := synIOEMPTY_THATSENT;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synIOEMPTY_QSENT',16) = 0 THEN BEGIN
       attr := synIOEMPTY_QSENT;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synIONP',7) = 0 THEN BEGIN
       attr := synIONP;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synIOEMPTY_HETOPENOMTESENT',26) = 0 THEN BEGIN
       attr := synIOEMPTY_HETOPENOMTESENT;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synIOEMPTY_OPENOMTESENT',23) = 0 THEN BEGIN
       attr := synIOEMPTY_OPENOMTESENT;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synIONP_CLOSEDADJPPROP',22) = 0 THEN BEGIN
       attr := synIONP_CLOSEDADJPPROP;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synIONP_CLOSEDNPPROP',20) = 0 THEN BEGIN
       attr := synIONP_CLOSEDNPPROP;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synIONP_DONP',12) = 0 THEN BEGIN
       attr := synIONP_DONP;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synIONP_HETOPENOMTESENT',23) = 0 THEN BEGIN
       attr := synIONP_HETOPENOMTESENT;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synIONP_HETOPENTESENT',21) = 0 THEN BEGIN
       attr := synIONP_HETOPENTESENT;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synIONP_HETTHATSENT',19) = 0 THEN BEGIN
       attr := synIONP_HETTHATSENT;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synIONP_HETQSENT',16) = 0 THEN BEGIN
       attr := synIONP_HETQSENT;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synIONP_MEASUREPHRASE',21) = 0 THEN BEGIN
       attr := synIONP_MEASUREPHRASE;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synIONP_OPENOMTESENT',20) = 0 THEN BEGIN
       attr := synIONP_OPENOMTESENT;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synIONP_OPENINFSENT',19) = 0 THEN BEGIN
       attr := synIONP_OPENINFSENT;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synIONP_OPENTESENT',18) = 0 THEN BEGIN
       attr := synIONP_OPENTESENT;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synIONP_OTHERCLOSEDPREPPPROP',28) = 0 THEN BEGIN
       attr := synIONP_OTHERCLOSEDPREPPPROP;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synIONP_PREPCLOSEDADJPPROP',26) = 0 THEN BEGIN
       attr := synIONP_PREPCLOSEDADJPPROP;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synIONP_QSENT',13) = 0 THEN BEGIN
       attr := synIONP_QSENT;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synIONP_SOPROSENT',17) = 0 THEN BEGIN
       attr := synIONP_SOPROSENT;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synIONP_THATSENT',16) = 0 THEN BEGIN
       attr := synIONP_THATSENT;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synLOCCLOSEDPREPPPROP',21) = 0 THEN BEGIN
       attr := synLOCCLOSEDPREPPPROP;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synLOCOPENPREPPPROP',19) = 0 THEN BEGIN
       attr := synLOCOPENPREPPPROP;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synLOCPREPP',11) = 0 THEN BEGIN
       attr := synLOCPREPP;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synLOCEMPTY',11) = 0 THEN BEGIN
       attr := synLOCEMPTY;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synMEASUREPHRASE',16) = 0 THEN BEGIN
       attr := synMEASUREPHRASE;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synNP',5) = 0 THEN BEGIN
       attr := synNP;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synOPENADJPPROP',15) = 0 THEN BEGIN
       attr := synOPENADJPPROP;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synOPENINFSENT',14) = 0 THEN BEGIN
       attr := synOPENINFSENT;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synOPENNPPROP',13) = 0 THEN BEGIN
       attr := synOPENNPPROP;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synOPENOMTESENT',15) = 0 THEN BEGIN
       attr := synOPENOMTESENT;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synOPENTESENT',13) = 0 THEN BEGIN
       attr := synOPENTESENT;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synOPENVERBPPROP',16) = 0 THEN BEGIN
       attr := synOPENVERBPPROP;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synOTHERCLOSEDPREPPPROP',23) = 0 THEN BEGIN
       attr := synOTHERCLOSEDPREPPPROP;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synPAPREPOPENOMTESENT',21) = 0 THEN BEGIN
       attr := synPAPREPOPENOMTESENT;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synPAPREPOPENTESENT',19) = 0 THEN BEGIN
       attr := synPAPREPOPENTESENT;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synPAPREPTHATSENT',17) = 0 THEN BEGIN
       attr := synPAPREPTHATSENT;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synPAPREPQSENT',14) = 0 THEN BEGIN
       attr := synPAPREPQSENT;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synPATHPREPP',12) = 0 THEN BEGIN
       attr := synPATHPREPP;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synPOSTADJPREPNP',16) = 0 THEN BEGIN
       attr := synPOSTADJPREPNP;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synPREPCLOSEDADJPPROP',21) = 0 THEN BEGIN
       attr := synPREPCLOSEDADJPPROP;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synPREPCLOSEDNPPROP',19) = 0 THEN BEGIN
       attr := synPREPCLOSEDNPPROP;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synPREPEMPTY',12) = 0 THEN BEGIN
       attr := synPREPEMPTY;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synPREPNP',9) = 0 THEN BEGIN
       attr := synPREPNP;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synPREPNP_PREPNP',16) = 0 THEN BEGIN
       attr := synPREPNP_PREPNP;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synPREPOPENNPPROP',17) = 0 THEN BEGIN
       attr := synPREPOPENNPPROP;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synPREPOPENOMTESENT',19) = 0 THEN BEGIN
       attr := synPREPOPENOMTESENT;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synPREPOPENTESENT',17) = 0 THEN BEGIN
       attr := synPREPOPENTESENT;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synPREPQSENT',12) = 0 THEN BEGIN
       attr := synPREPQSENT;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synPREPTHATSENT',15) = 0 THEN BEGIN
       attr := synPREPTHATSENT;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synPROSENT',10) = 0 THEN BEGIN
       attr := synPROSENT;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synQSENT',8) = 0 THEN BEGIN
       attr := synQSENT;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synSOPROSENT',12) = 0 THEN BEGIN
       attr := synSOPROSENT;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synTHATSENT',11) = 0 THEN BEGIN
       attr := synTHATSENT;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synTHATSENT_LOCOPENPREPPPROP',28) = 0 THEN BEGIN
       attr := synTHATSENT_LOCOPENPREPPPROP;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synVOORNP_DONP',14) = 0 THEN BEGIN
       attr := synVOORNP_DONP;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synVOORNP',9) = 0 THEN BEGIN
       attr := synVOORNP;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synVOOREMPTY',12) = 0 THEN BEGIN
       attr := synVOOREMPTY;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synzijn',7) = 0 THEN BEGIN
       attr := synzijn;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'syndooractive',13) = 0 THEN BEGIN
       attr := syndooractive;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synaanactive',12) = 0 THEN BEGIN
       attr := synaanactive;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synactCVPP',10) = 0 THEN BEGIN
       attr := synactCVPP;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synOPENOMTESENTPROOBJ',21) = 0 THEN BEGIN
       attr := synOPENOMTESENTPROOBJ;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synLOCPREPEMPTY',15) = 0 THEN BEGIN
       attr := synLOCPREPEMPTY;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synDIREMPTY',11) = 0 THEN BEGIN
       attr := synDIREMPTY;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synDONP_PREPTHATSENT',20) = 0 THEN BEGIN
       attr := synDONP_PREPTHATSENT;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synDONP_RESULTEMPTY',19) = 0 THEN BEGIN
       attr := synDONP_RESULTEMPTY;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synDONP_THATSENT',16) = 0 THEN BEGIN
       attr := synDONP_THATSENT;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synEMPTY_PREPEMPTY',18) = 0 THEN BEGIN
       attr := synEMPTY_PREPEMPTY;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synEMPTY_PREPNP',15) = 0 THEN BEGIN
       attr := synEMPTY_PREPNP;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synHETIFSENT',12) = 0 THEN BEGIN
       attr := synHETIFSENT;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synHETQSENT',11) = 0 THEN BEGIN
       attr := synHETQSENT;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synIONP_PREPNP',14) = 0 THEN BEGIN
       attr := synIONP_PREPNP;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synIONP_PROSENT',15) = 0 THEN BEGIN
       attr := synIONP_PROSENT;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synAANNP_PROSENT',16) = 0 THEN BEGIN
       attr := synAANNP_PROSENT;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synEMPTY_PROSENT',16) = 0 THEN BEGIN
       attr := synEMPTY_PROSENT;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synPREPEMPTY_PREPEMPTY',22) = 0 THEN BEGIN
       attr := synPREPEMPTY_PREPEMPTY;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synPREPEMPTY_PREPNP',19) = 0 THEN BEGIN
       attr := synPREPEMPTY_PREPNP;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synPREPNP_PREPEMPTY',19) = 0 THEN BEGIN
       attr := synPREPNP_PREPEMPTY;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synPREPNP_PREPOPENOMTESENT',26) = 0 THEN BEGIN
       attr := synPREPNP_PREPOPENOMTESENT;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synPREPEMPTY_PREPOPENOMTESENT',29) = 0 THEN BEGIN
       attr := synPREPEMPTY_PREPOPENOMTESENT;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synPREPNP_PREPTHATSENT',22) = 0 THEN BEGIN
       attr := synPREPNP_PREPTHATSENT;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synPREPEMPTY_PREPTHATSENT',25) = 0 THEN BEGIN
       attr := synPREPEMPTY_PREPTHATSENT;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synPREPNP_THATSENT',18) = 0 THEN BEGIN
       attr := synPREPNP_THATSENT;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synTEMPOPENPREPPPROP',20) = 0 THEN BEGIN
       attr := synTEMPOPENPREPPPROP;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synDONP_TEMPOPENPREPPPROP',25) = 0 THEN BEGIN
       attr := synDONP_TEMPOPENPREPPPROP;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synPREPOPENINFSENT',18) = 0 THEN BEGIN
       attr := synPREPOPENINFSENT;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synPREPNP_OPENOMTESENT',22) = 0 THEN BEGIN
       attr := synPREPNP_OPENOMTESENT;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synPREPNP_QSENT',15) = 0 THEN BEGIN
       attr := synPREPNP_QSENT;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synDONP_PREPOPENTESENT',22) = 0 THEN BEGIN
       attr := synDONP_PREPOPENTESENT;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synEMPTY_RESULTEMPTY',20) = 0 THEN BEGIN
       attr := synEMPTY_RESULTEMPTY;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synDONP_PREPPROSENT',19) = 0 THEN BEGIN
       attr := synDONP_PREPPROSENT;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synDONP_OPENINFSENT',19) = 0 THEN BEGIN
       attr := synDONP_OPENINFSENT;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synTempADVP',11) = 0 THEN BEGIN
       attr := synTempADVP;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vpid1',5) = 0 THEN BEGIN
       attr := vpid1;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vpid2',5) = 0 THEN BEGIN
       attr := vpid2;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vpid3',5) = 0 THEN BEGIN
       attr := vpid3;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vpid4',5) = 0 THEN BEGIN
       attr := vpid4;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vpid5',5) = 0 THEN BEGIN
       attr := vpid5;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vpid6',5) = 0 THEN BEGIN
       attr := vpid6;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vpid7',5) = 0 THEN BEGIN
       attr := vpid7;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vpid8',5) = 0 THEN BEGIN
       attr := vpid8;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vpid9',5) = 0 THEN BEGIN
       attr := vpid9;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vpid10',6) = 0 THEN BEGIN
       attr := vpid10;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vpid11',6) = 0 THEN BEGIN
       attr := vpid11;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vpid12',6) = 0 THEN BEGIN
       attr := vpid12;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vpid13',6) = 0 THEN BEGIN
       attr := vpid13;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vpid14',6) = 0 THEN BEGIN
       attr := vpid14;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vpid15',6) = 0 THEN BEGIN
       attr := vpid15;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vpid16',6) = 0 THEN BEGIN
       attr := vpid16;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vpid17',6) = 0 THEN BEGIN
       attr := vpid17;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vpid18',6) = 0 THEN BEGIN
       attr := vpid18;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vpid19',6) = 0 THEN BEGIN
       attr := vpid19;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vpid20',6) = 0 THEN BEGIN
       attr := vpid20;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vpid21',6) = 0 THEN BEGIN
       attr := vpid21;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vpid22',6) = 0 THEN BEGIN
       attr := vpid22;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vpid23',6) = 0 THEN BEGIN
       attr := vpid23;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vpid24',6) = 0 THEN BEGIN
       attr := vpid24;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vpid25',6) = 0 THEN BEGIN
       attr := vpid25;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vpid26',6) = 0 THEN BEGIN
       attr := vpid26;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vpid27',6) = 0 THEN BEGIN
       attr := vpid27;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vpid28',6) = 0 THEN BEGIN
       attr := vpid28;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vpid29',6) = 0 THEN BEGIN
       attr := vpid29;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vpid30',6) = 0 THEN BEGIN
       attr := vpid30;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vpid31',6) = 0 THEN BEGIN
       attr := vpid31;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vpid32',6) = 0 THEN BEGIN
       attr := vpid32;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vpid33',6) = 0 THEN BEGIN
       attr := vpid33;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vpid34',6) = 0 THEN BEGIN
       attr := vpid34;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vpid35',6) = 0 THEN BEGIN
       attr := vpid35;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vpid36',6) = 0 THEN BEGIN
       attr := vpid36;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vpid37',6) = 0 THEN BEGIN
       attr := vpid37;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vpid38',6) = 0 THEN BEGIN
       attr := vpid38;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vpid39',6) = 0 THEN BEGIN
       attr := vpid39;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vpid40',6) = 0 THEN BEGIN
       attr := vpid40;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synCLAUSE',9) = 0 THEN BEGIN
       attr := synCLAUSE;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synVERBPPROP',12) = 0 THEN BEGIN
       attr := synVERBPPROP;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vpid41',6) = 0 THEN BEGIN
       attr := vpid41;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vpid42',6) = 0 THEN BEGIN
       attr := vpid42;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vpid43',6) = 0 THEN BEGIN
       attr := vpid43;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vpid44',6) = 0 THEN BEGIN
       attr := vpid44;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vpid45',6) = 0 THEN BEGIN
       attr := vpid45;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vpid46',6) = 0 THEN BEGIN
       attr := vpid46;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vpid47',6) = 0 THEN BEGIN
       attr := vpid47;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vpid48',6) = 0 THEN BEGIN
       attr := vpid48;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vpid49',6) = 0 THEN BEGIN
       attr := vpid49;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vpid50',6) = 0 THEN BEGIN
       attr := vpid50;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vpid51',6) = 0 THEN BEGIN
       attr := vpid51;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vpid52',6) = 0 THEN BEGIN
       attr := vpid52;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vpid53',6) = 0 THEN BEGIN
       attr := vpid53;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vpid54',6) = 0 THEN BEGIN
       attr := vpid54;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vpid55',6) = 0 THEN BEGIN
       attr := vpid55;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vpid56',6) = 0 THEN BEGIN
       attr := vpid56;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vpid57',6) = 0 THEN BEGIN
       attr := vpid57;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vpid58',6) = 0 THEN BEGIN
       attr := vpid58;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vpid59',6) = 0 THEN BEGIN
       attr := vpid59;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vpid60',6) = 0 THEN BEGIN
       attr := vpid60;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vpid61',6) = 0 THEN BEGIN
       attr := vpid61;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vpid62',6) = 0 THEN BEGIN
       attr := vpid62;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vpid63',6) = 0 THEN BEGIN
       attr := vpid63;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vpid64',6) = 0 THEN BEGIN
       attr := vpid64;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vpid65',6) = 0 THEN BEGIN
       attr := vpid65;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vpid66',6) = 0 THEN BEGIN
       attr := vpid66;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vpid67',6) = 0 THEN BEGIN
       attr := vpid67;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vpid68',6) = 0 THEN BEGIN
       attr := vpid68;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vpid69',6) = 0 THEN BEGIN
       attr := vpid69;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vpid70',6) = 0 THEN BEGIN
       attr := vpid70;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vpid71',6) = 0 THEN BEGIN
       attr := vpid71;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vpid72',6) = 0 THEN BEGIN
       attr := vpid72;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vpid73',6) = 0 THEN BEGIN
       attr := vpid73;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vpid74',6) = 0 THEN BEGIN
       attr := vpid74;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vpid75',6) = 0 THEN BEGIN
       attr := vpid75;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vpid76',6) = 0 THEN BEGIN
       attr := vpid76;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vpid77',6) = 0 THEN BEGIN
       attr := vpid77;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vpid78',6) = 0 THEN BEGIN
       attr := vpid78;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vpid79',6) = 0 THEN BEGIN
       attr := vpid79;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vpid80',6) = 0 THEN BEGIN
       attr := vpid80;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vpid81',6) = 0 THEN BEGIN
       attr := vpid81;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vpid82',6) = 0 THEN BEGIN
       attr := vpid82;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vpid83',6) = 0 THEN BEGIN
       attr := vpid83;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vpid84',6) = 0 THEN BEGIN
       attr := vpid84;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vpid85',6) = 0 THEN BEGIN
       attr := vpid85;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vpid86',6) = 0 THEN BEGIN
       attr := vpid86;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vpid87',6) = 0 THEN BEGIN
       attr := vpid87;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vpid88',6) = 0 THEN BEGIN
       attr := vpid88;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vpid89',6) = 0 THEN BEGIN
       attr := vpid89;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vpid90',6) = 0 THEN BEGIN
       attr := vpid90;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vpid91',6) = 0 THEN BEGIN
       attr := vpid91;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vpid92',6) = 0 THEN BEGIN
       attr := vpid92;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vpid93',6) = 0 THEN BEGIN
       attr := vpid93;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vpid94',6) = 0 THEN BEGIN
       attr := vpid94;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vpid95',6) = 0 THEN BEGIN
       attr := vpid95;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vpid96',6) = 0 THEN BEGIN
       attr := vpid96;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vpid97',6) = 0 THEN BEGIN
       attr := vpid97;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vpid98',6) = 0 THEN BEGIN
       attr := vpid98;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vpid99',6) = 0 THEN BEGIN
       attr := vpid99;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vpid100',7) = 0 THEN BEGIN
       attr := vpid100;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vpid101',7) = 0 THEN BEGIN
       attr := vpid101;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vpid102',7) = 0 THEN BEGIN
       attr := vpid102;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vpid103',7) = 0 THEN BEGIN
       attr := vpid103;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vpid104',7) = 0 THEN BEGIN
       attr := vpid104;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vpid105',7) = 0 THEN BEGIN
       attr := vpid105;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vpid106',7) = 0 THEN BEGIN
       attr := vpid106;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vpid107',7) = 0 THEN BEGIN
       attr := vpid107;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vpid108',7) = 0 THEN BEGIN
       attr := vpid108;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vpid109',7) = 0 THEN BEGIN
       attr := vpid109;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vpid110',7) = 0 THEN BEGIN
       attr := vpid110;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vpid111',7) = 0 THEN BEGIN
       attr := vpid111;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vpid112',7) = 0 THEN BEGIN
       attr := vpid112;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vpid113',7) = 0 THEN BEGIN
       attr := vpid113;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vpid114',7) = 0 THEN BEGIN
       attr := vpid114;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vpid115',7) = 0 THEN BEGIN
       attr := vpid115;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vpid116',7) = 0 THEN BEGIN
       attr := vpid116;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vpid117',7) = 0 THEN BEGIN
       attr := vpid117;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vpid118',7) = 0 THEN BEGIN
       attr := vpid118;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vpid119',7) = 0 THEN BEGIN
       attr := vpid119;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vpid120',7) = 0 THEN BEGIN
       attr := vpid120;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vpid121',7) = 0 THEN BEGIN
       attr := vpid121;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vpid122',7) = 0 THEN BEGIN
       attr := vpid122;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vpid123',7) = 0 THEN BEGIN
       attr := vpid123;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vpid124',7) = 0 THEN BEGIN
       attr := vpid124;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vpid125',7) = 0 THEN BEGIN
       attr := vpid125;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vpid126',7) = 0 THEN BEGIN
       attr := vpid126;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vpid127',7) = 0 THEN BEGIN
       attr := vpid127;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vpid128',7) = 0 THEN BEGIN
       attr := vpid128;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vpid129',7) = 0 THEN BEGIN
       attr := vpid129;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vpid130',7) = 0 THEN BEGIN
       attr := vpid130;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vpid131',7) = 0 THEN BEGIN
       attr := vpid131;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vpid132',7) = 0 THEN BEGIN
       attr := vpid132;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vpid133',7) = 0 THEN BEGIN
       attr := vpid133;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vpid134',7) = 0 THEN BEGIN
       attr := vpid134;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vpid135',7) = 0 THEN BEGIN
       attr := vpid135;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vpid136',7) = 0 THEN BEGIN
       attr := vpid136;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vpid137',7) = 0 THEN BEGIN
       attr := vpid137;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vpid138',7) = 0 THEN BEGIN
       attr := vpid138;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vpid139',7) = 0 THEN BEGIN
       attr := vpid139;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vpid140',7) = 0 THEN BEGIN
       attr := vpid140;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vpid141',7) = 0 THEN BEGIN
       attr := vpid141;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vpid142',7) = 0 THEN BEGIN
       attr := vpid142;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vpid143',7) = 0 THEN BEGIN
       attr := vpid143;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vpid144',7) = 0 THEN BEGIN
       attr := vpid144;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vpid145',7) = 0 THEN BEGIN
       attr := vpid145;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vpid146',7) = 0 THEN BEGIN
       attr := vpid146;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vpid147',7) = 0 THEN BEGIN
       attr := vpid147;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vpid148',7) = 0 THEN BEGIN
       attr := vpid148;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vpid149',7) = 0 THEN BEGIN
       attr := vpid149;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vpid150',7) = 0 THEN BEGIN
       attr := vpid150;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vpid151',7) = 0 THEN BEGIN
       attr := vpid151;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vpid152',7) = 0 THEN BEGIN
       attr := vpid152;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vpid153',7) = 0 THEN BEGIN
       attr := vpid153;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vpid154',7) = 0 THEN BEGIN
       attr := vpid154;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vpid155',7) = 0 THEN BEGIN
       attr := vpid155;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vpid156',7) = 0 THEN BEGIN
       attr := vpid156;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vpid157',7) = 0 THEN BEGIN
       attr := vpid157;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vpid158',7) = 0 THEN BEGIN
       attr := vpid158;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vpid159',7) = 0 THEN BEGIN
       attr := vpid159;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vpid160',7) = 0 THEN BEGIN
       attr := vpid160;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vpid161',7) = 0 THEN BEGIN
       attr := vpid161;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vpid162',7) = 0 THEN BEGIN
       attr := vpid162;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vpid163',7) = 0 THEN BEGIN
       attr := vpid163;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vpid164',7) = 0 THEN BEGIN
       attr := vpid164;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vpid165',7) = 0 THEN BEGIN
       attr := vpid165;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vpid166',7) = 0 THEN BEGIN
       attr := vpid166;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vpid167',7) = 0 THEN BEGIN
       attr := vpid167;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vpid168',7) = 0 THEN BEGIN
       attr := vpid168;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vpid169',7) = 0 THEN BEGIN
       attr := vpid169;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vpid170',7) = 0 THEN BEGIN
       attr := vpid170;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vpid171',7) = 0 THEN BEGIN
       attr := vpid171;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vpid172',7) = 0 THEN BEGIN
       attr := vpid172;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vpid173',7) = 0 THEN BEGIN
       attr := vpid173;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vpid174',7) = 0 THEN BEGIN
       attr := vpid174;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vpid175',7) = 0 THEN BEGIN
       attr := vpid175;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vpid176',7) = 0 THEN BEGIN
       attr := vpid176;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vpid177',7) = 0 THEN BEGIN
       attr := vpid177;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vpid178',7) = 0 THEN BEGIN
       attr := vpid178;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vpid179',7) = 0 THEN BEGIN
       attr := vpid179;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vpid180',7) = 0 THEN BEGIN
       attr := vpid180;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vpid181',7) = 0 THEN BEGIN
       attr := vpid181;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vpid182',7) = 0 THEN BEGIN
       attr := vpid182;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vpid183',7) = 0 THEN BEGIN
       attr := vpid183;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vpid184',7) = 0 THEN BEGIN
       attr := vpid184;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vpid185',7) = 0 THEN BEGIN
       attr := vpid185;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vpid186',7) = 0 THEN BEGIN
       attr := vpid186;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vpid187',7) = 0 THEN BEGIN
       attr := vpid187;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vpid188',7) = 0 THEN BEGIN
       attr := vpid188;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vpid189',7) = 0 THEN BEGIN
       attr := vpid189;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vpid190',7) = 0 THEN BEGIN
       attr := vpid190;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vpid191',7) = 0 THEN BEGIN
       attr := vpid191;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vpid192',7) = 0 THEN BEGIN
       attr := vpid192;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vpid193',7) = 0 THEN BEGIN
       attr := vpid193;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vpid194',7) = 0 THEN BEGIN
       attr := vpid194;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vpid195',7) = 0 THEN BEGIN
       attr := vpid195;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vpid196',7) = 0 THEN BEGIN
       attr := vpid196;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vpid197',7) = 0 THEN BEGIN
       attr := vpid197;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vpid198',7) = 0 THEN BEGIN
       attr := vpid198;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vpid199',7) = 0 THEN BEGIN
       attr := vpid199;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vpid200',7) = 0 THEN BEGIN
       attr := vpid200;
       found := TRUE
       END;
   LSSTRTOTYPE_synpatterntype := found;
END {LSSTRTOTYPE_synpatterntype};


FUNCTION LSSTRTOTYPE_syntquanttype( 
         CONST str: STRING;
         l: STR_Range;
         VAR attr : LSDOMAINT_syntquanttype         ): BOOLEAN;
VAR found: BOOLEAN;
BEGIN
   found := FALSE;
   IF FALSE THEN BEGIN
      END
   ELSE IF STR_Compare(str, l, 'Aquant',6) = 0 THEN BEGIN
       attr := Aquant;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'Equant',6) = 0 THEN BEGIN
       attr := Equant;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'Omegaquant',10) = 0 THEN BEGIN
       attr := Omegaquant;
       found := TRUE
       END;
   LSSTRTOTYPE_syntquanttype := found;
END {LSSTRTOTYPE_syntquanttype};


FUNCTION LSSTRTOTYPE_tensetype( 
         CONST str: STRING;
         l: STR_Range;
         VAR attr : LSDOMAINT_tensetype         ): BOOLEAN;
VAR found: BOOLEAN;
BEGIN
   found := FALSE;
   IF FALSE THEN BEGIN
      END
   ELSE IF STR_Compare(str, l, 'omegatense',10) = 0 THEN BEGIN
       attr := omegatense;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'presenttense',12) = 0 THEN BEGIN
       attr := presenttense;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'pasttense',9) = 0 THEN BEGIN
       attr := pasttense;
       found := TRUE
       END;
   LSSTRTOTYPE_tensetype := found;
END {LSSTRTOTYPE_tensetype};


FUNCTION LSSTRTOTYPE_thanascompltype( 
         CONST str: STRING;
         l: STR_Range;
         VAR attr : LSDOMAINT_thanascompltype         ): BOOLEAN;
VAR found: BOOLEAN;
BEGIN
   found := FALSE;
   IF FALSE THEN BEGIN
      END
   ELSE IF STR_Compare(str, l, 'omegacompl',10) = 0 THEN BEGIN
       attr := omegacompl;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vancompl',8) = 0 THEN BEGIN
       attr := vancompl;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'dancompl',8) = 0 THEN BEGIN
       attr := dancompl;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'omcompl',7) = 0 THEN BEGIN
       attr := omcompl;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'datcompl',8) = 0 THEN BEGIN
       attr := datcompl;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'alscompl',8) = 0 THEN BEGIN
       attr := alscompl;
       found := TRUE
       END;
   LSSTRTOTYPE_thanascompltype := found;
END {LSSTRTOTYPE_thanascompltype};


FUNCTION LSSTRTOTYPE_thetaadjtype( 
         CONST str: STRING;
         l: STR_Range;
         VAR attr : LSDOMAINT_thetaadjtype         ): BOOLEAN;
VAR found: BOOLEAN;
BEGIN
   found := FALSE;
   IF FALSE THEN BEGIN
      END
   ELSE IF STR_Compare(str, l, 'omegathetaadjp',14) = 0 THEN BEGIN
       attr := omegathetaadjp;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'adjp000',7) = 0 THEN BEGIN
       attr := adjp000;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'adjp100',7) = 0 THEN BEGIN
       attr := adjp100;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'adjp120',7) = 0 THEN BEGIN
       attr := adjp120;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'adjp123',7) = 0 THEN BEGIN
       attr := adjp123;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'adjp012',7) = 0 THEN BEGIN
       attr := adjp012;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'adjp010',7) = 0 THEN BEGIN
       attr := adjp010;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'adjp210',7) = 0 THEN BEGIN
       attr := adjp210;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'adjp021',7) = 0 THEN BEGIN
       attr := adjp021;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'adjp132',7) = 0 THEN BEGIN
       attr := adjp132;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'adjp213',7) = 0 THEN BEGIN
       attr := adjp213;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'adjp231',7) = 0 THEN BEGIN
       attr := adjp231;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'adjp312',7) = 0 THEN BEGIN
       attr := adjp312;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'adjp321',7) = 0 THEN BEGIN
       attr := adjp321;
       found := TRUE
       END;
   LSSTRTOTYPE_thetaadjtype := found;
END {LSSTRTOTYPE_thetaadjtype};


FUNCTION LSSTRTOTYPE_thetaadvtype( 
         CONST str: STRING;
         l: STR_Range;
         VAR attr : LSDOMAINT_thetaadvtype         ): BOOLEAN;
VAR found: BOOLEAN;
BEGIN
   found := FALSE;
   IF FALSE THEN BEGIN
      END
   ELSE IF STR_Compare(str, l, 'omegathetaadv',13) = 0 THEN BEGIN
       attr := omegathetaadv;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'thetaadv100',11) = 0 THEN BEGIN
       attr := thetaadv100;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'thetaadv010',11) = 0 THEN BEGIN
       attr := thetaadv010;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'thetaadv120',11) = 0 THEN BEGIN
       attr := thetaadv120;
       found := TRUE
       END;
   LSSTRTOTYPE_thetaadvtype := found;
END {LSSTRTOTYPE_thetaadvtype};


FUNCTION LSSTRTOTYPE_thetanptype( 
         CONST str: STRING;
         l: STR_Range;
         VAR attr : LSDOMAINT_thetanptype         ): BOOLEAN;
VAR found: BOOLEAN;
BEGIN
   found := FALSE;
   IF FALSE THEN BEGIN
      END
   ELSE IF STR_Compare(str, l, 'omegathetanp',12) = 0 THEN BEGIN
       attr := omegathetanp;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'thetanp0',8) = 0 THEN BEGIN
       attr := thetanp0;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'thetanp1',8) = 0 THEN BEGIN
       attr := thetanp1;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'thetanp2',8) = 0 THEN BEGIN
       attr := thetanp2;
       found := TRUE
       END;
   LSSTRTOTYPE_thetanptype := found;
END {LSSTRTOTYPE_thetanptype};


FUNCTION LSSTRTOTYPE_thetapptype( 
         CONST str: STRING;
         l: STR_Range;
         VAR attr : LSDOMAINT_thetapptype         ): BOOLEAN;
VAR found: BOOLEAN;
BEGIN
   found := FALSE;
   IF FALSE THEN BEGIN
      END
   ELSE IF STR_Compare(str, l, 'omegathetapp',12) = 0 THEN BEGIN
       attr := omegathetapp;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'pp000',5) = 0 THEN BEGIN
       attr := pp000;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'pp010',5) = 0 THEN BEGIN
       attr := pp010;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'pp100',5) = 0 THEN BEGIN
       attr := pp100;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'pp120',5) = 0 THEN BEGIN
       attr := pp120;
       found := TRUE
       END;
   LSSTRTOTYPE_thetapptype := found;
END {LSSTRTOTYPE_thetapptype};


FUNCTION LSSTRTOTYPE_thetavptype( 
         CONST str: STRING;
         l: STR_Range;
         VAR attr : LSDOMAINT_thetavptype         ): BOOLEAN;
VAR found: BOOLEAN;
BEGIN
   found := FALSE;
   IF FALSE THEN BEGIN
      END
   ELSE IF STR_Compare(str, l, 'omegathetavp',12) = 0 THEN BEGIN
       attr := omegathetavp;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vp000',5) = 0 THEN BEGIN
       attr := vp000;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vp100',5) = 0 THEN BEGIN
       attr := vp100;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vp010',5) = 0 THEN BEGIN
       attr := vp010;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vp120',5) = 0 THEN BEGIN
       attr := vp120;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vp012',5) = 0 THEN BEGIN
       attr := vp012;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vp123',5) = 0 THEN BEGIN
       attr := vp123;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'thetavpaux',10) = 0 THEN BEGIN
       attr := thetavpaux;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vp210',5) = 0 THEN BEGIN
       attr := vp210;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vp021',5) = 0 THEN BEGIN
       attr := vp021;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vp321',5) = 0 THEN BEGIN
       attr := vp321;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vp312',5) = 0 THEN BEGIN
       attr := vp312;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vp132',5) = 0 THEN BEGIN
       attr := vp132;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vp231',5) = 0 THEN BEGIN
       attr := vp231;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vp213',5) = 0 THEN BEGIN
       attr := vp213;
       found := TRUE
       END;
   LSSTRTOTYPE_thetavptype := found;
END {LSSTRTOTYPE_thetavptype};


FUNCTION LSSTRTOTYPE_timeadvclasstype( 
         CONST str: STRING;
         l: STR_Range;
         VAR attr : LSDOMAINT_timeadvclasstype         ): BOOLEAN;
VAR found: BOOLEAN;
BEGIN
   found := FALSE;
   IF FALSE THEN BEGIN
      END
   ELSE IF STR_Compare(str, l, 'duration',8) = 0 THEN BEGIN
       attr := duration;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'reference',9) = 0 THEN BEGIN
       attr := reference;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'frequential',11) = 0 THEN BEGIN
       attr := frequential;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'omegaTimeAdvClass',17) = 0 THEN BEGIN
       attr := omegaTimeAdvClass;
       found := TRUE
       END;
   LSSTRTOTYPE_timeadvclasstype := found;
END {LSSTRTOTYPE_timeadvclasstype};


FUNCTION LSSTRTOTYPE_verbraisertype( 
         CONST str: STRING;
         l: STR_Range;
         VAR attr : LSDOMAINT_verbraisertype         ): BOOLEAN;
VAR found: BOOLEAN;
BEGIN
   found := FALSE;
   IF FALSE THEN BEGIN
      END
   ELSE IF STR_Compare(str, l, 'OptionalVR',10) = 0 THEN BEGIN
       attr := OptionalVR;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'obligatoryVR',12) = 0 THEN BEGIN
       attr := obligatoryVR;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'noVR',4) = 0 THEN BEGIN
       attr := noVR;
       found := TRUE
       END;
   LSSTRTOTYPE_verbraisertype := found;
END {LSSTRTOTYPE_verbraisertype};


FUNCTION LSSTRTOTYPE_verbsubctype( 
         CONST str: STRING;
         l: STR_Range;
         VAR attr : LSDOMAINT_verbsubctype         ): BOOLEAN;
VAR found: BOOLEAN;
BEGIN
   found := FALSE;
   IF FALSE THEN BEGIN
      END
   ELSE IF STR_Compare(str, l, 'Mainverb',8) = 0 THEN BEGIN
       attr := Mainverb;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'Modalverb',9) = 0 THEN BEGIN
       attr := Modalverb;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'progaux',7) = 0 THEN BEGIN
       attr := progaux;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'hebbenaux',9) = 0 THEN BEGIN
       attr := hebbenaux;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'zijnaux',7) = 0 THEN BEGIN
       attr := zijnaux;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'latenverb',9) = 0 THEN BEGIN
       attr := latenverb;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'wordenaux',9) = 0 THEN BEGIN
       attr := wordenaux;
       found := TRUE
       END;
   LSSTRTOTYPE_verbsubctype := found;
END {LSSTRTOTYPE_verbsubctype};


FUNCTION LSSTRTOTYPE_voicetype( 
         CONST str: STRING;
         l: STR_Range;
         VAR attr : LSDOMAINT_voicetype         ): BOOLEAN;
VAR found: BOOLEAN;
BEGIN
   found := FALSE;
   IF FALSE THEN BEGIN
      END
   ELSE IF STR_Compare(str, l, 'Active',6) = 0 THEN BEGIN
       attr := Active;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'Passive',7) = 0 THEN BEGIN
       attr := Passive;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'AanActive',9) = 0 THEN BEGIN
       attr := AanActive;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'DoorActive',10) = 0 THEN BEGIN
       attr := DoorActive;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'Omegavoice',10) = 0 THEN BEGIN
       attr := Omegavoice;
       found := TRUE
       END;
   LSSTRTOTYPE_voicetype := found;
END {LSSTRTOTYPE_voicetype};


FUNCTION LSSTRTOTYPE_vstatustype( 
         CONST str: STRING;
         l: STR_Range;
         VAR attr : LSDOMAINT_vstatustype         ): BOOLEAN;
VAR found: BOOLEAN;
BEGIN
   found := FALSE;
   IF FALSE THEN BEGIN
      END
   ELSE IF STR_Compare(str, l, 'bareV',5) = 0 THEN BEGIN
       attr := bareV;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'teV',3) = 0 THEN BEGIN
       attr := teV;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'partV',5) = 0 THEN BEGIN
       attr := partV;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'VV',2) = 0 THEN BEGIN
       attr := VV;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'AuxV',4) = 0 THEN BEGIN
       attr := AuxV;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'PartTeV',7) = 0 THEN BEGIN
       attr := PartTeV;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'aanhetV',7) = 0 THEN BEGIN
       attr := aanhetV;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'teVV',4) = 0 THEN BEGIN
       attr := teVV;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'teAuxV',6) = 0 THEN BEGIN
       attr := teAuxV;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'prepV',5) = 0 THEN BEGIN
       attr := prepV;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'prepteV',7) = 0 THEN BEGIN
       attr := prepteV;
       found := TRUE
       END;
   LSSTRTOTYPE_vstatustype := found;
END {LSSTRTOTYPE_vstatustype};


FUNCTION LSSTRTOTYPE_xpmoodtype( 
         CONST str: STRING;
         l: STR_Range;
         VAR attr : LSDOMAINT_xpmoodtype         ): BOOLEAN;
VAR found: BOOLEAN;
BEGIN
   found := FALSE;
   IF FALSE THEN BEGIN
      END
   ELSE IF STR_Compare(str, l, 'wh',2) = 0 THEN BEGIN
       attr := wh;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'declxpmood',10) = 0 THEN BEGIN
       attr := declxpmood;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'relativexpmood',14) = 0 THEN BEGIN
       attr := relativexpmood;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'topicxpmood',11) = 0 THEN BEGIN
       attr := topicxpmood;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'proobjxpmood',12) = 0 THEN BEGIN
       attr := proobjxpmood;
       found := TRUE
       END;
   LSSTRTOTYPE_xpmoodtype := found;
END {LSSTRTOTYPE_xpmoodtype};



FUNCTION LSSTRTOTYPE_conjclasstype( 
         CONST str: STRING;
         l: STR_Range;
         VAR attr : LSDOMAINT_conjclasstype         ): BOOLEAN;
VAR tmp   : INTEGER;
    result: BOOLEAN;
BEGIN
   tmp := -1;
   result := STR_StrToInteger(str, l, tmp);
   IF result AND ( 0 <= tmp ) AND ( tmp <= 16 ) THEN BEGIN
      attr := tmp; LSSTRTOTYPE_conjclasstype := TRUE
      END
 ELSE BEGIN
      LSSTRTOTYPE_conjclasstype := FALSE
   END;END {LSSTRTOTYPE_conjclasstype};


FUNCTION LSSTRTOTYPE_persontype( 
         CONST str: STRING;
         l: STR_Range;
         VAR attr : LSDOMAINT_persontype         ): BOOLEAN;
VAR tmp   : INTEGER;
    result: BOOLEAN;
BEGIN
   tmp := -1;
   result := STR_StrToInteger(str, l, tmp);
   IF result AND ( 0 <= tmp ) AND ( tmp <= 6 ) THEN BEGIN
      attr := tmp; LSSTRTOTYPE_persontype := TRUE
      END
 ELSE BEGIN
      LSSTRTOTYPE_persontype := FALSE
   END;END {LSSTRTOTYPE_persontype};


FUNCTION LSSTRTOTYPE_pronpersontype( 
         CONST str: STRING;
         l: STR_Range;
         VAR attr : LSDOMAINT_pronpersontype         ): BOOLEAN;
VAR tmp   : INTEGER;
    result: BOOLEAN;
BEGIN
   tmp := -1;
   result := STR_StrToInteger(str, l, tmp);
   IF result AND ( 1 <= tmp ) AND ( tmp <= 6 ) THEN BEGIN
      attr := tmp; LSSTRTOTYPE_pronpersontype := TRUE
      END
 ELSE BEGIN
      LSSTRTOTYPE_pronpersontype := FALSE
   END;END {LSSTRTOTYPE_pronpersontype};


FUNCTION LSSTRTOTYPE_valuetype( 
         CONST str: STRING;
         l: STR_Range;
         VAR attr : LSDOMAINT_valuetype         ): BOOLEAN;
VAR tmp   : INTEGER;
    result: BOOLEAN;
BEGIN
   tmp := -1;
   result := STR_StrToInteger(str, l, tmp);
   IF result AND ( 0 <= tmp ) AND ( tmp <= 9 ) THEN BEGIN
      attr := tmp; LSSTRTOTYPE_valuetype := TRUE
      END
 ELSE BEGIN
      LSSTRTOTYPE_valuetype := FALSE
   END;END {LSSTRTOTYPE_valuetype};



