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
