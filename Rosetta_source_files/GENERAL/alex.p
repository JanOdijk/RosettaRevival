(*MPD:::===================================================================*
 *
 *  Rosetta Project                                                 
 *                                                                  
 *  Module Title    : ALEX
 *  Creation date   :                                               
 *  Author          : J. Rous                                          
 *                                                                  
 *  Copyright (c) 1985, by Nederlandse Philips Bedrijven BV.        
 *                                                                  
 *  Remarks         :  
 *
 *EMP:::===================================================================*)

Export(ALEX);
pragma C_include('limorfdef.pf');
pragma C_include('listree.pf');
pragma C_include('string.pf');
pragma C_include('debug.pf');
pragma C_include('interface1.pf');
pragma C_include('ldaffixlex.pf');
pragma C_include('ldgluelex.pf');
pragma C_include('ldblex.pf');
pragma C_include('lisdict.pf');
pragma C_include('alex.pf');

(*=========================================================================*
 *  Imported modules
 *=========================================================================*)

PROGRAM ALEX;
WITH LIMORFDEF, LISTREE, STRNG, DEBUG, INTERFACE1, LDAFFIXLEX, LDGLUELEX, 
     LDBLEX, LISDICT;

VAR
   BxprCounter : INTEGER;

FUNCTION AFtoSkey(r: INTERFACE1_pRowSeqSegmKeys): INTERFACE1_pRowSeqSegmKeys; 
CONST
   MaxHashTable = 997; { Must be a prime number !!!!! }
