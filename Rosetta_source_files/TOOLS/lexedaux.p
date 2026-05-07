(*MPM:::===================================================================*
 *
 *  Rosetta Project                                                 
 *                                                                  
 *  Module Title    : LEXEDAUX
 *  Creation date   : 13 august 1990
 *  Author          : Frank Uittenbogaard                                  
 *                                                                  
 *  Copyright (c) 1990, by Nederlandse Philips Bedrijven BV.        
 *                                                                  
 *  Remarks         :  
 *
 *EMP:::===================================================================*)

(*=========================================================================*
 *  Imported modules
 *=========================================================================*)
Export(LEXEDAUX);
pragma C_Include('lexedaux.pf');
pragma C_Include('globdef.pf');
pragma C_Include('mem.pf');
pragma C_Include('log.pf');
pragma C_Include('string.pf');
pragma C_Include('str.pf');
pragma C_Include('wnd.pf');


PROGRAM LEXEDAUX;
WITH GLOBDEF,MEM,LOG,STRNG,STR,WINDOWS,WND;
WITH LOOPHOLES;

 PROCEDURE LEXEDAUX_Log(s: STRING_String);
var 
  intstatus,
  len: String_Range;
  t: STRING(70);
begin
  intstatus := 0;
  STRING_ExtractChars(t, len, s, 1, STRING_Length(s));
  LOG_Write(t, len, intstatus);
  writeln(s);
end;

procedure LEXEDAUX_Error(const msg: string);
var
  key  : WND_Xid;
begin
   WND_SetString ( X_le_error_window, msg );
   WND_Manage ( X_le_error_window, X_undefined );
(*
   MakeKeySensitive(X_le_error_ok_button);
   UpdateScreen;
*)
   WND_GetKey (key);
(*
   MakeKeyInsensitive(X_le_error_ok_button);
   UpdateScreen;
*)
   WND_Unmanage ( X_le_error_window );
end;

PROCEDURE GiveMessage(CONST msg: STRING);
BEGIN
   LEXEDAUX_Error(msg);
END {GiveMessage};

 function AskString(const question: string;
                    var answer: String_String): boolean;
  var 
    ExitLoop: boolean;
    AnswerString: string(80);
    Key: WND_Xid;
  begin
    WND_Manage ( X_le_ask_string_window, X_undefined ); 
    WND_SetString(X_le_ask_string_prompt, question);
    WND_SetString(X_le_ask_string_value, '');
    MakeKeySensitive(X_le_ask_string_ok_button);
    MakeKeySensitive(X_le_ask_string_cancel_button);
    UpdateScreen;
    ExitLoop := false;
    while not ExitLoop
    do begin
      WND_GetKey(Key);
      if Key = X_le_ask_string_ok_button
      then begin
        WND_GetString(X_le_ask_string_value, AnswerString);
        ExitLoop := true;
        AskString := true;
      end
      else begin
        ExitLoop := true;
        AskString := false;
      end;
    end;
    MakeKeyInsensitive(X_le_ask_string_ok_button);
    MakeKeyInsensitive(X_le_ask_string_cancel_button);
    UpdateScreen;
    WND_Unmanage ( X_le_ask_string_window ); 
    String_Constant(answer, AnswerString, 80);
    String_Trim(answer, answer);
  end;

 function AskInteger(const question: string;
                     var answer: integer): boolean;
  var 
    ExitLoop: boolean;
    AnswerString: string(8);
    Key: WND_Xid;
  begin
    WND_Manage ( X_le_ask_string_window, X_undefined ); 
    WND_SetString(X_le_ask_string_prompt, question);
    WND_SetString(X_le_ask_string_value, '');
    MakeKeySensitive(X_le_ask_string_ok_button);
    MakeKeySensitive(X_le_ask_string_cancel_button);
    UpdateScreen;
    ExitLoop := false;
    while not ExitLoop
    do begin
      WND_GetKey(Key);
      if Key = X_le_ask_string_ok_button
      then begin
        WND_GetString(X_le_ask_string_value, AnswerString);
        if STR_StrToInteger(AnswerString, 8, Answer)
        then begin
          ExitLoop := true;
          AskInteger := true;
        end
        else LEXEDAUX_Error('Integer value expected. ');
      end
      else begin
        ExitLoop := true;
        AskInteger := false;
      end;
    end;
    MakeKeyInsensitive(X_le_ask_string_ok_button);
    MakeKeyInsensitive(X_le_ask_string_cancel_button);
    UpdateScreen;
    WND_Unmanage ( X_le_ask_string_window ); 
  end;


 function AskBoolean(question: STRING_String): boolean;
