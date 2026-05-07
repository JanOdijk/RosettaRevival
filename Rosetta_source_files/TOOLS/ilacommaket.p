export(ilacommaket);
pragma c_include('ilacommaket.pf');
pragma c_include('ilacomlangspec.pf');
pragma c_include('string.pf');
pragma c_include('mem.pf');
pragma c_include('ilacomdecl.pf');
program ilacommaket;
WITH ilacomlangspec,
strng,mem,
ilacomdecl;
     procedure ilacommaket_UTT(
    var stree1:ilacomdecl_psnode);
begin
MEM_newdefault(loopholes.sizeof(ilacomdecl_snode),loopholes.retype(stree1,MEM_ptr));
stree1^.cat:=UTT;
ilacommaket_UTTrec(stree1^.ldfield.UTTfield)
end;
     procedure ilacommaket_UTTrec(
     var rec:ilacomlangspec_puttrecord);
begin
MEM_newdefault(loopholes.sizeof(ilacomlangspec_uttrecord),loopholes.retype(rec,MEM_ptr));
;
;

end;
     procedure ilacommaket_LANGVERSION(
    var stree1:ilacomdecl_psnode);
begin
MEM_newdefault(loopholes.sizeof(ilacomdecl_snode),loopholes.retype(stree1,MEM_ptr));
stree1^.cat:=LANGVERSION;
ilacommaket_LANGVERSIONrec(stree1^.ldfield.LANGVERSIONfield)
end;
     procedure ilacommaket_LANGVERSIONrec(
     var rec:ilacomlangspec_plangrecord);
begin
MEM_newdefault(loopholes.sizeof(ilacomlangspec_langrecord),loopholes.retype(rec,MEM_ptr));

end;
     procedure ilacommaket_ILRULESspec(
    var stree1:ilacomdecl_psnode);
begin
MEM_newdefault(loopholes.sizeof(ilacomdecl_snode),loopholes.retype(stree1,MEM_ptr));
stree1^.cat:=ILRULESspec;
ilacommaket_ILRULESspecrec(stree1^.ldfield.ILRULESspecfield)
end;
     procedure ilacommaket_ILRULESspecrec(
     var rec:ilacomlangspec_pilrulesrecord);
begin
MEM_newdefault(loopholes.sizeof(ilacomlangspec_ilrulesrecord),loopholes.retype(rec,MEM_ptr));

end;
     procedure ilacommaket_ILRULE(
    var stree1:ilacomdecl_psnode);
begin
MEM_newdefault(loopholes.sizeof(ilacomdecl_snode),loopholes.retype(stree1,MEM_ptr));
stree1^.cat:=ILRULE;
ilacommaket_ILRULErec(stree1^.ldfield.ILRULEfield)
end;
     procedure ilacommaket_ILRULErec(
     var rec:ilacomlangspec_pilrulerecord);
begin
MEM_newdefault(loopholes.sizeof(ilacomlangspec_ilrulerecord),loopholes.retype(rec,MEM_ptr));

end;
     procedure ilacommaket_PARAMname(
    var stree1:ilacomdecl_psnode);
begin
MEM_newdefault(loopholes.sizeof(ilacomdecl_snode),loopholes.retype(stree1,MEM_ptr));
stree1^.cat:=PARAMname;
ilacommaket_PARAMnamerec(stree1^.ldfield.PARAMnamefield)
end;
     procedure ilacommaket_PARAMnamerec(
     var rec:ilacomlangspec_pparamrecord);
begin
MEM_newdefault(loopholes.sizeof(ilacomlangspec_paramrecord),loopholes.retype(rec,MEM_ptr));
;

end;
     procedure ilacommaket_TYPEname(
    var stree1:ilacomdecl_psnode);
begin
MEM_newdefault(loopholes.sizeof(ilacomdecl_snode),loopholes.retype(stree1,MEM_ptr));
stree1^.cat:=TYPEname;
ilacommaket_TYPEnamerec(stree1^.ldfield.TYPEnamefield)
end;
     procedure ilacommaket_TYPEnamerec(
     var rec:ilacomlangspec_ptyperecord);
begin
MEM_newdefault(loopholes.sizeof(ilacomlangspec_typerecord),loopholes.retype(rec,MEM_ptr));
;

end;
     procedure ilacommaket_TYPESPEC(
    var stree1:ilacomdecl_psnode);
