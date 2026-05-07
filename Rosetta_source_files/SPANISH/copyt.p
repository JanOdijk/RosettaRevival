Export(COPYT);
pragma C_include('lsdomaint.pf');
pragma C_include('copyt.pf');


PROGRAM COPYT;
WITH LSDOMAINT;
FUNCTION COPYT_SUBNOUNtoNOUN(
  rec1:LSDOMAINT_SUBNOUNrecord):LSDOMAINT_NOUNrecord;
VAR rec2:LSDOMAINT_NOUNrecord;
BEGIN
WITH rec2 DO
     BEGIN
     req:= rec1.req;
     env:= rec1.env;
     pluralforma:= rec1.pluralforma;
     generos:= rec1.generos;
     numero:= omeganumero;
     class:= rec1.class;
     tiempo:= rec1.tiempo;
     aspecto:= rec1.aspecto;
     retro:= rec1.retro;
     subcs:= rec1.subcs;
     temporal:= rec1.temporal;
     animate:= rec1.animate;
     human:= rec1.human;
     posscomas:= rec1.posscomas;
     thetanp:= rec1.thetanp;
     nounpatterns:= rec1.nounpatterns;
     prepkey:= rec1.prepkey;
     personal:= rec1.personal;
     Npropio:= rec1.Npropio;
     inalienable:= rec1.inalienable
     END;
COPYT_SUBNOUNtoNOUN:=rec2
END;
FUNCTION COPYX_SUBNOUNtoNOUN(
  rec2:LSDOMAINT_NOUNrecord;
  rec1:LSDOMAINT_SUBNOUNrecord):BOOLEAN;
BEGIN
COPYX_SUBNOUNtoNOUN:=
  (rec2.req= rec1.req) AND
  (rec2.env= rec1.env) AND
  (rec2.pluralforma= rec1.pluralforma) AND
  (rec2.generos= rec1.generos) AND
  (rec2.class= rec1.class) AND
  (rec2.tiempo= rec1.tiempo) AND
  (rec2.aspecto= rec1.aspecto) AND
  (rec2.retro= rec1.retro) AND
  (rec2.subcs= rec1.subcs) AND
  (rec2.temporal= rec1.temporal) AND
  (rec2.animate= rec1.animate) AND
  (rec2.human= rec1.human) AND
  (rec2.posscomas= rec1.posscomas) AND
  (rec2.thetanp= rec1.thetanp) AND
  (rec2.nounpatterns= rec1.nounpatterns) AND
  (rec2.prepkey= rec1.prepkey) AND
  (rec2.personal= rec1.personal) AND
  (rec2.Npropio= rec1.Npropio) AND
  (rec2.inalienable= rec1.inalienable)
END;
FUNCTION COPYT_NOUNtoCN(
  rec1:LSDOMAINT_NOUNrecord):LSDOMAINT_CNrecord;
VAR rec2:LSDOMAINT_CNrecord;
BEGIN
WITH rec2 DO
     BEGIN
     req:= rec1.req;
     env:= rec1.env;
     supertiempo:= omegatiempo;
     class:= rec1.class;
     tiempo:= rec1.tiempo;
     aspecto:= rec1.aspecto;
     retro:= rec1.retro;
     definite:= omegadef;
     numero:= rec1.numero;
     generos:= rec1.generos;
     actsubcs:= [othernoun];
     temporal:= rec1.temporal;
     animate:= rec1.animate;
     human:= rec1.human;
     posscomas:= rec1.posscomas;
     thetanp:= rec1.thetanp;
     nounpatternefs:= [];
     cases:= []
     END;
COPYT_NOUNtoCN:=rec2
END;
FUNCTION COPYX_NOUNtoCN(
  rec2:LSDOMAINT_CNrecord;
  rec1:LSDOMAINT_NOUNrecord):BOOLEAN;
BEGIN
COPYX_NOUNtoCN:=
  (rec2.req= rec1.req) AND
  (rec2.env= rec1.env) AND
  (rec2.class= rec1.class) AND
  (rec2.tiempo= rec1.tiempo) AND
  (rec2.aspecto= rec1.aspecto) AND
  (rec2.retro= rec1.retro) AND
  (rec2.numero= rec1.numero) AND
  (rec2.generos= rec1.generos) AND
  (rec2.temporal= rec1.temporal) AND
  (rec2.animate= rec1.animate) AND
  (rec2.human= rec1.human) AND
  (rec2.posscomas= rec1.posscomas) AND
  (rec2.thetanp= rec1.thetanp)
END;
FUNCTION COPYT_BtoSUBNOUN(
  rec1:LSDOMAINT_BNOUNrecord):LSDOMAINT_SUBNOUNrecord;
VAR rec2:LSDOMAINT_SUBNOUNrecord;
BEGIN
WITH rec2 DO
     BEGIN
     req:= rec1.req;
     env:= rec1.env;
     pluralforma:= rec1.pluralforma;
     generos:= rec1.generos;
     class:= rec1.class;
     tiempo:= rec1.tiempo;
     aspecto:= rec1.aspecto;
     retro:= rec1.retro;
     subcs:= rec1.subcs;
     temporal:= rec1.temporal;
     animate:= rec1.animate;
     human:= rec1.human;
     posscomas:= rec1.posscomas;
     thetanp:= rec1.thetanp;
     nounpatterns:= rec1.nounpatterns;
     prepkey:= rec1.prepkey;
     personal:= rec1.personal;
     Npropio:= rec1.Npropio;
     inalienable:= rec1.inalienable
     END;
COPYT_BtoSUBNOUN:=rec2
END;
FUNCTION COPYX_BtoSUBNOUN(
  rec2:LSDOMAINT_SUBNOUNrecord;
  rec1:LSDOMAINT_BNOUNrecord):BOOLEAN;
BEGIN
COPYX_BtoSUBNOUN:=
  (rec2.req= rec1.req) AND
  (rec2.env= rec1.env) AND
  (rec2.pluralforma= rec1.pluralforma) AND
  (rec2.generos= rec1.generos) AND
  (rec2.class= rec1.class) AND
  (rec2.tiempo= rec1.tiempo) AND
  (rec2.aspecto= rec1.aspecto) AND
  (rec2.retro= rec1.retro) AND
  (rec2.subcs= rec1.subcs) AND
  (rec2.temporal= rec1.temporal) AND
  (rec2.animate= rec1.animate) AND
  (rec2.human= rec1.human) AND
  (rec2.posscomas= rec1.posscomas) AND
  (rec2.thetanp= rec1.thetanp) AND
  (rec2.nounpatterns= rec1.nounpatterns) AND
  (rec2.prepkey= rec1.prepkey) AND
  (rec2.personal= rec1.personal) AND
  (rec2.Npropio= rec1.Npropio) AND
  (rec2.inalienable= rec1.inalienable)
END;
FUNCTION COPYT_ADJtoADJP(
  rec1:LSDOMAINT_ADJrecord):LSDOMAINT_ADJPrecord;
VAR rec2:LSDOMAINT_ADJPrecord;
BEGIN
WITH rec2 DO
     BEGIN
     req:= rec1.req;
     env:= rec1.env;
     genero:= rec1.genero;
     numero:= rec1.numero;
     apocope:= rec1.apocope;
     posicion:= rec1.posicion;
     class:= rec1.class;
     tiempo:= rec1.tiempo;
     aspecto:= rec1.aspecto;
     retro:= rec1.retro;
     uses:= rec1.uses;
     temporal:= rec1.temporal;
     actsubcefs:= [otheradj];
     thetaadj:= rec1.thetaadj;
     adjpatternefs:= [];
     reflexivity:= rec1.reflexivity;
     mood:= declxpmood;
     copulas:= rec1.copulas;
     coord:= nocoord
     END;
COPYT_ADJtoADJP:=rec2
END;
FUNCTION COPYX_ADJtoADJP(
  rec2:LSDOMAINT_ADJPrecord;
  rec1:LSDOMAINT_ADJrecord):BOOLEAN;
BEGIN
COPYX_ADJtoADJP:=
  (rec2.req= rec1.req) AND
  (rec2.env= rec1.env) AND
  (rec2.genero= rec1.genero) AND
  (rec2.numero= rec1.numero) AND
  (rec2.apocope= rec1.apocope) AND
  (rec2.posicion= rec1.posicion) AND
  (rec2.class= rec1.class) AND
  (rec2.tiempo= rec1.tiempo) AND
  (rec2.aspecto= rec1.aspecto) AND
  (rec2.retro= rec1.retro) AND
  (rec2.uses= rec1.uses) AND
  (rec2.temporal= rec1.temporal) AND
  (rec2.thetaadj= rec1.thetaadj) AND
  (rec2.reflexivity= rec1.reflexivity) AND
  (rec2.copulas= rec1.copulas)
END;
FUNCTION COPYT_ADJPtoADJPPROP(
  rec1:LSDOMAINT_ADJPrecord):LSDOMAINT_ADJPPROPrecord;
VAR rec2:LSDOMAINT_ADJPPROPrecord;
BEGIN
WITH rec2 DO
     BEGIN
     req:= rec1.req;
     env:= rec1.env;
     class:= rec1.class;
     tiempo:= rec1.tiempo;
     aspecto:= rec1.aspecto;
     retro:= rec1.retro;
     aktionsarts:= [];
     uses:= rec1.uses;
     supertiempo:= omegatiempo;
     temporal:= rec1.temporal;
     actsubcefs:= rec1.actsubcefs;
     thetaadj:= rec1.thetaadj;
     adjpatternefs:= rec1.adjpatternefs;
     mood:= rec1.mood;
     copulas:= rec1.copulas;
     PROsubject:= false
     END;
COPYT_ADJPtoADJPPROP:=rec2
END;
FUNCTION COPYX_ADJPtoADJPPROP(
  rec2:LSDOMAINT_ADJPPROPrecord;
  rec1:LSDOMAINT_ADJPrecord):BOOLEAN;
BEGIN
COPYX_ADJPtoADJPPROP:=
  (rec2.req= rec1.req) AND
  (rec2.env= rec1.env) AND
  (rec2.class= rec1.class) AND
  (rec2.tiempo= rec1.tiempo) AND
  (rec2.aspecto= rec1.aspecto) AND
  (rec2.retro= rec1.retro) AND
  (rec2.uses= rec1.uses) AND
  (rec2.temporal= rec1.temporal) AND
  (rec2.actsubcefs= rec1.actsubcefs) AND
  (rec2.thetaadj= rec1.thetaadj) AND
  (rec2.adjpatternefs= rec1.adjpatternefs) AND
  (rec2.mood= rec1.mood) AND
  (rec2.copulas= rec1.copulas)
END;
FUNCTION COPYT_PREPPtoPREPPPROP(
  rec1:LSDOMAINT_PREPPrecord):LSDOMAINT_PREPPPROPrecord;
VAR rec2:LSDOMAINT_PREPPPROPrecord;
BEGIN
WITH rec2 DO
     BEGIN
     req:= rec1.req;
     env:= rec1.env;
     mood:= rec1.mood;
     actsubcefs:= rec1.actsubcefs;
     PROsubject:= false;
     synppefs:= rec1.synppefs;
     thetapp:= rec1.thetapp;
     headkey:= rec1.headkey;
     class:= rec1.class;
     tiempo:= rec1.tiempo;
     aspecto:= rec1.aspecto;
     retro:= rec1.retro;
     aktionsarts:= [];
     supertiempo:= rec1.supertiempo;
     SpecQ:= rec1.SpecQ
     END;
COPYT_PREPPtoPREPPPROP:=rec2
END;
FUNCTION COPYX_PREPPtoPREPPPROP(
  rec2:LSDOMAINT_PREPPPROPrecord;
  rec1:LSDOMAINT_PREPPrecord):BOOLEAN;
BEGIN
COPYX_PREPPtoPREPPPROP:=
  (rec2.req= rec1.req) AND
  (rec2.env= rec1.env) AND
  (rec2.mood= rec1.mood) AND
  (rec2.actsubcefs= rec1.actsubcefs) AND
  (rec2.synppefs= rec1.synppefs) AND
  (rec2.thetapp= rec1.thetapp) AND
  (rec2.headkey= rec1.headkey) AND
  (rec2.class= rec1.class) AND
  (rec2.tiempo= rec1.tiempo) AND
  (rec2.aspecto= rec1.aspecto) AND
  (rec2.retro= rec1.retro) AND
  (rec2.supertiempo= rec1.supertiempo) AND
  (rec2.SpecQ= rec1.SpecQ)
END;
FUNCTION COPYT_CNTOVAR(
  rec1:LSDOMAINT_CNrecord):LSDOMAINT_CNVARrecord;
VAR rec2:LSDOMAINT_CNVARrecord;
BEGIN
WITH rec2 DO
     BEGIN
     req:= rec1.req;
     env:= rec1.env;
     supertiempo:= rec1.supertiempo;
     class:= rec1.class;
     tiempo:= rec1.tiempo;
     aspecto:= rec1.aspecto;
     retro:= rec1.retro;
     definite:= rec1.definite;
     numero:= rec1.numero;
     generos:= rec1.generos;
     actsubcs:= rec1.actsubcs;
     temporal:= rec1.temporal;
     animate:= rec1.animate;
     human:= rec1.human;
     posscomas:= rec1.posscomas;
     thetanp:= rec1.thetanp;
     nounpatternefs:= rec1.nounpatternefs;
     cases:= rec1.cases
     END;
COPYT_CNTOVAR:=rec2
END;
FUNCTION COPYX_CNTOVAR(
  rec2:LSDOMAINT_CNVARrecord;
  rec1:LSDOMAINT_CNrecord):BOOLEAN;
BEGIN
COPYX_CNTOVAR:=
  (rec2.req= rec1.req) AND
  (rec2.env= rec1.env) AND
  (rec2.supertiempo= rec1.supertiempo) AND
  (rec2.class= rec1.class) AND
  (rec2.tiempo= rec1.tiempo) AND
  (rec2.aspecto= rec1.aspecto) AND
  (rec2.retro= rec1.retro) AND
  (rec2.definite= rec1.definite) AND
  (rec2.numero= rec1.numero) AND
  (rec2.generos= rec1.generos) AND
  (rec2.actsubcs= rec1.actsubcs) AND
  (rec2.temporal= rec1.temporal) AND
  (rec2.animate= rec1.animate) AND
  (rec2.human= rec1.human) AND
  (rec2.posscomas= rec1.posscomas) AND
  (rec2.thetanp= rec1.thetanp) AND
  (rec2.nounpatternefs= rec1.nounpatternefs) AND
  (rec2.cases= rec1.cases)
