
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

 FUNCTION LSAUXDOM_CpADVONPLEASE
                         (rec:LSDOMAINT_ADVRECORD):BOOLEAN;
VAR Bool : BOOLEAN;
BEGIN 
  Bool := FALSE;
  WITH rec DO
  BEGIN
    IF (COMPFORMATIONS = [NOCOMP] ) THEN
IF (AFFIX = NOAFFIX ) THEN
IF (COMPFORM = BASIC ) THEN
IF (REQ = [POSPOL,NEGPOL,OMEGAPOL] ) THEN
IF (ENV = [POSPOL,NEGPOL,OMEGAPOL] ) THEN
IF (SUBCS = [SENTADV] ) THEN
IF (CLASS = OMEGATIMEADVCLASS ) THEN
IF (DEIXIS = OMEGADEIXIS ) THEN
IF (ASPECT = OMEGAASPECT ) THEN
IF (RETRO = FALSE ) THEN
IF (MOOD = NOWH ) THEN
IF (THETAADV = ADVP100 ) THEN
IF (ADVPATTERNS = [SYNNOVPARGS] ) THEN
IF (PREPKEY = 0 ) THEN
IF (POSITION = [1,2,3,4] ) THEN
IF (POSSNIETNP = FALSE ) THEN
IF (THANAS = OMEGACOMPL ) THEN
IF (TEMPORAL = TRUE ) THEN
      Bool:=TRUE;
  END;{with}
  LSAUXDOM_CpADVONPLEASE:=Bool;
END;{function}
 PROCEDURE LSAUXDOM_AsADVONPLEASE(VAR rec:LSDOMAINT_ADVRECORD);
BEGIN
WITH rec DO
BEGIN
COMPFORMATIONS := [NOCOMP];
                                                      AFFIX := NOAFFIX;
                                                      COMPFORM := BASIC;
                                                      REQ := [POSPOL,NEGPOL,OMEGAPOL];
                                                      ENV := [POSPOL,NEGPOL,OMEGAPOL];
                                                      SUBCS := [SENTADV];
                                                      CLASS := OMEGATIMEADVCLASS;
                                                      DEIXIS := OMEGADEIXIS;
                                                      ASPECT := OMEGAASPECT;
                                                      RETRO := FALSE;
                                                      MOOD := NOWH;
                                                      THETAADV := ADVP100;
                                                      ADVPATTERNS := [SYNNOVPARGS];
                                                      PREPKEY := 0;
                                                      POSITION := [1,2,3,4];
                                                      POSSNIETNP := FALSE;
                                                      THANAS := OMEGACOMPL;
                                                      TEMPORAL := TRUE;
                                                      END
END;

 FUNCTION LSAUXDOM_CpADVONPRSRFEMPTY
                         (rec:LSDOMAINT_ADVRECORD):BOOLEAN;
VAR Bool : BOOLEAN;
BEGIN 
  Bool := FALSE;
  WITH rec DO
  BEGIN
    IF (COMPFORMATIONS = [NOCOMP] ) THEN
IF (AFFIX = NOAFFIX ) THEN
IF (COMPFORM = BASIC ) THEN
IF (REQ = [POSPOL,NEGPOL,OMEGAPOL] ) THEN
IF (ENV = [POSPOL,NEGPOL,OMEGAPOL] ) THEN
IF (SUBCS = [TEMPADV] ) THEN
IF (CLASS = REFERENCE ) THEN
IF (DEIXIS = PRESENTDEIXIS ) THEN
IF (ASPECT = PERFECTIVE ) THEN
IF (RETRO = FALSE ) THEN
IF (MOOD = NOWH ) THEN
IF (THETAADV = ADVP100 ) THEN
IF (ADVPATTERNS = [SYNNOVPARGS] ) THEN
IF (PREPKEY = 0 ) THEN
IF (POSITION = [1,2,3,4] ) THEN
IF (POSSNIETNP = FALSE ) THEN
IF (THANAS = OMEGACOMPL ) THEN
IF (TEMPORAL = TRUE ) THEN
      Bool:=TRUE;
  END;{with}
  LSAUXDOM_CpADVONPRSRFEMPTY:=Bool;
END;{function}
 PROCEDURE LSAUXDOM_AsADVONPRSRFEMPTY(VAR rec:LSDOMAINT_ADVRECORD);
BEGIN
WITH rec DO
BEGIN
COMPFORMATIONS := [NOCOMP];
                                                      AFFIX := NOAFFIX;
                                                      COMPFORM := BASIC;
                                                      REQ := [POSPOL,NEGPOL,OMEGAPOL];
                                                      ENV := [POSPOL,NEGPOL,OMEGAPOL];
                                                      SUBCS := [TEMPADV];
                                                      CLASS := REFERENCE;
                                                      DEIXIS := PRESENTDEIXIS;
                                                      ASPECT := PERFECTIVE;
                                                      RETRO := FALSE;
                                                      MOOD := NOWH;
                                                      THETAADV := ADVP100;
                                                      ADVPATTERNS := [SYNNOVPARGS];
                                                      PREPKEY := 0;
                                                      POSITION := [1,2,3,4];
                                                      POSSNIETNP := FALSE;
                                                      THANAS := OMEGACOMPL;
                                                      TEMPORAL := TRUE;
                                                      END
END;

 FUNCTION LSAUXDOM_CpADVONPSTRFEMPTY
                         (rec:LSDOMAINT_ADVRECORD):BOOLEAN;
VAR Bool : BOOLEAN;
BEGIN 
  Bool := FALSE;
  WITH rec DO
  BEGIN
    IF (COMPFORMATIONS = [NOCOMP] ) THEN
IF (AFFIX = NOAFFIX ) THEN
IF (COMPFORM = BASIC ) THEN
IF (REQ = [POSPOL,NEGPOL,OMEGAPOL] ) THEN
IF (ENV = [POSPOL,NEGPOL,OMEGAPOL] ) THEN
IF (SUBCS = [TEMPADV] ) THEN
IF (CLASS = REFERENCE ) THEN
IF (DEIXIS = PASTDEIXIS ) THEN
IF (ASPECT = PERFECTIVE ) THEN
IF (RETRO = FALSE ) THEN
IF (MOOD = NOWH ) THEN
IF (THETAADV = ADVP100 ) THEN
IF (ADVPATTERNS = [SYNNOVPARGS] ) THEN
IF (PREPKEY = 0 ) THEN
IF (POSITION = [1,2,3,4] ) THEN
IF (POSSNIETNP = FALSE ) THEN
IF (THANAS = OMEGACOMPL ) THEN
IF (TEMPORAL = TRUE ) THEN
      Bool:=TRUE;
  END;{with}
  LSAUXDOM_CpADVONPSTRFEMPTY:=Bool;
END;{function}
 PROCEDURE LSAUXDOM_AsADVONPSTRFEMPTY(VAR rec:LSDOMAINT_ADVRECORD);
BEGIN
WITH rec DO
BEGIN
COMPFORMATIONS := [NOCOMP];
                                                      AFFIX := NOAFFIX;
                                                      COMPFORM := BASIC;
                                                      REQ := [POSPOL,NEGPOL,OMEGAPOL];
                                                      ENV := [POSPOL,NEGPOL,OMEGAPOL];
                                                      SUBCS := [TEMPADV];
                                                      CLASS := REFERENCE;
                                                      DEIXIS := PASTDEIXIS;
                                                      ASPECT := PERFECTIVE;
                                                      RETRO := FALSE;
                                                      MOOD := NOWH;
                                                      THETAADV := ADVP100;
                                                      ADVPATTERNS := [SYNNOVPARGS];
                                                      PREPKEY := 0;
                                                      POSITION := [1,2,3,4];
                                                      POSSNIETNP := FALSE;
                                                      THANAS := OMEGACOMPL;
                                                      TEMPORAL := TRUE;
                                                      END
END;

 FUNCTION LSAUXDOM_CpADVONRTRRFEMPTY
                         (rec:LSDOMAINT_ADVRECORD):BOOLEAN;
VAR Bool : BOOLEAN;
BEGIN 
  Bool := FALSE;
  WITH rec DO
  BEGIN
    IF (COMPFORMATIONS = [NOCOMP] ) THEN
IF (AFFIX = NOAFFIX ) THEN
IF (COMPFORM = BASIC ) THEN
IF (REQ = [POSPOL,NEGPOL,OMEGAPOL] ) THEN
IF (ENV = [POSPOL,NEGPOL,OMEGAPOL] ) THEN
IF (SUBCS = [TEMPADV] ) THEN
IF (CLASS = REFERENCE ) THEN
IF (DEIXIS = OMEGADEIXIS ) THEN
IF (ASPECT = IMPERFECTIVE ) THEN
IF (RETRO = TRUE ) THEN
IF (MOOD = NOWH ) THEN
IF (THETAADV = ADVP100 ) THEN
IF (ADVPATTERNS = [SYNNOVPARGS] ) THEN
IF (PREPKEY = 0 ) THEN
IF (POSITION = [1,2,3,4] ) THEN
IF (POSSNIETNP = FALSE ) THEN
IF (THANAS = OMEGACOMPL ) THEN
IF (TEMPORAL = TRUE ) THEN
      Bool:=TRUE;
  END;{with}
  LSAUXDOM_CpADVONRTRRFEMPTY:=Bool;
END;{function}
 PROCEDURE LSAUXDOM_AsADVONRTRRFEMPTY(VAR rec:LSDOMAINT_ADVRECORD);
BEGIN
WITH rec DO
BEGIN
COMPFORMATIONS := [NOCOMP];
                                                      AFFIX := NOAFFIX;
                                                      COMPFORM := BASIC;
                                                      REQ := [POSPOL,NEGPOL,OMEGAPOL];
                                                      ENV := [POSPOL,NEGPOL,OMEGAPOL];
                                                      SUBCS := [TEMPADV];
                                                      CLASS := REFERENCE;
                                                      DEIXIS := OMEGADEIXIS;
                                                      ASPECT := IMPERFECTIVE;
                                                      RETRO := TRUE;
                                                      MOOD := NOWH;
                                                      THETAADV := ADVP100;
                                                      ADVPATTERNS := [SYNNOVPARGS];
                                                      PREPKEY := 0;
                                                      POSITION := [1,2,3,4];
                                                      POSSNIETNP := FALSE;
                                                      THANAS := OMEGACOMPL;
                                                      TEMPORAL := TRUE;
                                                      END
END;

 FUNCTION LSAUXDOM_CpADVPONPLEASE
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
IF (MOOD = NOWH ) THEN
IF (THETAADV = ADVP100 ) THEN
IF (SUPERDEIXIS = OMEGADEIXIS ) THEN
IF (ACTSUBCEFS = [SENTADV] ) THEN
IF (ADVPATTERNEFS = [SYNNOVPARGS] ) THEN
IF (POSSNIETNP = FALSE ) THEN
IF (THANAS = OMEGACOMPL ) THEN
IF (THANASCOMPL = FALSE ) THEN
IF (TEMPORAL = FALSE ) THEN
IF (COORD = NOCOORD ) THEN
      Bool:=TRUE;
  END;{with}
  LSAUXDOM_CpADVPONPLEASE:=Bool;
END;{function}
 PROCEDURE LSAUXDOM_AsADVPONPLEASE(VAR rec:LSDOMAINT_ADVPRECORD);
BEGIN
WITH rec DO
BEGIN
REQ := [POSPOL,NEGPOL,OMEGAPOL];
                                                      ENV := [POSPOL,NEGPOL,OMEGAPOL];
                                                      CLASS := OMEGATIMEADVCLASS;
                                                      DEIXIS := OMEGADEIXIS;
                                                      ASPECT := OMEGAASPECT;
                                                      RETRO := FALSE;
                                                      MOOD := NOWH;
                                                      THETAADV := ADVP100;
                                                      SUPERDEIXIS := OMEGADEIXIS;
                                                      ACTSUBCEFS := [SENTADV];
                                                      ADVPATTERNEFS := [SYNNOVPARGS];
                                                      POSSNIETNP := FALSE;
                                                      THANAS := OMEGACOMPL;
                                                      THANASCOMPL := FALSE;
                                                      TEMPORAL := FALSE;
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
IF (MOOD = NOWH ) THEN
IF (THETAADV = ADVP100 ) THEN
IF (SUPERDEIXIS = OMEGADEIXIS ) THEN
IF (ACTSUBCEFS = [TEMPADV] ) THEN
IF (ADVPATTERNEFS = [SYNNOVPARGS] ) THEN
IF (POSSNIETNP = FALSE ) THEN
IF (THANAS = OMEGACOMPL ) THEN
IF (THANASCOMPL = FALSE ) THEN
IF (TEMPORAL = TRUE ) THEN
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
                                                      MOOD := NOWH;
                                                      THETAADV := ADVP100;
                                                      SUPERDEIXIS := OMEGADEIXIS;
                                                      ACTSUBCEFS := [TEMPADV];
                                                      ADVPATTERNEFS := [SYNNOVPARGS];
                                                      POSSNIETNP := FALSE;
                                                      THANAS := OMEGACOMPL;
                                                      THANASCOMPL := FALSE;
                                                      TEMPORAL := TRUE;
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
IF (MOOD = NOWH ) THEN
IF (THETAADV = ADVP100 ) THEN
IF (SUPERDEIXIS = OMEGADEIXIS ) THEN
IF (ACTSUBCEFS = [TEMPADV] ) THEN
IF (ADVPATTERNEFS = [SYNNOVPARGS] ) THEN
IF (POSSNIETNP = FALSE ) THEN
IF (THANAS = OMEGACOMPL ) THEN
IF (THANASCOMPL = FALSE ) THEN
IF (TEMPORAL = TRUE ) THEN
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
                                                      MOOD := NOWH;
                                                      THETAADV := ADVP100;
                                                      SUPERDEIXIS := OMEGADEIXIS;
                                                      ACTSUBCEFS := [TEMPADV];
                                                      ADVPATTERNEFS := [SYNNOVPARGS];
                                                      POSSNIETNP := FALSE;
                                                      THANAS := OMEGACOMPL;
                                                      THANASCOMPL := FALSE;
                                                      TEMPORAL := TRUE;
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
IF (MOOD = NOWH ) THEN
IF (THETAADV = ADVP100 ) THEN
IF (SUPERDEIXIS = OMEGADEIXIS ) THEN
IF (ACTSUBCEFS = [TEMPADV] ) THEN
IF (ADVPATTERNEFS = [SYNNOVPARGS] ) THEN
IF (POSSNIETNP = FALSE ) THEN
IF (THANAS = OMEGACOMPL ) THEN
IF (THANASCOMPL = FALSE ) THEN
IF (TEMPORAL = TRUE ) THEN
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
                                                      MOOD := NOWH;
                                                      THETAADV := ADVP100;
                                                      SUPERDEIXIS := OMEGADEIXIS;
                                                      ACTSUBCEFS := [TEMPADV];
                                                      ADVPATTERNEFS := [SYNNOVPARGS];
                                                      POSSNIETNP := FALSE;
                                                      THANAS := OMEGACOMPL;
                                                      THANASCOMPL := FALSE;
                                                      TEMPORAL := TRUE;
                                                      COORD := NOCOORD;
                                                      END
END;

 FUNCTION LSAUXDOM_CpNPONRECIPRO
                         (rec:LSDOMAINT_NPRECORD):BOOLEAN;
VAR Bool : BOOLEAN;
BEGIN 
  Bool := FALSE;
  WITH rec DO
  BEGIN
    IF (REQ = [POSPOL,NEGPOL,OMEGAPOL] ) THEN
IF (ENV = [POSPOL,NEGPOL,OMEGAPOL] ) THEN
IF (CLASS = OMEGATIMEADVCLASS ) THEN
IF (SUPERDEIXIS = OMEGADEIXIS ) THEN
IF (DEIXIS = OMEGADEIXIS ) THEN
IF (ASPECT = OMEGAASPECT ) THEN
IF (RETRO = FALSE ) THEN
IF (DEFINITE = DEF ) THEN
IF (PERSON = 3 ) THEN
IF (NUMBER = PLURAL ) THEN
IF (CASES = [] ) THEN
IF (GENDERS = [OMEGAGENDER] ) THEN
IF (SEXES = [] ) THEN
IF (ACTSUBCS = [OTHERNOUN] ) THEN
IF (TEMPORAL = FALSE ) THEN
IF (POSS = FALSE ) THEN
IF (ANIMATE = OMEGAANIMATE ) THEN
IF (HUMAN = OMEGAHUMAN ) THEN
IF (ACTCOMAS = [COUNT] ) THEN
IF (THETANP = OMEGATHETANP ) THEN
IF (NOUNPATTERNEFS = [] ) THEN
IF (POSSPRED = FALSE ) THEN
IF (POSSNIETNP = FALSE ) THEN
IF (MOOD = NOWH ) THEN
IF (GENERIC = NOGENERIC ) THEN
IF (SYNTQUANT = OMEGAQUANT ) THEN
IF (NPHEAD = RECIPRONP ) THEN
IF (SPECQ = YESSPEC ) THEN
IF (POSS = FALSE ) THEN
IF (COORD = NOCOORD ) THEN
      Bool:=TRUE;
  END;{with}
  LSAUXDOM_CpNPONRECIPRO:=Bool;
END;{function}
 PROCEDURE LSAUXDOM_AsNPONRECIPRO(VAR rec:LSDOMAINT_NPRECORD);
