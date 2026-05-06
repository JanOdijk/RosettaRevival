(*MPI:::===================================================================*
 *
 *  Rosetta Project
 *
 *  Module Title    : INTERFACE1TO7
 *  Creation date   :  10-MAR-1987
 *  Author          : J. Rous
 *
 *  Copyright (c) 1986, by Nederlandse Philips Bedrijven BV.
 *
 *  Remarks         : Copies datastructures of interface7 to interface1
 *
 *EMP:::===================================================================*)

EXPORT(PRINTERF1);
pragma C_include('interfaces.pf');
pragma C_include('drawstree.pf');
pragma C_include('interface1.pf');
pragma C_include('windows.pf');
pragma C_include('globdef.pf');
pragma C_include('printerf1.pf');

(*=========================================================================*
 *  Imported modules
 *=========================================================================*)


PROGRAM PRINTERF1;
WITH INTERFACES, DRAWSTREE, INTERFACE1, WINDOWS, GLOBDEF;

PROCEDURE PRINTERF1_body(ifin: INTERFACES_IfDescr);
VAR
   ambw,
   nw        : INTERFACE1_pRowSeqSegmKeys;
BEGIN

   nw := ifin.if1;
   WHILE nw <> ifin.if1^.prv DO BEGIN
      ambw := nw;
      WHILE ambw <> NIL DO BEGIN
	 IF (ambw^.fseq <> NIL) AND (NOT ambw^.error) THEN BEGIN
	    DRAWSTREE_GenerateTree(ambw^.fseq^.stree);
	 END;
	 ambw := ambw^.nxtamb;
      END;
      nw := nw^.nxt
   END

END {PRINTERF1_body};

