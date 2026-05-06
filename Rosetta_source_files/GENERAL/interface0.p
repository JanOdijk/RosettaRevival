(*MPI:::===================================================================*
 *
 *  Rosetta Project
 *
 *  Module Title    : INTERFACE0
 *  Creation date   :  28-JAN-1987
 *  Author          : 
 *
 *  Copyright (c) 1986, by Nederlandse Philips Bedrijven BV.
 *
 *  Remarks         : 
 *
 *EMP:::===================================================================*)

Export(INTERFACE0);
pragma C_Include('mem.pf');
pragma C_Include('limorfdef.pf');
pragma C_Include('string.pf');
pragma C_Include('interface0.pf');

(*=========================================================================*
 *  Imported modules
 *=========================================================================*)


PROGRAM INTERFACE0;
WITH MEM, LIMORFDEF, STRNG;

FUNCTION INTERFACE0_MakeSeqWords(w : STRING_String;
                                          n : INTERFACE0_pSeqWords): 
                                          INTERFACE0_pSeqWords;
VAR 
   r: INTERFACE0_pSeqWords;
BEGIN   
   Mem_NewDefault(Loopholes.SIZEof(INTERFACE0_SeqWords), 
                  Loopholes.Retype(r,Mem_Ptr));
   WITH r^ DO BEGIN
      error := FALSE;
      kind  := LayoutWord;
      X     := 0;
      Y     := 0;
      len   := 0;
      prv   := nil;
      nxt   := nil;
      result:= nil;
      wordid:= -1;
      nxtamb:= n;
      word  := w;
{
      CC    := LICC0;
      f     := NIL;
      nonsucc := [];
      ambid   := 0;
}
   END;
   INTERFACE0_MakeSeqWords := r
END;



