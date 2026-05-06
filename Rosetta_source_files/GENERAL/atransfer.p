(*MPI:::===================================================================*
 *
 *  Rosetta Project
 *
 *  Module Title    : ATransfer
 *  Creation date   :  21-JAN-1988
 *  Author          : Joep Rous
 *
 *  Copyright (c) 1986, by Nederlandse Philips Bedrijven BV.
 *
 *  Remarks         : 
 *
 *EMP:::===================================================================*)

Export(ATRANSFER);
pragma C_include('superdtree.pf');
pragma C_include('debug.pf');
pragma C_include('log.pf');
pragma C_include('mem.pf');
pragma C_include('string.pf');
pragma C_include('strings.pf');
pragma C_include('globdef.pf');
pragma C_include('hiltree.pf');
pragma C_include('liildict.pf');
pragma C_include('interfaces.pf');
pragma C_include('wnd.pf');
pragma C_include('ldmdict.pf');
pragma C_include('interface1.pf');
pragma C_include('limorfdef.pf');
pragma C_include('alayout.pf');
pragma C_include('listree.pf');
pragma C_include('ldanilrules.pf');
pragma C_include('ldmrules.pf');
pragma C_include('liilrules.pf');
pragma C_include('atransfer.pf');
pragma C_include('mb.pf');
pragma C_include('error.pf');


(*=========================================================================*
 *  Imported modules
 *=========================================================================*)
PROGRAM ATransfer;
WITH SUPERDTREE, DEBUG, LOG, MEM, STRNG, STRINGS, GLOBDEF, HILTREE, LIILDICT,
     INTERFACES, WND, LDMDICT, INTERFACE1, LIMORFDEF, ALAYOUT, LISTREE, LDANILRULES,
     LDMRULES, LIILRULES, MB, ERROR;

CONST
   MaxMeanings = 40;

TYPE
   MeaningTable = ARRAY[1..MaxMeanings] OF RECORD
                                              rec      :  LIILDict_RecordDef;
                                              tree     : SuperDtree_SetOfSuperDtree;
                                              skey     : INTEGER;
                                              obsolete : BOOLEAN;
                                              chosen   : BOOLEAN
                                           END;
   pDesAmbType = ^DesAmbType;
   DesAmbType  = RECORD
                    first    : BOOLEAN;
                    marked   : BOOLEAN;
                    Nr       : INTEGER;
                    cNr      : INTEGER;
                    mds      : MeaningTable;
                    stem     : String_String;
                    X,Y,len  : INTEGER;
                    bxpr     : SuperDtree_SetOfSuperDtree;
                    nxtamb   : pDesAmbType;
                    nxt      : pDesAmbType
                 END;

VAR
   DesAmb       : pDesAmbType;
   Mbxid_in,
   Mbxid_out    : MB_mbxid;
   

PROCEDURE ChooseMeanings(d : pDesAmbType);

VAR curd     : pDesAmbType;
    n_stems  : INTEGER;
    sa, sa1,
    sa2, sa3,
    high_arr : array [1..MaxMeanings] of String_String;
    n_strs,
    n_strs1,
    n_strs2,
    n_strs3,
    n_highs  : integer;
    w        : WND_Xid;
    keys     : array [1..1] of WND_Xid;
    key      : WND_Xid;
    stop     : Boolean;

PROCEDURE FillStringList ( stem : pDesAmbType );
VAR i   : INTEGER;
BEGIN
   n_strs := 0;
   i := 0;
   n_highs := 0;
   WHILE (i < stem^.nr) DO BEGIN
      i := i+1;
      IF stem^.first THEN stem^.mds[i].chosen := FALSE;
      IF NOT stem^.mds[i].obsolete THEN BEGIN
         n_strs := n_strs + 1;
         Vtrim (sa[n_strs], stem^.mds[i].rec.md);

         IF stem^.mds[i].chosen THEN BEGIN
            n_highs := n_highs + 1;
            high_arr[n_highs] := sa[n_strs];
         END;
      END;
   END;
   stem^.first := FALSE;
END;

PROCEDURE HandleStringList ( stem : pDesAmbType;
                             const sa : array [n0..n1: integer] of String_String;
                             n_strs : integer );
VAR i, si     : INTEGER;
BEGIN
   i := 0;
   WHILE (i < stem^.nr) DO BEGIN
      i := i+1;
      stem^.mds[i].chosen := FALSE;
   END;
   i := 0;
   si := 0;
   WHILE (i < stem^.nr) and (si < n_strs) DO BEGIN
      i := i+1;
      IF STRING_Compare (stem^.mds[i].rec.md, sa[n0 + si]) = 0 THEN BEGIN
          si := si + 1;
          stem^.mds[i].chosen := TRUE;
      END;
   END;
END;

PROCEDURE ProcessList ( id : WND_Xid );
BEGIN
    FillStringList ( curd );
    WND_SetStringList ( id, sa, n_strs );
    IF n_highs > 0 THEN BEGIN
       WND_SetStringListSelected ( id, high_arr, n_highs );
    END;
