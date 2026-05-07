PROCEDURE NP1RULE_0(VAR rec:NP1RULEtyp);
BEGIN WITH rec^ DO BEGIN
WHDETFOUND:=FALSE;
QPFOUND:=FALSE;
GENPOSS:=TRUE;
GENREAL:=FALSE;
DETDEFPAR:=OMEGADEF;
DETRELFOUND:=FALSE;
                                                      END;END;
                                                      FUNCTION NP1RULE_1
(VAR rec:NP1RULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
DETRELFOUND:=TRUE;
                                                      END;
                                                      END;NP1RULE_1:=result;
END;
                                                      FUNCTION NP1RULE_2
(VAR rec:NP1RULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
DETRELFOUND:=TRUE;
                                                      QPFOUND:=QPUNDERDETP(B);
                                                      DETDEFPAR:=
b^.ls^.DETPfield^.DEFINITE;
                                                       IF 
b^.ls^.DETPfield^.MOOD=WH
THEN
WHDETFOUND:=TRUE;
                                                      END;
                                                      END;NP1RULE_2:=result;
END;
                                                      FUNCTION NP1RULE_3
(VAR rec:NP1RULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
DETRELFOUND:=TRUE;
                                                      GENPOSS:=FALSE;
                                                      END;
                                                      END;NP1RULE_3:=result;
END;
                                                      FUNCTION NP1RULE_4
(VAR rec:NP1RULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
(((
b^.ls^.CNfield^.DEFINITE=DEF) AND WHDETFOUND) OR (
b^.ls^.CNfield^.DEFINITE=OMEGADEF) OR (
b^.ls^.CNfield^.DEFINITE=DETDEFPAR)) AND ((PLURAL IN 
b^.ls^.CNfield^.NUMBERS) OR (DETRELFOUND) OR (MASS IN 
b^.ls^.CNfield^.POSSCOMAS)) AND ((PLURAL IN 
b^.ls^.CNfield^.NUMBERS) OR (DETRELFOUND) OR ( NOT PNUNDERCN(B)))                                        
THEN result:=TRUE;IF result THEN
BEGIN
END;
                                                      END;NP1RULE_4:=result;
END;
                                                      FUNCTION NP1RULE_5
(VAR rec:NP1RULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
GENPOSS                                               
THEN result:=TRUE;IF result THEN
BEGIN
END;
                                                      END;NP1RULE_5:=result;
END;
                                                      FUNCTION NP1RULE_6
(VAR rec:NP1RULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
GENPOSS                                               
THEN result:=TRUE;IF result THEN
BEGIN
GENREAL:=TRUE;
                                                      END;
                                                      END;NP1RULE_6:=result;
END;
                                                      FUNCTION NP1RULE_7
(VAR rec:NP1RULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
QPFOUND AND  NOT GENREAL                              
THEN result:=TRUE;IF result THEN
BEGIN
END;
                                                      END;NP1RULE_7:=result;
END;
                                                       FUNCTION comp_NP1RULE(rec1,rec2:NP1RULEtyp):BOOLEAN;
BEGIN WITH rec1^ DO comp_NP1RULE:=
(WHDETFOUND=rec2^.WHDETFOUND) AND
(QPFOUND=rec2^.QPFOUND) AND
(GENPOSS=rec2^.GENPOSS) AND
(GENREAL=rec2^.GENREAL) AND
(DETDEFPAR=rec2^.DETDEFPAR) AND
(DETRELFOUND=rec2^.DETRELFOUND)
END;
PROCEDURE NP2RULE_0(VAR rec:NP2RULEtyp);
BEGIN WITH rec^ DO BEGIN
MODPOSSPROFOUND:=FALSE;
GENPOSS:=TRUE;
GENREAL:=FALSE;
                                                      END;END;
                                                      FUNCTION NP2RULE_1
(VAR rec:NP2RULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
GENPOSS:=FALSE;
                                                      END;
                                                      END;NP2RULE_1:=result;
END;
                                                      FUNCTION NP2RULE_2
(VAR rec:NP2RULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
GENPOSS:=FALSE;
                                                      END;
                                                      END;NP2RULE_2:=result;
END;
                                                      FUNCTION NP2RULE_3
(VAR rec:NP2RULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
MODPOSSPROFOUND:=TRUE;
                                                      END;
                                                      END;NP2RULE_3:=result;
END;
                                                      FUNCTION NP2RULE_4
(VAR rec:NP2RULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
GENPOSS:=FALSE;
                                                      MODPOSSPROFOUND:=TRUE;
                                                      END;
                                                      END;NP2RULE_4:=result;
END;
                                                      FUNCTION NP2RULE_5
(VAR rec:NP2RULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
MODPOSSPROFOUND:=TRUE;
                                                      END;
                                                      END;NP2RULE_5:=result;
END;
                                                      FUNCTION NP2RULE_6
(VAR rec:NP2RULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
END;
                                                      END;NP2RULE_6:=result;
END;
                                                      FUNCTION NP2RULE_7
(VAR rec:NP2RULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
GENPOSS:=FALSE;
                                                      END;
                                                      END;NP2RULE_7:=result;
END;
                                                      FUNCTION NP2RULE_8
(VAR rec:NP2RULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
GENPOSS                                               
THEN result:=TRUE;IF result THEN
BEGIN
END;
                                                      END;NP2RULE_8:=result;
END;
                                                      FUNCTION NP2RULE_9
(VAR rec:NP2RULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
GENPOSS                                               
THEN result:=TRUE;IF result THEN
BEGIN
GENREAL:=TRUE;
                                                      END;
                                                      END;NP2RULE_9:=result;
END;
                                                      FUNCTION NP2RULE_10
(VAR rec:NP2RULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
MODPOSSPROFOUND AND  NOT GENREAL                      
THEN result:=TRUE;IF result THEN
BEGIN
END;
                                                      END;NP2RULE_10:=result;
END;
                                                       FUNCTION comp_NP2RULE(rec1,rec2:NP2RULEtyp):BOOLEAN;
BEGIN WITH rec1^ DO comp_NP2RULE:=
(MODPOSSPROFOUND=rec2^.MODPOSSPROFOUND) AND
(GENPOSS=rec2^.GENPOSS) AND
(GENREAL=rec2^.GENREAL)
END;
PROCEDURE NP3RULE_0(VAR rec:NP3RULEtyp);
BEGIN WITH rec^ DO BEGIN
                                                      END;END;
                                                      FUNCTION NP3RULE_1
(VAR rec:NP3RULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
END;
                                                      END;NP3RULE_1:=result;
END;
                                                      FUNCTION NP3RULE_2
(VAR rec:NP3RULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
END;
                                                      END;NP3RULE_2:=result;
END;
                                                      FUNCTION NP3RULE_3
(VAR rec:NP3RULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
END;
                                                      END;NP3RULE_3:=result;
END;
                                                       FUNCTION comp_NP3RULE(rec1,rec2:NP3RULEtyp):BOOLEAN;
BEGIN WITH rec1^ DO comp_NP3RULE:=
TRUE
END;
PROCEDURE NP4RULE_0(VAR rec:NP4RULEtyp);
BEGIN WITH rec^ DO BEGIN
                                                      END;END;
                                                      FUNCTION NP4RULE_1
(VAR rec:NP4RULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
END;
                                                      END;NP4RULE_1:=result;
END;
                                                       FUNCTION comp_NP4RULE(rec1,rec2:NP4RULEtyp):BOOLEAN;
BEGIN WITH rec1^ DO comp_NP4RULE:=
TRUE
END;
PROCEDURE NP5RULE_0(VAR rec:NP5RULEtyp);
BEGIN WITH rec^ DO BEGIN
                                                      END;END;
                                                      FUNCTION NP5RULE_1
(VAR rec:NP5RULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
END;
                                                      END;NP5RULE_1:=result;
END;
                                                       FUNCTION comp_NP5RULE(rec1,rec2:NP5RULEtyp):BOOLEAN;
BEGIN WITH rec1^ DO comp_NP5RULE:=
TRUE
END;
PROCEDURE CN1RULE_0(VAR rec:CN1RULEtyp);
BEGIN WITH rec^ DO BEGIN
NUMBERSPAR:=[SINGULAR];
ANIMATEPAR:=OMEGAANIMATE;
POSSCOMASPAR:=[COUNT];
THETANPPAR:=OMEGATHETANP;
NOUNPATTERNEFSPAR:=[];
PREPKEYPAR:=0;
COMPLEXPECTED:=FALSE;
NONHUMANNOUNEXPECTED:=FALSE;
                                                      END;END;
                                                      FUNCTION CN1RULE_1
(VAR rec:CN1RULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
END;
                                                      END;CN1RULE_1:=result;
END;
                                                      FUNCTION CN1RULE_5
(VAR rec:CN1RULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
POSSCOMASPAR:=
b^.ls^.DETPfield^.POSSCOMAS
END                                                   
                                                      END;CN1RULE_5:=result;
END;
                                                      FUNCTION CN1RULE_16
(VAR rec:CN1RULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
END;
                                                      END;CN1RULE_16:=result;
END;
                                                      FUNCTION CN1RULE_2
(VAR rec:CN1RULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
NUMBERSPAR:=
b^.ls^.NOUNfield^.NUMBERS;
                                                      ANIMATEPAR:=
b^.ls^.NOUNfield^.ANIMATE;
                                                      POSSCOMASPAR:=
b^.ls^.NOUNfield^.POSSCOMAS;
                                                      THETANPPAR:=
b^.ls^.NOUNfield^.THETANP;
                                                      NOUNPATTERNEFSPAR:=
b^.ls^.NOUNfield^.NOUNPATTERNS;
                                                      PREPKEYPAR:=
b^.ls^.NOUNfield^.PREPKEY;
                                                       IF 
b^.ls^.NOUNfield^.THETANP<>OMEGATHETANP
THEN
COMPLEXPECTED:=TRUE;
                                                      END;
                                                      END;CN1RULE_2:=result;
END;
                                                      FUNCTION CN1RULE_3
(VAR rec:CN1RULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
END;
                                                      END;CN1RULE_3:=result;
END;
                                                      FUNCTION CN1RULE_4
(VAR rec:CN1RULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
END;
                                                      END;CN1RULE_4:=result;
END;
                                                      FUNCTION CN1RULE_14
(VAR rec:CN1RULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
(COMPLEXPECTED) AND (
b^.ls^.PREPPfield^.HEADKEY=PREPKEYPAR) AND (NOUNPATTERNEFSPAR*[SYNPREPNP,SYNPREPNP_THATSENT,
SYNPREPNP_QSENT]<>[])                                 
THEN result:=TRUE;IF result THEN
BEGIN
END;
                                                      END;CN1RULE_14:=result;
END;
                                                      FUNCTION CN1RULE_15
(VAR rec:CN1RULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
(COMPLEXPECTED) AND ((
b^.ls^.SENTENCEfield^.CONJKEY=auxkey('THATCONJKEY')) AND (
b^.ls^.SENTENCEfield^.MOOD=DECLARATIVE) AND (SYNTHATSENT IN NOUNPATTERNEFSPAR)) OR ((
b^.ls^.SENTENCEfield^.CONJKEY=auxkey('WHETHERCONJKEY')) AND (
b^.ls^.SENTENCEfield^.MOOD=YESNOINTERROGATIVE) AND (SYNQSENT IN NOUNPATTERNEFSPAR)) OR ((
b^.ls^.SENTENCEfield^.MOOD=WHINTERROGATIVE) AND (SYNQSENT IN NOUNPATTERNEFSPAR)) AND (
b^.ls^.SENTENCEfield^.COORD<>CORRCOORD)               
THEN result:=TRUE;IF result THEN
BEGIN
END;
                                                      END;CN1RULE_15:=result;
END;
                                                      FUNCTION CN1RULE_13
(VAR rec:CN1RULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
NUMBERSPAR=[SINGULAR]                                 
THEN result:=TRUE;IF result THEN
BEGIN
NONHUMANNOUNEXPECTED:=TRUE;
                                                      END;
                                                      END;CN1RULE_13:=result;
END;
                                                      FUNCTION CN1RULE_17
(VAR rec:CN1RULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
NUMBERSPAR=[SINGULAR]                                 
THEN result:=TRUE;IF result THEN
BEGIN
END;
                                                      END;CN1RULE_17:=result;
END;
                                                      FUNCTION CN1RULE_18
(VAR rec:CN1RULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
 NOT (DETPUNDERNP(B))                                 
THEN result:=TRUE;IF result THEN
BEGIN
END;
                                                      END;CN1RULE_18:=result;
END;
                                                      FUNCTION CN1RULE_9
(VAR rec:CN1RULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
END;
                                                      END;CN1RULE_9:=result;
END;
                                                       FUNCTION comp_CN1RULE(rec1,rec2:CN1RULEtyp):BOOLEAN;
BEGIN WITH rec1^ DO comp_CN1RULE:=
(NUMBERSPAR=rec2^.NUMBERSPAR) AND
(ANIMATEPAR=rec2^.ANIMATEPAR) AND
(POSSCOMASPAR=rec2^.POSSCOMASPAR) AND
(THETANPPAR=rec2^.THETANPPAR) AND
(NOUNPATTERNEFSPAR=rec2^.NOUNPATTERNEFSPAR) AND
(PREPKEYPAR=rec2^.PREPKEYPAR) AND
(COMPLEXPECTED=rec2^.COMPLEXPECTED) AND
(NONHUMANNOUNEXPECTED=rec2^.NONHUMANNOUNEXPECTED)
END;
PROCEDURE DETPRULE_0(VAR rec:DETPRULEtyp);
BEGIN WITH rec^ DO BEGIN
                                                      END;END;
                                                      FUNCTION DETPRULE_1
(VAR rec:DETPRULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
END;
                                                      END;DETPRULE_1:=result;
END;
                                                      FUNCTION DETPRULE_2
(VAR rec:DETPRULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
END;
                                                      END;DETPRULE_2:=result;
END;
                                                      FUNCTION DETPRULE_3
(VAR rec:DETPRULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
END;
                                                      END;DETPRULE_3:=result;
END;
                                                      FUNCTION DETPRULE_4
(VAR rec:DETPRULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
END;
                                                      END;DETPRULE_4:=result;
END;
                                                      FUNCTION DETPRULE_5
(VAR rec:DETPRULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
END;
                                                      END;DETPRULE_5:=result;
END;
                                                      FUNCTION DETPRULE_6
(VAR rec:DETPRULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
END;
                                                      END;DETPRULE_6:=result;
END;
                                                      FUNCTION DETPRULE_7
(VAR rec:DETPRULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
END;
                                                      END;DETPRULE_7:=result;
END;
                                                      FUNCTION DETPRULE_8
(VAR rec:DETPRULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
END;
                                                      END;DETPRULE_8:=result;
END;
                                                      FUNCTION DETPRULE_9
(VAR rec:DETPRULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
END;
                                                      END;DETPRULE_9:=result;
END;
                                                      FUNCTION DETPRULE_10
(VAR rec:DETPRULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
END;
                                                      END;DETPRULE_10:=result;
END;
                                                      FUNCTION DETPRULE_11
(VAR rec:DETPRULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
END;
                                                      END;DETPRULE_11:=result;
END;
                                                       FUNCTION comp_DETPRULE(rec1,rec2:DETPRULEtyp):BOOLEAN;
BEGIN WITH rec1^ DO comp_DETPRULE:=
TRUE
END;
PROCEDURE PREPPRULE_0(VAR rec:PREPPRULEtyp);
BEGIN WITH rec^ DO BEGIN
ACTSUBCEFSVAR:=[];
                                                      END;END;
                                                      FUNCTION PREPPRULE_1
(VAR rec:PREPPRULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
ACTSUBCEFSVAR:=
b^.ls^.PREPfield^.SUBCS;
                                                      END;
                                                      END;PREPPRULE_1:=result;
END;
                                                      FUNCTION PREPPRULE_2
(VAR rec:PREPPRULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
((ACTSUBCEFSVAR<>[TEMP]) OR (
b^.ls^.NPfield^.TEMPORAL=TRUE))                       
THEN result:=TRUE;IF result THEN
BEGIN
END;
                                                      END;PREPPRULE_2:=result;
END;
                                                      FUNCTION PREPPRULE_3
(VAR rec:PREPPRULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
END;
                                                      END;PREPPRULE_3:=result;
END;
                                                      FUNCTION PREPPRULE_4
(VAR rec:PREPPRULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
END;
                                                      END;PREPPRULE_4:=result;
END;
                                                      FUNCTION PREPPRULE_5
(VAR rec:PREPPRULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
END;
                                                      END;PREPPRULE_5:=result;
END;
                                                      FUNCTION PREPPRULE_6
(VAR rec:PREPPRULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
END;
                                                      END;PREPPRULE_6:=result;
END;
                                                      FUNCTION PREPPRULE_7
(VAR rec:PREPPRULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
END;
                                                      END;PREPPRULE_7:=result;
END;
                                                      FUNCTION PREPPRULE_8
(VAR rec:PREPPRULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
END;
                                                      END;PREPPRULE_8:=result;
END;
                                                       FUNCTION comp_PREPPRULE(rec1,rec2:PREPPRULEtyp):BOOLEAN;
BEGIN WITH rec1^ DO comp_PREPPRULE:=
(ACTSUBCEFSVAR=rec2^.ACTSUBCEFSVAR)
END;
PROCEDURE ADVPRULE1_0(VAR rec:ADVPRULE1typ);
BEGIN WITH rec^ DO BEGIN
PRECOMPLFOUND:=FALSE;
POSTCOMPLFOUND:=FALSE;
THANPPOSSIBLE:=FALSE;
DEGREEMODFOUND:=FALSE;
DEGREEADVEXPECTED:=FALSE;
DEGREEADVFOUND:=FALSE;
                                                      END;END;
                                                      FUNCTION ADVPRULE1_1
(VAR rec:ADVPRULE1typ;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
END;
                                                      END;ADVPRULE1_1:=result;
END;
                                                      FUNCTION ADVPRULE1_2
(VAR rec:ADVPRULE1typ;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
( NOT PRECOMPLFOUND) AND ( NOT POSTCOMPLFOUND)        
THEN result:=TRUE;IF result THEN
BEGIN
POSTCOMPLFOUND:=TRUE;
                                                      END;
                                                      END;ADVPRULE1_2:=result;
END;
                                                      FUNCTION ADVPRULE1_3
(VAR rec:ADVPRULE1typ;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
( NOT PRECOMPLFOUND) AND ( NOT POSTCOMPLFOUND)        
THEN result:=TRUE;IF result THEN
BEGIN
POSTCOMPLFOUND:=TRUE;
                                                      END;
                                                      END;ADVPRULE1_3:=result;
END;
                                                      FUNCTION ADVPRULE1_4
(VAR rec:ADVPRULE1typ;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
( NOT PRECOMPLFOUND) AND ( NOT POSTCOMPLFOUND)        
THEN result:=TRUE;IF result THEN
BEGIN
PRECOMPLFOUND:=TRUE;
                                                      END;
                                                      END;ADVPRULE1_4:=result;
END;
                                                      FUNCTION ADVPRULE1_44
(VAR rec:ADVPRULE1typ;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
 NOT DEGREEMODFOUND                                   
THEN result:=TRUE;IF result THEN
BEGIN
DEGREEADVEXPECTED:=TRUE;
                                                      DEGREEMODFOUND:=TRUE;
                                                      END;
                                                      END;ADVPRULE1_44:=result;
END;
                                                      FUNCTION ADVPRULE1_5
(VAR rec:ADVPRULE1typ;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
 NOT DEGREEMODFOUND                                   
THEN result:=TRUE;IF result THEN
BEGIN
 IF 
b^.ls^.QPfield^.THANAS<>OMEGACOMPL
THEN
THANPPOSSIBLE:=TRUE;
                                                      DEGREEMODFOUND:=TRUE;
                                                      END;
                                                      END;ADVPRULE1_5:=result;
END;
                                                      FUNCTION ADVPRULE1_6
(VAR rec:ADVPRULE1typ;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
 NOT DEGREEMODFOUND                                   
THEN result:=TRUE;IF result THEN
BEGIN
 IF 
b^.ls^.ADVPfield^.THANAS=ASCOMPL
THEN
THANPPOSSIBLE:=TRUE;
                                                      DEGREEMODFOUND:=TRUE;
                                                      END;
                                                      END;ADVPRULE1_6:=result;
END;
                                                      FUNCTION ADVPRULE1_7
(VAR rec:ADVPRULE1typ;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
THANPPOSSIBLE                                         
THEN result:=TRUE;IF result THEN
BEGIN
END;
                                                      END;ADVPRULE1_7:=result;
END;
                                                       FUNCTION comp_ADVPRULE1(rec1,rec2:ADVPRULE1typ):BOOLEAN;
BEGIN WITH rec1^ DO comp_ADVPRULE1:=
(PRECOMPLFOUND=rec2^.PRECOMPLFOUND) AND
(POSTCOMPLFOUND=rec2^.POSTCOMPLFOUND) AND
(THANPPOSSIBLE=rec2^.THANPPOSSIBLE) AND
(DEGREEMODFOUND=rec2^.DEGREEMODFOUND) AND
(DEGREEADVEXPECTED=rec2^.DEGREEADVEXPECTED) AND
(DEGREEADVFOUND=rec2^.DEGREEADVFOUND)
END;
PROCEDURE NP6RULE_0(VAR rec:NP6RULEtyp);
BEGIN WITH rec^ DO BEGIN
                                                      END;END;
                                                      FUNCTION NP6RULE_1
(VAR rec:NP6RULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
END;
                                                      END;NP6RULE_1:=result;
END;
                                                       FUNCTION comp_NP6RULE(rec1,rec2:NP6RULEtyp):BOOLEAN;
BEGIN WITH rec1^ DO comp_NP6RULE:=
TRUE
END;
PROCEDURE NP7RULE_0(VAR rec:NP7RULEtyp);
BEGIN WITH rec^ DO BEGIN
NUMBERPAR:=OMEGANUMBER;
CASESPAR:=[NOMINATIVE,ACCUSATIVE];
                                                      END;END;
                                                      FUNCTION NP7RULE_1
(VAR rec:NP7RULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
NUMBERPAR:=
b^.ls^.NPfield^.NUMBER;
                                                      CASESPAR:=
b^.ls^.NPfield^.CASES;
                                                      END;
                                                      END;NP7RULE_1:=result;
END;
                                                      FUNCTION NP7RULE_2
(VAR rec:NP7RULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
END;
                                                      END;NP7RULE_2:=result;
END;
                                                      FUNCTION NP7RULE_3
(VAR rec:NP7RULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
(
b^.ls^.NPfield^.NUMBER=NUMBERPAR) AND (
b^.ls^.NPfield^.CASES=CASESPAR)                       
THEN result:=TRUE;IF result THEN
BEGIN
END;
                                                      END;NP7RULE_3:=result;
END;
                                                      FUNCTION NP7RULE_4
(VAR rec:NP7RULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
END;
                                                      END;NP7RULE_4:=result;
END;
                                                       FUNCTION comp_NP7RULE(rec1,rec2:NP7RULEtyp):BOOLEAN;
BEGIN WITH rec1^ DO comp_NP7RULE:=
(NUMBERPAR=rec2^.NUMBERPAR) AND
(CASESPAR=rec2^.CASESPAR)
END;
