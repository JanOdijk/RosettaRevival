export(surflinkmaket);
pragma c_include('surflinkmaket.pf');
pragma c_include('surflinklangspec.pf');
pragma c_include('string.pf');
pragma c_include('mem.pf');
pragma c_include('surflinkdecl.pf');
program surflinkmaket;
WITH surflinklangspec,
strng,mem,
surflinkdecl;
     procedure surflinkmaket_UTT(
    var stree1:surflinkdecl_psnode);
begin
MEM_newdefault(loopholes.sizeof(surflinkdecl_snode),loopholes.retype(stree1,MEM_ptr));
stree1^.cat:=UTT;
surflinkmaket_UTTrec(stree1^.ldfield.UTTfield)
end;
     procedure surflinkmaket_UTTrec(
     var rec:surflinklangspec_puttrec);
begin
MEM_newdefault(loopholes.sizeof(surflinklangspec_uttrec),loopholes.retype(rec,MEM_ptr));
;
;

end;
     procedure surflinkmaket_RULESPEC(
    var stree1:surflinkdecl_psnode);
begin
MEM_newdefault(loopholes.sizeof(surflinkdecl_snode),loopholes.retype(stree1,MEM_ptr));
stree1^.cat:=RULESPEC;
surflinkmaket_RULESPECrec(stree1^.ldfield.RULESPECfield)
end;
     procedure surflinkmaket_RULESPECrec(
     var rec:surflinklangspec_prulespecrec);
begin
MEM_newdefault(loopholes.sizeof(surflinklangspec_rulespecrec),loopholes.retype(rec,MEM_ptr));

end;
     procedure surflinkmaket_RULEBODY(
    var stree1:surflinkdecl_psnode);
begin
MEM_newdefault(loopholes.sizeof(surflinkdecl_snode),loopholes.retype(stree1,MEM_ptr));
stree1^.cat:=RULEBODY;
surflinkmaket_RULEBODYrec(stree1^.ldfield.RULEBODYfield)
end;
     procedure surflinkmaket_RULEBODYrec(
     var rec:surflinklangspec_prulebodyrec);
begin
MEM_newdefault(loopholes.sizeof(surflinklangspec_rulebodyrec),loopholes.retype(rec,MEM_ptr));

end;
     procedure surflinkmaket_BLOCK(
    var stree1:surflinkdecl_psnode);
begin
MEM_newdefault(loopholes.sizeof(surflinkdecl_snode),loopholes.retype(stree1,MEM_ptr));
stree1^.cat:=BLOCK;
surflinkmaket_BLOCKrec(stree1^.ldfield.BLOCKfield)
end;
     procedure surflinkmaket_BLOCKrec(
     var rec:surflinklangspec_pblockrec);
begin
MEM_newdefault(loopholes.sizeof(surflinklangspec_blockrec),loopholes.retype(rec,MEM_ptr));

end;
     procedure surflinkmaket_PASCALTOHEKJE(
    var stree1:surflinkdecl_psnode);
begin
MEM_newdefault(loopholes.sizeof(surflinkdecl_snode),loopholes.retype(stree1,MEM_ptr));
stree1^.cat:=PASCALTOHEKJE;
surflinkmaket_PASCALTOHEKJErec(stree1^.ldfield.PASCALTOHEKJEfield)
end;
     procedure surflinkmaket_PASCALTOHEKJErec(
     var rec:surflinklangspec_ppascalrec);
begin
MEM_newdefault(loopholes.sizeof(surflinklangspec_pascalrec),loopholes.retype(rec,MEM_ptr));

end;
     procedure surflinkmaket_PASCALTOGLOBAL(
    var stree1:surflinkdecl_psnode);
begin
MEM_newdefault(loopholes.sizeof(surflinkdecl_snode),loopholes.retype(stree1,MEM_ptr));
stree1^.cat:=PASCALTOGLOBAL;
surflinkmaket_PASCALTOGLOBALrec(stree1^.ldfield.PASCALTOGLOBALfield)
end;
     procedure surflinkmaket_PASCALTOGLOBALrec(
     var rec:surflinklangspec_ppascalrec);
begin
MEM_newdefault(loopholes.sizeof(surflinklangspec_pascalrec),loopholes.retype(rec,MEM_ptr));

end;
     procedure surflinkmaket_PASCALTOEND(
    var stree1:surflinkdecl_psnode);
begin
MEM_newdefault(loopholes.sizeof(surflinkdecl_snode),loopholes.retype(stree1,MEM_ptr));
stree1^.cat:=PASCALTOEND;
surflinkmaket_PASCALTOENDrec(stree1^.ldfield.PASCALTOENDfield)
end;
     procedure surflinkmaket_PASCALTOENDrec(
     var rec:surflinklangspec_ppascalrec);
begin
MEM_newdefault(loopholes.sizeof(surflinklangspec_pascalrec),loopholes.retype(rec,MEM_ptr));

