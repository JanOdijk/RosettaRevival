(*MPD:::===================================================================*
 *
 *  Rosetta Project                                                 
 *                                                                  
 *  Module Title    : GLEXTREE
 *  Creation date   :                                               
 *  Author          : J. Rous                                          
 *                                                                  
 *  Copyright (c) 1985, by Nederlandse Philips Bedrijven BV.        
 *                                                                  
 *  Remarks         :  
 *
 *EMP:::===================================================================*)

Export(GLEXTREE);
pragma C_include('listree.pf');
pragma C_include('debug.pf');
pragma C_include('interface7.pf');
pragma C_include('genlexif.pf');
pragma C_include('drawstree.pf');
pragma C_include('ldcatsets.pf');
pragma C_include('ldaffixlex.pf');
pragma C_include('ldgluelex.pf');
pragma C_include('str.pf');
pragma C_include('string.pf');
pragma C_include('glextree.pf');

(*=========================================================================*
 *  Imported modules
 *=========================================================================*)

PROGRAM GLEXTREE;
WITH LISTREE, DEBUG, INTERFACE7, GENLEXIF, DRAWSTREE, LDCATSETS, LDAFFIXLEX,
     LDGLUELEX, STR, STRNG;

CONST
   MAXARGS = 20;
TYPE
   ArgList = ARRAY[1..MAXARGS] OF LISTREE_pStree;


FUNCTION AddSegmSeqs(p1, p2: INTERFACE7_pRowSeqSegmKeys)
                     : INTERFACE7_pRowSeqSegmKeys;
BEGIN
   AddSegmSeqs := p1;
   IF p1 = NIL THEN
      AddSegmSeqs := p2
   ELSE IF p2 <> NIL THEN BEGIN
      WHILE p1^.nxtamb <> NIL DO p1 := p1^.nxtamb;
      p1^.nxtamb := p2
   END
END {AddSegmSeqs};



FUNCTION CreateAllSegmSeqs(p     : INTERFACE7_pSeqSegmKeys;
                           NrArgs: INTEGER;
                           VAR VARArgs  : ArgList;
                           rn    : INTERFACE7_pRowSeqSegmKeys)
                           : INTERFACE7_pRowSeqSegmKeys;
VAR
   result : INTERFACE7_pRowSeqSegmKeys;
   segm,
   np     : INTERFACE7_pSeqSegmKeys;
   i      : INTEGER;
   Args   : ArgList;
BEGIN
   DEBUG_WriteStr('-> CreateAllSegmSeqs',Debug_MaxIO,0,TRUE);
   DEBUG_WriteInteger(NrArgs, 5, TRUE);
   Debug_WriteLine(TRUE);

   Args   := VARArgs;
   result := NIL;
   np     := p;
   IF np = NIL THEN BEGIN

      DEBUG_WriteStr('-> Segment Sequence Found',Debug_MaxIO,0,TRUE);
      Debug_WriteLine(TRUE);

      result        := INTERFACE7_MakeSRowSeqSegm(result);
      result^.rn    := rn;
      FOR i := 1 TO (NrArgs-1) DO BEGIN
         segm := INTERFACE7_MakeSeqSegmStree(NIL);
         IF result^.lseq <> NIL THEN BEGIN
            result^.lseq^.nxtseg := segm;
            segm^.prvseg         := result^.lseq;
            result^.lseq         := segm
            END
         ELSE BEGIN
            result^.fseq := segm;
            result^.lseq := segm
         END;
         result^.fseq^.prvseg := result^.lseq;
         result^.lseq^.nxtseg := result^.fseq;
         segm^.stree := Args[i]
      END;
      END
   ELSE BEGIN
      REPEAT
{         DRAWSTREE_GenerateTree(np^.stree);
}
         IF LDCATSETS_BlexCat(np^.stree^.cat) OR
            LDAFFIXLEX_AffixCat(np^.stree^.cat) OR
            LDGLUELEX_GlueCat(np^.stree^.cat) THEN BEGIN
            DEBUG_WriteStr('-> Looking for right neighbours',Debug_MaxIO,0,TRUE);
            Debug_WriteLine(TRUE);
            Args[NrArgs] := np^.stree;
            result := AddSegmSeqs(CreateAllSegmSeqs(np^.rn, NrArgs+1, Args, rn),
                                  result);
            END
         ELSE BEGIN
            DEBUG_WriteStr('-> No Segment Stree',Debug_MaxIO,0,TRUE);
            Debug_WriteLine(TRUE);
         END;
         np := np^.nxtamb
      UNTIL np = p;
   END;

   CreateAllSegmSeqs := result;

   DEBUG_WriteStr('<- CreateAllSegmSeqs',Debug_MaxIO,0,TRUE);
   Debug_WriteLine(TRUE);
   
