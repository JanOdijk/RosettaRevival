(*MPM:::===================================================================*
 *
 *  Rosetta Project                                                 
 *                                                                  
 *  Module Title    : afxprGRAPH
 *  Creation date   :                                               
 *  Author          :                                               
 *                                                                  
 *  Copyright (c) 1985, by Nederlandse Philips Bedrijven BV.        
 *                                                                  
 *  Remarks         :  
 *
 *EMP:::===================================================================*)

Export (afxprgraph);
pragma C_include ('afxprlangspec.pf');
pragma C_include ('afxprdecl.pf');
pragma C_include ('afxprgraph.pf');

PROGRAM afxprGRAPH;

(*=========================================================================*
 *  Imported modules
 *=========================================================================*)
WITH afxprDECL,
     afxprLANGSPEC;


FUNCTION makecat(a: afxprLANGSPEC_Category): afxprDECL_psyntcat;
var i: integer;
    b: afxprDECL_psyntcat;
begin
                 new(b);
                 b^:=a;
                 makecat:=b
end;{makecat}
 
 
FUNCTION makesurfgraph(a,b: afxprDECL_psurfgraphnode): afxprDECL_psurfgraph;
var i: integer;
    p: afxprDECL_psurfgraph;
begin
                 new(p);
                 p^.first:=a; p^.last:=b;
                 makesurfgraph:=p
end;{makesurfgraph}
 
 
FUNCTION makesurfgraphnode(a: afxprDECL_psyntcat; b,c: afxprDECL_psurfgraphnode;
                           d: afxprDECL_nodeid): afxprDECL_psurfgraphnode;
var i: integer;
    p: afxprDECL_psurfgraphnode;
begin
                 new(p);
                 p^.cat:=a; p^.right:=b; p^.left:=c; p^.n:=d;
                 makesurfgraphnode:=p
end;{makesurfgraphnode}
 
 
FUNCTION makelonodeid(a: afxprDECL_nodeid; 
                                           b: afxprDECL_plonodeid): afxprDECL_plonodeid;
var p: afxprDECL_plonodeid;
begin
                 new(p);
                 p^.next:=b; p^.arg:=a;
                 makelonodeid:=p
end;{makelonodeid}
 
 
    (* the functions atom, alt, conc, opt and star to build the
     syntaxgraphs *)
 
FUNCTION atom (a: afxprLANGSPEC_Category; b: afxprDECL_nodeid): 
                        afxprDECL_psurfgraph;
var p,q : afxprDECL_psurfgraphnode;
 
begin
           p:=makesurfgraphnode(nil,nil,nil,Hdum);
	   p^.alreadysearched:=false;
           q:=makesurfgraphnode(makecat(a),p,nil,b);
	   q^.alreadysearched:=false;
           atom:=makesurfgraph(q,p)
end;
 
 
FUNCTION alt(a,b: afxprDECL_psurfgraph): afxprDECL_psurfgraph;
var p,q : afxprDECL_psurfgraphnode;
 
begin
      if a = afxprDECL_absent
      then alt:=b
      else if b = afxprDECL_absent
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
 
 
 
FUNCTION conc(a,b: afxprDECL_psurfgraph): afxprDECL_psurfgraph;
 
begin 
      if (a = afxprDECL_absent) or (b = afxprDECL_absent)
      then conc:=afxprDECL_absent
      else begin
           a^.last^.left:=b^.first;
           conc:=makesurfgraph(a^.first,b^.last)
           end
end;
 
 
FUNCTION opt(a: afxprDECL_psurfgraph): afxprDECL_psurfgraph;
var p,q : afxprDECL_psurfgraphnode;
 
begin 
      if a = afxprDECL_absent
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
 
 
FUNCTION star(a: afxprDECL_psurfgraph): afxprDECL_psurfgraph;
var p,q : afxprDECL_psurfgraphnode;
 
begin 
      if a = afxprDECL_absent
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
 
 
PROCEDURE prod(a: integer; b: afxprLANGSPEC_Category; c: afxprDECL_psurfgraph);
 
BEGIN
   afxprDECL_assignsurfgraph(a,c)
END;
 

