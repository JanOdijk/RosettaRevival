pragma C_include('strings.pf');
Export(LSCONVATTR);
pragma C_include('lsdomaint.pf');
pragma C_include('lsstrtotype.pf');
pragma C_include('ldstrtotype.pf');
pragma C_include('maket.pf');
pragma C_include('ldconvrec.pf');
pragma C_include('str.pf');
pragma C_include('lidomaint.pf');
pragma C_include('lsconvattr.pf');


PROGRAM LSCONVATTR;
WITH LSDOMAINT,MAKET,STRINGS,LSSTRTOTYPE,STR,LIDOMAINT,LDCONVREC,
   LDSTRTOTYPE;
FUNCTION LSCONVATTR_NOrecord(VAR rec: LSDOMAINT_NOrecord;
                  VAR pattr: LDCONVREC_pAttrStruct): BOOLEAN;
VAR result : BOOLEAN;
    setp   : LDCONVREC_pSetValueType;
    attr   : LDCONVREC_pAttrStruct;

BEGIN
   result := TRUE; attr := pattr;
   MAKET_UTTrec(rec);
   WHILE (attr <> NIL) AND result DO BEGIN
   WITH attr^ DO BEGIN
      IF FALSE THEN BEGIN
         END;
      END;
      attr^.Error := (NOT result);
      attr := attr^.NextAttr
   END;
   LSCONVATTR_NOrecord := result;
END {LSCONVATTR_NOrecord};

FUNCTION LSCONVATTR_BADJrecord(VAR rec: LSDOMAINT_BADJrecord;
                  VAR pattr: LDCONVREC_pAttrStruct): BOOLEAN;
VAR result : BOOLEAN;
    setp   : LDCONVREC_pSetValueType;
    attr   : LDCONVREC_pAttrStruct;

    req : LSDOMAINT_polaritytype; 
    env : LSDOMAINT_polaritytype; 
    uses : LSDOMAINT_adjusetype; 
    comparatives : LSDOMAINT_comparativetype; 
    superlatives : LSDOMAINT_superlativetype; 
    subcs : LSDOMAINT_adjsubctype; 
    adjpatterns : LSDOMAINT_synpatterntype; 
BEGIN
   result := TRUE; attr := pattr;
   MAKET_BADJrec(rec);
   WHILE (attr <> NIL) AND result DO BEGIN
   WITH attr^ DO BEGIN
      IF FALSE THEN BEGIN
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                          'KEY', 3) = 0 THEN BEGIN
         result := STR_StrToInteger(fieldvalue.str,
                                 fieldvalue.len, rec.key);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'req',3) = 0 THEN BEGIN
         setp := setvalue;
         rec.req := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_polaritytype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         req);
            IF result THEN BEGIN
               rec.req := rec.req + [req];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'env',3) = 0 THEN BEGIN
         setp := setvalue;
         rec.env := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_polaritytype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         env);
            IF result THEN BEGIN
               rec.env := rec.env + [env];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'class',5) = 0 THEN BEGIN
         result := LSSTRTOTYPE_timeadvclasstype( fieldvalue.str, fieldvalue.len, rec.class);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'deixis',6) = 0 THEN BEGIN
         result := LSSTRTOTYPE_deixistype( fieldvalue.str, fieldvalue.len, rec.deixis);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'aspect',6) = 0 THEN BEGIN
         result := LSSTRTOTYPE_aspecttype( fieldvalue.str, fieldvalue.len, rec.aspect);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'retro',5) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.retro := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.retro := FALSE; result := TRUE 
         END;
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'uses',4) = 0 THEN BEGIN
         setp := setvalue;
         rec.uses := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_adjusetype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         uses);
            IF result THEN BEGIN
               rec.uses := rec.uses + [uses];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'eFormation',10) = 0 THEN BEGIN
         result := LSSTRTOTYPE_eformationtype( fieldvalue.str, fieldvalue.len, rec.eFormation);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'sFormation',10) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.sFormation := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.sFormation := FALSE; result := TRUE 
         END;
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'eNominalised',12) = 0 THEN BEGIN
         result := LSSTRTOTYPE_enominalisedtype( fieldvalue.str, fieldvalue.len, rec.eNominalised);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'comparatives',12) = 0 THEN BEGIN
         setp := setvalue;
         rec.comparatives := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_comparativetype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         comparatives);
            IF result THEN BEGIN
               rec.comparatives := rec.comparatives + [comparatives];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'superlatives',12) = 0 THEN BEGIN
         setp := setvalue;
         rec.superlatives := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_superlativetype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         superlatives);
            IF result THEN BEGIN
               rec.superlatives := rec.superlatives + [superlatives];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'temporal',8) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.temporal := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.temporal := FALSE; result := TRUE 
         END;
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'subcs',5) = 0 THEN BEGIN
         setp := setvalue;
         rec.subcs := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_adjsubctype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         subcs);
            IF result THEN BEGIN
               rec.subcs := rec.subcs + [subcs];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'reflexivity',11) = 0 THEN BEGIN
         result := LSSTRTOTYPE_reflexivetype( fieldvalue.str, fieldvalue.len, rec.reflexivity);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'thetaadj',8) = 0 THEN BEGIN
         result := LSSTRTOTYPE_thetaadjtype( fieldvalue.str, fieldvalue.len, rec.thetaadj);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'adjpatterns',11) = 0 THEN BEGIN
         setp := setvalue;
         rec.adjpatterns := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_synpatterntype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         adjpatterns);
            IF result THEN BEGIN
               rec.adjpatterns := rec.adjpatterns + [adjpatterns];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'prepkey',7) = 0 THEN BEGIN
         result := STR_StrToInteger(fieldvalue.str, fieldvalue.len, rec.prepkey);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'possadv',7) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.possadv := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.possadv := FALSE; result := TRUE 
         END;
         END;
      END;
      attr^.Error := (NOT result);
      attr := attr^.NextAttr
   END;
   LSCONVATTR_BADJrecord := result;
END {LSCONVATTR_BADJrecord};

FUNCTION LSCONVATTR_SUBADJrecord(VAR rec: LSDOMAINT_SUBADJrecord;
                  VAR pattr: LDCONVREC_pAttrStruct): BOOLEAN;
VAR result : BOOLEAN;
    setp   : LDCONVREC_pSetValueType;
    attr   : LDCONVREC_pAttrStruct;

    req : LSDOMAINT_polaritytype; 
    env : LSDOMAINT_polaritytype; 
    uses : LSDOMAINT_adjusetype; 
    comparatives : LSDOMAINT_comparativetype; 
    superlatives : LSDOMAINT_superlativetype; 
    subcs : LSDOMAINT_adjsubctype; 
    adjpatterns : LSDOMAINT_synpatterntype; 
BEGIN
   result := TRUE; attr := pattr;
   MAKET_SUBADJrec(rec);
   WHILE (attr <> NIL) AND result DO BEGIN
   WITH attr^ DO BEGIN
      IF FALSE THEN BEGIN
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'req',3) = 0 THEN BEGIN
         setp := setvalue;
         rec.req := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_polaritytype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         req);
            IF result THEN BEGIN
               rec.req := rec.req + [req];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'env',3) = 0 THEN BEGIN
         setp := setvalue;
         rec.env := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_polaritytype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         env);
            IF result THEN BEGIN
               rec.env := rec.env + [env];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'class',5) = 0 THEN BEGIN
         result := LSSTRTOTYPE_timeadvclasstype( fieldvalue.str, fieldvalue.len, rec.class);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'deixis',6) = 0 THEN BEGIN
         result := LSSTRTOTYPE_deixistype( fieldvalue.str, fieldvalue.len, rec.deixis);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'aspect',6) = 0 THEN BEGIN
         result := LSSTRTOTYPE_aspecttype( fieldvalue.str, fieldvalue.len, rec.aspect);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'retro',5) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.retro := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.retro := FALSE; result := TRUE 
         END;
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'uses',4) = 0 THEN BEGIN
         setp := setvalue;
         rec.uses := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_adjusetype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         uses);
            IF result THEN BEGIN
               rec.uses := rec.uses + [uses];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'eFormation',10) = 0 THEN BEGIN
         result := LSSTRTOTYPE_eformationtype( fieldvalue.str, fieldvalue.len, rec.eFormation);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'sFormation',10) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.sFormation := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.sFormation := FALSE; result := TRUE 
         END;
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'eNominalised',12) = 0 THEN BEGIN
         result := LSSTRTOTYPE_enominalisedtype( fieldvalue.str, fieldvalue.len, rec.eNominalised);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'comparatives',12) = 0 THEN BEGIN
         setp := setvalue;
         rec.comparatives := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_comparativetype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         comparatives);
            IF result THEN BEGIN
               rec.comparatives := rec.comparatives + [comparatives];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'superlatives',12) = 0 THEN BEGIN
         setp := setvalue;
         rec.superlatives := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_superlativetype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         superlatives);
            IF result THEN BEGIN
               rec.superlatives := rec.superlatives + [superlatives];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'temporal',8) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.temporal := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.temporal := FALSE; result := TRUE 
         END;
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'subcs',5) = 0 THEN BEGIN
         setp := setvalue;
         rec.subcs := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_adjsubctype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         subcs);
            IF result THEN BEGIN
               rec.subcs := rec.subcs + [subcs];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'reflexivity',11) = 0 THEN BEGIN
         result := LSSTRTOTYPE_reflexivetype( fieldvalue.str, fieldvalue.len, rec.reflexivity);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'thetaadj',8) = 0 THEN BEGIN
         result := LSSTRTOTYPE_thetaadjtype( fieldvalue.str, fieldvalue.len, rec.thetaadj);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'adjpatterns',11) = 0 THEN BEGIN
         setp := setvalue;
         rec.adjpatterns := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_synpatterntype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         adjpatterns);
            IF result THEN BEGIN
               rec.adjpatterns := rec.adjpatterns + [adjpatterns];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'prepkey',7) = 0 THEN BEGIN
         result := STR_StrToInteger(fieldvalue.str, fieldvalue.len, rec.prepkey);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'possadv',7) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.possadv := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.possadv := FALSE; result := TRUE 
         END;
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'lastaffix',9) = 0 THEN BEGIN
         result := LSSTRTOTYPE_affixtype( fieldvalue.str, fieldvalue.len, rec.lastaffix);
         END;
      END;
      attr^.Error := (NOT result);
      attr := attr^.NextAttr
   END;
   LSCONVATTR_SUBADJrecord := result;
END {LSCONVATTR_SUBADJrecord};

FUNCTION LSCONVATTR_ADJrecord(VAR rec: LSDOMAINT_ADJrecord;
                  VAR pattr: LDCONVREC_pAttrStruct): BOOLEAN;
VAR result : BOOLEAN;
    setp   : LDCONVREC_pSetValueType;
    attr   : LDCONVREC_pAttrStruct;

    req : LSDOMAINT_polaritytype; 
    env : LSDOMAINT_polaritytype; 
    uses : LSDOMAINT_adjusetype; 
    comparatives : LSDOMAINT_comparativetype; 
    superlatives : LSDOMAINT_superlativetype; 
    subcs : LSDOMAINT_adjsubctype; 
    adjpatterns : LSDOMAINT_synpatterntype; 
BEGIN
   result := TRUE; attr := pattr;
   MAKET_ALLOADJrec(rec);
   WHILE (attr <> NIL) AND result DO BEGIN
   WITH attr^ DO BEGIN
      IF FALSE THEN BEGIN
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'req',3) = 0 THEN BEGIN
         setp := setvalue;
         rec.req := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_polaritytype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         req);
            IF result THEN BEGIN
               rec.req := rec.req + [req];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'env',3) = 0 THEN BEGIN
         setp := setvalue;
         rec.env := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_polaritytype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         env);
            IF result THEN BEGIN
               rec.env := rec.env + [env];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'class',5) = 0 THEN BEGIN
         result := LSSTRTOTYPE_timeadvclasstype( fieldvalue.str, fieldvalue.len, rec.class);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'deixis',6) = 0 THEN BEGIN
         result := LSSTRTOTYPE_deixistype( fieldvalue.str, fieldvalue.len, rec.deixis);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'aspect',6) = 0 THEN BEGIN
         result := LSSTRTOTYPE_aspecttype( fieldvalue.str, fieldvalue.len, rec.aspect);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'retro',5) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.retro := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.retro := FALSE; result := TRUE 
         END;
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'uses',4) = 0 THEN BEGIN
         setp := setvalue;
         rec.uses := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_adjusetype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         uses);
            IF result THEN BEGIN
               rec.uses := rec.uses + [uses];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'eFormation',10) = 0 THEN BEGIN
         result := LSSTRTOTYPE_eformationtype( fieldvalue.str, fieldvalue.len, rec.eFormation);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'sFormation',10) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.sFormation := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.sFormation := FALSE; result := TRUE 
         END;
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'eNominalised',12) = 0 THEN BEGIN
         result := LSSTRTOTYPE_enominalisedtype( fieldvalue.str, fieldvalue.len, rec.eNominalised);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'comparatives',12) = 0 THEN BEGIN
         setp := setvalue;
         rec.comparatives := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_comparativetype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         comparatives);
            IF result THEN BEGIN
               rec.comparatives := rec.comparatives + [comparatives];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'superlatives',12) = 0 THEN BEGIN
         setp := setvalue;
         rec.superlatives := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_superlativetype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         superlatives);
            IF result THEN BEGIN
               rec.superlatives := rec.superlatives + [superlatives];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'form',4) = 0 THEN BEGIN
         result := LSSTRTOTYPE_adjadvformtype( fieldvalue.str, fieldvalue.len, rec.form);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'eORenForm',9) = 0 THEN BEGIN
         result := LSSTRTOTYPE_eorenformtype( fieldvalue.str, fieldvalue.len, rec.eORenForm);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'temporal',8) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.temporal := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.temporal := FALSE; result := TRUE 
         END;
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'subcs',5) = 0 THEN BEGIN
         setp := setvalue;
         rec.subcs := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_adjsubctype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         subcs);
            IF result THEN BEGIN
               rec.subcs := rec.subcs + [subcs];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'thetaadj',8) = 0 THEN BEGIN
         result := LSSTRTOTYPE_thetaadjtype( fieldvalue.str, fieldvalue.len, rec.thetaadj);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'adjpatterns',11) = 0 THEN BEGIN
         setp := setvalue;
         rec.adjpatterns := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_synpatterntype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         adjpatterns);
            IF result THEN BEGIN
               rec.adjpatterns := rec.adjpatterns + [adjpatterns];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'prepkey',7) = 0 THEN BEGIN
         result := STR_StrToInteger(fieldvalue.str, fieldvalue.len, rec.prepkey);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'reflexivity',11) = 0 THEN BEGIN
         result := LSSTRTOTYPE_reflexivetype( fieldvalue.str, fieldvalue.len, rec.reflexivity);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'possadv',7) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.possadv := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.possadv := FALSE; result := TRUE 
         END;
         END;
      END;
      attr^.Error := (NOT result);
      attr := attr^.NextAttr
   END;
   LSCONVATTR_ADJrecord := result;
END {LSCONVATTR_ADJrecord};

FUNCTION LSCONVATTR_ADJPrecord(VAR rec: LSDOMAINT_ADJPrecord;
                  VAR pattr: LDCONVREC_pAttrStruct): BOOLEAN;
VAR result : BOOLEAN;
    setp   : LDCONVREC_pSetValueType;
    attr   : LDCONVREC_pAttrStruct;

    req : LSDOMAINT_polaritytype; 
    env : LSDOMAINT_polaritytype; 
    actuseefs : LSDOMAINT_adjusetype; 
    actsubcefs : LSDOMAINT_adjsubctype; 
    adjpatternefs : LSDOMAINT_synpatterntype; 
BEGIN
   result := TRUE; attr := pattr;
   MAKET_ADJPrec(rec);
   WHILE (attr <> NIL) AND result DO BEGIN
   WITH attr^ DO BEGIN
      IF FALSE THEN BEGIN
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'req',3) = 0 THEN BEGIN
         setp := setvalue;
         rec.req := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_polaritytype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         req);
            IF result THEN BEGIN
               rec.req := rec.req + [req];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'env',3) = 0 THEN BEGIN
         setp := setvalue;
         rec.env := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_polaritytype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         env);
            IF result THEN BEGIN
               rec.env := rec.env + [env];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'class',5) = 0 THEN BEGIN
         result := LSSTRTOTYPE_timeadvclasstype( fieldvalue.str, fieldvalue.len, rec.class);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'deixis',6) = 0 THEN BEGIN
         result := LSSTRTOTYPE_deixistype( fieldvalue.str, fieldvalue.len, rec.deixis);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'aspect',6) = 0 THEN BEGIN
         result := LSSTRTOTYPE_aspecttype( fieldvalue.str, fieldvalue.len, rec.aspect);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'retro',5) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.retro := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.retro := FALSE; result := TRUE 
         END;
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'actuseefs',9) = 0 THEN BEGIN
         setp := setvalue;
         rec.actuseefs := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_adjusetype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         actuseefs);
            IF result THEN BEGIN
               rec.actuseefs := rec.actuseefs + [actuseefs];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'eformation',10) = 0 THEN BEGIN
         result := LSSTRTOTYPE_eformationtype( fieldvalue.str, fieldvalue.len, rec.eformation);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'enominalised',12) = 0 THEN BEGIN
         result := LSSTRTOTYPE_enominalisedtype( fieldvalue.str, fieldvalue.len, rec.enominalised);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'form',4) = 0 THEN BEGIN
         result := LSSTRTOTYPE_adjadvformtype( fieldvalue.str, fieldvalue.len, rec.form);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'eORenForm',9) = 0 THEN BEGIN
         result := LSSTRTOTYPE_eorenformtype( fieldvalue.str, fieldvalue.len, rec.eORenForm);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'temporal',8) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.temporal := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.temporal := FALSE; result := TRUE 
         END;
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'actsubcefs',10) = 0 THEN BEGIN
         setp := setvalue;
         rec.actsubcefs := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_adjsubctype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         actsubcefs);
            IF result THEN BEGIN
               rec.actsubcefs := rec.actsubcefs + [actsubcefs];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'thetaadj',8) = 0 THEN BEGIN
         result := LSSTRTOTYPE_thetaadjtype( fieldvalue.str, fieldvalue.len, rec.thetaadj);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'adjpatternefs',13) = 0 THEN BEGIN
         setp := setvalue;
         rec.adjpatternefs := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_synpatterntype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         adjpatternefs);
            IF result THEN BEGIN
               rec.adjpatternefs := rec.adjpatternefs + [adjpatternefs];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'reflexivity',11) = 0 THEN BEGIN
         result := LSSTRTOTYPE_reflexivetype( fieldvalue.str, fieldvalue.len, rec.reflexivity);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'mood',4) = 0 THEN BEGIN
         result := LSSTRTOTYPE_xpmoodtype( fieldvalue.str, fieldvalue.len, rec.mood);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'coord',5) = 0 THEN BEGIN
         result := LSSTRTOTYPE_coordtype( fieldvalue.str, fieldvalue.len, rec.coord);
         END;
      END;
      attr^.Error := (NOT result);
      attr := attr^.NextAttr
   END;
   LSCONVATTR_ADJPrecord := result;
END {LSCONVATTR_ADJPrecord};

FUNCTION LSCONVATTR_ADJPPROPrecord(VAR rec: LSDOMAINT_ADJPPROPrecord;
                  VAR pattr: LDCONVREC_pAttrStruct): BOOLEAN;
VAR result : BOOLEAN;
    setp   : LDCONVREC_pSetValueType;
    attr   : LDCONVREC_pAttrStruct;

    req : LSDOMAINT_polaritytype; 
    env : LSDOMAINT_polaritytype; 
    aktionsarts : LSDOMAINT_aktionsarttype; 
    actsubcefs : LSDOMAINT_adjsubctype; 
    adjpatternefs : LSDOMAINT_synpatterntype; 
BEGIN
   result := TRUE; attr := pattr;
   MAKET_CLOSEDADJPPROPrec(rec);
   WHILE (attr <> NIL) AND result DO BEGIN
   WITH attr^ DO BEGIN
      IF FALSE THEN BEGIN
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'req',3) = 0 THEN BEGIN
         setp := setvalue;
         rec.req := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_polaritytype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         req);
            IF result THEN BEGIN
               rec.req := rec.req + [req];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'env',3) = 0 THEN BEGIN
         setp := setvalue;
         rec.env := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_polaritytype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         env);
            IF result THEN BEGIN
               rec.env := rec.env + [env];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'class',5) = 0 THEN BEGIN
         result := LSSTRTOTYPE_timeadvclasstype( fieldvalue.str, fieldvalue.len, rec.class);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'deixis',6) = 0 THEN BEGIN
         result := LSSTRTOTYPE_deixistype( fieldvalue.str, fieldvalue.len, rec.deixis);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'aspect',6) = 0 THEN BEGIN
         result := LSSTRTOTYPE_aspecttype( fieldvalue.str, fieldvalue.len, rec.aspect);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'retro',5) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.retro := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.retro := FALSE; result := TRUE 
         END;
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'aktionsarts',11) = 0 THEN BEGIN
         setp := setvalue;
         rec.aktionsarts := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_aktionsarttype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         aktionsarts);
            IF result THEN BEGIN
               rec.aktionsarts := rec.aktionsarts + [aktionsarts];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'superdeixis',11) = 0 THEN BEGIN
         result := LSSTRTOTYPE_deixistype( fieldvalue.str, fieldvalue.len, rec.superdeixis);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'temporal',8) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.temporal := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.temporal := FALSE; result := TRUE 
         END;
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'actsubcefs',10) = 0 THEN BEGIN
         setp := setvalue;
         rec.actsubcefs := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_adjsubctype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         actsubcefs);
            IF result THEN BEGIN
               rec.actsubcefs := rec.actsubcefs + [actsubcefs];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'thetaadj',8) = 0 THEN BEGIN
         result := LSSTRTOTYPE_thetaadjtype( fieldvalue.str, fieldvalue.len, rec.thetaadj);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'adjpatternefs',13) = 0 THEN BEGIN
         setp := setvalue;
         rec.adjpatternefs := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_synpatterntype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         adjpatternefs);
            IF result THEN BEGIN
               rec.adjpatternefs := rec.adjpatternefs + [adjpatternefs];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'PROsubject',10) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.PROsubject := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.PROsubject := FALSE; result := TRUE 
         END;
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'mood',4) = 0 THEN BEGIN
         result := LSSTRTOTYPE_xpmoodtype( fieldvalue.str, fieldvalue.len, rec.mood);
         END;
      END;
      attr^.Error := (NOT result);
      attr := attr^.NextAttr
   END;
   LSCONVATTR_ADJPPROPrecord := result;
END {LSCONVATTR_ADJPPROPrecord};

FUNCTION LSCONVATTR_ADJPPROPVARrecord(VAR rec: LSDOMAINT_ADJPPROPVARrecord;
                  VAR pattr: LDCONVREC_pAttrStruct): BOOLEAN;
VAR result : BOOLEAN;
    setp   : LDCONVREC_pSetValueType;
    attr   : LDCONVREC_pAttrStruct;

    req : LSDOMAINT_polaritytype; 
    env : LSDOMAINT_polaritytype; 
    aktionsarts : LSDOMAINT_aktionsarttype; 
    actsubcefs : LSDOMAINT_adjsubctype; 
    adjpatternefs : LSDOMAINT_synpatterntype; 
BEGIN
   result := TRUE; attr := pattr;
   MAKET_ADJPPROPVARrec(rec);
   WHILE (attr <> NIL) AND result DO BEGIN
   WITH attr^ DO BEGIN
      IF FALSE THEN BEGIN
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'req',3) = 0 THEN BEGIN
         setp := setvalue;
         rec.req := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_polaritytype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         req);
            IF result THEN BEGIN
               rec.req := rec.req + [req];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'env',3) = 0 THEN BEGIN
         setp := setvalue;
         rec.env := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_polaritytype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         env);
            IF result THEN BEGIN
               rec.env := rec.env + [env];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'class',5) = 0 THEN BEGIN
         result := LSSTRTOTYPE_timeadvclasstype( fieldvalue.str, fieldvalue.len, rec.class);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'deixis',6) = 0 THEN BEGIN
         result := LSSTRTOTYPE_deixistype( fieldvalue.str, fieldvalue.len, rec.deixis);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'aspect',6) = 0 THEN BEGIN
         result := LSSTRTOTYPE_aspecttype( fieldvalue.str, fieldvalue.len, rec.aspect);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'retro',5) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.retro := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.retro := FALSE; result := TRUE 
         END;
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'aktionsarts',11) = 0 THEN BEGIN
         setp := setvalue;
         rec.aktionsarts := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_aktionsarttype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         aktionsarts);
            IF result THEN BEGIN
               rec.aktionsarts := rec.aktionsarts + [aktionsarts];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'superdeixis',11) = 0 THEN BEGIN
         result := LSSTRTOTYPE_deixistype( fieldvalue.str, fieldvalue.len, rec.superdeixis);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'temporal',8) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.temporal := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.temporal := FALSE; result := TRUE 
         END;
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'actsubcefs',10) = 0 THEN BEGIN
         setp := setvalue;
         rec.actsubcefs := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_adjsubctype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         actsubcefs);
            IF result THEN BEGIN
               rec.actsubcefs := rec.actsubcefs + [actsubcefs];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'thetaadj',8) = 0 THEN BEGIN
         result := LSSTRTOTYPE_thetaadjtype( fieldvalue.str, fieldvalue.len, rec.thetaadj);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'adjpatternefs',13) = 0 THEN BEGIN
         setp := setvalue;
         rec.adjpatternefs := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_synpatterntype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         adjpatternefs);
            IF result THEN BEGIN
               rec.adjpatternefs := rec.adjpatternefs + [adjpatternefs];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'PROsubject',10) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.PROsubject := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.PROsubject := FALSE; result := TRUE 
         END;
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'mood',4) = 0 THEN BEGIN
         result := LSSTRTOTYPE_xpmoodtype( fieldvalue.str, fieldvalue.len, rec.mood);
         END;
      END;
      attr^.Error := (NOT result);
      attr := attr^.NextAttr
   END;
   LSCONVATTR_ADJPPROPVARrecord := result;
END {LSCONVATTR_ADJPPROPVARrecord};

FUNCTION LSCONVATTR_BADVrecord(VAR rec: LSDOMAINT_BADVrecord;
                  VAR pattr: LDCONVREC_pAttrStruct): BOOLEAN;
VAR result : BOOLEAN;
    setp   : LDCONVREC_pSetValueType;
    attr   : LDCONVREC_pAttrStruct;

    req : LSDOMAINT_polaritytype; 
    env : LSDOMAINT_polaritytype; 
    comparatives : LSDOMAINT_comparativetype; 
    superlatives : LSDOMAINT_superlativetype; 
    subcs : LSDOMAINT_advsubctype; 
    advpatterns : LSDOMAINT_synpatterntype; 
BEGIN
   result := TRUE; attr := pattr;
   MAKET_BADVrec(rec);
   WHILE (attr <> NIL) AND result DO BEGIN
   WITH attr^ DO BEGIN
      IF FALSE THEN BEGIN
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                          'KEY', 3) = 0 THEN BEGIN
         result := STR_StrToInteger(fieldvalue.str,
                                 fieldvalue.len, rec.key);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'req',3) = 0 THEN BEGIN
         setp := setvalue;
         rec.req := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_polaritytype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         req);
            IF result THEN BEGIN
               rec.req := rec.req + [req];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'env',3) = 0 THEN BEGIN
         setp := setvalue;
         rec.env := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_polaritytype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         env);
            IF result THEN BEGIN
               rec.env := rec.env + [env];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'comparatives',12) = 0 THEN BEGIN
         setp := setvalue;
         rec.comparatives := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_comparativetype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         comparatives);
            IF result THEN BEGIN
               rec.comparatives := rec.comparatives + [comparatives];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'superlatives',12) = 0 THEN BEGIN
         setp := setvalue;
         rec.superlatives := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_superlativetype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         superlatives);
            IF result THEN BEGIN
               rec.superlatives := rec.superlatives + [superlatives];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'subcs',5) = 0 THEN BEGIN
         setp := setvalue;
         rec.subcs := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_advsubctype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         subcs);
            IF result THEN BEGIN
               rec.subcs := rec.subcs + [subcs];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'Qstatus',7) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.Qstatus := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.Qstatus := FALSE; result := TRUE 
         END;
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'class',5) = 0 THEN BEGIN
         result := LSSTRTOTYPE_timeadvclasstype( fieldvalue.str, fieldvalue.len, rec.class);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'deixis',6) = 0 THEN BEGIN
         result := LSSTRTOTYPE_deixistype( fieldvalue.str, fieldvalue.len, rec.deixis);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'aspect',6) = 0 THEN BEGIN
         result := LSSTRTOTYPE_aspecttype( fieldvalue.str, fieldvalue.len, rec.aspect);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'retro',5) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.retro := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.retro := FALSE; result := TRUE 
         END;
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'mood',4) = 0 THEN BEGIN
         result := LSSTRTOTYPE_xpmoodtype( fieldvalue.str, fieldvalue.len, rec.mood);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'thetaadv',8) = 0 THEN BEGIN
         result := LSSTRTOTYPE_thetaadvtype( fieldvalue.str, fieldvalue.len, rec.thetaadv);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'advpatterns',11) = 0 THEN BEGIN
         setp := setvalue;
         rec.advpatterns := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_synpatterntype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         advpatterns);
            IF result THEN BEGIN
               rec.advpatterns := rec.advpatterns + [advpatterns];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'prepkey',7) = 0 THEN BEGIN
         result := STR_StrToInteger(fieldvalue.str, fieldvalue.len, rec.prepkey);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'temporal',8) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.temporal := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.temporal := FALSE; result := TRUE 
         END;
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'possnietnp',10) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.possnietnp := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.possnietnp := FALSE; result := TRUE 
         END;
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'thanas',6) = 0 THEN BEGIN
         result := LSSTRTOTYPE_thanascompltype( fieldvalue.str, fieldvalue.len, rec.thanas);
         END;
      END;
      attr^.Error := (NOT result);
      attr := attr^.NextAttr
   END;
   LSCONVATTR_BADVrecord := result;
END {LSCONVATTR_BADVrecord};

FUNCTION LSCONVATTR_SUBADVrecord(VAR rec: LSDOMAINT_SUBADVrecord;
                  VAR pattr: LDCONVREC_pAttrStruct): BOOLEAN;
VAR result : BOOLEAN;
    setp   : LDCONVREC_pSetValueType;
    attr   : LDCONVREC_pAttrStruct;

    req : LSDOMAINT_polaritytype; 
    env : LSDOMAINT_polaritytype; 
    comparatives : LSDOMAINT_comparativetype; 
    superlatives : LSDOMAINT_superlativetype; 
    subcs : LSDOMAINT_advsubctype; 
    advpatterns : LSDOMAINT_synpatterntype; 
