(*MPM:::===================================================================*
 *
 *  Rosetta Project                                                 
 *                                                                  
 *  Module Title    : mrucomGRAPH
 *  Creation date   :                                               
 *  Author          :                                               
 *                                                                  
 *  Copyright (c) 1985, by Nederlandse Philips Bedrijven BV.        
 *                                                                  
 *  Remarks         :  
 *
 *EMP:::===================================================================*)

Export (mrucomgraph);
pragma C_include ('mrucomlangspec.pf');
pragma C_include ('mrucomdecl.pf');
pragma C_include ('mrucomgraph.pf');

PROGRAM mrucomGRAPH;

(*=========================================================================*
 *  Imported modules
 *=========================================================================*)
WITH mrucomDECL,
     mrucomLANGSPEC;


FUNCTION makecat(a: mrucomLANGSPEC_Category): mrucomDECL_psyntcat;
var i: integer;
    b: mrucomDECL_psyntcat;
begin
                 new(b);
                 b^:=a;
                 makecat:=b
end;{makecat}
 
 
FUNCTION makesurfgraph(a,b: mrucomDECL_psurfgraphnode): mrucomDECL_psurfgraph;
var i: integer;
    p: mrucomDECL_psurfgraph;
begin
                 new(p);
                 p^.first:=a; p^.last:=b;
                 makesurfgraph:=p
end;{makesurfgraph}
 
 
FUNCTION makesurfgraphnode(a: mrucomDECL_psyntcat; b,c: mrucomDECL_psurfgraphnode;
                           d: mrucomDECL_nodeid): mrucomDECL_psurfgraphnode;
var i: integer;
    p: mrucomDECL_psurfgraphnode;
begin
                 new(p);
                 p^.cat:=a; p^.right:=b; p^.left:=c; p^.n:=d;
                 makesurfgraphnode:=p
end;{makesurfgraphnode}
 
 
FUNCTION makelonodeid(a: mrucomDECL_nodeid; 
                                           b: mrucomDECL_plonodeid): mrucomDECL_plonodeid;
var p: mrucomDECL_plonodeid;
begin
                 new(p);
                 p^.next:=b; p^.arg:=a;
                 makelonodeid:=p
end;{makelonodeid}
 
 
    (* the functions atom, alt, conc, opt and star to build the
     syntaxgraphs *)
 
FUNCTION atom (a: mrucomLANGSPEC_Category; b: mrucomDECL_nodeid): 
                        mrucomDECL_psurfgraph;
var p,q : mrucomDECL_psurfgraphnode;
 
begin
           p:=makesurfgraphnode(nil,nil,nil,Hdum);
	   p^.alreadysearched:=false;
           q:=makesurfgraphnode(makecat(a),p,nil,b);
	   q^.alreadysearched:=false;
           atom:=makesurfgraph(q,p)
end;
 
 
FUNCTION alt(a,b: mrucomDECL_psurfgraph): mrucomDECL_psurfgraph;
var p,q : mrucomDECL_psurfgraphnode;
 
begin
      if a = mrucomDECL_absent
      then alt:=b
      else if b = mrucomDECL_absent
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
 
 
 
FUNCTION conc(a,b: mrucomDECL_psurfgraph): mrucomDECL_psurfgraph;
 
begin 
      if (a = mrucomDECL_absent) or (b = mrucomDECL_absent)
      then conc:=mrucomDECL_absent
      else begin
           a^.last^.left:=b^.first;
           conc:=makesurfgraph(a^.first,b^.last)
           end
end;
 
 
FUNCTION opt(a: mrucomDECL_psurfgraph): mrucomDECL_psurfgraph;
var p,q : mrucomDECL_psurfgraphnode;
 
begin 
      if a = mrucomDECL_absent
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
 
 
FUNCTION star(a: mrucomDECL_psurfgraph): mrucomDECL_psurfgraph;
var p,q : mrucomDECL_psurfgraphnode;
 
begin 
      if a = mrucomDECL_absent
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
 
 
PROCEDURE prod(a: integer; b: mrucomLANGSPEC_Category; c: mrucomDECL_psurfgraph);
 
BEGIN
   mrucomDECL_assignsurfgraph(a,c)
END;
 