END;

BEGIN
   n_stems := 1;
   curd := d;
   WHILE curd^.nxtamb <> nil DO BEGIN
       n_stems := n_stems + 1;
       curd := curd^.nxtamb;
   END;
   IF ( n_stems < 1 ) OR ( n_stems > 3) THEN
       writeln ('error, wrong number of stems: ', n_stems);

   curd := d;
   CASE n_stems OF
   1 : BEGIN
           WND_SetString ( X_amb1_stem1_text, curd^.stem);
           ProcessList ( X_amb1_mean1_list );
           WND_Manage ( X_amb1_window, X_undefined );
       END;
   2 : BEGIN
           WND_SetString ( X_amb2_stem1_text, curd^.stem);
           ProcessList ( X_amb2_mean1_list );

           curd := curd^.nxtamb;
           WND_SetString ( X_amb2_stem2_text, curd^.stem);
           ProcessList ( X_amb2_mean2_list );

           WND_Manage ( X_amb2_window, X_undefined );
       END;
   3 : BEGIN
           WND_SetString ( X_amb3_stem1_text, curd^.stem);
           ProcessList ( X_amb3_mean1_list );

           curd := curd^.nxtamb;
           WND_SetString ( X_amb3_stem2_text, curd^.stem);
           ProcessList ( X_amb3_mean2_list );

           curd := curd^.nxtamb;
           WND_SetString ( X_amb3_stem3_text, curd^.stem);
           ProcessList ( X_amb3_mean3_list );

           WND_Manage ( X_amb3_window, X_undefined );
       END;
   END;

   CASE n_stems OF
   1 : Begin keys[1] := X_amb1_ok_button; w := X_amb1_window End;
   2 : Begin keys[1] := X_amb2_ok_button; w := X_amb2_window End;
   3 : Begin keys[1] := X_amb3_ok_button; w := X_amb3_window End;
   END;

   WND_SetKeys (w, keys);
   stop := FALSE;
   WHILE not stop DO BEGIN
      WND_GetKey  (key);
      curd := d;
      CASE n_stems OF
      1 : BEGIN
             WND_GetStringListSelected ( X_amb1_mean1_list, sa1, n_strs1 );
             IF n_strs1 = 0 THEN BEGIN
                WND_UnsetKeys (keys);
                stop := ERROR_QuestionWrite (QUESTION_ZeroMeanings);
                WND_SetKeys (w, keys);
             END
             ELSE
                stop := TRUE;

             IF stop THEN BEGIN
                HandleStringList ( curd, sa1, n_strs1 );
                WND_Unmanage ( w );    
             END;
          END;
      2 : BEGIN
             WND_GetStringListSelected ( X_amb2_mean1_list, sa1, n_strs1 );
             curd := curd^.nxtamb;
             WND_GetStringListSelected ( X_amb2_mean2_list, sa2, n_strs2 );
             IF ( n_strs1 = 0 ) AND ( n_strs2 = 0 ) THEN BEGIN
                WND_UnsetKeys (keys);
                stop := ERROR_QuestionWrite (QUESTION_ZeroMeanings);
                WND_SetKeys (w, keys);
             END
             ELSE
                stop := TRUE;

             IF stop THEN BEGIN
                HandleStringList ( curd, sa1, n_strs1 );
                HandleStringList ( curd, sa2, n_strs2 );
                WND_Unmanage ( w );
             END;
          END;
      3 : BEGIN
             WND_GetStringListSelected ( X_amb3_mean1_list, sa1, n_strs1 );
             curd := curd^.nxtamb;
             WND_GetStringListSelected ( X_amb3_mean2_list, sa2, n_strs2 );
             curd := curd^.nxtamb;
             WND_GetStringListSelected ( X_amb3_mean3_list, sa3, n_strs3 );
             IF ( n_strs1 = 0 ) AND ( n_strs2 = 0 ) AND ( n_strs3 = 0 ) THEN BEGIN
                WND_UnsetKeys (keys);
                stop := ERROR_QuestionWrite (QUESTION_ZeroMeanings);
                WND_SetKeys (w, keys);
             END
             ELSE
                stop := TRUE;

             IF stop THEN BEGIN
                HandleStringList ( curd, sa1, n_strs1 );
                HandleStringList ( curd, sa2, n_strs2 );
                HandleStringList ( curd, sa3, n_strs3 );
                WND_Unmanage ( w );
             END;
          END;
      END;
   END;
END {Choosemeanings};



