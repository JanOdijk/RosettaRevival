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
