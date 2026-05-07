Export(LDEQUAL);
pragma C_include('lsdomaint.pf');
pragma C_include('lsstree.pf');
pragma C_include('listree.pf');
pragma C_include('ldequal.pf');

PROGRAM LDEQUAL;
WITH LSDOMAINT,LSSTREE,LISTREE;
FUNCTION EQUAL_NOrecord
(rec1,rec2:LSDOMAINT_NOrecord):BOOLEAN;
VAR result:BOOLEAN;
BEGIN
result := FALSE;
result := TRUE;
EQUAL_NOrecord:= result
END;
FUNCTION EQUAL_BADJrecord
(rec1,rec2:LSDOMAINT_BADJrecord):BOOLEAN;
VAR result:BOOLEAN;
BEGIN
result := FALSE;
IF ( rec1.req = rec2.req ) THEN
IF ( rec1.env = rec2.env ) THEN
IF ( rec1.class = rec2.class ) THEN
IF ( rec1.deixis = rec2.deixis ) THEN
IF ( rec1.aspect = rec2.aspect ) THEN
IF ( rec1.retro = rec2.retro ) THEN
IF ( rec1.uses = rec2.uses ) THEN
IF ( rec1.eFormation = rec2.eFormation ) THEN
IF ( rec1.sFormation = rec2.sFormation ) THEN
IF ( rec1.eNominalised = rec2.eNominalised ) THEN
IF ( rec1.comparatives = rec2.comparatives ) THEN
IF ( rec1.superlatives = rec2.superlatives ) THEN
IF ( rec1.temporal = rec2.temporal ) THEN
IF ( rec1.subcs = rec2.subcs ) THEN
IF ( rec1.reflexivity = rec2.reflexivity ) THEN
IF ( rec1.thetaadj = rec2.thetaadj ) THEN
IF ( rec1.adjpatterns = rec2.adjpatterns ) THEN
IF ( rec1.prepkey = rec2.prepkey ) THEN
IF ( rec1.possadv = rec2.possadv ) THEN
result := TRUE;
EQUAL_BADJrecord:= result
END;
FUNCTION EQUAL_SUBADJrecord
(rec1,rec2:LSDOMAINT_SUBADJrecord):BOOLEAN;
VAR result:BOOLEAN;
BEGIN
result := FALSE;
IF ( rec1.req = rec2.req ) THEN
IF ( rec1.env = rec2.env ) THEN
IF ( rec1.class = rec2.class ) THEN
IF ( rec1.deixis = rec2.deixis ) THEN
IF ( rec1.aspect = rec2.aspect ) THEN
IF ( rec1.retro = rec2.retro ) THEN
IF ( rec1.uses = rec2.uses ) THEN
IF ( rec1.eFormation = rec2.eFormation ) THEN
IF ( rec1.sFormation = rec2.sFormation ) THEN
IF ( rec1.eNominalised = rec2.eNominalised ) THEN
IF ( rec1.comparatives = rec2.comparatives ) THEN
IF ( rec1.superlatives = rec2.superlatives ) THEN
IF ( rec1.temporal = rec2.temporal ) THEN
IF ( rec1.subcs = rec2.subcs ) THEN
IF ( rec1.reflexivity = rec2.reflexivity ) THEN
IF ( rec1.thetaadj = rec2.thetaadj ) THEN
IF ( rec1.adjpatterns = rec2.adjpatterns ) THEN
IF ( rec1.prepkey = rec2.prepkey ) THEN
IF ( rec1.possadv = rec2.possadv ) THEN
IF ( rec1.lastaffix = rec2.lastaffix ) THEN
result := TRUE;
EQUAL_SUBADJrecord:= result
END;
FUNCTION EQUAL_ADJrecord
(rec1,rec2:LSDOMAINT_ADJrecord):BOOLEAN;
VAR result:BOOLEAN;
BEGIN
result := FALSE;
IF ( rec1.req = rec2.req ) THEN
IF ( rec1.env = rec2.env ) THEN
IF ( rec1.class = rec2.class ) THEN
IF ( rec1.deixis = rec2.deixis ) THEN
IF ( rec1.aspect = rec2.aspect ) THEN
IF ( rec1.retro = rec2.retro ) THEN
IF ( rec1.uses = rec2.uses ) THEN
IF ( rec1.eFormation = rec2.eFormation ) THEN
IF ( rec1.sFormation = rec2.sFormation ) THEN
IF ( rec1.eNominalised = rec2.eNominalised ) THEN
IF ( rec1.comparatives = rec2.comparatives ) THEN
IF ( rec1.superlatives = rec2.superlatives ) THEN
IF ( rec1.form = rec2.form ) THEN
IF ( rec1.eORenForm = rec2.eORenForm ) THEN
IF ( rec1.temporal = rec2.temporal ) THEN
IF ( rec1.subcs = rec2.subcs ) THEN
IF ( rec1.thetaadj = rec2.thetaadj ) THEN
IF ( rec1.adjpatterns = rec2.adjpatterns ) THEN
IF ( rec1.prepkey = rec2.prepkey ) THEN
IF ( rec1.reflexivity = rec2.reflexivity ) THEN
IF ( rec1.possadv = rec2.possadv ) THEN
result := TRUE;
EQUAL_ADJrecord:= result
END;
FUNCTION EQUAL_ADJPrecord
(rec1,rec2:LSDOMAINT_ADJPrecord):BOOLEAN;
VAR result:BOOLEAN;
BEGIN
result := FALSE;
IF ( rec1.req = rec2.req ) THEN
IF ( rec1.env = rec2.env ) THEN
IF ( rec1.class = rec2.class ) THEN
IF ( rec1.deixis = rec2.deixis ) THEN
IF ( rec1.aspect = rec2.aspect ) THEN
IF ( rec1.retro = rec2.retro ) THEN
IF ( rec1.actuseefs = rec2.actuseefs ) THEN
IF ( rec1.eformation = rec2.eformation ) THEN
IF ( rec1.enominalised = rec2.enominalised ) THEN
IF ( rec1.form = rec2.form ) THEN
IF ( rec1.eORenForm = rec2.eORenForm ) THEN
IF ( rec1.temporal = rec2.temporal ) THEN
IF ( rec1.actsubcefs = rec2.actsubcefs ) THEN
IF ( rec1.thetaadj = rec2.thetaadj ) THEN
IF ( rec1.adjpatternefs = rec2.adjpatternefs ) THEN
IF ( rec1.reflexivity = rec2.reflexivity ) THEN
IF ( rec1.mood = rec2.mood ) THEN
IF ( rec1.coord = rec2.coord ) THEN
result := TRUE;
EQUAL_ADJPrecord:= result
END;
FUNCTION EQUAL_ADJPPROPrecord
(rec1,rec2:LSDOMAINT_ADJPPROPrecord):BOOLEAN;
VAR result:BOOLEAN;
BEGIN
result := FALSE;
IF ( rec1.req = rec2.req ) THEN
IF ( rec1.env = rec2.env ) THEN
IF ( rec1.class = rec2.class ) THEN
IF ( rec1.deixis = rec2.deixis ) THEN
IF ( rec1.aspect = rec2.aspect ) THEN
IF ( rec1.retro = rec2.retro ) THEN
IF ( rec1.aktionsarts = rec2.aktionsarts ) THEN
IF ( rec1.superdeixis = rec2.superdeixis ) THEN
IF ( rec1.temporal = rec2.temporal ) THEN
IF ( rec1.actsubcefs = rec2.actsubcefs ) THEN
IF ( rec1.thetaadj = rec2.thetaadj ) THEN
IF ( rec1.adjpatternefs = rec2.adjpatternefs ) THEN
IF ( rec1.PROsubject = rec2.PROsubject ) THEN
IF ( rec1.mood = rec2.mood ) THEN
result := TRUE;
EQUAL_ADJPPROPrecord:= result
END;
FUNCTION EQUAL_ADJPPROPVARrecord
(rec1,rec2:LSDOMAINT_ADJPPROPVARrecord):BOOLEAN;
VAR result:BOOLEAN;
BEGIN
result := FALSE;
IF ( rec1.req = rec2.req ) THEN
IF ( rec1.env = rec2.env ) THEN
IF ( rec1.class = rec2.class ) THEN
IF ( rec1.deixis = rec2.deixis ) THEN
IF ( rec1.aspect = rec2.aspect ) THEN
IF ( rec1.retro = rec2.retro ) THEN
IF ( rec1.aktionsarts = rec2.aktionsarts ) THEN
IF ( rec1.superdeixis = rec2.superdeixis ) THEN
IF ( rec1.temporal = rec2.temporal ) THEN
IF ( rec1.actsubcefs = rec2.actsubcefs ) THEN
IF ( rec1.thetaadj = rec2.thetaadj ) THEN
IF ( rec1.adjpatternefs = rec2.adjpatternefs ) THEN
IF ( rec1.PROsubject = rec2.PROsubject ) THEN
IF ( rec1.mood = rec2.mood ) THEN
result := TRUE;
EQUAL_ADJPPROPVARrecord:= result
END;
FUNCTION EQUAL_BADVrecord
(rec1,rec2:LSDOMAINT_BADVrecord):BOOLEAN;
VAR result:BOOLEAN;
BEGIN
result := FALSE;
IF ( rec1.req = rec2.req ) THEN
IF ( rec1.env = rec2.env ) THEN
IF ( rec1.comparatives = rec2.comparatives ) THEN
IF ( rec1.superlatives = rec2.superlatives ) THEN
IF ( rec1.subcs = rec2.subcs ) THEN
IF ( rec1.Qstatus = rec2.Qstatus ) THEN
IF ( rec1.class = rec2.class ) THEN
IF ( rec1.deixis = rec2.deixis ) THEN
IF ( rec1.aspect = rec2.aspect ) THEN
IF ( rec1.retro = rec2.retro ) THEN
IF ( rec1.mood = rec2.mood ) THEN
IF ( rec1.thetaadv = rec2.thetaadv ) THEN
IF ( rec1.advpatterns = rec2.advpatterns ) THEN
IF ( rec1.prepkey = rec2.prepkey ) THEN
IF ( rec1.temporal = rec2.temporal ) THEN
IF ( rec1.possnietnp = rec2.possnietnp ) THEN
IF ( rec1.thanas = rec2.thanas ) THEN
result := TRUE;
EQUAL_BADVrecord:= result
END;
FUNCTION EQUAL_SUBADVrecord
(rec1,rec2:LSDOMAINT_SUBADVrecord):BOOLEAN;
VAR result:BOOLEAN;
BEGIN
result := FALSE;
IF ( rec1.req = rec2.req ) THEN
IF ( rec1.env = rec2.env ) THEN
IF ( rec1.comparatives = rec2.comparatives ) THEN
IF ( rec1.superlatives = rec2.superlatives ) THEN
IF ( rec1.subcs = rec2.subcs ) THEN
IF ( rec1.Qstatus = rec2.Qstatus ) THEN
IF ( rec1.class = rec2.class ) THEN
IF ( rec1.deixis = rec2.deixis ) THEN
IF ( rec1.aspect = rec2.aspect ) THEN
IF ( rec1.retro = rec2.retro ) THEN
IF ( rec1.mood = rec2.mood ) THEN
IF ( rec1.thetaadv = rec2.thetaadv ) THEN
IF ( rec1.advpatterns = rec2.advpatterns ) THEN
IF ( rec1.prepkey = rec2.prepkey ) THEN
IF ( rec1.temporal = rec2.temporal ) THEN
IF ( rec1.possnietnp = rec2.possnietnp ) THEN
IF ( rec1.thanas = rec2.thanas ) THEN
IF ( rec1.lastaffix = rec2.lastaffix ) THEN
IF ( rec1.Radvb = rec2.Radvb ) THEN
result := TRUE;
EQUAL_SUBADVrecord:= result
END;
FUNCTION EQUAL_ADVrecord
(rec1,rec2:LSDOMAINT_ADVrecord):BOOLEAN;
VAR result:BOOLEAN;
BEGIN
result := FALSE;
IF ( rec1.req = rec2.req ) THEN
IF ( rec1.env = rec2.env ) THEN
IF ( rec1.comparatives = rec2.comparatives ) THEN
IF ( rec1.superlatives = rec2.superlatives ) THEN
IF ( rec1.subcs = rec2.subcs ) THEN
IF ( rec1.Qstatus = rec2.Qstatus ) THEN
IF ( rec1.form = rec2.form ) THEN
IF ( rec1.eORenForm = rec2.eORenForm ) THEN
IF ( rec1.class = rec2.class ) THEN
IF ( rec1.deixis = rec2.deixis ) THEN
IF ( rec1.aspect = rec2.aspect ) THEN
IF ( rec1.retro = rec2.retro ) THEN
IF ( rec1.mood = rec2.mood ) THEN
IF ( rec1.thetaadv = rec2.thetaadv ) THEN
IF ( rec1.advpatterns = rec2.advpatterns ) THEN
IF ( rec1.prepkey = rec2.prepkey ) THEN
IF ( rec1.temporal = rec2.temporal ) THEN
IF ( rec1.possnietnp = rec2.possnietnp ) THEN
IF ( rec1.thanas = rec2.thanas ) THEN
IF ( rec1.Radvb = rec2.Radvb ) THEN
result := TRUE;
EQUAL_ADVrecord:= result
END;
FUNCTION EQUAL_ADVPrecord
(rec1,rec2:LSDOMAINT_ADVPrecord):BOOLEAN;
VAR result:BOOLEAN;
BEGIN
result := FALSE;
IF ( rec1.req = rec2.req ) THEN
IF ( rec1.env = rec2.env ) THEN
IF ( rec1.class = rec2.class ) THEN
IF ( rec1.deixis = rec2.deixis ) THEN
IF ( rec1.aspect = rec2.aspect ) THEN
IF ( rec1.retro = rec2.retro ) THEN
IF ( rec1.superdeixis = rec2.superdeixis ) THEN
IF ( rec1.actsubcefs = rec2.actsubcefs ) THEN
IF ( rec1.Qstatus = rec2.Qstatus ) THEN
IF ( rec1.mood = rec2.mood ) THEN
IF ( rec1.thetaadv = rec2.thetaadv ) THEN
IF ( rec1.advpatternefs = rec2.advpatternefs ) THEN
IF ( rec1.temporal = rec2.temporal ) THEN
IF ( rec1.Radvb = rec2.Radvb ) THEN
IF ( rec1.possnietnp = rec2.possnietnp ) THEN
IF ( rec1.thanas = rec2.thanas ) THEN
IF ( rec1.thanascompl = rec2.thanascompl ) THEN
IF ( rec1.coord = rec2.coord ) THEN
result := TRUE;
EQUAL_ADVPrecord:= result
END;
FUNCTION EQUAL_ADVPVARrecord
(rec1,rec2:LSDOMAINT_ADVPVARrecord):BOOLEAN;
VAR result:BOOLEAN;
BEGIN
result := FALSE;
IF ( rec1.req = rec2.req ) THEN
IF ( rec1.env = rec2.env ) THEN
IF ( rec1.class = rec2.class ) THEN
IF ( rec1.deixis = rec2.deixis ) THEN
IF ( rec1.aspect = rec2.aspect ) THEN
IF ( rec1.retro = rec2.retro ) THEN
IF ( rec1.superdeixis = rec2.superdeixis ) THEN
IF ( rec1.actsubcefs = rec2.actsubcefs ) THEN
IF ( rec1.Qstatus = rec2.Qstatus ) THEN
IF ( rec1.mood = rec2.mood ) THEN
IF ( rec1.thetaadv = rec2.thetaadv ) THEN
IF ( rec1.advpatternefs = rec2.advpatternefs ) THEN
IF ( rec1.temporal = rec2.temporal ) THEN
IF ( rec1.Radvb = rec2.Radvb ) THEN
IF ( rec1.possnietnp = rec2.possnietnp ) THEN
IF ( rec1.thanas = rec2.thanas ) THEN
IF ( rec1.thanascompl = rec2.thanascompl ) THEN
IF ( rec1.coord = rec2.coord ) THEN
result := TRUE;
EQUAL_ADVPVARrecord:= result
END;
FUNCTION EQUAL_ADVPPROPrecord
(rec1,rec2:LSDOMAINT_ADVPPROPrecord):BOOLEAN;
VAR result:BOOLEAN;
BEGIN
result := FALSE;
IF ( rec1.req = rec2.req ) THEN
IF ( rec1.env = rec2.env ) THEN
IF ( rec1.class = rec2.class ) THEN
IF ( rec1.deixis = rec2.deixis ) THEN
IF ( rec1.aspect = rec2.aspect ) THEN
IF ( rec1.retro = rec2.retro ) THEN
IF ( rec1.aktionsarts = rec2.aktionsarts ) THEN
IF ( rec1.superdeixis = rec2.superdeixis ) THEN
IF ( rec1.actsubcefs = rec2.actsubcefs ) THEN
IF ( rec1.Qstatus = rec2.Qstatus ) THEN
IF ( rec1.thetaadv = rec2.thetaadv ) THEN
IF ( rec1.advpatternefs = rec2.advpatternefs ) THEN
IF ( rec1.PROsubject = rec2.PROsubject ) THEN
IF ( rec1.mood = rec2.mood ) THEN
IF ( rec1.temporal = rec2.temporal ) THEN
IF ( rec1.Radvb = rec2.Radvb ) THEN
IF ( rec1.thanascompl = rec2.thanascompl ) THEN
result := TRUE;
EQUAL_ADVPPROPrecord:= result
END;
FUNCTION EQUAL_ADVPPROPVARrecord
(rec1,rec2:LSDOMAINT_ADVPPROPVARrecord):BOOLEAN;
VAR result:BOOLEAN;
BEGIN
result := FALSE;
IF ( rec1.req = rec2.req ) THEN
IF ( rec1.env = rec2.env ) THEN
IF ( rec1.class = rec2.class ) THEN
IF ( rec1.deixis = rec2.deixis ) THEN
IF ( rec1.aspect = rec2.aspect ) THEN
IF ( rec1.retro = rec2.retro ) THEN
IF ( rec1.aktionsarts = rec2.aktionsarts ) THEN
IF ( rec1.superdeixis = rec2.superdeixis ) THEN
IF ( rec1.actsubcefs = rec2.actsubcefs ) THEN
IF ( rec1.Qstatus = rec2.Qstatus ) THEN
IF ( rec1.thetaadv = rec2.thetaadv ) THEN
IF ( rec1.advpatternefs = rec2.advpatternefs ) THEN
IF ( rec1.PROsubject = rec2.PROsubject ) THEN
IF ( rec1.mood = rec2.mood ) THEN
IF ( rec1.temporal = rec2.temporal ) THEN
IF ( rec1.Radvb = rec2.Radvb ) THEN
IF ( rec1.thanascompl = rec2.thanascompl ) THEN
result := TRUE;
EQUAL_ADVPPROPVARrecord:= result
END;
FUNCTION EQUAL_RADVrecord
(rec1,rec2:LSDOMAINT_RADVrecord):BOOLEAN;
VAR result:BOOLEAN;
BEGIN
result := FALSE;
IF ( rec1.req = rec2.req ) THEN
IF ( rec1.env = rec2.env ) THEN
IF ( rec1.mood = rec2.mood ) THEN
result := TRUE;
EQUAL_RADVrecord:= result
END;
FUNCTION EQUAL_RADVPrecord
(rec1,rec2:LSDOMAINT_RADVPrecord):BOOLEAN;
VAR result:BOOLEAN;
BEGIN
result := FALSE;
IF ( rec1.req = rec2.req ) THEN
IF ( rec1.env = rec2.env ) THEN
IF ( rec1.mood = rec2.mood ) THEN
IF ( rec1.kindefs = rec2.kindefs ) THEN
IF ( rec1.radvkey = rec2.radvkey ) THEN
result := TRUE;
EQUAL_RADVPrecord:= result
END;
FUNCTION EQUAL_ARTrecord
(rec1,rec2:LSDOMAINT_ARTrecord):BOOLEAN;
VAR result:BOOLEAN;
BEGIN
result := FALSE;
IF ( rec1.definite = rec2.definite ) THEN
IF ( rec1.possnumbers = rec2.possnumbers ) THEN
IF ( rec1.posscomas = rec2.posscomas ) THEN
result := TRUE;
EQUAL_ARTrecord:= result
END;
FUNCTION EQUAL_ASPrecord
(rec1,rec2:LSDOMAINT_ASPrecord):BOOLEAN;
VAR result:BOOLEAN;
BEGIN
result := FALSE;
IF ( rec1.req = rec2.req ) THEN
IF ( rec1.env = rec2.env ) THEN
IF ( rec1.thanas = rec2.thanas ) THEN
result := TRUE;
EQUAL_ASPrecord:= result
END;
FUNCTION EQUAL_CARDrecord
(rec1,rec2:LSDOMAINT_CARDrecord):BOOLEAN;
VAR result:BOOLEAN;
BEGIN
result := FALSE;
IF ( rec1.possnumbers = rec2.possnumbers ) THEN
result := TRUE;
EQUAL_CARDrecord:= result
END;
FUNCTION EQUAL_CLAUSErecord
(rec1,rec2:LSDOMAINT_CLAUSErecord):BOOLEAN;
VAR result:BOOLEAN;
BEGIN
result := FALSE;
IF ( rec1.req = rec2.req ) THEN
IF ( rec1.env = rec2.env ) THEN
IF ( rec1.voice = rec2.voice ) THEN
IF ( rec1.PROsubject = rec2.PROsubject ) THEN
IF ( rec1.synvpefs = rec2.synvpefs ) THEN
IF ( rec1.thetavp = rec2.thetavp ) THEN
IF ( rec1.adjuncts = rec2.adjuncts ) THEN
IF ( rec1.modus = rec2.modus ) THEN
IF ( rec1.aktionsarts = rec2.aktionsarts ) THEN
IF ( rec1.aspect = rec2.aspect ) THEN
IF ( rec1.deixis = rec2.deixis ) THEN
IF ( rec1.retro = rec2.retro ) THEN
IF ( rec1.finiteness = rec2.finiteness ) THEN
IF ( rec1.infsort = rec2.infsort ) THEN
IF ( rec1.superdeixis = rec2.superdeixis ) THEN
IF ( rec1.VRcompl = rec2.VRcompl ) THEN
result := TRUE;
EQUAL_CLAUSErecord:= result
END;
FUNCTION EQUAL_CLAUSEVARrecord
(rec1,rec2:LSDOMAINT_CLAUSEVARrecord):BOOLEAN;
VAR result:BOOLEAN;
BEGIN
result := FALSE;
IF ( rec1.req = rec2.req ) THEN
IF ( rec1.env = rec2.env ) THEN
IF ( rec1.voice = rec2.voice ) THEN
IF ( rec1.PROsubject = rec2.PROsubject ) THEN
IF ( rec1.synvpefs = rec2.synvpefs ) THEN
IF ( rec1.thetavp = rec2.thetavp ) THEN
IF ( rec1.adjuncts = rec2.adjuncts ) THEN
IF ( rec1.modus = rec2.modus ) THEN
IF ( rec1.aktionsarts = rec2.aktionsarts ) THEN
IF ( rec1.aspect = rec2.aspect ) THEN
IF ( rec1.deixis = rec2.deixis ) THEN
IF ( rec1.retro = rec2.retro ) THEN
IF ( rec1.finiteness = rec2.finiteness ) THEN
IF ( rec1.infsort = rec2.infsort ) THEN
IF ( rec1.superdeixis = rec2.superdeixis ) THEN
IF ( rec1.VRcompl = rec2.VRcompl ) THEN
result := TRUE;
EQUAL_CLAUSEVARrecord:= result
END;
FUNCTION EQUAL_CONJrecord
(rec1,rec2:LSDOMAINT_CONJrecord):BOOLEAN;
VAR result:BOOLEAN;
BEGIN
result := FALSE;
IF ( rec1.req = rec2.req ) THEN
IF ( rec1.env = rec2.env ) THEN
IF ( rec1.class = rec2.class ) THEN
IF ( rec1.deixis = rec2.deixis ) THEN
IF ( rec1.aspect = rec2.aspect ) THEN
IF ( rec1.retro = rec2.retro ) THEN
IF ( rec1.conjpatterns = rec2.conjpatterns ) THEN
IF ( rec1.adverbial = rec2.adverbial ) THEN
IF ( rec1.temporal = rec2.temporal ) THEN
IF ( rec1.distri = rec2.distri ) THEN
result := TRUE;
EQUAL_CONJrecord:= result
END;
FUNCTION EQUAL_COORDrecord
(rec1,rec2:LSDOMAINT_COORDrecord):BOOLEAN;
VAR result:BOOLEAN;
BEGIN
result := FALSE;
IF ( rec1.kinds = rec2.kinds ) THEN
IF ( rec1.iteration = rec2.iteration ) THEN
IF ( rec1.correlative2key = rec2.correlative2key ) THEN
IF ( rec1.patterns = rec2.patterns ) THEN
IF ( rec1.inducednumbers = rec2.inducednumbers ) THEN
IF ( rec1.Sintroducer = rec2.Sintroducer ) THEN
IF ( rec1.req = rec2.req ) THEN
IF ( rec1.env = rec2.env ) THEN
result := TRUE;
EQUAL_COORDrecord:= result
END;
FUNCTION EQUAL_DEMADJrecord
(rec1,rec2:LSDOMAINT_DEMADJrecord):BOOLEAN;
VAR result:BOOLEAN;
BEGIN
result := FALSE;
result := TRUE;
EQUAL_DEMADJrecord:= result
END;
FUNCTION EQUAL_DEMPROrecord
(rec1,rec2:LSDOMAINT_DEMPROrecord):BOOLEAN;
VAR result:BOOLEAN;
BEGIN
result := FALSE;
IF ( rec1.sexes = rec2.sexes ) THEN
IF ( rec1.number = rec2.number ) THEN
result := TRUE;
EQUAL_DEMPROrecord:= result
END;
FUNCTION EQUAL_BDETrecord
(rec1,rec2:LSDOMAINT_BDETrecord):BOOLEAN;
VAR result:BOOLEAN;
BEGIN
result := FALSE;
IF ( rec1.req = rec2.req ) THEN
IF ( rec1.env = rec2.env ) THEN
IF ( rec1.possnietnp = rec2.possnietnp ) THEN
IF ( rec1.definite = rec2.definite ) THEN
IF ( rec1.posspred = rec2.posspred ) THEN
IF ( rec1.possnumbers = rec2.possnumbers ) THEN
IF ( rec1.posscomas = rec2.posscomas ) THEN
IF ( rec1.mood = rec2.mood ) THEN
IF ( rec1.eFormation = rec2.eFormation ) THEN
IF ( rec1.enFormation = rec2.enFormation ) THEN
IF ( rec1.syntquant = rec2.syntquant ) THEN
result := TRUE;
EQUAL_BDETrecord:= result
END;
FUNCTION EQUAL_DETrecord
(rec1,rec2:LSDOMAINT_DETrecord):BOOLEAN;
VAR result:BOOLEAN;
BEGIN
result := FALSE;
IF ( rec1.req = rec2.req ) THEN
IF ( rec1.env = rec2.env ) THEN
IF ( rec1.possnietnp = rec2.possnietnp ) THEN
IF ( rec1.definite = rec2.definite ) THEN
IF ( rec1.posspred = rec2.posspred ) THEN
IF ( rec1.possnumbers = rec2.possnumbers ) THEN
IF ( rec1.posscomas = rec2.posscomas ) THEN
IF ( rec1.mood = rec2.mood ) THEN
IF ( rec1.eFormation = rec2.eFormation ) THEN
IF ( rec1.enFormation = rec2.enFormation ) THEN
IF ( rec1.eORenForm = rec2.eORenForm ) THEN
IF ( rec1.syntquant = rec2.syntquant ) THEN
result := TRUE;
EQUAL_DETrecord:= result
END;
FUNCTION EQUAL_DETPrecord
(rec1,rec2:LSDOMAINT_DETPrecord):BOOLEAN;
VAR result:BOOLEAN;
BEGIN
result := FALSE;
IF ( rec1.req = rec2.req ) THEN
IF ( rec1.env = rec2.env ) THEN
IF ( rec1.possnietnp = rec2.possnietnp ) THEN
IF ( rec1.definite = rec2.definite ) THEN
IF ( rec1.posspred = rec2.posspred ) THEN
IF ( rec1.possnumbers = rec2.possnumbers ) THEN
IF ( rec1.posscomas = rec2.posscomas ) THEN
IF ( rec1.mood = rec2.mood ) THEN
IF ( rec1.eORenForm = rec2.eORenForm ) THEN
IF ( rec1.syntquant = rec2.syntquant ) THEN
IF ( rec1.possgenders = rec2.possgenders ) THEN
IF ( rec1.superdeixis = rec2.superdeixis ) THEN
result := TRUE;
EQUAL_DETPrecord:= result
END;
FUNCTION EQUAL_DIGITrecord
(rec1,rec2:LSDOMAINT_DIGITrecord):BOOLEAN;
VAR result:BOOLEAN;
BEGIN
result := FALSE;
IF ( rec1.valeu = rec2.valeu ) THEN
result := TRUE;
EQUAL_DIGITrecord:= result
END;
FUNCTION EQUAL_EMPTYrecord
(rec1,rec2:LSDOMAINT_EMPTYrecord):BOOLEAN;
VAR result:BOOLEAN;
BEGIN
result := FALSE;
IF ( rec1.person = rec2.person ) THEN
IF ( rec1.number = rec2.number ) THEN
result := TRUE;
EQUAL_EMPTYrecord:= result
END;
FUNCTION EQUAL_EMPTYVARrecord
(rec1,rec2:LSDOMAINT_EMPTYVARrecord):BOOLEAN;
VAR result:BOOLEAN;
BEGIN
result := FALSE;
IF ( rec1.person = rec2.person ) THEN
IF ( rec1.number = rec2.number ) THEN
result := TRUE;
EQUAL_EMPTYVARrecord:= result
END;
FUNCTION EQUAL_ECrecord
(rec1,rec2:LSDOMAINT_ECrecord):BOOLEAN;
VAR result:BOOLEAN;
BEGIN
result := FALSE;
result := TRUE;
EQUAL_ECrecord:= result
END;
FUNCTION EQUAL_ENrecord
(rec1,rec2:LSDOMAINT_ENrecord):BOOLEAN;
VAR result:BOOLEAN;
BEGIN
result := FALSE;
result := TRUE;
EQUAL_ENrecord:= result
END;
FUNCTION EQUAL_EXCLAMrecord
(rec1,rec2:LSDOMAINT_EXCLAMrecord):BOOLEAN;
VAR result:BOOLEAN;
BEGIN
result := FALSE;
result := TRUE;
EQUAL_EXCLAMrecord:= result
END;
FUNCTION EQUAL_BINDEFPROrecord
(rec1,rec2:LSDOMAINT_BINDEFPROrecord):BOOLEAN;
VAR result:BOOLEAN;
BEGIN
result := FALSE;
IF ( rec1.req = rec2.req ) THEN
IF ( rec1.env = rec2.env ) THEN
IF ( rec1.definite = rec2.definite ) THEN
IF ( rec1.number = rec2.number ) THEN
IF ( rec1.possgeni = rec2.possgeni ) THEN
IF ( rec1.possnietNP = rec2.possnietNP ) THEN
IF ( rec1.syntquant = rec2.syntquant ) THEN
IF ( rec1.animate = rec2.animate ) THEN
IF ( rec1.possRform = rec2.possRform ) THEN
IF ( rec1.NPhead = rec2.NPhead ) THEN
result := TRUE;
EQUAL_BINDEFPROrecord:= result
END;
FUNCTION EQUAL_INDEFPROrecord
(rec1,rec2:LSDOMAINT_INDEFPROrecord):BOOLEAN;
VAR result:BOOLEAN;
BEGIN
result := FALSE;
IF ( rec1.req = rec2.req ) THEN
IF ( rec1.env = rec2.env ) THEN
IF ( rec1.definite = rec2.definite ) THEN
IF ( rec1.number = rec2.number ) THEN
IF ( rec1.possgeni = rec2.possgeni ) THEN
IF ( rec1.possnietNP = rec2.possnietNP ) THEN
IF ( rec1.syntquant = rec2.syntquant ) THEN
IF ( rec1.animate = rec2.animate ) THEN
IF ( rec1.possRform = rec2.possRform ) THEN
IF ( rec1.geni = rec2.geni ) THEN
IF ( rec1.NPhead = rec2.NPhead ) THEN
result := TRUE;
EQUAL_INDEFPROrecord:= result
END;
FUNCTION EQUAL_NEGrecord
(rec1,rec2:LSDOMAINT_NEGrecord):BOOLEAN;
VAR result:BOOLEAN;
BEGIN
result := FALSE;
result := TRUE;
EQUAL_NEGrecord:= result
END;
FUNCTION EQUAL_BNOUNrecord
(rec1,rec2:LSDOMAINT_BNOUNrecord):BOOLEAN;
VAR result:BOOLEAN;
BEGIN
result := FALSE;
IF ( rec1.req = rec2.req ) THEN
IF ( rec1.env = rec2.env ) THEN
IF ( rec1.dimforms = rec2.dimforms ) THEN
IF ( rec1.pluralforms = rec2.pluralforms ) THEN
IF ( rec1.genders = rec2.genders ) THEN
IF ( rec1.class = rec2.class ) THEN
IF ( rec1.deixis = rec2.deixis ) THEN
IF ( rec1.aspect = rec2.aspect ) THEN
IF ( rec1.retro = rec2.retro ) THEN
IF ( rec1.sexes = rec2.sexes ) THEN
IF ( rec1.subcs = rec2.subcs ) THEN
IF ( rec1.temporal = rec2.temporal ) THEN
IF ( rec1.possgeni = rec2.possgeni ) THEN
IF ( rec1.animate = rec2.animate ) THEN
IF ( rec1.human = rec2.human ) THEN
IF ( rec1.posscomas = rec2.posscomas ) THEN
IF ( rec1.thetanp = rec2.thetanp ) THEN
IF ( rec1.nounpatterns = rec2.nounpatterns ) THEN
IF ( rec1.prepkey = rec2.prepkey ) THEN
IF ( rec1.personal = rec2.personal ) THEN
result := TRUE;
EQUAL_BNOUNrecord:= result
END;
FUNCTION EQUAL_SUBNOUNrecord
(rec1,rec2:LSDOMAINT_SUBNOUNrecord):BOOLEAN;
VAR result:BOOLEAN;
BEGIN
result := FALSE;
IF ( rec1.req = rec2.req ) THEN
IF ( rec1.env = rec2.env ) THEN
IF ( rec1.dimforms = rec2.dimforms ) THEN
IF ( rec1.pluralforms = rec2.pluralforms ) THEN
IF ( rec1.genders = rec2.genders ) THEN
IF ( rec1.class = rec2.class ) THEN
IF ( rec1.deixis = rec2.deixis ) THEN
IF ( rec1.aspect = rec2.aspect ) THEN
IF ( rec1.retro = rec2.retro ) THEN
IF ( rec1.sexes = rec2.sexes ) THEN
IF ( rec1.subcs = rec2.subcs ) THEN
IF ( rec1.temporal = rec2.temporal ) THEN
IF ( rec1.possgeni = rec2.possgeni ) THEN
IF ( rec1.animate = rec2.animate ) THEN
IF ( rec1.human = rec2.human ) THEN
IF ( rec1.posscomas = rec2.posscomas ) THEN
IF ( rec1.thetanp = rec2.thetanp ) THEN
IF ( rec1.nounpatterns = rec2.nounpatterns ) THEN
IF ( rec1.prepkey = rec2.prepkey ) THEN
IF ( rec1.personal = rec2.personal ) THEN
IF ( rec1.lastaffix = rec2.lastaffix ) THEN
result := TRUE;
EQUAL_SUBNOUNrecord:= result
END;
FUNCTION EQUAL_NOUNrecord
(rec1,rec2:LSDOMAINT_NOUNrecord):BOOLEAN;
VAR result:BOOLEAN;
BEGIN
result := FALSE;
IF ( rec1.req = rec2.req ) THEN
IF ( rec1.env = rec2.env ) THEN
IF ( rec1.dimforms = rec2.dimforms ) THEN
IF ( rec1.pluralforms = rec2.pluralforms ) THEN
IF ( rec1.genders = rec2.genders ) THEN
IF ( rec1.number = rec2.number ) THEN
IF ( rec1.geni = rec2.geni ) THEN
IF ( rec1.class = rec2.class ) THEN
IF ( rec1.deixis = rec2.deixis ) THEN
IF ( rec1.aspect = rec2.aspect ) THEN
IF ( rec1.retro = rec2.retro ) THEN
IF ( rec1.sexes = rec2.sexes ) THEN
IF ( rec1.subcs = rec2.subcs ) THEN
IF ( rec1.temporal = rec2.temporal ) THEN
IF ( rec1.possgeni = rec2.possgeni ) THEN
IF ( rec1.animate = rec2.animate ) THEN
IF ( rec1.human = rec2.human ) THEN
IF ( rec1.posscomas = rec2.posscomas ) THEN
IF ( rec1.thetanp = rec2.thetanp ) THEN
IF ( rec1.nounpatterns = rec2.nounpatterns ) THEN
IF ( rec1.prepkey = rec2.prepkey ) THEN
IF ( rec1.personal = rec2.personal ) THEN
result := TRUE;
EQUAL_NOUNrecord:= result
END;
FUNCTION EQUAL_CNrecord
(rec1,rec2:LSDOMAINT_CNrecord):BOOLEAN;
VAR result:BOOLEAN;
BEGIN
result := FALSE;
IF ( rec1.req = rec2.req ) THEN
IF ( rec1.env = rec2.env ) THEN
IF ( rec1.superdeixis = rec2.superdeixis ) THEN
IF ( rec1.class = rec2.class ) THEN
IF ( rec1.deixis = rec2.deixis ) THEN
IF ( rec1.aspect = rec2.aspect ) THEN
IF ( rec1.retro = rec2.retro ) THEN
IF ( rec1.definite = rec2.definite ) THEN
IF ( rec1.numbers = rec2.numbers ) THEN
IF ( rec1.cases = rec2.cases ) THEN
IF ( rec1.genders = rec2.genders ) THEN
IF ( rec1.sexes = rec2.sexes ) THEN
IF ( rec1.actsubcs = rec2.actsubcs ) THEN
IF ( rec1.temporal = rec2.temporal ) THEN
IF ( rec1.possgeni = rec2.possgeni ) THEN
IF ( rec1.animate = rec2.animate ) THEN
IF ( rec1.human = rec2.human ) THEN
IF ( rec1.posscomas = rec2.posscomas ) THEN
IF ( rec1.thetanp = rec2.thetanp ) THEN
IF ( rec1.nounpatternefs = rec2.nounpatternefs ) THEN
result := TRUE;
EQUAL_CNrecord:= result
END;
FUNCTION EQUAL_CNVARrecord
(rec1,rec2:LSDOMAINT_CNVARrecord):BOOLEAN;
VAR result:BOOLEAN;
BEGIN
result := FALSE;
IF ( rec1.req = rec2.req ) THEN
IF ( rec1.env = rec2.env ) THEN
IF ( rec1.superdeixis = rec2.superdeixis ) THEN
IF ( rec1.class = rec2.class ) THEN
IF ( rec1.deixis = rec2.deixis ) THEN
IF ( rec1.aspect = rec2.aspect ) THEN
IF ( rec1.retro = rec2.retro ) THEN
IF ( rec1.definite = rec2.definite ) THEN
IF ( rec1.numbers = rec2.numbers ) THEN
IF ( rec1.cases = rec2.cases ) THEN
IF ( rec1.genders = rec2.genders ) THEN
IF ( rec1.sexes = rec2.sexes ) THEN
IF ( rec1.actsubcs = rec2.actsubcs ) THEN
IF ( rec1.temporal = rec2.temporal ) THEN
IF ( rec1.possgeni = rec2.possgeni ) THEN
IF ( rec1.animate = rec2.animate ) THEN
IF ( rec1.human = rec2.human ) THEN
IF ( rec1.posscomas = rec2.posscomas ) THEN
IF ( rec1.thetanp = rec2.thetanp ) THEN
IF ( rec1.nounpatternefs = rec2.nounpatternefs ) THEN
result := TRUE;
EQUAL_CNVARrecord:= result
END;
FUNCTION EQUAL_NPrecord
(rec1,rec2:LSDOMAINT_NPrecord):BOOLEAN;
VAR result:BOOLEAN;
BEGIN
result := FALSE;
IF ( rec1.req = rec2.req ) THEN
IF ( rec1.env = rec2.env ) THEN
IF ( rec1.superdeixis = rec2.superdeixis ) THEN
IF ( rec1.class = rec2.class ) THEN
IF ( rec1.deixis = rec2.deixis ) THEN
IF ( rec1.aspect = rec2.aspect ) THEN
IF ( rec1.retro = rec2.retro ) THEN
IF ( rec1.definite = rec2.definite ) THEN
IF ( rec1.person = rec2.person ) THEN
IF ( rec1.number = rec2.number ) THEN
IF ( rec1.cases = rec2.cases ) THEN
IF ( rec1.genders = rec2.genders ) THEN
IF ( rec1.sexes = rec2.sexes ) THEN
IF ( rec1.actsubcs = rec2.actsubcs ) THEN
IF ( rec1.temporal = rec2.temporal ) THEN
IF ( rec1.possgeni = rec2.possgeni ) THEN
IF ( rec1.animate = rec2.animate ) THEN
IF ( rec1.human = rec2.human ) THEN
IF ( rec1.actcomas = rec2.actcomas ) THEN
IF ( rec1.thetanp = rec2.thetanp ) THEN
IF ( rec1.nounpatternefs = rec2.nounpatternefs ) THEN
IF ( rec1.posspred = rec2.posspred ) THEN
IF ( rec1.possnietnp = rec2.possnietnp ) THEN
IF ( rec1.mood = rec2.mood ) THEN
IF ( rec1.generic = rec2.generic ) THEN
IF ( rec1.possRform = rec2.possRform ) THEN
IF ( rec1.syntquant = rec2.syntquant ) THEN
IF ( rec1.NPhead = rec2.NPhead ) THEN
IF ( rec1.specQ = rec2.specQ ) THEN
IF ( rec1.coord = rec2.coord ) THEN
result := TRUE;
EQUAL_NPrecord:= result
END;
FUNCTION EQUAL_NPVARrecord
(rec1,rec2:LSDOMAINT_NPVARrecord):BOOLEAN;
VAR result:BOOLEAN;
BEGIN
result := FALSE;
IF ( rec1.req = rec2.req ) THEN
IF ( rec1.env = rec2.env ) THEN
IF ( rec1.superdeixis = rec2.superdeixis ) THEN
IF ( rec1.class = rec2.class ) THEN
IF ( rec1.deixis = rec2.deixis ) THEN
IF ( rec1.aspect = rec2.aspect ) THEN
IF ( rec1.retro = rec2.retro ) THEN
IF ( rec1.definite = rec2.definite ) THEN
IF ( rec1.person = rec2.person ) THEN
IF ( rec1.number = rec2.number ) THEN
IF ( rec1.cases = rec2.cases ) THEN
IF ( rec1.genders = rec2.genders ) THEN
IF ( rec1.sexes = rec2.sexes ) THEN
IF ( rec1.actsubcs = rec2.actsubcs ) THEN
IF ( rec1.temporal = rec2.temporal ) THEN
IF ( rec1.possgeni = rec2.possgeni ) THEN
IF ( rec1.animate = rec2.animate ) THEN
IF ( rec1.human = rec2.human ) THEN
IF ( rec1.actcomas = rec2.actcomas ) THEN
IF ( rec1.thetanp = rec2.thetanp ) THEN
IF ( rec1.nounpatternefs = rec2.nounpatternefs ) THEN
IF ( rec1.posspred = rec2.posspred ) THEN
IF ( rec1.possnietnp = rec2.possnietnp ) THEN
IF ( rec1.mood = rec2.mood ) THEN
IF ( rec1.generic = rec2.generic ) THEN
IF ( rec1.possRform = rec2.possRform ) THEN
IF ( rec1.syntquant = rec2.syntquant ) THEN
IF ( rec1.NPhead = rec2.NPhead ) THEN
IF ( rec1.specQ = rec2.specQ ) THEN
IF ( rec1.coord = rec2.coord ) THEN
result := TRUE;
EQUAL_NPVARrecord:= result
END;
FUNCTION EQUAL_NPPROPrecord
(rec1,rec2:LSDOMAINT_NPPROPrecord):BOOLEAN;
VAR result:BOOLEAN;
BEGIN
result := FALSE;
IF ( rec1.req = rec2.req ) THEN
IF ( rec1.env = rec2.env ) THEN
IF ( rec1.superdeixis = rec2.superdeixis ) THEN
IF ( rec1.aktionsarts = rec2.aktionsarts ) THEN
IF ( rec1.thetanp = rec2.thetanp ) THEN
IF ( rec1.nounpatternefs = rec2.nounpatternefs ) THEN
IF ( rec1.PROsubject = rec2.PROsubject ) THEN
result := TRUE;
EQUAL_NPPROPrecord:= result
END;
FUNCTION EQUAL_NPPROPVARrecord
(rec1,rec2:LSDOMAINT_NPPROPVARrecord):BOOLEAN;
VAR result:BOOLEAN;
BEGIN
result := FALSE;
IF ( rec1.req = rec2.req ) THEN
IF ( rec1.env = rec2.env ) THEN
IF ( rec1.superdeixis = rec2.superdeixis ) THEN
IF ( rec1.aktionsarts = rec2.aktionsarts ) THEN
IF ( rec1.thetanp = rec2.thetanp ) THEN
IF ( rec1.nounpatternefs = rec2.nounpatternefs ) THEN
IF ( rec1.PROsubject = rec2.PROsubject ) THEN
result := TRUE;
EQUAL_NPPROPVARrecord:= result
END;
FUNCTION EQUAL_NUMrecord
(rec1,rec2:LSDOMAINT_NUMrecord):BOOLEAN;
VAR result:BOOLEAN;
BEGIN
result := FALSE;
IF ( rec1.enform = rec2.enform ) THEN
IF ( rec1.number = rec2.number ) THEN
result := TRUE;
EQUAL_NUMrecord:= result
END;
FUNCTION EQUAL_ORDINALrecord
(rec1,rec2:LSDOMAINT_ORDINALrecord):BOOLEAN;
VAR result:BOOLEAN;
BEGIN
result := FALSE;
result := TRUE;
EQUAL_ORDINALrecord:= result
END;
FUNCTION EQUAL_PARTICLErecord
(rec1,rec2:LSDOMAINT_PARTICLErecord):BOOLEAN;
VAR result:BOOLEAN;
BEGIN
result := FALSE;
result := TRUE;
EQUAL_PARTICLErecord:= result
END;
FUNCTION EQUAL_BIGPROrecord
(rec1,rec2:LSDOMAINT_BIGPROrecord):BOOLEAN;
VAR result:BOOLEAN;
BEGIN
result := FALSE;
IF ( rec1.number = rec2.number ) THEN
IF ( rec1.gender = rec2.gender ) THEN
IF ( rec1.person = rec2.person ) THEN
IF ( rec1.animate = rec2.animate ) THEN
IF ( rec1.possRform = rec2.possRform ) THEN
IF ( rec1.generalized = rec2.generalized ) THEN
IF ( rec1.NPhead = rec2.NPhead ) THEN
IF ( rec1.antecedent = rec2.antecedent ) THEN
result := TRUE;
EQUAL_BIGPROrecord:= result
END;
FUNCTION EQUAL_BPERSPROrecord
(rec1,rec2:LSDOMAINT_BPERSPROrecord):BOOLEAN;
VAR result:BOOLEAN;
BEGIN
result := FALSE;
IF ( rec1.number = rec2.number ) THEN
IF ( rec1.gender = rec2.gender ) THEN
IF ( rec1.person = rec2.person ) THEN
IF ( rec1.animate = rec2.animate ) THEN
IF ( rec1.possRform = rec2.possRform ) THEN
IF ( rec1.generalized = rec2.generalized ) THEN
IF ( rec1.NPhead = rec2.NPhead ) THEN
result := TRUE;
EQUAL_BPERSPROrecord:= result
END;
FUNCTION EQUAL_PERSPROrecord
(rec1,rec2:LSDOMAINT_PERSPROrecord):BOOLEAN;
VAR result:BOOLEAN;
BEGIN
result := FALSE;
IF ( rec1.number = rec2.number ) THEN
IF ( rec1.gender = rec2.gender ) THEN
IF ( rec1.person = rec2.person ) THEN
IF ( rec1.animate = rec2.animate ) THEN
IF ( rec1.possRform = rec2.possRform ) THEN
IF ( rec1.generalized = rec2.generalized ) THEN
IF ( rec1.NPhead = rec2.NPhead ) THEN
IF ( rec1.reduced = rec2.reduced ) THEN
IF ( rec1.persprocases = rec2.persprocases ) THEN
result := TRUE;
EQUAL_PERSPROrecord:= result
END;
FUNCTION EQUAL_POSrecord
(rec1,rec2:LSDOMAINT_POSrecord):BOOLEAN;
VAR result:BOOLEAN;
BEGIN
result := FALSE;
result := TRUE;
EQUAL_POSrecord:= result
END;
FUNCTION EQUAL_POSSADJrecord
(rec1,rec2:LSDOMAINT_POSSADJrecord):BOOLEAN;
VAR result:BOOLEAN;
BEGIN
result := FALSE;
IF ( rec1.antecedent = rec2.antecedent ) THEN
IF ( rec1.eORenForm = rec2.eORenForm ) THEN
IF ( rec1.reduced = rec2.reduced ) THEN
IF ( rec1.mood = rec2.mood ) THEN
IF ( rec1.geni = rec2.geni ) THEN
result := TRUE;
EQUAL_POSSADJrecord:= result
END;
FUNCTION EQUAL_POSSPROrecord
(rec1,rec2:LSDOMAINT_POSSPROrecord):BOOLEAN;
VAR result:BOOLEAN;
BEGIN
result := FALSE;
IF ( rec1.nForm = rec2.nForm ) THEN
result := TRUE;
EQUAL_POSSPROrecord:= result
END;
FUNCTION EQUAL_PREPrecord
(rec1,rec2:LSDOMAINT_PREPrecord):BOOLEAN;
VAR result:BOOLEAN;
BEGIN
result := FALSE;
IF ( rec1.req = rec2.req ) THEN
IF ( rec1.env = rec2.env ) THEN
IF ( rec1.subcs = rec2.subcs ) THEN
IF ( rec1.preptype = rec2.preptype ) THEN
IF ( rec1.postpkey = rec2.postpkey ) THEN
IF ( rec1.synpps = rec2.synpps ) THEN
IF ( rec1.thetapp = rec2.thetapp ) THEN
IF ( rec1.postform = rec2.postform ) THEN
IF ( rec1.class = rec2.class ) THEN
IF ( rec1.deixis = rec2.deixis ) THEN
IF ( rec1.aspect = rec2.aspect ) THEN
IF ( rec1.retro = rec2.retro ) THEN
IF ( rec1.secondprep = rec2.secondprep ) THEN
result := TRUE;
EQUAL_PREPrecord:= result
END;
FUNCTION EQUAL_PREPPrecord
(rec1,rec2:LSDOMAINT_PREPPrecord):BOOLEAN;
VAR result:BOOLEAN;
BEGIN
result := FALSE;
IF ( rec1.req = rec2.req ) THEN
IF ( rec1.env = rec2.env ) THEN
IF ( rec1.mood = rec2.mood ) THEN
IF ( rec1.actsubcefs = rec2.actsubcefs ) THEN
IF ( rec1.synppefs = rec2.synppefs ) THEN
IF ( rec1.thetapp = rec2.thetapp ) THEN
IF ( rec1.headkey = rec2.headkey ) THEN
IF ( rec1.class = rec2.class ) THEN
IF ( rec1.deixis = rec2.deixis ) THEN
IF ( rec1.aspect = rec2.aspect ) THEN
IF ( rec1.retro = rec2.retro ) THEN
IF ( rec1.superdeixis = rec2.superdeixis ) THEN
IF ( rec1.radvkey = rec2.radvkey ) THEN
IF ( rec1.stranded = rec2.stranded ) THEN
IF ( rec1.specQ = rec2.specQ ) THEN
IF ( rec1.coord = rec2.coord ) THEN
result := TRUE;
EQUAL_PREPPrecord:= result
END;
FUNCTION EQUAL_PREPPVARrecord
(rec1,rec2:LSDOMAINT_PREPPVARrecord):BOOLEAN;
VAR result:BOOLEAN;
BEGIN
result := FALSE;
IF ( rec1.req = rec2.req ) THEN
IF ( rec1.env = rec2.env ) THEN
IF ( rec1.mood = rec2.mood ) THEN
IF ( rec1.actsubcefs = rec2.actsubcefs ) THEN
IF ( rec1.synppefs = rec2.synppefs ) THEN
IF ( rec1.thetapp = rec2.thetapp ) THEN
IF ( rec1.headkey = rec2.headkey ) THEN
IF ( rec1.class = rec2.class ) THEN
IF ( rec1.deixis = rec2.deixis ) THEN
IF ( rec1.aspect = rec2.aspect ) THEN
IF ( rec1.retro = rec2.retro ) THEN
IF ( rec1.superdeixis = rec2.superdeixis ) THEN
IF ( rec1.radvkey = rec2.radvkey ) THEN
IF ( rec1.stranded = rec2.stranded ) THEN
IF ( rec1.specQ = rec2.specQ ) THEN
IF ( rec1.coord = rec2.coord ) THEN
result := TRUE;
EQUAL_PREPPVARrecord:= result
END;
FUNCTION EQUAL_PREPPPROPrecord
(rec1,rec2:LSDOMAINT_PREPPPROPrecord):BOOLEAN;
VAR result:BOOLEAN;
BEGIN
result := FALSE;
IF ( rec1.req = rec2.req ) THEN
IF ( rec1.env = rec2.env ) THEN
IF ( rec1.mood = rec2.mood ) THEN
IF ( rec1.actsubcefs = rec2.actsubcefs ) THEN
IF ( rec1.PROsubject = rec2.PROsubject ) THEN
IF ( rec1.synppefs = rec2.synppefs ) THEN
IF ( rec1.thetapp = rec2.thetapp ) THEN
IF ( rec1.headkey = rec2.headkey ) THEN
IF ( rec1.class = rec2.class ) THEN
IF ( rec1.deixis = rec2.deixis ) THEN
IF ( rec1.aspect = rec2.aspect ) THEN
IF ( rec1.retro = rec2.retro ) THEN
IF ( rec1.aktionsarts = rec2.aktionsarts ) THEN
IF ( rec1.superdeixis = rec2.superdeixis ) THEN
IF ( rec1.specq = rec2.specq ) THEN
result := TRUE;
EQUAL_PREPPPROPrecord:= result
END;
FUNCTION EQUAL_PREPPPROPVARrecord
(rec1,rec2:LSDOMAINT_PREPPPROPVARrecord):BOOLEAN;
VAR result:BOOLEAN;
BEGIN
result := FALSE;
IF ( rec1.req = rec2.req ) THEN
IF ( rec1.env = rec2.env ) THEN
IF ( rec1.mood = rec2.mood ) THEN
IF ( rec1.actsubcefs = rec2.actsubcefs ) THEN
IF ( rec1.PROsubject = rec2.PROsubject ) THEN
IF ( rec1.synppefs = rec2.synppefs ) THEN
IF ( rec1.thetapp = rec2.thetapp ) THEN
IF ( rec1.headkey = rec2.headkey ) THEN
IF ( rec1.class = rec2.class ) THEN
IF ( rec1.deixis = rec2.deixis ) THEN
IF ( rec1.aspect = rec2.aspect ) THEN
IF ( rec1.retro = rec2.retro ) THEN
IF ( rec1.aktionsarts = rec2.aktionsarts ) THEN
IF ( rec1.superdeixis = rec2.superdeixis ) THEN
IF ( rec1.specq = rec2.specq ) THEN
result := TRUE;
EQUAL_PREPPPROPVARrecord:= result
END;
FUNCTION EQUAL_BPROPERNOUNrecord
(rec1,rec2:LSDOMAINT_BPROPERNOUNrecord):BOOLEAN;
VAR result:BOOLEAN;
BEGIN
result := FALSE;
IF ( rec1.genders = rec2.genders ) THEN
IF ( rec1.dimforms = rec2.dimforms ) THEN
IF ( rec1.pluralforms = rec2.pluralforms ) THEN
IF ( rec1.sexes = rec2.sexes ) THEN
IF ( rec1.subc = rec2.subc ) THEN
IF ( rec1.animate = rec2.animate ) THEN
IF ( rec1.human = rec2.human ) THEN
IF ( rec1.temporal = rec2.temporal ) THEN
IF ( rec1.class = rec2.class ) THEN
IF ( rec1.deixis = rec2.deixis ) THEN
IF ( rec1.aspect = rec2.aspect ) THEN
IF ( rec1.retro = rec2.retro ) THEN
IF ( rec1.possgeni = rec2.possgeni ) THEN
result := TRUE;
EQUAL_BPROPERNOUNrecord:= result
END;
FUNCTION EQUAL_PROPERNOUNrecord
(rec1,rec2:LSDOMAINT_PROPERNOUNrecord):BOOLEAN;
VAR result:BOOLEAN;
BEGIN
result := FALSE;
IF ( rec1.genders = rec2.genders ) THEN
IF ( rec1.number = rec2.number ) THEN
IF ( rec1.dimforms = rec2.dimforms ) THEN
IF ( rec1.pluralforms = rec2.pluralforms ) THEN
IF ( rec1.sexes = rec2.sexes ) THEN
IF ( rec1.subc = rec2.subc ) THEN
IF ( rec1.animate = rec2.animate ) THEN
IF ( rec1.human = rec2.human ) THEN
IF ( rec1.temporal = rec2.temporal ) THEN
IF ( rec1.class = rec2.class ) THEN
IF ( rec1.deixis = rec2.deixis ) THEN
IF ( rec1.aspect = rec2.aspect ) THEN
IF ( rec1.retro = rec2.retro ) THEN
IF ( rec1.possgeni = rec2.possgeni ) THEN
IF ( rec1.geni = rec2.geni ) THEN
result := TRUE;
EQUAL_PROPERNOUNrecord:= result
END;
FUNCTION EQUAL_PUNCrecord
(rec1,rec2:LSDOMAINT_PUNCrecord):BOOLEAN;
VAR result:BOOLEAN;
BEGIN
result := FALSE;
result := TRUE;
EQUAL_PUNCrecord:= result
END;
FUNCTION EQUAL_PROSENTrecord
(rec1,rec2:LSDOMAINT_PROSENTrecord):BOOLEAN;
VAR result:BOOLEAN;
BEGIN
result := FALSE;
IF ( rec1.so = rec2.so ) THEN
result := TRUE;
EQUAL_PROSENTrecord:= result
END;
FUNCTION EQUAL_PROSENTVARrecord
(rec1,rec2:LSDOMAINT_PROSENTVARrecord):BOOLEAN;
VAR result:BOOLEAN;
BEGIN
result := FALSE;
IF ( rec1.so = rec2.so ) THEN
result := TRUE;
EQUAL_PROSENTVARrecord:= result
END;
FUNCTION EQUAL_Qrecord
(rec1,rec2:LSDOMAINT_Qrecord):BOOLEAN;
VAR result:BOOLEAN;
BEGIN
result := FALSE;
IF ( rec1.req = rec2.req ) THEN
IF ( rec1.env = rec2.env ) THEN
IF ( rec1.definite = rec2.definite ) THEN
IF ( rec1.posspred = rec2.posspred ) THEN
IF ( rec1.possnumbers = rec2.possnumbers ) THEN
IF ( rec1.posscomas = rec2.posscomas ) THEN
IF ( rec1.mood = rec2.mood ) THEN
IF ( rec1.thanas = rec2.thanas ) THEN
IF ( rec1.hop = rec2.hop ) THEN
result := TRUE;
EQUAL_Qrecord:= result
END;
FUNCTION EQUAL_QPrecord
(rec1,rec2:LSDOMAINT_QPrecord):BOOLEAN;
VAR result:BOOLEAN;
BEGIN
result := FALSE;
IF ( rec1.req = rec2.req ) THEN
IF ( rec1.env = rec2.env ) THEN
IF ( rec1.definite = rec2.definite ) THEN
IF ( rec1.posspred = rec2.posspred ) THEN
IF ( rec1.possnumbers = rec2.possnumbers ) THEN
IF ( rec1.posscomas = rec2.posscomas ) THEN
IF ( rec1.mood = rec2.mood ) THEN
IF ( rec1.thanas = rec2.thanas ) THEN
IF ( rec1.thanascompl = rec2.thanascompl ) THEN
IF ( rec1.hop = rec2.hop ) THEN
IF ( rec1.superdeixis = rec2.superdeixis ) THEN
result := TRUE;
EQUAL_QPrecord:= result
END;
FUNCTION EQUAL_RECIPROrecord
(rec1,rec2:LSDOMAINT_RECIPROrecord):BOOLEAN;
VAR result:BOOLEAN;
BEGIN
result := FALSE;
IF ( rec1.antecedent = rec2.antecedent ) THEN
IF ( rec1.geni = rec2.geni ) THEN
result := TRUE;
EQUAL_RECIPROrecord:= result
END;
FUNCTION EQUAL_REFLPROrecord
(rec1,rec2:LSDOMAINT_REFLPROrecord):BOOLEAN;
VAR result:BOOLEAN;
BEGIN
result := FALSE;
IF ( rec1.antecedent = rec2.antecedent ) THEN
IF ( rec1.number = rec2.number ) THEN
IF ( rec1.person = rec2.person ) THEN
IF ( rec1.reduced = rec2.reduced ) THEN
IF ( rec1.zelf = rec2.zelf ) THEN
result := TRUE;
EQUAL_REFLPROrecord:= result
END;
FUNCTION EQUAL_RELANTPROrecord
(rec1,rec2:LSDOMAINT_RELANTPROrecord):BOOLEAN;
VAR result:BOOLEAN;
BEGIN
result := FALSE;
IF ( rec1.nForm = rec2.nForm ) THEN
result := TRUE;
EQUAL_RELANTPROrecord:= result
END;
FUNCTION EQUAL_RELPROrecord
(rec1,rec2:LSDOMAINT_RELPROrecord):BOOLEAN;
VAR result:BOOLEAN;
BEGIN
result := FALSE;
result := TRUE;
EQUAL_RELPROrecord:= result
END;
FUNCTION EQUAL_SENTENCErecord
(rec1,rec2:LSDOMAINT_SENTENCErecord):BOOLEAN;
VAR result:BOOLEAN;
BEGIN
result := FALSE;
IF ( rec1.req = rec2.req ) THEN
IF ( rec1.env = rec2.env ) THEN
IF ( rec1.mood = rec2.mood ) THEN
IF ( rec1.senttype = rec2.senttype ) THEN
IF ( rec1.voice = rec2.voice ) THEN
IF ( rec1.PROsubject = rec2.PROsubject ) THEN
IF ( rec1.synvpefs = rec2.synvpefs ) THEN
IF ( rec1.thetavp = rec2.thetavp ) THEN
IF ( rec1.adjuncts = rec2.adjuncts ) THEN
IF ( rec1.modus = rec2.modus ) THEN
IF ( rec1.aktionsarts = rec2.aktionsarts ) THEN
IF ( rec1.aspect = rec2.aspect ) THEN
IF ( rec1.deixis = rec2.deixis ) THEN
IF ( rec1.retro = rec2.retro ) THEN
IF ( rec1.finiteness = rec2.finiteness ) THEN
IF ( rec1.infsort = rec2.infsort ) THEN
IF ( rec1.superdeixis = rec2.superdeixis ) THEN
IF ( rec1.VRcompl = rec2.VRcompl ) THEN
IF ( rec1.conjkey = rec2.conjkey ) THEN
IF ( rec1.adverbial = rec2.adverbial ) THEN
IF ( rec1.temporal = rec2.temporal ) THEN
IF ( rec1.conjclass = rec2.conjclass ) THEN
IF ( rec1.conjdeixis = rec2.conjdeixis ) THEN
IF ( rec1.conjaspect = rec2.conjaspect ) THEN
IF ( rec1.conjretro = rec2.conjretro ) THEN
IF ( rec1.coord = rec2.coord ) THEN
result := TRUE;
EQUAL_SENTENCErecord:= result
END;
FUNCTION EQUAL_SENTENCEVARrecord
(rec1,rec2:LSDOMAINT_SENTENCEVARrecord):BOOLEAN;
VAR result:BOOLEAN;
BEGIN
result := FALSE;
IF ( rec1.req = rec2.req ) THEN
IF ( rec1.env = rec2.env ) THEN
IF ( rec1.mood = rec2.mood ) THEN
IF ( rec1.senttype = rec2.senttype ) THEN
IF ( rec1.voice = rec2.voice ) THEN
IF ( rec1.PROsubject = rec2.PROsubject ) THEN
IF ( rec1.synvpefs = rec2.synvpefs ) THEN
IF ( rec1.thetavp = rec2.thetavp ) THEN
IF ( rec1.adjuncts = rec2.adjuncts ) THEN
IF ( rec1.modus = rec2.modus ) THEN
IF ( rec1.aktionsarts = rec2.aktionsarts ) THEN
IF ( rec1.aspect = rec2.aspect ) THEN
IF ( rec1.deixis = rec2.deixis ) THEN
IF ( rec1.retro = rec2.retro ) THEN
IF ( rec1.finiteness = rec2.finiteness ) THEN
IF ( rec1.infsort = rec2.infsort ) THEN
IF ( rec1.superdeixis = rec2.superdeixis ) THEN
IF ( rec1.VRcompl = rec2.VRcompl ) THEN
IF ( rec1.conjkey = rec2.conjkey ) THEN
IF ( rec1.adverbial = rec2.adverbial ) THEN
IF ( rec1.temporal = rec2.temporal ) THEN
IF ( rec1.conjclass = rec2.conjclass ) THEN
IF ( rec1.conjdeixis = rec2.conjdeixis ) THEN
IF ( rec1.conjaspect = rec2.conjaspect ) THEN
IF ( rec1.conjretro = rec2.conjretro ) THEN
IF ( rec1.coord = rec2.coord ) THEN
result := TRUE;
EQUAL_SENTENCEVARrecord:= result
END;
FUNCTION EQUAL_TErecord
(rec1,rec2:LSDOMAINT_TErecord):BOOLEAN;
VAR result:BOOLEAN;
BEGIN
result := FALSE;
result := TRUE;
EQUAL_TErecord:= result
END;
FUNCTION EQUAL_THANASrecord
(rec1,rec2:LSDOMAINT_THANASrecord):BOOLEAN;
VAR result:BOOLEAN;
BEGIN
result := FALSE;
result := TRUE;
EQUAL_THANASrecord:= result
END;
FUNCTION EQUAL_THANPrecord
(rec1,rec2:LSDOMAINT_THANPrecord):BOOLEAN;
VAR result:BOOLEAN;
BEGIN
result := FALSE;
IF ( rec1.thanas = rec2.thanas ) THEN
IF ( rec1.req = rec2.req ) THEN
IF ( rec1.env = rec2.env ) THEN
result := TRUE;
EQUAL_THANPrecord:= result
END;
FUNCTION EQUAL_BVERBrecord
(rec1,rec2:LSDOMAINT_BVERBrecord):BOOLEAN;
VAR result:BOOLEAN;
BEGIN
result := FALSE;
IF ( rec1.req = rec2.req ) THEN
IF ( rec1.env = rec2.env ) THEN
IF ( rec1.conjclasses = rec2.conjclasses ) THEN
IF ( rec1.particle = rec2.particle ) THEN
IF ( rec1.possvoices = rec2.possvoices ) THEN
IF ( rec1.reflexivity = rec2.reflexivity ) THEN
IF ( rec1.synvps = rec2.synvps ) THEN
IF ( rec1.thetavp = rec2.thetavp ) THEN
IF ( rec1.adjuncts = rec2.adjuncts ) THEN
IF ( rec1.CaseAssigner = rec2.CaseAssigner ) THEN
IF ( rec1.subc = rec2.subc ) THEN
IF ( rec1.perfauxs = rec2.perfauxs ) THEN
IF ( rec1.prepkey1 = rec2.prepkey1 ) THEN
IF ( rec1.prepkey2 = rec2.prepkey2 ) THEN
IF ( rec1.controller = rec2.controller ) THEN
IF ( rec1.verbraiser = rec2.verbraiser ) THEN
IF ( rec1.IPP = rec2.IPP ) THEN
IF ( rec1.classes = rec2.classes ) THEN
result := TRUE;
EQUAL_BVERBrecord:= result
END;
FUNCTION EQUAL_SUBVERBrecord
(rec1,rec2:LSDOMAINT_SUBVERBrecord):BOOLEAN;
VAR result:BOOLEAN;
BEGIN
result := FALSE;
IF ( rec1.req = rec2.req ) THEN
IF ( rec1.env = rec2.env ) THEN
IF ( rec1.conjclasses = rec2.conjclasses ) THEN
IF ( rec1.particle = rec2.particle ) THEN
IF ( rec1.possvoices = rec2.possvoices ) THEN
IF ( rec1.reflexivity = rec2.reflexivity ) THEN
IF ( rec1.synvps = rec2.synvps ) THEN
IF ( rec1.thetavp = rec2.thetavp ) THEN
IF ( rec1.adjuncts = rec2.adjuncts ) THEN
IF ( rec1.CaseAssigner = rec2.CaseAssigner ) THEN
IF ( rec1.subc = rec2.subc ) THEN
IF ( rec1.perfauxs = rec2.perfauxs ) THEN
IF ( rec1.prepkey1 = rec2.prepkey1 ) THEN
IF ( rec1.prepkey2 = rec2.prepkey2 ) THEN
IF ( rec1.controller = rec2.controller ) THEN
IF ( rec1.verbraiser = rec2.verbraiser ) THEN
IF ( rec1.IPP = rec2.IPP ) THEN
IF ( rec1.classes = rec2.classes ) THEN
IF ( rec1.lastaffix = rec2.lastaffix ) THEN
result := TRUE;
EQUAL_SUBVERBrecord:= result
END;
FUNCTION EQUAL_VERBrecord
(rec1,rec2:LSDOMAINT_VERBrecord):BOOLEAN;
VAR result:BOOLEAN;
BEGIN
result := FALSE;
IF ( rec1.req = rec2.req ) THEN
IF ( rec1.env = rec2.env ) THEN
IF ( rec1.conjclasses = rec2.conjclasses ) THEN
IF ( rec1.particle = rec2.particle ) THEN
IF ( rec1.number = rec2.number ) THEN
IF ( rec1.persons = rec2.persons ) THEN
IF ( rec1.eORenForm = rec2.eORenForm ) THEN
IF ( rec1.modus = rec2.modus ) THEN
IF ( rec1.tense = rec2.tense ) THEN
IF ( rec1.possvoices = rec2.possvoices ) THEN
IF ( rec1.reflexivity = rec2.reflexivity ) THEN
IF ( rec1.synvps = rec2.synvps ) THEN
IF ( rec1.thetavp = rec2.thetavp ) THEN
IF ( rec1.adjuncts = rec2.adjuncts ) THEN
IF ( rec1.CaseAssigner = rec2.CaseAssigner ) THEN
IF ( rec1.subc = rec2.subc ) THEN
IF ( rec1.foundauxes = rec2.foundauxes ) THEN
IF ( rec1.perfauxs = rec2.perfauxs ) THEN
IF ( rec1.prepkey1 = rec2.prepkey1 ) THEN
IF ( rec1.prepkey2 = rec2.prepkey2 ) THEN
IF ( rec1.controller = rec2.controller ) THEN
IF ( rec1.verbraiser = rec2.verbraiser ) THEN
IF ( rec1.IPP = rec2.IPP ) THEN
IF ( rec1.synvpefs2 = rec2.synvpefs2 ) THEN
IF ( rec1.status = rec2.status ) THEN
IF ( rec1.classes = rec2.classes ) THEN
result := TRUE;
EQUAL_VERBrecord:= result
END;
FUNCTION EQUAL_VERBPrecord
(rec1,rec2:LSDOMAINT_VERBPrecord):BOOLEAN;
VAR result:BOOLEAN;
BEGIN
result := FALSE;
IF ( rec1.req = rec2.req ) THEN
IF ( rec1.env = rec2.env ) THEN
IF ( rec1.voice = rec2.voice ) THEN
IF ( rec1.synvpefs = rec2.synvpefs ) THEN
IF ( rec1.thetavp = rec2.thetavp ) THEN
IF ( rec1.adjuncts = rec2.adjuncts ) THEN
IF ( rec1.foundauxes = rec2.foundauxes ) THEN
IF ( rec1.modus = rec2.modus ) THEN
IF ( rec1.reflexivity = rec2.reflexivity ) THEN
IF ( rec1.classes = rec2.classes ) THEN
IF ( rec1.persons = rec2.persons ) THEN
IF ( rec1.number = rec2.number ) THEN
IF ( rec1.aspect = rec2.aspect ) THEN
IF ( rec1.tense = rec2.tense ) THEN
IF ( rec1.retro = rec2.retro ) THEN
IF ( rec1.finiteness = rec2.finiteness ) THEN
IF ( rec1.infsort = rec2.infsort ) THEN
IF ( rec1.objfound = rec2.objfound ) THEN
IF ( rec1.indobjfound = rec2.indobjfound ) THEN
IF ( rec1.preadvok = rec2.preadvok ) THEN
IF ( rec1.Vmatrixhead = rec2.Vmatrixhead ) THEN
IF ( rec1.anterelativeok = rec2.anterelativeok ) THEN
IF ( rec1.synvpefs2 = rec2.synvpefs2 ) THEN
IF ( rec1.adjvpefs = rec2.adjvpefs ) THEN
IF ( rec1.countenfound = rec2.countenfound ) THEN
IF ( rec1.locargfound = rec2.locargfound ) THEN
IF ( rec1.dirargfound = rec2.dirargfound ) THEN
IF ( rec1.prepobjfound = rec2.prepobjfound ) THEN
IF ( rec1.nppredfound = rec2.nppredfound ) THEN
IF ( rec1.adjpppredfound = rec2.adjpppredfound ) THEN
IF ( rec1.prepppredfound = rec2.prepppredfound ) THEN
IF ( rec1.aanobjfound = rec2.aanobjfound ) THEN
IF ( rec1.voorobjfound = rec2.voorobjfound ) THEN
IF ( rec1.postvpofound = rec2.postvpofound ) THEN
IF ( rec1.strandedfound = rec2.strandedfound ) THEN
IF ( rec1.vpcomplfound = rec2.vpcomplfound ) THEN
result := TRUE;
EQUAL_VERBPrecord:= result
END;
FUNCTION EQUAL_VERBPPROPrecord
(rec1,rec2:LSDOMAINT_VERBPPROPrecord):BOOLEAN;
VAR result:BOOLEAN;
BEGIN
result := FALSE;
IF ( rec1.req = rec2.req ) THEN
IF ( rec1.env = rec2.env ) THEN
IF ( rec1.superdeixis = rec2.superdeixis ) THEN
IF ( rec1.PROsubject = rec2.PROsubject ) THEN
IF ( rec1.voice = rec2.voice ) THEN
IF ( rec1.synvpefs = rec2.synvpefs ) THEN
IF ( rec1.thetavp = rec2.thetavp ) THEN
IF ( rec1.adjuncts = rec2.adjuncts ) THEN
IF ( rec1.aktionsarts = rec2.aktionsarts ) THEN
result := TRUE;
EQUAL_VERBPPROPrecord:= result
END;
FUNCTION EQUAL_VERBPPROPVARrecord
(rec1,rec2:LSDOMAINT_VERBPPROPVARrecord):BOOLEAN;
VAR result:BOOLEAN;
BEGIN
result := FALSE;
IF ( rec1.req = rec2.req ) THEN
IF ( rec1.env = rec2.env ) THEN
IF ( rec1.superdeixis = rec2.superdeixis ) THEN
IF ( rec1.PROsubject = rec2.PROsubject ) THEN
IF ( rec1.voice = rec2.voice ) THEN
IF ( rec1.synvpefs = rec2.synvpefs ) THEN
IF ( rec1.thetavp = rec2.thetavp ) THEN
IF ( rec1.adjuncts = rec2.adjuncts ) THEN
IF ( rec1.aktionsarts = rec2.aktionsarts ) THEN
result := TRUE;
EQUAL_VERBPPROPVARrecord:= result
END;
FUNCTION EQUAL_BWHPROrecord
(rec1,rec2:LSDOMAINT_BWHPROrecord):BOOLEAN;
VAR result:BOOLEAN;
BEGIN
result := FALSE;
IF ( rec1.animate = rec2.animate ) THEN
IF ( rec1.possRform = rec2.possRform ) THEN
IF ( rec1.sexes = rec2.sexes ) THEN
IF ( rec1.number = rec2.number ) THEN
result := TRUE;
EQUAL_BWHPROrecord:= result
END;
FUNCTION EQUAL_WHPROrecord
(rec1,rec2:LSDOMAINT_WHPROrecord):BOOLEAN;
VAR result:BOOLEAN;
BEGIN
result := FALSE;
IF ( rec1.animate = rec2.animate ) THEN
IF ( rec1.possRform = rec2.possRform ) THEN
IF ( rec1.sexes = rec2.sexes ) THEN
IF ( rec1.number = rec2.number ) THEN
result := TRUE;
EQUAL_WHPROrecord:= result
END;
FUNCTION EQUAL_xxkeyrecord
(rec1,rec2:LSDOMAINT_xxkeyrecord):BOOLEAN;
VAR result:BOOLEAN;
BEGIN
result := FALSE;
result := TRUE;
EQUAL_xxkeyrecord:= result
END;
FUNCTION EQUAL_xxemptyrecord
(rec1,rec2:LSDOMAINT_xxemptyrecord):BOOLEAN;
VAR result:BOOLEAN;
BEGIN
result := FALSE;
result := TRUE;
EQUAL_xxemptyrecord:= result
END;
FUNCTION LDEQUAL_top(s1,s2:LISTREE_pstree):BOOLEAN;
VAR lss1,lss2:LSSTREE_pstree;
    result:BOOLEAN;
