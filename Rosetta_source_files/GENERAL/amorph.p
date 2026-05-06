(*MPI:::===================================================================*
 *
 *  Rosetta Project
 *
 *  Module Title    : AMORPH
 *  Creation date   :  26-JAN-1987
 *  Author          : Joep Rous
 *
 *  Copyright (c) 1986, by Nederlandse Philips Bedrijven BV.
 *
 *  Remarks         : 
 *
 *EMP:::===================================================================*)

Export(AMORPH);
pragma C_include('error.pf');
pragma C_include('log.pf');
pragma C_include('debug.pf');
pragma C_include('interfaces.pf');
pragma C_include('interface0.pf');
pragma C_include('interface1.pf');
pragma C_include('alayout.pf');
pragma C_include('asegm.pf');
pragma C_include('alex.pf');
pragma C_include('alextree.pf');
pragma C_include('wnd.pf');
pragma C_include('amorph.pf');


(*=========================================================================*
 *  Imported modules
 *=========================================================================*)

PROGRAM AMORPH;
WITH ERROR, LOG, DEBUG, INTERFACES, INTERFACE0, INTERFACE1, ALAYOUT,
     ASEGM, ALEX, ALEXTREE, WND;

FUNCTION CLOCK: INTEGER;
BEGIN CLOCK := 0 END;

FUNCTION AMORPH(interf: INTERFACES_IfDescr; var error : Boolean): INTERFACES_IfDescr;

VAR
   if1,
   if2,
   if3  : INTERFACE1_pRowSeqSegmKeys;
   ifout: INTERFACES_IfDescr;
   t1, t2, t3, t4 : INTEGER;

BEGIN
     t1  := CLOCK;
     if1 := ASEGM_ASEGMENTATION(interf.if0);
     t2  := CLOCK;   
     if2 := ALEX_ALEXplus(if1);
     t3  := CLOCK;       
     interf.if0 := NIL;
     if3 := ALEXTREE_ALEXTREEplus(if2, interf.if0);
     t4 := CLOCK;
     LOG_Write('Segmentation :', 14, t2-t1); 
     LOG_Write('Lexicons     :', 14, t3-t2); 
     LOG_Write('W-Parser     :', 14, t4-t3); 
     IF interf.if0 = NIL THEN BEGIN
           error := FALSE;
           ifout.level := 1;
           ifout.if1   := if3;
           AMORPH      := ifout;
     END
     ELSE BEGIN
	   error := TRUE;
           ALAYOUT_MarkWrongos(interf);
           ERROR_Write(ERROR_ALextree);
           AMORPH := interf;
     END

END {AMORPH};
