(*MPM:::===================================================================*
 *
 *  Rosetta Project                                                 
 *                                                                  
 *  Module Title    : GSEGM 
 *  Creation date   :                                               
 *  Author          :                                               
 *                                                                  
 *  Copyright (c) 1985, by Nederlandse Philips Bedrijven BV.        
 *                                                                  
 *  Remarks         :  
 *
 *EMP:::===================================================================*)

Export(GSEGM);
pragma C_include('gsegmrules.pf');
pragma C_include('segmrules.pf');
pragma C_include('string.pf');
pragma C_include('config.pf');
pragma C_include('limorfdef.pf');
pragma C_include('ldmorfdef.pf');
pragma C_include('ldmdict.pf');
pragma C_include('globdef.pf');
pragma C_include('interface8.pf');
pragma C_include('interface7.pf');
pragma C_include('interface1.pf');
pragma C_include('debug.pf');
pragma C_include('gsegm.pf');

(*=========================================================================*
 *  Imported modules
 *=========================================================================*)
PROGRAM GSEGM;
WITH GSEGMRULES, SEGMRULES, STRNG, CONFIG, LIMORFDEF, LDMORFDEF, LDMDICT,
     GLOBDEF, INTERFACE8, INTERFACE7, INTERFACE1, DEBUG;

CONST

   (*----------------------------------------------------------------------*
    * MAXSEGMENTATION can be removed as soon as we have regular expressions
    *----------------------------------------------------------------------*)
   MAXSEGMENTATION   = 3;

   LIMORFDEF_GLUEkey = 1;

VAR
   Num            : integer;
   SegmentCounter : integer;
   WordAmbId      : INTERFACE1_WordAmbIdType;

(*-------------------------------------------------------------------------*
 * Local functions for datastructure manipulation
 *-------------------------------------------------------------------------*)

(*-------------------------------------------------------------------------*
 * AddSegmResults connects two chains of the specified type together. Para-
 * meter "seg1" should point to the shortest chain.     
 *-------------------------------------------------------------------------*)
FUNCTION AddSegmResults(seg1, seg2: INTERFACE8_pSeqWords): INTERFACE8_pSeqWords;

BEGIN
   AddSegmResults := seg1;
   IF seg1 = nil THEN
      AddSegmResults := seg2
   ELSE IF seg2 <> nil THEN BEGIN
      WHILE seg1^.nxtamb <> nil DO seg1 := seg1^.nxtamb;
      seg1^.nxtamb := seg2
   END
END {AddSegmResults};

(*-------------------------------------------------------------------------*
 * AddGlueResults connects two chains of the specified type together. Para-
 * meter "seg1" should point to the shortest chain.     
 *-------------------------------------------------------------------------*)
FUNCTION AddGlueResults(seg1, seg2: SEGMRULES_pGlueRuleResult): SEGMRULES_pGlueRuleResult;

BEGIN
   AddGlueResults := seg1;
   IF seg1 = nil THEN
      AddGlueResults := seg2
   ELSE IF seg2 <> nil THEN BEGIN
      WHILE seg1^.nxtamb <> nil DO seg1 := seg1^.nxtamb;
      seg1^.nxtamb := seg2
   END
END {AddGlueResults};


(*-------------------------------------------------------------------------*
 * AddLayResults connects two chains of the specified type together. Para-
 * meter "seg1" should point to the shortest chain.     
 *-------------------------------------------------------------------------*)
FUNCTION AddLayResults(s1, s2: INTERFACE8_pSeqWords): INTERFACE8_pSeqWords;

BEGIN
   AddLayResults := s1;
   IF s1 = nil THEN
      AddLayResults := s2
   ELSE IF s2 <> nil THEN BEGIN
      WHILE s1^.nxtamb <> nil DO s1 := s1^.nxtamb;
      s1^.nxtamb := s2
   END
END {AddLayResults};


(*-------------------------------------------------------------------------*
 * Local functions for formalism implementation     
 *-------------------------------------------------------------------------*)

FUNCTION GDSEGM(r  : INTERFACE7_RowSeqSegmKeys; 
                rn : INTERFACE8_pSeqWords): INTERFACE8_pSeqWords;
VAR
   a     : STRING_String;
   CC    : LIMORFDEF_ContextConds;
   FON   : LIMORFDEF_pPhonInfo;
   status: BOOLEAN;
   where : LDMDICT_WhereType;
   result: INTERFACE8_pSeqWords;

