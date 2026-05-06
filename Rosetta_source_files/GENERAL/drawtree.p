(*MPI:::===================================================================*
 *
 *  Rosetta Project
 *
 *  Module Title    : DrawTree
 *  Creation date   : 13-06-91
 *  Author          : Y. van Dinther
 *
 *  Copyright (c) 1986, by Nederlandse Philips Bedrijven BV.
 *
 *  Remarks         : 
 *
 *EMP:::===================================================================*)

Export(DRAWTREE);
pragma C_include('oldtree.pf');
pragma C_include('wnd.pf');
pragma C_include('mem.pf');
pragma C_include('string.pf');
pragma C_include('error.pf');
pragma C_include('loop.pf');
pragma C_include('drawtree.pf');

(*=========================================================================*
 *  Imported modules
 *=========================================================================*)

PROGRAM DrawTree;
WITH OLDTREE, WND, MEM, ERROR, STRNG, LOOP;

(*----------------------------------------------------------------------*
 * structure of new tree
 *----------------------------------------------------------------------*)

TYPE  pNode = ^Node;
      Node = RECORD
                 Data          : OLDTREE_Oldtree;
                 Id            : WND_Did;
                 Next          : pNode;
             END;

VAR   Node_list        : pNode;

(*----------------------------------------------------------------------*
 * functions to change and use the list of nodes
 *----------------------------------------------------------------------*)

FUNCTION CreatepNode: pNode;
VAR NewNode: pNode;
BEGIN
   (* This function allocates a node, initializes it, gives it a node-id
    * and adds it to the list of nodes (in front).
    *)
   Mem_NewDefault(LoopHoles.SizeOf(Node), LoopHoles.Retype(NewNode,Mem_ptr));
   WITH NewNode^ DO
   BEGIN
       Data.TreeType:=OLDTREE_Empty;
       Id := WND_GetNextDid;
       Next := Node_List;
   END;
   Node_List := NewNode;
   CreatepNode := NewNode;
END; {CreatepNode}


FUNCTION SearchpNode (node_id : WND_Xid): pNode;
VAR NewNode : pNode;
    found   : Boolean;
BEGIN
    (* This function searches a node with the given node-id.
     * The node-ids have been assigned incremental and the nodes are
     * added in front of the list, so the node-list-ids are sorted downwards.
     * 
     * Every node-id searched for can be found (or a software-error has
     * been made) !
     *)
    NewNode := Node_list;
    found := FALSE;
    WHILE (not found) and (NewNode <> nil) DO
    BEGIN
        IF NewNode^.Id = node_id THEN
        BEGIN
            found := TRUE;
        END
        ELSE BEGIN
            NewNode := NewNode^.Next;
        END;
    END;
    SearchpNode := NewNode;
END; {SearchpNode}

PROCEDURE DrawTree_Initialize;
BEGIN
    Node_list := nil;
END;

PROCEDURE DrawTree_NodeAttributes (node_id : WND_Xid);
VAR NewNode : pNode;
BEGIN
    NewNode := SearchpNode (node_id);
    OLDTREE_NodeAttributes (NewNode^.Data);
END; {DrawTree_NodeAttributes}


PROCEDURE DrawTree_CreateTree (OldNode: OLDTREE_OldTree; tree_id: WND_Xid);
VAR NewNode: pNode;

    PROCEDURE SubTree (NewNode, Parent: pNode);
    VAR NextNewNode: pNode;
        NextOldNode: OLDTREE_OldTree;
        ParentId : WND_Did;
        Relation, Category : String_String;
        Length : INTEGER;
    BEGIN
        IF Parent = nil THEN
        BEGIN
            ParentId := X_undefined;
        END
        ELSE BEGIN
            ParentId := Parent^.Id;
        END;
        OLDTREE_GetRelation(NewNode^.Data, Relation, Length);
        OLDTREE_GetCategory(NewNode^.Data, Category, Length);
        WND_SetNode ( NewNode^.Id, ParentId, Relation, Category);

        IF OldTree_SonPresent (NewNode^.Data) THEN
        BEGIN
            NextNewNode := CreatepNode;
            NextOldNode := OldTree_Down (NewNode^.Data);
            NextNewNode^.Data := NextOldNode;
            SubTree(NextNewNode, NewNode);
            WHILE OldTree_RightNeighbourPresent (NextOldNode) DO
            BEGIN
                NextNewNode := CreatepNode;
                NextOldNode := OLDTREE_Right (NextOldNode);
                NextNewNode^.Data := NextOldNode;
                SubTree(NextNewNode, NewNode);
            END;
        END;
    END;

BEGIN
    WND_StartTree (tree_id);
    NewNode         := CreatepNode;
    NewNode^.Data   := OldNode;
    SubTree (NewNode, nil);
    WND_EndTree (tree_id);
END; {DrawTree_CreateTree}


PROCEDURE DrawTree_GenerateTree(OldNode: OLDTREE_OldTree);
VAR init_screen_nr  : integer;
BEGIN
    init_screen_nr := DrawTree_Manage (OldNode, X_undefined);
    IF init_screen_nr <> -1 THEN
       Loop_HandleKey (WND_CodeKey(X_tree_ok_button, init_screen_nr));
END; {DrawTree_GenerateTree}


FUNCTION DrawTree_Manage (OldNode: OLDTREE_OldTree; parent_id : WND_Xid):integer;
VAR screen_nr : integer;
    window_id : WND_Xid;
    keys      : array [1..2] of WND_Xid;
BEGIN
    IF WND_GetFreeScreenNr (WND_Tree, screen_nr) THEN BEGIN
        window_id := WND_CodeKey (X_tree_window, screen_nr);
        WND_Fetch ( window_id );
        DrawTree_CreateTree(OldNode, WND_CodeKey (X_tree_area, screen_nr));
        keys[1] := WND_CodeKey (X_tree_ok_button, screen_nr);
        keys[2] := - WND_CodeKey (X_tree_expand_button, screen_nr);
        WND_Manage (window_id, parent_id);
        WND_SetKeys (window_id, keys);
    END;
    DrawTree_Manage := screen_nr;
END; {DrawTree_Manage}

PROCEDURE DrawTree_HandleKey ( key : WND_Xid );
VAR simple_key : WND_Xid;
    screen_nr  : integer;
    node_id    : WND_Xid;
BEGIN
    WND_DecodeKey ( key, simple_key, screen_nr);
    CASE simple_key OF
    X_tree_ok_button :
        BEGIN
            WND_FreeScreenNr (WND_Tree, screen_nr);
            WND_DestroyTree (WND_CodeKey (X_tree_area, screen_nr));
            WND_Unmanage (WND_CodeKey (X_tree_window, screen_nr));
        END;
    X_tree_expand_button :
        BEGIN
            WND_GetNodeSelected (WND_CodeKey (X_tree_area, screen_nr), node_id);
            IF node_id <> X_undefined THEN BEGIN
                Loop_SetLastExpanded (WND_CodeKey (X_tree_window, screen_nr));
                DrawTree_NodeAttributes(node_id);
            END
            ELSE BEGIN
                ERROR_Write ( ERROR_NoNodeSelected );
            END;
        END;
    END;
END;
