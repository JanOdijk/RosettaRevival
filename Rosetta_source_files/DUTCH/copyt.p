Export(COPYT);
pragma C_include('lsdomaint.pf');
pragma C_include('copyt.pf');


PROGRAM COPYT;
WITH LSDOMAINT;
FUNCTION COPYT_bverbtosubverb(
  rec1:LSDOMAINT_BVERBrecord):LSDOMAINT_SUBVERBrecord;
VAR rec2:LSDOMAINT_SUBVERBrecord;
BEGIN
WITH rec2 DO
     BEGIN
     req:= rec1.req;
     env:= rec1.env;
     conjclasses:= rec1.conjclasses;
     particle:= rec1.particle;
     possvoices:= rec1.possvoices;
     reflexivity:= rec1.reflexivity;
     synvps:= rec1.synvps;
     thetavp:= rec1.thetavp;
     adjuncts:= rec1.adjuncts;
     CaseAssigner:= rec1.CaseAssigner;
     subc:= rec1.subc;
     perfauxs:= rec1.perfauxs;
     prepkey1:= rec1.prepkey1;
     prepkey2:= rec1.prepkey2;
     controller:= rec1.controller;
     verbraiser:= rec1.verbraiser;
     IPP:= rec1.IPP;
     classes:= rec1.classes;
     lastaffix:= noaffix
     END;
COPYT_bverbtosubverb:=rec2
END;
FUNCTION COPYX_bverbtosubverb(
  rec2:LSDOMAINT_SUBVERBrecord;
  rec1:LSDOMAINT_BVERBrecord):BOOLEAN;
BEGIN
COPYX_bverbtosubverb:=
  (rec2.req= rec1.req) AND
  (rec2.env= rec1.env) AND
  (rec2.conjclasses= rec1.conjclasses) AND
  (rec2.particle= rec1.particle) AND
  (rec2.possvoices= rec1.possvoices) AND
  (rec2.reflexivity= rec1.reflexivity) AND
  (rec2.synvps= rec1.synvps) AND
  (rec2.thetavp= rec1.thetavp) AND
  (rec2.adjuncts= rec1.adjuncts) AND
  (rec2.CaseAssigner= rec1.CaseAssigner) AND
  (rec2.subc= rec1.subc) AND
  (rec2.perfauxs= rec1.perfauxs) AND
  (rec2.prepkey1= rec1.prepkey1) AND
  (rec2.prepkey2= rec1.prepkey2) AND
  (rec2.controller= rec1.controller) AND
  (rec2.verbraiser= rec1.verbraiser) AND
  (rec2.IPP= rec1.IPP) AND
  (rec2.classes= rec1.classes)
END;
FUNCTION COPYT_subverbtoverb(
  rec1:LSDOMAINT_SUBVERBrecord):LSDOMAINT_VERBrecord;
VAR rec2:LSDOMAINT_VERBrecord;
BEGIN
WITH rec2 DO
     BEGIN
     req:= rec1.req;
     env:= rec1.env;
     conjclasses:= rec1.conjclasses;
     particle:= rec1.particle;
     number:= omeganumber;
     persons:= [];
     eORenForm:= NoForm;
     modus:= omegamodus;
     tense:= omegatense;
     possvoices:= rec1.possvoices;
     reflexivity:= rec1.reflexivity;
     synvps:= rec1.synvps;
     thetavp:= rec1.thetavp;
     adjuncts:= rec1.adjuncts;
     CaseAssigner:= rec1.CaseAssigner;
     subc:= rec1.subc;
     foundauxes:= [];
     perfauxs:= rec1.perfauxs;
     prepkey1:= rec1.prepkey1;
     prepkey2:= rec1.prepkey2;
     controller:= rec1.controller;
     verbraiser:= rec1.verbraiser;
     IPP:= rec1.IPP;
     synvpefs2:= [];
     status:= bareV;
     classes:= rec1.classes
     END;
COPYT_subverbtoverb:=rec2
END;
FUNCTION COPYX_subverbtoverb(
  rec2:LSDOMAINT_VERBrecord;
  rec1:LSDOMAINT_SUBVERBrecord):BOOLEAN;
BEGIN
COPYX_subverbtoverb:=
  (rec2.req= rec1.req) AND
  (rec2.env= rec1.env) AND
  (rec2.conjclasses= rec1.conjclasses) AND
  (rec2.particle= rec1.particle) AND
  (rec2.possvoices= rec1.possvoices) AND
  (rec2.reflexivity= rec1.reflexivity) AND
  (rec2.synvps= rec1.synvps) AND
  (rec2.thetavp= rec1.thetavp) AND
  (rec2.adjuncts= rec1.adjuncts) AND
  (rec2.CaseAssigner= rec1.CaseAssigner) AND
  (rec2.subc= rec1.subc) AND
  (rec2.perfauxs= rec1.perfauxs) AND
  (rec2.prepkey1= rec1.prepkey1) AND
  (rec2.prepkey2= rec1.prepkey2) AND
  (rec2.controller= rec1.controller) AND
  (rec2.verbraiser= rec1.verbraiser) AND
  (rec2.IPP= rec1.IPP) AND
  (rec2.classes= rec1.classes)
END;
FUNCTION COPYT_bnountosubnoun(
  rec1:LSDOMAINT_BNOUNrecord):LSDOMAINT_SUBNOUNrecord;
VAR rec2:LSDOMAINT_SUBNOUNrecord;
BEGIN
WITH rec2 DO
     BEGIN
     req:= rec1.req;
     env:= rec1.env;
     dimforms:= rec1.dimforms;
     pluralforms:= rec1.pluralforms;
     genders:= rec1.genders;
     class:= rec1.class;
     deixis:= rec1.deixis;
     aspect:= rec1.aspect;
     retro:= rec1.retro;
     sexes:= rec1.sexes;
     subcs:= rec1.subcs;
     temporal:= rec1.temporal;
     possgeni:= rec1.possgeni;
     animate:= rec1.animate;
     human:= rec1.human;
     posscomas:= rec1.posscomas;
     thetanp:= rec1.thetanp;
     nounpatterns:= rec1.nounpatterns;
     prepkey:= rec1.prepkey;
     personal:= rec1.personal;
     lastaffix:= noaffix
     END;
COPYT_bnountosubnoun:=rec2
END;
FUNCTION COPYX_bnountosubnoun(
  rec2:LSDOMAINT_SUBNOUNrecord;
  rec1:LSDOMAINT_BNOUNrecord):BOOLEAN;
BEGIN
COPYX_bnountosubnoun:=
  (rec2.req= rec1.req) AND
  (rec2.env= rec1.env) AND
  (rec2.dimforms= rec1.dimforms) AND
  (rec2.pluralforms= rec1.pluralforms) AND
  (rec2.genders= rec1.genders) AND
  (rec2.class= rec1.class) AND
  (rec2.deixis= rec1.deixis) AND
  (rec2.aspect= rec1.aspect) AND
  (rec2.retro= rec1.retro) AND
  (rec2.sexes= rec1.sexes) AND
  (rec2.subcs= rec1.subcs) AND
  (rec2.temporal= rec1.temporal) AND
  (rec2.possgeni= rec1.possgeni) AND
  (rec2.animate= rec1.animate) AND
  (rec2.human= rec1.human) AND
  (rec2.posscomas= rec1.posscomas) AND
  (rec2.thetanp= rec1.thetanp) AND
  (rec2.nounpatterns= rec1.nounpatterns) AND
  (rec2.prepkey= rec1.prepkey) AND
  (rec2.personal= rec1.personal)
END;
FUNCTION COPYT_subnountonoun(
  rec1:LSDOMAINT_SUBNOUNrecord):LSDOMAINT_NOUNrecord;
VAR rec2:LSDOMAINT_NOUNrecord;
BEGIN
WITH rec2 DO
     BEGIN
     req:= rec1.req;
     env:= rec1.env;
     dimforms:= rec1.dimforms;
     pluralforms:= rec1.pluralforms;
     genders:= rec1.genders;
     number:= omeganumber;
     geni:= false;
     class:= rec1.class;
     deixis:= rec1.deixis;
     aspect:= rec1.aspect;
     retro:= rec1.retro;
     sexes:= rec1.sexes;
     subcs:= rec1.subcs;
     temporal:= rec1.temporal;
     possgeni:= rec1.possgeni;
     animate:= rec1.animate;
     human:= rec1.human;
     posscomas:= rec1.posscomas;
     thetanp:= rec1.thetanp;
     nounpatterns:= rec1.nounpatterns;
     prepkey:= rec1.prepkey;
     personal:= rec1.personal
     END;
COPYT_subnountonoun:=rec2
END;
FUNCTION COPYX_subnountonoun(
  rec2:LSDOMAINT_NOUNrecord;
  rec1:LSDOMAINT_SUBNOUNrecord):BOOLEAN;
BEGIN
COPYX_subnountonoun:=
  (rec2.req= rec1.req) AND
  (rec2.env= rec1.env) AND
  (rec2.dimforms= rec1.dimforms) AND
  (rec2.pluralforms= rec1.pluralforms) AND
  (rec2.genders= rec1.genders) AND
  (rec2.class= rec1.class) AND
  (rec2.deixis= rec1.deixis) AND
  (rec2.aspect= rec1.aspect) AND
  (rec2.retro= rec1.retro) AND
  (rec2.sexes= rec1.sexes) AND
  (rec2.subcs= rec1.subcs) AND
  (rec2.temporal= rec1.temporal) AND
  (rec2.possgeni= rec1.possgeni) AND
  (rec2.animate= rec1.animate) AND
  (rec2.human= rec1.human) AND
  (rec2.posscomas= rec1.posscomas) AND
  (rec2.thetanp= rec1.thetanp) AND
  (rec2.nounpatterns= rec1.nounpatterns) AND
  (rec2.prepkey= rec1.prepkey) AND
  (rec2.personal= rec1.personal)
END;
FUNCTION COPYT_badjtosubadj(
  rec1:LSDOMAINT_BADJrecord):LSDOMAINT_SUBADJrecord;
VAR rec2:LSDOMAINT_SUBADJrecord;
BEGIN
WITH rec2 DO
     BEGIN
     req:= rec1.req;
     env:= rec1.env;
     class:= rec1.class;
     deixis:= rec1.deixis;
     aspect:= rec1.aspect;
     retro:= rec1.retro;
     uses:= rec1.uses;
     eFormation:= rec1.eFormation;
     sFormation:= rec1.sFormation;
     eNominalised:= rec1.eNominalised;
     comparatives:= rec1.comparatives;
     superlatives:= rec1.superlatives;
     temporal:= rec1.temporal;
     subcs:= rec1.subcs;
     reflexivity:= rec1.reflexivity;
     thetaadj:= rec1.thetaadj;
     adjpatterns:= rec1.adjpatterns;
     prepkey:= rec1.prepkey;
     possadv:= rec1.possadv;
     lastaffix:= noaffix
     END;
COPYT_badjtosubadj:=rec2
END;
FUNCTION COPYX_badjtosubadj(
  rec2:LSDOMAINT_SUBADJrecord;
  rec1:LSDOMAINT_BADJrecord):BOOLEAN;
BEGIN
COPYX_badjtosubadj:=
  (rec2.req= rec1.req) AND
  (rec2.env= rec1.env) AND
  (rec2.class= rec1.class) AND
  (rec2.deixis= rec1.deixis) AND
  (rec2.aspect= rec1.aspect) AND
  (rec2.retro= rec1.retro) AND
  (rec2.uses= rec1.uses) AND
  (rec2.eFormation= rec1.eFormation) AND
  (rec2.sFormation= rec1.sFormation) AND
  (rec2.eNominalised= rec1.eNominalised) AND
  (rec2.comparatives= rec1.comparatives) AND
  (rec2.superlatives= rec1.superlatives) AND
  (rec2.temporal= rec1.temporal) AND
  (rec2.subcs= rec1.subcs) AND
  (rec2.reflexivity= rec1.reflexivity) AND
  (rec2.thetaadj= rec1.thetaadj) AND
  (rec2.adjpatterns= rec1.adjpatterns) AND
  (rec2.prepkey= rec1.prepkey) AND
  (rec2.possadv= rec1.possadv)
END;
FUNCTION COPYT_subadjtoadj(
  rec1:LSDOMAINT_SUBADJrecord):LSDOMAINT_ADJrecord;
VAR rec2:LSDOMAINT_ADJrecord;
BEGIN
WITH rec2 DO
     BEGIN
     req:= rec1.req;
     env:= rec1.env;
     class:= rec1.class;
     deixis:= rec1.deixis;
     aspect:= rec1.aspect;
     retro:= rec1.retro;
     uses:= rec1.uses;
     eFormation:= rec1.eFormation;
     sFormation:= rec1.sFormation;
     eNominalised:= rec1.eNominalised;
     comparatives:= rec1.comparatives;
     superlatives:= rec1.superlatives;
     form:= positive;
     eORenForm:= NoForm;
     temporal:= rec1.temporal;
     subcs:= rec1.subcs;
     thetaadj:= rec1.thetaadj;
     adjpatterns:= rec1.adjpatterns;
     prepkey:= rec1.prepkey;
     reflexivity:= rec1.reflexivity;
     possadv:= rec1.possadv
     END;
COPYT_subadjtoadj:=rec2
END;
FUNCTION COPYX_subadjtoadj(
  rec2:LSDOMAINT_ADJrecord;
  rec1:LSDOMAINT_SUBADJrecord):BOOLEAN;
