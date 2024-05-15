pragma c_include('strings.pf');
Export(LDGETKEY);
pragma c_include('listree.pf');
pragma c_include('lsstree.pf');
pragma c_include('lsdomaint.pf');
pragma c_include('ldgetkey.pf');

WITH STRINGS,
     LISTREE,
     LSSTREE,
     LSDOMAINT;

PROGRAM LDGETKEY;

FUNCTION LDGETKEY_Get(s:LISTREE_pStree): INTEGER;
VAR t: LSSTREE_pStree;
BEGIN
   t := LoopHoles.Retype(s,LSSTREE_pStree);
   CASE t^.cat OF
   BADJSUFF: BEGIN
         LDGETKEY_Get := t^.LS^.BADJSUFFfield^.KEY;
      END;
   BADJ: BEGIN
         LDGETKEY_Get := t^.LS^.BADJfield^.KEY;
      END;
   BADVSUFF: BEGIN
         LDGETKEY_Get := t^.LS^.BADVSUFFfield^.KEY;
      END;
   BADV: BEGIN
         LDGETKEY_Get := t^.LS^.BADVfield^.KEY;
      END;
   RADV: BEGIN
         LDGETKEY_Get := t^.LS^.RADVfield^.KEY;
      END;
   ADVPVAR: BEGIN
         LDGETKEY_Get := t^.LS^.ADVPVARfield^.INDEX;
      END;
   ART: BEGIN
         LDGETKEY_Get := t^.LS^.ARTfield^.KEY;
      END;
   BBIGPRO: BEGIN
         LDGETKEY_Get := t^.LS^.BBIGPROfield^.KEY;
      END;
   CONJ: BEGIN
         LDGETKEY_Get := t^.LS^.CONJfield^.KEY;
      END;
   COORD: BEGIN
         LDGETKEY_Get := t^.LS^.COORDfield^.KEY;
      END;
   DEMADJ: BEGIN
         LDGETKEY_Get := t^.LS^.DEMADJfield^.KEY;
      END;
   DEMPRO: BEGIN
         LDGETKEY_Get := t^.LS^.DEMPROfield^.KEY;
      END;
   BDET: BEGIN
         LDGETKEY_Get := t^.LS^.BDETfield^.KEY;
      END;
   DIGIT: BEGIN
         LDGETKEY_Get := t^.LS^.DIGITfield^.KEY;
      END;
   EC: BEGIN
         LDGETKEY_Get := t^.LS^.ECfield^.KEY;
      END;
   EN: BEGIN
         LDGETKEY_Get := t^.LS^.ENfield^.KEY;
      END;
   EMPTY: BEGIN
         LDGETKEY_Get := t^.LS^.EMPTYfield^.KEY;
      END;
   EXCLAM: BEGIN
         LDGETKEY_Get := t^.LS^.EXCLAMfield^.KEY;
      END;
   BINDEFPRO: BEGIN
         LDGETKEY_Get := t^.LS^.BINDEFPROfield^.KEY;
      END;
   NEG: BEGIN
         LDGETKEY_Get := t^.LS^.NEGfield^.KEY;
      END;
   NEGVAR: BEGIN
         LDGETKEY_Get := t^.LS^.NEGVARfield^.KEY;
      END;
   BNOUNSUFF: BEGIN
         LDGETKEY_Get := t^.LS^.BNOUNSUFFfield^.KEY;
      END;
   BNOUN: BEGIN
         LDGETKEY_Get := t^.LS^.BNOUNfield^.KEY;
      END;
   NUM: BEGIN
         LDGETKEY_Get := t^.LS^.NUMfield^.KEY;
      END;
   ORDINAL: BEGIN
         LDGETKEY_Get := t^.LS^.ORDINALfield^.KEY;
      END;
   PART: BEGIN
         LDGETKEY_Get := t^.LS^.PARTfield^.KEY;
      END;
   BPERSPRO: BEGIN
         LDGETKEY_Get := t^.LS^.BPERSPROfield^.KEY;
      END;
   POS: BEGIN
         LDGETKEY_Get := t^.LS^.POSfield^.KEY;
      END;
   POSVAR: BEGIN
         LDGETKEY_Get := t^.LS^.POSVARfield^.KEY;
      END;
   SUBPREP: BEGIN
         LDGETKEY_Get := t^.LS^.SUBPREPfield^.KEY;
      END;
   PREP: BEGIN
         LDGETKEY_Get := t^.LS^.PREPfield^.KEY;
      END;
   PREPPVAR: BEGIN
         LDGETKEY_Get := t^.LS^.PREPPVARfield^.INDEX;
      END;
   BPROPERNOUN: BEGIN
         LDGETKEY_Get := t^.LS^.BPROPERNOUNfield^.KEY;
      END;
   PUNC: BEGIN
         LDGETKEY_Get := t^.LS^.PUNCfield^.KEY;
      END;
   PROSENT: BEGIN
         LDGETKEY_Get := t^.LS^.PROSENTfield^.KEY;
      END;
   PROSENTVAR: BEGIN
         LDGETKEY_Get := t^.LS^.PROSENTVARfield^.INDEX;
      END;
   Q: BEGIN
         LDGETKEY_Get := t^.LS^.Qfield^.KEY;
      END;
   RECIPRO: BEGIN
         LDGETKEY_Get := t^.LS^.RECIPROfield^.KEY;
      END;
   REFLPRO: BEGIN
         LDGETKEY_Get := t^.LS^.REFLPROfield^.KEY;
      END;
   RELANTPRO: BEGIN
         LDGETKEY_Get := t^.LS^.RELANTPROfield^.KEY;
      END;
   RELPRO: BEGIN
         LDGETKEY_Get := t^.LS^.RELPROfield^.KEY;
      END;
   TE: BEGIN
         LDGETKEY_Get := t^.LS^.TEfield^.KEY;
      END;
   THANAS: BEGIN
         LDGETKEY_Get := t^.LS^.THANASfield^.KEY;
      END;
   ADJPPROPVAR: BEGIN
         LDGETKEY_Get := t^.LS^.ADJPPROPVARfield^.INDEX;
      END;
   ADVPPROPVAR: BEGIN
         LDGETKEY_Get := t^.LS^.ADVPPROPVARfield^.INDEX;
      END;
   CLAUSEVAR: BEGIN
         LDGETKEY_Get := t^.LS^.CLAUSEVARfield^.INDEX;
      END;
   CNVAR: BEGIN
         LDGETKEY_Get := t^.LS^.CNVARfield^.INDEX;
      END;
   NPPROPVAR: BEGIN
         LDGETKEY_Get := t^.LS^.NPPROPVARfield^.INDEX;
      END;
   PREPPPROPVAR: BEGIN
         LDGETKEY_Get := t^.LS^.PREPPPROPVARfield^.INDEX;
      END;
   NPVAR: BEGIN
         LDGETKEY_Get := t^.LS^.NPVARfield^.INDEX;
      END;
   SENTENCEVAR: BEGIN
         LDGETKEY_Get := t^.LS^.SENTENCEVARfield^.INDEX;
      END;
   EMPTYVAR: BEGIN
         LDGETKEY_Get := t^.LS^.EMPTYVARfield^.INDEX;
      END;
   VERBPPROPVAR: BEGIN
         LDGETKEY_Get := t^.LS^.VERBPPROPVARfield^.INDEX;
      END;
   BVERBSUFF: BEGIN
         LDGETKEY_Get := t^.LS^.BVERBSUFFfield^.KEY;
      END;
   BVERB: BEGIN
         LDGETKEY_Get := t^.LS^.BVERBfield^.KEY;
      END;
   BWHPRO: BEGIN
         LDGETKEY_Get := t^.LS^.BWHPROfield^.KEY;
      END;
   SFCAT: BEGIN
         LDGETKEY_Get := t^.LS^.SFCATfield^.KEY;
      END;
   PFCAT: BEGIN
         LDGETKEY_Get := t^.LS^.PFCATfield^.KEY;
      END;
   END;
