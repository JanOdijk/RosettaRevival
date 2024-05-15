EXPORT(surfrulesgraphs);
pragma C_include('liprims.pf');
pragma C_include('lidomaint.pf');
pragma C_include('surfrulesgraphs.pf');
PROGRAM surfrulesgraphs;
WITH liprims,lidomaint;

{rule:}
{:UTT}
procedure UTTgraph(i:INTEGER);
BEGIN
prod(i,licat91,
    alt(atom(licat53,1),
        alt(conc(opt(conc(atom(licat42,3),
                    opt(atom(licat78,4)
                        )
                    )
                    ),
                atom(licat87,2)
                ),
            alt(atom(licat6,1),
                alt(atom(licat69,1),
                    alt(atom(licat16,1),
                        atom(licat42,1)
                        )
                    )
                )
            )
        )
    )
END;
{:UTT}

{rule:}
{:Vcomplex}
procedure Vcomplexgraph(i:INTEGER);
BEGIN
prod(i,licat105,
    alt(conc(atom(licat88,1),
            atom(licat105,2)
            ),
        alt(conc(atom(licat60,3),
                atom(licat105,4)
                ),
            alt(conc(atom(licat105,5),
                    atom(licat105,6)
                    ),
                alt(conc(atom(licat105,7),
                        atom(licat105,8)
                        ),
                    alt(conc(atom(licat105,9),
                            atom(licat105,10)
                            ),
                        alt(conc(atom(licat105,11),
                                atom(licat105,12)
                                ),
                            alt(conc(atom(licat105,13),
                                    atom(licat105,14)
                                    ),
                                alt(conc(atom(licat105,15),
                                        atom(licat105,16)
                                        ),
                                    alt(conc(atom(licat68,17),
                                            conc(atom(licat24,18),
                                                atom(licat105,19)
                                                )
                                            ),
                                        alt(conc(atom(licat68,20),
                                                conc(atom(licat116,21),
                                                    atom(licat105,22)
                                                    )
                                                ),
                                            conc(atom(licat68,20),
                                                atom(licat105,23)
                                                )
                                            )
                                        )
                                    )
                                )
                            )
                        )
                    )
                )
            )
        )
    )
END;
{:Vcomplex}

{rule:}
{:VP}
function POSTPPSgraph:LIPRIMS_psurfgraph;
BEGIN
POSTPPSgraph:=
conc(star(atom(licat69,22)
        ),
    star(atom(licat69,23)
        )
    )
END;
function VERBSgraph:LIPRIMS_psurfgraph;
BEGIN
VERBSgraph:=
conc(atom(licat105,18),
    conc(opt(alt(atom(licat105,19),
            atom(licat105,29)
            )
            ),
        opt(alt(atom(licat105,20),
            atom(licat105,30)
            )
            )
        )
    )
END;
function PPSgraph:LIPRIMS_psurfgraph;
BEGIN
PPSgraph:=
alt(atom(licat69,5),
    alt(atom(licat69,6),
        alt(atom(licat69,8),
            atom(licat69,10)
            )
        )
    )
END;
function REST1graph:LIPRIMS_psurfgraph;
BEGIN
REST1graph:=
alt(PPSgraph,
    alt(atom(licat16,7),
        alt(atom(licat16,9),
            alt(atom(licat16,11),
                alt(atom(licat53,12),
                    alt(atom(licat6,13),
                        alt(atom(licat53,34),
                            atom(licat107,35)
                            )
                        )
                    )
                )
            )
        )
    )
END;
function RESTgraph:LIPRIMS_psurfgraph;
BEGIN
RESTgraph:=
alt(conc(REST1graph,
        opt(alt(atom(licat69,14),
            alt(atom(licat69,15),
                atom(licat69,16)
                )
            )
            )
        ),
    conc(alt(atom(licat69,14),
            alt(atom(licat69,15),
                atom(licat69,16)
                )
            ),
        PPSgraph
        )
    )
END;
function DOgraph:LIPRIMS_psurfgraph;
BEGIN
DOgraph:=
alt(atom(licat53,4),
    alt(atom(licat53,31),
        alt(atom(licat79,36),
            atom(licat79,37)
            )
        )
    )
