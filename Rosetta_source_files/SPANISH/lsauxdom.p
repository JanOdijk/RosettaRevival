
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

 FUNCTION LSAUXDOM_CpNPONREDELLOBPRSPR
                         (rec:LSDOMAINT_NPRECORD):BOOLEAN;
VAR Bool : BOOLEAN;
BEGIN 
  Bool := FALSE;
  WITH rec DO
  BEGIN
    IF (REQ = [POSPOL,NEGPOL,OMEGAPOL] ) THEN
IF (ENV = [POSPOL,NEGPOL,OMEGAPOL] ) THEN
IF (SUPERTIEMPO = OMEGATIEMPO ) THEN
IF (CLASS = OMEGATIMEADVCLASS ) THEN
IF (TIEMPO = OMEGATIEMPO ) THEN
IF (ASPECTO = OMEGAASPECTO ) THEN
IF (RETRO = FALSE ) THEN
IF (PERSONA = 3 ) THEN
IF (GENERO = OMEGAGENERO ) THEN
IF (ACTSUBCS = [OTHERNOUN] ) THEN
IF (TEMPORAL = FALSE ) THEN
IF (ANIMATE = OMEGAANIMATE ) THEN
IF (HUMAN = OMEGAHUMAN ) THEN
IF (ACTCOMAS = [COUNT] ) THEN
IF (MOOD = DECLXPMOOD ) THEN
IF (NUMERO = SINGULAR ) THEN
IF (DEFINITE = DEF ) THEN
IF (GENERIC = NOGENERIC ) THEN
IF (THETANP = OMEGATHETANP ) THEN
IF (NOUNPATTERNEFS = [] ) THEN
IF (POSSPRED = FALSE ) THEN
IF (POSSNIETNP = FALSE ) THEN
IF (SYNTQUANT = OMEGAQUANT ) THEN
IF (NPHEAD = REDELLONP ) THEN
IF (SPECQ = OMEGASPEC ) THEN
IF (DEFSPEC = FALSE ) THEN
IF (CASES = [] ) THEN
IF (COORD = NOCOORD ) THEN
      Bool:=TRUE;
  END;{with}
  LSAUXDOM_CpNPONREDELLOBPRSPR:=Bool;
END;{function}
 PROCEDURE LSAUXDOM_AsNPONREDELLOBPRSPR(VAR rec:LSDOMAINT_NPRECORD);
BEGIN
WITH rec DO
BEGIN
REQ := [POSPOL,NEGPOL,OMEGAPOL];
                                                      ENV := [POSPOL,NEGPOL,OMEGAPOL];
                                                      SUPERTIEMPO := OMEGATIEMPO;
                                                      CLASS := OMEGATIMEADVCLASS;
                                                      TIEMPO := OMEGATIEMPO;
                                                      ASPECTO := OMEGAASPECTO;
                                                      RETRO := FALSE;
                                                      PERSONA := 3;
                                                      GENERO := OMEGAGENERO;
                                                      ACTSUBCS := [OTHERNOUN];
                                                      TEMPORAL := FALSE;
                                                      ANIMATE := OMEGAANIMATE;
                                                      HUMAN := OMEGAHUMAN;
                                                      ACTCOMAS := [COUNT];
                                                      MOOD := DECLXPMOOD;
                                                      NUMERO := SINGULAR;
                                                      DEFINITE := DEF;
                                                      GENERIC := NOGENERIC;
                                                      THETANP := OMEGATHETANP;
                                                      NOUNPATTERNEFS := [];
                                                      POSSPRED := FALSE;
                                                      POSSNIETNP := FALSE;
                                                      SYNTQUANT := OMEGAQUANT;
                                                      NPHEAD := REDELLONP;
                                                      SPECQ := OMEGASPEC;
                                                      DEFSPEC := FALSE;
                                                      CASES := [];
                                                      COORD := NOCOORD;
                                                      END
END;

 FUNCTION LSAUXDOM_CpNPONMASCRECIPRO
                         (rec:LSDOMAINT_NPRECORD):BOOLEAN;
VAR Bool : BOOLEAN;
BEGIN 
  Bool := FALSE;
  WITH rec DO
  BEGIN
    IF (REQ = [POSPOL,NEGPOL,OMEGAPOL] ) THEN
IF (ENV = [POSPOL,NEGPOL,OMEGAPOL] ) THEN
IF (SUPERTIEMPO = OMEGATIEMPO ) THEN
IF (CLASS = OMEGATIMEADVCLASS ) THEN
IF (TIEMPO = OMEGATIEMPO ) THEN
IF (ASPECTO = OMEGAASPECTO ) THEN
IF (RETRO = FALSE ) THEN
IF (PERSONA = 3 ) THEN
IF (GENERO = MASC ) THEN
IF (ACTSUBCS = [OTHERNOUN] ) THEN
IF (TEMPORAL = FALSE ) THEN
IF (ANIMATE = OMEGAANIMATE ) THEN
IF (HUMAN = OMEGAHUMAN ) THEN
IF (ACTCOMAS = [COUNT] ) THEN
IF (MOOD = DECLXPMOOD ) THEN
IF (NUMERO = SINGULAR ) THEN
IF (DEFINITE = DEF ) THEN
IF (GENERIC = NOGENERIC ) THEN
IF (THETANP = OMEGATHETANP ) THEN
IF (NOUNPATTERNEFS = [] ) THEN
IF (POSSPRED = FALSE ) THEN
IF (POSSNIETNP = FALSE ) THEN
IF (SYNTQUANT = OMEGAQUANT ) THEN
IF (NPHEAD = OTHERNP ) THEN
IF (SPECQ = YESSPEC ) THEN
IF (DEFSPEC = TRUE ) THEN
IF (CASES = [] ) THEN
IF (COORD = NOCOORD ) THEN
      Bool:=TRUE;
  END;{with}
  LSAUXDOM_CpNPONMASCRECIPRO:=Bool;
END;{function}
 PROCEDURE LSAUXDOM_AsNPONMASCRECIPRO(VAR rec:LSDOMAINT_NPRECORD);
BEGIN
WITH rec DO
BEGIN
REQ := [POSPOL,NEGPOL,OMEGAPOL];
                                                      ENV := [POSPOL,NEGPOL,OMEGAPOL];
                                                      SUPERTIEMPO := OMEGATIEMPO;
                                                      CLASS := OMEGATIMEADVCLASS;
                                                      TIEMPO := OMEGATIEMPO;
                                                      ASPECTO := OMEGAASPECTO;
                                                      RETRO := FALSE;
                                                      PERSONA := 3;
                                                      GENERO := MASC;
                                                      ACTSUBCS := [OTHERNOUN];
                                                      TEMPORAL := FALSE;
                                                      ANIMATE := OMEGAANIMATE;
                                                      HUMAN := OMEGAHUMAN;
                                                      ACTCOMAS := [COUNT];
                                                      MOOD := DECLXPMOOD;
                                                      NUMERO := SINGULAR;
                                                      DEFINITE := DEF;
                                                      GENERIC := NOGENERIC;
                                                      THETANP := OMEGATHETANP;
                                                      NOUNPATTERNEFS := [];
                                                      POSSPRED := FALSE;
                                                      POSSNIETNP := FALSE;
                                                      SYNTQUANT := OMEGAQUANT;
                                                      NPHEAD := OTHERNP;
                                                      SPECQ := YESSPEC;
                                                      DEFSPEC := TRUE;
                                                      CASES := [];
                                                      COORD := NOCOORD;
                                                      END
END;

 FUNCTION LSAUXDOM_CpNPONFEMRECIPRO
                         (rec:LSDOMAINT_NPRECORD):BOOLEAN;
VAR Bool : BOOLEAN;
BEGIN 
  Bool := FALSE;
  WITH rec DO
  BEGIN
    IF (REQ = [POSPOL,NEGPOL,OMEGAPOL] ) THEN
IF (ENV = [POSPOL,NEGPOL,OMEGAPOL] ) THEN
IF (SUPERTIEMPO = OMEGATIEMPO ) THEN
IF (CLASS = OMEGATIMEADVCLASS ) THEN
IF (TIEMPO = OMEGATIEMPO ) THEN
IF (ASPECTO = OMEGAASPECTO ) THEN
IF (RETRO = FALSE ) THEN
IF (PERSONA = 3 ) THEN
IF (GENERO = FEM ) THEN
IF (ACTSUBCS = [OTHERNOUN] ) THEN
IF (TEMPORAL = FALSE ) THEN
IF (ANIMATE = OMEGAANIMATE ) THEN
IF (HUMAN = OMEGAHUMAN ) THEN
IF (ACTCOMAS = [COUNT] ) THEN
IF (MOOD = DECLXPMOOD ) THEN
IF (NUMERO = SINGULAR ) THEN
IF (DEFINITE = DEF ) THEN
IF (GENERIC = NOGENERIC ) THEN
IF (THETANP = OMEGATHETANP ) THEN
IF (NOUNPATTERNEFS = [] ) THEN
IF (POSSPRED = FALSE ) THEN
IF (POSSNIETNP = FALSE ) THEN
IF (SYNTQUANT = OMEGAQUANT ) THEN
IF (NPHEAD = OTHERNP ) THEN
IF (SPECQ = YESSPEC ) THEN
IF (DEFSPEC = TRUE ) THEN
IF (CASES = [] ) THEN
IF (COORD = NOCOORD ) THEN
      Bool:=TRUE;
  END;{with}
  LSAUXDOM_CpNPONFEMRECIPRO:=Bool;
END;{function}
 PROCEDURE LSAUXDOM_AsNPONFEMRECIPRO(VAR rec:LSDOMAINT_NPRECORD);
BEGIN
WITH rec DO
BEGIN
REQ := [POSPOL,NEGPOL,OMEGAPOL];
                                                      ENV := [POSPOL,NEGPOL,OMEGAPOL];
                                                      SUPERTIEMPO := OMEGATIEMPO;
                                                      CLASS := OMEGATIMEADVCLASS;
                                                      TIEMPO := OMEGATIEMPO;
                                                      ASPECTO := OMEGAASPECTO;
                                                      RETRO := FALSE;
                                                      PERSONA := 3;
                                                      GENERO := FEM;
                                                      ACTSUBCS := [OTHERNOUN];
                                                      TEMPORAL := FALSE;
                                                      ANIMATE := OMEGAANIMATE;
                                                      HUMAN := OMEGAHUMAN;
                                                      ACTCOMAS := [COUNT];
                                                      MOOD := DECLXPMOOD;
                                                      NUMERO := SINGULAR;
                                                      DEFINITE := DEF;
                                                      GENERIC := NOGENERIC;
                                                      THETANP := OMEGATHETANP;
                                                      NOUNPATTERNEFS := [];
                                                      POSSPRED := FALSE;
                                                      POSSNIETNP := FALSE;
                                                      SYNTQUANT := OMEGAQUANT;
                                                      NPHEAD := OTHERNP;
                                                      SPECQ := YESSPEC;
                                                      DEFSPEC := TRUE;
                                                      CASES := [];
                                                      COORD := NOCOORD;
                                                      END
END;

 FUNCTION LSAUXDOM_CpNPONELUNO
                         (rec:LSDOMAINT_NPRECORD):BOOLEAN;
VAR Bool : BOOLEAN;
BEGIN 
  Bool := FALSE;
  WITH rec DO
  BEGIN
    IF (REQ = [POSPOL,NEGPOL,OMEGAPOL] ) THEN
IF (ENV = [POSPOL,NEGPOL,OMEGAPOL] ) THEN
IF (SUPERTIEMPO = OMEGATIEMPO ) THEN
IF (CLASS = OMEGATIMEADVCLASS ) THEN
IF (TIEMPO = OMEGATIEMPO ) THEN
IF (ASPECTO = OMEGAASPECTO ) THEN
IF (RETRO = FALSE ) THEN
IF (PERSONA = 3 ) THEN
IF (GENERO = OMEGAGENERO ) THEN
IF (ACTSUBCS = [OTHERNOUN] ) THEN
IF (TEMPORAL = FALSE ) THEN
IF (ANIMATE = OMEGAANIMATE ) THEN
IF (HUMAN = OMEGAHUMAN ) THEN
IF (ACTCOMAS = [COUNT] ) THEN
IF (MOOD = DECLXPMOOD ) THEN
IF (NUMERO = SINGULAR ) THEN
IF (DEFINITE = DEF ) THEN
IF (GENERIC = OMEGAGENERIC ) THEN
IF (THETANP = OMEGATHETANP ) THEN
IF (NOUNPATTERNEFS = [] ) THEN
IF (POSSPRED = FALSE ) THEN
IF (POSSNIETNP = FALSE ) THEN
IF (SYNTQUANT = OMEGAQUANT ) THEN
IF (NPHEAD = OTHERNP ) THEN
IF (SPECQ = YESSPEC ) THEN
IF (DEFSPEC = FALSE ) THEN
IF (CASES = [] ) THEN
IF (COORD = NOCOORD ) THEN
      Bool:=TRUE;
  END;{with}
  LSAUXDOM_CpNPONELUNO:=Bool;
END;{function}
 PROCEDURE LSAUXDOM_AsNPONELUNO(VAR rec:LSDOMAINT_NPRECORD);
BEGIN
WITH rec DO
BEGIN
REQ := [POSPOL,NEGPOL,OMEGAPOL];
                                                      ENV := [POSPOL,NEGPOL,OMEGAPOL];
                                                      SUPERTIEMPO := OMEGATIEMPO;
                                                      CLASS := OMEGATIMEADVCLASS;
                                                      TIEMPO := OMEGATIEMPO;
                                                      ASPECTO := OMEGAASPECTO;
                                                      RETRO := FALSE;
                                                      PERSONA := 3;
                                                      GENERO := OMEGAGENERO;
                                                      ACTSUBCS := [OTHERNOUN];
                                                      TEMPORAL := FALSE;
                                                      ANIMATE := OMEGAANIMATE;
                                                      HUMAN := OMEGAHUMAN;
                                                      ACTCOMAS := [COUNT];
                                                      MOOD := DECLXPMOOD;
                                                      NUMERO := SINGULAR;
                                                      DEFINITE := DEF;
                                                      GENERIC := OMEGAGENERIC;
                                                      THETANP := OMEGATHETANP;
                                                      NOUNPATTERNEFS := [];
                                                      POSSPRED := FALSE;
                                                      POSSNIETNP := FALSE;
                                                      SYNTQUANT := OMEGAQUANT;
                                                      NPHEAD := OTHERNP;
                                                      SPECQ := YESSPEC;
                                                      DEFSPEC := FALSE;
                                                      CASES := [];
                                                      COORD := NOCOORD;
                                                      END
END;

 FUNCTION LSAUXDOM_CpNPONELOTRO
                         (rec:LSDOMAINT_NPRECORD):BOOLEAN;
VAR Bool : BOOLEAN;
BEGIN 
  Bool := FALSE;
  WITH rec DO
  BEGIN
    IF (REQ = [POSPOL,NEGPOL,OMEGAPOL] ) THEN
IF (ENV = [POSPOL,NEGPOL,OMEGAPOL] ) THEN
IF (SUPERTIEMPO = OMEGATIEMPO ) THEN
IF (CLASS = OMEGATIMEADVCLASS ) THEN
IF (TIEMPO = OMEGATIEMPO ) THEN
IF (ASPECTO = OMEGAASPECTO ) THEN
IF (RETRO = FALSE ) THEN
IF (PERSONA = 3 ) THEN
IF (GENERO = OMEGAGENERO ) THEN
IF (ACTSUBCS = [OTHERNOUN] ) THEN
IF (TEMPORAL = FALSE ) THEN
IF (ANIMATE = OMEGAANIMATE ) THEN
IF (HUMAN = OMEGAHUMAN ) THEN
IF (ACTCOMAS = [COUNT] ) THEN
IF (MOOD = DECLXPMOOD ) THEN
IF (NUMERO = SINGULAR ) THEN
IF (DEFINITE = DEF ) THEN
IF (GENERIC = OMEGAGENERIC ) THEN
IF (THETANP = OMEGATHETANP ) THEN
IF (NOUNPATTERNEFS = [] ) THEN
IF (POSSPRED = FALSE ) THEN
IF (POSSNIETNP = FALSE ) THEN
IF (SYNTQUANT = OMEGAQUANT ) THEN
IF (NPHEAD = OTHERNP ) THEN
IF (SPECQ = YESSPEC ) THEN
IF (DEFSPEC = FALSE ) THEN
IF (CASES = [] ) THEN
IF (COORD = NOCOORD ) THEN
      Bool:=TRUE;
  END;{with}
  LSAUXDOM_CpNPONELOTRO:=Bool;
END;{function}
 PROCEDURE LSAUXDOM_AsNPONELOTRO(VAR rec:LSDOMAINT_NPRECORD);
BEGIN
WITH rec DO
BEGIN
REQ := [POSPOL,NEGPOL,OMEGAPOL];
                                                      ENV := [POSPOL,NEGPOL,OMEGAPOL];
                                                      SUPERTIEMPO := OMEGATIEMPO;
                                                      CLASS := OMEGATIMEADVCLASS;
                                                      TIEMPO := OMEGATIEMPO;
                                                      ASPECTO := OMEGAASPECTO;
                                                      RETRO := FALSE;
                                                      PERSONA := 3;
                                                      GENERO := OMEGAGENERO;
                                                      ACTSUBCS := [OTHERNOUN];
                                                      TEMPORAL := FALSE;
                                                      ANIMATE := OMEGAANIMATE;
                                                      HUMAN := OMEGAHUMAN;
                                                      ACTCOMAS := [COUNT];
                                                      MOOD := DECLXPMOOD;
                                                      NUMERO := SINGULAR;
                                                      DEFINITE := DEF;
                                                      GENERIC := OMEGAGENERIC;
                                                      THETANP := OMEGATHETANP;
                                                      NOUNPATTERNEFS := [];
                                                      POSSPRED := FALSE;
                                                      POSSNIETNP := FALSE;
                                                      SYNTQUANT := OMEGAQUANT;
                                                      NPHEAD := OTHERNP;
                                                      SPECQ := YESSPEC;
                                                      DEFSPEC := FALSE;
                                                      CASES := [];
                                                      COORD := NOCOORD;
                                                      END
END;

 FUNCTION LSAUXDOM_CpNPONMISMO
                         (rec:LSDOMAINT_NPRECORD):BOOLEAN;
VAR Bool : BOOLEAN;
BEGIN 
  Bool := FALSE;
  WITH rec DO
  BEGIN
    IF (REQ = [POSPOL,NEGPOL,OMEGAPOL] ) THEN
IF (ENV = [POSPOL,NEGPOL,OMEGAPOL] ) THEN
IF (SUPERTIEMPO = OMEGATIEMPO ) THEN
IF (CLASS = OMEGATIMEADVCLASS ) THEN
IF (TIEMPO = OMEGATIEMPO ) THEN
IF (ASPECTO = OMEGAASPECTO ) THEN
IF (RETRO = FALSE ) THEN
IF (PERSONA = 3 ) THEN
IF (GENERO = OMEGAGENERO ) THEN
IF (ACTSUBCS = [OTHERNOUN] ) THEN
IF (TEMPORAL = FALSE ) THEN
IF (ANIMATE = OMEGAANIMATE ) THEN
IF (HUMAN = OMEGAHUMAN ) THEN
IF (ACTCOMAS = [COUNT] ) THEN
IF (MOOD = DECLXPMOOD ) THEN
IF (NUMERO = SINGULAR ) THEN
IF (DEFINITE = DEF ) THEN
IF (GENERIC = OMEGAGENERIC ) THEN
IF (THETANP = OMEGATHETANP ) THEN
IF (NOUNPATTERNEFS = [] ) THEN
IF (POSSPRED = TRUE ) THEN
IF (POSSNIETNP = FALSE ) THEN
IF (SYNTQUANT = OMEGAQUANT ) THEN
IF (NPHEAD = OTHERNP ) THEN
IF (SPECQ = YESSPEC ) THEN
IF (DEFSPEC = FALSE ) THEN
IF (CASES = [PREPOSITIVE] ) THEN
IF (COORD = NOCOORD ) THEN
      Bool:=TRUE;
  END;{with}
  LSAUXDOM_CpNPONMISMO:=Bool;
END;{function}
 PROCEDURE LSAUXDOM_AsNPONMISMO(VAR rec:LSDOMAINT_NPRECORD);
