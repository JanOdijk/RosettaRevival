
EXPORT(lsauxdom);
     pragma C_include('lsauxdom.pf');
     pragma C_include('string.pf');
     pragma C_include('files.pf');
     pragma C_include('lsdomaint.pf');
     pragma C_include('strtokey.pf');
PROGRAM LSAUXDOM;

WITH strng,files,lsdomaint,strtokey;
FUNCTION auxkey(strkey:STRING_string):INTEGER;
VAR int:INTEGER;
BEGIN
 STRTOKEY_getSkey(strkey,int); auxkey:=int;
END;

 FUNCTION LSAUXDOM_CpADVONPRSRFEMPTY
                         (rec:LSDOMAINT_ADVRECORD):BOOLEAN;
VAR Bool : BOOLEAN;
BEGIN 
  Bool := FALSE;
  WITH rec DO
  BEGIN
    IF (REQ = [POSPOL,NEGPOL,OMEGAPOL] ) THEN
IF (ENV = [POSPOL,NEGPOL,OMEGAPOL] ) THEN
IF (COMPARATIVES = [NOCOMP] ) THEN
IF (SUPERLATIVES = [NOSUP] ) THEN
IF (SUBCS = [TEMPADV] ) THEN
IF (QSTATUS = FALSE ) THEN
IF (FORM = POSITIVE ) THEN
IF (EORENFORM = NOFORM ) THEN
IF (CLASS = REFERENCE ) THEN
IF (DEIXIS = PRESENTDEIXIS ) THEN
IF (ASPECT = PERFECTIVE ) THEN
IF (RETRO = FALSE ) THEN
IF (MOOD = DECLXPMOOD ) THEN
IF (THETAADV = THETAADV100 ) THEN
IF (ADVPATTERNS = [SYNNOVPARGS] ) THEN
IF (PREPKEY = 0 ) THEN
IF (TEMPORAL = TRUE ) THEN
IF (POSSNIETNP = FALSE ) THEN
IF (THANAS = OMEGACOMPL ) THEN
      Bool:=TRUE;
  END;{with}
  LSAUXDOM_CpADVONPRSRFEMPTY:=Bool;
END;{function}
 PROCEDURE LSAUXDOM_AsADVONPRSRFEMPTY(VAR rec:LSDOMAINT_ADVRECORD);
BEGIN
WITH rec DO
BEGIN
REQ := [POSPOL,NEGPOL,OMEGAPOL];
                                                      ENV := [POSPOL,NEGPOL,OMEGAPOL];
                                                      COMPARATIVES := [NOCOMP];
                                                      SUPERLATIVES := [NOSUP];
                                                      SUBCS := [TEMPADV];
                                                      QSTATUS := FALSE;
                                                      FORM := POSITIVE;
                                                      EORENFORM := NOFORM;
                                                      CLASS := REFERENCE;
                                                      DEIXIS := PRESENTDEIXIS;
                                                      ASPECT := PERFECTIVE;
                                                      RETRO := FALSE;
                                                      MOOD := DECLXPMOOD;
                                                      THETAADV := THETAADV100;
                                                      ADVPATTERNS := [SYNNOVPARGS];
                                                      PREPKEY := 0;
                                                      TEMPORAL := TRUE;
                                                      POSSNIETNP := FALSE;
                                                      THANAS := OMEGACOMPL;
                                                      END
END;

 FUNCTION LSAUXDOM_CpADVONPSTRFEMPTY
                         (rec:LSDOMAINT_ADVRECORD):BOOLEAN;
VAR Bool : BOOLEAN;
BEGIN 
  Bool := FALSE;
  WITH rec DO
  BEGIN
    IF (REQ = [POSPOL,NEGPOL,OMEGAPOL] ) THEN
IF (ENV = [POSPOL,NEGPOL,OMEGAPOL] ) THEN
IF (COMPARATIVES = [NOCOMP] ) THEN
IF (SUPERLATIVES = [NOSUP] ) THEN
IF (SUBCS = [TEMPADV] ) THEN
IF (QSTATUS = FALSE ) THEN
IF (FORM = POSITIVE ) THEN
IF (EORENFORM = NOFORM ) THEN
IF (CLASS = REFERENCE ) THEN
IF (DEIXIS = PASTDEIXIS ) THEN
IF (ASPECT = PERFECTIVE ) THEN
IF (RETRO = FALSE ) THEN
IF (MOOD = DECLXPMOOD ) THEN
IF (THETAADV = THETAADV100 ) THEN
IF (ADVPATTERNS = [SYNNOVPARGS] ) THEN
IF (PREPKEY = 0 ) THEN
IF (TEMPORAL = TRUE ) THEN
IF (POSSNIETNP = FALSE ) THEN
IF (THANAS = OMEGACOMPL ) THEN
      Bool:=TRUE;
  END;{with}
  LSAUXDOM_CpADVONPSTRFEMPTY:=Bool;
END;{function}
 PROCEDURE LSAUXDOM_AsADVONPSTRFEMPTY(VAR rec:LSDOMAINT_ADVRECORD);
BEGIN
WITH rec DO
BEGIN
REQ := [POSPOL,NEGPOL,OMEGAPOL];
                                                      ENV := [POSPOL,NEGPOL,OMEGAPOL];
                                                      COMPARATIVES := [NOCOMP];
                                                      SUPERLATIVES := [NOSUP];
                                                      SUBCS := [TEMPADV];
                                                      QSTATUS := FALSE;
                                                      FORM := POSITIVE;
                                                      EORENFORM := NOFORM;
                                                      CLASS := REFERENCE;
                                                      DEIXIS := PASTDEIXIS;
                                                      ASPECT := PERFECTIVE;
                                                      RETRO := FALSE;
                                                      MOOD := DECLXPMOOD;
                                                      THETAADV := THETAADV100;
                                                      ADVPATTERNS := [SYNNOVPARGS];
                                                      PREPKEY := 0;
                                                      TEMPORAL := TRUE;
                                                      POSSNIETNP := FALSE;
                                                      THANAS := OMEGACOMPL;
                                                      END
END;

 FUNCTION LSAUXDOM_CpADVONRTRRFEMPTY
                         (rec:LSDOMAINT_ADVRECORD):BOOLEAN;
VAR Bool : BOOLEAN;
BEGIN 
  Bool := FALSE;
  WITH rec DO
  BEGIN
    IF (REQ = [POSPOL,NEGPOL,OMEGAPOL] ) THEN
IF (ENV = [POSPOL,NEGPOL,OMEGAPOL] ) THEN
IF (COMPARATIVES = [NOCOMP] ) THEN
IF (SUPERLATIVES = [NOSUP] ) THEN
IF (SUBCS = [TEMPADV] ) THEN
IF (QSTATUS = FALSE ) THEN
IF (FORM = POSITIVE ) THEN
IF (EORENFORM = NOFORM ) THEN
IF (CLASS = REFERENCE ) THEN
IF (DEIXIS = OMEGADEIXIS ) THEN
IF (ASPECT = IMPERFECTIVE ) THEN
IF (RETRO = TRUE ) THEN
IF (MOOD = DECLXPMOOD ) THEN
IF (THETAADV = THETAADV100 ) THEN
IF (ADVPATTERNS = [SYNNOVPARGS] ) THEN
IF (PREPKEY = 0 ) THEN
IF (TEMPORAL = TRUE ) THEN
IF (POSSNIETNP = FALSE ) THEN
IF (THANAS = OMEGACOMPL ) THEN
      Bool:=TRUE;
  END;{with}
  LSAUXDOM_CpADVONRTRRFEMPTY:=Bool;
END;{function}
 PROCEDURE LSAUXDOM_AsADVONRTRRFEMPTY(VAR rec:LSDOMAINT_ADVRECORD);
BEGIN
WITH rec DO
BEGIN
REQ := [POSPOL,NEGPOL,OMEGAPOL];
                                                      ENV := [POSPOL,NEGPOL,OMEGAPOL];
                                                      COMPARATIVES := [NOCOMP];
                                                      SUPERLATIVES := [NOSUP];
                                                      SUBCS := [TEMPADV];
                                                      QSTATUS := FALSE;
                                                      FORM := POSITIVE;
                                                      EORENFORM := NOFORM;
                                                      CLASS := REFERENCE;
                                                      DEIXIS := OMEGADEIXIS;
                                                      ASPECT := IMPERFECTIVE;
                                                      RETRO := TRUE;
                                                      MOOD := DECLXPMOOD;
                                                      THETAADV := THETAADV100;
                                                      ADVPATTERNS := [SYNNOVPARGS];
                                                      PREPKEY := 0;
                                                      TEMPORAL := TRUE;
                                                      POSSNIETNP := FALSE;
                                                      THANAS := OMEGACOMPL;
                                                      END
END;

 FUNCTION LSAUXDOM_CpADVONDAN
                         (rec:LSDOMAINT_ADVRECORD):BOOLEAN;
VAR Bool : BOOLEAN;
BEGIN 
  Bool := FALSE;
  WITH rec DO
  BEGIN
    IF (REQ = [POSPOL,NEGPOL,OMEGAPOL] ) THEN
IF (ENV = [POSPOL,NEGPOL,OMEGAPOL] ) THEN
IF (COMPARATIVES = [NOCOMP] ) THEN
IF (SUPERLATIVES = [NOSUP] ) THEN
IF (SUBCS = [OTHERADV] ) THEN
IF (QSTATUS = FALSE ) THEN
IF (FORM = POSITIVE ) THEN
IF (EORENFORM = NOFORM ) THEN
IF (CLASS = OMEGATIMEADVCLASS ) THEN
IF (DEIXIS = OMEGADEIXIS ) THEN
IF (ASPECT = OMEGAASPECT ) THEN
IF (RETRO = FALSE ) THEN
IF (MOOD = DECLXPMOOD ) THEN
IF (THETAADV = THETAADV100 ) THEN
IF (ADVPATTERNS = [SYNNOVPARGS] ) THEN
IF (PREPKEY = 0 ) THEN
IF (TEMPORAL = FALSE ) THEN
IF (POSSNIETNP = FALSE ) THEN
IF (THANAS = OMEGACOMPL ) THEN
      Bool:=TRUE;
  END;{with}
  LSAUXDOM_CpADVONDAN:=Bool;
END;{function}
 PROCEDURE LSAUXDOM_AsADVONDAN(VAR rec:LSDOMAINT_ADVRECORD);
BEGIN
WITH rec DO
BEGIN
REQ := [POSPOL,NEGPOL,OMEGAPOL];
                                                      ENV := [POSPOL,NEGPOL,OMEGAPOL];
                                                      COMPARATIVES := [NOCOMP];
                                                      SUPERLATIVES := [NOSUP];
                                                      SUBCS := [OTHERADV];
                                                      QSTATUS := FALSE;
                                                      FORM := POSITIVE;
                                                      EORENFORM := NOFORM;
                                                      CLASS := OMEGATIMEADVCLASS;
                                                      DEIXIS := OMEGADEIXIS;
                                                      ASPECT := OMEGAASPECT;
                                                      RETRO := FALSE;
                                                      MOOD := DECLXPMOOD;
                                                      THETAADV := THETAADV100;
                                                      ADVPATTERNS := [SYNNOVPARGS];
                                                      PREPKEY := 0;
                                                      TEMPORAL := FALSE;
                                                      POSSNIETNP := FALSE;
                                                      THANAS := OMEGACOMPL;
                                                      END
END;

 FUNCTION LSAUXDOM_CpADVPONDAN
                         (rec:LSDOMAINT_ADVPRECORD):BOOLEAN;
VAR Bool : BOOLEAN;
BEGIN 
  Bool := FALSE;
  WITH rec DO
  BEGIN
    IF (REQ = [POSPOL,NEGPOL,OMEGAPOL] ) THEN
IF (ENV = [POSPOL,NEGPOL,OMEGAPOL] ) THEN
IF (CLASS = OMEGATIMEADVCLASS ) THEN
IF (DEIXIS = OMEGADEIXIS ) THEN
IF (ASPECT = OMEGAASPECT ) THEN
IF (RETRO = FALSE ) THEN
IF (SUPERDEIXIS = OMEGADEIXIS ) THEN
IF (ACTSUBCEFS = [OTHERADV] ) THEN
IF (QSTATUS = FALSE ) THEN
IF (MOOD = DECLXPMOOD ) THEN
IF (THETAADV = THETAADV100 ) THEN
IF (ADVPATTERNEFS = [SYNNOVPARGS] ) THEN
IF (TEMPORAL = FALSE ) THEN
IF (RADVB = FALSE ) THEN
IF (POSSNIETNP = FALSE ) THEN
IF (THANAS = OMEGACOMPL ) THEN
IF (THANASCOMPL = FALSE ) THEN
IF (COORD = NOCOORD ) THEN
      Bool:=TRUE;
  END;{with}
  LSAUXDOM_CpADVPONDAN:=Bool;
END;{function}
 PROCEDURE LSAUXDOM_AsADVPONDAN(VAR rec:LSDOMAINT_ADVPRECORD);
BEGIN
WITH rec DO
BEGIN
REQ := [POSPOL,NEGPOL,OMEGAPOL];
                                                      ENV := [POSPOL,NEGPOL,OMEGAPOL];
                                                      CLASS := OMEGATIMEADVCLASS;
                                                      DEIXIS := OMEGADEIXIS;
                                                      ASPECT := OMEGAASPECT;
                                                      RETRO := FALSE;
                                                      SUPERDEIXIS := OMEGADEIXIS;
                                                      ACTSUBCEFS := [OTHERADV];
                                                      QSTATUS := FALSE;
                                                      MOOD := DECLXPMOOD;
                                                      THETAADV := THETAADV100;
                                                      ADVPATTERNEFS := [SYNNOVPARGS];
                                                      TEMPORAL := FALSE;
                                                      RADVB := FALSE;
                                                      POSSNIETNP := FALSE;
                                                      THANAS := OMEGACOMPL;
                                                      THANASCOMPL := FALSE;
                                                      COORD := NOCOORD;
                                                      END
END;

 FUNCTION LSAUXDOM_CpADVPONPRSRFEMPTY
                         (rec:LSDOMAINT_ADVPRECORD):BOOLEAN;
VAR Bool : BOOLEAN;
BEGIN 
  Bool := FALSE;
  WITH rec DO
  BEGIN
    IF (REQ = [POSPOL,NEGPOL,OMEGAPOL] ) THEN
IF (ENV = [POSPOL,NEGPOL,OMEGAPOL] ) THEN
IF (CLASS = REFERENCE ) THEN
IF (DEIXIS = PRESENTDEIXIS ) THEN
IF (ASPECT = PERFECTIVE ) THEN
IF (RETRO = FALSE ) THEN
IF (SUPERDEIXIS = OMEGADEIXIS ) THEN
IF (ACTSUBCEFS = [TEMPADV] ) THEN
IF (QSTATUS = FALSE ) THEN
IF (MOOD = DECLXPMOOD ) THEN
IF (THETAADV = THETAADV100 ) THEN
IF (ADVPATTERNEFS = [SYNNOVPARGS] ) THEN
IF (TEMPORAL = TRUE ) THEN
IF (RADVB = FALSE ) THEN
IF (POSSNIETNP = FALSE ) THEN
IF (THANAS = OMEGACOMPL ) THEN
IF (THANASCOMPL = FALSE ) THEN
IF (COORD = NOCOORD ) THEN
      Bool:=TRUE;
  END;{with}
  LSAUXDOM_CpADVPONPRSRFEMPTY:=Bool;
END;{function}
 PROCEDURE LSAUXDOM_AsADVPONPRSRFEMPTY(VAR rec:LSDOMAINT_ADVPRECORD);
BEGIN
WITH rec DO
BEGIN
REQ := [POSPOL,NEGPOL,OMEGAPOL];
                                                      ENV := [POSPOL,NEGPOL,OMEGAPOL];
                                                      CLASS := REFERENCE;
                                                      DEIXIS := PRESENTDEIXIS;
                                                      ASPECT := PERFECTIVE;
                                                      RETRO := FALSE;
                                                      SUPERDEIXIS := OMEGADEIXIS;
                                                      ACTSUBCEFS := [TEMPADV];
                                                      QSTATUS := FALSE;
                                                      MOOD := DECLXPMOOD;
                                                      THETAADV := THETAADV100;
                                                      ADVPATTERNEFS := [SYNNOVPARGS];
                                                      TEMPORAL := TRUE;
                                                      RADVB := FALSE;
                                                      POSSNIETNP := FALSE;
                                                      THANAS := OMEGACOMPL;
                                                      THANASCOMPL := FALSE;
                                                      COORD := NOCOORD;
                                                      END
END;

 FUNCTION LSAUXDOM_CpADVPONPSTRFEMPTY
                         (rec:LSDOMAINT_ADVPRECORD):BOOLEAN;
VAR Bool : BOOLEAN;
BEGIN 
  Bool := FALSE;
  WITH rec DO
  BEGIN
    IF (REQ = [POSPOL,NEGPOL,OMEGAPOL] ) THEN
IF (ENV = [POSPOL,NEGPOL,OMEGAPOL] ) THEN
IF (CLASS = REFERENCE ) THEN
IF (DEIXIS = PASTDEIXIS ) THEN
IF (ASPECT = PERFECTIVE ) THEN
IF (RETRO = FALSE ) THEN
IF (SUPERDEIXIS = OMEGADEIXIS ) THEN
IF (ACTSUBCEFS = [TEMPADV] ) THEN
IF (QSTATUS = FALSE ) THEN
IF (MOOD = DECLXPMOOD ) THEN
IF (THETAADV = THETAADV100 ) THEN
IF (ADVPATTERNEFS = [SYNNOVPARGS] ) THEN
IF (TEMPORAL = TRUE ) THEN
IF (RADVB = FALSE ) THEN
IF (POSSNIETNP = FALSE ) THEN
IF (THANAS = OMEGACOMPL ) THEN
IF (THANASCOMPL = FALSE ) THEN
IF (COORD = NOCOORD ) THEN
      Bool:=TRUE;
  END;{with}
  LSAUXDOM_CpADVPONPSTRFEMPTY:=Bool;
END;{function}
 PROCEDURE LSAUXDOM_AsADVPONPSTRFEMPTY(VAR rec:LSDOMAINT_ADVPRECORD);
BEGIN
WITH rec DO
BEGIN
REQ := [POSPOL,NEGPOL,OMEGAPOL];
                                                      ENV := [POSPOL,NEGPOL,OMEGAPOL];
                                                      CLASS := REFERENCE;
                                                      DEIXIS := PASTDEIXIS;
                                                      ASPECT := PERFECTIVE;
                                                      RETRO := FALSE;
                                                      SUPERDEIXIS := OMEGADEIXIS;
                                                      ACTSUBCEFS := [TEMPADV];
                                                      QSTATUS := FALSE;
                                                      MOOD := DECLXPMOOD;
                                                      THETAADV := THETAADV100;
                                                      ADVPATTERNEFS := [SYNNOVPARGS];
                                                      TEMPORAL := TRUE;
                                                      RADVB := FALSE;
                                                      POSSNIETNP := FALSE;
                                                      THANAS := OMEGACOMPL;
                                                      THANASCOMPL := FALSE;
                                                      COORD := NOCOORD;
                                                      END
END;

 FUNCTION LSAUXDOM_CpADVPONRTRRFEMPTY
                         (rec:LSDOMAINT_ADVPRECORD):BOOLEAN;
VAR Bool : BOOLEAN;
BEGIN 
  Bool := FALSE;
  WITH rec DO
  BEGIN
    IF (REQ = [POSPOL,NEGPOL,OMEGAPOL] ) THEN
IF (ENV = [POSPOL,NEGPOL,OMEGAPOL] ) THEN
IF (CLASS = REFERENCE ) THEN
IF (DEIXIS = OMEGADEIXIS ) THEN
IF (ASPECT = IMPERFECTIVE ) THEN
IF (RETRO = TRUE ) THEN
IF (SUPERDEIXIS = OMEGADEIXIS ) THEN
IF (ACTSUBCEFS = [TEMPADV] ) THEN
IF (QSTATUS = FALSE ) THEN
IF (MOOD = DECLXPMOOD ) THEN
IF (THETAADV = THETAADV100 ) THEN
IF (ADVPATTERNEFS = [SYNNOVPARGS] ) THEN
IF (TEMPORAL = TRUE ) THEN
IF (RADVB = FALSE ) THEN
IF (POSSNIETNP = FALSE ) THEN
IF (THANAS = OMEGACOMPL ) THEN
IF (THANASCOMPL = FALSE ) THEN
IF (COORD = NOCOORD ) THEN
      Bool:=TRUE;
  END;{with}
  LSAUXDOM_CpADVPONRTRRFEMPTY:=Bool;
END;{function}
 PROCEDURE LSAUXDOM_AsADVPONRTRRFEMPTY(VAR rec:LSDOMAINT_ADVPRECORD);
BEGIN
WITH rec DO
BEGIN
REQ := [POSPOL,NEGPOL,OMEGAPOL];
                                                      ENV := [POSPOL,NEGPOL,OMEGAPOL];
                                                      CLASS := REFERENCE;
                                                      DEIXIS := OMEGADEIXIS;
                                                      ASPECT := IMPERFECTIVE;
                                                      RETRO := TRUE;
                                                      SUPERDEIXIS := OMEGADEIXIS;
                                                      ACTSUBCEFS := [TEMPADV];
                                                      QSTATUS := FALSE;
                                                      MOOD := DECLXPMOOD;
                                                      THETAADV := THETAADV100;
                                                      ADVPATTERNEFS := [SYNNOVPARGS];
                                                      TEMPORAL := TRUE;
                                                      RADVB := FALSE;
                                                      POSSNIETNP := FALSE;
                                                      THANAS := OMEGACOMPL;
                                                      THANASCOMPL := FALSE;
                                                      COORD := NOCOORD;
                                                      END
END;

 FUNCTION LSAUXDOM_CpADVPRECONDAAR
                         (rec:LSDOMAINT_ADVPRECORD):BOOLEAN;
VAR Bool : BOOLEAN;
BEGIN 
  Bool := FALSE;
  WITH rec DO
  BEGIN
    IF (REQ = [POSPOL,NEGPOL,OMEGAPOL] ) THEN
IF (ENV = [POSPOL,NEGPOL,OMEGAPOL] ) THEN
IF (CLASS = OMEGATIMEADVCLASS ) THEN
IF (DEIXIS = OMEGADEIXIS ) THEN
IF (ASPECT = OMEGAASPECT ) THEN
IF (RETRO = FALSE ) THEN
IF (SUPERDEIXIS = OMEGADEIXIS ) THEN
IF (ACTSUBCEFS = [LOCADV] ) THEN
IF (QSTATUS = FALSE ) THEN
IF (MOOD = DECLXPMOOD ) THEN
IF (THETAADV = THETAADV100 ) THEN
IF (ADVPATTERNEFS = [SYNNOVPARGS] ) THEN
IF (TEMPORAL = FALSE ) THEN
IF (RADVB = TRUE ) THEN
IF (POSSNIETNP = FALSE ) THEN
IF (THANAS = OMEGACOMPL ) THEN
IF (THANASCOMPL = FALSE ) THEN
IF (COORD = NOCOORD ) THEN
      Bool:=TRUE;
  END;{with}
  LSAUXDOM_CpADVPRECONDAAR:=Bool;
END;{function}
 PROCEDURE LSAUXDOM_AsADVPRECONDAAR(VAR rec:LSDOMAINT_ADVPRECORD);
BEGIN
WITH rec DO
BEGIN
REQ := [POSPOL,NEGPOL,OMEGAPOL];
                                                      ENV := [POSPOL,NEGPOL,OMEGAPOL];
                                                      CLASS := OMEGATIMEADVCLASS;
                                                      DEIXIS := OMEGADEIXIS;
                                                      ASPECT := OMEGAASPECT;
                                                      RETRO := FALSE;
                                                      SUPERDEIXIS := OMEGADEIXIS;
                                                      ACTSUBCEFS := [LOCADV];
                                                      QSTATUS := FALSE;
                                                      MOOD := DECLXPMOOD;
                                                      THETAADV := THETAADV100;
                                                      ADVPATTERNEFS := [SYNNOVPARGS];
                                                      TEMPORAL := FALSE;
                                                      RADVB := TRUE;
                                                      POSSNIETNP := FALSE;
                                                      THANAS := OMEGACOMPL;
                                                      THANASCOMPL := FALSE;
                                                      COORD := NOCOORD;
                                                      END
END;

 FUNCTION LSAUXDOM_CpADVPRECONER
                         (rec:LSDOMAINT_ADVPRECORD):BOOLEAN;
VAR Bool : BOOLEAN;
BEGIN 
  Bool := FALSE;
  WITH rec DO
  BEGIN
    IF (REQ = [POSPOL,NEGPOL,OMEGAPOL] ) THEN
IF (ENV = [POSPOL,NEGPOL,OMEGAPOL] ) THEN
IF (CLASS = OMEGATIMEADVCLASS ) THEN
IF (DEIXIS = OMEGADEIXIS ) THEN
IF (ASPECT = OMEGAASPECT ) THEN
IF (RETRO = FALSE ) THEN
IF (SUPERDEIXIS = OMEGADEIXIS ) THEN
IF (ACTSUBCEFS = [LOCADV] ) THEN
IF (QSTATUS = FALSE ) THEN
IF (MOOD = DECLXPMOOD ) THEN
IF (THETAADV = THETAADV100 ) THEN
IF (ADVPATTERNEFS = [SYNNOVPARGS] ) THEN
IF (TEMPORAL = FALSE ) THEN
IF (RADVB = TRUE ) THEN
IF (POSSNIETNP = FALSE ) THEN
IF (THANAS = OMEGACOMPL ) THEN
IF (THANASCOMPL = FALSE ) THEN
IF (COORD = NOCOORD ) THEN
      Bool:=TRUE;
  END;{with}
  LSAUXDOM_CpADVPRECONER:=Bool;
END;{function}
 PROCEDURE LSAUXDOM_AsADVPRECONER(VAR rec:LSDOMAINT_ADVPRECORD);
BEGIN
WITH rec DO
BEGIN
REQ := [POSPOL,NEGPOL,OMEGAPOL];
                                                      ENV := [POSPOL,NEGPOL,OMEGAPOL];
                                                      CLASS := OMEGATIMEADVCLASS;
                                                      DEIXIS := OMEGADEIXIS;
                                                      ASPECT := OMEGAASPECT;
                                                      RETRO := FALSE;
                                                      SUPERDEIXIS := OMEGADEIXIS;
                                                      ACTSUBCEFS := [LOCADV];
                                                      QSTATUS := FALSE;
                                                      MOOD := DECLXPMOOD;
                                                      THETAADV := THETAADV100;
                                                      ADVPATTERNEFS := [SYNNOVPARGS];
                                                      TEMPORAL := FALSE;
                                                      RADVB := TRUE;
                                                      POSSNIETNP := FALSE;
                                                      THANAS := OMEGACOMPL;
                                                      THANASCOMPL := FALSE;
                                                      COORD := NOCOORD;
                                                      END
END;

 FUNCTION LSAUXDOM_CpADVPRECONHIER
                         (rec:LSDOMAINT_ADVPRECORD):BOOLEAN;
VAR Bool : BOOLEAN;
BEGIN 
  Bool := FALSE;
  WITH rec DO
  BEGIN
    IF (REQ = [POSPOL,NEGPOL,OMEGAPOL] ) THEN
IF (ENV = [POSPOL,NEGPOL,OMEGAPOL] ) THEN
IF (CLASS = OMEGATIMEADVCLASS ) THEN
IF (DEIXIS = OMEGADEIXIS ) THEN
IF (ASPECT = OMEGAASPECT ) THEN
IF (RETRO = FALSE ) THEN
IF (SUPERDEIXIS = OMEGADEIXIS ) THEN
IF (ACTSUBCEFS = [LOCADV] ) THEN
IF (QSTATUS = FALSE ) THEN
IF (MOOD = DECLXPMOOD ) THEN
IF (THETAADV = THETAADV100 ) THEN
IF (ADVPATTERNEFS = [SYNNOVPARGS] ) THEN
IF (TEMPORAL = FALSE ) THEN
IF (RADVB = TRUE ) THEN
IF (POSSNIETNP = FALSE ) THEN
IF (THANAS = OMEGACOMPL ) THEN
IF (THANASCOMPL = FALSE ) THEN
IF (COORD = NOCOORD ) THEN
      Bool:=TRUE;
  END;{with}
  LSAUXDOM_CpADVPRECONHIER:=Bool;
END;{function}
 PROCEDURE LSAUXDOM_AsADVPRECONHIER(VAR rec:LSDOMAINT_ADVPRECORD);
BEGIN
WITH rec DO
BEGIN
REQ := [POSPOL,NEGPOL,OMEGAPOL];
                                                      ENV := [POSPOL,NEGPOL,OMEGAPOL];
                                                      CLASS := OMEGATIMEADVCLASS;
                                                      DEIXIS := OMEGADEIXIS;
                                                      ASPECT := OMEGAASPECT;
                                                      RETRO := FALSE;
                                                      SUPERDEIXIS := OMEGADEIXIS;
                                                      ACTSUBCEFS := [LOCADV];
                                                      QSTATUS := FALSE;
                                                      MOOD := DECLXPMOOD;
                                                      THETAADV := THETAADV100;
                                                      ADVPATTERNEFS := [SYNNOVPARGS];
                                                      TEMPORAL := FALSE;
                                                      RADVB := TRUE;
                                                      POSSNIETNP := FALSE;
                                                      THANAS := OMEGACOMPL;
                                                      THANASCOMPL := FALSE;
                                                      COORD := NOCOORD;
                                                      END
END;

 FUNCTION LSAUXDOM_CpADVPRECONR
                         (rec:LSDOMAINT_ADVPRECORD):BOOLEAN;
VAR Bool : BOOLEAN;
BEGIN 
  Bool := FALSE;
  WITH rec DO
  BEGIN
    IF (REQ = [POSPOL,NEGPOL,OMEGAPOL] ) THEN
IF (ENV = [POSPOL,NEGPOL,OMEGAPOL] ) THEN
IF (CLASS = OMEGATIMEADVCLASS ) THEN
IF (DEIXIS = OMEGADEIXIS ) THEN
IF (ASPECT = OMEGAASPECT ) THEN
IF (RETRO = FALSE ) THEN
IF (SUPERDEIXIS = OMEGADEIXIS ) THEN
IF (ACTSUBCEFS = [LOCADV] ) THEN
IF (QSTATUS = FALSE ) THEN
IF (MOOD = DECLXPMOOD ) THEN
IF (THETAADV = THETAADV100 ) THEN
IF (ADVPATTERNEFS = [SYNNOVPARGS] ) THEN
IF (TEMPORAL = FALSE ) THEN
IF (RADVB = TRUE ) THEN
IF (POSSNIETNP = FALSE ) THEN
IF (THANAS = OMEGACOMPL ) THEN
IF (THANASCOMPL = FALSE ) THEN
IF (COORD = NOCOORD ) THEN
      Bool:=TRUE;
  END;{with}
  LSAUXDOM_CpADVPRECONR:=Bool;
END;{function}
 PROCEDURE LSAUXDOM_AsADVPRECONR(VAR rec:LSDOMAINT_ADVPRECORD);
BEGIN
WITH rec DO
BEGIN
REQ := [POSPOL,NEGPOL,OMEGAPOL];
                                                      ENV := [POSPOL,NEGPOL,OMEGAPOL];
                                                      CLASS := OMEGATIMEADVCLASS;
                                                      DEIXIS := OMEGADEIXIS;
                                                      ASPECT := OMEGAASPECT;
                                                      RETRO := FALSE;
                                                      SUPERDEIXIS := OMEGADEIXIS;
                                                      ACTSUBCEFS := [LOCADV];
                                                      QSTATUS := FALSE;
                                                      MOOD := DECLXPMOOD;
                                                      THETAADV := THETAADV100;
                                                      ADVPATTERNEFS := [SYNNOVPARGS];
                                                      TEMPORAL := FALSE;
                                                      RADVB := TRUE;
                                                      POSSNIETNP := FALSE;
                                                      THANAS := OMEGACOMPL;
                                                      THANASCOMPL := FALSE;
                                                      COORD := NOCOORD;
                                                      END
END;

 FUNCTION LSAUXDOM_CpSUBADVONDAN
                         (rec:LSDOMAINT_SUBADVRECORD):BOOLEAN;
VAR Bool : BOOLEAN;
BEGIN 
  Bool := FALSE;
  WITH rec DO
  BEGIN
    IF (REQ = [POSPOL,NEGPOL,OMEGAPOL] ) THEN
IF (ENV = [POSPOL,NEGPOL,OMEGAPOL] ) THEN
IF (COMPARATIVES = [NOCOMP] ) THEN
IF (SUPERLATIVES = [NOSUP] ) THEN
IF (SUBCS = [OTHERADV] ) THEN
IF (QSTATUS = FALSE ) THEN
IF (CLASS = OMEGATIMEADVCLASS ) THEN
IF (DEIXIS = OMEGADEIXIS ) THEN
IF (ASPECT = OMEGAASPECT ) THEN
IF (RETRO = FALSE ) THEN
IF (MOOD = DECLXPMOOD ) THEN
IF (THETAADV = THETAADV100 ) THEN
IF (ADVPATTERNS = [SYNNOVPARGS] ) THEN
IF (PREPKEY = 0 ) THEN
IF (TEMPORAL = FALSE ) THEN
IF (POSSNIETNP = FALSE ) THEN
IF (THANAS = OMEGACOMPL ) THEN
IF (LASTAFFIX = NOAFFIX ) THEN
IF (RADVB = FALSE ) THEN
      Bool:=TRUE;
  END;{with}
  LSAUXDOM_CpSUBADVONDAN:=Bool;
END;{function}
 PROCEDURE LSAUXDOM_AsSUBADVONDAN(VAR rec:LSDOMAINT_SUBADVRECORD);
BEGIN
WITH rec DO
BEGIN
REQ := [POSPOL,NEGPOL,OMEGAPOL];
                                                      ENV := [POSPOL,NEGPOL,OMEGAPOL];
                                                      COMPARATIVES := [NOCOMP];
                                                      SUPERLATIVES := [NOSUP];
                                                      SUBCS := [OTHERADV];
                                                      QSTATUS := FALSE;
                                                      CLASS := OMEGATIMEADVCLASS;
                                                      DEIXIS := OMEGADEIXIS;
                                                      ASPECT := OMEGAASPECT;
                                                      RETRO := FALSE;
                                                      MOOD := DECLXPMOOD;
                                                      THETAADV := THETAADV100;
                                                      ADVPATTERNS := [SYNNOVPARGS];
                                                      PREPKEY := 0;
                                                      TEMPORAL := FALSE;
                                                      POSSNIETNP := FALSE;
                                                      THANAS := OMEGACOMPL;
                                                      LASTAFFIX := NOAFFIX;
                                                      RADVB := FALSE;
                                                      END
END;

 FUNCTION LSAUXDOM_CpSUBADVONOOITBADV
                         (rec:LSDOMAINT_SUBADVRECORD):BOOLEAN;
VAR Bool : BOOLEAN;
BEGIN 
  Bool := FALSE;
  WITH rec DO
  BEGIN
    IF (REQ = [POSPOL,NEGPOL,OMEGAPOL] ) THEN
