(*MPD:::===================================================================*
 *
 *  Rosetta Project                                                 
 *                                                                  
 *  Module Title    : SURFPARSER
 *  Creation date   :                                               
 *  Author          : R. Leermakers
 *                                                                  
 *  Copyright (c) 1985, by Nederlandse Philips Bedrijven BV.        
 *                                                                  
 *  Remarks         :  
 *
 *EMP:::===================================================================*)

pragma C_Include('strings.pf');
Export(SURFPARSER);
pragma C_Include('listree.pf');
pragma C_Include('drawstree.pf');
pragma C_Include('lidomaint.pf');
pragma C_Include('interfaces.pf');
pragma C_Include('interface1.pf');
pragma C_Include('interface2.pf');
pragma C_Include('surfrules.pf');
pragma C_Include('ldsurfswitch.pf');
pragma C_Include('surfrulesgraphs.pf');
pragma C_Include('liprims.pf');
pragma C_Include('ldprims.pf');
pragma C_Include('mem.pf');
pragma C_Include('awhere.pf');
pragma C_Include('alayout.pf');
pragma C_Include('debug.pf');
pragma C_Include('ldtypetostr.pf');
pragma C_Include('ldcatsets.pf');
pragma C_Include('ldequal.pf');
pragma C_Include('ldmeasuresize.pf');
pragma C_Include('items.pf');
pragma C_Include('surfparser.pf');
pragma C_Include('str.pf');


(*=========================================================================*
 *  Imported modules
 *=========================================================================*)
WITH 
         LISTREE,
         STR,
         DRAWSTREE,
         LIDOMAINT,
         INTERFACES,
         INTERFACE1,
         INTERFACE2,
         SURFRULES,
         LDSURFSWITCH,
         SURFRULESGRAPHS,
         LIPRIMS,
         LDPRIMS,
         MEM,
         AWHERE,
         ALAYOUT,
         DEBUG,
         LDTYPETOSTR,
         LDCATSETS,
         LDEQUAL,
         LDMEASURESIZE,
         ITEMS;

PROGRAM SURFPARSER;

FUNCTION SURFPARSER_Body(interf: Interfaces_IfDescr)
                  : Interfaces_IfDescr;
{*earley constants:} 
const maximumlength = 30; {*sentence length}
      maxrsnodes = 1;
      maxitems=1;
      maxsetofitems=1;
      maxlostrees=1;
      maxlossetofstrees=1;
      maxlositems=1; 
      maxlossurfnodes=1;
      maxlossurfnodelists=1;
TYPE 
     sentencelength = 0..maximumlength;
     reltreelist1 = record first,last:LISTREE_pRelNode
                    end;
{*begin earley global variables:}
VAR uttrnr:INTEGER; ch:CHAR; 
    nocontextconditions:BOOLEAN;
    recordsize:INTEGER;
    memstack,rsmemstack :MEM_stack;
    topdefstackptr,defstackptr,rsstackptr: MEM_Stackptr;
    i:INTEGER;
    IT:array[0..maximumlength] OF ITEMS_setofitems;
    ST:array[0..maximumlength] OF LISTREE_SetOfSetOfStrees;
    imax:sentencelength;
    topcats:LIPRIMS_syntcatset;
    clockint1,clockint2:INTEGER;
    rsnodememorypointer:INTEGER;
    itemmemorypointer:INTEGER;
    setofitemsmemorypointer:INTEGER;
    lostreememorypointer:INTEGER;
    lossetofstreesmemorypointer:INTEGER;
    lositemmemorypointer:INTEGER;
    lossurfnodememorypointer:INTEGER;
    lossurfnodelistmemorypointer:INTEGER;
    rsnodememory:{[automatic,volatile]} array[1..maxrsnodes] OF LISTREE_RelNode;
    itemmemory:{[automatic,volatile]} array[1..maxitems] OF ITEMS_item;
    setofitemsmemory:{[automatic,volatile]} array[1..maxsetofitems] 
							OF ITEMS_setofitems;
    lostreememory:{[automatic,volatile]} array[1..maxlostrees] OF LISTREE_LoStree;
    lossetofstreesmemory:{[automatic,volatile]} array[1..maxlossetofstrees] 
					      OF LISTREE_lossetofstrees;
    lositemmemory:{[automatic,volatile]} array[1..maxlositems] OF ITEMS_lositem;
    lossurfnodememory:{[automatic,volatile]} array[1..maxlossurfnodes] 
							OF LIPRIMS_lossurfgraphnode;
    lossurfnodelistmemory:{[automatic,volatile]} array[1..maxlossurfnodelists] 
					OF LIPRIMS_lossurfnodelist;
    absent1:LIPRIMS_psurfgraph;
    newtop1:LISTREE_pLoStree;
    Sij:LISTREE_setofstrees;
    tempif1,
    if1 : INTERFACE1_pRowSeqSegmKeys; 
    if2 : Interface2_SetOfStrees;
    ifout:Interfaces_IfDescr;

{*einde earley global variables}
  

{*begin EARLEY algorithme}
{*memory management functions:}
procedure resetrsnodememory;
begin
Mem_Release(rsmemstack,rsstackptr);
Mem_Mark(rsmemstack,rsstackptr);
rsnodememorypointer:=1
end;

procedure newdefrsnode(var p:LISTREE_pRelNode);
begin
LISTREE_makerelnode(p);
end;

procedure newrsnode(var p:LISTREE_pRelNode);
begin {
if rsnodememorypointer<=maxrsnodes then
	begin
	p:=address(rsnodememory[rsnodememorypointer]);
	rsnodememorypointer:=rsnodememorypointer+1
	end
else} MEM_new(rsmemstack,Loopholes.SIZEof(LISTREE_relnode),
                         Loopholes.Retype(p,MEM_ptr));
end;

procedure newsetofitems(var p:ITEMS_psetofitems);
begin {
if setofitemsmemorypointer<=maxsetofitems then
	begin 
	p:=address(setofitemsmemory[setofitemsmemorypointer]);
	setofitemsmemorypointer:=setofitemsmemorypointer +1
	end
else }
MEM_newdefault(Loopholes.SIZEof(ITEMS_setofitems),
               Loopholes.Retype(p,MEM_ptr))
end;

procedure newitem(var p:ITEMS_pitem);
begin {
if itemmemorypointer<=maxitems then
	begin
	p:=address(itemmemory[itemmemorypointer]);
	itemmemorypointer:=itemmemorypointer+1
	end
else }MEM_topdefault;MEM_newdefault(Loopholes.SIZEof(ITEMS_item),
                                    Loopholes.Retype(p,MEM_ptr));
      MEM_bottomdefault;