var 
   key: WND_Xid;
begin
   WND_SetString ( X_le_ask_boolean_window, question );
   WND_Manage ( X_le_ask_boolean_window, X_undefined );
   MakeKeySensitive(X_le_ask_boolean_yes_button);
   MakeKeySensitive(X_le_ask_boolean_no_button);
   UpdateScreen;
   WND_GetKey (key);
   MakeKeyInsensitive(X_le_ask_boolean_yes_button);
   MakeKeyInsensitive(X_le_ask_boolean_no_button);
   UpdateScreen;
   WND_Unmanage ( X_le_ask_boolean_window );
   AskBoolean := (key = X_le_ask_boolean_yes_button);
end;

type WindowEnum = (MainWindow, SelectWindow, SidWindow, IdWindow, IlWindow,
                   ErrorWindow, AskStringWindow, AskBooleanWindow);

var
  DesiredScreenState,
  CurrentScreenState: ScreenStateArray;
  KeyWindowRelations: array[1..MaxScreenKeys] of WindowEnum;
  SetKeysMessage,
  UnsetKeysMessage  : array[WindowEnum] of record
    TopMessage      : integer;
    Message         : array[1..MaxScreenKeys] of WND_Xid;
  end;
  WindowCodes       : array[WindowEnum] of WND_Xid;

procedure InitScreenState;
var
  i: integer;
