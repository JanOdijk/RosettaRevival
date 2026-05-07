(*MPM:::===================================================================*
 *
 *  Rosetta Project                                                 
 *                                                                  
 *  Module Title    : surfrules 
 *  Creation date   :                                               
 *  Author          :                                               
 *                                                                  
 *  Copyright (c) 1985, by Nederlandse Philips Bedrijven BV.        
 *                                                                  
 *  Remarks         :  
 *
 *EMP:::===================================================================*)

(*=========================================================================*
 *  Imported modules
 *=========================================================================*)

EXPORT(mrusurcomrules);
pragma C_include ('mrusurcomrules.pf');
pragma C_include ('mrusurcomdecl.pf');
pragma C_include ('string.pf');

PROGRAM mrusurcomrules;

WITH mrusurcomdecl,
     strng;

VAR strstatic:string;
    strstatic1:string;
    numofhelpgraphsstatic:integer;
    numofconcgraphsstatic:integer;
    numofelementarygraphsstatic:integer;
    graphtypestatic:graphtypetype;
function addnewtop(a:psnode;b:psinglesegmentlist):psinglesegmentlist;
var
   c:psinglesegmentlist;
begin
new(c);
with c^ do
   	begin
   	next:=b;rn:=nil;stree:=a
   	end;
addnewtop:=c
end;

function checknumber(str:string):boolean;
var result:boolean;
begin
result:=false;
if (STRING_length(str)<3) and (STRING_length(str)>0) then
   begin
   if (str[1] in ['1','2','3','4','5','6','7','8','9']) then
   	begin
        if (STRING_length(str)=1) or ((STRING_length(str)=2) and 
   		(str[2] in ['0','1','2','3','4','5','6','7','8','9'])) then
   			result:=true
        end
   end;
checknumber:=result
end;

function mknumber:psnode;
var s:psnode;
begin
new(s);
s^.cat:=number;
mknumber:=s
end;

function mkCAs:psnode;
var s:psnode;
begin
new(s);
s^.cat:=CAs;
mkCAs:=s
end;

function mkRegExp:psnode;
var s:psnode;
begin
new(s);
s^.cat:=RegExp;
mkRegExp:=s
end;

function mkident(str:string):psnode;
var s:psnode;
begin
new(s);
s^.cat:=ident;
new(s^.identfield);
s^.identfield^.str:=str;
mkident:=s
end;

function mkutt(numofhelpgraphs:integer):psnode;
var s:psnode;
begin
new(s);
s^.cat:=utt;
new(s^.uttfield);
s^.uttfield^.numofhelpgraphs:=numofhelpgraphs;
mkutt:=s
end;

function mkgraph(numofconcgraphs:integer):psnode;
var s:psnode;
begin
new(s);
s^.cat:=graph;
new(s^.graphfield);
s^.graphfield^.numofconcgraphs:=numofconcgraphs;
mkgraph:=s
end;

function mkconcgraph(numofelementarygraphs:integer):psnode;
var s:psnode;
begin
new(s);
s^.cat:=concgraph;
new(s^.concgraphfield);
s^.concgraphfield^.numofelementarygraphs:=numofelementarygraphs;
mkconcgraph:=s
end;

function mkhelpgraph(str:string):psnode;
var s:psnode;
begin
new(s);
s^.cat:=helpgraph;
new(s^.helpgraphfield);
s^.helpgraphfield^.str:=str;
mkhelpgraph:=s
end;

function mkelementarygraph(graphtype:graphtypetype):psnode;
var s:psnode;
begin
new(s);
s^.cat:=elementarygraph;
new(s^.elementarygraphfield);
s^.elementarygraphfield^.graphtype:=graphtype;
mkelementarygraph:=s
end;

function checkCAs(s:string):boolean;
var result:boolean;
begin
if s='SURFACE PART' then result:=true else result:=false;
checkCAs:=result
end;

function checkRegExp(s:string):boolean;
var i:integer;
    result:boolean;
begin
i:=0;
if s='BASIS RULE' then result:=true else result:=false;
checkRegExp:=result
end;

 procedure surfrule(rnr:integer;a:nodeid;b:psnode;mode:surfrulemode);

procedure uttrule(a:nodeid;b:psnode;mode:surfrulemode);
begin
case a of
Hinit: begin numofhelpgraphsstatic:=0 end;
1: case mode of
   loccond: assignstatus(true);
   globcond: begin assignstatus(true) end;
   end;
2: case mode of
   loccond: assignstatus(true);
   globcond: begin numofhelpgraphsstatic:=numofhelpgraphsstatic+1;assignstatus(true) end;
   end;
Hfinal: begin assignnewtop(addnewtop(mkutt(numofhelpgraphsstatic),newtop));
              assignstatus(true) 
        end
end
end;