end;

procedure newlossetofstrees(var p:LISTREE_plossetofstrees);
begin {
if lossetofstreesmemorypointer<=maxlossetofstrees then
	begin
	p:=address(lossetofstreesmemory[lossetofstreesmemorypointer]);
	lossetofstreesmemorypointer:=lossetofstreesmemorypointer + 1
	end
else }MEM_newdefault(Loopholes.SIZEof(LISTREE_lossetofstrees),
                     Loopholes.Retype(p,MEM_ptr))
end;

procedure newlostree(var p:LISTREE_pLoStree);
begin {
if lostreememorypointer<=maxlostrees then
	begin
	p:=address(lostreememory[lostreememorypointer]);
	lostreememorypointer:=lostreememorypointer+1
	end
else }MEM_newdefault(Loopholes.SIZEof(LISTREE_LoStree),
                     Loopholes.Retype(p,MEM_ptr))
end;

procedure newlositem(var p:ITEMS_plositem);
begin {
if lositemmemorypointer<=maxlositems then
	begin
	p:=address(lositemmemory[lositemmemorypointer]);
	lositemmemorypointer:=lositemmemorypointer + 1
	end
else }MEM_newdefault(Loopholes.SIZEof(ITEMS_lositem),
                     Loopholes.Retype(p,MEM_ptr))
end;

procedure newlossurfnodelist(var p:LIPRIMS_plossurfnodelist);
begin {
if lossurfnodelistmemorypointer<=maxlossurfnodelists then
	begin
	p:=address(lossurfnodelistmemory[lossurfnodelistmemorypointer]);
	lossurfnodelistmemorypointer:=lossurfnodelistmemorypointer + 1
	end
else }MEM_newdefault(Loopholes.SIZEof(LIPRIMS_lossurfnodelist),
                     Loopholes.Retype(p,MEM_ptr))
end;

procedure newlossurfnode(var p:LIPRIMS_plossurfgraphnode);
begin {
if lossurfnodememorypointer<=maxlossurfnodes then
	begin
	p:=address(lossurfnodememory[lossurfnodememorypointer]);
	lossurfnodememorypointer:=lossurfnodememorypointer+1
	end
else }MEM_newdefault(Loopholes.SIZEof(LIPRIMS_lossurfgraphnode),
                     Loopholes.Retype(p,MEM_ptr))

end;

{*itemlist, treelist and surfgraphnodelist procedures:}

procedure inititemlist(var I1:ITEMS_setofitems);
{*creates the empty set I1}
begin
I1.first:=nil;
I1.last:=nil
end;

