(*MPM:::===================================================================*
 *
 *  Rosetta Project                                                 
 *                                                                  
 *  Module Title    : tracomGRAPH
 *  Creation date   :                                               
 *  Author          :                                               
 *                                                                  
 *  Copyright (c) 1985, by Nederlandse Philips Bedrijven BV.        
 *                                                                  
 *  Remarks         :  
 *
 *EMP:::===================================================================*)

Export (tracomgraph);
pragma C_include ('tracomlangspec.pf');
pragma C_include ('tracomdecl.pf');
pragma C_include ('tracomgraph.pf');

PROGRAM tracomGRAPH;

(*=========================================================================*
 *  Imported modules
 *=========================================================================*)
WITH tracomDECL,
     tracomLANGSPEC;


FUNCTION makecat(a: tracomLANGSPEC_Category): tracomDECL_psyntcat;
var i: integer;
    b: tracomDECL_psyntcat;
begin
                 new(b);
                 b^:=a;
                 makecat:=b
end;{makecat}
 
 
FUNCTION makesurfgraph(a,b: tracomDECL_psurfgraphnode): tracomDECL_psurfgraph;
var i: integer;
    p: tracomDECL_psurfgraph;
begin
                 new(p);
                 p^.first:=a; p^.last:=b;
                 makesurfgraph:=p
end;{makesurfgraph}
 
 
FUNCTION makesurfgraphnode(a: tracomDECL_psyntcat; b,c: tracomDECL_psurfgraphnode;
                           d: tracomDECL_nodeid): tracomDECL_psurfgraphnode;
var i: integer;
    p: tracomDECL_psurfgraphnode;
begin
                 new(p);
                 p^.cat:=a; p^.right:=b; p^.left:=c; p^.n:=d;
                 makesurfgraphnode:=p
end;{makesurfgraphnode}
 
 
FUNCTION makelonodeid(a: tracomDECL_nodeid; 
                                           b: tracomDECL_plonodeid): tracomDECL_plonodeid;
var p: tracomDECL_plonodeid;
begin
                 new(p);
                 p^.next:=b; p^.arg:=a;
                 makelonodeid:=p
end;{makelonodeid}
 
 
    (* the functions atom, alt, conc, opt and star to build the
     syntaxgraphs *)
 
FUNCTION atom (a: tracomLANGSPEC_Category; b: tracomDECL_nodeid): 
                        tracomDECL_psurfgraph;
var p,q : tracomDECL_psurfgraphnode;
 
begin
           p:=makesurfgraphnode(nil,nil,nil,Hdum);
	   p^.alreadysearched:=false;
           q:=makesurfgraphnode(makecat(a),p,nil,b);
	   q^.alreadysearched:=false;
           atom:=makesurfgraph(q,p)
end;
 
 
FUNCTION alt(a,b: tracomDECL_psurfgraph): tracomDECL_psurfgraph;
var p,q : tracomDECL_psurfgraphnode;
 
begin
      if a = tracomDECL_absent
      then alt:=b
      else if b = tracomDECL_absent
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
 
 
 
FUNCTION conc(a,b: tracomDECL_psurfgraph): tracomDECL_psurfgraph;
 
begin 
      if (a = tracomDECL_absent) or (b = tracomDECL_absent)
      then conc:=tracomDECL_absent
      else begin
           a^.last^.left:=b^.first;
           conc:=makesurfgraph(a^.first,b^.last)
           end
end;
 
 
FUNCTION opt(a: tracomDECL_psurfgraph): tracomDECL_psurfgraph;
var p,q : tracomDECL_psurfgraphnode;
 
begin 
      if a = tracomDECL_absent
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
 
 
FUNCTION star(a: tracomDECL_psurfgraph): tracomDECL_psurfgraph;
var p,q : tracomDECL_psurfgraphnode;
 
begin 
      if a = tracomDECL_absent
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
 
 
PROCEDURE prod(a: integer; b: tracomLANGSPEC_Category; c: tracomDECL_psurfgraph);
 
BEGIN
   tracomDECL_assignsurfgraph(a,c)
END;
 

