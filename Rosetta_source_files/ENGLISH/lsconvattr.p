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
FUNCTION LSCONVATTR_NORECORD(VAR rec: LSDOMAINT_NORECORD;
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
   LSCONVATTR_NORECORD := result;
END {LSCONVATTR_NORECORD};

FUNCTION LSCONVATTR_BADJrecord(VAR rec: LSDOMAINT_BADJrecord;
                  VAR pattr: LDCONVREC_pAttrStruct): BOOLEAN;
VAR result : BOOLEAN;
    setp   : LDCONVREC_pSetValueType;
    attr   : LDCONVREC_pAttrStruct;

    compformations : LSDOMAINT_compformationtype; 
    req : LSDOMAINT_polaritytype; 
    env : LSDOMAINT_polaritytype; 
    uses : LSDOMAINT_adjusetype; 
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
                       'compformations',14) = 0 THEN BEGIN
         setp := setvalue;
         rec.compformations := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_compformationtype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         compformations);
            IF result THEN BEGIN
               rec.compformations := rec.compformations + [compformations];
            END;
            setp := setp^.NextValue         END

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
                       'advformation',12) = 0 THEN BEGIN
         result := LSSTRTOTYPE_advformationtype( fieldvalue.str, fieldvalue.len, rec.advformation);
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

    compformations : LSDOMAINT_compformationtype; 
    req : LSDOMAINT_polaritytype; 
    env : LSDOMAINT_polaritytype; 
    uses : LSDOMAINT_adjusetype; 
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
                       'compformations',14) = 0 THEN BEGIN
         setp := setvalue;
         rec.compformations := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_compformationtype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         compformations);
            IF result THEN BEGIN
               rec.compformations := rec.compformations + [compformations];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'affix',5) = 0 THEN BEGIN
         result := LSSTRTOTYPE_affixtype( fieldvalue.str, fieldvalue.len, rec.affix);
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
                       'advformation',12) = 0 THEN BEGIN
         result := LSSTRTOTYPE_advformationtype( fieldvalue.str, fieldvalue.len, rec.advformation);
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

    compformations : LSDOMAINT_compformationtype; 
    req : LSDOMAINT_polaritytype; 
    env : LSDOMAINT_polaritytype; 
    uses : LSDOMAINT_adjusetype; 
    subcs : LSDOMAINT_adjsubctype; 
    adjpatterns : LSDOMAINT_synpatterntype; 
BEGIN
   result := TRUE; attr := pattr;
   MAKET_ADJrec(rec);
   WHILE (attr <> NIL) AND result DO BEGIN
   WITH attr^ DO BEGIN
      IF FALSE THEN BEGIN
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'compformations',14) = 0 THEN BEGIN
         setp := setvalue;
         rec.compformations := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_compformationtype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         compformations);
            IF result THEN BEGIN
               rec.compformations := rec.compformations + [compformations];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'affix',5) = 0 THEN BEGIN
         result := LSSTRTOTYPE_affixtype( fieldvalue.str, fieldvalue.len, rec.affix);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'compform',8) = 0 THEN BEGIN
         result := LSSTRTOTYPE_compformtype( fieldvalue.str, fieldvalue.len, rec.compform);
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
                       'advformation',12) = 0 THEN BEGIN
         result := LSSTRTOTYPE_advformationtype( fieldvalue.str, fieldvalue.len, rec.advformation);
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

    compformations : LSDOMAINT_compformationtype; 
    req : LSDOMAINT_polaritytype; 
    env : LSDOMAINT_polaritytype; 
    subcs : LSDOMAINT_advsubctype; 
    advpatterns : LSDOMAINT_synpatterntype; 
    position : LSDOMAINT_positiontype; 
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
                       'compformations',14) = 0 THEN BEGIN
         setp := setvalue;
         rec.compformations := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_compformationtype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         compformations);
            IF result THEN BEGIN
               rec.compformations := rec.compformations + [compformations];
            END;
            setp := setp^.NextValue         END

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
                       'position',8) = 0 THEN BEGIN
         setp := setvalue;
         rec.position := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_positiontype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         position);
            IF result THEN BEGIN
               rec.position := rec.position + [position];
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
                       'thanas',6) = 0 THEN BEGIN
         result := LSSTRTOTYPE_thanascompltype( fieldvalue.str, fieldvalue.len, rec.thanas);
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

    compformations : LSDOMAINT_compformationtype; 
    req : LSDOMAINT_polaritytype; 
    env : LSDOMAINT_polaritytype; 
    subcs : LSDOMAINT_advsubctype; 
    advpatterns : LSDOMAINT_synpatterntype; 
    position : LSDOMAINT_positiontype; 