END {LDGETKEY_Get};

PROCEDURE LDGETKEY_Put(VAR s:LISTREE_pStree; k: INTEGER);
VAR t: LSSTREE_pStree;
BEGIN
   t := LoopHoles.Retype(s,LSSTREE_pStree);
   CASE t^.cat OF
   BADJSUFF: BEGIN
         t^.LS^.BADJSUFFfield^.KEY := k;
      END;
   BADJ: BEGIN
         t^.LS^.BADJfield^.KEY := k;
      END;
   BADVSUFF: BEGIN
         t^.LS^.BADVSUFFfield^.KEY := k;
      END;
   BADV: BEGIN
         t^.LS^.BADVfield^.KEY := k;
      END;
   RADV: BEGIN
         t^.LS^.RADVfield^.KEY := k;
      END;
   ADVPVAR: BEGIN
         t^.LS^.ADVPVARfield^.INDEX := k;
      END;
   ART: BEGIN
         t^.LS^.ARTfield^.KEY := k;
      END;
   BBIGPRO: BEGIN
         t^.LS^.BBIGPROfield^.KEY := k;
      END;
   CONJ: BEGIN
         t^.LS^.CONJfield^.KEY := k;
      END;
   COORD: BEGIN
         t^.LS^.COORDfield^.KEY := k;
      END;
   DEMADJ: BEGIN
         t^.LS^.DEMADJfield^.KEY := k;
      END;
   DEMPRO: BEGIN
         t^.LS^.DEMPROfield^.KEY := k;
      END;
   BDET: BEGIN
         t^.LS^.BDETfield^.KEY := k;
      END;
   DIGIT: BEGIN
         t^.LS^.DIGITfield^.KEY := k;
      END;
   EC: BEGIN
         t^.LS^.ECfield^.KEY := k;
      END;
   EN: BEGIN
         t^.LS^.ENfield^.KEY := k;
      END;
   EMPTY: BEGIN
         t^.LS^.EMPTYfield^.KEY := k;
      END;
   EXCLAM: BEGIN
         t^.LS^.EXCLAMfield^.KEY := k;
      END;
   BINDEFPRO: BEGIN
         t^.LS^.BINDEFPROfield^.KEY := k;
      END;
   NEG: BEGIN
         t^.LS^.NEGfield^.KEY := k;
      END;
   NEGVAR: BEGIN
         t^.LS^.NEGVARfield^.KEY := k;
      END;
   BNOUNSUFF: BEGIN
         t^.LS^.BNOUNSUFFfield^.KEY := k;
      END;
   BNOUN: BEGIN
         t^.LS^.BNOUNfield^.KEY := k;
      END;
   NUM: BEGIN
         t^.LS^.NUMfield^.KEY := k;
      END;
   ORDINAL: BEGIN
         t^.LS^.ORDINALfield^.KEY := k;
      END;
   PART: BEGIN
         t^.LS^.PARTfield^.KEY := k;
      END;
   BPERSPRO: BEGIN
         t^.LS^.BPERSPROfield^.KEY := k;
      END;
   POS: BEGIN
         t^.LS^.POSfield^.KEY := k;
      END;
   POSVAR: BEGIN
         t^.LS^.POSVARfield^.KEY := k;
      END;
   SUBPREP: BEGIN
         t^.LS^.SUBPREPfield^.KEY := k;
      END;
   PREP: BEGIN
         t^.LS^.PREPfield^.KEY := k;
      END;
   PREPPVAR: BEGIN
         t^.LS^.PREPPVARfield^.INDEX := k;
      END;
   BPROPERNOUN: BEGIN
         t^.LS^.BPROPERNOUNfield^.KEY := k;
      END;
   PUNC: BEGIN
         t^.LS^.PUNCfield^.KEY := k;
      END;
   PROSENT: BEGIN
         t^.LS^.PROSENTfield^.KEY := k;
      END;
   PROSENTVAR: BEGIN
         t^.LS^.PROSENTVARfield^.INDEX := k;
      END;
   Q: BEGIN
         t^.LS^.Qfield^.KEY := k;
      END;
   RECIPRO: BEGIN
         t^.LS^.RECIPROfield^.KEY := k;
      END;
   REFLPRO: BEGIN
         t^.LS^.REFLPROfield^.KEY := k;
      END;
   RELANTPRO: BEGIN
         t^.LS^.RELANTPROfield^.KEY := k;
      END;
   RELPRO: BEGIN
         t^.LS^.RELPROfield^.KEY := k;
      END;
   TE: BEGIN
         t^.LS^.TEfield^.KEY := k;
      END;
   THANAS: BEGIN
         t^.LS^.THANASfield^.KEY := k;
      END;
   ADJPPROPVAR: BEGIN
         t^.LS^.ADJPPROPVARfield^.INDEX := k;
      END;
   ADVPPROPVAR: BEGIN
         t^.LS^.ADVPPROPVARfield^.INDEX := k;
      END;
   CLAUSEVAR: BEGIN
         t^.LS^.CLAUSEVARfield^.INDEX := k;
      END;
   CNVAR: BEGIN
         t^.LS^.CNVARfield^.INDEX := k;
      END;
   NPPROPVAR: BEGIN
         t^.LS^.NPPROPVARfield^.INDEX := k;
      END;
   PREPPPROPVAR: BEGIN
         t^.LS^.PREPPPROPVARfield^.INDEX := k;
      END;
   NPVAR: BEGIN
         t^.LS^.NPVARfield^.INDEX := k;
      END;
   SENTENCEVAR: BEGIN
         t^.LS^.SENTENCEVARfield^.INDEX := k;
      END;
   EMPTYVAR: BEGIN
         t^.LS^.EMPTYVARfield^.INDEX := k;
      END;
   VERBPPROPVAR: BEGIN
         t^.LS^.VERBPPROPVARfield^.INDEX := k;
      END;
   BVERBSUFF: BEGIN
         t^.LS^.BVERBSUFFfield^.KEY := k;
      END;
   BVERB: BEGIN
         t^.LS^.BVERBfield^.KEY := k;
      END;
   BWHPRO: BEGIN
         t^.LS^.BWHPROfield^.KEY := k;
      END;
   SFCAT: BEGIN
         t^.LS^.SFCATfield^.KEY := k;
      END;
   PFCAT: BEGIN
         t^.LS^.PFCATfield^.KEY := k;
      END;
   END;
END {LDGETKEY_Put};
