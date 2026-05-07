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
     ingform:= rec1.ingform;
     sform:= rec1.sform;
     affix:= noaffix;
     particle:= rec1.particle;
     possvoices:= rec1.possvoices;
     reflexivity:= rec1.reflexivity;
     synvps:= rec1.synvps;
     thetavp:= rec1.thetavp;
     adjuncts:= rec1.adjuncts;
     CaseAssigner:= rec1.CaseAssigner;
     subc:= rec1.subc;
     oblcontrol:= rec1.oblcontrol;
     prepkey1:= rec1.prepkey1;
     prepkey2:= rec1.prepkey2;
     controller:= rec1.controller;
     classes:= rec1.classes;
     thatdel:= rec1.thatdel
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
  (rec2.ingform= rec1.ingform) AND
  (rec2.sform= rec1.sform) AND
  (rec2.particle= rec1.particle) AND
  (rec2.possvoices= rec1.possvoices) AND
  (rec2.reflexivity= rec1.reflexivity) AND
  (rec2.synvps= rec1.synvps) AND
  (rec2.thetavp= rec1.thetavp) AND
  (rec2.adjuncts= rec1.adjuncts) AND
  (rec2.CaseAssigner= rec1.CaseAssigner) AND
  (rec2.subc= rec1.subc) AND
  (rec2.oblcontrol= rec1.oblcontrol) AND
  (rec2.prepkey1= rec1.prepkey1) AND
  (rec2.prepkey2= rec1.prepkey2) AND
  (rec2.controller= rec1.controller) AND
  (rec2.classes= rec1.classes) AND
  (rec2.thatdel= rec1.thatdel)
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
     ingform:= rec1.ingform;
     sform:= rec1.sform;
     affix:= rec1.affix;
     modus:= omegamodus;
     tense:= omegatense;
     persons:= [];
     numbers:= [];
     particle:= rec1.particle;
     possvoices:= rec1.possvoices;
     reflexivity:= rec1.reflexivity;
     synvps:= rec1.synvps;
     thetavp:= rec1.thetavp;
     adjuncts:= rec1.adjuncts;
     CaseAssigner:= rec1.CaseAssigner;
     subc:= rec1.subc;
     oblcontrol:= rec1.oblcontrol;
     prepkey1:= rec1.prepkey1;
     prepkey2:= rec1.prepkey2;
     controller:= rec1.controller;
     classes:= rec1.classes;
     thatdel:= rec1.thatdel
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
  (rec2.ingform= rec1.ingform) AND
  (rec2.sform= rec1.sform) AND
  (rec2.affix= rec1.affix) AND
  (rec2.particle= rec1.particle) AND
  (rec2.possvoices= rec1.possvoices) AND
  (rec2.reflexivity= rec1.reflexivity) AND
  (rec2.synvps= rec1.synvps) AND
  (rec2.thetavp= rec1.thetavp) AND
  (rec2.adjuncts= rec1.adjuncts) AND
  (rec2.CaseAssigner= rec1.CaseAssigner) AND
  (rec2.subc= rec1.subc) AND
  (rec2.oblcontrol= rec1.oblcontrol) AND
  (rec2.prepkey1= rec1.prepkey1) AND
  (rec2.prepkey2= rec1.prepkey2) AND
  (rec2.controller= rec1.controller) AND
  (rec2.classes= rec1.classes) AND
  (rec2.thatdel= rec1.thatdel)
END;
FUNCTION COPYT_bnountosubnoun(
  rec1:LSDOMAINT_BNOUNrecord):LSDOMAINT_SUBNOUNrecord;
VAR rec2:LSDOMAINT_SUBNOUNrecord;
BEGIN
WITH rec2 DO
     BEGIN
     req:= rec1.req;
     env:= rec1.env;
     plurforms:= rec1.plurforms;
     genders:= rec1.genders;
     affix:= noaffix;
     class:= rec1.class;
     deixis:= rec1.deixis;
     aspect:= rec1.aspect;
     retro:= rec1.retro;
     sexes:= rec1.sexes;
     subcs:= rec1.subcs;
     temporal:= rec1.temporal;
     animate:= rec1.animate;
     human:= rec1.human;
     posscomas:= rec1.posscomas;
     thetanp:= rec1.thetanp;
     nounpatterns:= rec1.nounpatterns;
     prepkey:= rec1.prepkey;
     personal:= rec1.personal;
     poss:= rec1.poss
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
  (rec2.plurforms= rec1.plurforms) AND
  (rec2.genders= rec1.genders) AND
  (rec2.class= rec1.class) AND
  (rec2.deixis= rec1.deixis) AND
  (rec2.aspect= rec1.aspect) AND
  (rec2.retro= rec1.retro) AND
  (rec2.sexes= rec1.sexes) AND
  (rec2.subcs= rec1.subcs) AND
  (rec2.temporal= rec1.temporal) AND
  (rec2.animate= rec1.animate) AND
  (rec2.human= rec1.human) AND
  (rec2.posscomas= rec1.posscomas) AND
  (rec2.thetanp= rec1.thetanp) AND
  (rec2.nounpatterns= rec1.nounpatterns) AND
  (rec2.prepkey= rec1.prepkey) AND
  (rec2.personal= rec1.personal) AND
  (rec2.poss= rec1.poss)
END;
FUNCTION COPYT_subnountonoun(
  rec1:LSDOMAINT_SUBNOUNrecord):LSDOMAINT_NOUNrecord;
