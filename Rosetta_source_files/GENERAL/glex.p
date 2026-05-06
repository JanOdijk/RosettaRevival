(*MPD:::===================================================================*
 *
 *  Rosetta Project                                                 
 *                                                                  
 *  Module Title    : GLEX
 *  Creation date   :                                               
 *  Author          : J. Rous                                          
 *                                                                  
 *  Copyright (c) 1985, by Nederlandse Philips Bedrijven BV.        
 *                                                                  
 *  Remarks         :  
 *
 *EMP:::===================================================================*)

Export(GLEX);
pragma C_include('limorfdef.pf');
pragma C_include('listree.pf');
pragma C_include('string.pf');
pragma C_include('debug.pf');
pragma C_include('interface1.pf');
pragma C_include('interface7.pf');
pragma C_include('ldaffixlex.pf');
pragma C_include('ldgluelex.pf');
pragma C_include('ldgetkey.pf');
pragma C_include('ldcatsets.pf');
pragma C_include('lisdict.pf');
pragma C_include('glex.pf');

(*=========================================================================*
 *  Imported modules
 *=========================================================================*)

PROGRAM GLEX;
WITH LIMORFDEF, LISTREE, STRNG, DEBUG, INTERFACE1, INTERFACE7, LDAFFIXLEX,
     LDGLUELEX, LDGETKEY, LDCATSETS, LISDICT;

FUNCTION GStoFkey(r: INTERFACE7_pRowSeqSegmKeys): INTERFACE7_pRowSeqSegmKeys; 
VAR
   r1 : INTERFACE7_pRowSeqSegmKeys;

   FUNCTION TranslateKeys(r: INTERFACE7_pRowSeqSegmKeys): INTERFACE7_pRowSeqSegmKeys; 
   VAR
      nxtamb,
      wi     : INTERFACE7_pRowSeqSegmKeys;
      ki     : INTERFACE7_pSeqSegmKeys;
      vi, ui : INTERFACE7_pRowSeqSegmKeys;
      rec    : LISDICT_RecordDef;
      f      : BOOLEAN;

   BEGIN
      DEBUG_WriteStr('-> TranslateKeys',DEBUG_MaxIO, 0,TRUE);
      Debug_WriteLine(TRUE);
      vi := r;
      REPEAT
	 wi := vi;
	 WHILE wi <> nil DO BEGIN
            nxtamb := wi^.nxtamb;
	    ki := wi^.fseq;
	    REPEAT
	       IF ki^.keykind = BASTYPE THEN BEGIN
		  f := LISDICT_GetGSDict(ki^.KEY, rec);
	          IF f THEN BEGIN
                     ki^.KEY := rec.fkey
                  END
	       END;
	       ki := ki^.nxtseg
	    UNTIL ( ki = wi^.fseq );
	    wi := nxtamb
	 END;
	 vi := vi^.nxt
      UNTIL vi = r^.prv;
      TranslateKeys := r;
      DEBUG_WriteStr('<- TranslateKey',DEBUG_MaxIO, 0,TRUE);
      Debug_WriteLine(TRUE);
   END {TranslateKeys};

BEGIN
   r1 := TranslateKeys(r);
   GStoFkey := r1;
END {GStoFkey};


FUNCTION GKLEX(r: INTERFACE7_pSeqSegmKeys;
               SingleSegment: BOOLEAN): INTERFACE7_pSeqSegmKeys; 
VAR
   t: LISTREE_pStree;