BEGIN
COPYX_subadjtoadj:=
  (rec2.req= rec1.req) AND
  (rec2.env= rec1.env) AND
  (rec2.class= rec1.class) AND
  (rec2.deixis= rec1.deixis) AND
  (rec2.aspect= rec1.aspect) AND
  (rec2.retro= rec1.retro) AND
  (rec2.uses= rec1.uses) AND
  (rec2.eFormation= rec1.eFormation) AND
  (rec2.sFormation= rec1.sFormation) AND
  (rec2.eNominalised= rec1.eNominalised) AND
  (rec2.comparatives= rec1.comparatives) AND
  (rec2.superlatives= rec1.superlatives) AND
  (rec2.temporal= rec1.temporal) AND
  (rec2.subcs= rec1.subcs) AND
  (rec2.thetaadj= rec1.thetaadj) AND
  (rec2.adjpatterns= rec1.adjpatterns) AND
  (rec2.prepkey= rec1.prepkey) AND
  (rec2.reflexivity= rec1.reflexivity) AND
  (rec2.possadv= rec1.possadv)
END;
FUNCTION COPYT_badvtosubadv(
  rec1:LSDOMAINT_BADVrecord):LSDOMAINT_SUBADVrecord;
VAR rec2:LSDOMAINT_SUBADVrecord;
BEGIN
WITH rec2 DO
     BEGIN
     req:= rec1.req;
     env:= rec1.env;
     comparatives:= rec1.comparatives;
     superlatives:= rec1.superlatives;
     subcs:= rec1.subcs;
     Qstatus:= rec1.Qstatus;
     class:= rec1.class;
     deixis:= rec1.deixis;
     aspect:= rec1.aspect;
     retro:= rec1.retro;
     mood:= rec1.mood;
     thetaadv:= rec1.thetaadv;
     advpatterns:= rec1.advpatterns;
     prepkey:= rec1.prepkey;
     temporal:= rec1.temporal;
     possnietnp:= rec1.possnietnp;
     thanas:= rec1.thanas;
     lastaffix:= noaffix;
     Radvb:= false
     END;
COPYT_badvtosubadv:=rec2
END;
FUNCTION COPYX_badvtosubadv(
  rec2:LSDOMAINT_SUBADVrecord;
  rec1:LSDOMAINT_BADVrecord):BOOLEAN;
BEGIN
COPYX_badvtosubadv:=
  (rec2.req= rec1.req) AND
  (rec2.env= rec1.env) AND
  (rec2.comparatives= rec1.comparatives) AND
  (rec2.superlatives= rec1.superlatives) AND
  (rec2.subcs= rec1.subcs) AND
  (rec2.Qstatus= rec1.Qstatus) AND
  (rec2.class= rec1.class) AND
  (rec2.deixis= rec1.deixis) AND
  (rec2.aspect= rec1.aspect) AND
  (rec2.retro= rec1.retro) AND
  (rec2.mood= rec1.mood) AND
  (rec2.thetaadv= rec1.thetaadv) AND
  (rec2.advpatterns= rec1.advpatterns) AND
  (rec2.prepkey= rec1.prepkey) AND
  (rec2.temporal= rec1.temporal) AND
  (rec2.possnietnp= rec1.possnietnp) AND
  (rec2.thanas= rec1.thanas)
END;
FUNCTION COPYT_subadvtoadv(
  rec1:LSDOMAINT_SUBADVrecord):LSDOMAINT_ADVrecord;
VAR rec2:LSDOMAINT_ADVrecord;
BEGIN
WITH rec2 DO
     BEGIN
     req:= rec1.req;
     env:= rec1.env;
     comparatives:= rec1.comparatives;
     superlatives:= rec1.superlatives;
     subcs:= rec1.subcs;
     Qstatus:= rec1.Qstatus;
     form:= positive;
     eORenForm:= NoForm;
     class:= rec1.class;
     deixis:= rec1.deixis;
     aspect:= rec1.aspect;
     retro:= rec1.retro;
     mood:= rec1.mood;
     thetaadv:= rec1.thetaadv;
     advpatterns:= rec1.advpatterns;
     prepkey:= rec1.prepkey;
     temporal:= rec1.temporal;
     possnietnp:= rec1.possnietnp;
     thanas:= rec1.thanas;
     Radvb:= rec1.Radvb
     END;
COPYT_subadvtoadv:=rec2
END;
FUNCTION COPYX_subadvtoadv(
  rec2:LSDOMAINT_ADVrecord;
  rec1:LSDOMAINT_SUBADVrecord):BOOLEAN;
BEGIN
COPYX_subadvtoadv:=
  (rec2.req= rec1.req) AND
  (rec2.env= rec1.env) AND
  (rec2.comparatives= rec1.comparatives) AND
  (rec2.superlatives= rec1.superlatives) AND
  (rec2.subcs= rec1.subcs) AND
  (rec2.Qstatus= rec1.Qstatus) AND
  (rec2.class= rec1.class) AND
  (rec2.deixis= rec1.deixis) AND
  (rec2.aspect= rec1.aspect) AND
  (rec2.retro= rec1.retro) AND
  (rec2.mood= rec1.mood) AND
  (rec2.thetaadv= rec1.thetaadv) AND
  (rec2.advpatterns= rec1.advpatterns) AND
  (rec2.prepkey= rec1.prepkey) AND
  (rec2.temporal= rec1.temporal) AND
  (rec2.possnietnp= rec1.possnietnp) AND
  (rec2.thanas= rec1.thanas) AND
  (rec2.Radvb= rec1.Radvb)
END;
FUNCTION COPYT_btobigpro(
  rec1:LSDOMAINT_BPERSPROrecord):LSDOMAINT_BIGPROrecord;
VAR rec2:LSDOMAINT_BIGPROrecord;
BEGIN
WITH rec2 DO
     BEGIN
     number:= rec1.number;
     gender:= rec1.gender;
     person:= rec1.person;
     animate:= rec1.animate;
     possRform:= rec1.possRform;
     generalized:= rec1.generalized;
     NPhead:= rec1.NPhead;
     antecedent:= 0
     END;
COPYT_btobigpro:=rec2
END;
FUNCTION COPYX_btobigpro(
  rec2:LSDOMAINT_BIGPROrecord;
  rec1:LSDOMAINT_BPERSPROrecord):BOOLEAN;
BEGIN
COPYX_btobigpro:=
  (rec2.number= rec1.number) AND
  (rec2.gender= rec1.gender) AND
  (rec2.person= rec1.person) AND
  (rec2.animate= rec1.animate) AND
  (rec2.possRform= rec1.possRform) AND
  (rec2.generalized= rec1.generalized) AND
  (rec2.NPhead= rec1.NPhead)
END;
FUNCTION COPYT_bpersprotoperspro(
  rec1:LSDOMAINT_BPERSPROrecord):LSDOMAINT_PERSPROrecord;
VAR rec2:LSDOMAINT_PERSPROrecord;
BEGIN
WITH rec2 DO
     BEGIN
     number:= rec1.number;
     gender:= rec1.gender;
     person:= rec1.person;
     animate:= rec1.animate;
     possRform:= rec1.possRform;
     generalized:= rec1.generalized;
     NPhead:= rec1.NPhead;
     reduced:= false;
     persprocases:= [Nominative]
     END;
COPYT_bpersprotoperspro:=rec2
END;
FUNCTION COPYX_bpersprotoperspro(
  rec2:LSDOMAINT_PERSPROrecord;
  rec1:LSDOMAINT_BPERSPROrecord):BOOLEAN;
BEGIN
COPYX_bpersprotoperspro:=
  (rec2.number= rec1.number) AND
  (rec2.gender= rec1.gender) AND
  (rec2.person= rec1.person) AND
  (rec2.animate= rec1.animate) AND
  (rec2.possRform= rec1.possRform) AND
  (rec2.generalized= rec1.generalized) AND
  (rec2.NPhead= rec1.NPhead)
END;
FUNCTION COPYT_bpropernountopropernoun(
  rec1:LSDOMAINT_BPROPERNOUNrecord):LSDOMAINT_PROPERNOUNrecord;
VAR rec2:LSDOMAINT_PROPERNOUNrecord;
BEGIN
WITH rec2 DO
     BEGIN
     genders:= rec1.genders;
     number:= singular;
     dimforms:= rec1.dimforms;
     pluralforms:= rec1.pluralforms;
     sexes:= rec1.sexes;
     subc:= rec1.subc;
     animate:= rec1.animate;
     human:= rec1.human;
     temporal:= rec1.temporal;
     class:= rec1.class;
     deixis:= rec1.deixis;
     aspect:= rec1.aspect;
     retro:= rec1.retro;
     possgeni:= rec1.possgeni;
     geni:= false
     END;
COPYT_bpropernountopropernoun:=rec2
END;
FUNCTION COPYX_bpropernountopropernoun(
  rec2:LSDOMAINT_PROPERNOUNrecord;
  rec1:LSDOMAINT_BPROPERNOUNrecord):BOOLEAN;
BEGIN
COPYX_bpropernountopropernoun:=
  (rec2.genders= rec1.genders) AND
  (rec2.dimforms= rec1.dimforms) AND
  (rec2.pluralforms= rec1.pluralforms) AND
  (rec2.sexes= rec1.sexes) AND
  (rec2.subc= rec1.subc) AND
  (rec2.animate= rec1.animate) AND
  (rec2.human= rec1.human) AND
  (rec2.temporal= rec1.temporal) AND
  (rec2.class= rec1.class) AND
  (rec2.deixis= rec1.deixis) AND
  (rec2.aspect= rec1.aspect) AND
  (rec2.retro= rec1.retro) AND
  (rec2.possgeni= rec1.possgeni)
END;
FUNCTION COPYT_bindefprotoindefpro(
  rec1:LSDOMAINT_BINDEFPROrecord):LSDOMAINT_INDEFPROrecord;
VAR rec2:LSDOMAINT_INDEFPROrecord;
BEGIN
WITH rec2 DO
     BEGIN
     req:= rec1.req;
     env:= rec1.env;
     definite:= rec1.definite;
     number:= rec1.number;
     possgeni:= rec1.possgeni;
     possnietNP:= rec1.possnietNP;
     syntquant:= rec1.syntquant;
     animate:= rec1.animate;
     possRform:= rec1.possRform;
     geni:= false;
     NPhead:= rec1.NPhead
     END;
COPYT_bindefprotoindefpro:=rec2
END;
FUNCTION COPYX_bindefprotoindefpro(
  rec2:LSDOMAINT_INDEFPROrecord;
  rec1:LSDOMAINT_BINDEFPROrecord):BOOLEAN;
BEGIN
COPYX_bindefprotoindefpro:=
  (rec2.req= rec1.req) AND
  (rec2.env= rec1.env) AND
  (rec2.definite= rec1.definite) AND
  (rec2.number= rec1.number) AND
  (rec2.possgeni= rec1.possgeni) AND
  (rec2.possnietNP= rec1.possnietNP) AND
  (rec2.syntquant= rec1.syntquant) AND
  (rec2.animate= rec1.animate) AND
  (rec2.possRform= rec1.possRform) AND
  (rec2.NPhead= rec1.NPhead)
END;
FUNCTION COPYT_bdettodet(
  rec1:LSDOMAINT_BDETrecord):LSDOMAINT_DETrecord;
VAR rec2:LSDOMAINT_DETrecord;
BEGIN
WITH rec2 DO
     BEGIN
     req:= rec1.req;
     env:= rec1.env;
     possnietnp:= rec1.possnietnp;
     definite:= rec1.definite;
     posspred:= rec1.posspred;
     possnumbers:= rec1.possnumbers;
     posscomas:= rec1.posscomas;
     mood:= rec1.mood;
     eFormation:= rec1.eFormation;
     enFormation:= rec1.enFormation;
     eORenForm:= NoForm;
     syntquant:= rec1.syntquant
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
  (rec2.possnietnp= rec1.possnietnp) AND
  (rec2.definite= rec1.definite) AND
  (rec2.posspred= rec1.posspred) AND
  (rec2.possnumbers= rec1.possnumbers) AND
  (rec2.posscomas= rec1.posscomas) AND
  (rec2.mood= rec1.mood) AND
  (rec2.eFormation= rec1.eFormation) AND
  (rec2.enFormation= rec1.enFormation) AND
  (rec2.syntquant= rec1.syntquant)
END;
FUNCTION COPYT_bwhprotowhpro(
  rec1:LSDOMAINT_BWHPROrecord):LSDOMAINT_WHPROrecord;
VAR rec2:LSDOMAINT_WHPROrecord;
BEGIN
WITH rec2 DO
     BEGIN
     animate:= rec1.animate;
     possRform:= rec1.possRform;
     sexes:= rec1.sexes;
     number:= rec1.number
     END;
COPYT_bwhprotowhpro:=rec2
END;
FUNCTION COPYX_bwhprotowhpro(
  rec2:LSDOMAINT_WHPROrecord;
  rec1:LSDOMAINT_BWHPROrecord):BOOLEAN;
BEGIN
COPYX_bwhprotowhpro:=
  (rec2.animate= rec1.animate) AND
  (rec2.possRform= rec1.possRform) AND
  (rec2.sexes= rec1.sexes) AND
  (rec2.number= rec1.number)
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
     deixis:= rec1.deixis;
     aspect:= rec1.aspect;
     retro:= rec1.retro;
     aktionsarts:= rec1.aktionsarts;
     superdeixis:= rec1.superdeixis;
     temporal:= rec1.temporal;
     actsubcefs:= rec1.actsubcefs;
     thetaadj:= rec1.thetaadj;
     adjpatternefs:= rec1.adjpatternefs;
     PROsubject:= rec1.PROsubject;
     mood:= rec1.mood
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
  (rec2.deixis= rec1.deixis) AND
  (rec2.aspect= rec1.aspect) AND
  (rec2.retro= rec1.retro) AND
  (rec2.aktionsarts= rec1.aktionsarts) AND
  (rec2.superdeixis= rec1.superdeixis) AND
  (rec2.temporal= rec1.temporal) AND
  (rec2.actsubcefs= rec1.actsubcefs) AND
  (rec2.thetaadj= rec1.thetaadj) AND
  (rec2.adjpatternefs= rec1.adjpatternefs) AND
  (rec2.PROsubject= rec1.PROsubject) AND
  (rec2.mood= rec1.mood)
