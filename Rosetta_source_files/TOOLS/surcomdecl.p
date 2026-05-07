(*MPM:::===================================================================*
 *
 *  Rosetta Project                                                 
 *                                                                  
 *  Module Title    : lexdeclimp 
 *  Creation date   :                                               
 *  Author          :                                               
 *                                                                  
 *  Copyright (c) 1985, by Nederlandse Philips Bedrijven BV.        
 *                                                                  
 *  Remarks         :  
 *
 *EMP:::===================================================================*)

(*=========================================================================*
 *  Imported modules
 *=========================================================================*)
EXPORT(surcomdecl);
pragma C_include('surcomdecl.pf');
PROGRAM surcomdecl;
var
   newtopvar:SURCOMDECL_psinglesegmentlist;
   statusvar:BOOLEAN;
   debugvar:BOOLEAN;
   surfgraphvar:array[1..SURCOMDECL_maxrnr] of SURCOMDECL_psurfgraph;
   absentvar:SURCOMDECL_psurfgraph;
   counter:INTEGER;

function SURCOMDECL_newtop:SURCOMDECL_psinglesegmentlist;
begin
SURCOMDECL_newtop:=newtopvar
end;
procedure SURCOMDECL_assignnewtop(valeu:SURCOMDECL_psinglesegmentlist);
begin
newtopvar:=valeu
end;
function SURCOMDECL_status:BOOLEAN;
begin
SURCOMDECL_status:=statusvar
end;
procedure SURCOMDECL_assignstatus(valeu:BOOLEAN);
begin
statusvar:=valeu
end;
function SURCOMDECL_debug:BOOLEAN;
begin
SURCOMDECL_debug:=debugvar
end;
procedure SURCOMDECL_assigndebug(valeu:BOOLEAN);
begin
debugvar:=valeu
end;
function SURCOMDECL_surfgraph(i:INTEGER):SURCOMDECL_psurfgraph;
begin
SURCOMDECL_surfgraph:=surfgraphvar[i]
end;
procedure SURCOMDECL_assignsurfgraph(i:INTEGER;valeu:SURCOMDECL_psurfgraph);
begin
surfgraphvar[i]:=valeu
end;
function SURCOMDECL_absent:SURCOMDECL_psurfgraph;
begin
SURCOMDECL_absent:=absentvar
end;
procedure SURCOMDECL_assignabsent(valeu:SURCOMDECL_psurfgraph);
begin
absentvar:=valeu
end;

PROCEDURE SURCOMDECL_initcounter;
BEGIN {initcounter}
    counter:=0
END {initcounter};

PROCEDURE SURCOMDECL_addcounter;
BEGIN {addcounter}
    counter:=counter+1
END {addcounter};

FUNCTION SURCOMDECL_linecounter
                  :INTEGER ;
BEGIN {linecounter}
   SURCOMDECL_linecounter:=counter
END {linecounter};