END;
function IOgraph:LIPRIMS_psurfgraph;
BEGIN
IOgraph:=
alt(atom(licat53,1),
    alt(atom(licat69,2),
        alt(atom(licat69,3),
            atom(licat69,21)
            )
        )
    )
END;
function COMPLSgraph:LIPRIMS_psurfgraph;
BEGIN
COMPLSgraph:=
conc(opt(IOgraph
        ),
    conc(opt(DOgraph
            ),
        opt(RESTgraph
            )
        )
    )
END;
function VRPARTgraph:LIPRIMS_psurfgraph;
BEGIN
VRPARTgraph:=
conc(opt(alt(atom(licat53,32),
        atom(licat53,33)
        )
        ),
    star(atom(licat53,24)
        )
    )
END;
function VPADVSgraph:LIPRIMS_psurfgraph;
BEGIN
VPADVSgraph:=
star(alt(atom(licat69,25),
    alt(atom(licat16,26),
        alt(atom(licat69,27),
            atom(licat16,28)
            )
        )
    )
    )
END;
procedure VPgraph(i:INTEGER);
BEGIN
prod(i,licat107,
    conc(VPADVSgraph,
        conc(VRPARTgraph,
            conc(COMPLSgraph,
                conc(opt(atom(licat60,17)
                        ),
                    conc(VERBSgraph,
                        POSTPPSgraph
                        )
                    )
                )
            )
        )
    )
END;
{:VP}

{rule:}
{:NP1rule}
procedure NP1rulegraph(i:INTEGER);
BEGIN
prod(i,licat53,
    conc(opt(alt(atom(licat65,1),
            alt(atom(licat37,2),
                atom(licat53,3)
                )
            )
            ),
        conc(opt(atom(licat52,4)
                ),
            opt(alt(atom(licat90,5),
                atom(licat69,6)
                )
                )
            )
        )
    )
END;
{:NP1rule}

{rule:}
{:NP1arule}
procedure NP1arulegraph(i:INTEGER);
BEGIN
prod(i,licat53,
    conc(atom(licat37,2),
        opt(atom(licat52,4)
            )
        )
    )
END;
{:NP1arule}

{rule:}
{:NP2rule}
procedure NP2rulegraph(i:INTEGER);
BEGIN
prod(i,licat53,
    conc(alt(atom(licat33,1),
            alt(atom(licat62,2),
                alt(atom(licat44,3),
                    alt(atom(licat113,4),
                        atom(licat77,5)
                        )
                    )
                )
            ),
        conc(star(alt(atom(licat69,6),
                atom(licat69,7)
                )
                ),
            opt(atom(licat87,8)
                )
            )
        )
    )
END;
{:NP2rule}

{rule:}
{:NP3rule}
procedure NP3rulegraph(i:INTEGER);
BEGIN
prod(i,licat53,
    conc(atom(licat16,1),
        atom(licat53,2)
        )
    )
END;
{:NP3rule}

{rule:}
{:NP4rule}
procedure NP4rulegraph(i:INTEGER);
BEGIN
prod(i,licat53,
    atom(licat83,1)
    )
END;
{:NP4rule}

{rule:}
{:NP5rule}
procedure NP5rulegraph(i:INTEGER);
BEGIN
prod(i,licat53,
    atom(licat84,1)
    )
END;
{:NP5rule}

{rule:}
{:NP6rule}
procedure NP6rulegraph(i:INTEGER);
BEGIN
prod(i,licat53,
    conc(atom(licat53,1),
        conc(atom(licat78,2),
            conc(atom(licat53,3),
                opt(atom(licat78,4)
                    )
                )
            )
        )
    )
END;
{:NP6rule}

{rule:}
{:NP7rule}
procedure NP7rulegraph(i:INTEGER);
BEGIN
prod(i,licat53,
    conc(atom(licat37,2),
        opt(atom(licat52,4)
            )
        )
    )
END;
{:NP7rule}

{rule:}
{:DETPrule}
procedure DETPrulegraph(i:INTEGER);
BEGIN
prod(i,licat37,
    conc(opt(atom(licat24,12)
            ),
        alt(atom(licat58,1),
            alt(atom(licat35,2),
                alt(atom(licat32,3),
                    alt(atom(licat82,4),
                        alt(atom(licat24,5),
                            alt(atom(licat28,11),
                                conc(atom(licat37,6),
                                    conc(atom(licat68,7),
                                        alt(atom(licat37,8),
                                            alt(atom(licat53,9),
                                                atom(licat65,10)
                                                )
                                            )
                                        )
                                    )
                                )
                            )
                        )
                    )
                )
            )
        )
    )
