EXPORT(tracomgraphdef);
pragma C_include('tracomgraphdef.pf');
pragma C_include('tracomgraph.pf');
pragma C_include('tracomlangspec.pf');
pragma C_include('tracomdecl.pf');
PROGRAM tracomGRAPHDEF;
WITH tracomgraph,
tracomdecl,
tracomlangspec;

{rule:}
{:UTT}
procedure UTTgraph(i:INTEGER);
BEGIN
prod(i,UTT,
    conc(atom(LANGVERSION,1),
        conc(opt(atom(PARAMETERSTRANS,2)
                ),
            atom(RULESTRANS,3)
            )
        )
    )
END;
{:UTT}

{rule:}
{:PARAMETERSTRANS}
procedure PARAMETERSTRANSgraph(i:INTEGER);
BEGIN
prod(i,PARAMETERSTRANS,
    conc(atom(PARAMETER,1),
        conc(atom(TRANSLATION,1),
            conc(atom(LEFTARROW,1),
                conc(star(atom(PARAMETERTRANS,2)
                        ),
                    atom(RIGHTARROW,1)
                    )
                )
            )
        )
    )
END;
{:PARAMETERSTRANS}

{rule:}
{:PARAMETERTRANS}
procedure PARAMETERTRANSgraph(i:INTEGER);
BEGIN
prod(i,PARAMETERTRANS,
    conc(atom(PARAMNAME,2),
        conc(atom(COLON,1),
            conc(atom(TYPENAME,7),
                conc(atom(LEFTARROW,4),
                    conc(atom(DASH,1),
                        conc(atom(RIGHTARROW,5),
                            conc(atom(PARAMNAME,3),
                                conc(atom(COLON,1),
                                    conc(atom(TYPENAME,8),
                                        conc(atom(EQUIVALENT,1),
                                            conc(atom(ROUNDOPEN,1),
                                                conc(atom(ELEMENTTRANS,6),
                                                    conc(star(conc(atom(COMMA,1),
                                                            atom(ELEMENTTRANS,6)
                                                            )
                                                            ),
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
                )
            )
        )
    )
END;
{:PARAMETERTRANS}

{rule:}
{:ELEMENTTRANS}
procedure ELEMENTTRANSgraph(i:INTEGER);
BEGIN
prod(i,ELEMENTTRANS,
    conc(alt(atom(VALUENAME,2),
            atom(SETVALUENAME,6)
            ),
        conc(star(conc(atom(BAR,8),
                alt(atom(VALUENAME,2),
                    atom(SETVALUENAME,6)
                    )
                )
                ),
            conc(opt(atom(LEFTARROW,4)
                    ),
                conc(atom(DASH,1),
                    conc(opt(atom(RIGHTARROW,5)
                            ),
                        conc(alt(atom(VALUENAME,3),
                                atom(SETVALUENAME,7)
                                ),
                            star(conc(atom(BAR,9),
                                alt(atom(VALUENAME,3),
                                    atom(SETVALUENAME,7)
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
{:ELEMENTTRANS}

{rule:}
{:LANGVERSION}
procedure LANGVERSIONgraph(i:INTEGER);
BEGIN
prod(i,LANGVERSION,
    conc(atom(LANGUAGE,2),
        conc(atom(COLON,2),
            atom(IDENTIFIER,1)
            )
        )
    )
END;
{:LANGVERSION}

{rule:}
{:RULESTRANS}
procedure RULESTRANSgraph(i:INTEGER);
BEGIN
prod(i,RULESTRANS,
    conc(atom(RULE,1),
        conc(atom(TRANSLATION,1),
            conc(atom(LEFTARROW,1),
                conc(star(atom(RULETRANS,2)
                        ),
                    atom(RIGHTARROW,1)
                    )
                )
            )
        )
    )
END;
{:RULESTRANS}

{rule:}
{:RULETRANS}
procedure RULETRANSgraph(i:INTEGER);
BEGIN
prod(i,RULETRANS,
    conc(atom(MRULENAME,2),
        conc(opt(conc(atom(CURLYOPEN,1),
                conc(star(atom(ANDCOND,6)
                        ),
                    atom(CURLYCLOSE,1)
                    )
                )
                ),
            conc(star(conc(alt(atom(COMMA,8),
                        atom(BAR,8)
                        ),
                    conc(atom(MRULENAME,2),
                        opt(conc(atom(CURLYOPEN,1),
                            conc(star(atom(ANDCOND,6)
                                    ),
                                atom(CURLYCLOSE,1)
                                )
                            )
                            )
                        )
                    )
                    ),
                conc(opt(atom(LEFTARROW,4)
                        ),
                    conc(atom(DASH,1),
                        conc(opt(atom(RIGHTARROW,5)
                                ),
                            conc(atom(ILRULENAME,3),
                                conc(opt(conc(atom(CURLYOPEN,1),
                                        conc(star(atom(ANDCOND,7)
                                                ),
                                            atom(CURLYCLOSE,1)
                                            )
                                        )
                                        ),
                                    conc(star(conc(alt(atom(COMMA,9),
                                                atom(BAR,9)
                                                ),
                                            conc(atom(ILRULENAME,3),
                                                opt(conc(atom(CURLYOPEN,1),
                                                    conc(star(atom(ANDCOND,7)
                                                            ),
                                                        atom(CURLYCLOSE,1)
                                                        )
                                                    )
                                                    )
                                                )
                                            )
                                            ),
                                        opt(conc(opt(atom(COLON,1)
                                                ),
                                            conc(alt(atom(SBONUS,10),
                                                    atom(WBONUS,11)
                                                    ),
                                                conc(opt(alt(atom(DASH,12),
                                                        atom(PLUS,13)
                                                        )
                                                        ),
                                                    atom(IDENTIFIER,14)
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
{:RULETRANS}

{rule:}
{:ANDCOND}
procedure ANDCONDgraph(i:INTEGER);
BEGIN
prod(i,ANDCOND,
    conc(atom(ORCOND,2),
        star(conc(atom(ANDCAT,1),
            atom(ORCOND,2)
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
procedure ELEMENTARYCONDgraph(i:INTEGER);
BEGIN
prod(i,ELEMENTARYCOND,
    alt(conc(atom(ROUNDOPEN,1),
            conc(atom(ANDCOND,2),
                atom(ROUNDCLOSE,1)
                )
            ),
        atom(PASCALEXPR,3)
        )
    )
END;
{:ELEMENTARYCOND}

{rule:}
{:PASCALEXPR}
function INTEQUALSgraph:tracomDECL_psurfgraph;
BEGIN
INTEQUALSgraph:=
conc(atom(PARAMNAME,18),
    conc(atom(EQUIVALENT,1),
        alt(atom(X1,17),
            alt(atom(X2,17),
                atom(X3,17)
                )
            )
        )
    )
END;
function EQUALSgraph:tracomDECL_psurfgraph;
BEGIN
EQUALSgraph:=
conc(atom(PARAMNAME,10),
    conc(alt(atom(EQUIVALENT,2),
            conc(atom(LEFTARROW,3),
                atom(RIGHTARROW,1)
                )
            ),
        alt(atom(VALUENAME,11),
            atom(SETVALUENAME,12)
            )
        )
    )
END;
function SETBOOLEANgraph:tracomDECL_psurfgraph;
BEGIN
SETBOOLEANgraph:=
conc(opt(atom(NOTCAT,4)
        ),
    conc(opt(atom(ROUNDOPEN,5)
            ),
        conc(atom(PARAMNAME,13),
            conc(alt(atom(INCAT,6),
                    alt(conc(atom(LEFTARROW,7),
                            atom(EQUIVALENT,1)
                            ),
                        conc(atom(RIGHTARROW,8),
                            atom(EQUIVALENT,1)
                            )
                        )
                    ),
                conc(atom(SETVALUENAME,14),
                    opt(atom(ROUNDCLOSE,9)
                        )
                    )
                )
            )
        )
    )
END;
function NIBOOLEANgraph:tracomDECL_psurfgraph;
BEGIN
NIBOOLEANgraph:=
conc(opt(atom(NOTCAT,4)
        ),
    conc(opt(atom(ROUNDOPEN,5)
            ),
        conc(atom(PARAMNAME,15),
            conc(atom(NICAT,1),
                conc(atom(VALUENAME,16),
                    opt(atom(ROUNDCLOSE,9)
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
        alt(SETBOOLEANgraph,
            alt(NIBOOLEANgraph,
                INTEQUALSgraph
                )
            )
        )
    )
END;
{:PASCALEXPR}

{rule:}
{:SETVALUENAME}
procedure SETVALUENAMEgraph(i:INTEGER);
BEGIN
prod(i,SETVALUENAME,
    conc(atom(SQUAREOPEN,1),
        conc(opt(conc(atom(VALUENAME,2),
                star(conc(atom(COMMA,3),
                    atom(VALUENAME,2)
                    )
                    )
                )
                ),
            atom(SQUARECLOSE,1)
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
    atom(IDENTIFIER,1)
    )
END;
{:VALUENAME}

{rule:}
{:PARAMNAME}
procedure PARAMNAMEgraph(i:INTEGER);
BEGIN
prod(i,PARAMNAME,
    atom(IDENTIFIER,1)
    )
END;
{:PARAMNAME}

{rule:}
{:TYPENAME}
procedure TYPENAMEgraph(i:INTEGER);
BEGIN
prod(i,TYPENAME,
    atom(IDENTIFIER,1)
    )
END;
{:TYPENAME}

{rule:}
{:MRULENAME}
procedure MRULENAMEgraph(i:INTEGER);
BEGIN
prod(i,MRULENAME,
    atom(IDENTIFIER,1)
    )
END;
{:MRULENAME}

{rule:}
{:ILRULENAME}
procedure ILRULENAMEgraph(i:INTEGER);
BEGIN
prod(i,ILRULENAME,
    atom(IDENTIFIER,1)
    )
END;
{:ILRULENAME}
 procedure tracomGRAPHDEF_SFG(i:INTEGER);
BEGIN
CASE i OF
  1:UTTgraph(  1);
  2:PARAMETERSTRANSgraph(  2);
  3:PARAMETERTRANSgraph(  3);
  4:ELEMENTTRANSgraph(  4);
  5:LANGVERSIONgraph(  5);
  6:RULESTRANSgraph(  6);
  7:RULETRANSgraph(  7);
  8:ANDCONDgraph(  8);
  9:ORCONDgraph(  9);
 10:ELEMENTARYCONDgraph( 10);
 11:PASCALEXPRgraph( 11);
 12:SETVALUENAMEgraph( 12);
 13:VALUENAMEgraph( 13);
 14:PARAMNAMEgraph( 14);
 15:TYPENAMEgraph( 15);
 16:MRULENAMEgraph( 16);
 17:ILRULENAMEgraph( 17);
END
END;
 FUNCTION tracomGRAPHDEF_topcat(i:integer):tracomLANGSPEC_Category;
BEGIN
CASE i OF
  1: tracomGRAPHDEF_topcat:= UTT;
  2: tracomGRAPHDEF_topcat:= PARAMETERSTRANS;
  3: tracomGRAPHDEF_topcat:= PARAMETERTRANS;
  4: tracomGRAPHDEF_topcat:= ELEMENTTRANS;
  5: tracomGRAPHDEF_topcat:= LANGVERSION;
  6: tracomGRAPHDEF_topcat:= RULESTRANS;
  7: tracomGRAPHDEF_topcat:= RULETRANS;
  8: tracomGRAPHDEF_topcat:= ANDCOND;
  9: tracomGRAPHDEF_topcat:= ORCOND;
 10: tracomGRAPHDEF_topcat:= ELEMENTARYCOND;
 11: tracomGRAPHDEF_topcat:= PASCALEXPR;
 12: tracomGRAPHDEF_topcat:= SETVALUENAME;
 13: tracomGRAPHDEF_topcat:= VALUENAME;
 14: tracomGRAPHDEF_topcat:= PARAMNAME;
 15: tracomGRAPHDEF_topcat:= TYPENAME;
 16: tracomGRAPHDEF_topcat:= MRULENAME;
 17: tracomGRAPHDEF_topcat:= ILRULENAME;
END
END;
