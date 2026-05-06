(*MPI:::===================================================================*
 *
 *  Rosetta Project
 *
 *  Module Title    : LDAFFIXLEX
 *  Creation date   :  6-JAN-1987
 *  Author          : Joep Rous
 *
 *  Copyright (c) 1986, by Nederlandse Philips Bedrijven BV.
 *
 *  Remarks         : This is an "LD"-type module, so the implementation
 *                    part of this module can be found in the different
 *                    language directories.
 *
 *EMP:::===================================================================*)

Export(LDAFFIXLEX);
pragma C_include('listree.pf');
pragma C_include('lidomaint.pf');
pragma C_include('maket.pf');
pragma C_include('lsdomaint.pf');
pragma C_include('lsstree.pf');
pragma C_include('ldblex.pf');
pragma C_include('ldcatsets.pf');
pragma C_include('ldgetkey.pf');
pragma C_include('ldaffixlex.pf');


(*=========================================================================*
 *  Imported modules
 *=========================================================================*)


PROGRAM LDAFFIXLEX;
WITH LISTREE, LIDOMAINT, MAKET, LSDOMAINT, LSSTREE, LDBLEX, LDCATSETS, 
     LDGETKEY;

   (*----------------------------------------------------------------------*
    * Morphological affixes have a key < 0. If the key is greater than
    * 0 the affixes also occur in the syntax and should therefore be looked up
    * in B-Lex
    *----------------------------------------------------------------------*)

FUNCTION LDAFFIXLEX_Suffix(key: INTEGER): LISTREE_pStree;
VAR
   t : LSSTREE_pStree;
BEGIN

   IF key < 0 THEN BEGIN
      t := MAKET_Stree(SFCAT);
      t^.LS^.SFCATfield^.KEY := key;
      LDAFFIXLEX_Suffix := LOOPHOLES.RETYPE(t,LISTREE_pStree)
      END
   ELSE BEGIN
      LDAFFIXLEX_Suffix := LDBLEX_Read(key);
   END;
END {LDAFFIXLEX};



FUNCTION LDAFFIXLEX_Prefix(key: INTEGER): LISTREE_pStree;
VAR
   t : LSSTREE_pStree;
BEGIN
   IF key < 0 THEN BEGIN
      t := MAKET_Stree(PFCAT);
      t^.LS^.PFCATfield^.KEY := key;
      LDAFFIXLEX_Prefix := LOOPHOLES.RETYPE(t,LISTREE_pStree)
      END
   ELSE BEGIN
      LDAFFIXLEX_Prefix := LDBLEX_Read(key);
   END;
END {LDAFFIXLEX};


FUNCTION LDAFFIXLEX_PrefixCat(c: LIDOMAINT_syntcat): BOOLEAN;
BEGIN
   LDAFFIXLEX_PrefixCat := LDCATSETS_PrefixCat(c) OR 
                           ( LOOPHOLES.RETYPE(c,LSDOMAINT_syntcat) = PFCAT )
END {LDAFFIXLEX_PrefixCat};


FUNCTION LDAFFIXLEX_SuffixCat(c: LIDOMAINT_syntcat): BOOLEAN;
BEGIN
   LDAFFIXLEX_SuffixCat := LDCATSETS_SuffixCat(c) OR 
                           ( LOOPHOLES.RETYPE(c,LSDOMAINT_syntcat) = SFCAT )
END {LDAFFIXLEX_SuffixCat};


FUNCTION LDAFFIXLEX_AffixCat(c: LIDOMAINT_syntcat): BOOLEAN;
BEGIN
   LDAFFIXLEX_AffixCat := LDAFFIXLEX_PrefixCat(c) OR 
                          LDAFFIXLEX_SuffixCat(c);
END {LDAFFIXLEX_AffixCat};


FUNCTION LDAFFIXLEX_GetPrefixKey(t: LISTREE_pStree): INTEGER;
VAR
   v : LSSTREE_pStree;
BEGIN
   IF LDCATSETS_SuffixCat(t^.cat) THEN BEGIN
      LDAFFIXLEX_GetPrefixKey := LDGETKEY_Get(t)
      END
   ELSE BEGIN
      v := Loopholes.Retype(t,LSSTREE_pStree);
      LDAFFIXLEX_GetPrefixKey := v^.LS^.PFCATfield^.KEY
   END;
END {LDAFFIXLEX_GetPrefixKey};


FUNCTION LDAFFIXLEX_GetSuffixKey(t: LISTREE_pStree): INTEGER;
VAR
   v : LSSTREE_pStree;
BEGIN
   IF LDCATSETS_SuffixCat(t^.cat) THEN BEGIN
      LDAFFIXLEX_GetSuffixKey := LDGETKEY_Get(t)
      END
   ELSE BEGIN
      v := Loopholes.Retype(t,LSSTREE_pStree);
      LDAFFIXLEX_GetSuffixKey := v^.LS^.PFCATfield^.KEY
   END;
END {LDAFFIXLEX_GetSuffixKey};