END;
{:DETPrule}

{rule:}
{:DETP2rule}
procedure DETP2rulegraph(i:INTEGER);
BEGIN
prod(i,licat37,
    atom(licat35,2)
    )
END;
{:DETP2rule}

{rule:}
{:CN1rule}
procedure CN1rulegraph(i:INTEGER);
BEGIN
prod(i,licat52,
    conc(star(alt(atom(licat6,2),
            alt(atom(licat37,3),
                atom(licat87,4)
                )
            )
            ),
        conc(atom(licat50,5),
            conc(opt(atom(licat82,12)
                    ),
                conc(opt(alt(atom(licat69,14),
                        atom(licat87,15)
                        )
                        ),
                    conc(opt(atom(licat53,6)
                            ),
                        conc(opt(atom(licat77,13)
                                ),
                            conc(star(alt(atom(licat69,8),
                                    atom(licat16,9)
                                    )
                                    ),
                                star(atom(licat87,11)
                                    )
                                )
                            )
                        )
                    )
                )
            )
        )
    )
END;
{:CN1rule}

{rule:}
{:CN2rule}
procedure CN2rulegraph(i:INTEGER);
BEGIN
prod(i,licat52,
    conc(star(alt(atom(licat37,1),
            alt(atom(licat6,2),
                atom(licat87,3)
                )
            )
            ),
        conc(star(atom(licat69,4)
                ),
            star(atom(licat87,6)
                )
            )
        )
    )
END;
{:CN2rule}

{rule:}
{:PREPP}
function PPCOMPLSgraph:LIPRIMS_psurfgraph;
BEGIN
PPCOMPLSgraph:=
alt(atom(licat53,2),
    alt(atom(licat69,5),
        alt(atom(licat6,6),
            alt(atom(licat16,7),
                atom(licat84,12)
                )
            )
        )
    )
END;
function MODgraph:LIPRIMS_psurfgraph;
BEGIN
MODgraph:=
alt(atom(licat16,10),
    atom(licat53,11)
    )
END;
procedure PREPPgraph(i:INTEGER);
BEGIN
prod(i,licat69,
    conc(opt(MODgraph
            ),
        conc(opt(conc(atom(licat22,3),
                opt(atom(licat116,4)
                    )
                )
                ),
            conc(opt(atom(licat68,1)
                    ),
                conc(opt(PPCOMPLSgraph
                        ),
                    opt(alt(atom(licat68,8),
                        alt(atom(licat60,9),
                            atom(licat69,13)
                            )
                        )
                        )
                    )
                )
            )
        )
    )
END;
{:PREPP}

{rule:}
{:RADVP}
procedure RADVPgraph(i:INTEGER);
BEGIN
prod(i,licat22,
    atom(licat21,1)
    )
END;
{:RADVP}

{rule:}
{:ADVP}
procedure ADVPgraph(i:INTEGER);
BEGIN
prod(i,licat16,
    conc(opt(alt(atom(licat53,4),
            alt(atom(licat53,44),
                alt(atom(licat82,5),
                    atom(licat16,6)
                    )
                )
            )
            ),
        conc(atom(licat14,1),
            conc(opt(alt(atom(licat90,7),
                    atom(licat6,8)
                    )
                    ),
                opt(alt(atom(licat53,2),
                    atom(licat16,3)
                    )
                    )
                )
            )
        )
    )
END;
{:ADVP}

{rule:}
{:DatumNP}
procedure DatumNPgraph(i:INTEGER);
BEGIN
prod(i,licat53,
    alt(conc(opt(conc(opt(atom(licat53,8)
                    ),
                atom(licat37,1)
                )
                ),
            conc(atom(licat77,2),
                opt(atom(licat53,3)
                    )
                )
            ),
        conc(opt(conc(atom(licat28,4),
                atom(licat78,5)
                )
                ),
            conc(atom(licat28,6),
                opt(conc(atom(licat78,5),
                    atom(licat53,7)
                    )
                    )
                )
            )
        )
    )
END;
{:DatumNP}

