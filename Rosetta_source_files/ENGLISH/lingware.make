 
  
/home/rosetta/archive/rosetta3/english/ldsucc.p : /home/rosetta/archive/rosetta3/english/morphexpr.afxpr \
                         /home/rosetta/archive/rosetta3/tools/afxpr.exe;
	@/home/rosetta/archive/rosetta3/actions/afxpr $(language) morphexpr
  
/home/rosetta/archive/rosetta3/english/lsauxdom.pf : /home/rosetta/archive/rosetta3/english/auxdomout ;
 
/home/rosetta/archive/rosetta3/english/lsauxdom.p : /home/rosetta/archive/rosetta3/english/auxdomout ;
 
/home/rosetta/archive/rosetta3/english/ldsubsttovar.p : /home/rosetta/archive/rosetta3/english/auxdomout ;
 
/home/rosetta/archive/rosetta3/english/auxdomout : /home/rosetta/archive/rosetta3/english/lsauxdomain.auxdom  \
                               /home/rosetta/archive/rosetta3/english/auxcom.exe;
	touch $(language)/target/auxdomout
	@/home/rosetta/archive/rosetta3/actions/auxdom $(language) lsauxdomain
  
/home/rosetta/archive/rosetta3/english/lstypetostr.p : /home/rosetta/archive/rosetta3/english/domout ;
 
/home/rosetta/archive/rosetta3/english/lstypetostr.pf : /home/rosetta/archive/rosetta3/english/domout ;
 
/home/rosetta/archive/rosetta3/english/lsstrtotype.p : /home/rosetta/archive/rosetta3/english/domout ;
 
/home/rosetta/archive/rosetta3/english/lsstrtotype.pf : /home/rosetta/archive/rosetta3/english/domout ;
 
/home/rosetta/archive/rosetta3/english/lsconvrec.p : /home/rosetta/archive/rosetta3/english/domout ;
 
/home/rosetta/archive/rosetta3/english/lsconvrec.pf : /home/rosetta/archive/rosetta3/english/domout ;
 
/home/rosetta/archive/rosetta3/english/lsconvattr.p : /home/rosetta/archive/rosetta3/english/domout ;
 
/home/rosetta/archive/rosetta3/english/lsconvattr.pf : /home/rosetta/archive/rosetta3/english/domout ;
 
/home/rosetta/archive/rosetta3/english/ldconvrec.p : /home/rosetta/archive/rosetta3/english/domout ;
 
/home/rosetta/archive/rosetta3/english/lsdomaint.pf : /home/rosetta/archive/rosetta3/english/domout ;
 
/home/rosetta/archive/rosetta3/english/maket.pf : /home/rosetta/archive/rosetta3/english/domout ;
 
/home/rosetta/archive/rosetta3/english/maket.p : /home/rosetta/archive/rosetta3/english/domout ;
 
/home/rosetta/archive/rosetta3/english/copyt.pf : /home/rosetta/archive/rosetta3/english/domout ;
 
/home/rosetta/archive/rosetta3/english/copyt.p : /home/rosetta/archive/rosetta3/english/domout ;
 
/home/rosetta/archive/rosetta3/english/ldstrtotype.p : /home/rosetta/archive/rosetta3/english/domout ;
 
/home/rosetta/archive/rosetta3/english/ldtypetostr.p : /home/rosetta/archive/rosetta3/english/domout ;
 
/home/rosetta/archive/rosetta3/english/ldstrtostr.p : /home/rosetta/archive/rosetta3/english/domout ;
 
/home/rosetta/archive/rosetta3/english/ldcatsets.p : /home/rosetta/archive/rosetta3/english/domout ;
 
/home/rosetta/archive/rosetta3/english/ldequal.p : /home/rosetta/archive/rosetta3/english/domout ;
 
/home/rosetta/archive/rosetta3/english/ldgetkey.p : /home/rosetta/archive/rosetta3/english/domout ;
 
/home/rosetta/archive/rosetta3/english/lsmorfdef.pf : /home/rosetta/archive/rosetta3/english/domout ;
 
/home/rosetta/archive/rosetta3/english/domout : /home/rosetta/archive/rosetta3/english/lsdomaint.dom \
                           /home/rosetta/archive/rosetta3/tools/domcom.exe;
	touch $(language)/target/domout
	@/home/rosetta/archive/rosetta3/actions/dom $(language) lsdomaint
 
/home/rosetta/archive/rosetta3/interlingua/liilrules.pf : /home/rosetta/archive/rosetta3/interlingua/ilaout ;
 
/home/rosetta/archive/rosetta3/interlingua/liilrules.p : /home/rosetta/archive/rosetta3/interlingua/ilaout ;
 
/home/rosetta/archive/rosetta3/interlingua/ilaout : /home/rosetta/archive/rosetta3/interlingua/ildefinition.ilan  \
                            /home/rosetta/archive/rosetta3/tools/ilacom.exe;
	touch interlingua/target/ilaout
	@/home/rosetta/archive/rosetta3/actions/ila interlingua ildefinition
  
  
#!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!lexicons  
  
  
/home/rosetta/archive/rosetta3/english/blex.dat : /home/rosetta/archive/rosetta3/english/blex.dict \
                       /home/rosetta/archive/rosetta3/english/genblexisf.exe;
	@/home/rosetta/archive/rosetta3/actions/genblexdata $(language)
  
/home/rosetta/archive/rosetta3/english/iddict.dat : /home/rosetta/archive/rosetta3/english/iddict.dict \
                         /home/rosetta/archive/rosetta3/english/geniddictdata.exe;
	@/home/rosetta/archive/rosetta3/actions/geniddictdata $(language)
  
/home/rosetta/archive/rosetta3/english/ildict.dat : /home/rosetta/archive/rosetta3/english/ildict.dict \
                         /home/rosetta/archive/rosetta3/tools/genildictdata.exe;
	@/home/rosetta/archive/rosetta3/actions/genildictdata $(language)
  
/home/rosetta/archive/rosetta3/english/mdict.dat : /home/rosetta/archive/rosetta3/english/mdict.dict \
                         /home/rosetta/archive/rosetta3/english/genmdictdata.exe;
	@/home/rosetta/archive/rosetta3/actions/genmdictdata $(language)
  
/home/rosetta/archive/rosetta3/english/sdict.dat : /home/rosetta/archive/rosetta3/english/sdict.dict \
                         /home/rosetta/archive/rosetta3/tools/gensdictdata.exe;
	@/home/rosetta/archive/rosetta3/actions/gensdictdata $(language)
  
/home/rosetta/archive/rosetta3/english/siddict.dat : /home/rosetta/archive/rosetta3/english/siddict.dict \
                         /home/rosetta/archive/rosetta3/tools/gensiddictdata.exe;
	@/home/rosetta/archive/rosetta3/actions/gensiddictdata $(language)
  
/home/rosetta/archive/rosetta3/english/fixid.dat : /home/rosetta/archive/rosetta3/english/fixid.fixid \
                        /home/rosetta/archive/rosetta3/tools/fixidgen.exe;
	@/home/rosetta/archive/rosetta3/actions/genfixiddata $(language)
  
  
  
#!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!keydefinitions  
  
/home/rosetta/archive/rosetta3/interlingua/bmkeydef.dat : /home/rosetta/archive/rosetta3/interlingua/bmkeydef.kdf \
                           /home/rosetta/archive/rosetta3/tools/strmkey.exe;
	@/home/rosetta/archive/rosetta3/actions/mkdf interlingua bmkeydef
  
  
/home/rosetta/archive/rosetta3/english/bskeydef.dat : english/target/bskeydef.kdf \
                           /home/rosetta/archive/rosetta3/tools/strkey.exe;
	@/home/rosetta/archive/rosetta3/actions/kdf $(language) bskeydef
  
  
#!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! 
  
/home/rosetta/archive/rosetta3/english/comlexrules1.p : /home/rosetta/archive/rosetta3/english/lex1out ;
 
/home/rosetta/archive/rosetta3/english/comlexrules1.pf : /home/rosetta/archive/rosetta3/english/lex1out ;
 
/home/rosetta/archive/rosetta3/english/decomlexrules1.p : /home/rosetta/archive/rosetta3/english/lex1out ;
 
/home/rosetta/archive/rosetta3/english/decomlexrules1.pf : /home/rosetta/archive/rosetta3/english/lex1out ;
  
/home/rosetta/archive/rosetta3/english/lex1out : /home/rosetta/archive/rosetta3/english/lexrules1.lex  \
                                 /home/rosetta/archive/rosetta3/english/lexcom.exe;
	touch $(language)/target/lex1out
	@/home/rosetta/archive/rosetta3/actions/lex $(language) lexrules1
  
 
/home/rosetta/archive/rosetta3/english/comlexrules2.p : /home/rosetta/archive/rosetta3/english/lex2out ;
 
/home/rosetta/archive/rosetta3/english/comlexrules2.pf : /home/rosetta/archive/rosetta3/english/lex2out ;
 
/home/rosetta/archive/rosetta3/english/decomlexrules2.p : /home/rosetta/archive/rosetta3/english/lex2out ;
 
/home/rosetta/archive/rosetta3/english/decomlexrules2.pf : /home/rosetta/archive/rosetta3/english/lex2out ;
  
/home/rosetta/archive/rosetta3/english/lex2out : /home/rosetta/archive/rosetta3/english/lexrules2.lex  \
                                 /home/rosetta/archive/rosetta3/english/lexcom.exe;
	touch $(language)/target/lex2out
	@/home/rosetta/archive/rosetta3/actions/lex $(language) lexrules2
 
/home/rosetta/archive/rosetta3/english/comlexrules3.p : /home/rosetta/archive/rosetta3/english/lex3out ;
 
/home/rosetta/archive/rosetta3/english/comlexrules3.pf : /home/rosetta/archive/rosetta3/english/lex3out ;
 
/home/rosetta/archive/rosetta3/english/decomlexrules3.p : /home/rosetta/archive/rosetta3/english/lex3out ;
 
/home/rosetta/archive/rosetta3/english/decomlexrules3.pf : /home/rosetta/archive/rosetta3/english/lex3out ;
  
/home/rosetta/archive/rosetta3/english/lex3out : /home/rosetta/archive/rosetta3/english/lexrules3.lex  \
                                 /home/rosetta/archive/rosetta3/english/lexcom.exe;
	touch $(language)/target/lex3out
	@/home/rosetta/archive/rosetta3/actions/lex $(language) lexrules3
  
  
/home/rosetta/archive/rosetta3/english/anlexif.p : /home/rosetta/archive/rosetta3/english/llkout ;
 
/home/rosetta/archive/rosetta3/english/genlexif.p : /home/rosetta/archive/rosetta3/english/llkout ;
 
/home/rosetta/archive/rosetta3/english/llkout : /home/rosetta/archive/rosetta3/english/comlexrules1.pf  \
                            /home/rosetta/archive/rosetta3/english/comlexrules2.pf  \
                            /home/rosetta/archive/rosetta3/english/comlexrules3.pf  \
                            /home/rosetta/archive/rosetta3/english/lexlink.exe;
	touch $(language)/target/llkout
	@/home/rosetta/archive/rosetta3/actions/llk $(language)
  
/home/rosetta/archive/rosetta3/english/lsparams.pf : /home/rosetta/archive/rosetta3/english/mlkout ;
 
/home/rosetta/archive/rosetta3/english/ldmrules.p : /home/rosetta/archive/rosetta3/english/mlkout ;
 
/home/rosetta/archive/rosetta3/english/ldsubgrammars.p : /home/rosetta/archive/rosetta3/english/mlkout ;
 
/home/rosetta/archive/rosetta3/english/helpsubgrammars.pf : /home/rosetta/archive/rosetta3/english/mlkout ;
 
/home/rosetta/archive/rosetta3/english/helpsubgrammars.p : /home/rosetta/archive/rosetta3/english/mlkout ;
 
/home/rosetta/archive/rosetta3/english/ldanmrules.p : /home/rosetta/archive/rosetta3/english/mlkout ;
 
