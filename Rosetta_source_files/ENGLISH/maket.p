Export(MAKET);
pragma C_include('lsdomaint.pf');
pragma C_include('lsstree.pf');
pragma C_include('lidomaint.pf');
pragma C_include('listree.pf');
pragma C_include('mem.pf');
pragma C_include('maket.pf');


PROGRAM MAKET;
WITH LSDOMAINT, LSSTREE, LIDOMAINT, MEM, LISTREE;
PROCEDURE MAKET_BADJSUFFrec(
    VAR rec:LSDOMAINT_BADJrecord);
BEGIN
;
rec.compformations:=[regcomp];
rec.req:=[pospol,negpol,omegapol];
rec.env:=[pospol,negpol,omegapol];
rec.class:=omegaTimeAdvClass;
rec.deixis:=omegadeixis;
rec.aspect:=omegaAspect;
rec.retro:=false;
rec.uses:=[attributive,predicative];
rec.temporal:=false;
rec.subcs:=[otheradj];
rec.thetaadj:=omegathetaadjp;
rec.adjpatterns:=[];
rec.prepkey:=0;
rec.advformation:=regAdv;
rec.key:=0
END;
PROCEDURE MAKET_BADJrec(
    VAR rec:LSDOMAINT_BADJrecord);
BEGIN
;
rec.compformations:=[regcomp];
rec.req:=[pospol,negpol,omegapol];
rec.env:=[pospol,negpol,omegapol];
rec.class:=omegaTimeAdvClass;
rec.deixis:=omegadeixis;
rec.aspect:=omegaAspect;
rec.retro:=false;
rec.uses:=[attributive,predicative];
rec.temporal:=false;
rec.subcs:=[otheradj];
rec.thetaadj:=omegathetaadjp;
rec.adjpatterns:=[];
rec.prepkey:=0;
rec.advformation:=regAdv;
rec.key:=0
END;
PROCEDURE MAKET_SUBADJrec(
    VAR rec:LSDOMAINT_SUBADJrecord);
BEGIN
;
rec.compformations:=[regcomp];
rec.affix:=noaffix;
rec.req:=[pospol,negpol,omegapol];
rec.env:=[pospol,negpol,omegapol];
rec.class:=omegaTimeAdvClass;
rec.deixis:=omegadeixis;
rec.aspect:=omegaAspect;
rec.retro:=false;
rec.uses:=[attributive,predicative];
rec.temporal:=false;
rec.subcs:=[otheradj];
rec.thetaadj:=omegathetaadjp;
rec.adjpatterns:=[];
rec.prepkey:=0;
rec.advformation:=regAdv
END;
PROCEDURE MAKET_ADJrec(
    VAR rec:LSDOMAINT_ADJrecord);
BEGIN
;
rec.compformations:=[regcomp];
rec.affix:=noaffix;
rec.compform:=basic;
rec.req:=[pospol,negpol,omegapol];
rec.env:=[pospol,negpol,omegapol];
rec.class:=omegaTimeAdvClass;
rec.deixis:=omegadeixis;
rec.aspect:=omegaAspect;
rec.retro:=false;
rec.uses:=[attributive,predicative];
rec.temporal:=false;
rec.subcs:=[otheradj];
rec.thetaadj:=omegathetaadjp;
rec.adjpatterns:=[];
rec.prepkey:=0;
rec.advformation:=regAdv
END;
PROCEDURE MAKET_ADJPrec(
    VAR rec:LSDOMAINT_ADJPrecord);
BEGIN
;
rec.req:=[pospol,negpol,omegapol];
rec.env:=[pospol,negpol,omegapol];
rec.class:=omegaTimeAdvClass;
rec.deixis:=omegadeixis;
rec.aspect:=omegaAspect;
rec.retro:=false;
rec.actuseefs:=[];
rec.temporal:=false;
rec.actsubcefs:=[otheradj];
rec.thetaadj:=omegathetaadjp;
rec.adjpatternefs:=[];
rec.mood:=nowh;
rec.coord:=nocoord
END;
PROCEDURE MAKET_ADJPPROPrec(
    VAR rec:LSDOMAINT_ADJPPROPrecord);
BEGIN
;
rec.req:=[pospol,negpol,omegapol];
rec.env:=[pospol,negpol,omegapol];
rec.class:=omegaTimeAdvClass;
rec.deixis:=omegadeixis;
rec.aspect:=omegaAspect;
rec.retro:=false;
rec.aktionsarts:=[];
rec.superdeixis:=omegadeixis;
rec.temporal:=false;
rec.actsubcefs:=[otheradj];
rec.thetaadj:=omegathetaadjp;
rec.adjpatternefs:=[];
rec.PROsubject:=false;
rec.mood:=nowh
END;
PROCEDURE MAKET_ADJPFORMULArec(
    VAR rec:LSDOMAINT_ADJPPROPrecord);
BEGIN
;
rec.req:=[pospol,negpol,omegapol];
rec.env:=[pospol,negpol,omegapol];
rec.class:=omegaTimeAdvClass;
rec.deixis:=omegadeixis;
rec.aspect:=omegaAspect;
rec.retro:=false;
rec.aktionsarts:=[];
rec.superdeixis:=omegadeixis;
rec.temporal:=false;
rec.actsubcefs:=[otheradj];
rec.thetaadj:=omegathetaadjp;
rec.adjpatternefs:=[];
rec.PROsubject:=false;
rec.mood:=nowh
END;
PROCEDURE MAKET_OPENADJPPROPrec(
    VAR rec:LSDOMAINT_ADJPPROPrecord);
BEGIN
;
rec.req:=[pospol,negpol,omegapol];
rec.env:=[pospol,negpol,omegapol];
rec.class:=omegaTimeAdvClass;
rec.deixis:=omegadeixis;
rec.aspect:=omegaAspect;
rec.retro:=false;
rec.aktionsarts:=[];
rec.superdeixis:=omegadeixis;
rec.temporal:=false;
rec.actsubcefs:=[otheradj];
rec.thetaadj:=omegathetaadjp;
rec.adjpatternefs:=[];
rec.PROsubject:=false;
rec.mood:=nowh
END;
PROCEDURE MAKET_CLOSEDADJPPROPrec(
    VAR rec:LSDOMAINT_ADJPPROPrecord);
BEGIN
;
rec.req:=[pospol,negpol,omegapol];
rec.env:=[pospol,negpol,omegapol];
rec.class:=omegaTimeAdvClass;
rec.deixis:=omegadeixis;
rec.aspect:=omegaAspect;
rec.retro:=false;
rec.aktionsarts:=[];
rec.superdeixis:=omegadeixis;
rec.temporal:=false;
rec.actsubcefs:=[otheradj];
rec.thetaadj:=omegathetaadjp;
rec.adjpatternefs:=[];
rec.PROsubject:=false;
rec.mood:=nowh
END;
PROCEDURE MAKET_BADVSUFFrec(
    VAR rec:LSDOMAINT_BADVrecord);
BEGIN
;
rec.compformations:=[regcomp];
rec.req:=[pospol,negpol,omegapol];
rec.env:=[pospol,negpol,omegapol];
rec.subcs:=[VPAdv];
rec.class:=omegaTimeAdvClass;
rec.deixis:=omegadeixis;
rec.aspect:=omegaAspect;
rec.retro:=false;
rec.mood:=nowh;
rec.thetaadv:=omegathetaadvp;
rec.advpatterns:=[];
rec.prepkey:=0;
rec.position:=[1,2,3,4];
rec.possnietnp:=false;
rec.thanas:=omegacompl;
rec.temporal:=false;
rec.key:=0
END;
PROCEDURE MAKET_BADVrec(
    VAR rec:LSDOMAINT_BADVrecord);
BEGIN
;
rec.compformations:=[regcomp];
rec.req:=[pospol,negpol,omegapol];
rec.env:=[pospol,negpol,omegapol];
rec.subcs:=[VPAdv];
rec.class:=omegaTimeAdvClass;
rec.deixis:=omegadeixis;
rec.aspect:=omegaAspect;
rec.retro:=false;
rec.mood:=nowh;
rec.thetaadv:=omegathetaadvp;
rec.advpatterns:=[];
rec.prepkey:=0;
rec.position:=[1,2,3,4];
rec.possnietnp:=false;
rec.thanas:=omegacompl;
rec.temporal:=false;
rec.key:=0
END;
PROCEDURE MAKET_SUBADVrec(
    VAR rec:LSDOMAINT_SUBADVrecord);
BEGIN
;
rec.compformations:=[regcomp];
rec.affix:=noaffix;
rec.req:=[pospol,negpol,omegapol];
rec.env:=[pospol,negpol,omegapol];
rec.subcs:=[VPAdv];
rec.class:=omegaTimeAdvClass;
rec.deixis:=omegadeixis;
rec.aspect:=omegaAspect;
rec.retro:=false;
rec.mood:=nowh;
rec.thetaadv:=omegathetaadvp;
rec.advpatterns:=[];
rec.prepkey:=0;
rec.position:=[1,2,3,4];
rec.possnietnp:=false;
rec.thanas:=omegacompl;
rec.temporal:=false
END;
PROCEDURE MAKET_ADVrec(
    VAR rec:LSDOMAINT_ADVrecord);
BEGIN
;
rec.compformations:=[regcomp];
rec.affix:=noaffix;
rec.compform:=basic;
rec.req:=[pospol,negpol,omegapol];
rec.env:=[pospol,negpol,omegapol];
rec.subcs:=[VPAdv];
rec.class:=omegaTimeAdvClass;
rec.deixis:=omegadeixis;
rec.aspect:=omegaAspect;
rec.retro:=false;
rec.mood:=nowh;
rec.thetaadv:=omegathetaadvp;
rec.advpatterns:=[];
rec.prepkey:=0;
rec.position:=[1,2,3,4];
rec.possnietnp:=false;
rec.thanas:=omegacompl;
rec.temporal:=false
END;
PROCEDURE MAKET_ADVPrec(
    VAR rec:LSDOMAINT_ADVPrecord);
BEGIN
;
rec.req:=[pospol,negpol,omegapol];
rec.env:=[pospol,negpol,omegapol];
rec.class:=omegaTimeAdvClass;
rec.deixis:=omegadeixis;
rec.aspect:=omegaAspect;
rec.retro:=false;
rec.mood:=nowh;
rec.thetaadv:=omegathetaadvp;
rec.superdeixis:=omegadeixis;
rec.actsubcefs:=[VPAdv];
rec.advpatternefs:=[];
rec.position:=[1,2,3,4];
rec.possnietnp:=false;
rec.thanas:=omegacompl;
rec.thanascompl:=false;
rec.temporal:=false;
rec.coord:=nocoord
END;
PROCEDURE MAKET_ADVPPROPrec(
    VAR rec:LSDOMAINT_ADVPPROPrecord);
BEGIN
;
rec.req:=[pospol,negpol,omegapol];
rec.env:=[pospol,negpol,omegapol];
rec.class:=omegaTimeAdvClass;
rec.deixis:=omegadeixis;
rec.aspect:=omegaAspect;
rec.retro:=false;
rec.aktionsarts:=[];
rec.superdeixis:=omegadeixis;
rec.actsubcefs:=[VPAdv];
rec.thetaadv:=omegathetaadvp;
rec.advpatternefs:=[];
rec.PROsubject:=false;
rec.mood:=nowh;
rec.thanascompl:=false;
rec.temporal:=false
END;
PROCEDURE MAKET_ADVPFORMULArec(
    VAR rec:LSDOMAINT_ADVPPROPrecord);
BEGIN
;
rec.req:=[pospol,negpol,omegapol];
rec.env:=[pospol,negpol,omegapol];
rec.class:=omegaTimeAdvClass;
rec.deixis:=omegadeixis;
rec.aspect:=omegaAspect;
rec.retro:=false;
rec.aktionsarts:=[];
rec.superdeixis:=omegadeixis;
rec.actsubcefs:=[VPAdv];
rec.thetaadv:=omegathetaadvp;
rec.advpatternefs:=[];
rec.PROsubject:=false;
rec.mood:=nowh;
rec.thanascompl:=false;
rec.temporal:=false
END;
PROCEDURE MAKET_OPENADVPPROPrec(
    VAR rec:LSDOMAINT_ADVPPROPrecord);
BEGIN
;
rec.req:=[pospol,negpol,omegapol];
rec.env:=[pospol,negpol,omegapol];
rec.class:=omegaTimeAdvClass;
rec.deixis:=omegadeixis;
rec.aspect:=omegaAspect;
rec.retro:=false;
rec.aktionsarts:=[];
rec.superdeixis:=omegadeixis;
rec.actsubcefs:=[VPAdv];
rec.thetaadv:=omegathetaadvp;
rec.advpatternefs:=[];
rec.PROsubject:=false;
rec.mood:=nowh;
rec.thanascompl:=false;
rec.temporal:=false
END;
PROCEDURE MAKET_CLOSEDADVPPROPrec(
    VAR rec:LSDOMAINT_ADVPPROPrecord);
BEGIN
;
rec.req:=[pospol,negpol,omegapol];
rec.env:=[pospol,negpol,omegapol];
rec.class:=omegaTimeAdvClass;
rec.deixis:=omegadeixis;
rec.aspect:=omegaAspect;
rec.retro:=false;
rec.aktionsarts:=[];
rec.superdeixis:=omegadeixis;
rec.actsubcefs:=[VPAdv];
rec.thetaadv:=omegathetaadvp;
rec.advpatternefs:=[];
rec.PROsubject:=false;
rec.mood:=nowh;
rec.thanascompl:=false;
rec.temporal:=false
END;
PROCEDURE MAKET_ARTrec(
    VAR rec:LSDOMAINT_ARTrecord);
BEGIN
;
rec.definite:=omegadef;
rec.possnumbers:=[singular];
rec.posscomas:=[count];
rec.key:=0
END;
PROCEDURE MAKET_ASPrec(
    VAR rec:LSDOMAINT_ASPrecord);
BEGIN
;
rec.req:=[pospol,negpol,omegapol];
rec.env:=[pospol,negpol,omegapol];
rec.thanas:=ascompl
END;
PROCEDURE MAKET_BBIGPROrec(
    VAR rec:LSDOMAINT_BPERSPROrecord);
BEGIN
;
rec.person:=3;
rec.number:=singular;
rec.gender:=omegagender;
rec.animate:=omegaanimate;
rec.predpos:=true;
rec.NPhead:=persproNP;
rec.key:=0
END;
PROCEDURE MAKET_BIGPROrec(
    VAR rec:LSDOMAINT_BIGPROrecord);
BEGIN
;
rec.person:=3;
rec.number:=singular;
rec.gender:=omegagender;
rec.animate:=omegaanimate;
rec.predpos:=true;
rec.NPhead:=persproNP;
rec.antecedent:=0
END;
PROCEDURE MAKET_BIRRPREFrec(
    VAR rec:LSDOMAINT_BIRRPREFrecord);
BEGIN
;
rec.heads:=[nounhead];
rec.key:=0
END;
PROCEDURE MAKET_CARDrec(
    VAR rec:LSDOMAINT_CARDrecord);
BEGIN
;
rec.possnumbers:=[plural]
END;
PROCEDURE MAKET_CLAUSErec(
    VAR rec:LSDOMAINT_CLAUSErecord);
BEGIN
;
rec.req:=[pospol,negpol,omegapol];
rec.env:=[pospol,negpol,omegapol];
rec.voice:=omegavoice;
rec.PROsubject:=false;
rec.synvpefs:=[];
rec.thetavp:=omegathetavp;
rec.modus:=omegamodus;
rec.aktionsarts:=[];
rec.aspect:=omegaAspect;
rec.deixis:=omegadeixis;
rec.retro:=false;
rec.finiteness:=omegafin;
rec.infsort:=omegainf;
rec.superdeixis:=omegadeixis;
rec.adjuncts:=[]
END;
PROCEDURE MAKET_CONJrec(
    VAR rec:LSDOMAINT_CONJrecord);
BEGIN
;
rec.req:=[pospol,negpol,omegapol];
rec.env:=[pospol,negpol,omegapol];
rec.class:=omegaTimeAdvClass;
rec.deixis:=omegadeixis;
rec.aspect:=omegaAspect;
rec.retro:=false;
rec.conjpatterns:=[synTHATSENT];
rec.adverbial:=true;
rec.temporal:=true;
rec.distri:=[initial,final];
rec.key:=0
END;
PROCEDURE MAKET_COORDrec(
    VAR rec:LSDOMAINT_COORDrecord);
BEGIN
;
rec.kinds:=[simple];
rec.iteration:=TRUE;
rec.correlative2key:=0;
rec.patterns:=[];
rec.inducednumbers:=[plural];
rec.Sintroducer:=TRUE;
rec.req:=[omegapol,pospol,negpol];
rec.env:=[omegapol,pospol,negpol];
rec.key:=0
END;
PROCEDURE MAKET_DEMADJrec(
    VAR rec:LSDOMAINT_DEMADJrecord);
BEGIN
;
rec.number:=singular;
rec.key:=0
END;
PROCEDURE MAKET_DEMPROrec(
    VAR rec:LSDOMAINT_DEMPROrecord);
BEGIN
;
rec.number:=singular;
rec.key:=0
END;
PROCEDURE MAKET_BDETrec(
    VAR rec:LSDOMAINT_BDETrecord);
BEGIN
;
rec.req:=[pospol,negpol,omegapol];
rec.env:=[pospol,negpol,omegapol];
rec.definite:=omegadef;
rec.posspred:=false;
rec.possnumbers:=[singular];
rec.posscomas:=[count];
rec.mood:=nowh;
rec.possnietnp:=false;
rec.syntquant:=omegaquant;
rec.key:=0
END;
PROCEDURE MAKET_DETrec(
    VAR rec:LSDOMAINT_DETrecord);
BEGIN
;
rec.req:=[pospol,negpol,omegapol];
rec.env:=[pospol,negpol,omegapol];
rec.definite:=omegadef;
rec.posspred:=false;
rec.possnumbers:=[singular];
rec.posscomas:=[count];
rec.mood:=nowh;
rec.possnietnp:=false;
rec.syntquant:=omegaquant
END;
PROCEDURE MAKET_DETPrec(
    VAR rec:LSDOMAINT_DETPrecord);
BEGIN
;
rec.req:=[pospol,negpol,omegapol];
rec.env:=[pospol,negpol,omegapol];
rec.definite:=omegadef;
rec.posspred:=false;
rec.possnumbers:=[singular];
rec.posscomas:=[count];
rec.mood:=nowh;
rec.possnietnp:=false;
rec.syntquant:=omegaquant;
rec.superdeixis:=omegadeixis
END;
PROCEDURE MAKET_DIGITrec(
    VAR rec:LSDOMAINT_DIGITrecord);
BEGIN
;
rec.valeu:=0;
rec.key:=0
END;
PROCEDURE MAKET_ENrec(
    VAR rec:LSDOMAINT_ENrecord);
BEGIN
;
rec.key:=0
END;
PROCEDURE MAKET_EMPTYrec(
    VAR rec:LSDOMAINT_EMPTYrecord);
BEGIN
;
rec.person:=3;
rec.number:=singular;
rec.gender:=omegagender;
rec.key:=0
END;
PROCEDURE MAKET_EXCLAMrec(
    VAR rec:LSDOMAINT_EXCLAMrecord);
BEGIN
;
rec.key:=0
END;
PROCEDURE MAKET_GENrec(
    VAR rec:LSDOMAINT_GENrecord);
BEGIN
;
rec.key:=0
END;
PROCEDURE MAKET_INDEFPROrec(
    VAR rec:LSDOMAINT_INDEFPROrecord);
BEGIN
;
rec.req:=[pospol,negpol,omegapol];
rec.env:=[pospol,negpol,omegapol];
rec.definite:=omegadef;
rec.number:=singular;
rec.poss:=true;
rec.possnietNP:=false;
rec.syntquant:=omegaquant;
rec.animate:=omegaanimate;
rec.NPhead:=otherNP;
rec.key:=0
END;
PROCEDURE MAKET_SUBINDEFPROrec(
    VAR rec:LSDOMAINT_INDEFPROrecord);
BEGIN
;
rec.req:=[pospol,negpol,omegapol];
rec.env:=[pospol,negpol,omegapol];
rec.definite:=omegadef;
rec.number:=singular;
rec.poss:=true;
rec.possnietNP:=false;
rec.syntquant:=omegaquant;
rec.animate:=omegaanimate;
rec.NPhead:=otherNP;
rec.key:=0
END;
PROCEDURE MAKET_NEGrec(
    VAR rec:LSDOMAINT_NEGrecord);
BEGIN
;
rec.key:=0
END;
PROCEDURE MAKET_BNOUNSUFFrec(
    VAR rec:LSDOMAINT_BNOUNrecord);
BEGIN
;
rec.req:=[pospol,negpol,omegapol];
rec.env:=[pospol,negpol,omegapol];
rec.plurforms:=[regplur];
rec.genders:=[omegagender];
rec.class:=omegaTimeAdvClass;
rec.deixis:=omegadeixis;
rec.aspect:=omegaAspect;
rec.retro:=false;
rec.sexes:=[];
rec.subcs:=[othernoun];
rec.temporal:=false;
rec.animate:=omegaanimate;
rec.human:=omegahuman;
rec.posscomas:=[count];
rec.thetanp:=omegathetanp;
rec.nounpatterns:=[];
rec.prepkey:=0;
rec.personal:=true;
rec.poss:=true;
rec.key:=0
END;
PROCEDURE MAKET_BNOUNrec(
    VAR rec:LSDOMAINT_BNOUNrecord);
BEGIN
;
rec.req:=[pospol,negpol,omegapol];
rec.env:=[pospol,negpol,omegapol];
rec.plurforms:=[regplur];
rec.genders:=[omegagender];
rec.class:=omegaTimeAdvClass;
rec.deixis:=omegadeixis;
rec.aspect:=omegaAspect;
rec.retro:=false;
rec.sexes:=[];
rec.subcs:=[othernoun];
rec.temporal:=false;
rec.animate:=omegaanimate;
rec.human:=omegahuman;
rec.posscomas:=[count];
rec.thetanp:=omegathetanp;
rec.nounpatterns:=[];
rec.prepkey:=0;
rec.personal:=true;
rec.poss:=true;
rec.key:=0
END;
PROCEDURE MAKET_SUBNOUNrec(
    VAR rec:LSDOMAINT_SUBNOUNrecord);
BEGIN
;
rec.req:=[pospol,negpol,omegapol];
rec.env:=[pospol,negpol,omegapol];
rec.plurforms:=[regplur];
rec.genders:=[omegagender];
rec.affix:=noaffix;
rec.class:=omegaTimeAdvClass;
rec.deixis:=omegadeixis;
rec.aspect:=omegaAspect;
rec.retro:=false;
rec.sexes:=[];
rec.subcs:=[othernoun];
rec.temporal:=false;
rec.animate:=omegaAnimate;
rec.human:=omegahuman;
rec.posscomas:=[count];
rec.thetanp:=omegathetanp;
rec.nounpatterns:=[];
rec.prepkey:=0;
rec.personal:=true;
rec.poss:=true
END;
PROCEDURE MAKET_NOUNrec(
    VAR rec:LSDOMAINT_NOUNrecord);
BEGIN
;
rec.req:=[pospol,negpol,omegapol];
rec.env:=[pospol,negpol,omegapol];
rec.plurforms:=[regplur];
rec.genders:=[omegagender];
rec.numbers:=[singular];
rec.affix:=noaffix;
rec.class:=omegaTimeAdvClass;
rec.deixis:=omegadeixis;
rec.aspect:=omegaAspect;
rec.retro:=false;
rec.sexes:=[];
rec.subcs:=[othernoun];
rec.temporal:=false;
rec.animate:=omegaAnimate;
rec.human:=omegahuman;
rec.posscomas:=[count];
rec.thetanp:=omegathetanp;
rec.nounpatterns:=[];
rec.prepkey:=0;
rec.personal:=true;
rec.poss:=true
END;
PROCEDURE MAKET_CNrec(
    VAR rec:LSDOMAINT_CNrecord);
BEGIN
;
rec.req:=[pospol,negpol,omegapol];
rec.env:=[pospol,negpol,omegapol];
rec.superdeixis:=Omegadeixis;
rec.class:=omegaTimeAdvClass;
rec.deixis:=omegadeixis;
rec.aspect:=omegaAspect;
rec.retro:=false;
rec.definite:=omegadef;
rec.numbers:=[singular];
rec.cases:=[];
rec.genders:=[omegagender];
rec.sexes:=[];
rec.actsubcs:=[othernoun];
rec.temporal:=false;
rec.animate:=omegaAnimate;
rec.human:=omegahuman;
rec.posscomas:=[count];
rec.thetanp:=omegathetanp;
rec.nounpatternefs:=[];
rec.poss:=true
END;
PROCEDURE MAKET_NPrec(
    VAR rec:LSDOMAINT_NPrecord);
BEGIN
;
rec.req:=[pospol,negpol,omegapol];
rec.env:=[pospol,negpol,omegapol];
rec.superdeixis:=omegadeixis;
rec.class:=omegaTimeAdvClass;
rec.deixis:=omegadeixis;
rec.aspect:=omegaAspect;
rec.retro:=false;
rec.definite:=omegadef;
rec.person:=3;
rec.number:=singular;
rec.cases:=[];
rec.genders:=[omegagender];
rec.sexes:=[];
rec.actsubcs:=[othernoun];
rec.temporal:=false;
rec.animate:=omegaanimate;
rec.human:=omegahuman;
rec.actcomas:=[count];
rec.thetanp:=omegathetanp;
rec.nounpatternefs:=[];
rec.mood:=nowh;
rec.generic:=omegageneric;
rec.posspred:=false;
rec.possnietnp:=false;
rec.syntquant:=omegaquant;
rec.NPhead:=otherNP;
rec.specQ:=omegaspec;
rec.poss:=true;
rec.coord:=nocoord
END;
PROCEDURE MAKET_VARNPrec(
    VAR rec:LSDOMAINT_NPrecord);