BEGIN
WITH rec DO
BEGIN
REQ := [POSPOL,NEGPOL,OMEGAPOL];
                                                      ENV := [POSPOL,NEGPOL,OMEGAPOL];
                                                      CLASS := OMEGATIMEADVCLASS;
                                                      SUPERDEIXIS := OMEGADEIXIS;
                                                      DEIXIS := OMEGADEIXIS;
                                                      ASPECT := OMEGAASPECT;
                                                      RETRO := FALSE;
                                                      DEFINITE := DEF;
                                                      PERSON := 3;
                                                      NUMBER := PLURAL;
                                                      CASES := [];
                                                      GENDERS := [OMEGAGENDER];
                                                      SEXES := [];
                                                      ACTSUBCS := [OTHERNOUN];
                                                      TEMPORAL := FALSE;
                                                      POSS := FALSE;
                                                      ANIMATE := OMEGAANIMATE;
                                                      HUMAN := OMEGAHUMAN;
                                                      ACTCOMAS := [COUNT];
                                                      THETANP := OMEGATHETANP;
                                                      NOUNPATTERNEFS := [];
                                                      POSSPRED := FALSE;
                                                      POSSNIETNP := FALSE;
                                                      MOOD := NOWH;
                                                      GENERIC := NOGENERIC;
                                                      SYNTQUANT := OMEGAQUANT;
                                                      NPHEAD := RECIPRONP;
                                                      SPECQ := YESSPEC;
                                                      POSS := FALSE;
                                                      COORD := NOCOORD;
                                                      END
END;

 FUNCTION LSAUXDOM_CpNPONHIMRFLPR
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
IF (CASES = [] ) THEN
IF (GENDERS = [OMEGAGENDER] ) THEN
IF (SEXES = [MASCULINE] ) THEN
IF (ACTSUBCS = [OTHERNOUN] ) THEN
IF (TEMPORAL = FALSE ) THEN
IF (ANIMATE = YESANIMATE ) THEN
IF (HUMAN = YESHUMAN ) THEN
IF (ACTCOMAS = [COUNT] ) THEN
IF (THETANP = OMEGATHETANP ) THEN
IF (NOUNPATTERNEFS = [] ) THEN
IF (MOOD = NOWH ) THEN
IF (GENERIC = OMEGAGENERIC ) THEN
IF (POSSPRED = FALSE ) THEN
IF (POSSNIETNP = FALSE ) THEN
IF (SYNTQUANT = OMEGAQUANT ) THEN
IF (NPHEAD = REFLNP ) THEN
IF (SPECQ = YESSPEC ) THEN
IF (POSS = FALSE ) THEN
IF (COORD = NOCOORD ) THEN
      Bool:=TRUE;
  END;{with}
  LSAUXDOM_CpNPONHIMRFLPR:=Bool;
END;{function}
 PROCEDURE LSAUXDOM_AsNPONHIMRFLPR(VAR rec:LSDOMAINT_NPRECORD);
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
                                                      CASES := [];
                                                      GENDERS := [OMEGAGENDER];
                                                      SEXES := [MASCULINE];
                                                      ACTSUBCS := [OTHERNOUN];
                                                      TEMPORAL := FALSE;
                                                      ANIMATE := YESANIMATE;
                                                      HUMAN := YESHUMAN;
                                                      ACTCOMAS := [COUNT];
                                                      THETANP := OMEGATHETANP;
                                                      NOUNPATTERNEFS := [];
                                                      MOOD := NOWH;
                                                      GENERIC := OMEGAGENERIC;
                                                      POSSPRED := FALSE;
                                                      POSSNIETNP := FALSE;
                                                      SYNTQUANT := OMEGAQUANT;
                                                      NPHEAD := REFLNP;
                                                      SPECQ := YESSPEC;
                                                      POSS := FALSE;
                                                      COORD := NOCOORD;
                                                      END
END;

 FUNCTION LSAUXDOM_CpNPONHERRFLPR
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
IF (CASES = [] ) THEN
IF (GENDERS = [OMEGAGENDER] ) THEN
IF (SEXES = [FEMININE] ) THEN
IF (ACTSUBCS = [OTHERNOUN] ) THEN
IF (TEMPORAL = FALSE ) THEN
IF (ANIMATE = YESANIMATE ) THEN
IF (HUMAN = YESHUMAN ) THEN
IF (ACTCOMAS = [COUNT] ) THEN
IF (THETANP = OMEGATHETANP ) THEN
IF (NOUNPATTERNEFS = [] ) THEN
IF (MOOD = NOWH ) THEN
IF (GENERIC = OMEGAGENERIC ) THEN
IF (POSSPRED = FALSE ) THEN
IF (POSSNIETNP = FALSE ) THEN
IF (SYNTQUANT = OMEGAQUANT ) THEN
IF (NPHEAD = REFLNP ) THEN
IF (SPECQ = YESSPEC ) THEN
IF (POSS = FALSE ) THEN
IF (COORD = NOCOORD ) THEN
      Bool:=TRUE;
  END;{with}
  LSAUXDOM_CpNPONHERRFLPR:=Bool;
END;{function}
 PROCEDURE LSAUXDOM_AsNPONHERRFLPR(VAR rec:LSDOMAINT_NPRECORD);
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
                                                      CASES := [];
                                                      GENDERS := [OMEGAGENDER];
                                                      SEXES := [FEMININE];
                                                      ACTSUBCS := [OTHERNOUN];
                                                      TEMPORAL := FALSE;
                                                      ANIMATE := YESANIMATE;
                                                      HUMAN := YESHUMAN;
                                                      ACTCOMAS := [COUNT];
                                                      THETANP := OMEGATHETANP;
                                                      NOUNPATTERNEFS := [];
                                                      MOOD := NOWH;
                                                      GENERIC := OMEGAGENERIC;
                                                      POSSPRED := FALSE;
                                                      POSSNIETNP := FALSE;
                                                      SYNTQUANT := OMEGAQUANT;
                                                      NPHEAD := REFLNP;
                                                      SPECQ := YESSPEC;
                                                      POSS := FALSE;
                                                      COORD := NOCOORD;
                                                      END
END;

 FUNCTION LSAUXDOM_CpNPONITRFLPR
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
IF (CASES = [] ) THEN
IF (GENDERS = [OMEGAGENDER] ) THEN
IF (SEXES = [] ) THEN
IF (ACTSUBCS = [OTHERNOUN] ) THEN
IF (TEMPORAL = FALSE ) THEN
IF (ANIMATE = OMEGAANIMATE ) THEN
IF (HUMAN = OMEGAHUMAN ) THEN
IF (ACTCOMAS = [COUNT] ) THEN
IF (THETANP = OMEGATHETANP ) THEN
IF (NOUNPATTERNEFS = [] ) THEN
IF (MOOD = NOWH ) THEN
IF (GENERIC = OMEGAGENERIC ) THEN
IF (POSSPRED = FALSE ) THEN
IF (POSSNIETNP = FALSE ) THEN
IF (SYNTQUANT = OMEGAQUANT ) THEN
IF (NPHEAD = REFLNP ) THEN
IF (SPECQ = YESSPEC ) THEN
IF (POSS = FALSE ) THEN
IF (COORD = NOCOORD ) THEN
      Bool:=TRUE;
  END;{with}
  LSAUXDOM_CpNPONITRFLPR:=Bool;
END;{function}
 PROCEDURE LSAUXDOM_AsNPONITRFLPR(VAR rec:LSDOMAINT_NPRECORD);
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
                                                      CASES := [];
                                                      GENDERS := [OMEGAGENDER];
                                                      SEXES := [];
                                                      ACTSUBCS := [OTHERNOUN];
                                                      TEMPORAL := FALSE;
                                                      ANIMATE := OMEGAANIMATE;
                                                      HUMAN := OMEGAHUMAN;
                                                      ACTCOMAS := [COUNT];
                                                      THETANP := OMEGATHETANP;
                                                      NOUNPATTERNEFS := [];
                                                      MOOD := NOWH;
                                                      GENERIC := OMEGAGENERIC;
                                                      POSSPRED := FALSE;
                                                      POSSNIETNP := FALSE;
                                                      SYNTQUANT := OMEGAQUANT;
                                                      NPHEAD := REFLNP;
                                                      SPECQ := YESSPEC;
                                                      POSS := FALSE;
                                                      COORD := NOCOORD;
                                                      END
END;

 FUNCTION LSAUXDOM_CpNPONMYRFLPR
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
IF (CASES = [] ) THEN
IF (GENDERS = [OMEGAGENDER] ) THEN
IF (SEXES = [] ) THEN
IF (ACTSUBCS = [OTHERNOUN] ) THEN
IF (TEMPORAL = FALSE ) THEN
IF (ANIMATE = YESANIMATE ) THEN
IF (HUMAN = YESHUMAN ) THEN
IF (ACTCOMAS = [COUNT] ) THEN
IF (THETANP = OMEGATHETANP ) THEN
IF (NOUNPATTERNEFS = [] ) THEN
IF (MOOD = NOWH ) THEN
IF (GENERIC = OMEGAGENERIC ) THEN
IF (POSSPRED = FALSE ) THEN
IF (POSSNIETNP = FALSE ) THEN
IF (SYNTQUANT = OMEGAQUANT ) THEN
IF (NPHEAD = REFLNP ) THEN
IF (SPECQ = YESSPEC ) THEN
IF (POSS = FALSE ) THEN
IF (COORD = NOCOORD ) THEN
      Bool:=TRUE;
  END;{with}
  LSAUXDOM_CpNPONMYRFLPR:=Bool;
END;{function}
 PROCEDURE LSAUXDOM_AsNPONMYRFLPR(VAR rec:LSDOMAINT_NPRECORD);
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
                                                      CASES := [];
                                                      GENDERS := [OMEGAGENDER];
                                                      SEXES := [];
                                                      ACTSUBCS := [OTHERNOUN];
                                                      TEMPORAL := FALSE;
                                                      ANIMATE := YESANIMATE;
                                                      HUMAN := YESHUMAN;
                                                      ACTCOMAS := [COUNT];
                                                      THETANP := OMEGATHETANP;
                                                      NOUNPATTERNEFS := [];
                                                      MOOD := NOWH;
                                                      GENERIC := OMEGAGENERIC;
                                                      POSSPRED := FALSE;
                                                      POSSNIETNP := FALSE;
                                                      SYNTQUANT := OMEGAQUANT;
                                                      NPHEAD := REFLNP;
                                                      SPECQ := YESSPEC;
                                                      POSS := FALSE;
                                                      COORD := NOCOORD;
                                                      END
END;

 FUNCTION LSAUXDOM_CpNPONONERFLPR
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
IF (CASES = [] ) THEN
IF (GENDERS = [OMEGAGENDER] ) THEN
IF (SEXES = [] ) THEN
IF (ACTSUBCS = [OTHERNOUN] ) THEN
IF (TEMPORAL = FALSE ) THEN
IF (ANIMATE = YESANIMATE ) THEN
IF (HUMAN = YESHUMAN ) THEN
IF (ACTCOMAS = [COUNT] ) THEN
IF (THETANP = OMEGATHETANP ) THEN
IF (NOUNPATTERNEFS = [] ) THEN
IF (MOOD = NOWH ) THEN
IF (GENERIC = OMEGAGENERIC ) THEN
IF (POSSPRED = FALSE ) THEN
IF (POSSNIETNP = FALSE ) THEN
IF (SYNTQUANT = OMEGAQUANT ) THEN
IF (NPHEAD = REFLNP ) THEN
IF (SPECQ = YESSPEC ) THEN
IF (POSS = FALSE ) THEN
IF (COORD = NOCOORD ) THEN
      Bool:=TRUE;
  END;{with}
  LSAUXDOM_CpNPONONERFLPR:=Bool;
END;{function}
 PROCEDURE LSAUXDOM_AsNPONONERFLPR(VAR rec:LSDOMAINT_NPRECORD);
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
                                                      CASES := [];
                                                      GENDERS := [OMEGAGENDER];
                                                      SEXES := [];
                                                      ACTSUBCS := [OTHERNOUN];
                                                      TEMPORAL := FALSE;
                                                      ANIMATE := YESANIMATE;
                                                      HUMAN := YESHUMAN;
                                                      ACTCOMAS := [COUNT];
                                                      THETANP := OMEGATHETANP;
                                                      NOUNPATTERNEFS := [];
                                                      MOOD := NOWH;
                                                      GENERIC := OMEGAGENERIC;
                                                      POSSPRED := FALSE;
                                                      POSSNIETNP := FALSE;
                                                      SYNTQUANT := OMEGAQUANT;
                                                      NPHEAD := REFLNP;
                                                      SPECQ := YESSPEC;
                                                      POSS := FALSE;
                                                      COORD := NOCOORD;
                                                      END
END;

 FUNCTION LSAUXDOM_CpNPONOURRFLPR
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
IF (CASES = [] ) THEN
IF (GENDERS = [OMEGAGENDER] ) THEN
IF (SEXES = [] ) THEN
IF (ACTSUBCS = [OTHERNOUN] ) THEN
IF (TEMPORAL = FALSE ) THEN
IF (ANIMATE = YESANIMATE ) THEN
IF (HUMAN = YESHUMAN ) THEN
IF (ACTCOMAS = [COUNT] ) THEN
IF (THETANP = OMEGATHETANP ) THEN
IF (NOUNPATTERNEFS = [] ) THEN
IF (MOOD = NOWH ) THEN
IF (GENERIC = OMEGAGENERIC ) THEN
IF (POSSPRED = FALSE ) THEN
IF (POSSNIETNP = FALSE ) THEN
IF (SYNTQUANT = OMEGAQUANT ) THEN
IF (NPHEAD = REFLNP ) THEN
IF (SPECQ = YESSPEC ) THEN
IF (POSS = FALSE ) THEN
IF (COORD = NOCOORD ) THEN
      Bool:=TRUE;
  END;{with}
  LSAUXDOM_CpNPONOURRFLPR:=Bool;
END;{function}
 PROCEDURE LSAUXDOM_AsNPONOURRFLPR(VAR rec:LSDOMAINT_NPRECORD);
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
                                                      CASES := [];
                                                      GENDERS := [OMEGAGENDER];
                                                      SEXES := [];
                                                      ACTSUBCS := [OTHERNOUN];
                                                      TEMPORAL := FALSE;
                                                      ANIMATE := YESANIMATE;
                                                      HUMAN := YESHUMAN;
                                                      ACTCOMAS := [COUNT];
                                                      THETANP := OMEGATHETANP;
                                                      NOUNPATTERNEFS := [];
                                                      MOOD := NOWH;
                                                      GENERIC := OMEGAGENERIC;
                                                      POSSPRED := FALSE;
                                                      POSSNIETNP := FALSE;
                                                      SYNTQUANT := OMEGAQUANT;
                                                      NPHEAD := REFLNP;
                                                      SPECQ := YESSPEC;
                                                      POSS := FALSE;
                                                      COORD := NOCOORD;
                                                      END
END;

 FUNCTION LSAUXDOM_CpNPONTHEMRFLPR
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
IF (CASES = [] ) THEN
IF (GENDERS = [OMEGAGENDER] ) THEN
IF (SEXES = [] ) THEN
IF (ACTSUBCS = [OTHERNOUN] ) THEN
IF (TEMPORAL = FALSE ) THEN
IF (ANIMATE = OMEGAANIMATE ) THEN
IF (HUMAN = OMEGAHUMAN ) THEN
IF (ACTCOMAS = [COUNT] ) THEN
IF (THETANP = OMEGATHETANP ) THEN
IF (NOUNPATTERNEFS = [] ) THEN
IF (MOOD = NOWH ) THEN
IF (GENERIC = OMEGAGENERIC ) THEN
IF (POSSPRED = FALSE ) THEN
IF (POSSNIETNP = FALSE ) THEN
IF (SYNTQUANT = OMEGAQUANT ) THEN
IF (NPHEAD = REFLNP ) THEN
IF (SPECQ = YESSPEC ) THEN
IF (POSS = FALSE ) THEN
IF (COORD = NOCOORD ) THEN
      Bool:=TRUE;
  END;{with}
  LSAUXDOM_CpNPONTHEMRFLPR:=Bool;
END;{function}
 PROCEDURE LSAUXDOM_AsNPONTHEMRFLPR(VAR rec:LSDOMAINT_NPRECORD);
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
                                                      CASES := [];
                                                      GENDERS := [OMEGAGENDER];
                                                      SEXES := [];
                                                      ACTSUBCS := [OTHERNOUN];
                                                      TEMPORAL := FALSE;
                                                      ANIMATE := OMEGAANIMATE;
                                                      HUMAN := OMEGAHUMAN;
                                                      ACTCOMAS := [COUNT];
                                                      THETANP := OMEGATHETANP;
                                                      NOUNPATTERNEFS := [];
                                                      MOOD := NOWH;
                                                      GENERIC := OMEGAGENERIC;
                                                      POSSPRED := FALSE;
                                                      POSSNIETNP := FALSE;
                                                      SYNTQUANT := OMEGAQUANT;
                                                      NPHEAD := REFLNP;
                                                      SPECQ := YESSPEC;
                                                      POSS := FALSE;
                                                      COORD := NOCOORD;
                                                      END
