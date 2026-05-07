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
   ELSE IF STR_Compare(str, l, 'notpositive',11) = 0 THEN BEGIN
       attr := notpositive;
       found := TRUE
       END;
   LSSTRTOTYPE_adjadvformtype := found;
END {LSSTRTOTYPE_adjadvformtype};


FUNCTION LSSTRTOTYPE_adjpluralformatype( 
         CONST str: STRING;
         l: STR_Range;
         VAR attr : LSDOMAINT_adjpluralformatype         ): BOOLEAN;
VAR found: BOOLEAN;
BEGIN
   found := FALSE;
   IF FALSE THEN BEGIN
      END
   ELSE IF STR_Compare(str, l, 'reg',3) = 0 THEN BEGIN
       attr := reg;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'irreg',5) = 0 THEN BEGIN
       attr := irreg;
       found := TRUE
       END;
   LSSTRTOTYPE_adjpluralformatype := found;
END {LSSTRTOTYPE_adjpluralformatype};


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
   ELSE IF STR_Compare(str, l, 'Causadv',7) = 0 THEN BEGIN
       attr := Causadv;
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
   ELSE IF STR_Compare(str, l, 'PostXPAdv',9) = 0 THEN BEGIN
       attr := PostXPAdv;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'OtherAdv',8) = 0 THEN BEGIN
       attr := OtherAdv;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'VolAdv',6) = 0 THEN BEGIN
       attr := VolAdv;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'PrepPAdv',8) = 0 THEN BEGIN
       attr := PrepPAdv;
       found := TRUE
       END;
   LSSTRTOTYPE_advsubctype := found;
END {LSSTRTOTYPE_advsubctype};


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


FUNCTION LSSTRTOTYPE_aloclasetype( 
         CONST str: STRING;
         l: STR_Range;
         VAR attr : LSDOMAINT_aloclasetype         ): BOOLEAN;
VAR found: BOOLEAN;
BEGIN
   found := FALSE;
   IF FALSE THEN BEGIN
      END
   ELSE IF STR_Compare(str, l, 'diftongCLASE',12) = 0 THEN BEGIN
       attr := diftongCLASE;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'irrMedekCLASE',13) = 0 THEN BEGIN
       attr := irrMedekCLASE;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'sterkCLASE',10) = 0 THEN BEGIN
       attr := sterkCLASE;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'eiouHalfCLASE',13) = 0 THEN BEGIN
       attr := eiouHalfCLASE;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'eiouHeelCLASE',13) = 0 THEN BEGIN
       attr := eiouHeelCLASE;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'yMinPresCLASE',13) = 0 THEN BEGIN
       attr := yMinPresCLASE;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'eiouPDCLASE',11) = 0 THEN BEGIN
       attr := eiouPDCLASE;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'umlautCLASE',11) = 0 THEN BEGIN
       attr := umlautCLASE;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'veCLASE',7) = 0 THEN BEGIN
       attr := veCLASE;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'yPlusPresCLASE',14) = 0 THEN BEGIN
       attr := yPlusPresCLASE;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'bendicCLASE',11) = 0 THEN BEGIN
       attr := bendicCLASE;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'sepaCLASE',9) = 0 THEN BEGIN
       attr := sepaCLASE;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'nadaCLASE',9) = 0 THEN BEGIN
       attr := nadaCLASE;
       found := TRUE
       END;
   LSSTRTOTYPE_aloclasetype := found;
END {LSSTRTOTYPE_aloclasetype};


FUNCTION LSSTRTOTYPE_animatetype( 
         CONST str: STRING;
         l: STR_Range;
         VAR attr : LSDOMAINT_animatetype         ): BOOLEAN;
VAR found: BOOLEAN;
BEGIN
   found := FALSE;
   IF FALSE THEN BEGIN
      END
   ELSE IF STR_Compare(str, l, 'YesAnimate',10) = 0 THEN BEGIN
       attr := YesAnimate;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'NoAnimate',9) = 0 THEN BEGIN
       attr := NoAnimate;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'OmegaAnimate',12) = 0 THEN BEGIN
       attr := OmegaAnimate;
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


FUNCTION LSSTRTOTYPE_aspectotype( 
         CONST str: STRING;
         l: STR_Range;
         VAR attr : LSDOMAINT_aspectotype         ): BOOLEAN;
VAR found: BOOLEAN;
BEGIN
   found := FALSE;
   IF FALSE THEN BEGIN
      END
   ELSE IF STR_Compare(str, l, 'habitual',8) = 0 THEN BEGIN
       attr := habitual;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'imperfectivo',12) = 0 THEN BEGIN
       attr := imperfectivo;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'perfectivo',10) = 0 THEN BEGIN
       attr := perfectivo;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'omegaaspecto',12) = 0 THEN BEGIN
       attr := omegaaspecto;
       found := TRUE
       END;
   LSSTRTOTYPE_aspectotype := found;
END {LSSTRTOTYPE_aspectotype};


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
   ELSE IF STR_Compare(str, l, 'accusative',10) = 0 THEN BEGIN
       attr := accusative;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'dative',6) = 0 THEN BEGIN
       attr := dative;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'prepositive',11) = 0 THEN BEGIN
       attr := prepositive;
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


