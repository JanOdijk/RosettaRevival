(*MPM:::===================================================================*
 *
 *  Rosetta Project                                                 
 *                                                                  
 *  Module Title    : LDLEXCONVERT
 *  Creation date   : 12 MARCH 1991
 *  Author          : Frank Uittenbogaard                                  
 *                                                                  
 *  Copyright (c) 1990, by Nederlandse Philips Bedrijven BV.        
 *                                                                  
 *  Remarks         : Language specific routines for lexicon conversions
 *
 *EMP:::===================================================================*)

EXPORT(LDLEXCONVERT);
pragma C_Include('mdictdef.pf');
pragma C_Include('limorfdef.pf');
pragma C_Include('lsmorfdef.pf');
pragma C_Include('files.pf');
pragma C_Include('string.pf');
pragma C_Include('ldlexconvert.pf');

(*=========================================================================*
 *  Imported modules
 *=========================================================================*)

PROGRAM LDLEXCONVERT;
WITH MDICTDEF,
     LSMORFDEF,
     LIMORFDEF,
     FILES,
     STRNG;

 procedure LDLEXCONVERT_CCToText(VAR textfile: FILES_Text;
                                         MdictRec: MDICTDEF_RecordDef);
var
  lsCC: LSMORFDEF_ContextConds;
begin
  lsCC := Loopholes.Retype(MdictRec.CC,LSMORFDEF_ContextConds);
  case lsCC of
    CCVowel  : FILES_WriteChar(textfile, 'V'); { Vowel }
    CCCons   : FILES_WriteChar(textfile, 'C'); { Consonant }
    otherwise  FILES_WriteChar(textfile, 'N'); { None }
  end;
end;

 procedure LDLEXCONVERT_TextToCC(
                           const buffer: STRING;
                           var pos: integer;
                           var MdictRec: MDICTDEF_RecordDef);
var
  lsCC: LSMORFDEF_ContextConds;
begin
  with MdictRec do
  begin
    case buffer[pos] of
      'V': lsCC := CCVowel;
      'C': lsCC := CCCons;
      'N': lsCC := LSCC0;
    end;
    pos := pos+1;
    CC := Loopholes.Retype(lsCC,LIMORFDEF_ContextConds);
  end;
end;

 procedure LDLEXCONVERT_PhonToText(VAR textfile: FILES_Text;
                                           MdictRec: MDICTDEF_RecordDef);
begin
  with MdictRec.FON do
  begin
    if cons
    then FILES_WriteChar(textfile, 'T')
    else FILES_WriteChar(textfile, 'F');
  end;
end;

 procedure LDLEXCONVERT_TextToPhon(
                           const buffer: STRING;
                           var pos: integer;
                           var MdictRec: MDICTDEF_RecordDef);
begin
  with MdictRec.FON do
  begin
    case buffer[pos] of
      'T': cons := true;
      'F': cons := false;
    end;
    pos := pos+1;
  end;
end;


