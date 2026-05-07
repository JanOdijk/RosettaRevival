(*MPD:::===================================================================*
 *
 *  Rosetta Project
 *
 *  Module Title    : TLDCONVREC
 *  Creation date   : 
 *  Author          : R. Leermakers
 *
 *  Copyright (c) 1988, by Nederlandse Philips Bedrijven BV.
 *
 *  Remarks         : 
 *
 *EMP:::===================================================================*)


(*=========================================================================*
 *  Imported modules
 *=========================================================================*)
EXPORT(tldconvrec);
pragma C_include('tldconvrec.pf');
pragma C_include('mem.pf');
pragma C_include('ldconvrec.pf');
pragma C_include('string.pf');
pragma C_include('tstring.pf');


PROGRAM TLDCONVREC;

WITH mem,ldconvrec,strng,tstring;


 FUNCTION TLDCONVREC_CatAttrbs(catstring: TSTRING_string)
                    : TLDCONVREC_pCatAttrStruct;
VAR str1:STRING_string;
    p   : LDCONVREC_pAttrStruct;
    nn,
    n   : TLDCONVREC_pCatAttrStruct;
    stackptr          : Mem_StackPtr;
BEGIN
   TSTRING_converttostring(catstring,str1);
   MEM_MarkDefault(stackptr);
   p:=LDCONVREC_CatAttrbs(str1);
   n := NIL; nn := NIL;
   WHILE p <> NIL DO BEGIN
      NEW(nn);
      TSTRING_Constant(nn^.fieldname, p^.fieldname.str, p^.fieldname.len);
      nn^.nextattr := n; n := nn; p:= p^.nextattr
   END;
   MEM_ReleaseDefault(stackptr); 
   TLDCONVREC_CatAttrbs:=nn;
END;