IF (ENV = [POSPOL,NEGPOL,OMEGAPOL] ) THEN
IF (COMPARATIVES = [NOCOMP] ) THEN
IF (SUPERLATIVES = [NOSUP] ) THEN
IF (SUBCS = [TEMPADV] ) THEN
IF (QSTATUS = FALSE ) THEN
IF (CLASS = REFERENCE ) THEN
IF (DEIXIS = OMEGADEIXIS ) THEN
IF (ASPECT = IMPERFECTIVE ) THEN
IF (RETRO = FALSE ) THEN
IF (MOOD = DECLXPMOOD ) THEN
IF (THETAADV = THETAADV100 ) THEN
IF (ADVPATTERNS = [SYNNOVPARGS] ) THEN
IF (PREPKEY = 0 ) THEN
IF (TEMPORAL = TRUE ) THEN
IF (POSSNIETNP = TRUE ) THEN
IF (THANAS = OMEGACOMPL ) THEN
IF (LASTAFFIX = NOAFFIX ) THEN
IF (RADVB = FALSE ) THEN
      Bool:=TRUE;
  END;{with}
  LSAUXDOM_CpSUBADVONOOITBADV:=Bool;
END;{function}
 PROCEDURE LSAUXDOM_AsSUBADVONOOITBADV(VAR rec:LSDOMAINT_SUBADVRECORD);
BEGIN
WITH rec DO
BEGIN
REQ := [POSPOL,NEGPOL,OMEGAPOL];
                                                      ENV := [POSPOL,NEGPOL,OMEGAPOL];
                                                      COMPARATIVES := [NOCOMP];
                                                      SUPERLATIVES := [NOSUP];
                                                      SUBCS := [TEMPADV];
                                                      QSTATUS := FALSE;
                                                      CLASS := REFERENCE;
                                                      DEIXIS := OMEGADEIXIS;
                                                      ASPECT := IMPERFECTIVE;
                                                      RETRO := FALSE;
                                                      MOOD := DECLXPMOOD;
                                                      THETAADV := THETAADV100;
                                                      ADVPATTERNS := [SYNNOVPARGS];
                                                      PREPKEY := 0;
                                                      TEMPORAL := TRUE;
                                                      POSSNIETNP := TRUE;
                                                      THANAS := OMEGACOMPL;
                                                      LASTAFFIX := NOAFFIX;
                                                      RADVB := FALSE;
                                                      END
END;

 FUNCTION LSAUXDOM_CpSUBADVONNOOITBADV
                         (rec:LSDOMAINT_SUBADVRECORD):BOOLEAN;
VAR Bool : BOOLEAN;
BEGIN 
  Bool := FALSE;
  WITH rec DO
  BEGIN
    IF (REQ = [POSPOL,NEGPOL,OMEGAPOL] ) THEN
IF (ENV = [NEGPOL] ) THEN
IF (COMPARATIVES = [NOCOMP] ) THEN
IF (SUPERLATIVES = [NOSUP] ) THEN
IF (SUBCS = [TEMPADV] ) THEN
IF (QSTATUS = FALSE ) THEN
IF (CLASS = REFERENCE ) THEN
IF (DEIXIS = OMEGADEIXIS ) THEN
IF (ASPECT = IMPERFECTIVE ) THEN
IF (RETRO = FALSE ) THEN
IF (MOOD = DECLXPMOOD ) THEN
IF (THETAADV = THETAADV100 ) THEN
IF (ADVPATTERNS = [SYNNOVPARGS] ) THEN
IF (PREPKEY = 0 ) THEN
IF (TEMPORAL = TRUE ) THEN
IF (POSSNIETNP = FALSE ) THEN
IF (THANAS = OMEGACOMPL ) THEN
IF (LASTAFFIX = NOAFFIX ) THEN
IF (RADVB = FALSE ) THEN
      Bool:=TRUE;
  END;{with}
  LSAUXDOM_CpSUBADVONNOOITBADV:=Bool;
END;{function}
 PROCEDURE LSAUXDOM_AsSUBADVONNOOITBADV(VAR rec:LSDOMAINT_SUBADVRECORD);
BEGIN
WITH rec DO
BEGIN
REQ := [POSPOL,NEGPOL,OMEGAPOL];
                                                      ENV := [NEGPOL];
                                                      COMPARATIVES := [NOCOMP];
                                                      SUPERLATIVES := [NOSUP];
                                                      SUBCS := [TEMPADV];
                                                      QSTATUS := FALSE;
                                                      CLASS := REFERENCE;
                                                      DEIXIS := OMEGADEIXIS;
                                                      ASPECT := IMPERFECTIVE;
                                                      RETRO := FALSE;
                                                      MOOD := DECLXPMOOD;
                                                      THETAADV := THETAADV100;
                                                      ADVPATTERNS := [SYNNOVPARGS];
                                                      PREPKEY := 0;
                                                      TEMPORAL := TRUE;
                                                      POSSNIETNP := FALSE;
                                                      THANAS := OMEGACOMPL;
                                                      LASTAFFIX := NOAFFIX;
                                                      RADVB := FALSE;
                                                      END
END;

 FUNCTION LSAUXDOM_CpADVONOOITBADV
                         (rec:LSDOMAINT_ADVRECORD):BOOLEAN;
VAR Bool : BOOLEAN;
BEGIN 
  Bool := FALSE;
  WITH rec DO
  BEGIN
    IF (REQ = [POSPOL,NEGPOL,OMEGAPOL] ) THEN
IF (ENV = [POSPOL,NEGPOL,OMEGAPOL] ) THEN
IF (COMPARATIVES = [NOCOMP] ) THEN
IF (SUPERLATIVES = [NOSUP] ) THEN
IF (SUBCS = [TEMPADV] ) THEN
IF (QSTATUS = FALSE ) THEN
IF (FORM = POSITIVE ) THEN
IF (EORENFORM = NOFORM ) THEN
IF (CLASS = REFERENCE ) THEN
IF (DEIXIS = OMEGADEIXIS ) THEN
IF (ASPECT = IMPERFECTIVE ) THEN
IF (RETRO = FALSE ) THEN
IF (MOOD = DECLXPMOOD ) THEN
IF (THETAADV = THETAADV100 ) THEN
IF (ADVPATTERNS = [SYNNOVPARGS] ) THEN
IF (PREPKEY = 0 ) THEN
IF (TEMPORAL = TRUE ) THEN
IF (POSSNIETNP = TRUE ) THEN
IF (THANAS = OMEGACOMPL ) THEN
IF (RADVB = FALSE ) THEN
      Bool:=TRUE;
  END;{with}
  LSAUXDOM_CpADVONOOITBADV:=Bool;
END;{function}
 PROCEDURE LSAUXDOM_AsADVONOOITBADV(VAR rec:LSDOMAINT_ADVRECORD);
BEGIN
WITH rec DO
BEGIN
REQ := [POSPOL,NEGPOL,OMEGAPOL];
                                                      ENV := [POSPOL,NEGPOL,OMEGAPOL];
                                                      COMPARATIVES := [NOCOMP];
                                                      SUPERLATIVES := [NOSUP];
                                                      SUBCS := [TEMPADV];
                                                      QSTATUS := FALSE;
                                                      FORM := POSITIVE;
                                                      EORENFORM := NOFORM;
                                                      CLASS := REFERENCE;
                                                      DEIXIS := OMEGADEIXIS;
                                                      ASPECT := IMPERFECTIVE;
                                                      RETRO := FALSE;
                                                      MOOD := DECLXPMOOD;
                                                      THETAADV := THETAADV100;
                                                      ADVPATTERNS := [SYNNOVPARGS];
                                                      PREPKEY := 0;
                                                      TEMPORAL := TRUE;
                                                      POSSNIETNP := TRUE;
                                                      THANAS := OMEGACOMPL;
                                                      RADVB := FALSE;
                                                      END
END;

 FUNCTION LSAUXDOM_CpADVONNOOITBADV
                         (rec:LSDOMAINT_ADVRECORD):BOOLEAN;
VAR Bool : BOOLEAN;
BEGIN 
  Bool := FALSE;
  WITH rec DO
  BEGIN
    IF (REQ = [POSPOL,NEGPOL,OMEGAPOL] ) THEN
IF (ENV = [NEGPOL] ) THEN
IF (COMPARATIVES = [NOCOMP] ) THEN
IF (SUPERLATIVES = [NOSUP] ) THEN
IF (SUBCS = [TEMPADV] ) THEN
IF (QSTATUS = FALSE ) THEN
IF (FORM = POSITIVE ) THEN
IF (EORENFORM = NOFORM ) THEN
IF (CLASS = REFERENCE ) THEN
IF (DEIXIS = OMEGADEIXIS ) THEN
IF (ASPECT = IMPERFECTIVE ) THEN
IF (RETRO = FALSE ) THEN
IF (MOOD = DECLXPMOOD ) THEN
IF (THETAADV = THETAADV100 ) THEN
IF (ADVPATTERNS = [SYNNOVPARGS] ) THEN
IF (PREPKEY = 0 ) THEN
IF (TEMPORAL = TRUE ) THEN
IF (POSSNIETNP = FALSE ) THEN
IF (THANAS = OMEGACOMPL ) THEN
IF (RADVB = FALSE ) THEN
      Bool:=TRUE;
  END;{with}
  LSAUXDOM_CpADVONNOOITBADV:=Bool;
END;{function}
 PROCEDURE LSAUXDOM_AsADVONNOOITBADV(VAR rec:LSDOMAINT_ADVRECORD);
BEGIN
WITH rec DO
BEGIN
REQ := [POSPOL,NEGPOL,OMEGAPOL];
                                                      ENV := [NEGPOL];
                                                      COMPARATIVES := [NOCOMP];
                                                      SUPERLATIVES := [NOSUP];
                                                      SUBCS := [TEMPADV];
                                                      QSTATUS := FALSE;
                                                      FORM := POSITIVE;
                                                      EORENFORM := NOFORM;
                                                      CLASS := REFERENCE;
                                                      DEIXIS := OMEGADEIXIS;
                                                      ASPECT := IMPERFECTIVE;
                                                      RETRO := FALSE;
                                                      MOOD := DECLXPMOOD;
                                                      THETAADV := THETAADV100;
                                                      ADVPATTERNS := [SYNNOVPARGS];
                                                      PREPKEY := 0;
                                                      TEMPORAL := TRUE;
                                                      POSSNIETNP := FALSE;
                                                      THANAS := OMEGACOMPL;
                                                      RADVB := FALSE;
                                                      END
END;

 FUNCTION LSAUXDOM_CpADVPONOOITBADV
                         (rec:LSDOMAINT_ADVPRECORD):BOOLEAN;
VAR Bool : BOOLEAN;
BEGIN 
  Bool := FALSE;
  WITH rec DO
  BEGIN
    IF (REQ = [POSPOL,NEGPOL,OMEGAPOL] ) THEN
IF (ENV = [POSPOL,NEGPOL,OMEGAPOL] ) THEN
IF (CLASS = REFERENCE ) THEN
IF (DEIXIS = OMEGADEIXIS ) THEN
IF (ASPECT = IMPERFECTIVE ) THEN
IF (RETRO = FALSE ) THEN
IF (SUPERDEIXIS = OMEGADEIXIS ) THEN
IF (ACTSUBCEFS = [TEMPADV] ) THEN
IF (QSTATUS = FALSE ) THEN
IF (MOOD = DECLXPMOOD ) THEN
IF (THETAADV = THETAADV100 ) THEN
IF (ADVPATTERNEFS = [SYNNOVPARGS] ) THEN
IF (TEMPORAL = TRUE ) THEN
IF (RADVB = FALSE ) THEN
IF (POSSNIETNP = TRUE ) THEN
IF (THANAS = OMEGACOMPL ) THEN
IF (THANASCOMPL = FALSE ) THEN
IF (COORD = NOCOORD ) THEN
      Bool:=TRUE;
  END;{with}
  LSAUXDOM_CpADVPONOOITBADV:=Bool;
END;{function}
 PROCEDURE LSAUXDOM_AsADVPONOOITBADV(VAR rec:LSDOMAINT_ADVPRECORD);
BEGIN
WITH rec DO
BEGIN
REQ := [POSPOL,NEGPOL,OMEGAPOL];
                                                      ENV := [POSPOL,NEGPOL,OMEGAPOL];
                                                      CLASS := REFERENCE;
                                                      DEIXIS := OMEGADEIXIS;
                                                      ASPECT := IMPERFECTIVE;
                                                      RETRO := FALSE;
                                                      SUPERDEIXIS := OMEGADEIXIS;
                                                      ACTSUBCEFS := [TEMPADV];
                                                      QSTATUS := FALSE;
                                                      MOOD := DECLXPMOOD;
                                                      THETAADV := THETAADV100;
                                                      ADVPATTERNEFS := [SYNNOVPARGS];
                                                      TEMPORAL := TRUE;
                                                      RADVB := FALSE;
                                                      POSSNIETNP := TRUE;
                                                      THANAS := OMEGACOMPL;
                                                      THANASCOMPL := FALSE;
                                                      COORD := NOCOORD;
                                                      END
END;

 FUNCTION LSAUXDOM_CpADVPONNOOITBADV
                         (rec:LSDOMAINT_ADVPRECORD):BOOLEAN;
VAR Bool : BOOLEAN;
BEGIN 
  Bool := FALSE;
  WITH rec DO
  BEGIN
    IF (REQ = [POSPOL,NEGPOL,OMEGAPOL] ) THEN
IF (ENV = [POSPOL,NEGPOL,OMEGAPOL] ) THEN
IF (CLASS = REFERENCE ) THEN
IF (DEIXIS = OMEGADEIXIS ) THEN
IF (ASPECT = IMPERFECTIVE ) THEN
IF (RETRO = FALSE ) THEN
IF (SUPERDEIXIS = OMEGADEIXIS ) THEN
IF (ACTSUBCEFS = [TEMPADV] ) THEN
IF (QSTATUS = FALSE ) THEN
IF (MOOD = DECLXPMOOD ) THEN
IF (THETAADV = THETAADV100 ) THEN
IF (ADVPATTERNEFS = [SYNNOVPARGS] ) THEN
IF (TEMPORAL = TRUE ) THEN
IF (RADVB = FALSE ) THEN
IF (POSSNIETNP = FALSE ) THEN
IF (THANAS = OMEGACOMPL ) THEN
IF (THANASCOMPL = FALSE ) THEN
IF (COORD = NOCOORD ) THEN
      Bool:=TRUE;
  END;{with}
  LSAUXDOM_CpADVPONNOOITBADV:=Bool;
END;{function}
 PROCEDURE LSAUXDOM_AsADVPONNOOITBADV(VAR rec:LSDOMAINT_ADVPRECORD);
BEGIN
WITH rec DO
BEGIN
REQ := [POSPOL,NEGPOL,OMEGAPOL];
                                                      ENV := [POSPOL,NEGPOL,OMEGAPOL];
                                                      CLASS := REFERENCE;
                                                      DEIXIS := OMEGADEIXIS;
                                                      ASPECT := IMPERFECTIVE;
                                                      RETRO := FALSE;
                                                      SUPERDEIXIS := OMEGADEIXIS;
                                                      ACTSUBCEFS := [TEMPADV];
                                                      QSTATUS := FALSE;
                                                      MOOD := DECLXPMOOD;
                                                      THETAADV := THETAADV100;
                                                      ADVPATTERNEFS := [SYNNOVPARGS];
                                                      TEMPORAL := TRUE;
                                                      RADVB := FALSE;
                                                      POSSNIETNP := FALSE;
                                                      THANAS := OMEGACOMPL;
                                                      THANASCOMPL := FALSE;
                                                      COORD := NOCOORD;
                                                      END
END;

 FUNCTION LSAUXDOM_CpSUBADVRECONR
                         (rec:LSDOMAINT_SUBADVRECORD):BOOLEAN;
VAR Bool : BOOLEAN;
BEGIN 
  Bool := FALSE;
  WITH rec DO
  BEGIN
    IF (REQ = [POSPOL,NEGPOL,OMEGAPOL] ) THEN
IF (ENV = [POSPOL,NEGPOL,OMEGAPOL] ) THEN
IF (COMPARATIVES = [NOCOMP] ) THEN
IF (SUPERLATIVES = [NOSUP] ) THEN
IF (SUBCS = [LOCADV] ) THEN
IF (QSTATUS = FALSE ) THEN
IF (CLASS = OMEGATIMEADVCLASS ) THEN
IF (DEIXIS = OMEGADEIXIS ) THEN
IF (ASPECT = OMEGAASPECT ) THEN
IF (RETRO = FALSE ) THEN
IF (MOOD = DECLXPMOOD ) THEN
IF (THETAADV = THETAADV100 ) THEN
IF (ADVPATTERNS = [SYNNOVPARGS] ) THEN
IF (PREPKEY = 0 ) THEN
IF (TEMPORAL = FALSE ) THEN
IF (POSSNIETNP = FALSE ) THEN
IF (THANAS = OMEGACOMPL ) THEN
IF (LASTAFFIX = NOAFFIX ) THEN
IF (RADVB = TRUE ) THEN
      Bool:=TRUE;
  END;{with}
  LSAUXDOM_CpSUBADVRECONR:=Bool;
END;{function}
 PROCEDURE LSAUXDOM_AsSUBADVRECONR(VAR rec:LSDOMAINT_SUBADVRECORD);
BEGIN
WITH rec DO
BEGIN
REQ := [POSPOL,NEGPOL,OMEGAPOL];
                                                      ENV := [POSPOL,NEGPOL,OMEGAPOL];
                                                      COMPARATIVES := [NOCOMP];
                                                      SUPERLATIVES := [NOSUP];
                                                      SUBCS := [LOCADV];
                                                      QSTATUS := FALSE;
                                                      CLASS := OMEGATIMEADVCLASS;
                                                      DEIXIS := OMEGADEIXIS;
                                                      ASPECT := OMEGAASPECT;
                                                      RETRO := FALSE;
                                                      MOOD := DECLXPMOOD;
                                                      THETAADV := THETAADV100;
                                                      ADVPATTERNS := [SYNNOVPARGS];
                                                      PREPKEY := 0;
                                                      TEMPORAL := FALSE;
                                                      POSSNIETNP := FALSE;
                                                      THANAS := OMEGACOMPL;
                                                      LASTAFFIX := NOAFFIX;
                                                      RADVB := TRUE;
                                                      END
END;

 FUNCTION LSAUXDOM_CpADVRECONR
                         (rec:LSDOMAINT_ADVRECORD):BOOLEAN;
VAR Bool : BOOLEAN;
BEGIN 
  Bool := FALSE;
  WITH rec DO
  BEGIN
    IF (REQ = [POSPOL,NEGPOL,OMEGAPOL] ) THEN
IF (ENV = [POSPOL,NEGPOL,OMEGAPOL] ) THEN
IF (COMPARATIVES = [NOCOMP] ) THEN
IF (SUPERLATIVES = [NOSUP] ) THEN
IF (SUBCS = [LOCADV] ) THEN
IF (QSTATUS = FALSE ) THEN
IF (FORM = POSITIVE ) THEN
IF (EORENFORM = NOFORM ) THEN
IF (CLASS = OMEGATIMEADVCLASS ) THEN
IF (DEIXIS = OMEGADEIXIS ) THEN
IF (ASPECT = OMEGAASPECT ) THEN
IF (RETRO = FALSE ) THEN
IF (MOOD = DECLXPMOOD ) THEN
IF (THETAADV = THETAADV100 ) THEN
IF (ADVPATTERNS = [SYNNOVPARGS] ) THEN
IF (PREPKEY = 0 ) THEN
IF (TEMPORAL = FALSE ) THEN
IF (POSSNIETNP = FALSE ) THEN
IF (THANAS = OMEGACOMPL ) THEN
IF (RADVB = TRUE ) THEN
      Bool:=TRUE;
  END;{with}
  LSAUXDOM_CpADVRECONR:=Bool;
END;{function}
 PROCEDURE LSAUXDOM_AsADVRECONR(VAR rec:LSDOMAINT_ADVRECORD);
BEGIN
WITH rec DO
BEGIN
REQ := [POSPOL,NEGPOL,OMEGAPOL];
                                                      ENV := [POSPOL,NEGPOL,OMEGAPOL];
                                                      COMPARATIVES := [NOCOMP];
                                                      SUPERLATIVES := [NOSUP];
                                                      SUBCS := [LOCADV];
                                                      QSTATUS := FALSE;
                                                      FORM := POSITIVE;
                                                      EORENFORM := NOFORM;
                                                      CLASS := OMEGATIMEADVCLASS;
                                                      DEIXIS := OMEGADEIXIS;
                                                      ASPECT := OMEGAASPECT;
                                                      RETRO := FALSE;
                                                      MOOD := DECLXPMOOD;
                                                      THETAADV := THETAADV100;
                                                      ADVPATTERNS := [SYNNOVPARGS];
                                                      PREPKEY := 0;
                                                      TEMPORAL := FALSE;
                                                      POSSNIETNP := FALSE;
                                                      THANAS := OMEGACOMPL;
                                                      RADVB := TRUE;
                                                      END
END;

 FUNCTION LSAUXDOM_CpDETONGEENBDET
                         (rec:LSDOMAINT_DETRECORD):BOOLEAN;
VAR Bool : BOOLEAN;
BEGIN 
  Bool := FALSE;
  WITH rec DO
  BEGIN
    IF (REQ = [POSPOL,NEGPOL,OMEGAPOL] ) THEN
IF (ENV = [NEGPOL] ) THEN
IF (POSSNIETNP = FALSE ) THEN
IF (DEFINITE = INDEF ) THEN
IF (POSSPRED = TRUE ) THEN
IF (POSSNUMBERS = [SINGULAR,PLURAL] ) THEN
IF (POSSCOMAS = [MASS,COUNT] ) THEN
IF (MOOD = DECLXPMOOD ) THEN
IF (EFORMATION = NOFORMATION ) THEN
IF (ENFORMATION = FALSE ) THEN
IF (EORENFORM = NOFORM ) THEN
IF (SYNTQUANT = OMEGAQUANT ) THEN
      Bool:=TRUE;
  END;{with}
  LSAUXDOM_CpDETONGEENBDET:=Bool;
END;{function}
 PROCEDURE LSAUXDOM_AsDETONGEENBDET(VAR rec:LSDOMAINT_DETRECORD);
BEGIN
WITH rec DO
BEGIN
REQ := [POSPOL,NEGPOL,OMEGAPOL];
                                                      ENV := [NEGPOL];
                                                      POSSNIETNP := FALSE;
                                                      DEFINITE := INDEF;
                                                      POSSPRED := TRUE;
                                                      POSSNUMBERS := [SINGULAR,PLURAL];
                                                      POSSCOMAS := [MASS,COUNT];
                                                      MOOD := DECLXPMOOD;
                                                      EFORMATION := NOFORMATION;
                                                      ENFORMATION := FALSE;
                                                      EORENFORM := NOFORM;
                                                      SYNTQUANT := OMEGAQUANT;
                                                      END
END;

 FUNCTION LSAUXDOM_CpDETPONGEENBDET
                         (rec:LSDOMAINT_DETPRECORD):BOOLEAN;
VAR Bool : BOOLEAN;
BEGIN 
  Bool := FALSE;
  WITH rec DO
  BEGIN
    IF (REQ = [POSPOL,NEGPOL,OMEGAPOL] ) THEN
IF (ENV = [POSPOL,NEGPOL,OMEGAPOL] ) THEN
IF (POSSNIETNP = FALSE ) THEN
IF (DEFINITE = INDEF ) THEN
IF (POSSPRED = TRUE ) THEN
IF (POSSNUMBERS = [SINGULAR,PLURAL] ) THEN
IF (POSSCOMAS = [MASS,COUNT] ) THEN
IF (MOOD = DECLXPMOOD ) THEN
IF (EORENFORM = NOFORM ) THEN
IF (SYNTQUANT = OMEGAQUANT ) THEN
IF (POSSGENDERS = [OMEGAGENDER] ) THEN
IF (SUPERDEIXIS = OMEGADEIXIS ) THEN
      Bool:=TRUE;
  END;{with}
  LSAUXDOM_CpDETPONGEENBDET:=Bool;
END;{function}
 PROCEDURE LSAUXDOM_AsDETPONGEENBDET(VAR rec:LSDOMAINT_DETPRECORD);
BEGIN
WITH rec DO
BEGIN
REQ := [POSPOL,NEGPOL,OMEGAPOL];
                                                      ENV := [POSPOL,NEGPOL,OMEGAPOL];
                                                      POSSNIETNP := FALSE;
                                                      DEFINITE := INDEF;
                                                      POSSPRED := TRUE;
                                                      POSSNUMBERS := [SINGULAR,PLURAL];
                                                      POSSCOMAS := [MASS,COUNT];
                                                      MOOD := DECLXPMOOD;
                                                      EORENFORM := NOFORM;
                                                      SYNTQUANT := OMEGAQUANT;
                                                      POSSGENDERS := [OMEGAGENDER];
                                                      SUPERDEIXIS := OMEGADEIXIS;
                                                      END
END;

 FUNCTION LSAUXDOM_CpDETPONEENART
                         (rec:LSDOMAINT_DETPRECORD):BOOLEAN;
VAR Bool : BOOLEAN;
BEGIN 
  Bool := FALSE;
  WITH rec DO
  BEGIN
    IF (REQ = [POSPOL,NEGPOL,OMEGAPOL] ) THEN
IF (ENV = [POSPOL,NEGPOL,OMEGAPOL] ) THEN
IF (POSSNIETNP = TRUE ) THEN
IF (DEFINITE = INDEF ) THEN
IF (POSSPRED = TRUE ) THEN
IF (POSSNUMBERS = [SINGULAR] ) THEN
IF (POSSCOMAS = [COUNT] ) THEN
IF (MOOD = DECLXPMOOD ) THEN
IF (EORENFORM = NOFORM ) THEN
IF (SYNTQUANT = OMEGAQUANT ) THEN
IF (POSSGENDERS = [OMEGAGENDER] ) THEN
IF (SUPERDEIXIS = OMEGADEIXIS ) THEN
      Bool:=TRUE;
  END;{with}
  LSAUXDOM_CpDETPONEENART:=Bool;
END;{function}
 PROCEDURE LSAUXDOM_AsDETPONEENART(VAR rec:LSDOMAINT_DETPRECORD);
BEGIN
WITH rec DO
BEGIN
REQ := [POSPOL,NEGPOL,OMEGAPOL];
                                                      ENV := [POSPOL,NEGPOL,OMEGAPOL];
                                                      POSSNIETNP := TRUE;
                                                      DEFINITE := INDEF;
                                                      POSSPRED := TRUE;
                                                      POSSNUMBERS := [SINGULAR];
                                                      POSSCOMAS := [COUNT];
                                                      MOOD := DECLXPMOOD;
                                                      EORENFORM := NOFORM;
                                                      SYNTQUANT := OMEGAQUANT;
                                                      POSSGENDERS := [OMEGAGENDER];
                                                      SUPERDEIXIS := OMEGADEIXIS;
                                                      END
END;

 FUNCTION LSAUXDOM_CpPERSPRORECONHET
                         (rec:LSDOMAINT_PERSPRORECORD):BOOLEAN;
VAR Bool : BOOLEAN;
BEGIN 
  Bool := FALSE;
  WITH rec DO
  BEGIN
    IF (NUMBER = SINGULAR ) THEN
IF (GENDER = NEUTGENDER ) THEN
IF (PERSON = 3 ) THEN
IF (ANIMATE = OMEGAANIMATE ) THEN
IF (POSSRFORM = TRUE ) THEN
IF (NPHEAD = HETNP ) THEN
IF (GENERALIZED = FALSE ) THEN
IF (REDUCED = FALSE ) THEN
IF (PERSPROCASES = [NOMINATIVE] ) THEN
      Bool:=TRUE;
  END;{with}
  LSAUXDOM_CpPERSPRORECONHET:=Bool;
END;{function}
 PROCEDURE LSAUXDOM_AsPERSPRORECONHET(VAR rec:LSDOMAINT_PERSPRORECORD);
BEGIN
WITH rec DO
BEGIN
NUMBER := SINGULAR;
                                                      GENDER := NEUTGENDER;
                                                      PERSON := 3;
                                                      ANIMATE := OMEGAANIMATE;
                                                      POSSRFORM := TRUE;
                                                      NPHEAD := HETNP;
                                                      GENERALIZED := FALSE;
                                                      REDUCED := FALSE;
                                                      PERSPROCASES := [NOMINATIVE];
                                                      END
END;

 FUNCTION LSAUXDOM_CpPERSPROONZEGENB
                         (rec:LSDOMAINT_PERSPRORECORD):BOOLEAN;
VAR Bool : BOOLEAN;
BEGIN 
  Bool := FALSE;
  WITH rec DO
  BEGIN
    IF (NUMBER = PLURAL ) THEN
IF (GENDER = OMEGAGENDER ) THEN
IF (PERSON = 3 ) THEN
IF (ANIMATE = YESANIMATE ) THEN
IF (POSSRFORM = FALSE ) THEN
IF (NPHEAD = ZEGENNP ) THEN
IF (GENERALIZED = TRUE ) THEN
IF (REDUCED = TRUE ) THEN
IF (PERSPROCASES = [NOMINATIVE] ) THEN
      Bool:=TRUE;
  END;{with}
  LSAUXDOM_CpPERSPROONZEGENB:=Bool;
END;{function}
 PROCEDURE LSAUXDOM_AsPERSPROONZEGENB(VAR rec:LSDOMAINT_PERSPRORECORD);
BEGIN
WITH rec DO
BEGIN
NUMBER := PLURAL;
                                                      GENDER := OMEGAGENDER;
                                                      PERSON := 3;
                                                      ANIMATE := YESANIMATE;
                                                      POSSRFORM := FALSE;
                                                      NPHEAD := ZEGENNP;
                                                      GENERALIZED := TRUE;
                                                      REDUCED := TRUE;
                                                      PERSPROCASES := [NOMINATIVE];
                                                      END
END;

 FUNCTION LSAUXDOM_CpINDEFPROONMEN
                         (rec:LSDOMAINT_INDEFPRORECORD):BOOLEAN;
VAR Bool : BOOLEAN;
BEGIN 
  Bool := FALSE;
  WITH rec DO
  BEGIN
    IF (REQ = [POSPOL,NEGPOL,OMEGAPOL] ) THEN
IF (ENV = [POSPOL,NEGPOL,OMEGAPOL] ) THEN
IF (DEFINITE = DEF ) THEN
IF (NUMBER = SINGULAR ) THEN
IF (POSSGENI = FALSE ) THEN
IF (POSSNIETNP = FALSE ) THEN
IF (SYNTQUANT = OMEGAQUANT ) THEN
IF (ANIMATE = YESANIMATE ) THEN
IF (POSSRFORM = FALSE ) THEN
IF (GENI = FALSE ) THEN
IF (NPHEAD = MENNP ) THEN
      Bool:=TRUE;
  END;{with}
  LSAUXDOM_CpINDEFPROONMEN:=Bool;
END;{function}
 PROCEDURE LSAUXDOM_AsINDEFPROONMEN(VAR rec:LSDOMAINT_INDEFPRORECORD);
BEGIN
WITH rec DO
BEGIN
REQ := [POSPOL,NEGPOL,OMEGAPOL];
                                                      ENV := [POSPOL,NEGPOL,OMEGAPOL];
                                                      DEFINITE := DEF;
                                                      NUMBER := SINGULAR;
                                                      POSSGENI := FALSE;
                                                      POSSNIETNP := FALSE;
                                                      SYNTQUANT := OMEGAQUANT;
                                                      ANIMATE := YESANIMATE;
                                                      POSSRFORM := FALSE;
                                                      GENI := FALSE;
                                                      NPHEAD := MENNP;
                                                      END
END;

 FUNCTION LSAUXDOM_CpINDEFPRORECONIETS
                         (rec:LSDOMAINT_INDEFPRORECORD):BOOLEAN;
VAR Bool : BOOLEAN;
BEGIN 
  Bool := FALSE;
  WITH rec DO
  BEGIN
    IF (REQ = [POSPOL,NEGPOL,OMEGAPOL] ) THEN
IF (ENV = [POSPOL,NEGPOL,OMEGAPOL] ) THEN
IF (DEFINITE = INDEF ) THEN
IF (NUMBER = SINGULAR ) THEN
IF (POSSGENI = FALSE ) THEN
IF (POSSNIETNP = TRUE ) THEN
IF (SYNTQUANT = OMEGAQUANT ) THEN
IF (ANIMATE = NOANIMATE ) THEN
IF (POSSRFORM = TRUE ) THEN
IF (GENI = FALSE ) THEN
IF (NPHEAD = IETSNP ) THEN
      Bool:=TRUE;
  END;{with}
  LSAUXDOM_CpINDEFPRORECONIETS:=Bool;
END;{function}
 PROCEDURE LSAUXDOM_AsINDEFPRORECONIETS(VAR rec:LSDOMAINT_INDEFPRORECORD);
BEGIN
WITH rec DO
BEGIN
REQ := [POSPOL,NEGPOL,OMEGAPOL];
                                                      ENV := [POSPOL,NEGPOL,OMEGAPOL];
                                                      DEFINITE := INDEF;
                                                      NUMBER := SINGULAR;
                                                      POSSGENI := FALSE;
                                                      POSSNIETNP := TRUE;
                                                      SYNTQUANT := OMEGAQUANT;
                                                      ANIMATE := NOANIMATE;
                                                      POSSRFORM := TRUE;
                                                      GENI := FALSE;
                                                      NPHEAD := IETSNP;
                                                      END
END;

 FUNCTION LSAUXDOM_CpINDEFPRORECONALLES
                         (rec:LSDOMAINT_INDEFPRORECORD):BOOLEAN;
VAR Bool : BOOLEAN;
BEGIN 
  Bool := FALSE;
  WITH rec DO
  BEGIN
    IF (REQ = [POSPOL,NEGPOL,OMEGAPOL] ) THEN
IF (ENV = [POSPOL,NEGPOL,OMEGAPOL] ) THEN
IF (DEFINITE = DEF ) THEN
IF (NUMBER = SINGULAR ) THEN
IF (POSSGENI = FALSE ) THEN
IF (POSSNIETNP = FALSE ) THEN
IF (SYNTQUANT = AQUANT ) THEN
IF (ANIMATE = NOANIMATE ) THEN
IF (POSSRFORM = TRUE ) THEN
IF (GENI = FALSE ) THEN
IF (NPHEAD = ALLESNP ) THEN
      Bool:=TRUE;
  END;{with}
  LSAUXDOM_CpINDEFPRORECONALLES:=Bool;
END;{function}
 PROCEDURE LSAUXDOM_AsINDEFPRORECONALLES(VAR rec:LSDOMAINT_INDEFPRORECORD);
BEGIN
WITH rec DO
BEGIN
REQ := [POSPOL,NEGPOL,OMEGAPOL];
                                                      ENV := [POSPOL,NEGPOL,OMEGAPOL];
                                                      DEFINITE := DEF;
                                                      NUMBER := SINGULAR;
                                                      POSSGENI := FALSE;
                                                      POSSNIETNP := FALSE;
                                                      SYNTQUANT := AQUANT;
                                                      ANIMATE := NOANIMATE;
                                                      POSSRFORM := TRUE;
                                                      GENI := FALSE;
                                                      NPHEAD := ALLESNP;
                                                      END
END;

 FUNCTION LSAUXDOM_CpCNONCOUNTEN
                         (rec:LSDOMAINT_CNRECORD):BOOLEAN;
VAR Bool : BOOLEAN;
BEGIN 
  Bool := FALSE;
  WITH rec DO
  BEGIN
    IF (REQ = [OMEGAPOL,NEGPOL,POSPOL] ) THEN