BEGIN
;
rec.req:=[pospol,negpol,omegapol];
rec.env:=[pospol,negpol,omegapol];
rec.superdeixis:=omegadeixis;
rec.class:=omegaTimeAdvClass;
rec.deixis:=omegadeixis;
rec.aspect:=omegaAspect;
rec.retro:=false;
rec.definite:=omegadef;
rec.person:=3;
rec.number:=singular;
rec.cases:=[];
rec.genders:=[omegagender];
rec.sexes:=[];
rec.actsubcs:=[othernoun];
rec.temporal:=false;
rec.animate:=omegaanimate;
rec.human:=omegahuman;
rec.actcomas:=[count];
rec.thetanp:=omegathetanp;
rec.nounpatternefs:=[];
rec.mood:=nowh;
rec.generic:=omegageneric;
rec.posspred:=false;
rec.possnietnp:=false;
rec.syntquant:=omegaquant;
rec.NPhead:=otherNP;
rec.specQ:=omegaspec;
rec.poss:=true;
rec.coord:=nocoord
END;
PROCEDURE MAKET_NPPROPrec(
    VAR rec:LSDOMAINT_NPPROPrecord);
BEGIN
;
rec.req:=[pospol,negpol,omegapol];
rec.env:=[pospol,negpol,omegapol];
rec.superdeixis:=omegadeixis;
rec.aktionsarts:=[];
rec.thetanp:=omegathetanp;
rec.nounpatternefs:=[];
rec.PROsubject:=false
END;
PROCEDURE MAKET_NPFORMULArec(
    VAR rec:LSDOMAINT_NPPROPrecord);
BEGIN
;
rec.req:=[pospol,negpol,omegapol];
rec.env:=[pospol,negpol,omegapol];
rec.superdeixis:=omegadeixis;
rec.aktionsarts:=[];
rec.thetanp:=omegathetanp;
rec.nounpatternefs:=[];
rec.PROsubject:=false
END;
PROCEDURE MAKET_OPENNPPROPrec(
    VAR rec:LSDOMAINT_NPPROPrecord);
BEGIN
;
rec.req:=[pospol,negpol,omegapol];
rec.env:=[pospol,negpol,omegapol];
rec.superdeixis:=omegadeixis;
rec.aktionsarts:=[];
rec.thetanp:=omegathetanp;
rec.nounpatternefs:=[];
rec.PROsubject:=false
END;
PROCEDURE MAKET_CLOSEDNPPROPrec(
    VAR rec:LSDOMAINT_NPPROPrecord);
BEGIN
;
rec.req:=[pospol,negpol,omegapol];
rec.env:=[pospol,negpol,omegapol];
rec.superdeixis:=omegadeixis;
rec.aktionsarts:=[];
rec.thetanp:=omegathetanp;
rec.nounpatternefs:=[];
rec.PROsubject:=false
END;
PROCEDURE MAKET_NUMrec(
    VAR rec:LSDOMAINT_NUMrecord);
BEGIN
;
rec.numbers:=[singular];
rec.key:=0
END;
PROCEDURE MAKET_ORDINALrec(
    VAR rec:LSDOMAINT_ORDINALrecord);
BEGIN
;
rec.key:=0
END;
PROCEDURE MAKET_PARTrec(
    VAR rec:LSDOMAINT_PARTICLErecord);
BEGIN
;
rec.key:=0
END;
PROCEDURE MAKET_BPERSPROrec(
    VAR rec:LSDOMAINT_BPERSPROrecord);
BEGIN
;
rec.person:=3;
rec.number:=singular;
rec.gender:=omegagender;
rec.animate:=omegaanimate;
rec.predpos:=true;
rec.NPhead:=persproNP;
rec.key:=0
END;
PROCEDURE MAKET_PERSPROrec(
    VAR rec:LSDOMAINT_PERSPROrecord);
BEGIN
;
rec.person:=3;
rec.number:=singular;
rec.gender:=omegagender;
rec.animate:=omegaanimate;
rec.predpos:=true;
rec.NPhead:=persproNP;
rec.persprocase:=omegacase
END;
PROCEDURE MAKET_POSrec(
    VAR rec:LSDOMAINT_POSrecord);
BEGIN
;
rec.key:=0
END;
PROCEDURE MAKET_POSSADJrec(
    VAR rec:LSDOMAINT_POSSADJrecord);
BEGIN
;
rec.mood:=nowh;
rec.antecedent:=noant
END;
PROCEDURE MAKET_POSSPROrec(
    VAR rec:LSDOMAINT_POSSPROrecord);
BEGIN

END;
PROCEDURE MAKET_BPREFIXrec(
    VAR rec:LSDOMAINT_BPREFIXrecord);
BEGIN
;
rec.heads:=[nounhead];
rec.key:=0
END;
PROCEDURE MAKET_SUBPREPrec(
    VAR rec:LSDOMAINT_PREPrecord);
BEGIN
;
rec.req:=[pospol,negpol,omegapol];
rec.env:=[pospol,negpol,omegapol];
rec.subcs:=[];
rec.synpps:=[synNP];
rec.thetapp:=omegathetapp;
rec.class:=omegaTimeAdvClass;
rec.deixis:=omegadeixis;
rec.aspect:=omegaAspect;
rec.retro:=false;
rec.secondprep:=0;
rec.key:=0
END;
PROCEDURE MAKET_PREPrec(
    VAR rec:LSDOMAINT_PREPrecord);
BEGIN
;
rec.req:=[pospol,negpol,omegapol];
rec.env:=[pospol,negpol,omegapol];
rec.subcs:=[];
rec.synpps:=[synNP];
rec.thetapp:=omegathetapp;
rec.class:=omegaTimeAdvClass;
rec.deixis:=omegadeixis;
rec.aspect:=omegaAspect;
rec.retro:=false;
rec.secondprep:=0;
rec.key:=0
END;
PROCEDURE MAKET_PREPPrec(
    VAR rec:LSDOMAINT_PREPPrecord);
BEGIN
;
rec.req:=[pospol,negpol,omegapol];
rec.env:=[pospol,negpol,omegapol];
rec.mood:=nowh;
rec.actsubcefs:=[];
rec.synppefs:=[];
rec.thetapp:=omegathetapp;
rec.headkey:=0;
rec.class:=omegaTimeAdvClass;
rec.deixis:=omegadeixis;
rec.aspect:=omegaAspect;
rec.retro:=false;
rec.superdeixis:=omegadeixis;
rec.specQ:=omegaspec;
rec.stranded:=false;
rec.coord:=nocoord
END;
PROCEDURE MAKET_PREPPPROPrec(
    VAR rec:LSDOMAINT_PREPPPROPrecord);
BEGIN
;
rec.req:=[pospol,negpol,omegapol];
rec.env:=[pospol,negpol,omegapol];
rec.mood:=nowh;
rec.actsubcefs:=[];
rec.PROsubject:=false;
rec.synppefs:=[];
rec.thetapp:=omegathetapp;
rec.headkey:=0;
rec.class:=omegaTimeAdvClass;
rec.deixis:=omegadeixis;
rec.aspect:=omegaAspect;
rec.retro:=false;
rec.aktionsarts:=[];
rec.superdeixis:=omegadeixis;
rec.specQ:=omegaspec
END;
PROCEDURE MAKET_PREPPFORMULArec(
    VAR rec:LSDOMAINT_PREPPPROPrecord);
BEGIN
;
rec.req:=[pospol,negpol,omegapol];
rec.env:=[pospol,negpol,omegapol];
rec.mood:=nowh;
rec.actsubcefs:=[];
rec.PROsubject:=false;
rec.synppefs:=[];
rec.thetapp:=omegathetapp;
rec.headkey:=0;
rec.class:=omegaTimeAdvClass;
rec.deixis:=omegadeixis;
rec.aspect:=omegaAspect;
rec.retro:=false;
rec.aktionsarts:=[];
rec.superdeixis:=omegadeixis;
rec.specQ:=omegaspec
END;
PROCEDURE MAKET_OPENPREPPPROPrec(
    VAR rec:LSDOMAINT_PREPPPROPrecord);
BEGIN
;
rec.req:=[pospol,negpol,omegapol];
rec.env:=[pospol,negpol,omegapol];
rec.mood:=nowh;
rec.actsubcefs:=[];
rec.PROsubject:=false;
rec.synppefs:=[];
rec.thetapp:=omegathetapp;
rec.headkey:=0;
rec.class:=omegaTimeAdvClass;
rec.deixis:=omegadeixis;
rec.aspect:=omegaAspect;
rec.retro:=false;
rec.aktionsarts:=[];
rec.superdeixis:=omegadeixis;
rec.specQ:=omegaspec
END;
PROCEDURE MAKET_CLOSEDPREPPPROPrec(
    VAR rec:LSDOMAINT_PREPPPROPrecord);
BEGIN
;
rec.req:=[pospol,negpol,omegapol];
rec.env:=[pospol,negpol,omegapol];
rec.mood:=nowh;
rec.actsubcefs:=[];
rec.PROsubject:=false;
rec.synppefs:=[];
rec.thetapp:=omegathetapp;
rec.headkey:=0;
rec.class:=omegaTimeAdvClass;
rec.deixis:=omegadeixis;
rec.aspect:=omegaAspect;
rec.retro:=false;
rec.aktionsarts:=[];
rec.superdeixis:=omegadeixis;
rec.specQ:=omegaspec
END;
PROCEDURE MAKET_VARPREPPrec(
    VAR rec:LSDOMAINT_PREPPrecord);
BEGIN
;
rec.req:=[pospol,negpol,omegapol];
rec.env:=[pospol,negpol,omegapol];
rec.mood:=nowh;
rec.actsubcefs:=[];
rec.synppefs:=[];
rec.thetapp:=omegathetapp;
rec.headkey:=0;
rec.class:=omegaTimeAdvClass;
rec.deixis:=omegadeixis;
rec.aspect:=omegaAspect;
rec.retro:=false;
rec.superdeixis:=omegadeixis;
rec.specQ:=omegaspec;
rec.stranded:=false;
rec.coord:=nocoord
END;
PROCEDURE MAKET_BPROPERNOUNrec(
    VAR rec:LSDOMAINT_BPROPERNOUNrecord);
BEGIN
;
rec.plurforms:=[regplur];
rec.sexes:=[];
rec.subc:=firstname;
rec.animate:=omegaanimate;
rec.human:=omegahuman;
rec.genders:=[omegagender];
rec.poss:=true;
rec.temporal:=false;
rec.class:=omegaTimeAdvClass;
rec.deixis:=omegadeixis;
rec.aspect:=omegaAspect;
rec.retro:=false;
rec.key:=0
END;
PROCEDURE MAKET_PROPERNOUNrec(
    VAR rec:LSDOMAINT_PROPERNOUNrecord);
BEGIN
;
rec.plurforms:=[regplur];
rec.numbers:=[singular];
rec.sexes:=[];
rec.subc:=firstname;
rec.animate:=omegaanimate;
rec.human:=omegahuman;
rec.genders:=[omegagender];
rec.poss:=true;
rec.temporal:=false;
rec.class:=omegaTimeAdvClass;
rec.deixis:=omegadeixis;
rec.aspect:=omegaAspect;
rec.retro:=false
END;
PROCEDURE MAKET_PROSENTrec(
    VAR rec:LSDOMAINT_PROSENTrecord);
BEGIN
;
rec.neg:=false;
rec.so:=false;
rec.key:=0
END;
PROCEDURE MAKET_PUNCrec(
    VAR rec:LSDOMAINT_PUNCrecord);
BEGIN
;
rec.key:=0
END;
PROCEDURE MAKET_Qrec(
    VAR rec:LSDOMAINT_Qrecord);
BEGIN
;
rec.req:=[pospol,negpol,omegapol];
rec.env:=[pospol,negpol,omegapol];
rec.definite:=omegadef;
rec.posspred:=false;
rec.possnumbers:=[singular];
rec.posscomas:=[count];
rec.mood:=nowh;
rec.thanas:=omegacompl;
rec.hop:=false;
rec.key:=0
END;
PROCEDURE MAKET_QPrec(
    VAR rec:LSDOMAINT_QPrecord);
BEGIN
;
rec.req:=[pospol,negpol,omegapol];
rec.env:=[pospol,negpol,omegapol];
rec.definite:=omegadef;
rec.posspred:=false;
rec.possnumbers:=[singular];
rec.posscomas:=[count];
rec.mood:=nowh;
rec.hop:=false;
rec.thanas:=omegacompl;
rec.thanascompl:=false;
rec.superdeixis:=omegadeixis
END;
PROCEDURE MAKET_RECIPROrec(
    VAR rec:LSDOMAINT_RECIPROrecord);
BEGIN
;
rec.antecedent:=noant;
rec.one:=false;
rec.key:=0
END;
PROCEDURE MAKET_REFLPROrec(
    VAR rec:LSDOMAINT_REFLPROrecord);
BEGIN
;
rec.antecedent:=noant;
rec.number:=singular;
rec.person:=3;
rec.gender:=omegagender;
rec.one:=false;
rec.key:=0
END;
PROCEDURE MAKET_RELPROrec(
    VAR rec:LSDOMAINT_RELPROrecord);
BEGIN
;
rec.key:=0
END;
PROCEDURE MAKET_SENTENCErec(
    VAR rec:LSDOMAINT_SENTENCErecord);
BEGIN
;
rec.req:=[pospol,negpol,omegapol];
rec.env:=[pospol,negpol,omegapol];
rec.mood:=omegamood;
rec.senttype:=omegaclause;
rec.voice:=omegavoice;
rec.PROsubject:=false;
rec.synvpefs:=[];
rec.thetavp:=omegathetavp;
rec.adjuncts:=[];
rec.modus:=omegamodus;
rec.aktionsarts:=[];
rec.aspect:=omegaAspect;
rec.deixis:=omegadeixis;
rec.retro:=false;
rec.finiteness:=omegafin;
rec.infsort:=omegainf;
rec.superdeixis:=omegadeixis;
rec.conjkey:=0;
rec.adverbial:=false;
rec.temporal:=false;
rec.conjclass:=omegatimeadvclass;
rec.conjdeixis:=omegadeixis;
rec.conjaspect:=omegaaspect;
rec.conjretro:=false;
rec.coord:=nocoord
END;
PROCEDURE MAKET_TOCATrec(
    VAR rec:LSDOMAINT_TOCATrecord);
BEGIN
;
rec.key:=0
END;
PROCEDURE MAKET_THANASrec(
    VAR rec:LSDOMAINT_THANASrecord);
BEGIN
;
rec.key:=0
END;
PROCEDURE MAKET_THANPrec(
    VAR rec:LSDOMAINT_THANPrecord);
BEGIN
;
rec.thanas:=thancompl;
rec.req:=[pospol,negpol,omegapol];
rec.env:=[pospol,negpol,omegapol]
END;
PROCEDURE MAKET_THERErec(
    VAR rec:LSDOMAINT_THERErecord);
BEGIN
;
rec.key:=0
END;
PROCEDURE MAKET_UTTrec(
    VAR rec:LSDOMAINT_NORECORD);
BEGIN

END;
PROCEDURE MAKET_ADJPPROPVARrec(
    VAR rec:LSDOMAINT_ADJPPROPVARrecord);
BEGIN
;
rec.req:=[pospol,negpol,omegapol];
rec.env:=[pospol,negpol,omegapol];
rec.class:=omegaTimeAdvClass;
rec.deixis:=omegadeixis;
rec.aspect:=omegaAspect;
rec.retro:=false;
rec.aktionsarts:=[];
rec.superdeixis:=omegadeixis;
rec.temporal:=false;
rec.actsubcefs:=[otheradj];
rec.thetaadj:=omegathetaadjp;
rec.adjpatternefs:=[];
rec.PROsubject:=false;
rec.mood:=nowh;
rec.index:=0
END;
PROCEDURE MAKET_ADVPVARrec(
    VAR rec:LSDOMAINT_ADVPVARrecord);
BEGIN
;
rec.req:=[pospol,negpol,omegapol];
rec.env:=[pospol,negpol,omegapol];
rec.class:=omegaTimeAdvClass;
rec.deixis:=omegadeixis;
rec.aspect:=omegaAspect;
rec.retro:=false;
rec.mood:=nowh;
rec.thetaadv:=omegathetaadvp;
rec.superdeixis:=omegadeixis;
rec.actsubcefs:=[VPAdv];
rec.advpatternefs:=[];
rec.position:=[1,2,3,4];
rec.possnietnp:=false;
rec.thanas:=omegacompl;
rec.thanascompl:=false;
rec.temporal:=false;
rec.coord:=nocoord;
rec.index:=0
END;
PROCEDURE MAKET_ADVPPROPVARrec(
    VAR rec:LSDOMAINT_ADVPPROPVARrecord);
BEGIN
;
rec.req:=[pospol,negpol,omegapol];
rec.env:=[pospol,negpol,omegapol];
rec.class:=omegaTimeAdvClass;
rec.deixis:=omegadeixis;
rec.aspect:=omegaAspect;
rec.retro:=false;
rec.aktionsarts:=[];
rec.superdeixis:=omegadeixis;
rec.actsubcefs:=[VPAdv];
rec.thetaadv:=omegathetaadvp;
rec.advpatternefs:=[];
rec.PROsubject:=false;
rec.mood:=nowh;
rec.thanascompl:=false;
rec.temporal:=false;
rec.index:=0
END;
PROCEDURE MAKET_CLAUSEVARrec(
    VAR rec:LSDOMAINT_CLAUSEVARrecord);
BEGIN
;
rec.req:=[pospol,negpol,omegapol];
rec.env:=[pospol,negpol,omegapol];
rec.voice:=omegavoice;
rec.PROsubject:=false;
rec.synvpefs:=[];
rec.thetavp:=omegathetavp;
rec.modus:=omegamodus;
rec.aktionsarts:=[];
rec.aspect:=omegaAspect;
rec.deixis:=omegadeixis;
rec.retro:=false;
rec.finiteness:=omegafin;
rec.infsort:=omegainf;
rec.superdeixis:=omegadeixis;
rec.adjuncts:=[];
rec.index:=0
END;
PROCEDURE MAKET_CNVARrec(
    VAR rec:LSDOMAINT_CNVARrecord);
BEGIN
;
rec.req:=[pospol,negpol,omegapol];
rec.env:=[pospol,negpol,omegapol];
rec.superdeixis:=Omegadeixis;
rec.class:=omegaTimeAdvClass;
rec.deixis:=omegadeixis;
rec.aspect:=omegaAspect;
rec.retro:=false;
rec.definite:=omegadef;
rec.numbers:=[singular];
rec.cases:=[];
rec.genders:=[omegagender];
rec.sexes:=[];
rec.actsubcs:=[othernoun];
rec.temporal:=false;
rec.animate:=omegaAnimate;
rec.human:=omegahuman;
rec.posscomas:=[count];
rec.thetanp:=omegathetanp;
rec.nounpatternefs:=[];
rec.poss:=true;
rec.index:=0
END;
PROCEDURE MAKET_NPVARrec(
    VAR rec:LSDOMAINT_NPVARrecord);
BEGIN
;
rec.req:=[pospol,negpol,omegapol];
rec.env:=[pospol,negpol,omegapol];
rec.superdeixis:=omegadeixis;
rec.class:=omegaTimeAdvClass;
rec.deixis:=omegadeixis;
rec.aspect:=omegaAspect;
rec.retro:=false;
rec.definite:=omegadef;
rec.person:=3;
rec.number:=singular;
rec.cases:=[];
rec.genders:=[omegagender];
rec.sexes:=[];
rec.actsubcs:=[othernoun];
rec.temporal:=false;
rec.animate:=omegaanimate;
rec.human:=omegahuman;
rec.actcomas:=[count];
rec.thetanp:=omegathetanp;
rec.nounpatternefs:=[];
rec.mood:=nowh;
rec.generic:=omegageneric;
rec.posspred:=false;
rec.possnietnp:=false;
rec.syntquant:=omegaquant;
rec.NPhead:=otherNP;
rec.specQ:=omegaspec;
rec.poss:=true;
rec.coord:=nocoord;
rec.index:=0
END;
PROCEDURE MAKET_NPPROPVARrec(
    VAR rec:LSDOMAINT_NPPROPVARrecord);
BEGIN
;
rec.req:=[pospol,negpol,omegapol];
rec.env:=[pospol,negpol,omegapol];
rec.superdeixis:=omegadeixis;
rec.aktionsarts:=[];
rec.thetanp:=omegathetanp;
rec.nounpatternefs:=[];
rec.PROsubject:=false;
rec.index:=0
END;
PROCEDURE MAKET_PREPPVARrec(
    VAR rec:LSDOMAINT_PREPPVARrecord);
BEGIN
;
rec.req:=[pospol,negpol,omegapol];
rec.env:=[pospol,negpol,omegapol];
rec.mood:=nowh;
rec.actsubcefs:=[];
rec.synppefs:=[];
rec.thetapp:=omegathetapp;
rec.headkey:=0;
rec.class:=omegaTimeAdvClass;
rec.deixis:=omegadeixis;
rec.aspect:=omegaAspect;
rec.retro:=false;
rec.superdeixis:=omegadeixis;
rec.specQ:=omegaspec;
rec.stranded:=false;
rec.coord:=nocoord;
rec.index:=0
END;
PROCEDURE MAKET_PREPPPROPVARrec(
    VAR rec:LSDOMAINT_PREPPPROPVARrecord);
BEGIN
;
rec.req:=[pospol,negpol,omegapol];
rec.env:=[pospol,negpol,omegapol];
rec.mood:=nowh;
rec.actsubcefs:=[];
rec.PROsubject:=false;
rec.synppefs:=[];
rec.thetapp:=omegathetapp;
rec.headkey:=0;
rec.class:=omegaTimeAdvClass;
rec.deixis:=omegadeixis;
rec.aspect:=omegaAspect;
rec.retro:=false;
rec.aktionsarts:=[];
rec.superdeixis:=omegadeixis;
rec.specQ:=omegaspec;
rec.index:=0
END;
PROCEDURE MAKET_PROSENTVARrec(
    VAR rec:LSDOMAINT_PROSENTVARrecord);
BEGIN
;
rec.neg:=false;
rec.so:=false;
rec.index:=0
END;
PROCEDURE MAKET_SENTENCEVARrec(
    VAR rec:LSDOMAINT_SENTENCEVARrecord);
BEGIN
;
rec.req:=[pospol,negpol,omegapol];
rec.env:=[pospol,negpol,omegapol];
rec.mood:=omegamood;
rec.senttype:=omegaclause;
rec.voice:=omegavoice;
rec.PROsubject:=false;
rec.synvpefs:=[];
rec.thetavp:=omegathetavp;
rec.adjuncts:=[];
rec.modus:=omegamodus;
rec.aktionsarts:=[];
rec.aspect:=omegaAspect;
rec.deixis:=omegadeixis;
rec.retro:=false;
rec.finiteness:=omegafin;
rec.infsort:=omegainf;
rec.superdeixis:=omegadeixis;
rec.conjkey:=0;
rec.adverbial:=false;
rec.temporal:=false;
rec.conjclass:=omegatimeadvclass;
rec.conjdeixis:=omegadeixis;
rec.conjaspect:=omegaaspect;
rec.conjretro:=false;
rec.coord:=nocoord;
rec.index:=0
END;
PROCEDURE MAKET_VERBPPROPVARrec(
    VAR rec:LSDOMAINT_VERBPPROPVARrecord);
BEGIN
;
rec.req:=[pospol,negpol,omegapol];
rec.env:=[pospol,negpol,omegapol];
rec.superdeixis:=Omegadeixis;
rec.PROsubject:=false;
rec.voice:=omegavoice;
rec.synvpefs:=[];
rec.thetavp:=omegathetavp;
rec.aktionsarts:=[];
rec.adjuncts:=[];
rec.index:=0
END;
PROCEDURE MAKET_EMPTYVARrec(
    VAR rec:LSDOMAINT_EMPTYVARrecord);
BEGIN
;
rec.person:=3;
rec.number:=singular;
rec.gender:=omegagender;
rec.index:=0
END;
PROCEDURE MAKET_NEGVARrec(
    VAR rec:LSDOMAINT_NEGVARrecord);
BEGIN

END;
PROCEDURE MAKET_POSVARrec(
    VAR rec:LSDOMAINT_POSVARrecord);
BEGIN

END;
PROCEDURE MAKET_BVERBSUFFrec(
    VAR rec:LSDOMAINT_BVERBrecord);
BEGIN
;
rec.req:=[pospol,negpol,omegapol];
rec.env:=[pospol,negpol,omegapol];
rec.conjclasses:=[10];
rec.ingform:=reging;
rec.sform:=regS;
rec.particle:=0;
rec.possvoices:=[active,passive];
rec.reflexivity:=notreflexive;
rec.synvps:=[];
rec.thetavp:=omegathetavp;
rec.adjuncts:=[];
rec.CaseAssigner:=true;
rec.subc:=mainverb;
rec.oblcontrol:=omegaoblcontrol;
rec.prepkey1:=0;
rec.prepkey2:=0;
rec.controller:=none;
rec.classes:=[durativeclass];
rec.thatdel:=omegadel;
rec.key:=0
END;
PROCEDURE MAKET_BVERBrec(
    VAR rec:LSDOMAINT_BVERBrecord);
