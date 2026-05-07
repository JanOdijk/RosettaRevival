Export(LSCONVREC);
pragma C_include('lsdomaint.pf');
pragma C_include('lstypetostr.pf');
pragma C_include('ldconvrec.pf');
pragma C_include('str.pf');
pragma C_include('mem.pf');
pragma C_include('lsconvrec.pf');


PROGRAM LSCONVREC;
WITH LSDOMAINT, LSTYPETOSTR, STR, MEM, LDCONVREC;
FUNCTION LSCONVREC_MakeAttr(a: LDCONVREC_pAttrStruct):
                            LDCONVREC_pAttrStruct;
VAR h: LDCONVREC_pAttrStruct;
BEGIN
   Mem_NewDefault(LOOPHOLES.SIZEOF(LDCONVREC_AttrStruct), LoopHoles.Retype(h,Mem_Ptr));
   WITH h^ DO BEGIN
      SetValue := NIL;
      NextAttr := a
   END;
   LSCONVREC_MakeAttr := h
END;

FUNCTION LSCONVREC_MakeSetElt(a: LDCONVREC_pSetValueType):
                            LDCONVREC_pSetValueType;
VAR h: LDCONVREC_pSetValueType;
BEGIN
   Mem_NewDefault(LOOPHOLES.SIZEOF(LDCONVREC_SetValueType), LoopHoles.Retype(h,Mem_Ptr));
   WITH h^ DO BEGIN
      NextValue := a
   END;
   LSCONVREC_MakeSetElt := h
END;

FUNCTION LSCONVREC_NORECORD(rec: LSDOMAINT_NORECORD): LDCONVREC_pAttrStruct;
VAR result : LDCONVREC_pAttrStruct;
BEGIN
   result := NIL;
   LSCONVREC_NORECORD := result;
END {LSCONVREC_NORECORD};

FUNCTION LSCONVREC_BADJrecord(rec: LSDOMAINT_BADJrecord): LDCONVREC_pAttrStruct;
VAR result : LDCONVREC_pAttrStruct;
    compformations : LSDOMAINT_compformationtype; 
    req : LSDOMAINT_polaritytype; 
    env : LSDOMAINT_polaritytype; 
    uses : LSDOMAINT_adjusetype; 
    subcs : LSDOMAINT_adjsubctype; 
    adjpatterns : LSDOMAINT_synpatterntype; 
BEGIN
   result := NIL;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'KEY';
      fieldname.len := 3;
      typecode := 0;
      typeindicator := Int;
      STR_IntegerToStr(rec.KEY,  fieldvalue.str, fieldvalue.len);
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'compformations';
      fieldname.len := 14;
      typecode := 99;
   END;
   result^.typeindicator := EnumSet;
   FOR compformations:=regcomp TO irrAdvComp DO BEGIN
      IF compformations IN rec.compformations THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_compformationtype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,compformations);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'req';
      fieldname.len := 3;
      typecode := 112;
   END;
   result^.typeindicator := EnumSet;
   FOR req:=pospol TO omegapol DO BEGIN
      IF req IN rec.req THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_polaritytype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,req);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'env';
      fieldname.len := 3;
      typecode := 112;
   END;
   result^.typeindicator := EnumSet;
   FOR env:=pospol TO omegapol DO BEGIN
      IF env IN rec.env THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_polaritytype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,env);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'class';
      fieldname.len := 5;
      typecode := 80;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_timeadvclasstype( result^.fieldvalue.str, result^.fieldvalue.len, rec.class);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'deixis';
      fieldname.len := 6;
      typecode := 46;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_deixistype( result^.fieldvalue.str, result^.fieldvalue.len, rec.deixis);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'aspect';
      fieldname.len := 6;
      typecode := 34;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_aspecttype( result^.fieldvalue.str, result^.fieldvalue.len, rec.aspect);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'retro';
      fieldname.len := 5;
      typecode := 19;
   END;
   result^.typeindicator := Bool;
   IF rec.retro = TRUE THEN BEGIN
      result^.fieldvalue.str := 'TRUE';
      result^.fieldvalue.len := 4;
      END
   ELSE BEGIN
      result^.fieldvalue.str := 'FALSE';
      result^.fieldvalue.len := 5;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'uses';
      fieldname.len := 4;
      typecode := 91;
   END;
   result^.typeindicator := EnumSet;
   FOR uses:=attributive TO postposition DO BEGIN
      IF uses IN rec.uses THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_adjusetype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,uses);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'temporal';
      fieldname.len := 8;
      typecode := 23;
   END;
   result^.typeindicator := Bool;
   IF rec.temporal = TRUE THEN BEGIN
      result^.fieldvalue.str := 'TRUE';
      result^.fieldvalue.len := 4;
      END
   ELSE BEGIN
      result^.fieldvalue.str := 'FALSE';
      result^.fieldvalue.len := 5;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'subcs';
      fieldname.len := 5;
      typecode := 88;
   END;
   result^.typeindicator := EnumSet;
   FOR subcs:=coloradj TO tosubjectiveadj DO BEGIN
      IF subcs IN rec.subcs THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_adjsubctype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,subcs);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'thetaadj';
      fieldname.len := 8;
      typecode := 75;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_thetaadjtype( result^.fieldvalue.str, result^.fieldvalue.len, rec.thetaadj);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'adjpatterns';
      fieldname.len := 11;
      typecode := 118;
   END;
   result^.typeindicator := EnumSet;
   FOR adjpatterns:=synASIFSENT TO synDONP_OPENINFSENT DO BEGIN
      IF adjpatterns IN rec.adjpatterns THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_synpatterntype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,adjpatterns);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'prepkey';
      fieldname.len := 7;
      typecode := 2;
   END;
   result^.typeindicator := Int;
   STR_IntegerToStr( rec.prepkey, result^.fieldvalue.str, result^.fieldvalue.len);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'advformation';
      fieldname.len := 12;
      typecode := 28;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_advformationtype( result^.fieldvalue.str, result^.fieldvalue.len, rec.advformation);
   LSCONVREC_BADJrecord := result;
END {LSCONVREC_BADJrecord};

FUNCTION LSCONVREC_SUBADJrecord(rec: LSDOMAINT_SUBADJrecord): LDCONVREC_pAttrStruct;
VAR result : LDCONVREC_pAttrStruct;
    compformations : LSDOMAINT_compformationtype; 
    req : LSDOMAINT_polaritytype; 
    env : LSDOMAINT_polaritytype; 
    uses : LSDOMAINT_adjusetype; 
    subcs : LSDOMAINT_adjsubctype; 
    adjpatterns : LSDOMAINT_synpatterntype; 
BEGIN
   result := NIL;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'compformations';
      fieldname.len := 14;
      typecode := 99;
   END;
   result^.typeindicator := EnumSet;
   FOR compformations:=regcomp TO irrAdvComp DO BEGIN
      IF compformations IN rec.compformations THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_compformationtype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,compformations);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'affix';
      fieldname.len := 5;
      typecode := 30;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_affixtype( result^.fieldvalue.str, result^.fieldvalue.len, rec.affix);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'req';
      fieldname.len := 3;
      typecode := 112;
   END;
   result^.typeindicator := EnumSet;
   FOR req:=pospol TO omegapol DO BEGIN
      IF req IN rec.req THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_polaritytype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,req);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'env';
      fieldname.len := 3;
      typecode := 112;
   END;
   result^.typeindicator := EnumSet;
   FOR env:=pospol TO omegapol DO BEGIN
      IF env IN rec.env THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_polaritytype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,env);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'class';
      fieldname.len := 5;
      typecode := 80;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_timeadvclasstype( result^.fieldvalue.str, result^.fieldvalue.len, rec.class);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'deixis';
      fieldname.len := 6;
      typecode := 46;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_deixistype( result^.fieldvalue.str, result^.fieldvalue.len, rec.deixis);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'aspect';
      fieldname.len := 6;
      typecode := 34;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_aspecttype( result^.fieldvalue.str, result^.fieldvalue.len, rec.aspect);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'retro';
      fieldname.len := 5;
      typecode := 19;
   END;
   result^.typeindicator := Bool;
   IF rec.retro = TRUE THEN BEGIN
      result^.fieldvalue.str := 'TRUE';
      result^.fieldvalue.len := 4;
      END
   ELSE BEGIN
      result^.fieldvalue.str := 'FALSE';
      result^.fieldvalue.len := 5;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'uses';
      fieldname.len := 4;
      typecode := 91;
   END;
   result^.typeindicator := EnumSet;
   FOR uses:=attributive TO postposition DO BEGIN
      IF uses IN rec.uses THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_adjusetype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,uses);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'temporal';
      fieldname.len := 8;
      typecode := 23;
   END;
   result^.typeindicator := Bool;
   IF rec.temporal = TRUE THEN BEGIN
      result^.fieldvalue.str := 'TRUE';
      result^.fieldvalue.len := 4;
      END
   ELSE BEGIN
      result^.fieldvalue.str := 'FALSE';
      result^.fieldvalue.len := 5;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'subcs';
      fieldname.len := 5;
      typecode := 88;
   END;
   result^.typeindicator := EnumSet;
   FOR subcs:=coloradj TO tosubjectiveadj DO BEGIN
      IF subcs IN rec.subcs THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_adjsubctype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,subcs);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'thetaadj';
      fieldname.len := 8;
      typecode := 75;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_thetaadjtype( result^.fieldvalue.str, result^.fieldvalue.len, rec.thetaadj);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'adjpatterns';
      fieldname.len := 11;
      typecode := 118;
   END;
   result^.typeindicator := EnumSet;
   FOR adjpatterns:=synASIFSENT TO synDONP_OPENINFSENT DO BEGIN
      IF adjpatterns IN rec.adjpatterns THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_synpatterntype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,adjpatterns);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'prepkey';
      fieldname.len := 7;
      typecode := 2;
   END;
   result^.typeindicator := Int;
   STR_IntegerToStr( rec.prepkey, result^.fieldvalue.str, result^.fieldvalue.len);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'advformation';
      fieldname.len := 12;
      typecode := 28;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_advformationtype( result^.fieldvalue.str, result^.fieldvalue.len, rec.advformation);
   LSCONVREC_SUBADJrecord := result;
END {LSCONVREC_SUBADJrecord};

FUNCTION LSCONVREC_ADJrecord(rec: LSDOMAINT_ADJrecord): LDCONVREC_pAttrStruct;
VAR result : LDCONVREC_pAttrStruct;
    compformations : LSDOMAINT_compformationtype; 
    req : LSDOMAINT_polaritytype; 
    env : LSDOMAINT_polaritytype; 
    uses : LSDOMAINT_adjusetype; 
    subcs : LSDOMAINT_adjsubctype; 
    adjpatterns : LSDOMAINT_synpatterntype; 
BEGIN
   result := NIL;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'compformations';
      fieldname.len := 14;
      typecode := 99;
   END;
   result^.typeindicator := EnumSet;
   FOR compformations:=regcomp TO irrAdvComp DO BEGIN
      IF compformations IN rec.compformations THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_compformationtype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,compformations);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'affix';
      fieldname.len := 5;
      typecode := 30;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_affixtype( result^.fieldvalue.str, result^.fieldvalue.len, rec.affix);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'compform';
      fieldname.len := 8;
      typecode := 39;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_compformtype( result^.fieldvalue.str, result^.fieldvalue.len, rec.compform);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'req';
      fieldname.len := 3;
      typecode := 112;
   END;
   result^.typeindicator := EnumSet;
   FOR req:=pospol TO omegapol DO BEGIN
      IF req IN rec.req THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_polaritytype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,req);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'env';
      fieldname.len := 3;
      typecode := 112;
   END;
   result^.typeindicator := EnumSet;
   FOR env:=pospol TO omegapol DO BEGIN
      IF env IN rec.env THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_polaritytype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,env);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'class';
      fieldname.len := 5;
      typecode := 80;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_timeadvclasstype( result^.fieldvalue.str, result^.fieldvalue.len, rec.class);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'deixis';
      fieldname.len := 6;
      typecode := 46;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_deixistype( result^.fieldvalue.str, result^.fieldvalue.len, rec.deixis);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'aspect';
      fieldname.len := 6;
      typecode := 34;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_aspecttype( result^.fieldvalue.str, result^.fieldvalue.len, rec.aspect);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'retro';
      fieldname.len := 5;
      typecode := 19;
   END;
   result^.typeindicator := Bool;
   IF rec.retro = TRUE THEN BEGIN
      result^.fieldvalue.str := 'TRUE';
      result^.fieldvalue.len := 4;
      END
   ELSE BEGIN
      result^.fieldvalue.str := 'FALSE';
      result^.fieldvalue.len := 5;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'uses';
      fieldname.len := 4;
      typecode := 91;
   END;
   result^.typeindicator := EnumSet;
   FOR uses:=attributive TO postposition DO BEGIN
      IF uses IN rec.uses THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_adjusetype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,uses);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'temporal';
      fieldname.len := 8;
      typecode := 23;
   END;
   result^.typeindicator := Bool;
   IF rec.temporal = TRUE THEN BEGIN
      result^.fieldvalue.str := 'TRUE';
      result^.fieldvalue.len := 4;
      END
   ELSE BEGIN
      result^.fieldvalue.str := 'FALSE';
      result^.fieldvalue.len := 5;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'subcs';
      fieldname.len := 5;
      typecode := 88;
   END;
   result^.typeindicator := EnumSet;
   FOR subcs:=coloradj TO tosubjectiveadj DO BEGIN
      IF subcs IN rec.subcs THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_adjsubctype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,subcs);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'thetaadj';
      fieldname.len := 8;
      typecode := 75;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_thetaadjtype( result^.fieldvalue.str, result^.fieldvalue.len, rec.thetaadj);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'adjpatterns';
      fieldname.len := 11;
      typecode := 118;
   END;
   result^.typeindicator := EnumSet;
   FOR adjpatterns:=synASIFSENT TO synDONP_OPENINFSENT DO BEGIN
      IF adjpatterns IN rec.adjpatterns THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_synpatterntype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,adjpatterns);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'prepkey';
      fieldname.len := 7;
      typecode := 2;
   END;
   result^.typeindicator := Int;
   STR_IntegerToStr( rec.prepkey, result^.fieldvalue.str, result^.fieldvalue.len);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'advformation';
      fieldname.len := 12;
      typecode := 28;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_advformationtype( result^.fieldvalue.str, result^.fieldvalue.len, rec.advformation);
   LSCONVREC_ADJrecord := result;
END {LSCONVREC_ADJrecord};

FUNCTION LSCONVREC_ADJPrecord(rec: LSDOMAINT_ADJPrecord): LDCONVREC_pAttrStruct;
VAR result : LDCONVREC_pAttrStruct;
    req : LSDOMAINT_polaritytype; 
    env : LSDOMAINT_polaritytype; 
    actuseefs : LSDOMAINT_adjusetype; 
    actsubcefs : LSDOMAINT_adjsubctype; 
    adjpatternefs : LSDOMAINT_synpatterntype; 
BEGIN
   result := NIL;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'req';
      fieldname.len := 3;
      typecode := 112;
   END;
   result^.typeindicator := EnumSet;
   FOR req:=pospol TO omegapol DO BEGIN
      IF req IN rec.req THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_polaritytype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,req);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'env';
      fieldname.len := 3;
      typecode := 112;
   END;
   result^.typeindicator := EnumSet;
   FOR env:=pospol TO omegapol DO BEGIN
      IF env IN rec.env THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_polaritytype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,env);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'class';
      fieldname.len := 5;
      typecode := 80;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_timeadvclasstype( result^.fieldvalue.str, result^.fieldvalue.len, rec.class);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'deixis';
      fieldname.len := 6;
      typecode := 46;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_deixistype( result^.fieldvalue.str, result^.fieldvalue.len, rec.deixis);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'aspect';
      fieldname.len := 6;
      typecode := 34;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_aspecttype( result^.fieldvalue.str, result^.fieldvalue.len, rec.aspect);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'retro';
      fieldname.len := 5;
      typecode := 19;
   END;
   result^.typeindicator := Bool;
   IF rec.retro = TRUE THEN BEGIN
      result^.fieldvalue.str := 'TRUE';
      result^.fieldvalue.len := 4;
      END
   ELSE BEGIN
      result^.fieldvalue.str := 'FALSE';
      result^.fieldvalue.len := 5;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'actuseefs';
      fieldname.len := 9;
      typecode := 92;
   END;
   result^.typeindicator := EnumSet;
   FOR actuseefs:=attributive TO postposition DO BEGIN
      IF actuseefs IN rec.actuseefs THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_adjusetype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,actuseefs);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'temporal';
      fieldname.len := 8;
      typecode := 23;
   END;
   result^.typeindicator := Bool;
   IF rec.temporal = TRUE THEN BEGIN
      result^.fieldvalue.str := 'TRUE';
      result^.fieldvalue.len := 4;
      END
   ELSE BEGIN
      result^.fieldvalue.str := 'FALSE';
      result^.fieldvalue.len := 5;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'actsubcefs';
      fieldname.len := 10;
      typecode := 89;
   END;
   result^.typeindicator := EnumSet;
   FOR actsubcefs:=coloradj TO tosubjectiveadj DO BEGIN
      IF actsubcefs IN rec.actsubcefs THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_adjsubctype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,actsubcefs);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'thetaadj';
      fieldname.len := 8;
      typecode := 75;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_thetaadjtype( result^.fieldvalue.str, result^.fieldvalue.len, rec.thetaadj);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'adjpatternefs';
      fieldname.len := 13;
      typecode := 119;
   END;
   result^.typeindicator := EnumSet;
   FOR adjpatternefs:=synASIFSENT TO synDONP_OPENINFSENT DO BEGIN
      IF adjpatternefs IN rec.adjpatternefs THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_synpatterntype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,adjpatternefs);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'mood';
      fieldname.len := 4;
      typecode := 83;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_xpmoodtype( result^.fieldvalue.str, result^.fieldvalue.len, rec.mood);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'coord';
      fieldname.len := 5;
      typecode := 44;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_coordtype( result^.fieldvalue.str, result^.fieldvalue.len, rec.coord);
   LSCONVREC_ADJPrecord := result;
END {LSCONVREC_ADJPrecord};

FUNCTION LSCONVREC_ADJPPROPrecord(rec: LSDOMAINT_ADJPPROPrecord): LDCONVREC_pAttrStruct;
VAR result : LDCONVREC_pAttrStruct;
    req : LSDOMAINT_polaritytype; 
    env : LSDOMAINT_polaritytype; 
    aktionsarts : LSDOMAINT_aktionsarttype; 
    actsubcefs : LSDOMAINT_adjsubctype; 
    adjpatternefs : LSDOMAINT_synpatterntype; 
BEGIN
   result := NIL;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'req';
      fieldname.len := 3;
      typecode := 112;
   END;
   result^.typeindicator := EnumSet;
   FOR req:=pospol TO omegapol DO BEGIN
      IF req IN rec.req THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_polaritytype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,req);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'env';
      fieldname.len := 3;
      typecode := 112;
   END;
   result^.typeindicator := EnumSet;
   FOR env:=pospol TO omegapol DO BEGIN
      IF env IN rec.env THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_polaritytype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,env);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'class';
      fieldname.len := 5;
      typecode := 80;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_timeadvclasstype( result^.fieldvalue.str, result^.fieldvalue.len, rec.class);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'deixis';
      fieldname.len := 6;
      typecode := 46;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_deixistype( result^.fieldvalue.str, result^.fieldvalue.len, rec.deixis);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'aspect';
      fieldname.len := 6;
      typecode := 34;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_aspecttype( result^.fieldvalue.str, result^.fieldvalue.len, rec.aspect);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'retro';
      fieldname.len := 5;
      typecode := 19;
   END;
   result^.typeindicator := Bool;
   IF rec.retro = TRUE THEN BEGIN
      result^.fieldvalue.str := 'TRUE';
      result^.fieldvalue.len := 4;
      END
   ELSE BEGIN
      result^.fieldvalue.str := 'FALSE';
      result^.fieldvalue.len := 5;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'aktionsarts';
      fieldname.len := 11;
      typecode := 95;
   END;
   result^.typeindicator := EnumSet;
   FOR aktionsarts:=stative TO achievement DO BEGIN
      IF aktionsarts IN rec.aktionsarts THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_aktionsarttype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,aktionsarts);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'superdeixis';
      fieldname.len := 11;
      typecode := 46;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_deixistype( result^.fieldvalue.str, result^.fieldvalue.len, rec.superdeixis);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'temporal';
      fieldname.len := 8;
      typecode := 23;
   END;
   result^.typeindicator := Bool;
   IF rec.temporal = TRUE THEN BEGIN
      result^.fieldvalue.str := 'TRUE';
      result^.fieldvalue.len := 4;
      END
   ELSE BEGIN
      result^.fieldvalue.str := 'FALSE';
      result^.fieldvalue.len := 5;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'actsubcefs';
      fieldname.len := 10;
      typecode := 89;
   END;
   result^.typeindicator := EnumSet;
   FOR actsubcefs:=coloradj TO tosubjectiveadj DO BEGIN
      IF actsubcefs IN rec.actsubcefs THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_adjsubctype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,actsubcefs);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'thetaadj';
      fieldname.len := 8;
      typecode := 75;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_thetaadjtype( result^.fieldvalue.str, result^.fieldvalue.len, rec.thetaadj);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'adjpatternefs';
      fieldname.len := 13;
      typecode := 119;
   END;
   result^.typeindicator := EnumSet;
   FOR adjpatternefs:=synASIFSENT TO synDONP_OPENINFSENT DO BEGIN
      IF adjpatternefs IN rec.adjpatternefs THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_synpatterntype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,adjpatternefs);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'PROsubject';
      fieldname.len := 10;
      typecode := 18;
   END;
   result^.typeindicator := Bool;
   IF rec.PROsubject = TRUE THEN BEGIN
      result^.fieldvalue.str := 'TRUE';
      result^.fieldvalue.len := 4;
      END
   ELSE BEGIN
      result^.fieldvalue.str := 'FALSE';
      result^.fieldvalue.len := 5;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'mood';
      fieldname.len := 4;
      typecode := 83;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_xpmoodtype( result^.fieldvalue.str, result^.fieldvalue.len, rec.mood);
   LSCONVREC_ADJPPROPrecord := result;
END {LSCONVREC_ADJPPROPrecord};

FUNCTION LSCONVREC_ADJPPROPVARrecord(rec: LSDOMAINT_ADJPPROPVARrecord): LDCONVREC_pAttrStruct;
VAR result : LDCONVREC_pAttrStruct;
    req : LSDOMAINT_polaritytype; 
    env : LSDOMAINT_polaritytype; 
    aktionsarts : LSDOMAINT_aktionsarttype; 
    actsubcefs : LSDOMAINT_adjsubctype; 
    adjpatternefs : LSDOMAINT_synpatterntype; 
BEGIN
   result := NIL;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'INDEX';
      fieldname.len := 5;
      typecode := 0;
      typeindicator := Int;
      STR_IntegerToStr(rec.INDEX,  fieldvalue.str, fieldvalue.len);
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'req';
      fieldname.len := 3;
      typecode := 112;
   END;
   result^.typeindicator := EnumSet;
   FOR req:=pospol TO omegapol DO BEGIN
      IF req IN rec.req THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_polaritytype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,req);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'env';
      fieldname.len := 3;
      typecode := 112;
   END;
   result^.typeindicator := EnumSet;
   FOR env:=pospol TO omegapol DO BEGIN
      IF env IN rec.env THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_polaritytype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,env);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'class';
      fieldname.len := 5;
      typecode := 80;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_timeadvclasstype( result^.fieldvalue.str, result^.fieldvalue.len, rec.class);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'deixis';
      fieldname.len := 6;
      typecode := 46;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_deixistype( result^.fieldvalue.str, result^.fieldvalue.len, rec.deixis);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'aspect';
      fieldname.len := 6;
      typecode := 34;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_aspecttype( result^.fieldvalue.str, result^.fieldvalue.len, rec.aspect);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'retro';
      fieldname.len := 5;
      typecode := 19;
   END;
   result^.typeindicator := Bool;
   IF rec.retro = TRUE THEN BEGIN
      result^.fieldvalue.str := 'TRUE';
      result^.fieldvalue.len := 4;
      END
   ELSE BEGIN
      result^.fieldvalue.str := 'FALSE';
      result^.fieldvalue.len := 5;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'aktionsarts';
      fieldname.len := 11;
      typecode := 95;
   END;
   result^.typeindicator := EnumSet;
   FOR aktionsarts:=stative TO achievement DO BEGIN
      IF aktionsarts IN rec.aktionsarts THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_aktionsarttype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,aktionsarts);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'superdeixis';
      fieldname.len := 11;
      typecode := 46;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_deixistype( result^.fieldvalue.str, result^.fieldvalue.len, rec.superdeixis);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'temporal';
      fieldname.len := 8;
      typecode := 23;
   END;
   result^.typeindicator := Bool;
   IF rec.temporal = TRUE THEN BEGIN
      result^.fieldvalue.str := 'TRUE';
      result^.fieldvalue.len := 4;
      END
   ELSE BEGIN
      result^.fieldvalue.str := 'FALSE';
      result^.fieldvalue.len := 5;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'actsubcefs';
      fieldname.len := 10;
      typecode := 89;
   END;
   result^.typeindicator := EnumSet;
   FOR actsubcefs:=coloradj TO tosubjectiveadj DO BEGIN
      IF actsubcefs IN rec.actsubcefs THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_adjsubctype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,actsubcefs);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'thetaadj';
      fieldname.len := 8;
      typecode := 75;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_thetaadjtype( result^.fieldvalue.str, result^.fieldvalue.len, rec.thetaadj);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'adjpatternefs';
      fieldname.len := 13;
      typecode := 119;
   END;
   result^.typeindicator := EnumSet;
   FOR adjpatternefs:=synASIFSENT TO synDONP_OPENINFSENT DO BEGIN
      IF adjpatternefs IN rec.adjpatternefs THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_synpatterntype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,adjpatternefs);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'PROsubject';
      fieldname.len := 10;
      typecode := 18;
   END;
   result^.typeindicator := Bool;
   IF rec.PROsubject = TRUE THEN BEGIN
      result^.fieldvalue.str := 'TRUE';
      result^.fieldvalue.len := 4;
      END
   ELSE BEGIN
      result^.fieldvalue.str := 'FALSE';
      result^.fieldvalue.len := 5;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'mood';
      fieldname.len := 4;
      typecode := 83;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_xpmoodtype( result^.fieldvalue.str, result^.fieldvalue.len, rec.mood);
   LSCONVREC_ADJPPROPVARrecord := result;
END {LSCONVREC_ADJPPROPVARrecord};

FUNCTION LSCONVREC_BADVrecord(rec: LSDOMAINT_BADVrecord): LDCONVREC_pAttrStruct;
VAR result : LDCONVREC_pAttrStruct;
    compformations : LSDOMAINT_compformationtype; 
    req : LSDOMAINT_polaritytype; 
    env : LSDOMAINT_polaritytype; 
    subcs : LSDOMAINT_advsubctype; 
    advpatterns : LSDOMAINT_synpatterntype; 
    position : LSDOMAINT_positiontype; 
BEGIN
   result := NIL;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'KEY';
      fieldname.len := 3;
      typecode := 0;
      typeindicator := Int;
      STR_IntegerToStr(rec.KEY,  fieldvalue.str, fieldvalue.len);
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'compformations';
      fieldname.len := 14;
      typecode := 99;
   END;
   result^.typeindicator := EnumSet;
   FOR compformations:=regcomp TO irrAdvComp DO BEGIN
      IF compformations IN rec.compformations THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_compformationtype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,compformations);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'req';
      fieldname.len := 3;
      typecode := 112;
   END;
   result^.typeindicator := EnumSet;
   FOR req:=pospol TO omegapol DO BEGIN
      IF req IN rec.req THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_polaritytype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,req);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'env';
      fieldname.len := 3;
      typecode := 112;
   END;
   result^.typeindicator := EnumSet;
   FOR env:=pospol TO omegapol DO BEGIN
      IF env IN rec.env THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_polaritytype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,env);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'subcs';
      fieldname.len := 5;
      typecode := 93;
   END;
   result^.typeindicator := EnumSet;
   FOR subcs:=SentAdv TO PrepPAdv DO BEGIN
      IF subcs IN rec.subcs THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_advsubctype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,subcs);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'class';
      fieldname.len := 5;
      typecode := 80;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_timeadvclasstype( result^.fieldvalue.str, result^.fieldvalue.len, rec.class);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'deixis';
      fieldname.len := 6;
      typecode := 46;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_deixistype( result^.fieldvalue.str, result^.fieldvalue.len, rec.deixis);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'aspect';
      fieldname.len := 6;
      typecode := 34;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_aspecttype( result^.fieldvalue.str, result^.fieldvalue.len, rec.aspect);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'retro';
      fieldname.len := 5;
      typecode := 19;
   END;
   result^.typeindicator := Bool;
   IF rec.retro = TRUE THEN BEGIN
      result^.fieldvalue.str := 'TRUE';
      result^.fieldvalue.len := 4;
      END
   ELSE BEGIN
      result^.fieldvalue.str := 'FALSE';
      result^.fieldvalue.len := 5;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'mood';
      fieldname.len := 4;
      typecode := 83;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_xpmoodtype( result^.fieldvalue.str, result^.fieldvalue.len, rec.mood);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'thetaadv';
      fieldname.len := 8;
      typecode := 76;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_thetaadvtype( result^.fieldvalue.str, result^.fieldvalue.len, rec.thetaadv);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'advpatterns';
      fieldname.len := 11;
      typecode := 118;
   END;
   result^.typeindicator := EnumSet;
   FOR advpatterns:=synASIFSENT TO synDONP_OPENINFSENT DO BEGIN
      IF advpatterns IN rec.advpatterns THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_synpatterntype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,advpatterns);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'prepkey';
      fieldname.len := 7;
      typecode := 2;
   END;
   result^.typeindicator := Int;
   STR_IntegerToStr( rec.prepkey, result^.fieldvalue.str, result^.fieldvalue.len);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'position';
      fieldname.len := 8;
      typecode := 113;
   END;
   result^.typeindicator := EnumSet;
   FOR position:=1 TO 6 DO BEGIN
      IF position IN rec.position THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_positiontype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,position);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'possnietnp';
      fieldname.len := 10;
      typecode := 14;
   END;
   result^.typeindicator := Bool;
   IF rec.possnietnp = TRUE THEN BEGIN
      result^.fieldvalue.str := 'TRUE';
      result^.fieldvalue.len := 4;
      END
   ELSE BEGIN
      result^.fieldvalue.str := 'FALSE';
      result^.fieldvalue.len := 5;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'thanas';
      fieldname.len := 6;
      typecode := 73;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_thanascompltype( result^.fieldvalue.str, result^.fieldvalue.len, rec.thanas);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'temporal';
      fieldname.len := 8;
      typecode := 23;
   END;
   result^.typeindicator := Bool;
   IF rec.temporal = TRUE THEN BEGIN
      result^.fieldvalue.str := 'TRUE';
      result^.fieldvalue.len := 4;
      END
   ELSE BEGIN
      result^.fieldvalue.str := 'FALSE';
      result^.fieldvalue.len := 5;
   END;
   LSCONVREC_BADVrecord := result;
END {LSCONVREC_BADVrecord};

FUNCTION LSCONVREC_SUBADVrecord(rec: LSDOMAINT_SUBADVrecord): LDCONVREC_pAttrStruct;
VAR result : LDCONVREC_pAttrStruct;
    compformations : LSDOMAINT_compformationtype; 
    req : LSDOMAINT_polaritytype; 
    env : LSDOMAINT_polaritytype; 
    subcs : LSDOMAINT_advsubctype; 
    advpatterns : LSDOMAINT_synpatterntype; 
    position : LSDOMAINT_positiontype; 