FUNCTION LSSTRTOTYPE_concordgenerotype( 
         CONST str: STRING;
         l: STR_Range;
         VAR attr : LSDOMAINT_concordgenerotype         ): BOOLEAN;
VAR found: BOOLEAN;
BEGIN
   found := FALSE;
   IF FALSE THEN BEGIN
      END
   ELSE IF STR_Compare(str, l, 'mascul',6) = 0 THEN BEGIN
       attr := mascul;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'femin',5) = 0 THEN BEGIN
       attr := femin;
       found := TRUE
       END;
   LSSTRTOTYPE_concordgenerotype := found;
END {LSSTRTOTYPE_concordgenerotype};


FUNCTION LSSTRTOTYPE_concordnumerotype( 
         CONST str: STRING;
         l: STR_Range;
         VAR attr : LSDOMAINT_concordnumerotype         ): BOOLEAN;
VAR found: BOOLEAN;
BEGIN
   found := FALSE;
   IF FALSE THEN BEGIN
      END
   ELSE IF STR_Compare(str, l, 'sing',4) = 0 THEN BEGIN
       attr := sing;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'plur',4) = 0 THEN BEGIN
       attr := plur;
       found := TRUE
       END;
   LSSTRTOTYPE_concordnumerotype := found;
END {LSSTRTOTYPE_concordnumerotype};


FUNCTION LSSTRTOTYPE_conjclasetype( 
         CONST str: STRING;
         l: STR_Range;
         VAR attr : LSDOMAINT_conjclasetype         ): BOOLEAN;
VAR found: BOOLEAN;
BEGIN
   found := FALSE;
   IF FALSE THEN BEGIN
      END
   ELSE IF STR_Compare(str, l, 'CONJ0',5) = 0 THEN BEGIN
       attr := CONJ0;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'CONJ1',5) = 0 THEN BEGIN
       attr := CONJ1;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'CONJ2',5) = 0 THEN BEGIN
       attr := CONJ2;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'CONJ3',5) = 0 THEN BEGIN
       attr := CONJ3;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'CONJ4',5) = 0 THEN BEGIN
       attr := CONJ4;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'CONJ5',5) = 0 THEN BEGIN
       attr := CONJ5;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'CONJ6',5) = 0 THEN BEGIN
       attr := CONJ6;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'CONJ7',5) = 0 THEN BEGIN
       attr := CONJ7;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'CONJ8',5) = 0 THEN BEGIN
       attr := CONJ8;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'CONJ9',5) = 0 THEN BEGIN
       attr := CONJ9;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'CONJ10',6) = 0 THEN BEGIN
       attr := CONJ10;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'CONJ11',6) = 0 THEN BEGIN
       attr := CONJ11;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'CONJ12',6) = 0 THEN BEGIN
       attr := CONJ12;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'CONJ13',6) = 0 THEN BEGIN
       attr := CONJ13;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'CONJ14',6) = 0 THEN BEGIN
       attr := CONJ14;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'CONJ15',6) = 0 THEN BEGIN
       attr := CONJ15;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'CONJ16',6) = 0 THEN BEGIN
       attr := CONJ16;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'CONJ17',6) = 0 THEN BEGIN
       attr := CONJ17;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'CONJ18',6) = 0 THEN BEGIN
       attr := CONJ18;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'CONJ19',6) = 0 THEN BEGIN
       attr := CONJ19;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'CONJ20',6) = 0 THEN BEGIN
       attr := CONJ20;
       found := TRUE
       END;
   LSSTRTOTYPE_conjclasetype := found;
END {LSSTRTOTYPE_conjclasetype};


FUNCTION LSSTRTOTYPE_contractiontype( 
         CONST str: STRING;
         l: STR_Range;
         VAR attr : LSDOMAINT_contractiontype         ): BOOLEAN;
VAR found: BOOLEAN;
BEGIN
   found := FALSE;
   IF FALSE THEN BEGIN
      END
   ELSE IF STR_Compare(str, l, 'ADEcontraction',14) = 0 THEN BEGIN
       attr := ADEcontraction;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'CONcontraction',14) = 0 THEN BEGIN
       attr := CONcontraction;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'NOcontraction',13) = 0 THEN BEGIN
       attr := NOcontraction;
       found := TRUE
       END;
   LSSTRTOTYPE_contractiontype := found;
END {LSSTRTOTYPE_contractiontype};


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
   ELSE IF STR_Compare(str, l, 'Sinfc',5) = 0 THEN BEGIN
       attr := Sinfc;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'Sgerc',5) = 0 THEN BEGIN
       attr := Sgerc;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'Spapc',5) = 0 THEN BEGIN
       attr := Spapc;
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


FUNCTION LSSTRTOTYPE_copulatype( 
         CONST str: STRING;
         l: STR_Range;
         VAR attr : LSDOMAINT_copulatype         ): BOOLEAN;
VAR found: BOOLEAN;
BEGIN
   found := FALSE;
   IF FALSE THEN BEGIN
      END
   ELSE IF STR_Compare(str, l, 'ser',3) = 0 THEN BEGIN
       attr := ser;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'estar',5) = 0 THEN BEGIN
       attr := estar;
       found := TRUE
       END;
   LSSTRTOTYPE_copulatype := found;