BEGIN
WITH rec DO
BEGIN
REQ := [POSPOL,NEGPOL,OMEGAPOL];
                                                      ENV := [POSPOL,NEGPOL,OMEGAPOL];
                                                      SUPERTIEMPO := OMEGATIEMPO;
                                                      CLASS := OMEGATIMEADVCLASS;
                                                      TIEMPO := OMEGATIEMPO;
                                                      ASPECTO := OMEGAASPECTO;
                                                      RETRO := FALSE;
                                                      PERSONA := 3;
                                                      GENERO := OMEGAGENERO;
                                                      ACTSUBCS := [OTHERNOUN];
                                                      TEMPORAL := FALSE;
                                                      ANIMATE := OMEGAANIMATE;
                                                      HUMAN := OMEGAHUMAN;
                                                      ACTCOMAS := [COUNT];
                                                      MOOD := DECLXPMOOD;
                                                      NUMERO := SINGULAR;
                                                      DEFINITE := DEF;
                                                      GENERIC := OMEGAGENERIC;
                                                      THETANP := OMEGATHETANP;
                                                      NOUNPATTERNEFS := [];
                                                      POSSPRED := TRUE;
                                                      POSSNIETNP := FALSE;
                                                      SYNTQUANT := OMEGAQUANT;
                                                      NPHEAD := OTHERNP;
                                                      SPECQ := YESSPEC;
                                                      DEFSPEC := FALSE;
                                                      CASES := [PREPOSITIVE];
                                                      COORD := NOCOORD;
                                                      END
END;

 FUNCTION LSAUXDOM_CpNPONNOMBPRSPR
                         (rec:LSDOMAINT_NPRECORD):BOOLEAN;
VAR Bool : BOOLEAN;
BEGIN 
  Bool := FALSE;
  WITH rec DO
  BEGIN
    IF (REQ = [POSPOL,NEGPOL,OMEGAPOL] ) THEN
IF (ENV = [POSPOL,NEGPOL,OMEGAPOL] ) THEN
IF (SUPERTIEMPO = OMEGATIEMPO ) THEN
IF (CLASS = OMEGATIMEADVCLASS ) THEN
IF (TIEMPO = OMEGATIEMPO ) THEN
IF (ASPECTO = OMEGAASPECTO ) THEN
IF (RETRO = FALSE ) THEN
IF (PERSONA = 3 ) THEN
IF (GENERO = OMEGAGENERO ) THEN
IF (ACTSUBCS = [OTHERNOUN] ) THEN
IF (TEMPORAL = FALSE ) THEN
IF (ANIMATE = YESANIMATE ) THEN
IF (HUMAN = OMEGAHUMAN ) THEN
IF (ACTCOMAS = [COUNT] ) THEN
IF (MOOD = DECLXPMOOD ) THEN
IF (NUMERO = OMEGANUMERO ) THEN
IF (DEFINITE = DEF ) THEN
IF (GENERIC = OMEGAGENERIC ) THEN
IF (THETANP = OMEGATHETANP ) THEN
IF (NOUNPATTERNEFS = [] ) THEN
IF (POSSPRED = TRUE ) THEN
IF (POSSNIETNP = FALSE ) THEN
IF (SYNTQUANT = OMEGAQUANT ) THEN
IF (NPHEAD = PERSPRONP ) THEN
IF (SPECQ = YESSPEC ) THEN
IF (DEFSPEC = FALSE ) THEN
IF (CASES = [NOMINATIVE] ) THEN
IF (COORD = NOCOORD ) THEN
      Bool:=TRUE;
  END;{with}
  LSAUXDOM_CpNPONNOMBPRSPR:=Bool;
END;{function}
 PROCEDURE LSAUXDOM_AsNPONNOMBPRSPR(VAR rec:LSDOMAINT_NPRECORD);
BEGIN
WITH rec DO
BEGIN
REQ := [POSPOL,NEGPOL,OMEGAPOL];
                                                      ENV := [POSPOL,NEGPOL,OMEGAPOL];
                                                      SUPERTIEMPO := OMEGATIEMPO;
                                                      CLASS := OMEGATIMEADVCLASS;
                                                      TIEMPO := OMEGATIEMPO;
                                                      ASPECTO := OMEGAASPECTO;
                                                      RETRO := FALSE;
                                                      PERSONA := 3;
                                                      GENERO := OMEGAGENERO;
                                                      ACTSUBCS := [OTHERNOUN];
                                                      TEMPORAL := FALSE;
                                                      ANIMATE := YESANIMATE;
                                                      HUMAN := OMEGAHUMAN;
                                                      ACTCOMAS := [COUNT];
                                                      MOOD := DECLXPMOOD;
                                                      NUMERO := OMEGANUMERO;
                                                      DEFINITE := DEF;
                                                      GENERIC := OMEGAGENERIC;
                                                      THETANP := OMEGATHETANP;
                                                      NOUNPATTERNEFS := [];
                                                      POSSPRED := TRUE;
                                                      POSSNIETNP := FALSE;
                                                      SYNTQUANT := OMEGAQUANT;
                                                      NPHEAD := PERSPRONP;
                                                      SPECQ := YESSPEC;
                                                      DEFSPEC := FALSE;
                                                      CASES := [NOMINATIVE];
                                                      COORD := NOCOORD;
                                                      END
END;

 FUNCTION LSAUXDOM_CpNPONECBPRSPR
                         (rec:LSDOMAINT_NPRECORD):BOOLEAN;
VAR Bool : BOOLEAN;
BEGIN 
  Bool := FALSE;
  WITH rec DO
  BEGIN
    IF (REQ = [POSPOL,NEGPOL,OMEGAPOL] ) THEN
IF (ENV = [POSPOL,NEGPOL,OMEGAPOL] ) THEN
IF (SUPERTIEMPO = OMEGATIEMPO ) THEN
IF (CLASS = OMEGATIMEADVCLASS ) THEN
IF (TIEMPO = OMEGATIEMPO ) THEN
IF (ASPECTO = OMEGAASPECTO ) THEN
IF (RETRO = FALSE ) THEN
IF (PERSONA = 3 ) THEN
IF (GENERO = OMEGAGENERO ) THEN
IF (ACTSUBCS = [OTHERNOUN] ) THEN
IF (TEMPORAL = FALSE ) THEN
IF (ANIMATE = OMEGAANIMATE ) THEN
IF (HUMAN = OMEGAHUMAN ) THEN
IF (ACTCOMAS = [COUNT] ) THEN
IF (MOOD = DECLXPMOOD ) THEN
IF (NUMERO = OMEGANUMERO ) THEN
IF (DEFINITE = DEF ) THEN
IF (GENERIC = NOGENERIC ) THEN
IF (THETANP = OMEGATHETANP ) THEN
IF (NOUNPATTERNEFS = [] ) THEN
IF (POSSPRED = FALSE ) THEN
IF (POSSNIETNP = FALSE ) THEN
IF (SYNTQUANT = OMEGAQUANT ) THEN
IF (NPHEAD = OTHERNP ) THEN
IF (SPECQ = OMEGASPEC ) THEN
IF (DEFSPEC = FALSE ) THEN
IF (CASES = [] ) THEN
IF (COORD = NOCOORD ) THEN
      Bool:=TRUE;
  END;{with}
  LSAUXDOM_CpNPONECBPRSPR:=Bool;
END;{function}
 PROCEDURE LSAUXDOM_AsNPONECBPRSPR(VAR rec:LSDOMAINT_NPRECORD);
BEGIN
WITH rec DO
BEGIN
REQ := [POSPOL,NEGPOL,OMEGAPOL];
                                                      ENV := [POSPOL,NEGPOL,OMEGAPOL];
                                                      SUPERTIEMPO := OMEGATIEMPO;
                                                      CLASS := OMEGATIMEADVCLASS;
                                                      TIEMPO := OMEGATIEMPO;
                                                      ASPECTO := OMEGAASPECTO;
                                                      RETRO := FALSE;
                                                      PERSONA := 3;
                                                      GENERO := OMEGAGENERO;
                                                      ACTSUBCS := [OTHERNOUN];
                                                      TEMPORAL := FALSE;
                                                      ANIMATE := OMEGAANIMATE;
                                                      HUMAN := OMEGAHUMAN;
                                                      ACTCOMAS := [COUNT];
                                                      MOOD := DECLXPMOOD;
                                                      NUMERO := OMEGANUMERO;
                                                      DEFINITE := DEF;
                                                      GENERIC := NOGENERIC;
                                                      THETANP := OMEGATHETANP;
                                                      NOUNPATTERNEFS := [];
                                                      POSSPRED := FALSE;
                                                      POSSNIETNP := FALSE;
                                                      SYNTQUANT := OMEGAQUANT;
                                                      NPHEAD := OTHERNP;
                                                      SPECQ := OMEGASPEC;
                                                      DEFSPEC := FALSE;
                                                      CASES := [];
                                                      COORD := NOCOORD;
                                                      END
END;

 FUNCTION LSAUXDOM_CpPRONPVARONECBPRSPR
                         (rec:LSDOMAINT_NPVARRECORD):BOOLEAN;
VAR Bool : BOOLEAN;
BEGIN 
  Bool := FALSE;
  WITH rec DO
  BEGIN
    IF (REQ = [POSPOL,NEGPOL,OMEGAPOL] ) THEN
IF (ENV = [POSPOL,NEGPOL,OMEGAPOL] ) THEN
IF (SUPERTIEMPO = OMEGATIEMPO ) THEN
IF (CLASS = OMEGATIMEADVCLASS ) THEN
IF (TIEMPO = OMEGATIEMPO ) THEN
IF (ASPECTO = OMEGAASPECTO ) THEN
IF (RETRO = FALSE ) THEN
IF (PERSONA = 3 ) THEN
IF (GENERO = OMEGAGENERO ) THEN
IF (ACTSUBCS = [OTHERNOUN] ) THEN
IF (TEMPORAL = FALSE ) THEN
IF (ANIMATE = OMEGAANIMATE ) THEN
IF (HUMAN = OMEGAHUMAN ) THEN
IF (ACTCOMAS = [COUNT] ) THEN
IF (MOOD = DECLXPMOOD ) THEN
IF (NUMERO = OMEGANUMERO ) THEN
IF (DEFINITE = DEF ) THEN
IF (GENERIC = NOGENERIC ) THEN
IF (THETANP = OMEGATHETANP ) THEN
IF (NOUNPATTERNEFS = [] ) THEN
IF (POSSPRED = FALSE ) THEN
IF (POSSNIETNP = FALSE ) THEN
IF (SYNTQUANT = OMEGAQUANT ) THEN
IF (NPHEAD = OTHERNP ) THEN
IF (SPECQ = OMEGASPEC ) THEN
IF (DEFSPEC = FALSE ) THEN
IF (CASES = [] ) THEN
IF (COORD = NOCOORD ) THEN
IF (INDEX = 0 ) THEN
      Bool:=TRUE;
  END;{with}
  LSAUXDOM_CpPRONPVARONECBPRSPR:=Bool;
END;{function}
 PROCEDURE LSAUXDOM_AsPRONPVARONECBPRSPR(VAR rec:LSDOMAINT_NPVARRECORD);
BEGIN
WITH rec DO
BEGIN
REQ := [POSPOL,NEGPOL,OMEGAPOL];
                                                      ENV := [POSPOL,NEGPOL,OMEGAPOL];
                                                      SUPERTIEMPO := OMEGATIEMPO;
                                                      CLASS := OMEGATIMEADVCLASS;
                                                      TIEMPO := OMEGATIEMPO;
                                                      ASPECTO := OMEGAASPECTO;
                                                      RETRO := FALSE;
                                                      PERSONA := 3;
                                                      GENERO := OMEGAGENERO;
                                                      ACTSUBCS := [OTHERNOUN];
                                                      TEMPORAL := FALSE;
                                                      ANIMATE := OMEGAANIMATE;
                                                      HUMAN := OMEGAHUMAN;
                                                      ACTCOMAS := [COUNT];
                                                      MOOD := DECLXPMOOD;
                                                      NUMERO := OMEGANUMERO;
                                                      DEFINITE := DEF;
                                                      GENERIC := NOGENERIC;
                                                      THETANP := OMEGATHETANP;
                                                      NOUNPATTERNEFS := [];
                                                      POSSPRED := FALSE;
                                                      POSSNIETNP := FALSE;
                                                      SYNTQUANT := OMEGAQUANT;
                                                      NPHEAD := OTHERNP;
                                                      SPECQ := OMEGASPEC;
                                                      DEFSPEC := FALSE;
                                                      CASES := [];
                                                      COORD := NOCOORD;
                                                      INDEX := 0;
                                                      END
END;

 FUNCTION LSAUXDOM_CpNPONTUMASCBPRSPR
                         (rec:LSDOMAINT_NPRECORD):BOOLEAN;
VAR Bool : BOOLEAN;
BEGIN 
  Bool := FALSE;
  WITH rec DO
  BEGIN
    IF (REQ = [OMEGAPOL,POSPOL,NEGPOL] ) THEN
IF (ENV = [OMEGAPOL,POSPOL,NEGPOL] ) THEN
IF (SUPERTIEMPO = OMEGATIEMPO ) THEN
IF (CLASS = OMEGATIMEADVCLASS ) THEN
IF (TIEMPO = OMEGATIEMPO ) THEN
IF (ASPECTO = OMEGAASPECTO ) THEN
IF (RETRO = FALSE ) THEN
IF (PERSONA = 2 ) THEN
IF (GENERO = MASC ) THEN
IF (ACTSUBCS = [OTHERNOUN] ) THEN
IF (TEMPORAL = FALSE ) THEN
IF (ANIMATE = YESANIMATE ) THEN
IF (HUMAN = OMEGAHUMAN ) THEN
IF (ACTCOMAS = [COUNT] ) THEN
IF (MOOD = DECLXPMOOD ) THEN
IF (NUMERO = SINGULAR ) THEN
IF (DEFINITE = DEF ) THEN
IF (GENERIC = OMEGAGENERIC ) THEN
IF (THETANP = OMEGATHETANP ) THEN
IF (NOUNPATTERNEFS = [] ) THEN
IF (POSSPRED = TRUE ) THEN
IF (POSSNIETNP = FALSE ) THEN
IF (SYNTQUANT = OMEGAQUANT ) THEN
IF (NPHEAD = PERSPRONP ) THEN
IF (SPECQ = YESSPEC ) THEN
IF (DEFSPEC = FALSE ) THEN
IF (CASES = [NOMINATIVE] ) THEN
IF (COORD = NOCOORD ) THEN
      Bool:=TRUE;
  END;{with}
  LSAUXDOM_CpNPONTUMASCBPRSPR:=Bool;
END;{function}
 PROCEDURE LSAUXDOM_AsNPONTUMASCBPRSPR(VAR rec:LSDOMAINT_NPRECORD);
BEGIN
WITH rec DO
BEGIN
REQ := [OMEGAPOL,POSPOL,NEGPOL];
                                                      ENV := [OMEGAPOL,POSPOL,NEGPOL];
                                                      SUPERTIEMPO := OMEGATIEMPO;
                                                      CLASS := OMEGATIMEADVCLASS;
                                                      TIEMPO := OMEGATIEMPO;
                                                      ASPECTO := OMEGAASPECTO;
                                                      RETRO := FALSE;
                                                      PERSONA := 2;
                                                      GENERO := MASC;
                                                      ACTSUBCS := [OTHERNOUN];
                                                      TEMPORAL := FALSE;
                                                      ANIMATE := YESANIMATE;
                                                      HUMAN := OMEGAHUMAN;
                                                      ACTCOMAS := [COUNT];
                                                      MOOD := DECLXPMOOD;
                                                      NUMERO := SINGULAR;
                                                      DEFINITE := DEF;
                                                      GENERIC := OMEGAGENERIC;
                                                      THETANP := OMEGATHETANP;
                                                      NOUNPATTERNEFS := [];
                                                      POSSPRED := TRUE;
                                                      POSSNIETNP := FALSE;
                                                      SYNTQUANT := OMEGAQUANT;
                                                      NPHEAD := PERSPRONP;
                                                      SPECQ := YESSPEC;
                                                      DEFSPEC := FALSE;
                                                      CASES := [NOMINATIVE];
                                                      COORD := NOCOORD;
                                                      END
END;

 FUNCTION LSAUXDOM_CpNPONTUFEMBPRSPR
                         (rec:LSDOMAINT_NPRECORD):BOOLEAN;
VAR Bool : BOOLEAN;
BEGIN 
  Bool := FALSE;
  WITH rec DO
  BEGIN
    IF (REQ = [OMEGAPOL,POSPOL,NEGPOL] ) THEN
IF (ENV = [OMEGAPOL,POSPOL,NEGPOL] ) THEN
IF (SUPERTIEMPO = OMEGATIEMPO ) THEN
IF (CLASS = OMEGATIMEADVCLASS ) THEN
IF (TIEMPO = OMEGATIEMPO ) THEN
IF (ASPECTO = OMEGAASPECTO ) THEN
IF (RETRO = FALSE ) THEN
IF (PERSONA = 2 ) THEN
IF (GENERO = FEM ) THEN
IF (ACTSUBCS = [OTHERNOUN] ) THEN
IF (TEMPORAL = FALSE ) THEN
IF (ANIMATE = YESANIMATE ) THEN
IF (HUMAN = OMEGAHUMAN ) THEN
IF (ACTCOMAS = [COUNT] ) THEN
IF (MOOD = DECLXPMOOD ) THEN
IF (NUMERO = SINGULAR ) THEN
IF (DEFINITE = DEF ) THEN
IF (GENERIC = OMEGAGENERIC ) THEN
IF (THETANP = OMEGATHETANP ) THEN
IF (NOUNPATTERNEFS = [] ) THEN
IF (POSSPRED = TRUE ) THEN
IF (POSSNIETNP = FALSE ) THEN
IF (SYNTQUANT = OMEGAQUANT ) THEN
IF (NPHEAD = PERSPRONP ) THEN
IF (SPECQ = YESSPEC ) THEN
IF (DEFSPEC = FALSE ) THEN
IF (CASES = [NOMINATIVE] ) THEN
IF (COORD = NOCOORD ) THEN
      Bool:=TRUE;
  END;{with}
  LSAUXDOM_CpNPONTUFEMBPRSPR:=Bool;
END;{function}
 PROCEDURE LSAUXDOM_AsNPONTUFEMBPRSPR(VAR rec:LSDOMAINT_NPRECORD);
BEGIN
WITH rec DO
BEGIN
REQ := [OMEGAPOL,POSPOL,NEGPOL];
                                                      ENV := [OMEGAPOL,POSPOL,NEGPOL];
                                                      SUPERTIEMPO := OMEGATIEMPO;
                                                      CLASS := OMEGATIMEADVCLASS;
                                                      TIEMPO := OMEGATIEMPO;
                                                      ASPECTO := OMEGAASPECTO;
                                                      RETRO := FALSE;
                                                      PERSONA := 2;
                                                      GENERO := FEM;
                                                      ACTSUBCS := [OTHERNOUN];
                                                      TEMPORAL := FALSE;
                                                      ANIMATE := YESANIMATE;
                                                      HUMAN := OMEGAHUMAN;
                                                      ACTCOMAS := [COUNT];
                                                      MOOD := DECLXPMOOD;
                                                      NUMERO := SINGULAR;
                                                      DEFINITE := DEF;
                                                      GENERIC := OMEGAGENERIC;
                                                      THETANP := OMEGATHETANP;
                                                      NOUNPATTERNEFS := [];
                                                      POSSPRED := TRUE;
                                                      POSSNIETNP := FALSE;
                                                      SYNTQUANT := OMEGAQUANT;
                                                      NPHEAD := PERSPRONP;
                                                      SPECQ := YESSPEC;
                                                      DEFSPEC := FALSE;
                                                      CASES := [NOMINATIVE];
                                                      COORD := NOCOORD;
                                                      END
END;

 FUNCTION LSAUXDOM_CpNPONNOSOTROSBPRSPR
                         (rec:LSDOMAINT_NPRECORD):BOOLEAN;
VAR Bool : BOOLEAN;
BEGIN 
  Bool := FALSE;
  WITH rec DO
  BEGIN
    IF (REQ = [OMEGAPOL,POSPOL,NEGPOL] ) THEN
IF (ENV = [OMEGAPOL,POSPOL,NEGPOL] ) THEN
IF (SUPERTIEMPO = OMEGATIEMPO ) THEN
IF (CLASS = OMEGATIMEADVCLASS ) THEN
IF (TIEMPO = OMEGATIEMPO ) THEN
IF (ASPECTO = OMEGAASPECTO ) THEN
IF (RETRO = FALSE ) THEN
IF (PERSONA = 1 ) THEN
IF (GENERO = MASC ) THEN
IF (ACTSUBCS = [OTHERNOUN] ) THEN
IF (TEMPORAL = FALSE ) THEN
IF (ANIMATE = YESANIMATE ) THEN
IF (HUMAN = OMEGAHUMAN ) THEN
IF (ACTCOMAS = [COUNT] ) THEN
IF (MOOD = DECLXPMOOD ) THEN
IF (NUMERO = PLURAL ) THEN
IF (DEFINITE = DEF ) THEN
IF (GENERIC = OMEGAGENERIC ) THEN
IF (THETANP = OMEGATHETANP ) THEN
IF (NOUNPATTERNEFS = [] ) THEN
IF (POSSPRED = TRUE ) THEN
IF (POSSNIETNP = FALSE ) THEN
IF (SYNTQUANT = OMEGAQUANT ) THEN
IF (NPHEAD = PERSPRONP ) THEN
IF (SPECQ = YESSPEC ) THEN
IF (DEFSPEC = FALSE ) THEN
IF (CASES = [NOMINATIVE] ) THEN
IF (COORD = NOCOORD ) THEN
      Bool:=TRUE;
  END;{with}
  LSAUXDOM_CpNPONNOSOTROSBPRSPR:=Bool;
