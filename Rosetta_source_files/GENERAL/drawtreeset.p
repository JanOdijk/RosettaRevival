(*MPI:::===================================================================*
 *
 *  Rosetta Project
 *
 *  Module Title    : DrawTreeSet
 *  Creation date   : 6-6-1991
 *  Author          : Y. van Dinther
 *
 *  Copyright (c) 1986, by Nederlandse Philips Bedrijven BV.
 *
 *  Remarks         : This module is an auxiliary module to the modules
 *                    debugmparser and debugmgenerator.
 *
 *EMP:::===================================================================*)

Export(DRAWTREESET);
pragma C_include('listree.pf');
pragma C_include('oldtree.pf');
pragma C_include('wnd.pf');
pragma C_include('drawtree.pf');
pragma C_include('drawstree.pf');
pragma C_include('globdef.pf');
pragma C_include('lidomaint.pf');
pragma C_include('error.pf');
pragma C_include('loop.pf');
pragma C_include('drawtreeset.pf');


(*=========================================================================*
 *  Imported modules
 *=========================================================================*)


PROGRAM DrawTreeSet;
WITH LISTREE, OLDTREE, WND, DRAWTREE, DRAWSTREE, GLOBDEF, LIDOMAINT, ERROR, LOOP;

TYPE TREES_INFO = RECORD
                      STS          : LISTREE_SetOfTupleOfStrees;
                      SS           : LISTREE_SetOfStrees;
                      SS_used      : BOOLEAN;
                  END;
VAR info_array : array [0..MAX_SCREENS - 1] of TREES_INFO;


FUNCTION SetOfTupleCard (screen_nr : integer): INTEGER;
VAR
   ST : LISTREE_SetOfTupleOfStrees;
   T  : LISTREE_TupleOfStrees;
   c  : INTEGER;
   dumbonus: INTEGER;
BEGIN
   ST := info_array[screen_nr].STS; c := 0;
   WHILE LISTREE_StillTupleOfStrees(ST) DO BEGIN
      c := c+1;
      LISTREE_TakeTupleOfStreesBonus(T, ST, dumbonus)      
   END;
   SetOfTupleCard := c
END {SetOfTupleCard};


FUNCTION TupleArity (screen_nr : integer): INTEGER;
VAR
   ST : LISTREE_SetOfTupleOfStrees;
   T  : LISTREE_TupleOfStrees;
   s  : LISTREE_pStree;
   c  : INTEGER;
   dumbonus: INTEGER;
BEGIN
   ST := info_array[screen_nr].STS;
   c := 0;
   IF LISTREE_StillTupleOfStrees(ST) THEN BEGIN
      LISTREE_TakeTupleOfStreesBonus(T, ST, dumbonus); 
      WHILE LISTREE_StillElements(T) DO BEGIN
         c := c+1;
         LISTREE_ExtractFromTuple(s, T);
      END;
   END;
   TupleArity := c
END {TupleArity};


FUNCTION FindStree(It, Is, screen_nr: INTEGER): LISTREE_pStree;
VAR
   ST : LISTREE_SetOfTupleOfStrees;
   T  : LISTREE_TupleOfStrees;
   s  : LISTREE_pStree;
   c1 : INTEGER;
   c2 : INTEGER;
   dumbonus: INTEGER;
BEGIN
   ST := info_array[screen_nr].STS;
   c1 := 0; c2 := 0;
   WHILE LISTREE_StillTupleOfStrees(ST) AND (c1 < It) DO BEGIN
      c1 := c1+1;
      LISTREE_TakeTupleOfStreesBonus(T, ST, dumbonus); 
      IF c1 = It THEN BEGIN
         WHILE LISTREE_StillElements(T) AND (c2 < Is ) DO BEGIN
            c2 := c2+1;
            LISTREE_ExtractFromTuple(s, T);
         END;
      END;
   END;
   FindStree := s;
END {FindStree};

{ the following two functions are needed especially for a set of Strees.
  These will be handled here as a set of tuples of Strees where tuple-length
  is 1. The internal representation however is different
}
FUNCTION SetOfStreeCard (screen_nr : integer): INTEGER;
VAR
   SS : LISTREE_SetOfStrees;
   T  : LISTREE_pStree;
   c  : INTEGER;
BEGIN
   SS := info_array[screen_nr].SS; c := 0;
   WHILE LISTREE_StillStrees(SS) DO BEGIN
      c := c+1;
      LISTREE_TakeStree(T, SS)      
   END;
   SetOfStreeCard := c
END {SetOfStreeCard};


FUNCTION FindStreeInSet(i, screen_nr: INTEGER): LISTREE_pStree;
VAR
   SS : LISTREE_SetOfStrees;
   T  : LISTREE_pStree;
   c  : INTEGER;
BEGIN
   SS := info_array[screen_nr].SS; c := 0;
   WHILE LISTREE_StillStrees(SS) AND (c < i) DO BEGIN
      c := c+1;
      LISTREE_TakeStree(T, SS)      
   END;
   FindStreeInSet := T
END {FindStreeInSet};


PROCEDURE draw_new_tree ( tuple_nr, stree_nr, screen_nr : INTEGER );
VAR
   Stree        : LISTREE_pStree;