END;
FUNCTION COPYT_CNtoNP(
  rec1:LSDOMAINT_CNrecord):LSDOMAINT_NPrecord;
VAR rec2:LSDOMAINT_NPrecord;
BEGIN
WITH rec2 DO
     BEGIN
     req:= rec1.req;
     env:= rec1.env;
     supertiempo:= rec1.supertiempo;
     class:= rec1.class;
     tiempo:= rec1.tiempo;
     aspecto:= rec1.aspecto;
     retro:= rec1.retro;
     persona:= 3;
     genero:= omegagenero;
     actsubcs:= rec1.actsubcs;
     temporal:= rec1.temporal;
     animate:= rec1.animate;
     human:= rec1.human;
     actcomas:= [count];
     mood:= declxpmood;
     numero:= rec1.numero;
     definite:= rec1.definite;
     generic:= omegageneric;
     thetanp:= rec1.thetanp;
     nounpatternefs:= rec1.nounpatternefs;
     posspred:= false;
     possnietnp:= false;
     syntquant:= omegaquant;
     NPhead:= otherNP;
     SpecQ:= omegaspec;
     DefSpec:= false;
     cases:= rec1.cases;
     coord:= nocoord
     END;
COPYT_CNtoNP:=rec2
END;
FUNCTION COPYX_CNtoNP(
  rec2:LSDOMAINT_NPrecord;
  rec1:LSDOMAINT_CNrecord):BOOLEAN;
BEGIN
COPYX_CNtoNP:=
  (rec2.req= rec1.req) AND
  (rec2.env= rec1.env) AND
  (rec2.supertiempo= rec1.supertiempo) AND
  (rec2.class= rec1.class) AND
  (rec2.tiempo= rec1.tiempo) AND
  (rec2.aspecto= rec1.aspecto) AND
  (rec2.retro= rec1.retro) AND
  (rec2.actsubcs= rec1.actsubcs) AND
  (rec2.temporal= rec1.temporal) AND
  (rec2.animate= rec1.animate) AND
  (rec2.human= rec1.human) AND
  (rec2.numero= rec1.numero) AND
  (rec2.definite= rec1.definite) AND
  (rec2.thetanp= rec1.thetanp) AND
  (rec2.nounpatternefs= rec1.nounpatternefs) AND
  (rec2.cases= rec1.cases)
END;
FUNCTION COPYT_ARTtoDETP(
  rec1:LSDOMAINT_ARTrecord):LSDOMAINT_DETPrecord;
VAR rec2:LSDOMAINT_DETPrecord;
BEGIN
WITH rec2 DO
     BEGIN
     req:= [pospol,negpol,omegapol];
     env:= [pospol,negpol,omegapol];
     numero:= rec1.numero;
     genero:= rec1.genero;
     definite:= rec1.definite;
     posspred:= false;
     posscomas:= rec1.posscomas;
     mood:= declxpmood;
     syntquant:= omegaquant;
     supertiempo:= omegatiempo
     END;
COPYT_ARTtoDETP:=rec2
END;
FUNCTION COPYX_ARTtoDETP(
  rec2:LSDOMAINT_DETPrecord;
  rec1:LSDOMAINT_ARTrecord):BOOLEAN;
BEGIN
COPYX_ARTtoDETP:=
  (rec2.numero= rec1.numero) AND
  (rec2.genero= rec1.genero) AND
  (rec2.definite= rec1.definite) AND
  (rec2.posscomas= rec1.posscomas)
END;
FUNCTION COPYT_WHPROtoNP(
  rec1:LSDOMAINT_WHPROrecord):LSDOMAINT_NPrecord;
VAR rec2:LSDOMAINT_NPrecord;
BEGIN
WITH rec2 DO
     BEGIN
     req:= [pospol,negpol,omegapol];
     env:= [pospol,negpol,omegapol];
     supertiempo:= omegatiempo;
     class:= omegaTimeAdvClass;
     tiempo:= omegatiempo;
     aspecto:= omegaaspecto;
     retro:= false;
     persona:= 3;
     genero:= rec1.genero;
     actsubcs:= [othernoun];
     temporal:= false;
     animate:= rec1.animate;
     human:= OmegaHuman;
     actcomas:= [count];
     mood:= declxpmood;
     numero:= rec1.numero;
     definite:= omegadef;
     generic:= omegageneric;
     thetanp:= omegathetanp;
     nounpatternefs:= [];
     posspred:= false;
     possnietnp:= false;
     syntquant:= omegaquant;
     NPhead:= otherNP;
     SpecQ:= omegaspec;
     DefSpec:= false;
     cases:= [];
     coord:= nocoord
     END;
COPYT_WHPROtoNP:=rec2
END;
FUNCTION COPYX_WHPROtoNP(
  rec2:LSDOMAINT_NPrecord;
  rec1:LSDOMAINT_WHPROrecord):BOOLEAN;
BEGIN
COPYX_WHPROtoNP:=
  (rec2.genero= rec1.genero) AND
  (rec2.animate= rec1.animate) AND
  (rec2.numero= rec1.numero)
END;
FUNCTION COPYT_INDEFPROtoNP(
  rec1:LSDOMAINT_INDEFPROrecord):LSDOMAINT_NPrecord;
VAR rec2:LSDOMAINT_NPrecord;
BEGIN
WITH rec2 DO
     BEGIN
     req:= rec1.req;
     env:= rec1.env;
     supertiempo:= omegatiempo;
     class:= omegaTimeAdvClass;
     tiempo:= omegatiempo;
     aspecto:= omegaaspecto;
     retro:= false;
     persona:= 3;
     genero:= omegagenero;
     actsubcs:= [othernoun];
     temporal:= false;
     animate:= OmegaAnimate;
     human:= OmegaHuman;
     actcomas:= [count];
     mood:= rec1.mood;
     numero:= rec1.numero;
     definite:= rec1.definite;
     generic:= omegageneric;
     thetanp:= omegathetanp;
     nounpatternefs:= [];
     posspred:= false;
     possnietnp:= false;
     syntquant:= omegaquant;
     NPhead:= otherNP;
     SpecQ:= omegaspec;
     DefSpec:= false;
     cases:= [];
     coord:= nocoord
     END;
COPYT_INDEFPROtoNP:=rec2
END;
FUNCTION COPYX_INDEFPROtoNP(
  rec2:LSDOMAINT_NPrecord;
  rec1:LSDOMAINT_INDEFPROrecord):BOOLEAN;
BEGIN
COPYX_INDEFPROtoNP:=
  (rec2.req= rec1.req) AND
  (rec2.env= rec1.env) AND
  (rec2.mood= rec1.mood) AND
  (rec2.numero= rec1.numero) AND
  (rec2.definite= rec1.definite)
END;
FUNCTION COPYT_PERSPROtoNP(
  rec1:LSDOMAINT_PERSPROrecord):LSDOMAINT_NPrecord;
VAR rec2:LSDOMAINT_NPrecord;
BEGIN
WITH rec2 DO
     BEGIN
     req:= [pospol,negpol,omegapol];
     env:= [pospol,negpol,omegapol];
     supertiempo:= omegatiempo;
     class:= omegaTimeAdvClass;
     tiempo:= omegatiempo;
     aspecto:= omegaaspecto;
     retro:= false;
     persona:= rec1.persona;
     genero:= rec1.genero;
     actsubcs:= [othernoun];
     temporal:= false;
     animate:= rec1.animate;
     human:= OmegaHuman;
     actcomas:= [count];
     mood:= declxpmood;
     numero:= rec1.numero;
     definite:= omegadef;
     generic:= omegageneric;
     thetanp:= omegathetanp;
     nounpatternefs:= [];
     posspred:= false;
     possnietnp:= false;
     syntquant:= omegaquant;
     NPhead:= rec1.NPhead;
     SpecQ:= omegaspec;
     DefSpec:= false;
     cases:= [];
     coord:= nocoord
     END;
COPYT_PERSPROtoNP:=rec2
END;
FUNCTION COPYX_PERSPROtoNP(
  rec2:LSDOMAINT_NPrecord;
  rec1:LSDOMAINT_PERSPROrecord):BOOLEAN;
BEGIN
COPYX_PERSPROtoNP:=
  (rec2.persona= rec1.persona) AND
  (rec2.genero= rec1.genero) AND
  (rec2.animate= rec1.animate) AND
  (rec2.numero= rec1.numero) AND
  (rec2.NPhead= rec1.NPhead)
END;
FUNCTION COPYT_PROPERNOUNtoNP(
  rec1:LSDOMAINT_PROPERNOUNrecord):LSDOMAINT_NPrecord;
VAR rec2:LSDOMAINT_NPrecord;
BEGIN
WITH rec2 DO
     BEGIN
     req:= [pospol,negpol,omegapol];
     env:= [pospol,negpol,omegapol];
     supertiempo:= omegatiempo;
     class:= rec1.class;
     tiempo:= rec1.tiempo;
     aspecto:= rec1.aspecto;
     retro:= rec1.retro;
     persona:= 3;
     genero:= rec1.genero;
     actsubcs:= [othernoun];
     temporal:= rec1.temporal;
     animate:= rec1.animate;
     human:= rec1.human;
     actcomas:= [count];
     mood:= declxpmood;
     numero:= rec1.numero;
     definite:= omegadef;
     generic:= omegageneric;
     thetanp:= omegathetanp;
     nounpatternefs:= [];
     posspred:= false;
     possnietnp:= false;
     syntquant:= omegaquant;
     NPhead:= otherNP;
     SpecQ:= omegaspec;
     DefSpec:= false;
     cases:= [];
     coord:= nocoord
     END;
COPYT_PROPERNOUNtoNP:=rec2
END;
FUNCTION COPYX_PROPERNOUNtoNP(
  rec2:LSDOMAINT_NPrecord;
  rec1:LSDOMAINT_PROPERNOUNrecord):BOOLEAN;
BEGIN
COPYX_PROPERNOUNtoNP:=
  (rec2.class= rec1.class) AND
  (rec2.tiempo= rec1.tiempo) AND
  (rec2.aspecto= rec1.aspecto) AND
  (rec2.retro= rec1.retro) AND
  (rec2.genero= rec1.genero) AND
  (rec2.temporal= rec1.temporal) AND
  (rec2.animate= rec1.animate) AND
  (rec2.human= rec1.human) AND
  (rec2.numero= rec1.numero)
END;
FUNCTION COPYT_DEMPROtoNP(
  rec1:LSDOMAINT_DEMPROrecord):LSDOMAINT_NPrecord;
VAR rec2:LSDOMAINT_NPrecord;
BEGIN
WITH rec2 DO
     BEGIN
     req:= [pospol,negpol,omegapol];
     env:= [pospol,negpol,omegapol];
     supertiempo:= omegatiempo;
     class:= omegaTimeAdvClass;
     tiempo:= omegatiempo;
     aspecto:= omegaaspecto;
     retro:= false;
     persona:= 3;
     genero:= rec1.genero;
     actsubcs:= [othernoun];
     temporal:= false;
     animate:= OmegaAnimate;
     human:= OmegaHuman;
     actcomas:= [count];
     mood:= declxpmood;
     numero:= rec1.numero;
     definite:= omegadef;
     generic:= omegageneric;
     thetanp:= omegathetanp;
     nounpatternefs:= [];
     posspred:= false;
     possnietnp:= false;
     syntquant:= omegaquant;
     NPhead:= otherNP;
     SpecQ:= omegaspec;
     DefSpec:= false;
     cases:= [];
     coord:= nocoord
     END;
COPYT_DEMPROtoNP:=rec2
END;
FUNCTION COPYX_DEMPROtoNP(
  rec2:LSDOMAINT_NPrecord;
  rec1:LSDOMAINT_DEMPROrecord):BOOLEAN;
BEGIN
COPYX_DEMPROtoNP:=
  (rec2.genero= rec1.genero) AND
  (rec2.numero= rec1.numero)
END;
FUNCTION COPYT_NPVARtoNP(
  rec1:LSDOMAINT_NPVARrecord):LSDOMAINT_NPrecord;
VAR rec2:LSDOMAINT_NPrecord;
BEGIN
WITH rec2 DO
     BEGIN
     req:= rec1.req;
     env:= rec1.env;
     supertiempo:= rec1.supertiempo;
     class:= rec1.class;
     tiempo:= rec1.tiempo;
     aspecto:= rec1.aspecto;
     retro:= rec1.retro;
     persona:= rec1.persona;
     genero:= rec1.genero;
     actsubcs:= rec1.actsubcs;
     temporal:= rec1.temporal;
     animate:= rec1.animate;
     human:= rec1.human;
     actcomas:= rec1.actcomas;
     mood:= rec1.mood;
     numero:= rec1.numero;
     definite:= rec1.definite;
     generic:= rec1.generic;
     thetanp:= rec1.thetanp;
     nounpatternefs:= rec1.nounpatternefs;
     posspred:= rec1.posspred;
     possnietnp:= rec1.possnietnp;
     syntquant:= rec1.syntquant;
     NPhead:= rec1.NPhead;
     SpecQ:= rec1.SpecQ;
     DefSpec:= rec1.DefSpec;
     cases:= rec1.cases;
     coord:= rec1.coord
     END;
COPYT_NPVARtoNP:=rec2
END;
FUNCTION COPYX_NPVARtoNP(
  rec2:LSDOMAINT_NPrecord;
  rec1:LSDOMAINT_NPVARrecord):BOOLEAN;
BEGIN
COPYX_NPVARtoNP:=
  (rec2.req= rec1.req) AND
  (rec2.env= rec1.env) AND
  (rec2.supertiempo= rec1.supertiempo) AND
  (rec2.class= rec1.class) AND
  (rec2.tiempo= rec1.tiempo) AND
  (rec2.aspecto= rec1.aspecto) AND
  (rec2.retro= rec1.retro) AND
  (rec2.persona= rec1.persona) AND
  (rec2.genero= rec1.genero) AND
  (rec2.actsubcs= rec1.actsubcs) AND
  (rec2.temporal= rec1.temporal) AND
  (rec2.animate= rec1.animate) AND
  (rec2.human= rec1.human) AND
  (rec2.actcomas= rec1.actcomas) AND
  (rec2.mood= rec1.mood) AND
  (rec2.numero= rec1.numero) AND
  (rec2.definite= rec1.definite) AND
  (rec2.generic= rec1.generic) AND
  (rec2.thetanp= rec1.thetanp) AND
  (rec2.nounpatternefs= rec1.nounpatternefs) AND
  (rec2.posspred= rec1.posspred) AND
  (rec2.possnietnp= rec1.possnietnp) AND
  (rec2.syntquant= rec1.syntquant) AND
  (rec2.NPhead= rec1.NPhead) AND
  (rec2.SpecQ= rec1.SpecQ) AND
  (rec2.DefSpec= rec1.DefSpec) AND
  (rec2.cases= rec1.cases) AND
  (rec2.coord= rec1.coord)