end;
     procedure surflinkmaket_PSTOSTARRIGHT(
    var stree1:surflinkdecl_psnode);
begin
MEM_newdefault(loopholes.sizeof(surflinkdecl_snode),loopholes.retype(stree1,MEM_ptr));
stree1^.cat:=PSTOSTARRIGHT;
surflinkmaket_PSTOSTARRIGHTrec(stree1^.ldfield.PSTOSTARRIGHTfield)
end;
     procedure surflinkmaket_PSTOSTARRIGHTrec(
     var rec:surflinklangspec_ppascalrec);
begin
MEM_newdefault(loopholes.sizeof(surflinklangspec_pascalrec),loopholes.retype(rec,MEM_ptr));

end;
     procedure surflinkmaket_GRAPH(
    var stree1:surflinkdecl_psnode);
begin
MEM_newdefault(loopholes.sizeof(surflinkdecl_snode),loopholes.retype(stree1,MEM_ptr));
stree1^.cat:=GRAPH;
surflinkmaket_GRAPHrec(stree1^.ldfield.GRAPHfield)
end;
     procedure surflinkmaket_GRAPHrec(
     var rec:surflinklangspec_pgraphrec);
begin
MEM_newdefault(loopholes.sizeof(surflinklangspec_graphrec),loopholes.retype(rec,MEM_ptr));
;
rec^.numofconcgraphs:=0;
rec^.numberofstates:=0
end;
     procedure surflinkmaket_CONCGRAPH(
    var stree1:surflinkdecl_psnode);
begin
MEM_newdefault(loopholes.sizeof(surflinkdecl_snode),loopholes.retype(stree1,MEM_ptr));
stree1^.cat:=CONCGRAPH;
surflinkmaket_CONCGRAPHrec(stree1^.ldfield.CONCGRAPHfield)
end;
     procedure surflinkmaket_CONCGRAPHrec(
     var rec:surflinklangspec_pconcgraphrec);
begin
MEM_newdefault(loopholes.sizeof(surflinklangspec_concgraphrec),loopholes.retype(rec,MEM_ptr));
;
rec^.numofelemgraphs:=0;
rec^.numberofstates:=0
end;
     procedure surflinkmaket_ELEMGRAPH(
    var stree1:surflinkdecl_psnode);
begin
MEM_newdefault(loopholes.sizeof(surflinkdecl_snode),loopholes.retype(stree1,MEM_ptr));
stree1^.cat:=ELEMGRAPH;
surflinkmaket_ELEMGRAPHrec(stree1^.ldfield.ELEMGRAPHfield)
end;
     procedure surflinkmaket_ELEMGRAPHrec(
     var rec:surflinklangspec_pelemgraphrec);
begin
MEM_newdefault(loopholes.sizeof(surflinklangspec_elemgraphrec),loopholes.retype(rec,MEM_ptr));
;
rec^.graphtype:=atomgraph;
rec^.numberofstates:=0
end;
     procedure surflinkmaket_NUMBER(
    var stree1:surflinkdecl_psnode);
begin
MEM_newdefault(loopholes.sizeof(surflinkdecl_snode),loopholes.retype(stree1,MEM_ptr));
stree1^.cat:=NUMBER;
surflinkmaket_NUMBERrec(stree1^.ldfield.NUMBERfield)
end;
     procedure surflinkmaket_NUMBERrec(
     var rec:surflinklangspec_pnumberrec);
begin
MEM_newdefault(loopholes.sizeof(surflinklangspec_numberrec),loopholes.retype(rec,MEM_ptr));
;
rec^.int:=0
end;
     procedure surflinkmaket_PARAMS(
    var stree1:surflinkdecl_psnode);
begin
MEM_newdefault(loopholes.sizeof(surflinkdecl_snode),loopholes.retype(stree1,MEM_ptr));
stree1^.cat:=PARAMS;
surflinkmaket_PARAMSrec(stree1^.ldfield.PARAMSfield)
end;
     procedure surflinkmaket_PARAMSrec(
     var rec:surflinklangspec_pparamsrec);
begin
MEM_newdefault(loopholes.sizeof(surflinklangspec_paramsrec),loopholes.retype(rec,MEM_ptr));
;

end;
     procedure surflinkmaket_PASCAL(
    var stree1:surflinkdecl_psnode);
begin
MEM_newdefault(loopholes.sizeof(surflinkdecl_snode),loopholes.retype(stree1,MEM_ptr));
stree1^.cat:=PASCAL;
surflinkmaket_PASCALrec(stree1^.ldfield.PASCALfield)
end;
     procedure surflinkmaket_PASCALrec(
     var rec:surflinklangspec_ppascalrec);
begin
MEM_newdefault(loopholes.sizeof(surflinklangspec_pascalrec),loopholes.retype(rec,MEM_ptr));

end;
