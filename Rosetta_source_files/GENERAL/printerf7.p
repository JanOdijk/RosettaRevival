(*MPI:::===================================================================*
 *
 *  Rosetta Project
 *
 *  Module Title    : PRINTERF7
 *  Creation date   :  10-MAR-1987
 *  Author          : J. Rous
 *
 *  Copyright (c) 1986, by Nederlandse Philips Bedrijven BV.
 *
 *  Remarks         : Copies datastructures of interface7 to interface1
 *
 *EMP:::===================================================================*)

Export(PRINTERF7);
pragma C_include('interfaces.pf');
pragma C_include('drawstree.pf');
pragma C_include('interface7.pf');
pragma C_include('printerf7.pf');

(*=========================================================================*
 *  Imported modules
 *=========================================================================*)

PROGRAM PRINTERF7;
WITH INTERFACES, DRAWSTREE, INTERFACE7;

PROCEDURE PRINTERF7_body(ifin: INTERFACES_IfDescr);
VAR
   ambw,
   nw      : INTERFACE7_pRowSeqSegmKeys;
BEGIN

   nw := ifin.if7^.prv;
   REPEAT
      ambw := nw;
      WHILE ambw <> NIL DO BEGIN
         IF ambw^.fseq <> NIL THEN BEGIN
            DRAWSTREE_GenerateTree(ambw^.fseq^.stree);
         END;
         ambw := ambw^.nxtamb;
      END;
      nw := nw^.prv;
   UNTIL ( nw = ifin.if7^.prv );

END {PRINTERF7_body};