/home/rosetta/archive/rosetta3/english/ldgenmrules.p : /home/rosetta/archive/rosetta3/english/mlkout ;
 
 
/home/rosetta/archive/rosetta3/english/mlkout : /home/rosetta/archive/rosetta3/english/commrules1.pf \
           /home/rosetta/archive/rosetta3/english/commrules10.pf \
           /home/rosetta/archive/rosetta3/english/commrules100.pf \
           /home/rosetta/archive/rosetta3/english/commrules101.pf \
           /home/rosetta/archive/rosetta3/english/commrules102.pf \
           /home/rosetta/archive/rosetta3/english/commrules103.pf \
           /home/rosetta/archive/rosetta3/english/commrules104.pf \
           /home/rosetta/archive/rosetta3/english/commrules105.pf \
           /home/rosetta/archive/rosetta3/english/commrules106.pf \
           /home/rosetta/archive/rosetta3/english/commrules107.pf \
           /home/rosetta/archive/rosetta3/english/commrules108.pf \
           /home/rosetta/archive/rosetta3/english/commrules109.pf \
           /home/rosetta/archive/rosetta3/english/commrules11.pf \
           /home/rosetta/archive/rosetta3/english/commrules110.pf \
           /home/rosetta/archive/rosetta3/english/commrules111.pf \
           /home/rosetta/archive/rosetta3/english/commrules112.pf \
           /home/rosetta/archive/rosetta3/english/commrules113.pf \
           /home/rosetta/archive/rosetta3/english/commrules114.pf \
           /home/rosetta/archive/rosetta3/english/commrules115.pf \
           /home/rosetta/archive/rosetta3/english/commrules116.pf \
           /home/rosetta/archive/rosetta3/english/commrules117.pf \
           /home/rosetta/archive/rosetta3/english/commrules118.pf \
           /home/rosetta/archive/rosetta3/english/commrules119.pf \
           /home/rosetta/archive/rosetta3/english/commrules12.pf \
           /home/rosetta/archive/rosetta3/english/commrules120.pf \
           /home/rosetta/archive/rosetta3/english/commrules121.pf \
           /home/rosetta/archive/rosetta3/english/commrules122.pf \
           /home/rosetta/archive/rosetta3/english/commrules123.pf \
           /home/rosetta/archive/rosetta3/english/commrules124.pf \
           /home/rosetta/archive/rosetta3/english/commrules125.pf \
           /home/rosetta/archive/rosetta3/english/commrules126.pf \
           /home/rosetta/archive/rosetta3/english/commrules127.pf \
           /home/rosetta/archive/rosetta3/english/commrules128.pf \
           /home/rosetta/archive/rosetta3/english/commrules129.pf \
           /home/rosetta/archive/rosetta3/english/commrules13.pf \
           /home/rosetta/archive/rosetta3/english/commrules130.pf \
           /home/rosetta/archive/rosetta3/english/commrules131.pf \
           /home/rosetta/archive/rosetta3/english/commrules132.pf \
           /home/rosetta/archive/rosetta3/english/commrules133.pf \
           /home/rosetta/archive/rosetta3/english/commrules134.pf \
           /home/rosetta/archive/rosetta3/english/commrules135.pf \
           /home/rosetta/archive/rosetta3/english/commrules136.pf \
           /home/rosetta/archive/rosetta3/english/commrules137.pf \
           /home/rosetta/archive/rosetta3/english/commrules138.pf \
           /home/rosetta/archive/rosetta3/english/commrules139.pf \
           /home/rosetta/archive/rosetta3/english/commrules14.pf \
           /home/rosetta/archive/rosetta3/english/commrules140.pf \
           /home/rosetta/archive/rosetta3/english/commrules15.pf \
           /home/rosetta/archive/rosetta3/english/commrules16.pf \
           /home/rosetta/archive/rosetta3/english/commrules17.pf \
           /home/rosetta/archive/rosetta3/english/commrules18.pf \
           /home/rosetta/archive/rosetta3/english/commrules19.pf \
           /home/rosetta/archive/rosetta3/english/commrules2.pf \
           /home/rosetta/archive/rosetta3/english/commrules20.pf \
           /home/rosetta/archive/rosetta3/english/commrules21.pf \
           /home/rosetta/archive/rosetta3/english/commrules22.pf \
           /home/rosetta/archive/rosetta3/english/commrules23.pf \
           /home/rosetta/archive/rosetta3/english/commrules24.pf \
           /home/rosetta/archive/rosetta3/english/commrules25.pf \
           /home/rosetta/archive/rosetta3/english/commrules26.pf \
           /home/rosetta/archive/rosetta3/english/commrules27.pf \
           /home/rosetta/archive/rosetta3/english/commrules28.pf \
           /home/rosetta/archive/rosetta3/english/commrules29.pf \
           /home/rosetta/archive/rosetta3/english/commrules3.pf \
           /home/rosetta/archive/rosetta3/english/commrules30.pf \
           /home/rosetta/archive/rosetta3/english/commrules31.pf \
           /home/rosetta/archive/rosetta3/english/commrules32.pf \
           /home/rosetta/archive/rosetta3/english/commrules33.pf \
           /home/rosetta/archive/rosetta3/english/commrules34.pf \
           /home/rosetta/archive/rosetta3/english/commrules35.pf \
           /home/rosetta/archive/rosetta3/english/commrules36.pf \
           /home/rosetta/archive/rosetta3/english/commrules37.pf \
           /home/rosetta/archive/rosetta3/english/commrules38.pf \
           /home/rosetta/archive/rosetta3/english/commrules39.pf \
           /home/rosetta/archive/rosetta3/english/commrules4.pf \
           /home/rosetta/archive/rosetta3/english/commrules40.pf \
           /home/rosetta/archive/rosetta3/english/commrules41.pf \
           /home/rosetta/archive/rosetta3/english/commrules42.pf \
           /home/rosetta/archive/rosetta3/english/commrules43.pf \
           /home/rosetta/archive/rosetta3/english/commrules44.pf \
           /home/rosetta/archive/rosetta3/english/commrules45.pf \
           /home/rosetta/archive/rosetta3/english/commrules46.pf \
           /home/rosetta/archive/rosetta3/english/commrules47.pf \
           /home/rosetta/archive/rosetta3/english/commrules48.pf \
           /home/rosetta/archive/rosetta3/english/commrules49.pf \
           /home/rosetta/archive/rosetta3/english/commrules5.pf \
           /home/rosetta/archive/rosetta3/english/commrules50.pf \
           /home/rosetta/archive/rosetta3/english/commrules51.pf \
           /home/rosetta/archive/rosetta3/english/commrules52.pf \
           /home/rosetta/archive/rosetta3/english/commrules53.pf \
           /home/rosetta/archive/rosetta3/english/commrules54.pf \
           /home/rosetta/archive/rosetta3/english/commrules55.pf \
           /home/rosetta/archive/rosetta3/english/commrules56.pf \
           /home/rosetta/archive/rosetta3/english/commrules57.pf \
           /home/rosetta/archive/rosetta3/english/commrules58.pf \
           /home/rosetta/archive/rosetta3/english/commrules59.pf \
           /home/rosetta/archive/rosetta3/english/commrules6.pf \
           /home/rosetta/archive/rosetta3/english/commrules60.pf \
           /home/rosetta/archive/rosetta3/english/commrules61.pf \
           /home/rosetta/archive/rosetta3/english/commrules62.pf \
           /home/rosetta/archive/rosetta3/english/commrules63.pf \
           /home/rosetta/archive/rosetta3/english/commrules64.pf \
           /home/rosetta/archive/rosetta3/english/commrules65.pf \
           /home/rosetta/archive/rosetta3/english/commrules66.pf \
           /home/rosetta/archive/rosetta3/english/commrules67.pf \
           /home/rosetta/archive/rosetta3/english/commrules68.pf \
           /home/rosetta/archive/rosetta3/english/commrules69.pf \
           /home/rosetta/archive/rosetta3/english/commrules7.pf \
           /home/rosetta/archive/rosetta3/english/commrules70.pf \
           /home/rosetta/archive/rosetta3/english/commrules71.pf \
           /home/rosetta/archive/rosetta3/english/commrules72.pf \
           /home/rosetta/archive/rosetta3/english/commrules73.pf \
           /home/rosetta/archive/rosetta3/english/commrules74.pf \
           /home/rosetta/archive/rosetta3/english/commrules75.pf \
           /home/rosetta/archive/rosetta3/english/commrules76.pf \
           /home/rosetta/archive/rosetta3/english/commrules77.pf \
           /home/rosetta/archive/rosetta3/english/commrules78.pf \
           /home/rosetta/archive/rosetta3/english/commrules79.pf \
           /home/rosetta/archive/rosetta3/english/commrules8.pf \
           /home/rosetta/archive/rosetta3/english/commrules80.pf \
           /home/rosetta/archive/rosetta3/english/commrules81.pf \
           /home/rosetta/archive/rosetta3/english/commrules82.pf \
           /home/rosetta/archive/rosetta3/english/commrules83.pf \
           /home/rosetta/archive/rosetta3/english/commrules84.pf \
           /home/rosetta/archive/rosetta3/english/commrules85.pf \
           /home/rosetta/archive/rosetta3/english/commrules86.pf \
           /home/rosetta/archive/rosetta3/english/commrules87.pf \
           /home/rosetta/archive/rosetta3/english/commrules88.pf \
           /home/rosetta/archive/rosetta3/english/commrules89.pf \
           /home/rosetta/archive/rosetta3/english/commrules9.pf \
           /home/rosetta/archive/rosetta3/english/commrules90.pf \
           /home/rosetta/archive/rosetta3/english/commrules91.pf \
           /home/rosetta/archive/rosetta3/english/commrules92.pf \
           /home/rosetta/archive/rosetta3/english/commrules93.pf \
           /home/rosetta/archive/rosetta3/english/commrules94.pf \
           /home/rosetta/archive/rosetta3/english/commrules95.pf \
           /home/rosetta/archive/rosetta3/english/commrules96.pf \
           /home/rosetta/archive/rosetta3/english/commrules97.pf \
           /home/rosetta/archive/rosetta3/english/commrules98.pf \
           /home/rosetta/archive/rosetta3/english/commrules99.pf \
                            /home/rosetta/archive/rosetta3/english/mrulelink.exe;
	touch $(language)/target/mlkout
	@/home/rosetta/archive/rosetta3/actions/mlk $(language)
	@/home/rosetta/archive/rosetta3/actions/pas $(language) ldmrules
	@/home/rosetta/archive/rosetta3/actions/gen $(language) mrucom
	@/home/rosetta/archive/rosetta3/actions/idioms $(language) mrules107
	@/home/rosetta/archive/rosetta3/actions/idioms $(language) mrules117
  
/home/rosetta/archive/rosetta3/english/commrules1.o  \
/home/rosetta/archive/rosetta3/english/decommrules1.o  \
/home/rosetta/archive/rosetta3/english/commrules1.pf  \
/home/rosetta/archive/rosetta3/english/decommrules1.pf : /home/rosetta/archive/rosetta3/english/mrules1.out ;
 
/home/rosetta/archive/rosetta3/english/mrules1.out : /home/rosetta/archive/rosetta3/english/mrules1.mrule  \
                               /home/rosetta/archive/rosetta3/english/neededinmrules.pf;
	touch $(language)/target/mrules1.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules1
  
/home/rosetta/archive/rosetta3/english/commrules2.o  \
/home/rosetta/archive/rosetta3/english/decommrules2.o  \
/home/rosetta/archive/rosetta3/english/commrules2.pf  \
/home/rosetta/archive/rosetta3/english/decommrules2.pf : /home/rosetta/archive/rosetta3/english/mrules2.out ;
 
/home/rosetta/archive/rosetta3/english/mrules2.out : /home/rosetta/archive/rosetta3/english/mrules2.mrule  \
                               /home/rosetta/archive/rosetta3/english/neededinmrules.pf;
	touch $(language)/target/mrules2.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules2
  
/home/rosetta/archive/rosetta3/english/commrules3.o  \
/home/rosetta/archive/rosetta3/english/decommrules3.o  \
/home/rosetta/archive/rosetta3/english/commrules3.pf  \
/home/rosetta/archive/rosetta3/english/decommrules3.pf : /home/rosetta/archive/rosetta3/english/mrules3.out ;
 
/home/rosetta/archive/rosetta3/english/mrules3.out : /home/rosetta/archive/rosetta3/english/mrules3.mrule  \
                               /home/rosetta/archive/rosetta3/english/neededinmrules.pf;
	touch $(language)/target/mrules3.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules3
  
/home/rosetta/archive/rosetta3/english/commrules4.o  \
/home/rosetta/archive/rosetta3/english/decommrules4.o  \
/home/rosetta/archive/rosetta3/english/commrules4.pf  \
/home/rosetta/archive/rosetta3/english/decommrules4.pf : /home/rosetta/archive/rosetta3/english/mrules4.out ;
 
/home/rosetta/archive/rosetta3/english/mrules4.out : /home/rosetta/archive/rosetta3/english/mrules4.mrule  \
                               /home/rosetta/archive/rosetta3/english/neededinmrules.pf;
	touch $(language)/target/mrules4.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules4
  
/home/rosetta/archive/rosetta3/english/commrules5.o  \
/home/rosetta/archive/rosetta3/english/decommrules5.o  \
/home/rosetta/archive/rosetta3/english/commrules5.pf  \
/home/rosetta/archive/rosetta3/english/decommrules5.pf : /home/rosetta/archive/rosetta3/english/mrules5.out ;
 
/home/rosetta/archive/rosetta3/english/mrules5.out : /home/rosetta/archive/rosetta3/english/mrules5.mrule  \
                               /home/rosetta/archive/rosetta3/english/neededinmrules.pf;
	touch $(language)/target/mrules5.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules5
 
 
  
/home/rosetta/archive/rosetta3/english/commrules6.o  \
/home/rosetta/archive/rosetta3/english/decommrules6.o  \
/home/rosetta/archive/rosetta3/english/commrules6.pf  \
/home/rosetta/archive/rosetta3/english/decommrules6.pf : /home/rosetta/archive/rosetta3/english/mrules6.out ;
 
/home/rosetta/archive/rosetta3/english/mrules6.out : /home/rosetta/archive/rosetta3/english/mrules6.mrule  \
                               /home/rosetta/archive/rosetta3/english/neededinmrules.pf;
	touch $(language)/target/mrules6.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules6
 
 
  
  
/home/rosetta/archive/rosetta3/english/commrules7.o  \
/home/rosetta/archive/rosetta3/english/decommrules7.o  \
/home/rosetta/archive/rosetta3/english/commrules7.pf  \
/home/rosetta/archive/rosetta3/english/decommrules7.pf : /home/rosetta/archive/rosetta3/english/mrules7.out ;
 
/home/rosetta/archive/rosetta3/english/mrules7.out : /home/rosetta/archive/rosetta3/english/mrules7.mrule  \
                               /home/rosetta/archive/rosetta3/english/neededinmrules.pf;
	touch $(language)/target/mrules7.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules7
 
 
  
/home/rosetta/archive/rosetta3/english/commrules8.o  \
/home/rosetta/archive/rosetta3/english/decommrules8.o  \
/home/rosetta/archive/rosetta3/english/commrules8.pf  \
/home/rosetta/archive/rosetta3/english/decommrules8.pf : /home/rosetta/archive/rosetta3/english/mrules8.out ;
 
/home/rosetta/archive/rosetta3/english/mrules8.out : /home/rosetta/archive/rosetta3/english/mrules8.mrule  \
                               /home/rosetta/archive/rosetta3/english/neededinmrules.pf;
	touch $(language)/target/mrules8.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules8
 
 
  
  
/home/rosetta/archive/rosetta3/english/commrules9.o  \
/home/rosetta/archive/rosetta3/english/decommrules9.o  \
/home/rosetta/archive/rosetta3/english/commrules9.pf  \
/home/rosetta/archive/rosetta3/english/decommrules9.pf : /home/rosetta/archive/rosetta3/english/mrules9.out ;
 
/home/rosetta/archive/rosetta3/english/mrules9.out : /home/rosetta/archive/rosetta3/english/mrules9.mrule  \
                               /home/rosetta/archive/rosetta3/english/neededinmrules.pf;
	touch $(language)/target/mrules9.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules9
 
 
  
/home/rosetta/archive/rosetta3/english/commrules10.o  \
/home/rosetta/archive/rosetta3/english/decommrules10.o  \
/home/rosetta/archive/rosetta3/english/commrules10.pf  \
/home/rosetta/archive/rosetta3/english/decommrules10.pf : /home/rosetta/archive/rosetta3/english/mrules10.out ;
 
/home/rosetta/archive/rosetta3/english/mrules10.out : /home/rosetta/archive/rosetta3/english/mrules10.mrule  \
                               /home/rosetta/archive/rosetta3/english/neededinmrules.pf;
	touch $(language)/target/mrules10.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules10
 
 
  
/home/rosetta/archive/rosetta3/english/commrules11.o  \
/home/rosetta/archive/rosetta3/english/decommrules11.o  \
/home/rosetta/archive/rosetta3/english/commrules11.pf  \
/home/rosetta/archive/rosetta3/english/decommrules11.pf : /home/rosetta/archive/rosetta3/english/mrules11.out ;
 
/home/rosetta/archive/rosetta3/english/mrules11.out : /home/rosetta/archive/rosetta3/english/mrules11.mrule  \
                               /home/rosetta/archive/rosetta3/english/neededinmrules.pf;
	touch $(language)/target/mrules11.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules11
 
 
  
/home/rosetta/archive/rosetta3/english/commrules12.o  \
/home/rosetta/archive/rosetta3/english/decommrules12.o  \
/home/rosetta/archive/rosetta3/english/commrules12.pf  \
/home/rosetta/archive/rosetta3/english/decommrules12.pf : /home/rosetta/archive/rosetta3/english/mrules12.out ;
 
/home/rosetta/archive/rosetta3/english/mrules12.out : /home/rosetta/archive/rosetta3/english/mrules12.mrule  \
                               /home/rosetta/archive/rosetta3/english/neededinmrules.pf;
	touch $(language)/target/mrules12.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules12
 
 
  
/home/rosetta/archive/rosetta3/english/commrules13.o  \
/home/rosetta/archive/rosetta3/english/decommrules13.o  \
/home/rosetta/archive/rosetta3/english/commrules13.pf  \
/home/rosetta/archive/rosetta3/english/decommrules13.pf : /home/rosetta/archive/rosetta3/english/mrules13.out ;
 
/home/rosetta/archive/rosetta3/english/mrules13.out : /home/rosetta/archive/rosetta3/english/mrules13.mrule  \
                               /home/rosetta/archive/rosetta3/english/neededinmrules.pf;
	touch $(language)/target/mrules13.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules13
 
 
  
/home/rosetta/archive/rosetta3/english/commrules14.o  \
/home/rosetta/archive/rosetta3/english/decommrules14.o  \
/home/rosetta/archive/rosetta3/english/commrules14.pf  \
/home/rosetta/archive/rosetta3/english/decommrules14.pf : /home/rosetta/archive/rosetta3/english/mrules14.out ;
 
/home/rosetta/archive/rosetta3/english/mrules14.out : /home/rosetta/archive/rosetta3/english/mrules14.mrule  \
                               /home/rosetta/archive/rosetta3/english/neededinmrules.pf;
	touch $(language)/target/mrules14.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules14
 
 
  
  
/home/rosetta/archive/rosetta3/english/commrules15.o  \
/home/rosetta/archive/rosetta3/english/decommrules15.o  \
/home/rosetta/archive/rosetta3/english/commrules15.pf  \
/home/rosetta/archive/rosetta3/english/decommrules15.pf : /home/rosetta/archive/rosetta3/english/mrules15.out ;
 
/home/rosetta/archive/rosetta3/english/mrules15.out : /home/rosetta/archive/rosetta3/english/mrules15.mrule  \
                               /home/rosetta/archive/rosetta3/english/neededinmrules.pf;
	touch $(language)/target/mrules15.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules15
 
 
  
/home/rosetta/archive/rosetta3/english/commrules16.o  \
/home/rosetta/archive/rosetta3/english/decommrules16.o  \
/home/rosetta/archive/rosetta3/english/commrules16.pf  \
/home/rosetta/archive/rosetta3/english/decommrules16.pf : /home/rosetta/archive/rosetta3/english/mrules16.out ;
 
