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

EXPORT(LEXCOMGRAPH);
pragma C_include('lexcomgraph.pf');
pragma C_include('lexcomdecl.pf');

(*=========================================================================*
 *  Imported modules
 *=========================================================================*)

PROGRAM lexcomgraph;

WITH LEXCOMDECL;

function makecat(a: LEXCOMDECL_syntcat): LEXCOMDECL_psyntcat;
var i: INTEGER;
    b: LEXCOMDECL_psyntcat;
begin
                 new(b);
                 b^:=a;
                 makecat:=b
end;{makecat}
 
 
function makesurfgraph(a,b: LEXCOMDECL_psurfgraphnode): LEXCOMDECL_psurfgraph;
var i: INTEGER;
    p: LEXCOMDECL_psurfgraph;
begin
                 new(p);
                 p^.first:=a; p^.last:=b;
                 makesurfgraph:=p
end;{makesurfgraph}
 
 
function makesurfgraphnode(a: LEXCOMDECL_psyntcat; b,c: LEXCOMDECL_psurfgraphnode;
                           d: LEXCOMDECL_nodeid): LEXCOMDECL_psurfgraphnode;
var i: INTEGER;
    p: LEXCOMDECL_psurfgraphnode;
begin
                 new(p);
                 p^.cat:=a; p^.right:=b; p^.left:=c; p^.n:=d;
                 makesurfgraphnode:=p
end;{makesurfgraphnode}
 
 
function makelonodeid(a: LEXCOMDECL_nodeid; b: LEXCOMDECL_plonodeid): LEXCOMDECL_plonodeid;
var p: LEXCOMDECL_plonodeid;
begin
                 new(p);
                 p^.next:=b; p^.arg:=a;
                 makelonodeid:=p
end;{makelonodeid}
 
 
    (* the functions atom, alt, conc, opt and star to build the
     syntaxgraphs *)
 
function atom (a: LEXCOMDECL_syntcat; b: LEXCOMDECL_nodeid): LEXCOMDECL_psurfgraph;
var p,q : LEXCOMDECL_psurfgraphnode;
 
begin
           p:=makesurfgraphnode(nil,nil,nil,LEXCOMDECL_Hdum);
	   p^.alreadysearched:=false;
           q:=makesurfgraphnode(makecat(a),p,nil,b);
	   q^.alreadysearched:=false;
           atom:=makesurfgraph(q,p)
end;
 
 
function alt(a,b: LEXCOMDECL_psurfgraph): LEXCOMDECL_psurfgraph;
var p,q : LEXCOMDECL_psurfgraphnode;
 
begin
      if a = LEXCOMDECL_absent
      then alt:=b
      else if b = LEXCOMDECL_absent
           then alt:=a
           else begin
                p:=makesurfgraphnode(nil,nil,nil,LEXCOMDECL_Hdum);
	 	p^.alreadysearched:=false;
                a^.last^.left:=p; b^.last^.right:=p;
                q:=makesurfgraphnode(nil,a^.first,b^.first,LEXCOMDECL_Hdum);
		q^.alreadysearched:=false;
                alt:=makesurfgraph(q,p)
                end
end;
 
 
 
function conc(a,b: LEXCOMDECL_psurfgraph): LEXCOMDECL_psurfgraph;
 
begin 
      if (a = LEXCOMDECL_absent) or (b = LEXCOMDECL_absent)
      then conc:=LEXCOMDECL_absent
      else begin
           a^.last^.left:=b^.first;
           conc:=makesurfgraph(a^.first,b^.last)
           end
end;
 
 
function opt(a: LEXCOMDECL_psurfgraph): LEXCOMDECL_psurfgraph;
var p,q : LEXCOMDECL_psurfgraphnode;
 
begin 
      if a = LEXCOMDECL_absent
      then begin
           p:=makesurfgraphnode(nil,nil,nil,LEXCOMDECL_Hdum);
	   p^.alreadysearched:=false;
           opt:=makesurfgraph(p,p)
           end
      else begin
           p:=makesurfgraphnode(nil,nil,nil,LEXCOMDECL_Hdum);
	   p^.alreadysearched:=false;
           a^.last^.left:=p;
           q:=makesurfgraphnode(nil,a^.first,p,LEXCOMDECL_Hdum);
	   q^.alreadysearched:=false;
           opt:=makesurfgraph(q,p)
           end
end;
 
 
function star(a: LEXCOMDECL_psurfgraph): LEXCOMDECL_psurfgraph;
var p,q : LEXCOMDECL_psurfgraphnode;
 
begin 
      if a = LEXCOMDECL_absent
      then begin
           p:=makesurfgraphnode(nil,nil,nil,LEXCOMDECL_Hdum);
	   p^.alreadysearched:=false;
           star:=makesurfgraph(p,p)
           end
      else begin
           p:=makesurfgraphnode(nil,nil,nil,LEXCOMDECL_Hdum);
	   p^.alreadysearched:=false;
           q:=makesurfgraphnode(nil,a^.first,p,LEXCOMDECL_Hdum);
	   q^.alreadysearched:=false;
           a^.last^.left:=p; a^.last^.right:=a^.first;
           star:=makesurfgraph(q,p)
           end
end;
 
 
procedure prod(a: INTEGER; b: LEXCOMDECL_syntcat; c: LEXCOMDECL_psurfgraph);
 
begin
LEXCOMDECL_assignsurfgraph(a,c)
end;
 