VAR rec2:LSDOMAINT_NOUNrecord;
BEGIN
WITH rec2 DO
     BEGIN
     req:= rec1.req;
     env:= rec1.env;
     plurforms:= rec1.plurforms;
     genders:= rec1.genders;
     numbers:= [singular];
     affix:= rec1.affix;
     class:= rec1.class;
     deixis:= rec1.deixis;
     aspect:= rec1.aspect;
     retro:= rec1.retro;
     sexes:= rec1.sexes;
     subcs:= rec1.subcs;
     temporal:= rec1.temporal;
     animate:= rec1.animate;
     human:= rec1.human;
     posscomas:= rec1.posscomas;
     thetanp:= rec1.thetanp;
     nounpatterns:= rec1.nounpatterns;
     prepkey:= rec1.prepkey;
     personal:= rec1.personal;
     poss:= rec1.poss
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
  (rec2.plurforms= rec1.plurforms) AND
  (rec2.genders= rec1.genders) AND
  (rec2.affix= rec1.affix) AND
  (rec2.class= rec1.class) AND
  (rec2.deixis= rec1.deixis) AND
  (rec2.aspect= rec1.aspect) AND
  (rec2.retro= rec1.retro) AND
  (rec2.sexes= rec1.sexes) AND
  (rec2.subcs= rec1.subcs) AND
  (rec2.temporal= rec1.temporal) AND
  (rec2.animate= rec1.animate) AND
  (rec2.human= rec1.human) AND
  (rec2.posscomas= rec1.posscomas) AND
  (rec2.thetanp= rec1.thetanp) AND
  (rec2.nounpatterns= rec1.nounpatterns) AND
  (rec2.prepkey= rec1.prepkey) AND
  (rec2.personal= rec1.personal) AND
  (rec2.poss= rec1.poss)
END;
FUNCTION COPYT_badjtosubadj(
  rec1:LSDOMAINT_BADJrecord):LSDOMAINT_SUBADJrecord;
VAR rec2:LSDOMAINT_SUBADJrecord;
BEGIN
WITH rec2 DO
     BEGIN
     compformations:= rec1.compformations;
     affix:= noaffix;
     req:= rec1.req;
     env:= rec1.env;
     class:= rec1.class;
     deixis:= rec1.deixis;
     aspect:= rec1.aspect;
     retro:= rec1.retro;
     uses:= rec1.uses;
     temporal:= rec1.temporal;
     subcs:= rec1.subcs;
     thetaadj:= rec1.thetaadj;
     adjpatterns:= rec1.adjpatterns;
     prepkey:= rec1.prepkey;
     advformation:= rec1.advformation
     END;
COPYT_badjtosubadj:=rec2
END;
FUNCTION COPYX_badjtosubadj(
  rec2:LSDOMAINT_SUBADJrecord;
  rec1:LSDOMAINT_BADJrecord):BOOLEAN;
BEGIN
COPYX_badjtosubadj:=
  (rec2.compformations= rec1.compformations) AND
  (rec2.req= rec1.req) AND
  (rec2.env= rec1.env) AND
  (rec2.class= rec1.class) AND
  (rec2.deixis= rec1.deixis) AND
  (rec2.aspect= rec1.aspect) AND
  (rec2.retro= rec1.retro) AND
  (rec2.uses= rec1.uses) AND
  (rec2.temporal= rec1.temporal) AND
  (rec2.subcs= rec1.subcs) AND
  (rec2.thetaadj= rec1.thetaadj) AND
  (rec2.adjpatterns= rec1.adjpatterns) AND
  (rec2.prepkey= rec1.prepkey) AND
  (rec2.advformation= rec1.advformation)
END;
FUNCTION COPYT_subadjtoadj(
  rec1:LSDOMAINT_SUBADJrecord):LSDOMAINT_ADJrecord;
VAR rec2:LSDOMAINT_ADJrecord;
BEGIN
WITH rec2 DO
     BEGIN
     compformations:= rec1.compformations;
     affix:= rec1.affix;
     compform:= basic;
     req:= rec1.req;
     env:= rec1.env;
     class:= rec1.class;
     deixis:= rec1.deixis;
     aspect:= rec1.aspect;
     retro:= rec1.retro;
     uses:= rec1.uses;
     temporal:= rec1.temporal;
     subcs:= rec1.subcs;
     thetaadj:= rec1.thetaadj;
     adjpatterns:= rec1.adjpatterns;
     prepkey:= rec1.prepkey;
     advformation:= rec1.advformation
     END;
COPYT_subadjtoadj:=rec2
END;
FUNCTION COPYX_subadjtoadj(
  rec2:LSDOMAINT_ADJrecord;
  rec1:LSDOMAINT_SUBADJrecord):BOOLEAN;
BEGIN
COPYX_subadjtoadj:=
  (rec2.compformations= rec1.compformations) AND
  (rec2.affix= rec1.affix) AND
  (rec2.req= rec1.req) AND
  (rec2.env= rec1.env) AND
  (rec2.class= rec1.class) AND
  (rec2.deixis= rec1.deixis) AND
  (rec2.aspect= rec1.aspect) AND
  (rec2.retro= rec1.retro) AND
  (rec2.uses= rec1.uses) AND
  (rec2.temporal= rec1.temporal) AND
  (rec2.subcs= rec1.subcs) AND
  (rec2.thetaadj= rec1.thetaadj) AND
  (rec2.adjpatterns= rec1.adjpatterns) AND
  (rec2.prepkey= rec1.prepkey) AND
  (rec2.advformation= rec1.advformation)
END;
FUNCTION COPYT_badvtosubadv(
  rec1:LSDOMAINT_BADVrecord):LSDOMAINT_SUBADVrecord;
VAR rec2:LSDOMAINT_SUBADVrecord;
BEGIN
WITH rec2 DO
     BEGIN
     compformations:= rec1.compformations;
     affix:= noaffix;
     req:= rec1.req;
     env:= rec1.env;
     subcs:= rec1.subcs;
     class:= rec1.class;
     deixis:= rec1.deixis;
     aspect:= rec1.aspect;
     retro:= rec1.retro;
     mood:= rec1.mood;
     thetaadv:= rec1.thetaadv;
     advpatterns:= rec1.advpatterns;
     prepkey:= rec1.prepkey;
     position:= rec1.position;
     possnietnp:= rec1.possnietnp;
     thanas:= rec1.thanas;
     temporal:= rec1.temporal
     END;
COPYT_badvtosubadv:=rec2
END;
FUNCTION COPYX_badvtosubadv(
  rec2:LSDOMAINT_SUBADVrecord;
  rec1:LSDOMAINT_BADVrecord):BOOLEAN;