BEGIN
   DEBUG_WriteStr('-> GDSEGM ',DEBUG_MaxIO,0,TRUE);
   Debug_WriteLine(TRUE);

   DEBUG_Set(0, true);
 
   result := NIL;
   STRING_ConstantEmpty(a);

   IF ( r.fseq = r.lseq ) THEN BEGIN 
      DEBUG_WriteStr('looking for key: ',DEBUG_MaxIO,0,TRUE);
      DEBUG_WriteInteger(r.fseq^.KEY, 5, TRUE);
      DEBUG_WriteStr(' type: ',DEBUG_MaxIO,0,TRUE);
      DEBUG_WriteInteger(ord(r.fseq^.keykind), 5, TRUE);
      Debug_WriteLine(TRUE);
      status := LDMDICT_GetGMDict(a, r.fseq^.keykind, CC, FON, where, r.fseq^.KEY);

      REPEAT
	 IF status THEN BEGIN
            IF NOT (where = OnlyAn) THEN BEGIN
   	       result := INTERFACE8_MakeSeqWords(a, result);
	       Num := Num + 1;
               WordAmbid               := WordAmbid + 1;
	       result^.f               := FON;
	       result^.CC              := CC;
	       result^.rn              := rn;
               result^.ambid           := WordAmbid;
            END;
	    status := LDMDICT_GetNextGMDict(a, r.fseq^.keykind, CC, FON, 
                                            where, r.fseq^.KEY);
	 END;
      UNTIL not status;
   END;
   GDSEGM := result;

   DEBUG_Set(0, false);


   DEBUG_WriteStr('<- GDSEGM ',DEBUG_MaxIO,0,TRUE);
   DEBUG_WriteString(a,Debug_MaxIO,TRUE);
   Debug_WriteLine(TRUE);

END {GDSEGM};


(*-------------------------------------------------------------------------*
 * Suffix segmentation function     
 *-------------------------------------------------------------------------*)
FUNCTION GRSEGM(Rin: INTERFACE7_RowSeqSegmKeys; 
                rn : INTERFACE8_pSeqWords): INTERFACE8_pSeqWords;

   (*----------------------------------------------------------------------*
    * Suffix processing by means of a recursive suffix table
    *----------------------------------------------------------------------*)
    FUNCTION GRSEGMRT(Rin  : INTERFACE7_RowSeqSegmKeys): INTERFACE8_pSeqWords;

    VAR result : INTERFACE8_pSeqWords;
        RS,r   : SEGMRULES_pSFruleResult;
        SS,s   : INTERFACE8_pSeqWords;
        F      : LIMORFDEF_pPhonInfo;
        Rout   : INTERFACE7_RowSeqSegmKeys;           
    BEGIN
       result := nil; 
       IF ( Rin.lseq^.keykind = SFKtype ) and (Rin.fseq <> Rin.lseq) THEN BEGIN
          Rout := Rin; Rout.lseq := Rout.lseq^.prvseg;
          SS := GRSEGM(Rout, rn); s := SS;
	  WHILE s <> nil DO BEGIN
	     RS := GSEGMRULES_GSuffixTableHandler(s^.word, Rin.lseq^.SFK); r := RS;
	     WHILE r <> nil DO BEGIN      
                DEBUG_WriteString(r^.a,Debug_MaxIO,TRUE);
                Debug_WriteLine(TRUE);
		F := LDMORFDEF_FonSwitch(r^.FON, s^.f); 
		IF F <> nil THEN BEGIN
                   result        := INTERFACE8_MakeSeqWords(r^.a, result);
                   WordAmbid     := WordAmbid + 1;
		   result^.f     := F;
	           result^.CC    := r^.CC;
	           result^.rn    := rn;
                   result^.ambid := WordAmbid;
		END;
		r := r^.nxtamb
	     END;
	     s := s^.nxtamb
	  END;
       END;    
       GRSEGMRT := result
    
    END {GRSEGMRT};

BEGIN 
   DEBUG_WriteStr('-> GRSEGM ',DEBUG_MaxIO,0,TRUE);
   Debug_WriteLine(TRUE);

   GRSEGM := AddSegmResults(GRSEGMRT(Rin),
                            GDSEGM(Rin, rn));

   DEBUG_WriteStr('<- GRSEGM ',DEBUG_MaxIO,0,TRUE);
   Debug_WriteLine(TRUE);
END {GRSEGM};



(*-------------------------------------------------------------------------*
 * Prefix segmentation function     
 *-------------------------------------------------------------------------*)