END {CreateAllSegmSeqs};



FUNCTION Reorganize(VAR r: INTERFACE7_pRowSeqSegmKeys): BOOLEAN;

VAR
   newr,
   last       : INTERFACE7_pRowSeqSegmKeys;
   Args       : ArgList;
   ErrorFound : BOOLEAN;
BEGIN
   DEBUG_WriteStr('-> Reorganize',Debug_MaxIO,0,TRUE);
   Debug_WriteLine(TRUE);

   newr := CreateAllSegmSeqs(r^.fseq, 1, Args, r^.rn);
   last := newr;
   IF last <> NIL THEN BEGIN
      WHILE last^.nxtamb <> NIL DO last := last^.nxtamb;
      last^.nxtamb := r^.nxtamb;
      WITH r^ DO BEGIN
	 fseq   := newr^.fseq;
	 lseq   := newr^.lseq;
	 nxtamb := newr^.nxtamb;
      END;
      ErrorFound := FALSE
      END
   ELSE ErrorFound := TRUE;

   Reorganize := ErrorFound;

   DEBUG_WriteStr('<- Reorganize',Debug_MaxIO,0,TRUE);
   Debug_WriteLine(TRUE);
END {Reorganize};




PROCEDURE AddToDataStructure(r: LISTREE_SetOfTupleOfStrees;
                             VAR OS: INTERFACE7_pSeqSegmKeys;
                             VAR C : INTERFACE7_pSeqSegmKeys;
                             currn : INTERFACE7_pSeqSegmKeys);
    
VAR
   tuple    : LISTREE_TupleOfStrees; 
   previous,
   segm,
   rn       : INTERFACE7_pSeqSegmKeys;
   dummybonus: INTEGER;
BEGIN
   IF not LISTREE_StillTupleOfStrees(r) THEN BEGIN
      DEBUG_WriteStr('Rule application fails',Debug_MaxIO,0,TRUE);
      Debug_WriteLine(TRUE)
      END
   ELSE BEGIN
      DEBUG_WriteStr('Rule application successful',Debug_MaxIO,0,TRUE);
      Debug_WriteLine(TRUE)
   END;
   WHILE LISTREE_StillTupleOfStrees(r) DO BEGIN
      LISTREE_TakeTupleOfStreesbonus(tuple, r, dummybonus);
      IF LISTREE_StillElements(tuple) THEN BEGIN
         OS := INTERFACE7_MakeSeqSegmStree(OS);
         LISTREE_ExtractFromTuple(OS^.stree, tuple);
         previous := NIL; segm := NIL;
         WHILE LISTREE_StillElements(tuple) DO BEGIN
            segm := INTERFACE7_MakeSeqSegmStree(nil);
            LISTREE_ExtractFromTuple(segm^.stree, tuple);
            segm^.prvseg := previous;
            previous := segm
         END;
         C^.prvseg := segm;
         rn := currn;
         WHILE segm <> NIL DO BEGIN
            segm^.nxtseg := C;
            segm^.rn     := rn;
            C            := segm;
            rn           := segm;
            segm         := segm^.prvseg
         END;
         OS^.rn := rn;
      END;
   END;

END {AddToDataStructure};


PROCEDURE RULES(p: INTERFACE7_pSeqSegmKeys; 
                VAR C: INTERFACE7_pSeqSegmKeys); 

VAR 
   OS, Dj, t,
   Clocal    : INTERFACE7_pSeqSegmKeys;
   PossRules : GENLEXIF_SetOfRules;
   R         : GENLEXIF_LexRuleType;
   result    : LISTREE_SetOfTupleOfStrees;
   catstr    : STR_String;
   catstring : STRING_String;
   len       : INTEGER;
