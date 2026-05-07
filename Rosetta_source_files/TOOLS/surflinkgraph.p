(*MPM:::===================================================================*
 *
 *  Rosetta Project                                                 
 *                                                                  
 *  Module Title    : surflinkGRAPH
 *  Creation date   :                                               
 *  Author          :                                               
 *                                                                  
 *  Copyright (c) 1985, by Nederlandse Philips Bedrijven BV.        
 *                                                                  
 *  Remarks         :  
 *
 *EMP:::===================================================================*)

Export (surflinkgraph);
pragma C_include ('surflinklangspec.pf');
pragma C_include ('surflinkdecl.pf');
pragma C_include ('surflinkgraph.pf');

PROGRAM surflinkGRAPH;

(*=========================================================================*
 *  Imported modules
 *=========================================================================*)
WITH surflinkDECL,
     surflinkLANGSPEC;


FUNCTION makecat(a: surflinkLANGSPEC_Category): surflinkDECL_psyntcat;
var i: integer;
    b: surflinkDECL_psyntcat;
begin
                 new(b);
                 b^:=a;
                 makecat:=b
end;{makecat}
 
 
FUNCTION makesurfgraph(a,b: surflinkDECL_psurfgraphnode): surflinkDECL_psurfgraph;
var i: integer;
    p: surflinkDECL_psurfgraph;
begin
                 new(p);
                 p^.first:=a; p^.last:=b;
                 makesurfgraph:=p
end;{makesurfgraph}
 
 
FUNCTION makesurfgraphnode(a: surflinkDECL_psyntcat; b,c: surflinkDECL_psurfgraphnode;
                           d: surflinkDECL_nodeid): surflinkDECL_psurfgraphnode;
var i: integer;
    p: surflinkDECL_psurfgraphnode;
begin
                 new(p);
                 p^.cat:=a; p^.right:=b; p^.left:=c; p^.n:=d;
                 makesurfgraphnode:=p
end;{makesurfgraphnode}
 
 
FUNCTION makelonodeid(a: surflinkDECL_nodeid; 
                                           b: surflinkDECL_plonodeid): surflinkDECL_plonodeid;
var p: surflinkDECL_plonodeid;
begin
                 new(p);
                 p^.next:=b; p^.arg:=a;
                 makelonodeid:=p
end;{makelonodeid}
 
 
    (* the functions atom, alt, conc, opt and star to build the
     syntaxgraphs *)
 
FUNCTION atom (a: surflinkLANGSPEC_Category; b: surflinkDECL_nodeid): 
                        surflinkDECL_psurfgraph;
var p,q : surflinkDECL_psurfgraphnode;
 
begin
           p:=makesurfgraphnode(nil,nil,nil,Hdum);
	   p^.alreadysearched:=false;
           q:=makesurfgraphnode(makecat(a),p,nil,b);
	   q^.alreadysearched:=false;
           atom:=makesurfgraph(q,p)
end;
 
 
FUNCTION alt(a,b: surflinkDECL_psurfgraph): surflinkDECL_psurfgraph;
var p,q : surflinkDECL_psurfgraphnode;
 
begin
      if a = surflinkDECL_absent
      then alt:=b
      else if b = surflinkDECL_absent
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
 
 
 
FUNCTION conc(a,b: surflinkDECL_psurfgraph): surflinkDECL_psurfgraph;
 
begin 
      if (a = surflinkDECL_absent) or (b = surflinkDECL_absent)
      then conc:=surflinkDECL_absent
      else begin
           a^.last^.left:=b^.first;
           conc:=makesurfgraph(a^.first,b^.last)
           end
end;
 
 
FUNCTION opt(a: surflinkDECL_psurfgraph): surflinkDECL_psurfgraph;
var p,q : surflinkDECL_psurfgraphnode;
 
begin 
      if a = surflinkDECL_absent
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
 
 
FUNCTION star(a: surflinkDECL_psurfgraph): surflinkDECL_psurfgraph;
var p,q : surflinkDECL_psurfgraphnode;
 
begin 
      if a = surflinkDECL_absent
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
 
 
PROCEDURE prod(a: integer; b: surflinkLANGSPEC_Category; c: surflinkDECL_psurfgraph);
 
BEGIN
   surflinkDECL_assignsurfgraph(a,c)
END;
 