FUNCTION GLSEGM(Rin  : INTERFACE7_RowSeqSegmKeys;
                rn   : INTERFACE8_pSeqWords): INTERFACE8_pSeqWords;

   (*----------------------------------------------------------------------*
    * Prefix processing by means of a recursive prefix table
    *----------------------------------------------------------------------*)
    FUNCTION GLSEGMRT(Rin: INTERFACE7_RowSeqSegmKeys): INTERFACE8_pSeqWords;

    VAR result : INTERFACE8_pSeqWords;
        Rout   : INTERFACE7_RowSeqSegmKeys;
        RS,r   : SEGMRULES_pPFruleResult;
        SS,s   : INTERFACE8_pSeqWords;
        F      : LIMORFDEF_pPhonInfo;
    
    BEGIN
       result := nil; 
       IF ( Rin.fseq^.keykind = PFKtype ) and (Rin.fseq <> Rin.lseq) THEN BEGIN
          Rout := Rin; Rout.fseq := Rout.fseq^.nxtseg;
          SS := GLSEGM(Rout, rn); s := SS;
	  WHILE s <> nil DO BEGIN
	     RS := GSEGMRULES_GPrefixTableHandler(s^.word, Rin.fseq^.PFK); r := RS;
	     WHILE r <> nil DO BEGIN      
		F := LDMORFDEF_FonSwitch(r^.FON, s^.f);
		IF F <> nil THEN BEGIN
                   result        := INTERFACE8_MakeSeqWords(r^.a, result);
                   WordAmbid     := WordAmbid + 1;
		   result^.f     := F;
	           result^.CC    := s^.CC;
	           result^.rn    := rn;
                   result^.ambid := WordAmbid;
                END;
		r := r^.nxtamb
	     END;
	     s := s^.nxtamb
	  END;
       END;
       GLSEGMRT := result
    
    END {GLSEGMRT};


BEGIN 
   DEBUG_WriteStr('-> GLSEGM ',DEBUG_MaxIO,0,TRUE);
   Debug_WriteLine(TRUE);

   GLSEGM := AddSegmResults(GLSEGMRT(Rin),
                            GRSEGM(Rin, rn));

   DEBUG_WriteStr('<- GLSEGM ',DEBUG_MaxIO,0,TRUE);
   Debug_WriteLine(TRUE);
END {GLSEGM};



(*-------------------------------------------------------------------------*
 * Compound function     
 *-------------------------------------------------------------------------*)
FUNCTION GCOMP(Rin  : INTERFACE7_RowSeqSegmKeys;
               rn   : INTERFACE8_pSeqWords): INTERFACE8_pSeqWords;
VAR
   stemfound        : BOOLEAN;
   Result,
   SS1, SS2         : INTERFACE8_pSeqWords;
   Rout             : INTERFACE7_RowSeqSegmKeys;
   s                : INTERFACE7_pSeqSegmKeys;


   PROCEDURE Connect(s1,s2: INTERFACE8_pSeqWords;
                     VAR r: INTERFACE8_pSeqWords);
   VAR
      ns  : String_String;
      len : INTEGER;
      ch  : CHAR;
   BEGIN
      r := NIL;
      WHILE s2 <> NIL DO BEGIN
          WHILE s1 <> NIL DO BEGIN
             String_ExtractChar(ch, s1^.word, String_Length(s1^.word));
             IF ch = '¢' THEN BEGIN 
                STRING_ExtractBegin(s1^.word, s1^.word, 
                                    String_Length(s1^.word)-1);
                STRING_ConCat(ns, s1^.word, s2^.word);
                r := INTERFACE8_MakeSeqWords(ns, r);
                r^.f       := s1^.f;
                r^.ambid   := WordAmbid;
                r^.rn      := rn;
                r^.CC      := s2^.CC;
                s1 := s1^.nxtamb
             END
          END;
          s2 := s2^.nxtamb
      END;
   END {Connect};


