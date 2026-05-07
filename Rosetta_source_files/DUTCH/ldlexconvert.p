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
pragma C_Include('files.pf');
pragma C_Include('string.pf');
pragma C_Include('ldlexconvert.pf');

(*=========================================================================*
 *  Imported modules
 *=========================================================================*)

PROGRAM LDLEXCONVERT;
WITH MDICTDEF,
     LIMORFDEF,
     FILES,
     STRNG;

procedure LDLEXCONVERT_CCToText(VAR textfile: FILES_Text;
                                         MdictRec: MDICTDEF_RecordDef);
begin
end;

procedure LDLEXCONVERT_TextToCC(
                           const buffer: STRING;
                           var pos: integer;
                           var MdictRec: MDICTDEF_RecordDef);
begin
  MdictRec.CC := LICC0;
end;

procedure LDLEXCONVERT_PhonToText(VAR textfile: FILES_Text;
                                           MdictRec: MDICTDEF_RecordDef);
begin
  with MdictRec.FON do
  begin
    if sjwa 
    then FILES_WriteChar(textfile, 'T')
    else FILES_WriteChar(textfile, 'F');
    if wissel
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
      'T': sjwa := true;
      'F': sjwa := false;
    end;
    pos := pos+1;
    case buffer[pos] of
      'T': wissel := true;
      'F': wissel := false;
    end;
    pos := pos+1;
  end;
end;


