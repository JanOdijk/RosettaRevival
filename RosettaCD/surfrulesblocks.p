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
