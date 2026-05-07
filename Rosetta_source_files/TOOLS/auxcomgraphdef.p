EXPORT(auxcomgraphdef);
pragma C_include('auxcomgraphdef.pf');
pragma C_include('auxcomgraph.pf');
pragma C_include('auxcomlangspec.pf');
pragma C_include('auxcomdecl.pf');
PROGRAM auxcomGRAPHDEF;
WITH auxcomgraph,
auxcomdecl,
auxcomlangspec;

{rule:}
{:UTT}
procedure UTTgraph(i:INTEGER);
BEGIN
prod(i,UTT,
    conc(atom(LANGVERSION,1),
        conc(opt(atom(KEYSECTION,2)
                ),
            conc(opt(atom(RECSECTION,3)
                    ),
                conc(opt(atom(ABBRSECTION,4)
                        ),
                    opt(atom(VARCATSECTION,5)
                        )
                    )
                )
            )
        )
    )
END;
{:UTT}

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
{:KEYSECTION}
procedure KEYSECTIONgraph(i:INTEGER);
BEGIN
prod(i,KEYSECTION,
    conc(atom(KEYS,1),
        conc(atom(LEFTARROW,2),
            conc(star(atom(ARGUMENTS,3)
                    ),
                atom(RIGHTARROW,2)
                )
            )
        )
    )
END;
{:KEYSECTION}

{rule:}
{:ARGUMENTS}
procedure ARGUMENTSgraph(i:INTEGER);
BEGIN
prod(i,ARGUMENTS,
    conc(atom(IDENTIFIER,1),
        opt(conc(atom(EQUIVALENT,2),
            atom(ARGLIST,3)
            )
            )
        )
    )
END;
{:ARGUMENTS}