IF (ENV = [OMEGAPOL,NEGPOL,POSPOL] ) THEN
IF (SUPERDEIXIS = OMEGADEIXIS ) THEN
IF (CLASS = OMEGATIMEADVCLASS ) THEN
IF (DEIXIS = OMEGADEIXIS ) THEN
IF (ASPECT = OMEGAASPECT ) THEN
IF (RETRO = FALSE ) THEN
IF (DEFINITE = OMEGADEF ) THEN
IF (NUMBERS = [SINGULAR] ) THEN
IF (CASES = [NOMINATIVE] ) THEN
IF (GENDERS = [OMEGAGENDER] ) THEN
IF (SEXES = [] ) THEN
IF (ACTSUBCS = [OTHERNOUN] ) THEN
IF (TEMPORAL = FALSE ) THEN
IF (POSSGENI = FALSE ) THEN
IF (ANIMATE = OMEGAANIMATE ) THEN
IF (HUMAN = OMEGAHUMAN ) THEN
IF (POSSCOMAS = [COUNT] ) THEN
IF (THETANP = OMEGATHETANP ) THEN
IF (NOUNPATTERNEFS = [] ) THEN
      Bool:=TRUE;
  END;{with}
  LSAUXDOM_CpCNONCOUNTEN:=Bool;
END;{function}
 PROCEDURE LSAUXDOM_AsCNONCOUNTEN(VAR rec:LSDOMAINT_CNRECORD);
BEGIN
WITH rec DO
BEGIN
REQ := [OMEGAPOL,NEGPOL,POSPOL];
                                                      ENV := [OMEGAPOL,NEGPOL,POSPOL];
                                                      SUPERDEIXIS := OMEGADEIXIS;
                                                      CLASS := OMEGATIMEADVCLASS;
                                                      DEIXIS := OMEGADEIXIS;
                                                      ASPECT := OMEGAASPECT;
                                                      RETRO := FALSE;
                                                      DEFINITE := OMEGADEF;
                                                      NUMBERS := [SINGULAR];
                                                      CASES := [NOMINATIVE];
                                                      GENDERS := [OMEGAGENDER];
                                                      SEXES := [];
                                                      ACTSUBCS := [OTHERNOUN];
                                                      TEMPORAL := FALSE;
                                                      POSSGENI := FALSE;
                                                      ANIMATE := OMEGAANIMATE;
                                                      HUMAN := OMEGAHUMAN;
                                                      POSSCOMAS := [COUNT];
                                                      THETANP := OMEGATHETANP;
                                                      NOUNPATTERNEFS := [];
                                                      END
END;

 FUNCTION LSAUXDOM_CpNPONNDFPR
                         (rec:LSDOMAINT_NPRECORD):BOOLEAN;
VAR Bool : BOOLEAN;
BEGIN 
  Bool := FALSE;
  WITH rec DO
  BEGIN
    IF (SUPERDEIXIS = OMEGADEIXIS ) THEN
IF (CLASS = OMEGATIMEADVCLASS ) THEN
IF (DEIXIS = OMEGADEIXIS ) THEN
IF (ASPECT = OMEGAASPECT ) THEN
IF (RETRO = FALSE ) THEN
IF (PERSON = 3 ) THEN
IF (GENDERS = [OMEGAGENDER] ) THEN
IF (SEXES = [] ) THEN
IF (ACTSUBCS = [OTHERNOUN] ) THEN
IF (TEMPORAL = FALSE ) THEN
IF (HUMAN = OMEGAHUMAN ) THEN
IF (ACTCOMAS = [COUNT] ) THEN
IF (THETANP = OMEGATHETANP ) THEN
IF (NOUNPATTERNEFS = [] ) THEN
IF (POSSPRED = TRUE ) THEN
IF (MOOD = DECLXPMOOD ) THEN
IF (GENERIC = OMEGAGENERIC ) THEN
IF (SPECQ = YESSPEC ) THEN
      Bool:=TRUE;
  END;{with}
  LSAUXDOM_CpNPONNDFPR:=Bool;
END;{function}
 PROCEDURE LSAUXDOM_AsNPONNDFPR(VAR rec:LSDOMAINT_NPRECORD);
BEGIN
WITH rec DO
BEGIN
SUPERDEIXIS := OMEGADEIXIS;
                                                      CLASS := OMEGATIMEADVCLASS;
                                                      DEIXIS := OMEGADEIXIS;
                                                      ASPECT := OMEGAASPECT;
                                                      RETRO := FALSE;
                                                      PERSON := 3;
                                                      GENDERS := [OMEGAGENDER];
                                                      SEXES := [];
                                                      ACTSUBCS := [OTHERNOUN];
                                                      TEMPORAL := FALSE;
                                                      HUMAN := OMEGAHUMAN;
                                                      ACTCOMAS := [COUNT];
                                                      THETANP := OMEGATHETANP;
                                                      NOUNPATTERNEFS := [];
                                                      POSSPRED := TRUE;
                                                      MOOD := DECLXPMOOD;
                                                      GENERIC := OMEGAGENERIC;
                                                      SPECQ := YESSPEC;
                                                      END
END;

 FUNCTION LSAUXDOM_CpPREPPONAANIO
                         (rec:LSDOMAINT_PREPPRECORD):BOOLEAN;
VAR Bool : BOOLEAN;
BEGIN 
  Bool := FALSE;
  WITH rec DO
  BEGIN
    IF (REQ = [POSPOL,NEGPOL,OMEGAPOL] ) THEN
IF (ENV = [POSPOL,NEGPOL,OMEGAPOL] ) THEN
IF (MOOD = DECLXPMOOD ) THEN
IF (ACTSUBCEFS = [AAN] ) THEN
IF (SYNPPEFS = [SYNNP] ) THEN
IF (THETAPP = PP120 ) THEN
IF (HEADKEY = auxkey('AANIOKEY') ) THEN
IF (CLASS = OMEGATIMEADVCLASS ) THEN
IF (DEIXIS = OMEGADEIXIS ) THEN
IF (ASPECT = OMEGAASPECT ) THEN
IF (RETRO = FALSE ) THEN
IF (SUPERDEIXIS = OMEGADEIXIS ) THEN
IF (RADVKEY = 0 ) THEN
IF (STRANDED = FALSE ) THEN
IF (SPECQ = YESSPEC ) THEN
IF (COORD = NOCOORD ) THEN
      Bool:=TRUE;
  END;{with}
  LSAUXDOM_CpPREPPONAANIO:=Bool;
END;{function}
 PROCEDURE LSAUXDOM_AsPREPPONAANIO(VAR rec:LSDOMAINT_PREPPRECORD);
BEGIN
WITH rec DO
BEGIN
REQ := [POSPOL,NEGPOL,OMEGAPOL];
                                                      ENV := [POSPOL,NEGPOL,OMEGAPOL];
                                                      MOOD := DECLXPMOOD;
                                                      ACTSUBCEFS := [AAN];
                                                      SYNPPEFS := [SYNNP];
                                                      THETAPP := PP120;
                                                      HEADKEY := auxkey('AANIOKEY');
                                                      CLASS := OMEGATIMEADVCLASS;
                                                      DEIXIS := OMEGADEIXIS;
                                                      ASPECT := OMEGAASPECT;
                                                      RETRO := FALSE;
                                                      SUPERDEIXIS := OMEGADEIXIS;
                                                      RADVKEY := 0;
                                                      STRANDED := FALSE;
                                                      SPECQ := YESSPEC;
                                                      COORD := NOCOORD;
                                                      END
END;

 FUNCTION LSAUXDOM_CpPREPPONVOORIO
                         (rec:LSDOMAINT_PREPPRECORD):BOOLEAN;
VAR Bool : BOOLEAN;
BEGIN 
  Bool := FALSE;
  WITH rec DO
  BEGIN
    IF (REQ = [POSPOL,NEGPOL,OMEGAPOL] ) THEN
IF (ENV = [POSPOL,NEGPOL,OMEGAPOL] ) THEN
IF (MOOD = DECLXPMOOD ) THEN
IF (ACTSUBCEFS = [VOOR] ) THEN
IF (SYNPPEFS = [SYNNP] ) THEN
IF (THETAPP = PP120 ) THEN
IF (HEADKEY = auxkey('VOORIOKEY') ) THEN
IF (CLASS = OMEGATIMEADVCLASS ) THEN
IF (DEIXIS = OMEGADEIXIS ) THEN
IF (ASPECT = OMEGAASPECT ) THEN
IF (RETRO = FALSE ) THEN
IF (SUPERDEIXIS = OMEGADEIXIS ) THEN
IF (RADVKEY = 0 ) THEN
IF (STRANDED = FALSE ) THEN
IF (SPECQ = YESSPEC ) THEN
IF (COORD = NOCOORD ) THEN
      Bool:=TRUE;
  END;{with}
  LSAUXDOM_CpPREPPONVOORIO:=Bool;
END;{function}
 PROCEDURE LSAUXDOM_AsPREPPONVOORIO(VAR rec:LSDOMAINT_PREPPRECORD);
BEGIN
WITH rec DO
BEGIN
REQ := [POSPOL,NEGPOL,OMEGAPOL];
                                                      ENV := [POSPOL,NEGPOL,OMEGAPOL];
                                                      MOOD := DECLXPMOOD;
                                                      ACTSUBCEFS := [VOOR];
                                                      SYNPPEFS := [SYNNP];
                                                      THETAPP := PP120;
                                                      HEADKEY := auxkey('VOORIOKEY');
                                                      CLASS := OMEGATIMEADVCLASS;
                                                      DEIXIS := OMEGADEIXIS;
                                                      ASPECT := OMEGAASPECT;
                                                      RETRO := FALSE;
                                                      SUPERDEIXIS := OMEGADEIXIS;
                                                      RADVKEY := 0;
                                                      STRANDED := FALSE;
                                                      SPECQ := YESSPEC;
                                                      COORD := NOCOORD;
                                                      END
END;

 FUNCTION LSAUXDOM_CpPREPPONDOORBY
                         (rec:LSDOMAINT_PREPPRECORD):BOOLEAN;
VAR Bool : BOOLEAN;
BEGIN 
  Bool := FALSE;
  WITH rec DO
  BEGIN
    IF (REQ = [POSPOL,NEGPOL,OMEGAPOL] ) THEN
IF (ENV = [POSPOL,NEGPOL,OMEGAPOL] ) THEN
IF (MOOD = DECLXPMOOD ) THEN
IF (ACTSUBCEFS = [DOORBY] ) THEN
IF (SYNPPEFS = [SYNNP] ) THEN
IF (THETAPP = PP120 ) THEN
IF (HEADKEY = auxkey('DOORBYKEY') ) THEN
IF (CLASS = OMEGATIMEADVCLASS ) THEN
IF (DEIXIS = OMEGADEIXIS ) THEN
IF (ASPECT = OMEGAASPECT ) THEN
IF (RETRO = FALSE ) THEN
IF (SUPERDEIXIS = OMEGADEIXIS ) THEN
IF (RADVKEY = 0 ) THEN
IF (STRANDED = FALSE ) THEN
IF (SPECQ = YESSPEC ) THEN
IF (COORD = NOCOORD ) THEN
      Bool:=TRUE;
  END;{with}
  LSAUXDOM_CpPREPPONDOORBY:=Bool;
END;{function}
 PROCEDURE LSAUXDOM_AsPREPPONDOORBY(VAR rec:LSDOMAINT_PREPPRECORD);
BEGIN
WITH rec DO
BEGIN
REQ := [POSPOL,NEGPOL,OMEGAPOL];
                                                      ENV := [POSPOL,NEGPOL,OMEGAPOL];
                                                      MOOD := DECLXPMOOD;
                                                      ACTSUBCEFS := [DOORBY];
                                                      SYNPPEFS := [SYNNP];
                                                      THETAPP := PP120;
                                                      HEADKEY := auxkey('DOORBYKEY');
                                                      CLASS := OMEGATIMEADVCLASS;
                                                      DEIXIS := OMEGADEIXIS;
                                                      ASPECT := OMEGAASPECT;
                                                      RETRO := FALSE;
                                                      SUPERDEIXIS := OMEGADEIXIS;
                                                      RADVKEY := 0;
                                                      STRANDED := FALSE;
                                                      SPECQ := YESSPEC;
                                                      COORD := NOCOORD;
                                                      END
END;

 FUNCTION LSAUXDOM_CpPREPPONMEE
                         (rec:LSDOMAINT_PREPPRECORD):BOOLEAN;
VAR Bool : BOOLEAN;
BEGIN 
  Bool := FALSE;
  WITH rec DO
  BEGIN
    IF (REQ = [POSPOL,NEGPOL,OMEGAPOL] ) THEN
IF (ENV = [POSPOL,NEGPOL,OMEGAPOL] ) THEN
IF (MOOD = DECLXPMOOD ) THEN
IF (ACTSUBCEFS = [INSTRUM] ) THEN
IF (SYNPPEFS = [SYNNP] ) THEN
IF (THETAPP = PP120 ) THEN
IF (HEADKEY = auxkey('MEEPREPKEY') ) THEN
IF (CLASS = OMEGATIMEADVCLASS ) THEN
IF (DEIXIS = OMEGADEIXIS ) THEN
IF (ASPECT = OMEGAASPECT ) THEN
IF (RETRO = FALSE ) THEN
IF (SUPERDEIXIS = OMEGADEIXIS ) THEN
IF (RADVKEY = 0 ) THEN
IF (STRANDED = FALSE ) THEN
IF (SPECQ = YESSPEC ) THEN
IF (COORD = NOCOORD ) THEN
      Bool:=TRUE;
  END;{with}
  LSAUXDOM_CpPREPPONMEE:=Bool;
END;{function}
 PROCEDURE LSAUXDOM_AsPREPPONMEE(VAR rec:LSDOMAINT_PREPPRECORD);
BEGIN
WITH rec DO
BEGIN
REQ := [POSPOL,NEGPOL,OMEGAPOL];
                                                      ENV := [POSPOL,NEGPOL,OMEGAPOL];
                                                      MOOD := DECLXPMOOD;
                                                      ACTSUBCEFS := [INSTRUM];
                                                      SYNPPEFS := [SYNNP];
                                                      THETAPP := PP120;
                                                      HEADKEY := auxkey('MEEPREPKEY');
                                                      CLASS := OMEGATIMEADVCLASS;
                                                      DEIXIS := OMEGADEIXIS;
                                                      ASPECT := OMEGAASPECT;
                                                      RETRO := FALSE;
                                                      SUPERDEIXIS := OMEGADEIXIS;
                                                      RADVKEY := 0;
                                                      STRANDED := FALSE;
                                                      SPECQ := YESSPEC;
                                                      COORD := NOCOORD;
                                                      END
END;

 FUNCTION LSAUXDOM_CpNPONEC
                         (rec:LSDOMAINT_NPRECORD):BOOLEAN;
VAR Bool : BOOLEAN;
BEGIN 
  Bool := FALSE;
  WITH rec DO
  BEGIN
    IF (REQ = [POSPOL,NEGPOL,OMEGAPOL] ) THEN
IF (ENV = [POSPOL,NEGPOL,OMEGAPOL] ) THEN
IF (SUPERDEIXIS = OMEGADEIXIS ) THEN
IF (CLASS = OMEGATIMEADVCLASS ) THEN
IF (DEIXIS = OMEGADEIXIS ) THEN
IF (ASPECT = OMEGAASPECT ) THEN
IF (RETRO = FALSE ) THEN
IF (DEFINITE = DEF ) THEN
IF (PERSON = 3 ) THEN
IF (NUMBER = SINGULAR ) THEN
IF (CASES = [NOMINATIVE] ) THEN
IF (GENDERS = [OMEGAGENDER] ) THEN
IF (SEXES = [] ) THEN
IF (ACTSUBCS = [OTHERNOUN] ) THEN
IF (TEMPORAL = FALSE ) THEN
IF (POSSGENI = FALSE ) THEN
IF (ANIMATE = OMEGAANIMATE ) THEN
IF (HUMAN = OMEGAHUMAN ) THEN
IF (ACTCOMAS = [] ) THEN
IF (THETANP = OMEGATHETANP ) THEN
IF (NOUNPATTERNEFS = [] ) THEN
IF (POSSPRED = FALSE ) THEN
IF (POSSNIETNP = FALSE ) THEN
IF (MOOD = DECLXPMOOD ) THEN
IF (GENERIC = NOGENERIC ) THEN
IF (POSSRFORM = FALSE ) THEN
IF (SYNTQUANT = OMEGAQUANT ) THEN
IF (NPHEAD = ECNP ) THEN
IF (SPECQ = OMEGASPEC ) THEN
IF (COORD = NOCOORD ) THEN
      Bool:=TRUE;
  END;{with}
  LSAUXDOM_CpNPONEC:=Bool;
END;{function}
 PROCEDURE LSAUXDOM_AsNPONEC(VAR rec:LSDOMAINT_NPRECORD);
BEGIN
WITH rec DO
BEGIN
REQ := [POSPOL,NEGPOL,OMEGAPOL];
                                                      ENV := [POSPOL,NEGPOL,OMEGAPOL];
                                                      SUPERDEIXIS := OMEGADEIXIS;
                                                      CLASS := OMEGATIMEADVCLASS;
                                                      DEIXIS := OMEGADEIXIS;
                                                      ASPECT := OMEGAASPECT;
                                                      RETRO := FALSE;
                                                      DEFINITE := DEF;
                                                      PERSON := 3;
                                                      NUMBER := SINGULAR;
                                                      CASES := [NOMINATIVE];
                                                      GENDERS := [OMEGAGENDER];
                                                      SEXES := [];
                                                      ACTSUBCS := [OTHERNOUN];
                                                      TEMPORAL := FALSE;
                                                      POSSGENI := FALSE;
                                                      ANIMATE := OMEGAANIMATE;
                                                      HUMAN := OMEGAHUMAN;
                                                      ACTCOMAS := [];
                                                      THETANP := OMEGATHETANP;
                                                      NOUNPATTERNEFS := [];
                                                      POSSPRED := FALSE;
                                                      POSSNIETNP := FALSE;
                                                      MOOD := DECLXPMOOD;
                                                      GENERIC := NOGENERIC;
                                                      POSSRFORM := FALSE;
                                                      SYNTQUANT := OMEGAQUANT;
                                                      NPHEAD := ECNP;
                                                      SPECQ := OMEGASPEC;
                                                      COORD := NOCOORD;
                                                      END
END;

 FUNCTION LSAUXDOM_CpNPONEREC
                         (rec:LSDOMAINT_NPRECORD):BOOLEAN;
VAR Bool : BOOLEAN;
BEGIN 
  Bool := FALSE;
  WITH rec DO
  BEGIN
    IF (REQ = [POSPOL,NEGPOL,OMEGAPOL] ) THEN
IF (ENV = [POSPOL,NEGPOL,OMEGAPOL] ) THEN
IF (SUPERDEIXIS = OMEGADEIXIS ) THEN
IF (CLASS = OMEGATIMEADVCLASS ) THEN
IF (DEIXIS = OMEGADEIXIS ) THEN
IF (ASPECT = OMEGAASPECT ) THEN
IF (RETRO = FALSE ) THEN
IF (DEFINITE = DEF ) THEN
IF (PERSON = 3 ) THEN
IF (NUMBER = SINGULAR ) THEN
IF (CASES = [NOMINATIVE] ) THEN
IF (GENDERS = [OMEGAGENDER] ) THEN
IF (SEXES = [] ) THEN
IF (ACTSUBCS = [OTHERNOUN] ) THEN
IF (TEMPORAL = FALSE ) THEN
IF (POSSGENI = FALSE ) THEN
IF (ANIMATE = OMEGAANIMATE ) THEN
IF (HUMAN = OMEGAHUMAN ) THEN
IF (ACTCOMAS = [] ) THEN
IF (THETANP = OMEGATHETANP ) THEN
IF (NOUNPATTERNEFS = [] ) THEN
IF (POSSPRED = FALSE ) THEN
IF (POSSNIETNP = FALSE ) THEN
IF (MOOD = DECLXPMOOD ) THEN
IF (GENERIC = NOGENERIC ) THEN
IF (POSSRFORM = FALSE ) THEN
IF (SYNTQUANT = OMEGAQUANT ) THEN
IF (NPHEAD = ECNP ) THEN
IF (SPECQ = OMEGASPEC ) THEN
IF (COORD = NOCOORD ) THEN
      Bool:=TRUE;
  END;{with}
  LSAUXDOM_CpNPONEREC:=Bool;
END;{function}
 PROCEDURE LSAUXDOM_AsNPONEREC(VAR rec:LSDOMAINT_NPRECORD);
BEGIN
WITH rec DO
BEGIN
REQ := [POSPOL,NEGPOL,OMEGAPOL];
                                                      ENV := [POSPOL,NEGPOL,OMEGAPOL];
                                                      SUPERDEIXIS := OMEGADEIXIS;
                                                      CLASS := OMEGATIMEADVCLASS;
                                                      DEIXIS := OMEGADEIXIS;
                                                      ASPECT := OMEGAASPECT;
                                                      RETRO := FALSE;
                                                      DEFINITE := DEF;
                                                      PERSON := 3;
                                                      NUMBER := SINGULAR;
                                                      CASES := [NOMINATIVE];
                                                      GENDERS := [OMEGAGENDER];
                                                      SEXES := [];
                                                      ACTSUBCS := [OTHERNOUN];
                                                      TEMPORAL := FALSE;
                                                      POSSGENI := FALSE;
                                                      ANIMATE := OMEGAANIMATE;
                                                      HUMAN := OMEGAHUMAN;
                                                      ACTCOMAS := [];
                                                      THETANP := OMEGATHETANP;
                                                      NOUNPATTERNEFS := [];
                                                      POSSPRED := FALSE;
                                                      POSSNIETNP := FALSE;
                                                      MOOD := DECLXPMOOD;
                                                      GENERIC := NOGENERIC;
                                                      POSSRFORM := FALSE;
                                                      SYNTQUANT := OMEGAQUANT;
                                                      NPHEAD := ECNP;
                                                      SPECQ := OMEGASPEC;
                                                      COORD := NOCOORD;
                                                      END
END;

 FUNCTION LSAUXDOM_CpNPONDATDMPR
                         (rec:LSDOMAINT_NPRECORD):BOOLEAN;
VAR Bool : BOOLEAN;
BEGIN 
  Bool := FALSE;
  WITH rec DO
  BEGIN
    IF (REQ = [POSPOL,NEGPOL,OMEGAPOL] ) THEN
IF (ENV = [POSPOL,NEGPOL,OMEGAPOL] ) THEN
IF (SUPERDEIXIS = OMEGADEIXIS ) THEN
IF (CLASS = OMEGATIMEADVCLASS ) THEN
IF (DEIXIS = OMEGADEIXIS ) THEN
IF (ASPECT = OMEGAASPECT ) THEN
IF (RETRO = FALSE ) THEN
IF (DEFINITE = DEF ) THEN
IF (PERSON = 3 ) THEN
IF (NUMBER = SINGULAR ) THEN
IF (CASES = [NOMINATIVE] ) THEN
IF (GENDERS = [OMEGAGENDER] ) THEN
IF (SEXES = [] ) THEN
IF (ACTSUBCS = [OTHERNOUN] ) THEN
IF (TEMPORAL = FALSE ) THEN
IF (POSSGENI = FALSE ) THEN
IF (ANIMATE = NOANIMATE ) THEN
IF (HUMAN = NOHUMAN ) THEN
IF (ACTCOMAS = [] ) THEN
IF (THETANP = OMEGATHETANP ) THEN
IF (NOUNPATTERNEFS = [] ) THEN
IF (POSSPRED = FALSE ) THEN
IF (POSSNIETNP = FALSE ) THEN
IF (MOOD = DECLXPMOOD ) THEN
IF (GENERIC = OMEGAGENERIC ) THEN
IF (POSSRFORM = TRUE ) THEN
IF (SYNTQUANT = OMEGAQUANT ) THEN
IF (NPHEAD = DATNP ) THEN
IF (SPECQ = YESSPEC ) THEN
IF (COORD = NOCOORD ) THEN
      Bool:=TRUE;
  END;{with}
  LSAUXDOM_CpNPONDATDMPR:=Bool;
END;{function}
 PROCEDURE LSAUXDOM_AsNPONDATDMPR(VAR rec:LSDOMAINT_NPRECORD);
BEGIN
WITH rec DO
BEGIN
REQ := [POSPOL,NEGPOL,OMEGAPOL];
                                                      ENV := [POSPOL,NEGPOL,OMEGAPOL];
                                                      SUPERDEIXIS := OMEGADEIXIS;
                                                      CLASS := OMEGATIMEADVCLASS;
                                                      DEIXIS := OMEGADEIXIS;
                                                      ASPECT := OMEGAASPECT;
                                                      RETRO := FALSE;
                                                      DEFINITE := DEF;
                                                      PERSON := 3;
                                                      NUMBER := SINGULAR;
                                                      CASES := [NOMINATIVE];
                                                      GENDERS := [OMEGAGENDER];
                                                      SEXES := [];
                                                      ACTSUBCS := [OTHERNOUN];
                                                      TEMPORAL := FALSE;
                                                      POSSGENI := FALSE;
                                                      ANIMATE := NOANIMATE;
                                                      HUMAN := NOHUMAN;
                                                      ACTCOMAS := [];
                                                      THETANP := OMEGATHETANP;
                                                      NOUNPATTERNEFS := [];
                                                      POSSPRED := FALSE;
                                                      POSSNIETNP := FALSE;
                                                      MOOD := DECLXPMOOD;
                                                      GENERIC := OMEGAGENERIC;
                                                      POSSRFORM := TRUE;
                                                      SYNTQUANT := OMEGAQUANT;
                                                      NPHEAD := DATNP;
                                                      SPECQ := YESSPEC;
                                                      COORD := NOCOORD;
                                                      END
END;

 FUNCTION LSAUXDOM_CpNPONDITDMPR
                         (rec:LSDOMAINT_NPRECORD):BOOLEAN;
VAR Bool : BOOLEAN;
BEGIN 
  Bool := FALSE;
  WITH rec DO
  BEGIN
    IF (REQ = [POSPOL,NEGPOL,OMEGAPOL] ) THEN
IF (ENV = [POSPOL,NEGPOL,OMEGAPOL] ) THEN
IF (SUPERDEIXIS = OMEGADEIXIS ) THEN
IF (CLASS = OMEGATIMEADVCLASS ) THEN
IF (DEIXIS = OMEGADEIXIS ) THEN
IF (ASPECT = OMEGAASPECT ) THEN
IF (RETRO = FALSE ) THEN
IF (DEFINITE = DEF ) THEN
IF (PERSON = 3 ) THEN
IF (NUMBER = SINGULAR ) THEN
IF (CASES = [NOMINATIVE] ) THEN
IF (GENDERS = [OMEGAGENDER] ) THEN
IF (SEXES = [] ) THEN
IF (ACTSUBCS = [OTHERNOUN] ) THEN
IF (TEMPORAL = FALSE ) THEN
IF (POSSGENI = FALSE ) THEN
IF (ANIMATE = NOANIMATE ) THEN
IF (HUMAN = NOHUMAN ) THEN
IF (ACTCOMAS = [] ) THEN
IF (THETANP = OMEGATHETANP ) THEN
IF (NOUNPATTERNEFS = [] ) THEN
IF (POSSPRED = FALSE ) THEN
IF (POSSNIETNP = FALSE ) THEN
IF (MOOD = DECLXPMOOD ) THEN
IF (GENERIC = OMEGAGENERIC ) THEN
IF (POSSRFORM = TRUE ) THEN
IF (SYNTQUANT = OMEGAQUANT ) THEN
IF (NPHEAD = DITNP ) THEN
IF (SPECQ = YESSPEC ) THEN
IF (COORD = NOCOORD ) THEN
      Bool:=TRUE;
  END;{with}
  LSAUXDOM_CpNPONDITDMPR:=Bool;
END;{function}
 PROCEDURE LSAUXDOM_AsNPONDITDMPR(VAR rec:LSDOMAINT_NPRECORD);
BEGIN
WITH rec DO
BEGIN
REQ := [POSPOL,NEGPOL,OMEGAPOL];
                                                      ENV := [POSPOL,NEGPOL,OMEGAPOL];
                                                      SUPERDEIXIS := OMEGADEIXIS;
                                                      CLASS := OMEGATIMEADVCLASS;
                                                      DEIXIS := OMEGADEIXIS;
                                                      ASPECT := OMEGAASPECT;
                                                      RETRO := FALSE;
                                                      DEFINITE := DEF;
                                                      PERSON := 3;
                                                      NUMBER := SINGULAR;
                                                      CASES := [NOMINATIVE];
                                                      GENDERS := [OMEGAGENDER];
                                                      SEXES := [];
                                                      ACTSUBCS := [OTHERNOUN];
                                                      TEMPORAL := FALSE;
                                                      POSSGENI := FALSE;
                                                      ANIMATE := NOANIMATE;
                                                      HUMAN := NOHUMAN;
                                                      ACTCOMAS := [];
                                                      THETANP := OMEGATHETANP;
                                                      NOUNPATTERNEFS := [];
                                                      POSSPRED := FALSE;
                                                      POSSNIETNP := FALSE;
                                                      MOOD := DECLXPMOOD;
                                                      GENERIC := OMEGAGENERIC;
                                                      POSSRFORM := TRUE;
                                                      SYNTQUANT := OMEGAQUANT;
                                                      NPHEAD := DITNP;
                                                      SPECQ := YESSPEC;
                                                      COORD := NOCOORD;
                                                      END
END;

 FUNCTION LSAUXDOM_CpNPONMENNDFPR
                         (rec:LSDOMAINT_NPRECORD):BOOLEAN;
VAR Bool : BOOLEAN;
BEGIN 
  Bool := FALSE;
  WITH rec DO
  BEGIN
    IF (REQ = [POSPOL,NEGPOL,OMEGAPOL] ) THEN
IF (ENV = [POSPOL,NEGPOL,OMEGAPOL] ) THEN
IF (SUPERDEIXIS = OMEGADEIXIS ) THEN
IF (CLASS = OMEGATIMEADVCLASS ) THEN
IF (DEIXIS = OMEGADEIXIS ) THEN
IF (ASPECT = OMEGAASPECT ) THEN
IF (RETRO = FALSE ) THEN
IF (DEFINITE = DEF ) THEN
IF (PERSON = 3 ) THEN
IF (NUMBER = SINGULAR ) THEN
IF (CASES = [NOMINATIVE] ) THEN
IF (GENDERS = [OMEGAGENDER] ) THEN
IF (SEXES = [] ) THEN
IF (ACTSUBCS = [OTHERNOUN] ) THEN
IF (TEMPORAL = FALSE ) THEN
IF (POSSGENI = FALSE ) THEN
IF (ANIMATE = YESANIMATE ) THEN
IF (HUMAN = YESHUMAN ) THEN
IF (ACTCOMAS = [COUNT] ) THEN
IF (THETANP = OMEGATHETANP ) THEN
IF (NOUNPATTERNEFS = [] ) THEN
IF (POSSPRED = TRUE ) THEN
IF (POSSNIETNP = FALSE ) THEN
IF (MOOD = DECLXPMOOD ) THEN
IF (GENERIC = OMEGAGENERIC ) THEN
IF (POSSRFORM = FALSE ) THEN
IF (SYNTQUANT = OMEGAQUANT ) THEN
IF (NPHEAD = MENNP ) THEN
IF (SPECQ = YESSPEC ) THEN
IF (COORD = NOCOORD ) THEN
      Bool:=TRUE;
  END;{with}
  LSAUXDOM_CpNPONMENNDFPR:=Bool;
END;{function}
 PROCEDURE LSAUXDOM_AsNPONMENNDFPR(VAR rec:LSDOMAINT_NPRECORD);
BEGIN
WITH rec DO
BEGIN
REQ := [POSPOL,NEGPOL,OMEGAPOL];
                                                      ENV := [POSPOL,NEGPOL,OMEGAPOL];
                                                      SUPERDEIXIS := OMEGADEIXIS;
                                                      CLASS := OMEGATIMEADVCLASS;
                                                      DEIXIS := OMEGADEIXIS;
                                                      ASPECT := OMEGAASPECT;
                                                      RETRO := FALSE;
                                                      DEFINITE := DEF;
                                                      PERSON := 3;
                                                      NUMBER := SINGULAR;
                                                      CASES := [NOMINATIVE];
                                                      GENDERS := [OMEGAGENDER];
                                                      SEXES := [];
                                                      ACTSUBCS := [OTHERNOUN];
                                                      TEMPORAL := FALSE;
                                                      POSSGENI := FALSE;
                                                      ANIMATE := YESANIMATE;
                                                      HUMAN := YESHUMAN;
                                                      ACTCOMAS := [COUNT];
                                                      THETANP := OMEGATHETANP;
                                                      NOUNPATTERNEFS := [];
                                                      POSSPRED := TRUE;
                                                      POSSNIETNP := FALSE;
                                                      MOOD := DECLXPMOOD;
                                                      GENERIC := OMEGAGENERIC;
                                                      POSSRFORM := FALSE;
                                                      SYNTQUANT := OMEGAQUANT;
                                                      NPHEAD := MENNP;
                                                      SPECQ := YESSPEC;
                                                      COORD := NOCOORD;
                                                      END
END;

 FUNCTION LSAUXDOM_CpNPONALLESBNDFPR
                         (rec:LSDOMAINT_NPRECORD):BOOLEAN;
VAR Bool : BOOLEAN;
BEGIN 
  Bool := FALSE;
  WITH rec DO
  BEGIN
    IF (REQ = [POSPOL,NEGPOL,OMEGAPOL] ) THEN
IF (ENV = [POSPOL,NEGPOL,OMEGAPOL] ) THEN
IF (SUPERDEIXIS = OMEGADEIXIS ) THEN
IF (CLASS = OMEGATIMEADVCLASS ) THEN
IF (DEIXIS = OMEGADEIXIS ) THEN
IF (ASPECT = OMEGAASPECT ) THEN
IF (RETRO = FALSE ) THEN
IF (DEFINITE = INDEF ) THEN
IF (PERSON = 3 ) THEN
IF (NUMBER = SINGULAR ) THEN
IF (CASES = [NOMINATIVE] ) THEN
IF (GENDERS = [OMEGAGENDER] ) THEN
IF (SEXES = [] ) THEN
IF (ACTSUBCS = [OTHERNOUN] ) THEN
IF (TEMPORAL = FALSE ) THEN
IF (POSSGENI = FALSE ) THEN
IF (ANIMATE = NOANIMATE ) THEN
IF (HUMAN = NOHUMAN ) THEN
IF (ACTCOMAS = [COUNT] ) THEN
IF (THETANP = OMEGATHETANP ) THEN
IF (NOUNPATTERNEFS = [] ) THEN
IF (POSSPRED = TRUE ) THEN
IF (POSSNIETNP = FALSE ) THEN
IF (MOOD = DECLXPMOOD ) THEN
IF (GENERIC = OMEGAGENERIC ) THEN
IF (POSSRFORM = TRUE ) THEN
IF (SYNTQUANT = AQUANT ) THEN
IF (NPHEAD = ALLESNP ) THEN
IF (SPECQ = YESSPEC ) THEN
IF (COORD = NOCOORD ) THEN
      Bool:=TRUE;
  END;{with}
  LSAUXDOM_CpNPONALLESBNDFPR:=Bool;
END;{function}
 PROCEDURE LSAUXDOM_AsNPONALLESBNDFPR(VAR rec:LSDOMAINT_NPRECORD);
BEGIN
WITH rec DO
BEGIN
REQ := [POSPOL,NEGPOL,OMEGAPOL];
                                                      ENV := [POSPOL,NEGPOL,OMEGAPOL];
                                                      SUPERDEIXIS := OMEGADEIXIS;
                                                      CLASS := OMEGATIMEADVCLASS;
                                                      DEIXIS := OMEGADEIXIS;
                                                      ASPECT := OMEGAASPECT;
                                                      RETRO := FALSE;
                                                      DEFINITE := INDEF;
                                                      PERSON := 3;
                                                      NUMBER := SINGULAR;
                                                      CASES := [NOMINATIVE];
                                                      GENDERS := [OMEGAGENDER];
                                                      SEXES := [];
                                                      ACTSUBCS := [OTHERNOUN];
                                                      TEMPORAL := FALSE;
                                                      POSSGENI := FALSE;
                                                      ANIMATE := NOANIMATE;
                                                      HUMAN := NOHUMAN;
                                                      ACTCOMAS := [COUNT];
                                                      THETANP := OMEGATHETANP;
                                                      NOUNPATTERNEFS := [];
                                                      POSSPRED := TRUE;
                                                      POSSNIETNP := FALSE;
                                                      MOOD := DECLXPMOOD;
                                                      GENERIC := OMEGAGENERIC;
                                                      POSSRFORM := TRUE;
                                                      SYNTQUANT := AQUANT;
                                                      NPHEAD := ALLESNP;
                                                      SPECQ := YESSPEC;
                                                      COORD := NOCOORD;
                                                      END
