(*MPI:::===================================================================*
 *
 *  Rosetta Project
 *
 *  Module Title    : DrawSTree
 *  Creation date   :  
 *  Author          : Copied from J. Stevens
 *
 *  Copyright (c) 1986, by Nederlandse Philips Bedrijven BV.
 *
 *  Remarks         : 
 *
 *EMP:::===================================================================*)

Export(DRAWSTREE);
pragma C_include('oldtree.pf');
pragma C_include('drawtree.pf');
pragma C_include('listree.pf');
pragma C_include('globdef.pf');
pragma C_include('lidomaint.pf');
pragma C_Include('wnd.pf');
pragma C_include('drawstree.pf');


(*=========================================================================*
 *  Imported modules
 *=========================================================================*)


PROGRAM DrawSTree;
WITH OLDTREE, DRAWTREE, LISTREE, GLOBDEF, LIDOMAINT, WND;

PROCEDURE MakeNode (OldNode : LISTREE_pStree; VAR TempNode : OLDTREE_OldTree);
VAR RelNode  : LISTREE_pRelNode;
BEGIN
   LISTREE_MakeRelNode(RelNode);
   RelNode^.node    := OldNode;
   RelNode^.brother := NIL;
   RelNode^.relation:= LIREL0;
   TempNode.TreeType := OLDTREE_STree;
   TempNode.Stree    := RelNode;
END; {MakeNode}


PROCEDURE DrawSTree_GenerateTree(OldNode : LISTREE_pStree);
VAR TempNode : OLDTREE_OldTree;
BEGIN {DrawSTree_GenerateTree}
   MakeNode (OldNode, TempNode);
   DrawTree_GenerateTree(TempNode);
END {DrawSTree_GenerateTree};


PROCEDURE DrawSTree_CreateTree(OldNode : LISTREE_pStree; tree_id : WND_Xid);
VAR TempNode : OLDTREE_OldTree;
BEGIN {DrawSTree_GenerateTree}
   MakeNode (OldNode, TempNode);
   DrawTree_CreateTree(TempNode, tree_id);
END {DrawSTree_CreateTree};

FUNCTION DrawSTree_Manage(OldNode : LISTREE_pStree; parent_id : WND_Xid): integer;
VAR TempNode : OLDTREE_OldTree;
BEGIN {DrawSTree_Manage}
   MakeNode (OldNode, TempNode);
   DrawSTree_Manage := DrawTree_Manage (TempNode, parent_id);
END {DrawSTree_Manage};


