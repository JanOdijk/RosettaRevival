PROCEDURE SENTENCESRULE_0(VAR rec:SENTENCESRULEtyp);
BEGIN WITH rec^ DO BEGIN
ADJPPREDRELFOUND:=FALSE;
ADVLDLFOUND:=FALSE;
ADVPPREDRELFOUND:=FALSE;
ADVPREPFOUND:=FALSE;
CONJRELFOUND:=FALSE;
CONJSENTINM1FOUND:=FALSE;
DEFRADVRELFOUND:=FALSE;
DIRARGNPFOUND:=FALSE;
DIRARGRELFOUND:=FALSE;
ERINERPOSRELFOUND:=FALSE;
ERINSHIFTFOUND:=FALSE;
ERPOSRELFOUND:=FALSE;
ERQRELFOUND:=FALSE;
EXPPARTICLE:=0;
HETCLRELFOUND:=FALSE;
HIERDAARINRPOSFOUND:=FALSE;
INDOBJRELFOUND:=FALSE;
FIRSTCLRELFOUND:=FALSE;
LEFTDISLOCRELFOUND:=FALSE;
LOCARGRELFOUND:=FALSE;
NEGORPOSFOUND:=FALSE;
NPPREDRELFOUND:=FALSE;
OBJRELFOUND:=FALSE;
PARTICLEKEY:=0;
POSTSUBJRELFOUND:=FALSE;
POSTVPORELFOUND:=FALSE;
POSTVRELFOUND:=FALSE;
PREADVREL2FOUND:=FALSE;
PREADVRELFOUND:=FALSE;
PREPOBJRELFOUND:=FALSE;
PREPOBJ1FOUND:=FALSE;
PREPOBJ2FOUND:=FALSE;
PREPPPREDRELFOUND:=FALSE;
PREPREPOBJRELFOUND:=FALSE;
REFLRELFOUND:=FALSE;
RESULTPUNCRELFOUND:=FALSE;
SHIFTRELFOUND:=FALSE;
STADVFOUND:=FALSE;
STRANDEDPPFOUND:=FALSE;
STRANDEDRELFOUND:=FALSE;
SUBJRELFOUND:=FALSE;
V2ADJUNCTS:=[];
V2FOUND:=FALSE;
V2SUBCVAR:=MAINVERB;
V2SYNVPEFSVAR:=[];
VERBPFOUND:=FALSE;
                                                      END;END;
                                                      FUNCTION SENTENCESRULE_1