/home/rosetta/archive/rosetta3/english/mrules16.out : /home/rosetta/archive/rosetta3/english/mrules16.mrule  \
                               /home/rosetta/archive/rosetta3/english/neededinmrules.pf;
	touch $(language)/target/mrules16.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules16
 
 
  
  
/home/rosetta/archive/rosetta3/english/commrules17.o  \
/home/rosetta/archive/rosetta3/english/decommrules17.o  \
/home/rosetta/archive/rosetta3/english/commrules17.pf  \
/home/rosetta/archive/rosetta3/english/decommrules17.pf : /home/rosetta/archive/rosetta3/english/mrules17.out ;
 
/home/rosetta/archive/rosetta3/english/mrules17.out : /home/rosetta/archive/rosetta3/english/mrules17.mrule  \
                               /home/rosetta/archive/rosetta3/english/neededinmrules.pf;
	touch $(language)/target/mrules17.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules17
 
 
  
/home/rosetta/archive/rosetta3/english/commrules18.o  \
/home/rosetta/archive/rosetta3/english/decommrules18.o  \
/home/rosetta/archive/rosetta3/english/commrules18.pf  \
/home/rosetta/archive/rosetta3/english/decommrules18.pf : /home/rosetta/archive/rosetta3/english/mrules18.out ;
 
/home/rosetta/archive/rosetta3/english/mrules18.out : /home/rosetta/archive/rosetta3/english/mrules18.mrule  \
                               /home/rosetta/archive/rosetta3/english/neededinmrules.pf;
	touch $(language)/target/mrules18.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules18
 
 
  
  
/home/rosetta/archive/rosetta3/english/commrules19.o  \
/home/rosetta/archive/rosetta3/english/decommrules19.o  \
/home/rosetta/archive/rosetta3/english/commrules19.pf  \
/home/rosetta/archive/rosetta3/english/decommrules19.pf : /home/rosetta/archive/rosetta3/english/mrules19.out ;
 
/home/rosetta/archive/rosetta3/english/mrules19.out : /home/rosetta/archive/rosetta3/english/mrules19.mrule  \
                               /home/rosetta/archive/rosetta3/english/neededinmrules.pf;
	touch $(language)/target/mrules19.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules19
 
 
  
/home/rosetta/archive/rosetta3/english/commrules20.o  \
/home/rosetta/archive/rosetta3/english/decommrules20.o  \
/home/rosetta/archive/rosetta3/english/commrules20.pf  \
/home/rosetta/archive/rosetta3/english/decommrules20.pf : /home/rosetta/archive/rosetta3/english/mrules20.out ;
 
/home/rosetta/archive/rosetta3/english/mrules20.out : /home/rosetta/archive/rosetta3/english/mrules20.mrule  \
                               /home/rosetta/archive/rosetta3/english/neededinmrules.pf;
	touch $(language)/target/mrules20.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules20
 
 
  
/home/rosetta/archive/rosetta3/english/commrules21.o  \
/home/rosetta/archive/rosetta3/english/decommrules21.o  \
/home/rosetta/archive/rosetta3/english/commrules21.pf  \
/home/rosetta/archive/rosetta3/english/decommrules21.pf : /home/rosetta/archive/rosetta3/english/mrules21.out ;
 
/home/rosetta/archive/rosetta3/english/mrules21.out : /home/rosetta/archive/rosetta3/english/mrules21.mrule  \
                               /home/rosetta/archive/rosetta3/english/neededinmrules.pf;
	touch $(language)/target/mrules21.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules21
 
 
  
/home/rosetta/archive/rosetta3/english/commrules22.o  \
/home/rosetta/archive/rosetta3/english/decommrules22.o  \
/home/rosetta/archive/rosetta3/english/commrules22.pf  \
/home/rosetta/archive/rosetta3/english/decommrules22.pf : /home/rosetta/archive/rosetta3/english/mrules22.out ;
 
/home/rosetta/archive/rosetta3/english/mrules22.out : /home/rosetta/archive/rosetta3/english/mrules22.mrule  \
                               /home/rosetta/archive/rosetta3/english/neededinmrules.pf;
	touch $(language)/target/mrules22.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules22
 
 
  
/home/rosetta/archive/rosetta3/english/commrules23.o  \
/home/rosetta/archive/rosetta3/english/decommrules23.o  \
/home/rosetta/archive/rosetta3/english/commrules23.pf  \
/home/rosetta/archive/rosetta3/english/decommrules23.pf : /home/rosetta/archive/rosetta3/english/mrules23.out ;
 
/home/rosetta/archive/rosetta3/english/mrules23.out : /home/rosetta/archive/rosetta3/english/mrules23.mrule  \
                               /home/rosetta/archive/rosetta3/english/neededinmrules.pf;
	touch $(language)/target/mrules23.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules23
 
 
  
/home/rosetta/archive/rosetta3/english/commrules24.o  \
/home/rosetta/archive/rosetta3/english/decommrules24.o  \
/home/rosetta/archive/rosetta3/english/commrules24.pf  \
/home/rosetta/archive/rosetta3/english/decommrules24.pf : /home/rosetta/archive/rosetta3/english/mrules24.out ;
 
/home/rosetta/archive/rosetta3/english/mrules24.out : /home/rosetta/archive/rosetta3/english/mrules24.mrule  \
                               /home/rosetta/archive/rosetta3/english/neededinmrules.pf;
	touch $(language)/target/mrules24.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules24
 
 
  
  
/home/rosetta/archive/rosetta3/english/commrules25.o  \
/home/rosetta/archive/rosetta3/english/decommrules25.o  \
/home/rosetta/archive/rosetta3/english/commrules25.pf  \
/home/rosetta/archive/rosetta3/english/decommrules25.pf : /home/rosetta/archive/rosetta3/english/mrules25.out ;
 
/home/rosetta/archive/rosetta3/english/mrules25.out : /home/rosetta/archive/rosetta3/english/mrules25.mrule  \
                               /home/rosetta/archive/rosetta3/english/neededinmrules.pf;
	touch $(language)/target/mrules25.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules25
 
 
  
/home/rosetta/archive/rosetta3/english/commrules26.o  \
/home/rosetta/archive/rosetta3/english/decommrules26.o  \
/home/rosetta/archive/rosetta3/english/commrules26.pf  \
/home/rosetta/archive/rosetta3/english/decommrules26.pf : /home/rosetta/archive/rosetta3/english/mrules26.out ;
 
/home/rosetta/archive/rosetta3/english/mrules26.out : /home/rosetta/archive/rosetta3/english/mrules26.mrule  \
                               /home/rosetta/archive/rosetta3/english/neededinmrules.pf;
	touch $(language)/target/mrules26.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules26
 
 
  
  
/home/rosetta/archive/rosetta3/english/commrules27.o  \
/home/rosetta/archive/rosetta3/english/decommrules27.o  \
/home/rosetta/archive/rosetta3/english/commrules27.pf  \
/home/rosetta/archive/rosetta3/english/decommrules27.pf : /home/rosetta/archive/rosetta3/english/mrules27.out ;
 
/home/rosetta/archive/rosetta3/english/mrules27.out : /home/rosetta/archive/rosetta3/english/mrules27.mrule  \
                               /home/rosetta/archive/rosetta3/english/neededinmrules.pf;
	touch $(language)/target/mrules27.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules27
 
 
  
/home/rosetta/archive/rosetta3/english/commrules28.o  \
/home/rosetta/archive/rosetta3/english/decommrules28.o  \
/home/rosetta/archive/rosetta3/english/commrules28.pf  \
/home/rosetta/archive/rosetta3/english/decommrules28.pf : /home/rosetta/archive/rosetta3/english/mrules28.out ;
 
/home/rosetta/archive/rosetta3/english/mrules28.out : /home/rosetta/archive/rosetta3/english/mrules28.mrule  \
                               /home/rosetta/archive/rosetta3/english/neededinmrules.pf;
	touch $(language)/target/mrules28.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules28
 
 
  
  
/home/rosetta/archive/rosetta3/english/commrules29.o  \
/home/rosetta/archive/rosetta3/english/decommrules29.o  \
/home/rosetta/archive/rosetta3/english/commrules29.pf  \
/home/rosetta/archive/rosetta3/english/decommrules29.pf : /home/rosetta/archive/rosetta3/english/mrules29.out ;
 
/home/rosetta/archive/rosetta3/english/mrules29.out : /home/rosetta/archive/rosetta3/english/mrules29.mrule  \
                               /home/rosetta/archive/rosetta3/english/neededinmrules.pf;
	touch $(language)/target/mrules29.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules29
 
 
  
/home/rosetta/archive/rosetta3/english/commrules30.o  \
/home/rosetta/archive/rosetta3/english/decommrules30.o  \
/home/rosetta/archive/rosetta3/english/commrules30.pf  \
/home/rosetta/archive/rosetta3/english/decommrules30.pf : /home/rosetta/archive/rosetta3/english/mrules30.out ;
 
/home/rosetta/archive/rosetta3/english/mrules30.out : /home/rosetta/archive/rosetta3/english/mrules30.mrule  \
                               /home/rosetta/archive/rosetta3/english/neededinmrules.pf;
	touch $(language)/target/mrules30.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules30
 
 
  
/home/rosetta/archive/rosetta3/english/commrules31.o  \
/home/rosetta/archive/rosetta3/english/decommrules31.o  \
/home/rosetta/archive/rosetta3/english/commrules31.pf  \
/home/rosetta/archive/rosetta3/english/decommrules31.pf : /home/rosetta/archive/rosetta3/english/mrules31.out ;
 
/home/rosetta/archive/rosetta3/english/mrules31.out : /home/rosetta/archive/rosetta3/english/mrules31.mrule  \
                               /home/rosetta/archive/rosetta3/english/neededinmrules.pf;
	touch $(language)/target/mrules31.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules31
 
 
  
/home/rosetta/archive/rosetta3/english/commrules32.o  \
/home/rosetta/archive/rosetta3/english/decommrules32.o  \
/home/rosetta/archive/rosetta3/english/commrules32.pf  \
/home/rosetta/archive/rosetta3/english/decommrules32.pf : /home/rosetta/archive/rosetta3/english/mrules32.out ;
 
/home/rosetta/archive/rosetta3/english/mrules32.out : /home/rosetta/archive/rosetta3/english/mrules32.mrule  \
                               /home/rosetta/archive/rosetta3/english/neededinmrules.pf;
	touch $(language)/target/mrules32.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules32
 
 
  
/home/rosetta/archive/rosetta3/english/commrules33.o  \
/home/rosetta/archive/rosetta3/english/decommrules33.o  \
/home/rosetta/archive/rosetta3/english/commrules33.pf  \
/home/rosetta/archive/rosetta3/english/decommrules33.pf : /home/rosetta/archive/rosetta3/english/mrules33.out ;
 
/home/rosetta/archive/rosetta3/english/mrules33.out : /home/rosetta/archive/rosetta3/english/mrules33.mrule  \
                               /home/rosetta/archive/rosetta3/english/neededinmrules.pf;
	touch $(language)/target/mrules33.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules33
 
 
  
/home/rosetta/archive/rosetta3/english/commrules34.o  \
/home/rosetta/archive/rosetta3/english/decommrules34.o  \
/home/rosetta/archive/rosetta3/english/commrules34.pf  \
/home/rosetta/archive/rosetta3/english/decommrules34.pf : /home/rosetta/archive/rosetta3/english/mrules34.out ;
 
/home/rosetta/archive/rosetta3/english/mrules34.out : /home/rosetta/archive/rosetta3/english/mrules34.mrule  \
                               /home/rosetta/archive/rosetta3/english/neededinmrules.pf;
	touch $(language)/target/mrules34.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules34
 
 
  
  
/home/rosetta/archive/rosetta3/english/commrules35.o  \
/home/rosetta/archive/rosetta3/english/decommrules35.o  \
/home/rosetta/archive/rosetta3/english/commrules35.pf  \
/home/rosetta/archive/rosetta3/english/decommrules35.pf : /home/rosetta/archive/rosetta3/english/mrules35.out ;
 
/home/rosetta/archive/rosetta3/english/mrules35.out : /home/rosetta/archive/rosetta3/english/mrules35.mrule  \
                               /home/rosetta/archive/rosetta3/english/neededinmrules.pf;
	touch $(language)/target/mrules35.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules35
 
 
  
/home/rosetta/archive/rosetta3/english/commrules36.o  \
/home/rosetta/archive/rosetta3/english/decommrules36.o  \
/home/rosetta/archive/rosetta3/english/commrules36.pf  \
/home/rosetta/archive/rosetta3/english/decommrules36.pf : /home/rosetta/archive/rosetta3/english/mrules36.out ;
 
/home/rosetta/archive/rosetta3/english/mrules36.out : /home/rosetta/archive/rosetta3/english/mrules36.mrule  \
                               /home/rosetta/archive/rosetta3/english/neededinmrules.pf;
	touch $(language)/target/mrules36.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules36
 
 
  
  
/home/rosetta/archive/rosetta3/english/commrules37.o  \
/home/rosetta/archive/rosetta3/english/decommrules37.o  \
/home/rosetta/archive/rosetta3/english/commrules37.pf  \
/home/rosetta/archive/rosetta3/english/decommrules37.pf : /home/rosetta/archive/rosetta3/english/mrules37.out ;
 
/home/rosetta/archive/rosetta3/english/mrules37.out : /home/rosetta/archive/rosetta3/english/mrules37.mrule  \
                               /home/rosetta/archive/rosetta3/english/neededinmrules.pf;
	touch $(language)/target/mrules37.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules37
 
 
  
/home/rosetta/archive/rosetta3/english/commrules38.o  \
/home/rosetta/archive/rosetta3/english/decommrules38.o  \
/home/rosetta/archive/rosetta3/english/commrules38.pf  \
/home/rosetta/archive/rosetta3/english/decommrules38.pf : /home/rosetta/archive/rosetta3/english/mrules38.out ;
 
/home/rosetta/archive/rosetta3/english/mrules38.out : /home/rosetta/archive/rosetta3/english/mrules38.mrule  \
                               /home/rosetta/archive/rosetta3/english/neededinmrules.pf;
	touch $(language)/target/mrules38.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules38
 
 
  
  
/home/rosetta/archive/rosetta3/english/commrules39.o  \
/home/rosetta/archive/rosetta3/english/decommrules39.o  \
/home/rosetta/archive/rosetta3/english/commrules39.pf  \
/home/rosetta/archive/rosetta3/english/decommrules39.pf : /home/rosetta/archive/rosetta3/english/mrules39.out ;
 
/home/rosetta/archive/rosetta3/english/mrules39.out : /home/rosetta/archive/rosetta3/english/mrules39.mrule  \
                               /home/rosetta/archive/rosetta3/english/neededinmrules.pf;
	touch $(language)/target/mrules39.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules39
 
 
  
/home/rosetta/archive/rosetta3/english/commrules40.o  \
/home/rosetta/archive/rosetta3/english/decommrules40.o  \
/home/rosetta/archive/rosetta3/english/commrules40.pf  \
/home/rosetta/archive/rosetta3/english/decommrules40.pf : /home/rosetta/archive/rosetta3/english/mrules40.out ;
 
/home/rosetta/archive/rosetta3/english/mrules40.out : /home/rosetta/archive/rosetta3/english/mrules40.mrule  \
                               /home/rosetta/archive/rosetta3/english/neededinmrules.pf;
	touch $(language)/target/mrules40.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules40
 
 
  
/home/rosetta/archive/rosetta3/english/commrules41.o  \
/home/rosetta/archive/rosetta3/english/decommrules41.o  \
/home/rosetta/archive/rosetta3/english/commrules41.pf  \
/home/rosetta/archive/rosetta3/english/decommrules41.pf : /home/rosetta/archive/rosetta3/english/mrules41.out ;
 
/home/rosetta/archive/rosetta3/english/mrules41.out : /home/rosetta/archive/rosetta3/english/mrules41.mrule  \
                               /home/rosetta/archive/rosetta3/english/neededinmrules.pf;
	touch $(language)/target/mrules41.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules41
 
 
  