BEGIN
   result := NIL;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'compformations';
      fieldname.len := 14;
      typecode := 99;
   END;
   result^.typeindicator := EnumSet;
   FOR compformations:=regcomp TO irrAdvComp DO BEGIN
      IF compformations IN rec.compformations THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_compformationtype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,compformations);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'affix';
      fieldname.len := 5;
      typecode := 30;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_affixtype( result^.fieldvalue.str, result^.fieldvalue.len, rec.affix);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'req';
      fieldname.len := 3;
      typecode := 112;
   END;
   result^.typeindicator := EnumSet;
   FOR req:=pospol TO omegapol DO BEGIN
      IF req IN rec.req THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_polaritytype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,req);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'env';
      fieldname.len := 3;
      typecode := 112;
   END;
   result^.typeindicator := EnumSet;
   FOR env:=pospol TO omegapol DO BEGIN
      IF env IN rec.env THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_polaritytype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,env);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'subcs';
      fieldname.len := 5;
      typecode := 93;
   END;
   result^.typeindicator := EnumSet;
   FOR subcs:=SentAdv TO PrepPAdv DO BEGIN
      IF subcs IN rec.subcs THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_advsubctype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,subcs);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'class';
      fieldname.len := 5;
      typecode := 80;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_timeadvclasstype( result^.fieldvalue.str, result^.fieldvalue.len, rec.class);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'deixis';
      fieldname.len := 6;
      typecode := 46;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_deixistype( result^.fieldvalue.str, result^.fieldvalue.len, rec.deixis);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'aspect';
      fieldname.len := 6;
      typecode := 34;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_aspecttype( result^.fieldvalue.str, result^.fieldvalue.len, rec.aspect);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'retro';
      fieldname.len := 5;
      typecode := 19;
   END;
   result^.typeindicator := Bool;
   IF rec.retro = TRUE THEN BEGIN
      result^.fieldvalue.str := 'TRUE';
      result^.fieldvalue.len := 4;
      END
   ELSE BEGIN
      result^.fieldvalue.str := 'FALSE';
      result^.fieldvalue.len := 5;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'mood';
      fieldname.len := 4;
      typecode := 83;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_xpmoodtype( result^.fieldvalue.str, result^.fieldvalue.len, rec.mood);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'thetaadv';
      fieldname.len := 8;
      typecode := 76;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_thetaadvtype( result^.fieldvalue.str, result^.fieldvalue.len, rec.thetaadv);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'advpatterns';
      fieldname.len := 11;
      typecode := 118;
   END;
   result^.typeindicator := EnumSet;
   FOR advpatterns:=synASIFSENT TO synDONP_OPENINFSENT DO BEGIN
      IF advpatterns IN rec.advpatterns THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_synpatterntype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,advpatterns);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'prepkey';
      fieldname.len := 7;
      typecode := 2;
   END;
   result^.typeindicator := Int;
   STR_IntegerToStr( rec.prepkey, result^.fieldvalue.str, result^.fieldvalue.len);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'position';
      fieldname.len := 8;
      typecode := 113;
   END;
   result^.typeindicator := EnumSet;
   FOR position:=1 TO 6 DO BEGIN
      IF position IN rec.position THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_positiontype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,position);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'possnietnp';
      fieldname.len := 10;
      typecode := 14;
   END;
   result^.typeindicator := Bool;
   IF rec.possnietnp = TRUE THEN BEGIN
      result^.fieldvalue.str := 'TRUE';
      result^.fieldvalue.len := 4;
      END
   ELSE BEGIN
      result^.fieldvalue.str := 'FALSE';
      result^.fieldvalue.len := 5;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'thanas';
      fieldname.len := 6;
      typecode := 73;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_thanascompltype( result^.fieldvalue.str, result^.fieldvalue.len, rec.thanas);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'temporal';
      fieldname.len := 8;
      typecode := 23;
   END;
   result^.typeindicator := Bool;
   IF rec.temporal = TRUE THEN BEGIN
      result^.fieldvalue.str := 'TRUE';
      result^.fieldvalue.len := 4;
      END
   ELSE BEGIN
      result^.fieldvalue.str := 'FALSE';
      result^.fieldvalue.len := 5;
   END;
   LSCONVREC_SUBADVrecord := result;
END {LSCONVREC_SUBADVrecord};

FUNCTION LSCONVREC_ADVrecord(rec: LSDOMAINT_ADVrecord): LDCONVREC_pAttrStruct;
VAR result : LDCONVREC_pAttrStruct;
    compformations : LSDOMAINT_compformationtype; 
    req : LSDOMAINT_polaritytype; 
    env : LSDOMAINT_polaritytype; 
    subcs : LSDOMAINT_advsubctype; 
    advpatterns : LSDOMAINT_synpatterntype; 
    position : LSDOMAINT_positiontype; 
BEGIN
   result := NIL;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'compformations';
      fieldname.len := 14;
      typecode := 99;
   END;
   result^.typeindicator := EnumSet;
   FOR compformations:=regcomp TO irrAdvComp DO BEGIN
      IF compformations IN rec.compformations THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_compformationtype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,compformations);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'affix';
      fieldname.len := 5;
      typecode := 30;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_affixtype( result^.fieldvalue.str, result^.fieldvalue.len, rec.affix);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'compform';
      fieldname.len := 8;
      typecode := 39;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_compformtype( result^.fieldvalue.str, result^.fieldvalue.len, rec.compform);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'req';
      fieldname.len := 3;
      typecode := 112;
   END;
   result^.typeindicator := EnumSet;
   FOR req:=pospol TO omegapol DO BEGIN
      IF req IN rec.req THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_polaritytype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,req);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'env';
      fieldname.len := 3;
      typecode := 112;
   END;
   result^.typeindicator := EnumSet;
   FOR env:=pospol TO omegapol DO BEGIN
      IF env IN rec.env THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_polaritytype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,env);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'subcs';
      fieldname.len := 5;
      typecode := 93;
   END;
   result^.typeindicator := EnumSet;
   FOR subcs:=SentAdv TO PrepPAdv DO BEGIN
      IF subcs IN rec.subcs THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_advsubctype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,subcs);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'class';
      fieldname.len := 5;
      typecode := 80;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_timeadvclasstype( result^.fieldvalue.str, result^.fieldvalue.len, rec.class);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'deixis';
      fieldname.len := 6;
      typecode := 46;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_deixistype( result^.fieldvalue.str, result^.fieldvalue.len, rec.deixis);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'aspect';
      fieldname.len := 6;
      typecode := 34;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_aspecttype( result^.fieldvalue.str, result^.fieldvalue.len, rec.aspect);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'retro';
      fieldname.len := 5;
      typecode := 19;
   END;
   result^.typeindicator := Bool;
   IF rec.retro = TRUE THEN BEGIN
      result^.fieldvalue.str := 'TRUE';
      result^.fieldvalue.len := 4;
      END
   ELSE BEGIN
      result^.fieldvalue.str := 'FALSE';
      result^.fieldvalue.len := 5;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'mood';
      fieldname.len := 4;
      typecode := 83;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_xpmoodtype( result^.fieldvalue.str, result^.fieldvalue.len, rec.mood);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'thetaadv';
      fieldname.len := 8;
      typecode := 76;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_thetaadvtype( result^.fieldvalue.str, result^.fieldvalue.len, rec.thetaadv);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'advpatterns';
      fieldname.len := 11;
      typecode := 118;
   END;
   result^.typeindicator := EnumSet;
   FOR advpatterns:=synASIFSENT TO synDONP_OPENINFSENT DO BEGIN
      IF advpatterns IN rec.advpatterns THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_synpatterntype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,advpatterns);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'prepkey';
      fieldname.len := 7;
      typecode := 2;
   END;
   result^.typeindicator := Int;
   STR_IntegerToStr( rec.prepkey, result^.fieldvalue.str, result^.fieldvalue.len);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'position';
      fieldname.len := 8;
      typecode := 113;
   END;
   result^.typeindicator := EnumSet;
   FOR position:=1 TO 6 DO BEGIN
      IF position IN rec.position THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_positiontype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,position);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'possnietnp';
      fieldname.len := 10;
      typecode := 14;
   END;
   result^.typeindicator := Bool;
   IF rec.possnietnp = TRUE THEN BEGIN
      result^.fieldvalue.str := 'TRUE';
      result^.fieldvalue.len := 4;
      END
   ELSE BEGIN
      result^.fieldvalue.str := 'FALSE';
      result^.fieldvalue.len := 5;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'thanas';
      fieldname.len := 6;
      typecode := 73;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_thanascompltype( result^.fieldvalue.str, result^.fieldvalue.len, rec.thanas);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'temporal';
      fieldname.len := 8;
      typecode := 23;
   END;
   result^.typeindicator := Bool;
   IF rec.temporal = TRUE THEN BEGIN
      result^.fieldvalue.str := 'TRUE';
      result^.fieldvalue.len := 4;
      END
   ELSE BEGIN
      result^.fieldvalue.str := 'FALSE';
      result^.fieldvalue.len := 5;
   END;
   LSCONVREC_ADVrecord := result;
END {LSCONVREC_ADVrecord};

FUNCTION LSCONVREC_ADVPrecord(rec: LSDOMAINT_ADVPrecord): LDCONVREC_pAttrStruct;
VAR result : LDCONVREC_pAttrStruct;
    req : LSDOMAINT_polaritytype; 
    env : LSDOMAINT_polaritytype; 
    actsubcefs : LSDOMAINT_advsubctype; 
    advpatternefs : LSDOMAINT_synpatterntype; 
    position : LSDOMAINT_positiontype; 
BEGIN
   result := NIL;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'req';
      fieldname.len := 3;
      typecode := 112;
   END;
   result^.typeindicator := EnumSet;
   FOR req:=pospol TO omegapol DO BEGIN
      IF req IN rec.req THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_polaritytype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,req);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'env';
      fieldname.len := 3;
      typecode := 112;
   END;
   result^.typeindicator := EnumSet;
   FOR env:=pospol TO omegapol DO BEGIN
      IF env IN rec.env THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_polaritytype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,env);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'class';
      fieldname.len := 5;
      typecode := 80;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_timeadvclasstype( result^.fieldvalue.str, result^.fieldvalue.len, rec.class);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'deixis';
      fieldname.len := 6;
      typecode := 46;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_deixistype( result^.fieldvalue.str, result^.fieldvalue.len, rec.deixis);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'aspect';
      fieldname.len := 6;
      typecode := 34;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_aspecttype( result^.fieldvalue.str, result^.fieldvalue.len, rec.aspect);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'retro';
      fieldname.len := 5;
      typecode := 19;
   END;
   result^.typeindicator := Bool;
   IF rec.retro = TRUE THEN BEGIN
      result^.fieldvalue.str := 'TRUE';
      result^.fieldvalue.len := 4;
      END
   ELSE BEGIN
      result^.fieldvalue.str := 'FALSE';
      result^.fieldvalue.len := 5;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'mood';
      fieldname.len := 4;
      typecode := 83;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_xpmoodtype( result^.fieldvalue.str, result^.fieldvalue.len, rec.mood);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'thetaadv';
      fieldname.len := 8;
      typecode := 76;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_thetaadvtype( result^.fieldvalue.str, result^.fieldvalue.len, rec.thetaadv);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'superdeixis';
      fieldname.len := 11;
      typecode := 46;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_deixistype( result^.fieldvalue.str, result^.fieldvalue.len, rec.superdeixis);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'actsubcefs';
      fieldname.len := 10;
      typecode := 94;
   END;
   result^.typeindicator := EnumSet;
   FOR actsubcefs:=SentAdv TO PrepPAdv DO BEGIN
      IF actsubcefs IN rec.actsubcefs THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_advsubctype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,actsubcefs);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'advpatternefs';
      fieldname.len := 13;
      typecode := 119;
   END;
   result^.typeindicator := EnumSet;
   FOR advpatternefs:=synASIFSENT TO synDONP_OPENINFSENT DO BEGIN
      IF advpatternefs IN rec.advpatternefs THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_synpatterntype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,advpatternefs);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'position';
      fieldname.len := 8;
      typecode := 113;
   END;
   result^.typeindicator := EnumSet;
   FOR position:=1 TO 6 DO BEGIN
      IF position IN rec.position THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_positiontype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,position);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'possnietnp';
      fieldname.len := 10;
      typecode := 14;
   END;
   result^.typeindicator := Bool;
   IF rec.possnietnp = TRUE THEN BEGIN
      result^.fieldvalue.str := 'TRUE';
      result^.fieldvalue.len := 4;
      END
   ELSE BEGIN
      result^.fieldvalue.str := 'FALSE';
      result^.fieldvalue.len := 5;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'thanas';
      fieldname.len := 6;
      typecode := 73;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_thanascompltype( result^.fieldvalue.str, result^.fieldvalue.len, rec.thanas);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'thanascompl';
      fieldname.len := 11;
      typecode := 5;
   END;
   result^.typeindicator := Bool;
   IF rec.thanascompl = TRUE THEN BEGIN
      result^.fieldvalue.str := 'TRUE';
      result^.fieldvalue.len := 4;
      END
   ELSE BEGIN
      result^.fieldvalue.str := 'FALSE';
      result^.fieldvalue.len := 5;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'temporal';
      fieldname.len := 8;
      typecode := 23;
   END;
   result^.typeindicator := Bool;
   IF rec.temporal = TRUE THEN BEGIN
      result^.fieldvalue.str := 'TRUE';
      result^.fieldvalue.len := 4;
      END
   ELSE BEGIN
      result^.fieldvalue.str := 'FALSE';
      result^.fieldvalue.len := 5;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'coord';
      fieldname.len := 5;
      typecode := 44;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_coordtype( result^.fieldvalue.str, result^.fieldvalue.len, rec.coord);
   LSCONVREC_ADVPrecord := result;
END {LSCONVREC_ADVPrecord};

FUNCTION LSCONVREC_ADVPVARrecord(rec: LSDOMAINT_ADVPVARrecord): LDCONVREC_pAttrStruct;
VAR result : LDCONVREC_pAttrStruct;
    req : LSDOMAINT_polaritytype; 
    env : LSDOMAINT_polaritytype; 
    actsubcefs : LSDOMAINT_advsubctype; 
    advpatternefs : LSDOMAINT_synpatterntype; 
    position : LSDOMAINT_positiontype; 
BEGIN
   result := NIL;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'INDEX';
      fieldname.len := 5;
      typecode := 0;
      typeindicator := Int;
      STR_IntegerToStr(rec.INDEX,  fieldvalue.str, fieldvalue.len);
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'req';
      fieldname.len := 3;
      typecode := 112;
   END;
   result^.typeindicator := EnumSet;
   FOR req:=pospol TO omegapol DO BEGIN
      IF req IN rec.req THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_polaritytype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,req);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'env';
      fieldname.len := 3;
      typecode := 112;
   END;
   result^.typeindicator := EnumSet;
   FOR env:=pospol TO omegapol DO BEGIN
      IF env IN rec.env THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_polaritytype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,env);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'class';
      fieldname.len := 5;
      typecode := 80;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_timeadvclasstype( result^.fieldvalue.str, result^.fieldvalue.len, rec.class);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'deixis';
      fieldname.len := 6;
      typecode := 46;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_deixistype( result^.fieldvalue.str, result^.fieldvalue.len, rec.deixis);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'aspect';
      fieldname.len := 6;
      typecode := 34;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_aspecttype( result^.fieldvalue.str, result^.fieldvalue.len, rec.aspect);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'retro';
      fieldname.len := 5;
      typecode := 19;
   END;
   result^.typeindicator := Bool;
   IF rec.retro = TRUE THEN BEGIN
      result^.fieldvalue.str := 'TRUE';
      result^.fieldvalue.len := 4;
      END
   ELSE BEGIN
      result^.fieldvalue.str := 'FALSE';
      result^.fieldvalue.len := 5;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'mood';
      fieldname.len := 4;
      typecode := 83;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_xpmoodtype( result^.fieldvalue.str, result^.fieldvalue.len, rec.mood);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'thetaadv';
      fieldname.len := 8;
      typecode := 76;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_thetaadvtype( result^.fieldvalue.str, result^.fieldvalue.len, rec.thetaadv);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'superdeixis';
      fieldname.len := 11;
      typecode := 46;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_deixistype( result^.fieldvalue.str, result^.fieldvalue.len, rec.superdeixis);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'actsubcefs';
      fieldname.len := 10;
      typecode := 94;
   END;
   result^.typeindicator := EnumSet;
   FOR actsubcefs:=SentAdv TO PrepPAdv DO BEGIN
      IF actsubcefs IN rec.actsubcefs THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_advsubctype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,actsubcefs);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'advpatternefs';
      fieldname.len := 13;
      typecode := 119;
   END;
   result^.typeindicator := EnumSet;
   FOR advpatternefs:=synASIFSENT TO synDONP_OPENINFSENT DO BEGIN
      IF advpatternefs IN rec.advpatternefs THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_synpatterntype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,advpatternefs);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'position';
      fieldname.len := 8;
      typecode := 113;
   END;
   result^.typeindicator := EnumSet;
   FOR position:=1 TO 6 DO BEGIN
      IF position IN rec.position THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_positiontype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,position);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'possnietnp';
      fieldname.len := 10;
      typecode := 14;
   END;
   result^.typeindicator := Bool;
   IF rec.possnietnp = TRUE THEN BEGIN
      result^.fieldvalue.str := 'TRUE';
      result^.fieldvalue.len := 4;
      END
   ELSE BEGIN
      result^.fieldvalue.str := 'FALSE';
      result^.fieldvalue.len := 5;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'thanas';
      fieldname.len := 6;
      typecode := 73;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_thanascompltype( result^.fieldvalue.str, result^.fieldvalue.len, rec.thanas);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'thanascompl';
      fieldname.len := 11;
      typecode := 5;
   END;
   result^.typeindicator := Bool;
   IF rec.thanascompl = TRUE THEN BEGIN
      result^.fieldvalue.str := 'TRUE';
      result^.fieldvalue.len := 4;
      END
   ELSE BEGIN
      result^.fieldvalue.str := 'FALSE';
      result^.fieldvalue.len := 5;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'temporal';
      fieldname.len := 8;
      typecode := 23;
   END;
   result^.typeindicator := Bool;
   IF rec.temporal = TRUE THEN BEGIN
      result^.fieldvalue.str := 'TRUE';
      result^.fieldvalue.len := 4;
      END
   ELSE BEGIN
      result^.fieldvalue.str := 'FALSE';
      result^.fieldvalue.len := 5;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'coord';
      fieldname.len := 5;
      typecode := 44;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_coordtype( result^.fieldvalue.str, result^.fieldvalue.len, rec.coord);
   LSCONVREC_ADVPVARrecord := result;
END {LSCONVREC_ADVPVARrecord};

FUNCTION LSCONVREC_ADVPPROPrecord(rec: LSDOMAINT_ADVPPROPrecord): LDCONVREC_pAttrStruct;
VAR result : LDCONVREC_pAttrStruct;
    req : LSDOMAINT_polaritytype; 
    env : LSDOMAINT_polaritytype; 
    aktionsarts : LSDOMAINT_aktionsarttype; 
    actsubcefs : LSDOMAINT_advsubctype; 
    advpatternefs : LSDOMAINT_synpatterntype; 
BEGIN
   result := NIL;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'req';
      fieldname.len := 3;
      typecode := 112;
   END;
   result^.typeindicator := EnumSet;
   FOR req:=pospol TO omegapol DO BEGIN
      IF req IN rec.req THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_polaritytype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,req);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'env';
      fieldname.len := 3;
      typecode := 112;
   END;
   result^.typeindicator := EnumSet;
   FOR env:=pospol TO omegapol DO BEGIN
      IF env IN rec.env THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_polaritytype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,env);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'class';
      fieldname.len := 5;
      typecode := 80;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_timeadvclasstype( result^.fieldvalue.str, result^.fieldvalue.len, rec.class);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'deixis';
      fieldname.len := 6;
      typecode := 46;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_deixistype( result^.fieldvalue.str, result^.fieldvalue.len, rec.deixis);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'aspect';
      fieldname.len := 6;
      typecode := 34;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_aspecttype( result^.fieldvalue.str, result^.fieldvalue.len, rec.aspect);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'retro';
      fieldname.len := 5;
      typecode := 19;
   END;
   result^.typeindicator := Bool;
   IF rec.retro = TRUE THEN BEGIN
      result^.fieldvalue.str := 'TRUE';
      result^.fieldvalue.len := 4;
      END
   ELSE BEGIN
      result^.fieldvalue.str := 'FALSE';
      result^.fieldvalue.len := 5;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'aktionsarts';
      fieldname.len := 11;
      typecode := 95;
   END;
   result^.typeindicator := EnumSet;
   FOR aktionsarts:=stative TO achievement DO BEGIN
      IF aktionsarts IN rec.aktionsarts THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_aktionsarttype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,aktionsarts);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'superdeixis';
      fieldname.len := 11;
      typecode := 46;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_deixistype( result^.fieldvalue.str, result^.fieldvalue.len, rec.superdeixis);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'actsubcefs';
      fieldname.len := 10;
      typecode := 94;
   END;
   result^.typeindicator := EnumSet;
   FOR actsubcefs:=SentAdv TO PrepPAdv DO BEGIN
      IF actsubcefs IN rec.actsubcefs THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_advsubctype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,actsubcefs);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'thetaadv';
      fieldname.len := 8;
      typecode := 76;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_thetaadvtype( result^.fieldvalue.str, result^.fieldvalue.len, rec.thetaadv);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'advpatternefs';
      fieldname.len := 13;
      typecode := 119;
   END;
   result^.typeindicator := EnumSet;
   FOR advpatternefs:=synASIFSENT TO synDONP_OPENINFSENT DO BEGIN
      IF advpatternefs IN rec.advpatternefs THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_synpatterntype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,advpatternefs);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'PROsubject';
      fieldname.len := 10;
      typecode := 18;
   END;
   result^.typeindicator := Bool;
   IF rec.PROsubject = TRUE THEN BEGIN
      result^.fieldvalue.str := 'TRUE';
      result^.fieldvalue.len := 4;
      END
   ELSE BEGIN
      result^.fieldvalue.str := 'FALSE';
      result^.fieldvalue.len := 5;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'mood';
      fieldname.len := 4;
      typecode := 83;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_xpmoodtype( result^.fieldvalue.str, result^.fieldvalue.len, rec.mood);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'thanascompl';
      fieldname.len := 11;
      typecode := 5;
   END;
   result^.typeindicator := Bool;
   IF rec.thanascompl = TRUE THEN BEGIN
      result^.fieldvalue.str := 'TRUE';
      result^.fieldvalue.len := 4;
      END
   ELSE BEGIN
      result^.fieldvalue.str := 'FALSE';
      result^.fieldvalue.len := 5;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'temporal';
      fieldname.len := 8;
      typecode := 23;
   END;
   result^.typeindicator := Bool;
   IF rec.temporal = TRUE THEN BEGIN
      result^.fieldvalue.str := 'TRUE';
      result^.fieldvalue.len := 4;
      END
   ELSE BEGIN
      result^.fieldvalue.str := 'FALSE';
      result^.fieldvalue.len := 5;
   END;
   LSCONVREC_ADVPPROPrecord := result;
END {LSCONVREC_ADVPPROPrecord};

FUNCTION LSCONVREC_ADVPPROPVARrecord(rec: LSDOMAINT_ADVPPROPVARrecord): LDCONVREC_pAttrStruct;
VAR result : LDCONVREC_pAttrStruct;
    req : LSDOMAINT_polaritytype; 
    env : LSDOMAINT_polaritytype; 
    aktionsarts : LSDOMAINT_aktionsarttype; 
    actsubcefs : LSDOMAINT_advsubctype; 
    advpatternefs : LSDOMAINT_synpatterntype; 
BEGIN
   result := NIL;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'INDEX';
      fieldname.len := 5;
      typecode := 0;
      typeindicator := Int;
      STR_IntegerToStr(rec.INDEX,  fieldvalue.str, fieldvalue.len);
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'req';
      fieldname.len := 3;
      typecode := 112;
   END;
   result^.typeindicator := EnumSet;
   FOR req:=pospol TO omegapol DO BEGIN
      IF req IN rec.req THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_polaritytype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,req);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'env';
      fieldname.len := 3;
      typecode := 112;
   END;
   result^.typeindicator := EnumSet;
   FOR env:=pospol TO omegapol DO BEGIN
      IF env IN rec.env THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_polaritytype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,env);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'class';
      fieldname.len := 5;
      typecode := 80;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_timeadvclasstype( result^.fieldvalue.str, result^.fieldvalue.len, rec.class);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'deixis';
      fieldname.len := 6;
      typecode := 46;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_deixistype( result^.fieldvalue.str, result^.fieldvalue.len, rec.deixis);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'aspect';
      fieldname.len := 6;
      typecode := 34;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_aspecttype( result^.fieldvalue.str, result^.fieldvalue.len, rec.aspect);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'retro';
      fieldname.len := 5;
      typecode := 19;
   END;
   result^.typeindicator := Bool;
   IF rec.retro = TRUE THEN BEGIN
      result^.fieldvalue.str := 'TRUE';
      result^.fieldvalue.len := 4;
      END
   ELSE BEGIN
      result^.fieldvalue.str := 'FALSE';
      result^.fieldvalue.len := 5;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'aktionsarts';
      fieldname.len := 11;
      typecode := 95;
   END;
   result^.typeindicator := EnumSet;
   FOR aktionsarts:=stative TO achievement DO BEGIN
      IF aktionsarts IN rec.aktionsarts THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_aktionsarttype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,aktionsarts);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'superdeixis';
      fieldname.len := 11;
      typecode := 46;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_deixistype( result^.fieldvalue.str, result^.fieldvalue.len, rec.superdeixis);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'actsubcefs';
      fieldname.len := 10;
      typecode := 94;
   END;
   result^.typeindicator := EnumSet;
   FOR actsubcefs:=SentAdv TO PrepPAdv DO BEGIN
      IF actsubcefs IN rec.actsubcefs THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_advsubctype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,actsubcefs);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'thetaadv';
      fieldname.len := 8;
      typecode := 76;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_thetaadvtype( result^.fieldvalue.str, result^.fieldvalue.len, rec.thetaadv);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'advpatternefs';
      fieldname.len := 13;
      typecode := 119;
   END;
   result^.typeindicator := EnumSet;
   FOR advpatternefs:=synASIFSENT TO synDONP_OPENINFSENT DO BEGIN
      IF advpatternefs IN rec.advpatternefs THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_synpatterntype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,advpatternefs);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'PROsubject';
      fieldname.len := 10;
      typecode := 18;
   END;
   result^.typeindicator := Bool;
   IF rec.PROsubject = TRUE THEN BEGIN
      result^.fieldvalue.str := 'TRUE';
      result^.fieldvalue.len := 4;
      END
   ELSE BEGIN
      result^.fieldvalue.str := 'FALSE';
      result^.fieldvalue.len := 5;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'mood';
      fieldname.len := 4;
      typecode := 83;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_xpmoodtype( result^.fieldvalue.str, result^.fieldvalue.len, rec.mood);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'thanascompl';
      fieldname.len := 11;
      typecode := 5;
   END;
   result^.typeindicator := Bool;
   IF rec.thanascompl = TRUE THEN BEGIN
      result^.fieldvalue.str := 'TRUE';
      result^.fieldvalue.len := 4;
      END
   ELSE BEGIN
      result^.fieldvalue.str := 'FALSE';
      result^.fieldvalue.len := 5;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'temporal';
      fieldname.len := 8;
      typecode := 23;
   END;
   result^.typeindicator := Bool;
   IF rec.temporal = TRUE THEN BEGIN
      result^.fieldvalue.str := 'TRUE';
      result^.fieldvalue.len := 4;
      END
   ELSE BEGIN
      result^.fieldvalue.str := 'FALSE';
      result^.fieldvalue.len := 5;
   END;
   LSCONVREC_ADVPPROPVARrecord := result;
END {LSCONVREC_ADVPPROPVARrecord};

FUNCTION LSCONVREC_ARTrecord(rec: LSDOMAINT_ARTrecord): LDCONVREC_pAttrStruct;
VAR result : LDCONVREC_pAttrStruct;
    possnumbers : LSDOMAINT_numbertype; 
    posscomas : LSDOMAINT_posscomatype; 
BEGIN
   result := NIL;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'KEY';
      fieldname.len := 3;
      typecode := 0;
      typeindicator := Int;
      STR_IntegerToStr(rec.KEY,  fieldvalue.str, fieldvalue.len);
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'definite';
      fieldname.len := 8;
      typecode := 45;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_deftype( result^.fieldvalue.str, result^.fieldvalue.len, rec.definite);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'possnumbers';
      fieldname.len := 11;
      typecode := 108;
   END;
   result^.typeindicator := EnumSet;
   FOR possnumbers:=singular TO omeganumber DO BEGIN
      IF possnumbers IN rec.possnumbers THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_numbertype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,possnumbers);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'posscomas';
      fieldname.len := 9;
      typecode := 114;
   END;
   result^.typeindicator := EnumSet;
   FOR posscomas:=count TO mass DO BEGIN
      IF posscomas IN rec.posscomas THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_posscomatype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,posscomas);
      END;
   END;
   LSCONVREC_ARTrecord := result;
END {LSCONVREC_ARTrecord};

FUNCTION LSCONVREC_ASPrecord(rec: LSDOMAINT_ASPrecord): LDCONVREC_pAttrStruct;
VAR result : LDCONVREC_pAttrStruct;
    req : LSDOMAINT_polaritytype; 
    env : LSDOMAINT_polaritytype; 
BEGIN
   result := NIL;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'req';
      fieldname.len := 3;
      typecode := 112;
   END;
   result^.typeindicator := EnumSet;
   FOR req:=pospol TO omegapol DO BEGIN
      IF req IN rec.req THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_polaritytype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,req);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'env';
      fieldname.len := 3;
      typecode := 112;
   END;
   result^.typeindicator := EnumSet;
   FOR env:=pospol TO omegapol DO BEGIN
      IF env IN rec.env THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_polaritytype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,env);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'thanas';
      fieldname.len := 6;
      typecode := 73;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_thanascompltype( result^.fieldvalue.str, result^.fieldvalue.len, rec.thanas);
   LSCONVREC_ASPrecord := result;
END {LSCONVREC_ASPrecord};

FUNCTION LSCONVREC_CARDrecord(rec: LSDOMAINT_CARDrecord): LDCONVREC_pAttrStruct;
VAR result : LDCONVREC_pAttrStruct;
    possnumbers : LSDOMAINT_numbertype; 
BEGIN
   result := NIL;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'possnumbers';
      fieldname.len := 11;
      typecode := 108;
   END;
   result^.typeindicator := EnumSet;
   FOR possnumbers:=singular TO omeganumber DO BEGIN
      IF possnumbers IN rec.possnumbers THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_numbertype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,possnumbers);
      END;
   END;
   LSCONVREC_CARDrecord := result;
END {LSCONVREC_CARDrecord};

FUNCTION LSCONVREC_CLAUSErecord(rec: LSDOMAINT_CLAUSErecord): LDCONVREC_pAttrStruct;
VAR result : LDCONVREC_pAttrStruct;
    req : LSDOMAINT_polaritytype; 
    env : LSDOMAINT_polaritytype; 
    synvpefs : LSDOMAINT_synpatterntype; 
    aktionsarts : LSDOMAINT_aktionsarttype; 
    adjuncts : LSDOMAINT_adjuncttype; 
BEGIN
   result := NIL;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'req';
      fieldname.len := 3;
      typecode := 112;
   END;
   result^.typeindicator := EnumSet;
   FOR req:=pospol TO omegapol DO BEGIN
      IF req IN rec.req THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_polaritytype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,req);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'env';
      fieldname.len := 3;
      typecode := 112;
   END;
   result^.typeindicator := EnumSet;
   FOR env:=pospol TO omegapol DO BEGIN
      IF env IN rec.env THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_polaritytype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,env);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'voice';
      fieldname.len := 5;
      typecode := 82;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_voicetype( result^.fieldvalue.str, result^.fieldvalue.len, rec.voice);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'PROsubject';
      fieldname.len := 10;
      typecode := 18;
   END;
   result^.typeindicator := Bool;
   IF rec.PROsubject = TRUE THEN BEGIN
      result^.fieldvalue.str := 'TRUE';
      result^.fieldvalue.len := 4;
      END
   ELSE BEGIN
      result^.fieldvalue.str := 'FALSE';
      result^.fieldvalue.len := 5;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'synvpefs';
      fieldname.len := 8;
      typecode := 119;
   END;
   result^.typeindicator := EnumSet;
   FOR synvpefs:=synASIFSENT TO synDONP_OPENINFSENT DO BEGIN
      IF synvpefs IN rec.synvpefs THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_synpatterntype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,synvpefs);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'thetavp';
      fieldname.len := 7;
      typecode := 79;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_thetavptype( result^.fieldvalue.str, result^.fieldvalue.len, rec.thetavp);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'modus';
      fieldname.len := 5;
      typecode := 55;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_modustype( result^.fieldvalue.str, result^.fieldvalue.len, rec.modus);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'aktionsarts';
      fieldname.len := 11;
      typecode := 95;
   END;
   result^.typeindicator := EnumSet;
   FOR aktionsarts:=stative TO achievement DO BEGIN
      IF aktionsarts IN rec.aktionsarts THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_aktionsarttype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,aktionsarts);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'aspect';
      fieldname.len := 6;
      typecode := 34;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_aspecttype( result^.fieldvalue.str, result^.fieldvalue.len, rec.aspect);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'deixis';
      fieldname.len := 6;
      typecode := 46;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_deixistype( result^.fieldvalue.str, result^.fieldvalue.len, rec.deixis);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'retro';
      fieldname.len := 5;
      typecode := 19;
   END;
   result^.typeindicator := Bool;
   IF rec.retro = TRUE THEN BEGIN
      result^.fieldvalue.str := 'TRUE';
      result^.fieldvalue.len := 4;
      END
   ELSE BEGIN
      result^.fieldvalue.str := 'FALSE';
      result^.fieldvalue.len := 5;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'finiteness';
      fieldname.len := 10;
      typecode := 48;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_finitenesstype( result^.fieldvalue.str, result^.fieldvalue.len, rec.finiteness);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'infsort';
      fieldname.len := 7;
      typecode := 53;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_inftype( result^.fieldvalue.str, result^.fieldvalue.len, rec.infsort);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'superdeixis';
      fieldname.len := 11;
      typecode := 46;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_deixistype( result^.fieldvalue.str, result^.fieldvalue.len, rec.superdeixis);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'adjuncts';
      fieldname.len := 8;
      typecode := 90;
   END;
   result^.typeindicator := EnumSet;
   FOR adjuncts:=ResAP TO ResNP DO BEGIN
      IF adjuncts IN rec.adjuncts THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_adjuncttype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,adjuncts);
      END;
   END;
   LSCONVREC_CLAUSErecord := result;