BEGIN
   result := TRUE; attr := pattr;
   MAKET_SUBADVrec(rec);
   WHILE (attr <> NIL) AND result DO BEGIN
   WITH attr^ DO BEGIN
      IF FALSE THEN BEGIN
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'req',3) = 0 THEN BEGIN
         setp := setvalue;
         rec.req := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_polaritytype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         req);
            IF result THEN BEGIN
               rec.req := rec.req + [req];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'env',3) = 0 THEN BEGIN
         setp := setvalue;
         rec.env := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_polaritytype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         env);
            IF result THEN BEGIN
               rec.env := rec.env + [env];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'comparatives',12) = 0 THEN BEGIN
         setp := setvalue;
         rec.comparatives := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_comparativetype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         comparatives);
            IF result THEN BEGIN
               rec.comparatives := rec.comparatives + [comparatives];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'superlatives',12) = 0 THEN BEGIN
         setp := setvalue;
         rec.superlatives := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_superlativetype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         superlatives);
            IF result THEN BEGIN
               rec.superlatives := rec.superlatives + [superlatives];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'subcs',5) = 0 THEN BEGIN
         setp := setvalue;
         rec.subcs := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_advsubctype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         subcs);
            IF result THEN BEGIN
               rec.subcs := rec.subcs + [subcs];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'Qstatus',7) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.Qstatus := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.Qstatus := FALSE; result := TRUE 
         END;
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'class',5) = 0 THEN BEGIN
         result := LSSTRTOTYPE_timeadvclasstype( fieldvalue.str, fieldvalue.len, rec.class);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'deixis',6) = 0 THEN BEGIN
         result := LSSTRTOTYPE_deixistype( fieldvalue.str, fieldvalue.len, rec.deixis);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'aspect',6) = 0 THEN BEGIN
         result := LSSTRTOTYPE_aspecttype( fieldvalue.str, fieldvalue.len, rec.aspect);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'retro',5) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.retro := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.retro := FALSE; result := TRUE 
         END;
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'mood',4) = 0 THEN BEGIN
         result := LSSTRTOTYPE_xpmoodtype( fieldvalue.str, fieldvalue.len, rec.mood);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'thetaadv',8) = 0 THEN BEGIN
         result := LSSTRTOTYPE_thetaadvtype( fieldvalue.str, fieldvalue.len, rec.thetaadv);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'advpatterns',11) = 0 THEN BEGIN
         setp := setvalue;
         rec.advpatterns := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_synpatterntype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         advpatterns);
            IF result THEN BEGIN
               rec.advpatterns := rec.advpatterns + [advpatterns];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'prepkey',7) = 0 THEN BEGIN
         result := STR_StrToInteger(fieldvalue.str, fieldvalue.len, rec.prepkey);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'temporal',8) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.temporal := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.temporal := FALSE; result := TRUE 
         END;
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'possnietnp',10) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.possnietnp := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.possnietnp := FALSE; result := TRUE 
         END;
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'thanas',6) = 0 THEN BEGIN
         result := LSSTRTOTYPE_thanascompltype( fieldvalue.str, fieldvalue.len, rec.thanas);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'lastaffix',9) = 0 THEN BEGIN
         result := LSSTRTOTYPE_affixtype( fieldvalue.str, fieldvalue.len, rec.lastaffix);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'Radvb',5) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.Radvb := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.Radvb := FALSE; result := TRUE 
         END;
         END;
      END;
      attr^.Error := (NOT result);
      attr := attr^.NextAttr
   END;
   LSCONVATTR_SUBADVrecord := result;
END {LSCONVATTR_SUBADVrecord};

FUNCTION LSCONVATTR_ADVrecord(VAR rec: LSDOMAINT_ADVrecord;
                  VAR pattr: LDCONVREC_pAttrStruct): BOOLEAN;
VAR result : BOOLEAN;
    setp   : LDCONVREC_pSetValueType;
    attr   : LDCONVREC_pAttrStruct;

    req : LSDOMAINT_polaritytype; 
    env : LSDOMAINT_polaritytype; 
    comparatives : LSDOMAINT_comparativetype; 
    superlatives : LSDOMAINT_superlativetype; 
    subcs : LSDOMAINT_advsubctype; 
    advpatterns : LSDOMAINT_synpatterntype; 
BEGIN
   result := TRUE; attr := pattr;
   MAKET_ALLOADVrec(rec);
   WHILE (attr <> NIL) AND result DO BEGIN
   WITH attr^ DO BEGIN
      IF FALSE THEN BEGIN
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'req',3) = 0 THEN BEGIN
         setp := setvalue;
         rec.req := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_polaritytype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         req);
            IF result THEN BEGIN
               rec.req := rec.req + [req];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'env',3) = 0 THEN BEGIN
         setp := setvalue;
         rec.env := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_polaritytype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         env);
            IF result THEN BEGIN
               rec.env := rec.env + [env];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'comparatives',12) = 0 THEN BEGIN
         setp := setvalue;
         rec.comparatives := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_comparativetype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         comparatives);
            IF result THEN BEGIN
               rec.comparatives := rec.comparatives + [comparatives];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'superlatives',12) = 0 THEN BEGIN
         setp := setvalue;
         rec.superlatives := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_superlativetype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         superlatives);
            IF result THEN BEGIN
               rec.superlatives := rec.superlatives + [superlatives];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'subcs',5) = 0 THEN BEGIN
         setp := setvalue;
         rec.subcs := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_advsubctype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         subcs);
            IF result THEN BEGIN
               rec.subcs := rec.subcs + [subcs];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'Qstatus',7) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.Qstatus := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.Qstatus := FALSE; result := TRUE 
         END;
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'form',4) = 0 THEN BEGIN
         result := LSSTRTOTYPE_adjadvformtype( fieldvalue.str, fieldvalue.len, rec.form);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'eORenForm',9) = 0 THEN BEGIN
         result := LSSTRTOTYPE_eorenformtype( fieldvalue.str, fieldvalue.len, rec.eORenForm);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'class',5) = 0 THEN BEGIN
         result := LSSTRTOTYPE_timeadvclasstype( fieldvalue.str, fieldvalue.len, rec.class);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'deixis',6) = 0 THEN BEGIN
         result := LSSTRTOTYPE_deixistype( fieldvalue.str, fieldvalue.len, rec.deixis);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'aspect',6) = 0 THEN BEGIN
         result := LSSTRTOTYPE_aspecttype( fieldvalue.str, fieldvalue.len, rec.aspect);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'retro',5) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.retro := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.retro := FALSE; result := TRUE 
         END;
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'mood',4) = 0 THEN BEGIN
         result := LSSTRTOTYPE_xpmoodtype( fieldvalue.str, fieldvalue.len, rec.mood);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'thetaadv',8) = 0 THEN BEGIN
         result := LSSTRTOTYPE_thetaadvtype( fieldvalue.str, fieldvalue.len, rec.thetaadv);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'advpatterns',11) = 0 THEN BEGIN
         setp := setvalue;
         rec.advpatterns := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_synpatterntype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         advpatterns);
            IF result THEN BEGIN
               rec.advpatterns := rec.advpatterns + [advpatterns];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'prepkey',7) = 0 THEN BEGIN
         result := STR_StrToInteger(fieldvalue.str, fieldvalue.len, rec.prepkey);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'temporal',8) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.temporal := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.temporal := FALSE; result := TRUE 
         END;
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'possnietnp',10) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.possnietnp := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.possnietnp := FALSE; result := TRUE 
         END;
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'thanas',6) = 0 THEN BEGIN
         result := LSSTRTOTYPE_thanascompltype( fieldvalue.str, fieldvalue.len, rec.thanas);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'Radvb',5) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.Radvb := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.Radvb := FALSE; result := TRUE 
         END;
         END;
      END;
      attr^.Error := (NOT result);
      attr := attr^.NextAttr
   END;
   LSCONVATTR_ADVrecord := result;
END {LSCONVATTR_ADVrecord};

FUNCTION LSCONVATTR_ADVPrecord(VAR rec: LSDOMAINT_ADVPrecord;
                  VAR pattr: LDCONVREC_pAttrStruct): BOOLEAN;
VAR result : BOOLEAN;
    setp   : LDCONVREC_pSetValueType;
    attr   : LDCONVREC_pAttrStruct;

    req : LSDOMAINT_polaritytype; 
    env : LSDOMAINT_polaritytype; 
    actsubcefs : LSDOMAINT_advsubctype; 
    advpatternefs : LSDOMAINT_synpatterntype; 
BEGIN
   result := TRUE; attr := pattr;
   MAKET_ADVPrec(rec);
   WHILE (attr <> NIL) AND result DO BEGIN
   WITH attr^ DO BEGIN
      IF FALSE THEN BEGIN
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'req',3) = 0 THEN BEGIN
         setp := setvalue;
         rec.req := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_polaritytype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         req);
            IF result THEN BEGIN
               rec.req := rec.req + [req];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'env',3) = 0 THEN BEGIN
         setp := setvalue;
         rec.env := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_polaritytype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         env);
            IF result THEN BEGIN
               rec.env := rec.env + [env];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'class',5) = 0 THEN BEGIN
         result := LSSTRTOTYPE_timeadvclasstype( fieldvalue.str, fieldvalue.len, rec.class);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'deixis',6) = 0 THEN BEGIN
         result := LSSTRTOTYPE_deixistype( fieldvalue.str, fieldvalue.len, rec.deixis);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'aspect',6) = 0 THEN BEGIN
         result := LSSTRTOTYPE_aspecttype( fieldvalue.str, fieldvalue.len, rec.aspect);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'retro',5) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.retro := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.retro := FALSE; result := TRUE 
         END;
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'superdeixis',11) = 0 THEN BEGIN
         result := LSSTRTOTYPE_deixistype( fieldvalue.str, fieldvalue.len, rec.superdeixis);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'actsubcefs',10) = 0 THEN BEGIN
         setp := setvalue;
         rec.actsubcefs := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_advsubctype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         actsubcefs);
            IF result THEN BEGIN
               rec.actsubcefs := rec.actsubcefs + [actsubcefs];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'Qstatus',7) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.Qstatus := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.Qstatus := FALSE; result := TRUE 
         END;
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'mood',4) = 0 THEN BEGIN
         result := LSSTRTOTYPE_xpmoodtype( fieldvalue.str, fieldvalue.len, rec.mood);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'thetaadv',8) = 0 THEN BEGIN
         result := LSSTRTOTYPE_thetaadvtype( fieldvalue.str, fieldvalue.len, rec.thetaadv);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'advpatternefs',13) = 0 THEN BEGIN
         setp := setvalue;
         rec.advpatternefs := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_synpatterntype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         advpatternefs);
            IF result THEN BEGIN
               rec.advpatternefs := rec.advpatternefs + [advpatternefs];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'temporal',8) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.temporal := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.temporal := FALSE; result := TRUE 
         END;
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'Radvb',5) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.Radvb := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.Radvb := FALSE; result := TRUE 
         END;
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'possnietnp',10) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.possnietnp := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.possnietnp := FALSE; result := TRUE 
         END;
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'thanas',6) = 0 THEN BEGIN
         result := LSSTRTOTYPE_thanascompltype( fieldvalue.str, fieldvalue.len, rec.thanas);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'thanascompl',11) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.thanascompl := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.thanascompl := FALSE; result := TRUE 
         END;
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'coord',5) = 0 THEN BEGIN
         result := LSSTRTOTYPE_coordtype( fieldvalue.str, fieldvalue.len, rec.coord);
         END;
      END;
      attr^.Error := (NOT result);
      attr := attr^.NextAttr
   END;
   LSCONVATTR_ADVPrecord := result;
END {LSCONVATTR_ADVPrecord};

FUNCTION LSCONVATTR_ADVPVARrecord(VAR rec: LSDOMAINT_ADVPVARrecord;
                  VAR pattr: LDCONVREC_pAttrStruct): BOOLEAN;
VAR result : BOOLEAN;
    setp   : LDCONVREC_pSetValueType;
    attr   : LDCONVREC_pAttrStruct;

    req : LSDOMAINT_polaritytype; 
    env : LSDOMAINT_polaritytype; 
    actsubcefs : LSDOMAINT_advsubctype; 
    advpatternefs : LSDOMAINT_synpatterntype; 
BEGIN
   result := TRUE; attr := pattr;
   MAKET_ADVPVARrec(rec);
   WHILE (attr <> NIL) AND result DO BEGIN
   WITH attr^ DO BEGIN
      IF FALSE THEN BEGIN
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'req',3) = 0 THEN BEGIN
         setp := setvalue;
         rec.req := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_polaritytype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         req);
            IF result THEN BEGIN
               rec.req := rec.req + [req];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'env',3) = 0 THEN BEGIN
         setp := setvalue;
         rec.env := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_polaritytype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         env);
            IF result THEN BEGIN
               rec.env := rec.env + [env];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'class',5) = 0 THEN BEGIN
         result := LSSTRTOTYPE_timeadvclasstype( fieldvalue.str, fieldvalue.len, rec.class);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'deixis',6) = 0 THEN BEGIN
         result := LSSTRTOTYPE_deixistype( fieldvalue.str, fieldvalue.len, rec.deixis);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'aspect',6) = 0 THEN BEGIN
         result := LSSTRTOTYPE_aspecttype( fieldvalue.str, fieldvalue.len, rec.aspect);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'retro',5) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.retro := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.retro := FALSE; result := TRUE 
         END;
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'superdeixis',11) = 0 THEN BEGIN
         result := LSSTRTOTYPE_deixistype( fieldvalue.str, fieldvalue.len, rec.superdeixis);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'actsubcefs',10) = 0 THEN BEGIN
         setp := setvalue;
         rec.actsubcefs := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_advsubctype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         actsubcefs);
            IF result THEN BEGIN
               rec.actsubcefs := rec.actsubcefs + [actsubcefs];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'Qstatus',7) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.Qstatus := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.Qstatus := FALSE; result := TRUE 
         END;
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'mood',4) = 0 THEN BEGIN
         result := LSSTRTOTYPE_xpmoodtype( fieldvalue.str, fieldvalue.len, rec.mood);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'thetaadv',8) = 0 THEN BEGIN
         result := LSSTRTOTYPE_thetaadvtype( fieldvalue.str, fieldvalue.len, rec.thetaadv);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'advpatternefs',13) = 0 THEN BEGIN
         setp := setvalue;
         rec.advpatternefs := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_synpatterntype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         advpatternefs);
            IF result THEN BEGIN
               rec.advpatternefs := rec.advpatternefs + [advpatternefs];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'temporal',8) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.temporal := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.temporal := FALSE; result := TRUE 
         END;
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'Radvb',5) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.Radvb := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.Radvb := FALSE; result := TRUE 
         END;
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'possnietnp',10) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.possnietnp := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.possnietnp := FALSE; result := TRUE 
         END;
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'thanas',6) = 0 THEN BEGIN
         result := LSSTRTOTYPE_thanascompltype( fieldvalue.str, fieldvalue.len, rec.thanas);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'thanascompl',11) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.thanascompl := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.thanascompl := FALSE; result := TRUE 
         END;
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'coord',5) = 0 THEN BEGIN
         result := LSSTRTOTYPE_coordtype( fieldvalue.str, fieldvalue.len, rec.coord);
         END;
      END;
      attr^.Error := (NOT result);
      attr := attr^.NextAttr
   END;
   LSCONVATTR_ADVPVARrecord := result;
END {LSCONVATTR_ADVPVARrecord};

FUNCTION LSCONVATTR_ADVPPROPrecord(VAR rec: LSDOMAINT_ADVPPROPrecord;
                  VAR pattr: LDCONVREC_pAttrStruct): BOOLEAN;
VAR result : BOOLEAN;
    setp   : LDCONVREC_pSetValueType;
    attr   : LDCONVREC_pAttrStruct;

    req : LSDOMAINT_polaritytype; 
    env : LSDOMAINT_polaritytype; 
    aktionsarts : LSDOMAINT_aktionsarttype; 
    actsubcefs : LSDOMAINT_advsubctype; 
    advpatternefs : LSDOMAINT_synpatterntype; 
BEGIN
   result := TRUE; attr := pattr;
   MAKET_CLOSEDADVPPROPrec(rec);
   WHILE (attr <> NIL) AND result DO BEGIN
   WITH attr^ DO BEGIN
      IF FALSE THEN BEGIN
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'req',3) = 0 THEN BEGIN
         setp := setvalue;
         rec.req := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_polaritytype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         req);
            IF result THEN BEGIN
               rec.req := rec.req + [req];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'env',3) = 0 THEN BEGIN
         setp := setvalue;
         rec.env := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_polaritytype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         env);
            IF result THEN BEGIN
               rec.env := rec.env + [env];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'class',5) = 0 THEN BEGIN
         result := LSSTRTOTYPE_timeadvclasstype( fieldvalue.str, fieldvalue.len, rec.class);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'deixis',6) = 0 THEN BEGIN
         result := LSSTRTOTYPE_deixistype( fieldvalue.str, fieldvalue.len, rec.deixis);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'aspect',6) = 0 THEN BEGIN
         result := LSSTRTOTYPE_aspecttype( fieldvalue.str, fieldvalue.len, rec.aspect);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'retro',5) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.retro := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.retro := FALSE; result := TRUE 
         END;
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'aktionsarts',11) = 0 THEN BEGIN
         setp := setvalue;
         rec.aktionsarts := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_aktionsarttype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         aktionsarts);
            IF result THEN BEGIN
               rec.aktionsarts := rec.aktionsarts + [aktionsarts];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'superdeixis',11) = 0 THEN BEGIN
         result := LSSTRTOTYPE_deixistype( fieldvalue.str, fieldvalue.len, rec.superdeixis);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'actsubcefs',10) = 0 THEN BEGIN
         setp := setvalue;
         rec.actsubcefs := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_advsubctype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         actsubcefs);
            IF result THEN BEGIN
               rec.actsubcefs := rec.actsubcefs + [actsubcefs];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'Qstatus',7) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.Qstatus := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.Qstatus := FALSE; result := TRUE 
         END;
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'thetaadv',8) = 0 THEN BEGIN
         result := LSSTRTOTYPE_thetaadvtype( fieldvalue.str, fieldvalue.len, rec.thetaadv);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'advpatternefs',13) = 0 THEN BEGIN
         setp := setvalue;
         rec.advpatternefs := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_synpatterntype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         advpatternefs);
            IF result THEN BEGIN
               rec.advpatternefs := rec.advpatternefs + [advpatternefs];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'PROsubject',10) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.PROsubject := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.PROsubject := FALSE; result := TRUE 
         END;
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'mood',4) = 0 THEN BEGIN
         result := LSSTRTOTYPE_xpmoodtype( fieldvalue.str, fieldvalue.len, rec.mood);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'temporal',8) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.temporal := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.temporal := FALSE; result := TRUE 
         END;
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'Radvb',5) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.Radvb := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.Radvb := FALSE; result := TRUE 
         END;
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'thanascompl',11) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.thanascompl := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.thanascompl := FALSE; result := TRUE 
         END;
         END;
      END;
      attr^.Error := (NOT result);
      attr := attr^.NextAttr
   END;
   LSCONVATTR_ADVPPROPrecord := result;
END {LSCONVATTR_ADVPPROPrecord};

FUNCTION LSCONVATTR_ADVPPROPVARrecord(VAR rec: LSDOMAINT_ADVPPROPVARrecord;
                  VAR pattr: LDCONVREC_pAttrStruct): BOOLEAN;
VAR result : BOOLEAN;
    setp   : LDCONVREC_pSetValueType;
    attr   : LDCONVREC_pAttrStruct;

    req : LSDOMAINT_polaritytype; 
    env : LSDOMAINT_polaritytype; 
    aktionsarts : LSDOMAINT_aktionsarttype; 
    actsubcefs : LSDOMAINT_advsubctype; 
    advpatternefs : LSDOMAINT_synpatterntype; 
BEGIN
   result := TRUE; attr := pattr;
   MAKET_ADVPPROPVARrec(rec);
   WHILE (attr <> NIL) AND result DO BEGIN
   WITH attr^ DO BEGIN
      IF FALSE THEN BEGIN
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'req',3) = 0 THEN BEGIN
         setp := setvalue;
         rec.req := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_polaritytype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         req);
            IF result THEN BEGIN
               rec.req := rec.req + [req];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'env',3) = 0 THEN BEGIN
         setp := setvalue;
         rec.env := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_polaritytype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         env);
            IF result THEN BEGIN
               rec.env := rec.env + [env];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'class',5) = 0 THEN BEGIN
         result := LSSTRTOTYPE_timeadvclasstype( fieldvalue.str, fieldvalue.len, rec.class);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'deixis',6) = 0 THEN BEGIN
         result := LSSTRTOTYPE_deixistype( fieldvalue.str, fieldvalue.len, rec.deixis);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'aspect',6) = 0 THEN BEGIN
         result := LSSTRTOTYPE_aspecttype( fieldvalue.str, fieldvalue.len, rec.aspect);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'retro',5) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.retro := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.retro := FALSE; result := TRUE 
         END;
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'aktionsarts',11) = 0 THEN BEGIN
         setp := setvalue;
         rec.aktionsarts := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_aktionsarttype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         aktionsarts);
            IF result THEN BEGIN
               rec.aktionsarts := rec.aktionsarts + [aktionsarts];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'superdeixis',11) = 0 THEN BEGIN
         result := LSSTRTOTYPE_deixistype( fieldvalue.str, fieldvalue.len, rec.superdeixis);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'actsubcefs',10) = 0 THEN BEGIN
         setp := setvalue;
         rec.actsubcefs := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_advsubctype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         actsubcefs);
            IF result THEN BEGIN
               rec.actsubcefs := rec.actsubcefs + [actsubcefs];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'Qstatus',7) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.Qstatus := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.Qstatus := FALSE; result := TRUE 
         END;
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'thetaadv',8) = 0 THEN BEGIN
         result := LSSTRTOTYPE_thetaadvtype( fieldvalue.str, fieldvalue.len, rec.thetaadv);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'advpatternefs',13) = 0 THEN BEGIN
         setp := setvalue;
         rec.advpatternefs := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_synpatterntype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         advpatternefs);
            IF result THEN BEGIN
               rec.advpatternefs := rec.advpatternefs + [advpatternefs];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'PROsubject',10) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.PROsubject := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.PROsubject := FALSE; result := TRUE 
         END;
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'mood',4) = 0 THEN BEGIN
         result := LSSTRTOTYPE_xpmoodtype( fieldvalue.str, fieldvalue.len, rec.mood);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'temporal',8) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.temporal := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.temporal := FALSE; result := TRUE 
         END;
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'Radvb',5) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.Radvb := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.Radvb := FALSE; result := TRUE 
         END;
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'thanascompl',11) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.thanascompl := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.thanascompl := FALSE; result := TRUE 
         END;
         END;
      END;
      attr^.Error := (NOT result);
      attr := attr^.NextAttr
   END;
   LSCONVATTR_ADVPPROPVARrecord := result;
END {LSCONVATTR_ADVPPROPVARrecord};

FUNCTION LSCONVATTR_RADVrecord(VAR rec: LSDOMAINT_RADVrecord;
                  VAR pattr: LDCONVREC_pAttrStruct): BOOLEAN;
VAR result : BOOLEAN;
    setp   : LDCONVREC_pSetValueType;
    attr   : LDCONVREC_pAttrStruct;

    req : LSDOMAINT_polaritytype; 
    env : LSDOMAINT_polaritytype; 
BEGIN
   result := TRUE; attr := pattr;
   MAKET_RADVrec(rec);
   WHILE (attr <> NIL) AND result DO BEGIN
   WITH attr^ DO BEGIN
      IF FALSE THEN BEGIN
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                          'KEY', 3) = 0 THEN BEGIN
         result := STR_StrToInteger(fieldvalue.str,
                                 fieldvalue.len, rec.key);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'req',3) = 0 THEN BEGIN
         setp := setvalue;
         rec.req := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_polaritytype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         req);
            IF result THEN BEGIN
               rec.req := rec.req + [req];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'env',3) = 0 THEN BEGIN
         setp := setvalue;
         rec.env := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_polaritytype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         env);
            IF result THEN BEGIN
               rec.env := rec.env + [env];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'mood',4) = 0 THEN BEGIN
         result := LSSTRTOTYPE_xpmoodtype( fieldvalue.str, fieldvalue.len, rec.mood);
         END;
      END;
      attr^.Error := (NOT result);
      attr := attr^.NextAttr
   END;
   LSCONVATTR_RADVrecord := result;
END {LSCONVATTR_RADVrecord};

FUNCTION LSCONVATTR_RADVPrecord(VAR rec: LSDOMAINT_RADVPrecord;
                  VAR pattr: LDCONVREC_pAttrStruct): BOOLEAN;
VAR result : BOOLEAN;
    setp   : LDCONVREC_pSetValueType;
    attr   : LDCONVREC_pAttrStruct;

    req : LSDOMAINT_polaritytype; 
    env : LSDOMAINT_polaritytype; 
    kindefs : LSDOMAINT_kindstype; 
BEGIN
   result := TRUE; attr := pattr;
   MAKET_RADVPrec(rec);
   WHILE (attr <> NIL) AND result DO BEGIN
   WITH attr^ DO BEGIN
      IF FALSE THEN BEGIN
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'req',3) = 0 THEN BEGIN
         setp := setvalue;
         rec.req := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_polaritytype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         req);
            IF result THEN BEGIN
               rec.req := rec.req + [req];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'env',3) = 0 THEN BEGIN
         setp := setvalue;
         rec.env := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_polaritytype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         env);
            IF result THEN BEGIN
               rec.env := rec.env + [env];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'mood',4) = 0 THEN BEGIN
         result := LSSTRTOTYPE_xpmoodtype( fieldvalue.str, fieldvalue.len, rec.mood);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'kindefs',7) = 0 THEN BEGIN
         setp := setvalue;
         rec.kindefs := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_kindstype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         kindefs);
            IF result THEN BEGIN
               rec.kindefs := rec.kindefs + [kindefs];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'radvkey',7) = 0 THEN BEGIN
         result := STR_StrToInteger(fieldvalue.str, fieldvalue.len, rec.radvkey);
         END;
      END;
      attr^.Error := (NOT result);
      attr := attr^.NextAttr
   END;
   LSCONVATTR_RADVPrecord := result;
END {LSCONVATTR_RADVPrecord};

FUNCTION LSCONVATTR_ARTrecord(VAR rec: LSDOMAINT_ARTrecord;
                  VAR pattr: LDCONVREC_pAttrStruct): BOOLEAN;
VAR result : BOOLEAN;
    setp   : LDCONVREC_pSetValueType;
    attr   : LDCONVREC_pAttrStruct;

    possnumbers : LSDOMAINT_numbertype; 
    posscomas : LSDOMAINT_posscomatype; 
BEGIN
   result := TRUE; attr := pattr;
   MAKET_ARTrec(rec);
   WHILE (attr <> NIL) AND result DO BEGIN
   WITH attr^ DO BEGIN
      IF FALSE THEN BEGIN
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                          'KEY', 3) = 0 THEN BEGIN
         result := STR_StrToInteger(fieldvalue.str,
                                 fieldvalue.len, rec.key);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'definite',8) = 0 THEN BEGIN
         result := LSSTRTOTYPE_deftype( fieldvalue.str, fieldvalue.len, rec.definite);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'possnumbers',11) = 0 THEN BEGIN
         setp := setvalue;
         rec.possnumbers := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_numbertype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         possnumbers);
            IF result THEN BEGIN
               rec.possnumbers := rec.possnumbers + [possnumbers];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'posscomas',9) = 0 THEN BEGIN
         setp := setvalue;
         rec.posscomas := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_posscomatype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         posscomas);
            IF result THEN BEGIN
               rec.posscomas := rec.posscomas + [posscomas];
            END;
            setp := setp^.NextValue         END

         END;
      END;
      attr^.Error := (NOT result);
      attr := attr^.NextAttr
   END;
   LSCONVATTR_ARTrecord := result;
END {LSCONVATTR_ARTrecord};

FUNCTION LSCONVATTR_ASPrecord(VAR rec: LSDOMAINT_ASPrecord;
                  VAR pattr: LDCONVREC_pAttrStruct): BOOLEAN;
VAR result : BOOLEAN;
    setp   : LDCONVREC_pSetValueType;
    attr   : LDCONVREC_pAttrStruct;

    req : LSDOMAINT_polaritytype; 
    env : LSDOMAINT_polaritytype; 
BEGIN
   result := TRUE; attr := pattr;
   MAKET_ASPrec(rec);
   WHILE (attr <> NIL) AND result DO BEGIN
   WITH attr^ DO BEGIN
      IF FALSE THEN BEGIN
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'req',3) = 0 THEN BEGIN
         setp := setvalue;
         rec.req := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_polaritytype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         req);
            IF result THEN BEGIN
               rec.req := rec.req + [req];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'env',3) = 0 THEN BEGIN
         setp := setvalue;
         rec.env := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_polaritytype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         env);
            IF result THEN BEGIN
               rec.env := rec.env + [env];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'thanas',6) = 0 THEN BEGIN
         result := LSSTRTOTYPE_thanascompltype( fieldvalue.str, fieldvalue.len, rec.thanas);
         END;
      END;
      attr^.Error := (NOT result);
      attr := attr^.NextAttr
   END;
   LSCONVATTR_ASPrecord := result;
END {LSCONVATTR_ASPrecord};

FUNCTION LSCONVATTR_CARDrecord(VAR rec: LSDOMAINT_CARDrecord;
                  VAR pattr: LDCONVREC_pAttrStruct): BOOLEAN;
VAR result : BOOLEAN;
    setp   : LDCONVREC_pSetValueType;
    attr   : LDCONVREC_pAttrStruct;

    possnumbers : LSDOMAINT_numbertype; 
BEGIN
   result := TRUE; attr := pattr;
   MAKET_CARDrec(rec);
   WHILE (attr <> NIL) AND result DO BEGIN
   WITH attr^ DO BEGIN
      IF FALSE THEN BEGIN
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'possnumbers',11) = 0 THEN BEGIN
         setp := setvalue;
         rec.possnumbers := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_numbertype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         possnumbers);
            IF result THEN BEGIN
               rec.possnumbers := rec.possnumbers + [possnumbers];
            END;
            setp := setp^.NextValue         END

         END;
      END;
      attr^.Error := (NOT result);
      attr := attr^.NextAttr
   END;
   LSCONVATTR_CARDrecord := result;
END {LSCONVATTR_CARDrecord};

FUNCTION LSCONVATTR_CLAUSErecord(VAR rec: LSDOMAINT_CLAUSErecord;
                  VAR pattr: LDCONVREC_pAttrStruct): BOOLEAN;
VAR result : BOOLEAN;
    setp   : LDCONVREC_pSetValueType;
    attr   : LDCONVREC_pAttrStruct;

    req : LSDOMAINT_polaritytype; 
    env : LSDOMAINT_polaritytype; 
    synvpefs : LSDOMAINT_synpatterntype; 
    adjuncts : LSDOMAINT_adjuncttype; 
    aktionsarts : LSDOMAINT_aktionsarttype; 
BEGIN
   result := TRUE; attr := pattr;
   MAKET_CLAUSErec(rec);
   WHILE (attr <> NIL) AND result DO BEGIN
   WITH attr^ DO BEGIN
      IF FALSE THEN BEGIN
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'req',3) = 0 THEN BEGIN
         setp := setvalue;
         rec.req := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_polaritytype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         req);
            IF result THEN BEGIN
               rec.req := rec.req + [req];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'env',3) = 0 THEN BEGIN
         setp := setvalue;
         rec.env := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_polaritytype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         env);
            IF result THEN BEGIN
               rec.env := rec.env + [env];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'voice',5) = 0 THEN BEGIN
         result := LSSTRTOTYPE_voicetype( fieldvalue.str, fieldvalue.len, rec.voice);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'PROsubject',10) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.PROsubject := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.PROsubject := FALSE; result := TRUE 
         END;
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'synvpefs',8) = 0 THEN BEGIN
         setp := setvalue;
         rec.synvpefs := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_synpatterntype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         synvpefs);
            IF result THEN BEGIN
               rec.synvpefs := rec.synvpefs + [synvpefs];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'thetavp',7) = 0 THEN BEGIN
         result := LSSTRTOTYPE_thetavptype( fieldvalue.str, fieldvalue.len, rec.thetavp);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'adjuncts',8) = 0 THEN BEGIN
         setp := setvalue;
         rec.adjuncts := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_adjuncttype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         adjuncts);
            IF result THEN BEGIN
               rec.adjuncts := rec.adjuncts + [adjuncts];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'modus',5) = 0 THEN BEGIN
         result := LSSTRTOTYPE_modustype( fieldvalue.str, fieldvalue.len, rec.modus);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'aktionsarts',11) = 0 THEN BEGIN
         setp := setvalue;
         rec.aktionsarts := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_aktionsarttype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         aktionsarts);
            IF result THEN BEGIN
               rec.aktionsarts := rec.aktionsarts + [aktionsarts];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'aspect',6) = 0 THEN BEGIN
         result := LSSTRTOTYPE_aspecttype( fieldvalue.str, fieldvalue.len, rec.aspect);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'deixis',6) = 0 THEN BEGIN
         result := LSSTRTOTYPE_deixistype( fieldvalue.str, fieldvalue.len, rec.deixis);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'retro',5) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.retro := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.retro := FALSE; result := TRUE 
         END;
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'finiteness',10) = 0 THEN BEGIN
         result := LSSTRTOTYPE_finitenesstype( fieldvalue.str, fieldvalue.len, rec.finiteness);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'infsort',7) = 0 THEN BEGIN
         result := LSSTRTOTYPE_inftype( fieldvalue.str, fieldvalue.len, rec.infsort);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'superdeixis',11) = 0 THEN BEGIN
         result := LSSTRTOTYPE_deixistype( fieldvalue.str, fieldvalue.len, rec.superdeixis);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'VRcompl',7) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.VRcompl := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.VRcompl := FALSE; result := TRUE 
         END;
         END;
      END;
      attr^.Error := (NOT result);
      attr := attr^.NextAttr
   END;
   LSCONVATTR_CLAUSErecord := result;
