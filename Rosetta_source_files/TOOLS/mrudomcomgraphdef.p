(*MPM:::===================================================================*
 *
 *  Rosetta Project                                                 
 *                                                                  
 *  Module Title    : MRUDOMCOMGRAPHDEF
 *  Creation date   :                                               
 *  Author          :                                               
 *                                                                  
 *  Copyright (c) 1985, by Nederlandse Philips Bedrijven BV.        
 *                                                                  
 *  Remarks         :  
 *
 *EMP:::===================================================================*)

(*=========================================================================*
 *  Imported modules
 *=========================================================================*)
EXPORT(mrudomcomgraphdef);
pragma c_include('mrudomcomdecl.pf');
pragma c_include('mrudomcomgraph.pf');
pragma c_include('mrudomcomlangspec.pf');
pragma c_include('mrudomcomgraphdef.pf');

PROGRAM MRUDOMCOMGRAPHDEF;

WITH mrudomcomdecl,
     mrudomcomgraph,
     mrudomcomlangspec;

 PROCEDURE MRUDOMCOMGRAPHDEF_SFG(i:integer);
BEGIN
   CASE i OF
   1: prod(1,utt,
      conc(atom(identifier,2),
           conc(opt(atom(domaincat,1)),
                conc(opt(atom(alphabetspec,1)),
                     conc(opt(atom(symbolspec,1)),
                          conc(opt(atom(wordspec,1)),
                               conc(opt(atom(typespec,1)),
	                            conc(opt(atom(setspec,1)),
                                         conc(opt(atom(recordspec,1)),
                                              conc(opt(atom(categoriespec,1)),
                                                   conc(opt(atom(outputfiles,1)),
                                                        conc(opt(atom(tablespec,1)), 
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
          );
   2: prod(2,typespec,
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
   3: prod(3,recordspec,
             conc(atom(attributescat,1),
                  conc(atom(dotdot,1),
                       conc(atom(leftarrow,1),
                            conc(star(atom(recorddefinition,2)),
                                 atom(rightarrow,1)
                                )
                           )
                      )
                 )
   	  );
   4: prod(4,categoriespec,
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
   5: prod(5,typedefinition,
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
   6: prod(6,enumdef,
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

   7: prod(7,subrangedef,
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
   8: prod(8,integerdef,
           conc(atom(typename,2),
                conc(atom(iscat,1),
                     conc(atom(integercat,1),
                          atom(dotcomma,1)
                         )
                    )
               )
          );
   9: prod(9,booleandef,
           conc(atom(typename,2),
                conc(atom(iscat,1),
                     conc(atom(booleancat,1),
                          atom(dotcomma,1)
                         )
                    )
               )
          );
  10: prod(10,setdef,
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
  11: prod(11,typename,atom(identifier,1));
  12: prod(12,recorddefinition,
      conc(atom(recordname,2),
           conc(atom(iscat,1),
                conc(atom(leftarrow,1),
                     conc(conc(conc(atom(surfacecat,1),
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
                                             atom(rightarrow,1)
                                            )
                                       )
                                  ),
                              conc(conc(atom(proccat,1),
                                       conc(atom(inhcat,1),
                                            conc(atom(leftarrow,1),
                                                 conc(star(conc(atom(attribname,3),
                                                                conc(atom(dotdot,1),
                                                                     atom(typename,6)
                                                                    )
                                                               )
                                                          ),
                                                      atom(rightarrow,1)
                                                     )
                                                )
                                           )
                                      ),
                                  conc(atom(proccat,1),
                                       conc(atom(syncat,1),
                                            conc(atom(leftarrow,1),
                                                 conc(star(conc(atom(attribname,3),
                                                                conc(atom(dotdot,1),
                                                                     atom(typename,7)
                                                                    )
                                                               )
                                                          ),
                                                      atom(rightarrow,1)
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
          );
  13: prod(13,attribname,atom(identifier,1));
  14: prod(14,defaultvalue,
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
  15: prod(15,recordname,atom(identifier,1));
  16: prod(16,catdefinition,
         conc(atom(leftarrow,1),
              conc(star(atom(catlist,1)),
                   atom(rightarrow,1)
                  )
             )
          );
  17: prod(17,catlist,
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
  18: prod(18,catname,atom(identifier,1));
  19: prod(19,alphabetspec,
           conc(atom(alphabetcat,1),
                conc(atom(dotdot,1),
                     conc(atom(leftarrow,1),
                          conc(star(atom(character,2)
                                   ),
                               atom(rightarrow,1)
                              )
                         )
                    )
               )
          );
  20: prod(20,symbolspec,
           conc(atom(symbolscat,1),
                conc(atom(dotdot,1),
                     conc(atom(leftarrow,1),
                          conc(star(atom(symboldefinition,1)
                                   ),
                               atom(rightarrow,1)
                              )
                         )
                    )
               )
          );
  21: prod(21,wordspec,
           conc(atom(wordscat,1),
                conc(atom(dotdot,1),
                     conc(atom(leftarrow,1),
                          conc(star(atom(worddefinition,1)
                                   ),
                               atom(rightarrow,1)
                              )
                         )
                    )
               )
          );
  22: prod(22,symboldefinition,
           conc(atom(catname,2),
                conc(atom(iscat,1),
                     atom(character,3)
                    )
               )
          );
  23: prod(23,worddefinition,
           conc(atom(catname,2),
                conc(atom(iscat,1),
                     atom(identifier,3)
                    )
               )
          );
  24: prod(24,character,atom(identifier,1));
  25: prod(25,outputfiles,
           conc(atom(outputfilescat,1),
                conc(atom(dotdot,1),
                     conc(atom(leftarrow,1),
                          conc(star(atom(identifier,2)
                                   ),
                               atom(rightarrow,1)
                              )
                         )
                    )
               )
          );
   26: prod(26,setspec,
           conc(atom(setscat,1),
                conc(atom(dotdot,1),
                     conc(atom(leftarrow,1),
                          conc(star(atom(setelement,2)),
                               atom(rightarrow,1)
                              )
                         )
                    )
               )
          );
   27:prod(27,setelement,
          conc(atom(identifier,2),
               conc(atom(iscat,1),
                    conc(atom(leftarrow,1),
                         conc(star(conc(atom(attribname,3),
                                        conc(atom(dotdot,1),
                                             atom(typename,4)
                                            )
                                       )
                                  ),
                              atom(rightarrow,1)
                             )
                        )
                   )
              )
          );
   28:prod(28,tablespec,
           conc(atom(tablescat,1),
                conc(atom(dotdot,1),
                     conc(atom(leftarrow,1),
                          conc(star(conc(atom(identifier,2),
                                         conc(atom(dotdot,1),
                                              atom(typename,3)
                                             )
                                        )
                                   ),
                               atom(rightarrow,1)
                              )
                         )
                    )
               )

          );
  END
END {SFG};


 FUNCTION MRUDOMCOMGRAPHDEF_topcat(i: integer): MRUDOMCOMLANGSPEC_Category;

BEGIN
   CASE i OF
   1 : MRUDOMCOMGRAPHDEF_topcat :=  utt; 
   2 : MRUDOMCOMGRAPHDEF_topcat :=  typespec; 
   3 : MRUDOMCOMGRAPHDEF_topcat :=  recordspec; 
   4 : MRUDOMCOMGRAPHDEF_topcat :=  categoriespec; 
   5 : MRUDOMCOMGRAPHDEF_topcat :=  typedefinition; 
   6 : MRUDOMCOMGRAPHDEF_topcat :=  enumdef; 
   7 : MRUDOMCOMGRAPHDEF_topcat :=  subrangedef; 
   8 : MRUDOMCOMGRAPHDEF_topcat :=  integerdef; 
   9 : MRUDOMCOMGRAPHDEF_topcat :=  booleandef; 
   10: MRUDOMCOMGRAPHDEF_topcat :=  setdef; 
   11: MRUDOMCOMGRAPHDEF_topcat :=  typename; 
   12: MRUDOMCOMGRAPHDEF_topcat :=  recorddefinition; 
   13: MRUDOMCOMGRAPHDEF_topcat :=  attribname; 
   14: MRUDOMCOMGRAPHDEF_topcat :=  defaultvalue; 
   15: MRUDOMCOMGRAPHDEF_topcat :=  recordname; 
   16: MRUDOMCOMGRAPHDEF_topcat :=  catdefinition; 
   17: MRUDOMCOMGRAPHDEF_topcat :=  catlist;
   18: MRUDOMCOMGRAPHDEF_topcat :=  catname;
   19: MRUDOMCOMGRAPHDEF_topcat :=  alphabetspec;
   20: MRUDOMCOMGRAPHDEF_topcat :=  symbolspec;
   21: MRUDOMCOMGRAPHDEF_topcat :=  wordspec;
   22: MRUDOMCOMGRAPHDEF_topcat :=  symboldefinition;
   23: MRUDOMCOMGRAPHDEF_topcat :=  worddefinition;
   24: MRUDOMCOMGRAPHDEF_topcat :=  character;
   25: MRUDOMCOMGRAPHDEF_topcat :=  outputfiles;
   26: MRUDOMCOMGRAPHDEF_topcat :=  setspec;
   27: MRUDOMCOMGRAPHDEF_topcat :=  setelement;
   28: MRUDOMCOMGRAPHDEF_topcat :=  tablespec;
   END
END {MRUDOMCOMGRAPHDEF_topcat};

