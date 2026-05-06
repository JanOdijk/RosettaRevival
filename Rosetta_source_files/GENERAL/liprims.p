(*MPM:::===================================================================*
 *
 *  Rosetta Project                                                 
 *                                                                  
 *  Module Title    : LIPRIMS
 *  Creation date   :                                               
 *  Author          : R. Leermakers                               
 *                                                                  
 *  Copyright (c) 1985, by Nederlandse Philips Bedrijven BV.        
 *                                                                  
 *  Remarks         :  
 *
 *EMP:::===================================================================*)

Export(LIPRIMS);
pragma C_include('lidomaint.pf');
pragma C_include('ldprims.pf');
pragma C_include('items.pf');
pragma C_include('mem.pf');
pragma C_include('listree.pf');
pragma C_include('liprims.pf');

(*=========================================================================*
 *  Imported modules
 *=========================================================================*)

PROGRAM LIPRIMS;
WITH LIDOMAINT, LDPRIMS, ITEMS, MEM, LISTREE;


CONST HDUM = -1;
VAR
   absentvar   : LIPRIMS_psurfgraph;
   newtopvar   :  LISTREE_pLoStree;
   statusvar   :  BOOLEAN;


FUNCTION LIPRIMS_absent: LIPRIMS_psurfgraph;
BEGIN
   LIPRIMS_absent:=absentvar
END;

PROCEDURE LIPRIMS_assignabsent(valeu: LIPRIMS_psurfgraph);
BEGIN
   absentvar:=valeu
END;


FUNCTION makecat(a: LIDOMAINT_syntcat): LIPRIMS_psyntcat;
var i: INTEGER;
    b: LIPRIMS_psyntcat;
begin
                 MEM_newdefault(LOOPHOLES.SIZEof(LIDOMAINT_syntcat),
                                Loopholes.Retype(b,MEM_ptr));
                 b^:=a;
                 makecat:=b
end;{makecat}
 
 
FUNCTION makesurfgraph(a,b: LIPRIMS_psurfgraphnode): LIPRIMS_psurfgraph;
var i: integer;
    p: LIPRIMS_psurfgraph;
begin
                 MEM_newdefault(Loopholes.SIZEof(LIPRIMS_surfgraphtype),
                                Loopholes.Retype(p,MEM_ptr));
                 p^.first:=a; p^.last:=b;
                 makesurfgraph:=p
end;{makesurfgraph}
 
 
FUNCTION makesurfgraphnode(a: LIPRIMS_psyntcat; b,c: LIPRIMS_psurfgraphnode;
                           d: LIPRIMS_nodeid): LIPRIMS_psurfgraphnode;
var i: integer;
    p: LIPRIMS_psurfgraphnode;
begin
                 MEM_newdefault(Loopholes.SIZEof(LIPRIMS_surfgraphnode),
                                Loopholes.Retype(p,MEM_ptr));
                 p^.cat:=a; p^.right:=b; p^.left:=c; p^.n:=d;
                 makesurfgraphnode:=p
end;{makesurfgraphnode}
 
 
FUNCTION makelonodeid(a: LIPRIMS_nodeid; 
                                           b: LIPRIMS_plonodeid): LIPRIMS_plonodeid;
var p: LIPRIMS_plonodeid;
begin
                 MEM_newdefault(Loopholes.SIZEof(LIPRIMS_lonodeid),
                                Loopholes.Retype(p,MEM_ptr));
                 p^.next:=b; p^.arg:=a;
                 makelonodeid:=p
end;{makelonodeid}
 
 
    (* the functions atom, alt, conc, opt and star to build the
     syntaxgraphs *)
 
FUNCTION atom (a: LIDOMAINT_syntcat; b: LIPRIMS_nodeid): 
                        LIPRIMS_psurfgraph;
var p,q : LIPRIMS_psurfgraphnode;
 
begin
           p:=makesurfgraphnode(nil,nil,nil,Hdum);
	   p^.alreadysearched:=false;
           q:=makesurfgraphnode(makecat(a),p,nil,b);
	   q^.alreadysearched:=false;
           atom:=makesurfgraph(q,p)
end;
 
 
FUNCTION alt(a,b: LIPRIMS_psurfgraph): LIPRIMS_psurfgraph;
var p,q : LIPRIMS_psurfgraphnode;
 
begin
      if a = LIPRIMS_absent
      then alt:=b
      else if b = LIPRIMS_absent
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
 
 
 
FUNCTION conc(a,b: LIPRIMS_psurfgraph): LIPRIMS_psurfgraph;
 
begin 
      if (a = LIPRIMS_absent) or (b = LIPRIMS_absent)
      then conc:=LIPRIMS_absent
      else begin
           a^.last^.left:=b^.first;
           conc:=makesurfgraph(a^.first,b^.last)
           end
end;
 
 
FUNCTION opt(a: LIPRIMS_psurfgraph): LIPRIMS_psurfgraph;
var p,q : LIPRIMS_psurfgraphnode;
 
begin 
      if a = LIPRIMS_absent
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
 
 
FUNCTION star(a: LIPRIMS_psurfgraph): LIPRIMS_psurfgraph;
var p,q : LIPRIMS_psurfgraphnode;
 
begin 
      if a = LIPRIMS_absent
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
 
 
PROCEDURE prod(a: integer; b: LIDOMAINT_syntcat; c: LIPRIMS_psurfgraph);
 
BEGIN
   LDPRIMS_assignsurfgraph(a,c)
END;
 
FUNCTION LIPRIMS_newtop: LISTREE_pLoStree;
BEGIN
   LIPRIMS_newtop:=newtopvar
END;

PROCEDURE LIPRIMS_assignnewtop(valeu: LISTREE_pLoStree);
BEGIN
   newtopvar:=valeu
END;

PROCEDURE LIPRIMS_addnewtop(a: LISTREE_pStree);
VAR
   c: LISTREE_pLoStree;
BEGIN
   MEM_newdefault(Loopholes.SIZEof(LISTREE_lostree),
                  Loopholes.Retype(c,MEM_ptr));
   WITH c^ DO
      BEGIN
       	 next:=newtopvar;
         arg:=a
      END;
   newtopvar:=c
END;

FUNCTION LIPRIMS_status:boolean;
BEGIN
   LIPRIMS_status:=statusvar
END;

PROCEDURE LIPRIMS_assignstatus(valeu:boolean);
BEGIN
   statusvar:=valeu
END;

