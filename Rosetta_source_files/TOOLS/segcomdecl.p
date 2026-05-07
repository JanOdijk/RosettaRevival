(*MPM:::===================================================================*
 *
 *  Rosetta Project                                                 
 *                                                                  
 *  Module Title    : SEGCOMDECL
 *  Creation date   :                                               
 *  Author          :                                               
 *                                                                  
 *  Copyright (c) 1985, by Nederlandse Philips Bedrijven BV.        
 *                                                                  
 *  Remarks         :  
 *
 *EMP:::===================================================================*)

Export(SEGCOMDECL);
pragma C_include('string.pf');
pragma C_include('segcomlangspec.pf');
pragma C_include('segcomdecl.pf');

(*=========================================================================*
 *  Imported modules
 *=========================================================================*)
PROGRAM SEGCOMDECL;
WITH SEGCOMLANGSPEC,
     STRNG;
VAR
   newtopvar   : SEGCOMDECL_psinglesegmentlist;
   statusvar   : boolean;
   debugvar    : boolean;
   surfgraphvar: array[1..SEGCOMLANGSPEC_MAXRNR] OF SEGCOMDECL_psurfgraph;
   absentvar   : SEGCOMDECL_psurfgraph;

FUNCTION SEGCOMDECL_newtop: SEGCOMDECL_psinglesegmentlist;
BEGIN
   SEGCOMDECL_newtop:=newtopvar
END;

PROCEDURE SEGCOMDECL_assignnewtop(valeu: SEGCOMDECL_psinglesegmentlist);
BEGIN
   newtopvar:=valeu
END;

PROCEDURE SEGCOMDECL_addnewtop(a: SEGCOMDECL_pSnode);
VAR
   c: SEGCOMDECL_pSingleSegmentList;
BEGIN
   new(c);
   WITH c^ DO
      BEGIN
       	 next:=newtopvar;
         rn:=nil;
         stree:=a
      END;
   newtopvar:=c
END;

FUNCTION SEGCOMDECL_status:boolean;
BEGIN
   SEGCOMDECL_status:=statusvar
END;

PROCEDURE SEGCOMDECL_assignstatus(valeu:boolean);
BEGIN
   statusvar:=valeu
END;

FUNCTION SEGCOMDECL_debug:boolean;
BEGIN
   SEGCOMDECL_debug:=debugvar
END;

PROCEDURE SEGCOMDECL_assigndebug(valeu:boolean);
BEGIN
   debugvar:=valeu
END;

FUNCTION SEGCOMDECL_surfgraph(i:integer):SEGCOMDECL_psurfgraph;
BEGIN
   SEGCOMDECL_surfgraph:=surfgraphvar[i]
END;

PROCEDURE SEGCOMDECL_assignsurfgraph(i:integer; valeu: SEGCOMDECL_psurfgraph);
BEGIN
   surfgraphvar[i]:=valeu
END;

FUNCTION SEGCOMDECL_absent: SEGCOMDECL_psurfgraph;
BEGIN
   SEGCOMDECL_absent:=absentvar
END;

PROCEDURE SEGCOMDECL_assignabsent(valeu: SEGCOMDECL_psurfgraph);
BEGIN
   absentvar:=valeu
END;

PROCEDURE SEGCOMDECL_Addconnectionnode(VAR r: SEGCOMDECL_pconnectionnode;
                                                t: SEGCOMDECL_psnode); 
VAR p: SEGCOMDECL_pconnectionnode;
    l: SEGCOMDECL_psinglesegmentlist;

BEGIN
   new(p); new(l);
   l^.next := nil; l^.rn := nil; l^.stree := t;
   p^.list := l;

   IF r = nil THEN BEGIN
      p^.prev := p; p^.next := p;
      r := p
      END
   ELSE BEGIN
      p^.prev := r^.prev;
      p^.prev^.next := p;
      p^.next := r;
      r^.prev := p;
      p^.prev^.list^.rn := p
   END
END;


FUNCTION SEGCOMDECL_MakeTerminal(s: SEGCOMLANGSPEC_Category;
                                          w: STRING_String): 
                                          SEGCOMDECL_psnode;
VAR
   t : SEGCOMDECL_psnode;
BEGIN
   new(t);
   t^.cat := s;
   t^.n   := 0;
   SEGCOMLANGSPEC_CreateTerminal(s, w, t^.ldfield);
   SEGCOMDECL_MakeTerminal := t
END;


FUNCTION SEGCOMDECL_MakeNonTerminal(s: SEGCOMLANGSPEC_Category):
                                          SEGCOMDECL_psnode;
VAR
   t : SEGCOMDECL_psnode;
BEGIN
   new(t);
   t^.cat := s;
   t^.n   := 0;
   SEGCOMDECL_MakeNonTerminal := t
END;