BEGIN
COPYX_badvtosubadv:=
  (rec2.compformations= rec1.compformations) AND
  (rec2.req= rec1.req) AND
  (rec2.env= rec1.env) AND
  (rec2.subcs= rec1.subcs) AND
  (rec2.class= rec1.class) AND
  (rec2.deixis= rec1.deixis) AND
  (rec2.aspect= rec1.aspect) AND
  (rec2.retro= rec1.retro) AND
  (rec2.mood= rec1.mood) AND
  (rec2.thetaadv= rec1.thetaadv) AND
  (rec2.advpatterns= rec1.advpatterns) AND
  (rec2.prepkey= rec1.prepkey) AND
  (rec2.position= rec1.position) AND
  (rec2.possnietnp= rec1.possnietnp) AND
  (rec2.thanas= rec1.thanas) AND
  (rec2.temporal= rec1.temporal)
END;
FUNCTION COPYT_subadvtoadv(
  rec1:LSDOMAINT_SUBADVrecord):LSDOMAINT_ADVrecord;
VAR rec2:LSDOMAINT_ADVrecord;
BEGIN
WITH rec2 DO
     BEGIN
     compformations:= rec1.compformations;
     affix:= rec1.affix;
     compform:= basic;
     req:= rec1.req;
     env:= rec1.env;
     subcs:= rec1.subcs;
     class:= rec1.class;
     deixis:= rec1.deixis;
     aspect:= rec1.aspect;
     retro:= rec1.retro;
     mood:= rec1.mood;
     thetaadv:= rec1.thetaadv;
     advpatterns:= rec1.advpatterns;
     prepkey:= rec1.prepkey;
     position:= rec1.position;
     possnietnp:= rec1.possnietnp;
     thanas:= rec1.thanas;
     temporal:= rec1.temporal
     END;
COPYT_subadvtoadv:=rec2
END;
FUNCTION COPYX_subadvtoadv(
  rec2:LSDOMAINT_ADVrecord;
  rec1:LSDOMAINT_SUBADVrecord):BOOLEAN;
BEGIN
COPYX_subadvtoadv:=
  (rec2.compformations= rec1.compformations) AND
  (rec2.affix= rec1.affix) AND
  (rec2.req= rec1.req) AND
  (rec2.env= rec1.env) AND
  (rec2.subcs= rec1.subcs) AND
  (rec2.class= rec1.class) AND
  (rec2.deixis= rec1.deixis) AND
  (rec2.aspect= rec1.aspect) AND
  (rec2.retro= rec1.retro) AND
  (rec2.mood= rec1.mood) AND
  (rec2.thetaadv= rec1.thetaadv) AND
  (rec2.advpatterns= rec1.advpatterns) AND
  (rec2.prepkey= rec1.prepkey) AND
  (rec2.position= rec1.position) AND
  (rec2.possnietnp= rec1.possnietnp) AND
  (rec2.thanas= rec1.thanas) AND
  (rec2.temporal= rec1.temporal)
END;
FUNCTION COPYT_bpersprotoperspro(
  rec1:LSDOMAINT_BPERSPROrecord):LSDOMAINT_PERSPROrecord;
VAR rec2:LSDOMAINT_PERSPROrecord;
BEGIN
WITH rec2 DO
     BEGIN
     person:= rec1.person;
     number:= rec1.number;
     gender:= rec1.gender;
     animate:= rec1.animate;
     predpos:= rec1.predpos;
     NPhead:= rec1.NPhead;
     persprocase:= omegacase
     END;
COPYT_bpersprotoperspro:=rec2
END;
FUNCTION COPYX_bpersprotoperspro(
  rec2:LSDOMAINT_PERSPROrecord;
  rec1:LSDOMAINT_BPERSPROrecord):BOOLEAN;
BEGIN
COPYX_bpersprotoperspro:=
  (rec2.person= rec1.person) AND
  (rec2.number= rec1.number) AND
  (rec2.gender= rec1.gender) AND
  (rec2.animate= rec1.animate) AND
  (rec2.predpos= rec1.predpos) AND
  (rec2.NPhead= rec1.NPhead)
END;
FUNCTION COPYT_bproperntopropern(
  rec1:LSDOMAINT_BPROPERNOUNrecord):LSDOMAINT_PROPERNOUNrecord;
VAR rec2:LSDOMAINT_PROPERNOUNrecord;
BEGIN
WITH rec2 DO
     BEGIN
     plurforms:= rec1.plurforms;
     numbers:= [singular];
     sexes:= rec1.sexes;
     subc:= rec1.subc;
     animate:= rec1.animate;
     human:= rec1.human;
     genders:= rec1.genders;
     poss:= rec1.poss;
     temporal:= rec1.temporal;
     class:= rec1.class;
     deixis:= rec1.deixis;
     aspect:= rec1.aspect;
     retro:= rec1.retro
     END;
COPYT_bproperntopropern:=rec2
END;
FUNCTION COPYX_bproperntopropern(
  rec2:LSDOMAINT_PROPERNOUNrecord;
  rec1:LSDOMAINT_BPROPERNOUNrecord):BOOLEAN;
BEGIN
COPYX_bproperntopropern:=
  (rec2.plurforms= rec1.plurforms) AND
  (rec2.sexes= rec1.sexes) AND
  (rec2.subc= rec1.subc) AND
  (rec2.animate= rec1.animate) AND
  (rec2.human= rec1.human) AND
  (rec2.genders= rec1.genders) AND
  (rec2.poss= rec1.poss) AND
  (rec2.temporal= rec1.temporal) AND
  (rec2.class= rec1.class) AND
  (rec2.deixis= rec1.deixis) AND
  (rec2.aspect= rec1.aspect) AND
  (rec2.retro= rec1.retro)
END;
FUNCTION COPYT_bproperntosubnoun(
  rec1:LSDOMAINT_BPROPERNOUNrecord):LSDOMAINT_SUBNOUNrecord;
VAR rec2:LSDOMAINT_SUBNOUNrecord;
BEGIN
WITH rec2 DO
     BEGIN
     req:= [pospol,negpol,omegapol];
     env:= [pospol,negpol,omegapol];
     plurforms:= rec1.plurforms;
     genders:= rec1.genders;
     affix:= noaffix;
     class:= rec1.class;
     deixis:= rec1.deixis;
     aspect:= rec1.aspect;
     retro:= rec1.retro;
     sexes:= rec1.sexes;
     subcs:= [othernoun];
     temporal:= rec1.temporal;
     animate:= rec1.animate;
     human:= rec1.human;
     posscomas:= [count];
     thetanp:= omegathetanp;
     nounpatterns:= [];
     prepkey:= 0;
     personal:= true;
     poss:= rec1.poss
     END;
