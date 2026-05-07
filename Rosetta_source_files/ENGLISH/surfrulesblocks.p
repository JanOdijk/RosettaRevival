pragma C_include('maket.pf');
pragma C_include('lsrulepars.pf');
pragma C_include('surfrulesblocks.pf');
pragma C_include('listree.pf');
pragma C_include('lsdomaint.pf');
pragma C_include('debug.pf');
pragma C_include('lsauxdom.pf');
pragma C_include('lsmatches.pf');
pragma C_include('lssurfquo.pf');
pragma C_include('lsstree.pf');
PROGRAM surfrulesblocks;
WITH 
maket,lsrulepars,listree,lsdomaint,debug,lsauxdom,lsmatches,lssurfquo,lsstree;
PROCEDURE UTT_0(VAR rec:UTTtyp);
BEGIN WITH rec^ DO BEGIN
                                                      END;END;
                                                      FUNCTION UTT_1
(VAR rec:UTTtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
END;
                                                      END;UTT_1:=result;
END;
                                                      FUNCTION UTT_2
(VAR rec:UTTtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
END;
                                                      END;UTT_2:=result;
END;
                                                      FUNCTION UTT_3
(VAR rec:UTTtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
END;
                                                      END;UTT_3:=result;
END;
                                                      FUNCTION UTT_4
(VAR rec:UTTtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
END;
                                                      END;UTT_4:=result;
END;
                                                       FUNCTION comp_UTT(rec1,rec2:UTTtyp):BOOLEAN;
BEGIN WITH rec1^ DO comp_UTT:=
TRUE
END;
PROCEDURE VERBPRULE_0(VAR rec:VERBPRULEtyp);
BEGIN WITH rec^ DO BEGIN
ADJUNCTSVAR:=[];
ADJUNCTSEFSVAR:=[];
AUXFOUND:=FALSE;
CASEASSIGNERVAR:=FALSE;
COMPLFOUND:=FALSE;
INDOBJFOUND:=FALSE;
PARTFOUND:=FALSE;
PARTICLEVAR:=0;
PASSAUXFOUND:=FALSE;
PREDFOUND:=FALSE;
PREPKEYVAR1:=0;
PREPKEYVAR2:=0;
PREPOBJFOUND:=FALSE;
PREPOBJ2FOUND:=FALSE;
POSSVOICESVAR:=[ACTIVE];
PROGAUXFOUND:=FALSE;
REFLEXIVITYVAR:=NOTREFLEXIVE;
SYNVPEFSVAR:=[SYNBE,SYNNP];
THETAVPVAR:=OMEGATHETAVP;
                                                      END;END;
                                                      FUNCTION VERBPRULE_1
(VAR rec:VERBPRULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
(PASSAUXFOUND<=(
b^.ls^.VERBfield^.MODUS=PARTICIPLE)) AND ((( NOT PASSAUXFOUND) AND PROGAUXFOUND)<=(
b^.ls^.VERBfield^.MODUS=INGFORM)) AND ((( NOT PASSAUXFOUND) AND ( NOT PROGAUXFOUND) AND AUXFOUND)<=(
b^.ls^.VERBfield^.MODUS=PARTICIPLE))                  
THEN result:=TRUE;IF result THEN
BEGIN
ADJUNCTSVAR:=
b^.ls^.VERBfield^.ADJUNCTS;
                                                      THETAVPVAR:=
b^.ls^.VERBfield^.THETAVP;
                                                      SYNVPEFSVAR:=
b^.ls^.VERBfield^.SYNVPS;
                                                      POSSVOICESVAR:=
b^.ls^.VERBfield^.POSSVOICES;
                                                      REFLEXIVITYVAR:=
b^.ls^.VERBfield^.REFLEXIVITY;
                                                      PARTICLEVAR:=
b^.ls^.VERBfield^.PARTICLE;
                                                      PREPKEYVAR1:=
b^.ls^.VERBfield^.PREPKEY1;
                                                      PREPKEYVAR2:=
b^.ls^.VERBfield^.PREPKEY2;
                                                      CASEASSIGNERVAR:=
b^.ls^.VERBfield^.CASEASSIGNER;
                                                      END;
                                                      END;VERBPRULE_1:=result;
END;
                                                      FUNCTION VERBPRULE_2
(VAR rec:VERBPRULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
(
b^.ls^.PARTfield^.KEY=PARTICLEVAR) AND ( NOT PARTFOUND)                                                     
THEN result:=TRUE;IF result THEN
BEGIN
PARTFOUND:=TRUE;
                                                      END;
                                                      END;VERBPRULE_2:=result;
END;
                                                      FUNCTION VERBPRULE_3
(VAR rec:VERBPRULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
(SYNVPEFSVAR*
LSAUXDOM_INDOBJVPS<>[]) OR (BENFACTNP IN ADJUNCTSVAR) OR (REFLEXIVITYVAR IN [INDOBJREFL])                   
THEN result:=TRUE;IF result THEN
BEGIN
INDOBJFOUND:=TRUE;
                                                       IF (REFLEXIVITYVAR IN [INDOBJREFL])
THEN
SYNVPEFSVAR:=SYNVPEFSVAR;
                                                       IF (BENFACTNP IN ADJUNCTSVAR)
THEN
ADJUNCTSEFSVAR:=ADJUNCTSEFSVAR+[BENFACTNP]
ELSE
SYNVPEFSVAR:=SYNVPEFSVAR*
LSAUXDOM_INDOBJVPS;
                                                      END;
                                                      END;VERBPRULE_3:=result;
END;
                                                      FUNCTION VERBPRULE_4
(VAR rec:VERBPRULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
((SYNVPEFSVAR*
LSAUXDOM_OBJVPS<>[]) OR (REFLEXIVITYVAR IN [DOBJREFL])) AND (PARTFOUND<=(
b^.ls^.NPfield^.NPHEAD<>ITNP)) AND (INDOBJFOUND<=(
b^.ls^.NPfield^.NPHEAD<>ITNP)) AND (((THETAVPVAR<>VP010) AND (THETAVPVAR<>VP012)) OR CASEASSIGNERVAR)   
THEN result:=TRUE;IF result THEN
BEGIN
 IF (REFLEXIVITYVAR IN [DOBJREFL])
THEN
SYNVPEFSVAR:=SYNVPEFSVAR
ELSE
SYNVPEFSVAR:=SYNVPEFSVAR*
LSAUXDOM_OBJVPS;
                                                      END;
                                                      END;VERBPRULE_4:=result;
END;
                                                      FUNCTION VERBPRULE_5
(VAR rec:VERBPRULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
SYNVPEFSVAR*
LSAUXDOM_SENTCOMPLVPS<>[]                             
THEN result:=TRUE;IF result THEN
BEGIN
COMPLFOUND:=TRUE;
                                                      SYNVPEFSVAR:=SYNVPEFSVAR*
LSAUXDOM_SENTCOMPLVPS;
                                                      END;
                                                      END;VERBPRULE_5:=result;
END;
                                                      FUNCTION VERBPRULE_6
(VAR rec:VERBPRULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
( NOT PREPOBJFOUND) AND ( NOT PREPOBJ2FOUND) AND ((COMPLFOUND) OR (PREDFOUND)) AND (
b^.ls^.PREPPfield^.HEADKEY=PREPKEYVAR1) AND (SYNVPEFSVAR*
LSAUXDOM_PREPOBJVPS<>[])                              
THEN result:=TRUE;IF result THEN
BEGIN
SYNVPEFSVAR:=SYNVPEFSVAR*
LSAUXDOM_PREPOBJVPS;
                                                      PREPOBJFOUND:=TRUE;
                                                      END;
                                                      END;VERBPRULE_6:=result;
END;
                                                      FUNCTION VERBPRULE_7
(VAR rec:VERBPRULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
AUXFOUND:=TRUE;
                                                      END;
                                                      END;VERBPRULE_7:=result;
END;
                                                      FUNCTION VERBPRULE_8
(VAR rec:VERBPRULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
( NOT AUXFOUND) OR (
b^.ls^.VERBfield^.MODUS=PARTICIPLE)                   
THEN result:=TRUE;IF result THEN
BEGIN
PROGAUXFOUND:=TRUE;
                                                      END;
                                                      END;VERBPRULE_8:=result;
END;
                                                      FUNCTION VERBPRULE_9
(VAR rec:VERBPRULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
(PROGAUXFOUND<=(
b^.ls^.VERBfield^.MODUS=INGFORM)) AND ((( NOT PROGAUXFOUND) AND AUXFOUND)<=(
b^.ls^.VERBfield^.MODUS=PARTICIPLE))                  
THEN result:=TRUE;IF result THEN
BEGIN
PASSAUXFOUND:=TRUE;
                                                      END;
                                                      END;VERBPRULE_9:=result;
END;
                                                      FUNCTION VERBPRULE_10
(VAR rec:VERBPRULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
((
b^.ls^.PREPPfield^.HEADKEY=PREPKEYVAR1) AND (SYNVPEFSVAR*
LSAUXDOM_PREPOBJVPS<>[])) OR ((
b^.ls^.PREPPfield^.HEADKEY=auxkey('FORPREPKEY')) AND (BENFACTPP IN ADJUNCTSVAR))                            
THEN result:=TRUE;IF result THEN
BEGIN
 IF (BENFACTPP IN ADJUNCTSVAR)
THEN
ADJUNCTSEFSVAR:=ADJUNCTSEFSVAR+[BENFACTPP]
ELSE
SYNVPEFSVAR:=SYNVPEFSVAR*
LSAUXDOM_PREPOBJVPS;
                                                      PREPOBJFOUND:=TRUE;
                                                      END;
                                                      END;VERBPRULE_10:=result;
END;
                                                      FUNCTION VERBPRULE_11
(VAR rec:VERBPRULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
(
b^.ls^.PREPPfield^.HEADKEY=PREPKEYVAR2) AND (SYNVPEFSVAR*
LSAUXDOM_TWOPREPOBJVPS<>[])                           
THEN result:=TRUE;IF result THEN
BEGIN
SYNVPEFSVAR:=SYNVPEFSVAR*
LSAUXDOM_TWOPREPOBJVPS;
                                                      PREPOBJ2FOUND:=TRUE;
                                                      END;
                                                      END;VERBPRULE_11:=result;
END;
                                                      FUNCTION VERBPRULE_12
(VAR rec:VERBPRULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
(SYNVPEFSVAR*
LSAUXDOM_LOCARGVPS<>[]) OR (LOCADJUNCT IN ADJUNCTSVAR)
THEN result:=TRUE;IF result THEN
BEGIN
 IF (LOCADJUNCT IN ADJUNCTSVAR)
THEN
ADJUNCTSEFSVAR:=ADJUNCTSEFSVAR+[LOCADJUNCT]
ELSE
SYNVPEFSVAR:=SYNVPEFSVAR*
LSAUXDOM_LOCARGVPS;
                                                      END;
                                                      END;VERBPRULE_12:=result;
END;
                                                      FUNCTION VERBPRULE_13
(VAR rec:VERBPRULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
(SYNVPEFSVAR*
LSAUXDOM_DIRARGVPS<>[]) OR (DIRADJUNCT IN ADJUNCTSVAR)
THEN result:=TRUE;IF result THEN
BEGIN
 IF (DIRADJUNCT IN ADJUNCTSVAR)
THEN
ADJUNCTSEFSVAR:=ADJUNCTSEFSVAR+[DIRADJUNCT]
ELSE
SYNVPEFSVAR:=SYNVPEFSVAR*
LSAUXDOM_DIRARGVPS;
                                                      END;
                                                      END;VERBPRULE_13:=result;
END;
                                                      FUNCTION VERBPRULE_14
(VAR rec:VERBPRULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
(SYNVPEFSVAR*
LSAUXDOM_LOCARGVPS<>[]) OR (LOCADJUNCT IN ADJUNCTSVAR)
THEN result:=TRUE;IF result THEN
BEGIN
 IF (LOCADJUNCT IN ADJUNCTSVAR)
THEN
ADJUNCTSEFSVAR:=ADJUNCTSEFSVAR+[LOCADJUNCT]
ELSE
SYNVPEFSVAR:=SYNVPEFSVAR*
LSAUXDOM_LOCARGVPS;
                                                      END;
                                                      END;VERBPRULE_14:=result;
END;
                                                      FUNCTION VERBPRULE_15
(VAR rec:VERBPRULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
(SYNVPEFSVAR*
LSAUXDOM_DIRARGVPS<>[]) OR (DIRADJUNCT IN ADJUNCTSVAR)
THEN result:=TRUE;IF result THEN
BEGIN
 IF (DIRADJUNCT IN ADJUNCTSVAR)
THEN
ADJUNCTSEFSVAR:=ADJUNCTSEFSVAR+[DIRADJUNCT]
ELSE
SYNVPEFSVAR:=SYNVPEFSVAR*
LSAUXDOM_DIRARGVPS;
                                                      END;
                                                      END;VERBPRULE_15:=result;
END;
                                                      FUNCTION VERBPRULE_16
(VAR rec:VERBPRULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
((SYNVPEFSVAR*
LSAUXDOM_ADJPPREDVPS<>[]) OR (RESAP IN ADJUNCTSVAR))  
THEN result:=TRUE;IF result THEN
BEGIN
PREDFOUND:=TRUE;
                                                       IF (RESAP IN ADJUNCTSVAR)
THEN
ADJUNCTSEFSVAR:=ADJUNCTSEFSVAR+[RESAP]
ELSE
SYNVPEFSVAR:=SYNVPEFSVAR*
LSAUXDOM_ADJPPREDVPS;
                                                      END;
                                                      END;VERBPRULE_16:=result;
END;
                                                      FUNCTION VERBPRULE_17
(VAR rec:VERBPRULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
((SYNVPEFSVAR*
LSAUXDOM_NPPREDVPS<>[]) OR (RESNP IN ADJUNCTSVAR))    
THEN result:=TRUE;IF result THEN
BEGIN
PREDFOUND:=TRUE;
                                                       IF (RESNP IN ADJUNCTSVAR)
THEN
ADJUNCTSEFSVAR:=ADJUNCTSEFSVAR*[RESNP]
ELSE
SYNVPEFSVAR:=SYNVPEFSVAR*
LSAUXDOM_NPPREDVPS;
                                                      END;
                                                      END;VERBPRULE_17:=result;
END;
                                                      FUNCTION VERBPRULE_18
(VAR rec:VERBPRULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
PASSIVE IN POSSVOICESVAR                              
THEN result:=TRUE;IF result THEN
BEGIN
END;
                                                      END;VERBPRULE_18:=result;
END;
                                                      FUNCTION VERBPRULE_19
(VAR rec:VERBPRULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
((SYNVPEFSVAR*
LSAUXDOM_PREPPPREDVPS<>[]) OR (RESPP IN ADJUNCTSVAR)) 
THEN result:=TRUE;IF result THEN
BEGIN
PREDFOUND:=TRUE;
                                                       IF (RESPP IN 
b^.ls^.VERBfield^.ADJUNCTS)
THEN
ADJUNCTSEFSVAR:=ADJUNCTSEFSVAR+[RESPP]
ELSE
SYNVPEFSVAR:=SYNVPEFSVAR*
LSAUXDOM_PREPPPREDVPS;
                                                      END;
                                                      END;VERBPRULE_19:=result;
END;
                                                      FUNCTION VERBPRULE_20
(VAR rec:VERBPRULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
SYNVPEFSVAR*
LSAUXDOM_CLOSEDVPPVPS<>[]                             
THEN result:=TRUE;IF result THEN
BEGIN
SYNVPEFSVAR:=SYNVPEFSVAR*
LSAUXDOM_CLOSEDVPPVPS;
                                                      END;
                                                      END;VERBPRULE_20:=result;
END;
                                                      FUNCTION VERBPRULE_21
(VAR rec:VERBPRULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
SYNVPEFSVAR*
LSAUXDOM_SOPROSENTVPS<>[]                             
THEN result:=TRUE;IF result THEN
BEGIN
SYNVPEFSVAR:=SYNVPEFSVAR*
LSAUXDOM_SOPROSENTVPS;
                                                      END;
                                                      END;VERBPRULE_21:=result;
END;
                                                       FUNCTION comp_VERBPRULE(rec1,rec2:VERBPRULEtyp):BOOLEAN;
BEGIN WITH rec1^ DO comp_VERBPRULE:=
(ADJUNCTSVAR=rec2^.ADJUNCTSVAR) AND
(ADJUNCTSEFSVAR=rec2^.ADJUNCTSEFSVAR) AND
(AUXFOUND=rec2^.AUXFOUND) AND
(CASEASSIGNERVAR=rec2^.CASEASSIGNERVAR) AND
(COMPLFOUND=rec2^.COMPLFOUND) AND
(INDOBJFOUND=rec2^.INDOBJFOUND) AND
(PARTFOUND=rec2^.PARTFOUND) AND
(PASSAUXFOUND=rec2^.PASSAUXFOUND) AND
(PARTICLEVAR=rec2^.PARTICLEVAR) AND
(POSSVOICESVAR=rec2^.POSSVOICESVAR) AND
(PREDFOUND=rec2^.PREDFOUND) AND
(PREPKEYVAR1=rec2^.PREPKEYVAR1) AND
(PREPKEYVAR2=rec2^.PREPKEYVAR2) AND
(PREPOBJFOUND=rec2^.PREPOBJFOUND) AND
(PREPOBJ2FOUND=rec2^.PREPOBJ2FOUND) AND
(PROGAUXFOUND=rec2^.PROGAUXFOUND) AND
(REFLEXIVITYVAR=rec2^.REFLEXIVITYVAR) AND
(SYNVPEFSVAR=rec2^.SYNVPEFSVAR) AND
(THETAVPVAR=rec2^.THETAVPVAR)
END;
PROCEDURE VERBNEGRULE_0(VAR rec:VERBNEGRULEtyp);
BEGIN WITH rec^ DO BEGIN
                                                      END;END;
                                                      FUNCTION VERBNEGRULE_1
(VAR rec:VERBNEGRULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
END;
                                                      END;VERBNEGRULE_1:=result;
END;
                                                      FUNCTION VERBNEGRULE_2
(VAR rec:VERBNEGRULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
END;
                                                      END;VERBNEGRULE_2:=result;
END;
                                                      FUNCTION VERBNEGRULE_3
(VAR rec:VERBNEGRULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
END;
                                                      END;VERBNEGRULE_3:=result;
END;
                                                       FUNCTION comp_VERBNEGRULE(rec1,rec2:VERBNEGRULEtyp):BOOLEAN;
BEGIN WITH rec1^ DO comp_VERBNEGRULE:=
TRUE
END;
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
PROCEDURE ADJP1SRULE_0(VAR rec:ADJP1SRULEtyp);
BEGIN WITH rec^ DO BEGIN
PREADVFOUND:=FALSE;
                                                      END;END;
                                                      FUNCTION ADJP1SRULE_1
(VAR rec:ADJP1SRULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
PREADVFOUND:=TRUE
END                                                   
                                                      END;ADJP1SRULE_1:=result;
END;
                                                      FUNCTION ADJP1SRULE_2
(VAR rec:ADJP1SRULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
PREADVFOUND=TRUE                                      
THEN result:=TRUE;IF result THEN
BEGIN
END;
                                                      END;ADJP1SRULE_2:=result;
END;
                                                       FUNCTION comp_ADJP1SRULE(rec1,rec2:ADJP1SRULEtyp):BOOLEAN;
BEGIN WITH rec1^ DO comp_ADJP1SRULE:=
(PREADVFOUND=rec2^.PREADVFOUND)
END;
PROCEDURE ADJP2RULE_0(VAR rec:ADJP2RULEtyp);
BEGIN WITH rec^ DO BEGIN
COMPARATIVEEXPECTED:=FALSE;
COMPARATIVEFOUND:=FALSE;
COMPARATIVECOMPLEXPECTED:=FALSE;
THANPPOSSIBLE:=FALSE;
OFCOMPLPOSSIBLE:=FALSE;
SUPERLATIVEFOUND:=FALSE;
DEGREEMODFOUND:=FALSE;
HOPFOUND:=FALSE;
TOCOMPLEXPECTED:=FALSE;
PREPOBJFOUND:=FALSE;
DONPFOUND:=FALSE;
DEGREECOMPLFOUND:=FALSE;
                                                      END;END;
                                                      FUNCTION ADJP2RULE_1
(VAR rec:ADJP2RULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
 IF 
b^.ls^.ADJfield^.COMPFORM=COMPAR
THEN
BEGIN
THANPPOSSIBLE:=TRUE;
                                                      DEGREEMODFOUND:=TRUE;
                                                      COMPARATIVEFOUND:=TRUE
END ;
                                                       IF 
b^.ls^.ADJfield^.COMPFORM=SUPER
THEN
BEGIN
OFCOMPLPOSSIBLE:=TRUE;
                                                      DEGREEMODFOUND:=TRUE;
                                                      SUPERLATIVEFOUND:=TRUE
END ;
                                                      END;
                                                      END;ADJP2RULE_1:=result;
END;
                                                      FUNCTION ADJP2RULE_6
(VAR rec:ADJP2RULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
 NOT DONPFOUND                                        
THEN result:=TRUE;IF result THEN
BEGIN
DONPFOUND:=TRUE;
                                                      END;
                                                      END;ADJP2RULE_6:=result;
END;
                                                      FUNCTION ADJP2RULE_7
(VAR rec:ADJP2RULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
( NOT DEGREEMODFOUND)                                 
THEN result:=TRUE;IF result THEN
BEGIN
DEGREEMODFOUND:=TRUE;
                                                       IF 
b^.ls^.QPfield^.THANAS=TOCOMPL
THEN
TOCOMPLEXPECTED:=TRUE;
                                                       IF 
b^.ls^.QPfield^.THANAS=OMEGACOMPL
THEN
COMPARATIVEEXPECTED:=TRUE;
                                                       IF 
b^.ls^.QPfield^.THANAS IN [ASCOMPL,THANCOMPL]
THEN
THANPPOSSIBLE:=TRUE;
                                                       IF 
b^.ls^.QPfield^.THANAS IN [OFCOMPL]
THEN
BEGIN
OFCOMPLPOSSIBLE:=TRUE
END ;
                                                      END;
                                                      END;ADJP2RULE_7:=result;
END;
                                                      FUNCTION ADJP2RULE_8
(VAR rec:ADJP2RULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
( NOT DEGREEMODFOUND)                                 
THEN result:=TRUE;IF result THEN
BEGIN
DEGREEMODFOUND:=TRUE;
                                                       IF 
b^.ls^.ADVPfield^.THANAS=ASCOMPL
THEN
THANPPOSSIBLE:=TRUE;
                                                       IF 
b^.ls^.ADVPfield^.THANAS=THATCOMPL
THEN
COMPARATIVECOMPLEXPECTED:=TRUE;
                                                       IF 
b^.ls^.ADVPfield^.THANAS=TOCOMPL
THEN
TOCOMPLEXPECTED:=TRUE;
                                                      END;
                                                      END;ADJP2RULE_8:=result;
END;
                                                      FUNCTION ADJP2RULE_88
(VAR rec:ADJP2RULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
( NOT DEGREEMODFOUND)                                 
THEN result:=TRUE;IF result THEN
BEGIN
END;
                                                      END;ADJP2RULE_88:=result;
END;
                                                      FUNCTION ADJP2RULE_9
(VAR rec:ADJP2RULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
( NOT DEGREEMODFOUND)                                 
THEN result:=TRUE;IF result THEN
BEGIN
DEGREEMODFOUND:=TRUE
END                                                   
                                                      END;ADJP2RULE_9:=result;
END;
                                                      FUNCTION ADJP2RULE_25
(VAR rec:ADJP2RULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
( NOT DEGREEMODFOUND)                                 
THEN result:=TRUE;IF result THEN
BEGIN
COMPARATIVEEXPECTED:=TRUE;
                                                      END;
                                                      END;ADJP2RULE_25:=result;
END;
                                                      FUNCTION ADJP2RULE_14
(VAR rec:ADJP2RULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
 NOT DEGREEMODFOUND                                   
THEN result:=TRUE;IF result THEN
BEGIN
DEGREEMODFOUND:=TRUE;
                                                      HOPFOUND:=TRUE;
                                                      END;
                                                      END;ADJP2RULE_14:=result;
END;
                                                      FUNCTION ADJP2RULE_27
(VAR rec:ADJP2RULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
OFCOMPLPOSSIBLE=TRUE                                  
THEN result:=TRUE;IF result THEN
BEGIN
END;
                                                      END;ADJP2RULE_27:=result;
END;
                                                      FUNCTION ADJP2RULE_11
(VAR rec:ADJP2RULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
 NOT PREPOBJFOUND                                     
THEN result:=TRUE;IF result THEN
BEGIN
PREPOBJFOUND:=TRUE;
                                                      END;
                                                      END;ADJP2RULE_11:=result;
END;
                                                      FUNCTION ADJP2RULE_18
(VAR rec:ADJP2RULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
(THANPPOSSIBLE) AND ( NOT DEGREECOMPLFOUND)           
THEN result:=TRUE;IF result THEN
BEGIN
DEGREECOMPLFOUND:=TRUE
END                                                   
                                                      END;ADJP2RULE_18:=result;
END;
                                                       FUNCTION comp_ADJP2RULE(rec1,rec2:ADJP2RULEtyp):BOOLEAN;
BEGIN WITH rec1^ DO comp_ADJP2RULE:=
(COMPARATIVEEXPECTED=rec2^.COMPARATIVEEXPECTED) AND
(COMPARATIVEFOUND=rec2^.COMPARATIVEFOUND) AND
(COMPARATIVECOMPLEXPECTED=rec2^.COMPARATIVECOMPLEXPECTED) AND
(OFCOMPLPOSSIBLE=rec2^.OFCOMPLPOSSIBLE) AND
(THANPPOSSIBLE=rec2^.THANPPOSSIBLE) AND
(SUPERLATIVEFOUND=rec2^.SUPERLATIVEFOUND) AND
(DEGREEMODFOUND=rec2^.DEGREEMODFOUND) AND
(TOCOMPLEXPECTED=rec2^.TOCOMPLEXPECTED) AND
(HOPFOUND=rec2^.HOPFOUND) AND
(DONPFOUND=rec2^.DONPFOUND) AND
(PREPOBJFOUND=rec2^.PREPOBJFOUND) AND
(DEGREECOMPLFOUND=rec2^.DEGREECOMPLFOUND)
END;
PROCEDURE QP1RULE_0(VAR rec:QP1RULEtyp);
BEGIN WITH rec^ DO BEGIN
COMPLFOUND:=FALSE;
                                                      END;END;
                                                      FUNCTION QP1RULE_1
(VAR rec:QP1RULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
END;
                                                      END;QP1RULE_1:=result;
END;
                                                      FUNCTION QP1RULE_2
(VAR rec:QP1RULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
END;
                                                      END;QP1RULE_2:=result;
END;
                                                      FUNCTION QP1RULE_3
(VAR rec:QP1RULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
END;
                                                      END;QP1RULE_3:=result;
END;
                                                      FUNCTION QP1RULE_4
(VAR rec:QP1RULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
END;
                                                      END;QP1RULE_4:=result;
END;
                                                      FUNCTION QP1RULE_5
(VAR rec:QP1RULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
 NOT COMPLFOUND                                       
THEN result:=TRUE;IF result THEN
BEGIN
COMPLFOUND:=TRUE;
                                                      END;
                                                      END;QP1RULE_5:=result;
END;
                                                       FUNCTION comp_QP1RULE(rec1,rec2:QP1RULEtyp):BOOLEAN;
BEGIN WITH rec1^ DO comp_QP1RULE:=
(COMPLFOUND=rec2^.COMPLFOUND)
END;
PROCEDURE THANPRULE_0(VAR rec:THANPRULEtyp);
BEGIN WITH rec^ DO BEGIN
                                                      END;END;
                                                      FUNCTION THANPRULE_1
(VAR rec:THANPRULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
END;
                                                      END;THANPRULE_1:=result;
END;
                                                      FUNCTION THANPRULE_2
(VAR rec:THANPRULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
END;
                                                      END;THANPRULE_2:=result;
END;
                                                      FUNCTION THANPRULE_3
(VAR rec:THANPRULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
END;
                                                      END;THANPRULE_3:=result;
END;
                                                      FUNCTION THANPRULE_4
(VAR rec:THANPRULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
END;
                                                      END;THANPRULE_4:=result;
END;
                                                      FUNCTION THANPRULE_5
(VAR rec:THANPRULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
END;
                                                      END;THANPRULE_5:=result;
END;
                                                      FUNCTION THANPRULE_6
(VAR rec:THANPRULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
END;
                                                      END;THANPRULE_6:=result;
END;
                                                       FUNCTION comp_THANPRULE(rec1,rec2:THANPRULEtyp):BOOLEAN;
BEGIN WITH rec1^ DO comp_THANPRULE:=
TRUE
END;
PROCEDURE SENTENCE1RULE_0(VAR rec:SENTENCE1RULEtyp);
BEGIN WITH rec^ DO BEGIN
AUXFOUND:=FALSE;
ADVFOUND:=FALSE;
CONJFOUND:=FALSE;
EXTRAPOSOK:=FALSE;
INFDOINCONJFOUND:=FALSE;
INVERSFOUND:=FALSE;
LEFTDISLOCFOUND:=FALSE;
LETINCONJFOUND:=FALSE;
LETUSGLUEFOUND:=FALSE;
NEGFOUND:=FALSE;
NOTINAUXFOUND:=FALSE;
RELPROFOUND:=FALSE;
SHIFTFOUND:=FALSE;
SHIFTNUMBERVAR:=OMEGANUMBER;
SUBJNUMBERVAR:=OMEGANUMBER;
SUBJPERSONVAR:=3;
SUBJFOUND:=FALSE;
SYNVPEFSVAR:=[];
THERENPFOUND:=FALSE;
TOFOUND:=FALSE;
VERBCONJFOUND:=FALSE;
VERBPERSONSVAR:=[];
VERBNUMBERSVAR:=[];
VERBSUBCVAR:=MAINVERB;
VERBSYNVPSVAR:=[];
VERBTHETAVPVAR:=OMEGATHETAVP;
XPINLDLFOUND:=FALSE;
                                                      END;END;
                                                      FUNCTION SENTENCE1RULE_1
(VAR rec:SENTENCE1RULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
( NOT XPINLDLFOUND)                                   
THEN result:=TRUE;IF result THEN
BEGIN
CONJFOUND:=TRUE;
                                                      VERBCONJFOUND:=TRUE;
                                                      LETINCONJFOUND:=LETINCONJ(B);
                                                      INFDOINCONJFOUND:=(((
b^.ls^.VERBfield^.SUBC=DOAUX) OR ((
b^.ls^.VERBfield^.SUBC=NOTAUX) AND (GETSUBC(B)=DOAUX))) AND (
b^.ls^.VERBfield^.MODUS IN [INFINITIVE]));
                                                      VERBPERSONSVAR:=
b^.ls^.VERBfield^.PERSONS;
                                                      VERBNUMBERSVAR:=
b^.ls^.VERBfield^.NUMBERS;
                                                       IF 
b^.ls^.VERBfield^.SUBC=NOTAUX
THEN
BEGIN
NOTINAUXFOUND:=TRUE;
                                                      VERBSUBCVAR:=GETSUBC(B);
                                                      
END 
ELSE
VERBSUBCVAR:=
b^.ls^.VERBfield^.SUBC;
                                                      VERBTHETAVPVAR:=
b^.ls^.VERBfield^.THETAVP;
                                                      VERBSYNVPSVAR:=
b^.ls^.VERBfield^.SYNVPS;
                                                      END;
                                                      END;SENTENCE1RULE_1:=result;
END;
                                                      FUNCTION SENTENCE1RULE_2
(VAR rec:SENTENCE1RULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
((VERBCONJFOUND AND ( NOT LETINCONJFOUND))<=((
b^.ls^.NPfield^.PERSON IN VERBPERSONSVAR) AND (
b^.ls^.NPfield^.NUMBER IN VERBNUMBERSVAR))) AND ((VERBCONJFOUND AND ( NOT LETINCONJFOUND))<=(NOMINATIVE IN 
b^.ls^.NPfield^.CASES)) AND (
b^.ls^.NPfield^.MOOD<>WH) AND (LETINCONJFOUND<=(ACCUSATIVE IN 
b^.ls^.NPfield^.CASES)) AND (LETUSGLUEFOUND<=((
b^.ls^.NPfield^.PERSON=1) AND (
b^.ls^.NPfield^.NUMBER=PLURAL)))                      
THEN result:=TRUE;IF result THEN
BEGIN
SUBJFOUND:=TRUE;
                                                       IF VERBCONJFOUND
THEN
INVERSFOUND:=TRUE;
                                                      SUBJPERSONVAR:=
b^.ls^.NPfield^.PERSON;
                                                      SUBJNUMBERVAR:=
b^.ls^.NPfield^.NUMBER;
                                                      THERENPFOUND:=THERENP_(B);
                                                      END;
                                                      END;SENTENCE1RULE_2:=result;
END;
                                                      FUNCTION SENTENCE1RULE_3
(VAR rec:SENTENCE1RULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
( NOT VERBCONJFOUND) AND SVAOK(REC^,B)                
THEN result:=TRUE;IF result THEN
BEGIN
AUXFOUND:=TRUE;
                                                       IF 
b^.ls^.VERBfield^.SUBC=NOTAUX
THEN
BEGIN
NOTINAUXFOUND:=TRUE;
                                                      VERBSUBCVAR:=GETSUBC(B);
                                                      
END 
ELSE
VERBSUBCVAR:=
b^.ls^.VERBfield^.SUBC;
                                                      VERBTHETAVPVAR:=
b^.ls^.VERBfield^.THETAVP;
                                                      VERBSYNVPSVAR:=
b^.ls^.VERBfield^.SYNVPS;
                                                      END;
                                                      END;SENTENCE1RULE_3:=result;
END;
                                                      FUNCTION SENTENCE1RULE_4
(VAR rec:SENTENCE1RULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
SUBJANDVPANDAUXOK(REC^,B) AND (( NOT 
b^.ls^.VERBPfield^.HEADFOUND)<=((VERBSUBCVAR IN [HAVEVERB,BEVERB]))) AND (((VERBSUBCVAR<>HAVEVERB) AND (VERBSUBCVAR<>BEVERB))<=(
b^.ls^.VERBPfield^.HEADFOUND)) AND ((VERBTHETAVPVAR<>OMEGATHETAVP)<=AUXANDVERBPOK(REC^,
b^.ls^.VERBPfield^.MODUS,
b^.ls^.VERBPfield^.FOUNDAUXES,B)) AND ((VERBSUBCVAR=BEVERB)<=( NOT ((
b^.ls^.VERBPfield^.VOICE=PASSIVE) AND (PASS IN 
b^.ls^.VERBPfield^.FOUNDAUXES) AND (
b^.ls^.VERBPfield^.MODUS=PARTICIPLE)))) AND (((
b^.ls^.VERBPfield^.VOICE=PASSIVE) AND (
b^.ls^.VERBPfield^.FOUNDAUXES*[PASS]=[]))<=(VERBSUBCVAR=BEVERB)) AND (TOFOUND<=(
b^.ls^.VERBPfield^.MODUS=INFINITIVE)) AND (((VERBSUBCVAR=BEVERB) AND (
b^.ls^.VERBPfield^.MODUS=PARTICIPLE))<=(
b^.ls^.VERBPfield^.VOICE=PASSIVE)) AND ((LETINCONJFOUND OR INFDOINCONJFOUND)<=(
b^.ls^.VERBPfield^.MODUS=INFINITIVE)) AND (((VERBSUBCVAR=HAVEVERB) AND AUXFOUND AND ( NOT 
b^.ls^.VERBPfield^.HEADFOUND))<=(NEGFOUND OR NOTINAUXFOUND)) AND (( NOT 
b^.ls^.VERBPfield^.HEADFOUND)<=(VERBSYNVPSVAR*
b^.ls^.VERBPfield^.SYNVPEFS<>[]))                     
THEN result:=TRUE;IF result THEN
BEGIN
 IF 
b^.ls^.VERBPfield^.HEADFOUND
THEN
BEGIN
SYNVPEFSVAR:=
b^.ls^.VERBPfield^.SYNVPEFS
END 
ELSE
BEGIN
SYNVPEFSVAR:=VERBSYNVPSVAR*
b^.ls^.VERBPfield^.SYNVPEFS
END ;
                                                      EXTRAPOSOK:= NOT (
b^.ls^.VERBPfield^.SCOMPLFOUND);
                                                      END;
                                                      END;SENTENCE1RULE_4:=result;
END;
                                                      FUNCTION SENTENCE1RULE_5
(VAR rec:SENTENCE1RULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
END;
                                                      END;SENTENCE1RULE_5:=result;
END;
                                                      FUNCTION SENTENCE1RULE_6
(VAR rec:SENTENCE1RULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
( NOT NOTINAUXFOUND)                                  
THEN result:=TRUE;IF result THEN
BEGIN
NEGFOUND:=TRUE;
                                                      END;
                                                      END;SENTENCE1RULE_6:=result;
END;
                                                      FUNCTION SENTENCE1RULE_7
(VAR rec:SENTENCE1RULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
END;
                                                      END;SENTENCE1RULE_7:=result;
END;
                                                      FUNCTION SENTENCE1RULE_8
(VAR rec:SENTENCE1RULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
( NOT LEFTDISLOCFOUND)                                
THEN result:=TRUE;IF result THEN
BEGIN
CONJFOUND:=TRUE;
                                                      END;
                                                      END;SENTENCE1RULE_8:=result;
END;
                                                      FUNCTION SENTENCE1RULE_9
(VAR rec:SENTENCE1RULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
( NOT XPINLDLFOUND)                                   
THEN result:=TRUE;IF result THEN
BEGIN
SHIFTFOUND:=TRUE;
                                                      SHIFTNUMBERVAR:=
b^.ls^.NPfield^.NUMBER;
                                                      END;
                                                      END;SENTENCE1RULE_9:=result;
END;
                                                      FUNCTION SENTENCE1RULE_10
(VAR rec:SENTENCE1RULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
( NOT XPINLDLFOUND)                                   
THEN result:=TRUE;IF result THEN
BEGIN
SHIFTFOUND:=TRUE;
                                                      END;
                                                      END;SENTENCE1RULE_10:=result;
END;
                                                      FUNCTION SENTENCE1RULE_11
(VAR rec:SENTENCE1RULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
( NOT XPINLDLFOUND)                                   
THEN result:=TRUE;IF result THEN
BEGIN
SHIFTFOUND:=TRUE;
                                                      END;
                                                      END;SENTENCE1RULE_11:=result;
END;
                                                      FUNCTION SENTENCE1RULE_12
(VAR rec:SENTENCE1RULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
( NOT XPINLDLFOUND)                                   
THEN result:=TRUE;IF result THEN
BEGIN
SHIFTFOUND:=TRUE;
                                                      END;
                                                      END;SENTENCE1RULE_12:=result;
END;
                                                      FUNCTION SENTENCE1RULE_13
(VAR rec:SENTENCE1RULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
( NOT LEFTDISLOCFOUND)                                
THEN result:=TRUE;IF result THEN
BEGIN
SHIFTFOUND:=TRUE;
                                                      RELPROFOUND:=TRUE;
                                                      END;
                                                      END;SENTENCE1RULE_13:=result;
END;
                                                      FUNCTION SENTENCE1RULE_14
(VAR rec:SENTENCE1RULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
LEFTDISLOCFOUND:=TRUE;
                                                      XPINLDLFOUND:=TRUE;
                                                      END;
                                                      END;SENTENCE1RULE_14:=result;
END;
                                                      FUNCTION SENTENCE1RULE_15
(VAR rec:SENTENCE1RULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
LEFTDISLOCFOUND:=TRUE;
                                                      END;
                                                      END;SENTENCE1RULE_15:=result;
END;
                                                      FUNCTION SENTENCE1RULE_16
(VAR rec:SENTENCE1RULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
EXTRAPOSOK:=TRUE;
                                                      ADVFOUND:=TRUE;
                                                      END;
                                                      END;SENTENCE1RULE_16:=result;
END;
                                                      FUNCTION SENTENCE1RULE_17
(VAR rec:SENTENCE1RULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
EXTRAPOSOK:=TRUE;
                                                      ADVFOUND:=TRUE;
                                                      END;
                                                      END;SENTENCE1RULE_17:=result;
END;
                                                      FUNCTION SENTENCE1RULE_18
(VAR rec:SENTENCE1RULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
EXTRAPOSOK:=TRUE;
                                                      ADVFOUND:=TRUE;
                                                      END;
                                                      END;SENTENCE1RULE_18:=result;
END;
                                                      FUNCTION SENTENCE1RULE_19
(VAR rec:SENTENCE1RULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
EXTRAPOSOK:=TRUE;
                                                      ADVFOUND:=TRUE;
                                                      END;
                                                      END;SENTENCE1RULE_19:=result;
END;
                                                      FUNCTION SENTENCE1RULE_20
(VAR rec:SENTENCE1RULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
EXTRAPOSOK:=TRUE;
                                                      ADVFOUND:=TRUE;
                                                      END;
                                                      END;SENTENCE1RULE_20:=result;
END;
                                                      FUNCTION SENTENCE1RULE_21
(VAR rec:SENTENCE1RULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
EXTRAPOSOK:=TRUE;
                                                      ADVFOUND:=TRUE;
                                                      END;
                                                      END;SENTENCE1RULE_21:=result;
END;
                                                      FUNCTION SENTENCE1RULE_22
(VAR rec:SENTENCE1RULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
EXTRAPOSOK:=TRUE;
                                                      ADVFOUND:=TRUE;
                                                      END;
                                                      END;SENTENCE1RULE_22:=result;
END;
                                                      FUNCTION SENTENCE1RULE_23
(VAR rec:SENTENCE1RULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
END;
                                                      END;SENTENCE1RULE_23:=result;
END;
                                                      FUNCTION SENTENCE1RULE_24
(VAR rec:SENTENCE1RULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
EXTRAPOSOK AND ((SYNVPEFSVAR*
LSAUXDOM_SENTCOMPLVPS<>[])<=(
b^.ls^.SENTENCEfield^.FINITENESS<>INFINITE))          
THEN result:=TRUE;IF result THEN
BEGIN
END;
                                                      END;SENTENCE1RULE_24:=result;
END;
                                                      FUNCTION SENTENCE1RULE_25
(VAR rec:SENTENCE1RULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
END;
                                                      END;SENTENCE1RULE_25:=result;
END;
                                                      FUNCTION SENTENCE1RULE_26
(VAR rec:SENTENCE1RULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
END;
                                                      END;SENTENCE1RULE_26:=result;
END;
                                                      FUNCTION SENTENCE1RULE_27
(VAR rec:SENTENCE1RULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
LEFTDISLOCFOUND:=TRUE;
                                                      XPINLDLFOUND:=TRUE;
                                                      END;
                                                      END;SENTENCE1RULE_27:=result;
END;
                                                      FUNCTION SENTENCE1RULE_28
(VAR rec:SENTENCE1RULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
LEFTDISLOCFOUND:=TRUE;
                                                      XPINLDLFOUND:=TRUE;
                                                      END;
                                                      END;SENTENCE1RULE_28:=result;
END;
                                                      FUNCTION SENTENCE1RULE_29
(VAR rec:SENTENCE1RULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
LEFTDISLOCFOUND:=TRUE;
                                                      XPINLDLFOUND:=TRUE;
                                                      END;
                                                      END;SENTENCE1RULE_29:=result;
END;
                                                      FUNCTION SENTENCE1RULE_30
(VAR rec:SENTENCE1RULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
LEFTDISLOCFOUND:=TRUE;
                                                      XPINLDLFOUND:=TRUE;
                                                      END;
                                                      END;SENTENCE1RULE_30:=result;
END;
                                                      FUNCTION SENTENCE1RULE_31
(VAR rec:SENTENCE1RULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
( NOT VERBCONJFOUND) AND ( NOT AUXFOUND)              
THEN result:=TRUE;IF result THEN
BEGIN
TOFOUND:=TRUE;
                                                      END;
                                                      END;SENTENCE1RULE_31:=result;
END;
                                                      FUNCTION SENTENCE1RULE_32
(VAR rec:SENTENCE1RULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
( NOT SHIFTFOUND) AND ( NOT LEFTDISLOCFOUND) AND ( NOT CONJFOUND) AND ( NOT LETUSGLUEFOUND)                 
THEN result:=TRUE;IF result THEN
BEGIN
SUBJFOUND:=TRUE;
                                                      END;
                                                      END;SENTENCE1RULE_32:=result;
END;
                                                      FUNCTION SENTENCE1RULE_33
(VAR rec:SENTENCE1RULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
LETINCONJFOUND                                        
THEN result:=TRUE;IF result THEN
BEGIN
LETUSGLUEFOUND:=TRUE;
                                                      END;
                                                      END;SENTENCE1RULE_33:=result;
END;
                                                      FUNCTION SENTENCE1RULE_34
(VAR rec:SENTENCE1RULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
( NOT LEFTDISLOCFOUND)                                
THEN result:=TRUE;IF result THEN
BEGIN
CONJFOUND:=TRUE;
                                                      END;
                                                      END;SENTENCE1RULE_34:=result;
END;
                                                       FUNCTION comp_SENTENCE1RULE(rec1,rec2:SENTENCE1RULEtyp):BOOLEAN;
BEGIN WITH rec1^ DO comp_SENTENCE1RULE:=
(ADVFOUND=rec2^.ADVFOUND) AND
(AUXFOUND=rec2^.AUXFOUND) AND
(CONJFOUND=rec2^.CONJFOUND) AND
(EXTRAPOSOK=rec2^.EXTRAPOSOK) AND
(INFDOINCONJFOUND=rec2^.INFDOINCONJFOUND) AND
(INVERSFOUND=rec2^.INVERSFOUND) AND
(LEFTDISLOCFOUND=rec2^.LEFTDISLOCFOUND) AND
(LETINCONJFOUND=rec2^.LETINCONJFOUND) AND
(LETUSGLUEFOUND=rec2^.LETUSGLUEFOUND) AND
(NEGFOUND=rec2^.NEGFOUND) AND
(NOTINAUXFOUND=rec2^.NOTINAUXFOUND) AND
(RELPROFOUND=rec2^.RELPROFOUND) AND
(SHIFTFOUND=rec2^.SHIFTFOUND) AND
(SHIFTNUMBERVAR=rec2^.SHIFTNUMBERVAR) AND
(SUBJNUMBERVAR=rec2^.SUBJNUMBERVAR) AND
(SUBJPERSONVAR=rec2^.SUBJPERSONVAR) AND
(SUBJFOUND=rec2^.SUBJFOUND) AND
(SYNVPEFSVAR=rec2^.SYNVPEFSVAR) AND
(THERENPFOUND=rec2^.THERENPFOUND) AND
(TOFOUND=rec2^.TOFOUND) AND
(VERBCONJFOUND=rec2^.VERBCONJFOUND) AND
(VERBPERSONSVAR=rec2^.VERBPERSONSVAR) AND
(VERBNUMBERSVAR=rec2^.VERBNUMBERSVAR) AND
(VERBSUBCVAR=rec2^.VERBSUBCVAR) AND
(VERBSYNVPSVAR=rec2^.VERBSYNVPSVAR) AND
(VERBTHETAVPVAR=rec2^.VERBTHETAVPVAR) AND
(XPINLDLFOUND=rec2^.XPINLDLFOUND)
END;