PROCEDURE ComposeMeaningTables(d: pDesAmbType);
VAR
  MaxFilled : INTEGER;
  nd        : pDesAmbType;
  treeset   : SuperDtree_SetOfSuperDtree;
  tree      : SuperDtree_pSuperDtree;
  status    : BOOLEAN;
  rec       : LIILDICT_RecordDef;

   FUNCTION AlreadyInTable(skey: INTEGER; tree: SuperDtree_pSuperDtree): BOOLEAN;
   VAR
      found     : BOOLEAN;
      i         : INTEGER;
   BEGIN
      i := 0; found := FALSE;
      WHILE (i < Maxfilled) AND NOT found DO BEGIN
         i := i+1;
         found := nd^.mds[i].skey = skey
      END;
      IF NOT found THEN AlreadyInTable := FALSE
      ELSE BEGIN
         WHILE (i <= Maxfilled) AND found DO BEGIN
            SuperDtree_AddToSet(tree, nd^.mds[i].tree);
            i := i+1;
            IF i <= MaxFilled THEN found := nd^.mds[i].skey = skey
         END;
         AlreadyInTable := TRUE
      END;

   END {AlreadyInTable};

BEGIN
   WHILE d <> NIL DO BEGIN
      nd := d;
      WHILE nd <> NIL DO BEGIN
         treeset := nd^.bxpr;
         MaxFilled := 0;
         WHILE NOT SuperDtree_IsEmptySet(treeset) DO BEGIN
            SuperDtree_TakeFromSet(tree, treeset);
            IF NOT AlreadyInTable(tree^.key, tree) THEN BEGIN
	       status := LIILDict_GetAILDict(tree^.key, rec);
	       REPEAT               
		  IF status THEN BEGIN
		     IF NOT (rec.ag = LIILDICT_Generation) THEN BEGIN
			DEBUG_WriteStr('Meaning', DEBUG_MaxIO, 0, TRUE);
			DEBUG_WriteLine(TRUE);
                        MaxFilled := MaxFilled+1;
			nd^.mds[MaxFilled].rec      := rec;
			nd^.mds[MaxFilled].skey     := tree^.key;
			nd^.mds[MaxFilled].obsolete := FALSE;
			nd^.mds[MaxFilled].chosen   := TRUE;
                        SuperDtree_EmptySet(nd^.mds[MaxFilled].tree);
                        SuperDtree_AddToSet(tree, nd^.mds[MaxFilled].tree);
			END
		     ELSE BEGIN
			DEBUG_WriteStr('Only for generation', DEBUG_MaxIO, 0, TRUE);
			DEBUG_WriteLine(TRUE);
		     END;
		     status := LIILDict_GetNextAILDict(tree^.key, rec);
		  END
	       UNTIL NOT status;
            END
         END;
	 nd^.nr := MaxFilled;
         nd^.cnr := nd^.nr;
         nd := nd^.nxtamb
      END;
      d := d^.nxt;
   END;
END {ComposeMeaningTables};


PROCEDURE ReduceAmbStructure(d : pDesAmbType);
VAR
   nd      : pDesAmbType;
   i       : INTEGER;

   FUNCTION WholeSetObsolete(s: SuperDtree_SetOfSuperDtree): BOOLEAN;
   VAR
      t : SuperDtree_pSuperDtree;
   BEGIN
      WholeSetObsolete := TRUE;
      WHILE NOT SuperDtree_IsEmptySet(s) DO BEGIN
         SuperDtree_TakeFromSet(t, s);
         IF t^.LI^.intmark2 = SuperDtree_White THEN WholeSetObsolete := FALSE
      END;
   END {WholeSetObsolete};

BEGIN
   WHILE d <> NIL DO BEGIN
      nd := d;
      IF d^.marked THEN BEGIN
         ALAYOUT_UnBlinkRegion(d^.X, d^.Y, d^.len);
         d^.marked := FALSE;
      END;
      WHILE nd <> NIL DO BEGIN
         nd^.cnr := 0;
	 FOR i := 1 TO nd^.nr DO BEGIN
            nd^.mds[i].obsolete := WholeSetObsolete(nd^.mds[i].tree);
            IF nd^.mds[i].chosen AND NOT nd^.mds[i].obsolete 
            THEN nd^.cnr := nd^.cnr+1;
         END;
         nd := nd^.nxtamb
      END;
      d := d^.nxt;
   END;
END {ReduceAmbStructure};


FUNCTION MarkWords(d: pDesAmbType): BOOLEAN;
VAR
  nd       : pDesAmbType;
  totalcnr : INTEGER;
BEGIN
   MarkWords := FALSE;
   WHILE d <> NIL DO BEGIN
      nd := d; totalcnr := 0;
      WHILE (nd <> NIL) AND (totalcnr <= 1) DO BEGIN
         totalcnr := totalcnr+nd^.cnr;
         nd := nd^.nxtamb
      END;
      IF totalcnr > 1 THEN BEGIN
         MarkWords := TRUE;
         d^.marked := TRUE;
         ALAYOUT_BlinkRegion(d^.X, d^.Y, d^.len);
      END;
      d := d^.nxt;
   END;
END {MarkWords};


PROCEDURE UnMarkWords(d: pDesAmbType);
VAR
  nd      : pDesAmbType;
BEGIN
   WHILE d <> NIL DO BEGIN
      nd := d;
      WHILE (nd <> NIL) DO BEGIN
         IF nd^.marked THEN BEGIN
            ALAYOUT_UnBlinkRegion(nd^.X, nd^.Y, nd^.len);
         END;
         nd := nd^.nxtamb
      END;
      d := d^.nxt;
   END;
