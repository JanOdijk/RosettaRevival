(*MPI:::===================================================================*
 *
 *  Rosetta Project
 *
 *  Module Title     : WND
 *  Creation date    : 91-05-16
 *  Modification date: 
 *  Author           : H M M van de Schoot
 *
 *  Copyright (c) 1991, by Nederlandse Philips Bedrijven BV.
 *
 *  Remarks         : The Windows module
 *
 *EMP:::===================================================================*)

Export(WND);

(*=========================================================================*
 *  Imported modules
 *=========================================================================*)
pragma c_include ('string.pf');
pragma c_include ('str.pf');
pragma C_Include('wnd.pf');
pragma C_include('wch.pf');
pragma c_include ('logc.pf');
pragma c_include ('error.pf');

PROGRAM WND;
With Strng, STR, WCH, logc, ERROR;

VAR Done      : Boolean;
    Status    : Integer;
    DidArea   : Integer;

	{ a TRUE value means that the screen is free }
    ScreenNrs : array [0 .. MAX_SCREENS-1, WND_ScreenType] of Boolean;


#define T(f) if not f then Error ('Error WND')

Procedure Error (const s : string);
begin
    logp (s);
    Done := false;
end {Error};


FUNCTION WND_Done : BOOLEAN;
BEGIN {Done}
   WND_Done := Done
END {Done};


FUNCTION WND_IntegerStatus
                  : INTEGER;
BEGIN {WND_IntegerStatus}
    Done := true;
   WND_IntegerStatus:=Status
END {WND_IntegerStatus};


PROCEDURE WND_Initialize;
Var i : Integer;
BEGIN {WND_Initialize}
   Done := TRUE;
   WND_ResetDid;
   for i := 0 to MAX_SCREENS-1 do begin
      ScreenNrs [i, WND_Tree ] := TRUE;
      ScreenNrs [i, WND_Trees] := TRUE;
      ScreenNrs [i, WND_Attr ] := TRUE;
      ScreenNrs [i, WND_Hn   ] := TRUE;
   end;
END {WND_Initialize};

Procedure WND_Terminate;
Begin
    Done := true;
    T (WCH_put_message_id (STOP_COMMUNICATION_MSG));
    T (WCH_send (nil));
End {WND_Terminate};


Procedure WND_Stop;
Begin
    Done := true;
    T (WCH_put_message_id (STOP_TASK_MSG));
    T (WCH_send (nil));
End {WND_Stop};


PROCEDURE WND_Clear (w : WND_Xid);
BEGIN {WND_Clear}
    Done := true;
    T (WCH_put_message_id (CLEAR_MSG));
    T (WCH_put_id (w));
    T (WCH_send (nil));
END {WND_Clear};


PROCEDURE WND_Fetch (w : WND_Xid);
BEGIN {WND_Fetch}
    T (WCH_put_message_id (FETCH_MSG));
    T (WCH_put_id (w));
    T (WCH_send (nil));
END {WND_Fetch};


PROCEDURE WND_Manage (w : WND_Xid; parent : WND_Xid);
BEGIN {WND_manage}
    T (WCH_put_message_id (MANAGE_MSG));
    T (WCH_put_id (w));
    T (WCH_put_id (parent));
    T (WCH_send (nil));
END {WND_manage};


PROCEDURE WND_Unmanage (w : WND_Xid);
BEGIN {WND_unmanage}
    Done := true;
    T (WCH_put_message_id (UNMANAGE_MSG));
    T (WCH_put_id (w));
    T (WCH_send (nil));
END {WND_unmanage};


PROCEDURE WND_StopCommunication ();
Begin
    Done := true;
    T (WCH_put_message_id (STOP_COMMUNICATION_MSG));
    T (WCH_send (nil));
End {WND_StopCommunication};


Procedure WND_SetInputAllowed (w : WND_Xid; b : Boolean);
Begin
    Done := true;
    T (WCH_put_message_id (SET_INPUT_ALLOWED_MSG));
    T (WCH_put_id (w));
    T (WCH_put_boolean (b));
    T (WCH_send (nil));
End {WND_SetInputAllowed};


Procedure WND_ToggleAttention (w : WND_Xid);
Begin
    Done := true;
    T (WCH_put_message_id (TOGGLE_ATTENTION_MSG));
    T (WCH_put_id (w));
    T (WCH_send (nil));