END;
FUNCTION COPYT_CNVARtoNP(
  rec1:LSDOMAINT_CNVARrecord):LSDOMAINT_NPrecord;
VAR rec2:LSDOMAINT_NPrecord;
BEGIN
WITH rec2 DO
     BEGIN
     req:= rec1.req;
     env:= rec1.env;
     supertiempo:= rec1.supertiempo;
     class:= rec1.class;
     tiempo:= rec1.tiempo;
     aspecto:= rec1.aspecto;
     retro:= rec1.retro;
     persona:= 3;
     genero:= omegagenero;
     actsubcs:= rec1.actsubcs;
     temporal:= rec1.temporal;
     animate:= rec1.animate;
     human:= rec1.human;
     actcomas:= [count];
     mood:= declxpmood;
     numero:= rec1.numero;
     definite:= rec1.definite;
     generic:= omegageneric;
     thetanp:= rec1.thetanp;
     nounpatternefs:= rec1.nounpatternefs;
     posspred:= false;
     possnietnp:= false;
     syntquant:= omegaquant;
     NPhead:= otherNP;
     SpecQ:= omegaspec;
     DefSpec:= false;
     cases:= rec1.cases;
     coord:= nocoord
     END;
COPYT_CNVARtoNP:=rec2
END;
FUNCTION COPYX_CNVARtoNP(
  rec2:LSDOMAINT_NPrecord;
  rec1:LSDOMAINT_CNVARrecord):BOOLEAN;
BEGIN
COPYX_CNVARtoNP:=
  (rec2.req= rec1.req) AND
  (rec2.env= rec1.env) AND
  (rec2.supertiempo= rec1.supertiempo) AND
  (rec2.class= rec1.class) AND
  (rec2.tiempo= rec1.tiempo) AND
  (rec2.aspecto= rec1.aspecto) AND
  (rec2.retro= rec1.retro) AND
  (rec2.actsubcs= rec1.actsubcs) AND
  (rec2.temporal= rec1.temporal) AND
  (rec2.animate= rec1.animate) AND
  (rec2.human= rec1.human) AND
  (rec2.numero= rec1.numero) AND
  (rec2.definite= rec1.definite) AND
  (rec2.thetanp= rec1.thetanp) AND
  (rec2.nounpatternefs= rec1.nounpatternefs) AND
  (rec2.cases= rec1.cases)
END;
FUNCTION COPYT_CNVARtoNPVAR(
  rec1:LSDOMAINT_CNVARrecord):LSDOMAINT_NPVARrecord;
VAR rec2:LSDOMAINT_NPVARrecord;
BEGIN
WITH rec2 DO
     BEGIN
     req:= rec1.req;
     env:= rec1.env;
     supertiempo:= rec1.supertiempo;
     class:= rec1.class;
     tiempo:= rec1.tiempo;
     aspecto:= rec1.aspecto;
     retro:= rec1.retro;
     persona:= 3;
     genero:= omegagenero;
     actsubcs:= rec1.actsubcs;
     temporal:= rec1.temporal;
     animate:= rec1.animate;
     human:= rec1.human;
     actcomas:= [count];
     mood:= declxpmood;
     numero:= rec1.numero;
     definite:= rec1.definite;
     generic:= omegageneric;
     thetanp:= rec1.thetanp;
     nounpatternefs:= rec1.nounpatternefs;
     posspred:= false;
     possnietnp:= false;
     syntquant:= omegaquant;
     NPhead:= otherNP;
     SpecQ:= omegaspec;
     DefSpec:= false;
     cases:= rec1.cases;
     coord:= nocoord;
     index:=rec1.index
     END;
COPYT_CNVARtoNPVAR:=rec2
END;
FUNCTION COPYX_CNVARtoNPVAR(
  rec2:LSDOMAINT_NPVARrecord;
  rec1:LSDOMAINT_CNVARrecord):BOOLEAN;
BEGIN
COPYX_CNVARtoNPVAR:=
  (rec2.req= rec1.req) AND
  (rec2.env= rec1.env) AND
  (rec2.supertiempo= rec1.supertiempo) AND
  (rec2.class= rec1.class) AND
  (rec2.tiempo= rec1.tiempo) AND
  (rec2.aspecto= rec1.aspecto) AND
  (rec2.retro= rec1.retro) AND
  (rec2.actsubcs= rec1.actsubcs) AND
  (rec2.temporal= rec1.temporal) AND
  (rec2.animate= rec1.animate) AND
  (rec2.human= rec1.human) AND
  (rec2.numero= rec1.numero) AND
  (rec2.definite= rec1.definite) AND
  (rec2.thetanp= rec1.thetanp) AND
  (rec2.nounpatternefs= rec1.nounpatternefs) AND
  (rec2.cases= rec1.cases) AND
  (rec2.index=rec1.index)
END;
FUNCTION COPYT_bpropernountopropernoun(
  rec1:LSDOMAINT_BPROPERNOUNrecord):LSDOMAINT_PROPERNOUNrecord;
VAR rec2:LSDOMAINT_PROPERNOUNrecord;
BEGIN
WITH rec2 DO
     BEGIN
     genero:= rec1.genero;
     numero:= rec1.numero;
     subc:= rec1.subc;
     animate:= rec1.animate;
     human:= rec1.human;
     temporal:= rec1.temporal;
     class:= rec1.class;
     tiempo:= rec1.tiempo;
     aspecto:= rec1.aspecto;
     retro:= rec1.retro
     END;
COPYT_bpropernountopropernoun:=rec2
END;
FUNCTION COPYX_bpropernountopropernoun(
  rec2:LSDOMAINT_PROPERNOUNrecord;
  rec1:LSDOMAINT_BPROPERNOUNrecord):BOOLEAN;
BEGIN
COPYX_bpropernountopropernoun:=
  (rec2.genero= rec1.genero) AND
  (rec2.numero= rec1.numero) AND
  (rec2.subc= rec1.subc) AND
  (rec2.animate= rec1.animate) AND
  (rec2.human= rec1.human) AND
  (rec2.temporal= rec1.temporal) AND
  (rec2.class= rec1.class) AND
  (rec2.tiempo= rec1.tiempo) AND
  (rec2.aspecto= rec1.aspecto) AND
  (rec2.retro= rec1.retro)
END;
FUNCTION COPYT_bdettodet(
  rec1:LSDOMAINT_BDETrecord):LSDOMAINT_DETrecord;
VAR rec2:LSDOMAINT_DETrecord;
BEGIN
WITH rec2 DO
     BEGIN
     req:= rec1.req;
     env:= rec1.env;
     numero:= omeganumero;
     genero:= omegagenero;
     definite:= rec1.definite;
     posspred:= rec1.posspred;
     posscomas:= rec1.posscomas;
     mood:= rec1.mood
     END;
COPYT_bdettodet:=rec2
END;
FUNCTION COPYX_bdettodet(
  rec2:LSDOMAINT_DETrecord;
  rec1:LSDOMAINT_BDETrecord):BOOLEAN;
BEGIN
COPYX_bdettodet:=
  (rec2.req= rec1.req) AND
  (rec2.env= rec1.env) AND
  (rec2.definite= rec1.definite) AND
  (rec2.posspred= rec1.posspred) AND
  (rec2.posscomas= rec1.posscomas) AND
  (rec2.mood= rec1.mood)
END;
FUNCTION COPYT_adjpproptovar(
  rec1:LSDOMAINT_ADJPPROPrecord):LSDOMAINT_ADJPPROPVARrecord;
VAR rec2:LSDOMAINT_ADJPPROPVARrecord;
BEGIN
WITH rec2 DO
     BEGIN
     req:= rec1.req;
     env:= rec1.env;
     class:= rec1.class;
     tiempo:= rec1.tiempo;
     aspecto:= rec1.aspecto;
     retro:= rec1.retro;
     aktionsarts:= rec1.aktionsarts;
     uses:= rec1.uses;
     supertiempo:= rec1.supertiempo;
     temporal:= rec1.temporal;
     actsubcefs:= rec1.actsubcefs;
     thetaadj:= rec1.thetaadj;
     adjpatternefs:= rec1.adjpatternefs;
     mood:= rec1.mood;
     copulas:= rec1.copulas;
     PROsubject:= rec1.PROsubject
     END;
COPYT_adjpproptovar:=rec2
END;
FUNCTION COPYX_adjpproptovar(
  rec2:LSDOMAINT_ADJPPROPVARrecord;
  rec1:LSDOMAINT_ADJPPROPrecord):BOOLEAN;
BEGIN
COPYX_adjpproptovar:=
  (rec2.req= rec1.req) AND
  (rec2.env= rec1.env) AND
  (rec2.class= rec1.class) AND
  (rec2.tiempo= rec1.tiempo) AND
  (rec2.aspecto= rec1.aspecto) AND
  (rec2.retro= rec1.retro) AND
  (rec2.aktionsarts= rec1.aktionsarts) AND
  (rec2.uses= rec1.uses) AND
  (rec2.supertiempo= rec1.supertiempo) AND
  (rec2.temporal= rec1.temporal) AND
  (rec2.actsubcefs= rec1.actsubcefs) AND
  (rec2.thetaadj= rec1.thetaadj) AND
  (rec2.adjpatternefs= rec1.adjpatternefs) AND
  (rec2.mood= rec1.mood) AND
  (rec2.copulas= rec1.copulas) AND
  (rec2.PROsubject= rec1.PROsubject)
END;
FUNCTION COPYT_advpproptovar(
  rec1:LSDOMAINT_ADVPPROPrecord):LSDOMAINT_ADVPPROPVARrecord;
VAR rec2:LSDOMAINT_ADVPPROPVARrecord;
BEGIN
WITH rec2 DO
     BEGIN
     req:= rec1.req;
     env:= rec1.env;
     Qstatus:= rec1.Qstatus;
     class:= rec1.class;
     tiempo:= rec1.tiempo;
     aspecto:= rec1.aspecto;
     retro:= rec1.retro;
     aktionsarts:= rec1.aktionsarts;
     supertiempo:= rec1.supertiempo;
     actsubcefs:= rec1.actsubcefs;
     mood:= rec1.mood;
     thetaadv:= rec1.thetaadv;
     advpatternefs:= rec1.advpatternefs;
     prepkey:= 0;
     temporal:= rec1.temporal;
     thanas:= rec1.thanas;
     thanascompl:= rec1.thanascompl;
     PROsubject:= rec1.PROsubject
     END;
COPYT_advpproptovar:=rec2
END;
FUNCTION COPYX_advpproptovar(
  rec2:LSDOMAINT_ADVPPROPVARrecord;
  rec1:LSDOMAINT_ADVPPROPrecord):BOOLEAN;
BEGIN
COPYX_advpproptovar:=
  (rec2.req= rec1.req) AND
  (rec2.env= rec1.env) AND
  (rec2.Qstatus= rec1.Qstatus) AND
  (rec2.class= rec1.class) AND
  (rec2.tiempo= rec1.tiempo) AND
  (rec2.aspecto= rec1.aspecto) AND
  (rec2.retro= rec1.retro) AND
  (rec2.aktionsarts= rec1.aktionsarts) AND
  (rec2.supertiempo= rec1.supertiempo) AND
  (rec2.actsubcefs= rec1.actsubcefs) AND
  (rec2.mood= rec1.mood) AND
  (rec2.thetaadv= rec1.thetaadv) AND
  (rec2.advpatternefs= rec1.advpatternefs) AND
  (rec2.temporal= rec1.temporal) AND
  (rec2.thanas= rec1.thanas) AND
  (rec2.thanascompl= rec1.thanascompl) AND
  (rec2.PROsubject= rec1.PROsubject)
END;
FUNCTION COPYT_npproptovar(
  rec1:LSDOMAINT_NPPROPrecord):LSDOMAINT_NPPROPVARrecord;
VAR rec2:LSDOMAINT_NPPROPVARrecord;
BEGIN
WITH rec2 DO
     BEGIN
     req:= rec1.req;
     env:= rec1.env;
     supertiempo:= rec1.supertiempo;
     aktionsarts:= rec1.aktionsarts;
     thetanp:= rec1.thetanp;
     nounpatternefs:= rec1.nounpatternefs;
     PROsubject:= rec1.PROsubject;
     DefSpec:= rec1.DefSpec
     END;
COPYT_npproptovar:=rec2
END;
FUNCTION COPYX_npproptovar(
  rec2:LSDOMAINT_NPPROPVARrecord;
  rec1:LSDOMAINT_NPPROPrecord):BOOLEAN;
BEGIN
COPYX_npproptovar:=
  (rec2.req= rec1.req) AND
  (rec2.env= rec1.env) AND
  (rec2.supertiempo= rec1.supertiempo) AND
  (rec2.aktionsarts= rec1.aktionsarts) AND
  (rec2.thetanp= rec1.thetanp) AND
  (rec2.nounpatternefs= rec1.nounpatternefs) AND
  (rec2.PROsubject= rec1.PROsubject) AND
  (rec2.DefSpec= rec1.DefSpec)
END;
FUNCTION COPYT_preppproptovar(
  rec1:LSDOMAINT_PREPPPROPrecord):LSDOMAINT_PREPPPROPVARrecord;
VAR rec2:LSDOMAINT_PREPPPROPVARrecord;
BEGIN
WITH rec2 DO
     BEGIN
     req:= rec1.req;
     env:= rec1.env;
     mood:= rec1.mood;
     actsubcefs:= rec1.actsubcefs;
     PROsubject:= rec1.PROsubject;
     synppefs:= rec1.synppefs;
     thetapp:= rec1.thetapp;
     headkey:= rec1.headkey;
     class:= rec1.class;
     tiempo:= rec1.tiempo;
     aspecto:= rec1.aspecto;
     retro:= rec1.retro;
     aktionsarts:= rec1.aktionsarts;
     supertiempo:= rec1.supertiempo;
     SpecQ:= rec1.SpecQ
     END;