END {UnMarkWords};


FUNCTION ColorSuperTree1(s : SuperDtree_SuperSon): SuperDtree_Color;
VAR 
   losuperson : SuperDtree_pLoSuperSon;
   w          : SuperDtree_pLoSuperDtree;
   d          : SuperDtree_pSuperDtree;
   sc,
   SonColor,
   Color      : SuperDtree_Color;
BEGIN
   w := s.first; 
   Color := SuperDtree_Black;
   WHILE w <> NIL DO BEGIN
      d := w^.it; 
      IF d^.nodeKind=SuperDtree_ruleNode THEN BEGIN
         losuperson:= d^.args.first; SonColor := SuperDtree_White;
         WHILE (losuperson<>NIL) DO BEGIN
            sc := ColorSuperTree1(losuperson^.it);
            IF sc = SuperDtree_Black THEN SonColor := SuperDtree_Black;
            losuperson:= losuperson^.next
         END {WHILE};
         d^.LI^.intmark2 := SonColor;
         IF Soncolor = SuperDtree_White THEN Color := SuperDtree_White;
         END
      ELSE IF d^.nodeKind=SuperDtree_basicNode THEN BEGIN
         IF d^.LI^.intmark2 = SuperDtree_White THEN Color := SuperDtree_White;
         END
      ELSE Color := SuperDtree_White;
      w := w^.next;
   END; 
   ColorSuperTree1 := Color;
END {ColorSuperTree1};


PROCEDURE ColorSuperTree2(s : SuperDtree_SuperSon;
                          FatherColor: SuperDtree_Color);
VAR 
   losuperson : SuperDtree_pLoSuperSon;
   w          : SuperDtree_pLoSuperDtree;
   d          : SuperDtree_pSuperDtree;
BEGIN
   w := s.first; 
   WHILE w <> NIL DO BEGIN
      d := w^.it; 
      IF FatherColor IN [SuperDtree_Black,SuperDtree_Grey] THEN BEGIN
         IF d^.LI^.intmark2 = SuperDtree_White THEN BEGIN
            d^.LI^.intmark2 := SuperDtree_Grey
         END;
         IF d^.nodeKind=SuperDtree_ruleNode THEN BEGIN
            losuperson:= d^.args.first;
            WHILE (losuperson<>NIL) DO BEGIN
               ColorSuperTree2(losuperson^.it, d^.LI^.intmark2);
               losuperson:= losuperson^.next
            END {WHILE};
         END;
      END;
      w := w^.next;
   END; 
END {ColorSuperTree2};


PROCEDURE ColorSuperTree3(s : SuperDtree_SuperSon);
VAR 
   losuperson : SuperDtree_pLoSuperSon;
   w          : SuperDtree_pLoSuperDtree;
   d          : SuperDtree_pSuperDtree;
BEGIN
   w := s.first; 
   WHILE w <> NIL DO BEGIN
      d := w^.it; 
      IF d^.LI^.intmark2 IN [SuperDtree_Grey,SuperDtree_White] THEN BEGIN
         d^.LI^.intmark2 := SuperDtree_White;
         IF d^.nodeKind=SuperDtree_ruleNode THEN BEGIN
            losuperson:= d^.args.first;
            WHILE (losuperson<>NIL) DO BEGIN
               ColorSuperTree3(losuperson^.it);
               losuperson:= losuperson^.next
            END {WHILE};
         END;
      END;
      w := w^.next;
   END; 
END {ColorSuperTree3};


PROCEDURE ColorSuperTree4(s : SuperDtree_SuperSon);
VAR 
   losuperson : SuperDtree_pLoSuperSon;
   w          : SuperDtree_pLoSuperDtree;
   d          : SuperDtree_pSuperDtree;
BEGIN
   w := s.first; 
   WHILE w <> NIL DO BEGIN
      d := w^.it; 
      IF d^.LI^.intmark2 IN [SuperDtree_Black,SuperDtree_Grey] THEN BEGIN
         d^.LI^.intmark2 := SuperDtree_Black;
         IF d^.nodeKind=SuperDtree_ruleNode THEN BEGIN
            losuperson:= d^.args.first;
            WHILE (losuperson<>NIL) DO BEGIN
               ColorSuperTree4(losuperson^.it);
               losuperson:= losuperson^.next
            END {WHILE};
         END;
      END;
      w := w^.next;
   END; 
END {ColorSuperTree4};


PROCEDURE ColorSuperTree(d : pDesAmbType;
                         s : SuperDtree_SuperSon);
VAR
   b       : SuperDtree_Color;
   ok, k   : INTEGER;
   trees   : SuperDtree_SetOfSuperDtree;
   nd      : pDesAmbType;
   i       : INTEGER;
   chosen  : BOOLEAN;

   PROCEDURE MarkTrees(s: SuperDtree_SetOfSuperDtree);
   VAR
      t : SuperDtree_pSuperDtree;
   BEGIN
      WHILE NOT SuperDtree_IsEmptySet(s) DO BEGIN
         SuperDtree_TakeFromSet(t,s);
         t^.LI^.intmark2 := SuperDtree_Black
      END;
   END {MarkTrees};