END;
FUNCTION COPYT_advpproptovar(
  rec1:LSDOMAINT_ADVPPROPrecord):LSDOMAINT_ADVPPROPVARrecord;
VAR rec2:LSDOMAINT_ADVPPROPVARrecord;
BEGIN
WITH rec2 DO
     BEGIN
     req:= rec1.req;
     env:= rec1.env;
     class:= rec1.class;
     deixis:= rec1.deixis;
     aspect:= rec1.aspect;
     retro:= rec1.retro;
     aktionsarts:= rec1.aktionsarts;
     superdeixis:= rec1.superdeixis;
     actsubcefs:= rec1.actsubcefs;
     Qstatus:= rec1.Qstatus;
     thetaadv:= rec1.thetaadv;
     advpatternefs:= rec1.advpatternefs;
     PROsubject:= rec1.PROsubject;
     mood:= rec1.mood;
     temporal:= rec1.temporal;
     Radvb:= rec1.Radvb;
     thanascompl:= rec1.thanascompl
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
  (rec2.class= rec1.class) AND
  (rec2.deixis= rec1.deixis) AND
  (rec2.aspect= rec1.aspect) AND
  (rec2.retro= rec1.retro) AND
  (rec2.aktionsarts= rec1.aktionsarts) AND
  (rec2.superdeixis= rec1.superdeixis) AND
  (rec2.actsubcefs= rec1.actsubcefs) AND
  (rec2.Qstatus= rec1.Qstatus) AND
  (rec2.thetaadv= rec1.thetaadv) AND
  (rec2.advpatternefs= rec1.advpatternefs) AND
  (rec2.PROsubject= rec1.PROsubject) AND
  (rec2.mood= rec1.mood) AND
  (rec2.temporal= rec1.temporal) AND
  (rec2.Radvb= rec1.Radvb) AND
  (rec2.thanascompl= rec1.thanascompl)
END;
FUNCTION COPYT_npproptovar(
  rec1:LSDOMAINT_NPPROPrecord):LSDOMAINT_NPPROPVARrecord;
VAR rec2:LSDOMAINT_NPPROPVARrecord;
BEGIN
WITH rec2 DO
     BEGIN
     req:= rec1.req;
     env:= rec1.env;
     superdeixis:= rec1.superdeixis;
     aktionsarts:= rec1.aktionsarts;
     thetanp:= rec1.thetanp;
     nounpatternefs:= rec1.nounpatternefs;
     PROsubject:= rec1.PROsubject
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
  (rec2.superdeixis= rec1.superdeixis) AND
  (rec2.aktionsarts= rec1.aktionsarts) AND
  (rec2.thetanp= rec1.thetanp) AND
  (rec2.nounpatternefs= rec1.nounpatternefs) AND
  (rec2.PROsubject= rec1.PROsubject)
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
     deixis:= rec1.deixis;
     aspect:= rec1.aspect;
     retro:= rec1.retro;
     aktionsarts:= rec1.aktionsarts;
     superdeixis:= rec1.superdeixis;
     specq:= rec1.specq
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
  (rec2.deixis= rec1.deixis) AND
  (rec2.aspect= rec1.aspect) AND
  (rec2.retro= rec1.retro) AND
  (rec2.aktionsarts= rec1.aktionsarts) AND
  (rec2.superdeixis= rec1.superdeixis) AND
  (rec2.specq= rec1.specq)
END;
FUNCTION COPYT_verbpproptovar(
  rec1:LSDOMAINT_VERBPPROPrecord):LSDOMAINT_VERBPPROPVARrecord;
VAR rec2:LSDOMAINT_VERBPPROPVARrecord;
BEGIN
WITH rec2 DO
     BEGIN
     req:= rec1.req;
     env:= rec1.env;
     superdeixis:= rec1.superdeixis;
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
  (rec2.superdeixis= rec1.superdeixis) AND
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
     superdeixis:= rec1.superdeixis;
     class:= rec1.class;
     deixis:= rec1.deixis;
     aspect:= rec1.aspect;
     retro:= rec1.retro;
     definite:= rec1.definite;
     person:= rec1.person;
     number:= rec1.number;
     cases:= rec1.cases;
     genders:= rec1.genders;
     sexes:= rec1.sexes;
     actsubcs:= rec1.actsubcs;
     temporal:= rec1.temporal;
     possgeni:= rec1.possgeni;
     animate:= rec1.animate;
     human:= rec1.human;
     actcomas:= rec1.actcomas;
     thetanp:= rec1.thetanp;
     nounpatternefs:= rec1.nounpatternefs;
     posspred:= rec1.posspred;
     possnietnp:= rec1.possnietnp;
     mood:= rec1.mood;
     generic:= rec1.generic;
     possRform:= rec1.possRform;
     syntquant:= rec1.syntquant;
     NPhead:= rec1.NPhead;
     specQ:= rec1.specQ;
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
  (rec2.superdeixis= rec1.superdeixis) AND
  (rec2.class= rec1.class) AND
  (rec2.deixis= rec1.deixis) AND
  (rec2.aspect= rec1.aspect) AND
  (rec2.retro= rec1.retro) AND
  (rec2.definite= rec1.definite) AND
  (rec2.person= rec1.person) AND
  (rec2.number= rec1.number) AND
  (rec2.cases= rec1.cases) AND
  (rec2.genders= rec1.genders) AND
  (rec2.sexes= rec1.sexes) AND
  (rec2.actsubcs= rec1.actsubcs) AND
  (rec2.temporal= rec1.temporal) AND
  (rec2.possgeni= rec1.possgeni) AND
  (rec2.animate= rec1.animate) AND
  (rec2.human= rec1.human) AND
  (rec2.actcomas= rec1.actcomas) AND
  (rec2.thetanp= rec1.thetanp) AND
  (rec2.nounpatternefs= rec1.nounpatternefs) AND
  (rec2.posspred= rec1.posspred) AND
  (rec2.possnietnp= rec1.possnietnp) AND
  (rec2.mood= rec1.mood) AND
  (rec2.generic= rec1.generic) AND
  (rec2.possRform= rec1.possRform) AND
  (rec2.syntquant= rec1.syntquant) AND
  (rec2.NPhead= rec1.NPhead) AND
  (rec2.specQ= rec1.specQ) AND
  (rec2.coord= rec1.coord)
END;
FUNCTION COPYT_cntovar(
  rec1:LSDOMAINT_CNrecord):LSDOMAINT_CNVARrecord;
VAR rec2:LSDOMAINT_CNVARrecord;
BEGIN
WITH rec2 DO
     BEGIN
     req:= rec1.req;
     env:= rec1.env;
     superdeixis:= rec1.superdeixis;
     class:= rec1.class;
     deixis:= rec1.deixis;
     aspect:= rec1.aspect;
     retro:= rec1.retro;
     definite:= rec1.definite;
     numbers:= rec1.numbers;
     cases:= rec1.cases;
     genders:= rec1.genders;
     sexes:= rec1.sexes;
     actsubcs:= rec1.actsubcs;
     temporal:= rec1.temporal;
     possgeni:= rec1.possgeni;
     animate:= rec1.animate;
     human:= rec1.human;
     posscomas:= rec1.posscomas;
     thetanp:= rec1.thetanp;
     nounpatternefs:= rec1.nounpatternefs
     END;
COPYT_cntovar:=rec2
END;
FUNCTION COPYX_cntovar(
  rec2:LSDOMAINT_CNVARrecord;
  rec1:LSDOMAINT_CNrecord):BOOLEAN;
BEGIN
COPYX_cntovar:=
  (rec2.req= rec1.req) AND
  (rec2.env= rec1.env) AND
  (rec2.superdeixis= rec1.superdeixis) AND
  (rec2.class= rec1.class) AND
  (rec2.deixis= rec1.deixis) AND
  (rec2.aspect= rec1.aspect) AND
  (rec2.retro= rec1.retro) AND
  (rec2.definite= rec1.definite) AND
  (rec2.numbers= rec1.numbers) AND
  (rec2.cases= rec1.cases) AND
  (rec2.genders= rec1.genders) AND
  (rec2.sexes= rec1.sexes) AND
  (rec2.actsubcs= rec1.actsubcs) AND
  (rec2.temporal= rec1.temporal) AND
  (rec2.possgeni= rec1.possgeni) AND
  (rec2.animate= rec1.animate) AND
  (rec2.human= rec1.human) AND
  (rec2.posscomas= rec1.posscomas) AND
  (rec2.thetanp= rec1.thetanp) AND
  (rec2.nounpatternefs= rec1.nounpatternefs)
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
     senttype:= rec1.senttype;
     voice:= rec1.voice;
     PROsubject:= rec1.PROsubject;
     synvpefs:= rec1.synvpefs;
     thetavp:= rec1.thetavp;
     adjuncts:= rec1.adjuncts;
     modus:= rec1.modus;
     aktionsarts:= rec1.aktionsarts;
     aspect:= rec1.aspect;
     deixis:= rec1.deixis;
     retro:= rec1.retro;
     finiteness:= rec1.finiteness;
     infsort:= rec1.infsort;
     superdeixis:= rec1.superdeixis;
     VRcompl:= rec1.VRcompl;
     conjkey:= rec1.conjkey;
     adverbial:= rec1.adverbial;
     temporal:= rec1.temporal;
     conjclass:= rec1.conjclass;
     conjdeixis:= rec1.conjdeixis;
     conjaspect:= rec1.conjaspect;
     conjretro:= rec1.conjretro;
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
  (rec2.senttype= rec1.senttype) AND
  (rec2.voice= rec1.voice) AND
  (rec2.PROsubject= rec1.PROsubject) AND
  (rec2.synvpefs= rec1.synvpefs) AND
  (rec2.thetavp= rec1.thetavp) AND
  (rec2.adjuncts= rec1.adjuncts) AND
  (rec2.modus= rec1.modus) AND
  (rec2.aktionsarts= rec1.aktionsarts) AND
  (rec2.aspect= rec1.aspect) AND
  (rec2.deixis= rec1.deixis) AND
  (rec2.retro= rec1.retro) AND
  (rec2.finiteness= rec1.finiteness) AND
  (rec2.infsort= rec1.infsort) AND
  (rec2.superdeixis= rec1.superdeixis) AND
  (rec2.VRcompl= rec1.VRcompl) AND
  (rec2.conjkey= rec1.conjkey) AND
  (rec2.adverbial= rec1.adverbial) AND
  (rec2.temporal= rec1.temporal) AND
  (rec2.conjclass= rec1.conjclass) AND
  (rec2.conjdeixis= rec1.conjdeixis) AND
  (rec2.conjaspect= rec1.conjaspect) AND
  (rec2.conjretro= rec1.conjretro) AND
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
     modus:= rec1.modus;
     aktionsarts:= rec1.aktionsarts;
     aspect:= rec1.aspect;
     deixis:= rec1.deixis;
     retro:= rec1.retro;
     finiteness:= rec1.finiteness;
     infsort:= rec1.infsort;
     superdeixis:= rec1.superdeixis;
     VRcompl:= rec1.VRcompl
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
  (rec2.modus= rec1.modus) AND
  (rec2.aktionsarts= rec1.aktionsarts) AND
  (rec2.aspect= rec1.aspect) AND
  (rec2.deixis= rec1.deixis) AND
  (rec2.retro= rec1.retro) AND
  (rec2.finiteness= rec1.finiteness) AND
  (rec2.infsort= rec1.infsort) AND
  (rec2.superdeixis= rec1.superdeixis) AND
  (rec2.VRcompl= rec1.VRcompl)
END;
FUNCTION COPYT_adjtoadjp(
  rec1:LSDOMAINT_ADJrecord):LSDOMAINT_ADJPrecord;
VAR rec2:LSDOMAINT_ADJPrecord;
BEGIN
WITH rec2 DO
     BEGIN
     req:= rec1.req;
     env:= rec1.env;
     class:= rec1.class;
     deixis:= rec1.deixis;
     aspect:= rec1.aspect;
     retro:= rec1.retro;
     actuseefs:= [];
     eformation:= rec1.eFormation;
     enominalised:= rec1.eNominalised;
     form:= rec1.form;
     eORenForm:= rec1.eORenForm;
     temporal:= rec1.temporal;
     actsubcefs:= [otheradj];
     thetaadj:= rec1.thetaadj;
     adjpatternefs:= [];
     reflexivity:= rec1.reflexivity;
     mood:= declxpmood;
     coord:= nocoord
     END;
COPYT_adjtoadjp:=rec2
END;
FUNCTION COPYX_adjtoadjp(
  rec2:LSDOMAINT_ADJPrecord;
  rec1:LSDOMAINT_ADJrecord):BOOLEAN;
BEGIN
COPYX_adjtoadjp:=
  (rec2.req= rec1.req) AND
  (rec2.env= rec1.env) AND
  (rec2.class= rec1.class) AND
  (rec2.deixis= rec1.deixis) AND
  (rec2.aspect= rec1.aspect) AND
  (rec2.retro= rec1.retro) AND
  (rec2.eformation= rec1.eFormation) AND
  (rec2.enominalised= rec1.eNominalised) AND
  (rec2.form= rec1.form) AND
  (rec2.eORenForm= rec1.eORenForm) AND
  (rec2.temporal= rec1.temporal) AND
  (rec2.thetaadj= rec1.thetaadj) AND
  (rec2.reflexivity= rec1.reflexivity)
END;
FUNCTION COPYT_adjptoadjpprop(
  rec1:LSDOMAINT_ADJPrecord):LSDOMAINT_ADJPPROPrecord;
VAR rec2:LSDOMAINT_ADJPPROPrecord;
BEGIN
WITH rec2 DO
     BEGIN
     req:= rec1.req;
     env:= rec1.env;
     class:= rec1.class;
     deixis:= rec1.deixis;
     aspect:= rec1.aspect;
     retro:= rec1.retro;
     aktionsarts:= [];
     superdeixis:= omegadeixis;
     temporal:= rec1.temporal;
     actsubcefs:= rec1.actsubcefs;
     thetaadj:= rec1.thetaadj;
     adjpatternefs:= rec1.adjpatternefs;
     PROsubject:= false;
     mood:= rec1.mood
     END;
