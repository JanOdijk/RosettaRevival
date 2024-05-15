PROCEDURE DATUMNP_0(VAR rec:DATUMNPtyp);
BEGIN WITH rec^ DO BEGIN
                                                      END;END;
                                                      FUNCTION DATUMNP_1
(VAR rec:DATUMNPtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
END;
                                                      END;DATUMNP_1:=result;
END;
                                                      FUNCTION DATUMNP_2
(VAR rec:DATUMNPtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
END;
                                                      END;DATUMNP_2:=result;
END;
                                                      FUNCTION DATUMNP_3
(VAR rec:DATUMNPtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
END;
                                                      END;DATUMNP_3:=result;
END;
                                                      FUNCTION DATUMNP_4
(VAR rec:DATUMNPtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
END;
                                                      END;DATUMNP_4:=result;
END;
                                                      FUNCTION DATUMNP_5
(VAR rec:DATUMNPtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
END;
                                                      END;DATUMNP_5:=result;
END;
                                                      FUNCTION DATUMNP_6
(VAR rec:DATUMNPtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
END;
                                                      END;DATUMNP_6:=result;
END;
                                                      FUNCTION DATUMNP_7
(VAR rec:DATUMNPtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
END;
                                                      END;DATUMNP_7:=result;
END;
                                                      FUNCTION DATUMNP_8
(VAR rec:DATUMNPtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
END;
                                                      END;DATUMNP_8:=result;
END;
                                                       FUNCTION comp_DATUMNP(rec1,rec2:DATUMNPtyp):BOOLEAN;
BEGIN WITH rec1^ DO comp_DATUMNP:=
TRUE
END;
PROCEDURE NPCARDRULE_0(VAR rec:NPCARDRULEtyp);
BEGIN WITH rec^ DO BEGIN
                                                      END;END;
                                                      FUNCTION NPCARDRULE_1
(VAR rec:NPCARDRULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
END;
                                                      END;NPCARDRULE_1:=result;
END;
                                                       FUNCTION comp_NPCARDRULE(rec1,rec2:NPCARDRULEtyp):BOOLEAN;
BEGIN WITH rec1^ DO comp_NPCARDRULE:=
TRUE
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
PROCEDURE ADJP2SRULE_0(VAR rec:ADJP2SRULEtyp);
BEGIN WITH rec^ DO BEGIN
AANPREPPFOUND:=FALSE;
ALSCOMPLADVFOUND:=FALSE;
COMPARATIVEEXPECTED:=FALSE;
COMPARATIVECOMPLEXPECTED:=FALSE;
THANPPOSSIBLE:=FALSE;
VANCOMPLPOSSIBLE:=FALSE;
DEGREECOMPLFOUND:=FALSE;
DEGREEMODEXPECTED:=FALSE;
DEGREEMODFOUND:=FALSE;
DONPFOUND:=FALSE;
HEADEXPECTED:=FALSE;
HOPFOUND:=FALSE;
IONPFOUND:=FALSE;
OMCOMPLEXPECTED:=FALSE;
NEGORPOSFOUND:=FALSE;
ERPOSPAOBJFOUND:=FALSE;
PAOBJFOUND:=FALSE;
VOOROBJMODFOUND:=FALSE;
PREPOBJEXPECTED:=TRUE;
PREPOBJFOUND:=FALSE;
PREPOBJEXPECTED:=TRUE;
REFLRELFOUND:=FALSE;
STADVFOUND:=FALSE;
ACTSUBCEFSVAR:=[OTHERADJ];
PREPKEYVAR:=0;
                                                      END;END;
                                                      FUNCTION ADJP2SRULE_1
(VAR rec:ADJP2SRULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
( NOT STADVFOUND) AND ( NOT REFLRELFOUND)             
THEN result:=TRUE;IF result THEN
BEGIN
REFLRELFOUND:=TRUE;
                                                      END;
                                                      END;ADJP2SRULE_1:=result;
END;
                                                      FUNCTION ADJP2SRULE_2
(VAR rec:ADJP2SRULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
 NOT IONPFOUND                                        
THEN result:=TRUE;IF result THEN
BEGIN
IONPFOUND:=TRUE;
                                                      END;
                                                      END;ADJP2SRULE_2:=result;
END;
                                                      FUNCTION ADJP2SRULE_3
(VAR rec:ADJP2SRULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
( NOT HEADEXPECTED)                                   
THEN result:=TRUE;IF result THEN
BEGIN
ERPOSPAOBJFOUND:=TRUE;
                                                      END;
                                                      END;ADJP2SRULE_3:=result;
END;
                                                      FUNCTION ADJP2SRULE_22
(VAR rec:ADJP2SRULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
( NOT HEADEXPECTED)                                   
THEN result:=TRUE;IF result THEN
BEGIN
VOOROBJMODFOUND:=TRUE;
                                                      END;
                                                      END;ADJP2SRULE_22:=result;
END;
                                                      FUNCTION ADJP2SRULE_4
(VAR rec:ADJP2SRULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
( NOT AANPREPPFOUND) AND ( NOT HEADEXPECTED)          
THEN result:=TRUE;IF result THEN
BEGIN
AANPREPPFOUND:=TRUE;
                                                      DEGREEMODEXPECTED:=TRUE;
                                                      END;
                                                      END;ADJP2SRULE_4:=result;
END;
                                                      FUNCTION ADJP2SRULE_5
(VAR rec:ADJP2SRULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
( NOT PREPOBJFOUND) AND ( NOT HEADEXPECTED)           
THEN result:=TRUE;IF result THEN
BEGIN
PREPOBJFOUND:=TRUE;
                                                      DEGREEMODEXPECTED:=TRUE;
                                                      END;
                                                      END;ADJP2SRULE_5:=result;
END;
                                                      FUNCTION ADJP2SRULE_6
(VAR rec:ADJP2SRULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
( NOT DONPFOUND) AND ( NOT HEADEXPECTED)              
THEN result:=TRUE;IF result THEN
BEGIN
DONPFOUND:=TRUE;
                                                      END;
                                                      END;ADJP2SRULE_6:=result;
END;
                                                      FUNCTION ADJP2SRULE_7
(VAR rec:ADJP2SRULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
( NOT DEGREEMODFOUND) AND ( NOT HEADEXPECTED)         
THEN result:=TRUE;IF result THEN
BEGIN
DEGREEMODFOUND:=TRUE;
                                                       IF 
b^.ls^.QPfield^.THANAS=OMCOMPL
THEN
OMCOMPLEXPECTED:=TRUE;
                                                       IF 
b^.ls^.QPfield^.THANAS=OMEGACOMPL
THEN
COMPARATIVEEXPECTED:=TRUE;
                                                       IF 
b^.ls^.QPfield^.THANAS IN [ALSCOMPL,DANCOMPL]
THEN
BEGIN
THANPPOSSIBLE:=TRUE;
                                                      HEADEXPECTED:=TRUE
END ;
                                                       IF 
b^.ls^.QPfield^.THANAS IN [VANCOMPL]
THEN
BEGIN
VANCOMPLPOSSIBLE:=TRUE;
                                                      HEADEXPECTED:=TRUE
END ;
                                                      END;
                                                      END;ADJP2SRULE_7:=result;
END;
                                                      FUNCTION ADJP2SRULE_77
(VAR rec:ADJP2SRULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
( NOT DEGREEMODFOUND) AND ( NOT HEADEXPECTED)         
THEN result:=TRUE;IF result THEN
BEGIN
DEGREEMODFOUND:=TRUE;
                                                       IF 
b^.ls^.QPfield^.THANAS IN [VANCOMPL]
THEN
BEGIN
VANCOMPLPOSSIBLE:=TRUE;
                                                      HEADEXPECTED:=TRUE
END ;
                                                      END;
                                                      END;ADJP2SRULE_77:=result;
END;
                                                      FUNCTION ADJP2SRULE_8
(VAR rec:ADJP2SRULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
( NOT DEGREEMODFOUND) AND ( NOT HEADEXPECTED)         
THEN result:=TRUE;IF result THEN
BEGIN
DEGREEMODFOUND:=TRUE;
                                                       IF 
b^.ls^.ADVPfield^.THANAS=ALSCOMPL
THEN
ALSCOMPLADVFOUND:=TRUE;
                                                       IF 
b^.ls^.ADVPfield^.THANAS=ALSCOMPL
THEN
THANPPOSSIBLE:=TRUE;
                                                       IF 
b^.ls^.ADVPfield^.THANAS=DATCOMPL
THEN
COMPARATIVECOMPLEXPECTED:=TRUE;
                                                       IF 
b^.ls^.ADVPfield^.THANAS=OMCOMPL
THEN
OMCOMPLEXPECTED:=TRUE;
                                                      END;
                                                      END;ADJP2SRULE_8:=result;
END;
                                                      FUNCTION ADJP2SRULE_88
(VAR rec:ADJP2SRULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
( NOT DEGREEMODFOUND) AND ( NOT HEADEXPECTED)         
THEN result:=TRUE;IF result THEN
BEGIN
END;
                                                      END;ADJP2SRULE_88:=result;
END;
                                                      FUNCTION ADJP2SRULE_9
(VAR rec:ADJP2SRULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
( NOT DEGREEMODFOUND) AND ( NOT HEADEXPECTED)         
THEN result:=TRUE;IF result THEN
BEGIN
DEGREEMODFOUND:=TRUE
END                                                   
                                                      END;ADJP2SRULE_9:=result;
END;
                                                      FUNCTION ADJP2SRULE_25
(VAR rec:ADJP2SRULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
( NOT DEGREEMODFOUND) AND ( NOT HEADEXPECTED)         
THEN result:=TRUE;IF result THEN
BEGIN
COMPARATIVEEXPECTED:=TRUE;
                                                      END;
                                                      END;ADJP2SRULE_25:=result;
END;
                                                      FUNCTION ADJP2SRULE_10
(VAR rec:ADJP2SRULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
( NOT AANPREPPFOUND) AND ( NOT HEADEXPECTED)          
THEN result:=TRUE;IF result THEN
BEGIN
AANPREPPFOUND:=TRUE;
                                                       IF 
b^.ls^.PREPPfield^.STRANDED
THEN
HEADEXPECTED:=TRUE;
                                                      END;
                                                      END;ADJP2SRULE_10:=result;
END;
                                                      FUNCTION ADJP2SRULE_11
(VAR rec:ADJP2SRULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
( NOT PREPOBJFOUND) AND ( NOT HEADEXPECTED)           
THEN result:=TRUE;IF result THEN
BEGIN
PREPOBJFOUND:=TRUE;
                                                       IF 
b^.ls^.PREPPfield^.STRANDED
THEN
HEADEXPECTED:=TRUE;
                                                      END;
                                                      END;ADJP2SRULE_11:=result;
END;
                                                      FUNCTION ADJP2SRULE_12
(VAR rec:ADJP2SRULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
( NOT DEGREEMODFOUND)                                 
THEN result:=TRUE;IF result THEN
BEGIN
END;
                                                      END;ADJP2SRULE_12:=result;
END;
                                                      FUNCTION ADJP2SRULE_13
(VAR rec:ADJP2SRULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
(ERPOSPAOBJFOUND<=(
b^.ls^.ADJfield^.ADJPATTERNS*
LSAUXDOM_PAADJPS<>[])) AND (PREPOBJFOUND<=(
b^.ls^.ADJfield^.ADJPATTERNS*
LSAUXDOM_PREPOBJADJPS<>[])) AND (AANPREPPFOUND<=(
b^.ls^.ADJfield^.ADJPATTERNS*
LSAUXDOM_AANOBJADJPS<>[])) AND (VOOROBJMODFOUND<=(
b^.ls^.ADJfield^.SUBCS*[VOORSUBJECTIVEADJ]<>[])) AND (DEGREEMODEXPECTED<=DEGREEMODFOUND) AND ((
b^.ls^.ADJfield^.FORM=COMPARATIVE)<=( NOT DEGREEMODFOUND)) AND ((
b^.ls^.ADJfield^.FORM=SUPERLATIVE)<=( NOT DEGREEMODFOUND))                                      
THEN result:=TRUE;IF result THEN
BEGIN
 IF 
b^.ls^.ADJfield^.PREPKEY=0
THEN
PREPOBJEXPECTED:=FALSE;
                                                       IF 
b^.ls^.ADJfield^.FORM=COMPARATIVE
THEN
BEGIN
THANPPOSSIBLE:=TRUE;
                                                      DEGREEMODFOUND:=TRUE
END ;
                                                       IF 
b^.ls^.ADJfield^.FORM=SUPERLATIVE
THEN
BEGIN
VANCOMPLPOSSIBLE:=TRUE;
                                                      DEGREEMODFOUND:=TRUE
END ;
                                                      ACTSUBCEFSVAR:=
b^.ls^.ADJfield^.SUBCS;
                                                      PREPKEYVAR:=
b^.ls^.ADJfield^.PREPKEY;
                                                      END;
                                                      END;ADJP2SRULE_13:=result;
END;
                                                      FUNCTION ADJP2SRULE_14
(VAR rec:ADJP2SRULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
 NOT DEGREEMODFOUND                                   
THEN result:=TRUE;IF result THEN
BEGIN
DEGREEMODFOUND:=TRUE;
                                                      HOPFOUND:=TRUE;
                                                      END;
                                                      END;ADJP2SRULE_14:=result;
END;
                                                      FUNCTION ADJP2SRULE_21
(VAR rec:ADJP2SRULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
ALSCOMPLADVFOUND                                      
THEN result:=TRUE;IF result THEN
BEGIN
DEGREECOMPLFOUND:=TRUE;
                                                      END;
                                                      END;ADJP2SRULE_21:=result;
END;
                                                      FUNCTION ADJP2SRULE_15
(VAR rec:ADJP2SRULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
( NOT PREPOBJFOUND) AND ( NOT AANPREPPFOUND) AND ( NOT ERPOSPAOBJFOUND) AND ( NOT PAOBJFOUND) AND (PREPOBJEXPECTED) AND ((
b^.ls^.PREPPfield^.HEADKEY=PREPKEYVAR) OR (
b^.ls^.PREPPfield^.HEADKEY=auxkey('AANIOPREPKEY')))   
THEN result:=TRUE;IF result THEN
BEGIN
PAOBJFOUND:=TRUE;
                                                      END;
                                                      END;ADJP2SRULE_15:=result;
END;
                                                      FUNCTION ADJP2SRULE_23
(VAR rec:ADJP2SRULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
ACTSUBCEFSVAR*[VOORSUBJECTIVEADJ]<>[]                 
THEN result:=TRUE;IF result THEN
BEGIN
END;
                                                      END;ADJP2SRULE_23:=result;
END;
                                                      FUNCTION ADJP2SRULE_24
(VAR rec:ADJP2SRULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
END;
                                                      END;ADJP2SRULE_24:=result;
END;
                                                      FUNCTION ADJP2SRULE_27
(VAR rec:ADJP2SRULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
VANCOMPLPOSSIBLE=TRUE                                 
THEN result:=TRUE;IF result THEN
BEGIN
END;
                                                      END;ADJP2SRULE_27:=result;
END;
                                                      FUNCTION ADJP2SRULE_17
(VAR rec:ADJP2SRULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
(SUBJECTIVEADJ IN ACTSUBCEFSVAR) AND ( NOT PROOBJSENTFOUND) AND ( NOT HOPFOUND)                  
THEN result:=TRUE;IF result THEN
BEGIN
PROOBJSENTFOUND:=TRUE;
                                                      END;
                                                      END;ADJP2SRULE_17:=result;
END;
                                                      FUNCTION ADJP2SRULE_18
(VAR rec:ADJP2SRULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
(THANPPOSSIBLE) AND ( NOT DEGREECOMPLFOUND)           
THEN result:=TRUE;IF result THEN
BEGIN
DEGREECOMPLFOUND:=TRUE
END                                                   
                                                      END;ADJP2SRULE_18:=result;
END;
                                                      FUNCTION ADJP2SRULE_19
(VAR rec:ADJP2SRULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
END;
                                                      END;ADJP2SRULE_19:=result;
END;
                                                      FUNCTION ADJP2SRULE_20
(VAR rec:ADJP2SRULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
(DEGREEMODFOUND) AND ( NOT DEGREECOMPLFOUND) AND (COMPARATIVECOMPLEXPECTED)                             
THEN result:=TRUE;IF result THEN
BEGIN
DEGREECOMPLFOUND:=TRUE;
                                                      END;
                                                      END;ADJP2SRULE_20:=result;
END;
                                                      FUNCTION ADJP2SRULE_26
(VAR rec:ADJP2SRULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
 NOT DEGREECOMPLFOUND AND (HOPFOUND OR OMCOMPLEXPECTED)                                                     
THEN result:=TRUE;IF result THEN
BEGIN
DEGREECOMPLFOUND:=TRUE
END                                                   
                                                      END;ADJP2SRULE_26:=result;
END;
                                                      FUNCTION ADJP2SRULE_31
(VAR rec:ADJP2SRULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
( NOT NEGORPOSFOUND)                                  
THEN result:=TRUE;IF result THEN
BEGIN
NEGORPOSFOUND:=TRUE;
                                                      END;
                                                      END;ADJP2SRULE_31:=result;
END;
                                                      FUNCTION ADJP2SRULE_32
(VAR rec:ADJP2SRULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
( NOT NEGORPOSFOUND)                                  
THEN result:=TRUE;IF result THEN
BEGIN
NEGORPOSFOUND:=TRUE;
                                                      END;
                                                      END;ADJP2SRULE_32:=result;
END;
                                                      FUNCTION ADJP2SRULE_33
(VAR rec:ADJP2SRULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
STADVFOUND:=TRUE
END                                                   
                                                      END;ADJP2SRULE_33:=result;
END;
                                                      FUNCTION ADJP2SRULE_34
(VAR rec:ADJP2SRULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
STADVFOUND:=TRUE
END                                                   
                                                      END;ADJP2SRULE_34:=result;
END;
                                                      FUNCTION ADJP2SRULE_35
(VAR rec:ADJP2SRULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
STADVFOUND:=TRUE
END                                                   
                                                      END;ADJP2SRULE_35:=result;
END;
                                                      FUNCTION ADJP2SRULE_36
(VAR rec:ADJP2SRULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
STADVFOUND:=TRUE
END                                                   
                                                      END;ADJP2SRULE_36:=result;
END;
                                                      FUNCTION ADJP2SRULE_37
(VAR rec:ADJP2SRULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
STADVFOUND:=TRUE
END                                                   
                                                      END;ADJP2SRULE_37:=result;
END;
                                                      FUNCTION ADJP2SRULE_38
(VAR rec:ADJP2SRULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
END;
                                                      END;ADJP2SRULE_38:=result;
END;
                                                      FUNCTION ADJP2SRULE_39
(VAR rec:ADJP2SRULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
END;
                                                      END;ADJP2SRULE_39:=result;
END;
                                                      FUNCTION ADJP2SRULE_40
(VAR rec:ADJP2SRULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
END;
                                                      END;ADJP2SRULE_40:=result;
END;
                                                      FUNCTION ADJP2SRULE_41
(VAR rec:ADJP2SRULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
STADVFOUND:=TRUE;
                                                      END;
                                                      END;ADJP2SRULE_41:=result;
END;
                                                       FUNCTION comp_ADJP2SRULE(rec1,rec2:ADJP2SRULEtyp):BOOLEAN;
BEGIN WITH rec1^ DO comp_ADJP2SRULE:=
(AANPREPPFOUND=rec2^.AANPREPPFOUND) AND
(COMPARATIVEEXPECTED=rec2^.COMPARATIVEEXPECTED) AND
(COMPARATIVECOMPLEXPECTED=rec2^.COMPARATIVECOMPLEXPECTED) AND
(VANCOMPLPOSSIBLE=rec2^.VANCOMPLPOSSIBLE) AND
(THANPPOSSIBLE=rec2^.THANPPOSSIBLE) AND
(DEGREECOMPLFOUND=rec2^.DEGREECOMPLFOUND) AND
(DEGREEMODEXPECTED=rec2^.DEGREEMODEXPECTED) AND
(DEGREEMODFOUND=rec2^.DEGREEMODFOUND) AND
(DONPFOUND=rec2^.DONPFOUND) AND
(HEADEXPECTED=rec2^.HEADEXPECTED) AND
(ALSCOMPLADVFOUND=rec2^.ALSCOMPLADVFOUND) AND
(IONPFOUND=rec2^.IONPFOUND) AND
(NEGORPOSFOUND=rec2^.NEGORPOSFOUND) AND
(OMCOMPLEXPECTED=rec2^.OMCOMPLEXPECTED) AND
(PAOBJFOUND=rec2^.PAOBJFOUND) AND
(ERPOSPAOBJFOUND=rec2^.ERPOSPAOBJFOUND) AND
(PREPOBJEXPECTED=rec2^.PREPOBJEXPECTED) AND
(PREPOBJFOUND=rec2^.PREPOBJFOUND) AND
(HOPFOUND=rec2^.HOPFOUND) AND
(PROOBJSENTFOUND=rec2^.PROOBJSENTFOUND) AND
(REFLRELFOUND=rec2^.REFLRELFOUND) AND
(STADVFOUND=rec2^.STADVFOUND) AND
(VOOROBJMODFOUND=rec2^.VOOROBJMODFOUND) AND
(ACTSUBCEFSVAR=rec2^.ACTSUBCEFSVAR) AND
(PREPKEYVAR=rec2^.PREPKEYVAR)
END;
PROCEDURE THANASPSRULE_0(VAR rec:THANASPSRULEtyp);
BEGIN WITH rec^ DO BEGIN
                                                      END;END;
                                                      FUNCTION THANASPSRULE_1
(VAR rec:THANASPSRULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
END;
                                                      END;THANASPSRULE_1:=result;
END;
                                                      FUNCTION THANASPSRULE_2
(VAR rec:THANASPSRULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
END;
                                                      END;THANASPSRULE_2:=result;
END;
                                                      FUNCTION THANASPSRULE_3
(VAR rec:THANASPSRULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
END;
                                                      END;THANASPSRULE_3:=result;
END;
                                                      FUNCTION THANASPSRULE_4
(VAR rec:THANASPSRULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
END;
                                                      END;THANASPSRULE_4:=result;
END;
                                                      FUNCTION THANASPSRULE_5
(VAR rec:THANASPSRULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
END;
                                                      END;THANASPSRULE_5:=result;
END;
                                                      FUNCTION THANASPSRULE_6
(VAR rec:THANASPSRULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
END;
                                                      END;THANASPSRULE_6:=result;
END;
                                                       FUNCTION comp_THANASPSRULE(rec1,rec2:THANASPSRULEtyp):BOOLEAN;
BEGIN WITH rec1^ DO comp_THANASPSRULE:=
TRUE
END;
PROCEDURE QPSRULE_0(VAR rec:QPSRULEtyp);
BEGIN WITH rec^ DO BEGIN
COMPLFOUND:=FALSE;
                                                      END;END;
                                                      FUNCTION QPSRULE_1
(VAR rec:QPSRULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
END;
                                                      END;QPSRULE_1:=result;
END;
                                                      FUNCTION QPSRULE_2
(VAR rec:QPSRULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
END;
                                                      END;QPSRULE_2:=result;
END;
                                                      FUNCTION QPSRULE_3
(VAR rec:QPSRULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
END;
                                                      END;QPSRULE_3:=result;
END;
                                                      FUNCTION QPSRULE_4
(VAR rec:QPSRULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
END;
                                                      END;QPSRULE_4:=result;
END;
                                                      FUNCTION QPSRULE_5
(VAR rec:QPSRULEtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
 NOT COMPLFOUND                                       
THEN result:=TRUE;IF result THEN
BEGIN
COMPLFOUND:=TRUE;
                                                      END;
                                                      END;QPSRULE_5:=result;
END;
                                                       FUNCTION comp_QPSRULE(rec1,rec2:QPSRULEtyp):BOOLEAN;
BEGIN WITH rec1^ DO comp_QPSRULE:=
(COMPLFOUND=rec2^.COMPLFOUND)
END;
PROCEDURE PPCOORD_0(VAR rec:PPCOORDtyp);
BEGIN WITH rec^ DO BEGIN
ACTSUBCEFSVAR:=[];
ASPECTVAR:=OMEGAASPECT;
CLASSVAR:=OMEGATIMEADVCLASS;
CORR1FOUND:=FALSE;
EXPKEY:=0;
HEADKEYVAR:=0;
ITCOMMAFOUND:=FALSE;
ITCOORDFOUND:=FALSE;
ITERATIONFOUND:=FALSE;
ITERATIONOK:=TRUE;
MOODVAR:=DECLXPMOOD;
RETROVAR:=FALSE;
SPECQVAR:=OMEGASPEC;
                                                      END;END;
                                                      FUNCTION PPCOORD_1
(VAR rec:PPCOORDtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
CORR1FOUND:=TRUE;
                                                      EXPKEY:=
b^.ls^.COORDfield^.CORRELATIVE2KEY;
                                                      ITERATIONOK:=
b^.ls^.COORDfield^.ITERATION;
                                                      END;
                                                      END;PPCOORD_1:=result;
END;
                                                      FUNCTION PPCOORD_2
(VAR rec:PPCOORDtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
ITERATIONOK AND (ITERATIONFOUND<=((
b^.ls^.PREPPfield^.ACTSUBCEFS*ACTSUBCEFSVAR<>[]) AND (
b^.ls^.PREPPfield^.ASPECT=ASPECTVAR) AND (
b^.ls^.PREPPfield^.CLASS=CLASSVAR) AND (
b^.ls^.PREPPfield^.MOOD=MOODVAR) AND (
b^.ls^.PREPPfield^.RETRO=RETROVAR)))                  
THEN result:=TRUE;IF result THEN
BEGIN
 IF ITERATIONFOUND
THEN
BEGIN
ACTSUBCEFSVAR:=ACTSUBCEFSVAR*
b^.ls^.PREPPfield^.ACTSUBCEFS;
                                                      ASSQMAX(
b^.ls^.PREPPfield^.SPECQ,SPECQVAR);
                                                       IF HEADKEYVAR<>
b^.ls^.PREPPfield^.HEADKEY
THEN
HEADKEYVAR:=0
END 
ELSE
BEGIN
ACTSUBCEFSVAR:=
b^.ls^.PREPPfield^.ACTSUBCEFS;
                                                      ASPECTVAR:=
b^.ls^.PREPPfield^.ASPECT;
                                                      CLASSVAR:=
b^.ls^.PREPPfield^.CLASS;
                                                      MOODVAR:=
b^.ls^.PREPPfield^.MOOD;
                                                      RETROVAR:=
b^.ls^.PREPPfield^.RETRO;
                                                      SPECQVAR:=
b^.ls^.PREPPfield^.SPECQ;
                                                      HEADKEYVAR:=
b^.ls^.PREPPfield^.HEADKEY
END ;
                                                      ITERATIONFOUND:=TRUE;
                                                      END;
                                                      END;PPCOORD_2:=result;
END;
                                                      FUNCTION PPCOORD_3
(VAR rec:PPCOORDtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
((( NOT CORR1FOUND)<=((PPC IN 
b^.ls^.COORDfield^.PATTERNS) AND (SIMPLE IN 
b^.ls^.COORDfield^.KINDS))) AND (CORR1FOUND<=((
b^.ls^.COORDfield^.KEY=EXPKEY) AND (CORRELATIVE2 IN 
b^.ls^.COORDfield^.KINDS))) AND ( NOT ITCOMMAFOUND))  
THEN result:=TRUE;IF result THEN
BEGIN
 IF ( NOT CORR1FOUND)
THEN
EXPKEY:=
b^.ls^.COORDfield^.KEY;
                                                      ITCOORDFOUND:=TRUE;
                                                      END;
                                                      END;PPCOORD_3:=result;
END;
                                                      FUNCTION PPCOORD_4
(VAR rec:PPCOORDtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
( NOT ITCOORDFOUND)                                   
THEN result:=TRUE;IF result THEN
BEGIN
ITCOMMAFOUND:=TRUE;
                                                      END;
                                                      END;PPCOORD_4:=result;
END;
                                                      FUNCTION PPCOORD_5
(VAR rec:PPCOORDtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
(ITERATIONFOUND<=((
b^.ls^.PREPPfield^.ACTSUBCEFS*ACTSUBCEFSVAR<>[]) AND (
b^.ls^.PREPPfield^.ASPECT=ASPECTVAR) AND (
b^.ls^.PREPPfield^.CLASS=CLASSVAR) AND (
b^.ls^.PREPPfield^.MOOD=MOODVAR) AND (
b^.ls^.PREPPfield^.RETRO=RETROVAR)))                  
THEN result:=TRUE;IF result THEN
BEGIN
 IF ITERATIONFOUND
THEN
BEGIN
ACTSUBCEFSVAR:=ACTSUBCEFSVAR*
b^.ls^.PREPPfield^.ACTSUBCEFS;
                                                      ASSQMAX(
b^.ls^.PREPPfield^.SPECQ,SPECQVAR);
                                                       IF HEADKEYVAR<>
b^.ls^.PREPPfield^.HEADKEY
THEN
HEADKEYVAR:=0
END 
ELSE
BEGIN
ACTSUBCEFSVAR:=
b^.ls^.PREPPfield^.ACTSUBCEFS;
                                                      ASPECTVAR:=
b^.ls^.PREPPfield^.ASPECT;
                                                      CLASSVAR:=
b^.ls^.PREPPfield^.CLASS;
                                                      MOODVAR:=
b^.ls^.PREPPfield^.MOOD;
                                                      RETROVAR:=
b^.ls^.PREPPfield^.RETRO;
                                                      SPECQVAR:=
b^.ls^.PREPPfield^.SPECQ;
                                                      HEADKEYVAR:=
b^.ls^.PREPPfield^.HEADKEY
END ;
                                                      END;
                                                      END;PPCOORD_5:=result;
END;
                                                      FUNCTION PPCOORD_6
(VAR rec:PPCOORDtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
((( NOT CORR1FOUND)<=((PPC IN 
b^.ls^.COORDfield^.PATTERNS) AND (SIMPLE IN 
b^.ls^.COORDfield^.KINDS))) AND (CORR1FOUND<=((
b^.ls^.COORDfield^.KEY=EXPKEY) AND (CORRELATIVE2 IN 
b^.ls^.COORDfield^.KINDS))) AND (ITCOORDFOUND<=((
b^.ls^.COORDfield^.KEY=EXPKEY) AND (PPC IN 
b^.ls^.COORDfield^.PATTERNS))))                       
THEN result:=TRUE;IF result THEN
BEGIN
ITERATIONOK:=
b^.ls^.COORDfield^.ITERATION;
                                                      END;
                                                      END;PPCOORD_6:=result;
END;
                                                      FUNCTION PPCOORD_7
(VAR rec:PPCOORDtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
((
b^.ls^.PREPPfield^.ACTSUBCEFS*ACTSUBCEFSVAR<>[]) AND (
b^.ls^.PREPPfield^.ASPECT=ASPECTVAR) AND (
b^.ls^.PREPPfield^.CLASS=CLASSVAR) AND (
b^.ls^.PREPPfield^.MOOD=MOODVAR) AND (
b^.ls^.PREPPfield^.RETRO=RETROVAR))                   
THEN result:=TRUE;IF result THEN
BEGIN
 IF HEADKEYVAR<>
b^.ls^.PREPPfield^.HEADKEY
THEN
HEADKEYVAR:=0;
                                                      ACTSUBCEFSVAR:=ACTSUBCEFSVAR*
b^.ls^.PREPPfield^.ACTSUBCEFS;
                                                      ASSQMAX(
b^.ls^.PREPPfield^.SPECQ,SPECQVAR);
                                                      END;
                                                      END;PPCOORD_7:=result;
END;
                                                       FUNCTION comp_PPCOORD(rec1,rec2:PPCOORDtyp):BOOLEAN;
BEGIN WITH rec1^ DO comp_PPCOORD:=
(ACTSUBCEFSVAR=rec2^.ACTSUBCEFSVAR) AND
(ASPECTVAR=rec2^.ASPECTVAR) AND
(CLASSVAR=rec2^.CLASSVAR) AND
(CORR1FOUND=rec2^.CORR1FOUND) AND
(EXPKEY=rec2^.EXPKEY) AND
(HEADKEYVAR=rec2^.HEADKEYVAR) AND
(ITCOMMAFOUND=rec2^.ITCOMMAFOUND) AND
(ITCOORDFOUND=rec2^.ITCOORDFOUND) AND
(ITERATIONFOUND=rec2^.ITERATIONFOUND) AND
(ITERATIONOK=rec2^.ITERATIONOK) AND
(MOODVAR=rec2^.MOODVAR) AND
(RETROVAR=rec2^.RETROVAR) AND
(SPECQVAR=rec2^.SPECQVAR)
END;
PROCEDURE ADVPCOORD_0(VAR rec:ADVPCOORDtyp);
BEGIN WITH rec^ DO BEGIN
ACTSUBCEFSVAR:=[];
ASPECTVAR:=OMEGAASPECT;
CLASSVAR:=OMEGATIMEADVCLASS;
CORR1FOUND:=FALSE;
EXPKEY:=0;
ITCOMMAFOUND:=FALSE;
ITCOORDFOUND:=FALSE;
ITERATIONFOUND:=FALSE;
ITERATIONOK:=TRUE;
MOODVAR:=DECLXPMOOD;
QSTATUSVAR:=FALSE;
RETROVAR:=FALSE;
TEMPORALVAR:=FALSE;
                                                      END;END;
                                                      FUNCTION ADVPCOORD_1
(VAR rec:ADVPCOORDtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
CORR1FOUND:=TRUE;
                                                      EXPKEY:=
b^.ls^.COORDfield^.CORRELATIVE2KEY;
                                                      ITERATIONOK:=
b^.ls^.COORDfield^.ITERATION;
                                                      END;
                                                      END;ADVPCOORD_1:=result;
END;
                                                      FUNCTION ADVPCOORD_2
(VAR rec:ADVPCOORDtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
ITERATIONOK AND (ITERATIONFOUND<=((
b^.ls^.ADVPfield^.ACTSUBCEFS*ACTSUBCEFSVAR<>[]) AND (
b^.ls^.ADVPfield^.ASPECT=ASPECTVAR) AND (
b^.ls^.ADVPfield^.CLASS=CLASSVAR) AND (
b^.ls^.ADVPfield^.MOOD=MOODVAR) AND (
b^.ls^.ADVPfield^.RETRO=RETROVAR) AND (
b^.ls^.ADVPfield^.TEMPORAL=TEMPORALVAR) AND (
b^.ls^.ADVPfield^.QSTATUS=QSTATUSVAR)))               
THEN result:=TRUE;IF result THEN
BEGIN
 IF ITERATIONFOUND
THEN
BEGIN
ACTSUBCEFSVAR:=ACTSUBCEFSVAR*
b^.ls^.ADVPfield^.ACTSUBCEFS
END 
ELSE
BEGIN
ACTSUBCEFSVAR:=
b^.ls^.ADVPfield^.ACTSUBCEFS;
                                                      ASPECTVAR:=
b^.ls^.ADVPfield^.ASPECT;
                                                      CLASSVAR:=
b^.ls^.ADVPfield^.CLASS;
                                                      MOODVAR:=
b^.ls^.ADVPfield^.MOOD;
                                                      RETROVAR:=
b^.ls^.ADVPfield^.RETRO;
                                                      TEMPORALVAR:=
b^.ls^.ADVPfield^.TEMPORAL;
                                                      QSTATUSVAR:=
b^.ls^.ADVPfield^.QSTATUS
END ;
                                                      ITERATIONFOUND:=TRUE;
                                                      END;
                                                      END;ADVPCOORD_2:=result;
END;
                                                      FUNCTION ADVPCOORD_3
(VAR rec:ADVPCOORDtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
((( NOT CORR1FOUND)<=((PPC IN 
b^.ls^.COORDfield^.PATTERNS) AND (SIMPLE IN 
b^.ls^.COORDfield^.KINDS))) AND (CORR1FOUND<=((
b^.ls^.COORDfield^.KEY=EXPKEY) AND (CORRELATIVE2 IN 
b^.ls^.COORDfield^.KINDS))) AND ( NOT ITCOMMAFOUND))  
THEN result:=TRUE;IF result THEN
BEGIN
 IF ( NOT CORR1FOUND)
THEN
EXPKEY:=
b^.ls^.COORDfield^.KEY;
                                                      ITCOORDFOUND:=TRUE;
                                                      END;
                                                      END;ADVPCOORD_3:=result;
END;
                                                      FUNCTION ADVPCOORD_4
(VAR rec:ADVPCOORDtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
( NOT ITCOORDFOUND)                                   
THEN result:=TRUE;IF result THEN
BEGIN
ITCOMMAFOUND:=TRUE;
                                                      END;
                                                      END;ADVPCOORD_4:=result;
END;
                                                      FUNCTION ADVPCOORD_5
(VAR rec:ADVPCOORDtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
(ITERATIONFOUND<=((
b^.ls^.ADVPfield^.ACTSUBCEFS*ACTSUBCEFSVAR<>[]) AND (
b^.ls^.ADVPfield^.ASPECT=ASPECTVAR) AND (
b^.ls^.ADVPfield^.CLASS=CLASSVAR) AND (
b^.ls^.ADVPfield^.MOOD=MOODVAR) AND (
b^.ls^.ADVPfield^.RETRO=RETROVAR) AND (
b^.ls^.ADVPfield^.TEMPORAL=TEMPORALVAR) AND (
b^.ls^.ADVPfield^.QSTATUS=QSTATUSVAR)))               
THEN result:=TRUE;IF result THEN
BEGIN
 IF ITERATIONFOUND
THEN
BEGIN
ACTSUBCEFSVAR:=ACTSUBCEFSVAR*
b^.ls^.ADVPfield^.ACTSUBCEFS
END 
ELSE
BEGIN
ACTSUBCEFSVAR:=
b^.ls^.ADVPfield^.ACTSUBCEFS;
                                                      ASPECTVAR:=
b^.ls^.ADVPfield^.ASPECT;
                                                      CLASSVAR:=
b^.ls^.ADVPfield^.CLASS;
                                                      MOODVAR:=
b^.ls^.ADVPfield^.MOOD;
                                                      RETROVAR:=
b^.ls^.ADVPfield^.RETRO;
                                                      TEMPORALVAR:=
b^.ls^.ADVPfield^.TEMPORAL;
                                                      QSTATUSVAR:=
b^.ls^.ADVPfield^.QSTATUS
END ;
                                                      END;
                                                      END;ADVPCOORD_5:=result;
END;
                                                      FUNCTION ADVPCOORD_6
(VAR rec:ADVPCOORDtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
((( NOT CORR1FOUND)<=((PPC IN 
b^.ls^.COORDfield^.PATTERNS) AND (SIMPLE IN 
b^.ls^.COORDfield^.KINDS))) AND (CORR1FOUND<=((
b^.ls^.COORDfield^.KEY=EXPKEY) AND (CORRELATIVE2 IN 
b^.ls^.COORDfield^.KINDS))) AND (ITCOORDFOUND<=((
b^.ls^.COORDfield^.KEY=EXPKEY) AND (PPC IN 
b^.ls^.COORDfield^.PATTERNS))))                       
THEN result:=TRUE;IF result THEN
BEGIN
ITERATIONOK:=
b^.ls^.COORDfield^.ITERATION;
                                                      END;
                                                      END;ADVPCOORD_6:=result;
END;
                                                      FUNCTION ADVPCOORD_7
(VAR rec:ADVPCOORDtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
((
b^.ls^.ADVPfield^.ACTSUBCEFS*ACTSUBCEFSVAR<>[]) AND (
b^.ls^.ADVPfield^.ASPECT=ASPECTVAR) AND (
b^.ls^.ADVPfield^.CLASS=CLASSVAR) AND (
b^.ls^.ADVPfield^.MOOD=MOODVAR) AND (
b^.ls^.ADVPfield^.RETRO=RETROVAR) AND (
b^.ls^.ADVPfield^.TEMPORAL=TEMPORALVAR) AND (
b^.ls^.ADVPfield^.QSTATUS=QSTATUSVAR))                
THEN result:=TRUE;IF result THEN
BEGIN
ACTSUBCEFSVAR:=ACTSUBCEFSVAR*
b^.ls^.ADVPfield^.ACTSUBCEFS;
                                                      END;
                                                      END;ADVPCOORD_7:=result;
END;
                                                       FUNCTION comp_ADVPCOORD(rec1,rec2:ADVPCOORDtyp):BOOLEAN;
BEGIN WITH rec1^ DO comp_ADVPCOORD:=
(ACTSUBCEFSVAR=rec2^.ACTSUBCEFSVAR) AND
(ASPECTVAR=rec2^.ASPECTVAR) AND
(CLASSVAR=rec2^.CLASSVAR) AND
(CORR1FOUND=rec2^.CORR1FOUND) AND
(EXPKEY=rec2^.EXPKEY) AND
(ITCOMMAFOUND=rec2^.ITCOMMAFOUND) AND
(ITCOORDFOUND=rec2^.ITCOORDFOUND) AND
(ITERATIONFOUND=rec2^.ITERATIONFOUND) AND
(ITERATIONOK=rec2^.ITERATIONOK) AND
(MOODVAR=rec2^.MOODVAR) AND
(QSTATUSVAR=rec2^.QSTATUSVAR) AND
(RETROVAR=rec2^.RETROVAR) AND
(TEMPORALVAR=rec2^.TEMPORALVAR)
END;
PROCEDURE ADJPCOORD_0(VAR rec:ADJPCOORDtyp);
BEGIN WITH rec^ DO BEGIN
ACTUSEEFSVAR:=[];
FORMVAR:=POSITIVE;
MOODVAR:=DECLXPMOOD;
CORR1FOUND:=FALSE;
EXPKEY:=0;
ITCOMMAFOUND:=FALSE;
ITCOORDFOUND:=FALSE;
ITERATIONFOUND:=FALSE;
ITERATIONOK:=TRUE;
                                                      END;END;
                                                      FUNCTION ADJPCOORD_1
(VAR rec:ADJPCOORDtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
CORR1FOUND:=TRUE;
                                                      EXPKEY:=
b^.ls^.COORDfield^.CORRELATIVE2KEY;
                                                      ITERATIONOK:=
b^.ls^.COORDfield^.ITERATION;
                                                      END;
                                                      END;ADJPCOORD_1:=result;
END;
                                                      FUNCTION ADJPCOORD_2
(VAR rec:ADJPCOORDtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
ITERATIONOK AND (ITERATIONFOUND<=((
b^.ls^.ADJPfield^.ACTUSEEFS*ACTUSEEFSVAR<>[]) AND (
b^.ls^.ADJPfield^.MOOD=MOODVAR) AND (
b^.ls^.ADJPfield^.FORM=FORMVAR)))                     
THEN result:=TRUE;IF result THEN
BEGIN
 IF ITERATIONFOUND
THEN
BEGIN
ACTUSEEFSVAR:=ACTUSEEFSVAR*
b^.ls^.ADJPfield^.ACTUSEEFS
END 
ELSE
BEGIN
ACTUSEEFSVAR:=
b^.ls^.ADJPfield^.ACTUSEEFS;
                                                      MOODVAR:=
b^.ls^.ADJPfield^.MOOD;
                                                      FORMVAR:=
b^.ls^.ADJPfield^.FORM
END ;
                                                      ITERATIONFOUND:=TRUE;
                                                      END;
                                                      END;ADJPCOORD_2:=result;
END;
                                                      FUNCTION ADJPCOORD_3
(VAR rec:ADJPCOORDtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
((( NOT CORR1FOUND)<=((APC IN 
b^.ls^.COORDfield^.PATTERNS) AND (SIMPLE IN 
b^.ls^.COORDfield^.KINDS))) AND (CORR1FOUND<=((
b^.ls^.COORDfield^.KEY=EXPKEY) AND (CORRELATIVE2 IN 
b^.ls^.COORDfield^.KINDS))) AND ( NOT ITCOMMAFOUND))  
THEN result:=TRUE;IF result THEN
BEGIN
 IF ( NOT CORR1FOUND)
THEN
EXPKEY:=
b^.ls^.COORDfield^.KEY;
                                                      ITCOORDFOUND:=TRUE;
                                                      END;
                                                      END;ADJPCOORD_3:=result;
END;
                                                      FUNCTION ADJPCOORD_4
(VAR rec:ADJPCOORDtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
( NOT ITCOORDFOUND)                                   
THEN result:=TRUE;IF result THEN
BEGIN
ITCOMMAFOUND:=TRUE;
                                                      END;
                                                      END;ADJPCOORD_4:=result;
END;
                                                      FUNCTION ADJPCOORD_5
(VAR rec:ADJPCOORDtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
(ITERATIONFOUND<=((
b^.ls^.ADJPfield^.ACTUSEEFS*ACTUSEEFSVAR<>[]) AND (
b^.ls^.ADJPfield^.MOOD=MOODVAR) AND (
b^.ls^.ADJPfield^.FORM=FORMVAR)))                     
THEN result:=TRUE;IF result THEN
BEGIN
 IF ITERATIONFOUND
THEN
BEGIN
ACTUSEEFSVAR:=ACTUSEEFSVAR*
b^.ls^.ADJPfield^.ACTUSEEFS
END 
ELSE
BEGIN
ACTUSEEFSVAR:=
b^.ls^.ADJPfield^.ACTUSEEFS;
                                                      MOODVAR:=
b^.ls^.ADJPfield^.MOOD;
                                                      FORMVAR:=
b^.ls^.ADJPfield^.FORM
END ;
                                                      END;
                                                      END;ADJPCOORD_5:=result;
END;
                                                      FUNCTION ADJPCOORD_6
(VAR rec:ADJPCOORDtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
((( NOT CORR1FOUND)<=((APC IN 
b^.ls^.COORDfield^.PATTERNS) AND (SIMPLE IN 
b^.ls^.COORDfield^.KINDS))) AND (CORR1FOUND<=((
b^.ls^.COORDfield^.KEY=EXPKEY) AND (CORRELATIVE2 IN 
b^.ls^.COORDfield^.KINDS))) AND (ITCOORDFOUND<=((
b^.ls^.COORDfield^.KEY=EXPKEY) AND (APC IN 
b^.ls^.COORDfield^.PATTERNS))))                       
THEN result:=TRUE;IF result THEN
BEGIN
ITERATIONOK:=
b^.ls^.COORDfield^.ITERATION;
                                                      END;
                                                      END;ADJPCOORD_6:=result;
END;
                                                      FUNCTION ADJPCOORD_7
(VAR rec:ADJPCOORDtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
((
b^.ls^.ADJPfield^.ACTUSEEFS*ACTUSEEFSVAR<>[]) AND (
b^.ls^.ADJPfield^.MOOD=MOODVAR) AND (
b^.ls^.ADJPfield^.FORM=FORMVAR))                      
THEN result:=TRUE;IF result THEN
BEGIN
END;
                                                      END;ADJPCOORD_7:=result;
END;
                                                       FUNCTION comp_ADJPCOORD(rec1,rec2:ADJPCOORDtyp):BOOLEAN;
BEGIN WITH rec1^ DO comp_ADJPCOORD:=
(ACTUSEEFSVAR=rec2^.ACTUSEEFSVAR) AND
(FORMVAR=rec2^.FORMVAR) AND
(MOODVAR=rec2^.MOODVAR) AND
(CORR1FOUND=rec2^.CORR1FOUND) AND
(EXPKEY=rec2^.EXPKEY) AND
(ITCOMMAFOUND=rec2^.ITCOMMAFOUND) AND
(ITCOORDFOUND=rec2^.ITCOORDFOUND) AND
(ITERATIONFOUND=rec2^.ITERATIONFOUND) AND
(ITERATIONOK=rec2^.ITERATIONOK)
END;
PROCEDURE NPCOORD_0(VAR rec:NPCOORDtyp);
BEGIN WITH rec^ DO BEGIN
NUMBERVAR:=OMEGANUMBER;
CASESVAR:=[];
MOODVAR:=DECLXPMOOD;
CORR1FOUND:=FALSE;
EXPKEY:=0;
INDUCEDNUMBERSVAR:=[];
ITCOMMAFOUND:=FALSE;
ITCOORDFOUND:=FALSE;
ITERATIONFOUND:=FALSE;
ITERATIONOK:=TRUE;
                                                      END;END;
                                                      FUNCTION NPCOORD_1
(VAR rec:NPCOORDtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
CORR1FOUND:=TRUE;
                                                      EXPKEY:=
b^.ls^.COORDfield^.CORRELATIVE2KEY;
                                                      ITERATIONOK:=
b^.ls^.COORDfield^.ITERATION;
                                                      END;
                                                      END;NPCOORD_1:=result;
END;
                                                      FUNCTION NPCOORD_2
(VAR rec:NPCOORDtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
ITERATIONOK AND (ITERATIONFOUND<=((
b^.ls^.NPfield^.CASES*CASESVAR<>[]) AND (
b^.ls^.NPfield^.MOOD=MOODVAR)))                       
THEN result:=TRUE;IF result THEN
BEGIN
 IF ITERATIONFOUND
THEN
BEGIN
CASESVAR:=CASESVAR*
b^.ls^.NPfield^.CASES;
                                                      
END 
ELSE
BEGIN
MOODVAR:=
b^.ls^.NPfield^.MOOD;
                                                      CASESVAR:=
b^.ls^.NPfield^.CASES
END ;
                                                      COMPNUMBER(NUMBERVAR,INDUCEDNUMBERSVAR,B);
                                                      NUMBERVAR:=
b^.ls^.NPfield^.NUMBER;
                                                      ITERATIONFOUND:=TRUE;
                                                      END;
                                                      END;NPCOORD_2:=result;
END;
                                                      FUNCTION NPCOORD_3
(VAR rec:NPCOORDtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
((( NOT CORR1FOUND)<=((NPC IN 
b^.ls^.COORDfield^.PATTERNS) AND (SIMPLE IN 
b^.ls^.COORDfield^.KINDS))) AND (CORR1FOUND<=((
b^.ls^.COORDfield^.KEY=EXPKEY) AND (CORRELATIVE2 IN 
b^.ls^.COORDfield^.KINDS))) AND ( NOT ITCOMMAFOUND))  
THEN result:=TRUE;IF result THEN
BEGIN
 IF ( NOT CORR1FOUND)
THEN
EXPKEY:=
b^.ls^.COORDfield^.KEY;
                                                      ITCOORDFOUND:=TRUE;
                                                      INDUCEDNUMBERSVAR:=
b^.ls^.COORDfield^.INDUCEDNUMBERS;
                                                      END;
                                                      END;NPCOORD_3:=result;
END;
                                                      FUNCTION NPCOORD_4
(VAR rec:NPCOORDtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
( NOT ITCOORDFOUND)                                   
THEN result:=TRUE;IF result THEN
BEGIN
ITCOMMAFOUND:=TRUE;
                                                      END;
                                                      END;NPCOORD_4:=result;
END;
                                                      FUNCTION NPCOORD_5
(VAR rec:NPCOORDtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
(ITERATIONFOUND<=((
b^.ls^.NPfield^.CASES*CASESVAR<>[]) AND (
b^.ls^.NPfield^.MOOD=MOODVAR)))                       
THEN result:=TRUE;IF result THEN
BEGIN
 IF ITERATIONFOUND
THEN
BEGIN
CASESVAR:=CASESVAR*
b^.ls^.NPfield^.CASES;
                                                      
END 
ELSE
BEGIN
MOODVAR:=
b^.ls^.NPfield^.MOOD;
                                                      CASESVAR:=
b^.ls^.NPfield^.CASES
END ;
                                                      COMPNUMBER(NUMBERVAR,INDUCEDNUMBERSVAR,B);
                                                      NUMBERVAR:=
b^.ls^.NPfield^.NUMBER;
                                                      END;
                                                      END;NPCOORD_5:=result;
END;
                                                      FUNCTION NPCOORD_6
(VAR rec:NPCOORDtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
((( NOT CORR1FOUND)<=((NPC IN 
b^.ls^.COORDfield^.PATTERNS) AND (SIMPLE IN 
b^.ls^.COORDfield^.KINDS))) AND (CORR1FOUND<=((
b^.ls^.COORDfield^.KEY=EXPKEY) AND (CORRELATIVE2 IN 
b^.ls^.COORDfield^.KINDS))) AND (ITCOORDFOUND<=((
b^.ls^.COORDfield^.KEY=EXPKEY) AND (NPC IN 
b^.ls^.COORDfield^.PATTERNS))))                       
THEN result:=TRUE;IF result THEN
BEGIN
ITERATIONOK:=
b^.ls^.COORDfield^.ITERATION;
                                                       IF ( NOT ITCOORDFOUND)
THEN
INDUCEDNUMBERSVAR:=
b^.ls^.COORDfield^.INDUCEDNUMBERS;
                                                      END;
                                                      END;NPCOORD_6:=result;
END;
                                                      FUNCTION NPCOORD_7
(VAR rec:NPCOORDtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
((
b^.ls^.NPfield^.CASES*CASESVAR<>[]) AND (
b^.ls^.NPfield^.MOOD=MOODVAR))                        
THEN result:=TRUE;IF result THEN
BEGIN
CASESVAR:=CASESVAR*
b^.ls^.NPfield^.CASES;
                                                      COMPNUMBER(NUMBERVAR,INDUCEDNUMBERSVAR,B);
                                                      END;
                                                      END;NPCOORD_7:=result;
END;
                                                       FUNCTION comp_NPCOORD(rec1,rec2:NPCOORDtyp):BOOLEAN;
BEGIN WITH rec1^ DO comp_NPCOORD:=
(NUMBERVAR=rec2^.NUMBERVAR) AND
(CASESVAR=rec2^.CASESVAR) AND
(MOODVAR=rec2^.MOODVAR) AND
(CORR1FOUND=rec2^.CORR1FOUND) AND
(EXPKEY=rec2^.EXPKEY) AND
(INDUCEDNUMBERSVAR=rec2^.INDUCEDNUMBERSVAR) AND
(ITCOMMAFOUND=rec2^.ITCOMMAFOUND) AND
(ITCOORDFOUND=rec2^.ITCOORDFOUND) AND
(ITERATIONFOUND=rec2^.ITERATIONFOUND) AND
(ITERATIONOK=rec2^.ITERATIONOK)
END;
PROCEDURE SCOORD_0(VAR rec:SCOORDtyp);
BEGIN WITH rec^ DO BEGIN
MOODVAR:=OMEGAMOOD;
SENTTYPEVAR:=OMEGACLAUSE;
PROSUBJECTVAR:=FALSE;
MODUSVAR:=OMEGAMODUS;
FINITENESSVAR:=OMEGAFIN;
INFSORTVAR:=OMEGAINF;
SUPERDEIXISVAR:=OMEGADEIXIS;
VRCOMPLVAR:=FALSE;
ADVERBIALVAR:=FALSE;
TEMPORALVAR:=FALSE;
CONJCLASSVAR:=OMEGATIMEADVCLASS;
CONJDEIXISVAR:=OMEGADEIXIS;
CONJASPECTVAR:=OMEGAASPECT;
CONJRETROVAR:=FALSE;
CORR1FOUND:=FALSE;
EXPKEY:=0;
ITCOMMAFOUND:=FALSE;
ITCOORDFOUND:=FALSE;
ITERATIONFOUND:=FALSE;
ITERATIONOK:=TRUE;
                                                      END;END;
                                                      FUNCTION SCOORD_1
(VAR rec:SCOORDtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
CORR1FOUND:=TRUE;
                                                      EXPKEY:=
b^.ls^.COORDfield^.CORRELATIVE2KEY;
                                                      ITERATIONOK:=
b^.ls^.COORDfield^.ITERATION;
                                                      END;
                                                      END;SCOORD_1:=result;
END;
                                                      FUNCTION SCOORD_2
(VAR rec:SCOORDtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
ITERATIONOK AND (ITERATIONFOUND<=((MOODVAR=
b^.ls^.SENTENCEfield^.MOOD) AND (SENTTYPEVAR=
b^.ls^.SENTENCEfield^.SENTTYPE) AND (PROSUBJECTVAR=
b^.ls^.SENTENCEfield^.PROSUBJECT) AND (MODUSVAR=
b^.ls^.SENTENCEfield^.MODUS) AND (FINITENESSVAR=
b^.ls^.SENTENCEfield^.FINITENESS) AND (INFSORTVAR=
b^.ls^.SENTENCEfield^.INFSORT) AND (VRCOMPLVAR=
b^.ls^.SENTENCEfield^.VRCOMPL) AND (ADVERBIALVAR=
b^.ls^.SENTENCEfield^.ADVERBIAL) AND (TEMPORALVAR=
b^.ls^.SENTENCEfield^.TEMPORAL) AND (SUPERDEIXISVAR=
b^.ls^.SENTENCEfield^.SUPERDEIXIS) AND (CONJCLASSVAR=
b^.ls^.SENTENCEfield^.CONJCLASS) AND (CONJDEIXISVAR=
b^.ls^.SENTENCEfield^.CONJDEIXIS) AND (CONJASPECTVAR=
b^.ls^.SENTENCEfield^.CONJASPECT) AND (CONJRETROVAR=
b^.ls^.SENTENCEfield^.CONJRETRO)))                    
THEN result:=TRUE;IF result THEN
BEGIN
 IF ( NOT ITERATIONFOUND)
THEN
BEGIN
MOODVAR:=
b^.ls^.SENTENCEfield^.MOOD;
                                                      SENTTYPEVAR:=
b^.ls^.SENTENCEfield^.SENTTYPE;
                                                      PROSUBJECTVAR:=
b^.ls^.SENTENCEfield^.PROSUBJECT;
                                                      MODUSVAR:=
b^.ls^.SENTENCEfield^.MODUS;
                                                      FINITENESSVAR:=
b^.ls^.SENTENCEfield^.FINITENESS;
                                                      INFSORTVAR:=
b^.ls^.SENTENCEfield^.INFSORT;
                                                      VRCOMPLVAR:=
b^.ls^.SENTENCEfield^.VRCOMPL;
                                                      ADVERBIALVAR:=
b^.ls^.SENTENCEfield^.ADVERBIAL;
                                                      TEMPORALVAR:=
b^.ls^.SENTENCEfield^.TEMPORAL;
                                                      SUPERDEIXISVAR:=
b^.ls^.SENTENCEfield^.SUPERDEIXIS
END ;
                                                      ITERATIONFOUND:=TRUE
END                                                   
                                                      END;SCOORD_2:=result;
END;
                                                      FUNCTION SCOORD_3
(VAR rec:SCOORDtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
((( NOT CORR1FOUND)<=((
b^.ls^.COORDfield^.PATTERNS*(
LSAUXDOM_COORDVFCPS+
LSAUXDOM_COORDV2CPS)<>[]) AND (SIMPLE IN 
b^.ls^.COORDfield^.KINDS))) AND (CORR1FOUND<=((
b^.ls^.COORDfield^.KEY=EXPKEY) AND (CORRELATIVE2 IN 
b^.ls^.COORDfield^.KINDS))) AND ( NOT ITCOMMAFOUND))  
THEN result:=TRUE;IF result THEN
BEGIN
 IF ( NOT CORR1FOUND)
THEN
BEGIN
EXPKEY:=
b^.ls^.COORDfield^.KEY
END ;
                                                      ITCOORDFOUND:=TRUE;
                                                      END;
                                                      END;SCOORD_3:=result;
END;
                                                      FUNCTION SCOORD_4
(VAR rec:SCOORDtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
( NOT ITCOORDFOUND)                                   
THEN result:=TRUE;IF result THEN
BEGIN
ITCOMMAFOUND:=TRUE
END                                                   
                                                      END;SCOORD_4:=result;
END;
                                                      FUNCTION SCOORD_5
(VAR rec:SCOORDtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
(ITERATIONFOUND<=((MOODVAR=
b^.ls^.SENTENCEfield^.MOOD) AND (SENTTYPEVAR=
b^.ls^.SENTENCEfield^.SENTTYPE) AND (PROSUBJECTVAR=
b^.ls^.SENTENCEfield^.PROSUBJECT) AND (MODUSVAR=
b^.ls^.SENTENCEfield^.MODUS) AND (FINITENESSVAR=
b^.ls^.SENTENCEfield^.FINITENESS) AND (INFSORTVAR=
b^.ls^.SENTENCEfield^.INFSORT) AND (VRCOMPLVAR=
b^.ls^.SENTENCEfield^.VRCOMPL) AND (ADVERBIALVAR=
b^.ls^.SENTENCEfield^.ADVERBIAL) AND (TEMPORALVAR=
b^.ls^.SENTENCEfield^.TEMPORAL) AND (SUPERDEIXISVAR=
b^.ls^.SENTENCEfield^.SUPERDEIXIS) AND (CONJCLASSVAR=
b^.ls^.SENTENCEfield^.CONJCLASS) AND (CONJDEIXISVAR=
b^.ls^.SENTENCEfield^.CONJDEIXIS) AND (CONJASPECTVAR=
b^.ls^.SENTENCEfield^.CONJASPECT) AND (CONJRETROVAR=
b^.ls^.SENTENCEfield^.CONJRETRO)))                    
THEN result:=TRUE;IF result THEN
BEGIN
 IF ITERATIONFOUND
THEN
BEGIN

END 
ELSE
BEGIN
MOODVAR:=
b^.ls^.SENTENCEfield^.MOOD;
                                                      SENTTYPEVAR:=
b^.ls^.SENTENCEfield^.SENTTYPE;
                                                      PROSUBJECTVAR:=
b^.ls^.SENTENCEfield^.PROSUBJECT;
                                                      MODUSVAR:=
b^.ls^.SENTENCEfield^.MODUS;
                                                      FINITENESSVAR:=
b^.ls^.SENTENCEfield^.FINITENESS;
                                                      INFSORTVAR:=
b^.ls^.SENTENCEfield^.INFSORT;
                                                      VRCOMPLVAR:=
b^.ls^.SENTENCEfield^.VRCOMPL;
                                                      ADVERBIALVAR:=
b^.ls^.SENTENCEfield^.ADVERBIAL;
                                                      TEMPORALVAR:=
b^.ls^.SENTENCEfield^.TEMPORAL;
                                                      SUPERDEIXISVAR:=
b^.ls^.SENTENCEfield^.SUPERDEIXIS
END ;
                                                      END;
                                                      END;SCOORD_5:=result;
END;
                                                      FUNCTION SCOORD_6
(VAR rec:SCOORDtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
((( NOT CORR1FOUND)<=(((
b^.ls^.COORDfield^.PATTERNS*(
LSAUXDOM_COORDVFCPS+
LSAUXDOM_COORDV2CPS)<>[])) AND (SIMPLE IN 
b^.ls^.COORDfield^.KINDS))) AND (CORR1FOUND<=((
b^.ls^.COORDfield^.KEY=EXPKEY) AND (CORRELATIVE2 IN 
b^.ls^.COORDfield^.KINDS))) AND (ITCOORDFOUND<=((
b^.ls^.COORDfield^.KEY=EXPKEY) AND (
b^.ls^.COORDfield^.PATTERNS*(
LSAUXDOM_COORDVFCPS+
LSAUXDOM_COORDV2CPS)<>[]))))                          
THEN result:=TRUE;IF result THEN
BEGIN
ITERATIONOK:=
b^.ls^.COORDfield^.ITERATION;
                                                      END;
                                                      END;SCOORD_6:=result;
END;
                                                      FUNCTION SCOORD_7
(VAR rec:SCOORDtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
(MOODVAR=
b^.ls^.SENTENCEfield^.MOOD) AND (SENTTYPEVAR=
b^.ls^.SENTENCEfield^.SENTTYPE) AND (PROSUBJECTVAR=
b^.ls^.SENTENCEfield^.PROSUBJECT) AND (MODUSVAR=
b^.ls^.SENTENCEfield^.MODUS) AND (FINITENESSVAR=
b^.ls^.SENTENCEfield^.FINITENESS) AND (INFSORTVAR=
b^.ls^.SENTENCEfield^.INFSORT) AND (VRCOMPLVAR=
b^.ls^.SENTENCEfield^.VRCOMPL) AND (ADVERBIALVAR=
b^.ls^.SENTENCEfield^.ADVERBIAL) AND (TEMPORALVAR=
b^.ls^.SENTENCEfield^.TEMPORAL) AND (SUPERDEIXISVAR=
b^.ls^.SENTENCEfield^.SUPERDEIXIS) AND (CONJCLASSVAR=
b^.ls^.SENTENCEfield^.CONJCLASS) AND (CONJDEIXISVAR=
b^.ls^.SENTENCEfield^.CONJDEIXIS) AND (CONJASPECTVAR=
b^.ls^.SENTENCEfield^.CONJASPECT) AND (CONJRETROVAR=
b^.ls^.SENTENCEfield^.CONJRETRO)                      
THEN result:=TRUE;IF result THEN
BEGIN
END;
                                                      END;SCOORD_7:=result;
END;
                                                       FUNCTION comp_SCOORD(rec1,rec2:SCOORDtyp):BOOLEAN;
BEGIN WITH rec1^ DO comp_SCOORD:=
(MOODVAR=rec2^.MOODVAR) AND
(SENTTYPEVAR=rec2^.SENTTYPEVAR) AND
(PROSUBJECTVAR=rec2^.PROSUBJECTVAR) AND
(MODUSVAR=rec2^.MODUSVAR) AND
(FINITENESSVAR=rec2^.FINITENESSVAR) AND
(INFSORTVAR=rec2^.INFSORTVAR) AND
(SUPERDEIXISVAR=rec2^.SUPERDEIXISVAR) AND
(VRCOMPLVAR=rec2^.VRCOMPLVAR) AND
(ADVERBIALVAR=rec2^.ADVERBIALVAR) AND
(TEMPORALVAR=rec2^.TEMPORALVAR) AND
(CONJCLASSVAR=rec2^.CONJCLASSVAR) AND
(CONJDEIXISVAR=rec2^.CONJDEIXISVAR) AND
(CONJASPECTVAR=rec2^.CONJASPECTVAR) AND
(CONJRETROVAR=rec2^.CONJRETROVAR) AND
(CORR1FOUND=rec2^.CORR1FOUND) AND
(EXPKEY=rec2^.EXPKEY) AND
(ITCOMMAFOUND=rec2^.ITCOMMAFOUND) AND
(ITCOORDFOUND=rec2^.ITCOORDFOUND) AND
(ITERATIONFOUND=rec2^.ITERATIONFOUND) AND
(ITERATIONOK=rec2^.ITERATIONOK)
END;