End {WND_toggle_attention};


PROCEDURE WND_RingBell(count: INTEGER);
BEGIN {WND_RingBell}
    Done := true;
    T (WCH_put_message_id (RING_BELL_MSG));
    T (WCH_send (nil));
END {WND_RingBell};


PROCEDURE WND_SetVideoAttr (
	w	: WND_Xid;
        Row     : WND_RowRange;
        Rows    : WND_RowRange;
        Column  : WND_ColumnRange;
        Columns : WND_ColumnRange;
        VideoAttrib : WND_VideoAttributes);
Var video : integer;
BEGIN {WND_SetVideoAttr}
    Done := true;
    T (WCH_put_message_id (SET_VIDEO_ATTR_MSG));
    T (WCH_put_id (w));
    T (WCH_put_integer (column));
    T (WCH_put_integer (row));
    T (WCH_put_integer (columns));
    T (WCH_put_integer (rows));
    Case VideoAttrib of
    WND_Blink:     video := INV_UND_VT;
    WND_Bold :     video := INVERSE_VT;
    WND_Reverse:   video := INVERSE_VT;
    WND_Underline: video := UNDERLINE_VT;
    WND_Normal:    video := NORMAL_VT;
    Otherwise      video := NORMAL_VT;
    End {case};
    T (WCH_put_integer (video));
    T (WCH_send (nil));
END {WND_Set_VideoAttr};


FUNCTION WND_Column (
	w 	: WND_Xid)
                : WND_ColumnRange;
VAR col: integer;
    id : WCH_msg_id;
BEGIN {WND_Column}
    Done := true;
    T (WCH_put_message_id (GET_Y_POSITION_MSG));
    T (WCH_put_id (w));
    T (WCH_send (nil));
    T (WCH_receive (nil));
    T (WCH_get_message_id (id));
    if id <> SEND_INTEGER_MSG then Error ('WND_Column');
    T (WCH_get_integer (col));
    WND_Column := WND_ColumnRange (col);
END {WND_Column};


FUNCTION WND_Row (
	w 	: WND_Xid)
                : WND_RowRange;
VAR row: integer;
    id : WCH_msg_id;
BEGIN {WND_Row}
    Done := true;
    T (WCH_put_message_id (GET_X_POSITION_MSG));
    T (WCH_put_id (w));
    T (WCH_send (nil));
    T (WCH_receive (nil));
    T (WCH_get_message_id (id));
    if id <> SEND_INTEGER_MSG then Error ('WND_Column');
    T (WCH_get_integer (row));
    WND_Row := WND_RowRange (row);
END {WND_Row};


PROCEDURE WND_NewRowColumn (
	w  	: WND_Xid;
        Row    	: WND_RowRange;
        Column 	: WND_ColumnRange);
BEGIN {WND_NewRowColumn}
    Done := true;
    T (WCH_put_message_id (SET_POSITION_MSG));
    T (WCH_put_id (w));
    T (WCH_put_integer (Row));
    T (WCH_put_integer (Column));
    T (WCH_send (nil));
END {WND_NewRowColumn};


Procedure WND_SetBoolean (w : WND_Xid; b : Boolean);
Begin
    Done := true;
    T (WCH_put_message_id (SET_BOOLEAN_MSG));
    T (WCH_put_id (w));
    T (WCH_put_boolean (b));
    T (WCH_send (nil));
End {WND_SetBoolean};


PROCEDURE WND_GetBoolean (
	w 	: WND_Xid;
    VAR b 	: Boolean);
Var id : WCH_msg_id;
BEGIN
    Done := true;
    T (WCH_put_message_id (GET_BOOLEAN_MSG));
    T (WCH_put_id (w));
    T (WCH_send (nil));
    T (WCH_receive (nil));
    T (WCH_get_message_id (id));
    if id <> SEND_BOOLEAN_MSG then Error ('WND_get_boolean');
    T (WCH_get_boolean (b));
END {WND_GetBoolean};


Procedure WND_SetInteger (w : WND_Xid; i : Integer);
Begin
    Done := true;
    T (WCH_put_message_id (SET_INTEGER_MSG));
    T (WCH_put_id (w));
    T (WCH_put_integer (i));
    T (WCH_send (nil));
End {WND_SetInteger};


PROCEDURE WND_GetInteger (
	w 	: WND_Xid;
    VAR i 	: Integer);