BEGIN
   DEBUG_WriteStr('-> RULES',Debug_MaxIO,0,TRUE);
   Debug_WriteLine(TRUE);

   OS := p; Dj := NIL;
   WHILE OS <> NIL DO BEGIN
      t := OS; OS := OS^.nxtamb; t^.nxtamb := NIL;
      PossRules := GENLEXIF_Switch(t^.stree);
      WHILE GENLEXIF_StillRules(PossRules) DO BEGIN
	 GENLEXIF_TakeRule(R, PossRules);
	 DEBUG_WriteStr('Rule nr :',Debug_MaxIO,0,TRUE); 
         DEBUG_WriteInteger(R, 5, TRUE);
	 Debug_WriteLine(TRUE);
	 result := GENLEXIF_LexRule(R, t^.stree);
         AddToDataStructure(result, OS, C, t^.rn);
      END;
      t^.nxtamb := Dj; Dj := t
   END;
   p^.nxtamb := Dj;
   DEBUG_WriteStr('<- RULES',Debug_MaxIO,0,TRUE);
   Debug_WriteLine(TRUE);
END {RULES};


FUNCTION GLEXTREE_GLEXTREEplus(r: INTERFACE7_pRowSeqSegmKeys): 
                                        INTERFACE7_pRowSeqSegmKeys; 
VAR
   next,
   nq, q      : INTERFACE7_pRowSeqSegmKeys;
   Clocal, s  : INTERFACE7_pSeqSegmKeys;
   ErrorFound : BOOLEAN;
BEGIN
   DEBUG_WriteStr('-> GLEXTREE+',Debug_MaxIO,0,TRUE);
   Debug_WriteLine(TRUE);

   GENLEXIF_Init;
   ErrorFound := FALSE;
   r := r^.prv; q:=r;
   REPEAT                      { loop over all words }
      nq := q; 
      DEBUG_WriteStr('wordid ',Debug_MaxIO,0,TRUE);
      DEBUG_WriteInteger(nq^.idnr, 5, TRUE);
      Debug_WriteLine(TRUE);
      WHILE (nq <> nil) AND NOT ErrorFound DO BEGIN { loop over all segmentations of the current wrd}
         s := nq^.fseq; 
         IF s <> NIL THEN BEGIN
            s^.prvseg        := nq^.lseq;
            nq^.lseq^.nxtseg := s;
            REPEAT         
               Clocal         := s^.nxtseg;
               Clocal^.prvseg := NIL;
               s^.nxtseg      := NIL;
               RULES(s, Clocal);
               Clocal^.prvseg := s;
               s^.nxtseg := Clocal;
               s := s^.nxtseg
            UNTIL s = nq^.fseq
         END;
         next := nq^.nxtamb;
         ErrorFound := Reorganize(nq);
         nq := next;
      END;      
      q := q^.prv
   UNTIL (r = q) OR ErrorFound;

   r := r^.nxt;

{
   q := r;
   REPEAT
      nq := q;
      DEBUG_WriteStr('New Word Node',Debug_MaxIO,0,TRUE);
      Debug_WriteLine(TRUE);
      REPEAT
         DEBUG_WriteStr('New Word Ambiguity',Debug_MaxIO,0,TRUE);
         Debug_WriteLine(TRUE);
         s := nq^.fseq;
         IF s <> NIL THEN BEGIN
            REPEAT
              DRAWSTREE_GenerateTree(s^.stree);
               s := s^.nxtseg
            UNTIL s = nq^.fseq;
            END
         ELSE BEGIN
            DEBUG_WriteStr('No Strees',Debug_MaxIO,0,TRUE);
            Debug_WriteLine(TRUE);
         END;
         nq := nq^.nxtamb;
      UNTIL nq = NIL;
      q := q^.nxt;
   UNTIL q = r;
}

   IF NOT ErrorFound THEN GLEXTREE_GLEXTREEplus := r
                     ELSE GLEXTREE_GLEXTREEplus := NIL;

   DEBUG_WriteStr('<- GLEXTREE+',Debug_MaxIO,0,TRUE);
   Debug_WriteLine(TRUE);
END {GLEXTREE_GLEXTREEplus};

