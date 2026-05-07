(*MPM:::===================================================================*
 *
 *  Rosetta Project                                                 
 *                                                                  
 *  Module Title    : SEGCOMGRAPH
 *  Creation date   :                                               
 *  Author          :                                               
 *                                                                  
 *  Copyright (c) 1985, by Nederlandse Philips Bedrijven BV.        
 *                                                                  
 *  Remarks         :  
 *
 *EMP:::===================================================================*)
Export(SEGCOMGRAPH);
pragma C_include('segcomlangspec.pf');
pragma C_include('segcomdecl.pf');
pragma C_include('segcomgraph.pf');


(*=========================================================================*
 *  Imported modules
 *=========================================================================*)

PROGRAM SEGCOMGRAPH;
WITH SEGCOMDECL, SEGCOMLANGSPEC;

FUNCTION makecat(a: SEGCOMLANGSPEC_Category): SEGCOMDECL_psyntcat;
var i: integer;
    b: SEGCOMDECL_psyntcat;
begin
                 new(b);
                 b^:=a;
                 makecat:=b
end;{makecat}
 
 
FUNCTION makesurfgraph(a,b: SEGCOMDECL_psurfgraphnode): SEGCOMDECL_psurfgraph;
var i: integer;
    p: SEGCOMDECL_psurfgraph;
begin
                 new(p);
                 p^.first:=a; p^.last:=b;
                 makesurfgraph:=p
end;{makesurfgraph}
 
 
FUNCTION makesurfgraphnode(a: SEGCOMDECL_psyntcat; b,c: SEGCOMDECL_psurfgraphnode;
                           d: SEGCOMDECL_nodeid): SEGCOMDECL_psurfgraphnode;
var i: integer;
    p: SEGCOMDECL_psurfgraphnode;
begin
                 new(p);
                 p^.cat:=a; p^.right:=b; p^.left:=c; p^.n:=d;
                 makesurfgraphnode:=p
end;{makesurfgraphnode}
 
 
FUNCTION makelonodeid(a: SEGCOMDECL_nodeid; 
                                           b: SEGCOMDECL_plonodeid): SEGCOMDECL_plonodeid;
var p: SEGCOMDECL_plonodeid;
begin
                 new(p);
                 p^.next:=b; p^.arg:=a;
                 makelonodeid:=p
end;{makelonodeid}
 
 
    (* the functions atom, alt, conc, opt and star to build the
     syntaxgraphs *)
 
FUNCTION atom (a: SEGCOMLANGSPEC_Category; b: SEGCOMDECL_nodeid): 
                        SEGCOMDECL_psurfgraph;
var p,q : SEGCOMDECL_psurfgraphnode;
 
begin
           p:=makesurfgraphnode(nil,nil,nil,Hdum);
	   p^.alreadysearched:=false;
           q:=makesurfgraphnode(makecat(a),p,nil,b);
	   q^.alreadysearched:=false;
           atom:=makesurfgraph(q,p)
end;
 
 
FUNCTION alt(a,b: SEGCOMDECL_psurfgraph): SEGCOMDECL_psurfgraph;
var p,q : SEGCOMDECL_psurfgraphnode;
 
begin
      if a = SEGCOMDECL_absent
      then alt:=b
      else if b = SEGCOMDECL_absent
           then alt:=a
           else begin
                p:=makesurfgraphnode(nil,nil,nil,Hdum);
	 	p^.alreadysearched:=false;
                a^.last^.left:=p; b^.last^.right:=p;
                q:=makesurfgraphnode(nil,a^.first,b^.first,Hdum);
		q^.alreadysearched:=false;
                alt:=makesurfgraph(q,p)
                end
end;
 
 
 
FUNCTION conc(a,b: SEGCOMDECL_psurfgraph): SEGCOMDECL_psurfgraph;
 
begin 
      if (a = SEGCOMDECL_absent) or (b = SEGCOMDECL_absent)
      then conc:=SEGCOMDECL_absent
      else begin
           a^.last^.left:=b^.first;
           conc:=makesurfgraph(a^.first,b^.last)
           end
end;
 
 
FUNCTION opt(a: SEGCOMDECL_psurfgraph): SEGCOMDECL_psurfgraph;
var p,q : SEGCOMDECL_psurfgraphnode;
 
begin 
      if a = SEGCOMDECL_absent
      then begin
           p:=makesurfgraphnode(nil,nil,nil,Hdum);
	   p^.alreadysearched:=false;
           opt:=makesurfgraph(p,p)
           end
      else begin
           p:=makesurfgraphnode(nil,nil,nil,Hdum);
	   p^.alreadysearched:=false;
           a^.last^.left:=p;
           q:=makesurfgraphnode(nil,a^.first,p,Hdum);
	   q^.alreadysearched:=false;
           opt:=makesurfgraph(q,p)
           end
end;
 
 
FUNCTION star(a: SEGCOMDECL_psurfgraph): SEGCOMDECL_psurfgraph;
var p,q : SEGCOMDECL_psurfgraphnode;
 
begin 
      if a = SEGCOMDECL_absent
      then begin
           p:=makesurfgraphnode(nil,nil,nil,Hdum);
	   p^.alreadysearched:=false;
           star:=makesurfgraph(p,p)
           end
      else begin
           p:=makesurfgraphnode(nil,nil,nil,Hdum);
	   p^.alreadysearched:=false;
           q:=makesurfgraphnode(nil,a^.first,p,Hdum);
	   q^.alreadysearched:=false;
           a^.last^.left:=p; a^.last^.right:=a^.first;
           star:=makesurfgraph(q,p)
           end
end;
 
 
PROCEDURE prod(a: integer; b: SEGCOMLANGSPEC_Category; c: SEGCOMDECL_psurfgraph);
 
BEGIN
   SEGCOMDECL_assignsurfgraph(a,c)
END;
 

