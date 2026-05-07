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

FUNCTION LSCONVREC_NOrecord(rec: LSDOMAINT_NOrecord): LDCONVREC_pAttrStruct;
VAR result : LDCONVREC_pAttrStruct;
BEGIN
   result := NIL;
   LSCONVREC_NOrecord := result;
END {LSCONVREC_NOrecord};

FUNCTION LSCONVREC_BADJrecord(rec: LSDOMAINT_BADJrecord): LDCONVREC_pAttrStruct;
VAR result : LDCONVREC_pAttrStruct;
    req : LSDOMAINT_polaritytype; 
    env : LSDOMAINT_polaritytype; 
    uses : LSDOMAINT_adjusetype; 
    subcs : LSDOMAINT_adjsubctype; 
    adjpatterns : LSDOMAINT_synpatterntype; 
    copulas : LSDOMAINT_copulatype; 
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
      typecode := 110;
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
      typecode := 110;
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
      fieldname.str := 'pluralforma';
      fieldname.len := 11;
      typecode := 25;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_adjpluralformatype( result^.fieldvalue.str, result^.fieldvalue.len, rec.pluralforma);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'femforma';
      fieldname.len := 8;
      typecode := 48;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_femformatype( result^.fieldvalue.str, result^.fieldvalue.len, rec.femforma);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'irrComp';
      fieldname.len := 7;
      typecode := 71;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_sinotype( result^.fieldvalue.str, result^.fieldvalue.len, rec.irrComp);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'possApocope';
      fieldname.len := 11;
      typecode := 71;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_sinotype( result^.fieldvalue.str, result^.fieldvalue.len, rec.possApocope);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'posicion';
      fieldname.len := 8;
      typecode := 65;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_posiciontype( result^.fieldvalue.str, result^.fieldvalue.len, rec.posicion);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'class';
      fieldname.len := 5;
      typecode := 82;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_timeadvclasstype( result^.fieldvalue.str, result^.fieldvalue.len, rec.class);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'tiempo';
      fieldname.len := 6;
      typecode := 81;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_tiempotype( result^.fieldvalue.str, result^.fieldvalue.len, rec.tiempo);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'aspecto';
      fieldname.len := 7;
      typecode := 34;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_aspectotype( result^.fieldvalue.str, result^.fieldvalue.len, rec.aspecto);
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
      typecode := 93;
   END;
   result^.typeindicator := EnumSet;
   FOR uses:=attributive TO nominalised DO BEGIN
      IF uses IN rec.uses THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_adjusetype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,uses);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'temporal';
      fieldname.len := 8;
      typecode := 21;
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
      typecode := 90;
   END;
   result^.typeindicator := EnumSet;
   FOR subcs:=coloradj TO otheradj DO BEGIN
      IF subcs IN rec.subcs THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_adjsubctype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,subcs);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'reflexivity';
      fieldname.len := 11;
      typecode := 69;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_reflexivetype( result^.fieldvalue.str, result^.fieldvalue.len, rec.reflexivity);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'thetaadj';
      fieldname.len := 8;
      typecode := 76;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_thetaadjtype( result^.fieldvalue.str, result^.fieldvalue.len, rec.thetaadj);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'adjpatterns';
      fieldname.len := 11;
      typecode := 115;
   END;
   result^.typeindicator := EnumSet;
   FOR adjpatterns:=synSER TO synVERBPPROP DO BEGIN
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
      fieldname.str := 'possadv';
      fieldname.len := 7;
      typecode := 13;
   END;
   result^.typeindicator := Bool;
   IF rec.possadv = TRUE THEN BEGIN
      result^.fieldvalue.str := 'TRUE';
      result^.fieldvalue.len := 4;
      END
   ELSE BEGIN
      result^.fieldvalue.str := 'FALSE';
      result^.fieldvalue.len := 5;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'ARTindef';
      fieldname.len := 8;
      typecode := 71;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_sinotype( result^.fieldvalue.str, result^.fieldvalue.len, rec.ARTindef);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'copulas';
      fieldname.len := 7;
      typecode := 103;
   END;
   result^.typeindicator := EnumSet;
   FOR copulas:=ser TO estar DO BEGIN
      IF copulas IN rec.copulas THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_copulatype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,copulas);
      END;
   END;
   LSCONVREC_BADJrecord := result;
END {LSCONVREC_BADJrecord};

FUNCTION LSCONVREC_SUBADJrecord(rec: LSDOMAINT_SUBADJrecord): LDCONVREC_pAttrStruct;
VAR result : LDCONVREC_pAttrStruct;
    req : LSDOMAINT_polaritytype; 
    env : LSDOMAINT_polaritytype; 
    uses : LSDOMAINT_adjusetype; 
    subcs : LSDOMAINT_adjsubctype; 
    adjpatterns : LSDOMAINT_synpatterntype; 
    copulas : LSDOMAINT_copulatype; 
BEGIN
   result := NIL;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'req';
      fieldname.len := 3;
      typecode := 110;
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
      typecode := 110;
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
      typecode := 82;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_timeadvclasstype( result^.fieldvalue.str, result^.fieldvalue.len, rec.class);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'tiempo';
      fieldname.len := 6;
      typecode := 81;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_tiempotype( result^.fieldvalue.str, result^.fieldvalue.len, rec.tiempo);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'aspecto';
      fieldname.len := 7;
      typecode := 34;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_aspectotype( result^.fieldvalue.str, result^.fieldvalue.len, rec.aspecto);
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
      fieldname.str := 'pluralforma';
      fieldname.len := 11;
      typecode := 25;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_adjpluralformatype( result^.fieldvalue.str, result^.fieldvalue.len, rec.pluralforma);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'femforma';
      fieldname.len := 8;
      typecode := 48;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_femformatype( result^.fieldvalue.str, result^.fieldvalue.len, rec.femforma);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'possApocope';
      fieldname.len := 11;
      typecode := 71;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_sinotype( result^.fieldvalue.str, result^.fieldvalue.len, rec.possApocope);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'posicion';
      fieldname.len := 8;
      typecode := 65;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_posiciontype( result^.fieldvalue.str, result^.fieldvalue.len, rec.posicion);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'uses';
      fieldname.len := 4;
      typecode := 93;
   END;
   result^.typeindicator := EnumSet;
   FOR uses:=attributive TO nominalised DO BEGIN
      IF uses IN rec.uses THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_adjusetype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,uses);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'temporal';
      fieldname.len := 8;
      typecode := 21;
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
      typecode := 90;
   END;
   result^.typeindicator := EnumSet;
   FOR subcs:=coloradj TO otheradj DO BEGIN
      IF subcs IN rec.subcs THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_adjsubctype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,subcs);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'reflexivity';
      fieldname.len := 11;
      typecode := 69;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_reflexivetype( result^.fieldvalue.str, result^.fieldvalue.len, rec.reflexivity);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'thetaadj';
      fieldname.len := 8;
      typecode := 76;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_thetaadjtype( result^.fieldvalue.str, result^.fieldvalue.len, rec.thetaadj);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'adjpatterns';
      fieldname.len := 11;
      typecode := 115;
   END;
   result^.typeindicator := EnumSet;
   FOR adjpatterns:=synSER TO synVERBPPROP DO BEGIN
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
      fieldname.str := 'possadv';
      fieldname.len := 7;
      typecode := 13;
   END;
   result^.typeindicator := Bool;
   IF rec.possadv = TRUE THEN BEGIN
      result^.fieldvalue.str := 'TRUE';
      result^.fieldvalue.len := 4;
      END
   ELSE BEGIN
      result^.fieldvalue.str := 'FALSE';
      result^.fieldvalue.len := 5;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'ARTindef';
      fieldname.len := 8;
      typecode := 71;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_sinotype( result^.fieldvalue.str, result^.fieldvalue.len, rec.ARTindef);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'copulas';
      fieldname.len := 7;
      typecode := 103;
   END;
   result^.typeindicator := EnumSet;
   FOR copulas:=ser TO estar DO BEGIN
      IF copulas IN rec.copulas THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_copulatype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,copulas);
      END;
   END;
   LSCONVREC_SUBADJrecord := result;
END {LSCONVREC_SUBADJrecord};

FUNCTION LSCONVREC_ADJrecord(rec: LSDOMAINT_ADJrecord): LDCONVREC_pAttrStruct;
VAR result : LDCONVREC_pAttrStruct;
    req : LSDOMAINT_polaritytype; 
    env : LSDOMAINT_polaritytype; 
    uses : LSDOMAINT_adjusetype; 
    subcs : LSDOMAINT_adjsubctype; 
    adjpatterns : LSDOMAINT_synpatterntype; 
    copulas : LSDOMAINT_copulatype; 
BEGIN
   result := NIL;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'req';
      fieldname.len := 3;
      typecode := 110;
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
      typecode := 110;
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
      fieldname.str := 'Adjadvform';
      fieldname.len := 10;
      typecode := 24;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_adjadvformtype( result^.fieldvalue.str, result^.fieldvalue.len, rec.Adjadvform);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'pluralforma';
      fieldname.len := 11;
      typecode := 25;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_adjpluralformatype( result^.fieldvalue.str, result^.fieldvalue.len, rec.pluralforma);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'femforma';
      fieldname.len := 8;
      typecode := 48;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_femformatype( result^.fieldvalue.str, result^.fieldvalue.len, rec.femforma);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'irrComp';
      fieldname.len := 7;
      typecode := 71;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_sinotype( result^.fieldvalue.str, result^.fieldvalue.len, rec.irrComp);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'genero';
      fieldname.len := 6;
      typecode := 52;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_generotype( result^.fieldvalue.str, result^.fieldvalue.len, rec.genero);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'numero';
      fieldname.len := 6;
      typecode := 61;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_numerotype( result^.fieldvalue.str, result^.fieldvalue.len, rec.numero);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'possApocope';
      fieldname.len := 11;
      typecode := 71;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_sinotype( result^.fieldvalue.str, result^.fieldvalue.len, rec.possApocope);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'apocope';
      fieldname.len := 7;
      typecode := 4;
   END;
   result^.typeindicator := Bool;
   IF rec.apocope = TRUE THEN BEGIN
      result^.fieldvalue.str := 'TRUE';
      result^.fieldvalue.len := 4;
      END
   ELSE BEGIN
      result^.fieldvalue.str := 'FALSE';
      result^.fieldvalue.len := 5;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'posicion';
      fieldname.len := 8;
      typecode := 65;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_posiciontype( result^.fieldvalue.str, result^.fieldvalue.len, rec.posicion);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'class';
      fieldname.len := 5;
      typecode := 82;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_timeadvclasstype( result^.fieldvalue.str, result^.fieldvalue.len, rec.class);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'tiempo';
      fieldname.len := 6;
      typecode := 81;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_tiempotype( result^.fieldvalue.str, result^.fieldvalue.len, rec.tiempo);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'aspecto';
      fieldname.len := 7;
      typecode := 34;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_aspectotype( result^.fieldvalue.str, result^.fieldvalue.len, rec.aspecto);
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
      typecode := 93;
   END;
   result^.typeindicator := EnumSet;
   FOR uses:=attributive TO nominalised DO BEGIN
      IF uses IN rec.uses THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_adjusetype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,uses);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'temporal';
      fieldname.len := 8;
      typecode := 21;
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
      typecode := 90;
   END;
   result^.typeindicator := EnumSet;
   FOR subcs:=coloradj TO otheradj DO BEGIN
      IF subcs IN rec.subcs THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_adjsubctype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,subcs);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'thetaadj';
      fieldname.len := 8;
      typecode := 76;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_thetaadjtype( result^.fieldvalue.str, result^.fieldvalue.len, rec.thetaadj);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'adjpatterns';
      fieldname.len := 11;
      typecode := 115;
   END;
   result^.typeindicator := EnumSet;
   FOR adjpatterns:=synSER TO synVERBPPROP DO BEGIN
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
      fieldname.str := 'reflexivity';
      fieldname.len := 11;
      typecode := 69;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_reflexivetype( result^.fieldvalue.str, result^.fieldvalue.len, rec.reflexivity);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'possadv';
      fieldname.len := 7;
      typecode := 13;
   END;
   result^.typeindicator := Bool;
   IF rec.possadv = TRUE THEN BEGIN
      result^.fieldvalue.str := 'TRUE';
      result^.fieldvalue.len := 4;
      END
   ELSE BEGIN
      result^.fieldvalue.str := 'FALSE';
      result^.fieldvalue.len := 5;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'ARTindef';
      fieldname.len := 8;
      typecode := 71;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_sinotype( result^.fieldvalue.str, result^.fieldvalue.len, rec.ARTindef);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'copulas';
      fieldname.len := 7;
      typecode := 103;
   END;
   result^.typeindicator := EnumSet;
   FOR copulas:=ser TO estar DO BEGIN
      IF copulas IN rec.copulas THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_copulatype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,copulas);
      END;
   END;
   LSCONVREC_ADJrecord := result;
END {LSCONVREC_ADJrecord};

FUNCTION LSCONVREC_ADJPrecord(rec: LSDOMAINT_ADJPrecord): LDCONVREC_pAttrStruct;
VAR result : LDCONVREC_pAttrStruct;
    req : LSDOMAINT_polaritytype; 
    env : LSDOMAINT_polaritytype; 
    uses : LSDOMAINT_adjusetype; 
    actsubcefs : LSDOMAINT_adjsubctype; 
    adjpatternefs : LSDOMAINT_synpatterntype; 
    copulas : LSDOMAINT_copulatype; 
BEGIN
   result := NIL;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'req';
      fieldname.len := 3;
      typecode := 110;
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
      typecode := 110;
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
      fieldname.str := 'genero';
      fieldname.len := 6;
      typecode := 52;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_generotype( result^.fieldvalue.str, result^.fieldvalue.len, rec.genero);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'numero';
      fieldname.len := 6;
      typecode := 61;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_numerotype( result^.fieldvalue.str, result^.fieldvalue.len, rec.numero);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'apocope';
      fieldname.len := 7;
      typecode := 4;
   END;
   result^.typeindicator := Bool;
   IF rec.apocope = TRUE THEN BEGIN
      result^.fieldvalue.str := 'TRUE';
      result^.fieldvalue.len := 4;
      END
   ELSE BEGIN
      result^.fieldvalue.str := 'FALSE';
      result^.fieldvalue.len := 5;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'posicion';
      fieldname.len := 8;
      typecode := 65;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_posiciontype( result^.fieldvalue.str, result^.fieldvalue.len, rec.posicion);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'class';
      fieldname.len := 5;
      typecode := 82;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_timeadvclasstype( result^.fieldvalue.str, result^.fieldvalue.len, rec.class);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'tiempo';
      fieldname.len := 6;
      typecode := 81;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_tiempotype( result^.fieldvalue.str, result^.fieldvalue.len, rec.tiempo);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'aspecto';
      fieldname.len := 7;
      typecode := 34;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_aspectotype( result^.fieldvalue.str, result^.fieldvalue.len, rec.aspecto);
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
      typecode := 93;
   END;
   result^.typeindicator := EnumSet;
   FOR uses:=attributive TO nominalised DO BEGIN
      IF uses IN rec.uses THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_adjusetype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,uses);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'temporal';
      fieldname.len := 8;
      typecode := 21;
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
      typecode := 91;
   END;
   result^.typeindicator := EnumSet;
   FOR actsubcefs:=coloradj TO otheradj DO BEGIN
      IF actsubcefs IN rec.actsubcefs THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_adjsubctype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,actsubcefs);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'thetaadj';
      fieldname.len := 8;
      typecode := 76;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_thetaadjtype( result^.fieldvalue.str, result^.fieldvalue.len, rec.thetaadj);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'adjpatternefs';
      fieldname.len := 13;
      typecode := 116;
   END;
   result^.typeindicator := EnumSet;
   FOR adjpatternefs:=synSER TO synVERBPPROP DO BEGIN
      IF adjpatternefs IN rec.adjpatternefs THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_synpatterntype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,adjpatternefs);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'reflexivity';
      fieldname.len := 11;
      typecode := 69;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_reflexivetype( result^.fieldvalue.str, result^.fieldvalue.len, rec.reflexivity);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'mood';
      fieldname.len := 4;
      typecode := 87;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_xpmoodtype( result^.fieldvalue.str, result^.fieldvalue.len, rec.mood);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'copulas';
      fieldname.len := 7;
      typecode := 103;
   END;
   result^.typeindicator := EnumSet;
   FOR copulas:=ser TO estar DO BEGIN
      IF copulas IN rec.copulas THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_copulatype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,copulas);
      END;
   END;
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
    uses : LSDOMAINT_adjusetype; 
    actsubcefs : LSDOMAINT_adjsubctype; 
    adjpatternefs : LSDOMAINT_synpatterntype; 
    copulas : LSDOMAINT_copulatype; 
