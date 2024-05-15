PROCEDURE NP1RULE_0(VAR rec:NP1RULEtyp);
BEGIN WITH rec^ DO BEGIN
QPUNDERDETPFOUND:=FALSE;
WHDETFOUND:=FALSE;
DEFINITEPAR:=OMEGADEF;
POSSCOMASPAR:=[];
                                                      END;END;
                                                      FUNCTION NP1RULE_1
(VAR rec:NP1RULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
 IF 
b^.ls^.POSSADJfield^.MOOD=WH
THEN
DEFINITEPAR:=INDEF
ELSE
DEFINITEPAR:=DEF;
                                                      POSSCOMASPAR:=[COUNT,MASS];
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
QPUNDERDETPFOUND:=QPUNDERDETP(B);
                                                      DEFINITEPAR:=
b^.ls^.DETPfield^.DEFINITE;
                                                      POSSCOMASPAR:=
b^.ls^.DETPfield^.POSSCOMAS;
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
DEFINITEPAR:=DEF;
                                                      POSSCOMASPAR:=[COUNT,MASS];
                                                      END;
                                                      END;NP1RULE_3:=result;
END;
                                                      FUNCTION NP1RULE_4
(VAR rec:NP1RULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
((
b^.ls^.CNfield^.DEFINITE<>DEF) OR (DEFINITEPAR IN [DEF,ADEF]) OR (WHDETFOUND=TRUE)) AND ((
b^.ls^.CNfield^.DEFINITE<>INDEF) OR (DEFINITEPAR IN [INDEF])) AND ((POSSCOMASPAR=[]) OR (POSSCOMASPAR*
b^.ls^.CNfield^.POSSCOMAS<>[]))                       
THEN result:=TRUE;IF result THEN
BEGIN
MODIFIEDADJPINCNFOUND:=MODIFIEDADJPINCN(B);
                                                       IF (DEFINITEPAR=OMEGADEF)
THEN
DEFINITEPAR:=INDEF;
                                                      END;
                                                      END;NP1RULE_4:=result;
END;
                                                      FUNCTION NP1RULE_5
(VAR rec:NP1RULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
QPUNDERDETPFOUND OR MODIFIEDADJPINCNFOUND             
THEN result:=TRUE;IF result THEN
BEGIN
END;
                                                      END;NP1RULE_5:=result;
END;
                                                      FUNCTION NP1RULE_6
(VAR rec:NP1RULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
QPUNDERDETPFOUND OR MODIFIEDADJPINCNFOUND             
THEN result:=TRUE;IF result THEN
BEGIN
END;
                                                      END;NP1RULE_6:=result;
END;
                                                       FUNCTION comp_NP1RULE(rec1,rec2:NP1RULEtyp):BOOLEAN;
BEGIN WITH rec1^ DO comp_NP1RULE:=
(MODIFIEDADJPINCNFOUND=rec2^.MODIFIEDADJPINCNFOUND) AND
(QPUNDERDETPFOUND=rec2^.QPUNDERDETPFOUND) AND
(WHDETFOUND=rec2^.WHDETFOUND) AND
(DEFINITEPAR=rec2^.DEFINITEPAR) AND
(POSSCOMASPAR=rec2^.POSSCOMASPAR)
END;
PROCEDURE NP1ARULE_0(VAR rec:NP1ARULEtyp);
BEGIN WITH rec^ DO BEGIN
                                                      END;END;
                                                      FUNCTION NP1ARULE_2
(VAR rec:NP1ARULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
END;
                                                      END;NP1ARULE_2:=result;
END;
                                                      FUNCTION NP1ARULE_4
(VAR rec:NP1ARULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
(
b^.ls^.CNfield^.DEFINITE<>DEF)                        
THEN result:=TRUE;IF result THEN
BEGIN
END;
                                                      END;NP1ARULE_4:=result;
END;
                                                       FUNCTION comp_NP1ARULE(rec1,rec2:NP1ARULEtyp):BOOLEAN;
BEGIN WITH rec1^ DO comp_NP1ARULE:=
TRUE
END;
PROCEDURE NP2RULE_0(VAR rec:NP2RULEtyp);
BEGIN WITH rec^ DO BEGIN
PROFOUND:=FALSE;
INDEFPROHEADFOUND:=FALSE;
PROPERNOUNHEADFOUND:=FALSE;
                                                      END;END;
                                                      FUNCTION NP2RULE_1
(VAR rec:NP2RULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
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
PROFOUND:=TRUE;
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
INDEFPROHEADFOUND:=TRUE;
                                                      PROFOUND:=TRUE;
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
PROFOUND:=TRUE;
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
PROFOUND:=TRUE;
                                                      PROPERNOUNHEADFOUND:=TRUE;
                                                      END;
                                                      END;NP2RULE_5:=result;
END;
                                                      FUNCTION NP2RULE_6
(VAR rec:NP2RULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
PROFOUND                                              
THEN result:=TRUE;IF result THEN
BEGIN
END;
                                                      END;NP2RULE_6:=result;
END;
                                                      FUNCTION NP2RULE_7
(VAR rec:NP2RULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
PROFOUND                                              
THEN result:=TRUE;IF result THEN
BEGIN
END;
                                                      END;NP2RULE_7:=result;
END;
                                                      FUNCTION NP2RULE_8
(VAR rec:NP2RULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
INDEFPROHEADFOUND OR PROPERNOUNHEADFOUND              
THEN result:=TRUE;IF result THEN
BEGIN
END;
                                                      END;NP2RULE_8:=result;
END;
                                                       FUNCTION comp_NP2RULE(rec1,rec2:NP2RULEtyp):BOOLEAN;
BEGIN WITH rec1^ DO comp_NP2RULE:=
(PROFOUND=rec2^.PROFOUND) AND
(INDEFPROHEADFOUND=rec2^.INDEFPROHEADFOUND) AND
(PROPERNOUNHEADFOUND=rec2^.PROPERNOUNHEADFOUND)
END;
PROCEDURE NP3RULE_0(VAR rec:NP3RULEtyp);
BEGIN WITH rec^ DO BEGIN
PREADVFOUND:=FALSE;
                                                      END;END;
                                                      FUNCTION NP3RULE_1
(VAR rec:NP3RULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
PREADVFOUND:=TRUE
END                                                   
                                                      END;NP3RULE_1:=result;
END;
                                                      FUNCTION NP3RULE_2
(VAR rec:NP3RULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
PREADVFOUND=TRUE                                      
THEN result:=TRUE;IF result THEN
BEGIN
END;
                                                      END;NP3RULE_2:=result;
END;
                                                       FUNCTION comp_NP3RULE(rec1,rec2:NP3RULEtyp):BOOLEAN;
BEGIN WITH rec1^ DO comp_NP3RULE:=
(PREADVFOUND=rec2^.PREADVFOUND)
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
PROCEDURE NP6RULE_0(VAR rec:NP6RULEtyp);
BEGIN WITH rec^ DO BEGIN
NUMBERPAR:=OMEGANUMBER;
CASESPAR:=[NOMINATIVE,ACCUSATIVE,DATIVE];
                                                      END;END;
                                                      FUNCTION NP6RULE_1
(VAR rec:NP6RULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
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
                                                      END;NP6RULE_1:=result;
END;
                                                      FUNCTION NP6RULE_2
(VAR rec:NP6RULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
END;
                                                      END;NP6RULE_2:=result;
END;
                                                      FUNCTION NP6RULE_3
(VAR rec:NP6RULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
(
b^.ls^.NPfield^.NUMBER=NUMBERPAR) AND (
b^.ls^.NPfield^.CASES=CASESPAR)                       
THEN result:=TRUE;IF result THEN
BEGIN
END;
                                                      END;NP6RULE_3:=result;
END;
                                                      FUNCTION NP6RULE_4
(VAR rec:NP6RULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
END;
                                                      END;NP6RULE_4:=result;
END;
                                                       FUNCTION comp_NP6RULE(rec1,rec2:NP6RULEtyp):BOOLEAN;
BEGIN WITH rec1^ DO comp_NP6RULE:=
(NUMBERPAR=rec2^.NUMBERPAR) AND
(CASESPAR=rec2^.CASESPAR)
END;
PROCEDURE NP7RULE_0(VAR rec:NP7RULEtyp);
BEGIN WITH rec^ DO BEGIN
                                                      END;END;
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
TRUE
END;
PROCEDURE DETPRULE_0(VAR rec:DETPRULEtyp);
BEGIN WITH rec^ DO BEGIN
MFMEESTEEXPECTED:=FALSE;
NEUTMEESTEEXPECTED:=FALSE;
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
                                                      FUNCTION DETPRULE_12
(VAR rec:DETPRULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
 IF 
b^.ls^.ARTfield^.KEY=auxkey('DEARTKEY')
THEN
MFMEESTEEXPECTED:=TRUE
ELSE
NEUTMEESTEEXPECTED:=TRUE;
                                                      END;
                                                      END;DETPRULE_12:=result;
END;
                                                      FUNCTION DETPRULE_4
(VAR rec:DETPRULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
(MEEST2QUNDERQP(B)<=(MFMEESTEEXPECTED OR NEUTMEESTEEXPECTED))                                  
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
(MFMEESTEEXPECTED=rec2^.MFMEESTEEXPECTED) AND
(NEUTMEESTEEXPECTED=rec2^.NEUTMEESTEEXPECTED)
END;
PROCEDURE DETP2RULE_0(VAR rec:DETP2RULEtyp);
BEGIN WITH rec^ DO BEGIN
                                                      END;END;
                                                      FUNCTION DETP2RULE_2
(VAR rec:DETP2RULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
END;
                                                      END;DETP2RULE_2:=result;
END;
                                                       FUNCTION comp_DETP2RULE(rec1,rec2:DETP2RULEtyp):BOOLEAN;
BEGIN WITH rec1^ DO comp_DETP2RULE:=
TRUE
END;
PROCEDURE CN1RULE_0(VAR rec:CN1RULEtyp);
BEGIN WITH rec^ DO BEGIN
COMPLEXPECTED:=FALSE;
NUMBERSPAR:=[SINGULAR];
ANIMATEPAR:=OMEGAANIMATE;
POSSCOMASPAR:=[COUNT];
THETANPPAR:=OMEGATHETANP;
NOUNPATTERNEFSPAR:=[];
PREPKEYPAR:=0;
                                                      END;END;
                                                      FUNCTION CN1RULE_2
(VAR rec:CN1RULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
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
POSSCOMASPAR:=
b^.ls^.DETPfield^.POSSCOMAS
END                                                   
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
                                                      FUNCTION CN1RULE_5
(VAR rec:CN1RULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
NUMBERSPAR:=[
b^.ls^.NOUNfield^.NUMBER];
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
                                                      END;CN1RULE_5:=result;
END;
                                                      FUNCTION CN1RULE_12
(VAR rec:CN1RULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
END;
                                                      END;CN1RULE_12:=result;
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
b^.ls^.SENTENCEfield^.CONJKEY=auxkey('DATCONJKEY')) AND (
b^.ls^.SENTENCEfield^.MOOD=DECLARATIVE) AND (SYNTHATSENT IN NOUNPATTERNEFSPAR)) OR ((
b^.ls^.SENTENCEfield^.CONJKEY=auxkey('OFCONJKEY')) AND (
b^.ls^.SENTENCEfield^.MOOD=YESNOINTERROGATIVE) AND (SYNQSENT IN NOUNPATTERNEFSPAR)) OR ((
b^.ls^.SENTENCEfield^.MOOD=WHINTERROGATIVE) AND (SYNQSENT IN NOUNPATTERNEFSPAR)) AND (
b^.ls^.SENTENCEfield^.COORD<>CORRCOORD)               
THEN result:=TRUE;IF result THEN
BEGIN
END;
                                                      END;CN1RULE_15:=result;
END;
                                                      FUNCTION CN1RULE_6
(VAR rec:CN1RULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
(COUNT IN POSSCOMASPAR) AND (THETANPPAR=OMEGATHETANP) AND (ANIMATEPAR=NOANIMATE)                            
THEN result:=TRUE;IF result THEN
BEGIN
END;
                                                      END;CN1RULE_6:=result;
END;
                                                      FUNCTION CN1RULE_13
(VAR rec:CN1RULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
NUMBERSPAR=[SINGULAR]                                 
THEN result:=TRUE;IF result THEN
BEGIN
END;
                                                      END;CN1RULE_13:=result;
END;
                                                      FUNCTION CN1RULE_8
(VAR rec:CN1RULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
END;
                                                      END;CN1RULE_8:=result;
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
                                                      FUNCTION CN1RULE_11
(VAR rec:CN1RULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
END;
                                                      END;CN1RULE_11:=result;
END;
                                                       FUNCTION comp_CN1RULE(rec1,rec2:CN1RULEtyp):BOOLEAN;
BEGIN WITH rec1^ DO comp_CN1RULE:=
(COMPLEXPECTED=rec2^.COMPLEXPECTED) AND
(NUMBERSPAR=rec2^.NUMBERSPAR) AND
(ANIMATEPAR=rec2^.ANIMATEPAR) AND
(POSSCOMASPAR=rec2^.POSSCOMASPAR) AND
(THETANPPAR=rec2^.THETANPPAR) AND
(NOUNPATTERNEFSPAR=rec2^.NOUNPATTERNEFSPAR) AND
(PREPKEYPAR=rec2^.PREPKEYPAR)
END;
PROCEDURE CN2RULE_0(VAR rec:CN2RULEtyp);
BEGIN WITH rec^ DO BEGIN
                                                      END;END;
                                                      FUNCTION CN2RULE_1
(VAR rec:CN2RULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
END;
                                                      END;CN2RULE_1:=result;
END;
                                                      FUNCTION CN2RULE_2
(VAR rec:CN2RULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
END;
                                                      END;CN2RULE_2:=result;
END;
                                                      FUNCTION CN2RULE_3
(VAR rec:CN2RULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
END;
                                                      END;CN2RULE_3:=result;
END;
                                                      FUNCTION CN2RULE_4
(VAR rec:CN2RULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
END;
                                                      END;CN2RULE_4:=result;
END;
                                                      FUNCTION CN2RULE_6
(VAR rec:CN2RULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
END;
                                                      END;CN2RULE_6:=result;
END;
                                                       FUNCTION comp_CN2RULE(rec1,rec2:CN2RULEtyp):BOOLEAN;
BEGIN WITH rec1^ DO comp_CN2RULE:=
TRUE
END;
PROCEDURE PREPP_0(VAR rec:PREPPtyp);
BEGIN WITH rec^ DO BEGIN
RADVPFOUND:=FALSE;
COMPLFOUND:=FALSE;
HEADFOUND:=FALSE;
POSTPKEYVAR:=0;
SECONDPREPVAR:=0;
                                                      END;END;
                                                      FUNCTION PREPP_1
(VAR rec:PREPPtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
HEADFOUND:=TRUE;
                                                      POSTPKEYVAR:=
b^.ls^.PREPfield^.POSTPKEY;
                                                      SECONDPREPVAR:=
b^.ls^.PREPfield^.SECONDPREP;
                                                      END;
                                                      END;PREPP_1:=result;
END;
                                                      FUNCTION PREPP_2
(VAR rec:PREPPtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
( NOT RADVPFOUND) AND ( NOT COMPLFOUND)               
THEN result:=TRUE;IF result THEN
BEGIN
COMPLFOUND:=TRUE;
                                                      END;
                                                      END;PREPP_2:=result;
END;
                                                      FUNCTION PREPP_3
(VAR rec:PREPPtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
RADVPFOUND:=TRUE;
                                                      END;
                                                      END;PREPP_3:=result;
END;
                                                      FUNCTION PREPP_4
(VAR rec:PREPPtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
END;
                                                      END;PREPP_4:=result;
END;
                                                      FUNCTION PREPP_5
(VAR rec:PREPPtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
( NOT COMPLFOUND) AND ( NOT RADVPFOUND)               
THEN result:=TRUE;IF result THEN
BEGIN
COMPLFOUND:=TRUE;
                                                      END;
                                                      END;PREPP_5:=result;
END;
                                                      FUNCTION PREPP_6
(VAR rec:PREPPtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
( NOT COMPLFOUND) AND ( NOT RADVPFOUND)               
THEN result:=TRUE;IF result THEN
BEGIN
COMPLFOUND:=TRUE;
                                                      END;
                                                      END;PREPP_6:=result;
END;
                                                      FUNCTION PREPP_7
(VAR rec:PREPPtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
( NOT COMPLFOUND) AND ( NOT RADVPFOUND)               
THEN result:=TRUE;IF result THEN
BEGIN
COMPLFOUND:=TRUE;
                                                      END;
                                                      END;PREPP_7:=result;
END;
                                                      FUNCTION PREPP_8
(VAR rec:PREPPtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
( NOT HEADFOUND)                                      
THEN result:=TRUE;IF result THEN
BEGIN
HEADFOUND:=TRUE;
                                                      POSTPKEYVAR:=
b^.ls^.PREPfield^.POSTPKEY;
                                                      END;
                                                      END;PREPP_8:=result;
END;
                                                      FUNCTION PREPP_9
(VAR rec:PREPPtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
(
b^.ls^.PARTfield^.KEY=POSTPKEYVAR)                    
THEN result:=TRUE;IF result THEN
BEGIN
END;
                                                      END;PREPP_9:=result;
END;
                                                      FUNCTION PREPP_10
(VAR rec:PREPPtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
END;
                                                      END;PREPP_10:=result;
END;
                                                      FUNCTION PREPP_11
(VAR rec:PREPPtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
END;
                                                      END;PREPP_11:=result;
END;
                                                      FUNCTION PREPP_12
(VAR rec:PREPPtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
COMPLFOUND:=TRUE;
                                                      END;
                                                      END;PREPP_12:=result;
END;
                                                      FUNCTION PREPP_13
(VAR rec:PREPPtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
(
b^.ls^.PREPPfield^.HEADKEY=SECONDPREPVAR)             
THEN result:=TRUE;IF result THEN
BEGIN
END;
                                                      END;PREPP_13:=result;
END;
                                                       FUNCTION comp_PREPP(rec1,rec2:PREPPtyp):BOOLEAN;
BEGIN WITH rec1^ DO comp_PREPP:=
(RADVPFOUND=rec2^.RADVPFOUND) AND
(COMPLFOUND=rec2^.COMPLFOUND) AND
(HEADFOUND=rec2^.HEADFOUND) AND
(POSTPKEYVAR=rec2^.POSTPKEYVAR) AND
(SECONDPREPVAR=rec2^.SECONDPREPVAR)
END;
PROCEDURE RADVP_0(VAR rec:RADVPtyp);
BEGIN WITH rec^ DO BEGIN
                                                      END;END;
                                                      FUNCTION RADVP_1
(VAR rec:RADVPtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
END;
                                                      END;RADVP_1:=result;
END;
                                                       FUNCTION comp_RADVP(rec1,rec2:RADVPtyp):BOOLEAN;
BEGIN WITH rec1^ DO comp_RADVP:=
TRUE
END;
PROCEDURE ADVP_0(VAR rec:ADVPtyp);
BEGIN WITH rec^ DO BEGIN
PRECOMPLFOUND:=FALSE;
POSTCOMPLFOUND:=FALSE;
THANPPOSSIBLE:=FALSE;
ALSCOMPLADVFOUND:=FALSE;
DEGREEADVFOUND:=FALSE;
DEGREEADVEXPECTED:=FALSE;
DEGREEMODFOUND:=FALSE;
                                                      END;END;
                                                      FUNCTION ADVP_1
(VAR rec:ADVPtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
 IF DEGREEADV IN 
b^.ls^.ADVfield^.SUBCS
THEN
DEGREEADVFOUND:=TRUE;
                                                       IF 
b^.ls^.ADVfield^.FORM=COMPARATIVE
THEN
DEGREEMODFOUND:=TRUE;
                                                       IF 
b^.ls^.ADVfield^.FORM=COMPARATIVE
THEN
THANPPOSSIBLE:=TRUE;
                                                      END;
                                                      END;ADVP_1:=result;
END;
                                                      FUNCTION ADVP_2
(VAR rec:ADVPtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
( NOT PRECOMPLFOUND) AND ( NOT POSTCOMPLFOUND)        
THEN result:=TRUE;IF result THEN
BEGIN
POSTCOMPLFOUND:=TRUE;
                                                      END;
                                                      END;ADVP_2:=result;
END;
                                                      FUNCTION ADVP_3
(VAR rec:ADVPtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
( NOT PRECOMPLFOUND) AND ( NOT POSTCOMPLFOUND)        
THEN result:=TRUE;IF result THEN
BEGIN
POSTCOMPLFOUND:=TRUE;
                                                      END;
                                                      END;ADVP_3:=result;
END;
                                                      FUNCTION ADVP_4
(VAR rec:ADVPtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
( NOT PRECOMPLFOUND) AND ( NOT POSTCOMPLFOUND)        
THEN result:=TRUE;IF result THEN
BEGIN
PRECOMPLFOUND:=TRUE;
                                                      END;
                                                      END;ADVP_4:=result;
END;
                                                      FUNCTION ADVP_44
(VAR rec:ADVPtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
( NOT DEGREEMODFOUND)                                 
THEN result:=TRUE;IF result THEN
BEGIN
DEGREEADVEXPECTED:=TRUE;
                                                      DEGREEMODFOUND:=TRUE;
                                                      END;
                                                      END;ADVP_44:=result;
END;
                                                      FUNCTION ADVP_5
(VAR rec:ADVPtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
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
                                                      END;ADVP_5:=result;
END;
                                                      FUNCTION ADVP_6
(VAR rec:ADVPtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
 NOT DEGREEMODFOUND                                   
THEN result:=TRUE;IF result THEN
BEGIN
 IF 
b^.ls^.ADVPfield^.THANAS=ALSCOMPL
THEN
ALSCOMPLADVFOUND:=TRUE;
                                                       IF 
b^.ls^.ADVPfield^.THANAS=ALSCOMPL
THEN
THANPPOSSIBLE:=TRUE;
                                                      DEGREEMODFOUND:=TRUE;
                                                      END;
                                                      END;ADVP_6:=result;
END;
                                                      FUNCTION ADVP_7
(VAR rec:ADVPtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
THANPPOSSIBLE                                         
THEN result:=TRUE;IF result THEN
BEGIN
END;
                                                      END;ADVP_7:=result;
END;
                                                      FUNCTION ADVP_8
(VAR rec:ADVPtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
ALSCOMPLADVFOUND AND ( NOT PRECOMPLFOUND) AND ( NOT POSTCOMPLFOUND)                                       
THEN result:=TRUE;IF result THEN
BEGIN
END;
                                                      END;ADVP_8:=result;
END;
                                                      FUNCTION ADVP_9
(VAR rec:ADVPtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
( NOT DEGREEMODFOUND) AND ( NOT PRECOMPLFOUND) AND ( NOT POSTCOMPLFOUND)                                   
THEN result:=TRUE;IF result THEN
BEGIN
DEGREEMODFOUND:=TRUE;
                                                      END;
                                                      END;ADVP_9:=result;
END;
                                                       FUNCTION comp_ADVP(rec1,rec2:ADVPtyp):BOOLEAN;
BEGIN WITH rec1^ DO comp_ADVP:=
(PRECOMPLFOUND=rec2^.PRECOMPLFOUND) AND
(POSTCOMPLFOUND=rec2^.POSTCOMPLFOUND) AND
(THANPPOSSIBLE=rec2^.THANPPOSSIBLE) AND
(ALSCOMPLADVFOUND=rec2^.ALSCOMPLADVFOUND) AND
(DEGREEADVEXPECTED=rec2^.DEGREEADVEXPECTED) AND
(DEGREEADVFOUND=rec2^.DEGREEADVFOUND) AND
(DEGREEMODFOUND=rec2^.DEGREEMODFOUND)
END;