END;

 FUNCTION LSAUXDOM_CpNPONIETSBNDFPR
                         (rec:LSDOMAINT_NPRECORD):BOOLEAN;
VAR Bool : BOOLEAN;
BEGIN 
  Bool := FALSE;
  WITH rec DO
  BEGIN
    IF (REQ = [POSPOL,NEGPOL,OMEGAPOL] ) THEN
IF (ENV = [POSPOL,NEGPOL,OMEGAPOL] ) THEN
IF (SUPERDEIXIS = OMEGADEIXIS ) THEN
IF (CLASS = OMEGATIMEADVCLASS ) THEN
IF (DEIXIS = OMEGADEIXIS ) THEN
IF (ASPECT = OMEGAASPECT ) THEN
IF (RETRO = FALSE ) THEN
IF (DEFINITE = INDEF ) THEN
IF (PERSON = 3 ) THEN
IF (NUMBER = SINGULAR ) THEN
IF (CASES = [NOMINATIVE] ) THEN
IF (GENDERS = [OMEGAGENDER] ) THEN
IF (SEXES = [] ) THEN
IF (ACTSUBCS = [OTHERNOUN] ) THEN
IF (TEMPORAL = FALSE ) THEN
IF (POSSGENI = FALSE ) THEN
IF (ANIMATE = NOANIMATE ) THEN
IF (HUMAN = NOHUMAN ) THEN
IF (ACTCOMAS = [COUNT] ) THEN
IF (THETANP = OMEGATHETANP ) THEN
IF (NOUNPATTERNEFS = [] ) THEN
IF (POSSPRED = TRUE ) THEN
IF (POSSNIETNP = TRUE ) THEN
IF (MOOD = DECLXPMOOD ) THEN
IF (GENERIC = OMEGAGENERIC ) THEN
IF (POSSRFORM = TRUE ) THEN
IF (SYNTQUANT = OMEGAQUANT ) THEN
IF (NPHEAD = IETSNP ) THEN
IF (SPECQ = YESSPEC ) THEN
IF (COORD = NOCOORD ) THEN
      Bool:=TRUE;
  END;{with}
  LSAUXDOM_CpNPONIETSBNDFPR:=Bool;
END;{function}
 PROCEDURE LSAUXDOM_AsNPONIETSBNDFPR(VAR rec:LSDOMAINT_NPRECORD);
BEGIN
WITH rec DO
BEGIN
REQ := [POSPOL,NEGPOL,OMEGAPOL];
                                                      ENV := [POSPOL,NEGPOL,OMEGAPOL];
                                                      SUPERDEIXIS := OMEGADEIXIS;
                                                      CLASS := OMEGATIMEADVCLASS;
                                                      DEIXIS := OMEGADEIXIS;
                                                      ASPECT := OMEGAASPECT;
                                                      RETRO := FALSE;
                                                      DEFINITE := INDEF;
                                                      PERSON := 3;
                                                      NUMBER := SINGULAR;
                                                      CASES := [NOMINATIVE];
                                                      GENDERS := [OMEGAGENDER];
                                                      SEXES := [];
                                                      ACTSUBCS := [OTHERNOUN];
                                                      TEMPORAL := FALSE;
                                                      POSSGENI := FALSE;
                                                      ANIMATE := NOANIMATE;
                                                      HUMAN := NOHUMAN;
                                                      ACTCOMAS := [COUNT];
                                                      THETANP := OMEGATHETANP;
                                                      NOUNPATTERNEFS := [];
                                                      POSSPRED := TRUE;
                                                      POSSNIETNP := TRUE;
                                                      MOOD := DECLXPMOOD;
                                                      GENERIC := OMEGAGENERIC;
                                                      POSSRFORM := TRUE;
                                                      SYNTQUANT := OMEGAQUANT;
                                                      NPHEAD := IETSNP;
                                                      SPECQ := YESSPEC;
                                                      COORD := NOCOORD;
                                                      END
END;

 FUNCTION LSAUXDOM_CpNPONNIETSBNDFPR
                         (rec:LSDOMAINT_NPRECORD):BOOLEAN;
VAR Bool : BOOLEAN;
BEGIN 
  Bool := FALSE;
  WITH rec DO
  BEGIN
    IF (REQ = [POSPOL,NEGPOL,OMEGAPOL] ) THEN
IF (ENV = [POSPOL,NEGPOL,OMEGAPOL] ) THEN
IF (SUPERDEIXIS = OMEGADEIXIS ) THEN
IF (CLASS = OMEGATIMEADVCLASS ) THEN
IF (DEIXIS = OMEGADEIXIS ) THEN
IF (ASPECT = OMEGAASPECT ) THEN
IF (RETRO = FALSE ) THEN
IF (DEFINITE = INDEF ) THEN
IF (PERSON = 3 ) THEN
IF (NUMBER = SINGULAR ) THEN
IF (CASES = [NOMINATIVE] ) THEN
IF (GENDERS = [OMEGAGENDER] ) THEN
IF (SEXES = [] ) THEN
IF (ACTSUBCS = [OTHERNOUN] ) THEN
IF (TEMPORAL = FALSE ) THEN
IF (POSSGENI = FALSE ) THEN
IF (ANIMATE = NOANIMATE ) THEN
IF (HUMAN = NOHUMAN ) THEN
IF (ACTCOMAS = [COUNT] ) THEN
IF (THETANP = OMEGATHETANP ) THEN
IF (NOUNPATTERNEFS = [] ) THEN
IF (POSSPRED = TRUE ) THEN
IF (POSSNIETNP = FALSE ) THEN
IF (MOOD = DECLXPMOOD ) THEN
IF (GENERIC = OMEGAGENERIC ) THEN
IF (POSSRFORM = TRUE ) THEN
IF (SYNTQUANT = OMEGAQUANT ) THEN
IF (NPHEAD = OTHERNP ) THEN
IF (SPECQ = YESSPEC ) THEN
IF (COORD = NOCOORD ) THEN
      Bool:=TRUE;
  END;{with}
  LSAUXDOM_CpNPONNIETSBNDFPR:=Bool;
END;{function}
 PROCEDURE LSAUXDOM_AsNPONNIETSBNDFPR(VAR rec:LSDOMAINT_NPRECORD);
BEGIN
WITH rec DO
BEGIN
REQ := [POSPOL,NEGPOL,OMEGAPOL];
                                                      ENV := [POSPOL,NEGPOL,OMEGAPOL];
                                                      SUPERDEIXIS := OMEGADEIXIS;
                                                      CLASS := OMEGATIMEADVCLASS;
                                                      DEIXIS := OMEGADEIXIS;
                                                      ASPECT := OMEGAASPECT;
                                                      RETRO := FALSE;
                                                      DEFINITE := INDEF;
                                                      PERSON := 3;
                                                      NUMBER := SINGULAR;
                                                      CASES := [NOMINATIVE];
                                                      GENDERS := [OMEGAGENDER];
                                                      SEXES := [];
                                                      ACTSUBCS := [OTHERNOUN];
                                                      TEMPORAL := FALSE;
                                                      POSSGENI := FALSE;
                                                      ANIMATE := NOANIMATE;
                                                      HUMAN := NOHUMAN;
                                                      ACTCOMAS := [COUNT];
                                                      THETANP := OMEGATHETANP;
                                                      NOUNPATTERNEFS := [];
                                                      POSSPRED := TRUE;
                                                      POSSNIETNP := FALSE;
                                                      MOOD := DECLXPMOOD;
                                                      GENERIC := OMEGAGENERIC;
                                                      POSSRFORM := TRUE;
                                                      SYNTQUANT := OMEGAQUANT;
                                                      NPHEAD := OTHERNP;
                                                      SPECQ := YESSPEC;
                                                      COORD := NOCOORD;
                                                      END
END;

 FUNCTION LSAUXDOM_CpNPONIEMANDBNDFPR
                         (rec:LSDOMAINT_NPRECORD):BOOLEAN;
VAR Bool : BOOLEAN;
BEGIN 
  Bool := FALSE;
  WITH rec DO
  BEGIN
    IF (REQ = [POSPOL,NEGPOL,OMEGAPOL] ) THEN
IF (ENV = [POSPOL,NEGPOL,OMEGAPOL] ) THEN
IF (SUPERDEIXIS = OMEGADEIXIS ) THEN
IF (CLASS = OMEGATIMEADVCLASS ) THEN
IF (DEIXIS = OMEGADEIXIS ) THEN
IF (ASPECT = OMEGAASPECT ) THEN
IF (RETRO = FALSE ) THEN
IF (DEFINITE = INDEF ) THEN
IF (PERSON = 3 ) THEN
IF (NUMBER = SINGULAR ) THEN
IF (CASES = [NOMINATIVE] ) THEN
IF (GENDERS = [OMEGAGENDER] ) THEN
IF (SEXES = [] ) THEN
IF (ACTSUBCS = [OTHERNOUN] ) THEN
IF (TEMPORAL = FALSE ) THEN
IF (POSSGENI = TRUE ) THEN
IF (ANIMATE = YESANIMATE ) THEN
IF (HUMAN = YESHUMAN ) THEN
IF (ACTCOMAS = [COUNT] ) THEN
IF (THETANP = OMEGATHETANP ) THEN
IF (NOUNPATTERNEFS = [] ) THEN
IF (POSSPRED = TRUE ) THEN
IF (POSSNIETNP = TRUE ) THEN
IF (MOOD = DECLXPMOOD ) THEN
IF (GENERIC = OMEGAGENERIC ) THEN
IF (POSSRFORM = FALSE ) THEN
IF (SYNTQUANT = OMEGAQUANT ) THEN
IF (NPHEAD = OTHERNP ) THEN
IF (SPECQ = YESSPEC ) THEN
IF (COORD = NOCOORD ) THEN
      Bool:=TRUE;
  END;{with}
  LSAUXDOM_CpNPONIEMANDBNDFPR:=Bool;
END;{function}
 PROCEDURE LSAUXDOM_AsNPONIEMANDBNDFPR(VAR rec:LSDOMAINT_NPRECORD);
BEGIN
WITH rec DO
BEGIN
REQ := [POSPOL,NEGPOL,OMEGAPOL];
                                                      ENV := [POSPOL,NEGPOL,OMEGAPOL];
                                                      SUPERDEIXIS := OMEGADEIXIS;
                                                      CLASS := OMEGATIMEADVCLASS;
                                                      DEIXIS := OMEGADEIXIS;
                                                      ASPECT := OMEGAASPECT;
                                                      RETRO := FALSE;
                                                      DEFINITE := INDEF;
                                                      PERSON := 3;
                                                      NUMBER := SINGULAR;
                                                      CASES := [NOMINATIVE];
                                                      GENDERS := [OMEGAGENDER];
                                                      SEXES := [];
                                                      ACTSUBCS := [OTHERNOUN];
                                                      TEMPORAL := FALSE;
                                                      POSSGENI := TRUE;
                                                      ANIMATE := YESANIMATE;
                                                      HUMAN := YESHUMAN;
                                                      ACTCOMAS := [COUNT];
                                                      THETANP := OMEGATHETANP;
                                                      NOUNPATTERNEFS := [];
                                                      POSSPRED := TRUE;
                                                      POSSNIETNP := TRUE;
                                                      MOOD := DECLXPMOOD;
                                                      GENERIC := OMEGAGENERIC;
                                                      POSSRFORM := FALSE;
                                                      SYNTQUANT := OMEGAQUANT;
                                                      NPHEAD := OTHERNP;
                                                      SPECQ := YESSPEC;
                                                      COORD := NOCOORD;
                                                      END
END;

 FUNCTION LSAUXDOM_CpNPONNIEMANDBNDFPR
                         (rec:LSDOMAINT_NPRECORD):BOOLEAN;
VAR Bool : BOOLEAN;
BEGIN 
  Bool := FALSE;
  WITH rec DO
  BEGIN
    IF (REQ = [POSPOL,NEGPOL,OMEGAPOL] ) THEN
IF (ENV = [POSPOL,NEGPOL,OMEGAPOL] ) THEN
IF (SUPERDEIXIS = OMEGADEIXIS ) THEN
IF (CLASS = OMEGATIMEADVCLASS ) THEN
IF (DEIXIS = OMEGADEIXIS ) THEN
IF (ASPECT = OMEGAASPECT ) THEN
IF (RETRO = FALSE ) THEN
IF (DEFINITE = INDEF ) THEN
IF (PERSON = 3 ) THEN
IF (NUMBER = SINGULAR ) THEN
IF (CASES = [NOMINATIVE] ) THEN
IF (GENDERS = [OMEGAGENDER] ) THEN
IF (SEXES = [] ) THEN
IF (ACTSUBCS = [OTHERNOUN] ) THEN
IF (TEMPORAL = FALSE ) THEN
IF (POSSGENI = TRUE ) THEN
IF (ANIMATE = YESANIMATE ) THEN
IF (HUMAN = YESHUMAN ) THEN
IF (ACTCOMAS = [COUNT] ) THEN
IF (THETANP = OMEGATHETANP ) THEN
IF (NOUNPATTERNEFS = [] ) THEN
IF (POSSPRED = TRUE ) THEN
IF (POSSNIETNP = FALSE ) THEN
IF (MOOD = DECLXPMOOD ) THEN
IF (GENERIC = OMEGAGENERIC ) THEN
IF (POSSRFORM = FALSE ) THEN
IF (SYNTQUANT = OMEGAQUANT ) THEN
IF (NPHEAD = OTHERNP ) THEN
IF (SPECQ = YESSPEC ) THEN
IF (COORD = NOCOORD ) THEN
      Bool:=TRUE;
  END;{with}
  LSAUXDOM_CpNPONNIEMANDBNDFPR:=Bool;
END;{function}
 PROCEDURE LSAUXDOM_AsNPONNIEMANDBNDFPR(VAR rec:LSDOMAINT_NPRECORD);
BEGIN
WITH rec DO
BEGIN
REQ := [POSPOL,NEGPOL,OMEGAPOL];
                                                      ENV := [POSPOL,NEGPOL,OMEGAPOL];
                                                      SUPERDEIXIS := OMEGADEIXIS;
                                                      CLASS := OMEGATIMEADVCLASS;
                                                      DEIXIS := OMEGADEIXIS;
                                                      ASPECT := OMEGAASPECT;
                                                      RETRO := FALSE;
                                                      DEFINITE := INDEF;
                                                      PERSON := 3;
                                                      NUMBER := SINGULAR;
                                                      CASES := [NOMINATIVE];
                                                      GENDERS := [OMEGAGENDER];
                                                      SEXES := [];
                                                      ACTSUBCS := [OTHERNOUN];
                                                      TEMPORAL := FALSE;
                                                      POSSGENI := TRUE;
                                                      ANIMATE := YESANIMATE;
                                                      HUMAN := YESHUMAN;
                                                      ACTCOMAS := [COUNT];
                                                      THETANP := OMEGATHETANP;
                                                      NOUNPATTERNEFS := [];
                                                      POSSPRED := TRUE;
                                                      POSSNIETNP := FALSE;
                                                      MOOD := DECLXPMOOD;
                                                      GENERIC := OMEGAGENERIC;
                                                      POSSRFORM := FALSE;
                                                      SYNTQUANT := OMEGAQUANT;
                                                      NPHEAD := OTHERNP;
                                                      SPECQ := YESSPEC;
                                                      COORD := NOCOORD;
                                                      END
END;

 FUNCTION LSAUXDOM_CpNPONWATWHPR
                         (rec:LSDOMAINT_NPRECORD):BOOLEAN;
VAR Bool : BOOLEAN;
BEGIN 
  Bool := FALSE;
  WITH rec DO
  BEGIN
    IF (REQ = [POSPOL,NEGPOL,OMEGAPOL] ) THEN
IF (ENV = [POSPOL,NEGPOL,OMEGAPOL] ) THEN
IF (SUPERDEIXIS = OMEGADEIXIS ) THEN
IF (CLASS = OMEGATIMEADVCLASS ) THEN
IF (DEIXIS = OMEGADEIXIS ) THEN
IF (ASPECT = OMEGAASPECT ) THEN
IF (RETRO = FALSE ) THEN
IF (DEFINITE = INDEF ) THEN
IF (PERSON = 3 ) THEN
IF (NUMBER = SINGULAR ) THEN
IF (CASES = [NOMINATIVE] ) THEN
IF (GENDERS = [OMEGAGENDER] ) THEN
IF (SEXES = [] ) THEN
IF (ACTSUBCS = [OTHERNOUN] ) THEN
IF (TEMPORAL = FALSE ) THEN
IF (POSSGENI = FALSE ) THEN
IF (ANIMATE = NOANIMATE ) THEN
IF (HUMAN = NOHUMAN ) THEN
IF (ACTCOMAS = [COUNT] ) THEN
IF (THETANP = OMEGATHETANP ) THEN
IF (NOUNPATTERNEFS = [] ) THEN
IF (POSSPRED = TRUE ) THEN
IF (POSSNIETNP = FALSE ) THEN
IF (MOOD = WH ) THEN
IF (GENERIC = OMEGAGENERIC ) THEN
IF (POSSRFORM = TRUE ) THEN
IF (SYNTQUANT = OMEGAQUANT ) THEN
IF (NPHEAD = WATWHPRONP ) THEN
IF (SPECQ = YESSPEC ) THEN
IF (COORD = NOCOORD ) THEN
      Bool:=TRUE;
  END;{with}
  LSAUXDOM_CpNPONWATWHPR:=Bool;
END;{function}
 PROCEDURE LSAUXDOM_AsNPONWATWHPR(VAR rec:LSDOMAINT_NPRECORD);
BEGIN
WITH rec DO
BEGIN
REQ := [POSPOL,NEGPOL,OMEGAPOL];
                                                      ENV := [POSPOL,NEGPOL,OMEGAPOL];
                                                      SUPERDEIXIS := OMEGADEIXIS;
                                                      CLASS := OMEGATIMEADVCLASS;
                                                      DEIXIS := OMEGADEIXIS;
                                                      ASPECT := OMEGAASPECT;
                                                      RETRO := FALSE;
                                                      DEFINITE := INDEF;
                                                      PERSON := 3;
                                                      NUMBER := SINGULAR;
                                                      CASES := [NOMINATIVE];
                                                      GENDERS := [OMEGAGENDER];
                                                      SEXES := [];
                                                      ACTSUBCS := [OTHERNOUN];
                                                      TEMPORAL := FALSE;
                                                      POSSGENI := FALSE;
                                                      ANIMATE := NOANIMATE;
                                                      HUMAN := NOHUMAN;
                                                      ACTCOMAS := [COUNT];
                                                      THETANP := OMEGATHETANP;
                                                      NOUNPATTERNEFS := [];
                                                      POSSPRED := TRUE;
                                                      POSSNIETNP := FALSE;
                                                      MOOD := WH;
                                                      GENERIC := OMEGAGENERIC;
                                                      POSSRFORM := TRUE;
                                                      SYNTQUANT := OMEGAQUANT;
                                                      NPHEAD := WATWHPRONP;
                                                      SPECQ := YESSPEC;
                                                      COORD := NOCOORD;
                                                      END
END;

 FUNCTION LSAUXDOM_CpNPONMIJZELF
                         (rec:LSDOMAINT_NPRECORD):BOOLEAN;
VAR Bool : BOOLEAN;
BEGIN 
  Bool := FALSE;
  WITH rec DO
  BEGIN
    IF (REQ = [POSPOL,NEGPOL,OMEGAPOL] ) THEN
IF (ENV = [POSPOL,NEGPOL,OMEGAPOL] ) THEN
IF (SUPERDEIXIS = OMEGADEIXIS ) THEN
IF (CLASS = OMEGATIMEADVCLASS ) THEN
IF (DEIXIS = OMEGADEIXIS ) THEN
IF (ASPECT = OMEGAASPECT ) THEN
IF (RETRO = FALSE ) THEN
IF (DEFINITE = DEF ) THEN
IF (PERSON = 1 ) THEN
IF (NUMBER = SINGULAR ) THEN
IF (CASES = [NOMINATIVE] ) THEN
IF (GENDERS = [OMEGAGENDER] ) THEN
IF (SEXES = [] ) THEN
IF (ACTSUBCS = [OTHERNOUN] ) THEN
IF (TEMPORAL = FALSE ) THEN
IF (POSSGENI = FALSE ) THEN
IF (ANIMATE = YESANIMATE ) THEN
IF (HUMAN = OMEGAHUMAN ) THEN
IF (ACTCOMAS = [COUNT] ) THEN
IF (THETANP = OMEGATHETANP ) THEN
IF (NOUNPATTERNEFS = [] ) THEN
IF (POSSPRED = FALSE ) THEN
IF (POSSNIETNP = FALSE ) THEN
IF (MOOD = DECLXPMOOD ) THEN
IF (GENERIC = OMEGAGENERIC ) THEN
IF (POSSRFORM = FALSE ) THEN
IF (SYNTQUANT = OMEGAQUANT ) THEN
IF (NPHEAD = ZICHZELFNP ) THEN
IF (SPECQ = YESSPEC ) THEN
IF (COORD = NOCOORD ) THEN
      Bool:=TRUE;
  END;{with}
  LSAUXDOM_CpNPONMIJZELF:=Bool;
END;{function}
 PROCEDURE LSAUXDOM_AsNPONMIJZELF(VAR rec:LSDOMAINT_NPRECORD);
BEGIN
WITH rec DO
BEGIN
REQ := [POSPOL,NEGPOL,OMEGAPOL];
                                                      ENV := [POSPOL,NEGPOL,OMEGAPOL];
                                                      SUPERDEIXIS := OMEGADEIXIS;
                                                      CLASS := OMEGATIMEADVCLASS;
                                                      DEIXIS := OMEGADEIXIS;
                                                      ASPECT := OMEGAASPECT;
                                                      RETRO := FALSE;
                                                      DEFINITE := DEF;
                                                      PERSON := 1;
                                                      NUMBER := SINGULAR;
                                                      CASES := [NOMINATIVE];
                                                      GENDERS := [OMEGAGENDER];
                                                      SEXES := [];
                                                      ACTSUBCS := [OTHERNOUN];
                                                      TEMPORAL := FALSE;
                                                      POSSGENI := FALSE;
                                                      ANIMATE := YESANIMATE;
                                                      HUMAN := OMEGAHUMAN;
                                                      ACTCOMAS := [COUNT];
                                                      THETANP := OMEGATHETANP;
                                                      NOUNPATTERNEFS := [];
                                                      POSSPRED := FALSE;
                                                      POSSNIETNP := FALSE;
                                                      MOOD := DECLXPMOOD;
                                                      GENERIC := OMEGAGENERIC;
                                                      POSSRFORM := FALSE;
                                                      SYNTQUANT := OMEGAQUANT;
                                                      NPHEAD := ZICHZELFNP;
                                                      SPECQ := YESSPEC;
                                                      COORD := NOCOORD;
                                                      END
END;

 FUNCTION LSAUXDOM_CpNPONMEZELF
                         (rec:LSDOMAINT_NPRECORD):BOOLEAN;
VAR Bool : BOOLEAN;
BEGIN 
  Bool := FALSE;
  WITH rec DO
  BEGIN
    IF (REQ = [POSPOL,NEGPOL,OMEGAPOL] ) THEN
IF (ENV = [POSPOL,NEGPOL,OMEGAPOL] ) THEN
IF (SUPERDEIXIS = OMEGADEIXIS ) THEN
IF (CLASS = OMEGATIMEADVCLASS ) THEN
IF (DEIXIS = OMEGADEIXIS ) THEN
IF (ASPECT = OMEGAASPECT ) THEN
IF (RETRO = FALSE ) THEN
IF (DEFINITE = DEF ) THEN
IF (PERSON = 1 ) THEN
IF (NUMBER = SINGULAR ) THEN
IF (CASES = [NOMINATIVE] ) THEN
IF (GENDERS = [OMEGAGENDER] ) THEN
IF (SEXES = [] ) THEN
IF (ACTSUBCS = [OTHERNOUN] ) THEN
IF (TEMPORAL = FALSE ) THEN
IF (POSSGENI = FALSE ) THEN
IF (ANIMATE = YESANIMATE ) THEN
IF (HUMAN = OMEGAHUMAN ) THEN
IF (ACTCOMAS = [COUNT] ) THEN
IF (THETANP = OMEGATHETANP ) THEN
IF (NOUNPATTERNEFS = [] ) THEN
IF (POSSPRED = FALSE ) THEN
IF (POSSNIETNP = FALSE ) THEN
IF (MOOD = DECLXPMOOD ) THEN
IF (GENERIC = OMEGAGENERIC ) THEN
IF (POSSRFORM = FALSE ) THEN
IF (SYNTQUANT = OMEGAQUANT ) THEN
IF (NPHEAD = ZICHZELFNP ) THEN
IF (SPECQ = YESSPEC ) THEN
IF (COORD = NOCOORD ) THEN
      Bool:=TRUE;
  END;{with}
  LSAUXDOM_CpNPONMEZELF:=Bool;
END;{function}
 PROCEDURE LSAUXDOM_AsNPONMEZELF(VAR rec:LSDOMAINT_NPRECORD);
BEGIN
WITH rec DO
BEGIN
REQ := [POSPOL,NEGPOL,OMEGAPOL];
                                                      ENV := [POSPOL,NEGPOL,OMEGAPOL];
                                                      SUPERDEIXIS := OMEGADEIXIS;
                                                      CLASS := OMEGATIMEADVCLASS;
                                                      DEIXIS := OMEGADEIXIS;
                                                      ASPECT := OMEGAASPECT;
                                                      RETRO := FALSE;
                                                      DEFINITE := DEF;
                                                      PERSON := 1;
                                                      NUMBER := SINGULAR;
                                                      CASES := [NOMINATIVE];
                                                      GENDERS := [OMEGAGENDER];
                                                      SEXES := [];
                                                      ACTSUBCS := [OTHERNOUN];
                                                      TEMPORAL := FALSE;
                                                      POSSGENI := FALSE;
                                                      ANIMATE := YESANIMATE;
                                                      HUMAN := OMEGAHUMAN;
                                                      ACTCOMAS := [COUNT];
                                                      THETANP := OMEGATHETANP;
                                                      NOUNPATTERNEFS := [];
                                                      POSSPRED := FALSE;
                                                      POSSNIETNP := FALSE;
                                                      MOOD := DECLXPMOOD;
                                                      GENERIC := OMEGAGENERIC;
                                                      POSSRFORM := FALSE;
                                                      SYNTQUANT := OMEGAQUANT;
                                                      NPHEAD := ZICHZELFNP;
                                                      SPECQ := YESSPEC;
                                                      COORD := NOCOORD;
                                                      END
END;

 FUNCTION LSAUXDOM_CpNPONJEZELF
                         (rec:LSDOMAINT_NPRECORD):BOOLEAN;
VAR Bool : BOOLEAN;
BEGIN 
  Bool := FALSE;
  WITH rec DO
  BEGIN
    IF (REQ = [POSPOL,NEGPOL,OMEGAPOL] ) THEN
IF (ENV = [POSPOL,NEGPOL,OMEGAPOL] ) THEN
IF (SUPERDEIXIS = OMEGADEIXIS ) THEN
IF (CLASS = OMEGATIMEADVCLASS ) THEN
IF (DEIXIS = OMEGADEIXIS ) THEN
IF (ASPECT = OMEGAASPECT ) THEN
IF (RETRO = FALSE ) THEN
IF (DEFINITE = DEF ) THEN
IF (PERSON = 2 ) THEN
IF (NUMBER = OMEGANUMBER ) THEN
IF (CASES = [NOMINATIVE] ) THEN
IF (GENDERS = [OMEGAGENDER] ) THEN
IF (SEXES = [] ) THEN
IF (ACTSUBCS = [OTHERNOUN] ) THEN
IF (TEMPORAL = FALSE ) THEN
IF (POSSGENI = FALSE ) THEN
IF (ANIMATE = YESANIMATE ) THEN
IF (HUMAN = OMEGAHUMAN ) THEN
IF (ACTCOMAS = [COUNT] ) THEN
IF (THETANP = OMEGATHETANP ) THEN
IF (NOUNPATTERNEFS = [] ) THEN
IF (POSSPRED = FALSE ) THEN
IF (POSSNIETNP = FALSE ) THEN
IF (MOOD = DECLXPMOOD ) THEN
IF (GENERIC = OMEGAGENERIC ) THEN
IF (POSSRFORM = FALSE ) THEN
IF (SYNTQUANT = OMEGAQUANT ) THEN
IF (NPHEAD = ZICHZELFNP ) THEN
IF (SPECQ = YESSPEC ) THEN
IF (COORD = NOCOORD ) THEN
      Bool:=TRUE;
  END;{with}
  LSAUXDOM_CpNPONJEZELF:=Bool;
END;{function}
 PROCEDURE LSAUXDOM_AsNPONJEZELF(VAR rec:LSDOMAINT_NPRECORD);
BEGIN
WITH rec DO
BEGIN
REQ := [POSPOL,NEGPOL,OMEGAPOL];
                                                      ENV := [POSPOL,NEGPOL,OMEGAPOL];
                                                      SUPERDEIXIS := OMEGADEIXIS;
                                                      CLASS := OMEGATIMEADVCLASS;
                                                      DEIXIS := OMEGADEIXIS;
                                                      ASPECT := OMEGAASPECT;
                                                      RETRO := FALSE;
                                                      DEFINITE := DEF;
                                                      PERSON := 2;
                                                      NUMBER := OMEGANUMBER;
                                                      CASES := [NOMINATIVE];
                                                      GENDERS := [OMEGAGENDER];
                                                      SEXES := [];
                                                      ACTSUBCS := [OTHERNOUN];
                                                      TEMPORAL := FALSE;
                                                      POSSGENI := FALSE;
                                                      ANIMATE := YESANIMATE;
                                                      HUMAN := OMEGAHUMAN;
                                                      ACTCOMAS := [COUNT];
                                                      THETANP := OMEGATHETANP;
                                                      NOUNPATTERNEFS := [];
                                                      POSSPRED := FALSE;
                                                      POSSNIETNP := FALSE;
                                                      MOOD := DECLXPMOOD;
                                                      GENERIC := OMEGAGENERIC;
                                                      POSSRFORM := FALSE;
                                                      SYNTQUANT := OMEGAQUANT;
                                                      NPHEAD := ZICHZELFNP;
                                                      SPECQ := YESSPEC;
                                                      COORD := NOCOORD;
                                                      END
END;

 FUNCTION LSAUXDOM_CpNPONZICHZELF
                         (rec:LSDOMAINT_NPRECORD):BOOLEAN;
VAR Bool : BOOLEAN;
BEGIN 
  Bool := FALSE;
  WITH rec DO
  BEGIN
    IF (REQ = [POSPOL,NEGPOL,OMEGAPOL] ) THEN
IF (ENV = [POSPOL,NEGPOL,OMEGAPOL] ) THEN
IF (SUPERDEIXIS = OMEGADEIXIS ) THEN
IF (CLASS = OMEGATIMEADVCLASS ) THEN
IF (DEIXIS = OMEGADEIXIS ) THEN
IF (ASPECT = OMEGAASPECT ) THEN
IF (RETRO = FALSE ) THEN
IF (DEFINITE = DEF ) THEN
IF (PERSON = 3 ) THEN
IF (NUMBER = OMEGANUMBER ) THEN
IF (CASES = [NOMINATIVE] ) THEN
IF (GENDERS = [OMEGAGENDER] ) THEN
IF (SEXES = [] ) THEN
IF (ACTSUBCS = [OTHERNOUN] ) THEN
IF (TEMPORAL = FALSE ) THEN
IF (POSSGENI = FALSE ) THEN
IF (ANIMATE = OMEGAANIMATE ) THEN
IF (HUMAN = OMEGAHUMAN ) THEN
IF (ACTCOMAS = [COUNT] ) THEN
IF (THETANP = OMEGATHETANP ) THEN
IF (NOUNPATTERNEFS = [] ) THEN
IF (POSSPRED = FALSE ) THEN
IF (POSSNIETNP = FALSE ) THEN
IF (MOOD = DECLXPMOOD ) THEN
IF (GENERIC = OMEGAGENERIC ) THEN
IF (POSSRFORM = FALSE ) THEN
IF (SYNTQUANT = OMEGAQUANT ) THEN
IF (NPHEAD = ZICHZELFNP ) THEN
IF (SPECQ = YESSPEC ) THEN
IF (COORD = NOCOORD ) THEN
      Bool:=TRUE;
  END;{with}
  LSAUXDOM_CpNPONZICHZELF:=Bool;
END;{function}
 PROCEDURE LSAUXDOM_AsNPONZICHZELF(VAR rec:LSDOMAINT_NPRECORD);
BEGIN
WITH rec DO
BEGIN
REQ := [POSPOL,NEGPOL,OMEGAPOL];
                                                      ENV := [POSPOL,NEGPOL,OMEGAPOL];
                                                      SUPERDEIXIS := OMEGADEIXIS;
                                                      CLASS := OMEGATIMEADVCLASS;
                                                      DEIXIS := OMEGADEIXIS;
                                                      ASPECT := OMEGAASPECT;
                                                      RETRO := FALSE;
                                                      DEFINITE := DEF;
                                                      PERSON := 3;
                                                      NUMBER := OMEGANUMBER;
                                                      CASES := [NOMINATIVE];
                                                      GENDERS := [OMEGAGENDER];
                                                      SEXES := [];
                                                      ACTSUBCS := [OTHERNOUN];
                                                      TEMPORAL := FALSE;
                                                      POSSGENI := FALSE;
                                                      ANIMATE := OMEGAANIMATE;
                                                      HUMAN := OMEGAHUMAN;
                                                      ACTCOMAS := [COUNT];
                                                      THETANP := OMEGATHETANP;
                                                      NOUNPATTERNEFS := [];
                                                      POSSPRED := FALSE;
                                                      POSSNIETNP := FALSE;
                                                      MOOD := DECLXPMOOD;
                                                      GENERIC := OMEGAGENERIC;
                                                      POSSRFORM := FALSE;
                                                      SYNTQUANT := OMEGAQUANT;
                                                      NPHEAD := ZICHZELFNP;
                                                      SPECQ := YESSPEC;
                                                      COORD := NOCOORD;
                                                      END
END;

 FUNCTION LSAUXDOM_CpNPONONSZELF
                         (rec:LSDOMAINT_NPRECORD):BOOLEAN;
VAR Bool : BOOLEAN;
BEGIN 
  Bool := FALSE;
  WITH rec DO
  BEGIN
    IF (REQ = [POSPOL,NEGPOL,OMEGAPOL] ) THEN
