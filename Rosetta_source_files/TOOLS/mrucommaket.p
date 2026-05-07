export(mrucommaket);
pragma c_include('mrucommaket.pf');
pragma c_include('mrucomlangspec.pf');
pragma c_include('string.pf');
pragma c_include('mem.pf');
pragma c_include('mrucomdecl.pf');
program mrucommaket;
WITH mrucomlangspec,
strng,mem,
mrucomdecl;
     procedure mrucommaket_UTT(
    var stree1:mrucomdecl_psnode);
begin
MEM_newdefault(loopholes.sizeof(mrucomdecl_snode),loopholes.retype(stree1,MEM_ptr));
stree1^.cat:=UTT;
mrucommaket_UTTrec(stree1^.ldfield.UTTfield)
end;
     procedure mrucommaket_UTTrec(
     var rec:mrucomlangspec_puttrec);
begin
MEM_newdefault(loopholes.sizeof(mrucomlangspec_uttrec),loopholes.retype(rec,MEM_ptr));
;
rec^.numofrules:=0;
rec^.numoftransforms:=0;
rec^.numoffilters:=0;
rec^.numofsubgrammars:=0;
;
;
;

end;
     procedure mrucommaket_RULESPEC(
    var stree1:mrucomdecl_psnode);
begin
MEM_newdefault(loopholes.sizeof(mrucomdecl_snode),loopholes.retype(stree1,MEM_ptr));
stree1^.cat:=RULESPEC;
mrucommaket_RULESPECrec(stree1^.ldfield.RULESPECfield)
end;
     procedure mrucommaket_RULESPECrec(
     var rec:mrucomlangspec_prulespecrec);
begin
MEM_newdefault(loopholes.sizeof(mrucomlangspec_rulespecrec),loopholes.retype(rec,MEM_ptr));
;
;
;
;
;
;
;
;
;
;
;
;
;
;
;
;
;
;
;
;
;
;
;
;
rec^.compresent:=false;
rec^.Mrule:=false;
rec^.decompresent:=false;
;

end;
     procedure mrucommaket_FILTERSPEC(
    var stree1:mrucomdecl_psnode);
begin
MEM_newdefault(loopholes.sizeof(mrucomdecl_snode),loopholes.retype(stree1,MEM_ptr));
stree1^.cat:=FILTERSPEC;
mrucommaket_FILTERSPECrec(stree1^.ldfield.FILTERSPECfield)
end;
     procedure mrucommaket_FILTERSPECrec(
     var rec:mrucomlangspec_pfilterspecrec);
begin
MEM_newdefault(loopholes.sizeof(mrucomlangspec_filterspecrec),loopholes.retype(rec,MEM_ptr));
;
;
;
;
;
;
;
;
;
;
;
;
;
;

end;
     procedure mrucommaket_SUBGRAMMARSPEC(
    var stree1:mrucomdecl_psnode);
begin
MEM_newdefault(loopholes.sizeof(mrucomdecl_snode),loopholes.retype(stree1,MEM_ptr));
stree1^.cat:=SUBGRAMMARSPEC;
mrucommaket_SUBGRAMMARSPECrec(stree1^.ldfield.SUBGRAMMARSPECfield)
end;
     procedure mrucommaket_SUBGRAMMARSPECrec(
     var rec:mrucomlangspec_psubgramrec);
begin
MEM_newdefault(loopholes.sizeof(mrucomlangspec_subgramrec),loopholes.retype(rec,MEM_ptr));

end;
     procedure mrucommaket_LEFTMODELS(
    var stree1:mrucomdecl_psnode);
begin
MEM_newdefault(loopholes.sizeof(mrucomdecl_snode),loopholes.retype(stree1,MEM_ptr));
stree1^.cat:=LEFTMODELS;
mrucommaket_LEFTMODELSrec(stree1^.ldfield.LEFTMODELSfield)
end;
     procedure mrucommaket_LEFTMODELSrec(
     var rec:mrucomlangspec_pleftmodelsrec);
begin
MEM_newdefault(loopholes.sizeof(mrucomlangspec_leftmodelsrec),loopholes.retype(rec,MEM_ptr));
;
rec^.numberofmodels:=0;
;
;
;
;
;
;
;
rec^.substituent:=0;

end;
     procedure mrucommaket_RIGHTMODEL(
    var stree1:mrucomdecl_psnode);
begin
MEM_newdefault(loopholes.sizeof(mrucomdecl_snode),loopholes.retype(stree1,MEM_ptr));
stree1^.cat:=RIGHTMODEL;
mrucommaket_RIGHTMODELrec(stree1^.ldfield.RIGHTMODELfield)
end;
     procedure mrucommaket_RIGHTMODELrec(
     var rec:mrucomlangspec_prightmodelrec);
begin
MEM_newdefault(loopholes.sizeof(mrucomlangspec_rightmodelrec),loopholes.retype(rec,MEM_ptr));
;
;
;
;
;
;
;
;
;

end;
     procedure mrucommaket_MATCHCONDS(
    var stree1:mrucomdecl_psnode);
begin
MEM_newdefault(loopholes.sizeof(mrucomdecl_snode),loopholes.retype(stree1,MEM_ptr));
stree1^.cat:=MATCHCONDS;
mrucommaket_MATCHCONDSrec(stree1^.ldfield.MATCHCONDSfield)
end;
     procedure mrucommaket_MATCHCONDSrec(
     var rec:mrucomlangspec_pmatchcondsrec);
begin
MEM_newdefault(loopholes.sizeof(mrucomlangspec_matchcondsrec),loopholes.retype(rec,MEM_ptr));
;
;
;
;
;
;
;
;
;
;

end;
     procedure mrucommaket_PARAMETERSspec(
    var stree1:mrucomdecl_psnode);
begin
MEM_newdefault(loopholes.sizeof(mrucomdecl_snode),loopholes.retype(stree1,MEM_ptr));
stree1^.cat:=PARAMETERSspec;
mrucommaket_PARAMETERSspecrec(stree1^.ldfield.PARAMETERSspecfield)
end;
     procedure mrucommaket_PARAMETERSspecrec(
     var rec:mrucomlangspec_pparametersrec);