END;

 FUNCTION LSAUXDOM_CpNPONYOURSGRFLPR
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
IF (CASES = [] ) THEN
IF (GENDERS = [OMEGAGENDER] ) THEN
IF (SEXES = [] ) THEN
IF (ACTSUBCS = [OTHERNOUN] ) THEN
IF (TEMPORAL = FALSE ) THEN
IF (ANIMATE = YESANIMATE ) THEN
IF (HUMAN = YESHUMAN ) THEN
IF (ACTCOMAS = [COUNT] ) THEN
IF (THETANP = OMEGATHETANP ) THEN
IF (NOUNPATTERNEFS = [] ) THEN
IF (MOOD = NOWH ) THEN
IF (GENERIC = OMEGAGENERIC ) THEN
IF (POSSPRED = FALSE ) THEN
IF (POSSNIETNP = FALSE ) THEN
IF (SYNTQUANT = OMEGAQUANT ) THEN
IF (NPHEAD = REFLNP ) THEN
IF (SPECQ = YESSPEC ) THEN
IF (POSS = FALSE ) THEN
IF (COORD = NOCOORD ) THEN
      Bool:=TRUE;
  END;{with}
  LSAUXDOM_CpNPONYOURSGRFLPR:=Bool;
END;{function}
 PROCEDURE LSAUXDOM_AsNPONYOURSGRFLPR(VAR rec:LSDOMAINT_NPRECORD);
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
                                                      CASES := [];
                                                      GENDERS := [OMEGAGENDER];
                                                      SEXES := [];
                                                      ACTSUBCS := [OTHERNOUN];
                                                      TEMPORAL := FALSE;
                                                      ANIMATE := YESANIMATE;
                                                      HUMAN := YESHUMAN;
                                                      ACTCOMAS := [COUNT];
                                                      THETANP := OMEGATHETANP;
                                                      NOUNPATTERNEFS := [];
                                                      MOOD := NOWH;
                                                      GENERIC := OMEGAGENERIC;
                                                      POSSPRED := FALSE;
                                                      POSSNIETNP := FALSE;
                                                      SYNTQUANT := OMEGAQUANT;
                                                      NPHEAD := REFLNP;
                                                      SPECQ := YESSPEC;
                                                      POSS := FALSE;
                                                      COORD := NOCOORD;
                                                      END
END;

 FUNCTION LSAUXDOM_CpNPONYOURPLRFLPR
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
IF (CASES = [] ) THEN
IF (GENDERS = [OMEGAGENDER] ) THEN
IF (SEXES = [] ) THEN
IF (ACTSUBCS = [OTHERNOUN] ) THEN
IF (TEMPORAL = FALSE ) THEN
IF (ANIMATE = YESANIMATE ) THEN
IF (HUMAN = YESHUMAN ) THEN
IF (ACTCOMAS = [COUNT] ) THEN
IF (THETANP = OMEGATHETANP ) THEN
IF (NOUNPATTERNEFS = [] ) THEN
IF (MOOD = NOWH ) THEN
IF (GENERIC = OMEGAGENERIC ) THEN
IF (POSSPRED = FALSE ) THEN
IF (POSSNIETNP = FALSE ) THEN
IF (SYNTQUANT = OMEGAQUANT ) THEN
IF (NPHEAD = REFLNP ) THEN
IF (SPECQ = YESSPEC ) THEN
IF (POSS = FALSE ) THEN
IF (COORD = NOCOORD ) THEN
      Bool:=TRUE;
  END;{with}
  LSAUXDOM_CpNPONYOURPLRFLPR:=Bool;
END;{function}
 PROCEDURE LSAUXDOM_AsNPONYOURPLRFLPR(VAR rec:LSDOMAINT_NPRECORD);
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
                                                      CASES := [];
                                                      GENDERS := [OMEGAGENDER];
                                                      SEXES := [];
                                                      ACTSUBCS := [OTHERNOUN];
                                                      TEMPORAL := FALSE;
                                                      ANIMATE := YESANIMATE;
                                                      HUMAN := YESHUMAN;
                                                      ACTCOMAS := [COUNT];
                                                      THETANP := OMEGATHETANP;
                                                      NOUNPATTERNEFS := [];
                                                      MOOD := NOWH;
                                                      GENERIC := OMEGAGENERIC;
                                                      POSSPRED := FALSE;
                                                      POSSNIETNP := FALSE;
                                                      SYNTQUANT := OMEGAQUANT;
                                                      NPHEAD := REFLNP;
                                                      SPECQ := YESSPEC;
                                                      POSS := FALSE;
                                                      COORD := NOCOORD;
                                                      END
END;

 FUNCTION LSAUXDOM_CpNPONPRSPR
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
IF (CASES = [] ) THEN
IF (GENDERS = [OMEGAGENDER] ) THEN
IF (SEXES = [] ) THEN
IF (ACTSUBCS = [OTHERNOUN] ) THEN
IF (TEMPORAL = FALSE ) THEN
IF (ANIMATE = OMEGAANIMATE ) THEN
IF (HUMAN = OMEGAHUMAN ) THEN
IF (ACTCOMAS = [COUNT] ) THEN
IF (THETANP = OMEGATHETANP ) THEN
IF (NOUNPATTERNEFS = [] ) THEN
IF (MOOD = NOWH ) THEN
IF (GENERIC = OMEGAGENERIC ) THEN
IF (POSSPRED = TRUE ) THEN
IF (POSSNIETNP = FALSE ) THEN
IF (SYNTQUANT = OMEGAQUANT ) THEN
IF (NPHEAD = PERSPRONP ) THEN
IF (SPECQ = YESSPEC ) THEN
IF (POSS = FALSE ) THEN
IF (COORD = NOCOORD ) THEN
      Bool:=TRUE;
  END;{with}
  LSAUXDOM_CpNPONPRSPR:=Bool;
END;{function}
 PROCEDURE LSAUXDOM_AsNPONPRSPR(VAR rec:LSDOMAINT_NPRECORD);
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
                                                      CASES := [];
                                                      GENDERS := [OMEGAGENDER];
                                                      SEXES := [];
                                                      ACTSUBCS := [OTHERNOUN];
                                                      TEMPORAL := FALSE;
                                                      ANIMATE := OMEGAANIMATE;
                                                      HUMAN := OMEGAHUMAN;
                                                      ACTCOMAS := [COUNT];
                                                      THETANP := OMEGATHETANP;
                                                      NOUNPATTERNEFS := [];
                                                      MOOD := NOWH;
                                                      GENERIC := OMEGAGENERIC;
                                                      POSSPRED := TRUE;
                                                      POSSNIETNP := FALSE;
                                                      SYNTQUANT := OMEGAQUANT;
                                                      NPHEAD := PERSPRONP;
                                                      SPECQ := YESSPEC;
                                                      POSS := FALSE;
                                                      COORD := NOCOORD;
                                                      END
END;

 FUNCTION LSAUXDOM_CpNPONHEPRSPR
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
IF (CASES = [] ) THEN
IF (GENDERS = [OMEGAGENDER] ) THEN
IF (SEXES = [MASCULINE] ) THEN
IF (ACTSUBCS = [OTHERNOUN] ) THEN
IF (TEMPORAL = FALSE ) THEN
IF (ANIMATE = YESANIMATE ) THEN
IF (HUMAN = YESHUMAN ) THEN
IF (ACTCOMAS = [COUNT] ) THEN
IF (THETANP = OMEGATHETANP ) THEN
IF (NOUNPATTERNEFS = [] ) THEN
IF (MOOD = NOWH ) THEN
IF (GENERIC = OMEGAGENERIC ) THEN
IF (POSSPRED = TRUE ) THEN
IF (POSSNIETNP = FALSE ) THEN
IF (SYNTQUANT = OMEGAQUANT ) THEN
IF (NPHEAD = PERSPRONP ) THEN
IF (SPECQ = YESSPEC ) THEN
IF (POSS = FALSE ) THEN
IF (COORD = NOCOORD ) THEN
      Bool:=TRUE;
  END;{with}
  LSAUXDOM_CpNPONHEPRSPR:=Bool;
END;{function}
 PROCEDURE LSAUXDOM_AsNPONHEPRSPR(VAR rec:LSDOMAINT_NPRECORD);
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
                                                      CASES := [];
                                                      GENDERS := [OMEGAGENDER];
                                                      SEXES := [MASCULINE];
                                                      ACTSUBCS := [OTHERNOUN];
                                                      TEMPORAL := FALSE;
                                                      ANIMATE := YESANIMATE;
                                                      HUMAN := YESHUMAN;
                                                      ACTCOMAS := [COUNT];
                                                      THETANP := OMEGATHETANP;
                                                      NOUNPATTERNEFS := [];
                                                      MOOD := NOWH;
                                                      GENERIC := OMEGAGENERIC;
                                                      POSSPRED := TRUE;
                                                      POSSNIETNP := FALSE;
                                                      SYNTQUANT := OMEGAQUANT;
                                                      NPHEAD := PERSPRONP;
                                                      SPECQ := YESSPEC;
                                                      POSS := FALSE;
                                                      COORD := NOCOORD;
                                                      END
END;

 FUNCTION LSAUXDOM_CpNPONIPRSPR
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
IF (CASES = [] ) THEN
IF (GENDERS = [OMEGAGENDER] ) THEN
IF (SEXES = [] ) THEN
IF (ACTSUBCS = [OTHERNOUN] ) THEN
IF (TEMPORAL = FALSE ) THEN
IF (ANIMATE = YESANIMATE ) THEN
IF (HUMAN = YESHUMAN ) THEN
IF (ACTCOMAS = [COUNT] ) THEN
IF (THETANP = OMEGATHETANP ) THEN
IF (NOUNPATTERNEFS = [] ) THEN
IF (MOOD = NOWH ) THEN
IF (GENERIC = OMEGAGENERIC ) THEN
IF (POSSPRED = TRUE ) THEN
IF (POSSNIETNP = FALSE ) THEN
IF (SYNTQUANT = OMEGAQUANT ) THEN
IF (NPHEAD = PERSPRONP ) THEN
IF (SPECQ = YESSPEC ) THEN
IF (POSS = FALSE ) THEN
IF (COORD = NOCOORD ) THEN
      Bool:=TRUE;
  END;{with}
  LSAUXDOM_CpNPONIPRSPR:=Bool;
END;{function}
 PROCEDURE LSAUXDOM_AsNPONIPRSPR(VAR rec:LSDOMAINT_NPRECORD);
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
                                                      CASES := [];
                                                      GENDERS := [OMEGAGENDER];
                                                      SEXES := [];
                                                      ACTSUBCS := [OTHERNOUN];
                                                      TEMPORAL := FALSE;
                                                      ANIMATE := YESANIMATE;
                                                      HUMAN := YESHUMAN;
                                                      ACTCOMAS := [COUNT];
                                                      THETANP := OMEGATHETANP;
                                                      NOUNPATTERNEFS := [];
                                                      MOOD := NOWH;
                                                      GENERIC := OMEGAGENERIC;
                                                      POSSPRED := TRUE;
                                                      POSSNIETNP := FALSE;
                                                      SYNTQUANT := OMEGAQUANT;
                                                      NPHEAD := PERSPRONP;
                                                      SPECQ := YESSPEC;
                                                      POSS := FALSE;
                                                      COORD := NOCOORD;
                                                      END
END;

 FUNCTION LSAUXDOM_CpNPONITPRSPR
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
IF (CASES = [] ) THEN
IF (GENDERS = [OMEGAGENDER] ) THEN
IF (SEXES = [] ) THEN
IF (ACTSUBCS = [OTHERNOUN] ) THEN
IF (TEMPORAL = FALSE ) THEN
IF (ANIMATE = OMEGAANIMATE ) THEN
IF (HUMAN = OMEGAHUMAN ) THEN
IF (ACTCOMAS = [COUNT] ) THEN
IF (THETANP = OMEGATHETANP ) THEN
IF (NOUNPATTERNEFS = [] ) THEN
IF (MOOD = NOWH ) THEN
IF (GENERIC = OMEGAGENERIC ) THEN
IF (POSSPRED = TRUE ) THEN
IF (POSSNIETNP = FALSE ) THEN
IF (SYNTQUANT = OMEGAQUANT ) THEN
IF (NPHEAD = ITNP ) THEN
IF (SPECQ = YESSPEC ) THEN
IF (POSS = FALSE ) THEN
IF (COORD = NOCOORD ) THEN
      Bool:=TRUE;
  END;{with}
  LSAUXDOM_CpNPONITPRSPR:=Bool;
END;{function}
 PROCEDURE LSAUXDOM_AsNPONITPRSPR(VAR rec:LSDOMAINT_NPRECORD);
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
                                                      CASES := [];
                                                      GENDERS := [OMEGAGENDER];
                                                      SEXES := [];
                                                      ACTSUBCS := [OTHERNOUN];
                                                      TEMPORAL := FALSE;
                                                      ANIMATE := OMEGAANIMATE;
                                                      HUMAN := OMEGAHUMAN;
                                                      ACTCOMAS := [COUNT];
                                                      THETANP := OMEGATHETANP;
                                                      NOUNPATTERNEFS := [];
                                                      MOOD := NOWH;
                                                      GENERIC := OMEGAGENERIC;
                                                      POSSPRED := TRUE;
                                                      POSSNIETNP := FALSE;
                                                      SYNTQUANT := OMEGAQUANT;
                                                      NPHEAD := ITNP;
                                                      SPECQ := YESSPEC;
                                                      POSS := FALSE;
                                                      COORD := NOCOORD;
                                                      END
END;

 FUNCTION LSAUXDOM_CpNPONSHEPRSPR
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
IF (CASES = [] ) THEN
IF (GENDERS = [OMEGAGENDER] ) THEN
IF (SEXES = [FEMININE] ) THEN
IF (ACTSUBCS = [OTHERNOUN] ) THEN
IF (TEMPORAL = FALSE ) THEN
IF (ANIMATE = YESANIMATE ) THEN
IF (HUMAN = YESHUMAN ) THEN
IF (ACTCOMAS = [COUNT] ) THEN
IF (THETANP = OMEGATHETANP ) THEN
IF (NOUNPATTERNEFS = [] ) THEN
IF (MOOD = NOWH ) THEN
IF (GENERIC = OMEGAGENERIC ) THEN
IF (POSSPRED = TRUE ) THEN
IF (POSSNIETNP = FALSE ) THEN
IF (SYNTQUANT = OMEGAQUANT ) THEN
IF (NPHEAD = PERSPRONP ) THEN
IF (SPECQ = YESSPEC ) THEN
IF (POSS = FALSE ) THEN
IF (COORD = NOCOORD ) THEN
      Bool:=TRUE;
  END;{with}
  LSAUXDOM_CpNPONSHEPRSPR:=Bool;
END;{function}
 PROCEDURE LSAUXDOM_AsNPONSHEPRSPR(VAR rec:LSDOMAINT_NPRECORD);
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
                                                      CASES := [];
                                                      GENDERS := [OMEGAGENDER];
                                                      SEXES := [FEMININE];
                                                      ACTSUBCS := [OTHERNOUN];
                                                      TEMPORAL := FALSE;
                                                      ANIMATE := YESANIMATE;
                                                      HUMAN := YESHUMAN;
                                                      ACTCOMAS := [COUNT];
                                                      THETANP := OMEGATHETANP;
                                                      NOUNPATTERNEFS := [];
                                                      MOOD := NOWH;
                                                      GENERIC := OMEGAGENERIC;
                                                      POSSPRED := TRUE;
                                                      POSSNIETNP := FALSE;
                                                      SYNTQUANT := OMEGAQUANT;
                                                      NPHEAD := PERSPRONP;
                                                      SPECQ := YESSPEC;
                                                      POSS := FALSE;
                                                      COORD := NOCOORD;
                                                      END
END;

 FUNCTION LSAUXDOM_CpNPONTHEYPRSPR
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
IF (CASES = [] ) THEN
IF (GENDERS = [OMEGAGENDER] ) THEN
IF (SEXES = [] ) THEN
IF (ACTSUBCS = [OTHERNOUN] ) THEN
IF (TEMPORAL = FALSE ) THEN
IF (ANIMATE = OMEGAANIMATE ) THEN
IF (HUMAN = OMEGAHUMAN ) THEN
IF (ACTCOMAS = [COUNT] ) THEN
IF (THETANP = OMEGATHETANP ) THEN
IF (NOUNPATTERNEFS = [] ) THEN
IF (MOOD = NOWH ) THEN
IF (GENERIC = OMEGAGENERIC ) THEN
IF (POSSPRED = TRUE ) THEN
IF (POSSNIETNP = FALSE ) THEN
IF (SYNTQUANT = OMEGAQUANT ) THEN
IF (NPHEAD = PERSPRONP ) THEN
IF (SPECQ = YESSPEC ) THEN
IF (POSS = FALSE ) THEN
IF (COORD = NOCOORD ) THEN
      Bool:=TRUE;
  END;{with}
  LSAUXDOM_CpNPONTHEYPRSPR:=Bool;
