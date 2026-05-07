EXPORT(mrucomgraphdef);
pragma C_include('mrucomgraphdef.pf');
pragma C_include('mrucomgraph.pf');
pragma C_include('mrucomlangspec.pf');
pragma C_include('mrucomdecl.pf');
PROGRAM mrucomGRAPHDEF;
WITH mrucomgraph,
mrucomdecl,
mrucomlangspec;

{rule:}
{:UTT}
procedure UTTgraph(i:INTEGER);
BEGIN
prod(i,UTT,
    conc(atom(IDENTIFIER,6),
        conc(atom(IDENTIFIER,7),
            conc(atom(PROCENT,5),
                conc(star(alt(atom(RULESPEC,1),
                        alt(atom(FILTERSPEC,3),
                            atom(SUBGRAMMARSPEC,4)
                            )
                        )
                        ),
                    atom(PROCENT,5)
                    )
                )
            )
        )
    )
END;
{:UTT}

{rule:}
{:SUBGRAMMARSPEC}
function HEADDESCRIPTIONgraph:mrucomDECL_psurfgraph;
BEGIN
HEADDESCRIPTIONgraph:=
conc(atom(HEAD,1),
    conc(atom(DOTDOT,1),
        conc(atom(LEFTARROW,1),
            conc(star(conc(atom(CATNAME,4),
                    alt(conc(atom(FROM,1),
                            conc(atom(ROUNDOPEN,1),
                                conc(opt(conc(atom(IDENTIFIER,5),
                                        star(conc(atom(COMMA,1),
                                            atom(IDENTIFIER,5)
                                            )
                                            )
                                        )
                                        ),
                                    atom(ROUNDCLOSE,1)
                                    )
                                )
                            ),
                        conc(atom(BASIC,1),
                            atom(EXPRESSION,11)
                            )
                        )
                    )
                    ),
                atom(RIGHTARROW,1)
                )
            )
        )
    )
END;
function IMPORTDESCRIPTIONgraph:mrucomDECL_psurfgraph;
BEGIN
IMPORTDESCRIPTIONgraph:=
conc(atom(NUMBER,6),
    conc(atom(DOTDOT,1),
        conc(atom(LEFTARROW,1),
            conc(star(conc(atom(ARGUMENT,1),
                    conc(atom(NUMBER,7),
                        conc(atom(CATNAME,10),
                            alt(conc(atom(FROM,1),
                                    conc(atom(ROUNDOPEN,1),
                                        conc(opt(conc(atom(IDENTIFIER,8),
                                                star(conc(atom(COMMA,1),
                                                    atom(IDENTIFIER,8)
                                                    )
                                                    )
                                                )
                                                ),
                                            atom(ROUNDCLOSE,1)
                                            )
                                        )
                                    ),
                                conc(atom(BASIC,1),
                                    atom(EXPRESSION,12)
                                    )
                                )
                            )
                        )
                    )
                    ),
                atom(RIGHTARROW,1)
                )
            )
        )
    )
END;
function EXPORTDESCRIPTIONgraph:mrucomDECL_psurfgraph;
BEGIN
EXPORTDESCRIPTIONgraph:=
conc(atom(EXPORT,1),
    conc(atom(DOTDOT,1),
        conc(atom(LEFTARROW,1),
            conc(star(atom(CATNAME,9)
                    ),
                atom(RIGHTARROW,1)
                )
            )
        )
    )
END;
procedure SUBGRAMMARSPECgraph(i:INTEGER);
BEGIN
prod(i,SUBGRAMMARSPEC,
    conc(atom(SUBGRAMMAR,1),
        conc(atom(IDENTIFIER,3),
            conc(atom(GRAPH,2),
                conc(HEADDESCRIPTIONgraph,
                    conc(atom(LEFTARROW,1),
                        conc(star(IMPORTDESCRIPTIONgraph
                                ),
                            conc(atom(RIGHTARROW,1),
                                EXPORTDESCRIPTIONgraph
                                )
                            )
                        )
                    )
                )
            )
        )
    )
END;
{:SUBGRAMMARSPEC}

{rule:}
{:GRAPH}
procedure GRAPHgraph(i:INTEGER);
BEGIN
prod(i,GRAPH,
    conc(atom(CONCGRAPH,2),
        star(conc(atom(VERTLINE,1),
            atom(CONCGRAPH,2)
            )
            )
        )
    )
END;
{:GRAPH}

{rule:}
{:CONCGRAPH}
procedure CONCGRAPHgraph(i:INTEGER);
BEGIN
prod(i,CONCGRAPH,
    conc(atom(ELEMENTARYGRAPH,2),
        star(conc(atom(DOT,1),
            atom(ELEMENTARYGRAPH,2)
            )
            )
        )
    )
END;
{:CONCGRAPH}

{rule:}
{:ELEMENTARYGRAPH}
procedure ELEMENTARYGRAPHgraph(i:INTEGER);
BEGIN
prod(i,ELEMENTARYGRAPH,
    alt(conc(atom(ROUNDOPEN,1),
            conc(atom(GRAPH,2),
                atom(ROUNDCLOSE,1)
                )
            ),
        alt(conc(atom(SQUAREOPEN,1),
                conc(atom(GRAPH,3),
                    atom(SQUARECLOSE,1)
                    )
                ),
            alt(conc(atom(CURLYOPEN,1),
                    conc(atom(GRAPH,4),
                        atom(CURLYCLOSE,1)
                        )
                    ),
                conc(atom(IDENTIFIER,5),
                    conc(atom(SLASH,1),
                        atom(NUMBER,6)
                        )
                    )
                )
            )
        )
    )
END;
{:ELEMENTARYGRAPH}

{rule:}
{:NUMBER}
procedure NUMBERgraph(i:INTEGER);
BEGIN
prod(i,NUMBER,
    atom(IDENTIFIER,1)
    )
END;
{:NUMBER}