{rule:}
{:NPcardrule}
procedure NPcardrulegraph(i:INTEGER);
BEGIN
prod(i,licat53,
    atom(licat28,1)
    )
END;
{:NPcardrule}

{rule:}
{:ADJP1srule}
procedure ADJP1srulegraph(i:INTEGER);
BEGIN
prod(i,licat6,
    conc(atom(licat16,1),
        atom(licat6,2)
        )
    )
END;
{:ADJP1srule}

{rule:}
{:ADJP2srule}
function ADJQADVgraph:LIPRIMS_psurfgraph;
BEGIN
ADJQADVgraph:=
atom(licat16,41)
END;
function ADJLOCADVgraph:LIPRIMS_psurfgraph;
BEGIN
ADJLOCADVgraph:=
alt(atom(licat16,38),
    alt(atom(licat69,39),
        atom(licat22,40)
        )
    )
END;
function ADJSTADVgraph:LIPRIMS_psurfgraph;
BEGIN
ADJSTADVgraph:=
alt(atom(licat45,31),
    alt(atom(licat63,32),
        alt(atom(licat16,33),
            alt(atom(licat69,34),
                alt(atom(licat16,35),
                    alt(atom(licat69,36),
                        alt(atom(licat53,37),
                            ADJQADVgraph
                            )
                        )
                    )
                )
            )
        )
    )
END;
procedure ADJP2srulegraph(i:INTEGER);
BEGIN
prod(i,licat6,
    conc(star(alt(ADJSTADVgraph,
            alt(ADJLOCADVgraph,
                alt(atom(licat84,1),
                    alt(atom(licat53,2),
                        alt(atom(licat69,3),
                            alt(atom(licat69,4),
                                alt(atom(licat69,22),
                                    atom(licat69,5)
                                    )
                                )
                            )
                        )
                    )
                )
            )
            ),
        conc(opt(atom(licat53,6)
                ),
            conc(opt(alt(atom(licat82,7),
                    alt(atom(licat82,77),
                        alt(atom(licat16,8),
                            alt(atom(licat16,88),
                                alt(atom(licat53,9),
                                    atom(licat53,25)
                                    )
                                )
                            )
                        )
                    )
                    ),
                conc(opt(alt(atom(licat69,10),
                        atom(licat69,11)
                        )
                        ),
                    conc(opt(atom(licat24,12)
                            ),
                        conc(atom(licat4,13),
                            conc(opt(alt(atom(licat82,14),
                                    atom(licat6,21)
                                    )
                                    ),
                                conc(star(alt(atom(licat69,15),
                                        alt(atom(licat69,23),
                                            alt(atom(licat69,24),
                                                alt(atom(licat69,27),
                                                    alt(atom(licat87,17),
                                                        alt(atom(licat90,18),
                                                            alt(atom(licat87,19),
                                                                atom(licat87,26)
                                                                )
                                                            )
                                                        )
                                                    )
                                                )
                                            )
                                        )
                                        ),
                                    opt(atom(licat87,20)
                                        )
                                    )
                                )
                            )
                        )
                    )
                )
            )
        )
    )
END;
{:ADJP2srule}

{rule:}
{:THANASPsrule}
procedure THANASPsrulegraph(i:INTEGER);
BEGIN
prod(i,licat90,
    conc(atom(licat89,1),
        alt(atom(licat53,2),
            alt(atom(licat69,3),
                alt(atom(licat16,4),
                    alt(atom(licat37,5),
                        atom(licat6,6)
                        )
                    )
                )
            )
        )
    )
END;
{:THANASPsrule}

{rule:}
{:QPsrule}
procedure QPsrulegraph(i:INTEGER);
BEGIN
prod(i,licat82,
    conc(opt(alt(atom(licat16,1),
            atom(licat53,2)
            )
            ),
        conc(opt(atom(licat24,3)
                ),
            conc(atom(licat81,4),
                opt(atom(licat90,5)
                    )
                )
            )
        )
    )
END;
{:QPsrule}

{rule:}
{:PPcoord}
procedure PPcoordgraph(i:INTEGER);
BEGIN
prod(i,licat69,
    conc(opt(atom(licat31,1)
            ),
        conc(star(conc(atom(licat69,2),
                alt(atom(licat31,3),
                    atom(licat78,4)
                    )
                )
                ),
            conc(atom(licat69,5),
                conc(atom(licat31,6),
                    atom(licat69,7)
                    )
                )
            )
        )
    )