{rule:}
{:ARGLIST}
procedure ARGLISTgraph(i:INTEGER);
BEGIN
prod(i,ARGLIST,
    conc(atom(LEFTARROW,1),
        conc(atom(KEYtje,1),
            conc(atom(EQUIVALENT,1),
                conc(atom(NUMBER,2),
                    conc(atom(TERM,1),
                        conc(atom(EQUIVALENT,1),
                            conc(atom(TERMARGUMENT,4),
                                conc(atom(CATEGORY,1),
                                    conc(atom(EQUIVALENT,1),
                                        conc(atom(IDENTIFIER,3),
                                            atom(RIGHTARROW,1)
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
{:ARGLIST}

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
{:TERMARGUMENT}
procedure TERMARGUMENTgraph(i:INTEGER);
BEGIN
prod(i,TERMARGUMENT,
    alt(atom(IDENTIFIER,1),
        alt(atom(ABSTRACT,2),
            atom(PUNCTUATION,3)
            )
        )
    )
END;
{:TERMARGUMENT}

{rule:}
{:PUNCTUATION}
function PUNC1graph:auxcomDECL_psurfgraph;
BEGIN
PUNC1graph:=
alt(atom(LEFTARROW,1),
    alt(atom(RIGHTARROW,2),
        alt(atom(SQUAREOPEN,3),
            atom(SQUARECLOSE,4)
            )
        )
    )
END;
function PUNC2graph:auxcomDECL_psurfgraph;
BEGIN
PUNC2graph:=
alt(atom(ROUNDOPEN,5),
    alt(atom(ROUNDCLOSE,6),
        alt(atom(CURLYOPEN,7),
            atom(CURLYCLOSE,8)
            )
        )
    )
END;
function PUNC3graph:auxcomDECL_psurfgraph;
BEGIN
PUNC3graph:=
alt(atom(RIGHTQUOTE,9),
    alt(atom(DOUBLEQUOTE,11),
        alt(atom(PLUS,31),
            atom(MINUS,12)
            )
        )
    )
END;
function PUNC4graph:auxcomDECL_psurfgraph;
BEGIN
PUNC4graph:=
alt(atom(ASTERISK,13),
    alt(atom(EQUIVALENT,14),
        alt(atom(EXCLAMATION,15),
            alt(atom(QUARY,16),
                atom(COLON,17)
                )
            )
        )
    )
END;
function PUNC5graph:auxcomDECL_psurfgraph;
BEGIN
PUNC5graph:=
alt(atom(COMMA,18),
    alt(atom(SEMICOLON,19),
        alt(atom(DOT,20),
            alt(atom(MONKEYTAIL,21),
                alt(atom(RAILING,22),
                    atom(DOLLAR,23)
                    )
                )
            )
        )
    )
END;
function PUNC6graph:auxcomDECL_psurfgraph;
BEGIN
PUNC6graph:=
alt(atom(PERCENT,24),
    alt(atom(ROOF,25),
        alt(atom(ANDSIGN,26),
            alt(atom(UNDERSCORE,27),
                atom(BACKSLASH,28)
                )
            )
        )
    )
END;
function PUNC7graph:auxcomDECL_psurfgraph;
BEGIN
PUNC7graph:=
alt(atom(UPSLASH,28),
    alt(atom(FORWARDSLASH,30),
        alt(atom(INVQUARY,32),
            atom(INVEXCLAMATION,33)
            )
        )
    )
END;
procedure PUNCTUATIONgraph(i:INTEGER);
BEGIN
prod(i,PUNCTUATION,
    alt(PUNC1graph,
        alt(PUNC2graph,
            alt(PUNC3graph,
                alt(PUNC4graph,
                    alt(PUNC5graph,
                        alt(PUNC6graph,
                            PUNC7graph
                            )
                        )
                    )
                )
            )
        )
    )
END;
{:PUNCTUATION}

{rule:}
{:RECSECTION}
procedure RECSECTIONgraph(i:INTEGER);
BEGIN
prod(i,RECSECTION,
    conc(atom(STANDARD,1),
        conc(atom(RECORDS,1),
            conc(atom(LEFTARROW,1),
                conc(star(atom(NUMRECORDS,2)
                        ),
                    atom(RIGHTARROW,1)
                    )
                )
            )
        )
    )
END;
{:RECSECTION}

{rule:}
{:NUMRECORDS}
procedure NUMRECORDSgraph(i:INTEGER);
BEGIN
prod(i,NUMRECORDS,
    conc(atom(IDENTIFIER,1),
        conc(atom(COLON,2),
            conc(atom(TYPESECTION,4),
                atom(FIELDLIST,3)
                )
            )
        )
    )
END;
{:NUMRECORDS}

{rule:}
{:TYPESECTION}
procedure TYPESECTIONgraph(i:INTEGER);
BEGIN
prod(i,TYPESECTION,
    atom(IDENTIFIER,1)
    )
END;
{:TYPESECTION}

{rule:}
{:FIELDLIST}
procedure FIELDLISTgraph(i:INTEGER);
BEGIN
prod(i,FIELDLIST,
    conc(atom(CURLYOPEN,1),
        conc(star(conc(atom(IDENTIFIER,2),
                conc(atom(EQUIVALENT,3),
                    atom(FIELDVALUE,4)
                    )
                )
                ),
            atom(CURLYCLOSE,1)
            )
        )
    )
END;
{:FIELDLIST}

{rule:}
{:FIELDVALUE}
procedure FIELDVALUEgraph(i:INTEGER);
BEGIN
prod(i,FIELDVALUE,
    alt(atom(IDENTIFIER,1),
        conc(atom(SQUAREOPEN,2),
            alt(atom(SQUARECLOSE,3),
                conc(atom(IDENTIFIER,1),
                    conc(star(conc(atom(COMMA,4),
                            atom(IDENTIFIER,1)
                            )
                            ),
                        atom(SQUARECLOSE,3)
                        )
                    )
                )
            )
        )
    )
END;
{:FIELDVALUE}

{rule:}
{:ABBRSECTION}
procedure ABBRSECTIONgraph(i:INTEGER);
BEGIN
prod(i,ABBRSECTION,
    conc(atom(ABBRSETS,1),
        conc(atom(LEFTARROW,2),
            conc(star(atom(NUMABBRS,3)
                    ),
                atom(RIGHTARROW,2)
                )
            )
        )
    )
END;
{:ABBRSECTION}

{rule:}
{:NUMABBRS}
procedure NUMABBRSgraph(i:INTEGER);
BEGIN
prod(i,NUMABBRS,
    conc(alt(conc(atom(SETTYPE,4),
                atom(IDENTIFIER,5)
                ),
            conc(atom(BASETYPE,6),
                atom(IDENTIFIER,5)
                )
            ),
        conc(atom(IDENTIFIER,1),
            conc(atom(EQUIVALENT,2),
                atom(ABBRLIST,3)
                )
            )
        )
    )
END;
{:NUMABBRS}

{rule:}
{:ABBRLIST}
procedure ABBRLISTgraph(i:INTEGER);
BEGIN
prod(i,ABBRLIST,
    conc(atom(SQUAREOPEN,1),
        conc(opt(conc(star(conc(atom(IDENTIFIER,2),
                    atom(COMMA,3)
                    )
                    ),
                atom(IDENTIFIER,2)
                )
                ),
            atom(SQUARECLOSE,4)
            )
        )
    )
END;
{:ABBRLIST}

{rule:}
{:VARCATSECTION}
procedure VARCATSECTIONgraph(i:INTEGER);
BEGIN
prod(i,VARCATSECTION,
    conc(atom(VARCATS,1),
        conc(atom(COLON,1),
            conc(atom(LEFTARROW,1),
                conc(star(conc(atom(IDENTIFIER,2),
                        conc(atom(COLON,1),
                            atom(IDENTIFIER,3)
                            )
                        )
                        ),
                    atom(RIGHTARROW,1)
                    )
                )
            )
        )
    )
END;
{:VARCATSECTION}
 procedure auxcomGRAPHDEF_SFG(i:INTEGER);
BEGIN
CASE i OF
  1:UTTgraph(  1);
  2:LANGVERSIONgraph(  2);
  3:KEYSECTIONgraph(  3);
  4:ARGUMENTSgraph(  4);
  5:ARGLISTgraph(  5);
  6:NUMBERgraph(  6);
  7:TERMARGUMENTgraph(  7);
  8:PUNCTUATIONgraph(  8);
  9:RECSECTIONgraph(  9);
 10:NUMRECORDSgraph( 10);
 11:TYPESECTIONgraph( 11);
 12:FIELDLISTgraph( 12);
 13:FIELDVALUEgraph( 13);
 14:ABBRSECTIONgraph( 14);
 15:NUMABBRSgraph( 15);
 16:ABBRLISTgraph( 16);
 17:VARCATSECTIONgraph( 17);
END
END;
 FUNCTION auxcomGRAPHDEF_topcat(i:integer):auxcomLANGSPEC_Category;
BEGIN
CASE i OF
  1: auxcomGRAPHDEF_topcat:= UTT;
  2: auxcomGRAPHDEF_topcat:= LANGVERSION;
  3: auxcomGRAPHDEF_topcat:= KEYSECTION;
  4: auxcomGRAPHDEF_topcat:= ARGUMENTS;
  5: auxcomGRAPHDEF_topcat:= ARGLIST;
  6: auxcomGRAPHDEF_topcat:= NUMBER;
  7: auxcomGRAPHDEF_topcat:= TERMARGUMENT;
  8: auxcomGRAPHDEF_topcat:= PUNCTUATION;
  9: auxcomGRAPHDEF_topcat:= RECSECTION;
 10: auxcomGRAPHDEF_topcat:= NUMRECORDS;
 11: auxcomGRAPHDEF_topcat:= TYPESECTION;
 12: auxcomGRAPHDEF_topcat:= FIELDLIST;
 13: auxcomGRAPHDEF_topcat:= FIELDVALUE;
 14: auxcomGRAPHDEF_topcat:= ABBRSECTION;
 15: auxcomGRAPHDEF_topcat:= NUMABBRS;
 16: auxcomGRAPHDEF_topcat:= ABBRLIST;
 17: auxcomGRAPHDEF_topcat:= VARCATSECTION;
END
END;