BEGIN
;
rec.req:=[pospol,negpol,omegapol];
rec.env:=[pospol,negpol,omegapol];
rec.conjclasses:=[10];
rec.ingform:=reging;
rec.sform:=regS;
rec.particle:=0;
rec.possvoices:=[active,passive];
rec.reflexivity:=notreflexive;
rec.synvps:=[];
rec.thetavp:=omegathetavp;
rec.adjuncts:=[];
rec.CaseAssigner:=true;
rec.subc:=mainverb;
rec.oblcontrol:=omegaoblcontrol;
rec.prepkey1:=0;
rec.prepkey2:=0;
rec.controller:=none;
rec.classes:=[durativeclass];
rec.thatdel:=omegadel;
rec.key:=0
END;
PROCEDURE MAKET_SUBVERBrec(
    VAR rec:LSDOMAINT_SUBVERBrecord);
BEGIN
;
rec.req:=[pospol,negpol,omegapol];
rec.env:=[pospol,negpol,omegapol];
rec.conjclasses:=[10];
rec.ingform:=reging;
rec.sform:=regS;
rec.affix:=noaffix;
rec.particle:=0;
rec.possvoices:=[active,passive];
rec.reflexivity:=notreflexive;
rec.synvps:=[];
rec.thetavp:=omegathetavp;
rec.adjuncts:=[];
rec.CaseAssigner:=true;
rec.subc:=mainverb;
rec.oblcontrol:=omegaoblcontrol;
rec.prepkey1:=0;
rec.prepkey2:=0;
rec.controller:=none;
rec.classes:=[durativeclass];
rec.thatdel:=omegadel
END;
PROCEDURE MAKET_VERBrec(
    VAR rec:LSDOMAINT_VERBrecord);
BEGIN
;
rec.req:=[pospol,negpol,omegapol];
rec.env:=[pospol,negpol,omegapol];
rec.conjclasses:=[10];
rec.ingform:=reging;
rec.sform:=regS;
rec.affix:=noaffix;
rec.modus:=omegamodus;
rec.tense:=omegatense;
rec.persons:=[];
rec.numbers:=[];
rec.particle:=0;
rec.possvoices:=[active,passive];
rec.reflexivity:=notreflexive;
rec.synvps:=[];
rec.thetavp:=omegathetavp;
rec.adjuncts:=[];
rec.CaseAssigner:=true;
rec.subc:=mainverb;
rec.oblcontrol:=omegaoblcontrol;
rec.prepkey1:=0;
rec.prepkey2:=0;
rec.controller:=none;
rec.classes:=[durativeclass];
rec.thatdel:=omegadel
END;
PROCEDURE MAKET_VERBPrec(
    VAR rec:LSDOMAINT_VERBPrecord);
BEGIN
;
rec.req:=[pospol,negpol,omegapol];
rec.env:=[pospol,negpol,omegapol];
rec.synvps:=[];
rec.thetavp:=omegathetavp;
rec.modus:=omegamodus;
rec.persons:=[];
rec.numbers:=[];
rec.aspect:=omegaaspect;
rec.deixis:=omegadeixis;
rec.retro:=false;
rec.finiteness:=omegafin;
rec.voice:=omegavoice;
rec.synvpefs:=[];
rec.adjvpefs:=[];
rec.classes:=[];
rec.headfound:=false;
rec.Scomplfound:=false;
rec.foundauxes:=[];
rec.adjuncts:=[];
rec.reflexivity:=notreflexive;
rec.infsort:=omegainf;
rec.objfound:=false;
rec.indobjfound:=false;
rec.locargfound:=false;
rec.dirargfound:=false;
rec.prepobjfound:=false;
rec.prepobj2found:=false;
rec.nppredfound:=false;
rec.adjppredfound:=false;
rec.prepppredfound:=false;
rec.strandedfound:=false;
rec.vpcomplfound:=false
END;
PROCEDURE MAKET_VERBPPROPrec(
    VAR rec:LSDOMAINT_VERBPPROPrecord);
BEGIN
;
rec.req:=[pospol,negpol,omegapol];
rec.env:=[pospol,negpol,omegapol];
rec.superdeixis:=Omegadeixis;
rec.PROsubject:=false;
rec.voice:=omegavoice;
rec.synvpefs:=[];
rec.thetavp:=omegathetavp;
rec.aktionsarts:=[];
rec.adjuncts:=[]
END;
PROCEDURE MAKET_VERBPFORMULArec(
    VAR rec:LSDOMAINT_VERBPPROPrecord);
BEGIN
;
rec.req:=[pospol,negpol,omegapol];
rec.env:=[pospol,negpol,omegapol];
rec.superdeixis:=Omegadeixis;
rec.PROsubject:=false;
rec.voice:=omegavoice;
rec.synvpefs:=[];
rec.thetavp:=omegathetavp;
rec.aktionsarts:=[];
rec.adjuncts:=[]
END;
PROCEDURE MAKET_OPENVERBPPROPrec(
    VAR rec:LSDOMAINT_VERBPPROPrecord);
BEGIN
;
rec.req:=[pospol,negpol,omegapol];
rec.env:=[pospol,negpol,omegapol];
rec.superdeixis:=Omegadeixis;
rec.PROsubject:=false;
rec.voice:=omegavoice;
rec.synvpefs:=[];
rec.thetavp:=omegathetavp;
rec.aktionsarts:=[];
rec.adjuncts:=[]
END;
PROCEDURE MAKET_CLOSEDVERBPPROPrec(
    VAR rec:LSDOMAINT_VERBPPROPrecord);
BEGIN
;
rec.req:=[pospol,negpol,omegapol];
rec.env:=[pospol,negpol,omegapol];
rec.superdeixis:=Omegadeixis;
rec.PROsubject:=false;
rec.voice:=omegavoice;
rec.synvpefs:=[];
rec.thetavp:=omegathetavp;
rec.aktionsarts:=[];
rec.adjuncts:=[]
END;
PROCEDURE MAKET_BWHPROrec(
    VAR rec:LSDOMAINT_BWHPROrecord);
BEGIN
;
rec.animate:=omegaanimate;
rec.poss:=true;
rec.whcase:=true;
rec.number:=omeganumber;
rec.sexes:=[];
rec.key:=0
END;
PROCEDURE MAKET_WHPROrec(
    VAR rec:LSDOMAINT_WHPROrecord);
BEGIN
;
rec.animate:=omegaanimate;
rec.poss:=true;
rec.whcase:=true;
rec.number:=omeganumber;
rec.sexes:=[];
rec.cases:=[];
rec.key:=0
END;
PROCEDURE MAKET_SFCATrec(
    VAR rec:LSDOMAINT_xxkeyrecord);
BEGIN
;
rec.key:=0
END;
PROCEDURE MAKET_PFCATrec(
    VAR rec:LSDOMAINT_xxkeyrecord);
BEGIN
;
rec.key:=0
END;
PROCEDURE MAKET_GLUErec(
    VAR rec:LSDOMAINT_xxemptyrecord);
BEGIN

END;

PROCEDURE MAKET_BLEXStruct(
    Cat:LIDOMAINT_SyntCat;
    VAR rec:LSDOMAINT_BLEXStruct);
BEGIN
   CASE LoopHoles.Retype(Cat,LSDOMAINT_SyntCat) OF 
      BADJSUFF : BEGIN
rec.KEY := 0;rec.CAT := BADJSUFF;

      rec.BADJSUFFrec.compformations:=[regcomp];
      rec.BADJSUFFrec.req:=[pospol,negpol,omegapol];
      rec.BADJSUFFrec.env:=[pospol,negpol,omegapol];
      rec.BADJSUFFrec.class:=omegaTimeAdvClass;
      rec.BADJSUFFrec.deixis:=omegadeixis;
      rec.BADJSUFFrec.aspect:=omegaAspect;
      rec.BADJSUFFrec.retro:=false;
      rec.BADJSUFFrec.uses:=[attributive,predicative];
      rec.BADJSUFFrec.temporal:=false;
      rec.BADJSUFFrec.subcs:=[otheradj];
      rec.BADJSUFFrec.thetaadj:=omegathetaadjp;
      rec.BADJSUFFrec.adjpatterns:=[];
      rec.BADJSUFFrec.prepkey:=0;
      rec.BADJSUFFrec.advformation:=regAdv;
      rec.BADJSUFFrec.key := 0;
      END;
      BADJ : BEGIN
rec.KEY := 0;rec.CAT := BADJ;

      rec.BADJrec.compformations:=[regcomp];
      rec.BADJrec.req:=[pospol,negpol,omegapol];
      rec.BADJrec.env:=[pospol,negpol,omegapol];
      rec.BADJrec.class:=omegaTimeAdvClass;
      rec.BADJrec.deixis:=omegadeixis;
      rec.BADJrec.aspect:=omegaAspect;
      rec.BADJrec.retro:=false;
      rec.BADJrec.uses:=[attributive,predicative];
      rec.BADJrec.temporal:=false;
      rec.BADJrec.subcs:=[otheradj];
      rec.BADJrec.thetaadj:=omegathetaadjp;
      rec.BADJrec.adjpatterns:=[];
      rec.BADJrec.prepkey:=0;
      rec.BADJrec.advformation:=regAdv;
      rec.BADJrec.key := 0;
      END;
      BADVSUFF : BEGIN
rec.KEY := 0;rec.CAT := BADVSUFF;

      rec.BADVSUFFrec.compformations:=[regcomp];
      rec.BADVSUFFrec.req:=[pospol,negpol,omegapol];
      rec.BADVSUFFrec.env:=[pospol,negpol,omegapol];
      rec.BADVSUFFrec.subcs:=[VPAdv];
      rec.BADVSUFFrec.class:=omegaTimeAdvClass;
      rec.BADVSUFFrec.deixis:=omegadeixis;
      rec.BADVSUFFrec.aspect:=omegaAspect;
      rec.BADVSUFFrec.retro:=false;
      rec.BADVSUFFrec.mood:=nowh;
      rec.BADVSUFFrec.thetaadv:=omegathetaadvp;
      rec.BADVSUFFrec.advpatterns:=[];
      rec.BADVSUFFrec.prepkey:=0;
      rec.BADVSUFFrec.position:=[1,2,3,4];
      rec.BADVSUFFrec.possnietnp:=false;
      rec.BADVSUFFrec.thanas:=omegacompl;
      rec.BADVSUFFrec.temporal:=false;
      rec.BADVSUFFrec.key := 0;
      END;
      BADV : BEGIN
rec.KEY := 0;rec.CAT := BADV;

      rec.BADVrec.compformations:=[regcomp];
      rec.BADVrec.req:=[pospol,negpol,omegapol];
      rec.BADVrec.env:=[pospol,negpol,omegapol];
      rec.BADVrec.subcs:=[VPAdv];
      rec.BADVrec.class:=omegaTimeAdvClass;
      rec.BADVrec.deixis:=omegadeixis;
      rec.BADVrec.aspect:=omegaAspect;
      rec.BADVrec.retro:=false;
      rec.BADVrec.mood:=nowh;
      rec.BADVrec.thetaadv:=omegathetaadvp;
      rec.BADVrec.advpatterns:=[];
      rec.BADVrec.prepkey:=0;
      rec.BADVrec.position:=[1,2,3,4];
      rec.BADVrec.possnietnp:=false;
      rec.BADVrec.thanas:=omegacompl;
      rec.BADVrec.temporal:=false;
      rec.BADVrec.key := 0;
      END;
      ART : BEGIN
rec.KEY := 0;rec.CAT := ART;

      rec.ARTrec.definite:=omegadef;
      rec.ARTrec.possnumbers:=[singular];
      rec.ARTrec.posscomas:=[count];
      rec.ARTrec.key := 0;
      END;
      BBIGPRO : BEGIN
rec.KEY := 0;rec.CAT := BBIGPRO;

      rec.BBIGPROrec.person:=3;
      rec.BBIGPROrec.number:=singular;
      rec.BBIGPROrec.gender:=omegagender;
      rec.BBIGPROrec.animate:=omegaanimate;
      rec.BBIGPROrec.predpos:=true;
      rec.BBIGPROrec.NPhead:=persproNP;
      rec.BBIGPROrec.key := 0;
      END;
      BIRRPREF : BEGIN
rec.KEY := 0;rec.CAT := BIRRPREF;

      rec.BIRRPREFrec.heads:=[nounhead];
      rec.BIRRPREFrec.key := 0;
      END;
      CONJ : BEGIN
rec.KEY := 0;rec.CAT := CONJ;

      rec.CONJrec.req:=[pospol,negpol,omegapol];
      rec.CONJrec.env:=[pospol,negpol,omegapol];
      rec.CONJrec.class:=omegaTimeAdvClass;
      rec.CONJrec.deixis:=omegadeixis;
      rec.CONJrec.aspect:=omegaAspect;
      rec.CONJrec.retro:=false;
      rec.CONJrec.conjpatterns:=[synTHATSENT];
      rec.CONJrec.adverbial:=true;
      rec.CONJrec.temporal:=true;
      rec.CONJrec.distri:=[initial,final];
      rec.CONJrec.key := 0;
      END;
      COORD : BEGIN
rec.KEY := 0;rec.CAT := COORD;

      rec.COORDrec.kinds:=[simple];
      rec.COORDrec.iteration:=TRUE;
      rec.COORDrec.correlative2key:=0;
      rec.COORDrec.patterns:=[];
      rec.COORDrec.inducednumbers:=[plural];
      rec.COORDrec.Sintroducer:=TRUE;
      rec.COORDrec.req:=[omegapol,pospol,negpol];
      rec.COORDrec.env:=[omegapol,pospol,negpol];
      rec.COORDrec.key := 0;
      END;
      DEMADJ : BEGIN
rec.KEY := 0;rec.CAT := DEMADJ;

      rec.DEMADJrec.number:=singular;
      rec.DEMADJrec.key := 0;
      END;
      DEMPRO : BEGIN
rec.KEY := 0;rec.CAT := DEMPRO;

      rec.DEMPROrec.number:=singular;
      rec.DEMPROrec.key := 0;
      END;
      BDET : BEGIN
rec.KEY := 0;rec.CAT := BDET;

      rec.BDETrec.req:=[pospol,negpol,omegapol];
      rec.BDETrec.env:=[pospol,negpol,omegapol];
      rec.BDETrec.definite:=omegadef;
      rec.BDETrec.posspred:=false;
      rec.BDETrec.possnumbers:=[singular];
      rec.BDETrec.posscomas:=[count];
      rec.BDETrec.mood:=nowh;
      rec.BDETrec.possnietnp:=false;
      rec.BDETrec.syntquant:=omegaquant;
      rec.BDETrec.key := 0;
      END;
      DIGIT : BEGIN
rec.KEY := 0;rec.CAT := DIGIT;

      rec.DIGITrec.valeu:=0;
      rec.DIGITrec.key := 0;
      END;
      EN : BEGIN
rec.KEY := 0;rec.CAT := EN;

      rec.ENrec.key := 0;
      END;
      EMPTY : BEGIN
rec.KEY := 0;rec.CAT := EMPTY;

      rec.EMPTYrec.person:=3;
      rec.EMPTYrec.number:=singular;
      rec.EMPTYrec.gender:=omegagender;
      rec.EMPTYrec.key := 0;
      END;
      EXCLAM : BEGIN
rec.KEY := 0;rec.CAT := EXCLAM;

      rec.EXCLAMrec.key := 0;
      END;
      GEN : BEGIN
rec.KEY := 0;rec.CAT := GEN;

      rec.GENrec.key := 0;
      END;
      INDEFPRO : BEGIN
rec.KEY := 0;rec.CAT := INDEFPRO;

      rec.INDEFPROrec.req:=[pospol,negpol,omegapol];
      rec.INDEFPROrec.env:=[pospol,negpol,omegapol];
      rec.INDEFPROrec.definite:=omegadef;
      rec.INDEFPROrec.number:=singular;
      rec.INDEFPROrec.poss:=true;
      rec.INDEFPROrec.possnietNP:=false;
      rec.INDEFPROrec.syntquant:=omegaquant;
      rec.INDEFPROrec.animate:=omegaanimate;
      rec.INDEFPROrec.NPhead:=otherNP;
      rec.INDEFPROrec.key := 0;
      END;
      SUBINDEFPRO : BEGIN
rec.KEY := 0;rec.CAT := SUBINDEFPRO;

      rec.SUBINDEFPROrec.req:=[pospol,negpol,omegapol];
      rec.SUBINDEFPROrec.env:=[pospol,negpol,omegapol];
      rec.SUBINDEFPROrec.definite:=omegadef;
      rec.SUBINDEFPROrec.number:=singular;
      rec.SUBINDEFPROrec.poss:=true;
      rec.SUBINDEFPROrec.possnietNP:=false;
      rec.SUBINDEFPROrec.syntquant:=omegaquant;
      rec.SUBINDEFPROrec.animate:=omegaanimate;
      rec.SUBINDEFPROrec.NPhead:=otherNP;
      rec.SUBINDEFPROrec.key := 0;
      END;
      NEG : BEGIN
rec.KEY := 0;rec.CAT := NEG;

      rec.NEGrec.key := 0;
      END;
      BNOUNSUFF : BEGIN
rec.KEY := 0;rec.CAT := BNOUNSUFF;

      rec.BNOUNSUFFrec.req:=[pospol,negpol,omegapol];
      rec.BNOUNSUFFrec.env:=[pospol,negpol,omegapol];
      rec.BNOUNSUFFrec.plurforms:=[regplur];
      rec.BNOUNSUFFrec.genders:=[omegagender];
      rec.BNOUNSUFFrec.class:=omegaTimeAdvClass;
      rec.BNOUNSUFFrec.deixis:=omegadeixis;
      rec.BNOUNSUFFrec.aspect:=omegaAspect;
      rec.BNOUNSUFFrec.retro:=false;
      rec.BNOUNSUFFrec.sexes:=[];
      rec.BNOUNSUFFrec.subcs:=[othernoun];
      rec.BNOUNSUFFrec.temporal:=false;
      rec.BNOUNSUFFrec.animate:=omegaanimate;
      rec.BNOUNSUFFrec.human:=omegahuman;
      rec.BNOUNSUFFrec.posscomas:=[count];
      rec.BNOUNSUFFrec.thetanp:=omegathetanp;
      rec.BNOUNSUFFrec.nounpatterns:=[];
      rec.BNOUNSUFFrec.prepkey:=0;
      rec.BNOUNSUFFrec.personal:=true;
      rec.BNOUNSUFFrec.poss:=true;
      rec.BNOUNSUFFrec.key := 0;
      END;
      BNOUN : BEGIN
rec.KEY := 0;rec.CAT := BNOUN;

      rec.BNOUNrec.req:=[pospol,negpol,omegapol];
      rec.BNOUNrec.env:=[pospol,negpol,omegapol];
      rec.BNOUNrec.plurforms:=[regplur];
      rec.BNOUNrec.genders:=[omegagender];
      rec.BNOUNrec.class:=omegaTimeAdvClass;
      rec.BNOUNrec.deixis:=omegadeixis;
      rec.BNOUNrec.aspect:=omegaAspect;
      rec.BNOUNrec.retro:=false;
      rec.BNOUNrec.sexes:=[];
      rec.BNOUNrec.subcs:=[othernoun];
      rec.BNOUNrec.temporal:=false;
      rec.BNOUNrec.animate:=omegaanimate;
      rec.BNOUNrec.human:=omegahuman;
      rec.BNOUNrec.posscomas:=[count];
      rec.BNOUNrec.thetanp:=omegathetanp;
      rec.BNOUNrec.nounpatterns:=[];
      rec.BNOUNrec.prepkey:=0;
      rec.BNOUNrec.personal:=true;
      rec.BNOUNrec.poss:=true;
      rec.BNOUNrec.key := 0;
      END;
      NUM : BEGIN
rec.KEY := 0;rec.CAT := NUM;

      rec.NUMrec.numbers:=[singular];
      rec.NUMrec.key := 0;
      END;
      ORDINAL : BEGIN
rec.KEY := 0;rec.CAT := ORDINAL;

      rec.ORDINALrec.key := 0;
      END;
      PART : BEGIN
rec.KEY := 0;rec.CAT := PART;

      rec.PARTrec.key := 0;
      END;
      BPERSPRO : BEGIN
rec.KEY := 0;rec.CAT := BPERSPRO;

      rec.BPERSPROrec.person:=3;
      rec.BPERSPROrec.number:=singular;
      rec.BPERSPROrec.gender:=omegagender;
      rec.BPERSPROrec.animate:=omegaanimate;
      rec.BPERSPROrec.predpos:=true;
      rec.BPERSPROrec.NPhead:=persproNP;
      rec.BPERSPROrec.key := 0;
      END;
      POS : BEGIN
rec.KEY := 0;rec.CAT := POS;

      rec.POSrec.key := 0;
      END;
      BPREFIX : BEGIN
rec.KEY := 0;rec.CAT := BPREFIX;

      rec.BPREFIXrec.heads:=[nounhead];
      rec.BPREFIXrec.key := 0;
      END;
      SUBPREP : BEGIN
rec.KEY := 0;rec.CAT := SUBPREP;

      rec.SUBPREPrec.req:=[pospol,negpol,omegapol];
      rec.SUBPREPrec.env:=[pospol,negpol,omegapol];
      rec.SUBPREPrec.subcs:=[];
      rec.SUBPREPrec.synpps:=[synNP];
      rec.SUBPREPrec.thetapp:=omegathetapp;
      rec.SUBPREPrec.class:=omegaTimeAdvClass;
      rec.SUBPREPrec.deixis:=omegadeixis;
      rec.SUBPREPrec.aspect:=omegaAspect;
      rec.SUBPREPrec.retro:=false;
      rec.SUBPREPrec.secondprep:=0;
      rec.SUBPREPrec.key := 0;
      END;
      PREP : BEGIN
rec.KEY := 0;rec.CAT := PREP;

      rec.PREPrec.req:=[pospol,negpol,omegapol];
      rec.PREPrec.env:=[pospol,negpol,omegapol];
      rec.PREPrec.subcs:=[];
      rec.PREPrec.synpps:=[synNP];
      rec.PREPrec.thetapp:=omegathetapp;
      rec.PREPrec.class:=omegaTimeAdvClass;
      rec.PREPrec.deixis:=omegadeixis;
      rec.PREPrec.aspect:=omegaAspect;
      rec.PREPrec.retro:=false;
      rec.PREPrec.secondprep:=0;
      rec.PREPrec.key := 0;
      END;
      BPROPERNOUN : BEGIN
rec.KEY := 0;rec.CAT := BPROPERNOUN;

      rec.BPROPERNOUNrec.plurforms:=[regplur];
      rec.BPROPERNOUNrec.sexes:=[];
      rec.BPROPERNOUNrec.subc:=firstname;
      rec.BPROPERNOUNrec.animate:=omegaanimate;
      rec.BPROPERNOUNrec.human:=omegahuman;
      rec.BPROPERNOUNrec.genders:=[omegagender];
      rec.BPROPERNOUNrec.poss:=true;
      rec.BPROPERNOUNrec.temporal:=false;
      rec.BPROPERNOUNrec.class:=omegaTimeAdvClass;
      rec.BPROPERNOUNrec.deixis:=omegadeixis;
      rec.BPROPERNOUNrec.aspect:=omegaAspect;
      rec.BPROPERNOUNrec.retro:=false;
      rec.BPROPERNOUNrec.key := 0;
      END;
      PROSENT : BEGIN
rec.KEY := 0;rec.CAT := PROSENT;

      rec.PROSENTrec.neg:=false;
      rec.PROSENTrec.so:=false;
      rec.PROSENTrec.key := 0;
      END;
      PUNC : BEGIN
rec.KEY := 0;rec.CAT := PUNC;

      rec.PUNCrec.key := 0;
      END;
      Q : BEGIN
rec.KEY := 0;rec.CAT := Q;

      rec.Qrec.req:=[pospol,negpol,omegapol];
      rec.Qrec.env:=[pospol,negpol,omegapol];
      rec.Qrec.definite:=omegadef;
      rec.Qrec.posspred:=false;
      rec.Qrec.possnumbers:=[singular];
      rec.Qrec.posscomas:=[count];
      rec.Qrec.mood:=nowh;
      rec.Qrec.thanas:=omegacompl;
      rec.Qrec.hop:=false;
      rec.Qrec.key := 0;
      END;
      RECIPRO : BEGIN
rec.KEY := 0;rec.CAT := RECIPRO;

      rec.RECIPROrec.antecedent:=noant;
      rec.RECIPROrec.one:=false;
      rec.RECIPROrec.key := 0;
      END;
      REFLPRO : BEGIN
rec.KEY := 0;rec.CAT := REFLPRO;

      rec.REFLPROrec.antecedent:=noant;
      rec.REFLPROrec.number:=singular;
      rec.REFLPROrec.person:=3;
      rec.REFLPROrec.gender:=omegagender;
      rec.REFLPROrec.one:=false;
      rec.REFLPROrec.key := 0;
      END;
      RELPRO : BEGIN
rec.KEY := 0;rec.CAT := RELPRO;

      rec.RELPROrec.key := 0;
      END;
      TOCAT : BEGIN
rec.KEY := 0;rec.CAT := TOCAT;

      rec.TOCATrec.key := 0;
      END;
      THANAS : BEGIN
rec.KEY := 0;rec.CAT := THANAS;

      rec.THANASrec.key := 0;
      END;
      THERE : BEGIN
rec.KEY := 0;rec.CAT := THERE;

      rec.THERErec.key := 0;
      END;
      BVERBSUFF : BEGIN
