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

function LSLEXED_Language: MB_LanguageType;
begin
  LSLEXED_Language := dutch;
end;

procedure LSLEXED_DefaultFonInfo(f: LSPHONDEF_pPhonInfo;
                                            stem: STRING_String);
begin
  f^.sjwa := false;
  f^.wissel := false;
end;

procedure LSLEXED_ShowLSMdict(liCC : LIMORFDEF_ContextConds;
                              lsfon: LSPHONDEF_pPhonInfo);
begin
  WND_SetBoolean(X_le_sjwa_toggle, lsfon^.sjwa);
  WND_SetBoolean(X_le_wissel_toggle, lsfon^.wissel);
end;

procedure LSLEXED_ReadLSMdict(var liCC: Limorfdef_ContextConds;
                                  lsfon: Lsphondef_pPhonInfo;
                              var modified: boolean);
var
  b: boolean;
begin
  modified := false;
  b := lsfon^.sjwa;
  WND_GetBoolean(X_le_sjwa_toggle, lsfon^.sjwa);
  if b <> lsfon^.sjwa
  then modified := true;
  b := lsfon^.wissel;
  WND_GetBoolean(X_le_wissel_toggle, lsfon^.wissel);
  if b <> lsfon^.wissel
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
    2: MenuChoiceBoolean(LemmaWindow, startpos, lsfon^.sjwa, modified);
    3: MenuChoiceBoolean(LemmaWindow, startpos, lsfon^.wissel, modified);
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
  MenuOptions[1] := 'English';
  MenuOptions[2] := 'Spanish';
  MenuChoice(2, MenuOptions, center, choice);
  case choice of
    0: LanguageSelected := false;
    1: l := english;
    2: l := spanish;
  end;
  LSLEXED_selectOtherLanguage := LanguageSelected;
*)
end;

PROCEDURE LSLEXED_AssignParticle(
                            var BlexRec: LSDOMAINT_BlexStruct;
                            ParticleKey: integer);
begin
  case BlexRec.cat of
    bverb: BlexRec.BverbRec.particle := ParticleKey;
    otherwise;
  end;
end;

