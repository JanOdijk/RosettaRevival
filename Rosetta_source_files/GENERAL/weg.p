(*MPI:::===================================================================*
 *
 *  Rosetta Project
 *
 *  Module Title    : PRINTERF4
 *  Creation date   : 21-JAN-88
 *  Author          : Joep Rous
 *
 *  Copyright (c) 1988, by Nederlandse Philips Bedrijven BV.
 *
 *  Remarks         : 
 *
 *EMP:::===================================================================*)

Export(PRINTERF4);
pragma C_include('interfaces.pf');
pragma C_include('drawhiltree.pf');
pragma C_include('hiltree.pf');
pragma C_include('printerf4.pf');

(*=========================================================================*
 *  Imported modules
 *=========================================================================*)

PROGRAM PRINTERF4;
WITH INTERFACES, DRAWHILTREE, HILTREE;

PROCEDURE PRINTERF4_body(ifin: INTERFACES_IfDescr);
VAR
   inputset: HILtree_SetOfHyperILtree;
   dtree1: HILtree_pHyperILtree;
BEGIN
   inputset:=ifin.if4;
   WHILE NOT HILtree_IsEmptySet(inputset) DO BEGIN
      HILtree_TakeFromSet(dtree1,inputset);
      DrawHILtree_GenerateTree(dtree1)
   END
END {PRINTERF4};

