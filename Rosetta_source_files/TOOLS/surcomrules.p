(*MPM:::===================================================================*
 *
 *  Rosetta Project                                                 
 *                                                                  
 *  Module Title    : rules 
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
EXPORT(surcomrules);
pragma C_include('surcomdecl.pf');
pragma C_include('surcomrules.pf');

PROGRAM surcomrules;
WITH surcomdecl;
VAR
    numofhelpgraphs:INTEGER;
    category:SURCOMDECL_string;
    numofconcgraphs:INTEGER;
    numofelementarygraphs:INTEGER;
    graphtype:SURCOMDECL_graphtypetype;
    str:SURCOMDECL_string;

function addnewtop(a:SURCOMDECL_psnode;b:SURCOMDECL_psinglesegmentlist):SURCOMDECL_psinglesegmentlist;
var
   c:SURCOMDECL_psinglesegmentlist;
begin
new(c);
with c^ do
   	begin
   	next:=b;rn:=nil;stree:=a
   	end;
addnewtop:=c
end;

function checknumber(str:SURCOMDECL_string):BOOLEAN;
var result:BOOLEAN;
begin
result:=false;
if (length(str)<3) and (length(str)>0) then
   begin
   if (str[1] in ['1','2','3','4','5','6','7','8','9']) then
   	begin
        if (length(str)=1) or ((length(str)=2) and 
   		(str[2] in ['0','1','2','3','4','5','6','7','8','9'])) then
   			result:=true
        end
   end;
checknumber:=result
end;

function mknumber:SURCOMDECL_psnode;
var s:SURCOMDECL_psnode;
begin
new(s);
s^.cat:=number;
mknumber:=s
end;

function mkCAs:SURCOMDECL_psnode;
var s:SURCOMDECL_psnode;
begin
new(s);
s^.cat:=CAs;
mkCAs:=s
end;

function mkRegExp:SURCOMDECL_psnode;
var s:SURCOMDECL_psnode;
begin
new(s);
s^.cat:=RegExp;
mkRegExp:=s
end;

function mkident(str:SURCOMDECL_string):SURCOMDECL_psnode;
var s:SURCOMDECL_psnode;
begin
new(s);
s^.cat:=ident;
new(s^.identfield);
s^.identfield^.str:=str;
mkident:=s
end;

function mkutt(numofhelpgraphs:INTEGER;category:SURCOMDECL_string):SURCOMDECL_psnode;
var s:SURCOMDECL_psnode;
begin
new(s);
s^.cat:=utt;
new(s^.uttfield);
s^.uttfield^.category:=category;
s^.uttfield^.numofhelpgraphs:=numofhelpgraphs;
mkutt:=s
end;

function mkgraph(numofconcgraphs:INTEGER):SURCOMDECL_psnode;
var s:SURCOMDECL_psnode;
begin
new(s);
s^.cat:=graph;
new(s^.graphfield);
s^.graphfield^.numofconcgraphs:=numofconcgraphs;
mkgraph:=s
end;

function mkconcgraph(numofelementarygraphs:INTEGER):SURCOMDECL_psnode;
var s:SURCOMDECL_psnode;
begin
new(s);
s^.cat:=concgraph;
new(s^.concgraphfield);
s^.concgraphfield^.numofelementarygraphs:=numofelementarygraphs;
mkconcgraph:=s
end;

function mkhelpgraph(str:SURCOMDECL_string):SURCOMDECL_psnode;
var s:SURCOMDECL_psnode;
begin
new(s);
s^.cat:=helpgraph;
new(s^.helpgraphfield);
s^.helpgraphfield^.str:=str;
mkhelpgraph:=s
end;

function mkelementarygraph(graphtype:SURCOMDECL_graphtypetype):SURCOMDECL_psnode;
var s:SURCOMDECL_psnode;
begin
new(s);
s^.cat:=elementarygraph;
new(s^.elementarygraphfield);
s^.elementarygraphfield^.graphtype:=graphtype;
mkelementarygraph:=s
end;

function checkCAs(s:SURCOMDECL_string):BOOLEAN;
var result:BOOLEAN;
begin 
if (s='CONDITIONSANDACTIONS:') OR (s='ConditionsAndActions:') then result:=true else result:=false;
checkCAs:=result
end;

function checkRegExp(s:SURCOMDECL_string):BOOLEAN;
var i:INTEGER;
    result:BOOLEAN;
begin
i:=0;
if (s='REGULAREXPRESSION:') OR (s='RegularExpression:') then result:=true else result:=false;
checkRegExp:=result
end;

procedure SURCOMrules_rule(rnr:INTEGER;a:SURCOMDECL_nodeid;
                              b:SURCOMDECL_psnode;mode:SURCOMDECL_surfrulemode);

procedure uttrule(a:SURCOMDECL_nodeid;b:SURCOMDECL_psnode;mode:SURCOMDECL_surfrulemode);
begin
case a of
SURCOMDECL_Hinit: begin numofhelpgraphs:=0 end;
1: case mode of
   loccond: SURCOMDECL_assignstatus(true);
   globcond: begin SURCOMDECL_assignstatus(true) end;
   end;
2: case mode of
   loccond: SURCOMDECL_assignstatus(true);
   globcond: begin numofhelpgraphs:=numofhelpgraphs+1;SURCOMDECL_assignstatus(true) end;
   end;
3: case mode of
   loccond: SURCOMDECL_assignstatus(true);
   globcond: begin SURCOMDECL_assignstatus(true); category:=b^.identfield^.str end;
   end;
SURCOMDECL_Hfinal: begin SURCOMDECL_assignnewtop(addnewtop(mkutt(numofhelpgraphs,category),SURCOMDECL_newtop));
              SURCOMDECL_assignstatus(true) 
        end
end
end;

procedure graphrule(a:SURCOMDECL_nodeid;b:SURCOMDECL_psnode;mode:SURCOMDECL_surfrulemode);
begin
case a of
SURCOMDECL_Hinit: begin numofconcgraphs:=0 end;
1: case mode of
   loccond: SURCOMDECL_assignstatus(true);
   globcond: begin SURCOMDECL_assignstatus(true) end;
   end;
2: case mode of
   loccond: SURCOMDECL_assignstatus(true);
   globcond: begin numofconcgraphs:=numofconcgraphs+1;SURCOMDECL_assignstatus(true) end;
   end;
SURCOMDECL_Hfinal: begin SURCOMDECL_assignnewtop(addnewtop(mkgraph(numofconcgraphs),SURCOMDECL_newtop));
              SURCOMDECL_assignstatus(true) 
        end
end
end;

procedure concgraphrule(a:SURCOMDECL_nodeid;b:SURCOMDECL_psnode;mode:SURCOMDECL_surfrulemode);
begin
case a of
SURCOMDECL_Hinit: begin numofelementarygraphs:=0 end;
1: case mode of
   loccond: SURCOMDECL_assignstatus(true);
   globcond: begin SURCOMDECL_assignstatus(true) end;
   end;
2: case mode of
   loccond: SURCOMDECL_assignstatus(true);
   globcond: begin numofelementarygraphs:=numofelementarygraphs+1;
                   SURCOMDECL_assignstatus(true) 
             end;
   end;
SURCOMDECL_Hfinal: begin SURCOMDECL_assignnewtop(addnewtop(mkconcgraph(numofelementarygraphs),SURCOMDECL_newtop));
              SURCOMDECL_assignstatus(true) 
        end
end
end;

procedure elementarygraphrule(a:SURCOMDECL_nodeid;b:SURCOMDECL_psnode;mode:SURCOMDECL_surfrulemode);
begin
case a of
SURCOMDECL_Hinit: begin graphtype:=atomgraph end;
1: case mode of
   loccond: SURCOMDECL_assignstatus(true);
   globcond: begin SURCOMDECL_assignstatus(true) end;
   end;
2: case mode of
   loccond: SURCOMDECL_assignstatus(true);
   globcond: begin graphtype:=enclosedgraph; SURCOMDECL_assignstatus(true) end;
   end;
3: case mode of
   loccond: SURCOMDECL_assignstatus(true);
   globcond: begin graphtype:=optgraph; SURCOMDECL_assignstatus(true) end;
   end;
4: case mode of
   loccond: SURCOMDECL_assignstatus(true);
   globcond: begin graphtype:=stargraph; SURCOMDECL_assignstatus(true) end;
   end;
5: case mode of
   loccond: SURCOMDECL_assignstatus(true);
   globcond: begin graphtype:=helpgraphident; SURCOMDECL_assignstatus(true) end;
   end;
6: case mode of
   loccond: SURCOMDECL_assignstatus(true);
   globcond: begin graphtype:=atomgraph; SURCOMDECL_assignstatus(true) end;
   end;
SURCOMDECL_Hfinal: begin SURCOMDECL_assignnewtop(addnewtop(mkelementarygraph(graphtype),SURCOMDECL_newtop));
              SURCOMDECL_assignstatus(true) 
        end
end
end;

procedure helpgraphrule(a:SURCOMDECL_nodeid;b:SURCOMDECL_psnode;mode:SURCOMDECL_surfrulemode);
begin
case a of
SURCOMDECL_Hinit:begin str:=' 'end;
1: case mode of
   loccond: SURCOMDECL_assignstatus(true);
   globcond: begin SURCOMDECL_assignstatus(true) end;
   end;
2: case mode of
   loccond: SURCOMDECL_assignstatus(true);
   globcond: begin str:=b^.identfield^.str;SURCOMDECL_assignstatus(true) end;
   end;
SURCOMDECL_Hfinal: begin SURCOMDECL_assignnewtop(addnewtop(mkhelpgraph(str),SURCOMDECL_newtop));
              SURCOMDECL_assignstatus(true) 
        end
end
end;

procedure numberrule(a:SURCOMDECL_nodeid;b:SURCOMDECL_psnode;mode:SURCOMDECL_surfrulemode);
begin
case a of
SURCOMDECL_Hinit:begin end;
1: case mode of
   loccond: SURCOMDECL_assignstatus(checknumber(b^.charstringfield^.stringfield));
   globcond: begin SURCOMDECL_assignstatus(true) end;
   end;
SURCOMDECL_Hfinal: begin SURCOMDECL_assignnewtop(addnewtop(mknumber,SURCOMDECL_newtop));
              SURCOMDECL_assignstatus(true) 
        end
end
end;

procedure CAsrule(a:SURCOMDECL_nodeid;b:SURCOMDECL_psnode;mode:SURCOMDECL_surfrulemode);
begin
case a of
SURCOMDECL_Hinit:begin end;
1: case mode of
   loccond: SURCOMDECL_assignstatus(checkCAs(b^.charstringfield^.stringfield));
   globcond: begin SURCOMDECL_assignstatus(true) end;
   end;
SURCOMDECL_Hfinal: begin SURCOMDECL_assignnewtop(addnewtop(mkCAs,SURCOMDECL_newtop));
              SURCOMDECL_assignstatus(true) 
        end
end
end;

procedure RegExprule(a:SURCOMDECL_nodeid;b:SURCOMDECL_psnode;mode:SURCOMDECL_surfrulemode);
begin
case a of
SURCOMDECL_Hinit:begin end;
1: case mode of
   loccond: SURCOMDECL_assignstatus(checkRegExp(b^.charstringfield^.stringfield));
   globcond: begin SURCOMDECL_assignstatus(true) end;
   end;
SURCOMDECL_Hfinal: begin SURCOMDECL_assignnewtop(addnewtop(mkRegExp,SURCOMDECL_newtop));
              SURCOMDECL_assignstatus(true) 
        end
end
end;

procedure identrule(a:SURCOMDECL_nodeid;b:SURCOMDECL_psnode;mode:SURCOMDECL_surfrulemode);
begin
case a of
SURCOMDECL_Hinit:begin str:=' ' end;
1: case mode of
   loccond: SURCOMDECL_assignstatus(true);
   globcond: begin str:=b^.charstringfield^.stringfield;SURCOMDECL_assignstatus(true) end;
   end;
SURCOMDECL_Hfinal: begin SURCOMDECL_assignnewtop(addnewtop(mkident(str),SURCOMDECL_newtop));
              SURCOMDECL_assignstatus(true) 
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