BEGIN
   result := TRUE; attr := pattr;
   MAKET_SUBADVrec(rec);
   WHILE (attr <> NIL) AND result DO BEGIN
   WITH attr^ DO BEGIN
      IF FALSE THEN BEGIN
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'compformations',14) = 0 THEN BEGIN
         setp := setvalue;
         rec.compformations := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_compformationtype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         compformations);
            IF result THEN BEGIN
               rec.compformations := rec.compformations + [compformations];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'affix',5) = 0 THEN BEGIN
         result := LSSTRTOTYPE_affixtype( fieldvalue.str, fieldvalue.len, rec.affix);
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
                       'position',8) = 0 THEN BEGIN
         setp := setvalue;
         rec.position := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_positiontype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         position);
            IF result THEN BEGIN
               rec.position := rec.position + [position];
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
                       'thanas',6) = 0 THEN BEGIN
         result := LSSTRTOTYPE_thanascompltype( fieldvalue.str, fieldvalue.len, rec.thanas);
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

    compformations : LSDOMAINT_compformationtype; 
    req : LSDOMAINT_polaritytype; 
    env : LSDOMAINT_polaritytype; 
    subcs : LSDOMAINT_advsubctype; 
    advpatterns : LSDOMAINT_synpatterntype; 
    position : LSDOMAINT_positiontype; 
BEGIN
   result := TRUE; attr := pattr;
   MAKET_ADVrec(rec);
   WHILE (attr <> NIL) AND result DO BEGIN
   WITH attr^ DO BEGIN
      IF FALSE THEN BEGIN
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'compformations',14) = 0 THEN BEGIN
         setp := setvalue;
         rec.compformations := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_compformationtype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         compformations);
            IF result THEN BEGIN
               rec.compformations := rec.compformations + [compformations];
            END;
            setp := setp^.NextValue         END

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'affix',5) = 0 THEN BEGIN
         result := LSSTRTOTYPE_affixtype( fieldvalue.str, fieldvalue.len, rec.affix);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'compform',8) = 0 THEN BEGIN
         result := LSSTRTOTYPE_compformtype( fieldvalue.str, fieldvalue.len, rec.compform);
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
                       'position',8) = 0 THEN BEGIN
         setp := setvalue;
         rec.position := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_positiontype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         position);
            IF result THEN BEGIN
               rec.position := rec.position + [position];
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
                       'thanas',6) = 0 THEN BEGIN
         result := LSSTRTOTYPE_thanascompltype( fieldvalue.str, fieldvalue.len, rec.thanas);
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
    position : LSDOMAINT_positiontype; 
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
                       'mood',4) = 0 THEN BEGIN
         result := LSSTRTOTYPE_xpmoodtype( fieldvalue.str, fieldvalue.len, rec.mood);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'thetaadv',8) = 0 THEN BEGIN
         result := LSSTRTOTYPE_thetaadvtype( fieldvalue.str, fieldvalue.len, rec.thetaadv);
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
                       'position',8) = 0 THEN BEGIN
         setp := setvalue;
         rec.position := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_positiontype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         position);
            IF result THEN BEGIN
               rec.position := rec.position + [position];
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
    position : LSDOMAINT_positiontype; 
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
                       'mood',4) = 0 THEN BEGIN
         result := LSSTRTOTYPE_xpmoodtype( fieldvalue.str, fieldvalue.len, rec.mood);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'thetaadv',8) = 0 THEN BEGIN
         result := LSSTRTOTYPE_thetaadvtype( fieldvalue.str, fieldvalue.len, rec.thetaadv);
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
                       'position',8) = 0 THEN BEGIN
         setp := setvalue;
         rec.position := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_positiontype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         position);
            IF result THEN BEGIN
               rec.position := rec.position + [position];
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
         END;
      END;
      attr^.Error := (NOT result);
      attr := attr^.NextAttr
   END;
   LSCONVATTR_ADVPPROPVARrecord := result;
END {LSCONVATTR_ADVPPROPVARrecord};

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
    aktionsarts : LSDOMAINT_aktionsarttype; 
    adjuncts : LSDOMAINT_adjuncttype; 
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
    aktionsarts : LSDOMAINT_aktionsarttype; 
    adjuncts : LSDOMAINT_adjuncttype; 
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
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'number',6) = 0 THEN BEGIN
         result := LSSTRTOTYPE_numbertype( fieldvalue.str, fieldvalue.len, rec.number);
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
   MAKET_DETrec(rec);
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
                       'syntquant',9) = 0 THEN BEGIN
         result := LSSTRTOTYPE_syntquanttype( fieldvalue.str, fieldvalue.len, rec.syntquant);
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
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'gender',6) = 0 THEN BEGIN
         result := LSSTRTOTYPE_gendertype( fieldvalue.str, fieldvalue.len, rec.gender);
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
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'gender',6) = 0 THEN BEGIN
         result := LSSTRTOTYPE_gendertype( fieldvalue.str, fieldvalue.len, rec.gender);
         END;
      END;
      attr^.Error := (NOT result);
      attr := attr^.NextAttr
   END;
   LSCONVATTR_EMPTYVARrecord := result;