BEGIN
   WHILE d <> NIL DO BEGIN
      nd := d;
      WHILE (nd <> NIL) DO BEGIN
         ok := -1;
         FOR i := 1 TO nd^.nr DO BEGIN
            k := nd^.mds[i].skey;
            IF ok <> k THEN BEGIN
               IF ok <> -1 THEN BEGIN
                  IF NOT chosen THEN MarkTrees(trees)
               END;
               chosen := FALSE
            END;
            IF nd^.mds[i].chosen THEN chosen := TRUE;
            ok := k;
            trees := nd^.mds[i].tree
         END;
         IF NOT chosen AND (nd^.nr > 0) THEN MarkTrees(trees);
         nd := nd^.nxtamb
      END;
      d := d^.nxt;
   END;
  
   b := ColorSuperTree1(s);
   ColorSuperTree2(s, b);
   ColorSuperTree3(s);
   ColorSuperTree4(s);

END {ColorSuperTree};


PROCEDURE InsertBxpr(d: SuperDtree_pSuperDtree;
                     t: LISTREE_pStree;
                     VAR a: pDesAmbType);
VAR
   found: BOOLEAN;
   savea: pDesAmbType;
   s   : String_String;
   CC  : LIMORFDEF_ContextConds;
   FON : LIMORFDEF_pPhonInfo;
   where : LDMDICT_WhereType;
   status: BOOLEAN;
BEGIN
   String_ConstantEmpty(s);
   status := LDMDICT_GetGMDICT(s,BasType,CC,FON,where,d^.key);
   found := FALSE; savea := a;
   WHILE (a <> NIL) AND NOT found DO BEGIN
      found := STRING_Compare(a^.stem, s) = 0;
      IF NOT found THEN a := a^.nxtamb
   END;   
   IF found THEN BEGIN
      SuperDtree_AddToSet(d, a^.bxpr);
      END
   ELSE BEGIN
      MEM_NewDefault(LoopHoles.SizeOf(DesAmbType), LoopHoles.Retype(a,Mem_Ptr));
      a^.first  := TRUE;
      a^.NR     := 0;
      a^.cNR    := 0;
      a^.marked := FALSE;
      a^.X      := t^.LI^.X;
      a^.Y      := t^.LI^.Y;
      a^.len    := t^.LI^.len;
      a^.stem   := s;
      SuperDtree_EmptySet(a^.bxpr);
      SuperDtree_AddToSet(d, a^.bxpr);
      a^.nxtamb := savea^.nxtamb;
      savea^.nxtamb := a;
   END;
   LoopHoles.Retype(d^.LI^.intnode,pDesAmbType) := a;
END {InsertBxpr};


PROCEDURE NewBxpr(d: SuperDtree_pSuperDtree;
                  t: LISTREE_pStree;
                  VAR a: pDesAmbType);
VAR
   s   : String_String;
   CC  : LIMORFDEF_ContextConds;
   FON : LIMORFDEF_pPhonInfo;
   status: BOOLEAN;
   where : LDMDICT_WhereType;
BEGIN
   String_ConstantEmpty(s);
   status := LDMDICT_GetGMDICT(s,BasType,CC,FON,where,d^.key);
   MEM_NewDefault(LoopHoles.SizeOf(DesAmbType), LoopHoles.Retype(a,Mem_Ptr));
   a^.first  := TRUE;
   a^.NR     := 0;
   a^.cNR    := 0;
   a^.marked := FALSE;
   a^.X      := t^.LI^.X;
   a^.Y      := t^.LI^.Y;
   a^.len    := t^.LI^.len;
   a^.stem   := s;
   SuperDtree_EmptySet(a^.bxpr);
   SuperDtree_AddToSet(d, a^.bxpr);
   a^.nxtamb := NIL;
   LoopHoles.Retype(d^.LI^.intnode,pDesAmbType) := a;
END {NewBxpr};


PROCEDURE FindBxprs(s : SuperDtree_SuperSon);
VAR 
   losuperson : SuperDtree_pLoSuperSon;
   w          : SuperDtree_pLoSuperDtree;
   d          : SuperDtree_pSuperDtree;
   t          : LISTREE_pStree;
   odamb,
   ndamb,
   damb       : pDesAmbType;
   found,
   isgreater  : BOOLEAN;
