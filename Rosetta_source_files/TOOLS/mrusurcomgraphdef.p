(*MPM:::===================================================================*
 *
 *  Rosetta Project                                                 
 *                                                                  
 *  Module Title    : surfgraphimp 
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

EXPORT(mrusurcomgraphdef);
pragma C_include('mrusurcomdecl.pf');
pragma C_include('mrusurcomgraph.pf');
pragma C_include('mrusurcomgraphdef.pf');

PROGRAM mrusurcomgraphdef;

WITH mrusurcomdecl,
     mrusurcomgraph;
 
 procedure SFG(i:integer);
begin
case i of
1: prod(1,utt,
    conc(atom(rulename,1),          
        conc(atom(Regexp,1),
             conc(atom(ident,1),
                  conc(atom(iscat,1),
                       conc(atom(graph,1),
                            conc(star(atom(helpgraph,2)),
                                 atom(CAs,1)
                                )
                           )
                      )
                 )
            )
        )
       );
2:prod(2,graph,
   conc(atom(concgraph,2),
        star(conc(atom(vertline,1),
                  atom(concgraph,2)
                 )
            )
       )
      );
3:prod(3,concgraph,
   conc(atom(elementarygraph,2),
        star(conc(atom(dot,1),
                  atom(elementarygraph,2)
                 )
            )
       )
      );
4:prod(4,elementarygraph,
   alt(conc(atom(roundopen,2),
            conc(atom(graph,1),
                 atom(roundclose,1)
                )
           ),
       alt(conc(atom(squareopen,3),
                conc(atom(graph,1),
                     atom(squareclose,1)
                    )
               ),
           alt(conc(atom(curlyopen,4),
                    conc(atom(graph,1),
                         atom(curlyclose,1)
                        )
                   ),
               alt(atom(ident,5),
                   conc(atom(ident,1),
                        conc(atom(slash,6),
                             atom(number,1)
                            )
                       )
                  )
              )
          )
      )
      ); 
5:prod(5,helpgraph,
   conc(atom(ident,2),
        conc(atom(iscat,1),
             atom(graph,1)
            )
       )
      );
6:prod(6,number,atom(charstring,1));
7:prod(7,CAs,atom(charstring,1));
8:prod(8,RegExp,atom(charstring,1));
9:prod(9,ident,atom(charstring,1));
end
end;