rec.KEY := 0;rec.CAT := BVERBSUFF;

      rec.BVERBSUFFrec.req:=[pospol,negpol,omegapol];
      rec.BVERBSUFFrec.env:=[pospol,negpol,omegapol];
      rec.BVERBSUFFrec.conjclasses:=[10];
      rec.BVERBSUFFrec.ingform:=reging;
      rec.BVERBSUFFrec.sform:=regS;
      rec.BVERBSUFFrec.particle:=0;
      rec.BVERBSUFFrec.possvoices:=[active,passive];
      rec.BVERBSUFFrec.reflexivity:=notreflexive;
      rec.BVERBSUFFrec.synvps:=[];
      rec.BVERBSUFFrec.thetavp:=omegathetavp;
      rec.BVERBSUFFrec.adjuncts:=[];
      rec.BVERBSUFFrec.CaseAssigner:=true;
      rec.BVERBSUFFrec.subc:=mainverb;
      rec.BVERBSUFFrec.oblcontrol:=omegaoblcontrol;
      rec.BVERBSUFFrec.prepkey1:=0;
      rec.BVERBSUFFrec.prepkey2:=0;
      rec.BVERBSUFFrec.controller:=none;
      rec.BVERBSUFFrec.classes:=[durativeclass];
      rec.BVERBSUFFrec.thatdel:=omegadel;
      rec.BVERBSUFFrec.key := 0;
      END;
      BVERB : BEGIN
rec.KEY := 0;rec.CAT := BVERB;

      rec.BVERBrec.req:=[pospol,negpol,omegapol];
      rec.BVERBrec.env:=[pospol,negpol,omegapol];
      rec.BVERBrec.conjclasses:=[10];
      rec.BVERBrec.ingform:=reging;
      rec.BVERBrec.sform:=regS;
      rec.BVERBrec.particle:=0;
      rec.BVERBrec.possvoices:=[active,passive];
      rec.BVERBrec.reflexivity:=notreflexive;
      rec.BVERBrec.synvps:=[];
      rec.BVERBrec.thetavp:=omegathetavp;
      rec.BVERBrec.adjuncts:=[];
      rec.BVERBrec.CaseAssigner:=true;
      rec.BVERBrec.subc:=mainverb;
      rec.BVERBrec.oblcontrol:=omegaoblcontrol;
      rec.BVERBrec.prepkey1:=0;
      rec.BVERBrec.prepkey2:=0;
      rec.BVERBrec.controller:=none;
      rec.BVERBrec.classes:=[durativeclass];
      rec.BVERBrec.thatdel:=omegadel;
      rec.BVERBrec.key := 0;
      END;
      BWHPRO : BEGIN
rec.KEY := 0;rec.CAT := BWHPRO;

      rec.BWHPROrec.animate:=omegaanimate;
      rec.BWHPROrec.poss:=true;
      rec.BWHPROrec.whcase:=true;
      rec.BWHPROrec.number:=omeganumber;
      rec.BWHPROrec.sexes:=[];
      rec.BWHPROrec.key := 0;
      END;
      WHPRO : BEGIN
rec.KEY := 0;rec.CAT := WHPRO;

      rec.WHPROrec.animate:=omegaanimate;
      rec.WHPROrec.poss:=true;
      rec.WHPROrec.whcase:=true;
      rec.WHPROrec.number:=omeganumber;
      rec.WHPROrec.sexes:=[];
      rec.WHPROrec.cases:=[];
      rec.WHPROrec.key := 0;
      END;
      SFCAT : BEGIN
rec.KEY := 0;rec.CAT := SFCAT;

      rec.SFCATrec.key := 0;
      END;
      PFCAT : BEGIN
rec.KEY := 0;rec.CAT := PFCAT;

      rec.PFCATrec.key := 0;
      END;
   END;
END {MAKET_BLEXSTRUCT};

FUNCTION MAKET_Stree(cat:LSDOMAINT_syntcat): LSSTREE_pStree;
VAR t: LSSTREE_pStree;
BEGIN
   CASE cat OF
BADJSUFF: BEGIN
         LISTREE_MakeStree(LoopHoles.Retype(t,LISTREE_pStree)); t^.cat := BADJSUFF;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_LSRecord),LoopHoles.Retype(t^.LS,Mem_Ptr)); t^.LS^.cat := BADJSUFF;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_BADJrecord), Loopholes.Retype(t^.LS^.BADJSUFFfield,Mem_Ptr));
         MAKET_BADJSUFFrec(t^.LS^.BADJSUFFfield^);
      END;
BADJ: BEGIN
         LISTREE_MakeStree(LoopHoles.Retype(t,LISTREE_pStree)); t^.cat := BADJ;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_LSRecord),LoopHoles.Retype(t^.LS,Mem_Ptr)); t^.LS^.cat := BADJ;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_BADJrecord), Loopholes.Retype(t^.LS^.BADJfield,Mem_Ptr));
         MAKET_BADJrec(t^.LS^.BADJfield^);
      END;
SUBADJ: BEGIN
         LISTREE_MakeStree(LoopHoles.Retype(t,LISTREE_pStree)); t^.cat := SUBADJ;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_LSRecord),LoopHoles.Retype(t^.LS,Mem_Ptr)); t^.LS^.cat := SUBADJ;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_SUBADJrecord), Loopholes.Retype(t^.LS^.SUBADJfield,Mem_Ptr));
         MAKET_SUBADJrec(t^.LS^.SUBADJfield^);
      END;
ADJ: BEGIN
         LISTREE_MakeStree(LoopHoles.Retype(t,LISTREE_pStree)); t^.cat := ADJ;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_LSRecord),LoopHoles.Retype(t^.LS,Mem_Ptr)); t^.LS^.cat := ADJ;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_ADJrecord), Loopholes.Retype(t^.LS^.ADJfield,Mem_Ptr));
         MAKET_ADJrec(t^.LS^.ADJfield^);
      END;
ADJP: BEGIN
         LISTREE_MakeStree(LoopHoles.Retype(t,LISTREE_pStree)); t^.cat := ADJP;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_LSRecord),LoopHoles.Retype(t^.LS,Mem_Ptr)); t^.LS^.cat := ADJP;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_ADJPrecord), Loopholes.Retype(t^.LS^.ADJPfield,Mem_Ptr));
         MAKET_ADJPrec(t^.LS^.ADJPfield^);
      END;
ADJPPROP: BEGIN
         LISTREE_MakeStree(LoopHoles.Retype(t,LISTREE_pStree)); t^.cat := ADJPPROP;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_LSRecord),LoopHoles.Retype(t^.LS,Mem_Ptr)); t^.LS^.cat := ADJPPROP;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_ADJPPROPrecord), Loopholes.Retype(t^.LS^.ADJPPROPfield,Mem_Ptr));
         MAKET_ADJPPROPrec(t^.LS^.ADJPPROPfield^);
      END;
ADJPFORMULA: BEGIN
         LISTREE_MakeStree(LoopHoles.Retype(t,LISTREE_pStree)); t^.cat := ADJPFORMULA;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_LSRecord),LoopHoles.Retype(t^.LS,Mem_Ptr)); t^.LS^.cat := ADJPFORMULA;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_ADJPPROPrecord), Loopholes.Retype(t^.LS^.ADJPFORMULAfield,Mem_Ptr));
         MAKET_ADJPFORMULArec(t^.LS^.ADJPFORMULAfield^);
      END;
OPENADJPPROP: BEGIN
         LISTREE_MakeStree(LoopHoles.Retype(t,LISTREE_pStree)); t^.cat := OPENADJPPROP;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_LSRecord),LoopHoles.Retype(t^.LS,Mem_Ptr)); t^.LS^.cat := OPENADJPPROP;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_ADJPPROPrecord), Loopholes.Retype(t^.LS^.OPENADJPPROPfield,Mem_Ptr));
         MAKET_OPENADJPPROPrec(t^.LS^.OPENADJPPROPfield^);
      END;
CLOSEDADJPPROP: BEGIN
         LISTREE_MakeStree(LoopHoles.Retype(t,LISTREE_pStree)); t^.cat := CLOSEDADJPPROP;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_LSRecord),LoopHoles.Retype(t^.LS,Mem_Ptr)); t^.LS^.cat := CLOSEDADJPPROP;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_ADJPPROPrecord), Loopholes.Retype(t^.LS^.CLOSEDADJPPROPfield,Mem_Ptr));
         MAKET_CLOSEDADJPPROPrec(t^.LS^.CLOSEDADJPPROPfield^);
      END;
BADVSUFF: BEGIN
         LISTREE_MakeStree(LoopHoles.Retype(t,LISTREE_pStree)); t^.cat := BADVSUFF;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_LSRecord),LoopHoles.Retype(t^.LS,Mem_Ptr)); t^.LS^.cat := BADVSUFF;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_BADVrecord), Loopholes.Retype(t^.LS^.BADVSUFFfield,Mem_Ptr));
         MAKET_BADVSUFFrec(t^.LS^.BADVSUFFfield^);
      END;
BADV: BEGIN
         LISTREE_MakeStree(LoopHoles.Retype(t,LISTREE_pStree)); t^.cat := BADV;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_LSRecord),LoopHoles.Retype(t^.LS,Mem_Ptr)); t^.LS^.cat := BADV;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_BADVrecord), Loopholes.Retype(t^.LS^.BADVfield,Mem_Ptr));
         MAKET_BADVrec(t^.LS^.BADVfield^);
      END;
SUBADV: BEGIN
         LISTREE_MakeStree(LoopHoles.Retype(t,LISTREE_pStree)); t^.cat := SUBADV;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_LSRecord),LoopHoles.Retype(t^.LS,Mem_Ptr)); t^.LS^.cat := SUBADV;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_SUBADVrecord), Loopholes.Retype(t^.LS^.SUBADVfield,Mem_Ptr));
         MAKET_SUBADVrec(t^.LS^.SUBADVfield^);
      END;
ADV: BEGIN
         LISTREE_MakeStree(LoopHoles.Retype(t,LISTREE_pStree)); t^.cat := ADV;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_LSRecord),LoopHoles.Retype(t^.LS,Mem_Ptr)); t^.LS^.cat := ADV;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_ADVrecord), Loopholes.Retype(t^.LS^.ADVfield,Mem_Ptr));
         MAKET_ADVrec(t^.LS^.ADVfield^);
      END;
ADVP: BEGIN
         LISTREE_MakeStree(LoopHoles.Retype(t,LISTREE_pStree)); t^.cat := ADVP;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_LSRecord),LoopHoles.Retype(t^.LS,Mem_Ptr)); t^.LS^.cat := ADVP;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_ADVPrecord), Loopholes.Retype(t^.LS^.ADVPfield,Mem_Ptr));
         MAKET_ADVPrec(t^.LS^.ADVPfield^);
      END;
ADVPPROP: BEGIN
         LISTREE_MakeStree(LoopHoles.Retype(t,LISTREE_pStree)); t^.cat := ADVPPROP;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_LSRecord),LoopHoles.Retype(t^.LS,Mem_Ptr)); t^.LS^.cat := ADVPPROP;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_ADVPPROPrecord), Loopholes.Retype(t^.LS^.ADVPPROPfield,Mem_Ptr));
         MAKET_ADVPPROPrec(t^.LS^.ADVPPROPfield^);
      END;
ADVPFORMULA: BEGIN
         LISTREE_MakeStree(LoopHoles.Retype(t,LISTREE_pStree)); t^.cat := ADVPFORMULA;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_LSRecord),LoopHoles.Retype(t^.LS,Mem_Ptr)); t^.LS^.cat := ADVPFORMULA;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_ADVPPROPrecord), Loopholes.Retype(t^.LS^.ADVPFORMULAfield,Mem_Ptr));
         MAKET_ADVPFORMULArec(t^.LS^.ADVPFORMULAfield^);
      END;
OPENADVPPROP: BEGIN
         LISTREE_MakeStree(LoopHoles.Retype(t,LISTREE_pStree)); t^.cat := OPENADVPPROP;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_LSRecord),LoopHoles.Retype(t^.LS,Mem_Ptr)); t^.LS^.cat := OPENADVPPROP;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_ADVPPROPrecord), Loopholes.Retype(t^.LS^.OPENADVPPROPfield,Mem_Ptr));
         MAKET_OPENADVPPROPrec(t^.LS^.OPENADVPPROPfield^);
      END;
CLOSEDADVPPROP: BEGIN
         LISTREE_MakeStree(LoopHoles.Retype(t,LISTREE_pStree)); t^.cat := CLOSEDADVPPROP;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_LSRecord),LoopHoles.Retype(t^.LS,Mem_Ptr)); t^.LS^.cat := CLOSEDADVPPROP;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_ADVPPROPrecord), Loopholes.Retype(t^.LS^.CLOSEDADVPPROPfield,Mem_Ptr));
         MAKET_CLOSEDADVPPROPrec(t^.LS^.CLOSEDADVPPROPfield^);
      END;
ART: BEGIN
         LISTREE_MakeStree(LoopHoles.Retype(t,LISTREE_pStree)); t^.cat := ART;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_LSRecord),LoopHoles.Retype(t^.LS,Mem_Ptr)); t^.LS^.cat := ART;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_ARTrecord), Loopholes.Retype(t^.LS^.ARTfield,Mem_Ptr));
         MAKET_ARTrec(t^.LS^.ARTfield^);
      END;
ASP: BEGIN
         LISTREE_MakeStree(LoopHoles.Retype(t,LISTREE_pStree)); t^.cat := ASP;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_LSRecord),LoopHoles.Retype(t^.LS,Mem_Ptr)); t^.LS^.cat := ASP;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_ASPrecord), Loopholes.Retype(t^.LS^.ASPfield,Mem_Ptr));
         MAKET_ASPrec(t^.LS^.ASPfield^);
      END;
BBIGPRO: BEGIN
         LISTREE_MakeStree(LoopHoles.Retype(t,LISTREE_pStree)); t^.cat := BBIGPRO;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_LSRecord),LoopHoles.Retype(t^.LS,Mem_Ptr)); t^.LS^.cat := BBIGPRO;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_BPERSPROrecord), Loopholes.Retype(t^.LS^.BBIGPROfield,Mem_Ptr));
         MAKET_BBIGPROrec(t^.LS^.BBIGPROfield^);
      END;
BIGPRO: BEGIN
         LISTREE_MakeStree(LoopHoles.Retype(t,LISTREE_pStree)); t^.cat := BIGPRO;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_LSRecord),LoopHoles.Retype(t^.LS,Mem_Ptr)); t^.LS^.cat := BIGPRO;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_BIGPROrecord), Loopholes.Retype(t^.LS^.BIGPROfield,Mem_Ptr));
         MAKET_BIGPROrec(t^.LS^.BIGPROfield^);
      END;
BIRRPREF: BEGIN
         LISTREE_MakeStree(LoopHoles.Retype(t,LISTREE_pStree)); t^.cat := BIRRPREF;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_LSRecord),LoopHoles.Retype(t^.LS,Mem_Ptr)); t^.LS^.cat := BIRRPREF;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_BIRRPREFrecord), Loopholes.Retype(t^.LS^.BIRRPREFfield,Mem_Ptr));
         MAKET_BIRRPREFrec(t^.LS^.BIRRPREFfield^);
      END;
CARD: BEGIN
         LISTREE_MakeStree(LoopHoles.Retype(t,LISTREE_pStree)); t^.cat := CARD;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_LSRecord),LoopHoles.Retype(t^.LS,Mem_Ptr)); t^.LS^.cat := CARD;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_CARDrecord), Loopholes.Retype(t^.LS^.CARDfield,Mem_Ptr));
         MAKET_CARDrec(t^.LS^.CARDfield^);
      END;
CLAUSE: BEGIN
         LISTREE_MakeStree(LoopHoles.Retype(t,LISTREE_pStree)); t^.cat := CLAUSE;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_LSRecord),LoopHoles.Retype(t^.LS,Mem_Ptr)); t^.LS^.cat := CLAUSE;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_CLAUSErecord), Loopholes.Retype(t^.LS^.CLAUSEfield,Mem_Ptr));
         MAKET_CLAUSErec(t^.LS^.CLAUSEfield^);
      END;
CONJ: BEGIN
         LISTREE_MakeStree(LoopHoles.Retype(t,LISTREE_pStree)); t^.cat := CONJ;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_LSRecord),LoopHoles.Retype(t^.LS,Mem_Ptr)); t^.LS^.cat := CONJ;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_CONJrecord), Loopholes.Retype(t^.LS^.CONJfield,Mem_Ptr));
         MAKET_CONJrec(t^.LS^.CONJfield^);
      END;
COORD: BEGIN
         LISTREE_MakeStree(LoopHoles.Retype(t,LISTREE_pStree)); t^.cat := COORD;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_LSRecord),LoopHoles.Retype(t^.LS,Mem_Ptr)); t^.LS^.cat := COORD;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_COORDrecord), Loopholes.Retype(t^.LS^.COORDfield,Mem_Ptr));
         MAKET_COORDrec(t^.LS^.COORDfield^);
      END;
DEMADJ: BEGIN
         LISTREE_MakeStree(LoopHoles.Retype(t,LISTREE_pStree)); t^.cat := DEMADJ;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_LSRecord),LoopHoles.Retype(t^.LS,Mem_Ptr)); t^.LS^.cat := DEMADJ;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_DEMADJrecord), Loopholes.Retype(t^.LS^.DEMADJfield,Mem_Ptr));
         MAKET_DEMADJrec(t^.LS^.DEMADJfield^);
      END;
DEMPRO: BEGIN
         LISTREE_MakeStree(LoopHoles.Retype(t,LISTREE_pStree)); t^.cat := DEMPRO;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_LSRecord),LoopHoles.Retype(t^.LS,Mem_Ptr)); t^.LS^.cat := DEMPRO;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_DEMPROrecord), Loopholes.Retype(t^.LS^.DEMPROfield,Mem_Ptr));
         MAKET_DEMPROrec(t^.LS^.DEMPROfield^);
      END;
BDET: BEGIN
         LISTREE_MakeStree(LoopHoles.Retype(t,LISTREE_pStree)); t^.cat := BDET;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_LSRecord),LoopHoles.Retype(t^.LS,Mem_Ptr)); t^.LS^.cat := BDET;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_BDETrecord), Loopholes.Retype(t^.LS^.BDETfield,Mem_Ptr));
         MAKET_BDETrec(t^.LS^.BDETfield^);
      END;
DET: BEGIN
         LISTREE_MakeStree(LoopHoles.Retype(t,LISTREE_pStree)); t^.cat := DET;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_LSRecord),LoopHoles.Retype(t^.LS,Mem_Ptr)); t^.LS^.cat := DET;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_DETrecord), Loopholes.Retype(t^.LS^.DETfield,Mem_Ptr));
         MAKET_DETrec(t^.LS^.DETfield^);
      END;
DETP: BEGIN
         LISTREE_MakeStree(LoopHoles.Retype(t,LISTREE_pStree)); t^.cat := DETP;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_LSRecord),LoopHoles.Retype(t^.LS,Mem_Ptr)); t^.LS^.cat := DETP;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_DETPrecord), Loopholes.Retype(t^.LS^.DETPfield,Mem_Ptr));
         MAKET_DETPrec(t^.LS^.DETPfield^);
      END;
DIGIT: BEGIN
         LISTREE_MakeStree(LoopHoles.Retype(t,LISTREE_pStree)); t^.cat := DIGIT;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_LSRecord),LoopHoles.Retype(t^.LS,Mem_Ptr)); t^.LS^.cat := DIGIT;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_DIGITrecord), Loopholes.Retype(t^.LS^.DIGITfield,Mem_Ptr));
         MAKET_DIGITrec(t^.LS^.DIGITfield^);
      END;
EN: BEGIN
         LISTREE_MakeStree(LoopHoles.Retype(t,LISTREE_pStree)); t^.cat := EN;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_LSRecord),LoopHoles.Retype(t^.LS,Mem_Ptr)); t^.LS^.cat := EN;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_ENrecord), Loopholes.Retype(t^.LS^.ENfield,Mem_Ptr));
         MAKET_ENrec(t^.LS^.ENfield^);
      END;
EMPTY: BEGIN
         LISTREE_MakeStree(LoopHoles.Retype(t,LISTREE_pStree)); t^.cat := EMPTY;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_LSRecord),LoopHoles.Retype(t^.LS,Mem_Ptr)); t^.LS^.cat := EMPTY;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_EMPTYrecord), Loopholes.Retype(t^.LS^.EMPTYfield,Mem_Ptr));
         MAKET_EMPTYrec(t^.LS^.EMPTYfield^);
      END;
EXCLAM: BEGIN
         LISTREE_MakeStree(LoopHoles.Retype(t,LISTREE_pStree)); t^.cat := EXCLAM;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_LSRecord),LoopHoles.Retype(t^.LS,Mem_Ptr)); t^.LS^.cat := EXCLAM;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_EXCLAMrecord), Loopholes.Retype(t^.LS^.EXCLAMfield,Mem_Ptr));
         MAKET_EXCLAMrec(t^.LS^.EXCLAMfield^);
      END;
GEN: BEGIN
         LISTREE_MakeStree(LoopHoles.Retype(t,LISTREE_pStree)); t^.cat := GEN;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_LSRecord),LoopHoles.Retype(t^.LS,Mem_Ptr)); t^.LS^.cat := GEN;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_GENrecord), Loopholes.Retype(t^.LS^.GENfield,Mem_Ptr));
         MAKET_GENrec(t^.LS^.GENfield^);
      END;
INDEFPRO: BEGIN
         LISTREE_MakeStree(LoopHoles.Retype(t,LISTREE_pStree)); t^.cat := INDEFPRO;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_LSRecord),LoopHoles.Retype(t^.LS,Mem_Ptr)); t^.LS^.cat := INDEFPRO;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_INDEFPROrecord), Loopholes.Retype(t^.LS^.INDEFPROfield,Mem_Ptr));
         MAKET_INDEFPROrec(t^.LS^.INDEFPROfield^);
      END;
SUBINDEFPRO: BEGIN
         LISTREE_MakeStree(LoopHoles.Retype(t,LISTREE_pStree)); t^.cat := SUBINDEFPRO;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_LSRecord),LoopHoles.Retype(t^.LS,Mem_Ptr)); t^.LS^.cat := SUBINDEFPRO;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_INDEFPROrecord), Loopholes.Retype(t^.LS^.SUBINDEFPROfield,Mem_Ptr));
         MAKET_SUBINDEFPROrec(t^.LS^.SUBINDEFPROfield^);
      END;
NEG: BEGIN
         LISTREE_MakeStree(LoopHoles.Retype(t,LISTREE_pStree)); t^.cat := NEG;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_LSRecord),LoopHoles.Retype(t^.LS,Mem_Ptr)); t^.LS^.cat := NEG;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_NEGrecord), Loopholes.Retype(t^.LS^.NEGfield,Mem_Ptr));
         MAKET_NEGrec(t^.LS^.NEGfield^);
      END;
BNOUNSUFF: BEGIN
         LISTREE_MakeStree(LoopHoles.Retype(t,LISTREE_pStree)); t^.cat := BNOUNSUFF;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_LSRecord),LoopHoles.Retype(t^.LS,Mem_Ptr)); t^.LS^.cat := BNOUNSUFF;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_BNOUNrecord), Loopholes.Retype(t^.LS^.BNOUNSUFFfield,Mem_Ptr));
         MAKET_BNOUNSUFFrec(t^.LS^.BNOUNSUFFfield^);
      END;
BNOUN: BEGIN
         LISTREE_MakeStree(LoopHoles.Retype(t,LISTREE_pStree)); t^.cat := BNOUN;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_LSRecord),LoopHoles.Retype(t^.LS,Mem_Ptr)); t^.LS^.cat := BNOUN;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_BNOUNrecord), Loopholes.Retype(t^.LS^.BNOUNfield,Mem_Ptr));
         MAKET_BNOUNrec(t^.LS^.BNOUNfield^);
      END;
SUBNOUN: BEGIN
         LISTREE_MakeStree(LoopHoles.Retype(t,LISTREE_pStree)); t^.cat := SUBNOUN;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_LSRecord),LoopHoles.Retype(t^.LS,Mem_Ptr)); t^.LS^.cat := SUBNOUN;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_SUBNOUNrecord), Loopholes.Retype(t^.LS^.SUBNOUNfield,Mem_Ptr));
         MAKET_SUBNOUNrec(t^.LS^.SUBNOUNfield^);
      END;
NOUN: BEGIN
         LISTREE_MakeStree(LoopHoles.Retype(t,LISTREE_pStree)); t^.cat := NOUN;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_LSRecord),LoopHoles.Retype(t^.LS,Mem_Ptr)); t^.LS^.cat := NOUN;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_NOUNrecord), Loopholes.Retype(t^.LS^.NOUNfield,Mem_Ptr));
         MAKET_NOUNrec(t^.LS^.NOUNfield^);
      END;
CN: BEGIN
         LISTREE_MakeStree(LoopHoles.Retype(t,LISTREE_pStree)); t^.cat := CN;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_LSRecord),LoopHoles.Retype(t^.LS,Mem_Ptr)); t^.LS^.cat := CN;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_CNrecord), Loopholes.Retype(t^.LS^.CNfield,Mem_Ptr));
         MAKET_CNrec(t^.LS^.CNfield^);
      END;
NP: BEGIN
         LISTREE_MakeStree(LoopHoles.Retype(t,LISTREE_pStree)); t^.cat := NP;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_LSRecord),LoopHoles.Retype(t^.LS,Mem_Ptr)); t^.LS^.cat := NP;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_NPrecord), Loopholes.Retype(t^.LS^.NPfield,Mem_Ptr));
         MAKET_NPrec(t^.LS^.NPfield^);
      END;
VARNP: BEGIN
         LISTREE_MakeStree(LoopHoles.Retype(t,LISTREE_pStree)); t^.cat := VARNP;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_LSRecord),LoopHoles.Retype(t^.LS,Mem_Ptr)); t^.LS^.cat := VARNP;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_NPrecord), Loopholes.Retype(t^.LS^.VARNPfield,Mem_Ptr));
         MAKET_VARNPrec(t^.LS^.VARNPfield^);
      END;