BEGIN
   w := s.first;
   WHILE w <> NIL DO BEGIN
      d := w^.it;  
      IF d^.nodeKind=SuperDtree_ruleNode THEN BEGIN
         losuperson:= d^.args.first;
         WHILE (losuperson<>NIL) DO BEGIN
            FindBxprs(losuperson^.it);
            losuperson:= losuperson^.next
         END {WHILE}
         END
      ELSE IF (d^.nodeKind=SuperDtree_basicNode) AND NOT d^.LI^.intmark1 THEN BEGIN
         LoopHoles.Retype(t,SuperDtree_pStree) := SuperDtree_ReturnOrigin(d);
         IF NOT ((t^.LI^.X=0) AND (t^.LI^.Y=0)) THEN BEGIN
            found := FALSE; damb := DesAmb; odamb := damb; isgreater := FALSE;
            WHILE (NOT found) AND (NOT isgreater) AND (damb <> NIL) DO BEGIN
               found := (t^.LI^.X = damb^.X) AND (t^.LI^.Y = damb^.Y);
               isgreater := FALSE;
               IF damb^.Y > t^.LI^.Y THEN isgreater := TRUE
               ELSE IF damb^.Y = t^.LI^.Y THEN 
                    IF damb^.X > t^.LI^.X THEN isgreater := TRUE;

               IF NOT found AND NOT isgreater THEN BEGIN
                  odamb := damb;
                  damb := damb^.nxt;
               END
            END;

            IF isgreater OR (damb = NIL) THEN BEGIN
               NewBxpr(d,t,ndamb);
               odamb^.nxt := ndamb;
               ndamb^.nxt := damb;
               END
            ELSE IF found THEN BEGIN
               InsertBxpr(d,t,damb);
            END;
         END
      END;
      d^.LI^.intmark1 := TRUE;
      w := w^.next;
   END; 
END {FindBxprs};


PROCEDURE SelectWord(din: pDesAmbType; VAR IsEnd: BOOLEAN; Var quit : Boolean);
VAR
   d    : pDesAmbType;
   selected,
   stop : BOOLEAN;
   msg : MB_msgtype;

   PROCEDURE FindNextMark(first: pDesAmbType; VAR cur: pDesAmbType);
   BEGIN
      IF cur = NIL THEN cur := first;
      WHILE NOT cur^.marked DO BEGIN
         cur := cur^.nxt;
         IF cur = NIL THEN cur := first
      END;
   END {FindNextMark};

  Procedure GetUserAction (Var msg : MB_msgtype);
  Var mb : MB_communicationblock;
      forget : GlobDef_Status;
  Begin
      mb.msg := AmbigInfo;
      forget := MB_put (Mbxid_out, mb);
      forget := MB_take (Mbxid_in, mb);
      msg := mb.msg;
  End {GetUserAction};

BEGIN
   d := din;
   FindNextMark(din, d);
   ALAYOUT_MarkRegion(d^.X, d^.Y, d^.len);
   stop := FALSE;
   quit := FALSE;
   selected := FALSE;
   WHILE NOT stop AND NOT selected DO BEGIN
       GetUserAction (msg);
       CASE msg OF
       NextWord :
           BEGIN
               ALAYOUT_BlinkRegion(d^.X, d^.Y, d^.len);
               d := d^.nxt;
               FindNextMark(din, d);
               ALAYOUT_MarkRegion(d^.X, d^.Y, d^.len);
           END;
       Inspect :
           BEGIN
               selected := TRUE;
               ChooseMeanings(d);
           END;
       startmessage :
           BEGIN
               stop := TRUE;
               ALAYOUT_BlinkRegion(d^.X, d^.Y, d^.len);
           END;
       stopmessage :
           BEGIN
               stop := TRUE;
               quit := TRUE;
           END;
       END;
    END;

    IsEnd := stop AND NOT selected;

END {SelectWord};


PROCEDURE Interaction(s: SuperDtree_SetOfSuperDtree; Var quit : Boolean);
VAR
   start            : SuperDtree_SuperSon;
   EndOfInteraction : BOOLEAN;
BEGIN
   DEBUG_WriteStr('-> Interaction', DEBUG_MaxIO, 0, TRUE);
   DEBUG_WriteLine(TRUE);
   quit := False;
   start.first := s.first;
   start.last  := s.last;
   MEM_NewDefault(LoopHoles.SizeOf(DesAmbType), LoopHoles.Retype(DesAmb,Mem_Ptr));
   Desamb^.X   := -MaxInt;
   Desamb^.Y   := -MaxInt;
   Desamb^.len := 0;
   Desamb^.nxt := NIL;
   SuperDtree_EmptySet(DesAmb^.bxpr);
   FindBxprs(start);
   ComposeMeaningTables(DesAmb^.nxt);

   IF (NOT Globdef_GetBatchMode) AND GlobDef_GetInteractionMode THEN BEGIN
      EndOfInteraction := FALSE;
      WND_SetMessage (S_AmbiguousWords);
      WHILE NOT EndOfInteraction DO BEGIN
         IF MarkWords(DesAmb^.nxt) THEN BEGIN
            SelectWord(DesAmb^.nxt, EndOfInteraction, quit);
            IF NOT EndOfInteraction THEN BEGIN
               ColorSuperTree(DesAmb^.nxt,Start);
               ReduceAmbStructure(DesAmb^.nxt)
            END
            END
         ELSE EndOfInteraction := TRUE
      END;
      WND_ClearMessage;
      UnMarkWords(DesAmb^.nxt);
   END;

   DEBUG_WriteStr('<- Interaction', DEBUG_MaxIO, 0, TRUE);
   DEBUG_WriteLine(TRUE);