begin
MEM_newdefault(loopholes.sizeof(mrucomlangspec_parametersrec),loopholes.retype(rec,MEM_ptr));
;
rec^.level:=false
end;
     procedure mrucommaket_SUBRULES(
    var stree1:mrucomdecl_psnode);
begin
MEM_newdefault(loopholes.sizeof(mrucomdecl_snode),loopholes.retype(stree1,MEM_ptr));
stree1^.cat:=SUBRULES;
mrucommaket_SUBRULESrec(stree1^.ldfield.SUBRULESfield)
end;
     procedure mrucommaket_SUBRULESrec(
     var rec:mrucomlangspec_psubrulesrec);
begin
MEM_newdefault(loopholes.sizeof(mrucomlangspec_subrulesrec),loopholes.retype(rec,MEM_ptr));
;
;
rec^.numofsubrules:=0;
;
rec^.compresent:=false;
rec^.decompresent:=false;
;
;
;
;
;
;
;
;
;
;
;
;
;
;
;

end;
     procedure mrucommaket_SUBFILTERS(
    var stree1:mrucomdecl_psnode);
begin
MEM_newdefault(loopholes.sizeof(mrucomdecl_snode),loopholes.retype(stree1,MEM_ptr));
stree1^.cat:=SUBFILTERS;
mrucommaket_SUBFILTERSrec(stree1^.ldfield.SUBFILTERSfield)
end;
     procedure mrucommaket_SUBFILTERSrec(
     var rec:mrucomlangspec_psubfiltersrec);
begin
MEM_newdefault(loopholes.sizeof(mrucomlangspec_subfiltersrec),loopholes.retype(rec,MEM_ptr));
;
;
rec^.numofsubfilters:=0;
;
;
;
;
;
;

end;
     procedure mrucommaket_COMCAPAIRS(
    var stree1:mrucomdecl_psnode);
begin
MEM_newdefault(loopholes.sizeof(mrucomdecl_snode),loopholes.retype(stree1,MEM_ptr));
stree1^.cat:=COMCAPAIRS;
mrucommaket_COMCAPAIRSrec(stree1^.ldfield.COMCAPAIRSfield)
end;
     procedure mrucommaket_COMCAPAIRSrec(
     var rec:mrucomlangspec_pcapairsrec);
begin
MEM_newdefault(loopholes.sizeof(mrucomlangspec_capairsrec),loopholes.retype(rec,MEM_ptr));
;
;
;
;
;
;

end;
     procedure mrucommaket_DECOMCAPAIRS(
    var stree1:mrucomdecl_psnode);
begin
MEM_newdefault(loopholes.sizeof(mrucomdecl_snode),loopholes.retype(stree1,MEM_ptr));
stree1^.cat:=DECOMCAPAIRS;
mrucommaket_DECOMCAPAIRSrec(stree1^.ldfield.DECOMCAPAIRSfield)
end;
     procedure mrucommaket_DECOMCAPAIRSrec(
     var rec:mrucomlangspec_pcapairsrec);
begin
MEM_newdefault(loopholes.sizeof(mrucomlangspec_capairsrec),loopholes.retype(rec,MEM_ptr));
;
;
;
;
;
;

end;
     procedure mrucommaket_CAPAIRS(
    var stree1:mrucomdecl_psnode);
begin
MEM_newdefault(loopholes.sizeof(mrucomdecl_snode),loopholes.retype(stree1,MEM_ptr));
stree1^.cat:=CAPAIRS;
mrucommaket_CAPAIRSrec(stree1^.ldfield.CAPAIRSfield)
end;
     procedure mrucommaket_CAPAIRSrec(
     var rec:mrucomlangspec_pcapairsrec);
begin
MEM_newdefault(loopholes.sizeof(mrucomlangspec_capairsrec),loopholes.retype(rec,MEM_ptr));
;
;
;
;
;
;

end;
     procedure mrucommaket_bareCAPAIRS(
    var stree1:mrucomdecl_psnode);
begin
MEM_newdefault(loopholes.sizeof(mrucomdecl_snode),loopholes.retype(stree1,MEM_ptr));
stree1^.cat:=bareCAPAIRS;
mrucommaket_bareCAPAIRSrec(stree1^.ldfield.bareCAPAIRSfield)
end;
     procedure mrucommaket_bareCAPAIRSrec(
     var rec:mrucomlangspec_pcapairsrec);
begin
MEM_newdefault(loopholes.sizeof(mrucomlangspec_capairsrec),loopholes.retype(rec,MEM_ptr));
;
;
;
;
;
;

end;
     procedure mrucommaket_LABELEDTD(
    var stree1:mrucomdecl_psnode);
begin
MEM_newdefault(loopholes.sizeof(mrucomdecl_snode),loopholes.retype(stree1,MEM_ptr));
stree1^.cat:=LABELEDTD;
mrucommaket_LABELEDTDrec(stree1^.ldfield.LABELEDTDfield)
end;
     procedure mrucommaket_LABELEDTDrec(
     var rec:mrucomlangspec_plabeledtdrec);
begin
MEM_newdefault(loopholes.sizeof(mrucomlangspec_labeledtdrec),loopholes.retype(rec,MEM_ptr));
;
;
;
;
;
;
;
;
;
;
rec^.basiccat:=false;
;
;
;
;
;
rec^.minnum:=0;
rec^.maxnum:=0;
rec^.noderiv:=false;
rec^.varcat:=false
end;
     procedure mrucommaket_LABELtje(
    var stree1:mrucomdecl_psnode);
begin
MEM_newdefault(loopholes.sizeof(mrucomdecl_snode),loopholes.retype(stree1,MEM_ptr));
stree1^.cat:=LABELtje;
mrucommaket_LABELtjerec(stree1^.ldfield.LABELtjefield)
end;
     procedure mrucommaket_LABELtjerec(
     var rec:mrucomlangspec_plabelrec);
begin
MEM_newdefault(loopholes.sizeof(mrucomlangspec_labelrec),loopholes.retype(rec,MEM_ptr));
;
rec^.labelkind:=Ilabel;