END {LSCONVATTR_CLAUSErecord};

FUNCTION LSCONVATTR_CLAUSEVARrecord(VAR rec: LSDOMAINT_CLAUSEVARrecord;
                  VAR pattr: LDCONVREC_pAttrStruct): BOOLEAN;
VAR result : BOOLEAN;
    setp   : LDCONVREC_pSetValueType;
    attr   : LDCONVREC_pAttrStruct;

    req : LSDOMAINT_polaritytype; 
    env : LSDOMAINT_polaritytype; 
    synvpefs : LSDOMAINT_synpatterntype; 
    adjuncts : LSDOMAINT_adjuncttype; 
    aktionsarts : LSDOMAINT_aktionsarttype; 
BEGIN
   result := TRUE; attr := pattr;
   MAKET_CLAUSEVARrec(rec);
   WHILE (attr <> NIL) AND result DO BEGIN
   WITH attr^ DO BEGIN
      IF FALSE THEN BEGIN
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'req',3) = 0 THEN BEGIN
         setp := setvalue;
         rec.req := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_polaritytype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         req);
            IF result THEN BEGIN
               rec.req := rec.req + [req];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'env',3) = 0 THEN BEGIN
         setp := setvalue;
         rec.env := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_polaritytype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         env);
            IF result THEN BEGIN
               rec.env := rec.env + [env];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'voice',5) = 0 THEN BEGIN
         result := LSSTRTOTYPE_voicetype( fieldvalue.str, fieldvalue.len, rec.voice);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'PROsubject',10) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.PROsubject := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.PROsubject := FALSE; result := TRUE 
         END;
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'synvpefs',8) = 0 THEN BEGIN
         setp := setvalue;
         rec.synvpefs := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_synpatterntype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         synvpefs);
            IF result THEN BEGIN
               rec.synvpefs := rec.synvpefs + [synvpefs];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'thetavp',7) = 0 THEN BEGIN
         result := LSSTRTOTYPE_thetavptype( fieldvalue.str, fieldvalue.len, rec.thetavp);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'adjuncts',8) = 0 THEN BEGIN
         setp := setvalue;
         rec.adjuncts := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_adjuncttype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         adjuncts);
            IF result THEN BEGIN
               rec.adjuncts := rec.adjuncts + [adjuncts];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'modus',5) = 0 THEN BEGIN
         result := LSSTRTOTYPE_modustype( fieldvalue.str, fieldvalue.len, rec.modus);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'aktionsarts',11) = 0 THEN BEGIN
         setp := setvalue;
         rec.aktionsarts := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_aktionsarttype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         aktionsarts);
            IF result THEN BEGIN
               rec.aktionsarts := rec.aktionsarts + [aktionsarts];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'aspect',6) = 0 THEN BEGIN
         result := LSSTRTOTYPE_aspecttype( fieldvalue.str, fieldvalue.len, rec.aspect);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'deixis',6) = 0 THEN BEGIN
         result := LSSTRTOTYPE_deixistype( fieldvalue.str, fieldvalue.len, rec.deixis);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'retro',5) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.retro := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.retro := FALSE; result := TRUE 
         END;
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'finiteness',10) = 0 THEN BEGIN
         result := LSSTRTOTYPE_finitenesstype( fieldvalue.str, fieldvalue.len, rec.finiteness);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'infsort',7) = 0 THEN BEGIN
         result := LSSTRTOTYPE_inftype( fieldvalue.str, fieldvalue.len, rec.infsort);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'superdeixis',11) = 0 THEN BEGIN
         result := LSSTRTOTYPE_deixistype( fieldvalue.str, fieldvalue.len, rec.superdeixis);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'VRcompl',7) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.VRcompl := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.VRcompl := FALSE; result := TRUE 
         END;
         END;
      END;
      attr^.Error := (NOT result);
      attr := attr^.NextAttr
   END;
   LSCONVATTR_CLAUSEVARrecord := result;
END {LSCONVATTR_CLAUSEVARrecord};

FUNCTION LSCONVATTR_CONJrecord(VAR rec: LSDOMAINT_CONJrecord;
                  VAR pattr: LDCONVREC_pAttrStruct): BOOLEAN;
VAR result : BOOLEAN;
    setp   : LDCONVREC_pSetValueType;
    attr   : LDCONVREC_pAttrStruct;

    req : LSDOMAINT_polaritytype; 
    env : LSDOMAINT_polaritytype; 
    conjpatterns : LSDOMAINT_synpatterntype; 
    distri : LSDOMAINT_distritype; 
BEGIN
   result := TRUE; attr := pattr;
   MAKET_CONJrec(rec);
   WHILE (attr <> NIL) AND result DO BEGIN
   WITH attr^ DO BEGIN
      IF FALSE THEN BEGIN
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                          'KEY', 3) = 0 THEN BEGIN
         result := STR_StrToInteger(fieldvalue.str,
                                 fieldvalue.len, rec.key);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'req',3) = 0 THEN BEGIN
         setp := setvalue;
         rec.req := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_polaritytype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         req);
            IF result THEN BEGIN
               rec.req := rec.req + [req];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'env',3) = 0 THEN BEGIN
         setp := setvalue;
         rec.env := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_polaritytype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         env);
            IF result THEN BEGIN
               rec.env := rec.env + [env];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'class',5) = 0 THEN BEGIN
         result := LSSTRTOTYPE_timeadvclasstype( fieldvalue.str, fieldvalue.len, rec.class);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'deixis',6) = 0 THEN BEGIN
         result := LSSTRTOTYPE_deixistype( fieldvalue.str, fieldvalue.len, rec.deixis);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'aspect',6) = 0 THEN BEGIN
         result := LSSTRTOTYPE_aspecttype( fieldvalue.str, fieldvalue.len, rec.aspect);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'retro',5) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.retro := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.retro := FALSE; result := TRUE 
         END;
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'conjpatterns',12) = 0 THEN BEGIN
         setp := setvalue;
         rec.conjpatterns := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_synpatterntype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         conjpatterns);
            IF result THEN BEGIN
               rec.conjpatterns := rec.conjpatterns + [conjpatterns];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'adverbial',9) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.adverbial := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.adverbial := FALSE; result := TRUE 
         END;
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'temporal',8) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.temporal := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.temporal := FALSE; result := TRUE 
         END;
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'distri',6) = 0 THEN BEGIN
         setp := setvalue;
         rec.distri := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_distritype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         distri);
            IF result THEN BEGIN
               rec.distri := rec.distri + [distri];
            END;
            setp := setp^.NextValue         END

         END;
      END;
      attr^.Error := (NOT result);
      attr := attr^.NextAttr
   END;
   LSCONVATTR_CONJrecord := result;
END {LSCONVATTR_CONJrecord};

FUNCTION LSCONVATTR_COORDrecord(VAR rec: LSDOMAINT_COORDrecord;
                  VAR pattr: LDCONVREC_pAttrStruct): BOOLEAN;
VAR result : BOOLEAN;
    setp   : LDCONVREC_pSetValueType;
    attr   : LDCONVREC_pAttrStruct;

    kinds : LSDOMAINT_coordkindtype; 
    patterns : LSDOMAINT_coordpatterntype; 
    inducednumbers : LSDOMAINT_numbertype; 
    req : LSDOMAINT_polaritytype; 
    env : LSDOMAINT_polaritytype; 
BEGIN
   result := TRUE; attr := pattr;
   MAKET_COORDrec(rec);
   WHILE (attr <> NIL) AND result DO BEGIN
   WITH attr^ DO BEGIN
      IF FALSE THEN BEGIN
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                          'KEY', 3) = 0 THEN BEGIN
         result := STR_StrToInteger(fieldvalue.str,
                                 fieldvalue.len, rec.key);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'kinds',5) = 0 THEN BEGIN
         setp := setvalue;
         rec.kinds := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_coordkindtype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         kinds);
            IF result THEN BEGIN
               rec.kinds := rec.kinds + [kinds];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'iteration',9) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.iteration := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.iteration := FALSE; result := TRUE 
         END;
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'correlative2key',15) = 0 THEN BEGIN
         result := STR_StrToInteger(fieldvalue.str, fieldvalue.len, rec.correlative2key);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'patterns',8) = 0 THEN BEGIN
         setp := setvalue;
         rec.patterns := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_coordpatterntype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         patterns);
            IF result THEN BEGIN
               rec.patterns := rec.patterns + [patterns];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'inducednumbers',14) = 0 THEN BEGIN
         setp := setvalue;
         rec.inducednumbers := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_numbertype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         inducednumbers);
            IF result THEN BEGIN
               rec.inducednumbers := rec.inducednumbers + [inducednumbers];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'Sintroducer',11) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.Sintroducer := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.Sintroducer := FALSE; result := TRUE 
         END;
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'req',3) = 0 THEN BEGIN
         setp := setvalue;
         rec.req := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_polaritytype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         req);
            IF result THEN BEGIN
               rec.req := rec.req + [req];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'env',3) = 0 THEN BEGIN
         setp := setvalue;
         rec.env := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_polaritytype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         env);
            IF result THEN BEGIN
               rec.env := rec.env + [env];
            END;
            setp := setp^.NextValue         END

         END;
      END;
      attr^.Error := (NOT result);
      attr := attr^.NextAttr
   END;
   LSCONVATTR_COORDrecord := result;
END {LSCONVATTR_COORDrecord};

FUNCTION LSCONVATTR_DEMADJrecord(VAR rec: LSDOMAINT_DEMADJrecord;
                  VAR pattr: LDCONVREC_pAttrStruct): BOOLEAN;
VAR result : BOOLEAN;
    setp   : LDCONVREC_pSetValueType;
    attr   : LDCONVREC_pAttrStruct;

BEGIN
   result := TRUE; attr := pattr;
   MAKET_DEMADJrec(rec);
   WHILE (attr <> NIL) AND result DO BEGIN
   WITH attr^ DO BEGIN
      IF FALSE THEN BEGIN
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                          'KEY', 3) = 0 THEN BEGIN
         result := STR_StrToInteger(fieldvalue.str,
                                 fieldvalue.len, rec.key);
         END;
      END;
      attr^.Error := (NOT result);
      attr := attr^.NextAttr
   END;
   LSCONVATTR_DEMADJrecord := result;
END {LSCONVATTR_DEMADJrecord};

FUNCTION LSCONVATTR_DEMPROrecord(VAR rec: LSDOMAINT_DEMPROrecord;
                  VAR pattr: LDCONVREC_pAttrStruct): BOOLEAN;
VAR result : BOOLEAN;
    setp   : LDCONVREC_pSetValueType;
    attr   : LDCONVREC_pAttrStruct;

    sexes : LSDOMAINT_sextype; 
BEGIN
   result := TRUE; attr := pattr;
   MAKET_DEMPROrec(rec);
   WHILE (attr <> NIL) AND result DO BEGIN
   WITH attr^ DO BEGIN
      IF FALSE THEN BEGIN
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                          'KEY', 3) = 0 THEN BEGIN
         result := STR_StrToInteger(fieldvalue.str,
                                 fieldvalue.len, rec.key);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'sexes',5) = 0 THEN BEGIN
         setp := setvalue;
         rec.sexes := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_sextype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         sexes);
            IF result THEN BEGIN
               rec.sexes := rec.sexes + [sexes];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'number',6) = 0 THEN BEGIN
         result := LSSTRTOTYPE_numbertype( fieldvalue.str, fieldvalue.len, rec.number);
         END;
      END;
      attr^.Error := (NOT result);
      attr := attr^.NextAttr
   END;
   LSCONVATTR_DEMPROrecord := result;
END {LSCONVATTR_DEMPROrecord};

FUNCTION LSCONVATTR_BDETrecord(VAR rec: LSDOMAINT_BDETrecord;
                  VAR pattr: LDCONVREC_pAttrStruct): BOOLEAN;
VAR result : BOOLEAN;
    setp   : LDCONVREC_pSetValueType;
    attr   : LDCONVREC_pAttrStruct;

    req : LSDOMAINT_polaritytype; 
    env : LSDOMAINT_polaritytype; 
    possnumbers : LSDOMAINT_numbertype; 
    posscomas : LSDOMAINT_posscomatype; 
BEGIN
   result := TRUE; attr := pattr;
   MAKET_BDETrec(rec);
   WHILE (attr <> NIL) AND result DO BEGIN
   WITH attr^ DO BEGIN
      IF FALSE THEN BEGIN
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                          'KEY', 3) = 0 THEN BEGIN
         result := STR_StrToInteger(fieldvalue.str,
                                 fieldvalue.len, rec.key);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'req',3) = 0 THEN BEGIN
         setp := setvalue;
         rec.req := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_polaritytype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         req);
            IF result THEN BEGIN
               rec.req := rec.req + [req];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'env',3) = 0 THEN BEGIN
         setp := setvalue;
         rec.env := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_polaritytype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         env);
            IF result THEN BEGIN
               rec.env := rec.env + [env];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'possnietnp',10) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.possnietnp := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.possnietnp := FALSE; result := TRUE 
         END;
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'definite',8) = 0 THEN BEGIN
         result := LSSTRTOTYPE_deftype( fieldvalue.str, fieldvalue.len, rec.definite);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'posspred',8) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.posspred := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.posspred := FALSE; result := TRUE 
         END;
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'possnumbers',11) = 0 THEN BEGIN
         setp := setvalue;
         rec.possnumbers := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_numbertype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         possnumbers);
            IF result THEN BEGIN
               rec.possnumbers := rec.possnumbers + [possnumbers];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'posscomas',9) = 0 THEN BEGIN
         setp := setvalue;
         rec.posscomas := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_posscomatype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         posscomas);
            IF result THEN BEGIN
               rec.posscomas := rec.posscomas + [posscomas];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'mood',4) = 0 THEN BEGIN
         result := LSSTRTOTYPE_xpmoodtype( fieldvalue.str, fieldvalue.len, rec.mood);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'eFormation',10) = 0 THEN BEGIN
         result := LSSTRTOTYPE_eformationtype( fieldvalue.str, fieldvalue.len, rec.eFormation);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'enFormation',11) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.enFormation := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.enFormation := FALSE; result := TRUE 
         END;
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'syntquant',9) = 0 THEN BEGIN
         result := LSSTRTOTYPE_syntquanttype( fieldvalue.str, fieldvalue.len, rec.syntquant);
         END;
      END;
      attr^.Error := (NOT result);
      attr := attr^.NextAttr
   END;
   LSCONVATTR_BDETrecord := result;
END {LSCONVATTR_BDETrecord};

FUNCTION LSCONVATTR_DETrecord(VAR rec: LSDOMAINT_DETrecord;
                  VAR pattr: LDCONVREC_pAttrStruct): BOOLEAN;
VAR result : BOOLEAN;
    setp   : LDCONVREC_pSetValueType;
    attr   : LDCONVREC_pAttrStruct;

    req : LSDOMAINT_polaritytype; 
    env : LSDOMAINT_polaritytype; 
    possnumbers : LSDOMAINT_numbertype; 
    posscomas : LSDOMAINT_posscomatype; 
BEGIN
   result := TRUE; attr := pattr;
   MAKET_ALLODETrec(rec);
   WHILE (attr <> NIL) AND result DO BEGIN
   WITH attr^ DO BEGIN
      IF FALSE THEN BEGIN
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'req',3) = 0 THEN BEGIN
         setp := setvalue;
         rec.req := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_polaritytype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         req);
            IF result THEN BEGIN
               rec.req := rec.req + [req];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'env',3) = 0 THEN BEGIN
         setp := setvalue;
         rec.env := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_polaritytype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         env);
            IF result THEN BEGIN
               rec.env := rec.env + [env];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'possnietnp',10) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.possnietnp := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.possnietnp := FALSE; result := TRUE 
         END;
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'definite',8) = 0 THEN BEGIN
         result := LSSTRTOTYPE_deftype( fieldvalue.str, fieldvalue.len, rec.definite);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'posspred',8) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.posspred := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.posspred := FALSE; result := TRUE 
         END;
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'possnumbers',11) = 0 THEN BEGIN
         setp := setvalue;
         rec.possnumbers := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_numbertype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         possnumbers);
            IF result THEN BEGIN
               rec.possnumbers := rec.possnumbers + [possnumbers];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'posscomas',9) = 0 THEN BEGIN
         setp := setvalue;
         rec.posscomas := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_posscomatype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         posscomas);
            IF result THEN BEGIN
               rec.posscomas := rec.posscomas + [posscomas];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'mood',4) = 0 THEN BEGIN
         result := LSSTRTOTYPE_xpmoodtype( fieldvalue.str, fieldvalue.len, rec.mood);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'eFormation',10) = 0 THEN BEGIN
         result := LSSTRTOTYPE_eformationtype( fieldvalue.str, fieldvalue.len, rec.eFormation);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'enFormation',11) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.enFormation := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.enFormation := FALSE; result := TRUE 
         END;
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'eORenForm',9) = 0 THEN BEGIN
         result := LSSTRTOTYPE_eorenformtype( fieldvalue.str, fieldvalue.len, rec.eORenForm);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'syntquant',9) = 0 THEN BEGIN
         result := LSSTRTOTYPE_syntquanttype( fieldvalue.str, fieldvalue.len, rec.syntquant);
         END;
      END;
      attr^.Error := (NOT result);
      attr := attr^.NextAttr
   END;
   LSCONVATTR_DETrecord := result;
END {LSCONVATTR_DETrecord};

FUNCTION LSCONVATTR_DETPrecord(VAR rec: LSDOMAINT_DETPrecord;
                  VAR pattr: LDCONVREC_pAttrStruct): BOOLEAN;
VAR result : BOOLEAN;
    setp   : LDCONVREC_pSetValueType;
    attr   : LDCONVREC_pAttrStruct;

    req : LSDOMAINT_polaritytype; 
    env : LSDOMAINT_polaritytype; 
    possnumbers : LSDOMAINT_numbertype; 
    posscomas : LSDOMAINT_posscomatype; 
    possgenders : LSDOMAINT_gendertype; 
BEGIN
   result := TRUE; attr := pattr;
   MAKET_DETPrec(rec);
   WHILE (attr <> NIL) AND result DO BEGIN
   WITH attr^ DO BEGIN
      IF FALSE THEN BEGIN
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'req',3) = 0 THEN BEGIN
         setp := setvalue;
         rec.req := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_polaritytype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         req);
            IF result THEN BEGIN
               rec.req := rec.req + [req];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'env',3) = 0 THEN BEGIN
         setp := setvalue;
         rec.env := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_polaritytype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         env);
            IF result THEN BEGIN
               rec.env := rec.env + [env];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'possnietnp',10) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.possnietnp := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.possnietnp := FALSE; result := TRUE 
         END;
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'definite',8) = 0 THEN BEGIN
         result := LSSTRTOTYPE_deftype( fieldvalue.str, fieldvalue.len, rec.definite);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'posspred',8) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.posspred := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.posspred := FALSE; result := TRUE 
         END;
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'possnumbers',11) = 0 THEN BEGIN
         setp := setvalue;
         rec.possnumbers := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_numbertype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         possnumbers);
            IF result THEN BEGIN
               rec.possnumbers := rec.possnumbers + [possnumbers];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'posscomas',9) = 0 THEN BEGIN
         setp := setvalue;
         rec.posscomas := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_posscomatype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         posscomas);
            IF result THEN BEGIN
               rec.posscomas := rec.posscomas + [posscomas];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'mood',4) = 0 THEN BEGIN
         result := LSSTRTOTYPE_xpmoodtype( fieldvalue.str, fieldvalue.len, rec.mood);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'eORenForm',9) = 0 THEN BEGIN
         result := LSSTRTOTYPE_eorenformtype( fieldvalue.str, fieldvalue.len, rec.eORenForm);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'syntquant',9) = 0 THEN BEGIN
         result := LSSTRTOTYPE_syntquanttype( fieldvalue.str, fieldvalue.len, rec.syntquant);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'possgenders',11) = 0 THEN BEGIN
         setp := setvalue;
         rec.possgenders := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_gendertype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         possgenders);
            IF result THEN BEGIN
               rec.possgenders := rec.possgenders + [possgenders];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'superdeixis',11) = 0 THEN BEGIN
         result := LSSTRTOTYPE_deixistype( fieldvalue.str, fieldvalue.len, rec.superdeixis);
         END;
      END;
      attr^.Error := (NOT result);
      attr := attr^.NextAttr
   END;
   LSCONVATTR_DETPrecord := result;
END {LSCONVATTR_DETPrecord};

FUNCTION LSCONVATTR_DIGITrecord(VAR rec: LSDOMAINT_DIGITrecord;
                  VAR pattr: LDCONVREC_pAttrStruct): BOOLEAN;
VAR result : BOOLEAN;
    setp   : LDCONVREC_pSetValueType;
    attr   : LDCONVREC_pAttrStruct;

BEGIN
   result := TRUE; attr := pattr;
   MAKET_DIGITrec(rec);
   WHILE (attr <> NIL) AND result DO BEGIN
   WITH attr^ DO BEGIN
      IF FALSE THEN BEGIN
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                          'KEY', 3) = 0 THEN BEGIN
         result := STR_StrToInteger(fieldvalue.str,
                                 fieldvalue.len, rec.key);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'valeu',5) = 0 THEN BEGIN
         result := LSSTRTOTYPE_valuetype( fieldvalue.str, fieldvalue.len, rec.valeu);
         END;
      END;
      attr^.Error := (NOT result);
      attr := attr^.NextAttr
   END;
   LSCONVATTR_DIGITrecord := result;
END {LSCONVATTR_DIGITrecord};

FUNCTION LSCONVATTR_EMPTYrecord(VAR rec: LSDOMAINT_EMPTYrecord;
                  VAR pattr: LDCONVREC_pAttrStruct): BOOLEAN;
VAR result : BOOLEAN;
    setp   : LDCONVREC_pSetValueType;
    attr   : LDCONVREC_pAttrStruct;

BEGIN
   result := TRUE; attr := pattr;
   MAKET_EMPTYrec(rec);
   WHILE (attr <> NIL) AND result DO BEGIN
   WITH attr^ DO BEGIN
      IF FALSE THEN BEGIN
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                          'KEY', 3) = 0 THEN BEGIN
         result := STR_StrToInteger(fieldvalue.str,
                                 fieldvalue.len, rec.key);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'person',6) = 0 THEN BEGIN
         result := LSSTRTOTYPE_persontype( fieldvalue.str, fieldvalue.len, rec.person);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'number',6) = 0 THEN BEGIN
         result := LSSTRTOTYPE_numbertype( fieldvalue.str, fieldvalue.len, rec.number);
         END;
      END;
      attr^.Error := (NOT result);
      attr := attr^.NextAttr
   END;
   LSCONVATTR_EMPTYrecord := result;
END {LSCONVATTR_EMPTYrecord};

FUNCTION LSCONVATTR_EMPTYVARrecord(VAR rec: LSDOMAINT_EMPTYVARrecord;
                  VAR pattr: LDCONVREC_pAttrStruct): BOOLEAN;
VAR result : BOOLEAN;
    setp   : LDCONVREC_pSetValueType;
    attr   : LDCONVREC_pAttrStruct;

BEGIN
   result := TRUE; attr := pattr;
   MAKET_EMPTYVARrec(rec);
   WHILE (attr <> NIL) AND result DO BEGIN
   WITH attr^ DO BEGIN
      IF FALSE THEN BEGIN
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'person',6) = 0 THEN BEGIN
         result := LSSTRTOTYPE_persontype( fieldvalue.str, fieldvalue.len, rec.person);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'number',6) = 0 THEN BEGIN
         result := LSSTRTOTYPE_numbertype( fieldvalue.str, fieldvalue.len, rec.number);
         END;
      END;
      attr^.Error := (NOT result);
      attr := attr^.NextAttr
   END;
   LSCONVATTR_EMPTYVARrecord := result;
END {LSCONVATTR_EMPTYVARrecord};

FUNCTION LSCONVATTR_ECrecord(VAR rec: LSDOMAINT_ECrecord;
                  VAR pattr: LDCONVREC_pAttrStruct): BOOLEAN;
VAR result : BOOLEAN;
    setp   : LDCONVREC_pSetValueType;
    attr   : LDCONVREC_pAttrStruct;

BEGIN
   result := TRUE; attr := pattr;
   MAKET_ECrec(rec);
   WHILE (attr <> NIL) AND result DO BEGIN
   WITH attr^ DO BEGIN
      IF FALSE THEN BEGIN
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                          'KEY', 3) = 0 THEN BEGIN
         result := STR_StrToInteger(fieldvalue.str,
                                 fieldvalue.len, rec.key);
         END;
      END;
      attr^.Error := (NOT result);
      attr := attr^.NextAttr
   END;
   LSCONVATTR_ECrecord := result;
END {LSCONVATTR_ECrecord};

FUNCTION LSCONVATTR_ENrecord(VAR rec: LSDOMAINT_ENrecord;
                  VAR pattr: LDCONVREC_pAttrStruct): BOOLEAN;
VAR result : BOOLEAN;
    setp   : LDCONVREC_pSetValueType;
    attr   : LDCONVREC_pAttrStruct;

BEGIN
   result := TRUE; attr := pattr;
   MAKET_ENrec(rec);
   WHILE (attr <> NIL) AND result DO BEGIN
   WITH attr^ DO BEGIN
      IF FALSE THEN BEGIN
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                          'KEY', 3) = 0 THEN BEGIN
         result := STR_StrToInteger(fieldvalue.str,
                                 fieldvalue.len, rec.key);
         END;
      END;
      attr^.Error := (NOT result);
      attr := attr^.NextAttr
   END;
   LSCONVATTR_ENrecord := result;
END {LSCONVATTR_ENrecord};

FUNCTION LSCONVATTR_EXCLAMrecord(VAR rec: LSDOMAINT_EXCLAMrecord;
                  VAR pattr: LDCONVREC_pAttrStruct): BOOLEAN;
VAR result : BOOLEAN;
    setp   : LDCONVREC_pSetValueType;
    attr   : LDCONVREC_pAttrStruct;

BEGIN
   result := TRUE; attr := pattr;
   MAKET_EXCLAMrec(rec);
   WHILE (attr <> NIL) AND result DO BEGIN
   WITH attr^ DO BEGIN
      IF FALSE THEN BEGIN
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                          'KEY', 3) = 0 THEN BEGIN
         result := STR_StrToInteger(fieldvalue.str,
                                 fieldvalue.len, rec.key);
         END;
      END;
      attr^.Error := (NOT result);
      attr := attr^.NextAttr
   END;
   LSCONVATTR_EXCLAMrecord := result;
END {LSCONVATTR_EXCLAMrecord};

FUNCTION LSCONVATTR_BINDEFPROrecord(VAR rec: LSDOMAINT_BINDEFPROrecord;
                  VAR pattr: LDCONVREC_pAttrStruct): BOOLEAN;
VAR result : BOOLEAN;
    setp   : LDCONVREC_pSetValueType;
    attr   : LDCONVREC_pAttrStruct;

    req : LSDOMAINT_polaritytype; 
    env : LSDOMAINT_polaritytype; 
BEGIN
   result := TRUE; attr := pattr;
   MAKET_BINDEFPROrec(rec);
   WHILE (attr <> NIL) AND result DO BEGIN
   WITH attr^ DO BEGIN
      IF FALSE THEN BEGIN
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                          'KEY', 3) = 0 THEN BEGIN
         result := STR_StrToInteger(fieldvalue.str,
                                 fieldvalue.len, rec.key);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'req',3) = 0 THEN BEGIN
         setp := setvalue;
         rec.req := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_polaritytype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         req);
            IF result THEN BEGIN
               rec.req := rec.req + [req];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'env',3) = 0 THEN BEGIN
         setp := setvalue;
         rec.env := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_polaritytype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         env);
            IF result THEN BEGIN
               rec.env := rec.env + [env];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'definite',8) = 0 THEN BEGIN
         result := LSSTRTOTYPE_deftype( fieldvalue.str, fieldvalue.len, rec.definite);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'number',6) = 0 THEN BEGIN
         result := LSSTRTOTYPE_numbertype( fieldvalue.str, fieldvalue.len, rec.number);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'possgeni',8) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.possgeni := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.possgeni := FALSE; result := TRUE 
         END;
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'possnietNP',10) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.possnietNP := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.possnietNP := FALSE; result := TRUE 
         END;
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'syntquant',9) = 0 THEN BEGIN
         result := LSSTRTOTYPE_syntquanttype( fieldvalue.str, fieldvalue.len, rec.syntquant);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'animate',7) = 0 THEN BEGIN
         result := LSSTRTOTYPE_animatetype( fieldvalue.str, fieldvalue.len, rec.animate);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'possRform',9) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.possRform := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.possRform := FALSE; result := TRUE 
         END;
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'NPhead',6) = 0 THEN BEGIN
         result := LSSTRTOTYPE_npheadtype( fieldvalue.str, fieldvalue.len, rec.NPhead);
         END;
      END;
      attr^.Error := (NOT result);
      attr := attr^.NextAttr
   END;
   LSCONVATTR_BINDEFPROrecord := result;
END {LSCONVATTR_BINDEFPROrecord};

FUNCTION LSCONVATTR_INDEFPROrecord(VAR rec: LSDOMAINT_INDEFPROrecord;
                  VAR pattr: LDCONVREC_pAttrStruct): BOOLEAN;
VAR result : BOOLEAN;
    setp   : LDCONVREC_pSetValueType;
    attr   : LDCONVREC_pAttrStruct;

    req : LSDOMAINT_polaritytype; 
    env : LSDOMAINT_polaritytype; 
BEGIN
   result := TRUE; attr := pattr;
   MAKET_INDEFPROrec(rec);
   WHILE (attr <> NIL) AND result DO BEGIN
   WITH attr^ DO BEGIN
      IF FALSE THEN BEGIN
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'req',3) = 0 THEN BEGIN
         setp := setvalue;
         rec.req := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_polaritytype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         req);
            IF result THEN BEGIN
               rec.req := rec.req + [req];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'env',3) = 0 THEN BEGIN
         setp := setvalue;
         rec.env := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_polaritytype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         env);
            IF result THEN BEGIN
               rec.env := rec.env + [env];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'definite',8) = 0 THEN BEGIN
         result := LSSTRTOTYPE_deftype( fieldvalue.str, fieldvalue.len, rec.definite);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'number',6) = 0 THEN BEGIN
         result := LSSTRTOTYPE_numbertype( fieldvalue.str, fieldvalue.len, rec.number);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'possgeni',8) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.possgeni := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.possgeni := FALSE; result := TRUE 
         END;
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'possnietNP',10) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.possnietNP := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.possnietNP := FALSE; result := TRUE 
         END;
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'syntquant',9) = 0 THEN BEGIN
         result := LSSTRTOTYPE_syntquanttype( fieldvalue.str, fieldvalue.len, rec.syntquant);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'animate',7) = 0 THEN BEGIN
         result := LSSTRTOTYPE_animatetype( fieldvalue.str, fieldvalue.len, rec.animate);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'possRform',9) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.possRform := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.possRform := FALSE; result := TRUE 
         END;
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'geni',4) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.geni := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.geni := FALSE; result := TRUE 
         END;
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'NPhead',6) = 0 THEN BEGIN
         result := LSSTRTOTYPE_npheadtype( fieldvalue.str, fieldvalue.len, rec.NPhead);
         END;
      END;
      attr^.Error := (NOT result);
      attr := attr^.NextAttr
   END;
   LSCONVATTR_INDEFPROrecord := result;
