(*MPI:::===================================================================*
 *
 *  Rosetta Project
 *
 *  Module Title    : INTERFACE8
 *  Creation date   :  28-JAN-1987
 *  Author          : 
 *
 *  Copyright (c) 1986, by Nederlandse Philips Bedrijven BV.
 *
 *  Remarks         : 
 *
 *EMP:::===================================================================*)

Export(INTERFACE8);
pragma C_Include('mem.pf');
pragma C_Include('limorfdef.pf');
pragma C_Include('string.pf');
pragma C_Include('interface8.pf');

(*=========================================================================*
 *  Imported modules
 *=========================================================================*)


PROGRAM INTERFACE8;
WITH LIMORFDEF, STRNG, MEM;

FUNCTION INTERFACE8_MakeSeqWords(w : STRING_String;
                                          n : INTERFACE8_pSeqWords): 
                                          INTERFACE8_pSeqWords;
VAR 
   r: INTERFACE8_pSeqWords;
BEGIN   
   Mem_NewDefault(Loopholes.SIZEof(INTERFACE8_SeqWords), 
                  Loopholes.Retype(r,Mem_Ptr));
   WITH r^ DO BEGIN
      marker:= FALSE;
      error := FALSE;
      prv   := nil;
      nxt   := nil;
      wordid:= -1;
      nxtamb:= n;
      word  := w;
      CC    := LICC0;
      f     := NIL;
      nonsucc := [];
      ambid   := 0;
   END;
   INTERFACE8_MakeSeqWords := r
END;




