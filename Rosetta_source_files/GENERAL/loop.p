(*MPI:::===================================================================*
 *
 *  Rosetta Project
 *
 *  Module Title    : Loop
 *  Creation date   : 14-08-91
 *  Author          : Y. van Dinther
 *
 *  Copyright (c) 1986, by Nederlandse Philips Bedrijven BV.
 *
 *  Remarks         : 
 *
 *EMP:::===================================================================*)

Export(LOOP);
pragma C_include('oldtree.pf');
pragma C_include('wnd.pf');
pragma C_include('rectoscreen.pf');
pragma C_include('drawtreeset.pf');
pragma C_include('debugmparser.pf');
pragma C_include('debugmgenerator.pf');
pragma C_include('drawtree.pf');
pragma C_include('loop.pf');

(*=========================================================================*
 *  Imported modules
 *=========================================================================*)


PROGRAM Loop;
WITH OLDTREE, WND, RECTOSCREEN, DRAWTREESET, DEBUGMPARSER,
     DEBUGMGENERATOR, DRAWTREE;

VAR   LastExpanded     : WND_Xid;

      Dyn_stop_button1 : WND_Xid;
      Dyn_stop_tree1   : Boolean;
      Dyn_set_window1  : WND_Xid;
      Dyn_set_key1     : WND_Xid;

      Dyn_stop_button2 : WND_Xid;
      Dyn_stop_tree2   : Boolean;
      Dyn_set_window2  : WND_Xid;
      Dyn_set_key2     : WND_Xid;


PROCEDURE Loop_Initialize;
BEGIN
    LastExpanded := X_undefined;

    Dyn_stop_button1 := X_undefined;
    Dyn_stop_tree1   := TRUE;
    Dyn_set_key1     := X_undefined;

    Dyn_stop_button2 := X_undefined;
    Dyn_stop_tree2   := TRUE;
    Dyn_set_key2     := X_undefined;
END;

PROCEDURE Loop_HandleKey ( stop_button: WND_Xid );
VAR screen_nr        : integer;
    key, simple_key  : WND_Xid;
    set_key          : array [1..1] of WND_Xid;
BEGIN
    Dyn_stop_button1 := stop_button;
    Dyn_stop_tree1   := FALSE;
    IF Dyn_set_key1 <> X_undefined THEN BEGIN
        set_key[1] := Dyn_set_key1;
        WND_UnsetKeys (set_key);
    END;
    WHILE not ( Dyn_stop_tree1 AND Dyn_stop_tree2 ) DO BEGIN 
        WND_GetKey (key);
        WND_DecodeKey (key, simple_key, screen_nr);
        CASE simple_key OF
            X_tree_ok_button,
            X_tree_expand_button:
                DRAWTREE_HandleKey (key);
            X_trees_ok_button,
            X_trees_expand_button,
            X_trees_showtree_button:
                DRAWTREESET_HandleKey (key);
            X_attr_ok_button,
            X_attr_tofile_button,
            X_attr_confirm_button:
                RECTOSCREEN_HandleKey (key);
            X_hn_ok_button,
            X_hn_attr_button:
                OLDTREE_HandleKey (key);
            X_mp_treein_button,
            X_mp_treeout_button:
                DEBUGMPARSER_HandleKey (key);
            X_mg_treein_button,
            X_mg_treeout_button:
                DEBUGMGENERATOR_HandleKey (key);
        END;
        IF ( NOT Dyn_stop_tree1 ) AND ( key = Dyn_stop_button1 ) THEN BEGIN
            Dyn_stop_tree1 := TRUE;
            IF Dyn_set_key1 <> X_undefined THEN BEGIN
                set_key[1] := Dyn_set_key1;
                WND_SetKeys (Dyn_set_window1, set_key);
            END;
        END;
        IF ( NOT Dyn_stop_tree2 ) AND ( key = Dyn_stop_button2 ) THEN BEGIN
            Dyn_stop_tree2 := TRUE;
            IF Dyn_set_key2 <> X_undefined THEN BEGIN
                set_key[1] := Dyn_set_key2;
                WND_SetKeys (Dyn_set_window2, set_key);
            END;
        END;
    END;
    WND_ResetDid;
    Loop_Initialize;
    OldTree_Initialize;
    DrawTree_Initialize;

END; {Loop_HandleKey}


PROCEDURE Loop_AddStopButton (stop_button, set_window, set_button : WND_Xid);
VAR set_key : array [1..1] of WND_Xid;
BEGIN
    Loop_SetStopButtonProperties (set_window, set_button);
    IF Dyn_stop_tree1 THEN BEGIN
        Dyn_stop_button1 := stop_button;
        Dyn_stop_tree1   := FALSE;
        IF Dyn_set_key1 <> X_undefined THEN BEGIN
            set_key[1] := Dyn_set_key1;
            WND_UnsetKeys (set_key);
        END;
    END
    ELSE BEGIN
        Dyn_stop_button2 := stop_button;
        Dyn_stop_tree2   := FALSE;
        IF Dyn_set_key2 <> X_undefined THEN BEGIN
            set_key[1] := Dyn_set_key2;
            WND_UnsetKeys (set_key);
        END;
    END;
END;

PROCEDURE Loop_SetStopButtonProperties (set_window, set_button : WND_Xid);
BEGIN
    IF Dyn_stop_tree1 THEN BEGIN
        Dyn_set_window1 := set_window;
        Dyn_set_key1    := set_button;
    END
    ELSE BEGIN
        Dyn_set_window2 := set_window;
        Dyn_set_key2    := set_button;
    END;
END;

PROCEDURE Loop_SetLastExpanded ( id : WND_Xid );
BEGIN
    LastExpanded := id;
END;

FUNCTION Loop_LastExpanded: WND_Xid;
BEGIN
    Loop_LastExpanded := LastExpanded;
END;
