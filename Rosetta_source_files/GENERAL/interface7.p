(*MPI:::===================================================================*
 *
 *  Rosetta Project
 *
 *  Module Title    : INTERFACE7
 *  Creation date   :  28-JAN-1987
 *  Author          : Joep Rous
 *
 *  Copyright (c) 1986, by Nederlandse Philips Bedrijven BV.
 *
 *  Remarks         : 
 *
 *EMP:::===================================================================*)

Export(INTERFACE7);
pragma C_Include('mem.pf');
pragma C_Include('interface1.pf');
pragma C_Include('interface7.pf');

(*=========================================================================*
 *  Imported modules
 *=========================================================================*)

PROGRAM INTERFACE7;
WITH MEM, INTERFACE1;

FUNCTION INTERFACE7_MakeSeqSegmStree(n : INTERFACE7_pSeqSegmKeys): 
                                              INTERFACE7_pSeqSegmKeys;

VAR r : INTERFACE7_pSeqSegmKeys;

BEGIN
   Mem_NewDefault(Loopholes.SIZEof(INTERFACE7_SeqSegmKeys), 
                  Loopholes.Retype(r,Mem_Ptr));
   WITH r^ DO BEGIN
      nxtamb  := n;
      rn      := nil;
      prvseg  := nil;
      nxtseg  := nil;
      segkind := streeseg;
      stree   := nil;
   END;
   INTERFACE7_MakeSeqSegmStree := r
END {INTERFACE7_MakeSeqSegmStree};


FUNCTION INTERFACE7_MakeSeqSegmKey(n : INTERFACE7_pSeqSegmKeys): 
                                              INTERFACE7_pSeqSegmKeys;

VAR r : INTERFACE7_pSeqSegmKeys;

BEGIN
   Mem_NewDefault(Loopholes.SIZEof(INTERFACE7_SeqSegmKeys),
                  Loopholes.Retype(r,Mem_Ptr));
   WITH r^ DO BEGIN
      nxtamb  := n;
      rn      := nil;
      prvseg  := nil;
      nxtseg  := nil;
      segkind := keyseg;
   END;
   INTERFACE7_MakeSeqSegmKey := r
END {INTERFACE7_MakeSeqSegmKey};


FUNCTION INTERFACE7_makeWRowSeqSegm(n : INTERFACE7_pRowSeqSegmKeys):
                                        INTERFACE7_pRowSeqSegmKeys;
VAR r : INTERFACE7_pRowSeqSegmKeys;

BEGIN
   Mem_NewDefault(Loopholes.SIZEof(INTERFACE7_RowSeqSegmKeys),
                  Loopholes.Retype(r,Mem_Ptr));
   WITH r^ DO BEGIN
      nxtamb := n;
      kind   := OriginalWord;
      prv    := nil;
      nxt    := nil;
      fseq   := nil;
      lseq   := nil;
      rn     := nil;
      idnr   := -1;
      result := nil;
   END;
   INTERFACE7_makeWRowSeqSegm := r
END {INTERFACE7_makeWRowSeqSegm};


FUNCTION INTERFACE7_makeSRowSeqSegm(n : INTERFACE7_pRowSeqSegmKeys):
                                        INTERFACE7_pRowSeqSegmKeys;
VAR r : INTERFACE7_pRowSeqSegmKeys;

BEGIN
   Mem_NewDefault(Loopholes.SIZEof(INTERFACE7_RowSeqSegmKeys),
                  Loopholes.Retype(r,Mem_Ptr));
   WITH r^ DO BEGIN
      nxtamb := n;
      kind   := MorphWord;
      fseq   := nil;
      lseq   := nil;
      prv    := nil;
      nxt    := nil;
      rn     := nil;
      idnr   := -1;
      result := nil;
   END;
   INTERFACE7_makeSRowSeqSegm := r
END {INTERFACE7_makeSRowSeqSegm};


