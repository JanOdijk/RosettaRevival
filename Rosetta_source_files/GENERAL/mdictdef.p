(*MPI:::===================================================================*
 *
 *  Rosetta Project
 *
 *  Module Title    : MDICTDEF
 *  Creation date   :  10-JUL-1987
 *  Author          : Joep Rous
 *
 *  Copyright (c) 1986, by Nederlandse Philips Bedrijven BV.
 *
 *  Remarks         : 
 *
 *EMP:::===================================================================*)

Export(MDICTDEF);
pragma C_Include('lsphondef.pf');
pragma C_Include('ldconvrec.pf');
pragma C_Include('limorfdef.pf');
pragma C_Include('ldmdict.pf');
pragma C_Include('interface1.pf');
pragma C_Include('mdictdef.pf');

(*=========================================================================*
 *  Imported modules
 *=========================================================================*)


PROGRAM MDICTDEF;
WITH
         LSPHONDEF,
         LDCONVREC,
         LIMORFDEF,
         LDMDICT,
         INTERFACE1;


PROCEDURE MDICTDEF_MakeMDICTrec(
                        stem : LDMDICT_StemType;
                        kind : INTERFACE1_KeyType;
                        CC   : LIMORFDEF_ContextConds;
                        FON  : LSPHONDEF_PhonInfo;
                        where: LDMDICT_WhereType;
                        KEY  : INTEGER;
                        VAR rec: MDICTDEF_RecordDef);

BEGIN
   rec.stem   := stem;
   rec.kind   := kind;
   rec.CC     := CC;
   rec.FON    := FON;
   rec.where  := where;
   rec.KEY    := KEY;

END {MDICTDEF_MakeMDICTrec};


FUNCTION MDICTDEF_LIMakeMDICTrec(
                        stem : LDMDICT_StemType;
                        kind : INTERFACE1_KeyType;
                        CC   : LIMORFDEF_ContextConds;
                        FON  : LDCONVREC_pAttrStruct;
                        where: LDMDICT_WhereType;
                        KEY  : INTEGER;
                        VAR rec: MDICTDEF_RecordDef): BOOLEAN;
VAR 
   F      : LSPHONDEF_PhonInfo;
   status : BOOLEAN;
BEGIN
   rec.stem   := stem;
   rec.kind   := kind;
   rec.CC     := CC;
   rec.where  := where;
   rec.KEY    := KEY;
   status := LSPHONDEF_AttrToRec(FON, F);
   IF status THEN rec.FON    := F;
   MDICTDEF_LIMakeMDictRec := status

END {MDICTDEF_LIMakeMDICTrec};