IF (ENV = [POSPOL,NEGPOL,OMEGAPOL] ) THEN
IF (SUPERDEIXIS = OMEGADEIXIS ) THEN
IF (CLASS = OMEGATIMEADVCLASS ) THEN
IF (DEIXIS = OMEGADEIXIS ) THEN
IF (ASPECT = OMEGAASPECT ) THEN
IF (RETRO = FALSE ) THEN
IF (DEFINITE = DEF ) THEN
IF (PERSON = 1 ) THEN
IF (NUMBER = PLURAL ) THEN
IF (CASES = [NOMINATIVE] ) THEN
IF (GENDERS = [OMEGAGENDER] ) THEN
IF (SEXES = [] ) THEN
IF (ACTSUBCS = [OTHERNOUN] ) THEN
IF (TEMPORAL = FALSE ) THEN
IF (POSSGENI = FALSE ) THEN
IF (ANIMATE = YESANIMATE ) THEN
IF (HUMAN = OMEGAHUMAN ) THEN
IF (ACTCOMAS = [COUNT] ) THEN
IF (THETANP = OMEGATHETANP ) THEN
IF (NOUNPATTERNEFS = [] ) THEN
IF (POSSPRED = FALSE ) THEN
IF (POSSNIETNP = FALSE ) THEN
IF (MOOD = DECLXPMOOD ) THEN
IF (GENERIC = OMEGAGENERIC ) THEN
IF (POSSRFORM = FALSE ) THEN
IF (SYNTQUANT = OMEGAQUANT ) THEN
IF (NPHEAD = ZICHZELFNP ) THEN
IF (SPECQ = YESSPEC ) THEN
IF (COORD = NOCOORD ) THEN
      Bool:=TRUE;
  END;{with}
  LSAUXDOM_CpNPONONSZELF:=Bool;
END;{function}
 PROCEDURE LSAUXDOM_AsNPONONSZELF(VAR rec:LSDOMAINT_NPRECORD);
BEGIN
WITH rec DO
BEGIN
REQ := [POSPOL,NEGPOL,OMEGAPOL];
                                                      ENV := [POSPOL,NEGPOL,OMEGAPOL];
                                                      SUPERDEIXIS := OMEGADEIXIS;
                                                      CLASS := OMEGATIMEADVCLASS;
                                                      DEIXIS := OMEGADEIXIS;
                                                      ASPECT := OMEGAASPECT;
                                                      RETRO := FALSE;
                                                      DEFINITE := DEF;
                                                      PERSON := 1;
                                                      NUMBER := PLURAL;
                                                      CASES := [NOMINATIVE];
                                                      GENDERS := [OMEGAGENDER];
                                                      SEXES := [];
                                                      ACTSUBCS := [OTHERNOUN];
                                                      TEMPORAL := FALSE;
                                                      POSSGENI := FALSE;
                                                      ANIMATE := YESANIMATE;
                                                      HUMAN := OMEGAHUMAN;
                                                      ACTCOMAS := [COUNT];
                                                      THETANP := OMEGATHETANP;
                                                      NOUNPATTERNEFS := [];
                                                      POSSPRED := FALSE;
                                                      POSSNIETNP := FALSE;
                                                      MOOD := DECLXPMOOD;
                                                      GENERIC := OMEGAGENERIC;
                                                      POSSRFORM := FALSE;
                                                      SYNTQUANT := OMEGAQUANT;
                                                      NPHEAD := ZICHZELFNP;
                                                      SPECQ := YESSPEC;
                                                      COORD := NOCOORD;
                                                      END
END;

 FUNCTION LSAUXDOM_CpNPONUZELF
                         (rec:LSDOMAINT_NPRECORD):BOOLEAN;
VAR Bool : BOOLEAN;
BEGIN 
  Bool := FALSE;
  WITH rec DO
  BEGIN
    IF (REQ = [POSPOL,NEGPOL,OMEGAPOL] ) THEN
IF (ENV = [POSPOL,NEGPOL,OMEGAPOL] ) THEN
IF (SUPERDEIXIS = OMEGADEIXIS ) THEN
IF (CLASS = OMEGATIMEADVCLASS ) THEN
IF (DEIXIS = OMEGADEIXIS ) THEN
IF (ASPECT = OMEGAASPECT ) THEN
IF (RETRO = FALSE ) THEN
IF (DEFINITE = DEF ) THEN
IF (PERSON = 4 ) THEN
IF (NUMBER = SINGULAR ) THEN
IF (CASES = [NOMINATIVE] ) THEN
IF (GENDERS = [OMEGAGENDER] ) THEN
IF (SEXES = [] ) THEN
IF (ACTSUBCS = [OTHERNOUN] ) THEN
IF (TEMPORAL = FALSE ) THEN
IF (POSSGENI = FALSE ) THEN
IF (ANIMATE = YESANIMATE ) THEN
IF (HUMAN = OMEGAHUMAN ) THEN
IF (ACTCOMAS = [COUNT] ) THEN
IF (THETANP = OMEGATHETANP ) THEN
IF (NOUNPATTERNEFS = [] ) THEN
IF (POSSPRED = FALSE ) THEN
IF (POSSNIETNP = FALSE ) THEN
IF (MOOD = DECLXPMOOD ) THEN
IF (GENERIC = OMEGAGENERIC ) THEN
IF (POSSRFORM = FALSE ) THEN
IF (SYNTQUANT = OMEGAQUANT ) THEN
IF (NPHEAD = ZICHZELFNP ) THEN
IF (SPECQ = YESSPEC ) THEN
IF (COORD = NOCOORD ) THEN
      Bool:=TRUE;
  END;{with}
  LSAUXDOM_CpNPONUZELF:=Bool;
END;{function}
 PROCEDURE LSAUXDOM_AsNPONUZELF(VAR rec:LSDOMAINT_NPRECORD);
BEGIN
WITH rec DO
BEGIN
REQ := [POSPOL,NEGPOL,OMEGAPOL];
                                                      ENV := [POSPOL,NEGPOL,OMEGAPOL];
                                                      SUPERDEIXIS := OMEGADEIXIS;
                                                      CLASS := OMEGATIMEADVCLASS;
                                                      DEIXIS := OMEGADEIXIS;
                                                      ASPECT := OMEGAASPECT;
                                                      RETRO := FALSE;
                                                      DEFINITE := DEF;
                                                      PERSON := 4;
                                                      NUMBER := SINGULAR;
                                                      CASES := [NOMINATIVE];
                                                      GENDERS := [OMEGAGENDER];
                                                      SEXES := [];
                                                      ACTSUBCS := [OTHERNOUN];
                                                      TEMPORAL := FALSE;
                                                      POSSGENI := FALSE;
                                                      ANIMATE := YESANIMATE;
                                                      HUMAN := OMEGAHUMAN;
                                                      ACTCOMAS := [COUNT];
                                                      THETANP := OMEGATHETANP;
                                                      NOUNPATTERNEFS := [];
                                                      POSSPRED := FALSE;
                                                      POSSNIETNP := FALSE;
                                                      MOOD := DECLXPMOOD;
                                                      GENERIC := OMEGAGENERIC;
                                                      POSSRFORM := FALSE;
                                                      SYNTQUANT := OMEGAQUANT;
                                                      NPHEAD := ZICHZELFNP;
                                                      SPECQ := YESSPEC;
                                                      COORD := NOCOORD;
                                                      END
END;

 FUNCTION LSAUXDOM_CpNPONZEGENBPRSPR
                         (rec:LSDOMAINT_NPRECORD):BOOLEAN;
VAR Bool : BOOLEAN;
BEGIN 
  Bool := FALSE;
  WITH rec DO
  BEGIN
    IF (REQ = [POSPOL,NEGPOL,OMEGAPOL] ) THEN
IF (ENV = [POSPOL,NEGPOL,OMEGAPOL] ) THEN
IF (SUPERDEIXIS = OMEGADEIXIS ) THEN
IF (CLASS = OMEGATIMEADVCLASS ) THEN
IF (DEIXIS = OMEGADEIXIS ) THEN
IF (ASPECT = OMEGAASPECT ) THEN
IF (RETRO = FALSE ) THEN
IF (DEFINITE = DEF ) THEN
IF (PERSON = 3 ) THEN
IF (NUMBER = PLURAL ) THEN
IF (CASES = [NOMINATIVE] ) THEN
IF (GENDERS = [OMEGAGENDER] ) THEN
IF (SEXES = [] ) THEN
IF (ACTSUBCS = [OTHERNOUN] ) THEN
IF (TEMPORAL = FALSE ) THEN
IF (POSSGENI = FALSE ) THEN
IF (ANIMATE = YESANIMATE ) THEN
IF (HUMAN = OMEGAHUMAN ) THEN
IF (ACTCOMAS = [COUNT] ) THEN
IF (THETANP = OMEGATHETANP ) THEN
IF (NOUNPATTERNEFS = [] ) THEN
IF (POSSPRED = TRUE ) THEN
IF (POSSNIETNP = FALSE ) THEN
IF (MOOD = DECLXPMOOD ) THEN
IF (GENERIC = OMEGAGENERIC ) THEN
IF (POSSRFORM = FALSE ) THEN
IF (SYNTQUANT = OMEGAQUANT ) THEN
IF (NPHEAD = ZEGENNP ) THEN
IF (SPECQ = YESSPEC ) THEN
IF (COORD = NOCOORD ) THEN
      Bool:=TRUE;
  END;{with}
  LSAUXDOM_CpNPONZEGENBPRSPR:=Bool;
END;{function}
 PROCEDURE LSAUXDOM_AsNPONZEGENBPRSPR(VAR rec:LSDOMAINT_NPRECORD);
BEGIN
WITH rec DO
BEGIN
REQ := [POSPOL,NEGPOL,OMEGAPOL];
                                                      ENV := [POSPOL,NEGPOL,OMEGAPOL];
                                                      SUPERDEIXIS := OMEGADEIXIS;
                                                      CLASS := OMEGATIMEADVCLASS;
                                                      DEIXIS := OMEGADEIXIS;
                                                      ASPECT := OMEGAASPECT;
                                                      RETRO := FALSE;
                                                      DEFINITE := DEF;
                                                      PERSON := 3;
                                                      NUMBER := PLURAL;
                                                      CASES := [NOMINATIVE];
                                                      GENDERS := [OMEGAGENDER];
                                                      SEXES := [];
                                                      ACTSUBCS := [OTHERNOUN];
                                                      TEMPORAL := FALSE;
                                                      POSSGENI := FALSE;
                                                      ANIMATE := YESANIMATE;
                                                      HUMAN := OMEGAHUMAN;
                                                      ACTCOMAS := [COUNT];
                                                      THETANP := OMEGATHETANP;
                                                      NOUNPATTERNEFS := [];
                                                      POSSPRED := TRUE;
                                                      POSSNIETNP := FALSE;
                                                      MOOD := DECLXPMOOD;
                                                      GENERIC := OMEGAGENERIC;
                                                      POSSRFORM := FALSE;
                                                      SYNTQUANT := OMEGAQUANT;
                                                      NPHEAD := ZEGENNP;
                                                      SPECQ := YESSPEC;
                                                      COORD := NOCOORD;
                                                      END
END;

 FUNCTION LSAUXDOM_CpNPONHETBPRSPR
                         (rec:LSDOMAINT_NPRECORD):BOOLEAN;
VAR Bool : BOOLEAN;
BEGIN 
  Bool := FALSE;
  WITH rec DO
  BEGIN
    IF (REQ = [POSPOL,NEGPOL,OMEGAPOL] ) THEN
IF (ENV = [POSPOL,NEGPOL,OMEGAPOL] ) THEN
IF (SUPERDEIXIS = OMEGADEIXIS ) THEN
IF (CLASS = OMEGATIMEADVCLASS ) THEN
IF (DEIXIS = OMEGADEIXIS ) THEN
IF (ASPECT = OMEGAASPECT ) THEN
IF (RETRO = FALSE ) THEN
IF (DEFINITE = DEF ) THEN
IF (PERSON = 3 ) THEN
IF (NUMBER = SINGULAR ) THEN
IF (CASES = [NOMINATIVE] ) THEN
IF (GENDERS = [NEUTGENDER] ) THEN
IF (SEXES = [] ) THEN
IF (ACTSUBCS = [OTHERNOUN] ) THEN
IF (TEMPORAL = FALSE ) THEN
IF (POSSGENI = FALSE ) THEN
IF (ANIMATE = OMEGAANIMATE ) THEN
IF (HUMAN = OMEGAHUMAN ) THEN
IF (ACTCOMAS = [COUNT] ) THEN
IF (THETANP = OMEGATHETANP ) THEN
IF (NOUNPATTERNEFS = [] ) THEN
IF (POSSPRED = TRUE ) THEN
IF (POSSNIETNP = FALSE ) THEN
IF (MOOD = DECLXPMOOD ) THEN
IF (GENERIC = OMEGAGENERIC ) THEN
IF (POSSRFORM = TRUE ) THEN
IF (SYNTQUANT = OMEGAQUANT ) THEN
IF (NPHEAD = HETNP ) THEN
IF (SPECQ = YESSPEC ) THEN
IF (COORD = NOCOORD ) THEN
      Bool:=TRUE;
  END;{with}
  LSAUXDOM_CpNPONHETBPRSPR:=Bool;
END;{function}
 PROCEDURE LSAUXDOM_AsNPONHETBPRSPR(VAR rec:LSDOMAINT_NPRECORD);
BEGIN
WITH rec DO
BEGIN
REQ := [POSPOL,NEGPOL,OMEGAPOL];
                                                      ENV := [POSPOL,NEGPOL,OMEGAPOL];
                                                      SUPERDEIXIS := OMEGADEIXIS;
                                                      CLASS := OMEGATIMEADVCLASS;
                                                      DEIXIS := OMEGADEIXIS;
                                                      ASPECT := OMEGAASPECT;
                                                      RETRO := FALSE;
                                                      DEFINITE := DEF;
                                                      PERSON := 3;
                                                      NUMBER := SINGULAR;
                                                      CASES := [NOMINATIVE];
                                                      GENDERS := [NEUTGENDER];
                                                      SEXES := [];
                                                      ACTSUBCS := [OTHERNOUN];
                                                      TEMPORAL := FALSE;
                                                      POSSGENI := FALSE;
                                                      ANIMATE := OMEGAANIMATE;
                                                      HUMAN := OMEGAHUMAN;
                                                      ACTCOMAS := [COUNT];
                                                      THETANP := OMEGATHETANP;
                                                      NOUNPATTERNEFS := [];
                                                      POSSPRED := TRUE;
                                                      POSSNIETNP := FALSE;
                                                      MOOD := DECLXPMOOD;
                                                      GENERIC := OMEGAGENERIC;
                                                      POSSRFORM := TRUE;
                                                      SYNTQUANT := OMEGAQUANT;
                                                      NPHEAD := HETNP;
                                                      SPECQ := YESSPEC;
                                                      COORD := NOCOORD;
                                                      END
END;

 FUNCTION LSAUXDOM_CpNPONIKBGPR
                         (rec:LSDOMAINT_NPRECORD):BOOLEAN;
VAR Bool : BOOLEAN;
BEGIN 
  Bool := FALSE;
  WITH rec DO
  BEGIN
    IF (REQ = [POSPOL,NEGPOL,OMEGAPOL] ) THEN
IF (ENV = [POSPOL,NEGPOL,OMEGAPOL] ) THEN
IF (SUPERDEIXIS = OMEGADEIXIS ) THEN
IF (CLASS = OMEGATIMEADVCLASS ) THEN
IF (DEIXIS = OMEGADEIXIS ) THEN
IF (ASPECT = OMEGAASPECT ) THEN
IF (RETRO = FALSE ) THEN
IF (DEFINITE = DEF ) THEN
IF (PERSON = 1 ) THEN
IF (NUMBER = SINGULAR ) THEN
IF (CASES = [NOMINATIVE] ) THEN
IF (GENDERS = [OMEGAGENDER] ) THEN
IF (SEXES = [] ) THEN
IF (ACTSUBCS = [OTHERNOUN] ) THEN
IF (TEMPORAL = FALSE ) THEN
IF (POSSGENI = FALSE ) THEN
IF (ANIMATE = YESANIMATE ) THEN
IF (HUMAN = OMEGAHUMAN ) THEN
IF (ACTCOMAS = [COUNT] ) THEN
IF (THETANP = OMEGATHETANP ) THEN
IF (NOUNPATTERNEFS = [] ) THEN
IF (POSSPRED = TRUE ) THEN
IF (POSSNIETNP = FALSE ) THEN
IF (MOOD = DECLXPMOOD ) THEN
IF (GENERIC = OMEGAGENERIC ) THEN
IF (POSSRFORM = FALSE ) THEN
IF (SYNTQUANT = OMEGAQUANT ) THEN
IF (NPHEAD = PERSPRONP ) THEN
IF (SPECQ = YESSPEC ) THEN
IF (COORD = NOCOORD ) THEN
      Bool:=TRUE;
  END;{with}
  LSAUXDOM_CpNPONIKBGPR:=Bool;
END;{function}
 PROCEDURE LSAUXDOM_AsNPONIKBGPR(VAR rec:LSDOMAINT_NPRECORD);
BEGIN
WITH rec DO
BEGIN
REQ := [POSPOL,NEGPOL,OMEGAPOL];
                                                      ENV := [POSPOL,NEGPOL,OMEGAPOL];
                                                      SUPERDEIXIS := OMEGADEIXIS;
                                                      CLASS := OMEGATIMEADVCLASS;
                                                      DEIXIS := OMEGADEIXIS;
                                                      ASPECT := OMEGAASPECT;
                                                      RETRO := FALSE;
                                                      DEFINITE := DEF;
                                                      PERSON := 1;
                                                      NUMBER := SINGULAR;
                                                      CASES := [NOMINATIVE];
                                                      GENDERS := [OMEGAGENDER];
                                                      SEXES := [];
                                                      ACTSUBCS := [OTHERNOUN];
                                                      TEMPORAL := FALSE;
                                                      POSSGENI := FALSE;
                                                      ANIMATE := YESANIMATE;
                                                      HUMAN := OMEGAHUMAN;
                                                      ACTCOMAS := [COUNT];
                                                      THETANP := OMEGATHETANP;
                                                      NOUNPATTERNEFS := [];
                                                      POSSPRED := TRUE;
                                                      POSSNIETNP := FALSE;
                                                      MOOD := DECLXPMOOD;
                                                      GENERIC := OMEGAGENERIC;
                                                      POSSRFORM := FALSE;
                                                      SYNTQUANT := OMEGAQUANT;
                                                      NPHEAD := PERSPRONP;
                                                      SPECQ := YESSPEC;
                                                      COORD := NOCOORD;
                                                      END
END;

 FUNCTION LSAUXDOM_CpNPONJIJBGPR
                         (rec:LSDOMAINT_NPRECORD):BOOLEAN;
VAR Bool : BOOLEAN;
BEGIN 
  Bool := FALSE;
  WITH rec DO
  BEGIN
    IF (REQ = [POSPOL,NEGPOL,OMEGAPOL] ) THEN
IF (ENV = [POSPOL,NEGPOL,OMEGAPOL] ) THEN
IF (SUPERDEIXIS = OMEGADEIXIS ) THEN
IF (CLASS = OMEGATIMEADVCLASS ) THEN
IF (DEIXIS = OMEGADEIXIS ) THEN
IF (ASPECT = OMEGAASPECT ) THEN
IF (RETRO = FALSE ) THEN
IF (DEFINITE = DEF ) THEN
IF (PERSON = 2 ) THEN
IF (NUMBER = SINGULAR ) THEN
IF (CASES = [NOMINATIVE] ) THEN
IF (GENDERS = [OMEGAGENDER] ) THEN
IF (SEXES = [] ) THEN
IF (ACTSUBCS = [OTHERNOUN] ) THEN
IF (TEMPORAL = FALSE ) THEN
IF (POSSGENI = FALSE ) THEN
IF (ANIMATE = YESANIMATE ) THEN
IF (HUMAN = OMEGAHUMAN ) THEN
IF (ACTCOMAS = [COUNT] ) THEN
IF (THETANP = OMEGATHETANP ) THEN
IF (NOUNPATTERNEFS = [] ) THEN
IF (POSSPRED = TRUE ) THEN
IF (POSSNIETNP = FALSE ) THEN
IF (MOOD = DECLXPMOOD ) THEN
IF (GENERIC = OMEGAGENERIC ) THEN
IF (POSSRFORM = FALSE ) THEN
IF (SYNTQUANT = OMEGAQUANT ) THEN
IF (NPHEAD = PERSPRONP ) THEN
IF (SPECQ = YESSPEC ) THEN
IF (COORD = NOCOORD ) THEN
      Bool:=TRUE;
  END;{with}
  LSAUXDOM_CpNPONJIJBGPR:=Bool;
END;{function}
 PROCEDURE LSAUXDOM_AsNPONJIJBGPR(VAR rec:LSDOMAINT_NPRECORD);
BEGIN
WITH rec DO
BEGIN
REQ := [POSPOL,NEGPOL,OMEGAPOL];
                                                      ENV := [POSPOL,NEGPOL,OMEGAPOL];
                                                      SUPERDEIXIS := OMEGADEIXIS;
                                                      CLASS := OMEGATIMEADVCLASS;
                                                      DEIXIS := OMEGADEIXIS;
                                                      ASPECT := OMEGAASPECT;
                                                      RETRO := FALSE;
                                                      DEFINITE := DEF;
                                                      PERSON := 2;
                                                      NUMBER := SINGULAR;
                                                      CASES := [NOMINATIVE];
                                                      GENDERS := [OMEGAGENDER];
                                                      SEXES := [];
                                                      ACTSUBCS := [OTHERNOUN];
                                                      TEMPORAL := FALSE;
                                                      POSSGENI := FALSE;
                                                      ANIMATE := YESANIMATE;
                                                      HUMAN := OMEGAHUMAN;
                                                      ACTCOMAS := [COUNT];
                                                      THETANP := OMEGATHETANP;
                                                      NOUNPATTERNEFS := [];
                                                      POSSPRED := TRUE;
                                                      POSSNIETNP := FALSE;
                                                      MOOD := DECLXPMOOD;
                                                      GENERIC := OMEGAGENERIC;
                                                      POSSRFORM := FALSE;
                                                      SYNTQUANT := OMEGAQUANT;
                                                      NPHEAD := PERSPRONP;
                                                      SPECQ := YESSPEC;
                                                      COORD := NOCOORD;
                                                      END
END;

 FUNCTION LSAUXDOM_CpNPONHIJBGPR
                         (rec:LSDOMAINT_NPRECORD):BOOLEAN;
VAR Bool : BOOLEAN;
BEGIN 
  Bool := FALSE;
  WITH rec DO
  BEGIN
    IF (REQ = [POSPOL,NEGPOL,OMEGAPOL] ) THEN
IF (ENV = [POSPOL,NEGPOL,OMEGAPOL] ) THEN
IF (SUPERDEIXIS = OMEGADEIXIS ) THEN
IF (CLASS = OMEGATIMEADVCLASS ) THEN
IF (DEIXIS = OMEGADEIXIS ) THEN
IF (ASPECT = OMEGAASPECT ) THEN
IF (RETRO = FALSE ) THEN
IF (DEFINITE = DEF ) THEN
IF (PERSON = 3 ) THEN
IF (NUMBER = SINGULAR ) THEN
IF (CASES = [NOMINATIVE] ) THEN
IF (GENDERS = [MASCGENDER] ) THEN
IF (SEXES = [] ) THEN
IF (ACTSUBCS = [OTHERNOUN] ) THEN
IF (TEMPORAL = FALSE ) THEN
IF (POSSGENI = FALSE ) THEN
IF (ANIMATE = YESANIMATE ) THEN
IF (HUMAN = OMEGAHUMAN ) THEN
IF (ACTCOMAS = [COUNT] ) THEN
IF (THETANP = OMEGATHETANP ) THEN
IF (NOUNPATTERNEFS = [] ) THEN
IF (POSSPRED = TRUE ) THEN
IF (POSSNIETNP = FALSE ) THEN
IF (MOOD = DECLXPMOOD ) THEN
IF (GENERIC = OMEGAGENERIC ) THEN
IF (POSSRFORM = FALSE ) THEN
IF (SYNTQUANT = OMEGAQUANT ) THEN
IF (NPHEAD = PERSPRONP ) THEN
IF (SPECQ = YESSPEC ) THEN
IF (COORD = NOCOORD ) THEN
      Bool:=TRUE;
  END;{with}
  LSAUXDOM_CpNPONHIJBGPR:=Bool;
END;{function}
 PROCEDURE LSAUXDOM_AsNPONHIJBGPR(VAR rec:LSDOMAINT_NPRECORD);
BEGIN
WITH rec DO
BEGIN
REQ := [POSPOL,NEGPOL,OMEGAPOL];
                                                      ENV := [POSPOL,NEGPOL,OMEGAPOL];
                                                      SUPERDEIXIS := OMEGADEIXIS;
                                                      CLASS := OMEGATIMEADVCLASS;
                                                      DEIXIS := OMEGADEIXIS;
                                                      ASPECT := OMEGAASPECT;
                                                      RETRO := FALSE;
                                                      DEFINITE := DEF;
                                                      PERSON := 3;
                                                      NUMBER := SINGULAR;
                                                      CASES := [NOMINATIVE];
                                                      GENDERS := [MASCGENDER];
                                                      SEXES := [];
                                                      ACTSUBCS := [OTHERNOUN];
                                                      TEMPORAL := FALSE;
                                                      POSSGENI := FALSE;
                                                      ANIMATE := YESANIMATE;
                                                      HUMAN := OMEGAHUMAN;
                                                      ACTCOMAS := [COUNT];
                                                      THETANP := OMEGATHETANP;
                                                      NOUNPATTERNEFS := [];
                                                      POSSPRED := TRUE;
                                                      POSSNIETNP := FALSE;
                                                      MOOD := DECLXPMOOD;
                                                      GENERIC := OMEGAGENERIC;
                                                      POSSRFORM := FALSE;
                                                      SYNTQUANT := OMEGAQUANT;
                                                      NPHEAD := PERSPRONP;
                                                      SPECQ := YESSPEC;
                                                      COORD := NOCOORD;
                                                      END
END;

 FUNCTION LSAUXDOM_CpNPONZIJSGBGPR
                         (rec:LSDOMAINT_NPRECORD):BOOLEAN;
VAR Bool : BOOLEAN;
BEGIN 
  Bool := FALSE;
  WITH rec DO
  BEGIN
    IF (REQ = [POSPOL,NEGPOL,OMEGAPOL] ) THEN
IF (ENV = [POSPOL,NEGPOL,OMEGAPOL] ) THEN
IF (SUPERDEIXIS = OMEGADEIXIS ) THEN
IF (CLASS = OMEGATIMEADVCLASS ) THEN
IF (DEIXIS = OMEGADEIXIS ) THEN
IF (ASPECT = OMEGAASPECT ) THEN
IF (RETRO = FALSE ) THEN
IF (DEFINITE = DEF ) THEN
IF (PERSON = 3 ) THEN
IF (NUMBER = SINGULAR ) THEN
IF (CASES = [NOMINATIVE] ) THEN
IF (GENDERS = [FEMGENDER] ) THEN
IF (SEXES = [] ) THEN
IF (ACTSUBCS = [OTHERNOUN] ) THEN
IF (TEMPORAL = FALSE ) THEN
IF (POSSGENI = FALSE ) THEN
IF (ANIMATE = YESANIMATE ) THEN
IF (HUMAN = OMEGAHUMAN ) THEN
IF (ACTCOMAS = [COUNT] ) THEN
IF (THETANP = OMEGATHETANP ) THEN
IF (NOUNPATTERNEFS = [] ) THEN
IF (POSSPRED = TRUE ) THEN
IF (POSSNIETNP = FALSE ) THEN
IF (MOOD = DECLXPMOOD ) THEN
IF (GENERIC = OMEGAGENERIC ) THEN
IF (POSSRFORM = FALSE ) THEN
IF (SYNTQUANT = OMEGAQUANT ) THEN
IF (NPHEAD = PERSPRONP ) THEN
IF (SPECQ = YESSPEC ) THEN
IF (COORD = NOCOORD ) THEN
      Bool:=TRUE;
  END;{with}
  LSAUXDOM_CpNPONZIJSGBGPR:=Bool;
END;{function}
 PROCEDURE LSAUXDOM_AsNPONZIJSGBGPR(VAR rec:LSDOMAINT_NPRECORD);
BEGIN
WITH rec DO
BEGIN
REQ := [POSPOL,NEGPOL,OMEGAPOL];
                                                      ENV := [POSPOL,NEGPOL,OMEGAPOL];
                                                      SUPERDEIXIS := OMEGADEIXIS;
                                                      CLASS := OMEGATIMEADVCLASS;
                                                      DEIXIS := OMEGADEIXIS;
                                                      ASPECT := OMEGAASPECT;
                                                      RETRO := FALSE;
                                                      DEFINITE := DEF;
                                                      PERSON := 3;
                                                      NUMBER := SINGULAR;
                                                      CASES := [NOMINATIVE];
                                                      GENDERS := [FEMGENDER];
                                                      SEXES := [];
                                                      ACTSUBCS := [OTHERNOUN];
                                                      TEMPORAL := FALSE;
                                                      POSSGENI := FALSE;
                                                      ANIMATE := YESANIMATE;
                                                      HUMAN := OMEGAHUMAN;
                                                      ACTCOMAS := [COUNT];
                                                      THETANP := OMEGATHETANP;
                                                      NOUNPATTERNEFS := [];
                                                      POSSPRED := TRUE;
                                                      POSSNIETNP := FALSE;
                                                      MOOD := DECLXPMOOD;
                                                      GENERIC := OMEGAGENERIC;
                                                      POSSRFORM := FALSE;
                                                      SYNTQUANT := OMEGAQUANT;
                                                      NPHEAD := PERSPRONP;
                                                      SPECQ := YESSPEC;
                                                      COORD := NOCOORD;
                                                      END
END;

 FUNCTION LSAUXDOM_CpNPONWIJBGPR
                         (rec:LSDOMAINT_NPRECORD):BOOLEAN;
VAR Bool : BOOLEAN;
BEGIN 
  Bool := FALSE;
  WITH rec DO
  BEGIN
    IF (REQ = [POSPOL,NEGPOL,OMEGAPOL] ) THEN
IF (ENV = [POSPOL,NEGPOL,OMEGAPOL] ) THEN
IF (SUPERDEIXIS = OMEGADEIXIS ) THEN
IF (CLASS = OMEGATIMEADVCLASS ) THEN
IF (DEIXIS = OMEGADEIXIS ) THEN
IF (ASPECT = OMEGAASPECT ) THEN
IF (RETRO = FALSE ) THEN
IF (DEFINITE = DEF ) THEN
IF (PERSON = 1 ) THEN
IF (NUMBER = PLURAL ) THEN
IF (CASES = [NOMINATIVE] ) THEN
IF (GENDERS = [OMEGAGENDER] ) THEN
IF (SEXES = [] ) THEN
IF (ACTSUBCS = [OTHERNOUN] ) THEN
IF (TEMPORAL = FALSE ) THEN
IF (POSSGENI = FALSE ) THEN
IF (ANIMATE = YESANIMATE ) THEN
IF (HUMAN = OMEGAHUMAN ) THEN
IF (ACTCOMAS = [COUNT] ) THEN
IF (THETANP = OMEGATHETANP ) THEN
IF (NOUNPATTERNEFS = [] ) THEN
IF (POSSPRED = TRUE ) THEN
IF (POSSNIETNP = FALSE ) THEN
IF (MOOD = DECLXPMOOD ) THEN
IF (GENERIC = OMEGAGENERIC ) THEN
IF (POSSRFORM = FALSE ) THEN
IF (SYNTQUANT = OMEGAQUANT ) THEN
IF (NPHEAD = PERSPRONP ) THEN
IF (SPECQ = YESSPEC ) THEN
IF (COORD = NOCOORD ) THEN
      Bool:=TRUE;
  END;{with}
  LSAUXDOM_CpNPONWIJBGPR:=Bool;
END;{function}
 PROCEDURE LSAUXDOM_AsNPONWIJBGPR(VAR rec:LSDOMAINT_NPRECORD);
BEGIN
WITH rec DO
BEGIN
REQ := [POSPOL,NEGPOL,OMEGAPOL];
                                                      ENV := [POSPOL,NEGPOL,OMEGAPOL];
                                                      SUPERDEIXIS := OMEGADEIXIS;
                                                      CLASS := OMEGATIMEADVCLASS;
                                                      DEIXIS := OMEGADEIXIS;
                                                      ASPECT := OMEGAASPECT;
                                                      RETRO := FALSE;
                                                      DEFINITE := DEF;
                                                      PERSON := 1;
                                                      NUMBER := PLURAL;
                                                      CASES := [NOMINATIVE];
                                                      GENDERS := [OMEGAGENDER];
                                                      SEXES := [];
                                                      ACTSUBCS := [OTHERNOUN];
                                                      TEMPORAL := FALSE;
                                                      POSSGENI := FALSE;
                                                      ANIMATE := YESANIMATE;
                                                      HUMAN := OMEGAHUMAN;
                                                      ACTCOMAS := [COUNT];
                                                      THETANP := OMEGATHETANP;
                                                      NOUNPATTERNEFS := [];
                                                      POSSPRED := TRUE;
                                                      POSSNIETNP := FALSE;
                                                      MOOD := DECLXPMOOD;
                                                      GENERIC := OMEGAGENERIC;
                                                      POSSRFORM := FALSE;
                                                      SYNTQUANT := OMEGAQUANT;
                                                      NPHEAD := PERSPRONP;
                                                      SPECQ := YESSPEC;
                                                      COORD := NOCOORD;
                                                      END
END;

 FUNCTION LSAUXDOM_CpNPONJULLIEBGPR
                         (rec:LSDOMAINT_NPRECORD):BOOLEAN;
VAR Bool : BOOLEAN;
BEGIN 
  Bool := FALSE;
  WITH rec DO
  BEGIN
    IF (REQ = [POSPOL,NEGPOL,OMEGAPOL] ) THEN
IF (ENV = [POSPOL,NEGPOL,OMEGAPOL] ) THEN
IF (SUPERDEIXIS = OMEGADEIXIS ) THEN
IF (CLASS = OMEGATIMEADVCLASS ) THEN
IF (DEIXIS = OMEGADEIXIS ) THEN
IF (ASPECT = OMEGAASPECT ) THEN
IF (RETRO = FALSE ) THEN
IF (DEFINITE = DEF ) THEN
IF (PERSON = 2 ) THEN
IF (NUMBER = PLURAL ) THEN
IF (CASES = [NOMINATIVE] ) THEN
IF (GENDERS = [OMEGAGENDER] ) THEN
IF (SEXES = [] ) THEN
IF (ACTSUBCS = [OTHERNOUN] ) THEN
IF (TEMPORAL = FALSE ) THEN
IF (POSSGENI = FALSE ) THEN
IF (ANIMATE = YESANIMATE ) THEN
IF (HUMAN = OMEGAHUMAN ) THEN
IF (ACTCOMAS = [COUNT] ) THEN
IF (THETANP = OMEGATHETANP ) THEN
IF (NOUNPATTERNEFS = [] ) THEN
IF (POSSPRED = TRUE ) THEN
IF (POSSNIETNP = FALSE ) THEN
IF (MOOD = DECLXPMOOD ) THEN
IF (GENERIC = OMEGAGENERIC ) THEN
IF (POSSRFORM = FALSE ) THEN
IF (SYNTQUANT = OMEGAQUANT ) THEN
IF (NPHEAD = PERSPRONP ) THEN
IF (SPECQ = YESSPEC ) THEN
IF (COORD = NOCOORD ) THEN
      Bool:=TRUE;
  END;{with}
  LSAUXDOM_CpNPONJULLIEBGPR:=Bool;
END;{function}
 PROCEDURE LSAUXDOM_AsNPONJULLIEBGPR(VAR rec:LSDOMAINT_NPRECORD);
