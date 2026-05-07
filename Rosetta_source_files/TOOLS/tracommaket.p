export(tracommaket);
pragma c_include('tracommaket.pf');
pragma c_include('tracomlangspec.pf');
pragma c_include('string.pf');
pragma c_include('mem.pf');
pragma c_include('tracomdecl.pf');
program tracommaket;
WITH tracomlangspec,
strng,mem,
tracomdecl;
     procedure tracommaket_UTT(
    var stree1:tracomdecl_psnode);
begin
MEM_newdefault(loopholes.sizeof(tracomdecl_snode),loopholes.retype(stree1,MEM_ptr));
stree1^.cat:=UTT;
tracommaket_UTTrec(stree1^.ldfield.UTTfield)
end;
     procedure tracommaket_UTTrec(
     var rec:tracomlangspec_puttrecord);
begin
MEM_newdefault(loopholes.sizeof(tracomlangspec_uttrecord),loopholes.retype(rec,MEM_ptr));

end;
     procedure tracommaket_LANGVERSION(
    var stree1:tracomdecl_psnode);
begin
MEM_newdefault(loopholes.sizeof(tracomdecl_snode),loopholes.retype(stree1,MEM_ptr));
stree1^.cat:=LANGVERSION;
tracommaket_LANGVERSIONrec(stree1^.ldfield.LANGVERSIONfield)
end;
     procedure tracommaket_LANGVERSIONrec(
     var rec:tracomlangspec_plangrecord);
begin
MEM_newdefault(loopholes.sizeof(tracomlangspec_langrecord),loopholes.retype(rec,MEM_ptr));

end;
     procedure tracommaket_RULESTRANS(
    var stree1:tracomdecl_psnode);
begin
MEM_newdefault(loopholes.sizeof(tracomdecl_snode),loopholes.retype(stree1,MEM_ptr));
stree1^.cat:=RULESTRANS;
tracommaket_RULESTRANSrec(stree1^.ldfield.RULESTRANSfield)
end;
     procedure tracommaket_RULESTRANSrec(
     var rec:tracomlangspec_prulestransrec);
begin
MEM_newdefault(loopholes.sizeof(tracomlangspec_rulestransrec),loopholes.retype(rec,MEM_ptr));

end;
     procedure tracommaket_RULETRANS(
    var stree1:tracomdecl_psnode);
begin
MEM_newdefault(loopholes.sizeof(tracomdecl_snode),loopholes.retype(stree1,MEM_ptr));
stree1^.cat:=RULETRANS;
tracommaket_RULETRANSrec(stree1^.ldfield.RULETRANSfield)
end;
     procedure tracommaket_RULETRANSrec(
     var rec:tracomlangspec_pruletransrec);
begin
MEM_newdefault(loopholes.sizeof(tracomlangspec_ruletransrec),loopholes.retype(rec,MEM_ptr));
;
rec^.leftpresent:=false;
rec^.rightpresent:=false;
rec^.sbonus:=0;
rec^.wbonus:=0
end;
     procedure tracommaket_PARAMETERSTRANS(
    var stree1:tracomdecl_psnode);
begin
MEM_newdefault(loopholes.sizeof(tracomdecl_snode),loopholes.retype(stree1,MEM_ptr));
stree1^.cat:=PARAMETERSTRANS;
tracommaket_PARAMETERSTRANSrec(stree1^.ldfield.PARAMETERSTRANSfield)
end;
     procedure tracommaket_PARAMETERSTRANSrec(
     var rec:tracomlangspec_pparstransrec);
begin
MEM_newdefault(loopholes.sizeof(tracomlangspec_parstransrec),loopholes.retype(rec,MEM_ptr));
;

end;
     procedure tracommaket_PARAMETERTRANS(
    var stree1:tracomdecl_psnode);
begin
MEM_newdefault(loopholes.sizeof(tracomdecl_snode),loopholes.retype(stree1,MEM_ptr));
stree1^.cat:=PARAMETERTRANS;
tracommaket_PARAMETERTRANSrec(stree1^.ldfield.PARAMETERTRANSfield)
end;
     procedure tracommaket_PARAMETERTRANSrec(
     var rec:tracomlangspec_ppartransrec);
begin
MEM_newdefault(loopholes.sizeof(tracomlangspec_partransrec),loopholes.retype(rec,MEM_ptr));
;

end;
     procedure tracommaket_ELEMENTTRANS(
    var stree1:tracomdecl_psnode);
begin
MEM_newdefault(loopholes.sizeof(tracomdecl_snode),loopholes.retype(stree1,MEM_ptr));
stree1^.cat:=ELEMENTTRANS;
tracommaket_ELEMENTTRANSrec(stree1^.ldfield.ELEMENTTRANSfield)
end;
     procedure tracommaket_ELEMENTTRANSrec(
     var rec:tracomlangspec_pelttransrec);
begin
MEM_newdefault(loopholes.sizeof(tracomlangspec_elttransrec),loopholes.retype(rec,MEM_ptr));
;

end;
     procedure tracommaket_ANDCOND(
    var stree1:tracomdecl_psnode);
begin
MEM_newdefault(loopholes.sizeof(tracomdecl_snode),loopholes.retype(stree1,MEM_ptr));
stree1^.cat:=ANDCOND;
tracommaket_ANDCONDrec(stree1^.ldfield.ANDCONDfield)
end;
     procedure tracommaket_ANDCONDrec(
     var rec:tracomlangspec_pandcondrec);
begin
MEM_newdefault(loopholes.sizeof(tracomlangspec_andcondrec),loopholes.retype(rec,MEM_ptr));
;
rec^.simple:=false
end;
     procedure tracommaket_ORCOND(
    var stree1:tracomdecl_psnode);