procedure takeitem(var item1:ITEMS_pitem;var I1:ITEMS_setofitems);
{*if I1 is not empty, item1 is the first element OF I1
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

procedure appenditemlist(I1:ITEMS_setofitems;var I2:ITEMS_setofitems);
{*if I1 is non-empty, I1 is appended at the end OF I2
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

procedure appenditem(item1:ITEMS_pitem;var I2:ITEMS_setofitems);
{*if item1 <> nil, it is appended at the end OF I2
 *else I2 is not changed.}
var plositem1:ITEMS_plositem;

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

procedure copyitemlist(var I1:ITEMS_setofitems;I2:ITEMS_setofitems);
{*A new set OF items I1 is created, with the same elements
 *as I2. So the individual items are not copied!}

begin
I1.first:=I2.first;
I1.last:=I2.last
end;

function stillitems(var I1:ITEMS_setofitems):BOOLEAN;
{*is true iff I1 is not empty , i.e. if not 
 *(I1.first=nil }
begin
if (I1.first<>nil) {or (I1.last<>nil)} then stillitems:=true
else stillitems:=false
end;

procedure appenditemtolistandsublist(item1:ITEMS_pitem;var I1,I2:ITEMS_setofitems);
{*appends item to list I1 and to its sublist I2}
begin
appenditem(item1,I1);
I2.last:=I1.last;
if (I2.first = nil) then I2.first:=I2.last
end;

procedure taketree(var stree1: LISTREE_pStree;var S1:LISTREE_setofstrees);
{*if S1 is non-empty its first element becomes the value OF 
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

procedure appendtree(stree1:LISTREE_pStree;var S1:LISTREE_setofstrees);
{*appends stree1 at the end! OF S1, if stree1 <> nil,
 *else S1 is not changed.}
var plostree1: LISTREE_pLoStree;

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

function stilltrees(VAR S1:LISTREE_setofstrees):BOOLEAN;
{*is true iff S1 is empty, i.e. if not S1^.first=nil.
}
begin
if (S1.first<>nil) {or (S1.last<>nil)} then stilltrees:=true
else stilltrees:=false
end;

procedure mergetree(stree1:LISTREE_pStree;var S1:LISTREE_setofstrees);
VAR S2:LISTREE_setofstrees;stree2,stree3:LISTREE_pstree;found:BOOLEAN;
begin
S2:=S1;found:=FALSE;
WHILE stilltrees(S2) AND NOT(found) DO BEGIN
  taketree(stree2,S2);
  IF LDEQUAL_top(stree1,stree2) THEN
    BEGIN
    found:=TRUE;
    stree3:=stree2;
    WHILE NOT(stree2^.twin^.li^.first) DO stree2:=stree2^.twin;
    stree2^.twin:=stree1;
    WHILE NOT(stree1^.twin^.li^.first) DO stree1:=stree1^.twin;
    stree1^.twin^.li^.first:=FALSE;
    stree1^.twin:=stree3
    END;
  END;
IF NOT found THEN appendtree(stree1,S1);
end;

procedure mergetreelist(S1:LISTREE_setofstrees;VAR S2:LISTREE_setofstrees);
VAR tree1,tree2:LISTREE_pstree;S3:LISTREE_setofstrees;found:BOOLEAN;
begin
if (S2.first=nil) and (S2.last=nil) then
	begin
	S2:=S1
	end
else
	begin
	WHILE stilltrees(S1) DO
		begin
                taketree(tree1,S1);
                S3:=S2;
                found:=FALSE;
                WHILE stilltrees(S3) AND NOT(found) DO
                  BEGIN
                  taketree(tree2,S3);
                  IF LDEQUAL_top(tree1,tree2) THEN
                    BEGIN
                    found:=TRUE;
                    {DEBUG_writestr('found',DEBUG_MaxIO,0,TRUE);}
                    tree1^.twin:=tree2^.twin;
                    tree2^.twin:=tree1;
                    END;
                  END;
                IF NOT found THEN appendtree(tree1,S2);
		end
	end
end;

procedure appendtreelist(S1:LISTREE_setofstrees;VAR S2:LISTREE_setofstrees);
{*if S1 is not empty its content is appended at the end OF S2
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

procedure copytreelist(VAR S1:LISTREE_setofstrees;S2:LISTREE_setofstrees);
{*The set S1 gets the same content as the set S2. The individual
 *strees in the sets are not copied}

begin
S1.first:=S2.first;
S1.last:=S2.last;
end;
	
procedure inittreelist(VAR S1:LISTREE_setofstrees);
{*creates an empty set S1}
begin
S1.first:=nil;
S1.last:=nil
end;

procedure initlisttreelist(VAR L1:LISTREE_SetOfSetOfStrees);
begin
L1.first:=nil;
L1.last:=nil
end;

procedure appendsetofstrees(VAR S1:LISTREE_setofstrees;
                            VAR L1:LISTREE_SetOfSetOfStrees);
var plossetofstrees1:LISTREE_plossetofstrees;
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

procedure appendlistoftreelist(L1:LISTREE_SetOfSetOfStrees;
                               VAR L2:LISTREE_SetOfSetOfStrees);
begin
if L2.first=nil then L2:=L1
else
	begin
	L2.last^.next:=L1.first;
	L2.last:=L1.last
	end
end;

procedure taketreelist(VAR S1:LISTREE_setofstrees;
                       VAR L1:LISTREE_SetOfSetOfStrees);
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

function stilltreelists(L1:LISTREE_SetOfSetOfStrees):BOOLEAN;
begin
if L1.first<>nil then stilltreelists:=true
else stilltreelists:=false
end;

procedure appendnode(node1:LIPRIMS_psurfgraphnode;
                           VAR S1:LIPRIMS_surfgraphnodelist);
{*puts node1 at the end! OF S1, if node1 <> nil.}
var plossurfgraphnode1:LIPRIMS_plossurfgraphnode;

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

procedure appendnodelist(S1:LIPRIMS_surfgraphnodelist;
                         VAR S2:LIPRIMS_surfgraphnodelist);
{*if S1 is not empty, its content is appended to the end OF S2}

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

procedure initnodelist(var S1:LIPRIMS_surfgraphnodelist);
{*creates an empty list S1}
begin
S1.first:=nil;
S1.last:=nil
end;

function stillnodes(var S1:LIPRIMS_surfgraphnodelist):BOOLEAN;
{*is true iff S1 is empty, i.e. if not S1.first=nil}
begin
if (S1.first<>nil) or (S1.last<>nil) then stillnodes:=true
else stillnodes:=false
end;

procedure takenode(VAR node1:LIPRIMS_psurfgraphnode;
                   VAR S1:LIPRIMS_surfgraphnodelist);
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

procedure copynodelist(VAR S1:LIPRIMS_surfgraphnodelist;
                       VAR S2:LIPRIMS_surfgraphnodelist);

begin
S1.first:=S2.first;
S1.last:=S2.last
end;

procedure initlistnodelist(var L1:LIPRIMS_listofsurfnodelists);
begin
L1.first:=nil;
L1.last:=nil
end;

procedure appendsurfnodelist(VAR S1:LIPRIMS_surfgraphnodelist;
			     VAR L1:LIPRIMS_listofsurfnodelists);
var plossurfnodelist1:LIPRIMS_plossurfnodelist;
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

procedure appendlistofnodelist(L1:LIPRIMS_listofsurfnodelists;
				VAR L2:LIPRIMS_listofsurfnodelists);
begin
if L2.first=nil then L2:=L1
else
	begin
	L2.last^.next:=L1.first;
	L2.last:=L1.last
	end
end;

procedure takenodelist(VAR S1:LIPRIMS_surfgraphnodelist;
                       VAR L1:LIPRIMS_listofsurfnodelists);
begin
if L1.first=nil then initnodelist(S1)
else
	begin S1:=L1.first^.arg;
	if L1.first=L1.last then
		begin
		L1.first:=nil;L1.last:=nil
		end
	else
		L1.first:=L1.first^.next
	end
end;

function stillnodelists(L1:LIPRIMS_listofsurfnodelists):BOOLEAN;
begin
if L1.first<>nil then stillnodelists:=true
else stillnodelists:=false
end;
	
procedure initreltreelist(var RT1:reltreelist1);
begin
RT1.first:=nil;
RT1.last:=nil
end;

procedure appendreltree(relation:LIDOMAINT_synrel;
                         stree1:LISTREE_pStree;VAR RT1:reltreelist1);
var prsnode1:LISTREE_pRelNode;
begin
newrsnode(prsnode1);
prsnode1^.node:=stree1;
prsnode1^.brother:=nil;
prsnode1^.relation:=relation;
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
procedure readS(i,j:INTEGER;VAR S1:LISTREE_setofstrees);
var 
    STi:LISTREE_SetOfSetOfStrees;
    existentry_ij:BOOLEAN;
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

procedure writeS(i,j:INTEGER;S1:LISTREE_setofstrees);
var setofstrees1:LISTREE_setofstrees;
    p:LISTREE_psetofstrees;
    STi:LISTREE_SetOfSetOfStrees;
    existentry_ij:BOOLEAN;
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
   MEM_newdefault(Loopholes.SIZEof(LISTREE_setofstrees),
                  Loopholes.Retype(p,MEM_ptr));p^:=S1;
   p^.j:=j;
   appendsetofstrees(p^,ST[i])
   end
end;


{*surface rule and graph manipulating procedures:}


procedure searchgraph(graph1:LIPRIMS_psurfgraph;
                      VAR node1:LIPRIMS_psurfgraphnode;
		      VAR completed1:BOOLEAN;
                      VAR nextnodes1:LIPRIMS_surfgraphnodelist;
                      VAR nexttops1:LIPRIMS_syntcatset;
                      VAR nextcats1:LIPRIMS_syntcatset);
{*searches the binary surfgraph graph1 starting at node1. All paths are 
 *investigated until a node with a non-empty category is encountered. All such 
 *nodes are collected in nextnodes1, their categories in nextcats1, and the 
 *intersection OF nextcats1 and the global topcats in the variable nexttops1. 
 *The BOOLEAN completed1 signals wether the end OF the surfgraph was seen.}

var nextnodes2:LIPRIMS_surfgraphnodelist;
    result1,result2,result3,result4:LIPRIMS_syntcatset;
    node2:LIPRIMS_psurfgraphnode;
    cat1:LIDOMAINT_syntcat;
    completed2:BOOLEAN;


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


procedure searchorread(graph1:LIPRIMS_psurfgraph;
                       node2:LIPRIMS_psurfgraphnode;
		       VAR completed1:BOOLEAN;
                       VAR nextnodes1:LIPRIMS_surfgraphnodelist;
		       VAR nexttops1:LIPRIMS_syntcatset;
                       VAR nextcats1:LIPRIMS_syntcatset);
var node1:LIPRIMS_psurfgraphnode;
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

function init(rnr1:INTEGER;i:INTEGER):ITEMS_pitem;
{*creates a new item, with item.rnr=rnr1 and curpos=minpos=i}
var item1:ITEMS_pitem;
begin
newitem(item1);
with item1^ do
	begin
	cat:=SURFRULESGRAPHS_topcat(rnr1);
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
        MEM_topdefault;
        LDSURFSWITCH_make(rnr,params);
        MEM_bottomdefault;
        LDSURFSWITCH_body(rnr,LIPRIMS_Hinit,params,NIL);
	initlistnodelist(history);
	initnodelist(nextnodes);
	searchorread(LDPRIMS_surfgraph(rnr),nil,completed,
					nextnodes,nexttops,nextcats);
	completed:=false{*for security,to exclude empty rules}
	end;
init:=item1
end;

procedure copyitem(var item1:ITEMS_pitem;item2:ITEMS_pitem);
{*A new item item1 is created with identical fields as those
 *of item2}
var item3:ITEMS_pitem;
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
                MEM_topdefault;
                LDSURFSWITCH_make(rnr,params);
                MEM_bottomdefault;
		initlistnodelist(history);
    		completed:=item2^.ruleinfo.completed;
		initnodelist(nextnodes);
    		nexttops:=item2^.ruleinfo.nexttops;
    		nextcats:=item2^.ruleinfo.nextcats
    		end
	end;
item1:=item3
end;

function sameitem(var item1:ITEMS_pitem;minpos:INTEGER;
                  node1:LIPRIMS_psurfgraphnode;params:ITEMS_params;
	                                 IT:ITEMS_setofitems):BOOLEAN;

var I1:ITEMS_setofitems;
    sameitemfound:BOOLEAN;
begin
I1:=IT;
sameitemfound:=false;
while (stillitems(I1) and (sameitemfound=false)) do
	begin
	takeitem(item1,I1);
	if (item1^.minpos=minpos) THEN IF
	(item1^.ruleinfo.history.first^.arg.first^.arg=node1) then
             IF LDSURFSWITCH_comp(item1^.ruleinfo.rnr,item1^.ruleinfo.params,
              params) THEN 
	sameitemfound:=true
	end;
if sameitemfound then sameitem:=true else
	begin
	sameitem:=false;
	item1:=nil
	end
end;

function local(item1:ITEMS_pitem;stree1:LISTREE_pStree;IT:ITEMS_setofitems):ITEMS_setofitems;
{*tries to make item1 adopt stree1. The function yields a possibly
 *empty set OF items resulting from successful attempts. Only local
 *conditions, involving stree attributes are checked. Ruleinfo is
 *adjusted.}

var nextnodes1:LIPRIMS_surfgraphnodelist;
    node1:LIPRIMS_psurfgraphnode;
    result:ITEMS_setofitems;
    rnr:INTEGER;
    item2:ITEMS_pitem;

function localsurfrule(item1:ITEMS_pitem;stree1:LISTREE_pStree;
                       node1:LIPRIMS_psurfgraphnode):ITEMS_pitem;
var item2,item3,item4:ITEMS_pitem;
    n:LIPRIMS_nodeid;
    rnr,rnr2:INTEGER;params1:ITEMS_params;
    parents1:ITEMS_setofitems;
    adoptedsons1,adoptedsons2:LISTREE_SetOfSetOfStrees;
    setofstrees1,setofstrees2:LISTREE_setofstrees;
    history1,history2:LIPRIMS_listofsurfnodelists;
    surfgraphnodelist1,surfgraphnodelist2:LIPRIMS_surfgraphnodelist;

begin
LIPRIMS_assignstatus(false);
n:=node1^.n;
rnr:=item1^.ruleinfo.rnr;
{DEBUG_writestr('->localsurfrule',DEBUG_MaxIO,0,TRUE);
DEBUG_writeinteger(rnr,4,TRUE);
DEBUG_writestr('idnr:',DEBUG_MaxIO,0,TRUE);
DEBUG_writeinteger(n,4,TRUE);
DEBUG_WriteLine(TRUE);}
SURFRULES_rule(rnr,n,stree1,loccond);
if LIPRIMS_status then
  BEGIN
  {DEBUG_writestr('local status true',DEBUG_MaxIO,0,TRUE);
  DEBUG_WriteLine(TRUE);}
  params1:=LDPRIMS_params(rnr);
  LDSURFSWITCH_copy(rnr,item1^.ruleinfo.params,params1);
  IF LDSURFSWITCH_body(rnr,n,params1,stree1) THEN
	begin 
        {DEBUG_writestr('global status true',DEBUG_MaxIO,0,TRUE);
        DEBUG_WriteLine(TRUE);}
	if item1^.minpos=item1^.curpos then
		{*mark parents OF initial items}
		begin
		rnr2:=0;
		while rnr2<>SURFRULES_maxrnr do
			begin
			rnr2:=rnr2+1;
			LDPRIMS_assignrnrset(rnr2,false)
			end;
		copyitemlist(parents1,item1^.parents^);
		while stillitems(parents1) do
			begin
			takeitem(item3,parents1);
			rnr2:=item3^.ruleinfo.rnr;
			if LDPRIMS_rnrset(rnr2)=false then
				begin
                                if item1^.minpos=item3^.minpos then
   					begin
   	 				item3^.followup:=true;
   					LDPRIMS_assignrnrset(rnr2,true);
					appenditemlist(item3^.parents^,parents1)
   					end
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
	if sameitem(item4,item1^.minpos,node1,params1,IT)=false then
		begin
		copyitem(item2,item1);
		item2^.adoptedsons:=adoptedsons2;
		with item2^.ruleinfo do 
			begin
                        LDSURFSWITCH_copy(rnr,params1,params);
			history:=history2;
			initnodelist(nextnodes);
			searchorread(LDPRIMS_surfgraph(rnr),node1,
        			completed,nextnodes,nexttops,nextcats)
			end;
		item2^.followup:=false;
		item2^.curpos:=stree1^.li^.maxpos;
		localsurfrule:=item2
		end
	else
		begin
		appendlistoftreelist(adoptedsons2,item4^.adoptedsons);
		appendlistofnodelist(history2,item4^.ruleinfo.history);
		localsurfrule:=nil
		end
	end
  else  begin 
        localsurfrule:=nil; 
        {DEBUG_writestr('global status false',DEBUG_MaxIO,0,TRUE);
        DEBUG_WriteLine(TRUE)}
        end
  END
else
  begin 
        localsurfrule:=nil; 
        {DEBUG_writestr('local status false',DEBUG_MaxIO,0,TRUE);
        DEBUG_WriteLine(TRUE)}
  end
end;

begin{local}
{DEBUG_writestr('->local',DEBUG_MaxIO,0,TRUE);
DEBUG_writeinteger(item1^.ruleinfo.rnr,4,TRUE);
DEBUG_writestr('minpos:',DEBUG_MaxIO,0,TRUE);
DEBUG_writeinteger(item1^.minpos,4,TRUE);
DEBUG_WriteLine(TRUE);}
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
	while rnr<>SURFRULES_maxrnr do
		begin
		rnr:=rnr+1;
                item2:=LDPRIMS_initialitem(rnr);
		if item2^.followup then LDPRIMS_assinitialitem(rnr,init(rnr,i))
		end

	end;
local:=result
end;

function final(item1:ITEMS_pitem):LISTREE_setofstrees;
var 
    node1:LIPRIMS_psurfgraphnode;
    surfgraphnodelist1:LIPRIMS_surfgraphnodelist;
    result:LISTREE_setofstrees;
    stree1:LISTREE_pStree;
    setofstrees1:LISTREE_setofstrees;
    rnr:INTEGER;
    nsons,minpos,maxpos:INTEGER;
    RT1:reltreelist1;
    adoptedsons1:LISTREE_SetOfSetOfStrees;
    history1:LIPRIMS_listofsurfnodelists;

function finalsurfrule(RT1:reltreelist1;nsons:INTEGER;minpos1:INTEGER;
					maxpos1:INTEGER):LISTREE_setofstrees;
var S1:LISTREE_setofstrees;
    stree1,
    stree2 :LISTREE_pStree;
    Sij : LISTREE_setofstrees;

procedure saversnodes(var RT:reltreelist1);
var prsnode1,prsnode2,prsnode3:LISTREE_pRelNode;

begin
prsnode1:=RT.first;
newdefrsnode(prsnode2);prsnode2^:=prsnode1^;
RT.first:=prsnode2;
while prsnode1<>RT.last do
	begin
	{*prsnode1 scans the original list;prsnode2 is the last copied one;
	 *prsnode3 the new copy}
	prsnode1:=prsnode1^.brother;
	newdefrsnode(prsnode3);prsnode3^:=prsnode1^;
	prsnode2^.brother:=prsnode3;
	prsnode2:=prsnode3
	end
end;

begin
{DEBUG_writestr('->finalsurfrule',DEBUG_MaxIO,0,TRUE);
DEBUG_WriteLine(TRUE);}
LIPRIMS_assignstatus(false);
LIPRIMS_assignnewtop(nil);
inittreelist(S1);
readS(maxpos1, maxpos1+1, Sij);
taketree(stree2, Sij);
SURFRULES_rule(rnr,LIPRIMS_Hfinal,nil,globcond);
if LIPRIMS_status then
	begin
	saversnodes(RT1);
	while LIPRIMS_newtop<>nil do
		begin
                newtop1:=LIPRIMS_newtop;
		stree1:=newtop1^.arg; 
		stree1^.li^.minpos:=minpos1;
		stree1^.li^.maxpos:=maxpos1;
		stree1^.sons:=RT1.first;
		stree1^.li^.n:=nsons;
		appendtree(stree1,S1);
		LIPRIMS_assignnewtop(newtop1^.next)
		end
	end;
finalsurfrule:=S1
end;

procedure globalsurfrule(VAR setofstrees1:LISTREE_setofstrees;
		VAR surfgraphnodelist1:LIPRIMS_surfgraphnodelist;
                VAR RT1:reltreelist1; VAR nsons:INTEGER);
var stree1:LISTREE_pStree;
    node1:LIPRIMS_psurfgraphnode;
begin
{DEBUG_writestr('->globalsurfrule',DEBUG_MaxIO,0,TRUE);
DEBUG_WriteLine(TRUE);}
while stilltrees(setofstrees1) do
	begin
	taketree(stree1,setofstrees1);
	takenode(node1,surfgraphnodelist1);
	globalsurfrule(setofstrees1,surfgraphnodelist1,RT1,
							nsons);
{	if LIPRIMS_status then}
		begin
		LIPRIMS_assignstatus(false);
		SURFRULES_rule(rnr,node1^.n,stree1,globcond);
		nsons:=nsons+1;
		appendreltree(SURFRULES_synrel,stree1,RT1)
		end
	end
end;


begin{final}
{DEBUG_writestr('->final',DEBUG_MaxIO,0,TRUE);
DEBUG_writeinteger(item1^.ruleinfo.rnr,4,TRUE);
DEBUG_WriteLine(TRUE);}
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
		SURFRULES_rule(rnr,LIPRIMS_Hinit,nil,globcond);
		nsons:=0;
		LIPRIMS_assignstatus(true);
		minpos:=item1^.minpos;
		maxpos:=item1^.curpos;
		globalsurfrule(setofstrees1,surfgraphnodelist1,RT1,nsons);
{		if LIPRIMS_status then}
			begin
			{DEBUG_writestr('status true',DEBUG_MaxIO,0,TRUE);
                        DEBUG_WriteLine(TRUE);}
			mergetreelist(finalsurfrule(RT1,nsons,minpos,maxpos),
									result)
			end
		end
	end;
if stilltrees(result)=false then 
        BEGIN
        {DEBUG_writestr('status false',DEBUG_MaxIO,0,TRUE);
        DEBUG_WriteLine(TRUE)}
        END;
final:=result
end;

{*procedures used in main body:}

procedure predict(i:INTEGER);
{*precondition: IT[i] is a non-empty list OF items
}
var
  item1,item2:ITEMS_pitem;
  I1:ITEMS_setofitems;

{*procedures manipulating the array parentlist:}

procedure initparentlist;
var rnr:INTEGER;
    psetofitems1:ITEMS_pSetOfItems;
begin
rnr:=0;
while rnr<>SURFRULES_maxrnr do
	begin
	rnr:=rnr+1;
        IF LDPRIMS_testindex(rnr) THEN 
   	   BEGIN
           newsetofitems(psetofitems1);
           LDPRIMS_assparentlist(rnr,psetofitems1)
           END;
        psetofitems1:=LDPRIMS_parentlist(rnr);
	inititemlist(psetofitems1^)
	end;
LDPRIMS_initindices
end;

procedure addchildren(var item1:ITEMS_pitem);
var rnr:INTEGER;
    item2:ITEMS_pitem;
    psetofitems1:ITEMS_pSetOfItems;
begin
rnr:=0;
while rnr<>SURFRULES_maxrnr do
	begin
	rnr:=rnr+1;
	if (SURFRULESGRAPHS_topcat(rnr) in item1^.ruleinfo.nexttops) then
		begin
                psetofitems1:=LDPRIMS_parentlist(rnr);
		appenditem(item1,psetofitems1^);
		if (psetofitems1^.first=psetofitems1^.last) and 
                   (psetofitems1^.first<>nil) then
			begin
			item2:=LDPRIMS_initialitem(rnr);
			item2^.minpos:=i;
			item2^.curpos:=i;
			item2^.parents:=LDPRIMS_parentlist(rnr);
                        LDPRIMS_addindex(rnr);
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
	{*item1 has been removed out OF I1
	}
	addchildren(item1)
	{*parentlist[rnr] contains item1 iff the rule with number rnr
	 *has category in nexttops(item1); if item1 is the only element
	 *of parentlist[rnr] for some rnr, new items for these have been
	 *created and are added to I1 and IT[i]
	}
	end{while};
{*parentlist[rnr] contains an item OF IT[i] iff the rule with number
 *rnr has category in nexttops(item). To each non-empty parentlist[rnr]
 *corresponds an (new) item in IT[i] with minpos=i, but with empty parents
 *field.
 *postcondition:IT[i] contains all items with curpos=minpos=i.
}
end;


procedure scan(var {*}{vanwege foutmelding} i:INTEGER);
{*precondition:IT[i] is a non-empty set OF items 
}
var
  item1:ITEMS_pitem;
  stree1:LISTREE_pStree;
  S1:LISTREE_setofstrees;
  I1:ITEMS_setofitems;
  m:INTEGER;
  Sij:LISTREE_setofstrees;
  setofSij:LISTREE_SetOfSetOfStrees;
begin
m:=i;
setofSij:=ST[i];
while stilltreelists(setofSij) do
	begin
	{m:=m+1;}
        {readS(i,m,Sij);}
        taketreelist(Sij,setofSij);
        m:=Sij.j;
	copytreelist(S1,Sij);
	while stilltrees(S1) do
		begin
		taketree(stree1,S1);
	        {*stree1 has been removed from S1
		}
		{DEBUG_writestr('tree scanned',DEBUG_MaxIO,0,TRUE);
                DEBUG_WriteLine(TRUE);}
		copyitemlist(I1,IT[i]);
		while stillitems(I1) do
			begin
			takeitem(item1,I1);
			{*item1 has been removed from I1
			}
			appenditemlist(local(item1,stree1,IT[m]),IT[m])
		        {*the result OF local(item1,stree1) has been added to 
                        IT[m]}
			end{while}
		end{while}
	end{while}
{*postcondition:IT[m] contains all items that resulted by adoption OF an stree 
 *from S[i,m] by an item in IT[i], for all m: i<m<=imax.
}
end;


procedure complete(i:INTEGER);
{*precondition:IT[i] is a non-empty set OF items
}
var
  I1,I2:ITEMS_setofitems;
  S1:LISTREE_setofstrees;
  item1,item2,item3:ITEMS_pitem;
  stree1:LISTREE_pStree;
  afterlastoriginalitem:BOOLEAN;
  p,q:ITEMS_plositem;
  Sij:LISTREE_setofstrees;
  string1:STRING(30);
  l:STR_range;
begin
copyitemlist(I1,IT[i]);
p:=IT[i].last;
afterlastoriginalitem:=false;
while stillitems(I1) do
        {*I1 contains all items OF IT[i] not yet investigated for stree
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
		    item1^.ruleinfo.history.first^.arg.first^.arg,
                     item1^.ruleinfo.params,IT[i]) then
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
                IF DEBUG_mode THEN DRAWSTREE_generatetree(stree1);
                DEBUG_writestr('created stree tried for completion,cat:',DEBUG_MaxIO,0,TRUE);
                LDTYPETOSTR_cat(string1,l,stree1^.cat);
                DEBUG_WriteStr(string1,l,Debug_MaxIO,TRUE);
                DEBUG_WriteLine(TRUE);
		copyitemlist(I2,item1^.parents^);
		while stillitems(I2) do
			begin
			takeitem(item2,I2);
                        {DEBUG_writestr('parent number',DEBUG_MaxIO,0,TRUE);
                        DEBUG_writeinteger(item2^.ruleinfo.rnr,4,true);
                        DEBUG_WriteLine(TRUE);}
			appenditemlist(local(item2,stree1,I1),I1)
			{*I1 contains the result OF the adoption OF stree1
			 *by one OF its 'parent items' item2.}
			end{while};
                readS(stree1^.li^.minpos,i,Sij);
		appendtree(stree1,Sij);
                writeS(stree1^.li^.minpos,i,Sij)
		{*the generated stree1 has been made element OF S[k,i], for
		 *corresponding k.}
		end{while}
	{*I1 contains the result OF the adoption trials OF strees 
         *coming from item1 by items in item1.parents. (These are the 
	 *only elements of I which can possibly adopt these trees)}
	end{while}
{*postcondition:For all k>i, S[k,i] contains all strees generatable from IT[i].
 *		IT[i] contains all items resulting from adoption OF a new
 *		element OF S[k,i] by an item in IT[k].
}
end;

procedure initializetrees(var imax:sentencelength);
var list1:INTERFACE1_pRowSeqSegmKeys;
    i,j:INTEGER;
    stree1:LISTREE_pStree;
    connode1,connode2:INTERFACE1_pRowSeqSegmKeys;
    Sij:LISTREE_setofstrees;
    string1:PACKED ARRAY[1..30] OF CHAR;
    l:INTEGER;
begin
lostreememorypointer:=2;
lossetofstreesmemorypointer:=2;
imax:=0;
if if1<>nil then
   begin
   connode1:=if1;
   connode2:=if1^.prv;
   while connode1<>connode2 do
	begin
	imax:=imax+1;
	connode1^.idnr:=imax;
	connode1:=connode1^.nxt
	end;
   connode2^.idnr:=imax+1
   end;
if if1=nil then imax:=1;
i:=0;
{DEBUG_writestr('imax determined:',DEBUG_MaxIO,0,TRUE);
DEBUG_writeinteger(imax,4,true);
DEBUG_WriteLine(TRUE);}
while i<>imax+1 do
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
   nocontextconditions:=TRUE;
   while connode1<>connode2 do
	begin
	list1:=connode1;
        IF NOT list1^.error THEN
          BEGIN
          WHILE list1<>nil do
		begin
		IF (list1^.fseq <> nil) AND NOT(list1^.rn^.error) THEN
                  BEGIN 
                  stree1:=list1^.fseq^.stree;
		  i:=connode1^.idnr-1;
		  j:=list1^.rn^.idnr-1; 
                  stree1^.li^.minpos:=i;stree1^.li^.maxpos:=j;
                  nocontextconditions:=nocontextconditions AND (list1^.nonsucc=[]);
                  {DEBUG_writestr('input i,j:',DEBUG_MaxIO,0,TRUE);
                  DEBUG_writeinteger(i,4,true);
                  DEBUG_writeinteger(j,4,true);
                  DEBUG_writestr('cat:',DEBUG_MaxIO,0,TRUE);
                  LDTYPETOSTR_cat(string1,l,stree1^.cat);
                  DEBUG_WriteStr(string1,l,Debug_MaxIO,TRUE);
                  DEBUG_WriteLine(TRUE);}
                  readS(i,j,Sij);
                  appendtree(stree1,Sij);
                  writeS(i,j,Sij)
                  END;
		list1:=list1^.nxtamb
		end;
          END;
	connode1:=connode1^.nxt
	end
   end
end;

procedure initializeitems(imax:sentencelength);
var i,rnr:INTEGER;j:ITEMS_params;

begin
itemmemorypointer:=2;
setofitemsmemorypointer:=2;
lossurfnodelistmemorypointer:=2;
lositemmemorypointer:=2;
lossurfnodememorypointer:=2;
MEM_newdefault(Loopholes.SIZEof(LIPRIMS_surfgraphtype),
               Loopholes.Retype(absent1,MEM_ptr));
LIPRIMS_assignabsent(absent1);
i:=0;
LDPRIMS_initindices;
while i<>SURFRULES_maxrnr do
   begin
   i:=i+1;
   LDPRIMS_addindex(i)
   end;
i:=0;
while i<>SURFRULES_maxrnr do
   begin
   i:=i+1;
   LDSURFSWITCH_make(i,j);
   LDPRIMS_assparams(i,j);
   end;

{initialize topcats}
topcats := [];
FOR i:=1 TO SURFRULES_maxrnr DO 
   BEGIN
   IF LDCATSETS_utterance(SURFRULESGRAPHS_topcat(i)) THEN uttrnr:=i;
   topcats := topcats + [SURFRULESGRAPHS_topcat(i)];
   END;
i:=-1;
while i<>imax do
	begin
	i:=i+1;
	inititemlist(IT[i])
 	end;
i:=0;
while i<>SURFRULES_maxrnr do
	begin
	i:=i+1;
	SURFRULESGRAPHS_SFG(i)
	end;
i:=0;
rnr:=0;
while rnr<>SURFRULES_maxrnr do
	begin
	rnr:=rnr+1;
        LDPRIMS_assinitialitem(rnr,init(rnr,i))
	end
end;

FUNCTION checksucc(VAR nonsucc:INTERFACE1_SetOfWordAmbIdType;
                   s:LISTREE_pstree):BOOLEAN;
var list1:INTERFACE1_pRowSeqSegmKeys;
    i,j:INTEGER;
    stree1:LISTREE_pStree;
    connode1,connode2:INTERFACE1_pRowSeqSegmKeys;
    Sij:LISTREE_setofstrees;
    string1:PACKED ARRAY[1..30] OF CHAR;
    l:INTEGER;
    treefound,result:BOOLEAN;
BEGIN
result:=TRUE;
treefound:=FALSE;
if (if1<>nil) and NOT(nocontextconditions) then
   begin
   connode1:=if1;
   connode2:=if1^.prv;
   while (connode1<>connode2) AND NOT(treefound) DO
	begin
	list1:=connode1;
        IF NOT list1^.error THEN
          BEGIN
          WHILE list1<>nil DO
		begin
		IF (list1^.fseq <> nil) AND NOT(treefound) AND NOT(list1^.rn^.error) THEN
                  BEGIN 
                  stree1:=list1^.fseq^.stree;
                  IF s=stree1 THEN BEGIN
                     treefound:=TRUE;
                     result:= NOT (list1^.ambid IN nonsucc);
                     nonsucc:=list1^.nonsucc;
                     END;
                  END;
		list1:=list1^.nxtamb
		end;
          END;
	connode1:=connode1^.nxt
	end
   end;
checksucc:=result;
END;

{FUNCTION duplicate(s:LISTREE_pstree;VAR nonsucc:INTERFACE1_SetOfWordAmbIdType;
           VAR result:LISTREE_pstree;upperlayer:BOOLEAN;VAR counter:INTEGER):BOOLEAN;
VAR sonlist,p,q,r:LISTREE_prelnode;
    listree,listree1,twin:LISTREE_pstree;
    status:BOOLEAN;localcounter,multcounter:INTEGER;
    nonsucc1:INTERFACE1_SetOfWordAmbIdType;
BEGIN
nonsucc1:=nonsucc;
counter:=0;
multcounter:=1;
IF LDCATSETS_LexCat(s^.cat) THEN status:=checksucc(nonsucc,s) ELSE status:=TRUE;
IF LDCATSETS_blexcat(s^.cat) THEN BEGIN
  listree:=s;
  listree^.li^.first:=TRUE;
  listree^.twin:=listree
  END
ELSE 
  BEGIN
  MEM_newdefault(Loopholes.SIZEof(LISTREE_stree),
                 Loopholes.Retype(listree,MEM_ptr));
  MEM_newdefault(Loopholes.SIZEof(LISTREE_lirecord),
                 Loopholes.Retype(listree^.li,MEM_ptr));

  WITH s^ DO
    BEGIN
    listree^.cat:=cat;
    listree^.li^:=li^;
    listree^.li^.first:=upperlayer;
    listree^.sons:=NIL;
    MEM_copydefault(Loopholes.Retype(ls,MEM_ptr),recordsize,
                    Loopholes.Retype(listree^.ls,MEM_ptr));
    END;
  sonlist:=s^.sons;
  listree^.twin:=NIL;
  IF upperlayer THEN BEGIN
    WHILE s^.twin<>NIL DO BEGIN
      IF duplicate(s^.twin,nonsucc1,twin,FALSE,localcounter) THEN
        BEGIN }{MOET NOG GEMEMOISEERD}{
        twin^.twin:=listree^.twin;
        listree^.twin:=twin;
        counter:=counter+localcounter;
        END;
      s:=s^.twin;
      END;
    listree1:=listree;
    WHILE listree1^.twin<>NIL DO BEGIN
      listree1:=listree1^.twin;
      END;
    listree1^.twin:=listree;
    END;
  q:=NIL;
  r:=NIL;
  WHILE sonlist<>NIL DO
    BEGIN
    newdefrsnode(p);
    p^.relation:=sonlist^.relation;
    status:=status AND duplicate(sonlist^.node,nonsucc,p^.node,TRUE,localcounter);
    multcounter:=multcounter*localcounter;    
    p^.brother:=NIL;
    IF r<>NIL THEN r^.brother:=p ELSE q:=p;
    r:=p;
    sonlist:=sonlist^.brother
    END;
  listree^.sons:=q;
  END;
counter:=counter+multcounter;
duplicate:=status;
result:=listree;
END;}

FUNCTION duplicate(s:LISTREE_pstree;VAR nonsucc:INTERFACE1_SetOfWordAmbIdType;
           VAR result:LISTREE_pstree;upperlayer:BOOLEAN;VAR counter:INTEGER):BOOLEAN;
VAR sonlist,p,q,r:LISTREE_prelnode;
    listree,twin:LISTREE_pstree;
    status:BOOLEAN;localcounter,multcounter:INTEGER;
    nonsucc1:INTERFACE1_SetOfWordAmbIdType;
BEGIN
nonsucc1:=nonsucc;
counter:=0;
multcounter:=1;
status:=TRUE;
listree:=s;
IF LDCATSETS_blexcat(s^.cat) THEN BEGIN
  listree^.li^.first:=TRUE;
  listree^.twin:=listree
  END
ELSE 
  BEGIN
  IF upperlayer THEN BEGIN
  WHILE (s^.twin<>NIL) AND (s^.twin<>listree) DO BEGIN
    IF duplicate(s^.twin,nonsucc1,twin,FALSE,localcounter) THEN
      BEGIN
      counter:=counter+localcounter;
      END;
    s:=s^.twin;
    END;
  listree^.li^.first:=TRUE;
  s^.twin:=listree;
  END;
  sonlist:=listree^.sons;
  WHILE sonlist<>NIL DO
    BEGIN
    status:=status AND duplicate(sonlist^.node,nonsucc,p^.node,TRUE,localcounter);
    multcounter:=multcounter*localcounter;    
    sonlist:=sonlist^.brother;
    END;
  END;
counter:=counter+multcounter;
duplicate:=status;
END;


procedure extractresults(VAR S1:LISTREE_setofstrees);
var stree1,stree2:LISTREE_pStree;treecounter,counter:INTEGER;
    nonsucc:INTERFACE1_SetOfWordAmbIdType;
begin
inittreelist(if2);
treecounter:=0;
while stilltrees(S1) do
	begin
	taketree(stree1,S1);
	if LDCATSETS_utterance(stree1^.cat) then 
		begin
                nonsucc:=[];
                counter:=0;
                IF duplicate(stree1,nonsucc,stree2,TRUE,counter) THEN
                  BEGIN
                  treecounter:=treecounter+counter;
                  mergetree(stree1{was stree2},if2);
                  END;
		end
	end;

AWHERE_NrTreesStore(treecounter);

DEBUG_writeinteger(treecounter,6,TRUE);
DEBUG_writestr(' syntax trees',DEBUG_MaxIO,0,TRUE);
DEBUG_WriteLine(TRUE);
{writeln('exit surfparser, ',treecounter,' s-trees');}
end;


{*main body}

begin
if1:= interf.if1;
{*precondition: input=set OF all strees such that the minimum value OF all
 *stree.minpos is 0 and the maximum value OF all stree.maxpos is imax, and
 *imax<=maximumlength.
 *For each i: 0<i<imax there is at least one stree such that stree.minpos
 *<i<=stree.maxpos.
}
recordsize:=LDMEASURESIZE_body;
{MEMORY_mark;}
MEM_createstack(rsmemstack,500);
MEM_Mark(rsmemstack,rsstackptr);
MEM_topdefault;
MEM_markdefault(topdefstackptr);
MEM_bottomdefault;
MEM_markdefault(defstackptr);
initializetrees(imax);
{*for all i,j: 0<=i,j<=imax, S[i,j] contains all covering strees in input
}
{DEBUG_writestr('trees initialized',DEBUG_MaxIO,0,TRUE);}
initializeitems(imax);
{DEBUG_writestr('items initialized',DEBUG_MaxIO,0,TRUE);}
{*for all i: 0<=i<=imax, IT[i] = empty.
}
appenditem(LDPRIMS_initialitem(uttrnr),IT[0]); {uttrnr is rule number of rule 
                                                with top utt}
i:=0; TempIf1 := if1;
while i <> imax do
	begin
        ALAYOUT_MarkRegion(Tempif1^.X,
                            Tempif1^.Y,
                            Tempif1^.len);

        {if DEBUG_mode then libint:=lib$show_vm(0,0,0);}
        if DEBUG_mode then clockint1:=0{clock};
	DEBUG_writeinteger(i,4,true);
        {*For all m>=i,j<i, IT[m] contains all possible items with curpos=m 
	 *which can be generated by adoption OF an stree in S[j,m], by an
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
         *adoption OF an stree in S[j,m] by an item in IT[j].
        }
	i:=i+1;
	{*For all m>=i,j<i IT[m] contains all items, that can be generated by
         *adoption OF an stree in S[j,m] by an item in IT[j].
         *S[k,i] contains only input strees.
        } 
	complete(i);
        ALAYOUT_UnMarkRegion(Tempif1^.X,
                              Tempif1^.Y,
                              Tempif1^.len);
        Tempif1 := tempif1^.nxt
	end{while};

{*postcondition:S[0,imax] contains all covering strees with stree.cat=utt, 
 *stree.minpos=0 and stree.maxpos=imax
}
{if DEBUG_mode then libint:=lib$show_vm(0,0,0);}
clockint2:=0{clock};
DEBUG_writestr('cpu:',DEBUG_MaxIO,0,TRUE);
DEBUG_writeinteger(clockint2-clockint1,4,true);
DEBUG_writeline(TRUE);
readS(0,imax,Sij);
MEM_topdefault;
MEM_releasedefault(topdefstackptr);
extractresults(Sij);
ifout.level:= 2;
ifout.if2:= if2;
MEM_releasestack(rsmemstack);
MEM_bottomdefault;
MEM_releasedefault(defstackptr);
MEM_topdefault; 
SURFPARSER_Body:= ifout
end;{surfparser} 