END {LSCONVATTR_INDEFPROrecord};

FUNCTION LSCONVATTR_NEGrecord(VAR rec: LSDOMAINT_NEGrecord;
                  VAR pattr: LDCONVREC_pAttrStruct): BOOLEAN;
VAR result : BOOLEAN;
    setp   : LDCONVREC_pSetValueType;
    attr   : LDCONVREC_pAttrStruct;

BEGIN
   result := TRUE; attr := pattr;
   MAKET_NEGVARrec(rec);
   WHILE (attr <> NIL) AND result DO BEGIN
   WITH attr^ DO BEGIN
      IF FALSE THEN BEGIN
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                          'KEY', 3) = 0 THEN BEGIN
         result := STR_StrToInteger(fieldvalue.str,
                                 fieldvalue.len, rec.key);
         END;
      END;
      attr^.Error := (NOT result);
      attr := attr^.NextAttr
   END;
   LSCONVATTR_NEGrecord := result;
END {LSCONVATTR_NEGrecord};

FUNCTION LSCONVATTR_BNOUNrecord(VAR rec: LSDOMAINT_BNOUNrecord;
                  VAR pattr: LDCONVREC_pAttrStruct): BOOLEAN;
VAR result : BOOLEAN;
    setp   : LDCONVREC_pSetValueType;
    attr   : LDCONVREC_pAttrStruct;

    req : LSDOMAINT_polaritytype; 
    env : LSDOMAINT_polaritytype; 
    dimforms : LSDOMAINT_dimformtype; 
    pluralforms : LSDOMAINT_pluralformtype; 
    genders : LSDOMAINT_gendertype; 
    sexes : LSDOMAINT_sextype; 
    subcs : LSDOMAINT_nounsubctype; 
    posscomas : LSDOMAINT_posscomatype; 
    nounpatterns : LSDOMAINT_synpatterntype; 
BEGIN
   result := TRUE; attr := pattr;
   MAKET_BNOUNrec(rec);
   WHILE (attr <> NIL) AND result DO BEGIN
   WITH attr^ DO BEGIN
      IF FALSE THEN BEGIN
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                          'KEY', 3) = 0 THEN BEGIN
         result := STR_StrToInteger(fieldvalue.str,
                                 fieldvalue.len, rec.key);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'req',3) = 0 THEN BEGIN
         setp := setvalue;
         rec.req := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_polaritytype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         req);
            IF result THEN BEGIN
               rec.req := rec.req + [req];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'env',3) = 0 THEN BEGIN
         setp := setvalue;
         rec.env := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_polaritytype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         env);
            IF result THEN BEGIN
               rec.env := rec.env + [env];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'dimforms',8) = 0 THEN BEGIN
         setp := setvalue;
         rec.dimforms := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_dimformtype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         dimforms);
            IF result THEN BEGIN
               rec.dimforms := rec.dimforms + [dimforms];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'pluralforms',11) = 0 THEN BEGIN
         setp := setvalue;
         rec.pluralforms := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_pluralformtype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         pluralforms);
            IF result THEN BEGIN
               rec.pluralforms := rec.pluralforms + [pluralforms];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'genders',7) = 0 THEN BEGIN
         setp := setvalue;
         rec.genders := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_gendertype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         genders);
            IF result THEN BEGIN
               rec.genders := rec.genders + [genders];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'class',5) = 0 THEN BEGIN
         result := LSSTRTOTYPE_timeadvclasstype( fieldvalue.str, fieldvalue.len, rec.class);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'deixis',6) = 0 THEN BEGIN
         result := LSSTRTOTYPE_deixistype( fieldvalue.str, fieldvalue.len, rec.deixis);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'aspect',6) = 0 THEN BEGIN
         result := LSSTRTOTYPE_aspecttype( fieldvalue.str, fieldvalue.len, rec.aspect);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'retro',5) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.retro := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.retro := FALSE; result := TRUE 
         END;
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'sexes',5) = 0 THEN BEGIN
         setp := setvalue;
         rec.sexes := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_sextype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         sexes);
            IF result THEN BEGIN
               rec.sexes := rec.sexes + [sexes];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'subcs',5) = 0 THEN BEGIN
         setp := setvalue;
         rec.subcs := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_nounsubctype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         subcs);
            IF result THEN BEGIN
               rec.subcs := rec.subcs + [subcs];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'temporal',8) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.temporal := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.temporal := FALSE; result := TRUE 
         END;
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'possgeni',8) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.possgeni := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.possgeni := FALSE; result := TRUE 
         END;
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'animate',7) = 0 THEN BEGIN
         result := LSSTRTOTYPE_animatetype( fieldvalue.str, fieldvalue.len, rec.animate);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'human',5) = 0 THEN BEGIN
         result := LSSTRTOTYPE_humantype( fieldvalue.str, fieldvalue.len, rec.human);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'posscomas',9) = 0 THEN BEGIN
         setp := setvalue;
         rec.posscomas := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_posscomatype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         posscomas);
            IF result THEN BEGIN
               rec.posscomas := rec.posscomas + [posscomas];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'thetanp',7) = 0 THEN BEGIN
         result := LSSTRTOTYPE_thetanptype( fieldvalue.str, fieldvalue.len, rec.thetanp);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'nounpatterns',12) = 0 THEN BEGIN
         setp := setvalue;
         rec.nounpatterns := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_synpatterntype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         nounpatterns);
            IF result THEN BEGIN
               rec.nounpatterns := rec.nounpatterns + [nounpatterns];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'prepkey',7) = 0 THEN BEGIN
         result := STR_StrToInteger(fieldvalue.str, fieldvalue.len, rec.prepkey);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'personal',8) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.personal := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.personal := FALSE; result := TRUE 
         END;
         END;
      END;
      attr^.Error := (NOT result);
      attr := attr^.NextAttr
   END;
   LSCONVATTR_BNOUNrecord := result;
END {LSCONVATTR_BNOUNrecord};

FUNCTION LSCONVATTR_SUBNOUNrecord(VAR rec: LSDOMAINT_SUBNOUNrecord;
                  VAR pattr: LDCONVREC_pAttrStruct): BOOLEAN;
VAR result : BOOLEAN;
    setp   : LDCONVREC_pSetValueType;
    attr   : LDCONVREC_pAttrStruct;

    req : LSDOMAINT_polaritytype; 
    env : LSDOMAINT_polaritytype; 
    dimforms : LSDOMAINT_dimformtype; 
    pluralforms : LSDOMAINT_pluralformtype; 
    genders : LSDOMAINT_gendertype; 
    sexes : LSDOMAINT_sextype; 
    subcs : LSDOMAINT_nounsubctype; 
    posscomas : LSDOMAINT_posscomatype; 
    nounpatterns : LSDOMAINT_synpatterntype; 
BEGIN
   result := TRUE; attr := pattr;
   MAKET_SUBNOUNrec(rec);
   WHILE (attr <> NIL) AND result DO BEGIN
   WITH attr^ DO BEGIN
      IF FALSE THEN BEGIN
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'req',3) = 0 THEN BEGIN
         setp := setvalue;
         rec.req := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_polaritytype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         req);
            IF result THEN BEGIN
               rec.req := rec.req + [req];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'env',3) = 0 THEN BEGIN
         setp := setvalue;
         rec.env := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_polaritytype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         env);
            IF result THEN BEGIN
               rec.env := rec.env + [env];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'dimforms',8) = 0 THEN BEGIN
         setp := setvalue;
         rec.dimforms := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_dimformtype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         dimforms);
            IF result THEN BEGIN
               rec.dimforms := rec.dimforms + [dimforms];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'pluralforms',11) = 0 THEN BEGIN
         setp := setvalue;
         rec.pluralforms := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_pluralformtype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         pluralforms);
            IF result THEN BEGIN
               rec.pluralforms := rec.pluralforms + [pluralforms];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'genders',7) = 0 THEN BEGIN
         setp := setvalue;
         rec.genders := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_gendertype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         genders);
            IF result THEN BEGIN
               rec.genders := rec.genders + [genders];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'class',5) = 0 THEN BEGIN
         result := LSSTRTOTYPE_timeadvclasstype( fieldvalue.str, fieldvalue.len, rec.class);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'deixis',6) = 0 THEN BEGIN
         result := LSSTRTOTYPE_deixistype( fieldvalue.str, fieldvalue.len, rec.deixis);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'aspect',6) = 0 THEN BEGIN
         result := LSSTRTOTYPE_aspecttype( fieldvalue.str, fieldvalue.len, rec.aspect);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'retro',5) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.retro := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.retro := FALSE; result := TRUE 
         END;
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'sexes',5) = 0 THEN BEGIN
         setp := setvalue;
         rec.sexes := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_sextype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         sexes);
            IF result THEN BEGIN
               rec.sexes := rec.sexes + [sexes];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'subcs',5) = 0 THEN BEGIN
         setp := setvalue;
         rec.subcs := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_nounsubctype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         subcs);
            IF result THEN BEGIN
               rec.subcs := rec.subcs + [subcs];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'temporal',8) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.temporal := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.temporal := FALSE; result := TRUE 
         END;
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'possgeni',8) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.possgeni := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.possgeni := FALSE; result := TRUE 
         END;
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'animate',7) = 0 THEN BEGIN
         result := LSSTRTOTYPE_animatetype( fieldvalue.str, fieldvalue.len, rec.animate);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'human',5) = 0 THEN BEGIN
         result := LSSTRTOTYPE_humantype( fieldvalue.str, fieldvalue.len, rec.human);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'posscomas',9) = 0 THEN BEGIN
         setp := setvalue;
         rec.posscomas := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_posscomatype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         posscomas);
            IF result THEN BEGIN
               rec.posscomas := rec.posscomas + [posscomas];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'thetanp',7) = 0 THEN BEGIN
         result := LSSTRTOTYPE_thetanptype( fieldvalue.str, fieldvalue.len, rec.thetanp);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'nounpatterns',12) = 0 THEN BEGIN
         setp := setvalue;
         rec.nounpatterns := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_synpatterntype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         nounpatterns);
            IF result THEN BEGIN
               rec.nounpatterns := rec.nounpatterns + [nounpatterns];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'prepkey',7) = 0 THEN BEGIN
         result := STR_StrToInteger(fieldvalue.str, fieldvalue.len, rec.prepkey);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'personal',8) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.personal := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.personal := FALSE; result := TRUE 
         END;
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'lastaffix',9) = 0 THEN BEGIN
         result := LSSTRTOTYPE_affixtype( fieldvalue.str, fieldvalue.len, rec.lastaffix);
         END;
      END;
      attr^.Error := (NOT result);
      attr := attr^.NextAttr
   END;
   LSCONVATTR_SUBNOUNrecord := result;
END {LSCONVATTR_SUBNOUNrecord};

FUNCTION LSCONVATTR_NOUNrecord(VAR rec: LSDOMAINT_NOUNrecord;
                  VAR pattr: LDCONVREC_pAttrStruct): BOOLEAN;
VAR result : BOOLEAN;
    setp   : LDCONVREC_pSetValueType;
    attr   : LDCONVREC_pAttrStruct;

    req : LSDOMAINT_polaritytype; 
    env : LSDOMAINT_polaritytype; 
    dimforms : LSDOMAINT_dimformtype; 
    pluralforms : LSDOMAINT_pluralformtype; 
    genders : LSDOMAINT_gendertype; 
    sexes : LSDOMAINT_sextype; 
    subcs : LSDOMAINT_nounsubctype; 
    posscomas : LSDOMAINT_posscomatype; 
    nounpatterns : LSDOMAINT_synpatterntype; 
BEGIN
   result := TRUE; attr := pattr;
   MAKET_ALLONOUNrec(rec);
   WHILE (attr <> NIL) AND result DO BEGIN
   WITH attr^ DO BEGIN
      IF FALSE THEN BEGIN
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'req',3) = 0 THEN BEGIN
         setp := setvalue;
         rec.req := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_polaritytype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         req);
            IF result THEN BEGIN
               rec.req := rec.req + [req];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'env',3) = 0 THEN BEGIN
         setp := setvalue;
         rec.env := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_polaritytype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         env);
            IF result THEN BEGIN
               rec.env := rec.env + [env];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'dimforms',8) = 0 THEN BEGIN
         setp := setvalue;
         rec.dimforms := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_dimformtype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         dimforms);
            IF result THEN BEGIN
               rec.dimforms := rec.dimforms + [dimforms];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'pluralforms',11) = 0 THEN BEGIN
         setp := setvalue;
         rec.pluralforms := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_pluralformtype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         pluralforms);
            IF result THEN BEGIN
               rec.pluralforms := rec.pluralforms + [pluralforms];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'genders',7) = 0 THEN BEGIN
         setp := setvalue;
         rec.genders := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_gendertype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         genders);
            IF result THEN BEGIN
               rec.genders := rec.genders + [genders];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'number',6) = 0 THEN BEGIN
         result := LSSTRTOTYPE_numbertype( fieldvalue.str, fieldvalue.len, rec.number);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'geni',4) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.geni := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.geni := FALSE; result := TRUE 
         END;
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'class',5) = 0 THEN BEGIN
         result := LSSTRTOTYPE_timeadvclasstype( fieldvalue.str, fieldvalue.len, rec.class);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'deixis',6) = 0 THEN BEGIN
         result := LSSTRTOTYPE_deixistype( fieldvalue.str, fieldvalue.len, rec.deixis);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'aspect',6) = 0 THEN BEGIN
         result := LSSTRTOTYPE_aspecttype( fieldvalue.str, fieldvalue.len, rec.aspect);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'retro',5) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.retro := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.retro := FALSE; result := TRUE 
         END;
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'sexes',5) = 0 THEN BEGIN
         setp := setvalue;
         rec.sexes := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_sextype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         sexes);
            IF result THEN BEGIN
               rec.sexes := rec.sexes + [sexes];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'subcs',5) = 0 THEN BEGIN
         setp := setvalue;
         rec.subcs := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_nounsubctype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         subcs);
            IF result THEN BEGIN
               rec.subcs := rec.subcs + [subcs];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'temporal',8) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.temporal := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.temporal := FALSE; result := TRUE 
         END;
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'possgeni',8) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.possgeni := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.possgeni := FALSE; result := TRUE 
         END;
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'animate',7) = 0 THEN BEGIN
         result := LSSTRTOTYPE_animatetype( fieldvalue.str, fieldvalue.len, rec.animate);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'human',5) = 0 THEN BEGIN
         result := LSSTRTOTYPE_humantype( fieldvalue.str, fieldvalue.len, rec.human);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'posscomas',9) = 0 THEN BEGIN
         setp := setvalue;
         rec.posscomas := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_posscomatype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         posscomas);
            IF result THEN BEGIN
               rec.posscomas := rec.posscomas + [posscomas];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'thetanp',7) = 0 THEN BEGIN
         result := LSSTRTOTYPE_thetanptype( fieldvalue.str, fieldvalue.len, rec.thetanp);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'nounpatterns',12) = 0 THEN BEGIN
         setp := setvalue;
         rec.nounpatterns := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_synpatterntype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         nounpatterns);
            IF result THEN BEGIN
               rec.nounpatterns := rec.nounpatterns + [nounpatterns];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'prepkey',7) = 0 THEN BEGIN
         result := STR_StrToInteger(fieldvalue.str, fieldvalue.len, rec.prepkey);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'personal',8) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.personal := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.personal := FALSE; result := TRUE 
         END;
         END;
      END;
      attr^.Error := (NOT result);
      attr := attr^.NextAttr
   END;
   LSCONVATTR_NOUNrecord := result;
END {LSCONVATTR_NOUNrecord};

FUNCTION LSCONVATTR_CNrecord(VAR rec: LSDOMAINT_CNrecord;
                  VAR pattr: LDCONVREC_pAttrStruct): BOOLEAN;
VAR result : BOOLEAN;
    setp   : LDCONVREC_pSetValueType;
    attr   : LDCONVREC_pAttrStruct;

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
   result := TRUE; attr := pattr;
   MAKET_CNrec(rec);
   WHILE (attr <> NIL) AND result DO BEGIN
   WITH attr^ DO BEGIN
      IF FALSE THEN BEGIN
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'req',3) = 0 THEN BEGIN
         setp := setvalue;
         rec.req := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_polaritytype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         req);
            IF result THEN BEGIN
               rec.req := rec.req + [req];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'env',3) = 0 THEN BEGIN
         setp := setvalue;
         rec.env := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_polaritytype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         env);
            IF result THEN BEGIN
               rec.env := rec.env + [env];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'superdeixis',11) = 0 THEN BEGIN
         result := LSSTRTOTYPE_deixistype( fieldvalue.str, fieldvalue.len, rec.superdeixis);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'class',5) = 0 THEN BEGIN
         result := LSSTRTOTYPE_timeadvclasstype( fieldvalue.str, fieldvalue.len, rec.class);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'deixis',6) = 0 THEN BEGIN
         result := LSSTRTOTYPE_deixistype( fieldvalue.str, fieldvalue.len, rec.deixis);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'aspect',6) = 0 THEN BEGIN
         result := LSSTRTOTYPE_aspecttype( fieldvalue.str, fieldvalue.len, rec.aspect);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'retro',5) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.retro := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.retro := FALSE; result := TRUE 
         END;
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'definite',8) = 0 THEN BEGIN
         result := LSSTRTOTYPE_deftype( fieldvalue.str, fieldvalue.len, rec.definite);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'numbers',7) = 0 THEN BEGIN
         setp := setvalue;
         rec.numbers := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_numbertype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         numbers);
            IF result THEN BEGIN
               rec.numbers := rec.numbers + [numbers];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'cases',5) = 0 THEN BEGIN
         setp := setvalue;
         rec.cases := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_casetype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         cases);
            IF result THEN BEGIN
               rec.cases := rec.cases + [cases];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'genders',7) = 0 THEN BEGIN
         setp := setvalue;
         rec.genders := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_gendertype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         genders);
            IF result THEN BEGIN
               rec.genders := rec.genders + [genders];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'sexes',5) = 0 THEN BEGIN
         setp := setvalue;
         rec.sexes := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_sextype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         sexes);
            IF result THEN BEGIN
               rec.sexes := rec.sexes + [sexes];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'actsubcs',8) = 0 THEN BEGIN
         setp := setvalue;
         rec.actsubcs := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_nounsubctype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         actsubcs);
            IF result THEN BEGIN
               rec.actsubcs := rec.actsubcs + [actsubcs];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'temporal',8) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.temporal := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.temporal := FALSE; result := TRUE 
         END;
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'possgeni',8) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.possgeni := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.possgeni := FALSE; result := TRUE 
         END;
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'animate',7) = 0 THEN BEGIN
         result := LSSTRTOTYPE_animatetype( fieldvalue.str, fieldvalue.len, rec.animate);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'human',5) = 0 THEN BEGIN
         result := LSSTRTOTYPE_humantype( fieldvalue.str, fieldvalue.len, rec.human);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'posscomas',9) = 0 THEN BEGIN
         setp := setvalue;
         rec.posscomas := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_posscomatype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         posscomas);
            IF result THEN BEGIN
               rec.posscomas := rec.posscomas + [posscomas];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'thetanp',7) = 0 THEN BEGIN
         result := LSSTRTOTYPE_thetanptype( fieldvalue.str, fieldvalue.len, rec.thetanp);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'nounpatternefs',14) = 0 THEN BEGIN
         setp := setvalue;
         rec.nounpatternefs := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_synpatterntype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         nounpatternefs);
            IF result THEN BEGIN
               rec.nounpatternefs := rec.nounpatternefs + [nounpatternefs];
            END;
            setp := setp^.NextValue         END

         END;
      END;
      attr^.Error := (NOT result);
      attr := attr^.NextAttr
   END;
   LSCONVATTR_CNrecord := result;
END {LSCONVATTR_CNrecord};

FUNCTION LSCONVATTR_CNVARrecord(VAR rec: LSDOMAINT_CNVARrecord;
                  VAR pattr: LDCONVREC_pAttrStruct): BOOLEAN;
VAR result : BOOLEAN;
    setp   : LDCONVREC_pSetValueType;
    attr   : LDCONVREC_pAttrStruct;

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
   result := TRUE; attr := pattr;
   MAKET_CNVARrec(rec);
   WHILE (attr <> NIL) AND result DO BEGIN
   WITH attr^ DO BEGIN
      IF FALSE THEN BEGIN
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'req',3) = 0 THEN BEGIN
         setp := setvalue;
         rec.req := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_polaritytype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         req);
            IF result THEN BEGIN
               rec.req := rec.req + [req];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'env',3) = 0 THEN BEGIN
         setp := setvalue;
         rec.env := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_polaritytype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         env);
            IF result THEN BEGIN
               rec.env := rec.env + [env];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'superdeixis',11) = 0 THEN BEGIN
         result := LSSTRTOTYPE_deixistype( fieldvalue.str, fieldvalue.len, rec.superdeixis);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'class',5) = 0 THEN BEGIN
         result := LSSTRTOTYPE_timeadvclasstype( fieldvalue.str, fieldvalue.len, rec.class);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'deixis',6) = 0 THEN BEGIN
         result := LSSTRTOTYPE_deixistype( fieldvalue.str, fieldvalue.len, rec.deixis);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'aspect',6) = 0 THEN BEGIN
         result := LSSTRTOTYPE_aspecttype( fieldvalue.str, fieldvalue.len, rec.aspect);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'retro',5) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.retro := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.retro := FALSE; result := TRUE 
         END;
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'definite',8) = 0 THEN BEGIN
         result := LSSTRTOTYPE_deftype( fieldvalue.str, fieldvalue.len, rec.definite);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'numbers',7) = 0 THEN BEGIN
         setp := setvalue;
         rec.numbers := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_numbertype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         numbers);
            IF result THEN BEGIN
               rec.numbers := rec.numbers + [numbers];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'cases',5) = 0 THEN BEGIN
         setp := setvalue;
         rec.cases := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_casetype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         cases);
            IF result THEN BEGIN
               rec.cases := rec.cases + [cases];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'genders',7) = 0 THEN BEGIN
         setp := setvalue;
         rec.genders := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_gendertype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         genders);
            IF result THEN BEGIN
               rec.genders := rec.genders + [genders];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'sexes',5) = 0 THEN BEGIN
         setp := setvalue;
         rec.sexes := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_sextype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         sexes);
            IF result THEN BEGIN
               rec.sexes := rec.sexes + [sexes];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'actsubcs',8) = 0 THEN BEGIN
         setp := setvalue;
         rec.actsubcs := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_nounsubctype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         actsubcs);
            IF result THEN BEGIN
               rec.actsubcs := rec.actsubcs + [actsubcs];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'temporal',8) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.temporal := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.temporal := FALSE; result := TRUE 
         END;
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'possgeni',8) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.possgeni := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.possgeni := FALSE; result := TRUE 
         END;
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'animate',7) = 0 THEN BEGIN
         result := LSSTRTOTYPE_animatetype( fieldvalue.str, fieldvalue.len, rec.animate);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'human',5) = 0 THEN BEGIN
         result := LSSTRTOTYPE_humantype( fieldvalue.str, fieldvalue.len, rec.human);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'posscomas',9) = 0 THEN BEGIN
         setp := setvalue;
         rec.posscomas := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_posscomatype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         posscomas);
            IF result THEN BEGIN
               rec.posscomas := rec.posscomas + [posscomas];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'thetanp',7) = 0 THEN BEGIN
         result := LSSTRTOTYPE_thetanptype( fieldvalue.str, fieldvalue.len, rec.thetanp);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'nounpatternefs',14) = 0 THEN BEGIN
         setp := setvalue;
         rec.nounpatternefs := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_synpatterntype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         nounpatternefs);
            IF result THEN BEGIN
               rec.nounpatternefs := rec.nounpatternefs + [nounpatternefs];
            END;
            setp := setp^.NextValue         END

         END;
      END;
      attr^.Error := (NOT result);
      attr := attr^.NextAttr
   END;
   LSCONVATTR_CNVARrecord := result;
END {LSCONVATTR_CNVARrecord};

FUNCTION LSCONVATTR_NPrecord(VAR rec: LSDOMAINT_NPrecord;
                  VAR pattr: LDCONVREC_pAttrStruct): BOOLEAN;
VAR result : BOOLEAN;
    setp   : LDCONVREC_pSetValueType;
    attr   : LDCONVREC_pAttrStruct;

    req : LSDOMAINT_polaritytype; 
    env : LSDOMAINT_polaritytype; 
    cases : LSDOMAINT_casetype; 
    genders : LSDOMAINT_gendertype; 
    sexes : LSDOMAINT_sextype; 
    actsubcs : LSDOMAINT_nounsubctype; 
    actcomas : LSDOMAINT_posscomatype; 
    nounpatternefs : LSDOMAINT_synpatterntype; 
BEGIN
   result := TRUE; attr := pattr;
   MAKET_NPrec(rec);
   WHILE (attr <> NIL) AND result DO BEGIN
   WITH attr^ DO BEGIN
      IF FALSE THEN BEGIN
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'req',3) = 0 THEN BEGIN
         setp := setvalue;
         rec.req := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_polaritytype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         req);
            IF result THEN BEGIN
               rec.req := rec.req + [req];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'env',3) = 0 THEN BEGIN
         setp := setvalue;
         rec.env := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_polaritytype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         env);
            IF result THEN BEGIN
               rec.env := rec.env + [env];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'superdeixis',11) = 0 THEN BEGIN
         result := LSSTRTOTYPE_deixistype( fieldvalue.str, fieldvalue.len, rec.superdeixis);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'class',5) = 0 THEN BEGIN
         result := LSSTRTOTYPE_timeadvclasstype( fieldvalue.str, fieldvalue.len, rec.class);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'deixis',6) = 0 THEN BEGIN
         result := LSSTRTOTYPE_deixistype( fieldvalue.str, fieldvalue.len, rec.deixis);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'aspect',6) = 0 THEN BEGIN
         result := LSSTRTOTYPE_aspecttype( fieldvalue.str, fieldvalue.len, rec.aspect);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'retro',5) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.retro := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.retro := FALSE; result := TRUE 
         END;
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'definite',8) = 0 THEN BEGIN
         result := LSSTRTOTYPE_deftype( fieldvalue.str, fieldvalue.len, rec.definite);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'person',6) = 0 THEN BEGIN
         result := LSSTRTOTYPE_persontype( fieldvalue.str, fieldvalue.len, rec.person);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'number',6) = 0 THEN BEGIN
         result := LSSTRTOTYPE_numbertype( fieldvalue.str, fieldvalue.len, rec.number);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'cases',5) = 0 THEN BEGIN
         setp := setvalue;
         rec.cases := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_casetype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         cases);
            IF result THEN BEGIN
               rec.cases := rec.cases + [cases];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'genders',7) = 0 THEN BEGIN
         setp := setvalue;
         rec.genders := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_gendertype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         genders);
            IF result THEN BEGIN
               rec.genders := rec.genders + [genders];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'sexes',5) = 0 THEN BEGIN
         setp := setvalue;
         rec.sexes := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_sextype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         sexes);
            IF result THEN BEGIN
               rec.sexes := rec.sexes + [sexes];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'actsubcs',8) = 0 THEN BEGIN
         setp := setvalue;
         rec.actsubcs := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_nounsubctype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         actsubcs);
            IF result THEN BEGIN
               rec.actsubcs := rec.actsubcs + [actsubcs];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'temporal',8) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.temporal := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.temporal := FALSE; result := TRUE 
         END;
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'possgeni',8) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.possgeni := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.possgeni := FALSE; result := TRUE 
         END;
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'animate',7) = 0 THEN BEGIN
         result := LSSTRTOTYPE_animatetype( fieldvalue.str, fieldvalue.len, rec.animate);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'human',5) = 0 THEN BEGIN
         result := LSSTRTOTYPE_humantype( fieldvalue.str, fieldvalue.len, rec.human);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'actcomas',8) = 0 THEN BEGIN
         setp := setvalue;
         rec.actcomas := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_posscomatype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         actcomas);
            IF result THEN BEGIN
               rec.actcomas := rec.actcomas + [actcomas];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'thetanp',7) = 0 THEN BEGIN
         result := LSSTRTOTYPE_thetanptype( fieldvalue.str, fieldvalue.len, rec.thetanp);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'nounpatternefs',14) = 0 THEN BEGIN
         setp := setvalue;
         rec.nounpatternefs := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_synpatterntype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         nounpatternefs);
            IF result THEN BEGIN
               rec.nounpatternefs := rec.nounpatternefs + [nounpatternefs];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'posspred',8) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.posspred := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.posspred := FALSE; result := TRUE 
         END;
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'possnietnp',10) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.possnietnp := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.possnietnp := FALSE; result := TRUE 
         END;
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'mood',4) = 0 THEN BEGIN
         result := LSSTRTOTYPE_xpmoodtype( fieldvalue.str, fieldvalue.len, rec.mood);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'generic',7) = 0 THEN BEGIN
         result := LSSTRTOTYPE_generictype( fieldvalue.str, fieldvalue.len, rec.generic);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'possRform',9) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.possRform := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.possRform := FALSE; result := TRUE 
         END;
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'syntquant',9) = 0 THEN BEGIN
         result := LSSTRTOTYPE_syntquanttype( fieldvalue.str, fieldvalue.len, rec.syntquant);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'NPhead',6) = 0 THEN BEGIN
         result := LSSTRTOTYPE_npheadtype( fieldvalue.str, fieldvalue.len, rec.NPhead);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'specQ',5) = 0 THEN BEGIN
         result := LSSTRTOTYPE_specqtype( fieldvalue.str, fieldvalue.len, rec.specQ);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'coord',5) = 0 THEN BEGIN
         result := LSSTRTOTYPE_coordtype( fieldvalue.str, fieldvalue.len, rec.coord);
         END;
      END;
      attr^.Error := (NOT result);
      attr := attr^.NextAttr
   END;
   LSCONVATTR_NPrecord := result;
END {LSCONVATTR_NPrecord};

FUNCTION LSCONVATTR_NPVARrecord(VAR rec: LSDOMAINT_NPVARrecord;
                  VAR pattr: LDCONVREC_pAttrStruct): BOOLEAN;
VAR result : BOOLEAN;
    setp   : LDCONVREC_pSetValueType;
    attr   : LDCONVREC_pAttrStruct;

    req : LSDOMAINT_polaritytype; 
    env : LSDOMAINT_polaritytype; 
    cases : LSDOMAINT_casetype; 
    genders : LSDOMAINT_gendertype; 
    sexes : LSDOMAINT_sextype; 
    actsubcs : LSDOMAINT_nounsubctype; 
    actcomas : LSDOMAINT_posscomatype; 
    nounpatternefs : LSDOMAINT_synpatterntype; 