END;{function}
 PROCEDURE LSAUXDOM_AsNPONTHEYPRSPR(VAR rec:LSDOMAINT_NPRECORD);
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
                                                      CASES := [];
                                                      GENDERS := [OMEGAGENDER];
                                                      SEXES := [];
                                                      ACTSUBCS := [OTHERNOUN];
                                                      TEMPORAL := FALSE;
                                                      ANIMATE := OMEGAANIMATE;
                                                      HUMAN := OMEGAHUMAN;
                                                      ACTCOMAS := [COUNT];
                                                      THETANP := OMEGATHETANP;
                                                      NOUNPATTERNEFS := [];
                                                      MOOD := NOWH;
                                                      GENERIC := OMEGAGENERIC;
                                                      POSSPRED := TRUE;
                                                      POSSNIETNP := FALSE;
                                                      SYNTQUANT := OMEGAQUANT;
                                                      NPHEAD := PERSPRONP;
                                                      SPECQ := YESSPEC;
                                                      POSS := FALSE;
                                                      COORD := NOCOORD;
                                                      END
END;

 FUNCTION LSAUXDOM_CpNPONWEPRSPR
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
IF (CASES = [] ) THEN
IF (GENDERS = [OMEGAGENDER] ) THEN
IF (SEXES = [] ) THEN
IF (ACTSUBCS = [OTHERNOUN] ) THEN
IF (TEMPORAL = FALSE ) THEN
IF (ANIMATE = YESANIMATE ) THEN
IF (HUMAN = YESHUMAN ) THEN
IF (ACTCOMAS = [COUNT] ) THEN
IF (THETANP = OMEGATHETANP ) THEN
IF (NOUNPATTERNEFS = [] ) THEN
IF (MOOD = NOWH ) THEN
IF (GENERIC = OMEGAGENERIC ) THEN
IF (POSSPRED = TRUE ) THEN
IF (POSSNIETNP = FALSE ) THEN
IF (SYNTQUANT = OMEGAQUANT ) THEN
IF (NPHEAD = PERSPRONP ) THEN
IF (SPECQ = YESSPEC ) THEN
IF (POSS = FALSE ) THEN
IF (COORD = NOCOORD ) THEN
      Bool:=TRUE;
  END;{with}
  LSAUXDOM_CpNPONWEPRSPR:=Bool;
END;{function}
 PROCEDURE LSAUXDOM_AsNPONWEPRSPR(VAR rec:LSDOMAINT_NPRECORD);
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
                                                      CASES := [];
                                                      GENDERS := [OMEGAGENDER];
                                                      SEXES := [];
                                                      ACTSUBCS := [OTHERNOUN];
                                                      TEMPORAL := FALSE;
                                                      ANIMATE := YESANIMATE;
                                                      HUMAN := YESHUMAN;
                                                      ACTCOMAS := [COUNT];
                                                      THETANP := OMEGATHETANP;
                                                      NOUNPATTERNEFS := [];
                                                      MOOD := NOWH;
                                                      GENERIC := OMEGAGENERIC;
                                                      POSSPRED := TRUE;
                                                      POSSNIETNP := FALSE;
                                                      SYNTQUANT := OMEGAQUANT;
                                                      NPHEAD := PERSPRONP;
                                                      SPECQ := YESSPEC;
                                                      POSS := FALSE;
                                                      COORD := NOCOORD;
                                                      END
END;

 FUNCTION LSAUXDOM_CpNPONYOUSGPRSPR
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
IF (CASES = [] ) THEN
IF (GENDERS = [OMEGAGENDER] ) THEN
IF (SEXES = [] ) THEN
IF (ACTSUBCS = [OTHERNOUN] ) THEN
IF (TEMPORAL = FALSE ) THEN
IF (ANIMATE = YESANIMATE ) THEN
IF (HUMAN = OMEGAHUMAN ) THEN
IF (ACTCOMAS = [COUNT] ) THEN
IF (THETANP = OMEGATHETANP ) THEN
IF (NOUNPATTERNEFS = [] ) THEN
IF (MOOD = NOWH ) THEN
IF (GENERIC = OMEGAGENERIC ) THEN
IF (POSSPRED = TRUE ) THEN
IF (POSSNIETNP = FALSE ) THEN
IF (SYNTQUANT = OMEGAQUANT ) THEN
IF (NPHEAD = PERSPRONP ) THEN
IF (SPECQ = YESSPEC ) THEN
IF (POSS = FALSE ) THEN
IF (COORD = NOCOORD ) THEN
      Bool:=TRUE;
  END;{with}
  LSAUXDOM_CpNPONYOUSGPRSPR:=Bool;
END;{function}
 PROCEDURE LSAUXDOM_AsNPONYOUSGPRSPR(VAR rec:LSDOMAINT_NPRECORD);
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
                                                      CASES := [];
                                                      GENDERS := [OMEGAGENDER];
                                                      SEXES := [];
                                                      ACTSUBCS := [OTHERNOUN];
                                                      TEMPORAL := FALSE;
                                                      ANIMATE := YESANIMATE;
                                                      HUMAN := OMEGAHUMAN;
                                                      ACTCOMAS := [COUNT];
                                                      THETANP := OMEGATHETANP;
                                                      NOUNPATTERNEFS := [];
                                                      MOOD := NOWH;
                                                      GENERIC := OMEGAGENERIC;
                                                      POSSPRED := TRUE;
                                                      POSSNIETNP := FALSE;
                                                      SYNTQUANT := OMEGAQUANT;
                                                      NPHEAD := PERSPRONP;
                                                      SPECQ := YESSPEC;
                                                      POSS := FALSE;
                                                      COORD := NOCOORD;
                                                      END
END;

 FUNCTION LSAUXDOM_CpNPONYOUPLPRSPR
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
IF (CASES = [] ) THEN
IF (GENDERS = [OMEGAGENDER] ) THEN
IF (SEXES = [] ) THEN
IF (ACTSUBCS = [OTHERNOUN] ) THEN
IF (TEMPORAL = FALSE ) THEN
IF (ANIMATE = YESANIMATE ) THEN
IF (HUMAN = OMEGAHUMAN ) THEN
IF (ACTCOMAS = [COUNT] ) THEN
IF (THETANP = OMEGATHETANP ) THEN
IF (NOUNPATTERNEFS = [] ) THEN
IF (MOOD = NOWH ) THEN
IF (GENERIC = OMEGAGENERIC ) THEN
IF (POSSPRED = TRUE ) THEN
IF (POSSNIETNP = FALSE ) THEN
IF (SYNTQUANT = OMEGAQUANT ) THEN
IF (NPHEAD = PERSPRONP ) THEN
IF (SPECQ = YESSPEC ) THEN
IF (POSS = FALSE ) THEN
IF (COORD = NOCOORD ) THEN
      Bool:=TRUE;
  END;{with}
  LSAUXDOM_CpNPONYOUPLPRSPR:=Bool;
END;{function}
 PROCEDURE LSAUXDOM_AsNPONYOUPLPRSPR(VAR rec:LSDOMAINT_NPRECORD);
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
                                                      CASES := [];
                                                      GENDERS := [OMEGAGENDER];
                                                      SEXES := [];
                                                      ACTSUBCS := [OTHERNOUN];
                                                      TEMPORAL := FALSE;
                                                      ANIMATE := YESANIMATE;
                                                      HUMAN := OMEGAHUMAN;
                                                      ACTCOMAS := [COUNT];
                                                      THETANP := OMEGATHETANP;
                                                      NOUNPATTERNEFS := [];
                                                      MOOD := NOWH;
                                                      GENERIC := OMEGAGENERIC;
                                                      POSSPRED := TRUE;
                                                      POSSNIETNP := FALSE;
                                                      SYNTQUANT := OMEGAQUANT;
                                                      NPHEAD := PERSPRONP;
                                                      SPECQ := YESSPEC;
                                                      POSS := FALSE;
                                                      COORD := NOCOORD;
                                                      END
END;

 FUNCTION LSAUXDOM_CpNPONTHATDMPR
                         (rec:LSDOMAINT_NPRECORD):BOOLEAN;
VAR Bool : BOOLEAN;
BEGIN 
  Bool := FALSE;
  WITH rec DO
  BEGIN
    IF (REQ = [POSPOL,NEGPOL,OMEGAPOL] ) THEN
IF (ENV = [POSPOL,NEGPOL,OMEGAPOL] ) THEN
IF (SUPERDEIXIS = PRESENTDEIXIS ) THEN
IF (CLASS = OMEGATIMEADVCLASS ) THEN
IF (DEIXIS = OMEGADEIXIS ) THEN
IF (ASPECT = OMEGAASPECT ) THEN
IF (RETRO = FALSE ) THEN
IF (DEFINITE = DEF ) THEN
IF (PERSON = 3 ) THEN
IF (NUMBER = SINGULAR ) THEN
IF (CASES = [] ) THEN
IF (GENDERS = [OMEGAGENDER] ) THEN
IF (SEXES = [] ) THEN
IF (ACTSUBCS = [OTHERNOUN] ) THEN
IF (TEMPORAL = FALSE ) THEN
IF (ANIMATE = OMEGAANIMATE ) THEN
IF (HUMAN = OMEGAHUMAN ) THEN
IF (ACTCOMAS = [] ) THEN
IF (THETANP = OMEGATHETANP ) THEN
IF (NOUNPATTERNEFS = [] ) THEN
IF (MOOD = NOWH ) THEN
IF (GENERIC = NOGENERIC ) THEN
IF (POSSPRED = FALSE ) THEN
IF (POSSNIETNP = FALSE ) THEN
IF (SYNTQUANT = OMEGAQUANT ) THEN
IF (NPHEAD = THATNP ) THEN
IF (SPECQ = YESSPEC ) THEN
IF (POSS = FALSE ) THEN
IF (COORD = NOCOORD ) THEN
      Bool:=TRUE;
  END;{with}
  LSAUXDOM_CpNPONTHATDMPR:=Bool;
END;{function}
 PROCEDURE LSAUXDOM_AsNPONTHATDMPR(VAR rec:LSDOMAINT_NPRECORD);
BEGIN
WITH rec DO
BEGIN
REQ := [POSPOL,NEGPOL,OMEGAPOL];
                                                      ENV := [POSPOL,NEGPOL,OMEGAPOL];
                                                      SUPERDEIXIS := PRESENTDEIXIS;
                                                      CLASS := OMEGATIMEADVCLASS;
                                                      DEIXIS := OMEGADEIXIS;
                                                      ASPECT := OMEGAASPECT;
                                                      RETRO := FALSE;
                                                      DEFINITE := DEF;
                                                      PERSON := 3;
                                                      NUMBER := SINGULAR;
                                                      CASES := [];
                                                      GENDERS := [OMEGAGENDER];
                                                      SEXES := [];
                                                      ACTSUBCS := [OTHERNOUN];
                                                      TEMPORAL := FALSE;
                                                      ANIMATE := OMEGAANIMATE;
                                                      HUMAN := OMEGAHUMAN;
                                                      ACTCOMAS := [];
                                                      THETANP := OMEGATHETANP;
                                                      NOUNPATTERNEFS := [];
                                                      MOOD := NOWH;
                                                      GENERIC := NOGENERIC;
                                                      POSSPRED := FALSE;
                                                      POSSNIETNP := FALSE;
                                                      SYNTQUANT := OMEGAQUANT;
                                                      NPHEAD := THATNP;
                                                      SPECQ := YESSPEC;
                                                      POSS := FALSE;
                                                      COORD := NOCOORD;
                                                      END
END;

 FUNCTION LSAUXDOM_CpNPONTHESEDMPR
                         (rec:LSDOMAINT_NPRECORD):BOOLEAN;
VAR Bool : BOOLEAN;
BEGIN 
  Bool := FALSE;
  WITH rec DO
  BEGIN
    IF (REQ = [POSPOL,NEGPOL,OMEGAPOL] ) THEN
IF (ENV = [POSPOL,NEGPOL,OMEGAPOL] ) THEN
IF (SUPERDEIXIS = PRESENTDEIXIS ) THEN
IF (CLASS = OMEGATIMEADVCLASS ) THEN
IF (DEIXIS = OMEGADEIXIS ) THEN
IF (ASPECT = OMEGAASPECT ) THEN
IF (RETRO = FALSE ) THEN
IF (DEFINITE = DEF ) THEN
IF (PERSON = 3 ) THEN
IF (NUMBER = PLURAL ) THEN
IF (CASES = [] ) THEN
IF (GENDERS = [OMEGAGENDER] ) THEN
IF (SEXES = [] ) THEN
IF (ACTSUBCS = [OTHERNOUN] ) THEN
IF (TEMPORAL = FALSE ) THEN
IF (ANIMATE = OMEGAANIMATE ) THEN
IF (HUMAN = OMEGAHUMAN ) THEN
IF (ACTCOMAS = [] ) THEN
IF (THETANP = OMEGATHETANP ) THEN
IF (NOUNPATTERNEFS = [] ) THEN
IF (MOOD = NOWH ) THEN
IF (GENERIC = NOGENERIC ) THEN
IF (POSSPRED = FALSE ) THEN
IF (POSSNIETNP = FALSE ) THEN
IF (SYNTQUANT = OMEGAQUANT ) THEN
IF (NPHEAD = THESENP ) THEN
IF (SPECQ = YESSPEC ) THEN
IF (POSS = FALSE ) THEN
IF (COORD = NOCOORD ) THEN
      Bool:=TRUE;
  END;{with}
  LSAUXDOM_CpNPONTHESEDMPR:=Bool;
END;{function}
 PROCEDURE LSAUXDOM_AsNPONTHESEDMPR(VAR rec:LSDOMAINT_NPRECORD);
BEGIN
WITH rec DO
BEGIN
REQ := [POSPOL,NEGPOL,OMEGAPOL];
                                                      ENV := [POSPOL,NEGPOL,OMEGAPOL];
                                                      SUPERDEIXIS := PRESENTDEIXIS;
                                                      CLASS := OMEGATIMEADVCLASS;
                                                      DEIXIS := OMEGADEIXIS;
                                                      ASPECT := OMEGAASPECT;
                                                      RETRO := FALSE;
                                                      DEFINITE := DEF;
                                                      PERSON := 3;
                                                      NUMBER := PLURAL;
                                                      CASES := [];
                                                      GENDERS := [OMEGAGENDER];
                                                      SEXES := [];
                                                      ACTSUBCS := [OTHERNOUN];
                                                      TEMPORAL := FALSE;
                                                      ANIMATE := OMEGAANIMATE;
                                                      HUMAN := OMEGAHUMAN;
                                                      ACTCOMAS := [];
                                                      THETANP := OMEGATHETANP;
                                                      NOUNPATTERNEFS := [];
                                                      MOOD := NOWH;
                                                      GENERIC := NOGENERIC;
                                                      POSSPRED := FALSE;
                                                      POSSNIETNP := FALSE;
                                                      SYNTQUANT := OMEGAQUANT;
                                                      NPHEAD := THESENP;
                                                      SPECQ := YESSPEC;
                                                      POSS := FALSE;
                                                      COORD := NOCOORD;
                                                      END
END;

 FUNCTION LSAUXDOM_CpNPONTHISDMPR
                         (rec:LSDOMAINT_NPRECORD):BOOLEAN;
VAR Bool : BOOLEAN;
BEGIN 
  Bool := FALSE;
  WITH rec DO
  BEGIN
    IF (REQ = [POSPOL,NEGPOL,OMEGAPOL] ) THEN
IF (ENV = [POSPOL,NEGPOL,OMEGAPOL] ) THEN
IF (SUPERDEIXIS = PRESENTDEIXIS ) THEN
IF (CLASS = OMEGATIMEADVCLASS ) THEN
IF (DEIXIS = OMEGADEIXIS ) THEN
IF (ASPECT = OMEGAASPECT ) THEN
IF (RETRO = FALSE ) THEN
IF (DEFINITE = DEF ) THEN
IF (PERSON = 3 ) THEN
IF (NUMBER = SINGULAR ) THEN
IF (CASES = [] ) THEN
IF (GENDERS = [OMEGAGENDER] ) THEN
IF (SEXES = [] ) THEN
IF (ACTSUBCS = [OTHERNOUN] ) THEN
IF (TEMPORAL = FALSE ) THEN
IF (ANIMATE = OMEGAANIMATE ) THEN
IF (HUMAN = OMEGAHUMAN ) THEN
IF (ACTCOMAS = [] ) THEN
IF (THETANP = OMEGATHETANP ) THEN
IF (NOUNPATTERNEFS = [] ) THEN
IF (MOOD = NOWH ) THEN
IF (GENERIC = NOGENERIC ) THEN
IF (POSSPRED = FALSE ) THEN
IF (POSSNIETNP = FALSE ) THEN
IF (SYNTQUANT = OMEGAQUANT ) THEN
IF (NPHEAD = THISNP ) THEN
IF (SPECQ = YESSPEC ) THEN
IF (POSS = FALSE ) THEN
IF (COORD = NOCOORD ) THEN
      Bool:=TRUE;
  END;{with}
  LSAUXDOM_CpNPONTHISDMPR:=Bool;
END;{function}
 PROCEDURE LSAUXDOM_AsNPONTHISDMPR(VAR rec:LSDOMAINT_NPRECORD);
