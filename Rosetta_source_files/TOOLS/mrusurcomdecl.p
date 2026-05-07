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
EXPORT(mrusurcomdecl);
pragma C_include('mrusurcomdecl.pf');

PROGRAM mrusurcomdecl;
var
   newtopvar:psinglesegmentlist;
   statusvar:boolean;
   debugvar:boolean;
   surfgraphvar:array[1..maxrnr] of psurfgraph;
   absentvar:psurfgraph;
   counter:integer;

function newtop:psinglesegmentlist;
begin
newtop:=newtopvar
end;
procedure assignnewtop(valeu:psinglesegmentlist);
begin
newtopvar:=valeu
end;
function status:boolean;
begin
status:=statusvar
end;
procedure assignstatus(valeu:boolean);
begin
statusvar:=valeu
end;
function debug:boolean;
begin
debug:=debugvar;
end;
procedure assigndebug(valeu:boolean);
begin
debugvar:=valeu
end;
function surfgraph(i:integer):psurfgraph;
begin
surfgraph:=surfgraphvar[i]
end;
procedure assignsurfgraph(i:integer;valeu:psurfgraph);
begin
surfgraphvar[i]:=valeu
end;
function absent:psurfgraph;
begin
absent:=absentvar
end;
procedure assignabsent(valeu:psurfgraph);
begin
absentvar:=valeu
end;

 PROCEDURE initcounter;
BEGIN {initcounter}
    counter:=0
END {initcounter};

 PROCEDURE addcounter;
BEGIN {addcounter}
    counter:=counter+1
END {addcounter};

 FUNCTION linecounter
                  :integer ;
BEGIN {linecounter}
   linecounter:=counter
END {linecounter};