VAR
   HashTable : ARRAY[0..MaxHashTable] OF INTEGER;
   r1        : INTERFACE1_pRowSeqSegmKeys;


   PROCEDURE InitHashTable;
   VAR
      i : 0..MaxHashTable;
   BEGIN
      FOR i := 0 TO MaxHashTable DO HashTable[i] := -1;
   END {InitHashTable};


   PROCEDURE StoreKey(k: INTEGER); {cf. Wirth: Alg. + Data Str. = Programs,}
                                   {page 266-269                           }
   VAR
      h, d   : INTEGER;
      f      : BOOLEAN;
   BEGIN
      DEBUG_WriteStr('-> StoreKey',DEBUG_MaxIO, 0,TRUE);
      DEBUG_WriteInteger(k, 5, TRUE);
      Debug_WriteLine(TRUE);
      h := abs(k) mod MaxHashTable; f := FALSE; d := 1;
      REPEAT
         IF HashTable[h] = -1 THEN BEGIN
            DEBUG_WriteStr('Stored at entry : ', DEBUG_MaxIO, 0,TRUE);
            DEBUG_WriteInteger(h, 5, TRUE);
            Debug_WriteLine(TRUE);
            HashTable[h] := k;
            f := TRUE
            END
         ELSE BEGIN {collision}
            DEBUG_WriteStr('collision at ',DEBUG_MaxIO, 0,TRUE);
            DEBUG_WriteInteger(h, 5, TRUE);
            Debug_WriteLine(TRUE);
            h := h+d; d := d+2;
            IF h >= MaxHashTable THEN h := h-MaxHashTable;
            IF d = MaxHashTable THEN BEGIN
               writeln('ALEX: Hash table overflow');
               f := TRUE;
            END;
         END
      UNTIL f;
      DEBUG_WriteStr('<- StoreKey',DEBUG_MaxIO, 0,TRUE);
      Debug_WriteLine(TRUE);
   END {StoreKey};


   FUNCTION FindKey(k: INTEGER): BOOLEAN;
                          {cf. Wirth: Alg. + Data Str. = Programs,}
                          {page 266-269                           }
   VAR
      h, d   : INTEGER;
      present,
      f      : BOOLEAN;
   BEGIN
      DEBUG_WriteStr('-> FindKey',DEBUG_MaxIO, 0,TRUE);
      DEBUG_WriteInteger(k, 5, TRUE);
      Debug_WriteLine(TRUE);
      h := abs(k) mod MaxHashTable; f := FALSE; d := 1; present := TRUE;
      REPEAT
         IF HashTable[h] = -1 THEN BEGIN
            present := FALSE;
            DEBUG_WriteStr('not present',DEBUG_MaxIO, 0,TRUE);
            Debug_WriteLine(TRUE);
            END
         ELSE IF HashTable[h] = k THEN BEGIN
            f := TRUE;
            DEBUG_WriteStr('found at entry ',DEBUG_MaxIO, 0,TRUE);
            DEBUG_WriteInteger(h, 5, TRUE);
            Debug_WriteLine(TRUE);
            END
         ELSE BEGIN {collision}
            DEBUG_WriteStr('collision at ',DEBUG_MaxIO, 0,TRUE);
            DEBUG_WriteInteger(h, 5, TRUE);
            Debug_WriteLine(TRUE);
            h := h+d; d := d+2;
            IF h >= MaxHashTable THEN h := h-MaxHashTable;
            IF d = MaxHashTable THEN BEGIN
               writeln('ALEX: Hash table overflow');
               f := TRUE;
            END;
         END;
      UNTIL f OR NOT present;
      FindKey := present
   END {FindKey};


   PROCEDURE CollectKeys(r: INTERFACE1_pRowSeqSegmKeys);
   VAR
      wi     : INTERFACE1_pRowSeqSegmKeys;
      ki     : INTERFACE1_pSeqSegmKeys;
      vi, ui : INTERFACE1_pRowSeqSegmKeys;
   BEGIN
      DEBUG_WriteStr('-> CollectKeys',DEBUG_MaxIO, 0,TRUE);
      Debug_WriteLine(TRUE);
      vi := r;
      REPEAT
	 wi := vi;
	 WHILE wi <> nil DO BEGIN
	    ki := wi^.fseq;
	    REPEAT
	       IF ki <> nil THEN BEGIN
		  IF ( ki^.keykind IN [BASTYPE, SFKTYPE, PFKTYPE] ) AND
                     ( NOT ki^.robustmode )
                     THEN StoreKey(ki^.KEY);
		  ki := ki^.nxtseg
	       END
	    UNTIL ki = wi^.fseq;
	    wi := wi^.nxtamb
	 END;
	 vi := vi^.nxt
      UNTIL vi = r^.prv;
      DEBUG_WriteStr('<- CollectKeys',DEBUG_MaxIO, 0,TRUE);
      Debug_WriteLine(TRUE);
   END {CollectKeys};


   (*----------------------------------------------------------------------*
    * The next procedure performs the actual translation from fkey to skey.
    * The lexicons are organized in such a way that in most cases fkey value 
    * and skey value are the same. All other cases are listed in the lexicon
    * SDICT. Therefore the procedure TranslateKeys looks up a fkey in SDICT,
    * and if it is present it performs the translation to the corresponding
    * skey. That is, the fkey is replaced by the corresponding skeys. 
    * If it is not present the key value is not changed, ony the 
    * interpretation changes: from now on it will be interpreted as an skey.
    *
    * P.S. The fkey will not be looked up in SDICT, if it occurs in a
    *      segmentation with more than one stem. The reason for this is
    *      the fact that SDICT is mainly used for Verbs with Particles.
    *      For these cases it is not clear how a compound containing more than
    *      one verb that can have a paritcle should be treated. 
    *
    * P.S. The previous P.S. is no longer valid. From now (17-1-1990) on the
    *      fkey will be looked up in SDICT even if it occurs in a segmentation
    *      with more than one stem. However, the translation will be performed
    *      only once in a segmentation !!
    *----------------------------------------------------------------------*)

   FUNCTION TranslateKeys(r: INTERFACE1_pRowSeqSegmKeys): INTERFACE1_pRowSeqSegmKeys; 
   VAR
      newlist,
      nxtamb,
      wi     : INTERFACE1_pRowSeqSegmKeys;
      ki     : INTERFACE1_pSeqSegmKeys;
      vi, ui : INTERFACE1_pRowSeqSegmKeys;
      rec    : LISDICT_RecordDef;
      equal,
      f,
      StemFound: BOOLEAN;

      FUNCTION IsCorrectContext(r: LISDICT_RecordDef): BOOLEAN;
      VAR
         correct : BOOLEAN;
         i       : INTEGER;
      BEGIN
         DEBUG_WriteStr('-> IsCorrectContext',DEBUG_MaxIO, 0,TRUE);
         Debug_WriteLine(TRUE);
         correct := TRUE; i := 0;
         WHILE (i < r.nr) AND (correct = TRUE) DO BEGIN
            i := i+1;
            correct := FindKey(r.ctxt[i]);
         END;
         IF correct THEN
            DEBUG_WriteStr(' yes',DEBUG_MaxIO, 0,TRUE)
         ELSE
            DEBUG_WriteStr(' no',DEBUG_MaxIO, 0,TRUE);
         Debug_WriteLine(TRUE);
         IsCorrectContext := correct;
      END {IsCorrectContext};


      PROCEDURE AddToNewlist(VAR newlist: INTERFACE1_pRowSeqSegmKeys;
                             wi     : INTERFACE1_pRowSeqSegmKeys;
                             skey   : INTEGER;
                             ki     : INTERFACE1_pSeqSegmKeys);
      VAR
         a : INTERFACE1_pRowSeqSegmKeys;
         b,
         k : INTERFACE1_pSeqSegmKeys;
      BEGIN
         DEBUG_WriteStr('-> AddToNewList',DEBUG_MaxIO, 0,TRUE);
         Debug_WriteLine(TRUE);
         a := INTERFACE1_MakeWRowSeqSegm(NIL);
         a^ := wi^;
         IF newlist <> NIL THEN a^.nxtamb := newlist;
         k := wi^.fseq; a^.fseq := NIL;
         REPEAT
            b := INTERFACE1_MakeSeqSegmStree(NIL); b^ := k^;
            IF a^.fseq = NIL THEN BEGIN
               a^.fseq := b; a^.lseq := b;
               END
            ELSE BEGIN
               b^.prvseg := a^.lseq;
               a^.lseq^.nxtseg := b;
               a^.lseq := b
            END;
            IF k = ki THEN b^.KEY := skey;
            k := k^.nxtseg;
         UNTIL k = wi^.fseq;
         a^.fseq^.prvseg := a^.lseq;
         a^.lseq^.nxtseg := a^.fseq;
         newlist := a;
         DEBUG_WriteStr('<- AddToNewList',DEBUG_MaxIO, 0,TRUE);
         Debug_WriteLine(TRUE);
      END {AddToNewlist};


   BEGIN
      DEBUG_WriteStr('-> TranslateKeys',DEBUG_MaxIO, 0,TRUE);
      Debug_WriteLine(TRUE);
      vi := r;
      REPEAT
	 wi := vi;
	 WHILE wi <> nil DO BEGIN
            nxtamb := wi^.nxtamb;
            IF TRUE {wi^.NrStems = 1} THEN BEGIN
   	       ki := wi^.fseq;
               newlist := NIL; StemFound := FALSE;
	       REPEAT
		  IF ki^.keykind = BASTYPE THEN BEGIN
		     equal := FALSE;
		     f := LISDICT_GetASDict(ki^.KEY, rec);
		     REPEAT
			IF f THEN BEGIN
                           IF NOT equal THEN equal := ( rec.skey = rec.fkey );
			   IF IsCorrectContext(rec) THEN BEGIN
                              StemFound := TRUE; 
			      AddToNewlist(newlist, wi, rec.skey, ki )
			   END;
			   f := LISDICT_GetNextASDict(ki^.KEY, rec);
			END;
		     UNTIL not f
		  END;
		  ki := ki^.nxtseg
	       UNTIL ( ki = wi^.fseq ) OR StemFound;

               (*-------------------------------------------------------------*
                * Insert newlist chain into wi chain
                *-------------------------------------------------------------*)

               IF newlist <> NIL THEN BEGIN
                  IF equal THEN wi^ := newlist^
                  ELSE wi^.nxtamb := newlist;
               END
            END;
	    wi := nxtamb
	 END;
	 vi := vi^.nxt
      UNTIL vi = r^.prv;
      TranslateKeys := r;
      DEBUG_WriteStr('<- TranslateKey',DEBUG_MaxIO, 0,TRUE);
      Debug_WriteLine(TRUE);
   END {TranslateKeys};

