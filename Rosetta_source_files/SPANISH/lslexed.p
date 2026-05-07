(*MPM:::===================================================================*
 *
 *  Rosetta Project                                                 
 *                                                                  
 *  Module Title    : LSLEXED
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
Export(LSLEXED);
pragma C_Include('lslexed.pf');
pragma C_Include('lsphondef.pf');
pragma C_Include('lsdomaint.pf');
pragma C_Include('limorfdef.pf');
pragma C_Include('lexedaux.pf');
pragma C_Include('mb.pf');
pragma C_Include('string.pf');
pragma C_Include('windows.pf');
pragma C_Include('wnd.pf');


PROGRAM LSLEXED;
WITH LSPHONDEF,LSDOMAINT,LIMORFDEF,LEXEDAUX,MB,STRNG,WINDOWS,WND;
WITH LOOPHOLES;

function LSLEXED_Language: MB_LanguageType;
begin
  LSLEXED_Language := spanish;
end;


procedure LSLEXED_DefaultFonInfo(f: LSPHONDEF_pPhonInfo;
                                            stem: STRING_String);
begin
  f^.gg := false;
  f^.ch := false;
  f^.kk := false;
  f^.th := false;
end;

procedure LSLEXED_ShowLSMdict(liCC : LIMORFDEF_ContextConds;
                              lsfon: LSPHONDEF_pPhonInfo);
begin
  WND_SetBoolean(X_le_gg_toggle, lsfon^.gg);
  WND_SetBoolean(X_le_ch_toggle, lsfon^.ch);
  WND_SetBoolean(X_le_kk_toggle, lsfon^.kk);
  WND_SetBoolean(X_le_th_toggle, lsfon^.th);
end;

procedure LSLEXED_ReadLSMdict(var liCC: Limorfdef_ContextConds;
                                  lsfon: Lsphondef_pPhonInfo;
                              var modified: boolean);
var
  b: boolean;
begin
  modified := false;
  b := lsfon^.gg;
  WND_GetBoolean(X_le_gg_toggle, lsfon^.gg);
  if b <> lsfon^.gg
  then modified := true;
  b := lsfon^.ch;
  WND_GetBoolean(X_le_ch_toggle, lsfon^.ch);
  if b <> lsfon^.ch
  then modified := true;
  b := lsfon^.kk;
  WND_GetBoolean(X_le_kk_toggle, lsfon^.kk);
  if b <> lsfon^.kk
  then modified := true;
  b := lsfon^.th;
  WND_GetBoolean(X_le_th_toggle, lsfon^.th);
  if b <> lsfon^.th
  then modified := true;
end;

PROCEDURE LSLEXED_DoKeyLSMdict(LemmaWindow: WINDOWS_Window;
                                          var liCC : LIMORFDEF_ContextConds;
                                          lsfon: LSPHONDEF_pPhonInfo;
                                          RelLine: integer;
                                          var modified: boolean);
const startpos = MaxfieldnameLength+4;
begin
(*
  case RelLine of { starting with second line }
    2: MenuChoiceBoolean(LemmaWindow, startpos, lsfon^.gg, modified);
    3: MenuChoiceBoolean(LemmaWindow, startpos, lsfon^.ch, modified);
    4: MenuChoiceBoolean(LemmaWindow, startpos, lsfon^.kk, modified);
    5: MenuChoiceBoolean(LemmaWindow, startpos, lsfon^.th, modified);
  end;
*)
end;

FUNCTION LSLEXED_SelectOtherLanguage(var l: MB_languagetype): boolean;
var
  MenuOptions: array[1..2] of STRING_String;
  choice: integer;
  LanguageSelected: boolean;
begin
(*
  LanguageSelected := true;
  MenuOptions[1] := 'Dutch';
  MenuOptions[2] := 'English';
  MenuChoice(2, MenuOptions, center, choice);
  case choice of
    0: LanguageSelected := false;
    1: l := dutch;
    2: l := english;
  end;
  LSLEXED_selectOtherLanguage := LanguageSelected;
*)
end;

PROCEDURE LSLEXED_AssignParticle(
                            var BlexRec: LSDOMAINT_BlexStruct;
                            ParticleKey: integer);
begin
  { Particles do not exist in Spanish }
end;