END {LSSTRTOTYPE_copulatype};


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
   ELSE IF STR_Compare(str, l, 'omegadef',8) = 0 THEN BEGIN
       attr := omegadef;
       found := TRUE
       END;
   LSSTRTOTYPE_deftype := found;
END {LSSTRTOTYPE_deftype};


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


FUNCTION LSSTRTOTYPE_femformatype( 
         CONST str: STRING;
         l: STR_Range;
         VAR attr : LSDOMAINT_femformatype         ): BOOLEAN;
VAR found: BOOLEAN;
BEGIN
   found := FALSE;
   IF FALSE THEN BEGIN
      END
   ELSE IF STR_Compare(str, l, 'normal',6) = 0 THEN BEGIN
       attr := normal;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'nocambio',8) = 0 THEN BEGIN
       attr := nocambio;
       found := TRUE
       END;
   LSSTRTOTYPE_femformatype := found;
END {LSSTRTOTYPE_femformatype};


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


FUNCTION LSSTRTOTYPE_futurotype( 
         CONST str: STRING;
         l: STR_Range;
         VAR attr : LSDOMAINT_futurotype         ): BOOLEAN;
VAR found: BOOLEAN;
BEGIN
   found := FALSE;
   IF FALSE THEN BEGIN
      END
   ELSE IF STR_Compare(str, l, 'sifuturo',8) = 0 THEN BEGIN
       attr := sifuturo;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'nofuturo',8) = 0 THEN BEGIN
       attr := nofuturo;
       found := TRUE
       END;
   LSSTRTOTYPE_futurotype := found;
END {LSSTRTOTYPE_futurotype};


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


FUNCTION LSSTRTOTYPE_generotype( 
         CONST str: STRING;
         l: STR_Range;
         VAR attr : LSDOMAINT_generotype         ): BOOLEAN;
VAR found: BOOLEAN;
BEGIN
   found := FALSE;
   IF FALSE THEN BEGIN
      END
   ELSE IF STR_Compare(str, l, 'masc',4) = 0 THEN BEGIN
       attr := masc;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'fem',3) = 0 THEN BEGIN
       attr := fem;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'neutro',6) = 0 THEN BEGIN
       attr := neutro;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'omegagenero',11) = 0 THEN BEGIN
       attr := omegagenero;
       found := TRUE
       END;
   LSSTRTOTYPE_generotype := found;
END {LSSTRTOTYPE_generotype};


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


FUNCTION LSSTRTOTYPE_infsorttype( 
         CONST str: STRING;
         l: STR_Range;
         VAR attr : LSDOMAINT_infsorttype         ): BOOLEAN;
VAR found: BOOLEAN;
BEGIN
   found := FALSE;
   IF FALSE THEN BEGIN
      END
   ELSE IF STR_Compare(str, l, 'inf',3) = 0 THEN BEGIN
       attr := inf;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'queinf',6) = 0 THEN BEGIN
       attr := queinf;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'parainf',7) = 0 THEN BEGIN
       attr := parainf;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'omegainf',8) = 0 THEN BEGIN
       attr := omegainf;
       found := TRUE
       END;
   LSSTRTOTYPE_infsorttype := found;
END {LSSTRTOTYPE_infsorttype};


FUNCTION LSSTRTOTYPE_intensvtype( 
         CONST str: STRING;
         l: STR_Range;
         VAR attr : LSDOMAINT_intensvtype         ): BOOLEAN;
VAR found: BOOLEAN;
BEGIN
   found := FALSE;
   IF FALSE THEN BEGIN
      END
   ELSE IF STR_Compare(str, l, 'intens',6) = 0 THEN BEGIN
       attr := intens;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'notintens',9) = 0 THEN BEGIN
       attr := notintens;
       found := TRUE
       END;
   LSSTRTOTYPE_intensvtype := found;
END {LSSTRTOTYPE_intensvtype};


FUNCTION LSSTRTOTYPE_modotype( 
         CONST str: STRING;
         l: STR_Range;
         VAR attr : LSDOMAINT_modotype         ): BOOLEAN;
VAR found: BOOLEAN;
BEGIN
   found := FALSE;
   IF FALSE THEN BEGIN
      END
   ELSE IF STR_Compare(str, l, 'Indicativo',10) = 0 THEN BEGIN
       attr := Indicativo;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'Subjuntivo',10) = 0 THEN BEGIN
       attr := Subjuntivo;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'Imperativo',10) = 0 THEN BEGIN
       attr := Imperativo;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'Infinitivo',10) = 0 THEN BEGIN
       attr := Infinitivo;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'Gerundio',8) = 0 THEN BEGIN
       attr := Gerundio;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'PtcPas',6) = 0 THEN BEGIN
       attr := PtcPas;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'omegamodo',9) = 0 THEN BEGIN
       attr := omegamodo;
       found := TRUE
       END;
   LSSTRTOTYPE_modotype := found;
