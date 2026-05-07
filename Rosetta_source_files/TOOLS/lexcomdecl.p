
(*MPM:::===================================================================*
 *
 *  Rosetta Project                                                 
 *                                                                  
 *  Module Title    : lexdeclimp 
 *  Creation date   : june 1986
 *  Author          : rene leermakers                                     
 *                                                                  
 *  Copyright (c) 1985, by Nederlandse Philips Bedrijven BV.        
 *                                                                  
 *  Remarks         :  
 *
 *EMP:::===================================================================*)

EXPORT(LEXCOMDECL);
pragma C_include('lexcomdecl.pf');

(*=========================================================================*
 *  Imported modules
 *=========================================================================*)

PROGRAM lexcomdecl;

VAR
   newtopvar:LEXCOMDECL_psinglesegmentlist;
   statusvar:BOOLEAN;
   debugvar:BOOLEAN;
   surfgraphvar: ARRAY[1..LEXCOMDECL_maxrnr] OF LEXCOMDECL_psurfgraph;
   absentvar: LEXCOMDECL_psurfgraph;
   counter:INTEGER;

FUNCTION LEXCOMDECL_newtop:LEXCOMDECL_psinglesegmentlist;
BEGIN
LEXCOMDECL_newtop:=newtopvar
END;
PROCEDURE LEXCOMDECL_assignnewtop(valeu:LEXCOMDECL_psinglesegmentlist);
BEGIN
newtopvar:=valeu
END;
FUNCTION LEXCOMDECL_status:BOOLEAN;
BEGIN
LEXCOMDECL_status:=statusvar
END;
PROCEDURE LEXCOMDECL_assignstatus(valeu:BOOLEAN);
BEGIN
statusvar:=valeu
END;
FUNCTION LEXCOMDECL_debug:BOOLEAN;
BEGIN
LEXCOMDECL_debug:=debugvar
END;
PROCEDURE LEXCOMDECL_assigndebug(valeu:BOOLEAN);
BEGIN
debugvar:=valeu
END;
FUNCTION LEXCOMDECL_surfgraph(i:INTEGER):LEXCOMDECL_psurfgraph;
BEGIN
LEXCOMDECL_surfgraph:=surfgraphvar[i]
END;
PROCEDURE LEXCOMDECL_assignsurfgraph(i:INTEGER;valeu:LEXCOMDECL_psurfgraph);
BEGIN
surfgraphvar[i]:=valeu
END;
FUNCTION LEXCOMDECL_absent:LEXCOMDECL_psurfgraph;
BEGIN
LEXCOMDECL_absent:=absentvar
END;
PROCEDURE LEXCOMDECL_assignabsent(valeu:LEXCOMDECL_psurfgraph);
BEGIN
absentvar:=valeu
END;

 PROCEDURE LEXCOMDECL_initcounter;
BEGIN {initcounter}
    counter:=0
END {initcounter};

 PROCEDURE LEXCOMDECL_addcounter;
BEGIN {addcounter}
    counter:=counter+1
END {addcounter};

 FUNCTION LEXCOMDECL_linecounter
                  :INTEGER ;
BEGIN {linecounter}
   LEXCOMDECL_linecounter:=counter
END {linecounter};