BEGIN
   DEBUG_WriteStr('-> GCOMP ',DEBUG_MaxIO,0,TRUE);
   Debug_WriteLine(TRUE);

   IF Config_GluedCompounds THEN BEGIN
      s := Rin.lseq; Result := NIL;
      stemfound := FALSE;
      {suffixes}
      WHILE (s^.keykind = SFKtype) AND NOT (s=Rin.fseq) DO s := s^.prvseg;
      {one stem}
      IF (s^.keykind = BAStype) THEN BEGIN s := s^.prvseg; stemfound := TRUE END;
      {prefixes}
      WHILE (s^.keykind = PFKtype) AND NOT (s=Rin.lseq) DO s := s^.prvseg;
      IF stemfound THEN s := s^.nxtseg;
      IF s = Rin.fseq THEN BEGIN
	 Rout := Rin;
	 SS2 := GLSEGM(Rout, rn);
	 Result := SS2;
	 END
      ELSE BEGIN
	 Rout := Rin;
	 Rout.fseq := s;
	 SS2 := GLSEGM(Rout, rn);
	 IF SS2 <> NIL THEN BEGIN
	    Rout := Rin;
	    Rout.lseq := s^.prvseg; Rout.fseq^.prvseg := Rout.lseq;
	    Rout.lseq^.nxtseg := Rout.fseq;
	    SS1 := GComp(Rout, rn);
	    Connect(SS1, SS2, Result);
	 END
      END;
      END
   ELSE BEGIN
      Result := GLSEGM(Rin, rn)
   END;
   GComp := Result;
   DEBUG_WriteStr('<- GCOMP ',DEBUG_MaxIO,0,TRUE);
   Debug_WriteLine(TRUE);
END {GComp};


(*-------------------------------------------------------------------------*
 * Splitting a word into parts by means of GLUE tables
 *-------------------------------------------------------------------------*)
FUNCTION GGLUE(VAR Rin     : INTERFACE7_pRowSeqSegmKeys; 
               trailer     : INTERFACE7_pRowSeqSegmKeys;
               rn          : INTERFACE8_pSeqWords): INTERFACE8_pSeqWords;

VAR
   Args   : SEGMRULES_GlueConstituentType;
   i      : INTEGER;
   Q      : ARRAY [1..LIMORFDEF_maxsplitfactor] of INTERFACE8_pSeqWords;
   wr, 
   ambs   : INTERFACE7_pRowSeqSegmKeys;
   NoGlues: BOOLEAN;
   result : INTERFACE8_pSeqWords;

   FUNCTION ApplyGlueRules(s    : INTERFACE8_pSeqWords;
                           VAR VARArgs : SEGMRULES_GlueConstituentType;
                           j    : INTEGER;
                           CC   : LIMORFDEF_ContextConds;
                           F    : LIMORFDEF_pPhonInfo;
                           Arity: INTEGER;
                           rn   : INTERFACE8_pSeqWords): INTERFACE8_pSeqWords;
   VAR
      RS, r  : SEGMRULES_pGlueRuleResult;
      result : INTERFACE8_pSeqWords;
      Args: SEGMRULES_GlueConstituentType;
   BEGIN
      DEBUG_WriteStr('-> ApplyGlueRules',DEBUG_MaxIO,0,TRUE);
      DEBUG_WriteInteger(j, 5, TRUE);
      DEBUG_WriteInteger(Arity, 5, TRUE);
      Debug_WriteLine(TRUE);
      Args := VARArgs;
      result := NIL;
      IF j = 0 THEN BEGIN
         DEBUG_WriteStr('-> Applying the Rules',DEBUG_MaxIO,0,TRUE);
         Debug_WriteLine(TRUE);
         RS := AddGlueResults(GSEGMRULES_GLGLUE(Arity, Args),
               AddGlueResults(GSEGMRULES_GRGLUE(Arity, Args),
                              GSEGMRULES_GMGLUE(Arity, Args)));
         r := RS; 
         WHILE r <> NIL DO BEGIN
            DEBUG_WriteStr('-> Result: ',DEBUG_MaxIO,0,TRUE);
            DEBUG_WriteString(r^.a,Debug_MaxIO,TRUE);
            Debug_WriteLine(TRUE);
            result := INTERFACE8_MakeSeqWords(r^.a, result);
            WordAmbid := WordAmbid + 1;
            result^.rn := rn;
            result^.CC := CC;
            result^.f  := F;
            result^.ambid := WordAmbid;
            r := r^.nxtamb   
         END;                  
         END
      ELSE BEGIN
         WHILE s <> nil DO BEGIN
            IF s^.CC = LICC0 THEN DEBUG_WriteStr('Is LICC0',DEBUG_MaxIO,0,TRUE);
            IF s^.CC <> LICC0 THEN DEBUG_WriteStr('Is not LICC0',DEBUG_MaxIO,0,TRUE);
            Debug_WriteLine(TRUE);
            IF (( j <> 0 ) AND ( s^.CC = LICC0 )) OR ( j = 0) THEN BEGIN
               Args[Arity-j+1]  := s^.word;
               DEBUG_WriteString(Args[Arity-j+1],Debug_MaxIO,TRUE);
               Debug_WriteLine(TRUE);
               IF j = Arity THEN F  := s^.f;
               IF j = 1     THEN BEGIN
                  rn := s^.rn;
                  CC := s^.CC;
                  result := AddSegmResults( ApplyGlueRules( NIL, Args, 
                                                            j-1, CC, F, Arity,
                                                            rn),
                                            result); 
                  END
               ELSE BEGIN
                  result := AddSegmResults( ApplyGlueRules( Q[j-1], Args, 
                                                            j-1, CC, F, Arity, 
                                                            NIL),
                                            result); 
               END
            END;
            s := s^.nxtamb
         END;
      END;
      ApplyGlueRules := result;
      DEBUG_WriteStr('<- ApplyGlueRules',DEBUG_MaxIO,0,TRUE);
      Debug_WriteLine(TRUE);
   END {ApplyGlueRules};