BEGIN
WITH rec DO
BEGIN
REQ := [POSPOL,NEGPOL,OMEGAPOL];
                                                      ENV := [POSPOL,NEGPOL,OMEGAPOL];
                                                      SUPERDEIXIS := PRESENTDEIXIS;
                                                      CLASS := OMEGATIMEADVCLASS;
                                                      DEIXIS := OMEGADEIXIS;
                                                      ASPECT := OMEGAASPECT;
                                                      RETRO := FALSE;
                                                      DEFINITE := DEF;
                                                      PERSON := 3;
                                                      NUMBER := SINGULAR;
                                                      CASES := [];
                                                      GENDERS := [OMEGAGENDER];
                                                      SEXES := [];
                                                      ACTSUBCS := [OTHERNOUN];
                                                      TEMPORAL := FALSE;
                                                      ANIMATE := OMEGAANIMATE;
                                                      HUMAN := OMEGAHUMAN;
                                                      ACTCOMAS := [];
                                                      THETANP := OMEGATHETANP;
                                                      NOUNPATTERNEFS := [];
                                                      MOOD := NOWH;
                                                      GENERIC := NOGENERIC;
                                                      POSSPRED := FALSE;
                                                      POSSNIETNP := FALSE;
                                                      SYNTQUANT := OMEGAQUANT;
                                                      NPHEAD := THISNP;
                                                      SPECQ := YESSPEC;
                                                      POSS := FALSE;
                                                      COORD := NOCOORD;
                                                      END
END;

 FUNCTION LSAUXDOM_CpNPONTHOSEDMPR
                         (rec:LSDOMAINT_NPRECORD):BOOLEAN;
VAR Bool : BOOLEAN;
BEGIN 
  Bool := FALSE;
  WITH rec DO
  BEGIN
    IF (REQ = [POSPOL,NEGPOL,OMEGAPOL] ) THEN
IF (ENV = [POSPOL,NEGPOL,OMEGAPOL] ) THEN
IF (SUPERDEIXIS = PRESENTDEIXIS ) THEN
IF (CLASS = OMEGATIMEADVCLASS ) THEN
IF (DEIXIS = OMEGADEIXIS ) THEN
IF (ASPECT = OMEGAASPECT ) THEN
IF (RETRO = FALSE ) THEN
IF (DEFINITE = DEF ) THEN
IF (PERSON = 3 ) THEN
IF (NUMBER = PLURAL ) THEN
IF (CASES = [] ) THEN
IF (GENDERS = [OMEGAGENDER] ) THEN
IF (SEXES = [] ) THEN
IF (ACTSUBCS = [OTHERNOUN] ) THEN
IF (TEMPORAL = FALSE ) THEN
IF (ANIMATE = OMEGAANIMATE ) THEN
IF (HUMAN = OMEGAHUMAN ) THEN
IF (ACTCOMAS = [] ) THEN
IF (THETANP = OMEGATHETANP ) THEN
IF (NOUNPATTERNEFS = [] ) THEN
IF (MOOD = NOWH ) THEN
IF (GENERIC = NOGENERIC ) THEN
IF (POSSPRED = FALSE ) THEN
IF (POSSNIETNP = FALSE ) THEN
IF (SYNTQUANT = OMEGAQUANT ) THEN
IF (NPHEAD = THOSENP ) THEN
IF (SPECQ = YESSPEC ) THEN
IF (POSS = FALSE ) THEN
IF (COORD = NOCOORD ) THEN
      Bool:=TRUE;
  END;{with}
  LSAUXDOM_CpNPONTHOSEDMPR:=Bool;
END;{function}
 PROCEDURE LSAUXDOM_AsNPONTHOSEDMPR(VAR rec:LSDOMAINT_NPRECORD);
BEGIN
WITH rec DO
BEGIN
REQ := [POSPOL,NEGPOL,OMEGAPOL];
                                                      ENV := [POSPOL,NEGPOL,OMEGAPOL];
                                                      SUPERDEIXIS := PRESENTDEIXIS;
                                                      CLASS := OMEGATIMEADVCLASS;
                                                      DEIXIS := OMEGADEIXIS;
                                                      ASPECT := OMEGAASPECT;
                                                      RETRO := FALSE;
                                                      DEFINITE := DEF;
                                                      PERSON := 3;
                                                      NUMBER := PLURAL;
                                                      CASES := [];
                                                      GENDERS := [OMEGAGENDER];
                                                      SEXES := [];
                                                      ACTSUBCS := [OTHERNOUN];
                                                      TEMPORAL := FALSE;
                                                      ANIMATE := OMEGAANIMATE;
                                                      HUMAN := OMEGAHUMAN;
                                                      ACTCOMAS := [];
                                                      THETANP := OMEGATHETANP;
                                                      NOUNPATTERNEFS := [];
                                                      MOOD := NOWH;
                                                      GENERIC := NOGENERIC;
                                                      POSSPRED := FALSE;
                                                      POSSNIETNP := FALSE;
                                                      SYNTQUANT := OMEGAQUANT;
                                                      NPHEAD := THOSENP;
                                                      SPECQ := YESSPEC;
                                                      POSS := FALSE;
                                                      COORD := NOCOORD;
                                                      END
END;

 FUNCTION LSAUXDOM_CpNPONWHPRO
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
IF (NUMBER = OMEGANUMBER ) THEN
IF (CASES = [] ) THEN
IF (GENDERS = [OMEGAGENDER] ) THEN
IF (SEXES = [] ) THEN
IF (ACTSUBCS = [OTHERNOUN] ) THEN
IF (TEMPORAL = FALSE ) THEN
IF (ANIMATE = YESANIMATE ) THEN
IF (HUMAN = OMEGAHUMAN ) THEN
IF (ACTCOMAS = [COUNT] ) THEN
IF (THETANP = OMEGATHETANP ) THEN
IF (NOUNPATTERNEFS = [] ) THEN
IF (MOOD = WH ) THEN
IF (GENERIC = OMEGAGENERIC ) THEN
IF (POSSPRED = TRUE ) THEN
IF (POSSNIETNP = FALSE ) THEN
IF (SYNTQUANT = OMEGAQUANT ) THEN
IF (NPHEAD = OTHERNP ) THEN
IF (SPECQ = YESSPEC ) THEN
IF (POSS = TRUE ) THEN
IF (COORD = NOCOORD ) THEN
      Bool:=TRUE;
  END;{with}
  LSAUXDOM_CpNPONWHPRO:=Bool;
END;{function}
 PROCEDURE LSAUXDOM_AsNPONWHPRO(VAR rec:LSDOMAINT_NPRECORD);
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
                                                      NUMBER := OMEGANUMBER;
                                                      CASES := [];
                                                      GENDERS := [OMEGAGENDER];
                                                      SEXES := [];
                                                      ACTSUBCS := [OTHERNOUN];
                                                      TEMPORAL := FALSE;
                                                      ANIMATE := YESANIMATE;
                                                      HUMAN := OMEGAHUMAN;
                                                      ACTCOMAS := [COUNT];
                                                      THETANP := OMEGATHETANP;
                                                      NOUNPATTERNEFS := [];
                                                      MOOD := WH;
                                                      GENERIC := OMEGAGENERIC;
                                                      POSSPRED := TRUE;
                                                      POSSNIETNP := FALSE;
                                                      SYNTQUANT := OMEGAQUANT;
                                                      NPHEAD := OTHERNP;
                                                      SPECQ := YESSPEC;
                                                      POSS := TRUE;
                                                      COORD := NOCOORD;
                                                      END
END;

 FUNCTION LSAUXDOM_CpNPONONEINDFPR
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
IF (DEFINITE = OMEGADEF ) THEN
IF (PERSON = 3 ) THEN
IF (NUMBER = SINGULAR ) THEN
IF (CASES = [] ) THEN
IF (GENDERS = [OMEGAGENDER] ) THEN
IF (SEXES = [] ) THEN
IF (ACTSUBCS = [OTHERNOUN] ) THEN
IF (TEMPORAL = FALSE ) THEN
IF (ANIMATE = OMEGAANIMATE ) THEN
IF (HUMAN = OMEGAHUMAN ) THEN
IF (ACTCOMAS = [COUNT] ) THEN
IF (THETANP = OMEGATHETANP ) THEN
IF (NOUNPATTERNEFS = [] ) THEN
IF (MOOD = NOWH ) THEN
IF (GENERIC = OMEGAGENERIC ) THEN
IF (POSSPRED = FALSE ) THEN
IF (POSSNIETNP = FALSE ) THEN
IF (SYNTQUANT = OMEGAQUANT ) THEN
IF (NPHEAD = OTHERNP ) THEN
IF (SPECQ = YESSPEC ) THEN
IF (POSS = TRUE ) THEN
IF (COORD = NOCOORD ) THEN
      Bool:=TRUE;
  END;{with}
  LSAUXDOM_CpNPONONEINDFPR:=Bool;
END;{function}
 PROCEDURE LSAUXDOM_AsNPONONEINDFPR(VAR rec:LSDOMAINT_NPRECORD);
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
                                                      DEFINITE := OMEGADEF;
                                                      PERSON := 3;
                                                      NUMBER := SINGULAR;
                                                      CASES := [];
                                                      GENDERS := [OMEGAGENDER];
                                                      SEXES := [];
                                                      ACTSUBCS := [OTHERNOUN];
                                                      TEMPORAL := FALSE;
                                                      ANIMATE := OMEGAANIMATE;
                                                      HUMAN := OMEGAHUMAN;
                                                      ACTCOMAS := [COUNT];
                                                      THETANP := OMEGATHETANP;
                                                      NOUNPATTERNEFS := [];
                                                      MOOD := NOWH;
                                                      GENERIC := OMEGAGENERIC;
                                                      POSSPRED := FALSE;
                                                      POSSNIETNP := FALSE;
                                                      SYNTQUANT := OMEGAQUANT;
                                                      NPHEAD := OTHERNP;
                                                      SPECQ := YESSPEC;
                                                      POSS := TRUE;
                                                      COORD := NOCOORD;
                                                      END
END;

 FUNCTION LSAUXDOM_CpNPONTHERETHERE
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
IF (DEFINITE = OMEGADEF ) THEN
IF (PERSON = 3 ) THEN
IF (NUMBER = SINGULAR ) THEN
IF (CASES = [] ) THEN
IF (GENDERS = [OMEGAGENDER] ) THEN
IF (SEXES = [] ) THEN
IF (ACTSUBCS = [OTHERNOUN] ) THEN
IF (TEMPORAL = FALSE ) THEN
IF (ANIMATE = OMEGAANIMATE ) THEN
IF (HUMAN = OMEGAHUMAN ) THEN
IF (ACTCOMAS = [COUNT] ) THEN
IF (THETANP = OMEGATHETANP ) THEN
IF (NOUNPATTERNEFS = [] ) THEN
IF (MOOD = NOWH ) THEN
IF (GENERIC = OMEGAGENERIC ) THEN
IF (POSSPRED = FALSE ) THEN
IF (POSSNIETNP = FALSE ) THEN
IF (SYNTQUANT = OMEGAQUANT ) THEN
IF (NPHEAD = THERENP ) THEN
IF (SPECQ = YESSPEC ) THEN
IF (POSS = TRUE ) THEN
IF (COORD = NOCOORD ) THEN
      Bool:=TRUE;
  END;{with}
  LSAUXDOM_CpNPONTHERETHERE:=Bool;
END;{function}
 PROCEDURE LSAUXDOM_AsNPONTHERETHERE(VAR rec:LSDOMAINT_NPRECORD);
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
                                                      DEFINITE := OMEGADEF;
                                                      PERSON := 3;
                                                      NUMBER := SINGULAR;
                                                      CASES := [];
                                                      GENDERS := [OMEGAGENDER];
                                                      SEXES := [];
                                                      ACTSUBCS := [OTHERNOUN];
                                                      TEMPORAL := FALSE;
                                                      ANIMATE := OMEGAANIMATE;
                                                      HUMAN := OMEGAHUMAN;
                                                      ACTCOMAS := [COUNT];
                                                      THETANP := OMEGATHETANP;
                                                      NOUNPATTERNEFS := [];
                                                      MOOD := NOWH;
                                                      GENERIC := OMEGAGENERIC;
                                                      POSSPRED := FALSE;
                                                      POSSNIETNP := FALSE;
                                                      SYNTQUANT := OMEGAQUANT;
                                                      NPHEAD := THERENP;
                                                      SPECQ := YESSPEC;
                                                      POSS := TRUE;
                                                      COORD := NOCOORD;
                                                      END
END;

 FUNCTION LSAUXDOM_CpPERSPROONTHEY
                         (rec:LSDOMAINT_PERSPRORECORD):BOOLEAN;
VAR Bool : BOOLEAN;
BEGIN 
  Bool := FALSE;
  WITH rec DO
  BEGIN
    IF (PERSON = 3 ) THEN
IF (NUMBER = PLURAL ) THEN
IF (GENDER = OMEGAGENDER ) THEN
IF (ANIMATE = OMEGAANIMATE ) THEN
IF (PREDPOS = TRUE ) THEN
IF (NPHEAD = PERSPRONP ) THEN
IF (PERSPROCASE = NOMINATIVE ) THEN
      Bool:=TRUE;
  END;{with}
  LSAUXDOM_CpPERSPROONTHEY:=Bool;
END;{function}
 PROCEDURE LSAUXDOM_AsPERSPROONTHEY(VAR rec:LSDOMAINT_PERSPRORECORD);
BEGIN
WITH rec DO
BEGIN
PERSON := 3;
                                                      NUMBER := PLURAL;
                                                      GENDER := OMEGAGENDER;
                                                      ANIMATE := OMEGAANIMATE;
                                                      PREDPOS := TRUE;
                                                      NPHEAD := PERSPRONP;
                                                      PERSPROCASE := NOMINATIVE;
                                                      END
END;
 FUNCTION LSAUXDOM_ACCINGCOMPLVPS:LSDOMAINT_SYNPATTERNSETTYPE;
BEGIN
LSAUXDOM_ACCINGCOMPLVPS:=
[SYNCLOSEDGERUND,
VPID76,
VPID79]
END;
 FUNCTION LSAUXDOM_ADJPPREDVPS:LSDOMAINT_SYNPATTERNSETTYPE;
BEGIN
LSAUXDOM_ADJPPREDVPS:=
[SYNOPENADJPPROP,
SYNDONP_OPENADJPPROP,
SYNCLOSEDADJPPROP,
SYNCLOSEDADJPPROP_EMPTY,
SYNCLOSEDADJPPROP_PREPNP,
SYNBE,
VPID88,
VPID165,
VPID142,
VPID84,
VPID99,
VPID129,
VPID156,
VPID161,
VPID177,
VPID174]
END;
 FUNCTION LSAUXDOM_ASIFCOMPLVPS:LSDOMAINT_SYNPATTERNSETTYPE;
BEGIN
LSAUXDOM_ASIFCOMPLVPS:=
[SYNASIFSENT]
END;
 FUNCTION LSAUXDOM_BEGINVPADVRELS:SETOFSYNREL;
BEGIN
LSAUXDOM_BEGINVPADVRELS:=
[]
END;
 FUNCTION LSAUXDOM_CLOSEDCOMPLVPS:LSDOMAINT_SYNPATTERNSETTYPE;
BEGIN
LSAUXDOM_CLOSEDCOMPLVPS:=
[SYNCLOSEDINFSENT,
SYNCLOSEDGERUND,
SYNCLOSEDTOSENT,
SYNEMPTY_CLOSEDTOSENT,
SYNFORTOSENT,
VPID76,
VPID79,
VPID168,
VPID50,
VPID81,
VPID114,
VPID139,
VPID140]
END;
 FUNCTION LSAUXDOM_CLOSEDINFCOMPLVPS:LSDOMAINT_SYNPATTERNSETTYPE;
BEGIN
LSAUXDOM_CLOSEDINFCOMPLVPS:=
[SYNCLOSEDINFSENT,
VPID168,
VPID50,
VPID81,
VPID114]
END;
 FUNCTION LSAUXDOM_CLOSEDVPPVPS:LSDOMAINT_SYNPATTERNSETTYPE;
BEGIN
LSAUXDOM_CLOSEDVPPVPS:=
[SYNCLOSEDVERBPPROP]
END;
 FUNCTION LSAUXDOM_COMPLVPS:LSDOMAINT_SYNPATTERNSETTYPE;
BEGIN
LSAUXDOM_COMPLVPS:=
[SYNOTHERCLOSEDPREPPPROP,
SYNOTHEROPENPREPPPROP]
END;
 FUNCTION LSAUXDOM_COUNTNOUNVPS:LSDOMAINT_SYNPATTERNSETTYPE;
BEGIN
LSAUXDOM_COUNTNOUNVPS:=
[VPID1,
VPID6,
VPID22,
VPID33,
VPID27,
VPID40]
END;
 FUNCTION LSAUXDOM_CTVARCATS:SETOFSYNTCAT;
BEGIN
LSAUXDOM_CTVARCATS:=
[VARPREPP,
VARNP]
END;
 FUNCTION LSAUXDOM_DECLCOMPLVPS:LSDOMAINT_SYNPATTERNSETTYPE;