END {LSSTRTOTYPE_modotype};


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
   ELSE IF STR_Compare(str, l, 'Relative',8) = 0 THEN BEGIN
       attr := Relative;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'Absolutive',10) = 0 THEN BEGIN
       attr := Absolutive;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'Partrelative',12) = 0 THEN BEGIN
       attr := Partrelative;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'WHmod',5) = 0 THEN BEGIN
       attr := WHmod;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'ProObjmod',9) = 0 THEN BEGIN
       attr := ProObjmod;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'omegamood',9) = 0 THEN BEGIN
       attr := omegamood;
       found := TRUE
       END;
   LSSTRTOTYPE_moodtype := found;
END {LSSTRTOTYPE_moodtype};


FUNCTION LSSTRTOTYPE_negpostype( 
         CONST str: STRING;
         l: STR_Range;
         VAR attr : LSDOMAINT_negpostype         ): BOOLEAN;
VAR found: BOOLEAN;
BEGIN
   found := FALSE;
   IF FALSE THEN BEGIN
      END
   ELSE IF STR_Compare(str, l, 'shiftneg',8) = 0 THEN BEGIN
       attr := shiftneg;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'subjneg',7) = 0 THEN BEGIN
       attr := subjneg;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'noneg',5) = 0 THEN BEGIN
       attr := noneg;
       found := TRUE
       END;
   LSSTRTOTYPE_negpostype := found;
END {LSSTRTOTYPE_negpostype};


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
   ELSE IF STR_Compare(str, l, 'othernoun',9) = 0 THEN BEGIN
       attr := othernoun;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'titlenoun',9) = 0 THEN BEGIN
       attr := titlenoun;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'monthnoun',9) = 0 THEN BEGIN
       attr := monthnoun;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'daynoun',7) = 0 THEN BEGIN
       attr := daynoun;
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
   ELSE IF STR_Compare(str, l, 'SEimpershead',12) = 0 THEN BEGIN
       attr := SEimpershead;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'proSEhead',9) = 0 THEN BEGIN
       attr := proSEhead;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'redelloNP',9) = 0 THEN BEGIN
       attr := redelloNP;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'redellosNP',10) = 0 THEN BEGIN
       attr := redellosNP;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'persproNP',9) = 0 THEN BEGIN
       attr := persproNP;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'QuewhproNP',10) = 0 THEN BEGIN
       attr := QuewhproNP;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'unoNP',5) = 0 THEN BEGIN
       attr := unoNP;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'esteNP',6) = 0 THEN BEGIN
       attr := esteNP;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'eseNP',5) = 0 THEN BEGIN
       attr := eseNP;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'aquelNP',7) = 0 THEN BEGIN
       attr := aquelNP;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'enNP',4) = 0 THEN BEGIN
       attr := enNP;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'cardNP',6) = 0 THEN BEGIN
       attr := cardNP;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'otherNP',7) = 0 THEN BEGIN
       attr := otherNP;
       found := TRUE
       END;
   LSSTRTOTYPE_npheadtype := found;
END {LSSTRTOTYPE_npheadtype};


FUNCTION LSSTRTOTYPE_numerotype( 
         CONST str: STRING;
         l: STR_Range;
         VAR attr : LSDOMAINT_numerotype         ): BOOLEAN;
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
   ELSE IF STR_Compare(str, l, 'omeganumero',11) = 0 THEN BEGIN
       attr := omeganumero;
       found := TRUE
       END;
   LSSTRTOTYPE_numerotype := found;
END {LSSTRTOTYPE_numerotype};


FUNCTION LSSTRTOTYPE_persproformatype( 
         CONST str: STRING;
         l: STR_Range;
         VAR attr : LSDOMAINT_persproformatype         ): BOOLEAN;
VAR found: BOOLEAN;
BEGIN
   found := FALSE;
   IF FALSE THEN BEGIN
      END
   ELSE IF STR_Compare(str, l, 'acusCL',6) = 0 THEN BEGIN
       attr := acusCL;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'acusLEcl',8) = 0 THEN BEGIN
       attr := acusLEcl;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'datCL',5) = 0 THEN BEGIN
       attr := datCL;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'Nomfuerte',9) = 0 THEN BEGIN
       attr := Nomfuerte;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'Nomdebil',8) = 0 THEN BEGIN
       attr := Nomdebil;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'Prepfuerte',10) = 0 THEN BEGIN
       attr := Prepfuerte;
       found := TRUE
       END;
   LSSTRTOTYPE_persproformatype := found;
END {LSSTRTOTYPE_persproformatype};


FUNCTION LSSTRTOTYPE_pluralformatype( 
         CONST str: STRING;
         l: STR_Range;
         VAR attr : LSDOMAINT_pluralformatype         ): BOOLEAN;
VAR found: BOOLEAN;
BEGIN
   found := FALSE;
   IF FALSE THEN BEGIN
      END
   ELSE IF STR_Compare(str, l, 'regular',7) = 0 THEN BEGIN
       attr := regular;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'extran',6) = 0 THEN BEGIN
       attr := extran;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'irregular',9) = 0 THEN BEGIN
       attr := irregular;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'sincambio',9) = 0 THEN BEGIN
       attr := sincambio;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'noplural',8) = 0 THEN BEGIN
       attr := noplural;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'nosingular',10) = 0 THEN BEGIN
       attr := nosingular;
       found := TRUE
       END;
   LSSTRTOTYPE_pluralformatype := found;
END {LSSTRTOTYPE_pluralformatype};


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