END {LSCONVREC_CLAUSErecord};

FUNCTION LSCONVREC_CLAUSEVARrecord(rec: LSDOMAINT_CLAUSEVARrecord): LDCONVREC_pAttrStruct;
VAR result : LDCONVREC_pAttrStruct;
    req : LSDOMAINT_polaritytype; 
    env : LSDOMAINT_polaritytype; 
    synvpefs : LSDOMAINT_synpatterntype; 
    aktionsarts : LSDOMAINT_aktionsarttype; 
    adjuncts : LSDOMAINT_adjuncttype; 
BEGIN
   result := NIL;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'INDEX';
      fieldname.len := 5;
      typecode := 0;
      typeindicator := Int;
      STR_IntegerToStr(rec.INDEX,  fieldvalue.str, fieldvalue.len);
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'req';
      fieldname.len := 3;
      typecode := 112;
   END;
   result^.typeindicator := EnumSet;
   FOR req:=pospol TO omegapol DO BEGIN
      IF req IN rec.req THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_polaritytype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,req);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'env';
      fieldname.len := 3;
      typecode := 112;
   END;
   result^.typeindicator := EnumSet;
   FOR env:=pospol TO omegapol DO BEGIN
      IF env IN rec.env THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_polaritytype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,env);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'voice';
      fieldname.len := 5;
      typecode := 82;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_voicetype( result^.fieldvalue.str, result^.fieldvalue.len, rec.voice);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'PROsubject';
      fieldname.len := 10;
      typecode := 18;
   END;
   result^.typeindicator := Bool;
   IF rec.PROsubject = TRUE THEN BEGIN
      result^.fieldvalue.str := 'TRUE';
      result^.fieldvalue.len := 4;
      END
   ELSE BEGIN
      result^.fieldvalue.str := 'FALSE';
      result^.fieldvalue.len := 5;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'synvpefs';
      fieldname.len := 8;
      typecode := 119;
   END;
   result^.typeindicator := EnumSet;
   FOR synvpefs:=synASIFSENT TO synDONP_OPENINFSENT DO BEGIN
      IF synvpefs IN rec.synvpefs THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_synpatterntype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,synvpefs);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'thetavp';
      fieldname.len := 7;
      typecode := 79;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_thetavptype( result^.fieldvalue.str, result^.fieldvalue.len, rec.thetavp);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'modus';
      fieldname.len := 5;
      typecode := 55;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_modustype( result^.fieldvalue.str, result^.fieldvalue.len, rec.modus);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'aktionsarts';
      fieldname.len := 11;
      typecode := 95;
   END;
   result^.typeindicator := EnumSet;
   FOR aktionsarts:=stative TO achievement DO BEGIN
      IF aktionsarts IN rec.aktionsarts THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_aktionsarttype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,aktionsarts);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'aspect';
      fieldname.len := 6;
      typecode := 34;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_aspecttype( result^.fieldvalue.str, result^.fieldvalue.len, rec.aspect);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'deixis';
      fieldname.len := 6;
      typecode := 46;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_deixistype( result^.fieldvalue.str, result^.fieldvalue.len, rec.deixis);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'retro';
      fieldname.len := 5;
      typecode := 19;
   END;
   result^.typeindicator := Bool;
   IF rec.retro = TRUE THEN BEGIN
      result^.fieldvalue.str := 'TRUE';
      result^.fieldvalue.len := 4;
      END
   ELSE BEGIN
      result^.fieldvalue.str := 'FALSE';
      result^.fieldvalue.len := 5;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'finiteness';
      fieldname.len := 10;
      typecode := 48;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_finitenesstype( result^.fieldvalue.str, result^.fieldvalue.len, rec.finiteness);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'infsort';
      fieldname.len := 7;
      typecode := 53;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_inftype( result^.fieldvalue.str, result^.fieldvalue.len, rec.infsort);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'superdeixis';
      fieldname.len := 11;
      typecode := 46;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_deixistype( result^.fieldvalue.str, result^.fieldvalue.len, rec.superdeixis);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'adjuncts';
      fieldname.len := 8;
      typecode := 90;
   END;
   result^.typeindicator := EnumSet;
   FOR adjuncts:=ResAP TO ResNP DO BEGIN
      IF adjuncts IN rec.adjuncts THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_adjuncttype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,adjuncts);
      END;
   END;
   LSCONVREC_CLAUSEVARrecord := result;
END {LSCONVREC_CLAUSEVARrecord};

FUNCTION LSCONVREC_CONJrecord(rec: LSDOMAINT_CONJrecord): LDCONVREC_pAttrStruct;
VAR result : LDCONVREC_pAttrStruct;
    req : LSDOMAINT_polaritytype; 
    env : LSDOMAINT_polaritytype; 
    conjpatterns : LSDOMAINT_synpatterntype; 
    distri : LSDOMAINT_distritype; 
BEGIN
   result := NIL;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'KEY';
      fieldname.len := 3;
      typecode := 0;
      typeindicator := Int;
      STR_IntegerToStr(rec.KEY,  fieldvalue.str, fieldvalue.len);
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'req';
      fieldname.len := 3;
      typecode := 112;
   END;
   result^.typeindicator := EnumSet;
   FOR req:=pospol TO omegapol DO BEGIN
      IF req IN rec.req THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_polaritytype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,req);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'env';
      fieldname.len := 3;
      typecode := 112;
   END;
   result^.typeindicator := EnumSet;
   FOR env:=pospol TO omegapol DO BEGIN
      IF env IN rec.env THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_polaritytype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,env);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'class';
      fieldname.len := 5;
      typecode := 80;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_timeadvclasstype( result^.fieldvalue.str, result^.fieldvalue.len, rec.class);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'deixis';
      fieldname.len := 6;
      typecode := 46;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_deixistype( result^.fieldvalue.str, result^.fieldvalue.len, rec.deixis);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'aspect';
      fieldname.len := 6;
      typecode := 34;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_aspecttype( result^.fieldvalue.str, result^.fieldvalue.len, rec.aspect);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'retro';
      fieldname.len := 5;
      typecode := 19;
   END;
   result^.typeindicator := Bool;
   IF rec.retro = TRUE THEN BEGIN
      result^.fieldvalue.str := 'TRUE';
      result^.fieldvalue.len := 4;
      END
   ELSE BEGIN
      result^.fieldvalue.str := 'FALSE';
      result^.fieldvalue.len := 5;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'conjpatterns';
      fieldname.len := 12;
      typecode := 118;
   END;
   result^.typeindicator := EnumSet;
   FOR conjpatterns:=synASIFSENT TO synDONP_OPENINFSENT DO BEGIN
      IF conjpatterns IN rec.conjpatterns THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_synpatterntype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,conjpatterns);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'adverbial';
      fieldname.len := 9;
      typecode := 3;
   END;
   result^.typeindicator := Bool;
   IF rec.adverbial = TRUE THEN BEGIN
      result^.fieldvalue.str := 'TRUE';
      result^.fieldvalue.len := 4;
      END
   ELSE BEGIN
      result^.fieldvalue.str := 'FALSE';
      result^.fieldvalue.len := 5;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'temporal';
      fieldname.len := 8;
      typecode := 23;
   END;
   result^.typeindicator := Bool;
   IF rec.temporal = TRUE THEN BEGIN
      result^.fieldvalue.str := 'TRUE';
      result^.fieldvalue.len := 4;
      END
   ELSE BEGIN
      result^.fieldvalue.str := 'FALSE';
      result^.fieldvalue.len := 5;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'distri';
      fieldname.len := 6;
      typecode := 103;
   END;
   result^.typeindicator := EnumSet;
   FOR distri:=initial TO final DO BEGIN
      IF distri IN rec.distri THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_distritype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,distri);
      END;
   END;
   LSCONVREC_CONJrecord := result;
END {LSCONVREC_CONJrecord};

FUNCTION LSCONVREC_COORDrecord(rec: LSDOMAINT_COORDrecord): LDCONVREC_pAttrStruct;
VAR result : LDCONVREC_pAttrStruct;
    kinds : LSDOMAINT_coordkindtype; 
    patterns : LSDOMAINT_coordpatterntype; 
    inducednumbers : LSDOMAINT_numbertype; 
    req : LSDOMAINT_polaritytype; 
    env : LSDOMAINT_polaritytype; 
BEGIN
   result := NIL;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'KEY';
      fieldname.len := 3;
      typecode := 0;
      typeindicator := Int;
      STR_IntegerToStr(rec.KEY,  fieldvalue.str, fieldvalue.len);
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'kinds';
      fieldname.len := 5;
      typecode := 101;
   END;
   result^.typeindicator := EnumSet;
   FOR kinds:=simple TO correlative2 DO BEGIN
      IF kinds IN rec.kinds THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_coordkindtype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,kinds);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'iteration';
      fieldname.len := 9;
      typecode := 9;
   END;
   result^.typeindicator := Bool;
   IF rec.iteration = TRUE THEN BEGIN
      result^.fieldvalue.str := 'TRUE';
      result^.fieldvalue.len := 4;
      END
   ELSE BEGIN
      result^.fieldvalue.str := 'FALSE';
      result^.fieldvalue.len := 5;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'correlative2key';
      fieldname.len := 15;
      typecode := 2;
   END;
   result^.typeindicator := Int;
   STR_IntegerToStr( rec.correlative2key, result^.fieldvalue.str, result^.fieldvalue.len);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'patterns';
      fieldname.len := 8;
      typecode := 102;
   END;
   result^.typeindicator := EnumSet;
   FOR patterns:=npc TO Slets DO BEGIN
      IF patterns IN rec.patterns THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_coordpatterntype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,patterns);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'inducednumbers';
      fieldname.len := 14;
      typecode := 108;
   END;
   result^.typeindicator := EnumSet;
   FOR inducednumbers:=singular TO omeganumber DO BEGIN
      IF inducednumbers IN rec.inducednumbers THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_numbertype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,inducednumbers);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'Sintroducer';
      fieldname.len := 11;
      typecode := 20;
   END;
   result^.typeindicator := Bool;
   IF rec.Sintroducer = TRUE THEN BEGIN
      result^.fieldvalue.str := 'TRUE';
      result^.fieldvalue.len := 4;
      END
   ELSE BEGIN
      result^.fieldvalue.str := 'FALSE';
      result^.fieldvalue.len := 5;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'req';
      fieldname.len := 3;
      typecode := 112;
   END;
   result^.typeindicator := EnumSet;
   FOR req:=pospol TO omegapol DO BEGIN
      IF req IN rec.req THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_polaritytype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,req);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'env';
      fieldname.len := 3;
      typecode := 112;
   END;
   result^.typeindicator := EnumSet;
   FOR env:=pospol TO omegapol DO BEGIN
      IF env IN rec.env THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_polaritytype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,env);
      END;
   END;
   LSCONVREC_COORDrecord := result;
END {LSCONVREC_COORDrecord};

FUNCTION LSCONVREC_DEMADJrecord(rec: LSDOMAINT_DEMADJrecord): LDCONVREC_pAttrStruct;
VAR result : LDCONVREC_pAttrStruct;
BEGIN
   result := NIL;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'KEY';
      fieldname.len := 3;
      typecode := 0;
      typeindicator := Int;
      STR_IntegerToStr(rec.KEY,  fieldvalue.str, fieldvalue.len);
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'number';
      fieldname.len := 6;
      typecode := 59;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_numbertype( result^.fieldvalue.str, result^.fieldvalue.len, rec.number);
   LSCONVREC_DEMADJrecord := result;
END {LSCONVREC_DEMADJrecord};

FUNCTION LSCONVREC_DEMPROrecord(rec: LSDOMAINT_DEMPROrecord): LDCONVREC_pAttrStruct;
VAR result : LDCONVREC_pAttrStruct;
BEGIN
   result := NIL;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'KEY';
      fieldname.len := 3;
      typecode := 0;
      typeindicator := Int;
      STR_IntegerToStr(rec.KEY,  fieldvalue.str, fieldvalue.len);
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'number';
      fieldname.len := 6;
      typecode := 59;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_numbertype( result^.fieldvalue.str, result^.fieldvalue.len, rec.number);
   LSCONVREC_DEMPROrecord := result;
END {LSCONVREC_DEMPROrecord};

FUNCTION LSCONVREC_BDETrecord(rec: LSDOMAINT_BDETrecord): LDCONVREC_pAttrStruct;
VAR result : LDCONVREC_pAttrStruct;
    req : LSDOMAINT_polaritytype; 
    env : LSDOMAINT_polaritytype; 
    possnumbers : LSDOMAINT_numbertype; 
    posscomas : LSDOMAINT_posscomatype; 
BEGIN
   result := NIL;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'KEY';
      fieldname.len := 3;
      typecode := 0;
      typeindicator := Int;
      STR_IntegerToStr(rec.KEY,  fieldvalue.str, fieldvalue.len);
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'req';
      fieldname.len := 3;
      typecode := 112;
   END;
   result^.typeindicator := EnumSet;
   FOR req:=pospol TO omegapol DO BEGIN
      IF req IN rec.req THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_polaritytype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,req);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'env';
      fieldname.len := 3;
      typecode := 112;
   END;
   result^.typeindicator := EnumSet;
   FOR env:=pospol TO omegapol DO BEGIN
      IF env IN rec.env THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_polaritytype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,env);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'definite';
      fieldname.len := 8;
      typecode := 45;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_deftype( result^.fieldvalue.str, result^.fieldvalue.len, rec.definite);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'posspred';
      fieldname.len := 8;
      typecode := 15;
   END;
   result^.typeindicator := Bool;
   IF rec.posspred = TRUE THEN BEGIN
      result^.fieldvalue.str := 'TRUE';
      result^.fieldvalue.len := 4;
      END
   ELSE BEGIN
      result^.fieldvalue.str := 'FALSE';
      result^.fieldvalue.len := 5;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'possnumbers';
      fieldname.len := 11;
      typecode := 108;
   END;
   result^.typeindicator := EnumSet;
   FOR possnumbers:=singular TO omeganumber DO BEGIN
      IF possnumbers IN rec.possnumbers THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_numbertype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,possnumbers);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'posscomas';
      fieldname.len := 9;
      typecode := 114;
   END;
   result^.typeindicator := EnumSet;
   FOR posscomas:=count TO mass DO BEGIN
      IF posscomas IN rec.posscomas THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_posscomatype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,posscomas);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'mood';
      fieldname.len := 4;
      typecode := 83;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_xpmoodtype( result^.fieldvalue.str, result^.fieldvalue.len, rec.mood);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'possnietnp';
      fieldname.len := 10;
      typecode := 14;
   END;
   result^.typeindicator := Bool;
   IF rec.possnietnp = TRUE THEN BEGIN
      result^.fieldvalue.str := 'TRUE';
      result^.fieldvalue.len := 4;
      END
   ELSE BEGIN
      result^.fieldvalue.str := 'FALSE';
      result^.fieldvalue.len := 5;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'syntquant';
      fieldname.len := 9;
      typecode := 71;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_syntquanttype( result^.fieldvalue.str, result^.fieldvalue.len, rec.syntquant);
   LSCONVREC_BDETrecord := result;
END {LSCONVREC_BDETrecord};

FUNCTION LSCONVREC_DETrecord(rec: LSDOMAINT_DETrecord): LDCONVREC_pAttrStruct;
VAR result : LDCONVREC_pAttrStruct;
    req : LSDOMAINT_polaritytype; 
    env : LSDOMAINT_polaritytype; 
    possnumbers : LSDOMAINT_numbertype; 
    posscomas : LSDOMAINT_posscomatype; 
BEGIN
   result := NIL;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'req';
      fieldname.len := 3;
      typecode := 112;
   END;
   result^.typeindicator := EnumSet;
   FOR req:=pospol TO omegapol DO BEGIN
      IF req IN rec.req THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_polaritytype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,req);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'env';
      fieldname.len := 3;
      typecode := 112;
   END;
   result^.typeindicator := EnumSet;
   FOR env:=pospol TO omegapol DO BEGIN
      IF env IN rec.env THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_polaritytype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,env);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'definite';
      fieldname.len := 8;
      typecode := 45;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_deftype( result^.fieldvalue.str, result^.fieldvalue.len, rec.definite);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'posspred';
      fieldname.len := 8;
      typecode := 15;
   END;
   result^.typeindicator := Bool;
   IF rec.posspred = TRUE THEN BEGIN
      result^.fieldvalue.str := 'TRUE';
      result^.fieldvalue.len := 4;
      END
   ELSE BEGIN
      result^.fieldvalue.str := 'FALSE';
      result^.fieldvalue.len := 5;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'possnumbers';
      fieldname.len := 11;
      typecode := 108;
   END;
   result^.typeindicator := EnumSet;
   FOR possnumbers:=singular TO omeganumber DO BEGIN
      IF possnumbers IN rec.possnumbers THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_numbertype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,possnumbers);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'posscomas';
      fieldname.len := 9;
      typecode := 114;
   END;
   result^.typeindicator := EnumSet;
   FOR posscomas:=count TO mass DO BEGIN
      IF posscomas IN rec.posscomas THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_posscomatype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,posscomas);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'mood';
      fieldname.len := 4;
      typecode := 83;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_xpmoodtype( result^.fieldvalue.str, result^.fieldvalue.len, rec.mood);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'possnietnp';
      fieldname.len := 10;
      typecode := 14;
   END;
   result^.typeindicator := Bool;
   IF rec.possnietnp = TRUE THEN BEGIN
      result^.fieldvalue.str := 'TRUE';
      result^.fieldvalue.len := 4;
      END
   ELSE BEGIN
      result^.fieldvalue.str := 'FALSE';
      result^.fieldvalue.len := 5;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'syntquant';
      fieldname.len := 9;
      typecode := 71;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_syntquanttype( result^.fieldvalue.str, result^.fieldvalue.len, rec.syntquant);
   LSCONVREC_DETrecord := result;
END {LSCONVREC_DETrecord};

FUNCTION LSCONVREC_DETPrecord(rec: LSDOMAINT_DETPrecord): LDCONVREC_pAttrStruct;
VAR result : LDCONVREC_pAttrStruct;
    req : LSDOMAINT_polaritytype; 
    env : LSDOMAINT_polaritytype; 
    possnumbers : LSDOMAINT_numbertype; 
    posscomas : LSDOMAINT_posscomatype; 
BEGIN
   result := NIL;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'req';
      fieldname.len := 3;
      typecode := 112;
   END;
   result^.typeindicator := EnumSet;
   FOR req:=pospol TO omegapol DO BEGIN
      IF req IN rec.req THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_polaritytype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,req);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'env';
      fieldname.len := 3;
      typecode := 112;
   END;
   result^.typeindicator := EnumSet;
   FOR env:=pospol TO omegapol DO BEGIN
      IF env IN rec.env THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_polaritytype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,env);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'definite';
      fieldname.len := 8;
      typecode := 45;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_deftype( result^.fieldvalue.str, result^.fieldvalue.len, rec.definite);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'posspred';
      fieldname.len := 8;
      typecode := 15;
   END;
   result^.typeindicator := Bool;
   IF rec.posspred = TRUE THEN BEGIN
      result^.fieldvalue.str := 'TRUE';
      result^.fieldvalue.len := 4;
      END
   ELSE BEGIN
      result^.fieldvalue.str := 'FALSE';
      result^.fieldvalue.len := 5;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'possnumbers';
      fieldname.len := 11;
      typecode := 108;
   END;
   result^.typeindicator := EnumSet;
   FOR possnumbers:=singular TO omeganumber DO BEGIN
      IF possnumbers IN rec.possnumbers THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_numbertype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,possnumbers);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'posscomas';
      fieldname.len := 9;
      typecode := 114;
   END;
   result^.typeindicator := EnumSet;
   FOR posscomas:=count TO mass DO BEGIN
      IF posscomas IN rec.posscomas THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_posscomatype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,posscomas);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'mood';
      fieldname.len := 4;
      typecode := 83;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_xpmoodtype( result^.fieldvalue.str, result^.fieldvalue.len, rec.mood);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'possnietnp';
      fieldname.len := 10;
      typecode := 14;
   END;
   result^.typeindicator := Bool;
   IF rec.possnietnp = TRUE THEN BEGIN
      result^.fieldvalue.str := 'TRUE';
      result^.fieldvalue.len := 4;
      END
   ELSE BEGIN
      result^.fieldvalue.str := 'FALSE';
      result^.fieldvalue.len := 5;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'syntquant';
      fieldname.len := 9;
      typecode := 71;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_syntquanttype( result^.fieldvalue.str, result^.fieldvalue.len, rec.syntquant);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'superdeixis';
      fieldname.len := 11;
      typecode := 46;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_deixistype( result^.fieldvalue.str, result^.fieldvalue.len, rec.superdeixis);
   LSCONVREC_DETPrecord := result;
END {LSCONVREC_DETPrecord};

FUNCTION LSCONVREC_DIGITrecord(rec: LSDOMAINT_DIGITrecord): LDCONVREC_pAttrStruct;
VAR result : LDCONVREC_pAttrStruct;
BEGIN
   result := NIL;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'KEY';
      fieldname.len := 3;
      typecode := 0;
      typeindicator := Int;
      STR_IntegerToStr(rec.KEY,  fieldvalue.str, fieldvalue.len);
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'valeu';
      fieldname.len := 5;
      typecode := 87;
   END;
   result^.typeindicator := SubRange;
   LSTYPETOSTR_valuetype( result^.fieldvalue.str, result^.fieldvalue.len, rec.valeu);
   LSCONVREC_DIGITrecord := result;
END {LSCONVREC_DIGITrecord};

FUNCTION LSCONVREC_EMPTYrecord(rec: LSDOMAINT_EMPTYrecord): LDCONVREC_pAttrStruct;
VAR result : LDCONVREC_pAttrStruct;
BEGIN
   result := NIL;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'KEY';
      fieldname.len := 3;
      typecode := 0;
      typeindicator := Int;
      STR_IntegerToStr(rec.KEY,  fieldvalue.str, fieldvalue.len);
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'person';
      fieldname.len := 6;
      typecode := 85;
   END;
   result^.typeindicator := SubRange;
   LSTYPETOSTR_persontype( result^.fieldvalue.str, result^.fieldvalue.len, rec.person);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'number';
      fieldname.len := 6;
      typecode := 59;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_numbertype( result^.fieldvalue.str, result^.fieldvalue.len, rec.number);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'gender';
      fieldname.len := 6;
      typecode := 49;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_gendertype( result^.fieldvalue.str, result^.fieldvalue.len, rec.gender);
   LSCONVREC_EMPTYrecord := result;
END {LSCONVREC_EMPTYrecord};

FUNCTION LSCONVREC_EMPTYVARrecord(rec: LSDOMAINT_EMPTYVARrecord): LDCONVREC_pAttrStruct;
VAR result : LDCONVREC_pAttrStruct;
BEGIN
   result := NIL;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'INDEX';
      fieldname.len := 5;
      typecode := 0;
      typeindicator := Int;
      STR_IntegerToStr(rec.INDEX,  fieldvalue.str, fieldvalue.len);
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'person';
      fieldname.len := 6;
      typecode := 85;
   END;
   result^.typeindicator := SubRange;
   LSTYPETOSTR_persontype( result^.fieldvalue.str, result^.fieldvalue.len, rec.person);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'number';
      fieldname.len := 6;
      typecode := 59;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_numbertype( result^.fieldvalue.str, result^.fieldvalue.len, rec.number);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'gender';
      fieldname.len := 6;
      typecode := 49;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_gendertype( result^.fieldvalue.str, result^.fieldvalue.len, rec.gender);
   LSCONVREC_EMPTYVARrecord := result;
END {LSCONVREC_EMPTYVARrecord};

FUNCTION LSCONVREC_ENrecord(rec: LSDOMAINT_ENrecord): LDCONVREC_pAttrStruct;
VAR result : LDCONVREC_pAttrStruct;
BEGIN
   result := NIL;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'KEY';
      fieldname.len := 3;
      typecode := 0;
      typeindicator := Int;
      STR_IntegerToStr(rec.KEY,  fieldvalue.str, fieldvalue.len);
   END;
   LSCONVREC_ENrecord := result;
END {LSCONVREC_ENrecord};

FUNCTION LSCONVREC_EXCLAMrecord(rec: LSDOMAINT_EXCLAMrecord): LDCONVREC_pAttrStruct;
VAR result : LDCONVREC_pAttrStruct;
BEGIN
   result := NIL;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'KEY';
      fieldname.len := 3;
      typecode := 0;
      typeindicator := Int;
      STR_IntegerToStr(rec.KEY,  fieldvalue.str, fieldvalue.len);
   END;
   LSCONVREC_EXCLAMrecord := result;
END {LSCONVREC_EXCLAMrecord};

FUNCTION LSCONVREC_GENrecord(rec: LSDOMAINT_GENrecord): LDCONVREC_pAttrStruct;
VAR result : LDCONVREC_pAttrStruct;
BEGIN
   result := NIL;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'KEY';
      fieldname.len := 3;
      typecode := 0;
      typeindicator := Int;
      STR_IntegerToStr(rec.KEY,  fieldvalue.str, fieldvalue.len);
   END;
   LSCONVREC_GENrecord := result;
END {LSCONVREC_GENrecord};

FUNCTION LSCONVREC_INDEFPROrecord(rec: LSDOMAINT_INDEFPROrecord): LDCONVREC_pAttrStruct;
VAR result : LDCONVREC_pAttrStruct;
    req : LSDOMAINT_polaritytype; 
    env : LSDOMAINT_polaritytype; 
BEGIN
   result := NIL;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'KEY';
      fieldname.len := 3;
      typecode := 0;
      typeindicator := Int;
      STR_IntegerToStr(rec.KEY,  fieldvalue.str, fieldvalue.len);
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'req';
      fieldname.len := 3;
      typecode := 112;
   END;
   result^.typeindicator := EnumSet;
   FOR req:=pospol TO omegapol DO BEGIN
      IF req IN rec.req THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_polaritytype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,req);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'env';
      fieldname.len := 3;
      typecode := 112;
   END;
   result^.typeindicator := EnumSet;
   FOR env:=pospol TO omegapol DO BEGIN
      IF env IN rec.env THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_polaritytype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,env);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'definite';
      fieldname.len := 8;
      typecode := 45;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_deftype( result^.fieldvalue.str, result^.fieldvalue.len, rec.definite);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'number';
      fieldname.len := 6;
      typecode := 59;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_numbertype( result^.fieldvalue.str, result^.fieldvalue.len, rec.number);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'poss';
      fieldname.len := 4;
      typecode := 16;
   END;
   result^.typeindicator := Bool;
   IF rec.poss = TRUE THEN BEGIN
      result^.fieldvalue.str := 'TRUE';
      result^.fieldvalue.len := 4;
      END
   ELSE BEGIN
      result^.fieldvalue.str := 'FALSE';
      result^.fieldvalue.len := 5;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'possnietNP';
      fieldname.len := 10;
      typecode := 14;
   END;
   result^.typeindicator := Bool;
   IF rec.possnietNP = TRUE THEN BEGIN
      result^.fieldvalue.str := 'TRUE';
      result^.fieldvalue.len := 4;
      END
   ELSE BEGIN
      result^.fieldvalue.str := 'FALSE';
      result^.fieldvalue.len := 5;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'syntquant';
      fieldname.len := 9;
      typecode := 71;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_syntquanttype( result^.fieldvalue.str, result^.fieldvalue.len, rec.syntquant);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'animate';
      fieldname.len := 7;
      typecode := 32;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_animatetype( result^.fieldvalue.str, result^.fieldvalue.len, rec.animate);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'NPhead';
      fieldname.len := 6;
      typecode := 58;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_npheadtype( result^.fieldvalue.str, result^.fieldvalue.len, rec.NPhead);
   LSCONVREC_INDEFPROrecord := result;
END {LSCONVREC_INDEFPROrecord};

FUNCTION LSCONVREC_BIRRPREFrecord(rec: LSDOMAINT_BIRRPREFrecord): LDCONVREC_pAttrStruct;
VAR result : LDCONVREC_pAttrStruct;
    heads : LSDOMAINT_headtype; 
BEGIN
   result := NIL;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'KEY';
      fieldname.len := 3;
      typecode := 0;
      typeindicator := Int;
      STR_IntegerToStr(rec.KEY,  fieldvalue.str, fieldvalue.len);
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'heads';
      fieldname.len := 5;
      typecode := 105;
   END;
   result^.typeindicator := EnumSet;
   FOR heads:=nounhead TO propernounhead DO BEGIN
      IF heads IN rec.heads THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_headtype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,heads);
      END;
   END;
   LSCONVREC_BIRRPREFrecord := result;
END {LSCONVREC_BIRRPREFrecord};

FUNCTION LSCONVREC_NEGrecord(rec: LSDOMAINT_NEGrecord): LDCONVREC_pAttrStruct;
VAR result : LDCONVREC_pAttrStruct;
BEGIN
   result := NIL;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'KEY';
      fieldname.len := 3;
      typecode := 0;
      typeindicator := Int;
      STR_IntegerToStr(rec.KEY,  fieldvalue.str, fieldvalue.len);
   END;
   LSCONVREC_NEGrecord := result;
END {LSCONVREC_NEGrecord};

FUNCTION LSCONVREC_NEGVARrecord(rec: LSDOMAINT_NEGVARrecord): LDCONVREC_pAttrStruct;
VAR result : LDCONVREC_pAttrStruct;
BEGIN
   result := NIL;
   LSCONVREC_NEGVARrecord := result;
END {LSCONVREC_NEGVARrecord};

FUNCTION LSCONVREC_BNOUNrecord(rec: LSDOMAINT_BNOUNrecord): LDCONVREC_pAttrStruct;
VAR result : LDCONVREC_pAttrStruct;
    req : LSDOMAINT_polaritytype; 
    env : LSDOMAINT_polaritytype; 
    plurforms : LSDOMAINT_plurformtype; 
    genders : LSDOMAINT_gendertype; 
    sexes : LSDOMAINT_sextype; 
    subcs : LSDOMAINT_nounsubctype; 
    posscomas : LSDOMAINT_posscomatype; 
    nounpatterns : LSDOMAINT_synpatterntype; 