BEGIN
LSAUXDOM_DECLCOMPLVPS:=
[SYNCLOSEDGERUND,
SYNCLOSEDINFSENT,
SYNCLOSEDTOSENT,
SYNDONP_OPENGERUND,
SYNDONP_OPENTOSENT,
SYNDONP_THATSENT,
SYNEMPTY_CLOSEDTOSENT,
SYNEMPTY_OPENGERUND,
SYNEMPTY_OPENTOSENT,
SYNEMPTY_THATSENT,
SYNFORTOSENT,
SYNIOEMPTY_THATSENT,
SYNIONP_OPENINFSENT,
SYNIONP_OPENTOSENT,
SYNIONP_THATSENT,
SYNITTHATSENT,
SYNOPENGERUND,
SYNOPENGERUND_PREPNP,
SYNOPENINFSENT,
SYNOPENTOSENT,
SYNPREPNP_CLOSEDTOSENT,
SYNPREPNP_ITOPENTOSENT,
SYNPREPNP_OPENTOSENT,
SYNPREPNP_THATSENT,
SYNTHATSENT,
SYNTHATSENT_EMPTY,
SYNTHATSENT_LOCOPENPREPPPROP,
SYNTONP_THATSENT,
SYNASIFSENT,
SYNDONP_OPENINFSENT,
VPID76,
VPID79,
VPID168,
VPID50,
VPID81,
VPID114,
VPID139,
VPID140,
VPID167]
END;
 FUNCTION LSAUXDOM_DIRARGVPS:LSDOMAINT_SYNPATTERNSETTYPE;
BEGIN
LSAUXDOM_DIRARGVPS:=
[SYNDIRCLOSEDPREPPPROP,
SYNDIROPENPREPPPROP,
SYNDONP_DIROPENPREPPPROP,
VPID150,
VPID8,
VPID11,
VPID57,
VPID87,
VPID108,
VPID127,
VPID148,
VPID144,
VPID74,
VPID118,
VPID132,
VPID133,
VPID158]
END;
 FUNCTION LSAUXDOM_EMPTYINDOBJVPS:LSDOMAINT_SYNPATTERNSETTYPE;
BEGIN
LSAUXDOM_EMPTYINDOBJVPS:=
[SYNEMPTY_DONP,
SYNEMPTY_THATSENT,
SYNEMPTY_OPENTOSENT,
SYNEMPTY_MEASUREPHRASE,
SYNEMPTY_QSENT,
SYNEMPTY_PROSENT]
END;
 FUNCTION LSAUXDOM_EMPTYOBJVPS:LSDOMAINT_SYNPATTERNSETTYPE;
BEGIN
LSAUXDOM_EMPTYOBJVPS:=
[SYNEMPTY,
SYNEMPTY_PREPNP]
END;
 FUNCTION LSAUXDOM_EMPTYPREPOBJVPS:LSDOMAINT_SYNPATTERNSETTYPE;
BEGIN
LSAUXDOM_EMPTYPREPOBJVPS:=
[SYNDONP_EMPTY,
SYNCLOSEDADJPPROP_EMPTY,
SYNCLOSEDNPPROP_EMPTY,
SYNPREPNP_EMPTY,
SYNEMPTY_PREP2NP,
SYNOTHERCLOSEDPREPPPROP_EMPTY,
VPID173,
VPID56]
END;
 FUNCTION LSAUXDOM_FINALVPADVRELS:SETOFSYNREL;
BEGIN
LSAUXDOM_FINALVPADVRELS:=
[VPADVREL,
LOCADVREL,
CAUSADVREL]
END;
 FUNCTION LSAUXDOM_FORTOCOMPLVPS:LSDOMAINT_SYNPATTERNSETTYPE;
BEGIN
LSAUXDOM_FORTOCOMPLVPS:=
[SYNFORTOSENT]
END;
 FUNCTION LSAUXDOM_INDCOMPLVPS:LSDOMAINT_SYNPATTERNSETTYPE;
BEGIN
LSAUXDOM_INDCOMPLVPS:=
[SYNDONP_THATSENT,
SYNEMPTY_THATSENT,
SYNIOEMPTY_THATSENT,
SYNIONP_THATSENT,
SYNITTHATSENT,
SYNPREPNP_THATSENT,
SYNTHATSENT,
SYNTHATSENT_EMPTY,
SYNTHATSENT_LOCOPENPREPPPROP,
SYNTONP_THATSENT,
SYNASIFSENT]
END;
 FUNCTION LSAUXDOM_INDOBJVPS:LSDOMAINT_SYNPATTERNSETTYPE;
BEGIN
LSAUXDOM_INDOBJVPS:=
[SYNIONP_DONP,
SYNIONP_PREPNP,
SYNIONP_OPENTOSENT,
SYNIONP_OPENNPPROP,
SYNIONP_PROSENT,
SYNIONP_SOPROSENT,
SYNIONP_QSENT,
SYNIONP_THATSENT,
SYNIONP_MEASUREPHRASE,
VPID48,
VPID169,
VPID89,
VPID25,
VPID45,
VPID24,
VPID128,
VPID2,
VPID56,
VPID44]
END;
 FUNCTION LSAUXDOM_INFCOMPLVPS:LSDOMAINT_SYNPATTERNSETTYPE;
BEGIN
LSAUXDOM_INFCOMPLVPS:=
[SYNCLOSEDINFSENT,
SYNIONP_OPENINFSENT,
SYNOPENINFSENT,
VPID168,
VPID50,
VPID81,
VPID114]
END;
 FUNCTION LSAUXDOM_INFINITECOMPLVPS:LSDOMAINT_SYNPATTERNSETTYPE;
BEGIN
LSAUXDOM_INFINITECOMPLVPS:=
[SYNCLOSEDGERUND,
SYNCLOSEDINFSENT,
SYNCLOSEDTOSENT,
SYNDONP_OPENGERUND,
SYNDONP_OPENTOSENT,
SYNDONP_QSENT,
SYNEMPTY_CLOSEDTOSENT,
SYNEMPTY_OPENGERUND,
SYNEMPTY_OPENTOSENT,
SYNEMPTY_QSENT,
SYNFORTOSENT,
SYNIOEMPTY_QSENT,
SYNIONP_OPENINFSENT,
SYNIONP_OPENTOSENT,
SYNIONP_QSENT,
SYNOPENGERUND,
SYNOPENGERUND_PREPNP,
SYNOPENINFSENT,
SYNOPENTOSENT,
SYNPREPNP_CLOSEDTOSENT,
SYNPREPNP_ITOPENTOSENT,
SYNPREPNP_OPENTOSENT,
SYNPREPNP_QSENT,
SYNQSENT,
SYNTONP_QSENT,
SYNDONP_OPENINFSENT,
VPID76,
VPID79,
VPID168,
VPID50,
VPID81,
VPID114,
VPID139,
VPID140,
VPID167]
END;
 FUNCTION LSAUXDOM_INGCOMPLVPS:LSDOMAINT_SYNPATTERNSETTYPE;
BEGIN
LSAUXDOM_INGCOMPLVPS:=
[SYNCLOSEDGERUND,
SYNDONP_OPENGERUND,
SYNEMPTY_OPENGERUND,
SYNOPENGERUND,
SYNOPENGERUND_PREPNP,
VPID76,
VPID79,
VPID167]
END;
 FUNCTION LSAUXDOM_INSIDEVPRELS:SETOFSYNREL;
BEGIN
LSAUXDOM_INSIDEVPRELS:=
[BYOBJREL,
CAUSADVREL,
COMPLREL,
DIRARGREL,
INDOBJREL,
LOCADVREL,
LOCARGREL,
OBJREL,
PARTREL,
PREDREL,
PREPOBJREL,
VPADVREL]
END;
 FUNCTION LSAUXDOM_LOCARGVPS:LSDOMAINT_SYNPATTERNSETTYPE;
BEGIN
LSAUXDOM_LOCARGVPS:=
[SYNLOCCLOSEDPREPPPROP,
SYNLOCOPENPREPPPROP,
SYNDONP_LOCOPENPREPPPROP,
VPID3,
VPID23,
VPID52,
VPID11,
VPID35,
VPID122,
VPID22,
VPID61,
VPID110,
VPID147,
VPID86,
VPID20,
VPID121,
VPID17,
VPID101,
VPID104,
VPID19,
VPID10,
VPID47,
VPID46,
VPID54,
VPID154,
VPID109,
VPID176,
VPID85,
VPID135,
VPID141,
VPID138,
VPID136,
VPID32,
VPID134,
VPID157,
VPID146,
VPID51,
VPID170]
END;
 FUNCTION LSAUXDOM_MASSNOUNVPS:LSDOMAINT_SYNPATTERNSETTYPE;
BEGIN
LSAUXDOM_MASSNOUNVPS:=
[VPID21,
VPID4]
END;
 FUNCTION LSAUXDOM_NPPREDVPS:LSDOMAINT_SYNPATTERNSETTYPE;
BEGIN
LSAUXDOM_NPPREDVPS:=
[SYNOPENNPPROP,
SYNDONP_OPENNPPROP,
SYNIONP_OPENNPPROP,
SYNMEASUREPHRASE,
SYNIONP_MEASUREPHRASE,
SYNEMPTY_MEASUREPHRASE,
SYNCLOSEDNPPROP,
SYNCLOSEDNPPROP_EMPTY,
SYNCLOSEDNPPROP_PREPNP,
SYNBE,
VPID159,
VPID26,
VPID29,
VPID12,
VPID125]
END;
 FUNCTION LSAUXDOM_OBJVPS:LSDOMAINT_SYNPATTERNSETTYPE;
BEGIN
LSAUXDOM_OBJVPS:=
[SYNNP,
SYNLOCCLOSEDPREPPPROP,
SYNDONP_EMPTY,
SYNDONP_OPENADJPPROP,
SYNDONP_OPENNPPROP,
SYNDONP_LOCOPENPREPPPROP,
SYNDONP_DIROPENPREPPPROP,
SYNDONP_PREPNP,
SYNDONP_PREPOPENGERUND,
SYNDONP_PREPOPENADJPPROP,
SYNDONP_PREPOPENNPPROP,
SYNIONP_DONP,
SYNBE,
SYNCLOSEDVERBPPROP,
SYNDONP_OPENTOSENT,
SYNDONP_OPENINFSENT,
SYNDONP_OPENGERUND,
SYNDONP_OTHEROPENPREPPPROP,
SYNDONP_PREPOTHEROPENPREPPPROP,
SYNDONP_PREPQSENT,
SYNDONP_PROSENT,
SYNDONP_QSENT,
SYNDONP_THATSENT,
SYNCLOSEDADJPPROP,
SYNCLOSEDADJPPROP_EMPTY,
SYNCLOSEDADJPPROP_PREPNP,
SYNCLOSEDNPPROP,
SYNCLOSEDNPPROP_EMPTY,
SYNCLOSEDNPPROP_PREPNP,
SYNDIRCLOSEDPREPPPROP,
SYNIONP_PREPCLOSEDADJPPROP,
SYNOTHERCLOSEDPREPPPROP,
SYNOTHERCLOSEDPREPPPROP_EMPTY,
SYNOTHERCLOSEDPREPPPROP_PREPNP,
SYNPREPCLOSEDNPPROP,
SYNPREPOTHERCLOSEDPREPPPROP,
VPID88,
VPID165,
VPID142,
VPID84,
VPID99,
VPID129,
VPID156,
VPID161,
VPID177,
VPID159,
VPID26,
VPID150,
VPID8,
VPID11,
VPID57,
VPID87,
VPID108,
VPID127,
VPID148,
VPID144,
VPID74,
VPID118,
VPID132,
VPID133,
VPID158,
VPID173,
VPID3,
VPID23,
VPID52,
VPID35,
VPID122,
VPID22,
VPID61,
VPID110,
VPID147,
VPID86,
VPID20,
VPID121,
VPID17,
VPID101,
VPID104,
VPID19,
VPID174,
VPID29,
VPID12,
VPID125,
VPID9,
VPID105,
VPID131,
VPID15,
VPID80,
VPID90,
VPID92,
VPID96,
VPID91,
VPID115,
VPID94,
VPID93,
VPID95,
VPID97,
VPID16,
VPID39,
VPID31,
VPID116,
VPID117,
VPID119,
VPID48,
VPID169,
VPID89,
VPID25,
VPID45,
VPID24,
VPID128,
VPID2,
VPID56,
VPID44,
VPID56,
VPID10,
VPID47,
VPID46,
VPID54,
VPID154,
VPID109,
VPID176,
VPID85,
VPID135,
VPID141,
VPID138,
VPID136,
VPID175,
VPID21,
VPID151,
VPID69,
VPID40,
VPID102,
VPID63,
VPID65,
VPID66,
VPID71,
VPID67,
VPID124,
VPID106,
VPID103,
VPID153,
VPID68,
VPID27,
VPID78,
VPID112,
VPID83,
VPID33,
VPID64,
VPID42,
VPID62,
VPID100,
VPID172,
VPID1,
VPID58,
VPID14,
VPID28,
VPID55,
VPID149,
VPID166,
VPID4,
VPID6,
VPID13,
VPID36,
VPID152,
VPID38,
VPID43,
VPID123,
VPID5,
VPID53,
VPID75,
VPID111,
VPID120,
VPID130,
VPID77,
VPID11,
VPID164,
VPID160,
VPID137,
VPID155,
VPID143,
VPID34,
VPID18,
VPID163,
VPID162,
VPID59,
VPID98,
VPID73,
VPID72,
VPID37,
VPID82]
END;
 FUNCTION LSAUXDOM_OPENCOMPLVPS:LSDOMAINT_SYNPATTERNSETTYPE;
BEGIN
LSAUXDOM_OPENCOMPLVPS:=
[SYNDONP_OPENGERUND,
SYNDONP_OPENTOSENT,
SYNDONP_QSENT,
SYNEMPTY_OPENGERUND,
SYNDONP_OPENINFSENT,
SYNEMPTY_OPENTOSENT,
SYNEMPTY_QSENT,
SYNIOEMPTY_QSENT,
SYNIONP_OPENINFSENT,
SYNIONP_OPENTOSENT,
SYNIONP_QSENT,
SYNOPENGERUND,
SYNOPENGERUND_PREPNP,
SYNOPENINFSENT,
SYNOPENTOSENT,
SYNPREPNP_ITOPENTOSENT,
SYNPREPNP_OPENTOSENT,
SYNPREPNP_QSENT,
SYNQSENT,
SYNTONP_QSENT,
VPID167]
END;
 FUNCTION LSAUXDOM_OPENINFCOMPLVPS:LSDOMAINT_SYNPATTERNSETTYPE;
BEGIN
LSAUXDOM_OPENINFCOMPLVPS:=
[SYNOPENINFSENT]
END;
 FUNCTION LSAUXDOM_OPENINGCOMPLVPS:LSDOMAINT_SYNPATTERNSETTYPE;
BEGIN
LSAUXDOM_OPENINGCOMPLVPS:=
[SYNDONP_OPENGERUND,
SYNEMPTY_OPENGERUND,
SYNOPENGERUND,
SYNOPENGERUND_PREPNP,
VPID167]
END;
 FUNCTION LSAUXDOM_OTHERADVSUBCS:LSDOMAINT_ADVSUBCSETTYPE;
BEGIN
LSAUXDOM_OTHERADVSUBCS:=
[OTHERADV]
END;
 FUNCTION LSAUXDOM_OTHERPREPSUBCS:LSDOMAINT_PREPSUBCSETTYPE;
BEGIN
LSAUXDOM_OTHERPREPSUBCS:=
[OTHER]
END;
 FUNCTION LSAUXDOM_PLURALNOUNVPS:LSDOMAINT_SYNPATTERNSETTYPE;
BEGIN
LSAUXDOM_PLURALNOUNVPS:=
[VPID27]
END;
 FUNCTION LSAUXDOM_POSTAUXADVRELS:SETOFSYNREL;
BEGIN
LSAUXDOM_POSTAUXADVRELS:=
[CAUSADVREL,
LOCADVREL]
END;
 FUNCTION LSAUXDOM_POSTOBJVPRELS:SETOFSYNREL;
BEGIN
LSAUXDOM_POSTOBJVPRELS:=
[VPADVREL,
AGVPADVREL,
LOCADVREL,
CAUSADVREL,
PREPOBJREL,
LOCARGREL,
DIRARGREL,
COMPLREL,
PREDREL,
BYOBJREL]
END;
 FUNCTION LSAUXDOM_POSTPREPOBJVPRELS:SETOFSYNREL;
BEGIN
LSAUXDOM_POSTPREPOBJVPRELS:=
[VPADVREL,
LOCADVREL,
CAUSADVREL,
PREPOBJREL,
COMPLREL,
BYOBJREL]
END;
 FUNCTION LSAUXDOM_POSTVPADVRELS:SETOFSYNREL;
BEGIN
LSAUXDOM_POSTVPADVRELS:=
[TEMPADVREL,
INSTRADVREL,
LOCADVREL,
POSTSENTADVREL]
END;
 FUNCTION LSAUXDOM_POSTVPRELS:SETOFSYNREL;
BEGIN
LSAUXDOM_POSTVPRELS:=
[EXTRAPOSREL,
INSTRADVREL,
LOCADVREL,
PUNCREL,
RELSENTREL,
POSTSENTADVREL,
TEMPADVREL]
END;
 FUNCTION LSAUXDOM_PREAUXADVRELS:SETOFSYNREL;
BEGIN
LSAUXDOM_PREAUXADVRELS:=
[SUBJVPADVREL]
END;
 FUNCTION LSAUXDOM_PREOBJVPRELS:SETOFSYNREL;
BEGIN
LSAUXDOM_PREOBJVPRELS:=
[PARTREL,
INDOBJREL]
END;
 FUNCTION LSAUXDOM_PREPOBJVPS:LSDOMAINT_SYNPATTERNSETTYPE;