END {LSCONVATTR_EMPTYVARrecord};

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

FUNCTION LSCONVATTR_GENrecord(VAR rec: LSDOMAINT_GENrecord;
                  VAR pattr: LDCONVREC_pAttrStruct): BOOLEAN;
VAR result : BOOLEAN;
    setp   : LDCONVREC_pSetValueType;
    attr   : LDCONVREC_pAttrStruct;

BEGIN
   result := TRUE; attr := pattr;
   MAKET_GENrec(rec);
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
   LSCONVATTR_GENrecord := result;
END {LSCONVATTR_GENrecord};

FUNCTION LSCONVATTR_INDEFPROrecord(VAR rec: LSDOMAINT_INDEFPROrecord;
                  VAR pattr: LDCONVREC_pAttrStruct): BOOLEAN;
VAR result : BOOLEAN;
    setp   : LDCONVREC_pSetValueType;
    attr   : LDCONVREC_pAttrStruct;

    req : LSDOMAINT_polaritytype; 
    env : LSDOMAINT_polaritytype; 
BEGIN
   result := TRUE; attr := pattr;
   MAKET_SUBINDEFPROrec(rec);
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
                       'poss',4) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.poss := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.poss := FALSE; result := TRUE 
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
                       'NPhead',6) = 0 THEN BEGIN
         result := LSSTRTOTYPE_npheadtype( fieldvalue.str, fieldvalue.len, rec.NPhead);
         END;
      END;
      attr^.Error := (NOT result);
      attr := attr^.NextAttr
   END;
   LSCONVATTR_INDEFPROrecord := result;
END {LSCONVATTR_INDEFPROrecord};

FUNCTION LSCONVATTR_BIRRPREFrecord(VAR rec: LSDOMAINT_BIRRPREFrecord;
                  VAR pattr: LDCONVREC_pAttrStruct): BOOLEAN;
VAR result : BOOLEAN;
    setp   : LDCONVREC_pSetValueType;
    attr   : LDCONVREC_pAttrStruct;

    heads : LSDOMAINT_headtype; 
BEGIN
   result := TRUE; attr := pattr;
   MAKET_BIRRPREFrec(rec);
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
                       'heads',5) = 0 THEN BEGIN
         setp := setvalue;
         rec.heads := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_headtype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         heads);
            IF result THEN BEGIN
               rec.heads := rec.heads + [heads];
            END;
            setp := setp^.NextValue         END

         END;
      END;
      attr^.Error := (NOT result);
      attr := attr^.NextAttr
   END;
   LSCONVATTR_BIRRPREFrecord := result;
END {LSCONVATTR_BIRRPREFrecord};

FUNCTION LSCONVATTR_NEGrecord(VAR rec: LSDOMAINT_NEGrecord;
                  VAR pattr: LDCONVREC_pAttrStruct): BOOLEAN;
VAR result : BOOLEAN;
    setp   : LDCONVREC_pSetValueType;
    attr   : LDCONVREC_pAttrStruct;

BEGIN
   result := TRUE; attr := pattr;
   MAKET_NEGrec(rec);
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

FUNCTION LSCONVATTR_NEGVARrecord(VAR rec: LSDOMAINT_NEGVARrecord;
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
         END;
      END;
      attr^.Error := (NOT result);
      attr := attr^.NextAttr
   END;
   LSCONVATTR_NEGVARrecord := result;
END {LSCONVATTR_NEGVARrecord};

FUNCTION LSCONVATTR_BNOUNrecord(VAR rec: LSDOMAINT_BNOUNrecord;
                  VAR pattr: LDCONVREC_pAttrStruct): BOOLEAN;
VAR result : BOOLEAN;
    setp   : LDCONVREC_pSetValueType;
    attr   : LDCONVREC_pAttrStruct;

    req : LSDOMAINT_polaritytype; 
    env : LSDOMAINT_polaritytype; 
    plurforms : LSDOMAINT_plurformtype; 
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
                       'plurforms',9) = 0 THEN BEGIN
         setp := setvalue;
         rec.plurforms := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_plurformtype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         plurforms);
            IF result THEN BEGIN
               rec.plurforms := rec.plurforms + [plurforms];
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
                       'poss',4) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.poss := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.poss := FALSE; result := TRUE 
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
    plurforms : LSDOMAINT_plurformtype; 
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
                       'plurforms',9) = 0 THEN BEGIN
         setp := setvalue;
         rec.plurforms := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_plurformtype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         plurforms);
            IF result THEN BEGIN
               rec.plurforms := rec.plurforms + [plurforms];
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
                       'affix',5) = 0 THEN BEGIN
         result := LSSTRTOTYPE_affixtype( fieldvalue.str, fieldvalue.len, rec.affix);
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
                       'poss',4) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.poss := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.poss := FALSE; result := TRUE 
         END;
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
    plurforms : LSDOMAINT_plurformtype; 
    genders : LSDOMAINT_gendertype; 
    numbers : LSDOMAINT_numbertype; 
    sexes : LSDOMAINT_sextype; 
    subcs : LSDOMAINT_nounsubctype; 
    posscomas : LSDOMAINT_posscomatype; 
    nounpatterns : LSDOMAINT_synpatterntype; 