BEGIN
   result := NIL;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'KEY';
      fieldname.len := 3;
      typecode := 0;
      typeindicator := Int;
      STR_IntegerToStr(rec.KEY,  fieldvalue.str, fieldvalue.len);
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'req';
      fieldname.len := 3;
      typecode := 112;
   END;
   result^.typeindicator := EnumSet;
   FOR req:=pospol TO omegapol DO BEGIN
      IF req IN rec.req THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_polaritytype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,req);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'env';
      fieldname.len := 3;
      typecode := 112;
   END;
   result^.typeindicator := EnumSet;
   FOR env:=pospol TO omegapol DO BEGIN
      IF env IN rec.env THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_polaritytype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,env);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'plurforms';
      fieldname.len := 9;
      typecode := 110;
   END;
   result^.typeindicator := EnumSet;
   FOR plurforms:=onlyplur TO singandplur DO BEGIN
      IF plurforms IN rec.plurforms THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_plurformtype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,plurforms);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'genders';
      fieldname.len := 7;
      typecode := 104;
   END;
   result^.typeindicator := EnumSet;
   FOR genders:=femininegender TO omegagender DO BEGIN
      IF genders IN rec.genders THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_gendertype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,genders);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'class';
      fieldname.len := 5;
      typecode := 80;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_timeadvclasstype( result^.fieldvalue.str, result^.fieldvalue.len, rec.class);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'deixis';
      fieldname.len := 6;
      typecode := 46;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_deixistype( result^.fieldvalue.str, result^.fieldvalue.len, rec.deixis);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'aspect';
      fieldname.len := 6;
      typecode := 34;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_aspecttype( result^.fieldvalue.str, result^.fieldvalue.len, rec.aspect);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'retro';
      fieldname.len := 5;
      typecode := 19;
   END;
   result^.typeindicator := Bool;
   IF rec.retro = TRUE THEN BEGIN
      result^.fieldvalue.str := 'TRUE';
      result^.fieldvalue.len := 4;
      END
   ELSE BEGIN
      result^.fieldvalue.str := 'FALSE';
      result^.fieldvalue.len := 5;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'sexes';
      fieldname.len := 5;
      typecode := 117;
   END;
   result^.typeindicator := EnumSet;
   FOR sexes:=masculine TO feminine DO BEGIN
      IF sexes IN rec.sexes THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_sextype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,sexes);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'subcs';
      fieldname.len := 5;
      typecode := 106;
   END;
   result^.typeindicator := EnumSet;
   FOR subcs:=city TO othername DO BEGIN
      IF subcs IN rec.subcs THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_nounsubctype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,subcs);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'temporal';
      fieldname.len := 8;
      typecode := 23;
   END;
   result^.typeindicator := Bool;
   IF rec.temporal = TRUE THEN BEGIN
      result^.fieldvalue.str := 'TRUE';
      result^.fieldvalue.len := 4;
      END
   ELSE BEGIN
      result^.fieldvalue.str := 'FALSE';
      result^.fieldvalue.len := 5;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'animate';
      fieldname.len := 7;
      typecode := 32;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_animatetype( result^.fieldvalue.str, result^.fieldvalue.len, rec.animate);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'human';
      fieldname.len := 5;
      typecode := 52;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_humantype( result^.fieldvalue.str, result^.fieldvalue.len, rec.human);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'posscomas';
      fieldname.len := 9;
      typecode := 114;
   END;
   result^.typeindicator := EnumSet;
   FOR posscomas:=count TO mass DO BEGIN
      IF posscomas IN rec.posscomas THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_posscomatype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,posscomas);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'thetanp';
      fieldname.len := 7;
      typecode := 77;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_thetanptype( result^.fieldvalue.str, result^.fieldvalue.len, rec.thetanp);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'nounpatterns';
      fieldname.len := 12;
      typecode := 118;
   END;
   result^.typeindicator := EnumSet;
   FOR nounpatterns:=synASIFSENT TO synDONP_OPENINFSENT DO BEGIN
      IF nounpatterns IN rec.nounpatterns THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_synpatterntype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,nounpatterns);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'prepkey';
      fieldname.len := 7;
      typecode := 2;
   END;
   result^.typeindicator := Int;
   STR_IntegerToStr( rec.prepkey, result^.fieldvalue.str, result^.fieldvalue.len);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'personal';
      fieldname.len := 8;
      typecode := 13;
   END;
   result^.typeindicator := Bool;
   IF rec.personal = TRUE THEN BEGIN
      result^.fieldvalue.str := 'TRUE';
      result^.fieldvalue.len := 4;
      END
   ELSE BEGIN
      result^.fieldvalue.str := 'FALSE';
      result^.fieldvalue.len := 5;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'poss';
      fieldname.len := 4;
      typecode := 16;
   END;
   result^.typeindicator := Bool;
   IF rec.poss = TRUE THEN BEGIN
      result^.fieldvalue.str := 'TRUE';
      result^.fieldvalue.len := 4;
      END
   ELSE BEGIN
      result^.fieldvalue.str := 'FALSE';
      result^.fieldvalue.len := 5;
   END;
   LSCONVREC_BNOUNrecord := result;
END {LSCONVREC_BNOUNrecord};

FUNCTION LSCONVREC_SUBNOUNrecord(rec: LSDOMAINT_SUBNOUNrecord): LDCONVREC_pAttrStruct;
VAR result : LDCONVREC_pAttrStruct;
    req : LSDOMAINT_polaritytype; 
    env : LSDOMAINT_polaritytype; 
    plurforms : LSDOMAINT_plurformtype; 
    genders : LSDOMAINT_gendertype; 
    sexes : LSDOMAINT_sextype; 
    subcs : LSDOMAINT_nounsubctype; 
    posscomas : LSDOMAINT_posscomatype; 
    nounpatterns : LSDOMAINT_synpatterntype; 
BEGIN
   result := NIL;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'req';
      fieldname.len := 3;
      typecode := 112;
   END;
   result^.typeindicator := EnumSet;
   FOR req:=pospol TO omegapol DO BEGIN
      IF req IN rec.req THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_polaritytype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,req);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'env';
      fieldname.len := 3;
      typecode := 112;
   END;
   result^.typeindicator := EnumSet;
   FOR env:=pospol TO omegapol DO BEGIN
      IF env IN rec.env THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_polaritytype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,env);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'plurforms';
      fieldname.len := 9;
      typecode := 110;
   END;
   result^.typeindicator := EnumSet;
   FOR plurforms:=onlyplur TO singandplur DO BEGIN
      IF plurforms IN rec.plurforms THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_plurformtype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,plurforms);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'genders';
      fieldname.len := 7;
      typecode := 104;
   END;
   result^.typeindicator := EnumSet;
   FOR genders:=femininegender TO omegagender DO BEGIN
      IF genders IN rec.genders THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_gendertype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,genders);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'affix';
      fieldname.len := 5;
      typecode := 30;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_affixtype( result^.fieldvalue.str, result^.fieldvalue.len, rec.affix);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'class';
      fieldname.len := 5;
      typecode := 80;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_timeadvclasstype( result^.fieldvalue.str, result^.fieldvalue.len, rec.class);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'deixis';
      fieldname.len := 6;
      typecode := 46;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_deixistype( result^.fieldvalue.str, result^.fieldvalue.len, rec.deixis);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'aspect';
      fieldname.len := 6;
      typecode := 34;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_aspecttype( result^.fieldvalue.str, result^.fieldvalue.len, rec.aspect);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'retro';
      fieldname.len := 5;
      typecode := 19;
   END;
   result^.typeindicator := Bool;
   IF rec.retro = TRUE THEN BEGIN
      result^.fieldvalue.str := 'TRUE';
      result^.fieldvalue.len := 4;
      END
   ELSE BEGIN
      result^.fieldvalue.str := 'FALSE';
      result^.fieldvalue.len := 5;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'sexes';
      fieldname.len := 5;
      typecode := 117;
   END;
   result^.typeindicator := EnumSet;
   FOR sexes:=masculine TO feminine DO BEGIN
      IF sexes IN rec.sexes THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_sextype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,sexes);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'subcs';
      fieldname.len := 5;
      typecode := 106;
   END;
   result^.typeindicator := EnumSet;
   FOR subcs:=city TO othername DO BEGIN
      IF subcs IN rec.subcs THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_nounsubctype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,subcs);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'temporal';
      fieldname.len := 8;
      typecode := 23;
   END;
   result^.typeindicator := Bool;
   IF rec.temporal = TRUE THEN BEGIN
      result^.fieldvalue.str := 'TRUE';
      result^.fieldvalue.len := 4;
      END
   ELSE BEGIN
      result^.fieldvalue.str := 'FALSE';
      result^.fieldvalue.len := 5;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'animate';
      fieldname.len := 7;
      typecode := 32;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_animatetype( result^.fieldvalue.str, result^.fieldvalue.len, rec.animate);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'human';
      fieldname.len := 5;
      typecode := 52;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_humantype( result^.fieldvalue.str, result^.fieldvalue.len, rec.human);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'posscomas';
      fieldname.len := 9;
      typecode := 114;
   END;
   result^.typeindicator := EnumSet;
   FOR posscomas:=count TO mass DO BEGIN
      IF posscomas IN rec.posscomas THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_posscomatype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,posscomas);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'thetanp';
      fieldname.len := 7;
      typecode := 77;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_thetanptype( result^.fieldvalue.str, result^.fieldvalue.len, rec.thetanp);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'nounpatterns';
      fieldname.len := 12;
      typecode := 118;
   END;
   result^.typeindicator := EnumSet;
   FOR nounpatterns:=synASIFSENT TO synDONP_OPENINFSENT DO BEGIN
      IF nounpatterns IN rec.nounpatterns THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_synpatterntype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,nounpatterns);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'prepkey';
      fieldname.len := 7;
      typecode := 2;
   END;
   result^.typeindicator := Int;
   STR_IntegerToStr( rec.prepkey, result^.fieldvalue.str, result^.fieldvalue.len);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'personal';
      fieldname.len := 8;
      typecode := 13;
   END;
   result^.typeindicator := Bool;
   IF rec.personal = TRUE THEN BEGIN
      result^.fieldvalue.str := 'TRUE';
      result^.fieldvalue.len := 4;
      END
   ELSE BEGIN
      result^.fieldvalue.str := 'FALSE';
      result^.fieldvalue.len := 5;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'poss';
      fieldname.len := 4;
      typecode := 16;
   END;
   result^.typeindicator := Bool;
   IF rec.poss = TRUE THEN BEGIN
      result^.fieldvalue.str := 'TRUE';
      result^.fieldvalue.len := 4;
      END
   ELSE BEGIN
      result^.fieldvalue.str := 'FALSE';
      result^.fieldvalue.len := 5;
   END;
   LSCONVREC_SUBNOUNrecord := result;
END {LSCONVREC_SUBNOUNrecord};

FUNCTION LSCONVREC_NOUNrecord(rec: LSDOMAINT_NOUNrecord): LDCONVREC_pAttrStruct;
VAR result : LDCONVREC_pAttrStruct;
    req : LSDOMAINT_polaritytype; 
    env : LSDOMAINT_polaritytype; 
    plurforms : LSDOMAINT_plurformtype; 
    genders : LSDOMAINT_gendertype; 
    numbers : LSDOMAINT_numbertype; 
    sexes : LSDOMAINT_sextype; 
    subcs : LSDOMAINT_nounsubctype; 
    posscomas : LSDOMAINT_posscomatype; 
    nounpatterns : LSDOMAINT_synpatterntype; 
BEGIN
   result := NIL;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'req';
      fieldname.len := 3;
      typecode := 112;
   END;
   result^.typeindicator := EnumSet;
   FOR req:=pospol TO omegapol DO BEGIN
      IF req IN rec.req THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_polaritytype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,req);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'env';
      fieldname.len := 3;
      typecode := 112;
   END;
   result^.typeindicator := EnumSet;
   FOR env:=pospol TO omegapol DO BEGIN
      IF env IN rec.env THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_polaritytype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,env);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'plurforms';
      fieldname.len := 9;
      typecode := 110;
   END;
   result^.typeindicator := EnumSet;
   FOR plurforms:=onlyplur TO singandplur DO BEGIN
      IF plurforms IN rec.plurforms THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_plurformtype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,plurforms);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'genders';
      fieldname.len := 7;
      typecode := 104;
   END;
   result^.typeindicator := EnumSet;
   FOR genders:=femininegender TO omegagender DO BEGIN
      IF genders IN rec.genders THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_gendertype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,genders);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'numbers';
      fieldname.len := 7;
      typecode := 108;
   END;
   result^.typeindicator := EnumSet;
   FOR numbers:=singular TO omeganumber DO BEGIN
      IF numbers IN rec.numbers THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_numbertype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,numbers);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'affix';
      fieldname.len := 5;
      typecode := 30;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_affixtype( result^.fieldvalue.str, result^.fieldvalue.len, rec.affix);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'class';
      fieldname.len := 5;
      typecode := 80;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_timeadvclasstype( result^.fieldvalue.str, result^.fieldvalue.len, rec.class);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'deixis';
      fieldname.len := 6;
      typecode := 46;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_deixistype( result^.fieldvalue.str, result^.fieldvalue.len, rec.deixis);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'aspect';
      fieldname.len := 6;
      typecode := 34;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_aspecttype( result^.fieldvalue.str, result^.fieldvalue.len, rec.aspect);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'retro';
      fieldname.len := 5;
      typecode := 19;
   END;
   result^.typeindicator := Bool;
   IF rec.retro = TRUE THEN BEGIN
      result^.fieldvalue.str := 'TRUE';
      result^.fieldvalue.len := 4;
      END
   ELSE BEGIN
      result^.fieldvalue.str := 'FALSE';
      result^.fieldvalue.len := 5;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'sexes';
      fieldname.len := 5;
      typecode := 117;
   END;
   result^.typeindicator := EnumSet;
   FOR sexes:=masculine TO feminine DO BEGIN
      IF sexes IN rec.sexes THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_sextype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,sexes);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'subcs';
      fieldname.len := 5;
      typecode := 106;
   END;
   result^.typeindicator := EnumSet;
   FOR subcs:=city TO othername DO BEGIN
      IF subcs IN rec.subcs THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_nounsubctype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,subcs);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'temporal';
      fieldname.len := 8;
      typecode := 23;
   END;
   result^.typeindicator := Bool;
   IF rec.temporal = TRUE THEN BEGIN
      result^.fieldvalue.str := 'TRUE';
      result^.fieldvalue.len := 4;
      END
   ELSE BEGIN
      result^.fieldvalue.str := 'FALSE';
      result^.fieldvalue.len := 5;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'animate';
      fieldname.len := 7;
      typecode := 32;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_animatetype( result^.fieldvalue.str, result^.fieldvalue.len, rec.animate);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'human';
      fieldname.len := 5;
      typecode := 52;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_humantype( result^.fieldvalue.str, result^.fieldvalue.len, rec.human);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'posscomas';
      fieldname.len := 9;
      typecode := 114;
   END;
   result^.typeindicator := EnumSet;
   FOR posscomas:=count TO mass DO BEGIN
      IF posscomas IN rec.posscomas THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_posscomatype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,posscomas);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'thetanp';
      fieldname.len := 7;
      typecode := 77;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_thetanptype( result^.fieldvalue.str, result^.fieldvalue.len, rec.thetanp);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'nounpatterns';
      fieldname.len := 12;
      typecode := 118;
   END;
   result^.typeindicator := EnumSet;
   FOR nounpatterns:=synASIFSENT TO synDONP_OPENINFSENT DO BEGIN
      IF nounpatterns IN rec.nounpatterns THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_synpatterntype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,nounpatterns);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'prepkey';
      fieldname.len := 7;
      typecode := 2;
   END;
   result^.typeindicator := Int;
   STR_IntegerToStr( rec.prepkey, result^.fieldvalue.str, result^.fieldvalue.len);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'personal';
      fieldname.len := 8;
      typecode := 13;
   END;
   result^.typeindicator := Bool;
   IF rec.personal = TRUE THEN BEGIN
      result^.fieldvalue.str := 'TRUE';
      result^.fieldvalue.len := 4;
      END
   ELSE BEGIN
      result^.fieldvalue.str := 'FALSE';
      result^.fieldvalue.len := 5;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'poss';
      fieldname.len := 4;
      typecode := 16;
   END;
   result^.typeindicator := Bool;
   IF rec.poss = TRUE THEN BEGIN
      result^.fieldvalue.str := 'TRUE';
      result^.fieldvalue.len := 4;
      END
   ELSE BEGIN
      result^.fieldvalue.str := 'FALSE';
      result^.fieldvalue.len := 5;
   END;
   LSCONVREC_NOUNrecord := result;
END {LSCONVREC_NOUNrecord};

FUNCTION LSCONVREC_CNrecord(rec: LSDOMAINT_CNrecord): LDCONVREC_pAttrStruct;
VAR result : LDCONVREC_pAttrStruct;
    req : LSDOMAINT_polaritytype; 
    env : LSDOMAINT_polaritytype; 
    numbers : LSDOMAINT_numbertype; 
    cases : LSDOMAINT_casetype; 
    genders : LSDOMAINT_gendertype; 
    sexes : LSDOMAINT_sextype; 
    actsubcs : LSDOMAINT_nounsubctype; 
    posscomas : LSDOMAINT_posscomatype; 
    nounpatternefs : LSDOMAINT_synpatterntype; 
BEGIN
   result := NIL;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'req';
      fieldname.len := 3;
      typecode := 112;
   END;
   result^.typeindicator := EnumSet;
   FOR req:=pospol TO omegapol DO BEGIN
      IF req IN rec.req THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_polaritytype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,req);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'env';
      fieldname.len := 3;
      typecode := 112;
   END;
   result^.typeindicator := EnumSet;
   FOR env:=pospol TO omegapol DO BEGIN
      IF env IN rec.env THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_polaritytype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,env);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'superdeixis';
      fieldname.len := 11;
      typecode := 46;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_deixistype( result^.fieldvalue.str, result^.fieldvalue.len, rec.superdeixis);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'class';
      fieldname.len := 5;
      typecode := 80;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_timeadvclasstype( result^.fieldvalue.str, result^.fieldvalue.len, rec.class);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'deixis';
      fieldname.len := 6;
      typecode := 46;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_deixistype( result^.fieldvalue.str, result^.fieldvalue.len, rec.deixis);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'aspect';
      fieldname.len := 6;
      typecode := 34;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_aspecttype( result^.fieldvalue.str, result^.fieldvalue.len, rec.aspect);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'retro';
      fieldname.len := 5;
      typecode := 19;
   END;
   result^.typeindicator := Bool;
   IF rec.retro = TRUE THEN BEGIN
      result^.fieldvalue.str := 'TRUE';
      result^.fieldvalue.len := 4;
      END
   ELSE BEGIN
      result^.fieldvalue.str := 'FALSE';
      result^.fieldvalue.len := 5;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'definite';
      fieldname.len := 8;
      typecode := 45;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_deftype( result^.fieldvalue.str, result^.fieldvalue.len, rec.definite);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'numbers';
      fieldname.len := 7;
      typecode := 108;
   END;
   result^.typeindicator := EnumSet;
   FOR numbers:=singular TO omeganumber DO BEGIN
      IF numbers IN rec.numbers THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_numbertype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,numbers);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'cases';
      fieldname.len := 5;
      typecode := 97;
   END;
   result^.typeindicator := EnumSet;
   FOR cases:=nominative TO omegacase DO BEGIN
      IF cases IN rec.cases THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_casetype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,cases);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'genders';
      fieldname.len := 7;
      typecode := 104;
   END;
   result^.typeindicator := EnumSet;
   FOR genders:=femininegender TO omegagender DO BEGIN
      IF genders IN rec.genders THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_gendertype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,genders);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'sexes';
      fieldname.len := 5;
      typecode := 117;
   END;
   result^.typeindicator := EnumSet;
   FOR sexes:=masculine TO feminine DO BEGIN
      IF sexes IN rec.sexes THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_sextype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,sexes);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'actsubcs';
      fieldname.len := 8;
      typecode := 107;
   END;
   result^.typeindicator := EnumSet;
   FOR actsubcs:=city TO othername DO BEGIN
      IF actsubcs IN rec.actsubcs THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_nounsubctype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,actsubcs);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'temporal';
      fieldname.len := 8;
      typecode := 23;
   END;
   result^.typeindicator := Bool;
   IF rec.temporal = TRUE THEN BEGIN
      result^.fieldvalue.str := 'TRUE';
      result^.fieldvalue.len := 4;
      END
   ELSE BEGIN
      result^.fieldvalue.str := 'FALSE';
      result^.fieldvalue.len := 5;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'animate';
      fieldname.len := 7;
      typecode := 32;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_animatetype( result^.fieldvalue.str, result^.fieldvalue.len, rec.animate);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'human';
      fieldname.len := 5;
      typecode := 52;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_humantype( result^.fieldvalue.str, result^.fieldvalue.len, rec.human);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'posscomas';
      fieldname.len := 9;
      typecode := 114;
   END;
   result^.typeindicator := EnumSet;
   FOR posscomas:=count TO mass DO BEGIN
      IF posscomas IN rec.posscomas THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_posscomatype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,posscomas);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'thetanp';
      fieldname.len := 7;
      typecode := 77;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_thetanptype( result^.fieldvalue.str, result^.fieldvalue.len, rec.thetanp);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'nounpatternefs';
      fieldname.len := 14;
      typecode := 119;
   END;
   result^.typeindicator := EnumSet;
   FOR nounpatternefs:=synASIFSENT TO synDONP_OPENINFSENT DO BEGIN
      IF nounpatternefs IN rec.nounpatternefs THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_synpatterntype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,nounpatternefs);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'poss';
      fieldname.len := 4;
      typecode := 16;
   END;
   result^.typeindicator := Bool;
   IF rec.poss = TRUE THEN BEGIN
      result^.fieldvalue.str := 'TRUE';
      result^.fieldvalue.len := 4;
      END
   ELSE BEGIN
      result^.fieldvalue.str := 'FALSE';
      result^.fieldvalue.len := 5;
   END;
   LSCONVREC_CNrecord := result;
END {LSCONVREC_CNrecord};

FUNCTION LSCONVREC_CNVARrecord(rec: LSDOMAINT_CNVARrecord): LDCONVREC_pAttrStruct;
VAR result : LDCONVREC_pAttrStruct;
    req : LSDOMAINT_polaritytype; 
    env : LSDOMAINT_polaritytype; 
    numbers : LSDOMAINT_numbertype; 
    cases : LSDOMAINT_casetype; 
    genders : LSDOMAINT_gendertype; 
    sexes : LSDOMAINT_sextype; 
    actsubcs : LSDOMAINT_nounsubctype; 
    posscomas : LSDOMAINT_posscomatype; 
    nounpatternefs : LSDOMAINT_synpatterntype; 
BEGIN
   result := NIL;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'INDEX';
      fieldname.len := 5;
      typecode := 0;
      typeindicator := Int;
      STR_IntegerToStr(rec.INDEX,  fieldvalue.str, fieldvalue.len);
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'req';
      fieldname.len := 3;
      typecode := 112;
   END;
   result^.typeindicator := EnumSet;
   FOR req:=pospol TO omegapol DO BEGIN
      IF req IN rec.req THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_polaritytype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,req);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'env';
      fieldname.len := 3;
      typecode := 112;
   END;
   result^.typeindicator := EnumSet;
   FOR env:=pospol TO omegapol DO BEGIN
      IF env IN rec.env THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_polaritytype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,env);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'superdeixis';
      fieldname.len := 11;
      typecode := 46;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_deixistype( result^.fieldvalue.str, result^.fieldvalue.len, rec.superdeixis);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'class';
      fieldname.len := 5;
      typecode := 80;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_timeadvclasstype( result^.fieldvalue.str, result^.fieldvalue.len, rec.class);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'deixis';
      fieldname.len := 6;
      typecode := 46;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_deixistype( result^.fieldvalue.str, result^.fieldvalue.len, rec.deixis);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'aspect';
      fieldname.len := 6;
      typecode := 34;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_aspecttype( result^.fieldvalue.str, result^.fieldvalue.len, rec.aspect);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'retro';
      fieldname.len := 5;
      typecode := 19;
   END;
   result^.typeindicator := Bool;
   IF rec.retro = TRUE THEN BEGIN
      result^.fieldvalue.str := 'TRUE';
      result^.fieldvalue.len := 4;
      END
   ELSE BEGIN
      result^.fieldvalue.str := 'FALSE';
      result^.fieldvalue.len := 5;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'definite';
      fieldname.len := 8;
      typecode := 45;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_deftype( result^.fieldvalue.str, result^.fieldvalue.len, rec.definite);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'numbers';
      fieldname.len := 7;
      typecode := 108;
   END;
   result^.typeindicator := EnumSet;
   FOR numbers:=singular TO omeganumber DO BEGIN
      IF numbers IN rec.numbers THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_numbertype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,numbers);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'cases';
      fieldname.len := 5;
      typecode := 97;
   END;
   result^.typeindicator := EnumSet;
   FOR cases:=nominative TO omegacase DO BEGIN
      IF cases IN rec.cases THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_casetype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,cases);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'genders';
      fieldname.len := 7;
      typecode := 104;
   END;
   result^.typeindicator := EnumSet;
   FOR genders:=femininegender TO omegagender DO BEGIN
      IF genders IN rec.genders THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_gendertype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,genders);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'sexes';
      fieldname.len := 5;
      typecode := 117;
   END;
   result^.typeindicator := EnumSet;
   FOR sexes:=masculine TO feminine DO BEGIN
      IF sexes IN rec.sexes THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_sextype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,sexes);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'actsubcs';
      fieldname.len := 8;
      typecode := 107;
   END;
   result^.typeindicator := EnumSet;
   FOR actsubcs:=city TO othername DO BEGIN
      IF actsubcs IN rec.actsubcs THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_nounsubctype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,actsubcs);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'temporal';
      fieldname.len := 8;
      typecode := 23;
   END;
   result^.typeindicator := Bool;
   IF rec.temporal = TRUE THEN BEGIN
      result^.fieldvalue.str := 'TRUE';
      result^.fieldvalue.len := 4;
      END
   ELSE BEGIN
      result^.fieldvalue.str := 'FALSE';
      result^.fieldvalue.len := 5;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'animate';
      fieldname.len := 7;
      typecode := 32;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_animatetype( result^.fieldvalue.str, result^.fieldvalue.len, rec.animate);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'human';
      fieldname.len := 5;
      typecode := 52;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_humantype( result^.fieldvalue.str, result^.fieldvalue.len, rec.human);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'posscomas';
      fieldname.len := 9;
      typecode := 114;
   END;
   result^.typeindicator := EnumSet;
   FOR posscomas:=count TO mass DO BEGIN
      IF posscomas IN rec.posscomas THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_posscomatype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,posscomas);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'thetanp';
      fieldname.len := 7;
      typecode := 77;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_thetanptype( result^.fieldvalue.str, result^.fieldvalue.len, rec.thetanp);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'nounpatternefs';
      fieldname.len := 14;
      typecode := 119;
   END;
   result^.typeindicator := EnumSet;
   FOR nounpatternefs:=synASIFSENT TO synDONP_OPENINFSENT DO BEGIN
      IF nounpatternefs IN rec.nounpatternefs THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_synpatterntype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,nounpatternefs);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'poss';
      fieldname.len := 4;
      typecode := 16;
   END;
   result^.typeindicator := Bool;
   IF rec.poss = TRUE THEN BEGIN
      result^.fieldvalue.str := 'TRUE';
      result^.fieldvalue.len := 4;
      END
   ELSE BEGIN
      result^.fieldvalue.str := 'FALSE';
      result^.fieldvalue.len := 5;
   END;
   LSCONVREC_CNVARrecord := result;
END {LSCONVREC_CNVARrecord};

FUNCTION LSCONVREC_NPrecord(rec: LSDOMAINT_NPrecord): LDCONVREC_pAttrStruct;
VAR result : LDCONVREC_pAttrStruct;
    req : LSDOMAINT_polaritytype; 
    env : LSDOMAINT_polaritytype; 
    cases : LSDOMAINT_casetype; 
    genders : LSDOMAINT_gendertype; 
    sexes : LSDOMAINT_sextype; 
    actsubcs : LSDOMAINT_nounsubctype; 
    actcomas : LSDOMAINT_posscomatype; 
    nounpatternefs : LSDOMAINT_synpatterntype; 
BEGIN
   result := NIL;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'req';
      fieldname.len := 3;
      typecode := 112;
   END;
   result^.typeindicator := EnumSet;
   FOR req:=pospol TO omegapol DO BEGIN
      IF req IN rec.req THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_polaritytype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,req);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'env';
      fieldname.len := 3;
      typecode := 112;
   END;
   result^.typeindicator := EnumSet;
   FOR env:=pospol TO omegapol DO BEGIN
      IF env IN rec.env THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_polaritytype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,env);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'superdeixis';
      fieldname.len := 11;
      typecode := 46;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_deixistype( result^.fieldvalue.str, result^.fieldvalue.len, rec.superdeixis);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'class';
      fieldname.len := 5;
      typecode := 80;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_timeadvclasstype( result^.fieldvalue.str, result^.fieldvalue.len, rec.class);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'deixis';
      fieldname.len := 6;
      typecode := 46;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_deixistype( result^.fieldvalue.str, result^.fieldvalue.len, rec.deixis);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'aspect';
      fieldname.len := 6;
      typecode := 34;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_aspecttype( result^.fieldvalue.str, result^.fieldvalue.len, rec.aspect);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'retro';
      fieldname.len := 5;
      typecode := 19;
   END;
   result^.typeindicator := Bool;
   IF rec.retro = TRUE THEN BEGIN
      result^.fieldvalue.str := 'TRUE';
      result^.fieldvalue.len := 4;
      END
   ELSE BEGIN
      result^.fieldvalue.str := 'FALSE';
      result^.fieldvalue.len := 5;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'definite';
      fieldname.len := 8;
      typecode := 45;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_deftype( result^.fieldvalue.str, result^.fieldvalue.len, rec.definite);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'person';
      fieldname.len := 6;
      typecode := 85;
   END;
   result^.typeindicator := SubRange;
   LSTYPETOSTR_persontype( result^.fieldvalue.str, result^.fieldvalue.len, rec.person);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'number';
      fieldname.len := 6;
      typecode := 59;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_numbertype( result^.fieldvalue.str, result^.fieldvalue.len, rec.number);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'cases';
      fieldname.len := 5;
      typecode := 97;
   END;
   result^.typeindicator := EnumSet;
   FOR cases:=nominative TO omegacase DO BEGIN
      IF cases IN rec.cases THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_casetype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,cases);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'genders';
      fieldname.len := 7;
      typecode := 104;
   END;
   result^.typeindicator := EnumSet;
   FOR genders:=femininegender TO omegagender DO BEGIN
      IF genders IN rec.genders THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_gendertype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,genders);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'sexes';
      fieldname.len := 5;
      typecode := 117;
   END;
   result^.typeindicator := EnumSet;
   FOR sexes:=masculine TO feminine DO BEGIN
      IF sexes IN rec.sexes THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_sextype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,sexes);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'actsubcs';
      fieldname.len := 8;
      typecode := 107;
   END;
   result^.typeindicator := EnumSet;
   FOR actsubcs:=city TO othername DO BEGIN
      IF actsubcs IN rec.actsubcs THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_nounsubctype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,actsubcs);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'temporal';
      fieldname.len := 8;
      typecode := 23;
   END;
   result^.typeindicator := Bool;
   IF rec.temporal = TRUE THEN BEGIN
      result^.fieldvalue.str := 'TRUE';
      result^.fieldvalue.len := 4;
      END
   ELSE BEGIN
      result^.fieldvalue.str := 'FALSE';
      result^.fieldvalue.len := 5;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'animate';
      fieldname.len := 7;
      typecode := 32;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_animatetype( result^.fieldvalue.str, result^.fieldvalue.len, rec.animate);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'human';
      fieldname.len := 5;
      typecode := 52;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_humantype( result^.fieldvalue.str, result^.fieldvalue.len, rec.human);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'actcomas';
      fieldname.len := 8;
      typecode := 114;
   END;
   result^.typeindicator := EnumSet;
   FOR actcomas:=count TO mass DO BEGIN
      IF actcomas IN rec.actcomas THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_posscomatype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,actcomas);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'thetanp';
      fieldname.len := 7;
      typecode := 77;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_thetanptype( result^.fieldvalue.str, result^.fieldvalue.len, rec.thetanp);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'nounpatternefs';
      fieldname.len := 14;
      typecode := 119;
   END;
   result^.typeindicator := EnumSet;
   FOR nounpatternefs:=synASIFSENT TO synDONP_OPENINFSENT DO BEGIN
      IF nounpatternefs IN rec.nounpatternefs THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_synpatterntype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,nounpatternefs);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'mood';
      fieldname.len := 4;
      typecode := 83;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_xpmoodtype( result^.fieldvalue.str, result^.fieldvalue.len, rec.mood);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'generic';
      fieldname.len := 7;
      typecode := 50;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_generictype( result^.fieldvalue.str, result^.fieldvalue.len, rec.generic);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'posspred';
      fieldname.len := 8;
      typecode := 15;
   END;
   result^.typeindicator := Bool;
   IF rec.posspred = TRUE THEN BEGIN
      result^.fieldvalue.str := 'TRUE';
      result^.fieldvalue.len := 4;
      END
   ELSE BEGIN
      result^.fieldvalue.str := 'FALSE';
      result^.fieldvalue.len := 5;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'possnietnp';
      fieldname.len := 10;
      typecode := 14;
   END;
   result^.typeindicator := Bool;
   IF rec.possnietnp = TRUE THEN BEGIN
      result^.fieldvalue.str := 'TRUE';
      result^.fieldvalue.len := 4;
      END
   ELSE BEGIN
      result^.fieldvalue.str := 'FALSE';
      result^.fieldvalue.len := 5;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'syntquant';
      fieldname.len := 9;
      typecode := 71;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_syntquanttype( result^.fieldvalue.str, result^.fieldvalue.len, rec.syntquant);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'NPhead';
      fieldname.len := 6;
      typecode := 58;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_npheadtype( result^.fieldvalue.str, result^.fieldvalue.len, rec.NPhead);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'specQ';
      fieldname.len := 5;
      typecode := 69;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_specqtype( result^.fieldvalue.str, result^.fieldvalue.len, rec.specQ);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'poss';
      fieldname.len := 4;
      typecode := 16;
   END;
   result^.typeindicator := Bool;
   IF rec.poss = TRUE THEN BEGIN
      result^.fieldvalue.str := 'TRUE';
      result^.fieldvalue.len := 4;
      END
   ELSE BEGIN
      result^.fieldvalue.str := 'FALSE';
      result^.fieldvalue.len := 5;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'coord';
      fieldname.len := 5;
      typecode := 44;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_coordtype( result^.fieldvalue.str, result^.fieldvalue.len, rec.coord);
   LSCONVREC_NPrecord := result;