/home/rosetta/archive/rosetta3/english/commrules42.o  \
/home/rosetta/archive/rosetta3/english/decommrules42.o  \
/home/rosetta/archive/rosetta3/english/commrules42.pf  \
/home/rosetta/archive/rosetta3/english/decommrules42.pf : /home/rosetta/archive/rosetta3/english/mrules42.out ;
 
/home/rosetta/archive/rosetta3/english/mrules42.out : /home/rosetta/archive/rosetta3/english/mrules42.mrule  \
                               /home/rosetta/archive/rosetta3/english/neededinmrules.pf;
	touch $(language)/target/mrules42.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules42
 
 
  
/home/rosetta/archive/rosetta3/english/commrules43.o  \
/home/rosetta/archive/rosetta3/english/decommrules43.o  \
/home/rosetta/archive/rosetta3/english/commrules43.pf  \
/home/rosetta/archive/rosetta3/english/decommrules43.pf : /home/rosetta/archive/rosetta3/english/mrules43.out ;
 
/home/rosetta/archive/rosetta3/english/mrules43.out : /home/rosetta/archive/rosetta3/english/mrules43.mrule  \
                               /home/rosetta/archive/rosetta3/english/neededinmrules.pf;
	touch $(language)/target/mrules43.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules43
 
 
  
/home/rosetta/archive/rosetta3/english/commrules44.o  \
/home/rosetta/archive/rosetta3/english/decommrules44.o  \
/home/rosetta/archive/rosetta3/english/commrules44.pf  \
/home/rosetta/archive/rosetta3/english/decommrules44.pf : /home/rosetta/archive/rosetta3/english/mrules44.out ;
 
/home/rosetta/archive/rosetta3/english/mrules44.out : /home/rosetta/archive/rosetta3/english/mrules44.mrule  \
                               /home/rosetta/archive/rosetta3/english/neededinmrules.pf;
	touch $(language)/target/mrules44.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules44
 
 
  
  
/home/rosetta/archive/rosetta3/english/commrules45.o  \
/home/rosetta/archive/rosetta3/english/decommrules45.o  \
/home/rosetta/archive/rosetta3/english/commrules45.pf  \
/home/rosetta/archive/rosetta3/english/decommrules45.pf : /home/rosetta/archive/rosetta3/english/mrules45.out ;
 
/home/rosetta/archive/rosetta3/english/mrules45.out : /home/rosetta/archive/rosetta3/english/mrules45.mrule  \
                               /home/rosetta/archive/rosetta3/english/neededinmrules.pf;
	touch $(language)/target/mrules45.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules45
 
 
  
/home/rosetta/archive/rosetta3/english/commrules46.o  \
/home/rosetta/archive/rosetta3/english/decommrules46.o  \
/home/rosetta/archive/rosetta3/english/commrules46.pf  \
/home/rosetta/archive/rosetta3/english/decommrules46.pf : /home/rosetta/archive/rosetta3/english/mrules46.out ;
 
/home/rosetta/archive/rosetta3/english/mrules46.out : /home/rosetta/archive/rosetta3/english/mrules46.mrule  \
                               /home/rosetta/archive/rosetta3/english/neededinmrules.pf;
	touch $(language)/target/mrules46.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules46
 
 
  
  
/home/rosetta/archive/rosetta3/english/commrules47.o  \
/home/rosetta/archive/rosetta3/english/decommrules47.o  \
/home/rosetta/archive/rosetta3/english/commrules47.pf  \
/home/rosetta/archive/rosetta3/english/decommrules47.pf : /home/rosetta/archive/rosetta3/english/mrules47.out ;
 
/home/rosetta/archive/rosetta3/english/mrules47.out : /home/rosetta/archive/rosetta3/english/mrules47.mrule  \
                               /home/rosetta/archive/rosetta3/english/neededinmrules.pf;
	touch $(language)/target/mrules47.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules47
 
 
  
/home/rosetta/archive/rosetta3/english/commrules48.o  \
/home/rosetta/archive/rosetta3/english/decommrules48.o  \
/home/rosetta/archive/rosetta3/english/commrules48.pf  \
/home/rosetta/archive/rosetta3/english/decommrules48.pf : /home/rosetta/archive/rosetta3/english/mrules48.out ;
 
/home/rosetta/archive/rosetta3/english/mrules48.out : /home/rosetta/archive/rosetta3/english/mrules48.mrule  \
                               /home/rosetta/archive/rosetta3/english/neededinmrules.pf;
	touch $(language)/target/mrules48.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules48
 
 
  
  
/home/rosetta/archive/rosetta3/english/commrules49.o  \
/home/rosetta/archive/rosetta3/english/decommrules49.o  \
/home/rosetta/archive/rosetta3/english/commrules49.pf  \
/home/rosetta/archive/rosetta3/english/decommrules49.pf : /home/rosetta/archive/rosetta3/english/mrules49.out ;
 
/home/rosetta/archive/rosetta3/english/mrules49.out : /home/rosetta/archive/rosetta3/english/mrules49.mrule  \
                               /home/rosetta/archive/rosetta3/english/neededinmrules.pf;
	touch $(language)/target/mrules49.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules49
 
 
  
/home/rosetta/archive/rosetta3/english/commrules50.o  \
/home/rosetta/archive/rosetta3/english/decommrules50.o  \
/home/rosetta/archive/rosetta3/english/commrules50.pf  \
/home/rosetta/archive/rosetta3/english/decommrules50.pf : /home/rosetta/archive/rosetta3/english/mrules50.out ;
 
/home/rosetta/archive/rosetta3/english/mrules50.out : /home/rosetta/archive/rosetta3/english/mrules50.mrule  \
                               /home/rosetta/archive/rosetta3/english/neededinmrules.pf;
	touch $(language)/target/mrules50.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules50
 
 
  
/home/rosetta/archive/rosetta3/english/commrules51.o  \
/home/rosetta/archive/rosetta3/english/decommrules51.o  \
/home/rosetta/archive/rosetta3/english/commrules51.pf  \
/home/rosetta/archive/rosetta3/english/decommrules51.pf : /home/rosetta/archive/rosetta3/english/mrules51.out ;
 
/home/rosetta/archive/rosetta3/english/mrules51.out : /home/rosetta/archive/rosetta3/english/mrules51.mrule  \
                               /home/rosetta/archive/rosetta3/english/neededinmrules.pf;
	touch $(language)/target/mrules51.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules51
 
 
  
/home/rosetta/archive/rosetta3/english/commrules52.o  \
/home/rosetta/archive/rosetta3/english/decommrules52.o  \
/home/rosetta/archive/rosetta3/english/commrules52.pf  \
/home/rosetta/archive/rosetta3/english/decommrules52.pf : /home/rosetta/archive/rosetta3/english/mrules52.out ;
 
/home/rosetta/archive/rosetta3/english/mrules52.out : /home/rosetta/archive/rosetta3/english/mrules52.mrule  \
                               /home/rosetta/archive/rosetta3/english/neededinmrules.pf;
	touch $(language)/target/mrules52.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules52
 
 
  
/home/rosetta/archive/rosetta3/english/commrules53.o  \
/home/rosetta/archive/rosetta3/english/decommrules53.o  \
/home/rosetta/archive/rosetta3/english/commrules53.pf  \
/home/rosetta/archive/rosetta3/english/decommrules53.pf : /home/rosetta/archive/rosetta3/english/mrules53.out ;
 
/home/rosetta/archive/rosetta3/english/mrules53.out : /home/rosetta/archive/rosetta3/english/mrules53.mrule  \
                               /home/rosetta/archive/rosetta3/english/neededinmrules.pf;
	touch $(language)/target/mrules53.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules53
 
 
  
/home/rosetta/archive/rosetta3/english/commrules54.o  \
/home/rosetta/archive/rosetta3/english/decommrules54.o  \
/home/rosetta/archive/rosetta3/english/commrules54.pf  \
/home/rosetta/archive/rosetta3/english/decommrules54.pf : /home/rosetta/archive/rosetta3/english/mrules54.out ;
 
/home/rosetta/archive/rosetta3/english/mrules54.out : /home/rosetta/archive/rosetta3/english/mrules54.mrule  \
                               /home/rosetta/archive/rosetta3/english/neededinmrules.pf;
	touch $(language)/target/mrules54.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules54
 
 
  
  
/home/rosetta/archive/rosetta3/english/commrules55.o  \
/home/rosetta/archive/rosetta3/english/decommrules55.o  \
/home/rosetta/archive/rosetta3/english/commrules55.pf  \
/home/rosetta/archive/rosetta3/english/decommrules55.pf : /home/rosetta/archive/rosetta3/english/mrules55.out ;
 
/home/rosetta/archive/rosetta3/english/mrules55.out : /home/rosetta/archive/rosetta3/english/mrules55.mrule  \
                               /home/rosetta/archive/rosetta3/english/neededinmrules.pf;
	touch $(language)/target/mrules55.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules55
 
 
  
/home/rosetta/archive/rosetta3/english/commrules56.o  \
/home/rosetta/archive/rosetta3/english/decommrules56.o  \
/home/rosetta/archive/rosetta3/english/commrules56.pf  \
/home/rosetta/archive/rosetta3/english/decommrules56.pf : /home/rosetta/archive/rosetta3/english/mrules56.out ;
 
/home/rosetta/archive/rosetta3/english/mrules56.out : /home/rosetta/archive/rosetta3/english/mrules56.mrule  \
                               /home/rosetta/archive/rosetta3/english/neededinmrules.pf;
	touch $(language)/target/mrules56.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules56
 
 
  
  
/home/rosetta/archive/rosetta3/english/commrules57.o  \
/home/rosetta/archive/rosetta3/english/decommrules57.o  \
/home/rosetta/archive/rosetta3/english/commrules57.pf  \
/home/rosetta/archive/rosetta3/english/decommrules57.pf : /home/rosetta/archive/rosetta3/english/mrules57.out ;
 
/home/rosetta/archive/rosetta3/english/mrules57.out : /home/rosetta/archive/rosetta3/english/mrules57.mrule  \
                               /home/rosetta/archive/rosetta3/english/neededinmrules.pf;
	touch $(language)/target/mrules57.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules57
 
 
  
/home/rosetta/archive/rosetta3/english/commrules58.o  \
/home/rosetta/archive/rosetta3/english/decommrules58.o  \
/home/rosetta/archive/rosetta3/english/commrules58.pf  \
/home/rosetta/archive/rosetta3/english/decommrules58.pf : /home/rosetta/archive/rosetta3/english/mrules58.out ;
 
/home/rosetta/archive/rosetta3/english/mrules58.out : /home/rosetta/archive/rosetta3/english/mrules58.mrule  \
                               /home/rosetta/archive/rosetta3/english/neededinmrules.pf;
	touch $(language)/target/mrules58.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules58
 
 
  
  
/home/rosetta/archive/rosetta3/english/commrules59.o  \
/home/rosetta/archive/rosetta3/english/decommrules59.o  \
/home/rosetta/archive/rosetta3/english/commrules59.pf  \
/home/rosetta/archive/rosetta3/english/decommrules59.pf : /home/rosetta/archive/rosetta3/english/mrules59.out ;
 
/home/rosetta/archive/rosetta3/english/mrules59.out : /home/rosetta/archive/rosetta3/english/mrules59.mrule  \
                               /home/rosetta/archive/rosetta3/english/neededinmrules.pf;
	touch $(language)/target/mrules59.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules59
 
 
  
/home/rosetta/archive/rosetta3/english/commrules60.o  \
/home/rosetta/archive/rosetta3/english/decommrules60.o  \
/home/rosetta/archive/rosetta3/english/commrules60.pf  \
/home/rosetta/archive/rosetta3/english/decommrules60.pf : /home/rosetta/archive/rosetta3/english/mrules60.out ;
 
/home/rosetta/archive/rosetta3/english/mrules60.out : /home/rosetta/archive/rosetta3/english/mrules60.mrule  \
                               /home/rosetta/archive/rosetta3/english/neededinmrules.pf;
	touch $(language)/target/mrules60.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules60
 
 
  
/home/rosetta/archive/rosetta3/english/commrules61.o  \
/home/rosetta/archive/rosetta3/english/decommrules61.o  \
/home/rosetta/archive/rosetta3/english/commrules61.pf  \
/home/rosetta/archive/rosetta3/english/decommrules61.pf : /home/rosetta/archive/rosetta3/english/mrules61.out ;
 
/home/rosetta/archive/rosetta3/english/mrules61.out : /home/rosetta/archive/rosetta3/english/mrules61.mrule  \
                               /home/rosetta/archive/rosetta3/english/neededinmrules.pf;
	touch $(language)/target/mrules61.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules61
 
 
  
/home/rosetta/archive/rosetta3/english/commrules62.o  \
/home/rosetta/archive/rosetta3/english/decommrules62.o  \
/home/rosetta/archive/rosetta3/english/commrules62.pf  \
/home/rosetta/archive/rosetta3/english/decommrules62.pf : /home/rosetta/archive/rosetta3/english/mrules62.out ;
 
/home/rosetta/archive/rosetta3/english/mrules62.out : /home/rosetta/archive/rosetta3/english/mrules62.mrule  \
                               /home/rosetta/archive/rosetta3/english/neededinmrules.pf;
	touch $(language)/target/mrules62.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules62
 
 
  
/home/rosetta/archive/rosetta3/english/commrules63.o  \
/home/rosetta/archive/rosetta3/english/decommrules63.o  \
/home/rosetta/archive/rosetta3/english/commrules63.pf  \
/home/rosetta/archive/rosetta3/english/decommrules63.pf : /home/rosetta/archive/rosetta3/english/mrules63.out ;
 
/home/rosetta/archive/rosetta3/english/mrules63.out : /home/rosetta/archive/rosetta3/english/mrules63.mrule  \
                               /home/rosetta/archive/rosetta3/english/neededinmrules.pf;
	touch $(language)/target/mrules63.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules63
 
 
  
/home/rosetta/archive/rosetta3/english/commrules64.o  \
/home/rosetta/archive/rosetta3/english/decommrules64.o  \
/home/rosetta/archive/rosetta3/english/commrules64.pf  \
/home/rosetta/archive/rosetta3/english/decommrules64.pf : /home/rosetta/archive/rosetta3/english/mrules64.out ;
 
/home/rosetta/archive/rosetta3/english/mrules64.out : /home/rosetta/archive/rosetta3/english/mrules64.mrule  \
                               /home/rosetta/archive/rosetta3/english/neededinmrules.pf;
	touch $(language)/target/mrules64.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules64
 
 
  
  
/home/rosetta/archive/rosetta3/english/commrules65.o  \
/home/rosetta/archive/rosetta3/english/decommrules65.o  \
/home/rosetta/archive/rosetta3/english/commrules65.pf  \
/home/rosetta/archive/rosetta3/english/decommrules65.pf : /home/rosetta/archive/rosetta3/english/mrules65.out ;
 
/home/rosetta/archive/rosetta3/english/mrules65.out : /home/rosetta/archive/rosetta3/english/mrules65.mrule  \
                               /home/rosetta/archive/rosetta3/english/neededinmrules.pf;
	touch $(language)/target/mrules65.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules65
 
 
  
/home/rosetta/archive/rosetta3/english/commrules66.o  \
/home/rosetta/archive/rosetta3/english/decommrules66.o  \
/home/rosetta/archive/rosetta3/english/commrules66.pf  \
/home/rosetta/archive/rosetta3/english/decommrules66.pf : /home/rosetta/archive/rosetta3/english/mrules66.out ;
 
/home/rosetta/archive/rosetta3/english/mrules66.out : /home/rosetta/archive/rosetta3/english/mrules66.mrule  \
                               /home/rosetta/archive/rosetta3/english/neededinmrules.pf;
	touch $(language)/target/mrules66.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules66
 
 
  
  
/home/rosetta/archive/rosetta3/english/commrules67.o  \
/home/rosetta/archive/rosetta3/english/decommrules67.o  \
/home/rosetta/archive/rosetta3/english/commrules67.pf  \
/home/rosetta/archive/rosetta3/english/decommrules67.pf : /home/rosetta/archive/rosetta3/english/mrules67.out ;
 