FUNCTION LSSTRTOTYPE_posiciontype( 
         CONST str: STRING;
         l: STR_Range;
         VAR attr : LSDOMAINT_posiciontype         ): BOOLEAN;
VAR found: BOOLEAN;
BEGIN
   found := FALSE;
   IF FALSE THEN BEGIN
      END
   ELSE IF STR_Compare(str, l, 'prePosicion',11) = 0 THEN BEGIN
       attr := prePosicion;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'postPosicion',12) = 0 THEN BEGIN
       attr := postPosicion;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'ambosPosicion',13) = 0 THEN BEGIN
       attr := ambosPosicion;
       found := TRUE
       END;
   LSSTRTOTYPE_posiciontype := found;
END {LSSTRTOTYPE_posiciontype};


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
   ELSE IF STR_Compare(str, l, 'doorpor',7) = 0 THEN BEGIN
       attr := doorpor;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'Aio',3) = 0 THEN BEGIN
       attr := Aio;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'para',4) = 0 THEN BEGIN
       attr := para;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'caus',4) = 0 THEN BEGIN
       attr := caus;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'other',5) = 0 THEN BEGIN
       attr := other;
       found := TRUE
       END;
   LSSTRTOTYPE_prepsubctype := found;
END {LSSTRTOTYPE_prepsubctype};


FUNCTION LSSTRTOTYPE_quesitype( 
         CONST str: STRING;
         l: STR_Range;
         VAR attr : LSDOMAINT_quesitype         ): BOOLEAN;
VAR found: BOOLEAN;
BEGIN
   found := FALSE;
   IF FALSE THEN BEGIN
      END
   ELSE IF STR_Compare(str, l, 'quesisent',9) = 0 THEN BEGIN
       attr := quesisent;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'quenosent',9) = 0 THEN BEGIN
       attr := quenosent;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'omegaprosent',12) = 0 THEN BEGIN
       attr := omegaprosent;
       found := TRUE
       END;
   LSSTRTOTYPE_quesitype := found;
END {LSSTRTOTYPE_quesitype};


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


FUNCTION LSSTRTOTYPE_sinotype( 
         CONST str: STRING;
         l: STR_Range;
         VAR attr : LSDOMAINT_sinotype         ): BOOLEAN;
VAR found: BOOLEAN;
BEGIN
   found := FALSE;
   IF FALSE THEN BEGIN
      END
   ELSE IF STR_Compare(str, l, 'si',2) = 0 THEN BEGIN
       attr := si;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'no',2) = 0 THEN BEGIN
       attr := no;
       found := TRUE
       END;
   LSSTRTOTYPE_sinotype := found;
END {LSSTRTOTYPE_sinotype};


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


FUNCTION LSSTRTOTYPE_synpatterntype( 
         CONST str: STRING;
         l: STR_Range;
         VAR attr : LSDOMAINT_synpatterntype         ): BOOLEAN;