BEGIN
   result := TRUE; attr := pattr;
   MAKET_NOUNrec(rec);
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
                       'plurforms',9) = 0 THEN BEGIN
         setp := setvalue;
         rec.plurforms := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_plurformtype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         plurforms);
            IF result THEN BEGIN
               rec.plurforms := rec.plurforms + [plurforms];
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
                       'affix',5) = 0 THEN BEGIN
         result := LSSTRTOTYPE_affixtype( fieldvalue.str, fieldvalue.len, rec.affix);
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
                       'poss',4) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.poss := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.poss := FALSE; result := TRUE 
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

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'poss',4) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.poss := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.poss := FALSE; result := TRUE 
         END;
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

         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'poss',4) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.poss := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.poss := FALSE; result := TRUE 
         END;
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
   MAKET_VARNPrec(rec);
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
                       'mood',4) = 0 THEN BEGIN
         result := LSSTRTOTYPE_xpmoodtype( fieldvalue.str, fieldvalue.len, rec.mood);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'generic',7) = 0 THEN BEGIN
         result := LSSTRTOTYPE_generictype( fieldvalue.str, fieldvalue.len, rec.generic);
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
                       'poss',4) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.poss := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.poss := FALSE; result := TRUE 
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
                       'mood',4) = 0 THEN BEGIN
         result := LSSTRTOTYPE_xpmoodtype( fieldvalue.str, fieldvalue.len, rec.mood);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'generic',7) = 0 THEN BEGIN
         result := LSSTRTOTYPE_generictype( fieldvalue.str, fieldvalue.len, rec.generic);
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
                       'poss',4) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.poss := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.poss := FALSE; result := TRUE 
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

    numbers : LSDOMAINT_numbertype; 
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
                       'person',6) = 0 THEN BEGIN
         result := LSSTRTOTYPE_persontype( fieldvalue.str, fieldvalue.len, rec.person);
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
                       'animate',7) = 0 THEN BEGIN
         result := LSSTRTOTYPE_animatetype( fieldvalue.str, fieldvalue.len, rec.animate);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'predpos',7) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.predpos := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.predpos := FALSE; result := TRUE 
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
                       'person',6) = 0 THEN BEGIN
         result := LSSTRTOTYPE_persontype( fieldvalue.str, fieldvalue.len, rec.person);
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
                       'animate',7) = 0 THEN BEGIN
         result := LSSTRTOTYPE_animatetype( fieldvalue.str, fieldvalue.len, rec.animate);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'predpos',7) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.predpos := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.predpos := FALSE; result := TRUE 
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

BEGIN
   result := TRUE; attr := pattr;
   MAKET_PERSPROrec(rec);
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
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'gender',6) = 0 THEN BEGIN
         result := LSSTRTOTYPE_gendertype( fieldvalue.str, fieldvalue.len, rec.gender);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'animate',7) = 0 THEN BEGIN
         result := LSSTRTOTYPE_animatetype( fieldvalue.str, fieldvalue.len, rec.animate);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'predpos',7) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.predpos := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.predpos := FALSE; result := TRUE 
         END;
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'NPhead',6) = 0 THEN BEGIN
         result := LSSTRTOTYPE_npheadtype( fieldvalue.str, fieldvalue.len, rec.NPhead);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'persprocase',11) = 0 THEN BEGIN
         result := LSSTRTOTYPE_casetype( fieldvalue.str, fieldvalue.len, rec.persprocase);
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
   MAKET_POSrec(rec);
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

FUNCTION LSCONVATTR_POSVARrecord(VAR rec: LSDOMAINT_POSVARrecord;
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
         END;
      END;
      attr^.Error := (NOT result);
      attr := attr^.NextAttr
   END;
   LSCONVATTR_POSVARrecord := result;
END {LSCONVATTR_POSVARrecord};

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
                       'mood',4) = 0 THEN BEGIN
         result := LSSTRTOTYPE_xpmoodtype( fieldvalue.str, fieldvalue.len, rec.mood);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'antecedent',10) = 0 THEN BEGIN
         result := LSSTRTOTYPE_antecedenttype( fieldvalue.str, fieldvalue.len, rec.antecedent);
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
         END;
      END;
      attr^.Error := (NOT result);
      attr := attr^.NextAttr
   END;
   LSCONVATTR_POSSPROrecord := result;
