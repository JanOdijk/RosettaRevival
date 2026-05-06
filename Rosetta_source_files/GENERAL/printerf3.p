(*MPI:::===================================================================*
 *
 *  Rosetta Project
 *
 *  Module Title    : PRINTERF3
 *  Creation date   : 24-SEP-1987
 *  Author          : Carel Fellinger
 *
 *  Copyright (c) 1987, by Nederlandse Philips Bedrijven BV.
 *
 *  Remarks         : 
 *
 *EMP:::===================================================================*)

Export(PRINTERF3);
pragma C_include('interfaces.pf');
pragma C_include('drawsuperdtree.pf');
pragma C_include('superdtree.pf');
pragma C_include('printerf3.pf');


(*=========================================================================*
 *  Imported modules
 *=========================================================================*)


PROGRAM PRINTERF3;
WITH INTERFACES, DRAWSUPERDTREE, SUPERDTREE;


PROCEDURE PRINTERF3_body(ifin: INTERFACES_IfDescr);
VAR
   inputset: SuperDtree_SetOfSuperDtree;
   dtree1: SuperDtree_pSuperDtree;
BEGIN
   inputset:=ifin.if3;
   WHILE NOT SuperDtree_IsEmptySet(inputset) DO BEGIN
      SuperDtree_TakeFromSet(dtree1,inputset);
      DrawSuperDtree_GenerateTree(dtree1)
   END
END {PRINTERF3};

