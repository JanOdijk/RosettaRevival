(*MPI:::===================================================================*
 *
 *  Rosetta Project
 *
 *  Module Title    : PRINTERF6
 *  Creation date   : 
 *  Author          : Joep Rous
 *
 *  Copyright (c) 1987, by Nederlandse Philips Bedrijven BV.
 *
 *  Remarks         : 
 *
 *EMP:::===================================================================*)

Export(PRINTERF6);
pragma C_include('interfaces.pf');
pragma C_include('drawstree.pf');
pragma C_include('listree.pf');
pragma C_include('interface1.pf');
pragma C_include('printerf6.pf');

(*=========================================================================*
 *  Imported modules
 *=========================================================================*)

PROGRAM PRINTERF6;
WITH INTERFACES, DRAWSTREE, LISTREE, INTERFACE1;

PROCEDURE PRINTERF6_body(ifin: INTERFACES_IfDescr);
VAR
   inputset: LISTREE_SETOFSTREES;
   stree1: LISTREE_pstree;
BEGIN
   inputset:=ifin.if6;
   WHILE LISTREE_stillstrees(inputset) DO BEGIN
      LISTREE_takestree(stree1,inputset);
      DRAWSTREE_generatetree(stree1)
   END
END {PRINTERF6};