END;{function}
 PROCEDURE LSAUXDOM_AsNPONNOSOTROSBPRSPR(VAR rec:LSDOMAINT_NPRECORD);
BEGIN
WITH rec DO
BEGIN
REQ := [OMEGAPOL,POSPOL,NEGPOL];
                                                      ENV := [OMEGAPOL,POSPOL,NEGPOL];
                                                      SUPERTIEMPO := OMEGATIEMPO;
                                                      CLASS := OMEGATIMEADVCLASS;
                                                      TIEMPO := OMEGATIEMPO;
                                                      ASPECTO := OMEGAASPECTO;
                                                      RETRO := FALSE;
                                                      PERSONA := 1;
                                                      GENERO := MASC;
                                                      ACTSUBCS := [OTHERNOUN];
                                                      TEMPORAL := FALSE;
                                                      ANIMATE := YESANIMATE;
                                                      HUMAN := OMEGAHUMAN;
                                                      ACTCOMAS := [COUNT];
                                                      MOOD := DECLXPMOOD;
                                                      NUMERO := PLURAL;
                                                      DEFINITE := DEF;
                                                      GENERIC := OMEGAGENERIC;
                                                      THETANP := OMEGATHETANP;
                                                      NOUNPATTERNEFS := [];
                                                      POSSPRED := TRUE;
                                                      POSSNIETNP := FALSE;
                                                      SYNTQUANT := OMEGAQUANT;
                                                      NPHEAD := PERSPRONP;
                                                      SPECQ := YESSPEC;
                                                      DEFSPEC := FALSE;
                                                      CASES := [NOMINATIVE];
                                                      COORD := NOCOORD;
                                                      END
END;

 FUNCTION LSAUXDOM_CpNPONNOSOTRASBPRSPR
                         (rec:LSDOMAINT_NPRECORD):BOOLEAN;
VAR Bool : BOOLEAN;
BEGIN 
  Bool := FALSE;
  WITH rec DO
  BEGIN
    IF (REQ = [OMEGAPOL,POSPOL,NEGPOL] ) THEN
IF (ENV = [OMEGAPOL,POSPOL,NEGPOL] ) THEN
IF (SUPERTIEMPO = OMEGATIEMPO ) THEN
IF (CLASS = OMEGATIMEADVCLASS ) THEN
IF (TIEMPO = OMEGATIEMPO ) THEN
IF (ASPECTO = OMEGAASPECTO ) THEN
IF (RETRO = FALSE ) THEN
IF (PERSONA = 1 ) THEN
IF (GENERO = FEM ) THEN
IF (ACTSUBCS = [OTHERNOUN] ) THEN
IF (TEMPORAL = FALSE ) THEN
IF (ANIMATE = YESANIMATE ) THEN
IF (HUMAN = OMEGAHUMAN ) THEN
IF (ACTCOMAS = [COUNT] ) THEN
IF (MOOD = DECLXPMOOD ) THEN
IF (NUMERO = PLURAL ) THEN
IF (DEFINITE = DEF ) THEN
IF (GENERIC = OMEGAGENERIC ) THEN
IF (THETANP = OMEGATHETANP ) THEN
IF (NOUNPATTERNEFS = [] ) THEN
IF (POSSPRED = TRUE ) THEN
IF (POSSNIETNP = FALSE ) THEN
IF (SYNTQUANT = OMEGAQUANT ) THEN
IF (NPHEAD = PERSPRONP ) THEN
IF (SPECQ = YESSPEC ) THEN
IF (DEFSPEC = FALSE ) THEN
IF (CASES = [NOMINATIVE] ) THEN
IF (COORD = NOCOORD ) THEN
      Bool:=TRUE;
  END;{with}
  LSAUXDOM_CpNPONNOSOTRASBPRSPR:=Bool;
END;{function}
 PROCEDURE LSAUXDOM_AsNPONNOSOTRASBPRSPR(VAR rec:LSDOMAINT_NPRECORD);
BEGIN
WITH rec DO
BEGIN
REQ := [OMEGAPOL,POSPOL,NEGPOL];
                                                      ENV := [OMEGAPOL,POSPOL,NEGPOL];
                                                      SUPERTIEMPO := OMEGATIEMPO;
                                                      CLASS := OMEGATIMEADVCLASS;
                                                      TIEMPO := OMEGATIEMPO;
                                                      ASPECTO := OMEGAASPECTO;
                                                      RETRO := FALSE;
                                                      PERSONA := 1;
                                                      GENERO := FEM;
                                                      ACTSUBCS := [OTHERNOUN];
                                                      TEMPORAL := FALSE;
                                                      ANIMATE := YESANIMATE;
                                                      HUMAN := OMEGAHUMAN;
                                                      ACTCOMAS := [COUNT];
                                                      MOOD := DECLXPMOOD;
                                                      NUMERO := PLURAL;
                                                      DEFINITE := DEF;
                                                      GENERIC := OMEGAGENERIC;
                                                      THETANP := OMEGATHETANP;
                                                      NOUNPATTERNEFS := [];
                                                      POSSPRED := TRUE;
                                                      POSSNIETNP := FALSE;
                                                      SYNTQUANT := OMEGAQUANT;
                                                      NPHEAD := PERSPRONP;
                                                      SPECQ := YESSPEC;
                                                      DEFSPEC := FALSE;
                                                      CASES := [NOMINATIVE];
                                                      COORD := NOCOORD;
                                                      END
END;

 FUNCTION LSAUXDOM_CpNPONVOSOTROSBPRSPR
                         (rec:LSDOMAINT_NPRECORD):BOOLEAN;
VAR Bool : BOOLEAN;
BEGIN 
  Bool := FALSE;
  WITH rec DO
  BEGIN
    IF (REQ = [OMEGAPOL,POSPOL,NEGPOL] ) THEN
IF (ENV = [OMEGAPOL,POSPOL,NEGPOL] ) THEN
IF (SUPERTIEMPO = OMEGATIEMPO ) THEN
IF (CLASS = OMEGATIMEADVCLASS ) THEN
IF (TIEMPO = OMEGATIEMPO ) THEN
IF (ASPECTO = OMEGAASPECTO ) THEN
IF (RETRO = FALSE ) THEN
IF (PERSONA = 2 ) THEN
IF (GENERO = MASC ) THEN
IF (ACTSUBCS = [OTHERNOUN] ) THEN
IF (TEMPORAL = FALSE ) THEN
IF (ANIMATE = YESANIMATE ) THEN
IF (HUMAN = OMEGAHUMAN ) THEN
IF (ACTCOMAS = [COUNT] ) THEN
IF (MOOD = DECLXPMOOD ) THEN
IF (NUMERO = PLURAL ) THEN
IF (DEFINITE = DEF ) THEN
IF (GENERIC = OMEGAGENERIC ) THEN
IF (THETANP = OMEGATHETANP ) THEN
IF (NOUNPATTERNEFS = [] ) THEN
IF (POSSPRED = TRUE ) THEN
IF (POSSNIETNP = FALSE ) THEN
IF (SYNTQUANT = OMEGAQUANT ) THEN
IF (NPHEAD = PERSPRONP ) THEN
IF (SPECQ = YESSPEC ) THEN
IF (DEFSPEC = FALSE ) THEN
IF (CASES = [NOMINATIVE] ) THEN
IF (COORD = NOCOORD ) THEN
      Bool:=TRUE;
  END;{with}
  LSAUXDOM_CpNPONVOSOTROSBPRSPR:=Bool;
END;{function}
 PROCEDURE LSAUXDOM_AsNPONVOSOTROSBPRSPR(VAR rec:LSDOMAINT_NPRECORD);
BEGIN
WITH rec DO
BEGIN
REQ := [OMEGAPOL,POSPOL,NEGPOL];
                                                      ENV := [OMEGAPOL,POSPOL,NEGPOL];
                                                      SUPERTIEMPO := OMEGATIEMPO;
                                                      CLASS := OMEGATIMEADVCLASS;
                                                      TIEMPO := OMEGATIEMPO;
                                                      ASPECTO := OMEGAASPECTO;
                                                      RETRO := FALSE;
                                                      PERSONA := 2;
                                                      GENERO := MASC;
                                                      ACTSUBCS := [OTHERNOUN];
                                                      TEMPORAL := FALSE;
                                                      ANIMATE := YESANIMATE;
                                                      HUMAN := OMEGAHUMAN;
                                                      ACTCOMAS := [COUNT];
                                                      MOOD := DECLXPMOOD;
                                                      NUMERO := PLURAL;
                                                      DEFINITE := DEF;
                                                      GENERIC := OMEGAGENERIC;
                                                      THETANP := OMEGATHETANP;
                                                      NOUNPATTERNEFS := [];
                                                      POSSPRED := TRUE;
                                                      POSSNIETNP := FALSE;
                                                      SYNTQUANT := OMEGAQUANT;
                                                      NPHEAD := PERSPRONP;
                                                      SPECQ := YESSPEC;
                                                      DEFSPEC := FALSE;
                                                      CASES := [NOMINATIVE];
                                                      COORD := NOCOORD;
                                                      END
END;

 FUNCTION LSAUXDOM_CpNPONVOSOTRASBPRSPR
                         (rec:LSDOMAINT_NPRECORD):BOOLEAN;
VAR Bool : BOOLEAN;
BEGIN 
  Bool := FALSE;
  WITH rec DO
  BEGIN
    IF (REQ = [OMEGAPOL,POSPOL,NEGPOL] ) THEN
IF (ENV = [OMEGAPOL,POSPOL,NEGPOL] ) THEN
IF (SUPERTIEMPO = OMEGATIEMPO ) THEN
IF (CLASS = OMEGATIMEADVCLASS ) THEN
IF (TIEMPO = OMEGATIEMPO ) THEN
IF (ASPECTO = OMEGAASPECTO ) THEN
IF (RETRO = FALSE ) THEN
IF (PERSONA = 2 ) THEN
IF (GENERO = FEM ) THEN
IF (ACTSUBCS = [OTHERNOUN] ) THEN
IF (TEMPORAL = FALSE ) THEN
IF (ANIMATE = YESANIMATE ) THEN
IF (HUMAN = OMEGAHUMAN ) THEN
IF (ACTCOMAS = [COUNT] ) THEN
IF (MOOD = DECLXPMOOD ) THEN
IF (NUMERO = PLURAL ) THEN
IF (DEFINITE = DEF ) THEN
IF (GENERIC = OMEGAGENERIC ) THEN
IF (THETANP = OMEGATHETANP ) THEN
IF (NOUNPATTERNEFS = [] ) THEN
IF (POSSPRED = TRUE ) THEN
IF (POSSNIETNP = FALSE ) THEN
IF (SYNTQUANT = OMEGAQUANT ) THEN
IF (NPHEAD = PERSPRONP ) THEN
IF (SPECQ = YESSPEC ) THEN
IF (DEFSPEC = FALSE ) THEN
IF (CASES = [NOMINATIVE] ) THEN
IF (COORD = NOCOORD ) THEN
      Bool:=TRUE;
  END;{with}
  LSAUXDOM_CpNPONVOSOTRASBPRSPR:=Bool;
END;{function}
 PROCEDURE LSAUXDOM_AsNPONVOSOTRASBPRSPR(VAR rec:LSDOMAINT_NPRECORD);
BEGIN
WITH rec DO
BEGIN
REQ := [OMEGAPOL,POSPOL,NEGPOL];
                                                      ENV := [OMEGAPOL,POSPOL,NEGPOL];
                                                      SUPERTIEMPO := OMEGATIEMPO;
                                                      CLASS := OMEGATIMEADVCLASS;
                                                      TIEMPO := OMEGATIEMPO;
                                                      ASPECTO := OMEGAASPECTO;
                                                      RETRO := FALSE;
                                                      PERSONA := 2;
                                                      GENERO := FEM;
                                                      ACTSUBCS := [OTHERNOUN];
                                                      TEMPORAL := FALSE;
                                                      ANIMATE := YESANIMATE;
                                                      HUMAN := OMEGAHUMAN;
                                                      ACTCOMAS := [COUNT];
                                                      MOOD := DECLXPMOOD;
                                                      NUMERO := PLURAL;
                                                      DEFINITE := DEF;
                                                      GENERIC := OMEGAGENERIC;
                                                      THETANP := OMEGATHETANP;
                                                      NOUNPATTERNEFS := [];
                                                      POSSPRED := TRUE;
                                                      POSSNIETNP := FALSE;
                                                      SYNTQUANT := OMEGAQUANT;
                                                      NPHEAD := PERSPRONP;
                                                      SPECQ := YESSPEC;
                                                      DEFSPEC := FALSE;
                                                      CASES := [NOMINATIVE];
                                                      COORD := NOCOORD;
                                                      END
END;

 FUNCTION LSAUXDOM_CpNPONESTODMPR
                         (rec:LSDOMAINT_NPRECORD):BOOLEAN;
VAR Bool : BOOLEAN;
BEGIN 
  Bool := FALSE;
  WITH rec DO
  BEGIN
    IF (REQ = [OMEGAPOL,POSPOL,NEGPOL] ) THEN
IF (ENV = [OMEGAPOL,POSPOL,NEGPOL] ) THEN
IF (SUPERTIEMPO = OMEGATIEMPO ) THEN
IF (CLASS = OMEGATIMEADVCLASS ) THEN
IF (TIEMPO = OMEGATIEMPO ) THEN
IF (ASPECTO = OMEGAASPECTO ) THEN
IF (RETRO = FALSE ) THEN
IF (PERSONA = 3 ) THEN
IF (GENERO = NEUTRO ) THEN
IF (ACTSUBCS = [OTHERNOUN] ) THEN
IF (TEMPORAL = FALSE ) THEN
IF (ANIMATE = OMEGAANIMATE ) THEN
IF (HUMAN = OMEGAHUMAN ) THEN
IF (ACTCOMAS = [] ) THEN
IF (MOOD = DECLXPMOOD ) THEN
IF (NUMERO = SINGULAR ) THEN
IF (DEFINITE = DEF ) THEN
IF (GENERIC = OMEGAGENERIC ) THEN
IF (THETANP = OMEGATHETANP ) THEN
IF (NOUNPATTERNEFS = [] ) THEN
IF (POSSPRED = FALSE ) THEN
IF (POSSNIETNP = FALSE ) THEN
IF (SYNTQUANT = OMEGAQUANT ) THEN
IF (NPHEAD = ESTENP ) THEN
IF (SPECQ = YESSPEC ) THEN
IF (DEFSPEC = FALSE ) THEN
IF (CASES = [] ) THEN
IF (COORD = NOCOORD ) THEN
      Bool:=TRUE;
  END;{with}
  LSAUXDOM_CpNPONESTODMPR:=Bool;
END;{function}
 PROCEDURE LSAUXDOM_AsNPONESTODMPR(VAR rec:LSDOMAINT_NPRECORD);
BEGIN
WITH rec DO
BEGIN
REQ := [OMEGAPOL,POSPOL,NEGPOL];
                                                      ENV := [OMEGAPOL,POSPOL,NEGPOL];
                                                      SUPERTIEMPO := OMEGATIEMPO;
                                                      CLASS := OMEGATIMEADVCLASS;
                                                      TIEMPO := OMEGATIEMPO;
                                                      ASPECTO := OMEGAASPECTO;
                                                      RETRO := FALSE;
                                                      PERSONA := 3;
                                                      GENERO := NEUTRO;
                                                      ACTSUBCS := [OTHERNOUN];
                                                      TEMPORAL := FALSE;
                                                      ANIMATE := OMEGAANIMATE;
                                                      HUMAN := OMEGAHUMAN;
                                                      ACTCOMAS := [];
                                                      MOOD := DECLXPMOOD;
                                                      NUMERO := SINGULAR;
                                                      DEFINITE := DEF;
                                                      GENERIC := OMEGAGENERIC;
                                                      THETANP := OMEGATHETANP;
                                                      NOUNPATTERNEFS := [];
                                                      POSSPRED := FALSE;
                                                      POSSNIETNP := FALSE;
                                                      SYNTQUANT := OMEGAQUANT;
                                                      NPHEAD := ESTENP;
                                                      SPECQ := YESSPEC;
                                                      DEFSPEC := FALSE;
                                                      CASES := [];
                                                      COORD := NOCOORD;
                                                      END
END;

 FUNCTION LSAUXDOM_CpNPONESTEDMPR
                         (rec:LSDOMAINT_NPRECORD):BOOLEAN;
VAR Bool : BOOLEAN;
BEGIN 
  Bool := FALSE;
  WITH rec DO
  BEGIN
    IF (REQ = [OMEGAPOL,POSPOL,NEGPOL] ) THEN
IF (ENV = [OMEGAPOL,POSPOL,NEGPOL] ) THEN
IF (SUPERTIEMPO = OMEGATIEMPO ) THEN
IF (CLASS = OMEGATIMEADVCLASS ) THEN
IF (TIEMPO = OMEGATIEMPO ) THEN
IF (ASPECTO = OMEGAASPECTO ) THEN
IF (RETRO = FALSE ) THEN
IF (PERSONA = 3 ) THEN
IF (GENERO = MASC ) THEN
IF (ACTSUBCS = [OTHERNOUN] ) THEN
IF (TEMPORAL = FALSE ) THEN
IF (ANIMATE = OMEGAANIMATE ) THEN
IF (HUMAN = OMEGAHUMAN ) THEN
IF (ACTCOMAS = [] ) THEN
IF (MOOD = DECLXPMOOD ) THEN
IF (NUMERO = SINGULAR ) THEN
IF (DEFINITE = DEF ) THEN
IF (GENERIC = OMEGAGENERIC ) THEN
IF (THETANP = OMEGATHETANP ) THEN
IF (NOUNPATTERNEFS = [] ) THEN
IF (POSSPRED = FALSE ) THEN
IF (POSSNIETNP = FALSE ) THEN
IF (SYNTQUANT = OMEGAQUANT ) THEN
IF (NPHEAD = ESTENP ) THEN
IF (SPECQ = YESSPEC ) THEN
IF (DEFSPEC = FALSE ) THEN
IF (CASES = [] ) THEN
IF (COORD = NOCOORD ) THEN
      Bool:=TRUE;
  END;{with}
  LSAUXDOM_CpNPONESTEDMPR:=Bool;
END;{function}
 PROCEDURE LSAUXDOM_AsNPONESTEDMPR(VAR rec:LSDOMAINT_NPRECORD);
BEGIN
WITH rec DO
BEGIN
REQ := [OMEGAPOL,POSPOL,NEGPOL];
                                                      ENV := [OMEGAPOL,POSPOL,NEGPOL];
                                                      SUPERTIEMPO := OMEGATIEMPO;
                                                      CLASS := OMEGATIMEADVCLASS;
                                                      TIEMPO := OMEGATIEMPO;
                                                      ASPECTO := OMEGAASPECTO;
                                                      RETRO := FALSE;
                                                      PERSONA := 3;
                                                      GENERO := MASC;
                                                      ACTSUBCS := [OTHERNOUN];
                                                      TEMPORAL := FALSE;
                                                      ANIMATE := OMEGAANIMATE;
                                                      HUMAN := OMEGAHUMAN;
                                                      ACTCOMAS := [];
                                                      MOOD := DECLXPMOOD;
                                                      NUMERO := SINGULAR;
                                                      DEFINITE := DEF;
                                                      GENERIC := OMEGAGENERIC;
                                                      THETANP := OMEGATHETANP;
                                                      NOUNPATTERNEFS := [];
                                                      POSSPRED := FALSE;
                                                      POSSNIETNP := FALSE;
                                                      SYNTQUANT := OMEGAQUANT;
                                                      NPHEAD := ESTENP;
                                                      SPECQ := YESSPEC;
                                                      DEFSPEC := FALSE;
                                                      CASES := [];
                                                      COORD := NOCOORD;
                                                      END
END;

 FUNCTION LSAUXDOM_CpNPONESTADMPR
                         (rec:LSDOMAINT_NPRECORD):BOOLEAN;
VAR Bool : BOOLEAN;
BEGIN 
  Bool := FALSE;
  WITH rec DO
  BEGIN
    IF (REQ = [OMEGAPOL,POSPOL,NEGPOL] ) THEN