/home/rosetta/archive/rosetta3/english/mrules67.out : /home/rosetta/archive/rosetta3/english/mrules67.mrule  \
                               /home/rosetta/archive/rosetta3/english/neededinmrules.pf;
	touch $(language)/target/mrules67.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules67
 
 
  
/home/rosetta/archive/rosetta3/english/commrules68.o  \
/home/rosetta/archive/rosetta3/english/decommrules68.o  \
/home/rosetta/archive/rosetta3/english/commrules68.pf  \
/home/rosetta/archive/rosetta3/english/decommrules68.pf : /home/rosetta/archive/rosetta3/english/mrules68.out ;
 
/home/rosetta/archive/rosetta3/english/mrules68.out : /home/rosetta/archive/rosetta3/english/mrules68.mrule  \
                               /home/rosetta/archive/rosetta3/english/neededinmrules.pf;
	touch $(language)/target/mrules68.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules68
 
 
  
  
/home/rosetta/archive/rosetta3/english/commrules69.o  \
/home/rosetta/archive/rosetta3/english/decommrules69.o  \
/home/rosetta/archive/rosetta3/english/commrules69.pf  \
/home/rosetta/archive/rosetta3/english/decommrules69.pf : /home/rosetta/archive/rosetta3/english/mrules69.out ;
 
/home/rosetta/archive/rosetta3/english/mrules69.out : /home/rosetta/archive/rosetta3/english/mrules69.mrule  \
                               /home/rosetta/archive/rosetta3/english/neededinmrules.pf;
	touch $(language)/target/mrules69.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules69
 
 
  
/home/rosetta/archive/rosetta3/english/commrules70.o  \
/home/rosetta/archive/rosetta3/english/decommrules70.o  \
/home/rosetta/archive/rosetta3/english/commrules70.pf  \
/home/rosetta/archive/rosetta3/english/decommrules70.pf : /home/rosetta/archive/rosetta3/english/mrules70.out ;
 
/home/rosetta/archive/rosetta3/english/mrules70.out : /home/rosetta/archive/rosetta3/english/mrules70.mrule  \
                               /home/rosetta/archive/rosetta3/english/neededinmrules.pf;
	touch $(language)/target/mrules70.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules70
 
 
  
/home/rosetta/archive/rosetta3/english/commrules71.o  \
/home/rosetta/archive/rosetta3/english/decommrules71.o  \
/home/rosetta/archive/rosetta3/english/commrules71.pf  \
/home/rosetta/archive/rosetta3/english/decommrules71.pf : /home/rosetta/archive/rosetta3/english/mrules71.out ;
 
/home/rosetta/archive/rosetta3/english/mrules71.out : /home/rosetta/archive/rosetta3/english/mrules71.mrule  \
                               /home/rosetta/archive/rosetta3/english/neededinmrules.pf;
	touch $(language)/target/mrules71.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules71
 
 
  
/home/rosetta/archive/rosetta3/english/commrules72.o  \
/home/rosetta/archive/rosetta3/english/decommrules72.o  \
/home/rosetta/archive/rosetta3/english/commrules72.pf  \
/home/rosetta/archive/rosetta3/english/decommrules72.pf : /home/rosetta/archive/rosetta3/english/mrules72.out ;
 
/home/rosetta/archive/rosetta3/english/mrules72.out : /home/rosetta/archive/rosetta3/english/mrules72.mrule  \
                               /home/rosetta/archive/rosetta3/english/neededinmrules.pf;
	touch $(language)/target/mrules72.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules72
 
 
  
/home/rosetta/archive/rosetta3/english/commrules73.o  \
/home/rosetta/archive/rosetta3/english/decommrules73.o  \
/home/rosetta/archive/rosetta3/english/commrules73.pf  \
/home/rosetta/archive/rosetta3/english/decommrules73.pf : /home/rosetta/archive/rosetta3/english/mrules73.out ;
 
/home/rosetta/archive/rosetta3/english/mrules73.out : /home/rosetta/archive/rosetta3/english/mrules73.mrule  \
                               /home/rosetta/archive/rosetta3/english/neededinmrules.pf;
	touch $(language)/target/mrules73.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules73
 
 
  
/home/rosetta/archive/rosetta3/english/commrules74.o  \
/home/rosetta/archive/rosetta3/english/decommrules74.o  \
/home/rosetta/archive/rosetta3/english/commrules74.pf  \
/home/rosetta/archive/rosetta3/english/decommrules74.pf : /home/rosetta/archive/rosetta3/english/mrules74.out ;
 
/home/rosetta/archive/rosetta3/english/mrules74.out : /home/rosetta/archive/rosetta3/english/mrules74.mrule  \
                               /home/rosetta/archive/rosetta3/english/neededinmrules.pf;
	touch $(language)/target/mrules74.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules74
 
 
  
  
/home/rosetta/archive/rosetta3/english/commrules75.o  \
/home/rosetta/archive/rosetta3/english/decommrules75.o  \
/home/rosetta/archive/rosetta3/english/commrules75.pf  \
/home/rosetta/archive/rosetta3/english/decommrules75.pf : /home/rosetta/archive/rosetta3/english/mrules75.out ;
 
/home/rosetta/archive/rosetta3/english/mrules75.out : /home/rosetta/archive/rosetta3/english/mrules75.mrule  \
                               /home/rosetta/archive/rosetta3/english/neededinmrules.pf;
	touch $(language)/target/mrules75.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules75
 
 
  
/home/rosetta/archive/rosetta3/english/commrules76.o  \
/home/rosetta/archive/rosetta3/english/decommrules76.o  \
/home/rosetta/archive/rosetta3/english/commrules76.pf  \
/home/rosetta/archive/rosetta3/english/decommrules76.pf : /home/rosetta/archive/rosetta3/english/mrules76.out ;
 
/home/rosetta/archive/rosetta3/english/mrules76.out : /home/rosetta/archive/rosetta3/english/mrules76.mrule  \
                               /home/rosetta/archive/rosetta3/english/neededinmrules.pf;
	touch $(language)/target/mrules76.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules76
 
 
  
  
/home/rosetta/archive/rosetta3/english/commrules77.o  \
/home/rosetta/archive/rosetta3/english/decommrules77.o  \
/home/rosetta/archive/rosetta3/english/commrules77.pf  \
/home/rosetta/archive/rosetta3/english/decommrules77.pf : /home/rosetta/archive/rosetta3/english/mrules77.out ;
 
/home/rosetta/archive/rosetta3/english/mrules77.out : /home/rosetta/archive/rosetta3/english/mrules77.mrule  \
                               /home/rosetta/archive/rosetta3/english/neededinmrules.pf;
	touch $(language)/target/mrules77.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules77
 
 
  
/home/rosetta/archive/rosetta3/english/commrules78.o  \
/home/rosetta/archive/rosetta3/english/decommrules78.o  \
/home/rosetta/archive/rosetta3/english/commrules78.pf  \
/home/rosetta/archive/rosetta3/english/decommrules78.pf : /home/rosetta/archive/rosetta3/english/mrules78.out ;
 
/home/rosetta/archive/rosetta3/english/mrules78.out : /home/rosetta/archive/rosetta3/english/mrules78.mrule  \
                               /home/rosetta/archive/rosetta3/english/neededinmrules.pf;
	touch $(language)/target/mrules78.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules78
 
 
  
  
/home/rosetta/archive/rosetta3/english/commrules79.o  \
/home/rosetta/archive/rosetta3/english/decommrules79.o  \
/home/rosetta/archive/rosetta3/english/commrules79.pf  \
/home/rosetta/archive/rosetta3/english/decommrules79.pf : /home/rosetta/archive/rosetta3/english/mrules79.out ;
 
/home/rosetta/archive/rosetta3/english/mrules79.out : /home/rosetta/archive/rosetta3/english/mrules79.mrule  \
                               /home/rosetta/archive/rosetta3/english/neededinmrules.pf;
	touch $(language)/target/mrules79.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules79
 
 
  
/home/rosetta/archive/rosetta3/english/commrules80.o  \
/home/rosetta/archive/rosetta3/english/decommrules80.o  \
/home/rosetta/archive/rosetta3/english/commrules80.pf  \
/home/rosetta/archive/rosetta3/english/decommrules80.pf : /home/rosetta/archive/rosetta3/english/mrules80.out ;
 
/home/rosetta/archive/rosetta3/english/mrules80.out : /home/rosetta/archive/rosetta3/english/mrules80.mrule  \
                               /home/rosetta/archive/rosetta3/english/neededinmrules.pf;
	touch $(language)/target/mrules80.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules80
 
 
  
/home/rosetta/archive/rosetta3/english/commrules81.o  \
/home/rosetta/archive/rosetta3/english/decommrules81.o  \
/home/rosetta/archive/rosetta3/english/commrules81.pf  \
/home/rosetta/archive/rosetta3/english/decommrules81.pf : /home/rosetta/archive/rosetta3/english/mrules81.out ;
 
/home/rosetta/archive/rosetta3/english/mrules81.out : /home/rosetta/archive/rosetta3/english/mrules81.mrule  \
                               /home/rosetta/archive/rosetta3/english/neededinmrules.pf;
	touch $(language)/target/mrules81.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules81
 
 
  
/home/rosetta/archive/rosetta3/english/commrules82.o  \
/home/rosetta/archive/rosetta3/english/decommrules82.o  \
/home/rosetta/archive/rosetta3/english/commrules82.pf  \
/home/rosetta/archive/rosetta3/english/decommrules82.pf : /home/rosetta/archive/rosetta3/english/mrules82.out ;
 
/home/rosetta/archive/rosetta3/english/mrules82.out : /home/rosetta/archive/rosetta3/english/mrules82.mrule  \
                               /home/rosetta/archive/rosetta3/english/neededinmrules.pf;
	touch $(language)/target/mrules82.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules82
 
 
  
/home/rosetta/archive/rosetta3/english/commrules83.o  \
/home/rosetta/archive/rosetta3/english/decommrules83.o  \
/home/rosetta/archive/rosetta3/english/commrules83.pf  \
/home/rosetta/archive/rosetta3/english/decommrules83.pf : /home/rosetta/archive/rosetta3/english/mrules83.out ;
 
/home/rosetta/archive/rosetta3/english/mrules83.out : /home/rosetta/archive/rosetta3/english/mrules83.mrule  \
                               /home/rosetta/archive/rosetta3/english/neededinmrules.pf;
	touch $(language)/target/mrules83.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules83
 
 
  
/home/rosetta/archive/rosetta3/english/commrules84.o  \
/home/rosetta/archive/rosetta3/english/decommrules84.o  \
/home/rosetta/archive/rosetta3/english/commrules84.pf  \
/home/rosetta/archive/rosetta3/english/decommrules84.pf : /home/rosetta/archive/rosetta3/english/mrules84.out ;
 
/home/rosetta/archive/rosetta3/english/mrules84.out : /home/rosetta/archive/rosetta3/english/mrules84.mrule  \
                               /home/rosetta/archive/rosetta3/english/neededinmrules.pf;
	touch $(language)/target/mrules84.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules84
 
 
  
  
/home/rosetta/archive/rosetta3/english/commrules85.o  \
/home/rosetta/archive/rosetta3/english/decommrules85.o  \
/home/rosetta/archive/rosetta3/english/commrules85.pf  \
/home/rosetta/archive/rosetta3/english/decommrules85.pf : /home/rosetta/archive/rosetta3/english/mrules85.out ;
 
/home/rosetta/archive/rosetta3/english/mrules85.out : /home/rosetta/archive/rosetta3/english/mrules85.mrule  \
                               /home/rosetta/archive/rosetta3/english/neededinmrules.pf;
	touch $(language)/target/mrules85.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules85
 
 
  
/home/rosetta/archive/rosetta3/english/commrules86.o  \
/home/rosetta/archive/rosetta3/english/decommrules86.o  \
/home/rosetta/archive/rosetta3/english/commrules86.pf  \
/home/rosetta/archive/rosetta3/english/decommrules86.pf : /home/rosetta/archive/rosetta3/english/mrules86.out ;
 
/home/rosetta/archive/rosetta3/english/mrules86.out : /home/rosetta/archive/rosetta3/english/mrules86.mrule  \
                               /home/rosetta/archive/rosetta3/english/neededinmrules.pf;
	touch $(language)/target/mrules86.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules86
 
 
  
  
/home/rosetta/archive/rosetta3/english/commrules87.o  \
/home/rosetta/archive/rosetta3/english/decommrules87.o  \
/home/rosetta/archive/rosetta3/english/commrules87.pf  \
/home/rosetta/archive/rosetta3/english/decommrules87.pf : /home/rosetta/archive/rosetta3/english/mrules87.out ;
 
/home/rosetta/archive/rosetta3/english/mrules87.out : /home/rosetta/archive/rosetta3/english/mrules87.mrule  \
                               /home/rosetta/archive/rosetta3/english/neededinmrules.pf;
	touch $(language)/target/mrules87.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules87
 
 
  
/home/rosetta/archive/rosetta3/english/commrules88.o  \
/home/rosetta/archive/rosetta3/english/decommrules88.o  \
/home/rosetta/archive/rosetta3/english/commrules88.pf  \
/home/rosetta/archive/rosetta3/english/decommrules88.pf : /home/rosetta/archive/rosetta3/english/mrules88.out ;
 
/home/rosetta/archive/rosetta3/english/mrules88.out : /home/rosetta/archive/rosetta3/english/mrules88.mrule  \
                               /home/rosetta/archive/rosetta3/english/neededinmrules.pf;
	touch $(language)/target/mrules88.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules88
 
 
  
  
/home/rosetta/archive/rosetta3/english/commrules89.o  \
/home/rosetta/archive/rosetta3/english/decommrules89.o  \
/home/rosetta/archive/rosetta3/english/commrules89.pf  \
/home/rosetta/archive/rosetta3/english/decommrules89.pf : /home/rosetta/archive/rosetta3/english/mrules89.out ;
 
/home/rosetta/archive/rosetta3/english/mrules89.out : /home/rosetta/archive/rosetta3/english/mrules89.mrule  \
                               /home/rosetta/archive/rosetta3/english/neededinmrules.pf;
	touch $(language)/target/mrules89.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules89
 
 
  
/home/rosetta/archive/rosetta3/english/commrules90.o  \
/home/rosetta/archive/rosetta3/english/decommrules90.o  \
/home/rosetta/archive/rosetta3/english/commrules90.pf  \
/home/rosetta/archive/rosetta3/english/decommrules90.pf : /home/rosetta/archive/rosetta3/english/mrules90.out ;
 
/home/rosetta/archive/rosetta3/english/mrules90.out : /home/rosetta/archive/rosetta3/english/mrules90.mrule  \
                               /home/rosetta/archive/rosetta3/english/neededinmrules.pf;
	touch $(language)/target/mrules90.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules90
 
 
  
/home/rosetta/archive/rosetta3/english/commrules91.o  \
/home/rosetta/archive/rosetta3/english/decommrules91.o  \
/home/rosetta/archive/rosetta3/english/commrules91.pf  \
/home/rosetta/archive/rosetta3/english/decommrules91.pf : /home/rosetta/archive/rosetta3/english/mrules91.out ;
 
/home/rosetta/archive/rosetta3/english/mrules91.out : /home/rosetta/archive/rosetta3/english/mrules91.mrule  \
                               /home/rosetta/archive/rosetta3/english/neededinmrules.pf;
	touch $(language)/target/mrules91.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules91
 
 
  
/home/rosetta/archive/rosetta3/english/commrules92.o  \
/home/rosetta/archive/rosetta3/english/decommrules92.o  \
/home/rosetta/archive/rosetta3/english/commrules92.pf  \
/home/rosetta/archive/rosetta3/english/decommrules92.pf : /home/rosetta/archive/rosetta3/english/mrules92.out ;
 
/home/rosetta/archive/rosetta3/english/mrules92.out : /home/rosetta/archive/rosetta3/english/mrules92.mrule  \
                               /home/rosetta/archive/rosetta3/english/neededinmrules.pf;
	touch $(language)/target/mrules92.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules92
 
 
  