BEGIN
   result := TRUE; attr := pattr;
   MAKET_NPVARrec(rec);
   WHILE (attr <> NIL) AND result DO BEGIN
   WITH attr^ DO BEGIN
      IF FALSE THEN BEGIN
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'req',3) = 0 THEN BEGIN
         setp := setvalue;
         rec.req := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_polaritytype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         req);
            IF result THEN BEGIN
               rec.req := rec.req + [req];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'env',3) = 0 THEN BEGIN
         setp := setvalue;
         rec.env := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_polaritytype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         env);
            IF result THEN BEGIN
               rec.env := rec.env + [env];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'superdeixis',11) = 0 THEN BEGIN
         result := LSSTRTOTYPE_deixistype( fieldvalue.str, fieldvalue.len, rec.superdeixis);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'class',5) = 0 THEN BEGIN
         result := LSSTRTOTYPE_timeadvclasstype( fieldvalue.str, fieldvalue.len, rec.class);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'deixis',6) = 0 THEN BEGIN
         result := LSSTRTOTYPE_deixistype( fieldvalue.str, fieldvalue.len, rec.deixis);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'aspect',6) = 0 THEN BEGIN
         result := LSSTRTOTYPE_aspecttype( fieldvalue.str, fieldvalue.len, rec.aspect);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'retro',5) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.retro := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.retro := FALSE; result := TRUE 
         END;
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'definite',8) = 0 THEN BEGIN
         result := LSSTRTOTYPE_deftype( fieldvalue.str, fieldvalue.len, rec.definite);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'person',6) = 0 THEN BEGIN
         result := LSSTRTOTYPE_persontype( fieldvalue.str, fieldvalue.len, rec.person);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'number',6) = 0 THEN BEGIN
         result := LSSTRTOTYPE_numbertype( fieldvalue.str, fieldvalue.len, rec.number);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'cases',5) = 0 THEN BEGIN
         setp := setvalue;
         rec.cases := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_casetype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         cases);
            IF result THEN BEGIN
               rec.cases := rec.cases + [cases];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'genders',7) = 0 THEN BEGIN
         setp := setvalue;
         rec.genders := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_gendertype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         genders);
            IF result THEN BEGIN
               rec.genders := rec.genders + [genders];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'sexes',5) = 0 THEN BEGIN
         setp := setvalue;
         rec.sexes := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_sextype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         sexes);
            IF result THEN BEGIN
               rec.sexes := rec.sexes + [sexes];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'actsubcs',8) = 0 THEN BEGIN
         setp := setvalue;
         rec.actsubcs := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_nounsubctype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         actsubcs);
            IF result THEN BEGIN
               rec.actsubcs := rec.actsubcs + [actsubcs];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'temporal',8) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.temporal := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.temporal := FALSE; result := TRUE 
         END;
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'possgeni',8) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.possgeni := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.possgeni := FALSE; result := TRUE 
         END;
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'animate',7) = 0 THEN BEGIN
         result := LSSTRTOTYPE_animatetype( fieldvalue.str, fieldvalue.len, rec.animate);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'human',5) = 0 THEN BEGIN
         result := LSSTRTOTYPE_humantype( fieldvalue.str, fieldvalue.len, rec.human);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'actcomas',8) = 0 THEN BEGIN
         setp := setvalue;
         rec.actcomas := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_posscomatype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         actcomas);
            IF result THEN BEGIN
               rec.actcomas := rec.actcomas + [actcomas];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'thetanp',7) = 0 THEN BEGIN
         result := LSSTRTOTYPE_thetanptype( fieldvalue.str, fieldvalue.len, rec.thetanp);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'nounpatternefs',14) = 0 THEN BEGIN
         setp := setvalue;
         rec.nounpatternefs := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_synpatterntype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         nounpatternefs);
            IF result THEN BEGIN
               rec.nounpatternefs := rec.nounpatternefs + [nounpatternefs];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'posspred',8) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.posspred := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.posspred := FALSE; result := TRUE 
         END;
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'possnietnp',10) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.possnietnp := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.possnietnp := FALSE; result := TRUE 
         END;
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'mood',4) = 0 THEN BEGIN
         result := LSSTRTOTYPE_xpmoodtype( fieldvalue.str, fieldvalue.len, rec.mood);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'generic',7) = 0 THEN BEGIN
         result := LSSTRTOTYPE_generictype( fieldvalue.str, fieldvalue.len, rec.generic);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'possRform',9) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.possRform := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.possRform := FALSE; result := TRUE 
         END;
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'syntquant',9) = 0 THEN BEGIN
         result := LSSTRTOTYPE_syntquanttype( fieldvalue.str, fieldvalue.len, rec.syntquant);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'NPhead',6) = 0 THEN BEGIN
         result := LSSTRTOTYPE_npheadtype( fieldvalue.str, fieldvalue.len, rec.NPhead);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'specQ',5) = 0 THEN BEGIN
         result := LSSTRTOTYPE_specqtype( fieldvalue.str, fieldvalue.len, rec.specQ);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'coord',5) = 0 THEN BEGIN
         result := LSSTRTOTYPE_coordtype( fieldvalue.str, fieldvalue.len, rec.coord);
         END;
      END;
      attr^.Error := (NOT result);
      attr := attr^.NextAttr
   END;
   LSCONVATTR_NPVARrecord := result;
END {LSCONVATTR_NPVARrecord};

FUNCTION LSCONVATTR_NPPROPrecord(VAR rec: LSDOMAINT_NPPROPrecord;
                  VAR pattr: LDCONVREC_pAttrStruct): BOOLEAN;
VAR result : BOOLEAN;
    setp   : LDCONVREC_pSetValueType;
    attr   : LDCONVREC_pAttrStruct;

    req : LSDOMAINT_polaritytype; 
    env : LSDOMAINT_polaritytype; 
    aktionsarts : LSDOMAINT_aktionsarttype; 
    nounpatternefs : LSDOMAINT_synpatterntype; 
BEGIN
   result := TRUE; attr := pattr;
   MAKET_CLOSEDNPPROPrec(rec);
   WHILE (attr <> NIL) AND result DO BEGIN
   WITH attr^ DO BEGIN
      IF FALSE THEN BEGIN
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'req',3) = 0 THEN BEGIN
         setp := setvalue;
         rec.req := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_polaritytype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         req);
            IF result THEN BEGIN
               rec.req := rec.req + [req];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'env',3) = 0 THEN BEGIN
         setp := setvalue;
         rec.env := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_polaritytype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         env);
            IF result THEN BEGIN
               rec.env := rec.env + [env];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'superdeixis',11) = 0 THEN BEGIN
         result := LSSTRTOTYPE_deixistype( fieldvalue.str, fieldvalue.len, rec.superdeixis);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'aktionsarts',11) = 0 THEN BEGIN
         setp := setvalue;
         rec.aktionsarts := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_aktionsarttype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         aktionsarts);
            IF result THEN BEGIN
               rec.aktionsarts := rec.aktionsarts + [aktionsarts];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'thetanp',7) = 0 THEN BEGIN
         result := LSSTRTOTYPE_thetanptype( fieldvalue.str, fieldvalue.len, rec.thetanp);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'nounpatternefs',14) = 0 THEN BEGIN
         setp := setvalue;
         rec.nounpatternefs := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_synpatterntype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         nounpatternefs);
            IF result THEN BEGIN
               rec.nounpatternefs := rec.nounpatternefs + [nounpatternefs];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'PROsubject',10) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.PROsubject := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.PROsubject := FALSE; result := TRUE 
         END;
         END;
      END;
      attr^.Error := (NOT result);
      attr := attr^.NextAttr
   END;
   LSCONVATTR_NPPROPrecord := result;
END {LSCONVATTR_NPPROPrecord};

FUNCTION LSCONVATTR_NPPROPVARrecord(VAR rec: LSDOMAINT_NPPROPVARrecord;
                  VAR pattr: LDCONVREC_pAttrStruct): BOOLEAN;
VAR result : BOOLEAN;
    setp   : LDCONVREC_pSetValueType;
    attr   : LDCONVREC_pAttrStruct;

    req : LSDOMAINT_polaritytype; 
    env : LSDOMAINT_polaritytype; 
    aktionsarts : LSDOMAINT_aktionsarttype; 
    nounpatternefs : LSDOMAINT_synpatterntype; 
BEGIN
   result := TRUE; attr := pattr;
   MAKET_NPPROPVARrec(rec);
   WHILE (attr <> NIL) AND result DO BEGIN
   WITH attr^ DO BEGIN
      IF FALSE THEN BEGIN
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'req',3) = 0 THEN BEGIN
         setp := setvalue;
         rec.req := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_polaritytype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         req);
            IF result THEN BEGIN
               rec.req := rec.req + [req];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'env',3) = 0 THEN BEGIN
         setp := setvalue;
         rec.env := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_polaritytype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         env);
            IF result THEN BEGIN
               rec.env := rec.env + [env];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'superdeixis',11) = 0 THEN BEGIN
         result := LSSTRTOTYPE_deixistype( fieldvalue.str, fieldvalue.len, rec.superdeixis);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'aktionsarts',11) = 0 THEN BEGIN
         setp := setvalue;
         rec.aktionsarts := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_aktionsarttype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         aktionsarts);
            IF result THEN BEGIN
               rec.aktionsarts := rec.aktionsarts + [aktionsarts];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'thetanp',7) = 0 THEN BEGIN
         result := LSSTRTOTYPE_thetanptype( fieldvalue.str, fieldvalue.len, rec.thetanp);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'nounpatternefs',14) = 0 THEN BEGIN
         setp := setvalue;
         rec.nounpatternefs := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_synpatterntype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         nounpatternefs);
            IF result THEN BEGIN
               rec.nounpatternefs := rec.nounpatternefs + [nounpatternefs];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'PROsubject',10) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.PROsubject := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.PROsubject := FALSE; result := TRUE 
         END;
         END;
      END;
      attr^.Error := (NOT result);
      attr := attr^.NextAttr
   END;
   LSCONVATTR_NPPROPVARrecord := result;
END {LSCONVATTR_NPPROPVARrecord};

FUNCTION LSCONVATTR_NUMrecord(VAR rec: LSDOMAINT_NUMrecord;
                  VAR pattr: LDCONVREC_pAttrStruct): BOOLEAN;
VAR result : BOOLEAN;
    setp   : LDCONVREC_pSetValueType;
    attr   : LDCONVREC_pAttrStruct;

BEGIN
   result := TRUE; attr := pattr;
   MAKET_NUMrec(rec);
   WHILE (attr <> NIL) AND result DO BEGIN
   WITH attr^ DO BEGIN
      IF FALSE THEN BEGIN
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                          'KEY', 3) = 0 THEN BEGIN
         result := STR_StrToInteger(fieldvalue.str,
                                 fieldvalue.len, rec.key);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'enform',6) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.enform := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.enform := FALSE; result := TRUE 
         END;
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'number',6) = 0 THEN BEGIN
         result := LSSTRTOTYPE_numbertype( fieldvalue.str, fieldvalue.len, rec.number);
         END;
      END;
      attr^.Error := (NOT result);
      attr := attr^.NextAttr
   END;
   LSCONVATTR_NUMrecord := result;
END {LSCONVATTR_NUMrecord};

FUNCTION LSCONVATTR_ORDINALrecord(VAR rec: LSDOMAINT_ORDINALrecord;
                  VAR pattr: LDCONVREC_pAttrStruct): BOOLEAN;
VAR result : BOOLEAN;
    setp   : LDCONVREC_pSetValueType;
    attr   : LDCONVREC_pAttrStruct;

BEGIN
   result := TRUE; attr := pattr;
   MAKET_ORDINALrec(rec);
   WHILE (attr <> NIL) AND result DO BEGIN
   WITH attr^ DO BEGIN
      IF FALSE THEN BEGIN
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                          'KEY', 3) = 0 THEN BEGIN
         result := STR_StrToInteger(fieldvalue.str,
                                 fieldvalue.len, rec.key);
         END;
      END;
      attr^.Error := (NOT result);
      attr := attr^.NextAttr
   END;
   LSCONVATTR_ORDINALrecord := result;
END {LSCONVATTR_ORDINALrecord};

FUNCTION LSCONVATTR_PARTICLErecord(VAR rec: LSDOMAINT_PARTICLErecord;
                  VAR pattr: LDCONVREC_pAttrStruct): BOOLEAN;
VAR result : BOOLEAN;
    setp   : LDCONVREC_pSetValueType;
    attr   : LDCONVREC_pAttrStruct;

BEGIN
   result := TRUE; attr := pattr;
   MAKET_PARTrec(rec);
   WHILE (attr <> NIL) AND result DO BEGIN
   WITH attr^ DO BEGIN
      IF FALSE THEN BEGIN
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                          'KEY', 3) = 0 THEN BEGIN
         result := STR_StrToInteger(fieldvalue.str,
                                 fieldvalue.len, rec.key);
         END;
      END;
      attr^.Error := (NOT result);
      attr := attr^.NextAttr
   END;
   LSCONVATTR_PARTICLErecord := result;
END {LSCONVATTR_PARTICLErecord};

FUNCTION LSCONVATTR_BIGPROrecord(VAR rec: LSDOMAINT_BIGPROrecord;
                  VAR pattr: LDCONVREC_pAttrStruct): BOOLEAN;
VAR result : BOOLEAN;
    setp   : LDCONVREC_pSetValueType;
    attr   : LDCONVREC_pAttrStruct;

BEGIN
   result := TRUE; attr := pattr;
   MAKET_BIGPROrec(rec);
   WHILE (attr <> NIL) AND result DO BEGIN
   WITH attr^ DO BEGIN
      IF FALSE THEN BEGIN
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'number',6) = 0 THEN BEGIN
         result := LSSTRTOTYPE_numbertype( fieldvalue.str, fieldvalue.len, rec.number);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'gender',6) = 0 THEN BEGIN
         result := LSSTRTOTYPE_gendertype( fieldvalue.str, fieldvalue.len, rec.gender);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'person',6) = 0 THEN BEGIN
         result := LSSTRTOTYPE_pronpersontype( fieldvalue.str, fieldvalue.len, rec.person);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'animate',7) = 0 THEN BEGIN
         result := LSSTRTOTYPE_animatetype( fieldvalue.str, fieldvalue.len, rec.animate);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'possRform',9) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.possRform := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.possRform := FALSE; result := TRUE 
         END;
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'generalized',11) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.generalized := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.generalized := FALSE; result := TRUE 
         END;
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'NPhead',6) = 0 THEN BEGIN
         result := LSSTRTOTYPE_npheadtype( fieldvalue.str, fieldvalue.len, rec.NPhead);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'antecedent',10) = 0 THEN BEGIN
         result := STR_StrToInteger(fieldvalue.str, fieldvalue.len, rec.antecedent);
         END;
      END;
      attr^.Error := (NOT result);
      attr := attr^.NextAttr
   END;
   LSCONVATTR_BIGPROrecord := result;
END {LSCONVATTR_BIGPROrecord};

FUNCTION LSCONVATTR_BPERSPROrecord(VAR rec: LSDOMAINT_BPERSPROrecord;
                  VAR pattr: LDCONVREC_pAttrStruct): BOOLEAN;
VAR result : BOOLEAN;
    setp   : LDCONVREC_pSetValueType;
    attr   : LDCONVREC_pAttrStruct;

BEGIN
   result := TRUE; attr := pattr;
   MAKET_BPERSPROrec(rec);
   WHILE (attr <> NIL) AND result DO BEGIN
   WITH attr^ DO BEGIN
      IF FALSE THEN BEGIN
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                          'KEY', 3) = 0 THEN BEGIN
         result := STR_StrToInteger(fieldvalue.str,
                                 fieldvalue.len, rec.key);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'number',6) = 0 THEN BEGIN
         result := LSSTRTOTYPE_numbertype( fieldvalue.str, fieldvalue.len, rec.number);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'gender',6) = 0 THEN BEGIN
         result := LSSTRTOTYPE_gendertype( fieldvalue.str, fieldvalue.len, rec.gender);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'person',6) = 0 THEN BEGIN
         result := LSSTRTOTYPE_pronpersontype( fieldvalue.str, fieldvalue.len, rec.person);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'animate',7) = 0 THEN BEGIN
         result := LSSTRTOTYPE_animatetype( fieldvalue.str, fieldvalue.len, rec.animate);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'possRform',9) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.possRform := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.possRform := FALSE; result := TRUE 
         END;
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'generalized',11) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.generalized := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.generalized := FALSE; result := TRUE 
         END;
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'NPhead',6) = 0 THEN BEGIN
         result := LSSTRTOTYPE_npheadtype( fieldvalue.str, fieldvalue.len, rec.NPhead);
         END;
      END;
      attr^.Error := (NOT result);
      attr := attr^.NextAttr
   END;
   LSCONVATTR_BPERSPROrecord := result;
END {LSCONVATTR_BPERSPROrecord};

FUNCTION LSCONVATTR_PERSPROrecord(VAR rec: LSDOMAINT_PERSPROrecord;
                  VAR pattr: LDCONVREC_pAttrStruct): BOOLEAN;
VAR result : BOOLEAN;
    setp   : LDCONVREC_pSetValueType;
    attr   : LDCONVREC_pAttrStruct;

    persprocases : LSDOMAINT_casetype; 
BEGIN
   result := TRUE; attr := pattr;
   MAKET_PERSPROrec(rec);
   WHILE (attr <> NIL) AND result DO BEGIN
   WITH attr^ DO BEGIN
      IF FALSE THEN BEGIN
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'number',6) = 0 THEN BEGIN
         result := LSSTRTOTYPE_numbertype( fieldvalue.str, fieldvalue.len, rec.number);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'gender',6) = 0 THEN BEGIN
         result := LSSTRTOTYPE_gendertype( fieldvalue.str, fieldvalue.len, rec.gender);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'person',6) = 0 THEN BEGIN
         result := LSSTRTOTYPE_pronpersontype( fieldvalue.str, fieldvalue.len, rec.person);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'animate',7) = 0 THEN BEGIN
         result := LSSTRTOTYPE_animatetype( fieldvalue.str, fieldvalue.len, rec.animate);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'possRform',9) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.possRform := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.possRform := FALSE; result := TRUE 
         END;
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'generalized',11) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.generalized := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.generalized := FALSE; result := TRUE 
         END;
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'NPhead',6) = 0 THEN BEGIN
         result := LSSTRTOTYPE_npheadtype( fieldvalue.str, fieldvalue.len, rec.NPhead);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'reduced',7) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.reduced := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.reduced := FALSE; result := TRUE 
         END;
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'persprocases',12) = 0 THEN BEGIN
         setp := setvalue;
         rec.persprocases := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_casetype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         persprocases);
            IF result THEN BEGIN
               rec.persprocases := rec.persprocases + [persprocases];
            END;
            setp := setp^.NextValue         END

         END;
      END;
      attr^.Error := (NOT result);
      attr := attr^.NextAttr
   END;
   LSCONVATTR_PERSPROrecord := result;
END {LSCONVATTR_PERSPROrecord};

FUNCTION LSCONVATTR_POSrecord(VAR rec: LSDOMAINT_POSrecord;
                  VAR pattr: LDCONVREC_pAttrStruct): BOOLEAN;
VAR result : BOOLEAN;
    setp   : LDCONVREC_pSetValueType;
    attr   : LDCONVREC_pAttrStruct;

BEGIN
   result := TRUE; attr := pattr;
   MAKET_POSVARrec(rec);
   WHILE (attr <> NIL) AND result DO BEGIN
   WITH attr^ DO BEGIN
      IF FALSE THEN BEGIN
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                          'KEY', 3) = 0 THEN BEGIN
         result := STR_StrToInteger(fieldvalue.str,
                                 fieldvalue.len, rec.key);
         END;
      END;
      attr^.Error := (NOT result);
      attr := attr^.NextAttr
   END;
   LSCONVATTR_POSrecord := result;
END {LSCONVATTR_POSrecord};

FUNCTION LSCONVATTR_POSSADJrecord(VAR rec: LSDOMAINT_POSSADJrecord;
                  VAR pattr: LDCONVREC_pAttrStruct): BOOLEAN;
VAR result : BOOLEAN;
    setp   : LDCONVREC_pSetValueType;
    attr   : LDCONVREC_pAttrStruct;

BEGIN
   result := TRUE; attr := pattr;
   MAKET_POSSADJrec(rec);
   WHILE (attr <> NIL) AND result DO BEGIN
   WITH attr^ DO BEGIN
      IF FALSE THEN BEGIN
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'antecedent',10) = 0 THEN BEGIN
         result := LSSTRTOTYPE_antecedenttype( fieldvalue.str, fieldvalue.len, rec.antecedent);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'eORenForm',9) = 0 THEN BEGIN
         result := LSSTRTOTYPE_eorenformtype( fieldvalue.str, fieldvalue.len, rec.eORenForm);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'reduced',7) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.reduced := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.reduced := FALSE; result := TRUE 
         END;
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'mood',4) = 0 THEN BEGIN
         result := LSSTRTOTYPE_xpmoodtype( fieldvalue.str, fieldvalue.len, rec.mood);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'geni',4) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.geni := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.geni := FALSE; result := TRUE 
         END;
         END;
      END;
      attr^.Error := (NOT result);
      attr := attr^.NextAttr
   END;
   LSCONVATTR_POSSADJrecord := result;
END {LSCONVATTR_POSSADJrecord};

FUNCTION LSCONVATTR_POSSPROrecord(VAR rec: LSDOMAINT_POSSPROrecord;
                  VAR pattr: LDCONVREC_pAttrStruct): BOOLEAN;
VAR result : BOOLEAN;
    setp   : LDCONVREC_pSetValueType;
    attr   : LDCONVREC_pAttrStruct;

BEGIN
   result := TRUE; attr := pattr;
   MAKET_POSSPROrec(rec);
   WHILE (attr <> NIL) AND result DO BEGIN
   WITH attr^ DO BEGIN
      IF FALSE THEN BEGIN
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'nForm',5) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.nForm := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.nForm := FALSE; result := TRUE 
         END;
         END;
      END;
      attr^.Error := (NOT result);
      attr := attr^.NextAttr
   END;
   LSCONVATTR_POSSPROrecord := result;
END {LSCONVATTR_POSSPROrecord};

FUNCTION LSCONVATTR_PREPrecord(VAR rec: LSDOMAINT_PREPrecord;
                  VAR pattr: LDCONVREC_pAttrStruct): BOOLEAN;
VAR result : BOOLEAN;
    setp   : LDCONVREC_pSetValueType;
    attr   : LDCONVREC_pAttrStruct;

    req : LSDOMAINT_polaritytype; 
    env : LSDOMAINT_polaritytype; 
    subcs : LSDOMAINT_prepsubctype; 
    synpps : LSDOMAINT_synpatterntype; 
BEGIN
   result := TRUE; attr := pattr;
   MAKET_PREPrec(rec);
   WHILE (attr <> NIL) AND result DO BEGIN
   WITH attr^ DO BEGIN
      IF FALSE THEN BEGIN
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                          'KEY', 3) = 0 THEN BEGIN
         result := STR_StrToInteger(fieldvalue.str,
                                 fieldvalue.len, rec.key);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'req',3) = 0 THEN BEGIN
         setp := setvalue;
         rec.req := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_polaritytype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         req);
            IF result THEN BEGIN
               rec.req := rec.req + [req];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'env',3) = 0 THEN BEGIN
         setp := setvalue;
         rec.env := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_polaritytype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         env);
            IF result THEN BEGIN
               rec.env := rec.env + [env];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'subcs',5) = 0 THEN BEGIN
         setp := setvalue;
         rec.subcs := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_prepsubctype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         subcs);
            IF result THEN BEGIN
               rec.subcs := rec.subcs + [subcs];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'preptype',8) = 0 THEN BEGIN
         result := LSSTRTOTYPE_preptypetype( fieldvalue.str, fieldvalue.len, rec.preptype);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'postpkey',8) = 0 THEN BEGIN
         result := STR_StrToInteger(fieldvalue.str, fieldvalue.len, rec.postpkey);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'synpps',6) = 0 THEN BEGIN
         setp := setvalue;
         rec.synpps := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_synpatterntype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         synpps);
            IF result THEN BEGIN
               rec.synpps := rec.synpps + [synpps];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'thetapp',7) = 0 THEN BEGIN
         result := LSSTRTOTYPE_thetapptype( fieldvalue.str, fieldvalue.len, rec.thetapp);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'postform',8) = 0 THEN BEGIN
         result := LSSTRTOTYPE_postformtype( fieldvalue.str, fieldvalue.len, rec.postform);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'class',5) = 0 THEN BEGIN
         result := LSSTRTOTYPE_timeadvclasstype( fieldvalue.str, fieldvalue.len, rec.class);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'deixis',6) = 0 THEN BEGIN
         result := LSSTRTOTYPE_deixistype( fieldvalue.str, fieldvalue.len, rec.deixis);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'aspect',6) = 0 THEN BEGIN
         result := LSSTRTOTYPE_aspecttype( fieldvalue.str, fieldvalue.len, rec.aspect);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'retro',5) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.retro := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.retro := FALSE; result := TRUE 
         END;
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'secondprep',10) = 0 THEN BEGIN
         result := STR_StrToInteger(fieldvalue.str, fieldvalue.len, rec.secondprep);
         END;
      END;
      attr^.Error := (NOT result);
      attr := attr^.NextAttr
   END;
   LSCONVATTR_PREPrecord := result;
END {LSCONVATTR_PREPrecord};

FUNCTION LSCONVATTR_PREPPrecord(VAR rec: LSDOMAINT_PREPPrecord;
                  VAR pattr: LDCONVREC_pAttrStruct): BOOLEAN;
VAR result : BOOLEAN;
    setp   : LDCONVREC_pSetValueType;
    attr   : LDCONVREC_pAttrStruct;

    req : LSDOMAINT_polaritytype; 
    env : LSDOMAINT_polaritytype; 
    actsubcefs : LSDOMAINT_prepsubctype; 
    synppefs : LSDOMAINT_synpatterntype; 
BEGIN
   result := TRUE; attr := pattr;
   MAKET_VARPREPPrec(rec);
   WHILE (attr <> NIL) AND result DO BEGIN
   WITH attr^ DO BEGIN
      IF FALSE THEN BEGIN
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'req',3) = 0 THEN BEGIN
         setp := setvalue;
         rec.req := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_polaritytype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         req);
            IF result THEN BEGIN
               rec.req := rec.req + [req];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'env',3) = 0 THEN BEGIN
         setp := setvalue;
         rec.env := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_polaritytype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         env);
            IF result THEN BEGIN
               rec.env := rec.env + [env];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'mood',4) = 0 THEN BEGIN
         result := LSSTRTOTYPE_xpmoodtype( fieldvalue.str, fieldvalue.len, rec.mood);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'actsubcefs',10) = 0 THEN BEGIN
         setp := setvalue;
         rec.actsubcefs := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_prepsubctype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         actsubcefs);
            IF result THEN BEGIN
               rec.actsubcefs := rec.actsubcefs + [actsubcefs];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'synppefs',8) = 0 THEN BEGIN
         setp := setvalue;
         rec.synppefs := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_synpatterntype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         synppefs);
            IF result THEN BEGIN
               rec.synppefs := rec.synppefs + [synppefs];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'thetapp',7) = 0 THEN BEGIN
         result := LSSTRTOTYPE_thetapptype( fieldvalue.str, fieldvalue.len, rec.thetapp);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'headkey',7) = 0 THEN BEGIN
         result := STR_StrToInteger(fieldvalue.str, fieldvalue.len, rec.headkey);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'class',5) = 0 THEN BEGIN
         result := LSSTRTOTYPE_timeadvclasstype( fieldvalue.str, fieldvalue.len, rec.class);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'deixis',6) = 0 THEN BEGIN
         result := LSSTRTOTYPE_deixistype( fieldvalue.str, fieldvalue.len, rec.deixis);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'aspect',6) = 0 THEN BEGIN
         result := LSSTRTOTYPE_aspecttype( fieldvalue.str, fieldvalue.len, rec.aspect);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'retro',5) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.retro := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.retro := FALSE; result := TRUE 
         END;
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'superdeixis',11) = 0 THEN BEGIN
         result := LSSTRTOTYPE_deixistype( fieldvalue.str, fieldvalue.len, rec.superdeixis);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'radvkey',7) = 0 THEN BEGIN
         result := STR_StrToInteger(fieldvalue.str, fieldvalue.len, rec.radvkey);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'stranded',8) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.stranded := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.stranded := FALSE; result := TRUE 
         END;
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'specQ',5) = 0 THEN BEGIN
         result := LSSTRTOTYPE_specqtype( fieldvalue.str, fieldvalue.len, rec.specQ);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'coord',5) = 0 THEN BEGIN
         result := LSSTRTOTYPE_coordtype( fieldvalue.str, fieldvalue.len, rec.coord);
         END;
      END;
      attr^.Error := (NOT result);
      attr := attr^.NextAttr
   END;
   LSCONVATTR_PREPPrecord := result;
END {LSCONVATTR_PREPPrecord};

FUNCTION LSCONVATTR_PREPPVARrecord(VAR rec: LSDOMAINT_PREPPVARrecord;
                  VAR pattr: LDCONVREC_pAttrStruct): BOOLEAN;
VAR result : BOOLEAN;
    setp   : LDCONVREC_pSetValueType;
    attr   : LDCONVREC_pAttrStruct;

    req : LSDOMAINT_polaritytype; 
    env : LSDOMAINT_polaritytype; 
    actsubcefs : LSDOMAINT_prepsubctype; 
    synppefs : LSDOMAINT_synpatterntype; 
BEGIN
   result := TRUE; attr := pattr;
   MAKET_PREPPVARrec(rec);
   WHILE (attr <> NIL) AND result DO BEGIN
   WITH attr^ DO BEGIN
      IF FALSE THEN BEGIN
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'req',3) = 0 THEN BEGIN
         setp := setvalue;
         rec.req := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_polaritytype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         req);
            IF result THEN BEGIN
               rec.req := rec.req + [req];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'env',3) = 0 THEN BEGIN
         setp := setvalue;
         rec.env := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_polaritytype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         env);
            IF result THEN BEGIN
               rec.env := rec.env + [env];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'mood',4) = 0 THEN BEGIN
         result := LSSTRTOTYPE_xpmoodtype( fieldvalue.str, fieldvalue.len, rec.mood);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'actsubcefs',10) = 0 THEN BEGIN
         setp := setvalue;
         rec.actsubcefs := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_prepsubctype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         actsubcefs);
            IF result THEN BEGIN
               rec.actsubcefs := rec.actsubcefs + [actsubcefs];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'synppefs',8) = 0 THEN BEGIN
         setp := setvalue;
         rec.synppefs := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_synpatterntype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         synppefs);
            IF result THEN BEGIN
               rec.synppefs := rec.synppefs + [synppefs];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'thetapp',7) = 0 THEN BEGIN
         result := LSSTRTOTYPE_thetapptype( fieldvalue.str, fieldvalue.len, rec.thetapp);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'headkey',7) = 0 THEN BEGIN
         result := STR_StrToInteger(fieldvalue.str, fieldvalue.len, rec.headkey);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'class',5) = 0 THEN BEGIN
         result := LSSTRTOTYPE_timeadvclasstype( fieldvalue.str, fieldvalue.len, rec.class);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'deixis',6) = 0 THEN BEGIN
         result := LSSTRTOTYPE_deixistype( fieldvalue.str, fieldvalue.len, rec.deixis);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'aspect',6) = 0 THEN BEGIN
         result := LSSTRTOTYPE_aspecttype( fieldvalue.str, fieldvalue.len, rec.aspect);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'retro',5) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.retro := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.retro := FALSE; result := TRUE 
         END;
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'superdeixis',11) = 0 THEN BEGIN
         result := LSSTRTOTYPE_deixistype( fieldvalue.str, fieldvalue.len, rec.superdeixis);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'radvkey',7) = 0 THEN BEGIN
         result := STR_StrToInteger(fieldvalue.str, fieldvalue.len, rec.radvkey);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'stranded',8) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.stranded := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.stranded := FALSE; result := TRUE 
         END;
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'specQ',5) = 0 THEN BEGIN
         result := LSSTRTOTYPE_specqtype( fieldvalue.str, fieldvalue.len, rec.specQ);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'coord',5) = 0 THEN BEGIN
         result := LSSTRTOTYPE_coordtype( fieldvalue.str, fieldvalue.len, rec.coord);
         END;
      END;
      attr^.Error := (NOT result);
      attr := attr^.NextAttr
   END;
   LSCONVATTR_PREPPVARrecord := result;