IF (ENV = [OMEGAPOL,POSPOL,NEGPOL] ) THEN
IF (SUPERTIEMPO = OMEGATIEMPO ) THEN
IF (CLASS = OMEGATIMEADVCLASS ) THEN
IF (TIEMPO = OMEGATIEMPO ) THEN
IF (ASPECTO = OMEGAASPECTO ) THEN
IF (RETRO = FALSE ) THEN
IF (PERSONA = 3 ) THEN
IF (GENERO = FEM ) THEN
IF (ACTSUBCS = [OTHERNOUN] ) THEN
IF (TEMPORAL = FALSE ) THEN
IF (ANIMATE = OMEGAANIMATE ) THEN
IF (HUMAN = OMEGAHUMAN ) THEN
IF (ACTCOMAS = [] ) THEN
IF (MOOD = DECLXPMOOD ) THEN
IF (NUMERO = SINGULAR ) THEN
IF (DEFINITE = DEF ) THEN
IF (GENERIC = OMEGAGENERIC ) THEN
IF (THETANP = OMEGATHETANP ) THEN
IF (NOUNPATTERNEFS = [] ) THEN
IF (POSSPRED = FALSE ) THEN
IF (POSSNIETNP = FALSE ) THEN
IF (SYNTQUANT = OMEGAQUANT ) THEN
IF (NPHEAD = ESTENP ) THEN
IF (SPECQ = YESSPEC ) THEN
IF (DEFSPEC = FALSE ) THEN
IF (CASES = [] ) THEN
IF (COORD = NOCOORD ) THEN
      Bool:=TRUE;
  END;{with}
  LSAUXDOM_CpNPONESTADMPR:=Bool;
END;{function}
 PROCEDURE LSAUXDOM_AsNPONESTADMPR(VAR rec:LSDOMAINT_NPRECORD);
BEGIN
WITH rec DO
BEGIN
REQ := [OMEGAPOL,POSPOL,NEGPOL];
                                                      ENV := [OMEGAPOL,POSPOL,NEGPOL];
                                                      SUPERTIEMPO := OMEGATIEMPO;
                                                      CLASS := OMEGATIMEADVCLASS;
                                                      TIEMPO := OMEGATIEMPO;
                                                      ASPECTO := OMEGAASPECTO;
                                                      RETRO := FALSE;
                                                      PERSONA := 3;
                                                      GENERO := FEM;
                                                      ACTSUBCS := [OTHERNOUN];
                                                      TEMPORAL := FALSE;
                                                      ANIMATE := OMEGAANIMATE;
                                                      HUMAN := OMEGAHUMAN;
                                                      ACTCOMAS := [];
                                                      MOOD := DECLXPMOOD;
                                                      NUMERO := SINGULAR;
                                                      DEFINITE := DEF;
                                                      GENERIC := OMEGAGENERIC;
                                                      THETANP := OMEGATHETANP;
                                                      NOUNPATTERNEFS := [];
                                                      POSSPRED := FALSE;
                                                      POSSNIETNP := FALSE;
                                                      SYNTQUANT := OMEGAQUANT;
                                                      NPHEAD := ESTENP;
                                                      SPECQ := YESSPEC;
                                                      DEFSPEC := FALSE;
                                                      CASES := [];
                                                      COORD := NOCOORD;
                                                      END
END;

 FUNCTION LSAUXDOM_CpNPONESTOSDMPR
                         (rec:LSDOMAINT_NPRECORD):BOOLEAN;
VAR Bool : BOOLEAN;
BEGIN 
  Bool := FALSE;
  WITH rec DO
  BEGIN
    IF (REQ = [OMEGAPOL,POSPOL,NEGPOL] ) THEN
IF (ENV = [OMEGAPOL,POSPOL,NEGPOL] ) THEN
IF (SUPERTIEMPO = OMEGATIEMPO ) THEN
IF (CLASS = OMEGATIMEADVCLASS ) THEN
IF (TIEMPO = OMEGATIEMPO ) THEN
IF (ASPECTO = OMEGAASPECTO ) THEN
IF (RETRO = FALSE ) THEN
IF (PERSONA = 3 ) THEN
IF (GENERO = MASC ) THEN
IF (ACTSUBCS = [OTHERNOUN] ) THEN
IF (TEMPORAL = FALSE ) THEN
IF (ANIMATE = OMEGAANIMATE ) THEN
IF (HUMAN = OMEGAHUMAN ) THEN
IF (ACTCOMAS = [] ) THEN
IF (MOOD = DECLXPMOOD ) THEN
IF (NUMERO = PLURAL ) THEN
IF (DEFINITE = DEF ) THEN
IF (GENERIC = OMEGAGENERIC ) THEN
IF (THETANP = OMEGATHETANP ) THEN
IF (NOUNPATTERNEFS = [] ) THEN
IF (POSSPRED = FALSE ) THEN
IF (POSSNIETNP = FALSE ) THEN
IF (SYNTQUANT = OMEGAQUANT ) THEN
IF (NPHEAD = ESTENP ) THEN
IF (SPECQ = YESSPEC ) THEN
IF (DEFSPEC = FALSE ) THEN
IF (CASES = [] ) THEN
IF (COORD = NOCOORD ) THEN
      Bool:=TRUE;
  END;{with}
  LSAUXDOM_CpNPONESTOSDMPR:=Bool;
END;{function}
 PROCEDURE LSAUXDOM_AsNPONESTOSDMPR(VAR rec:LSDOMAINT_NPRECORD);
BEGIN
WITH rec DO
BEGIN
REQ := [OMEGAPOL,POSPOL,NEGPOL];
                                                      ENV := [OMEGAPOL,POSPOL,NEGPOL];
                                                      SUPERTIEMPO := OMEGATIEMPO;
                                                      CLASS := OMEGATIMEADVCLASS;
                                                      TIEMPO := OMEGATIEMPO;
                                                      ASPECTO := OMEGAASPECTO;
                                                      RETRO := FALSE;
                                                      PERSONA := 3;
                                                      GENERO := MASC;
                                                      ACTSUBCS := [OTHERNOUN];
                                                      TEMPORAL := FALSE;
                                                      ANIMATE := OMEGAANIMATE;
                                                      HUMAN := OMEGAHUMAN;
                                                      ACTCOMAS := [];
                                                      MOOD := DECLXPMOOD;
                                                      NUMERO := PLURAL;
                                                      DEFINITE := DEF;
                                                      GENERIC := OMEGAGENERIC;
                                                      THETANP := OMEGATHETANP;
                                                      NOUNPATTERNEFS := [];
                                                      POSSPRED := FALSE;
                                                      POSSNIETNP := FALSE;
                                                      SYNTQUANT := OMEGAQUANT;
                                                      NPHEAD := ESTENP;
                                                      SPECQ := YESSPEC;
                                                      DEFSPEC := FALSE;
                                                      CASES := [];
                                                      COORD := NOCOORD;
                                                      END
END;

 FUNCTION LSAUXDOM_CpNPONESTASDMPR
                         (rec:LSDOMAINT_NPRECORD):BOOLEAN;
VAR Bool : BOOLEAN;
BEGIN 
  Bool := FALSE;
  WITH rec DO
  BEGIN
    IF (REQ = [OMEGAPOL,POSPOL,NEGPOL] ) THEN
IF (ENV = [OMEGAPOL,POSPOL,NEGPOL] ) THEN
IF (SUPERTIEMPO = OMEGATIEMPO ) THEN
IF (CLASS = OMEGATIMEADVCLASS ) THEN
IF (TIEMPO = OMEGATIEMPO ) THEN
IF (ASPECTO = OMEGAASPECTO ) THEN
IF (RETRO = FALSE ) THEN
IF (PERSONA = 3 ) THEN
IF (GENERO = FEM ) THEN
IF (ACTSUBCS = [OTHERNOUN] ) THEN
IF (TEMPORAL = FALSE ) THEN
IF (ANIMATE = OMEGAANIMATE ) THEN
IF (HUMAN = OMEGAHUMAN ) THEN
IF (ACTCOMAS = [] ) THEN
IF (MOOD = DECLXPMOOD ) THEN
IF (NUMERO = PLURAL ) THEN
IF (DEFINITE = DEF ) THEN
IF (GENERIC = OMEGAGENERIC ) THEN
IF (THETANP = OMEGATHETANP ) THEN
IF (NOUNPATTERNEFS = [] ) THEN
IF (POSSPRED = FALSE ) THEN
IF (POSSNIETNP = FALSE ) THEN
IF (SYNTQUANT = OMEGAQUANT ) THEN
IF (NPHEAD = ESTENP ) THEN
IF (SPECQ = YESSPEC ) THEN
IF (DEFSPEC = FALSE ) THEN
IF (CASES = [] ) THEN
IF (COORD = NOCOORD ) THEN
      Bool:=TRUE;
  END;{with}
  LSAUXDOM_CpNPONESTASDMPR:=Bool;
END;{function}
 PROCEDURE LSAUXDOM_AsNPONESTASDMPR(VAR rec:LSDOMAINT_NPRECORD);
BEGIN
WITH rec DO
BEGIN
REQ := [OMEGAPOL,POSPOL,NEGPOL];
                                                      ENV := [OMEGAPOL,POSPOL,NEGPOL];
                                                      SUPERTIEMPO := OMEGATIEMPO;
                                                      CLASS := OMEGATIMEADVCLASS;
                                                      TIEMPO := OMEGATIEMPO;
                                                      ASPECTO := OMEGAASPECTO;
                                                      RETRO := FALSE;
                                                      PERSONA := 3;
                                                      GENERO := FEM;
                                                      ACTSUBCS := [OTHERNOUN];
                                                      TEMPORAL := FALSE;
                                                      ANIMATE := OMEGAANIMATE;
                                                      HUMAN := OMEGAHUMAN;
                                                      ACTCOMAS := [];
                                                      MOOD := DECLXPMOOD;
                                                      NUMERO := PLURAL;
                                                      DEFINITE := DEF;
                                                      GENERIC := OMEGAGENERIC;
                                                      THETANP := OMEGATHETANP;
                                                      NOUNPATTERNEFS := [];
                                                      POSSPRED := FALSE;
                                                      POSSNIETNP := FALSE;
                                                      SYNTQUANT := OMEGAQUANT;
                                                      NPHEAD := ESTENP;
                                                      SPECQ := YESSPEC;
                                                      DEFSPEC := FALSE;
                                                      CASES := [];
                                                      COORD := NOCOORD;
                                                      END
END;

 FUNCTION LSAUXDOM_CpNPONESODMPR
                         (rec:LSDOMAINT_NPRECORD):BOOLEAN;
VAR Bool : BOOLEAN;
BEGIN 
  Bool := FALSE;
  WITH rec DO
  BEGIN
    IF (REQ = [OMEGAPOL,POSPOL,NEGPOL] ) THEN
IF (ENV = [OMEGAPOL,POSPOL,NEGPOL] ) THEN
IF (SUPERTIEMPO = OMEGATIEMPO ) THEN
IF (CLASS = OMEGATIMEADVCLASS ) THEN
IF (TIEMPO = OMEGATIEMPO ) THEN
IF (ASPECTO = OMEGAASPECTO ) THEN
IF (RETRO = FALSE ) THEN
IF (PERSONA = 3 ) THEN
IF (GENERO = NEUTRO ) THEN
IF (ACTSUBCS = [OTHERNOUN] ) THEN
IF (TEMPORAL = FALSE ) THEN
IF (ANIMATE = OMEGAANIMATE ) THEN
IF (HUMAN = OMEGAHUMAN ) THEN
IF (ACTCOMAS = [] ) THEN
IF (MOOD = DECLXPMOOD ) THEN
IF (NUMERO = SINGULAR ) THEN
IF (DEFINITE = DEF ) THEN
IF (GENERIC = OMEGAGENERIC ) THEN
IF (THETANP = OMEGATHETANP ) THEN
IF (NOUNPATTERNEFS = [] ) THEN
IF (POSSPRED = FALSE ) THEN
IF (POSSNIETNP = FALSE ) THEN
IF (SYNTQUANT = OMEGAQUANT ) THEN
IF (NPHEAD = ESENP ) THEN
IF (SPECQ = YESSPEC ) THEN
IF (DEFSPEC = FALSE ) THEN
IF (CASES = [] ) THEN
IF (COORD = NOCOORD ) THEN
      Bool:=TRUE;
  END;{with}
  LSAUXDOM_CpNPONESODMPR:=Bool;
END;{function}
 PROCEDURE LSAUXDOM_AsNPONESODMPR(VAR rec:LSDOMAINT_NPRECORD);
BEGIN
WITH rec DO
BEGIN
REQ := [OMEGAPOL,POSPOL,NEGPOL];
                                                      ENV := [OMEGAPOL,POSPOL,NEGPOL];
                                                      SUPERTIEMPO := OMEGATIEMPO;
                                                      CLASS := OMEGATIMEADVCLASS;
                                                      TIEMPO := OMEGATIEMPO;
                                                      ASPECTO := OMEGAASPECTO;
                                                      RETRO := FALSE;
                                                      PERSONA := 3;
                                                      GENERO := NEUTRO;
                                                      ACTSUBCS := [OTHERNOUN];
                                                      TEMPORAL := FALSE;
                                                      ANIMATE := OMEGAANIMATE;
                                                      HUMAN := OMEGAHUMAN;
                                                      ACTCOMAS := [];
                                                      MOOD := DECLXPMOOD;
                                                      NUMERO := SINGULAR;
                                                      DEFINITE := DEF;
                                                      GENERIC := OMEGAGENERIC;
                                                      THETANP := OMEGATHETANP;
                                                      NOUNPATTERNEFS := [];
                                                      POSSPRED := FALSE;
                                                      POSSNIETNP := FALSE;
                                                      SYNTQUANT := OMEGAQUANT;
                                                      NPHEAD := ESENP;
                                                      SPECQ := YESSPEC;
                                                      DEFSPEC := FALSE;
                                                      CASES := [];
                                                      COORD := NOCOORD;
                                                      END
END;

 FUNCTION LSAUXDOM_CpNPONESEDMPR
                         (rec:LSDOMAINT_NPRECORD):BOOLEAN;
VAR Bool : BOOLEAN;
BEGIN 
  Bool := FALSE;
  WITH rec DO
  BEGIN
    IF (REQ = [OMEGAPOL,POSPOL,NEGPOL] ) THEN
IF (ENV = [OMEGAPOL,POSPOL,NEGPOL] ) THEN
IF (SUPERTIEMPO = OMEGATIEMPO ) THEN
IF (CLASS = OMEGATIMEADVCLASS ) THEN
IF (TIEMPO = OMEGATIEMPO ) THEN
IF (ASPECTO = OMEGAASPECTO ) THEN
IF (RETRO = FALSE ) THEN
IF (PERSONA = 3 ) THEN
IF (GENERO = MASC ) THEN
IF (ACTSUBCS = [OTHERNOUN] ) THEN
IF (TEMPORAL = FALSE ) THEN
IF (ANIMATE = OMEGAANIMATE ) THEN
IF (HUMAN = OMEGAHUMAN ) THEN
IF (ACTCOMAS = [] ) THEN
IF (MOOD = DECLXPMOOD ) THEN
IF (NUMERO = SINGULAR ) THEN
IF (DEFINITE = DEF ) THEN
IF (GENERIC = OMEGAGENERIC ) THEN
IF (THETANP = OMEGATHETANP ) THEN
IF (NOUNPATTERNEFS = [] ) THEN
IF (POSSPRED = FALSE ) THEN
IF (POSSNIETNP = FALSE ) THEN
IF (SYNTQUANT = OMEGAQUANT ) THEN
IF (NPHEAD = ESENP ) THEN
IF (SPECQ = YESSPEC ) THEN
IF (DEFSPEC = FALSE ) THEN
IF (CASES = [] ) THEN
IF (COORD = NOCOORD ) THEN
      Bool:=TRUE;
  END;{with}
  LSAUXDOM_CpNPONESEDMPR:=Bool;
END;{function}
 PROCEDURE LSAUXDOM_AsNPONESEDMPR(VAR rec:LSDOMAINT_NPRECORD);
BEGIN
WITH rec DO
BEGIN
REQ := [OMEGAPOL,POSPOL,NEGPOL];
                                                      ENV := [OMEGAPOL,POSPOL,NEGPOL];
                                                      SUPERTIEMPO := OMEGATIEMPO;
                                                      CLASS := OMEGATIMEADVCLASS;
                                                      TIEMPO := OMEGATIEMPO;
                                                      ASPECTO := OMEGAASPECTO;
                                                      RETRO := FALSE;
                                                      PERSONA := 3;
                                                      GENERO := MASC;
                                                      ACTSUBCS := [OTHERNOUN];
                                                      TEMPORAL := FALSE;
                                                      ANIMATE := OMEGAANIMATE;
                                                      HUMAN := OMEGAHUMAN;
                                                      ACTCOMAS := [];
                                                      MOOD := DECLXPMOOD;
                                                      NUMERO := SINGULAR;
                                                      DEFINITE := DEF;
                                                      GENERIC := OMEGAGENERIC;
                                                      THETANP := OMEGATHETANP;
                                                      NOUNPATTERNEFS := [];
                                                      POSSPRED := FALSE;
                                                      POSSNIETNP := FALSE;
                                                      SYNTQUANT := OMEGAQUANT;
                                                      NPHEAD := ESENP;
                                                      SPECQ := YESSPEC;
                                                      DEFSPEC := FALSE;
                                                      CASES := [];
                                                      COORD := NOCOORD;
                                                      END
END;

 FUNCTION LSAUXDOM_CpNPONESADMPR
                         (rec:LSDOMAINT_NPRECORD):BOOLEAN;
VAR Bool : BOOLEAN;
BEGIN 
  Bool := FALSE;
  WITH rec DO
  BEGIN
    IF (REQ = [OMEGAPOL,POSPOL,NEGPOL] ) THEN
IF (ENV = [OMEGAPOL,POSPOL,NEGPOL] ) THEN
IF (SUPERTIEMPO = OMEGATIEMPO ) THEN
IF (CLASS = OMEGATIMEADVCLASS ) THEN
IF (TIEMPO = OMEGATIEMPO ) THEN
IF (ASPECTO = OMEGAASPECTO ) THEN
IF (RETRO = FALSE ) THEN
IF (PERSONA = 3 ) THEN
IF (GENERO = FEM ) THEN
IF (ACTSUBCS = [OTHERNOUN] ) THEN
IF (TEMPORAL = FALSE ) THEN
IF (ANIMATE = OMEGAANIMATE ) THEN
IF (HUMAN = OMEGAHUMAN ) THEN
IF (ACTCOMAS = [] ) THEN
IF (MOOD = DECLXPMOOD ) THEN
IF (NUMERO = SINGULAR ) THEN
IF (DEFINITE = DEF ) THEN
IF (GENERIC = OMEGAGENERIC ) THEN
IF (THETANP = OMEGATHETANP ) THEN
IF (NOUNPATTERNEFS = [] ) THEN
IF (POSSPRED = FALSE ) THEN
IF (POSSNIETNP = FALSE ) THEN
IF (SYNTQUANT = OMEGAQUANT ) THEN
IF (NPHEAD = ESENP ) THEN
IF (SPECQ = YESSPEC ) THEN
IF (DEFSPEC = FALSE ) THEN
IF (CASES = [] ) THEN
IF (COORD = NOCOORD ) THEN
      Bool:=TRUE;
  END;{with}
  LSAUXDOM_CpNPONESADMPR:=Bool;
END;{function}
 PROCEDURE LSAUXDOM_AsNPONESADMPR(VAR rec:LSDOMAINT_NPRECORD);
BEGIN
WITH rec DO
BEGIN
REQ := [OMEGAPOL,POSPOL,NEGPOL];
                                                      ENV := [OMEGAPOL,POSPOL,NEGPOL];
                                                      SUPERTIEMPO := OMEGATIEMPO;
                                                      CLASS := OMEGATIMEADVCLASS;
                                                      TIEMPO := OMEGATIEMPO;
                                                      ASPECTO := OMEGAASPECTO;
                                                      RETRO := FALSE;
                                                      PERSONA := 3;
                                                      GENERO := FEM;
                                                      ACTSUBCS := [OTHERNOUN];
                                                      TEMPORAL := FALSE;
                                                      ANIMATE := OMEGAANIMATE;
                                                      HUMAN := OMEGAHUMAN;
                                                      ACTCOMAS := [];
                                                      MOOD := DECLXPMOOD;
                                                      NUMERO := SINGULAR;
                                                      DEFINITE := DEF;
                                                      GENERIC := OMEGAGENERIC;
                                                      THETANP := OMEGATHETANP;
                                                      NOUNPATTERNEFS := [];
                                                      POSSPRED := FALSE;
                                                      POSSNIETNP := FALSE;
                                                      SYNTQUANT := OMEGAQUANT;
                                                      NPHEAD := ESENP;
                                                      SPECQ := YESSPEC;
                                                      DEFSPEC := FALSE;
                                                      CASES := [];
                                                      COORD := NOCOORD;
                                                      END
END;

 FUNCTION LSAUXDOM_CpNPONESOSDMPR
                         (rec:LSDOMAINT_NPRECORD):BOOLEAN;