BEGIN
WITH rec DO
BEGIN
REQ := [POSPOL,NEGPOL,OMEGAPOL];
                                                      ENV := [POSPOL,NEGPOL,OMEGAPOL];
                                                      SUPERDEIXIS := OMEGADEIXIS;
                                                      CLASS := OMEGATIMEADVCLASS;
                                                      DEIXIS := OMEGADEIXIS;
                                                      ASPECT := OMEGAASPECT;
                                                      RETRO := FALSE;
                                                      DEFINITE := DEF;
                                                      PERSON := 2;
                                                      NUMBER := PLURAL;
                                                      CASES := [NOMINATIVE];
                                                      GENDERS := [OMEGAGENDER];
                                                      SEXES := [];
                                                      ACTSUBCS := [OTHERNOUN];
                                                      TEMPORAL := FALSE;
                                                      POSSGENI := FALSE;
                                                      ANIMATE := YESANIMATE;
                                                      HUMAN := OMEGAHUMAN;
                                                      ACTCOMAS := [COUNT];
                                                      THETANP := OMEGATHETANP;
                                                      NOUNPATTERNEFS := [];
                                                      POSSPRED := TRUE;
                                                      POSSNIETNP := FALSE;
                                                      MOOD := DECLXPMOOD;
                                                      GENERIC := OMEGAGENERIC;
                                                      POSSRFORM := FALSE;
                                                      SYNTQUANT := OMEGAQUANT;
                                                      NPHEAD := PERSPRONP;
                                                      SPECQ := YESSPEC;
                                                      COORD := NOCOORD;
                                                      END
END;

 FUNCTION LSAUXDOM_CpNPONZIJPLBGPR
                         (rec:LSDOMAINT_NPRECORD):BOOLEAN;
VAR Bool : BOOLEAN;
BEGIN 
  Bool := FALSE;
  WITH rec DO
  BEGIN
    IF (REQ = [POSPOL,NEGPOL,OMEGAPOL] ) THEN
IF (ENV = [POSPOL,NEGPOL,OMEGAPOL] ) THEN
IF (SUPERDEIXIS = OMEGADEIXIS ) THEN
IF (CLASS = OMEGATIMEADVCLASS ) THEN
IF (DEIXIS = OMEGADEIXIS ) THEN
IF (ASPECT = OMEGAASPECT ) THEN
IF (RETRO = FALSE ) THEN
IF (DEFINITE = DEF ) THEN
IF (PERSON = 3 ) THEN
IF (NUMBER = PLURAL ) THEN
IF (CASES = [NOMINATIVE] ) THEN
IF (GENDERS = [OMEGAGENDER] ) THEN
IF (SEXES = [] ) THEN
IF (ACTSUBCS = [OTHERNOUN] ) THEN
IF (TEMPORAL = FALSE ) THEN
IF (POSSGENI = FALSE ) THEN
IF (ANIMATE = YESANIMATE ) THEN
IF (HUMAN = OMEGAHUMAN ) THEN
IF (ACTCOMAS = [COUNT] ) THEN
IF (THETANP = OMEGATHETANP ) THEN
IF (NOUNPATTERNEFS = [] ) THEN
IF (POSSPRED = TRUE ) THEN
IF (POSSNIETNP = FALSE ) THEN
IF (MOOD = DECLXPMOOD ) THEN
IF (GENERIC = OMEGAGENERIC ) THEN
IF (POSSRFORM = FALSE ) THEN
IF (SYNTQUANT = OMEGAQUANT ) THEN
IF (NPHEAD = PERSPRONP ) THEN
IF (SPECQ = YESSPEC ) THEN
IF (COORD = NOCOORD ) THEN
      Bool:=TRUE;
  END;{with}
  LSAUXDOM_CpNPONZIJPLBGPR:=Bool;
END;{function}
 PROCEDURE LSAUXDOM_AsNPONZIJPLBGPR(VAR rec:LSDOMAINT_NPRECORD);
BEGIN
WITH rec DO
BEGIN
REQ := [POSPOL,NEGPOL,OMEGAPOL];
                                                      ENV := [POSPOL,NEGPOL,OMEGAPOL];
                                                      SUPERDEIXIS := OMEGADEIXIS;
                                                      CLASS := OMEGATIMEADVCLASS;
                                                      DEIXIS := OMEGADEIXIS;
                                                      ASPECT := OMEGAASPECT;
                                                      RETRO := FALSE;
                                                      DEFINITE := DEF;
                                                      PERSON := 3;
                                                      NUMBER := PLURAL;
                                                      CASES := [NOMINATIVE];
                                                      GENDERS := [OMEGAGENDER];
                                                      SEXES := [];
                                                      ACTSUBCS := [OTHERNOUN];
                                                      TEMPORAL := FALSE;
                                                      POSSGENI := FALSE;
                                                      ANIMATE := YESANIMATE;
                                                      HUMAN := OMEGAHUMAN;
                                                      ACTCOMAS := [COUNT];
                                                      THETANP := OMEGATHETANP;
                                                      NOUNPATTERNEFS := [];
                                                      POSSPRED := TRUE;
                                                      POSSNIETNP := FALSE;
                                                      MOOD := DECLXPMOOD;
                                                      GENERIC := OMEGAGENERIC;
                                                      POSSRFORM := FALSE;
                                                      SYNTQUANT := OMEGAQUANT;
                                                      NPHEAD := PERSPRONP;
                                                      SPECQ := YESSPEC;
                                                      COORD := NOCOORD;
                                                      END
END;

 FUNCTION LSAUXDOM_CpNPONUBGPR
                         (rec:LSDOMAINT_NPRECORD):BOOLEAN;
VAR Bool : BOOLEAN;
BEGIN 
  Bool := FALSE;
  WITH rec DO
  BEGIN
    IF (REQ = [POSPOL,NEGPOL,OMEGAPOL] ) THEN
IF (ENV = [POSPOL,NEGPOL,OMEGAPOL] ) THEN
IF (SUPERDEIXIS = OMEGADEIXIS ) THEN
IF (CLASS = OMEGATIMEADVCLASS ) THEN
IF (DEIXIS = OMEGADEIXIS ) THEN
IF (ASPECT = OMEGAASPECT ) THEN
IF (RETRO = FALSE ) THEN
IF (DEFINITE = DEF ) THEN
IF (PERSON = 4 ) THEN
IF (NUMBER = SINGULAR ) THEN
IF (CASES = [NOMINATIVE] ) THEN
IF (GENDERS = [OMEGAGENDER] ) THEN
IF (SEXES = [] ) THEN
IF (ACTSUBCS = [OTHERNOUN] ) THEN
IF (TEMPORAL = FALSE ) THEN
IF (POSSGENI = FALSE ) THEN
IF (ANIMATE = YESANIMATE ) THEN
IF (HUMAN = OMEGAHUMAN ) THEN
IF (ACTCOMAS = [COUNT] ) THEN
IF (THETANP = OMEGATHETANP ) THEN
IF (NOUNPATTERNEFS = [] ) THEN
IF (POSSPRED = TRUE ) THEN
IF (POSSNIETNP = FALSE ) THEN
IF (MOOD = DECLXPMOOD ) THEN
IF (GENERIC = OMEGAGENERIC ) THEN
IF (POSSRFORM = FALSE ) THEN
IF (SYNTQUANT = OMEGAQUANT ) THEN
IF (NPHEAD = PERSPRONP ) THEN
IF (SPECQ = YESSPEC ) THEN
IF (COORD = NOCOORD ) THEN
      Bool:=TRUE;
  END;{with}
  LSAUXDOM_CpNPONUBGPR:=Bool;
END;{function}
 PROCEDURE LSAUXDOM_AsNPONUBGPR(VAR rec:LSDOMAINT_NPRECORD);
BEGIN
WITH rec DO
BEGIN
REQ := [POSPOL,NEGPOL,OMEGAPOL];
                                                      ENV := [POSPOL,NEGPOL,OMEGAPOL];
                                                      SUPERDEIXIS := OMEGADEIXIS;
                                                      CLASS := OMEGATIMEADVCLASS;
                                                      DEIXIS := OMEGADEIXIS;
                                                      ASPECT := OMEGAASPECT;
                                                      RETRO := FALSE;
                                                      DEFINITE := DEF;
                                                      PERSON := 4;
                                                      NUMBER := SINGULAR;
                                                      CASES := [NOMINATIVE];
                                                      GENDERS := [OMEGAGENDER];
                                                      SEXES := [];
                                                      ACTSUBCS := [OTHERNOUN];
                                                      TEMPORAL := FALSE;
                                                      POSSGENI := FALSE;
                                                      ANIMATE := YESANIMATE;
                                                      HUMAN := OMEGAHUMAN;
                                                      ACTCOMAS := [COUNT];
                                                      THETANP := OMEGATHETANP;
                                                      NOUNPATTERNEFS := [];
                                                      POSSPRED := TRUE;
                                                      POSSNIETNP := FALSE;
                                                      MOOD := DECLXPMOOD;
                                                      GENERIC := OMEGAGENERIC;
                                                      POSSRFORM := FALSE;
                                                      SYNTQUANT := OMEGAQUANT;
                                                      NPHEAD := PERSPRONP;
                                                      SPECQ := YESSPEC;
                                                      COORD := NOCOORD;
                                                      END
END;

 FUNCTION LSAUXDOM_CpNPONZEGENBGPR
                         (rec:LSDOMAINT_NPRECORD):BOOLEAN;
VAR Bool : BOOLEAN;
BEGIN 
  Bool := FALSE;
  WITH rec DO
  BEGIN
    IF (REQ = [POSPOL,NEGPOL,OMEGAPOL] ) THEN
IF (ENV = [POSPOL,NEGPOL,OMEGAPOL] ) THEN
IF (SUPERDEIXIS = OMEGADEIXIS ) THEN
IF (CLASS = OMEGATIMEADVCLASS ) THEN
IF (DEIXIS = OMEGADEIXIS ) THEN
IF (ASPECT = OMEGAASPECT ) THEN
IF (RETRO = FALSE ) THEN
IF (DEFINITE = DEF ) THEN
IF (PERSON = 3 ) THEN
IF (NUMBER = PLURAL ) THEN
IF (CASES = [NOMINATIVE] ) THEN
IF (GENDERS = [OMEGAGENDER] ) THEN
IF (SEXES = [] ) THEN
IF (ACTSUBCS = [OTHERNOUN] ) THEN
IF (TEMPORAL = FALSE ) THEN
IF (POSSGENI = FALSE ) THEN
IF (ANIMATE = YESANIMATE ) THEN
IF (HUMAN = OMEGAHUMAN ) THEN
IF (ACTCOMAS = [COUNT] ) THEN
IF (THETANP = OMEGATHETANP ) THEN
IF (NOUNPATTERNEFS = [] ) THEN
IF (POSSPRED = TRUE ) THEN
IF (POSSNIETNP = FALSE ) THEN
IF (MOOD = DECLXPMOOD ) THEN
IF (GENERIC = OMEGAGENERIC ) THEN
IF (POSSRFORM = FALSE ) THEN
IF (SYNTQUANT = OMEGAQUANT ) THEN
IF (NPHEAD = ZEGENNP ) THEN
IF (SPECQ = YESSPEC ) THEN
IF (COORD = NOCOORD ) THEN
      Bool:=TRUE;
  END;{with}
  LSAUXDOM_CpNPONZEGENBGPR:=Bool;
END;{function}
 PROCEDURE LSAUXDOM_AsNPONZEGENBGPR(VAR rec:LSDOMAINT_NPRECORD);
BEGIN
WITH rec DO
BEGIN
REQ := [POSPOL,NEGPOL,OMEGAPOL];
                                                      ENV := [POSPOL,NEGPOL,OMEGAPOL];
                                                      SUPERDEIXIS := OMEGADEIXIS;
                                                      CLASS := OMEGATIMEADVCLASS;
                                                      DEIXIS := OMEGADEIXIS;
                                                      ASPECT := OMEGAASPECT;
                                                      RETRO := FALSE;
                                                      DEFINITE := DEF;
                                                      PERSON := 3;
                                                      NUMBER := PLURAL;
                                                      CASES := [NOMINATIVE];
                                                      GENDERS := [OMEGAGENDER];
                                                      SEXES := [];
                                                      ACTSUBCS := [OTHERNOUN];
                                                      TEMPORAL := FALSE;
                                                      POSSGENI := FALSE;
                                                      ANIMATE := YESANIMATE;
                                                      HUMAN := OMEGAHUMAN;
                                                      ACTCOMAS := [COUNT];
                                                      THETANP := OMEGATHETANP;
                                                      NOUNPATTERNEFS := [];
                                                      POSSPRED := TRUE;
                                                      POSSNIETNP := FALSE;
                                                      MOOD := DECLXPMOOD;
                                                      GENERIC := OMEGAGENERIC;
                                                      POSSRFORM := FALSE;
                                                      SYNTQUANT := OMEGAQUANT;
                                                      NPHEAD := ZEGENNP;
                                                      SPECQ := YESSPEC;
                                                      COORD := NOCOORD;
                                                      END
END;

 FUNCTION LSAUXDOM_CpNPONELKAAR
                         (rec:LSDOMAINT_NPRECORD):BOOLEAN;
VAR Bool : BOOLEAN;
BEGIN 
  Bool := FALSE;
  WITH rec DO
  BEGIN
    IF (REQ = [POSPOL,NEGPOL,OMEGAPOL] ) THEN
IF (ENV = [POSPOL,NEGPOL,OMEGAPOL] ) THEN
IF (SUPERDEIXIS = OMEGADEIXIS ) THEN
IF (CLASS = OMEGATIMEADVCLASS ) THEN
IF (DEIXIS = OMEGADEIXIS ) THEN
IF (ASPECT = OMEGAASPECT ) THEN
IF (RETRO = FALSE ) THEN
IF (DEFINITE = DEF ) THEN
IF (PERSON = 3 ) THEN
IF (NUMBER = PLURAL ) THEN
IF (CASES = [NOMINATIVE] ) THEN
IF (GENDERS = [OMEGAGENDER] ) THEN
IF (SEXES = [] ) THEN
IF (ACTSUBCS = [OTHERNOUN] ) THEN
IF (TEMPORAL = FALSE ) THEN
IF (POSSGENI = FALSE ) THEN
IF (ANIMATE = OMEGAANIMATE ) THEN
IF (HUMAN = OMEGAHUMAN ) THEN
IF (ACTCOMAS = [COUNT] ) THEN
IF (THETANP = OMEGATHETANP ) THEN
IF (NOUNPATTERNEFS = [] ) THEN
IF (POSSPRED = TRUE ) THEN
IF (POSSNIETNP = FALSE ) THEN
IF (MOOD = DECLXPMOOD ) THEN
IF (GENERIC = OMEGAGENERIC ) THEN
IF (POSSRFORM = FALSE ) THEN
IF (SYNTQUANT = OMEGAQUANT ) THEN
IF (NPHEAD = ELKAARNP ) THEN
IF (SPECQ = YESSPEC ) THEN
IF (COORD = NOCOORD ) THEN
      Bool:=TRUE;
  END;{with}
  LSAUXDOM_CpNPONELKAAR:=Bool;
END;{function}
 PROCEDURE LSAUXDOM_AsNPONELKAAR(VAR rec:LSDOMAINT_NPRECORD);
BEGIN
WITH rec DO
BEGIN
REQ := [POSPOL,NEGPOL,OMEGAPOL];
                                                      ENV := [POSPOL,NEGPOL,OMEGAPOL];
                                                      SUPERDEIXIS := OMEGADEIXIS;
                                                      CLASS := OMEGATIMEADVCLASS;
                                                      DEIXIS := OMEGADEIXIS;
                                                      ASPECT := OMEGAASPECT;
                                                      RETRO := FALSE;
                                                      DEFINITE := DEF;
                                                      PERSON := 3;
                                                      NUMBER := PLURAL;
                                                      CASES := [NOMINATIVE];
                                                      GENDERS := [OMEGAGENDER];
                                                      SEXES := [];
                                                      ACTSUBCS := [OTHERNOUN];
                                                      TEMPORAL := FALSE;
                                                      POSSGENI := FALSE;
                                                      ANIMATE := OMEGAANIMATE;
                                                      HUMAN := OMEGAHUMAN;
                                                      ACTCOMAS := [COUNT];
                                                      THETANP := OMEGATHETANP;
                                                      NOUNPATTERNEFS := [];
                                                      POSSPRED := TRUE;
                                                      POSSNIETNP := FALSE;
                                                      MOOD := DECLXPMOOD;
                                                      GENERIC := OMEGAGENERIC;
                                                      POSSRFORM := FALSE;
                                                      SYNTQUANT := OMEGAQUANT;
                                                      NPHEAD := ELKAARNP;
                                                      SPECQ := YESSPEC;
                                                      COORD := NOCOORD;
                                                      END
END;
 FUNCTION LSAUXDOM_AANACTIVEVPS:LSDOMAINT_SYNPATTERNSETTYPE;
BEGIN
LSAUXDOM_AANACTIVEVPS:=
[SYNAANACTIVE,
VPID9,
VPID12]
END;
 FUNCTION LSAUXDOM_AANACTINSUBORDIDVPS:LSDOMAINT_SYNPATTERNSETTYPE;
BEGIN
LSAUXDOM_AANACTINSUBORDIDVPS:=
[VPID9,
VPID12]
END;
 FUNCTION LSAUXDOM_AANOBJVPS:LSDOMAINT_SYNPATTERNSETTYPE;
BEGIN
LSAUXDOM_AANOBJVPS:=
[SYNAANNP_DONP,
SYNAANNP_OPENOMTESENT,
SYNAANNP_OPENTESENT,
SYNAANNP_QSENT,
SYNAANNP_THATSENT,
SYNAANNP_PROSENT,
SYNAANNP_HETOPENOMTESENT,
SYNAANNP_HETOPENTESENT,
SYNAANNP_HETQSENT,
SYNAANNP_PROSENT]
END;
 FUNCTION LSAUXDOM_AANOBJADJPS:LSDOMAINT_SYNPATTERNSETTYPE;
BEGIN
LSAUXDOM_AANOBJADJPS:=
[SYNAANNP_DONP,
SYNAANNP_OPENOMTESENT,
SYNAANNP_OPENTESENT,
SYNAANNP_QSENT,
SYNAANNP_THATSENT,
SYNAANNP]
END;
 FUNCTION LSAUXDOM_ACCOBJVPS:LSDOMAINT_SYNPATTERNSETTYPE;
BEGIN
LSAUXDOM_ACCOBJVPS:=
[SYNAANNP_DONP,
SYNCLOSEDADJPPROP,
SYNCLOSEDNPPROP,
SYNCLOSEDVERBPPROP,
SYNDIRCLOSEDPREPPPROP,
SYNDONP_DIROPENPREPPPROP,
SYNDONP_DIREMPTY,
SYNDONP_LOCOPENPREPPPROP,
SYNDONP_OPENADJPPROP,
SYNDONP_OPENNPPROP,
SYNDONP_OPENINFSENT,
SYNDONP_OPENTESENT,
SYNDONP_OPENOMTESENT,
SYNDONP_PREPOPENOMTESENT,
SYNDONP_PREPOPENTESENT,
SYNDONP_PREPNP,
SYNDONP_PREPOPENNPPROP,
SYNEMPTY_DONP,
SYNEMPTY_HETOPENTESENT,
SYNEMPTY_HETTHATSENT,
SYNIOEMPTY_HETQSENT,
SYNHETOPENOMTESENT,
SYNHETOPENTESENT,
SYNHETTHATSENT,
SYNIONP_DONP,
SYNIONP_HETOPENOMTESENT,
SYNIONP_HETTHATSENT,
SYNLOCCLOSEDPREPPPROP,
SYNNP,
SYNOTHERCLOSEDPREPPPROP,
SYNPREPCLOSEDADJPPROP,
SYNPREPCLOSEDNPPROP,
SYNVOORNP_DONP,
SYNDONP_PREPTHATSENT,
SYNDONP_RESULTEMPTY,
SYNDONP_THATSENT,
SYNIONP_PROSENT,
SYNAANNP_PROSENT,
SYNEMPTY_PROSENT,
SYNDONP_PREPPROSENT,
SYNDONP_TEMPOPENPREPPPROP,
SYNDONP_OTHEROPENPREPPPROP,
SYNDONP_PREPEMPTY,
SYNDONP_PREPTHATSENT,
SYNDONP_RESULTEMPTY,
SYNDONP_THATSENT,
SYNHETIFSENT,
SYNHETQSENT,
VPID1,
VPID2,
VPID3,
VPID7,
VPID4,
VPID10,
VPID6,
VPID11,
VPID14,
VPID15,
VPID16,
VPID21,
VPID22,
VPID25,
VPID30,
VPID31,
VPID87]
END;
 FUNCTION LSAUXDOM_ADJINDOBJVPS:LSDOMAINT_SYNPATTERNSETTYPE;
BEGIN
LSAUXDOM_ADJINDOBJVPS:=
[SYNIONP_DONP,
SYNEMPTY_DONP]
END;
 FUNCTION LSAUXDOM_ADJPREPOBJVPS:LSDOMAINT_SYNPATTERNSETTYPE;
BEGIN
LSAUXDOM_ADJPREPOBJVPS:=
[SYNPAPREPOPENOMTESENT,
SYNPAPREPOPENTESENT,
SYNPAPREPQSENT,
SYNPAPREPTHATSENT,
SYNPOSTADJPREPNP,
SYNPREPNP,
SYNPREPOPENOMTESENT,
SYNPREPOPENTESENT,
SYNPREPQSENT,
SYNPREPTHATSENT]
END;
 FUNCTION LSAUXDOM_ADJPPREDVPS:LSDOMAINT_SYNPATTERNSETTYPE;
BEGIN
LSAUXDOM_ADJPPREDVPS:=
[SYNCLOSEDADJPPROP,
SYNDONP_OPENADJPPROP,
SYNEMPTY_CLOSEDADJPPROP,
SYNIONP_CLOSEDADJPPROP,
SYNOPENADJPPROP,
SYNZIJN]
END;
 FUNCTION LSAUXDOM_ADJP010VPS:LSDOMAINT_SYNPATTERNSETTYPE;
BEGIN
LSAUXDOM_ADJP010VPS:=
[SYNHETTHATSENT,
SYNNP,
SYNOPENOMTESENTPROOBJ,
SYNQSENT,
SYNTHATSENT]
END;
 FUNCTION LSAUXDOM_ADJP012VPS:LSDOMAINT_SYNPATTERNSETTYPE;
BEGIN
LSAUXDOM_ADJP012VPS:=
[SYNAANNP_DONP,
SYNAANNP_HETOPENOMTESENT,
SYNAANNP_HETOPENTESENT,
SYNAANNP_HETQSENT,
SYNAANNP_HETTHATSENT,
SYNAANNP_OPENOMTESENT,
SYNAANNP_OPENTESENT,
SYNAANNP_QSENT,
SYNAANNP_THATSENT,
SYNEMPTY_HETOPENTESENT,
SYNEMPTY_OPENTESENT,
SYNIOEMPTY_DONP,
SYNIOEMPTY_HETOPENOMTESENT,
SYNIOEMPTY_HETQSENT,
SYNIOEMPTY_HETTHATSENT,
SYNIOEMPTY_OPENOMTESENT,
SYNIOEMPTY_QSENT,
SYNIOEMPTY_THATSENT,
SYNIONP_DONP,
SYNIONP_HETOPENOMTESENT,
SYNIONP_HETOPENTESENT,
SYNIONP_HETQSENT,
SYNIONP_HETTHATSENT,
SYNIONP_OPENOMTESENT,
SYNIONP_OPENTESENT,
SYNIONP_QSENT,
SYNIONP_THATSENT]
END;
 FUNCTION LSAUXDOM_ADJP120VPS:LSDOMAINT_SYNPATTERNSETTYPE;
BEGIN
LSAUXDOM_ADJP120VPS:=
[SYNHETOPENOMTESENT,
SYNHETOPENTESENT,
SYNHETTHATSENT,
SYNLOCEMPTY,
SYNLOCPREPP,
SYNMEASUREPHRASE,
SYNNP,
SYNOPENOMTESENT,
SYNOPENOMTESENTPROOBJ,
SYNOPENTESENT,
SYNPAPREPOPENOMTESENT,
SYNPAPREPOPENTESENT,
SYNPAPREPQSENT,
SYNPAPREPTHATSENT,
SYNPATHPREPP,
SYNPOSTADJPREPNP,
SYNPREPEMPTY,
SYNPREPNP,
SYNPREPOPENOMTESENT,
SYNPREPOPENTESENT,
SYNPREPQSENT,
SYNPREPTHATSENT,
SYNQSENT,
SYNTHATSENT,
SYNVOOREMPTY,
SYNVOORNP]
END;
 FUNCTION LSAUXDOM_ADJP123VPS:LSDOMAINT_SYNPATTERNSETTYPE;
BEGIN
LSAUXDOM_ADJP123VPS:=
[SYNAANNP_DONP,
SYNAANNP_HETOPENOMTESENT,
SYNAANNP_HETOPENTESENT,
SYNAANNP_HETQSENT,
SYNAANNP_HETTHATSENT,
SYNAANNP_OPENOMTESENT,
SYNAANNP_OPENTESENT,
SYNAANNP_QSENT,
SYNAANNP_THATSENT,
SYNEMPTY_HETOPENTESENT,
SYNEMPTY_OPENTESENT,
SYNIOEMPTY_DONP,
SYNIOEMPTY_HETOPENOMTESENT,
SYNIOEMPTY_HETQSENT,
SYNIOEMPTY_HETTHATSENT,
SYNIOEMPTY_OPENOMTESENT,
SYNIOEMPTY_QSENT,
SYNIOEMPTY_THATSENT,
SYNIONP_DONP,
SYNIONP_HETOPENOMTESENT,
SYNIONP_HETOPENTESENT,
SYNIONP_HETQSENT,
SYNIONP_HETTHATSENT,
SYNIONP_MEASUREPHRASE,
SYNIONP_OPENOMTESENT,
SYNIONP_OPENTESENT,
SYNIONP_QSENT,
SYNIONP_THATSENT]
END;
 FUNCTION LSAUXDOM_ADVPPREDVPS:LSDOMAINT_SYNPATTERNSETTYPE;
BEGIN
LSAUXDOM_ADVPPREDVPS:=
[SYNEMPTY_OTHERCLOSEDPREPPPROP,
SYNIONP_OTHERCLOSEDPREPPPROP,
SYNOTHERCLOSEDPREPPPROP,
SYNZIJN]
END;
 FUNCTION LSAUXDOM_ALSCOMPLVPS:LSDOMAINT_SYNPATTERNSETTYPE;
BEGIN
LSAUXDOM_ALSCOMPLVPS:=
[SYNHETIFSENT]
END;
 FUNCTION LSAUXDOM_ALSOFCOMPLVPS:LSDOMAINT_SYNPATTERNSETTYPE;
BEGIN
LSAUXDOM_ALSOFCOMPLVPS:=
[SYNASIFCLOSEDADJPPROP,
SYNHETASIFCLOSEDADJPPROP]
END;
 FUNCTION LSAUXDOM_ARGIDVPS:LSDOMAINT_SYNPATTERNSETTYPE;
BEGIN
LSAUXDOM_ARGIDVPS:=
[VPID8,
VPID9,
VPID12]
END;
 FUNCTION LSAUXDOM_ARGINNPIDVPS:LSDOMAINT_SYNPATTERNSETTYPE;
BEGIN
LSAUXDOM_ARGINNPIDVPS:=
[VPID10,
VPID11,
VPID16]
END;
 FUNCTION LSAUXDOM_CLITICRELS:SETOFSYNREL;
BEGIN
LSAUXDOM_CLITICRELS:=
[HETCLREL,
SECONDCLREL,
FIRSTCLREL,
REFLREL]
END;
 FUNCTION LSAUXDOM_CLOSEDPREDVPS:LSDOMAINT_SYNPATTERNSETTYPE;
BEGIN
LSAUXDOM_CLOSEDPREDVPS:=
[SYNCLOSEDADJPPROP,
SYNCLOSEDNPPROP]
END;
 FUNCTION LSAUXDOM_CLOSEDSENTVPS:LSDOMAINT_SYNPATTERNSETTYPE;
BEGIN
LSAUXDOM_CLOSEDSENTVPS:=
[SYNCLOSEDINFSENT,
SYNCLOSEDTESENT,
SYNDOORACTIVE,
SYNAANACTIVE,
SYNEMPTY_CLOSEDTESENT,
VPID8,
VPID9,
VPID12]
END;
 FUNCTION LSAUXDOM_CLOSEDXPPVPS:LSDOMAINT_SYNPATTERNSETTYPE;
BEGIN
LSAUXDOM_CLOSEDXPPVPS:=
[SYNCLOSEDADJPPROP,
SYNCLOSEDNPPROP,
SYNCLOSEDVERBPPROP,
SYNDIRCLOSEDPREPPPROP,
SYNEMPTY_CLOSEDADJPPROP,
SYNEMPTY_CLOSEDNPPROP,
SYNEMPTY_OTHERCLOSEDPREPPPROP,
SYNIONP_CLOSEDADJPPROP,
SYNIONP_CLOSEDNPPROP,
SYNIONP_OTHERCLOSEDPREPPPROP,
SYNIONP_PREPCLOSEDADJPPROP,
SYNLOCCLOSEDPREPPPROP,
SYNOTHERCLOSEDPREPPPROP,
SYNPREPCLOSEDADJPPROP,
SYNPREPCLOSEDNPPROP,
VPID14,
VPID15,
VPID31]
END;
 FUNCTION LSAUXDOM_COORDVFCPS:LSDOMAINT_COORDPATTERNSETTYPE;
BEGIN
LSAUXDOM_COORDVFCPS:=
[SSDC,
SSYNC,
SSWHC,
SRELFINC,
SOMTEC,
SOTEC,
SCTEC,
SPRPC,
SPAPC]
END;
 FUNCTION LSAUXDOM_COORDV2CPS:LSDOMAINT_COORDPATTERNSETTYPE;
BEGIN
LSAUXDOM_COORDV2CPS:=
[SMDC,
SMYNC,
SMWHC,
SIMPC,
SCOND,
SLATEN]
END;
 FUNCTION LSAUXDOM_COUNTNOUNVPS:LSDOMAINT_SYNPATTERNSETTYPE;
BEGIN
LSAUXDOM_COUNTNOUNVPS:=
[VPID1,
VPID6,
VPID15,
VPID16]
END;
 FUNCTION LSAUXDOM_CTVARCATS:SETOFSYNTCAT;
BEGIN
LSAUXDOM_CTVARCATS:=
[VARPREPP]
END;
 FUNCTION LSAUXDOM_DEEPARGIDVPS:LSDOMAINT_SYNPATTERNSETTYPE;
BEGIN
LSAUXDOM_DEEPARGIDVPS:=
[VPID8,
VPID9,
VPID12]
END;
 FUNCTION LSAUXDOM_DECLCOMPLVPS:LSDOMAINT_SYNPATTERNSETTYPE;
BEGIN
LSAUXDOM_DECLCOMPLVPS:=
[SYNAANNP_OPENOMTESENT,
SYNAANNP_OPENTESENT,
SYNAANNP_THATSENT,
SYNAANNP_HETOPENTESENT,
SYNASIFCLOSEDADJPPROP,
SYNDONP_OPENTESENT,
SYNDONP_OPENINFSENT,
SYNDONP_OPENOMTESENT,
SYNDONP_PREPOPENTESENT,
SYNEMPTY_HETOPENTESENT,
SYNEMPTY_HETTHATSENT,
SYNEMPTY_OPENOMTESENT,
SYNEMPTY_OPENTESENT,
SYNEMPTY_THATSENT,
SYNHETOPENOMTESENT,
SYNHETOPENTESENT,
SYNHETTHATSENT,
SYNIONP_HETOPENOMTESENT,
SYNIONP_OPENOMTESENT,
SYNIONP_HETTHATSENT,
SYNIONP_OPENTESENT,
SYNIONP_OPENINFSENT,
SYNIONP_THATSENT,
SYNOPENOMTESENT,
SYNOPENTESENT,
SYNPREPOPENTESENT,
SYNPREPTHATSENT,
SYNTHATSENT,
SYNHETASIFCLOSEDADJPPROP,
SYNHETIFSENT,
SYNDONP_PREPTHATSENT,
SYNDONP_THATSENT,
SYNEMPTY_PREPEMPTY,
SYNPREPNP_PREPTHATSENT,
SYNPREPEMPTY_PREPTHATSENT,
SYNPREPNP_THATSENT,
SYNPREPEMPTY_PREPOPENOMTESENT,
SYNPREPNP_OPENOMTESENT,
SYNPREPNP_PREPOPENOMTESENT,
SYNTHATSENT_LOCOPENPREPPPROP,
SYNPREPNP_PREPTHATSENT,
VPID8,
VPID9,
VPID12,
SYNDONP_PREPOPENOMTESENT]
END;
 FUNCTION LSAUXDOM_DETLESSNPVPS:LSDOMAINT_SYNPATTERNSETTYPE;
BEGIN
LSAUXDOM_DETLESSNPVPS:=
[VPID14,
VPID20,
VPID25]
END;
 FUNCTION LSAUXDOM_DETNPVPS:LSDOMAINT_SYNPATTERNSETTYPE;
BEGIN
LSAUXDOM_DETNPVPS:=
[VPID15,
VPID19,
VPID16,
VPID1]
END;
 FUNCTION LSAUXDOM_DIRARGVPS:LSDOMAINT_SYNPATTERNSETTYPE;
BEGIN
LSAUXDOM_DIRARGVPS:=
[SYNDIRCLOSEDPREPPPROP,
SYNDIROPENPREPPPROP,
SYNDONP_DIROPENPREPPPROP,
VPID11,
VPID16,
VPID30,
VPID87]
END;
 FUNCTION LSAUXDOM_DIREMPTYVPS:LSDOMAINT_SYNPATTERNSETTYPE;
BEGIN
LSAUXDOM_DIREMPTYVPS:=
[SYNDONP_DIREMPTY,
SYNDIREMPTY,
VPID16]
END;
 FUNCTION LSAUXDOM_DIRNODETIDVPS:LSDOMAINT_SYNPATTERNSETTYPE;
BEGIN
LSAUXDOM_DIRNODETIDVPS:=
[]
END;
 FUNCTION LSAUXDOM_DONODETIDVPS:LSDOMAINT_SYNPATTERNSETTYPE;
BEGIN
LSAUXDOM_DONODETIDVPS:=
[]
END;
 FUNCTION LSAUXDOM_DOORACTIVEVPS:LSDOMAINT_SYNPATTERNSETTYPE;
BEGIN
LSAUXDOM_DOORACTIVEVPS:=
[SYNDOORACTIVE]
END;
 FUNCTION LSAUXDOM_EMPTYOBJVPS:LSDOMAINT_SYNPATTERNSETTYPE;
BEGIN
LSAUXDOM_EMPTYOBJVPS:=
[SYNEMPTY,
SYNEMPTY_PREPEMPTY,
SYNEMPTY_PREPNP]
END;
 FUNCTION LSAUXDOM_EMPTYINDOBJVPS:LSDOMAINT_SYNPATTERNSETTYPE;
BEGIN
LSAUXDOM_EMPTYINDOBJVPS:=
[SYNEMPTY_CLOSEDADJPPROP,
SYNEMPTY_CLOSEDNPPROP,
SYNEMPTY_DONP,
SYNEMPTY_HETOPENTESENT,
SYNEMPTY_HETTHATSENT,
SYNEMPTY_MEASUREPHRASE,
SYNEMPTY_OPENOMTESENT,
SYNEMPTY_OPENTESENT,
SYNEMPTY_OTHERCLOSEDPREPPPROP,
SYNEMPTY_QSENT,
SYNEMPTY_THATSENT,
SYNEMPTY_PROSENT,
SYNEMPTY_CLOSEDTESENT,
SYNIOEMPTY_HETQSENT]
END;
 FUNCTION LSAUXDOM_EXTRAPOSVPS:LSDOMAINT_SYNPATTERNSETTYPE;