procedure graphrule(a:nodeid;b:psnode;mode:surfrulemode);
begin
case a of
Hinit: begin numofconcgraphsstatic:=0 end;
1: case mode of
   loccond: assignstatus(true);
   globcond: begin assignstatus(true) end;
   end;
2: case mode of
   loccond: assignstatus(true);
   globcond: begin numofconcgraphsstatic:=numofconcgraphsstatic+1;assignstatus(true) end;
   end;
Hfinal: begin assignnewtop(addnewtop(mkgraph(numofconcgraphsstatic),newtop));
              assignstatus(true) 
        end
end
end;

procedure concgraphrule(a:nodeid;b:psnode;mode:surfrulemode);
begin
case a of
Hinit: begin numofelementarygraphsstatic:=0 end;
1: case mode of
   loccond: assignstatus(true);
   globcond: begin assignstatus(true) end;
   end;
2: case mode of
   loccond: assignstatus(true);
   globcond: begin numofelementarygraphsstatic:=numofelementarygraphsstatic+1;
                   assignstatus(true) 
             end;
   end;
Hfinal: begin assignnewtop(addnewtop(mkconcgraph(numofelementarygraphsstatic),newtop));
              assignstatus(true) 
        end
end
end;

procedure elementarygraphrule(a:nodeid;b:psnode;mode:surfrulemode);
begin
case a of
Hinit: begin graphtypestatic:=atomgraph end;
1: case mode of
   loccond: assignstatus(true);
   globcond: begin assignstatus(true) end;
   end;
2: case mode of
   loccond: assignstatus(true);
   globcond: begin graphtypestatic:=enclosedgraph; assignstatus(true) end;
   end;
3: case mode of
   loccond: assignstatus(true);
   globcond: begin graphtypestatic:=optgraph; assignstatus(true) end;
   end;
4: case mode of
   loccond: assignstatus(true);
   globcond: begin graphtypestatic:=stargraph; assignstatus(true) end;
   end;
5: case mode of
   loccond: assignstatus(true);
   globcond: begin graphtypestatic:=helpgraphident; assignstatus(true) end;
   end;
6: case mode of
   loccond: assignstatus(true);
   globcond: begin graphtypestatic:=atomgraph; assignstatus(true) end;
   end;
Hfinal: begin assignnewtop(addnewtop(mkelementarygraph(graphtypestatic),newtop));
              assignstatus(true) 
        end
end
end;

procedure helpgraphrule(a:nodeid;b:psnode;mode:surfrulemode);
begin
case a of
Hinit:begin strstatic:=' 'end;
1: case mode of
   loccond: assignstatus(true);
   globcond: begin assignstatus(true) end;
   end;
2: case mode of
   loccond: assignstatus(true);
   globcond: begin strstatic:=b^.identfield^.str;assignstatus(true) end;
   end;
Hfinal: begin assignnewtop(addnewtop(mkhelpgraph(strstatic),newtop));
              assignstatus(true) 
        end
end
end;

procedure numberrule(a:nodeid;b:psnode;mode:surfrulemode);
begin
case a of
Hinit:begin end;
1: case mode of
   loccond: assignstatus(checknumber(b^.charstringfield^.stringfield));
   globcond: begin assignstatus(true) end;
   end;
Hfinal: begin assignnewtop(addnewtop(mknumber,newtop));
              assignstatus(true) 
        end
end
end;

procedure CAsrule(a:nodeid;b:psnode;mode:surfrulemode);
begin
case a of
Hinit:begin end;
1: case mode of
   loccond: assignstatus(checkCAs(b^.charstringfield^.stringfield));
   globcond: begin assignstatus(true) end;
   end;
Hfinal: begin assignnewtop(addnewtop(mkCAs,newtop));
              assignstatus(true) 
        end
end
end;

procedure RegExprule(a:nodeid;b:psnode;mode:surfrulemode);
begin
case a of
Hinit:begin end;
1: case mode of
   loccond: assignstatus(checkRegExp(b^.charstringfield^.stringfield));
   globcond: begin assignstatus(true) end;
   end;
Hfinal: begin assignnewtop(addnewtop(mkRegExp,newtop));
              assignstatus(true) 
        end
end
end;

procedure identrule(a:nodeid;b:psnode;mode:surfrulemode);
begin
case a of
Hinit:begin strstatic1:=' ' end;
1: case mode of
   loccond: assignstatus(true);
   globcond: begin strstatic1:=b^.charstringfield^.stringfield;assignstatus(true) end;
   end;
Hfinal: begin assignnewtop(addnewtop(mkident(strstatic1),newtop));
              assignstatus(true) 
        end
end
end;

begin
case rnr of
1: uttrule(a,b,mode);
2: graphrule(a,b,mode);
3: concgraphrule(a,b,mode);
4: elementarygraphrule(a,b,mode);
5: helpgraphrule(a,b,mode);
6: numberrule(a,b,mode);
7: CAsrule(a,b,mode);
8: RegExprule(a,b,mode);
9: identrule(a,b,mode);
end
end;