BEGIN
   InitHashTable;
   CollectKeys(r);
   r1 := TranslateKeys(r);
   AFtoSkey := r1;
END {AFtoSkey};


FUNCTION AKLEX(r: INTERFACE1_pSeqSegmKeys;
               X, Y, len : INTEGER): INTERFACE1_pSeqSegmKeys; 
VAR
   t : LISTREE_pStree;
BEGIN
   DEBUG_WriteStr('-> AKLEX',DEBUG_MaxIO, 0,TRUE);
   Debug_WriteLine(TRUE);
   t := NIL;
   IF NOT r^.robustmode THEN BEGIN
      CASE r^.keykind OF
	 PFKTYPE   : BEGIN
			DEBUG_WriteStr('Prefix ',DEBUG_MaxIO, 0,TRUE);
			DEBUG_WriteInteger(r^.PFK, 5, TRUE);
			t := LDAFFIXLEX_Prefix(r^.PFK);
		     END;
	 SFKTYPE   : BEGIN
			DEBUG_WriteStr('Suffix ',DEBUG_MaxIO, 0,TRUE);
			DEBUG_WriteInteger(r^.SFK, 5, TRUE);
			t := LDAFFIXLEX_Suffix(r^.SFK);
		     END;
	 GLUTYPE   : BEGIN
			DEBUG_WriteStr('GLUE ',DEBUG_MaxIO, 0,TRUE);
			t := LDGLUELEX_Glue;
		     END;
	 BASTYPE   : BEGIN
			DEBUG_WriteStr('BasicKey ',DEBUG_MaxIO, 0,TRUE);
			DEBUG_WriteInteger(r^.KEY, 5, TRUE);
			t := LDBLEX_Read(r^.KEY);
                        t^.LI^.X   := X;
                        t^.LI^.Y   := Y;
                        t^.LI^.len := len;
                        BxprCounter:= BxprCounter+1;
                        t^.LI^.BxprId  := BxprCounter;
		     END;
	 IDPTYPE   : t := NIL
      END;
      Debug_WriteLine(TRUE);
      IF t = nil THEN writeln('LEXICONS INCONSISTENT, CANNOT FIND KEY');
      r^.segkind := streeseg;
      r^.stree   := t;
      END
   ELSE BEGIN
      r^.segkind := streeseg;
      r^.stree   := NIL;
   END;
   AKLEX      := r;
   DEBUG_WriteStr('<- AKLEX',DEBUG_MaxIO, 0,TRUE);
   Debug_WriteLine(TRUE);