COPYT_preppproptovar:=rec2
END;
FUNCTION COPYX_preppproptovar(
  rec2:LSDOMAINT_PREPPPROPVARrecord;
  rec1:LSDOMAINT_PREPPPROPrecord):BOOLEAN;
BEGIN
COPYX_preppproptovar:=
  (rec2.req= rec1.req) AND
  (rec2.env= rec1.env) AND
  (rec2.mood= rec1.mood) AND
  (rec2.actsubcefs= rec1.actsubcefs) AND
  (rec2.PROsubject= rec1.PROsubject) AND
  (rec2.synppefs= rec1.synppefs) AND
  (rec2.thetapp= rec1.thetapp) AND
  (rec2.headkey= rec1.headkey) AND
  (rec2.class= rec1.class) AND
  (rec2.tiempo= rec1.tiempo) AND
  (rec2.aspecto= rec1.aspecto) AND
  (rec2.retro= rec1.retro) AND
  (rec2.aktionsarts= rec1.aktionsarts) AND
  (rec2.supertiempo= rec1.supertiempo) AND
  (rec2.SpecQ= rec1.SpecQ)
END;
FUNCTION COPYT_verbpproptovar(
  rec1:LSDOMAINT_VERBPPROPrecord):LSDOMAINT_VERBPPROPVARrecord;
VAR rec2:LSDOMAINT_VERBPPROPVARrecord;
BEGIN
WITH rec2 DO
     BEGIN
     req:= rec1.req;
     env:= rec1.env;
     supertiempo:= rec1.supertiempo;
     PROsubject:= rec1.PROsubject;
     voice:= rec1.voice;
     synvpefs:= rec1.synvpefs;
     thetavp:= rec1.thetavp;
     adjuncts:= rec1.adjuncts;
     aktionsarts:= rec1.aktionsarts
     END;
COPYT_verbpproptovar:=rec2
END;
FUNCTION COPYX_verbpproptovar(
  rec2:LSDOMAINT_VERBPPROPVARrecord;
  rec1:LSDOMAINT_VERBPPROPrecord):BOOLEAN;
BEGIN
COPYX_verbpproptovar:=
  (rec2.req= rec1.req) AND
  (rec2.env= rec1.env) AND
  (rec2.supertiempo= rec1.supertiempo) AND
  (rec2.PROsubject= rec1.PROsubject) AND
  (rec2.voice= rec1.voice) AND
  (rec2.synvpefs= rec1.synvpefs) AND
  (rec2.thetavp= rec1.thetavp) AND
  (rec2.adjuncts= rec1.adjuncts) AND
  (rec2.aktionsarts= rec1.aktionsarts)
END;
FUNCTION COPYT_nptovar(
  rec1:LSDOMAINT_NPrecord):LSDOMAINT_NPVARrecord;
VAR rec2:LSDOMAINT_NPVARrecord;
BEGIN
WITH rec2 DO
     BEGIN
     req:= rec1.req;
     env:= rec1.env;
     supertiempo:= rec1.supertiempo;
     class:= rec1.class;
     tiempo:= rec1.tiempo;
     aspecto:= rec1.aspecto;
     retro:= rec1.retro;
     persona:= rec1.persona;
     genero:= rec1.genero;
     actsubcs:= rec1.actsubcs;
     temporal:= rec1.temporal;
     animate:= rec1.animate;
     human:= rec1.human;
     actcomas:= rec1.actcomas;
     mood:= rec1.mood;
     numero:= rec1.numero;
     definite:= rec1.definite;
     generic:= rec1.generic;
     thetanp:= rec1.thetanp;
     nounpatternefs:= rec1.nounpatternefs;
     posspred:= rec1.posspred;
     possnietnp:= rec1.possnietnp;
     syntquant:= rec1.syntquant;
     NPhead:= rec1.NPhead;
     SpecQ:= rec1.SpecQ;
     DefSpec:= rec1.DefSpec;
     cases:= rec1.cases;
     coord:= rec1.coord
     END;
COPYT_nptovar:=rec2
END;
FUNCTION COPYX_nptovar(
  rec2:LSDOMAINT_NPVARrecord;
  rec1:LSDOMAINT_NPrecord):BOOLEAN;
BEGIN
COPYX_nptovar:=
  (rec2.req= rec1.req) AND
  (rec2.env= rec1.env) AND
  (rec2.supertiempo= rec1.supertiempo) AND
  (rec2.class= rec1.class) AND
  (rec2.tiempo= rec1.tiempo) AND
  (rec2.aspecto= rec1.aspecto) AND
  (rec2.retro= rec1.retro) AND
  (rec2.persona= rec1.persona) AND
  (rec2.genero= rec1.genero) AND
  (rec2.actsubcs= rec1.actsubcs) AND
  (rec2.temporal= rec1.temporal) AND
  (rec2.animate= rec1.animate) AND
  (rec2.human= rec1.human) AND
  (rec2.actcomas= rec1.actcomas) AND
  (rec2.mood= rec1.mood) AND
  (rec2.numero= rec1.numero) AND
  (rec2.definite= rec1.definite) AND
  (rec2.generic= rec1.generic) AND
  (rec2.thetanp= rec1.thetanp) AND
  (rec2.nounpatternefs= rec1.nounpatternefs) AND
  (rec2.posspred= rec1.posspred) AND
  (rec2.possnietnp= rec1.possnietnp) AND
  (rec2.syntquant= rec1.syntquant) AND
  (rec2.NPhead= rec1.NPhead) AND
  (rec2.SpecQ= rec1.SpecQ) AND
  (rec2.DefSpec= rec1.DefSpec) AND
  (rec2.cases= rec1.cases) AND
  (rec2.coord= rec1.coord)
END;
FUNCTION COPYT_sentencetovar(
  rec1:LSDOMAINT_SENTENCErecord):LSDOMAINT_SENTENCEVARrecord;
VAR rec2:LSDOMAINT_SENTENCEVARrecord;
BEGIN
WITH rec2 DO
     BEGIN
     req:= rec1.req;
     env:= rec1.env;
     mood:= rec1.mood;
     modo:= rec1.modo;
     senttype:= rec1.senttype;
     infsort:= rec1.infsort;
     voice:= rec1.voice;
     PROsubject:= rec1.PROsubject;
     synvpefs:= rec1.synvpefs;
     thetavp:= rec1.thetavp;
     adjuncts:= rec1.adjuncts;
     aktionsarts:= rec1.aktionsarts;
     aspecto:= rec1.aspecto;
     tiempo:= rec1.tiempo;
     retro:= rec1.retro;
     finiteness:= rec1.finiteness;
     VRcompl:= rec1.VRcompl;
     supertiempo:= rec1.supertiempo;
     Restructuring:= rec1.Restructuring;
     conjkey:= rec1.conjkey;
     adverbial:= rec1.adverbial;
     temporal:= rec1.temporal;
     conjclass:= rec1.conjclass;
     conjtiempo:= rec1.conjtiempo;
     conjaspecto:= rec1.conjaspecto;
     conjretro:= rec1.conjretro;
     PERSPROobj:= rec1.PERSPROobj;
     negpos:= rec1.negpos;
     coord:= rec1.coord
     END;
COPYT_sentencetovar:=rec2
END;
FUNCTION COPYX_sentencetovar(
  rec2:LSDOMAINT_SENTENCEVARrecord;
  rec1:LSDOMAINT_SENTENCErecord):BOOLEAN;
BEGIN
COPYX_sentencetovar:=
  (rec2.req= rec1.req) AND
  (rec2.env= rec1.env) AND
  (rec2.mood= rec1.mood) AND
  (rec2.modo= rec1.modo) AND
  (rec2.senttype= rec1.senttype) AND
  (rec2.infsort= rec1.infsort) AND
  (rec2.voice= rec1.voice) AND
  (rec2.PROsubject= rec1.PROsubject) AND
  (rec2.synvpefs= rec1.synvpefs) AND
  (rec2.thetavp= rec1.thetavp) AND
  (rec2.adjuncts= rec1.adjuncts) AND
  (rec2.aktionsarts= rec1.aktionsarts) AND
  (rec2.aspecto= rec1.aspecto) AND
  (rec2.tiempo= rec1.tiempo) AND
  (rec2.retro= rec1.retro) AND
  (rec2.finiteness= rec1.finiteness) AND
  (rec2.VRcompl= rec1.VRcompl) AND
  (rec2.supertiempo= rec1.supertiempo) AND
  (rec2.Restructuring= rec1.Restructuring) AND
  (rec2.conjkey= rec1.conjkey) AND
  (rec2.adverbial= rec1.adverbial) AND
  (rec2.temporal= rec1.temporal) AND
  (rec2.conjclass= rec1.conjclass) AND
  (rec2.conjtiempo= rec1.conjtiempo) AND
  (rec2.conjaspecto= rec1.conjaspecto) AND
  (rec2.conjretro= rec1.conjretro) AND
  (rec2.PERSPROobj= rec1.PERSPROobj) AND
  (rec2.negpos= rec1.negpos) AND
  (rec2.coord= rec1.coord)
END;
FUNCTION COPYT_clausetovar(
  rec1:LSDOMAINT_CLAUSErecord):LSDOMAINT_CLAUSEVARrecord;
VAR rec2:LSDOMAINT_CLAUSEVARrecord;
BEGIN
WITH rec2 DO
     BEGIN
     req:= rec1.req;
     env:= rec1.env;
     voice:= rec1.voice;
     PROsubject:= rec1.PROsubject;
     synvpefs:= rec1.synvpefs;
     thetavp:= rec1.thetavp;
     adjuncts:= rec1.adjuncts;
     mood:= rec1.mood;
     modo:= rec1.modo;
     aktionsarts:= rec1.aktionsarts;
     aspecto:= rec1.aspecto;
     tiempo:= rec1.tiempo;
     retro:= rec1.retro;
     finiteness:= rec1.finiteness;
     VRcompl:= rec1.VRcompl;
     supertiempo:= rec1.supertiempo;
     Restructuring:= rec1.Restructuring;
     negpos:= rec1.negpos
     END;
COPYT_clausetovar:=rec2
END;
FUNCTION COPYX_clausetovar(
  rec2:LSDOMAINT_CLAUSEVARrecord;
  rec1:LSDOMAINT_CLAUSErecord):BOOLEAN;
BEGIN
COPYX_clausetovar:=
  (rec2.req= rec1.req) AND
  (rec2.env= rec1.env) AND
  (rec2.voice= rec1.voice) AND
  (rec2.PROsubject= rec1.PROsubject) AND
  (rec2.synvpefs= rec1.synvpefs) AND
  (rec2.thetavp= rec1.thetavp) AND
  (rec2.adjuncts= rec1.adjuncts) AND
  (rec2.mood= rec1.mood) AND
  (rec2.modo= rec1.modo) AND
  (rec2.aktionsarts= rec1.aktionsarts) AND
  (rec2.aspecto= rec1.aspecto) AND
  (rec2.tiempo= rec1.tiempo) AND
  (rec2.retro= rec1.retro) AND
  (rec2.finiteness= rec1.finiteness) AND
  (rec2.VRcompl= rec1.VRcompl) AND
  (rec2.supertiempo= rec1.supertiempo) AND
  (rec2.Restructuring= rec1.Restructuring) AND
  (rec2.negpos= rec1.negpos)
END;
FUNCTION COPYT_verbppropTOclause(
  rec1:LSDOMAINT_VERBPPROPrecord):LSDOMAINT_CLAUSErecord;
VAR rec2:LSDOMAINT_CLAUSErecord;
BEGIN
WITH rec2 DO
     BEGIN
     req:= rec1.req;
     env:= rec1.env;
     voice:= rec1.voice;
     PROsubject:= rec1.PROsubject;
     synvpefs:= rec1.synvpefs;
     thetavp:= rec1.thetavp;
     adjuncts:= rec1.adjuncts;
     mood:= omegamood;
     modo:= omegamodo;
     aktionsarts:= rec1.aktionsarts;
     aspecto:= omegaaspecto;
     tiempo:= omegatiempo;
     retro:= false;
     finiteness:= omegafin;
     VRcompl:= false;
     supertiempo:= rec1.supertiempo;
     Restructuring:= false;
     negpos:= noneg
     END;
COPYT_verbppropTOclause:=rec2
END;
FUNCTION COPYX_verbppropTOclause(
  rec2:LSDOMAINT_CLAUSErecord;
  rec1:LSDOMAINT_VERBPPROPrecord):BOOLEAN;
BEGIN
COPYX_verbppropTOclause:=
  (rec2.req= rec1.req) AND
  (rec2.env= rec1.env) AND
  (rec2.voice= rec1.voice) AND
  (rec2.PROsubject= rec1.PROsubject) AND
  (rec2.synvpefs= rec1.synvpefs) AND
  (rec2.thetavp= rec1.thetavp) AND
  (rec2.adjuncts= rec1.adjuncts) AND
  (rec2.aktionsarts= rec1.aktionsarts) AND
  (rec2.supertiempo= rec1.supertiempo)
END;
FUNCTION COPYT_clauseTOverbpprop(
  rec1:LSDOMAINT_CLAUSErecord):LSDOMAINT_VERBPPROPrecord;
VAR rec2:LSDOMAINT_VERBPPROPrecord;
BEGIN
WITH rec2 DO
     BEGIN
     req:= rec1.req;
     env:= rec1.env;
     supertiempo:= rec1.supertiempo;
     PROsubject:= rec1.PROsubject;
     voice:= rec1.voice;
     synvpefs:= rec1.synvpefs;
     thetavp:= rec1.thetavp;
     adjuncts:= rec1.adjuncts;
     aktionsarts:= rec1.aktionsarts
     END;
COPYT_clauseTOverbpprop:=rec2
END;
FUNCTION COPYX_clauseTOverbpprop(
  rec2:LSDOMAINT_VERBPPROPrecord;
  rec1:LSDOMAINT_CLAUSErecord):BOOLEAN;
