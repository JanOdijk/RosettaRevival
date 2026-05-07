(*MPM:::===================================================================*
 *
 *  Rosetta Project                                                 
 *                                                                  
 *  Module Title    : surfcomGRAPH
 *  Creation date   :                                               
 *  Author          :                                               
 *                                                                  
 *  Copyright (c) 1985, by Nederlandse Philips Bedrijven BV.        
 *                                                                  
 *  Remarks         :  
 *
 *EMP:::===================================================================*)

Export (surfcomgraph);
pragma C_include ('surfcomlangspec.pf');
pragma C_include ('surfcomdecl.pf');
pragma C_include ('surfcomgraph.pf');

PROGRAM surfcomGRAPH;

(*=========================================================================*
 *  Imported modules
 *=========================================================================*)
WITH surfcomDECL,
     surfcomLANGSPEC;


FUNCTION makecat(a: surfcomLANGSPEC_Category): surfcomDECL_psyntcat;
var i: integer;
    b: surfcomDECL_psyntcat;
begin
                 new(b);
                 b^:=a;
                 makecat:=b
end;{makecat}
 
 
FUNCTION makesurfgraph(a,b: surfcomDECL_psurfgraphnode): surfcomDECL_psurfgraph;
var i: integer;
    p: surfcomDECL_psurfgraph;
begin
                 new(p);
                 p^.first:=a; p^.last:=b;
                 makesurfgraph:=p
end;{makesurfgraph}
 
 
FUNCTION makesurfgraphnode(a: surfcomDECL_psyntcat; b,c: surfcomDECL_psurfgraphnode;
                           d: surfcomDECL_nodeid): surfcomDECL_psurfgraphnode;
var i: integer;
    p: surfcomDECL_psurfgraphnode;
begin
                 new(p);
                 p^.cat:=a; p^.right:=b; p^.left:=c; p^.n:=d;
                 makesurfgraphnode:=p
end;{makesurfgraphnode}
 
 
FUNCTION makelonodeid(a: surfcomDECL_nodeid; 
                                           b: surfcomDECL_plonodeid): surfcomDECL_plonodeid;
var p: surfcomDECL_plonodeid;
begin
                 new(p);
                 p^.next:=b; p^.arg:=a;
                 makelonodeid:=p
end;{makelonodeid}
 
 
    (* the functions atom, alt, conc, opt and star to build the
     syntaxgraphs *)
 
FUNCTION atom (a: surfcomLANGSPEC_Category; b: surfcomDECL_nodeid): 
                        surfcomDECL_psurfgraph;
var p,q : surfcomDECL_psurfgraphnode;
 
begin
           p:=makesurfgraphnode(nil,nil,nil,Hdum);
	   p^.alreadysearched:=false;
           q:=makesurfgraphnode(makecat(a),p,nil,b);
	   q^.alreadysearched:=false;
           atom:=makesurfgraph(q,p)
end;
 
 
FUNCTION alt(a,b: surfcomDECL_psurfgraph): surfcomDECL_psurfgraph;
var p,q : surfcomDECL_psurfgraphnode;
 
begin
      if a = surfcomDECL_absent
      then alt:=b
      else if b = surfcomDECL_absent
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
 
 
 
FUNCTION conc(a,b: surfcomDECL_psurfgraph): surfcomDECL_psurfgraph;
 
begin 
      if (a = surfcomDECL_absent) or (b = surfcomDECL_absent)
      then conc:=surfcomDECL_absent
      else begin
           a^.last^.left:=b^.first;
           conc:=makesurfgraph(a^.first,b^.last)
           end
end;
 
 
FUNCTION opt(a: surfcomDECL_psurfgraph): surfcomDECL_psurfgraph;
var p,q : surfcomDECL_psurfgraphnode;
 
begin 
      if a = surfcomDECL_absent
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
 
 
FUNCTION star(a: surfcomDECL_psurfgraph): surfcomDECL_psurfgraph;
var p,q : surfcomDECL_psurfgraphnode;
 
begin 
      if a = surfcomDECL_absent
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
 
 
PROCEDURE prod(a: integer; b: surfcomLANGSPEC_Category; c: surfcomDECL_psurfgraph);
 
BEGIN
   surfcomDECL_assignsurfgraph(a,c)
END;
 

