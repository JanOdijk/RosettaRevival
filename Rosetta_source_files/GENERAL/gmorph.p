(*MPI:::===================================================================*
 *
 *  Rosetta Project
 *
 *  Module Title    : GMORPH
 *  Creation date   :  26-JAN-1987
 *  Author          : Joep Rous
 *
 *  Copyright (c) 1986, by Nederlandse Philips Bedrijven BV.
 *
 *  Remarks         : 
 *
 *EMP:::===================================================================*)

Export(GMORPH);
pragma C_include('error.pf');
pragma C_include('debug.pf');
pragma C_include('interfaces.pf');
pragma C_include('interface8.pf');
pragma C_include('interface7.pf');
pragma C_include('gsegm.pf');
pragma C_include('glex.pf');
pragma C_include('glextree.pf');
pragma C_include('gmorph.pf');

(*=========================================================================*
 *  Imported modules
 *=========================================================================*)

PROGRAM GMORPH;
WITH ERROR, DEBUG, INTERFACES, INTERFACE8, INTERFACE7, GSEGM, GLEX, 
     GLEXTREE;

FUNCTION GMORPH(interf: INTERFACES_IfDescr): INTERFACES_IfDescr;

VAR
   if1,
   if2  : INTERFACE7_pRowSeqSegmKeys;
   if3  : INTERFACE8_pSeqWords;
   ifout: INTERFACES_IfDescr;

BEGIN

      if1 := GLEXTREE_GLEXTREEplus(interf.if7);
   
      if2 := GLEX_GLEXplus(if1);
       
      if3 := GSEGM_GSEGMENTATION(if2);

      ifout.level := 8;
      ifout.if8   := if3;

      GMORPH      := ifout;

END {GMORPH};