BEGIN
LSAUXDOM_EXTRAPOSVPS:=
[SYNAANNP_HETOPENOMTESENT,
SYNAANNP_HETOPENTESENT,
SYNAANNP_HETQSENT,
SYNAANNP_OPENOMTESENT,
SYNAANNP_OPENTESENT,
SYNAANNP_QSENT,
SYNAANNP_THATSENT,
SYNASIFCLOSEDADJPPROP,
SYNDONP_OPENTESENT,
SYNDONP_OPENOMTESENT,
SYNEMPTY_HETOPENTESENT,
SYNEMPTY_HETTHATSENT,
SYNEMPTY_OPENOMTESENT,
SYNEMPTY_OPENTESENT,
SYNEMPTY_QSENT,
SYNEMPTY_THATSENT,
SYNHETOPENOMTESENT,
SYNHETOPENTESENT,
SYNHETTHATSENT,
SYNIONP_HETOPENOMTESENT,
SYNIOEMPTY_HETQSENT,
SYNOPENOMTESENTPROOBJ,
SYNIONP_HETTHATSENT,
SYNIONP_OPENTESENT,
SYNIONP_OPENOMTESENT,
SYNIONP_QSENT,
SYNIONP_THATSENT,
SYNOPENOMTESENT,
SYNOPENTESENT,
SYNPREPOPENTESENT,
SYNPREPQSENT,
SYNPREPTHATSENT,
SYNQSENT,
SYNTHATSENT,
SYNHETASIFCLOSEDADJPPROP,
SYNDONP_PREPTHATSENT,
SYNDONP_THATSENT,
SYNHETIFSENT,
SYNHETQSENT,
SYNPREPNP_PREPTHATSENT,
SYNPREPEMPTY_PREPTHATSENT,
SYNPREPNP_THATSENT,
SYNPREPEMPTY_PREPOPENOMTESENT,
SYNPREPNP_OPENOMTESENT,
SYNPREPNP_PREPOPENOMTESENT,
SYNTHATSENT_LOCOPENPREPPPROP,
SYNPREPNP_QSENT,
SYNDONP_PREPOPENOMTESENT,
SYNDONP_PREPOPENTESENT]
END;
 FUNCTION LSAUXDOM_FINDECLCOMPLVPS:LSDOMAINT_SYNPATTERNSETTYPE;
BEGIN
LSAUXDOM_FINDECLCOMPLVPS:=
[SYNAANNP_THATSENT,
SYNASIFCLOSEDADJPPROP,
SYNEMPTY_HETTHATSENT,
SYNEMPTY_THATSENT,
SYNHETTHATSENT,
SYNIONP_HETTHATSENT,
SYNIONP_THATSENT,
SYNTHATSENT,
SYNPREPTHATSENT,
SYNHETASIFCLOSEDADJPPROP,
SYNTHATSENT_LOCOPENPREPPPROP,
SYNDONP_PREPTHATSENT,
SYNDONP_THATSENT,
SYNPREPNP_PREPTHATSENT,
SYNPREPEMPTY_PREPTHATSENT,
SYNPREPNP_THATSENT,
SYNHETIFSENT,
SYNAANNP_HETOPENOMTESENT,
SYNAANNP_HETOPENTESENT,
SYNDONP_PREPOPENTESENT,
SYNDONP_PREPOPENOMTESENT,
SYNPREPEMPTY_PREPOPENOMTESENT,
SYNPREPNP_PREPOPENOMTESENT]
END;
 FUNCTION LSAUXDOM_GENPRENEGRELS:SETOFSYNREL;
BEGIN
LSAUXDOM_GENPRENEGRELS:=
[AGVPADVREL,
FIRSTCLREL,
ERPOSREL,
ERQREL,
HETCLREL,
SECONDCLREL,
LEFTDISLOCREL,
LOCADVREL,
POSTSUBJREL,
PREADVREL,
REFLREL,
SENTADVREL,
SHIFTREL,
SUBJREL,
SUBJVPADVREL,
TEMPADVREL]
END;
 FUNCTION LSAUXDOM_HETCOMPLVPS:LSDOMAINT_SYNPATTERNSETTYPE;
BEGIN
LSAUXDOM_HETCOMPLVPS:=
[SYNEMPTY_HETOPENTESENT,
SYNEMPTY_HETTHATSENT,
SYNHETOPENOMTESENT,
SYNHETOPENTESENT,
SYNHETTHATSENT,
SYNIONP_HETOPENOMTESENT,
SYNAANNP_HETTHATSENT,
SYNIOEMPTY_HETTHATSENT,
SYNIONP_HETTHATSENT,
SYNIOEMPTY_HETQSENT,
SYNIONP_HETQSENT,
SYNHETIFSENT,
SYNHETQSENT,
SYNIOEMPTY_HETOPENOMTESENT,
SYNAANNP_HETOPENTESENT,
SYNAANNP_HETOPENOMTESENT,
SYNAANNP_HETQSENT]
END;
 FUNCTION LSAUXDOM_IDVPS:LSDOMAINT_SYNPATTERNSETTYPE;
BEGIN
LSAUXDOM_IDVPS:=
[VPID1,
VPID2,
VPID3,
VPID4,
VPID5,
VPID6,
VPID7,
VPID8,
VPID9,
VPID10,
VPID11,
VPID12,
VPID13,
VPID14,
VPID15,
VPID16,
VPID17,
VPID18,
VPID19,
VPID20,
VPID21,
VPID22,
VPID23,
VPID24,
VPID25,
VPID26,
VPID27,
VPID28,
VPID29,
VPID30,
VPID31,
VPID32,
VPID33,
VPID34,
VPID35,
VPID36,
VPID37,
VPID38,
VPID39,
VPID40,
VPID41,
VPID42,
VPID43,
VPID44,
VPID45,
VPID46,
VPID47,
VPID48,
VPID49,
VPID50,
VPID51,
VPID52,
VPID53,
VPID54,
VPID55,
VPID56,
VPID57,
VPID58,
VPID59,
VPID60,
VPID61,
VPID62,
VPID63,
VPID64,
VPID65,
VPID66,
VPID67,
VPID68,
VPID69,
VPID70,
VPID71,
VPID72,
VPID73,
VPID74,
VPID75,
VPID76,
VPID77,
VPID78,
VPID79,
VPID80,
VPID81,
VPID82,
VPID83,
VPID84,
VPID85,
VPID86,
VPID87,
VPID88,
VPID89,
VPID90,
VPID91,
VPID92,
VPID93,
VPID94,
VPID95,
VPID96,
VPID97,
VPID98,
VPID99,
VPID100,
VPID101,
VPID102,
VPID103,
VPID104,
VPID105,
VPID106,
VPID107,
VPID108,
VPID109,
VPID110,
VPID111,
VPID112,
VPID113,
VPID114,
VPID115,
VPID116,
VPID117,
VPID118,
VPID119,
VPID120,
VPID121,
VPID122,
VPID123,
VPID124,
VPID125,
VPID126,
VPID127,
VPID128,
VPID129,
VPID130,
VPID131,
VPID132,
VPID133,
VPID134,
VPID135,
VPID136,
VPID137,
VPID138,
VPID139,
VPID140,
VPID141,
VPID142,
VPID143,
VPID144,
VPID145,
VPID146,
VPID147,
VPID148,
VPID149,
VPID150,
VPID151,
VPID152,
VPID153,
VPID154,
VPID155,
VPID156,
VPID157,
VPID158,
VPID159,
VPID160,
VPID161,
VPID162,
VPID163,
VPID164,
VPID165,
VPID166,
VPID167,
VPID168,
VPID169,
VPID170,
VPID171,
VPID172,
VPID173,
VPID174,
VPID175,
VPID176,
VPID177,
VPID178,
VPID179,
VPID180,
VPID181,
VPID182,
VPID183,
VPID184,
VPID185,
VPID186,
VPID187,
VPID188,
VPID189,
VPID190,
VPID191,
VPID192,
VPID193,
VPID194,
VPID195,
VPID196,
VPID197,
VPID198,
VPID199,
VPID200]
END;
 FUNCTION LSAUXDOM_INDOBJVPS:LSDOMAINT_SYNPATTERNSETTYPE;
BEGIN
LSAUXDOM_INDOBJVPS:=
[SYNIONP_CLOSEDADJPPROP,
SYNIONP_CLOSEDNPPROP,
SYNIONP_DONP,
SYNIONP_HETOPENOMTESENT,
SYNIONP_HETTHATSENT,
SYNIONP_MEASUREPHRASE,
SYNIONP_OPENTESENT,
SYNIONP_OPENINFSENT,
SYNIONP_OTHERCLOSEDPREPPPROP,
SYNIONP_OPENOMTESENT,
SYNIONP_PREPCLOSEDADJPPROP,
SYNIONP_QSENT,
SYNIONP_THATSENT,
SYNIONP_MEASUREPHRASE,
SYNIONP_PREPNP,
SYNIONP_PROSENT,
SYNIONP_SOPROSENT,
VPID2,
VPID3]
END;
 FUNCTION LSAUXDOM_IONODETIDVPS:LSDOMAINT_SYNPATTERNSETTYPE;
BEGIN
LSAUXDOM_IONODETIDVPS:=
[]
END;
 FUNCTION LSAUXDOM_INDOBJADJPS:LSDOMAINT_SYNPATTERNSETTYPE;
BEGIN
LSAUXDOM_INDOBJADJPS:=
[SYNIONP_DONP,
SYNIONP_HETOPENOMTESENT,
SYNIONP_HETTHATSENT,
SYNIONP_MEASUREPHRASE,
SYNIONP_OPENTESENT,
SYNIONP_OPENOMTESENT,
SYNIONP_QSENT,
SYNIONP_THATSENT,
SYNIONP]
END;
 FUNCTION LSAUXDOM_INDOBJIDVPS:LSDOMAINT_SYNPATTERNSETTYPE;
BEGIN
LSAUXDOM_INDOBJIDVPS:=
[VPID3]
END;
 FUNCTION LSAUXDOM_INSIDEVPADVRELS:SETOFSYNREL;
BEGIN
LSAUXDOM_INSIDEVPADVRELS:=
[AGVPADVREL,
VPADVREL]
END;
 FUNCTION LSAUXDOM_INSIDEVPARGANDVRELS:SETOFSYNREL;
BEGIN
LSAUXDOM_INSIDEVPARGANDVRELS:=
[AANOBJREL,
BYOBJREL,
COMPLREL,
DIRARGREL,
IDREL,
INDOBJREL,
LOCARGREL,
OBJREL,
PARTREL,
PREDREL,
PREPOBJREL,
VOOROBJREL,
AUXREL,
HEAD,
PROGAUXREL]
END;
 FUNCTION LSAUXDOM_INSIDEVPARGRELS:SETOFSYNREL;
BEGIN
LSAUXDOM_INSIDEVPARGRELS:=
[AANOBJREL,
BYOBJREL,
COMPLREL,
DIRARGREL,
IDREL,
INDOBJREL,
LOCARGREL,
OBJREL,
PARTREL,
PREDREL,
PREPOBJREL,
VOOROBJREL]
END;
 FUNCTION LSAUXDOM_INSIDEVPRELS:SETOFSYNREL;
BEGIN
LSAUXDOM_INSIDEVPRELS:=
[AANOBJREL,
AGVPADVREL,
ARGREL,
AUXREL,
BYOBJREL,
COMPLREL,
DIRARGREL,
GLUEREL,
HEAD,
IDREL,
INDOBJREL,
INSTRADVREL,
LOCARGREL,
OBJREL,
PARTREL,
POSTVERBREL,
POSTVPOREL,
PREDREL,
PREPOBJREL,
PUNCREL,
STRANDEDREL,
VOOROBJREL,
VPADVREL]
END;
 FUNCTION LSAUXDOM_INTERJECTATTCATS:SETOFSYNTCAT;
BEGIN
LSAUXDOM_INTERJECTATTCATS:=
[ADJP,
ADVP,
NP,
PREPP,
SENTENCE,
VERBP]
END;
 FUNCTION LSAUXDOM_INTERJECTIONCATS:SETOFSYNTCAT;
BEGIN
LSAUXDOM_INTERJECTIONCATS:=
[ADJP,
ADVP,
NP,
PREPP,
SENTENCE,
VERBP]
END;
 FUNCTION LSAUXDOM_IOEMPTYADJPS:LSDOMAINT_SYNPATTERNSETTYPE;
BEGIN
LSAUXDOM_IOEMPTYADJPS:=
[SYNIOEMPTY_DONP,
SYNIOEMPTY_THATSENT,
SYNIOEMPTY_HETTHATSENT,
SYNIOEMPTY_HETQSENT,
SYNIOEMPTY_QSENT,
SYNIOEMPTY_OPENOMTESENT,
SYNIOEMPTY_HETOPENOMTESENT]
END;
 FUNCTION LSAUXDOM_LOCADVIDVPS:LSDOMAINT_SYNPATTERNSETTYPE;
BEGIN
LSAUXDOM_LOCADVIDVPS:=
[]
END;
 FUNCTION LSAUXDOM_LOCARGVPS:LSDOMAINT_SYNPATTERNSETTYPE;
BEGIN
LSAUXDOM_LOCARGVPS:=
[SYNDONP_LOCOPENPREPPPROP,
SYNLOCCLOSEDPREPPPROP,
SYNTHATSENT_LOCOPENPREPPPROP,
SYNLOCOPENPREPPPROP,
VPID5,
VPID7,
VPID13,
VPID14,
VPID15,
VPID21]
END;
 FUNCTION LSAUXDOM_MASSNOUNVPS:LSDOMAINT_SYNPATTERNSETTYPE;
BEGIN
LSAUXDOM_MASSNOUNVPS:=
[VPID4,
VPID14,
VPID25]
END;
 FUNCTION LSAUXDOM_NODETNPIDVPS:LSDOMAINT_SYNPATTERNSETTYPE;
BEGIN
LSAUXDOM_NODETNPIDVPS:=
[]
END;
 FUNCTION LSAUXDOM_NPPREDVPS:LSDOMAINT_SYNPATTERNSETTYPE;
BEGIN
LSAUXDOM_NPPREDVPS:=
[SYNCLOSEDNPPROP,
SYNDONP_OPENNPPROP,
SYNEMPTY_CLOSEDNPPROP,
SYNIONP_CLOSEDNPPROP,
SYNOPENNPPROP,
SYNZIJN,
SYNMEASUREPHRASE,
SYNIONP_MEASUREPHRASE,
SYNEMPTY_MEASUREPHRASE]
END;
 FUNCTION LSAUXDOM_OBJIDVPS:LSDOMAINT_SYNPATTERNSETTYPE;
BEGIN
LSAUXDOM_OBJIDVPS:=
[VPID1,
VPID2,
VPID3,
VPID4,
VPID6,
VPID10,
VPID21,
VPID25,
VPID30,
VPID87]
END;
 FUNCTION LSAUXDOM_OBJVPS:LSDOMAINT_SYNPATTERNSETTYPE;
BEGIN
LSAUXDOM_OBJVPS:=
[SYNAANNP_DONP,
SYNCLOSEDADJPPROP,
SYNCLOSEDNPPROP,
SYNCLOSEDVERBPPROP,
SYNDIRCLOSEDPREPPPROP,
SYNDONP_DIROPENPREPPPROP,
SYNDONP_DIREMPTY,
SYNDONP_LOCOPENPREPPPROP,
SYNDONP_OPENADJPPROP,
SYNDONP_OPENNPPROP,
SYNDONP_OPENTESENT,
SYNDONP_OPENOMTESENT,
SYNDONP_OPENINFSENT,
SYNDONP_PREPNP,
SYNDONP_PREPOPENNPPROP,
SYNDONP_PREPOPENOMTESENT,
SYNEMPTY_CLOSEDADJPPROP,
SYNEMPTY_CLOSEDNPPROP,
SYNEMPTY_DONP,
SYNEMPTY_OTHERCLOSEDPREPPPROP,
SYNIONP_CLOSEDADJPPROP,
SYNIONP_CLOSEDNPPROP,
SYNIONP_DONP,
SYNIONP_OTHERCLOSEDPREPPPROP,
SYNIONP_PREPCLOSEDADJPPROP,
SYNLOCCLOSEDPREPPPROP,
SYNNP,
SYNOTHERCLOSEDPREPPPROP,
SYNPREPCLOSEDADJPPROP,
SYNPREPCLOSEDNPPROP,
SYNVOORNP_DONP,
SYNDONP_PREPTHATSENT,
SYNDONP_PREPOPENTESENT,
SYNDONP_PREPPROSENT,
SYNDONP_RESULTEMPTY,
SYNDONP_THATSENT,
SYNDONP_TEMPOPENPREPPPROP,
SYNDONP_OTHEROPENPREPPPROP,
SYNDONP_PREPEMPTY,
VPID1,
VPID2,
VPID3,
VPID7,
VPID4,
VPID10,
VPID6,
VPID11,
VPID14,
VPID15,
VPID16,
VPID21,
VPID22,
VPID25,
VPID30,
VPID31,
VPID87]
END;
 FUNCTION LSAUXDOM_OBJANDHETVPS:LSDOMAINT_SYNPATTERNSETTYPE;
BEGIN
LSAUXDOM_OBJANDHETVPS:=
[SYNEMPTY_HETOPENTESENT,
SYNEMPTY_HETTHATSENT,
SYNHETOPENOMTESENT,
SYNHETOPENTESENT,
SYNHETTHATSENT,
SYNIONP_HETOPENOMTESENT,
SYNIONP_HETTHATSENT,
SYNAANNP_DONP,
SYNCLOSEDADJPPROP,
SYNCLOSEDNPPROP,
SYNCLOSEDVERBPPROP,
SYNDIRCLOSEDPREPPPROP,
SYNDONP_DIROPENPREPPPROP,
SYNDONP_DIREMPTY,
SYNDONP_LOCOPENPREPPPROP,
SYNDONP_OPENADJPPROP,
SYNDONP_OPENNPPROP,
SYNDONP_OPENTESENT,
SYNDONP_OPENOMTESENT,
SYNDONP_PREPOPENOMTESENT,
SYNDONP_PREPNP,
SYNDONP_PREPOPENNPPROP,
SYNEMPTY_CLOSEDADJPPROP,
SYNEMPTY_CLOSEDNPPROP,
SYNEMPTY_DONP,
SYNEMPTY_OTHERCLOSEDPREPPPROP,
SYNIONP_CLOSEDADJPPROP,
SYNIONP_CLOSEDNPPROP,
SYNIONP_DONP,
SYNIONP_OTHERCLOSEDPREPPPROP,
SYNIONP_PREPCLOSEDADJPPROP,
SYNLOCCLOSEDPREPPPROP,
SYNNP,
SYNOTHERCLOSEDPREPPPROP,
SYNPREPCLOSEDADJPPROP,
SYNPREPCLOSEDNPPROP,
SYNVOORNP_DONP,
SYNPROSENT,
SYNDONP_PREPTHATSENT,
SYNDONP_RESULTEMPTY,
SYNDONP_THATSENT,
SYNDONP_OPENINFSENT,
SYNDONP_OTHEROPENPREPPPROP,
SYNDONP_PREPOPENTESENT,
SYNDONP_PREPPROSENT,
SYNAANNP_PROSENT,
SYNDONP_THATSENT,
SYNIONP_PROSENT,
SYNHETIFSENT,
SYNHETQSENT,
SYNDONP_TEMPOPENPREPPPROP,
SYNIOEMPTY_DONP,
SYNAANNP_HETTHATSENT,
SYNAANNP_HETOPENOMTESENT,
SYNAANNP_HETOPENTESENT,
SYNAANNP_HETQSENT,
SYNIOEMPTY_HETTHATSENT,
SYNAANNP_QSENT,
SYNIOEMPTY_HETQSENT,
SYNIONP_HETQSENT,
SYNIOEMPTY_HETOPENOMTESENT,
SYNDONP_PREPEMPTY,
VPID1,
VPID2,
VPID3,
VPID7,
VPID4,
VPID10,
VPID6,
VPID11,
VPID14,
VPID15,
VPID16,
VPID21,
VPID22,
VPID25,
VPID30,
VPID31,
VPID87]
END;
 FUNCTION LSAUXDOM_OBJADJPS:LSDOMAINT_SYNPATTERNSETTYPE;
BEGIN
LSAUXDOM_OBJADJPS:=
[SYNNP,
SYNAANNP_DONP,
SYNIONP_DONP,
SYNMEASUREPHRASE]
END;
 FUNCTION LSAUXDOM_OBLVRVPS:LSDOMAINT_SYNPATTERNSETTYPE;
BEGIN
LSAUXDOM_OBLVRVPS:=
[SYNCLOSEDINFSENT,
SYNCLOSEDTESENT,
SYNOPENINFSENT,
SYNEMPTY_CLOSEDTESENT,
SYNDOORACTIVE,
SYNAANACTIVE,
SYNIONP_OPENINFSENT,
SYNDONP_OPENINFSENT,
VPID8,
VPID9,
VPID12]
END;
 FUNCTION LSAUXDOM_OMTEINFCOMPLADJPS:LSDOMAINT_SYNPATTERNSETTYPE;
BEGIN
LSAUXDOM_OMTEINFCOMPLADJPS:=
[SYNAANNP_HETOPENOMTESENT,
SYNHETOPENOMTESENT,
SYNAANNP_OPENOMTESENT,
SYNIONP_HETOPENOMTESENT,
SYNIONP_OPENOMTESENT,
SYNOPENOMTESENT,
SYNPREPOPENOMTESENT,
SYNPAPREPOPENOMTESENT]
END;
 FUNCTION LSAUXDOM_OPENSENTVPS:LSDOMAINT_SYNPATTERNSETTYPE;
BEGIN
LSAUXDOM_OPENSENTVPS:=
[SYNAANNP_HETOPENOMTESENT,
SYNAANNP_HETOPENTESENT,
SYNAANNP_OPENOMTESENT,
SYNAANNP_OPENTESENT,
SYNDONP_OPENOMTESENT,
SYNDONP_OPENTESENT,
SYNDONP_PREPOPENOMTESENT,
SYNEMPTY_HETOPENOMTESENT,
SYNEMPTY_HETOPENTESENT,
SYNEMPTY_OPENOMTESENT,
SYNEMPTY_OPENTESENT,
SYNHETOPENOMTESENT,
SYNHETOPENTESENT,
SYNIONP_HETOPENOMTESENT,
SYNIONP_HETOPENTESENT,
SYNIONP_OPENOMTESENT,
SYNIONP_OPENTESENT,
SYNOPENINFSENT,
SYNIONP_OPENINFSENT,
SYNOPENOMTESENT,
SYNOPENTESENT,
SYNOPENVERBPPROP,
SYNPREPOPENOMTESENT,
SYNPREPOPENTESENT,
SYNPREPEMPTY_PREPOPENOMTESENT,
SYNPREPNP_OPENOMTESENT,
SYNPREPNP_PREPOPENOMTESENT,
SYNPREPOPENINFSENT,
SYNDONP_PREPOPENTESENT,
SYNDONP_OPENINFSENT,
SYNDONP_PREPOPENTESENT]
END;
 FUNCTION LSAUXDOM_OPENXPPVPS:LSDOMAINT_SYNPATTERNSETTYPE;
BEGIN
LSAUXDOM_OPENXPPVPS:=
[SYNDONP_OTHEROPENPREPPPROP,
SYNDONP_OPENNPPROP,
SYNDONP_PREPOPENNPPROP,
SYNDIROPENPREPPPROP,
SYNDONP_OPENADJPPROP,
SYNDONP_DIROPENPREPPPROP,
SYNDONP_LOCOPENPREPPPROP,
SYNEMPTY_MEASUREPHRASE,
SYNIONP_MEASUREPHRASE,
SYNLOCOPENPREPPPROP,
SYNMEASUREPHRASE,
SYNOPENADJPPROP,
SYNOPENNPPROP,
SYNOPENVERBPPROP,
SYNPREPOPENNPPROP,
SYNTHATSENT_LOCOPENPREPPPROP,
SYNTEMPOPENPREPPPROP,
SYNDONP_TEMPOPENPREPPPROP,
VPID5,
VPID7,
VPID11,
VPID13,
VPID16,
VPID21,
VPID30,
VPID87]
END;
 FUNCTION LSAUXDOM_OTHERPREPSUBCS:LSDOMAINT_PREPSUBCSETTYPE;
BEGIN
LSAUXDOM_OTHERPREPSUBCS:=
[OTHER]
END;
 FUNCTION LSAUXDOM_OTHERADVSUBCS:LSDOMAINT_ADVSUBCSETTYPE;
BEGIN
LSAUXDOM_OTHERADVSUBCS:=
[OTHERADV]
END;
 FUNCTION LSAUXDOM_OUTSIDEVPADVRELS:SETOFSYNREL;
BEGIN
LSAUXDOM_OUTSIDEVPADVRELS:=
[AGVPADVREL,
CAUSADVREL,
LOCADVREL,
NEGREL,
POSREL,
SENTADVREL,
SUBJVPADVREL,
TEMPADVREL]
END;
 FUNCTION LSAUXDOM_OUTSIDEVPRELS:SETOFSYNREL;
BEGIN
LSAUXDOM_OUTSIDEVPRELS:=
[AGVPADVREL,
CAUSADVREL,
CONJREL,
FIRSTCLREL,
ERPOSREL,
ERQREL,
EXTRAPOSREL,
GLUEREL,
HETCLREL,
SECONDCLREL,
LEFTDISLOCREL,
LOCADVREL,
NEGREL,
POSREL,
POSTSUBJREL,
PREADVREL,
PUNCREL,
REFLREL,
RESULTREL,
SENTADVREL,
SHIFTREL,
SUBJREL,
SUBJVPADVREL,
TEMPADVREL]
END;
 FUNCTION LSAUXDOM_PAADJPS:LSDOMAINT_SYNPATTERNSETTYPE;
BEGIN
LSAUXDOM_PAADJPS:=
[SYNPAPREPOPENOMTESENT,
SYNPAPREPOPENTESENT,
SYNPAPREPQSENT,
SYNPAPREPTHATSENT,
SYNPOSTADJPREPNP]
END;
 FUNCTION LSAUXDOM_POIDVPS:LSDOMAINT_SYNPATTERNSETTYPE;
BEGIN
LSAUXDOM_POIDVPS:=
[VPID22,
VPID31]
END;
 FUNCTION LSAUXDOM_POPREDVPS:LSDOMAINT_SYNPATTERNSETTYPE;
BEGIN
LSAUXDOM_POPREDVPS:=
[SYNDONP_PREPOPENNPPROP,
SYNIONP_PREPCLOSEDADJPPROP,
SYNPREPCLOSEDADJPPROP,
SYNPREPCLOSEDNPPROP,
SYNPREPEMPTY,
SYNPREPOPENNPPROP,
VPID31]
END;
 FUNCTION LSAUXDOM_POSTVERBRELS:SETOFSYNREL;
BEGIN
LSAUXDOM_POSTVERBRELS:=
[POSTVPOREL,
POSTVERBREL]
END;
 FUNCTION LSAUXDOM_POSTVPRELS:SETOFSYNREL;
BEGIN
LSAUXDOM_POSTVPRELS:=
[ASCOMPLREL,
EXTRAPOSREL,
GLUEREL,
PUNCREL,
RELSENTREL,
RESULTREL,
SPOSTVERBREL,
THANCOMPLREL]
END;
 FUNCTION LSAUXDOM_PP120PPS:LSDOMAINT_SYNPATTERNSETTYPE;
BEGIN
LSAUXDOM_PP120PPS:=
[SYNNP,
SYNLOCPREPP,
SYNTHATSENT,
SYNOPENTESENT,
SYNOPENNPPROP,
VPID17,
VPID18,
VPID19,
VPID20]
END;
 FUNCTION LSAUXDOM_PREAANOBJRELS:SETOFSYNREL;
BEGIN
LSAUXDOM_PREAANOBJRELS:=
[LOCADVREL,
TEMPADVREL,
CAUSADVREL,
NEGREL,
LOCARGREL]
END;
 FUNCTION LSAUXDOM_PREERPOSRELS:SETOFSYNREL;
BEGIN
LSAUXDOM_PREERPOSRELS:=
[LEFTDISLOCREL,
SHIFTREL,
SUBJREL,
HETCLREL,
SECONDCLREL,
FIRSTCLREL,
REFLREL,
PREADVREL,
ERQREL]
END;
 FUNCTION LSAUXDOM_PREERXPOSRELS:SETOFSYNREL;
BEGIN
LSAUXDOM_PREERXPOSRELS:=
[LEFTDISLOCREL,
SHIFTREL,
SUBJREL,
HETCLREL,
SECONDCLREL,
FIRSTCLREL,
ERQREL]
END;
 FUNCTION LSAUXDOM_PREINDOBJRELS:SETOFSYNREL;
BEGIN
LSAUXDOM_PREINDOBJRELS:=
[AGVPADVREL,
SUBJVPADVREL,
VPADVREL,
BYOBJREL]
END;
 FUNCTION LSAUXDOM_PRELOCADVRELS:SETOFSYNREL;
BEGIN
LSAUXDOM_PRELOCADVRELS:=
[SUBJREL,
LEFTDISLOCREL,
SHIFTREL,
CONJREL,
ERPOSREL,
ERQREL,
REFLREL,
FIRSTCLREL,
SECONDCLREL,
PREADVREL,
TEMPADVREL,
SENTADVREL]
END;
 FUNCTION LSAUXDOM_PREOBJRELS:SETOFSYNREL;
BEGIN
LSAUXDOM_PREOBJRELS:=
[AGVPADVREL,
SUBJVPADVREL,
VPADVREL,
AANOBJREL,
BYOBJREL,
INDOBJREL,
VOOROBJREL]
END;
 FUNCTION LSAUXDOM_PREPEMPTYVPS:LSDOMAINT_SYNPATTERNSETTYPE;
BEGIN
LSAUXDOM_PREPEMPTYVPS:=
[SYNPREPEMPTY,
SYNEMPTY_PREPEMPTY,
SYNPREPEMPTY_PREPEMPTY,
SYNPREPEMPTY_PREPTHATSENT,
SYNDONP_PREPEMPTY,
SYNPREPEMPTY_PREPNP,
SYNPREPEMPTY_PREPOPENOMTESENT,
SYNPREPNP_PREPEMPTY]
END;
 FUNCTION LSAUXDOM_PREPREADVRELS:SETOFSYNREL;
BEGIN
LSAUXDOM_PREPREADVRELS:=
[SHIFTREL,
LEFTDISLOCREL,
SUBJREL,
REFLREL,
FIRSTCLREL,
SECONDCLREL,
CONJREL]
END;
 FUNCTION LSAUXDOM_PREPOSTSUBJRELS:SETOFSYNREL;
BEGIN
LSAUXDOM_PREPOSTSUBJRELS:=
[CONJREL,
LEFTDISLOCREL,
SHIFTREL,
SENTADVREL,
ERPOSREL,
ERQREL,
TEMPADVREL]
END;
 FUNCTION LSAUXDOM_PRETEMPADVRELS:SETOFSYNREL;
BEGIN
LSAUXDOM_PRETEMPADVRELS:=
[SUBJREL,
LEFTDISLOCREL,
SHIFTREL,
CONJREL,
ERPOSREL,
ERQREL,
REFLREL,
FIRSTCLREL,
SECONDCLREL,
SENTADVREL]
END;
 FUNCTION LSAUXDOM_PREPOBJVPS:LSDOMAINT_SYNPATTERNSETTYPE;
BEGIN
LSAUXDOM_PREPOBJVPS:=
[SYNDONP_PREPNP,
SYNDONP_PREPOPENNPPROP,
SYNDONP_PREPOPENOMTESENT,
SYNDONP_PREPOPENTESENT,
SYNDONP_PREPPROSENT,
SYNIONP_PREPCLOSEDADJPPROP,
SYNPREPCLOSEDADJPPROP,
SYNPREPCLOSEDNPPROP,
SYNPREPNP,
SYNPREPEMPTY_PREPNP,
SYNPREPNP_PREPEMPTY,
SYNPREPNP_PREPNP,
SYNPREPOPENNPPROP,
SYNPREPOPENOMTESENT,
SYNPREPOPENTESENT,
SYNPREPQSENT,
SYNPREPTHATSENT,
SYNDONP_PREPTHATSENT,
SYNEMPTY_PREPNP,
SYNPREPEMPTY_PREPOPENOMTESENT,
SYNPREPEMPTY_PREPTHATSENT,
SYNIONP_PREPNP,
SYNPREPNP_OPENOMTESENT,
SYNPREPNP_PREPOPENOMTESENT,
SYNPREPNP_PREPTHATSENT,
SYNPREPNP_QSENT,
SYNPREPNP_THATSENT,
SYNPREPOPENINFSENT,
VPID22,
VPID31]
END;
 FUNCTION LSAUXDOM_ALSOEMPTYPREPOBJVPS:LSDOMAINT_SYNPATTERNSETTYPE;
BEGIN
LSAUXDOM_ALSOEMPTYPREPOBJVPS:=
[SYNDONP_PREPNP,
SYNDONP_PREPOPENNPPROP,
SYNDONP_PREPOPENOMTESENT,
SYNDONP_PREPOPENTESENT,
SYNDONP_PREPPROSENT,
SYNIONP_PREPCLOSEDADJPPROP,
SYNPREPCLOSEDADJPPROP,
SYNPREPCLOSEDNPPROP,
SYNPREPEMPTY,
SYNPREPNP,
SYNPREPNP_PREPNP,
SYNPREPOPENNPPROP,
SYNPREPOPENOMTESENT,
SYNPREPOPENTESENT,
SYNPREPQSENT,
SYNPREPTHATSENT,
SYNDONP_PREPEMPTY,
SYNDONP_PREPTHATSENT,
SYNEMPTY_PREPEMPTY,
SYNEMPTY_PREPNP,
SYNIONP_PREPNP,
SYNPREPEMPTY_PREPEMPTY,
SYNPREPEMPTY_PREPNP,
SYNPREPEMPTY_PREPOPENOMTESENT,
SYNPREPEMPTY_PREPTHATSENT,
SYNPREPNP_OPENOMTESENT,
SYNPREPNP_PREPEMPTY,
SYNPREPNP_PREPOPENOMTESENT,
SYNPREPNP_PREPTHATSENT,
SYNPREPNP_QSENT,
SYNPREPNP_THATSENT,
SYNPREPOPENINFSENT,
VPID22,
VPID31]
END;
 FUNCTION LSAUXDOM_PREPOBJADJPS:LSDOMAINT_SYNPATTERNSETTYPE;
BEGIN
LSAUXDOM_PREPOBJADJPS:=
[SYNPREPNP,
SYNPREPNP_PREPNP,
SYNPATHPREPP,
SYNPREPOPENOMTESENT,
SYNPREPOPENTESENT,
SYNPREPQSENT,
SYNPREPTHATSENT]
END;
 FUNCTION LSAUXDOM_PREPPREPOBJRELS:SETOFSYNREL;
BEGIN
LSAUXDOM_PREPPREPOBJRELS:=
[LOCADVREL,
TEMPADVREL,
CAUSADVREL,
NEGREL,
LOCARGREL,
DEGREEMODREL,
INDOBJREL,
OBJREL,
VOOROBJREL]
END;
 FUNCTION LSAUXDOM_PREPREPOBJVPS:LSDOMAINT_SYNPATTERNSETTYPE;
BEGIN
LSAUXDOM_PREPREPOBJVPS:=
[SYNPREPNP_PREPNP,
SYNPREPNP_PREPOPENOMTESENT,
SYNPREPNP_PREPTHATSENT]
END;
 FUNCTION LSAUXDOM_PREPPPREDVPS:LSDOMAINT_SYNPATTERNSETTYPE;
