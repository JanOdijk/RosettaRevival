(*MPM:::===================================================================*
 *
 *  Rosetta Project                                                 
 *                                                                  
 *  Module Title    : ASEGM 
 *  Creation date   :                                               
 *  Author          :                                               
 *                                                                  
 *  Copyright (c) 1985, by Nederlandse Philips Bedrijven BV.        
 *                                                                  
 *  Remarks         :  
 *
 *EMP:::===================================================================*)

Export(ASEGM);
pragma C_include('asegmrules.pf');
pragma C_include('segmrules.pf');
pragma C_include('config.pf');
pragma C_include('string.pf');
pragma C_include('log.pf');
pragma C_include('limorfdef.pf');
pragma C_include('ldmorfdef.pf');
pragma C_include('ldmdict.pf');
pragma C_include('globdef.pf');
pragma C_include('interface0.pf');
pragma C_include('interface1.pf');
pragma C_include('debug.pf');
pragma C_include('ldsucc.pf');
pragma C_include('lifixiddict.pf');
pragma C_include('asegm.pf');

(*=========================================================================*
 *  Imported modules
 *=========================================================================*)

PROGRAM ASEGM;
WITH ASEGMRULES, SEGMRULES, CONFIG, STRNG, LOG, LIMORFDEF, LDMORFDEF, 
     LDMDICT, GLOBDEF, INTERFACE0, INTERFACE1, DEBUG, LDSUCC,
     LIFIXIDDICT;

VAR
   FIRSTITEMS     : LDSUCC_ItemSetType;
   LexAccesses    : INTEGER;
   GlobX,
   GlobY,
   GlobLen        : INTEGER;


(*-------------------------------------------------------------------------*
 * Local functions for datastructure manipulation
 *-------------------------------------------------------------------------*)

(*-------------------------------------------------------------------------*
 * AddSegmResults connects two chains of the specified type together. Para-
 * meter "seg1" should point to the shortest chain.     
 *-------------------------------------------------------------------------*)
FUNCTION AddSegmResults(seg1, seg2: INTERFACE1_pRowSeqSegmKeys): INTERFACE1_pRowSeqSegmKeys;

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
FUNCTION AddLayResults(s1, s2: INTERFACE0_pSeqWords): INTERFACE0_pSeqWords;

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
 * SegmBackToSeqSegm adds one segment to the beginning of the sequence of 
 * segments "seq"
 *-------------------------------------------------------------------------*)
PROCEDURE SegmBackToSeqSegm(seg: INTERFACE1_pSeqSegmKeys;
                            seq: INTERFACE1_pRowSeqSegmKeys);

BEGIN
   IF seq^.fseq = nil THEN BEGIN
      seq^.lseq := seg;
      seg^.prvseg := seg;
      seg^.nxtseg := seg;
      END
   ELSE BEGIN
      seq^.lseq^.nxtseg := seg;
      seq^.fseq^.prvseg := seg;
      seg^.prvseg := seq^.lseq;
      seg^.nxtseg := seq^.fseq
   END;   
   seq^.fseq := seg
END {SegmBackToSeqSegm};


(*-------------------------------------------------------------------------*
 * SegmToSeqSegm adds one segment to the end of the sequence of 
 * segments "seq^.fseq"
 *-------------------------------------------------------------------------*)
PROCEDURE SegmToSeqSegm(seq: INTERFACE1_pRowSeqSegmKeys;
                        seg: INTERFACE1_pSeqSegmKeys);

BEGIN
   IF seq^.fseq = nil THEN BEGIN
      seq^.fseq := seg;
      seg^.prvseg := seg;
      seg^.nxtseg := seg;
      END
   ELSE BEGIN
      seq^.lseq^.nxtseg := seg;
      seq^.fseq^.prvseg := seg;
      seg^.prvseg := seq^.lseq;
      seg^.nxtseg := seq^.fseq
   END;
   seq^.lseq := seg
END {SegmToSeqSegm};


(*-------------------------------------------------------------------------*
 * Make functions for local datastructures     
 *-------------------------------------------------------------------------*)
FUNCTION makeGlueSegm: INTERFACE1_pSeqSegmKeys;

VAR r : INTERFACE1_pSeqSegmKeys;

BEGIN
   r := INTERFACE1_MakeSeqSegmStree(NIL);
   WITH r^ DO BEGIN
      nxtamb  := nil;
      rn      := nil;
      prvseg  := nil;
      nxtseg  := nil;
      segkind := keyseg;
      keykind := GLUtype;
   END;
   makeGlueSegm := r
