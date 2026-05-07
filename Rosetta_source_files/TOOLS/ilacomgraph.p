(*MPM:::===================================================================*
 *
 *  Rosetta Project                                                 
 *                                                                  
 *  Module Title    : ilacomGRAPH
 *  Creation date   :                                               
 *  Author          :                                               
 *                                                                  
 *  Copyright (c) 1985, by Nederlandse Philips Bedrijven BV.        
 *                                                                  
 *  Remarks         :  
 *
 *EMP:::===================================================================*)

Export (ilacomgraph);
pragma C_include ('ilacomlangspec.pf');
pragma C_include ('ilacomdecl.pf');
pragma C_include ('ilacomgraph.pf');

PROGRAM ilacomGRAPH;

(*=========================================================================*
 *  Imported modules
 *=========================================================================*)
WITH ilacomDECL,
     ilacomLANGSPEC;


FUNCTION makecat(a: ilacomLANGSPEC_Category): ilacomDECL_psyntcat;
var i: integer;
    b: ilacomDECL_psyntcat;
begin
                 new(b);
                 b^:=a;
                 makecat:=b
end;{makecat}
 
 
FUNCTION makesurfgraph(a,b: ilacomDECL_psurfgraphnode): ilacomDECL_psurfgraph;
var i: integer;
    p: ilacomDECL_psurfgraph;
begin
                 new(p);
                 p^.first:=a; p^.last:=b;
                 makesurfgraph:=p
end;{makesurfgraph}
 
 
FUNCTION makesurfgraphnode(a: ilacomDECL_psyntcat; b,c: ilacomDECL_psurfgraphnode;
                           d: ilacomDECL_nodeid): ilacomDECL_psurfgraphnode;
var i: integer;
    p: ilacomDECL_psurfgraphnode;
begin
                 new(p);
                 p^.cat:=a; p^.right:=b; p^.left:=c; p^.n:=d;
                 makesurfgraphnode:=p
end;{makesurfgraphnode}
 
 
FUNCTION makelonodeid(a: ilacomDECL_nodeid; 
                                           b: ilacomDECL_plonodeid): ilacomDECL_plonodeid;
var p: ilacomDECL_plonodeid;
begin
                 new(p);
                 p^.next:=b; p^.arg:=a;
                 makelonodeid:=p
end;{makelonodeid}
 
 
    (* the functions atom, alt, conc, opt and star to build the
     syntaxgraphs *)
 
FUNCTION atom (a: ilacomLANGSPEC_Category; b: ilacomDECL_nodeid): 
                        ilacomDECL_psurfgraph;
var p,q : ilacomDECL_psurfgraphnode;
 
begin
           p:=makesurfgraphnode(nil,nil,nil,Hdum);
	   p^.alreadysearched:=false;
           q:=makesurfgraphnode(makecat(a),p,nil,b);
	   q^.alreadysearched:=false;
           atom:=makesurfgraph(q,p)
end;
 
 
FUNCTION alt(a,b: ilacomDECL_psurfgraph): ilacomDECL_psurfgraph;
var p,q : ilacomDECL_psurfgraphnode;
 
begin
      if a = ilacomDECL_absent
      then alt:=b
      else if b = ilacomDECL_absent
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
 
 
 
FUNCTION conc(a,b: ilacomDECL_psurfgraph): ilacomDECL_psurfgraph;
 
begin 
      if (a = ilacomDECL_absent) or (b = ilacomDECL_absent)
      then conc:=ilacomDECL_absent
      else begin
           a^.last^.left:=b^.first;
           conc:=makesurfgraph(a^.first,b^.last)
           end
end;
 
 
FUNCTION opt(a: ilacomDECL_psurfgraph): ilacomDECL_psurfgraph;
var p,q : ilacomDECL_psurfgraphnode;
 
begin 
      if a = ilacomDECL_absent
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
 
 
FUNCTION star(a: ilacomDECL_psurfgraph): ilacomDECL_psurfgraph;
var p,q : ilacomDECL_psurfgraphnode;
 
begin 
      if a = ilacomDECL_absent
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
 
 
PROCEDURE prod(a: integer; b: ilacomLANGSPEC_Category; c: ilacomDECL_psurfgraph);
 
BEGIN
   ilacomDECL_assignsurfgraph(a,c)
END;
 