BEGIN
   result := NIL;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'req';
      fieldname.len := 3;
      typecode := 110;
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
      typecode := 110;
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
      typecode := 82;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_timeadvclasstype( result^.fieldvalue.str, result^.fieldvalue.len, rec.class);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'tiempo';
      fieldname.len := 6;
      typecode := 81;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_tiempotype( result^.fieldvalue.str, result^.fieldvalue.len, rec.tiempo);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'aspecto';
      fieldname.len := 7;
      typecode := 34;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_aspectotype( result^.fieldvalue.str, result^.fieldvalue.len, rec.aspecto);
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
      typecode := 96;
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
      fieldname.str := 'uses';
      fieldname.len := 4;
      typecode := 93;
   END;
   result^.typeindicator := EnumSet;
   FOR uses:=attributive TO nominalised DO BEGIN
      IF uses IN rec.uses THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_adjusetype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,uses);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'supertiempo';
      fieldname.len := 11;
      typecode := 81;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_tiempotype( result^.fieldvalue.str, result^.fieldvalue.len, rec.supertiempo);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'temporal';
      fieldname.len := 8;
      typecode := 21;
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
      typecode := 91;
   END;
   result^.typeindicator := EnumSet;
   FOR actsubcefs:=coloradj TO otheradj DO BEGIN
      IF actsubcefs IN rec.actsubcefs THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_adjsubctype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,actsubcefs);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'thetaadj';
      fieldname.len := 8;
      typecode := 76;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_thetaadjtype( result^.fieldvalue.str, result^.fieldvalue.len, rec.thetaadj);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'adjpatternefs';
      fieldname.len := 13;
      typecode := 116;
   END;
   result^.typeindicator := EnumSet;
   FOR adjpatternefs:=synSER TO synVERBPPROP DO BEGIN
      IF adjpatternefs IN rec.adjpatternefs THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_synpatterntype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,adjpatternefs);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'mood';
      fieldname.len := 4;
      typecode := 87;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_xpmoodtype( result^.fieldvalue.str, result^.fieldvalue.len, rec.mood);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'copulas';
      fieldname.len := 7;
      typecode := 103;
   END;
   result^.typeindicator := EnumSet;
   FOR copulas:=ser TO estar DO BEGIN
      IF copulas IN rec.copulas THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_copulatype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,copulas);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'PROsubject';
      fieldname.len := 10;
      typecode := 16;
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
   LSCONVREC_ADJPPROPrecord := result;
END {LSCONVREC_ADJPPROPrecord};

FUNCTION LSCONVREC_ADJPPROPVARrecord(rec: LSDOMAINT_ADJPPROPVARrecord): LDCONVREC_pAttrStruct;
VAR result : LDCONVREC_pAttrStruct;
    req : LSDOMAINT_polaritytype; 
    env : LSDOMAINT_polaritytype; 
    aktionsarts : LSDOMAINT_aktionsarttype; 
    uses : LSDOMAINT_adjusetype; 
    actsubcefs : LSDOMAINT_adjsubctype; 
    adjpatternefs : LSDOMAINT_synpatterntype; 
    copulas : LSDOMAINT_copulatype; 
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
      typecode := 110;
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
      typecode := 110;
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
      typecode := 82;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_timeadvclasstype( result^.fieldvalue.str, result^.fieldvalue.len, rec.class);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'tiempo';
      fieldname.len := 6;
      typecode := 81;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_tiempotype( result^.fieldvalue.str, result^.fieldvalue.len, rec.tiempo);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'aspecto';
      fieldname.len := 7;
      typecode := 34;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_aspectotype( result^.fieldvalue.str, result^.fieldvalue.len, rec.aspecto);
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
      typecode := 96;
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
      fieldname.str := 'uses';
      fieldname.len := 4;
      typecode := 93;
   END;
   result^.typeindicator := EnumSet;
   FOR uses:=attributive TO nominalised DO BEGIN
      IF uses IN rec.uses THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_adjusetype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,uses);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'supertiempo';
      fieldname.len := 11;
      typecode := 81;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_tiempotype( result^.fieldvalue.str, result^.fieldvalue.len, rec.supertiempo);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'temporal';
      fieldname.len := 8;
      typecode := 21;
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
      typecode := 91;
   END;
   result^.typeindicator := EnumSet;
   FOR actsubcefs:=coloradj TO otheradj DO BEGIN
      IF actsubcefs IN rec.actsubcefs THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_adjsubctype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,actsubcefs);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'thetaadj';
      fieldname.len := 8;
      typecode := 76;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_thetaadjtype( result^.fieldvalue.str, result^.fieldvalue.len, rec.thetaadj);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'adjpatternefs';
      fieldname.len := 13;
      typecode := 116;
   END;
   result^.typeindicator := EnumSet;
   FOR adjpatternefs:=synSER TO synVERBPPROP DO BEGIN
      IF adjpatternefs IN rec.adjpatternefs THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_synpatterntype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,adjpatternefs);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'mood';
      fieldname.len := 4;
      typecode := 87;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_xpmoodtype( result^.fieldvalue.str, result^.fieldvalue.len, rec.mood);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'copulas';
      fieldname.len := 7;
      typecode := 103;
   END;
   result^.typeindicator := EnumSet;
   FOR copulas:=ser TO estar DO BEGIN
      IF copulas IN rec.copulas THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_copulatype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,copulas);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'PROsubject';
      fieldname.len := 10;
      typecode := 16;
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
   LSCONVREC_ADJPPROPVARrecord := result;
END {LSCONVREC_ADJPPROPVARrecord};

FUNCTION LSCONVREC_BADVrecord(rec: LSDOMAINT_BADVrecord): LDCONVREC_pAttrStruct;
VAR result : LDCONVREC_pAttrStruct;
    req : LSDOMAINT_polaritytype; 
    env : LSDOMAINT_polaritytype; 
    subcs : LSDOMAINT_advsubctype; 
    advpatterns : LSDOMAINT_synpatterntype; 
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
      typecode := 110;
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
      typecode := 110;
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
      typecode := 94;
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
      fieldname.str := 'Qstatus';
      fieldname.len := 7;
      typecode := 17;
   END;
   result^.typeindicator := Bool;
   IF rec.Qstatus = TRUE THEN BEGIN
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
      typecode := 82;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_timeadvclasstype( result^.fieldvalue.str, result^.fieldvalue.len, rec.class);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'tiempo';
      fieldname.len := 6;
      typecode := 81;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_tiempotype( result^.fieldvalue.str, result^.fieldvalue.len, rec.tiempo);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'aspecto';
      fieldname.len := 7;
      typecode := 34;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_aspectotype( result^.fieldvalue.str, result^.fieldvalue.len, rec.aspecto);
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
      typecode := 87;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_xpmoodtype( result^.fieldvalue.str, result^.fieldvalue.len, rec.mood);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'thetaadv';
      fieldname.len := 8;
      typecode := 77;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_thetaadvtype( result^.fieldvalue.str, result^.fieldvalue.len, rec.thetaadv);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'advpatterns';
      fieldname.len := 11;
      typecode := 115;
   END;
   result^.typeindicator := EnumSet;
   FOR advpatterns:=synSER TO synVERBPPROP DO BEGIN
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
      fieldname.str := 'temporal';
      fieldname.len := 8;
      typecode := 21;
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
      fieldname.str := 'irrComp';
      fieldname.len := 7;
      typecode := 71;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_sinotype( result^.fieldvalue.str, result^.fieldvalue.len, rec.irrComp);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'thanas';
      fieldname.len := 6;
      typecode := 75;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_thanascompltype( result^.fieldvalue.str, result^.fieldvalue.len, rec.thanas);
   LSCONVREC_BADVrecord := result;
END {LSCONVREC_BADVrecord};

FUNCTION LSCONVREC_SUBADVrecord(rec: LSDOMAINT_SUBADVrecord): LDCONVREC_pAttrStruct;
VAR result : LDCONVREC_pAttrStruct;
    req : LSDOMAINT_polaritytype; 
    env : LSDOMAINT_polaritytype; 
    subcs : LSDOMAINT_advsubctype; 
    advpatterns : LSDOMAINT_synpatterntype; 
BEGIN
   result := NIL;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'req';
      fieldname.len := 3;
      typecode := 110;
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
      typecode := 110;
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
      typecode := 94;
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
      fieldname.str := 'Qstatus';
      fieldname.len := 7;
      typecode := 17;
   END;
   result^.typeindicator := Bool;
   IF rec.Qstatus = TRUE THEN BEGIN
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
      typecode := 82;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_timeadvclasstype( result^.fieldvalue.str, result^.fieldvalue.len, rec.class);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'tiempo';
      fieldname.len := 6;
      typecode := 81;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_tiempotype( result^.fieldvalue.str, result^.fieldvalue.len, rec.tiempo);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'aspecto';
      fieldname.len := 7;
      typecode := 34;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_aspectotype( result^.fieldvalue.str, result^.fieldvalue.len, rec.aspecto);
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
      typecode := 87;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_xpmoodtype( result^.fieldvalue.str, result^.fieldvalue.len, rec.mood);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'thetaadv';
      fieldname.len := 8;
      typecode := 77;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_thetaadvtype( result^.fieldvalue.str, result^.fieldvalue.len, rec.thetaadv);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'advpatterns';
      fieldname.len := 11;
      typecode := 115;
   END;
   result^.typeindicator := EnumSet;
   FOR advpatterns:=synSER TO synVERBPPROP DO BEGIN
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
      fieldname.str := 'temporal';
      fieldname.len := 8;
      typecode := 21;
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
      fieldname.str := 'thanas';
      fieldname.len := 6;
      typecode := 75;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_thanascompltype( result^.fieldvalue.str, result^.fieldvalue.len, rec.thanas);
   LSCONVREC_SUBADVrecord := result;
END {LSCONVREC_SUBADVrecord};

FUNCTION LSCONVREC_ADVrecord(rec: LSDOMAINT_ADVrecord): LDCONVREC_pAttrStruct;
VAR result : LDCONVREC_pAttrStruct;
    req : LSDOMAINT_polaritytype; 
    env : LSDOMAINT_polaritytype; 
    subcs : LSDOMAINT_advsubctype; 
    advpatterns : LSDOMAINT_synpatterntype; 
BEGIN
   result := NIL;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'req';
      fieldname.len := 3;
      typecode := 110;
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
      typecode := 110;
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
      typecode := 94;
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
      fieldname.str := 'Qstatus';
      fieldname.len := 7;
      typecode := 17;
   END;
   result^.typeindicator := Bool;
   IF rec.Qstatus = TRUE THEN BEGIN
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
      typecode := 82;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_timeadvclasstype( result^.fieldvalue.str, result^.fieldvalue.len, rec.class);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'tiempo';
      fieldname.len := 6;
      typecode := 81;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_tiempotype( result^.fieldvalue.str, result^.fieldvalue.len, rec.tiempo);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'aspecto';
      fieldname.len := 7;
      typecode := 34;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_aspectotype( result^.fieldvalue.str, result^.fieldvalue.len, rec.aspecto);
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
      typecode := 87;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_xpmoodtype( result^.fieldvalue.str, result^.fieldvalue.len, rec.mood);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'thetaadv';
      fieldname.len := 8;
      typecode := 77;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_thetaadvtype( result^.fieldvalue.str, result^.fieldvalue.len, rec.thetaadv);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'advpatterns';
      fieldname.len := 11;
      typecode := 115;
   END;
   result^.typeindicator := EnumSet;
   FOR advpatterns:=synSER TO synVERBPPROP DO BEGIN
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
      fieldname.str := 'temporal';
      fieldname.len := 8;
      typecode := 21;
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
      fieldname.str := 'thanas';
      fieldname.len := 6;
      typecode := 75;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_thanascompltype( result^.fieldvalue.str, result^.fieldvalue.len, rec.thanas);
   LSCONVREC_ADVrecord := result;
END {LSCONVREC_ADVrecord};

FUNCTION LSCONVREC_ADVPrecord(rec: LSDOMAINT_ADVPrecord): LDCONVREC_pAttrStruct;
VAR result : LDCONVREC_pAttrStruct;
    req : LSDOMAINT_polaritytype; 
    env : LSDOMAINT_polaritytype; 
    actsubcefs : LSDOMAINT_advsubctype; 
    advpatternefs : LSDOMAINT_synpatterntype; 
