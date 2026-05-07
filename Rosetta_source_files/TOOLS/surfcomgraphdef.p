EXPORT(surfcomgraphdef);
pragma C_include('surfcomgraphdef.pf');
pragma C_include('surfcomgraph.pf');
pragma C_include('surfcomlangspec.pf');
pragma C_include('surfcomdecl.pf');
PROGRAM surfcomGRAPHDEF;
WITH surfcomgraph,
surfcomdecl,
surfcomlangspec;

{rule:}
{:UTT}
procedure UTTgraph(i:INTEGER);
BEGIN
prod(i,UTT,
    conc(atom(PROCENT,1),
        conc(atom(IDENTIFIER,2),
            conc(star(atom(RULESPEC,3)
                    ),
                atom(PROCENT,1)
                )
            )
        )
    )
END;
{:UTT}

{rule:}
{:RULESPEC}
procedure RULESPECgraph(i:INTEGER);
BEGIN
prod(i,RULESPEC,
    conc(atom(IDENTIFIER,2),
        conc(atom(REGULAREXPRESSION,1),
            conc(atom(COLON,1),
                conc(atom(IDENTIFIER,5),
                    conc(atom(ISCAT,1),
                        conc(atom(GRAPH,3),
                            conc(atom(COLON,1),
                                atom(RULEBODY,4)
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
{:GRAPH}
procedure GRAPHgraph(i:INTEGER);
BEGIN
prod(i,GRAPH,
    conc(star(alt(atom(ROUNDOPEN,1),
            alt(atom(ROUNDCLOSE,1),
                alt(atom(DOT,4),
                    alt(atom(ISCAT,4),
                        atom(IDENTIFIER,3)
                        )
                    )
                )
            )
            ),
        conc(star(conc(atom(SLASH,4),
                star(alt(atom(ROUNDOPEN,1),
                    alt(atom(ROUNDCLOSE,1),
                        alt(atom(DOT,4),
                            alt(atom(ISCAT,4),
                                atom(IDENTIFIER,3)
                                )
                            )
                        )
                    )
                    )
                )
                ),
            atom(CONDITIONSANDACTIONS,1)
            )
        )
    )
END;
{:GRAPH}

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
{:RULEBODY}
procedure RULEBODYgraph(i:INTEGER);
BEGIN
prod(i,RULEBODY,
    conc(opt(conc(atom(VARCAT,1),
            star(conc(atom(IDENTIFIER,2),
                conc(atom(COLON,1),
                    conc(opt(conc(atom(COLON,1),
                            opt(atom(COLON,7)
                                )
                            )
                            ),
                        conc(atom(IDENTIFIER,3),
                            atom(SEMICOLON,1)
                            )
                        )
                    )
                )
                )
            )
            ),
        conc(atom(LEFTSTAR,1),
            conc(atom(INITBLOCK,5),
                conc(star(atom(BLOCK,4)
                        ),
                    conc(atom(FINALBLOCK,6),
                        conc(atom(IDENTIFIER,1),
                            atom(SEMICOLON,1)
                            )
                        )
                    )
                )
            )
        )
    )
END;
{:RULEBODY}

{rule:}
{:BLOCK}
procedure BLOCKgraph(i:INTEGER);
BEGIN
prod(i,BLOCK,
    conc(atom(NUMBER,2),
        conc(atom(COLON,1),
            conc(atom(LEFTSTAR,1),
                conc(atom(LOCALCONDITION,1),
                    conc(atom(COLON,1),
                        conc(atom(PASCALTOGLOBAL,3),
                            conc(atom(COLON,1),
                                conc(atom(HEKJE,1),
                                    conc(atom(CONDITION,1),
                                        conc(atom(COLON,1),
                                            conc(atom(PASCALTOHEKJE,4),
                                                conc(atom(ACTION,1),
                                                    conc(atom(COLON,1),
                                                        atom(PSTOSTARRIGHT,5)
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
{:BLOCK}

{rule:}
{:INITBLOCK}
procedure INITBLOCKgraph(i:INTEGER);
BEGIN
prod(i,INITBLOCK,
    conc(atom(HINITCAT,2),
        conc(atom(COLON,1),
            atom(PASCALTOEND,3)
            )
        )
    )
END;
{:INITBLOCK}

{rule:}
{:FINALBLOCK}
procedure FINALBLOCKgraph(i:INTEGER);
BEGIN
prod(i,FINALBLOCK,
    conc(atom(HFINALCAT,2),
        conc(atom(COLON,1),
            conc(atom(HEKJE,1),
                conc(atom(CONDITION,1),
                    conc(atom(COLON,1),
                        conc(atom(PASCALTOHEKJE,4),
                            conc(atom(ACTION,1),
                                conc(atom(COLON,1),
                                    atom(PSTOSTARRIGHT,5)
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
{:FINALBLOCK}

{rule:}
{:PASCALTOHEKJE}
function PASCAL1graph:surfcomDECL_psurfgraph;
BEGIN
PASCAL1graph:=
alt(atom(ROUNDOPEN,1),
    alt(atom(ROUNDCLOSE,1),
        alt(atom(COMMA,1),
            alt(atom(IDENTIFIER,1),
                alt(atom(PROCENT,2),
                    alt(atom(DOT,4),
                        alt(atom(AUX,6),
                            alt(atom(KEYtje,3),
                                alt(atom(COLON,1),
                                    alt(atom(SEMICOLON,5),
                                        alt(atom(ISCAT,1),
                                            atom(UNDERSCORE,8)
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
procedure PASCALTOHEKJEgraph(i:INTEGER);
BEGIN
prod(i,PASCALTOHEKJE,
    conc(star(PASCAL1graph
            ),
        atom(HEKJE,7)
        )
    )
END;
{:PASCALTOHEKJE}

{rule:}
{:PASCALTOGLOBAL}
function PASCAL2graph:surfcomDECL_psurfgraph;
BEGIN
PASCAL2graph:=
alt(atom(ROUNDOPEN,1),
    alt(atom(ROUNDCLOSE,1),
        alt(atom(COMMA,1),
            alt(atom(IDENTIFIER,1),
                alt(atom(PROCENT,2),
                    alt(atom(DOT,4),
                        alt(atom(AUX,6),
                            alt(atom(KEYtje,3),
                                alt(atom(COLON,1),
                                    alt(atom(SEMICOLON,5),
                                        alt(atom(ISCAT,1),
                                            atom(UNDERSCORE,8)
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
procedure PASCALTOGLOBALgraph(i:INTEGER);
BEGIN
prod(i,PASCALTOGLOBAL,
    conc(star(PASCAL2graph
            ),
        atom(GLOBAL,7)
        )
    )
END;
{:PASCALTOGLOBAL}

{rule:}
{:PSTOSTARRIGHT}
function PASCAL3graph:surfcomDECL_psurfgraph;
BEGIN
PASCAL3graph:=
alt(atom(ROUNDOPEN,1),
    alt(atom(ROUNDCLOSE,1),
        alt(atom(COMMA,1),
            alt(atom(IDENTIFIER,1),
                alt(atom(PROCENT,2),
                    alt(atom(DOT,4),
                        alt(atom(AUX,6),
                            alt(atom(KEYtje,3),
                                alt(atom(MAKE,9),
                                    alt(atom(ISCAT,1),
                                        alt(atom(SEMICOLON,5),
                                            alt(conc(atom(COLON,1),
                                                    atom(ISCAT,11)
                                                    ),
                                                alt(atom(UNDERSCORE,8),
                                                    atom(DOLLAR,10)
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
procedure PSTOSTARRIGHTgraph(i:INTEGER);
BEGIN
prod(i,PSTOSTARRIGHT,
    conc(star(PASCAL3graph
            ),
        atom(STARRIGHT,7)
        )
    )
END;
{:PSTOSTARRIGHT}

{rule:}
{:PASCALTOEND}
procedure PASCALTOENDgraph(i:INTEGER);
BEGIN
prod(i,PASCALTOEND,
    star(alt(conc(atom(IDENTIFIER,9),
            conc(atom(COLON,7),
                conc(opt(atom(COLON,8)
                        ),
                    atom(ISCAT,1)
                    )
                )
            ),
        alt(atom(PROCENT,2),
            alt(atom(AUX,4),
                alt(atom(KEYtje,5),
                    alt(atom(COLON,1),
                        alt(atom(DOT,1),
                            alt(atom(SEMICOLON,3),
                                alt(atom(UNDERSCORE,1),
                                    alt(atom(IDENTIFIER,1),
                                        alt(atom(ROUNDOPEN,1),
                                            alt(atom(ROUNDCLOSE,1),
                                                atom(COMMA,1)
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
{:PASCALTOEND}
 procedure surfcomGRAPHDEF_SFG(i:INTEGER);
BEGIN
CASE i OF
  1:UTTgraph(  1);
  2:RULESPECgraph(  2);
  3:GRAPHgraph(  3);
  4:NUMBERgraph(  4);
  5:RULEBODYgraph(  5);
  6:BLOCKgraph(  6);
  7:INITBLOCKgraph(  7);
  8:FINALBLOCKgraph(  8);
  9:PASCALTOHEKJEgraph(  9);
 10:PASCALTOGLOBALgraph( 10);
 11:PSTOSTARRIGHTgraph( 11);
 12:PASCALTOENDgraph( 12);
END
END;
 FUNCTION surfcomGRAPHDEF_topcat(i:integer):surfcomLANGSPEC_Category;
BEGIN
CASE i OF
  1: surfcomGRAPHDEF_topcat:= UTT;
  2: surfcomGRAPHDEF_topcat:= RULESPEC;
  3: surfcomGRAPHDEF_topcat:= GRAPH;
  4: surfcomGRAPHDEF_topcat:= NUMBER;
  5: surfcomGRAPHDEF_topcat:= RULEBODY;
  6: surfcomGRAPHDEF_topcat:= BLOCK;
  7: surfcomGRAPHDEF_topcat:= INITBLOCK;
  8: surfcomGRAPHDEF_topcat:= FINALBLOCK;
  9: surfcomGRAPHDEF_topcat:= PASCALTOHEKJE;
 10: surfcomGRAPHDEF_topcat:= PASCALTOGLOBAL;
 11: surfcomGRAPHDEF_topcat:= PSTOSTARRIGHT;
 12: surfcomGRAPHDEF_topcat:= PASCALTOEND;
END
END;