END {makeGlueSegm};


FUNCTION makeBASSegm(s : integer; CONST w: STRING_String): INTERFACE1_pSeqSegmKeys;

VAR r : INTERFACE1_pSeqSegmKeys;

BEGIN
   r := INTERFACE1_MakeSeqSegmStree(NIL);
   WITH r^ DO BEGIN
      nxtamb  := nil;
      rn      := nil;
      prvseg  := nil;
      nxtseg  := nil;
      segkind := keyseg;
      keykind := BAStype;
      KEY     := s;
      word    := w
   END;
   makeBASSegm := r
END {makeBASSegm};


FUNCTION makeSFSegm(s : integer): INTERFACE1_pSeqSegmKeys;

VAR r : INTERFACE1_pSeqSegmKeys;

BEGIN
   r := INTERFACE1_MakeSeqSegmStree(NIL);
   WITH r^ DO BEGIN
      nxtamb  := nil;
      rn      := nil;
      prvseg  := nil;
      nxtseg  := nil;
      segkind := keyseg;
      keykind := SFKtype;
      SFK     := s
   END;
   makeSFSegm := r
END {makeSFSegm};


FUNCTION makePFSegm(s : integer): INTERFACE1_pSeqSegmKeys;

VAR r : INTERFACE1_pSeqSegmKeys;

BEGIN
   r := INTERFACE1_MakeSeqSegmStree(NIL);
   WITH r^ DO BEGIN
      nxtamb  := nil;
      rn      := nil;
      prvseg  := nil;
      nxtseg  := nil;
      segkind := keyseg;
      keykind := PFKtype;
      PFK     := s
   END;
   makePFSegm := r
END {makePFSegm};

(*-------------------------------------------------------------------------*
 * Local functions for formalism implementation     
 *-------------------------------------------------------------------------*)

FUNCTION ADSEGM(CONST a  : STRING_String; 
                rn : INTERFACE1_pRowSeqSegmKeys;
                CONST items : LDSUCC_ItemSetType;
                VAR AmbId : INTERFACE1_WordAmbIdType): INTERFACE1_pRowSeqSegmKeys;
VAR
   r   : INTERFACE1_pRowSeqSegmKeys;
   ch  : char;
   kind: INTERFACE1_KeyType;
   CC  : LIMORFDEF_ContextConds;
   FON : LIMORFDEF_pPhonInfo;
   KEY : INTEGER;
   status: boolean;
   items1: LDSUCC_ItemSetType;
   t1, t2: INTEGER;
   where : LDMDICT_WhereType;

BEGIN
   DEBUG_WriteStr('-> ADSEGM ',DEBUG_MaxIO,0,TRUE);
   Debug_WriteLine(TRUE);

   r := NIL;

   LDSUCC_ReduceItems(LDSUCC_TrailerAffix, items, items1);
   
   IF LDSUCC_StillItems(items1) THEN BEGIN
      t1 := 0{CLOCK};
      status := LDMDICT_GetAMDict(a, kind, CC, FON, where, KEY);
      Lexaccesses := LexAccesses + 1;
      REPEAT
	 IF status THEN BEGIN
            IF NOT (where = OnlyGen) THEN BEGIN
   	       r := INTERFACE1_MakeSRowSeqSegm(r);
   
	       SegmToSeqSegm(r, MakeBasSegm(KEY, a));
   
	       r^.f               := FON;
	       r^.CC              := CC;
	       r^.rn              := rn;
	       r^.fseq^.keykind   := kind;
	       r^.fseq^.word      := a;
               r^.NrStems         := 1;
               Ambid              := Ambid + 1;
               r^.ambid           := Ambid;
               r^.X               := GlobX;
               r^.Y               := GlobY;
               r^.len             := GlobLen;
            END;
	    status := LDMDICT_GetNextAMDict(a, kind, CC, FON, where, KEY);

           LexAccesses := LexAccesses + 1;
	 END;
      UNTIL not status;
      t2 := 0{CLOCK};
      IF Lexaccesses <= 2 THEN LOG_Write('Typical access time:',20,t2-t1);
   END;

   ADSEGM := r;

   DEBUG_WriteStr('<- ADSEGM ',DEBUG_MaxIO,0,TRUE);
   DEBUG_WriteString(a,Debug_MaxIO,TRUE);
   Debug_WriteLine(TRUE);

