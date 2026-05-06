(*MPI:::===================================================================*
 *
 *  Rosetta Project
 *
 *  Module Title    : DrawSuperDtree
 *  Creation date   :  
 *  Author          : Carel Fellinger, copied from J. Stevens
 *
 *  Copyright (c) 1986, by Nederlandse Philips Bedrijven BV.
 *
 *  Remarks         : 
 *
 *EMP:::===================================================================*)

Export(DRAWSUPERDTREE);
pragma C_include('oldtree.pf');
pragma C_include('drawtree.pf');
pragma C_include('superdtree.pf');
pragma C_include('globdef.pf');
pragma C_include('mem.pf');
pragma C_include('drawsuperdtree.pf');

(*=========================================================================*
 *  Imported modules
 *=========================================================================*)


PROGRAM DrawSuperDtree;
WITH OLDTREE, DRAWTREE, SUPERDTREE, GLOBDEF, MEM;


PROCEDURE DrawSuperDtree_GenerateTree(OldNode : SuperDtree_pSuperDtree);
VAR TempNode : OlDtree_OlDtree;
    loSuperSon : SuperDtree_pLoSuperSon;
BEGIN {DrawSuperDtree_GenerateJTree}
   Mem_NewDefault(LoopHoles.SizeOf(SuperDtree_LoSuperSon),
                  LoopHoles.Retype(losuperson,Mem_Ptr));
   loSuperSon^.next:= NIL;
   Mem_NewDefault(LoopHoles.SizeOf(SuperDtree_LoSuperDtree), 
                  LoopHoles.Retype(loSuperSon^.it.first,Mem_Ptr));
   loSuperSon^.it.cur:= loSuperSon^.it.first;
   loSuperSon^.it.last:= loSuperSon^.it.first;

   Mem_NewDefault(LoopHoles.SizeOf(SuperDtree_LoSuperDtree), 
                  LoopHoles.Retype(loSuperSon^.it.cur,Mem_Ptr)) ;
   loSuperSon^.it.cur^.next:= NIL;
   loSuperSon^.it.cur^.it:= OldNode;

   TempNode.TreeType := OlDtree_SuperDtree;
   TempNode.SuperDtree:= loSuperSon;

   SuperDtree_MarkFirstDtree(OldNode);
   REPEAT
      DrawTree_GenerateTree(TempNode)
   UNTIL NOT SuperDtree_MarkNextDtree(OldNode)
END {DrawSuperDtree_GenerateTree};


