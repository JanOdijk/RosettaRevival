(*MPD:::===================================================================*
 *
 *  Rosetta Project                                                 
 *                                                                  
 *  Module Title    : surfparsimp
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

EXPORT(mrusurcomparser);
pragma C_include('mrusurcomrules.pf');
pragma C_include('mrusurcomgraphdef.pf');
pragma C_include('mrusurcomdecl.pf');
pragma C_include('mrusurcomparser.pf');

PROGRAM mrusurcomparser;

WITH mrusurcomrules,
     mrusurcomgraphdef,
     mrusurcomdecl;

 procedure surfparser(if1 : pconnectionnode; var if2 : plostree);
{*earley constants:} 
const maximumlength = 10000; {*sentence length}
      uttrnr = 1;
      maxrsnodes = 20;
      maxitems=1000;
      maxsetofitems=1000;
      maxlostrees=7500;
      maxlossetofstrees=4000;
      maxlositems=5000; 
      maxlossurfnodes=5000;
      maxlossurfnodelists=4000;
type 
     psurfgraphnodelist = ^surfgraphnodelist;
     plossurfnodelist = ^lossurfnodelist;
     lossurfnodelist = record
				next:plossurfnodelist;
				arg:surfgraphnodelist;
		       end;
     listofsurfnodelists = record
				first:plossurfnodelist;
				last:plossurfnodelist;
			  end;
     pitem = ^item;
     plositem = ^lositem;
     lositem = record
			next:plositem;
			arg:pitem
               end;
     setofstrees =  record
   			j:integer;
			first:plostree;
			last:plostree;
		    end;
     psetofstrees = ^setofstrees;
     plossetofstrees = ^lossetofstrees;
     lossetofstrees = record
				next:plossetofstrees;
				arg:setofstrees;
		      end;
     setofsetofstrees = record
				first:plossetofstrees;
				last:plossetofstrees;
			end;

     setofitems = record
			first:plositem;
			last:plositem
		  end;
     psetofitems = ^setofitems;
     rulerec = record
			rnr:integer;
   			history:listofsurfnodelists;
			completed:boolean;
			nextnodes:surfgraphnodelist;
			nexttops:syntcatset;
			nextcats:syntcatset
	       end;
     item = record
			cat:syntcat;
			adoptedsons:setofsetofstrees;
			minpos:integer;
			curpos:integer;
			parents:psetofitems;
			ruleinfo:rulerec;
			followup:boolean
	    end;
     reltreelist1 = record
			first:prsnode;
			last:prsnode
		   end;
     sentencelength = 0..maximumlength;
     grammarlength = 0..maxrnr;
    
{*end earley types}

{*begin earley global variables:}
var
    i:integer;
    IT:array[0..maximumlength] of setofitems;
    ST:array[0..maximumlength] of setofsetofstrees;
    imax:sentencelength;
    topcats:syntcatset;
    topcat:array[1..maxrnr] of syntcat;
    initialitem:array[1..maxrnr] of pitem;
    libint:integer;
    rsnodememorypointer:integer;
    itemmemorypointer:integer;
    setofitemsmemorypointer:integer;
    lostreememorypointer:integer;
    lossetofstreesmemorypointer:integer;
    lositemmemorypointer:integer;
    lossurfnodememorypointer:integer;
    lossurfnodelistmemorypointer:integer;
    rsnodememory: array[1..maxrsnodes] of rsnode;
    itemmemory: array[1..maxitems] of item;
    setofitemsmemory: array[1..maxsetofitems] 
							of setofitems;
    lostreememory: array[1..maxlostrees] of lostree;
    lossetofstreesmemory: array[1..maxlossetofstrees] 
							of lossetofstrees;
    lositemmemory: array[1..maxlositems] of lositem;
    lossurfnodememory: array[1..maxlossurfnodes] 
							of lossurfgraphnode;
    lossurfnodelistmemory: array[1..maxlossurfnodelists] 
							of lossurfnodelist;
    absent1:psurfgraph;
    newtop1:psinglesegmentlist;
    Sij:setofstrees;
    parentlist:array[1..maxrnr] of psetofitems;
    usedparentlistindices:set of grammarlength;
{*einde earley global variables}
  

{*begin EARLEY algorithme}

{*memory management functions:}
procedure resetrsnodememory;
begin
rsnodememorypointer:=1
end;

procedure newrsnode(var p:prsnode);
begin
new(p)
end;

procedure newsetofitems(var p:psetofitems);
begin
new(p)
end;

procedure newitem(var p:pitem);
begin
new(p)
end;

procedure newlossetofstrees(var p:plossetofstrees);
begin
new(p)
end;

procedure newlostree(var p:plostree);
begin
new(p)
end;

procedure newlositem(var p:plositem);
begin
new(p)
end;

procedure newlossurfnodelist(var p:plossurfnodelist);
begin
new(p)
end;

procedure newlossurfnode(var p:plossurfgraphnode);
begin
new(p)
end;

{*itemlist, treelist and surfgraphnodelist procedures:}

procedure inititemlist(var I1:setofitems);
{*creates the empty set I1}
begin
I1.first:=nil;
I1.last:=nil
end;

procedure takeitem(var item1:pitem;var I1:setofitems);
{*if I1 is not empty, item1 is the first element of I1
 *and this element is removed from I1}

begin
if (I1.first=nil) and (I1.last=nil) then item1:=nil
else
	begin
	item1:=I1.first^.arg;
	if I1.first=I1.last then 
		begin
		I1.first:=nil;I1.last:=nil
		end
	else
		I1.first:=I1.first^.next
	end
end;

procedure appenditemlist(I1:setofitems;var I2:setofitems);
{*if I1 is non-empty, I1 is appended at the end of I2
 *else I2 is not changed.}
begin
if (I2.first=nil) and (I2.last=nil) then
	begin
	I2.first:=I1.first;I2.last:=I1.last
	end
else
	begin
	if (I1.first<>nil) or (I1.last<>nil) then
		begin
		I2.last^.next:=I1.first;
		I2.last:=I1.last
		end
	end
end;

procedure appenditem(item1:pitem;var I2:setofitems);
{*if item1 <> nil, it is appended at the end of I2
 *else I2 is not changed.}
var plositem1:plositem;

begin
if item1<>nil then
	begin
	newlositem(plositem1);
	plositem1^.arg:=item1;
	plositem1^.next:=nil;
	if (I2.first=nil) and (I2.last=nil) then
		begin
		I2.first:=plositem1;I2.last:=plositem1
		end
	else
		begin
			I2.last^.next:=plositem1;
		I2.last:=plositem1
		end
	end
end;

procedure copyitemlist(var I1:setofitems;I2:setofitems);
{*A new set of items I1 is created, with the same elements
 *as I2. So the individual items are not copied!}

begin
I1.first:=I2.first;
I1.last:=I2.last
end;

function stillitems(var I1:setofitems):boolean;
{*is true iff I1 is not empty , i.e. if not 
 *(I1.first=nil }
begin
if (I1.first<>nil) {or (I1.last<>nil)} then stillitems:=true
else stillitems:=false
end;

procedure appenditemtolistandsublist(item1:pitem;var I1,I2:setofitems);
{*appends item to list I1 and to its sublist I2}
begin
appenditem(item1,I1);
I2.last:=I1.last;
if (I2.first = nil) then I2.first:=I2.last
end;

procedure taketree(var stree1:psnode;var S1:setofstrees);
{*if S1 is non-empty its first element becomes the value of 
 *stree1 and is eliminated from the set S1}

begin
if (S1.first=nil) and (S1.last=nil) then stree1:=nil
else
	begin
	stree1:=S1.first^.arg;
	if S1.first=S1.last then 
		begin
		S1.first:=nil;S1.last:=nil
		end
	else
		S1.first:=S1.first^.next
	end
end;

procedure appendtree(stree1:psnode;var S1:setofstrees);
{*appends stree1 at the end! of S1, if stree1 <> nil,
 *else S1 is not changed.}
var plostree1:plostree;

begin
if stree1<>nil then
	begin
	newlostree(plostree1);
	plostree1^.arg:=stree1;
	plostree1^.next:=nil;
	if (S1.first=nil) and (S1.last=nil) then
		begin
		S1.first:=plostree1;S1.last:=plostree1
		end
	else
		begin
		S1.last^.next:=plostree1;
		S1.last:=plostree1
		end
	end
end;

procedure appendtreelist(S1:setofstrees;var S2:setofstrees);
{*if S1 is not empty its content is appended at the end of S2
 *else S2 is not changed.}
begin
if (S2.first=nil) and (S2.last=nil) then
	begin
	S2.first:=S1.first;S2.last:=S1.last
	end
else
	begin
	if (S1.first<>nil) or (S1.last<>nil) then
		begin
		S2.last^.next:=S1.first;
		S2.last:=S1.last
		end
	end
end;

procedure copytreelist(var S1:setofstrees;S2:setofstrees);
{*The set S1 gets the same content as the set S2. The individual
 *strees in the sets are not copied}

begin
S1.first:=S2.first;
S1.last:=S2.last;
end;
	
function stilltrees(var S1:setofstrees):boolean;
{*is true iff S1 is empty, i.e. if not S1^.first=nil.
}
begin
if (S1.first<>nil) {or (S1.last<>nil)} then stilltrees:=true
else stilltrees:=false
end;

procedure inittreelist(var S1:setofstrees);
{*creates an empty set S1}
begin
S1.first:=nil;
S1.last:=nil
end;

procedure initlisttreelist(var L1:setofsetofstrees);
begin
L1.first:=nil;
L1.last:=nil
end;

procedure appendsetofstrees(var S1:setofstrees;var L1:setofsetofstrees);
var plossetofstrees1:plossetofstrees;
begin
if stilltrees(S1) then
	begin
	newlossetofstrees(plossetofstrees1);
	plossetofstrees1^.arg:=S1;
	plossetofstrees1^.next:=nil;
	if L1.first=nil then
		begin
		L1.first:=plossetofstrees1;
		L1.last:=plossetofstrees1
		end
	else
		begin
		L1.last^.next:=plossetofstrees1;
		L1.last:=plossetofstrees1
		end
	end
end;

procedure appendlistoftreelist(L1:setofsetofstrees;var L2:setofsetofstrees);
begin
if L2.first=nil then L2:=L1
else
	begin
	L2.last^.next:=L1.first;
	L2.last:=L1.last
	end
end;

procedure taketreelist(var S1:setofstrees;var L1:setofsetofstrees);
begin
if L1.first=nil then inittreelist(S1)
else
	begin
	S1:=L1.first^.arg;
	if L1.first=L1.last then
		begin
		L1.first:=nil;L1.last:=nil
		end
	else
		L1.first:=L1.first^.next
	end
end;

function stilltreelists(L1:setofsetofstrees):boolean;
begin
if L1.first<>nil then stilltreelists:=true
else stilltreelists:=false
end;

procedure appendnode(node1:psurfgraphnode;var S1:surfgraphnodelist);
{*puts node1 at the end! of S1, if node1 <> nil.}
var plossurfgraphnode1:plossurfgraphnode;

begin
if node1<>nil then
	begin
	newlossurfnode(plossurfgraphnode1);
	plossurfgraphnode1^.arg:=node1;
	plossurfgraphnode1^.next:=nil;
	if (S1.first=nil) and (S1.last=nil) then
		begin
		S1.first:=plossurfgraphnode1;S1.last:=plossurfgraphnode1
		end
	else
		begin
		S1.last^.next:=plossurfgraphnode1;
		S1.last:=plossurfgraphnode1
		end
	end
end;

procedure appendnodelist(S1:surfgraphnodelist;var S2:surfgraphnodelist);
{*if S1 is not empty, its content is appended to the end of S2}

begin
if (S2.first=nil) and (S2.last=nil) then
	begin
	S2.first:=S1.first;S2.last:=S1.last
	end
else
	begin
	if (S1.first<>nil) or (S1.last<>nil) then
		begin
		S2.last^.next:=S1.first;
		S2.last:=S1.last
		end
	end
end;

procedure initnodelist(var S1:surfgraphnodelist);
{*creates an empty list S1}
begin
S1.first:=nil;
S1.last:=nil
end;

function stillnodes(var S1:surfgraphnodelist):boolean;
{*is true iff S1 is empty, i.e. if not S1.first=nil}
begin
if (S1.first<>nil) or (S1.last<>nil) then stillnodes:=true
else stillnodes:=false
end;

procedure takenode(var node1:psurfgraphnode;var S1:surfgraphnodelist);
{*if S1 is not empty, its first element becomes the value of
 *node1 and is eliminated from S1}

begin
if (S1.first=nil) and (S1.last=nil) then node1:=nil
else
	begin
	node1:=S1.first^.arg;
	if S1.first=S1.last then 
		begin
		S1.first:=nil;S1.last:=nil
		end
	else
		S1.first:=S1.first^.next
	end
end;

procedure copynodelist(var S1:surfgraphnodelist;var S2:surfgraphnodelist);

begin
S1.first:=S2.first;
S1.last:=S2.last
end;

procedure initlistnodelist(var L1:listofsurfnodelists);
begin
L1.first:=nil;
L1.last:=nil
end;

procedure appendsurfnodelist(var S1:surfgraphnodelist;
						var L1:listofsurfnodelists);
var plossurfnodelist1:plossurfnodelist;
begin
if stillnodes(S1) then
	begin
	newlossurfnodelist(plossurfnodelist1);
	plossurfnodelist1^.arg:=S1;
	plossurfnodelist1^.next:=nil;
	if L1.first=nil then
		begin
		L1.first:=plossurfnodelist1;
		L1.last:=plossurfnodelist1
		end
	else
		begin
		L1.last^.next:=plossurfnodelist1;
		L1.last:=plossurfnodelist1
		end
	end
end;

procedure appendlistofnodelist(L1:listofsurfnodelists;
						var L2:listofsurfnodelists);
begin
if L2.first=nil then L2:=L1
else
	begin
	L2.last^.next:=L1.first;
	L2.last:=L1.last
	end
end;

procedure takenodelist(var S1:surfgraphnodelist;var L1:listofsurfnodelists);
begin
if L1.first=nil then initnodelist(S1)
else
	begin
	S1:=L1.first^.arg;
	if L1.first=L1.last then
		begin
		L1.first:=nil;L1.last:=nil
		end
	else
		L1.first:=L1.first^.next
	end
end;

function stillnodelists(L1:listofsurfnodelists):boolean;
begin
if L1.first<>nil then stillnodelists:=true
else stillnodelists:=false
end;
	
procedure initreltreelist(var RT1:reltreelist1);
begin
RT1.first:=nil;
RT1.last:=nil
end;

procedure appendreltree(stree1:psnode;var RT1:reltreelist1);
var prsnode1:prsnode;
begin
newrsnode(prsnode1);
prsnode1^.node:=stree1;
prsnode1^.brother:=nil;
if (RT1.first=nil) and (RT1.last=nil) then
	begin
	RT1.first:=prsnode1;RT1.last:=prsnode1
	end
else
	begin
	RT1.last^.brother:=prsnode1;
	RT1.last:=prsnode1
	end;
end;
{*tree matrix functions:}
procedure readS(i,j:integer;var S1:setofstrees);
var 
    STi:setofsetofstrees;
    existentry_ij:boolean;
begin
STi:=ST[i];
existentry_ij:=false;
while stilltreelists(STi) and not(existentry_ij) do
   begin
   taketreelist(S1,STi);
   if S1.j = j then existentry_ij:=true
   end;
if not(existentry_ij) then 
   begin
   S1.first:=nil;
   S1.last:=nil
   end
end;

procedure writeS(i,j:integer;S1:setofstrees);
var setofstrees1:setofstrees;
    p:psetofstrees;
    STi:setofsetofstrees;
    existentry_ij:boolean;
begin
STi:=ST[i];
initlisttreelist(ST[i]);
existentry_ij:=false;
while stilltreelists(STi) and not(existentry_ij) do
   begin
   taketreelist(setofstrees1,STi);
   if setofstrees1.j = j then 
   	begin
   	existentry_ij:=true;
        setofstrees1:=S1
   	end;
   appendsetofstrees(setofstrees1,ST[i])
   end;
if not(existentry_ij) then 
   begin
   new(p);p^:=S1;
   p^.j:=j;
   appendsetofstrees(p^,ST[i])
   end
end;


{*surface rule and graph manipulating procedures:}


procedure searchgraph(graph1:psurfgraph;var node1:psurfgraphnode;
		var completed1:boolean;var nextnodes1:surfgraphnodelist;
                var nexttops1:syntcatset;var nextcats1:syntcatset);
{*searches the binary surfgraph graph1 starting at node1. All paths are 
 *investigated until a node with a non-empty category is encountered. All such 
 *nodes are collected in nextnodes1, their categories in nextcats1, and the 
 *intersection of nextcats1 and the global topcats in the variable nexttops1. 
 *The boolean completed1 signals wether the end of the surfgraph was seen.}

var nextnodes2:surfgraphnodelist;
    result1,result2,result3,result4:syntcatset;
    node2:psurfgraphnode;
    cat1:syntcat;
    completed2:boolean;


begin
initnodelist(nextnodes2);result1:=[];result2:=[];completed2:=false;
result4:=[];result3:=[];completed1:=false;nexttops1:=[];nextcats1:=[];
if (node1=nil) and (graph1^.first^.cat<>nil) then
	begin
	node2:=graph1^.first;
	appendnode(node2,nextnodes1);
	nextcats1:=[node2^.cat^];
	if node2^.cat^ in topcats then nexttops1:=nextcats1;
	if node2=graph1^.last then completed1:=true	
	end
else
  begin
  if node1=nil then node1:=graph1^.first;
  node2:=node1^.left;
  if node2<>nil then
	begin
	if (node2^.cat = nil) and (node2<>graph1^.last) then
	searchgraph(graph1,node2,completed1,nextnodes1,result2,result1)
	else    
		begin
		if node2 = graph1^.last then completed1:=true
		else
			begin
			cat1:=node2^.cat^;
			appendnode(node2,nextnodes1);
			result1:=[cat1];
			if cat1 in topcats then result2:=[cat1]
			end
		end
	end;
  node2:=node1^.right;
  if node2<>nil then
	begin
	if (node2^.cat = nil) and (node2<>graph1^.last)then
	searchgraph(graph1,node2,completed2,nextnodes2,result4,result3)
	else
		begin
		if node2 = graph1^.last then completed2:=true
		else
			begin
			cat1:=node2^.cat^;
			appendnode(node2,nextnodes2);
			result3:=[cat1];
			if cat1 in topcats then result4:=[cat1]
			end
		end
	end;
  appendnodelist(nextnodes2,nextnodes1);
  nextcats1:=result1+result3;
  nexttops1:=result2+result4;
  if completed2 then completed1:=true
  end
end;


procedure searchorread(graph1:psurfgraph;node2:psurfgraphnode;
		var completed1:boolean;var nextnodes1:surfgraphnodelist;
		var nexttops1:syntcatset;var nextcats1:syntcatset);
var node1:psurfgraphnode;
begin
if (node2=nil) and (graph1^.first^.cat<>nil) then
searchgraph(graph1,node2,completed1,nextnodes1,nexttops1,nextcats1)
else
	begin
	if node2=nil then node1:=graph1^.first
	else node1:=node2;
	if node1^.alreadysearched then
		begin
		nextnodes1:=node1^.nextnodes;
		completed1:=node1^.completed;
		nexttops1:=node1^.nexttops;
		nextcats1:=node1^.nextcats	
		end
	else
		begin
		searchgraph(graph1,node1,completed1,nextnodes1,nexttops1,
								nextcats1);
		node1^.nextnodes:=nextnodes1;
		node1^.nextcats:=nextcats1;
		node1^.nexttops:=nexttops1;
		node1^.completed:=completed1;
		node1^.alreadysearched:=true
		end
	end
end;

{* elementary item manipulating functions:}

function init(rnr1:integer;i:integer):pitem;
{*creates a new item, with item.rnr=rnr1 and curpos=minpos=i}
var item1:pitem;
begin
newitem(item1);
with item1^ do
	begin
	cat:=topcat[rnr1];
  	initlisttreelist(adoptedsons);
	minpos:=i;
	curpos:=i;
	parents:=nil;
	if rnr1=uttrnr then 
		begin
		newsetofitems(parents);inititemlist(parents^)
		end;
	followup:=false
	end;
with item1^.ruleinfo do
	begin
	rnr:=rnr1;
	initlistnodelist(history);
	initnodelist(nextnodes);
	searchorread(surfgraph(rnr),nil,completed,
					nextnodes,nexttops,nextcats);
	completed:=false{*for security,to exclude empty rules}
	end;
init:=item1
end;

procedure copyitem(var item1:pitem;item2:pitem);
{*A new item item1 is created with identical fields as those
 *of item2}
var item3:pitem;
begin
newitem(item3);
with item3^ do 
	begin
  	initlisttreelist(adoptedsons);
  	cat:=item2^.cat;
	initlisttreelist(adoptedsons);
  	minpos:=item2^.minpos;curpos:=item2^.curpos;
  	parents:=item2^.parents;
        followup:=item2^.followup;
	with ruleinfo do
		begin
		rnr:=item2^.ruleinfo.rnr;
		initlistnodelist(history);
    		completed:=item2^.ruleinfo.completed;
		initnodelist(nextnodes);
    		nexttops:=item2^.ruleinfo.nexttops;
    		nextcats:=item2^.ruleinfo.nextcats
    		end
	end;
item1:=item3
end;

function sameitem(var item1:pitem;minpos:integer;node1:psurfgraphnode;
							IT:setofitems):boolean;

var I1:setofitems;
    sameitemfound:boolean;
begin
I1:=IT;
sameitemfound:=false;
while (stillitems(I1) and (sameitemfound=false)) do
	begin
	takeitem(item1,I1);
	if (item1^.minpos=minpos) and 
	(item1^.ruleinfo.history.first^.arg.first^.arg=node1) then
	sameitemfound:=true
	end;
if sameitemfound then sameitem:=true else
	begin
	sameitem:=false;
	item1:=nil
	end
end;

function local(item1:pitem;stree1:psnode;IT:setofitems):setofitems;
{*tries to make item1 adopt stree1. The function yields a possibly
 *empty set of items resulting from successful attempts. Only local
 *conditions, involving stree attributes are checked. Ruleinfo is
 *adjusted.}

var nextnodes1:surfgraphnodelist;
    node1:psurfgraphnode;
    result:setofitems;
    rnr:integer;

function localsurfrule(item1:pitem;stree1:psnode;node1:psurfgraphnode):pitem;
var item2,item3,item4:pitem;
    n:nodeid;
    rnr,rnr2:integer;
    parents1:setofitems;
    rnrset:array[0..maxrnr] of boolean;
    adoptedsons1,adoptedsons2:setofsetofstrees;
    setofstrees1,setofstrees2:setofstrees;
    history1,history2:listofsurfnodelists;
    surfgraphnodelist1,surfgraphnodelist2:surfgraphnodelist;

begin
assignstatus(false);
n:=node1^.n;
rnr:=item1^.ruleinfo.rnr;
if debug then write('->localsurfrule',rnr,'  idnr:',n);
surfrule(rnr,n,stree1,loccond);
if status then
	begin
	if debug then writeln('status true');
	if item1^.minpos=item1^.curpos then
		{*mark parents of initial items}
		begin
		rnr2:=0;
		while rnr2<>maxrnr do
			begin
			rnr2:=rnr2+1;
			rnrset[rnr2]:=false
			end;
		copyitemlist(parents1,item1^.parents^);
		while stillitems(parents1) do
			begin
			takeitem(item3,parents1);
			rnr2:=item3^.ruleinfo.rnr;
			if rnrset[rnr2]=false then
				begin
                                if item1^.minpos=item3^.minpos then
   					begin
   	 				item3^.followup:=true;
					rnrset[rnr2]:=true
   					end;
				if item1^.minpos=item3^.minpos then
   					appenditemlist(item3^.parents^,parents1)
				end
			end
		end;
	adoptedsons1:=item1^.adoptedsons;
	initlisttreelist(adoptedsons2);
	if stilltreelists(adoptedsons1) then
		begin
		while stilltreelists(adoptedsons1) do
			begin
			inittreelist(setofstrees1);
			appendtree(stree1,setofstrees1);
			taketreelist(setofstrees2,adoptedsons1);
			appendtreelist(setofstrees2,setofstrees1);
			appendsetofstrees(setofstrees1,adoptedsons2)
			end
		end
	else 
		begin
		inittreelist(setofstrees1);
		appendtree(stree1,setofstrees1);
		appendsetofstrees(setofstrees1,adoptedsons2)
		end;
	history1:=item1^.ruleinfo.history;
	initlistnodelist(history2);
	if stillnodelists(history1) then
		begin
	        while stillnodelists(history1) do
			begin
			initnodelist(surfgraphnodelist1);
			appendnode(node1,surfgraphnodelist1);
			takenodelist(surfgraphnodelist2,history1);
			appendnodelist(surfgraphnodelist2,surfgraphnodelist1);
			appendsurfnodelist(surfgraphnodelist1,history2)
			end
		end
	else 
		begin
		initnodelist(surfgraphnodelist1);
		appendnode(node1,surfgraphnodelist1);
		appendsurfnodelist(surfgraphnodelist1,history2)
		end;
	if sameitem(item4,item1^.minpos,node1,IT)=false then
		begin
		copyitem(item2,item1);
		item2^.adoptedsons:=adoptedsons2;
		with item2^.ruleinfo do 
			begin
			history:=history2;
			initnodelist(nextnodes);
			searchorread(surfgraph(rnr),node1,
        			completed,nextnodes,nexttops,nextcats)
			end;
		item2^.followup:=false;
		item2^.curpos:=stree1^.maxpos;
		localsurfrule:=item2
		end
	else
		begin
		appendlistoftreelist(adoptedsons2,item4^.adoptedsons);
		appendlistofnodelist(history2,item4^.ruleinfo.history);
		localsurfrule:=nil
		end
	end
else begin localsurfrule:=nil; if debug then writeln('status false') end
end;

begin{local}
if debug then writeln('->local',item1^.ruleinfo.rnr,'  minpos:',item1^.minpos);
inititemlist(result);
if stree1^.cat in item1^.ruleinfo.nextcats then
	begin
	copynodelist(nextnodes1,item1^.ruleinfo.nextnodes);
	while stillnodes(nextnodes1) do
		begin
		takenode(node1,nextnodes1);
		if node1^.cat^ = stree1^.cat then 
                appenditem(localsurfrule(item1,stree1,node1),result)
		end;
	rnr:=0;
	while rnr<>maxrnr do
		begin
		rnr:=rnr+1;
		if initialitem[rnr]^.followup then
		initialitem[rnr]:=init(rnr,i)
		end

	end;
local:=result
end;

function final(item1:pitem):setofstrees;
var 
    node1:psurfgraphnode;
    surfgraphnodelist1:surfgraphnodelist;
    result:setofstrees;
    stree1:psnode;
    setofstrees1:setofstrees;
    rnr:integer;
    nsons,minpos,maxpos:integer;
    RT1:reltreelist1;
    adoptedsons1:setofsetofstrees;
    history1:listofsurfnodelists;

function finalsurfrule(RT1:reltreelist1;nsons:integer;minpos1:integer;
					maxpos1:integer):setofstrees;
var S1:setofstrees;
    stree1:psnode;

procedure saversnodes(var RT:reltreelist1);
var prsnode1,prsnode2,prsnode3:prsnode;

begin
prsnode1:=RT.first;
new(prsnode2);prsnode2^:=prsnode1^;
RT.first:=prsnode2;
while prsnode1<>RT.last do
	begin
	{*prsnode1 scans the original list;prsnode2 is the last copied one;
	 *prsnode3 the new copy}
	prsnode1:=prsnode1^.brother;
	new(prsnode3);prsnode3^:=prsnode1^;
	prsnode2^.brother:=prsnode3;
	prsnode2:=prsnode3
	end
end;

begin
if debug then writeln('->finalsurfrule');
assignstatus(false);
assignnewtop(nil);
inittreelist(S1);
surfrule(rnr,Hfinal,nil,globcond);
if status then
	begin
	saversnodes(RT1);
	while newtop<>nil do
		begin
                newtop1:=newtop;
		stree1:=newtop1^.stree;
		stree1^.minpos:=minpos1;
		stree1^.maxpos:=maxpos1;
		stree1^.sonlist:=RT1.first;
		stree1^.n:=nsons;
		appendtree(stree1,S1);
		assignnewtop(newtop1^.next)
		end
	end;
finalsurfrule:=S1
end;

procedure globalsurfrule(var setofstrees1:setofstrees;
		var surfgraphnodelist1:surfgraphnodelist;var RT1:reltreelist1;
							    var nsons:integer);
var stree1:psnode;
    node1:psurfgraphnode;
begin
if debug then writeln('->globalsurfrule');
while stilltrees(setofstrees1) do
	begin
	taketree(stree1,setofstrees1);
	takenode(node1,surfgraphnodelist1);
	globalsurfrule(setofstrees1,surfgraphnodelist1,RT1,
							nsons);
	if status then
		begin
		assignstatus(false);
		surfrule(rnr,node1^.n,stree1,globcond);
		nsons:=nsons+1;
		appendreltree(stree1,RT1)
		end
	end
end;


begin{final}
if debug then write('->final',item1^.ruleinfo.rnr);
inittreelist(result);
if item1^.ruleinfo.completed then
	begin
	adoptedsons1:=item1^.adoptedsons;
	history1:=item1^.ruleinfo.history;
	{*history and adoptedsons are assumed to match}
	while stilltreelists(adoptedsons1) do
		begin
		initreltreelist(RT1);
		resetrsnodememory;
		taketreelist(setofstrees1,adoptedsons1);
		takenodelist(surfgraphnodelist1,history1);
		rnr:=item1^.ruleinfo.rnr;
		surfrule(rnr,Hinit,nil,globcond);
		nsons:=0;
		assignstatus(true);
		minpos:=item1^.minpos;
		maxpos:=item1^.curpos;
		globalsurfrule(setofstrees1,surfgraphnodelist1,RT1,nsons);
		if status then
			begin
			if debug then writeln('status true');
			appendtreelist(finalsurfrule(RT1,nsons,minpos,maxpos),
									result)
			end
		end
	end;
if stilltrees(result)=false then if debug then writeln('status false');
final:=result
end;

{*procedures used in main body:}

procedure predict(i:integer);
{*precondition: IT[i] is a non-empty list of items
}
var
  item1,item2:pitem;
  I1:setofitems;

{*procedures manipulating the array parentlist:}

procedure initparentlist;
var rnr:integer;
begin
rnr:=0;
while rnr<>maxrnr do
	begin
	rnr:=rnr+1;
	if rnr in usedparentlistindices then 
   		begin
   		newsetofitems(parentlist[rnr]);
         	inititemlist(parentlist[rnr]^)
                end
	end;
usedparentlistindices:=[]
end;

procedure addchildren(var item1:pitem);
var rnr:integer;
    item2:pitem;
begin
rnr:=0;
while rnr<>maxrnr do
	begin
	rnr:=rnr+1;
	if (topcat[rnr] in item1^.ruleinfo.nexttops) then
		begin
		appenditem(item1,parentlist[rnr]^);
		if (parentlist[rnr]^.first=parentlist[rnr]^.last) and 
                   (parentlist[rnr]^.first<>nil) then
			begin
			item2:=initialitem[rnr];
			item2^.minpos:=i;
			item2^.curpos:=i;
			item2^.parents:=parentlist[rnr];
                        usedparentlistindices:=usedparentlistindices + [rnr];
			appenditemtolistandsublist(item2,IT[i],I1)
			end
		end
	end
end;

begin {predict}
copyitemlist(I1,IT[i]);
initparentlist;
{*parentlist[rnr] is empty for all rnr
}
while stillitems(I1) do    
	begin
	takeitem(item1,I1);
	{*item1 has been removed out of I1
	}
	addchildren(item1)
	{*parentlist[rnr] contains item1 iff the rule with number rnr
	 *has category in nexttops(item1); if item1 is the only element
	 *of parentlist[rnr] for some rnr, new items for these have been
	 *created and are added to I1 and IT[i]
	}
	end{while};
{*parentlist[rnr] contains an item of IT[i] iff the rule with number
 *rnr has category in nexttops(item). To each non-empty parentlist[rnr]
 *corresponds an (new) item in IT[i] with minpos=i.
 *
 *postcondition:IT[i] contains all items with curpos=minpos=i.
}
end;

procedure scan(var {*}{vanwege foutmelding} i:integer);
{*precondition:IT[i] is a non-empty set of items 
}
var
  item1:pitem;
  stree1:psnode;
  S1:setofstrees;
  I1:setofitems;
  m:integer;
  Sij:setofstrees;
  setofSij:setofsetofstrees;

begin
m:=i;
setofSij:=ST[i];
while stilltreelists(setofSij) do
	begin
	{m:=m+1;}
   	taketreelist(Sij,setofSij);
        m:=Sij.j;
        {readS(i,m,Sij);}
	copytreelist(S1,Sij);
	while stilltrees(S1) do
		begin
		taketree(stree1,S1);
	        {*stree1 has been removed from S1
		}
		if debug then writeln('tree scanned');
		copyitemlist(I1,IT[i]);
             {*}if not(stillitems(I1)) then 
   	     {*}begin
             {*}{signalerror(i);}
             {*}if stree1^.cat = charstring then
           begin
           writeln('could not recognize ',stree1^.charstringfield^.stringfield);
           writeln('ERROR near line',stree1^.charstringfield^.linenumber:5)
           end;
             {*}while i<>imax-1 do
             {*}   begin
             {*}   i:=i+1;
             {*}   readS(i,i+1,Sij);
             {*}   taketree(stree1,Sij);
   	     {*}   if (stree1^.cat = charstring) and (i< m+6) then 
           begin
           writeln('could not recognize ',stree1^.charstringfield^.stringfield);
           writeln('      near line',stree1^.charstringfield^.linenumber:5)
           end
             {*}   
             {*}   end
   	     {*}end;
   	     {*}
		while stillitems(I1) do
			begin
			takeitem(item1,I1);
			{*item1 has been removed from I1
			}
			appenditemlist(local(item1,stree1,IT[m]),IT[m])
		        {*the result of local(item1,stree1) has been added to 
                        IT[m]}
			end{while}
		end{while}
	end{while}
{*postcondition:IT[m] contains all items that resulted by adoption of an stree 
 *from S[i,m] by an item in IT[i], for all m: i<m<=imax.
}
end;


procedure complete(i:integer);
{*precondition:IT[i] is a non-empty set of items
}
var
  I1,I2:setofitems;
  S1:setofstrees;
  item1,item2,item3:pitem;
  stree1:psnode;
  afterlastoriginalitem:boolean;
  p,q:plositem;
  Sij:setofstrees;
begin
copyitemlist(I1,IT[i]);
p:=IT[i].last;
afterlastoriginalitem:=false;
while stillitems(I1) do
        {*I1 contains all items of IT[i] not yet investigated for stree
	 *stree generation}
	begin
	q:=I1.first;
	takeitem(item1,I1);
	copytreelist(S1,final(item1));
	{*if item1 is a completed item, S1 contains the strees that could
	 *be generated from it}
	if afterlastoriginalitem then
		begin
		if sameitem(item3,item1^.minpos,
		    item1^.ruleinfo.history.first^.arg.first^.arg,IT[i]) then
			begin
			appendlistoftreelist(item1^.adoptedsons,
							item3^.adoptedsons);
			appendlistofnodelist(item1^.ruleinfo.history,
						      item3^.ruleinfo.history)
			end
		else appenditem(item1,IT[i])
		end;
	if p=q then afterlastoriginalitem:=true;
 	while stilltrees(S1) do
		begin
		taketree(stree1,S1);
		if debug then 
		writeln('created stree tried for completion,cat:',ord(stree1^.cat));
		copyitemlist(I2,item1^.parents^);
		while stillitems(I2) do
			begin
			takeitem(item2,I2);
			if debug then 
			writeln('parent number',item2^.ruleinfo.rnr);
			appenditemlist(local(item2,stree1,I1),I1)
			{*I1 contains the result of the adoption of stree1
			 *by one of its 'parent items' item2.}
			end{while};
                readS(stree1^.minpos,i,Sij);
		appendtree(stree1,Sij);
   		writeS(stree1^.minpos,i,Sij);
		{*the generated stree1 has been made element of S[k,i], for
		 *corresponding k.}
		end{while}
	{*I1 contains the result of the adoption trials of strees 
         *coming from item1 by items in item1.parents. (These are the 
	 *only elements of I which can possibly adopt these trees)}
	end{while}
{*postcondition:For all k>i, S[k,i] contains all strees generatable from IT[i].
 *		IT[i] contains all items resulting from adoption of a new
 *		element of S[k,i] by an item in IT[k].
}
end;

procedure initializetrees(var imax:sentencelength);
var list1:psinglesegmentlist;
    i,j:integer;
    stree1:psnode;
    connode1,connode2:pconnectionnode;
    Sij:setofstrees;
begin
lostreememorypointer:=1;
lossetofstreesmemorypointer:=1;
imax:=0;
if if1<>nil then
   begin
   connode1:=if1;
   connode2:=if1^.prev;
   while connode1<>connode2 do
	begin
	imax:=imax+1;
	connode1^.idnr:=imax;
	connode1:=connode1^.next
	end;
   imax:=imax+1;
   connode2^.idnr:=imax
   end;
if if1=nil then imax:=1;
i:=0;
if debug then writeln('imax determined:',imax); 
while i<>imax do
	begin
	{j:=i;
	while j<>imax do
		begin
		j:=j+1;
		inittreelist(S[i,j])
		end;}
        initlisttreelist(ST[i]);
	i:=i+1
	end;
if if1<>nil then
   begin
   connode1:=if1;
   while connode1<>connode2 do
	begin
	list1:=connode1^.list;
	while list1<>nil do
		begin
		stree1:=list1^.stree;
		i:=connode1^.idnr-1;
		j:=list1^.rn^.idnr-1;
		stree1^.minpos:=i;stree1^.maxpos:=j;
                if debug then writeln('input i,j:',i,j,'cat:',ord(stree1^.cat));
   		{*}if debug then 
     		    begin
     		    if stree1^.cat=charstring then 
     		    writeln('charstring=',stree1^.charstringfield^.stringfield);
                    end;
                readS(i,j,Sij);
		appendtree(stree1,Sij);
                writeS(i,j,Sij);
		list1:=list1^.next
		end;
	connode1:=connode1^.next
	end;
   	list1:=connode2^.list;
   	while list1<>nil do
		begin
		stree1:=list1^.stree;
		i:=connode2^.idnr-1;
		stree1^.minpos:=i;stree1^.maxpos:=imax;
                if debug then writeln('input i,j:',i,imax,'cat:',ord(stree1^.cat));
   		{*}if debug then 
   		    begin
   	            if stree1^.cat=charstring then 
   		    writeln('charstring=',stree1^.charstringfield^.stringfield);
                    end;
                readS(i,imax,Sij);
		appendtree(stree1,Sij);
                writeS(i,imax,Sij);
		list1:=list1^.next
		end
   end
end;

procedure initializeitems(imax:sentencelength);
var i,rnr:integer;

begin
itemmemorypointer:=1;
setofitemsmemorypointer:=1;
lossurfnodelistmemorypointer:=1;
lositemmemorypointer:=1;
lossurfnodememorypointer:=1;
new(absent1);assignabsent(absent1);
i:=0;
usedparentlistindices:=[];
while i<>maxrnr do
   begin
   i:=i+1;
   usedparentlistindices:=usedparentlistindices + [i];
   end;
{initialize topcats and topcat[i]}
topcats:=[utt,graph,concgraph,elementarygraph,helpgraph,number,CAs,RegExp,
         ident];
topcat[1]:=utt;
topcat[2]:=graph;
topcat[3]:=concgraph;
topcat[4]:=elementarygraph;
topcat[5]:=helpgraph;
topcat[6]:=number;
topcat[7]:=CAs;
topcat[8]:=RegExp;
topcat[9]:=ident;
i:=-1;
while i<>imax do
	begin
	i:=i+1;
	inititemlist(IT[i])
 	end;
i:=0;
while i<>maxrnr do
	begin
	i:=i+1;
	SFG(i)
	end;
i:=0;
rnr:=0;
while rnr<>maxrnr do
	begin
	rnr:=rnr+1;
	initialitem[rnr]:=init(rnr,i)
	end
end;

procedure extractresults(var S1:setofstrees);
var stree1:psnode;
    p:plostree;
begin
if2:=nil;
while stilltrees(S1) do
	begin
	taketree(stree1,S1);
	if stree1^.cat = utt then 
		begin
		new(p);
		p^.next:=if2;p^.arg:=stree1;
		if2:=p	
		end
	end
end;


{*main body}

begin
{*precondition: input=set of all strees such that the minimum value of all
 *stree.minpos is 0 and the maximum value of all stree.maxpos is imax, and
 *imax<=maximumlength.
 *For each i: 0<i<imax there is at least one stree such that stree.minpos
 *<i<=stree.maxpos.
}
initializetrees(imax);
{*for all i,j: 0<=i,j<=imax, S[i,j] contains all covering strees in input
}
if debug then writeln('trees initialized');
initializeitems(imax);
if debug then writeln('items initialized');
{*for all i: 0<=i<=imax, IT[i] = empty.
}
appenditem(initialitem[uttrnr],IT[0]); {uttrnr is rule number of rule with top 
								category utt}
i:=0;
while i <> imax do
	begin
	if debug then writeln(i);
        {*For all m>=i,j<i, IT[m] contains all possible items with curpos=m 
	 *which can be generated by adoption of an stree in S[j,m], by an
	 *item in IT[j].
         *For all 0<=k<i, S[k,i] contains all covering strees generatable from
	 *IT[i], and those from the input. For m>i, S[k,m] contains only input
         *strees.
         *It follows that IT[i] contains all items with minpos<i.
        }
	predict(i);
	{*IT[i] contains all items with minpos<=i
	}
	scan(i);
	{*For all m>i,j<=i, IT[m] contains all items which can be generated by 
         *adoption of an stree in S[j,m] by an item in IT[j].
        }
	i:=i+1;
	{*For all m>=i,j<i IT[m] contains all items, that can be generated by
         *adoption of an stree in S[j,m] by an item in IT[j].
         *S[k,i] contains only input strees.
        } 
	complete(i)
	end{while};

{*postcondition:S[0,imax] contains all covering strees with stree.cat=utt, 
 *stree.minpos=0 and stree.maxpos=imax
}
readS(0,imax,Sij);
extractresults(Sij);
end;{surfparser} 