END {ADSEGM};


(*-------------------------------------------------------------------------*
 * Suffix segmentation function     
 *-------------------------------------------------------------------------*)
FUNCTION ARSEGM(a  : STRING_String; 
                rn : INTERFACE1_pRowSeqSegmKeys;
                items : LDSUCC_ItemSetType;
                VAR AmbId : INTERFACE1_WordAmbIdType): INTERFACE1_pRowSeqSegmKeys;

   (*----------------------------------------------------------------------*
    * Suffix processing by means of a recursive suffix table
    *----------------------------------------------------------------------*)
    FUNCTION ARSEGMRT(a  : STRING_String;
                      items : LDSUCC_ItemSetType;
                      VAR AmbId : INTERFACE1_WordAmbIdType): INTERFACE1_pRowSeqSegmKeys;

    VAR result : INTERFACE1_pRowSeqSegmKeys;
        RS,r   : SEGMRULES_pSFruleResult;
        os,
        SS,s   : INTERFACE1_pRowSeqSegmKeys;
        F      : LIMORFDEF_pPhonInfo;
        SFSegm : INTERFACE1_pSeqSegmKeys;
        k1, k2 : INTEGER;
        items1,
        items2 : LDSUCC_ItemSetType;    

    BEGIN
       result := nil; r := nil;
       RS := ASEGMRULES_ASuffixTableHandler(a); r := RS;
       WHILE r <> nil DO BEGIN
          items1 := items;
          LDSUCC_ReduceItems(r^.SFK, items1, items1);
          IF LDSUCC_StillItems(items1) THEN BEGIN
	     LDSUCC_PredictItems(items1, items2);
	     SS := ARSEGM(r^.a1, rn, items2, AmbId); s := SS; os := NIL;
	     WHILE s <> nil DO BEGIN      
		F := LDMORFDEF_FonSwitch(r^.FON, s^.f); 
		IF F <> nil THEN BEGIN
		   SFSegm := makeSFSegm(r^.SFK);
		   SegmToSeqSegm(s, SFSegm);
		   s^.f  := F;
		   s^.CC := r^.CC;
		   os := s;
		   END
		ELSE BEGIN
		   IF os = NIL THEN BEGIN
		      SS := s^.nxtamb
		      END
		   ELSE BEGIN
		      os^.nxtamb := s^.nxtamb
		   END                   
		END;
		s := s^.nxtamb
	     END;
	     result := AddSegmResults(SS, result);
          END;
          r := r^.nxtamb
       END;
    
       ARSEGMRT := result
    
    END {ARSEGMRT};

BEGIN 
   DEBUG_WriteStr('-> ARSEGM ',DEBUG_MaxIO,0,TRUE);
   DEBUG_WriteString(a,Debug_MaxIO,TRUE);
   Debug_WriteLine(TRUE);

   ARSEGM := AddSegmResults(ARSEGMRT(a, items, AmbId),
                            ADSEGM(a, rn, items, AmbId));

   DEBUG_WriteStr('<- ARSEGM ',DEBUG_MaxIO,0,TRUE);
   DEBUG_WriteString(a,Debug_MaxIO,TRUE);
   Debug_WriteLine(TRUE);
END {ARSEGM};



(*-------------------------------------------------------------------------*
 * Prefix segmentation function     
 *-------------------------------------------------------------------------*)