begin
  WindowCodes[MainWindow] := X_le_window;
  WindowCodes[SelectWindow] := X_le_select_window;
  WindowCodes[SidWindow] := X_le_sid_window;
  WindowCodes[IdWindow] := X_le_id_window;
  WindowCodes[IlWindow] := X_le_il_window;
  WindowCodes[ErrorWindow] := X_le_error_window;
  WindowCodes[AskStringWindow] := X_le_ask_string_window;
  WindowCodes[AskBooleanWindow] := X_le_ask_boolean_window;

  KeyWindowRelations[X_le_current_button] := MainWindow;
  KeyWindowRelations[X_le_frozen_button] := MainWindow;
  KeyWindowRelations[X_le_local_button] := MainWindow;
  KeyWindowRelations[X_le_dutch_button] := MainWindow;
  KeyWindowRelations[X_le_english_button] := MainWindow;
  KeyWindowRelations[X_le_spanish_button] := MainWindow;
  KeyWindowRelations[X_le_exit_button] := MainWindow;
  KeyWindowRelations[X_le_find_lemma_button] := MainWindow;
  KeyWindowRelations[X_le_modify_lemma_button] := MainWindow;
  KeyWindowRelations[X_le_copy_lemma_button] := MainWindow;
  KeyWindowRelations[X_le_insert_lemma_button] := MainWindow;
  KeyWindowRelations[X_le_sequential_button] := MainWindow;
  KeyWindowRelations[X_le_insert_meaning_button] := MainWindow;
  KeyWindowRelations[X_le_insert_particle_button] := MainWindow;
  KeyWindowRelations[X_le_insert_idiom_button] := MainWindow;
  KeyWindowRelations[X_le_insert_semi_idiom_button] := MainWindow;
  KeyWindowRelations[X_le_delete_lemma_button] := MainWindow;
  KeyWindowRelations[X_le_translate_dutch_button] := MainWindow;
  KeyWindowRelations[X_le_translate_english_button] := MainWindow;
  KeyWindowRelations[X_le_translate_spanish_button] := MainWindow;
  KeyWindowRelations[X_le_show_idioms_button] := MainWindow;
  KeyWindowRelations[X_le_show_semi_idioms_button] := MainWindow;
  KeyWindowRelations[X_le_help_button] := MainWindow;
  KeyWindowRelations[X_le_previous_button] := MainWindow;
  KeyWindowRelations[X_le_next_button] := MainWindow;
  KeyWindowRelations[X_le_jump_button] := MainWindow;
  KeyWindowRelations[X_le_return_button] := MainWindow;
  KeyWindowRelations[X_le_select_button] := MainWindow;
  KeyWindowRelations[X_le_analysis_toggle] := MainWindow;
  KeyWindowRelations[X_le_generation_toggle] := MainWindow;
  KeyWindowRelations[X_le_angen_toggle] := MainWindow;
  KeyWindowRelations[X_le_sjwa_toggle] := MainWindow;
  KeyWindowRelations[X_le_wissel_toggle] := MainWindow;
  KeyWindowRelations[X_le_cons_toggle] := MainWindow;
  KeyWindowRelations[X_le_gg_toggle] := MainWindow;
  KeyWindowRelations[X_le_ch_toggle] := MainWindow;
  KeyWindowRelations[X_le_kk_toggle] := MainWindow;
  KeyWindowRelations[X_le_th_toggle] := MainWindow;
  KeyWindowRelations[X_le_comment_text] := MainWindow;
  KeyWindowRelations[X_le_attr_list] := MainWindow;

  KeyWindowRelations[X_le_help_ok_button] := ErrorWindow;

  keyWindowRelations[X_le_ask_string_ok_button] := AskStringWindow;
  keyWindowRelations[X_le_ask_string_cancel_button] := AskStringWindow;
  keyWindowRelations[X_le_ask_string_prompt] := AskStringWindow;
  keyWindowRelations[X_le_ask_string_value] := AskStringWindow;

  keyWindowRelations[X_le_ask_boolean_yes_button] := AskBooleanWindow;
  keyWindowRelations[X_le_ask_boolean_no_button] := AskBooleanWindow;

  KeyWindowRelations[X_le_select_ok_button] := SelectWindow;
  KeyWindowRelations[X_le_select_cancel_button] := SelectWindow;
  KeyWindowRelations[X_le_select_help_button] := SelectWindow;

  KeyWindowRelations[X_le_il_ok_button] := IlWindow;
  KeyWindowRelations[X_le_il_cancel_button] := IlWindow;
  KeyWindowRelations[X_le_il_select_button] := IlWindow;
  KeyWindowRelations[X_le_il_help_button] := IlWindow;
  KeyWindowRelations[X_le_il_modify_spref_button] := IlWindow;
  KeyWindowRelations[X_le_il_modify_mpref_button] := IlWindow;
  KeyWindowRelations[X_le_il_analysis_toggle] := IlWindow;
  KeyWindowRelations[X_le_il_generation_toggle] := IlWindow;
  KeyWindowRelations[X_le_il_angen_toggle] := IlWindow;
  KeyWindowRelations[X_le_il_new_meaning_button] := IlWindow;
  KeyWindowRelations[X_le_il_dutch_meaning_button] := IlWindow;
  KeyWindowRelations[X_le_il_english_meaning_button] := IlWindow;
  KeyWindowRelations[X_le_il_spanish_meaning_button] := IlWindow;
  KeyWindowRelations[X_le_il_mark_il_button] := IlWindow;
  KeyWindowRelations[X_le_il_delete_il_button] := IlWindow;
  KeyWindowRelations[X_le_il_translate_dutch_button] := IlWindow;
  KeyWindowRelations[X_le_il_translate_english_button] := IlWindow;
  KeyWindowRelations[X_le_il_translate_spanish_button] := IlWindow;
  KeyWindowRelations[X_le_il_status] := IlWindow;
  KeyWindowRelations[X_le_il_analysis_toggle] := IlWindow;
  KeyWindowRelations[X_le_il_generation_toggle] := IlWindow;
  KeyWindowRelations[X_le_il_angen_toggle] := IlWindow;
  KeyWindowRelations[X_le_il_description] := IlWindow;
  KeyWindowRelations[X_le_il_comments] := IlWindow;

  KeyWindowRelations[X_le_Sid_ok_button] := SidWindow;
  KeyWindowRelations[X_le_Sid_cancel_button] := SidWindow;
  KeyWindowRelations[X_le_Sid_select_button] := SidWindow;
  KeyWindowRelations[X_le_Sid_help_button] := SidWindow;
  KeyWindowRelations[X_le_Sid_modify_argument_button] := SidWindow;
  KeyWindowRelations[X_le_Sid_modify_number_button] := SidWindow;
  KeyWindowRelations[X_le_Sid_new_meaning_button] := SidWindow;
  KeyWindowRelations[X_le_Sid_dutch_meaning_button] := SidWindow;
  KeyWindowRelations[X_le_Sid_english_meaning_button] := SidWindow;
  KeyWindowRelations[X_le_Sid_spanish_meaning_button] := SidWindow;
  KeyWindowRelations[X_le_Sid_delete_sid_button] := SidWindow;
  KeyWindowRelations[X_le_Sid_translate_dutch_button] := SidWindow;
  KeyWindowRelations[X_le_Sid_translate_english_button] := SidWindow;
  KeyWindowRelations[X_le_Sid_translate_spanish_button] := SidWindow;
  KeyWindowRelations[X_le_Sid_show_argument_button] := SidWindow;
  KeyWindowRelations[X_le_Sid_deleted] := SidWindow;
  KeyWindowRelations[X_le_Sid_comments] := SidWindow;

  KeyWindowRelations[X_le_id_ok_button] := IdWindow;
  KeyWindowRelations[X_le_id_cancel_button] := IdWindow;
  KeyWindowRelations[X_le_id_select_button] := IdWindow;
  KeyWindowRelations[X_le_id_help_button] := IdWindow;
  KeyWindowRelations[X_le_id_modify_argument_button] := IdWindow;
  KeyWindowRelations[X_le_id_modify_pattern_button] := IdWindow;
  KeyWindowRelations[X_le_id_new_meaning_button] := IdWindow;
  KeyWindowRelations[X_le_id_dutch_meaning_button] := IdWindow;
  KeyWindowRelations[X_le_id_english_meaning_button] := IdWindow;
  KeyWindowRelations[X_le_id_spanish_meaning_button] := IdWindow;
  KeyWindowRelations[X_le_id_insert_argument_button] := IdWindow;
  KeyWindowRelations[X_le_id_delete_id_button] := IdWindow;
  KeyWindowRelations[X_le_id_translate_dutch_button] := IdWindow;
  KeyWindowRelations[X_le_id_translate_english_button] := IdWindow;
  KeyWindowRelations[X_le_id_translate_spanish_button] := IdWindow;
  KeyWindowRelations[X_le_id_show_argument_button] := IdWindow;
  KeyWindowRelations[X_le_id_deleted] := IdWindow;
  KeyWindowRelations[X_le_id_comments] := IdWindow;

  for i := 0 to MaxScreenkeys 
  do CurrentScreenState[i] := false;
  DesiredScreenState := CurrentScreenState;