Var id : WCH_msg_id;
BEGIN
    Done := true;
    T (WCH_put_message_id (GET_INTEGER_MSG));
    T (WCH_put_id (w));
    T (WCH_send (nil));
    T (WCH_receive (nil));
    T (WCH_get_message_id (id));
    if id <> SEND_INTEGER_MSG then Error ('WND_get_integer');
    T (WCH_get_integer (i));
END {WND_GetInteger};


Procedure WND_SetString (w : WND_Xid; const s : String);
Begin
    Done := true;
    T (WCH_put_message_id (SET_STRING_MSG));
    T (WCH_put_id (w));
    T (WCH_put_pstring (s));
    T (WCH_send (nil));
End {WND_SetString};


Procedure WND_SetStringId (w : WND_Xid; id : WND_Sid);
Begin
    Done := true;
    T (WCH_put_message_id (SET_STRING_ID_MSG));
    T (WCH_put_id (w));
    T (WCH_put_id (id));
    T (WCH_send (nil));
End {WND_SetStringId};


Procedure WND_SetMessage (id : WND_Sid);
Begin
    WND_SetStringId (X_mw_message_text, id);
End {WND_SetMessage};


Procedure WND_ClearMessage ();
Begin
    WND_Clear (X_mw_message_text);
End {WND_ClearMessage};


Procedure WND_GetString (w : WND_Xid; var s : string);
Var id : WCH_msg_id;
Begin
    Done := true;
    T (WCH_put_message_id (GET_STRING_MSG));
    T (WCH_put_id (w));
    T (WCH_send (nil));
    T (WCH_receive (nil));
    T (WCH_get_message_id (id));
    if id <> SEND_STRING_MSG then Error ('WND_get_string');
    T (WCH_get_pstring (s, STRING_Max));
End {WND_GetString};


Procedure WND_SetStringList (w : WND_Xid; 
		const sa : array [n0..n1 : integer] of STRING_String;
                n_strs : integer);
Var i : integer;
Begin
    Done := true;
    T (WCH_put_message_id (SET_STRING_LIST_MSG));
    T (WCH_put_id (w));
    for i := n0 to n_strs - 1 + n0 do begin
        T (WCH_put_pstring (sa[i]));
    end;
    T (WCH_send (nil));
End {WND_SetStringList};


Procedure WND_SetStringListSelected (w : WND_Xid; 
		const sa : array [n0..n1 : integer] of STRING_String;
                n_strs : integer);
Var i : integer;
Begin
    Done := true;
    T (WCH_put_message_id (SET_STRING_LIST_SELECTED_MSG));
    T (WCH_put_id (w));
    for i := n0 to n_strs - 1 + n0 do begin
        T (WCH_put_pstring (sa[i]));
    end;
    T (WCH_send (nil));
End {WND_SetStringListSelected};


Procedure WND_GetStringList (w : WND_Xid;
		var sa : array [n0..n1 : integer] of STRING_String; 
		var n_strs : integer);
Var id : WCH_msg_id;
    go_on : Boolean;
Begin
    Done := true;
    T (WCH_put_message_id (GET_STRING_LIST_MSG));
    T (WCH_put_id (w));
    T (WCH_send (nil));
    T (WCH_receive (nil));
    T (WCH_get_message_id (id));
    if id <> SEND_STRING_LIST_MSG then Error ('WND_get_string_list');
    n_strs := 0;
    repeat
	go_on := WCH_get_pstring (sa[n0 + n_strs], STRING_Max);
        if go_on then inc (n_strs);
    until (not go_on) or (n_strs > n1 - n0);
End {WND_GetStringList};


Procedure WND_GetStringListSelected (w : WND_Xid;
		var sa : array [n0..n1 : integer] of STRING_String; 
		var n_strs : integer);
Var id : WCH_msg_id;
    go_on : Boolean;
Begin
    Done := true;
    T (WCH_put_message_id (GET_STRING_LIST_SELECTED_MSG));
    T (WCH_put_id (w));
    T (WCH_send (nil));
    T (WCH_receive (nil));
    T (WCH_get_message_id (id));
    if id <> SEND_STRING_LIST_MSG then 
	Error ('WND_get_string_list_selected');
    n_strs := 0;
    repeat
	go_on := WCH_get_pstring (sa[n0 + n_strs], STRING_Max);
        if go_on then inc (n_strs);
    until (not go_on) or (n_strs > n1 - n0);
