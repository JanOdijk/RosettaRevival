(*MPI:::===================================================================*
 *
 *  Rosetta Project
 *
 *  Module Title    : INTERFACE1
 *  Creation date   :  28-JAN-1987
 *  Author          : Joep Rous
 *
 *  Copyright (c) 1986, by Nederlandse Philips Bedrijven BV.
 *
 *  Remarks         : 
 *
 *EMP:::===================================================================*)

Export(INTERFACE1);
pragma C_Include('mem.pf');
pragma C_Include('limorfdef.pf');
pragma C_Include('interface1.pf');

(*=========================================================================*
 *  Imported modules
 *=========================================================================*)


PROGRAM INTERFACE1;
WITH MEM, LIMORFDEF;

FUNCTION INTERFACE1_MakeSeqSegmStree(n : INTERFACE1_pSeqSegmKeys): 
                                         INTERFACE1_pSeqSegmKeys;

VAR r : INTERFACE1_pSeqSegmKeys;

BEGIN
   Mem_NewDefault(Loopholes.SIZEof(INTERFACE1_SeqSegmKeys),
                  Loopholes.Retype(r,Mem_Ptr));
   WITH r^ DO BEGIN
      nxtamb  := n;
      rn      := nil;
      prvseg  := nil;
      nxtseg  := nil;
      segkind := streeseg;
      stree   := nil;
      robustmode := FALSE;
   END;
   INTERFACE1_MakeSeqSegmStree := r
END {INTERFACE1_MakeSeqSegmStree};


FUNCTION INTERFACE1_makeWRowSeqSegm(n : INTERFACE1_pRowSeqSegmKeys):
                                        INTERFACE1_pRowSeqSegmKeys;
VAR r : INTERFACE1_pRowSeqSegmKeys;

BEGIN
   Mem_NewDefault(Loopholes.SIZEof(INTERFACE1_RowSeqSegmKeys), 
                  LoopHoles.Retype(r,Mem_Ptr));
   WITH r^ DO BEGIN
      error  := FALSE;
      X      := 0;
      Y      := 0;
      len    := 0;
      nxtamb := n;
      nrstems:= 0;
      kind   := worddel;
      prv    := nil;
      nxt    := nil;
      fseq   := nil;
      lseq   := nil;
      f      := nil;
      CC     := LICC0;
      nonsucc:= [];
      rn     := nil;
      ambid  := 0;
      idnr   := -1;
      MinErrors := MaxInt;
      BestMinErrorsInChain := NIL;
   END;
   INTERFACE1_makeWRowSeqSegm := r
END {INTERFACE1_makeWRowSeqSegm};


FUNCTION INTERFACE1_makeSRowSeqSegm(n : INTERFACE1_pRowSeqSegmKeys):
                                        INTERFACE1_pRowSeqSegmKeys;
VAR r : INTERFACE1_pRowSeqSegmKeys;

BEGIN
   Mem_NewDefault(Loopholes.SIZEof(INTERFACE1_RowSeqSegmKeys),
                  Loopholes.Retype(r,Mem_Ptr));
   WITH r^ DO BEGIN
      error  := FALSE;
      X      := 0;
      Y      := 0;
      len    := 0;
      nxtamb := n;
      kind   := segdel;
      fseq   := nil;
      lseq   := nil;
      prv    := nil;
      nxt    := nil;
      f      := nil;
      CC     := LICC0;
      nonsucc:= [];
      rn     := nil;
      ambid  := 0;
      idnr   := -1;
      MinErrors := MaxInt;
      BestMinErrorsInChain := NIL;
   END;
   INTERFACE1_makeSRowSeqSegm := r
END {INTERFACE1_makeSRowSeqSegm};