BEGIN
LSAUXDOM_PREPOBJVPS:=
[SYNPREPNP,
SYNDONP_PREPNP,
SYNIONP_PREPNP,
SYNEMPTY_PREPNP,
SYNPREPNP_EMPTY,
SYNPREPNP_PREPNP,
SYNPREPOPENGERUND,
SYNPREPCLOSEDGERUND,
SYNPREPOPENNPPROP,
SYNPREPCLOSEDNPPROP,
SYNPREPCLOSEDADJPPROP,
SYNPREPCLOSEDTOSENT,
SYNPREPMEASUREPHRASE,
SYNPREPOTHERCLOSEDPREPPPROP,
SYNPREPQSENT,
SYNPREPTHATSENT,
SYNPREPNP_QSENT,
SYNPREPNP_THATSENT,
SYNPREPNP_CLOSEDTOSENT,
SYNPREPNP_OPENTOSENT,
SYNIONP_PREPCLOSEDADJPPROP,
SYNDONP_PREPOPENNPPROP,
SYNDONP_PREPOTHEROPENPREPPPROP,
SYNDONP_PREPOPENADJPPROP,
SYNDONP_PREPOPENGERUND,
SYNEMPTY_PREPOPENGERUND,
SYNDONP_PREPQSENT,
SYNOTHERCLOSEDPREPPPROP_PREPNP,
SYNCLOSEDADJPPROP_PREPNP,
SYNCLOSEDNPPROP_PREPNP,
VPID15,
VPID80,
VPID90,
VPID92,
VPID96,
VPID91,
VPID115,
VPID94,
VPID93,
VPID95,
VPID97,
VPID16,
VPID39,
VPID31,
VPID116,
VPID117,
VPID119,
VPID48,
VPID7,
VPID30,
VPID49,
VPID41,
VPID60,
VPID40,
VPID70,
VPID145,
VPID128]
END;
 FUNCTION LSAUXDOM_PREPPPREDVPS:LSDOMAINT_SYNPATTERNSETTYPE;
BEGIN
LSAUXDOM_PREPPPREDVPS:=
[SYNBE,
SYNOTHERCLOSEDPREPPPROP,
SYNOTHEROPENPREPPPROP,
SYNOTHERCLOSEDPREPPPROP_EMPTY,
SYNDONP_OTHEROPENPREPPPROP,
SYNOTHERCLOSEDPREPPPROP_PREPNP,
VPID9,
VPID105,
VPID131]
END;
 FUNCTION LSAUXDOM_QCOMPLVPS:LSDOMAINT_SYNPATTERNSETTYPE;
BEGIN
LSAUXDOM_QCOMPLVPS:=
[SYNDONP_QSENT,
SYNEMPTY_QSENT,
SYNIOEMPTY_QSENT,
SYNIONP_QSENT,
SYNPREPNP_QSENT,
SYNQSENT,
SYNTONP_QSENT]
END;
 FUNCTION LSAUXDOM_SUBJCOMPLVPS:LSDOMAINT_SYNPATTERNSETTYPE;
BEGIN
LSAUXDOM_SUBJCOMPLVPS:=
[]
END;
 FUNCTION LSAUXDOM_UNIQUERELS:SETOFSYNREL;
BEGIN
LSAUXDOM_UNIQUERELS:=
[HEAD,
OBJREL,
PREDREL,
SUBJREL]
END;
 FUNCTION LSAUXDOM_PRESUBJRELS:SETOFSYNREL;
BEGIN
LSAUXDOM_PRESUBJRELS:=
[SHIFTREL,
LEFTDISLOCREL]
END;
 FUNCTION LSAUXDOM_PREPREPOBJVPRELS:SETOFSYNREL;
BEGIN
LSAUXDOM_PREPREPOBJVPRELS:=
[PARTREL,
OBJREL,
PREDREL,
COMPLREL,
PREPOBJREL,
INDOBJREL]
END;
 FUNCTION LSAUXDOM_PREVPRELS:SETOFSYNREL;
BEGIN
LSAUXDOM_PREVPRELS:=
[AUXREL,
CAUSADVREL,
CONJREL,
LEFTDISLOCREL,
MELTNEGREL,
MODREL,
NEGREL,
POSREL,
PUNCREL,
SHIFTREL,
SUBJREL,
SUBJVPADVREL]
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
[SYNPROSENT,
SYNIONP_PROSENT,
SYNEMPTY_PROSENT]
END;
 FUNCTION LSAUXDOM_RAISINGVPS:LSDOMAINT_SYNPATTERNSETTYPE;
BEGIN
LSAUXDOM_RAISINGVPS:=
[SYNCLOSEDADJPPROP,
SYNPREPCLOSEDADJPPROP,
SYNCLOSEDADJPPROP_EMPTY,
SYNCLOSEDADJPPROP_PREPNP,
SYNIONP_PREPCLOSEDADJPPROP,
SYNCLOSEDNPPROP,
SYNCLOSEDNPPROP_EMPTY,
SYNCLOSEDNPPROP_PREPNP,
SYNPREPCLOSEDNPPROP,
SYNCLOSEDTOSENT,
SYNPREPCLOSEDTOSENT,
SYNPREPNP_CLOSEDTOSENT,
SYNCLOSEDINFSENT,
SYNCLOSEDGERUND,
SYNPREPCLOSEDGERUND,
SYNCLOSEDVERBPPROP,
SYNDIRCLOSEDPREPPPROP,
SYNLOCCLOSEDPREPPPROP,
SYNOTHERCLOSEDPREPPPROP,
SYNPREPOTHERCLOSEDPREPPPROP,
SYNOTHERCLOSEDPREPPPROP_EMPTY,
SYNOTHERCLOSEDPREPPPROP_PREPNP,
VPID88,
VPID165,
VPID142,
VPID84,
VPID99,
VPID129,
VPID156,
VPID161,
VPID177,
VPID76,
VPID79,
VPID168,
VPID50,
VPID81,
VPID114,
VPID159,
VPID26,
VPID139,
VPID140,
VPID150,
VPID10,
VPID47,
VPID46,
VPID54,
VPID154,
VPID109,
VPID176,
VPID85,
VPID135,
VPID141,
VPID138,
VPID136]
END;
 FUNCTION LSAUXDOM_SENTENCERELS:SETOFSYNREL;
BEGIN
LSAUXDOM_SENTENCERELS:=
[LEFTDISLOCREL,
SUBJREL,
COMPLREL,
EXTRAPOSREL,
PREPOBJREL,
POSTSENTADVREL]
END;
 FUNCTION LSAUXDOM_SENTCOMPLVPS:LSDOMAINT_SYNPATTERNSETTYPE;
BEGIN
LSAUXDOM_SENTCOMPLVPS:=
[SYNASIFSENT,
SYNCLOSEDINFSENT,
SYNCLOSEDTOSENT,
SYNDONP_OPENTOSENT,
SYNDONP_QSENT,
SYNDONP_THATSENT,
SYNEMPTY_CLOSEDTOSENT,
SYNEMPTY_OPENTOSENT,
SYNEMPTY_QSENT,
SYNEMPTY_THATSENT,
SYNFORTOSENT,
SYNIOEMPTY_THATSENT,
SYNIOEMPTY_QSENT,
SYNIONP_OPENINFSENT,
SYNIONP_OPENTOSENT,
SYNIONP_QSENT,
SYNIONP_THATSENT,
SYNITTHATSENT,
SYNOPENINFSENT,
SYNOPENTOSENT,
SYNPREPNP_CLOSEDTOSENT,
SYNPREPNP_ITOPENTOSENT,
SYNPREPNP_OPENTOSENT,
SYNPREPNP_QSENT,
SYNPREPNP_THATSENT,
SYNQSENT,
SYNTHATSENT,
SYNTHATSENT_EMPTY,
SYNTHATSENT_LOCOPENPREPPPROP,
SYNTONP_THATSENT,
SYNTONP_QSENT,
SYNCLOSEDGERUND,
SYNDONP_OPENGERUND,
SYNEMPTY_OPENGERUND,
SYNOPENGERUND,
SYNOPENGERUND_PREPNP,
SYNDONP_OPENINFSENT,
VPID76,
VPID79,
VPID168,
VPID50,
VPID81,
VPID114,
VPID139,
VPID140,
VPID167]
END;
 FUNCTION LSAUXDOM_SOPROSENTVPS:LSDOMAINT_SYNPATTERNSETTYPE;
BEGIN
LSAUXDOM_SOPROSENTVPS:=
[SYNSOPROSENT,
SYNIONP_SOPROSENT]
END;
 FUNCTION LSAUXDOM_THATCOMPLVPS:LSDOMAINT_SYNPATTERNSETTYPE;
BEGIN
LSAUXDOM_THATCOMPLVPS:=
[SYNEMPTY_THATSENT,
SYNIOEMPTY_THATSENT,
SYNIONP_THATSENT,
SYNITTHATSENT,
SYNPREPNP_THATSENT,
SYNPREPTHATSENT,
SYNTHATSENT,
SYNTHATSENT_EMPTY,
SYNTHATSENT_LOCOPENPREPPPROP,
SYNTONP_THATSENT]
END;
 FUNCTION LSAUXDOM_TOINFCOMPLVPS:LSDOMAINT_SYNPATTERNSETTYPE;
BEGIN
LSAUXDOM_TOINFCOMPLVPS:=
[SYNCLOSEDTOSENT,
SYNDONP_OPENTOSENT,
SYNDONP_QSENT,
SYNEMPTY_CLOSEDTOSENT,
SYNEMPTY_OPENTOSENT,
SYNEMPTY_QSENT,
SYNFORTOSENT,
SYNIOEMPTY_QSENT,
SYNIONP_OPENTOSENT,
SYNIONP_QSENT,
SYNOPENTOSENT,
SYNPREPNP_CLOSEDTOSENT,
SYNPREPNP_ITOPENTOSENT,
SYNPREPNP_OPENTOSENT,
SYNPREPNP_QSENT,
SYNQSENT,
SYNTONP_QSENT,
VPID139,
VPID140]
END;
 FUNCTION LSAUXDOM_TWOPREPOBJVPS:LSDOMAINT_SYNPATTERNSETTYPE;
BEGIN
LSAUXDOM_TWOPREPOBJVPS:=
[SYNEMPTY_PREPNP,
SYNEMPTY_PREP2NP,
SYNPREPNP_PREPNP]
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
VERBPPROPVAR,
CNVAR,
PROSENTVAR,
EMPTYVAR,
NEGVAR,
POSVAR,
CLAUSEVAR,
PREPPVAR,
ADVPVAR]
END;
 FUNCTION LSAUXDOM_CLOSEDXPPVPS:LSDOMAINT_SYNPATTERNSETTYPE;
BEGIN
LSAUXDOM_CLOSEDXPPVPS:=
[SYNCLOSEDADJPPROP,
SYNCLOSEDADJPPROP_EMPTY,
SYNCLOSEDADJPPROP_PREPNP,
SYNCLOSEDGERUND,
SYNCLOSEDINFSENT,
SYNCLOSEDNPPROP,
SYNCLOSEDNPPROP_EMPTY,
SYNCLOSEDNPPROP_PREPNP,
SYNCLOSEDTOSENT,
SYNCLOSEDVERBPPROP,
SYNDIRCLOSEDPREPPPROP,
SYNEMPTY_CLOSEDTOSENT,
SYNIONP_PREPCLOSEDADJPPROP,
SYNLOCCLOSEDPREPPPROP,
SYNOTHERCLOSEDPREPPPROP,
SYNOTHERCLOSEDPREPPPROP_EMPTY,
SYNOTHERCLOSEDPREPPPROP_PREPNP,
SYNPREPCLOSEDADJPPROP,
SYNPREPCLOSEDGERUND,
SYNPREPCLOSEDNPPROP,
SYNPREPCLOSEDTOSENT,
SYNPREPNP_CLOSEDTOSENT,
SYNPREPOTHERCLOSEDPREPPPROP,
VPID88,
VPID165,
VPID142,
VPID84,
VPID99,
VPID129,
VPID156,
VPID161,
VPID177,
VPID76,
VPID79,
VPID168,
VPID50,
VPID81,
VPID114,
VPID159,
VPID26,
VPID139,
VPID140,
VPID150,
VPID10,
VPID47,
VPID46,
VPID54,
VPID154,
VPID109,
VPID176,
VPID85,
VPID135,
VPID141,
VPID138,
VPID136]
END;
 FUNCTION LSAUXDOM_OPENXPPVPS:LSDOMAINT_SYNPATTERNSETTYPE;
BEGIN
LSAUXDOM_OPENXPPVPS:=
[SYNDIROPENPREPPPROP,
SYNDONP_DIROPENPREPPPROP,
SYNDONP_LOCOPENPREPPPROP,
SYNDONP_OPENADJPPROP,
SYNDONP_OPENGERUND,
SYNDONP_OPENNPPROP,
SYNDONP_OPENTOSENT,
SYNDONP_OTHEROPENPREPPPROP,
SYNDONP_PREPOPENADJPPROP,
SYNDONP_PREPOPENGERUND,
SYNDONP_PREPOPENNPPROP,
SYNDONP_PREPOTHEROPENPREPPPROP,
SYNDONP_OPENINFSENT,
SYNEMPTY_MEASUREPHRASE,
SYNEMPTY_OPENGERUND,
SYNEMPTY_OPENTOSENT,
SYNEMPTY_PREPOPENGERUND,
SYNIONP_MEASUREPHRASE,
SYNIONP_OPENINFSENT,
SYNIONP_OPENNPPROP,
SYNIONP_OPENTOSENT,
SYNIONP_PREPOPENGERUND,
SYNLOCOPENPREPPPROP,
SYNMEASUREPHRASE,
SYNOPENADJPPROP,
SYNOPENGERUND,
SYNOPENGERUND_PREPNP,
SYNOPENINFSENT,
SYNOPENTOINFSENTPROOBJ,
SYNOPENNPPROP,
SYNOPENTOSENT,
SYNOPENVERBPPROP,
SYNOTHEROPENPREPPPROP,
SYNPREPMEASUREPHRASE,
SYNPREPNP_ITOPENTOSENT,
SYNPREPNP_OPENTOSENT,
SYNPREPNP_PREPOPENGERUND,
SYNPREPOPENGERUND,
SYNPREPOPENNPPROP,
SYNPREPOPENTOSENT,
SYNTHATSENT_LOCOPENPREPPPROP,
VPID8,
VPID11,
VPID57,
VPID87,
VPID108,
VPID127,
VPID148,
VPID144,
VPID74,
VPID118,
VPID132,
VPID133,
VPID158,
VPID3,
VPID23,
VPID52,
VPID11,
VPID35,
VPID122,
VPID22,
VPID61,
VPID110,
VPID147,
VPID86,
VPID20,
VPID121,
VPID17,
VPID101,
VPID104,
VPID19,
VPID174,
VPID29,
VPID12,
VPID125,
VPID9,
VPID105,
VPID131,
VPID32,
VPID134,
VPID157,
VPID146,
VPID51,
VPID170,
VPID167]
END;
 FUNCTION LSAUXDOM_SPECIALNPS:SETOFNPHEADTYPE;
BEGIN
LSAUXDOM_SPECIALNPS:=
[REFLNP,
RECIPRONP,
SENTNP,
OPENINGNP,
ITNP,
THERENP,
THISNP,
THATNP,
THESENP,
THOSENP]
END;
 FUNCTION LSAUXDOM_SUBJIDVPS:LSDOMAINT_SYNPATTERNSETTYPE;
BEGIN
LSAUXDOM_SUBJIDVPS:=
[]
END;
 FUNCTION LSAUXDOM_OBJIDVPS:LSDOMAINT_SYNPATTERNSETTYPE;
BEGIN
LSAUXDOM_OBJIDVPS:=
[VPID8,
VPID11,
VPID57,
VPID87,
VPID108,
VPID127,
VPID148,
VPID144,
VPID74,
VPID118,
VPID132,
VPID133,
VPID158,
VPID173,
VPID3,
VPID23,
VPID52,
VPID35,
VPID122,
VPID22,
VPID61,
VPID110,
VPID147,
VPID86,
VPID20,
VPID121,
VPID17,
VPID101,
VPID104,
VPID19,
VPID174,
VPID29,
VPID12,
VPID125,
VPID9,
VPID105,
VPID131,
VPID15,
VPID80,
VPID90,
VPID92,
VPID96,
VPID91,
VPID115,
VPID94,
VPID93,
VPID95,
VPID97,
VPID16,
VPID39,
VPID31,
VPID116,
VPID117,
VPID119,
VPID48,
VPID169,
VPID89,
VPID25,
VPID45,
VPID24,
VPID128,
VPID2,
VPID56,
VPID21,
VPID151,
VPID69,
VPID40,
VPID102,
VPID63,
VPID65,
VPID66,
VPID71,
VPID67,
VPID124,
VPID106,
VPID103,
VPID153,
VPID68,
VPID27,
VPID78,
VPID112,
VPID83,
VPID33,
VPID64,
VPID42,
VPID62,
VPID100,
VPID172,
VPID1,
VPID171,
VPID58,
VPID58,
VPID14,
VPID28,
VPID55,
VPID149,
VPID166,
VPID4,
VPID6,
VPID13,
VPID36,
VPID152,
VPID38,
VPID43,
VPID123,
VPID5,
VPID53,
VPID75,
VPID111,
VPID120,
VPID130,
VPID77,
VPID11,
VPID164,
VPID160,
VPID137,
VPID155,
VPID143,
VPID34,
VPID18,
VPID163,
VPID162,
VPID59,
VPID98,
VPID73,
VPID72,
VPID37,
VPID82]
END;
 FUNCTION LSAUXDOM_INDOBJIDVPS:LSDOMAINT_SYNPATTERNSETTYPE;