END {LSCONVATTR_PREPPVARrecord};

FUNCTION LSCONVATTR_PREPPPROPrecord(VAR rec: LSDOMAINT_PREPPPROPrecord;
                  VAR pattr: LDCONVREC_pAttrStruct): BOOLEAN;
VAR result : BOOLEAN;
    setp   : LDCONVREC_pSetValueType;
    attr   : LDCONVREC_pAttrStruct;

    req : LSDOMAINT_polaritytype; 
    env : LSDOMAINT_polaritytype; 
    actsubcefs : LSDOMAINT_prepsubctype; 
    synppefs : LSDOMAINT_synpatterntype; 
    aktionsarts : LSDOMAINT_aktionsarttype; 
BEGIN
   result := TRUE; attr := pattr;
   MAKET_CLOSEDPREPPPROPrec(rec);
   WHILE (attr <> NIL) AND result DO BEGIN
   WITH attr^ DO BEGIN
      IF FALSE THEN BEGIN
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'req',3) = 0 THEN BEGIN
         setp := setvalue;
         rec.req := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_polaritytype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         req);
            IF result THEN BEGIN
               rec.req := rec.req + [req];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'env',3) = 0 THEN BEGIN
         setp := setvalue;
         rec.env := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_polaritytype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         env);
            IF result THEN BEGIN
               rec.env := rec.env + [env];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'mood',4) = 0 THEN BEGIN
         result := LSSTRTOTYPE_xpmoodtype( fieldvalue.str, fieldvalue.len, rec.mood);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'actsubcefs',10) = 0 THEN BEGIN
         setp := setvalue;
         rec.actsubcefs := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_prepsubctype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         actsubcefs);
            IF result THEN BEGIN
               rec.actsubcefs := rec.actsubcefs + [actsubcefs];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'PROsubject',10) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.PROsubject := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.PROsubject := FALSE; result := TRUE 
         END;
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'synppefs',8) = 0 THEN BEGIN
         setp := setvalue;
         rec.synppefs := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_synpatterntype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         synppefs);
            IF result THEN BEGIN
               rec.synppefs := rec.synppefs + [synppefs];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'thetapp',7) = 0 THEN BEGIN
         result := LSSTRTOTYPE_thetapptype( fieldvalue.str, fieldvalue.len, rec.thetapp);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'headkey',7) = 0 THEN BEGIN
         result := STR_StrToInteger(fieldvalue.str, fieldvalue.len, rec.headkey);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'class',5) = 0 THEN BEGIN
         result := LSSTRTOTYPE_timeadvclasstype( fieldvalue.str, fieldvalue.len, rec.class);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'deixis',6) = 0 THEN BEGIN
         result := LSSTRTOTYPE_deixistype( fieldvalue.str, fieldvalue.len, rec.deixis);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'aspect',6) = 0 THEN BEGIN
         result := LSSTRTOTYPE_aspecttype( fieldvalue.str, fieldvalue.len, rec.aspect);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'retro',5) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.retro := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.retro := FALSE; result := TRUE 
         END;
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'aktionsarts',11) = 0 THEN BEGIN
         setp := setvalue;
         rec.aktionsarts := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_aktionsarttype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         aktionsarts);
            IF result THEN BEGIN
               rec.aktionsarts := rec.aktionsarts + [aktionsarts];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'superdeixis',11) = 0 THEN BEGIN
         result := LSSTRTOTYPE_deixistype( fieldvalue.str, fieldvalue.len, rec.superdeixis);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'specq',5) = 0 THEN BEGIN
         result := LSSTRTOTYPE_specqtype( fieldvalue.str, fieldvalue.len, rec.specq);
         END;
      END;
      attr^.Error := (NOT result);
      attr := attr^.NextAttr
   END;
   LSCONVATTR_PREPPPROPrecord := result;
END {LSCONVATTR_PREPPPROPrecord};

FUNCTION LSCONVATTR_PREPPPROPVARrecord(VAR rec: LSDOMAINT_PREPPPROPVARrecord;
                  VAR pattr: LDCONVREC_pAttrStruct): BOOLEAN;
VAR result : BOOLEAN;
    setp   : LDCONVREC_pSetValueType;
    attr   : LDCONVREC_pAttrStruct;

    req : LSDOMAINT_polaritytype; 
    env : LSDOMAINT_polaritytype; 
    actsubcefs : LSDOMAINT_prepsubctype; 
    synppefs : LSDOMAINT_synpatterntype; 
    aktionsarts : LSDOMAINT_aktionsarttype; 
BEGIN
   result := TRUE; attr := pattr;
   MAKET_PREPPPROPVARrec(rec);
   WHILE (attr <> NIL) AND result DO BEGIN
   WITH attr^ DO BEGIN
      IF FALSE THEN BEGIN
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'req',3) = 0 THEN BEGIN
         setp := setvalue;
         rec.req := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_polaritytype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         req);
            IF result THEN BEGIN
               rec.req := rec.req + [req];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'env',3) = 0 THEN BEGIN
         setp := setvalue;
         rec.env := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_polaritytype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         env);
            IF result THEN BEGIN
               rec.env := rec.env + [env];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'mood',4) = 0 THEN BEGIN
         result := LSSTRTOTYPE_xpmoodtype( fieldvalue.str, fieldvalue.len, rec.mood);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'actsubcefs',10) = 0 THEN BEGIN
         setp := setvalue;
         rec.actsubcefs := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_prepsubctype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         actsubcefs);
            IF result THEN BEGIN
               rec.actsubcefs := rec.actsubcefs + [actsubcefs];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'PROsubject',10) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.PROsubject := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.PROsubject := FALSE; result := TRUE 
         END;
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'synppefs',8) = 0 THEN BEGIN
         setp := setvalue;
         rec.synppefs := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_synpatterntype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         synppefs);
            IF result THEN BEGIN
               rec.synppefs := rec.synppefs + [synppefs];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'thetapp',7) = 0 THEN BEGIN
         result := LSSTRTOTYPE_thetapptype( fieldvalue.str, fieldvalue.len, rec.thetapp);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'headkey',7) = 0 THEN BEGIN
         result := STR_StrToInteger(fieldvalue.str, fieldvalue.len, rec.headkey);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'class',5) = 0 THEN BEGIN
         result := LSSTRTOTYPE_timeadvclasstype( fieldvalue.str, fieldvalue.len, rec.class);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'deixis',6) = 0 THEN BEGIN
         result := LSSTRTOTYPE_deixistype( fieldvalue.str, fieldvalue.len, rec.deixis);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'aspect',6) = 0 THEN BEGIN
         result := LSSTRTOTYPE_aspecttype( fieldvalue.str, fieldvalue.len, rec.aspect);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'retro',5) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.retro := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.retro := FALSE; result := TRUE 
         END;
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'aktionsarts',11) = 0 THEN BEGIN
         setp := setvalue;
         rec.aktionsarts := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_aktionsarttype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         aktionsarts);
            IF result THEN BEGIN
               rec.aktionsarts := rec.aktionsarts + [aktionsarts];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'superdeixis',11) = 0 THEN BEGIN
         result := LSSTRTOTYPE_deixistype( fieldvalue.str, fieldvalue.len, rec.superdeixis);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'specq',5) = 0 THEN BEGIN
         result := LSSTRTOTYPE_specqtype( fieldvalue.str, fieldvalue.len, rec.specq);
         END;
      END;
      attr^.Error := (NOT result);
      attr := attr^.NextAttr
   END;
   LSCONVATTR_PREPPPROPVARrecord := result;
END {LSCONVATTR_PREPPPROPVARrecord};

FUNCTION LSCONVATTR_BPROPERNOUNrecord(VAR rec: LSDOMAINT_BPROPERNOUNrecord;
                  VAR pattr: LDCONVREC_pAttrStruct): BOOLEAN;
VAR result : BOOLEAN;
    setp   : LDCONVREC_pSetValueType;
    attr   : LDCONVREC_pAttrStruct;

    genders : LSDOMAINT_gendertype; 
    dimforms : LSDOMAINT_dimformtype; 
    pluralforms : LSDOMAINT_pluralformtype; 
    sexes : LSDOMAINT_sextype; 
BEGIN
   result := TRUE; attr := pattr;
   MAKET_BPROPERNOUNrec(rec);
   WHILE (attr <> NIL) AND result DO BEGIN
   WITH attr^ DO BEGIN
      IF FALSE THEN BEGIN
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                          'KEY', 3) = 0 THEN BEGIN
         result := STR_StrToInteger(fieldvalue.str,
                                 fieldvalue.len, rec.key);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'genders',7) = 0 THEN BEGIN
         setp := setvalue;
         rec.genders := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_gendertype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         genders);
            IF result THEN BEGIN
               rec.genders := rec.genders + [genders];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'dimforms',8) = 0 THEN BEGIN
         setp := setvalue;
         rec.dimforms := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_dimformtype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         dimforms);
            IF result THEN BEGIN
               rec.dimforms := rec.dimforms + [dimforms];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'pluralforms',11) = 0 THEN BEGIN
         setp := setvalue;
         rec.pluralforms := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_pluralformtype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         pluralforms);
            IF result THEN BEGIN
               rec.pluralforms := rec.pluralforms + [pluralforms];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'sexes',5) = 0 THEN BEGIN
         setp := setvalue;
         rec.sexes := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_sextype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         sexes);
            IF result THEN BEGIN
               rec.sexes := rec.sexes + [sexes];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'subc',4) = 0 THEN BEGIN
         result := LSSTRTOTYPE_nounsubctype( fieldvalue.str, fieldvalue.len, rec.subc);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'animate',7) = 0 THEN BEGIN
         result := LSSTRTOTYPE_animatetype( fieldvalue.str, fieldvalue.len, rec.animate);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'human',5) = 0 THEN BEGIN
         result := LSSTRTOTYPE_humantype( fieldvalue.str, fieldvalue.len, rec.human);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'temporal',8) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.temporal := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.temporal := FALSE; result := TRUE 
         END;
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'class',5) = 0 THEN BEGIN
         result := LSSTRTOTYPE_timeadvclasstype( fieldvalue.str, fieldvalue.len, rec.class);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'deixis',6) = 0 THEN BEGIN
         result := LSSTRTOTYPE_deixistype( fieldvalue.str, fieldvalue.len, rec.deixis);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'aspect',6) = 0 THEN BEGIN
         result := LSSTRTOTYPE_aspecttype( fieldvalue.str, fieldvalue.len, rec.aspect);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'retro',5) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.retro := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.retro := FALSE; result := TRUE 
         END;
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'possgeni',8) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.possgeni := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.possgeni := FALSE; result := TRUE 
         END;
         END;
      END;
      attr^.Error := (NOT result);
      attr := attr^.NextAttr
   END;
   LSCONVATTR_BPROPERNOUNrecord := result;
END {LSCONVATTR_BPROPERNOUNrecord};

FUNCTION LSCONVATTR_PROPERNOUNrecord(VAR rec: LSDOMAINT_PROPERNOUNrecord;
                  VAR pattr: LDCONVREC_pAttrStruct): BOOLEAN;
VAR result : BOOLEAN;
    setp   : LDCONVREC_pSetValueType;
    attr   : LDCONVREC_pAttrStruct;

    genders : LSDOMAINT_gendertype; 
    dimforms : LSDOMAINT_dimformtype; 
    pluralforms : LSDOMAINT_pluralformtype; 
    sexes : LSDOMAINT_sextype; 
BEGIN
   result := TRUE; attr := pattr;
   MAKET_PROPERNOUNrec(rec);
   WHILE (attr <> NIL) AND result DO BEGIN
   WITH attr^ DO BEGIN
      IF FALSE THEN BEGIN
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'genders',7) = 0 THEN BEGIN
         setp := setvalue;
         rec.genders := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_gendertype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         genders);
            IF result THEN BEGIN
               rec.genders := rec.genders + [genders];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'number',6) = 0 THEN BEGIN
         result := LSSTRTOTYPE_numbertype( fieldvalue.str, fieldvalue.len, rec.number);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'dimforms',8) = 0 THEN BEGIN
         setp := setvalue;
         rec.dimforms := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_dimformtype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         dimforms);
            IF result THEN BEGIN
               rec.dimforms := rec.dimforms + [dimforms];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'pluralforms',11) = 0 THEN BEGIN
         setp := setvalue;
         rec.pluralforms := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_pluralformtype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         pluralforms);
            IF result THEN BEGIN
               rec.pluralforms := rec.pluralforms + [pluralforms];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'sexes',5) = 0 THEN BEGIN
         setp := setvalue;
         rec.sexes := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_sextype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         sexes);
            IF result THEN BEGIN
               rec.sexes := rec.sexes + [sexes];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'subc',4) = 0 THEN BEGIN
         result := LSSTRTOTYPE_nounsubctype( fieldvalue.str, fieldvalue.len, rec.subc);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'animate',7) = 0 THEN BEGIN
         result := LSSTRTOTYPE_animatetype( fieldvalue.str, fieldvalue.len, rec.animate);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'human',5) = 0 THEN BEGIN
         result := LSSTRTOTYPE_humantype( fieldvalue.str, fieldvalue.len, rec.human);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'temporal',8) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.temporal := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.temporal := FALSE; result := TRUE 
         END;
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'class',5) = 0 THEN BEGIN
         result := LSSTRTOTYPE_timeadvclasstype( fieldvalue.str, fieldvalue.len, rec.class);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'deixis',6) = 0 THEN BEGIN
         result := LSSTRTOTYPE_deixistype( fieldvalue.str, fieldvalue.len, rec.deixis);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'aspect',6) = 0 THEN BEGIN
         result := LSSTRTOTYPE_aspecttype( fieldvalue.str, fieldvalue.len, rec.aspect);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'retro',5) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.retro := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.retro := FALSE; result := TRUE 
         END;
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'possgeni',8) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.possgeni := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.possgeni := FALSE; result := TRUE 
         END;
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'geni',4) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.geni := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.geni := FALSE; result := TRUE 
         END;
         END;
      END;
      attr^.Error := (NOT result);
      attr := attr^.NextAttr
   END;
   LSCONVATTR_PROPERNOUNrecord := result;
END {LSCONVATTR_PROPERNOUNrecord};

FUNCTION LSCONVATTR_PUNCrecord(VAR rec: LSDOMAINT_PUNCrecord;
                  VAR pattr: LDCONVREC_pAttrStruct): BOOLEAN;
VAR result : BOOLEAN;
    setp   : LDCONVREC_pSetValueType;
    attr   : LDCONVREC_pAttrStruct;

BEGIN
   result := TRUE; attr := pattr;
   MAKET_PUNCrec(rec);
   WHILE (attr <> NIL) AND result DO BEGIN
   WITH attr^ DO BEGIN
      IF FALSE THEN BEGIN
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                          'KEY', 3) = 0 THEN BEGIN
         result := STR_StrToInteger(fieldvalue.str,
                                 fieldvalue.len, rec.key);
         END;
      END;
      attr^.Error := (NOT result);
      attr := attr^.NextAttr
   END;
   LSCONVATTR_PUNCrecord := result;
END {LSCONVATTR_PUNCrecord};

FUNCTION LSCONVATTR_PROSENTrecord(VAR rec: LSDOMAINT_PROSENTrecord;
                  VAR pattr: LDCONVREC_pAttrStruct): BOOLEAN;
VAR result : BOOLEAN;
    setp   : LDCONVREC_pSetValueType;
    attr   : LDCONVREC_pAttrStruct;

BEGIN
   result := TRUE; attr := pattr;
   MAKET_PROSENTrec(rec);
   WHILE (attr <> NIL) AND result DO BEGIN
   WITH attr^ DO BEGIN
      IF FALSE THEN BEGIN
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                          'KEY', 3) = 0 THEN BEGIN
         result := STR_StrToInteger(fieldvalue.str,
                                 fieldvalue.len, rec.key);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'so',2) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.so := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.so := FALSE; result := TRUE 
         END;
         END;
      END;
      attr^.Error := (NOT result);
      attr := attr^.NextAttr
   END;
   LSCONVATTR_PROSENTrecord := result;
END {LSCONVATTR_PROSENTrecord};

FUNCTION LSCONVATTR_PROSENTVARrecord(VAR rec: LSDOMAINT_PROSENTVARrecord;
                  VAR pattr: LDCONVREC_pAttrStruct): BOOLEAN;
VAR result : BOOLEAN;
    setp   : LDCONVREC_pSetValueType;
    attr   : LDCONVREC_pAttrStruct;

BEGIN
   result := TRUE; attr := pattr;
   MAKET_PROSENTVARrec(rec);
   WHILE (attr <> NIL) AND result DO BEGIN
   WITH attr^ DO BEGIN
      IF FALSE THEN BEGIN
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'so',2) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.so := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.so := FALSE; result := TRUE 
         END;
         END;
      END;
      attr^.Error := (NOT result);
      attr := attr^.NextAttr
   END;
   LSCONVATTR_PROSENTVARrecord := result;
END {LSCONVATTR_PROSENTVARrecord};

FUNCTION LSCONVATTR_Qrecord(VAR rec: LSDOMAINT_Qrecord;
                  VAR pattr: LDCONVREC_pAttrStruct): BOOLEAN;
VAR result : BOOLEAN;
    setp   : LDCONVREC_pSetValueType;
    attr   : LDCONVREC_pAttrStruct;

    req : LSDOMAINT_polaritytype; 
    env : LSDOMAINT_polaritytype; 
    possnumbers : LSDOMAINT_numbertype; 
    posscomas : LSDOMAINT_posscomatype; 
BEGIN
   result := TRUE; attr := pattr;
   MAKET_Qrec(rec);
   WHILE (attr <> NIL) AND result DO BEGIN
   WITH attr^ DO BEGIN
      IF FALSE THEN BEGIN
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                          'KEY', 3) = 0 THEN BEGIN
         result := STR_StrToInteger(fieldvalue.str,
                                 fieldvalue.len, rec.key);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'req',3) = 0 THEN BEGIN
         setp := setvalue;
         rec.req := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_polaritytype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         req);
            IF result THEN BEGIN
               rec.req := rec.req + [req];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'env',3) = 0 THEN BEGIN
         setp := setvalue;
         rec.env := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_polaritytype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         env);
            IF result THEN BEGIN
               rec.env := rec.env + [env];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'definite',8) = 0 THEN BEGIN
         result := LSSTRTOTYPE_deftype( fieldvalue.str, fieldvalue.len, rec.definite);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'posspred',8) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.posspred := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.posspred := FALSE; result := TRUE 
         END;
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'possnumbers',11) = 0 THEN BEGIN
         setp := setvalue;
         rec.possnumbers := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_numbertype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         possnumbers);
            IF result THEN BEGIN
               rec.possnumbers := rec.possnumbers + [possnumbers];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'posscomas',9) = 0 THEN BEGIN
         setp := setvalue;
         rec.posscomas := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_posscomatype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         posscomas);
            IF result THEN BEGIN
               rec.posscomas := rec.posscomas + [posscomas];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'mood',4) = 0 THEN BEGIN
         result := LSSTRTOTYPE_xpmoodtype( fieldvalue.str, fieldvalue.len, rec.mood);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'thanas',6) = 0 THEN BEGIN
         result := LSSTRTOTYPE_thanascompltype( fieldvalue.str, fieldvalue.len, rec.thanas);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'hop',3) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.hop := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.hop := FALSE; result := TRUE 
         END;
         END;
      END;
      attr^.Error := (NOT result);
      attr := attr^.NextAttr
   END;
   LSCONVATTR_Qrecord := result;
END {LSCONVATTR_Qrecord};

FUNCTION LSCONVATTR_QPrecord(VAR rec: LSDOMAINT_QPrecord;
                  VAR pattr: LDCONVREC_pAttrStruct): BOOLEAN;
VAR result : BOOLEAN;
    setp   : LDCONVREC_pSetValueType;
    attr   : LDCONVREC_pAttrStruct;

    req : LSDOMAINT_polaritytype; 
    env : LSDOMAINT_polaritytype; 
    possnumbers : LSDOMAINT_numbertype; 
    posscomas : LSDOMAINT_posscomatype; 
BEGIN
   result := TRUE; attr := pattr;
   MAKET_QPrec(rec);
   WHILE (attr <> NIL) AND result DO BEGIN
   WITH attr^ DO BEGIN
      IF FALSE THEN BEGIN
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'req',3) = 0 THEN BEGIN
         setp := setvalue;
         rec.req := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_polaritytype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         req);
            IF result THEN BEGIN
               rec.req := rec.req + [req];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'env',3) = 0 THEN BEGIN
         setp := setvalue;
         rec.env := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_polaritytype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         env);
            IF result THEN BEGIN
               rec.env := rec.env + [env];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'definite',8) = 0 THEN BEGIN
         result := LSSTRTOTYPE_deftype( fieldvalue.str, fieldvalue.len, rec.definite);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'posspred',8) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.posspred := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.posspred := FALSE; result := TRUE 
         END;
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'possnumbers',11) = 0 THEN BEGIN
         setp := setvalue;
         rec.possnumbers := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_numbertype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         possnumbers);
            IF result THEN BEGIN
               rec.possnumbers := rec.possnumbers + [possnumbers];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'posscomas',9) = 0 THEN BEGIN
         setp := setvalue;
         rec.posscomas := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_posscomatype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         posscomas);
            IF result THEN BEGIN
               rec.posscomas := rec.posscomas + [posscomas];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'mood',4) = 0 THEN BEGIN
         result := LSSTRTOTYPE_xpmoodtype( fieldvalue.str, fieldvalue.len, rec.mood);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'thanas',6) = 0 THEN BEGIN
         result := LSSTRTOTYPE_thanascompltype( fieldvalue.str, fieldvalue.len, rec.thanas);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'thanascompl',11) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.thanascompl := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.thanascompl := FALSE; result := TRUE 
         END;
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'hop',3) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.hop := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.hop := FALSE; result := TRUE 
         END;
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'superdeixis',11) = 0 THEN BEGIN
         result := LSSTRTOTYPE_deixistype( fieldvalue.str, fieldvalue.len, rec.superdeixis);
         END;
      END;
      attr^.Error := (NOT result);
      attr := attr^.NextAttr
   END;
   LSCONVATTR_QPrecord := result;
END {LSCONVATTR_QPrecord};

FUNCTION LSCONVATTR_RECIPROrecord(VAR rec: LSDOMAINT_RECIPROrecord;
                  VAR pattr: LDCONVREC_pAttrStruct): BOOLEAN;
VAR result : BOOLEAN;
    setp   : LDCONVREC_pSetValueType;
    attr   : LDCONVREC_pAttrStruct;

BEGIN
   result := TRUE; attr := pattr;
   MAKET_RECIPROrec(rec);
   WHILE (attr <> NIL) AND result DO BEGIN
   WITH attr^ DO BEGIN
      IF FALSE THEN BEGIN
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                          'KEY', 3) = 0 THEN BEGIN
         result := STR_StrToInteger(fieldvalue.str,
                                 fieldvalue.len, rec.key);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'antecedent',10) = 0 THEN BEGIN
         result := LSSTRTOTYPE_antecedenttype( fieldvalue.str, fieldvalue.len, rec.antecedent);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'geni',4) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.geni := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.geni := FALSE; result := TRUE 
         END;
         END;
      END;
      attr^.Error := (NOT result);
      attr := attr^.NextAttr
   END;
   LSCONVATTR_RECIPROrecord := result;
END {LSCONVATTR_RECIPROrecord};

FUNCTION LSCONVATTR_REFLPROrecord(VAR rec: LSDOMAINT_REFLPROrecord;
                  VAR pattr: LDCONVREC_pAttrStruct): BOOLEAN;
VAR result : BOOLEAN;
    setp   : LDCONVREC_pSetValueType;
    attr   : LDCONVREC_pAttrStruct;

BEGIN
   result := TRUE; attr := pattr;
   MAKET_REFLPROrec(rec);
   WHILE (attr <> NIL) AND result DO BEGIN
   WITH attr^ DO BEGIN
      IF FALSE THEN BEGIN
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                          'KEY', 3) = 0 THEN BEGIN
         result := STR_StrToInteger(fieldvalue.str,
                                 fieldvalue.len, rec.key);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'antecedent',10) = 0 THEN BEGIN
         result := LSSTRTOTYPE_antecedenttype( fieldvalue.str, fieldvalue.len, rec.antecedent);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'number',6) = 0 THEN BEGIN
         result := LSSTRTOTYPE_numbertype( fieldvalue.str, fieldvalue.len, rec.number);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'person',6) = 0 THEN BEGIN
         result := LSSTRTOTYPE_persontype( fieldvalue.str, fieldvalue.len, rec.person);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'reduced',7) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.reduced := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.reduced := FALSE; result := TRUE 
         END;
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'zelf',4) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.zelf := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.zelf := FALSE; result := TRUE 
         END;
         END;
      END;
      attr^.Error := (NOT result);
      attr := attr^.NextAttr
   END;
   LSCONVATTR_REFLPROrecord := result;
END {LSCONVATTR_REFLPROrecord};

FUNCTION LSCONVATTR_RELANTPROrecord(VAR rec: LSDOMAINT_RELANTPROrecord;
                  VAR pattr: LDCONVREC_pAttrStruct): BOOLEAN;
VAR result : BOOLEAN;
    setp   : LDCONVREC_pSetValueType;
    attr   : LDCONVREC_pAttrStruct;

BEGIN
   result := TRUE; attr := pattr;
   MAKET_RELANTPROrec(rec);
   WHILE (attr <> NIL) AND result DO BEGIN
   WITH attr^ DO BEGIN
      IF FALSE THEN BEGIN
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                          'KEY', 3) = 0 THEN BEGIN
         result := STR_StrToInteger(fieldvalue.str,
                                 fieldvalue.len, rec.key);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'nForm',5) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.nForm := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.nForm := FALSE; result := TRUE 
         END;
         END;
      END;
      attr^.Error := (NOT result);
      attr := attr^.NextAttr
   END;
   LSCONVATTR_RELANTPROrecord := result;
END {LSCONVATTR_RELANTPROrecord};

FUNCTION LSCONVATTR_RELPROrecord(VAR rec: LSDOMAINT_RELPROrecord;
                  VAR pattr: LDCONVREC_pAttrStruct): BOOLEAN;
VAR result : BOOLEAN;
    setp   : LDCONVREC_pSetValueType;
    attr   : LDCONVREC_pAttrStruct;

BEGIN
   result := TRUE; attr := pattr;
   MAKET_RELPROrec(rec);
   WHILE (attr <> NIL) AND result DO BEGIN
   WITH attr^ DO BEGIN
      IF FALSE THEN BEGIN
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                          'KEY', 3) = 0 THEN BEGIN
         result := STR_StrToInteger(fieldvalue.str,
                                 fieldvalue.len, rec.key);
         END;
      END;
      attr^.Error := (NOT result);
      attr := attr^.NextAttr
   END;
   LSCONVATTR_RELPROrecord := result;
END {LSCONVATTR_RELPROrecord};

FUNCTION LSCONVATTR_SENTENCErecord(VAR rec: LSDOMAINT_SENTENCErecord;
                  VAR pattr: LDCONVREC_pAttrStruct): BOOLEAN;
VAR result : BOOLEAN;
    setp   : LDCONVREC_pSetValueType;
    attr   : LDCONVREC_pAttrStruct;

    req : LSDOMAINT_polaritytype; 
    env : LSDOMAINT_polaritytype; 
    synvpefs : LSDOMAINT_synpatterntype; 
    adjuncts : LSDOMAINT_adjuncttype; 
    aktionsarts : LSDOMAINT_aktionsarttype; 
BEGIN
   result := TRUE; attr := pattr;
   MAKET_SENTENCErec(rec);
   WHILE (attr <> NIL) AND result DO BEGIN
   WITH attr^ DO BEGIN
      IF FALSE THEN BEGIN
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'req',3) = 0 THEN BEGIN
         setp := setvalue;
         rec.req := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_polaritytype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         req);
            IF result THEN BEGIN
               rec.req := rec.req + [req];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'env',3) = 0 THEN BEGIN
         setp := setvalue;
         rec.env := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_polaritytype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         env);
            IF result THEN BEGIN
               rec.env := rec.env + [env];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'mood',4) = 0 THEN BEGIN
         result := LSSTRTOTYPE_moodtype( fieldvalue.str, fieldvalue.len, rec.mood);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'senttype',8) = 0 THEN BEGIN
         result := LSSTRTOTYPE_senttypetype( fieldvalue.str, fieldvalue.len, rec.senttype);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'voice',5) = 0 THEN BEGIN
         result := LSSTRTOTYPE_voicetype( fieldvalue.str, fieldvalue.len, rec.voice);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'PROsubject',10) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.PROsubject := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.PROsubject := FALSE; result := TRUE 
         END;
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'synvpefs',8) = 0 THEN BEGIN
         setp := setvalue;
         rec.synvpefs := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_synpatterntype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         synvpefs);
            IF result THEN BEGIN
               rec.synvpefs := rec.synvpefs + [synvpefs];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'thetavp',7) = 0 THEN BEGIN
         result := LSSTRTOTYPE_thetavptype( fieldvalue.str, fieldvalue.len, rec.thetavp);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'adjuncts',8) = 0 THEN BEGIN
         setp := setvalue;
         rec.adjuncts := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_adjuncttype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         adjuncts);
            IF result THEN BEGIN
               rec.adjuncts := rec.adjuncts + [adjuncts];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'modus',5) = 0 THEN BEGIN
         result := LSSTRTOTYPE_modustype( fieldvalue.str, fieldvalue.len, rec.modus);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'aktionsarts',11) = 0 THEN BEGIN
         setp := setvalue;
         rec.aktionsarts := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_aktionsarttype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         aktionsarts);
            IF result THEN BEGIN
               rec.aktionsarts := rec.aktionsarts + [aktionsarts];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'aspect',6) = 0 THEN BEGIN
         result := LSSTRTOTYPE_aspecttype( fieldvalue.str, fieldvalue.len, rec.aspect);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'deixis',6) = 0 THEN BEGIN
         result := LSSTRTOTYPE_deixistype( fieldvalue.str, fieldvalue.len, rec.deixis);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'retro',5) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.retro := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.retro := FALSE; result := TRUE 
         END;
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'finiteness',10) = 0 THEN BEGIN
         result := LSSTRTOTYPE_finitenesstype( fieldvalue.str, fieldvalue.len, rec.finiteness);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'infsort',7) = 0 THEN BEGIN
         result := LSSTRTOTYPE_inftype( fieldvalue.str, fieldvalue.len, rec.infsort);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'superdeixis',11) = 0 THEN BEGIN
         result := LSSTRTOTYPE_deixistype( fieldvalue.str, fieldvalue.len, rec.superdeixis);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'VRcompl',7) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.VRcompl := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.VRcompl := FALSE; result := TRUE 
         END;
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'conjkey',7) = 0 THEN BEGIN
         result := STR_StrToInteger(fieldvalue.str, fieldvalue.len, rec.conjkey);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'adverbial',9) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.adverbial := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.adverbial := FALSE; result := TRUE 
         END;
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'temporal',8) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.temporal := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.temporal := FALSE; result := TRUE 
         END;
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'conjclass',9) = 0 THEN BEGIN
         result := LSSTRTOTYPE_timeadvclasstype( fieldvalue.str, fieldvalue.len, rec.conjclass);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'conjdeixis',10) = 0 THEN BEGIN
         result := LSSTRTOTYPE_deixistype( fieldvalue.str, fieldvalue.len, rec.conjdeixis);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'conjaspect',10) = 0 THEN BEGIN
         result := LSSTRTOTYPE_aspecttype( fieldvalue.str, fieldvalue.len, rec.conjaspect);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'conjretro',9) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.conjretro := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.conjretro := FALSE; result := TRUE 
         END;
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'coord',5) = 0 THEN BEGIN
         result := LSSTRTOTYPE_coordtype( fieldvalue.str, fieldvalue.len, rec.coord);
         END;
      END;
      attr^.Error := (NOT result);
      attr := attr^.NextAttr
   END;
   LSCONVATTR_SENTENCErecord := result;