COPYT_adjptoadjpprop:=rec2
END;
FUNCTION COPYX_adjptoadjpprop(
  rec2:LSDOMAINT_ADJPPROPrecord;
  rec1:LSDOMAINT_ADJPrecord):BOOLEAN;
BEGIN
COPYX_adjptoadjpprop:=
  (rec2.req= rec1.req) AND
  (rec2.env= rec1.env) AND
  (rec2.class= rec1.class) AND
  (rec2.deixis= rec1.deixis) AND
  (rec2.aspect= rec1.aspect) AND
  (rec2.retro= rec1.retro) AND
  (rec2.temporal= rec1.temporal) AND
  (rec2.actsubcefs= rec1.actsubcefs) AND
  (rec2.thetaadj= rec1.thetaadj) AND
  (rec2.adjpatternefs= rec1.adjpatternefs) AND
  (rec2.mood= rec1.mood)
END;
FUNCTION COPYT_advtoadvp(
  rec1:LSDOMAINT_ADVrecord):LSDOMAINT_ADVPrecord;
VAR rec2:LSDOMAINT_ADVPrecord;
BEGIN
WITH rec2 DO
     BEGIN
     req:= rec1.req;
     env:= rec1.env;
     class:= rec1.class;
     deixis:= rec1.deixis;
     aspect:= rec1.aspect;
     retro:= rec1.retro;
     superdeixis:= omegadeixis;
     actsubcefs:= [VPAdv];
     Qstatus:= rec1.Qstatus;
     mood:= rec1.mood;
     thetaadv:= rec1.thetaadv;
     advpatternefs:= [];
     temporal:= rec1.temporal;
     Radvb:= rec1.Radvb;
     possnietnp:= rec1.possnietnp;
     thanas:= rec1.thanas;
     thanascompl:= false;
     coord:= nocoord
     END;
COPYT_advtoadvp:=rec2
END;
FUNCTION COPYX_advtoadvp(
  rec2:LSDOMAINT_ADVPrecord;
  rec1:LSDOMAINT_ADVrecord):BOOLEAN;
BEGIN
COPYX_advtoadvp:=
  (rec2.req= rec1.req) AND
  (rec2.env= rec1.env) AND
  (rec2.class= rec1.class) AND
  (rec2.deixis= rec1.deixis) AND
  (rec2.aspect= rec1.aspect) AND
  (rec2.retro= rec1.retro) AND
  (rec2.Qstatus= rec1.Qstatus) AND
  (rec2.mood= rec1.mood) AND
  (rec2.thetaadv= rec1.thetaadv) AND
  (rec2.temporal= rec1.temporal) AND
  (rec2.Radvb= rec1.Radvb) AND
  (rec2.possnietnp= rec1.possnietnp) AND
  (rec2.thanas= rec1.thanas)
END;
FUNCTION COPYT_nountocn(
  rec1:LSDOMAINT_NOUNrecord):LSDOMAINT_CNrecord;
VAR rec2:LSDOMAINT_CNrecord;
BEGIN
WITH rec2 DO
     BEGIN
     req:= rec1.req;
     env:= rec1.env;
     superdeixis:= Omegadeixis;
     class:= rec1.class;
     deixis:= rec1.deixis;
     aspect:= rec1.aspect;
     retro:= rec1.retro;
     definite:= omegadef;
     numbers:= [singular];
     cases:= [Nominative];
     genders:= rec1.genders;
     sexes:= rec1.sexes;
     actsubcs:= [othernoun];
     temporal:= rec1.temporal;
     possgeni:= rec1.possgeni;
     animate:= rec1.animate;
     human:= rec1.human;
     posscomas:= rec1.posscomas;
     thetanp:= rec1.thetanp;
     nounpatternefs:= []
     END;
COPYT_nountocn:=rec2
END;
FUNCTION COPYX_nountocn(
  rec2:LSDOMAINT_CNrecord;
  rec1:LSDOMAINT_NOUNrecord):BOOLEAN;
BEGIN
COPYX_nountocn:=
  (rec2.req= rec1.req) AND
  (rec2.env= rec1.env) AND
  (rec2.class= rec1.class) AND
  (rec2.deixis= rec1.deixis) AND
  (rec2.aspect= rec1.aspect) AND
  (rec2.retro= rec1.retro) AND
  (rec2.genders= rec1.genders) AND
  (rec2.sexes= rec1.sexes) AND
  (rec2.temporal= rec1.temporal) AND
  (rec2.possgeni= rec1.possgeni) AND
  (rec2.animate= rec1.animate) AND
  (rec2.human= rec1.human) AND
  (rec2.posscomas= rec1.posscomas) AND
  (rec2.thetanp= rec1.thetanp)
END;
FUNCTION COPYT_cnTOnp(
  rec1:LSDOMAINT_CNrecord):LSDOMAINT_NPrecord;
VAR rec2:LSDOMAINT_NPrecord;
BEGIN
WITH rec2 DO
     BEGIN
     req:= rec1.req;
     env:= rec1.env;
     superdeixis:= rec1.superdeixis;
     class:= rec1.class;
     deixis:= rec1.deixis;
     aspect:= rec1.aspect;
     retro:= rec1.retro;
     definite:= rec1.definite;
     person:= 3;
     number:= singular;
     cases:= rec1.cases;
     genders:= rec1.genders;
     sexes:= rec1.sexes;
     actsubcs:= rec1.actsubcs;
     temporal:= rec1.temporal;
     possgeni:= rec1.possgeni;
     animate:= rec1.animate;
     human:= rec1.human;
     actcomas:= [count];
     thetanp:= rec1.thetanp;
     nounpatternefs:= rec1.nounpatternefs;
     posspred:= false;
     possnietnp:= false;
     mood:= declxpmood;
     generic:= omegageneric;
     possRform:= false;
     syntquant:= omegaquant;
     NPhead:= otherNP;
     specQ:= omegaspec;
     coord:= nocoord
     END;
COPYT_cnTOnp:=rec2
END;
FUNCTION COPYX_cnTOnp(
  rec2:LSDOMAINT_NPrecord;
  rec1:LSDOMAINT_CNrecord):BOOLEAN;
BEGIN
COPYX_cnTOnp:=
  (rec2.req= rec1.req) AND
  (rec2.env= rec1.env) AND
  (rec2.superdeixis= rec1.superdeixis) AND
  (rec2.class= rec1.class) AND
  (rec2.deixis= rec1.deixis) AND
  (rec2.aspect= rec1.aspect) AND
  (rec2.retro= rec1.retro) AND
  (rec2.definite= rec1.definite) AND
  (rec2.cases= rec1.cases) AND
  (rec2.genders= rec1.genders) AND
  (rec2.sexes= rec1.sexes) AND
  (rec2.actsubcs= rec1.actsubcs) AND
  (rec2.temporal= rec1.temporal) AND
  (rec2.possgeni= rec1.possgeni) AND
  (rec2.animate= rec1.animate) AND
  (rec2.human= rec1.human) AND
  (rec2.thetanp= rec1.thetanp) AND
  (rec2.nounpatternefs= rec1.nounpatternefs)