FUNCTION ALSEGM(a  : STRING_String;
                rn : INTERFACE1_pRowSeqSegmKeys;
                items : LDSUCC_ItemSetType;
                VAR AmbId : INTERFACE1_WordAmbIdType): INTERFACE1_pRowSeqSegmKeys;

   (*----------------------------------------------------------------------*
    * Prefix processing by means of a recursive prefix table
    *----------------------------------------------------------------------*)
    FUNCTION ALSEGMRT(a: STRING_String;
                      items: LDSUCC_ItemSetType;
                      VAR AmbId: INTERFACE1_WordAmbIdType): INTERFACE1_pRowSeqSegmKeys;

    VAR result : INTERFACE1_pRowSeqSegmKeys;
        RS,r   : SEGMRULES_pPFruleResult;
        os, 
        SS,s   : INTERFACE1_pRowSeqSegmKeys;
        F      : LIMORFDEF_pPhonInfo;
        PFSegm : INTERFACE1_pSeqSegmKeys;
        items1,
        items2 : LDSUCC_ItemSetType;    
           
    BEGIN
       result := nil; r := nil;
       RS := ASEGMRULES_APrefixTableHandler(a); r := RS;
       WHILE r <> nil DO BEGIN
          items1 := items;
          LDSUCC_ReduceItems(r^.PFK, items1, items1);
          IF LDSUCC_StillItems(items1) THEN BEGIN
	     LDSUCC_PredictItems(items1, items2);
	     SS := ALSEGM(r^.a1, rn, items2, AmbId); s := SS; os := NIL;
	     WHILE s <> nil DO BEGIN      
		F := LDMORFDEF_FonSwitch(r^.FON, s^.f);
		IF F <> nil THEN BEGIN
		   PFSegm := makePFSegm(r^.PFK);
		   SegmBackToSeqSegm(PFSegm, s);
		   s^.f  := F;
		   os    := s;
		   END
		ELSE BEGIN
		   IF os = NIL THEN BEGIN
		      SS := s^.nxtamb
		      END
		   ELSE BEGIN
		      os^.nxtamb := s^.nxtamb
		   END                   
		END;
		s := s^.nxtamb
	     END;
	     result := AddSegmResults(SS, result);
          END;
          r := r^.nxtamb
       END;
    
       ALSEGMRT := result
    
    END {ALSEGMRT};


BEGIN 
   DEBUG_WriteStr('-> ALSEGM ',DEBUG_MaxIO,0,TRUE);
   DEBUG_WriteString(a,Debug_MaxIO,TRUE);
   Debug_WriteLine(TRUE);

   ALSEGM := AddSegmResults(ALSEGMRT(a, items, AmbId),
                             ARSEGM(a, rn, items, AmbId));

   DEBUG_WriteStr('<- ALSEGM ',DEBUG_MaxIO,0,TRUE);
   DEBUG_WriteString(a,Debug_MaxIO,TRUE);
   Debug_WriteLine(TRUE);
END {ALSEGM};



(*-------------------------------------------------------------------------*
 * Compounds segmentation function     
 *-------------------------------------------------------------------------*)
FUNCTION ACOMP(a  : STRING_String;
               rn : INTERFACE1_pRowSeqSegmKeys;
               VAR AmbId : INTERFACE1_WordAmbIdType): INTERFACE1_pRowSeqSegmKeys;
VAR
   i           : INTEGER;
   found       : BOOLEAN;
   a1, a2      : String_String;
   result      : INTERFACE1_pRowSeqSegmKeys;
   SS1, SS2    : INTERFACE1_pRowSeqSegmKeys;


   PROCEDURE Copy(r: INTERFACE1_pSeqSegmKeys;
                  VAR s: INTERFACE1_pSeqSegmKeys);
   VAR r1, rnew: INTERFACE1_pSeqSegmKeys;
   BEGIN
      r1 := r; s := NIL;
      REPEAT
         rnew := INTERFACE1_MakeSeqSegmStree(NIL);
         rnew^ := r1^;
         IF s=NIL THEN BEGIN
            rnew^.nxtseg := rnew;
            rnew^.prvseg := rnew;
            END
         ELSE BEGIN
            rnew^.nxtseg := s^.nxtseg;
            rnew^.prvseg := s;
            s^.nxtseg^.prvseg := rnew;
            s^.nxtseg := rnew;
         END;
         s := rnew;
         r1 := r1^.nxtseg;
      UNTIL r1 = r;
      s := s^.nxtseg;
   END {Copy};


   PROCEDURE Couple(VAR s1: INTERFACE1_pSeqSegmKeys;
                    s2: INTERFACE1_pSeqSegmKeys);
   VAR ls1: INTERFACE1_pSeqSegmKeys;
   BEGIN
      IF s1 = NIL THEN s1 := s2 
      ELSE IF s2 = NIL THEN 
      ELSE BEGIN
         ls1 := s1^.prvseg;
         s1^.prvseg := s2^.prvseg;
         s2^.prvseg := ls1;
         ls1^.nxtseg := s2;
         s1^.prvseg^.nxtseg := s1
      END;
   END {Couple};

   PROCEDURE Connect(s1,s2: INTERFACE1_pRowSeqSegmKeys;
                     VAR r: INTERFACE1_pRowSeqSegmKeys);
   VAR
      oldr, hs1 : INTERFACE1_pRowSeqSegmKeys;
      newseq1, newseq2 : INTERFACE1_pSeqSegmKeys;
   BEGIN
      oldr := NIL; r := NIL;
      WHILE s2 <> NIL DO BEGIN
          hs1 := s1;
          WHILE hs1 <> NIL DO BEGIN
             copy(hs1^.fseq, newseq1);
             copy(s2^.fseq, newseq2);
             couple(newseq1, newseq2);
             r  := INTERFACE1_MakeSRowSeqSegm(oldr);
             r^ := s2^;
             r^.fseq := newseq1; 
             r^.lseq := newseq1^.prvseg;
             r^.f       := hs1^.f;
             r^.NrStems := 2;
             r^.nxtamb  := oldr;
             oldr       := r;
             hs1 := hs1^.nxtamb
          END;
          s2 := s2^.nxtamb
      END;
   END {Connect};