BEGIN
lss1:=LoopHoles.Retype(s1,LSSTREE_pstree);
lss2:=LoopHoles.Retype(s2,LSSTREE_pstree);
result:=(lss1^.cat=lss2^.cat);
IF result THEN
  BEGIN
  CASE lss1^.cat OF
BADJSUFF : result := equal_BADJrecord
(lss1^.ls^.BADJSUFFfield^,lss2^.ls^.BADJSUFFfield^);
BADJ : result := equal_BADJrecord
(lss1^.ls^.BADJfield^,lss2^.ls^.BADJfield^);
SUBADJ : result := equal_SUBADJrecord
(lss1^.ls^.SUBADJfield^,lss2^.ls^.SUBADJfield^);
ADJ : result := equal_ADJrecord
(lss1^.ls^.ADJfield^,lss2^.ls^.ADJfield^);
ALLOADJ : result := equal_ADJrecord
(lss1^.ls^.ALLOADJfield^,lss2^.ls^.ALLOADJfield^);
ADJP : result := equal_ADJPrecord
(lss1^.ls^.ADJPfield^,lss2^.ls^.ADJPfield^);
ADJPPROP : result := equal_ADJPPROPrecord
(lss1^.ls^.ADJPPROPfield^,lss2^.ls^.ADJPPROPfield^);
ADJPFORMULA : result := equal_ADJPPROPrecord
(lss1^.ls^.ADJPFORMULAfield^,lss2^.ls^.ADJPFORMULAfield^);
OPENADJPPROP : result := equal_ADJPPROPrecord
(lss1^.ls^.OPENADJPPROPfield^,lss2^.ls^.OPENADJPPROPfield^);
CLOSEDADJPPROP : result := equal_ADJPPROPrecord
(lss1^.ls^.CLOSEDADJPPROPfield^,lss2^.ls^.CLOSEDADJPPROPfield^);
BADVSUFF : result := equal_BADVrecord
(lss1^.ls^.BADVSUFFfield^,lss2^.ls^.BADVSUFFfield^);
BADV : result := equal_BADVrecord
(lss1^.ls^.BADVfield^,lss2^.ls^.BADVfield^);
SUBADV : result := equal_SUBADVrecord
(lss1^.ls^.SUBADVfield^,lss2^.ls^.SUBADVfield^);
ADV : result := equal_ADVrecord
(lss1^.ls^.ADVfield^,lss2^.ls^.ADVfield^);
ALLOADV : result := equal_ADVrecord
(lss1^.ls^.ALLOADVfield^,lss2^.ls^.ALLOADVfield^);
ADVP : result := equal_ADVPrecord
(lss1^.ls^.ADVPfield^,lss2^.ls^.ADVPfield^);
ADVPPROP : result := equal_ADVPPROPrecord
(lss1^.ls^.ADVPPROPfield^,lss2^.ls^.ADVPPROPfield^);
ADVPFORMULA : result := equal_ADVPPROPrecord
(lss1^.ls^.ADVPFORMULAfield^,lss2^.ls^.ADVPFORMULAfield^);
OPENADVPPROP : result := equal_ADVPPROPrecord
(lss1^.ls^.OPENADVPPROPfield^,lss2^.ls^.OPENADVPPROPfield^);
CLOSEDADVPPROP : result := equal_ADVPPROPrecord
(lss1^.ls^.CLOSEDADVPPROPfield^,lss2^.ls^.CLOSEDADVPPROPfield^);
RADV : result := equal_RADVrecord
(lss1^.ls^.RADVfield^,lss2^.ls^.RADVfield^);
RADVP : result := equal_RADVPrecord
(lss1^.ls^.RADVPfield^,lss2^.ls^.RADVPfield^);
ADVPVAR : result := equal_ADVPVARrecord
(lss1^.ls^.ADVPVARfield^,lss2^.ls^.ADVPVARfield^);
ART : result := equal_ARTrecord
(lss1^.ls^.ARTfield^,lss2^.ls^.ARTfield^);
ASP : result := equal_ASPrecord
(lss1^.ls^.ASPfield^,lss2^.ls^.ASPfield^);
BIGPRO : result := equal_BIGPROrecord
(lss1^.ls^.BIGPROfield^,lss2^.ls^.BIGPROfield^);
BBIGPRO : result := equal_BPERSPROrecord
(lss1^.ls^.BBIGPROfield^,lss2^.ls^.BBIGPROfield^);
CARD : result := equal_CARDrecord
(lss1^.ls^.CARDfield^,lss2^.ls^.CARDfield^);
CLAUSE : result := equal_CLAUSErecord
(lss1^.ls^.CLAUSEfield^,lss2^.ls^.CLAUSEfield^);
CONJ : result := equal_CONJrecord
(lss1^.ls^.CONJfield^,lss2^.ls^.CONJfield^);
COORD : result := equal_COORDrecord
(lss1^.ls^.COORDfield^,lss2^.ls^.COORDfield^);
DEMADJ : result := equal_DEMADJrecord
(lss1^.ls^.DEMADJfield^,lss2^.ls^.DEMADJfield^);
DEMPRO : result := equal_DEMPROrecord
(lss1^.ls^.DEMPROfield^,lss2^.ls^.DEMPROfield^);
BDET : result := equal_BDETrecord
(lss1^.ls^.BDETfield^,lss2^.ls^.BDETfield^);
DET : result := equal_DETrecord
(lss1^.ls^.DETfield^,lss2^.ls^.DETfield^);
ALLODET : result := equal_DETrecord
(lss1^.ls^.ALLODETfield^,lss2^.ls^.ALLODETfield^);
DETP : result := equal_DETPrecord
(lss1^.ls^.DETPfield^,lss2^.ls^.DETPfield^);
DIGIT : result := equal_DIGITrecord
(lss1^.ls^.DIGITfield^,lss2^.ls^.DIGITfield^);
EC : result := equal_ECrecord
(lss1^.ls^.ECfield^,lss2^.ls^.ECfield^);
EN : result := equal_ENrecord
(lss1^.ls^.ENfield^,lss2^.ls^.ENfield^);
EMPTY : result := equal_EMPTYrecord
(lss1^.ls^.EMPTYfield^,lss2^.ls^.EMPTYfield^);
EXCLAM : result := equal_EXCLAMrecord
(lss1^.ls^.EXCLAMfield^,lss2^.ls^.EXCLAMfield^);
BINDEFPRO : result := equal_BINDEFPROrecord
(lss1^.ls^.BINDEFPROfield^,lss2^.ls^.BINDEFPROfield^);
INDEFPRO : result := equal_INDEFPROrecord
(lss1^.ls^.INDEFPROfield^,lss2^.ls^.INDEFPROfield^);
NEG : result := equal_NEGrecord
(lss1^.ls^.NEGfield^,lss2^.ls^.NEGfield^);
NEGVAR : result := equal_NEGrecord
(lss1^.ls^.NEGVARfield^,lss2^.ls^.NEGVARfield^);
BNOUNSUFF : result := equal_BNOUNrecord
(lss1^.ls^.BNOUNSUFFfield^,lss2^.ls^.BNOUNSUFFfield^);
BNOUN : result := equal_BNOUNrecord
(lss1^.ls^.BNOUNfield^,lss2^.ls^.BNOUNfield^);
SUBNOUN : result := equal_SUBNOUNrecord
(lss1^.ls^.SUBNOUNfield^,lss2^.ls^.SUBNOUNfield^);
NOUN : result := equal_NOUNrecord
(lss1^.ls^.NOUNfield^,lss2^.ls^.NOUNfield^);
ALLONOUN : result := equal_NOUNrecord
(lss1^.ls^.ALLONOUNfield^,lss2^.ls^.ALLONOUNfield^);
CN : result := equal_CNrecord
(lss1^.ls^.CNfield^,lss2^.ls^.CNfield^);
NP : result := equal_NPrecord
(lss1^.ls^.NPfield^,lss2^.ls^.NPfield^);
NPPROP : result := equal_NPPROPrecord
(lss1^.ls^.NPPROPfield^,lss2^.ls^.NPPROPfield^);
NPFORMULA : result := equal_NPPROPrecord
(lss1^.ls^.NPFORMULAfield^,lss2^.ls^.NPFORMULAfield^);
OPENNPPROP : result := equal_NPPROPrecord
(lss1^.ls^.OPENNPPROPfield^,lss2^.ls^.OPENNPPROPfield^);
CLOSEDNPPROP : result := equal_NPPROPrecord
(lss1^.ls^.CLOSEDNPPROPfield^,lss2^.ls^.CLOSEDNPPROPfield^);
NUM : result := equal_NUMrecord
(lss1^.ls^.NUMfield^,lss2^.ls^.NUMfield^);
ORDINAL : result := equal_ORDINALrecord
(lss1^.ls^.ORDINALfield^,lss2^.ls^.ORDINALfield^);
PART : result := equal_PARTICLErecord
(lss1^.ls^.PARTfield^,lss2^.ls^.PARTfield^);
BPERSPRO : result := equal_BPERSPROrecord
(lss1^.ls^.BPERSPROfield^,lss2^.ls^.BPERSPROfield^);
PERSPRO : result := equal_PERSPROrecord
(lss1^.ls^.PERSPROfield^,lss2^.ls^.PERSPROfield^);
POS : result := equal_POSrecord
(lss1^.ls^.POSfield^,lss2^.ls^.POSfield^);
POSVAR : result := equal_POSrecord
(lss1^.ls^.POSVARfield^,lss2^.ls^.POSVARfield^);
POSSADJ : result := equal_POSSADJrecord
(lss1^.ls^.POSSADJfield^,lss2^.ls^.POSSADJfield^);
POSSPRO : result := equal_POSSPROrecord
(lss1^.ls^.POSSPROfield^,lss2^.ls^.POSSPROfield^);
SUBPREP : result := equal_PREPrecord
(lss1^.ls^.SUBPREPfield^,lss2^.ls^.SUBPREPfield^);
PREP : result := equal_PREPrecord
(lss1^.ls^.PREPfield^,lss2^.ls^.PREPfield^);
PREPP : result := equal_PREPPrecord
(lss1^.ls^.PREPPfield^,lss2^.ls^.PREPPfield^);
PREPPPROP : result := equal_PREPPPROPrecord
(lss1^.ls^.PREPPPROPfield^,lss2^.ls^.PREPPPROPfield^);
PREPPFORMULA : result := equal_PREPPPROPrecord
(lss1^.ls^.PREPPFORMULAfield^,lss2^.ls^.PREPPFORMULAfield^);
OPENPREPPPROP : result := equal_PREPPPROPrecord
(lss1^.ls^.OPENPREPPPROPfield^,lss2^.ls^.OPENPREPPPROPfield^);
CLOSEDPREPPPROP : result := equal_PREPPPROPrecord
(lss1^.ls^.CLOSEDPREPPPROPfield^,lss2^.ls^.CLOSEDPREPPPROPfield^);
VARPREPP : result := equal_PREPPrecord
(lss1^.ls^.VARPREPPfield^,lss2^.ls^.VARPREPPfield^);
PREPPVAR : result := equal_PREPPVARrecord
(lss1^.ls^.PREPPVARfield^,lss2^.ls^.PREPPVARfield^);
BPROPERNOUN : result := equal_BPROPERNOUNrecord
(lss1^.ls^.BPROPERNOUNfield^,lss2^.ls^.BPROPERNOUNfield^);
PROPERNOUN : result := equal_PROPERNOUNrecord
(lss1^.ls^.PROPERNOUNfield^,lss2^.ls^.PROPERNOUNfield^);
PUNC : result := equal_PUNCrecord
(lss1^.ls^.PUNCfield^,lss2^.ls^.PUNCfield^);
PROSENT : result := equal_PROSENTrecord
(lss1^.ls^.PROSENTfield^,lss2^.ls^.PROSENTfield^);
PROSENTVAR : result := equal_PROSENTVARrecord
(lss1^.ls^.PROSENTVARfield^,lss2^.ls^.PROSENTVARfield^);
Q : result := equal_Qrecord
(lss1^.ls^.Qfield^,lss2^.ls^.Qfield^);
QP : result := equal_QPrecord
(lss1^.ls^.QPfield^,lss2^.ls^.QPfield^);
RECIPRO : result := equal_RECIPROrecord
(lss1^.ls^.RECIPROfield^,lss2^.ls^.RECIPROfield^);
REFLPRO : result := equal_REFLPROrecord
(lss1^.ls^.REFLPROfield^,lss2^.ls^.REFLPROfield^);
RELANTPRO : result := equal_RELANTPROrecord
(lss1^.ls^.RELANTPROfield^,lss2^.ls^.RELANTPROfield^);
RELPRO : result := equal_RELPROrecord
(lss1^.ls^.RELPROfield^,lss2^.ls^.RELPROfield^);
SENTENCE : result := equal_SENTENCErecord
(lss1^.ls^.SENTENCEfield^,lss2^.ls^.SENTENCEfield^);
TE : result := equal_TErecord
(lss1^.ls^.TEfield^,lss2^.ls^.TEfield^);
THANAS : result := equal_THANASrecord
(lss1^.ls^.THANASfield^,lss2^.ls^.THANASfield^);
THANP : result := equal_THANPrecord
(lss1^.ls^.THANPfield^,lss2^.ls^.THANPfield^);
UTT : result := equal_NOrecord
(lss1^.ls^.UTTfield^,lss2^.ls^.UTTfield^);
ADJPPROPVAR : result := equal_ADJPPROPVARrecord
(lss1^.ls^.ADJPPROPVARfield^,lss2^.ls^.ADJPPROPVARfield^);
ADVPPROPVAR : result := equal_ADVPPROPVARrecord
(lss1^.ls^.ADVPPROPVARfield^,lss2^.ls^.ADVPPROPVARfield^);
CLAUSEVAR : result := equal_CLAUSEVARrecord
(lss1^.ls^.CLAUSEVARfield^,lss2^.ls^.CLAUSEVARfield^);
CNVAR : result := equal_CNVARrecord
(lss1^.ls^.CNVARfield^,lss2^.ls^.CNVARfield^);
NPPROPVAR : result := equal_NPPROPVARrecord
(lss1^.ls^.NPPROPVARfield^,lss2^.ls^.NPPROPVARfield^);
PREPPPROPVAR : result := equal_PREPPPROPVARrecord
(lss1^.ls^.PREPPPROPVARfield^,lss2^.ls^.PREPPPROPVARfield^);
NPVAR : result := equal_NPVARrecord
(lss1^.ls^.NPVARfield^,lss2^.ls^.NPVARfield^);
SENTENCEVAR : result := equal_SENTENCEVARrecord
(lss1^.ls^.SENTENCEVARfield^,lss2^.ls^.SENTENCEVARfield^);
EMPTYVAR : result := equal_EMPTYVARrecord
(lss1^.ls^.EMPTYVARfield^,lss2^.ls^.EMPTYVARfield^);
VERBPPROPVAR : result := equal_VERBPPROPVARrecord
(lss1^.ls^.VERBPPROPVARfield^,lss2^.ls^.VERBPPROPVARfield^);
BVERBSUFF : result := equal_BVERBrecord
(lss1^.ls^.BVERBSUFFfield^,lss2^.ls^.BVERBSUFFfield^);
BVERB : result := equal_BVERBrecord
(lss1^.ls^.BVERBfield^,lss2^.ls^.BVERBfield^);
SUBVERB : result := equal_SUBVERBrecord
(lss1^.ls^.SUBVERBfield^,lss2^.ls^.SUBVERBfield^);
VERB : result := equal_VERBrecord
(lss1^.ls^.VERBfield^,lss2^.ls^.VERBfield^);
ALLOVERB : result := equal_VERBrecord
(lss1^.ls^.ALLOVERBfield^,lss2^.ls^.ALLOVERBfield^);
VERBP : result := equal_VERBPrecord
(lss1^.ls^.VERBPfield^,lss2^.ls^.VERBPfield^);
VERBPPROP : result := equal_VERBPPROPrecord
(lss1^.ls^.VERBPPROPfield^,lss2^.ls^.VERBPPROPfield^);
VERBPFORMULA : result := equal_VERBPPROPrecord
(lss1^.ls^.VERBPFORMULAfield^,lss2^.ls^.VERBPFORMULAfield^);
OPENVERBPPROP : result := equal_VERBPPROPrecord
(lss1^.ls^.OPENVERBPPROPfield^,lss2^.ls^.OPENVERBPPROPfield^);
CLOSEDVERBPPROP : result := equal_VERBPPROPrecord
(lss1^.ls^.CLOSEDVERBPPROPfield^,lss2^.ls^.CLOSEDVERBPPROPfield^);
BWHPRO : result := equal_BWHPROrecord
(lss1^.ls^.BWHPROfield^,lss2^.ls^.BWHPROfield^);
WHPRO : result := equal_WHPROrecord
(lss1^.ls^.WHPROfield^,lss2^.ls^.WHPROfield^);
SFCAT : result := equal_xxkeyrecord
(lss1^.ls^.SFCATfield^,lss2^.ls^.SFCATfield^);
PFCAT : result := equal_xxkeyrecord
(lss1^.ls^.PFCATfield^,lss2^.ls^.PFCATfield^);
GLUE : result := equal_xxemptyrecord
(lss1^.ls^.GLUEfield^,lss2^.ls^.GLUEfield^);
  END;
  END;
LDEQUAL_top:=result
END;