COPYT_bproperntosubnoun:=rec2
END;
FUNCTION COPYX_bproperntosubnoun(
  rec2:LSDOMAINT_SUBNOUNrecord;
  rec1:LSDOMAINT_BPROPERNOUNrecord):BOOLEAN;
BEGIN
COPYX_bproperntosubnoun:=
  (rec2.plurforms= rec1.plurforms) AND
  (rec2.genders= rec1.genders) AND
  (rec2.class= rec1.class) AND
  (rec2.deixis= rec1.deixis) AND
  (rec2.aspect= rec1.aspect) AND
  (rec2.retro= rec1.retro) AND
  (rec2.sexes= rec1.sexes) AND
  (rec2.temporal= rec1.temporal) AND
  (rec2.animate= rec1.animate) AND
  (rec2.human= rec1.human) AND
  (rec2.poss= rec1.poss)
END;
FUNCTION COPYT_bwhprotowhpro(
  rec1:LSDOMAINT_BWHPROrecord):LSDOMAINT_WHPROrecord;
VAR rec2:LSDOMAINT_WHPROrecord;
BEGIN
WITH rec2 DO
     BEGIN
     animate:= rec1.animate;
     poss:= rec1.poss;
     whcase:= rec1.whcase;
     number:= rec1.number;
     sexes:= rec1.sexes;
     cases:= [];
     key:=rec1.key
     END;
COPYT_bwhprotowhpro:=rec2
END;
FUNCTION COPYX_bwhprotowhpro(
  rec2:LSDOMAINT_WHPROrecord;
  rec1:LSDOMAINT_BWHPROrecord):BOOLEAN;
BEGIN
COPYX_bwhprotowhpro:=
  (rec2.animate= rec1.animate) AND
  (rec2.poss= rec1.poss) AND
  (rec2.whcase= rec1.whcase) AND
  (rec2.number= rec1.number) AND
  (rec2.sexes= rec1.sexes) AND
  (rec2.key=rec1.key)
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
     thetaadv:= rec1.thetaadv;
     advpatternefs:= rec1.advpatternefs;
     PROsubject:= rec1.PROsubject;
     mood:= rec1.mood;
     thanascompl:= rec1.thanascompl;
     temporal:= rec1.temporal
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
  (rec2.thetaadv= rec1.thetaadv) AND
  (rec2.advpatternefs= rec1.advpatternefs) AND
  (rec2.PROsubject= rec1.PROsubject) AND
  (rec2.mood= rec1.mood) AND
  (rec2.thanascompl= rec1.thanascompl) AND
  (rec2.temporal= rec1.temporal)
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
     specQ:= rec1.specQ
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
  (rec2.specQ= rec1.specQ)
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
     aktionsarts:= rec1.aktionsarts;
     adjuncts:= rec1.adjuncts
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
  (rec2.aktionsarts= rec1.aktionsarts) AND
  (rec2.adjuncts= rec1.adjuncts)
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
     animate:= rec1.animate;
     human:= rec1.human;
     actcomas:= rec1.actcomas;
     thetanp:= rec1.thetanp;
     nounpatternefs:= rec1.nounpatternefs;
     mood:= rec1.mood;
     generic:= rec1.generic;
     posspred:= rec1.posspred;
     possnietnp:= rec1.possnietnp;
     syntquant:= rec1.syntquant;
     NPhead:= rec1.NPhead;
     specQ:= rec1.specQ;
     poss:= rec1.poss;
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
  (rec2.animate= rec1.animate) AND
  (rec2.human= rec1.human) AND
  (rec2.actcomas= rec1.actcomas) AND
  (rec2.thetanp= rec1.thetanp) AND
  (rec2.nounpatternefs= rec1.nounpatternefs) AND
  (rec2.mood= rec1.mood) AND
  (rec2.generic= rec1.generic) AND
  (rec2.posspred= rec1.posspred) AND
  (rec2.possnietnp= rec1.possnietnp) AND
  (rec2.syntquant= rec1.syntquant) AND
  (rec2.NPhead= rec1.NPhead) AND
  (rec2.specQ= rec1.specQ) AND
  (rec2.poss= rec1.poss) AND
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
     animate:= rec1.animate;
     human:= rec1.human;
     posscomas:= rec1.posscomas;
     thetanp:= rec1.thetanp;
     nounpatternefs:= rec1.nounpatternefs;
     poss:= rec1.poss
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
  (rec2.animate= rec1.animate) AND
  (rec2.human= rec1.human) AND
  (rec2.posscomas= rec1.posscomas) AND
  (rec2.thetanp= rec1.thetanp) AND
  (rec2.nounpatternefs= rec1.nounpatternefs) AND
  (rec2.poss= rec1.poss)
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
     modus:= rec1.modus;
     aktionsarts:= rec1.aktionsarts;
     aspect:= rec1.aspect;
     deixis:= rec1.deixis;
     retro:= rec1.retro;
     finiteness:= rec1.finiteness;
     infsort:= rec1.infsort;
     superdeixis:= rec1.superdeixis;
     adjuncts:= rec1.adjuncts
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
  (rec2.modus= rec1.modus) AND
  (rec2.aktionsarts= rec1.aktionsarts) AND
  (rec2.aspect= rec1.aspect) AND
  (rec2.deixis= rec1.deixis) AND
  (rec2.retro= rec1.retro) AND
  (rec2.finiteness= rec1.finiteness) AND
  (rec2.infsort= rec1.infsort) AND
  (rec2.superdeixis= rec1.superdeixis) AND
  (rec2.adjuncts= rec1.adjuncts)
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
     mood:= rec1.mood;
     thetaadv:= rec1.thetaadv;
     superdeixis:= rec1.superdeixis;
     actsubcefs:= rec1.actsubcefs;
     advpatternefs:= rec1.advpatternefs;
     position:= rec1.position;
     possnietnp:= rec1.possnietnp;
     thanas:= rec1.thanas;
     thanascompl:= rec1.thanascompl;
     temporal:= rec1.temporal;
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
  (rec2.mood= rec1.mood) AND
  (rec2.thetaadv= rec1.thetaadv) AND
  (rec2.superdeixis= rec1.superdeixis) AND
  (rec2.actsubcefs= rec1.actsubcefs) AND
  (rec2.advpatternefs= rec1.advpatternefs) AND
  (rec2.position= rec1.position) AND
  (rec2.possnietnp= rec1.possnietnp) AND
  (rec2.thanas= rec1.thanas) AND
  (rec2.thanascompl= rec1.thanascompl) AND
  (rec2.temporal= rec1.temporal) AND
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
     specQ:= rec1.specQ;
     stranded:= rec1.stranded;
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
  (rec2.specQ= rec1.specQ) AND
  (rec2.stranded= rec1.stranded) AND
  (rec2.coord= rec1.coord)
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
     modus:= omegamodus;
     aktionsarts:= rec1.aktionsarts;
     aspect:= omegaAspect;
     deixis:= omegadeixis;
     retro:= false;
     finiteness:= omegafin;
     infsort:= omegainf;
     superdeixis:= rec1.superdeixis;
     adjuncts:= rec1.adjuncts
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
  (rec2.aktionsarts= rec1.aktionsarts) AND
  (rec2.superdeixis= rec1.superdeixis) AND
  (rec2.adjuncts= rec1.adjuncts)
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
     aktionsarts:= rec1.aktionsarts;
     adjuncts:= rec1.adjuncts
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
  (rec2.aktionsarts= rec1.aktionsarts) AND
  (rec2.adjuncts= rec1.adjuncts)
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
     modus:= omegamodus;
     aktionsarts:= rec1.aktionsarts;
     aspect:= rec1.aspect;
     deixis:= rec1.deixis;
     retro:= rec1.retro;
     finiteness:= omegafin;
     infsort:= omegainf;
     superdeixis:= rec1.superdeixis;
     adjuncts:= []
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
     mood:= nowh
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
     modus:= omegamodus;
     aktionsarts:= rec1.aktionsarts;
     aspect:= omegaAspect;
     deixis:= omegadeixis;
     retro:= false;
     finiteness:= omegafin;
     infsort:= omegainf;
     superdeixis:= rec1.superdeixis;
     adjuncts:= []
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
     thetaadv:= rec1.thetaadv;
     advpatternefs:= rec1.advpatternefs;
     PROsubject:= false;
     mood:= rec1.mood;
     thanascompl:= rec1.thanascompl;
     temporal:= rec1.temporal
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
  (rec2.thetaadv= rec1.thetaadv) AND
  (rec2.advpatternefs= rec1.advpatternefs) AND
  (rec2.mood= rec1.mood) AND
  (rec2.thanascompl= rec1.thanascompl) AND
  (rec2.temporal= rec1.temporal)