(VAR rec:SENTENCESRULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
LEFTDISLOCRELFOUND:=TRUE;
                                                      END;
                                                      END;SENTENCESRULE_1:=result;
END;
                                                      FUNCTION SENTENCESRULE_2
(VAR rec:SENTENCESRULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
END;
                                                      END;SENTENCESRULE_2:=result;
END;
                                                      FUNCTION SENTENCESRULE_3
(VAR rec:SENTENCESRULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
( NOT SHIFTRELFOUND) AND ((LEFTDISLOCRELFOUND AND ( NOT ADVLDLFOUND))<=(
b^.ls^.NPfield^.NPHEAD=DATNP))                        
THEN result:=TRUE;IF result THEN
BEGIN
SHIFTRELFOUND:=TRUE;
                                                      END;
                                                      END;SENTENCESRULE_3:=result;
END;
                                                      FUNCTION SENTENCESRULE_4
(VAR rec:SENTENCESRULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
( NOT SHIFTRELFOUND)                                  
THEN result:=TRUE;IF result THEN
BEGIN
SHIFTRELFOUND:=TRUE;
                                                      END;
                                                      END;SENTENCESRULE_4:=result;
END;
                                                      FUNCTION SENTENCESRULE_5
(VAR rec:SENTENCESRULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
( NOT SHIFTRELFOUND)                                  
THEN result:=TRUE;IF result THEN
BEGIN
SHIFTRELFOUND:=TRUE;
                                                      END;
                                                      END;SENTENCESRULE_5:=result;
END;
                                                      FUNCTION SENTENCESRULE_6
(VAR rec:SENTENCESRULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
( NOT SHIFTRELFOUND)                                  
THEN result:=TRUE;IF result THEN
BEGIN
SHIFTRELFOUND:=TRUE;
                                                      END;
                                                      END;SENTENCESRULE_6:=result;
END;
                                                      FUNCTION SENTENCESRULE_7
(VAR rec:SENTENCESRULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
( NOT SHIFTRELFOUND)                                  
THEN result:=TRUE;IF result THEN
BEGIN
SHIFTRELFOUND:=TRUE;
                                                      ERINSHIFTFOUND:=TRUE;
                                                      END;
                                                      END;SENTENCESRULE_7:=result;
END;
                                                      FUNCTION SENTENCESRULE_8
(VAR rec:SENTENCESRULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
(( NOT ADVPREPFOUND) OR ( NOT 
b^.ls^.CONJfield^.ADVERBIAL)) AND ( NOT CONJRELFOUND) 
THEN result:=TRUE;IF result THEN
BEGIN
CONJRELFOUND:=TRUE;
                                                      END;
                                                      END;SENTENCESRULE_8:=result;
END;
                                                      FUNCTION SENTENCESRULE_9
(VAR rec:SENTENCESRULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
( NOT CONJRELFOUND)                                   
THEN result:=TRUE;IF result THEN
BEGIN
CONJRELFOUND:=TRUE;
                                                      V2FOUND:=TRUE;
                                                      V2SYNVPEFSVAR:=
b^.ls^.VERBfield^.SYNVPS;
                                                      V2SUBCVAR:=
b^.ls^.VERBfield^.SUBC;
                                                      V2ADJUNCTS:=
b^.ls^.VERBfield^.ADJUNCTS;
                                                      EXPPARTICLE:=
b^.ls^.VERBfield^.PARTICLE;
                                                      END;
                                                      END;SENTENCESRULE_9:=result;
END;
                                                      FUNCTION SENTENCESRULE_10
(VAR rec:SENTENCESRULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
( NOT ERINSHIFTFOUND)                                 
THEN result:=TRUE;IF result THEN
BEGIN
SUBJRELFOUND:=TRUE;
                                                      END;
                                                      END;SENTENCESRULE_10:=result;
END;
                                                      FUNCTION SENTENCESRULE_11
(VAR rec:SENTENCESRULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
 NOT (V2FOUND AND (V2SUBCVAR IN [MAINVERB,MODALVERB]) AND (
b^.ls^.VERBPfield^.VMATRIXHEAD=TRUE)) AND ((PREADVRELFOUND AND V2FOUND AND (V2SYNVPEFSVAR*
LSAUXDOM_INDOBJVPS=[]))<=( NOT 
b^.ls^.VERBPfield^.OBJFOUND))                         
THEN result:=TRUE;IF result THEN
BEGIN
VERBPFOUND:=TRUE;
                                                      OBJRELFOUND:=
b^.ls^.VERBPfield^.OBJFOUND;
                                                      INDOBJRELFOUND:=
b^.ls^.VERBPfield^.INDOBJFOUND;
                                                      LOCARGRELFOUND:=
b^.ls^.VERBPfield^.LOCARGFOUND;
                                                      DIRARGRELFOUND:=
b^.ls^.VERBPfield^.DIRARGFOUND;
                                                      PREPOBJRELFOUND:=
b^.ls^.VERBPfield^.PREPOBJFOUND;
                                                      NPPREDRELFOUND:=
b^.ls^.VERBPfield^.NPPREDFOUND;
                                                      ADJPPREDRELFOUND:=
b^.ls^.VERBPfield^.ADJPPPREDFOUND;
                                                      PREPPPREDRELFOUND:=
b^.ls^.VERBPfield^.PREPPPREDFOUND;
                                                      POSTVPORELFOUND:=
b^.ls^.VERBPfield^.POSTVPOFOUND;
                                                      STRANDEDRELFOUND:=
b^.ls^.VERBPfield^.STRANDEDFOUND;
                                                      END;
                                                      END;SENTENCESRULE_11:=result;
END;
                                                      FUNCTION SENTENCESRULE_12
(VAR rec:SENTENCESRULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
EXTRAPPOK(REC^)                                       
THEN result:=TRUE;IF result THEN
BEGIN
END;
                                                      END;SENTENCESRULE_12:=result;
END;
                                                      FUNCTION SENTENCESRULE_13
(VAR rec:SENTENCESRULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
( NOT SHIFTRELFOUND)                                  
THEN result:=TRUE;IF result THEN
BEGIN
SHIFTRELFOUND:=TRUE;
                                                      END;
                                                      END;SENTENCESRULE_13:=result;
END;
                                                      FUNCTION SENTENCESRULE_14
(VAR rec:SENTENCESRULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
STADVFOUND:=TRUE;
                                                      END;
                                                      END;SENTENCESRULE_14:=result;
END;
                                                      FUNCTION SENTENCESRULE_15
(VAR rec:SENTENCESRULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
END;
                                                      END;SENTENCESRULE_15:=result;
END;
                                                      FUNCTION SENTENCESRULE_16
(VAR rec:SENTENCESRULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
END;
                                                      END;SENTENCESRULE_16:=result;
END;
                                                      FUNCTION SENTENCESRULE_17
(VAR rec:SENTENCESRULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
(VERBPFOUND OR (OBJRELFOUND AND POSTVPOOK(ADJPPREDRELFOUND,ADVPPREDRELFOUND,NPPREDRELFOUND,
PREPPPREDRELFOUND,STRANDEDRELFOUND,PREPOBJRELFOUND,LOCARGRELFOUND,DIRARGRELFOUND,PARTICLEKEY)))          
THEN result:=TRUE;IF result THEN
BEGIN
END;
                                                      END;SENTENCESRULE_17:=result;
END;
                                                      FUNCTION SENTENCESRULE_18
(VAR rec:SENTENCESRULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
END;
                                                      END;SENTENCESRULE_18:=result;
END;
                                                      FUNCTION SENTENCESRULE_19
(VAR rec:SENTENCESRULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
END;
                                                      END;SENTENCESRULE_19:=result;
END;
                                                      FUNCTION SENTENCESRULE_20
(VAR rec:SENTENCESRULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
RESULTPUNCRELFOUND:=TRUE
END                                                   
                                                      END;SENTENCESRULE_20:=result;
END;
                                                      FUNCTION SENTENCESRULE_21
(VAR rec:SENTENCESRULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
( NOT (
b^.ls^.SENTENCEfield^.FINITENESS=FINITE)) OR (RESULTPUNCRELFOUND)                                   
THEN result:=TRUE;IF result THEN
BEGIN
END;
                                                      END;SENTENCESRULE_21:=result;
END;
                                                      FUNCTION SENTENCESRULE_22
(VAR rec:SENTENCESRULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
HETCLRELFOUND:=TRUE;
                                                      END;
                                                      END;SENTENCESRULE_22:=result;
END;
                                                      FUNCTION SENTENCESRULE_23
(VAR rec:SENTENCESRULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
FIRSTCLRELFOUND:=TRUE;
                                                      END;
                                                      END;SENTENCESRULE_23:=result;
END;
                                                      FUNCTION SENTENCESRULE_24
(VAR rec:SENTENCESRULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
( NOT HETCLRELFOUND) AND (FIRSTCLRELFOUND) AND ( NOT (FIRSTCLRELFOUND AND (
b^.ls^.PERSPROfield^.PERSPROCASES=[DATIVE])))         
THEN result:=TRUE;IF result THEN
BEGIN
END;
                                                      END;SENTENCESRULE_24:=result;
END;
                                                      FUNCTION SENTENCESRULE_25
(VAR rec:SENTENCESRULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
( NOT STADVFOUND) AND ( NOT ERQRELFOUND) AND (( NOT ERPOSRELFOUND) OR (ERINERPOSRELFOUND)) AND ( NOT 
REFLRELFOUND) AND ( NOT CONJSENTINM1FOUND)            
THEN result:=TRUE;IF result THEN
BEGIN
REFLRELFOUND:=TRUE;
                                                      END;
                                                      END;SENTENCESRULE_25:=result;
END;
                                                      FUNCTION SENTENCESRULE_26
(VAR rec:SENTENCESRULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
( NOT POSTSUBJRELFOUND) AND ( NOT ERPOSRELFOUND) AND ( NOT DEFRADVRELFOUND) AND ( NOT CONJSENTINM1FOUND) AND
 ( NOT ERINSHIFTFOUND)                                
THEN result:=TRUE;IF result THEN
BEGIN
ERPOSRELFOUND:=TRUE;
                                                       IF (
b^.ls^.RADVPfield^.RADVKEY=auxkey('ERRADVKEY'))
THEN
ERINERPOSRELFOUND:=TRUE;
                                                       IF ((
b^.ls^.RADVPfield^.RADVKEY=auxkey('HIERRADVKEY')) OR (
b^.ls^.RADVPfield^.RADVKEY=auxkey('DAARRADVKEY')))
THEN
HIERDAARINRPOSFOUND:=TRUE;
                                                      END;
                                                      END;SENTENCESRULE_26:=result;
END;
                                                      FUNCTION SENTENCESRULE_27
(VAR rec:SENTENCESRULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
( NOT POSTSUBJRELFOUND) AND ( NOT ERPOSRELFOUND) AND ( NOT DEFRADVRELFOUND) AND ( NOT CONJSENTINM1FOUND) AND
 ( NOT ERINSHIFTFOUND)                                
THEN result:=TRUE;IF result THEN
BEGIN
ERPOSRELFOUND:=TRUE;
                                                      STADVFOUND:=TRUE
END                                                   
                                                      END;SENTENCESRULE_27:=result;
END;
                                                      FUNCTION SENTENCESRULE_28
(VAR rec:SENTENCESRULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
DEFRADVRELFOUND:=TRUE;
                                                      STADVFOUND:=TRUE
END                                                   
                                                      END;SENTENCESRULE_28:=result;
END;
                                                      FUNCTION SENTENCESRULE_29
(VAR rec:SENTENCESRULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
( NOT NEGORPOSFOUND)                                  
THEN result:=TRUE;IF result THEN
BEGIN
NEGORPOSFOUND:=TRUE;
                                                      END;
                                                      END;SENTENCESRULE_29:=result;
END;
                                                      FUNCTION SENTENCESRULE_30
(VAR rec:SENTENCESRULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
( NOT NEGORPOSFOUND)                                  
THEN result:=TRUE;IF result THEN
BEGIN
NEGORPOSFOUND:=TRUE;
                                                      END;
                                                      END;SENTENCESRULE_30:=result;
END;
                                                      FUNCTION SENTENCESRULE_31
(VAR rec:SENTENCESRULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
STADVFOUND:=TRUE
END                                                   
                                                      END;SENTENCESRULE_31:=result;
END;
                                                      FUNCTION SENTENCESRULE_32
(VAR rec:SENTENCESRULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
STADVFOUND:=TRUE
END                                                   
                                                      END;SENTENCESRULE_32:=result;
END;
                                                      FUNCTION SENTENCESRULE_33
(VAR rec:SENTENCESRULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
STADVFOUND:=TRUE
END                                                   
                                                      END;SENTENCESRULE_33:=result;
END;
                                                      FUNCTION SENTENCESRULE_34
(VAR rec:SENTENCESRULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
STADVFOUND:=TRUE
END                                                   
                                                      END;SENTENCESRULE_34:=result;
END;
                                                      FUNCTION SENTENCESRULE_35
(VAR rec:SENTENCESRULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
STADVFOUND:=TRUE
END                                                   
                                                      END;SENTENCESRULE_35:=result;
END;
                                                      FUNCTION SENTENCESRULE_36
(VAR rec:SENTENCESRULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
( NOT PREADVRELFOUND)                                 
THEN result:=TRUE;IF result THEN
BEGIN
PREADVRELFOUND:=TRUE;
                                                      END;
                                                      END;SENTENCESRULE_36:=result;
END;
                                                      FUNCTION SENTENCESRULE_37
(VAR rec:SENTENCESRULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
PREADVRELFOUND AND ( NOT PREADVREL2FOUND)             
THEN result:=TRUE;IF result THEN
BEGIN
PREADVREL2FOUND:=TRUE;
                                                      END;
                                                      END;SENTENCESRULE_37:=result;
END;
                                                      FUNCTION SENTENCESRULE_38
(VAR rec:SENTENCESRULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
END;
                                                      END;SENTENCESRULE_38:=result;
END;
                                                      FUNCTION SENTENCESRULE_39
(VAR rec:SENTENCESRULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
END;
                                                      END;SENTENCESRULE_39:=result;
END;
                                                      FUNCTION SENTENCESRULE_40
(VAR rec:SENTENCESRULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
END;
                                                      END;SENTENCESRULE_40:=result;
END;
                                                      FUNCTION SENTENCESRULE_41
(VAR rec:SENTENCESRULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
STADVFOUND:=TRUE;
                                                      END;
                                                      END;SENTENCESRULE_41:=result;
END;
                                                      FUNCTION SENTENCESRULE_42
(VAR rec:SENTENCESRULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
( NOT SHIFTRELFOUND)                                  
THEN result:=TRUE;IF result THEN
BEGIN
SHIFTRELFOUND:=TRUE;
                                                      END;
                                                      END;SENTENCESRULE_42:=result;
END;
                                                      FUNCTION SENTENCESRULE_43
(VAR rec:SENTENCESRULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
( NOT CONJSENTINM1FOUND)                              
THEN result:=TRUE;IF result THEN
BEGIN
CONJSENTINM1FOUND:=TRUE;
                                                      END;
                                                      END;SENTENCESRULE_43:=result;
END;
                                                      FUNCTION SENTENCESRULE_44
(VAR rec:SENTENCESRULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
END;
                                                      END;SENTENCESRULE_44:=result;
END;
                                                      FUNCTION SENTENCESRULE_45
(VAR rec:SENTENCESRULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
( NOT POSTSUBJRELFOUND) AND ( NOT SUBJRELFOUND) AND ( NOT PREADVRELFOUND)                                   
THEN result:=TRUE;IF result THEN
BEGIN
POSTSUBJRELFOUND:=TRUE;
                                                      END;
                                                      END;SENTENCESRULE_45:=result;
END;
                                                      FUNCTION SENTENCESRULE_46
(VAR rec:SENTENCESRULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
LEFTDISLOCRELFOUND:=TRUE;
                                                      ADVLDLFOUND:=TRUE;
                                                      END;
                                                      END;SENTENCESRULE_46:=result;
END;
                                                      FUNCTION SENTENCESRULE_47
(VAR rec:SENTENCESRULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
( NOT ERQRELFOUND) AND ((ERPOSRELFOUND AND ( NOT ERINERPOSRELFOUND)) OR ERINSHIFTFOUND) AND ( NOT 
POSTSUBJRELFOUND) AND ( NOT CONJSENTINM1FOUND)        
THEN result:=TRUE;IF result THEN
BEGIN
ERQRELFOUND:=TRUE;
                                                      END;
                                                      END;SENTENCESRULE_47:=result;
END;
                                                      FUNCTION SENTENCESRULE_48
(VAR rec:SENTENCESRULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
ERINERPOSRELFOUND OR (HIERDAARINRPOSFOUND)            
THEN result:=TRUE;IF result THEN
BEGIN
END;
                                                      END;SENTENCESRULE_48:=result;
END;
                                                      FUNCTION SENTENCESRULE_49
(VAR rec:SENTENCESRULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
V2FOUND AND ((V2SYNVPEFSVAR*
LSAUXDOM_INDOBJVPS<>[]) OR (BENFACTNP IN V2ADJUNCTS)) 
THEN result:=TRUE;IF result THEN
BEGIN
INDOBJRELFOUND:=TRUE;
                                                      END;
                                                      END;SENTENCESRULE_49:=result;
END;
                                                      FUNCTION SENTENCESRULE_50
(VAR rec:SENTENCESRULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
V2FOUND AND (V2SYNVPEFSVAR*
LSAUXDOM_AANOBJVPS<>[])                               
THEN result:=TRUE;IF result THEN
BEGIN
END;
                                                      END;SENTENCESRULE_50:=result;
END;
                                                      FUNCTION SENTENCESRULE_51
(VAR rec:SENTENCESRULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
V2FOUND AND ((V2SYNVPEFSVAR*
LSAUXDOM_VOOROBJVPS<>[]) OR (BENFACTPP IN V2ADJUNCTS))
THEN result:=TRUE;IF result THEN
BEGIN
END;
                                                      END;SENTENCESRULE_51:=result;
END;
                                                      FUNCTION SENTENCESRULE_52
(VAR rec:SENTENCESRULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
V2FOUND AND (V2SYNVPEFSVAR*(
LSAUXDOM_OBJVPS+[SYNZIJN])<>[]) AND ((V2SYNVPEFSVAR*
LSAUXDOM_INDOBJVPS=[])<=( NOT PREADVRELFOUND))        
THEN result:=TRUE;IF result THEN
BEGIN
OBJRELFOUND:=TRUE;
                                                      END;
                                                      END;SENTENCESRULE_52:=result;
END;
                                                      FUNCTION SENTENCESRULE_53
(VAR rec:SENTENCESRULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
( NOT PREPOBJ2FOUND) AND (
b^.ls^.PREPPfield^.RADVKEY=0) AND V2FOUND AND ((V2SYNVPEFSVAR*(
LSAUXDOM_AANOBJVPS+
LSAUXDOM_VOOROBJVPS+
LSAUXDOM_PREPOBJVPS)<>[]) OR ((
b^.ls^.PREPPfield^.HEADKEY=auxkey('VOORIOPREPKEY')) AND (BENFACTPP IN V2ADJUNCTS)))                       
THEN result:=TRUE;IF result THEN
BEGIN
PREPOBJRELFOUND:=TRUE;
                                                       IF (PREPOBJ1FOUND)
THEN
BEGIN
PREPOBJ2FOUND:=TRUE
END 
ELSE
BEGIN
PREPOBJ1FOUND:=TRUE
END ;
                                                       IF 
b^.ls^.PREPPfield^.STRANDED
THEN
STRANDEDPPFOUND:=TRUE;
                                                      END;
                                                      END;SENTENCESRULE_53:=result;
END;
                                                      FUNCTION SENTENCESRULE_54
(VAR rec:SENTENCESRULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
( NOT PREPREPOBJRELFOUND) AND (
b^.ls^.PREPPfield^.RADVKEY=0) AND V2FOUND AND ((V2SYNVPEFSVAR*
LSAUXDOM_DIRARGVPS<>[]) OR (DIRADJUNCT IN V2ADJUNCTS))
THEN result:=TRUE;IF result THEN
BEGIN
DIRARGRELFOUND:=TRUE;
                                                       IF 
b^.ls^.PREPPfield^.STRANDED
THEN
STRANDEDPPFOUND:=TRUE;
                                                      END;
                                                      END;SENTENCESRULE_54:=result;
END;
                                                      FUNCTION SENTENCESRULE_55
(VAR rec:SENTENCESRULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
( NOT PREPREPOBJRELFOUND) AND V2FOUND AND ((V2SYNVPEFSVAR*
LSAUXDOM_DIRARGVPS<>[]) OR (DIRADJUNCT IN V2ADJUNCTS))
THEN result:=TRUE;IF result THEN
BEGIN
DIRARGRELFOUND:=TRUE;
                                                      END;
                                                      END;SENTENCESRULE_55:=result;
END;
                                                      FUNCTION SENTENCESRULE_56
(VAR rec:SENTENCESRULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
( NOT PREPREPOBJRELFOUND) AND (
b^.ls^.PREPPfield^.RADVKEY=0) AND V2FOUND AND ((V2SYNVPEFSVAR*
LSAUXDOM_LOCARGVPS<>[]) OR (LOCADJUNCT IN V2ADJUNCTS))
THEN result:=TRUE;IF result THEN
BEGIN
LOCARGRELFOUND:=TRUE;
                                                       IF 
b^.ls^.PREPPfield^.STRANDED
THEN
STRANDEDPPFOUND:=TRUE;
                                                      END;
                                                      END;SENTENCESRULE_56:=result;
END;
                                                      FUNCTION SENTENCESRULE_57
(VAR rec:SENTENCESRULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
( NOT PREPREPOBJRELFOUND) AND V2FOUND AND ((V2SYNVPEFSVAR*
LSAUXDOM_LOCARGVPS<>[]) OR (LOCADJUNCT IN V2ADJUNCTS))
THEN result:=TRUE;IF result THEN
BEGIN
LOCARGRELFOUND:=TRUE;
                                                      END;
                                                      END;SENTENCESRULE_57:=result;
END;
                                                      FUNCTION SENTENCESRULE_58
(VAR rec:SENTENCESRULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
( NOT PREPREPOBJRELFOUND) AND (
b^.ls^.PREPPfield^.RADVKEY=0) AND V2FOUND AND ((V2SYNVPEFSVAR*
LSAUXDOM_PREPPPREDVPS<>[]) OR (RESPP IN V2ADJUNCTS))  
THEN result:=TRUE;IF result THEN
BEGIN
PREPPPREDRELFOUND:=TRUE;
                                                      END;
                                                      END;SENTENCESRULE_58:=result;
END;
                                                      FUNCTION SENTENCESRULE_59
(VAR rec:SENTENCESRULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
( NOT PREPREPOBJRELFOUND) AND V2FOUND AND (V2SYNVPEFSVAR*
LSAUXDOM_PREPPPREDVPS<>[])                            
THEN result:=TRUE;IF result THEN
BEGIN
ADVPPREDRELFOUND:=TRUE;
                                                      END;
                                                      END;SENTENCESRULE_59:=result;
END;
                                                      FUNCTION SENTENCESRULE_60
(VAR rec:SENTENCESRULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
( NOT PREPREPOBJRELFOUND) AND V2FOUND AND ((V2SYNVPEFSVAR*
LSAUXDOM_NPPREDVPS<>[]) OR (RESPP IN V2ADJUNCTS))     
THEN result:=TRUE;IF result THEN
BEGIN
NPPREDRELFOUND:=TRUE;
                                                      END;
                                                      END;SENTENCESRULE_60:=result;
END;
                                                      FUNCTION SENTENCESRULE_61
(VAR rec:SENTENCESRULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
( NOT PREPREPOBJRELFOUND) AND (V2FOUND<=((V2SYNVPEFSVAR*
LSAUXDOM_ADJPPREDVPS<>[]) OR (RESAP IN V2ADJUNCTS))) AND (( NOT V2FOUND)<=(ATTRIBUTIVE IN 
b^.ls^.ADJPfield^.ACTUSEEFS))                         
THEN result:=TRUE;IF result THEN
BEGIN
ADJPPREDRELFOUND:=TRUE;
                                                      END;
                                                      END;SENTENCESRULE_61:=result;
END;
                                                      FUNCTION SENTENCESRULE_62
(VAR rec:SENTENCESRULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
ADVPREPFOUND:=TRUE;
                                                      END;
                                                      END;SENTENCESRULE_62:=result;
END;
                                                      FUNCTION SENTENCESRULE_63
(VAR rec:SENTENCESRULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
( NOT PREPOBJ2FOUND) AND ( NOT STRANDEDPPFOUND) AND ( NOT PREPREPOBJRELFOUND) AND V2FOUND                   
THEN result:=TRUE;IF result THEN
BEGIN
STRANDEDRELFOUND:=TRUE;
                                                       IF (PREPOBJ1FOUND)
THEN
BEGIN
PREPOBJ2FOUND:=TRUE
END 
ELSE
BEGIN
PREPOBJ1FOUND:=TRUE
END ;
                                                      END;
                                                      END;SENTENCESRULE_63:=result;
END;
                                                      FUNCTION SENTENCESRULE_64
(VAR rec:SENTENCESRULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
( NOT STRANDEDPPFOUND) AND V2FOUND                    
THEN result:=TRUE;IF result THEN
BEGIN
STRANDEDRELFOUND:=TRUE;
                                                      END;
                                                      END;SENTENCESRULE_64:=result;
END;
                                                      FUNCTION SENTENCESRULE_65
(VAR rec:SENTENCESRULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
V2FOUND AND (EXPPARTICLE=
b^.ls^.PARTfield^.KEY)                                
THEN result:=TRUE;IF result THEN
BEGIN
PARTICLEKEY:=
b^.ls^.PARTfield^.KEY;
                                                      END;
                                                      END;SENTENCESRULE_65:=result;
END;
                                                      FUNCTION SENTENCESRULE_66
(VAR rec:SENTENCESRULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
( NOT PREPOBJ2FOUND) AND V2FOUND                      
THEN result:=TRUE;IF result THEN
BEGIN
PREPREPOBJRELFOUND:=TRUE;
                                                       IF (PREPOBJ1FOUND)
THEN
BEGIN
PREPOBJ2FOUND:=TRUE
END 
ELSE
BEGIN
PREPOBJ1FOUND:=TRUE
END ;
                                                      END;
                                                      END;SENTENCESRULE_66:=result;
END;
                                                      FUNCTION SENTENCESRULE_67
(VAR rec:SENTENCESRULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
( NOT PREPOBJ2FOUND) AND POSTVPOOK(ADJPPREDRELFOUND,ADVPPREDRELFOUND,NPPREDRELFOUND,PREPPPREDRELFOUND,
STRANDEDRELFOUND,PREPOBJRELFOUND,LOCARGRELFOUND,DIRARGRELFOUND,PARTICLEKEY) AND V2FOUND AND ((V2SYNVPEFSVAR*(
LSAUXDOM_PREPOBJVPS+
LSAUXDOM_AANOBJVPS+
LSAUXDOM_VOOROBJVPS)<>[]) OR (BENFACTPP IN V2ADJUNCTS))                                                     
THEN result:=TRUE;IF result THEN
BEGIN
POSTVPORELFOUND:=TRUE;
                                                       IF (PREPOBJ1FOUND)
THEN
BEGIN
PREPOBJ2FOUND:=TRUE
END 
ELSE
BEGIN
PREPOBJ1FOUND:=TRUE
END ;
                                                      END;
                                                      END;SENTENCESRULE_67:=result;
END;
                                                      FUNCTION SENTENCESRULE_68
(VAR rec:SENTENCESRULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
POSTVOK(ADJPPREDRELFOUND,ADVPPREDRELFOUND,NPPREDRELFOUND,PREPPPREDRELFOUND,STRANDEDRELFOUND,
PREPOBJRELFOUND,LOCARGRELFOUND,DIRARGRELFOUND,OBJRELFOUND,INDOBJRELFOUND,PARTICLEKEY) AND V2FOUND   
THEN result:=TRUE;IF result THEN
BEGIN
POSTVRELFOUND:=TRUE;
                                                      END;
                                                      END;SENTENCESRULE_68:=result;
END;
                                                      FUNCTION SENTENCESRULE_69
(VAR rec:SENTENCESRULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
V2FOUND                                               
THEN result:=TRUE;IF result THEN
BEGIN
END;
                                                      END;SENTENCESRULE_69:=result;
END;
                                                      FUNCTION SENTENCESRULE_70
(VAR rec:SENTENCESRULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
V2FOUND                                               
THEN result:=TRUE;IF result THEN
BEGIN
END;
                                                      END;SENTENCESRULE_70:=result;
END;
                                                      FUNCTION SENTENCESRULE_71
(VAR rec:SENTENCESRULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
ADVPREPFOUND:=TRUE;
                                                      END;
                                                      END;SENTENCESRULE_71:=result;
END;
                                                      FUNCTION SENTENCESRULE_72
(VAR rec:SENTENCESRULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
V2FOUND                                               
THEN result:=TRUE;IF result THEN
BEGIN
END;
                                                      END;SENTENCESRULE_72:=result;
END;
                                                      FUNCTION SENTENCESRULE_73
(VAR rec:SENTENCESRULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
( NOT PREPREPOBJRELFOUND) AND V2FOUND AND ((V2SYNVPEFSVAR*
LSAUXDOM_DIRARGVPS<>[]) OR (DIRADJUNCT IN V2ADJUNCTS))
THEN result:=TRUE;IF result THEN
BEGIN
DIRARGRELFOUND:=TRUE;
                                                      DIRARGNPFOUND:=TRUE;
                                                      END;
                                                      END;SENTENCESRULE_73:=result;
END;
                                                      FUNCTION SENTENCESRULE_74
(VAR rec:SENTENCESRULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
( NOT DIRARGRELFOUND) OR (DIRARGNPFOUND) AND V2FOUND AND (V2SYNVPEFSVAR*
LSAUXDOM_DIRARGVPS<>[])                               
THEN result:=TRUE;IF result THEN
BEGIN
END;
                                                      END;SENTENCESRULE_74:=result;
END;
                                                      FUNCTION SENTENCESRULE_75
(VAR rec:SENTENCESRULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
END;
                                                      END;SENTENCESRULE_75:=result;
END;
                                                      FUNCTION SENTENCESRULE_76
(VAR rec:SENTENCESRULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
END;
                                                      END;SENTENCESRULE_76:=result;
END;
                                                      FUNCTION SENTENCESRULE_77
(VAR rec:SENTENCESRULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
( NOT PREPREPOBJRELFOUND) AND V2FOUND AND (V2SYNVPEFSVAR*
LSAUXDOM_VPCOMPLVPS<>[])                              
THEN result:=TRUE;IF result THEN
BEGIN
END;
                                                      END;SENTENCESRULE_77:=result;
END;
                                                      FUNCTION SENTENCESRULE_78
(VAR rec:SENTENCESRULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
V2FOUND AND (V2SYNVPEFSVAR*
LSAUXDOM_SOPROSENTVPS<>[])                            
THEN result:=TRUE;IF result THEN
BEGIN
END;
                                                      END;SENTENCESRULE_78:=result;
END;
                                                      FUNCTION SENTENCESRULE_79
(VAR rec:SENTENCESRULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
END;
                                                      END;SENTENCESRULE_79:=result;
END;
                                                       FUNCTION comp_SENTENCESRULE(rec1,rec2:SENTENCESRULEtyp):BOOLEAN;
BEGIN WITH rec1^ DO comp_SENTENCESRULE:=
(ADJPPREDRELFOUND=rec2^.ADJPPREDRELFOUND) AND
(ADVLDLFOUND=rec2^.ADVLDLFOUND) AND
(ADVPPREDRELFOUND=rec2^.ADVPPREDRELFOUND) AND
(ADVPREPFOUND=rec2^.ADVPREPFOUND) AND
(CONJRELFOUND=rec2^.CONJRELFOUND) AND
(CONJSENTINM1FOUND=rec2^.CONJSENTINM1FOUND) AND
(DEFRADVRELFOUND=rec2^.DEFRADVRELFOUND) AND
(DIRARGNPFOUND=rec2^.DIRARGNPFOUND) AND
(DIRARGRELFOUND=rec2^.DIRARGRELFOUND) AND
(ERINERPOSRELFOUND=rec2^.ERINERPOSRELFOUND) AND
(ERINSHIFTFOUND=rec2^.ERINSHIFTFOUND) AND
(ERPOSRELFOUND=rec2^.ERPOSRELFOUND) AND
(ERQRELFOUND=rec2^.ERQRELFOUND) AND
(EXPPARTICLE=rec2^.EXPPARTICLE) AND
(HETCLRELFOUND=rec2^.HETCLRELFOUND) AND
(HIERDAARINRPOSFOUND=rec2^.HIERDAARINRPOSFOUND) AND
(INDOBJRELFOUND=rec2^.INDOBJRELFOUND) AND
(FIRSTCLRELFOUND=rec2^.FIRSTCLRELFOUND) AND
(LEFTDISLOCRELFOUND=rec2^.LEFTDISLOCRELFOUND) AND
(LOCARGRELFOUND=rec2^.LOCARGRELFOUND) AND
(NEGORPOSFOUND=rec2^.NEGORPOSFOUND) AND
(NPPREDRELFOUND=rec2^.NPPREDRELFOUND) AND
(OBJRELFOUND=rec2^.OBJRELFOUND) AND
(PARTICLEKEY=rec2^.PARTICLEKEY) AND
(POSTSUBJRELFOUND=rec2^.POSTSUBJRELFOUND) AND
(POSTVPORELFOUND=rec2^.POSTVPORELFOUND) AND
(POSTVRELFOUND=rec2^.POSTVRELFOUND) AND
(PREADVREL2FOUND=rec2^.PREADVREL2FOUND) AND
(PREADVRELFOUND=rec2^.PREADVRELFOUND) AND
(PREPOBJRELFOUND=rec2^.PREPOBJRELFOUND) AND
(PREPOBJ1FOUND=rec2^.PREPOBJ1FOUND) AND
(PREPOBJ2FOUND=rec2^.PREPOBJ2FOUND) AND
(PREPREPOBJRELFOUND=rec2^.PREPREPOBJRELFOUND) AND
(PREPPPREDRELFOUND=rec2^.PREPPPREDRELFOUND) AND
(REFLRELFOUND=rec2^.REFLRELFOUND) AND
(RESULTPUNCRELFOUND=rec2^.RESULTPUNCRELFOUND) AND
(SHIFTRELFOUND=rec2^.SHIFTRELFOUND) AND
(STADVFOUND=rec2^.STADVFOUND) AND
(STRANDEDPPFOUND=rec2^.STRANDEDPPFOUND) AND
(STRANDEDRELFOUND=rec2^.STRANDEDRELFOUND) AND
(SUBJRELFOUND=rec2^.SUBJRELFOUND) AND
(V2ADJUNCTS=rec2^.V2ADJUNCTS) AND
(V2FOUND=rec2^.V2FOUND) AND
(V2SUBCVAR=rec2^.V2SUBCVAR) AND
(V2SYNVPEFSVAR=rec2^.V2SYNVPEFSVAR) AND
(VERBPFOUND=rec2^.VERBPFOUND)
END;