BEGIN
   result := NIL;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'req';
      fieldname.len := 3;
      typecode := 110;
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
      typecode := 110;
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
      fieldname.str := 'Qstatus';
      fieldname.len := 7;
      typecode := 17;
   END;
   result^.typeindicator := Bool;
   IF rec.Qstatus = TRUE THEN BEGIN
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
      typecode := 82;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_timeadvclasstype( result^.fieldvalue.str, result^.fieldvalue.len, rec.class);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'tiempo';
      fieldname.len := 6;
      typecode := 81;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_tiempotype( result^.fieldvalue.str, result^.fieldvalue.len, rec.tiempo);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'aspecto';
      fieldname.len := 7;
      typecode := 34;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_aspectotype( result^.fieldvalue.str, result^.fieldvalue.len, rec.aspecto);
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
      fieldname.str := 'supertiempo';
      fieldname.len := 11;
      typecode := 81;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_tiempotype( result^.fieldvalue.str, result^.fieldvalue.len, rec.supertiempo);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'actsubcefs';
      fieldname.len := 10;
      typecode := 95;
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
      fieldname.str := 'mood';
      fieldname.len := 4;
      typecode := 87;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_xpmoodtype( result^.fieldvalue.str, result^.fieldvalue.len, rec.mood);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'thetaadv';
      fieldname.len := 8;
      typecode := 77;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_thetaadvtype( result^.fieldvalue.str, result^.fieldvalue.len, rec.thetaadv);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'advpatternefs';
      fieldname.len := 13;
      typecode := 116;
   END;
   result^.typeindicator := EnumSet;
   FOR advpatternefs:=synSER TO synVERBPPROP DO BEGIN
      IF advpatternefs IN rec.advpatternefs THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_synpatterntype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,advpatternefs);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'temporal';
      fieldname.len := 8;
      typecode := 21;
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
      fieldname.str := 'thanas';
      fieldname.len := 6;
      typecode := 75;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_thanascompltype( result^.fieldvalue.str, result^.fieldvalue.len, rec.thanas);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'thanascompl';
      fieldname.len := 11;
      typecode := 6;
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
      typecode := 110;
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
      typecode := 110;
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
      fieldname.str := 'Qstatus';
      fieldname.len := 7;
      typecode := 17;
   END;
   result^.typeindicator := Bool;
   IF rec.Qstatus = TRUE THEN BEGIN
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
      typecode := 82;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_timeadvclasstype( result^.fieldvalue.str, result^.fieldvalue.len, rec.class);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'tiempo';
      fieldname.len := 6;
      typecode := 81;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_tiempotype( result^.fieldvalue.str, result^.fieldvalue.len, rec.tiempo);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'aspecto';
      fieldname.len := 7;
      typecode := 34;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_aspectotype( result^.fieldvalue.str, result^.fieldvalue.len, rec.aspecto);
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
      fieldname.str := 'supertiempo';
      fieldname.len := 11;
      typecode := 81;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_tiempotype( result^.fieldvalue.str, result^.fieldvalue.len, rec.supertiempo);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'actsubcefs';
      fieldname.len := 10;
      typecode := 95;
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
      fieldname.str := 'mood';
      fieldname.len := 4;
      typecode := 87;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_xpmoodtype( result^.fieldvalue.str, result^.fieldvalue.len, rec.mood);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'thetaadv';
      fieldname.len := 8;
      typecode := 77;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_thetaadvtype( result^.fieldvalue.str, result^.fieldvalue.len, rec.thetaadv);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'advpatternefs';
      fieldname.len := 13;
      typecode := 116;
   END;
   result^.typeindicator := EnumSet;
   FOR advpatternefs:=synSER TO synVERBPPROP DO BEGIN
      IF advpatternefs IN rec.advpatternefs THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_synpatterntype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,advpatternefs);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'temporal';
      fieldname.len := 8;
      typecode := 21;
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
      fieldname.str := 'thanas';
      fieldname.len := 6;
      typecode := 75;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_thanascompltype( result^.fieldvalue.str, result^.fieldvalue.len, rec.thanas);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'thanascompl';
      fieldname.len := 11;
      typecode := 6;
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
      typecode := 110;
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
      typecode := 110;
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
      fieldname.str := 'Qstatus';
      fieldname.len := 7;
      typecode := 17;
   END;
   result^.typeindicator := Bool;
   IF rec.Qstatus = TRUE THEN BEGIN
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
      typecode := 82;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_timeadvclasstype( result^.fieldvalue.str, result^.fieldvalue.len, rec.class);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'tiempo';
      fieldname.len := 6;
      typecode := 81;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_tiempotype( result^.fieldvalue.str, result^.fieldvalue.len, rec.tiempo);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'aspecto';
      fieldname.len := 7;
      typecode := 34;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_aspectotype( result^.fieldvalue.str, result^.fieldvalue.len, rec.aspecto);
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
      typecode := 96;
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
      fieldname.str := 'supertiempo';
      fieldname.len := 11;
      typecode := 81;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_tiempotype( result^.fieldvalue.str, result^.fieldvalue.len, rec.supertiempo);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'actsubcefs';
      fieldname.len := 10;
      typecode := 95;
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
      fieldname.str := 'mood';
      fieldname.len := 4;
      typecode := 87;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_xpmoodtype( result^.fieldvalue.str, result^.fieldvalue.len, rec.mood);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'thetaadv';
      fieldname.len := 8;
      typecode := 77;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_thetaadvtype( result^.fieldvalue.str, result^.fieldvalue.len, rec.thetaadv);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'advpatternefs';
      fieldname.len := 13;
      typecode := 116;
   END;
   result^.typeindicator := EnumSet;
   FOR advpatternefs:=synSER TO synVERBPPROP DO BEGIN
      IF advpatternefs IN rec.advpatternefs THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_synpatterntype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,advpatternefs);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'temporal';
      fieldname.len := 8;
      typecode := 21;
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
      fieldname.str := 'thanas';
      fieldname.len := 6;
      typecode := 75;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_thanascompltype( result^.fieldvalue.str, result^.fieldvalue.len, rec.thanas);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'thanascompl';
      fieldname.len := 11;
      typecode := 6;
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
      fieldname.str := 'PROsubject';
      fieldname.len := 10;
      typecode := 16;
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
      typecode := 110;
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
      typecode := 110;
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
      fieldname.str := 'Qstatus';
      fieldname.len := 7;
      typecode := 17;
   END;
   result^.typeindicator := Bool;
   IF rec.Qstatus = TRUE THEN BEGIN
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
      typecode := 82;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_timeadvclasstype( result^.fieldvalue.str, result^.fieldvalue.len, rec.class);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'tiempo';
      fieldname.len := 6;
      typecode := 81;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_tiempotype( result^.fieldvalue.str, result^.fieldvalue.len, rec.tiempo);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'aspecto';
      fieldname.len := 7;
      typecode := 34;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_aspectotype( result^.fieldvalue.str, result^.fieldvalue.len, rec.aspecto);
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
      typecode := 96;
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
      fieldname.str := 'supertiempo';
      fieldname.len := 11;
      typecode := 81;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_tiempotype( result^.fieldvalue.str, result^.fieldvalue.len, rec.supertiempo);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'actsubcefs';
      fieldname.len := 10;
      typecode := 95;
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
      fieldname.str := 'mood';
      fieldname.len := 4;
      typecode := 87;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_xpmoodtype( result^.fieldvalue.str, result^.fieldvalue.len, rec.mood);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'thetaadv';
      fieldname.len := 8;
      typecode := 77;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_thetaadvtype( result^.fieldvalue.str, result^.fieldvalue.len, rec.thetaadv);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'advpatternefs';
      fieldname.len := 13;
      typecode := 116;
   END;
   result^.typeindicator := EnumSet;
   FOR advpatternefs:=synSER TO synVERBPPROP DO BEGIN
      IF advpatternefs IN rec.advpatternefs THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_synpatterntype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,advpatternefs);
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
      fieldname.str := 'temporal';
      fieldname.len := 8;
      typecode := 21;
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
      fieldname.str := 'thanas';
      fieldname.len := 6;
      typecode := 75;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_thanascompltype( result^.fieldvalue.str, result^.fieldvalue.len, rec.thanas);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'thanascompl';
      fieldname.len := 11;
      typecode := 6;
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
      fieldname.str := 'PROsubject';
      fieldname.len := 10;
      typecode := 16;
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
   LSCONVREC_ADVPPROPVARrecord := result;
END {LSCONVREC_ADVPPROPVARrecord};

FUNCTION LSCONVREC_ARTrecord(rec: LSDOMAINT_ARTrecord): LDCONVREC_pAttrStruct;
VAR result : LDCONVREC_pAttrStruct;
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
      typecode := 46;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_deftype( result^.fieldvalue.str, result^.fieldvalue.len, rec.definite);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'genero';
      fieldname.len := 6;
      typecode := 52;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_generotype( result^.fieldvalue.str, result^.fieldvalue.len, rec.genero);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'posscomas';
      fieldname.len := 9;
      typecode := 111;
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
      fieldname.str := 'numero';
      fieldname.len := 6;
      typecode := 61;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_numerotype( result^.fieldvalue.str, result^.fieldvalue.len, rec.numero);
   LSCONVREC_ARTrecord := result;
END {LSCONVREC_ARTrecord};

FUNCTION LSCONVREC_CLAUSErecord(rec: LSDOMAINT_CLAUSErecord): LDCONVREC_pAttrStruct;
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
      typecode := 110;
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
      typecode := 110;
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
      typecode := 85;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_voicetype( result^.fieldvalue.str, result^.fieldvalue.len, rec.voice);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'PROsubject';
      fieldname.len := 10;
      typecode := 16;
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
      typecode := 116;
   END;
   result^.typeindicator := EnumSet;
   FOR synvpefs:=synSER TO synVERBPPROP DO BEGIN
      IF synvpefs IN rec.synvpefs THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_synpatterntype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,synvpefs);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'thetavp';
      fieldname.len := 7;
      typecode := 80;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_thetavptype( result^.fieldvalue.str, result^.fieldvalue.len, rec.thetavp);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'adjuncts';
      fieldname.len := 8;
      typecode := 92;
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
      fieldname.str := 'mood';
      fieldname.len := 4;
      typecode := 57;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_moodtype( result^.fieldvalue.str, result^.fieldvalue.len, rec.mood);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'modo';
      fieldname.len := 4;
      typecode := 56;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_modotype( result^.fieldvalue.str, result^.fieldvalue.len, rec.modo);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'aktionsarts';
      fieldname.len := 11;
      typecode := 96;
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
      fieldname.str := 'aspecto';
      fieldname.len := 7;
      typecode := 34;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_aspectotype( result^.fieldvalue.str, result^.fieldvalue.len, rec.aspecto);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'tiempo';
      fieldname.len := 6;
      typecode := 81;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_tiempotype( result^.fieldvalue.str, result^.fieldvalue.len, rec.tiempo);
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
      typecode := 49;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_finitenesstype( result^.fieldvalue.str, result^.fieldvalue.len, rec.finiteness);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'VRcompl';
      fieldname.len := 7;
      typecode := 23;
   END;
   result^.typeindicator := Bool;
   IF rec.VRcompl = TRUE THEN BEGIN
      result^.fieldvalue.str := 'TRUE';
      result^.fieldvalue.len := 4;
      END
   ELSE BEGIN
      result^.fieldvalue.str := 'FALSE';
      result^.fieldvalue.len := 5;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'supertiempo';
      fieldname.len := 11;
      typecode := 81;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_tiempotype( result^.fieldvalue.str, result^.fieldvalue.len, rec.supertiempo);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'Restructuring';
      fieldname.len := 13;
      typecode := 18;
   END;
   result^.typeindicator := Bool;
   IF rec.Restructuring = TRUE THEN BEGIN
      result^.fieldvalue.str := 'TRUE';
      result^.fieldvalue.len := 4;
      END
   ELSE BEGIN
      result^.fieldvalue.str := 'FALSE';
      result^.fieldvalue.len := 5;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'negpos';
      fieldname.len := 6;
      typecode := 58;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_negpostype( result^.fieldvalue.str, result^.fieldvalue.len, rec.negpos);
   LSCONVREC_CLAUSErecord := result;
END {LSCONVREC_CLAUSErecord};

FUNCTION LSCONVREC_CLAUSEVARrecord(rec: LSDOMAINT_CLAUSEVARrecord): LDCONVREC_pAttrStruct;
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
      typecode := 110;
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
      typecode := 110;
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
      typecode := 85;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_voicetype( result^.fieldvalue.str, result^.fieldvalue.len, rec.voice);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'PROsubject';
      fieldname.len := 10;
      typecode := 16;
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
      typecode := 116;
   END;
   result^.typeindicator := EnumSet;
   FOR synvpefs:=synSER TO synVERBPPROP DO BEGIN
      IF synvpefs IN rec.synvpefs THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_synpatterntype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,synvpefs);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'thetavp';
      fieldname.len := 7;
      typecode := 80;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_thetavptype( result^.fieldvalue.str, result^.fieldvalue.len, rec.thetavp);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'adjuncts';
      fieldname.len := 8;
      typecode := 92;
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
      fieldname.str := 'mood';
      fieldname.len := 4;
      typecode := 57;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_moodtype( result^.fieldvalue.str, result^.fieldvalue.len, rec.mood);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'modo';
      fieldname.len := 4;
      typecode := 56;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_modotype( result^.fieldvalue.str, result^.fieldvalue.len, rec.modo);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'aktionsarts';
      fieldname.len := 11;
      typecode := 96;
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
      fieldname.str := 'aspecto';
      fieldname.len := 7;
      typecode := 34;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_aspectotype( result^.fieldvalue.str, result^.fieldvalue.len, rec.aspecto);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'tiempo';
      fieldname.len := 6;
      typecode := 81;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_tiempotype( result^.fieldvalue.str, result^.fieldvalue.len, rec.tiempo);
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
      typecode := 49;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_finitenesstype( result^.fieldvalue.str, result^.fieldvalue.len, rec.finiteness);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'VRcompl';
      fieldname.len := 7;
      typecode := 23;
   END;
   result^.typeindicator := Bool;
   IF rec.VRcompl = TRUE THEN BEGIN
      result^.fieldvalue.str := 'TRUE';
      result^.fieldvalue.len := 4;
      END
   ELSE BEGIN
      result^.fieldvalue.str := 'FALSE';
      result^.fieldvalue.len := 5;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'supertiempo';
      fieldname.len := 11;
      typecode := 81;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_tiempotype( result^.fieldvalue.str, result^.fieldvalue.len, rec.supertiempo);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'Restructuring';
      fieldname.len := 13;
      typecode := 18;
   END;
   result^.typeindicator := Bool;
   IF rec.Restructuring = TRUE THEN BEGIN
      result^.fieldvalue.str := 'TRUE';
      result^.fieldvalue.len := 4;
      END
   ELSE BEGIN
      result^.fieldvalue.str := 'FALSE';
      result^.fieldvalue.len := 5;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'negpos';
      fieldname.len := 6;
      typecode := 58;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_negpostype( result^.fieldvalue.str, result^.fieldvalue.len, rec.negpos);
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
      typecode := 110;
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
      typecode := 110;
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
      typecode := 82;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_timeadvclasstype( result^.fieldvalue.str, result^.fieldvalue.len, rec.class);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'tiempo';
      fieldname.len := 6;
      typecode := 81;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_tiempotype( result^.fieldvalue.str, result^.fieldvalue.len, rec.tiempo);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'aspecto';
      fieldname.len := 7;
      typecode := 34;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_aspectotype( result^.fieldvalue.str, result^.fieldvalue.len, rec.aspecto);
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
      typecode := 21;
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
      fieldname.str := 'conjpatterns';
      fieldname.len := 12;
      typecode := 115;
   END;
   result^.typeindicator := EnumSet;
   FOR conjpatterns:=synSER TO synVERBPPROP DO BEGIN
      IF conjpatterns IN rec.conjpatterns THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_synpatterntype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,conjpatterns);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'distri';
      fieldname.len := 6;
      typecode := 104;
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
    inducednumbers : LSDOMAINT_numerotype; 
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
      typecode := 10;
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
   FOR patterns:=npc TO Spapc DO BEGIN
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
   FOR inducednumbers:=singular TO omeganumero DO BEGIN
      IF inducednumbers IN rec.inducednumbers THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_numerotype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,inducednumbers);
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
      typecode := 110;
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
      typecode := 110;
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

FUNCTION LSCONVREC_BDEMADJrecord(rec: LSDOMAINT_BDEMADJrecord): LDCONVREC_pAttrStruct;
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
   LSCONVREC_BDEMADJrecord := result;
END {LSCONVREC_BDEMADJrecord};

FUNCTION LSCONVREC_DEMADJrecord(rec: LSDOMAINT_DEMADJrecord): LDCONVREC_pAttrStruct;
VAR result : LDCONVREC_pAttrStruct;
BEGIN
   result := NIL;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'numero';
      fieldname.len := 6;
      typecode := 61;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_numerotype( result^.fieldvalue.str, result^.fieldvalue.len, rec.numero);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'genero';
      fieldname.len := 6;
      typecode := 52;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_generotype( result^.fieldvalue.str, result^.fieldvalue.len, rec.genero);
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
      fieldname.str := 'numero';
      fieldname.len := 6;
      typecode := 61;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_numerotype( result^.fieldvalue.str, result^.fieldvalue.len, rec.numero);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'genero';
      fieldname.len := 6;
      typecode := 52;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_generotype( result^.fieldvalue.str, result^.fieldvalue.len, rec.genero);
   LSCONVREC_DEMPROrecord := result;
END {LSCONVREC_DEMPROrecord};

FUNCTION LSCONVREC_BDETrecord(rec: LSDOMAINT_BDETrecord): LDCONVREC_pAttrStruct;
VAR result : LDCONVREC_pAttrStruct;
    req : LSDOMAINT_polaritytype; 
    env : LSDOMAINT_polaritytype; 
    possnumbers : LSDOMAINT_numerotype; 
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
      typecode := 110;
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
      typecode := 110;
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
      fieldname.str := 'possnumbers';
      fieldname.len := 11;
      typecode := 112;
   END;
   result^.typeindicator := EnumSet;
   FOR possnumbers:=singular TO omeganumero DO BEGIN
      IF possnumbers IN rec.possnumbers THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_numerotype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,possnumbers);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'flection';
      fieldname.len := 8;
      typecode := 8;
   END;
   result^.typeindicator := Bool;
   IF rec.flection = TRUE THEN BEGIN
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
      typecode := 46;
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
      fieldname.str := 'posscomas';
      fieldname.len := 9;
      typecode := 111;
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
      typecode := 87;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_xpmoodtype( result^.fieldvalue.str, result^.fieldvalue.len, rec.mood);
   LSCONVREC_BDETrecord := result;
END {LSCONVREC_BDETrecord};

FUNCTION LSCONVREC_DETrecord(rec: LSDOMAINT_DETrecord): LDCONVREC_pAttrStruct;
VAR result : LDCONVREC_pAttrStruct;
    req : LSDOMAINT_polaritytype; 
    env : LSDOMAINT_polaritytype; 
    posscomas : LSDOMAINT_posscomatype; 
BEGIN
   result := NIL;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'req';
      fieldname.len := 3;
      typecode := 110;
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
      typecode := 110;
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
      fieldname.str := 'numero';
      fieldname.len := 6;
      typecode := 61;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_numerotype( result^.fieldvalue.str, result^.fieldvalue.len, rec.numero);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'genero';
      fieldname.len := 6;
      typecode := 52;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_generotype( result^.fieldvalue.str, result^.fieldvalue.len, rec.genero);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'definite';
      fieldname.len := 8;
      typecode := 46;
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
      fieldname.str := 'posscomas';
      fieldname.len := 9;
      typecode := 111;
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
      typecode := 87;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_xpmoodtype( result^.fieldvalue.str, result^.fieldvalue.len, rec.mood);
   LSCONVREC_DETrecord := result;
END {LSCONVREC_DETrecord};

FUNCTION LSCONVREC_DETPrecord(rec: LSDOMAINT_DETPrecord): LDCONVREC_pAttrStruct;
VAR result : LDCONVREC_pAttrStruct;
    req : LSDOMAINT_polaritytype; 
    env : LSDOMAINT_polaritytype; 
    posscomas : LSDOMAINT_posscomatype; 
