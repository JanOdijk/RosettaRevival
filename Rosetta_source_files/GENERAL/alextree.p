(*MPD:::===================================================================*
 *
 *  Rosetta Project                                                 
 *                                                                  
 *  Module Title    : ALEXTREE
 *  Creation date   :                                               
 *  Author          : J. Rous                                          
 *                                                                  
 *  Copyright (c) 1985, by Nederlandse Philips Bedrijven BV.        
 *                                                                  
 *  Remarks         :  
 *
 *EMP:::===================================================================*)

Export(ALEXTREE);
pragma C_include('listree.pf');
pragma C_include('lidomaint.pf');
pragma C_include('debug.pf');
pragma C_include('mem.pf');
pragma C_include('str.pf');
pragma C_include('string.pf');
pragma C_include('interface1.pf');
pragma C_include('interface0.pf');
pragma C_include('anlexif.pf');
pragma C_include('ldcatsets.pf');
pragma C_include('ldtypetostr.pf');
pragma C_include('drawstree.pf');
pragma C_include('globdef.pf');
pragma C_include('alayout.pf');
pragma C_include('alextree.pf');

(*=========================================================================*
 *  Imported modules
 *=========================================================================*)

PROGRAM ALEXTREE;
WITH LISTREE, LIDOMAINT, DEBUG, MEM, STR, STRNG, INTERFACE1, INTERFACE0, 
     ANLEXIF, LDCATSETS, LDTYPETOSTR, DRAWSTREE, GLOBDEF, ALAYOUT;


FUNCTION AddPartialParsings(p1, p2: INTERFACE1_pSeqSegmKeys): INTERFACE1_pSeqSegmKeys;
BEGIN
   AddPartialParsings := p1;
   IF p1 = NIL THEN
      AddPartialParsings := p2
   ELSE IF p2 <> NIL THEN BEGIN
      WHILE p1^.nxtamb <> NIL DO p1 := p1^.nxtamb;
      p1^.nxtamb := p2
   END
END {AddPArtialParsings};


FUNCTION AddRuleResults(p1: LISTREE_SetOfStrees;
                        p2: INTERFACE1_pSeqSegmKeys;
                        rn: INTERFACE1_pSeqSegmKeys): INTERFACE1_pSeqSegmKeys;
BEGIN
   IF not LISTREE_StillStrees(p1) THEN BEGIN
{
      DEBUG_WriteStr('Rule yields no results',DEBUG_MAXio,0,TRUE);
      Debug_WriteLine(TRUE);
}
   END;
   WHILE LISTREE_StillStrees(p1) DO BEGIN
      p2 := INTERFACE1_MakeSeqSegmStree(p2);
      LISTREE_TakeStree(p2^.stree, p1);
{
      IF Debug_Mode THEN DRAWSTREE_GenerateTree(p2^.Stree);      
}
      p2^.rn := rn
   END;
   AddRuleResults := p2
END {AddRuleResults};


FUNCTION MakeInterface0Struct(r, trailer: INTERFACE1_pRowSeqSegmKeys):
                              INTERFACE0_pSeqWords;
VAR
   w: STRING_String;
   trailer0,
   np0,
   p0: INTERFACE0_pSeqWords;
BEGIN
   STRING_ConstantEmpty(w);
   trailer0 := INTERFACE0_MakeSeqWords(w, NIL);
   p0       := trailer0;
   r        := r^.BestMinErrorsInChain;
   WHILE r <> trailer DO BEGIN
      IF r^.error THEN BEGIN
         DEBUG_WriteStr('Creating node for',DEBUG_MAXio,0,TRUE);
         DEBUG_WriteInteger(r^.idnr, 5, TRUE);
         Debug_WriteLine(TRUE);
         np0 := INTERFACE0_MakeSeqWords(w, NIL);
         WITH np0^ DO BEGIN
            nxt := trailer0;
            prv := p0;
            X   := r^.X;
            Y   := r^.Y;
            len := r^.len;
            DEBUG_WriteStr('X: ',DEBUG_MAXio,0,TRUE);
            DEBUG_WriteInteger(X, 5, TRUE);
            DEBUG_WriteStr(' Y: ',DEBUG_MAXio,0,TRUE);
            DEBUG_WriteInteger(Y, 5, TRUE);
            DEBUG_WriteStr(' len: ',DEBUG_MAXio,0,TRUE);
            DEBUG_WriteInteger(len, 5, TRUE);
            Debug_WriteLine(TRUE);
            error := TRUE;
            kind := InputWord;
         END;
         trailer0^.prv := np0;
         p0^.nxt       := np0; 
         p0            := np0;
      END;
      r := r^.rn^.BestMinErrorsInChain
   END;
   MakeInterface0Struct := trailer0^.nxt;