END;
{:PPcoord}

{rule:}
{:AdvPcoord}
procedure AdvPcoordgraph(i:INTEGER);
BEGIN
prod(i,licat16,
    conc(opt(atom(licat31,1)
            ),
        conc(star(conc(atom(licat16,2),
                alt(atom(licat31,3),
                    atom(licat78,4)
                    )
                )
                ),
            conc(atom(licat16,5),
                conc(atom(licat31,6),
                    atom(licat16,7)
                    )
                )
            )
        )
    )
END;
{:AdvPcoord}

{rule:}
{:ADJPcoord}
procedure ADJPcoordgraph(i:INTEGER);
BEGIN
prod(i,licat6,
    conc(opt(atom(licat31,1)
            ),
        conc(star(conc(atom(licat6,2),
                alt(atom(licat31,3),
                    atom(licat78,4)
                    )
                )
                ),
            conc(atom(licat6,5),
                conc(atom(licat31,6),
                    atom(licat6,7)
                    )
                )
            )
        )
    )
END;
{:ADJPcoord}

{rule:}
{:NPcoord}
procedure NPcoordgraph(i:INTEGER);
BEGIN
prod(i,licat53,
    conc(opt(atom(licat31,1)
            ),
        conc(star(conc(atom(licat53,2),
                alt(atom(licat31,3),
                    atom(licat78,4)
                    )
                )
                ),
            conc(atom(licat53,5),
                conc(atom(licat31,6),
                    atom(licat53,7)
                    )
                )
            )
        )
    )
END;
{:NPcoord}

{rule:}
{:Scoord}
procedure Scoordgraph(i:INTEGER);
BEGIN
prod(i,licat87,
    conc(opt(atom(licat31,1)
            ),
        conc(star(conc(atom(licat87,2),
                alt(atom(licat31,3),
                    atom(licat78,4)
                    )
                )
                ),
            conc(atom(licat87,5),
                conc(atom(licat31,6),
                    atom(licat87,7)
                    )
                )
            )
        )
    )
END;
{:Scoord}

{rule:}
{:SENTENCEsrule}
function SPOSTPPSgraph:LIPRIMS_psurfgraph;
BEGIN
SPOSTPPSgraph:=
conc(star(atom(licat69,67)
        ),
    star(atom(licat69,68)
        )
    )
END;
function SPPSgraph:LIPRIMS_psurfgraph;
BEGIN
SPPSgraph:=
alt(atom(licat69,53),
    alt(atom(licat69,54),
        alt(atom(licat69,56),
            atom(licat69,58)
            )
        )
    )
END;
function SREST1graph:LIPRIMS_psurfgraph;
BEGIN
SREST1graph:=
alt(SPPSgraph,
    alt(atom(licat16,55),
        alt(atom(licat16,57),
            alt(atom(licat16,59),
                alt(atom(licat53,60),
                    alt(atom(licat6,61),
                        alt(atom(licat53,73),
                            atom(licat107,77)
                            )
                        )
                    )
                )
            )
        )
    )
END;
function SRESTgraph:LIPRIMS_psurfgraph;
BEGIN
SRESTgraph:=
alt(conc(SREST1graph,
        opt(alt(atom(licat69,63),
            atom(licat69,64)
            )
            )
        ),
    conc(alt(atom(licat69,63),
            atom(licat69,64)
            ),
        SPPSgraph
        )
    )
END;
function SDOgraph:LIPRIMS_psurfgraph;
BEGIN
SDOgraph:=
alt(atom(licat53,52),
    atom(licat79,78)
    )
END;
function SIOgraph:LIPRIMS_psurfgraph;
BEGIN
SIOgraph:=
alt(atom(licat53,49),
    alt(atom(licat69,50),
        alt(atom(licat69,51),
            atom(licat69,66)
            )
        )
    )
END;
function SCOMPLSgraph:LIPRIMS_psurfgraph;
BEGIN
SCOMPLSgraph:=
conc(opt(SIOgraph
        ),
    conc(opt(SDOgraph
            ),
        opt(SRESTgraph
            )
        )
    )