BEGIN
   result := NIL;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'req';
      fieldname.len := 3;
      typecode := 110;
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
      typecode := 110;
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
      fieldname.str := 'numero';
      fieldname.len := 6;
      typecode := 61;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_numerotype( result^.fieldvalue.str, result^.fieldvalue.len, rec.numero);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'genero';
      fieldname.len := 6;
      typecode := 52;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_generotype( result^.fieldvalue.str, result^.fieldvalue.len, rec.genero);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'definite';
      fieldname.len := 8;
      typecode := 46;
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
      fieldname.str := 'posscomas';
      fieldname.len := 9;
      typecode := 111;
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
      typecode := 87;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_xpmoodtype( result^.fieldvalue.str, result^.fieldvalue.len, rec.mood);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'syntquant';
      fieldname.len := 9;
      typecode := 74;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_syntquanttype( result^.fieldvalue.str, result^.fieldvalue.len, rec.syntquant);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'supertiempo';
      fieldname.len := 11;
      typecode := 81;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_tiempotype( result^.fieldvalue.str, result^.fieldvalue.len, rec.supertiempo);
   LSCONVREC_DETPrecord := result;
END {LSCONVREC_DETPrecord};

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
      fieldname.str := 'persona';
      fieldname.len := 7;
      typecode := 88;
   END;
   result^.typeindicator := SubRange;
   LSTYPETOSTR_personatype( result^.fieldvalue.str, result^.fieldvalue.len, rec.persona);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'numero';
      fieldname.len := 6;
      typecode := 61;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_numerotype( result^.fieldvalue.str, result^.fieldvalue.len, rec.numero);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'genero';
      fieldname.len := 6;
      typecode := 52;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_generotype( result^.fieldvalue.str, result^.fieldvalue.len, rec.genero);
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
      fieldname.str := 'persona';
      fieldname.len := 7;
      typecode := 88;
   END;
   result^.typeindicator := SubRange;
   LSTYPETOSTR_personatype( result^.fieldvalue.str, result^.fieldvalue.len, rec.persona);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'numero';
      fieldname.len := 6;
      typecode := 61;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_numerotype( result^.fieldvalue.str, result^.fieldvalue.len, rec.numero);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'genero';
      fieldname.len := 6;
      typecode := 52;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_generotype( result^.fieldvalue.str, result^.fieldvalue.len, rec.genero);
   LSCONVREC_EMPTYVARrecord := result;
END {LSCONVREC_EMPTYVARrecord};

FUNCTION LSCONVREC_ECrecord(rec: LSDOMAINT_ECrecord): LDCONVREC_pAttrStruct;
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
   LSCONVREC_ECrecord := result;
END {LSCONVREC_ECrecord};

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
      typecode := 110;
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
      typecode := 110;
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
      typecode := 46;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_deftype( result^.fieldvalue.str, result^.fieldvalue.len, rec.definite);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'numero';
      fieldname.len := 6;
      typecode := 61;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_numerotype( result^.fieldvalue.str, result^.fieldvalue.len, rec.numero);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'mood';
      fieldname.len := 4;
      typecode := 87;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_xpmoodtype( result^.fieldvalue.str, result^.fieldvalue.len, rec.mood);
   LSCONVREC_INDEFPROrecord := result;
END {LSCONVREC_INDEFPROrecord};

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
      typecode := 89;
   END;
   result^.typeindicator := SubRange;
   LSTYPETOSTR_valuetype( result^.fieldvalue.str, result^.fieldvalue.len, rec.valeu);
   LSCONVREC_DIGITrecord := result;
END {LSCONVREC_DIGITrecord};

FUNCTION LSCONVREC_CARDrecord(rec: LSDOMAINT_CARDrecord): LDCONVREC_pAttrStruct;
VAR result : LDCONVREC_pAttrStruct;
BEGIN
   result := NIL;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'numero';
      fieldname.len := 6;
      typecode := 61;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_numerotype( result^.fieldvalue.str, result^.fieldvalue.len, rec.numero);
   LSCONVREC_CARDrecord := result;
END {LSCONVREC_CARDrecord};

FUNCTION LSCONVREC_BNOUNrecord(rec: LSDOMAINT_BNOUNrecord): LDCONVREC_pAttrStruct;
VAR result : LDCONVREC_pAttrStruct;
    req : LSDOMAINT_polaritytype; 
    env : LSDOMAINT_polaritytype; 
    generos : LSDOMAINT_generotype; 
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
      typecode := 110;
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
      typecode := 110;
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
      fieldname.str := 'pluralforma';
      fieldname.len := 11;
      typecode := 63;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_pluralformatype( result^.fieldvalue.str, result^.fieldvalue.len, rec.pluralforma);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'generos';
      fieldname.len := 7;
      typecode := 105;
   END;
   result^.typeindicator := EnumSet;
   FOR generos:=masc TO omegagenero DO BEGIN
      IF generos IN rec.generos THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_generotype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,generos);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'class';
      fieldname.len := 5;
      typecode := 82;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_timeadvclasstype( result^.fieldvalue.str, result^.fieldvalue.len, rec.class);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'tiempo';
      fieldname.len := 6;
      typecode := 81;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_tiempotype( result^.fieldvalue.str, result^.fieldvalue.len, rec.tiempo);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'aspecto';
      fieldname.len := 7;
      typecode := 34;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_aspectotype( result^.fieldvalue.str, result^.fieldvalue.len, rec.aspecto);
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
      fieldname.str := 'subcs';
      fieldname.len := 5;
      typecode := 106;
   END;
   result^.typeindicator := EnumSet;
   FOR subcs:=vocativenoun TO daynoun DO BEGIN
      IF subcs IN rec.subcs THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_nounsubctype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,subcs);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'temporal';
      fieldname.len := 8;
      typecode := 21;
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
      typecode := 53;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_humantype( result^.fieldvalue.str, result^.fieldvalue.len, rec.human);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'posscomas';
      fieldname.len := 9;
      typecode := 111;
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
      typecode := 78;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_thetanptype( result^.fieldvalue.str, result^.fieldvalue.len, rec.thetanp);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'nounpatterns';
      fieldname.len := 12;
      typecode := 115;
   END;
   result^.typeindicator := EnumSet;
   FOR nounpatterns:=synSER TO synVERBPPROP DO BEGIN
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
      typecode := 11;
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
      fieldname.str := 'Npropio';
      fieldname.len := 7;
      typecode := 71;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_sinotype( result^.fieldvalue.str, result^.fieldvalue.len, rec.Npropio);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'inalienable';
      fieldname.len := 11;
      typecode := 71;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_sinotype( result^.fieldvalue.str, result^.fieldvalue.len, rec.inalienable);
   LSCONVREC_BNOUNrecord := result;
END {LSCONVREC_BNOUNrecord};

FUNCTION LSCONVREC_SUBNOUNrecord(rec: LSDOMAINT_SUBNOUNrecord): LDCONVREC_pAttrStruct;
VAR result : LDCONVREC_pAttrStruct;
    req : LSDOMAINT_polaritytype; 
    env : LSDOMAINT_polaritytype; 
    generos : LSDOMAINT_generotype; 
    subcs : LSDOMAINT_nounsubctype; 
    posscomas : LSDOMAINT_posscomatype; 
    nounpatterns : LSDOMAINT_synpatterntype; 
BEGIN
   result := NIL;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'req';
      fieldname.len := 3;
      typecode := 110;
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
      typecode := 110;
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
      fieldname.str := 'pluralforma';
      fieldname.len := 11;
      typecode := 63;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_pluralformatype( result^.fieldvalue.str, result^.fieldvalue.len, rec.pluralforma);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'generos';
      fieldname.len := 7;
      typecode := 105;
   END;
   result^.typeindicator := EnumSet;
   FOR generos:=masc TO omegagenero DO BEGIN
      IF generos IN rec.generos THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_generotype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,generos);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'class';
      fieldname.len := 5;
      typecode := 82;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_timeadvclasstype( result^.fieldvalue.str, result^.fieldvalue.len, rec.class);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'tiempo';
      fieldname.len := 6;
      typecode := 81;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_tiempotype( result^.fieldvalue.str, result^.fieldvalue.len, rec.tiempo);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'aspecto';
      fieldname.len := 7;
      typecode := 34;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_aspectotype( result^.fieldvalue.str, result^.fieldvalue.len, rec.aspecto);
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
      fieldname.str := 'subcs';
      fieldname.len := 5;
      typecode := 106;
   END;
   result^.typeindicator := EnumSet;
   FOR subcs:=vocativenoun TO daynoun DO BEGIN
      IF subcs IN rec.subcs THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_nounsubctype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,subcs);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'temporal';
      fieldname.len := 8;
      typecode := 21;
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
      typecode := 53;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_humantype( result^.fieldvalue.str, result^.fieldvalue.len, rec.human);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'posscomas';
      fieldname.len := 9;
      typecode := 111;
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
      typecode := 78;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_thetanptype( result^.fieldvalue.str, result^.fieldvalue.len, rec.thetanp);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'nounpatterns';
      fieldname.len := 12;
      typecode := 115;
   END;
   result^.typeindicator := EnumSet;
   FOR nounpatterns:=synSER TO synVERBPPROP DO BEGIN
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
      typecode := 11;
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
      fieldname.str := 'Npropio';
      fieldname.len := 7;
      typecode := 71;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_sinotype( result^.fieldvalue.str, result^.fieldvalue.len, rec.Npropio);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'inalienable';
      fieldname.len := 11;
      typecode := 71;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_sinotype( result^.fieldvalue.str, result^.fieldvalue.len, rec.inalienable);
   LSCONVREC_SUBNOUNrecord := result;
END {LSCONVREC_SUBNOUNrecord};

FUNCTION LSCONVREC_NOUNrecord(rec: LSDOMAINT_NOUNrecord): LDCONVREC_pAttrStruct;
VAR result : LDCONVREC_pAttrStruct;
    req : LSDOMAINT_polaritytype; 
    env : LSDOMAINT_polaritytype; 
    generos : LSDOMAINT_generotype; 
    subcs : LSDOMAINT_nounsubctype; 
    posscomas : LSDOMAINT_posscomatype; 
    nounpatterns : LSDOMAINT_synpatterntype; 
BEGIN
   result := NIL;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'req';
      fieldname.len := 3;
      typecode := 110;
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
      typecode := 110;
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
      fieldname.str := 'pluralforma';
      fieldname.len := 11;
      typecode := 63;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_pluralformatype( result^.fieldvalue.str, result^.fieldvalue.len, rec.pluralforma);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'generos';
      fieldname.len := 7;
      typecode := 105;
   END;
   result^.typeindicator := EnumSet;
   FOR generos:=masc TO omegagenero DO BEGIN
      IF generos IN rec.generos THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_generotype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,generos);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'numero';
      fieldname.len := 6;
      typecode := 61;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_numerotype( result^.fieldvalue.str, result^.fieldvalue.len, rec.numero);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'class';
      fieldname.len := 5;
      typecode := 82;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_timeadvclasstype( result^.fieldvalue.str, result^.fieldvalue.len, rec.class);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'tiempo';
      fieldname.len := 6;
      typecode := 81;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_tiempotype( result^.fieldvalue.str, result^.fieldvalue.len, rec.tiempo);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'aspecto';
      fieldname.len := 7;
      typecode := 34;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_aspectotype( result^.fieldvalue.str, result^.fieldvalue.len, rec.aspecto);
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
      fieldname.str := 'subcs';
      fieldname.len := 5;
      typecode := 106;
   END;
   result^.typeindicator := EnumSet;
   FOR subcs:=vocativenoun TO daynoun DO BEGIN
      IF subcs IN rec.subcs THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_nounsubctype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,subcs);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'temporal';
      fieldname.len := 8;
      typecode := 21;
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
      typecode := 53;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_humantype( result^.fieldvalue.str, result^.fieldvalue.len, rec.human);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'posscomas';
      fieldname.len := 9;
      typecode := 111;
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
      typecode := 78;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_thetanptype( result^.fieldvalue.str, result^.fieldvalue.len, rec.thetanp);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'nounpatterns';
      fieldname.len := 12;
      typecode := 115;
   END;
   result^.typeindicator := EnumSet;
   FOR nounpatterns:=synSER TO synVERBPPROP DO BEGIN
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
      typecode := 11;
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
      fieldname.str := 'Npropio';
      fieldname.len := 7;
      typecode := 71;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_sinotype( result^.fieldvalue.str, result^.fieldvalue.len, rec.Npropio);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'inalienable';
      fieldname.len := 11;
      typecode := 71;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_sinotype( result^.fieldvalue.str, result^.fieldvalue.len, rec.inalienable);
   LSCONVREC_NOUNrecord := result;
END {LSCONVREC_NOUNrecord};

FUNCTION LSCONVREC_CNrecord(rec: LSDOMAINT_CNrecord): LDCONVREC_pAttrStruct;
VAR result : LDCONVREC_pAttrStruct;
    req : LSDOMAINT_polaritytype; 
    env : LSDOMAINT_polaritytype; 
    generos : LSDOMAINT_generotype; 
    actsubcs : LSDOMAINT_nounsubctype; 
    posscomas : LSDOMAINT_posscomatype; 
    nounpatternefs : LSDOMAINT_synpatterntype; 
    cases : LSDOMAINT_casetype; 
BEGIN
   result := NIL;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'req';
      fieldname.len := 3;
      typecode := 110;
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
      typecode := 110;
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
      fieldname.str := 'supertiempo';
      fieldname.len := 11;
      typecode := 81;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_tiempotype( result^.fieldvalue.str, result^.fieldvalue.len, rec.supertiempo);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'class';
      fieldname.len := 5;
      typecode := 82;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_timeadvclasstype( result^.fieldvalue.str, result^.fieldvalue.len, rec.class);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'tiempo';
      fieldname.len := 6;
      typecode := 81;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_tiempotype( result^.fieldvalue.str, result^.fieldvalue.len, rec.tiempo);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'aspecto';
      fieldname.len := 7;
      typecode := 34;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_aspectotype( result^.fieldvalue.str, result^.fieldvalue.len, rec.aspecto);
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
      typecode := 46;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_deftype( result^.fieldvalue.str, result^.fieldvalue.len, rec.definite);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'numero';
      fieldname.len := 6;
      typecode := 61;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_numerotype( result^.fieldvalue.str, result^.fieldvalue.len, rec.numero);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'generos';
      fieldname.len := 7;
      typecode := 105;
   END;
   result^.typeindicator := EnumSet;
   FOR generos:=masc TO omegagenero DO BEGIN
      IF generos IN rec.generos THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_generotype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,generos);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'actsubcs';
      fieldname.len := 8;
      typecode := 107;
   END;
   result^.typeindicator := EnumSet;
   FOR actsubcs:=vocativenoun TO daynoun DO BEGIN
      IF actsubcs IN rec.actsubcs THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_nounsubctype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,actsubcs);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'temporal';
      fieldname.len := 8;
      typecode := 21;
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
      typecode := 53;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_humantype( result^.fieldvalue.str, result^.fieldvalue.len, rec.human);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'posscomas';
      fieldname.len := 9;
      typecode := 111;
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
      typecode := 78;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_thetanptype( result^.fieldvalue.str, result^.fieldvalue.len, rec.thetanp);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'nounpatternefs';
      fieldname.len := 14;
      typecode := 116;
   END;
   result^.typeindicator := EnumSet;
   FOR nounpatternefs:=synSER TO synVERBPPROP DO BEGIN
      IF nounpatternefs IN rec.nounpatternefs THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_synpatterntype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,nounpatternefs);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'cases';
      fieldname.len := 5;
      typecode := 98;
   END;
   result^.typeindicator := EnumSet;
   FOR cases:=nominative TO prepositive DO BEGIN
      IF cases IN rec.cases THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_casetype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,cases);
      END;
   END;
   LSCONVREC_CNrecord := result;
END {LSCONVREC_CNrecord};