BEGIN
COPYX_clauseTOverbpprop:=
  (rec2.req= rec1.req) AND
  (rec2.env= rec1.env) AND
  (rec2.supertiempo= rec1.supertiempo) AND
  (rec2.PROsubject= rec1.PROsubject) AND
  (rec2.voice= rec1.voice) AND
  (rec2.synvpefs= rec1.synvpefs) AND
  (rec2.thetavp= rec1.thetavp) AND
  (rec2.adjuncts= rec1.adjuncts) AND
  (rec2.aktionsarts= rec1.aktionsarts)
END;
FUNCTION COPYT_adjppropTOclause(
  rec1:LSDOMAINT_ADJPPROPrecord):LSDOMAINT_CLAUSErecord;
VAR rec2:LSDOMAINT_CLAUSErecord;
BEGIN
WITH rec2 DO
     BEGIN
     req:= rec1.req;
     env:= rec1.env;
     voice:= omegavoice;
     PROsubject:= rec1.PROsubject;
     synvpefs:= [];
     thetavp:= omegathetavp;
     adjuncts:= [];
     mood:= omegamood;
     modo:= omegamodo;
     aktionsarts:= rec1.aktionsarts;
     aspecto:= rec1.aspecto;
     tiempo:= rec1.tiempo;
     retro:= rec1.retro;
     finiteness:= omegafin;
     VRcompl:= false;
     supertiempo:= rec1.supertiempo;
     Restructuring:= false;
     negpos:= noneg
     END;
COPYT_adjppropTOclause:=rec2
END;
FUNCTION COPYX_adjppropTOclause(
  rec2:LSDOMAINT_CLAUSErecord;
  rec1:LSDOMAINT_ADJPPROPrecord):BOOLEAN;
BEGIN
COPYX_adjppropTOclause:=
  (rec2.req= rec1.req) AND
  (rec2.env= rec1.env) AND
  (rec2.PROsubject= rec1.PROsubject) AND
  (rec2.aktionsarts= rec1.aktionsarts) AND
  (rec2.aspecto= rec1.aspecto) AND
  (rec2.tiempo= rec1.tiempo) AND
  (rec2.retro= rec1.retro) AND
  (rec2.supertiempo= rec1.supertiempo)
END;
FUNCTION COPYT_clauseTOadjpprop(
  rec1:LSDOMAINT_CLAUSErecord):LSDOMAINT_ADJPPROPrecord;
VAR rec2:LSDOMAINT_ADJPPROPrecord;
BEGIN
WITH rec2 DO
     BEGIN
     req:= rec1.req;
     env:= rec1.env;
     class:= omegaTimeAdvClass;
     tiempo:= rec1.tiempo;
     aspecto:= rec1.aspecto;
     retro:= rec1.retro;
     aktionsarts:= rec1.aktionsarts;
     uses:= [attributive,predicative];
     supertiempo:= rec1.supertiempo;
     temporal:= false;
     actsubcefs:= [otheradj];
     thetaadj:= omegathetaadjp;
     adjpatternefs:= [];
     mood:= declxpmood;
     copulas:= [estar];
     PROsubject:= rec1.PROsubject
     END;
COPYT_clauseTOadjpprop:=rec2
END;
FUNCTION COPYX_clauseTOadjpprop(
  rec2:LSDOMAINT_ADJPPROPrecord;
  rec1:LSDOMAINT_CLAUSErecord):BOOLEAN;
BEGIN
COPYX_clauseTOadjpprop:=
  (rec2.req= rec1.req) AND
  (rec2.env= rec1.env) AND
  (rec2.tiempo= rec1.tiempo) AND
  (rec2.aspecto= rec1.aspecto) AND
  (rec2.retro= rec1.retro) AND
  (rec2.aktionsarts= rec1.aktionsarts) AND
  (rec2.supertiempo= rec1.supertiempo) AND
  (rec2.PROsubject= rec1.PROsubject)
END;
FUNCTION COPYT_nppropTOclause(
  rec1:LSDOMAINT_NPPROPrecord):LSDOMAINT_CLAUSErecord;
VAR rec2:LSDOMAINT_CLAUSErecord;
BEGIN
WITH rec2 DO
     BEGIN
     req:= rec1.req;
     env:= rec1.env;
     voice:= omegavoice;
     PROsubject:= rec1.PROsubject;
     synvpefs:= [];
     thetavp:= omegathetavp;
     adjuncts:= [];
     mood:= omegamood;
     modo:= omegamodo;
     aktionsarts:= rec1.aktionsarts;
     aspecto:= omegaaspecto;
     tiempo:= omegatiempo;
     retro:= false;
     finiteness:= omegafin;
     VRcompl:= false;
     supertiempo:= rec1.supertiempo;
     Restructuring:= false;
     negpos:= noneg
     END;
COPYT_nppropTOclause:=rec2
END;
FUNCTION COPYX_nppropTOclause(
  rec2:LSDOMAINT_CLAUSErecord;
  rec1:LSDOMAINT_NPPROPrecord):BOOLEAN;
BEGIN
COPYX_nppropTOclause:=
  (rec2.req= rec1.req) AND
  (rec2.env= rec1.env) AND
  (rec2.PROsubject= rec1.PROsubject) AND
  (rec2.aktionsarts= rec1.aktionsarts) AND
  (rec2.supertiempo= rec1.supertiempo)
END;
FUNCTION COPYT_clauseTOnpprop(
  rec1:LSDOMAINT_CLAUSErecord):LSDOMAINT_NPPROPrecord;
VAR rec2:LSDOMAINT_NPPROPrecord;
BEGIN
WITH rec2 DO
     BEGIN
     req:= rec1.req;
     env:= rec1.env;
     supertiempo:= rec1.supertiempo;
     aktionsarts:= rec1.aktionsarts;
     thetanp:= omegathetanp;
     nounpatternefs:= [];
     PROsubject:= rec1.PROsubject;
     DefSpec:= false
     END;
COPYT_clauseTOnpprop:=rec2
END;
FUNCTION COPYX_clauseTOnpprop(
  rec2:LSDOMAINT_NPPROPrecord;
  rec1:LSDOMAINT_CLAUSErecord):BOOLEAN;
BEGIN
COPYX_clauseTOnpprop:=
  (rec2.req= rec1.req) AND
  (rec2.env= rec1.env) AND
  (rec2.supertiempo= rec1.supertiempo) AND
  (rec2.aktionsarts= rec1.aktionsarts) AND
  (rec2.PROsubject= rec1.PROsubject)
END;
FUNCTION COPYT_advpTOprop(
  rec1:LSDOMAINT_ADVPrecord):LSDOMAINT_ADVPPROPrecord;
VAR rec2:LSDOMAINT_ADVPPROPrecord;
BEGIN
WITH rec2 DO
     BEGIN
     req:= rec1.req;
     env:= rec1.env;
     Qstatus:= rec1.Qstatus;
     class:= rec1.class;
     tiempo:= rec1.tiempo;
     aspecto:= rec1.aspecto;
     retro:= rec1.retro;
     aktionsarts:= [];
     supertiempo:= rec1.supertiempo;
     actsubcefs:= rec1.actsubcefs;
     mood:= rec1.mood;
     thetaadv:= rec1.thetaadv;
     advpatternefs:= rec1.advpatternefs;
     temporal:= rec1.temporal;
     thanas:= rec1.thanas;
     thanascompl:= rec1.thanascompl;
     PROsubject:= false
     END;
COPYT_advpTOprop:=rec2
END;
FUNCTION COPYX_advpTOprop(
  rec2:LSDOMAINT_ADVPPROPrecord;
  rec1:LSDOMAINT_ADVPrecord):BOOLEAN;
BEGIN
COPYX_advpTOprop:=
  (rec2.req= rec1.req) AND
  (rec2.env= rec1.env) AND
  (rec2.Qstatus= rec1.Qstatus) AND
  (rec2.class= rec1.class) AND
  (rec2.tiempo= rec1.tiempo) AND
  (rec2.aspecto= rec1.aspecto) AND
  (rec2.retro= rec1.retro) AND
  (rec2.supertiempo= rec1.supertiempo) AND
  (rec2.actsubcefs= rec1.actsubcefs) AND
  (rec2.mood= rec1.mood) AND
  (rec2.thetaadv= rec1.thetaadv) AND
  (rec2.advpatternefs= rec1.advpatternefs) AND
  (rec2.temporal= rec1.temporal) AND
  (rec2.thanas= rec1.thanas) AND
  (rec2.thanascompl= rec1.thanascompl)
END;
FUNCTION COPYT_alotoverb(
  rec1:LSDOMAINT_ALOVERBrecord):LSDOMAINT_VERBrecord;
VAR rec2:LSDOMAINT_VERBrecord;
BEGIN
WITH rec2 DO
     BEGIN
     req:= rec1.req;
     env:= rec1.env;
     conjclases:= rec1.conjclases;
     Aloclases:= rec1.Aloclases;
     numero:= rec1.numero;
     persona:= rec1.persona;
     genero:= rec1.genero;
     futuro:= rec1.futuro;
     modo:= rec1.modo;
     tiempo:= rec1.tiempo;
     aspecto:= rec1.aspecto;
     possvoices:= rec1.possvoices;
     reflexivity:= rec1.reflexivity;
     synvps:= rec1.synvps;
     thetavp:= rec1.thetavp;
     adjuncts:= rec1.adjuncts;
     CaseAssigner:= rec1.CaseAssigner;
     subc:= rec1.subc;
     foundauxes:= [];
     prepkey1:= rec1.prepkey1;
     prepkey2:= rec1.prepkey2;
     controller:= rec1.controller;
     Clustering:= rec1.Clustering;
     status:= rec1.status;
     classes:= rec1.classes;
     intensV:= rec1.intensV
     END;
COPYT_alotoverb:=rec2
END;
FUNCTION COPYX_alotoverb(
  rec2:LSDOMAINT_VERBrecord;
  rec1:LSDOMAINT_ALOVERBrecord):BOOLEAN;
BEGIN
COPYX_alotoverb:=
  (rec2.req= rec1.req) AND
  (rec2.env= rec1.env) AND
  (rec2.conjclases= rec1.conjclases) AND
  (rec2.Aloclases= rec1.Aloclases) AND
  (rec2.numero= rec1.numero) AND
  (rec2.persona= rec1.persona) AND
  (rec2.genero= rec1.genero) AND
  (rec2.futuro= rec1.futuro) AND
  (rec2.modo= rec1.modo) AND
  (rec2.tiempo= rec1.tiempo) AND
  (rec2.aspecto= rec1.aspecto) AND
  (rec2.possvoices= rec1.possvoices) AND
  (rec2.reflexivity= rec1.reflexivity) AND
  (rec2.synvps= rec1.synvps) AND
  (rec2.thetavp= rec1.thetavp) AND
  (rec2.adjuncts= rec1.adjuncts) AND
  (rec2.CaseAssigner= rec1.CaseAssigner) AND
  (rec2.subc= rec1.subc) AND
  (rec2.prepkey1= rec1.prepkey1) AND
  (rec2.prepkey2= rec1.prepkey2) AND
  (rec2.controller= rec1.controller) AND
  (rec2.Clustering= rec1.Clustering) AND
  (rec2.status= rec1.status) AND
  (rec2.classes= rec1.classes) AND
  (rec2.intensV= rec1.intensV)
END;
FUNCTION COPYT_subtoverb(
  rec1:LSDOMAINT_SUBVERBrecord):LSDOMAINT_VERBrecord;
VAR rec2:LSDOMAINT_VERBrecord;
BEGIN
WITH rec2 DO
     BEGIN
     req:= rec1.req;
     env:= rec1.env;
     conjclases:= rec1.conjclases;
     Aloclases:= rec1.Aloclases;
     numero:= omeganumero;
     persona:= 3;
     genero:= omegagenero;
     futuro:= nofuturo;
     modo:= omegamodo;
     tiempo:= omegatiempo;
     aspecto:= omegaaspecto;
     possvoices:= rec1.possvoices;
     reflexivity:= rec1.reflexivity;
     synvps:= rec1.synvps;
     thetavp:= rec1.thetavp;
     adjuncts:= rec1.adjuncts;
     CaseAssigner:= rec1.CaseAssigner;
     subc:= rec1.subc;
     foundauxes:= [];
     prepkey1:= rec1.prepkey1;
     prepkey2:= rec1.prepkey2;
     controller:= rec1.controller;
     Clustering:= rec1.Clustering;
     status:= bareV;
     classes:= rec1.classes;
     intensV:= rec1.intensV
     END;
COPYT_subtoverb:=rec2
END;
FUNCTION COPYX_subtoverb(
  rec2:LSDOMAINT_VERBrecord;
  rec1:LSDOMAINT_SUBVERBrecord):BOOLEAN;
BEGIN
COPYX_subtoverb:=
  (rec2.req= rec1.req) AND
  (rec2.env= rec1.env) AND
  (rec2.conjclases= rec1.conjclases) AND
  (rec2.Aloclases= rec1.Aloclases) AND
  (rec2.possvoices= rec1.possvoices) AND
  (rec2.reflexivity= rec1.reflexivity) AND
  (rec2.synvps= rec1.synvps) AND
  (rec2.thetavp= rec1.thetavp) AND
  (rec2.adjuncts= rec1.adjuncts) AND
  (rec2.CaseAssigner= rec1.CaseAssigner) AND
  (rec2.subc= rec1.subc) AND
  (rec2.prepkey1= rec1.prepkey1) AND
  (rec2.prepkey2= rec1.prepkey2) AND
  (rec2.controller= rec1.controller) AND
  (rec2.Clustering= rec1.Clustering) AND
  (rec2.classes= rec1.classes) AND
  (rec2.intensV= rec1.intensV)
END;
FUNCTION COPYT_subtoaloverb(
  rec1:LSDOMAINT_SUBVERBrecord):LSDOMAINT_ALOVERBrecord;
VAR rec2:LSDOMAINT_ALOVERBrecord;
BEGIN
WITH rec2 DO
     BEGIN
     req:= rec1.req;
     env:= rec1.env;
     conjclases:= rec1.conjclases;
     Aloclases:= rec1.Aloclases;
     numero:= omeganumero;
     persona:= 3;
     genero:= omegagenero;
     futuro:= nofuturo;
     modo:= omegamodo;
     tiempo:= omegatiempo;
     aspecto:= omegaaspecto;
     possvoices:= rec1.possvoices;
     reflexivity:= rec1.reflexivity;
     synvps:= rec1.synvps;
     thetavp:= rec1.thetavp;
     adjuncts:= rec1.adjuncts;
     CaseAssigner:= rec1.CaseAssigner;
     subc:= rec1.subc;
     prepkey1:= rec1.prepkey1;
     prepkey2:= rec1.prepkey2;
     controller:= rec1.controller;
     Clustering:= rec1.Clustering;
     status:= bareV;
     classes:= rec1.classes;
     intensV:= rec1.intensV
     END;