VAR found: BOOLEAN;
BEGIN
   found := FALSE;
   IF FALSE THEN BEGIN
      END
   ELSE IF STR_Compare(str, l, 'synSER',6) = 0 THEN BEGIN
       attr := synSER;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synESTAR',8) = 0 THEN BEGIN
       attr := synESTAR;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synHABER',8) = 0 THEN BEGIN
       attr := synHABER;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synANP_CLOSEDADJPPROP',21) = 0 THEN BEGIN
       attr := synANP_CLOSEDADJPPROP;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synANP_CLOSEDNPPROP',19) = 0 THEN BEGIN
       attr := synANP_CLOSEDNPPROP;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synANP_DONP',11) = 0 THEN BEGIN
       attr := synANP_DONP;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synANP_MEASUREPHRASE',20) = 0 THEN BEGIN
       attr := synANP_MEASUREPHRASE;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synANP_OPENINFSENT',18) = 0 THEN BEGIN
       attr := synANP_OPENINFSENT;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synANP_OTHERCLOSEDPREPPPROP',27) = 0 THEN BEGIN
       attr := synANP_OTHERCLOSEDPREPPPROP;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synANP_PREPCLOSEDADJPPROP',25) = 0 THEN BEGIN
       attr := synANP_PREPCLOSEDADJPPROP;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synANP_QSENT',12) = 0 THEN BEGIN
       attr := synANP_QSENT;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synANP_QUESENTind',17) = 0 THEN BEGIN
       attr := synANP_QUESENTind;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synANP_QUESENTsubj',18) = 0 THEN BEGIN
       attr := synANP_QUESENTsubj;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synANP_QUESISENT',16) = 0 THEN BEGIN
       attr := synANP_QUESISENT;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synCLOSEDADJPPROP',17) = 0 THEN BEGIN
       attr := synCLOSEDADJPPROP;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synQUECLOSEDINFSENT',19) = 0 THEN BEGIN
       attr := synQUECLOSEDINFSENT;
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
   ELSE IF STR_Compare(str, l, 'synCLOSEDVERBPPROP',18) = 0 THEN BEGIN
       attr := synCLOSEDVERBPPROP;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synCOMOCLOSEDADJPPROP',21) = 0 THEN BEGIN
       attr := synCOMOCLOSEDADJPPROP;
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
   ELSE IF STR_Compare(str, l, 'synDONP_LOCOPENPREPPPROP',24) = 0 THEN BEGIN
       attr := synDONP_LOCOPENPREPPPROP;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synDONP_OPENADJPPROP',20) = 0 THEN BEGIN
       attr := synDONP_OPENADJPPROP;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synDONP_OPENINFSENT',19) = 0 THEN BEGIN
       attr := synDONP_OPENINFSENT;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synDONP_OPENNPPROP',18) = 0 THEN BEGIN
       attr := synDONP_OPENNPPROP;
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
   ELSE IF STR_Compare(str, l, 'synANP_PREPOPENINFSENT',22) = 0 THEN BEGIN
       attr := synANP_PREPOPENINFSENT;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synPREPMEASUREPHRASE',20) = 0 THEN BEGIN
       attr := synPREPMEASUREPHRASE;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synDONP_OTHERCLOSEDPREPPPROP',28) = 0 THEN BEGIN
       attr := synDONP_OTHERCLOSEDPREPPPROP;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synEMPTY_PREPEMPTY',18) = 0 THEN BEGIN
       attr := synEMPTY_PREPEMPTY;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synSOPROSENT',12) = 0 THEN BEGIN
       attr := synSOPROSENT;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synEMPTY_PROSENT',16) = 0 THEN BEGIN
       attr := synEMPTY_PROSENT;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synEMPTY_PREPNP',15) = 0 THEN BEGIN
       attr := synEMPTY_PREPNP;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synPREPEMPTY_PREPNP',19) = 0 THEN BEGIN
       attr := synPREPEMPTY_PREPNP;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synDONP_OPENGERSENT',19) = 0 THEN BEGIN
       attr := synDONP_OPENGERSENT;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synDONP_RESULTEMPTY',19) = 0 THEN BEGIN
       attr := synDONP_RESULTEMPTY;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synANP_PREPNP',13) = 0 THEN BEGIN
       attr := synANP_PREPNP;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synANP_PREPQUESENTind',21) = 0 THEN BEGIN
       attr := synANP_PREPQUESENTind;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synANP_PREPQUESENTsubj',22) = 0 THEN BEGIN
       attr := synANP_PREPQUESENTsubj;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synEMPTY_PREPQUESENTsubj',24) = 0 THEN BEGIN
       attr := synEMPTY_PREPQUESENTsubj;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synEMPTY_ANP',12) = 0 THEN BEGIN
       attr := synEMPTY_ANP;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synDONP_QUESENTind',18) = 0 THEN BEGIN
       attr := synDONP_QUESENTind;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synDONP_QUESENTsubj',19) = 0 THEN BEGIN
       attr := synDONP_QUESENTsubj;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synPREPNP_PREPEMPTY',19) = 0 THEN BEGIN
       attr := synPREPNP_PREPEMPTY;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synDONP_OTHEROPENPREPPPROP',26) = 0 THEN BEGIN
       attr := synDONP_OTHEROPENPREPPPROP;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synANP_PROSENT',14) = 0 THEN BEGIN
       attr := synANP_PROSENT;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synDIREMPTY',11) = 0 THEN BEGIN
       attr := synDIREMPTY;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synPREPOPENADJPPROP',19) = 0 THEN BEGIN
       attr := synPREPOPENADJPPROP;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synEMPTY_QUESISENT',18) = 0 THEN BEGIN
       attr := synEMPTY_QUESISENT;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synOPENDESENTPROOBJ',19) = 0 THEN BEGIN
       attr := synOPENDESENTPROOBJ;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synDONP_PREPOPENADJPPROP',24) = 0 THEN BEGIN
       attr := synDONP_PREPOPENADJPPROP;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synDONP_PREPOPENNPPROP',22) = 0 THEN BEGIN
       attr := synDONP_PREPOPENNPPROP;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synELOPENINFSENT',16) = 0 THEN BEGIN
       attr := synELOPENINFSENT;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synELQUESENTsubj',16) = 0 THEN BEGIN
       attr := synELQUESENTsubj;
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
   ELSE IF STR_Compare(str, l, 'synEMPTY_DONP',13) = 0 THEN BEGIN
       attr := synEMPTY_DONP;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synEMPTY_MEASUREPHRASE',22) = 0 THEN BEGIN
       attr := synEMPTY_MEASUREPHRASE;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synEMPTY_OPENINFSENT',20) = 0 THEN BEGIN
       attr := synEMPTY_OPENINFSENT;
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
   ELSE IF STR_Compare(str, l, 'synEMPTY_QUESENTind',19) = 0 THEN BEGIN
       attr := synEMPTY_QUESENTind;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synEMPTY_QUESENTsubj',20) = 0 THEN BEGIN
       attr := synEMPTY_QUESENTsubj;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synnoVPargs',11) = 0 THEN BEGIN
       attr := synnoVPargs;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synEMPTY_PREPOPENINFSENT',24) = 0 THEN BEGIN
       attr := synEMPTY_PREPOPENINFSENT;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synnoADVPargs',13) = 0 THEN BEGIN
       attr := synnoADVPargs;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synOPENGERSENT',14) = 0 THEN BEGIN
       attr := synOPENGERSENT;
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
   ELSE IF STR_Compare(str, l, 'synOPENADVPPROP',15) = 0 THEN BEGIN
       attr := synOPENADVPPROP;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synOPENINFSENT',14) = 0 THEN BEGIN
       attr := synOPENINFSENT;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synQUEOPENINFSENT',17) = 0 THEN BEGIN
       attr := synQUEOPENINFSENT;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synOPENNPPROP',13) = 0 THEN BEGIN
       attr := synOPENNPPROP;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synOTHERCLOSEDPREPPPROP',23) = 0 THEN BEGIN
       attr := synOTHERCLOSEDPREPPPROP;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synPARANP_DONP',14) = 0 THEN BEGIN
       attr := synPARANP_DONP;
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
   ELSE IF STR_Compare(str, l, 'synPREPNP',9) = 0 THEN BEGIN
       attr := synPREPNP;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synPREPNP_PREPNP',16) = 0 THEN BEGIN
       attr := synPREPNP_PREPNP;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synPREPNP_PREPOPENINFSENT',25) = 0 THEN BEGIN
       attr := synPREPNP_PREPOPENINFSENT;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synPREPNP_QUESENTsubj',21) = 0 THEN BEGIN
       attr := synPREPNP_QUESENTsubj;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synOTHEROPENPREPPPROP',21) = 0 THEN BEGIN
       attr := synOTHEROPENPREPPPROP;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synPREPOPENNPPROP',17) = 0 THEN BEGIN
       attr := synPREPOPENNPPROP;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synPREPOPENINFSENT',18) = 0 THEN BEGIN
       attr := synPREPOPENINFSENT;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synPREPQSENT',12) = 0 THEN BEGIN
       attr := synPREPQSENT;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synPREPQUESENTind',17) = 0 THEN BEGIN
       attr := synPREPQUESENTind;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synPREPQUESENTsubj',18) = 0 THEN BEGIN
       attr := synPREPQUESENTsubj;
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
   ELSE IF STR_Compare(str, l, 'synQUESENTind',13) = 0 THEN BEGIN
       attr := synQUESENTind;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synQUESENTsubj',14) = 0 THEN BEGIN
       attr := synQUESENTsubj;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synQUESISENT',12) = 0 THEN BEGIN
       attr := synQUESISENT;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synLOCPREPP',11) = 0 THEN BEGIN
       attr := synLOCPREPP;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synDONP_PREPQUESENTind',22) = 0 THEN BEGIN
       attr := synDONP_PREPQUESENTind;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synDONP_PREPQUESENTsubj',23) = 0 THEN BEGIN
       attr := synDONP_PREPQUESENTsubj;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synnoadjpargs',13) = 0 THEN BEGIN
       attr := synnoadjpargs;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synDONP_DIREMPTY',16) = 0 THEN BEGIN
       attr := synDONP_DIREMPTY;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synDONP_PREPOPENINFSENT',23) = 0 THEN BEGIN
       attr := synDONP_PREPOPENINFSENT;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synEMPTY_CLOSEDINFSENT',22) = 0 THEN BEGIN
       attr := synEMPTY_CLOSEDINFSENT;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synAEMPTY_DONP',14) = 0 THEN BEGIN
       attr := synAEMPTY_DONP;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synAEMPTY_QUESENTind',20) = 0 THEN BEGIN
       attr := synAEMPTY_QUESENTind;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synAEMPTY_QUESENTsubj',21) = 0 THEN BEGIN
       attr := synAEMPTY_QUESENTsubj;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synAEMPTY_QSENT',15) = 0 THEN BEGIN
       attr := synAEMPTY_QSENT;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synANP',6) = 0 THEN BEGIN
       attr := synANP;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synLOCEMPTY',11) = 0 THEN BEGIN
       attr := synLOCEMPTY;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synOPENVERBPPROP',16) = 0 THEN BEGIN
       attr := synOPENVERBPPROP;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synPAPREPOPENINFSENT',20) = 0 THEN BEGIN
       attr := synPAPREPOPENINFSENT;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synPAPREPQUESENTind',19) = 0 THEN BEGIN
       attr := synPAPREPQUESENTind;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synPAPREPQUESENTsubj',20) = 0 THEN BEGIN
       attr := synPAPREPQUESENTsubj;
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
   ELSE IF STR_Compare(str, l, 'synPREPEMPTY',12) = 0 THEN BEGIN
       attr := synPREPEMPTY;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synQUESENTind_LOCOPENPREPPPROP',30) = 0 THEN BEGIN
       attr := synQUESENTind_LOCOPENPREPPPROP;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synPARANP',9) = 0 THEN BEGIN
       attr := synPARANP;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synPARAEMPTY',12) = 0 THEN BEGIN
       attr := synPARAEMPTY;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synOPENINFSENTPROOBJ',20) = 0 THEN BEGIN
       attr := synOPENINFSENTPROOBJ;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'synLOCPREPEMPTY',15) = 0 THEN BEGIN
       attr := synLOCPREPEMPTY;
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
   ELSE IF STR_Compare(str, l, 'omegaquant',10) = 0 THEN BEGIN
       attr := omegaquant;
       found := TRUE
       END;
   LSSTRTOTYPE_syntquanttype := found;