BEGIN
   DEBUG_WriteStr('-> ACOMP ',DEBUG_MaxIO,0,TRUE);
   IF CONFIG_GluedCompounds THEN DEBUG_WriteStr('yes',DEBUG_MaxIO,0,TRUE)
                            ELSE DEBUG_WriteStr('no',DEBUG_MaxIO,0,TRUE);
   DEBUG_WriteString(a,Debug_MaxIO,TRUE);
   Debug_WriteLine(TRUE);

   IF CONFIG_GluedCompounds THEN BEGIN 
      i := 0; found := FALSE; result := NIL;
      WHILE ( i <> STRING_Length(a) ) AND NOT found DO BEGIN
	 STRING_ExtractEnd(a2, a, i+1);
	 SS2 := ALSEGM(a2,rn,FIRSTITEMS,AmbId);
	 IF SS2 <> NIL THEN BEGIN
	    IF i=0 THEN BEGIN
	       found := TRUE;
	       result := SS2;
	       END
	    ELSE BEGIN
	       STRING_ExtractBegin(a1,a,i);
	       STRING_AppendChar(a1,a1,'¢');
	       SS1 := ACOMP(a1,rn,AmbId);
	       found := SS1<>NIL;
	       IF found THEN Connect(SS1,SS2,Result);
	    END;
	 END;
	 i := i+1
      END;
      END
   ELSE BEGIN
      Result := ALSEGM(a,rn,FIRSTITEMS,Ambid);
   END;
   ACOMP := Result;

   DEBUG_WriteStr('<- ACOMP ',DEBUG_MaxIO,0,TRUE);
   DEBUG_WriteString(a,Debug_MaxIO,TRUE);
   Debug_WriteLine(TRUE);
END {ACOMP};




(*-------------------------------------------------------------------------*
 * Splitting a word into parts by means of GLUE tables
 *-------------------------------------------------------------------------*)
PROCEDURE AGLUE(a         : STRING_String; 
                VAR cur   : INTERFACE1_pRowSeqSegmKeys;
                rn        : INTERFACE1_pRowSeqSegmKeys;
                VAR C     : INTERFACE1_pRowSeqSegmKeys;
                VAR AmbId : INTERFACE1_WordAmbIdType);

VAR
   RS, r    : SEGMRULES_pGlueRuleResult;
   empty    : boolean;
   i        : integer;
   S        : ARRAY [1..LIMORFDEF_maxsplitfactor] of INTERFACE1_pRowSeqSegmKeys;
   gluenode,
   localrn, 
   saveC      : INTERFACE1_pRowSeqSegmKeys;
   LocalAmbId : INTERFACE1_WordAmbIdType;