COPYT_subtoaloverb:=rec2
END;
FUNCTION COPYX_subtoaloverb(
  rec2:LSDOMAINT_ALOVERBrecord;
  rec1:LSDOMAINT_SUBVERBrecord):BOOLEAN;
BEGIN
COPYX_subtoaloverb:=
  (rec2.req= rec1.req) AND
  (rec2.env= rec1.env) AND
  (rec2.conjclases= rec1.conjclases) AND
  (rec2.Aloclases= rec1.Aloclases) AND
  (rec2.possvoices= rec1.possvoices) AND
  (rec2.reflexivity= rec1.reflexivity) AND
  (rec2.synvps= rec1.synvps) AND
  (rec2.thetavp= rec1.thetavp) AND
  (rec2.adjuncts= rec1.adjuncts) AND
  (rec2.CaseAssigner= rec1.CaseAssigner) AND
  (rec2.subc= rec1.subc) AND
  (rec2.prepkey1= rec1.prepkey1) AND
  (rec2.prepkey2= rec1.prepkey2) AND
  (rec2.controller= rec1.controller) AND
  (rec2.Clustering= rec1.Clustering) AND
  (rec2.classes= rec1.classes) AND
  (rec2.intensV= rec1.intensV)
END;
FUNCTION COPYT_btosubverb(
  rec1:LSDOMAINT_BVERBrecord):LSDOMAINT_SUBVERBrecord;
VAR rec2:LSDOMAINT_SUBVERBrecord;
BEGIN
WITH rec2 DO
     BEGIN
     req:= rec1.req;
     env:= rec1.env;
     conjclases:= rec1.conjclases;
     Aloclases:= rec1.Aloclases;
     possvoices:= rec1.possvoices;
     reflexivity:= rec1.reflexivity;
     synvps:= rec1.synvps;
     thetavp:= rec1.thetavp;
     adjuncts:= rec1.adjuncts;
     CaseAssigner:= rec1.CaseAssigner;
     subc:= rec1.subc;
     prepkey1:= rec1.prepkey1;
     prepkey2:= rec1.prepkey2;
     controller:= rec1.controller;
     Clustering:= rec1.Clustering;
     classes:= rec1.classes;
     intensV:= rec1.intensV
     END;
COPYT_btosubverb:=rec2
END;
FUNCTION COPYX_btosubverb(
  rec2:LSDOMAINT_SUBVERBrecord;
  rec1:LSDOMAINT_BVERBrecord):BOOLEAN;
BEGIN
COPYX_btosubverb:=
  (rec2.req= rec1.req) AND
  (rec2.env= rec1.env) AND
  (rec2.conjclases= rec1.conjclases) AND
  (rec2.Aloclases= rec1.Aloclases) AND
  (rec2.possvoices= rec1.possvoices) AND
  (rec2.reflexivity= rec1.reflexivity) AND
  (rec2.synvps= rec1.synvps) AND
  (rec2.thetavp= rec1.thetavp) AND
  (rec2.adjuncts= rec1.adjuncts) AND
  (rec2.CaseAssigner= rec1.CaseAssigner) AND
  (rec2.subc= rec1.subc) AND
  (rec2.prepkey1= rec1.prepkey1) AND
  (rec2.prepkey2= rec1.prepkey2) AND
  (rec2.controller= rec1.controller) AND
  (rec2.Clustering= rec1.Clustering) AND
  (rec2.classes= rec1.classes) AND
  (rec2.intensV= rec1.intensV)
END;
FUNCTION COPYT_verbtoalo(
  rec1:LSDOMAINT_VERBrecord):LSDOMAINT_ALOVERBrecord;
VAR rec2:LSDOMAINT_ALOVERBrecord;
BEGIN
WITH rec2 DO
     BEGIN
     req:= rec1.req;
     env:= rec1.env;
     conjclases:= rec1.conjclases;
     Aloclases:= rec1.Aloclases;
     numero:= rec1.numero;
     persona:= rec1.persona;
     genero:= rec1.genero;
     futuro:= rec1.futuro;
     modo:= rec1.modo;
     tiempo:= rec1.tiempo;
     aspecto:= rec1.aspecto;
     possvoices:= rec1.possvoices;
     reflexivity:= rec1.reflexivity;
     synvps:= rec1.synvps;
     thetavp:= rec1.thetavp;
     adjuncts:= rec1.adjuncts;
     CaseAssigner:= rec1.CaseAssigner;
     subc:= rec1.subc;
     prepkey1:= rec1.prepkey1;
     prepkey2:= rec1.prepkey2;
     controller:= rec1.controller;
     Clustering:= rec1.Clustering;
     status:= rec1.status;
     classes:= rec1.classes;
     intensV:= rec1.intensV
     END;
COPYT_verbtoalo:=rec2
END;
FUNCTION COPYX_verbtoalo(
  rec2:LSDOMAINT_ALOVERBrecord;
  rec1:LSDOMAINT_VERBrecord):BOOLEAN;
BEGIN
COPYX_verbtoalo:=
  (rec2.req= rec1.req) AND
  (rec2.env= rec1.env) AND
  (rec2.conjclases= rec1.conjclases) AND
  (rec2.Aloclases= rec1.Aloclases) AND
  (rec2.numero= rec1.numero) AND
  (rec2.persona= rec1.persona) AND
  (rec2.genero= rec1.genero) AND
  (rec2.futuro= rec1.futuro) AND
  (rec2.modo= rec1.modo) AND
  (rec2.tiempo= rec1.tiempo) AND
  (rec2.aspecto= rec1.aspecto) AND
  (rec2.possvoices= rec1.possvoices) AND
  (rec2.reflexivity= rec1.reflexivity) AND
  (rec2.synvps= rec1.synvps) AND
  (rec2.thetavp= rec1.thetavp) AND
  (rec2.adjuncts= rec1.adjuncts) AND
  (rec2.CaseAssigner= rec1.CaseAssigner) AND
  (rec2.subc= rec1.subc) AND
  (rec2.prepkey1= rec1.prepkey1) AND
  (rec2.prepkey2= rec1.prepkey2) AND
  (rec2.controller= rec1.controller) AND
  (rec2.Clustering= rec1.Clustering) AND
  (rec2.status= rec1.status) AND
  (rec2.classes= rec1.classes) AND
  (rec2.intensV= rec1.intensV)
END;
FUNCTION COPYT_btoperspro(
  rec1:LSDOMAINT_BPERSPROrecord):LSDOMAINT_PERSPROrecord;
VAR rec2:LSDOMAINT_PERSPROrecord;
BEGIN
WITH rec2 DO
     BEGIN
     numero:= rec1.numero;
     genero:= rec1.genero;
     persona:= rec1.persona;
     forma:= rec1.forma;
     cortesia:= rec1.cortesia;
     animate:= rec1.animate;
     NPhead:= rec1.NPhead
     END;
COPYT_btoperspro:=rec2
END;
FUNCTION COPYX_btoperspro(
  rec2:LSDOMAINT_PERSPROrecord;
  rec1:LSDOMAINT_BPERSPROrecord):BOOLEAN;
BEGIN
COPYX_btoperspro:=
  (rec2.numero= rec1.numero) AND
  (rec2.genero= rec1.genero) AND
  (rec2.persona= rec1.persona) AND
  (rec2.forma= rec1.forma) AND
  (rec2.cortesia= rec1.cortesia) AND
  (rec2.animate= rec1.animate) AND
  (rec2.NPhead= rec1.NPhead)
END;
FUNCTION COPYT_bpersprotopossadj(
  rec1:LSDOMAINT_BPERSPROrecord):LSDOMAINT_POSSADJrecord;
VAR rec2:LSDOMAINT_POSSADJrecord;
BEGIN
WITH rec2 DO
     BEGIN
     antecedent:= noant;
     concordnumero:= sing
     END;
COPYT_bpersprotopossadj:=rec2
END;
FUNCTION COPYX_bpersprotopossadj(
  rec2:LSDOMAINT_POSSADJrecord;
  rec1:LSDOMAINT_BPERSPROrecord):BOOLEAN;
BEGIN
COPYX_bpersprotopossadj:=
 TRUE
END;
FUNCTION COPYT_bperstoposspro(
  rec1:LSDOMAINT_BPERSPROrecord):LSDOMAINT_POSSPROrecord;
VAR rec2:LSDOMAINT_POSSPROrecord;
BEGIN
WITH rec2 DO
     BEGIN
     concordgenero:= mascul;
     concordnumero:= sing
     END;
COPYT_bperstoposspro:=rec2
END;
FUNCTION COPYX_bperstoposspro(
  rec2:LSDOMAINT_POSSPROrecord;
  rec1:LSDOMAINT_BPERSPROrecord):BOOLEAN;
BEGIN
COPYX_bperstoposspro:=
 TRUE
END;
FUNCTION COPYT_btowhpro(
  rec1:LSDOMAINT_BWHPROrecord):LSDOMAINT_WHPROrecord;
VAR rec2:LSDOMAINT_WHPROrecord;
BEGIN
WITH rec2 DO
     BEGIN
     numero:= rec1.numero;
     genero:= rec1.genero;
     feminforma:= rec1.feminforma;
     animate:= rec1.animate
     END;
COPYT_btowhpro:=rec2
END;
FUNCTION COPYX_btowhpro(
  rec2:LSDOMAINT_WHPROrecord;
  rec1:LSDOMAINT_BWHPROrecord):BOOLEAN;
BEGIN
COPYX_btowhpro:=
  (rec2.numero= rec1.numero) AND
  (rec2.genero= rec1.genero) AND
  (rec2.feminforma= rec1.feminforma) AND
  (rec2.animate= rec1.animate)
END;
FUNCTION COPYT_btowhadj(
  rec1:LSDOMAINT_BWHADJrecord):LSDOMAINT_WHADJrecord;
VAR rec2:LSDOMAINT_WHADJrecord;
BEGIN
WITH rec2 DO
     BEGIN
     numero:= omeganumero;
     genero:= rec1.genero;
     feminforma:= rec1.feminforma
     END;
COPYT_btowhadj:=rec2
END;
FUNCTION COPYX_btowhadj(
  rec2:LSDOMAINT_WHADJrecord;
  rec1:LSDOMAINT_BWHADJrecord):BOOLEAN;
BEGIN
COPYX_btowhadj:=
  (rec2.genero= rec1.genero) AND
  (rec2.feminforma= rec1.feminforma)
END;
FUNCTION COPYT_btodemadj(
  rec1:LSDOMAINT_BDEMADJrecord):LSDOMAINT_DEMADJrecord;
VAR rec2:LSDOMAINT_DEMADJrecord;
BEGIN
WITH rec2 DO
     BEGIN
     numero:= omeganumero;
     genero:= omegagenero
     END;
COPYT_btodemadj:=rec2
END;
FUNCTION COPYX_btodemadj(
  rec2:LSDOMAINT_DEMADJrecord;
  rec1:LSDOMAINT_BDEMADJrecord):BOOLEAN;
BEGIN
COPYX_btodemadj:=
 TRUE
END;
FUNCTION COPYT_BtoSUBADJ(
  rec1:LSDOMAINT_BADJrecord):LSDOMAINT_SUBADJrecord;
VAR rec2:LSDOMAINT_SUBADJrecord;
BEGIN
WITH rec2 DO
     BEGIN
     req:= rec1.req;
     env:= rec1.env;
     class:= rec1.class;
     tiempo:= rec1.tiempo;
     aspecto:= rec1.aspecto;
     retro:= rec1.retro;
     pluralforma:= rec1.pluralforma;
     femforma:= rec1.femforma;
     possApocope:= rec1.possApocope;
     posicion:= rec1.posicion;
     uses:= rec1.uses;
     temporal:= rec1.temporal;
     subcs:= rec1.subcs;
     reflexivity:= rec1.reflexivity;
     thetaadj:= rec1.thetaadj;
     adjpatterns:= rec1.adjpatterns;
     prepkey:= rec1.prepkey;
     possadv:= rec1.possadv;
     ARTindef:= rec1.ARTindef;
     copulas:= rec1.copulas
     END;
COPYT_BtoSUBADJ:=rec2
END;
FUNCTION COPYX_BtoSUBADJ(
  rec2:LSDOMAINT_SUBADJrecord;
  rec1:LSDOMAINT_BADJrecord):BOOLEAN;
BEGIN
COPYX_BtoSUBADJ:=
  (rec2.req= rec1.req) AND
  (rec2.env= rec1.env) AND
  (rec2.class= rec1.class) AND
  (rec2.tiempo= rec1.tiempo) AND
  (rec2.aspecto= rec1.aspecto) AND
  (rec2.retro= rec1.retro) AND
  (rec2.pluralforma= rec1.pluralforma) AND
  (rec2.femforma= rec1.femforma) AND
  (rec2.possApocope= rec1.possApocope) AND
  (rec2.posicion= rec1.posicion) AND
  (rec2.uses= rec1.uses) AND
  (rec2.temporal= rec1.temporal) AND
  (rec2.subcs= rec1.subcs) AND
  (rec2.reflexivity= rec1.reflexivity) AND
  (rec2.thetaadj= rec1.thetaadj) AND
  (rec2.adjpatterns= rec1.adjpatterns) AND
  (rec2.prepkey= rec1.prepkey) AND
  (rec2.possadv= rec1.possadv) AND
  (rec2.ARTindef= rec1.ARTindef) AND
  (rec2.copulas= rec1.copulas)
END;
FUNCTION COPYT_SUBADJtoADJ(
  rec1:LSDOMAINT_SUBADJrecord):LSDOMAINT_ADJrecord;
VAR rec2:LSDOMAINT_ADJrecord;
BEGIN
WITH rec2 DO
     BEGIN
     req:= rec1.req;
     env:= rec1.env;
     Adjadvform:= positive;
     pluralforma:= rec1.pluralforma;
     femforma:= rec1.femforma;
     irrComp:= no;
     genero:= omegagenero;
     numero:= omeganumero;
     possApocope:= rec1.possApocope;
     apocope:= false;
     posicion:= rec1.posicion;
     class:= rec1.class;
     tiempo:= rec1.tiempo;
     aspecto:= rec1.aspecto;
     retro:= rec1.retro;
     uses:= rec1.uses;
     temporal:= rec1.temporal;
     subcs:= rec1.subcs;
     thetaadj:= rec1.thetaadj;
     adjpatterns:= rec1.adjpatterns;
     prepkey:= rec1.prepkey;
     reflexivity:= rec1.reflexivity;
     possadv:= rec1.possadv;
     ARTindef:= rec1.ARTindef;
     copulas:= rec1.copulas
     END;
