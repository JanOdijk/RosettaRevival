export(afxprmaket);
pragma c_include('afxprmaket.pf');
pragma c_include('afxprlangspec.pf');
pragma c_include('string.pf');
pragma c_include('mem.pf');
pragma c_include('afxprdecl.pf');
program afxprmaket;
WITH afxprlangspec,
strng,mem,
afxprdecl;
     procedure afxprmaket_EXPR(
    var stree1:afxprdecl_psnode);
begin
MEM_newdefault(loopholes.sizeof(afxprdecl_snode),loopholes.retype(stree1,MEM_ptr));
stree1^.cat:=EXPR;
afxprmaket_EXPRrec(stree1^.ldfield.EXPRfield)
end;
     procedure afxprmaket_EXPRrec(
     var rec:afxprlangspec_pexprrecord);
begin
MEM_newdefault(loopholes.sizeof(afxprlangspec_exprrecord),loopholes.retype(rec,MEM_ptr));
;
;
;
;
;

end;
     procedure afxprmaket_LEAVE(
    var stree1:afxprdecl_psnode);
begin
MEM_newdefault(loopholes.sizeof(afxprdecl_snode),loopholes.retype(stree1,MEM_ptr));
stree1^.cat:=LEAVE;
afxprmaket_LEAVErec(stree1^.ldfield.LEAVEfield)
end;
     procedure afxprmaket_LEAVErec(
     var rec:afxprlangspec_pexprrecord);
begin
MEM_newdefault(loopholes.sizeof(afxprlangspec_exprrecord),loopholes.retype(rec,MEM_ptr));
;
;
;
;
;

end;
     procedure afxprmaket_ROUND(
    var stree1:afxprdecl_psnode);
begin
MEM_newdefault(loopholes.sizeof(afxprdecl_snode),loopholes.retype(stree1,MEM_ptr));
stree1^.cat:=ROUND;
afxprmaket_ROUNDrec(stree1^.ldfield.ROUNDfield)
end;
     procedure afxprmaket_ROUNDrec(
     var rec:afxprlangspec_pexprrecord);
begin
MEM_newdefault(loopholes.sizeof(afxprlangspec_exprrecord),loopholes.retype(rec,MEM_ptr));
;
;
;
;
;

end;
     procedure afxprmaket_REP(
    var stree1:afxprdecl_psnode);
begin
MEM_newdefault(loopholes.sizeof(afxprdecl_snode),loopholes.retype(stree1,MEM_ptr));
stree1^.cat:=REP;
afxprmaket_REPrec(stree1^.ldfield.REPfield)
end;
     procedure afxprmaket_REPrec(
     var rec:afxprlangspec_pexprrecord);
begin
MEM_newdefault(loopholes.sizeof(afxprlangspec_exprrecord),loopholes.retype(rec,MEM_ptr));
;
;
;
;
;

end;
     procedure afxprmaket_LOR(
    var stree1:afxprdecl_psnode);
begin
MEM_newdefault(loopholes.sizeof(afxprdecl_snode),loopholes.retype(stree1,MEM_ptr));
stree1^.cat:=LOR;
afxprmaket_LORrec(stree1^.ldfield.LORfield)
end;
     procedure afxprmaket_LORrec(
     var rec:afxprlangspec_pexprrecord);
begin
MEM_newdefault(loopholes.sizeof(afxprlangspec_exprrecord),loopholes.retype(rec,MEM_ptr));
;
;
;
;
;

end;
     procedure afxprmaket_LOPT(
    var stree1:afxprdecl_psnode);
begin
MEM_newdefault(loopholes.sizeof(afxprdecl_snode),loopholes.retype(stree1,MEM_ptr));
stree1^.cat:=LOPT;
afxprmaket_LOPTrec(stree1^.ldfield.LOPTfield)
end;
     procedure afxprmaket_LOPTrec(
     var rec:afxprlangspec_pexprrecord);
begin
MEM_newdefault(loopholes.sizeof(afxprlangspec_exprrecord),loopholes.retype(rec,MEM_ptr));
;
;
;
;
;

end;
     procedure afxprmaket_LAND(
    var stree1:afxprdecl_psnode);
begin
MEM_newdefault(loopholes.sizeof(afxprdecl_snode),loopholes.retype(stree1,MEM_ptr));
stree1^.cat:=LAND;
afxprmaket_LANDrec(stree1^.ldfield.LANDfield)
end;
     procedure afxprmaket_LANDrec(
     var rec:afxprlangspec_pexprrecord);
begin
MEM_newdefault(loopholes.sizeof(afxprlangspec_exprrecord),loopholes.retype(rec,MEM_ptr));
;
;
;
;
;

end;
     procedure afxprmaket_UTT(
    var stree1:afxprdecl_psnode);
begin
MEM_newdefault(loopholes.sizeof(afxprdecl_snode),loopholes.retype(stree1,MEM_ptr));
stree1^.cat:=UTT;
afxprmaket_UTTrec(stree1^.ldfield.UTTfield)
end;
     procedure afxprmaket_UTTrec(
     var rec:afxprlangspec_puttrecord);
begin
MEM_newdefault(loopholes.sizeof(afxprlangspec_uttrecord),loopholes.retype(rec,MEM_ptr));
;
;
;
;
;

end;
