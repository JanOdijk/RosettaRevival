EXPORT(ilacomgraphdef);
pragma C_include('ilacomgraphdef.pf');
pragma C_include('ilacomgraph.pf');
pragma C_include('ilacomlangspec.pf');
pragma C_include('ilacomdecl.pf');
PROGRAM ilacomGRAPHDEF;
WITH ilacomgraph,
ilacomdecl,
ilacomlangspec;

{rule:}
{:UTT}
procedure UTTgraph(i:INTEGER);
BEGIN
prod(i,UTT,
    conc(atom(LANGVERSION,1),
        conc(opt(atom(TYPESPEC,2)
                ),
            atom(ILRULESSPEC,3)
            )
        )
    )
END;
{:UTT}

{rule:}
{:TYPESPEC}
procedure TYPESPECgraph(i:INTEGER);
BEGIN
prod(i,TYPESPEC,
    conc(atom(TYPEStje,1),
        conc(atom(LEFTARROW,1),
            conc(star(atom(TYPEDEFINITION,2)
                    ),
                atom(RIGHTARROW,1)
                )
            )
        )
    )
END;
{:TYPESPEC}

{rule:}
{:TYPEDEFINITION}
procedure TYPEDEFINITIONgraph(i:INTEGER);
BEGIN
prod(i,TYPEDEFINITION,
    alt(atom(ENUMDEF,1),
        alt(atom(SUBRANGEDEF,2),
            alt(atom(INTEGERDEF,3),
                alt(atom(BOOLEANDEF,4),
                    atom(SETDEF,5)
                    )
                )
            )
        )
    )
END;
{:TYPEDEFINITION}

{rule:}
{:ENUMDEF}
procedure ENUMDEFgraph(i:INTEGER);
BEGIN
prod(i,ENUMDEF,
    conc(atom(TYPENAME,2),
        conc(atom(EQUIVALENT,1),
            conc(atom(ROUNDOPEN,1),
                conc(atom(IDENTIFIER,3),
                    conc(star(conc(atom(COMMA,4),
                            atom(IDENTIFIER,3)
                            )
                            ),
                        conc(atom(ROUNDCLOSE,1),
                            atom(SEMICOLON,1)
                            )
                        )
                    )
                )
            )
        )
    )
END;
{:ENUMDEF}

{rule:}
{:SUBRANGEDEF}
procedure SUBRANGEDEFgraph(i:INTEGER);
BEGIN
prod(i,SUBRANGEDEF,
    conc(atom(TYPENAME,2),
        conc(atom(EQUIVALENT,1),
            conc(atom(IDENTIFIER,3),
                conc(atom(DOT,1),
                    conc(atom(DOT,1),
                        conc(atom(IDENTIFIER,4),
                            atom(SEMICOLON,1)
                            )
                        )
                    )
                )
            )
        )
    )
END;
{:SUBRANGEDEF}

{rule:}
{:INTEGERDEF}
procedure INTEGERDEFgraph(i:INTEGER);
BEGIN
prod(i,INTEGERDEF,
    conc(atom(TYPENAME,2),
        conc(atom(EQUIVALENT,1),
            conc(atom(INTEGERtje,1),
                atom(SEMICOLON,1)
                )
            )
        )
    )
END;
{:INTEGERDEF}

{rule:}
{:BOOLEANDEF}
procedure BOOLEANDEFgraph(i:INTEGER);
BEGIN
prod(i,BOOLEANDEF,
    conc(atom(TYPENAME,2),
        conc(atom(EQUIVALENT,1),
            conc(atom(BOOLEANtje,1),
                atom(SEMICOLON,1)
                )
            )
        )
    )
END;
{:BOOLEANDEF}

{rule:}
{:SETDEF}
procedure SETDEFgraph(i:INTEGER);
BEGIN
prod(i,SETDEF,
    conc(atom(TYPENAME,2),
        conc(atom(EQUIVALENT,1),
            conc(atom(SETtje,1),
                conc(atom(OFtje,1),
                    conc(atom(IDENTIFIER,3),
                        atom(SEMICOLON,1)
                        )
                    )
                )
            )
        )
    )
END;
{:SETDEF}

{rule:}
{:LANGVERSION}
procedure LANGVERSIONgraph(i:INTEGER);
BEGIN
prod(i,LANGVERSION,
    conc(atom(INTERLINGUA,1),
        atom(DEFINITION,2)
        )
    )
END;
{:LANGVERSION}

{rule:}
{:ILRULESspec}
procedure ILRULESspecgraph(i:INTEGER);
BEGIN
prod(i,ILRULESspec,
    conc(atom(ILRULES,1),
        conc(atom(LEFTARROW,1),
            conc(star(atom(ILRULE,2)
                    ),
                atom(RIGHTARROW,1)
                )
            )
        )
    )
END;
{:ILRULESspec}

{rule:}
{:ILRULE}
procedure ILRULEgraph(i:INTEGER);
BEGIN
prod(i,ILRULE,
    conc(atom(IDENTIFIER,2),
        alt(conc(atom(PARAMETERS,1),
                conc(atom(LEFTARROW,1),
                    conc(star(alt(conc(atom(PARAMname,3),
                                conc(atom(COLON,1),
                                    atom(TYPEname,4)
                                    )
                                ),
                            atom(LEVEL,5)
                            )
                            ),
                        atom(RIGHTARROW,1)
                        )
                    )
                ),
            atom(SEMICOLON,1)
            )
        )
    )
END;
{:ILRULE}

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
 procedure ilacomGRAPHDEF_SFG(i:INTEGER);
BEGIN
CASE i OF
  1:UTTgraph(  1);
  2:TYPESPECgraph(  2);
  3:TYPEDEFINITIONgraph(  3);
  4:ENUMDEFgraph(  4);
  5:SUBRANGEDEFgraph(  5);
  6:INTEGERDEFgraph(  6);
  7:BOOLEANDEFgraph(  7);
  8:SETDEFgraph(  8);
  9:LANGVERSIONgraph(  9);
 10:ILRULESspecgraph( 10);
 11:ILRULEgraph( 11);
 12:PARAMNAMEgraph( 12);
 13:TYPENAMEgraph( 13);
END
END;
 FUNCTION ilacomGRAPHDEF_topcat(i:integer):ilacomLANGSPEC_Category;
BEGIN
CASE i OF
  1: ilacomGRAPHDEF_topcat:= UTT;
  2: ilacomGRAPHDEF_topcat:= TYPESPEC;
  3: ilacomGRAPHDEF_topcat:= TYPEDEFINITION;
  4: ilacomGRAPHDEF_topcat:= ENUMDEF;
  5: ilacomGRAPHDEF_topcat:= SUBRANGEDEF;
  6: ilacomGRAPHDEF_topcat:= INTEGERDEF;
  7: ilacomGRAPHDEF_topcat:= BOOLEANDEF;
  8: ilacomGRAPHDEF_topcat:= SETDEF;
  9: ilacomGRAPHDEF_topcat:= LANGVERSION;
 10: ilacomGRAPHDEF_topcat:= ILRULESspec;
 11: ilacomGRAPHDEF_topcat:= ILRULE;
 12: ilacomGRAPHDEF_topcat:= PARAMNAME;
 13: ilacomGRAPHDEF_topcat:= TYPENAME;
END
END;