END {LSSTRTOTYPE_syntquanttype};


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
   ELSE IF STR_Compare(str, l, 'decompl',7) = 0 THEN BEGIN
       attr := decompl;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'quecompl',8) = 0 THEN BEGIN
       attr := quecompl;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'paracompl',9) = 0 THEN BEGIN
       attr := paracompl;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'comocompl',9) = 0 THEN BEGIN
       attr := comocompl;
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
   ELSE IF STR_Compare(str, l, 'adjp210',7) = 0 THEN BEGIN
       attr := adjp210;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'adjp123',7) = 0 THEN BEGIN
       attr := adjp123;
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
   ELSE IF STR_Compare(str, l, 'pp100',5) = 0 THEN BEGIN
       attr := pp100;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'pp010',5) = 0 THEN BEGIN
       attr := pp010;
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
   ELSE IF STR_Compare(str, l, 'vp021',5) = 0 THEN BEGIN
       attr := vp021;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vp210',5) = 0 THEN BEGIN
       attr := vp210;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vp123',5) = 0 THEN BEGIN
       attr := vp123;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vp132',5) = 0 THEN BEGIN
       attr := vp132;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vp213',5) = 0 THEN BEGIN
       attr := vp213;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vp231',5) = 0 THEN BEGIN
       attr := vp231;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vp312',5) = 0 THEN BEGIN
       attr := vp312;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'vp321',5) = 0 THEN BEGIN
       attr := vp321;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'thetavpAUX',10) = 0 THEN BEGIN
       attr := thetavpAUX;
       found := TRUE
       END;
   LSSTRTOTYPE_thetavptype := found;