{rule:}
{:RULESPEC}
procedure RULESPECgraph(i:INTEGER);
BEGIN
prod(i,RULESPEC,
    conc(alt(atom(RULE,1),
            atom(TRANSFORMATION,10)
            ),
        conc(atom(IDENTIFIER,2),
            conc(atom(LEFTMODELS,3),
                conc(atom(RIGHTMODEL,4),
                    conc(opt(atom(MATCHCONDS,5)
                            ),
                        conc(opt(atom(PARAMETERSspec,6)
                                ),
                            alt(atom(SUBRULES,7),
                                conc(opt(atom(COMCAPAIRS,8)
                                        ),
                                    opt(atom(DECOMCAPAIRS,9)
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
{:RULESPEC}

{rule:}
{:FILTERSPEC}
procedure FILTERSPECgraph(i:INTEGER);
BEGIN
prod(i,FILTERSPEC,
    conc(opt(atom(POSITIVE,9)
            ),
        conc(atom(FILTER,1),
            conc(atom(IDENTIFIER,2),
                conc(atom(RIGHTMODEL,3),
                    conc(opt(atom(MATCHCONDS,4)
                            ),
                        alt(atom(SUBFILTERS,6),
                            conc(opt(alt(atom(COMP,7),
                                    atom(DECOMP,8)
                                    )
                                    ),
                                atom(CAPAIRS,5)
                                )
                            )
                        )
                    )
                )
            )
        )
    )
END;
{:FILTERSPEC}

{rule:}
{:LEFTMODELS}
procedure LEFTMODELSgraph(i:INTEGER);
BEGIN
prod(i,LEFTMODELS,
    conc(atom(LEFTARROW,1),
        conc(opt(conc(atom(SUBST,3),
                atom(DOTDOT,1)
                )
                ),
            conc(atom(LABELEDTD,2),
                conc(star(conc(opt(conc(atom(SUBST,3),
                            atom(DOTDOT,1)
                            )
                            ),
                        atom(LABELEDTD,2)
                        )
                        ),
                    atom(RIGHTARROW,1)
                    )
                )
            )
        )
    )
END;
{:LEFTMODELS}

{rule:}
{:RIGHTMODEL}
procedure RIGHTMODELgraph(i:INTEGER);
BEGIN
prod(i,RIGHTMODEL,
    conc(atom(LEFTARROW,1),
        conc(alt(atom(LABELEDTD,2),
                atom(LABELEDDTREE,3)
                ),
            atom(RIGHTARROW,1)
            )
        )
    )
END;
{:RIGHTMODEL}

{rule:}
{:LABELEDTD}
procedure LABELEDTDgraph(i:INTEGER);
BEGIN
prod(i,LABELEDTD,
    conc(alt(atom(ILABELtje,2),
            alt(atom(MLABELtje,3),
                atom(TREEVAR,5)
                )
            ),
        conc(atom(DOTDOT,1),
            atom(BARETD,4)
            )
        )
    )
END;
{:LABELEDTD}

{rule:}
{:BARETD}
function NODEgraph:mrucomDECL_psurfgraph;
BEGIN
NODEgraph:=
alt(atom(LABELEDND,2),
    atom(BAREND,3)
    )
END;
function LISTgraph:mrucomDECL_psurfgraph;
BEGIN
LISTgraph:=
alt(atom(LABELEDLD,4),
    atom(BARELD,5)
    )
END;
function HOEDJEgraph:mrucomDECL_psurfgraph;
BEGIN
HOEDJEgraph:=
conc(atom(CHAPEAU,6),
    atom(BARETD,7)
    )
END;
procedure BARETDgraph(i:INTEGER);
BEGIN
prod(i,BARETD,
    alt(conc(opt(conc(atom(TREEVAR,9),
                atom(ISCAT,8)
                )
                ),
            conc(NODEgraph,
                alt(opt(LISTgraph
                        ),
                    HOEDJEgraph
                    )
                )
            ),
        atom(TREEVAR,1)
        )
    )
END;
{:BARETD}

{rule:}
{:LABELEDND}
procedure LABELEDNDgraph(i:INTEGER);
BEGIN
prod(i,LABELEDND,
    conc(atom(ILABELtje,2),
        conc(atom(DOTDOT,1),
            conc(atom(DOTDOT,1),
                atom(BAREND,3)
                )
            )
        )
    )
END;
{:LABELEDND}

{rule:}
{:LABELEDLD}
procedure LABELEDLDgraph(i:INTEGER);
BEGIN
prod(i,LABELEDLD,
    conc(alt(atom(ILABELtje,2),
            alt(atom(MUVAR,4),
                atom(SIGMAVAR,5)
                )
            ),
        conc(atom(DOTDOT,1),
            atom(BARELD,3)
            )
        )
    )
END;
{:LABELEDLD}

{rule:}
{:BAREND}
function NORMALNODEgraph:mrucomDECL_psurfgraph;
BEGIN
NORMALNODEgraph:=
conc(atom(CATNAME,2),
    conc(opt(conc(atom(ROUNDOPEN,1),
            conc(alt(atom(KEYNAME,5),
                    atom(LABELEDDTREE,6)
                    ),
                atom(ROUNDCLOSE,1)
                )
            )
            ),
        conc(atom(CURLYOPEN,1),
            conc(opt(atom(CATRECNAME,3)
                    ),
                atom(CURLYCLOSE,1)
                )
            )
        )
    )
END;
procedure BARENDgraph(i:INTEGER);
BEGIN
prod(i,BAREND,
    alt(NORMALNODEgraph,
        atom(NODEVAR,4)
        )
    )
END;
{:BAREND}

{rule:}
{:BARELD}
procedure BARELDgraph(i:INTEGER);
BEGIN
prod(i,BARELD,
    conc(opt(conc(atom(MUVAR,3),
            atom(ISCAT,1)
            )
            ),
        conc(atom(SQUAREOPEN,1),
            conc(opt(conc(atom(ITEM,2),
                    star(conc(atom(COMMA,1),
                        atom(ITEM,2)
                        )
                        )
                    )
                    ),
                atom(SQUARECLOSE,1)
                )
            )
        )
    )
END;
{:BARELD}

{rule:}
{:ITEM}
procedure ITEMgraph(i:INTEGER);
BEGIN
prod(i,ITEM,
    alt(atom(LABELEDITEM,1),
        atom(BAREITEM,2)
        )
    )
END;
{:ITEM}

{rule:}
{:LABELEDITEM}
procedure LABELEDITEMgraph(i:INTEGER);
BEGIN
prod(i,LABELEDITEM,
    conc(atom(ILABELtje,2),
        conc(atom(DOTDOT,1),
            atom(BAREITEM,3)
            )
        )
    )
END;
{:LABELEDITEM}

{rule:}
{:BAREITEM}
procedure BAREITEMgraph(i:INTEGER);
BEGIN
prod(i,BAREITEM,
    alt(atom(MUVAR,1),
        alt(atom(SIGMAVAR,2),
            alt(atom(BARELD,3),
                atom(RTD,4)
                )
            )
        )
    )
END;
{:BAREITEM}

{rule:}
{:LD}
procedure LDgraph(i:INTEGER);
BEGIN
prod(i,LD,
    alt(atom(LABELEDLD,1),
        atom(BARELD,2)
        )
    )
END;
{:LD}

{rule:}
{:RTD}
procedure RTDgraph(i:INTEGER);
BEGIN
prod(i,RTD,
    conc(atom(RELD,2),
        conc(atom(SLASH,1),
            atom(BARETD,3)
            )
        )
    )
END;
{:RTD}

{rule:}
{:RELD}
procedure RELDgraph(i:INTEGER);
BEGIN
prod(i,RELD,
    alt(atom(RELNAME,1),
        atom(RELVAR,2)
        )
    )
END;
{:RELD}

{rule:}
{:MATCHCONDS}
procedure MATCHCONDSgraph(i:INTEGER);
BEGIN
prod(i,MATCHCONDS,
    conc(atom(MATCHCONDITIONS,7),
        conc(atom(LEFTARROW,1),
            conc(star(conc(atom(LABELtje,2),
                    conc(atom(DOTDOT,1),
                        conc(opt(alt(atom(LEFTTORIGHT,3),
                                alt(atom(RIGHTTOLEFT,4),
                                    atom(ALL,6)
                                    )
                                )
                                ),
                            opt(atom(ANDCOND,5)
                                )
                            )
                        )
                    )
                    ),
                atom(RIGHTARROW,1)
                )
            )
        )
    )
END;
{:MATCHCONDS}

{rule:}
{:ANDCOND}
function WITHEXPRgraph:mrucomDECL_psurfgraph;
BEGIN
WITHEXPRgraph:=
conc(opt(atom(NOTCAT,10)
        ),
    conc(alt(atom(NODEVAR,7),
            atom(TREEVAR,3)
            ),
        conc(atom(DOT,8),
            conc(atom(CATCAT,4),
                conc(atom(INCAT,9),
                    conc(atom(SETVALUENAME,5),
                        atom(WITHje,6)
                        )
                    )
                )
            )
        )
    )
END;
procedure ANDCONDgraph(i:INTEGER);
BEGIN
prod(i,ANDCOND,
    conc(opt(WITHEXPRgraph
            ),
        conc(atom(ORCOND,2),
            star(conc(atom(ANDCAT,1),
                atom(ORCOND,2)
                )
                )
            )
        )
    )
END;
{:ANDCOND}

{rule:}
{:ORCOND}
procedure ORCONDgraph(i:INTEGER);
BEGIN
prod(i,ORCOND,
    conc(atom(ELEMENTARYCOND,2),
        star(conc(atom(ORCAT,1),
            atom(ELEMENTARYCOND,2)
            )
            )
        )
    )
END;
{:ORCOND}

{rule:}
{:ELEMENTARYCOND}
function IMPLYgraph:mrucomDECL_psurfgraph;
BEGIN
IMPLYgraph:=
conc(atom(ANDCOND,25),
    conc(atom(MINCAT,1),
        conc(atom(RIGHTARROW,1),
            atom(ANDCOND,26)
            )
        )
    )
END;
function IDLEXCONDgraph:mrucomDECL_psurfgraph;
BEGIN
IDLEXCONDgraph:=
alt(conc(atom(DECOMPINIDDICT,1),
        conc(atom(ROUNDOPEN,1),
            conc(atom(LEFTARROW,1),
                conc(atom(KEYNAME,22),
                    conc(star(conc(atom(COMMA,1),
                            atom(KEYNAME,22)
                            )
                            ),
                        conc(atom(RIGHTARROW,24),
                            conc(atom(COMMA,16),
                                conc(atom(IDENTIFIER,23),
                                    atom(ROUNDCLOSE,8)
                                    )
                                )
                            )
                        )
                    )
                )
            )
        ),
    conc(atom(COMPINIDDICT,20),
        conc(atom(ROUNDOPEN,6),
            conc(atom(KEYNAME,19),
                conc(atom(COMMA,16),
                    conc(atom(IDENTIFIER,23),
                        atom(ROUNDCLOSE,8)
                        )
                    )
                )
            )
        )
    )
END;
function SEMILEXCONDgraph:mrucomDECL_psurfgraph;
BEGIN
SEMILEXCONDgraph:=
conc(alt(atom(COMPINSIDDICT,20),
        atom(DECOMPINSIDDICT,20)
        ),
    conc(atom(ROUNDOPEN,6),
        conc(atom(KEYNAME,19),
            conc(atom(COMMA,16),
                conc(atom(KEYNAME,19),
                    conc(atom(COMMA,16),
                        conc(atom(IDENTIFIER,11),
                            atom(ROUNDCLOSE,8)
                            )
                        )
                    )
                )
            )
        )
    )
END;
function QUOTECONDgraph:mrucomDECL_psurfgraph;
BEGIN
QUOTECONDgraph:=
conc(opt(atom(NOTCAT,12)
        ),
    conc(opt(atom(ROUNDOPEN,13)
            ),
        conc(atom(QUOTE,5),
            conc(atom(UNDERSCORE,1),
                conc(atom(IDENTIFIER,7),
                    conc(opt(conc(atom(ROUNDOPEN,6),
                            conc(alt(atom(IDENTIFIER,11),
                                    alt(conc(alt(atom(AUX,18),
                                                atom(KEYtje,21)
                                                ),
                                            conc(atom(UNDERSCORE,1),
                                                atom(IDENTIFIER,11)
                                                )
                                            ),
                                        alt(conc(atom(IDENTIFIER,11),
                                                conc(atom(DOT,14),
                                                    atom(IDENTIFIER,11)
                                                    )
                                                ),
                                            conc(atom(SQUAREOPEN,15),
                                                conc(opt(conc(atom(IDENTIFIER,11),
                                                        star(conc(atom(COMMA,16),
                                                            atom(IDENTIFIER,11)
                                                            )
                                                            )
                                                        )
                                                        ),
                                                    atom(SQUARECLOSE,17)
                                                    )
                                                )
                                            )
                                        )
                                    ),
                                conc(star(conc(atom(COMMA,16),
                                        alt(atom(IDENTIFIER,11),
                                            alt(conc(alt(atom(AUX,18),
                                                        atom(KEYtje,21)
                                                        ),
                                                    conc(atom(UNDERSCORE,1),
                                                        atom(IDENTIFIER,11)
                                                        )
                                                    ),
                                                alt(conc(atom(IDENTIFIER,11),
                                                        conc(atom(DOT,14),
                                                            atom(IDENTIFIER,11)
                                                            )
                                                        ),
                                                    conc(atom(SQUAREOPEN,15),
                                                        conc(opt(conc(atom(IDENTIFIER,11),
                                                                star(conc(atom(COMMA,16),
                                                                    atom(IDENTIFIER,11)
                                                                    )
                                                                    )
                                                                )
                                                                ),
                                                            atom(SQUARECLOSE,17)
                                                            )
                                                        )
                                                    )
                                                )
                                            )
                                        )
                                        ),
                                    atom(ROUNDCLOSE,8)
                                    )
                                )
                            )
                            ),
                        opt(atom(ROUNDCLOSE,13)
                            )
                        )
                    )
                )
            )
        )
    )
END;
procedure ELEMENTARYCONDgraph(i:INTEGER);
BEGIN
prod(i,ELEMENTARYCOND,
    alt(conc(atom(ROUNDOPEN,1),
            conc(atom(ANDCOND,2),
                atom(ROUNDCLOSE,1)
                )
            ),
        alt(atom(MATCHBOOLEAN,3),
            alt(atom(BOOLEANEXPR,4),
                alt(QUOTECONDgraph,
                    alt(SEMILEXCONDgraph,
                        alt(IDLEXCONDgraph,
                            IMPLYgraph
                            )
                        )
                    )
                )
            )
        )
    )
END;
{:ELEMENTARYCOND}

{rule:}
{:BOOLEANEXPR}
procedure BOOLEANEXPRgraph(i:INTEGER);
BEGIN
prod(i,BOOLEANEXPR,
    alt(atom(PASCALEXPR,1),
        alt(atom(CONDRECORD,2),
            alt(atom(TRUECAT,3),
                conc(alt(atom(MUVAR,4),
                        atom(SIGMAVAR,8)
                        ),
                    conc(alt(atom(ISCAT,5),
                            conc(atom(LEFTARROW,6),
                                atom(RIGHTARROW,6)
                                )
                            ),
                        conc(atom(SQUAREOPEN,7),
                            atom(SQUARECLOSE,9)
                            )
                        )
                    )
                )
            )
        )
    )
END;
{:BOOLEANEXPR}

{rule:}
{:MATCHBOOLEAN}
procedure MATCHBOOLEANgraph(i:INTEGER);
BEGIN
prod(i,MATCHBOOLEAN,
    alt(conc(opt(atom(NOTCAT,2)
                ),
            conc(atom(EQUALS,9),
                conc(atom(ROUNDOPEN,1),
                    conc(alt(atom(MUVAR,4),
                            atom(SIGMAVAR,5)
                            ),
                        conc(atom(COMMA,1),
                            conc(atom(LD,11),
                                atom(ROUNDCLOSE,1)
                                )
                            )
                        )
                    )
                )
            ),
        alt(conc(opt(atom(NOTCAT,2)
                    ),
                conc(atom(FIRST,9),
                    conc(atom(ROUNDOPEN,1),
                        conc(alt(atom(MUVAR,4),
                                atom(SIGMAVAR,5)
                                ),
                            conc(atom(COMMA,1),
                                conc(atom(LD,10),
                                    atom(ROUNDCLOSE,1)
                                    )
                                )
                            )
                        )
                    )
                ),
            alt(conc(opt(atom(NOTCAT,2)
                        ),
                    conc(atom(EXIST,3),
                        conc(atom(ROUNDOPEN,1),
                            conc(alt(atom(MUVAR,4),
                                    atom(SIGMAVAR,5)
                                    ),
                                conc(atom(COMMA,1),
                                    conc(atom(LD,6),
                                        atom(ROUNDCLOSE,1)
                                        )
                                    )
                                )
                            )
                        )
                    ),
                conc(opt(atom(NOTCAT,2)
                        ),
                    conc(atom(ALL,7),
                        conc(atom(ROUNDOPEN,1),
                            conc(alt(atom(MUVAR,4),
                                    atom(SIGMAVAR,5)
                                    ),
                                conc(atom(COMMA,1),
                                    conc(atom(ITEM,8),
                                        atom(ROUNDCLOSE,1)
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
{:MATCHBOOLEAN}

{rule:}
{:PARAMETERSspec}
procedure PARAMETERSspecgraph(i:INTEGER);
BEGIN
prod(i,PARAMETERSspec,
    conc(atom(PARAMETERS,1),
        conc(atom(LEFTARROW,1),
            conc(star(alt(atom(LEVEL,4),
                    conc(atom(IDENTIFIER,2),
                        conc(atom(DOTDOT,1),
                            atom(PARTYPE,3)
                            )
                        )
                    )
                    ),
                atom(RIGHTARROW,1)
                )
            )
        )
    )
END;
{:PARAMETERSspec}

{rule:}
{:ASSIGNRECORD}
function ENUMKINDgraph:mrucomDECL_psurfgraph;
BEGIN
ENUMKINDgraph:=
conc(atom(CURLYOPEN,1),
    conc(star(conc(atom(IDENTIFIER,6),
            conc(atom(DOTDOT,1),
                alt(atom(VALUENAME,3),
                    alt(atom(SETVALUENAME,7),
                        atom(VARNAME,8)
                        )
                    )
                )
            )
            ),
        atom(CURLYCLOSE,1)
        )
    )
END;
function COPYKINDgraph:mrucomDECL_psurfgraph;
BEGIN
COPYKINDgraph:=
conc(atom(COPYT,1),
    conc(atom(UNDERSCORE,1),
        conc(atom(IDENTIFIER,4),
            conc(atom(ROUNDOPEN,1),
                conc(atom(CATRECNAME,5),
                    atom(ROUNDCLOSE,1)
                    )
                )
            )
        )
    )
END;
procedure ASSIGNRECORDgraph(i:INTEGER);
BEGIN
prod(i,ASSIGNRECORD,
    conc(atom(CATRECNAME,2),
        conc(atom(DOTDOT,11),
            conc(atom(ISCAT,12),
                alt(ENUMKINDgraph,
                    alt(COPYKINDgraph,
                        alt(atom(CATRECNAME,9),
                            conc(atom(AUX,13),
                                conc(atom(UNDERSCORE,1),
                                    atom(IDENTIFIER,10)
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
{:ASSIGNRECORD}

{rule:}
{:CONDRECORD}
function ENUMCONDgraph:mrucomDECL_psurfgraph;
BEGIN
ENUMCONDgraph:=
conc(atom(CURLYOPEN,1),
    conc(star(conc(atom(IDENTIFIER,10),
            conc(alt(atom(DOTDOT,4),
                    alt(atom(NICAT,5),
                        atom(INCAT,15)
                        )
                    ),
                alt(atom(VALUENAME,3),
                    alt(atom(SETVALUENAME,11),
                        atom(VARNAME,12)
                        )
                    )
                )
            )
            ),
        atom(CURLYCLOSE,14)
        )
    )
END;
function COPYCONDgraph:mrucomDECL_psurfgraph;
BEGIN
COPYCONDgraph:=
conc(atom(COPYT,1),
    conc(atom(UNDERSCORE,1),
        conc(atom(IDENTIFIER,8),
            conc(atom(ROUNDOPEN,1),
                conc(atom(CATRECNAME,9),
                    atom(ROUNDCLOSE,1)
                    )
                )
            )
        )
    )
END;
function COPYCOND2graph:mrucomDECL_psurfgraph;
BEGIN
COPYCOND2graph:=
conc(atom(COPYT,1),
    conc(atom(UNDERSCORE,1),
        conc(atom(IDENTIFIER,8),
            conc(atom(ROUNDOPEN,1),
                conc(atom(CATRECNAME,20),
                    atom(ROUNDCLOSE,1)
                    )
                )
            )
        )
    )
END;
function EXCEPTCONDgraph:mrucomDECL_psurfgraph;
BEGIN
EXCEPTCONDgraph:=
conc(alt(COPYCOND2graph,
        alt(atom(CATRECNAME,17),
            conc(atom(AUX,1),
                conc(atom(UNDERSCORE,1),
                    atom(IDENTIFIER,16)
                    )
                )
            )
        ),
    conc(atom(EXCEPT,21),
        conc(atom(FORCAT,1),
            conc(atom(SQUAREOPEN,1),
                conc(atom(IDENTIFIER,7),
                    conc(star(conc(atom(COMMA,1),
                            atom(IDENTIFIER,7)
                            )
                            ),
                        atom(SQUARECLOSE,1)
                        )
                    )
                )
            )
        )
    )
END;
procedure CONDRECORDgraph(i:INTEGER);
BEGIN
prod(i,CONDRECORD,
    conc(atom(CATRECNAME,2),
        conc(alt(atom(ISCAT,19),
                conc(atom(LEFTARROW,18),
                    atom(RIGHTARROW,18)
                    )
                ),
            alt(ENUMCONDgraph,
                alt(EXCEPTCONDgraph,
                    alt(COPYCONDgraph,
                        alt(atom(CATRECNAME,6),
                            conc(atom(AUX,1),
                                conc(atom(UNDERSCORE,1),
                                    atom(IDENTIFIER,13)
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
{:CONDRECORD}

{rule:}
{:SUBRULES}
procedure SUBRULESgraph(i:INTEGER);
BEGIN
prod(i,SUBRULES,
    conc(atom(LEFTARROW,1),
        conc(star(conc(atom(SUBRULE,8),
                conc(atom(LEFTSUBMODELS,2),
                    conc(atom(RIGHTSUBMODELS,3),
                        conc(opt(atom(MATCHCONDS,4)
                                ),
                            alt(atom(SUBRULES,5),
                                conc(opt(atom(COMCAPAIRS,6)
                                        ),
                                    opt(atom(DECOMCAPAIRS,7)
                                        )
                                    )
                                )
                            )
                        )
                    )
                )
                ),
            atom(RIGHTARROW,1)
            )
        )
    )
END;
{:SUBRULES}

{rule:}
{:SUBFILTERS}
procedure SUBFILTERSgraph(i:INTEGER);
BEGIN
prod(i,SUBFILTERS,
    conc(atom(LEFTARROW,1),
        conc(star(conc(atom(SUBRULE,8),
                conc(atom(RIGHTSUBMODELS,2),
                    conc(opt(atom(MATCHCONDS,3)
                            ),
                        alt(atom(SUBFILTERS,4),
                            conc(opt(alt(atom(COMP,6),
                                    atom(DECOMP,7)
                                    )
                                    ),
                                atom(CAPAIRS,5)
                                )
                            )
                        )
                    )
                )
                ),
            atom(RIGHTARROW,1)
            )
        )
    )
END;
{:SUBFILTERS}

{rule:}
{:LEFTSUBMODELS}
procedure LEFTSUBMODELSgraph(i:INTEGER);
BEGIN
prod(i,LEFTSUBMODELS,
    conc(atom(LEFTARROW,1),
        conc(star(alt(atom(LABELEDTD,2),
                atom(LABELEDLD,3)
                )
                ),
            atom(RIGHTARROW,1)
            )
        )
    )
END;
{:LEFTSUBMODELS}

{rule:}
{:RIGHTSUBMODELS}
procedure RIGHTSUBMODELSgraph(i:INTEGER);
BEGIN
prod(i,RIGHTSUBMODELS,
    conc(atom(LEFTARROW,1),
        conc(star(alt(atom(LABELEDDTREE,4),
                alt(atom(LABELEDTD,2),
                    atom(LABELEDLD,3)
                    )
                )
                ),
            atom(RIGHTARROW,1)
            )
        )
    )
END;
{:RIGHTSUBMODELS}

{rule:}
{:COMCAPAIRS}
procedure COMCAPAIRSgraph(i:INTEGER);
BEGIN
prod(i,COMCAPAIRS,
    conc(atom(COMP,1),
        atom(CAPAIRS,2)
        )
    )
END;
{:COMCAPAIRS}

{rule:}
{:DECOMCAPAIRS}
procedure DECOMCAPAIRSgraph(i:INTEGER);
BEGIN
prod(i,DECOMCAPAIRS,
    conc(atom(DECOMP,1),
        atom(CAPAIRS,2)
        )
    )
END;
{:DECOMCAPAIRS}

{rule:}
{:CAPAIRS}
procedure CAPAIRSgraph(i:INTEGER);
BEGIN
prod(i,CAPAIRS,
    conc(atom(LEFTARROW,1),
        conc(star(conc(atom(CONDITION,2),
                conc(opt(atom(bareCAPAIRS,3)
                        ),
                    atom(ACTION,4)
                    )
                )
                ),
            atom(RIGHTARROW,1)
            )
        )
    )
END;
{:CAPAIRS}

{rule:}
{:bareCAPAIRS}
procedure bareCAPAIRSgraph(i:INTEGER);
BEGIN
prod(i,bareCAPAIRS,
    star(conc(atom(CONDITION,2),
        conc(opt(atom(bareCAPAIRS,3)
                ),
            atom(ACTION,4)
            )
        )
        )
    )
END;
{:bareCAPAIRS}

{rule:}
{:CONDITION}
procedure CONDITIONgraph(i:INTEGER);
BEGIN
prod(i,CONDITION,
    conc(atom(CLABEL,2),
        conc(atom(DOTDOT,1),
            atom(ANDCOND,3)
            )
        )
    )
END;
{:CONDITION}

{rule:}
{:ACTION}
procedure ACTIONgraph(i:INTEGER);
BEGIN
prod(i,ACTION,
    conc(atom(ALABEL,2),
        conc(atom(DOTDOT,1),
            conc(opt(atom(BONUSspec,5)
                    ),
                alt(atom(STATEMENTS,3),
                    atom(APESTAART,4)
                    )
                )
            )
        )
    )
END;
{:ACTION}

{rule:}
{:STATEMENTS}
procedure STATEMENTSgraph(i:INTEGER);
BEGIN
prod(i,STATEMENTS,
    conc(alt(atom(PASCALSTATEMENT,2),
            atom(ASSIGNRECORD,3)
            ),
        conc(star(conc(atom(SEMICOLON,1),
                alt(atom(PASCALSTATEMENT,2),
                    atom(ASSIGNRECORD,3)
                    )
                )
                ),
            opt(atom(SEMICOLON,1)
                )
            )
        )
    )
END;
{:STATEMENTS}

{rule:}
{:KEYNAME}
procedure KEYNAMEgraph(i:INTEGER);
BEGIN
prod(i,KEYNAME,
    alt(conc(alt(atom(AUX,1),
                atom(KEYtje,6)
                ),
            conc(atom(UNDERSCORE,1),
                conc(opt(atom(QUOTEtje,7)
                        ),
                    conc(atom(IDENTIFIER,2),
                        conc(star(conc(atom(UNDERSCORE,1),
                                atom(IDENTIFIER,2)
                                )
                                ),
                            opt(atom(QUOTEtje,8)
                                )
                            )
                        )
                    )
                )
            ),
        alt(conc(atom(IDENTIFIER,3),
                conc(atom(DOT,1),
                    atom(IDENTIFIER,4)
                    )
                ),
            alt(atom(KEY1,5),
                alt(atom(KEY2,5),
                    alt(atom(KEY3,5),
                        alt(atom(KEY4,5),
                            alt(atom(KEY5,5),
                                alt(atom(KEY6,5),
                                    alt(atom(KEY7,5),
                                        alt(atom(KEY8,5),
                                            alt(atom(KEY9,5),
                                                atom(KEY10,5)
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
{:KEYNAME}

{rule:}
{:TREEVAR}
procedure TREEVARgraph(i:INTEGER);
BEGIN
prod(i,TREEVAR,
    alt(atom(IDENTIFIER,1),
        conc(atom(DOT,2),
            atom(DOT,2)
            )
        )
    )
END;
{:TREEVAR}

{rule:}
{:MUVAR}
procedure MUVARgraph(i:INTEGER);
BEGIN
prod(i,MUVAR,
    atom(IDENTIFIER,1)
    )
END;
{:MUVAR}

{rule:}
{:SIGMAVAR}
procedure SIGMAVARgraph(i:INTEGER);
BEGIN
prod(i,SIGMAVAR,
    atom(IDENTIFIER,1)
    )
END;
{:SIGMAVAR}

{rule:}
{:NODEVAR}
procedure NODEVARgraph(i:INTEGER);
BEGIN
prod(i,NODEVAR,
    atom(IDENTIFIER,1)
    )
END;
{:NODEVAR}

{rule:}
{:RELVAR}
procedure RELVARgraph(i:INTEGER);
BEGIN
prod(i,RELVAR,
    alt(atom(IDENTIFIER,1),
        conc(atom(DOT,2),
            atom(DOT,2)
            )
        )
    )
END;
{:RELVAR}

{rule:}
{:CLABEL}
procedure CLABELgraph(i:INTEGER);
BEGIN
prod(i,CLABEL,
    atom(IDENTIFIER,1)
    )
END;
{:CLABEL}

{rule:}
{:ALABEL}
procedure ALABELgraph(i:INTEGER);
BEGIN
prod(i,ALABEL,
    atom(IDENTIFIER,1)
    )
END;
{:ALABEL}

{rule:}
{:ILABELtje}
procedure ILABELtjegraph(i:INTEGER);
BEGIN
prod(i,ILABELtje,
    atom(IDENTIFIER,1)
    )
END;
{:ILABELtje}

{rule:}
{:MLABELtje}
procedure MLABELtjegraph(i:INTEGER);
BEGIN
prod(i,MLABELtje,
    atom(IDENTIFIER,1)
    )
END;
{:MLABELtje}

{rule:}
{:RLABELtje}
procedure RLABELtjegraph(i:INTEGER);
BEGIN
prod(i,RLABELtje,
    atom(IDENTIFIER,1)
    )
END;
{:RLABELtje}

{rule:}
{:LLABELtje}
procedure LLABELtjegraph(i:INTEGER);
BEGIN
prod(i,LLABELtje,
    atom(IDENTIFIER,1)
    )
END;
{:LLABELtje}

{rule:}
{:LABELtje}
procedure LABELtjegraph(i:INTEGER);
BEGIN
prod(i,LABELtje,
    alt(atom(MLABELtje,1),
        alt(atom(ILABELtje,2),
            alt(atom(RLABELtje,3),
                alt(atom(LLABELtje,4),
                    alt(atom(TREEVAR,5),
                        alt(atom(MUVAR,6),
                            atom(SIGMAVAR,7)
                            )
                        )
                    )
                )
            )
        )
    )
END;
{:LABELtje}

{rule:}
{:CATNAME}
procedure CATNAMEgraph(i:INTEGER);
BEGIN
prod(i,CATNAME,
    atom(IDENTIFIER,1)
    )
END;
{:CATNAME}

{rule:}
{:CATRECNAME}
procedure CATRECNAMEgraph(i:INTEGER);
BEGIN
prod(i,CATRECNAME,
    conc(atom(IDENTIFIER,1),
        opt(atom(QUOTEtje,2)
            )
        )
    )
END;
{:CATRECNAME}

{rule:}
{:RELNAME}
procedure RELNAMEgraph(i:INTEGER);
BEGIN
prod(i,RELNAME,
    atom(IDENTIFIER,1)
    )
END;
{:RELNAME}

{rule:}
{:PARNAME}
procedure PARNAMEgraph(i:INTEGER);
BEGIN
prod(i,PARNAME,
    atom(IDENTIFIER,1)
    )
END;
{:PARNAME}

{rule:}
{:PARTYPE}
procedure PARTYPEgraph(i:INTEGER);
BEGIN
prod(i,PARTYPE,
    atom(IDENTIFIER,1)
    )
END;
{:PARTYPE}

{rule:}
{:PASCALSTATEMENT}
function IDLEXgraph:mrucomDECL_psurfgraph;
BEGIN
IDLEXgraph:=
alt(conc(atom(KEYNAME,32),
        conc(atom(DOTDOT,11),
            conc(atom(ISCAT,11),
                conc(atom(DECOMPGETIDDICT,11),
                    conc(atom(ROUNDOPEN,11),
                        conc(atom(LEFTARROW,11),
                            conc(atom(KEYNAME,25),
                                conc(star(conc(atom(COMMA,11),
                                        atom(KEYNAME,25)
                                        )
                                        ),
                                    conc(atom(RIGHTARROW,28),
                                        conc(atom(COMMA,19),
                                            conc(atom(IDENTIFIER,26),
                                                atom(ROUNDCLOSE,30)
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
        ),
    conc(atom(LEFTARROW,11),
        conc(atom(KEYNAME,27),
            conc(star(conc(atom(COMMA,11),
                    atom(KEYNAME,27)
                    )
                    ),
                conc(atom(RIGHTARROW,29),
                    conc(atom(DOTDOT,1),
                        conc(atom(ISCAT,10),
                            conc(atom(COMPGETIDDICT,23),
                                conc(atom(ROUNDOPEN,18),
                                    conc(atom(KEYNAME,22),
                                        conc(atom(COMMA,19),
                                            conc(atom(IDENTIFIER,26),
                                                atom(ROUNDCLOSE,31)
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
function SEMILEXgraph:mrucomDECL_psurfgraph;
BEGIN
SEMILEXgraph:=
conc(atom(KEYNAME,22),
    conc(atom(DOTDOT,1),
        conc(atom(ISCAT,10),
            conc(alt(atom(COMPGETSIDDICT,23),
                    atom(DECOMPGETSIDDICT,23)
                    ),
                conc(atom(ROUNDOPEN,18),
                    conc(atom(KEYNAME,22),
                        conc(atom(COMMA,19),
                            conc(atom(KEYNAME,22),
                                conc(atom(COMMA,19),
                                    conc(atom(IDENTIFIER,13),
                                        atom(ROUNDCLOSE,15)
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
function QUOTEASSIGNgraph:mrucomDECL_psurfgraph;
BEGIN
QUOTEASSIGNgraph:=
conc(atom(QUOTE,11),
    conc(atom(UNDERSCORE,11),
        conc(atom(IDENTIFIER,12),
            opt(conc(atom(ROUNDOPEN,18),
                conc(alt(atom(IDENTIFIER,13),
                        alt(conc(alt(atom(AUX,20),
                                    atom(KEYtje,24)
                                    ),
                                conc(atom(UNDERSCORE,11),
                                    atom(IDENTIFIER,13)
                                    )
                                ),
                            alt(conc(atom(IDENTIFIER,13),
                                    conc(atom(DOT,14),
                                        atom(IDENTIFIER,13)
                                        )
                                    ),
                                conc(atom(SQUAREOPEN,16),
                                    conc(opt(conc(atom(IDENTIFIER,13),
                                            star(conc(atom(COMMA,19),
                                                atom(IDENTIFIER,13)
                                                )
                                                )
                                            )
                                            ),
                                        atom(SQUARECLOSE,17)
                                        )
                                    )
                                )
                            )
                        ),
                    conc(star(conc(atom(COMMA,19),
                            alt(atom(IDENTIFIER,13),
                                alt(conc(alt(atom(AUX,20),
                                            atom(KEYtje,24)
                                            ),
                                        conc(atom(UNDERSCORE,11),
                                            atom(IDENTIFIER,13)
                                            )
                                        ),
                                    alt(conc(atom(IDENTIFIER,13),
                                            conc(atom(DOT,14),
                                                atom(IDENTIFIER,13)
                                                )
                                            ),
                                        conc(atom(SQUAREOPEN,16),
                                            conc(opt(conc(atom(IDENTIFIER,13),
                                                    star(conc(atom(COMMA,19),
                                                        atom(IDENTIFIER,13)
                                                        )
                                                        )
                                                    )
                                                    ),
                                                atom(SQUARECLOSE,17)
                                                )
                                            )
                                        )
                                    )
                                )
                            )
                            ),
                        atom(ROUNDCLOSE,15)
                        )
                    )
                )
                )
            )
        )
    )
END;
procedure PASCALSTATEMENTgraph(i:INTEGER);
BEGIN
prod(i,PASCALSTATEMENT,
    alt(conc(atom(VARNAME,2),
            conc(atom(DOTDOT,1),
                conc(atom(ISCAT,10),
                    conc(opt(atom(ROUNDOPEN,18)
                            ),
                        conc(alt(atom(VALUENAME,3),
                                alt(atom(SETVALUENAME,4),
                                    atom(VARNAME,5)
                                    )
                                ),
                            star(conc(alt(atom(STARCAT,6),
                                    alt(atom(PLUSCAT,9),
                                        atom(MINCAT,21)
                                        )
                                    ),
                                conc(opt(atom(ROUNDOPEN,18)
                                        ),
                                    conc(alt(atom(SETVALUENAME,7),
                                            atom(VARNAME,8)
                                            ),
                                        opt(atom(ROUNDCLOSE,15)
                                            )
                                        )
                                    )
                                )
                                )
                            )
                        )
                    )
                )
            ),
        alt(QUOTEASSIGNgraph,
            alt(SEMILEXgraph,
                IDLEXgraph
                )
            )
        )
    )
END;
{:PASCALSTATEMENT}

{rule:}
{:PASCALEXPR}
function EQUALSgraph:mrucomDECL_psurfgraph;
BEGIN
EQUALSgraph:=
conc(alt(atom(VARNAME,2),
        alt(atom(VALUENAME,3),
            atom(SETVALUENAME,6)
            )
        ),
    conc(alt(atom(ISCAT,20),
            conc(atom(LEFTARROW,21),
                atom(RIGHTARROW,13)
                )
            ),
        conc(opt(atom(ROUNDOPEN,38)
                ),
            conc(alt(atom(VARNAME,4),
                    alt(atom(VALUENAME,5),
                        atom(SETVALUENAME,7)
                        )
                    ),
                star(conc(alt(atom(STARCAT,24),
                        alt(atom(PLUSCAT,27),
                            atom(MINCAT,37)
                            )
                        ),
                    conc(opt(atom(ROUNDOPEN,38)
                            ),
                        conc(alt(atom(SETVALUENAME,25),
                                atom(VARNAME,26)
                                ),
                            opt(atom(ROUNDCLOSE,39)
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
function OTHEREQUALSgraph:mrucomDECL_psurfgraph;
BEGIN
OTHEREQUALSgraph:=
conc(opt(atom(ROUNDOPEN,38)
        ),
    conc(alt(atom(SETVALUENAME,8),
            atom(VARNAME,9)
            ),
        conc(alt(atom(STARCAT,36),
                alt(atom(PLUSCAT,28),
                    atom(MINCAT,37)
                    )
                ),
            conc(opt(atom(ROUNDOPEN,38)
                    ),
                conc(alt(atom(SETVALUENAME,10),
                        atom(VARNAME,11)
                        ),
                    conc(opt(atom(ROUNDCLOSE,39)
                            ),
                        conc(star(conc(alt(atom(STARCAT,36),
                                    alt(atom(PLUSCAT,28),
                                        atom(MINCAT,37)
                                        )
                                    ),
                                conc(opt(atom(ROUNDOPEN,38)
                                        ),
                                    conc(alt(atom(SETVALUENAME,10),
                                            atom(VARNAME,11)
                                            ),
                                        opt(atom(ROUNDCLOSE,39)
                                            )
                                        )
                                    )
                                )
                                ),
                            conc(alt(atom(ISCAT,12),
                                    conc(atom(LEFTARROW,32),
                                        atom(RIGHTARROW,34)
                                        )
                                    ),
                                alt(atom(SETVALUENAME,14),
                                    alt(atom(VALUENAME,3),
                                        atom(VARNAME,15)
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
function SETBOOLEANgraph:mrucomDECL_psurfgraph;
BEGIN
SETBOOLEANgraph:=
conc(opt(atom(NOTCAT,22)
        ),
    conc(opt(atom(ROUNDOPEN,23)
            ),
        conc(alt(atom(SETVALUENAME,29),
                alt(atom(VALUENAME,16),
                    atom(VARNAME,17)
                    )
                ),
            conc(alt(atom(INCAT,1),
                    alt(conc(atom(LEFTARROW,33),
                            atom(ISCAT,31)
                            ),
                        conc(atom(RIGHTARROW,35),
                            atom(ISCAT,31)
                            )
                        )
                    ),
                conc(opt(atom(ROUNDOPEN,38)
                        ),
                    conc(alt(atom(SETVALUENAME,18),
                            atom(VARNAME,19)
                            ),
                        conc(star(conc(alt(atom(STARCAT,24),
                                    alt(atom(PLUSCAT,27),
                                        atom(MINCAT,37)
                                        )
                                    ),
                                conc(opt(atom(ROUNDOPEN,38)
                                        ),
                                    conc(alt(atom(SETVALUENAME,25),
                                            atom(VARNAME,26)
                                            ),
                                        opt(atom(ROUNDCLOSE,39)
                                            )
                                        )
                                    )
                                )
                                ),
                            opt(atom(ROUNDCLOSE,30)
                                )
                            )
                        )
                    )
                )
            )
        )
    )
END;
procedure PASCALEXPRgraph(i:INTEGER);
BEGIN
prod(i,PASCALEXPR,
    alt(EQUALSgraph,
        alt(OTHEREQUALSgraph,
            SETBOOLEANgraph
            )
        )
    )
END;
{:PASCALEXPR}

{rule:}
{:VARNAME}
procedure VARNAMEgraph(i:INTEGER);
BEGIN
prod(i,VARNAME,
    alt(atom(PARNAME,2),
        alt(conc(atom(CATRECNAME,3),
                conc(atom(DOT,1),
                    atom(IDENTIFIER,4)
                    )
                ),
            alt(conc(alt(atom(TREEVAR,5),
                        atom(NODEVAR,6)
                        ),
                    conc(atom(DOT,1),
                        atom(CATCAT,7)
                        )
                    ),
                alt(atom(RELVAR,8),
                    alt(conc(alt(atom(TREEVAR,9),
                                atom(NODEVAR,10)
                                ),
                            conc(atom(DOT,1),
                                conc(atom(REC,1),
                                    conc(atom(DOT,1),
                                        atom(IDENTIFIER,11)
                                        )
                                    )
                                )
                            ),
                        alt(atom(KEY1,12),
                            alt(atom(KEY2,12),
                                alt(atom(KEY3,12),
                                    alt(atom(KEY4,12),
                                        alt(atom(KEY5,12),
                                            alt(atom(KEY6,12),
                                                alt(atom(KEY7,12),
                                                    alt(atom(KEY8,12),
                                                        alt(atom(KEY9,12),
                                                            atom(KEY10,12)
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
{:VARNAME}

{rule:}
{:SETVALUENAME}
procedure SETVALUENAMEgraph(i:INTEGER);
BEGIN
prod(i,SETVALUENAME,
    alt(conc(atom(SQUAREOPEN,1),
            conc(opt(conc(alt(atom(VALUENAME,2),
                        atom(VARNAME,4)
                        ),
                    star(conc(atom(COMMA,5),
                        alt(atom(VALUENAME,2),
                            atom(VARNAME,4)
                            )
                        )
                        )
                    )
                    ),
                atom(SQUARECLOSE,6)
                )
            ),
        alt(conc(atom(AUX,7),
                conc(atom(UNDERSCORE,8),
                    atom(IDENTIFIER,3)
                    )
                ),
            conc(atom(KEYtje,9),
                conc(atom(UNDERSCORE,8),
                    conc(opt(atom(QUOTEtje,10)
                            ),
                        conc(atom(IDENTIFIER,3),
                            conc(star(conc(atom(UNDERSCORE,12),
                                    atom(IDENTIFIER,3)
                                    )
                                    ),
                                opt(atom(QUOTEtje,11)
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
{:SETVALUENAME}

{rule:}
{:VALUENAME}
procedure VALUENAMEgraph(i:INTEGER);
BEGIN
prod(i,VALUENAME,
    alt(atom(IDENTIFIER,1),
        alt(conc(atom(IDENTIFIER,1),
                conc(atom(UNDERSCORE,2),
                    atom(IDENTIFIER,3)
                    )
                ),
            atom(LEVEL,4)
            )
        )
    )
END;
{:VALUENAME}

{rule:}
{:TRUECAT}
procedure TRUECATgraph(i:INTEGER);
BEGIN
prod(i,TRUECAT,
    atom(IDENTIFIER,1)
    )
END;
{:TRUECAT}

{rule:}
{:CATCAT}
procedure CATCATgraph(i:INTEGER);
BEGIN
prod(i,CATCAT,
    atom(IDENTIFIER,1)
    )
END;
{:CATCAT}

{rule:}
{:BONUSspec}
procedure BONUSspecgraph(i:INTEGER);
BEGIN
prod(i,BONUSspec,
    conc(alt(atom(SBONUS,1),
            atom(WBONUS,2)
            ),
        conc(alt(atom(MINCAT,3),
                atom(PLUSCAT,4)
                ),
            conc(atom(NUMBER,5),
                opt(atom(SEMICOLON,6)
                    )
                )
            )
        )
    )
END;
{:BONUSspec}

{rule:}
{:DTREE}
function VALUEgraph:mrucomDECL_psurfgraph;
BEGIN
VALUEgraph:=
alt(atom(IDENTIFIER,6),
    alt(atom(X1,7),
        alt(atom(X2,7),
            alt(atom(X3,7),
                alt(atom(X4,7),
                    atom(X5,7)
                    )
                )
            )
        )
    )
END;
function PARAMETERSgraph:mrucomDECL_psurfgraph;
BEGIN
PARAMETERSgraph:=
conc(atom(CURLYOPEN,13),
    conc(opt(atom(VPID,17)
            ),
        conc(star(conc(alt(atom(IDENTIFIER,5),
                    alt(atom(LEVEL,10),
                        atom(SUBST,14)
                        )
                    ),
                conc(atom(DOTDOT,1),
                    VALUEgraph
                    )
                )
                ),
            atom(CURLYCLOSE,1)
            )
        )
    )
END;
function RULEgraph:mrucomDECL_psurfgraph;
BEGIN
RULEgraph:=
conc(atom(IDENTIFIER,12),
    opt(PARAMETERSgraph
        )
    )
END;
function RULECLASSgraph:mrucomDECL_psurfgraph;
BEGIN
RULECLASSgraph:=
conc(atom(ROUNDOPEN,1),
    conc(star(RULEgraph
            ),
        atom(ROUNDCLOSE,1)
        )
    )
END;
procedure DTREEgraph(i:INTEGER);
BEGIN
prod(i,DTREE,
    alt(alt(conc(atom(IDENTIFIER,2),
                conc(atom(SLASH,1),
                    conc(alt(RULEgraph,
                            RULECLASSgraph
                            ),
                        conc(atom(SQUAREOPEN,15),
                            conc(atom(DTREE,4),
                                conc(star(conc(atom(COMMA,1),
                                        atom(DTREE,4)
                                        )
                                        ),
                                    atom(SQUARECLOSE,1)
                                    )
                                )
                            )
                        )
                    )
                ),
            conc(atom(BLEX,1),
                conc(atom(SLASH,1),
                    alt(conc(atom(IDENTIFIER,16),
                            conc(atom(ROUNDOPEN,1),
                                conc(atom(KEYNAME,8),
                                    atom(ROUNDCLOSE,1)
                                    )
                                )
                            ),
                        alt(atom(LABELEDTD,9),
                            atom(BARETD,11)
                            )
                        )
                    )
                )
            ),
        alt(atom(X1,3),
            alt(atom(X2,3),
                alt(atom(X3,3),
                    alt(atom(X4,3),
                        atom(X5,3)
                        )
                    )
                )
            )
        )
    )
END;
{:DTREE}

{rule:}
{:LABELEDDTREE}
procedure LABELEDDTREEgraph(i:INTEGER);
BEGIN
prod(i,LABELEDDTREE,
    conc(opt(conc(atom(LABELtje,3),
            atom(DOTDOT,1)
            )
            ),
        atom(DTREE,2)
        )
    )
END;
{:LABELEDDTREE}
 procedure mrucomGRAPHDEF_SFG(i:INTEGER);
BEGIN
CASE i OF
  1:UTTgraph(  1);
  2:SUBGRAMMARSPECgraph(  2);
  3:GRAPHgraph(  3);
  4:CONCGRAPHgraph(  4);
  5:ELEMENTARYGRAPHgraph(  5);
  6:NUMBERgraph(  6);
  7:RULESPECgraph(  7);
  8:FILTERSPECgraph(  8);
  9:LEFTMODELSgraph(  9);
 10:RIGHTMODELgraph( 10);
 11:LABELEDTDgraph( 11);
 12:BARETDgraph( 12);
 13:LABELEDNDgraph( 13);
 14:LABELEDLDgraph( 14);
 15:BARENDgraph( 15);
 16:BARELDgraph( 16);
 17:ITEMgraph( 17);
 18:LABELEDITEMgraph( 18);
 19:BAREITEMgraph( 19);
 20:LDgraph( 20);
 21:RTDgraph( 21);
 22:RELDgraph( 22);
 23:MATCHCONDSgraph( 23);
 24:ANDCONDgraph( 24);
 25:ORCONDgraph( 25);
 26:ELEMENTARYCONDgraph( 26);
 27:BOOLEANEXPRgraph( 27);
 28:MATCHBOOLEANgraph( 28);
 29:PARAMETERSspecgraph( 29);
 30:ASSIGNRECORDgraph( 30);
 31:CONDRECORDgraph( 31);
 32:SUBRULESgraph( 32);
 33:SUBFILTERSgraph( 33);
 34:LEFTSUBMODELSgraph( 34);
 35:RIGHTSUBMODELSgraph( 35);
 36:COMCAPAIRSgraph( 36);
 37:DECOMCAPAIRSgraph( 37);
 38:CAPAIRSgraph( 38);
 39:bareCAPAIRSgraph( 39);
 40:CONDITIONgraph( 40);
 41:ACTIONgraph( 41);
 42:STATEMENTSgraph( 42);
 43:KEYNAMEgraph( 43);
 44:TREEVARgraph( 44);
 45:MUVARgraph( 45);
 46:SIGMAVARgraph( 46);
 47:NODEVARgraph( 47);
 48:RELVARgraph( 48);
 49:CLABELgraph( 49);
 50:ALABELgraph( 50);
 51:ILABELtjegraph( 51);
 52:MLABELtjegraph( 52);
 53:RLABELtjegraph( 53);
 54:LLABELtjegraph( 54);
 55:LABELtjegraph( 55);
 56:CATNAMEgraph( 56);
 57:CATRECNAMEgraph( 57);
 58:RELNAMEgraph( 58);
 59:PARNAMEgraph( 59);
 60:PARTYPEgraph( 60);
 61:PASCALSTATEMENTgraph( 61);
 62:PASCALEXPRgraph( 62);
 63:VARNAMEgraph( 63);
 64:SETVALUENAMEgraph( 64);
 65:VALUENAMEgraph( 65);
 66:TRUECATgraph( 66);
 67:CATCATgraph( 67);
 68:BONUSspecgraph( 68);
 69:DTREEgraph( 69);
 70:LABELEDDTREEgraph( 70);
END
END;
 FUNCTION mrucomGRAPHDEF_topcat(i:integer):mrucomLANGSPEC_Category;
BEGIN
CASE i OF
  1: mrucomGRAPHDEF_topcat:= UTT;
  2: mrucomGRAPHDEF_topcat:= SUBGRAMMARSPEC;
  3: mrucomGRAPHDEF_topcat:= GRAPH;
  4: mrucomGRAPHDEF_topcat:= CONCGRAPH;
  5: mrucomGRAPHDEF_topcat:= ELEMENTARYGRAPH;
  6: mrucomGRAPHDEF_topcat:= NUMBER;
  7: mrucomGRAPHDEF_topcat:= RULESPEC;
  8: mrucomGRAPHDEF_topcat:= FILTERSPEC;
  9: mrucomGRAPHDEF_topcat:= LEFTMODELS;
 10: mrucomGRAPHDEF_topcat:= RIGHTMODEL;
 11: mrucomGRAPHDEF_topcat:= LABELEDTD;
 12: mrucomGRAPHDEF_topcat:= BARETD;
 13: mrucomGRAPHDEF_topcat:= LABELEDND;
 14: mrucomGRAPHDEF_topcat:= LABELEDLD;
 15: mrucomGRAPHDEF_topcat:= BAREND;
 16: mrucomGRAPHDEF_topcat:= BARELD;
 17: mrucomGRAPHDEF_topcat:= ITEM;
 18: mrucomGRAPHDEF_topcat:= LABELEDITEM;
 19: mrucomGRAPHDEF_topcat:= BAREITEM;
 20: mrucomGRAPHDEF_topcat:= LD;
 21: mrucomGRAPHDEF_topcat:= RTD;
 22: mrucomGRAPHDEF_topcat:= RELD;
 23: mrucomGRAPHDEF_topcat:= MATCHCONDS;
 24: mrucomGRAPHDEF_topcat:= ANDCOND;
 25: mrucomGRAPHDEF_topcat:= ORCOND;
 26: mrucomGRAPHDEF_topcat:= ELEMENTARYCOND;
 27: mrucomGRAPHDEF_topcat:= BOOLEANEXPR;
 28: mrucomGRAPHDEF_topcat:= MATCHBOOLEAN;
 29: mrucomGRAPHDEF_topcat:= PARAMETERSspec;
 30: mrucomGRAPHDEF_topcat:= ASSIGNRECORD;
 31: mrucomGRAPHDEF_topcat:= CONDRECORD;
 32: mrucomGRAPHDEF_topcat:= SUBRULES;
 33: mrucomGRAPHDEF_topcat:= SUBFILTERS;
 34: mrucomGRAPHDEF_topcat:= LEFTSUBMODELS;
 35: mrucomGRAPHDEF_topcat:= RIGHTSUBMODELS;
 36: mrucomGRAPHDEF_topcat:= COMCAPAIRS;
 37: mrucomGRAPHDEF_topcat:= DECOMCAPAIRS;
 38: mrucomGRAPHDEF_topcat:= CAPAIRS;
 39: mrucomGRAPHDEF_topcat:= bareCAPAIRS;
 40: mrucomGRAPHDEF_topcat:= CONDITION;
 41: mrucomGRAPHDEF_topcat:= ACTION;
 42: mrucomGRAPHDEF_topcat:= STATEMENTS;
 43: mrucomGRAPHDEF_topcat:= KEYNAME;
 44: mrucomGRAPHDEF_topcat:= TREEVAR;
 45: mrucomGRAPHDEF_topcat:= MUVAR;
 46: mrucomGRAPHDEF_topcat:= SIGMAVAR;
 47: mrucomGRAPHDEF_topcat:= NODEVAR;
 48: mrucomGRAPHDEF_topcat:= RELVAR;
 49: mrucomGRAPHDEF_topcat:= CLABEL;
 50: mrucomGRAPHDEF_topcat:= ALABEL;
 51: mrucomGRAPHDEF_topcat:= ILABELtje;
 52: mrucomGRAPHDEF_topcat:= MLABELtje;
 53: mrucomGRAPHDEF_topcat:= RLABELtje;
 54: mrucomGRAPHDEF_topcat:= LLABELtje;
 55: mrucomGRAPHDEF_topcat:= LABELtje;
 56: mrucomGRAPHDEF_topcat:= CATNAME;
 57: mrucomGRAPHDEF_topcat:= CATRECNAME;
 58: mrucomGRAPHDEF_topcat:= RELNAME;
 59: mrucomGRAPHDEF_topcat:= PARNAME;
 60: mrucomGRAPHDEF_topcat:= PARTYPE;
 61: mrucomGRAPHDEF_topcat:= PASCALSTATEMENT;
 62: mrucomGRAPHDEF_topcat:= PASCALEXPR;
 63: mrucomGRAPHDEF_topcat:= VARNAME;
 64: mrucomGRAPHDEF_topcat:= SETVALUENAME;
 65: mrucomGRAPHDEF_topcat:= VALUENAME;
 66: mrucomGRAPHDEF_topcat:= TRUECAT;
 67: mrucomGRAPHDEF_topcat:= CATCAT;
 68: mrucomGRAPHDEF_topcat:= BONUSspec;
 69: mrucomGRAPHDEF_topcat:= DTREE;
 70: mrucomGRAPHDEF_topcat:= LABELEDDTREE;
END
END;