begin
MEM_newdefault(loopholes.sizeof(tracomdecl_snode),loopholes.retype(stree1,MEM_ptr));
stree1^.cat:=ORCOND;
tracommaket_ORCONDrec(stree1^.ldfield.ORCONDfield)
end;
     procedure tracommaket_ORCONDrec(
     var rec:tracomlangspec_porcondrec);
begin
MEM_newdefault(loopholes.sizeof(tracomlangspec_orcondrec),loopholes.retype(rec,MEM_ptr));
;
rec^.simple:=false
end;
     procedure tracommaket_ELEMENTARYCOND(
    var stree1:tracomdecl_psnode);
begin
MEM_newdefault(loopholes.sizeof(tracomdecl_snode),loopholes.retype(stree1,MEM_ptr));
stree1^.cat:=ELEMENTARYCOND;
tracommaket_ELEMENTARYCONDrec(stree1^.ldfield.ELEMENTARYCONDfield)
end;
     procedure tracommaket_ELEMENTARYCONDrec(
     var rec:tracomlangspec_pelemcondrec);
begin
MEM_newdefault(loopholes.sizeof(tracomlangspec_elemcondrec),loopholes.retype(rec,MEM_ptr));
;
rec^.simple:=false
end;
     procedure tracommaket_PASCALEXPR(
    var stree1:tracomdecl_psnode);
begin
MEM_newdefault(loopholes.sizeof(tracomdecl_snode),loopholes.retype(stree1,MEM_ptr));
stree1^.cat:=PASCALEXPR;
tracommaket_PASCALEXPRrec(stree1^.ldfield.PASCALEXPRfield)
end;
     procedure tracommaket_PASCALEXPRrec(
     var rec:tracomlangspec_ppascalexprrec);
begin
MEM_newdefault(loopholes.sizeof(tracomlangspec_pascalexprrec),loopholes.retype(rec,MEM_ptr));
;
rec^.simple:=false;
rec^.notpresent:=false;
rec^.initialcounter:=0
end;
     procedure tracommaket_VALUENAME(
    var stree1:tracomdecl_psnode);
begin
MEM_newdefault(loopholes.sizeof(tracomdecl_snode),loopholes.retype(stree1,MEM_ptr));
stree1^.cat:=VALUENAME;
tracommaket_VALUENAMErec(stree1^.ldfield.VALUENAMEfield)
end;
     procedure tracommaket_VALUENAMErec(
     var rec:tracomlangspec_pvaluenamerec);
begin
MEM_newdefault(loopholes.sizeof(tracomlangspec_valuenamerec),loopholes.retype(rec,MEM_ptr));
;

end;
     procedure tracommaket_PARAMNAME(
    var stree1:tracomdecl_psnode);
begin
MEM_newdefault(loopholes.sizeof(tracomdecl_snode),loopholes.retype(stree1,MEM_ptr));
stree1^.cat:=PARAMNAME;
tracommaket_PARAMNAMErec(stree1^.ldfield.PARAMNAMEfield)
end;
     procedure tracommaket_PARAMNAMErec(
     var rec:tracomlangspec_pparamnamerec);
begin
MEM_newdefault(loopholes.sizeof(tracomlangspec_paramnamerec),loopholes.retype(rec,MEM_ptr));
;

end;
     procedure tracommaket_TYPENAME(
    var stree1:tracomdecl_psnode);
begin
MEM_newdefault(loopholes.sizeof(tracomdecl_snode),loopholes.retype(stree1,MEM_ptr));
stree1^.cat:=TYPENAME;
tracommaket_TYPENAMErec(stree1^.ldfield.TYPENAMEfield)
end;
     procedure tracommaket_TYPENAMErec(
     var rec:tracomlangspec_ptypenamerec);
begin
MEM_newdefault(loopholes.sizeof(tracomlangspec_typenamerec),loopholes.retype(rec,MEM_ptr));
;

end;
     procedure tracommaket_MRULENAME(
    var stree1:tracomdecl_psnode);
begin
MEM_newdefault(loopholes.sizeof(tracomdecl_snode),loopholes.retype(stree1,MEM_ptr));
stree1^.cat:=MRULENAME;
tracommaket_MRULENAMErec(stree1^.ldfield.MRULENAMEfield)
end;
     procedure tracommaket_MRULENAMErec(
     var rec:tracomlangspec_pmrulenamerec);
begin
MEM_newdefault(loopholes.sizeof(tracomlangspec_mrulenamerec),loopholes.retype(rec,MEM_ptr));
;

end;
     procedure tracommaket_ILRULENAME(
    var stree1:tracomdecl_psnode);
begin
MEM_newdefault(loopholes.sizeof(tracomdecl_snode),loopholes.retype(stree1,MEM_ptr));
stree1^.cat:=ILRULENAME;
tracommaket_ILRULENAMErec(stree1^.ldfield.ILRULENAMEfield)
end;
     procedure tracommaket_ILRULENAMErec(
     var rec:tracomlangspec_pilrulenamerec);
begin
MEM_newdefault(loopholes.sizeof(tracomlangspec_ilrulenamerec),loopholes.retype(rec,MEM_ptr));
;

end;
     procedure tracommaket_SETVALUENAME(
    var stree1:tracomdecl_psnode);
begin
MEM_newdefault(loopholes.sizeof(tracomdecl_snode),loopholes.retype(stree1,MEM_ptr));
stree1^.cat:=SETVALUENAME;
tracommaket_SETVALUENAMErec(stree1^.ldfield.SETVALUENAMEfield)
end;
     procedure tracommaket_SETVALUENAMErec(
     var rec:tracomlangspec_psetvaluerec);
begin
MEM_newdefault(loopholes.sizeof(tracomlangspec_setvaluerec),loopholes.retype(rec,MEM_ptr));
;

end;