FUNCTION LSCONVREC_CNVARrecord(rec: LSDOMAINT_CNVARrecord): LDCONVREC_pAttrStruct;
VAR result : LDCONVREC_pAttrStruct;
    req : LSDOMAINT_polaritytype; 
    env : LSDOMAINT_polaritytype; 
    generos : LSDOMAINT_generotype; 
    actsubcs : LSDOMAINT_nounsubctype; 
    posscomas : LSDOMAINT_posscomatype; 
    nounpatternefs : LSDOMAINT_synpatterntype; 
    cases : LSDOMAINT_casetype; 
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
      typecode := 110;
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
      typecode := 110;
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
      fieldname.str := 'supertiempo';
      fieldname.len := 11;
      typecode := 81;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_tiempotype( result^.fieldvalue.str, result^.fieldvalue.len, rec.supertiempo);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'class';
      fieldname.len := 5;
      typecode := 82;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_timeadvclasstype( result^.fieldvalue.str, result^.fieldvalue.len, rec.class);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'tiempo';
      fieldname.len := 6;
      typecode := 81;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_tiempotype( result^.fieldvalue.str, result^.fieldvalue.len, rec.tiempo);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'aspecto';
      fieldname.len := 7;
      typecode := 34;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_aspectotype( result^.fieldvalue.str, result^.fieldvalue.len, rec.aspecto);
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
      typecode := 46;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_deftype( result^.fieldvalue.str, result^.fieldvalue.len, rec.definite);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'numero';
      fieldname.len := 6;
      typecode := 61;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_numerotype( result^.fieldvalue.str, result^.fieldvalue.len, rec.numero);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'generos';
      fieldname.len := 7;
      typecode := 105;
   END;
   result^.typeindicator := EnumSet;
   FOR generos:=masc TO omegagenero DO BEGIN
      IF generos IN rec.generos THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_generotype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,generos);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'actsubcs';
      fieldname.len := 8;
      typecode := 107;
   END;
   result^.typeindicator := EnumSet;
   FOR actsubcs:=vocativenoun TO daynoun DO BEGIN
      IF actsubcs IN rec.actsubcs THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_nounsubctype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,actsubcs);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'temporal';
      fieldname.len := 8;
      typecode := 21;
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
      typecode := 53;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_humantype( result^.fieldvalue.str, result^.fieldvalue.len, rec.human);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'posscomas';
      fieldname.len := 9;
      typecode := 111;
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
      typecode := 78;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_thetanptype( result^.fieldvalue.str, result^.fieldvalue.len, rec.thetanp);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'nounpatternefs';
      fieldname.len := 14;
      typecode := 116;
   END;
   result^.typeindicator := EnumSet;
   FOR nounpatternefs:=synSER TO synVERBPPROP DO BEGIN
      IF nounpatternefs IN rec.nounpatternefs THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_synpatterntype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,nounpatternefs);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'cases';
      fieldname.len := 5;
      typecode := 98;
   END;
   result^.typeindicator := EnumSet;
   FOR cases:=nominative TO prepositive DO BEGIN
      IF cases IN rec.cases THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_casetype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,cases);
      END;
   END;
   LSCONVREC_CNVARrecord := result;
END {LSCONVREC_CNVARrecord};

FUNCTION LSCONVREC_NPrecord(rec: LSDOMAINT_NPrecord): LDCONVREC_pAttrStruct;
VAR result : LDCONVREC_pAttrStruct;
    req : LSDOMAINT_polaritytype; 
    env : LSDOMAINT_polaritytype; 
    actsubcs : LSDOMAINT_nounsubctype; 
    actcomas : LSDOMAINT_posscomatype; 
    nounpatternefs : LSDOMAINT_synpatterntype; 
    cases : LSDOMAINT_casetype; 
BEGIN
   result := NIL;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'req';
      fieldname.len := 3;
      typecode := 110;
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
      typecode := 110;
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
      fieldname.str := 'supertiempo';
      fieldname.len := 11;
      typecode := 81;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_tiempotype( result^.fieldvalue.str, result^.fieldvalue.len, rec.supertiempo);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'class';
      fieldname.len := 5;
      typecode := 82;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_timeadvclasstype( result^.fieldvalue.str, result^.fieldvalue.len, rec.class);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'tiempo';
      fieldname.len := 6;
      typecode := 81;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_tiempotype( result^.fieldvalue.str, result^.fieldvalue.len, rec.tiempo);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'aspecto';
      fieldname.len := 7;
      typecode := 34;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_aspectotype( result^.fieldvalue.str, result^.fieldvalue.len, rec.aspecto);
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
      fieldname.str := 'persona';
      fieldname.len := 7;
      typecode := 88;
   END;
   result^.typeindicator := SubRange;
   LSTYPETOSTR_personatype( result^.fieldvalue.str, result^.fieldvalue.len, rec.persona);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'genero';
      fieldname.len := 6;
      typecode := 52;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_generotype( result^.fieldvalue.str, result^.fieldvalue.len, rec.genero);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'actsubcs';
      fieldname.len := 8;
      typecode := 107;
   END;
   result^.typeindicator := EnumSet;
   FOR actsubcs:=vocativenoun TO daynoun DO BEGIN
      IF actsubcs IN rec.actsubcs THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_nounsubctype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,actsubcs);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'temporal';
      fieldname.len := 8;
      typecode := 21;
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
      typecode := 53;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_humantype( result^.fieldvalue.str, result^.fieldvalue.len, rec.human);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'actcomas';
      fieldname.len := 8;
      typecode := 111;
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
      fieldname.str := 'mood';
      fieldname.len := 4;
      typecode := 87;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_xpmoodtype( result^.fieldvalue.str, result^.fieldvalue.len, rec.mood);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'numero';
      fieldname.len := 6;
      typecode := 61;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_numerotype( result^.fieldvalue.str, result^.fieldvalue.len, rec.numero);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'definite';
      fieldname.len := 8;
      typecode := 46;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_deftype( result^.fieldvalue.str, result^.fieldvalue.len, rec.definite);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'generic';
      fieldname.len := 7;
      typecode := 51;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_generictype( result^.fieldvalue.str, result^.fieldvalue.len, rec.generic);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'thetanp';
      fieldname.len := 7;
      typecode := 78;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_thetanptype( result^.fieldvalue.str, result^.fieldvalue.len, rec.thetanp);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'nounpatternefs';
      fieldname.len := 14;
      typecode := 116;
   END;
   result^.typeindicator := EnumSet;
   FOR nounpatternefs:=synSER TO synVERBPPROP DO BEGIN
      IF nounpatternefs IN rec.nounpatternefs THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_synpatterntype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,nounpatternefs);
      END;
   END;
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
      typecode := 74;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_syntquanttype( result^.fieldvalue.str, result^.fieldvalue.len, rec.syntquant);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'NPhead';
      fieldname.len := 6;
      typecode := 60;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_npheadtype( result^.fieldvalue.str, result^.fieldvalue.len, rec.NPhead);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'SpecQ';
      fieldname.len := 5;
      typecode := 72;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_specqtype( result^.fieldvalue.str, result^.fieldvalue.len, rec.SpecQ);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'DefSpec';
      fieldname.len := 7;
      typecode := 7;
   END;
   result^.typeindicator := Bool;
   IF rec.DefSpec = TRUE THEN BEGIN
      result^.fieldvalue.str := 'TRUE';
      result^.fieldvalue.len := 4;
      END
   ELSE BEGIN
      result^.fieldvalue.str := 'FALSE';
      result^.fieldvalue.len := 5;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'cases';
      fieldname.len := 5;
      typecode := 98;
   END;
   result^.typeindicator := EnumSet;
   FOR cases:=nominative TO prepositive DO BEGIN
      IF cases IN rec.cases THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_casetype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,cases);
      END;
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
    actsubcs : LSDOMAINT_nounsubctype; 
    actcomas : LSDOMAINT_posscomatype; 
    nounpatternefs : LSDOMAINT_synpatterntype; 
    cases : LSDOMAINT_casetype; 
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
      typecode := 110;
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
      typecode := 110;
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
      fieldname.str := 'supertiempo';
      fieldname.len := 11;
      typecode := 81;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_tiempotype( result^.fieldvalue.str, result^.fieldvalue.len, rec.supertiempo);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'class';
      fieldname.len := 5;
      typecode := 82;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_timeadvclasstype( result^.fieldvalue.str, result^.fieldvalue.len, rec.class);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'tiempo';
      fieldname.len := 6;
      typecode := 81;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_tiempotype( result^.fieldvalue.str, result^.fieldvalue.len, rec.tiempo);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'aspecto';
      fieldname.len := 7;
      typecode := 34;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_aspectotype( result^.fieldvalue.str, result^.fieldvalue.len, rec.aspecto);
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
      fieldname.str := 'persona';
      fieldname.len := 7;
      typecode := 88;
   END;
   result^.typeindicator := SubRange;
   LSTYPETOSTR_personatype( result^.fieldvalue.str, result^.fieldvalue.len, rec.persona);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'genero';
      fieldname.len := 6;
      typecode := 52;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_generotype( result^.fieldvalue.str, result^.fieldvalue.len, rec.genero);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'actsubcs';
      fieldname.len := 8;
      typecode := 107;
   END;
   result^.typeindicator := EnumSet;
   FOR actsubcs:=vocativenoun TO daynoun DO BEGIN
      IF actsubcs IN rec.actsubcs THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_nounsubctype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,actsubcs);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'temporal';
      fieldname.len := 8;
      typecode := 21;
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
      typecode := 53;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_humantype( result^.fieldvalue.str, result^.fieldvalue.len, rec.human);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'actcomas';
      fieldname.len := 8;
      typecode := 111;
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
      fieldname.str := 'mood';
      fieldname.len := 4;
      typecode := 87;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_xpmoodtype( result^.fieldvalue.str, result^.fieldvalue.len, rec.mood);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'numero';
      fieldname.len := 6;
      typecode := 61;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_numerotype( result^.fieldvalue.str, result^.fieldvalue.len, rec.numero);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'definite';
      fieldname.len := 8;
      typecode := 46;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_deftype( result^.fieldvalue.str, result^.fieldvalue.len, rec.definite);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'generic';
      fieldname.len := 7;
      typecode := 51;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_generictype( result^.fieldvalue.str, result^.fieldvalue.len, rec.generic);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'thetanp';
      fieldname.len := 7;
      typecode := 78;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_thetanptype( result^.fieldvalue.str, result^.fieldvalue.len, rec.thetanp);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'nounpatternefs';
      fieldname.len := 14;
      typecode := 116;
   END;
   result^.typeindicator := EnumSet;
   FOR nounpatternefs:=synSER TO synVERBPPROP DO BEGIN
      IF nounpatternefs IN rec.nounpatternefs THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_synpatterntype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,nounpatternefs);
      END;
   END;
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
      typecode := 74;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_syntquanttype( result^.fieldvalue.str, result^.fieldvalue.len, rec.syntquant);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'NPhead';
      fieldname.len := 6;
      typecode := 60;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_npheadtype( result^.fieldvalue.str, result^.fieldvalue.len, rec.NPhead);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'SpecQ';
      fieldname.len := 5;
      typecode := 72;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_specqtype( result^.fieldvalue.str, result^.fieldvalue.len, rec.SpecQ);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'DefSpec';
      fieldname.len := 7;
      typecode := 7;
   END;
   result^.typeindicator := Bool;
   IF rec.DefSpec = TRUE THEN BEGIN
      result^.fieldvalue.str := 'TRUE';
      result^.fieldvalue.len := 4;
      END
   ELSE BEGIN
      result^.fieldvalue.str := 'FALSE';
      result^.fieldvalue.len := 5;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'cases';
      fieldname.len := 5;
      typecode := 98;
   END;
   result^.typeindicator := EnumSet;
   FOR cases:=nominative TO prepositive DO BEGIN
      IF cases IN rec.cases THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_casetype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,cases);
      END;
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
      typecode := 110;
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
      typecode := 110;
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
      fieldname.str := 'supertiempo';
      fieldname.len := 11;
      typecode := 81;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_tiempotype( result^.fieldvalue.str, result^.fieldvalue.len, rec.supertiempo);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'aktionsarts';
      fieldname.len := 11;
      typecode := 96;
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
      typecode := 78;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_thetanptype( result^.fieldvalue.str, result^.fieldvalue.len, rec.thetanp);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'nounpatternefs';
      fieldname.len := 14;
      typecode := 116;
   END;
   result^.typeindicator := EnumSet;
   FOR nounpatternefs:=synSER TO synVERBPPROP DO BEGIN
      IF nounpatternefs IN rec.nounpatternefs THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_synpatterntype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,nounpatternefs);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'PROsubject';
      fieldname.len := 10;
      typecode := 16;
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
      fieldname.str := 'DefSpec';
      fieldname.len := 7;
      typecode := 7;
   END;
   result^.typeindicator := Bool;
   IF rec.DefSpec = TRUE THEN BEGIN
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
      typecode := 110;
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
      typecode := 110;
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
      fieldname.str := 'supertiempo';
      fieldname.len := 11;
      typecode := 81;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_tiempotype( result^.fieldvalue.str, result^.fieldvalue.len, rec.supertiempo);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'aktionsarts';
      fieldname.len := 11;
      typecode := 96;
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
      typecode := 78;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_thetanptype( result^.fieldvalue.str, result^.fieldvalue.len, rec.thetanp);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'nounpatternefs';
      fieldname.len := 14;
      typecode := 116;
   END;
   result^.typeindicator := EnumSet;
   FOR nounpatternefs:=synSER TO synVERBPPROP DO BEGIN
      IF nounpatternefs IN rec.nounpatternefs THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_synpatterntype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,nounpatternefs);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'PROsubject';
      fieldname.len := 10;
      typecode := 16;
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
      fieldname.str := 'DefSpec';
      fieldname.len := 7;
      typecode := 7;
   END;
   result^.typeindicator := Bool;
   IF rec.DefSpec = TRUE THEN BEGIN
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
      fieldname.str := 'numero';
      fieldname.len := 6;
      typecode := 61;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_numerotype( result^.fieldvalue.str, result^.fieldvalue.len, rec.numero);
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
      fieldname.str := 'numero';
      fieldname.len := 6;
      typecode := 61;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_numerotype( result^.fieldvalue.str, result^.fieldvalue.len, rec.numero);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'genero';
      fieldname.len := 6;
      typecode := 52;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_generotype( result^.fieldvalue.str, result^.fieldvalue.len, rec.genero);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'persona';
      fieldname.len := 7;
      typecode := 88;
   END;
   result^.typeindicator := SubRange;
   LSTYPETOSTR_personatype( result^.fieldvalue.str, result^.fieldvalue.len, rec.persona);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'forma';
      fieldname.len := 5;
      typecode := 62;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_persproformatype( result^.fieldvalue.str, result^.fieldvalue.len, rec.forma);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'cortesia';
      fieldname.len := 8;
      typecode := 71;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_sinotype( result^.fieldvalue.str, result^.fieldvalue.len, rec.cortesia);
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
      typecode := 60;
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
      fieldname.str := 'numero';
      fieldname.len := 6;
      typecode := 61;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_numerotype( result^.fieldvalue.str, result^.fieldvalue.len, rec.numero);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'genero';
      fieldname.len := 6;
      typecode := 52;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_generotype( result^.fieldvalue.str, result^.fieldvalue.len, rec.genero);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'persona';
      fieldname.len := 7;
      typecode := 88;
   END;
   result^.typeindicator := SubRange;
   LSTYPETOSTR_personatype( result^.fieldvalue.str, result^.fieldvalue.len, rec.persona);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'forma';
      fieldname.len := 5;
      typecode := 62;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_persproformatype( result^.fieldvalue.str, result^.fieldvalue.len, rec.forma);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'cortesia';
      fieldname.len := 8;
      typecode := 71;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_sinotype( result^.fieldvalue.str, result^.fieldvalue.len, rec.cortesia);
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
      typecode := 60;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_npheadtype( result^.fieldvalue.str, result^.fieldvalue.len, rec.NPhead);
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
      fieldname.str := 'antecedent';
      fieldname.len := 10;
      typecode := 33;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_antecedenttype( result^.fieldvalue.str, result^.fieldvalue.len, rec.antecedent);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'concordnumero';
      fieldname.len := 13;
      typecode := 38;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_concordnumerotype( result^.fieldvalue.str, result^.fieldvalue.len, rec.concordnumero);
   LSCONVREC_POSSADJrecord := result;
END {LSCONVREC_POSSADJrecord};

FUNCTION LSCONVREC_BPOSSPROrecord(rec: LSDOMAINT_BPOSSPROrecord): LDCONVREC_pAttrStruct;
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
      fieldname.str := 'concordgenero';
      fieldname.len := 13;
      typecode := 37;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_concordgenerotype( result^.fieldvalue.str, result^.fieldvalue.len, rec.concordgenero);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'concordnumero';
      fieldname.len := 13;
      typecode := 38;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_concordnumerotype( result^.fieldvalue.str, result^.fieldvalue.len, rec.concordnumero);
   LSCONVREC_BPOSSPROrecord := result;
