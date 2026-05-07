(*MPM:::===================================================================*
 *
 *  Rosetta Project                                                 
 *                                                                  
 *  Module Title    : mrudomcomGRAPH
 *  Creation date   :                                               
 *  Author          :                                               
 *                                                                  
 *  Copyright (c) 1985, by Nederlandse Philips Bedrijven BV.        
 *                                                                  
 *  Remarks         :  
 *
 *EMP:::===================================================================*)

Export (mrudomcomgraph);
pragma C_include ('mrudomcomlangspec.pf');
pragma C_include ('mrudomcomdecl.pf');
pragma C_include ('mrudomcomgraph.pf');

PROGRAM mrudomcomGRAPH;

(*=========================================================================*
 *  Imported modules
 *=========================================================================*)
WITH mrudomcomDECL,
     mrudomcomLANGSPEC;


FUNCTION makecat(a: mrudomcomLANGSPEC_Category): mrudomcomDECL_psyntcat;
var i: integer;
    b: mrudomcomDECL_psyntcat;
begin
                 new(b);
                 b^:=a;
                 makecat:=b
end;{makecat}
 
 
FUNCTION makesurfgraph(a,b: mrudomcomDECL_psurfgraphnode): mrudomcomDECL_psurfgraph;
var i: integer;
    p: mrudomcomDECL_psurfgraph;
begin
                 new(p);
                 p^.first:=a; p^.last:=b;
                 makesurfgraph:=p
end;{makesurfgraph}
 
 
FUNCTION makesurfgraphnode(a: mrudomcomDECL_psyntcat; b,c: mrudomcomDECL_psurfgraphnode;
                           d: mrudomcomDECL_nodeid): mrudomcomDECL_psurfgraphnode;
var i: integer;
    p: mrudomcomDECL_psurfgraphnode;
begin
                 new(p);
                 p^.cat:=a; p^.right:=b; p^.left:=c; p^.n:=d;
                 makesurfgraphnode:=p
end;{makesurfgraphnode}
 
 
FUNCTION makelonodeid(a: mrudomcomDECL_nodeid; 
                                           b: mrudomcomDECL_plonodeid): mrudomcomDECL_plonodeid;
var p: mrudomcomDECL_plonodeid;
begin
                 new(p);
                 p^.next:=b; p^.arg:=a;
                 makelonodeid:=p
end;{makelonodeid}
 
 
    (* the functions atom, alt, conc, opt and star to build the
     syntaxgraphs *)
 
FUNCTION atom (a: mrudomcomLANGSPEC_Category; b: mrudomcomDECL_nodeid): 
                        mrudomcomDECL_psurfgraph;
var p,q : mrudomcomDECL_psurfgraphnode;
 
begin
           p:=makesurfgraphnode(nil,nil,nil,Hdum);
	   p^.alreadysearched:=false;
           q:=makesurfgraphnode(makecat(a),p,nil,b);
	   q^.alreadysearched:=false;
           atom:=makesurfgraph(q,p)
end;
 
 
FUNCTION alt(a,b: mrudomcomDECL_psurfgraph): mrudomcomDECL_psurfgraph;
var p,q : mrudomcomDECL_psurfgraphnode;
 
begin
      if a = mrudomcomDECL_absent
      then alt:=b
      else if b = mrudomcomDECL_absent
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
 
 
 
FUNCTION conc(a,b: mrudomcomDECL_psurfgraph): mrudomcomDECL_psurfgraph;
 
begin 
      if (a = mrudomcomDECL_absent) or (b = mrudomcomDECL_absent)
      then conc:=mrudomcomDECL_absent
      else begin
           a^.last^.left:=b^.first;
           conc:=makesurfgraph(a^.first,b^.last)
           end
end;
 
 
FUNCTION opt(a: mrudomcomDECL_psurfgraph): mrudomcomDECL_psurfgraph;
var p,q : mrudomcomDECL_psurfgraphnode;
 
begin 
      if a = mrudomcomDECL_absent
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
 
 
FUNCTION star(a: mrudomcomDECL_psurfgraph): mrudomcomDECL_psurfgraph;
var p,q : mrudomcomDECL_psurfgraphnode;
 
begin 
      if a = mrudomcomDECL_absent
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
 
 
PROCEDURE prod(a: integer; b: mrudomcomLANGSPEC_Category; c: mrudomcomDECL_psurfgraph);
 
BEGIN
   mrudomcomDECL_assignsurfgraph(a,c)
END;
 