begin
MEM_newdefault(loopholes.sizeof(ilacomdecl_snode),loopholes.retype(stree1,MEM_ptr));
stree1^.cat:=TYPESPEC;
ilacommaket_TYPESPECrec(stree1^.ldfield.TYPESPECfield)
end;
     procedure ilacommaket_TYPESPECrec(
     var rec:ilacomlangspec_ptypespecrecord);
begin
MEM_newdefault(loopholes.sizeof(ilacomlangspec_typespecrecord),loopholes.retype(rec,MEM_ptr));

end;
     procedure ilacommaket_TYPEDEFINITION(
    var stree1:ilacomdecl_psnode);
begin
MEM_newdefault(loopholes.sizeof(ilacomdecl_snode),loopholes.retype(stree1,MEM_ptr));
stree1^.cat:=TYPEDEFINITION;
ilacommaket_TYPEDEFINITIONrec(stree1^.ldfield.TYPEDEFINITIONfield)
end;
     procedure ilacommaket_TYPEDEFINITIONrec(
     var rec:ilacomlangspec_ptypedefrecord);
begin
MEM_newdefault(loopholes.sizeof(ilacomlangspec_typedefrecord),loopholes.retype(rec,MEM_ptr));

end;
     procedure ilacommaket_ENUMDEF(
    var stree1:ilacomdecl_psnode);
begin
MEM_newdefault(loopholes.sizeof(ilacomdecl_snode),loopholes.retype(stree1,MEM_ptr));
stree1^.cat:=ENUMDEF;
ilacommaket_ENUMDEFrec(stree1^.ldfield.ENUMDEFfield)
end;
     procedure ilacommaket_ENUMDEFrec(
     var rec:ilacomlangspec_penumdefrecord);
begin
MEM_newdefault(loopholes.sizeof(ilacomlangspec_enumdefrecord),loopholes.retype(rec,MEM_ptr));

end;
     procedure ilacommaket_SUBRANGEDEF(
    var stree1:ilacomdecl_psnode);
begin
MEM_newdefault(loopholes.sizeof(ilacomdecl_snode),loopholes.retype(stree1,MEM_ptr));
stree1^.cat:=SUBRANGEDEF;
ilacommaket_SUBRANGEDEFrec(stree1^.ldfield.SUBRANGEDEFfield)
end;
     procedure ilacommaket_SUBRANGEDEFrec(
     var rec:ilacomlangspec_psubrandefrecord);
begin
MEM_newdefault(loopholes.sizeof(ilacomlangspec_subrandefrecord),loopholes.retype(rec,MEM_ptr));

end;
     procedure ilacommaket_INTEGERDEF(
    var stree1:ilacomdecl_psnode);
begin
MEM_newdefault(loopholes.sizeof(ilacomdecl_snode),loopholes.retype(stree1,MEM_ptr));
stree1^.cat:=INTEGERDEF;
ilacommaket_INTEGERDEFrec(stree1^.ldfield.INTEGERDEFfield)
end;
     procedure ilacommaket_INTEGERDEFrec(
     var rec:ilacomlangspec_pintdefrecord);
begin
MEM_newdefault(loopholes.sizeof(ilacomlangspec_intdefrecord),loopholes.retype(rec,MEM_ptr));

end;
     procedure ilacommaket_BOOLEANDEF(
    var stree1:ilacomdecl_psnode);
begin
MEM_newdefault(loopholes.sizeof(ilacomdecl_snode),loopholes.retype(stree1,MEM_ptr));
stree1^.cat:=BOOLEANDEF;
ilacommaket_BOOLEANDEFrec(stree1^.ldfield.BOOLEANDEFfield)
end;
     procedure ilacommaket_BOOLEANDEFrec(
     var rec:ilacomlangspec_pbooldefrecord);
begin
MEM_newdefault(loopholes.sizeof(ilacomlangspec_booldefrecord),loopholes.retype(rec,MEM_ptr));

end;
     procedure ilacommaket_SETDEF(
    var stree1:ilacomdecl_psnode);
begin
MEM_newdefault(loopholes.sizeof(ilacomdecl_snode),loopholes.retype(stree1,MEM_ptr));
stree1^.cat:=SETDEF;
ilacommaket_SETDEFrec(stree1^.ldfield.SETDEFfield)
end;
     procedure ilacommaket_SETDEFrec(
     var rec:ilacomlangspec_psetdefrecord);
begin
MEM_newdefault(loopholes.sizeof(ilacomlangspec_setdefrecord),loopholes.retype(rec,MEM_ptr));

end;