END {LSCONVREC_BPOSSPROrecord};

FUNCTION LSCONVREC_POSSPROrecord(rec: LSDOMAINT_POSSPROrecord): LDCONVREC_pAttrStruct;
VAR result : LDCONVREC_pAttrStruct;
BEGIN
   result := NIL;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'concordgenero';
      fieldname.len := 13;
      typecode := 37;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_concordgenerotype( result^.fieldvalue.str, result^.fieldvalue.len, rec.concordgenero);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'concordnumero';
      fieldname.len := 13;
      typecode := 38;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_concordnumerotype( result^.fieldvalue.str, result^.fieldvalue.len, rec.concordnumero);
   LSCONVREC_POSSPROrecord := result;
END {LSCONVREC_POSSPROrecord};

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
      typecode := 110;
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
      typecode := 110;
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
      typecode := 113;
   END;
   result^.typeindicator := EnumSet;
   FOR subcs:=loc TO other DO BEGIN
      IF subcs IN rec.subcs THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_prepsubctype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,subcs);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'synpps';
      fieldname.len := 6;
      typecode := 115;
   END;
   result^.typeindicator := EnumSet;
   FOR synpps:=synSER TO synVERBPPROP DO BEGIN
      IF synpps IN rec.synpps THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_synpatterntype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,synpps);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'thetapp';
      fieldname.len := 7;
      typecode := 79;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_thetapptype( result^.fieldvalue.str, result^.fieldvalue.len, rec.thetapp);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'class';
      fieldname.len := 5;
      typecode := 82;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_timeadvclasstype( result^.fieldvalue.str, result^.fieldvalue.len, rec.class);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'tiempo';
      fieldname.len := 6;
      typecode := 81;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_tiempotype( result^.fieldvalue.str, result^.fieldvalue.len, rec.tiempo);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'aspecto';
      fieldname.len := 7;
      typecode := 34;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_aspectotype( result^.fieldvalue.str, result^.fieldvalue.len, rec.aspecto);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'contraction';
      fieldname.len := 11;
      typecode := 40;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_contractiontype( result^.fieldvalue.str, result^.fieldvalue.len, rec.contraction);
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
      typecode := 110;
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
      typecode := 110;
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
      typecode := 87;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_xpmoodtype( result^.fieldvalue.str, result^.fieldvalue.len, rec.mood);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'actsubcefs';
      fieldname.len := 10;
      typecode := 114;
   END;
   result^.typeindicator := EnumSet;
   FOR actsubcefs:=loc TO other DO BEGIN
      IF actsubcefs IN rec.actsubcefs THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_prepsubctype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,actsubcefs);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'synppefs';
      fieldname.len := 8;
      typecode := 116;
   END;
   result^.typeindicator := EnumSet;
   FOR synppefs:=synSER TO synVERBPPROP DO BEGIN
      IF synppefs IN rec.synppefs THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_synpatterntype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,synppefs);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'thetapp';
      fieldname.len := 7;
      typecode := 79;
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
      typecode := 82;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_timeadvclasstype( result^.fieldvalue.str, result^.fieldvalue.len, rec.class);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'tiempo';
      fieldname.len := 6;
      typecode := 81;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_tiempotype( result^.fieldvalue.str, result^.fieldvalue.len, rec.tiempo);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'aspecto';
      fieldname.len := 7;
      typecode := 34;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_aspectotype( result^.fieldvalue.str, result^.fieldvalue.len, rec.aspecto);
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
      fieldname.str := 'supertiempo';
      fieldname.len := 11;
      typecode := 81;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_tiempotype( result^.fieldvalue.str, result^.fieldvalue.len, rec.supertiempo);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'SpecQ';
      fieldname.len := 5;
      typecode := 72;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_specqtype( result^.fieldvalue.str, result^.fieldvalue.len, rec.SpecQ);
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
      typecode := 110;
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
      typecode := 110;
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
      typecode := 87;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_xpmoodtype( result^.fieldvalue.str, result^.fieldvalue.len, rec.mood);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'actsubcefs';
      fieldname.len := 10;
      typecode := 114;
   END;
   result^.typeindicator := EnumSet;
   FOR actsubcefs:=loc TO other DO BEGIN
      IF actsubcefs IN rec.actsubcefs THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_prepsubctype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,actsubcefs);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'synppefs';
      fieldname.len := 8;
      typecode := 116;
   END;
   result^.typeindicator := EnumSet;
   FOR synppefs:=synSER TO synVERBPPROP DO BEGIN
      IF synppefs IN rec.synppefs THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_synpatterntype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,synppefs);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'thetapp';
      fieldname.len := 7;
      typecode := 79;
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
      typecode := 82;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_timeadvclasstype( result^.fieldvalue.str, result^.fieldvalue.len, rec.class);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'tiempo';
      fieldname.len := 6;
      typecode := 81;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_tiempotype( result^.fieldvalue.str, result^.fieldvalue.len, rec.tiempo);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'aspecto';
      fieldname.len := 7;
      typecode := 34;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_aspectotype( result^.fieldvalue.str, result^.fieldvalue.len, rec.aspecto);
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
      fieldname.str := 'supertiempo';
      fieldname.len := 11;
      typecode := 81;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_tiempotype( result^.fieldvalue.str, result^.fieldvalue.len, rec.supertiempo);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'SpecQ';
      fieldname.len := 5;
      typecode := 72;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_specqtype( result^.fieldvalue.str, result^.fieldvalue.len, rec.SpecQ);
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
      typecode := 110;
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
      typecode := 110;
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
      typecode := 87;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_xpmoodtype( result^.fieldvalue.str, result^.fieldvalue.len, rec.mood);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'actsubcefs';
      fieldname.len := 10;
      typecode := 114;
   END;
   result^.typeindicator := EnumSet;
   FOR actsubcefs:=loc TO other DO BEGIN
      IF actsubcefs IN rec.actsubcefs THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_prepsubctype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,actsubcefs);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'PROsubject';
      fieldname.len := 10;
      typecode := 16;
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
      typecode := 116;
   END;
   result^.typeindicator := EnumSet;
   FOR synppefs:=synSER TO synVERBPPROP DO BEGIN
      IF synppefs IN rec.synppefs THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_synpatterntype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,synppefs);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'thetapp';
      fieldname.len := 7;
      typecode := 79;
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
      typecode := 82;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_timeadvclasstype( result^.fieldvalue.str, result^.fieldvalue.len, rec.class);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'tiempo';
      fieldname.len := 6;
      typecode := 81;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_tiempotype( result^.fieldvalue.str, result^.fieldvalue.len, rec.tiempo);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'aspecto';
      fieldname.len := 7;
      typecode := 34;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_aspectotype( result^.fieldvalue.str, result^.fieldvalue.len, rec.aspecto);
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
      typecode := 96;
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
      fieldname.str := 'supertiempo';
      fieldname.len := 11;
      typecode := 81;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_tiempotype( result^.fieldvalue.str, result^.fieldvalue.len, rec.supertiempo);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'SpecQ';
      fieldname.len := 5;
      typecode := 72;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_specqtype( result^.fieldvalue.str, result^.fieldvalue.len, rec.SpecQ);
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
      typecode := 110;
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
      typecode := 110;
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
      typecode := 87;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_xpmoodtype( result^.fieldvalue.str, result^.fieldvalue.len, rec.mood);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'actsubcefs';
      fieldname.len := 10;
      typecode := 114;
   END;
   result^.typeindicator := EnumSet;
   FOR actsubcefs:=loc TO other DO BEGIN
      IF actsubcefs IN rec.actsubcefs THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_prepsubctype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,actsubcefs);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'PROsubject';
      fieldname.len := 10;
      typecode := 16;
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
      typecode := 116;
   END;
   result^.typeindicator := EnumSet;
   FOR synppefs:=synSER TO synVERBPPROP DO BEGIN
      IF synppefs IN rec.synppefs THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_synpatterntype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,synppefs);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'thetapp';
      fieldname.len := 7;
      typecode := 79;
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
      typecode := 82;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_timeadvclasstype( result^.fieldvalue.str, result^.fieldvalue.len, rec.class);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'tiempo';
      fieldname.len := 6;
      typecode := 81;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_tiempotype( result^.fieldvalue.str, result^.fieldvalue.len, rec.tiempo);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'aspecto';
      fieldname.len := 7;
      typecode := 34;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_aspectotype( result^.fieldvalue.str, result^.fieldvalue.len, rec.aspecto);
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
      typecode := 96;
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
      fieldname.str := 'supertiempo';
      fieldname.len := 11;
      typecode := 81;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_tiempotype( result^.fieldvalue.str, result^.fieldvalue.len, rec.supertiempo);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'SpecQ';
      fieldname.len := 5;
      typecode := 72;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_specqtype( result^.fieldvalue.str, result^.fieldvalue.len, rec.SpecQ);
   LSCONVREC_PREPPPROPVARrecord := result;
END {LSCONVREC_PREPPPROPVARrecord};

FUNCTION LSCONVREC_BPROPERNOUNrecord(rec: LSDOMAINT_BPROPERNOUNrecord): LDCONVREC_pAttrStruct;
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
      fieldname.str := 'genero';
      fieldname.len := 6;
      typecode := 52;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_generotype( result^.fieldvalue.str, result^.fieldvalue.len, rec.genero);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'numero';
      fieldname.len := 6;
      typecode := 61;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_numerotype( result^.fieldvalue.str, result^.fieldvalue.len, rec.numero);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'subc';
      fieldname.len := 4;
      typecode := 59;
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
      typecode := 53;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_humantype( result^.fieldvalue.str, result^.fieldvalue.len, rec.human);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'temporal';
      fieldname.len := 8;
      typecode := 21;
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
      typecode := 82;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_timeadvclasstype( result^.fieldvalue.str, result^.fieldvalue.len, rec.class);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'tiempo';
      fieldname.len := 6;
      typecode := 81;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_tiempotype( result^.fieldvalue.str, result^.fieldvalue.len, rec.tiempo);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'aspecto';
      fieldname.len := 7;
      typecode := 34;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_aspectotype( result^.fieldvalue.str, result^.fieldvalue.len, rec.aspecto);
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
BEGIN
   result := NIL;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'genero';
      fieldname.len := 6;
      typecode := 52;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_generotype( result^.fieldvalue.str, result^.fieldvalue.len, rec.genero);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'numero';
      fieldname.len := 6;
      typecode := 61;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_numerotype( result^.fieldvalue.str, result^.fieldvalue.len, rec.numero);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'subc';
      fieldname.len := 4;
      typecode := 59;
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
      typecode := 53;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_humantype( result^.fieldvalue.str, result^.fieldvalue.len, rec.human);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'temporal';
      fieldname.len := 8;
      typecode := 21;
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
      typecode := 82;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_timeadvclasstype( result^.fieldvalue.str, result^.fieldvalue.len, rec.class);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'tiempo';
      fieldname.len := 6;
      typecode := 81;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_tiempotype( result^.fieldvalue.str, result^.fieldvalue.len, rec.tiempo);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'aspecto';
      fieldname.len := 7;
      typecode := 34;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_aspectotype( result^.fieldvalue.str, result^.fieldvalue.len, rec.aspecto);
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
      fieldname.str := 'quesi';
      fieldname.len := 5;
      typecode := 68;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_quesitype( result^.fieldvalue.str, result^.fieldvalue.len, rec.quesi);
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
      fieldname.str := 'quesi';
      fieldname.len := 5;
      typecode := 68;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_quesitype( result^.fieldvalue.str, result^.fieldvalue.len, rec.quesi);
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
    possnumbers : LSDOMAINT_numerotype; 
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
      typecode := 110;
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
      typecode := 110;
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
      typecode := 46;
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
   FOR possnumbers:=singular TO omeganumero DO BEGIN
      IF possnumbers IN rec.possnumbers THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_numerotype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,possnumbers);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'posscomas';
      fieldname.len := 9;
      typecode := 111;
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
      typecode := 87;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_xpmoodtype( result^.fieldvalue.str, result^.fieldvalue.len, rec.mood);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'thanas';
      fieldname.len := 6;
      typecode := 75;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_thanascompltype( result^.fieldvalue.str, result^.fieldvalue.len, rec.thanas);
   LSCONVREC_Qrecord := result;
END {LSCONVREC_Qrecord};

FUNCTION LSCONVREC_QPrecord(rec: LSDOMAINT_QPrecord): LDCONVREC_pAttrStruct;
VAR result : LDCONVREC_pAttrStruct;
    req : LSDOMAINT_polaritytype; 
    env : LSDOMAINT_polaritytype; 
    possnumbers : LSDOMAINT_numerotype; 
    posscomas : LSDOMAINT_posscomatype; 
BEGIN
   result := NIL;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'req';
      fieldname.len := 3;
      typecode := 110;
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
      typecode := 110;
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
      typecode := 46;
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
   FOR possnumbers:=singular TO omeganumero DO BEGIN
      IF possnumbers IN rec.possnumbers THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_numerotype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,possnumbers);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'posscomas';
      fieldname.len := 9;
      typecode := 111;
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
      typecode := 87;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_xpmoodtype( result^.fieldvalue.str, result^.fieldvalue.len, rec.mood);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'thanas';
      fieldname.len := 6;
      typecode := 75;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_thanascompltype( result^.fieldvalue.str, result^.fieldvalue.len, rec.thanas);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'thanascompl';
      fieldname.len := 11;
      typecode := 6;
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
      fieldname.str := 'supertiempo';
      fieldname.len := 11;
      typecode := 81;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_tiempotype( result^.fieldvalue.str, result^.fieldvalue.len, rec.supertiempo);
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
      fieldname.str := 'genero';
      fieldname.len := 6;
      typecode := 52;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_generotype( result^.fieldvalue.str, result^.fieldvalue.len, rec.genero);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'numero';
      fieldname.len := 6;
      typecode := 61;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_numerotype( result^.fieldvalue.str, result^.fieldvalue.len, rec.numero);
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
      fieldname.str := 'persona';
      fieldname.len := 7;
      typecode := 88;
   END;
   result^.typeindicator := SubRange;
   LSTYPETOSTR_personatype( result^.fieldvalue.str, result^.fieldvalue.len, rec.persona);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'numero';
      fieldname.len := 6;
      typecode := 61;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_numerotype( result^.fieldvalue.str, result^.fieldvalue.len, rec.numero);
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

FUNCTION LSCONVREC_SErecord(rec: LSDOMAINT_SErecord): LDCONVREC_pAttrStruct;
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
   LSCONVREC_SErecord := result;
