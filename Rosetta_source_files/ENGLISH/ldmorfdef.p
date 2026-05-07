(*MPI:::===================================================================*
 *
 *  Rosetta Project
 *
 *  Module Title    : LDMORFDEF
 *  Creation date   :  28-NOV-1986
 *  Author          : Joep Rous
 *
 *  Copyright (c) 1986, by Nederlandse Philips Bedrijven BV.
 *
 *  Remarks         : In this module the LS context conditions, phonetical
 *                    conditions and layout rules have been implemented.
 *                    The module is only used during morphology.
 *
 *EMP:::===================================================================*)


(*=========================================================================*
 *  Imported modules
 *=========================================================================*)

Export(LDMORFDEF);
pragma C_include('limorfdef.pf');
pragma C_include('lsphondef.pf');
pragma C_include('interface0.pf');
pragma C_include('asegm.pf');
pragma C_include('string.pf');
pragma C_include('lsmorfdef.pf');
pragma C_include('ldmorfdef.pf');

PROGRAM LDMORFDEF;
WITH LIMORFDEF, LSPHONDEF, LSMORFDEF, INTERFACE0, ASEGM, STRNG;


FUNCTION LDMORFDEF_CCSwitch( CC: LIMORFDEF_ContextConds;
                                      f : LIMORFDEF_pPhonInfo): BOOLEAN;
VAR
   p : LSPHONDEF_pPhonInfo;
BEGIN
   p := LoopHoles.Retype(f,LSPHONDEF_pPhonInfo);
   LDMORFDEF_CCSwitch := TRUE;
   CASE LoopHoles.Retype(CC,LSMORFDEF_ContextConds) OF
      LSCC0 : LDMORFDEF_CCSwitch := TRUE;
      CCcons : BEGIN
                  IF p <> NIL THEN
                     LDMORFDEF_CCSwitch := p^.cons
               END;
      CCvowel : BEGIN
                  IF p <> NIL THEN
                     LDMORFDEF_CCSwitch := NOT p^.cons
               END;
   END
END {LDMORFDEF_CCSwitch};



FUNCTION LDMORFDEF_FonSwitch( FON: LIMORFDEF_PhonMarker;
                                       fonin  : LIMORFDEF_pPhonInfo): 
                                       LIMORFDEF_pPhonInfo;
BEGIN
   LDMORFDEF_FonSwitch := fonin
END {LDMORFDEF_FonSwitch};


FUNCTION LDMORFDEF_AWlayoutSwitch( w: STRING_String;
                                            f,
                                            l: BOOLEAN;
                                            m: ASEGM_LayoutRuleMode): 
                                            INTERFACE0_pSeqWords;
   FUNCTION LAY1: INTERFACE0_pSeqWords;
   VAR
      nw     : STRING_String;
      result : INTERFACE0_pSeqWords;
   BEGIN
      LAY1 := nil;
      IF f THEN BEGIN
         STRING_LowerCaseChar(nw, w, 1);
         IF NOT ( nw = w ) THEN BEGIN
            result := INTERFACE0_MakeSeqWords(nw, nil);
            result^.nxt := result;
            result^.prv := result;
            LAY1        := result
         END
      END
   END;


   FUNCTION LAY2: INTERFACE0_pSeqWords;
   VAR
      length : STRING_Range;
      ch     : CHAR;
      nw     : STRING_String;
      result : INTERFACE0_pSeqWords;
   BEGIN
      LAY2   := nil;
      length := STRING_Length(w);
      IF length > 1 THEN BEGIN
         STRING_ExtractChar(ch, w, length);
         IF (( ch in ['.', '!', '?'] ) and l ) or
             ( ch in [',', ';', ':'] ) THEN BEGIN
            STRING_ExtractBegin(nw, w, length-1); 
            result      := INTERFACE0_MakeSeqWords(nw, nil);
            STRING_ConstantChar(nw, ch);
            result^.nxt := INTERFACE0_MakeSeqWords(nw, nil);
            result^.nxt^.prv := result;
            result^.prv := result^.nxt;
            result^.prv^.nxt := result;
            LAY2 := result
         END
      END
   END;

BEGIN
   CASE m OF
   nosplitmode : LDMORFDEF_AWlayoutSwitch := LAY1;
   splitmode   : LDMORFDEF_AWlayoutSwitch := LAY2
   END;
END {LDMORFDEF_AWlayoutSwitch};


PROCEDURE LDMORFDEF_GWlayoutSwitch( VAR w: STRING_String;
                                             VAR f: BOOLEAN;
                                             l: BOOLEAN);
   PROCEDURE LAY1(VAR nw: STRING_String);
   BEGIN
      STRING_UpperCaseChar(nw, nw, 1);
      f := FALSE
   END;


BEGIN
   IF f THEN LAY1(w);
END {LDMORFDEF_GWlayoutSwitch};

