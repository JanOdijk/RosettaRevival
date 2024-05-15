EXPORT(ldprims);
pragma C_include('liprims.pf');
pragma C_include('ldprims.pf');
pragma C_include('items.pf');
PROGRAM ldprims;
WITH liprims,items;
CONST maxrnr =  30;
TYPE grammarlength = 0..maxrnr;
VAR surfgraphvar: ARRAY[1..maxrnr] OF LIPRIMS_psurfgraph;
    parentlist: ARRAY[1..maxrnr] OF ITEMS_pSetOfItems;
    params: ARRAY[1..maxrnr] OF ITEMS_params;
    usedparentlistindices: SET OF grammarlength;
    initialitem: ARRAY[1..maxrnr] OF ITEMS_pitem;
    rnrset: ARRAY[0..maxrnr] OF BOOLEAN;
FUNCTION LDPRIMS_initialitem(rnr:INTEGER):ITEMS_pitem;
BEGIN
LDPRIMS_initialitem:=initialitem[rnr]
END;
PROCEDURE LDPRIMS_assinitialitem(rnr:INTEGER;valeu:ITEMS_pitem);
BEGIN
initialitem[rnr]:=valeu
END;
PROCEDURE LDPRIMS_initindices;
BEGIN
usedparentlistindices:=[]
END;
FUNCTION LDPRIMS_testindex(rnr:INTEGER):BOOLEAN;
BEGIN
LDPRIMS_testindex:= rnr IN usedparentlistindices
END;
PROCEDURE LDPRIMS_addindex(rnr:INTEGER);
BEGIN
usedparentlistindices:=usedparentlistindices + [rnr]
END;
FUNCTION LDPRIMS_parentlist(i:INTEGER):ITEMS_pSetOfItems;
BEGIN
LDPRIMS_parentlist:=parentlist[i]
END;
PROCEDURE LDPRIMS_assparentlist(i:INTEGER;valeu:ITEMS_pSetOfitems);
BEGIN
parentlist[i]:=valeu
END;
FUNCTION LDPRIMS_params(i:INTEGER):ITEMS_params;
BEGIN
LDPRIMS_params:=params[i]
END;
PROCEDURE LDPRIMS_assparams(i:INTEGER;valeu:ITEMS_params);
BEGIN
params[i]:=valeu
END;
FUNCTION LDPRIMS_surfgraph(i:INTEGER):LIPRIMS_psurfgraph;
BEGIN
LDPRIMS_surfgraph:=surfgraphvar[i]
END;
PROCEDURE LDPRIMS_assignsurfgraph(i:INTEGER;valeu:LIPRIMS_psurfgraph);
BEGIN
surfgraphvar[i]:=valeu
END;
FUNCTION LDPRIMS_rnrset(i:INTEGER):BOOLEAN;
BEGIN
LDPRIMS_rnrset:=rnrset[i]
END;
PROCEDURE LDPRIMS_assignrnrset(i:INTEGER;valeu:BOOLEAN);
BEGIN
rnrset[i]:=valeu
END;