VAR Bool : BOOLEAN;
BEGIN 
  Bool := FALSE;
  WITH rec DO
  BEGIN
    IF (REQ = [OMEGAPOL,POSPOL,NEGPOL] ) THEN
IF (ENV = [OMEGAPOL,POSPOL,NEGPOL] ) THEN
IF (SUPERTIEMPO = OMEGATIEMPO ) THEN
IF (CLASS = OMEGATIMEADVCLASS ) THEN
IF (TIEMPO = OMEGATIEMPO ) THEN
IF (ASPECTO = OMEGAASPECTO ) THEN
IF (RETRO = FALSE ) THEN
IF (PERSONA = 3 ) THEN
IF (GENERO = MASC ) THEN
IF (ACTSUBCS = [OTHERNOUN] ) THEN
IF (TEMPORAL = FALSE ) THEN
IF (ANIMATE = OMEGAANIMATE ) THEN
IF (HUMAN = OMEGAHUMAN ) THEN
IF (ACTCOMAS = [] ) THEN
IF (MOOD = DECLXPMOOD ) THEN
IF (NUMERO = PLURAL ) THEN
IF (DEFINITE = DEF ) THEN
IF (GENERIC = OMEGAGENERIC ) THEN
IF (THETANP = OMEGATHETANP ) THEN
IF (NOUNPATTERNEFS = [] ) THEN
IF (POSSPRED = FALSE ) THEN
IF (POSSNIETNP = FALSE ) THEN
IF (SYNTQUANT = OMEGAQUANT ) THEN
IF (NPHEAD = ESENP ) THEN
IF (SPECQ = YESSPEC ) THEN
IF (DEFSPEC = FALSE ) THEN
IF (CASES = [] ) THEN
IF (COORD = NOCOORD ) THEN
      Bool:=TRUE;
  END;{with}
  LSAUXDOM_CpNPONESOSDMPR:=Bool;
END;{function}
 PROCEDURE LSAUXDOM_AsNPONESOSDMPR(VAR rec:LSDOMAINT_NPRECORD);
BEGIN
WITH rec DO
BEGIN
REQ := [OMEGAPOL,POSPOL,NEGPOL];
                                                      ENV := [OMEGAPOL,POSPOL,NEGPOL];
                                                      SUPERTIEMPO := OMEGATIEMPO;
                                                      CLASS := OMEGATIMEADVCLASS;
                                                      TIEMPO := OMEGATIEMPO;
                                                      ASPECTO := OMEGAASPECTO;
                                                      RETRO := FALSE;
                                                      PERSONA := 3;
                                                      GENERO := MASC;
                                                      ACTSUBCS := [OTHERNOUN];
                                                      TEMPORAL := FALSE;
                                                      ANIMATE := OMEGAANIMATE;
                                                      HUMAN := OMEGAHUMAN;
                                                      ACTCOMAS := [];
                                                      MOOD := DECLXPMOOD;
                                                      NUMERO := PLURAL;
                                                      DEFINITE := DEF;
                                                      GENERIC := OMEGAGENERIC;
                                                      THETANP := OMEGATHETANP;
                                                      NOUNPATTERNEFS := [];
                                                      POSSPRED := FALSE;
                                                      POSSNIETNP := FALSE;
                                                      SYNTQUANT := OMEGAQUANT;
                                                      NPHEAD := ESENP;
                                                      SPECQ := YESSPEC;
                                                      DEFSPEC := FALSE;
                                                      CASES := [];
                                                      COORD := NOCOORD;
                                                      END
END;

 FUNCTION LSAUXDOM_CpNPONESASDMPR
                         (rec:LSDOMAINT_NPRECORD):BOOLEAN;
VAR Bool : BOOLEAN;
BEGIN 
  Bool := FALSE;
  WITH rec DO
  BEGIN
    IF (REQ = [OMEGAPOL,POSPOL,NEGPOL] ) THEN
IF (ENV = [OMEGAPOL,POSPOL,NEGPOL] ) THEN
IF (SUPERTIEMPO = OMEGATIEMPO ) THEN
IF (CLASS = OMEGATIMEADVCLASS ) THEN
IF (TIEMPO = OMEGATIEMPO ) THEN
IF (ASPECTO = OMEGAASPECTO ) THEN
IF (RETRO = FALSE ) THEN
IF (PERSONA = 3 ) THEN
IF (GENERO = FEM ) THEN
IF (ACTSUBCS = [OTHERNOUN] ) THEN
IF (TEMPORAL = FALSE ) THEN
IF (ANIMATE = OMEGAANIMATE ) THEN
IF (HUMAN = OMEGAHUMAN ) THEN
IF (ACTCOMAS = [] ) THEN
IF (MOOD = DECLXPMOOD ) THEN
IF (NUMERO = PLURAL ) THEN
IF (DEFINITE = DEF ) THEN
IF (GENERIC = OMEGAGENERIC ) THEN
IF (THETANP = OMEGATHETANP ) THEN
IF (NOUNPATTERNEFS = [] ) THEN
IF (POSSPRED = FALSE ) THEN
IF (POSSNIETNP = FALSE ) THEN
IF (SYNTQUANT = OMEGAQUANT ) THEN
IF (NPHEAD = ESENP ) THEN
IF (SPECQ = YESSPEC ) THEN
IF (DEFSPEC = FALSE ) THEN
IF (CASES = [] ) THEN
IF (COORD = NOCOORD ) THEN
      Bool:=TRUE;
  END;{with}
  LSAUXDOM_CpNPONESASDMPR:=Bool;
END;{function}
 PROCEDURE LSAUXDOM_AsNPONESASDMPR(VAR rec:LSDOMAINT_NPRECORD);
BEGIN
WITH rec DO
BEGIN
REQ := [OMEGAPOL,POSPOL,NEGPOL];
                                                      ENV := [OMEGAPOL,POSPOL,NEGPOL];
                                                      SUPERTIEMPO := OMEGATIEMPO;
                                                      CLASS := OMEGATIMEADVCLASS;
                                                      TIEMPO := OMEGATIEMPO;
                                                      ASPECTO := OMEGAASPECTO;
                                                      RETRO := FALSE;
                                                      PERSONA := 3;
                                                      GENERO := FEM;
                                                      ACTSUBCS := [OTHERNOUN];
                                                      TEMPORAL := FALSE;
                                                      ANIMATE := OMEGAANIMATE;
                                                      HUMAN := OMEGAHUMAN;
                                                      ACTCOMAS := [];
                                                      MOOD := DECLXPMOOD;
                                                      NUMERO := PLURAL;
                                                      DEFINITE := DEF;
                                                      GENERIC := OMEGAGENERIC;
                                                      THETANP := OMEGATHETANP;
                                                      NOUNPATTERNEFS := [];
                                                      POSSPRED := FALSE;
                                                      POSSNIETNP := FALSE;
                                                      SYNTQUANT := OMEGAQUANT;
                                                      NPHEAD := ESENP;
                                                      SPECQ := YESSPEC;
                                                      DEFSPEC := FALSE;
                                                      CASES := [];
                                                      COORD := NOCOORD;
                                                      END
END;

 FUNCTION LSAUXDOM_CpNPONAQUELLODMPR
                         (rec:LSDOMAINT_NPRECORD):BOOLEAN;
VAR Bool : BOOLEAN;
BEGIN 
  Bool := FALSE;
  WITH rec DO
  BEGIN
    IF (REQ = [OMEGAPOL,POSPOL,NEGPOL] ) THEN
IF (ENV = [OMEGAPOL,POSPOL,NEGPOL] ) THEN
IF (SUPERTIEMPO = OMEGATIEMPO ) THEN
IF (CLASS = OMEGATIMEADVCLASS ) THEN
IF (TIEMPO = OMEGATIEMPO ) THEN
IF (ASPECTO = OMEGAASPECTO ) THEN
IF (RETRO = FALSE ) THEN
IF (PERSONA = 3 ) THEN
IF (GENERO = NEUTRO ) THEN
IF (ACTSUBCS = [OTHERNOUN] ) THEN
IF (TEMPORAL = FALSE ) THEN
IF (ANIMATE = OMEGAANIMATE ) THEN
IF (HUMAN = OMEGAHUMAN ) THEN
IF (ACTCOMAS = [] ) THEN
IF (MOOD = DECLXPMOOD ) THEN
IF (NUMERO = SINGULAR ) THEN
IF (DEFINITE = DEF ) THEN
IF (GENERIC = OMEGAGENERIC ) THEN
IF (THETANP = OMEGATHETANP ) THEN
IF (NOUNPATTERNEFS = [] ) THEN
IF (POSSPRED = FALSE ) THEN
IF (POSSNIETNP = FALSE ) THEN
IF (SYNTQUANT = OMEGAQUANT ) THEN
IF (NPHEAD = AQUELNP ) THEN
IF (SPECQ = YESSPEC ) THEN
IF (DEFSPEC = FALSE ) THEN
IF (CASES = [] ) THEN
IF (COORD = NOCOORD ) THEN
      Bool:=TRUE;
  END;{with}
  LSAUXDOM_CpNPONAQUELLODMPR:=Bool;
END;{function}
 PROCEDURE LSAUXDOM_AsNPONAQUELLODMPR(VAR rec:LSDOMAINT_NPRECORD);
BEGIN
WITH rec DO
BEGIN
REQ := [OMEGAPOL,POSPOL,NEGPOL];
                                                      ENV := [OMEGAPOL,POSPOL,NEGPOL];
                                                      SUPERTIEMPO := OMEGATIEMPO;
                                                      CLASS := OMEGATIMEADVCLASS;
                                                      TIEMPO := OMEGATIEMPO;
                                                      ASPECTO := OMEGAASPECTO;
                                                      RETRO := FALSE;
                                                      PERSONA := 3;
                                                      GENERO := NEUTRO;
                                                      ACTSUBCS := [OTHERNOUN];
                                                      TEMPORAL := FALSE;
                                                      ANIMATE := OMEGAANIMATE;
                                                      HUMAN := OMEGAHUMAN;
                                                      ACTCOMAS := [];
                                                      MOOD := DECLXPMOOD;
                                                      NUMERO := SINGULAR;
                                                      DEFINITE := DEF;
                                                      GENERIC := OMEGAGENERIC;
                                                      THETANP := OMEGATHETANP;
                                                      NOUNPATTERNEFS := [];
                                                      POSSPRED := FALSE;
                                                      POSSNIETNP := FALSE;
                                                      SYNTQUANT := OMEGAQUANT;
                                                      NPHEAD := AQUELNP;
                                                      SPECQ := YESSPEC;
                                                      DEFSPEC := FALSE;
                                                      CASES := [];
                                                      COORD := NOCOORD;
                                                      END
END;

 FUNCTION LSAUXDOM_CpNPONAQUELDMPR
                         (rec:LSDOMAINT_NPRECORD):BOOLEAN;
VAR Bool : BOOLEAN;
BEGIN 
  Bool := FALSE;
  WITH rec DO
  BEGIN
    IF (REQ = [OMEGAPOL,POSPOL,NEGPOL] ) THEN
IF (ENV = [OMEGAPOL,POSPOL,NEGPOL] ) THEN
IF (SUPERTIEMPO = OMEGATIEMPO ) THEN
IF (CLASS = OMEGATIMEADVCLASS ) THEN
IF (TIEMPO = OMEGATIEMPO ) THEN
IF (ASPECTO = OMEGAASPECTO ) THEN
IF (RETRO = FALSE ) THEN
IF (PERSONA = 3 ) THEN
IF (GENERO = MASC ) THEN
IF (ACTSUBCS = [OTHERNOUN] ) THEN
IF (TEMPORAL = FALSE ) THEN
IF (ANIMATE = OMEGAANIMATE ) THEN
IF (HUMAN = OMEGAHUMAN ) THEN
IF (ACTCOMAS = [] ) THEN
IF (MOOD = DECLXPMOOD ) THEN
IF (NUMERO = SINGULAR ) THEN
IF (DEFINITE = DEF ) THEN
IF (GENERIC = OMEGAGENERIC ) THEN
IF (THETANP = OMEGATHETANP ) THEN
IF (NOUNPATTERNEFS = [] ) THEN
IF (POSSPRED = FALSE ) THEN
IF (POSSNIETNP = FALSE ) THEN
IF (SYNTQUANT = OMEGAQUANT ) THEN
IF (NPHEAD = AQUELNP ) THEN
IF (SPECQ = YESSPEC ) THEN
IF (DEFSPEC = FALSE ) THEN
IF (CASES = [] ) THEN
IF (COORD = NOCOORD ) THEN
      Bool:=TRUE;
  END;{with}
  LSAUXDOM_CpNPONAQUELDMPR:=Bool;
END;{function}
 PROCEDURE LSAUXDOM_AsNPONAQUELDMPR(VAR rec:LSDOMAINT_NPRECORD);
BEGIN
WITH rec DO
BEGIN
REQ := [OMEGAPOL,POSPOL,NEGPOL];
                                                      ENV := [OMEGAPOL,POSPOL,NEGPOL];
                                                      SUPERTIEMPO := OMEGATIEMPO;
                                                      CLASS := OMEGATIMEADVCLASS;
                                                      TIEMPO := OMEGATIEMPO;
                                                      ASPECTO := OMEGAASPECTO;
                                                      RETRO := FALSE;
                                                      PERSONA := 3;
                                                      GENERO := MASC;
                                                      ACTSUBCS := [OTHERNOUN];
                                                      TEMPORAL := FALSE;
                                                      ANIMATE := OMEGAANIMATE;
                                                      HUMAN := OMEGAHUMAN;
                                                      ACTCOMAS := [];
                                                      MOOD := DECLXPMOOD;
                                                      NUMERO := SINGULAR;
                                                      DEFINITE := DEF;
                                                      GENERIC := OMEGAGENERIC;
                                                      THETANP := OMEGATHETANP;
                                                      NOUNPATTERNEFS := [];
                                                      POSSPRED := FALSE;
                                                      POSSNIETNP := FALSE;
                                                      SYNTQUANT := OMEGAQUANT;
                                                      NPHEAD := AQUELNP;
                                                      SPECQ := YESSPEC;
                                                      DEFSPEC := FALSE;
                                                      CASES := [];
                                                      COORD := NOCOORD;
                                                      END
END;

 FUNCTION LSAUXDOM_CpNPONAQUELLADMPR
                         (rec:LSDOMAINT_NPRECORD):BOOLEAN;
VAR Bool : BOOLEAN;
BEGIN 
  Bool := FALSE;
  WITH rec DO
  BEGIN
    IF (REQ = [OMEGAPOL,POSPOL,NEGPOL] ) THEN
IF (ENV = [OMEGAPOL,POSPOL,NEGPOL] ) THEN
IF (SUPERTIEMPO = OMEGATIEMPO ) THEN
IF (CLASS = OMEGATIMEADVCLASS ) THEN
IF (TIEMPO = OMEGATIEMPO ) THEN
IF (ASPECTO = OMEGAASPECTO ) THEN
IF (RETRO = FALSE ) THEN
IF (PERSONA = 3 ) THEN
IF (GENERO = FEM ) THEN
IF (ACTSUBCS = [OTHERNOUN] ) THEN
IF (TEMPORAL = FALSE ) THEN
IF (ANIMATE = OMEGAANIMATE ) THEN
IF (HUMAN = OMEGAHUMAN ) THEN
IF (ACTCOMAS = [] ) THEN
IF (MOOD = DECLXPMOOD ) THEN
IF (NUMERO = SINGULAR ) THEN
IF (DEFINITE = DEF ) THEN
IF (GENERIC = OMEGAGENERIC ) THEN
IF (THETANP = OMEGATHETANP ) THEN
IF (NOUNPATTERNEFS = [] ) THEN
IF (POSSPRED = FALSE ) THEN
IF (POSSNIETNP = FALSE ) THEN
IF (SYNTQUANT = OMEGAQUANT ) THEN
IF (NPHEAD = AQUELNP ) THEN
IF (SPECQ = YESSPEC ) THEN
IF (DEFSPEC = FALSE ) THEN
IF (CASES = [] ) THEN
IF (COORD = NOCOORD ) THEN
      Bool:=TRUE;
  END;{with}
  LSAUXDOM_CpNPONAQUELLADMPR:=Bool;
END;{function}
 PROCEDURE LSAUXDOM_AsNPONAQUELLADMPR(VAR rec:LSDOMAINT_NPRECORD);
BEGIN
WITH rec DO
BEGIN
REQ := [OMEGAPOL,POSPOL,NEGPOL];
                                                      ENV := [OMEGAPOL,POSPOL,NEGPOL];
                                                      SUPERTIEMPO := OMEGATIEMPO;
                                                      CLASS := OMEGATIMEADVCLASS;
                                                      TIEMPO := OMEGATIEMPO;
                                                      ASPECTO := OMEGAASPECTO;
                                                      RETRO := FALSE;
                                                      PERSONA := 3;
                                                      GENERO := FEM;
                                                      ACTSUBCS := [OTHERNOUN];
                                                      TEMPORAL := FALSE;
                                                      ANIMATE := OMEGAANIMATE;
                                                      HUMAN := OMEGAHUMAN;
                                                      ACTCOMAS := [];
                                                      MOOD := DECLXPMOOD;
                                                      NUMERO := SINGULAR;
                                                      DEFINITE := DEF;
                                                      GENERIC := OMEGAGENERIC;
                                                      THETANP := OMEGATHETANP;
                                                      NOUNPATTERNEFS := [];
                                                      POSSPRED := FALSE;
                                                      POSSNIETNP := FALSE;
                                                      SYNTQUANT := OMEGAQUANT;
                                                      NPHEAD := AQUELNP;
                                                      SPECQ := YESSPEC;
                                                      DEFSPEC := FALSE;
                                                      CASES := [];
                                                      COORD := NOCOORD;
                                                      END
END;

 FUNCTION LSAUXDOM_CpNPONAQUELLOSDMPR
                         (rec:LSDOMAINT_NPRECORD):BOOLEAN;
VAR Bool : BOOLEAN;
BEGIN 
  Bool := FALSE;
  WITH rec DO
  BEGIN
    IF (REQ = [OMEGAPOL,POSPOL,NEGPOL] ) THEN
IF (ENV = [OMEGAPOL,POSPOL,NEGPOL] ) THEN
IF (SUPERTIEMPO = OMEGATIEMPO ) THEN
IF (CLASS = OMEGATIMEADVCLASS ) THEN
IF (TIEMPO = OMEGATIEMPO ) THEN
IF (ASPECTO = OMEGAASPECTO ) THEN
IF (RETRO = FALSE ) THEN
IF (PERSONA = 3 ) THEN
IF (GENERO = MASC ) THEN
IF (ACTSUBCS = [OTHERNOUN] ) THEN
IF (TEMPORAL = FALSE ) THEN
IF (ANIMATE = OMEGAANIMATE ) THEN
IF (HUMAN = OMEGAHUMAN ) THEN
IF (ACTCOMAS = [] ) THEN
IF (MOOD = DECLXPMOOD ) THEN
IF (NUMERO = PLURAL ) THEN
IF (DEFINITE = DEF ) THEN
IF (GENERIC = OMEGAGENERIC ) THEN
IF (THETANP = OMEGATHETANP ) THEN
IF (NOUNPATTERNEFS = [] ) THEN
IF (POSSPRED = FALSE ) THEN
IF (POSSNIETNP = FALSE ) THEN
IF (SYNTQUANT = OMEGAQUANT ) THEN
IF (NPHEAD = AQUELNP ) THEN
IF (SPECQ = YESSPEC ) THEN
IF (DEFSPEC = FALSE ) THEN
IF (CASES = [] ) THEN
IF (COORD = NOCOORD ) THEN
      Bool:=TRUE;
  END;{with}
  LSAUXDOM_CpNPONAQUELLOSDMPR:=Bool;
END;{function}
 PROCEDURE LSAUXDOM_AsNPONAQUELLOSDMPR(VAR rec:LSDOMAINT_NPRECORD);
BEGIN
WITH rec DO
BEGIN
REQ := [OMEGAPOL,POSPOL,NEGPOL];
                                                      ENV := [OMEGAPOL,POSPOL,NEGPOL];
                                                      SUPERTIEMPO := OMEGATIEMPO;
                                                      CLASS := OMEGATIMEADVCLASS;
                                                      TIEMPO := OMEGATIEMPO;
                                                      ASPECTO := OMEGAASPECTO;
                                                      RETRO := FALSE;
                                                      PERSONA := 3;
                                                      GENERO := MASC;
                                                      ACTSUBCS := [OTHERNOUN];
                                                      TEMPORAL := FALSE;
                                                      ANIMATE := OMEGAANIMATE;
                                                      HUMAN := OMEGAHUMAN;
                                                      ACTCOMAS := [];
                                                      MOOD := DECLXPMOOD;
                                                      NUMERO := PLURAL;
                                                      DEFINITE := DEF;
                                                      GENERIC := OMEGAGENERIC;
                                                      THETANP := OMEGATHETANP;
                                                      NOUNPATTERNEFS := [];
                                                      POSSPRED := FALSE;
                                                      POSSNIETNP := FALSE;
                                                      SYNTQUANT := OMEGAQUANT;
                                                      NPHEAD := AQUELNP;
                                                      SPECQ := YESSPEC;
                                                      DEFSPEC := FALSE;
                                                      CASES := [];
                                                      COORD := NOCOORD;
                                                      END
