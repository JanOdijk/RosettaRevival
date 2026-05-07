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