END {LSCONVREC_SErecord};

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
      typecode := 110;
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
      typecode := 110;
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
      typecode := 57;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_moodtype( result^.fieldvalue.str, result^.fieldvalue.len, rec.mood);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'modo';
      fieldname.len := 4;
      typecode := 56;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_modotype( result^.fieldvalue.str, result^.fieldvalue.len, rec.modo);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'senttype';
      fieldname.len := 8;
      typecode := 70;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_senttypetype( result^.fieldvalue.str, result^.fieldvalue.len, rec.senttype);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'infsort';
      fieldname.len := 7;
      typecode := 54;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_infsorttype( result^.fieldvalue.str, result^.fieldvalue.len, rec.infsort);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'voice';
      fieldname.len := 5;
      typecode := 85;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_voicetype( result^.fieldvalue.str, result^.fieldvalue.len, rec.voice);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'PROsubject';
      fieldname.len := 10;
      typecode := 16;
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
      typecode := 116;
   END;
   result^.typeindicator := EnumSet;
   FOR synvpefs:=synSER TO synVERBPPROP DO BEGIN
      IF synvpefs IN rec.synvpefs THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_synpatterntype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,synvpefs);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'thetavp';
      fieldname.len := 7;
      typecode := 80;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_thetavptype( result^.fieldvalue.str, result^.fieldvalue.len, rec.thetavp);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'adjuncts';
      fieldname.len := 8;
      typecode := 92;
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
      fieldname.str := 'aktionsarts';
      fieldname.len := 11;
      typecode := 96;
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
      fieldname.str := 'aspecto';
      fieldname.len := 7;
      typecode := 34;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_aspectotype( result^.fieldvalue.str, result^.fieldvalue.len, rec.aspecto);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'tiempo';
      fieldname.len := 6;
      typecode := 81;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_tiempotype( result^.fieldvalue.str, result^.fieldvalue.len, rec.tiempo);
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
      typecode := 49;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_finitenesstype( result^.fieldvalue.str, result^.fieldvalue.len, rec.finiteness);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'VRcompl';
      fieldname.len := 7;
      typecode := 23;
   END;
   result^.typeindicator := Bool;
   IF rec.VRcompl = TRUE THEN BEGIN
      result^.fieldvalue.str := 'TRUE';
      result^.fieldvalue.len := 4;
      END
   ELSE BEGIN
      result^.fieldvalue.str := 'FALSE';
      result^.fieldvalue.len := 5;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'supertiempo';
      fieldname.len := 11;
      typecode := 81;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_tiempotype( result^.fieldvalue.str, result^.fieldvalue.len, rec.supertiempo);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'Restructuring';
      fieldname.len := 13;
      typecode := 18;
   END;
   result^.typeindicator := Bool;
   IF rec.Restructuring = TRUE THEN BEGIN
      result^.fieldvalue.str := 'TRUE';
      result^.fieldvalue.len := 4;
      END
   ELSE BEGIN
      result^.fieldvalue.str := 'FALSE';
      result^.fieldvalue.len := 5;
   END;
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
      typecode := 21;
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
      typecode := 82;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_timeadvclasstype( result^.fieldvalue.str, result^.fieldvalue.len, rec.conjclass);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'conjtiempo';
      fieldname.len := 10;
      typecode := 81;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_tiempotype( result^.fieldvalue.str, result^.fieldvalue.len, rec.conjtiempo);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'conjaspecto';
      fieldname.len := 11;
      typecode := 34;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_aspectotype( result^.fieldvalue.str, result^.fieldvalue.len, rec.conjaspecto);
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
      fieldname.str := 'PERSPROobj';
      fieldname.len := 10;
      typecode := 12;
   END;
   result^.typeindicator := Bool;
   IF rec.PERSPROobj = TRUE THEN BEGIN
      result^.fieldvalue.str := 'TRUE';
      result^.fieldvalue.len := 4;
      END
   ELSE BEGIN
      result^.fieldvalue.str := 'FALSE';
      result^.fieldvalue.len := 5;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'negpos';
      fieldname.len := 6;
      typecode := 58;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_negpostype( result^.fieldvalue.str, result^.fieldvalue.len, rec.negpos);
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
      typecode := 110;
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
      typecode := 110;
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
      typecode := 57;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_moodtype( result^.fieldvalue.str, result^.fieldvalue.len, rec.mood);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'modo';
      fieldname.len := 4;
      typecode := 56;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_modotype( result^.fieldvalue.str, result^.fieldvalue.len, rec.modo);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'senttype';
      fieldname.len := 8;
      typecode := 70;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_senttypetype( result^.fieldvalue.str, result^.fieldvalue.len, rec.senttype);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'infsort';
      fieldname.len := 7;
      typecode := 54;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_infsorttype( result^.fieldvalue.str, result^.fieldvalue.len, rec.infsort);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'voice';
      fieldname.len := 5;
      typecode := 85;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_voicetype( result^.fieldvalue.str, result^.fieldvalue.len, rec.voice);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'PROsubject';
      fieldname.len := 10;
      typecode := 16;
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
      typecode := 116;
   END;
   result^.typeindicator := EnumSet;
   FOR synvpefs:=synSER TO synVERBPPROP DO BEGIN
      IF synvpefs IN rec.synvpefs THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_synpatterntype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,synvpefs);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'thetavp';
      fieldname.len := 7;
      typecode := 80;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_thetavptype( result^.fieldvalue.str, result^.fieldvalue.len, rec.thetavp);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'adjuncts';
      fieldname.len := 8;
      typecode := 92;
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
      fieldname.str := 'aktionsarts';
      fieldname.len := 11;
      typecode := 96;
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
      fieldname.str := 'aspecto';
      fieldname.len := 7;
      typecode := 34;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_aspectotype( result^.fieldvalue.str, result^.fieldvalue.len, rec.aspecto);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'tiempo';
      fieldname.len := 6;
      typecode := 81;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_tiempotype( result^.fieldvalue.str, result^.fieldvalue.len, rec.tiempo);
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
      typecode := 49;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_finitenesstype( result^.fieldvalue.str, result^.fieldvalue.len, rec.finiteness);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'VRcompl';
      fieldname.len := 7;
      typecode := 23;
   END;
   result^.typeindicator := Bool;
   IF rec.VRcompl = TRUE THEN BEGIN
      result^.fieldvalue.str := 'TRUE';
      result^.fieldvalue.len := 4;
      END
   ELSE BEGIN
      result^.fieldvalue.str := 'FALSE';
      result^.fieldvalue.len := 5;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'supertiempo';
      fieldname.len := 11;
      typecode := 81;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_tiempotype( result^.fieldvalue.str, result^.fieldvalue.len, rec.supertiempo);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'Restructuring';
      fieldname.len := 13;
      typecode := 18;
   END;
   result^.typeindicator := Bool;
   IF rec.Restructuring = TRUE THEN BEGIN
      result^.fieldvalue.str := 'TRUE';
      result^.fieldvalue.len := 4;
      END
   ELSE BEGIN
      result^.fieldvalue.str := 'FALSE';
      result^.fieldvalue.len := 5;
   END;
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
      typecode := 21;
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
      typecode := 82;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_timeadvclasstype( result^.fieldvalue.str, result^.fieldvalue.len, rec.conjclass);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'conjtiempo';
      fieldname.len := 10;
      typecode := 81;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_tiempotype( result^.fieldvalue.str, result^.fieldvalue.len, rec.conjtiempo);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'conjaspecto';
      fieldname.len := 11;
      typecode := 34;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_aspectotype( result^.fieldvalue.str, result^.fieldvalue.len, rec.conjaspecto);
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
      fieldname.str := 'PERSPROobj';
      fieldname.len := 10;
      typecode := 12;
   END;
   result^.typeindicator := Bool;
   IF rec.PERSPROobj = TRUE THEN BEGIN
      result^.fieldvalue.str := 'TRUE';
      result^.fieldvalue.len := 4;
      END
   ELSE BEGIN
      result^.fieldvalue.str := 'FALSE';
      result^.fieldvalue.len := 5;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'negpos';
      fieldname.len := 6;
      typecode := 58;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_negpostype( result^.fieldvalue.str, result^.fieldvalue.len, rec.negpos);
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
      fieldname.str := 'req';
      fieldname.len := 3;
      typecode := 110;
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
      typecode := 110;
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
      typecode := 75;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_thanascompltype( result^.fieldvalue.str, result^.fieldvalue.len, rec.thanas);
   LSCONVREC_THANPrecord := result;
END {LSCONVREC_THANPrecord};

FUNCTION LSCONVREC_BVERBrecord(rec: LSDOMAINT_BVERBrecord): LDCONVREC_pAttrStruct;
VAR result : LDCONVREC_pAttrStruct;
    req : LSDOMAINT_polaritytype; 
    env : LSDOMAINT_polaritytype; 
    conjclases : LSDOMAINT_conjclasetype; 
    Aloclases : LSDOMAINT_aloclasetype; 
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
      typecode := 110;
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
      typecode := 110;
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
      fieldname.str := 'conjclases';
      fieldname.len := 10;
      typecode := 100;
   END;
   result^.typeindicator := EnumSet;
   FOR conjclases:=CONJ0 TO CONJ20 DO BEGIN
      IF conjclases IN rec.conjclases THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_conjclasetype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,conjclases);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'Aloclases';
      fieldname.len := 9;
      typecode := 97;
   END;
   result^.typeindicator := EnumSet;
   FOR Aloclases:=diftongCLASE TO nadaCLASE DO BEGIN
      IF Aloclases IN rec.Aloclases THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_aloclasetype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,Aloclases);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'possvoices';
      fieldname.len := 10;
      typecode := 119;
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
      typecode := 69;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_reflexivetype( result^.fieldvalue.str, result^.fieldvalue.len, rec.reflexivity);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'synvps';
      fieldname.len := 6;
      typecode := 115;
   END;
   result^.typeindicator := EnumSet;
   FOR synvps:=synSER TO synVERBPPROP DO BEGIN
      IF synvps IN rec.synvps THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_synpatterntype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,synvps);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'thetavp';
      fieldname.len := 7;
      typecode := 80;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_thetavptype( result^.fieldvalue.str, result^.fieldvalue.len, rec.thetavp);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'adjuncts';
      fieldname.len := 8;
      typecode := 92;
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
      typecode := 5;
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
      typecode := 84;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_verbsubctype( result^.fieldvalue.str, result^.fieldvalue.len, rec.subc);
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
      fieldname.str := 'Clustering';
      fieldname.len := 10;
      typecode := 83;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_clusteringtype( result^.fieldvalue.str, result^.fieldvalue.len, rec.Clustering);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'classes';
      fieldname.len := 7;
      typecode := 99;
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
      fieldname.str := 'intensV';
      fieldname.len := 7;
      typecode := 55;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_intensvtype( result^.fieldvalue.str, result^.fieldvalue.len, rec.intensV);
   LSCONVREC_BVERBrecord := result;
END {LSCONVREC_BVERBrecord};

FUNCTION LSCONVREC_SUBVERBrecord(rec: LSDOMAINT_SUBVERBrecord): LDCONVREC_pAttrStruct;
VAR result : LDCONVREC_pAttrStruct;
    req : LSDOMAINT_polaritytype; 
    env : LSDOMAINT_polaritytype; 
    conjclases : LSDOMAINT_conjclasetype; 
    Aloclases : LSDOMAINT_aloclasetype; 
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
      typecode := 110;
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
      typecode := 110;
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
      fieldname.str := 'conjclases';
      fieldname.len := 10;
      typecode := 100;
   END;
   result^.typeindicator := EnumSet;
   FOR conjclases:=CONJ0 TO CONJ20 DO BEGIN
      IF conjclases IN rec.conjclases THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_conjclasetype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,conjclases);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'Aloclases';
      fieldname.len := 9;
      typecode := 97;
   END;
   result^.typeindicator := EnumSet;
   FOR Aloclases:=diftongCLASE TO nadaCLASE DO BEGIN
      IF Aloclases IN rec.Aloclases THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_aloclasetype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,Aloclases);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'possvoices';
      fieldname.len := 10;
      typecode := 119;
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
      typecode := 69;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_reflexivetype( result^.fieldvalue.str, result^.fieldvalue.len, rec.reflexivity);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'synvps';
      fieldname.len := 6;
      typecode := 115;
   END;
   result^.typeindicator := EnumSet;
   FOR synvps:=synSER TO synVERBPPROP DO BEGIN
      IF synvps IN rec.synvps THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_synpatterntype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,synvps);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'thetavp';
      fieldname.len := 7;
      typecode := 80;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_thetavptype( result^.fieldvalue.str, result^.fieldvalue.len, rec.thetavp);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'adjuncts';
      fieldname.len := 8;
      typecode := 92;
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
      typecode := 5;
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
      typecode := 84;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_verbsubctype( result^.fieldvalue.str, result^.fieldvalue.len, rec.subc);
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
      fieldname.str := 'Clustering';
      fieldname.len := 10;
      typecode := 83;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_clusteringtype( result^.fieldvalue.str, result^.fieldvalue.len, rec.Clustering);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'classes';
      fieldname.len := 7;
      typecode := 99;
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
      fieldname.str := 'intensV';
      fieldname.len := 7;
      typecode := 55;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_intensvtype( result^.fieldvalue.str, result^.fieldvalue.len, rec.intensV);
   LSCONVREC_SUBVERBrecord := result;
END {LSCONVREC_SUBVERBrecord};

FUNCTION LSCONVREC_ALOVERBrecord(rec: LSDOMAINT_ALOVERBrecord): LDCONVREC_pAttrStruct;
VAR result : LDCONVREC_pAttrStruct;
    req : LSDOMAINT_polaritytype; 
    env : LSDOMAINT_polaritytype; 
    conjclases : LSDOMAINT_conjclasetype; 
    Aloclases : LSDOMAINT_aloclasetype; 
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
      typecode := 110;
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
      typecode := 110;
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
      fieldname.str := 'conjclases';
      fieldname.len := 10;
      typecode := 100;
   END;
   result^.typeindicator := EnumSet;
   FOR conjclases:=CONJ0 TO CONJ20 DO BEGIN
      IF conjclases IN rec.conjclases THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_conjclasetype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,conjclases);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'Aloclases';
      fieldname.len := 9;
      typecode := 97;
   END;
   result^.typeindicator := EnumSet;
   FOR Aloclases:=diftongCLASE TO nadaCLASE DO BEGIN
      IF Aloclases IN rec.Aloclases THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_aloclasetype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,Aloclases);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'numero';
      fieldname.len := 6;
      typecode := 61;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_numerotype( result^.fieldvalue.str, result^.fieldvalue.len, rec.numero);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'persona';
      fieldname.len := 7;
      typecode := 88;
   END;
   result^.typeindicator := SubRange;
   LSTYPETOSTR_personatype( result^.fieldvalue.str, result^.fieldvalue.len, rec.persona);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'genero';
      fieldname.len := 6;
      typecode := 52;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_generotype( result^.fieldvalue.str, result^.fieldvalue.len, rec.genero);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'futuro';
      fieldname.len := 6;
      typecode := 50;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_futurotype( result^.fieldvalue.str, result^.fieldvalue.len, rec.futuro);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'modo';
      fieldname.len := 4;
      typecode := 56;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_modotype( result^.fieldvalue.str, result^.fieldvalue.len, rec.modo);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'tiempo';
      fieldname.len := 6;
      typecode := 81;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_tiempotype( result^.fieldvalue.str, result^.fieldvalue.len, rec.tiempo);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'aspecto';
      fieldname.len := 7;
      typecode := 34;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_aspectotype( result^.fieldvalue.str, result^.fieldvalue.len, rec.aspecto);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'possvoices';
      fieldname.len := 10;
      typecode := 119;
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
      typecode := 69;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_reflexivetype( result^.fieldvalue.str, result^.fieldvalue.len, rec.reflexivity);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'synvps';
      fieldname.len := 6;
      typecode := 115;
   END;
   result^.typeindicator := EnumSet;
   FOR synvps:=synSER TO synVERBPPROP DO BEGIN
      IF synvps IN rec.synvps THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_synpatterntype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,synvps);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'thetavp';
      fieldname.len := 7;
      typecode := 80;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_thetavptype( result^.fieldvalue.str, result^.fieldvalue.len, rec.thetavp);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'adjuncts';
      fieldname.len := 8;
      typecode := 92;
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
      typecode := 5;
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
      typecode := 84;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_verbsubctype( result^.fieldvalue.str, result^.fieldvalue.len, rec.subc);
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
      fieldname.str := 'Clustering';
      fieldname.len := 10;
      typecode := 83;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_clusteringtype( result^.fieldvalue.str, result^.fieldvalue.len, rec.Clustering);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'status';
      fieldname.len := 6;
      typecode := 86;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_vstatustype( result^.fieldvalue.str, result^.fieldvalue.len, rec.status);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'classes';
      fieldname.len := 7;
      typecode := 99;
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
      fieldname.str := 'intensV';
      fieldname.len := 7;
      typecode := 55;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_intensvtype( result^.fieldvalue.str, result^.fieldvalue.len, rec.intensV);
   LSCONVREC_ALOVERBrecord := result;
END {LSCONVREC_ALOVERBrecord};

FUNCTION LSCONVREC_VERBrecord(rec: LSDOMAINT_VERBrecord): LDCONVREC_pAttrStruct;
VAR result : LDCONVREC_pAttrStruct;
    req : LSDOMAINT_polaritytype; 
    env : LSDOMAINT_polaritytype; 
    conjclases : LSDOMAINT_conjclasetype; 
    Aloclases : LSDOMAINT_aloclasetype; 
    possvoices : LSDOMAINT_voicetype; 
    synvps : LSDOMAINT_synpatterntype; 
    adjuncts : LSDOMAINT_adjuncttype; 
    foundauxes : LSDOMAINT_verbsubctype; 
    classes : LSDOMAINT_classtype; 
