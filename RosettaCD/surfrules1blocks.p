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
PROCEDURE VCOMPLEX_0(VAR rec:VCOMPLEXtyp);
BEGIN WITH rec^ DO BEGIN
POSSVOICESVAR:=[ACTIVE,PASSIVE,DOORACTIVE];
FOUNDAUXESVAR:=[];
PARTKEYVAR:=0;
                                                      END;END;
                                                      FUNCTION VCOMPLEX_1
(VAR rec:VCOMPLEXtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
END;
                                                      END;VCOMPLEX_1:=result;
END;
                                                      FUNCTION VCOMPLEX_2
(VAR rec:VCOMPLEXtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
POSSVOICESVAR:=
b^.ls^.VERBfield^.POSSVOICES;
                                                      FOUNDAUXESVAR:=
b^.ls^.VERBfield^.FOUNDAUXES;
                                                      END;
                                                      END;VCOMPLEX_2:=result;
END;
                                                      FUNCTION VCOMPLEX_3
(VAR rec:VCOMPLEXtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
PARTKEYVAR:=
b^.ls^.PARTfield^.KEY
END                                                   
                                                      END;VCOMPLEX_3:=result;
END;
                                                      FUNCTION VCOMPLEX_4
(VAR rec:VCOMPLEXtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 

b^.ls^.VERBfield^.PARTICLE=PARTKEYVAR                 
THEN result:=TRUE;IF result THEN
BEGIN
POSSVOICESVAR:=
b^.ls^.VERBfield^.POSSVOICES;
                                                      FOUNDAUXESVAR:=
b^.ls^.VERBfield^.FOUNDAUXES;
                                                      END;
                                                      END;VCOMPLEX_4:=result;
END;
                                                      FUNCTION VCOMPLEX_5
(VAR rec:VCOMPLEXtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
POSSVOICESVAR:=
b^.ls^.VERBfield^.POSSVOICES;
                                                      FOUNDAUXESVAR:=[];
                                                      END;
                                                      END;VCOMPLEX_5:=result;
END;
                                                      FUNCTION VCOMPLEX_6
(VAR rec:VCOMPLEXtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
END;
                                                      END;VCOMPLEX_6:=result;
END;
                                                      FUNCTION VCOMPLEX_7
(VAR rec:VCOMPLEXtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
FOUNDAUXESVAR:=
b^.ls^.VERBfield^.FOUNDAUXES+[
b^.ls^.VERBfield^.SUBC];
                                                      END;
                                                      END;VCOMPLEX_7:=result;
END;
                                                      FUNCTION VCOMPLEX_8
(VAR rec:VCOMPLEXtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
PERFAUXOK(REC^,
b^.ls^.VERBfield^.PERFAUXS)                           
THEN result:=TRUE;IF result THEN
BEGIN
POSSVOICESVAR:=
b^.ls^.VERBfield^.POSSVOICES;
                                                      END;
                                                      END;VCOMPLEX_8:=result;
END;
                                                      FUNCTION VCOMPLEX_9
(VAR rec:VCOMPLEXtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
END;
                                                      END;VCOMPLEX_9:=result;
END;
                                                      FUNCTION VCOMPLEX_10
(VAR rec:VCOMPLEXtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
POSSVOICESVAR:=
b^.ls^.VERBfield^.POSSVOICES;
                                                      FOUNDAUXESVAR:=[];
                                                      END;
                                                      END;VCOMPLEX_10:=result;
END;
                                                      FUNCTION VCOMPLEX_11
(VAR rec:VCOMPLEXtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
FOUNDAUXESVAR:=[PROGAUX];
                                                      END;
                                                      END;VCOMPLEX_11:=result;
END;
                                                      FUNCTION VCOMPLEX_12
(VAR rec:VCOMPLEXtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
POSSVOICESVAR:=
b^.ls^.VERBfield^.POSSVOICES;
                                                      END;
                                                      END;VCOMPLEX_12:=result;
END;
                                                      FUNCTION VCOMPLEX_13
(VAR rec:VCOMPLEXtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
FOUNDAUXESVAR:=[
b^.ls^.VERBfield^.SUBC];
                                                      END;
                                                      END;VCOMPLEX_13:=result;
END;
                                                      FUNCTION VCOMPLEX_14
(VAR rec:VCOMPLEXtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
POSSVOICESVAR:=
b^.ls^.VERBfield^.POSSVOICES;
                                                      END;
                                                      END;VCOMPLEX_14:=result;
END;
                                                      FUNCTION VCOMPLEX_15
(VAR rec:VCOMPLEXtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
FOUNDAUXESVAR:=[
b^.ls^.VERBfield^.SUBC];
                                                      END;
                                                      END;VCOMPLEX_15:=result;
END;
                                                      FUNCTION VCOMPLEX_16
(VAR rec:VCOMPLEXtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
POSSVOICESVAR:=
b^.ls^.VERBfield^.POSSVOICES;
                                                      FOUNDAUXESVAR:=FOUNDAUXESVAR+[ZIJNAUX];
                                                      END;
                                                      END;VCOMPLEX_16:=result;
END;
                                                      FUNCTION VCOMPLEX_17
(VAR rec:VCOMPLEXtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
END;
                                                      END;VCOMPLEX_17:=result;
END;
                                                      FUNCTION VCOMPLEX_18
(VAR rec:VCOMPLEXtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
END;
                                                      END;VCOMPLEX_18:=result;
END;
                                                      FUNCTION VCOMPLEX_19
(VAR rec:VCOMPLEXtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
POSSVOICESVAR:=
b^.ls^.VERBfield^.POSSVOICES;
                                                      FOUNDAUXESVAR:=
b^.ls^.VERBfield^.FOUNDAUXES;
                                                      END;
                                                      END;VCOMPLEX_19:=result;
END;
                                                      FUNCTION VCOMPLEX_20
(VAR rec:VCOMPLEXtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
END;
                                                      END;VCOMPLEX_20:=result;
END;
                                                      FUNCTION VCOMPLEX_21
(VAR rec:VCOMPLEXtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
END;
                                                      END;VCOMPLEX_21:=result;
END;
                                                      FUNCTION VCOMPLEX_22
(VAR rec:VCOMPLEXtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
POSSVOICESVAR:=
b^.ls^.VERBfield^.POSSVOICES;
                                                      FOUNDAUXESVAR:=
b^.ls^.VERBfield^.FOUNDAUXES;
                                                      END;
                                                      END;VCOMPLEX_22:=result;
END;
                                                      FUNCTION VCOMPLEX_23
(VAR rec:VCOMPLEXtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
POSSVOICESVAR:=
b^.ls^.VERBfield^.POSSVOICES;
                                                      FOUNDAUXESVAR:=
b^.ls^.VERBfield^.FOUNDAUXES;
                                                      END;
                                                      END;VCOMPLEX_23:=result;
END;
                                                       FUNCTION comp_VCOMPLEX(rec1,rec2:VCOMPLEXtyp):BOOLEAN;
BEGIN WITH rec1^ DO comp_VCOMPLEX:=
(POSSVOICESVAR=rec2^.POSSVOICESVAR) AND
(FOUNDAUXESVAR=rec2^.FOUNDAUXESVAR) AND
(PARTKEYVAR=rec2^.PARTKEYVAR)
END;
PROCEDURE VP_0(VAR rec:VPtyp);
BEGIN WITH rec^ DO BEGIN
AANOBJRELFOUND:=FALSE;
ARGRELFOUND:=FALSE;
DOORBYFOUND:=FALSE;
DOORBYRELFOUND:=FALSE;
EORENPARTICIPLEFOUND:=FALSE;
HEADMODUSVAR:=OMEGAMODUS;
HEADSTATUSVAR:=BAREV;
IONPFOUND:=FALSE;
MODUSVAR:=OMEGAMODUS;
MODUSVAR:=OMEGAMODUS;
PREPOBJ1FOUND:=FALSE;
PREPOBJ2FOUND:=FALSE;
PREPREPOBJRELFOUND:=FALSE;
PROGAUXMODUSVAR:=OMEGAMODUS;
STRANDEDPPFOUND:=FALSE;
VOOROBJRELFOUND:=FALSE;
VRIONPFOUND:=FALSE;
VROBJFOUND:=FALSE;
                                                      END;END;
                                                      FUNCTION VP_1
(VAR rec:VPtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
( NOT VRIONPFOUND) AND ( NOT ARGRELFOUND) AND ( NOT VROBJFOUND)                                           
THEN result:=TRUE;IF result THEN
BEGIN
IONPFOUND:=TRUE;
                                                      END;
                                                      END;VP_1:=result;
END;
                                                      FUNCTION VP_2
(VAR rec:VPtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
AANOBJRELFOUND:=TRUE;
                                                      END;
                                                      END;VP_2:=result;
END;
                                                      FUNCTION VP_3
(VAR rec:VPtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
VOOROBJRELFOUND:=TRUE;
                                                      END;
                                                      END;VP_3:=result;
END;
                                                      FUNCTION VP_4
(VAR rec:VPtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
( NOT ARGRELFOUND) AND ( NOT VRIONPFOUND) AND ( NOT VROBJFOUND)                                           
THEN result:=TRUE;IF result THEN
BEGIN
END;
                                                      END;VP_4:=result;
END;
                                                      FUNCTION VP_5
(VAR rec:VPtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
( NOT PREPOBJ2FOUND) AND (
b^.ls^.PREPPfield^.RADVKEY=0)                         
THEN result:=TRUE;IF result THEN
BEGIN
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
                                                      END;VP_5:=result;
END;
                                                      FUNCTION VP_6
(VAR rec:VPtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
( NOT PREPREPOBJRELFOUND) AND (
b^.ls^.PREPPfield^.RADVKEY=0)                         
THEN result:=TRUE;IF result THEN
BEGIN
 IF 
b^.ls^.PREPPfield^.STRANDED
THEN
STRANDEDPPFOUND:=TRUE;
                                                      END;
                                                      END;VP_6:=result;
END;
                                                      FUNCTION VP_7
(VAR rec:VPtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
( NOT PREPREPOBJRELFOUND)                             
THEN result:=TRUE;IF result THEN
BEGIN
END;
                                                      END;VP_7:=result;
END;
                                                      FUNCTION VP_8
(VAR rec:VPtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
( NOT PREPREPOBJRELFOUND) AND (
b^.ls^.PREPPfield^.RADVKEY=0)                         
THEN result:=TRUE;IF result THEN
BEGIN
 IF 
b^.ls^.PREPPfield^.STRANDED
THEN
STRANDEDPPFOUND:=TRUE;
                                                      END;
                                                      END;VP_8:=result;
END;
                                                      FUNCTION VP_9
(VAR rec:VPtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
( NOT PREPREPOBJRELFOUND)                             
THEN result:=TRUE;IF result THEN
BEGIN
END;
                                                      END;VP_9:=result;
END;
                                                      FUNCTION VP_10
(VAR rec:VPtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
( NOT PREPREPOBJRELFOUND) AND (
b^.ls^.PREPPfield^.RADVKEY=0)                         
THEN result:=TRUE;IF result THEN
BEGIN
END;
                                                      END;VP_10:=result;
END;
                                                      FUNCTION VP_11
(VAR rec:VPtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
( NOT PREPREPOBJRELFOUND)                             
THEN result:=TRUE;IF result THEN
BEGIN
END;
                                                      END;VP_11:=result;
END;
                                                      FUNCTION VP_12
(VAR rec:VPtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
( NOT PREPREPOBJRELFOUND)                             
THEN result:=TRUE;IF result THEN
BEGIN
END;
                                                      END;VP_12:=result;
END;
                                                      FUNCTION VP_13
(VAR rec:VPtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
( NOT PREPREPOBJRELFOUND)                             
THEN result:=TRUE;IF result THEN
BEGIN
END;
                                                      END;VP_13:=result;
END;
                                                      FUNCTION VP_14
(VAR rec:VPtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
( NOT DOORBYRELFOUND) AND ( NOT STRANDEDPPFOUND)      
THEN result:=TRUE;IF result THEN
BEGIN
DOORBYFOUND:=TRUE;
                                                      END;
                                                      END;VP_14:=result;
END;
                                                      FUNCTION VP_15
(VAR rec:VPtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
( NOT PREPOBJ2FOUND) AND ( NOT STRANDEDPPFOUND) AND ( NOT PREPREPOBJRELFOUND)                               
THEN result:=TRUE;IF result THEN
BEGIN
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
                                                      END;VP_15:=result;
END;
                                                      FUNCTION VP_16
(VAR rec:VPtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
( NOT STRANDEDPPFOUND)                                
THEN result:=TRUE;IF result THEN
BEGIN
END;
                                                      END;VP_16:=result;
END;
                                                      FUNCTION VP_17
(VAR rec:VPtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
END;
                                                      END;VP_17:=result;
END;
                                                      FUNCTION VP_18
(VAR rec:VPtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
HEADMODUSVAR:=
b^.ls^.VERBfield^.MODUS;
                                                      MODUSVAR:=
b^.ls^.VERBfield^.MODUS;
                                                      HEADSTATUSVAR:=
b^.ls^.VERBfield^.STATUS;
                                                       IF (
b^.ls^.VERBfield^.EORENFORM IN [EFORM,ENFORM])
THEN
EORENPARTICIPLEFOUND:=TRUE;
                                                      END;
                                                      END;VP_18:=result;
END;
                                                      FUNCTION VP_19
(VAR rec:VPtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
((
b^.ls^.VERBfield^.SUBC<>ZIJNAUX) OR (HEADSTATUSVAR=AANHETV)) AND ( NOT EORENPARTICIPLEFOUND)             
THEN result:=TRUE;IF result THEN
BEGIN
PROGAUXMODUSVAR:=
b^.ls^.VERBfield^.MODUS;
                                                      MODUSVAR:=
b^.ls^.VERBfield^.MODUS;
                                                      END;
                                                      END;VP_19:=result;
END;
                                                      FUNCTION VP_20
(VAR rec:VPtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
(MODUSVAR=PASTPART) AND ( NOT EORENPARTICIPLEFOUND)   
THEN result:=TRUE;IF result THEN
BEGIN
MODUSVAR:=
b^.ls^.VERBfield^.MODUS;
                                                      END;
                                                      END;VP_20:=result;
END;
                                                      FUNCTION VP_21
(VAR rec:VPtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
( NOT PREPOBJ2FOUND)                                  
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
                                                      END;VP_21:=result;
END;
                                                      FUNCTION VP_22
(VAR rec:VPtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
( NOT PREPOBJ2FOUND) AND ( NOT EORENPARTICIPLEFOUND)  
THEN result:=TRUE;IF result THEN
BEGIN
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
                                                      END;VP_22:=result;
END;
                                                      FUNCTION VP_23
(VAR rec:VPtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
( NOT EORENPARTICIPLEFOUND)                           
THEN result:=TRUE;IF result THEN
BEGIN
END;
                                                      END;VP_23:=result;
END;
                                                      FUNCTION VP_24
(VAR rec:VPtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
ARGRELFOUND:=TRUE;
                                                      END;
                                                      END;VP_24:=result;
END;
                                                      FUNCTION VP_25
(VAR rec:VPtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
END;
                                                      END;VP_25:=result;
END;
                                                      FUNCTION VP_26
(VAR rec:VPtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
END;
                                                      END;VP_26:=result;
END;
                                                      FUNCTION VP_27
(VAR rec:VPtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
( NOT DOORBYRELFOUND) AND ( NOT DOORBYFOUND)          
THEN result:=TRUE;IF result THEN
BEGIN
DOORBYRELFOUND:=TRUE;
                                                      END;
                                                      END;VP_27:=result;
END;
                                                      FUNCTION VP_28
(VAR rec:VPtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
END;
                                                      END;VP_28:=result;
END;
                                                      FUNCTION VP_29
(VAR rec:VPtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
(HEADSTATUSVAR=AANHETV) AND ( NOT EORENPARTICIPLEFOUND)                                                     
THEN result:=TRUE;IF result THEN
BEGIN
PROGAUXMODUSVAR:=
b^.ls^.VERBfield^.MODUS;
                                                      MODUSVAR:=
b^.ls^.VERBfield^.MODUS;
                                                      END;
                                                      END;VP_29:=result;
END;
                                                      FUNCTION VP_30
(VAR rec:VPtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
((HEADMODUSVAR=PASTPART) OR ((HEADSTATUSVAR=AANHETV) AND (PROGAUXMODUSVAR=PASTPART))) AND ( NOT 
EORENPARTICIPLEFOUND)                                 
THEN result:=TRUE;IF result THEN
BEGIN
MODUSVAR:=
b^.ls^.VERBfield^.MODUS;
                                                      END;
                                                      END;VP_30:=result;
END;
                                                      FUNCTION VP_31
(VAR rec:VPtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
(PREPREPOBJRELFOUND OR AANOBJRELFOUND OR VOOROBJRELFOUND) AND (( NOT IONPFOUND) OR (VRIONPFOUND
))                                                    
THEN result:=TRUE;IF result THEN
BEGIN
ARGRELFOUND:=TRUE;
                                                      END;
                                                      END;VP_31:=result;
END;
                                                      FUNCTION VP_32
(VAR rec:VPtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
IONPFOUND:=TRUE;
                                                      VRIONPFOUND:=TRUE;
                                                      END;
                                                      END;VP_32:=result;
END;
                                                      FUNCTION VP_33
(VAR rec:VPtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
TRUE                                                  
THEN result:=TRUE;IF result THEN
BEGIN
VROBJFOUND:=TRUE;
                                                      END;
                                                      END;VP_33:=result;
END;
                                                      FUNCTION VP_34
(VAR rec:VPtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
( NOT PREPREPOBJRELFOUND)                             
THEN result:=TRUE;IF result THEN
BEGIN
END;
                                                      END;VP_34:=result;
END;
                                                      FUNCTION VP_35
(VAR rec:VPtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
( NOT PREPREPOBJRELFOUND)                             
THEN result:=TRUE;IF result THEN
BEGIN
END;
                                                      END;VP_35:=result;
END;
                                                      FUNCTION VP_36
(VAR rec:VPtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
( NOT ARGRELFOUND) AND ( NOT VRIONPFOUND) AND ( NOT VROBJFOUND)                                           
THEN result:=TRUE;IF result THEN
BEGIN
END;
                                                      END;VP_36:=result;
END;
                                                      FUNCTION VP_37
(VAR rec:VPtyp;{VAR synrel:LSDOMAINT_synrel;}b:LSSTREE_pstree):BOOLEAN;
VAR result:BOOLEAN;
BEGIN WITH rec^ DO BEGIN result:=FALSE;IF 
(PREPREPOBJRELFOUND OR AANOBJRELFOUND OR VOOROBJRELFOUND) AND (( NOT IONPFOUND) OR (VRIONPFOUND
))                                                    
THEN result:=TRUE;IF result THEN
BEGIN
ARGRELFOUND:=TRUE;
                                                      END;
                                                      END;VP_37:=result;
END;
                                                       FUNCTION comp_VP(rec1,rec2:VPtyp):BOOLEAN;
BEGIN WITH rec1^ DO comp_VP:=
(AANOBJRELFOUND=rec2^.AANOBJRELFOUND) AND
(ARGRELFOUND=rec2^.ARGRELFOUND) AND
(DOORBYFOUND=rec2^.DOORBYFOUND) AND
(DOORBYRELFOUND=rec2^.DOORBYRELFOUND) AND
(EORENPARTICIPLEFOUND=rec2^.EORENPARTICIPLEFOUND) AND
(HEADMODUSVAR=rec2^.HEADMODUSVAR) AND
(HEADSTATUSVAR=rec2^.HEADSTATUSVAR) AND
(IONPFOUND=rec2^.IONPFOUND) AND
(MODUSVAR=rec2^.MODUSVAR) AND
(PREPOBJ1FOUND=rec2^.PREPOBJ1FOUND) AND
(PREPOBJ2FOUND=rec2^.PREPOBJ2FOUND) AND
(PREPREPOBJRELFOUND=rec2^.PREPREPOBJRELFOUND) AND
(PROGAUXMODUSVAR=rec2^.PROGAUXMODUSVAR) AND
(STRANDEDPPFOUND=rec2^.STRANDEDPPFOUND) AND
(VOOROBJRELFOUND=rec2^.VOOROBJRELFOUND) AND
(VRIONPFOUND=rec2^.VRIONPFOUND) AND
(VROBJFOUND=rec2^.VROBJFOUND)
END;