BEGIN
   DEBUG_WriteStr('-> GGLUE',DEBUG_MaxIO,0,TRUE);
   Debug_WriteLine(TRUE);

   wr := Rin; i := 0; NoGlues := FALSE;
   REPEAT 
      ambs := wr; 
      i := i+1;
      Q[i] := NIL;
      WHILE ambs <> nil DO BEGIN
         WordAmbid := 0;
         rn := ambs^.rn^.result;
         Q[i] := AddSegmResults(GCOMP(ambs^, rn), Q[i]);
         ambs := ambs^.nxtamb
      END;
      wr^.result := Q[i];
      wr := wr^.prv;
      IF wr = trailer THEN BEGIN
         NoGlues := TRUE
         END
      ELSE IF wr^.fseq^.keykind = GLUtype THEN BEGIN
         wr := wr^.prv
         END
      ELSE BEGIN
         NoGlues := TRUE
      END;
   UNTIL NoGlues;

   (*----------------------------------------------------------------------*
    * The last evaluated node is wr^.nxt !
    *----------------------------------------------------------------------*)

   IF i > 1 THEN BEGIN
      result := ApplyGlueRules(Q[i], Args, i, LICC0, NIL, i, NIL);
      wr^.nxt^.result := result;
      END
   ELSE BEGIN
      result := Q[1];
   END;
   Rin := wr;
   GGLUE := result;

   DEBUG_WriteStr('<- GGLUE',DEBUG_MaxIO,0,TRUE);
   Debug_WriteLine(TRUE);
END {GGLUE};



(*-------------------------------------------------------------------------*
 * AGLUEplus calls the segmentation for each individual word and
 * checks whether the CC's of the results match with the phonetic
 * information of the successors
 *-------------------------------------------------------------------------*)
PROCEDURE GGLUEplus(w               : INTERFACE7_pRowSeqSegmKeys;
                    VAR status      : BOOLEAN;
                    VAR result      : INTERFACE8_pSeqWords);

VAR
   cw,
   cwamb      : INTERFACE7_pRowSeqSegmKeys;    
   trailer,
   rn,
   rnamb,
   cur,
   curamb     : INTERFACE8_pSeqWords;
   FONtrailer : LIMORFDEF_pPhonInfo;
   EmptyString: STRING_String;

