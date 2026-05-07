(*MPM:::===================================================================*
 *
 *  Rosetta Project                                                 
 *                                                                  
 *  Module Title    : SEGCOMGRAPHDEF
 *  Creation date   :                                               
 *  Author          :                                               
 *                                                                  
 *  Copyright (c) 1985, by Nederlandse Philips Bedrijven BV.        
 *                                                                  
 *  Remarks         :  
 *
 *EMP:::===================================================================*)
Export(SEGCOMGRAPHDEF);
pragma C_include('segcomlangspec.pf');
pragma C_include('segcomdecl.pf');
pragma C_include('segcomgraph.pf');
pragma C_include('segcomgraphdef.pf');

(*=========================================================================*
 *  Imported modules
 *=========================================================================*)

PROGRAM SEGCOMGRAPHDEF;
WITH SEGCOMLANGSPEC,SEGCOMDECL,SEGCOMGRAPH;

PROCEDURE SFG(i:integer);
BEGIN
   CASE i OF
   1: prod(1, UTT,
           alt(atom(LGLUEDEF,1),
               alt(atom(RGLUEDEF,2),
                   alt(atom(MGLUEDEF,3),
                       alt(atom(PREDEF,4),
                           alt(atom(SUFDEF,5),
                               atom(FREEDEF,6)
                              )
                          )
                      )
                  )
              )
          );
   2: prod(2, LGLUEDEF,
           conc(atom(LGLUETYPESPEC,1),
                conc(opt(atom(VARSPECPART,2)),
                     conc(opt(atom(ALIASSPECPART,4)),
                          atom(LGLUETABLESPEC,3)
                         )
                    )
               )
          );
   3: prod(3, RGLUEDEF,
           conc(atom(RGLUETYPESPEC,1),
                conc(opt(atom(VARSPECPART,2)),
                     conc(opt(atom(ALIASSPECPART,4)),
                          atom(RGLUETABLESPEC,3)
                         )
                    )
               )
          );
   4: prod(4, MGLUEDEF,
           conc(atom(MGLUETYPESPEC,1),
                conc(opt(atom(VARSPECPART,2)),
                     conc(opt(atom(ALIASSPECPART,4)),
                          atom(MGLUETABLESPEC,3)
                         )
                    )
               )
          );
   5: prod(5, PREDEF,
           conc(atom(PRETYPESPEC,1),
                conc(opt(atom(VARSPECPART,2)),
                     conc(opt(atom(ALIASSPECPART,4)),
                          atom(PRETABLESPEC,3)
                         )
                    )
               )
          );
   6: prod(6, SUFDEF,
           conc(atom(SUFTYPESPEC,1),
                conc(opt(atom(VARSPECPART,2)),
                     conc(opt(atom(ALIASSPECPART,4)),
                          atom(SUFTABLESPEC,3)
                         )
                    )
               )
          );
   7: prod(7, FREEDEF,
           conc(atom(FREETYPESPEC,1),
                conc(opt(atom(VARSPECPART,2)),
                     atom(FREETABLESPEC,3)
                    )
               )
          );
   8: prod(8, LGLUETYPESPEC,
           conc(atom(TYPECAT,1),
                conc(alt(atom(LGLUE2CAT,2),
                         alt(atom(LGLUE3CAT,3),
                             atom(LGLUE4CAT,4)
                            )
                        ),
                     atom(SEMCOLON,5)
                    )
               )
          );
   9: prod(9, RGLUETYPESPEC,
           conc(atom(TYPECAT,1),
                conc(alt(atom(RGLUE2CAT,2),
                         alt(atom(RGLUE3CAT,3),
                             atom(RGLUE4CAT,4)
                            )
                        ),
                     atom(SEMCOLON,5)
                    )
               )
          );
  10: prod(10, MGLUETYPESPEC,
           conc(atom(TYPECAT,1),
                conc(atom(MGLUE2CAT,2),
                     atom(SEMCOLON,3)
                    )
               )
          );
  11: prod(11, PRETYPESPEC,
           conc(atom(TYPECAT,1),
                conc(alt(atom(PREFIXCAT,2),
                         atom(RPREFIXCAT,3)
                        ),
                     atom(SEMCOLON,4)
                    )
               )
          );
  12: prod(12, SUFTYPESPEC,
           conc(atom(TYPECAT,1),
                conc(alt(atom(SUFFIXCAT,2),
                         atom(RSUFFIXCAT,3)
                        ),
                     atom(SEMCOLON,4)
                    )
               )
          );
  13: prod(13, FREETYPESPEC,
           conc(atom(TYPECAT,1),
                conc(atom(FREEFIXCAT,2),
                     atom(SEMCOLON,3)
                    )
               )
          );
  14: prod(14, LGLUETABLESPEC,
           conc(atom(TABLECAT,1),
                conc(atom(LGLUEENTRYSPEC,2),
                     conc(star(atom(LGLUEENTRYSPEC,3)),
                          atom(ENDCAT,4)
                         )
                    )
               )
          );
  15: prod(15, RGLUETABLESPEC,
           conc(atom(TABLECAT,1),
                conc(atom(RGLUEENTRYSPEC,2),
                     conc(star(atom(RGLUEENTRYSPEC,3)),
                          atom(ENDCAT,4)
                         )
                    )
               )
          );
  16: prod(16, MGLUETABLESPEC,
           conc(atom(TABLECAT,1),
                conc(atom(MGLUEENTRYSPEC,2),
                     conc(star(atom(MGLUEENTRYSPEC,3)),
                          atom(ENDCAT,4)
                         )
                    )
               )
          );
  17: prod(17, PRETABLESPEC,
           conc(atom(TABLECAT,1),
                conc(atom(PREENTRYSPEC,2),
                     conc(star(atom(PREENTRYSPEC,3)),
                          atom(ENDCAT,4)
                         )
                    )
               )
          );
  18: prod(18, SUFTABLESPEC,
           conc(atom(TABLECAT,1),
                conc(atom(SUFENTRYSPEC,2),
                     conc(star(atom(SUFENTRYSPEC,3)),
                          atom(ENDCAT,4)
                         )
                    )
               )
          );
  19: prod(19, FREETABLESPEC,
           conc(atom(TABLECAT,1),
                conc(atom(FREEENTRYSPEC,2),
                     conc(star(atom(FREEENTRYSPEC,3)),
                          atom(ENDCAT,4)
                         )
                    )
               )
          );
  20: prod(20, LGLUEENTRYSPEC,
           conc(opt(atom(ANGENSPEC,1)),
                conc(atom(MATCHSTRING,2),
                     conc(atom(PLUS,3),
                          conc(star(conc(atom(MATCHSTRING,2),
                                         atom(PLUS,4)
                                        )
                                   ),
                               conc(opt(atom(MATCHSTRING,2)),
                                    conc(opt(atom(MULT,5)),
                                         conc(atom(COLON,6),
                                              conc(atom(COLON,6),
                                                   conc(opt(atom(MATCHSTRING,10)),
                                                        conc(opt(atom(MULT,5)),
                                                             atom(SEMCOLON,7)
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
          );
  21: prod(21, RGLUEENTRYSPEC,
           conc(opt(atom(ANGENSPEC,1)),
                conc(opt(atom(MULT,5)),
                     conc(opt(atom(MATCHSTRING,2)),
                          conc(atom(PLUS,3),
                               conc(star(conc(atom(MATCHSTRING,2),
                                              atom(PLUS,4)
                                             )
                                        ),
                                    conc(atom(MATCHSTRING,2),
                                         conc(atom(COLON,6),
                                              conc(atom(COLON,6),
                                                   conc(opt(atom(MULT,5)),
                                                        conc(opt(atom(MATCHSTRING,10)),
                                                             atom(SEMCOLON,7)
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
          );
  22: prod(22, MGLUEENTRYSPEC,
           conc(opt(atom(ANGENSPEC,1)),
                conc(atom(MATCHSTRING,2),
                     conc(star(conc(atom(PLUS,3),
                                    atom(MATCHSTRING,2)
                                   )
                              ),
                          conc(atom(COLON,6),
                               conc(atom(COLON,6),
                                    conc(atom(MATCHSTRING,10),
                                         atom(SEMCOLON,7)
                                        )
                                   )
                              )
                         )
                    )
               )
          );
  23: prod(23, PREENTRYSPEC,
           conc(opt(atom(ANGENSPEC,1)),
                conc(atom(PFKCAT,11),
                     conc(atom(PLUS,3),
                          conc(opt(atom(MATCHSTRING,2)),
                               conc(opt(atom(MULT,4)),
                                    conc(atom(COLON,6),
                                         conc(atom(COLON,6),
                                              conc(opt(atom(MATCHSTRING,10)),
                                                   conc(opt(atom(MULT,4)),
                                                        conc(opt(conc(atom(COMMA,8),
                                                                      atom(FONCAT,9)
                                                                     )
                                                                ),
                                                             atom(SEMCOLON,7)
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
          );
  24: prod(24, SUFENTRYSPEC,
           conc(opt(atom(ANGENSPEC,1)),
                conc(opt(atom(MULT,4)),
                     conc(opt(atom(MATCHSTRING,2)),
                          conc(atom(PLUS,3),
                               conc(atom(SFKCAT,11),
                                    conc(atom(COLON,6),
                                         conc(atom(COLON,6),
                                              conc(opt(atom(MULT,4)),
                                                   conc(opt(atom(MATCHSTRING,10)),
                                                        conc(opt(conc(atom(COMMA,8),
                                                                      atom(FONCAT,9)
                                                                     )
                                                                ),
                                                             atom(SEMCOLON,7)
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
          );
  25: prod(25, FREEENTRYSPEC,
           conc(opt(atom(ANGENSPEC,1)),
                conc(atom(MATCHSTRING,2),
                     conc(atom(PLUS,3),
                         conc(atom(SFKCAT,11),
                              conc(atom(COLON,6),
                                   conc(atom(COLON,6),
                                        conc(atom(MATCHSTRING,12),
                                             conc(opt(conc(atom(COMMA,8),
                                                           atom(FONCAT,9)
                                                          )
                                                     ),
                                                  conc(opt(conc(atom(COMMA,8),
                                                                atom(CCCAT,10)
                                                               )
                                                          ),
                                                       atom(SEMCOLON,7)
                                                      )
                                                 )
                                            )
                                       )
                                  )
                             )
                        )
                   )
              )
         );
  26: prod(26, VARSPECPART,
           conc(atom(VARCAT,1),
                star(atom(VARSPEC,2))
               )
          );
  27: prod(27, VARSPEC,
           conc(atom(IDENTIFIER,1),
                conc(star(conc(atom(COMMA,2),
                               atom(IDENTIFIER,5)
                              )
                         ),
                     conc(atom(EQL,2),
                          conc(atom(SETCONSTR,3),
                               atom(SEMCOLON,4)
                              )
                         )
                    )
               )
          );
  28: prod(28, SETCONSTR,
           conc(atom(LBRACK,1),
                conc(alt(atom(IDENTIFIER,2),
                         atom(IDPAIR, 5)
                        ),
                     conc(star(conc(atom(COMMA,3),
                                    alt(atom(IDENTIFIER,2),
                                        atom(IDPAIR, 5)
                                       )
                                   )
                              ),
                          conc(opt(atom(COMMA,4)),
                               atom(RBRACK,2)
                              )
                         )
                    )
               )
          );
  29: prod(29, ANGENSPEC,
           conc(atom(SLASH,1),
                atom(IDENTIFIER,2)
               )
          );
  30: prod(30, PFKCAT,
           atom(IDENTIFIER,1)
          );
  31: prod(31, SFKCAT,
           atom(IDENTIFIER,1)
          );
  32: prod(32, MATCHSTRING,
           star(alt(atom(IDENTIFIER,1),
                    conc(atom(LPAREN,2),
                         conc(atom(IDENTIFIER,3),
                              atom(RPAREN,4)
                             )
                        )
                   )
               )
          );
  33: prod(33, FONCAT,
           atom(IDENTIFIER,1)
          );
  34: prod(34, CCCAT,
           atom(IDENTIFIER,1)
          );
  35: prod(35, IDPAIR,
           conc(atom(IDENTIFIER,1), 
                conc(atom(LESS,2),
                     conc(atom(GREATER,2),
                          atom(IDENTIFIER,3)
                         )
                    )
               )
          );
  36: prod(36, ALIASSPECPART,
           conc(atom(ALIASCAT,1),
                star(atom(ALIASSPEC,2))
               )
          );
  37: prod(37, ALIASSPEC,
           conc(atom(IDENTIFIER,1),
                conc(atom(EQL,2),
                     conc(atom(IDENTIFIER,3),
                          conc(star(conc(atom(COMMA,2),
                                         atom(IDENTIFIER,3)
                                        )
                                   ),
                               atom(SEMCOLON,2)
                              )
                         )
                    )
               )
          );

   END;
END {SFG};


FUNCTION SEGCOMGRAPHDEF_topcat(i: integer): SEGCOMLANGSPEC_Category;

BEGIN
   CASE i OF
   1 : SEGCOMGRAPHDEF_topcat :=  UTT; 
   2 : SEGCOMGRAPHDEF_topcat :=  LGLUEDEF; 
   3 : SEGCOMGRAPHDEF_topcat :=  RGLUEDEF; 
   4 : SEGCOMGRAPHDEF_topcat :=  MGLUEDEF; 
   5 : SEGCOMGRAPHDEF_topcat :=  PREDEF; 
   6 : SEGCOMGRAPHDEF_topcat :=  SUFDEF; 
   7 : SEGCOMGRAPHDEF_topcat :=  FREEDEF; 
   8 : SEGCOMGRAPHDEF_topcat :=  LGLUETYPESPEC; 
   9 : SEGCOMGRAPHDEF_topcat :=  RGLUETYPESPEC; 
   10: SEGCOMGRAPHDEF_topcat :=  MGLUETYPESPEC; 
   11: SEGCOMGRAPHDEF_topcat :=  PRETYPESPEC; 
   12: SEGCOMGRAPHDEF_topcat :=  SUFTYPESPEC; 
   13: SEGCOMGRAPHDEF_topcat :=  FREETYPESPEC; 
   14: SEGCOMGRAPHDEF_topcat :=  LGLUETABLESPEC; 
   15: SEGCOMGRAPHDEF_topcat :=  RGLUETABLESPEC; 
   16: SEGCOMGRAPHDEF_topcat :=  MGLUETABLESPEC; 
   17: SEGCOMGRAPHDEF_topcat :=  PRETABLESPEC; 
   18: SEGCOMGRAPHDEF_topcat :=  SUFTABLESPEC; 
   19: SEGCOMGRAPHDEF_topcat :=  FREETABLESPEC; 
   20: SEGCOMGRAPHDEF_topcat :=  LGLUEENTRYSPEC; 
   21: SEGCOMGRAPHDEF_topcat :=  RGLUEENTRYSPEC; 
   22: SEGCOMGRAPHDEF_topcat :=  MGLUEENTRYSPEC; 
   23: SEGCOMGRAPHDEF_topcat :=  PREENTRYSPEC; 
   24: SEGCOMGRAPHDEF_topcat :=  SUFENTRYSPEC; 
   25: SEGCOMGRAPHDEF_topcat :=  FREEENTRYSPEC; 
   26: SEGCOMGRAPHDEF_topcat :=  VARSPECPART; 
   27: SEGCOMGRAPHDEF_topcat :=  VARSPEC; 
   28: SEGCOMGRAPHDEF_topcat :=  SETCONSTR; 
   29: SEGCOMGRAPHDEF_topcat :=  ANGENSPEC; 
   30: SEGCOMGRAPHDEF_topcat :=  PFKCAT; 
   31: SEGCOMGRAPHDEF_topcat :=  SFKCAT; 
   32: SEGCOMGRAPHDEF_topcat :=  MATCHSTRING; 
   33: SEGCOMGRAPHDEF_topcat :=  FONCAT; 
   34: SEGCOMGRAPHDEF_topcat :=  CCCAT;
   35: SEGCOMGRAPHDEF_topcat :=  IDPAIR;
   36: SEGCOMGRAPHDEF_topcat :=  ALIASSPECPART;
   37: SEGCOMGRAPHDEF_topcat :=  ALIASSPEC;

   END
END {SEGCOMGRAPHDEF_topcat};