COPYT_SUBADJtoADJ:=rec2
END;
FUNCTION COPYX_SUBADJtoADJ(
  rec2:LSDOMAINT_ADJrecord;
  rec1:LSDOMAINT_SUBADJrecord):BOOLEAN;
BEGIN
COPYX_SUBADJtoADJ:=
  (rec2.req= rec1.req) AND
  (rec2.env= rec1.env) AND
  (rec2.pluralforma= rec1.pluralforma) AND
  (rec2.femforma= rec1.femforma) AND
  (rec2.possApocope= rec1.possApocope) AND
  (rec2.posicion= rec1.posicion) AND
  (rec2.class= rec1.class) AND
  (rec2.tiempo= rec1.tiempo) AND
  (rec2.aspecto= rec1.aspecto) AND
  (rec2.retro= rec1.retro) AND
  (rec2.uses= rec1.uses) AND
  (rec2.temporal= rec1.temporal) AND
  (rec2.subcs= rec1.subcs) AND
  (rec2.thetaadj= rec1.thetaadj) AND
  (rec2.adjpatterns= rec1.adjpatterns) AND
  (rec2.prepkey= rec1.prepkey) AND
  (rec2.reflexivity= rec1.reflexivity) AND
  (rec2.possadv= rec1.possadv) AND
  (rec2.ARTindef= rec1.ARTindef) AND
  (rec2.copulas= rec1.copulas)
END;
FUNCTION COPYT_BtoSUBADV(
  rec1:LSDOMAINT_BADVrecord):LSDOMAINT_SUBADVrecord;
VAR rec2:LSDOMAINT_SUBADVrecord;
BEGIN
WITH rec2 DO
     BEGIN
     req:= rec1.req;
     env:= rec1.env;
     subcs:= rec1.subcs;
     Qstatus:= rec1.Qstatus;
     class:= rec1.class;
     tiempo:= rec1.tiempo;
     aspecto:= rec1.aspecto;
     retro:= rec1.retro;
     mood:= rec1.mood;
     thetaadv:= rec1.thetaadv;
     advpatterns:= rec1.advpatterns;
     prepkey:= rec1.prepkey;
     temporal:= rec1.temporal;
     thanas:= rec1.thanas
     END;
COPYT_BtoSUBADV:=rec2
END;
FUNCTION COPYX_BtoSUBADV(
  rec2:LSDOMAINT_SUBADVrecord;
  rec1:LSDOMAINT_BADVrecord):BOOLEAN;
BEGIN
COPYX_BtoSUBADV:=
  (rec2.req= rec1.req) AND
  (rec2.env= rec1.env) AND
  (rec2.subcs= rec1.subcs) AND
  (rec2.Qstatus= rec1.Qstatus) AND
  (rec2.class= rec1.class) AND
  (rec2.tiempo= rec1.tiempo) AND
  (rec2.aspecto= rec1.aspecto) AND
  (rec2.retro= rec1.retro) AND
  (rec2.mood= rec1.mood) AND
  (rec2.thetaadv= rec1.thetaadv) AND
  (rec2.advpatterns= rec1.advpatterns) AND
  (rec2.prepkey= rec1.prepkey) AND
  (rec2.temporal= rec1.temporal) AND
  (rec2.thanas= rec1.thanas)
END;
FUNCTION COPYT_SUBADVtoADV(
  rec1:LSDOMAINT_SUBADVrecord):LSDOMAINT_ADVrecord;
VAR rec2:LSDOMAINT_ADVrecord;
BEGIN
WITH rec2 DO
     BEGIN
     req:= rec1.req;
     env:= rec1.env;
     subcs:= rec1.subcs;
     Qstatus:= rec1.Qstatus;
     class:= rec1.class;
     tiempo:= rec1.tiempo;
     aspecto:= rec1.aspecto;
     retro:= rec1.retro;
     mood:= rec1.mood;
     thetaadv:= rec1.thetaadv;
     advpatterns:= rec1.advpatterns;
     prepkey:= rec1.prepkey;
     temporal:= rec1.temporal;
     thanas:= rec1.thanas
     END;
COPYT_SUBADVtoADV:=rec2
END;
FUNCTION COPYX_SUBADVtoADV(
  rec2:LSDOMAINT_ADVrecord;
  rec1:LSDOMAINT_SUBADVrecord):BOOLEAN;
BEGIN
COPYX_SUBADVtoADV:=
  (rec2.req= rec1.req) AND
  (rec2.env= rec1.env) AND
  (rec2.subcs= rec1.subcs) AND
  (rec2.Qstatus= rec1.Qstatus) AND
  (rec2.class= rec1.class) AND
  (rec2.tiempo= rec1.tiempo) AND
  (rec2.aspecto= rec1.aspecto) AND
  (rec2.retro= rec1.retro) AND
  (rec2.mood= rec1.mood) AND
  (rec2.thetaadv= rec1.thetaadv) AND
  (rec2.advpatterns= rec1.advpatterns) AND
  (rec2.prepkey= rec1.prepkey) AND
  (rec2.temporal= rec1.temporal) AND
  (rec2.thanas= rec1.thanas)
END;
FUNCTION COPYT_ADVtoADVP(
  rec1:LSDOMAINT_ADVrecord):LSDOMAINT_ADVPrecord;
VAR rec2:LSDOMAINT_ADVPrecord;
BEGIN
WITH rec2 DO
     BEGIN
     req:= rec1.req;
     env:= rec1.env;
     Qstatus:= rec1.Qstatus;
     class:= rec1.class;
     tiempo:= rec1.tiempo;
     aspecto:= rec1.aspecto;
     retro:= rec1.retro;
     supertiempo:= omegatiempo;
     actsubcefs:= [VPAdv];
     mood:= rec1.mood;
     thetaadv:= rec1.thetaadv;
     advpatternefs:= [];
     temporal:= rec1.temporal;
     thanas:= rec1.thanas;
     thanascompl:= false;
     coord:= nocoord
     END;
COPYT_ADVtoADVP:=rec2
END;
FUNCTION COPYX_ADVtoADVP(
  rec2:LSDOMAINT_ADVPrecord;
  rec1:LSDOMAINT_ADVrecord):BOOLEAN;
BEGIN
COPYX_ADVtoADVP:=
  (rec2.req= rec1.req) AND
  (rec2.env= rec1.env) AND
  (rec2.Qstatus= rec1.Qstatus) AND
  (rec2.class= rec1.class) AND
  (rec2.tiempo= rec1.tiempo) AND
  (rec2.aspecto= rec1.aspecto) AND
  (rec2.retro= rec1.retro) AND
  (rec2.mood= rec1.mood) AND
  (rec2.thetaadv= rec1.thetaadv) AND
  (rec2.temporal= rec1.temporal) AND
  (rec2.thanas= rec1.thanas)
END;
FUNCTION COPYT_advptovar(
  rec1:LSDOMAINT_ADVPrecord):LSDOMAINT_ADVPVARrecord;
VAR rec2:LSDOMAINT_ADVPVARrecord;
BEGIN
WITH rec2 DO
     BEGIN
     req:= rec1.req;
     env:= rec1.env;
     Qstatus:= rec1.Qstatus;
     class:= rec1.class;
     tiempo:= rec1.tiempo;
     aspecto:= rec1.aspecto;
     retro:= rec1.retro;
     supertiempo:= rec1.supertiempo;
     actsubcefs:= rec1.actsubcefs;
     mood:= rec1.mood;
     thetaadv:= rec1.thetaadv;
     advpatternefs:= rec1.advpatternefs;
     temporal:= rec1.temporal;
     thanas:= rec1.thanas;
     thanascompl:= rec1.thanascompl;
     coord:= rec1.coord
     END;
COPYT_advptovar:=rec2
END;
FUNCTION COPYX_advptovar(
  rec2:LSDOMAINT_ADVPVARrecord;
  rec1:LSDOMAINT_ADVPrecord):BOOLEAN;
BEGIN
COPYX_advptovar:=
  (rec2.req= rec1.req) AND
  (rec2.env= rec1.env) AND
  (rec2.Qstatus= rec1.Qstatus) AND
  (rec2.class= rec1.class) AND
  (rec2.tiempo= rec1.tiempo) AND
  (rec2.aspecto= rec1.aspecto) AND
  (rec2.retro= rec1.retro) AND
  (rec2.supertiempo= rec1.supertiempo) AND
  (rec2.actsubcefs= rec1.actsubcefs) AND
  (rec2.mood= rec1.mood) AND
  (rec2.thetaadv= rec1.thetaadv) AND
  (rec2.advpatternefs= rec1.advpatternefs) AND
  (rec2.temporal= rec1.temporal) AND
  (rec2.thanas= rec1.thanas) AND
  (rec2.thanascompl= rec1.thanascompl) AND
  (rec2.coord= rec1.coord)
END;
FUNCTION COPYT_prepptovar(
  rec1:LSDOMAINT_PREPPrecord):LSDOMAINT_PREPPVARrecord;
VAR rec2:LSDOMAINT_PREPPVARrecord;
BEGIN
WITH rec2 DO
     BEGIN
     req:= rec1.req;
     env:= rec1.env;
     mood:= rec1.mood;
     actsubcefs:= rec1.actsubcefs;
     synppefs:= rec1.synppefs;
     thetapp:= rec1.thetapp;
     headkey:= rec1.headkey;
     class:= rec1.class;
     tiempo:= rec1.tiempo;
     aspecto:= rec1.aspecto;
     retro:= rec1.retro;
     supertiempo:= rec1.supertiempo;
     SpecQ:= rec1.SpecQ;
     coord:= rec1.coord
     END;
COPYT_prepptovar:=rec2
END;
FUNCTION COPYX_prepptovar(
  rec2:LSDOMAINT_PREPPVARrecord;
  rec1:LSDOMAINT_PREPPrecord):BOOLEAN;
BEGIN
COPYX_prepptovar:=
  (rec2.req= rec1.req) AND
  (rec2.env= rec1.env) AND
  (rec2.mood= rec1.mood) AND
  (rec2.actsubcefs= rec1.actsubcefs) AND
  (rec2.synppefs= rec1.synppefs) AND
  (rec2.thetapp= rec1.thetapp) AND
  (rec2.headkey= rec1.headkey) AND
  (rec2.class= rec1.class) AND
  (rec2.tiempo= rec1.tiempo) AND
  (rec2.aspecto= rec1.aspecto) AND
  (rec2.retro= rec1.retro) AND
  (rec2.supertiempo= rec1.supertiempo) AND
  (rec2.SpecQ= rec1.SpecQ) AND
  (rec2.coord= rec1.coord)
END;
FUNCTION COPYT_clauseTOsentence(
  rec1:LSDOMAINT_CLAUSErecord):LSDOMAINT_SENTENCErecord;
VAR rec2:LSDOMAINT_SENTENCErecord;
BEGIN
WITH rec2 DO
     BEGIN
     req:= rec1.req;
     env:= rec1.env;
     mood:= rec1.mood;
     modo:= rec1.modo;
     senttype:= omegaclause;
     infsort:= omegainf;
     voice:= rec1.voice;
     PROsubject:= rec1.PROsubject;
     synvpefs:= rec1.synvpefs;
     thetavp:= rec1.thetavp;
     adjuncts:= rec1.adjuncts;
     aktionsarts:= rec1.aktionsarts;
     aspecto:= rec1.aspecto;
     tiempo:= rec1.tiempo;
     retro:= rec1.retro;
     finiteness:= rec1.finiteness;
     VRcompl:= rec1.VRcompl;
     supertiempo:= rec1.supertiempo;
     Restructuring:= rec1.Restructuring;
     conjkey:= 0;
     adverbial:= false;
     temporal:= false;
     conjclass:= omegaTimeAdvClass;
     conjtiempo:= omegatiempo;
     conjaspecto:= omegaAspecto;
     conjretro:= false;
     PERSPROobj:= false;
     negpos:= rec1.negpos;
     coord:= nocoord
     END;
COPYT_clauseTOsentence:=rec2
END;
FUNCTION COPYX_clauseTOsentence(
  rec2:LSDOMAINT_SENTENCErecord;
  rec1:LSDOMAINT_CLAUSErecord):BOOLEAN;
BEGIN
COPYX_clauseTOsentence:=
  (rec2.req= rec1.req) AND
  (rec2.env= rec1.env) AND
  (rec2.mood= rec1.mood) AND
  (rec2.modo= rec1.modo) AND
  (rec2.voice= rec1.voice) AND
  (rec2.PROsubject= rec1.PROsubject) AND
  (rec2.synvpefs= rec1.synvpefs) AND
  (rec2.thetavp= rec1.thetavp) AND
  (rec2.adjuncts= rec1.adjuncts) AND
  (rec2.aktionsarts= rec1.aktionsarts) AND
  (rec2.aspecto= rec1.aspecto) AND
  (rec2.tiempo= rec1.tiempo) AND
  (rec2.retro= rec1.retro) AND
  (rec2.finiteness= rec1.finiteness) AND
  (rec2.VRcompl= rec1.VRcompl) AND
  (rec2.supertiempo= rec1.supertiempo) AND
  (rec2.Restructuring= rec1.Restructuring) AND
  (rec2.negpos= rec1.negpos)
END;
FUNCTION COPYT_sentenceTOclause(
  rec1:LSDOMAINT_SENTENCErecord):LSDOMAINT_CLAUSErecord;
VAR rec2:LSDOMAINT_CLAUSErecord;
BEGIN
WITH rec2 DO
     BEGIN
     req:= rec1.req;
     env:= rec1.env;
     voice:= rec1.voice;
     PROsubject:= rec1.PROsubject;
     synvpefs:= rec1.synvpefs;
     thetavp:= rec1.thetavp;
     adjuncts:= rec1.adjuncts;
     mood:= rec1.mood;
     modo:= rec1.modo;
     aktionsarts:= rec1.aktionsarts;
     aspecto:= rec1.aspecto;
     tiempo:= rec1.tiempo;
     retro:= rec1.retro;
     finiteness:= rec1.finiteness;
     VRcompl:= rec1.VRcompl;
     supertiempo:= rec1.supertiempo;
     Restructuring:= rec1.Restructuring;
     negpos:= rec1.negpos
     END;