END;
FUNCTION COPYT_preppTOpreppprop(
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
     deixis:= rec1.deixis;
     aspect:= rec1.aspect;
     retro:= rec1.retro;
     aktionsarts:= [];
     superdeixis:= rec1.superdeixis;
     specq:= rec1.specQ
     END;
COPYT_preppTOpreppprop:=rec2
END;
FUNCTION COPYX_preppTOpreppprop(
  rec2:LSDOMAINT_PREPPPROPrecord;
  rec1:LSDOMAINT_PREPPrecord):BOOLEAN;
BEGIN
COPYX_preppTOpreppprop:=
  (rec2.req= rec1.req) AND
  (rec2.env= rec1.env) AND
  (rec2.mood= rec1.mood) AND
  (rec2.actsubcefs= rec1.actsubcefs) AND
  (rec2.synppefs= rec1.synppefs) AND
  (rec2.thetapp= rec1.thetapp) AND
  (rec2.headkey= rec1.headkey) AND
  (rec2.class= rec1.class) AND
  (rec2.deixis= rec1.deixis) AND
  (rec2.aspect= rec1.aspect) AND
  (rec2.retro= rec1.retro) AND
  (rec2.superdeixis= rec1.superdeixis) AND
  (rec2.specq= rec1.specQ)
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
     modus:= omegamodus;
     aktionsarts:= rec1.aktionsarts;
     aspect:= omegaAspect;
     deixis:= omegadeixis;
     retro:= false;
     finiteness:= omegafin;
     infsort:= omegainf;
     superdeixis:= rec1.superdeixis;
     VRcompl:= false
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
  (rec2.superdeixis= rec1.superdeixis)
END;
FUNCTION COPYT_clauseTOverbpprop(
  rec1:LSDOMAINT_CLAUSErecord):LSDOMAINT_VERBPPROPrecord;
VAR rec2:LSDOMAINT_VERBPPROPrecord;
BEGIN
WITH rec2 DO
     BEGIN
     req:= rec1.req;
     env:= rec1.env;
     superdeixis:= rec1.superdeixis;
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
  (rec2.superdeixis= rec1.superdeixis) AND
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
     modus:= omegamodus;
     aktionsarts:= rec1.aktionsarts;
     aspect:= rec1.aspect;
     deixis:= rec1.deixis;
     retro:= rec1.retro;
     finiteness:= omegafin;
     infsort:= omegainf;
     superdeixis:= rec1.superdeixis;
     VRcompl:= false
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
  (rec2.aspect= rec1.aspect) AND
  (rec2.deixis= rec1.deixis) AND
  (rec2.retro= rec1.retro) AND
  (rec2.superdeixis= rec1.superdeixis)
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
     deixis:= rec1.deixis;
     aspect:= rec1.aspect;
     retro:= rec1.retro;
     aktionsarts:= rec1.aktionsarts;
     superdeixis:= rec1.superdeixis;
     temporal:= false;
     actsubcefs:= [otheradj];
     thetaadj:= omegathetaadjp;
     adjpatternefs:= [];
     PROsubject:= rec1.PROsubject;
     mood:= declxpmood
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
  (rec2.deixis= rec1.deixis) AND
  (rec2.aspect= rec1.aspect) AND
  (rec2.retro= rec1.retro) AND
  (rec2.aktionsarts= rec1.aktionsarts) AND
  (rec2.superdeixis= rec1.superdeixis) AND
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
     modus:= omegamodus;
     aktionsarts:= rec1.aktionsarts;
     aspect:= omegaAspect;
     deixis:= omegadeixis;
     retro:= false;
     finiteness:= omegafin;
     infsort:= omegainf;
     superdeixis:= rec1.superdeixis;
     VRcompl:= false
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
  (rec2.superdeixis= rec1.superdeixis)
END;
FUNCTION COPYT_clauseTOnpprop(
  rec1:LSDOMAINT_CLAUSErecord):LSDOMAINT_NPPROPrecord;
VAR rec2:LSDOMAINT_NPPROPrecord;
BEGIN
WITH rec2 DO
     BEGIN
     req:= rec1.req;
     env:= rec1.env;
     superdeixis:= rec1.superdeixis;
     aktionsarts:= rec1.aktionsarts;
     thetanp:= omegathetanp;
     nounpatternefs:= [];
     PROsubject:= rec1.PROsubject
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
  (rec2.superdeixis= rec1.superdeixis) AND
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
     class:= rec1.class;
     deixis:= rec1.deixis;
     aspect:= rec1.aspect;
     retro:= rec1.retro;
     aktionsarts:= [];
     superdeixis:= rec1.superdeixis;
     actsubcefs:= rec1.actsubcefs;
     Qstatus:= rec1.Qstatus;
     thetaadv:= rec1.thetaadv;
     advpatternefs:= rec1.advpatternefs;
     PROsubject:= false;
     mood:= rec1.mood;
     temporal:= rec1.temporal;
     Radvb:= rec1.Radvb;
     thanascompl:= rec1.thanascompl
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
  (rec2.class= rec1.class) AND
  (rec2.deixis= rec1.deixis) AND
  (rec2.aspect= rec1.aspect) AND
  (rec2.retro= rec1.retro) AND
  (rec2.superdeixis= rec1.superdeixis) AND
  (rec2.actsubcefs= rec1.actsubcefs) AND
  (rec2.Qstatus= rec1.Qstatus) AND
  (rec2.thetaadv= rec1.thetaadv) AND
  (rec2.advpatternefs= rec1.advpatternefs) AND
  (rec2.mood= rec1.mood) AND
  (rec2.temporal= rec1.temporal) AND
  (rec2.Radvb= rec1.Radvb) AND
  (rec2.thanascompl= rec1.thanascompl)
END;
FUNCTION COPYT_advptovar(
  rec1:LSDOMAINT_ADVPrecord):LSDOMAINT_ADVPVARrecord;
VAR rec2:LSDOMAINT_ADVPVARrecord;
BEGIN
WITH rec2 DO
     BEGIN
     req:= rec1.req;
     env:= rec1.env;
     class:= rec1.class;
     deixis:= rec1.deixis;
     aspect:= rec1.aspect;
     retro:= rec1.retro;
     superdeixis:= rec1.superdeixis;
     actsubcefs:= rec1.actsubcefs;
     Qstatus:= rec1.Qstatus;
     mood:= rec1.mood;
     thetaadv:= rec1.thetaadv;
     advpatternefs:= rec1.advpatternefs;
     temporal:= rec1.temporal;
     Radvb:= rec1.Radvb;
     possnietnp:= rec1.possnietnp;
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
  (rec2.class= rec1.class) AND
  (rec2.deixis= rec1.deixis) AND
  (rec2.aspect= rec1.aspect) AND
  (rec2.retro= rec1.retro) AND
  (rec2.superdeixis= rec1.superdeixis) AND
  (rec2.actsubcefs= rec1.actsubcefs) AND
  (rec2.Qstatus= rec1.Qstatus) AND
  (rec2.mood= rec1.mood) AND
  (rec2.thetaadv= rec1.thetaadv) AND
  (rec2.advpatternefs= rec1.advpatternefs) AND
  (rec2.temporal= rec1.temporal) AND
  (rec2.Radvb= rec1.Radvb) AND
  (rec2.possnietnp= rec1.possnietnp) AND
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
     deixis:= rec1.deixis;
     aspect:= rec1.aspect;
     retro:= rec1.retro;
     superdeixis:= rec1.superdeixis;
     radvkey:= rec1.radvkey;
     stranded:= rec1.stranded;
     specQ:= rec1.specQ;
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
  (rec2.deixis= rec1.deixis) AND
  (rec2.aspect= rec1.aspect) AND
  (rec2.retro= rec1.retro) AND
  (rec2.superdeixis= rec1.superdeixis) AND
  (rec2.radvkey= rec1.radvkey) AND
  (rec2.stranded= rec1.stranded) AND
  (rec2.specQ= rec1.specQ) AND
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
     mood:= omegamood;
     senttype:= omegaclause;
     voice:= rec1.voice;
     PROsubject:= rec1.PROsubject;
     synvpefs:= rec1.synvpefs;
     thetavp:= rec1.thetavp;
     adjuncts:= rec1.adjuncts;
     modus:= rec1.modus;
     aktionsarts:= rec1.aktionsarts;
     aspect:= rec1.aspect;
     deixis:= rec1.deixis;
     retro:= rec1.retro;
     finiteness:= rec1.finiteness;
     infsort:= rec1.infsort;
     superdeixis:= rec1.superdeixis;
     VRcompl:= rec1.VRcompl;
     conjkey:= 0;
     adverbial:= false;
     temporal:= false;
     conjclass:= omegaTimeAdvClass;
     conjdeixis:= omegadeixis;
     conjaspect:= omegaAspect;
     conjretro:= false;
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
  (rec2.voice= rec1.voice) AND
  (rec2.PROsubject= rec1.PROsubject) AND
  (rec2.synvpefs= rec1.synvpefs) AND
  (rec2.thetavp= rec1.thetavp) AND
  (rec2.adjuncts= rec1.adjuncts) AND
  (rec2.modus= rec1.modus) AND
  (rec2.aktionsarts= rec1.aktionsarts) AND
  (rec2.aspect= rec1.aspect) AND
  (rec2.deixis= rec1.deixis) AND
  (rec2.retro= rec1.retro) AND
  (rec2.finiteness= rec1.finiteness) AND
  (rec2.infsort= rec1.infsort) AND
  (rec2.superdeixis= rec1.superdeixis) AND
  (rec2.VRcompl= rec1.VRcompl)
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
     modus:= rec1.modus;
     aktionsarts:= rec1.aktionsarts;
     aspect:= rec1.aspect;
     deixis:= rec1.deixis;
     retro:= rec1.retro;
     finiteness:= rec1.finiteness;
     infsort:= rec1.infsort;
     superdeixis:= rec1.superdeixis;
     VRcompl:= rec1.VRcompl
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
  (rec2.modus= rec1.modus) AND
  (rec2.aktionsarts= rec1.aktionsarts) AND
  (rec2.aspect= rec1.aspect) AND
  (rec2.deixis= rec1.deixis) AND
  (rec2.retro= rec1.retro) AND
  (rec2.finiteness= rec1.finiteness) AND
  (rec2.infsort= rec1.infsort) AND
  (rec2.superdeixis= rec1.superdeixis) AND
  (rec2.VRcompl= rec1.VRcompl)
END;
FUNCTION COPYT_bpropernounTOsubnoun(
  rec1:LSDOMAINT_BPROPERNOUNrecord):LSDOMAINT_SUBNOUNrecord;
VAR rec2:LSDOMAINT_SUBNOUNrecord;
BEGIN
WITH rec2 DO
     BEGIN
     req:= [pospol,negpol,omegapol];
     env:= [pospol,negpol,omegapol];
     dimforms:= rec1.dimforms;
     pluralforms:= rec1.pluralforms;
     genders:= rec1.genders;
     class:= rec1.class;
     deixis:= rec1.deixis;
     aspect:= rec1.aspect;
     retro:= rec1.retro;
     sexes:= rec1.sexes;
     subcs:= [othernoun];
     temporal:= rec1.temporal;
     possgeni:= rec1.possgeni;
     animate:= rec1.animate;
     human:= rec1.human;
     posscomas:= [count];
     thetanp:= omegathetanp;
     nounpatterns:= [];
     prepkey:= 0;
     personal:= true;
     lastaffix:= noaffix
     END;
COPYT_bpropernounTOsubnoun:=rec2
END;
FUNCTION COPYX_bpropernounTOsubnoun(
  rec2:LSDOMAINT_SUBNOUNrecord;
  rec1:LSDOMAINT_BPROPERNOUNrecord):BOOLEAN;
BEGIN
COPYX_bpropernounTOsubnoun:=
  (rec2.dimforms= rec1.dimforms) AND
  (rec2.pluralforms= rec1.pluralforms) AND
  (rec2.genders= rec1.genders) AND
  (rec2.class= rec1.class) AND
  (rec2.deixis= rec1.deixis) AND
  (rec2.aspect= rec1.aspect) AND
  (rec2.retro= rec1.retro) AND
  (rec2.sexes= rec1.sexes) AND
  (rec2.temporal= rec1.temporal) AND
  (rec2.possgeni= rec1.possgeni) AND
  (rec2.animate= rec1.animate) AND
  (rec2.human= rec1.human)
END;
FUNCTION COPYT_artTOdetp(
  rec1:LSDOMAINT_ARTrecord):LSDOMAINT_DETPrecord;
VAR rec2:LSDOMAINT_DETPrecord;
BEGIN
WITH rec2 DO
     BEGIN
     req:= [pospol,negpol,omegapol];
     env:= [pospol,negpol,omegapol];
     possnietnp:= false;
     definite:= rec1.definite;
     posspred:= false;
     possnumbers:= rec1.possnumbers;
     posscomas:= rec1.posscomas;
     mood:= declxpmood;
     eORenForm:= noform;
     syntquant:= Omegaquant;
     possgenders:= [omegagender];
     superdeixis:= omegadeixis
     END;
COPYT_artTOdetp:=rec2
END;
FUNCTION COPYX_artTOdetp(
  rec2:LSDOMAINT_DETPrecord;
  rec1:LSDOMAINT_ARTrecord):BOOLEAN;
BEGIN
COPYX_artTOdetp:=
  (rec2.definite= rec1.definite) AND
  (rec2.possnumbers= rec1.possnumbers) AND
  (rec2.posscomas= rec1.posscomas)
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
     hop:= rec1.hop;
     superdeixis:= omegadeixis
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
  (rec2.thanas= rec1.thanas) AND
  (rec2.hop= rec1.hop)
END;
FUNCTION COPYT_sentenceTOverbp(
  rec1:LSDOMAINT_SENTENCErecord):LSDOMAINT_VERBPrecord;
VAR rec2:LSDOMAINT_VERBPrecord;
BEGIN
WITH rec2 DO
     BEGIN
     req:= rec1.req;
     env:= rec1.env;
     voice:= rec1.voice;
     synvpefs:= rec1.synvpefs;
     thetavp:= rec1.thetavp;
     adjuncts:= rec1.adjuncts;
     foundauxes:= [];
     modus:= rec1.modus;
     reflexivity:= notreflexive;
     classes:= [];
     persons:= [];
     number:= omeganumber;
     aspect:= rec1.aspect;
     tense:= omegatense;
     retro:= rec1.retro;
     finiteness:= rec1.finiteness;
     infsort:= rec1.infsort;
     objfound:= false;
     indobjfound:= false;
     preadvok:= false;
     Vmatrixhead:= false;
     anterelativeok:= false;
     synvpefs2:= [];
     adjvpefs:= [];
     countenfound:= false;
     locargfound:= false;
     dirargfound:= false;
     prepobjfound:= false;
     nppredfound:= false;
     adjpppredfound:= false;
     prepppredfound:= false;
     aanobjfound:= false;
     voorobjfound:= false;
     postvpofound:= false;
     strandedfound:= false;
     vpcomplfound:= false
     END;
COPYT_sentenceTOverbp:=rec2
END;
FUNCTION COPYX_sentenceTOverbp(
  rec2:LSDOMAINT_VERBPrecord;
  rec1:LSDOMAINT_SENTENCErecord):BOOLEAN;
BEGIN
COPYX_sentenceTOverbp:=
  (rec2.req= rec1.req) AND
  (rec2.env= rec1.env) AND
  (rec2.voice= rec1.voice) AND
  (rec2.synvpefs= rec1.synvpefs) AND
  (rec2.thetavp= rec1.thetavp) AND
  (rec2.adjuncts= rec1.adjuncts) AND
  (rec2.modus= rec1.modus) AND
  (rec2.aspect= rec1.aspect) AND
  (rec2.retro= rec1.retro) AND
  (rec2.finiteness= rec1.finiteness) AND
  (rec2.infsort= rec1.infsort)
END;
FUNCTION COPYT_subverbtoalloverb(
  rec1:LSDOMAINT_SUBVERBrecord):LSDOMAINT_VERBrecord;
VAR rec2:LSDOMAINT_VERBrecord;
BEGIN
WITH rec2 DO
     BEGIN
     req:= rec1.req;
     env:= rec1.env;
     conjclasses:= rec1.conjclasses;
     particle:= rec1.particle;
     number:= omeganumber;
     persons:= [];
     eORenForm:= NoForm;
     modus:= omegamodus;
     tense:= omegatense;
     possvoices:= rec1.possvoices;
     reflexivity:= rec1.reflexivity;
     synvps:= rec1.synvps;
     thetavp:= rec1.thetavp;
     adjuncts:= rec1.adjuncts;
     CaseAssigner:= rec1.CaseAssigner;
     subc:= rec1.subc;
     foundauxes:= [];
     perfauxs:= rec1.perfauxs;
     prepkey1:= rec1.prepkey1;
     prepkey2:= rec1.prepkey2;
     controller:= rec1.controller;
     verbraiser:= rec1.verbraiser;
     IPP:= rec1.IPP;
     synvpefs2:= [];
     status:= bareV;
     classes:= rec1.classes
     END;
COPYT_subverbtoalloverb:=rec2
END;
FUNCTION COPYX_subverbtoalloverb(
  rec2:LSDOMAINT_VERBrecord;
  rec1:LSDOMAINT_SUBVERBrecord):BOOLEAN;
BEGIN
COPYX_subverbtoalloverb:=
  (rec2.req= rec1.req) AND
  (rec2.env= rec1.env) AND
  (rec2.conjclasses= rec1.conjclasses) AND
  (rec2.particle= rec1.particle) AND
  (rec2.possvoices= rec1.possvoices) AND
  (rec2.reflexivity= rec1.reflexivity) AND
  (rec2.synvps= rec1.synvps) AND
  (rec2.thetavp= rec1.thetavp) AND
  (rec2.adjuncts= rec1.adjuncts) AND
  (rec2.CaseAssigner= rec1.CaseAssigner) AND
  (rec2.subc= rec1.subc) AND
  (rec2.perfauxs= rec1.perfauxs) AND
  (rec2.prepkey1= rec1.prepkey1) AND
  (rec2.prepkey2= rec1.prepkey2) AND
  (rec2.controller= rec1.controller) AND
  (rec2.verbraiser= rec1.verbraiser) AND
  (rec2.IPP= rec1.IPP) AND
  (rec2.classes= rec1.classes)
END;
FUNCTION COPYT_alloverbtoverb(
  rec1:LSDOMAINT_VERBrecord):LSDOMAINT_VERBrecord;
VAR rec2:LSDOMAINT_VERBrecord;
BEGIN
WITH rec2 DO
     BEGIN
     req:= rec1.req;
     env:= rec1.env;
     conjclasses:= rec1.conjclasses;
     particle:= rec1.particle;
     number:= rec1.number;
     persons:= rec1.persons;
     eORenForm:= rec1.eORenForm;
     modus:= rec1.modus;
     tense:= rec1.tense;
     possvoices:= rec1.possvoices;
     reflexivity:= rec1.reflexivity;
     synvps:= rec1.synvps;
     thetavp:= rec1.thetavp;
     adjuncts:= rec1.adjuncts;
     CaseAssigner:= rec1.CaseAssigner;
     subc:= rec1.subc;
     foundauxes:= rec1.foundauxes;
     perfauxs:= rec1.perfauxs;
     prepkey1:= rec1.prepkey1;
     prepkey2:= rec1.prepkey2;
     controller:= rec1.controller;
     verbraiser:= rec1.verbraiser;
     IPP:= rec1.IPP;
     synvpefs2:= rec1.synvpefs2;
     status:= rec1.status;
     classes:= rec1.classes
     END;
COPYT_alloverbtoverb:=rec2
END;
FUNCTION COPYX_alloverbtoverb(
  rec2:LSDOMAINT_VERBrecord;
  rec1:LSDOMAINT_VERBrecord):BOOLEAN;
BEGIN
COPYX_alloverbtoverb:=
  (rec2.req= rec1.req) AND
  (rec2.env= rec1.env) AND
  (rec2.conjclasses= rec1.conjclasses) AND
  (rec2.particle= rec1.particle) AND
  (rec2.number= rec1.number) AND
  (rec2.persons= rec1.persons) AND
  (rec2.eORenForm= rec1.eORenForm) AND
  (rec2.modus= rec1.modus) AND
  (rec2.tense= rec1.tense) AND
  (rec2.possvoices= rec1.possvoices) AND
  (rec2.reflexivity= rec1.reflexivity) AND
  (rec2.synvps= rec1.synvps) AND
  (rec2.thetavp= rec1.thetavp) AND
  (rec2.adjuncts= rec1.adjuncts) AND
  (rec2.CaseAssigner= rec1.CaseAssigner) AND
  (rec2.subc= rec1.subc) AND
  (rec2.foundauxes= rec1.foundauxes) AND
  (rec2.perfauxs= rec1.perfauxs) AND
  (rec2.prepkey1= rec1.prepkey1) AND
  (rec2.prepkey2= rec1.prepkey2) AND
  (rec2.controller= rec1.controller) AND
  (rec2.verbraiser= rec1.verbraiser) AND
  (rec2.IPP= rec1.IPP) AND
  (rec2.synvpefs2= rec1.synvpefs2) AND
  (rec2.status= rec1.status) AND
  (rec2.classes= rec1.classes)
END;
FUNCTION COPYT_verbtoalloverb(
  rec1:LSDOMAINT_VERBrecord):LSDOMAINT_VERBrecord;
VAR rec2:LSDOMAINT_VERBrecord;
BEGIN
WITH rec2 DO
     BEGIN
     req:= rec1.req;
     env:= rec1.env;
     conjclasses:= rec1.conjclasses;
     particle:= rec1.particle;
     number:= rec1.number;
     persons:= rec1.persons;
     eORenForm:= rec1.eORenForm;
     modus:= rec1.modus;
     tense:= rec1.tense;
     possvoices:= rec1.possvoices;
     reflexivity:= rec1.reflexivity;
     synvps:= rec1.synvps;
     thetavp:= rec1.thetavp;
     adjuncts:= rec1.adjuncts;
     CaseAssigner:= rec1.CaseAssigner;
     subc:= rec1.subc;
     foundauxes:= rec1.foundauxes;
     perfauxs:= rec1.perfauxs;
     prepkey1:= rec1.prepkey1;
     prepkey2:= rec1.prepkey2;
     controller:= rec1.controller;
     verbraiser:= rec1.verbraiser;
     IPP:= rec1.IPP;
     synvpefs2:= rec1.synvpefs2;
     status:= rec1.status;
     classes:= rec1.classes
     END;
COPYT_verbtoalloverb:=rec2
END;
FUNCTION COPYX_verbtoalloverb(
  rec2:LSDOMAINT_VERBrecord;
  rec1:LSDOMAINT_VERBrecord):BOOLEAN;
BEGIN
COPYX_verbtoalloverb:=
  (rec2.req= rec1.req) AND
  (rec2.env= rec1.env) AND
  (rec2.conjclasses= rec1.conjclasses) AND
  (rec2.particle= rec1.particle) AND
  (rec2.number= rec1.number) AND
  (rec2.persons= rec1.persons) AND
  (rec2.eORenForm= rec1.eORenForm) AND
  (rec2.modus= rec1.modus) AND
  (rec2.tense= rec1.tense) AND
  (rec2.possvoices= rec1.possvoices) AND
  (rec2.reflexivity= rec1.reflexivity) AND
  (rec2.synvps= rec1.synvps) AND
  (rec2.thetavp= rec1.thetavp) AND
  (rec2.adjuncts= rec1.adjuncts) AND
  (rec2.CaseAssigner= rec1.CaseAssigner) AND
  (rec2.subc= rec1.subc) AND
  (rec2.foundauxes= rec1.foundauxes) AND
  (rec2.perfauxs= rec1.perfauxs) AND
  (rec2.prepkey1= rec1.prepkey1) AND
  (rec2.prepkey2= rec1.prepkey2) AND
  (rec2.controller= rec1.controller) AND
  (rec2.verbraiser= rec1.verbraiser) AND
  (rec2.IPP= rec1.IPP) AND
  (rec2.synvpefs2= rec1.synvpefs2) AND
  (rec2.status= rec1.status) AND
  (rec2.classes= rec1.classes)
END;
FUNCTION COPYT_subnountoallonoun(
  rec1:LSDOMAINT_SUBNOUNrecord):LSDOMAINT_NOUNrecord;
VAR rec2:LSDOMAINT_NOUNrecord;
BEGIN
WITH rec2 DO
     BEGIN
     req:= rec1.req;
     env:= rec1.env;
     dimforms:= rec1.dimforms;
     pluralforms:= rec1.pluralforms;
     genders:= rec1.genders;
     number:= omeganumber;
     geni:= false;
     class:= rec1.class;
     deixis:= rec1.deixis;
     aspect:= rec1.aspect;
     retro:= rec1.retro;
     sexes:= rec1.sexes;
     subcs:= rec1.subcs;
     temporal:= rec1.temporal;
     possgeni:= rec1.possgeni;
     animate:= rec1.animate;
     human:= rec1.human;
     posscomas:= rec1.posscomas;
     thetanp:= rec1.thetanp;
     nounpatterns:= rec1.nounpatterns;
     prepkey:= rec1.prepkey;
     personal:= rec1.personal
     END;
COPYT_subnountoallonoun:=rec2
END;
FUNCTION COPYX_subnountoallonoun(
  rec2:LSDOMAINT_NOUNrecord;
  rec1:LSDOMAINT_SUBNOUNrecord):BOOLEAN;
BEGIN
COPYX_subnountoallonoun:=
  (rec2.req= rec1.req) AND
  (rec2.env= rec1.env) AND
  (rec2.dimforms= rec1.dimforms) AND
  (rec2.pluralforms= rec1.pluralforms) AND
  (rec2.genders= rec1.genders) AND
  (rec2.class= rec1.class) AND
  (rec2.deixis= rec1.deixis) AND
  (rec2.aspect= rec1.aspect) AND
  (rec2.retro= rec1.retro) AND
  (rec2.sexes= rec1.sexes) AND
  (rec2.subcs= rec1.subcs) AND
  (rec2.temporal= rec1.temporal) AND
  (rec2.possgeni= rec1.possgeni) AND
  (rec2.animate= rec1.animate) AND
  (rec2.human= rec1.human) AND
  (rec2.posscomas= rec1.posscomas) AND
  (rec2.thetanp= rec1.thetanp) AND
  (rec2.nounpatterns= rec1.nounpatterns) AND
  (rec2.prepkey= rec1.prepkey) AND
  (rec2.personal= rec1.personal)
END;
FUNCTION COPYT_allonountonoun(
  rec1:LSDOMAINT_NOUNrecord):LSDOMAINT_NOUNrecord;
VAR rec2:LSDOMAINT_NOUNrecord;
BEGIN
WITH rec2 DO
     BEGIN
     req:= rec1.req;
     env:= rec1.env;
     dimforms:= rec1.dimforms;
     pluralforms:= rec1.pluralforms;
     genders:= rec1.genders;
     number:= rec1.number;
     geni:= rec1.geni;
     class:= rec1.class;
     deixis:= rec1.deixis;
     aspect:= rec1.aspect;
     retro:= rec1.retro;
     sexes:= rec1.sexes;
     subcs:= rec1.subcs;
     temporal:= rec1.temporal;
     possgeni:= rec1.possgeni;
     animate:= rec1.animate;
     human:= rec1.human;
     posscomas:= rec1.posscomas;
     thetanp:= rec1.thetanp;
     nounpatterns:= rec1.nounpatterns;
     prepkey:= rec1.prepkey;
     personal:= rec1.personal
     END;
COPYT_allonountonoun:=rec2
END;
FUNCTION COPYX_allonountonoun(
  rec2:LSDOMAINT_NOUNrecord;
  rec1:LSDOMAINT_NOUNrecord):BOOLEAN;
BEGIN
COPYX_allonountonoun:=
  (rec2.req= rec1.req) AND
  (rec2.env= rec1.env) AND
  (rec2.dimforms= rec1.dimforms) AND
  (rec2.pluralforms= rec1.pluralforms) AND
  (rec2.genders= rec1.genders) AND
  (rec2.number= rec1.number) AND
  (rec2.geni= rec1.geni) AND
  (rec2.class= rec1.class) AND
  (rec2.deixis= rec1.deixis) AND
  (rec2.aspect= rec1.aspect) AND
  (rec2.retro= rec1.retro) AND
  (rec2.sexes= rec1.sexes) AND
  (rec2.subcs= rec1.subcs) AND
  (rec2.temporal= rec1.temporal) AND
  (rec2.possgeni= rec1.possgeni) AND
  (rec2.animate= rec1.animate) AND
  (rec2.human= rec1.human) AND
  (rec2.posscomas= rec1.posscomas) AND
  (rec2.thetanp= rec1.thetanp) AND
  (rec2.nounpatterns= rec1.nounpatterns) AND
  (rec2.prepkey= rec1.prepkey) AND
  (rec2.personal= rec1.personal)
END;
FUNCTION COPYT_nountoallonoun(
  rec1:LSDOMAINT_NOUNrecord):LSDOMAINT_NOUNrecord;
VAR rec2:LSDOMAINT_NOUNrecord;
BEGIN
WITH rec2 DO
     BEGIN
     req:= rec1.req;
     env:= rec1.env;
     dimforms:= rec1.dimforms;
     pluralforms:= rec1.pluralforms;
     genders:= rec1.genders;
     number:= rec1.number;
     geni:= rec1.geni;
     class:= rec1.class;
     deixis:= rec1.deixis;
     aspect:= rec1.aspect;
     retro:= rec1.retro;
     sexes:= rec1.sexes;
     subcs:= rec1.subcs;
     temporal:= rec1.temporal;
     possgeni:= rec1.possgeni;
     animate:= rec1.animate;
     human:= rec1.human;
     posscomas:= rec1.posscomas;
     thetanp:= rec1.thetanp;
     nounpatterns:= rec1.nounpatterns;
     prepkey:= rec1.prepkey;
     personal:= rec1.personal
     END;
COPYT_nountoallonoun:=rec2
END;
FUNCTION COPYX_nountoallonoun(
  rec2:LSDOMAINT_NOUNrecord;
  rec1:LSDOMAINT_NOUNrecord):BOOLEAN;
BEGIN
COPYX_nountoallonoun:=
  (rec2.req= rec1.req) AND
  (rec2.env= rec1.env) AND
  (rec2.dimforms= rec1.dimforms) AND
  (rec2.pluralforms= rec1.pluralforms) AND
  (rec2.genders= rec1.genders) AND
  (rec2.number= rec1.number) AND
  (rec2.geni= rec1.geni) AND
  (rec2.class= rec1.class) AND
  (rec2.deixis= rec1.deixis) AND
  (rec2.aspect= rec1.aspect) AND
  (rec2.retro= rec1.retro) AND
  (rec2.sexes= rec1.sexes) AND
  (rec2.subcs= rec1.subcs) AND
  (rec2.temporal= rec1.temporal) AND
  (rec2.possgeni= rec1.possgeni) AND
  (rec2.animate= rec1.animate) AND
  (rec2.human= rec1.human) AND
  (rec2.posscomas= rec1.posscomas) AND
  (rec2.thetanp= rec1.thetanp) AND
  (rec2.nounpatterns= rec1.nounpatterns) AND
  (rec2.prepkey= rec1.prepkey) AND
  (rec2.personal= rec1.personal)
END;
FUNCTION COPYT_subadjtoalloadj(
  rec1:LSDOMAINT_SUBADJrecord):LSDOMAINT_ADJrecord;
VAR rec2:LSDOMAINT_ADJrecord;
BEGIN
WITH rec2 DO
     BEGIN
     req:= rec1.req;
     env:= rec1.env;
     class:= rec1.class;
     deixis:= rec1.deixis;
     aspect:= rec1.aspect;
     retro:= rec1.retro;
     uses:= rec1.uses;
     eFormation:= rec1.eFormation;
     sFormation:= rec1.sFormation;
     eNominalised:= rec1.eNominalised;
     comparatives:= rec1.comparatives;
     superlatives:= rec1.superlatives;
     form:= positive;
     eORenForm:= NoForm;
     temporal:= rec1.temporal;
     subcs:= rec1.subcs;
     thetaadj:= rec1.thetaadj;
     adjpatterns:= rec1.adjpatterns;
     prepkey:= rec1.prepkey;
     reflexivity:= rec1.reflexivity;
     possadv:= rec1.possadv
     END;
COPYT_subadjtoalloadj:=rec2
END;
FUNCTION COPYX_subadjtoalloadj(
  rec2:LSDOMAINT_ADJrecord;
  rec1:LSDOMAINT_SUBADJrecord):BOOLEAN;
BEGIN
COPYX_subadjtoalloadj:=
  (rec2.req= rec1.req) AND
  (rec2.env= rec1.env) AND
  (rec2.class= rec1.class) AND
  (rec2.deixis= rec1.deixis) AND
  (rec2.aspect= rec1.aspect) AND
  (rec2.retro= rec1.retro) AND
  (rec2.uses= rec1.uses) AND
  (rec2.eFormation= rec1.eFormation) AND
  (rec2.sFormation= rec1.sFormation) AND
  (rec2.eNominalised= rec1.eNominalised) AND
  (rec2.comparatives= rec1.comparatives) AND
  (rec2.superlatives= rec1.superlatives) AND
  (rec2.temporal= rec1.temporal) AND
  (rec2.subcs= rec1.subcs) AND
  (rec2.thetaadj= rec1.thetaadj) AND
  (rec2.adjpatterns= rec1.adjpatterns) AND
  (rec2.prepkey= rec1.prepkey) AND
  (rec2.reflexivity= rec1.reflexivity) AND
  (rec2.possadv= rec1.possadv)
END;
FUNCTION COPYT_alloadjtoadj(
  rec1:LSDOMAINT_ADJrecord):LSDOMAINT_ADJrecord;
VAR rec2:LSDOMAINT_ADJrecord;
BEGIN
WITH rec2 DO
     BEGIN
     req:= rec1.req;
     env:= rec1.env;
     class:= rec1.class;
     deixis:= rec1.deixis;
     aspect:= rec1.aspect;
     retro:= rec1.retro;
     uses:= rec1.uses;
     eFormation:= rec1.eFormation;
     sFormation:= rec1.sFormation;
     eNominalised:= rec1.eNominalised;
     comparatives:= rec1.comparatives;
     superlatives:= rec1.superlatives;
     form:= rec1.form;
     eORenForm:= rec1.eORenForm;
     temporal:= rec1.temporal;
     subcs:= rec1.subcs;
     thetaadj:= rec1.thetaadj;
     adjpatterns:= rec1.adjpatterns;
     prepkey:= rec1.prepkey;
     reflexivity:= rec1.reflexivity;
     possadv:= rec1.possadv
     END;
COPYT_alloadjtoadj:=rec2
END;
FUNCTION COPYX_alloadjtoadj(
  rec2:LSDOMAINT_ADJrecord;
  rec1:LSDOMAINT_ADJrecord):BOOLEAN;
BEGIN
COPYX_alloadjtoadj:=
  (rec2.req= rec1.req) AND
  (rec2.env= rec1.env) AND
  (rec2.class= rec1.class) AND
  (rec2.deixis= rec1.deixis) AND
  (rec2.aspect= rec1.aspect) AND
  (rec2.retro= rec1.retro) AND
  (rec2.uses= rec1.uses) AND
  (rec2.eFormation= rec1.eFormation) AND
  (rec2.sFormation= rec1.sFormation) AND
  (rec2.eNominalised= rec1.eNominalised) AND
  (rec2.comparatives= rec1.comparatives) AND
  (rec2.superlatives= rec1.superlatives) AND
  (rec2.form= rec1.form) AND
  (rec2.eORenForm= rec1.eORenForm) AND
  (rec2.temporal= rec1.temporal) AND
  (rec2.subcs= rec1.subcs) AND
  (rec2.thetaadj= rec1.thetaadj) AND
  (rec2.adjpatterns= rec1.adjpatterns) AND
  (rec2.prepkey= rec1.prepkey) AND
  (rec2.reflexivity= rec1.reflexivity) AND
  (rec2.possadv= rec1.possadv)
END;
FUNCTION COPYT_adjtoalloadj(
  rec1:LSDOMAINT_ADJrecord):LSDOMAINT_ADJrecord;
VAR rec2:LSDOMAINT_ADJrecord;
BEGIN
WITH rec2 DO
     BEGIN
     req:= rec1.req;
     env:= rec1.env;
     class:= rec1.class;
     deixis:= rec1.deixis;
     aspect:= rec1.aspect;
     retro:= rec1.retro;
     uses:= rec1.uses;
     eFormation:= rec1.eFormation;
     sFormation:= rec1.sFormation;
     eNominalised:= rec1.eNominalised;
     comparatives:= rec1.comparatives;
     superlatives:= rec1.superlatives;
     form:= rec1.form;
     eORenForm:= rec1.eORenForm;
     temporal:= rec1.temporal;
     subcs:= rec1.subcs;
     thetaadj:= rec1.thetaadj;
     adjpatterns:= rec1.adjpatterns;
     prepkey:= rec1.prepkey;
     reflexivity:= rec1.reflexivity;
     possadv:= rec1.possadv
     END;
COPYT_adjtoalloadj:=rec2
END;
FUNCTION COPYX_adjtoalloadj(
  rec2:LSDOMAINT_ADJrecord;
  rec1:LSDOMAINT_ADJrecord):BOOLEAN;
BEGIN
COPYX_adjtoalloadj:=
  (rec2.req= rec1.req) AND
  (rec2.env= rec1.env) AND
  (rec2.class= rec1.class) AND
  (rec2.deixis= rec1.deixis) AND
  (rec2.aspect= rec1.aspect) AND
  (rec2.retro= rec1.retro) AND
  (rec2.uses= rec1.uses) AND
  (rec2.eFormation= rec1.eFormation) AND
  (rec2.sFormation= rec1.sFormation) AND
  (rec2.eNominalised= rec1.eNominalised) AND
  (rec2.comparatives= rec1.comparatives) AND
  (rec2.superlatives= rec1.superlatives) AND
  (rec2.form= rec1.form) AND
  (rec2.eORenForm= rec1.eORenForm) AND
  (rec2.temporal= rec1.temporal) AND
  (rec2.subcs= rec1.subcs) AND
  (rec2.thetaadj= rec1.thetaadj) AND
  (rec2.adjpatterns= rec1.adjpatterns) AND
  (rec2.prepkey= rec1.prepkey) AND
  (rec2.reflexivity= rec1.reflexivity) AND
  (rec2.possadv= rec1.possadv)
END;
FUNCTION COPYT_subadvtoalloadv(
  rec1:LSDOMAINT_SUBADVrecord):LSDOMAINT_ADVrecord;
VAR rec2:LSDOMAINT_ADVrecord;
BEGIN
WITH rec2 DO
     BEGIN
     req:= rec1.req;
     env:= rec1.env;
     comparatives:= rec1.comparatives;
     superlatives:= rec1.superlatives;
     subcs:= rec1.subcs;
     Qstatus:= rec1.Qstatus;
     form:= positive;
     eORenForm:= NoForm;
     class:= rec1.class;
     deixis:= rec1.deixis;
     aspect:= rec1.aspect;
     retro:= rec1.retro;
     mood:= rec1.mood;
     thetaadv:= rec1.thetaadv;
     advpatterns:= rec1.advpatterns;
     prepkey:= rec1.prepkey;
     temporal:= rec1.temporal;
     possnietnp:= rec1.possnietnp;
     thanas:= rec1.thanas;
     Radvb:= rec1.Radvb
     END;
COPYT_subadvtoalloadv:=rec2
END;
FUNCTION COPYX_subadvtoalloadv(
  rec2:LSDOMAINT_ADVrecord;
  rec1:LSDOMAINT_SUBADVrecord):BOOLEAN;
BEGIN
COPYX_subadvtoalloadv:=
  (rec2.req= rec1.req) AND
  (rec2.env= rec1.env) AND
  (rec2.comparatives= rec1.comparatives) AND
  (rec2.superlatives= rec1.superlatives) AND
  (rec2.subcs= rec1.subcs) AND
  (rec2.Qstatus= rec1.Qstatus) AND
  (rec2.class= rec1.class) AND
  (rec2.deixis= rec1.deixis) AND
  (rec2.aspect= rec1.aspect) AND
  (rec2.retro= rec1.retro) AND
  (rec2.mood= rec1.mood) AND
  (rec2.thetaadv= rec1.thetaadv) AND
  (rec2.advpatterns= rec1.advpatterns) AND
  (rec2.prepkey= rec1.prepkey) AND
  (rec2.temporal= rec1.temporal) AND
  (rec2.possnietnp= rec1.possnietnp) AND
  (rec2.thanas= rec1.thanas) AND
  (rec2.Radvb= rec1.Radvb)
END;
FUNCTION COPYT_alloadvtoadv(
  rec1:LSDOMAINT_ADVrecord):LSDOMAINT_ADVrecord;
VAR rec2:LSDOMAINT_ADVrecord;
BEGIN
WITH rec2 DO
     BEGIN
     req:= rec1.req;
     env:= rec1.env;
     comparatives:= rec1.comparatives;
     superlatives:= rec1.superlatives;
     subcs:= rec1.subcs;
     Qstatus:= rec1.Qstatus;
     form:= rec1.form;
     eORenForm:= rec1.eORenForm;
     class:= rec1.class;
     deixis:= rec1.deixis;
     aspect:= rec1.aspect;
     retro:= rec1.retro;
     mood:= rec1.mood;
     thetaadv:= rec1.thetaadv;
     advpatterns:= rec1.advpatterns;
     prepkey:= rec1.prepkey;
     temporal:= rec1.temporal;
     possnietnp:= rec1.possnietnp;
     thanas:= rec1.thanas;
     Radvb:= rec1.Radvb
     END;
COPYT_alloadvtoadv:=rec2
END;
FUNCTION COPYX_alloadvtoadv(
  rec2:LSDOMAINT_ADVrecord;
  rec1:LSDOMAINT_ADVrecord):BOOLEAN;
BEGIN
COPYX_alloadvtoadv:=
  (rec2.req= rec1.req) AND
  (rec2.env= rec1.env) AND
  (rec2.comparatives= rec1.comparatives) AND
  (rec2.superlatives= rec1.superlatives) AND
  (rec2.subcs= rec1.subcs) AND
  (rec2.Qstatus= rec1.Qstatus) AND
  (rec2.form= rec1.form) AND
  (rec2.eORenForm= rec1.eORenForm) AND
  (rec2.class= rec1.class) AND
  (rec2.deixis= rec1.deixis) AND
  (rec2.aspect= rec1.aspect) AND
  (rec2.retro= rec1.retro) AND
  (rec2.mood= rec1.mood) AND
  (rec2.thetaadv= rec1.thetaadv) AND
  (rec2.advpatterns= rec1.advpatterns) AND
  (rec2.prepkey= rec1.prepkey) AND
  (rec2.temporal= rec1.temporal) AND
  (rec2.possnietnp= rec1.possnietnp) AND
  (rec2.thanas= rec1.thanas) AND
  (rec2.Radvb= rec1.Radvb)
END;
FUNCTION COPYT_advtoalloadv(
  rec1:LSDOMAINT_ADVrecord):LSDOMAINT_ADVrecord;
VAR rec2:LSDOMAINT_ADVrecord;
BEGIN
WITH rec2 DO
     BEGIN
     req:= rec1.req;
     env:= rec1.env;
     comparatives:= rec1.comparatives;
     superlatives:= rec1.superlatives;
     subcs:= rec1.subcs;
     Qstatus:= rec1.Qstatus;
     form:= rec1.form;
     eORenForm:= rec1.eORenForm;
     class:= rec1.class;
     deixis:= rec1.deixis;
     aspect:= rec1.aspect;
     retro:= rec1.retro;
     mood:= rec1.mood;
     thetaadv:= rec1.thetaadv;
     advpatterns:= rec1.advpatterns;
     prepkey:= rec1.prepkey;
     temporal:= rec1.temporal;
     possnietnp:= rec1.possnietnp;
     thanas:= rec1.thanas;
     Radvb:= rec1.Radvb
     END;
COPYT_advtoalloadv:=rec2
END;
FUNCTION COPYX_advtoalloadv(
  rec2:LSDOMAINT_ADVrecord;
  rec1:LSDOMAINT_ADVrecord):BOOLEAN;
BEGIN
COPYX_advtoalloadv:=
  (rec2.req= rec1.req) AND
  (rec2.env= rec1.env) AND
  (rec2.comparatives= rec1.comparatives) AND
  (rec2.superlatives= rec1.superlatives) AND
  (rec2.subcs= rec1.subcs) AND
  (rec2.Qstatus= rec1.Qstatus) AND
  (rec2.form= rec1.form) AND
  (rec2.eORenForm= rec1.eORenForm) AND
  (rec2.class= rec1.class) AND
  (rec2.deixis= rec1.deixis) AND
  (rec2.aspect= rec1.aspect) AND
  (rec2.retro= rec1.retro) AND
  (rec2.mood= rec1.mood) AND
  (rec2.thetaadv= rec1.thetaadv) AND
  (rec2.advpatterns= rec1.advpatterns) AND
  (rec2.prepkey= rec1.prepkey) AND
  (rec2.temporal= rec1.temporal) AND
  (rec2.possnietnp= rec1.possnietnp) AND
  (rec2.thanas= rec1.thanas) AND
  (rec2.Radvb= rec1.Radvb)
END;
FUNCTION COPYT_bdettoallodet(
  rec1:LSDOMAINT_BDETrecord):LSDOMAINT_DETrecord;
VAR rec2:LSDOMAINT_DETrecord;
BEGIN
WITH rec2 DO
     BEGIN
     req:= rec1.req;
     env:= rec1.env;
     possnietnp:= rec1.possnietnp;
     definite:= rec1.definite;
     posspred:= rec1.posspred;
     possnumbers:= rec1.possnumbers;
     posscomas:= rec1.posscomas;
     mood:= rec1.mood;
     eFormation:= rec1.eFormation;
     enFormation:= rec1.enFormation;
     eORenForm:= NoForm;
     syntquant:= rec1.syntquant
     END;
COPYT_bdettoallodet:=rec2
END;
FUNCTION COPYX_bdettoallodet(
  rec2:LSDOMAINT_DETrecord;
  rec1:LSDOMAINT_BDETrecord):BOOLEAN;
BEGIN
COPYX_bdettoallodet:=
  (rec2.req= rec1.req) AND
  (rec2.env= rec1.env) AND
  (rec2.possnietnp= rec1.possnietnp) AND
  (rec2.definite= rec1.definite) AND
  (rec2.posspred= rec1.posspred) AND
  (rec2.possnumbers= rec1.possnumbers) AND
  (rec2.posscomas= rec1.posscomas) AND
  (rec2.mood= rec1.mood) AND
  (rec2.eFormation= rec1.eFormation) AND
  (rec2.enFormation= rec1.enFormation) AND
  (rec2.syntquant= rec1.syntquant)
END;
FUNCTION COPYT_allodettodet(
  rec1:LSDOMAINT_DETrecord):LSDOMAINT_DETrecord;
VAR rec2:LSDOMAINT_DETrecord;
BEGIN
WITH rec2 DO
     BEGIN
     req:= rec1.req;
     env:= rec1.env;
     possnietnp:= rec1.possnietnp;
     definite:= rec1.definite;
     posspred:= rec1.posspred;
     possnumbers:= rec1.possnumbers;
     posscomas:= rec1.posscomas;
     mood:= rec1.mood;
     eFormation:= rec1.eFormation;
     enFormation:= rec1.enFormation;
     eORenForm:= rec1.eORenForm;
     syntquant:= rec1.syntquant
     END;
COPYT_allodettodet:=rec2
END;
FUNCTION COPYX_allodettodet(
  rec2:LSDOMAINT_DETrecord;
  rec1:LSDOMAINT_DETrecord):BOOLEAN;
BEGIN
COPYX_allodettodet:=
  (rec2.req= rec1.req) AND
  (rec2.env= rec1.env) AND
  (rec2.possnietnp= rec1.possnietnp) AND
  (rec2.definite= rec1.definite) AND
  (rec2.posspred= rec1.posspred) AND
  (rec2.possnumbers= rec1.possnumbers) AND
  (rec2.posscomas= rec1.posscomas) AND
  (rec2.mood= rec1.mood) AND
  (rec2.eFormation= rec1.eFormation) AND
  (rec2.enFormation= rec1.enFormation) AND
  (rec2.eORenForm= rec1.eORenForm) AND
  (rec2.syntquant= rec1.syntquant)
END;
FUNCTION COPYT_dettoallodet(
  rec1:LSDOMAINT_DETrecord):LSDOMAINT_DETrecord;
VAR rec2:LSDOMAINT_DETrecord;
BEGIN
WITH rec2 DO
     BEGIN
     req:= rec1.req;
     env:= rec1.env;
     possnietnp:= rec1.possnietnp;
     definite:= rec1.definite;
     posspred:= rec1.posspred;
     possnumbers:= rec1.possnumbers;
     posscomas:= rec1.posscomas;
     mood:= rec1.mood;
     eFormation:= rec1.eFormation;
     enFormation:= rec1.enFormation;
     eORenForm:= rec1.eORenForm;
     syntquant:= rec1.syntquant
     END;
COPYT_dettoallodet:=rec2
END;
FUNCTION COPYX_dettoallodet(
  rec2:LSDOMAINT_DETrecord;
  rec1:LSDOMAINT_DETrecord):BOOLEAN;
BEGIN
COPYX_dettoallodet:=
  (rec2.req= rec1.req) AND
  (rec2.env= rec1.env) AND
  (rec2.possnietnp= rec1.possnietnp) AND
  (rec2.definite= rec1.definite) AND
  (rec2.posspred= rec1.posspred) AND
  (rec2.possnumbers= rec1.possnumbers) AND
  (rec2.posscomas= rec1.posscomas) AND
  (rec2.mood= rec1.mood) AND
  (rec2.eFormation= rec1.eFormation) AND
  (rec2.enFormation= rec1.enFormation) AND
  (rec2.eORenForm= rec1.eORenForm) AND
  (rec2.syntquant= rec1.syntquant)
END;
FUNCTION COPYT_id37(s: SET OF LSDOMAINT_adjadvformtype): SET OF LSDOMAINT_adjadvformtype;
BEGIN COPYT_id37:= s END;

FUNCTION COPYT_id38(s: SET OF LSDOMAINT_adjsubctype): SET OF LSDOMAINT_adjsubctype;
BEGIN COPYT_id38:= s END;

FUNCTION COPYT_id39(s: SET OF LSDOMAINT_adjuncttype): SET OF LSDOMAINT_adjuncttype;
BEGIN COPYT_id39:= s END;

FUNCTION COPYT_id40(s: SET OF LSDOMAINT_adjusetype): SET OF LSDOMAINT_adjusetype;
BEGIN COPYT_id40:= s END;

FUNCTION COPYT_id41(s: SET OF LSDOMAINT_advsubctype): SET OF LSDOMAINT_advsubctype;
BEGIN COPYT_id41:= s END;

FUNCTION COPYT_id42(s: SET OF LSDOMAINT_affixtype): SET OF LSDOMAINT_affixtype;
BEGIN COPYT_id42:= s END;

FUNCTION COPYT_id43(s: SET OF LSDOMAINT_aktionsarttype): SET OF LSDOMAINT_aktionsarttype;
BEGIN COPYT_id43:= s END;

FUNCTION COPYT_id44(s: SET OF LSDOMAINT_animatetype): SET OF LSDOMAINT_animatetype;
BEGIN COPYT_id44:= s END;

FUNCTION COPYT_id45(s: SET OF LSDOMAINT_antecedenttype): SET OF LSDOMAINT_antecedenttype;
BEGIN COPYT_id45:= s END;

FUNCTION COPYT_id46(s: SET OF LSDOMAINT_aspecttype): SET OF LSDOMAINT_aspecttype;
BEGIN COPYT_id46:= s END;

FUNCTION COPYT_id47(s: SET OF LSDOMAINT_casetype): SET OF LSDOMAINT_casetype;
BEGIN COPYT_id47:= s END;

FUNCTION COPYT_id48(s: SET OF LSDOMAINT_classtype): SET OF LSDOMAINT_classtype;
BEGIN COPYT_id48:= s END;

FUNCTION COPYT_id49(s: SET OF LSDOMAINT_comparativetype): SET OF LSDOMAINT_comparativetype;
BEGIN COPYT_id49:= s END;

FUNCTION COPYT_id50(s: SET OF LSDOMAINT_controllertype): SET OF LSDOMAINT_controllertype;
BEGIN COPYT_id50:= s END;

FUNCTION COPYT_id51(s: SET OF LSDOMAINT_coordkindtype): SET OF LSDOMAINT_coordkindtype;
BEGIN COPYT_id51:= s END;

FUNCTION COPYT_id52(s: SET OF LSDOMAINT_coordpatterntype): SET OF LSDOMAINT_coordpatterntype;
BEGIN COPYT_id52:= s END;

FUNCTION COPYT_id53(s: SET OF LSDOMAINT_coordtype): SET OF LSDOMAINT_coordtype;
BEGIN COPYT_id53:= s END;

FUNCTION COPYT_id54(s: SET OF LSDOMAINT_deftype): SET OF LSDOMAINT_deftype;
BEGIN COPYT_id54:= s END;

FUNCTION COPYT_id55(s: SET OF LSDOMAINT_deixistype): SET OF LSDOMAINT_deixistype;
BEGIN COPYT_id55:= s END;

FUNCTION COPYT_id56(s: SET OF LSDOMAINT_dimformtype): SET OF LSDOMAINT_dimformtype;
BEGIN COPYT_id56:= s END;

FUNCTION COPYT_id57(s: SET OF LSDOMAINT_distritype): SET OF LSDOMAINT_distritype;
BEGIN COPYT_id57:= s END;

FUNCTION COPYT_id58(s: SET OF LSDOMAINT_eformationtype): SET OF LSDOMAINT_eformationtype;
BEGIN COPYT_id58:= s END;

FUNCTION COPYT_id59(s: SET OF LSDOMAINT_enominalisedtype): SET OF LSDOMAINT_enominalisedtype;
BEGIN COPYT_id59:= s END;

FUNCTION COPYT_id60(s: SET OF LSDOMAINT_eorenformtype): SET OF LSDOMAINT_eorenformtype;
BEGIN COPYT_id60:= s END;

FUNCTION COPYT_id61(s: SET OF LSDOMAINT_finitenesstype): SET OF LSDOMAINT_finitenesstype;
BEGIN COPYT_id61:= s END;

FUNCTION COPYT_id62(s: SET OF LSDOMAINT_gelievetype): SET OF LSDOMAINT_gelievetype;
BEGIN COPYT_id62:= s END;

FUNCTION COPYT_id63(s: SET OF LSDOMAINT_gendertype): SET OF LSDOMAINT_gendertype;
BEGIN COPYT_id63:= s END;

FUNCTION COPYT_id64(s: SET OF LSDOMAINT_generictype): SET OF LSDOMAINT_generictype;
BEGIN COPYT_id64:= s END;

FUNCTION COPYT_id65(s: SET OF LSDOMAINT_humantype): SET OF LSDOMAINT_humantype;
BEGIN COPYT_id65:= s END;

FUNCTION COPYT_id66(s: SET OF LSDOMAINT_inftype): SET OF LSDOMAINT_inftype;
BEGIN COPYT_id66:= s END;

FUNCTION COPYT_id67(s: SET OF LSDOMAINT_ipptype): SET OF LSDOMAINT_ipptype;
BEGIN COPYT_id67:= s END;

FUNCTION COPYT_id68(s: SET OF LSDOMAINT_kindstype): SET OF LSDOMAINT_kindstype;
BEGIN COPYT_id68:= s END;

FUNCTION COPYT_id69(s: SET OF LSDOMAINT_modustype): SET OF LSDOMAINT_modustype;
BEGIN COPYT_id69:= s END;

FUNCTION COPYT_id70(s: SET OF LSDOMAINT_moodtype): SET OF LSDOMAINT_moodtype;
BEGIN COPYT_id70:= s END;

FUNCTION COPYT_id71(s: SET OF LSDOMAINT_nounsubctype): SET OF LSDOMAINT_nounsubctype;
BEGIN COPYT_id71:= s END;

FUNCTION COPYT_id72(s: SET OF LSDOMAINT_npheadtype): SET OF LSDOMAINT_npheadtype;
BEGIN COPYT_id72:= s END;

FUNCTION COPYT_id73(s: SET OF LSDOMAINT_numbertype): SET OF LSDOMAINT_numbertype;
BEGIN COPYT_id73:= s END;

FUNCTION COPYT_id74(s: SET OF LSDOMAINT_perfauxtype): SET OF LSDOMAINT_perfauxtype;
BEGIN COPYT_id74:= s END;

FUNCTION COPYT_id75(s: SET OF LSDOMAINT_pluralformtype): SET OF LSDOMAINT_pluralformtype;
BEGIN COPYT_id75:= s END;

FUNCTION COPYT_id76(s: SET OF LSDOMAINT_polaritytype): SET OF LSDOMAINT_polaritytype;
BEGIN COPYT_id76:= s END;

FUNCTION COPYT_id77(s: SET OF LSDOMAINT_posscomatype): SET OF LSDOMAINT_posscomatype;
BEGIN COPYT_id77:= s END;

FUNCTION COPYT_id78(s: SET OF LSDOMAINT_postformtype): SET OF LSDOMAINT_postformtype;
BEGIN COPYT_id78:= s END;

FUNCTION COPYT_id79(s: SET OF LSDOMAINT_prepsubctype): SET OF LSDOMAINT_prepsubctype;
BEGIN COPYT_id79:= s END;

FUNCTION COPYT_id80(s: SET OF LSDOMAINT_preptypetype): SET OF LSDOMAINT_preptypetype;
BEGIN COPYT_id80:= s END;

FUNCTION COPYT_id81(s: SET OF LSDOMAINT_reflexivetype): SET OF LSDOMAINT_reflexivetype;
BEGIN COPYT_id81:= s END;

FUNCTION COPYT_id82(s: SET OF LSDOMAINT_senttypetype): SET OF LSDOMAINT_senttypetype;
BEGIN COPYT_id82:= s END;

FUNCTION COPYT_id83(s: SET OF LSDOMAINT_sextype): SET OF LSDOMAINT_sextype;
BEGIN COPYT_id83:= s END;

FUNCTION COPYT_id84(s: SET OF LSDOMAINT_specqtype): SET OF LSDOMAINT_specqtype;
BEGIN COPYT_id84:= s END;

FUNCTION COPYT_id85(s: SET OF LSDOMAINT_superlativetype): SET OF LSDOMAINT_superlativetype;
BEGIN COPYT_id85:= s END;

FUNCTION COPYT_id86(s: SET OF LSDOMAINT_synpatterntype): SET OF LSDOMAINT_synpatterntype;
BEGIN COPYT_id86:= s END;

FUNCTION COPYT_id87(s: SET OF LSDOMAINT_syntquanttype): SET OF LSDOMAINT_syntquanttype;
BEGIN COPYT_id87:= s END;

FUNCTION COPYT_id88(s: SET OF LSDOMAINT_tensetype): SET OF LSDOMAINT_tensetype;
BEGIN COPYT_id88:= s END;

FUNCTION COPYT_id89(s: SET OF LSDOMAINT_thanascompltype): SET OF LSDOMAINT_thanascompltype;
BEGIN COPYT_id89:= s END;

FUNCTION COPYT_id90(s: SET OF LSDOMAINT_thetaadjtype): SET OF LSDOMAINT_thetaadjtype;
BEGIN COPYT_id90:= s END;

FUNCTION COPYT_id91(s: SET OF LSDOMAINT_thetaadvtype): SET OF LSDOMAINT_thetaadvtype;
BEGIN COPYT_id91:= s END;

FUNCTION COPYT_id92(s: SET OF LSDOMAINT_thetanptype): SET OF LSDOMAINT_thetanptype;
BEGIN COPYT_id92:= s END;

FUNCTION COPYT_id93(s: SET OF LSDOMAINT_thetapptype): SET OF LSDOMAINT_thetapptype;
BEGIN COPYT_id93:= s END;

FUNCTION COPYT_id94(s: SET OF LSDOMAINT_thetavptype): SET OF LSDOMAINT_thetavptype;
BEGIN COPYT_id94:= s END;

FUNCTION COPYT_id95(s: SET OF LSDOMAINT_timeadvclasstype): SET OF LSDOMAINT_timeadvclasstype;
BEGIN COPYT_id95:= s END;

FUNCTION COPYT_id96(s: SET OF LSDOMAINT_verbraisertype): SET OF LSDOMAINT_verbraisertype;
BEGIN COPYT_id96:= s END;

FUNCTION COPYT_id97(s: SET OF LSDOMAINT_verbsubctype): SET OF LSDOMAINT_verbsubctype;
BEGIN COPYT_id97:= s END;

FUNCTION COPYT_id98(s: SET OF LSDOMAINT_voicetype): SET OF LSDOMAINT_voicetype;
BEGIN COPYT_id98:= s END;

FUNCTION COPYT_id99(s: SET OF LSDOMAINT_vstatustype): SET OF LSDOMAINT_vstatustype;
BEGIN COPYT_id99:= s END;

FUNCTION COPYT_id100(s: SET OF LSDOMAINT_xpmoodtype): SET OF LSDOMAINT_xpmoodtype;
BEGIN COPYT_id100:= s END;