end;
     procedure mrucommaket_BARETD(
    var stree1:mrucomdecl_psnode);
begin
MEM_newdefault(loopholes.sizeof(mrucomdecl_snode),loopholes.retype(stree1,MEM_ptr));
stree1^.cat:=BARETD;
mrucommaket_BARETDrec(stree1^.ldfield.BARETDfield)
end;
     procedure mrucommaket_BARETDrec(
     var rec:mrucomlangspec_pbaretdrec);
begin
MEM_newdefault(loopholes.sizeof(mrucomlangspec_baretdrec),loopholes.retype(rec,MEM_ptr));
;
;
;
;
;
rec^.basiccat:=false;
;
;
;
;
rec^.minnum:=0;
rec^.maxnum:=0;
rec^.containsTi:=false;
;
;
;
;
rec^.noderiv:=false;
rec^.varcat:=false
end;
     procedure mrucommaket_LABELEDND(
    var stree1:mrucomdecl_psnode);
begin
MEM_newdefault(loopholes.sizeof(mrucomdecl_snode),loopholes.retype(stree1,MEM_ptr));
stree1^.cat:=LABELEDND;
mrucommaket_LABELEDNDrec(stree1^.ldfield.LABELEDNDfield)
end;
     procedure mrucommaket_LABELEDNDrec(
     var rec:mrucomlangspec_plabeledndrec);
begin
MEM_newdefault(loopholes.sizeof(mrucomlangspec_labeledndrec),loopholes.retype(rec,MEM_ptr));
;
rec^.nodekind:=normaal;
;
;
;
rec^.syncatpresent:=false;
rec^.basiccat:=false;
;
;
;
;
;
;
rec^.varcat:=false;
rec^.noderiv:=false;

end;
     procedure mrucommaket_BAREND(
    var stree1:mrucomdecl_psnode);
begin
MEM_newdefault(loopholes.sizeof(mrucomdecl_snode),loopholes.retype(stree1,MEM_ptr));
stree1^.cat:=BAREND;
mrucommaket_BARENDrec(stree1^.ldfield.BARENDfield)
end;
     procedure mrucommaket_BARENDrec(
     var rec:mrucomlangspec_pbarendrec);
begin
MEM_newdefault(loopholes.sizeof(mrucomlangspec_barendrec),loopholes.retype(rec,MEM_ptr));
;
rec^.nodekind:=normaal;
;
;
;
rec^.syncatpresent:=false;
rec^.basiccat:=false;
;
;
;
;
;
;
rec^.noderiv:=false;
rec^.varcat:=false;
;

end;
     procedure mrucommaket_KEYNAME(
    var stree1:mrucomdecl_psnode);
begin
MEM_newdefault(loopholes.sizeof(mrucomdecl_snode),loopholes.retype(stree1,MEM_ptr));
stree1^.cat:=KEYNAME;
mrucommaket_KEYNAMErec(stree1^.ldfield.KEYNAMEfield)
end;
     procedure mrucommaket_KEYNAMErec(
     var rec:mrucomlangspec_pkeynamerec);
begin
MEM_newdefault(loopholes.sizeof(mrucomlangspec_keynamerec),loopholes.retype(rec,MEM_ptr));
;
rec^.keyvar:=false;
rec^.keyIvar:=false;
;

end;
     procedure mrucommaket_LABELEDLD(
    var stree1:mrucomdecl_psnode);
begin
MEM_newdefault(loopholes.sizeof(mrucomdecl_snode),loopholes.retype(stree1,MEM_ptr));
stree1^.cat:=LABELEDLD;
mrucommaket_LABELEDLDrec(stree1^.ldfield.LABELEDLDfield)
end;
     procedure mrucommaket_LABELEDLDrec(
     var rec:mrucomlangspec_plabeledldrec);
begin
MEM_newdefault(loopholes.sizeof(mrucomlangspec_labeledldrec),loopholes.retype(rec,MEM_ptr));
;
;
;
;
;
;
;
;
;
;
rec^.minnum:=0;
rec^.maxnum:=0
end;
     procedure mrucommaket_BARELD(
    var stree1:mrucomdecl_psnode);
begin
MEM_newdefault(loopholes.sizeof(mrucomdecl_snode),loopholes.retype(stree1,MEM_ptr));
stree1^.cat:=BARELD;
mrucommaket_BARELDrec(stree1^.ldfield.BARELDfield)
end;
     procedure mrucommaket_BARELDrec(
     var rec:mrucomlangspec_pbareldrec);
begin
MEM_newdefault(loopholes.sizeof(mrucomlangspec_bareldrec),loopholes.retype(rec,MEM_ptr));
;
rec^.NumberOfItems:=0;
;
;
;
;
;
;
;
;
rec^.minnum:=0;
rec^.maxnum:=0
end;
     procedure mrucommaket_TREEVAR(
    var stree1:mrucomdecl_psnode);
begin
MEM_newdefault(loopholes.sizeof(mrucomdecl_snode),loopholes.retype(stree1,MEM_ptr));
stree1^.cat:=TREEVAR;
mrucommaket_TREEVARrec(stree1^.ldfield.TREEVARfield)
end;
     procedure mrucommaket_TREEVARrec(
     var rec:mrucomlangspec_pidentrec);
begin
MEM_newdefault(loopholes.sizeof(mrucomlangspec_identrec),loopholes.retype(rec,MEM_ptr));
;

end;
     procedure mrucommaket_CATNAME(
    var stree1:mrucomdecl_psnode);
begin
MEM_newdefault(loopholes.sizeof(mrucomdecl_snode),loopholes.retype(stree1,MEM_ptr));
stree1^.cat:=CATNAME;
mrucommaket_CATNAMErec(stree1^.ldfield.CATNAMEfield)
end;
     procedure mrucommaket_CATNAMErec(
     var rec:mrucomlangspec_pidentrec);
begin
MEM_newdefault(loopholes.sizeof(mrucomlangspec_identrec),loopholes.retype(rec,MEM_ptr));
;

end;
     procedure mrucommaket_CATRECNAME(
    var stree1:mrucomdecl_psnode);
