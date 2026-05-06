(*MPD:::===================================================================*
 *
 *  Rosetta Project
 *
 *  Module Title    : LDMEASURESIZE
 *  Creation date   :  6-JAN-1987
 *  Author          : Joep Rous
 *
 *  Copyright (c) 1986, by Nederlandse Philips Bedrijven BV.
 *
 *  Remarks         : 
 *
 *EMP:::===================================================================*)
EXPORT(ldmeasuresize);
pragma C_include('lsdomaint.pf');
pragma C_include('ldmeasuresize.pf');

(*=========================================================================*
 *  Imported modules
 *=========================================================================*)



PROGRAM LDMEASURESIZE;
WITH LSDOMAINT;

(*MPT:::===================================================================*
 *
 *  Type name      : LDMEASURESIZE_body
 *  Description    : 
 *
 *EMP:::===================================================================*)

FUNCTION LDMEASURESIZE_body:INTEGER;
BEGIN
LDMEASURESIZE_body:=Loopholes.SIZEof(LSDOMAINT_lsrecord)
END;