End {WND_GetStringListSelected};


Procedure WND_GetSelectedPos (w : WND_Xid;
		var sa : array [n0..n1 : integer] of INTEGER; 
		var n_pos : integer);
Var id : WCH_msg_id;
    go_on : Boolean;
Begin
    Done := true;
    T (WCH_put_message_id (GET_SELECTED_POS_MSG));
    T (WCH_put_id (w));
    T (WCH_send (nil));
    T (WCH_receive (nil));
    T (WCH_get_message_id (id));
    if id <> SEND_INTEGER_LIST_MSG then 
	Error ('WND_get_integer_list_selected');
    n_pos := 0;
    repeat
	go_on := WCH_get_integer (sa[n0 + n_pos]);
        if go_on then inc (n_pos);
    until (not go_on) or (n_pos > n1 - n0);
End {WND_GetSelectedPos};


PROCEDURE WND_SetKeys (
          w      : WND_Xid;
    Const keys   : array [n0 .. n1 : integer] of integer);
Var i : integer;
BEGIN
    Done := true;
    T (WCH_put_message_id (SET_KEYS_MSG));
    T (WCH_put_id (w));
    i := n0;
    while (i <= n1) and (keys [i] <> X_undefined) do begin
        T (WCH_put_id (keys[i]));
        i := i + 1;
    end;
    T (WCH_send (nil));
END {WND_SetKeys};


PROCEDURE WND_UnsetKeys (
    Const keys   : array [n0 .. n1 : integer] of WND_Xid);
Var i : integer;
BEGIN
    Done := true;
    T (WCH_put_message_id (UNSET_KEYS_MSG));
    i := n0;
    while (i <= n1) and (keys [i] <> X_undefined) do begin
        T (WCH_put_id (keys[i]));
        i := i + 1;
    end;
    T (WCH_send (nil));
END {WND_UnsetKeys};


PROCEDURE WND_GetKey (VAR k : WND_Xid);
Var id : WCH_msg_id;
BEGIN
    Done := true;
    T (WCH_put_message_id (GET_KEY_MSG));
    T (WCH_send (nil));
    T (WCH_receive (nil));
    T (WCH_get_message_id (id));
    if id <> SEND_ID_MSG then Error ('WND_ReadKey');
    T (WCH_get_id (k));
END {WND_GetKey};


PROCEDURE WND_ReadString (
	w   	: WND_Xid;
    VAR Str 	: String;
        row     : WND_RowRange);
VAR id : WCH_msg_id;
BEGIN {WND_ReadString}
    Done := true;
    T (WCH_put_message_id (READ_STRING_MSG));
    T (WCH_put_id (w));
    T (WCH_put_integer (row));
    T (WCH_send (nil));
    T (WCH_receive (nil));
    T (WCH_get_message_id (id));
    if id <> SEND_STRING_MSG then Error ('WND_ReadString');
    T (WCH_get_pstring (str, String_Max));
End {WND_ReadString};


PROCEDURE WND_WriteString (
	w	    : WND_Xid;
        const Str   : String;
        width       : WND_IORange;
        LeftJustify : WND_LeftJustify);
VAR help_str : String(10);
    send_str : String_String;
BEGIN {WND_WriteString}
    Done := true;
    if width > STRING_length (Str) then begin
        help_str := '          ';
        set_length ( help_str, Min (width - STRING_length (Str), 10) );
        if LeftJustify then send_str := Str || help_str
                       else send_str := help_str || Str;
    end
    else begin
        send_str := Str;
    end;
    T (WCH_put_message_id (WRITE_STRING_MSG));
    T (WCH_put_id (w));
    T (WCH_put_pstring (send_str));
    T (WCH_send (nil));
END {WND_WriteString};


PROCEDURE WND_WriteChar (w : WND_Xid;
                                 c : Char);
VAR cstr: String (1);
BEGIN {WND_WriteChar}
    Done := true;
    cstr := c;
    WND_WriteString (w, cstr, 1, true);
END {WND_WriteChar};


PROCEDURE WND_WriteInteger (
	w  	: WND_Xid;
        i       : Integer;
        width   : WND_IORange;
        LeftJustify : WND_LeftJustify);
VAR str    : String_String;
    len    : Str_Range;
    forget : Boolean;