COPYT_sentenceTOclause:=rec2
END;
FUNCTION COPYX_sentenceTOclause(
  rec2:LSDOMAINT_CLAUSErecord;
  rec1:LSDOMAINT_SENTENCErecord):BOOLEAN;
BEGIN
COPYX_sentenceTOclause:=
  (rec2.req= rec1.req) AND
  (rec2.env= rec1.env) AND
  (rec2.voice= rec1.voice) AND
  (rec2.PROsubject= rec1.PROsubject) AND
  (rec2.synvpefs= rec1.synvpefs) AND
  (rec2.thetavp= rec1.thetavp) AND
  (rec2.adjuncts= rec1.adjuncts) AND
  (rec2.mood= rec1.mood) AND
  (rec2.modo= rec1.modo) AND
  (rec2.aktionsarts= rec1.aktionsarts) AND
  (rec2.aspecto= rec1.aspecto) AND
  (rec2.tiempo= rec1.tiempo) AND
  (rec2.retro= rec1.retro) AND
  (rec2.finiteness= rec1.finiteness) AND
  (rec2.VRcompl= rec1.VRcompl) AND
  (rec2.supertiempo= rec1.supertiempo) AND
  (rec2.Restructuring= rec1.Restructuring) AND
  (rec2.negpos= rec1.negpos)
END;
FUNCTION COPYT_QtoQP(
  rec1:LSDOMAINT_Qrecord):LSDOMAINT_QPrecord;
VAR rec2:LSDOMAINT_QPrecord;
BEGIN
WITH rec2 DO
     BEGIN
     req:= rec1.req;
     env:= rec1.env;
     definite:= rec1.definite;
     posspred:= rec1.posspred;
     possnumbers:= rec1.possnumbers;
     posscomas:= rec1.posscomas;
     mood:= rec1.mood;
     thanas:= rec1.thanas;
     thanascompl:= false;
     supertiempo:= omegatiempo
     END;
COPYT_QtoQP:=rec2
END;
FUNCTION COPYX_QtoQP(
  rec2:LSDOMAINT_QPrecord;
  rec1:LSDOMAINT_Qrecord):BOOLEAN;
BEGIN
COPYX_QtoQP:=
  (rec2.req= rec1.req) AND
  (rec2.env= rec1.env) AND
  (rec2.definite= rec1.definite) AND
  (rec2.posspred= rec1.posspred) AND
  (rec2.possnumbers= rec1.possnumbers) AND
  (rec2.posscomas= rec1.posscomas) AND
  (rec2.mood= rec1.mood) AND
  (rec2.thanas= rec1.thanas)
END;
FUNCTION COPYT_id24(s: SET OF LSDOMAINT_adjadvformtype): SET OF LSDOMAINT_adjadvformtype;
BEGIN COPYT_id24:= s END;

FUNCTION COPYT_id25(s: SET OF LSDOMAINT_adjpluralformatype): SET OF LSDOMAINT_adjpluralformatype;
BEGIN COPYT_id25:= s END;

FUNCTION COPYT_id26(s: SET OF LSDOMAINT_adjsubctype): SET OF LSDOMAINT_adjsubctype;
BEGIN COPYT_id26:= s END;

FUNCTION COPYT_id27(s: SET OF LSDOMAINT_adjuncttype): SET OF LSDOMAINT_adjuncttype;
BEGIN COPYT_id27:= s END;

FUNCTION COPYT_id28(s: SET OF LSDOMAINT_adjusetype): SET OF LSDOMAINT_adjusetype;
BEGIN COPYT_id28:= s END;

FUNCTION COPYT_id29(s: SET OF LSDOMAINT_advsubctype): SET OF LSDOMAINT_advsubctype;
BEGIN COPYT_id29:= s END;

FUNCTION COPYT_id30(s: SET OF LSDOMAINT_aktionsarttype): SET OF LSDOMAINT_aktionsarttype;
BEGIN COPYT_id30:= s END;

FUNCTION COPYT_id31(s: SET OF LSDOMAINT_aloclasetype): SET OF LSDOMAINT_aloclasetype;
BEGIN COPYT_id31:= s END;

FUNCTION COPYT_id32(s: SET OF LSDOMAINT_animatetype): SET OF LSDOMAINT_animatetype;
BEGIN COPYT_id32:= s END;

FUNCTION COPYT_id33(s: SET OF LSDOMAINT_antecedenttype): SET OF LSDOMAINT_antecedenttype;
BEGIN COPYT_id33:= s END;

FUNCTION COPYT_id34(s: SET OF LSDOMAINT_aspectotype): SET OF LSDOMAINT_aspectotype;
BEGIN COPYT_id34:= s END;

FUNCTION COPYT_id35(s: SET OF LSDOMAINT_casetype): SET OF LSDOMAINT_casetype;
BEGIN COPYT_id35:= s END;

FUNCTION COPYT_id36(s: SET OF LSDOMAINT_classtype): SET OF LSDOMAINT_classtype;
BEGIN COPYT_id36:= s END;

FUNCTION COPYT_id37(s: SET OF LSDOMAINT_concordgenerotype): SET OF LSDOMAINT_concordgenerotype;
BEGIN COPYT_id37:= s END;

FUNCTION COPYT_id38(s: SET OF LSDOMAINT_concordnumerotype): SET OF LSDOMAINT_concordnumerotype;
BEGIN COPYT_id38:= s END;

FUNCTION COPYT_id39(s: SET OF LSDOMAINT_conjclasetype): SET OF LSDOMAINT_conjclasetype;
BEGIN COPYT_id39:= s END;

FUNCTION COPYT_id40(s: SET OF LSDOMAINT_contractiontype): SET OF LSDOMAINT_contractiontype;
BEGIN COPYT_id40:= s END;

FUNCTION COPYT_id41(s: SET OF LSDOMAINT_controllertype): SET OF LSDOMAINT_controllertype;
BEGIN COPYT_id41:= s END;

FUNCTION COPYT_id42(s: SET OF LSDOMAINT_coordkindtype): SET OF LSDOMAINT_coordkindtype;
BEGIN COPYT_id42:= s END;

FUNCTION COPYT_id43(s: SET OF LSDOMAINT_coordpatterntype): SET OF LSDOMAINT_coordpatterntype;
BEGIN COPYT_id43:= s END;

FUNCTION COPYT_id44(s: SET OF LSDOMAINT_coordtype): SET OF LSDOMAINT_coordtype;
BEGIN COPYT_id44:= s END;

FUNCTION COPYT_id45(s: SET OF LSDOMAINT_copulatype): SET OF LSDOMAINT_copulatype;
BEGIN COPYT_id45:= s END;

FUNCTION COPYT_id46(s: SET OF LSDOMAINT_deftype): SET OF LSDOMAINT_deftype;
BEGIN COPYT_id46:= s END;

FUNCTION COPYT_id47(s: SET OF LSDOMAINT_distritype): SET OF LSDOMAINT_distritype;
BEGIN COPYT_id47:= s END;

FUNCTION COPYT_id48(s: SET OF LSDOMAINT_femformatype): SET OF LSDOMAINT_femformatype;
BEGIN COPYT_id48:= s END;

FUNCTION COPYT_id49(s: SET OF LSDOMAINT_finitenesstype): SET OF LSDOMAINT_finitenesstype;
BEGIN COPYT_id49:= s END;

FUNCTION COPYT_id50(s: SET OF LSDOMAINT_futurotype): SET OF LSDOMAINT_futurotype;
BEGIN COPYT_id50:= s END;

FUNCTION COPYT_id51(s: SET OF LSDOMAINT_generictype): SET OF LSDOMAINT_generictype;
BEGIN COPYT_id51:= s END;

FUNCTION COPYT_id52(s: SET OF LSDOMAINT_generotype): SET OF LSDOMAINT_generotype;
BEGIN COPYT_id52:= s END;

FUNCTION COPYT_id53(s: SET OF LSDOMAINT_humantype): SET OF LSDOMAINT_humantype;
BEGIN COPYT_id53:= s END;

FUNCTION COPYT_id54(s: SET OF LSDOMAINT_infsorttype): SET OF LSDOMAINT_infsorttype;
BEGIN COPYT_id54:= s END;

FUNCTION COPYT_id55(s: SET OF LSDOMAINT_intensvtype): SET OF LSDOMAINT_intensvtype;
BEGIN COPYT_id55:= s END;

FUNCTION COPYT_id56(s: SET OF LSDOMAINT_modotype): SET OF LSDOMAINT_modotype;
BEGIN COPYT_id56:= s END;

FUNCTION COPYT_id57(s: SET OF LSDOMAINT_moodtype): SET OF LSDOMAINT_moodtype;
BEGIN COPYT_id57:= s END;

FUNCTION COPYT_id58(s: SET OF LSDOMAINT_negpostype): SET OF LSDOMAINT_negpostype;
BEGIN COPYT_id58:= s END;

FUNCTION COPYT_id59(s: SET OF LSDOMAINT_nounsubctype): SET OF LSDOMAINT_nounsubctype;
BEGIN COPYT_id59:= s END;

FUNCTION COPYT_id60(s: SET OF LSDOMAINT_npheadtype): SET OF LSDOMAINT_npheadtype;
BEGIN COPYT_id60:= s END;

FUNCTION COPYT_id61(s: SET OF LSDOMAINT_numerotype): SET OF LSDOMAINT_numerotype;
BEGIN COPYT_id61:= s END;

FUNCTION COPYT_id62(s: SET OF LSDOMAINT_persproformatype): SET OF LSDOMAINT_persproformatype;
BEGIN COPYT_id62:= s END;

FUNCTION COPYT_id63(s: SET OF LSDOMAINT_pluralformatype): SET OF LSDOMAINT_pluralformatype;
BEGIN COPYT_id63:= s END;

FUNCTION COPYT_id64(s: SET OF LSDOMAINT_polaritytype): SET OF LSDOMAINT_polaritytype;
BEGIN COPYT_id64:= s END;

FUNCTION COPYT_id65(s: SET OF LSDOMAINT_posiciontype): SET OF LSDOMAINT_posiciontype;
BEGIN COPYT_id65:= s END;

FUNCTION COPYT_id66(s: SET OF LSDOMAINT_posscomatype): SET OF LSDOMAINT_posscomatype;
BEGIN COPYT_id66:= s END;

FUNCTION COPYT_id67(s: SET OF LSDOMAINT_prepsubctype): SET OF LSDOMAINT_prepsubctype;
BEGIN COPYT_id67:= s END;

FUNCTION COPYT_id68(s: SET OF LSDOMAINT_quesitype): SET OF LSDOMAINT_quesitype;
BEGIN COPYT_id68:= s END;

FUNCTION COPYT_id69(s: SET OF LSDOMAINT_reflexivetype): SET OF LSDOMAINT_reflexivetype;
BEGIN COPYT_id69:= s END;

FUNCTION COPYT_id70(s: SET OF LSDOMAINT_senttypetype): SET OF LSDOMAINT_senttypetype;
BEGIN COPYT_id70:= s END;

FUNCTION COPYT_id71(s: SET OF LSDOMAINT_sinotype): SET OF LSDOMAINT_sinotype;
BEGIN COPYT_id71:= s END;

FUNCTION COPYT_id72(s: SET OF LSDOMAINT_specqtype): SET OF LSDOMAINT_specqtype;
BEGIN COPYT_id72:= s END;

FUNCTION COPYT_id73(s: SET OF LSDOMAINT_synpatterntype): SET OF LSDOMAINT_synpatterntype;
BEGIN COPYT_id73:= s END;

FUNCTION COPYT_id74(s: SET OF LSDOMAINT_syntquanttype): SET OF LSDOMAINT_syntquanttype;
BEGIN COPYT_id74:= s END;

FUNCTION COPYT_id75(s: SET OF LSDOMAINT_thanascompltype): SET OF LSDOMAINT_thanascompltype;
BEGIN COPYT_id75:= s END;

FUNCTION COPYT_id76(s: SET OF LSDOMAINT_thetaadjtype): SET OF LSDOMAINT_thetaadjtype;
BEGIN COPYT_id76:= s END;

FUNCTION COPYT_id77(s: SET OF LSDOMAINT_thetaadvtype): SET OF LSDOMAINT_thetaadvtype;
BEGIN COPYT_id77:= s END;

FUNCTION COPYT_id78(s: SET OF LSDOMAINT_thetanptype): SET OF LSDOMAINT_thetanptype;
BEGIN COPYT_id78:= s END;

FUNCTION COPYT_id79(s: SET OF LSDOMAINT_thetapptype): SET OF LSDOMAINT_thetapptype;
BEGIN COPYT_id79:= s END;

FUNCTION COPYT_id80(s: SET OF LSDOMAINT_thetavptype): SET OF LSDOMAINT_thetavptype;
BEGIN COPYT_id80:= s END;

FUNCTION COPYT_id81(s: SET OF LSDOMAINT_tiempotype): SET OF LSDOMAINT_tiempotype;
BEGIN COPYT_id81:= s END;

FUNCTION COPYT_id82(s: SET OF LSDOMAINT_timeadvclasstype): SET OF LSDOMAINT_timeadvclasstype;
BEGIN COPYT_id82:= s END;

FUNCTION COPYT_id83(s: SET OF LSDOMAINT_clusteringtype): SET OF LSDOMAINT_clusteringtype;
BEGIN COPYT_id83:= s END;

FUNCTION COPYT_id84(s: SET OF LSDOMAINT_verbsubctype): SET OF LSDOMAINT_verbsubctype;
BEGIN COPYT_id84:= s END;

FUNCTION COPYT_id85(s: SET OF LSDOMAINT_voicetype): SET OF LSDOMAINT_voicetype;
BEGIN COPYT_id85:= s END;

FUNCTION COPYT_id86(s: SET OF LSDOMAINT_vstatustype): SET OF LSDOMAINT_vstatustype;
BEGIN COPYT_id86:= s END;

FUNCTION COPYT_id87(s: SET OF LSDOMAINT_xpmoodtype): SET OF LSDOMAINT_xpmoodtype;
BEGIN COPYT_id87:= s END;