/home/rosetta/archive/rosetta3/english/commrules93.o  \
/home/rosetta/archive/rosetta3/english/decommrules93.o  \
/home/rosetta/archive/rosetta3/english/commrules93.pf  \
/home/rosetta/archive/rosetta3/english/decommrules93.pf : /home/rosetta/archive/rosetta3/english/mrules93.out ;
 
/home/rosetta/archive/rosetta3/english/mrules93.out : /home/rosetta/archive/rosetta3/english/mrules93.mrule  \
                               /home/rosetta/archive/rosetta3/english/neededinmrules.pf;
	touch $(language)/target/mrules93.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules93
 
 
  
/home/rosetta/archive/rosetta3/english/commrules94.o  \
/home/rosetta/archive/rosetta3/english/decommrules94.o  \
/home/rosetta/archive/rosetta3/english/commrules94.pf  \
/home/rosetta/archive/rosetta3/english/decommrules94.pf : /home/rosetta/archive/rosetta3/english/mrules94.out ;
 
/home/rosetta/archive/rosetta3/english/mrules94.out : /home/rosetta/archive/rosetta3/english/mrules94.mrule  \
                               /home/rosetta/archive/rosetta3/english/neededinmrules.pf;
	touch $(language)/target/mrules94.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules94
 
 
  
  
/home/rosetta/archive/rosetta3/english/commrules95.o  \
/home/rosetta/archive/rosetta3/english/decommrules95.o  \
/home/rosetta/archive/rosetta3/english/commrules95.pf  \
/home/rosetta/archive/rosetta3/english/decommrules95.pf : /home/rosetta/archive/rosetta3/english/mrules95.out ;
 
/home/rosetta/archive/rosetta3/english/mrules95.out : /home/rosetta/archive/rosetta3/english/mrules95.mrule  \
                               /home/rosetta/archive/rosetta3/english/neededinmrules.pf;
	touch $(language)/target/mrules95.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules95
 
 
  
/home/rosetta/archive/rosetta3/english/commrules96.o  \
/home/rosetta/archive/rosetta3/english/decommrules96.o  \
/home/rosetta/archive/rosetta3/english/commrules96.pf  \
/home/rosetta/archive/rosetta3/english/decommrules96.pf : /home/rosetta/archive/rosetta3/english/mrules96.out ;
 
/home/rosetta/archive/rosetta3/english/mrules96.out : /home/rosetta/archive/rosetta3/english/mrules96.mrule  \
                               /home/rosetta/archive/rosetta3/english/neededinmrules.pf;
	touch $(language)/target/mrules96.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules96
 
 
  
  
/home/rosetta/archive/rosetta3/english/commrules97.o  \
/home/rosetta/archive/rosetta3/english/decommrules97.o  \
/home/rosetta/archive/rosetta3/english/commrules97.pf  \
/home/rosetta/archive/rosetta3/english/decommrules97.pf : /home/rosetta/archive/rosetta3/english/mrules97.out ;
 
/home/rosetta/archive/rosetta3/english/mrules97.out : /home/rosetta/archive/rosetta3/english/mrules97.mrule  \
                               /home/rosetta/archive/rosetta3/english/neededinmrules.pf;
	touch $(language)/target/mrules97.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules97
 
 
  
/home/rosetta/archive/rosetta3/english/commrules98.o  \
/home/rosetta/archive/rosetta3/english/decommrules98.o  \
/home/rosetta/archive/rosetta3/english/commrules98.pf  \
/home/rosetta/archive/rosetta3/english/decommrules98.pf : /home/rosetta/archive/rosetta3/english/mrules98.out ;
 
/home/rosetta/archive/rosetta3/english/mrules98.out : /home/rosetta/archive/rosetta3/english/mrules98.mrule  \
                               /home/rosetta/archive/rosetta3/english/neededinmrules.pf;
	touch $(language)/target/mrules98.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules98
 
 
  
/home/rosetta/archive/rosetta3/english/commrules99.o  \
/home/rosetta/archive/rosetta3/english/decommrules99.o  \
/home/rosetta/archive/rosetta3/english/commrules99.pf  \
/home/rosetta/archive/rosetta3/english/decommrules99.pf : /home/rosetta/archive/rosetta3/english/mrules99.out ;
 
/home/rosetta/archive/rosetta3/english/mrules99.out : /home/rosetta/archive/rosetta3/english/mrules99.mrule  \
                               /home/rosetta/archive/rosetta3/english/neededinmrules.pf;
	touch $(language)/target/mrules99.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules99
 
 
  
/home/rosetta/archive/rosetta3/english/commrules100.o  \
/home/rosetta/archive/rosetta3/english/decommrules100.o  \
/home/rosetta/archive/rosetta3/english/commrules100.pf  \
/home/rosetta/archive/rosetta3/english/decommrules100.pf : /home/rosetta/archive/rosetta3/english/mrules100.out ;
 
/home/rosetta/archive/rosetta3/english/mrules100.out : /home/rosetta/archive/rosetta3/english/mrules100.mrule  \
                               /home/rosetta/archive/rosetta3/english/neededinmrules.pf;
	touch $(language)/target/mrules100.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules100
 
 
  
/home/rosetta/archive/rosetta3/english/commrules101.o  \
/home/rosetta/archive/rosetta3/english/decommrules101.o  \
/home/rosetta/archive/rosetta3/english/commrules101.pf  \
/home/rosetta/archive/rosetta3/english/decommrules101.pf : /home/rosetta/archive/rosetta3/english/mrules101.out ;
 
/home/rosetta/archive/rosetta3/english/mrules101.out : /home/rosetta/archive/rosetta3/english/mrules101.mrule  \
                               /home/rosetta/archive/rosetta3/english/neededinmrules.pf;
	touch $(language)/target/mrules101.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules101
 
 
  
/home/rosetta/archive/rosetta3/english/commrules102.o  \
/home/rosetta/archive/rosetta3/english/decommrules102.o  \
/home/rosetta/archive/rosetta3/english/commrules102.pf  \
/home/rosetta/archive/rosetta3/english/decommrules102.pf : /home/rosetta/archive/rosetta3/english/mrules102.out ;
 
/home/rosetta/archive/rosetta3/english/mrules102.out : /home/rosetta/archive/rosetta3/english/mrules102.mrule  \
                               /home/rosetta/archive/rosetta3/english/neededinmrules.pf;
	touch $(language)/target/mrules102.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules102
 
 
  
/home/rosetta/archive/rosetta3/english/commrules103.o  \
/home/rosetta/archive/rosetta3/english/decommrules103.o  \
/home/rosetta/archive/rosetta3/english/commrules103.pf  \
/home/rosetta/archive/rosetta3/english/decommrules103.pf : /home/rosetta/archive/rosetta3/english/mrules103.out ;
 
/home/rosetta/archive/rosetta3/english/mrules103.out : /home/rosetta/archive/rosetta3/english/mrules103.mrule  \
                               /home/rosetta/archive/rosetta3/english/neededinmrules.pf;
	touch $(language)/target/mrules103.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules103
 
 
  
/home/rosetta/archive/rosetta3/english/commrules104.o  \
/home/rosetta/archive/rosetta3/english/decommrules104.o  \
/home/rosetta/archive/rosetta3/english/commrules104.pf  \
/home/rosetta/archive/rosetta3/english/decommrules104.pf : /home/rosetta/archive/rosetta3/english/mrules104.out ;
 
/home/rosetta/archive/rosetta3/english/mrules104.out : /home/rosetta/archive/rosetta3/english/mrules104.mrule  \
                               /home/rosetta/archive/rosetta3/english/neededinmrules.pf;
	touch $(language)/target/mrules104.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules104
 
 
  
  
/home/rosetta/archive/rosetta3/english/commrules105.o  \
/home/rosetta/archive/rosetta3/english/decommrules105.o  \
/home/rosetta/archive/rosetta3/english/commrules105.pf  \
/home/rosetta/archive/rosetta3/english/decommrules105.pf : /home/rosetta/archive/rosetta3/english/mrules105.out ;
 
/home/rosetta/archive/rosetta3/english/mrules105.out : /home/rosetta/archive/rosetta3/english/mrules105.mrule  \
                               /home/rosetta/archive/rosetta3/english/neededinmrules.pf;
	touch $(language)/target/mrules105.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules105
 
 
  
/home/rosetta/archive/rosetta3/english/commrules106.o  \
/home/rosetta/archive/rosetta3/english/decommrules106.o  \
/home/rosetta/archive/rosetta3/english/commrules106.pf  \
/home/rosetta/archive/rosetta3/english/decommrules106.pf : /home/rosetta/archive/rosetta3/english/mrules106.out ;
 
/home/rosetta/archive/rosetta3/english/mrules106.out : /home/rosetta/archive/rosetta3/english/mrules106.mrule  \
                               /home/rosetta/archive/rosetta3/english/neededinmrules.pf;
	touch $(language)/target/mrules106.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules106
 
 
  
#!!  
#!! idiom file 107, treated somewhat differently, see above   
#!!  
  
/home/rosetta/archive/rosetta3/english/commrules107.pf : /home/rosetta/archive/rosetta3/english/mrules107.mrule  \
                               /home/rosetta/archive/rosetta3/english/neededinmrules.pf;
	@/home/rosetta/archive/rosetta3/actions/mru $(language) mrules107
 
 
  
/home/rosetta/archive/rosetta3/english/commrules107.o  \
/home/rosetta/archive/rosetta3/english/decommrules107.o  \
/home/rosetta/archive/rosetta3/english/decommrules107.pf : /home/rosetta/archive/rosetta3/english/mrules107.out ;
 
/home/rosetta/archive/rosetta3/english/mrules107.out : /home/rosetta/archive/rosetta3/english/mrules107.mrule  \
                               /home/rosetta/archive/rosetta3/english/neededinmrules.pf;
	touch $(language)/target/mrules107.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules107
 
 
  
/home/rosetta/archive/rosetta3/english/commrules108.o  \
/home/rosetta/archive/rosetta3/english/decommrules108.o  \
/home/rosetta/archive/rosetta3/english/commrules108.pf  \
/home/rosetta/archive/rosetta3/english/decommrules108.pf : /home/rosetta/archive/rosetta3/english/mrules108.out ;
 
/home/rosetta/archive/rosetta3/english/mrules108.out : /home/rosetta/archive/rosetta3/english/mrules108.mrule  \
                               /home/rosetta/archive/rosetta3/english/neededinmrules.pf;
	touch $(language)/target/mrules108.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules108
 
 
  
/home/rosetta/archive/rosetta3/english/commrules109.o  \
/home/rosetta/archive/rosetta3/english/decommrules109.o  \
/home/rosetta/archive/rosetta3/english/commrules109.pf  \
/home/rosetta/archive/rosetta3/english/decommrules109.pf : /home/rosetta/archive/rosetta3/english/mrules109.out ;
 
/home/rosetta/archive/rosetta3/english/mrules109.out : /home/rosetta/archive/rosetta3/english/mrules109.mrule  \
                               /home/rosetta/archive/rosetta3/english/neededinmrules.pf;
	touch $(language)/target/mrules109.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules109
 
 
  
/home/rosetta/archive/rosetta3/english/commrules110.o  \
/home/rosetta/archive/rosetta3/english/decommrules110.o  \
/home/rosetta/archive/rosetta3/english/commrules110.pf  \
/home/rosetta/archive/rosetta3/english/decommrules110.pf : /home/rosetta/archive/rosetta3/english/mrules110.out ;
 
/home/rosetta/archive/rosetta3/english/mrules110.out : /home/rosetta/archive/rosetta3/english/mrules110.mrule  \
                               /home/rosetta/archive/rosetta3/english/neededinmrules.pf;
	touch $(language)/target/mrules110.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules110
 
 
  
/home/rosetta/archive/rosetta3/english/commrules111.o  \
/home/rosetta/archive/rosetta3/english/decommrules111.o  \
/home/rosetta/archive/rosetta3/english/commrules111.pf  \
/home/rosetta/archive/rosetta3/english/decommrules111.pf : /home/rosetta/archive/rosetta3/english/mrules111.out ;
 
/home/rosetta/archive/rosetta3/english/mrules111.out : /home/rosetta/archive/rosetta3/english/mrules111.mrule  \
                               /home/rosetta/archive/rosetta3/english/neededinmrules.pf;
	touch $(language)/target/mrules111.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules111
 
 
  
/home/rosetta/archive/rosetta3/english/commrules112.o  \
/home/rosetta/archive/rosetta3/english/decommrules112.o  \
/home/rosetta/archive/rosetta3/english/commrules112.pf  \
/home/rosetta/archive/rosetta3/english/decommrules112.pf : /home/rosetta/archive/rosetta3/english/mrules112.out ;
 
/home/rosetta/archive/rosetta3/english/mrules112.out : /home/rosetta/archive/rosetta3/english/mrules112.mrule  \
                               /home/rosetta/archive/rosetta3/english/neededinmrules.pf;
	touch $(language)/target/mrules112.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules112
 
 
  
/home/rosetta/archive/rosetta3/english/commrules113.o  \
/home/rosetta/archive/rosetta3/english/decommrules113.o  \
/home/rosetta/archive/rosetta3/english/commrules113.pf  \
/home/rosetta/archive/rosetta3/english/decommrules113.pf : /home/rosetta/archive/rosetta3/english/mrules113.out ;
 
/home/rosetta/archive/rosetta3/english/mrules113.out : /home/rosetta/archive/rosetta3/english/mrules113.mrule  \
                               /home/rosetta/archive/rosetta3/english/neededinmrules.pf;
	touch $(language)/target/mrules113.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules113
 
 
  
/home/rosetta/archive/rosetta3/english/commrules114.o  \
/home/rosetta/archive/rosetta3/english/decommrules114.o  \
/home/rosetta/archive/rosetta3/english/commrules114.pf  \
/home/rosetta/archive/rosetta3/english/decommrules114.pf : /home/rosetta/archive/rosetta3/english/mrules114.out ;
 
/home/rosetta/archive/rosetta3/english/mrules114.out : /home/rosetta/archive/rosetta3/english/mrules114.mrule  \
                               /home/rosetta/archive/rosetta3/english/neededinmrules.pf;
	touch $(language)/target/mrules114.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules114
 
 
  
  
/home/rosetta/archive/rosetta3/english/commrules115.o  \
/home/rosetta/archive/rosetta3/english/decommrules115.o  \
/home/rosetta/archive/rosetta3/english/commrules115.pf  \
/home/rosetta/archive/rosetta3/english/decommrules115.pf : /home/rosetta/archive/rosetta3/english/mrules115.out ;
 
/home/rosetta/archive/rosetta3/english/mrules115.out : /home/rosetta/archive/rosetta3/english/mrules115.mrule  \
                               /home/rosetta/archive/rosetta3/english/neededinmrules.pf;
	touch $(language)/target/mrules115.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules115
 
 
  
/home/rosetta/archive/rosetta3/english/commrules116.o  \
/home/rosetta/archive/rosetta3/english/decommrules116.o  \
/home/rosetta/archive/rosetta3/english/commrules116.pf  \
/home/rosetta/archive/rosetta3/english/decommrules116.pf : /home/rosetta/archive/rosetta3/english/mrules116.out ;
 
/home/rosetta/archive/rosetta3/english/mrules116.out : /home/rosetta/archive/rosetta3/english/mrules116.mrule  \
                               /home/rosetta/archive/rosetta3/english/neededinmrules.pf;
	touch $(language)/target/mrules116.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules116
 
 
  
#!!  
#!! idiom file 117, treated somewhat differently, see above   
#!!  
  
/home/rosetta/archive/rosetta3/english/commrules117.pf : /home/rosetta/archive/rosetta3/english/mrules117.mrule  \
                               /home/rosetta/archive/rosetta3/english/neededinmrules.pf;
	@/home/rosetta/archive/rosetta3/actions/mru $(language) mrules117
 
 
  
/home/rosetta/archive/rosetta3/english/commrules117.o  \
/home/rosetta/archive/rosetta3/english/decommrules117.o  \
/home/rosetta/archive/rosetta3/english/decommrules117.pf : /home/rosetta/archive/rosetta3/english/mrules117.out ;
 
