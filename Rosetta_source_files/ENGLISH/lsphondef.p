(*MPI:::===================================================================*
 *
 *  Rosetta Project
 *
 *  Module Title    : LSPHONDEF
 *  Creation date   :  10-JUL-1987
 *  Author          : Joep Rous
 *
 *  Copyright (c) 1986, by Nederlandse Philips Bedrijven BV.
 *
 *  Remarks         : 
 *
 *EMP:::===================================================================*)


(*=========================================================================*
 *  Imported modules
 *=========================================================================*)
Export(LSPHONDEF);
pragma C_include('ldconvrec.pf');
pragma C_include('mem.pf');
pragma C_include('str.pf');
pragma C_include('lsphondef.pf');

PROGRAM LSPHONDEF;
WITH LDCONVREC, MEM, STR;


PROCEDURE LSPHONDEF_MakePhonInfoRec(cons: BOOLEAN;
                                             VAR rec : LSPHONDEF_PhonInfo);
BEGIN
   rec.cons := cons;
END {LSPHONDEF_MakePhonInfoRec};


PROCEDURE LSPHONDEF_MakeDefPhonInfoRec(VAR rec : LSPHONDEF_PhonInfo);
BEGIN
   rec.cons := TRUE;
END {LSPHONDEF_MakeDefPhonInfoRec};


FUNCTION LSPHONDEF_DefaultPhonAttrbs
                            (str: PACKED ARRAY[lb1..ub1: INTEGER] OF CHAR)
                            : LDCONVREC_pAttrStruct;
VAR
   result, p  : LDCONVREC_pAttrStruct;
BEGIN
   result := NIL;
   Mem_NewDefault(Loopholes.SizeOf(LDCONVREC_AttrStruct),Loopholes.Retype( p,Mem_Ptr));
   p^.fieldname.str := 'cons';
   p^.fieldname.len := 4;
   IF str[1] IN ['A','E','I','O','U','a','e','i','o','u'] THEN BEGIN
      p^.fieldvalue.str := 'FALSE';
      p^.fieldvalue.len := 5;
      END
   ELSE BEGIN
      p^.fieldvalue.str := 'TRUE';
      p^.fieldvalue.len := 4;
   END;
   p^.SetValue := NIL;
   p^.NextAttr := result;
   result := p;
   LSPHONDEF_DefaultPhonAttrbs := result
   
END {LSPHONDEF_DefaultPhonAttrbs};


FUNCTION LSPHONDEF_AttrToRec(F1: LDCONVREC_pAttrStruct;
                                      VAR F2: LSPHONDEF_PhonInfo): BOOLEAN;
VAR
   p  : LDCONVREC_pAttrStruct;
   status : BOOLEAN;
BEGIN
   p := F1; status := FALSE;
   IF (STR_Compare(p^.fieldname.str, p^.fieldname.len, 'cons', 4) = 0) 
      THEN BEGIN
      IF STR_Compare(p^.fieldvalue.str, p^.fieldvalue.len, 'FALSE', 5) = 0
      THEN BEGIN
         status := TRUE;
         F2.cons := FALSE
      END; 
      IF STR_Compare(p^.fieldvalue.str, p^.fieldvalue.len, 'TRUE', 4) = 0
      THEN BEGIN
         status := TRUE;
         F2.cons := TRUE
      END; 
      END
   ELSE BEGIN
      status := FALSE
   END;


   LSPHONDEF_AttrToRec := status
   
END {LSPHONDEF_AttrToRec};

FUNCTION LSPHONDEF_MakePhonInfo: LSPHONDEF_pPhonInfo;
VAR
   f : LSPHONDEF_pPhonInfo;
BEGIN
   Mem_NewDefault(Loopholes.SizeOf(LSPHONDEF_PhonInfo),Loopholes.Retype( f,Mem_Ptr));
   LSPHONDEF_MakeDefPhonInfoRec(f^);
   LSPHONDEF_MakePhonInfo := f
END {LSPHONDEF_MakePhonInfo};


