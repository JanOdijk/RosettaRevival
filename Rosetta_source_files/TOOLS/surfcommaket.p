export(surfcommaket);
pragma c_include('surfcommaket.pf');
pragma c_include('surfcomlangspec.pf');
pragma c_include('string.pf');
pragma c_include('mem.pf');
pragma c_include('surfcomdecl.pf');
program surfcommaket;
WITH surfcomlangspec,
strng,mem,
surfcomdecl;
     procedure surfcommaket_UTT(
    var stree1:surfcomdecl_psnode);
begin
MEM_newdefault(loopholes.sizeof(surfcomdecl_snode),loopholes.retype(stree1,MEM_ptr));
stree1^.cat:=UTT;
surfcommaket_UTTrec(stree1^.ldfield.UTTfield)
end;
     procedure surfcommaket_UTTrec(
     var rec:surfcomlangspec_puttrec);
begin
MEM_newdefault(loopholes.sizeof(surfcomlangspec_uttrec),loopholes.retype(rec,MEM_ptr));

end;
     procedure surfcommaket_RULESPEC(
    var stree1:surfcomdecl_psnode);
begin
MEM_newdefault(loopholes.sizeof(surfcomdecl_snode),loopholes.retype(stree1,MEM_ptr));
stree1^.cat:=RULESPEC;
surfcommaket_RULESPECrec(stree1^.ldfield.RULESPECfield)
end;
     procedure surfcommaket_RULESPECrec(
     var rec:surfcomlangspec_prulespecrec);
begin
MEM_newdefault(loopholes.sizeof(surfcomlangspec_rulespecrec),loopholes.retype(rec,MEM_ptr));
;

end;
     procedure surfcommaket_RULEBODY(
    var stree1:surfcomdecl_psnode);
begin
MEM_newdefault(loopholes.sizeof(surfcomdecl_snode),loopholes.retype(stree1,MEM_ptr));
stree1^.cat:=RULEBODY;
surfcommaket_RULEBODYrec(stree1^.ldfield.RULEBODYfield)
end;
     procedure surfcommaket_RULEBODYrec(
     var rec:surfcomlangspec_prulebodyrec);
begin
MEM_newdefault(loopholes.sizeof(surfcomlangspec_rulebodyrec),loopholes.retype(rec,MEM_ptr));

end;
     procedure surfcommaket_BLOCK(
    var stree1:surfcomdecl_psnode);
begin
MEM_newdefault(loopholes.sizeof(surfcomdecl_snode),loopholes.retype(stree1,MEM_ptr));
stree1^.cat:=BLOCK;
surfcommaket_BLOCKrec(stree1^.ldfield.BLOCKfield)
end;
     procedure surfcommaket_BLOCKrec(
     var rec:surfcomlangspec_pblockrec);
begin
MEM_newdefault(loopholes.sizeof(surfcomlangspec_blockrec),loopholes.retype(rec,MEM_ptr));
;

end;
     procedure surfcommaket_PASCALTOHEKJE(
    var stree1:surfcomdecl_psnode);
begin
MEM_newdefault(loopholes.sizeof(surfcomdecl_snode),loopholes.retype(stree1,MEM_ptr));
stree1^.cat:=PASCALTOHEKJE;
surfcommaket_PASCALTOHEKJErec(stree1^.ldfield.PASCALTOHEKJEfield)
end;
     procedure surfcommaket_PASCALTOHEKJErec(
     var rec:surfcomlangspec_ppascalrec);
begin
MEM_newdefault(loopholes.sizeof(surfcomlangspec_pascalrec),loopholes.retype(rec,MEM_ptr));

end;
     procedure surfcommaket_PASCALTOGLOBAL(
    var stree1:surfcomdecl_psnode);
begin
MEM_newdefault(loopholes.sizeof(surfcomdecl_snode),loopholes.retype(stree1,MEM_ptr));
stree1^.cat:=PASCALTOGLOBAL;
surfcommaket_PASCALTOGLOBALrec(stree1^.ldfield.PASCALTOGLOBALfield)
end;
     procedure surfcommaket_PASCALTOGLOBALrec(
     var rec:surfcomlangspec_ppascalrec);