BEGIN
   DEBUG_WriteStr('-> AGLUE',DEBUG_MaxIO,0,TRUE);
{
writeln(a);
}
   Debug_WriteLine(TRUE);
   RS := AddGlueResults(ASEGMRULES_ALGLUE(a),
         AddGlueResults(ASEGMRULES_ARGLUE(a),
                        ASEGMRULES_AMGLUE(a)));
   r := RS;
  
   WHILE r <> nil DO BEGIN
      DEBUG_WriteStr('glue resultaat ',DEBUG_MaxIO,0,TRUE);
      DEBUG_WriteInteger(r^.M, 10, true);
      Debug_WriteLine(TRUE);      
      empty := FALSE; i := r^.M;
      localrn := rn;  saveC := C;
      WHILE (i <> 1) and (not empty) DO BEGIN
         LocalAmbId      := 0;
         S[i] := ACOMP(r^.q[i], localrn, LocalAmbid);
         empty := S[i] = nil;
         IF not empty THEN BEGIN
            S[i]^.kind := worddel;
            S[i]^.nxt := C; C^.prv := S[i];
            C := S[i]; 
            gluenode       := INTERFACE1_MakeWRowSeqSegm(nil);
            gluenode^.fseq := MakeGlueSegm;
            gluenode^.lseq := gluenode^.fseq;
            gluenode^.fseq^.nxtseg := gluenode^.fseq;
            gluenode^.fseq^.prvseg := gluenode^.fseq;
            gluenode^.nxt  := C;
            gluenode^.rn   := C;
            gluenode^.ambid:= 1;
            C^.prv         := gluenode;
            C              := gluenode;
            localrn        := C;
            i := i-1
         END;
      END { i = 1 };
        
      IF not empty THEN BEGIN
         S[1] := ACOMP(r^.q[1], localrn, Ambid);
         empty := S[1] = nil;
         IF not empty THEN BEGIN
            cur := AddSegmResults(S[1], cur);
         END
      END;

      IF empty = TRUE THEN BEGIN

         (*----------------------------------------------------------------*
          * Disconnect the already created datastructure for the current
          * result "r" of application of gluerules.
          *----------------------------------------------------------------*)
         saveC^.prv := NIL;
         C := saveC;
      END;

      r := r^.nxtamb
   END;

   cur := AddSegmResults(ACOMP(a, rn, AmbId), cur);

   DEBUG_WriteStr('<- AGLUE',DEBUG_MaxIO,0,TRUE);
   Debug_WriteLine(TRUE);

END {AGLUE};



(*-------------------------------------------------------------------------*
 * AGLUEplus calls the segmentation for each individual word and
 * checks whether the CC's of the results match with the phonetic
 * information of the successors
 *-------------------------------------------------------------------------*)
PROCEDURE AGLUEplus(w               : INTERFACE0_pSeqWords;
                    VAR result      : INTERFACE1_pRowSeqSegmKeys);

VAR
   cw,
   cwamb      : INTERFACE0_pSeqWords;    
   errornode,
   trailer,
   rn,
   rnamb,
   tempcur,
   cur,
   curamb,
   C          : INTERFACE1_pRowSeqSegmKeys;
   FONtrailer : LIMORFDEF_pPhonInfo;
   status     : BOOLEAN;
   AmbId      : INTERFACE1_WordAmbIdType;
   