END {AKLEX};


FUNCTION AWLEX(r: INTERFACE1_pRowSeqSegmKeys): INTERFACE1_pRowSeqSegmKeys; 
VAR 
   wi     : INTERFACE1_pRowSeqSegmKeys;
   ti, ki : INTERFACE1_pSeqSegmKeys;
BEGIN
   DEBUG_WriteStr('-> AWLEX',DEBUG_MaxIO, 0,TRUE);
   Debug_WriteLine(TRUE);
   wi := r;
   WHILE wi <> nil DO BEGIN
      DEBUG_WriteStr('-> ASLEX',DEBUG_MaxIO, 0,TRUE);
      Debug_WriteLine(TRUE);
      ki := wi^.fseq;
      REPEAT
         IF ki <> nil THEN BEGIN
            ti := AKLEX(ki, wi^.X, wi^.Y, wi^.len);
            ki := ki^.nxtseg
         END
      UNTIL ki = wi^.fseq;
      DEBUG_WriteStr('<- ASLEX',DEBUG_MaxIO, 0,TRUE);
      Debug_WriteLine(TRUE);
      wi := wi^.nxtamb
   END;
   AWLEX := r;
   DEBUG_WriteStr('<- AWLEX',DEBUG_MaxIO, 0,TRUE);
   Debug_WriteLine(TRUE);
END {AWLEX};


FUNCTION ALEX(r: INTERFACE1_pRowSeqSegmKeys): INTERFACE1_pRowSeqSegmKeys; 
VAR 
   vi, ui : INTERFACE1_pRowSeqSegmKeys;
BEGIN
   DEBUG_WriteStr('-> ALEX',DEBUG_MaxIO, 0,TRUE);
   Debug_WriteLine(TRUE);
   vi := r;
   REPEAT
      ui := AWLEX(vi);
      vi := vi^.nxt
   UNTIL vi = r^.prv;
   ALEX := r;
   DEBUG_WriteStr('<- ALEX',DEBUG_MaxIO, 0,TRUE);
   Debug_WriteLine(TRUE);
END {ALEX};


FUNCTION ALEX_ALEXplus(r: INTERFACE1_pRowSeqSegmKeys): 
                                  INTERFACE1_pRowSeqSegmKeys; 
VAR
   q, r1, r2 : INTERFACE1_pRowSeqSegmKeys;
BEGIN
   DEBUG_WriteStr('-> ALEX+',DEBUG_MaxIO, 0,TRUE);
   Debug_WriteLine(TRUE);
   BxprCounter := 0;

   r1 := AFtoSkey(r);

   q  := ALEX(r1);
   ALEX_ALEXplus := q;
   DEBUG_WriteStr('<- ALEX+',DEBUG_MaxIO, 0,TRUE);
   Debug_WriteLine(TRUE);
END {ALEX_ALEXplus};

