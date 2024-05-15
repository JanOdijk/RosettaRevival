h29011
s 00032/00024/00081
d D 1.3 93/07/07 12:38:28 uittenbo 3 2
c 
e
s 00105/00001/00000
d D 1.2 91/08/15 14:59:42 leermake 2 1
c 
e
s 00001/00000/00000
d D 1.1 91/08/15 10:37:13 leermake 1 0
c date and time created 91/08/15 10:37:13 by leermake
e
u
U
f e 0
t
T
I 1
D 2
 
E 2
I 2
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
I 3
pragma C_Include('wnd.pf');
E 3


PROGRAM LSLEXED;
D 3
WITH LSLEXED,LSPHONDEF,LSDOMAINT,LIMORFDEF,LEXEDAUX,MB,STRNG,WINDOWS;
E 3
I 3
WITH LSPHONDEF,LSDOMAINT,LIMORFDEF,LEXEDAUX,MB,STRNG,WINDOWS,WND;
E 3

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

D 3
procedure LSLEXED_ShowLSMdict(LemmaWindow: WINDOWS_Window;
                                         liCC : LIMORFDEF_ContextConds;
                                         lsfon: LSPHONDEF_pPhonInfo;
                                         var nr: integer);
E 3
I 3
procedure LSLEXED_ShowLSMdict(liCC : LIMORFDEF_ContextConds;
                              lsfon: LSPHONDEF_pPhonInfo);
E 3
begin
D 3
  nr := 2;
  WINDOWS_WriteStr(LemmaWindow, 'sjwa ',
                   MaxFieldNameLength, MaxFieldNameLength, true);
  WINDOWS_WriteStr(LemmaWindow, ' : ', 3, 3, true);
  if lsfon^.sjwa
  then WINDOWS_WriteStr(LemmaWindow, 'TRUE',4,4, true)
  else WINDOWS_WriteStr(LemmaWindow, 'FALSE',5,5, true);
  WINDOWS_WriteLine(LemmaWindow, true);
  WINDOWS_WriteStr(LemmaWindow, 'wissel ',
                   MaxFieldNameLength, MaxFieldNameLength, true);
  WINDOWS_WriteStr(LemmaWindow, ' : ', 3, 3, true);
  if lsfon^.wissel
  then WINDOWS_WriteStr(LemmaWindow, 'TRUE',4,4, true)
  else WINDOWS_WriteStr(LemmaWindow, 'FALSE',5,5, true);
  WINDOWS_WriteLine(LemmaWindow, true);
E 3
I 3
  WND_SetBoolean(X_le_sjwa_toggle, lsfon^.sjwa);
  WND_SetBoolean(X_le_wissel_toggle, lsfon^.wissel);
E 3
end;

I 3
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

E 3
PROCEDURE LSLEXED_DoKeyLSMdict(LemmaWindow: WINDOWS_Window;
                                          var liCC : LIMORFDEF_ContextConds;
                                          lsfon: LSPHONDEF_pPhonInfo;
                                          RelLine: integer;
                                          var modified: boolean);
const startpos = MaxfieldnameLength+4;
begin
I 3
(*
E 3
  case RelLine of { starting with second line }
    2: MenuChoiceBoolean(LemmaWindow, startpos, lsfon^.sjwa, modified);
    3: MenuChoiceBoolean(LemmaWindow, startpos, lsfon^.wissel, modified);
  end;
I 3
*)
E 3
end;

FUNCTION LSLEXED_SelectOtherLanguage(var l: MB_languagetype): boolean;
var
D 3
  MenuOptions: array[1..2] of STRING_String := 
    [1: 'English';
     2: 'Spanish'];
E 3
I 3
  MenuOptions: array[1..2] of STRING_String;
E 3
  choice: integer;
D 3
  LanguageSelected: boolean := true;
E 3
I 3
  LanguageSelected: boolean;
E 3
begin
I 3
(*
  LanguageSelected := true;
  MenuOptions[1] := 'English';
  MenuOptions[2] := 'Spanish';
E 3
  MenuChoice(2, MenuOptions, center, choice);
  case choice of
    0: LanguageSelected := false;
    1: l := english;
    2: l := spanish;
  end;
  LSLEXED_selectOtherLanguage := LanguageSelected;
I 3
*)
E 3
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

E 2
E 1
