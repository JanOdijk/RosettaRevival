export(auxcommaket);
pragma c_include('auxcommaket.pf');
pragma c_include('auxcomlangspec.pf');
pragma c_include('string.pf');
pragma c_include('mem.pf');
pragma c_include('auxcomdecl.pf');
program auxcommaket;
WITH auxcomlangspec,
strng,mem,
auxcomdecl;
     procedure auxcommaket_UTT(
    var stree1:auxcomdecl_psnode);
begin
MEM_newdefault(loopholes.sizeof(auxcomdecl_snode),loopholes.retype(stree1,MEM_ptr));
stree1^.cat:=UTT;
auxcommaket_UTTrec(stree1^.ldfield.UTTfield)
end;
     procedure auxcommaket_UTTrec(
     var rec:auxcomlangspec_puttrecord);
begin
MEM_newdefault(loopholes.sizeof(auxcomlangspec_uttrecord),loopholes.retype(rec,MEM_ptr));
;
;

end;
     procedure auxcommaket_LANGVERSION(
    var stree1:auxcomdecl_psnode);
begin
MEM_newdefault(loopholes.sizeof(auxcomdecl_snode),loopholes.retype(stree1,MEM_ptr));
stree1^.cat:=LANGVERSION;
auxcommaket_LANGVERSIONrec(stree1^.ldfield.LANGVERSIONfield)
end;
     procedure auxcommaket_LANGVERSIONrec(
     var rec:auxcomlangspec_plangrecord);
begin
MEM_newdefault(loopholes.sizeof(auxcomlangspec_langrecord),loopholes.retype(rec,MEM_ptr));

end;
     procedure auxcommaket_KEYSECTION(
    var stree1:auxcomdecl_psnode);
begin
MEM_newdefault(loopholes.sizeof(auxcomdecl_snode),loopholes.retype(stree1,MEM_ptr));
stree1^.cat:=KEYSECTION;
auxcommaket_KEYSECTIONrec(stree1^.ldfield.KEYSECTIONfield)
end;
     procedure auxcommaket_KEYSECTIONrec(
     var rec:auxcomlangspec_pkeyrecord);
begin
MEM_newdefault(loopholes.sizeof(auxcomlangspec_keyrecord),loopholes.retype(rec,MEM_ptr));
;

end;
     procedure auxcommaket_ARGUMENTS(
    var stree1:auxcomdecl_psnode);
begin
MEM_newdefault(loopholes.sizeof(auxcomdecl_snode),loopholes.retype(stree1,MEM_ptr));
stree1^.cat:=ARGUMENTS;
auxcommaket_ARGUMENTSrec(stree1^.ldfield.ARGUMENTSfield)
end;
     procedure auxcommaket_ARGUMENTSrec(
     var rec:auxcomlangspec_pargrecord);
begin
MEM_newdefault(loopholes.sizeof(auxcomlangspec_argrecord),loopholes.retype(rec,MEM_ptr));
;

end;
     procedure auxcommaket_ARGLIST(
    var stree1:auxcomdecl_psnode);
begin
MEM_newdefault(loopholes.sizeof(auxcomdecl_snode),loopholes.retype(stree1,MEM_ptr));
stree1^.cat:=ARGLIST;
auxcommaket_ARGLISTrec(stree1^.ldfield.ARGLISTfield)
end;
     procedure auxcommaket_ARGLISTrec(
     var rec:auxcomlangspec_parglistrecord);
begin
MEM_newdefault(loopholes.sizeof(auxcomlangspec_arglistrecord),loopholes.retype(rec,MEM_ptr));

end;
     procedure auxcommaket_NUMBER(
    var stree1:auxcomdecl_psnode);
begin
MEM_newdefault(loopholes.sizeof(auxcomdecl_snode),loopholes.retype(stree1,MEM_ptr));
stree1^.cat:=NUMBER;
auxcommaket_NUMBERrec(stree1^.ldfield.NUMBERfield)
end;
     procedure auxcommaket_NUMBERrec(
     var rec:auxcomlangspec_pnumrecord);
begin
MEM_newdefault(loopholes.sizeof(auxcomlangspec_numrecord),loopholes.retype(rec,MEM_ptr));

end;
     procedure auxcommaket_TERMARGUMENT(
    var stree1:auxcomdecl_psnode);
begin
MEM_newdefault(loopholes.sizeof(auxcomdecl_snode),loopholes.retype(stree1,MEM_ptr));
stree1^.cat:=TERMARGUMENT;
auxcommaket_TERMARGUMENTrec(stree1^.ldfield.TERMARGUMENTfield)
end;
     procedure auxcommaket_TERMARGUMENTrec(
     var rec:auxcomlangspec_ptermrecord);
begin
MEM_newdefault(loopholes.sizeof(auxcomlangspec_termrecord),loopholes.retype(rec,MEM_ptr));

end;
     procedure auxcommaket_PUNCTUATION(
    var stree1:auxcomdecl_psnode);
begin
MEM_newdefault(loopholes.sizeof(auxcomdecl_snode),loopholes.retype(stree1,MEM_ptr));
stree1^.cat:=PUNCTUATION;
auxcommaket_PUNCTUATIONrec(stree1^.ldfield.PUNCTUATIONfield)
end;
     procedure auxcommaket_PUNCTUATIONrec(
     var rec:auxcomlangspec_ppunctrecord);
begin
MEM_newdefault(loopholes.sizeof(auxcomlangspec_punctrecord),loopholes.retype(rec,MEM_ptr));

end;
     procedure auxcommaket_RECSECTION(
    var stree1:auxcomdecl_psnode);
