(*MPI:::===================================================================*
 *
 *  Rosetta Project
 *
 *  Module Title    : LINEARIZER
 *  Creation date   :  18-DEC-1987
 *  Author          : Joep Rous
 *
 *  Copyright (c) 1986, by Nederlandse Philips Bedrijven BV.
 *
 *  Remarks         : 
 *
 *EMP:::===================================================================*)

Export(LINEARIZER);
pragma C_include('debug.pf');
pragma C_include('error.pf');
pragma C_include('log.pf');
pragma C_include('listree.pf');
pragma C_include('interface6.pf');
pragma C_include('interface7.pf');
pragma C_include('interfaces.pf');
pragma C_include('ldcatsets.pf');
pragma C_include('drawstree.pf');
pragma C_include('linearizer.pf');

(*=========================================================================*
 *  Imported modules
 *=========================================================================*)


PROGRAM LINEARIZER;
WITH DEBUG, ERROR, LOG, LISTREE, INTERFACE6, INTERFACE7, INTERFACES,
     LDCATSETS, DRAWSTREE;

FUNCTION LINEARIZER_Body(interf: INTERFACES_IfDescr): INTERFACES_IfDescr;


   FUNCTION NewRow(t: LISTREE_pStree): INTERFACE7_pRowSeqSegmKeys;
   VAR
      r1 : INTERFACE7_pRowSeqSegmKeys;
   BEGIN
      r1       := INTERFACE7_makeWRowSeqSegm(NIL);
      r1^.fseq := INTERFACE7_MakeSeqSegmStree(NIL);
      r1^.lseq := r1^.fseq;
      r1^.fseq^.stree:= t;
      r1^.nxt  := r1;
      r1^.prv  := r1;
      NewRow   := r1
   END {NewRow};   


   PROCEDURE AddRow(VAR r1: INTERFACE7_pRowSeqSegmKeys;
                    r2    : INTERFACE7_pRowSeqSegmKeys);
   VAR
      r2last : INTERFACE7_pRowSeqSegmKeys;
   BEGIN
      IF r1 = NIL THEN BEGIN
         r1 := r2
         END
      ELSE BEGIN
         r1^.prv^.nxt := r2;
         r1^.prv^.rn  := r2;
         r2^.prv^.nxt := r1;
         r2last       := r2^.prv;
         r2^.prv      := r1^.prv;
         r1^.prv      := r2last;         
      END
   END {AddRow};


   PROCEDURE Linearizer(t : LISTREE_pStree; VAR r : INTERFACE7_pRowSeqSegmKeys;
                        VAR SonsAdded: BOOLEAN);
                         
   VAR
      AllSonsAdded : BOOLEAN;
      sonlist      : LISTREE_pRelNode;
      leavelist    : INTERFACE7_pRowSeqSegmKeys;
   BEGIN
      DEBUG_WriteStr('-> Linearizer', DEBUG_MaxIO, 0, TRUE);
      DEBUG_WriteLine(TRUE);
      IF t^.sons = NIL THEN BEGIN
         IF DEBUG_Mode THEN DRAWSTREE_GenerateTree(t);
         IF LDCATSETS_LexCat(t^.cat) THEN BEGIN
            r := NewRow(t);
            SonsAdded := TRUE
            END
         ELSE BEGIN
            r := NIL;
            SonsAdded := FALSE;
         END
         END
      ELSE BEGIN
         sonlist := t^.sons; AllSonsAdded := TRUE;
         leavelist := NIL;
         WHILE (sonlist <> NIL) DO BEGIN
            Linearizer(sonlist^.node,r, SonsAdded);
            IF SonsAdded THEN AddRow(leavelist, r);
            AllSonsAdded := (AllSonsAdded AND SonsAdded);
            sonlist := sonlist^.brother
         END;
         IF AllSonsAdded THEN BEGIN
            SonsAdded := TRUE;
            r := leavelist
            END
         ELSE BEGIN
            IF LDCATSETS_LexCat(t^.cat) THEN BEGIN
               r := NewRow(t);
               SonsAdded := TRUE
               END
            ELSE BEGIN
               r := NIL;
               SonsAdded := FALSE
            END
         END;
      END;
      DEBUG_WriteStr('<- Linearizer', DEBUG_MaxIO, 0, TRUE);
      DEBUG_WriteLine(TRUE);
   END {Linearizer};


VAR
   if6   : INTERFACE6_SetOfStrees;
   trailer,
   if7   : INTERFACE7_pRowSeqSegmKeys;
   ifout : INTERFACES_IfDescr;
   t     : LISTREE_pStree;
   SonsAdded : BOOLEAN;
BEGIN
   if6 := interf.if6;   
   if7 := NIL;
   IF LISTREE_StillStrees(if6) THEN BEGIN
      LISTREE_TakeStree(t, if6);   
      trailer := INTERFACE7_makeWRowSeqSegm(NIL);
      trailer^.nxt := trailer; trailer^.prv := trailer;
      LINEARIZER(t, if7, SonsAdded);
      IF SonsAdded THEN AddRow(if7, trailer);
   END;
   ifout.level     := 7;
   ifout.if7       := if7;
   LINEARIZER_Body := ifout
END {LINEARIZER_Body};