END;
function SVPADVSgraph:LIPRIMS_psurfgraph;
BEGIN
SVPADVSgraph:=
star(alt(atom(licat69,69),
    alt(atom(licat16,70),
        atom(licat16,72)
        )
    )
    )
END;
function NOVERBPgraph:LIPRIMS_psurfgraph;
BEGIN
NOVERBPgraph:=
conc(SVPADVSgraph,
    conc(SCOMPLSgraph,
        conc(opt(alt(atom(licat60,65),
                atom(licat68,74)
                )
                ),
            SPOSTPPSgraph
            )
        )
    )
END;
function EXTRAgraph:LIPRIMS_psurfgraph;
BEGIN
EXTRAgraph:=
conc(star(atom(licat69,12)
        ),
    conc(opt(conc(opt(atom(licat78,15)
                ),
            atom(licat87,17)
            )
            ),
        conc(opt(conc(opt(atom(licat78,15)
                    ),
                atom(licat87,16)
                )
                ),
            conc(opt(alt(atom(licat90,18),
                    atom(licat25,19)
                    )
                    ),
                opt(conc(opt(atom(licat78,20)
                        ),
                    atom(licat87,21)
                    )
                    )
                )
            )
        )
    )
END;
function QADVgraph:LIPRIMS_psurfgraph;
BEGIN
QADVgraph:=
atom(licat16,41)
END;
function LOCADVgraph:LIPRIMS_psurfgraph;
BEGIN
LOCADVgraph:=
alt(atom(licat16,38),
    alt(atom(licat69,39),
        atom(licat22,40)
        )
    )
END;
function STADVgraph:LIPRIMS_psurfgraph;
BEGIN
STADVgraph:=
alt(atom(licat16,31),
    alt(atom(licat69,32),
        alt(atom(licat16,33),
            alt(atom(licat69,34),
                alt(atom(licat53,35),
                    alt(atom(licat53,45),
                        alt(atom(licat53,36),
                            alt(atom(licat53,37),
                                alt(QADVgraph,
                                    atom(licat16,14)
                                    )
                                )
                            )
                        )
                    )
                )
            )
        )
    )
END;
function CLITICSgraph:LIPRIMS_psurfgraph;
BEGIN
CLITICSgraph:=
conc(opt(atom(licat62,22)
        ),
    conc(opt(atom(licat62,23)
            ),
        opt(atom(licat62,24)
            )
        )
    )
END;
function ERPOSgraph:LIPRIMS_psurfgraph;
BEGIN
ERPOSgraph:=
alt(conc(atom(licat22,26),
        opt(atom(licat116,48)
            )
        ),
    alt(atom(licat69,27),
        alt(atom(licat22,28),
            atom(licat22,47)
            )
        )
    )
END;
function M1graph:LIPRIMS_psurfgraph;
BEGIN
M1graph:=
conc(CLITICSgraph,
    conc(star(alt(STADVgraph,
            alt(ERPOSgraph,
                alt(atom(licat84,25),
                    conc(opt(atom(licat78,15)
                            ),
                        atom(licat87,43)
                        )
                    )
                )
            )
            ),
        star(alt(LOCADVgraph,
            alt(QADVgraph,
                alt(atom(licat45,29),
                    atom(licat63,30)
                    )
                )
            )
            )
        )
    )
END;
function CPOSgraph:LIPRIMS_psurfgraph;
BEGIN
CPOSgraph:=
alt(atom(licat30,8),
    atom(licat105,9)
    )
END;
function SHgraph:LIPRIMS_psurfgraph;
BEGIN
SHgraph:=
alt(atom(licat53,3),
    alt(atom(licat69,4),
        alt(atom(licat16,5),
            alt(atom(licat6,6),
                alt(atom(licat22,7),
                    alt(atom(licat86,13),
                        atom(licat22,42)
                        )
                    )
                )
            )
        )
    )
END;
function LDLgraph:LIPRIMS_psurfgraph;
BEGIN
LDLgraph:=
alt(conc(atom(licat87,1),
        opt(atom(licat78,2)
            )
        ),
    conc(atom(licat87,46),
        opt(atom(licat78,15)
            )
        )
    )