/home/rosetta/archive/rosetta3/english/mrules117.out : /home/rosetta/archive/rosetta3/english/mrules117.mrule  \
                               /home/rosetta/archive/rosetta3/english/neededinmrules.pf;
	touch $(language)/target/mrules117.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules117
 
 
  
/home/rosetta/archive/rosetta3/english/commrules118.o  \
/home/rosetta/archive/rosetta3/english/decommrules118.o  \
/home/rosetta/archive/rosetta3/english/commrules118.pf  \
/home/rosetta/archive/rosetta3/english/decommrules118.pf : /home/rosetta/archive/rosetta3/english/mrules118.out ;
 
/home/rosetta/archive/rosetta3/english/mrules118.out : /home/rosetta/archive/rosetta3/english/mrules118.mrule  \
                               /home/rosetta/archive/rosetta3/english/neededinmrules.pf;
	touch $(language)/target/mrules118.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules118
 
 
  
/home/rosetta/archive/rosetta3/english/commrules119.o  \
/home/rosetta/archive/rosetta3/english/decommrules119.o  \
/home/rosetta/archive/rosetta3/english/commrules119.pf  \
/home/rosetta/archive/rosetta3/english/decommrules119.pf : /home/rosetta/archive/rosetta3/english/mrules119.out ;
 
/home/rosetta/archive/rosetta3/english/mrules119.out : /home/rosetta/archive/rosetta3/english/mrules119.mrule  \
                               /home/rosetta/archive/rosetta3/english/neededinmrules.pf;
	touch $(language)/target/mrules119.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules119
 
 
  
/home/rosetta/archive/rosetta3/english/commrules120.o  \
/home/rosetta/archive/rosetta3/english/decommrules120.o  \
/home/rosetta/archive/rosetta3/english/commrules120.pf  \
/home/rosetta/archive/rosetta3/english/decommrules120.pf : /home/rosetta/archive/rosetta3/english/mrules120.out ;
 
/home/rosetta/archive/rosetta3/english/mrules120.out : /home/rosetta/archive/rosetta3/english/mrules120.mrule  \
                               /home/rosetta/archive/rosetta3/english/neededinmrules.pf;
	touch $(language)/target/mrules120.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules120
 
 
  
/home/rosetta/archive/rosetta3/english/commrules121.o  \
/home/rosetta/archive/rosetta3/english/decommrules121.o  \
/home/rosetta/archive/rosetta3/english/commrules121.pf  \
/home/rosetta/archive/rosetta3/english/decommrules121.pf : /home/rosetta/archive/rosetta3/english/mrules121.out ;
 
/home/rosetta/archive/rosetta3/english/mrules121.out : /home/rosetta/archive/rosetta3/english/mrules121.mrule  \
                               /home/rosetta/archive/rosetta3/english/neededinmrules.pf;
	touch $(language)/target/mrules121.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules121
 
 
  
/home/rosetta/archive/rosetta3/english/commrules122.o  \
/home/rosetta/archive/rosetta3/english/decommrules122.o  \
/home/rosetta/archive/rosetta3/english/commrules122.pf  \
/home/rosetta/archive/rosetta3/english/decommrules122.pf : /home/rosetta/archive/rosetta3/english/mrules122.out ;
 
/home/rosetta/archive/rosetta3/english/mrules122.out : /home/rosetta/archive/rosetta3/english/mrules122.mrule  \
                               /home/rosetta/archive/rosetta3/english/neededinmrules.pf;
	touch $(language)/target/mrules122.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules122
 
 
  
/home/rosetta/archive/rosetta3/english/commrules123.o  \
/home/rosetta/archive/rosetta3/english/decommrules123.o  \
/home/rosetta/archive/rosetta3/english/commrules123.pf  \
/home/rosetta/archive/rosetta3/english/decommrules123.pf : /home/rosetta/archive/rosetta3/english/mrules123.out ;
 
/home/rosetta/archive/rosetta3/english/mrules123.out : /home/rosetta/archive/rosetta3/english/mrules123.mrule  \
                               /home/rosetta/archive/rosetta3/english/neededinmrules.pf;
	touch $(language)/target/mrules123.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules123
 
 
  
/home/rosetta/archive/rosetta3/english/commrules124.o  \
/home/rosetta/archive/rosetta3/english/decommrules124.o  \
/home/rosetta/archive/rosetta3/english/commrules124.pf  \
/home/rosetta/archive/rosetta3/english/decommrules124.pf : /home/rosetta/archive/rosetta3/english/mrules124.out ;
 
/home/rosetta/archive/rosetta3/english/mrules124.out : /home/rosetta/archive/rosetta3/english/mrules124.mrule  \
                               /home/rosetta/archive/rosetta3/english/neededinmrules.pf;
	touch $(language)/target/mrules124.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules124
 
 
  
  
/home/rosetta/archive/rosetta3/english/commrules125.o  \
/home/rosetta/archive/rosetta3/english/decommrules125.o  \
/home/rosetta/archive/rosetta3/english/commrules125.pf  \
/home/rosetta/archive/rosetta3/english/decommrules125.pf : /home/rosetta/archive/rosetta3/english/mrules125.out ;
 
/home/rosetta/archive/rosetta3/english/mrules125.out : /home/rosetta/archive/rosetta3/english/mrules125.mrule  \
                               /home/rosetta/archive/rosetta3/english/neededinmrules.pf;
	touch $(language)/target/mrules125.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules125
 
 
  
/home/rosetta/archive/rosetta3/english/commrules126.o  \
/home/rosetta/archive/rosetta3/english/decommrules126.o  \
/home/rosetta/archive/rosetta3/english/commrules126.pf  \
/home/rosetta/archive/rosetta3/english/decommrules126.pf : /home/rosetta/archive/rosetta3/english/mrules126.out ;
 
/home/rosetta/archive/rosetta3/english/mrules126.out : /home/rosetta/archive/rosetta3/english/mrules126.mrule  \
                               /home/rosetta/archive/rosetta3/english/neededinmrules.pf;
	touch $(language)/target/mrules126.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules126
 
 
  
/home/rosetta/archive/rosetta3/english/commrules127.o  \
/home/rosetta/archive/rosetta3/english/decommrules127.o  \
/home/rosetta/archive/rosetta3/english/commrules127.pf  \
/home/rosetta/archive/rosetta3/english/decommrules127.pf : /home/rosetta/archive/rosetta3/english/mrules127.out ;
 
/home/rosetta/archive/rosetta3/english/mrules127.out : /home/rosetta/archive/rosetta3/english/mrules127.mrule  \
                               /home/rosetta/archive/rosetta3/english/neededinmrules.pf;
	touch $(language)/target/mrules127.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules127
 
 
  
/home/rosetta/archive/rosetta3/english/commrules128.o  \
/home/rosetta/archive/rosetta3/english/decommrules128.o  \
/home/rosetta/archive/rosetta3/english/commrules128.pf  \
/home/rosetta/archive/rosetta3/english/decommrules128.pf : /home/rosetta/archive/rosetta3/english/mrules128.out ;
 
/home/rosetta/archive/rosetta3/english/mrules128.out : /home/rosetta/archive/rosetta3/english/mrules128.mrule  \
                               /home/rosetta/archive/rosetta3/english/neededinmrules.pf;
	touch $(language)/target/mrules128.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules128
 
 
  
/home/rosetta/archive/rosetta3/english/commrules129.o  \
/home/rosetta/archive/rosetta3/english/decommrules129.o  \
/home/rosetta/archive/rosetta3/english/commrules129.pf  \
/home/rosetta/archive/rosetta3/english/decommrules129.pf : /home/rosetta/archive/rosetta3/english/mrules129.out ;
 
/home/rosetta/archive/rosetta3/english/mrules129.out : /home/rosetta/archive/rosetta3/english/mrules129.mrule  \
                               /home/rosetta/archive/rosetta3/english/neededinmrules.pf;
	touch $(language)/target/mrules129.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules129
 
 
  
/home/rosetta/archive/rosetta3/english/commrules130.o  \
/home/rosetta/archive/rosetta3/english/decommrules130.o  \
/home/rosetta/archive/rosetta3/english/commrules130.pf  \
/home/rosetta/archive/rosetta3/english/decommrules130.pf : /home/rosetta/archive/rosetta3/english/mrules130.out ;
 
/home/rosetta/archive/rosetta3/english/mrules130.out : /home/rosetta/archive/rosetta3/english/mrules130.mrule  \
                               /home/rosetta/archive/rosetta3/english/neededinmrules.pf;
	touch $(language)/target/mrules130.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules130
 
 
  
/home/rosetta/archive/rosetta3/english/commrules131.o  \
/home/rosetta/archive/rosetta3/english/decommrules131.o  \
/home/rosetta/archive/rosetta3/english/commrules131.pf  \
/home/rosetta/archive/rosetta3/english/decommrules131.pf : /home/rosetta/archive/rosetta3/english/mrules131.out ;
 
/home/rosetta/archive/rosetta3/english/mrules131.out : /home/rosetta/archive/rosetta3/english/mrules131.mrule  \
                               /home/rosetta/archive/rosetta3/english/neededinmrules.pf;
	touch $(language)/target/mrules131.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules131
 
 
  
/home/rosetta/archive/rosetta3/english/commrules132.o  \
/home/rosetta/archive/rosetta3/english/decommrules132.o  \
/home/rosetta/archive/rosetta3/english/commrules132.pf  \
/home/rosetta/archive/rosetta3/english/decommrules132.pf : /home/rosetta/archive/rosetta3/english/mrules132.out ;
 
/home/rosetta/archive/rosetta3/english/mrules132.out : /home/rosetta/archive/rosetta3/english/mrules132.mrule  \
                               /home/rosetta/archive/rosetta3/english/neededinmrules.pf;
	touch $(language)/target/mrules132.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules132
 
 
  
/home/rosetta/archive/rosetta3/english/commrules133.o  \
/home/rosetta/archive/rosetta3/english/decommrules133.o  \
/home/rosetta/archive/rosetta3/english/commrules133.pf  \
/home/rosetta/archive/rosetta3/english/decommrules133.pf : /home/rosetta/archive/rosetta3/english/mrules133.out ;
 
/home/rosetta/archive/rosetta3/english/mrules133.out : /home/rosetta/archive/rosetta3/english/mrules133.mrule  \
                               /home/rosetta/archive/rosetta3/english/neededinmrules.pf;
	touch $(language)/target/mrules133.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules133
 
 
  
/home/rosetta/archive/rosetta3/english/commrules134.o  \
/home/rosetta/archive/rosetta3/english/decommrules134.o  \
/home/rosetta/archive/rosetta3/english/commrules134.pf  \
/home/rosetta/archive/rosetta3/english/decommrules134.pf : /home/rosetta/archive/rosetta3/english/mrules134.out ;
 
/home/rosetta/archive/rosetta3/english/mrules134.out : /home/rosetta/archive/rosetta3/english/mrules134.mrule  \
                               /home/rosetta/archive/rosetta3/english/neededinmrules.pf;
	touch $(language)/target/mrules134.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules134
 
 
  
  
/home/rosetta/archive/rosetta3/english/commrules135.o  \
/home/rosetta/archive/rosetta3/english/decommrules135.o  \
/home/rosetta/archive/rosetta3/english/commrules135.pf  \
/home/rosetta/archive/rosetta3/english/decommrules135.pf : /home/rosetta/archive/rosetta3/english/mrules135.out ;
 
/home/rosetta/archive/rosetta3/english/mrules135.out : /home/rosetta/archive/rosetta3/english/mrules135.mrule  \
                               /home/rosetta/archive/rosetta3/english/neededinmrules.pf;
	touch $(language)/target/mrules135.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules135
 
 
  
/home/rosetta/archive/rosetta3/english/commrules136.o  \
/home/rosetta/archive/rosetta3/english/decommrules136.o  \
/home/rosetta/archive/rosetta3/english/commrules136.pf  \
/home/rosetta/archive/rosetta3/english/decommrules136.pf : /home/rosetta/archive/rosetta3/english/mrules136.out ;
 
/home/rosetta/archive/rosetta3/english/mrules136.out : /home/rosetta/archive/rosetta3/english/mrules136.mrule  \
                               /home/rosetta/archive/rosetta3/english/neededinmrules.pf;
	touch $(language)/target/mrules136.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules136
 
 
  
/home/rosetta/archive/rosetta3/english/commrules137.o  \
/home/rosetta/archive/rosetta3/english/decommrules137.o  \
/home/rosetta/archive/rosetta3/english/commrules137.pf  \
/home/rosetta/archive/rosetta3/english/decommrules137.pf : /home/rosetta/archive/rosetta3/english/mrules137.out ;
 
/home/rosetta/archive/rosetta3/english/mrules137.out : /home/rosetta/archive/rosetta3/english/mrules137.mrule  \
                               /home/rosetta/archive/rosetta3/english/neededinmrules.pf;
	touch $(language)/target/mrules137.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules137
 
 
  
/home/rosetta/archive/rosetta3/english/commrules138.o  \
/home/rosetta/archive/rosetta3/english/decommrules138.o  \
/home/rosetta/archive/rosetta3/english/commrules138.pf  \
/home/rosetta/archive/rosetta3/english/decommrules138.pf : /home/rosetta/archive/rosetta3/english/mrules138.out ;
 
/home/rosetta/archive/rosetta3/english/mrules138.out : /home/rosetta/archive/rosetta3/english/mrules138.mrule  \
                               /home/rosetta/archive/rosetta3/english/neededinmrules.pf;
	touch $(language)/target/mrules138.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules138
 
 
  
/home/rosetta/archive/rosetta3/english/commrules139.o  \
/home/rosetta/archive/rosetta3/english/decommrules139.o  \
/home/rosetta/archive/rosetta3/english/commrules139.pf  \
/home/rosetta/archive/rosetta3/english/decommrules139.pf : /home/rosetta/archive/rosetta3/english/mrules139.out ;
 
/home/rosetta/archive/rosetta3/english/mrules139.out : /home/rosetta/archive/rosetta3/english/mrules139.mrule  \
                               /home/rosetta/archive/rosetta3/english/neededinmrules.pf;
	touch $(language)/target/mrules139.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules139
 
 
  
/home/rosetta/archive/rosetta3/english/commrules140.o  \
/home/rosetta/archive/rosetta3/english/decommrules140.o  \
/home/rosetta/archive/rosetta3/english/commrules140.pf  \
/home/rosetta/archive/rosetta3/english/decommrules140.pf : /home/rosetta/archive/rosetta3/english/mrules140.out ;
 
/home/rosetta/archive/rosetta3/english/mrules140.out : /home/rosetta/archive/rosetta3/english/mrules140.mrule  \
                               /home/rosetta/archive/rosetta3/english/neededinmrules.pf;
	touch $(language)/target/mrules140.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules140
 
 
  
#---removed from dependencies of neededinmrules.pf:  
#                            $(language)/maket.pf  \ 
#                            $(language)/copyt.pf  \ 
#                            $(language)/lsauxdom.pf  \ 
#                            $(language)/lsmruquo.pf  \ 
#                            general/lsmatches.pf  \ 
#                            general/mem.pf  \ 
#                            general/listree.pf  \ 
#                            general/lidomaint.pf  \ 
#                            general/lsstree.pf  \ 
#                            general/aidderiv.pf \ 
#                            $(language)/mrucom.exe  \ 
#                            general/gidderiv.pf  \ 
#                            general/gidderiv.pf  \ 
#                            general/aidderiv.pf  \ 
#                            general/lsmatches.pf  \ 
#                            general/strtokey.pf  \ 
#                            general/ldblex.pf  \ 
 
# the next line was removed from the dependency below at 16 oct 1992 in order 
# to prevent the recompilation of all english mrules. 
# 
#                            $(language)/mrucom.exe  \ 
  