END {LSCONVREC_NPrecord};

FUNCTION LSCONVREC_NPVARrecord(rec: LSDOMAINT_NPVARrecord): LDCONVREC_pAttrStruct;
VAR result : LDCONVREC_pAttrStruct;
    req : LSDOMAINT_polaritytype; 
    env : LSDOMAINT_polaritytype; 
    cases : LSDOMAINT_casetype; 
    genders : LSDOMAINT_gendertype; 
    sexes : LSDOMAINT_sextype; 
    actsubcs : LSDOMAINT_nounsubctype; 
    actcomas : LSDOMAINT_posscomatype; 
    nounpatternefs : LSDOMAINT_synpatterntype; 
BEGIN
   result := NIL;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'INDEX';
      fieldname.len := 5;
      typecode := 0;
      typeindicator := Int;
      STR_IntegerToStr(rec.INDEX,  fieldvalue.str, fieldvalue.len);
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'req';
      fieldname.len := 3;
      typecode := 112;
   END;
   result^.typeindicator := EnumSet;
   FOR req:=pospol TO omegapol DO BEGIN
      IF req IN rec.req THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_polaritytype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,req);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'env';
      fieldname.len := 3;
      typecode := 112;
   END;
   result^.typeindicator := EnumSet;
   FOR env:=pospol TO omegapol DO BEGIN
      IF env IN rec.env THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_polaritytype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,env);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'superdeixis';
      fieldname.len := 11;
      typecode := 46;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_deixistype( result^.fieldvalue.str, result^.fieldvalue.len, rec.superdeixis);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'class';
      fieldname.len := 5;
      typecode := 80;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_timeadvclasstype( result^.fieldvalue.str, result^.fieldvalue.len, rec.class);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'deixis';
      fieldname.len := 6;
      typecode := 46;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_deixistype( result^.fieldvalue.str, result^.fieldvalue.len, rec.deixis);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'aspect';
      fieldname.len := 6;
      typecode := 34;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_aspecttype( result^.fieldvalue.str, result^.fieldvalue.len, rec.aspect);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'retro';
      fieldname.len := 5;
      typecode := 19;
   END;
   result^.typeindicator := Bool;
   IF rec.retro = TRUE THEN BEGIN
      result^.fieldvalue.str := 'TRUE';
      result^.fieldvalue.len := 4;
      END
   ELSE BEGIN
      result^.fieldvalue.str := 'FALSE';
      result^.fieldvalue.len := 5;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'definite';
      fieldname.len := 8;
      typecode := 45;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_deftype( result^.fieldvalue.str, result^.fieldvalue.len, rec.definite);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'person';
      fieldname.len := 6;
      typecode := 85;
   END;
   result^.typeindicator := SubRange;
   LSTYPETOSTR_persontype( result^.fieldvalue.str, result^.fieldvalue.len, rec.person);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'number';
      fieldname.len := 6;
      typecode := 59;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_numbertype( result^.fieldvalue.str, result^.fieldvalue.len, rec.number);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'cases';
      fieldname.len := 5;
      typecode := 97;
   END;
   result^.typeindicator := EnumSet;
   FOR cases:=nominative TO omegacase DO BEGIN
      IF cases IN rec.cases THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_casetype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,cases);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'genders';
      fieldname.len := 7;
      typecode := 104;
   END;
   result^.typeindicator := EnumSet;
   FOR genders:=femininegender TO omegagender DO BEGIN
      IF genders IN rec.genders THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_gendertype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,genders);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'sexes';
      fieldname.len := 5;
      typecode := 117;
   END;
   result^.typeindicator := EnumSet;
   FOR sexes:=masculine TO feminine DO BEGIN
      IF sexes IN rec.sexes THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_sextype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,sexes);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'actsubcs';
      fieldname.len := 8;
      typecode := 107;
   END;
   result^.typeindicator := EnumSet;
   FOR actsubcs:=city TO othername DO BEGIN
      IF actsubcs IN rec.actsubcs THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_nounsubctype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,actsubcs);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'temporal';
      fieldname.len := 8;
      typecode := 23;
   END;
   result^.typeindicator := Bool;
   IF rec.temporal = TRUE THEN BEGIN
      result^.fieldvalue.str := 'TRUE';
      result^.fieldvalue.len := 4;
      END
   ELSE BEGIN
      result^.fieldvalue.str := 'FALSE';
      result^.fieldvalue.len := 5;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'animate';
      fieldname.len := 7;
      typecode := 32;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_animatetype( result^.fieldvalue.str, result^.fieldvalue.len, rec.animate);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'human';
      fieldname.len := 5;
      typecode := 52;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_humantype( result^.fieldvalue.str, result^.fieldvalue.len, rec.human);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'actcomas';
      fieldname.len := 8;
      typecode := 114;
   END;
   result^.typeindicator := EnumSet;
   FOR actcomas:=count TO mass DO BEGIN
      IF actcomas IN rec.actcomas THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_posscomatype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,actcomas);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'thetanp';
      fieldname.len := 7;
      typecode := 77;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_thetanptype( result^.fieldvalue.str, result^.fieldvalue.len, rec.thetanp);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'nounpatternefs';
      fieldname.len := 14;
      typecode := 119;
   END;
   result^.typeindicator := EnumSet;
   FOR nounpatternefs:=synASIFSENT TO synDONP_OPENINFSENT DO BEGIN
      IF nounpatternefs IN rec.nounpatternefs THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_synpatterntype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,nounpatternefs);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'mood';
      fieldname.len := 4;
      typecode := 83;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_xpmoodtype( result^.fieldvalue.str, result^.fieldvalue.len, rec.mood);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'generic';
      fieldname.len := 7;
      typecode := 50;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_generictype( result^.fieldvalue.str, result^.fieldvalue.len, rec.generic);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'posspred';
      fieldname.len := 8;
      typecode := 15;
   END;
   result^.typeindicator := Bool;
   IF rec.posspred = TRUE THEN BEGIN
      result^.fieldvalue.str := 'TRUE';
      result^.fieldvalue.len := 4;
      END
   ELSE BEGIN
      result^.fieldvalue.str := 'FALSE';
      result^.fieldvalue.len := 5;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'possnietnp';
      fieldname.len := 10;
      typecode := 14;
   END;
   result^.typeindicator := Bool;
   IF rec.possnietnp = TRUE THEN BEGIN
      result^.fieldvalue.str := 'TRUE';
      result^.fieldvalue.len := 4;
      END
   ELSE BEGIN
      result^.fieldvalue.str := 'FALSE';
      result^.fieldvalue.len := 5;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'syntquant';
      fieldname.len := 9;
      typecode := 71;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_syntquanttype( result^.fieldvalue.str, result^.fieldvalue.len, rec.syntquant);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'NPhead';
      fieldname.len := 6;
      typecode := 58;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_npheadtype( result^.fieldvalue.str, result^.fieldvalue.len, rec.NPhead);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'specQ';
      fieldname.len := 5;
      typecode := 69;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_specqtype( result^.fieldvalue.str, result^.fieldvalue.len, rec.specQ);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'poss';
      fieldname.len := 4;
      typecode := 16;
   END;
   result^.typeindicator := Bool;
   IF rec.poss = TRUE THEN BEGIN
      result^.fieldvalue.str := 'TRUE';
      result^.fieldvalue.len := 4;
      END
   ELSE BEGIN
      result^.fieldvalue.str := 'FALSE';
      result^.fieldvalue.len := 5;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'coord';
      fieldname.len := 5;
      typecode := 44;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_coordtype( result^.fieldvalue.str, result^.fieldvalue.len, rec.coord);
   LSCONVREC_NPVARrecord := result;
END {LSCONVREC_NPVARrecord};

FUNCTION LSCONVREC_NPPROPrecord(rec: LSDOMAINT_NPPROPrecord): LDCONVREC_pAttrStruct;
VAR result : LDCONVREC_pAttrStruct;
    req : LSDOMAINT_polaritytype; 
    env : LSDOMAINT_polaritytype; 
    aktionsarts : LSDOMAINT_aktionsarttype; 
    nounpatternefs : LSDOMAINT_synpatterntype; 
BEGIN
   result := NIL;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'req';
      fieldname.len := 3;
      typecode := 112;
   END;
   result^.typeindicator := EnumSet;
   FOR req:=pospol TO omegapol DO BEGIN
      IF req IN rec.req THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_polaritytype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,req);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'env';
      fieldname.len := 3;
      typecode := 112;
   END;
   result^.typeindicator := EnumSet;
   FOR env:=pospol TO omegapol DO BEGIN
      IF env IN rec.env THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_polaritytype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,env);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'superdeixis';
      fieldname.len := 11;
      typecode := 46;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_deixistype( result^.fieldvalue.str, result^.fieldvalue.len, rec.superdeixis);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'aktionsarts';
      fieldname.len := 11;
      typecode := 95;
   END;
   result^.typeindicator := EnumSet;
   FOR aktionsarts:=stative TO achievement DO BEGIN
      IF aktionsarts IN rec.aktionsarts THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_aktionsarttype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,aktionsarts);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'thetanp';
      fieldname.len := 7;
      typecode := 77;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_thetanptype( result^.fieldvalue.str, result^.fieldvalue.len, rec.thetanp);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'nounpatternefs';
      fieldname.len := 14;
      typecode := 119;
   END;
   result^.typeindicator := EnumSet;
   FOR nounpatternefs:=synASIFSENT TO synDONP_OPENINFSENT DO BEGIN
      IF nounpatternefs IN rec.nounpatternefs THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_synpatterntype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,nounpatternefs);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'PROsubject';
      fieldname.len := 10;
      typecode := 18;
   END;
   result^.typeindicator := Bool;
   IF rec.PROsubject = TRUE THEN BEGIN
      result^.fieldvalue.str := 'TRUE';
      result^.fieldvalue.len := 4;
      END
   ELSE BEGIN
      result^.fieldvalue.str := 'FALSE';
      result^.fieldvalue.len := 5;
   END;
   LSCONVREC_NPPROPrecord := result;
END {LSCONVREC_NPPROPrecord};

FUNCTION LSCONVREC_NPPROPVARrecord(rec: LSDOMAINT_NPPROPVARrecord): LDCONVREC_pAttrStruct;
VAR result : LDCONVREC_pAttrStruct;
    req : LSDOMAINT_polaritytype; 
    env : LSDOMAINT_polaritytype; 
    aktionsarts : LSDOMAINT_aktionsarttype; 
    nounpatternefs : LSDOMAINT_synpatterntype; 
BEGIN
   result := NIL;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'INDEX';
      fieldname.len := 5;
      typecode := 0;
      typeindicator := Int;
      STR_IntegerToStr(rec.INDEX,  fieldvalue.str, fieldvalue.len);
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'req';
      fieldname.len := 3;
      typecode := 112;
   END;
   result^.typeindicator := EnumSet;
   FOR req:=pospol TO omegapol DO BEGIN
      IF req IN rec.req THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_polaritytype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,req);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'env';
      fieldname.len := 3;
      typecode := 112;
   END;
   result^.typeindicator := EnumSet;
   FOR env:=pospol TO omegapol DO BEGIN
      IF env IN rec.env THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_polaritytype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,env);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'superdeixis';
      fieldname.len := 11;
      typecode := 46;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_deixistype( result^.fieldvalue.str, result^.fieldvalue.len, rec.superdeixis);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'aktionsarts';
      fieldname.len := 11;
      typecode := 95;
   END;
   result^.typeindicator := EnumSet;
   FOR aktionsarts:=stative TO achievement DO BEGIN
      IF aktionsarts IN rec.aktionsarts THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_aktionsarttype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,aktionsarts);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'thetanp';
      fieldname.len := 7;
      typecode := 77;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_thetanptype( result^.fieldvalue.str, result^.fieldvalue.len, rec.thetanp);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'nounpatternefs';
      fieldname.len := 14;
      typecode := 119;
   END;
   result^.typeindicator := EnumSet;
   FOR nounpatternefs:=synASIFSENT TO synDONP_OPENINFSENT DO BEGIN
      IF nounpatternefs IN rec.nounpatternefs THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_synpatterntype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,nounpatternefs);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'PROsubject';
      fieldname.len := 10;
      typecode := 18;
   END;
   result^.typeindicator := Bool;
   IF rec.PROsubject = TRUE THEN BEGIN
      result^.fieldvalue.str := 'TRUE';
      result^.fieldvalue.len := 4;
      END
   ELSE BEGIN
      result^.fieldvalue.str := 'FALSE';
      result^.fieldvalue.len := 5;
   END;
   LSCONVREC_NPPROPVARrecord := result;
END {LSCONVREC_NPPROPVARrecord};

FUNCTION LSCONVREC_NUMrecord(rec: LSDOMAINT_NUMrecord): LDCONVREC_pAttrStruct;
VAR result : LDCONVREC_pAttrStruct;
    numbers : LSDOMAINT_numbertype; 
BEGIN
   result := NIL;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'KEY';
      fieldname.len := 3;
      typecode := 0;
      typeindicator := Int;
      STR_IntegerToStr(rec.KEY,  fieldvalue.str, fieldvalue.len);
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'numbers';
      fieldname.len := 7;
      typecode := 108;
   END;
   result^.typeindicator := EnumSet;
   FOR numbers:=singular TO omeganumber DO BEGIN
      IF numbers IN rec.numbers THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_numbertype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,numbers);
      END;
   END;
   LSCONVREC_NUMrecord := result;
END {LSCONVREC_NUMrecord};

FUNCTION LSCONVREC_ORDINALrecord(rec: LSDOMAINT_ORDINALrecord): LDCONVREC_pAttrStruct;
VAR result : LDCONVREC_pAttrStruct;
BEGIN
   result := NIL;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'KEY';
      fieldname.len := 3;
      typecode := 0;
      typeindicator := Int;
      STR_IntegerToStr(rec.KEY,  fieldvalue.str, fieldvalue.len);
   END;
   LSCONVREC_ORDINALrecord := result;
END {LSCONVREC_ORDINALrecord};

FUNCTION LSCONVREC_PARTICLErecord(rec: LSDOMAINT_PARTICLErecord): LDCONVREC_pAttrStruct;
VAR result : LDCONVREC_pAttrStruct;
BEGIN
   result := NIL;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'KEY';
      fieldname.len := 3;
      typecode := 0;
      typeindicator := Int;
      STR_IntegerToStr(rec.KEY,  fieldvalue.str, fieldvalue.len);
   END;
   LSCONVREC_PARTICLErecord := result;
END {LSCONVREC_PARTICLErecord};

FUNCTION LSCONVREC_BIGPROrecord(rec: LSDOMAINT_BIGPROrecord): LDCONVREC_pAttrStruct;
VAR result : LDCONVREC_pAttrStruct;
BEGIN
   result := NIL;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'person';
      fieldname.len := 6;
      typecode := 85;
   END;
   result^.typeindicator := SubRange;
   LSTYPETOSTR_persontype( result^.fieldvalue.str, result^.fieldvalue.len, rec.person);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'number';
      fieldname.len := 6;
      typecode := 59;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_numbertype( result^.fieldvalue.str, result^.fieldvalue.len, rec.number);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'gender';
      fieldname.len := 6;
      typecode := 49;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_gendertype( result^.fieldvalue.str, result^.fieldvalue.len, rec.gender);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'animate';
      fieldname.len := 7;
      typecode := 32;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_animatetype( result^.fieldvalue.str, result^.fieldvalue.len, rec.animate);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'predpos';
      fieldname.len := 7;
      typecode := 17;
   END;
   result^.typeindicator := Bool;
   IF rec.predpos = TRUE THEN BEGIN
      result^.fieldvalue.str := 'TRUE';
      result^.fieldvalue.len := 4;
      END
   ELSE BEGIN
      result^.fieldvalue.str := 'FALSE';
      result^.fieldvalue.len := 5;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'NPhead';
      fieldname.len := 6;
      typecode := 58;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_npheadtype( result^.fieldvalue.str, result^.fieldvalue.len, rec.NPhead);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'antecedent';
      fieldname.len := 10;
      typecode := 1;
   END;
   result^.typeindicator := Int;
   STR_IntegerToStr( rec.antecedent, result^.fieldvalue.str, result^.fieldvalue.len);
   LSCONVREC_BIGPROrecord := result;
END {LSCONVREC_BIGPROrecord};

FUNCTION LSCONVREC_BPERSPROrecord(rec: LSDOMAINT_BPERSPROrecord): LDCONVREC_pAttrStruct;
VAR result : LDCONVREC_pAttrStruct;
BEGIN
   result := NIL;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'KEY';
      fieldname.len := 3;
      typecode := 0;
      typeindicator := Int;
      STR_IntegerToStr(rec.KEY,  fieldvalue.str, fieldvalue.len);
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'person';
      fieldname.len := 6;
      typecode := 85;
   END;
   result^.typeindicator := SubRange;
   LSTYPETOSTR_persontype( result^.fieldvalue.str, result^.fieldvalue.len, rec.person);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'number';
      fieldname.len := 6;
      typecode := 59;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_numbertype( result^.fieldvalue.str, result^.fieldvalue.len, rec.number);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'gender';
      fieldname.len := 6;
      typecode := 49;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_gendertype( result^.fieldvalue.str, result^.fieldvalue.len, rec.gender);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'animate';
      fieldname.len := 7;
      typecode := 32;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_animatetype( result^.fieldvalue.str, result^.fieldvalue.len, rec.animate);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'predpos';
      fieldname.len := 7;
      typecode := 17;
   END;
   result^.typeindicator := Bool;
   IF rec.predpos = TRUE THEN BEGIN
      result^.fieldvalue.str := 'TRUE';
      result^.fieldvalue.len := 4;
      END
   ELSE BEGIN
      result^.fieldvalue.str := 'FALSE';
      result^.fieldvalue.len := 5;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'NPhead';
      fieldname.len := 6;
      typecode := 58;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_npheadtype( result^.fieldvalue.str, result^.fieldvalue.len, rec.NPhead);
   LSCONVREC_BPERSPROrecord := result;
END {LSCONVREC_BPERSPROrecord};

FUNCTION LSCONVREC_PERSPROrecord(rec: LSDOMAINT_PERSPROrecord): LDCONVREC_pAttrStruct;
VAR result : LDCONVREC_pAttrStruct;
BEGIN
   result := NIL;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'person';
      fieldname.len := 6;
      typecode := 85;
   END;
   result^.typeindicator := SubRange;
   LSTYPETOSTR_persontype( result^.fieldvalue.str, result^.fieldvalue.len, rec.person);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'number';
      fieldname.len := 6;
      typecode := 59;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_numbertype( result^.fieldvalue.str, result^.fieldvalue.len, rec.number);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'gender';
      fieldname.len := 6;
      typecode := 49;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_gendertype( result^.fieldvalue.str, result^.fieldvalue.len, rec.gender);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'animate';
      fieldname.len := 7;
      typecode := 32;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_animatetype( result^.fieldvalue.str, result^.fieldvalue.len, rec.animate);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'predpos';
      fieldname.len := 7;
      typecode := 17;
   END;
   result^.typeindicator := Bool;
   IF rec.predpos = TRUE THEN BEGIN
      result^.fieldvalue.str := 'TRUE';
      result^.fieldvalue.len := 4;
      END
   ELSE BEGIN
      result^.fieldvalue.str := 'FALSE';
      result^.fieldvalue.len := 5;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'NPhead';
      fieldname.len := 6;
      typecode := 58;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_npheadtype( result^.fieldvalue.str, result^.fieldvalue.len, rec.NPhead);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'persprocase';
      fieldname.len := 11;
      typecode := 36;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_casetype( result^.fieldvalue.str, result^.fieldvalue.len, rec.persprocase);
   LSCONVREC_PERSPROrecord := result;
END {LSCONVREC_PERSPROrecord};

FUNCTION LSCONVREC_POSrecord(rec: LSDOMAINT_POSrecord): LDCONVREC_pAttrStruct;
VAR result : LDCONVREC_pAttrStruct;
BEGIN
   result := NIL;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'KEY';
      fieldname.len := 3;
      typecode := 0;
      typeindicator := Int;
      STR_IntegerToStr(rec.KEY,  fieldvalue.str, fieldvalue.len);
   END;
   LSCONVREC_POSrecord := result;
END {LSCONVREC_POSrecord};

FUNCTION LSCONVREC_POSVARrecord(rec: LSDOMAINT_POSVARrecord): LDCONVREC_pAttrStruct;
VAR result : LDCONVREC_pAttrStruct;
BEGIN
   result := NIL;
   LSCONVREC_POSVARrecord := result;
END {LSCONVREC_POSVARrecord};

FUNCTION LSCONVREC_POSSADJrecord(rec: LSDOMAINT_POSSADJrecord): LDCONVREC_pAttrStruct;
VAR result : LDCONVREC_pAttrStruct;
BEGIN
   result := NIL;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'mood';
      fieldname.len := 4;
      typecode := 83;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_xpmoodtype( result^.fieldvalue.str, result^.fieldvalue.len, rec.mood);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'antecedent';
      fieldname.len := 10;
      typecode := 33;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_antecedenttype( result^.fieldvalue.str, result^.fieldvalue.len, rec.antecedent);
   LSCONVREC_POSSADJrecord := result;
END {LSCONVREC_POSSADJrecord};

FUNCTION LSCONVREC_POSSPROrecord(rec: LSDOMAINT_POSSPROrecord): LDCONVREC_pAttrStruct;
VAR result : LDCONVREC_pAttrStruct;
BEGIN
   result := NIL;
   LSCONVREC_POSSPROrecord := result;
END {LSCONVREC_POSSPROrecord};

FUNCTION LSCONVREC_BPREFIXrecord(rec: LSDOMAINT_BPREFIXrecord): LDCONVREC_pAttrStruct;
VAR result : LDCONVREC_pAttrStruct;
    heads : LSDOMAINT_headtype; 
BEGIN
   result := NIL;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'KEY';
      fieldname.len := 3;
      typecode := 0;
      typeindicator := Int;
      STR_IntegerToStr(rec.KEY,  fieldvalue.str, fieldvalue.len);
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'heads';
      fieldname.len := 5;
      typecode := 105;
   END;
   result^.typeindicator := EnumSet;
   FOR heads:=nounhead TO propernounhead DO BEGIN
      IF heads IN rec.heads THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_headtype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,heads);
      END;
   END;
   LSCONVREC_BPREFIXrecord := result;
END {LSCONVREC_BPREFIXrecord};

FUNCTION LSCONVREC_PREPrecord(rec: LSDOMAINT_PREPrecord): LDCONVREC_pAttrStruct;
VAR result : LDCONVREC_pAttrStruct;
    req : LSDOMAINT_polaritytype; 
    env : LSDOMAINT_polaritytype; 
    subcs : LSDOMAINT_prepsubctype; 
    synpps : LSDOMAINT_synpatterntype; 
BEGIN
   result := NIL;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'KEY';
      fieldname.len := 3;
      typecode := 0;
      typeindicator := Int;
      STR_IntegerToStr(rec.KEY,  fieldvalue.str, fieldvalue.len);
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'req';
      fieldname.len := 3;
      typecode := 112;
   END;
   result^.typeindicator := EnumSet;
   FOR req:=pospol TO omegapol DO BEGIN
      IF req IN rec.req THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_polaritytype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,req);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'env';
      fieldname.len := 3;
      typecode := 112;
   END;
   result^.typeindicator := EnumSet;
   FOR env:=pospol TO omegapol DO BEGIN
      IF env IN rec.env THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_polaritytype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,env);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'subcs';
      fieldname.len := 5;
      typecode := 115;
   END;
   result^.typeindicator := EnumSet;
   FOR subcs:=loc TO rest DO BEGIN
      IF subcs IN rec.subcs THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_prepsubctype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,subcs);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'synpps';
      fieldname.len := 6;
      typecode := 118;
   END;
   result^.typeindicator := EnumSet;
   FOR synpps:=synASIFSENT TO synDONP_OPENINFSENT DO BEGIN
      IF synpps IN rec.synpps THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_synpatterntype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,synpps);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'thetapp';
      fieldname.len := 7;
      typecode := 78;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_thetapptype( result^.fieldvalue.str, result^.fieldvalue.len, rec.thetapp);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'class';
      fieldname.len := 5;
      typecode := 80;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_timeadvclasstype( result^.fieldvalue.str, result^.fieldvalue.len, rec.class);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'deixis';
      fieldname.len := 6;
      typecode := 46;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_deixistype( result^.fieldvalue.str, result^.fieldvalue.len, rec.deixis);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'aspect';
      fieldname.len := 6;
      typecode := 34;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_aspecttype( result^.fieldvalue.str, result^.fieldvalue.len, rec.aspect);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'retro';
      fieldname.len := 5;
      typecode := 19;
   END;
   result^.typeindicator := Bool;
   IF rec.retro = TRUE THEN BEGIN
      result^.fieldvalue.str := 'TRUE';
      result^.fieldvalue.len := 4;
      END
   ELSE BEGIN
      result^.fieldvalue.str := 'FALSE';
      result^.fieldvalue.len := 5;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'secondprep';
      fieldname.len := 10;
      typecode := 2;
   END;
   result^.typeindicator := Int;
   STR_IntegerToStr( rec.secondprep, result^.fieldvalue.str, result^.fieldvalue.len);
   LSCONVREC_PREPrecord := result;
END {LSCONVREC_PREPrecord};

FUNCTION LSCONVREC_PREPPrecord(rec: LSDOMAINT_PREPPrecord): LDCONVREC_pAttrStruct;
VAR result : LDCONVREC_pAttrStruct;
    req : LSDOMAINT_polaritytype; 
    env : LSDOMAINT_polaritytype; 
    actsubcefs : LSDOMAINT_prepsubctype; 
    synppefs : LSDOMAINT_synpatterntype; 
BEGIN
   result := NIL;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'req';
      fieldname.len := 3;
      typecode := 112;
   END;
   result^.typeindicator := EnumSet;
   FOR req:=pospol TO omegapol DO BEGIN
      IF req IN rec.req THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_polaritytype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,req);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'env';
      fieldname.len := 3;
      typecode := 112;
   END;
   result^.typeindicator := EnumSet;
   FOR env:=pospol TO omegapol DO BEGIN
      IF env IN rec.env THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_polaritytype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,env);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'mood';
      fieldname.len := 4;
      typecode := 83;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_xpmoodtype( result^.fieldvalue.str, result^.fieldvalue.len, rec.mood);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'actsubcefs';
      fieldname.len := 10;
      typecode := 116;
   END;
   result^.typeindicator := EnumSet;
   FOR actsubcefs:=loc TO rest DO BEGIN
      IF actsubcefs IN rec.actsubcefs THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_prepsubctype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,actsubcefs);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'synppefs';
      fieldname.len := 8;
      typecode := 119;
   END;
   result^.typeindicator := EnumSet;
   FOR synppefs:=synASIFSENT TO synDONP_OPENINFSENT DO BEGIN
      IF synppefs IN rec.synppefs THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_synpatterntype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,synppefs);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'thetapp';
      fieldname.len := 7;
      typecode := 78;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_thetapptype( result^.fieldvalue.str, result^.fieldvalue.len, rec.thetapp);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'headkey';
      fieldname.len := 7;
      typecode := 2;
   END;
   result^.typeindicator := Int;
   STR_IntegerToStr( rec.headkey, result^.fieldvalue.str, result^.fieldvalue.len);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'class';
      fieldname.len := 5;
      typecode := 80;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_timeadvclasstype( result^.fieldvalue.str, result^.fieldvalue.len, rec.class);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'deixis';
      fieldname.len := 6;
      typecode := 46;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_deixistype( result^.fieldvalue.str, result^.fieldvalue.len, rec.deixis);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'aspect';
      fieldname.len := 6;
      typecode := 34;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_aspecttype( result^.fieldvalue.str, result^.fieldvalue.len, rec.aspect);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'retro';
      fieldname.len := 5;
      typecode := 19;
   END;
   result^.typeindicator := Bool;
   IF rec.retro = TRUE THEN BEGIN
      result^.fieldvalue.str := 'TRUE';
      result^.fieldvalue.len := 4;
      END
   ELSE BEGIN
      result^.fieldvalue.str := 'FALSE';
      result^.fieldvalue.len := 5;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'superdeixis';
      fieldname.len := 11;
      typecode := 46;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_deixistype( result^.fieldvalue.str, result^.fieldvalue.len, rec.superdeixis);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'specQ';
      fieldname.len := 5;
      typecode := 69;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_specqtype( result^.fieldvalue.str, result^.fieldvalue.len, rec.specQ);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'stranded';
      fieldname.len := 8;
      typecode := 22;
   END;
   result^.typeindicator := Bool;
   IF rec.stranded = TRUE THEN BEGIN
      result^.fieldvalue.str := 'TRUE';
      result^.fieldvalue.len := 4;
      END
   ELSE BEGIN
      result^.fieldvalue.str := 'FALSE';
      result^.fieldvalue.len := 5;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'coord';
      fieldname.len := 5;
      typecode := 44;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_coordtype( result^.fieldvalue.str, result^.fieldvalue.len, rec.coord);
   LSCONVREC_PREPPrecord := result;
END {LSCONVREC_PREPPrecord};

FUNCTION LSCONVREC_PREPPVARrecord(rec: LSDOMAINT_PREPPVARrecord): LDCONVREC_pAttrStruct;
VAR result : LDCONVREC_pAttrStruct;
    req : LSDOMAINT_polaritytype; 
    env : LSDOMAINT_polaritytype; 
    actsubcefs : LSDOMAINT_prepsubctype; 
    synppefs : LSDOMAINT_synpatterntype; 