begin
MEM_newdefault(loopholes.sizeof(mrucomdecl_snode),loopholes.retype(stree1,MEM_ptr));
stree1^.cat:=CATRECNAME;
mrucommaket_CATRECNAMErec(stree1^.ldfield.CATRECNAMEfield)
end;
     procedure mrucommaket_CATRECNAMErec(
     var rec:mrucomlangspec_pidentrec);
begin
MEM_newdefault(loopholes.sizeof(mrucomlangspec_identrec),loopholes.retype(rec,MEM_ptr));
;

end;
     procedure mrucommaket_NODEVAR(
    var stree1:mrucomdecl_psnode);
begin
MEM_newdefault(loopholes.sizeof(mrucomdecl_snode),loopholes.retype(stree1,MEM_ptr));
stree1^.cat:=NODEVAR;
mrucommaket_NODEVARrec(stree1^.ldfield.NODEVARfield)
end;
     procedure mrucommaket_NODEVARrec(
     var rec:mrucomlangspec_pidentrec);
begin
MEM_newdefault(loopholes.sizeof(mrucomlangspec_identrec),loopholes.retype(rec,MEM_ptr));
;

end;
     procedure mrucommaket_ITEM(
    var stree1:mrucomdecl_psnode);
begin
MEM_newdefault(loopholes.sizeof(mrucomdecl_snode),loopholes.retype(stree1,MEM_ptr));
stree1^.cat:=ITEM;
mrucommaket_ITEMrec(stree1^.ldfield.ITEMfield)
end;
     procedure mrucommaket_ITEMrec(
     var rec:mrucomlangspec_pitemrec);
begin
MEM_newdefault(loopholes.sizeof(mrucomlangspec_itemrec),loopholes.retype(rec,MEM_ptr));
;
;
;
;
;
;
;
;
;
rec^.minnum:=0;
rec^.maxnum:=0;
rec^.issublist:=FALSE
end;
     procedure mrucommaket_LABELEDITEM(
    var stree1:mrucomdecl_psnode);
begin
MEM_newdefault(loopholes.sizeof(mrucomdecl_snode),loopholes.retype(stree1,MEM_ptr));
stree1^.cat:=LABELEDITEM;
mrucommaket_LABELEDITEMrec(stree1^.ldfield.LABELEDITEMfield)
end;
     procedure mrucommaket_LABELEDITEMrec(
     var rec:mrucomlangspec_plabeleditemrec);
begin
MEM_newdefault(loopholes.sizeof(mrucomlangspec_labeleditemrec),loopholes.retype(rec,MEM_ptr));
;
;
;
;
;
;
;
;
;
rec^.minnum:=0;
rec^.maxnum:=0;
rec^.issublist:=FALSE
end;
     procedure mrucommaket_BAREITEM(
    var stree1:mrucomdecl_psnode);
begin
MEM_newdefault(loopholes.sizeof(mrucomdecl_snode),loopholes.retype(stree1,MEM_ptr));
stree1^.cat:=BAREITEM;
mrucommaket_BAREITEMrec(stree1^.ldfield.BAREITEMfield)
end;
     procedure mrucommaket_BAREITEMrec(
     var rec:mrucomlangspec_pbareitemrec);
begin
MEM_newdefault(loopholes.sizeof(mrucomlangspec_bareitemrec),loopholes.retype(rec,MEM_ptr));
;
;
;
;
;
;
;
;
;
rec^.minnum:=0;
rec^.maxnum:=0;
rec^.issublist:=FALSE
end;
     procedure mrucommaket_MUVAR(
    var stree1:mrucomdecl_psnode);
begin
MEM_newdefault(loopholes.sizeof(mrucomdecl_snode),loopholes.retype(stree1,MEM_ptr));
stree1^.cat:=MUVAR;
mrucommaket_MUVARrec(stree1^.ldfield.MUVARfield)
end;
     procedure mrucommaket_MUVARrec(
     var rec:mrucomlangspec_pidentrec);
begin
MEM_newdefault(loopholes.sizeof(mrucomlangspec_identrec),loopholes.retype(rec,MEM_ptr));
;

end;
     procedure mrucommaket_RELVAR(
    var stree1:mrucomdecl_psnode);
begin
MEM_newdefault(loopholes.sizeof(mrucomdecl_snode),loopholes.retype(stree1,MEM_ptr));
stree1^.cat:=RELVAR;
mrucommaket_RELVARrec(stree1^.ldfield.RELVARfield)
end;
     procedure mrucommaket_RELVARrec(
     var rec:mrucomlangspec_pidentrec);
begin
MEM_newdefault(loopholes.sizeof(mrucomlangspec_identrec),loopholes.retype(rec,MEM_ptr));
;

end;
     procedure mrucommaket_RELNAME(
    var stree1:mrucomdecl_psnode);
begin
MEM_newdefault(loopholes.sizeof(mrucomdecl_snode),loopholes.retype(stree1,MEM_ptr));
stree1^.cat:=RELNAME;
mrucommaket_RELNAMErec(stree1^.ldfield.RELNAMEfield)
end;
     procedure mrucommaket_RELNAMErec(
     var rec:mrucomlangspec_pidentrec);
begin
MEM_newdefault(loopholes.sizeof(mrucomlangspec_identrec),loopholes.retype(rec,MEM_ptr));
;

end;
     procedure mrucommaket_SIGMAVAR(
    var stree1:mrucomdecl_psnode);
begin
MEM_newdefault(loopholes.sizeof(mrucomdecl_snode),loopholes.retype(stree1,MEM_ptr));
stree1^.cat:=SIGMAVAR;
mrucommaket_SIGMAVARrec(stree1^.ldfield.SIGMAVARfield)
end;
     procedure mrucommaket_SIGMAVARrec(
     var rec:mrucomlangspec_pidentrec);
begin
MEM_newdefault(loopholes.sizeof(mrucomlangspec_identrec),loopholes.retype(rec,MEM_ptr));
;

end;
     procedure mrucommaket_RTD(
    var stree1:mrucomdecl_psnode);
