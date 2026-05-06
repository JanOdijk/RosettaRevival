(*MPD:::===================================================================*
 *
 *  Rosetta Project
 *
 *  Module Title    : LDUNIQUERELS
 *  Creation date   :  26-JAN-1987
 *  Author          : rene leermakers
 *
 *  Copyright (c) 1986, by Nederlandse Philips Bedrijven BV.
 *
 *  Remarks         : 
 *
 *EMP:::===================================================================*)



(*=========================================================================*
 *  Imported modules
 *=========================================================================*)
EXPORT(LDUNIQUERELS);
pragma C_include('lidomaint.pf');
pragma C_include('lsdomaint.pf');
pragma C_include('lduniquerels.pf');
pragma C_include('lsauxdom.pf');


PROGRAM LDUNIQUERELS;
WITH lidomaint,lsdomaint,lsauxdom;

FUNCTION LDUNIQUERELS_body(rel:LIDOMAINT_synrel)
                    :BOOLEAN;
BEGIN 
IF loopholes.retype(rel,LSDOMAINT_synrel) IN LSAUXDOM_uniquerels THEN 
       LDUNIQUERELS_body:=TRUE
ELSE LDUNIQUERELS_body:=FALSE
END;