BEGIN {WND_WriteInteger}
    Done := true;
    { this procedure should contain a conversion from integer to string 
      and a call to WND_WriteString
    }
    forget := STR_IntegerToStr (i,str, len);
    WND_WriteString(w, str, width, LeftJustify);
END {WND_WriteInteger};


PROCEDURE WND_WriteBoolean (w       : WND_Xid;
                            b           : Boolean;
                            width       : WND_IORange;
                            LeftJustify : WND_LeftJustify);
BEGIN {WND_WriteBoolean}
    Done := true;
    writeln ('this function is not used, is it ?');
END {WND_WriteBoolean};


PROCEDURE WND_WriteSpace (w : WND_Xid;
                              width : WND_IORange);
VAR cstr: String(1);
BEGIN {WND_WriteSpace}
    Done := true;
    cstr[1] := ' ';
    WND_WriteString (w, cstr, 1, true);
END {WND_WriteSpace};


PROCEDURE WND_WriteLine (w : WND_Xid;
                                 b : Boolean);
BEGIN {WND_WriteLine}
    Done := true;
    WND_WriteChar (w, chr(10));
END {WND_WriteLine};


Procedure WND_DestroyTree (w : WND_Xid);
Begin
    Done := true;
    T (WCH_put_message_id (DESTROY_TREE_MSG));
    T (WCH_put_id (w));
    T (WCH_send (nil));
End {WND_StartTree};


Procedure WND_StartTree (w : WND_Xid);
Begin
    Done := true;
    T (WCH_put_message_id (START_TREE_MSG));
    T (WCH_put_id (w));
    T (WCH_send (nil));
End {WND_StartTree};


Procedure WND_EndTree (id : WND_Xid);
Begin
    Done := true;
    T (WCH_put_message_id (END_TREE_MSG));
    T (WCH_put_id (id));
    T (WCH_send (nil));
End {WND_EndTree};


Procedure WND_SetNode (node_id, parent_id : WND_Did;
                       const label1, label2 : String );
Begin
    Done := true;
    T (WCH_put_message_id (SET_NODE_MSG));
    T (WCH_put_id (node_id));
    T (WCH_put_id (parent_id));
    T (WCH_put_pstring (label1));
    T (WCH_put_pstring (label2));
    T (WCH_send (nil));
End {WND_SetNode};


Procedure WND_GetNodeSelected (id : WND_Xid ; var node_id : WND_Did);
Var mid : WCH_msg_id;
Begin
    Done := true;
    T (WCH_put_message_id (GET_NODE_SELECTED_MSG));
    T (WCH_put_id (id));
    T (WCH_send (nil));
    T (WCH_receive (nil));
    T (WCH_get_message_id (mid));
    if mid <> SEND_ID_MSG then Error ('WND_get_node_selected');
    T (WCH_get_id (node_id));
End {WND_GetNodeSelected};


Procedure WND_DestroyAttr (id : WND_Xid);
Begin
    Done := true;
    T (WCH_put_message_id (DESTROY_ATTR_MSG));
    T (WCH_put_id (id));
    T (WCH_send (nil));
End {WND_DestroyAttr};


Procedure WND_StartAttr (id : WND_Xid);
Begin
    Done := true;
    T (WCH_put_message_id (START_ATTR_MSG));
    T (WCH_put_id (id));
    T (WCH_send (nil));
End {WND_StartAttr};


Procedure WND_EndAttr (id : WND_Xid);
Begin
    Done := true;
    T (WCH_put_message_id (END_ATTR_MSG));
    T (WCH_put_id (id));
    T (WCH_send (nil));
End {WND_EndAttr};


Procedure WND_SetAttr (attr_id : WND_Did;
                       const name: String;
                       complex : Boolean;
                       editable : Boolean;
                       const sa : array [n0..n1 : integer] of STRING_String;
                       n_strs : integer);
Var i : integer;
Begin
    Done := true;
    T (WCH_put_message_id (SET_ATTR_MSG));
    T (WCH_put_id (attr_id));
    T (WCH_put_pstring (name));
    T (WCH_put_boolean (complex));
    T (WCH_put_boolean (editable));
    for i := n0 to n_strs - 1 + n0 do begin
        T (WCH_put_pstring (sa[i]));
    end;
    T (WCH_send (nil));
End {WND_SetAttr};


