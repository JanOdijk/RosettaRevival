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


PROCEDURE LSPHONDEF_MakePhonInfoRec(gg,ch,kk,th: BOOLEAN;
                                             VAR rec : LSPHONDEF_PhonInfo);
BEGIN
   rec.gg := gg;
   rec.ch := ch;
   rec.kk := kk;
   rec.th := th;
END {LSPHONDEF_MakePhonInfoRec};


PROCEDURE LSPHONDEF_MakeDefPhonInfoRec(VAR rec : LSPHONDEF_PhonInfo);
BEGIN
   rec.gg := FALSE;
   rec.ch := FALSE;
   rec.kk := FALSE;
   rec.th := FALSE;
END {LSPHONDEF_MakeDefPhonInfoRec};


FUNCTION LSPHONDEF_DefaultPhonAttrbs
                            (const str: STRING)
                            : LDCONVREC_pAttrStruct;
VAR
   result, p  : LDCONVREC_pAttrStruct;
BEGIN
   result := NIL;
   Mem_NewDefault(loopholes.SIZEof(LDCONVREC_AttrStruct), loopholes.retype(p,Mem_Ptr));
   p^.fieldname.str := 'th';
   p^.fieldname.len := 2;
   p^.fieldvalue.str := 'FALSE';
   p^.fieldvalue.len := 5;
   p^.SetValue := NIL;
   p^.NextAttr := result;
   result := p;
   Mem_NewDefault(loopholes.SIZEof(LDCONVREC_AttrStruct), loopholes.retype(p,Mem_Ptr));
   p^.fieldname.str := 'kk';
   p^.fieldname.len := 2;
   p^.fieldvalue.str := 'FALSE';
   p^.fieldvalue.len := 5;
   p^.SetValue := NIL;
   p^.NextAttr := result;
   result := p;
   Mem_NewDefault(loopholes.SIZEof(LDCONVREC_AttrStruct), loopholes.retype(p,Mem_Ptr));
   p^.fieldname.str := 'ch';
   p^.fieldname.len := 2;
   p^.fieldvalue.str := 'FALSE';
   p^.fieldvalue.len := 5;
   p^.SetValue := NIL;
   p^.NextAttr := result;
   result := p;
   Mem_NewDefault(loopholes.SIZEof(LDCONVREC_AttrStruct), loopholes.retype(p,Mem_Ptr));
   p^.fieldname.str := 'gg';
   p^.fieldname.len := 2;
   p^.fieldvalue.str := 'FALSE';
   p^.fieldvalue.len := 5;
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
   IF (STR_Compare(p^.fieldname.str, p^.fieldname.len, 'gg', 2) = 0) 
      THEN BEGIN
      IF STR_Compare(p^.fieldvalue.str, p^.fieldvalue.len, 'FALSE', 5) = 0
      THEN BEGIN
         status := TRUE;
         F2.gg := FALSE
      END; 
      IF STR_Compare(p^.fieldvalue.str, p^.fieldvalue.len, 'TRUE', 4) = 0
      THEN BEGIN
         status := TRUE;
         F2.gg := TRUE
      END; 
      END
   ELSE BEGIN
      status := FALSE
   END;

   p := p^.NextAttr; 

   IF status AND
      (STR_Compare(p^.fieldname.str, p^.fieldname.len, 'ch', 2) = 0)
      THEN BEGIN
      status := FALSE;
      IF STR_Compare(p^.fieldvalue.str, p^.fieldvalue.len, 'FALSE', 5) = 0
      THEN BEGIN
         status    := TRUE;
         F2.ch := FALSE
      END; 
      IF STR_Compare(p^.fieldvalue.str, p^.fieldvalue.len, 'TRUE', 4) = 0
      THEN BEGIN
         status    := TRUE;
         F2.ch := TRUE
      END; 
      END
   ELSE BEGIN
      status := FALSE
   END;


   p := p^.NextAttr; 

   IF status AND
      (STR_Compare(p^.fieldname.str, p^.fieldname.len, 'kk', 2) = 0)
      THEN BEGIN
      status := FALSE;
      IF STR_Compare(p^.fieldvalue.str, p^.fieldvalue.len, 'FALSE', 5) = 0
      THEN BEGIN
         status    := TRUE;
         F2.kk := FALSE
      END; 
      IF STR_Compare(p^.fieldvalue.str, p^.fieldvalue.len, 'TRUE', 4) = 0
      THEN BEGIN
         status    := TRUE;
         F2.kk := TRUE
      END; 
      END
   ELSE BEGIN
      status := FALSE
   END;


   p := p^.NextAttr; 

   IF status AND
      (STR_Compare(p^.fieldname.str, p^.fieldname.len, 'th', 2) = 0)
      THEN BEGIN
      status := FALSE;
      IF STR_Compare(p^.fieldvalue.str, p^.fieldvalue.len, 'FALSE', 5) = 0
      THEN BEGIN
         status    := TRUE;
         F2.th := FALSE
      END; 
      IF STR_Compare(p^.fieldvalue.str, p^.fieldvalue.len, 'TRUE', 4) = 0
      THEN BEGIN
         status    := TRUE;
         F2.th := TRUE
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
   Mem_NewDefault(loopholes.SIZEof(LSPHONDEF_PhonInfo), loopholes.retype(f,Mem_Ptr));
   LSPHONDEF_MakeDefPhonInfoRec(f^);
   LSPHONDEF_MakePhonInfo := f
END {LSPHONDEF_MakePhonInfo};