BEGIN

   IF info_array[screen_nr].SS_used THEN BEGIN
      Stree := FindStreeInSet(tuple_nr, screen_nr);
   END
   ELSE BEGIN
      Stree := FindStree(tuple_nr, stree_nr, screen_nr);
   END;
   DrawSTree_CreateTree (Stree, WND_CodeKey (X_trees_area, screen_nr));

END;

PROCEDURE DrawTreeSet_Generate (STS : LISTREE_SetOfTupleOfStrees;
                                SS : LISTREE_SetOfStrees;
                                tuple_nr, stree_nr: INTEGER;
                                tuple_on, stree_on: BOOLEAN;
                                parent : WND_Xid);
VAR screen_nr : INTEGER;
BEGIN
   screen_nr := DrawTreeSet_Manage (STS, SS, tuple_nr, stree_nr,
                                    tuple_on, stree_on, parent);
   IF screen_nr <> -1 THEN
      Loop_HandleKey (WND_CodeKey(X_trees_ok_button, screen_nr));
END;

FUNCTION DrawTreeSet_Manage    (STS : LISTREE_SetOfTupleOfStrees;
                                SS : LISTREE_SetOfStrees;
                                tuple_nr, stree_nr: INTEGER;
                                tuple_on, stree_on: BOOLEAN;
                                parent : WND_Xid): INTEGER;
VAR
   keys         : array [1..3] of WND_Xid;
   card, arity,
   screen_nr    : INTEGER;
BEGIN

   IF WND_GetFreeScreenNr (WND_Trees, screen_nr) THEN BEGIN
      WND_Fetch (WND_CodeKey (X_trees_window, screen_nr));
      info_array[screen_nr].STS  := STS;
      info_array[screen_nr].SS   := SS;
      info_array[screen_nr].SS_used := ( tuple_on AND not stree_on );
      IF info_array[screen_nr].SS_used THEN BEGIN
         card := SetOfStreeCard (screen_nr);
         arity := 1;
      END
      ELSE BEGIN
         card := SetOfTupleCard (screen_nr);
         arity := TupleArity (screen_nr);
      END;
      IF card * arity = 0 THEN BEGIN
         Error_Write (ERROR_NoTreesFound);
         WND_FreeScreenNr (WND_Trees, screen_nr);
         screen_nr := -1;
      END
      ELSE BEGIN
         WND_SetInteger (WND_CodeKey (X_trees_card_text, screen_nr), card);
         WND_SetInteger (WND_CodeKey (X_trees_arity_text, screen_nr), arity);
         WND_SetInteger (WND_CodeKey (X_trees_tuple_text, screen_nr), tuple_nr);
         WND_SetInteger (WND_CodeKey (X_trees_stree_text, screen_nr), stree_nr);
         WND_SetInputAllowed (WND_CodeKey (X_trees_tuple_text, screen_nr),
                              tuple_on AND (card > 1));
         WND_SetInputAllowed (WND_CodeKey (X_trees_stree_text, screen_nr),
                              stree_on AND (arity > 1));
      
         draw_new_tree (tuple_nr,stree_nr, screen_nr);
         WND_Manage (WND_CodeKey (X_trees_window, screen_nr), parent);
   
         keys[1] := WND_CodeKey (X_trees_ok_button, screen_nr);
         keys[2] := - WND_CodeKey (X_trees_expand_button, screen_nr);
         keys[3] := WND_CodeKey (X_trees_showtree_button, screen_nr);
         WND_SetKeys (WND_CodeKey (X_trees_window, screen_nr), keys);
      END;
   END;
   DrawTreeSet_Manage := screen_nr;
END {DrawTreeSet_Manage};

PROCEDURE DrawTreeSet_HandleKey (key : WND_Xid);
VAR simple_key,
    node_id       : WND_Xid;
    tuple_nr,
    stree_nr,
    screen_nr     : INTEGER;
BEGIN
   WND_DecodeKey ( key, simple_key, screen_nr);
   CASE simple_key OF
        X_trees_ok_button :
            BEGIN
                WND_FreeScreenNr (WND_Trees, screen_nr);
                WND_DestroyTree (WND_CodeKey (X_trees_area, screen_nr));
                WND_Unmanage (WND_CodeKey (X_trees_window, screen_nr));
            END;
        X_trees_expand_button :
            BEGIN
                WND_GetNodeSelected (WND_CodeKey (X_trees_area, screen_nr), node_id);
                IF node_id <> X_undefined THEN BEGIN
                    Loop_SetLastExpanded (WND_CodeKey (X_trees_window, screen_nr));
                    DrawTree_NodeAttributes(node_id);
                END
                ELSE BEGIN
                    ERROR_Write ( ERROR_NoNodeSelected );
                END;
            END;
        X_trees_showtree_button :
            BEGIN
                WND_DestroyTree (WND_CodeKey (X_trees_area, screen_nr));
                WND_GetInteger(WND_CodeKey (X_trees_tuple_text, screen_nr), tuple_nr);
                WND_GetInteger(WND_CodeKey (X_trees_stree_text, screen_nr), stree_nr);
                draw_new_tree (tuple_nr, stree_nr, screen_nr);
            END;
    END;
END;