END {Interaction};


FUNCTION ATransfer_Body(
        interf   : INTERFACES_IfDescr;
        mbxin,
        mbxout   : MB_mbxid;
        var quit : Boolean)
                 : INTERFACES_IfDescr;


VAR
   superset : SuperDtree_SetOfSuperDtree;
   super    : SuperDtree_pSuperDtree;
   hyper    : HILtree_pHyperILtree;
   hyperset : HILtree_SetOfHyperILtree;
   done     : BOOLEAN;
   ifout    : INTERFACES_IfDescr;
   HyperNode: HILtree_HyperILtree;
   synbonus : INTEGER;

   PROCEDURE ATransfer(super: SuperDtree_pSuperDtree;
                       VAR hyper: HILtree_pHyperILtree;
                       VAR synbonus: INTEGER);
   VAR
      superson     : SuperDtree_pLoSuperSon;
      hyperson     : HILtree_pHyperILtree;
      hypernodeelt : HILtree_pHyperNodeElt;
      status       : BOOLEAN;
      rec          : LIILDict_RecordDef;
      HyperNode    : HILtree_HyperILtree;
      pElts        : HILtree_pSetOfHyperNodeElt;
      mrulestr     : STRING(35);
      mrulelen     : INTEGER;
      Error        : BOOLEAN;
      sonbonus     : INTEGER;
      d            : pDesAmbType;      
      i            : INTEGER;

   BEGIN
      DEBUG_WriteStr('-> ATransfer', DEBUG_MaxIO, 0, TRUE);
      DEBUG_WriteLine(TRUE);
      synbonus := 0;

      IF super^.LI^.intmark2 = SuperDtree_Black THEN hyper := HNIL
      ELSE CASE super^.nodekind OF
         SuperDtree_BasicNode :
            BEGIN
               DEBUG_WriteStr('Basic Node', DEBUG_MaxIO, 0, TRUE);
               DEBUG_WriteLine(TRUE);
	       HILtree_NewHyperILtreeLeave(hyper);
	       HILtree_LoadHyperILtree(hyper, HyperNode);
	       HyperNode.BasicNodeKind := HILtree_BasicNode;
	       HILtree_EmptyNode(HyperNode.Elts);

               IF SuperDtree_IsTrfResultSaved(super) THEN BEGIN
                  LoopHoles.Retype(pElts,SuperDtree_pSetOfHyperNodeElt) := SuperDtree_ReturnTrfResult(super);
                  HyperNode.Elts := pElts^;
                  DEBUG_WriteStr('Used previous results', DEBUG_MaxIO, 0, TRUE);
                  DEBUG_WriteLine(TRUE);
                  END
               ELSE BEGIN
                  d := LoopHoles.Retype(super^.LI^.intnode,pDesAmbType);
                  IF d <> NIL THEN BEGIN
		     FOR i := 1 TO d^.nr DO BEGIN
			IF d^.mds[i].chosen AND (super^.key=d^.mds[i].skey) THEN BEGIN
			   HILtree_NewHyperILtreeBxpr(hyperNodeElt, d^.mds[i].rec.mkey);
			   HILtree_AddToNode(hyperNodeElt, HyperNode.Elts);
			END;
		     END;

		     Mem_NewDefault(LoopHoles.SizeOf(HILTREE_SetOfHyperNodeElt), LoopHoles.Retype(pElts,Mem_Ptr)); pElts^ := HyperNode.Elts;
		     SuperDtree_SaveTrfResult(LoopHoles.Retype(pElts,SuperDtree_pSetOfHyperNodeElt),
					      super);
                     END
                  ELSE BEGIN
		     status := LIILDict_GetAILDict(super^.key, rec);
		     REPEAT               
			IF status THEN BEGIN
			   IF NOT (rec.ag = LIILDICT_Generation) THEN BEGIN
			      HILtree_NewHyperILtreeBxpr(hyperNodeElt, rec.mkey);
			      HILtree_AddToNode(hyperNodeElt, HyperNode.Elts);
			      END
			   ELSE BEGIN
			      DEBUG_WriteStr('Only for generation', DEBUG_MaxIO, 0, TRUE);
			      DEBUG_WriteLine(TRUE);
			   END;
			   status := LIILDict_GetNextAILDict(super^.key, rec);
			END
		     UNTIL NOT status
                  END;
               END;

	       IF NOT HILtree_IsEmptyNode(HyperNode.Elts) THEN BEGIN
		  HILtree_StoreHyperILtree(hyper, HyperNode);
		  END
	       ELSE BEGIN
		  LOG_Write('No corresponding mkey for skey', 31, super^.key);
		  DEBUG_WriteStr('No corresponding mkey for skey ', DEBUG_MaxIO, 0, TRUE);
		  DEBUG_WriteInteger(super^.key, 5, TRUE);
		  DEBUG_WriteLine(TRUE);
		  hyper := HNIL;
	       END
            END;            
         SuperDtree_VarNode  :
            BEGIN
               DEBUG_WriteStr('Variable', DEBUG_MaxIO, 0, TRUE);
               DEBUG_WriteLine(TRUE);
               HILtree_NewHyperILtreeLeave(hyper);
               HILtree_LoadHyperILtree(hyper, HyperNode);
               HyperNode.BasicNodeKind := HILtree_VarNode;
               HILtree_NewHyperILtreeVar(hyperNodeElt, super^.index);
               HILtree_EmptyNode(HyperNode.Elts);
               HILtree_AddToNode(hyperNodeElt, HyperNode.Elts);
               HILtree_StoreHyperILtree(hyper, HyperNode);
            END;
         SuperDtree_RuleNode   :
            BEGIN
               DEBUG_WriteStr('Rule Node', DEBUG_MaxIO, 0, TRUE);
               DEBUG_WriteLine(TRUE);
               HILtree_NewHyperILtree(hyper);
               HILtree_LoadHyperILtree(hyper, HyperNode);
               HyperNode.RuleNodeKind := HILtree_RuleNode;
               HyperNode.EndOfSg := super^.EndOfSg;

               IF FALSE {SuperDtree_IsTrfResultSaved(super)} THEN BEGIN
                  LoopHoles.Retype(pElts,SuperDtree_pSetOfHyperNodeElt) := SuperDtree_ReturnTrfResult(super);
                  HyperNode.Elts := pElts^
                  END
               ELSE BEGIN
                  HyperNode.Elts := LDAnILRules_RuleTransfer(super^.R, super^.parameters);
                  Mem_NewDefault(LoopHoles.SizeOf(HILTREE_SetOfHyperNodeElt), 
                                 LoopHoles.Retype(pElts,Mem_Ptr)); 
                  pElts^ := HyperNode.Elts;
                  SuperDtree_SaveTrfResult(LoopHoles.Retype(pElts,SuperDtree_pSetOfHyperNodeElt),
                                           super);
               END;

               IF NOT HILtree_IsEmptyNode(HyperNode.Elts) THEN BEGIN
		  superson := super^.args.first;
		  HILtree_EmptyTuple(HyperNode.args);
		  HyperNode.nrOfargs := 0; Error := FALSE;
		  WHILE (superson <> NIL) AND NOT Error DO BEGIN
		     HyperNode.nrOfargs := HyperNode.nrOfargs+1;
		     Atransfer(superson^.it.cur^.it, hyperson, sonbonus);
                     Error := HyperSon = HNIL;
                     synbonus := synbonus + sonbonus;
		     HILtree_AddToTuple(hyperson, HyperNode.args);
		     superson := superson^.next
		  END;
                  IF NOT HILtree_IsEmptyTuple(HyperNode.args) AND
                     NOT Error THEN BEGIN
                     synbonus := synbonus + super^.LI^.bonus;
		     HILtree_StoreHyperILtree(hyper, HyperNode);
                     END
                  ELSE hyper := HNIL;
                  END
               ELSE BEGIN
                  LOG_Write('No corresponding IL-rule for M-rule ', 36, super^.R);
                  DEBUG_WriteStr('No corresponding IL-rule for M-rule ', DEBUG_MaxIO, 0, TRUE);
                  LDMRULES_rulename(1,super^.R,mrulestr,mrulelen);
                  DEBUG_writestr(mrulestr,mrulelen,mrulelen,TRUE);
                  DEBUG_WriteLine(TRUE);
                  hyper := HNIL;
               END
            END
      END;            
      DEBUG_WriteStr('<- ATransfer', DEBUG_MaxIO, 0, TRUE);
      DEBUG_WriteLine(TRUE);

   END {ATransfer};  
 

BEGIN

   Mbxid_in  := mbxin;
   Mbxid_out := mbxout;
   superset  := interf.if3;

   InterAction(superset, quit);

   If Not quit Then Begin
      HILtree_EmptySet(hyperset);

      WHILE NOT SuperDtree_IsEmptySet(superset) DO BEGIN
         SuperDtree_TakeFromSet(super, superset);
         SuperDtree_MarkFirstDtree(super);
         REPEAT 
            ATransfer(super, hyper, synbonus);
            IF hyper <> HNIL THEN BEGIN
               HILtree_LoadHyperILtree(hyper, HyperNode);
               HyperNode.synbonus := synbonus;
               HILtree_StoreHyperILtree(hyper, HyperNode);
               HILtree_AddToSynSortSet(hyper, hyperset);
            END;
            done := SuperDtree_MarkNextDtree(super)
         UNTIL NOT done;
      END;

      ifout.level    := 4;
      ifout.if4      := hyperset; 
      ATransfer_Body := ifout;
   End
   Else Begin
      ATransfer_Body := interf;
   End;

END {ATransfer_Body};


