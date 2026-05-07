(*MPM:::===================================================================*
 *
 *  Rosetta Project                                                 
 *                                                                  
 *  Module Title    : auxcomGRAPH
 *  Creation date   :                                               
 *  Author          :                                               
 *                                                                  
 *  Copyright (c) 1985, by Nederlandse Philips Bedrijven BV.        
 *                                                                  
 *  Remarks         :  
 *
 *EMP:::===================================================================*)

Export (auxcomgraph);
pragma C_include ('auxcomlangspec.pf');
pragma C_include ('auxcomdecl.pf');
pragma C_include ('auxcomgraph.pf');

PROGRAM auxcomGRAPH;

(*=========================================================================*
 *  Imported modules
 *=========================================================================*)
WITH auxcomDECL,
     auxcomLANGSPEC;


FUNCTION makecat(a: auxcomLANGSPEC_Category): auxcomDECL_psyntcat;
var i: integer;
    b: auxcomDECL_psyntcat;
begin
                 new(b);
                 b^:=a;
                 makecat:=b
end;{makecat}
 
 
FUNCTION makesurfgraph(a,b: auxcomDECL_psurfgraphnode): auxcomDECL_psurfgraph;
var i: integer;
    p: auxcomDECL_psurfgraph;
begin
                 new(p);
                 p^.first:=a; p^.last:=b;
                 makesurfgraph:=p
end;{makesurfgraph}
 
 
FUNCTION makesurfgraphnode(a: auxcomDECL_psyntcat; b,c: auxcomDECL_psurfgraphnode;
                           d: auxcomDECL_nodeid): auxcomDECL_psurfgraphnode;
var i: integer;
    p: auxcomDECL_psurfgraphnode;
begin
                 new(p);
                 p^.cat:=a; p^.right:=b; p^.left:=c; p^.n:=d;
                 makesurfgraphnode:=p
end;{makesurfgraphnode}
 
 
FUNCTION makelonodeid(a: auxcomDECL_nodeid; 
                                           b: auxcomDECL_plonodeid): auxcomDECL_plonodeid;
var p: auxcomDECL_plonodeid;
begin
                 new(p);
                 p^.next:=b; p^.arg:=a;
                 makelonodeid:=p
end;{makelonodeid}
 
 
    (* the functions atom, alt, conc, opt and star to build the
     syntaxgraphs *)
 
FUNCTION atom (a: auxcomLANGSPEC_Category; b: auxcomDECL_nodeid): 
                        auxcomDECL_psurfgraph;
var p,q : auxcomDECL_psurfgraphnode;
 
begin
           p:=makesurfgraphnode(nil,nil,nil,Hdum);
	   p^.alreadysearched:=false;
           q:=makesurfgraphnode(makecat(a),p,nil,b);
	   q^.alreadysearched:=false;
           atom:=makesurfgraph(q,p)
end;
 
 
FUNCTION alt(a,b: auxcomDECL_psurfgraph): auxcomDECL_psurfgraph;
var p,q : auxcomDECL_psurfgraphnode;
 
begin
      if a = auxcomDECL_absent
      then alt:=b
      else if b = auxcomDECL_absent
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
 
 
 
FUNCTION conc(a,b: auxcomDECL_psurfgraph): auxcomDECL_psurfgraph;
 
begin 
      if (a = auxcomDECL_absent) or (b = auxcomDECL_absent)
      then conc:=auxcomDECL_absent
      else begin
           a^.last^.left:=b^.first;
           conc:=makesurfgraph(a^.first,b^.last)
           end
end;
 
 
FUNCTION opt(a: auxcomDECL_psurfgraph): auxcomDECL_psurfgraph;
var p,q : auxcomDECL_psurfgraphnode;
 
begin 
      if a = auxcomDECL_absent
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
 
 
FUNCTION star(a: auxcomDECL_psurfgraph): auxcomDECL_psurfgraph;
var p,q : auxcomDECL_psurfgraphnode;
 
begin 
      if a = auxcomDECL_absent
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
 
 
PROCEDURE prod(a: integer; b: auxcomLANGSPEC_Category; c: auxcomDECL_psurfgraph);
 
BEGIN
   auxcomDECL_assignsurfgraph(a,c)
END;
 