END {MakeInterface0Struct};


PROCEDURE CreateBugNodes(r, trailer: INTERFACE1_pRowSeqSegmKeys);
VAR
   p : INTERFACE1_pSeqSegmKeys;
BEGIN
   r        := r^.BestMinErrorsInChain;
   WHILE r <> trailer DO BEGIN
      IF r^.error THEN BEGIN
         DEBUG_WriteStr('Creating BUG node for',DEBUG_MAXio,0,TRUE);
         DEBUG_WriteInteger(r^.idnr, 5, TRUE);
         Debug_WriteLine(TRUE);
         p := INTERFACE1_MakeSeqSegmStree(NIL);
         LISTREE_MakeStree(p^.stree);
         p^.stree^.cat := LIBUG;
         Mem_NewDefault(LoopHoles.SizeOf(LISTREE_BugString),
                        LoopHoles.Retype(p^.stree^.LI^.BugString,Mem_Ptr));
         ALAYOUT_GetWord(r^.X, r^.Y, r^.len, 
                         p^.stree^.LI^.BugString^.Str,
                         p^.stree^.LI^.BugString^.Len);
         r^.fseq  := p;
         r^.lseq  := p;
         r^.error := FALSE;
      END;
      r := r^.rn^.BestMinErrorsInChain
   END;
END {CreateBugNodes};


FUNCTION TroubleSpotter(first, trailer: INTERFACE1_pRowSeqSegmKeys): BOOLEAN;
VAR
   error     : BOOLEAN;
   f         : INTERFACE1_pRowSeqSegmKeys;
   evaluated : BOOLEAN;
   pathfound : BOOLEAN;

   FUNCTION FindNextWord(f, trailer: INTERFACE1_pRowSeqSegmKeys): INTERFACE1_pRowSeqSegmKeys;
   BEGIN
      REPEAT
         f := f^.nxt;
      UNTIL (f^.kind = inputworddel) or ( f = trailer );
      IF f = trailer THEN
         FindNextWord := NIL
      ELSE
         FindNextWord := f;
   END {FindNextWord};


   FUNCTION FindPath(f, trailer, first: INTERFACE1_pRowSeqSegmKeys): BOOLEAN;
   VAR
      found : BOOLEAN;
   BEGIN
      IF f = trailer THEN 
         FindPath := TRUE
      ELSE BEGIN
         IF (f^.kind = inputworddel) AND (f <> first) THEN 
            FindPath := TRUE
         ELSE BEGIN
            found := FALSE;
            WHILE f <> NIL DO BEGIN
               IF f^.fseq <> NIL THEN found := FindPath(f^.rn, trailer, first);
               IF found THEN 
                  f := NIL
               ELSE
                  f := f^.nxtamb;
            END;
            FindPath := found
         END
      END;
   END {FindPath};


BEGIN
   f := first;
   evaluated := FALSE; error := FALSE;

   (*----------------------------------------------------------------------*
    * The assumption here is that the fist node of the chain corresponds
    * to a word in the original sentence.
    *----------------------------------------------------------------------*)

   WHILE NOT evaluated DO BEGIN
      DEBUG_WriteStr('Trying to find a path for ',DEBUG_MAXio,0,TRUE);
      DEBUG_WriteInteger(f^.idnr, 5, TRUE);
      Debug_WriteLine(TRUE);
      pathfound := FindPath(f, trailer, f);
      IF not pathfound THEN BEGIN
         f^.error := TRUE;
         error    := TRUE;
         DEBUG_WriteStr('Error in Lextree-phase of word: ',DEBUG_MAXio,0,TRUE);
         DEBUG_WriteInteger(f^.idnr, 5, TRUE);
         Debug_WriteLine(TRUE);
      END; 
      f := FindNextWord(f, trailer);
      IF f = NIL THEN evaluated := TRUE
   END;
   TroubleSpotter := error;