NPPROP: BEGIN
         LISTREE_MakeStree(LoopHoles.Retype(t,LISTREE_pStree)); t^.cat := NPPROP;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_LSRecord),LoopHoles.Retype(t^.LS,Mem_Ptr)); t^.LS^.cat := NPPROP;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_NPPROPrecord), Loopholes.Retype(t^.LS^.NPPROPfield,Mem_Ptr));
         MAKET_NPPROPrec(t^.LS^.NPPROPfield^);
      END;
NPFORMULA: BEGIN
         LISTREE_MakeStree(LoopHoles.Retype(t,LISTREE_pStree)); t^.cat := NPFORMULA;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_LSRecord),LoopHoles.Retype(t^.LS,Mem_Ptr)); t^.LS^.cat := NPFORMULA;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_NPPROPrecord), Loopholes.Retype(t^.LS^.NPFORMULAfield,Mem_Ptr));
         MAKET_NPFORMULArec(t^.LS^.NPFORMULAfield^);
      END;
OPENNPPROP: BEGIN
         LISTREE_MakeStree(LoopHoles.Retype(t,LISTREE_pStree)); t^.cat := OPENNPPROP;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_LSRecord),LoopHoles.Retype(t^.LS,Mem_Ptr)); t^.LS^.cat := OPENNPPROP;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_NPPROPrecord), Loopholes.Retype(t^.LS^.OPENNPPROPfield,Mem_Ptr));
         MAKET_OPENNPPROPrec(t^.LS^.OPENNPPROPfield^);
      END;
CLOSEDNPPROP: BEGIN
         LISTREE_MakeStree(LoopHoles.Retype(t,LISTREE_pStree)); t^.cat := CLOSEDNPPROP;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_LSRecord),LoopHoles.Retype(t^.LS,Mem_Ptr)); t^.LS^.cat := CLOSEDNPPROP;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_NPPROPrecord), Loopholes.Retype(t^.LS^.CLOSEDNPPROPfield,Mem_Ptr));
         MAKET_CLOSEDNPPROPrec(t^.LS^.CLOSEDNPPROPfield^);
      END;
NUM: BEGIN
         LISTREE_MakeStree(LoopHoles.Retype(t,LISTREE_pStree)); t^.cat := NUM;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_LSRecord),LoopHoles.Retype(t^.LS,Mem_Ptr)); t^.LS^.cat := NUM;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_NUMrecord), Loopholes.Retype(t^.LS^.NUMfield,Mem_Ptr));
         MAKET_NUMrec(t^.LS^.NUMfield^);
      END;
ORDINAL: BEGIN
         LISTREE_MakeStree(LoopHoles.Retype(t,LISTREE_pStree)); t^.cat := ORDINAL;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_LSRecord),LoopHoles.Retype(t^.LS,Mem_Ptr)); t^.LS^.cat := ORDINAL;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_ORDINALrecord), Loopholes.Retype(t^.LS^.ORDINALfield,Mem_Ptr));
         MAKET_ORDINALrec(t^.LS^.ORDINALfield^);
      END;
PART: BEGIN
         LISTREE_MakeStree(LoopHoles.Retype(t,LISTREE_pStree)); t^.cat := PART;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_LSRecord),LoopHoles.Retype(t^.LS,Mem_Ptr)); t^.LS^.cat := PART;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_PARTICLErecord), Loopholes.Retype(t^.LS^.PARTfield,Mem_Ptr));
         MAKET_PARTrec(t^.LS^.PARTfield^);
      END;
BPERSPRO: BEGIN
         LISTREE_MakeStree(LoopHoles.Retype(t,LISTREE_pStree)); t^.cat := BPERSPRO;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_LSRecord),LoopHoles.Retype(t^.LS,Mem_Ptr)); t^.LS^.cat := BPERSPRO;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_BPERSPROrecord), Loopholes.Retype(t^.LS^.BPERSPROfield,Mem_Ptr));
         MAKET_BPERSPROrec(t^.LS^.BPERSPROfield^);
      END;
PERSPRO: BEGIN
         LISTREE_MakeStree(LoopHoles.Retype(t,LISTREE_pStree)); t^.cat := PERSPRO;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_LSRecord),LoopHoles.Retype(t^.LS,Mem_Ptr)); t^.LS^.cat := PERSPRO;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_PERSPROrecord), Loopholes.Retype(t^.LS^.PERSPROfield,Mem_Ptr));
         MAKET_PERSPROrec(t^.LS^.PERSPROfield^);
      END;
POS: BEGIN
         LISTREE_MakeStree(LoopHoles.Retype(t,LISTREE_pStree)); t^.cat := POS;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_LSRecord),LoopHoles.Retype(t^.LS,Mem_Ptr)); t^.LS^.cat := POS;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_POSrecord), Loopholes.Retype(t^.LS^.POSfield,Mem_Ptr));
         MAKET_POSrec(t^.LS^.POSfield^);
      END;
POSSADJ: BEGIN
         LISTREE_MakeStree(LoopHoles.Retype(t,LISTREE_pStree)); t^.cat := POSSADJ;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_LSRecord),LoopHoles.Retype(t^.LS,Mem_Ptr)); t^.LS^.cat := POSSADJ;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_POSSADJrecord), Loopholes.Retype(t^.LS^.POSSADJfield,Mem_Ptr));
         MAKET_POSSADJrec(t^.LS^.POSSADJfield^);
      END;
POSSPRO: BEGIN
         LISTREE_MakeStree(LoopHoles.Retype(t,LISTREE_pStree)); t^.cat := POSSPRO;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_LSRecord),LoopHoles.Retype(t^.LS,Mem_Ptr)); t^.LS^.cat := POSSPRO;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_POSSPROrecord), Loopholes.Retype(t^.LS^.POSSPROfield,Mem_Ptr));
         MAKET_POSSPROrec(t^.LS^.POSSPROfield^);
      END;
BPREFIX: BEGIN
         LISTREE_MakeStree(LoopHoles.Retype(t,LISTREE_pStree)); t^.cat := BPREFIX;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_LSRecord),LoopHoles.Retype(t^.LS,Mem_Ptr)); t^.LS^.cat := BPREFIX;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_BPREFIXrecord), Loopholes.Retype(t^.LS^.BPREFIXfield,Mem_Ptr));
         MAKET_BPREFIXrec(t^.LS^.BPREFIXfield^);
      END;
SUBPREP: BEGIN
         LISTREE_MakeStree(LoopHoles.Retype(t,LISTREE_pStree)); t^.cat := SUBPREP;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_LSRecord),LoopHoles.Retype(t^.LS,Mem_Ptr)); t^.LS^.cat := SUBPREP;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_PREPrecord), Loopholes.Retype(t^.LS^.SUBPREPfield,Mem_Ptr));
         MAKET_SUBPREPrec(t^.LS^.SUBPREPfield^);
      END;
PREP: BEGIN
         LISTREE_MakeStree(LoopHoles.Retype(t,LISTREE_pStree)); t^.cat := PREP;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_LSRecord),LoopHoles.Retype(t^.LS,Mem_Ptr)); t^.LS^.cat := PREP;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_PREPrecord), Loopholes.Retype(t^.LS^.PREPfield,Mem_Ptr));
         MAKET_PREPrec(t^.LS^.PREPfield^);
      END;
PREPP: BEGIN
         LISTREE_MakeStree(LoopHoles.Retype(t,LISTREE_pStree)); t^.cat := PREPP;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_LSRecord),LoopHoles.Retype(t^.LS,Mem_Ptr)); t^.LS^.cat := PREPP;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_PREPPrecord), Loopholes.Retype(t^.LS^.PREPPfield,Mem_Ptr));
         MAKET_PREPPrec(t^.LS^.PREPPfield^);
      END;
PREPPPROP: BEGIN
         LISTREE_MakeStree(LoopHoles.Retype(t,LISTREE_pStree)); t^.cat := PREPPPROP;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_LSRecord),LoopHoles.Retype(t^.LS,Mem_Ptr)); t^.LS^.cat := PREPPPROP;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_PREPPPROPrecord), Loopholes.Retype(t^.LS^.PREPPPROPfield,Mem_Ptr));
         MAKET_PREPPPROPrec(t^.LS^.PREPPPROPfield^);
      END;
PREPPFORMULA: BEGIN
         LISTREE_MakeStree(LoopHoles.Retype(t,LISTREE_pStree)); t^.cat := PREPPFORMULA;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_LSRecord),LoopHoles.Retype(t^.LS,Mem_Ptr)); t^.LS^.cat := PREPPFORMULA;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_PREPPPROPrecord), Loopholes.Retype(t^.LS^.PREPPFORMULAfield,Mem_Ptr));
         MAKET_PREPPFORMULArec(t^.LS^.PREPPFORMULAfield^);
      END;
OPENPREPPPROP: BEGIN
         LISTREE_MakeStree(LoopHoles.Retype(t,LISTREE_pStree)); t^.cat := OPENPREPPPROP;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_LSRecord),LoopHoles.Retype(t^.LS,Mem_Ptr)); t^.LS^.cat := OPENPREPPPROP;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_PREPPPROPrecord), Loopholes.Retype(t^.LS^.OPENPREPPPROPfield,Mem_Ptr));
         MAKET_OPENPREPPPROPrec(t^.LS^.OPENPREPPPROPfield^);
      END;
CLOSEDPREPPPROP: BEGIN
         LISTREE_MakeStree(LoopHoles.Retype(t,LISTREE_pStree)); t^.cat := CLOSEDPREPPPROP;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_LSRecord),LoopHoles.Retype(t^.LS,Mem_Ptr)); t^.LS^.cat := CLOSEDPREPPPROP;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_PREPPPROPrecord), Loopholes.Retype(t^.LS^.CLOSEDPREPPPROPfield,Mem_Ptr));
         MAKET_CLOSEDPREPPPROPrec(t^.LS^.CLOSEDPREPPPROPfield^);
      END;
VARPREPP: BEGIN
         LISTREE_MakeStree(LoopHoles.Retype(t,LISTREE_pStree)); t^.cat := VARPREPP;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_LSRecord),LoopHoles.Retype(t^.LS,Mem_Ptr)); t^.LS^.cat := VARPREPP;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_PREPPrecord), Loopholes.Retype(t^.LS^.VARPREPPfield,Mem_Ptr));
         MAKET_VARPREPPrec(t^.LS^.VARPREPPfield^);
      END;
BPROPERNOUN: BEGIN
         LISTREE_MakeStree(LoopHoles.Retype(t,LISTREE_pStree)); t^.cat := BPROPERNOUN;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_LSRecord),LoopHoles.Retype(t^.LS,Mem_Ptr)); t^.LS^.cat := BPROPERNOUN;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_BPROPERNOUNrecord), Loopholes.Retype(t^.LS^.BPROPERNOUNfield,Mem_Ptr));
         MAKET_BPROPERNOUNrec(t^.LS^.BPROPERNOUNfield^);
      END;
PROPERNOUN: BEGIN
         LISTREE_MakeStree(LoopHoles.Retype(t,LISTREE_pStree)); t^.cat := PROPERNOUN;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_LSRecord),LoopHoles.Retype(t^.LS,Mem_Ptr)); t^.LS^.cat := PROPERNOUN;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_PROPERNOUNrecord), Loopholes.Retype(t^.LS^.PROPERNOUNfield,Mem_Ptr));
         MAKET_PROPERNOUNrec(t^.LS^.PROPERNOUNfield^);
      END;
PROSENT: BEGIN
         LISTREE_MakeStree(LoopHoles.Retype(t,LISTREE_pStree)); t^.cat := PROSENT;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_LSRecord),LoopHoles.Retype(t^.LS,Mem_Ptr)); t^.LS^.cat := PROSENT;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_PROSENTrecord), Loopholes.Retype(t^.LS^.PROSENTfield,Mem_Ptr));
         MAKET_PROSENTrec(t^.LS^.PROSENTfield^);
      END;
PUNC: BEGIN
         LISTREE_MakeStree(LoopHoles.Retype(t,LISTREE_pStree)); t^.cat := PUNC;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_LSRecord),LoopHoles.Retype(t^.LS,Mem_Ptr)); t^.LS^.cat := PUNC;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_PUNCrecord), Loopholes.Retype(t^.LS^.PUNCfield,Mem_Ptr));
         MAKET_PUNCrec(t^.LS^.PUNCfield^);
      END;
Q: BEGIN
         LISTREE_MakeStree(LoopHoles.Retype(t,LISTREE_pStree)); t^.cat := Q;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_LSRecord),LoopHoles.Retype(t^.LS,Mem_Ptr)); t^.LS^.cat := Q;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_Qrecord), Loopholes.Retype(t^.LS^.Qfield,Mem_Ptr));
         MAKET_Qrec(t^.LS^.Qfield^);
      END;
QP: BEGIN
         LISTREE_MakeStree(LoopHoles.Retype(t,LISTREE_pStree)); t^.cat := QP;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_LSRecord),LoopHoles.Retype(t^.LS,Mem_Ptr)); t^.LS^.cat := QP;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_QPrecord), Loopholes.Retype(t^.LS^.QPfield,Mem_Ptr));
         MAKET_QPrec(t^.LS^.QPfield^);
      END;
RECIPRO: BEGIN
         LISTREE_MakeStree(LoopHoles.Retype(t,LISTREE_pStree)); t^.cat := RECIPRO;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_LSRecord),LoopHoles.Retype(t^.LS,Mem_Ptr)); t^.LS^.cat := RECIPRO;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_RECIPROrecord), Loopholes.Retype(t^.LS^.RECIPROfield,Mem_Ptr));
         MAKET_RECIPROrec(t^.LS^.RECIPROfield^);
      END;
REFLPRO: BEGIN
         LISTREE_MakeStree(LoopHoles.Retype(t,LISTREE_pStree)); t^.cat := REFLPRO;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_LSRecord),LoopHoles.Retype(t^.LS,Mem_Ptr)); t^.LS^.cat := REFLPRO;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_REFLPROrecord), Loopholes.Retype(t^.LS^.REFLPROfield,Mem_Ptr));
         MAKET_REFLPROrec(t^.LS^.REFLPROfield^);
      END;
RELPRO: BEGIN
         LISTREE_MakeStree(LoopHoles.Retype(t,LISTREE_pStree)); t^.cat := RELPRO;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_LSRecord),LoopHoles.Retype(t^.LS,Mem_Ptr)); t^.LS^.cat := RELPRO;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_RELPROrecord), Loopholes.Retype(t^.LS^.RELPROfield,Mem_Ptr));
         MAKET_RELPROrec(t^.LS^.RELPROfield^);
      END;
SENTENCE: BEGIN
         LISTREE_MakeStree(LoopHoles.Retype(t,LISTREE_pStree)); t^.cat := SENTENCE;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_LSRecord),LoopHoles.Retype(t^.LS,Mem_Ptr)); t^.LS^.cat := SENTENCE;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_SENTENCErecord), Loopholes.Retype(t^.LS^.SENTENCEfield,Mem_Ptr));
         MAKET_SENTENCErec(t^.LS^.SENTENCEfield^);
      END;
TOCAT: BEGIN
         LISTREE_MakeStree(LoopHoles.Retype(t,LISTREE_pStree)); t^.cat := TOCAT;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_LSRecord),LoopHoles.Retype(t^.LS,Mem_Ptr)); t^.LS^.cat := TOCAT;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_TOCATrecord), Loopholes.Retype(t^.LS^.TOCATfield,Mem_Ptr));
         MAKET_TOCATrec(t^.LS^.TOCATfield^);
      END;
THANAS: BEGIN
         LISTREE_MakeStree(LoopHoles.Retype(t,LISTREE_pStree)); t^.cat := THANAS;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_LSRecord),LoopHoles.Retype(t^.LS,Mem_Ptr)); t^.LS^.cat := THANAS;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_THANASrecord), Loopholes.Retype(t^.LS^.THANASfield,Mem_Ptr));
         MAKET_THANASrec(t^.LS^.THANASfield^);
      END;
THANP: BEGIN
         LISTREE_MakeStree(LoopHoles.Retype(t,LISTREE_pStree)); t^.cat := THANP;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_LSRecord),LoopHoles.Retype(t^.LS,Mem_Ptr)); t^.LS^.cat := THANP;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_THANPrecord), Loopholes.Retype(t^.LS^.THANPfield,Mem_Ptr));
         MAKET_THANPrec(t^.LS^.THANPfield^);
      END;
THERE: BEGIN
         LISTREE_MakeStree(LoopHoles.Retype(t,LISTREE_pStree)); t^.cat := THERE;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_LSRecord),LoopHoles.Retype(t^.LS,Mem_Ptr)); t^.LS^.cat := THERE;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_THERErecord), Loopholes.Retype(t^.LS^.THEREfield,Mem_Ptr));
         MAKET_THERErec(t^.LS^.THEREfield^);
      END;
UTT: BEGIN
         LISTREE_MakeStree(LoopHoles.Retype(t,LISTREE_pStree)); t^.cat := UTT;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_LSRecord),LoopHoles.Retype(t^.LS,Mem_Ptr)); t^.LS^.cat := UTT;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_NORECORD), Loopholes.Retype(t^.LS^.UTTfield,Mem_Ptr));
         MAKET_UTTrec(t^.LS^.UTTfield^);
      END;
ADJPPROPVAR: BEGIN
         LISTREE_MakeStree(LoopHoles.Retype(t,LISTREE_pStree)); t^.cat := ADJPPROPVAR;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_LSRecord),LoopHoles.Retype(t^.LS,Mem_Ptr)); t^.LS^.cat := ADJPPROPVAR;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_ADJPPROPVARrecord), Loopholes.Retype(t^.LS^.ADJPPROPVARfield,Mem_Ptr));
         MAKET_ADJPPROPVARrec(t^.LS^.ADJPPROPVARfield^);
      END;
ADVPVAR: BEGIN
         LISTREE_MakeStree(LoopHoles.Retype(t,LISTREE_pStree)); t^.cat := ADVPVAR;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_LSRecord),LoopHoles.Retype(t^.LS,Mem_Ptr)); t^.LS^.cat := ADVPVAR;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_ADVPVARrecord), Loopholes.Retype(t^.LS^.ADVPVARfield,Mem_Ptr));
         MAKET_ADVPVARrec(t^.LS^.ADVPVARfield^);
      END;
ADVPPROPVAR: BEGIN
         LISTREE_MakeStree(LoopHoles.Retype(t,LISTREE_pStree)); t^.cat := ADVPPROPVAR;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_LSRecord),LoopHoles.Retype(t^.LS,Mem_Ptr)); t^.LS^.cat := ADVPPROPVAR;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_ADVPPROPVARrecord), Loopholes.Retype(t^.LS^.ADVPPROPVARfield,Mem_Ptr));
         MAKET_ADVPPROPVARrec(t^.LS^.ADVPPROPVARfield^);
      END;
CLAUSEVAR: BEGIN
         LISTREE_MakeStree(LoopHoles.Retype(t,LISTREE_pStree)); t^.cat := CLAUSEVAR;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_LSRecord),LoopHoles.Retype(t^.LS,Mem_Ptr)); t^.LS^.cat := CLAUSEVAR;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_CLAUSEVARrecord), Loopholes.Retype(t^.LS^.CLAUSEVARfield,Mem_Ptr));
         MAKET_CLAUSEVARrec(t^.LS^.CLAUSEVARfield^);
      END;
CNVAR: BEGIN
         LISTREE_MakeStree(LoopHoles.Retype(t,LISTREE_pStree)); t^.cat := CNVAR;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_LSRecord),LoopHoles.Retype(t^.LS,Mem_Ptr)); t^.LS^.cat := CNVAR;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_CNVARrecord), Loopholes.Retype(t^.LS^.CNVARfield,Mem_Ptr));
         MAKET_CNVARrec(t^.LS^.CNVARfield^);
      END;
NPVAR: BEGIN
         LISTREE_MakeStree(LoopHoles.Retype(t,LISTREE_pStree)); t^.cat := NPVAR;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_LSRecord),LoopHoles.Retype(t^.LS,Mem_Ptr)); t^.LS^.cat := NPVAR;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_NPVARrecord), Loopholes.Retype(t^.LS^.NPVARfield,Mem_Ptr));
         MAKET_NPVARrec(t^.LS^.NPVARfield^);
      END;
NPPROPVAR: BEGIN
         LISTREE_MakeStree(LoopHoles.Retype(t,LISTREE_pStree)); t^.cat := NPPROPVAR;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_LSRecord),LoopHoles.Retype(t^.LS,Mem_Ptr)); t^.LS^.cat := NPPROPVAR;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_NPPROPVARrecord), Loopholes.Retype(t^.LS^.NPPROPVARfield,Mem_Ptr));
         MAKET_NPPROPVARrec(t^.LS^.NPPROPVARfield^);
      END;
PREPPVAR: BEGIN
         LISTREE_MakeStree(LoopHoles.Retype(t,LISTREE_pStree)); t^.cat := PREPPVAR;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_LSRecord),LoopHoles.Retype(t^.LS,Mem_Ptr)); t^.LS^.cat := PREPPVAR;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_PREPPVARrecord), Loopholes.Retype(t^.LS^.PREPPVARfield,Mem_Ptr));
         MAKET_PREPPVARrec(t^.LS^.PREPPVARfield^);
      END;
PREPPPROPVAR: BEGIN
         LISTREE_MakeStree(LoopHoles.Retype(t,LISTREE_pStree)); t^.cat := PREPPPROPVAR;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_LSRecord),LoopHoles.Retype(t^.LS,Mem_Ptr)); t^.LS^.cat := PREPPPROPVAR;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_PREPPPROPVARrecord), Loopholes.Retype(t^.LS^.PREPPPROPVARfield,Mem_Ptr));
         MAKET_PREPPPROPVARrec(t^.LS^.PREPPPROPVARfield^);
      END;
PROSENTVAR: BEGIN
         LISTREE_MakeStree(LoopHoles.Retype(t,LISTREE_pStree)); t^.cat := PROSENTVAR;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_LSRecord),LoopHoles.Retype(t^.LS,Mem_Ptr)); t^.LS^.cat := PROSENTVAR;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_PROSENTVARrecord), Loopholes.Retype(t^.LS^.PROSENTVARfield,Mem_Ptr));
         MAKET_PROSENTVARrec(t^.LS^.PROSENTVARfield^);
      END;
SENTENCEVAR: BEGIN
         LISTREE_MakeStree(LoopHoles.Retype(t,LISTREE_pStree)); t^.cat := SENTENCEVAR;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_LSRecord),LoopHoles.Retype(t^.LS,Mem_Ptr)); t^.LS^.cat := SENTENCEVAR;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_SENTENCEVARrecord), Loopholes.Retype(t^.LS^.SENTENCEVARfield,Mem_Ptr));
         MAKET_SENTENCEVARrec(t^.LS^.SENTENCEVARfield^);
      END;
VERBPPROPVAR: BEGIN
         LISTREE_MakeStree(LoopHoles.Retype(t,LISTREE_pStree)); t^.cat := VERBPPROPVAR;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_LSRecord),LoopHoles.Retype(t^.LS,Mem_Ptr)); t^.LS^.cat := VERBPPROPVAR;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_VERBPPROPVARrecord), Loopholes.Retype(t^.LS^.VERBPPROPVARfield,Mem_Ptr));
         MAKET_VERBPPROPVARrec(t^.LS^.VERBPPROPVARfield^);
      END;
EMPTYVAR: BEGIN
         LISTREE_MakeStree(LoopHoles.Retype(t,LISTREE_pStree)); t^.cat := EMPTYVAR;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_LSRecord),LoopHoles.Retype(t^.LS,Mem_Ptr)); t^.LS^.cat := EMPTYVAR;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_EMPTYVARrecord), Loopholes.Retype(t^.LS^.EMPTYVARfield,Mem_Ptr));
         MAKET_EMPTYVARrec(t^.LS^.EMPTYVARfield^);
      END;
NEGVAR: BEGIN
         LISTREE_MakeStree(LoopHoles.Retype(t,LISTREE_pStree)); t^.cat := NEGVAR;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_LSRecord),LoopHoles.Retype(t^.LS,Mem_Ptr)); t^.LS^.cat := NEGVAR;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_NEGVARrecord), Loopholes.Retype(t^.LS^.NEGVARfield,Mem_Ptr));
         MAKET_NEGVARrec(t^.LS^.NEGVARfield^);
      END;
POSVAR: BEGIN
         LISTREE_MakeStree(LoopHoles.Retype(t,LISTREE_pStree)); t^.cat := POSVAR;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_LSRecord),LoopHoles.Retype(t^.LS,Mem_Ptr)); t^.LS^.cat := POSVAR;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_POSVARrecord), Loopholes.Retype(t^.LS^.POSVARfield,Mem_Ptr));
         MAKET_POSVARrec(t^.LS^.POSVARfield^);
      END;
BVERBSUFF: BEGIN
         LISTREE_MakeStree(LoopHoles.Retype(t,LISTREE_pStree)); t^.cat := BVERBSUFF;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_LSRecord),LoopHoles.Retype(t^.LS,Mem_Ptr)); t^.LS^.cat := BVERBSUFF;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_BVERBrecord), Loopholes.Retype(t^.LS^.BVERBSUFFfield,Mem_Ptr));
         MAKET_BVERBSUFFrec(t^.LS^.BVERBSUFFfield^);
      END;
