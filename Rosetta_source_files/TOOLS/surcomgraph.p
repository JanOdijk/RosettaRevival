(*MPM:::===================================================================*
 *
 *  Rosetta Project                                                 
 *                                                                  
 *  Module Title    : graph
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
EXPORT(surcomgraph);
pragma C_include('surcomdecl.pf');
pragma C_include('surcomgraph.pf');

PROGRAM surcomgraph;
WITH surcomdecl;
function makecat(a: SURCOMDECL_syntcat): SURCOMDECL_psyntcat;
var i: INTEGER;
    b: SURCOMDECL_psyntcat;
begin
                 new(b);
                 b^:=a;
                 makecat:=b
end;{makecat}
 
 
function makesurfgraph(a,b: SURCOMDECL_psurfgraphnode): SURCOMDECL_psurfgraph;
var i: INTEGER;
    p: SURCOMDECL_psurfgraph;
begin
                 new(p);
                 p^.first:=a; p^.last:=b;
                 makesurfgraph:=p
end;{makesurfgraph}
 
 
function makesurfgraphnode(a: SURCOMDECL_psyntcat; b,c: SURCOMDECL_psurfgraphnode;
                           d: SURCOMDECL_nodeid): SURCOMDECL_psurfgraphnode;
var i: INTEGER;
    p: SURCOMDECL_psurfgraphnode;
begin
                 new(p);
                 p^.cat:=a; p^.right:=b; p^.left:=c; p^.n:=d;
                 makesurfgraphnode:=p
end;{makesurfgraphnode}
 
 
function makelonodeid(a: SURCOMDECL_nodeid; b: SURCOMDECL_plonodeid): SURCOMDECL_plonodeid;
var p: SURCOMDECL_plonodeid;
begin
                 new(p);
                 p^.next:=b; p^.arg:=a;
                 makelonodeid:=p
end;{makelonodeid}
 
 
    (* the functions atom, alt, conc, opt and star to build the
     syntaxgraphs *)
 
function atom (a: SURCOMDECL_syntcat; b: SURCOMDECL_nodeid): SURCOMDECL_psurfgraph;
var p,q : SURCOMDECL_psurfgraphnode;
 
begin
           p:=makesurfgraphnode(nil,nil,nil,SURCOMDECL_Hdum);
	   p^.alreadysearched:=false;
           q:=makesurfgraphnode(makecat(a),p,nil,b);
	   q^.alreadysearched:=false;
           atom:=makesurfgraph(q,p)
end;
 
 
function alt(a,b: SURCOMDECL_psurfgraph): SURCOMDECL_psurfgraph;
var p,q : SURCOMDECL_psurfgraphnode;
 
begin
      if a = SURCOMDECL_absent
      then alt:=b
      else if b = SURCOMDECL_absent
           then alt:=a
           else begin
                p:=makesurfgraphnode(nil,nil,nil,SURCOMDECL_Hdum);
	 	p^.alreadysearched:=false;
                a^.last^.left:=p; b^.last^.right:=p;
                q:=makesurfgraphnode(nil,a^.first,b^.first,SURCOMDECL_Hdum);
		q^.alreadysearched:=false;
                alt:=makesurfgraph(q,p)
                end
end;
 
 
 
function conc(a,b: SURCOMDECL_psurfgraph): SURCOMDECL_psurfgraph;
 
begin 
      if (a = SURCOMDECL_absent) or (b = SURCOMDECL_absent)
      then conc:=SURCOMDECL_absent
      else begin
           a^.last^.left:=b^.first;
           conc:=makesurfgraph(a^.first,b^.last)
           end
end;
 
 
function opt(a: SURCOMDECL_psurfgraph): SURCOMDECL_psurfgraph;
var p,q : SURCOMDECL_psurfgraphnode;
 
begin 
      if a = SURCOMDECL_absent
      then begin
           p:=makesurfgraphnode(nil,nil,nil,SURCOMDECL_Hdum);
	   p^.alreadysearched:=false;
           opt:=makesurfgraph(p,p)
           end
      else begin
           p:=makesurfgraphnode(nil,nil,nil,SURCOMDECL_Hdum);
	   p^.alreadysearched:=false;
           a^.last^.left:=p;
           q:=makesurfgraphnode(nil,a^.first,p,SURCOMDECL_Hdum);
	   q^.alreadysearched:=false;
           opt:=makesurfgraph(q,p)
           end
end;
 
 
function star(a: SURCOMDECL_psurfgraph): SURCOMDECL_psurfgraph;
var p,q : SURCOMDECL_psurfgraphnode;
 
begin 
      if a = SURCOMDECL_absent
      then begin
           p:=makesurfgraphnode(nil,nil,nil,SURCOMDECL_Hdum);
	   p^.alreadysearched:=false;
           star:=makesurfgraph(p,p)
           end
      else begin
           p:=makesurfgraphnode(nil,nil,nil,SURCOMDECL_Hdum);
	   p^.alreadysearched:=false;
           q:=makesurfgraphnode(nil,a^.first,p,SURCOMDECL_Hdum);
	   q^.alreadysearched:=false;
           a^.last^.left:=p; a^.last^.right:=a^.first;
           star:=makesurfgraph(q,p)
           end
end;
 
 
procedure prod(a: INTEGER; b: SURCOMDECL_syntcat; c: SURCOMDECL_psurfgraph);
 
begin
SURCOMDECL_assignsurfgraph(a,c)
end;
 