BEGIN
   result := NIL;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'INDEX';
      fieldname.len := 5;
      typecode := 0;
      typeindicator := Int;
      STR_IntegerToStr(rec.INDEX,  fieldvalue.str, fieldvalue.len);
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'req';
      fieldname.len := 3;
      typecode := 112;
   END;
   result^.typeindicator := EnumSet;
   FOR req:=pospol TO omegapol DO BEGIN
      IF req IN rec.req THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_polaritytype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,req);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'env';
      fieldname.len := 3;
      typecode := 112;
   END;
   result^.typeindicator := EnumSet;
   FOR env:=pospol TO omegapol DO BEGIN
      IF env IN rec.env THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_polaritytype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,env);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'mood';
      fieldname.len := 4;
      typecode := 83;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_xpmoodtype( result^.fieldvalue.str, result^.fieldvalue.len, rec.mood);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'actsubcefs';
      fieldname.len := 10;
      typecode := 116;
   END;
   result^.typeindicator := EnumSet;
   FOR actsubcefs:=loc TO rest DO BEGIN
      IF actsubcefs IN rec.actsubcefs THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_prepsubctype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,actsubcefs);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'synppefs';
      fieldname.len := 8;
      typecode := 119;
   END;
   result^.typeindicator := EnumSet;
   FOR synppefs:=synASIFSENT TO synDONP_OPENINFSENT DO BEGIN
      IF synppefs IN rec.synppefs THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_synpatterntype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,synppefs);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'thetapp';
      fieldname.len := 7;
      typecode := 78;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_thetapptype( result^.fieldvalue.str, result^.fieldvalue.len, rec.thetapp);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'headkey';
      fieldname.len := 7;
      typecode := 2;
   END;
   result^.typeindicator := Int;
   STR_IntegerToStr( rec.headkey, result^.fieldvalue.str, result^.fieldvalue.len);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'class';
      fieldname.len := 5;
      typecode := 80;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_timeadvclasstype( result^.fieldvalue.str, result^.fieldvalue.len, rec.class);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'deixis';
      fieldname.len := 6;
      typecode := 46;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_deixistype( result^.fieldvalue.str, result^.fieldvalue.len, rec.deixis);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'aspect';
      fieldname.len := 6;
      typecode := 34;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_aspecttype( result^.fieldvalue.str, result^.fieldvalue.len, rec.aspect);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'retro';
      fieldname.len := 5;
      typecode := 19;
   END;
   result^.typeindicator := Bool;
   IF rec.retro = TRUE THEN BEGIN
      result^.fieldvalue.str := 'TRUE';
      result^.fieldvalue.len := 4;
      END
   ELSE BEGIN
      result^.fieldvalue.str := 'FALSE';
      result^.fieldvalue.len := 5;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'superdeixis';
      fieldname.len := 11;
      typecode := 46;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_deixistype( result^.fieldvalue.str, result^.fieldvalue.len, rec.superdeixis);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'specQ';
      fieldname.len := 5;
      typecode := 69;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_specqtype( result^.fieldvalue.str, result^.fieldvalue.len, rec.specQ);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'stranded';
      fieldname.len := 8;
      typecode := 22;
   END;
   result^.typeindicator := Bool;
   IF rec.stranded = TRUE THEN BEGIN
      result^.fieldvalue.str := 'TRUE';
      result^.fieldvalue.len := 4;
      END
   ELSE BEGIN
      result^.fieldvalue.str := 'FALSE';
      result^.fieldvalue.len := 5;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'coord';
      fieldname.len := 5;
      typecode := 44;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_coordtype( result^.fieldvalue.str, result^.fieldvalue.len, rec.coord);
   LSCONVREC_PREPPVARrecord := result;
END {LSCONVREC_PREPPVARrecord};

FUNCTION LSCONVREC_PREPPPROPrecord(rec: LSDOMAINT_PREPPPROPrecord): LDCONVREC_pAttrStruct;
VAR result : LDCONVREC_pAttrStruct;
    req : LSDOMAINT_polaritytype; 
    env : LSDOMAINT_polaritytype; 
    actsubcefs : LSDOMAINT_prepsubctype; 
    synppefs : LSDOMAINT_synpatterntype; 
    aktionsarts : LSDOMAINT_aktionsarttype; 
BEGIN
   result := NIL;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'req';
      fieldname.len := 3;
      typecode := 112;
   END;
   result^.typeindicator := EnumSet;
   FOR req:=pospol TO omegapol DO BEGIN
      IF req IN rec.req THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_polaritytype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,req);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'env';
      fieldname.len := 3;
      typecode := 112;
   END;
   result^.typeindicator := EnumSet;
   FOR env:=pospol TO omegapol DO BEGIN
      IF env IN rec.env THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_polaritytype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,env);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'mood';
      fieldname.len := 4;
      typecode := 83;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_xpmoodtype( result^.fieldvalue.str, result^.fieldvalue.len, rec.mood);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'actsubcefs';
      fieldname.len := 10;
      typecode := 116;
   END;
   result^.typeindicator := EnumSet;
   FOR actsubcefs:=loc TO rest DO BEGIN
      IF actsubcefs IN rec.actsubcefs THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_prepsubctype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,actsubcefs);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'PROsubject';
      fieldname.len := 10;
      typecode := 18;
   END;
   result^.typeindicator := Bool;
   IF rec.PROsubject = TRUE THEN BEGIN
      result^.fieldvalue.str := 'TRUE';
      result^.fieldvalue.len := 4;
      END
   ELSE BEGIN
      result^.fieldvalue.str := 'FALSE';
      result^.fieldvalue.len := 5;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'synppefs';
      fieldname.len := 8;
      typecode := 119;
   END;
   result^.typeindicator := EnumSet;
   FOR synppefs:=synASIFSENT TO synDONP_OPENINFSENT DO BEGIN
      IF synppefs IN rec.synppefs THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_synpatterntype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,synppefs);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'thetapp';
      fieldname.len := 7;
      typecode := 78;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_thetapptype( result^.fieldvalue.str, result^.fieldvalue.len, rec.thetapp);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'headkey';
      fieldname.len := 7;
      typecode := 2;
   END;
   result^.typeindicator := Int;
   STR_IntegerToStr( rec.headkey, result^.fieldvalue.str, result^.fieldvalue.len);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'class';
      fieldname.len := 5;
      typecode := 80;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_timeadvclasstype( result^.fieldvalue.str, result^.fieldvalue.len, rec.class);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'deixis';
      fieldname.len := 6;
      typecode := 46;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_deixistype( result^.fieldvalue.str, result^.fieldvalue.len, rec.deixis);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'aspect';
      fieldname.len := 6;
      typecode := 34;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_aspecttype( result^.fieldvalue.str, result^.fieldvalue.len, rec.aspect);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'retro';
      fieldname.len := 5;
      typecode := 19;
   END;
   result^.typeindicator := Bool;
   IF rec.retro = TRUE THEN BEGIN
      result^.fieldvalue.str := 'TRUE';
      result^.fieldvalue.len := 4;
      END
   ELSE BEGIN
      result^.fieldvalue.str := 'FALSE';
      result^.fieldvalue.len := 5;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'aktionsarts';
      fieldname.len := 11;
      typecode := 95;
   END;
   result^.typeindicator := EnumSet;
   FOR aktionsarts:=stative TO achievement DO BEGIN
      IF aktionsarts IN rec.aktionsarts THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_aktionsarttype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,aktionsarts);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'superdeixis';
      fieldname.len := 11;
      typecode := 46;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_deixistype( result^.fieldvalue.str, result^.fieldvalue.len, rec.superdeixis);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'specQ';
      fieldname.len := 5;
      typecode := 69;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_specqtype( result^.fieldvalue.str, result^.fieldvalue.len, rec.specQ);
   LSCONVREC_PREPPPROPrecord := result;
END {LSCONVREC_PREPPPROPrecord};

FUNCTION LSCONVREC_PREPPPROPVARrecord(rec: LSDOMAINT_PREPPPROPVARrecord): LDCONVREC_pAttrStruct;
VAR result : LDCONVREC_pAttrStruct;
    req : LSDOMAINT_polaritytype; 
    env : LSDOMAINT_polaritytype; 
    actsubcefs : LSDOMAINT_prepsubctype; 
    synppefs : LSDOMAINT_synpatterntype; 
    aktionsarts : LSDOMAINT_aktionsarttype; 
BEGIN
   result := NIL;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'INDEX';
      fieldname.len := 5;
      typecode := 0;
      typeindicator := Int;
      STR_IntegerToStr(rec.INDEX,  fieldvalue.str, fieldvalue.len);
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'req';
      fieldname.len := 3;
      typecode := 112;
   END;
   result^.typeindicator := EnumSet;
   FOR req:=pospol TO omegapol DO BEGIN
      IF req IN rec.req THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_polaritytype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,req);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'env';
      fieldname.len := 3;
      typecode := 112;
   END;
   result^.typeindicator := EnumSet;
   FOR env:=pospol TO omegapol DO BEGIN
      IF env IN rec.env THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_polaritytype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,env);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'mood';
      fieldname.len := 4;
      typecode := 83;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_xpmoodtype( result^.fieldvalue.str, result^.fieldvalue.len, rec.mood);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'actsubcefs';
      fieldname.len := 10;
      typecode := 116;
   END;
   result^.typeindicator := EnumSet;
   FOR actsubcefs:=loc TO rest DO BEGIN
      IF actsubcefs IN rec.actsubcefs THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_prepsubctype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,actsubcefs);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'PROsubject';
      fieldname.len := 10;
      typecode := 18;
   END;
   result^.typeindicator := Bool;
   IF rec.PROsubject = TRUE THEN BEGIN
      result^.fieldvalue.str := 'TRUE';
      result^.fieldvalue.len := 4;
      END
   ELSE BEGIN
      result^.fieldvalue.str := 'FALSE';
      result^.fieldvalue.len := 5;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'synppefs';
      fieldname.len := 8;
      typecode := 119;
   END;
   result^.typeindicator := EnumSet;
   FOR synppefs:=synASIFSENT TO synDONP_OPENINFSENT DO BEGIN
      IF synppefs IN rec.synppefs THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_synpatterntype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,synppefs);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'thetapp';
      fieldname.len := 7;
      typecode := 78;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_thetapptype( result^.fieldvalue.str, result^.fieldvalue.len, rec.thetapp);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'headkey';
      fieldname.len := 7;
      typecode := 2;
   END;
   result^.typeindicator := Int;
   STR_IntegerToStr( rec.headkey, result^.fieldvalue.str, result^.fieldvalue.len);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'class';
      fieldname.len := 5;
      typecode := 80;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_timeadvclasstype( result^.fieldvalue.str, result^.fieldvalue.len, rec.class);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'deixis';
      fieldname.len := 6;
      typecode := 46;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_deixistype( result^.fieldvalue.str, result^.fieldvalue.len, rec.deixis);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'aspect';
      fieldname.len := 6;
      typecode := 34;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_aspecttype( result^.fieldvalue.str, result^.fieldvalue.len, rec.aspect);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'retro';
      fieldname.len := 5;
      typecode := 19;
   END;
   result^.typeindicator := Bool;
   IF rec.retro = TRUE THEN BEGIN
      result^.fieldvalue.str := 'TRUE';
      result^.fieldvalue.len := 4;
      END
   ELSE BEGIN
      result^.fieldvalue.str := 'FALSE';
      result^.fieldvalue.len := 5;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'aktionsarts';
      fieldname.len := 11;
      typecode := 95;
   END;
   result^.typeindicator := EnumSet;
   FOR aktionsarts:=stative TO achievement DO BEGIN
      IF aktionsarts IN rec.aktionsarts THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_aktionsarttype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,aktionsarts);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'superdeixis';
      fieldname.len := 11;
      typecode := 46;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_deixistype( result^.fieldvalue.str, result^.fieldvalue.len, rec.superdeixis);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'specQ';
      fieldname.len := 5;
      typecode := 69;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_specqtype( result^.fieldvalue.str, result^.fieldvalue.len, rec.specQ);
   LSCONVREC_PREPPPROPVARrecord := result;
END {LSCONVREC_PREPPPROPVARrecord};

FUNCTION LSCONVREC_BPROPERNOUNrecord(rec: LSDOMAINT_BPROPERNOUNrecord): LDCONVREC_pAttrStruct;
VAR result : LDCONVREC_pAttrStruct;
    plurforms : LSDOMAINT_plurformtype; 
    sexes : LSDOMAINT_sextype; 
    genders : LSDOMAINT_gendertype; 
BEGIN
   result := NIL;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'KEY';
      fieldname.len := 3;
      typecode := 0;
      typeindicator := Int;
      STR_IntegerToStr(rec.KEY,  fieldvalue.str, fieldvalue.len);
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'plurforms';
      fieldname.len := 9;
      typecode := 110;
   END;
   result^.typeindicator := EnumSet;
   FOR plurforms:=onlyplur TO singandplur DO BEGIN
      IF plurforms IN rec.plurforms THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_plurformtype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,plurforms);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'sexes';
      fieldname.len := 5;
      typecode := 117;
   END;
   result^.typeindicator := EnumSet;
   FOR sexes:=masculine TO feminine DO BEGIN
      IF sexes IN rec.sexes THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_sextype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,sexes);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'subc';
      fieldname.len := 4;
      typecode := 57;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_nounsubctype( result^.fieldvalue.str, result^.fieldvalue.len, rec.subc);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'animate';
      fieldname.len := 7;
      typecode := 32;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_animatetype( result^.fieldvalue.str, result^.fieldvalue.len, rec.animate);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'human';
      fieldname.len := 5;
      typecode := 52;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_humantype( result^.fieldvalue.str, result^.fieldvalue.len, rec.human);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'genders';
      fieldname.len := 7;
      typecode := 104;
   END;
   result^.typeindicator := EnumSet;
   FOR genders:=femininegender TO omegagender DO BEGIN
      IF genders IN rec.genders THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_gendertype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,genders);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'poss';
      fieldname.len := 4;
      typecode := 16;
   END;
   result^.typeindicator := Bool;
   IF rec.poss = TRUE THEN BEGIN
      result^.fieldvalue.str := 'TRUE';
      result^.fieldvalue.len := 4;
      END
   ELSE BEGIN
      result^.fieldvalue.str := 'FALSE';
      result^.fieldvalue.len := 5;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'temporal';
      fieldname.len := 8;
      typecode := 23;
   END;
   result^.typeindicator := Bool;
   IF rec.temporal = TRUE THEN BEGIN
      result^.fieldvalue.str := 'TRUE';
      result^.fieldvalue.len := 4;
      END
   ELSE BEGIN
      result^.fieldvalue.str := 'FALSE';
      result^.fieldvalue.len := 5;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'class';
      fieldname.len := 5;
      typecode := 80;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_timeadvclasstype( result^.fieldvalue.str, result^.fieldvalue.len, rec.class);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'deixis';
      fieldname.len := 6;
      typecode := 46;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_deixistype( result^.fieldvalue.str, result^.fieldvalue.len, rec.deixis);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'aspect';
      fieldname.len := 6;
      typecode := 34;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_aspecttype( result^.fieldvalue.str, result^.fieldvalue.len, rec.aspect);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'retro';
      fieldname.len := 5;
      typecode := 19;
   END;
   result^.typeindicator := Bool;
   IF rec.retro = TRUE THEN BEGIN
      result^.fieldvalue.str := 'TRUE';
      result^.fieldvalue.len := 4;
      END
   ELSE BEGIN
      result^.fieldvalue.str := 'FALSE';
      result^.fieldvalue.len := 5;
   END;
   LSCONVREC_BPROPERNOUNrecord := result;
END {LSCONVREC_BPROPERNOUNrecord};

FUNCTION LSCONVREC_PROPERNOUNrecord(rec: LSDOMAINT_PROPERNOUNrecord): LDCONVREC_pAttrStruct;
VAR result : LDCONVREC_pAttrStruct;
    plurforms : LSDOMAINT_plurformtype; 
    numbers : LSDOMAINT_numbertype; 
    sexes : LSDOMAINT_sextype; 
    genders : LSDOMAINT_gendertype; 
BEGIN
   result := NIL;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'plurforms';
      fieldname.len := 9;
      typecode := 110;
   END;
   result^.typeindicator := EnumSet;
   FOR plurforms:=onlyplur TO singandplur DO BEGIN
      IF plurforms IN rec.plurforms THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_plurformtype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,plurforms);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'numbers';
      fieldname.len := 7;
      typecode := 108;
   END;
   result^.typeindicator := EnumSet;
   FOR numbers:=singular TO omeganumber DO BEGIN
      IF numbers IN rec.numbers THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_numbertype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,numbers);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'sexes';
      fieldname.len := 5;
      typecode := 117;
   END;
   result^.typeindicator := EnumSet;
   FOR sexes:=masculine TO feminine DO BEGIN
      IF sexes IN rec.sexes THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_sextype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,sexes);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'subc';
      fieldname.len := 4;
      typecode := 57;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_nounsubctype( result^.fieldvalue.str, result^.fieldvalue.len, rec.subc);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'animate';
      fieldname.len := 7;
      typecode := 32;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_animatetype( result^.fieldvalue.str, result^.fieldvalue.len, rec.animate);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'human';
      fieldname.len := 5;
      typecode := 52;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_humantype( result^.fieldvalue.str, result^.fieldvalue.len, rec.human);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'genders';
      fieldname.len := 7;
      typecode := 104;
   END;
   result^.typeindicator := EnumSet;
   FOR genders:=femininegender TO omegagender DO BEGIN
      IF genders IN rec.genders THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_gendertype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,genders);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'poss';
      fieldname.len := 4;
      typecode := 16;
   END;
   result^.typeindicator := Bool;
   IF rec.poss = TRUE THEN BEGIN
      result^.fieldvalue.str := 'TRUE';
      result^.fieldvalue.len := 4;
      END
   ELSE BEGIN
      result^.fieldvalue.str := 'FALSE';
      result^.fieldvalue.len := 5;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'temporal';
      fieldname.len := 8;
      typecode := 23;
   END;
   result^.typeindicator := Bool;
   IF rec.temporal = TRUE THEN BEGIN
      result^.fieldvalue.str := 'TRUE';
      result^.fieldvalue.len := 4;
      END
   ELSE BEGIN
      result^.fieldvalue.str := 'FALSE';
      result^.fieldvalue.len := 5;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'class';
      fieldname.len := 5;
      typecode := 80;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_timeadvclasstype( result^.fieldvalue.str, result^.fieldvalue.len, rec.class);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'deixis';
      fieldname.len := 6;
      typecode := 46;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_deixistype( result^.fieldvalue.str, result^.fieldvalue.len, rec.deixis);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'aspect';
      fieldname.len := 6;
      typecode := 34;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_aspecttype( result^.fieldvalue.str, result^.fieldvalue.len, rec.aspect);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'retro';
      fieldname.len := 5;
      typecode := 19;
   END;
   result^.typeindicator := Bool;
   IF rec.retro = TRUE THEN BEGIN
      result^.fieldvalue.str := 'TRUE';
      result^.fieldvalue.len := 4;
      END
   ELSE BEGIN
      result^.fieldvalue.str := 'FALSE';
      result^.fieldvalue.len := 5;
   END;
   LSCONVREC_PROPERNOUNrecord := result;
END {LSCONVREC_PROPERNOUNrecord};

FUNCTION LSCONVREC_PROSENTrecord(rec: LSDOMAINT_PROSENTrecord): LDCONVREC_pAttrStruct;
VAR result : LDCONVREC_pAttrStruct;
BEGIN
   result := NIL;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'KEY';
      fieldname.len := 3;
      typecode := 0;
      typeindicator := Int;
      STR_IntegerToStr(rec.KEY,  fieldvalue.str, fieldvalue.len);
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'neg';
      fieldname.len := 3;
      typecode := 10;
   END;
   result^.typeindicator := Bool;
   IF rec.neg = TRUE THEN BEGIN
      result^.fieldvalue.str := 'TRUE';
      result^.fieldvalue.len := 4;
      END
   ELSE BEGIN
      result^.fieldvalue.str := 'FALSE';
      result^.fieldvalue.len := 5;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'so';
      fieldname.len := 2;
      typecode := 21;
   END;
   result^.typeindicator := Bool;
   IF rec.so = TRUE THEN BEGIN
      result^.fieldvalue.str := 'TRUE';
      result^.fieldvalue.len := 4;
      END
   ELSE BEGIN
      result^.fieldvalue.str := 'FALSE';
      result^.fieldvalue.len := 5;
   END;
   LSCONVREC_PROSENTrecord := result;
END {LSCONVREC_PROSENTrecord};

FUNCTION LSCONVREC_PROSENTVARrecord(rec: LSDOMAINT_PROSENTVARrecord): LDCONVREC_pAttrStruct;
VAR result : LDCONVREC_pAttrStruct;
BEGIN
   result := NIL;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'INDEX';
      fieldname.len := 5;
      typecode := 0;
      typeindicator := Int;
      STR_IntegerToStr(rec.INDEX,  fieldvalue.str, fieldvalue.len);
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'neg';
      fieldname.len := 3;
      typecode := 10;
   END;
   result^.typeindicator := Bool;
   IF rec.neg = TRUE THEN BEGIN
      result^.fieldvalue.str := 'TRUE';
      result^.fieldvalue.len := 4;
      END
   ELSE BEGIN
      result^.fieldvalue.str := 'FALSE';
      result^.fieldvalue.len := 5;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'so';
      fieldname.len := 2;
      typecode := 21;
   END;
   result^.typeindicator := Bool;
   IF rec.so = TRUE THEN BEGIN
      result^.fieldvalue.str := 'TRUE';
      result^.fieldvalue.len := 4;
      END
   ELSE BEGIN
      result^.fieldvalue.str := 'FALSE';
      result^.fieldvalue.len := 5;
   END;
   LSCONVREC_PROSENTVARrecord := result;
END {LSCONVREC_PROSENTVARrecord};

FUNCTION LSCONVREC_PUNCrecord(rec: LSDOMAINT_PUNCrecord): LDCONVREC_pAttrStruct;
VAR result : LDCONVREC_pAttrStruct;
BEGIN
   result := NIL;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'KEY';
      fieldname.len := 3;
      typecode := 0;
      typeindicator := Int;
      STR_IntegerToStr(rec.KEY,  fieldvalue.str, fieldvalue.len);
   END;
   LSCONVREC_PUNCrecord := result;
END {LSCONVREC_PUNCrecord};

FUNCTION LSCONVREC_Qrecord(rec: LSDOMAINT_Qrecord): LDCONVREC_pAttrStruct;
VAR result : LDCONVREC_pAttrStruct;
    req : LSDOMAINT_polaritytype; 
    env : LSDOMAINT_polaritytype; 
    possnumbers : LSDOMAINT_numbertype; 
    posscomas : LSDOMAINT_posscomatype; 
BEGIN
   result := NIL;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'KEY';
      fieldname.len := 3;
      typecode := 0;
      typeindicator := Int;
      STR_IntegerToStr(rec.KEY,  fieldvalue.str, fieldvalue.len);
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'req';
      fieldname.len := 3;
      typecode := 112;
   END;
   result^.typeindicator := EnumSet;
   FOR req:=pospol TO omegapol DO BEGIN
      IF req IN rec.req THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_polaritytype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,req);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'env';
      fieldname.len := 3;
      typecode := 112;
   END;
   result^.typeindicator := EnumSet;
   FOR env:=pospol TO omegapol DO BEGIN
      IF env IN rec.env THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_polaritytype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,env);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'definite';
      fieldname.len := 8;
      typecode := 45;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_deftype( result^.fieldvalue.str, result^.fieldvalue.len, rec.definite);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'posspred';
      fieldname.len := 8;
      typecode := 15;
   END;
   result^.typeindicator := Bool;
   IF rec.posspred = TRUE THEN BEGIN
      result^.fieldvalue.str := 'TRUE';
      result^.fieldvalue.len := 4;
      END
   ELSE BEGIN
      result^.fieldvalue.str := 'FALSE';
      result^.fieldvalue.len := 5;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'possnumbers';
      fieldname.len := 11;
      typecode := 108;
   END;
   result^.typeindicator := EnumSet;
   FOR possnumbers:=singular TO omeganumber DO BEGIN
      IF possnumbers IN rec.possnumbers THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_numbertype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,possnumbers);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'posscomas';
      fieldname.len := 9;
      typecode := 114;
   END;
   result^.typeindicator := EnumSet;
   FOR posscomas:=count TO mass DO BEGIN
      IF posscomas IN rec.posscomas THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_posscomatype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,posscomas);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'mood';
      fieldname.len := 4;
      typecode := 83;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_xpmoodtype( result^.fieldvalue.str, result^.fieldvalue.len, rec.mood);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'thanas';
      fieldname.len := 6;
      typecode := 73;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_thanascompltype( result^.fieldvalue.str, result^.fieldvalue.len, rec.thanas);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'hop';
      fieldname.len := 3;
      typecode := 7;
   END;
   result^.typeindicator := Bool;
   IF rec.hop = TRUE THEN BEGIN
      result^.fieldvalue.str := 'TRUE';
      result^.fieldvalue.len := 4;
      END
   ELSE BEGIN
      result^.fieldvalue.str := 'FALSE';
      result^.fieldvalue.len := 5;
   END;
   LSCONVREC_Qrecord := result;
END {LSCONVREC_Qrecord};

FUNCTION LSCONVREC_QPrecord(rec: LSDOMAINT_QPrecord): LDCONVREC_pAttrStruct;
VAR result : LDCONVREC_pAttrStruct;
    req : LSDOMAINT_polaritytype; 
    env : LSDOMAINT_polaritytype; 
    possnumbers : LSDOMAINT_numbertype; 
    posscomas : LSDOMAINT_posscomatype; 
BEGIN
   result := NIL;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'req';
      fieldname.len := 3;
      typecode := 112;
   END;
   result^.typeindicator := EnumSet;
   FOR req:=pospol TO omegapol DO BEGIN
      IF req IN rec.req THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_polaritytype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,req);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'env';
      fieldname.len := 3;
      typecode := 112;
   END;
   result^.typeindicator := EnumSet;
   FOR env:=pospol TO omegapol DO BEGIN
      IF env IN rec.env THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_polaritytype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,env);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'definite';
      fieldname.len := 8;
      typecode := 45;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_deftype( result^.fieldvalue.str, result^.fieldvalue.len, rec.definite);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'posspred';
      fieldname.len := 8;
      typecode := 15;
   END;
   result^.typeindicator := Bool;
   IF rec.posspred = TRUE THEN BEGIN
      result^.fieldvalue.str := 'TRUE';
      result^.fieldvalue.len := 4;
      END
   ELSE BEGIN
      result^.fieldvalue.str := 'FALSE';
      result^.fieldvalue.len := 5;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'possnumbers';
      fieldname.len := 11;
      typecode := 108;
   END;
   result^.typeindicator := EnumSet;
   FOR possnumbers:=singular TO omeganumber DO BEGIN
      IF possnumbers IN rec.possnumbers THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_numbertype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,possnumbers);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'posscomas';
      fieldname.len := 9;
      typecode := 114;
   END;
   result^.typeindicator := EnumSet;
   FOR posscomas:=count TO mass DO BEGIN
      IF posscomas IN rec.posscomas THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_posscomatype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,posscomas);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'mood';
      fieldname.len := 4;
      typecode := 83;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_xpmoodtype( result^.fieldvalue.str, result^.fieldvalue.len, rec.mood);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'hop';
      fieldname.len := 3;
      typecode := 7;
   END;
   result^.typeindicator := Bool;
   IF rec.hop = TRUE THEN BEGIN
      result^.fieldvalue.str := 'TRUE';
      result^.fieldvalue.len := 4;
      END
   ELSE BEGIN
      result^.fieldvalue.str := 'FALSE';
      result^.fieldvalue.len := 5;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'thanas';
      fieldname.len := 6;
      typecode := 73;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_thanascompltype( result^.fieldvalue.str, result^.fieldvalue.len, rec.thanas);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'thanascompl';
      fieldname.len := 11;
      typecode := 5;
   END;
   result^.typeindicator := Bool;
   IF rec.thanascompl = TRUE THEN BEGIN
      result^.fieldvalue.str := 'TRUE';
      result^.fieldvalue.len := 4;
      END
   ELSE BEGIN
      result^.fieldvalue.str := 'FALSE';
      result^.fieldvalue.len := 5;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'superdeixis';
      fieldname.len := 11;
      typecode := 46;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_deixistype( result^.fieldvalue.str, result^.fieldvalue.len, rec.superdeixis);
   LSCONVREC_QPrecord := result;
END {LSCONVREC_QPrecord};

FUNCTION LSCONVREC_RECIPROrecord(rec: LSDOMAINT_RECIPROrecord): LDCONVREC_pAttrStruct;
VAR result : LDCONVREC_pAttrStruct;
BEGIN
   result := NIL;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'KEY';
      fieldname.len := 3;
      typecode := 0;
      typeindicator := Int;
      STR_IntegerToStr(rec.KEY,  fieldvalue.str, fieldvalue.len);
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'antecedent';
      fieldname.len := 10;
      typecode := 33;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_antecedenttype( result^.fieldvalue.str, result^.fieldvalue.len, rec.antecedent);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'one';
      fieldname.len := 3;
      typecode := 12;
   END;
   result^.typeindicator := Bool;
   IF rec.one = TRUE THEN BEGIN
      result^.fieldvalue.str := 'TRUE';
      result^.fieldvalue.len := 4;
      END
   ELSE BEGIN
      result^.fieldvalue.str := 'FALSE';
      result^.fieldvalue.len := 5;
   END;
   LSCONVREC_RECIPROrecord := result;
END {LSCONVREC_RECIPROrecord};

FUNCTION LSCONVREC_REFLPROrecord(rec: LSDOMAINT_REFLPROrecord): LDCONVREC_pAttrStruct;
VAR result : LDCONVREC_pAttrStruct;
BEGIN
   result := NIL;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'KEY';
      fieldname.len := 3;
      typecode := 0;
      typeindicator := Int;
      STR_IntegerToStr(rec.KEY,  fieldvalue.str, fieldvalue.len);
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'antecedent';
      fieldname.len := 10;
      typecode := 33;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_antecedenttype( result^.fieldvalue.str, result^.fieldvalue.len, rec.antecedent);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'number';
      fieldname.len := 6;
      typecode := 59;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_numbertype( result^.fieldvalue.str, result^.fieldvalue.len, rec.number);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'person';
      fieldname.len := 6;
      typecode := 85;
   END;
   result^.typeindicator := SubRange;
   LSTYPETOSTR_persontype( result^.fieldvalue.str, result^.fieldvalue.len, rec.person);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'gender';
      fieldname.len := 6;
      typecode := 49;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_gendertype( result^.fieldvalue.str, result^.fieldvalue.len, rec.gender);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'one';
      fieldname.len := 3;
      typecode := 12;
   END;
   result^.typeindicator := Bool;
   IF rec.one = TRUE THEN BEGIN
      result^.fieldvalue.str := 'TRUE';
      result^.fieldvalue.len := 4;
      END
   ELSE BEGIN
      result^.fieldvalue.str := 'FALSE';
      result^.fieldvalue.len := 5;
   END;
   LSCONVREC_REFLPROrecord := result;
END {LSCONVREC_REFLPROrecord};

FUNCTION LSCONVREC_RELPROrecord(rec: LSDOMAINT_RELPROrecord): LDCONVREC_pAttrStruct;
VAR result : LDCONVREC_pAttrStruct;
BEGIN
   result := NIL;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'KEY';
      fieldname.len := 3;
      typecode := 0;
      typeindicator := Int;
      STR_IntegerToStr(rec.KEY,  fieldvalue.str, fieldvalue.len);
   END;
   LSCONVREC_RELPROrecord := result;
END {LSCONVREC_RELPROrecord};

FUNCTION LSCONVREC_SENTENCErecord(rec: LSDOMAINT_SENTENCErecord): LDCONVREC_pAttrStruct;
VAR result : LDCONVREC_pAttrStruct;
    req : LSDOMAINT_polaritytype; 
    env : LSDOMAINT_polaritytype; 
    synvpefs : LSDOMAINT_synpatterntype; 
    adjuncts : LSDOMAINT_adjuncttype; 
    aktionsarts : LSDOMAINT_aktionsarttype; 
