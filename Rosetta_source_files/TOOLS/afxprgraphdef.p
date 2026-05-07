EXPORT(afxprgraphdef);
pragma C_include('afxprgraphdef.pf');
pragma C_include('afxprgraph.pf');
pragma C_include('afxprlangspec.pf');
pragma C_include('afxprdecl.pf');
PROGRAM afxprGRAPHDEF;
WITH afxprgraph,
afxprdecl,
afxprlangspec;

{rule:}
{:UTT}
procedure UTTgraph(i:INTEGER);
BEGIN
prod(i,UTT,
    conc(atom(AFFIXEXPR,1),
        conc(atom(EQUAL,2),
            conc(atom(EXPR,3),
                atom(EXPREND,1)
                )
            )
        )
    )
END;
{:UTT}

{rule:}
{:EXPR}
procedure EXPRgraph(i:INTEGER);
BEGIN
prod(i,EXPR,
    alt(atom(ROUND,1),
        alt(atom(LAND,2),
            alt(atom(LOR,3),
                alt(atom(LOPT,4),
                    alt(atom(REP,5),
                        atom(LEAVE,6)
                        )
                    )
                )
            )
        )
    )
END;
{:EXPR}

{rule:}
{:ROUND}
procedure ROUNDgraph(i:INTEGER);
BEGIN
prod(i,ROUND,
    conc(atom(LROUND,10),
        conc(atom(EXPR,1),
            atom(RROUND,11)
            )
        )
    )
END;
{:ROUND}

{rule:}
{:LAND}
procedure LANDgraph(i:INTEGER);
BEGIN
prod(i,LAND,
    conc(atom(EXPR,1),
        conc(opt(atom(DOT,10)
                ),
            atom(EXPR,2)
            )
        )
    )
END;
{:LAND}

{rule:}
{:LOR}
procedure LORgraph(i:INTEGER);
BEGIN
prod(i,LOR,
    conc(atom(EXPR,1),
        conc(atom(BAR,10),
            atom(EXPR,2)
            )
        )
    )
END;
{:LOR}

{rule:}
{:LOPT}
procedure LOPTgraph(i:INTEGER);
BEGIN
prod(i,LOPT,
    conc(atom(LSQUARE,10),
        conc(atom(EXPR,1),
            atom(RSQUARE,11)
            )
        )
    )
END;
{:LOPT}

{rule:}
{:REP}
procedure REPgraph(i:INTEGER);
BEGIN
prod(i,REP,
    conc(atom(LCURLY,10),
        conc(atom(EXPR,1),
            atom(RCURLY,11)
            )
        )
    )
END;
{:REP}

{rule:}
{:LEAVE}
procedure LEAVEgraph(i:INTEGER);
BEGIN
prod(i,LEAVE,
    atom(IDENTIFIER,1)
    )
END;
{:LEAVE}
 procedure afxprGRAPHDEF_SFG(i:INTEGER);
BEGIN
CASE i OF
  1:UTTgraph(  1);
  2:EXPRgraph(  2);
  3:ROUNDgraph(  3);
  4:LANDgraph(  4);
  5:LORgraph(  5);
  6:LOPTgraph(  6);
  7:REPgraph(  7);
  8:LEAVEgraph(  8);
END
END;
 FUNCTION afxprGRAPHDEF_topcat(i:integer):afxprLANGSPEC_Category;
BEGIN
CASE i OF
  1: afxprGRAPHDEF_topcat:= UTT;
  2: afxprGRAPHDEF_topcat:= EXPR;
  3: afxprGRAPHDEF_topcat:= ROUND;
  4: afxprGRAPHDEF_topcat:= LAND;
  5: afxprGRAPHDEF_topcat:= LOR;
  6: afxprGRAPHDEF_topcat:= LOPT;
  7: afxprGRAPHDEF_topcat:= REP;
  8: afxprGRAPHDEF_topcat:= LEAVE;
END
END;