end;

procedure MakeAllKeysInsensitive;
var
  i: integer;
begin
  for i := 0 to MaxScreenKeys
  do DesiredScreenState[i] := false;
end;

procedure MakeKeySensitive(key: WND_Xid);
begin
  DesiredScreenState[key] := true;
end;

procedure MakeKeysSensitive(const keys: array[lb..ub: integer] of WND_Xid);
var 
  i: integer;
begin
  for i := lb to ub
  do begin
    if keys[i] <> X_Undefined
    then MakekeySensitive(keys[i]);
  end;
end;

procedure MakeKeyInsensitive(key: WND_Xid);
begin
  DesiredScreenState[key] := false;
end;

procedure MakeKeysInsensitive(const keys: array[lb..ub: integer] of WND_Xid);
var 
  i: integer;
begin
  for i := lb to ub
  do begin
    if keys[i] <> X_Undefined
    then MakekeyInsensitive(keys[i]);
  end;
end;

procedure UpdateScreen;
var
  i: integer;
  w: WindowEnum;
begin
  for w := Lowest(WindowEnum) to Highest(WindowEnum)
  do begin
    SetKeysMessage[w].TopMessage := 0;
    UnsetKeysMessage[w].TopMessage := 0;
  end;

  for i := 1 to MaxScreenKeys
  do begin
    if CurrentScreenState[i] <> DesiredScreenState[i]
    then begin
      if DesiredScreenState[i]
      then with SetKeysMessage[KeyWindowRelations[i]] do  begin
        TopMessage := TopMessage+1;
        Message[TopMessage] := i;
      end
      else with UnsetKeysMessage[KeyWindowRelations[i]] do begin
        TopMessage := TopMessage+1;
        Message[TopMessage] := i;
      end;
    end;
  end;

  for w := Lowest(WindowEnum) to Highest(WindowEnum)
  do begin
    with SetKeysMessage[w] 
    do if TopMessage > 0 then begin
      if TopMessage < MaxScreenKeys
      then Message[TopMessage+1] := X_Undefined;
      WND_SetKeys(WindowCodes[w], Message);
    end;
    with UnsetKeysMessage[w] 
    do if TopMessage > 0 then begin
      if TopMessage < MaxScreenKeys
      then Message[TopMessage+1] := X_Undefined;
      WND_UnsetKeys(Message);
    end;
  end;

  CurrentScreenState := DesiredScreenState;
end;

procedure StoreScreenState(var state: ScreenStateArray);
begin
  state := CurrentScreenState;
end;

procedure RestoreScreenState(state: ScreenStateArray);
begin
  DesiredScreenState := state;
  UpdateScreen;
end;