begin
MEM_newdefault(loopholes.sizeof(mrucomdecl_snode),loopholes.retype(stree1,MEM_ptr));
stree1^.cat:=RTD;
mrucommaket_RTDrec(stree1^.ldfield.RTDfield)
end;
     procedure mrucommaket_RTDrec(
     var rec:mrucomlangspec_prtdrec);
begin
MEM_newdefault(loopholes.sizeof(mrucomlangspec_rtdrec),loopholes.retype(rec,MEM_ptr));
;
;
;
;
;
rec^.basiccat:=false;
;
;
;
;
;
rec^.minnum:=0;
rec^.maxnum:=0;
rec^.containsTi:=false;
;
;
;
;
rec^.noderiv:=false
end;
     procedure mrucommaket_LD(
    var stree1:mrucomdecl_psnode);
begin
MEM_newdefault(loopholes.sizeof(mrucomdecl_snode),loopholes.retype(stree1,MEM_ptr));
stree1^.cat:=LD;
mrucommaket_LDrec(stree1^.ldfield.LDfield)
end;
     procedure mrucommaket_LDrec(
     var rec:mrucomlangspec_pldrec);
begin
MEM_newdefault(loopholes.sizeof(mrucomlangspec_ldrec),loopholes.retype(rec,MEM_ptr));
;
;
;
;
;
;

end;
     procedure mrucommaket_RELD(
    var stree1:mrucomdecl_psnode);
begin
MEM_newdefault(loopholes.sizeof(mrucomdecl_snode),loopholes.retype(stree1,MEM_ptr));
stree1^.cat:=RELD;
mrucommaket_RELDrec(stree1^.ldfield.RELDfield)
end;
     procedure mrucommaket_RELDrec(
     var rec:mrucomlangspec_preldrec);
begin
MEM_newdefault(loopholes.sizeof(mrucomlangspec_reldrec),loopholes.retype(rec,MEM_ptr));
;
;

end;
     procedure mrucommaket_ANDCOND(
    var stree1:mrucomdecl_psnode);
begin
MEM_newdefault(loopholes.sizeof(mrucomdecl_snode),loopholes.retype(stree1,MEM_ptr));
stree1^.cat:=ANDCOND;
mrucommaket_ANDCONDrec(stree1^.ldfield.ANDCONDfield)
end;
     procedure mrucommaket_ANDCONDrec(
     var rec:mrucomlangspec_pandcondrec);
begin
MEM_newdefault(loopholes.sizeof(mrucomlangspec_andcondrec),loopholes.retype(rec,MEM_ptr));
;
;
;
;
;
;

end;
     procedure mrucommaket_ORCOND(
    var stree1:mrucomdecl_psnode);
begin
MEM_newdefault(loopholes.sizeof(mrucomdecl_snode),loopholes.retype(stree1,MEM_ptr));
stree1^.cat:=ORCOND;
mrucommaket_ORCONDrec(stree1^.ldfield.ORCONDfield)
end;
     procedure mrucommaket_ORCONDrec(
     var rec:mrucomlangspec_porcondrec);
begin
MEM_newdefault(loopholes.sizeof(mrucomlangspec_orcondrec),loopholes.retype(rec,MEM_ptr));
;
;
;
;
;
;

end;
     procedure mrucommaket_ELEMENTARYCOND(
    var stree1:mrucomdecl_psnode);
begin
MEM_newdefault(loopholes.sizeof(mrucomdecl_snode),loopholes.retype(stree1,MEM_ptr));
stree1^.cat:=ELEMENTARYCOND;
mrucommaket_ELEMENTARYCONDrec(stree1^.ldfield.ELEMENTARYCONDfield)
end;
     procedure mrucommaket_ELEMENTARYCONDrec(
     var rec:mrucomlangspec_pelemcondrec);
begin
MEM_newdefault(loopholes.sizeof(mrucomlangspec_elemcondrec),loopholes.retype(rec,MEM_ptr));
;
;
;
;
;
;

end;
     procedure mrucommaket_MATCHBOOLEAN(
    var stree1:mrucomdecl_psnode);
begin
MEM_newdefault(loopholes.sizeof(mrucomdecl_snode),loopholes.retype(stree1,MEM_ptr));
stree1^.cat:=MATCHBOOLEAN;
mrucommaket_MATCHBOOLEANrec(stree1^.ldfield.MATCHBOOLEANfield)
end;
     procedure mrucommaket_MATCHBOOLEANrec(
     var rec:mrucomlangspec_pmatchbooleanrec);
begin
MEM_newdefault(loopholes.sizeof(mrucomlangspec_matchbooleanrec),loopholes.retype(rec,MEM_ptr));
;
;
;
;
;

end;
     procedure mrucommaket_BOOLEANEXPR(
    var stree1:mrucomdecl_psnode);
begin
MEM_newdefault(loopholes.sizeof(mrucomdecl_snode),loopholes.retype(stree1,MEM_ptr));
stree1^.cat:=BOOLEANEXPR;
mrucommaket_BOOLEANEXPRrec(stree1^.ldfield.BOOLEANEXPRfield)
end;
     procedure mrucommaket_BOOLEANEXPRrec(
     var rec:mrucomlangspec_pbooleanexprrec);
begin
MEM_newdefault(loopholes.sizeof(mrucomlangspec_booleanexprrec),loopholes.retype(rec,MEM_ptr));
;

end;
     procedure mrucommaket_PASCALEXPR(
    var stree1:mrucomdecl_psnode);
begin
MEM_newdefault(loopholes.sizeof(mrucomdecl_snode),loopholes.retype(stree1,MEM_ptr));
stree1^.cat:=PASCALEXPR;
mrucommaket_PASCALEXPRrec(stree1^.ldfield.PASCALEXPRfield)
end;
     procedure mrucommaket_PASCALEXPRrec(
     var rec:mrucomlangspec_ppascalexprrec);
begin
MEM_newdefault(loopholes.sizeof(mrucomlangspec_pascalexprrec),loopholes.retype(rec,MEM_ptr));
;

end;
     procedure mrucommaket_CONDRECORD(
    var stree1:mrucomdecl_psnode);