BVERB: BEGIN
         LISTREE_MakeStree(LoopHoles.Retype(t,LISTREE_pStree)); t^.cat := BVERB;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_LSRecord),LoopHoles.Retype(t^.LS,Mem_Ptr)); t^.LS^.cat := BVERB;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_BVERBrecord), Loopholes.Retype(t^.LS^.BVERBfield,Mem_Ptr));
         MAKET_BVERBrec(t^.LS^.BVERBfield^);
      END;
SUBVERB: BEGIN
         LISTREE_MakeStree(LoopHoles.Retype(t,LISTREE_pStree)); t^.cat := SUBVERB;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_LSRecord),LoopHoles.Retype(t^.LS,Mem_Ptr)); t^.LS^.cat := SUBVERB;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_SUBVERBrecord), Loopholes.Retype(t^.LS^.SUBVERBfield,Mem_Ptr));
         MAKET_SUBVERBrec(t^.LS^.SUBVERBfield^);
      END;
VERB: BEGIN
         LISTREE_MakeStree(LoopHoles.Retype(t,LISTREE_pStree)); t^.cat := VERB;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_LSRecord),LoopHoles.Retype(t^.LS,Mem_Ptr)); t^.LS^.cat := VERB;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_VERBrecord), Loopholes.Retype(t^.LS^.VERBfield,Mem_Ptr));
         MAKET_VERBrec(t^.LS^.VERBfield^);
      END;
VERBP: BEGIN
         LISTREE_MakeStree(LoopHoles.Retype(t,LISTREE_pStree)); t^.cat := VERBP;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_LSRecord),LoopHoles.Retype(t^.LS,Mem_Ptr)); t^.LS^.cat := VERBP;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_VERBPrecord), Loopholes.Retype(t^.LS^.VERBPfield,Mem_Ptr));
         MAKET_VERBPrec(t^.LS^.VERBPfield^);
      END;
VERBPPROP: BEGIN
         LISTREE_MakeStree(LoopHoles.Retype(t,LISTREE_pStree)); t^.cat := VERBPPROP;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_LSRecord),LoopHoles.Retype(t^.LS,Mem_Ptr)); t^.LS^.cat := VERBPPROP;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_VERBPPROPrecord), Loopholes.Retype(t^.LS^.VERBPPROPfield,Mem_Ptr));
         MAKET_VERBPPROPrec(t^.LS^.VERBPPROPfield^);
      END;
VERBPFORMULA: BEGIN
         LISTREE_MakeStree(LoopHoles.Retype(t,LISTREE_pStree)); t^.cat := VERBPFORMULA;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_LSRecord),LoopHoles.Retype(t^.LS,Mem_Ptr)); t^.LS^.cat := VERBPFORMULA;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_VERBPPROPrecord), Loopholes.Retype(t^.LS^.VERBPFORMULAfield,Mem_Ptr));
         MAKET_VERBPFORMULArec(t^.LS^.VERBPFORMULAfield^);
      END;
OPENVERBPPROP: BEGIN
         LISTREE_MakeStree(LoopHoles.Retype(t,LISTREE_pStree)); t^.cat := OPENVERBPPROP;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_LSRecord),LoopHoles.Retype(t^.LS,Mem_Ptr)); t^.LS^.cat := OPENVERBPPROP;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_VERBPPROPrecord), Loopholes.Retype(t^.LS^.OPENVERBPPROPfield,Mem_Ptr));
         MAKET_OPENVERBPPROPrec(t^.LS^.OPENVERBPPROPfield^);
      END;
CLOSEDVERBPPROP: BEGIN
         LISTREE_MakeStree(LoopHoles.Retype(t,LISTREE_pStree)); t^.cat := CLOSEDVERBPPROP;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_LSRecord),LoopHoles.Retype(t^.LS,Mem_Ptr)); t^.LS^.cat := CLOSEDVERBPPROP;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_VERBPPROPrecord), Loopholes.Retype(t^.LS^.CLOSEDVERBPPROPfield,Mem_Ptr));
         MAKET_CLOSEDVERBPPROPrec(t^.LS^.CLOSEDVERBPPROPfield^);
      END;
BWHPRO: BEGIN
         LISTREE_MakeStree(LoopHoles.Retype(t,LISTREE_pStree)); t^.cat := BWHPRO;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_LSRecord),LoopHoles.Retype(t^.LS,Mem_Ptr)); t^.LS^.cat := BWHPRO;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_BWHPROrecord), Loopholes.Retype(t^.LS^.BWHPROfield,Mem_Ptr));
         MAKET_BWHPROrec(t^.LS^.BWHPROfield^);
      END;
WHPRO: BEGIN
         LISTREE_MakeStree(LoopHoles.Retype(t,LISTREE_pStree)); t^.cat := WHPRO;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_LSRecord),LoopHoles.Retype(t^.LS,Mem_Ptr)); t^.LS^.cat := WHPRO;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_WHPROrecord), Loopholes.Retype(t^.LS^.WHPROfield,Mem_Ptr));
         MAKET_WHPROrec(t^.LS^.WHPROfield^);
      END;
SFCAT: BEGIN
         LISTREE_MakeStree(LoopHoles.Retype(t,LISTREE_pStree)); t^.cat := SFCAT;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_LSRecord),LoopHoles.Retype(t^.LS,Mem_Ptr)); t^.LS^.cat := SFCAT;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_xxkeyrecord), Loopholes.Retype(t^.LS^.SFCATfield,Mem_Ptr));
         MAKET_SFCATrec(t^.LS^.SFCATfield^);
      END;
PFCAT: BEGIN
         LISTREE_MakeStree(LoopHoles.Retype(t,LISTREE_pStree)); t^.cat := PFCAT;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_LSRecord),LoopHoles.Retype(t^.LS,Mem_Ptr)); t^.LS^.cat := PFCAT;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_xxkeyrecord), Loopholes.Retype(t^.LS^.PFCATfield,Mem_Ptr));
         MAKET_PFCATrec(t^.LS^.PFCATfield^);
      END;
GLUE: BEGIN
         LISTREE_MakeStree(LoopHoles.Retype(t,LISTREE_pStree)); t^.cat := GLUE;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_LSRecord),LoopHoles.Retype(t^.LS,Mem_Ptr)); t^.LS^.cat := GLUE;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_xxemptyrecord), Loopholes.Retype(t^.LS^.GLUEfield,Mem_Ptr));
         MAKET_GLUErec(t^.LS^.GLUEfield^);
      END;
   END;
   MAKET_Stree := t;
END;

FUNCTION MAKET_BLEXBADJSUFFrec(
      compformations : LSDOMAINT_compformationsettype;
      req : LSDOMAINT_polarityeffsettype;
      env : LSDOMAINT_polarityeffsettype;
      class : LSDOMAINT_timeadvclasstype;
      deixis : LSDOMAINT_deixistype;
      aspect : LSDOMAINT_aspecttype;
      retro : LSDOMAINT_retrotype;
      uses : LSDOMAINT_adjusesettype;
      temporal : LSDOMAINT_temporaltype;
      subcs : LSDOMAINT_adjsubcsettype;
      thetaadj : LSDOMAINT_thetaadjtype;
      adjpatterns : LSDOMAINT_synpatternsettype;
      prepkey : LSDOMAINT_keytype;
      advformation : LSDOMAINT_advformationtype;
key: INTEGER
): LSDOMAINT_BLEXStruct;
VAR rec:LSDOMAINT_BLEXStruct;
BEGIN
      rec.KEY := KEY;
      rec.CAT := BADJSUFF;

      rec.BADJSUFFrec.compformations:=compformations;
      rec.BADJSUFFrec.req:=req;
      rec.BADJSUFFrec.env:=env;
      rec.BADJSUFFrec.class:=class;
      rec.BADJSUFFrec.deixis:=deixis;
      rec.BADJSUFFrec.aspect:=aspect;
      rec.BADJSUFFrec.retro:=retro;
      rec.BADJSUFFrec.uses:=uses;
      rec.BADJSUFFrec.temporal:=temporal;
      rec.BADJSUFFrec.subcs:=subcs;
      rec.BADJSUFFrec.thetaadj:=thetaadj;
      rec.BADJSUFFrec.adjpatterns:=adjpatterns;
      rec.BADJSUFFrec.prepkey:=prepkey;
      rec.BADJSUFFrec.advformation:=advformation;
      rec.BADJSUFFrec.key := KEY;
      MAKET_BLEXBADJSUFFrec := rec;
END;

FUNCTION MAKET_BLEXBADJrec(
      compformations : LSDOMAINT_compformationsettype;
      req : LSDOMAINT_polarityeffsettype;
      env : LSDOMAINT_polarityeffsettype;
      class : LSDOMAINT_timeadvclasstype;
      deixis : LSDOMAINT_deixistype;
      aspect : LSDOMAINT_aspecttype;
      retro : LSDOMAINT_retrotype;
      uses : LSDOMAINT_adjusesettype;
      temporal : LSDOMAINT_temporaltype;
      subcs : LSDOMAINT_adjsubcsettype;
      thetaadj : LSDOMAINT_thetaadjtype;
      adjpatterns : LSDOMAINT_synpatternsettype;
      prepkey : LSDOMAINT_keytype;
      advformation : LSDOMAINT_advformationtype;
key: INTEGER
): LSDOMAINT_BLEXStruct;
VAR rec:LSDOMAINT_BLEXStruct;
BEGIN
      rec.KEY := KEY;
      rec.CAT := BADJ;

      rec.BADJrec.compformations:=compformations;
      rec.BADJrec.req:=req;
      rec.BADJrec.env:=env;
      rec.BADJrec.class:=class;
      rec.BADJrec.deixis:=deixis;
      rec.BADJrec.aspect:=aspect;
      rec.BADJrec.retro:=retro;
      rec.BADJrec.uses:=uses;
      rec.BADJrec.temporal:=temporal;
      rec.BADJrec.subcs:=subcs;
      rec.BADJrec.thetaadj:=thetaadj;
      rec.BADJrec.adjpatterns:=adjpatterns;
      rec.BADJrec.prepkey:=prepkey;
      rec.BADJrec.advformation:=advformation;
      rec.BADJrec.key := KEY;
      MAKET_BLEXBADJrec := rec;
END;

FUNCTION MAKET_BLEXBADVSUFFrec(
      compformations : LSDOMAINT_compformationsettype;
      req : LSDOMAINT_polarityeffsettype;
      env : LSDOMAINT_polarityeffsettype;
      subcs : LSDOMAINT_advsubcsettype;
      class : LSDOMAINT_timeadvclasstype;
      deixis : LSDOMAINT_deixistype;
      aspect : LSDOMAINT_aspecttype;
      retro : LSDOMAINT_retrotype;
      mood : LSDOMAINT_xpmoodtype;
      thetaadv : LSDOMAINT_thetaadvtype;
      advpatterns : LSDOMAINT_synpatternsettype;
      prepkey : LSDOMAINT_keytype;
      position : LSDOMAINT_positionsettype;
      possnietnp : LSDOMAINT_possnietnptype;
      thanas : LSDOMAINT_thanascompltype;
      temporal : LSDOMAINT_temporaltype;
key: INTEGER
): LSDOMAINT_BLEXStruct;
VAR rec:LSDOMAINT_BLEXStruct;
BEGIN
      rec.KEY := KEY;
      rec.CAT := BADVSUFF;

      rec.BADVSUFFrec.compformations:=compformations;
      rec.BADVSUFFrec.req:=req;
      rec.BADVSUFFrec.env:=env;
      rec.BADVSUFFrec.subcs:=subcs;
      rec.BADVSUFFrec.class:=class;
      rec.BADVSUFFrec.deixis:=deixis;
      rec.BADVSUFFrec.aspect:=aspect;
      rec.BADVSUFFrec.retro:=retro;
      rec.BADVSUFFrec.mood:=mood;
      rec.BADVSUFFrec.thetaadv:=thetaadv;
      rec.BADVSUFFrec.advpatterns:=advpatterns;
      rec.BADVSUFFrec.prepkey:=prepkey;
      rec.BADVSUFFrec.position:=position;
      rec.BADVSUFFrec.possnietnp:=possnietnp;
      rec.BADVSUFFrec.thanas:=thanas;
      rec.BADVSUFFrec.temporal:=temporal;
      rec.BADVSUFFrec.key := KEY;
      MAKET_BLEXBADVSUFFrec := rec;
END;

FUNCTION MAKET_BLEXBADVrec(
      compformations : LSDOMAINT_compformationsettype;
      req : LSDOMAINT_polarityeffsettype;
      env : LSDOMAINT_polarityeffsettype;
      subcs : LSDOMAINT_advsubcsettype;
      class : LSDOMAINT_timeadvclasstype;
      deixis : LSDOMAINT_deixistype;
      aspect : LSDOMAINT_aspecttype;
      retro : LSDOMAINT_retrotype;
      mood : LSDOMAINT_xpmoodtype;
      thetaadv : LSDOMAINT_thetaadvtype;
      advpatterns : LSDOMAINT_synpatternsettype;
      prepkey : LSDOMAINT_keytype;
      position : LSDOMAINT_positionsettype;
      possnietnp : LSDOMAINT_possnietnptype;
      thanas : LSDOMAINT_thanascompltype;
      temporal : LSDOMAINT_temporaltype;
key: INTEGER
): LSDOMAINT_BLEXStruct;
VAR rec:LSDOMAINT_BLEXStruct;
BEGIN
      rec.KEY := KEY;
      rec.CAT := BADV;

      rec.BADVrec.compformations:=compformations;
      rec.BADVrec.req:=req;
      rec.BADVrec.env:=env;
      rec.BADVrec.subcs:=subcs;
      rec.BADVrec.class:=class;
      rec.BADVrec.deixis:=deixis;
      rec.BADVrec.aspect:=aspect;
      rec.BADVrec.retro:=retro;
      rec.BADVrec.mood:=mood;
      rec.BADVrec.thetaadv:=thetaadv;
      rec.BADVrec.advpatterns:=advpatterns;
      rec.BADVrec.prepkey:=prepkey;
      rec.BADVrec.position:=position;
      rec.BADVrec.possnietnp:=possnietnp;
      rec.BADVrec.thanas:=thanas;
      rec.BADVrec.temporal:=temporal;
      rec.BADVrec.key := KEY;
      MAKET_BLEXBADVrec := rec;
END;

FUNCTION MAKET_BLEXARTrec(
      definite : LSDOMAINT_deftype;
      possnumbers : LSDOMAINT_numbersettype;
      posscomas : LSDOMAINT_posscomasettype;
key: INTEGER
): LSDOMAINT_BLEXStruct;
VAR rec:LSDOMAINT_BLEXStruct;
BEGIN
      rec.KEY := KEY;
      rec.CAT := ART;

      rec.ARTrec.definite:=definite;
      rec.ARTrec.possnumbers:=possnumbers;
      rec.ARTrec.posscomas:=posscomas;
      rec.ARTrec.key := KEY;
      MAKET_BLEXARTrec := rec;
END;

FUNCTION MAKET_BLEXBBIGPROrec(
      person : LSDOMAINT_persontype;
      number : LSDOMAINT_numbertype;
      gender : LSDOMAINT_gendertype;
      animate : LSDOMAINT_animatetype;
      predpos : LSDOMAINT_predpostype;
      NPhead : LSDOMAINT_npheadtype;
key: INTEGER
): LSDOMAINT_BLEXStruct;
VAR rec:LSDOMAINT_BLEXStruct;
BEGIN
      rec.KEY := KEY;
      rec.CAT := BBIGPRO;

      rec.BBIGPROrec.person:=person;
      rec.BBIGPROrec.number:=number;
      rec.BBIGPROrec.gender:=gender;
      rec.BBIGPROrec.animate:=animate;
      rec.BBIGPROrec.predpos:=predpos;
      rec.BBIGPROrec.NPhead:=NPhead;
      rec.BBIGPROrec.key := KEY;
      MAKET_BLEXBBIGPROrec := rec;
END;

FUNCTION MAKET_BLEXBIRRPREFrec(
      heads : LSDOMAINT_headsettype;
key: INTEGER
): LSDOMAINT_BLEXStruct;
VAR rec:LSDOMAINT_BLEXStruct;
BEGIN
      rec.KEY := KEY;
      rec.CAT := BIRRPREF;

      rec.BIRRPREFrec.heads:=heads;
      rec.BIRRPREFrec.key := KEY;
      MAKET_BLEXBIRRPREFrec := rec;
END;

FUNCTION MAKET_BLEXCONJrec(
      req : LSDOMAINT_polarityeffsettype;
      env : LSDOMAINT_polarityeffsettype;
      class : LSDOMAINT_timeadvclasstype;
      deixis : LSDOMAINT_deixistype;
      aspect : LSDOMAINT_aspecttype;
      retro : LSDOMAINT_retrotype;
      conjpatterns : LSDOMAINT_synpatternsettype;
      adverbial : LSDOMAINT_adverbialtype;
      temporal : LSDOMAINT_temporaltype;
      distri : LSDOMAINT_distrisettype;
key: INTEGER
): LSDOMAINT_BLEXStruct;
VAR rec:LSDOMAINT_BLEXStruct;
BEGIN
      rec.KEY := KEY;
      rec.CAT := CONJ;

      rec.CONJrec.req:=req;
      rec.CONJrec.env:=env;
      rec.CONJrec.class:=class;
      rec.CONJrec.deixis:=deixis;
      rec.CONJrec.aspect:=aspect;
      rec.CONJrec.retro:=retro;
      rec.CONJrec.conjpatterns:=conjpatterns;
      rec.CONJrec.adverbial:=adverbial;
      rec.CONJrec.temporal:=temporal;
      rec.CONJrec.distri:=distri;
      rec.CONJrec.key := KEY;
      MAKET_BLEXCONJrec := rec;
END;

FUNCTION MAKET_BLEXCOORDrec(
      kinds : LSDOMAINT_coordkindstype;
      iteration : LSDOMAINT_iterationtype;
      correlative2key : LSDOMAINT_keytype;
      patterns : LSDOMAINT_coordpatternsettype;
      inducednumbers : LSDOMAINT_numbersettype;
      Sintroducer : LSDOMAINT_sintroducertype;
      req : LSDOMAINT_polarityeffsettype;
      env : LSDOMAINT_polarityeffsettype;
key: INTEGER
): LSDOMAINT_BLEXStruct;
VAR rec:LSDOMAINT_BLEXStruct;
BEGIN
      rec.KEY := KEY;
      rec.CAT := COORD;

      rec.COORDrec.kinds:=kinds;
      rec.COORDrec.iteration:=iteration;
      rec.COORDrec.correlative2key:=correlative2key;
      rec.COORDrec.patterns:=patterns;
      rec.COORDrec.inducednumbers:=inducednumbers;
      rec.COORDrec.Sintroducer:=Sintroducer;
      rec.COORDrec.req:=req;
      rec.COORDrec.env:=env;
      rec.COORDrec.key := KEY;
      MAKET_BLEXCOORDrec := rec;
END;

FUNCTION MAKET_BLEXDEMADJrec(
      number : LSDOMAINT_numbertype;
key: INTEGER
): LSDOMAINT_BLEXStruct;
VAR rec:LSDOMAINT_BLEXStruct;
BEGIN
      rec.KEY := KEY;
      rec.CAT := DEMADJ;

      rec.DEMADJrec.number:=number;
      rec.DEMADJrec.key := KEY;
      MAKET_BLEXDEMADJrec := rec;
END;

FUNCTION MAKET_BLEXDEMPROrec(
      number : LSDOMAINT_numbertype;
key: INTEGER
): LSDOMAINT_BLEXStruct;
VAR rec:LSDOMAINT_BLEXStruct;
BEGIN
      rec.KEY := KEY;
      rec.CAT := DEMPRO;

      rec.DEMPROrec.number:=number;
      rec.DEMPROrec.key := KEY;
      MAKET_BLEXDEMPROrec := rec;
END;

FUNCTION MAKET_BLEXBDETrec(
      req : LSDOMAINT_polarityeffsettype;
      env : LSDOMAINT_polarityeffsettype;
      definite : LSDOMAINT_deftype;
      posspred : LSDOMAINT_posspredtype;
      possnumbers : LSDOMAINT_numbersettype;
      posscomas : LSDOMAINT_posscomasettype;
      mood : LSDOMAINT_xpmoodtype;
      possnietnp : LSDOMAINT_possnietnptype;
      syntquant : LSDOMAINT_syntquanttype;
key: INTEGER
): LSDOMAINT_BLEXStruct;
VAR rec:LSDOMAINT_BLEXStruct;
BEGIN
      rec.KEY := KEY;
      rec.CAT := BDET;

      rec.BDETrec.req:=req;
      rec.BDETrec.env:=env;
      rec.BDETrec.definite:=definite;
      rec.BDETrec.posspred:=posspred;
      rec.BDETrec.possnumbers:=possnumbers;
      rec.BDETrec.posscomas:=posscomas;
      rec.BDETrec.mood:=mood;
      rec.BDETrec.possnietnp:=possnietnp;
      rec.BDETrec.syntquant:=syntquant;
      rec.BDETrec.key := KEY;
      MAKET_BLEXBDETrec := rec;
END;

FUNCTION MAKET_BLEXDIGITrec(
      valeu : LSDOMAINT_valuetype;
key: INTEGER
): LSDOMAINT_BLEXStruct;
VAR rec:LSDOMAINT_BLEXStruct;
BEGIN
      rec.KEY := KEY;
      rec.CAT := DIGIT;

      rec.DIGITrec.valeu:=valeu;
      rec.DIGITrec.key := KEY;
      MAKET_BLEXDIGITrec := rec;
END;

FUNCTION MAKET_BLEXENrec(
key: INTEGER
): LSDOMAINT_BLEXStruct;
VAR rec:LSDOMAINT_BLEXStruct;
BEGIN
      rec.KEY := KEY;
      rec.CAT := EN;

      rec.ENrec.key := KEY;
      MAKET_BLEXENrec := rec;
END;

FUNCTION MAKET_BLEXEMPTYrec(
      person : LSDOMAINT_persontype;
      number : LSDOMAINT_numbertype;
      gender : LSDOMAINT_gendertype;
key: INTEGER
): LSDOMAINT_BLEXStruct;
VAR rec:LSDOMAINT_BLEXStruct;
BEGIN
      rec.KEY := KEY;
      rec.CAT := EMPTY;

      rec.EMPTYrec.person:=person;
      rec.EMPTYrec.number:=number;
      rec.EMPTYrec.gender:=gender;
      rec.EMPTYrec.key := KEY;
      MAKET_BLEXEMPTYrec := rec;
END;

FUNCTION MAKET_BLEXEXCLAMrec(
key: INTEGER
): LSDOMAINT_BLEXStruct;
VAR rec:LSDOMAINT_BLEXStruct;
BEGIN
      rec.KEY := KEY;
      rec.CAT := EXCLAM;

      rec.EXCLAMrec.key := KEY;
      MAKET_BLEXEXCLAMrec := rec;
END;

FUNCTION MAKET_BLEXGENrec(
key: INTEGER
): LSDOMAINT_BLEXStruct;
VAR rec:LSDOMAINT_BLEXStruct;
BEGIN
      rec.KEY := KEY;
      rec.CAT := GEN;

      rec.GENrec.key := KEY;
      MAKET_BLEXGENrec := rec;
END;

FUNCTION MAKET_BLEXINDEFPROrec(
      req : LSDOMAINT_polarityeffsettype;
      env : LSDOMAINT_polarityeffsettype;
      definite : LSDOMAINT_deftype;
      number : LSDOMAINT_numbertype;
      poss : LSDOMAINT_posstype;
      possnietNP : LSDOMAINT_possnietnptype;
      syntquant : LSDOMAINT_syntquanttype;
      animate : LSDOMAINT_animatetype;
      NPhead : LSDOMAINT_npheadtype;
key: INTEGER
): LSDOMAINT_BLEXStruct;
VAR rec:LSDOMAINT_BLEXStruct;
BEGIN
      rec.KEY := KEY;
      rec.CAT := INDEFPRO;

      rec.INDEFPROrec.req:=req;
      rec.INDEFPROrec.env:=env;
      rec.INDEFPROrec.definite:=definite;
      rec.INDEFPROrec.number:=number;
      rec.INDEFPROrec.poss:=poss;
      rec.INDEFPROrec.possnietNP:=possnietNP;
      rec.INDEFPROrec.syntquant:=syntquant;
      rec.INDEFPROrec.animate:=animate;
      rec.INDEFPROrec.NPhead:=NPhead;
      rec.INDEFPROrec.key := KEY;
      MAKET_BLEXINDEFPROrec := rec;
END;

FUNCTION MAKET_BLEXSUBINDEFPROrec(
      req : LSDOMAINT_polarityeffsettype;
      env : LSDOMAINT_polarityeffsettype;
      definite : LSDOMAINT_deftype;
      number : LSDOMAINT_numbertype;
      poss : LSDOMAINT_posstype;
      possnietNP : LSDOMAINT_possnietnptype;
      syntquant : LSDOMAINT_syntquanttype;
      animate : LSDOMAINT_animatetype;
      NPhead : LSDOMAINT_npheadtype;
key: INTEGER
): LSDOMAINT_BLEXStruct;
VAR rec:LSDOMAINT_BLEXStruct;
BEGIN
      rec.KEY := KEY;
      rec.CAT := SUBINDEFPRO;

      rec.SUBINDEFPROrec.req:=req;
      rec.SUBINDEFPROrec.env:=env;
      rec.SUBINDEFPROrec.definite:=definite;
      rec.SUBINDEFPROrec.number:=number;
      rec.SUBINDEFPROrec.poss:=poss;
      rec.SUBINDEFPROrec.possnietNP:=possnietNP;
      rec.SUBINDEFPROrec.syntquant:=syntquant;
      rec.SUBINDEFPROrec.animate:=animate;
      rec.SUBINDEFPROrec.NPhead:=NPhead;
      rec.SUBINDEFPROrec.key := KEY;
      MAKET_BLEXSUBINDEFPROrec := rec;