Procedure WND_GetAttrSelected (id : WND_Xid ; var attr_id : WND_Did);
Var mid : WCH_msg_id;
Begin
    Done := true;
    T (WCH_put_message_id (GET_ATTR_SELECTED_MSG));
    T (WCH_put_id (id));
    T (WCH_send (nil));
    T (WCH_receive (nil));
    T (WCH_get_message_id (mid));
    if mid <> SEND_ID_MSG then Error ('WND_get_attr_selected');
    T (WCH_get_id (attr_id));
End {WND_GetAttrSelected};


Procedure WND_GetAttrValues (id : WND_Did ;
                            var name : String_String;
                            var sa : array [n0..n1 : integer] of String_String;
                            var n_strs : integer);
Var mid : WCH_msg_id;
    go_on : Boolean;
Begin
    Done := true;
    T (WCH_put_message_id (GET_ATTR_VALUES_MSG));
    T (WCH_put_id (id));
    T (WCH_send (nil));
    T (WCH_receive (nil));
    T (WCH_get_message_id (mid));
    if mid <> SEND_STRING_LIST_MSG then Error ('WND_GetAttrValues');
    go_on := WCH_get_pstring (name, STRING_Max);
    n_strs := 0;
    repeat
	go_on := WCH_get_pstring (sa[n0 + n_strs], STRING_Max);
        if go_on then inc (n_strs);
    until (not go_on) or (n_strs > n1 - n0);
End {WND_GetAttrValues};

Procedure WND_GetAttrChanged (id : WND_Xid ;
                            var sa : array [n0..n1 : integer] of WND_Did;
                            var n_dids : integer);
Var mid : WCH_msg_id;
    go_on : Boolean;
Begin
    Done := true;
    T (WCH_put_message_id (GET_ATTR_CHANGED_MSG));
    T (WCH_put_id (id));
    T (WCH_send (nil));
    T (WCH_receive (nil));
    T (WCH_get_message_id (mid));
    if mid <> SEND_ID_LIST_MSG then Error ('WND_GetAttrChanged');
    n_dids := 0;
    repeat
	go_on := WCH_get_id (sa[n0 + n_dids]);
        if go_on then inc (n_dids);
    until (not go_on) or (n_dids > n1 - n0);
End {WND_GetAttrChanged};

Function WND_CodeKey (key : WND_Xid; screenNr : integer) : WND_Xid;
Begin
    WND_CodeKey := key + SCREEN_OFFSET * screenNr;

End {WND_CodeKey};

PROCEDURE WND_DecodeKey (rkey : WND_Xid; Var key : WND_Xid; Var screenNr : integer);
Begin
    IF rkey >= SCREEN_START THEN BEGIN
        screenNr := (rkey - SCREEN_START) Div SCREEN_OFFSET;
        key      := rkey - SCREEN_OFFSET * screenNr;
        IF screenNr >= MAX_SCREENS THEN
            writeln ('Error in WND_DecodeKey');             
    END
    ELSE BEGIN
        screenNr := 0;
        key := rkey;
    END
End {WND_DecodeKey};

Function WND_GetNextDid : WND_Did;
Begin
    WND_GetNextDid := DidArea;
    DidArea := DidArea + 1;
End {WND_GetNextDid};

PROCEDURE WND_ResetDid;
Begin
    DidArea := 1;
End {WND_ResetDid};

Function WND_GetFreeScreenNr (scrType : WND_ScreenType; VAR screen_nr : integer) :
         boolean;
Var i : Integer;
    found : Boolean;
Begin
    i := 0;
    found := False;
    screen_nr := -1;
    While (i < MAX_SCREENS) And (Not found) Do Begin
        If ScreenNrs [i, scrType] Then Begin
            screen_nr := i;
	    ScreenNrs [i, scrType] := False;
	    Found := True;
	End;
	i := i + 1;
    End;
    If Not found Then Begin
        ERROR_Write (ERROR_MaxNrScreens);
        WND_GetFreeScreenNr := False;
    End
    Else
        WND_GetFreeScreenNr := True;

End {WND_GetFreeScreenNr};

PROCEDURE WND_FreeScreenNr (scrType : WND_ScreenType; screenNr : integer);
Begin
    If (screenNr < 0) Or (screenNr >= MAX_SCREENS) Then
        Error ('Error WND_FreeScreenNr')
    Else
        ScreenNrs [screenNr, scrType] := True;
End {WND_FreeScreenNr};