END {LSCONVATTR_POSSPROrecord};

FUNCTION LSCONVATTR_BPREFIXrecord(VAR rec: LSDOMAINT_BPREFIXrecord;
                  VAR pattr: LDCONVREC_pAttrStruct): BOOLEAN;
VAR result : BOOLEAN;
    setp   : LDCONVREC_pSetValueType;
    attr   : LDCONVREC_pAttrStruct;

    heads : LSDOMAINT_headtype; 
BEGIN
   result := TRUE; attr := pattr;
   MAKET_BPREFIXrec(rec);
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
                       'heads',5) = 0 THEN BEGIN
         setp := setvalue;
         rec.heads := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_headtype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         heads);
            IF result THEN BEGIN
               rec.heads := rec.heads + [heads];
            END;
            setp := setp^.NextValue         END

         END;
      END;
      attr^.Error := (NOT result);
      attr := attr^.NextAttr
   END;
   LSCONVATTR_BPREFIXrecord := result;
END {LSCONVATTR_BPREFIXrecord};

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
                       'specQ',5) = 0 THEN BEGIN
         result := LSSTRTOTYPE_specqtype( fieldvalue.str, fieldvalue.len, rec.specQ);
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
                       'specQ',5) = 0 THEN BEGIN
         result := LSSTRTOTYPE_specqtype( fieldvalue.str, fieldvalue.len, rec.specQ);
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
                       'specQ',5) = 0 THEN BEGIN
         result := LSSTRTOTYPE_specqtype( fieldvalue.str, fieldvalue.len, rec.specQ);
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
                       'specQ',5) = 0 THEN BEGIN
         result := LSSTRTOTYPE_specqtype( fieldvalue.str, fieldvalue.len, rec.specQ);
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

    plurforms : LSDOMAINT_plurformtype; 
    sexes : LSDOMAINT_sextype; 
    genders : LSDOMAINT_gendertype; 
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
                       'plurforms',9) = 0 THEN BEGIN
         setp := setvalue;
         rec.plurforms := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_plurformtype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         plurforms);
            IF result THEN BEGIN
               rec.plurforms := rec.plurforms + [plurforms];
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
                       'poss',4) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.poss := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.poss := FALSE; result := TRUE 
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

    plurforms : LSDOMAINT_plurformtype; 
    numbers : LSDOMAINT_numbertype; 
    sexes : LSDOMAINT_sextype; 
    genders : LSDOMAINT_gendertype; 
BEGIN
   result := TRUE; attr := pattr;
   MAKET_PROPERNOUNrec(rec);
   WHILE (attr <> NIL) AND result DO BEGIN
   WITH attr^ DO BEGIN
      IF FALSE THEN BEGIN
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'plurforms',9) = 0 THEN BEGIN
         setp := setvalue;
         rec.plurforms := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_plurformtype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         plurforms);
            IF result THEN BEGIN
               rec.plurforms := rec.plurforms + [plurforms];
            END;
            setp := setp^.NextValue         END

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
                       'poss',4) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.poss := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.poss := FALSE; result := TRUE 
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
         END;
      END;
      attr^.Error := (NOT result);
      attr := attr^.NextAttr
   END;
   LSCONVATTR_PROPERNOUNrecord := result;
END {LSCONVATTR_PROPERNOUNrecord};

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
                       'neg',3) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.neg := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.neg := FALSE; result := TRUE 
         END;
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
                       'neg',3) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.neg := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.neg := FALSE; result := TRUE 
         END;
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
                       'one',3) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.one := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.one := FALSE; result := TRUE 
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
                       'gender',6) = 0 THEN BEGIN
         result := LSSTRTOTYPE_gendertype( fieldvalue.str, fieldvalue.len, rec.gender);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'one',3) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.one := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.one := FALSE; result := TRUE 
         END;
         END;
      END;
      attr^.Error := (NOT result);
      attr := attr^.NextAttr
   END;
   LSCONVATTR_REFLPROrecord := result;
END {LSCONVATTR_REFLPROrecord};

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

FUNCTION LSCONVATTR_THERErecord(VAR rec: LSDOMAINT_THERErecord;
                  VAR pattr: LDCONVREC_pAttrStruct): BOOLEAN;
VAR result : BOOLEAN;
    setp   : LDCONVREC_pSetValueType;
    attr   : LDCONVREC_pAttrStruct;

BEGIN
   result := TRUE; attr := pattr;
   MAKET_THERErec(rec);
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
   LSCONVATTR_THERErecord := result;
END {LSCONVATTR_THERErecord};

FUNCTION LSCONVATTR_TOCATrecord(VAR rec: LSDOMAINT_TOCATrecord;
                  VAR pattr: LDCONVREC_pAttrStruct): BOOLEAN;
