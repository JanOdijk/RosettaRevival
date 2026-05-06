(*MPI:::===================================================================*
 *
 *  Rosetta Project
 *
 *  Module Title    : LDGLUELEX
 *  Creation date   :  6-JAN-1987
 *  Author          : Joep Rous
 *
 *  Copyright (c) 1986, by Nederlandse Philips Bedrijven BV.
 *
 *  Remarks         : This is an "LD"-type module, so the implementation
 *                    part of this module can be found in the different
 *                    language directories.
 *
 *EMP:::===================================================================*)

Export(LDGLUELEX);
pragma C_include('listree.pf');
pragma C_include('lidomaint.pf');
pragma C_include('maket.pf');
pragma C_include('lsdomaint.pf');
pragma C_include('lsstree.pf');
pragma C_include('ldgluelex.pf');

(*=========================================================================*
 *  Imported modules
 *=========================================================================*)


PROGRAM LDGLUELEX;
WITH LISTREE, LIDOMAINT, MAKET, LSDOMAINT, LSSTREE;

FUNCTION LDGLUELEX_Glue: LISTREE_pStree;
VAR
   t : LSSTREE_pStree;
BEGIN
   t := MAKET_Stree(GLUE);
 
   LDGLUELEX_Glue := LoopHoles.Retype(t,LISTREE_pStree)
END {LDGLUELEX};


FUNCTION LDGLUELEX_GlueCat(c:LIDOMAINT_syntcat): BOOLEAN;
BEGIN
   LDGLUELEX_GlueCat := LoopHoles.Retype(c,LSDOMAINT_syntcat) = GLUE
END {LDGLUELEX_GlueCat};

