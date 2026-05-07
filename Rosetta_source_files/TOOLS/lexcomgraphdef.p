(*MPM:::===================================================================*
 *
 *  Rosetta Project                                                 
 *                                                                  
 *  Module Title    : graph def
 *  Creation date   :                                               
 *  Author          :                                               
 *                                                                  
 *  Copyright (c) 1985, by Nederlandse Philips Bedrijven BV.        
 *                                                                  
 *  Remarks         :  
 *
 *EMP:::===================================================================*)

EXPORT(LEXCOMGRAPHDEF);
pragma C_include('lexcomgraphdef.pf');
pragma C_include('lexcomdecl.pf');
pragma C_include('lexcomgraph.pf');

(*=========================================================================*
 *  Imported modules
 *=========================================================================*)

PROGRAM lexcomgraphdef;

WITH LEXCOMGRAPH,
     LEXCOMDECL;

procedure LEXCOMgraphdef_SFG(i:INTEGER);
begin
case i of
1: prod(1,utt,
    conc(atom(rulename,1),          
        conc(atom(models,2),
             conc(opt(atom(comp,3)),
                  conc(opt(atom(capairs,4)),
                       conc(atom(decomp,5),
                            atom(capairs,6)
                           )
                      )
                 )
            )
        )
       );
2: prod(2,models,
    conc(atom(inputmodels,1),
         atom(outputmodel,2)  
        )
       );
3: prod(3,inputmodels,
   	star(conc(atom(mcijfer,1),
                  conc(atom(dotdot,3),
                       atom(model,2)
                      )
                 )
            )
       );
4: prod(4,outputmodel,
    conc(atom(mcijfer,1),
         conc(atom(dotdot,3),
              atom(model,2) 
             )
        )
       );
5: prod(5,model,
    conc(atom(nodedescription,1),
         opt(conc(atom(squareopen,2),
                  conc(opt(atom(reltreelist,3)),
   	               atom(squareclose,4)
                      )
                 )
            )
        )
       );
6: prod(6,nodedescription,
     alt(conc(atom(catname,1),
             conc(opt(conc(atom(roundopen,6),
                           conc(atom(charstring,7),
                                atom(roundclose,6)
                               )
                          )
                     ),
                  conc(atom(curlyopen,2),
                       conc(atom(catrecname,3),
                            atom(curlyclose,4)
                           )
                      )
                 )
            ),
         atom(tcijfer,5)
        )
       );
7: prod(7,reltreelist,
    alt(conc(conc(atom(relname,1),
                  conc(atom(slash,3),
                       atom(model,4))),
             star(conc(atom(comma,2),
                       conc(atom(relname,1),
                            conc(atom(slash,3),
                                 atom(model,4)))
                      )
                 )
            ),
   	atom(mucijfer,5)
       )
       );
8: prod(8,capairs,
        star(conc(atom(condition,1),
                  conc(opt(atom(capairs,2)),
                       atom(action,3)
                      )
                 )
            )
       );
9: prod(9,action,
        conc(atom(acijfer,1),
             conc(atom(dotdot,3),
                  conc(alt(atom(apestaart,4),
   	                   conc(atom(pascal,2),
                                star(conc(atom(dotcomma,3),
                                          atom(pascal,2)
                                         )
                                    )
   	                       )
                          ),
                       opt(conc(atom(dotdot,3),
                                atom(dotdot,3)
                               )
                          )
                      )
                 )
            )
       );
10: prod(10,condition,
     conc(atom(ccijfer,1),
          conc(atom(dotdot,3),
               conc(atom(pascal,2),
                    conc(alt(star(conc(atom(andcat,4),
                                       atom(pascal,2)
                                      )
                                 ),
                             conc(conc(atom(orcat,5),
                                       atom(pascal,2)
                                      ),
   				  star(conc(atom(orcat,5),
                                            atom(pascal,2)
                                           )
   				      )
                                 )
                             ),
                         opt(conc(atom(dotdot,3),
                                  atom(dotdot,3)
                                 )
                            )
                        )
                   )
              )
         )
        );
11: prod(11,catname,atom(charstring,1));
12: prod(12,catrecname,atom(charstring,1));
13: prod(13,relname,atom(charstring,1));
14: prod(14,pascal,
    alt(alt(atom(charstring,1),
   	    conc(atom(roundopen,3),
   		 conc(atom(pascal,2),
                      conc(alt(star(conc(atom(andcat,4),
                                         atom(pascal,2)
                                        )
                                   ),
                               conc(conc(atom(orcat,5),
                                         atom(pascal,2)
                                        ),
   				    star(conc(atom(orcat,5),
                                              atom(pascal,2)
                                             )
                                        )
                                   )
                              ),
                           atom(roundclose,3)
                          )
                     )
   		)
       	   ),
        alt(conc(atom(pascal,7),
                 conc(atom(assign,8),
                      atom(pascal,9)
                     )
                ),
            conc(atom(notcat,3),
                 conc(atom(roundopen,3),
                      conc(atom(pascal,6),
                           atom(roundclose,3)
                          )
                     )
   	        )
           )
       )
        );
15: prod(15,tcijfer,atom(charstring,1));
16: prod(16,mcijfer,atom(charstring,1));
17: prod(17,ccijfer,atom(charstring,1));
18: prod(18,acijfer,atom(charstring,1));
19: prod(19,apestaart,atom(charstring,1));
20: prod(20,comp,
         conc(atom(charstring,1),
              atom(dotdot,2)
             )
        );
21: prod(21,decomp,
         conc(atom(charstring,1),
              atom(dotdot,2)
             )
        );
22: prod(22,charstring,
         conc(opt(atom(roundopen,3)),
 	      conc(atom(charstring,1),
                   conc(opt(alt(atom(roundclose,4),
                                atom(roundopen,5)
                               )
                           ),
                        conc(atom(charstring,2),
                             opt(atom(roundclose,6))
                            )
                       )
                  )
             )
        );
23: prod(23,mucijfer,atom(charstring,1))
end
end;

