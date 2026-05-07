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
IF ( rec1.pluralforma = rec2.pluralforma ) THEN
IF ( rec1.femforma = rec2.femforma ) THEN
IF ( rec1.irrComp = rec2.irrComp ) THEN
IF ( rec1.possApocope = rec2.possApocope ) THEN
IF ( rec1.posicion = rec2.posicion ) THEN
IF ( rec1.class = rec2.class ) THEN
IF ( rec1.tiempo = rec2.tiempo ) THEN
IF ( rec1.aspecto = rec2.aspecto ) THEN
IF ( rec1.retro = rec2.retro ) THEN
IF ( rec1.uses = rec2.uses ) THEN
IF ( rec1.temporal = rec2.temporal ) THEN
IF ( rec1.subcs = rec2.subcs ) THEN
IF ( rec1.reflexivity = rec2.reflexivity ) THEN
IF ( rec1.thetaadj = rec2.thetaadj ) THEN
IF ( rec1.adjpatterns = rec2.adjpatterns ) THEN
IF ( rec1.prepkey = rec2.prepkey ) THEN
IF ( rec1.possadv = rec2.possadv ) THEN
IF ( rec1.ARTindef = rec2.ARTindef ) THEN
IF ( rec1.copulas = rec2.copulas ) THEN
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
IF ( rec1.tiempo = rec2.tiempo ) THEN
IF ( rec1.aspecto = rec2.aspecto ) THEN
IF ( rec1.retro = rec2.retro ) THEN
IF ( rec1.pluralforma = rec2.pluralforma ) THEN
IF ( rec1.femforma = rec2.femforma ) THEN
IF ( rec1.possApocope = rec2.possApocope ) THEN
IF ( rec1.posicion = rec2.posicion ) THEN
IF ( rec1.uses = rec2.uses ) THEN
IF ( rec1.temporal = rec2.temporal ) THEN
IF ( rec1.subcs = rec2.subcs ) THEN
IF ( rec1.reflexivity = rec2.reflexivity ) THEN
IF ( rec1.thetaadj = rec2.thetaadj ) THEN
IF ( rec1.adjpatterns = rec2.adjpatterns ) THEN
IF ( rec1.prepkey = rec2.prepkey ) THEN
IF ( rec1.possadv = rec2.possadv ) THEN
IF ( rec1.ARTindef = rec2.ARTindef ) THEN
IF ( rec1.copulas = rec2.copulas ) THEN
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
IF ( rec1.Adjadvform = rec2.Adjadvform ) THEN
IF ( rec1.pluralforma = rec2.pluralforma ) THEN
IF ( rec1.femforma = rec2.femforma ) THEN
IF ( rec1.irrComp = rec2.irrComp ) THEN
IF ( rec1.genero = rec2.genero ) THEN
IF ( rec1.numero = rec2.numero ) THEN
IF ( rec1.possApocope = rec2.possApocope ) THEN
IF ( rec1.apocope = rec2.apocope ) THEN
IF ( rec1.posicion = rec2.posicion ) THEN
IF ( rec1.class = rec2.class ) THEN
IF ( rec1.tiempo = rec2.tiempo ) THEN
IF ( rec1.aspecto = rec2.aspecto ) THEN
IF ( rec1.retro = rec2.retro ) THEN
IF ( rec1.uses = rec2.uses ) THEN
IF ( rec1.temporal = rec2.temporal ) THEN
IF ( rec1.subcs = rec2.subcs ) THEN
IF ( rec1.thetaadj = rec2.thetaadj ) THEN
IF ( rec1.adjpatterns = rec2.adjpatterns ) THEN
IF ( rec1.prepkey = rec2.prepkey ) THEN
IF ( rec1.reflexivity = rec2.reflexivity ) THEN
IF ( rec1.possadv = rec2.possadv ) THEN
IF ( rec1.ARTindef = rec2.ARTindef ) THEN
IF ( rec1.copulas = rec2.copulas ) THEN
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
IF ( rec1.genero = rec2.genero ) THEN
IF ( rec1.numero = rec2.numero ) THEN
IF ( rec1.apocope = rec2.apocope ) THEN
IF ( rec1.posicion = rec2.posicion ) THEN
IF ( rec1.class = rec2.class ) THEN
IF ( rec1.tiempo = rec2.tiempo ) THEN
IF ( rec1.aspecto = rec2.aspecto ) THEN
IF ( rec1.retro = rec2.retro ) THEN
IF ( rec1.uses = rec2.uses ) THEN
IF ( rec1.temporal = rec2.temporal ) THEN
IF ( rec1.actsubcefs = rec2.actsubcefs ) THEN
IF ( rec1.thetaadj = rec2.thetaadj ) THEN
IF ( rec1.adjpatternefs = rec2.adjpatternefs ) THEN
IF ( rec1.reflexivity = rec2.reflexivity ) THEN
IF ( rec1.mood = rec2.mood ) THEN
IF ( rec1.copulas = rec2.copulas ) THEN
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
IF ( rec1.tiempo = rec2.tiempo ) THEN
IF ( rec1.aspecto = rec2.aspecto ) THEN
IF ( rec1.retro = rec2.retro ) THEN
IF ( rec1.aktionsarts = rec2.aktionsarts ) THEN
IF ( rec1.uses = rec2.uses ) THEN
IF ( rec1.supertiempo = rec2.supertiempo ) THEN
IF ( rec1.temporal = rec2.temporal ) THEN
IF ( rec1.actsubcefs = rec2.actsubcefs ) THEN
IF ( rec1.thetaadj = rec2.thetaadj ) THEN
IF ( rec1.adjpatternefs = rec2.adjpatternefs ) THEN
IF ( rec1.mood = rec2.mood ) THEN
IF ( rec1.copulas = rec2.copulas ) THEN
IF ( rec1.PROsubject = rec2.PROsubject ) THEN
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
IF ( rec1.tiempo = rec2.tiempo ) THEN
IF ( rec1.aspecto = rec2.aspecto ) THEN
IF ( rec1.retro = rec2.retro ) THEN
IF ( rec1.aktionsarts = rec2.aktionsarts ) THEN
IF ( rec1.uses = rec2.uses ) THEN
IF ( rec1.supertiempo = rec2.supertiempo ) THEN
IF ( rec1.temporal = rec2.temporal ) THEN
IF ( rec1.actsubcefs = rec2.actsubcefs ) THEN
IF ( rec1.thetaadj = rec2.thetaadj ) THEN
IF ( rec1.adjpatternefs = rec2.adjpatternefs ) THEN
IF ( rec1.mood = rec2.mood ) THEN
IF ( rec1.copulas = rec2.copulas ) THEN
IF ( rec1.PROsubject = rec2.PROsubject ) THEN
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
IF ( rec1.subcs = rec2.subcs ) THEN
IF ( rec1.Qstatus = rec2.Qstatus ) THEN
IF ( rec1.class = rec2.class ) THEN
IF ( rec1.tiempo = rec2.tiempo ) THEN
IF ( rec1.aspecto = rec2.aspecto ) THEN
IF ( rec1.retro = rec2.retro ) THEN
IF ( rec1.mood = rec2.mood ) THEN
IF ( rec1.thetaadv = rec2.thetaadv ) THEN
IF ( rec1.advpatterns = rec2.advpatterns ) THEN
IF ( rec1.prepkey = rec2.prepkey ) THEN
IF ( rec1.temporal = rec2.temporal ) THEN
IF ( rec1.irrComp = rec2.irrComp ) THEN
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
IF ( rec1.subcs = rec2.subcs ) THEN
IF ( rec1.Qstatus = rec2.Qstatus ) THEN
IF ( rec1.class = rec2.class ) THEN
IF ( rec1.tiempo = rec2.tiempo ) THEN
IF ( rec1.aspecto = rec2.aspecto ) THEN
IF ( rec1.retro = rec2.retro ) THEN
IF ( rec1.mood = rec2.mood ) THEN
IF ( rec1.thetaadv = rec2.thetaadv ) THEN
IF ( rec1.advpatterns = rec2.advpatterns ) THEN
IF ( rec1.prepkey = rec2.prepkey ) THEN
IF ( rec1.temporal = rec2.temporal ) THEN
IF ( rec1.thanas = rec2.thanas ) THEN
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
IF ( rec1.subcs = rec2.subcs ) THEN
IF ( rec1.Qstatus = rec2.Qstatus ) THEN
IF ( rec1.class = rec2.class ) THEN
IF ( rec1.tiempo = rec2.tiempo ) THEN
IF ( rec1.aspecto = rec2.aspecto ) THEN
IF ( rec1.retro = rec2.retro ) THEN
IF ( rec1.mood = rec2.mood ) THEN
IF ( rec1.thetaadv = rec2.thetaadv ) THEN
IF ( rec1.advpatterns = rec2.advpatterns ) THEN
IF ( rec1.prepkey = rec2.prepkey ) THEN
IF ( rec1.temporal = rec2.temporal ) THEN
IF ( rec1.thanas = rec2.thanas ) THEN
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
IF ( rec1.Qstatus = rec2.Qstatus ) THEN
IF ( rec1.class = rec2.class ) THEN
IF ( rec1.tiempo = rec2.tiempo ) THEN
IF ( rec1.aspecto = rec2.aspecto ) THEN
IF ( rec1.retro = rec2.retro ) THEN
IF ( rec1.supertiempo = rec2.supertiempo ) THEN
IF ( rec1.actsubcefs = rec2.actsubcefs ) THEN
IF ( rec1.mood = rec2.mood ) THEN
IF ( rec1.thetaadv = rec2.thetaadv ) THEN
IF ( rec1.advpatternefs = rec2.advpatternefs ) THEN
IF ( rec1.temporal = rec2.temporal ) THEN
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
IF ( rec1.Qstatus = rec2.Qstatus ) THEN
IF ( rec1.class = rec2.class ) THEN
IF ( rec1.tiempo = rec2.tiempo ) THEN
IF ( rec1.aspecto = rec2.aspecto ) THEN
IF ( rec1.retro = rec2.retro ) THEN
IF ( rec1.supertiempo = rec2.supertiempo ) THEN
IF ( rec1.actsubcefs = rec2.actsubcefs ) THEN
IF ( rec1.mood = rec2.mood ) THEN
IF ( rec1.thetaadv = rec2.thetaadv ) THEN
IF ( rec1.advpatternefs = rec2.advpatternefs ) THEN
IF ( rec1.temporal = rec2.temporal ) THEN
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
IF ( rec1.Qstatus = rec2.Qstatus ) THEN
IF ( rec1.class = rec2.class ) THEN
IF ( rec1.tiempo = rec2.tiempo ) THEN
IF ( rec1.aspecto = rec2.aspecto ) THEN
IF ( rec1.retro = rec2.retro ) THEN
IF ( rec1.aktionsarts = rec2.aktionsarts ) THEN
IF ( rec1.supertiempo = rec2.supertiempo ) THEN
IF ( rec1.actsubcefs = rec2.actsubcefs ) THEN
IF ( rec1.mood = rec2.mood ) THEN
IF ( rec1.thetaadv = rec2.thetaadv ) THEN
IF ( rec1.advpatternefs = rec2.advpatternefs ) THEN
IF ( rec1.temporal = rec2.temporal ) THEN
IF ( rec1.thanas = rec2.thanas ) THEN
IF ( rec1.thanascompl = rec2.thanascompl ) THEN
IF ( rec1.PROsubject = rec2.PROsubject ) THEN
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
IF ( rec1.Qstatus = rec2.Qstatus ) THEN
IF ( rec1.class = rec2.class ) THEN
IF ( rec1.tiempo = rec2.tiempo ) THEN
IF ( rec1.aspecto = rec2.aspecto ) THEN
IF ( rec1.retro = rec2.retro ) THEN
IF ( rec1.aktionsarts = rec2.aktionsarts ) THEN
IF ( rec1.supertiempo = rec2.supertiempo ) THEN
IF ( rec1.actsubcefs = rec2.actsubcefs ) THEN
IF ( rec1.mood = rec2.mood ) THEN
IF ( rec1.thetaadv = rec2.thetaadv ) THEN
IF ( rec1.advpatternefs = rec2.advpatternefs ) THEN
IF ( rec1.prepkey = rec2.prepkey ) THEN
IF ( rec1.temporal = rec2.temporal ) THEN
IF ( rec1.thanas = rec2.thanas ) THEN
IF ( rec1.thanascompl = rec2.thanascompl ) THEN
IF ( rec1.PROsubject = rec2.PROsubject ) THEN
result := TRUE;
EQUAL_ADVPPROPVARrecord:= result
END;
FUNCTION EQUAL_ARTrecord
(rec1,rec2:LSDOMAINT_ARTrecord):BOOLEAN;
VAR result:BOOLEAN;
BEGIN
result := FALSE;
IF ( rec1.definite = rec2.definite ) THEN
IF ( rec1.genero = rec2.genero ) THEN
IF ( rec1.posscomas = rec2.posscomas ) THEN
IF ( rec1.numero = rec2.numero ) THEN
result := TRUE;
EQUAL_ARTrecord:= result
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
IF ( rec1.mood = rec2.mood ) THEN
IF ( rec1.modo = rec2.modo ) THEN
IF ( rec1.aktionsarts = rec2.aktionsarts ) THEN
IF ( rec1.aspecto = rec2.aspecto ) THEN
IF ( rec1.tiempo = rec2.tiempo ) THEN
IF ( rec1.retro = rec2.retro ) THEN
IF ( rec1.finiteness = rec2.finiteness ) THEN
IF ( rec1.VRcompl = rec2.VRcompl ) THEN
IF ( rec1.supertiempo = rec2.supertiempo ) THEN
IF ( rec1.Restructuring = rec2.Restructuring ) THEN
IF ( rec1.negpos = rec2.negpos ) THEN
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
IF ( rec1.mood = rec2.mood ) THEN
IF ( rec1.modo = rec2.modo ) THEN
IF ( rec1.aktionsarts = rec2.aktionsarts ) THEN
IF ( rec1.aspecto = rec2.aspecto ) THEN
IF ( rec1.tiempo = rec2.tiempo ) THEN
IF ( rec1.retro = rec2.retro ) THEN
IF ( rec1.finiteness = rec2.finiteness ) THEN
IF ( rec1.VRcompl = rec2.VRcompl ) THEN
IF ( rec1.supertiempo = rec2.supertiempo ) THEN
IF ( rec1.Restructuring = rec2.Restructuring ) THEN
IF ( rec1.negpos = rec2.negpos ) THEN
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
IF ( rec1.tiempo = rec2.tiempo ) THEN
IF ( rec1.aspecto = rec2.aspecto ) THEN
IF ( rec1.retro = rec2.retro ) THEN
IF ( rec1.adverbial = rec2.adverbial ) THEN
IF ( rec1.temporal = rec2.temporal ) THEN
IF ( rec1.conjpatterns = rec2.conjpatterns ) THEN
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
FUNCTION EQUAL_BDEMADJrecord
(rec1,rec2:LSDOMAINT_BDEMADJrecord):BOOLEAN;
VAR result:BOOLEAN;
BEGIN
result := FALSE;
result := TRUE;
EQUAL_BDEMADJrecord:= result
END;
FUNCTION EQUAL_DEMADJrecord
(rec1,rec2:LSDOMAINT_DEMADJrecord):BOOLEAN;
VAR result:BOOLEAN;
BEGIN
result := FALSE;
IF ( rec1.numero = rec2.numero ) THEN
IF ( rec1.genero = rec2.genero ) THEN
result := TRUE;
EQUAL_DEMADJrecord:= result
END;
FUNCTION EQUAL_DEMPROrecord
(rec1,rec2:LSDOMAINT_DEMPROrecord):BOOLEAN;
VAR result:BOOLEAN;
BEGIN
result := FALSE;
IF ( rec1.numero = rec2.numero ) THEN
IF ( rec1.genero = rec2.genero ) THEN
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
IF ( rec1.possnumbers = rec2.possnumbers ) THEN
IF ( rec1.flection = rec2.flection ) THEN
IF ( rec1.definite = rec2.definite ) THEN
IF ( rec1.posspred = rec2.posspred ) THEN
IF ( rec1.posscomas = rec2.posscomas ) THEN
IF ( rec1.mood = rec2.mood ) THEN
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
IF ( rec1.numero = rec2.numero ) THEN
IF ( rec1.genero = rec2.genero ) THEN
IF ( rec1.definite = rec2.definite ) THEN
IF ( rec1.posspred = rec2.posspred ) THEN
IF ( rec1.posscomas = rec2.posscomas ) THEN
IF ( rec1.mood = rec2.mood ) THEN
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
IF ( rec1.numero = rec2.numero ) THEN
IF ( rec1.genero = rec2.genero ) THEN
IF ( rec1.definite = rec2.definite ) THEN
IF ( rec1.posspred = rec2.posspred ) THEN
IF ( rec1.posscomas = rec2.posscomas ) THEN
IF ( rec1.mood = rec2.mood ) THEN
IF ( rec1.syntquant = rec2.syntquant ) THEN
IF ( rec1.supertiempo = rec2.supertiempo ) THEN
result := TRUE;
EQUAL_DETPrecord:= result
END;
FUNCTION EQUAL_EMPTYrecord
(rec1,rec2:LSDOMAINT_EMPTYrecord):BOOLEAN;
VAR result:BOOLEAN;
BEGIN
result := FALSE;
IF ( rec1.persona = rec2.persona ) THEN
IF ( rec1.numero = rec2.numero ) THEN
IF ( rec1.genero = rec2.genero ) THEN
result := TRUE;
EQUAL_EMPTYrecord:= result
END;
FUNCTION EQUAL_EMPTYVARrecord
(rec1,rec2:LSDOMAINT_EMPTYVARrecord):BOOLEAN;
VAR result:BOOLEAN;
BEGIN
result := FALSE;
IF ( rec1.persona = rec2.persona ) THEN
IF ( rec1.numero = rec2.numero ) THEN
IF ( rec1.genero = rec2.genero ) THEN
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
FUNCTION EQUAL_INDEFPROrecord
(rec1,rec2:LSDOMAINT_INDEFPROrecord):BOOLEAN;
VAR result:BOOLEAN;
BEGIN
result := FALSE;
IF ( rec1.req = rec2.req ) THEN
IF ( rec1.env = rec2.env ) THEN
IF ( rec1.definite = rec2.definite ) THEN
IF ( rec1.numero = rec2.numero ) THEN
IF ( rec1.mood = rec2.mood ) THEN
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
FUNCTION EQUAL_NEGVARrecord
(rec1,rec2:LSDOMAINT_NEGVARrecord):BOOLEAN;
VAR result:BOOLEAN;
BEGIN
result := FALSE;
result := TRUE;
EQUAL_NEGVARrecord:= result
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
FUNCTION EQUAL_CARDrecord
(rec1,rec2:LSDOMAINT_CARDrecord):BOOLEAN;
VAR result:BOOLEAN;
BEGIN
result := FALSE;
IF ( rec1.numero = rec2.numero ) THEN
result := TRUE;
EQUAL_CARDrecord:= result
END;
FUNCTION EQUAL_BNOUNrecord
(rec1,rec2:LSDOMAINT_BNOUNrecord):BOOLEAN;
VAR result:BOOLEAN;
BEGIN
result := FALSE;
IF ( rec1.req = rec2.req ) THEN
IF ( rec1.env = rec2.env ) THEN
IF ( rec1.pluralforma = rec2.pluralforma ) THEN
IF ( rec1.generos = rec2.generos ) THEN
IF ( rec1.class = rec2.class ) THEN
IF ( rec1.tiempo = rec2.tiempo ) THEN
IF ( rec1.aspecto = rec2.aspecto ) THEN
IF ( rec1.retro = rec2.retro ) THEN
IF ( rec1.subcs = rec2.subcs ) THEN
IF ( rec1.temporal = rec2.temporal ) THEN
IF ( rec1.animate = rec2.animate ) THEN
IF ( rec1.human = rec2.human ) THEN
IF ( rec1.posscomas = rec2.posscomas ) THEN
IF ( rec1.thetanp = rec2.thetanp ) THEN
IF ( rec1.nounpatterns = rec2.nounpatterns ) THEN
IF ( rec1.prepkey = rec2.prepkey ) THEN
IF ( rec1.personal = rec2.personal ) THEN
IF ( rec1.Npropio = rec2.Npropio ) THEN
IF ( rec1.inalienable = rec2.inalienable ) THEN
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
IF ( rec1.pluralforma = rec2.pluralforma ) THEN
IF ( rec1.generos = rec2.generos ) THEN
IF ( rec1.class = rec2.class ) THEN
IF ( rec1.tiempo = rec2.tiempo ) THEN
IF ( rec1.aspecto = rec2.aspecto ) THEN
IF ( rec1.retro = rec2.retro ) THEN
IF ( rec1.subcs = rec2.subcs ) THEN
IF ( rec1.temporal = rec2.temporal ) THEN
IF ( rec1.animate = rec2.animate ) THEN
IF ( rec1.human = rec2.human ) THEN
IF ( rec1.posscomas = rec2.posscomas ) THEN
IF ( rec1.thetanp = rec2.thetanp ) THEN
IF ( rec1.nounpatterns = rec2.nounpatterns ) THEN
IF ( rec1.prepkey = rec2.prepkey ) THEN
IF ( rec1.personal = rec2.personal ) THEN
IF ( rec1.Npropio = rec2.Npropio ) THEN
IF ( rec1.inalienable = rec2.inalienable ) THEN
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
IF ( rec1.pluralforma = rec2.pluralforma ) THEN
IF ( rec1.generos = rec2.generos ) THEN
IF ( rec1.numero = rec2.numero ) THEN
IF ( rec1.class = rec2.class ) THEN
IF ( rec1.tiempo = rec2.tiempo ) THEN
IF ( rec1.aspecto = rec2.aspecto ) THEN
IF ( rec1.retro = rec2.retro ) THEN
IF ( rec1.subcs = rec2.subcs ) THEN
IF ( rec1.temporal = rec2.temporal ) THEN
IF ( rec1.animate = rec2.animate ) THEN
IF ( rec1.human = rec2.human ) THEN
IF ( rec1.posscomas = rec2.posscomas ) THEN
IF ( rec1.thetanp = rec2.thetanp ) THEN
IF ( rec1.nounpatterns = rec2.nounpatterns ) THEN
IF ( rec1.prepkey = rec2.prepkey ) THEN
IF ( rec1.personal = rec2.personal ) THEN
IF ( rec1.Npropio = rec2.Npropio ) THEN
IF ( rec1.inalienable = rec2.inalienable ) THEN
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
IF ( rec1.supertiempo = rec2.supertiempo ) THEN
IF ( rec1.class = rec2.class ) THEN
IF ( rec1.tiempo = rec2.tiempo ) THEN
IF ( rec1.aspecto = rec2.aspecto ) THEN
IF ( rec1.retro = rec2.retro ) THEN
IF ( rec1.definite = rec2.definite ) THEN
IF ( rec1.numero = rec2.numero ) THEN
IF ( rec1.generos = rec2.generos ) THEN
IF ( rec1.actsubcs = rec2.actsubcs ) THEN
IF ( rec1.temporal = rec2.temporal ) THEN
IF ( rec1.animate = rec2.animate ) THEN
IF ( rec1.human = rec2.human ) THEN
IF ( rec1.posscomas = rec2.posscomas ) THEN
IF ( rec1.thetanp = rec2.thetanp ) THEN
IF ( rec1.nounpatternefs = rec2.nounpatternefs ) THEN
IF ( rec1.cases = rec2.cases ) THEN
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
IF ( rec1.supertiempo = rec2.supertiempo ) THEN
IF ( rec1.class = rec2.class ) THEN
IF ( rec1.tiempo = rec2.tiempo ) THEN
IF ( rec1.aspecto = rec2.aspecto ) THEN
IF ( rec1.retro = rec2.retro ) THEN
IF ( rec1.definite = rec2.definite ) THEN
IF ( rec1.numero = rec2.numero ) THEN
IF ( rec1.generos = rec2.generos ) THEN
IF ( rec1.actsubcs = rec2.actsubcs ) THEN
IF ( rec1.temporal = rec2.temporal ) THEN
IF ( rec1.animate = rec2.animate ) THEN
IF ( rec1.human = rec2.human ) THEN
IF ( rec1.posscomas = rec2.posscomas ) THEN
IF ( rec1.thetanp = rec2.thetanp ) THEN
IF ( rec1.nounpatternefs = rec2.nounpatternefs ) THEN
IF ( rec1.cases = rec2.cases ) THEN
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
IF ( rec1.supertiempo = rec2.supertiempo ) THEN
IF ( rec1.class = rec2.class ) THEN
IF ( rec1.tiempo = rec2.tiempo ) THEN
IF ( rec1.aspecto = rec2.aspecto ) THEN
IF ( rec1.retro = rec2.retro ) THEN
IF ( rec1.persona = rec2.persona ) THEN
IF ( rec1.genero = rec2.genero ) THEN
IF ( rec1.actsubcs = rec2.actsubcs ) THEN
IF ( rec1.temporal = rec2.temporal ) THEN
IF ( rec1.animate = rec2.animate ) THEN
IF ( rec1.human = rec2.human ) THEN
IF ( rec1.actcomas = rec2.actcomas ) THEN
IF ( rec1.mood = rec2.mood ) THEN
IF ( rec1.numero = rec2.numero ) THEN
IF ( rec1.definite = rec2.definite ) THEN
IF ( rec1.generic = rec2.generic ) THEN
IF ( rec1.thetanp = rec2.thetanp ) THEN
IF ( rec1.nounpatternefs = rec2.nounpatternefs ) THEN
IF ( rec1.posspred = rec2.posspred ) THEN
IF ( rec1.possnietnp = rec2.possnietnp ) THEN
IF ( rec1.syntquant = rec2.syntquant ) THEN
IF ( rec1.NPhead = rec2.NPhead ) THEN
IF ( rec1.SpecQ = rec2.SpecQ ) THEN
IF ( rec1.DefSpec = rec2.DefSpec ) THEN
IF ( rec1.cases = rec2.cases ) THEN
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
IF ( rec1.supertiempo = rec2.supertiempo ) THEN
IF ( rec1.class = rec2.class ) THEN
IF ( rec1.tiempo = rec2.tiempo ) THEN
IF ( rec1.aspecto = rec2.aspecto ) THEN
IF ( rec1.retro = rec2.retro ) THEN
IF ( rec1.persona = rec2.persona ) THEN
IF ( rec1.genero = rec2.genero ) THEN
IF ( rec1.actsubcs = rec2.actsubcs ) THEN
IF ( rec1.temporal = rec2.temporal ) THEN
IF ( rec1.animate = rec2.animate ) THEN
IF ( rec1.human = rec2.human ) THEN
IF ( rec1.actcomas = rec2.actcomas ) THEN
IF ( rec1.mood = rec2.mood ) THEN
IF ( rec1.numero = rec2.numero ) THEN
IF ( rec1.definite = rec2.definite ) THEN
IF ( rec1.generic = rec2.generic ) THEN
IF ( rec1.thetanp = rec2.thetanp ) THEN
IF ( rec1.nounpatternefs = rec2.nounpatternefs ) THEN
IF ( rec1.posspred = rec2.posspred ) THEN
IF ( rec1.possnietnp = rec2.possnietnp ) THEN
IF ( rec1.syntquant = rec2.syntquant ) THEN
IF ( rec1.NPhead = rec2.NPhead ) THEN
IF ( rec1.SpecQ = rec2.SpecQ ) THEN
IF ( rec1.DefSpec = rec2.DefSpec ) THEN
IF ( rec1.cases = rec2.cases ) THEN
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
IF ( rec1.supertiempo = rec2.supertiempo ) THEN
IF ( rec1.aktionsarts = rec2.aktionsarts ) THEN
IF ( rec1.thetanp = rec2.thetanp ) THEN
IF ( rec1.nounpatternefs = rec2.nounpatternefs ) THEN
IF ( rec1.PROsubject = rec2.PROsubject ) THEN
IF ( rec1.DefSpec = rec2.DefSpec ) THEN
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
IF ( rec1.supertiempo = rec2.supertiempo ) THEN
IF ( rec1.aktionsarts = rec2.aktionsarts ) THEN
IF ( rec1.thetanp = rec2.thetanp ) THEN
IF ( rec1.nounpatternefs = rec2.nounpatternefs ) THEN
IF ( rec1.PROsubject = rec2.PROsubject ) THEN
IF ( rec1.DefSpec = rec2.DefSpec ) THEN
result := TRUE;
EQUAL_NPPROPVARrecord:= result
END;
FUNCTION EQUAL_NUMrecord
(rec1,rec2:LSDOMAINT_NUMrecord):BOOLEAN;
VAR result:BOOLEAN;
BEGIN
result := FALSE;
IF ( rec1.numero = rec2.numero ) THEN
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
FUNCTION EQUAL_BPERSPROrecord
(rec1,rec2:LSDOMAINT_BPERSPROrecord):BOOLEAN;
VAR result:BOOLEAN;
BEGIN
result := FALSE;
IF ( rec1.numero = rec2.numero ) THEN
IF ( rec1.genero = rec2.genero ) THEN
IF ( rec1.persona = rec2.persona ) THEN
IF ( rec1.forma = rec2.forma ) THEN
IF ( rec1.cortesia = rec2.cortesia ) THEN
IF ( rec1.animate = rec2.animate ) THEN
IF ( rec1.NPhead = rec2.NPhead ) THEN
result := TRUE;
EQUAL_BPERSPROrecord:= result
END;
FUNCTION EQUAL_PERSPROrecord
(rec1,rec2:LSDOMAINT_PERSPROrecord):BOOLEAN;
VAR result:BOOLEAN;
BEGIN
result := FALSE;
IF ( rec1.numero = rec2.numero ) THEN
IF ( rec1.genero = rec2.genero ) THEN
IF ( rec1.persona = rec2.persona ) THEN
IF ( rec1.forma = rec2.forma ) THEN
IF ( rec1.cortesia = rec2.cortesia ) THEN
IF ( rec1.animate = rec2.animate ) THEN
IF ( rec1.NPhead = rec2.NPhead ) THEN
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
FUNCTION EQUAL_POSVARrecord
(rec1,rec2:LSDOMAINT_POSVARrecord):BOOLEAN;
VAR result:BOOLEAN;
BEGIN
result := FALSE;
result := TRUE;
EQUAL_POSVARrecord:= result
END;
FUNCTION EQUAL_POSSADJrecord
(rec1,rec2:LSDOMAINT_POSSADJrecord):BOOLEAN;
VAR result:BOOLEAN;
BEGIN
result := FALSE;
IF ( rec1.antecedent = rec2.antecedent ) THEN
IF ( rec1.concordnumero = rec2.concordnumero ) THEN
result := TRUE;
EQUAL_POSSADJrecord:= result
END;
FUNCTION EQUAL_BPOSSPROrecord
(rec1,rec2:LSDOMAINT_BPOSSPROrecord):BOOLEAN;
VAR result:BOOLEAN;
BEGIN
result := FALSE;
IF ( rec1.concordgenero = rec2.concordgenero ) THEN
IF ( rec1.concordnumero = rec2.concordnumero ) THEN
result := TRUE;
EQUAL_BPOSSPROrecord:= result
END;
FUNCTION EQUAL_POSSPROrecord
(rec1,rec2:LSDOMAINT_POSSPROrecord):BOOLEAN;
VAR result:BOOLEAN;
BEGIN
result := FALSE;
IF ( rec1.concordgenero = rec2.concordgenero ) THEN
IF ( rec1.concordnumero = rec2.concordnumero ) THEN
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
IF ( rec1.synpps = rec2.synpps ) THEN
IF ( rec1.thetapp = rec2.thetapp ) THEN
IF ( rec1.class = rec2.class ) THEN
IF ( rec1.tiempo = rec2.tiempo ) THEN
IF ( rec1.aspecto = rec2.aspecto ) THEN
IF ( rec1.contraction = rec2.contraction ) THEN
IF ( rec1.retro = rec2.retro ) THEN
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
IF ( rec1.tiempo = rec2.tiempo ) THEN
IF ( rec1.aspecto = rec2.aspecto ) THEN
IF ( rec1.retro = rec2.retro ) THEN
IF ( rec1.supertiempo = rec2.supertiempo ) THEN
IF ( rec1.SpecQ = rec2.SpecQ ) THEN
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
IF ( rec1.tiempo = rec2.tiempo ) THEN
IF ( rec1.aspecto = rec2.aspecto ) THEN
IF ( rec1.retro = rec2.retro ) THEN
IF ( rec1.supertiempo = rec2.supertiempo ) THEN
IF ( rec1.SpecQ = rec2.SpecQ ) THEN
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
IF ( rec1.tiempo = rec2.tiempo ) THEN
IF ( rec1.aspecto = rec2.aspecto ) THEN
IF ( rec1.retro = rec2.retro ) THEN
IF ( rec1.aktionsarts = rec2.aktionsarts ) THEN
IF ( rec1.supertiempo = rec2.supertiempo ) THEN
IF ( rec1.SpecQ = rec2.SpecQ ) THEN
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
IF ( rec1.tiempo = rec2.tiempo ) THEN
IF ( rec1.aspecto = rec2.aspecto ) THEN
IF ( rec1.retro = rec2.retro ) THEN
IF ( rec1.aktionsarts = rec2.aktionsarts ) THEN
IF ( rec1.supertiempo = rec2.supertiempo ) THEN
IF ( rec1.SpecQ = rec2.SpecQ ) THEN
result := TRUE;
EQUAL_PREPPPROPVARrecord:= result
END;
FUNCTION EQUAL_BPROPERNOUNrecord
(rec1,rec2:LSDOMAINT_BPROPERNOUNrecord):BOOLEAN;
VAR result:BOOLEAN;
BEGIN
result := FALSE;
IF ( rec1.genero = rec2.genero ) THEN
IF ( rec1.numero = rec2.numero ) THEN
IF ( rec1.subc = rec2.subc ) THEN
IF ( rec1.animate = rec2.animate ) THEN
IF ( rec1.human = rec2.human ) THEN
IF ( rec1.temporal = rec2.temporal ) THEN
IF ( rec1.class = rec2.class ) THEN
IF ( rec1.tiempo = rec2.tiempo ) THEN
IF ( rec1.aspecto = rec2.aspecto ) THEN
IF ( rec1.retro = rec2.retro ) THEN
result := TRUE;
EQUAL_BPROPERNOUNrecord:= result
END;
FUNCTION EQUAL_PROPERNOUNrecord
(rec1,rec2:LSDOMAINT_PROPERNOUNrecord):BOOLEAN;
VAR result:BOOLEAN;
BEGIN
result := FALSE;
IF ( rec1.genero = rec2.genero ) THEN
IF ( rec1.numero = rec2.numero ) THEN
IF ( rec1.subc = rec2.subc ) THEN
IF ( rec1.animate = rec2.animate ) THEN
IF ( rec1.human = rec2.human ) THEN
IF ( rec1.temporal = rec2.temporal ) THEN
IF ( rec1.class = rec2.class ) THEN
IF ( rec1.tiempo = rec2.tiempo ) THEN
IF ( rec1.aspecto = rec2.aspecto ) THEN
IF ( rec1.retro = rec2.retro ) THEN
result := TRUE;
EQUAL_PROPERNOUNrecord:= result
END;
FUNCTION EQUAL_PROSENTrecord
(rec1,rec2:LSDOMAINT_PROSENTrecord):BOOLEAN;
VAR result:BOOLEAN;
BEGIN
result := FALSE;
IF ( rec1.quesi = rec2.quesi ) THEN
result := TRUE;
EQUAL_PROSENTrecord:= result
END;
FUNCTION EQUAL_PROSENTVARrecord
(rec1,rec2:LSDOMAINT_PROSENTVARrecord):BOOLEAN;
VAR result:BOOLEAN;
BEGIN
result := FALSE;
IF ( rec1.quesi = rec2.quesi ) THEN
result := TRUE;
EQUAL_PROSENTVARrecord:= result
END;
FUNCTION EQUAL_PUNCrecord
(rec1,rec2:LSDOMAINT_PUNCrecord):BOOLEAN;
VAR result:BOOLEAN;
BEGIN
result := FALSE;
result := TRUE;
EQUAL_PUNCrecord:= result
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
IF ( rec1.supertiempo = rec2.supertiempo ) THEN
result := TRUE;
EQUAL_QPrecord:= result
END;
FUNCTION EQUAL_RECIPROrecord
(rec1,rec2:LSDOMAINT_RECIPROrecord):BOOLEAN;
VAR result:BOOLEAN;
BEGIN
result := FALSE;
IF ( rec1.genero = rec2.genero ) THEN
IF ( rec1.numero = rec2.numero ) THEN
result := TRUE;
EQUAL_RECIPROrecord:= result
END;
FUNCTION EQUAL_REFLPROrecord
(rec1,rec2:LSDOMAINT_REFLPROrecord):BOOLEAN;
VAR result:BOOLEAN;
BEGIN
result := FALSE;
IF ( rec1.antecedent = rec2.antecedent ) THEN
IF ( rec1.persona = rec2.persona ) THEN
IF ( rec1.numero = rec2.numero ) THEN
result := TRUE;
EQUAL_REFLPROrecord:= result
END;
FUNCTION EQUAL_RELPROrecord
(rec1,rec2:LSDOMAINT_RELPROrecord):BOOLEAN;
VAR result:BOOLEAN;
BEGIN
result := FALSE;
result := TRUE;
EQUAL_RELPROrecord:= result
END;
FUNCTION EQUAL_SErecord
(rec1,rec2:LSDOMAINT_SErecord):BOOLEAN;
VAR result:BOOLEAN;
BEGIN
result := FALSE;
result := TRUE;
EQUAL_SErecord:= result
END;
FUNCTION EQUAL_SENTENCErecord
(rec1,rec2:LSDOMAINT_SENTENCErecord):BOOLEAN;
VAR result:BOOLEAN;
BEGIN
result := FALSE;
IF ( rec1.req = rec2.req ) THEN
IF ( rec1.env = rec2.env ) THEN
IF ( rec1.mood = rec2.mood ) THEN
IF ( rec1.modo = rec2.modo ) THEN
IF ( rec1.senttype = rec2.senttype ) THEN
IF ( rec1.infsort = rec2.infsort ) THEN
IF ( rec1.voice = rec2.voice ) THEN
IF ( rec1.PROsubject = rec2.PROsubject ) THEN
IF ( rec1.synvpefs = rec2.synvpefs ) THEN
IF ( rec1.thetavp = rec2.thetavp ) THEN
IF ( rec1.adjuncts = rec2.adjuncts ) THEN
IF ( rec1.aktionsarts = rec2.aktionsarts ) THEN
IF ( rec1.aspecto = rec2.aspecto ) THEN
IF ( rec1.tiempo = rec2.tiempo ) THEN
IF ( rec1.retro = rec2.retro ) THEN
IF ( rec1.finiteness = rec2.finiteness ) THEN
IF ( rec1.VRcompl = rec2.VRcompl ) THEN
IF ( rec1.supertiempo = rec2.supertiempo ) THEN
IF ( rec1.Restructuring = rec2.Restructuring ) THEN
IF ( rec1.conjkey = rec2.conjkey ) THEN
IF ( rec1.adverbial = rec2.adverbial ) THEN
IF ( rec1.temporal = rec2.temporal ) THEN
IF ( rec1.conjclass = rec2.conjclass ) THEN
IF ( rec1.conjtiempo = rec2.conjtiempo ) THEN
IF ( rec1.conjaspecto = rec2.conjaspecto ) THEN
IF ( rec1.conjretro = rec2.conjretro ) THEN
IF ( rec1.PERSPROobj = rec2.PERSPROobj ) THEN
IF ( rec1.negpos = rec2.negpos ) THEN
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
IF ( rec1.modo = rec2.modo ) THEN
IF ( rec1.senttype = rec2.senttype ) THEN
IF ( rec1.infsort = rec2.infsort ) THEN
IF ( rec1.voice = rec2.voice ) THEN
IF ( rec1.PROsubject = rec2.PROsubject ) THEN
IF ( rec1.synvpefs = rec2.synvpefs ) THEN
IF ( rec1.thetavp = rec2.thetavp ) THEN
IF ( rec1.adjuncts = rec2.adjuncts ) THEN
IF ( rec1.aktionsarts = rec2.aktionsarts ) THEN
IF ( rec1.aspecto = rec2.aspecto ) THEN
IF ( rec1.tiempo = rec2.tiempo ) THEN
IF ( rec1.retro = rec2.retro ) THEN
IF ( rec1.finiteness = rec2.finiteness ) THEN
IF ( rec1.VRcompl = rec2.VRcompl ) THEN
IF ( rec1.supertiempo = rec2.supertiempo ) THEN
IF ( rec1.Restructuring = rec2.Restructuring ) THEN
IF ( rec1.conjkey = rec2.conjkey ) THEN
IF ( rec1.adverbial = rec2.adverbial ) THEN
IF ( rec1.temporal = rec2.temporal ) THEN
IF ( rec1.conjclass = rec2.conjclass ) THEN
IF ( rec1.conjtiempo = rec2.conjtiempo ) THEN
IF ( rec1.conjaspecto = rec2.conjaspecto ) THEN
IF ( rec1.conjretro = rec2.conjretro ) THEN
IF ( rec1.PERSPROobj = rec2.PERSPROobj ) THEN
IF ( rec1.negpos = rec2.negpos ) THEN
IF ( rec1.coord = rec2.coord ) THEN
result := TRUE;
EQUAL_SENTENCEVARrecord:= result
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
IF ( rec1.req = rec2.req ) THEN
IF ( rec1.env = rec2.env ) THEN
IF ( rec1.thanas = rec2.thanas ) THEN
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
IF ( rec1.conjclases = rec2.conjclases ) THEN
IF ( rec1.Aloclases = rec2.Aloclases ) THEN
IF ( rec1.possvoices = rec2.possvoices ) THEN
IF ( rec1.reflexivity = rec2.reflexivity ) THEN
IF ( rec1.synvps = rec2.synvps ) THEN
IF ( rec1.thetavp = rec2.thetavp ) THEN
IF ( rec1.adjuncts = rec2.adjuncts ) THEN
IF ( rec1.CaseAssigner = rec2.CaseAssigner ) THEN
IF ( rec1.subc = rec2.subc ) THEN
IF ( rec1.prepkey1 = rec2.prepkey1 ) THEN
IF ( rec1.prepkey2 = rec2.prepkey2 ) THEN
IF ( rec1.controller = rec2.controller ) THEN
IF ( rec1.Clustering = rec2.Clustering ) THEN
IF ( rec1.classes = rec2.classes ) THEN
IF ( rec1.intensV = rec2.intensV ) THEN
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
IF ( rec1.conjclases = rec2.conjclases ) THEN
IF ( rec1.Aloclases = rec2.Aloclases ) THEN
IF ( rec1.possvoices = rec2.possvoices ) THEN
IF ( rec1.reflexivity = rec2.reflexivity ) THEN
IF ( rec1.synvps = rec2.synvps ) THEN
IF ( rec1.thetavp = rec2.thetavp ) THEN
IF ( rec1.adjuncts = rec2.adjuncts ) THEN
IF ( rec1.CaseAssigner = rec2.CaseAssigner ) THEN
IF ( rec1.subc = rec2.subc ) THEN
IF ( rec1.prepkey1 = rec2.prepkey1 ) THEN
IF ( rec1.prepkey2 = rec2.prepkey2 ) THEN
IF ( rec1.controller = rec2.controller ) THEN
IF ( rec1.Clustering = rec2.Clustering ) THEN
IF ( rec1.classes = rec2.classes ) THEN
IF ( rec1.intensV = rec2.intensV ) THEN
result := TRUE;
EQUAL_SUBVERBrecord:= result
END;
FUNCTION EQUAL_ALOVERBrecord
(rec1,rec2:LSDOMAINT_ALOVERBrecord):BOOLEAN;
VAR result:BOOLEAN;
BEGIN
result := FALSE;
IF ( rec1.req = rec2.req ) THEN
IF ( rec1.env = rec2.env ) THEN
IF ( rec1.conjclases = rec2.conjclases ) THEN
IF ( rec1.Aloclases = rec2.Aloclases ) THEN
IF ( rec1.numero = rec2.numero ) THEN
IF ( rec1.persona = rec2.persona ) THEN
IF ( rec1.genero = rec2.genero ) THEN
IF ( rec1.futuro = rec2.futuro ) THEN
IF ( rec1.modo = rec2.modo ) THEN
IF ( rec1.tiempo = rec2.tiempo ) THEN
IF ( rec1.aspecto = rec2.aspecto ) THEN
IF ( rec1.possvoices = rec2.possvoices ) THEN
IF ( rec1.reflexivity = rec2.reflexivity ) THEN
IF ( rec1.synvps = rec2.synvps ) THEN
IF ( rec1.thetavp = rec2.thetavp ) THEN
IF ( rec1.adjuncts = rec2.adjuncts ) THEN
IF ( rec1.CaseAssigner = rec2.CaseAssigner ) THEN
IF ( rec1.subc = rec2.subc ) THEN
IF ( rec1.prepkey1 = rec2.prepkey1 ) THEN
IF ( rec1.prepkey2 = rec2.prepkey2 ) THEN
IF ( rec1.controller = rec2.controller ) THEN
IF ( rec1.Clustering = rec2.Clustering ) THEN
IF ( rec1.status = rec2.status ) THEN
IF ( rec1.classes = rec2.classes ) THEN
IF ( rec1.intensV = rec2.intensV ) THEN
result := TRUE;
EQUAL_ALOVERBrecord:= result
END;
FUNCTION EQUAL_VERBrecord
(rec1,rec2:LSDOMAINT_VERBrecord):BOOLEAN;
VAR result:BOOLEAN;
BEGIN
result := FALSE;
IF ( rec1.req = rec2.req ) THEN
IF ( rec1.env = rec2.env ) THEN
IF ( rec1.conjclases = rec2.conjclases ) THEN
IF ( rec1.Aloclases = rec2.Aloclases ) THEN
IF ( rec1.numero = rec2.numero ) THEN
IF ( rec1.persona = rec2.persona ) THEN
IF ( rec1.genero = rec2.genero ) THEN
IF ( rec1.futuro = rec2.futuro ) THEN
IF ( rec1.modo = rec2.modo ) THEN
IF ( rec1.tiempo = rec2.tiempo ) THEN
IF ( rec1.aspecto = rec2.aspecto ) THEN
IF ( rec1.possvoices = rec2.possvoices ) THEN
IF ( rec1.reflexivity = rec2.reflexivity ) THEN
IF ( rec1.synvps = rec2.synvps ) THEN
IF ( rec1.thetavp = rec2.thetavp ) THEN
IF ( rec1.adjuncts = rec2.adjuncts ) THEN
IF ( rec1.CaseAssigner = rec2.CaseAssigner ) THEN
IF ( rec1.subc = rec2.subc ) THEN
IF ( rec1.foundauxes = rec2.foundauxes ) THEN
IF ( rec1.prepkey1 = rec2.prepkey1 ) THEN
IF ( rec1.prepkey2 = rec2.prepkey2 ) THEN
IF ( rec1.controller = rec2.controller ) THEN
IF ( rec1.Clustering = rec2.Clustering ) THEN
IF ( rec1.status = rec2.status ) THEN
IF ( rec1.classes = rec2.classes ) THEN
IF ( rec1.intensV = rec2.intensV ) THEN
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
IF ( rec1.supertiempo = rec2.supertiempo ) THEN
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
IF ( rec1.supertiempo = rec2.supertiempo ) THEN
IF ( rec1.PROsubject = rec2.PROsubject ) THEN
IF ( rec1.voice = rec2.voice ) THEN
IF ( rec1.synvpefs = rec2.synvpefs ) THEN
IF ( rec1.thetavp = rec2.thetavp ) THEN
IF ( rec1.adjuncts = rec2.adjuncts ) THEN
IF ( rec1.aktionsarts = rec2.aktionsarts ) THEN
result := TRUE;
EQUAL_VERBPPROPVARrecord:= result
END;
FUNCTION EQUAL_BWHADJrecord
(rec1,rec2:LSDOMAINT_BWHADJrecord):BOOLEAN;
VAR result:BOOLEAN;
BEGIN
result := FALSE;
IF ( rec1.genero = rec2.genero ) THEN
IF ( rec1.feminforma = rec2.feminforma ) THEN
IF ( rec1.pluralforma = rec2.pluralforma ) THEN
result := TRUE;
EQUAL_BWHADJrecord:= result
END;
FUNCTION EQUAL_WHADJrecord
(rec1,rec2:LSDOMAINT_WHADJrecord):BOOLEAN;
VAR result:BOOLEAN;
BEGIN
result := FALSE;
IF ( rec1.numero = rec2.numero ) THEN
IF ( rec1.genero = rec2.genero ) THEN
IF ( rec1.feminforma = rec2.feminforma ) THEN
result := TRUE;
EQUAL_WHADJrecord:= result
END;
FUNCTION EQUAL_BWHPROrecord
(rec1,rec2:LSDOMAINT_BWHPROrecord):BOOLEAN;
VAR result:BOOLEAN;
BEGIN
result := FALSE;
IF ( rec1.numero = rec2.numero ) THEN
IF ( rec1.genero = rec2.genero ) THEN
IF ( rec1.feminforma = rec2.feminforma ) THEN
IF ( rec1.pluralforma = rec2.pluralforma ) THEN
IF ( rec1.animate = rec2.animate ) THEN
result := TRUE;
EQUAL_BWHPROrecord:= result
END;
FUNCTION EQUAL_WHPROrecord
(rec1,rec2:LSDOMAINT_WHPROrecord):BOOLEAN;
VAR result:BOOLEAN;
BEGIN
result := FALSE;
IF ( rec1.numero = rec2.numero ) THEN
IF ( rec1.genero = rec2.genero ) THEN
IF ( rec1.feminforma = rec2.feminforma ) THEN
IF ( rec1.animate = rec2.animate ) THEN
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
ADVP : result := equal_ADVPrecord
(lss1^.ls^.ADVPfield^,lss2^.ls^.ADVPfield^);
ADVPVAR : result := equal_ADVPVARrecord
(lss1^.ls^.ADVPVARfield^,lss2^.ls^.ADVPVARfield^);
ADVPPROP : result := equal_ADVPPROPrecord
(lss1^.ls^.ADVPPROPfield^,lss2^.ls^.ADVPPROPfield^);
ADVPFORMULA : result := equal_ADVPPROPrecord
(lss1^.ls^.ADVPFORMULAfield^,lss2^.ls^.ADVPFORMULAfield^);
OPENADVPPROP : result := equal_ADVPPROPrecord
(lss1^.ls^.OPENADVPPROPfield^,lss2^.ls^.OPENADVPPROPfield^);
CLOSEDADVPPROP : result := equal_ADVPPROPrecord
(lss1^.ls^.CLOSEDADVPPROPfield^,lss2^.ls^.CLOSEDADVPPROPfield^);
ART : result := equal_ARTrecord
(lss1^.ls^.ARTfield^,lss2^.ls^.ARTfield^);
BIGPRO : result := equal_BPERSPROrecord
(lss1^.ls^.BIGPROfield^,lss2^.ls^.BIGPROfield^);
CLAUSE : result := equal_CLAUSErecord
(lss1^.ls^.CLAUSEfield^,lss2^.ls^.CLAUSEfield^);
CLITIC : result := equal_NOrecord
(lss1^.ls^.CLITICfield^,lss2^.ls^.CLITICfield^);
CONJ : result := equal_CONJrecord
(lss1^.ls^.CONJfield^,lss2^.ls^.CONJfield^);
COORD : result := equal_COORDrecord
(lss1^.ls^.COORDfield^,lss2^.ls^.COORDfield^);
BDEMADJ : result := equal_BDEMADJrecord
(lss1^.ls^.BDEMADJfield^,lss2^.ls^.BDEMADJfield^);
DEMADJ : result := equal_DEMADJrecord
(lss1^.ls^.DEMADJfield^,lss2^.ls^.DEMADJfield^);
DEMPRO : result := equal_DEMPROrecord
(lss1^.ls^.DEMPROfield^,lss2^.ls^.DEMPROfield^);
BDET : result := equal_BDETrecord
(lss1^.ls^.BDETfield^,lss2^.ls^.BDETfield^);
DET : result := equal_DETrecord
(lss1^.ls^.DETfield^,lss2^.ls^.DETfield^);
DETP : result := equal_DETPrecord
(lss1^.ls^.DETPfield^,lss2^.ls^.DETPfield^);
EC : result := equal_ECrecord
(lss1^.ls^.ECfield^,lss2^.ls^.ECfield^);
EN : result := equal_ENrecord
(lss1^.ls^.ENfield^,lss2^.ls^.ENfield^);
EMPTY : result := equal_EMPTYrecord
(lss1^.ls^.EMPTYfield^,lss2^.ls^.EMPTYfield^);
EXCLAM : result := equal_EXCLAMrecord
(lss1^.ls^.EXCLAMfield^,lss2^.ls^.EXCLAMfield^);
INDEFPRO : result := equal_INDEFPROrecord
(lss1^.ls^.INDEFPROfield^,lss2^.ls^.INDEFPROfield^);
SUBINDEFPRO : result := equal_INDEFPROrecord
(lss1^.ls^.SUBINDEFPROfield^,lss2^.ls^.SUBINDEFPROfield^);
NEG : result := equal_NEGrecord
(lss1^.ls^.NEGfield^,lss2^.ls^.NEGfield^);
NEGVAR : result := equal_NEGVARrecord
(lss1^.ls^.NEGVARfield^,lss2^.ls^.NEGVARfield^);
DIGIT : result := equal_DIGITrecord
(lss1^.ls^.DIGITfield^,lss2^.ls^.DIGITfield^);
CARD : result := equal_CARDrecord
(lss1^.ls^.CARDfield^,lss2^.ls^.CARDfield^);
BNOUNSUFF : result := equal_BNOUNrecord
(lss1^.ls^.BNOUNSUFFfield^,lss2^.ls^.BNOUNSUFFfield^);
BNOUN : result := equal_BNOUNrecord
(lss1^.ls^.BNOUNfield^,lss2^.ls^.BNOUNfield^);
SUBNOUN : result := equal_SUBNOUNrecord
(lss1^.ls^.SUBNOUNfield^,lss2^.ls^.SUBNOUNfield^);
NOUN : result := equal_NOUNrecord
(lss1^.ls^.NOUNfield^,lss2^.ls^.NOUNfield^);
CN : result := equal_CNrecord
(lss1^.ls^.CNfield^,lss2^.ls^.CNfield^);
NP : result := equal_NPrecord
(lss1^.ls^.NPfield^,lss2^.ls^.NPfield^);
PRONP : result := equal_NPrecord
(lss1^.ls^.PRONPfield^,lss2^.ls^.PRONPfield^);
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
BPERSPRO : result := equal_BPERSPROrecord
(lss1^.ls^.BPERSPROfield^,lss2^.ls^.BPERSPROfield^);
PERSPRO : result := equal_PERSPROrecord
(lss1^.ls^.PERSPROfield^,lss2^.ls^.PERSPROfield^);
SE : result := equal_SErecord
(lss1^.ls^.SEfield^,lss2^.ls^.SEfield^);
POS : result := equal_POSrecord
(lss1^.ls^.POSfield^,lss2^.ls^.POSfield^);
POSVAR : result := equal_POSVARrecord
(lss1^.ls^.POSVARfield^,lss2^.ls^.POSVARfield^);
POSSADJ : result := equal_POSSADJrecord
(lss1^.ls^.POSSADJfield^,lss2^.ls^.POSSADJfield^);
BPOSSPRO : result := equal_BPOSSPROrecord
(lss1^.ls^.BPOSSPROfield^,lss2^.ls^.BPOSSPROfield^);
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
BPROPERNOUN : result := equal_BPROPERNOUNrecord
(lss1^.ls^.BPROPERNOUNfield^,lss2^.ls^.BPROPERNOUNfield^);
PROPERNOUN : result := equal_PROPERNOUNrecord
(lss1^.ls^.PROPERNOUNfield^,lss2^.ls^.PROPERNOUNfield^);
PROSENT : result := equal_PROSENTrecord
(lss1^.ls^.PROSENTfield^,lss2^.ls^.PROSENTfield^);
PUNC : result := equal_PUNCrecord
(lss1^.ls^.PUNCfield^,lss2^.ls^.PUNCfield^);
Q : result := equal_Qrecord
(lss1^.ls^.Qfield^,lss2^.ls^.Qfield^);
QP : result := equal_QPrecord
(lss1^.ls^.QPfield^,lss2^.ls^.QPfield^);
RECIPRO : result := equal_RECIPROrecord
(lss1^.ls^.RECIPROfield^,lss2^.ls^.RECIPROfield^);
REFLPRO : result := equal_REFLPROrecord
(lss1^.ls^.REFLPROfield^,lss2^.ls^.REFLPROfield^);
RELPRO : result := equal_RELPROrecord
(lss1^.ls^.RELPROfield^,lss2^.ls^.RELPROfield^);
SENTENCE : result := equal_SENTENCErecord
(lss1^.ls^.SENTENCEfield^,lss2^.ls^.SENTENCEfield^);
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
PREPPVAR : result := equal_PREPPVARrecord
(lss1^.ls^.PREPPVARfield^,lss2^.ls^.PREPPVARfield^);
PREPPPROPVAR : result := equal_PREPPPROPVARrecord
(lss1^.ls^.PREPPPROPVARfield^,lss2^.ls^.PREPPPROPVARfield^);
NPVAR : result := equal_NPVARrecord
(lss1^.ls^.NPVARfield^,lss2^.ls^.NPVARfield^);
SENTENCEVAR : result := equal_SENTENCEVARrecord
(lss1^.ls^.SENTENCEVARfield^,lss2^.ls^.SENTENCEVARfield^);
PROSENTVAR : result := equal_PROSENTVARrecord
(lss1^.ls^.PROSENTVARfield^,lss2^.ls^.PROSENTVARfield^);
EMPTYVAR : result := equal_EMPTYVARrecord
(lss1^.ls^.EMPTYVARfield^,lss2^.ls^.EMPTYVARfield^);
VERBPPROPVAR : result := equal_VERBPPROPVARrecord
(lss1^.ls^.VERBPPROPVARfield^,lss2^.ls^.VERBPPROPVARfield^);
PRONPVAR : result := equal_NPVARrecord
(lss1^.ls^.PRONPVARfield^,lss2^.ls^.PRONPVARfield^);
BVERBSUFF : result := equal_BVERBrecord
(lss1^.ls^.BVERBSUFFfield^,lss2^.ls^.BVERBSUFFfield^);
BVERB : result := equal_BVERBrecord
(lss1^.ls^.BVERBfield^,lss2^.ls^.BVERBfield^);
ALOVERB : result := equal_ALOVERBrecord
(lss1^.ls^.ALOVERBfield^,lss2^.ls^.ALOVERBfield^);
SUBVERB : result := equal_SUBVERBrecord
(lss1^.ls^.SUBVERBfield^,lss2^.ls^.SUBVERBfield^);
VERB : result := equal_VERBrecord
(lss1^.ls^.VERBfield^,lss2^.ls^.VERBfield^);
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
BWHADJ : result := equal_BWHADJrecord
(lss1^.ls^.BWHADJfield^,lss2^.ls^.BWHADJfield^);
WHADJ : result := equal_WHADJrecord
(lss1^.ls^.WHADJfield^,lss2^.ls^.WHADJfield^);
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