END;
procedure SENTENCEsrulegraph(i:INTEGER);
BEGIN
prod(i,licat87,
    conc(opt(atom(licat31,79)
            ),
        conc(opt(alt(atom(licat68,62),
                atom(licat68,71)
                )
                ),
            conc(opt(LDLgraph
                    ),
                conc(opt(SHgraph
                        ),
                    conc(opt(CPOSgraph
                            ),
                        conc(opt(atom(licat53,10)
                                ),
                            conc(M1graph,
                                conc(alt(atom(licat107,11),
                                        NOVERBPgraph
                                        ),
                                    conc(EXTRAgraph,
                                        conc(opt(atom(licat87,76)
                                                ),
                                            conc(opt(conc(opt(atom(licat78,2)
                                                        ),
                                                    atom(licat87,44)
                                                    )
                                                    ),
                                                opt(atom(licat78,75)
                                                    )
                                                )
                                            )
                                        )
                                    )
                                )
                            )
                        )
                    )
                )
            )
        )
    )
END;
{:SENTENCEsrule}
procedure SURFRULESGRAPHS_SFG(i:INTEGER);
BEGIN
CASE i OF
  1:UTTgraph(  1);
  2:Vcomplexgraph(  2);
  3:VPgraph(  3);
  4:NP1rulegraph(  4);
  5:NP1arulegraph(  5);
  6:NP2rulegraph(  6);
  7:NP3rulegraph(  7);
  8:NP4rulegraph(  8);
  9:NP5rulegraph(  9);
 10:NP6rulegraph( 10);
 11:NP7rulegraph( 11);
 12:DETPrulegraph( 12);
 13:DETP2rulegraph( 13);
 14:CN1rulegraph( 14);
 15:CN2rulegraph( 15);
 16:PREPPgraph( 16);
 17:RADVPgraph( 17);
 18:ADVPgraph( 18);
 19:DatumNPgraph( 19);
 20:NPcardrulegraph( 20);
 21:ADJP1srulegraph( 21);
 22:ADJP2srulegraph( 22);
 23:THANASPsrulegraph( 23);
 24:QPsrulegraph( 24);
 25:PPcoordgraph( 25);
 26:AdvPcoordgraph( 26);
 27:ADJPcoordgraph( 27);
 28:NPcoordgraph( 28);
 29:Scoordgraph( 29);
 30:SENTENCEsrulegraph( 30);
END
END;
FUNCTION SURFRULESGRAPHS_topcat(i:INTEGER):LIDOMAINT_syntcat;
BEGIN
CASE i OF
  1:SURFRULESGRAPHS_topcat:=licat91;
  2:SURFRULESGRAPHS_topcat:=licat105;
  3:SURFRULESGRAPHS_topcat:=licat107;
  4:SURFRULESGRAPHS_topcat:=licat53;
  5:SURFRULESGRAPHS_topcat:=licat53;
  6:SURFRULESGRAPHS_topcat:=licat53;
  7:SURFRULESGRAPHS_topcat:=licat53;
  8:SURFRULESGRAPHS_topcat:=licat53;
  9:SURFRULESGRAPHS_topcat:=licat53;
 10:SURFRULESGRAPHS_topcat:=licat53;
 11:SURFRULESGRAPHS_topcat:=licat53;
 12:SURFRULESGRAPHS_topcat:=licat37;
 13:SURFRULESGRAPHS_topcat:=licat37;
 14:SURFRULESGRAPHS_topcat:=licat52;
 15:SURFRULESGRAPHS_topcat:=licat52;
 16:SURFRULESGRAPHS_topcat:=licat69;
 17:SURFRULESGRAPHS_topcat:=licat22;
 18:SURFRULESGRAPHS_topcat:=licat16;
 19:SURFRULESGRAPHS_topcat:=licat53;
 20:SURFRULESGRAPHS_topcat:=licat53;
 21:SURFRULESGRAPHS_topcat:=licat6;
 22:SURFRULESGRAPHS_topcat:=licat6;
 23:SURFRULESGRAPHS_topcat:=licat90;
 24:SURFRULESGRAPHS_topcat:=licat82;
 25:SURFRULESGRAPHS_topcat:=licat69;
 26:SURFRULESGRAPHS_topcat:=licat16;
 27:SURFRULESGRAPHS_topcat:=licat6;
 28:SURFRULESGRAPHS_topcat:=licat53;
 29:SURFRULESGRAPHS_topcat:=licat87;
 30:SURFRULESGRAPHS_topcat:=licat87;
END
END;