END;
FUNCTION COPYT_adjTOadjp(
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
     temporal:= rec1.temporal;
     actsubcefs:= [otheradj];
     thetaadj:= rec1.thetaadj;
     adjpatternefs:= [];
     mood:= nowh;
     coord:= nocoord
     END;
COPYT_adjTOadjp:=rec2
END;
FUNCTION COPYX_adjTOadjp(
  rec2:LSDOMAINT_ADJPrecord;
  rec1:LSDOMAINT_ADJrecord):BOOLEAN;
BEGIN
COPYX_adjTOadjp:=
  (rec2.req= rec1.req) AND
  (rec2.env= rec1.env) AND
  (rec2.class= rec1.class) AND
  (rec2.deixis= rec1.deixis) AND
  (rec2.aspect= rec1.aspect) AND
  (rec2.retro= rec1.retro) AND
  (rec2.temporal= rec1.temporal) AND
  (rec2.thetaadj= rec1.thetaadj)
END;
FUNCTION COPYT_advTOadvp(
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
     mood:= rec1.mood;
     thetaadv:= rec1.thetaadv;
     superdeixis:= omegadeixis;
     actsubcefs:= [VPAdv];
     advpatternefs:= [];
     position:= rec1.position;
     possnietnp:= rec1.possnietnp;
     thanas:= rec1.thanas;
     thanascompl:= false;
     temporal:= rec1.temporal;
     coord:= nocoord
     END;
COPYT_advTOadvp:=rec2
END;
FUNCTION COPYX_advTOadvp(
  rec2:LSDOMAINT_ADVPrecord;
  rec1:LSDOMAINT_ADVrecord):BOOLEAN;
BEGIN
COPYX_advTOadvp:=
  (rec2.req= rec1.req) AND
  (rec2.env= rec1.env) AND
  (rec2.class= rec1.class) AND
  (rec2.deixis= rec1.deixis) AND
  (rec2.aspect= rec1.aspect) AND
  (rec2.retro= rec1.retro) AND
  (rec2.mood= rec1.mood) AND
  (rec2.thetaadv= rec1.thetaadv) AND
  (rec2.position= rec1.position) AND
  (rec2.possnietnp= rec1.possnietnp) AND
  (rec2.thanas= rec1.thanas) AND
  (rec2.temporal= rec1.temporal)
END;
FUNCTION COPYT_adjpTOadjpprop(
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
COPYT_adjpTOadjpprop:=rec2
END;
FUNCTION COPYX_adjpTOadjpprop(
  rec2:LSDOMAINT_ADJPPROPrecord;
  rec1:LSDOMAINT_ADJPrecord):BOOLEAN;
BEGIN
COPYX_adjpTOadjpprop:=
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
FUNCTION COPYT_nounTOcn(
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
     numbers:= rec1.numbers;
     cases:= [];
     genders:= rec1.genders;
     sexes:= rec1.sexes;
     actsubcs:= [othernoun];
     temporal:= rec1.temporal;
     animate:= rec1.animate;
     human:= rec1.human;
     posscomas:= rec1.posscomas;
     thetanp:= rec1.thetanp;
     nounpatternefs:= [];
     poss:= rec1.poss
     END;
COPYT_nounTOcn:=rec2
END;
FUNCTION COPYX_nounTOcn(
  rec2:LSDOMAINT_CNrecord;
  rec1:LSDOMAINT_NOUNrecord):BOOLEAN;
BEGIN
COPYX_nounTOcn:=
  (rec2.req= rec1.req) AND
  (rec2.env= rec1.env) AND
  (rec2.class= rec1.class) AND
  (rec2.deixis= rec1.deixis) AND
  (rec2.aspect= rec1.aspect) AND
  (rec2.retro= rec1.retro) AND
  (rec2.numbers= rec1.numbers) AND
  (rec2.genders= rec1.genders) AND
  (rec2.sexes= rec1.sexes) AND
  (rec2.temporal= rec1.temporal) AND
  (rec2.animate= rec1.animate) AND
  (rec2.human= rec1.human) AND
  (rec2.posscomas= rec1.posscomas) AND
  (rec2.thetanp= rec1.thetanp) AND
  (rec2.poss= rec1.poss)
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
     animate:= rec1.animate;
     human:= rec1.human;
     actcomas:= [count];
     thetanp:= rec1.thetanp;
     nounpatternefs:= rec1.nounpatternefs;
     mood:= nowh;
     generic:= omegageneric;
     posspred:= false;
     possnietnp:= false;
     syntquant:= omegaquant;
     NPhead:= otherNP;
     specQ:= omegaspec;
     poss:= rec1.poss;
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
  (rec2.animate= rec1.animate) AND
  (rec2.human= rec1.human) AND
  (rec2.thetanp= rec1.thetanp) AND
  (rec2.nounpatternefs= rec1.nounpatternefs) AND
  (rec2.poss= rec1.poss)
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
     conjkey:= 0;
     adverbial:= false;
     temporal:= false;
     conjclass:= omegatimeadvclass;
     conjdeixis:= omegadeixis;
     conjaspect:= omegaaspect;
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
  (rec2.superdeixis= rec1.superdeixis)
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
     modus:= rec1.modus;
     aktionsarts:= rec1.aktionsarts;
     aspect:= rec1.aspect;
     deixis:= rec1.deixis;
     retro:= rec1.retro;
     finiteness:= rec1.finiteness;
     infsort:= rec1.infsort;
     superdeixis:= rec1.superdeixis;
     adjuncts:= rec1.adjuncts
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
  (rec2.modus= rec1.modus) AND
  (rec2.aktionsarts= rec1.aktionsarts) AND
  (rec2.aspect= rec1.aspect) AND
  (rec2.deixis= rec1.deixis) AND
  (rec2.retro= rec1.retro) AND
  (rec2.finiteness= rec1.finiteness) AND
  (rec2.infsort= rec1.infsort) AND
  (rec2.superdeixis= rec1.superdeixis) AND
  (rec2.adjuncts= rec1.adjuncts)
END;
FUNCTION COPYT_sentenceTOverbp(
  rec1:LSDOMAINT_SENTENCErecord):LSDOMAINT_VERBPrecord;
VAR rec2:LSDOMAINT_VERBPrecord;
BEGIN
WITH rec2 DO
     BEGIN
     req:= rec1.req;
     env:= rec1.env;
     synvps:= [];
     thetavp:= rec1.thetavp;
     modus:= rec1.modus;
     persons:= [];
     numbers:= [];
     aspect:= rec1.aspect;
     deixis:= rec1.deixis;
     retro:= rec1.retro;
     finiteness:= rec1.finiteness;
     voice:= rec1.voice;
     synvpefs:= rec1.synvpefs;
     adjvpefs:= [];
     classes:= [];
     headfound:= false;
     Scomplfound:= false;
     foundauxes:= [];
     adjuncts:= rec1.adjuncts;
     reflexivity:= notreflexive;
     infsort:= rec1.infsort;
     objfound:= false;
     indobjfound:= false;
     locargfound:= false;
     dirargfound:= false;
     prepobjfound:= false;
     prepobj2found:= false;
     nppredfound:= false;
     adjppredfound:= false;
     prepppredfound:= false;
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
  (rec2.thetavp= rec1.thetavp) AND
  (rec2.modus= rec1.modus) AND
  (rec2.aspect= rec1.aspect) AND
  (rec2.deixis= rec1.deixis) AND
  (rec2.retro= rec1.retro) AND
  (rec2.finiteness= rec1.finiteness) AND
  (rec2.voice= rec1.voice) AND
  (rec2.synvpefs= rec1.synvpefs) AND
  (rec2.adjuncts= rec1.adjuncts) AND
  (rec2.infsort= rec1.infsort)
END;
FUNCTION COPYT_bdetTOdet(
  rec1:LSDOMAINT_BDETrecord):LSDOMAINT_DETrecord;
VAR rec2:LSDOMAINT_DETrecord;
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
     possnietnp:= rec1.possnietnp;
     syntquant:= rec1.syntquant
     END;
COPYT_bdetTOdet:=rec2
END;
FUNCTION COPYX_bdetTOdet(
  rec2:LSDOMAINT_DETrecord;
  rec1:LSDOMAINT_BDETrecord):BOOLEAN;
BEGIN
COPYX_bdetTOdet:=
  (rec2.req= rec1.req) AND
  (rec2.env= rec1.env) AND
  (rec2.definite= rec1.definite) AND
  (rec2.posspred= rec1.posspred) AND
  (rec2.possnumbers= rec1.possnumbers) AND
  (rec2.posscomas= rec1.posscomas) AND
  (rec2.mood= rec1.mood) AND
  (rec2.possnietnp= rec1.possnietnp) AND
  (rec2.syntquant= rec1.syntquant)
END;
FUNCTION COPYT_detTOdetp(
  rec1:LSDOMAINT_DETrecord):LSDOMAINT_DETPrecord;
VAR rec2:LSDOMAINT_DETPrecord;
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
     possnietnp:= rec1.possnietnp;
     syntquant:= rec1.syntquant;
     superdeixis:= omegadeixis
     END;
COPYT_detTOdetp:=rec2
END;
FUNCTION COPYX_detTOdetp(
  rec2:LSDOMAINT_DETPrecord;
  rec1:LSDOMAINT_DETrecord):BOOLEAN;
BEGIN
COPYX_detTOdetp:=
  (rec2.req= rec1.req) AND
  (rec2.env= rec1.env) AND
  (rec2.definite= rec1.definite) AND
  (rec2.posspred= rec1.posspred) AND
  (rec2.possnumbers= rec1.possnumbers) AND
  (rec2.posscomas= rec1.posscomas) AND
  (rec2.mood= rec1.mood) AND
  (rec2.possnietnp= rec1.possnietnp) AND
  (rec2.syntquant= rec1.syntquant)
END;
FUNCTION COPYT_artTOdetp(
  rec1:LSDOMAINT_ARTrecord):LSDOMAINT_DETPrecord;
VAR rec2:LSDOMAINT_DETPrecord;
BEGIN
WITH rec2 DO
     BEGIN
     req:= [pospol,negpol,omegapol];
     env:= [pospol,negpol,omegapol];
     definite:= rec1.definite;
     posspred:= false;
     possnumbers:= rec1.possnumbers;
     posscomas:= rec1.posscomas;
     mood:= nowh;
     possnietnp:= false;
     syntquant:= omegaquant;
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
FUNCTION COPYT_qTOqp(
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
     hop:= rec1.hop;
     thanas:= rec1.thanas;
     thanascompl:= false;
     superdeixis:= omegadeixis
     END;
COPYT_qTOqp:=rec2
END;
FUNCTION COPYX_qTOqp(
  rec2:LSDOMAINT_QPrecord;
  rec1:LSDOMAINT_Qrecord):BOOLEAN;
BEGIN
COPYX_qTOqp:=
  (rec2.req= rec1.req) AND
  (rec2.env= rec1.env) AND
  (rec2.definite= rec1.definite) AND
  (rec2.posspred= rec1.posspred) AND
  (rec2.possnumbers= rec1.possnumbers) AND
  (rec2.posscomas= rec1.posscomas) AND
  (rec2.mood= rec1.mood) AND
  (rec2.hop= rec1.hop) AND
  (rec2.thanas= rec1.thanas)
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
     specQ:= rec1.specQ
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
  (rec2.specQ= rec1.specQ)
END;
FUNCTION COPYT_id25(s: SET OF LSDOMAINT_adjsubctype): SET OF LSDOMAINT_adjsubctype;
BEGIN COPYT_id25:= s END;

FUNCTION COPYT_id26(s: SET OF LSDOMAINT_adjuncttype): SET OF LSDOMAINT_adjuncttype;
BEGIN COPYT_id26:= s END;

FUNCTION COPYT_id27(s: SET OF LSDOMAINT_adjusetype): SET OF LSDOMAINT_adjusetype;
BEGIN COPYT_id27:= s END;

FUNCTION COPYT_id28(s: SET OF LSDOMAINT_advformationtype): SET OF LSDOMAINT_advformationtype;
BEGIN COPYT_id28:= s END;

FUNCTION COPYT_id29(s: SET OF LSDOMAINT_advsubctype): SET OF LSDOMAINT_advsubctype;
BEGIN COPYT_id29:= s END;

FUNCTION COPYT_id30(s: SET OF LSDOMAINT_affixtype): SET OF LSDOMAINT_affixtype;
BEGIN COPYT_id30:= s END;

FUNCTION COPYT_id31(s: SET OF LSDOMAINT_aktionsarttype): SET OF LSDOMAINT_aktionsarttype;
BEGIN COPYT_id31:= s END;

FUNCTION COPYT_id32(s: SET OF LSDOMAINT_animatetype): SET OF LSDOMAINT_animatetype;
BEGIN COPYT_id32:= s END;

FUNCTION COPYT_id33(s: SET OF LSDOMAINT_antecedenttype): SET OF LSDOMAINT_antecedenttype;
BEGIN COPYT_id33:= s END;

FUNCTION COPYT_id34(s: SET OF LSDOMAINT_aspecttype): SET OF LSDOMAINT_aspecttype;
BEGIN COPYT_id34:= s END;

FUNCTION COPYT_id35(s: SET OF LSDOMAINT_auxtype): SET OF LSDOMAINT_auxtype;
BEGIN COPYT_id35:= s END;

FUNCTION COPYT_id36(s: SET OF LSDOMAINT_casetype): SET OF LSDOMAINT_casetype;
BEGIN COPYT_id36:= s END;

FUNCTION COPYT_id37(s: SET OF LSDOMAINT_classtype): SET OF LSDOMAINT_classtype;
BEGIN COPYT_id37:= s END;

FUNCTION COPYT_id38(s: SET OF LSDOMAINT_compformationtype): SET OF LSDOMAINT_compformationtype;
BEGIN COPYT_id38:= s END;

FUNCTION COPYT_id39(s: SET OF LSDOMAINT_compformtype): SET OF LSDOMAINT_compformtype;
BEGIN COPYT_id39:= s END;

FUNCTION COPYT_id40(s: SET OF LSDOMAINT_complcattype): SET OF LSDOMAINT_complcattype;
BEGIN COPYT_id40:= s END;

FUNCTION COPYT_id41(s: SET OF LSDOMAINT_controllertype): SET OF LSDOMAINT_controllertype;
BEGIN COPYT_id41:= s END;

FUNCTION COPYT_id42(s: SET OF LSDOMAINT_coordkindtype): SET OF LSDOMAINT_coordkindtype;
BEGIN COPYT_id42:= s END;

FUNCTION COPYT_id43(s: SET OF LSDOMAINT_coordpatterntype): SET OF LSDOMAINT_coordpatterntype;
BEGIN COPYT_id43:= s END;

FUNCTION COPYT_id44(s: SET OF LSDOMAINT_coordtype): SET OF LSDOMAINT_coordtype;
BEGIN COPYT_id44:= s END;

FUNCTION COPYT_id45(s: SET OF LSDOMAINT_deftype): SET OF LSDOMAINT_deftype;
BEGIN COPYT_id45:= s END;

FUNCTION COPYT_id46(s: SET OF LSDOMAINT_deixistype): SET OF LSDOMAINT_deixistype;
BEGIN COPYT_id46:= s END;

FUNCTION COPYT_id47(s: SET OF LSDOMAINT_distritype): SET OF LSDOMAINT_distritype;
BEGIN COPYT_id47:= s END;

FUNCTION COPYT_id48(s: SET OF LSDOMAINT_finitenesstype): SET OF LSDOMAINT_finitenesstype;
BEGIN COPYT_id48:= s END;

FUNCTION COPYT_id49(s: SET OF LSDOMAINT_gendertype): SET OF LSDOMAINT_gendertype;
BEGIN COPYT_id49:= s END;

FUNCTION COPYT_id50(s: SET OF LSDOMAINT_generictype): SET OF LSDOMAINT_generictype;
BEGIN COPYT_id50:= s END;

FUNCTION COPYT_id51(s: SET OF LSDOMAINT_headtype): SET OF LSDOMAINT_headtype;
BEGIN COPYT_id51:= s END;

FUNCTION COPYT_id52(s: SET OF LSDOMAINT_humantype): SET OF LSDOMAINT_humantype;
BEGIN COPYT_id52:= s END;

FUNCTION COPYT_id53(s: SET OF LSDOMAINT_inftype): SET OF LSDOMAINT_inftype;
BEGIN COPYT_id53:= s END;

FUNCTION COPYT_id54(s: SET OF LSDOMAINT_ingformtype): SET OF LSDOMAINT_ingformtype;
BEGIN COPYT_id54:= s END;

FUNCTION COPYT_id55(s: SET OF LSDOMAINT_modustype): SET OF LSDOMAINT_modustype;
BEGIN COPYT_id55:= s END;

FUNCTION COPYT_id56(s: SET OF LSDOMAINT_moodtype): SET OF LSDOMAINT_moodtype;
BEGIN COPYT_id56:= s END;

FUNCTION COPYT_id57(s: SET OF LSDOMAINT_nounsubctype): SET OF LSDOMAINT_nounsubctype;
BEGIN COPYT_id57:= s END;

FUNCTION COPYT_id58(s: SET OF LSDOMAINT_npheadtype): SET OF LSDOMAINT_npheadtype;
BEGIN COPYT_id58:= s END;

FUNCTION COPYT_id59(s: SET OF LSDOMAINT_numbertype): SET OF LSDOMAINT_numbertype;
BEGIN COPYT_id59:= s END;

FUNCTION COPYT_id60(s: SET OF LSDOMAINT_oblcontroltype): SET OF LSDOMAINT_oblcontroltype;
BEGIN COPYT_id60:= s END;

FUNCTION COPYT_id61(s: SET OF LSDOMAINT_plurformtype): SET OF LSDOMAINT_plurformtype;
BEGIN COPYT_id61:= s END;

FUNCTION COPYT_id62(s: SET OF LSDOMAINT_polaritytype): SET OF LSDOMAINT_polaritytype;
BEGIN COPYT_id62:= s END;

FUNCTION COPYT_id63(s: SET OF LSDOMAINT_posscomatype): SET OF LSDOMAINT_posscomatype;
BEGIN COPYT_id63:= s END;

FUNCTION COPYT_id64(s: SET OF LSDOMAINT_prepsubctype): SET OF LSDOMAINT_prepsubctype;
BEGIN COPYT_id64:= s END;

FUNCTION COPYT_id65(s: SET OF LSDOMAINT_reflexivetype): SET OF LSDOMAINT_reflexivetype;
BEGIN COPYT_id65:= s END;

FUNCTION COPYT_id66(s: SET OF LSDOMAINT_senttypetype): SET OF LSDOMAINT_senttypetype;
BEGIN COPYT_id66:= s END;

FUNCTION COPYT_id67(s: SET OF LSDOMAINT_sextype): SET OF LSDOMAINT_sextype;
BEGIN COPYT_id67:= s END;

FUNCTION COPYT_id68(s: SET OF LSDOMAINT_sformtype): SET OF LSDOMAINT_sformtype;
BEGIN COPYT_id68:= s END;

FUNCTION COPYT_id69(s: SET OF LSDOMAINT_specqtype): SET OF LSDOMAINT_specqtype;
BEGIN COPYT_id69:= s END;

FUNCTION COPYT_id70(s: SET OF LSDOMAINT_synpatterntype): SET OF LSDOMAINT_synpatterntype;
BEGIN COPYT_id70:= s END;

FUNCTION COPYT_id71(s: SET OF LSDOMAINT_syntquanttype): SET OF LSDOMAINT_syntquanttype;
BEGIN COPYT_id71:= s END;

FUNCTION COPYT_id72(s: SET OF LSDOMAINT_tensetype): SET OF LSDOMAINT_tensetype;
BEGIN COPYT_id72:= s END;

FUNCTION COPYT_id73(s: SET OF LSDOMAINT_thanascompltype): SET OF LSDOMAINT_thanascompltype;
BEGIN COPYT_id73:= s END;

FUNCTION COPYT_id74(s: SET OF LSDOMAINT_thatdeltype): SET OF LSDOMAINT_thatdeltype;
BEGIN COPYT_id74:= s END;

FUNCTION COPYT_id75(s: SET OF LSDOMAINT_thetaadjtype): SET OF LSDOMAINT_thetaadjtype;
BEGIN COPYT_id75:= s END;

FUNCTION COPYT_id76(s: SET OF LSDOMAINT_thetaadvtype): SET OF LSDOMAINT_thetaadvtype;
BEGIN COPYT_id76:= s END;

FUNCTION COPYT_id77(s: SET OF LSDOMAINT_thetanptype): SET OF LSDOMAINT_thetanptype;
BEGIN COPYT_id77:= s END;

FUNCTION COPYT_id78(s: SET OF LSDOMAINT_thetapptype): SET OF LSDOMAINT_thetapptype;
BEGIN COPYT_id78:= s END;

FUNCTION COPYT_id79(s: SET OF LSDOMAINT_thetavptype): SET OF LSDOMAINT_thetavptype;
BEGIN COPYT_id79:= s END;

FUNCTION COPYT_id80(s: SET OF LSDOMAINT_timeadvclasstype): SET OF LSDOMAINT_timeadvclasstype;
BEGIN COPYT_id80:= s END;

FUNCTION COPYT_id81(s: SET OF LSDOMAINT_verbsubctype): SET OF LSDOMAINT_verbsubctype;
BEGIN COPYT_id81:= s END;

FUNCTION COPYT_id82(s: SET OF LSDOMAINT_voicetype): SET OF LSDOMAINT_voicetype;
BEGIN COPYT_id82:= s END;

FUNCTION COPYT_id83(s: SET OF LSDOMAINT_xpmoodtype): SET OF LSDOMAINT_xpmoodtype;
BEGIN COPYT_id83:= s END;