begin
MEM_newdefault(loopholes.sizeof(surfcomlangspec_pascalrec),loopholes.retype(rec,MEM_ptr));

end;
     procedure surfcommaket_PASCALTOEND(
    var stree1:surfcomdecl_psnode);
begin
MEM_newdefault(loopholes.sizeof(surfcomdecl_snode),loopholes.retype(stree1,MEM_ptr));
stree1^.cat:=PASCALTOEND;
surfcommaket_PASCALTOENDrec(stree1^.ldfield.PASCALTOENDfield)
end;
     procedure surfcommaket_PASCALTOENDrec(
     var rec:surfcomlangspec_ppascalrec);
begin
MEM_newdefault(loopholes.sizeof(surfcomlangspec_pascalrec),loopholes.retype(rec,MEM_ptr));

end;
     procedure surfcommaket_PSTOSTARRIGHT(
    var stree1:surfcomdecl_psnode);
begin
MEM_newdefault(loopholes.sizeof(surfcomdecl_snode),loopholes.retype(stree1,MEM_ptr));
stree1^.cat:=PSTOSTARRIGHT;
surfcommaket_PSTOSTARRIGHTrec(stree1^.ldfield.PSTOSTARRIGHTfield)
end;
     procedure surfcommaket_PSTOSTARRIGHTrec(
     var rec:surfcomlangspec_ppascalrec);
begin
MEM_newdefault(loopholes.sizeof(surfcomlangspec_pascalrec),loopholes.retype(rec,MEM_ptr));

end;
     procedure surfcommaket_GRAPH(
    var stree1:surfcomdecl_psnode);
begin
MEM_newdefault(loopholes.sizeof(surfcomdecl_snode),loopholes.retype(stree1,MEM_ptr));
stree1^.cat:=GRAPH;
surfcommaket_GRAPHrec(stree1^.ldfield.GRAPHfield)
end;
     procedure surfcommaket_GRAPHrec(
     var rec:surfcomlangspec_pgraphrec);
begin
MEM_newdefault(loopholes.sizeof(surfcomlangspec_graphrec),loopholes.retype(rec,MEM_ptr));

end;
     procedure surfcommaket_NUMBER(
    var stree1:surfcomdecl_psnode);
begin
MEM_newdefault(loopholes.sizeof(surfcomdecl_snode),loopholes.retype(stree1,MEM_ptr));
stree1^.cat:=NUMBER;
surfcommaket_NUMBERrec(stree1^.ldfield.NUMBERfield)
end;
     procedure surfcommaket_NUMBERrec(
     var rec:surfcomlangspec_pnumberrec);
begin
MEM_newdefault(loopholes.sizeof(surfcomlangspec_numberrec),loopholes.retype(rec,MEM_ptr));
;

end;
     procedure surfcommaket_INITBLOCK(
    var stree1:surfcomdecl_psnode);
begin
MEM_newdefault(loopholes.sizeof(surfcomdecl_snode),loopholes.retype(stree1,MEM_ptr));
stree1^.cat:=INITBLOCK;
surfcommaket_INITBLOCKrec(stree1^.ldfield.INITBLOCKfield)
end;
     procedure surfcommaket_INITBLOCKrec(
     var rec:surfcomlangspec_pblockrec);
begin
MEM_newdefault(loopholes.sizeof(surfcomlangspec_blockrec),loopholes.retype(rec,MEM_ptr));
;

end;
     procedure surfcommaket_FINALBLOCK(
    var stree1:surfcomdecl_psnode);
begin
MEM_newdefault(loopholes.sizeof(surfcomdecl_snode),loopholes.retype(stree1,MEM_ptr));
stree1^.cat:=FINALBLOCK;
surfcommaket_FINALBLOCKrec(stree1^.ldfield.FINALBLOCKfield)
end;
     procedure surfcommaket_FINALBLOCKrec(
     var rec:surfcomlangspec_pblockrec);
begin
MEM_newdefault(loopholes.sizeof(surfcomlangspec_blockrec),loopholes.retype(rec,MEM_ptr));
;

end;