END {LSCONVATTR_SENTENCErecord};

FUNCTION LSCONVATTR_SENTENCEVARrecord(VAR rec: LSDOMAINT_SENTENCEVARrecord;
                  VAR pattr: LDCONVREC_pAttrStruct): BOOLEAN;
VAR result : BOOLEAN;
    setp   : LDCONVREC_pSetValueType;
    attr   : LDCONVREC_pAttrStruct;

    req : LSDOMAINT_polaritytype; 
    env : LSDOMAINT_polaritytype; 
    synvpefs : LSDOMAINT_synpatterntype; 
    adjuncts : LSDOMAINT_adjuncttype; 
    aktionsarts : LSDOMAINT_aktionsarttype; 
BEGIN
   result := TRUE; attr := pattr;
   MAKET_SENTENCEVARrec(rec);
   WHILE (attr <> NIL) AND result DO BEGIN
   WITH attr^ DO BEGIN
      IF FALSE THEN BEGIN
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'req',3) = 0 THEN BEGIN
         setp := setvalue;
         rec.req := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_polaritytype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         req);
            IF result THEN BEGIN
               rec.req := rec.req + [req];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'env',3) = 0 THEN BEGIN
         setp := setvalue;
         rec.env := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_polaritytype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         env);
            IF result THEN BEGIN
               rec.env := rec.env + [env];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'mood',4) = 0 THEN BEGIN
         result := LSSTRTOTYPE_moodtype( fieldvalue.str, fieldvalue.len, rec.mood);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'senttype',8) = 0 THEN BEGIN
         result := LSSTRTOTYPE_senttypetype( fieldvalue.str, fieldvalue.len, rec.senttype);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'voice',5) = 0 THEN BEGIN
         result := LSSTRTOTYPE_voicetype( fieldvalue.str, fieldvalue.len, rec.voice);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'PROsubject',10) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.PROsubject := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.PROsubject := FALSE; result := TRUE 
         END;
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'synvpefs',8) = 0 THEN BEGIN
         setp := setvalue;
         rec.synvpefs := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_synpatterntype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         synvpefs);
            IF result THEN BEGIN
               rec.synvpefs := rec.synvpefs + [synvpefs];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'thetavp',7) = 0 THEN BEGIN
         result := LSSTRTOTYPE_thetavptype( fieldvalue.str, fieldvalue.len, rec.thetavp);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'adjuncts',8) = 0 THEN BEGIN
         setp := setvalue;
         rec.adjuncts := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_adjuncttype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         adjuncts);
            IF result THEN BEGIN
               rec.adjuncts := rec.adjuncts + [adjuncts];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'modus',5) = 0 THEN BEGIN
         result := LSSTRTOTYPE_modustype( fieldvalue.str, fieldvalue.len, rec.modus);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'aktionsarts',11) = 0 THEN BEGIN
         setp := setvalue;
         rec.aktionsarts := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_aktionsarttype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         aktionsarts);
            IF result THEN BEGIN
               rec.aktionsarts := rec.aktionsarts + [aktionsarts];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'aspect',6) = 0 THEN BEGIN
         result := LSSTRTOTYPE_aspecttype( fieldvalue.str, fieldvalue.len, rec.aspect);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'deixis',6) = 0 THEN BEGIN
         result := LSSTRTOTYPE_deixistype( fieldvalue.str, fieldvalue.len, rec.deixis);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'retro',5) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.retro := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.retro := FALSE; result := TRUE 
         END;
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'finiteness',10) = 0 THEN BEGIN
         result := LSSTRTOTYPE_finitenesstype( fieldvalue.str, fieldvalue.len, rec.finiteness);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'infsort',7) = 0 THEN BEGIN
         result := LSSTRTOTYPE_inftype( fieldvalue.str, fieldvalue.len, rec.infsort);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'superdeixis',11) = 0 THEN BEGIN
         result := LSSTRTOTYPE_deixistype( fieldvalue.str, fieldvalue.len, rec.superdeixis);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'VRcompl',7) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.VRcompl := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.VRcompl := FALSE; result := TRUE 
         END;
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'conjkey',7) = 0 THEN BEGIN
         result := STR_StrToInteger(fieldvalue.str, fieldvalue.len, rec.conjkey);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'adverbial',9) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.adverbial := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.adverbial := FALSE; result := TRUE 
         END;
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'temporal',8) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.temporal := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.temporal := FALSE; result := TRUE 
         END;
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'conjclass',9) = 0 THEN BEGIN
         result := LSSTRTOTYPE_timeadvclasstype( fieldvalue.str, fieldvalue.len, rec.conjclass);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'conjdeixis',10) = 0 THEN BEGIN
         result := LSSTRTOTYPE_deixistype( fieldvalue.str, fieldvalue.len, rec.conjdeixis);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'conjaspect',10) = 0 THEN BEGIN
         result := LSSTRTOTYPE_aspecttype( fieldvalue.str, fieldvalue.len, rec.conjaspect);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'conjretro',9) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.conjretro := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.conjretro := FALSE; result := TRUE 
         END;
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'coord',5) = 0 THEN BEGIN
         result := LSSTRTOTYPE_coordtype( fieldvalue.str, fieldvalue.len, rec.coord);
         END;
      END;
      attr^.Error := (NOT result);
      attr := attr^.NextAttr
   END;
   LSCONVATTR_SENTENCEVARrecord := result;
END {LSCONVATTR_SENTENCEVARrecord};

FUNCTION LSCONVATTR_TErecord(VAR rec: LSDOMAINT_TErecord;
                  VAR pattr: LDCONVREC_pAttrStruct): BOOLEAN;
VAR result : BOOLEAN;
    setp   : LDCONVREC_pSetValueType;
    attr   : LDCONVREC_pAttrStruct;

BEGIN
   result := TRUE; attr := pattr;
   MAKET_TErec(rec);
   WHILE (attr <> NIL) AND result DO BEGIN
   WITH attr^ DO BEGIN
      IF FALSE THEN BEGIN
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                          'KEY', 3) = 0 THEN BEGIN
         result := STR_StrToInteger(fieldvalue.str,
                                 fieldvalue.len, rec.key);
         END;
      END;
      attr^.Error := (NOT result);
      attr := attr^.NextAttr
   END;
   LSCONVATTR_TErecord := result;
END {LSCONVATTR_TErecord};

FUNCTION LSCONVATTR_THANASrecord(VAR rec: LSDOMAINT_THANASrecord;
                  VAR pattr: LDCONVREC_pAttrStruct): BOOLEAN;
VAR result : BOOLEAN;
    setp   : LDCONVREC_pSetValueType;
    attr   : LDCONVREC_pAttrStruct;

BEGIN
   result := TRUE; attr := pattr;
   MAKET_THANASrec(rec);
   WHILE (attr <> NIL) AND result DO BEGIN
   WITH attr^ DO BEGIN
      IF FALSE THEN BEGIN
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                          'KEY', 3) = 0 THEN BEGIN
         result := STR_StrToInteger(fieldvalue.str,
                                 fieldvalue.len, rec.key);
         END;
      END;
      attr^.Error := (NOT result);
      attr := attr^.NextAttr
   END;
   LSCONVATTR_THANASrecord := result;
END {LSCONVATTR_THANASrecord};

FUNCTION LSCONVATTR_THANPrecord(VAR rec: LSDOMAINT_THANPrecord;
                  VAR pattr: LDCONVREC_pAttrStruct): BOOLEAN;
VAR result : BOOLEAN;
    setp   : LDCONVREC_pSetValueType;
    attr   : LDCONVREC_pAttrStruct;

    req : LSDOMAINT_polaritytype; 
    env : LSDOMAINT_polaritytype; 
BEGIN
   result := TRUE; attr := pattr;
   MAKET_THANPrec(rec);
   WHILE (attr <> NIL) AND result DO BEGIN
   WITH attr^ DO BEGIN
      IF FALSE THEN BEGIN
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'thanas',6) = 0 THEN BEGIN
         result := LSSTRTOTYPE_thanascompltype( fieldvalue.str, fieldvalue.len, rec.thanas);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'req',3) = 0 THEN BEGIN
         setp := setvalue;
         rec.req := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_polaritytype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         req);
            IF result THEN BEGIN
               rec.req := rec.req + [req];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'env',3) = 0 THEN BEGIN
         setp := setvalue;
         rec.env := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_polaritytype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         env);
            IF result THEN BEGIN
               rec.env := rec.env + [env];
            END;
            setp := setp^.NextValue         END

         END;
      END;
      attr^.Error := (NOT result);
      attr := attr^.NextAttr
   END;
   LSCONVATTR_THANPrecord := result;
END {LSCONVATTR_THANPrecord};

FUNCTION LSCONVATTR_BVERBrecord(VAR rec: LSDOMAINT_BVERBrecord;
                  VAR pattr: LDCONVREC_pAttrStruct): BOOLEAN;
VAR result : BOOLEAN;
    setp   : LDCONVREC_pSetValueType;
    attr   : LDCONVREC_pAttrStruct;

    req : LSDOMAINT_polaritytype; 
    env : LSDOMAINT_polaritytype; 
    conjclasses : LSDOMAINT_conjclasstype; 
    possvoices : LSDOMAINT_voicetype; 
    synvps : LSDOMAINT_synpatterntype; 
    adjuncts : LSDOMAINT_adjuncttype; 
    perfauxs : LSDOMAINT_perfauxtype; 
    classes : LSDOMAINT_classtype; 
BEGIN
   result := TRUE; attr := pattr;
   MAKET_BVERBrec(rec);
   WHILE (attr <> NIL) AND result DO BEGIN
   WITH attr^ DO BEGIN
      IF FALSE THEN BEGIN
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                          'KEY', 3) = 0 THEN BEGIN
         result := STR_StrToInteger(fieldvalue.str,
                                 fieldvalue.len, rec.key);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'req',3) = 0 THEN BEGIN
         setp := setvalue;
         rec.req := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_polaritytype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         req);
            IF result THEN BEGIN
               rec.req := rec.req + [req];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'env',3) = 0 THEN BEGIN
         setp := setvalue;
         rec.env := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_polaritytype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         env);
            IF result THEN BEGIN
               rec.env := rec.env + [env];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'conjclasses',11) = 0 THEN BEGIN
         setp := setvalue;
         rec.conjclasses := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_conjclasstype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         conjclasses);
            IF result THEN BEGIN
               rec.conjclasses := rec.conjclasses + [conjclasses];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'particle',8) = 0 THEN BEGIN
         result := STR_StrToInteger(fieldvalue.str, fieldvalue.len, rec.particle);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'possvoices',10) = 0 THEN BEGIN
         setp := setvalue;
         rec.possvoices := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_voicetype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         possvoices);
            IF result THEN BEGIN
               rec.possvoices := rec.possvoices + [possvoices];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'reflexivity',11) = 0 THEN BEGIN
         result := LSSTRTOTYPE_reflexivetype( fieldvalue.str, fieldvalue.len, rec.reflexivity);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'synvps',6) = 0 THEN BEGIN
         setp := setvalue;
         rec.synvps := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_synpatterntype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         synvps);
            IF result THEN BEGIN
               rec.synvps := rec.synvps + [synvps];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'thetavp',7) = 0 THEN BEGIN
         result := LSSTRTOTYPE_thetavptype( fieldvalue.str, fieldvalue.len, rec.thetavp);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'adjuncts',8) = 0 THEN BEGIN
         setp := setvalue;
         rec.adjuncts := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_adjuncttype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         adjuncts);
            IF result THEN BEGIN
               rec.adjuncts := rec.adjuncts + [adjuncts];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'CaseAssigner',12) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.CaseAssigner := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.CaseAssigner := FALSE; result := TRUE 
         END;
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'subc',4) = 0 THEN BEGIN
         result := LSSTRTOTYPE_verbsubctype( fieldvalue.str, fieldvalue.len, rec.subc);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'perfauxs',8) = 0 THEN BEGIN
         setp := setvalue;
         rec.perfauxs := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_perfauxtype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         perfauxs);
            IF result THEN BEGIN
               rec.perfauxs := rec.perfauxs + [perfauxs];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'prepkey1',8) = 0 THEN BEGIN
         result := STR_StrToInteger(fieldvalue.str, fieldvalue.len, rec.prepkey1);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'prepkey2',8) = 0 THEN BEGIN
         result := STR_StrToInteger(fieldvalue.str, fieldvalue.len, rec.prepkey2);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'controller',10) = 0 THEN BEGIN
         result := LSSTRTOTYPE_controllertype( fieldvalue.str, fieldvalue.len, rec.controller);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'verbraiser',10) = 0 THEN BEGIN
         result := LSSTRTOTYPE_verbraisertype( fieldvalue.str, fieldvalue.len, rec.verbraiser);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'IPP',3) = 0 THEN BEGIN
         result := LSSTRTOTYPE_ipptype( fieldvalue.str, fieldvalue.len, rec.IPP);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'classes',7) = 0 THEN BEGIN
         setp := setvalue;
         rec.classes := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_classtype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         classes);
            IF result THEN BEGIN
               rec.classes := rec.classes + [classes];
            END;
            setp := setp^.NextValue         END

         END;
      END;
      attr^.Error := (NOT result);
      attr := attr^.NextAttr
   END;
   LSCONVATTR_BVERBrecord := result;
END {LSCONVATTR_BVERBrecord};

FUNCTION LSCONVATTR_SUBVERBrecord(VAR rec: LSDOMAINT_SUBVERBrecord;
                  VAR pattr: LDCONVREC_pAttrStruct): BOOLEAN;
VAR result : BOOLEAN;
    setp   : LDCONVREC_pSetValueType;
    attr   : LDCONVREC_pAttrStruct;

    req : LSDOMAINT_polaritytype; 
    env : LSDOMAINT_polaritytype; 
    conjclasses : LSDOMAINT_conjclasstype; 
    possvoices : LSDOMAINT_voicetype; 
    synvps : LSDOMAINT_synpatterntype; 
    adjuncts : LSDOMAINT_adjuncttype; 
    perfauxs : LSDOMAINT_perfauxtype; 
    classes : LSDOMAINT_classtype; 
BEGIN
   result := TRUE; attr := pattr;
   MAKET_SUBVERBrec(rec);
   WHILE (attr <> NIL) AND result DO BEGIN
   WITH attr^ DO BEGIN
      IF FALSE THEN BEGIN
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'req',3) = 0 THEN BEGIN
         setp := setvalue;
         rec.req := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_polaritytype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         req);
            IF result THEN BEGIN
               rec.req := rec.req + [req];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'env',3) = 0 THEN BEGIN
         setp := setvalue;
         rec.env := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_polaritytype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         env);
            IF result THEN BEGIN
               rec.env := rec.env + [env];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'conjclasses',11) = 0 THEN BEGIN
         setp := setvalue;
         rec.conjclasses := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_conjclasstype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         conjclasses);
            IF result THEN BEGIN
               rec.conjclasses := rec.conjclasses + [conjclasses];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'particle',8) = 0 THEN BEGIN
         result := STR_StrToInteger(fieldvalue.str, fieldvalue.len, rec.particle);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'possvoices',10) = 0 THEN BEGIN
         setp := setvalue;
         rec.possvoices := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_voicetype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         possvoices);
            IF result THEN BEGIN
               rec.possvoices := rec.possvoices + [possvoices];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'reflexivity',11) = 0 THEN BEGIN
         result := LSSTRTOTYPE_reflexivetype( fieldvalue.str, fieldvalue.len, rec.reflexivity);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'synvps',6) = 0 THEN BEGIN
         setp := setvalue;
         rec.synvps := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_synpatterntype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         synvps);
            IF result THEN BEGIN
               rec.synvps := rec.synvps + [synvps];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'thetavp',7) = 0 THEN BEGIN
         result := LSSTRTOTYPE_thetavptype( fieldvalue.str, fieldvalue.len, rec.thetavp);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'adjuncts',8) = 0 THEN BEGIN
         setp := setvalue;
         rec.adjuncts := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_adjuncttype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         adjuncts);
            IF result THEN BEGIN
               rec.adjuncts := rec.adjuncts + [adjuncts];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'CaseAssigner',12) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.CaseAssigner := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.CaseAssigner := FALSE; result := TRUE 
         END;
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'subc',4) = 0 THEN BEGIN
         result := LSSTRTOTYPE_verbsubctype( fieldvalue.str, fieldvalue.len, rec.subc);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'perfauxs',8) = 0 THEN BEGIN
         setp := setvalue;
         rec.perfauxs := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_perfauxtype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         perfauxs);
            IF result THEN BEGIN
               rec.perfauxs := rec.perfauxs + [perfauxs];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'prepkey1',8) = 0 THEN BEGIN
         result := STR_StrToInteger(fieldvalue.str, fieldvalue.len, rec.prepkey1);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'prepkey2',8) = 0 THEN BEGIN
         result := STR_StrToInteger(fieldvalue.str, fieldvalue.len, rec.prepkey2);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'controller',10) = 0 THEN BEGIN
         result := LSSTRTOTYPE_controllertype( fieldvalue.str, fieldvalue.len, rec.controller);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'verbraiser',10) = 0 THEN BEGIN
         result := LSSTRTOTYPE_verbraisertype( fieldvalue.str, fieldvalue.len, rec.verbraiser);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'IPP',3) = 0 THEN BEGIN
         result := LSSTRTOTYPE_ipptype( fieldvalue.str, fieldvalue.len, rec.IPP);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'classes',7) = 0 THEN BEGIN
         setp := setvalue;
         rec.classes := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_classtype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         classes);
            IF result THEN BEGIN
               rec.classes := rec.classes + [classes];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'lastaffix',9) = 0 THEN BEGIN
         result := LSSTRTOTYPE_affixtype( fieldvalue.str, fieldvalue.len, rec.lastaffix);
         END;
      END;
      attr^.Error := (NOT result);
      attr := attr^.NextAttr
   END;
   LSCONVATTR_SUBVERBrecord := result;
END {LSCONVATTR_SUBVERBrecord};

FUNCTION LSCONVATTR_VERBrecord(VAR rec: LSDOMAINT_VERBrecord;
                  VAR pattr: LDCONVREC_pAttrStruct): BOOLEAN;
VAR result : BOOLEAN;
    setp   : LDCONVREC_pSetValueType;
    attr   : LDCONVREC_pAttrStruct;

    req : LSDOMAINT_polaritytype; 
    env : LSDOMAINT_polaritytype; 
    conjclasses : LSDOMAINT_conjclasstype; 
    persons : LSDOMAINT_persontype; 
    possvoices : LSDOMAINT_voicetype; 
    synvps : LSDOMAINT_synpatterntype; 
    adjuncts : LSDOMAINT_adjuncttype; 
    foundauxes : LSDOMAINT_verbsubctype; 
    perfauxs : LSDOMAINT_perfauxtype; 
    synvpefs2 : LSDOMAINT_synpatterntype; 
    classes : LSDOMAINT_classtype; 
BEGIN
   result := TRUE; attr := pattr;
   MAKET_ALLOVERBrec(rec);
   WHILE (attr <> NIL) AND result DO BEGIN
   WITH attr^ DO BEGIN
      IF FALSE THEN BEGIN
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'req',3) = 0 THEN BEGIN
         setp := setvalue;
         rec.req := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_polaritytype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         req);
            IF result THEN BEGIN
               rec.req := rec.req + [req];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'env',3) = 0 THEN BEGIN
         setp := setvalue;
         rec.env := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_polaritytype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         env);
            IF result THEN BEGIN
               rec.env := rec.env + [env];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'conjclasses',11) = 0 THEN BEGIN
         setp := setvalue;
         rec.conjclasses := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_conjclasstype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         conjclasses);
            IF result THEN BEGIN
               rec.conjclasses := rec.conjclasses + [conjclasses];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'particle',8) = 0 THEN BEGIN
         result := STR_StrToInteger(fieldvalue.str, fieldvalue.len, rec.particle);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'number',6) = 0 THEN BEGIN
         result := LSSTRTOTYPE_numbertype( fieldvalue.str, fieldvalue.len, rec.number);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'persons',7) = 0 THEN BEGIN
         setp := setvalue;
         rec.persons := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_persontype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         persons);
            IF result THEN BEGIN
               rec.persons := rec.persons + [persons];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'eORenForm',9) = 0 THEN BEGIN
         result := LSSTRTOTYPE_eorenformtype( fieldvalue.str, fieldvalue.len, rec.eORenForm);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'modus',5) = 0 THEN BEGIN
         result := LSSTRTOTYPE_modustype( fieldvalue.str, fieldvalue.len, rec.modus);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'tense',5) = 0 THEN BEGIN
         result := LSSTRTOTYPE_tensetype( fieldvalue.str, fieldvalue.len, rec.tense);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'possvoices',10) = 0 THEN BEGIN
         setp := setvalue;
         rec.possvoices := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_voicetype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         possvoices);
            IF result THEN BEGIN
               rec.possvoices := rec.possvoices + [possvoices];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'reflexivity',11) = 0 THEN BEGIN
         result := LSSTRTOTYPE_reflexivetype( fieldvalue.str, fieldvalue.len, rec.reflexivity);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'synvps',6) = 0 THEN BEGIN
         setp := setvalue;
         rec.synvps := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_synpatterntype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         synvps);
            IF result THEN BEGIN
               rec.synvps := rec.synvps + [synvps];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'thetavp',7) = 0 THEN BEGIN
         result := LSSTRTOTYPE_thetavptype( fieldvalue.str, fieldvalue.len, rec.thetavp);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'adjuncts',8) = 0 THEN BEGIN
         setp := setvalue;
         rec.adjuncts := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_adjuncttype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         adjuncts);
            IF result THEN BEGIN
               rec.adjuncts := rec.adjuncts + [adjuncts];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'CaseAssigner',12) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.CaseAssigner := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.CaseAssigner := FALSE; result := TRUE 
         END;
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'subc',4) = 0 THEN BEGIN
         result := LSSTRTOTYPE_verbsubctype( fieldvalue.str, fieldvalue.len, rec.subc);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'foundauxes',10) = 0 THEN BEGIN
         setp := setvalue;
         rec.foundauxes := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_verbsubctype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         foundauxes);
            IF result THEN BEGIN
               rec.foundauxes := rec.foundauxes + [foundauxes];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'perfauxs',8) = 0 THEN BEGIN
         setp := setvalue;
         rec.perfauxs := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_perfauxtype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         perfauxs);
            IF result THEN BEGIN
               rec.perfauxs := rec.perfauxs + [perfauxs];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'prepkey1',8) = 0 THEN BEGIN
         result := STR_StrToInteger(fieldvalue.str, fieldvalue.len, rec.prepkey1);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'prepkey2',8) = 0 THEN BEGIN
         result := STR_StrToInteger(fieldvalue.str, fieldvalue.len, rec.prepkey2);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'controller',10) = 0 THEN BEGIN
         result := LSSTRTOTYPE_controllertype( fieldvalue.str, fieldvalue.len, rec.controller);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'verbraiser',10) = 0 THEN BEGIN
         result := LSSTRTOTYPE_verbraisertype( fieldvalue.str, fieldvalue.len, rec.verbraiser);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'IPP',3) = 0 THEN BEGIN
         result := LSSTRTOTYPE_ipptype( fieldvalue.str, fieldvalue.len, rec.IPP);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'synvpefs2',9) = 0 THEN BEGIN
         setp := setvalue;
         rec.synvpefs2 := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_synpatterntype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         synvpefs2);
            IF result THEN BEGIN
               rec.synvpefs2 := rec.synvpefs2 + [synvpefs2];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'status',6) = 0 THEN BEGIN
         result := LSSTRTOTYPE_vstatustype( fieldvalue.str, fieldvalue.len, rec.status);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'classes',7) = 0 THEN BEGIN
         setp := setvalue;
         rec.classes := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_classtype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         classes);
            IF result THEN BEGIN
               rec.classes := rec.classes + [classes];
            END;
            setp := setp^.NextValue         END

         END;
      END;
      attr^.Error := (NOT result);
      attr := attr^.NextAttr
   END;
   LSCONVATTR_VERBrecord := result;
END {LSCONVATTR_VERBrecord};

FUNCTION LSCONVATTR_VERBPrecord(VAR rec: LSDOMAINT_VERBPrecord;
                  VAR pattr: LDCONVREC_pAttrStruct): BOOLEAN;
VAR result : BOOLEAN;
    setp   : LDCONVREC_pSetValueType;
    attr   : LDCONVREC_pAttrStruct;

    req : LSDOMAINT_polaritytype; 
    env : LSDOMAINT_polaritytype; 
    synvpefs : LSDOMAINT_synpatterntype; 
    adjuncts : LSDOMAINT_adjuncttype; 
    foundauxes : LSDOMAINT_verbsubctype; 
    classes : LSDOMAINT_classtype; 
    persons : LSDOMAINT_persontype; 
    synvpefs2 : LSDOMAINT_synpatterntype; 
    adjvpefs : LSDOMAINT_synpatterntype; 
BEGIN
   result := TRUE; attr := pattr;
   MAKET_VERBPrec(rec);
   WHILE (attr <> NIL) AND result DO BEGIN
   WITH attr^ DO BEGIN
      IF FALSE THEN BEGIN
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'req',3) = 0 THEN BEGIN
         setp := setvalue;
         rec.req := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_polaritytype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         req);
            IF result THEN BEGIN
               rec.req := rec.req + [req];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'env',3) = 0 THEN BEGIN
         setp := setvalue;
         rec.env := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_polaritytype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         env);
            IF result THEN BEGIN
               rec.env := rec.env + [env];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'voice',5) = 0 THEN BEGIN
         result := LSSTRTOTYPE_voicetype( fieldvalue.str, fieldvalue.len, rec.voice);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'synvpefs',8) = 0 THEN BEGIN
         setp := setvalue;
         rec.synvpefs := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_synpatterntype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         synvpefs);
            IF result THEN BEGIN
               rec.synvpefs := rec.synvpefs + [synvpefs];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'thetavp',7) = 0 THEN BEGIN
         result := LSSTRTOTYPE_thetavptype( fieldvalue.str, fieldvalue.len, rec.thetavp);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'adjuncts',8) = 0 THEN BEGIN
         setp := setvalue;
         rec.adjuncts := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_adjuncttype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         adjuncts);
            IF result THEN BEGIN
               rec.adjuncts := rec.adjuncts + [adjuncts];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'foundauxes',10) = 0 THEN BEGIN
         setp := setvalue;
         rec.foundauxes := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_verbsubctype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         foundauxes);
            IF result THEN BEGIN
               rec.foundauxes := rec.foundauxes + [foundauxes];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'modus',5) = 0 THEN BEGIN
         result := LSSTRTOTYPE_modustype( fieldvalue.str, fieldvalue.len, rec.modus);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'reflexivity',11) = 0 THEN BEGIN
         result := LSSTRTOTYPE_reflexivetype( fieldvalue.str, fieldvalue.len, rec.reflexivity);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'classes',7) = 0 THEN BEGIN
         setp := setvalue;
         rec.classes := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_classtype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         classes);
            IF result THEN BEGIN
               rec.classes := rec.classes + [classes];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'persons',7) = 0 THEN BEGIN
         setp := setvalue;
         rec.persons := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_persontype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         persons);
            IF result THEN BEGIN
               rec.persons := rec.persons + [persons];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'number',6) = 0 THEN BEGIN
         result := LSSTRTOTYPE_numbertype( fieldvalue.str, fieldvalue.len, rec.number);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'aspect',6) = 0 THEN BEGIN
         result := LSSTRTOTYPE_aspecttype( fieldvalue.str, fieldvalue.len, rec.aspect);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'tense',5) = 0 THEN BEGIN
         result := LSSTRTOTYPE_tensetype( fieldvalue.str, fieldvalue.len, rec.tense);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'retro',5) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.retro := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.retro := FALSE; result := TRUE 
         END;
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'finiteness',10) = 0 THEN BEGIN
         result := LSSTRTOTYPE_finitenesstype( fieldvalue.str, fieldvalue.len, rec.finiteness);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'infsort',7) = 0 THEN BEGIN
         result := LSSTRTOTYPE_inftype( fieldvalue.str, fieldvalue.len, rec.infsort);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'objfound',8) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.objfound := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.objfound := FALSE; result := TRUE 
         END;
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'indobjfound',11) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.indobjfound := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.indobjfound := FALSE; result := TRUE 
         END;
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'preadvok',8) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.preadvok := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.preadvok := FALSE; result := TRUE 
         END;
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'Vmatrixhead',11) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.Vmatrixhead := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.Vmatrixhead := FALSE; result := TRUE 
         END;
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'anterelativeok',14) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.anterelativeok := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.anterelativeok := FALSE; result := TRUE 
         END;
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'synvpefs2',9) = 0 THEN BEGIN
         setp := setvalue;
         rec.synvpefs2 := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_synpatterntype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         synvpefs2);
            IF result THEN BEGIN
               rec.synvpefs2 := rec.synvpefs2 + [synvpefs2];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'adjvpefs',8) = 0 THEN BEGIN
         setp := setvalue;
         rec.adjvpefs := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_synpatterntype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         adjvpefs);
            IF result THEN BEGIN
               rec.adjvpefs := rec.adjvpefs + [adjvpefs];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'countenfound',12) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.countenfound := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.countenfound := FALSE; result := TRUE 
         END;
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'locargfound',11) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.locargfound := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.locargfound := FALSE; result := TRUE 
         END;
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'dirargfound',11) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.dirargfound := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.dirargfound := FALSE; result := TRUE 
         END;
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'prepobjfound',12) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.prepobjfound := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.prepobjfound := FALSE; result := TRUE 
         END;
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'nppredfound',11) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.nppredfound := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.nppredfound := FALSE; result := TRUE 
         END;
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'adjpppredfound',14) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.adjpppredfound := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.adjpppredfound := FALSE; result := TRUE 
         END;
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'prepppredfound',14) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.prepppredfound := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.prepppredfound := FALSE; result := TRUE 
         END;
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'aanobjfound',11) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.aanobjfound := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.aanobjfound := FALSE; result := TRUE 
         END;
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'voorobjfound',12) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.voorobjfound := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.voorobjfound := FALSE; result := TRUE 
         END;
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'postvpofound',12) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.postvpofound := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.postvpofound := FALSE; result := TRUE 
         END;
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'strandedfound',13) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.strandedfound := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.strandedfound := FALSE; result := TRUE 
         END;
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'vpcomplfound',12) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.vpcomplfound := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.vpcomplfound := FALSE; result := TRUE 
         END;
         END;
      END;
      attr^.Error := (NOT result);
      attr := attr^.NextAttr
   END;
   LSCONVATTR_VERBPrecord := result;
END {LSCONVATTR_VERBPrecord};

FUNCTION LSCONVATTR_VERBPPROPrecord(VAR rec: LSDOMAINT_VERBPPROPrecord;
                  VAR pattr: LDCONVREC_pAttrStruct): BOOLEAN;
VAR result : BOOLEAN;
    setp   : LDCONVREC_pSetValueType;
    attr   : LDCONVREC_pAttrStruct;

    req : LSDOMAINT_polaritytype; 
    env : LSDOMAINT_polaritytype; 
    synvpefs : LSDOMAINT_synpatterntype; 
    adjuncts : LSDOMAINT_adjuncttype; 
    aktionsarts : LSDOMAINT_aktionsarttype; 
