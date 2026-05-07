EXPORT(surflinkgraphdef);
pragma C_include('surflinkgraphdef.pf');
pragma C_include('surflinkgraph.pf');
pragma C_include('surflinklangspec.pf');
pragma C_include('surflinkdecl.pf');
PROGRAM surflinkGRAPHDEF;
WITH surflinkgraph,
surflinkdecl,
surflinklangspec;

{rule:}
{:UTT}
procedure UTTgraph(i:INTEGER);
BEGIN
prod(i,UTT,
    conc(atom(PROCENT,1),
        conc(star(conc(atom(IDENTIFIER,2),
                conc(atom(ISCAT,1),
                    conc(atom(GRAPH,3),
                        conc(opt(conc(atom(PLUS,1),
                                conc(atom(IDENTIFIER,5),
                                    star(conc(atom(PLUS,1),
                                        atom(IDENTIFIER,6)
                                        )
                                        )
                                    )
                                )
                                ),
                            opt(atom(PARAMS,4)
                                )
                            )
                        )
                    )
                )
                ),
            atom(PROCENT,1)
            )
        )
    )
END;
{:UTT}

{rule:}
{:PARAMS}
procedure PARAMSgraph(i:INTEGER);
BEGIN
prod(i,PARAMS,
    star(conc(atom(HEKJE,1),
        conc(atom(IDENTIFIER,3),
            conc(atom(HEKJE,1),
                conc(atom(IDENTIFIER,2),
                    conc(atom(ISCAT,2),
                        conc(atom(IDENTIFIER,4),
                            conc(star(conc(atom(IDENTIFIER,2),
                                    conc(atom(COLON,2),
                                        conc(atom(IDENTIFIER,4),
                                            opt(atom(SEMICOLON,2)
                                                )
                                            )
                                        )
                                    )
                                    ),
                                conc(atom(IDENTIFIER,2),
                                    atom(SEMICOLON,2)
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
{:PARAMS}

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
    conc(atom(ELEMGRAPH,2),
        star(conc(atom(DOT,1),
            atom(ELEMGRAPH,2)
            )
            )
        )
    )
END;
{:CONCGRAPH}

{rule:}
{:ELEMGRAPH}
procedure ELEMGRAPHgraph(i:INTEGER);
BEGIN
prod(i,ELEMGRAPH,
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
                alt(conc(atom(IDENTIFIER,5),
                        conc(atom(SLASH,1),
                            atom(NUMBER,6)
                            )
                        ),
                    atom(IDENTIFIER,7)
                    )
                )
            )
        )
    )
END;
{:ELEMGRAPH}

{rule:}
{:NUMBER}
procedure NUMBERgraph(i:INTEGER);
BEGIN
prod(i,NUMBER,
    atom(IDENTIFIER,1)
    )
END;
{:NUMBER}
 procedure surflinkGRAPHDEF_SFG(i:INTEGER);
BEGIN
CASE i OF
  1:UTTgraph(  1);
  2:PARAMSgraph(  2);
  3:GRAPHgraph(  3);
  4:CONCGRAPHgraph(  4);
  5:ELEMGRAPHgraph(  5);
  6:NUMBERgraph(  6);
END
END;
 FUNCTION surflinkGRAPHDEF_topcat(i:integer):surflinkLANGSPEC_Category;
BEGIN
CASE i OF
  1: surflinkGRAPHDEF_topcat:= UTT;
  2: surflinkGRAPHDEF_topcat:= PARAMS;
  3: surflinkGRAPHDEF_topcat:= GRAPH;
  4: surflinkGRAPHDEF_topcat:= CONCGRAPH;
  5: surflinkGRAPHDEF_topcat:= ELEMGRAPH;
  6: surflinkGRAPHDEF_topcat:= NUMBER;
END
END;