BEGIN
LSAUXDOM_INDOBJIDVPS:=
[VPID48,
VPID169,
VPID89,
VPID25,
VPID45,
VPID24,
VPID128,
VPID2,
VPID56]
END;
 FUNCTION LSAUXDOM_CLOSEDPREDVPS:LSDOMAINT_SYNPATTERNSETTYPE;
BEGIN
LSAUXDOM_CLOSEDPREDVPS:=
[SYNCLOSEDNPPROP,
SYNCLOSEDNPPROP_EMPTY,
SYNCLOSEDNPPROP_PREPNP,
SYNBE,
SYNCLOSEDADJPPROP,
SYNCLOSEDADJPPROP_EMPTY,
SYNCLOSEDADJPPROP_PREPNP,
VPID88,
VPID165,
VPID142,
VPID84,
VPID99,
VPID129,
VPID156,
VPID161,
VPID177,
VPID159,
VPID26]
END;
 FUNCTION LSAUXDOM_POPREDVPS:LSDOMAINT_SYNPATTERNSETTYPE;
BEGIN
LSAUXDOM_POPREDVPS:=
[SYNPREPCLOSEDADJPPROP,
SYNPREPCLOSEDNPPROP,
SYNPREPOPENNPPROP,
SYNPREPOPENGERUND,
SYNIONP_PREPCLOSEDADJPPROP,
SYNIONP_PREPOPENGERUND,
SYNPREPMEASUREPHRASE,
SYNBE,
SYNDONP_PREPOPENGERUND,
SYNDONP_PREPOPENADJPPROP,
SYNDONP_PREPOPENNPPROP,
SYNDONP_PREPOTHEROPENPREPPPROP,
SYNEMPTY_PREPOPENGERUND]
END;
 FUNCTION LSAUXDOM_LOCADVIDVPS:LSDOMAINT_SYNPATTERNSETTYPE;
BEGIN
LSAUXDOM_LOCADVIDVPS:=
[]
END;
 FUNCTION LSAUXDOM_POIDVPS:LSDOMAINT_SYNPATTERNSETTYPE;
BEGIN
LSAUXDOM_POIDVPS:=
[VPID7,
VPID30,
VPID49,
VPID41,
VPID60,
VPID40,
VPID70,
VPID145,
VPID128]
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
[SYNASIFSENT,
SYNCLOSEDADJPPROP,
SYNCLOSEDGERUND,
SYNCLOSEDINFSENT,
SYNCLOSEDNPPROP,
SYNCLOSEDTOSENT,
SYNCLOSEDVERBPPROP,
SYNDIRCLOSEDPREPPPROP,
SYNEMPTY,
SYNFORTOSENT,
SYNFRONTSOPROSENT,
SYNITTHATSENT,
SYNLOCCLOSEDPREPPPROP,
SYNLOCEMPTY,
SYNNOTPROSENT,
SYNNP,
SYNOTHERCLOSEDPREPPPROP,
SYNPREPCLOSEDADJPPROP,
SYNPREPCLOSEDGERUND,
SYNPREPCLOSEDNPPROP,
SYNPREPCLOSEDTOSENT,
SYNPREPEMPTY,
SYNPREPNP,
SYNPREPOTHERCLOSEDPREPPPROP,
SYNPREPQSENT,
SYNPREPTHATSENT,
SYNPROSENT,
SYNQSENT,
SYNSOPROSENT,
SYNTHATSENT,
VPID1,
VPID21,
VPID4,
VPID6,
VPID5,
VPID88,
VPID165,
VPID142,
VPID84,
VPID99,
VPID129,
VPID156,
VPID161,
VPID177,
VPID76,
VPID79,
VPID168,
VPID50,
VPID81,
VPID114,
VPID159,
VPID26,
VPID139,
VPID140,
VPID150,
VPID10,
VPID47,
VPID46,
VPID54,
VPID154,
VPID109,
VPID176,
VPID85,
VPID135,
VPID141,
VPID138,
VPID136,
VPID175,
VPID21,
VPID151,
VPID69,
VPID40,
VPID102,
VPID63,
VPID65,
VPID66,
VPID71,
VPID67,
VPID124,
VPID106,
VPID103,
VPID153,
VPID68,
VPID27,
VPID78,
VPID112,
VPID83,
VPID33,
VPID64,
VPID42,
VPID62,
VPID100,
VPID172,
VPID1,
VPID58,
VPID14,
VPID28,
VPID55,
VPID149,
VPID166,
VPID13,
VPID36,
VPID152,
VPID38,
VPID43,
VPID123,
VPID5,
VPID53,
VPID75,
VPID111,
VPID120,
VPID130,
VPID77,
VPID11,
VPID164,
VPID160,
VPID137,
VPID155,
VPID143,
VPID34,
VPID18,
VPID163,
VPID162,
VPID59,
VPID98,
VPID73,
VPID72,
VPID37,
VPID82,
VPID7,
VPID30,
VPID49,
VPID41,
VPID60,
VPID40,
VPID70,
VPID145,
VPID128]
END;
 FUNCTION LSAUXDOM_VP120VPS:LSDOMAINT_SYNPATTERNSETTYPE;
BEGIN
LSAUXDOM_VP120VPS:=
[SYNASIFSENT,
SYNCLOSEDADJPPROP,
SYNCLOSEDGERUND,
SYNCLOSEDINFSENT,
SYNCLOSEDNPPROP,
SYNCLOSEDTOSENT,
SYNCLOSEDVERBPPROP,
SYNDIRCLOSEDPREPPPROP,
SYNDIROPENPREPPPROP,
SYNEMPTY,
SYNFORTOSENT,
SYNFRONTSOPROSENT,
SYNITTHATSENT,
SYNLOCCLOSEDPREPPPROP,
SYNLOCOPENPREPPPROP,
SYNMEASUREPHRASE,
SYNNOTPROSENT,
SYNNP,
SYNOPENADJPPROP,
SYNOPENGERUND,
SYNOPENINFSENT,
SYNOPENNPPROP,
SYNOPENTOSENT,
SYNOPENVERBPPROP,
SYNOTHERCLOSEDPREPPPROP,
SYNOTHEROPENPREPPPROP,
SYNPREPCLOSEDADJPPROP,
SYNPREPCLOSEDGERUND,
SYNPREPCLOSEDNPPROP,
SYNPREPCLOSEDTOSENT,
SYNPREPEMPTY,
SYNPREPMEASUREPHRASE,
SYNPREPNP,
SYNPREPOPENGERUND,
SYNPREPOPENNPPROP,
SYNPREPOTHERCLOSEDPREPPPROP,
SYNPREPOPENTOSENT,
SYNPREPQSENT,
SYNPREPTHATSENT,
SYNPROSENT,
SYNQSENT,
SYNSOPROSENT,
SYNTHATSENT,
SYNTONP,
VPID1,
VPID21,
VPID4,
VPID6,
VPID5,
VPID88,
VPID165,
VPID142,
VPID84,
VPID99,
VPID129,
VPID156,
VPID161,
VPID177,
VPID76,
VPID79,
VPID168,
VPID50,
VPID81,
VPID114,
VPID159,
VPID26,
VPID139,
VPID140,
VPID150,
VPID10,
VPID47,
VPID46,
VPID54,
VPID154,
VPID109,
VPID176,
VPID85,
VPID135,
VPID141,
VPID138,
VPID136,
VPID32,
VPID134,
VPID157,
VPID146,
VPID51,
VPID170,
VPID175,
VPID21,
VPID151,
VPID69,
VPID40,
VPID102,
VPID63,
VPID65,
VPID66,
VPID71,
VPID67,
VPID124,
VPID106,
VPID103,
VPID153,
VPID68,
VPID27,
VPID78,
VPID112,
VPID83,
VPID33,
VPID64,
VPID42,
VPID62,
VPID100,
VPID172,
VPID1,
VPID58,
VPID14,
VPID28,
VPID55,
VPID149,
VPID166,
VPID13,
VPID36,
VPID152,
VPID38,
VPID43,
VPID123,
VPID5,
VPID53,
VPID75,
VPID111,
VPID120,
VPID130,
VPID77,
VPID11,
VPID164,
VPID160,
VPID137,
VPID155,
VPID143,
VPID34,
VPID18,
VPID163,
VPID162,
VPID59,
VPID98,
VPID73,
VPID72,
VPID37,
VPID82,
VPID167,
VPID7,
VPID30,
VPID49,
VPID41,
VPID60,
VPID40,
VPID70,
VPID145,
VPID128]
END;
 FUNCTION LSAUXDOM_VP012VPS:LSDOMAINT_SYNPATTERNSETTYPE;
BEGIN
LSAUXDOM_VP012VPS:=
[SYNCLOSEDADJPPROP_EMPTY,
SYNCLOSEDADJPPROP_PREPNP,
SYNCLOSEDNPPROP_EMPTY,
SYNCLOSEDNPPROP_PREPNP,
SYNDONP_DIROPENPREPPPROP,
SYNDONP_EMPTY,
SYNDONP_LOCOPENPREPPPROP,
SYNDONP_OPENADJPPROP,
SYNDONP_OPENGERUND,
SYNDONP_OPENNPPROP,
SYNDONP_OPENTOSENT,
SYNDONP_OPENINFSENT,
SYNDONP_OTHEROPENPREPPPROP,
SYNDONP_PREPNP,
SYNDONP_PREPOPENADJPPROP,
SYNDONP_PREPOPENGERUND,
SYNDONP_PREPOPENNPPROP,
SYNDONP_PREPOTHEROPENPREPPPROP,
SYNDONP_PREPQSENT,
SYNDONP_PROSENT,
SYNDONP_QSENT,
SYNDONP_THATSENT,
SYNEMPTY_DONP,
SYNEMPTY_CLOSEDTOSENT,
SYNEMPTY_MEASUREPHRASE,
SYNEMPTY_OPENGERUND,
SYNEMPTY_OPENTOSENT,
SYNEMPTY_PREPOPENGERUND,
SYNEMPTY_PROSENT,
SYNEMPTY_PREPNP,
SYNEMPTY_PREP2NP,
SYNEMPTY_QSENT,
SYNEMPTY_THATSENT,
SYNIONP_DONP,
SYNIONP_EMPTY,
SYNIONP_MEASUREPHRASE,
SYNIONP_OPENINFSENT,
SYNIONP_OPENTOSENT,
SYNIONP_PREPCLOSEDADJPPROP,
SYNIONP_PREPNP,
SYNIONP_PREPOPENGERUND,
SYNIONP_PROSENT,
SYNIONP_QSENT,
SYNIONP_SOPROSENT,
SYNIONP_THATSENT,
SYNOPENGERUND_PREPNP,
SYNOTHERCLOSEDPREPPPROP_EMPTY,
SYNOTHERCLOSEDPREPPPROP_PREPNP,
SYNPREPNP_CLOSEDTOSENT,
SYNPREPNP_EMPTY,
SYNPREPNP_ITOPENTOSENT,
SYNPREPNP_OPENTOSENT,
SYNPREPNP_PREPNP,
SYNPREPNP_PREPOPENGERUND,
SYNPREPNP_QSENT,
SYNPREPNP_THATSENT,
SYNSOPROSENT_EMPTY,
SYNSOPROSENT_PREPNP,
SYNTHATSENT_EMPTY,
SYNTHATSENT_LOCOPENPREPPPROP,
VPID2,
VPID11,
VPID3,
VPID8,
VPID57,
VPID87,
VPID108,
VPID127,
VPID148,
VPID144,
VPID74,
VPID118,
VPID132,
VPID133,
VPID158,
VPID173,
VPID23,
VPID52,
VPID35,
VPID122,
VPID22,
VPID61,
VPID110,
VPID147,
VPID86,
VPID20,
VPID121,
VPID17,
VPID101,
VPID104,
VPID19,
VPID174,
VPID29,
VPID12,
VPID125,
VPID9,
VPID105,
VPID131,
VPID15,
VPID80,
VPID90,
VPID92,
VPID96,
VPID91,
VPID115,
VPID94,
VPID93,
VPID95,
VPID97,
VPID16,
VPID39,
VPID31,
VPID116,
VPID117,
VPID119,
VPID48,
VPID169,
VPID89,
VPID25,
VPID45,
VPID24,
VPID128,
VPID56,
VPID44,
VPID56]
END;
 FUNCTION LSAUXDOM_VP123VPS:LSDOMAINT_SYNPATTERNSETTYPE;
BEGIN
LSAUXDOM_VP123VPS:=
[SYNCLOSEDADJPPROP_EMPTY,
SYNCLOSEDADJPPROP_PREPNP,
SYNCLOSEDNPPROP_EMPTY,
SYNCLOSEDNPPROP_PREPNP,
SYNDONP_DIROPENPREPPPROP,
SYNDONP_EMPTY,
SYNDONP_LOCOPENPREPPPROP,
SYNDONP_OPENADJPPROP,
SYNDONP_OPENGERUND,
SYNDONP_OPENNPPROP,
SYNDONP_OPENTOSENT,
SYNDONP_OPENINFSENT,
SYNDONP_OTHEROPENPREPPPROP,
SYNDONP_PREPNP,
SYNDONP_PREPOPENADJPPROP,
SYNDONP_PREPOPENGERUND,
SYNDONP_PREPOPENNPPROP,
SYNDONP_PREPOTHEROPENPREPPPROP,
SYNDONP_PREPQSENT,
SYNDONP_PROSENT,
SYNDONP_QSENT,
SYNDONP_THATSENT,
SYNEMPTY_DONP,
SYNEMPTY_CLOSEDTOSENT,
SYNEMPTY_MEASUREPHRASE,
SYNEMPTY_OPENGERUND,
SYNEMPTY_OPENTOSENT,
SYNEMPTY_PREPOPENGERUND,
SYNEMPTY_PROSENT,
SYNEMPTY_PREPNP,
SYNEMPTY_PREP2NP,
SYNEMPTY_QSENT,
SYNEMPTY_THATSENT,
SYNIOEMPTY_DONP,
SYNIOEMPTY_THATSENT,
SYNIOEMPTY_QSENT,
SYNIONP_DONP,
SYNIONP_EMPTY,
SYNIONP_MEASUREPHRASE,
SYNIONP_OPENINFSENT,
SYNIONP_OPENNPPROP,
SYNIONP_OPENTOSENT,
SYNIONP_PREPCLOSEDADJPPROP,
SYNIONP_PREPNP,
SYNIONP_PREPOPENGERUND,
SYNIONP_PROSENT,
SYNIONP_QSENT,
SYNIONP_SOPROSENT,
SYNIONP_THATSENT,
SYNOPENGERUND_PREPNP,
SYNOTHERCLOSEDPREPPPROP_EMPTY,
SYNOTHERCLOSEDPREPPPROP_PREPNP,
SYNPREPNP_CLOSEDTOSENT,
SYNPREPNP_EMPTY,
SYNPREPNP_ITOPENTOSENT,
SYNPREPNP_OPENTOSENT,
SYNPREPNP_PREPNP,
SYNPREPNP_PREPOPENGERUND,
SYNPREPNP_QSENT,
SYNPREPNP_THATSENT,
SYNSOPROSENT_EMPTY,
SYNSOPROSENT_PREPNP,
SYNTHATSENT_EMPTY,
SYNTHATSENT_LOCOPENPREPPPROP,
SYNTONP_DONP,
SYNTONP_THATSENT,
SYNTONP_QSENT,
VPID2,
VPID11,
VPID3,
VPID8,
VPID57,
VPID87,
VPID108,
VPID127,
VPID148,
VPID144,
VPID74,
VPID118,
VPID132,
VPID133,
VPID158,
VPID173,
VPID23,
VPID52,
VPID35,
VPID122,
VPID22,
VPID61,
VPID110,
VPID147,
VPID86,
VPID20,
VPID121,
VPID17,
VPID101,
VPID104,
VPID19,
VPID174,
VPID29,
VPID12,
VPID125,
VPID9,
VPID105,
VPID131,
VPID15,
VPID80,
VPID90,
VPID92,
VPID96,
VPID91,
VPID115,
VPID94,
VPID93,
VPID95,
VPID97,
VPID16,
VPID39,
VPID31,
VPID116,
VPID117,
VPID119,
VPID48,
VPID169,
VPID89,
VPID25,
VPID45,
VPID24,
VPID128,
VPID56,
VPID44,
VPID56]
END;
 FUNCTION LSAUXDOM_XPPROPCATSET:SETOFSYNTCAT;
BEGIN
LSAUXDOM_XPPROPCATSET:=
[OPENADJPPROP,
CLOSEDADJPPROP,
OPENNPPROP,
CLOSEDNPPROP,
OPENPREPPPROP,
CLOSEDPREPPPROP,
OPENADVPPROP,
CLOSEDADVPPROP,
OPENVERBPPROP,
CLOSEDVERBPPROP]
END;


