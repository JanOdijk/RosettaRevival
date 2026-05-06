(*MPI:::===================================================================*
 *
 *  Rosetta Project
 *
 *  Module Title    : PRINTERF5
 *  Creation date   : 24-SEP-1987
 *  Author          : Joep Rous
 *
 *  Copyright (c) 1987, by Nederlandse Philips Bedrijven BV.
 *
 *  Remarks         : 
 *
 *EMP:::===================================================================*)

Export(PRINTERF5);
pragma C_include('interfaces.pf');
pragma C_include('drawhyperdtree.pf');
pragma C_include('hyperdtree.pf');
pragma C_include('printerf5.pf');

(*=========================================================================*
 *  Imported modules
 *=========================================================================*)

PROGRAM PRINTERF5;
WITH INTERFACES, DRAWHYPERDTREE, HYPERDTREE;

PROCEDURE PRINTERF5_body(ifin: INTERFACES_IfDescr);
VAR
   inputset: HyperDtree_SetOfHyperDtree;
   dtree1: HyperDtree_pHyperDtree;
BEGIN
   inputset:=ifin.if5;
   WHILE NOT HyperDtree_IsEmptySet(inputset) DO BEGIN
      HyperDtree_TakeFromSet(dtree1,inputset);
      DrawHyperDtree_GenerateTree(dtree1)
   END
END {PRINTERF5};