/home/rosetta/archive/rosetta3/english/neededinmrules.pf : /home/rosetta/archive/rosetta3/english/maket.pf  \
                            /home/rosetta/archive/rosetta3/english/copyt.pf  \
                            /home/rosetta/archive/rosetta3/english/lsauxdom.pf  \
                            /home/rosetta/archive/rosetta3/english/lsmruquo.pf  \
                            /home/rosetta/archive/rosetta3/general/lsmatches.pf  \
                            /home/rosetta/archive/rosetta3/general/mem.pf  \
                            /home/rosetta/archive/rosetta3/general/listree.pf  \
                            /home/rosetta/archive/rosetta3/general/lidomaint.pf  \
                            /home/rosetta/archive/rosetta3/general/lsstree.pf  \
                            /home/rosetta/archive/rosetta3/general/aidderiv.pf \
                            /home/rosetta/archive/rosetta3/general/gidderiv.pf  \
                            /home/rosetta/archive/rosetta3/general/gidderiv.pf  \
                            /home/rosetta/archive/rosetta3/general/aidderiv.pf  \
                            /home/rosetta/archive/rosetta3/general/lsmatches.pf  \
                            /home/rosetta/archive/rosetta3/general/strtokey.pf  \
                            /home/rosetta/archive/rosetta3/general/ldblex.pf  \
                            /home/rosetta/archive/rosetta3/general/limatches.pf;
	@echo "empty" > $(language)/target/neededinmrules.pf
  
 
#!!!!!!!!!!!!!!!!!!!!!!!!  
  
#!! --------------segmentation data files------------------------------  
  
/home/rosetta/archive/rosetta3/english/gsuffix.svo \
/home/rosetta/archive/rosetta3/english/gsuffix.svs \
/home/rosetta/archive/rosetta3/english/gsuffix.sco \
/home/rosetta/archive/rosetta3/english/gsuffix.sso \
/home/rosetta/archive/rosetta3/english/gsuffix.sro \
/home/rosetta/archive/rosetta3/english/asuffix.svs \
/home/rosetta/archive/rosetta3/english/asuffix.svo \
/home/rosetta/archive/rosetta3/english/asuffix.sco \
/home/rosetta/archive/rosetta3/english/asuffix.sso \
/home/rosetta/archive/rosetta3/english/asuffix.sro : /home/rosetta/archive/rosetta3/english/suffix.seg \
                          /home/rosetta/archive/rosetta3/english/asegcom.exe \
                          /home/rosetta/archive/rosetta3/english/gsegcom.exe;
	@/home/rosetta/archive/rosetta3/actions/seg $(language) suffix
  
/home/rosetta/archive/rosetta3/english/gprefix.svo \
/home/rosetta/archive/rosetta3/english/gprefix.svs \
/home/rosetta/archive/rosetta3/english/gprefix.sco \
/home/rosetta/archive/rosetta3/english/gprefix.sso \
/home/rosetta/archive/rosetta3/english/gprefix.sro \
/home/rosetta/archive/rosetta3/english/aprefix.svs \
/home/rosetta/archive/rosetta3/english/aprefix.svo \
/home/rosetta/archive/rosetta3/english/aprefix.sco \
/home/rosetta/archive/rosetta3/english/aprefix.sso \
/home/rosetta/archive/rosetta3/english/aprefix.sro : /home/rosetta/archive/rosetta3/english/prefix.seg \
                          /home/rosetta/archive/rosetta3/english/asegcom.exe \
                          /home/rosetta/archive/rosetta3/english/gsegcom.exe;
	@/home/rosetta/archive/rosetta3/actions/seg $(language) prefix
  
/home/rosetta/archive/rosetta3/english/glglue.svo \
/home/rosetta/archive/rosetta3/english/glglue.svs \
/home/rosetta/archive/rosetta3/english/glglue.sco \
/home/rosetta/archive/rosetta3/english/glglue.sso \
/home/rosetta/archive/rosetta3/english/glglue.sro \
/home/rosetta/archive/rosetta3/english/alglue.svo \
/home/rosetta/archive/rosetta3/english/alglue.svs \
/home/rosetta/archive/rosetta3/english/alglue.sco \
/home/rosetta/archive/rosetta3/english/alglue.sso \
/home/rosetta/archive/rosetta3/english/alglue.sro : /home/rosetta/archive/rosetta3/english/lglue.seg \
                          /home/rosetta/archive/rosetta3/english/asegcom.exe \
                          /home/rosetta/archive/rosetta3/english/gsegcom.exe;
	@/home/rosetta/archive/rosetta3/actions/seg $(language) lglue
  
/home/rosetta/archive/rosetta3/english/grglue.svo \
/home/rosetta/archive/rosetta3/english/grglue.svs \
/home/rosetta/archive/rosetta3/english/grglue.sco \
/home/rosetta/archive/rosetta3/english/grglue.sso \
/home/rosetta/archive/rosetta3/english/grglue.sro \
/home/rosetta/archive/rosetta3/english/arglue.svo \
/home/rosetta/archive/rosetta3/english/arglue.svs \
/home/rosetta/archive/rosetta3/english/arglue.sco \
/home/rosetta/archive/rosetta3/english/arglue.sso \
/home/rosetta/archive/rosetta3/english/arglue.sro : /home/rosetta/archive/rosetta3/english/rglue.seg \
                          /home/rosetta/archive/rosetta3/english/asegcom.exe \
                          /home/rosetta/archive/rosetta3/english/gsegcom.exe;
	@/home/rosetta/archive/rosetta3/actions/seg $(language) rglue
  
/home/rosetta/archive/rosetta3/english/gmglue.svo \
/home/rosetta/archive/rosetta3/english/gmglue.svs \
/home/rosetta/archive/rosetta3/english/gmglue.sco \
/home/rosetta/archive/rosetta3/english/gmglue.sso \
/home/rosetta/archive/rosetta3/english/gmglue.sro \
/home/rosetta/archive/rosetta3/english/amglue.svo \
/home/rosetta/archive/rosetta3/english/amglue.svs \
/home/rosetta/archive/rosetta3/english/amglue.sco \
/home/rosetta/archive/rosetta3/english/amglue.sso \
/home/rosetta/archive/rosetta3/english/amglue.sro : /home/rosetta/archive/rosetta3/english/mglue.seg \
                          /home/rosetta/archive/rosetta3/english/asegcom.exe \
                          /home/rosetta/archive/rosetta3/english/gsegcom.exe;
	@/home/rosetta/archive/rosetta3/actions/seg $(language) mglue
  
/home/rosetta/archive/rosetta3/english/ldprims.p : /home/rosetta/archive/rosetta3/english/surout ;
 
/home/rosetta/archive/rosetta3/english/surfrules.p : /home/rosetta/archive/rosetta3/english/surout ;
 
/home/rosetta/archive/rosetta3/english/surfrulesblocks.pf : /home/rosetta/archive/rosetta3/english/surout ;
 
/home/rosetta/archive/rosetta3/english/surfrulesblocks.p : /home/rosetta/archive/rosetta3/english/surout ;
 
/home/rosetta/archive/rosetta3/english/lsrulepars.pf : /home/rosetta/archive/rosetta3/english/surout ;
 
/home/rosetta/archive/rosetta3/english/ldsurfswitch.p : /home/rosetta/archive/rosetta3/english/surout ;
 
/home/rosetta/archive/rosetta3/english/surfrulesgraphs.p : /home/rosetta/archive/rosetta3/english/surout ;
 
 
/home/rosetta/archive/rosetta3/english/surout : /home/rosetta/archive/rosetta3/english/surfrules1.sur  \
                                  /home/rosetta/archive/rosetta3/english/surfrules2.sur  \
                                  /home/rosetta/archive/rosetta3/english/surfrules3.sur  \
                                  /home/rosetta/archive/rosetta3/english/surfrules4.sur  \
                                  /home/rosetta/archive/rosetta3/general/surfrulesblocks.pf  \
                                  /home/rosetta/archive/rosetta3/english/surcom.exe  \
                                  /home/rosetta/archive/rosetta3/english/surfcom.exe  \
                                  /home/rosetta/archive/rosetta3/english/surflink.exe ;
	touch $(language)/target/surout
	@/home/rosetta/archive/rosetta3/actions/sur $(language) surfrules
	@/home/rosetta/archive/rosetta3/actions/surf $(language) surfrules1
	@/home/rosetta/archive/rosetta3/actions/surf $(language) surfrules2
	@/home/rosetta/archive/rosetta3/actions/surf $(language) surfrules3
	@/home/rosetta/archive/rosetta3/actions/surf $(language) surfrules4
	@/home/rosetta/archive/rosetta3/actions/slk $(language)
  
/home/rosetta/archive/rosetta3/english/ldanilrules.p : /home/rosetta/archive/rosetta3/english/traout ;
 
/home/rosetta/archive/rosetta3/english/ldgenilrules.p : /home/rosetta/archive/rosetta3/english/traout ;
 
/home/rosetta/archive/rosetta3/english/traout : /home/rosetta/archive/rosetta3/english/transferrules.trans  \
                               /home/rosetta/archive/rosetta3/english/tracom.exe;
	touch $(language)/target/traout
	@/home/rosetta/archive/rosetta3/actions/tra $(language) transferrules
  
/home/rosetta/archive/rosetta3/tools/neededforcompiler.pf : /home/rosetta/archive/rosetta3/tools/tstring.o \
                              /home/rosetta/archive/rosetta3/tools/tfiles.o \
                              /home/rosetta/archive/rosetta3/general/strtokey.o \
                              /home/rosetta/archive/rosetta3/general/mem.o \
                              /home/rosetta/archive/rosetta3/tools/mrudomcom.exe \
                              /home/rosetta/archive/rosetta3/tools/gencomp.exe ;
	@echo "empty" > tools/target/neededforcompiler.pf
 
/home/rosetta/archive/rosetta3/english/neededforcompiler.pf : /home/rosetta/archive/rosetta3/tools/neededforcompiler.pf \
                              /home/rosetta/archive/rosetta3/general/ldmrules.pf \
                              /home/rosetta/archive/rosetta3/general/lidomaint.pf \
                              /home/rosetta/archive/rosetta3/tools/tldstrtostr.o \
                              /home/rosetta/archive/rosetta3/tools/tldconvrec.o \
                              /home/rosetta/archive/rosetta3/english/ldcatsets.o \
                              /home/rosetta/archive/rosetta3/english/ldstrtotype.o \
                              /home/rosetta/archive/rosetta3/english/ldtypetostr.o ;
	@echo "empty" > $(language)/target/neededforcompiler.pf
 
##########domcom--gencomp 
 
/home/rosetta/archive/rosetta3/tools/domcomgraphdef.pf : /home/rosetta/archive/rosetta3/tools/gencomgraphdef.pf \
                         /home/rosetta/archive/rosetta3/tools/gencomp.exe;
	@/home/rosetta/archive/rosetta3/actions/gencomp tools gencomgraphdef.pf domcomgraphdef.pf domcom
 
/home/rosetta/archive/rosetta3/tools/domcomgraph.p : /home/rosetta/archive/rosetta3/tools/gencomgraph.p \
                        /home/rosetta/archive/rosetta3/tools/gencomp.exe;
	@/home/rosetta/archive/rosetta3/actions/gencomp tools gencomgraph.p domcomgraph.p domcom
  
/home/rosetta/archive/rosetta3/tools/domcomgraph.pf : /home/rosetta/archive/rosetta3/tools/gencomgraph.pf \
                         /home/rosetta/archive/rosetta3/tools/gencomp.exe;
	@/home/rosetta/archive/rosetta3/actions/gencomp tools gencomgraph.pf domcomgraph.pf domcom
  
 
/home/rosetta/archive/rosetta3/tools/domcomdecl.p : /home/rosetta/archive/rosetta3/tools/gencomdecl.p \
                         /home/rosetta/archive/rosetta3/tools/gencomp.exe;
	@/home/rosetta/archive/rosetta3/actions/gencomp tools gencomdecl.p domcomdecl.p domcom
 
/home/rosetta/archive/rosetta3/tools/domcomdecl.pf : /home/rosetta/archive/rosetta3/tools/gencomdecl.pf \
                         /home/rosetta/archive/rosetta3/tools/gencomp.exe;
	@/home/rosetta/archive/rosetta3/actions/gencomp tools gencomdecl.pf domcomdecl.pf domcom
 
/home/rosetta/archive/rosetta3/tools/domcomparser.p : /home/rosetta/archive/rosetta3/tools/gencomparser.p \
                         /home/rosetta/archive/rosetta3/tools/gencomp.exe;
	@/home/rosetta/archive/rosetta3/actions/gencomp tools gencomparser.p domcomparser.p domcom
 
/home/rosetta/archive/rosetta3/tools/domcomparser.pf : /home/rosetta/archive/rosetta3/tools/gencomparser.pf \
                         /home/rosetta/archive/rosetta3/tools/gencomp.exe;
	@/home/rosetta/archive/rosetta3/actions/gencomp tools gencomparser.pf domcomparser.pf domcom
  
/home/rosetta/archive/rosetta3/tools/domcomscanner.pf : /home/rosetta/archive/rosetta3/tools/gencomscanner.pf \
                         /home/rosetta/archive/rosetta3/tools/gencomp.exe;
	@/home/rosetta/archive/rosetta3/actions/gencomp tools gencomscanner.pf domcomscanner.pf domcom
 
 
###---mrudomcom--gencomp 
 
/home/rosetta/archive/rosetta3/tools/mrudomcomgraphdef.pf : /home/rosetta/archive/rosetta3/tools/gencomgraphdef.pf \
                         /home/rosetta/archive/rosetta3/tools/gencomp.exe;
	@/home/rosetta/archive/rosetta3/actions/gencomp tools gencomgraphdef.pf mrudomcomgraphdef.pf mrudomcom
 
/home/rosetta/archive/rosetta3/tools/mrudomcomgraph.p : /home/rosetta/archive/rosetta3/tools/gencomgraph.p \
                         /home/rosetta/archive/rosetta3/tools/gencomp.exe;
	@/home/rosetta/archive/rosetta3/actions/gencomp tools gencomgraph.p mrudomcomgraph.p mrudomcom
  
/home/rosetta/archive/rosetta3/tools/mrudomcomgraph.pf : /home/rosetta/archive/rosetta3/tools/gencomgraph.pf \
                         /home/rosetta/archive/rosetta3/tools/gencomp.exe;
	@/home/rosetta/archive/rosetta3/actions/gencomp tools gencomgraph.pf mrudomcomgraph.pf mrudomcom
 
/home/rosetta/archive/rosetta3/tools/mrudomcomdecl.p : /home/rosetta/archive/rosetta3/tools/gencomdecl.p \
                         /home/rosetta/archive/rosetta3/tools/gencomp.exe;
	@/home/rosetta/archive/rosetta3/actions/gencomp tools gencomdecl.p mrudomcomdecl.p mrudomcom
 
/home/rosetta/archive/rosetta3/tools/mrudomcomdecl.pf : /home/rosetta/archive/rosetta3/tools/gencomdecl.pf \
                         /home/rosetta/archive/rosetta3/tools/gencomp.exe;
	@/home/rosetta/archive/rosetta3/actions/gencomp tools gencomdecl.pf mrudomcomdecl.pf mrudomcom
  
/home/rosetta/archive/rosetta3/tools/mrudomcomparser.p : /home/rosetta/archive/rosetta3/tools/gencomparser.p \
                         /home/rosetta/archive/rosetta3/tools/gencomp.exe;
	@/home/rosetta/archive/rosetta3/actions/gencomp tools gencomparser.p mrudomcomparser.p mrudomcom
  
/home/rosetta/archive/rosetta3/tools/mrudomcomparser.pf : /home/rosetta/archive/rosetta3/tools/gencomparser.pf \
                         /home/rosetta/archive/rosetta3/tools/gencomp.exe;
	@/home/rosetta/archive/rosetta3/actions/gencomp tools gencomparser.pf mrudomcomparser.pf mrudomcom
  
/home/rosetta/archive/rosetta3/tools/mrudomcomscanner.pf : /home/rosetta/archive/rosetta3/tools/gencomscanner.pf \
                         /home/rosetta/archive/rosetta3/tools/gencomp.exe;
	@/home/rosetta/archive/rosetta3/actions/gencomp tools gencomscanner.pf mrudomcomscanner.pf mrudomcom
  
 
english/target/lsconstraints.p : /home/rosetta/archive/rosetta3/english/constraints.constr \
                                tools/target/constraintgen.exe;
	@/home/rosetta/archive/rosetta3/actions/constraint $(language) constraints
  
