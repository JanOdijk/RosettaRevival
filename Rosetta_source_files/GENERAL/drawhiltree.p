(*MPI:::===================================================================*
 *
 *  Rosetta Project
 *
 *  Module Title    : DrawHILtree
 *  Creation date   :  
 *  Author          : Joep Rous, copied form Carel Fellinger, copied from 
 *                    J. Stevens
 *
 *  Copyright (c) 1986, by Nederlandse Philips Bedrijven BV.
 *
 *  Remarks         : 
 *
 *EMP:::===================================================================*)

EXPORT(DRAWHILTREE);
pragma C_include('oldtree.pf');
pragma C_include('drawtree.pf');
pragma C_include('hiltree.pf');
pragma C_include('globdef.pf');
pragma C_include('drawhiltree.pf');

(*=========================================================================*
 *  Imported modules
 *=========================================================================*)


PROGRAM DrawHILtree;
WITH OLDTREE, DRAWTREE, HILTREE, GLOBDEF;


PROCEDURE DrawHILtree_GenerateTree(OldNode : HILtree_pHyperILtree);
VAR TempNode : OlDtree_OlDtree;
    s  : HILtree_SetOfHyperILtree;

BEGIN {DrawHILtree_GenerateJTree}
   HILtree_EmptySet(s);
   HILtree_AddToSet(OldNode, s);   

   TempNode.TreeType    := OlDtree_HyperILtree;
   TempNode.HyperILtree := s.first;

   DrawTree_GenerateTree(TempNode)

END {DrawHILtree_GenerateTree};