begin
MEM_newdefault(loopholes.sizeof(mrucomdecl_snode),loopholes.retype(stree1,MEM_ptr));
stree1^.cat:=CONDRECORD;
mrucommaket_CONDRECORDrec(stree1^.ldfield.CONDRECORDfield)
end;
     procedure mrucommaket_CONDRECORDrec(
     var rec:mrucomlangspec_pcondrecordrec);
begin
MEM_newdefault(loopholes.sizeof(mrucomlangspec_condrecordrec),loopholes.retype(rec,MEM_ptr));
;
rec^.unequal:=false;
rec^.excond:=false;

end;
     procedure mrucommaket_ASSIGNRECORD(
    var stree1:mrucomdecl_psnode);
begin
MEM_newdefault(loopholes.sizeof(mrucomdecl_snode),loopholes.retype(stree1,MEM_ptr));
stree1^.cat:=ASSIGNRECORD;
mrucommaket_ASSIGNRECORDrec(stree1^.ldfield.ASSIGNRECORDfield)
end;
     procedure mrucommaket_ASSIGNRECORDrec(
     var rec:mrucomlangspec_passignrecrec);
begin
MEM_newdefault(loopholes.sizeof(mrucomlangspec_assignrecrec),loopholes.retype(rec,MEM_ptr));

end;
     procedure mrucommaket_PARNAME(
    var stree1:mrucomdecl_psnode);
begin
MEM_newdefault(loopholes.sizeof(mrucomdecl_snode),loopholes.retype(stree1,MEM_ptr));
stree1^.cat:=PARNAME;
mrucommaket_PARNAMErec(stree1^.ldfield.PARNAMEfield)
end;
     procedure mrucommaket_PARNAMErec(
     var rec:mrucomlangspec_pidentrec);
begin
MEM_newdefault(loopholes.sizeof(mrucomlangspec_identrec),loopholes.retype(rec,MEM_ptr));
;

end;
     procedure mrucommaket_PARTYPE(
    var stree1:mrucomdecl_psnode);
begin
MEM_newdefault(loopholes.sizeof(mrucomdecl_snode),loopholes.retype(stree1,MEM_ptr));
stree1^.cat:=PARTYPE;
mrucommaket_PARTYPErec(stree1^.ldfield.PARTYPEfield)
end;
     procedure mrucommaket_PARTYPErec(
     var rec:mrucomlangspec_pidentrec);
begin
MEM_newdefault(loopholes.sizeof(mrucomlangspec_identrec),loopholes.retype(rec,MEM_ptr));
;

end;
     procedure mrucommaket_LEFTSUBMODELS(
    var stree1:mrucomdecl_psnode);
begin
MEM_newdefault(loopholes.sizeof(mrucomdecl_snode),loopholes.retype(stree1,MEM_ptr));
stree1^.cat:=LEFTSUBMODELS;
mrucommaket_LEFTSUBMODELSrec(stree1^.ldfield.LEFTSUBMODELSfield)
end;
     procedure mrucommaket_LEFTSUBMODELSrec(
     var rec:mrucomlangspec_pleftsubrec);
begin
MEM_newdefault(loopholes.sizeof(mrucomlangspec_leftsubrec),loopholes.retype(rec,MEM_ptr));
;
;
;
;
;
;
;
;
;
;

end;
     procedure mrucommaket_RIGHTSUBMODELS(
    var stree1:mrucomdecl_psnode);
begin
MEM_newdefault(loopholes.sizeof(mrucomdecl_snode),loopholes.retype(stree1,MEM_ptr));
stree1^.cat:=RIGHTSUBMODELS;
mrucommaket_RIGHTSUBMODELSrec(stree1^.ldfield.RIGHTSUBMODELSfield)
end;
     procedure mrucommaket_RIGHTSUBMODELSrec(
     var rec:mrucomlangspec_prightsubrec);
begin
MEM_newdefault(loopholes.sizeof(mrucomlangspec_rightsubrec),loopholes.retype(rec,MEM_ptr));
;
;
;
;
;
;
;
;
;
;

end;
     procedure mrucommaket_CONDITION(
    var stree1:mrucomdecl_psnode);
begin
MEM_newdefault(loopholes.sizeof(mrucomdecl_snode),loopholes.retype(stree1,MEM_ptr));
stree1^.cat:=CONDITION;
mrucommaket_CONDITIONrec(stree1^.ldfield.CONDITIONfield)
end;
     procedure mrucommaket_CONDITIONrec(
     var rec:mrucomlangspec_pconditionrec);
begin
MEM_newdefault(loopholes.sizeof(mrucomlangspec_conditionrec),loopholes.retype(rec,MEM_ptr));
;
;
;
;
;
;

end;
     procedure mrucommaket_ACTION(
    var stree1:mrucomdecl_psnode);
begin
MEM_newdefault(loopholes.sizeof(mrucomdecl_snode),loopholes.retype(stree1,MEM_ptr));
stree1^.cat:=ACTION;
mrucommaket_ACTIONrec(stree1^.ldfield.ACTIONfield)
end;
     procedure mrucommaket_ACTIONrec(
     var rec:mrucomlangspec_pactionrec);
begin
MEM_newdefault(loopholes.sizeof(mrucomlangspec_actionrec),loopholes.retype(rec,MEM_ptr));
;
rec^.counter:=0
end;
     procedure mrucommaket_STATEMENTS(
    var stree1:mrucomdecl_psnode);
begin
MEM_newdefault(loopholes.sizeof(mrucomdecl_snode),loopholes.retype(stree1,MEM_ptr));
stree1^.cat:=STATEMENTS;
mrucommaket_STATEMENTSrec(stree1^.ldfield.STATEMENTSfield)
end;
     procedure mrucommaket_STATEMENTSrec(
     var rec:mrucomlangspec_pstatementsrec);
begin
MEM_newdefault(loopholes.sizeof(mrucomlangspec_statementsrec),loopholes.retype(rec,MEM_ptr));

end;
     procedure mrucommaket_PASCALSTATEMENT(
    var stree1:mrucomdecl_psnode);
begin
MEM_newdefault(loopholes.sizeof(mrucomdecl_snode),loopholes.retype(stree1,MEM_ptr));
stree1^.cat:=PASCALSTATEMENT;
mrucommaket_PASCALSTATEMENTrec(stree1^.ldfield.PASCALSTATEMENTfield)
end;
     procedure mrucommaket_PASCALSTATEMENTrec(
     var rec:mrucomlangspec_ppascalstatrec);
