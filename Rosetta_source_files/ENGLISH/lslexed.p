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
pragma C_Include('lsmorfdef.pf');
pragma C_Include('lexedaux.pf');
pragma C_Include('mb.pf');
pragma C_Include('string.pf');
pragma C_Include('windows.pf');
pragma C_Include('wnd.pf');


PROGRAM LSLEXED;
WITH LSPHONDEF,LSDOMAINT,LIMORFDEF,LSMORFDEF,LEXEDAUX,MB,STRNG,WINDOWS,WND;
WITH LOOPHOLES;

function LSLEXED_Language: MB_LanguageType;
begin
  LSLEXED_Language := english;
end;

procedure LSLEXED_DefaultFonInfo(f: LSPHONDEF_pPhonInfo;
                                            stem: STRING_String);
begin
   IF stem[1] IN ['A','E','I','O','U','a','e','i','o','u'] THEN 
      f^.cons := FALSE
   ELSE 
      f^.cons := TRUE;
end;

procedure LSLEXED_ShowLSMdict(liCC: LIMORFDEF_ContextConds;
                              lsfon: LSPHONDEF_pPhonInfo);
var
  lsCC: LSMORFDEF_ContextConds;
begin
(*
  nr := 2;
  lsCC := Retype(liCC,LSMORFDEF_ContextConds);
  WINDOWS_WriteString(LemmaWindow, 'context', MaxFieldNameLength, true);
  WINDOWS_WriteStr(LemmaWindow, ' : ', 3, 3, true);
  case lsCC of
    CCVowel: WINDOWS_WriteString(LemmaWindow, 'Vowel', 0, true);
    CCCons : WINDOWS_WriteString(LemmaWindow, 'Consonant', 0, true);
    otherwise WINDOWS_WriteString(LemmaWindow, 'None', 0, true);
  end;
  WINDOWS_WriteLine(LemmaWindow, true);
*)
  WND_SetBoolean(X_le_cons_toggle, lsfon^.cons);
end;

procedure LSLEXED_ReadLSMdict(var liCC: Limorfdef_ContextConds;
                                  lsfon: Lsphondef_pPhonInfo;
                              var modified: boolean);
var
  b: boolean;
begin
  { CC !!! }
  modified := false;
  b := lsfon^.cons;
  WND_GetBoolean(X_le_sjwa_toggle, lsfon^.cons);
  if b <> lsfon^.cons
  then modified := true;
end;

PROCEDURE LSLEXED_DoKeyLSMdict(LemmaWindow: WINDOWS_Window;
                                          var liCC: LIMORFDEF_ContextConds;
                                          lsfon: LSPHONDEF_pPhonInfo;
                                          RelLine: integer;
                                          var modified: boolean);
const startpos = MaxfieldnameLength+4;

var
  lsCC: LSMORFDEF_ContextConds;
  MenuElements: array[1..3] of STRING_String;
  choice: integer;
begin
(*
  MenuElements[1] := 'Vowel';
  MenuElements[2] := 'Consonant';
  MenuElements[3] := 'None';
  case RelLine of { starting with second line }
    2: begin
         lsCC := Retype(liCC,LSMORFDEF_ContextConds);
         choice := 1;
         MenuChoice(3, MenuElements, Rightside, choice);
         WINDOWS_NewRowColumn(LemmaWindow, WINDOWS_Row(LemmaWindow), startpos);
         case choice of
           0: ;
           1: begin 
                lsCC := CCVowel; 
                WINDOWS_EraseLine(LemmaWindow, 
                                  WINDOWS_Row(LemmaWindow), startpos);
                WINDOWS_WriteString(LemmaWindow, 'Vowel', 0, true);
              end;
           2: begin
                lsCC := CCCons;
                WINDOWS_EraseLine(LemmaWindow, 
                                  WINDOWS_Row(LemmaWindow), startpos);
                WINDOWS_WriteString(LemmaWindow, 'Consonant', 0, true);
              end;
           3: begin
                lsCC := LSCC0;
                WINDOWS_EraseLine(LemmaWindow, 
                                  WINDOWS_Row(LemmaWindow), startpos);
                WINDOWS_WriteString(LemmaWindow, 'None', 0, true);
              end;
         end;
         if liCC <> Retype(lsCC,LIMORFDEF_ContextConds)
         then modified := true;
         liCC := Retype(lsCC,LIMORFDEF_ContextConds);
       end;
    3: MenuChoiceBoolean(LemmaWindow, startpos, lsfon^.cons, modified);
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
  languageSelected := true;
  MenuOptions[1] := 'Dutch';
  MenuOptions[2] := 'Spanish';
  MenuChoice(2, MenuOptions, center, choice);
  case choice of
    0: LanguageSelected := false;
    1: l := dutch;
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