END;

FUNCTION MAKET_BLEXNEGrec(
key: INTEGER
): LSDOMAINT_BLEXStruct;
VAR rec:LSDOMAINT_BLEXStruct;
BEGIN
      rec.KEY := KEY;
      rec.CAT := NEG;

      rec.NEGrec.key := KEY;
      MAKET_BLEXNEGrec := rec;
END;

FUNCTION MAKET_BLEXBNOUNSUFFrec(
      req : LSDOMAINT_polarityeffsettype;
      env : LSDOMAINT_polarityeffsettype;
      plurforms : LSDOMAINT_plurformsettype;
      genders : LSDOMAINT_gendersettype;
      class : LSDOMAINT_timeadvclasstype;
      deixis : LSDOMAINT_deixistype;
      aspect : LSDOMAINT_aspecttype;
      retro : LSDOMAINT_retrotype;
      sexes : LSDOMAINT_sexsettype;
      subcs : LSDOMAINT_nounsubcsettype;
      temporal : LSDOMAINT_temporaltype;
      animate : LSDOMAINT_animatetype;
      human : LSDOMAINT_humantype;
      posscomas : LSDOMAINT_posscomasettype;
      thetanp : LSDOMAINT_thetanptype;
      nounpatterns : LSDOMAINT_synpatternsettype;
      prepkey : LSDOMAINT_keytype;
      personal : LSDOMAINT_personaltype;
      poss : LSDOMAINT_posstype;
key: INTEGER
): LSDOMAINT_BLEXStruct;
VAR rec:LSDOMAINT_BLEXStruct;
BEGIN
      rec.KEY := KEY;
      rec.CAT := BNOUNSUFF;

      rec.BNOUNSUFFrec.req:=req;
      rec.BNOUNSUFFrec.env:=env;
      rec.BNOUNSUFFrec.plurforms:=plurforms;
      rec.BNOUNSUFFrec.genders:=genders;
      rec.BNOUNSUFFrec.class:=class;
      rec.BNOUNSUFFrec.deixis:=deixis;
      rec.BNOUNSUFFrec.aspect:=aspect;
      rec.BNOUNSUFFrec.retro:=retro;
      rec.BNOUNSUFFrec.sexes:=sexes;
      rec.BNOUNSUFFrec.subcs:=subcs;
      rec.BNOUNSUFFrec.temporal:=temporal;
      rec.BNOUNSUFFrec.animate:=animate;
      rec.BNOUNSUFFrec.human:=human;
      rec.BNOUNSUFFrec.posscomas:=posscomas;
      rec.BNOUNSUFFrec.thetanp:=thetanp;
      rec.BNOUNSUFFrec.nounpatterns:=nounpatterns;
      rec.BNOUNSUFFrec.prepkey:=prepkey;
      rec.BNOUNSUFFrec.personal:=personal;
      rec.BNOUNSUFFrec.poss:=poss;
      rec.BNOUNSUFFrec.key := KEY;
      MAKET_BLEXBNOUNSUFFrec := rec;
END;

FUNCTION MAKET_BLEXBNOUNrec(
      req : LSDOMAINT_polarityeffsettype;
      env : LSDOMAINT_polarityeffsettype;
      plurforms : LSDOMAINT_plurformsettype;
      genders : LSDOMAINT_gendersettype;
      class : LSDOMAINT_timeadvclasstype;
      deixis : LSDOMAINT_deixistype;
      aspect : LSDOMAINT_aspecttype;
      retro : LSDOMAINT_retrotype;
      sexes : LSDOMAINT_sexsettype;
      subcs : LSDOMAINT_nounsubcsettype;
      temporal : LSDOMAINT_temporaltype;
      animate : LSDOMAINT_animatetype;
      human : LSDOMAINT_humantype;
      posscomas : LSDOMAINT_posscomasettype;
      thetanp : LSDOMAINT_thetanptype;
      nounpatterns : LSDOMAINT_synpatternsettype;
      prepkey : LSDOMAINT_keytype;
      personal : LSDOMAINT_personaltype;
      poss : LSDOMAINT_posstype;
key: INTEGER
): LSDOMAINT_BLEXStruct;
VAR rec:LSDOMAINT_BLEXStruct;
BEGIN
      rec.KEY := KEY;
      rec.CAT := BNOUN;

      rec.BNOUNrec.req:=req;
      rec.BNOUNrec.env:=env;
      rec.BNOUNrec.plurforms:=plurforms;
      rec.BNOUNrec.genders:=genders;
      rec.BNOUNrec.class:=class;
      rec.BNOUNrec.deixis:=deixis;
      rec.BNOUNrec.aspect:=aspect;
      rec.BNOUNrec.retro:=retro;
      rec.BNOUNrec.sexes:=sexes;
      rec.BNOUNrec.subcs:=subcs;
      rec.BNOUNrec.temporal:=temporal;
      rec.BNOUNrec.animate:=animate;
      rec.BNOUNrec.human:=human;
      rec.BNOUNrec.posscomas:=posscomas;
      rec.BNOUNrec.thetanp:=thetanp;
      rec.BNOUNrec.nounpatterns:=nounpatterns;
      rec.BNOUNrec.prepkey:=prepkey;
      rec.BNOUNrec.personal:=personal;
      rec.BNOUNrec.poss:=poss;
      rec.BNOUNrec.key := KEY;
      MAKET_BLEXBNOUNrec := rec;
END;

FUNCTION MAKET_BLEXNUMrec(
      numbers : LSDOMAINT_numbersettype;
key: INTEGER
): LSDOMAINT_BLEXStruct;
VAR rec:LSDOMAINT_BLEXStruct;
BEGIN
      rec.KEY := KEY;
      rec.CAT := NUM;

      rec.NUMrec.numbers:=numbers;
      rec.NUMrec.key := KEY;
      MAKET_BLEXNUMrec := rec;
END;

FUNCTION MAKET_BLEXORDINALrec(
key: INTEGER
): LSDOMAINT_BLEXStruct;
VAR rec:LSDOMAINT_BLEXStruct;
BEGIN
      rec.KEY := KEY;
      rec.CAT := ORDINAL;

      rec.ORDINALrec.key := KEY;
      MAKET_BLEXORDINALrec := rec;
END;

FUNCTION MAKET_BLEXPARTrec(
key: INTEGER
): LSDOMAINT_BLEXStruct;
VAR rec:LSDOMAINT_BLEXStruct;
BEGIN
      rec.KEY := KEY;
      rec.CAT := PART;

      rec.PARTrec.key := KEY;
      MAKET_BLEXPARTrec := rec;
END;

FUNCTION MAKET_BLEXBPERSPROrec(
      person : LSDOMAINT_persontype;
      number : LSDOMAINT_numbertype;
      gender : LSDOMAINT_gendertype;
      animate : LSDOMAINT_animatetype;
      predpos : LSDOMAINT_predpostype;
      NPhead : LSDOMAINT_npheadtype;
key: INTEGER
): LSDOMAINT_BLEXStruct;
VAR rec:LSDOMAINT_BLEXStruct;
BEGIN
      rec.KEY := KEY;
      rec.CAT := BPERSPRO;

      rec.BPERSPROrec.person:=person;
      rec.BPERSPROrec.number:=number;
      rec.BPERSPROrec.gender:=gender;
      rec.BPERSPROrec.animate:=animate;
      rec.BPERSPROrec.predpos:=predpos;
      rec.BPERSPROrec.NPhead:=NPhead;
      rec.BPERSPROrec.key := KEY;
      MAKET_BLEXBPERSPROrec := rec;
END;

FUNCTION MAKET_BLEXPOSrec(
key: INTEGER
): LSDOMAINT_BLEXStruct;
VAR rec:LSDOMAINT_BLEXStruct;
BEGIN
      rec.KEY := KEY;
      rec.CAT := POS;

      rec.POSrec.key := KEY;
      MAKET_BLEXPOSrec := rec;
END;

FUNCTION MAKET_BLEXBPREFIXrec(
      heads : LSDOMAINT_headsettype;
key: INTEGER
): LSDOMAINT_BLEXStruct;
VAR rec:LSDOMAINT_BLEXStruct;
BEGIN
      rec.KEY := KEY;
      rec.CAT := BPREFIX;

      rec.BPREFIXrec.heads:=heads;
      rec.BPREFIXrec.key := KEY;
      MAKET_BLEXBPREFIXrec := rec;
END;

FUNCTION MAKET_BLEXSUBPREPrec(
      req : LSDOMAINT_polarityeffsettype;
      env : LSDOMAINT_polarityeffsettype;
      subcs : LSDOMAINT_prepsubcsettype;
      synpps : LSDOMAINT_synpatternsettype;
      thetapp : LSDOMAINT_thetapptype;
      class : LSDOMAINT_timeadvclasstype;
      deixis : LSDOMAINT_deixistype;
      aspect : LSDOMAINT_aspecttype;
      retro : LSDOMAINT_retrotype;
      secondprep : LSDOMAINT_keytype;
key: INTEGER
): LSDOMAINT_BLEXStruct;
VAR rec:LSDOMAINT_BLEXStruct;
BEGIN
      rec.KEY := KEY;
      rec.CAT := SUBPREP;

      rec.SUBPREPrec.req:=req;
      rec.SUBPREPrec.env:=env;
      rec.SUBPREPrec.subcs:=subcs;
      rec.SUBPREPrec.synpps:=synpps;
      rec.SUBPREPrec.thetapp:=thetapp;
      rec.SUBPREPrec.class:=class;
      rec.SUBPREPrec.deixis:=deixis;
      rec.SUBPREPrec.aspect:=aspect;
      rec.SUBPREPrec.retro:=retro;
      rec.SUBPREPrec.secondprep:=secondprep;
      rec.SUBPREPrec.key := KEY;
      MAKET_BLEXSUBPREPrec := rec;
END;

FUNCTION MAKET_BLEXPREPrec(
      req : LSDOMAINT_polarityeffsettype;
      env : LSDOMAINT_polarityeffsettype;
      subcs : LSDOMAINT_prepsubcsettype;
      synpps : LSDOMAINT_synpatternsettype;
      thetapp : LSDOMAINT_thetapptype;
      class : LSDOMAINT_timeadvclasstype;
      deixis : LSDOMAINT_deixistype;
      aspect : LSDOMAINT_aspecttype;
      retro : LSDOMAINT_retrotype;
      secondprep : LSDOMAINT_keytype;
key: INTEGER
): LSDOMAINT_BLEXStruct;
VAR rec:LSDOMAINT_BLEXStruct;
BEGIN
      rec.KEY := KEY;
      rec.CAT := PREP;

      rec.PREPrec.req:=req;
      rec.PREPrec.env:=env;
      rec.PREPrec.subcs:=subcs;
      rec.PREPrec.synpps:=synpps;
      rec.PREPrec.thetapp:=thetapp;
      rec.PREPrec.class:=class;
      rec.PREPrec.deixis:=deixis;
      rec.PREPrec.aspect:=aspect;
      rec.PREPrec.retro:=retro;
      rec.PREPrec.secondprep:=secondprep;
      rec.PREPrec.key := KEY;
      MAKET_BLEXPREPrec := rec;
END;

FUNCTION MAKET_BLEXBPROPERNOUNrec(
      plurforms : LSDOMAINT_plurformsettype;
      sexes : LSDOMAINT_sexsettype;
      subc : LSDOMAINT_nounsubctype;
      animate : LSDOMAINT_animatetype;
      human : LSDOMAINT_humantype;
      genders : LSDOMAINT_gendersettype;
      poss : LSDOMAINT_posstype;
      temporal : LSDOMAINT_temporaltype;
      class : LSDOMAINT_timeadvclasstype;
      deixis : LSDOMAINT_deixistype;
      aspect : LSDOMAINT_aspecttype;
      retro : LSDOMAINT_retrotype;
key: INTEGER
): LSDOMAINT_BLEXStruct;
VAR rec:LSDOMAINT_BLEXStruct;
BEGIN
      rec.KEY := KEY;
      rec.CAT := BPROPERNOUN;

      rec.BPROPERNOUNrec.plurforms:=plurforms;
      rec.BPROPERNOUNrec.sexes:=sexes;
      rec.BPROPERNOUNrec.subc:=subc;
      rec.BPROPERNOUNrec.animate:=animate;
      rec.BPROPERNOUNrec.human:=human;
      rec.BPROPERNOUNrec.genders:=genders;
      rec.BPROPERNOUNrec.poss:=poss;
      rec.BPROPERNOUNrec.temporal:=temporal;
      rec.BPROPERNOUNrec.class:=class;
      rec.BPROPERNOUNrec.deixis:=deixis;
      rec.BPROPERNOUNrec.aspect:=aspect;
      rec.BPROPERNOUNrec.retro:=retro;
      rec.BPROPERNOUNrec.key := KEY;
      MAKET_BLEXBPROPERNOUNrec := rec;
END;

FUNCTION MAKET_BLEXPROSENTrec(
      neg : LSDOMAINT_negtype;
      so : LSDOMAINT_sotype;
key: INTEGER
): LSDOMAINT_BLEXStruct;
VAR rec:LSDOMAINT_BLEXStruct;
BEGIN
      rec.KEY := KEY;
      rec.CAT := PROSENT;

      rec.PROSENTrec.neg:=neg;
      rec.PROSENTrec.so:=so;
      rec.PROSENTrec.key := KEY;
      MAKET_BLEXPROSENTrec := rec;
END;

FUNCTION MAKET_BLEXPUNCrec(
key: INTEGER
): LSDOMAINT_BLEXStruct;
VAR rec:LSDOMAINT_BLEXStruct;
BEGIN
      rec.KEY := KEY;
      rec.CAT := PUNC;

      rec.PUNCrec.key := KEY;
      MAKET_BLEXPUNCrec := rec;
END;

FUNCTION MAKET_BLEXQrec(
      req : LSDOMAINT_polarityeffsettype;
      env : LSDOMAINT_polarityeffsettype;
      definite : LSDOMAINT_deftype;
      posspred : LSDOMAINT_posspredtype;
      possnumbers : LSDOMAINT_numbersettype;
      posscomas : LSDOMAINT_posscomasettype;
      mood : LSDOMAINT_xpmoodtype;
      thanas : LSDOMAINT_thanascompltype;
      hop : LSDOMAINT_hoptype;
key: INTEGER
): LSDOMAINT_BLEXStruct;
VAR rec:LSDOMAINT_BLEXStruct;
BEGIN
      rec.KEY := KEY;
      rec.CAT := Q;

      rec.Qrec.req:=req;
      rec.Qrec.env:=env;
      rec.Qrec.definite:=definite;
      rec.Qrec.posspred:=posspred;
      rec.Qrec.possnumbers:=possnumbers;
      rec.Qrec.posscomas:=posscomas;
      rec.Qrec.mood:=mood;
      rec.Qrec.thanas:=thanas;
      rec.Qrec.hop:=hop;
      rec.Qrec.key := KEY;
      MAKET_BLEXQrec := rec;
END;

FUNCTION MAKET_BLEXRECIPROrec(
      antecedent : LSDOMAINT_antecedenttype;
      one : LSDOMAINT_onetype;
key: INTEGER
): LSDOMAINT_BLEXStruct;
VAR rec:LSDOMAINT_BLEXStruct;
BEGIN
      rec.KEY := KEY;
      rec.CAT := RECIPRO;

      rec.RECIPROrec.antecedent:=antecedent;
      rec.RECIPROrec.one:=one;
      rec.RECIPROrec.key := KEY;
      MAKET_BLEXRECIPROrec := rec;
END;

FUNCTION MAKET_BLEXREFLPROrec(
      antecedent : LSDOMAINT_antecedenttype;
      number : LSDOMAINT_numbertype;
      person : LSDOMAINT_persontype;
      gender : LSDOMAINT_gendertype;
      one : LSDOMAINT_onetype;
key: INTEGER
): LSDOMAINT_BLEXStruct;
VAR rec:LSDOMAINT_BLEXStruct;
BEGIN
      rec.KEY := KEY;
      rec.CAT := REFLPRO;

      rec.REFLPROrec.antecedent:=antecedent;
      rec.REFLPROrec.number:=number;
      rec.REFLPROrec.person:=person;
      rec.REFLPROrec.gender:=gender;
      rec.REFLPROrec.one:=one;
      rec.REFLPROrec.key := KEY;
      MAKET_BLEXREFLPROrec := rec;
END;

FUNCTION MAKET_BLEXRELPROrec(
key: INTEGER
): LSDOMAINT_BLEXStruct;
VAR rec:LSDOMAINT_BLEXStruct;
BEGIN
      rec.KEY := KEY;
      rec.CAT := RELPRO;

      rec.RELPROrec.key := KEY;
      MAKET_BLEXRELPROrec := rec;
END;

FUNCTION MAKET_BLEXTOCATrec(
key: INTEGER
): LSDOMAINT_BLEXStruct;
VAR rec:LSDOMAINT_BLEXStruct;
BEGIN
      rec.KEY := KEY;
      rec.CAT := TOCAT;

      rec.TOCATrec.key := KEY;
      MAKET_BLEXTOCATrec := rec;
END;

FUNCTION MAKET_BLEXTHANASrec(
key: INTEGER
): LSDOMAINT_BLEXStruct;
VAR rec:LSDOMAINT_BLEXStruct;
BEGIN
      rec.KEY := KEY;
      rec.CAT := THANAS;

      rec.THANASrec.key := KEY;
      MAKET_BLEXTHANASrec := rec;
END;

FUNCTION MAKET_BLEXTHERErec(
key: INTEGER
): LSDOMAINT_BLEXStruct;
VAR rec:LSDOMAINT_BLEXStruct;
BEGIN
      rec.KEY := KEY;
      rec.CAT := THERE;

      rec.THERErec.key := KEY;
      MAKET_BLEXTHERErec := rec;
END;

FUNCTION MAKET_BLEXBVERBSUFFrec(
      req : LSDOMAINT_polarityeffsettype;
      env : LSDOMAINT_polarityeffsettype;
      conjclasses : LSDOMAINT_conjclassesettype;
      ingform : LSDOMAINT_ingformtype;
      sform : LSDOMAINT_sformtype;
      particle : LSDOMAINT_keytype;
      possvoices : LSDOMAINT_voicesettype;
      reflexivity : LSDOMAINT_reflexivetype;
      synvps : LSDOMAINT_synpatternsettype;
      thetavp : LSDOMAINT_thetavptype;
      adjuncts : LSDOMAINT_adjunctsettype;
      CaseAssigner : LSDOMAINT_caseassignertype;
      subc : LSDOMAINT_verbsubctype;
      oblcontrol : LSDOMAINT_oblcontroltype;
      prepkey1 : LSDOMAINT_keytype;
      prepkey2 : LSDOMAINT_keytype;
      controller : LSDOMAINT_controllertype;
      classes : LSDOMAINT_classsettype;
      thatdel : LSDOMAINT_thatdeltype;
key: INTEGER
): LSDOMAINT_BLEXStruct;
VAR rec:LSDOMAINT_BLEXStruct;
BEGIN
      rec.KEY := KEY;
      rec.CAT := BVERBSUFF;

      rec.BVERBSUFFrec.req:=req;
      rec.BVERBSUFFrec.env:=env;
      rec.BVERBSUFFrec.conjclasses:=conjclasses;
      rec.BVERBSUFFrec.ingform:=ingform;
      rec.BVERBSUFFrec.sform:=sform;
      rec.BVERBSUFFrec.particle:=particle;
      rec.BVERBSUFFrec.possvoices:=possvoices;
      rec.BVERBSUFFrec.reflexivity:=reflexivity;
      rec.BVERBSUFFrec.synvps:=synvps;
      rec.BVERBSUFFrec.thetavp:=thetavp;
      rec.BVERBSUFFrec.adjuncts:=adjuncts;
      rec.BVERBSUFFrec.CaseAssigner:=CaseAssigner;
      rec.BVERBSUFFrec.subc:=subc;
      rec.BVERBSUFFrec.oblcontrol:=oblcontrol;
      rec.BVERBSUFFrec.prepkey1:=prepkey1;
      rec.BVERBSUFFrec.prepkey2:=prepkey2;
      rec.BVERBSUFFrec.controller:=controller;
      rec.BVERBSUFFrec.classes:=classes;
      rec.BVERBSUFFrec.thatdel:=thatdel;
      rec.BVERBSUFFrec.key := KEY;
      MAKET_BLEXBVERBSUFFrec := rec;
END;

FUNCTION MAKET_BLEXBVERBrec(
      req : LSDOMAINT_polarityeffsettype;
      env : LSDOMAINT_polarityeffsettype;
      conjclasses : LSDOMAINT_conjclassesettype;
      ingform : LSDOMAINT_ingformtype;
      sform : LSDOMAINT_sformtype;
      particle : LSDOMAINT_keytype;
      possvoices : LSDOMAINT_voicesettype;
      reflexivity : LSDOMAINT_reflexivetype;
      synvps : LSDOMAINT_synpatternsettype;
      thetavp : LSDOMAINT_thetavptype;
      adjuncts : LSDOMAINT_adjunctsettype;
      CaseAssigner : LSDOMAINT_caseassignertype;
      subc : LSDOMAINT_verbsubctype;
      oblcontrol : LSDOMAINT_oblcontroltype;
      prepkey1 : LSDOMAINT_keytype;
      prepkey2 : LSDOMAINT_keytype;
      controller : LSDOMAINT_controllertype;
      classes : LSDOMAINT_classsettype;
      thatdel : LSDOMAINT_thatdeltype;
key: INTEGER
): LSDOMAINT_BLEXStruct;
VAR rec:LSDOMAINT_BLEXStruct;
BEGIN
      rec.KEY := KEY;
      rec.CAT := BVERB;

      rec.BVERBrec.req:=req;
      rec.BVERBrec.env:=env;
      rec.BVERBrec.conjclasses:=conjclasses;
      rec.BVERBrec.ingform:=ingform;
      rec.BVERBrec.sform:=sform;
      rec.BVERBrec.particle:=particle;
      rec.BVERBrec.possvoices:=possvoices;
      rec.BVERBrec.reflexivity:=reflexivity;
      rec.BVERBrec.synvps:=synvps;
      rec.BVERBrec.thetavp:=thetavp;
      rec.BVERBrec.adjuncts:=adjuncts;
      rec.BVERBrec.CaseAssigner:=CaseAssigner;
      rec.BVERBrec.subc:=subc;
      rec.BVERBrec.oblcontrol:=oblcontrol;
      rec.BVERBrec.prepkey1:=prepkey1;
      rec.BVERBrec.prepkey2:=prepkey2;
      rec.BVERBrec.controller:=controller;
      rec.BVERBrec.classes:=classes;
      rec.BVERBrec.thatdel:=thatdel;
      rec.BVERBrec.key := KEY;
      MAKET_BLEXBVERBrec := rec;
END;

FUNCTION MAKET_BLEXBWHPROrec(
      animate : LSDOMAINT_animatetype;
      poss : LSDOMAINT_posstype;
      whcase : LSDOMAINT_whcasetype;
      number : LSDOMAINT_numbertype;
      sexes : LSDOMAINT_sexsettype;
key: INTEGER
): LSDOMAINT_BLEXStruct;
VAR rec:LSDOMAINT_BLEXStruct;
BEGIN
      rec.KEY := KEY;
      rec.CAT := BWHPRO;

      rec.BWHPROrec.animate:=animate;
      rec.BWHPROrec.poss:=poss;
      rec.BWHPROrec.whcase:=whcase;
      rec.BWHPROrec.number:=number;
      rec.BWHPROrec.sexes:=sexes;
      rec.BWHPROrec.key := KEY;
      MAKET_BLEXBWHPROrec := rec;
END;

FUNCTION MAKET_BLEXWHPROrec(
      animate : LSDOMAINT_animatetype;
      poss : LSDOMAINT_posstype;
      whcase : LSDOMAINT_whcasetype;
      number : LSDOMAINT_numbertype;
      sexes : LSDOMAINT_sexsettype;
      cases : LSDOMAINT_casesettype;
key: INTEGER
): LSDOMAINT_BLEXStruct;
VAR rec:LSDOMAINT_BLEXStruct;
BEGIN
      rec.KEY := KEY;
      rec.CAT := WHPRO;

      rec.WHPROrec.animate:=animate;
      rec.WHPROrec.poss:=poss;
      rec.WHPROrec.whcase:=whcase;
      rec.WHPROrec.number:=number;
      rec.WHPROrec.sexes:=sexes;
      rec.WHPROrec.cases:=cases;
      rec.WHPROrec.key := KEY;
      MAKET_BLEXWHPROrec := rec;
END;

FUNCTION MAKET_BLEXSFCATrec(
key: INTEGER
): LSDOMAINT_BLEXStruct;
VAR rec:LSDOMAINT_BLEXStruct;
BEGIN
      rec.KEY := KEY;
      rec.CAT := SFCAT;

      rec.SFCATrec.key := KEY;
      MAKET_BLEXSFCATrec := rec;
END;

FUNCTION MAKET_BLEXPFCATrec(
key: INTEGER
): LSDOMAINT_BLEXStruct;
VAR rec:LSDOMAINT_BLEXStruct;
BEGIN
      rec.KEY := KEY;
      rec.CAT := PFCAT;

      rec.PFCATrec.key := KEY;
      MAKET_BLEXPFCATrec := rec;
END;


FUNCTION MAKET_StreeFromBLEXrec(cat:LSDOMAINT_syntcat;
rec:LSDOMAINT_BLEXStruct): LSSTREE_pStree;
VAR t: LSSTREE_pStree;
BEGIN
   CASE cat OF