END {TroubleSpotter};


FUNCTION CollectGarbage(first, trailer: INTERFACE1_pRowSeqSegmKeys): 
                             BOOLEAN;
VAR
   nw,
   f         : INTERFACE1_pRowSeqSegmKeys;
   error     : BOOLEAN;

   FUNCTION FindPrvWord(f, header: INTERFACE1_pRowSeqSegmKeys): INTERFACE1_pRowSeqSegmKeys;
   BEGIN
      REPEAT
         f := f^.prv; 
      UNTIL (f^.kind = inputworddel) or ( f = header );
      FindPrvWord := f;
   END {FindPrvWord};


   FUNCTION FindNxtWord(f: INTERFACE1_pRowSeqSegmKeys): INTERFACE1_pRowSeqSegmKeys;
   BEGIN
      WHILE (f^.kind <> inputworddel) DO f := f^.nxt; 
      FindNxtWord := f;
   END {FindNxtWord};


   PROCEDURE CleanUpCurrentChain(w: INTERFACE1_pRowSeqSegmKeys);
   VAR 
      prvw, nw : INTERFACE1_pRowSeqSegmKeys;
   BEGIN
      nw := w; prvw := NIL;
      WHILE nw <> NIL DO BEGIN
	 IF nw^.error THEN BEGIN
	    (*-------------------------------------------------*
	     * If there is a successor, copy the relevant successor
	     * info into the current node. If there is no 
	     * successor, disconnect last node
	     *-------------------------------------------------*)
	    IF nw^.nxtamb <> NIL THEN BEGIN
               IF (nw^.nxtamb = w^.BestMinErrorsInChain) THEN 
                  w^.BestMinErrorsInChain := nw;
	       nw^.fseq   := nw^.nxtamb^.fseq;
	       nw^.lseq   := nw^.nxtamb^.fseq;
	       nw^.ambid  := nw^.nxtamb^.ambid;
	       nw^.nonsucc:= nw^.nxtamb^.nonsucc;
	       nw^.rn     := nw^.nxtamb^.rn;
               nw^.X      := nw^.nxtamb^.X;
               nw^.Y      := nw^.nxtamb^.Y;
               nw^.len    := nw^.nxtamb^.len;
               nw^.error  := nw^.nxtamb^.error;
               nw^.MinErrors := nw^.nxtamb^.MinErrors;
	       nw^.nxtamb := nw^.nxtamb^.nxtamb;
	       END
	    ELSE BEGIN
               IF prvw <> NIL THEN BEGIN
	          prvw^.nxtamb := NIL; 
               END;
               nw := nw^.nxtamb;
	    END;
	    END
	 ELSE BEGIN
	    prvw := nw;
	    nw := nw^.nxtamb
	 END
      END
   END {CleanUpCurrentChain};


   PROCEDURE MarkAndSweep(first, trailer: INTERFACE1_pRowSeqSegmKeys);
   VAR
      w, nw : INTERFACE1_pRowSeqSegmKeys;
      found : BOOLEAN;
      BestMinErrors : INTERFACE1_pRowSeqSegmKeys;
      MinErrors     : INTEGER;
   BEGIN
      DEBUG_WriteStr('->Mark and Sweep',DEBUG_MAXio,0,TRUE);
      Debug_WriteLine(TRUE);

      (*-------------------------------------------------------------------*
       * First sweep from right to left, one chain at the time, thereby 
       * removing all error chains
       * ( that don't correspond with "input-word-delimiters") and all nodes
       * of which the right neightbour chain is an error chain. 
       *-------------------------------------------------------------------*)

      DEBUG_WriteStr('Phase 1: Sweep from right to left',DEBUG_MAXio,0,TRUE);
      Debug_WriteLine(TRUE);
      w := trailer; 
      REPEAT 
         DEBUG_WriteStr('process new word',DEBUG_MAXio,0,TRUE);
         Debug_WriteLine(TRUE);
         w := w^.prv; nw := w;
         found := FALSE; BestMinErrors := NIL; MinErrors := MaxInt;
         WHILE nw <> NIL DO BEGIN
            DEBUG_WriteStr('process ambiguity',DEBUG_MAXio,0,TRUE);
            Debug_WriteLine(TRUE);
            IF (nw^.fseq <> NIL) AND ((nw^.rn^.kind = inputworddel) OR 
                                      (nw^.rn^.error = FALSE)) THEN BEGIN
               IF NOT nw^.error THEN BEGIN
                  DEBUG_WriteStr('correct node',DEBUG_MAXio,0,TRUE);
                  Debug_WriteLine(TRUE);
                  nw^.MinErrors := nw^.rn^.MinErrors;
                  found := TRUE;
                  END
               ELSE BEGIN
                  DEBUG_WriteStr('segmentation error node',DEBUG_MAXio,0,TRUE);
                  Debug_WriteLine(TRUE);
                  nw^.MinErrors := nw^.rn^.MinErrors + 1;
               END
               END
            ELSE BEGIN
               DEBUG_WriteStr('lextree error node',DEBUG_MAXio,0,TRUE);
               Debug_WriteLine(TRUE);
               nw^.error := TRUE;
               nw^.MinErrors := nw^.rn^.MinErrors + 1;
            END;
            IF (NOT nw^.error) AND
               (nw^.MinErrors < MinErrors ) THEN BEGIN
               MinErrors := nw^.MinErrors;
               BestMinErrors := nw;
            END;
            nw := nw^.nxtamb;
         END;

         (*----------------------------------------------------------------*
          * If found = TRUE there is at least one correct node in the
          * current chain. In that case the incorrect nodes in the chain
          * have to be thrown away. If found = FALSE there is no correct node
          * and therefore the whole chain can be disconnected. However
          * if the current chain is the first chain of the input word we
          * have to leave at least one node.
          *
          * If BestMinErrors is still NIL then FOUND will be false
          *----------------------------------------------------------------*)

         IF (not found) AND (w<>first) THEN BEGIN
            (*-------------------------------------------------------------*
             * Disconnect current node
             *-------------------------------------------------------------*)
            DEBUG_WriteStr('non input word and no correct node found',DEBUG_MAXio,0,TRUE);
            Debug_WriteLine(TRUE);
            w^.prv^.nxt := w^.nxt;
            w^.nxt^.prv := w^.prv;
            w^.BestMinErrorsInChain := NIL;
            END
         ELSE BEGIN
            IF w = first THEN BEGIN
               IF NOT found THEN BEGIN
                  (*-------------------------------------------------------*
                   * No parse for the current inputword can be found
                   *-------------------------------------------------------*)
                  DEBUG_WriteStr('input word and no correct node found',DEBUG_MAXio,0,TRUE);
                  Debug_WriteLine(TRUE);
                  w^.error  := TRUE;
                  w^.nxtamb := NIL;
                  w^.rn     := FindNxtWord(w^.rn);
                  w^.MinErrors := w^.rn^.MinErrors+1;
                  w^.BestMinErrorsInChain := w
                  END
               ELSE BEGIN
                  DEBUG_WriteStr('input word and at least one correct node',DEBUG_MAXio,0,TRUE);
                  Debug_WriteLine(TRUE);
                  w^.BestMinErrorsInChain := BestMinErrors;
                  CleanUpCurrentChain(w);
               END
               END
            ELSE BEGIN
               DEBUG_WriteStr('non-input word and at least one correct node',DEBUG_MAXio,0,TRUE);
               Debug_WriteLine(TRUE);
               w^.BestMinErrorsInChain := BestMinErrors;
               CleanUpCurrentChain(w);
            END;
         END;
      UNTIL w = first;


      (*-------------------------------------------------------------------*
       * Next, sweep from left to right and remove all chains that cannot
       * be reached from the leftmost inputword delimiter. To do this,
       * the "error" field is temporarily "misused", that is, chains that 
       * are correct are temporarily marked with error := TRUE.
       *-------------------------------------------------------------------*)

      DEBUG_WriteStr('Phase 2: Sweep from left to right',DEBUG_MAXio,0,TRUE);
      Debug_WriteLine(TRUE);
      REPEAT 
         DEBUG_WriteStr('process new word',DEBUG_MAXio,0,TRUE);
         Debug_WriteLine(TRUE);
         nw := w;
         WHILE nw <> NIL DO BEGIN
            DEBUG_WriteStr('process ambiguity',DEBUG_MAXio,0,TRUE);
            Debug_WriteLine(TRUE);
            IF (nw^.rn^.kind <> inputworddel) AND
               ( w^.error OR (w = first) )  THEN BEGIN
               nw^.rn^.error := TRUE
            END;
            nw := nw^.nxtamb
         END;            
         IF (w <> first) AND ( NOT w^.error ) THEN BEGIN
            DEBUG_WriteStr('non input word and not reachable',DEBUG_MAXio,0,TRUE);
            Debug_WriteLine(TRUE);
            w^.prv^.nxt := w^.nxt;
            w^.nxt^.prv := w^.prv
            END
         ELSE IF w <> first THEN BEGIN
            DEBUG_WriteStr('non input word and reachable',DEBUG_MAXio,0,TRUE);
            Debug_WriteLine(TRUE);
            w^.error := FALSE
         END;
         w := w^.nxt
      UNTIL w = trailer;

      DEBUG_WriteStr('<-Mark and Sweep',DEBUG_MAXio,0,TRUE);
      Debug_WriteLine(TRUE);
   END {MarkAndSweep};


BEGIN
   f := first^.prv; error := FALSE;
   f^.BestMinErrorsInChain := f; f^.MinErrors := 0;
   (*----------------------------------------------------------------------*
    * The assumption here is that the first node of the chain corresponds
    * to a word in the original sentence.
    *----------------------------------------------------------------------*)

   WHILE f <> first DO BEGIN
      DEBUG_WriteStr('Trying to find unaccessables for ',DEBUG_MAXio,0,TRUE);
      DEBUG_WriteInteger(f^.idnr, 5, TRUE);
      Debug_WriteLine(TRUE);
      nw := FindPrvWord(f, first);
      MarkAndSweep(nw, f);
      f := nw
   END;
   CollectGarbage := first^.BestMinErrorsInChain^.MinErrors > 0;

END {CollectGarbage};



PROCEDURE Reorganize(VAR r: INTERFACE1_pRowSeqSegmKeys);

(*-------------------------------------------------------------------------*
 * Reorganize throws away nodes in the datastructures which led to partial
 * S-trees. The resulting datastructure contains only S-trees which are
 * correct terminals for Surface-Parser input.
 *-------------------------------------------------------------------------*)

VAR
   prvcollect,
   collect,
   strees,
   nxtstrees : INTERFACE1_pSeqSegmKeys;
   nxtambig,
   ambig,
   prvambig,
   nr    : INTERFACE1_pRowSeqSegmKeys;
BEGIN
   DEBUG_WriteStr('-> Reorganize',DEBUG_MAXio,0,TRUE);
   Debug_WriteLine(TRUE);

   nr := r;
   WHILE nr <> r^.prv DO BEGIN
      ambig := nr; prvambig := ambig;
      WHILE ( ambig <> nil ) and ( NOT ambig^.error ) DO BEGIN
         strees := ambig^.fseq; collect := nil;
         IF strees <> NIL THEN BEGIN
            REPEAT 
               nxtstrees := strees^.nxtamb;
               IF ( strees^.rn = NIL ) 
                    and LDCATSETS_LexCat(strees^.stree^.cat) THEN BEGIN
{
                 DrawStree_GenerateTree(strees^.stree);
}
                  strees^.nxtamb := collect;
                  collect := strees;
               END;
               strees := nxtstrees;
            UNTIL strees = ambig^.fseq;
         END;
         IF collect = nil THEN BEGIN
            IF ambig^.nxtamb = nil THEN BEGIN
               ambig^.fseq := nil;
               ambig^.lseq := nil;
               prvambig^.nxtamb := nil;
               ambig := nil
               END
            ELSE BEGIN

               (*----------------------------------------------------------*
                * The node to which 'ambig' points has no correct S-trees
                * and should be thrown away. The problem is that other
                * pointers in the datastructure may point to the same node.
                * Therefore we overwrite all relevant information in the
                * node with the information of its successor. Furthermore
                * the successor of the successor of 'ambig' becomes the
                * the succesor of 'ambig', which prevents duplication
                * of the successor information
                *----------------------------------------------------------*)

               ambig^.fseq   := ambig^.nxtamb^.fseq;
               ambig^.lseq   := ambig^.nxtamb^.lseq;
               ambig^.ambid  := ambig^.nxtamb^.ambid;
               ambig^.nonsucc:= ambig^.nxtamb^.nonsucc;
               ambig^.rn     := ambig^.nxtamb^.rn;
               ambig^.X      := ambig^.nxtamb^.X;
               ambig^.Y      := ambig^.nxtamb^.Y;
               ambig^.len    := ambig^.nxtamb^.len;
               ambig^.nxtamb := ambig^.nxtamb^.nxtamb;
            END
            END
         ELSE BEGIN
            collect^.nxtseg := NIL;
            collect^.prvseg := NIL;
            ambig^.fseq     := collect;
            ambig^.lseq     := collect;
            nxtambig        := ambig^.nxtamb;
            prvcollect      := collect;
            collect         := collect^.nxtamb;
            WHILE collect <> NIL DO BEGIN
               prvcollect^.nxtamb := NIL;
               ambig^.nxtamb      := INTERFACE1_MakeSRowSeqSegm(NIL);
               prvambig           := ambig;
               ambig              := ambig^.nxtamb;
               collect^.nxtseg    := NIL;
               collect^.prvseg    := NIL;
               ambig^.fseq        := collect;
               ambig^.lseq        := collect;
               ambig^.ambid       := prvambig^.ambid;
               ambig^.nonsucc     := prvambig^.nonsucc;
               ambig^.rn          := prvambig^.rn;
               ambig^.X           := prvambig^.X;
               ambig^.Y           := prvambig^.Y;
               ambig^.len         := prvambig^.len;
               prvcollect         := collect;
               collect            := collect^.nxtamb;
            END;
            ambig^.nxtamb   := nxtambig;
            prvambig        := ambig;
            ambig           := ambig^.nxtamb
         END;
      END;
      nr := nr^.nxt;
   END;

   DEBUG_WriteStr('<- Reorganize',DEBUG_MAXio,0,TRUE);
   Debug_WriteLine(TRUE);
END {Reorganize};


FUNCTION MATCH(Rnr : ANLEXIF_LexRuleType;
               t   : INTERFACE1_pSeqSegmKeys; 
               Info: ANLEXIF_RuleInfo;
               i   : ANLEXIF_LexArgsType;
               Args: LISTREE_TupleOfStrees): INTERFACE1_pSeqSegmKeys; 
VAR
   firstt,
   result     : INTERFACE1_pSeqSegmKeys;
   savelastarg: LISTREE_pLoStree;
   s1         : STRING(30);
   s2         : STRING_String;
   len1       : Str_Range;
BEGIN

   result := nil;
   IF t <> nil THEN BEGIN
      firstt := t;

      savelastarg := Args.last;
      LISTREE_AddToTuple(t^.stree, Args);

      REPEAT
         LDTYPETOSTR_Cat(s1, len1, t^.stree^.cat);
         STRING_Constant(s2, s1, len1);
	 IF t^.stree^.cat = Info.cat[i] THEN BEGIN
	    Args.last^.arg := t^.stree;
	    IF i < Info.args THEN BEGIN
	       result := AddPartialParsings(MATCH(Rnr, t^.rn, Info, i+1, Args), 
					    result);
	       END
	    ELSE BEGIN
	       DEBUG_WriteStr('Match found ',DEBUG_MAXio,0,TRUE);
               DEBUG_WriteStr('Rule nr :',DEBUG_MAXio,0,TRUE); 
               DEBUG_WriteInteger(Rnr, 5, TRUE);
	       Debug_WriteLine(TRUE);
	       result := AddRuleResults(ANLEXIF_lexrule(Rnr, Args), result, t^.rn);
	    END
	 END;
	 t := t^.nxtamb;
      UNTIL t = firstt;

      Args.last := savelastarg;
      IF savelastarg <> NIL THEN savelastarg^.next := nil;

   END;

   MATCH := result;

END {MATCH};



FUNCTION RULES(VAR t: INTERFACE1_pSeqSegmKeys): INTERFACE1_pSeqSegmKeys; 
VAR
   result    : INTERFACE1_pSeqSegmKeys;
   PossRules : ANLEXIF_SetOfRules;
   R         : ANLEXIF_LexRuleType;
   Info      : ANLEXIF_RuleInfo;
   Args      : LISTREE_TupleOfStrees;
   cat       : STRING(20);
   len       : Str_Range;
BEGIN
   DEBUG_WriteStr('-> RULES starting from',DEBUG_MAXio,0,TRUE);
   Debug_WriteLine(TRUE);
{
   IF DEBUG_Mode THEN DRAWSTREE_GenerateTree(t^.stree);
}
   result := nil;
   t^.nxtamb := t;
   LDTYPETOSTR_Cat(cat, len, t^.stree^.cat);
{
writeln('category ',cat);
}
   PossRules := ANLEXIF_Switch(t^.stree);
   IF ANLEXIF_StillRules(PossRules) THEN BEGIN
      LISTREE_EmptyTuple(Args);
      WHILE ANLEXIF_StillRules(PossRules) DO BEGIN
         ANLEXIF_TakeRule(R, PossRules);
         Info := ANLEXIF_Info(R);
         result := AddPartialParsings(MATCH(R, t, Info, 1, Args), result);
      END;
      END
   ELSE BEGIN
      DEBUG_WriteStr(' No rules for Cat  nr :',DEBUG_MAXio,0,TRUE); 
      DEBUG_WriteInteger(ord(t^.stree^.cat), 5, TRUE);
      Debug_WriteLine(TRUE);
   END;
   t^.nxtamb := nil;
   RULES := result;

   DEBUG_WriteStr('<- RULES',DEBUG_MAXio,0,TRUE);
   Debug_WriteLine(TRUE);
END {RULES};


FUNCTION ALEXTREE_ALEXTREEplus(r: INTERFACE1_pRowSeqSegmKeys;
                                        VAR r0: INTERFACE0_pSeqWords): 
                                        INTERFACE1_pRowSeqSegmKeys; 
VAR
   nq, q : INTERFACE1_pRowSeqSegmKeys;
   t, s, OS, Dj : INTERFACE1_pSeqSegmKeys;
BEGIN
   DEBUG_WriteStr('-> ALEXTREE+',DEBUG_MAXio,0,TRUE);
   Debug_WriteLine(TRUE);
   r0 := NIL; 
   IF r <> NIL THEN BEGIN
      ANLEXIF_Init;
      r := r^.prv; q:=r;
      DEBUG_WriteStr('New word ',DEBUG_MAXio,0,TRUE);
      Debug_WriteLine(TRUE);
      REPEAT                      { loop over all words }
	 nq := q; 
	 DEBUG_WriteStr('wordid ',DEBUG_MAXio,0,TRUE);
	 DEBUG_WriteInteger(nq^.ambid, 5, TRUE);
	 Debug_WriteLine(TRUE);
	 WHILE ( nq <> nil ) AND 
               ( NOT nq^.error ) DO BEGIN { loop over all segmentations of the current wrd}
	    s := nq^.lseq; 
	    IF s <> NIL THEN BEGIN
	       s^.rn := NIL;
	       REPEAT                { loop over all segements of cur. segmentation }
		  OS := s; Dj := nil; 
		  WHILE OS <> nil DO BEGIN { loop over all intermediate S-trees with
					     cur. segment as leftmost leave }
		     t := OS; OS := t^.nxtamb; t^.nxtamb := nil;
		     OS := AddPartialParsings(RULES(t), OS);
		     t^.nxtamb := Dj; Dj := t;
		  END;
		  s^.nxtamb := Dj; s := s^.prvseg; 
                  IF s <> nq^.lseq THEN s^.rn := Dj;
	       UNTIL s = nq^.lseq;
	    END;
	    nq := nq^.nxtamb;
	 END;      
	 q := q^.prv
      UNTIL r = q;

      r := r^.nxt;
      Reorganize(r);
      IF CollectGarbage(r, r^.prv) THEN BEGIN
         IF (NOT Globdef_GetBatchMode) AND
            GlobDef_GetInteractionMode THEN BEGIN
            r0 := MakeInterface0Struct(r, r^.prv);
            END
         ELSE BEGIN
            CreateBugNodes(r, r^.prv);
         END
      END;
   END;

   ALEXTREE_ALEXTREEplus := r;

   DEBUG_WriteStr('<- ALEXTREE+',DEBUG_MAXio,0,TRUE);
   Debug_WriteLine(TRUE);
END {ALEXTREE_ALEXTREEplus};

