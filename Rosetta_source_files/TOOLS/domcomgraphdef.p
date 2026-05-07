(*MPM:::===================================================================*
 *
 *  Rosetta Project                                                 
 *                                                                  
 *  Module Title    : DOMCOMGRAPHDEF
 *  Creation date   :                                               
 *  Author          :                                               
 *                                                                  
 *  Copyright (c) 1985, by Nederlandse Philips Bedrijven BV.        
 *                                                                  
 *  Remarks         :  
 *
 *EMP:::===================================================================*)

Export(DOMCOMGRAPHDEF);
pragma C_include('domcomdecl.pf');
pragma C_include('domcomgraph.pf');
pragma C_include('domcomlangspec.pf');
pragma C_include('domcomgraphdef.pf');


(*=========================================================================*
 *  Imported modules
 *=========================================================================*)
PROGRAM DOMCOMGRAPHDEF;

WITH DOMCOMDECL,
     DOMCOMGRAPH,
     DOMCOMLANGSPEC;


PROCEDURE DOMCOMGRAPHDEF_SFG(i:integer);
BEGIN
   CASE i OF
   1: prod(1,utt,
       conc(alt(atom(dutchcat,8),
                alt(atom(englishcat,9),
                    atom(spanishcat,10)
                   )
               ),
           conc(opt(atom(domaintcat,1)),
                conc(opt(atom(affixspec,2)),
                     conc(opt(atom(derivspec,26)),
                          conc(opt(atom(contextspec,11)),
                               conc(opt(atom(phoneticspec,12)),
			            conc(opt(atom(typespec,3)),
				         conc(opt(atom(recordspec,4)),
					      conc(opt(atom(relationspec,5)),
					           conc(opt(atom(categoriespec,6)),
                                                        conc(opt(atom(catsetspec,1)),
                                                             conc(opt(atom(copyspec,7)),
						                  atom(endcat,1)
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
          );
   2: prod(2,affixspec,
           conc(atom(affixkeyscat,1),
                conc(atom(iscat,1),
                     conc(atom(roundopen,1),
                          conc(atom(identifier,2),
                               conc(star(conc(atom(comma,1),
                                              atom(identifier,2)
                                             )
                                        ),
                                    conc(atom(roundclose,1),
                                         atom(dotcomma,1)
                                        )
                                   )
                              )
                         )
                    )
               )
          );
   3: prod(3,typespec,
   	   conc(atom(typescat,1),
                conc(atom(dotdot,1),
                     conc(atom(leftarrow,1),
                          conc(star(atom(typedefinition,2)),
                               atom(rightarrow,1)
                              )
                         )
                    )
               )
   	  );        
   4: prod(4,recordspec,
        conc(atom(recordscat,1),
             conc(atom(dotdot,1),
   	          conc(atom(leftarrow,1),
                       conc(star(atom(recorddefinition,2)),
                            atom(rightarrow,1)
                           )
                      )
                 )
            )
   	  );        
   5: prod(5,relationspec,
           conc(atom(relationscat,1),
                conc(atom(dotdot,1),
                     conc(atom(roundopen,1),
                          conc(atom(identifier,2),
                               conc(star(conc(atom(comma,1),
                                              atom(identifier,2)
                                             )
                                        ),
                                    atom(roundclose,1)
                                   )
                              )
                         )
                    )
               )
          );
   6: prod(6,categoriespec,
           conc(atom(categoriescat,1),
                conc(atom(dotdot,1),
                     conc(atom(leftarrow,1),
                          conc(star(atom(catdefinition,2)),
                               atom(rightarrow,1)
                              )
                         )
                    )
               )
          );
   7: prod(7,typedefinition,
           alt(atom(enumdef,1),
               alt(atom(subrangedef,2),
                   alt(atom(integerdef,3),
                       alt(atom(booleandef,4),
                           atom(setdef,5)
                          )
                      )
                  )
              )
          );
   8: prod(8,enumdef,
           conc(atom(typename,2),
                conc(atom(iscat,1),
                     conc(atom(roundopen,1),
                          conc(atom(identifier,3),
                               conc(star(conc(atom(comma,1),
                                              atom(identifier,3)
                                             )
                                        ),
                                    conc(atom(roundclose,1),
                                         atom(dotcomma,1)
                                        )
                                   )
                              )
                         )
                    )
               )
          );

   9: prod(9,subrangedef,
           conc(atom(typename,2),
                conc(atom(iscat,1),
                     conc(atom(identifier,3),
                          conc(atom(dot,1),
                               conc(atom(dot,1),
                                    conc(atom(identifier,4),
                                         atom(dotcomma,1)
                                        )
                                   )
                              )
                         )
                    )
               )
          );
  10: prod(10,integerdef,
           conc(atom(typename,2),
                conc(atom(iscat,1),
                     conc(atom(integercat,1),
                          atom(dotcomma,1)
                         )
                    )
               )
          );
  11: prod(11,booleandef,
           conc(atom(typename,2),
                conc(atom(iscat,1),
                     conc(atom(booleancat,1),
                          atom(dotcomma,1)
                         )
                    )
               )
          );
  12: prod(12,setdef,
           conc(atom(typename,2),
                conc(atom(iscat,1),
                     conc(atom(setcat,1),
                          conc(atom(ofcat,1),
                               conc(atom(typename,3),
                                    atom(dotcomma,1)
                                   )
                              )
                         )
                    )
               )
          );
  13: prod(13,typename,atom(identifier,1));
  14: prod(14,recorddefinition,
           conc(atom(recordname,2),
                conc(atom(iscat,1),
   		     conc(atom(leftarrow,1),
                          conc(star(conc(atom(attribname,3),
                                         conc(atom(dotdot,1),
                                              conc(atom(typename,4),
   					           conc(atom(dotdot,1),
                                                        atom(defaultvalue,5)
                                                       )
                                                  )
                                             )
                                        )
                                   ),
                               conc(opt(conc(alt(atom(keycat,6),atom(indexcat,9)),
                                             opt(conc(atom(dotdot,1),
                                                      conc(atom(identifier,7),
                                                           conc(atom(minus,1),
                                                                atom(identifier,8)
                                                               )
                                                          )   
                                                     )
                                                )
                                            )
                                       ),
                                    atom(rightarrow,1)
                                   )
                              )
                         )
                    )
               )
          );
  15: prod(15,attribname,atom(identifier,1));
  16: prod(16,defaultvalue,
           alt(atom(identifier,1),
               conc(atom(squareopen,3),
                    conc(opt(conc(atom(identifier,1),
                                  star(conc(atom(comma,2),
                                            atom(identifier,1)
                                           )
                                      )
                                 )
                            ),
                         atom(squareclose,4)
                        )
                   )
              )
          );
  17: prod(17,recordname,atom(identifier,1));
  18: prod(18,catdefinition,
         conc(atom(leftarrow,1),
              conc(star(atom(catlist,1)),
                   atom(rightarrow,1)
                  )
             )
          );
  19: prod(19,catlist,
           conc(atom(catname,2),
                conc(star(conc(atom(comma,1),
                               atom(catname,2)
                              )
                         ),
                     conc(atom(dotdot,1),
                          atom(recordname,3)
                         )
                    )
               )
          );
  20: prod(20,catname,atom(identifier,1));
  21: prod(21,functionname,atom(identifier,1));
  22: prod(22,copyspec,
           conc(atom(copycat,1),
                conc(atom(dotdot,1),
                     star(conc(atom(functionname,2),
                               conc(atom(iscat,1), 
                                    conc(atom(fromcat,1),
                                         conc(atom(recordname,3),
                                              conc(atom(tocat,1),
                                                   atom(recordname,4)
                                                  )
                                             )
                                        )
                                   )
                              )
                         )
                    )
               )
          );
  23: prod(23,contextspec,
           conc(atom(contextcat,1),
                conc(atom(iscat,1),
                     conc(atom(roundopen,1),
                          conc(atom(identifier,2),
                               conc(star(conc(atom(comma,1),
                                              atom(identifier,2)
                                             )
                                        ),
                                    conc(atom(roundclose,1),
                                         atom(dotcomma,1)
                                        )
                                   )
                              )
                         )
                    )
               )
          );
  24: prod(24,phoneticspec,
           conc(atom(phoneticcat,1),
                conc(atom(iscat,1),
                     conc(atom(roundopen,1),
                          conc(atom(identifier,2),
                               conc(star(conc(atom(comma,1),
                                              atom(identifier,2)
                                             )
                                        ),
                                    conc(atom(roundclose,1),
                                         atom(dotcomma,1)
                                        )
                                   )
                              )
                         )
                    )
               )
          );
  25: prod(25,catsetspec,
    conc(atom(catsetscat,1),
         conc(atom(dotdot,1),
              conc(atom(leftarrow,1),
                   conc(star(conc(atom(identifier,2),
                                  conc(atom(iscat,1),
                                       conc(atom(squareopen,1),
                                            conc(opt(conc(atom(identifier,3),
                                                          star(conc(atom(comma,1),
                                                                    atom(identifier,3)
                                                                   )
                                                              )
                                                         )
                                                    ),
                                                 atom(squareclose,4)
                                                )
                                           )
                                      )
                                 )
                            ),
                        atom(rightarrow,1)
                       )
                  )
             )
        ) 
          );
   26: prod(26,derivspec,
           conc(atom(derivkeyscat,1),
                conc(atom(iscat,1),
                     conc(atom(roundopen,1),
                          conc(atom(identifier,2),
                               conc(conc(atom(iscat,1),
                                         atom(identifier,3)
                                        ),
                                    conc(star(conc(atom(comma,1),
                                                   conc(atom(identifier,2),
                                                        opt(conc(atom(iscat,1),
                                                                 atom(identifier,3)
                                                                )
                                                           )
                                                       )
                                                  )
                                             ),
                                         conc(atom(roundclose,1),
                                              atom(dotcomma,1)
                                             )     
                                        )
                                   )
                              )
                         )
                    )
               )
          );
  END
END {SFG};


FUNCTION DOMCOMGRAPHDEF_topcat(i: integer): DOMCOMLANGSPEC_Category;

BEGIN
   CASE i OF
   1 : DOMCOMGRAPHDEF_topcat :=  utt; 
   2 : DOMCOMGRAPHDEF_topcat :=  affixspec; 
   3 : DOMCOMGRAPHDEF_topcat :=  typespec; 
   4 : DOMCOMGRAPHDEF_topcat :=  recordspec; 
   5 : DOMCOMGRAPHDEF_topcat :=  relationspec; 
   6 : DOMCOMGRAPHDEF_topcat :=  categoriespec; 
   7 : DOMCOMGRAPHDEF_topcat :=  typedefinition; 
   8 : DOMCOMGRAPHDEF_topcat :=  enumdef; 
   9 : DOMCOMGRAPHDEF_topcat :=  subrangedef; 
   10: DOMCOMGRAPHDEF_topcat :=  integerdef; 
   11: DOMCOMGRAPHDEF_topcat :=  booleandef; 
   12: DOMCOMGRAPHDEF_topcat :=  setdef; 
   13: DOMCOMGRAPHDEF_topcat :=  typename; 
   14: DOMCOMGRAPHDEF_topcat :=  recorddefinition; 
   15: DOMCOMGRAPHDEF_topcat :=  attribname; 
   16: DOMCOMGRAPHDEF_topcat :=  defaultvalue; 
   17: DOMCOMGRAPHDEF_topcat :=  recordname; 
   18: DOMCOMGRAPHDEF_topcat :=  catdefinition; 
   19: DOMCOMGRAPHDEF_topcat :=  catlist;
   20: DOMCOMGRAPHDEF_topcat :=  catname;
   21: DOMCOMGRAPHDEF_topcat :=  functionname;
   22: DOMCOMGRAPHDEF_topcat :=  copyspec;
   23: DOMCOMGRAPHDEF_topcat :=  contextspec; 
   24: DOMCOMGRAPHDEF_topcat :=  phoneticspec; 
   25: DOMCOMGRAPHDEF_topcat :=  catsetspec;
   26: DOMCOMGRAPHDEF_topcat :=  derivspec;
   END
END {DOMCOMGRAPHDEF_topcat};