BEGIN
   DEBUG_WriteStr('-> AGLUE+',DEBUG_MaxIO,0,TRUE);
   Debug_WriteLine(TRUE);
   cw             := w^.prv;
   FONtrailer     := nil;
   errornode      := INTERFACE1_makeWRowSeqSegm(nil);
   trailer        := INTERFACE1_makeWRowSeqSegm(nil);
   trailer^.f     := FONtrailer;
   trailer^.kind  := InputWordDel;
   cw^.result     := trailer;
   C              := trailer;
   cw             := cw ^.prv;
   result         := NIL;
   FIRSTITEMS     := LDSUCC_FirstItems;


   REPEAT
      cwamb := cw;
      cur   := NIL;
      AmbId := 0;
      WHILE cwamb <> NIL DO BEGIN
         rn      := cwamb^.rn^.result;

         (*----------------------------------------------------------------*
          * If the evaluation of the rightneighbour word went wrong, don't
          * evaluate the current word unless the rightneighbour word is an
          * InputWord. In this way it is guaranteed that a segmentation
          * is tried for all words of the inputsentence 
          *----------------------------------------------------------------*)

         IF ( rn <> errornode ) OR ( cwamb^.rn^.kind = InputWord ) THEN BEGIN
            tempcur := NIL; 
            GlobX   := cwamb^.X;
            GlobY   := cwamb^.Y;
            GlobLen := cwamb^.len;
            AGLUE(cwamb^.word, tempcur, rn, C, AmbId);
            IF tempcur <> NIL THEN BEGIN
               IF cwamb^.kind = InputWord THEN BEGIN
                  tempcur^.kind := inputworddel;
               END;
               cur := AddSegmResults(cur, tempcur);
            END;
         END;
         cwamb := cwamb^.nxtamb
      END;            

      IF cur <> NIL THEN BEGIN

         (*----------------------------------------------------------------*
          * First Check all context conditions of all ambiguous segmentations
          * with all possible successors. 
          *----------------------------------------------------------------*)

         curamb := cur;
         status := FALSE;
         WHILE curamb <> NIL DO BEGIN
            rnamb := curamb^.rn;
            WHILE rnamb <> NIL DO BEGIN
               IF not LDMORFDEF_CCSwitch(curamb^.CC, rnamb^.f) THEN BEGIN
                  curamb^.nonsucc := curamb^.nonsucc + [rnamb^.ambid]
                  END
               ELSE BEGIN
                  status := TRUE
               END;
               rnamb := rnamb^.nxtamb;
            END;
            curamb := curamb^.nxtamb
         END;

         (*----------------------------------------------------------------*
          * If status is still FALSE it means that all context conditions
          * with possible successors failed.
          *----------------------------------------------------------------*)
         IF not status THEN BEGIN
            cw^.result := errornode;
            END
         ELSE BEGIN
            cw^.result := cur;
         END;
         END
      ELSE BEGIN
         cw^.result := errornode;
      END;

      IF ( cw^.result = errornode ) AND ( cw^.kind = InputWord ) THEN BEGIN
         cur                   := INTERFACE1_MakeWRowSeqSegm(NIL);
         cur^.fseq             := MakeBasSegm(0, cw^.word);
         cur^.lseq             := cur^.fseq;
         cur^.fseq^.nxtseg     := cur^.fseq;
         cur^.lseq^.prvseg     := cur^.fseq;
         cur^.rn               := cw^.rn^.result;
         cur^.error            := TRUE;
         cur^.fseq^.robustmode := TRUE;
         cur^.kind             := inputworddel;
         cur^.ambid            := 1;
         cur^.X                := cw^.X;
         cur^.Y                := cw^.Y;
         cur^.len              := cw^.len;
         cw^.result            := cur;
         cw^.error             := TRUE;
      END;

      IF cur <> NIL THEN BEGIN
         trailer^.nxt := cur;
{
         IF cw^.kind = InputWord  THEN BEGIN
            cur^.X    := cw^.X;
            cur^.Y    := cw^.Y;
            cur^.len  := cw^.len
         END;
}
         IF cw^.kind = LayoutWord THEN cur^.kind := worddel;
         cur^.prv   := trailer;
         cur^.nxt   := C;
         cur^.idnr  := cw^.wordid;
         C^.prv     := cur;
         C          := cur;
      END;
      cw         := cw^.prv;
   UNTIL (cw = w^.prv);

   (*----------------------------------------------------------------------*
    * If error = TRUE all nodes corresponding to input words in the input 
    * datastructure that could not be segmented sucessfully are marked 
    * ( the attribute "error" has been set to TRUE ).
    *----------------------------------------------------------------------*)

   result := w^.result;

   DEBUG_WriteStr('-> AGLUE+',DEBUG_MaxIO,0,TRUE);
   Debug_WriteLine(TRUE);
            
END {AGLUEplus};



PROCEDURE AWLAYOUT(w      : STRING_String;
                   VAR cur: INTERFACE0_pSeqWords;
                   rn     : INTERFACE0_pSeqWords;
                   VAR C  : INTERFACE0_pSeqWords;
                   first,
                   last   : boolean;
                   mode   : ASEGM_LayoutRuleMode);

VAR 
   result : INTERFACE0_pSeqWords;
   nxtr,
   RS,r   : INTERFACE0_pSeqWords;
   s      : INTERFACE0_pSeqWords;
   prvs,
   localrn: INTERFACE0_pSeqWords;    
   locfirst,
   loclast  : BOOLEAN;
   X, Y, len: INTEGER;