END;

 FUNCTION LSAUXDOM_CpNPONAQUELLASDMPR
                         (rec:LSDOMAINT_NPRECORD):BOOLEAN;
VAR Bool : BOOLEAN;
BEGIN 
  Bool := FALSE;
  WITH rec DO
  BEGIN
    IF (REQ = [OMEGAPOL,POSPOL,NEGPOL] ) THEN
IF (ENV = [OMEGAPOL,POSPOL,NEGPOL] ) THEN
IF (SUPERTIEMPO = OMEGATIEMPO ) THEN
IF (CLASS = OMEGATIMEADVCLASS ) THEN
IF (TIEMPO = OMEGATIEMPO ) THEN
IF (ASPECTO = OMEGAASPECTO ) THEN
IF (RETRO = FALSE ) THEN
IF (PERSONA = 3 ) THEN
IF (GENERO = FEM ) THEN
IF (ACTSUBCS = [OTHERNOUN] ) THEN
IF (TEMPORAL = FALSE ) THEN
IF (ANIMATE = OMEGAANIMATE ) THEN
IF (HUMAN = OMEGAHUMAN ) THEN
IF (ACTCOMAS = [] ) THEN
IF (MOOD = DECLXPMOOD ) THEN
IF (NUMERO = PLURAL ) THEN
IF (DEFINITE = DEF ) THEN
IF (GENERIC = OMEGAGENERIC ) THEN
IF (THETANP = OMEGATHETANP ) THEN
IF (NOUNPATTERNEFS = [] ) THEN
IF (POSSPRED = FALSE ) THEN
IF (POSSNIETNP = FALSE ) THEN
IF (SYNTQUANT = OMEGAQUANT ) THEN
IF (NPHEAD = AQUELNP ) THEN
IF (SPECQ = YESSPEC ) THEN
IF (DEFSPEC = FALSE ) THEN
IF (CASES = [] ) THEN
IF (COORD = NOCOORD ) THEN
      Bool:=TRUE;
  END;{with}
  LSAUXDOM_CpNPONAQUELLASDMPR:=Bool;
END;{function}
 PROCEDURE LSAUXDOM_AsNPONAQUELLASDMPR(VAR rec:LSDOMAINT_NPRECORD);
BEGIN
WITH rec DO
BEGIN
REQ := [OMEGAPOL,POSPOL,NEGPOL];
                                                      ENV := [OMEGAPOL,POSPOL,NEGPOL];
                                                      SUPERTIEMPO := OMEGATIEMPO;
                                                      CLASS := OMEGATIMEADVCLASS;
                                                      TIEMPO := OMEGATIEMPO;
                                                      ASPECTO := OMEGAASPECTO;
                                                      RETRO := FALSE;
                                                      PERSONA := 3;
                                                      GENERO := FEM;
                                                      ACTSUBCS := [OTHERNOUN];
                                                      TEMPORAL := FALSE;
                                                      ANIMATE := OMEGAANIMATE;
                                                      HUMAN := OMEGAHUMAN;
                                                      ACTCOMAS := [];
                                                      MOOD := DECLXPMOOD;
                                                      NUMERO := PLURAL;
                                                      DEFINITE := DEF;
                                                      GENERIC := OMEGAGENERIC;
                                                      THETANP := OMEGATHETANP;
                                                      NOUNPATTERNEFS := [];
                                                      POSSPRED := FALSE;
                                                      POSSNIETNP := FALSE;
                                                      SYNTQUANT := OMEGAQUANT;
                                                      NPHEAD := AQUELNP;
                                                      SPECQ := YESSPEC;
                                                      DEFSPEC := FALSE;
                                                      CASES := [];
                                                      COORD := NOCOORD;
                                                      END
END;

 FUNCTION LSAUXDOM_CpCNONNOHEAD
                         (rec:LSDOMAINT_CNRECORD):BOOLEAN;
VAR Bool : BOOLEAN;
BEGIN 
  Bool := FALSE;
  WITH rec DO
  BEGIN
    IF (REQ = [POSPOL,NEGPOL,OMEGAPOL] ) THEN
IF (ENV = [POSPOL,NEGPOL,OMEGAPOL] ) THEN
IF (SUPERTIEMPO = OMEGATIEMPO ) THEN
IF (CLASS = OMEGATIMEADVCLASS ) THEN
IF (TIEMPO = OMEGATIEMPO ) THEN
IF (ASPECTO = OMEGAASPECTO ) THEN
IF (RETRO = FALSE ) THEN
IF (DEFINITE = OMEGADEF ) THEN
IF (NUMERO = OMEGANUMERO ) THEN
IF (GENEROS = [OMEGAGENERO] ) THEN
IF (ACTSUBCS = [OTHERNOUN] ) THEN
IF (TEMPORAL = FALSE ) THEN
IF (ANIMATE = OMEGAANIMATE ) THEN
IF (HUMAN = OMEGAHUMAN ) THEN
IF (POSSCOMAS = [COUNT] ) THEN
IF (THETANP = OMEGATHETANP ) THEN
IF (NOUNPATTERNEFS = [] ) THEN
IF (CASES = [] ) THEN
      Bool:=TRUE;
  END;{with}
  LSAUXDOM_CpCNONNOHEAD:=Bool;
END;{function}
 PROCEDURE LSAUXDOM_AsCNONNOHEAD(VAR rec:LSDOMAINT_CNRECORD);
BEGIN
WITH rec DO
BEGIN
REQ := [POSPOL,NEGPOL,OMEGAPOL];
                                                      ENV := [POSPOL,NEGPOL,OMEGAPOL];
                                                      SUPERTIEMPO := OMEGATIEMPO;
                                                      CLASS := OMEGATIMEADVCLASS;
                                                      TIEMPO := OMEGATIEMPO;
                                                      ASPECTO := OMEGAASPECTO;
                                                      RETRO := FALSE;
                                                      DEFINITE := OMEGADEF;
                                                      NUMERO := OMEGANUMERO;
                                                      GENEROS := [OMEGAGENERO];
                                                      ACTSUBCS := [OTHERNOUN];
                                                      TEMPORAL := FALSE;
                                                      ANIMATE := OMEGAANIMATE;
                                                      HUMAN := OMEGAHUMAN;
                                                      POSSCOMAS := [COUNT];
                                                      THETANP := OMEGATHETANP;
                                                      NOUNPATTERNEFS := [];
                                                      CASES := [];
                                                      END
END;

 FUNCTION LSAUXDOM_CpDETPONELART
                         (rec:LSDOMAINT_DETPRECORD):BOOLEAN;
VAR Bool : BOOLEAN;
BEGIN 
  Bool := FALSE;
  WITH rec DO
  BEGIN
    IF (REQ = [POSPOL,NEGPOL,OMEGAPOL] ) THEN
IF (ENV = [POSPOL,NEGPOL,OMEGAPOL] ) THEN
IF (NUMERO = SINGULAR ) THEN
IF (GENERO = MASC ) THEN
IF (DEFINITE = DEF ) THEN
IF (POSSPRED = TRUE ) THEN
IF (POSSCOMAS = [COUNT,MASS] ) THEN
IF (MOOD = DECLXPMOOD ) THEN
IF (SYNTQUANT = OMEGAQUANT ) THEN
IF (SUPERTIEMPO = OMEGATIEMPO ) THEN
      Bool:=TRUE;
  END;{with}
  LSAUXDOM_CpDETPONELART:=Bool;
END;{function}
 PROCEDURE LSAUXDOM_AsDETPONELART(VAR rec:LSDOMAINT_DETPRECORD);
BEGIN
WITH rec DO
BEGIN
REQ := [POSPOL,NEGPOL,OMEGAPOL];
                                                      ENV := [POSPOL,NEGPOL,OMEGAPOL];
                                                      NUMERO := SINGULAR;
                                                      GENERO := MASC;
                                                      DEFINITE := DEF;
                                                      POSSPRED := TRUE;
                                                      POSSCOMAS := [COUNT,MASS];
                                                      MOOD := DECLXPMOOD;
                                                      SYNTQUANT := OMEGAQUANT;
                                                      SUPERTIEMPO := OMEGATIEMPO;
                                                      END
END;

 FUNCTION LSAUXDOM_CpDETPONLOSART
                         (rec:LSDOMAINT_DETPRECORD):BOOLEAN;
VAR Bool : BOOLEAN;
BEGIN 
  Bool := FALSE;
  WITH rec DO
  BEGIN
    IF (REQ = [POSPOL,NEGPOL,OMEGAPOL] ) THEN
IF (ENV = [POSPOL,NEGPOL,OMEGAPOL] ) THEN
IF (NUMERO = PLURAL ) THEN
IF (GENERO = MASC ) THEN
IF (DEFINITE = DEF ) THEN
IF (POSSPRED = TRUE ) THEN
IF (POSSCOMAS = [COUNT] ) THEN
IF (MOOD = DECLXPMOOD ) THEN
IF (SYNTQUANT = OMEGAQUANT ) THEN
IF (SUPERTIEMPO = OMEGATIEMPO ) THEN
      Bool:=TRUE;
  END;{with}
  LSAUXDOM_CpDETPONLOSART:=Bool;
END;{function}
 PROCEDURE LSAUXDOM_AsDETPONLOSART(VAR rec:LSDOMAINT_DETPRECORD);
BEGIN
WITH rec DO
BEGIN
REQ := [POSPOL,NEGPOL,OMEGAPOL];
                                                      ENV := [POSPOL,NEGPOL,OMEGAPOL];
                                                      NUMERO := PLURAL;
                                                      GENERO := MASC;
                                                      DEFINITE := DEF;
                                                      POSSPRED := TRUE;
                                                      POSSCOMAS := [COUNT];
                                                      MOOD := DECLXPMOOD;
                                                      SYNTQUANT := OMEGAQUANT;
                                                      SUPERTIEMPO := OMEGATIEMPO;
                                                      END
END;

 FUNCTION LSAUXDOM_CpDETPONLAART
                         (rec:LSDOMAINT_DETPRECORD):BOOLEAN;
VAR Bool : BOOLEAN;
BEGIN 
  Bool := FALSE;
  WITH rec DO
  BEGIN
    IF (REQ = [POSPOL,NEGPOL,OMEGAPOL] ) THEN
IF (ENV = [POSPOL,NEGPOL,OMEGAPOL] ) THEN
IF (NUMERO = SINGULAR ) THEN
IF (GENERO = FEM ) THEN
IF (DEFINITE = DEF ) THEN
IF (POSSPRED = TRUE ) THEN
IF (POSSCOMAS = [COUNT,MASS] ) THEN
IF (MOOD = DECLXPMOOD ) THEN
IF (SYNTQUANT = OMEGAQUANT ) THEN
IF (SUPERTIEMPO = OMEGATIEMPO ) THEN
      Bool:=TRUE;
  END;{with}
  LSAUXDOM_CpDETPONLAART:=Bool;
END;{function}
 PROCEDURE LSAUXDOM_AsDETPONLAART(VAR rec:LSDOMAINT_DETPRECORD);
BEGIN
WITH rec DO
BEGIN
REQ := [POSPOL,NEGPOL,OMEGAPOL];
                                                      ENV := [POSPOL,NEGPOL,OMEGAPOL];
                                                      NUMERO := SINGULAR;
                                                      GENERO := FEM;
                                                      DEFINITE := DEF;
                                                      POSSPRED := TRUE;
                                                      POSSCOMAS := [COUNT,MASS];
                                                      MOOD := DECLXPMOOD;
                                                      SYNTQUANT := OMEGAQUANT;
                                                      SUPERTIEMPO := OMEGATIEMPO;
                                                      END
END;

 FUNCTION LSAUXDOM_CpDETPONLASART
                         (rec:LSDOMAINT_DETPRECORD):BOOLEAN;
VAR Bool : BOOLEAN;
BEGIN 
  Bool := FALSE;
  WITH rec DO
  BEGIN
    IF (REQ = [POSPOL,NEGPOL,OMEGAPOL] ) THEN
IF (ENV = [POSPOL,NEGPOL,OMEGAPOL] ) THEN
IF (NUMERO = PLURAL ) THEN
IF (GENERO = FEM ) THEN
IF (DEFINITE = DEF ) THEN
IF (POSSPRED = TRUE ) THEN
IF (POSSCOMAS = [COUNT] ) THEN
IF (MOOD = DECLXPMOOD ) THEN
IF (SYNTQUANT = OMEGAQUANT ) THEN
IF (SUPERTIEMPO = OMEGATIEMPO ) THEN
      Bool:=TRUE;
  END;{with}
  LSAUXDOM_CpDETPONLASART:=Bool;
END;{function}
 PROCEDURE LSAUXDOM_AsDETPONLASART(VAR rec:LSDOMAINT_DETPRECORD);
BEGIN
WITH rec DO
BEGIN
REQ := [POSPOL,NEGPOL,OMEGAPOL];
                                                      ENV := [POSPOL,NEGPOL,OMEGAPOL];
                                                      NUMERO := PLURAL;
                                                      GENERO := FEM;
                                                      DEFINITE := DEF;
                                                      POSSPRED := TRUE;
                                                      POSSCOMAS := [COUNT];
                                                      MOOD := DECLXPMOOD;
                                                      SYNTQUANT := OMEGAQUANT;
                                                      SUPERTIEMPO := OMEGATIEMPO;
                                                      END
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
IF (SUBCS = [TEMPADV] ) THEN
IF (QSTATUS = FALSE ) THEN
IF (CLASS = REFERENCE ) THEN
IF (TIEMPO = PRESENTE ) THEN
IF (ASPECTO = PERFECTIVO ) THEN
IF (RETRO = FALSE ) THEN
IF (MOOD = DECLXPMOOD ) THEN
IF (THETAADV = THETAADV100 ) THEN
IF (ADVPATTERNS = [SYNNOVPARGS] ) THEN
IF (PREPKEY = 0 ) THEN
IF (TEMPORAL = TRUE ) THEN
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
                                                      SUBCS := [TEMPADV];
                                                      QSTATUS := FALSE;
                                                      CLASS := REFERENCE;
                                                      TIEMPO := PRESENTE;
                                                      ASPECTO := PERFECTIVO;
                                                      RETRO := FALSE;
                                                      MOOD := DECLXPMOOD;
                                                      THETAADV := THETAADV100;
                                                      ADVPATTERNS := [SYNNOVPARGS];
                                                      PREPKEY := 0;
                                                      TEMPORAL := TRUE;
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
IF (SUBCS = [TEMPADV] ) THEN
IF (QSTATUS = FALSE ) THEN
IF (CLASS = REFERENCE ) THEN
IF (TIEMPO = PASADO ) THEN
IF (ASPECTO = PERFECTIVO ) THEN
IF (RETRO = FALSE ) THEN
IF (MOOD = DECLXPMOOD ) THEN
IF (THETAADV = THETAADV100 ) THEN
IF (ADVPATTERNS = [SYNNOVPARGS] ) THEN
IF (PREPKEY = 0 ) THEN
IF (TEMPORAL = TRUE ) THEN
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
                                                      SUBCS := [TEMPADV];
                                                      QSTATUS := FALSE;
                                                      CLASS := REFERENCE;
                                                      TIEMPO := PASADO;
                                                      ASPECTO := PERFECTIVO;
                                                      RETRO := FALSE;
                                                      MOOD := DECLXPMOOD;
                                                      THETAADV := THETAADV100;
                                                      ADVPATTERNS := [SYNNOVPARGS];
                                                      PREPKEY := 0;
                                                      TEMPORAL := TRUE;
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
IF (SUBCS = [TEMPADV] ) THEN
IF (QSTATUS = FALSE ) THEN
IF (CLASS = REFERENCE ) THEN
IF (TIEMPO = OMEGATIEMPO ) THEN
IF (ASPECTO = IMPERFECTIVO ) THEN
IF (RETRO = TRUE ) THEN
IF (MOOD = DECLXPMOOD ) THEN
IF (THETAADV = THETAADV100 ) THEN
IF (ADVPATTERNS = [SYNNOVPARGS] ) THEN
IF (PREPKEY = 0 ) THEN
IF (TEMPORAL = TRUE ) THEN
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
                                                      SUBCS := [TEMPADV];
                                                      QSTATUS := FALSE;
                                                      CLASS := REFERENCE;
                                                      TIEMPO := OMEGATIEMPO;
                                                      ASPECTO := IMPERFECTIVO;
                                                      RETRO := TRUE;
                                                      MOOD := DECLXPMOOD;
                                                      THETAADV := THETAADV100;
                                                      ADVPATTERNS := [SYNNOVPARGS];
                                                      PREPKEY := 0;
                                                      TEMPORAL := TRUE;
                                                      THANAS := OMEGACOMPL;
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
IF (QSTATUS = FALSE ) THEN
IF (CLASS = REFERENCE ) THEN
IF (TIEMPO = PRESENTE ) THEN
IF (ASPECTO = PERFECTIVO ) THEN
IF (RETRO = FALSE ) THEN
IF (SUPERTIEMPO = OMEGATIEMPO ) THEN
IF (ACTSUBCEFS = [TEMPADV] ) THEN
IF (MOOD = DECLXPMOOD ) THEN
IF (THETAADV = THETAADV100 ) THEN
IF (ADVPATTERNEFS = [SYNNOVPARGS] ) THEN
IF (TEMPORAL = TRUE ) THEN
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
                                                      QSTATUS := FALSE;
                                                      CLASS := REFERENCE;
                                                      TIEMPO := PRESENTE;
                                                      ASPECTO := PERFECTIVO;
                                                      RETRO := FALSE;
                                                      SUPERTIEMPO := OMEGATIEMPO;
                                                      ACTSUBCEFS := [TEMPADV];
                                                      MOOD := DECLXPMOOD;
                                                      THETAADV := THETAADV100;
                                                      ADVPATTERNEFS := [SYNNOVPARGS];
                                                      TEMPORAL := TRUE;
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
IF (QSTATUS = FALSE ) THEN
IF (CLASS = REFERENCE ) THEN
IF (TIEMPO = PASADO ) THEN
IF (ASPECTO = PERFECTIVO ) THEN
IF (RETRO = FALSE ) THEN
IF (SUPERTIEMPO = OMEGATIEMPO ) THEN
IF (ACTSUBCEFS = [TEMPADV] ) THEN
IF (MOOD = DECLXPMOOD ) THEN
IF (THETAADV = THETAADV100 ) THEN
IF (ADVPATTERNEFS = [SYNNOVPARGS] ) THEN
IF (TEMPORAL = TRUE ) THEN
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
                                                      QSTATUS := FALSE;
                                                      CLASS := REFERENCE;
                                                      TIEMPO := PASADO;
                                                      ASPECTO := PERFECTIVO;
                                                      RETRO := FALSE;
                                                      SUPERTIEMPO := OMEGATIEMPO;
                                                      ACTSUBCEFS := [TEMPADV];
                                                      MOOD := DECLXPMOOD;
                                                      THETAADV := THETAADV100;
                                                      ADVPATTERNEFS := [SYNNOVPARGS];
                                                      TEMPORAL := TRUE;
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
IF (QSTATUS = FALSE ) THEN
IF (CLASS = REFERENCE ) THEN
IF (TIEMPO = OMEGATIEMPO ) THEN
IF (ASPECTO = IMPERFECTIVO ) THEN
IF (RETRO = TRUE ) THEN
IF (SUPERTIEMPO = OMEGATIEMPO ) THEN
IF (ACTSUBCEFS = [TEMPADV] ) THEN
IF (MOOD = DECLXPMOOD ) THEN
IF (THETAADV = THETAADV100 ) THEN
IF (ADVPATTERNEFS = [SYNNOVPARGS] ) THEN
IF (TEMPORAL = TRUE ) THEN
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
                                                      QSTATUS := FALSE;
                                                      CLASS := REFERENCE;
                                                      TIEMPO := OMEGATIEMPO;
                                                      ASPECTO := IMPERFECTIVO;
                                                      RETRO := TRUE;
                                                      SUPERTIEMPO := OMEGATIEMPO;
                                                      ACTSUBCEFS := [TEMPADV];
                                                      MOOD := DECLXPMOOD;
                                                      THETAADV := THETAADV100;
                                                      ADVPATTERNEFS := [SYNNOVPARGS];
                                                      TEMPORAL := TRUE;
                                                      THANAS := OMEGACOMPL;
                                                      THANASCOMPL := FALSE;
                                                      COORD := NOCOORD;
                                                      END