begin
MEM_newdefault(loopholes.sizeof(mrucomlangspec_pascalstatrec),loopholes.retype(rec,MEM_ptr));

end;
     procedure mrucommaket_CLABEL(
    var stree1:mrucomdecl_psnode);
begin
MEM_newdefault(loopholes.sizeof(mrucomdecl_snode),loopholes.retype(stree1,MEM_ptr));
stree1^.cat:=CLABEL;
mrucommaket_CLABELrec(stree1^.ldfield.CLABELfield)
end;
     procedure mrucommaket_CLABELrec(
     var rec:mrucomlangspec_pidentrec);
begin
MEM_newdefault(loopholes.sizeof(mrucomlangspec_identrec),loopholes.retype(rec,MEM_ptr));
;

end;
     procedure mrucommaket_ALABEL(
    var stree1:mrucomdecl_psnode);
begin
MEM_newdefault(loopholes.sizeof(mrucomdecl_snode),loopholes.retype(stree1,MEM_ptr));
stree1^.cat:=ALABEL;
mrucommaket_ALABELrec(stree1^.ldfield.ALABELfield)
end;
     procedure mrucommaket_ALABELrec(
     var rec:mrucomlangspec_pidentrec);
begin
MEM_newdefault(loopholes.sizeof(mrucomlangspec_identrec),loopholes.retype(rec,MEM_ptr));
;

end;
     procedure mrucommaket_ILABELtje(
    var stree1:mrucomdecl_psnode);
begin
MEM_newdefault(loopholes.sizeof(mrucomdecl_snode),loopholes.retype(stree1,MEM_ptr));
stree1^.cat:=ILABELtje;
mrucommaket_ILABELtjerec(stree1^.ldfield.ILABELtjefield)
end;
     procedure mrucommaket_ILABELtjerec(
     var rec:mrucomlangspec_pidentrec);
begin
MEM_newdefault(loopholes.sizeof(mrucomlangspec_identrec),loopholes.retype(rec,MEM_ptr));
;

end;
     procedure mrucommaket_MLABELtje(
    var stree1:mrucomdecl_psnode);
begin
MEM_newdefault(loopholes.sizeof(mrucomdecl_snode),loopholes.retype(stree1,MEM_ptr));
stree1^.cat:=MLABELtje;
mrucommaket_MLABELtjerec(stree1^.ldfield.MLABELtjefield)
end;
     procedure mrucommaket_MLABELtjerec(
     var rec:mrucomlangspec_pidentrec);
begin
MEM_newdefault(loopholes.sizeof(mrucomlangspec_identrec),loopholes.retype(rec,MEM_ptr));
;

end;
     procedure mrucommaket_RLABELtje(
    var stree1:mrucomdecl_psnode);
begin
MEM_newdefault(loopholes.sizeof(mrucomdecl_snode),loopholes.retype(stree1,MEM_ptr));
stree1^.cat:=RLABELtje;
mrucommaket_RLABELtjerec(stree1^.ldfield.RLABELtjefield)
end;
     procedure mrucommaket_RLABELtjerec(
     var rec:mrucomlangspec_pidentrec);
begin
MEM_newdefault(loopholes.sizeof(mrucomlangspec_identrec),loopholes.retype(rec,MEM_ptr));
;

end;
     procedure mrucommaket_LLABELtje(
    var stree1:mrucomdecl_psnode);
begin
MEM_newdefault(loopholes.sizeof(mrucomdecl_snode),loopholes.retype(stree1,MEM_ptr));
stree1^.cat:=LLABELtje;
mrucommaket_LLABELtjerec(stree1^.ldfield.LLABELtjefield)
end;
     procedure mrucommaket_LLABELtjerec(
     var rec:mrucomlangspec_pidentrec);
begin
MEM_newdefault(loopholes.sizeof(mrucomlangspec_identrec),loopholes.retype(rec,MEM_ptr));
;

end;
     procedure mrucommaket_TRUECAT(
    var stree1:mrucomdecl_psnode);
begin
MEM_newdefault(loopholes.sizeof(mrucomdecl_snode),loopholes.retype(stree1,MEM_ptr));
stree1^.cat:=TRUECAT;
mrucommaket_TRUECATrec(stree1^.ldfield.TRUECATfield)
end;
     procedure mrucommaket_TRUECATrec(
     var rec:mrucomlangspec_pidentrec);
begin
MEM_newdefault(loopholes.sizeof(mrucomlangspec_identrec),loopholes.retype(rec,MEM_ptr));
;

end;
     procedure mrucommaket_CATCAT(
    var stree1:mrucomdecl_psnode);
begin
MEM_newdefault(loopholes.sizeof(mrucomdecl_snode),loopholes.retype(stree1,MEM_ptr));
stree1^.cat:=CATCAT;
mrucommaket_CATCATrec(stree1^.ldfield.CATCATfield)
end;
     procedure mrucommaket_CATCATrec(
     var rec:mrucomlangspec_pidentrec);
begin
MEM_newdefault(loopholes.sizeof(mrucomlangspec_identrec),loopholes.retype(rec,MEM_ptr));
;

end;
     procedure mrucommaket_GRAPH(
    var stree1:mrucomdecl_psnode);
begin
MEM_newdefault(loopholes.sizeof(mrucomdecl_snode),loopholes.retype(stree1,MEM_ptr));
stree1^.cat:=GRAPH;
mrucommaket_GRAPHrec(stree1^.ldfield.GRAPHfield)
end;
     procedure mrucommaket_GRAPHrec(
     var rec:mrucomlangspec_pgraphrec);
begin
MEM_newdefault(loopholes.sizeof(mrucomlangspec_graphrec),loopholes.retype(rec,MEM_ptr));
;
rec^.numofconcgraphs:=0
end;
     procedure mrucommaket_CONCGRAPH(
    var stree1:mrucomdecl_psnode);