BADJSUFF: BEGIN
         LISTREE_MakeStree(LoopHoles.Retype(t,LISTREE_pStree)); t^.cat := BADJSUFF;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_LSRecord),LoopHoles.Retype(t^.LS,Mem_Ptr)); t^.LS^.cat := BADJSUFF;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_BADJrecord), LoopHoles.Retype(t^.LS^.BADJSUFFfield,Mem_Ptr));
         t^.LS^.BADJSUFFfield^ := rec.BADJSUFFrec;
      END;
BADJ: BEGIN
         LISTREE_MakeStree(LoopHoles.Retype(t,LISTREE_pStree)); t^.cat := BADJ;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_LSRecord),LoopHoles.Retype(t^.LS,Mem_Ptr)); t^.LS^.cat := BADJ;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_BADJrecord), LoopHoles.Retype(t^.LS^.BADJfield,Mem_Ptr));
         t^.LS^.BADJfield^ := rec.BADJrec;
      END;
BADVSUFF: BEGIN
         LISTREE_MakeStree(LoopHoles.Retype(t,LISTREE_pStree)); t^.cat := BADVSUFF;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_LSRecord),LoopHoles.Retype(t^.LS,Mem_Ptr)); t^.LS^.cat := BADVSUFF;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_BADVrecord), LoopHoles.Retype(t^.LS^.BADVSUFFfield,Mem_Ptr));
         t^.LS^.BADVSUFFfield^ := rec.BADVSUFFrec;
      END;
BADV: BEGIN
         LISTREE_MakeStree(LoopHoles.Retype(t,LISTREE_pStree)); t^.cat := BADV;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_LSRecord),LoopHoles.Retype(t^.LS,Mem_Ptr)); t^.LS^.cat := BADV;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_BADVrecord), LoopHoles.Retype(t^.LS^.BADVfield,Mem_Ptr));
         t^.LS^.BADVfield^ := rec.BADVrec;
      END;
ART: BEGIN
         LISTREE_MakeStree(LoopHoles.Retype(t,LISTREE_pStree)); t^.cat := ART;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_LSRecord),LoopHoles.Retype(t^.LS,Mem_Ptr)); t^.LS^.cat := ART;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_ARTrecord), LoopHoles.Retype(t^.LS^.ARTfield,Mem_Ptr));
         t^.LS^.ARTfield^ := rec.ARTrec;
      END;
BBIGPRO: BEGIN
         LISTREE_MakeStree(LoopHoles.Retype(t,LISTREE_pStree)); t^.cat := BBIGPRO;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_LSRecord),LoopHoles.Retype(t^.LS,Mem_Ptr)); t^.LS^.cat := BBIGPRO;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_BPERSPROrecord), LoopHoles.Retype(t^.LS^.BBIGPROfield,Mem_Ptr));
         t^.LS^.BBIGPROfield^ := rec.BBIGPROrec;
      END;
BIRRPREF: BEGIN
         LISTREE_MakeStree(LoopHoles.Retype(t,LISTREE_pStree)); t^.cat := BIRRPREF;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_LSRecord),LoopHoles.Retype(t^.LS,Mem_Ptr)); t^.LS^.cat := BIRRPREF;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_BIRRPREFrecord), LoopHoles.Retype(t^.LS^.BIRRPREFfield,Mem_Ptr));
         t^.LS^.BIRRPREFfield^ := rec.BIRRPREFrec;
      END;
CONJ: BEGIN
         LISTREE_MakeStree(LoopHoles.Retype(t,LISTREE_pStree)); t^.cat := CONJ;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_LSRecord),LoopHoles.Retype(t^.LS,Mem_Ptr)); t^.LS^.cat := CONJ;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_CONJrecord), LoopHoles.Retype(t^.LS^.CONJfield,Mem_Ptr));
         t^.LS^.CONJfield^ := rec.CONJrec;
      END;
COORD: BEGIN
         LISTREE_MakeStree(LoopHoles.Retype(t,LISTREE_pStree)); t^.cat := COORD;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_LSRecord),LoopHoles.Retype(t^.LS,Mem_Ptr)); t^.LS^.cat := COORD;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_COORDrecord), LoopHoles.Retype(t^.LS^.COORDfield,Mem_Ptr));
         t^.LS^.COORDfield^ := rec.COORDrec;
      END;
DEMADJ: BEGIN
         LISTREE_MakeStree(LoopHoles.Retype(t,LISTREE_pStree)); t^.cat := DEMADJ;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_LSRecord),LoopHoles.Retype(t^.LS,Mem_Ptr)); t^.LS^.cat := DEMADJ;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_DEMADJrecord), LoopHoles.Retype(t^.LS^.DEMADJfield,Mem_Ptr));
         t^.LS^.DEMADJfield^ := rec.DEMADJrec;
      END;
DEMPRO: BEGIN
         LISTREE_MakeStree(LoopHoles.Retype(t,LISTREE_pStree)); t^.cat := DEMPRO;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_LSRecord),LoopHoles.Retype(t^.LS,Mem_Ptr)); t^.LS^.cat := DEMPRO;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_DEMPROrecord), LoopHoles.Retype(t^.LS^.DEMPROfield,Mem_Ptr));
         t^.LS^.DEMPROfield^ := rec.DEMPROrec;
      END;
BDET: BEGIN
         LISTREE_MakeStree(LoopHoles.Retype(t,LISTREE_pStree)); t^.cat := BDET;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_LSRecord),LoopHoles.Retype(t^.LS,Mem_Ptr)); t^.LS^.cat := BDET;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_BDETrecord), LoopHoles.Retype(t^.LS^.BDETfield,Mem_Ptr));
         t^.LS^.BDETfield^ := rec.BDETrec;
      END;
DIGIT: BEGIN
         LISTREE_MakeStree(LoopHoles.Retype(t,LISTREE_pStree)); t^.cat := DIGIT;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_LSRecord),LoopHoles.Retype(t^.LS,Mem_Ptr)); t^.LS^.cat := DIGIT;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_DIGITrecord), LoopHoles.Retype(t^.LS^.DIGITfield,Mem_Ptr));
         t^.LS^.DIGITfield^ := rec.DIGITrec;
      END;
EN: BEGIN
         LISTREE_MakeStree(LoopHoles.Retype(t,LISTREE_pStree)); t^.cat := EN;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_LSRecord),LoopHoles.Retype(t^.LS,Mem_Ptr)); t^.LS^.cat := EN;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_ENrecord), LoopHoles.Retype(t^.LS^.ENfield,Mem_Ptr));
         t^.LS^.ENfield^ := rec.ENrec;
      END;
EMPTY: BEGIN
         LISTREE_MakeStree(LoopHoles.Retype(t,LISTREE_pStree)); t^.cat := EMPTY;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_LSRecord),LoopHoles.Retype(t^.LS,Mem_Ptr)); t^.LS^.cat := EMPTY;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_EMPTYrecord), LoopHoles.Retype(t^.LS^.EMPTYfield,Mem_Ptr));
         t^.LS^.EMPTYfield^ := rec.EMPTYrec;
      END;
EXCLAM: BEGIN
         LISTREE_MakeStree(LoopHoles.Retype(t,LISTREE_pStree)); t^.cat := EXCLAM;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_LSRecord),LoopHoles.Retype(t^.LS,Mem_Ptr)); t^.LS^.cat := EXCLAM;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_EXCLAMrecord), LoopHoles.Retype(t^.LS^.EXCLAMfield,Mem_Ptr));
         t^.LS^.EXCLAMfield^ := rec.EXCLAMrec;
      END;
GEN: BEGIN
         LISTREE_MakeStree(LoopHoles.Retype(t,LISTREE_pStree)); t^.cat := GEN;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_LSRecord),LoopHoles.Retype(t^.LS,Mem_Ptr)); t^.LS^.cat := GEN;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_GENrecord), LoopHoles.Retype(t^.LS^.GENfield,Mem_Ptr));
         t^.LS^.GENfield^ := rec.GENrec;
      END;
INDEFPRO: BEGIN
         LISTREE_MakeStree(LoopHoles.Retype(t,LISTREE_pStree)); t^.cat := INDEFPRO;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_LSRecord),LoopHoles.Retype(t^.LS,Mem_Ptr)); t^.LS^.cat := INDEFPRO;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_INDEFPROrecord), LoopHoles.Retype(t^.LS^.INDEFPROfield,Mem_Ptr));
         t^.LS^.INDEFPROfield^ := rec.INDEFPROrec;
      END;
SUBINDEFPRO: BEGIN
         LISTREE_MakeStree(LoopHoles.Retype(t,LISTREE_pStree)); t^.cat := SUBINDEFPRO;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_LSRecord),LoopHoles.Retype(t^.LS,Mem_Ptr)); t^.LS^.cat := SUBINDEFPRO;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_INDEFPROrecord), LoopHoles.Retype(t^.LS^.SUBINDEFPROfield,Mem_Ptr));
         t^.LS^.SUBINDEFPROfield^ := rec.SUBINDEFPROrec;
      END;
NEG: BEGIN
         LISTREE_MakeStree(LoopHoles.Retype(t,LISTREE_pStree)); t^.cat := NEG;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_LSRecord),LoopHoles.Retype(t^.LS,Mem_Ptr)); t^.LS^.cat := NEG;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_NEGrecord), LoopHoles.Retype(t^.LS^.NEGfield,Mem_Ptr));
         t^.LS^.NEGfield^ := rec.NEGrec;
      END;
BNOUNSUFF: BEGIN
         LISTREE_MakeStree(LoopHoles.Retype(t,LISTREE_pStree)); t^.cat := BNOUNSUFF;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_LSRecord),LoopHoles.Retype(t^.LS,Mem_Ptr)); t^.LS^.cat := BNOUNSUFF;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_BNOUNrecord), LoopHoles.Retype(t^.LS^.BNOUNSUFFfield,Mem_Ptr));
         t^.LS^.BNOUNSUFFfield^ := rec.BNOUNSUFFrec;
      END;
BNOUN: BEGIN
         LISTREE_MakeStree(LoopHoles.Retype(t,LISTREE_pStree)); t^.cat := BNOUN;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_LSRecord),LoopHoles.Retype(t^.LS,Mem_Ptr)); t^.LS^.cat := BNOUN;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_BNOUNrecord), LoopHoles.Retype(t^.LS^.BNOUNfield,Mem_Ptr));
         t^.LS^.BNOUNfield^ := rec.BNOUNrec;
      END;
NUM: BEGIN
         LISTREE_MakeStree(LoopHoles.Retype(t,LISTREE_pStree)); t^.cat := NUM;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_LSRecord),LoopHoles.Retype(t^.LS,Mem_Ptr)); t^.LS^.cat := NUM;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_NUMrecord), LoopHoles.Retype(t^.LS^.NUMfield,Mem_Ptr));
         t^.LS^.NUMfield^ := rec.NUMrec;
      END;
ORDINAL: BEGIN
         LISTREE_MakeStree(LoopHoles.Retype(t,LISTREE_pStree)); t^.cat := ORDINAL;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_LSRecord),LoopHoles.Retype(t^.LS,Mem_Ptr)); t^.LS^.cat := ORDINAL;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_ORDINALrecord), LoopHoles.Retype(t^.LS^.ORDINALfield,Mem_Ptr));
         t^.LS^.ORDINALfield^ := rec.ORDINALrec;
      END;
PART: BEGIN
         LISTREE_MakeStree(LoopHoles.Retype(t,LISTREE_pStree)); t^.cat := PART;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_LSRecord),LoopHoles.Retype(t^.LS,Mem_Ptr)); t^.LS^.cat := PART;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_PARTICLErecord), LoopHoles.Retype(t^.LS^.PARTfield,Mem_Ptr));
         t^.LS^.PARTfield^ := rec.PARTrec;
      END;
BPERSPRO: BEGIN
         LISTREE_MakeStree(LoopHoles.Retype(t,LISTREE_pStree)); t^.cat := BPERSPRO;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_LSRecord),LoopHoles.Retype(t^.LS,Mem_Ptr)); t^.LS^.cat := BPERSPRO;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_BPERSPROrecord), LoopHoles.Retype(t^.LS^.BPERSPROfield,Mem_Ptr));
         t^.LS^.BPERSPROfield^ := rec.BPERSPROrec;
      END;
POS: BEGIN
         LISTREE_MakeStree(LoopHoles.Retype(t,LISTREE_pStree)); t^.cat := POS;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_LSRecord),LoopHoles.Retype(t^.LS,Mem_Ptr)); t^.LS^.cat := POS;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_POSrecord), LoopHoles.Retype(t^.LS^.POSfield,Mem_Ptr));
         t^.LS^.POSfield^ := rec.POSrec;
      END;
BPREFIX: BEGIN
         LISTREE_MakeStree(LoopHoles.Retype(t,LISTREE_pStree)); t^.cat := BPREFIX;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_LSRecord),LoopHoles.Retype(t^.LS,Mem_Ptr)); t^.LS^.cat := BPREFIX;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_BPREFIXrecord), LoopHoles.Retype(t^.LS^.BPREFIXfield,Mem_Ptr));
         t^.LS^.BPREFIXfield^ := rec.BPREFIXrec;
      END;
SUBPREP: BEGIN
         LISTREE_MakeStree(LoopHoles.Retype(t,LISTREE_pStree)); t^.cat := SUBPREP;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_LSRecord),LoopHoles.Retype(t^.LS,Mem_Ptr)); t^.LS^.cat := SUBPREP;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_PREPrecord), LoopHoles.Retype(t^.LS^.SUBPREPfield,Mem_Ptr));
         t^.LS^.SUBPREPfield^ := rec.SUBPREPrec;
      END;
PREP: BEGIN
         LISTREE_MakeStree(LoopHoles.Retype(t,LISTREE_pStree)); t^.cat := PREP;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_LSRecord),LoopHoles.Retype(t^.LS,Mem_Ptr)); t^.LS^.cat := PREP;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_PREPrecord), LoopHoles.Retype(t^.LS^.PREPfield,Mem_Ptr));
         t^.LS^.PREPfield^ := rec.PREPrec;
      END;
BPROPERNOUN: BEGIN
         LISTREE_MakeStree(LoopHoles.Retype(t,LISTREE_pStree)); t^.cat := BPROPERNOUN;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_LSRecord),LoopHoles.Retype(t^.LS,Mem_Ptr)); t^.LS^.cat := BPROPERNOUN;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_BPROPERNOUNrecord), LoopHoles.Retype(t^.LS^.BPROPERNOUNfield,Mem_Ptr));
         t^.LS^.BPROPERNOUNfield^ := rec.BPROPERNOUNrec;
      END;
PROSENT: BEGIN
         LISTREE_MakeStree(LoopHoles.Retype(t,LISTREE_pStree)); t^.cat := PROSENT;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_LSRecord),LoopHoles.Retype(t^.LS,Mem_Ptr)); t^.LS^.cat := PROSENT;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_PROSENTrecord), LoopHoles.Retype(t^.LS^.PROSENTfield,Mem_Ptr));
         t^.LS^.PROSENTfield^ := rec.PROSENTrec;
      END;
PUNC: BEGIN
         LISTREE_MakeStree(LoopHoles.Retype(t,LISTREE_pStree)); t^.cat := PUNC;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_LSRecord),LoopHoles.Retype(t^.LS,Mem_Ptr)); t^.LS^.cat := PUNC;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_PUNCrecord), LoopHoles.Retype(t^.LS^.PUNCfield,Mem_Ptr));
         t^.LS^.PUNCfield^ := rec.PUNCrec;
      END;
Q: BEGIN
         LISTREE_MakeStree(LoopHoles.Retype(t,LISTREE_pStree)); t^.cat := Q;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_LSRecord),LoopHoles.Retype(t^.LS,Mem_Ptr)); t^.LS^.cat := Q;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_Qrecord), LoopHoles.Retype(t^.LS^.Qfield,Mem_Ptr));
         t^.LS^.Qfield^ := rec.Qrec;
      END;
RECIPRO: BEGIN
         LISTREE_MakeStree(LoopHoles.Retype(t,LISTREE_pStree)); t^.cat := RECIPRO;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_LSRecord),LoopHoles.Retype(t^.LS,Mem_Ptr)); t^.LS^.cat := RECIPRO;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_RECIPROrecord), LoopHoles.Retype(t^.LS^.RECIPROfield,Mem_Ptr));
         t^.LS^.RECIPROfield^ := rec.RECIPROrec;
      END;
REFLPRO: BEGIN
         LISTREE_MakeStree(LoopHoles.Retype(t,LISTREE_pStree)); t^.cat := REFLPRO;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_LSRecord),LoopHoles.Retype(t^.LS,Mem_Ptr)); t^.LS^.cat := REFLPRO;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_REFLPROrecord), LoopHoles.Retype(t^.LS^.REFLPROfield,Mem_Ptr));
         t^.LS^.REFLPROfield^ := rec.REFLPROrec;
      END;
RELPRO: BEGIN
         LISTREE_MakeStree(LoopHoles.Retype(t,LISTREE_pStree)); t^.cat := RELPRO;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_LSRecord),LoopHoles.Retype(t^.LS,Mem_Ptr)); t^.LS^.cat := RELPRO;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_RELPROrecord), LoopHoles.Retype(t^.LS^.RELPROfield,Mem_Ptr));
         t^.LS^.RELPROfield^ := rec.RELPROrec;
      END;
TOCAT: BEGIN
         LISTREE_MakeStree(LoopHoles.Retype(t,LISTREE_pStree)); t^.cat := TOCAT;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_LSRecord),LoopHoles.Retype(t^.LS,Mem_Ptr)); t^.LS^.cat := TOCAT;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_TOCATrecord), LoopHoles.Retype(t^.LS^.TOCATfield,Mem_Ptr));
         t^.LS^.TOCATfield^ := rec.TOCATrec;
      END;
THANAS: BEGIN
         LISTREE_MakeStree(LoopHoles.Retype(t,LISTREE_pStree)); t^.cat := THANAS;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_LSRecord),LoopHoles.Retype(t^.LS,Mem_Ptr)); t^.LS^.cat := THANAS;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_THANASrecord), LoopHoles.Retype(t^.LS^.THANASfield,Mem_Ptr));
         t^.LS^.THANASfield^ := rec.THANASrec;
      END;
THERE: BEGIN
         LISTREE_MakeStree(LoopHoles.Retype(t,LISTREE_pStree)); t^.cat := THERE;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_LSRecord),LoopHoles.Retype(t^.LS,Mem_Ptr)); t^.LS^.cat := THERE;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_THERErecord), LoopHoles.Retype(t^.LS^.THEREfield,Mem_Ptr));
         t^.LS^.THEREfield^ := rec.THERErec;
      END;
BVERBSUFF: BEGIN
         LISTREE_MakeStree(LoopHoles.Retype(t,LISTREE_pStree)); t^.cat := BVERBSUFF;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_LSRecord),LoopHoles.Retype(t^.LS,Mem_Ptr)); t^.LS^.cat := BVERBSUFF;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_BVERBrecord), LoopHoles.Retype(t^.LS^.BVERBSUFFfield,Mem_Ptr));
         t^.LS^.BVERBSUFFfield^ := rec.BVERBSUFFrec;
      END;
BVERB: BEGIN
         LISTREE_MakeStree(LoopHoles.Retype(t,LISTREE_pStree)); t^.cat := BVERB;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_LSRecord),LoopHoles.Retype(t^.LS,Mem_Ptr)); t^.LS^.cat := BVERB;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_BVERBrecord), LoopHoles.Retype(t^.LS^.BVERBfield,Mem_Ptr));
         t^.LS^.BVERBfield^ := rec.BVERBrec;
      END;
BWHPRO: BEGIN
         LISTREE_MakeStree(LoopHoles.Retype(t,LISTREE_pStree)); t^.cat := BWHPRO;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_LSRecord),LoopHoles.Retype(t^.LS,Mem_Ptr)); t^.LS^.cat := BWHPRO;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_BWHPROrecord), LoopHoles.Retype(t^.LS^.BWHPROfield,Mem_Ptr));
         t^.LS^.BWHPROfield^ := rec.BWHPROrec;
      END;
WHPRO: BEGIN
         LISTREE_MakeStree(LoopHoles.Retype(t,LISTREE_pStree)); t^.cat := WHPRO;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_LSRecord),LoopHoles.Retype(t^.LS,Mem_Ptr)); t^.LS^.cat := WHPRO;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_WHPROrecord), LoopHoles.Retype(t^.LS^.WHPROfield,Mem_Ptr));
         t^.LS^.WHPROfield^ := rec.WHPROrec;
      END;
SFCAT: BEGIN
         LISTREE_MakeStree(LoopHoles.Retype(t,LISTREE_pStree)); t^.cat := SFCAT;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_LSRecord),LoopHoles.Retype(t^.LS,Mem_Ptr)); t^.LS^.cat := SFCAT;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_xxkeyrecord), LoopHoles.Retype(t^.LS^.SFCATfield,Mem_Ptr));
         t^.LS^.SFCATfield^ := rec.SFCATrec;
      END;
PFCAT: BEGIN
         LISTREE_MakeStree(LoopHoles.Retype(t,LISTREE_pStree)); t^.cat := PFCAT;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_LSRecord),LoopHoles.Retype(t^.LS,Mem_Ptr)); t^.LS^.cat := PFCAT;
         Mem_NewDefault(LOOPHOLES.SIZEOF(LSDOMAINT_xxkeyrecord), LoopHoles.Retype(t^.LS^.PFCATfield,Mem_Ptr));
         t^.LS^.PFCATfield^ := rec.PFCATrec;
      END;
   END;
   MAKET_StreeFromBLEXrec := t;
END;

FUNCTION MAKET_BlexrecFromStree(key: INTEGER;
t:LSSTREE_pStree): LSDOMAINT_BlexStruct;
VAR b: LSDOMAINT_BlexStruct;
BEGIN
   b.key := key;
   b.IsBxpr := true;
   b.cat := t^.LS^.cat;
   CASE t^.LS^.cat OF
        BADJSUFF: b.BADJSUFFrec := t^.LS^.BADJSUFFfield^;
        BADJ: b.BADJrec := t^.LS^.BADJfield^;
        BADVSUFF: b.BADVSUFFrec := t^.LS^.BADVSUFFfield^;
        BADV: b.BADVrec := t^.LS^.BADVfield^;
        ART: b.ARTrec := t^.LS^.ARTfield^;
        BBIGPRO: b.BBIGPROrec := t^.LS^.BBIGPROfield^;
        BIRRPREF: b.BIRRPREFrec := t^.LS^.BIRRPREFfield^;
        CONJ: b.CONJrec := t^.LS^.CONJfield^;
        COORD: b.COORDrec := t^.LS^.COORDfield^;
        DEMADJ: b.DEMADJrec := t^.LS^.DEMADJfield^;
        DEMPRO: b.DEMPROrec := t^.LS^.DEMPROfield^;
        BDET: b.BDETrec := t^.LS^.BDETfield^;
        DIGIT: b.DIGITrec := t^.LS^.DIGITfield^;
        EN: b.ENrec := t^.LS^.ENfield^;
        EMPTY: b.EMPTYrec := t^.LS^.EMPTYfield^;
        EXCLAM: b.EXCLAMrec := t^.LS^.EXCLAMfield^;
        GEN: b.GENrec := t^.LS^.GENfield^;
        INDEFPRO: b.INDEFPROrec := t^.LS^.INDEFPROfield^;
        SUBINDEFPRO: b.SUBINDEFPROrec := t^.LS^.SUBINDEFPROfield^;
        NEG: b.NEGrec := t^.LS^.NEGfield^;
        BNOUNSUFF: b.BNOUNSUFFrec := t^.LS^.BNOUNSUFFfield^;
        BNOUN: b.BNOUNrec := t^.LS^.BNOUNfield^;
        NUM: b.NUMrec := t^.LS^.NUMfield^;
        ORDINAL: b.ORDINALrec := t^.LS^.ORDINALfield^;
        PART: b.PARTrec := t^.LS^.PARTfield^;
        BPERSPRO: b.BPERSPROrec := t^.LS^.BPERSPROfield^;
        POS: b.POSrec := t^.LS^.POSfield^;
        BPREFIX: b.BPREFIXrec := t^.LS^.BPREFIXfield^;
        SUBPREP: b.SUBPREPrec := t^.LS^.SUBPREPfield^;
        PREP: b.PREPrec := t^.LS^.PREPfield^;
        BPROPERNOUN: b.BPROPERNOUNrec := t^.LS^.BPROPERNOUNfield^;
        PROSENT: b.PROSENTrec := t^.LS^.PROSENTfield^;
        PUNC: b.PUNCrec := t^.LS^.PUNCfield^;
        Q: b.Qrec := t^.LS^.Qfield^;
        RECIPRO: b.RECIPROrec := t^.LS^.RECIPROfield^;
        REFLPRO: b.REFLPROrec := t^.LS^.REFLPROfield^;
        RELPRO: b.RELPROrec := t^.LS^.RELPROfield^;
        TOCAT: b.TOCATrec := t^.LS^.TOCATfield^;
        THANAS: b.THANASrec := t^.LS^.THANASfield^;
        THERE: b.THERErec := t^.LS^.THEREfield^;
        BVERBSUFF: b.BVERBSUFFrec := t^.LS^.BVERBSUFFfield^;
        BVERB: b.BVERBrec := t^.LS^.BVERBfield^;
        BWHPRO: b.BWHPROrec := t^.LS^.BWHPROfield^;
        WHPRO: b.WHPROrec := t^.LS^.WHPROfield^;
        SFCAT: b.SFCATrec := t^.LS^.SFCATfield^;
        PFCAT: b.PFCATrec := t^.LS^.PFCATfield^;
   END;
   MAKET_BlexrecFromStree := b;
END;