BEGIN
   DEBUG_WriteStr('-> AGLUE+',DEBUG_MaxIO,0,TRUE);
   Debug_WriteLine(TRUE);
   STRING_ConstantEmpty(EmptyString);
   cw             := w^.prv;
   FONtrailer     := nil;
   trailer        := INTERFACE8_MakeSeqWords(EmptyString, NIL);
   trailer^.f     := FONtrailer;
   cw^.result     := trailer;
   cw             := cw^.prv;
   status         := true;

   rn := trailer;
   REPEAT
      cur := GGLUE(cw, w^.prv, rn);
    
      IF cur <> nil THEN BEGIN
         DEBUG_WriteStr('result from GGLUE',DEBUG_MaxIO,0,TRUE);   
         Debug_WriteLine(TRUE);
	 (*----------------------------------------------------------------*
	  * First Check all context conditions of all ambiguous segmentations
	  * with all possible successors. 
	  *----------------------------------------------------------------*)

	 curamb := cur;
	 status := false;
	 WHILE curamb <> nil DO BEGIN
	    rnamb := curamb^.rn;
            DEBUG_WriteStr('Checking context of :',DEBUG_MaxIO,0,TRUE);   
            DEBUG_WriteInteger(curamb^.ambid, 5, TRUE);
            Debug_WriteLine(TRUE);
	    WHILE rnamb <> nil DO BEGIN
	       IF not LDMORFDEF_CCSwitch(curamb^.CC, rnamb^.f) THEN BEGIN
                  DEBUG_WriteStr('In correct right context :',DEBUG_MaxIO,0,TRUE);   
                  DEBUG_WriteInteger(rnamb^.ambid, 5, TRUE);
                  Debug_WriteLine(TRUE);
		  curamb^.nonsucc := curamb^.nonsucc + [rnamb^.ambid]
		  END
	       ELSE BEGIN
		  status := true
	       END;
	       rnamb := rnamb^.nxtamb;
	    END;
	    curamb := curamb^.nxtamb
	 END;

         IF status THEN BEGIN
            DEBUG_WriteStr('At least one correct CC',DEBUG_MaxIO,0,TRUE);   
            Debug_WriteLine(TRUE);
            END
         ELSE BEGIN
            DEBUG_WriteStr('No correct CC',DEBUG_MaxIO,0,TRUE);   
            Debug_WriteLine(TRUE);
         END;
	 (*----------------------------------------------------------------*
	  * If status is still FALSE it means that all context conditions
	  * with possible successors failed.
	  *----------------------------------------------------------------*)

	 cur^.nxt   := rn;
	 rn^.prv    := cur;
	 rn         := cur;
         trailer^.nxt := cur;
         cur^.prv   := trailer;
         END
      ELSE BEGIN
         DEBUG_WriteStr('No result from GGLUE',DEBUG_MaxIO,0,TRUE);   
         Debug_WriteLine(TRUE);
         status   := false
      END;
   UNTIL (cw = w^.prv) or (status = false);

   IF status <> false THEN BEGIN
      result := cur;
      DEBUG_WriteStr('-> GGLUE+ not NIL',DEBUG_MaxIO,0,TRUE);
      END
   ELSE BEGIN
      result := NIL;
      DEBUG_WriteStr('-> GGLUE+ NIL',DEBUG_MaxIO,0,TRUE);
   END;
   Debug_WriteLine(TRUE);
            
END {GGLUEplus};



PROCEDURE GWLAYOUT(VAR sw: INTERFACE8_pSeqWords);

VAR 
   passfirst,
   nfirst,
   first,
   last   : BOOLEAN;
   r,s    : INTERFACE8_pSeqWords;

BEGIN
   DEBUG_WriteStr('-> GWLAYOUT',DEBUG_MaxIO,0,TRUE);
   Debug_WriteLine(TRUE);

   r := sw; passfirst := FALSE;
   REPEAT
      s := r;
      IF passfirst THEN BEGIN
         first := TRUE;
         passfirst := FALSE
         END
      ELSE first :=  r = sw;
      last  :=  s^.rn = sw^.prv;
      WHILE s <> NIL DO BEGIN
         nfirst := first;
         LDMORFDEF_GWLayoutSwitch(s^.word, nfirst, last);
         IF nfirst AND (nfirst = first) THEN passfirst := TRUE;
         s := s^.nxtamb;
      END;
      r := r^.nxt;
   UNTIL r = sw;
   
   DEBUG_WriteStr('<- GWLAYOUT',DEBUG_MaxIO,0,TRUE);
   Debug_WriteLine(TRUE);

END {GWLAYOUT};



(*-------------------------------------------------------------------------*
 * 
 *-------------------------------------------------------------------------*)

FUNCTION GSEGM_GSEGMENTATION(sw: INTERFACE7_pRowSeqSegmKeys):
                                      INTERFACE8_pSeqWords;

VAR 
   result      : INTERFACE8_pSeqWords;
   status      : BOOLEAN;

BEGIN
   DEBUG_WriteStr('-> GSEGMENTATION',DEBUG_MaxIO,0,TRUE);
   Debug_WriteLine(TRUE);

   result := NIL;

   IF sw <> NIL THEN BEGIN
      GGLUEplus(sw, status, result);
      IF result <> NIL THEN GWLAYOUT(result);
   END;

   GSEGM_GSEGMENTATION := result;

   DEBUG_WriteStr('<- GSEGMENTATION',DEBUG_MaxIO,0,TRUE);
   Debug_WriteLine(TRUE);

END {GSEGM_GSEGMENTATION};

