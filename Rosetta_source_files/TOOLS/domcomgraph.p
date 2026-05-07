(*MPM:::===================================================================*
 *
 *  Rosetta Project                                                 
 *                                                                  
 *  Module Title    : domcomGRAPH
 *  Creation date   :                                               
 *  Author          :                                               
 *                                                                  
 *  Copyright (c) 1985, by Nederlandse Philips Bedrijven BV.        
 *                                                                  
 *  Remarks         :  
 *
 *EMP:::===================================================================*)

Export (domcomgraph);
pragma C_include ('domcomlangspec.pf');
pragma C_include ('domcomdecl.pf');
pragma C_include ('domcomgraph.pf');

PROGRAM domcomGRAPH;

(*=========================================================================*
 *  Imported modules
 *=========================================================================*)
WITH domcomDECL,
     domcomLANGSPEC;


FUNCTION makecat(a: domcomLANGSPEC_Category): domcomDECL_psyntcat;
var i: integer;
    b: domcomDECL_psyntcat;
begin
                 new(b);
                 b^:=a;
                 makecat:=b
end;{makecat}
 
 
FUNCTION makesurfgraph(a,b: domcomDECL_psurfgraphnode): domcomDECL_psurfgraph;
var i: integer;
    p: domcomDECL_psurfgraph;
begin
                 new(p);
                 p^.first:=a; p^.last:=b;
                 makesurfgraph:=p
end;{makesurfgraph}
 
 
FUNCTION makesurfgraphnode(a: domcomDECL_psyntcat; b,c: domcomDECL_psurfgraphnode;
                           d: domcomDECL_nodeid): domcomDECL_psurfgraphnode;
var i: integer;
    p: domcomDECL_psurfgraphnode;
begin
                 new(p);
                 p^.cat:=a; p^.right:=b; p^.left:=c; p^.n:=d;
                 makesurfgraphnode:=p
end;{makesurfgraphnode}
 
 
FUNCTION makelonodeid(a: domcomDECL_nodeid; 
                                           b: domcomDECL_plonodeid): domcomDECL_plonodeid;
var p: domcomDECL_plonodeid;
begin
                 new(p);
                 p^.next:=b; p^.arg:=a;
                 makelonodeid:=p
end;{makelonodeid}
 
 
    (* the functions atom, alt, conc, opt and star to build the
     syntaxgraphs *)
 
FUNCTION atom (a: domcomLANGSPEC_Category; b: domcomDECL_nodeid): 
                        domcomDECL_psurfgraph;
var p,q : domcomDECL_psurfgraphnode;
 
begin
           p:=makesurfgraphnode(nil,nil,nil,Hdum);
	   p^.alreadysearched:=false;
           q:=makesurfgraphnode(makecat(a),p,nil,b);
	   q^.alreadysearched:=false;
           atom:=makesurfgraph(q,p)
end;
 
 
FUNCTION alt(a,b: domcomDECL_psurfgraph): domcomDECL_psurfgraph;
var p,q : domcomDECL_psurfgraphnode;
 
begin
      if a = domcomDECL_absent
      then alt:=b
      else if b = domcomDECL_absent
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
 
 
 
FUNCTION conc(a,b: domcomDECL_psurfgraph): domcomDECL_psurfgraph;
 
begin 
      if (a = domcomDECL_absent) or (b = domcomDECL_absent)
      then conc:=domcomDECL_absent
      else begin
           a^.last^.left:=b^.first;
           conc:=makesurfgraph(a^.first,b^.last)
           end
end;
 
 
FUNCTION opt(a: domcomDECL_psurfgraph): domcomDECL_psurfgraph;
var p,q : domcomDECL_psurfgraphnode;
 
begin 
      if a = domcomDECL_absent
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
 
 
FUNCTION star(a: domcomDECL_psurfgraph): domcomDECL_psurfgraph;
var p,q : domcomDECL_psurfgraphnode;
 
begin 
      if a = domcomDECL_absent
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
 
 
PROCEDURE prod(a: integer; b: domcomLANGSPEC_Category; c: domcomDECL_psurfgraph);
 
BEGIN
   domcomDECL_assignsurfgraph(a,c)
END;
 

