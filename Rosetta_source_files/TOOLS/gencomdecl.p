(*MPM:::===================================================================*
 *
 *  Rosetta Project                                                 
 *                                                                  
 *  Module Title    : #DECL
 *  Creation date   :                                               
 *  Author          :                                               
 *                                                                  
 *  Copyright (c) 1985, by Nederlandse Philips Bedrijven BV.        
 *                                                                  
 *  Remarks         :  
 *
 *EMP:::===================================================================*)

pragma C_include ('strings.pf');
Export (#decl);
pragma C_include ('tstring.pf');
pragma C_include ('mem.pf');
pragma C_include ('str.pf');
pragma C_include ('files.pf');
pragma C_include ('#langspec.pf');
pragma C_include ('#rules.pf');
pragma C_include ('#decl.pf');

PROGRAM #DECL;

(*=========================================================================*
 *  Imported modules
 *=========================================================================*)
WITH STRINGS,
     #LANGSPEC,
     #RULES,
     STR,
     TSTRING,
     FILES,
     MEM;

VAR
   newtopvar   : #DECL_psinglesegmlist;
   statusvar   : boolean;
   debugvar    :  boolean;
   surfgraphvar: array[1..#RULES_MAXRNR] OF #DECL_psurfgraph;
   absentvar   : #DECL_psurfgraph;
   countervar  : INTEGER;
   warningvar  : BOOLEAN;


PROCEDURE TAB(VAR of1:FILES_text;indent:INTEGER);
VAR i:INTEGER;
BEGIN
i:=0;
while i<>indent do
   begin
   i:=i+1;
   FILES_writechar(of1,' ')
   end
END;


FUNCTION #DECL_newtop: #DECL_psinglesegmlist;
BEGIN
   #DECL_newtop:=newtopvar
END;

PROCEDURE #DECL_assignnewtop(valeu: #DECL_psinglesegmlist);
BEGIN
   newtopvar:=valeu
END;

PROCEDURE #DECL_addnewtop(a: #DECL_pSnode);
VAR
   c: #DECL_psinglesegmlist;
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

FUNCTION #DECL_status:boolean;
BEGIN
   #DECL_status:=statusvar
END;

PROCEDURE #DECL_assignstatus(valeu:boolean);
BEGIN
   statusvar:=valeu
END;

FUNCTION #DECL_debug:boolean;
BEGIN
   #DECL_debug:=debugvar
END;

PROCEDURE #DECL_assigndebug(valeu:boolean);
BEGIN
   debugvar:=valeu
END;

FUNCTION #DECL_surfgraph(i:integer):#DECL_psurfgraph;
BEGIN
   #DECL_surfgraph:=surfgraphvar[i]
END;

PROCEDURE #DECL_assignsurfgraph(i:integer; valeu: #DECL_psurfgraph);
BEGIN
   surfgraphvar[i]:=valeu
END;

FUNCTION #DECL_absent: #DECL_psurfgraph;
BEGIN
   #DECL_absent:=absentvar
END;

PROCEDURE #DECL_assignabsent(valeu: #DECL_psurfgraph);
BEGIN
   absentvar:=valeu
END;

PROCEDURE #DECL_Addconnectionnode(VAR r: #DECL_pconnectionnode;
                                                t: #DECL_psnode); 
VAR p: #DECL_pconnectionnode;
    l: #DECL_psinglesegmlist;

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


FUNCTION #DECL_MakeTerminal(s: #LANGSPEC_Category;
                                          w: TSTRING_String): 
                                          #DECL_psnode;
VAR
   t : #DECL_psnode;
BEGIN
   new(t);
   t^.cat := s;
   t^.sonlist:=nil;
   #LANGSPEC_CreateTerm(s, w, t^.ldfield);
   #DECL_MakeTerminal := t
END;


FUNCTION #DECL_MakeNonTerminal(s: #LANGSPEC_Category):
                                          #DECL_psnode;
VAR
   t : #DECL_psnode;
BEGIN
   new(t);
   t^.cat := s;
   #DECL_MakeNonTerminal := t
END;

FUNCTION #DECL_Convinttostring(int:INTEGER):
                                          TSTRING_string;
VAR result:TSTRING_string;
    i,j:INTEGER;
BEGIN
i:=int;
TSTRING_constantempty(result);
IF i=0 THEN TSTRING_appendchar(result,result,'0');
while i<>0 do
   begin
   j:=i MOD 10;
   i:=i DIV 10;
   TSTRING_prefixchar(result,result,chr(j+48))
   end;
#DECL_Convinttostring:=result
END;

PROCEDURE initlocalfile(VAR of1:localfile);
BEGIN
of1.first:=nil;of1.last:=nil
END;
FUNCTION stillstrings(VAR S:localfile):BOOLEAN;
BEGIN
IF S.first<>nil THEN stillstrings:= TRUE
ELSE stillstrings:= FALSE
END;
PROCEDURE takestring(VAR string1:TSTRING_string
        ;VAR S:localfile);
BEGIN
IF S.first=nil THEN begin end
ELSE BEGIN string1:=S.first^.arg;
     IF S.first=S.last THEN 
     BEGIN S.first:=nil;S.last:=nil END
     ELSE S.first:=S.first^.next
     END
END;
PROCEDURE appendstring(string1:TSTRING_string
        ;VAR S:localfile);
VAR p:plosstring;
    newstring:BOOLEAN;
BEGIN
newstring:=FALSE;
IF S.first=NIL THEN newstring:=TRUE
ELSE IF (string1='\\') THEN newstring:=TRUE
ELSE IF TSTRING_length(S.last^.arg)+TSTRING_length(string1)>TSTRING_max THEN
  newstring:=TRUE;
IF newstring THEN
  BEGIN
  MEM_newdefault(loopholes.sizeof(losstring),loopholes.retype(p,MEM_ptr));
  p^.arg:=string1;
  p^.next:=nil;
  IF string1='\\' THEN 
    BEGIN
    p^.carriage:=TRUE;
    TSTRING_constantempty(p^.arg)
    END
  ELSE p^.carriage:=FALSE;
  IF S.first=nil THEN 
    BEGIN
    S.first:=p;S.last:=p 
    END
  ELSE 
    BEGIN 
    S.last^.next:=p;
    S.last:=p 
    END
  END
ELSE
  BEGIN
  TSTRING_append(S.last^.arg,string1)
  END
END;

PROCEDURE APPENDfile(VAR of1:LOCALFILE;VAR of2:FILES_text);
VAR str:TSTRING_string;
    locfile:LOCALFILE;
    p:plosstring;
begin
locfile:=of1;
while stillstrings(locfile) do
   BEGIN
   p:=locfile.first;
   IF p^.carriage THEN FILES_writeline(of2,true);
   takestring(str,locfile);
   FILES_writestring(of2,str,0,left)
   END;
Initlocalfile(of1)
end;

PROCEDURE SAVElocfile(of1:LOCALFILE;VAR of2:LOCALFILE);
VAR str:TSTRING_string;
    locfile:LOCALFILE;
    p:plosstring;

PROCEDURE pureappendstring(string1:TSTRING_string
        ;VAR S:localfile);
VAR p:plosstring;
BEGIN
new(p);
p^.arg:=string1;
p^.next:=nil;IF S.first=nil THEN BEGIN
S.first:=p;S.last:=p END
ELSE BEGIN S.last^.next:=p;
S.last:=p END
END;

begin
locfile:=of1;
initlocalfile(of2);
while stillstrings(locfile) do
   BEGIN
   p:=locfile.first;
   takestring(str,locfile);
   pureappendstring(str,of2);
   of2.last^.carriage:=p^.carriage;
   END;
end;


PROCEDURE APPENDlocfile(of1:LOCALFILE;VAR of2:LOCALFILE);
begin
IF NOT(stillstrings(of2)) THEN of2:=of1
ELSE 
  IF stillstrings(of1) THEN BEGIN
  of2.last^.next:=of1.first;
  of2.last:=of1.last
  END;
IF stillstrings(of2) THEN
 LOCALTAB(of2,TSTRING_max - TSTRING_length(of2.last^.arg));
end;

PROCEDURE LOCALTAB(VAR of1:LOCALFILE;indent:INTEGER);
VAR i:INTEGER;
    str:TSTRING_string;
BEGIN
i:=0;
TSTRING_constantempty(str);
while i<>indent do
   begin
   i:=i+1;
   TSTRING_appendchar(str,str,' ')
   end;
appendstring(str,of1)
END;

FUNCTION counter:INTEGER;
begin
counter:=countervar
end;

PROCEDURE assigncounter(valeu:INTEGER);
begin
countervar:=valeu
end;

FUNCTION warning:BOOLEAN;
begin
warning:=warningvar
end;

PROCEDURE assignwarning(valeu:BOOLEAN);
begin
warningvar:=valeu
end;

FUNCTION converttointeger(CONST str1:STRING; len:INTEGER)
:INTEGER; 
VAR i:INTEGER;
BEGIN
STR_strtointeger(str1,len,i);
converttointeger:=i;
END;