BEGIN
LSAUXDOM_PREPPPREDVPS:=
[SYNEMPTY_OTHERCLOSEDPREPPPROP,
SYNIONP_OTHERCLOSEDPREPPPROP,
SYNOTHERCLOSEDPREPPPROP,
SYNZIJN,
SYNDONP_OTHEROPENPREPPPROP]
END;
 FUNCTION LSAUXDOM_PREPSENTADJPS:LSDOMAINT_SYNPATTERNSETTYPE;
BEGIN
LSAUXDOM_PREPSENTADJPS:=
[SYNPREPOPENOMTESENT,
SYNPREPOPENTESENT,
SYNPREPQSENT,
SYNPREPTHATSENT,
SYNPAPREPOPENOMTESENT,
SYNPAPREPOPENTESENT,
SYNPAPREPQSENT,
SYNPAPREPTHATSENT]
END;
 FUNCTION LSAUXDOM_PRESENTADVRELS1:SETOFSYNREL;
BEGIN
LSAUXDOM_PRESENTADVRELS1:=
[LEFTDISLOCREL,
SHIFTREL,
SUBJREL,
HETCLREL,
SECONDCLREL,
FIRSTCLREL,
REFLREL]
END;
 FUNCTION LSAUXDOM_PRESENTADVRELS2:SETOFSYNREL;
BEGIN
LSAUXDOM_PRESENTADVRELS2:=
[LEFTDISLOCREL,
SHIFTREL,
SUBJREL,
PREADVREL,
ERQREL,
ERPOSREL,
TEMPADVREL,
DEFRADVREL,
HETCLREL,
SECONDCLREL,
FIRSTCLREL,
REFLREL]
END;
 FUNCTION LSAUXDOM_PRESUBJRELS:SETOFSYNREL;
BEGIN
LSAUXDOM_PRESUBJRELS:=
[LEFTDISLOCREL,
SHIFTREL,
CONJREL]
END;
 FUNCTION LSAUXDOM_PREVERBRELS:SETOFSYNREL;
BEGIN
LSAUXDOM_PREVERBRELS:=
[AANOBJREL,
AGVPADVREL,
ARGREL,
BYOBJREL,
COMPLREL,
DIRARGREL,
GLUEREL,
IDREL,
INDOBJREL,
INSTRADVREL,
LOCARGREL,
MELTNEGREL,
OBJREL,
PARTREL,
PREDREL,
PREPOBJREL,
PUNCREL,
SUBJVPADVREL,
STRANDEDREL,
VOOROBJREL,
VPADVREL]
END;
 FUNCTION LSAUXDOM_PREVPRELS:SETOFSYNREL;
BEGIN
LSAUXDOM_PREVPRELS:=
[AGVPADVREL,
CAUSADVREL,
CONJREL,
DEFRADVREL,
ERPOSREL,
ERQREL,
FIRSTCLREL,
GLUEREL,
HETCLREL,
LEFTDISLOCREL,
LOCADVREL,
MELTNEGREL,
MODREL,
NEGREL,
POSREL,
POSTSUBJREL,
PREADVREL,
PUNCREL,
REFLREL,
SECONDCLREL,
SENTADVREL,
SHIFTREL,
SUBJREL,
SUBJVPADVREL,
TEMPADVREL]
END;
 FUNCTION LSAUXDOM_PROPIDVPS:LSDOMAINT_SYNPATTERNSETTYPE;
BEGIN
LSAUXDOM_PROPIDVPS:=
[VPID5,
VPID7,
VPID8,
VPID9,
VPID11,
VPID12,
VPID13,
VPID14,
VPID15,
VPID16,
VPID21,
VPID30,
VPID31,
VPID87]
END;
 FUNCTION LSAUXDOM_PROPVARCATS:SETOFSYNTCAT;
BEGIN
LSAUXDOM_PROPVARCATS:=
[ADJPPROPVAR,
ADVPPROPVAR,
NPPROPVAR,
PREPPPROPVAR,
SENTENCEVAR,
VERBPPROPVAR,
CLAUSEVAR]
END;
 FUNCTION LSAUXDOM_PROSENTVPS:LSDOMAINT_SYNPATTERNSETTYPE;
BEGIN
LSAUXDOM_PROSENTVPS:=
[SYNAANNP_PROSENT,
SYNEMPTY_PROSENT,
SYNIONP_PROSENT,
SYNPROSENT]
END;
 FUNCTION LSAUXDOM_SOPROSENTVPS:LSDOMAINT_SYNPATTERNSETTYPE;
BEGIN
LSAUXDOM_SOPROSENTVPS:=
[SYNIONP_SOPROSENT,
SYNSOPROSENT]
END;
 FUNCTION LSAUXDOM_PREPPROSENTVPS:LSDOMAINT_SYNPATTERNSETTYPE;
BEGIN
LSAUXDOM_PREPPROSENTVPS:=
[SYNDONP_PREPPROSENT]
END;
 FUNCTION LSAUXDOM_QCOMPLVPS:LSDOMAINT_SYNPATTERNSETTYPE;
BEGIN
LSAUXDOM_QCOMPLVPS:=
[SYNAANNP_QSENT,
SYNEMPTY_QSENT,
SYNIONP_QSENT,
SYNPREPQSENT,
SYNQSENT,
SYNHETQSENT,
SYNAANNP_HETQSENT,
SYNIOEMPTY_HETQSENT]
END;
 FUNCTION LSAUXDOM_RAISINGSENTVPS:LSDOMAINT_SYNPATTERNSETTYPE;
BEGIN
LSAUXDOM_RAISINGSENTVPS:=
[SYNEMPTY_CLOSEDTESENT,
SYNCLOSEDINFSENT,
SYNCLOSEDTESENT]
END;
 FUNCTION LSAUXDOM_RAISINGVPS:LSDOMAINT_SYNPATTERNSETTYPE;
BEGIN
LSAUXDOM_RAISINGVPS:=
[SYNEMPTY_CLOSEDADJPPROP,
SYNEMPTY_CLOSEDNPPROP,
SYNEMPTY_CLOSEDTESENT,
SYNEMPTY_OTHERCLOSEDPREPPPROP,
SYNIONP_CLOSEDADJPPROP,
SYNIONP_CLOSEDNPPROP,
SYNIONP_OTHERCLOSEDPREPPPROP,
SYNIONP_PREPCLOSEDADJPPROP,
SYNCLOSEDADJPPROP,
SYNCLOSEDINFSENT,
SYNCLOSEDNPPROP,
SYNCLOSEDTESENT,
SYNCLOSEDVERBPPROP,
SYNDIRCLOSEDPREPPPROP,
SYNLOCCLOSEDPREPPPROP,
SYNOTHERCLOSEDPREPPPROP,
SYNPREPCLOSEDADJPPROP,
SYNPREPCLOSEDNPPROP,
VPID31]
END;
 FUNCTION LSAUXDOM_SENTADJPS:LSDOMAINT_SYNPATTERNSETTYPE;
BEGIN
LSAUXDOM_SENTADJPS:=
[SYNPREPOPENOMTESENT,
SYNPREPOPENTESENT,
SYNPREPQSENT,
SYNPREPTHATSENT,
SYNPAPREPOPENOMTESENT,
SYNPAPREPOPENTESENT,
SYNPAPREPQSENT,
SYNPAPREPTHATSENT,
SYNOPENOMTESENT,
SYNOPENTESENT,
SYNQSENT,
SYNTHATSENT]
END;
 FUNCTION LSAUXDOM_SENTENCERELS:SETOFSYNREL;
BEGIN
LSAUXDOM_SENTENCERELS:=
[COMPLREL,
PREPOBJREL,
LEFTDISLOCREL,
SUBJREL,
EXTRAPOSREL,
POSTSENTADVREL,
POSTADJREL,
OMTEMODREL]
END;
 FUNCTION LSAUXDOM_SENTVPS:LSDOMAINT_SYNPATTERNSETTYPE;
BEGIN
LSAUXDOM_SENTVPS:=
[SYNAANNP_OPENOMTESENT,
SYNAANNP_OPENTESENT,
SYNAANNP_HETOPENOMTESENT,
SYNDONP_OPENTESENT,
SYNDONP_OPENOMTESENT,
SYNDONP_OPENINFSENT,
SYNEMPTY_CLOSEDTESENT,
SYNEMPTY_HETOPENTESENT,
SYNEMPTY_OPENOMTESENT,
SYNEMPTY_OPENTESENT,
SYNHETOPENOMTESENT,
SYNHETOPENTESENT,
SYNIONP_HETOPENOMTESENT,
SYNIONP_OPENTESENT,
SYNIONP_OPENINFSENT,
SYNOPENINFSENT,
SYNOPENOMTESENT,
SYNOPENTESENT,
SYNPREPOPENTESENT,
SYNCLOSEDINFSENT,
SYNCLOSEDTESENT,
SYNDOORACTIVE,
SYNAANACTIVE,
SYNPREPNP_OPENOMTESENT,
SYNDONP_PREPOPENTESENT,
SYNDONP_PREPOPENOMTESENT,
VPID8,
VPID9,
VPID12]
END;
 FUNCTION LSAUXDOM_SUBJNODETIDVPS:LSDOMAINT_SYNPATTERNSETTYPE;
BEGIN
LSAUXDOM_SUBJNODETIDVPS:=
[]
END;
 FUNCTION LSAUXDOM_TEINFCOMPLADJPS:LSDOMAINT_SYNPATTERNSETTYPE;
BEGIN
LSAUXDOM_TEINFCOMPLADJPS:=
[SYNOPENOMTESENT]
END;
 FUNCTION LSAUXDOM_TEINFCOMPLVPS:LSDOMAINT_SYNPATTERNSETTYPE;
BEGIN
LSAUXDOM_TEINFCOMPLVPS:=
[SYNAANNP_OPENOMTESENT,
SYNAANNP_OPENTESENT,
SYNAANNP_HETOPENOMTESENT,
SYNAANNP_HETOPENTESENT,
SYNDONP_OPENTESENT,
SYNDONP_OPENOMTESENT,
SYNEMPTY_HETOPENTESENT,
SYNEMPTY_OPENOMTESENT,
SYNEMPTY_OPENTESENT,
SYNHETOPENOMTESENT,
SYNHETOPENTESENT,
SYNIONP_HETOPENOMTESENT,
SYNIONP_OPENOMTESENT,
SYNIONP_OPENTESENT,
SYNOPENOMTESENT,
SYNOPENTESENT,
SYNPREPOPENTESENT,
SYNCLOSEDTESENT,
SYNEMPTY_CLOSEDTESENT,
SYNPREPEMPTY_PREPOPENOMTESENT,
SYNPREPNP_OPENOMTESENT,
SYNPREPNP_PREPOPENOMTESENT,
SYNDONP_PREPOPENTESENT,
SYNDONP_PREPOPENOMTESENT]
END;
 FUNCTION LSAUXDOM_SUBJIDVPS:LSDOMAINT_SYNPATTERNSETTYPE;
BEGIN
LSAUXDOM_SUBJIDVPS:=
[]
END;
 FUNCTION LSAUXDOM_SPECIALNPS:SETOFNPHEADTYPE;
BEGIN
LSAUXDOM_SPECIALNPS:=
[HETNP,
DITNP,
ELKAARNP,
ZICHZELFNP,
DATNP,
JEGENNP,
ZEGENNP,
ECNP]
END;
 FUNCTION LSAUXDOM_TEMPDEPCOMPLVPS:LSDOMAINT_SYNPATTERNSETTYPE;
BEGIN
LSAUXDOM_TEMPDEPCOMPLVPS:=
[SYNAANNP_OPENOMTESENT,
SYNAANNP_OPENTESENT,
SYNAANNP_QSENT,
SYNAANNP_THATSENT,
SYNASIFCLOSEDADJPPROP,
SYNDONP_OPENTESENT,
SYNDONP_OPENOMTESENT,
SYNEMPTY_CLOSEDTESENT,
SYNEMPTY_HETOPENTESENT,
SYNEMPTY_HETTHATSENT,
SYNIOEMPTY_HETTHATSENT,
SYNEMPTY_OPENOMTESENT,
SYNEMPTY_OPENTESENT,
SYNIOEMPTY_OPENOMTESENT,
SYNIOEMPTY_HETOPENOMTESENT,
SYNEMPTY_QSENT,
SYNEMPTY_THATSENT,
SYNIOEMPTY_QSENT,
SYNIOEMPTY_THATSENT,
SYNIOEMPTY_HETTHATSENT,
SYNIOEMPTY_HETQSENT,
SYNHETOPENOMTESENT,
SYNHETOPENTESENT,
SYNHETTHATSENT,
SYNIONP_HETOPENOMTESENT,
SYNIONP_HETTHATSENT,
SYNIONP_OPENTESENT,
SYNIONP_OPENOMTESENT,
SYNIONP_QSENT,
SYNIONP_THATSENT,
SYNOPENOMTESENT,
SYNOPENTESENT,
SYNPREPOPENTESENT,
SYNPREPQSENT,
SYNPREPTHATSENT,
SYNQSENT,
SYNTHATSENT,
SYNCLOSEDINFSENT,
SYNCLOSEDTESENT,
SYNOPENINFSENT,
SYNIONP_OPENINFSENT,
SYNDONP_OPENINFSENT,
SYNHETASIFCLOSEDADJPPROP,
SYNTHATSENT_LOCOPENPREPPPROP,
SYNDOORACTIVE,
SYNAANACTIVE,
SYNCLOSEDVERBPPROP,
SYNDONP_PREPTHATSENT,
SYNDONP_THATSENT,
SYNHETIFSENT,
SYNHETQSENT,
SYNPREPNP_PREPTHATSENT,
SYNPREPEMPTY_PREPTHATSENT,
SYNPREPNP_THATSENT,
SYNZIJN,
SYNDONP_PREPOPENOMTESENT,
SYNDONP_PREPOPENTESENT,
SYNAANNP_HETOPENTESENT,
SYNAANNP_HETQSENT,
SYNPREPEMPTY_PREPOPENOMTESENT,
SYNPREPNP_PREPOPENOMTESENT,
SYNIOEMPTY_HETQSENT,
SYNPREPNP_OPENOMTESENT,
SYNPREPNP_QSENT,
VPID8,
VPID9,
VPID12]
END;
 FUNCTION LSAUXDOM_TEMPINDEPCOMPLVPS:LSDOMAINT_SYNPATTERNSETTYPE;
BEGIN
LSAUXDOM_TEMPINDEPCOMPLVPS:=
[SYNAANNP_OPENTESENT,
SYNAANNP_QSENT,
SYNAANNP_THATSENT,
SYNASIFCLOSEDADJPPROP,
SYNDONP_OPENTESENT,
SYNEMPTY_CLOSEDTESENT,
SYNEMPTY_HETOPENTESENT,
SYNEMPTY_HETTHATSENT,
SYNIOEMPTY_HETTHATSENT,
SYNIOEMPTY_HETQSENT,
SYNEMPTY_OPENTESENT,
SYNEMPTY_QSENT,
SYNEMPTY_THATSENT,
SYNIOEMPTY_QSENT,
SYNIOEMPTY_THATSENT,
SYNIOEMPTY_OPENOMTESENT,
SYNIOEMPTY_HETOPENOMTESENT,
SYNHETOPENTESENT,
SYNHETTHATSENT,
SYNIONP_HETTHATSENT,
SYNIONP_OPENTESENT,
SYNIONP_QSENT,
SYNIONP_THATSENT,
SYNOPENTESENT,
SYNPREPOPENTESENT,
SYNPREPQSENT,
SYNPREPTHATSENT,
SYNQSENT,
SYNTHATSENT,
SYNCLOSEDINFSENT,
SYNCLOSEDTESENT,
SYNOPENINFSENT,
SYNHETASIFCLOSEDADJPPROP,
SYNTHATSENT_LOCOPENPREPPPROP,
SYNDOORACTIVE,
SYNAANACTIVE,
SYNDONP_PREPOPENTESENT,
SYNDONP_PREPTHATSENT,
SYNDONP_THATSENT,
SYNHETIFSENT,
SYNHETQSENT,
SYNPREPNP_PREPTHATSENT,
SYNPREPEMPTY_PREPTHATSENT,
SYNPREPNP_THATSENT,
SYNZIJN,
SYNDONP_PREPOPENOMTESENT,
SYNAANNP_HETOPENTESENT,
SYNAANNP_HETQSENT,
SYNPREPEMPTY_PREPOPENOMTESENT,
SYNPREPNP_PREPOPENOMTESENT,
SYNIOEMPTY_HETQSENT,
SYNPREPNP_OPENOMTESENT,
SYNPREPNP_QSENT,
VPID8,
VPID9,
VPID12]
END;
 FUNCTION LSAUXDOM_TWOPREPOBJVPS:LSDOMAINT_SYNPATTERNSETTYPE;
BEGIN
LSAUXDOM_TWOPREPOBJVPS:=
[SYNPREPNP_PREPNP,
SYNPREPEMPTY_PREPNP,
SYNPREPEMPTY_PREPOPENOMTESENT,
SYNPREPEMPTY_PREPTHATSENT,
SYNPREPNP_PREPEMPTY,
SYNPREPNP_PREPOPENOMTESENT,
SYNPREPNP_PREPTHATSENT]
END;
 FUNCTION LSAUXDOM_UNIQUERELS:SETOFSYNREL;
BEGIN
LSAUXDOM_UNIQUERELS:=
[AANOBJREL,
ADJOINREL,
AUXREL,
BYOBJREL,
COMPLREL,
DEFRADVREL,
DIRARGREL,
ERPOSREL,
ERQREL,
ERREL,
EXTRAPOSREL,
FIRSTCLREL,
HEAD,
HETCLREL,
IDREL,
INDOBJREL,
LEFTDISLOCREL,
LOCARGREL,
NEGREL,
OBJREL,
PARTREL,
POSREL,
POSTSENTADVREL,
POSTTEMPREL,
POSTSUBJREL,
PREDREL,
PROGAUXREL,
REFLREL,
RELSENTREL,
RESULTREL,
SECONDCLREL,
SHIFTREL,
SUBJREL,
TEREL,
VOOROBJREL]
END;
 FUNCTION LSAUXDOM_VARCATSET:SETOFSYNTCAT;
BEGIN
LSAUXDOM_VARCATSET:=
[ADJPPROPVAR,
ADVPPROPVAR,
NPPROPVAR,
PREPPPROPVAR,
NPVAR,
SENTENCEVAR,
EMPTYVAR,
VERBPPROPVAR,
CNVAR,
PROSENTVAR,
CLAUSEVAR,
ADVPVAR,
PREPPVAR,
POSVAR,
NEGVAR]
END;
 FUNCTION LSAUXDOM_VOOROBJVPS:LSDOMAINT_SYNPATTERNSETTYPE;
BEGIN
LSAUXDOM_VOOROBJVPS:=
[SYNVOORNP_DONP]
END;
 FUNCTION LSAUXDOM_VOOROBJADJPS:LSDOMAINT_SYNPATTERNSETTYPE;
BEGIN
LSAUXDOM_VOOROBJADJPS:=
[SYNVOORNP_DONP,
SYNVOORNP]
END;
 FUNCTION LSAUXDOM_VPCOMPLVPS:LSDOMAINT_SYNPATTERNSETTYPE;
BEGIN
LSAUXDOM_VPCOMPLVPS:=
[SYNCLOSEDVERBPPROP]
END;
 FUNCTION LSAUXDOM_VP000VPS:LSDOMAINT_SYNPATTERNSETTYPE;
BEGIN
LSAUXDOM_VP000VPS:=
[SYNNOVPARGS]
END;
 FUNCTION LSAUXDOM_VP100VPS:LSDOMAINT_SYNPATTERNSETTYPE;
BEGIN
LSAUXDOM_VP100VPS:=
[SYNNOVPARGS]
END;
 FUNCTION LSAUXDOM_VP010VPS:LSDOMAINT_SYNPATTERNSETTYPE;
BEGIN
LSAUXDOM_VP010VPS:=
[SYNASIFCLOSEDADJPPROP,
SYNCLOSEDADJPPROP,
SYNCLOSEDINFSENT,
SYNCLOSEDNPPROP,
SYNCLOSEDTESENT,
SYNCLOSEDVERBPPROP,
SYNDIRCLOSEDPREPPPROP,
SYNHETASIFCLOSEDADJPPROP,
SYNHETTHATSENT,
SYNLOCCLOSEDPREPPPROP,
SYNNP,
SYNOTHERCLOSEDPREPPPROP,
SYNPREPCLOSEDADJPPROP,
SYNPREPCLOSEDNPPROP,
SYNPREPNP,
SYNPREPQSENT,
SYNPREPTHATSENT,
SYNPROSENT,
SYNQSENT,
SYNTHATSENT,
SYNHETIFSENT,
SYNHETQSENT,
SYNSOPROSENT,
VPID14,
VPID15]
END;
 FUNCTION LSAUXDOM_VP120VPS:LSDOMAINT_SYNPATTERNSETTYPE;
BEGIN
LSAUXDOM_VP120VPS:=
[SYNASIFCLOSEDADJPPROP,
SYNCLOSEDADJPPROP,
SYNCLOSEDINFSENT,
SYNCLOSEDNPPROP,
SYNCLOSEDTESENT,
SYNCLOSEDVERBPPROP,
SYNDIRCLOSEDPREPPPROP,
SYNDIROPENPREPPPROP,
SYNEMPTY,
SYNHETASIFCLOSEDADJPPROP,
SYNHETOPENOMTESENT,
SYNHETOPENTESENT,
SYNHETTHATSENT,
SYNLOCCLOSEDPREPPPROP,
SYNLOCOPENPREPPPROP,
SYNMEASUREPHRASE,
SYNNP,
SYNOPENADJPPROP,
SYNOPENINFSENT,
SYNOPENNPPROP,
SYNOPENOMTESENT,
SYNOPENTESENT,
SYNOPENVERBPPROP,
SYNOTHERCLOSEDPREPPPROP,
SYNPREPCLOSEDADJPPROP,
SYNPREPCLOSEDNPPROP,
SYNPREPEMPTY,
SYNPREPNP,
SYNPREPOPENNPPROP,
SYNPREPOPENOMTESENT,
SYNPREPOPENTESENT,
SYNPREPQSENT,
SYNPREPTHATSENT,
SYNPROSENT,
SYNSOPROSENT,
SYNQSENT,
SYNTHATSENT,
SYNAANACTIVE,
SYNDOORACTIVE,
SYNDIREMPTY,
SYNHETIFSENT,
SYNHETQSENT,
SYNTEMPOPENPREPPPROP,
SYNPREPOPENINFSENT,
VPID1,
VPID4,
VPID5,
VPID6,
VPID9,
VPID8,
VPID10,
VPID12,
VPID13,
VPID14,
VPID15,
VPID25,
VPID31]
END;
 FUNCTION LSAUXDOM_VP123VPS:LSDOMAINT_SYNPATTERNSETTYPE;
BEGIN
LSAUXDOM_VP123VPS:=
[SYNAANNP_DONP,
SYNAANNP_HETOPENOMTESENT,
SYNAANNP_HETOPENTESENT,
SYNAANNP_HETQSENT,
SYNAANNP_HETTHATSENT,
SYNAANNP_OPENOMTESENT,
SYNAANNP_OPENTESENT,
SYNAANNP_QSENT,
SYNAANNP_THATSENT,
SYNDONP_DIREMPTY,
SYNDONP_DIROPENPREPPPROP,
SYNDONP_LOCOPENPREPPPROP,
SYNDONP_OPENADJPPROP,
SYNDONP_OPENNPPROP,
SYNDONP_OPENOMTESENT,
SYNDONP_OPENTESENT,
SYNDONP_PREPNP,
SYNDONP_PREPOPENNPPROP,
SYNDONP_PREPOPENOMTESENT,
SYNEMPTY_CLOSEDADJPPROP,
SYNEMPTY_CLOSEDNPPROP,
SYNEMPTY_CLOSEDTESENT,
SYNEMPTY_DONP,
SYNEMPTY_HETOPENOMTESENT,
SYNEMPTY_HETOPENTESENT,
SYNEMPTY_HETTHATSENT,
SYNEMPTY_MEASUREPHRASE,
SYNEMPTY_OPENOMTESENT,
SYNEMPTY_OPENTESENT,
SYNEMPTY_OTHERCLOSEDPREPPPROP,
SYNEMPTY_QSENT,
SYNEMPTY_THATSENT,
SYNIOEMPTY_DONP,
SYNIOEMPTY_HETQSENT,
SYNIOEMPTY_HETTHATSENT,
SYNIOEMPTY_QSENT,
SYNIOEMPTY_THATSENT,
SYNIONP_CLOSEDADJPPROP,
SYNIOEMPTY_OPENOMTESENT,
SYNIOEMPTY_HETOPENOMTESENT,
SYNIONP_CLOSEDNPPROP,
SYNIONP_DONP,
SYNIONP_HETOPENOMTESENT,
SYNIONP_HETOPENTESENT,
SYNIONP_HETQSENT,
SYNIONP_HETTHATSENT,
SYNIONP_MEASUREPHRASE,
SYNIONP_OPENINFSENT,
SYNIONP_OPENOMTESENT,
SYNIONP_OPENTESENT,
SYNIONP_OTHERCLOSEDPREPPPROP,
SYNIONP_PREPCLOSEDADJPPROP,
SYNIONP_QSENT,
SYNIONP_SOPROSENT,
SYNIONP_THATSENT,
SYNPREPNP_PREPNP,
SYNTHATSENT_LOCOPENPREPPPROP,
SYNVOORNP_DONP,
SYNDONP_OPENINFSENT,
SYNDONP_PREPTHATSENT,
SYNDONP_RESULTEMPTY,
SYNDONP_THATSENT,
SYNEMPTY_PREPEMPTY,
SYNEMPTY_PREPNP,
SYNIONP_PREPNP,
SYNIONP_PROSENT,
SYNAANNP_PROSENT,
SYNEMPTY_PROSENT,
SYNPREPEMPTY_PREPEMPTY,
SYNPREPNP_PREPTHATSENT,
SYNPREPEMPTY_PREPTHATSENT,
SYNPREPNP_THATSENT,
SYNDONP_TEMPOPENPREPPPROP,
SYNDONP_OTHEROPENPREPPPROP,
SYNDONP_PREPEMPTY,
SYNIONP_OPENINFSENT,
SYNPREPEMPTY_PREPNP,
SYNPREPEMPTY_PREPOPENOMTESENT,
SYNPREPNP_OPENOMTESENT,
SYNPREPNP_PREPEMPTY,
SYNPREPNP_PREPOPENOMTESENT,
SYNPREPNP_PREPTHATSENT,
SYNPREPNP_QSENT,
SYNDONP_PREPOPENTESENT,
VPID2,
VPID3,
VPID7,
VPID11,
VPID16,
VPID21,
VPID22]
END;
 FUNCTION LSAUXDOM_VP012VPS:LSDOMAINT_SYNPATTERNSETTYPE;
BEGIN
LSAUXDOM_VP012VPS:=
[SYNAANNP_DONP,
SYNAANNP_HETOPENOMTESENT,
SYNAANNP_HETOPENTESENT,
SYNAANNP_HETQSENT,
SYNAANNP_HETTHATSENT,
SYNAANNP_OPENOMTESENT,
SYNAANNP_OPENTESENT,
SYNAANNP_QSENT,
SYNAANNP_THATSENT,
SYNDONP_DIREMPTY,
SYNDONP_DIROPENPREPPPROP,
SYNDONP_LOCOPENPREPPPROP,
SYNDONP_OPENADJPPROP,
SYNDONP_OPENNPPROP,
SYNDONP_OPENOMTESENT,
SYNDONP_OPENTESENT,
SYNDONP_PREPNP,
SYNDONP_PREPOPENNPPROP,
SYNDONP_PREPOPENOMTESENT,
SYNEMPTY_CLOSEDADJPPROP,
SYNEMPTY_CLOSEDNPPROP,
SYNEMPTY_CLOSEDTESENT,
SYNEMPTY_DONP,
SYNEMPTY_HETOPENOMTESENT,
SYNEMPTY_HETOPENTESENT,
SYNEMPTY_HETTHATSENT,
SYNEMPTY_OPENOMTESENT,
SYNEMPTY_OPENTESENT,
SYNEMPTY_OTHERCLOSEDPREPPPROP,
SYNEMPTY_QSENT,
SYNEMPTY_THATSENT,
SYNIOEMPTY_DONP,
SYNIOEMPTY_HETQSENT,
SYNIOEMPTY_HETTHATSENT,
SYNIOEMPTY_QSENT,
SYNIOEMPTY_THATSENT,
SYNIONP_CLOSEDADJPPROP,
SYNIONP_CLOSEDNPPROP,
SYNIONP_DONP,
SYNIONP_HETOPENOMTESENT,
SYNIONP_HETOPENTESENT,
SYNIONP_HETQSENT,
SYNIONP_HETTHATSENT,
SYNIONP_OPENINFSENT,
SYNIONP_OPENOMTESENT,
SYNIONP_OPENTESENT,
SYNIONP_OTHERCLOSEDPREPPPROP,
SYNIONP_PREPCLOSEDADJPPROP,
SYNIONP_QSENT,
SYNIONP_SOPROSENT,
SYNIONP_THATSENT,
SYNPREPNP_PREPNP,
SYNTHATSENT_LOCOPENPREPPPROP,
SYNVOORNP_DONP,
SYNDONP_PREPTHATSENT,
SYNDONP_RESULTEMPTY,
SYNDONP_THATSENT,
SYNEMPTY_PREPEMPTY,
SYNEMPTY_PREPNP,
SYNIONP_PREPNP,
SYNIONP_PROSENT,
SYNAANNP_PROSENT,
SYNEMPTY_PROSENT,
SYNPREPEMPTY_PREPEMPTY,
SYNPREPNP_PREPTHATSENT,
SYNPREPEMPTY_PREPTHATSENT,
SYNPREPNP_THATSENT,
SYNDONP_TEMPOPENPREPPPROP,
SYNDONP_OTHEROPENPREPPPROP,
SYNDONP_PREPEMPTY,
SYNIONP_OPENINFSENT,
SYNPREPEMPTY_PREPNP,
SYNPREPEMPTY_PREPOPENOMTESENT,
SYNPREPNP_OPENOMTESENT,
SYNPREPNP_PREPEMPTY,
SYNPREPNP_PREPOPENOMTESENT,
SYNPREPNP_PREPTHATSENT,
SYNPREPNP_QSENT,
SYNDONP_PREPOPENTESENT,
VPID30,
VPID87]
END;
 FUNCTION LSAUXDOM_VPADVPREPSUBCS:LSDOMAINT_PREPSUBCSETTYPE;
BEGIN
LSAUXDOM_VPADVPREPSUBCS:=
[COMITATIVE,
INSTRUM,
VOOR]
END;
 FUNCTION LSAUXDOM_VRVPS:LSDOMAINT_SYNPATTERNSETTYPE;
BEGIN
LSAUXDOM_VRVPS:=
[SYNCLOSEDINFSENT,
SYNCLOSEDTESENT,
SYNDONP_OPENTESENT,
SYNDONP_OPENOMTESENT,
SYNEMPTY_OPENOMTESENT,
SYNEMPTY_CLOSEDTESENT,
SYNEMPTY_OPENTESENT,
SYNIONP_OPENTESENT,
SYNOPENINFSENT,
SYNIONP_OPENINFSENT,
SYNOPENOMTESENT,
SYNOPENTESENT,
SYNDONP_OPENINFSENT,
SYNDOORACTIVE,
SYNAANACTIVE,
VPID8,
VPID9,
VPID12]
END;
 FUNCTION LSAUXDOM_WRONGVPS:LSDOMAINT_SYNPATTERNSETTYPE;
BEGIN
LSAUXDOM_WRONGVPS:=
[SYNAANNP,
SYNDIREMPTY,
SYNDONP_RESULTEMPTY,
SYNDONP_TEMPOPENPREPPPROP,
SYNEMPTY_RESULTEMPTY,
SYNIOEMPTY_DONP,
SYNIOEMPTY_HETOPENOMTESENT,
SYNIOEMPTY_HETTHATSENT,
SYNIOEMPTY_OPENOMTESENT,
SYNIOEMPTY_QSENT,
SYNIOEMPTY_THATSENT,
SYNIONP,
SYNIONP_PREPNP,
SYNLOCEMPTY,
SYNLOCPREPEMPTY,
SYNLOCPREPP,
SYNOPENVERBPPROP,
SYNPAPREPOPENOMTESENT,
SYNPAPREPOPENTESENT,
SYNPAPREPQSENT,
SYNPAPREPTHATSENT,
SYNPATHPREPP,
SYNPOSTADJPREPNP,
SYNPREPNP_QSENT,
SYNPREPNP_THATSENT,
SYNPREPOPENINFSENT,
SYNSOPROSENT,
SYNTEMPOPENPREPPPROP,
SYNTEMPADVP,
SYNVOOREMPTY,
SYNVOORNP,
SYNNOADJPARGS]
END;
 FUNCTION LSAUXDOM_SENTCOMPLVPS:LSDOMAINT_SYNPATTERNSETTYPE;
BEGIN
LSAUXDOM_SENTCOMPLVPS:=
[SYNAANNP_HETOPENOMTESENT,
SYNAANNP_HETOPENTESENT,
SYNAANNP_HETTHATSENT,
SYNAANNP_HETQSENT,
SYNAANNP_OPENOMTESENT,
SYNAANNP_OPENTESENT,
SYNAANNP_QSENT,
SYNAANNP_THATSENT,
SYNCLOSEDINFSENT,
SYNCLOSEDTESENT,
SYNDONP_OPENTESENT,
SYNDONP_OPENOMTESENT,
SYNDONP_PREPOPENOMTESENT,
SYNEMPTY_CLOSEDTESENT,
SYNEMPTY_HETOPENTESENT,
SYNEMPTY_HETOPENOMTESENT,
SYNEMPTY_HETTHATSENT,
SYNEMPTY_OPENOMTESENT,
SYNEMPTY_OPENTESENT,
SYNEMPTY_QSENT,
SYNEMPTY_THATSENT,
SYNHETOPENOMTESENT,
SYNHETOPENTESENT,
SYNHETTHATSENT,
SYNIOEMPTY_HETTHATSENT,
SYNIOEMPTY_OPENOMTESENT,
SYNIOEMPTY_HETOPENOMTESENT,
SYNIOEMPTY_HETQSENT,
SYNIOEMPTY_THATSENT,
SYNIOEMPTY_QSENT,
SYNIONP_HETOPENOMTESENT,
SYNIONP_HETOPENTESENT,
SYNIONP_HETTHATSENT,
SYNIONP_HETQSENT,
SYNIONP_OPENOMTESENT,
SYNIONP_OPENTESENT,
SYNIONP_QSENT,
SYNIONP_SOPROSENT,
SYNIONP_THATSENT,
SYNOPENINFSENT,
SYNOPENOMTESENT,
SYNOPENTESENT,
SYNPAPREPOPENOMTESENT,
SYNPAPREPOPENTESENT,
SYNPAPREPTHATSENT,
SYNPAPREPQSENT,
SYNPREPOPENOMTESENT,
SYNPREPOPENTESENT,
SYNPREPQSENT,
SYNPREPTHATSENT,
SYNPROSENT,
SYNQSENT,
SYNTHATSENT,
SYNTHATSENT_LOCOPENPREPPPROP,
SYNDONP_PREPTHATSENT,
SYNDONP_THATSENT,
SYNHETIFSENT,
SYNHETQSENT,
SYNPREPNP_PREPTHATSENT,
SYNPREPEMPTY_PREPTHATSENT,
SYNPREPNP_THATSENT]
END;
 FUNCTION LSAUXDOM_XKINDS:LSDOMAINT_KINDSEFFSETTYPE;
BEGIN
LSAUXDOM_XKINDS:=
[XK,
XLK,
XQK,
XPK,
XLQK,
XPQK]
END;