END;

 FUNCTION LSAUXDOM_CpSUBADJONMISMO
                         (rec:LSDOMAINT_SUBADJRECORD):BOOLEAN;
VAR Bool : BOOLEAN;
BEGIN 
  Bool := FALSE;
  WITH rec DO
  BEGIN
    IF (REQ = [POSPOL,NEGPOL,OMEGAPOL] ) THEN
IF (ENV = [POSPOL,NEGPOL,OMEGAPOL] ) THEN
IF (CLASS = OMEGATIMEADVCLASS ) THEN
IF (TIEMPO = OMEGATIEMPO ) THEN
IF (ASPECTO = OMEGAASPECTO ) THEN
IF (RETRO = FALSE ) THEN
IF (PLURALFORMA = REG ) THEN
IF (FEMFORMA = NORMAL ) THEN
IF (POSSAPOCOPE = NO ) THEN
IF (POSICION = POSTPOSICION ) THEN
IF (USES = [ATTRIBUTIVE] ) THEN
IF (TEMPORAL = FALSE ) THEN
IF (SUBCS = [OTHERADJ] ) THEN
IF (REFLEXIVITY = NOTREFLEXIVE ) THEN
IF (THETAADJ = ADJP100 ) THEN
IF (ADJPATTERNS = [SYNNOADJPARGS] ) THEN
IF (PREPKEY = 0 ) THEN
IF (POSSADV = FALSE ) THEN
IF (ARTINDEF = SI ) THEN
IF (COPULAS = [] ) THEN
      Bool:=TRUE;
  END;{with}
  LSAUXDOM_CpSUBADJONMISMO:=Bool;
END;{function}
 PROCEDURE LSAUXDOM_AsSUBADJONMISMO(VAR rec:LSDOMAINT_SUBADJRECORD);
BEGIN
WITH rec DO
BEGIN
REQ := [POSPOL,NEGPOL,OMEGAPOL];
                                                      ENV := [POSPOL,NEGPOL,OMEGAPOL];
                                                      CLASS := OMEGATIMEADVCLASS;
                                                      TIEMPO := OMEGATIEMPO;
                                                      ASPECTO := OMEGAASPECTO;
                                                      RETRO := FALSE;
                                                      PLURALFORMA := REG;
                                                      FEMFORMA := NORMAL;
                                                      POSSAPOCOPE := NO;
                                                      POSICION := POSTPOSICION;
                                                      USES := [ATTRIBUTIVE];
                                                      TEMPORAL := FALSE;
                                                      SUBCS := [OTHERADJ];
                                                      REFLEXIVITY := NOTREFLEXIVE;
                                                      THETAADJ := ADJP100;
                                                      ADJPATTERNS := [SYNNOADJPARGS];
                                                      PREPKEY := 0;
                                                      POSSADV := FALSE;
                                                      ARTINDEF := SI;
                                                      COPULAS := [];
                                                      END
END;

 FUNCTION LSAUXDOM_CpADJONMISMO
                         (rec:LSDOMAINT_ADJRECORD):BOOLEAN;
VAR Bool : BOOLEAN;
BEGIN 
  Bool := FALSE;
  WITH rec DO
  BEGIN
    IF (REQ = [POSPOL,NEGPOL,OMEGAPOL] ) THEN
IF (ENV = [POSPOL,NEGPOL,OMEGAPOL] ) THEN
IF (ADJADVFORM = POSITIVE ) THEN
IF (PLURALFORMA = REG ) THEN
IF (FEMFORMA = NORMAL ) THEN
IF (IRRCOMP = NO ) THEN
IF (GENERO = OMEGAGENERO ) THEN
IF (NUMERO = OMEGANUMERO ) THEN
IF (POSSAPOCOPE = NO ) THEN
IF (APOCOPE = FALSE ) THEN
IF (POSICION = POSTPOSICION ) THEN
IF (CLASS = OMEGATIMEADVCLASS ) THEN
IF (TIEMPO = OMEGATIEMPO ) THEN
IF (ASPECTO = OMEGAASPECTO ) THEN
IF (RETRO = FALSE ) THEN
IF (USES = [ATTRIBUTIVE,PREDICATIVE] ) THEN
IF (TEMPORAL = FALSE ) THEN
IF (SUBCS = [OTHERADJ] ) THEN
IF (THETAADJ = ADJP100 ) THEN
IF (ADJPATTERNS = [SYNNOADJPARGS] ) THEN
IF (PREPKEY = 0 ) THEN
IF (REFLEXIVITY = NOTREFLEXIVE ) THEN
IF (POSSADV = TRUE ) THEN
IF (ARTINDEF = SI ) THEN
IF (COPULAS = [] ) THEN
      Bool:=TRUE;
  END;{with}
  LSAUXDOM_CpADJONMISMO:=Bool;
END;{function}
 PROCEDURE LSAUXDOM_AsADJONMISMO(VAR rec:LSDOMAINT_ADJRECORD);
BEGIN
WITH rec DO
BEGIN
REQ := [POSPOL,NEGPOL,OMEGAPOL];
                                                      ENV := [POSPOL,NEGPOL,OMEGAPOL];
                                                      ADJADVFORM := POSITIVE;
                                                      PLURALFORMA := REG;
                                                      FEMFORMA := NORMAL;
                                                      IRRCOMP := NO;
                                                      GENERO := OMEGAGENERO;
                                                      NUMERO := OMEGANUMERO;
                                                      POSSAPOCOPE := NO;
                                                      APOCOPE := FALSE;
                                                      POSICION := POSTPOSICION;
                                                      CLASS := OMEGATIMEADVCLASS;
                                                      TIEMPO := OMEGATIEMPO;
                                                      ASPECTO := OMEGAASPECTO;
                                                      RETRO := FALSE;
                                                      USES := [ATTRIBUTIVE,PREDICATIVE];
                                                      TEMPORAL := FALSE;
                                                      SUBCS := [OTHERADJ];
                                                      THETAADJ := ADJP100;
                                                      ADJPATTERNS := [SYNNOADJPARGS];
                                                      PREPKEY := 0;
                                                      REFLEXIVITY := NOTREFLEXIVE;
                                                      POSSADV := TRUE;
                                                      ARTINDEF := SI;
                                                      COPULAS := [];
                                                      END
END;

 FUNCTION LSAUXDOM_CpADJPONMISMO
                         (rec:LSDOMAINT_ADJPRECORD):BOOLEAN;
VAR Bool : BOOLEAN;
BEGIN 
  Bool := FALSE;
  WITH rec DO
  BEGIN
    IF (REQ = [POSPOL,NEGPOL,OMEGAPOL] ) THEN
IF (ENV = [POSPOL,NEGPOL,OMEGAPOL] ) THEN
IF (GENERO = OMEGAGENERO ) THEN
IF (NUMERO = OMEGANUMERO ) THEN
IF (APOCOPE = FALSE ) THEN
IF (POSICION = POSTPOSICION ) THEN
IF (CLASS = OMEGATIMEADVCLASS ) THEN
IF (TIEMPO = OMEGATIEMPO ) THEN
IF (ASPECTO = OMEGAASPECTO ) THEN
IF (RETRO = FALSE ) THEN
IF (USES = [ATTRIBUTIVE] ) THEN
IF (TEMPORAL = FALSE ) THEN
IF (ACTSUBCEFS = [OTHERADJ] ) THEN
IF (THETAADJ = ADJP100 ) THEN
IF (ADJPATTERNEFS = [SYNNOADJPARGS] ) THEN
IF (REFLEXIVITY = NOTREFLEXIVE ) THEN
IF (MOOD = DECLXPMOOD ) THEN
IF (COPULAS = [] ) THEN
IF (COORD = NOCOORD ) THEN
      Bool:=TRUE;
  END;{with}
  LSAUXDOM_CpADJPONMISMO:=Bool;
END;{function}
 PROCEDURE LSAUXDOM_AsADJPONMISMO(VAR rec:LSDOMAINT_ADJPRECORD);
BEGIN
WITH rec DO
BEGIN
REQ := [POSPOL,NEGPOL,OMEGAPOL];
                                                      ENV := [POSPOL,NEGPOL,OMEGAPOL];
                                                      GENERO := OMEGAGENERO;
                                                      NUMERO := OMEGANUMERO;
                                                      APOCOPE := FALSE;
                                                      POSICION := POSTPOSICION;
                                                      CLASS := OMEGATIMEADVCLASS;
                                                      TIEMPO := OMEGATIEMPO;
                                                      ASPECTO := OMEGAASPECTO;
                                                      RETRO := FALSE;
                                                      USES := [ATTRIBUTIVE];
                                                      TEMPORAL := FALSE;
                                                      ACTSUBCEFS := [OTHERADJ];
                                                      THETAADJ := ADJP100;
                                                      ADJPATTERNEFS := [SYNNOADJPARGS];
                                                      REFLEXIVITY := NOTREFLEXIVE;
                                                      MOOD := DECLXPMOOD;
                                                      COPULAS := [];
                                                      COORD := NOCOORD;
                                                      END
END;

 FUNCTION LSAUXDOM_CpSUBADJONOTRO
                         (rec:LSDOMAINT_SUBADJRECORD):BOOLEAN;
VAR Bool : BOOLEAN;
BEGIN 
  Bool := FALSE;
  WITH rec DO
  BEGIN
    IF (REQ = [POSPOL,NEGPOL,OMEGAPOL] ) THEN
IF (ENV = [POSPOL,NEGPOL,OMEGAPOL] ) THEN
IF (CLASS = OMEGATIMEADVCLASS ) THEN
IF (TIEMPO = OMEGATIEMPO ) THEN
IF (ASPECTO = OMEGAASPECTO ) THEN
IF (RETRO = FALSE ) THEN
IF (PLURALFORMA = REG ) THEN
IF (FEMFORMA = NORMAL ) THEN
IF (POSSAPOCOPE = NO ) THEN
IF (POSICION = PREPOSICION ) THEN
IF (USES = [ATTRIBUTIVE] ) THEN
IF (TEMPORAL = FALSE ) THEN
IF (SUBCS = [OTHERADJ] ) THEN
IF (REFLEXIVITY = NOTREFLEXIVE ) THEN
IF (THETAADJ = ADJP100 ) THEN
IF (ADJPATTERNS = [SYNNOADJPARGS] ) THEN
IF (PREPKEY = 0 ) THEN
IF (POSSADV = FALSE ) THEN
IF (ARTINDEF = SI ) THEN
IF (COPULAS = [] ) THEN
      Bool:=TRUE;
  END;{with}
  LSAUXDOM_CpSUBADJONOTRO:=Bool;
END;{function}
 PROCEDURE LSAUXDOM_AsSUBADJONOTRO(VAR rec:LSDOMAINT_SUBADJRECORD);
BEGIN
WITH rec DO
BEGIN
REQ := [POSPOL,NEGPOL,OMEGAPOL];
                                                      ENV := [POSPOL,NEGPOL,OMEGAPOL];
                                                      CLASS := OMEGATIMEADVCLASS;
                                                      TIEMPO := OMEGATIEMPO;
                                                      ASPECTO := OMEGAASPECTO;
                                                      RETRO := FALSE;
                                                      PLURALFORMA := REG;
                                                      FEMFORMA := NORMAL;
                                                      POSSAPOCOPE := NO;
                                                      POSICION := PREPOSICION;
                                                      USES := [ATTRIBUTIVE];
                                                      TEMPORAL := FALSE;
                                                      SUBCS := [OTHERADJ];
                                                      REFLEXIVITY := NOTREFLEXIVE;
                                                      THETAADJ := ADJP100;
                                                      ADJPATTERNS := [SYNNOADJPARGS];
                                                      PREPKEY := 0;
                                                      POSSADV := FALSE;
                                                      ARTINDEF := SI;
                                                      COPULAS := [];
                                                      END
END;

 FUNCTION LSAUXDOM_CpADJONOTRO
                         (rec:LSDOMAINT_ADJRECORD):BOOLEAN;
VAR Bool : BOOLEAN;
BEGIN 
  Bool := FALSE;
  WITH rec DO
  BEGIN
    IF (REQ = [POSPOL,NEGPOL,OMEGAPOL] ) THEN
IF (ENV = [POSPOL,NEGPOL,OMEGAPOL] ) THEN
IF (ADJADVFORM = POSITIVE ) THEN
IF (PLURALFORMA = REG ) THEN
IF (FEMFORMA = NORMAL ) THEN
IF (IRRCOMP = NO ) THEN
IF (GENERO = OMEGAGENERO ) THEN
IF (NUMERO = OMEGANUMERO ) THEN
IF (POSSAPOCOPE = NO ) THEN
IF (APOCOPE = FALSE ) THEN
IF (POSICION = PREPOSICION ) THEN
IF (CLASS = OMEGATIMEADVCLASS ) THEN
IF (TIEMPO = OMEGATIEMPO ) THEN
IF (ASPECTO = OMEGAASPECTO ) THEN
IF (RETRO = FALSE ) THEN
IF (USES = [ATTRIBUTIVE] ) THEN
IF (TEMPORAL = FALSE ) THEN
IF (SUBCS = [OTHERADJ] ) THEN
IF (THETAADJ = ADJP100 ) THEN
IF (ADJPATTERNS = [SYNNOADJPARGS] ) THEN
IF (PREPKEY = 0 ) THEN
IF (REFLEXIVITY = NOTREFLEXIVE ) THEN
IF (POSSADV = TRUE ) THEN
IF (ARTINDEF = SI ) THEN
IF (COPULAS = [] ) THEN
      Bool:=TRUE;
  END;{with}
  LSAUXDOM_CpADJONOTRO:=Bool;
END;{function}
 PROCEDURE LSAUXDOM_AsADJONOTRO(VAR rec:LSDOMAINT_ADJRECORD);
BEGIN
WITH rec DO
BEGIN
REQ := [POSPOL,NEGPOL,OMEGAPOL];
                                                      ENV := [POSPOL,NEGPOL,OMEGAPOL];
                                                      ADJADVFORM := POSITIVE;
                                                      PLURALFORMA := REG;
                                                      FEMFORMA := NORMAL;
                                                      IRRCOMP := NO;
                                                      GENERO := OMEGAGENERO;
                                                      NUMERO := OMEGANUMERO;
                                                      POSSAPOCOPE := NO;
                                                      APOCOPE := FALSE;
                                                      POSICION := PREPOSICION;
                                                      CLASS := OMEGATIMEADVCLASS;
                                                      TIEMPO := OMEGATIEMPO;
                                                      ASPECTO := OMEGAASPECTO;
                                                      RETRO := FALSE;
                                                      USES := [ATTRIBUTIVE];
                                                      TEMPORAL := FALSE;
                                                      SUBCS := [OTHERADJ];
                                                      THETAADJ := ADJP100;
                                                      ADJPATTERNS := [SYNNOADJPARGS];
                                                      PREPKEY := 0;
                                                      REFLEXIVITY := NOTREFLEXIVE;
                                                      POSSADV := TRUE;
                                                      ARTINDEF := SI;
                                                      COPULAS := [];
                                                      END
END;

 FUNCTION LSAUXDOM_CpADJPONOTRO
                         (rec:LSDOMAINT_ADJPRECORD):BOOLEAN;
VAR Bool : BOOLEAN;
BEGIN 
  Bool := FALSE;
  WITH rec DO
  BEGIN
    IF (REQ = [POSPOL,NEGPOL,OMEGAPOL] ) THEN
IF (ENV = [POSPOL,NEGPOL,OMEGAPOL] ) THEN
IF (GENERO = OMEGAGENERO ) THEN
IF (NUMERO = OMEGANUMERO ) THEN
IF (APOCOPE = FALSE ) THEN
IF (POSICION = PREPOSICION ) THEN
IF (CLASS = OMEGATIMEADVCLASS ) THEN
IF (TIEMPO = OMEGATIEMPO ) THEN
IF (ASPECTO = OMEGAASPECTO ) THEN
IF (RETRO = FALSE ) THEN
IF (USES = [ATTRIBUTIVE] ) THEN
IF (TEMPORAL = FALSE ) THEN
IF (ACTSUBCEFS = [OTHERADJ] ) THEN
IF (THETAADJ = ADJP100 ) THEN
IF (ADJPATTERNEFS = [SYNNOADJPARGS] ) THEN
IF (REFLEXIVITY = NOTREFLEXIVE ) THEN
IF (MOOD = DECLXPMOOD ) THEN
IF (COPULAS = [] ) THEN
IF (COORD = NOCOORD ) THEN
      Bool:=TRUE;
  END;{with}
  LSAUXDOM_CpADJPONOTRO:=Bool;
END;{function}
 PROCEDURE LSAUXDOM_AsADJPONOTRO(VAR rec:LSDOMAINT_ADJPRECORD);
BEGIN
WITH rec DO
BEGIN
REQ := [POSPOL,NEGPOL,OMEGAPOL];
                                                      ENV := [POSPOL,NEGPOL,OMEGAPOL];
                                                      GENERO := OMEGAGENERO;
                                                      NUMERO := OMEGANUMERO;
                                                      APOCOPE := FALSE;
                                                      POSICION := PREPOSICION;
                                                      CLASS := OMEGATIMEADVCLASS;
                                                      TIEMPO := OMEGATIEMPO;
                                                      ASPECTO := OMEGAASPECTO;
                                                      RETRO := FALSE;
                                                      USES := [ATTRIBUTIVE];
                                                      TEMPORAL := FALSE;
                                                      ACTSUBCEFS := [OTHERADJ];
                                                      THETAADJ := ADJP100;
                                                      ADJPATTERNEFS := [SYNNOADJPARGS];
                                                      REFLEXIVITY := NOTREFLEXIVE;
                                                      MOOD := DECLXPMOOD;
                                                      COPULAS := [];
                                                      COORD := NOCOORD;
                                                      END
END;
 FUNCTION LSAUXDOM_ADJP010VPS:LSDOMAINT_SYNPATTERNSETTYPE;
BEGIN
LSAUXDOM_ADJP010VPS:=
[SYNANP,
SYNCOMOCLOSEDADJPPROP,
SYNELQUESENTSUBJ,
SYNEMPTY,
SYNPREPEMPTY,
SYNPREPNP,
SYNPREPQSENT,
SYNPREPQUESENTIND,
SYNPREPQUESENTSUBJ,
SYNQSENT,
SYNQUESENTIND,
SYNQUESENTSUBJ,
SYNQUESISENT]
END;
 FUNCTION LSAUXDOM_ADJP012VPS:LSDOMAINT_SYNPATTERNSETTYPE;
BEGIN
LSAUXDOM_ADJP012VPS:=
[SYNANP_DONP,
SYNANP_MEASUREPHRASE,
SYNANP_OPENINFSENT,
SYNANP_PREPOPENINFSENT,
SYNANP_PREPQUESENTIND,
SYNANP_PREPQUESENTSUBJ,
SYNANP_QSENT,
SYNANP_QUESENTIND,
SYNANP_QUESENTSUBJ,
SYNANP_QUESISENT,
SYNEMPTY_DONP,
SYNEMPTY_MEASUREPHRASE,
SYNEMPTY_OPENINFSENT,
SYNEMPTY_QSENT,
SYNEMPTY_QUESENTIND,
SYNEMPTY_QUESENTSUBJ,
SYNEMPTY_QUESISENT,
SYNPREPEMPTY_PREPNP,
SYNPREPNP_PREPEMPTY,
SYNPREPNP_PREPNP,
SYNPREPNP_PREPOPENINFSENT,
SYNPREPNP_QUESENTSUBJ]
END;
 FUNCTION LSAUXDOM_ADJP120VPS:LSDOMAINT_SYNPATTERNSETTYPE;
BEGIN
LSAUXDOM_ADJP120VPS:=
[SYNANP,
SYNCOMOCLOSEDADJPPROP,
SYNELOPENINFSENT,
SYNELQUESENTSUBJ,
SYNEMPTY,
SYNLOCEMPTY,
SYNMEASUREPHRASE,
SYNOPENGERSENT,
SYNOPENINFSENT,
SYNPREPEMPTY,
SYNPREPNP,
SYNPREPOPENINFSENT,
SYNPREPQSENT,
SYNPREPQUESENTIND,
SYNPREPQUESENTSUBJ,
SYNQSENT,
SYNQUEOPENINFSENT,
SYNQUESENTIND,
SYNQUESENTSUBJ,
SYNQUESISENT]
END;
 FUNCTION LSAUXDOM_ADJP123VPS:LSDOMAINT_SYNPATTERNSETTYPE;