BEGIN
   result := TRUE; attr := pattr;
   MAKET_CLOSEDVERBPPROPrec(rec);
   WHILE (attr <> NIL) AND result DO BEGIN
   WITH attr^ DO BEGIN
      IF FALSE THEN BEGIN
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'req',3) = 0 THEN BEGIN
         setp := setvalue;
         rec.req := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_polaritytype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         req);
            IF result THEN BEGIN
               rec.req := rec.req + [req];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'env',3) = 0 THEN BEGIN
         setp := setvalue;
         rec.env := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_polaritytype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         env);
            IF result THEN BEGIN
               rec.env := rec.env + [env];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'superdeixis',11) = 0 THEN BEGIN
         result := LSSTRTOTYPE_deixistype( fieldvalue.str, fieldvalue.len, rec.superdeixis);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'PROsubject',10) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.PROsubject := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.PROsubject := FALSE; result := TRUE 
         END;
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'voice',5) = 0 THEN BEGIN
         result := LSSTRTOTYPE_voicetype( fieldvalue.str, fieldvalue.len, rec.voice);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'synvpefs',8) = 0 THEN BEGIN
         setp := setvalue;
         rec.synvpefs := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_synpatterntype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         synvpefs);
            IF result THEN BEGIN
               rec.synvpefs := rec.synvpefs + [synvpefs];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'thetavp',7) = 0 THEN BEGIN
         result := LSSTRTOTYPE_thetavptype( fieldvalue.str, fieldvalue.len, rec.thetavp);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'adjuncts',8) = 0 THEN BEGIN
         setp := setvalue;
         rec.adjuncts := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_adjuncttype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         adjuncts);
            IF result THEN BEGIN
               rec.adjuncts := rec.adjuncts + [adjuncts];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'aktionsarts',11) = 0 THEN BEGIN
         setp := setvalue;
         rec.aktionsarts := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_aktionsarttype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         aktionsarts);
            IF result THEN BEGIN
               rec.aktionsarts := rec.aktionsarts + [aktionsarts];
            END;
            setp := setp^.NextValue         END

         END;
      END;
      attr^.Error := (NOT result);
      attr := attr^.NextAttr
   END;
   LSCONVATTR_VERBPPROPrecord := result;
END {LSCONVATTR_VERBPPROPrecord};

FUNCTION LSCONVATTR_VERBPPROPVARrecord(VAR rec: LSDOMAINT_VERBPPROPVARrecord;
                  VAR pattr: LDCONVREC_pAttrStruct): BOOLEAN;
VAR result : BOOLEAN;
    setp   : LDCONVREC_pSetValueType;
    attr   : LDCONVREC_pAttrStruct;

    req : LSDOMAINT_polaritytype; 
    env : LSDOMAINT_polaritytype; 
    synvpefs : LSDOMAINT_synpatterntype; 
    adjuncts : LSDOMAINT_adjuncttype; 
    aktionsarts : LSDOMAINT_aktionsarttype; 
BEGIN
   result := TRUE; attr := pattr;
   MAKET_VERBPPROPVARrec(rec);
   WHILE (attr <> NIL) AND result DO BEGIN
   WITH attr^ DO BEGIN
      IF FALSE THEN BEGIN
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'req',3) = 0 THEN BEGIN
         setp := setvalue;
         rec.req := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_polaritytype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         req);
            IF result THEN BEGIN
               rec.req := rec.req + [req];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'env',3) = 0 THEN BEGIN
         setp := setvalue;
         rec.env := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_polaritytype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         env);
            IF result THEN BEGIN
               rec.env := rec.env + [env];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'superdeixis',11) = 0 THEN BEGIN
         result := LSSTRTOTYPE_deixistype( fieldvalue.str, fieldvalue.len, rec.superdeixis);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'PROsubject',10) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.PROsubject := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.PROsubject := FALSE; result := TRUE 
         END;
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'voice',5) = 0 THEN BEGIN
         result := LSSTRTOTYPE_voicetype( fieldvalue.str, fieldvalue.len, rec.voice);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'synvpefs',8) = 0 THEN BEGIN
         setp := setvalue;
         rec.synvpefs := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_synpatterntype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         synvpefs);
            IF result THEN BEGIN
               rec.synvpefs := rec.synvpefs + [synvpefs];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'thetavp',7) = 0 THEN BEGIN
         result := LSSTRTOTYPE_thetavptype( fieldvalue.str, fieldvalue.len, rec.thetavp);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'adjuncts',8) = 0 THEN BEGIN
         setp := setvalue;
         rec.adjuncts := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_adjuncttype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         adjuncts);
            IF result THEN BEGIN
               rec.adjuncts := rec.adjuncts + [adjuncts];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'aktionsarts',11) = 0 THEN BEGIN
         setp := setvalue;
         rec.aktionsarts := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_aktionsarttype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         aktionsarts);
            IF result THEN BEGIN
               rec.aktionsarts := rec.aktionsarts + [aktionsarts];
            END;
            setp := setp^.NextValue         END

         END;
      END;
      attr^.Error := (NOT result);
      attr := attr^.NextAttr
   END;
   LSCONVATTR_VERBPPROPVARrecord := result;
END {LSCONVATTR_VERBPPROPVARrecord};

FUNCTION LSCONVATTR_BWHPROrecord(VAR rec: LSDOMAINT_BWHPROrecord;
                  VAR pattr: LDCONVREC_pAttrStruct): BOOLEAN;
VAR result : BOOLEAN;
    setp   : LDCONVREC_pSetValueType;
    attr   : LDCONVREC_pAttrStruct;

    sexes : LSDOMAINT_sextype; 
BEGIN
   result := TRUE; attr := pattr;
   MAKET_BWHPROrec(rec);
   WHILE (attr <> NIL) AND result DO BEGIN
   WITH attr^ DO BEGIN
      IF FALSE THEN BEGIN
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                          'KEY', 3) = 0 THEN BEGIN
         result := STR_StrToInteger(fieldvalue.str,
                                 fieldvalue.len, rec.key);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'animate',7) = 0 THEN BEGIN
         result := LSSTRTOTYPE_animatetype( fieldvalue.str, fieldvalue.len, rec.animate);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'possRform',9) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.possRform := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.possRform := FALSE; result := TRUE 
         END;
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'sexes',5) = 0 THEN BEGIN
         setp := setvalue;
         rec.sexes := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_sextype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         sexes);
            IF result THEN BEGIN
               rec.sexes := rec.sexes + [sexes];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'number',6) = 0 THEN BEGIN
         result := LSSTRTOTYPE_numbertype( fieldvalue.str, fieldvalue.len, rec.number);
         END;
      END;
      attr^.Error := (NOT result);
      attr := attr^.NextAttr
   END;
   LSCONVATTR_BWHPROrecord := result;
END {LSCONVATTR_BWHPROrecord};

FUNCTION LSCONVATTR_WHPROrecord(VAR rec: LSDOMAINT_WHPROrecord;
                  VAR pattr: LDCONVREC_pAttrStruct): BOOLEAN;
VAR result : BOOLEAN;
    setp   : LDCONVREC_pSetValueType;
    attr   : LDCONVREC_pAttrStruct;

    sexes : LSDOMAINT_sextype; 
BEGIN
   result := TRUE; attr := pattr;
   MAKET_WHPROrec(rec);
   WHILE (attr <> NIL) AND result DO BEGIN
   WITH attr^ DO BEGIN
      IF FALSE THEN BEGIN
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'animate',7) = 0 THEN BEGIN
         result := LSSTRTOTYPE_animatetype( fieldvalue.str, fieldvalue.len, rec.animate);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'possRform',9) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.possRform := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.possRform := FALSE; result := TRUE 
         END;
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'sexes',5) = 0 THEN BEGIN
         setp := setvalue;
         rec.sexes := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_sextype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         sexes);
            IF result THEN BEGIN
               rec.sexes := rec.sexes + [sexes];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'number',6) = 0 THEN BEGIN
         result := LSSTRTOTYPE_numbertype( fieldvalue.str, fieldvalue.len, rec.number);
         END;
      END;
      attr^.Error := (NOT result);
      attr := attr^.NextAttr
   END;
   LSCONVATTR_WHPROrecord := result;
END {LSCONVATTR_WHPROrecord};

FUNCTION LSCONVATTR_xxkeyrecord(VAR rec: LSDOMAINT_xxkeyrecord;
                  VAR pattr: LDCONVREC_pAttrStruct): BOOLEAN;
VAR result : BOOLEAN;
    setp   : LDCONVREC_pSetValueType;
    attr   : LDCONVREC_pAttrStruct;

BEGIN
   result := TRUE; attr := pattr;
   MAKET_SFCATrec(rec);
   WHILE (attr <> NIL) AND result DO BEGIN
   WITH attr^ DO BEGIN
      IF FALSE THEN BEGIN
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                          'KEY', 3) = 0 THEN BEGIN
         result := STR_StrToInteger(fieldvalue.str,
                                 fieldvalue.len, rec.key);
         END;
      END;
      attr^.Error := (NOT result);
      attr := attr^.NextAttr
   END;
   LSCONVATTR_xxkeyrecord := result;
END {LSCONVATTR_xxkeyrecord};

FUNCTION LSCONVATTR_xxemptyrecord(VAR rec: LSDOMAINT_xxemptyrecord;
                  VAR pattr: LDCONVREC_pAttrStruct): BOOLEAN;
VAR result : BOOLEAN;
    setp   : LDCONVREC_pSetValueType;
    attr   : LDCONVREC_pAttrStruct;

BEGIN
   result := TRUE; attr := pattr;
   MAKET_GLUErec(rec);
   WHILE (attr <> NIL) AND result DO BEGIN
   WITH attr^ DO BEGIN
      IF FALSE THEN BEGIN
         END;
      END;
      attr^.Error := (NOT result);
      attr := attr^.NextAttr
   END;
   LSCONVATTR_xxemptyrecord := result;
END {LSCONVATTR_xxemptyrecord};



FUNCTION LSCONVATTR_AttrToRec(CONST catstr: STRING;
                                       catlen: INTEGER;
                                       VAR pattr: LDCONVREC_pAttrStruct;
                                       VAR rec: LSDOMAINT_LSrecord):
                                       BOOLEAN;
VAR result : BOOLEAN;
    attr   : LDCONVREC_pAttrStruct;
    catli  : LIDOMAINT_syntcat;
BEGIN
   result := LDSTRTOTYPE_Cat(catstr, catlen, catli);
   attr := pattr;
   IF result THEN BEGIN
      rec.cat := LoopHoles.Retype(catli,LSDOMAINT_syntcat);
      CASE rec.cat OF 
      BADJSUFF: BEGIN
         result := LSCONVATTR_BADJrecord(rec.BADJSUFFfield^, attr);
         END;
      BADJ: BEGIN
         result := LSCONVATTR_BADJrecord(rec.BADJfield^, attr);
         END;
      SUBADJ: BEGIN
         result := LSCONVATTR_SUBADJrecord(rec.SUBADJfield^, attr);
         END;
      ADJ: BEGIN
         result := LSCONVATTR_ADJrecord(rec.ADJfield^, attr);
         END;
      ALLOADJ: BEGIN
         result := LSCONVATTR_ADJrecord(rec.ALLOADJfield^, attr);
         END;
      ADJP: BEGIN
         result := LSCONVATTR_ADJPrecord(rec.ADJPfield^, attr);
         END;
      ADJPPROP: BEGIN
         result := LSCONVATTR_ADJPPROPrecord(rec.ADJPPROPfield^, attr);
         END;
      ADJPFORMULA: BEGIN
         result := LSCONVATTR_ADJPPROPrecord(rec.ADJPFORMULAfield^, attr);
         END;
      OPENADJPPROP: BEGIN
         result := LSCONVATTR_ADJPPROPrecord(rec.OPENADJPPROPfield^, attr);
         END;
      CLOSEDADJPPROP: BEGIN
         result := LSCONVATTR_ADJPPROPrecord(rec.CLOSEDADJPPROPfield^, attr);
         END;
      BADVSUFF: BEGIN
         result := LSCONVATTR_BADVrecord(rec.BADVSUFFfield^, attr);
         END;
      BADV: BEGIN
         result := LSCONVATTR_BADVrecord(rec.BADVfield^, attr);
         END;
      SUBADV: BEGIN
         result := LSCONVATTR_SUBADVrecord(rec.SUBADVfield^, attr);
         END;
      ADV: BEGIN
         result := LSCONVATTR_ADVrecord(rec.ADVfield^, attr);
         END;
      ALLOADV: BEGIN
         result := LSCONVATTR_ADVrecord(rec.ALLOADVfield^, attr);
         END;
      ADVP: BEGIN
         result := LSCONVATTR_ADVPrecord(rec.ADVPfield^, attr);
         END;
      ADVPPROP: BEGIN
         result := LSCONVATTR_ADVPPROPrecord(rec.ADVPPROPfield^, attr);
         END;
      ADVPFORMULA: BEGIN
         result := LSCONVATTR_ADVPPROPrecord(rec.ADVPFORMULAfield^, attr);
         END;
      OPENADVPPROP: BEGIN
         result := LSCONVATTR_ADVPPROPrecord(rec.OPENADVPPROPfield^, attr);
         END;
      CLOSEDADVPPROP: BEGIN
         result := LSCONVATTR_ADVPPROPrecord(rec.CLOSEDADVPPROPfield^, attr);
         END;
      RADV: BEGIN
         result := LSCONVATTR_RADVrecord(rec.RADVfield^, attr);
         END;
      RADVP: BEGIN
         result := LSCONVATTR_RADVPrecord(rec.RADVPfield^, attr);
         END;
      ADVPVAR: BEGIN
         result := LSCONVATTR_ADVPVARrecord(rec.ADVPVARfield^, attr);
         END;
      ART: BEGIN
         result := LSCONVATTR_ARTrecord(rec.ARTfield^, attr);
         END;
      ASP: BEGIN
         result := LSCONVATTR_ASPrecord(rec.ASPfield^, attr);
         END;
      BIGPRO: BEGIN
         result := LSCONVATTR_BIGPROrecord(rec.BIGPROfield^, attr);
         END;
      BBIGPRO: BEGIN
         result := LSCONVATTR_BPERSPROrecord(rec.BBIGPROfield^, attr);
         END;
      CARD: BEGIN
         result := LSCONVATTR_CARDrecord(rec.CARDfield^, attr);
         END;
      CLAUSE: BEGIN
         result := LSCONVATTR_CLAUSErecord(rec.CLAUSEfield^, attr);
         END;
      CONJ: BEGIN
         result := LSCONVATTR_CONJrecord(rec.CONJfield^, attr);
         END;
      COORD: BEGIN
         result := LSCONVATTR_COORDrecord(rec.COORDfield^, attr);
         END;
      DEMADJ: BEGIN
         result := LSCONVATTR_DEMADJrecord(rec.DEMADJfield^, attr);
         END;
      DEMPRO: BEGIN
         result := LSCONVATTR_DEMPROrecord(rec.DEMPROfield^, attr);
         END;
      BDET: BEGIN
         result := LSCONVATTR_BDETrecord(rec.BDETfield^, attr);
         END;
      DET: BEGIN
         result := LSCONVATTR_DETrecord(rec.DETfield^, attr);
         END;
      ALLODET: BEGIN
         result := LSCONVATTR_DETrecord(rec.ALLODETfield^, attr);
         END;
      DETP: BEGIN
         result := LSCONVATTR_DETPrecord(rec.DETPfield^, attr);
         END;
      DIGIT: BEGIN
         result := LSCONVATTR_DIGITrecord(rec.DIGITfield^, attr);
         END;
      EC: BEGIN
         result := LSCONVATTR_ECrecord(rec.ECfield^, attr);
         END;
      EN: BEGIN
         result := LSCONVATTR_ENrecord(rec.ENfield^, attr);
         END;
      EMPTY: BEGIN
         result := LSCONVATTR_EMPTYrecord(rec.EMPTYfield^, attr);
         END;
      EXCLAM: BEGIN
         result := LSCONVATTR_EXCLAMrecord(rec.EXCLAMfield^, attr);
         END;
      BINDEFPRO: BEGIN
         result := LSCONVATTR_BINDEFPROrecord(rec.BINDEFPROfield^, attr);
         END;
      INDEFPRO: BEGIN
         result := LSCONVATTR_INDEFPROrecord(rec.INDEFPROfield^, attr);
         END;
      NEG: BEGIN
         result := LSCONVATTR_NEGrecord(rec.NEGfield^, attr);
         END;
      NEGVAR: BEGIN
         result := LSCONVATTR_NEGrecord(rec.NEGVARfield^, attr);
         END;
      BNOUNSUFF: BEGIN
         result := LSCONVATTR_BNOUNrecord(rec.BNOUNSUFFfield^, attr);
         END;
      BNOUN: BEGIN
         result := LSCONVATTR_BNOUNrecord(rec.BNOUNfield^, attr);
         END;
      SUBNOUN: BEGIN
         result := LSCONVATTR_SUBNOUNrecord(rec.SUBNOUNfield^, attr);
         END;
      NOUN: BEGIN
         result := LSCONVATTR_NOUNrecord(rec.NOUNfield^, attr);
         END;
      ALLONOUN: BEGIN
         result := LSCONVATTR_NOUNrecord(rec.ALLONOUNfield^, attr);
         END;
      CN: BEGIN
         result := LSCONVATTR_CNrecord(rec.CNfield^, attr);
         END;
      NP: BEGIN
         result := LSCONVATTR_NPrecord(rec.NPfield^, attr);
         END;
      NPPROP: BEGIN
         result := LSCONVATTR_NPPROPrecord(rec.NPPROPfield^, attr);
         END;
      NPFORMULA: BEGIN
         result := LSCONVATTR_NPPROPrecord(rec.NPFORMULAfield^, attr);
         END;
      OPENNPPROP: BEGIN
         result := LSCONVATTR_NPPROPrecord(rec.OPENNPPROPfield^, attr);
         END;
      CLOSEDNPPROP: BEGIN
         result := LSCONVATTR_NPPROPrecord(rec.CLOSEDNPPROPfield^, attr);
         END;
      NUM: BEGIN
         result := LSCONVATTR_NUMrecord(rec.NUMfield^, attr);
         END;
      ORDINAL: BEGIN
         result := LSCONVATTR_ORDINALrecord(rec.ORDINALfield^, attr);
         END;
      PART: BEGIN
         result := LSCONVATTR_PARTICLErecord(rec.PARTfield^, attr);
         END;
      BPERSPRO: BEGIN
         result := LSCONVATTR_BPERSPROrecord(rec.BPERSPROfield^, attr);
         END;
      PERSPRO: BEGIN
         result := LSCONVATTR_PERSPROrecord(rec.PERSPROfield^, attr);
         END;
      POS: BEGIN
         result := LSCONVATTR_POSrecord(rec.POSfield^, attr);
         END;
      POSVAR: BEGIN
         result := LSCONVATTR_POSrecord(rec.POSVARfield^, attr);
         END;
      POSSADJ: BEGIN
         result := LSCONVATTR_POSSADJrecord(rec.POSSADJfield^, attr);
         END;
      POSSPRO: BEGIN
         result := LSCONVATTR_POSSPROrecord(rec.POSSPROfield^, attr);
         END;
      SUBPREP: BEGIN
         result := LSCONVATTR_PREPrecord(rec.SUBPREPfield^, attr);
         END;
      PREP: BEGIN
         result := LSCONVATTR_PREPrecord(rec.PREPfield^, attr);
         END;
      PREPP: BEGIN
         result := LSCONVATTR_PREPPrecord(rec.PREPPfield^, attr);
         END;
      PREPPPROP: BEGIN
         result := LSCONVATTR_PREPPPROPrecord(rec.PREPPPROPfield^, attr);
         END;
      PREPPFORMULA: BEGIN
         result := LSCONVATTR_PREPPPROPrecord(rec.PREPPFORMULAfield^, attr);
         END;
      OPENPREPPPROP: BEGIN
         result := LSCONVATTR_PREPPPROPrecord(rec.OPENPREPPPROPfield^, attr);
         END;
      CLOSEDPREPPPROP: BEGIN
         result := LSCONVATTR_PREPPPROPrecord(rec.CLOSEDPREPPPROPfield^, attr);
         END;
      VARPREPP: BEGIN
         result := LSCONVATTR_PREPPrecord(rec.VARPREPPfield^, attr);
         END;
      PREPPVAR: BEGIN
         result := LSCONVATTR_PREPPVARrecord(rec.PREPPVARfield^, attr);
         END;
      BPROPERNOUN: BEGIN
         result := LSCONVATTR_BPROPERNOUNrecord(rec.BPROPERNOUNfield^, attr);
         END;
      PROPERNOUN: BEGIN
         result := LSCONVATTR_PROPERNOUNrecord(rec.PROPERNOUNfield^, attr);
         END;
      PUNC: BEGIN
         result := LSCONVATTR_PUNCrecord(rec.PUNCfield^, attr);
         END;
      PROSENT: BEGIN
         result := LSCONVATTR_PROSENTrecord(rec.PROSENTfield^, attr);
         END;
      PROSENTVAR: BEGIN
         result := LSCONVATTR_PROSENTVARrecord(rec.PROSENTVARfield^, attr);
         END;
      Q: BEGIN
         result := LSCONVATTR_Qrecord(rec.Qfield^, attr);
         END;
      QP: BEGIN
         result := LSCONVATTR_QPrecord(rec.QPfield^, attr);
         END;
      RECIPRO: BEGIN
         result := LSCONVATTR_RECIPROrecord(rec.RECIPROfield^, attr);
         END;
      REFLPRO: BEGIN
         result := LSCONVATTR_REFLPROrecord(rec.REFLPROfield^, attr);
         END;
      RELANTPRO: BEGIN
         result := LSCONVATTR_RELANTPROrecord(rec.RELANTPROfield^, attr);
         END;
      RELPRO: BEGIN
         result := LSCONVATTR_RELPROrecord(rec.RELPROfield^, attr);
         END;
      SENTENCE: BEGIN
         result := LSCONVATTR_SENTENCErecord(rec.SENTENCEfield^, attr);
         END;
      TE: BEGIN
         result := LSCONVATTR_TErecord(rec.TEfield^, attr);
         END;
      THANAS: BEGIN
         result := LSCONVATTR_THANASrecord(rec.THANASfield^, attr);
         END;
      THANP: BEGIN
         result := LSCONVATTR_THANPrecord(rec.THANPfield^, attr);
         END;
      UTT: BEGIN
         result := LSCONVATTR_NOrecord(rec.UTTfield^, attr);
         END;
      ADJPPROPVAR: BEGIN
         result := LSCONVATTR_ADJPPROPVARrecord(rec.ADJPPROPVARfield^, attr);
         END;
      ADVPPROPVAR: BEGIN
         result := LSCONVATTR_ADVPPROPVARrecord(rec.ADVPPROPVARfield^, attr);
         END;
      CLAUSEVAR: BEGIN
         result := LSCONVATTR_CLAUSEVARrecord(rec.CLAUSEVARfield^, attr);
         END;
      CNVAR: BEGIN
         result := LSCONVATTR_CNVARrecord(rec.CNVARfield^, attr);
         END;
      NPPROPVAR: BEGIN
         result := LSCONVATTR_NPPROPVARrecord(rec.NPPROPVARfield^, attr);
         END;
      PREPPPROPVAR: BEGIN
         result := LSCONVATTR_PREPPPROPVARrecord(rec.PREPPPROPVARfield^, attr);
         END;
      NPVAR: BEGIN
         result := LSCONVATTR_NPVARrecord(rec.NPVARfield^, attr);
         END;
      SENTENCEVAR: BEGIN
         result := LSCONVATTR_SENTENCEVARrecord(rec.SENTENCEVARfield^, attr);
         END;
      EMPTYVAR: BEGIN
         result := LSCONVATTR_EMPTYVARrecord(rec.EMPTYVARfield^, attr);
         END;
      VERBPPROPVAR: BEGIN
         result := LSCONVATTR_VERBPPROPVARrecord(rec.VERBPPROPVARfield^, attr);
         END;
      BVERBSUFF: BEGIN
         result := LSCONVATTR_BVERBrecord(rec.BVERBSUFFfield^, attr);
         END;
      BVERB: BEGIN
         result := LSCONVATTR_BVERBrecord(rec.BVERBfield^, attr);
         END;
      SUBVERB: BEGIN
         result := LSCONVATTR_SUBVERBrecord(rec.SUBVERBfield^, attr);
         END;
      VERB: BEGIN
         result := LSCONVATTR_VERBrecord(rec.VERBfield^, attr);
         END;
      ALLOVERB: BEGIN
         result := LSCONVATTR_VERBrecord(rec.ALLOVERBfield^, attr);
         END;
      VERBP: BEGIN
         result := LSCONVATTR_VERBPrecord(rec.VERBPfield^, attr);
         END;
      VERBPPROP: BEGIN
         result := LSCONVATTR_VERBPPROPrecord(rec.VERBPPROPfield^, attr);
         END;
      VERBPFORMULA: BEGIN
         result := LSCONVATTR_VERBPPROPrecord(rec.VERBPFORMULAfield^, attr);
         END;
      OPENVERBPPROP: BEGIN
         result := LSCONVATTR_VERBPPROPrecord(rec.OPENVERBPPROPfield^, attr);
         END;
      CLOSEDVERBPPROP: BEGIN
         result := LSCONVATTR_VERBPPROPrecord(rec.CLOSEDVERBPPROPfield^, attr);
         END;
      BWHPRO: BEGIN
         result := LSCONVATTR_BWHPROrecord(rec.BWHPROfield^, attr);
         END;
      WHPRO: BEGIN
         result := LSCONVATTR_WHPROrecord(rec.WHPROfield^, attr);
         END;
      SFCAT: BEGIN
         result := LSCONVATTR_xxkeyrecord(rec.SFCATfield^, attr);
         END;
      PFCAT: BEGIN
         result := LSCONVATTR_xxkeyrecord(rec.PFCATfield^, attr);
         END;
      GLUE: BEGIN
         result := LSCONVATTR_xxemptyrecord(rec.GLUEfield^, attr);
         END;
      END;
   END;
   LSCONVATTR_AttrToRec := result;
END {LSCONVATTR_AttrToRec};

FUNCTION LSCONVATTR_AttrToBlexRec(CONST catstr: STRING;
                                       catlen: INTEGER;
                                       VAR pattr: LDCONVREC_pAttrStruct;
                                       VAR rec: LSDOMAINT_BlexStruct):
                                       BOOLEAN;
VAR result : BOOLEAN;
    attr   : LDCONVREC_pAttrStruct;
    catli  : LIDOMAINT_syntcat;
BEGIN
   result := LDSTRTOTYPE_Cat(catstr, catlen, catli);
   attr := pattr;
   IF result THEN BEGIN
      rec.cat := LoopHoles.Retype(catli,LSDOMAINT_syntcat);
      CASE rec.cat OF 
      BADJSUFF: BEGIN
         result := LSCONVATTR_BADJrecord(rec.BADJSUFFrec, attr);
         END;
      BADJ: BEGIN
         result := LSCONVATTR_BADJrecord(rec.BADJrec, attr);
         END;
      BADVSUFF: BEGIN
         result := LSCONVATTR_BADVrecord(rec.BADVSUFFrec, attr);
         END;
      BADV: BEGIN
         result := LSCONVATTR_BADVrecord(rec.BADVrec, attr);
         END;
      RADV: BEGIN
         result := LSCONVATTR_RADVrecord(rec.RADVrec, attr);
         END;
      ART: BEGIN
         result := LSCONVATTR_ARTrecord(rec.ARTrec, attr);
         END;
      BBIGPRO: BEGIN
         result := LSCONVATTR_BPERSPROrecord(rec.BBIGPROrec, attr);
         END;
      CONJ: BEGIN
         result := LSCONVATTR_CONJrecord(rec.CONJrec, attr);
         END;
      COORD: BEGIN
         result := LSCONVATTR_COORDrecord(rec.COORDrec, attr);
         END;
      DEMADJ: BEGIN
         result := LSCONVATTR_DEMADJrecord(rec.DEMADJrec, attr);
         END;
      DEMPRO: BEGIN
         result := LSCONVATTR_DEMPROrecord(rec.DEMPROrec, attr);
         END;
      BDET: BEGIN
         result := LSCONVATTR_BDETrecord(rec.BDETrec, attr);
         END;
      DIGIT: BEGIN
         result := LSCONVATTR_DIGITrecord(rec.DIGITrec, attr);
         END;
      EC: BEGIN
         result := LSCONVATTR_ECrecord(rec.ECrec, attr);
         END;
      EN: BEGIN
         result := LSCONVATTR_ENrecord(rec.ENrec, attr);
         END;
      EMPTY: BEGIN
         result := LSCONVATTR_EMPTYrecord(rec.EMPTYrec, attr);
         END;
      EXCLAM: BEGIN
         result := LSCONVATTR_EXCLAMrecord(rec.EXCLAMrec, attr);
         END;
      BINDEFPRO: BEGIN
         result := LSCONVATTR_BINDEFPROrecord(rec.BINDEFPROrec, attr);
         END;
      NEG: BEGIN
         result := LSCONVATTR_NEGrecord(rec.NEGrec, attr);
         END;
      NEGVAR: BEGIN
         result := LSCONVATTR_NEGrecord(rec.NEGVARrec, attr);
         END;
      BNOUNSUFF: BEGIN
         result := LSCONVATTR_BNOUNrecord(rec.BNOUNSUFFrec, attr);
         END;
      BNOUN: BEGIN
         result := LSCONVATTR_BNOUNrecord(rec.BNOUNrec, attr);
         END;
      NUM: BEGIN
         result := LSCONVATTR_NUMrecord(rec.NUMrec, attr);
         END;
      ORDINAL: BEGIN
         result := LSCONVATTR_ORDINALrecord(rec.ORDINALrec, attr);
         END;
      PART: BEGIN
         result := LSCONVATTR_PARTICLErecord(rec.PARTrec, attr);
         END;
      BPERSPRO: BEGIN
         result := LSCONVATTR_BPERSPROrecord(rec.BPERSPROrec, attr);
         END;
      POS: BEGIN
         result := LSCONVATTR_POSrecord(rec.POSrec, attr);
         END;
      POSVAR: BEGIN
         result := LSCONVATTR_POSrecord(rec.POSVARrec, attr);
         END;
      SUBPREP: BEGIN
         result := LSCONVATTR_PREPrecord(rec.SUBPREPrec, attr);
         END;
      PREP: BEGIN
         result := LSCONVATTR_PREPrecord(rec.PREPrec, attr);
         END;
      BPROPERNOUN: BEGIN
         result := LSCONVATTR_BPROPERNOUNrecord(rec.BPROPERNOUNrec, attr);
         END;
      PUNC: BEGIN
         result := LSCONVATTR_PUNCrecord(rec.PUNCrec, attr);
         END;
      PROSENT: BEGIN
         result := LSCONVATTR_PROSENTrecord(rec.PROSENTrec, attr);
         END;
      Q: BEGIN
         result := LSCONVATTR_Qrecord(rec.Qrec, attr);
         END;
      RECIPRO: BEGIN
         result := LSCONVATTR_RECIPROrecord(rec.RECIPROrec, attr);
         END;
      REFLPRO: BEGIN
         result := LSCONVATTR_REFLPROrecord(rec.REFLPROrec, attr);
         END;
      RELANTPRO: BEGIN
         result := LSCONVATTR_RELANTPROrecord(rec.RELANTPROrec, attr);
         END;
      RELPRO: BEGIN
         result := LSCONVATTR_RELPROrecord(rec.RELPROrec, attr);
         END;
      TE: BEGIN
         result := LSCONVATTR_TErecord(rec.TErec, attr);
         END;
      THANAS: BEGIN
         result := LSCONVATTR_THANASrecord(rec.THANASrec, attr);
         END;
      BVERBSUFF: BEGIN
         result := LSCONVATTR_BVERBrecord(rec.BVERBSUFFrec, attr);
         END;
      BVERB: BEGIN
         result := LSCONVATTR_BVERBrecord(rec.BVERBrec, attr);
         END;
      BWHPRO: BEGIN
         result := LSCONVATTR_BWHPROrecord(rec.BWHPROrec, attr);
         END;
      SFCAT: BEGIN
         result := LSCONVATTR_xxkeyrecord(rec.SFCATrec, attr);
         END;
      PFCAT: BEGIN
         result := LSCONVATTR_xxkeyrecord(rec.PFCATrec, attr);
         END;
      END;
   END;
   LSCONVATTR_AttrToBlexRec := result;
END {LSCONVATTR_AttrToBlexRec};