begin
MEM_newdefault(loopholes.sizeof(mrucomdecl_snode),loopholes.retype(stree1,MEM_ptr));
stree1^.cat:=CONCGRAPH;
mrucommaket_CONCGRAPHrec(stree1^.ldfield.CONCGRAPHfield)
end;
     procedure mrucommaket_CONCGRAPHrec(
     var rec:mrucomlangspec_pconcgraphrec);
begin
MEM_newdefault(loopholes.sizeof(mrucomlangspec_concgraphrec),loopholes.retype(rec,MEM_ptr));
;
rec^.numofelemgraphs:=0
end;
     procedure mrucommaket_ELEMENTARYGRAPH(
    var stree1:mrucomdecl_psnode);
begin
MEM_newdefault(loopholes.sizeof(mrucomdecl_snode),loopholes.retype(stree1,MEM_ptr));
stree1^.cat:=ELEMENTARYGRAPH;
mrucommaket_ELEMENTARYGRAPHrec(stree1^.ldfield.ELEMENTARYGRAPHfield)
end;
     procedure mrucommaket_ELEMENTARYGRAPHrec(
     var rec:mrucomlangspec_pelemgraphrec);
begin
MEM_newdefault(loopholes.sizeof(mrucomlangspec_elemgraphrec),loopholes.retype(rec,MEM_ptr));
;
rec^.graphtype:=atomgraph
end;
     procedure mrucommaket_NUMBER(
    var stree1:mrucomdecl_psnode);
begin
MEM_newdefault(loopholes.sizeof(mrucomdecl_snode),loopholes.retype(stree1,MEM_ptr));
stree1^.cat:=NUMBER;
mrucommaket_NUMBERrec(stree1^.ldfield.NUMBERfield)
end;
     procedure mrucommaket_NUMBERrec(
     var rec:mrucomlangspec_pnumberrec);
begin
MEM_newdefault(loopholes.sizeof(mrucomlangspec_numberrec),loopholes.retype(rec,MEM_ptr));
;

end;
     procedure mrucommaket_VARNAME(
    var stree1:mrucomdecl_psnode);
begin
MEM_newdefault(loopholes.sizeof(mrucomdecl_snode),loopholes.retype(stree1,MEM_ptr));
stree1^.cat:=VARNAME;
mrucommaket_VARNAMErec(stree1^.ldfield.VARNAMEfield)
end;
     procedure mrucommaket_VARNAMErec(
     var rec:mrucomlangspec_pvarnamerec);
begin
MEM_newdefault(loopholes.sizeof(mrucomlangspec_varnamerec),loopholes.retype(rec,MEM_ptr));
;
rec^.varkind:=recfield;
;

end;
     procedure mrucommaket_VALUENAME(
    var stree1:mrucomdecl_psnode);
begin
MEM_newdefault(loopholes.sizeof(mrucomdecl_snode),loopholes.retype(stree1,MEM_ptr));
stree1^.cat:=VALUENAME;
mrucommaket_VALUENAMErec(stree1^.ldfield.VALUENAMEfield)
end;
     procedure mrucommaket_VALUENAMErec(
     var rec:mrucomlangspec_pvaluenamerec);
begin
MEM_newdefault(loopholes.sizeof(mrucomlangspec_valuenamerec),loopholes.retype(rec,MEM_ptr));
;

end;
     procedure mrucommaket_SETVALUENAME(
    var stree1:mrucomdecl_psnode);
begin
MEM_newdefault(loopholes.sizeof(mrucomdecl_snode),loopholes.retype(stree1,MEM_ptr));
stree1^.cat:=SETVALUENAME;
mrucommaket_SETVALUENAMErec(stree1^.ldfield.SETVALUENAMEfield)
end;
     procedure mrucommaket_SETVALUENAMErec(
     var rec:mrucomlangspec_psetvaluerec);
begin
MEM_newdefault(loopholes.sizeof(mrucomlangspec_setvaluerec),loopholes.retype(rec,MEM_ptr));
;
;
rec^.varfound:=false;
rec^.relationtype:=false;
rec^.typecode:=0
end;
     procedure mrucommaket_BONUSspec(
    var stree1:mrucomdecl_psnode);
begin
MEM_newdefault(loopholes.sizeof(mrucomdecl_snode),loopholes.retype(stree1,MEM_ptr));
stree1^.cat:=BONUSspec;
mrucommaket_BONUSspecrec(stree1^.ldfield.BONUSspecfield)
end;
     procedure mrucommaket_BONUSspecrec(
     var rec:mrucomlangspec_pbonusspecrec);
begin
MEM_newdefault(loopholes.sizeof(mrucomlangspec_bonusspecrec),loopholes.retype(rec,MEM_ptr));

end;
     procedure mrucommaket_DTREE(
    var stree1:mrucomdecl_psnode);
begin
MEM_newdefault(loopholes.sizeof(mrucomdecl_snode),loopholes.retype(stree1,MEM_ptr));
stree1^.cat:=DTREE;
mrucommaket_DTREErec(stree1^.ldfield.DTREEfield)
end;
     procedure mrucommaket_DTREErec(
     var rec:mrucomlangspec_pdtreerec);
begin
MEM_newdefault(loopholes.sizeof(mrucomlangspec_dtreerec),loopholes.retype(rec,MEM_ptr));
;
rec^.variable:=false;
rec^.rulenode:=false;
rec^.normalnode:=false;
rec^.nrargs:=0;
;
;
;
;
;
;

end;
     procedure mrucommaket_LABELEDDTREE(
    var stree1:mrucomdecl_psnode);
begin
MEM_newdefault(loopholes.sizeof(mrucomdecl_snode),loopholes.retype(stree1,MEM_ptr));
stree1^.cat:=LABELEDDTREE;
mrucommaket_LABELEDDTREErec(stree1^.ldfield.LABELEDDTREEfield)
end;
     procedure mrucommaket_LABELEDDTREErec(
     var rec:mrucomlangspec_plabeleddtreerec);
begin
MEM_newdefault(loopholes.sizeof(mrucomlangspec_labeleddtreerec),loopholes.retype(rec,MEM_ptr));
;
;
rec^.variable:=false;
;
;
;
;
;
;

end;