BEGIN
LSAUXDOM_ADJP123VPS:=
[SYNANP_DONP,
SYNANP_MEASUREPHRASE,
SYNANP_OPENINFSENT,
SYNANP_PREPOPENINFSENT,
SYNANP_PREPQUESENTIND,
SYNANP_PREPQUESENTSUBJ,
SYNANP_QSENT,
SYNANP_QUESENTIND,
SYNANP_QUESENTSUBJ,
SYNANP_QUESISENT,
SYNEMPTY_DONP,
SYNEMPTY_MEASUREPHRASE,
SYNEMPTY_OPENINFSENT,
SYNEMPTY_QSENT,
SYNEMPTY_QUESENTIND,
SYNEMPTY_QUESENTSUBJ,
SYNEMPTY_QUESISENT,
SYNPREPEMPTY_PREPNP,
SYNPREPNP_PREPEMPTY,
SYNPREPNP_PREPNP,
SYNPREPNP_PREPOPENINFSENT,
SYNPREPNP_QUESENTSUBJ]
END;
 FUNCTION LSAUXDOM_ADJPREPOBJVPS:LSDOMAINT_SYNPATTERNSETTYPE;
BEGIN
LSAUXDOM_ADJPREPOBJVPS:=
[SYNPREPEMPTY,
SYNPREPNP,
SYNPREPOPENINFSENT,
SYNPREPQSENT,
SYNPREPQUESENTIND,
SYNPREPQUESENTSUBJ]
END;
 FUNCTION LSAUXDOM_UNIQUERELS:SETOFSYNREL;
BEGIN
LSAUXDOM_UNIQUERELS:=
[HEAD,
OBJREL,
PREDREL,
SUBJREL,
CLITICREL]
END;
 FUNCTION LSAUXDOM_COMPOUNDPATTERNS:LSDOMAINT_SYNPATTERNSETTYPE;
BEGIN
LSAUXDOM_COMPOUNDPATTERNS:=
[VPID39,
VPID40]
END;
 FUNCTION LSAUXDOM_CTVARCATS:SETOFSYNTCAT;
BEGIN
LSAUXDOM_CTVARCATS:=
[VARPREPP]
END;
 FUNCTION LSAUXDOM_ADJPPREDVPS:LSDOMAINT_SYNPATTERNSETTYPE;
BEGIN
LSAUXDOM_ADJPPREDVPS:=
[SYNANP_CLOSEDADJPPROP,
SYNCLOSEDADJPPROP,
SYNDONP_OPENADJPPROP,
SYNEMPTY_CLOSEDADJPPROP,
SYNOPENADJPPROP,
SYNESTAR]
END;
 FUNCTION LSAUXDOM_DIRARGVPS:LSDOMAINT_SYNPATTERNSETTYPE;
BEGIN
LSAUXDOM_DIRARGVPS:=
[SYNDIRCLOSEDPREPPPROP,
SYNDIROPENPREPPPROP,
SYNDONP_DIROPENPREPPPROP,
SYNDONP_DIREMPTY]
END;
 FUNCTION LSAUXDOM_EMPTYINDOBJVPS:LSDOMAINT_SYNPATTERNSETTYPE;
BEGIN
LSAUXDOM_EMPTYINDOBJVPS:=
[SYNEMPTY_DONP,
SYNEMPTY_QUESENTIND,
SYNEMPTY_QUESENTSUBJ,
SYNEMPTY_MEASUREPHRASE,
SYNEMPTY_CLOSEDNPPROP,
SYNEMPTY_CLOSEDADJPPROP,
SYNEMPTY_OTHERCLOSEDPREPPPROP,
SYNEMPTY_QSENT]
END;
 FUNCTION LSAUXDOM_EMPTYOBJVPS:LSDOMAINT_SYNPATTERNSETTYPE;
BEGIN
LSAUXDOM_EMPTYOBJVPS:=
[SYNEMPTY,
SYNEMPTY_PREPEMPTY,
SYNEMPTY_PREPNP]
END;
 FUNCTION LSAUXDOM_INDOBJVPS:LSDOMAINT_SYNPATTERNSETTYPE;
BEGIN
LSAUXDOM_INDOBJVPS:=
[SYNANP_CLOSEDADJPPROP,
SYNANP_CLOSEDNPPROP,
SYNANP_DONP,
SYNANP_MEASUREPHRASE,
SYNANP_OPENINFSENT,
SYNANP_OTHERCLOSEDPREPPPROP,
SYNANP_PREPCLOSEDADJPPROP,
SYNANP_QSENT,
SYNANP_QUESENTIND,
SYNANP_QUESENTSUBJ,
SYNANP_QUESISENT]
END;
 FUNCTION LSAUXDOM_LOCARGVPS:LSDOMAINT_SYNPATTERNSETTYPE;
BEGIN
LSAUXDOM_LOCARGVPS:=
[SYNDONP_LOCOPENPREPPPROP,
SYNLOCCLOSEDPREPPPROP,
SYNLOCOPENPREPPPROP]
END;
 FUNCTION LSAUXDOM_NPPREDVPS:LSDOMAINT_SYNPATTERNSETTYPE;
BEGIN
LSAUXDOM_NPPREDVPS:=
[SYNANP_CLOSEDNPPROP,
SYNANP_MEASUREPHRASE,
SYNCLOSEDNPPROP,
SYNDONP_OPENNPPROP,
SYNEMPTY_CLOSEDNPPROP,
SYNEMPTY_MEASUREPHRASE,
SYNOPENNPPROP]
END;
 FUNCTION LSAUXDOM_OBJVPS:LSDOMAINT_SYNPATTERNSETTYPE;
BEGIN
LSAUXDOM_OBJVPS:=
[SYNAEMPTY_DONP,
SYNANP_DONP,
SYNCLOSEDNPPROP,
SYNCLOSEDVERBPPROP,
SYNDONP_DIREMPTY,
SYNDONP_DIROPENPREPPPROP,
SYNDONP_LOCOPENPREPPPROP,
SYNDONP_OPENADJPPROP,
SYNDONP_OPENINFSENT,
SYNDONP_OPENNPPROP,
SYNDONP_PREPNP,
SYNDONP_PREPOPENADJPPROP,
SYNDONP_PREPOPENINFSENT,
SYNDONP_PREPOPENNPPROP,
SYNDONP_PREPQUESENTIND,
SYNDONP_PREPQUESENTSUBJ,
SYNEMPTY_CLOSEDNPPROP,
SYNEMPTY_DONP,
SYNNP,
SYNPREPCLOSEDADJPPROP,
SYNPREPCLOSEDNPPROP]
END;
 FUNCTION LSAUXDOM_OPENSENTVPS:LSDOMAINT_SYNPATTERNSETTYPE;
BEGIN
LSAUXDOM_OPENSENTVPS:=
[SYNANP_OPENINFSENT,
SYNANP_PREPOPENINFSENT,
SYNDONP_OPENGERSENT,
SYNDONP_OPENINFSENT,
SYNDONP_PREPOPENINFSENT,
SYNELOPENINFSENT,
SYNEMPTY_OPENINFSENT,
SYNOPENGERSENT,
SYNOPENINFSENT,
SYNPREPNP_PREPOPENINFSENT,
SYNPREPOPENINFSENT,
SYNQUEOPENINFSENT]
END;
 FUNCTION LSAUXDOM_OTHERADVSUBCS:LSDOMAINT_ADVSUBCSETTYPE;
BEGIN
LSAUXDOM_OTHERADVSUBCS:=
[OTHERADV]
END;
 FUNCTION LSAUXDOM_PARAOBJVPS:LSDOMAINT_SYNPATTERNSETTYPE;
BEGIN
LSAUXDOM_PARAOBJVPS:=
[SYNPARAEMPTY,
SYNPARANP_DONP]
END;
 FUNCTION LSAUXDOM_PP120PPS:LSDOMAINT_SYNPATTERNSETTYPE;
BEGIN
LSAUXDOM_PP120PPS:=
[SYNNP,
SYNLOCPREPP,
SYNQUESENTIND,
SYNOPENINFSENT]
END;
 FUNCTION LSAUXDOM_PREPVPS:LSDOMAINT_SYNPATTERNSETTYPE;
BEGIN
LSAUXDOM_PREPVPS:=
[SYNANP_PREPCLOSEDADJPPROP,
SYNDONP_PREPNP,
SYNDONP_PREPOPENADJPPROP,
SYNDONP_PREPOPENNPPROP,
SYNPREPCLOSEDADJPPROP,
SYNPREPCLOSEDNPPROP,
SYNPREPNP,
SYNPREPNP_PREPNP,
SYNPREPOPENNPPROP,
SYNPREPOPENINFSENT,
SYNPREPQSENT,
SYNPREPQUESENTIND,
SYNPREPQUESENTSUBJ,
SYNDONP_PREPQUESENTIND,
SYNDONP_PREPQUESENTSUBJ,
SYNDONP_PREPOPENINFSENT,
SYNPREPEMPTY,
SYNLOCPREPEMPTY]
END;
 FUNCTION LSAUXDOM_PREPOBJVPS:LSDOMAINT_SYNPATTERNSETTYPE;
BEGIN
LSAUXDOM_PREPOBJVPS:=
[SYNANP_PREPCLOSEDADJPPROP,
SYNANP_PREPNP,
SYNANP_PREPOPENINFSENT,
SYNANP_PREPQUESENTIND,
SYNANP_PREPQUESENTSUBJ,
SYNDONP_PREPEMPTY,
SYNDONP_PREPNP,
SYNDONP_PREPOPENADJPPROP,
SYNDONP_PREPOPENINFSENT,
SYNDONP_PREPOPENNPPROP,
SYNDONP_PREPQUESENTIND,
SYNDONP_PREPQUESENTSUBJ,
SYNEMPTY_PREPEMPTY,
SYNEMPTY_PREPNP,
SYNPREPCLOSEDADJPPROP,
SYNPREPCLOSEDNPPROP,
SYNPREPEMPTY,
SYNPREPEMPTY_PREPNP,
SYNPREPMEASUREPHRASE,
SYNPREPNP,
SYNPREPNP_PREPEMPTY,
SYNPREPNP_PREPNP,
SYNPREPNP_PREPOPENINFSENT,
SYNPREPNP_QUESENTSUBJ,
SYNPREPOPENADJPPROP,
SYNPREPOPENINFSENT,
SYNPREPOPENNPPROP,
SYNPREPQSENT,
SYNPREPQUESENTIND,
SYNPREPQUESENTSUBJ]
END;
 FUNCTION LSAUXDOM_ERGATIVECLOSEDVPS:LSDOMAINT_SYNPATTERNSETTYPE;
BEGIN
LSAUXDOM_ERGATIVECLOSEDVPS:=
[SYNANP_CLOSEDADJPPROP,
SYNANP_CLOSEDNPPROP,
SYNANP_OTHERCLOSEDPREPPPROP,
SYNANP_PREPCLOSEDADJPPROP,
SYNQUECLOSEDINFSENT,
SYNCLOSEDINFSENT,
SYNCLOSEDNPPROP,
SYNCLOSEDADJPPROP,
SYNCLOSEDVERBPPROP,
SYNCOMOCLOSEDADJPPROP,
SYNDIRCLOSEDPREPPPROP,
SYNEMPTY_CLOSEDADJPPROP,
SYNEMPTY_CLOSEDNPPROP,
SYNEMPTY_OTHERCLOSEDPREPPPROP,
SYNLOCCLOSEDPREPPPROP,
SYNPREPCLOSEDADJPPROP,
SYNPREPCLOSEDNPPROP,
SYNEMPTY_CLOSEDINFSENT]
END;
 FUNCTION LSAUXDOM_PRESUBJRELS:SETOFSYNREL;
BEGIN
LSAUXDOM_PRESUBJRELS:=
[LEFTDISLOCREL,
SHIFTREL,
CONJREL]
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
 FUNCTION LSAUXDOM_VARCATSET:SETOFSYNTCAT;
BEGIN
LSAUXDOM_VARCATSET:=
[ADJPPROPVAR,
ADVPPROPVAR,
CLAUSEVAR,
NPPROPVAR,
PREPPPROPVAR,
PREPPVAR,
ADVPVAR,
NPVAR,
SENTENCEVAR,
EMPTYVAR,
VERBPPROPVAR,
CNVAR,
PROSENTVAR]
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
[SYNCLOSEDADJPPROP,
SYNCLOSEDINFSENT,
SYNCLOSEDNPPROP,
SYNCLOSEDVERBPPROP,
SYNCOMOCLOSEDADJPPROP,
SYNDIRCLOSEDPREPPPROP,
SYNDIROPENPREPPPROP,
SYNELOPENINFSENT,
SYNELQUESENTSUBJ,
SYNEMPTY,
SYNLOCCLOSEDPREPPPROP,
SYNLOCEMPTY,
SYNLOCOPENPREPPPROP,
SYNMEASUREPHRASE,
SYNNP,
SYNOPENADJPPROP,
SYNOPENADVPPROP,
SYNOPENGERSENT,
SYNOPENINFSENT,
SYNOPENNPPROP,
SYNOPENVERBPPROP,
SYNOTHERCLOSEDPREPPPROP,
SYNPREPCLOSEDADJPPROP,
SYNPREPCLOSEDNPPROP,
SYNPREPEMPTY,
SYNPREPNP,
SYNPREPOPENINFSENT,
SYNPREPOPENNPPROP,
SYNPREPQSENT,
SYNPREPQUESENTIND,
SYNPREPQUESENTSUBJ,
SYNPROSENT,
SYNQSENT,
SYNQUESENTIND,
SYNQUESENTSUBJ,
SYNQUESISENT,
SYNSOPROSENT,
SYNVERBPPROP,
VPID1,
VPID2,
VPID3,
VPID4,
VPID5]
END;
 FUNCTION LSAUXDOM_VP120VPS:LSDOMAINT_SYNPATTERNSETTYPE;
BEGIN
LSAUXDOM_VP120VPS:=
[SYNANP,
SYNCLAUSE,
SYNCLOSEDADJPPROP,
SYNCLOSEDINFSENT,
SYNCLOSEDNPPROP,
SYNCLOSEDVERBPPROP,
SYNCOMOCLOSEDADJPPROP,
SYNDIRCLOSEDPREPPPROP,
SYNDIREMPTY,
SYNDIROPENPREPPPROP,
SYNELOPENINFSENT,
SYNELQUESENTSUBJ,
SYNEMPTY,
SYNLOCCLOSEDPREPPPROP,
SYNLOCEMPTY,
SYNLOCOPENPREPPPROP,
SYNMEASUREPHRASE,
SYNNP,
SYNOPENADJPPROP,
SYNOPENADVPPROP,
SYNOPENGERSENT,
SYNOPENINFSENT,
SYNOPENNPPROP,
SYNOPENVERBPPROP,
SYNOTHERCLOSEDPREPPPROP,
SYNOTHEROPENPREPPPROP,
SYNPREPCLOSEDADJPPROP,
SYNPREPCLOSEDNPPROP,
SYNPREPEMPTY,
SYNPREPMEASUREPHRASE,
SYNPREPNP,
SYNPREPOPENADJPPROP,
SYNPREPOPENINFSENT,
SYNPREPOPENNPPROP,
SYNPREPQSENT,
SYNPREPQUESENTIND,
SYNPREPQUESENTSUBJ,
SYNPROSENT,
SYNQSENT,
SYNQUEOPENINFSENT,
SYNQUESENTIND,
SYNQUESENTSUBJ,
SYNQUESISENT,
SYNSOPROSENT,
SYNVERBPPROP,
VPID1,
VPID2,
VPID3,
VPID4,
VPID5]
END;
 FUNCTION LSAUXDOM_VP123VPS:LSDOMAINT_SYNPATTERNSETTYPE;
BEGIN
LSAUXDOM_VP123VPS:=
[SYNANP_CLOSEDADJPPROP,
SYNANP_CLOSEDNPPROP,
SYNANP_DONP,
SYNANP_MEASUREPHRASE,
SYNANP_OPENINFSENT,
SYNANP_OTHERCLOSEDPREPPPROP,
SYNANP_PREPCLOSEDADJPPROP,
SYNANP_PREPNP,
SYNANP_PREPOPENINFSENT,
SYNANP_PREPQUESENTIND,
SYNANP_PREPQUESENTSUBJ,
SYNANP_PROSENT,
SYNANP_QSENT,
SYNANP_QUESENTIND,
SYNANP_QUESENTSUBJ,
SYNANP_QUESISENT,
SYNDONP_DIREMPTY,
SYNDONP_DIROPENPREPPPROP,
SYNDONP_LOCOPENPREPPPROP,
SYNDONP_OPENADJPPROP,
SYNDONP_OPENGERSENT,
SYNDONP_OPENINFSENT,
SYNDONP_OPENNPPROP,
SYNDONP_OTHEROPENPREPPPROP,
SYNDONP_PREPEMPTY,
SYNDONP_PREPNP,
SYNDONP_PREPOPENADJPPROP,
SYNDONP_PREPOPENINFSENT,
SYNDONP_PREPOPENNPPROP,
SYNDONP_PREPQUESENTIND,
SYNDONP_PREPQUESENTSUBJ,
SYNDONP_QUESENTIND,
SYNDONP_QUESENTSUBJ,
SYNDONP_RESULTEMPTY,
SYNEMPTY_ANP,
SYNEMPTY_CLOSEDADJPPROP,
SYNEMPTY_CLOSEDINFSENT,
SYNEMPTY_CLOSEDNPPROP,
SYNEMPTY_DONP,
SYNEMPTY_MEASUREPHRASE,
SYNEMPTY_OPENINFSENT,
SYNEMPTY_OTHERCLOSEDPREPPPROP,
SYNEMPTY_PREPEMPTY,
SYNEMPTY_PREPNP,
SYNEMPTY_PROSENT,
SYNEMPTY_QSENT,
SYNEMPTY_QUESENTIND,
SYNEMPTY_QUESENTSUBJ,
SYNEMPTY_QUESISENT,
SYNPARANP_DONP,
SYNPREPEMPTY_PREPNP,
SYNPREPNP_PREPEMPTY,
SYNPREPNP_PREPNP,
SYNPREPNP_PREPOPENINFSENT,
SYNPREPNP_QUESENTSUBJ,
VPID1,
VPID2,
VPID3,
VPID4,
VPID5]
END;
 FUNCTION LSAUXDOM_VP012VPS:LSDOMAINT_SYNPATTERNSETTYPE;
BEGIN
LSAUXDOM_VP012VPS:=
[SYNANP_CLOSEDADJPPROP,
SYNANP_CLOSEDNPPROP,
SYNANP_DONP,
SYNANP_MEASUREPHRASE,
SYNANP_OPENINFSENT,
SYNANP_OTHERCLOSEDPREPPPROP,
SYNANP_PREPCLOSEDADJPPROP,
SYNANP_PREPNP,
SYNANP_PREPOPENINFSENT,
SYNANP_PREPQUESENTIND,
SYNANP_PREPQUESENTSUBJ,
SYNANP_PROSENT,
SYNANP_QSENT,
SYNANP_QUESENTIND,
SYNANP_QUESENTSUBJ,
SYNANP_QUESISENT,
SYNDONP_DIREMPTY,
SYNDONP_DIROPENPREPPPROP,
SYNDONP_LOCOPENPREPPPROP,
SYNDONP_OPENADJPPROP,
SYNDONP_OPENGERSENT,
SYNDONP_OPENINFSENT,
SYNDONP_OPENNPPROP,
SYNDONP_OTHEROPENPREPPPROP,
SYNDONP_PREPEMPTY,
SYNDONP_PREPNP,
SYNDONP_PREPOPENADJPPROP,
SYNDONP_PREPOPENINFSENT,
SYNDONP_PREPOPENNPPROP,
SYNDONP_PREPQUESENTIND,
SYNDONP_PREPQUESENTSUBJ,
SYNDONP_QUESENTIND,
SYNDONP_QUESENTSUBJ,
SYNDONP_RESULTEMPTY,
SYNEMPTY_ANP,
SYNEMPTY_CLOSEDADJPPROP,
SYNEMPTY_CLOSEDINFSENT,
SYNEMPTY_CLOSEDNPPROP,
SYNEMPTY_DONP,
SYNEMPTY_MEASUREPHRASE,
SYNEMPTY_OPENINFSENT,
SYNEMPTY_OTHERCLOSEDPREPPPROP,
SYNEMPTY_PREPEMPTY,
SYNEMPTY_PREPNP,
SYNEMPTY_PROSENT,
SYNEMPTY_QSENT,
SYNEMPTY_QUESENTIND,
SYNEMPTY_QUESENTSUBJ,
SYNEMPTY_QUESISENT,
SYNPARANP_DONP,
SYNPREPEMPTY_PREPNP,
SYNPREPNP_PREPEMPTY,
SYNPREPNP_PREPNP,
SYNPREPNP_PREPOPENINFSENT,
SYNPREPNP_QUESENTSUBJ,
VPID1,
VPID2,
VPID3,
VPID4,
VPID5]
END;
 FUNCTION LSAUXDOM_VRVPS:LSDOMAINT_SYNPATTERNSETTYPE;
BEGIN
LSAUXDOM_VRVPS:=
[SYNOPENGERSENT,
SYNOPENINFSENT,
SYNPREPOPENINFSENT,
SYNQUEOPENINFSENT]
END;