VAR result : BOOLEAN;
    setp   : LDCONVREC_pSetValueType;
    attr   : LDCONVREC_pAttrStruct;

BEGIN
   result := TRUE; attr := pattr;
   MAKET_TOCATrec(rec);
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
   LSCONVATTR_TOCATrecord := result;
END {LSCONVATTR_TOCATrecord};

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
                       'ingform',7) = 0 THEN BEGIN
         result := LSSTRTOTYPE_ingformtype( fieldvalue.str, fieldvalue.len, rec.ingform);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'sform',5) = 0 THEN BEGIN
         result := LSSTRTOTYPE_sformtype( fieldvalue.str, fieldvalue.len, rec.sform);
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
                       'oblcontrol',10) = 0 THEN BEGIN
         result := LSSTRTOTYPE_oblcontroltype( fieldvalue.str, fieldvalue.len, rec.oblcontrol);
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
                       'thatdel',7) = 0 THEN BEGIN
         result := LSSTRTOTYPE_thatdeltype( fieldvalue.str, fieldvalue.len, rec.thatdel);
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
                       'ingform',7) = 0 THEN BEGIN
         result := LSSTRTOTYPE_ingformtype( fieldvalue.str, fieldvalue.len, rec.ingform);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'sform',5) = 0 THEN BEGIN
         result := LSSTRTOTYPE_sformtype( fieldvalue.str, fieldvalue.len, rec.sform);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'affix',5) = 0 THEN BEGIN
         result := LSSTRTOTYPE_affixtype( fieldvalue.str, fieldvalue.len, rec.affix);
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
                       'oblcontrol',10) = 0 THEN BEGIN
         result := LSSTRTOTYPE_oblcontroltype( fieldvalue.str, fieldvalue.len, rec.oblcontrol);
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
                       'thatdel',7) = 0 THEN BEGIN
         result := LSSTRTOTYPE_thatdeltype( fieldvalue.str, fieldvalue.len, rec.thatdel);
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
    numbers : LSDOMAINT_numbertype; 
    possvoices : LSDOMAINT_voicetype; 
    synvps : LSDOMAINT_synpatterntype; 
    adjuncts : LSDOMAINT_adjuncttype; 
    classes : LSDOMAINT_classtype; 
BEGIN
   result := TRUE; attr := pattr;
   MAKET_VERBrec(rec);
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
                       'ingform',7) = 0 THEN BEGIN
         result := LSSTRTOTYPE_ingformtype( fieldvalue.str, fieldvalue.len, rec.ingform);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'sform',5) = 0 THEN BEGIN
         result := LSSTRTOTYPE_sformtype( fieldvalue.str, fieldvalue.len, rec.sform);
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'affix',5) = 0 THEN BEGIN
         result := LSSTRTOTYPE_affixtype( fieldvalue.str, fieldvalue.len, rec.affix);
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
                       'oblcontrol',10) = 0 THEN BEGIN
         result := LSSTRTOTYPE_oblcontroltype( fieldvalue.str, fieldvalue.len, rec.oblcontrol);
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
                       'thatdel',7) = 0 THEN BEGIN
         result := LSSTRTOTYPE_thatdeltype( fieldvalue.str, fieldvalue.len, rec.thatdel);
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
    synvps : LSDOMAINT_synpatterntype; 
    persons : LSDOMAINT_persontype; 
    numbers : LSDOMAINT_numbertype; 
    synvpefs : LSDOMAINT_synpatterntype; 
    adjvpefs : LSDOMAINT_synpatterntype; 
    classes : LSDOMAINT_classtype; 
    foundauxes : LSDOMAINT_auxtype; 
    adjuncts : LSDOMAINT_adjuncttype; 
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
                       'modus',5) = 0 THEN BEGIN
         result := LSSTRTOTYPE_modustype( fieldvalue.str, fieldvalue.len, rec.modus);
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
                       'headfound',9) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.headfound := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.headfound := FALSE; result := TRUE 
         END;
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'Scomplfound',11) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.Scomplfound := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.Scomplfound := FALSE; result := TRUE 
         END;
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'foundauxes',10) = 0 THEN BEGIN
         setp := setvalue;
         rec.foundauxes := [];
         WHILE (setp <> NIL) AND result DO BEGIN
            result := LSSTRTOTYPE_auxtype(
                         setp^.eltvalue.str,
                         setp^.eltvalue.len,
                         foundauxes);
            IF result THEN BEGIN
               rec.foundauxes := rec.foundauxes + [foundauxes];
            END;
            setp := setp^.NextValue         END

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
                       'reflexivity',11) = 0 THEN BEGIN
         result := LSSTRTOTYPE_reflexivetype( fieldvalue.str, fieldvalue.len, rec.reflexivity);
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
                       'prepobj2found',13) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.prepobj2found := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.prepobj2found := FALSE; result := TRUE 
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
                       'adjppredfound',13) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.adjppredfound := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.adjppredfound := FALSE; result := TRUE 
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
    aktionsarts : LSDOMAINT_aktionsarttype; 
    adjuncts : LSDOMAINT_adjuncttype; 
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
    aktionsarts : LSDOMAINT_aktionsarttype; 
    adjuncts : LSDOMAINT_adjuncttype; 
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
                       'poss',4) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.poss := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.poss := FALSE; result := TRUE 
         END;
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'whcase',6) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.whcase := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.whcase := FALSE; result := TRUE 
         END;
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'number',6) = 0 THEN BEGIN
         result := LSSTRTOTYPE_numbertype( fieldvalue.str, fieldvalue.len, rec.number);
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
    cases : LSDOMAINT_casetype; 