begin
MEM_newdefault(loopholes.sizeof(auxcomdecl_snode),loopholes.retype(stree1,MEM_ptr));
stree1^.cat:=RECSECTION;
auxcommaket_RECSECTIONrec(stree1^.ldfield.RECSECTIONfield)
end;
     procedure auxcommaket_RECSECTIONrec(
     var rec:auxcomlangspec_precrecord);
begin
MEM_newdefault(loopholes.sizeof(auxcomlangspec_recrecord),loopholes.retype(rec,MEM_ptr));

end;
     procedure auxcommaket_NUMRECORDS(
    var stree1:auxcomdecl_psnode);
begin
MEM_newdefault(loopholes.sizeof(auxcomdecl_snode),loopholes.retype(stree1,MEM_ptr));
stree1^.cat:=NUMRECORDS;
auxcommaket_NUMRECORDSrec(stree1^.ldfield.NUMRECORDSfield)
end;
     procedure auxcommaket_NUMRECORDSrec(
     var rec:auxcomlangspec_pnumrecrecord);
begin
MEM_newdefault(loopholes.sizeof(auxcomlangspec_numrecrecord),loopholes.retype(rec,MEM_ptr));

end;
     procedure auxcommaket_TYPESECTION(
    var stree1:auxcomdecl_psnode);
begin
MEM_newdefault(loopholes.sizeof(auxcomdecl_snode),loopholes.retype(stree1,MEM_ptr));
stree1^.cat:=TYPESECTION;
auxcommaket_TYPESECTIONrec(stree1^.ldfield.TYPESECTIONfield)
end;
     procedure auxcommaket_TYPESECTIONrec(
     var rec:auxcomlangspec_ptyperecord);
begin
MEM_newdefault(loopholes.sizeof(auxcomlangspec_typerecord),loopholes.retype(rec,MEM_ptr));

end;
     procedure auxcommaket_FIELDLIST(
    var stree1:auxcomdecl_psnode);
begin
MEM_newdefault(loopholes.sizeof(auxcomdecl_snode),loopholes.retype(stree1,MEM_ptr));
stree1^.cat:=FIELDLIST;
auxcommaket_FIELDLISTrec(stree1^.ldfield.FIELDLISTfield)
end;
     procedure auxcommaket_FIELDLISTrec(
     var rec:auxcomlangspec_pfldlstrecord);
begin
MEM_newdefault(loopholes.sizeof(auxcomlangspec_fldlstrecord),loopholes.retype(rec,MEM_ptr));
;
rec^.RecFieldCount:=0
end;
     procedure auxcommaket_FIELDVALUE(
    var stree1:auxcomdecl_psnode);
begin
MEM_newdefault(loopholes.sizeof(auxcomdecl_snode),loopholes.retype(stree1,MEM_ptr));
stree1^.cat:=FIELDVALUE;
auxcommaket_FIELDVALUErec(stree1^.ldfield.FIELDVALUEfield)
end;
     procedure auxcommaket_FIELDVALUErec(
     var rec:auxcomlangspec_pfldvalrecord);
begin
MEM_newdefault(loopholes.sizeof(auxcomlangspec_fldvalrecord),loopholes.retype(rec,MEM_ptr));

end;
     procedure auxcommaket_VARCATSECTION(
    var stree1:auxcomdecl_psnode);
begin
MEM_newdefault(loopholes.sizeof(auxcomdecl_snode),loopholes.retype(stree1,MEM_ptr));
stree1^.cat:=VARCATSECTION;
auxcommaket_VARCATSECTIONrec(stree1^.ldfield.VARCATSECTIONfield)
end;
     procedure auxcommaket_VARCATSECTIONrec(
     var rec:auxcomlangspec_pvarcatrecord);
begin
MEM_newdefault(loopholes.sizeof(auxcomlangspec_varcatrecord),loopholes.retype(rec,MEM_ptr));

end;
     procedure auxcommaket_ABBRSECTION(
    var stree1:auxcomdecl_psnode);
begin
MEM_newdefault(loopholes.sizeof(auxcomdecl_snode),loopholes.retype(stree1,MEM_ptr));
stree1^.cat:=ABBRSECTION;
auxcommaket_ABBRSECTIONrec(stree1^.ldfield.ABBRSECTIONfield)
end;
     procedure auxcommaket_ABBRSECTIONrec(
     var rec:auxcomlangspec_pabbrrecord);
begin
MEM_newdefault(loopholes.sizeof(auxcomlangspec_abbrrecord),loopholes.retype(rec,MEM_ptr));
;
rec^.AbbrCounter:=0;

end;
     procedure auxcommaket_ABBRLIST(
    var stree1:auxcomdecl_psnode);
begin
MEM_newdefault(loopholes.sizeof(auxcomdecl_snode),loopholes.retype(stree1,MEM_ptr));
stree1^.cat:=ABBRLIST;
auxcommaket_ABBRLISTrec(stree1^.ldfield.ABBRLISTfield)
end;
     procedure auxcommaket_ABBRLISTrec(
     var rec:auxcomlangspec_pablstrecord);
begin
MEM_newdefault(loopholes.sizeof(auxcomlangspec_ablstrecord),loopholes.retype(rec,MEM_ptr));

end;
     procedure auxcommaket_NUMABBRS(
    var stree1:auxcomdecl_psnode);
begin
MEM_newdefault(loopholes.sizeof(auxcomdecl_snode),loopholes.retype(stree1,MEM_ptr));
stree1^.cat:=NUMABBRS;
auxcommaket_NUMABBRSrec(stree1^.ldfield.NUMABBRSfield)
end;
     procedure auxcommaket_NUMABBRSrec(
     var rec:auxcomlangspec_pnumabbrecord);
begin
MEM_newdefault(loopholes.sizeof(auxcomlangspec_numabbrecord),loopholes.retype(rec,MEM_ptr));
;
;
rec^.basementioned:=false
end;
