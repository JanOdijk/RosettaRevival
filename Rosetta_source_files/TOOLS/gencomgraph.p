(*MPM:::===================================================================*
 *
 *  Rosetta Project                                                 
 *                                                                  
 *  Module Title    : #GRAPH
 *  Creation date   :                                               
 *  Author          :                                               
 *                                                                  
 *  Copyright (c) 1985, by Nederlandse Philips Bedrijven BV.        
 *                                                                  
 *  Remarks         :  
 *
 *EMP:::===================================================================*)

Export (#graph);
pragma C_include ('#langspec.pf');
pragma C_include ('#decl.pf');
pragma C_include ('#graph.pf');

PROGRAM #GRAPH;

(*=========================================================================*
 *  Imported modules
 *=========================================================================*)
WITH #DECL,
     #LANGSPEC;


FUNCTION makecat(a: #LANGSPEC_Category): #DECL_psyntcat;
var i: integer;
    b: #DECL_psyntcat;
begin
                 new(b);
                 b^:=a;
                 makecat:=b
end;{makecat}
 
 
FUNCTION makesurfgraph(a,b: #DECL_psurfgraphnode): #DECL_psurfgraph;
var i: integer;
    p: #DECL_psurfgraph;
begin
                 new(p);
                 p^.first:=a; p^.last:=b;
                 makesurfgraph:=p
end;{makesurfgraph}
 
 
FUNCTION makesurfgraphnode(a: #DECL_psyntcat; b,c: #DECL_psurfgraphnode;
                           d: #DECL_nodeid): #DECL_psurfgraphnode;
var i: integer;
    p: #DECL_psurfgraphnode;
begin
                 new(p);
                 p^.cat:=a; p^.right:=b; p^.left:=c; p^.n:=d;
                 makesurfgraphnode:=p
end;{makesurfgraphnode}
 
 
FUNCTION makelonodeid(a: #DECL_nodeid; 
                                           b: #DECL_plonodeid): #DECL_plonodeid;
var p: #DECL_plonodeid;
begin
                 new(p);
                 p^.next:=b; p^.arg:=a;
                 makelonodeid:=p
end;{makelonodeid}
 
 
    (* the functions atom, alt, conc, opt and star to build the
     syntaxgraphs *)
 
FUNCTION atom (a: #LANGSPEC_Category; b: #DECL_nodeid): 
                        #DECL_psurfgraph;
var p,q : #DECL_psurfgraphnode;
 
begin
           p:=makesurfgraphnode(nil,nil,nil,Hdum);
	   p^.alreadysearched:=false;
           q:=makesurfgraphnode(makecat(a),p,nil,b);
	   q^.alreadysearched:=false;
           atom:=makesurfgraph(q,p)
end;
 
 
FUNCTION alt(a,b: #DECL_psurfgraph): #DECL_psurfgraph;
var p,q : #DECL_psurfgraphnode;
 
begin
      if a = #DECL_absent
      then alt:=b
      else if b = #DECL_absent
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
 
 
 
FUNCTION conc(a,b: #DECL_psurfgraph): #DECL_psurfgraph;
 
begin 
      if (a = #DECL_absent) or (b = #DECL_absent)
      then conc:=#DECL_absent
      else begin
           a^.last^.left:=b^.first;
           conc:=makesurfgraph(a^.first,b^.last)
           end
end;
 
 
FUNCTION opt(a: #DECL_psurfgraph): #DECL_psurfgraph;
var p,q : #DECL_psurfgraphnode;
 
begin 
      if a = #DECL_absent
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
 
 
FUNCTION star(a: #DECL_psurfgraph): #DECL_psurfgraph;
var p,q : #DECL_psurfgraphnode;
 
begin 
      if a = #DECL_absent
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
 
 
PROCEDURE prod(a: integer; b: #LANGSPEC_Category; c: #DECL_psurfgraph);
 
BEGIN
   #DECL_assignsurfgraph(a,c)
END;
 

