(*MPI:::===================================================================*
 *
 *  Rosetta Project
 *
 *  Module Title    : DrawHyperDtree
 *  Creation date   :  
 *  Author          : Joep Rous, copied form Carel Fellinger, copied from 
 *                    J. Stevens
 *
 *  Copyright (c) 1986, by Nederlandse Philips Bedrijven BV.
 *
 *  Remarks         : 
 *
 *EMP:::===================================================================*)

Export(DRAWHYPERDTREE);
pragma C_include('oldtree.pf');
pragma C_include('drawtree.pf');
pragma C_include('hyperdtree.pf');
pragma C_include('globdef.pf');
pragma C_include('mem.pf');
pragma C_include('drawhyperdtree.pf');

(*=========================================================================*
 *  Imported modules
 *=========================================================================*)


PROGRAM DrawHyperDtree;
WITH OLDTREE, DRAWTREE, HYPERDTREE, GLOBDEF, MEM;


PROCEDURE DrawHyperDtree_GenerateTree(OldNode : HyperDtree_pHyperDtree);
VAR TempNode : OlDtree_OlDtree;
    loHyperDtree : HyperDtree_pLoHyperDtree;
BEGIN {DrawHyperDtree_GenerateJTree}
   Mem_NewDefault(LoopHoles.SizeOf(HyperDtree_LoHyperDtree), 
                  LoopHoles.Retype(loHyperDtree,Mem_Ptr));
   loHyperDtree^.next:= NIL;
   loHyperDtree^.arg := OldNode;

   TempNode.TreeType := OlDtree_HyperDtree;
   TempNode.HyperDtree := loHyperDtree;

   DrawTree_GenerateTree(TempNode)

END {DrawHyperDtree_GenerateTree};


