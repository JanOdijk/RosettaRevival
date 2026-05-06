(*MPI:::===================================================================*
 *
 *  Rosetta Project
 *
 *  Module Title    : PRINTERF2
 *  Creation date   : 12-MAY-1987
 *  Author          : Rene Leermakers
 *
 *  Copyright (c) 1987, by Nederlandse Philips Bedrijven BV.
 *
 *  Remarks         : 
 *
 *EMP:::===================================================================*)

Export(PRINTERF2);
pragma C_include('interfaces.pf');
pragma C_include('drawstree.pf');
pragma C_include('listree.pf');
pragma C_include('mem.pf');
pragma C_include('interface1.pf');
pragma C_include('printerf2.pf');


(*=========================================================================*
 *  Imported modules
 *=========================================================================*)


PROGRAM PRINTERF2;
WITH INTERFACES, DRAWSTREE, LISTREE, MEM, INTERFACE1;

PROCEDURE PRINTERF2_body(ifin: INTERFACES_IfDescr);
VAR
   inputset: LISTREE_SETOFSTREES;
   stree1: LISTREE_pstree;
   stillstrees: BOOLEAN;
   Root        : LISTREE_pRelNode;

   FUNCTION ExtractStree(r: LISTREE_pRelNode): BOOLEAN;
   VAR done   : BOOLEAN;
   BEGIN
      done := FALSE;
      WHILE (r <> NIL) AND NOT done DO BEGIN
         done := ExtractStree(r^.node^.sons);
         IF NOT done THEN BEGIN
            r^.node := r^.node^.twin;
            done := NOT r^.node^.LI^.first
         END;
         r := r^.brother
      END;
      ExtractStree := done;
   END {ExtractStree};

BEGIN
   inputset:=ifin.if2;
   Mem_NewDefault(LoopHoles.SIZEOf(LISTREE_RelNode), 
                  LoopHoles.Retype(Root,MEM_Ptr));
   Root^.brother := NIL;
   WHILE LISTREE_stillstrees(inputset) DO BEGIN
      LISTREE_takestree(stree1,inputset);
      Root^.node := stree1;
      REPEAT
         DRAWSTREE_generatetree(Root^.node);
         stillstrees := ExtractStree(Root)
      UNTIL NOT stillstrees;
   END
END {PRINTERF2};