BEGIN
   result := NIL;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'req';
      fieldname.len := 3;
      typecode := 110;
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
      typecode := 110;
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
      fieldname.str := 'conjclases';
      fieldname.len := 10;
      typecode := 100;
   END;
   result^.typeindicator := EnumSet;
   FOR conjclases:=CONJ0 TO CONJ20 DO BEGIN
      IF conjclases IN rec.conjclases THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_conjclasetype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,conjclases);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'Aloclases';
      fieldname.len := 9;
      typecode := 97;
   END;
   result^.typeindicator := EnumSet;
   FOR Aloclases:=diftongCLASE TO nadaCLASE DO BEGIN
      IF Aloclases IN rec.Aloclases THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_aloclasetype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,Aloclases);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'numero';
      fieldname.len := 6;
      typecode := 61;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_numerotype( result^.fieldvalue.str, result^.fieldvalue.len, rec.numero);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'persona';
      fieldname.len := 7;
      typecode := 88;
   END;
   result^.typeindicator := SubRange;
   LSTYPETOSTR_personatype( result^.fieldvalue.str, result^.fieldvalue.len, rec.persona);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'genero';
      fieldname.len := 6;
      typecode := 52;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_generotype( result^.fieldvalue.str, result^.fieldvalue.len, rec.genero);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'futuro';
      fieldname.len := 6;
      typecode := 50;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_futurotype( result^.fieldvalue.str, result^.fieldvalue.len, rec.futuro);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'modo';
      fieldname.len := 4;
      typecode := 56;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_modotype( result^.fieldvalue.str, result^.fieldvalue.len, rec.modo);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'tiempo';
      fieldname.len := 6;
      typecode := 81;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_tiempotype( result^.fieldvalue.str, result^.fieldvalue.len, rec.tiempo);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'aspecto';
      fieldname.len := 7;
      typecode := 34;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_aspectotype( result^.fieldvalue.str, result^.fieldvalue.len, rec.aspecto);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'possvoices';
      fieldname.len := 10;
      typecode := 119;
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
      typecode := 69;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_reflexivetype( result^.fieldvalue.str, result^.fieldvalue.len, rec.reflexivity);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'synvps';
      fieldname.len := 6;
      typecode := 115;
   END;
   result^.typeindicator := EnumSet;
   FOR synvps:=synSER TO synVERBPPROP DO BEGIN
      IF synvps IN rec.synvps THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_synpatterntype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,synvps);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'thetavp';
      fieldname.len := 7;
      typecode := 80;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_thetavptype( result^.fieldvalue.str, result^.fieldvalue.len, rec.thetavp);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'adjuncts';
      fieldname.len := 8;
      typecode := 92;
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
      typecode := 5;
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
      typecode := 84;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_verbsubctype( result^.fieldvalue.str, result^.fieldvalue.len, rec.subc);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'foundauxes';
      fieldname.len := 10;
      typecode := 118;
   END;
   result^.typeindicator := EnumSet;
   FOR foundauxes:=Mainverb TO Modalverb DO BEGIN
      IF foundauxes IN rec.foundauxes THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_verbsubctype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,foundauxes);
      END;
   END;
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
      fieldname.str := 'Clustering';
      fieldname.len := 10;
      typecode := 83;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_clusteringtype( result^.fieldvalue.str, result^.fieldvalue.len, rec.Clustering);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'status';
      fieldname.len := 6;
      typecode := 86;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_vstatustype( result^.fieldvalue.str, result^.fieldvalue.len, rec.status);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'classes';
      fieldname.len := 7;
      typecode := 99;
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
      fieldname.str := 'intensV';
      fieldname.len := 7;
      typecode := 55;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_intensvtype( result^.fieldvalue.str, result^.fieldvalue.len, rec.intensV);
   LSCONVREC_VERBrecord := result;
END {LSCONVREC_VERBrecord};

FUNCTION LSCONVREC_VERBPrecord(rec: LSDOMAINT_VERBPrecord): LDCONVREC_pAttrStruct;
VAR result : LDCONVREC_pAttrStruct;
    req : LSDOMAINT_polaritytype; 
    env : LSDOMAINT_polaritytype; 
BEGIN
   result := NIL;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'req';
      fieldname.len := 3;
      typecode := 110;
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
      typecode := 110;
   END;
   result^.typeindicator := EnumSet;
   FOR env:=pospol TO omegapol DO BEGIN
      IF env IN rec.env THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_polaritytype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,env);
      END;
   END;
   LSCONVREC_VERBPrecord := result;
END {LSCONVREC_VERBPrecord};

FUNCTION LSCONVREC_VERBPPROPrecord(rec: LSDOMAINT_VERBPPROPrecord): LDCONVREC_pAttrStruct;
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
      typecode := 110;
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
      typecode := 110;
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
      fieldname.str := 'supertiempo';
      fieldname.len := 11;
      typecode := 81;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_tiempotype( result^.fieldvalue.str, result^.fieldvalue.len, rec.supertiempo);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'PROsubject';
      fieldname.len := 10;
      typecode := 16;
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
      typecode := 85;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_voicetype( result^.fieldvalue.str, result^.fieldvalue.len, rec.voice);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'synvpefs';
      fieldname.len := 8;
      typecode := 116;
   END;
   result^.typeindicator := EnumSet;
   FOR synvpefs:=synSER TO synVERBPPROP DO BEGIN
      IF synvpefs IN rec.synvpefs THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_synpatterntype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,synvpefs);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'thetavp';
      fieldname.len := 7;
      typecode := 80;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_thetavptype( result^.fieldvalue.str, result^.fieldvalue.len, rec.thetavp);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'adjuncts';
      fieldname.len := 8;
      typecode := 92;
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
      fieldname.str := 'aktionsarts';
      fieldname.len := 11;
      typecode := 96;
   END;
   result^.typeindicator := EnumSet;
   FOR aktionsarts:=stative TO achievement DO BEGIN
      IF aktionsarts IN rec.aktionsarts THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_aktionsarttype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,aktionsarts);
      END;
   END;
   LSCONVREC_VERBPPROPrecord := result;
END {LSCONVREC_VERBPPROPrecord};

FUNCTION LSCONVREC_VERBPPROPVARrecord(rec: LSDOMAINT_VERBPPROPVARrecord): LDCONVREC_pAttrStruct;
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
      typecode := 110;
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
      typecode := 110;
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
      fieldname.str := 'supertiempo';
      fieldname.len := 11;
      typecode := 81;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_tiempotype( result^.fieldvalue.str, result^.fieldvalue.len, rec.supertiempo);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'PROsubject';
      fieldname.len := 10;
      typecode := 16;
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
      typecode := 85;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_voicetype( result^.fieldvalue.str, result^.fieldvalue.len, rec.voice);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'synvpefs';
      fieldname.len := 8;
      typecode := 116;
   END;
   result^.typeindicator := EnumSet;
   FOR synvpefs:=synSER TO synVERBPPROP DO BEGIN
      IF synvpefs IN rec.synvpefs THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_synpatterntype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,synvpefs);
      END;
   END;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'thetavp';
      fieldname.len := 7;
      typecode := 80;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_thetavptype( result^.fieldvalue.str, result^.fieldvalue.len, rec.thetavp);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'adjuncts';
      fieldname.len := 8;
      typecode := 92;
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
      fieldname.str := 'aktionsarts';
      fieldname.len := 11;
      typecode := 96;
   END;
   result^.typeindicator := EnumSet;
   FOR aktionsarts:=stative TO achievement DO BEGIN
      IF aktionsarts IN rec.aktionsarts THEN BEGIN
         result^.setvalue := LSCONVREC_MakeSetElt(result^.setvalue);
         LSTYPETOSTR_aktionsarttype( result^.setvalue^.eltvalue.str, result^.setvalue^.eltvalue.len,aktionsarts);
      END;
   END;
   LSCONVREC_VERBPPROPVARrecord := result;
END {LSCONVREC_VERBPPROPVARrecord};

FUNCTION LSCONVREC_BWHADJrecord(rec: LSDOMAINT_BWHADJrecord): LDCONVREC_pAttrStruct;
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
      fieldname.str := 'genero';
      fieldname.len := 6;
      typecode := 52;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_generotype( result^.fieldvalue.str, result^.fieldvalue.len, rec.genero);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'feminforma';
      fieldname.len := 10;
      typecode := 71;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_sinotype( result^.fieldvalue.str, result^.fieldvalue.len, rec.feminforma);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'pluralforma';
      fieldname.len := 11;
      typecode := 63;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_pluralformatype( result^.fieldvalue.str, result^.fieldvalue.len, rec.pluralforma);
   LSCONVREC_BWHADJrecord := result;
END {LSCONVREC_BWHADJrecord};

FUNCTION LSCONVREC_WHADJrecord(rec: LSDOMAINT_WHADJrecord): LDCONVREC_pAttrStruct;
VAR result : LDCONVREC_pAttrStruct;
BEGIN
   result := NIL;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'numero';
      fieldname.len := 6;
      typecode := 61;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_numerotype( result^.fieldvalue.str, result^.fieldvalue.len, rec.numero);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'genero';
      fieldname.len := 6;
      typecode := 52;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_generotype( result^.fieldvalue.str, result^.fieldvalue.len, rec.genero);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'feminforma';
      fieldname.len := 10;
      typecode := 71;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_sinotype( result^.fieldvalue.str, result^.fieldvalue.len, rec.feminforma);
   LSCONVREC_WHADJrecord := result;
END {LSCONVREC_WHADJrecord};

FUNCTION LSCONVREC_BWHPROrecord(rec: LSDOMAINT_BWHPROrecord): LDCONVREC_pAttrStruct;
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
      fieldname.str := 'numero';
      fieldname.len := 6;
      typecode := 61;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_numerotype( result^.fieldvalue.str, result^.fieldvalue.len, rec.numero);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'genero';
      fieldname.len := 6;
      typecode := 52;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_generotype( result^.fieldvalue.str, result^.fieldvalue.len, rec.genero);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'feminforma';
      fieldname.len := 10;
      typecode := 71;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_sinotype( result^.fieldvalue.str, result^.fieldvalue.len, rec.feminforma);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'pluralforma';
      fieldname.len := 11;
      typecode := 63;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_pluralformatype( result^.fieldvalue.str, result^.fieldvalue.len, rec.pluralforma);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'animate';
      fieldname.len := 7;
      typecode := 32;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_animatetype( result^.fieldvalue.str, result^.fieldvalue.len, rec.animate);
   LSCONVREC_BWHPROrecord := result;
END {LSCONVREC_BWHPROrecord};

FUNCTION LSCONVREC_WHPROrecord(rec: LSDOMAINT_WHPROrecord): LDCONVREC_pAttrStruct;
VAR result : LDCONVREC_pAttrStruct;
BEGIN
   result := NIL;
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'numero';
      fieldname.len := 6;
      typecode := 61;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_numerotype( result^.fieldvalue.str, result^.fieldvalue.len, rec.numero);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'genero';
      fieldname.len := 6;
      typecode := 52;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_generotype( result^.fieldvalue.str, result^.fieldvalue.len, rec.genero);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'feminforma';
      fieldname.len := 10;
      typecode := 71;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_sinotype( result^.fieldvalue.str, result^.fieldvalue.len, rec.feminforma);
   result := LSCONVREC_MakeAttr(result);
   WITH result^ DO BEGIN
      fieldname.str := 'animate';
      fieldname.len := 7;
      typecode := 32;
   END;
   result^.typeindicator := Enumeration;
   LSTYPETOSTR_animatetype( result^.fieldvalue.str, result^.fieldvalue.len, rec.animate);
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
   ADVPVAR: BEGIN
      attr := LSCONVREC_ADVPVARrecord( rec.ADVPVARfield^);
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
   BIGPRO: BEGIN
      attr := LSCONVREC_BPERSPROrecord( rec.BIGPROfield^);
      END;
   CLAUSE: BEGIN
      attr := LSCONVREC_CLAUSErecord( rec.CLAUSEfield^);
      END;
   CLITIC: BEGIN
      attr := LSCONVREC_NOrecord( rec.CLITICfield^);
      END;
   CONJ: BEGIN
      attr := LSCONVREC_CONJrecord( rec.CONJfield^);
      END;
   COORD: BEGIN
      attr := LSCONVREC_COORDrecord( rec.COORDfield^);
      END;
   BDEMADJ: BEGIN
      attr := LSCONVREC_BDEMADJrecord( rec.BDEMADJfield^);
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
   EC: BEGIN
      attr := LSCONVREC_ECrecord( rec.ECfield^);
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
   INDEFPRO: BEGIN
      attr := LSCONVREC_INDEFPROrecord( rec.INDEFPROfield^);
      END;
   SUBINDEFPRO: BEGIN
      attr := LSCONVREC_INDEFPROrecord( rec.SUBINDEFPROfield^);
      END;
   NEG: BEGIN
      attr := LSCONVREC_NEGrecord( rec.NEGfield^);
      END;
   NEGVAR: BEGIN
      attr := LSCONVREC_NEGVARrecord( rec.NEGVARfield^);
      END;
   DIGIT: BEGIN
      attr := LSCONVREC_DIGITrecord( rec.DIGITfield^);
      END;
   CARD: BEGIN
      attr := LSCONVREC_CARDrecord( rec.CARDfield^);
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
   PRONP: BEGIN
      attr := LSCONVREC_NPrecord( rec.PRONPfield^);
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
   BPERSPRO: BEGIN
      attr := LSCONVREC_BPERSPROrecord( rec.BPERSPROfield^);
      END;
   PERSPRO: BEGIN
      attr := LSCONVREC_PERSPROrecord( rec.PERSPROfield^);
      END;
   SE: BEGIN
      attr := LSCONVREC_SErecord( rec.SEfield^);
      END;
   POS: BEGIN
      attr := LSCONVREC_POSrecord( rec.POSfield^);
      END;
   POSVAR: BEGIN
      attr := LSCONVREC_POSVARrecord( rec.POSVARfield^);
      END;
   POSSADJ: BEGIN
      attr := LSCONVREC_POSSADJrecord( rec.POSSADJfield^);
      END;
   BPOSSPRO: BEGIN
      attr := LSCONVREC_BPOSSPROrecord( rec.BPOSSPROfield^);
      END;
   POSSPRO: BEGIN
      attr := LSCONVREC_POSSPROrecord( rec.POSSPROfield^);
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
   THANAS: BEGIN
      attr := LSCONVREC_THANASrecord( rec.THANASfield^);
      END;
   THANP: BEGIN
      attr := LSCONVREC_THANPrecord( rec.THANPfield^);
      END;
   UTT: BEGIN
      attr := LSCONVREC_NOrecord( rec.UTTfield^);
      END;
   ADJPPROPVAR: BEGIN
      attr := LSCONVREC_ADJPPROPVARrecord( rec.ADJPPROPVARfield^);
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
   NPPROPVAR: BEGIN
      attr := LSCONVREC_NPPROPVARrecord( rec.NPPROPVARfield^);
      END;
   PREPPVAR: BEGIN
      attr := LSCONVREC_PREPPVARrecord( rec.PREPPVARfield^);
      END;
   PREPPPROPVAR: BEGIN
      attr := LSCONVREC_PREPPPROPVARrecord( rec.PREPPPROPVARfield^);
      END;
   NPVAR: BEGIN
      attr := LSCONVREC_NPVARrecord( rec.NPVARfield^);
      END;
   SENTENCEVAR: BEGIN
      attr := LSCONVREC_SENTENCEVARrecord( rec.SENTENCEVARfield^);
      END;
   PROSENTVAR: BEGIN
      attr := LSCONVREC_PROSENTVARrecord( rec.PROSENTVARfield^);
      END;
   EMPTYVAR: BEGIN
      attr := LSCONVREC_EMPTYVARrecord( rec.EMPTYVARfield^);
      END;
   VERBPPROPVAR: BEGIN
      attr := LSCONVREC_VERBPPROPVARrecord( rec.VERBPPROPVARfield^);
      END;
   PRONPVAR: BEGIN
      attr := LSCONVREC_NPVARrecord( rec.PRONPVARfield^);
      END;
   BVERBSUFF: BEGIN
      attr := LSCONVREC_BVERBrecord( rec.BVERBSUFFfield^);
      END;
   BVERB: BEGIN
      attr := LSCONVREC_BVERBrecord( rec.BVERBfield^);
      END;
   ALOVERB: BEGIN
      attr := LSCONVREC_ALOVERBrecord( rec.ALOVERBfield^);
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
   BWHADJ: BEGIN
      attr := LSCONVREC_BWHADJrecord( rec.BWHADJfield^);
      END;
   WHADJ: BEGIN
      attr := LSCONVREC_WHADJrecord( rec.WHADJfield^);
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