BEGIN
   result := NIL;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'req';
      fieldname.len := 3;
      typecode := 112;
   END;
   result^.typeindicator := EnumSet;
   FOR req:=pospol TO omegapol DO BEGIN
      IF req IN rec.req THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_polaritytype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,req);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'env';
      fieldname.len := 3;
      typecode := 112;
   END;
   result^.typeindicator := EnumSet;
   FOR env:=pospol TO omegapol DO BEGIN
      IF env IN rec.env THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_polaritytype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,env);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'mood';
      fieldname.len := 4;
      typecode := 56;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_moodtype( result^.fieldvalue.str, result^.fieldvalue.len, rec.mood);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'senttype';
      fieldname.len := 8;
      typecode := 66;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_senttypetype( result^.fieldvalue.str, result^.fieldvalue.len, rec.senttype);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'voice';
      fieldname.len := 5;
      typecode := 82;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_voicetype( result^.fieldvalue.str, result^.fieldvalue.len, rec.voice);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'PROsubject';
      fieldname.len := 10;
      typecode := 18;
   END;
   result^.typeindicator := Bool;
   IF rec.PROsubject = TRUE THEN BEGIN
      result^.fieldvalue.str := 'TRUE';
      result^.fieldvalue.len := 4;
      END
   ELSE BEGIN
      result^.fieldvalue.str := 'FALSE';
      result^.fieldvalue.len := 5;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'synvpefs';
      fieldname.len := 8;
      typecode := 119;
   END;
   result^.typeindicator := EnumSet;
   FOR synvpefs:=synASIFSENT TO synDONP_OPENINFSENT DO BEGIN
      IF synvpefs IN rec.synvpefs THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_synpatterntype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,synvpefs);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'thetavp';
      fieldname.len := 7;
      typecode := 79;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_thetavptype( result^.fieldvalue.str, result^.fieldvalue.len, rec.thetavp);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'adjuncts';
      fieldname.len := 8;
      typecode := 90;
   END;
   result^.typeindicator := EnumSet;
   FOR adjuncts:=ResAP TO ResNP DO BEGIN
      IF adjuncts IN rec.adjuncts THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_adjuncttype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,adjuncts);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'modus';
      fieldname.len := 5;
      typecode := 55;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_modustype( result^.fieldvalue.str, result^.fieldvalue.len, rec.modus);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'aktionsarts';
      fieldname.len := 11;
      typecode := 95;
   END;
   result^.typeindicator := EnumSet;
   FOR aktionsarts:=stative TO achievement DO BEGIN
      IF aktionsarts IN rec.aktionsarts THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_aktionsarttype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,aktionsarts);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'aspect';
      fieldname.len := 6;
      typecode := 34;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_aspecttype( result^.fieldvalue.str, result^.fieldvalue.len, rec.aspect);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'deixis';
      fieldname.len := 6;
      typecode := 46;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_deixistype( result^.fieldvalue.str, result^.fieldvalue.len, rec.deixis);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'retro';
      fieldname.len := 5;
      typecode := 19;
   END;
   result^.typeindicator := Bool;
   IF rec.retro = TRUE THEN BEGIN
      result^.fieldvalue.str := 'TRUE';
      result^.fieldvalue.len := 4;
      END
   ELSE BEGIN
      result^.fieldvalue.str := 'FALSE';
      result^.fieldvalue.len := 5;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'finiteness';
      fieldname.len := 10;
      typecode := 48;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_finitenesstype( result^.fieldvalue.str, result^.fieldvalue.len, rec.finiteness);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'infsort';
      fieldname.len := 7;
      typecode := 53;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_inftype( result^.fieldvalue.str, result^.fieldvalue.len, rec.infsort);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'superdeixis';
      fieldname.len := 11;
      typecode := 46;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_deixistype( result^.fieldvalue.str, result^.fieldvalue.len, rec.superdeixis);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'conjkey';
      fieldname.len := 7;
      typecode := 2;
   END;
   result^.typeindicator := Int;
   STR_IntegerToStr( rec.conjkey, result^.fieldvalue.str, result^.fieldvalue.len);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'adverbial';
      fieldname.len := 9;
      typecode := 3;
   END;
   result^.typeindicator := Bool;
   IF rec.adverbial = TRUE THEN BEGIN
      result^.fieldvalue.str := 'TRUE';
      result^.fieldvalue.len := 4;
      END
   ELSE BEGIN
      result^.fieldvalue.str := 'FALSE';
      result^.fieldvalue.len := 5;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'temporal';
      fieldname.len := 8;
      typecode := 23;
   END;
   result^.typeindicator := Bool;
   IF rec.temporal = TRUE THEN BEGIN
      result^.fieldvalue.str := 'TRUE';
      result^.fieldvalue.len := 4;
      END
   ELSE BEGIN
      result^.fieldvalue.str := 'FALSE';
      result^.fieldvalue.len := 5;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'conjclass';
      fieldname.len := 9;
      typecode := 80;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_timeadvclasstype( result^.fieldvalue.str, result^.fieldvalue.len, rec.conjclass);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'conjdeixis';
      fieldname.len := 10;
      typecode := 46;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_deixistype( result^.fieldvalue.str, result^.fieldvalue.len, rec.conjdeixis);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'conjaspect';
      fieldname.len := 10;
      typecode := 34;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_aspecttype( result^.fieldvalue.str, result^.fieldvalue.len, rec.conjaspect);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'conjretro';
      fieldname.len := 9;
      typecode := 19;
   END;
   result^.typeindicator := Bool;
   IF rec.conjretro = TRUE THEN BEGIN
      result^.fieldvalue.str := 'TRUE';
      result^.fieldvalue.len := 4;
      END
   ELSE BEGIN
      result^.fieldvalue.str := 'FALSE';
      result^.fieldvalue.len := 5;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'coord';
      fieldname.len := 5;
      typecode := 44;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_coordtype( result^.fieldvalue.str, result^.fieldvalue.len, rec.coord);
   LSCONVREC_SENTENCErecord := result;
END {LSCONVREC_SENTENCErecord};

FUNCTION LSCONVREC_SENTENCEVARrecord(rec: LSDOMAINT_SENTENCEVARrecord): LDCONVREC_pAttrStruct;
VAR result : LDCONVREC_pAttrStruct;
    req : LSDOMAINT_polaritytype; 
    env : LSDOMAINT_polaritytype; 
    synvpefs : LSDOMAINT_synpatterntype; 
    adjuncts : LSDOMAINT_adjuncttype; 
    aktionsarts : LSDOMAINT_aktionsarttype; 
BEGIN
   result := NIL;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'INDEX';
      fieldname.len := 5;
      typecode := 0;
      typeindicator := Int;
      STR_IntegerToStr(rec.INDEX,  fieldvalue.str, fieldvalue.len);
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'req';
      fieldname.len := 3;
      typecode := 112;
   END;
   result^.typeindicator := EnumSet;
   FOR req:=pospol TO omegapol DO BEGIN
      IF req IN rec.req THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_polaritytype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,req);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'env';
      fieldname.len := 3;
      typecode := 112;
   END;
   result^.typeindicator := EnumSet;
   FOR env:=pospol TO omegapol DO BEGIN
      IF env IN rec.env THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_polaritytype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,env);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'mood';
      fieldname.len := 4;
      typecode := 56;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_moodtype( result^.fieldvalue.str, result^.fieldvalue.len, rec.mood);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'senttype';
      fieldname.len := 8;
      typecode := 66;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_senttypetype( result^.fieldvalue.str, result^.fieldvalue.len, rec.senttype);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'voice';
      fieldname.len := 5;
      typecode := 82;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_voicetype( result^.fieldvalue.str, result^.fieldvalue.len, rec.voice);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'PROsubject';
      fieldname.len := 10;
      typecode := 18;
   END;
   result^.typeindicator := Bool;
   IF rec.PROsubject = TRUE THEN BEGIN
      result^.fieldvalue.str := 'TRUE';
      result^.fieldvalue.len := 4;
      END
   ELSE BEGIN
      result^.fieldvalue.str := 'FALSE';
      result^.fieldvalue.len := 5;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'synvpefs';
      fieldname.len := 8;
      typecode := 119;
   END;
   result^.typeindicator := EnumSet;
   FOR synvpefs:=synASIFSENT TO synDONP_OPENINFSENT DO BEGIN
      IF synvpefs IN rec.synvpefs THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_synpatterntype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,synvpefs);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'thetavp';
      fieldname.len := 7;
      typecode := 79;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_thetavptype( result^.fieldvalue.str, result^.fieldvalue.len, rec.thetavp);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'adjuncts';
      fieldname.len := 8;
      typecode := 90;
   END;
   result^.typeindicator := EnumSet;
   FOR adjuncts:=ResAP TO ResNP DO BEGIN
      IF adjuncts IN rec.adjuncts THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_adjuncttype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,adjuncts);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'modus';
      fieldname.len := 5;
      typecode := 55;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_modustype( result^.fieldvalue.str, result^.fieldvalue.len, rec.modus);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'aktionsarts';
      fieldname.len := 11;
      typecode := 95;
   END;
   result^.typeindicator := EnumSet;
   FOR aktionsarts:=stative TO achievement DO BEGIN
      IF aktionsarts IN rec.aktionsarts THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_aktionsarttype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,aktionsarts);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'aspect';
      fieldname.len := 6;
      typecode := 34;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_aspecttype( result^.fieldvalue.str, result^.fieldvalue.len, rec.aspect);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'deixis';
      fieldname.len := 6;
      typecode := 46;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_deixistype( result^.fieldvalue.str, result^.fieldvalue.len, rec.deixis);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'retro';
      fieldname.len := 5;
      typecode := 19;
   END;
   result^.typeindicator := Bool;
   IF rec.retro = TRUE THEN BEGIN
      result^.fieldvalue.str := 'TRUE';
      result^.fieldvalue.len := 4;
      END
   ELSE BEGIN
      result^.fieldvalue.str := 'FALSE';
      result^.fieldvalue.len := 5;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'finiteness';
      fieldname.len := 10;
      typecode := 48;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_finitenesstype( result^.fieldvalue.str, result^.fieldvalue.len, rec.finiteness);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'infsort';
      fieldname.len := 7;
      typecode := 53;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_inftype( result^.fieldvalue.str, result^.fieldvalue.len, rec.infsort);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'superdeixis';
      fieldname.len := 11;
      typecode := 46;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_deixistype( result^.fieldvalue.str, result^.fieldvalue.len, rec.superdeixis);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'conjkey';
      fieldname.len := 7;
      typecode := 2;
   END;
   result^.typeindicator := Int;
   STR_IntegerToStr( rec.conjkey, result^.fieldvalue.str, result^.fieldvalue.len);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'adverbial';
      fieldname.len := 9;
      typecode := 3;
   END;
   result^.typeindicator := Bool;
   IF rec.adverbial = TRUE THEN BEGIN
      result^.fieldvalue.str := 'TRUE';
      result^.fieldvalue.len := 4;
      END
   ELSE BEGIN
      result^.fieldvalue.str := 'FALSE';
      result^.fieldvalue.len := 5;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'temporal';
      fieldname.len := 8;
      typecode := 23;
   END;
   result^.typeindicator := Bool;
   IF rec.temporal = TRUE THEN BEGIN
      result^.fieldvalue.str := 'TRUE';
      result^.fieldvalue.len := 4;
      END
   ELSE BEGIN
      result^.fieldvalue.str := 'FALSE';
      result^.fieldvalue.len := 5;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'conjclass';
      fieldname.len := 9;
      typecode := 80;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_timeadvclasstype( result^.fieldvalue.str, result^.fieldvalue.len, rec.conjclass);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'conjdeixis';
      fieldname.len := 10;
      typecode := 46;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_deixistype( result^.fieldvalue.str, result^.fieldvalue.len, rec.conjdeixis);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'conjaspect';
      fieldname.len := 10;
      typecode := 34;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_aspecttype( result^.fieldvalue.str, result^.fieldvalue.len, rec.conjaspect);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'conjretro';
      fieldname.len := 9;
      typecode := 19;
   END;
   result^.typeindicator := Bool;
   IF rec.conjretro = TRUE THEN BEGIN
      result^.fieldvalue.str := 'TRUE';
      result^.fieldvalue.len := 4;
      END
   ELSE BEGIN
      result^.fieldvalue.str := 'FALSE';
      result^.fieldvalue.len := 5;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'coord';
      fieldname.len := 5;
      typecode := 44;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_coordtype( result^.fieldvalue.str, result^.fieldvalue.len, rec.coord);
   LSCONVREC_SENTENCEVARrecord := result;
END {LSCONVREC_SENTENCEVARrecord};

FUNCTION LSCONVREC_THANASrecord(rec: LSDOMAINT_THANASrecord): LDCONVREC_pAttrStruct;
VAR result : LDCONVREC_pAttrStruct;
BEGIN
   result := NIL;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'KEY';
      fieldname.len := 3;
      typecode := 0;
      typeindicator := Int;
      STR_IntegerToStr(rec.KEY,  fieldvalue.str, fieldvalue.len);
   END;
   LSCONVREC_THANASrecord := result;
END {LSCONVREC_THANASrecord};

FUNCTION LSCONVREC_THANPrecord(rec: LSDOMAINT_THANPrecord): LDCONVREC_pAttrStruct;
VAR result : LDCONVREC_pAttrStruct;
    req : LSDOMAINT_polaritytype; 
    env : LSDOMAINT_polaritytype; 
BEGIN
   result := NIL;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'thanas';
      fieldname.len := 6;
      typecode := 73;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_thanascompltype( result^.fieldvalue.str, result^.fieldvalue.len, rec.thanas);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'req';
      fieldname.len := 3;
      typecode := 112;
   END;
   result^.typeindicator := EnumSet;
   FOR req:=pospol TO omegapol DO BEGIN
      IF req IN rec.req THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_polaritytype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,req);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'env';
      fieldname.len := 3;
      typecode := 112;
   END;
   result^.typeindicator := EnumSet;
   FOR env:=pospol TO omegapol DO BEGIN
      IF env IN rec.env THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_polaritytype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,env);
      END;
   END;
   LSCONVREC_THANPrecord := result;
END {LSCONVREC_THANPrecord};

FUNCTION LSCONVREC_THERErecord(rec: LSDOMAINT_THERErecord): LDCONVREC_pAttrStruct;
VAR result : LDCONVREC_pAttrStruct;
BEGIN
   result := NIL;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'KEY';
      fieldname.len := 3;
      typecode := 0;
      typeindicator := Int;
      STR_IntegerToStr(rec.KEY,  fieldvalue.str, fieldvalue.len);
   END;
   LSCONVREC_THERErecord := result;
END {LSCONVREC_THERErecord};

FUNCTION LSCONVREC_TOCATrecord(rec: LSDOMAINT_TOCATrecord): LDCONVREC_pAttrStruct;
VAR result : LDCONVREC_pAttrStruct;
BEGIN
   result := NIL;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'KEY';
      fieldname.len := 3;
      typecode := 0;
      typeindicator := Int;
      STR_IntegerToStr(rec.KEY,  fieldvalue.str, fieldvalue.len);
   END;
   LSCONVREC_TOCATrecord := result;
END {LSCONVREC_TOCATrecord};

FUNCTION LSCONVREC_BVERBrecord(rec: LSDOMAINT_BVERBrecord): LDCONVREC_pAttrStruct;
VAR result : LDCONVREC_pAttrStruct;
    req : LSDOMAINT_polaritytype; 
    env : LSDOMAINT_polaritytype; 
    conjclasses : LSDOMAINT_conjclasstype; 
    possvoices : LSDOMAINT_voicetype; 
    synvps : LSDOMAINT_synpatterntype; 
    adjuncts : LSDOMAINT_adjuncttype; 
    classes : LSDOMAINT_classtype; 
BEGIN
   result := NIL;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'KEY';
      fieldname.len := 3;
      typecode := 0;
      typeindicator := Int;
      STR_IntegerToStr(rec.KEY,  fieldvalue.str, fieldvalue.len);
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'req';
      fieldname.len := 3;
      typecode := 112;
   END;
   result^.typeindicator := EnumSet;
   FOR req:=pospol TO omegapol DO BEGIN
      IF req IN rec.req THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_polaritytype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,req);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'env';
      fieldname.len := 3;
      typecode := 112;
   END;
   result^.typeindicator := EnumSet;
   FOR env:=pospol TO omegapol DO BEGIN
      IF env IN rec.env THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_polaritytype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,env);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'conjclasses';
      fieldname.len := 11;
      typecode := 100;
   END;
   result^.typeindicator := EnumSet;
   FOR conjclasses:=0 TO 14 DO BEGIN
      IF conjclasses IN rec.conjclasses THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_conjclasstype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,conjclasses);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'ingform';
      fieldname.len := 7;
      typecode := 54;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_ingformtype( result^.fieldvalue.str, result^.fieldvalue.len, rec.ingform);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'sform';
      fieldname.len := 5;
      typecode := 68;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_sformtype( result^.fieldvalue.str, result^.fieldvalue.len, rec.sform);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'particle';
      fieldname.len := 8;
      typecode := 2;
   END;
   result^.typeindicator := Int;
   STR_IntegerToStr( rec.particle, result^.fieldvalue.str, result^.fieldvalue.len);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'possvoices';
      fieldname.len := 10;
      typecode := 121;
   END;
   result^.typeindicator := EnumSet;
   FOR possvoices:=Active TO Omegavoice DO BEGIN
      IF possvoices IN rec.possvoices THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_voicetype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,possvoices);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'reflexivity';
      fieldname.len := 11;
      typecode := 65;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_reflexivetype( result^.fieldvalue.str, result^.fieldvalue.len, rec.reflexivity);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'synvps';
      fieldname.len := 6;
      typecode := 118;
   END;
   result^.typeindicator := EnumSet;
   FOR synvps:=synASIFSENT TO synDONP_OPENINFSENT DO BEGIN
      IF synvps IN rec.synvps THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_synpatterntype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,synvps);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'thetavp';
      fieldname.len := 7;
      typecode := 79;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_thetavptype( result^.fieldvalue.str, result^.fieldvalue.len, rec.thetavp);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'adjuncts';
      fieldname.len := 8;
      typecode := 90;
   END;
   result^.typeindicator := EnumSet;
   FOR adjuncts:=ResAP TO ResNP DO BEGIN
      IF adjuncts IN rec.adjuncts THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_adjuncttype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,adjuncts);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'CaseAssigner';
      fieldname.len := 12;
      typecode := 4;
   END;
   result^.typeindicator := Bool;
   IF rec.CaseAssigner = TRUE THEN BEGIN
      result^.fieldvalue.str := 'TRUE';
      result^.fieldvalue.len := 4;
      END
   ELSE BEGIN
      result^.fieldvalue.str := 'FALSE';
      result^.fieldvalue.len := 5;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'subc';
      fieldname.len := 4;
      typecode := 81;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_verbsubctype( result^.fieldvalue.str, result^.fieldvalue.len, rec.subc);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'oblcontrol';
      fieldname.len := 10;
      typecode := 60;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_oblcontroltype( result^.fieldvalue.str, result^.fieldvalue.len, rec.oblcontrol);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'prepkey1';
      fieldname.len := 8;
      typecode := 2;
   END;
   result^.typeindicator := Int;
   STR_IntegerToStr( rec.prepkey1, result^.fieldvalue.str, result^.fieldvalue.len);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'prepkey2';
      fieldname.len := 8;
      typecode := 2;
   END;
   result^.typeindicator := Int;
   STR_IntegerToStr( rec.prepkey2, result^.fieldvalue.str, result^.fieldvalue.len);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'controller';
      fieldname.len := 10;
      typecode := 41;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_controllertype( result^.fieldvalue.str, result^.fieldvalue.len, rec.controller);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'classes';
      fieldname.len := 7;
      typecode := 98;
   END;
   result^.typeindicator := EnumSet;
   FOR classes:=stativeclass TO iterativeclass DO BEGIN
      IF classes IN rec.classes THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_classtype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,classes);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'thatdel';
      fieldname.len := 7;
      typecode := 74;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_thatdeltype( result^.fieldvalue.str, result^.fieldvalue.len, rec.thatdel);
   LSCONVREC_BVERBrecord := result;
END {LSCONVREC_BVERBrecord};

FUNCTION LSCONVREC_SUBVERBrecord(rec: LSDOMAINT_SUBVERBrecord): LDCONVREC_pAttrStruct;
VAR result : LDCONVREC_pAttrStruct;
    req : LSDOMAINT_polaritytype; 
    env : LSDOMAINT_polaritytype; 
    conjclasses : LSDOMAINT_conjclasstype; 
    possvoices : LSDOMAINT_voicetype; 
    synvps : LSDOMAINT_synpatterntype; 
    adjuncts : LSDOMAINT_adjuncttype; 
    classes : LSDOMAINT_classtype; 
BEGIN
   result := NIL;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'req';
      fieldname.len := 3;
      typecode := 112;
   END;
   result^.typeindicator := EnumSet;
   FOR req:=pospol TO omegapol DO BEGIN
      IF req IN rec.req THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_polaritytype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,req);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'env';
      fieldname.len := 3;
      typecode := 112;
   END;
   result^.typeindicator := EnumSet;
   FOR env:=pospol TO omegapol DO BEGIN
      IF env IN rec.env THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_polaritytype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,env);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'conjclasses';
      fieldname.len := 11;
      typecode := 100;
   END;
   result^.typeindicator := EnumSet;
   FOR conjclasses:=0 TO 14 DO BEGIN
      IF conjclasses IN rec.conjclasses THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_conjclasstype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,conjclasses);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'ingform';
      fieldname.len := 7;
      typecode := 54;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_ingformtype( result^.fieldvalue.str, result^.fieldvalue.len, rec.ingform);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'sform';
      fieldname.len := 5;
      typecode := 68;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_sformtype( result^.fieldvalue.str, result^.fieldvalue.len, rec.sform);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'affix';
      fieldname.len := 5;
      typecode := 30;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_affixtype( result^.fieldvalue.str, result^.fieldvalue.len, rec.affix);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'particle';
      fieldname.len := 8;
      typecode := 2;
   END;
   result^.typeindicator := Int;
   STR_IntegerToStr( rec.particle, result^.fieldvalue.str, result^.fieldvalue.len);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'possvoices';
      fieldname.len := 10;
      typecode := 121;
   END;
   result^.typeindicator := EnumSet;
   FOR possvoices:=Active TO Omegavoice DO BEGIN
      IF possvoices IN rec.possvoices THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_voicetype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,possvoices);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'reflexivity';
      fieldname.len := 11;
      typecode := 65;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_reflexivetype( result^.fieldvalue.str, result^.fieldvalue.len, rec.reflexivity);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'synvps';
      fieldname.len := 6;
      typecode := 118;
   END;
   result^.typeindicator := EnumSet;
   FOR synvps:=synASIFSENT TO synDONP_OPENINFSENT DO BEGIN
      IF synvps IN rec.synvps THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_synpatterntype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,synvps);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'thetavp';
      fieldname.len := 7;
      typecode := 79;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_thetavptype( result^.fieldvalue.str, result^.fieldvalue.len, rec.thetavp);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'adjuncts';
      fieldname.len := 8;
      typecode := 90;
   END;
   result^.typeindicator := EnumSet;
   FOR adjuncts:=ResAP TO ResNP DO BEGIN
      IF adjuncts IN rec.adjuncts THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_adjuncttype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,adjuncts);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'CaseAssigner';
      fieldname.len := 12;
      typecode := 4;
   END;
   result^.typeindicator := Bool;
   IF rec.CaseAssigner = TRUE THEN BEGIN
      result^.fieldvalue.str := 'TRUE';
      result^.fieldvalue.len := 4;
      END
   ELSE BEGIN
      result^.fieldvalue.str := 'FALSE';
      result^.fieldvalue.len := 5;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'subc';
      fieldname.len := 4;
      typecode := 81;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_verbsubctype( result^.fieldvalue.str, result^.fieldvalue.len, rec.subc);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'oblcontrol';
      fieldname.len := 10;
      typecode := 60;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_oblcontroltype( result^.fieldvalue.str, result^.fieldvalue.len, rec.oblcontrol);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'prepkey1';
      fieldname.len := 8;
      typecode := 2;
   END;
   result^.typeindicator := Int;
   STR_IntegerToStr( rec.prepkey1, result^.fieldvalue.str, result^.fieldvalue.len);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'prepkey2';
      fieldname.len := 8;
      typecode := 2;
   END;
   result^.typeindicator := Int;
   STR_IntegerToStr( rec.prepkey2, result^.fieldvalue.str, result^.fieldvalue.len);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'controller';
      fieldname.len := 10;
      typecode := 41;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_controllertype( result^.fieldvalue.str, result^.fieldvalue.len, rec.controller);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'classes';
      fieldname.len := 7;
      typecode := 98;
   END;
   result^.typeindicator := EnumSet;
   FOR classes:=stativeclass TO iterativeclass DO BEGIN
      IF classes IN rec.classes THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_classtype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,classes);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'thatdel';
      fieldname.len := 7;
      typecode := 74;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_thatdeltype( result^.fieldvalue.str, result^.fieldvalue.len, rec.thatdel);
   LSCONVREC_SUBVERBrecord := result;
END {LSCONVREC_SUBVERBrecord};

FUNCTION LSCONVREC_VERBrecord(rec: LSDOMAINT_VERBrecord): LDCONVREC_pAttrStruct;
VAR result : LDCONVREC_pAttrStruct;
    req : LSDOMAINT_polaritytype; 
    env : LSDOMAINT_polaritytype; 
    conjclasses : LSDOMAINT_conjclasstype; 
    persons : LSDOMAINT_persontype; 
    numbers : LSDOMAINT_numbertype; 
    possvoices : LSDOMAINT_voicetype; 
    synvps : LSDOMAINT_synpatterntype; 
    adjuncts : LSDOMAINT_adjuncttype; 
    classes : LSDOMAINT_classtype; 
BEGIN
   result := NIL;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'req';
      fieldname.len := 3;
      typecode := 112;
   END;
   result^.typeindicator := EnumSet;
   FOR req:=pospol TO omegapol DO BEGIN
      IF req IN rec.req THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_polaritytype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,req);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'env';
      fieldname.len := 3;
      typecode := 112;
   END;
   result^.typeindicator := EnumSet;
   FOR env:=pospol TO omegapol DO BEGIN
      IF env IN rec.env THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_polaritytype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,env);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'conjclasses';
      fieldname.len := 11;
      typecode := 100;
   END;
   result^.typeindicator := EnumSet;
   FOR conjclasses:=0 TO 14 DO BEGIN
      IF conjclasses IN rec.conjclasses THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_conjclasstype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,conjclasses);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'ingform';
      fieldname.len := 7;
      typecode := 54;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_ingformtype( result^.fieldvalue.str, result^.fieldvalue.len, rec.ingform);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'sform';
      fieldname.len := 5;
      typecode := 68;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_sformtype( result^.fieldvalue.str, result^.fieldvalue.len, rec.sform);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'affix';
      fieldname.len := 5;
      typecode := 30;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_affixtype( result^.fieldvalue.str, result^.fieldvalue.len, rec.affix);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'modus';
      fieldname.len := 5;
      typecode := 55;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_modustype( result^.fieldvalue.str, result^.fieldvalue.len, rec.modus);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'tense';
      fieldname.len := 5;
      typecode := 72;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_tensetype( result^.fieldvalue.str, result^.fieldvalue.len, rec.tense);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'persons';
      fieldname.len := 7;
      typecode := 109;
   END;
   result^.typeindicator := EnumSet;
   FOR persons:=1 TO 3 DO BEGIN
      IF persons IN rec.persons THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_persontype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,persons);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'numbers';
      fieldname.len := 7;
      typecode := 108;
   END;
   result^.typeindicator := EnumSet;
   FOR numbers:=singular TO omeganumber DO BEGIN
      IF numbers IN rec.numbers THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_numbertype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,numbers);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'particle';
      fieldname.len := 8;
      typecode := 2;
   END;
   result^.typeindicator := Int;
   STR_IntegerToStr( rec.particle, result^.fieldvalue.str, result^.fieldvalue.len);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'possvoices';
      fieldname.len := 10;
      typecode := 121;
   END;
   result^.typeindicator := EnumSet;
   FOR possvoices:=Active TO Omegavoice DO BEGIN
      IF possvoices IN rec.possvoices THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_voicetype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,possvoices);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'reflexivity';
      fieldname.len := 11;
      typecode := 65;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_reflexivetype( result^.fieldvalue.str, result^.fieldvalue.len, rec.reflexivity);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'synvps';
      fieldname.len := 6;
      typecode := 118;
   END;
   result^.typeindicator := EnumSet;
   FOR synvps:=synASIFSENT TO synDONP_OPENINFSENT DO BEGIN
      IF synvps IN rec.synvps THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_synpatterntype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,synvps);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'thetavp';
      fieldname.len := 7;
      typecode := 79;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_thetavptype( result^.fieldvalue.str, result^.fieldvalue.len, rec.thetavp);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'adjuncts';
      fieldname.len := 8;
      typecode := 90;
   END;
   result^.typeindicator := EnumSet;
   FOR adjuncts:=ResAP TO ResNP DO BEGIN
      IF adjuncts IN rec.adjuncts THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_adjuncttype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,adjuncts);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'CaseAssigner';
      fieldname.len := 12;
      typecode := 4;
   END;
   result^.typeindicator := Bool;
   IF rec.CaseAssigner = TRUE THEN BEGIN
      result^.fieldvalue.str := 'TRUE';
      result^.fieldvalue.len := 4;
      END
   ELSE BEGIN
      result^.fieldvalue.str := 'FALSE';
      result^.fieldvalue.len := 5;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'subc';
      fieldname.len := 4;
      typecode := 81;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_verbsubctype( result^.fieldvalue.str, result^.fieldvalue.len, rec.subc);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'oblcontrol';
      fieldname.len := 10;
      typecode := 60;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_oblcontroltype( result^.fieldvalue.str, result^.fieldvalue.len, rec.oblcontrol);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'prepkey1';
      fieldname.len := 8;
      typecode := 2;
   END;
   result^.typeindicator := Int;
   STR_IntegerToStr( rec.prepkey1, result^.fieldvalue.str, result^.fieldvalue.len);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'prepkey2';
      fieldname.len := 8;
      typecode := 2;
   END;
   result^.typeindicator := Int;
   STR_IntegerToStr( rec.prepkey2, result^.fieldvalue.str, result^.fieldvalue.len);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'controller';
      fieldname.len := 10;
      typecode := 41;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_controllertype( result^.fieldvalue.str, result^.fieldvalue.len, rec.controller);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'classes';
      fieldname.len := 7;
      typecode := 98;
   END;
   result^.typeindicator := EnumSet;
   FOR classes:=stativeclass TO iterativeclass DO BEGIN
      IF classes IN rec.classes THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_classtype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,classes);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'thatdel';
      fieldname.len := 7;
      typecode := 74;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_thatdeltype( result^.fieldvalue.str, result^.fieldvalue.len, rec.thatdel);
   LSCONVREC_VERBrecord := result;
END {LSCONVREC_VERBrecord};

FUNCTION LSCONVREC_VERBPrecord(rec: LSDOMAINT_VERBPrecord): LDCONVREC_pAttrStruct;
VAR result : LDCONVREC_pAttrStruct;
    req : LSDOMAINT_polaritytype; 
    env : LSDOMAINT_polaritytype; 
    synvps : LSDOMAINT_synpatterntype; 
    persons : LSDOMAINT_persontype; 
    numbers : LSDOMAINT_numbertype; 
    synvpefs : LSDOMAINT_synpatterntype; 
    adjvpefs : LSDOMAINT_synpatterntype; 
    classes : LSDOMAINT_classtype; 
    foundauxes : LSDOMAINT_auxtype; 
    adjuncts : LSDOMAINT_adjuncttype; 