BEGIN
   DEBUG_WriteStr('-> AWLAYOUT',DEBUG_MaxIO,0,TRUE);
   DEBUG_WriteString(w,Debug_MaxIO,TRUE);
   Debug_WriteLine(TRUE);

   X := cur^.X;
   Y := cur^.Y;
   len := cur^.len;

   RS := LDMORFDEF_AWlayoutSwitch(w, first, last, mode); r := RS;

   (*----------------------------------------------------------------------*
    * LDMORFDEF_AWLayoutSwitch returns the following structure
    *
    *        RS
    *        |
    *        |
    *        V
    *  --- +---+ <-- +---+ <-- +---+ <--.. 
    *      |   |     |   |     |   | 
    *  --> +---+ --> +---+ --> +---+ --..
    *        |
    *        |
    *  --- +---+ <-- +---+ <-- +---+ <--.. 
    *      |   |     |   |     |   | 
    *  --> +---+ --> +---+ --> +---+ --..
    *----------------------------------------------------------------------*)

   WHILE r <> nil DO BEGIN
      r^.X := X;
      r^.Y := Y;
      r^.len := len;

      s       := r^.prv;
      nxtr    := r^.nxtamb;
      localrn := rn;
      WHILE s <> r DO BEGIN

         s^.X := X;
         s^.Y := Y;
         s^.len := len;

         prvs   := s^.prv;
         s^.prv := nil;
	 s^.nxt := nil;
         s^.rn  := localrn;
	 s^.nxtamb := nil;
         IF first THEN locfirst := ( s = r );
         IF last  THEN loclast  := ( s = r^.prv);
	 AWLAYOUT(s^.word, s, localrn, C, locfirst, loclast, nosplitmode);
	 s^.nxt := C;
	 C^.prv := s;
	 C      := s;
	 localrn:= s;
	 s      := prvs;
      END;

      IF first THEN locfirst := ( s = r );
      IF last  THEN loclast  := ( s = r^.prv);
      s^.prv      := nil;
      s^.nxt      := nil;
      s^.rn       := localrn;

      (*-------------------------------------------------------------------*
       * The following two statements guarantee that the value of the 
       * parameter "cur" at the end of this function is the same as it
       * was at the beginning.
       *-------------------------------------------------------------------*)

      s^.nxtamb   := cur^.nxtamb;
      cur^.nxtamb := s;
      AWLAYOUT(s^.word, cur, localrn, C, locfirst, loclast, nosplitmode);

      r := nxtr
   END;
    
   IF mode = splitmode THEN BEGIN
      AWLAYOUT(w, cur, rn, C, first, last, nosplitmode)
   END;

   DEBUG_WriteStr('<- AWLAYOUT',DEBUG_MaxIO,0,TRUE);
   DEBUG_WriteString(w,Debug_MaxIO,TRUE);
   Debug_WriteLine(TRUE);

END {AWLAYOUT};



(*-------------------------------------------------------------------------*
 * 
 *-------------------------------------------------------------------------*)

FUNCTION ASEGM_ASEGMENTATION(sw: INTERFACE0_pSeqWords):
                                      INTERFACE1_pRowSeqSegmKeys;

VAR 
   result,
   finalresult : INTERFACE1_pRowSeqSegmKeys;
   trailer,
   currn,
   C,
   rnw,
   ncw,
   nxtncw,
   cw          : INTERFACE0_pSeqWords;
   wrongwordid : INTEGER;
   first,
   last        : BOOLEAN;
BEGIN
   DEBUG_WriteStr('-> ASEGMENTATION:',DEBUG_MaxIO,0,TRUE);
   Debug_WriteLine(TRUE);
   trailer := sw^.prv;
   cw      := trailer^.prv;
   LexAccesses := 0;

   REPEAT

      LIFIXIDDICT_AddIds(cw, trailer);

      cw := cw^.prv
   UNTIL cw = trailer;

   cw := trailer^.prv;

   REPEAT
      (*-------------------------------------------------------------------*
       * Temporarily decoupling of sw and its rightneighbour
       *-------------------------------------------------------------------*)
      rnw      := cw^.nxt;
      cw^.nxt  := nil;
      rnw^.prv := nil;
      C        := rnw;
      (*-------------------------------------------------------------------*
       * Warning: AWLayout may not alter the value of the variable cw !!
       *-------------------------------------------------------------------*)
      ncw := cw;
      REPEAT
         nxtncw := ncw^.nxtamb;
         currn  := ncw^.rn;
         first  := cw = sw;
         last   := currn = trailer;
         AWLAYOUT(ncw^.word, ncw, currn, C, first, last, splitmode);
         ncw := nxtncw
      UNTIL ncw = NIL;
      (*-------------------------------------------------------------------*
       * Coupling of w and its (possible) new rightneighbour C
       *-------------------------------------------------------------------*)

      cw^.nxt   := C;
      C^.prv    := cw;
      cw := cw^.prv
   UNTIL cw = trailer;

   AGLUEplus(sw, result);

   ASEGM_ASEGMENTATION := result;

   LOG_Write('LexAccesses : ', 14, LexAccesses);
   DEBUG_WriteStr('<- ASEGMENTATION',DEBUG_MaxIO,0,TRUE);
   Debug_WriteLine(TRUE);

END {ASEGM_ASEGMENTATION};

