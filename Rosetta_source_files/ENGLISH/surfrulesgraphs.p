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
prod(i,licat83,
    alt(atom(licat46,1),
        alt(atom(licat63,3),
            alt(atom(licat78,2),
                atom(licat5,4)
                )
            )
        )
    )
END;
{:UTT}

{rule:}
{:VERBPrule}
function RESTgraph:LIPRIMS_psurfgraph;
BEGIN
RESTgraph:=
alt(atom(licat63,10),
    alt(atom(licat63,12),
        alt(atom(licat14,14),
            alt(atom(licat63,13),
                alt(atom(licat14,15),
                    alt(atom(licat5,16),
                        alt(atom(licat46,17),
                            alt(atom(licat63,19),
                                alt(atom(licat103,20),
                                    atom(licat71,21)
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
function AUXVERBSgraph:LIPRIMS_psurfgraph;
BEGIN
AUXVERBSgraph:=
conc(opt(atom(licat102,7)
        ),
    conc(opt(atom(licat102,8)
            ),
        opt(atom(licat102,9)
            )
        )
    )
END;
procedure VERBPrulegraph(i:INTEGER);
BEGIN
prod(i,licat103,
    conc(AUXVERBSgraph,
        conc(opt(atom(licat102,1)
                ),
            conc(opt(atom(licat46,3)
                    ),
                conc(opt(atom(licat54,2)
                        ),
                    conc(opt(atom(licat46,4)
                            ),
                        conc(opt(atom(licat54,2)
                                ),
                            conc(opt(RESTgraph
                                    ),
                                conc(opt(atom(licat63,11)
                                        ),
                                    conc(opt(atom(licat78,5)
                                            ),
                                        conc(opt(atom(licat63,6)
                                                ),
                                            opt(atom(licat63,18)
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
{:VERBPrule}

{rule:}
{:VERBNEGrule}
procedure VERBNEGrulegraph(i:INTEGER);
BEGIN
prod(i,licat102,
    conc(atom(licat102,1),
        conc(atom(licat112,2),
            atom(licat40,3)
            )
        )
    )
END;
{:VERBNEGrule}

{rule:}
{:NP1rule}
procedure NP1rulegraph(i:INTEGER);
BEGIN
prod(i,licat46,
    conc(opt(alt(atom(licat58,1),
            alt(atom(licat32,2),
                atom(licat46,3)
                )
            )
            ),
        conc(atom(licat45,4),
            opt(alt(conc(atom(licat112,5),
                    atom(licat37,6)
                    ),
                atom(licat81,7)
                )
                )
            )
        )
    )
END;
{:NP1rule}

{rule:}
{:NP2rule}
procedure NP2rulegraph(i:INTEGER);
BEGIN
prod(i,licat46,
    conc(alt(atom(licat29,1),
            alt(atom(licat56,2),
                alt(atom(licat38,3),
                    alt(atom(licat109,4),
                        alt(atom(licat70,5),
                            alt(atom(licat75,6),
                                atom(licat59,7)
                                )
                            )
                        )
                    )
                )
            ),
        opt(alt(conc(atom(licat112,8),
                atom(licat37,9)
                ),
            atom(licat63,10)
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
prod(i,licat46,
    conc(opt(atom(licat14,1)
            ),
        conc(atom(licat46,2),
            opt(atom(licat14,3)
                )
            )
        )
    )
END;
{:NP3rule}

{rule:}
{:NP4rule}
procedure NP4rulegraph(i:INTEGER);
BEGIN
prod(i,licat46,
    atom(licat82,1)
    )
END;
{:NP4rule}

{rule:}
{:NP5rule}
procedure NP5rulegraph(i:INTEGER);
BEGIN
prod(i,licat46,
    atom(licat78,1)
    )
END;
{:NP5rule}

{rule:}
{:CN1rule}
procedure CN1rulegraph(i:INTEGER);
BEGIN
prod(i,licat45,
    conc(star(alt(atom(licat5,1),
            alt(atom(licat32,5),
                alt(atom(licat78,16),
                    atom(licat70,13)
                    )
                )
            )
            ),
        conc(atom(licat44,2),
            conc(opt(alt(atom(licat70,17),
                    atom(licat63,18)
                    )
                    ),
                conc(opt(alt(atom(licat63,14),
                        atom(licat78,15)
                        )
                        ),
                    conc(star(alt(atom(licat63,3),
                            atom(licat14,9)
                            )
                            ),
                        star(atom(licat78,4)
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
{:DETPrule}
procedure DETPrulegraph(i:INTEGER);
BEGIN
prod(i,licat32,
    alt(atom(licat52,1),
        alt(atom(licat31,2),
            alt(atom(licat28,3),
                alt(atom(licat74,4),
                    alt(atom(licat19,5),
                        alt(atom(licat24,11),
                            conc(atom(licat32,6),
                                conc(atom(licat62,7),
                                    alt(atom(licat32,8),
                                        alt(atom(licat46,9),
                                            atom(licat58,10)
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
{:PREPPrule}
procedure PREPPrulegraph(i:INTEGER);
BEGIN
prod(i,licat63,
    conc(opt(alt(atom(licat14,3),
            atom(licat46,4)
            )
            ),
        conc(atom(licat62,1),
            opt(alt(atom(licat46,2),
                alt(atom(licat63,5),
                    alt(atom(licat14,6),
                        alt(atom(licat5,7),
                            atom(licat78,8)
                            )
                        )
                    )
                )
                )
            )
        )
    )
END;
{:PREPPrule}

{rule:}
{:ADVPrule1}
procedure ADVPrule1graph(i:INTEGER);
BEGIN
prod(i,licat14,
    conc(opt(alt(atom(licat46,4),
            alt(atom(licat46,44),
                alt(atom(licat74,5),
                    atom(licat14,6)
                    )
                )
            )
            ),
        conc(atom(licat13,1),
            conc(opt(atom(licat81,7)
                    ),
                opt(alt(atom(licat46,2),
                    atom(licat14,3)
                    )
                    )
                )
            )
        )
    )
END;
{:ADVPrule1}

{rule:}
{:NP6rule}
procedure NP6rulegraph(i:INTEGER);
BEGIN
prod(i,licat46,
    atom(licat76,1)
    )
END;
{:NP6rule}

{rule:}
{:NP7rule}
procedure NP7rulegraph(i:INTEGER);
BEGIN
prod(i,licat46,
    conc(atom(licat46,1),
        conc(atom(licat72,2),
            conc(atom(licat46,3),
                opt(atom(licat72,4)
                    )
                )
            )
        )
    )
END;
{:NP7rule}

{rule:}
{:ADJP1srule}
procedure ADJP1srulegraph(i:INTEGER);
BEGIN
prod(i,licat5,
    conc(atom(licat14,1),
        atom(licat5,2)
        )
    )
END;
{:ADJP1srule}

{rule:}
{:ADJP2rule}
procedure ADJP2rulegraph(i:INTEGER);
BEGIN
prod(i,licat5,
    conc(opt(alt(atom(licat74,7),
            alt(atom(licat14,8),
                alt(atom(licat14,88),
                    alt(atom(licat46,9),
                        atom(licat46,25)
                        )
                    )
                )
            )
            ),
        conc(atom(licat4,1),
            conc(opt(atom(licat74,14)
                    ),
                star(alt(atom(licat46,6),
                    alt(atom(licat63,11),
                        alt(atom(licat63,12),
                            alt(atom(licat63,27),
                                atom(licat81,18)
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
{:ADJP2rule}

{rule:}
{:QP1rule}
procedure QP1rulegraph(i:INTEGER);
BEGIN
prod(i,licat74,
    conc(opt(alt(atom(licat14,1),
            atom(licat46,2)
            )
            ),
        conc(opt(atom(licat19,3)
                ),
            conc(atom(licat73,4),
                opt(atom(licat81,5)
                    )
                )
            )
        )
    )
END;
{:QP1rule}

{rule:}
{:THANPrule}
procedure THANPrulegraph(i:INTEGER);
BEGIN
prod(i,licat81,
    conc(atom(licat80,1),
        alt(atom(licat46,2),
            alt(atom(licat63,3),
                alt(atom(licat14,4),
                    alt(atom(licat32,5),
                        atom(licat74,6)
                        )
                    )
                )
            )
        )
    )
END;
{:THANPrule}

{rule:}
{:SENTENCE1rule}
function EXTRAgraph:LIPRIMS_psurfgraph;
BEGIN
EXTRAgraph:=
opt(conc(opt(atom(licat72,7)
        ),
    atom(licat78,24)
    )
    )
END;
function SENTADVSgraph:LIPRIMS_psurfgraph;
BEGIN
SENTADVSgraph:=
star(alt(atom(licat14,20),
    atom(licat63,21)
    )
    )
END;
function TEMPADVSgraph:LIPRIMS_psurfgraph;
BEGIN
TEMPADVSgraph:=
star(alt(atom(licat14,18),
    alt(atom(licat63,19),
        atom(licat46,22)
        )
    )
    )
END;
function LOCADVSgraph:LIPRIMS_psurfgraph;
BEGIN
LOCADVSgraph:=
star(alt(atom(licat14,16),
    atom(licat63,17)
    )
    )
END;
function ADVSgraph:LIPRIMS_psurfgraph;
BEGIN
ADVSgraph:=
conc(LOCADVSgraph,
    conc(TEMPADVSgraph,
        SENTADVSgraph
        )
    )
END;
function CPOSgraph:LIPRIMS_psurfgraph;
BEGIN
CPOSgraph:=
alt(atom(licat102,1),
    alt(atom(licat26,8),
        atom(licat62,34)
        )
    )
END;
function SHgraph:LIPRIMS_psurfgraph;
BEGIN
SHgraph:=
alt(atom(licat46,9),
    alt(atom(licat63,10),
        alt(atom(licat14,11),
            alt(atom(licat5,12),
                atom(licat77,13)
                )
            )
        )
    )
END;
function LDLgraph:LIPRIMS_psurfgraph;
BEGIN
LDLgraph:=
alt(conc(atom(licat78,14),
        opt(atom(licat72,7)
            )
        ),
    alt(conc(atom(licat78,15),
            opt(atom(licat72,7)
                )
            ),
        alt(conc(atom(licat14,29),
                opt(atom(licat72,7)
                    )
                ),
            alt(atom(licat46,27),
                alt(atom(licat63,28),
                    atom(licat5,30)
                    )
                )
            )
        )
    )
END;
procedure SENTENCE1rulegraph(i:INTEGER);
BEGIN
prod(i,licat78,
    conc(opt(LDLgraph
            ),
        conc(opt(SHgraph
                ),
            conc(opt(CPOSgraph
                    ),
                conc(opt(atom(licat112,33)
                        ),
                    conc(opt(alt(atom(licat46,2),
                            atom(licat58,32)
                            )
                            ),
                        conc(opt(atom(licat14,25)
                                ),
                            conc(opt(atom(licat102,3)
                                    ),
                                conc(opt(atom(licat40,6)
                                        ),
                                    conc(opt(atom(licat79,31)
                                            ),
                                        conc(opt(atom(licat14,26)
                                                ),
                                            conc(opt(atom(licat103,4)
                                                    ),
                                                conc(ADVSgraph,
                                                    conc(EXTRAgraph,
                                                        conc(opt(conc(opt(atom(licat72,7)
                                                                    ),
                                                                atom(licat78,23)
                                                                )
                                                                ),
                                                            opt(atom(licat72,5)
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
            )
        )
    )
END;
{:SENTENCE1rule}
procedure SURFRULESGRAPHS_SFG(i:INTEGER);
BEGIN
CASE i OF
  1:UTTgraph(  1);
  2:VERBPrulegraph(  2);
  3:VERBNEGrulegraph(  3);
  4:NP1rulegraph(  4);
  5:NP2rulegraph(  5);
  6:NP3rulegraph(  6);
  7:NP4rulegraph(  7);
  8:NP5rulegraph(  8);
  9:CN1rulegraph(  9);
 10:DETPrulegraph( 10);
 11:PREPPrulegraph( 11);
 12:ADVPrule1graph( 12);
 13:NP6rulegraph( 13);
 14:NP7rulegraph( 14);
 15:ADJP1srulegraph( 15);
 16:ADJP2rulegraph( 16);
 17:QP1rulegraph( 17);
 18:THANPrulegraph( 18);
 19:SENTENCE1rulegraph( 19);
END
END;
FUNCTION SURFRULESGRAPHS_topcat(i:INTEGER):LIDOMAINT_syntcat;
BEGIN
CASE i OF
  1:SURFRULESGRAPHS_topcat:=licat83;
  2:SURFRULESGRAPHS_topcat:=licat103;
  3:SURFRULESGRAPHS_topcat:=licat102;
  4:SURFRULESGRAPHS_topcat:=licat46;
  5:SURFRULESGRAPHS_topcat:=licat46;
  6:SURFRULESGRAPHS_topcat:=licat46;
  7:SURFRULESGRAPHS_topcat:=licat46;
  8:SURFRULESGRAPHS_topcat:=licat46;
  9:SURFRULESGRAPHS_topcat:=licat45;
 10:SURFRULESGRAPHS_topcat:=licat32;
 11:SURFRULESGRAPHS_topcat:=licat63;
 12:SURFRULESGRAPHS_topcat:=licat14;
 13:SURFRULESGRAPHS_topcat:=licat46;
 14:SURFRULESGRAPHS_topcat:=licat46;
 15:SURFRULESGRAPHS_topcat:=licat5;
 16:SURFRULESGRAPHS_topcat:=licat5;
 17:SURFRULESGRAPHS_topcat:=licat74;
 18:SURFRULESGRAPHS_topcat:=licat81;
 19:SURFRULESGRAPHS_topcat:=licat78;
END
END;
