(*MPI:::===================================================================*
 *
 *  Rosetta Project
 *
 *  Module Title    : LIRECTOSCREEN
 *  Creation date   :  18-FEB-1987
 *  Author          : Joep Rous
 *
 *  Copyright (c) 1986, by Nederlandse Philips Bedrijven BV.
 *
 *  Remarks         : 
 *
 *EMP:::===================================================================*)

Export(LIRECTOSCREEN);
pragma C_include('windows.pf');
pragma C_include('ldconvrec.pf');
pragma C_include('rectoscreen.pf');
pragma C_include('lirectoscreen.pf');

(*=========================================================================*
 *  Imported modules
 *=========================================================================*)


PROGRAM LIRECTOSCREEN;
WITH WINDOWS, LDCONVREC, RECTOSCREEN;

PROCEDURE LIRECTOSCREEN_Write(Dev: WINDOWS_Device;
                                       t  : LDCONVREC_pAttrStruct);

BEGIN

    RECTOSCREEN_Write (t);

END {LIRECTOSCREEN_Write};