BEGIN
   DEBUG_WriteStr('-> AKLEX',DEBUG_MaxIO,0,TRUE);
   Debug_WriteLine(TRUE);
   t := r^.stree;
   r^.segkind := keyseg;

   (*----------------------------------------------------------------------*
    * The conditions in the following piece of software are complicated
    * by the fact that some categories may appear in more than one set, e.g.
    * the category PART is both a prefixcat and a blexcat. 
    * Therefore I assume that prefixes and suffixes can never appear in
    * isolation and, furthermore, that an S-tree can be found in b-lex
    * if it has a blexcat and if it is not a prefixcat or it is a single
    * segment. E.g. The PART S-tree in ,PART + BVERB, will be a prefix
    * but the PART S-tree in ,PART,BVERB will be a basic word.
    *----------------------------------------------------------------------*)

   IF LDAFFIXLEX_PrefixCat(t^.cat) AND NOT SingleSegment THEN BEGIN
      r^.keykind := PFKTYPE;
      r^.PFK     := LDAFFIXLEX_GetPrefixKey(t);
      DEBUG_WriteStr('Prefix ',DEBUG_MaxIO,0,TRUE);
      DEBUG_WriteInteger(r^.PFK, 5, TRUE);
      END
   ELSE IF LDAFFIXLEX_SuffixCat(t^.cat) AND NOT SingleSegment THEN BEGIN
      r^.keykind := SFKTYPE;
      r^.SFK     := LDAFFIXLEX_GetSuffixKey(t);
      DEBUG_WriteStr('Suffix ',DEBUG_MaxIO,0,TRUE);
      DEBUG_WriteInteger(r^.SFK, 5, TRUE);
      END
   ELSE IF LDGLUELEX_GlueCat(t^.cat) THEN BEGIN
      r^.keykind := GLUTYPE;
      DEBUG_WriteStr('Glue ',DEBUG_MaxIO,0,TRUE);
      END
   ELSE IF LDCATSETS_BlexCat(t^.cat) AND (NOT LDAFFIXLEX_SuffixCat(t^.cat) OR
                                          SingleSegment) 
                                     AND (NOT LDAFFIXLEX_PrefixCat(t^.cat) OR
                                          SingleSegment) THEN BEGIN
      r^.keykind := BASTYPE;
      r^.KEY     := LDGETKEY_Get(t);
      DEBUG_WriteStr('BasicKey ',DEBUG_MaxIO,0,TRUE);
      DEBUG_WriteInteger(r^.KEY, 5, TRUE);
   END;
   Debug_WriteLine(TRUE);
   GKLEX      := r;
   DEBUG_WriteStr('<- GKLEX',DEBUG_MaxIO,0,TRUE);
   Debug_WriteLine(TRUE);
END {GKLEX};


FUNCTION GWLEX(r: INTERFACE7_pRowSeqSegmKeys): INTERFACE7_pRowSeqSegmKeys; 
VAR 
   wi     : INTERFACE7_pRowSeqSegmKeys;
   ti, ki : INTERFACE7_pSeqSegmKeys;
   SingleSegment : BOOLEAN;
BEGIN
   DEBUG_WriteStr('-> GWLEX',DEBUG_MaxIO,0,TRUE);
   Debug_WriteLine(TRUE);
   wi := r;
   WHILE wi <> nil DO BEGIN
      ki := wi^.fseq;
      SingleSegment := wi^.fseq = wi^.lseq;
      REPEAT
         IF ki <> nil THEN BEGIN
            ti := GKLEX(ki, SingleSegment);
            ki := ki^.nxtseg
         END;
      UNTIL ki = wi^.fseq;
      wi := wi^.nxtamb
   END;
   GWLEX := r;
   DEBUG_WriteStr('<- GWLEX',DEBUG_MaxIO,0,TRUE);
   Debug_WriteLine(TRUE);
END {GWLEX};


FUNCTION GLEX(r: INTERFACE7_pRowSeqSegmKeys): INTERFACE7_pRowSeqSegmKeys; 
VAR 
   vi, ui : INTERFACE7_pRowSeqSegmKeys;
BEGIN
   DEBUG_WriteStr('-> GLEX',DEBUG_MaxIO,0,TRUE);
   Debug_WriteLine(TRUE);
   vi := r;
   REPEAT
      ui := GWLEX(vi);
      vi := vi^.nxt
   UNTIL vi = r^.prv;
   GLEX := r;
   DEBUG_WriteStr('<- GLEX',DEBUG_MaxIO,0,TRUE);
   Debug_WriteLine(TRUE);
END {GLEX};


FUNCTION GLEX_GLEXplus(r: INTERFACE7_pRowSeqSegmKeys): 
                                  INTERFACE7_pRowSeqSegmKeys; 
VAR
   q, r1 : INTERFACE7_pRowSeqSegmKeys;
BEGIN
   DEBUG_WriteStr('-> GLEX+',DEBUG_MaxIO,0,TRUE);
   Debug_WriteLine(TRUE);

   q := NIL;
   IF r <> NIL THEN BEGIN
      r1  := GLEX(r);
      q   := GStoFkey(r1);
   END;

   GLEX_GLEXplus := q;
   DEBUG_WriteStr('<- GLEX+',DEBUG_MaxIO,0,TRUE);
   Debug_WriteLine(TRUE);
END {GLEX_GLEXplus};