END {LSSTRTOTYPE_thetavptype};


FUNCTION LSSTRTOTYPE_tiempotype( 
         CONST str: STRING;
         l: STR_Range;
         VAR attr : LSDOMAINT_tiempotype         ): BOOLEAN;
VAR found: BOOLEAN;
BEGIN
   found := FALSE;
   IF FALSE THEN BEGIN
      END
   ELSE IF STR_Compare(str, l, 'Presente',8) = 0 THEN BEGIN
       attr := Presente;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'Pasado',6) = 0 THEN BEGIN
       attr := Pasado;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'Futuro',6) = 0 THEN BEGIN
       attr := Futuro;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'omegatiempo',11) = 0 THEN BEGIN
       attr := omegatiempo;
       found := TRUE
       END;
   LSSTRTOTYPE_tiempotype := found;
END {LSSTRTOTYPE_tiempotype};


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


FUNCTION LSSTRTOTYPE_clusteringtype( 
         CONST str: STRING;
         l: STR_Range;
         VAR attr : LSDOMAINT_clusteringtype         ): BOOLEAN;
VAR found: BOOLEAN;
BEGIN
   found := FALSE;
   IF FALSE THEN BEGIN
      END
   ELSE IF STR_Compare(str, l, 'NoClustering',12) = 0 THEN BEGIN
       attr := NoClustering;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'Restructuring',13) = 0 THEN BEGIN
       attr := Restructuring;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'OptVR',5) = 0 THEN BEGIN
       attr := OptVR;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'OblVR',5) = 0 THEN BEGIN
       attr := OblVR;
       found := TRUE
       END;
   LSSTRTOTYPE_clusteringtype := found;
END {LSSTRTOTYPE_clusteringtype};


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
   ELSE IF STR_Compare(str, l, 'haberaux',8) = 0 THEN BEGIN
       attr := haberaux;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'estaraux',8) = 0 THEN BEGIN
       attr := estaraux;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'seraux',6) = 0 THEN BEGIN
       attr := seraux;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'Modalverb',9) = 0 THEN BEGIN
       attr := Modalverb;
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
   ELSE IF STR_Compare(str, l, 'SEactive',8) = 0 THEN BEGIN
       attr := SEactive;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'SEpassive',9) = 0 THEN BEGIN
       attr := SEpassive;
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
   ELSE IF STR_Compare(str, l, 'VV',2) = 0 THEN BEGIN
       attr := VV;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'AuxV',4) = 0 THEN BEGIN
       attr := AuxV;
       found := TRUE
       END
   ELSE IF STR_Compare(str, l, 'prepV',5) = 0 THEN BEGIN
       attr := prepV;
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
   ELSE IF STR_Compare(str, l, 'ProObjxpmood',12) = 0 THEN BEGIN
       attr := ProObjxpmood;
       found := TRUE
       END;
   LSSTRTOTYPE_xpmoodtype := found;
END {LSSTRTOTYPE_xpmoodtype};



FUNCTION LSSTRTOTYPE_personatype( 
         CONST str: STRING;
         l: STR_Range;
         VAR attr : LSDOMAINT_personatype         ): BOOLEAN;
VAR tmp   : INTEGER;
    result: BOOLEAN;
BEGIN
   tmp := -1;
   result := STR_StrToInteger(str, l, tmp);
   IF result AND ( 0 <= tmp ) AND ( tmp <= 3 ) THEN BEGIN
      attr := tmp; LSSTRTOTYPE_personatype := TRUE
      END
 ELSE BEGIN
      LSSTRTOTYPE_personatype := FALSE
   END;END {LSSTRTOTYPE_personatype};


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