BEGIN
   result := NIL;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'req';
      fieldname.len := 3;
      typecode := 112;
   END;
   result^.typeindicator := EnumSet;
   FOR req:=pospol TO omegapol DO BEGIN
      IF req IN rec.req THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_polaritytype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,req);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'env';
      fieldname.len := 3;
      typecode := 112;
   END;
   result^.typeindicator := EnumSet;
   FOR env:=pospol TO omegapol DO BEGIN
      IF env IN rec.env THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_polaritytype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,env);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'synvps';
      fieldname.len := 6;
      typecode := 119;
   END;
   result^.typeindicator := EnumSet;
   FOR synvps:=synASIFSENT TO synDONP_OPENINFSENT DO BEGIN
      IF synvps IN rec.synvps THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_synpatterntype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,synvps);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'thetavp';
      fieldname.len := 7;
      typecode := 79;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_thetavptype( result^.fieldvalue.str, result^.fieldvalue.len, rec.thetavp);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'modus';
      fieldname.len := 5;
      typecode := 55;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_modustype( result^.fieldvalue.str, result^.fieldvalue.len, rec.modus);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'persons';
      fieldname.len := 7;
      typecode := 109;
   END;
   result^.typeindicator := EnumSet;
   FOR persons:=1 TO 3 DO BEGIN
      IF persons IN rec.persons THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_persontype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,persons);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'numbers';
      fieldname.len := 7;
      typecode := 108;
   END;
   result^.typeindicator := EnumSet;
   FOR numbers:=singular TO omeganumber DO BEGIN
      IF numbers IN rec.numbers THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_numbertype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,numbers);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'aspect';
      fieldname.len := 6;
      typecode := 34;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_aspecttype( result^.fieldvalue.str, result^.fieldvalue.len, rec.aspect);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'deixis';
      fieldname.len := 6;
      typecode := 46;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_deixistype( result^.fieldvalue.str, result^.fieldvalue.len, rec.deixis);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'retro';
      fieldname.len := 5;
      typecode := 19;
   END;
   result^.typeindicator := Bool;
   IF rec.retro = TRUE THEN BEGIN
      result^.fieldvalue.str := 'TRUE';
      result^.fieldvalue.len := 4;
      END
   ELSE BEGIN
      result^.fieldvalue.str := 'FALSE';
      result^.fieldvalue.len := 5;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'finiteness';
      fieldname.len := 10;
      typecode := 48;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_finitenesstype( result^.fieldvalue.str, result^.fieldvalue.len, rec.finiteness);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'voice';
      fieldname.len := 5;
      typecode := 82;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_voicetype( result^.fieldvalue.str, result^.fieldvalue.len, rec.voice);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'synvpefs';
      fieldname.len := 8;
      typecode := 119;
   END;
   result^.typeindicator := EnumSet;
   FOR synvpefs:=synASIFSENT TO synDONP_OPENINFSENT DO BEGIN
      IF synvpefs IN rec.synvpefs THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_synpatterntype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,synvpefs);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'adjvpefs';
      fieldname.len := 8;
      typecode := 119;
   END;
   result^.typeindicator := EnumSet;
   FOR adjvpefs:=synASIFSENT TO synDONP_OPENINFSENT DO BEGIN
      IF adjvpefs IN rec.adjvpefs THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_synpatterntype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,adjvpefs);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'classes';
      fieldname.len := 7;
      typecode := 98;
   END;
   result^.typeindicator := EnumSet;
   FOR classes:=stativeclass TO iterativeclass DO BEGIN
      IF classes IN rec.classes THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_classtype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,classes);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'headfound';
      fieldname.len := 9;
      typecode := 6;
   END;
   result^.typeindicator := Bool;
   IF rec.headfound = TRUE THEN BEGIN
      result^.fieldvalue.str := 'TRUE';
      result^.fieldvalue.len := 4;
      END
   ELSE BEGIN
      result^.fieldvalue.str := 'FALSE';
      result^.fieldvalue.len := 5;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'Scomplfound';
      fieldname.len := 11;
      typecode := 6;
   END;
   result^.typeindicator := Bool;
   IF rec.Scomplfound = TRUE THEN BEGIN
      result^.fieldvalue.str := 'TRUE';
      result^.fieldvalue.len := 4;
      END
   ELSE BEGIN
      result^.fieldvalue.str := 'FALSE';
      result^.fieldvalue.len := 5;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'foundauxes';
      fieldname.len := 10;
      typecode := 96;
   END;
   result^.typeindicator := EnumSet;
   FOR foundauxes:=aux TO pass DO BEGIN
      IF foundauxes IN rec.foundauxes THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_auxtype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,foundauxes);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'adjuncts';
      fieldname.len := 8;
      typecode := 90;
   END;
   result^.typeindicator := EnumSet;
   FOR adjuncts:=ResAP TO ResNP DO BEGIN
      IF adjuncts IN rec.adjuncts THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_adjuncttype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,adjuncts);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'reflexivity';
      fieldname.len := 11;
      typecode := 65;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_reflexivetype( result^.fieldvalue.str, result^.fieldvalue.len, rec.reflexivity);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'infsort';
      fieldname.len := 7;
      typecode := 53;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_inftype( result^.fieldvalue.str, result^.fieldvalue.len, rec.infsort);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'objfound';
      fieldname.len := 8;
      typecode := 11;
   END;
   result^.typeindicator := Bool;
   IF rec.objfound = TRUE THEN BEGIN
      result^.fieldvalue.str := 'TRUE';
      result^.fieldvalue.len := 4;
      END
   ELSE BEGIN
      result^.fieldvalue.str := 'FALSE';
      result^.fieldvalue.len := 5;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'indobjfound';
      fieldname.len := 11;
      typecode := 8;
   END;
   result^.typeindicator := Bool;
   IF rec.indobjfound = TRUE THEN BEGIN
      result^.fieldvalue.str := 'TRUE';
      result^.fieldvalue.len := 4;
      END
   ELSE BEGIN
      result^.fieldvalue.str := 'FALSE';
      result^.fieldvalue.len := 5;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'locargfound';
      fieldname.len := 11;
      typecode := 6;
   END;
   result^.typeindicator := Bool;
   IF rec.locargfound = TRUE THEN BEGIN
      result^.fieldvalue.str := 'TRUE';
      result^.fieldvalue.len := 4;
      END
   ELSE BEGIN
      result^.fieldvalue.str := 'FALSE';
      result^.fieldvalue.len := 5;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'dirargfound';
      fieldname.len := 11;
      typecode := 6;
   END;
   result^.typeindicator := Bool;
   IF rec.dirargfound = TRUE THEN BEGIN
      result^.fieldvalue.str := 'TRUE';
      result^.fieldvalue.len := 4;
      END
   ELSE BEGIN
      result^.fieldvalue.str := 'FALSE';
      result^.fieldvalue.len := 5;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'prepobjfound';
      fieldname.len := 12;
      typecode := 6;
   END;
   result^.typeindicator := Bool;
   IF rec.prepobjfound = TRUE THEN BEGIN
      result^.fieldvalue.str := 'TRUE';
      result^.fieldvalue.len := 4;
      END
   ELSE BEGIN
      result^.fieldvalue.str := 'FALSE';
      result^.fieldvalue.len := 5;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'prepobj2found';
      fieldname.len := 13;
      typecode := 6;
   END;
   result^.typeindicator := Bool;
   IF rec.prepobj2found = TRUE THEN BEGIN
      result^.fieldvalue.str := 'TRUE';
      result^.fieldvalue.len := 4;
      END
   ELSE BEGIN
      result^.fieldvalue.str := 'FALSE';
      result^.fieldvalue.len := 5;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'nppredfound';
      fieldname.len := 11;
      typecode := 6;
   END;
   result^.typeindicator := Bool;
   IF rec.nppredfound = TRUE THEN BEGIN
      result^.fieldvalue.str := 'TRUE';
      result^.fieldvalue.len := 4;
      END
   ELSE BEGIN
      result^.fieldvalue.str := 'FALSE';
      result^.fieldvalue.len := 5;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'adjppredfound';
      fieldname.len := 13;
      typecode := 6;
   END;
   result^.typeindicator := Bool;
   IF rec.adjppredfound = TRUE THEN BEGIN
      result^.fieldvalue.str := 'TRUE';
      result^.fieldvalue.len := 4;
      END
   ELSE BEGIN
      result^.fieldvalue.str := 'FALSE';
      result^.fieldvalue.len := 5;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'prepppredfound';
      fieldname.len := 14;
      typecode := 6;
   END;
   result^.typeindicator := Bool;
   IF rec.prepppredfound = TRUE THEN BEGIN
      result^.fieldvalue.str := 'TRUE';
      result^.fieldvalue.len := 4;
      END
   ELSE BEGIN
      result^.fieldvalue.str := 'FALSE';
      result^.fieldvalue.len := 5;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'strandedfound';
      fieldname.len := 13;
      typecode := 6;
   END;
   result^.typeindicator := Bool;
   IF rec.strandedfound = TRUE THEN BEGIN
      result^.fieldvalue.str := 'TRUE';
      result^.fieldvalue.len := 4;
      END
   ELSE BEGIN
      result^.fieldvalue.str := 'FALSE';
      result^.fieldvalue.len := 5;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'vpcomplfound';
      fieldname.len := 12;
      typecode := 6;
   END;
   result^.typeindicator := Bool;
   IF rec.vpcomplfound = TRUE THEN BEGIN
      result^.fieldvalue.str := 'TRUE';
      result^.fieldvalue.len := 4;
      END
   ELSE BEGIN
      result^.fieldvalue.str := 'FALSE';
      result^.fieldvalue.len := 5;
   END;
   LSCONVREC_VERBPrecord := result;
END {LSCONVREC_VERBPrecord};

FUNCTION LSCONVREC_VERBPPROPrecord(rec: LSDOMAINT_VERBPPROPrecord): LDCONVREC_pAttrStruct;
VAR result : LDCONVREC_pAttrStruct;
    req : LSDOMAINT_polaritytype; 
    env : LSDOMAINT_polaritytype; 
    synvpefs : LSDOMAINT_synpatterntype; 
    aktionsarts : LSDOMAINT_aktionsarttype; 
    adjuncts : LSDOMAINT_adjuncttype; 
BEGIN
   result := NIL;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'req';
      fieldname.len := 3;
      typecode := 112;
   END;
   result^.typeindicator := EnumSet;
   FOR req:=pospol TO omegapol DO BEGIN
      IF req IN rec.req THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_polaritytype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,req);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'env';
      fieldname.len := 3;
      typecode := 112;
   END;
   result^.typeindicator := EnumSet;
   FOR env:=pospol TO omegapol DO BEGIN
      IF env IN rec.env THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_polaritytype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,env);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'superdeixis';
      fieldname.len := 11;
      typecode := 46;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_deixistype( result^.fieldvalue.str, result^.fieldvalue.len, rec.superdeixis);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'PROsubject';
      fieldname.len := 10;
      typecode := 18;
   END;
   result^.typeindicator := Bool;
   IF rec.PROsubject = TRUE THEN BEGIN
      result^.fieldvalue.str := 'TRUE';
      result^.fieldvalue.len := 4;
      END
   ELSE BEGIN
      result^.fieldvalue.str := 'FALSE';
      result^.fieldvalue.len := 5;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'voice';
      fieldname.len := 5;
      typecode := 82;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_voicetype( result^.fieldvalue.str, result^.fieldvalue.len, rec.voice);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'synvpefs';
      fieldname.len := 8;
      typecode := 119;
   END;
   result^.typeindicator := EnumSet;
   FOR synvpefs:=synASIFSENT TO synDONP_OPENINFSENT DO BEGIN
      IF synvpefs IN rec.synvpefs THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_synpatterntype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,synvpefs);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'thetavp';
      fieldname.len := 7;
      typecode := 79;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_thetavptype( result^.fieldvalue.str, result^.fieldvalue.len, rec.thetavp);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'aktionsarts';
      fieldname.len := 11;
      typecode := 95;
   END;
   result^.typeindicator := EnumSet;
   FOR aktionsarts:=stative TO achievement DO BEGIN
      IF aktionsarts IN rec.aktionsarts THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_aktionsarttype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,aktionsarts);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'adjuncts';
      fieldname.len := 8;
      typecode := 90;
   END;
   result^.typeindicator := EnumSet;
   FOR adjuncts:=ResAP TO ResNP DO BEGIN
      IF adjuncts IN rec.adjuncts THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_adjuncttype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,adjuncts);
      END;
   END;
   LSCONVREC_VERBPPROPrecord := result;
END {LSCONVREC_VERBPPROPrecord};

FUNCTION LSCONVREC_VERBPPROPVARrecord(rec: LSDOMAINT_VERBPPROPVARrecord): LDCONVREC_pAttrStruct;
VAR result : LDCONVREC_pAttrStruct;
    req : LSDOMAINT_polaritytype; 
    env : LSDOMAINT_polaritytype; 
    synvpefs : LSDOMAINT_synpatterntype; 
    aktionsarts : LSDOMAINT_aktionsarttype; 
    adjuncts : LSDOMAINT_adjuncttype; 
BEGIN
   result := NIL;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'INDEX';
      fieldname.len := 5;
      typecode := 0;
      typeindicator := Int;
      STR_IntegerToStr(rec.INDEX,  fieldvalue.str, fieldvalue.len);
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'req';
      fieldname.len := 3;
      typecode := 112;
   END;
   result^.typeindicator := EnumSet;
   FOR req:=pospol TO omegapol DO BEGIN
      IF req IN rec.req THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_polaritytype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,req);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'env';
      fieldname.len := 3;
      typecode := 112;
   END;
   result^.typeindicator := EnumSet;
   FOR env:=pospol TO omegapol DO BEGIN
      IF env IN rec.env THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_polaritytype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,env);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'superdeixis';
      fieldname.len := 11;
      typecode := 46;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_deixistype( result^.fieldvalue.str, result^.fieldvalue.len, rec.superdeixis);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'PROsubject';
      fieldname.len := 10;
      typecode := 18;
   END;
   result^.typeindicator := Bool;
   IF rec.PROsubject = TRUE THEN BEGIN
      result^.fieldvalue.str := 'TRUE';
      result^.fieldvalue.len := 4;
      END
   ELSE BEGIN
      result^.fieldvalue.str := 'FALSE';
      result^.fieldvalue.len := 5;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'voice';
      fieldname.len := 5;
      typecode := 82;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_voicetype( result^.fieldvalue.str, result^.fieldvalue.len, rec.voice);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'synvpefs';
      fieldname.len := 8;
      typecode := 119;
   END;
   result^.typeindicator := EnumSet;
   FOR synvpefs:=synASIFSENT TO synDONP_OPENINFSENT DO BEGIN
      IF synvpefs IN rec.synvpefs THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_synpatterntype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,synvpefs);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'thetavp';
      fieldname.len := 7;
      typecode := 79;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_thetavptype( result^.fieldvalue.str, result^.fieldvalue.len, rec.thetavp);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'aktionsarts';
      fieldname.len := 11;
      typecode := 95;
   END;
   result^.typeindicator := EnumSet;
   FOR aktionsarts:=stative TO achievement DO BEGIN
      IF aktionsarts IN rec.aktionsarts THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_aktionsarttype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,aktionsarts);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'adjuncts';
      fieldname.len := 8;
      typecode := 90;
   END;
   result^.typeindicator := EnumSet;
   FOR adjuncts:=ResAP TO ResNP DO BEGIN
      IF adjuncts IN rec.adjuncts THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_adjuncttype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,adjuncts);
      END;
   END;
   LSCONVREC_VERBPPROPVARrecord := result;
END {LSCONVREC_VERBPPROPVARrecord};

FUNCTION LSCONVREC_BWHPROrecord(rec: LSDOMAINT_BWHPROrecord): LDCONVREC_pAttrStruct;
VAR result : LDCONVREC_pAttrStruct;
    sexes : LSDOMAINT_sextype; 
BEGIN
   result := NIL;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'KEY';
      fieldname.len := 3;
      typecode := 0;
      typeindicator := Int;
      STR_IntegerToStr(rec.KEY,  fieldvalue.str, fieldvalue.len);
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'animate';
      fieldname.len := 7;
      typecode := 32;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_animatetype( result^.fieldvalue.str, result^.fieldvalue.len, rec.animate);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'poss';
      fieldname.len := 4;
      typecode := 16;
   END;
   result^.typeindicator := Bool;
   IF rec.poss = TRUE THEN BEGIN
      result^.fieldvalue.str := 'TRUE';
      result^.fieldvalue.len := 4;
      END
   ELSE BEGIN
      result^.fieldvalue.str := 'FALSE';
      result^.fieldvalue.len := 5;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'whcase';
      fieldname.len := 6;
      typecode := 24;
   END;
   result^.typeindicator := Bool;
   IF rec.whcase = TRUE THEN BEGIN
      result^.fieldvalue.str := 'TRUE';
      result^.fieldvalue.len := 4;
      END
   ELSE BEGIN
      result^.fieldvalue.str := 'FALSE';
      result^.fieldvalue.len := 5;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'number';
      fieldname.len := 6;
      typecode := 59;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_numbertype( result^.fieldvalue.str, result^.fieldvalue.len, rec.number);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'sexes';
      fieldname.len := 5;
      typecode := 117;
   END;
   result^.typeindicator := EnumSet;
   FOR sexes:=masculine TO feminine DO BEGIN
      IF sexes IN rec.sexes THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_sextype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,sexes);
      END;
   END;
   LSCONVREC_BWHPROrecord := result;
END {LSCONVREC_BWHPROrecord};

FUNCTION LSCONVREC_WHPROrecord(rec: LSDOMAINT_WHPROrecord): LDCONVREC_pAttrStruct;
VAR result : LDCONVREC_pAttrStruct;
    sexes : LSDOMAINT_sextype; 
    cases : LSDOMAINT_casetype; 
BEGIN
   result := NIL;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'KEY';
      fieldname.len := 3;
      typecode := 0;
      typeindicator := Int;
      STR_IntegerToStr(rec.KEY,  fieldvalue.str, fieldvalue.len);
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'animate';
      fieldname.len := 7;
      typecode := 32;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_animatetype( result^.fieldvalue.str, result^.fieldvalue.len, rec.animate);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'poss';
      fieldname.len := 4;
      typecode := 16;
   END;
   result^.typeindicator := Bool;
   IF rec.poss = TRUE THEN BEGIN
      result^.fieldvalue.str := 'TRUE';
      result^.fieldvalue.len := 4;
      END
   ELSE BEGIN
      result^.fieldvalue.str := 'FALSE';
      result^.fieldvalue.len := 5;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'whcase';
      fieldname.len := 6;
      typecode := 24;
   END;
   result^.typeindicator := Bool;
   IF rec.whcase = TRUE THEN BEGIN
      result^.fieldvalue.str := 'TRUE';
      result^.fieldvalue.len := 4;
      END
   ELSE BEGIN
      result^.fieldvalue.str := 'FALSE';
      result^.fieldvalue.len := 5;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'number';
      fieldname.len := 6;
      typecode := 59;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_numbertype( result^.fieldvalue.str, result^.fieldvalue.len, rec.number);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'sexes';
      fieldname.len := 5;
      typecode := 117;
   END;
   result^.typeindicator := EnumSet;
   FOR sexes:=masculine TO feminine DO BEGIN
      IF sexes IN rec.sexes THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_sextype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,sexes);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'cases';
      fieldname.len := 5;
      typecode := 97;
   END;
   result^.typeindicator := EnumSet;
   FOR cases:=nominative TO omegacase DO BEGIN
      IF cases IN rec.cases THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_casetype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,cases);
      END;
   END;
   LSCONVREC_WHPROrecord := result;
END {LSCONVREC_WHPROrecord};

FUNCTION LSCONVREC_xxkeyrecord(rec: LSDOMAINT_xxkeyrecord): LDCONVREC_pAttrStruct;
VAR result : LDCONVREC_pAttrStruct;
BEGIN
   result := NIL;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'KEY';
      fieldname.len := 3;
      typecode := 0;
      typeindicator := Int;
      STR_IntegerToStr(rec.KEY,  fieldvalue.str, fieldvalue.len);
   END;
   LSCONVREC_xxkeyrecord := result;
END {LSCONVREC_xxkeyrecord};

FUNCTION LSCONVREC_xxemptyrecord(rec: LSDOMAINT_xxemptyrecord): LDCONVREC_pAttrStruct;
VAR result : LDCONVREC_pAttrStruct;
BEGIN
   result := NIL;
   LSCONVREC_xxemptyrecord := result;
END {LSCONVREC_xxemptyrecord};


PROCEDURE LSCONVREC_RecToAttr(rec: LSDOMAINT_LSrecord;
                                      VAR attr: LDCONVREC_pAttrStruct);
BEGIN
   CASE rec.cat OF 
   BADJSUFF: BEGIN
      attr := LSCONVREC_BADJrecord( rec.BADJSUFFfield^);
      END;
   BADJ: BEGIN
      attr := LSCONVREC_BADJrecord( rec.BADJfield^);
      END;
   SUBADJ: BEGIN
      attr := LSCONVREC_SUBADJrecord( rec.SUBADJfield^);
      END;
   ADJ: BEGIN
      attr := LSCONVREC_ADJrecord( rec.ADJfield^);
      END;
   ADJP: BEGIN
      attr := LSCONVREC_ADJPrecord( rec.ADJPfield^);
      END;
   ADJPPROP: BEGIN
      attr := LSCONVREC_ADJPPROPrecord( rec.ADJPPROPfield^);
      END;
   ADJPFORMULA: BEGIN
      attr := LSCONVREC_ADJPPROPrecord( rec.ADJPFORMULAfield^);
      END;
   OPENADJPPROP: BEGIN
      attr := LSCONVREC_ADJPPROPrecord( rec.OPENADJPPROPfield^);
      END;
   CLOSEDADJPPROP: BEGIN
      attr := LSCONVREC_ADJPPROPrecord( rec.CLOSEDADJPPROPfield^);
      END;
   BADVSUFF: BEGIN
      attr := LSCONVREC_BADVrecord( rec.BADVSUFFfield^);
      END;
   BADV: BEGIN
      attr := LSCONVREC_BADVrecord( rec.BADVfield^);
      END;
   SUBADV: BEGIN
      attr := LSCONVREC_SUBADVrecord( rec.SUBADVfield^);
      END;
   ADV: BEGIN
      attr := LSCONVREC_ADVrecord( rec.ADVfield^);
      END;
   ADVP: BEGIN
      attr := LSCONVREC_ADVPrecord( rec.ADVPfield^);
      END;
   ADVPPROP: BEGIN
      attr := LSCONVREC_ADVPPROPrecord( rec.ADVPPROPfield^);
      END;
   ADVPFORMULA: BEGIN
      attr := LSCONVREC_ADVPPROPrecord( rec.ADVPFORMULAfield^);
      END;
   OPENADVPPROP: BEGIN
      attr := LSCONVREC_ADVPPROPrecord( rec.OPENADVPPROPfield^);
      END;
   CLOSEDADVPPROP: BEGIN
      attr := LSCONVREC_ADVPPROPrecord( rec.CLOSEDADVPPROPfield^);
      END;
   ART: BEGIN
      attr := LSCONVREC_ARTrecord( rec.ARTfield^);
      END;
   ASP: BEGIN
      attr := LSCONVREC_ASPrecord( rec.ASPfield^);
      END;
   BBIGPRO: BEGIN
      attr := LSCONVREC_BPERSPROrecord( rec.BBIGPROfield^);
      END;
   BIGPRO: BEGIN
      attr := LSCONVREC_BIGPROrecord( rec.BIGPROfield^);
      END;
   BIRRPREF: BEGIN
      attr := LSCONVREC_BIRRPREFrecord( rec.BIRRPREFfield^);
      END;
   CARD: BEGIN
      attr := LSCONVREC_CARDrecord( rec.CARDfield^);
      END;
   CLAUSE: BEGIN
      attr := LSCONVREC_CLAUSErecord( rec.CLAUSEfield^);
      END;
   CONJ: BEGIN
      attr := LSCONVREC_CONJrecord( rec.CONJfield^);
      END;
   COORD: BEGIN
      attr := LSCONVREC_COORDrecord( rec.COORDfield^);
      END;
   DEMADJ: BEGIN
      attr := LSCONVREC_DEMADJrecord( rec.DEMADJfield^);
      END;
   DEMPRO: BEGIN
      attr := LSCONVREC_DEMPROrecord( rec.DEMPROfield^);
      END;
   BDET: BEGIN
      attr := LSCONVREC_BDETrecord( rec.BDETfield^);
      END;
   DET: BEGIN
      attr := LSCONVREC_DETrecord( rec.DETfield^);
      END;
   DETP: BEGIN
      attr := LSCONVREC_DETPrecord( rec.DETPfield^);
      END;
   DIGIT: BEGIN
      attr := LSCONVREC_DIGITrecord( rec.DIGITfield^);
      END;
   EN: BEGIN
      attr := LSCONVREC_ENrecord( rec.ENfield^);
      END;
   EMPTY: BEGIN
      attr := LSCONVREC_EMPTYrecord( rec.EMPTYfield^);
      END;
   EXCLAM: BEGIN
      attr := LSCONVREC_EXCLAMrecord( rec.EXCLAMfield^);
      END;
   GEN: BEGIN
      attr := LSCONVREC_GENrecord( rec.GENfield^);
      END;
   INDEFPRO: BEGIN
      attr := LSCONVREC_INDEFPROrecord( rec.INDEFPROfield^);
      END;
   SUBINDEFPRO: BEGIN
      attr := LSCONVREC_INDEFPROrecord( rec.SUBINDEFPROfield^);
      END;
   NEG: BEGIN
      attr := LSCONVREC_NEGrecord( rec.NEGfield^);
      END;
   BNOUNSUFF: BEGIN
      attr := LSCONVREC_BNOUNrecord( rec.BNOUNSUFFfield^);
      END;
   BNOUN: BEGIN
      attr := LSCONVREC_BNOUNrecord( rec.BNOUNfield^);
      END;
   SUBNOUN: BEGIN
      attr := LSCONVREC_SUBNOUNrecord( rec.SUBNOUNfield^);
      END;
   NOUN: BEGIN
      attr := LSCONVREC_NOUNrecord( rec.NOUNfield^);
      END;
   CN: BEGIN
      attr := LSCONVREC_CNrecord( rec.CNfield^);
      END;
   NP: BEGIN
      attr := LSCONVREC_NPrecord( rec.NPfield^);
      END;
   VARNP: BEGIN
      attr := LSCONVREC_NPrecord( rec.VARNPfield^);
      END;
   NPPROP: BEGIN
      attr := LSCONVREC_NPPROPrecord( rec.NPPROPfield^);
      END;
   NPFORMULA: BEGIN
      attr := LSCONVREC_NPPROPrecord( rec.NPFORMULAfield^);
      END;
   OPENNPPROP: BEGIN
      attr := LSCONVREC_NPPROPrecord( rec.OPENNPPROPfield^);
      END;
   CLOSEDNPPROP: BEGIN
      attr := LSCONVREC_NPPROPrecord( rec.CLOSEDNPPROPfield^);
      END;
   NUM: BEGIN
      attr := LSCONVREC_NUMrecord( rec.NUMfield^);
      END;
   ORDINAL: BEGIN
      attr := LSCONVREC_ORDINALrecord( rec.ORDINALfield^);
      END;
   PART: BEGIN
      attr := LSCONVREC_PARTICLErecord( rec.PARTfield^);
      END;
   BPERSPRO: BEGIN
      attr := LSCONVREC_BPERSPROrecord( rec.BPERSPROfield^);
      END;
   PERSPRO: BEGIN
      attr := LSCONVREC_PERSPROrecord( rec.PERSPROfield^);
      END;
   POS: BEGIN
      attr := LSCONVREC_POSrecord( rec.POSfield^);
      END;
   POSSADJ: BEGIN
      attr := LSCONVREC_POSSADJrecord( rec.POSSADJfield^);
      END;
   POSSPRO: BEGIN
      attr := LSCONVREC_POSSPROrecord( rec.POSSPROfield^);
      END;
   BPREFIX: BEGIN
      attr := LSCONVREC_BPREFIXrecord( rec.BPREFIXfield^);
      END;
   SUBPREP: BEGIN
      attr := LSCONVREC_PREPrecord( rec.SUBPREPfield^);
      END;
   PREP: BEGIN
      attr := LSCONVREC_PREPrecord( rec.PREPfield^);
      END;
   PREPP: BEGIN
      attr := LSCONVREC_PREPPrecord( rec.PREPPfield^);
      END;
   PREPPPROP: BEGIN
      attr := LSCONVREC_PREPPPROPrecord( rec.PREPPPROPfield^);
      END;
   PREPPFORMULA: BEGIN
      attr := LSCONVREC_PREPPPROPrecord( rec.PREPPFORMULAfield^);
      END;
   OPENPREPPPROP: BEGIN
      attr := LSCONVREC_PREPPPROPrecord( rec.OPENPREPPPROPfield^);
      END;
   CLOSEDPREPPPROP: BEGIN
      attr := LSCONVREC_PREPPPROPrecord( rec.CLOSEDPREPPPROPfield^);
      END;
   VARPREPP: BEGIN
      attr := LSCONVREC_PREPPrecord( rec.VARPREPPfield^);
      END;
   BPROPERNOUN: BEGIN
      attr := LSCONVREC_BPROPERNOUNrecord( rec.BPROPERNOUNfield^);
      END;
   PROPERNOUN: BEGIN
      attr := LSCONVREC_PROPERNOUNrecord( rec.PROPERNOUNfield^);
      END;
   PROSENT: BEGIN
      attr := LSCONVREC_PROSENTrecord( rec.PROSENTfield^);
      END;
   PUNC: BEGIN
      attr := LSCONVREC_PUNCrecord( rec.PUNCfield^);
      END;
   Q: BEGIN
      attr := LSCONVREC_Qrecord( rec.Qfield^);
      END;
   QP: BEGIN
      attr := LSCONVREC_QPrecord( rec.QPfield^);
      END;
   RECIPRO: BEGIN
      attr := LSCONVREC_RECIPROrecord( rec.RECIPROfield^);
      END;
   REFLPRO: BEGIN
      attr := LSCONVREC_REFLPROrecord( rec.REFLPROfield^);
      END;
   RELPRO: BEGIN
      attr := LSCONVREC_RELPROrecord( rec.RELPROfield^);
      END;
   SENTENCE: BEGIN
      attr := LSCONVREC_SENTENCErecord( rec.SENTENCEfield^);
      END;
   TOCAT: BEGIN
      attr := LSCONVREC_TOCATrecord( rec.TOCATfield^);
      END;
   THANAS: BEGIN
      attr := LSCONVREC_THANASrecord( rec.THANASfield^);
      END;
   THANP: BEGIN
      attr := LSCONVREC_THANPrecord( rec.THANPfield^);
      END;
   THERE: BEGIN
      attr := LSCONVREC_THERErecord( rec.THEREfield^);
      END;
   UTT: BEGIN
      attr := LSCONVREC_NORECORD( rec.UTTfield^);
      END;
   ADJPPROPVAR: BEGIN
      attr := LSCONVREC_ADJPPROPVARrecord( rec.ADJPPROPVARfield^);
      END;
   ADVPVAR: BEGIN
      attr := LSCONVREC_ADVPVARrecord( rec.ADVPVARfield^);
      END;
   ADVPPROPVAR: BEGIN
      attr := LSCONVREC_ADVPPROPVARrecord( rec.ADVPPROPVARfield^);
      END;
   CLAUSEVAR: BEGIN
      attr := LSCONVREC_CLAUSEVARrecord( rec.CLAUSEVARfield^);
      END;
   CNVAR: BEGIN
      attr := LSCONVREC_CNVARrecord( rec.CNVARfield^);
      END;
   NPVAR: BEGIN
      attr := LSCONVREC_NPVARrecord( rec.NPVARfield^);
      END;
   NPPROPVAR: BEGIN
      attr := LSCONVREC_NPPROPVARrecord( rec.NPPROPVARfield^);
      END;
   PREPPVAR: BEGIN
      attr := LSCONVREC_PREPPVARrecord( rec.PREPPVARfield^);
      END;
   PREPPPROPVAR: BEGIN
      attr := LSCONVREC_PREPPPROPVARrecord( rec.PREPPPROPVARfield^);
      END;
   PROSENTVAR: BEGIN
      attr := LSCONVREC_PROSENTVARrecord( rec.PROSENTVARfield^);
      END;
   SENTENCEVAR: BEGIN
      attr := LSCONVREC_SENTENCEVARrecord( rec.SENTENCEVARfield^);
      END;
   VERBPPROPVAR: BEGIN
      attr := LSCONVREC_VERBPPROPVARrecord( rec.VERBPPROPVARfield^);
      END;
   EMPTYVAR: BEGIN
      attr := LSCONVREC_EMPTYVARrecord( rec.EMPTYVARfield^);
      END;
   NEGVAR: BEGIN
      attr := LSCONVREC_NEGVARrecord( rec.NEGVARfield^);
      END;
   POSVAR: BEGIN
      attr := LSCONVREC_POSVARrecord( rec.POSVARfield^);
      END;
   BVERBSUFF: BEGIN
      attr := LSCONVREC_BVERBrecord( rec.BVERBSUFFfield^);
      END;
   BVERB: BEGIN
      attr := LSCONVREC_BVERBrecord( rec.BVERBfield^);
      END;
   SUBVERB: BEGIN
      attr := LSCONVREC_SUBVERBrecord( rec.SUBVERBfield^);
      END;
   VERB: BEGIN
      attr := LSCONVREC_VERBrecord( rec.VERBfield^);
      END;
   VERBP: BEGIN
      attr := LSCONVREC_VERBPrecord( rec.VERBPfield^);
      END;
   VERBPPROP: BEGIN
      attr := LSCONVREC_VERBPPROPrecord( rec.VERBPPROPfield^);
      END;
   VERBPFORMULA: BEGIN
      attr := LSCONVREC_VERBPPROPrecord( rec.VERBPFORMULAfield^);
      END;
   OPENVERBPPROP: BEGIN
      attr := LSCONVREC_VERBPPROPrecord( rec.OPENVERBPPROPfield^);
      END;
   CLOSEDVERBPPROP: BEGIN
      attr := LSCONVREC_VERBPPROPrecord( rec.CLOSEDVERBPPROPfield^);
      END;
   BWHPRO: BEGIN
      attr := LSCONVREC_BWHPROrecord( rec.BWHPROfield^);
      END;
   WHPRO: BEGIN
      attr := LSCONVREC_WHPROrecord( rec.WHPROfield^);
      END;
   SFCAT: BEGIN
      attr := LSCONVREC_xxkeyrecord( rec.SFCATfield^);
      END;
   PFCAT: BEGIN
      attr := LSCONVREC_xxkeyrecord( rec.PFCATfield^);
      END;
   GLUE: BEGIN
      attr := LSCONVREC_xxemptyrecord( rec.GLUEfield^);
      END;
   END;
END {LSCONVREC_RecToAttr};