BEGIN
   result := TRUE; attr := pattr;
   MAKET_WHPROrec(rec);
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
                       'poss',4) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.poss := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.poss := FALSE; result := TRUE 
         END;
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'whcase',6) = 0 THEN BEGIN
         result := FALSE;
         IF STR_Compare(fieldvalue.str, fieldvalue.len,
                       'TRUE', 4) = 0 THEN BEGIN
            rec.whcase := TRUE; result := TRUE 
            END
         ELSE IF STR_Compare(fieldvalue.str, fieldvalue.len,
                             'FALSE', 5) = 0 THEN BEGIN
            rec.whcase := FALSE; result := TRUE 
         END;
         END
      ELSE IF STR_Compare(fieldname.str, fieldname.len,
                       'number',6) = 0 THEN BEGIN
         result := LSSTRTOTYPE_numbertype( fieldvalue.str, fieldvalue.len, rec.number);
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
      ART: BEGIN
         result := LSCONVATTR_ARTrecord(rec.ARTfield^, attr);
         END;
      ASP: BEGIN
         result := LSCONVATTR_ASPrecord(rec.ASPfield^, attr);
         END;
      BBIGPRO: BEGIN
         result := LSCONVATTR_BPERSPROrecord(rec.BBIGPROfield^, attr);
         END;
      BIGPRO: BEGIN
         result := LSCONVATTR_BIGPROrecord(rec.BIGPROfield^, attr);
         END;
      BIRRPREF: BEGIN
         result := LSCONVATTR_BIRRPREFrecord(rec.BIRRPREFfield^, attr);
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
      DETP: BEGIN
         result := LSCONVATTR_DETPrecord(rec.DETPfield^, attr);
         END;
      DIGIT: BEGIN
         result := LSCONVATTR_DIGITrecord(rec.DIGITfield^, attr);
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
      GEN: BEGIN
         result := LSCONVATTR_GENrecord(rec.GENfield^, attr);
         END;
      INDEFPRO: BEGIN
         result := LSCONVATTR_INDEFPROrecord(rec.INDEFPROfield^, attr);
         END;
      SUBINDEFPRO: BEGIN
         result := LSCONVATTR_INDEFPROrecord(rec.SUBINDEFPROfield^, attr);
         END;
      NEG: BEGIN
         result := LSCONVATTR_NEGrecord(rec.NEGfield^, attr);
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
      CN: BEGIN
         result := LSCONVATTR_CNrecord(rec.CNfield^, attr);
         END;
      NP: BEGIN
         result := LSCONVATTR_NPrecord(rec.NPfield^, attr);
         END;
      VARNP: BEGIN
         result := LSCONVATTR_NPrecord(rec.VARNPfield^, attr);
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
      POSSADJ: BEGIN
         result := LSCONVATTR_POSSADJrecord(rec.POSSADJfield^, attr);
         END;
      POSSPRO: BEGIN
         result := LSCONVATTR_POSSPROrecord(rec.POSSPROfield^, attr);
         END;
      BPREFIX: BEGIN
         result := LSCONVATTR_BPREFIXrecord(rec.BPREFIXfield^, attr);
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
      BPROPERNOUN: BEGIN
         result := LSCONVATTR_BPROPERNOUNrecord(rec.BPROPERNOUNfield^, attr);
         END;
      PROPERNOUN: BEGIN
         result := LSCONVATTR_PROPERNOUNrecord(rec.PROPERNOUNfield^, attr);
         END;
      PROSENT: BEGIN
         result := LSCONVATTR_PROSENTrecord(rec.PROSENTfield^, attr);
         END;
      PUNC: BEGIN
         result := LSCONVATTR_PUNCrecord(rec.PUNCfield^, attr);
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
      RELPRO: BEGIN
         result := LSCONVATTR_RELPROrecord(rec.RELPROfield^, attr);
         END;
      SENTENCE: BEGIN
         result := LSCONVATTR_SENTENCErecord(rec.SENTENCEfield^, attr);
         END;
      TOCAT: BEGIN
         result := LSCONVATTR_TOCATrecord(rec.TOCATfield^, attr);
         END;
      THANAS: BEGIN
         result := LSCONVATTR_THANASrecord(rec.THANASfield^, attr);
         END;
      THANP: BEGIN
         result := LSCONVATTR_THANPrecord(rec.THANPfield^, attr);
         END;
      THERE: BEGIN
         result := LSCONVATTR_THERErecord(rec.THEREfield^, attr);
         END;
      UTT: BEGIN
         result := LSCONVATTR_NORECORD(rec.UTTfield^, attr);
         END;
      ADJPPROPVAR: BEGIN
         result := LSCONVATTR_ADJPPROPVARrecord(rec.ADJPPROPVARfield^, attr);
         END;
      ADVPVAR: BEGIN
         result := LSCONVATTR_ADVPVARrecord(rec.ADVPVARfield^, attr);
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
      NPVAR: BEGIN
         result := LSCONVATTR_NPVARrecord(rec.NPVARfield^, attr);
         END;
      NPPROPVAR: BEGIN
         result := LSCONVATTR_NPPROPVARrecord(rec.NPPROPVARfield^, attr);
         END;
      PREPPVAR: BEGIN
         result := LSCONVATTR_PREPPVARrecord(rec.PREPPVARfield^, attr);
         END;
      PREPPPROPVAR: BEGIN
         result := LSCONVATTR_PREPPPROPVARrecord(rec.PREPPPROPVARfield^, attr);
         END;
      PROSENTVAR: BEGIN
         result := LSCONVATTR_PROSENTVARrecord(rec.PROSENTVARfield^, attr);
         END;
      SENTENCEVAR: BEGIN
         result := LSCONVATTR_SENTENCEVARrecord(rec.SENTENCEVARfield^, attr);
         END;
      VERBPPROPVAR: BEGIN
         result := LSCONVATTR_VERBPPROPVARrecord(rec.VERBPPROPVARfield^, attr);
         END;
      EMPTYVAR: BEGIN
         result := LSCONVATTR_EMPTYVARrecord(rec.EMPTYVARfield^, attr);
         END;
      NEGVAR: BEGIN
         result := LSCONVATTR_NEGVARrecord(rec.NEGVARfield^, attr);
         END;
      POSVAR: BEGIN
         result := LSCONVATTR_POSVARrecord(rec.POSVARfield^, attr);
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
      ART: BEGIN
         result := LSCONVATTR_ARTrecord(rec.ARTrec, attr);
         END;
      BBIGPRO: BEGIN
         result := LSCONVATTR_BPERSPROrecord(rec.BBIGPROrec, attr);
         END;
      BIRRPREF: BEGIN
         result := LSCONVATTR_BIRRPREFrecord(rec.BIRRPREFrec, attr);
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
      EN: BEGIN
         result := LSCONVATTR_ENrecord(rec.ENrec, attr);
         END;
      EMPTY: BEGIN
         result := LSCONVATTR_EMPTYrecord(rec.EMPTYrec, attr);
         END;
      EXCLAM: BEGIN
         result := LSCONVATTR_EXCLAMrecord(rec.EXCLAMrec, attr);
         END;
      GEN: BEGIN
         result := LSCONVATTR_GENrecord(rec.GENrec, attr);
         END;
      INDEFPRO: BEGIN
         result := LSCONVATTR_INDEFPROrecord(rec.INDEFPROrec, attr);
         END;
      SUBINDEFPRO: BEGIN
         result := LSCONVATTR_INDEFPROrecord(rec.SUBINDEFPROrec, attr);
         END;
      NEG: BEGIN
         result := LSCONVATTR_NEGrecord(rec.NEGrec, attr);
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
      BPREFIX: BEGIN
         result := LSCONVATTR_BPREFIXrecord(rec.BPREFIXrec, attr);
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
      PROSENT: BEGIN
         result := LSCONVATTR_PROSENTrecord(rec.PROSENTrec, attr);
         END;
      PUNC: BEGIN
         result := LSCONVATTR_PUNCrecord(rec.PUNCrec, attr);
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
      RELPRO: BEGIN
         result := LSCONVATTR_RELPROrecord(rec.RELPROrec, attr);
         END;
      TOCAT: BEGIN
         result := LSCONVATTR_TOCATrecord(rec.TOCATrec, attr);
         END;
      THANAS: BEGIN
         result := LSCONVATTR_THANASrecord(rec.THANASrec, attr);
         END;
      THERE: BEGIN
         result := LSCONVATTR_THERErecord(rec.THERErec, attr);
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
      WHPRO: BEGIN
         result := LSCONVATTR_WHPROrecord(rec.WHPROrec, attr);
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
