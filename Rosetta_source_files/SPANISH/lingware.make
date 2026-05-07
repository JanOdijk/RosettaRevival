 
  
/home/rosetta/archive/rosetta3/spanish/ldsucc.p : /home/rosetta/archive/rosetta3/spanish/morphexpr.afxpr \
                         /home/rosetta/archive/rosetta3/tools/afxpr.exe;
	@/home/rosetta/archive/rosetta3/actions/afxpr $(language) morphexpr
  
/home/rosetta/archive/rosetta3/spanish/lsauxdom.pf : /home/rosetta/archive/rosetta3/spanish/auxdomout ;
 
/home/rosetta/archive/rosetta3/spanish/lsauxdom.p : /home/rosetta/archive/rosetta3/spanish/auxdomout ;
 
/home/rosetta/archive/rosetta3/spanish/ldsubsttovar.p : /home/rosetta/archive/rosetta3/spanish/auxdomout ;
 
/home/rosetta/archive/rosetta3/spanish/auxdomout : /home/rosetta/archive/rosetta3/spanish/lsauxdomain.auxdom  \
                               /home/rosetta/archive/rosetta3/spanish/auxcom.exe;
	touch $(language)/target/auxdomout
	@/home/rosetta/archive/rosetta3/actions/auxdom $(language) lsauxdomain
  
/home/rosetta/archive/rosetta3/spanish/lstypetostr.p : /home/rosetta/archive/rosetta3/spanish/domout ;
 
/home/rosetta/archive/rosetta3/spanish/lstypetostr.pf : /home/rosetta/archive/rosetta3/spanish/domout ;
 
/home/rosetta/archive/rosetta3/spanish/lsstrtotype.p : /home/rosetta/archive/rosetta3/spanish/domout ;
 
/home/rosetta/archive/rosetta3/spanish/lsstrtotype.pf : /home/rosetta/archive/rosetta3/spanish/domout ;
 
/home/rosetta/archive/rosetta3/spanish/lsconvrec.p : /home/rosetta/archive/rosetta3/spanish/domout ;
 
/home/rosetta/archive/rosetta3/spanish/lsconvrec.pf : /home/rosetta/archive/rosetta3/spanish/domout ;
 
/home/rosetta/archive/rosetta3/spanish/lsconvattr.p : /home/rosetta/archive/rosetta3/spanish/domout ;
 
/home/rosetta/archive/rosetta3/spanish/lsconvattr.pf : /home/rosetta/archive/rosetta3/spanish/domout ;
 
/home/rosetta/archive/rosetta3/spanish/ldconvrec.p : /home/rosetta/archive/rosetta3/spanish/domout ;
 
/home/rosetta/archive/rosetta3/spanish/lsdomaint.pf : /home/rosetta/archive/rosetta3/spanish/domout ;
 
/home/rosetta/archive/rosetta3/spanish/maket.pf : /home/rosetta/archive/rosetta3/spanish/domout ;
 
/home/rosetta/archive/rosetta3/spanish/maket.p : /home/rosetta/archive/rosetta3/spanish/domout ;
 
/home/rosetta/archive/rosetta3/spanish/copyt.pf : /home/rosetta/archive/rosetta3/spanish/domout ;
 
/home/rosetta/archive/rosetta3/spanish/copyt.p : /home/rosetta/archive/rosetta3/spanish/domout ;
 
/home/rosetta/archive/rosetta3/spanish/ldstrtotype.p : /home/rosetta/archive/rosetta3/spanish/domout ;
 
/home/rosetta/archive/rosetta3/spanish/ldtypetostr.p : /home/rosetta/archive/rosetta3/spanish/domout ;
 
/home/rosetta/archive/rosetta3/spanish/ldstrtostr.p : /home/rosetta/archive/rosetta3/spanish/domout ;
 
/home/rosetta/archive/rosetta3/spanish/ldcatsets.p : /home/rosetta/archive/rosetta3/spanish/domout ;
 
/home/rosetta/archive/rosetta3/spanish/ldequal.p : /home/rosetta/archive/rosetta3/spanish/domout ;
 
/home/rosetta/archive/rosetta3/spanish/ldgetkey.p : /home/rosetta/archive/rosetta3/spanish/domout ;
 
/home/rosetta/archive/rosetta3/spanish/lsmorfdef.pf : /home/rosetta/archive/rosetta3/spanish/domout ;
 
/home/rosetta/archive/rosetta3/spanish/domout : /home/rosetta/archive/rosetta3/spanish/lsdomaint.dom \
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
  
  
/home/rosetta/archive/rosetta3/spanish/blex.dat : spanish/target/blex.dict \
                       /home/rosetta/archive/rosetta3/spanish/genblexisf.exe;
	@/home/rosetta/archive/rosetta3/actions/genblexdata $(language)
  
/home/rosetta/archive/rosetta3/spanish/iddict.dat : spanish/target/iddict.dict \
                         /home/rosetta/archive/rosetta3/spanish/geniddictdata.exe;
	@/home/rosetta/archive/rosetta3/actions/geniddictdata $(language)
  
/home/rosetta/archive/rosetta3/spanish/ildict.dat : spanish/target/ildict.dict \
                         /home/rosetta/archive/rosetta3/tools/genildictdata.exe;
	@/home/rosetta/archive/rosetta3/actions/genildictdata $(language)
  
/home/rosetta/archive/rosetta3/spanish/mdict.dat : spanish/target/mdict.dict \
                         /home/rosetta/archive/rosetta3/spanish/genmdictdata.exe;
	@/home/rosetta/archive/rosetta3/actions/genmdictdata $(language)
  
/home/rosetta/archive/rosetta3/spanish/sdict.dat : spanish/target/sdict.dict \
                         /home/rosetta/archive/rosetta3/tools/gensdictdata.exe;
	@/home/rosetta/archive/rosetta3/actions/gensdictdata $(language)
  
/home/rosetta/archive/rosetta3/spanish/siddict.dat : spanish/target/siddict.dict \
                         /home/rosetta/archive/rosetta3/tools/gensiddictdata.exe;
	@/home/rosetta/archive/rosetta3/actions/gensiddictdata $(language)
  
/home/rosetta/archive/rosetta3/spanish/fixid.dat : /home/rosetta/archive/rosetta3/spanish/fixid.fixid \
                        /home/rosetta/archive/rosetta3/tools/fixidgen.exe;
	@/home/rosetta/archive/rosetta3/actions/genfixiddata $(language)
  
  
  
#!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!keydefinitions  
  
/home/rosetta/archive/rosetta3/interlingua/bmkeydef.dat : /home/rosetta/archive/rosetta3/interlingua/bmkeydef.kdf \
                           /home/rosetta/archive/rosetta3/tools/strmkey.exe;
	@/home/rosetta/archive/rosetta3/actions/mkdf interlingua bmkeydef
  
  
/home/rosetta/archive/rosetta3/spanish/bskeydef.dat : /home/rosetta/archive/rosetta3/spanish/bskeydef.kdf \
                           /home/rosetta/archive/rosetta3/tools/strkey.exe;
	@/home/rosetta/archive/rosetta3/actions/kdf $(language) bskeydef
  
  
#!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! 
  
/home/rosetta/archive/rosetta3/spanish/comlexrules1.p : /home/rosetta/archive/rosetta3/spanish/lex1out ;
 
/home/rosetta/archive/rosetta3/spanish/comlexrules1.pf : /home/rosetta/archive/rosetta3/spanish/lex1out ;
 
/home/rosetta/archive/rosetta3/spanish/decomlexrules1.p : /home/rosetta/archive/rosetta3/spanish/lex1out ;
 
/home/rosetta/archive/rosetta3/spanish/decomlexrules1.pf : /home/rosetta/archive/rosetta3/spanish/lex1out ;
  
/home/rosetta/archive/rosetta3/spanish/lex1out : /home/rosetta/archive/rosetta3/spanish/lexrules1.lex  \
                                 /home/rosetta/archive/rosetta3/spanish/lexcom.exe;
	touch $(language)/target/lex1out
	@/home/rosetta/archive/rosetta3/actions/lex $(language) lexrules1
  
 
/home/rosetta/archive/rosetta3/spanish/comlexrules2.p : /home/rosetta/archive/rosetta3/spanish/lex2out ;
 
/home/rosetta/archive/rosetta3/spanish/comlexrules2.pf : /home/rosetta/archive/rosetta3/spanish/lex2out ;
 
/home/rosetta/archive/rosetta3/spanish/decomlexrules2.p : /home/rosetta/archive/rosetta3/spanish/lex2out ;
 
/home/rosetta/archive/rosetta3/spanish/decomlexrules2.pf : /home/rosetta/archive/rosetta3/spanish/lex2out ;
  
/home/rosetta/archive/rosetta3/spanish/lex2out : /home/rosetta/archive/rosetta3/spanish/lexrules2.lex  \
                                 /home/rosetta/archive/rosetta3/spanish/lexcom.exe;
	touch $(language)/target/lex2out
	@/home/rosetta/archive/rosetta3/actions/lex $(language) lexrules2
 
/home/rosetta/archive/rosetta3/spanish/comlexrules3.p : /home/rosetta/archive/rosetta3/spanish/lex3out ;
 
/home/rosetta/archive/rosetta3/spanish/comlexrules3.pf : /home/rosetta/archive/rosetta3/spanish/lex3out ;
 
/home/rosetta/archive/rosetta3/spanish/decomlexrules3.p : /home/rosetta/archive/rosetta3/spanish/lex3out ;
 
/home/rosetta/archive/rosetta3/spanish/decomlexrules3.pf : /home/rosetta/archive/rosetta3/spanish/lex3out ;
  
/home/rosetta/archive/rosetta3/spanish/lex3out : /home/rosetta/archive/rosetta3/spanish/lexrules3.lex  \
                                 /home/rosetta/archive/rosetta3/spanish/lexcom.exe;
	touch $(language)/target/lex3out
	@/home/rosetta/archive/rosetta3/actions/lex $(language) lexrules3
  
  
/home/rosetta/archive/rosetta3/spanish/anlexif.p : /home/rosetta/archive/rosetta3/spanish/llkout ;
 
/home/rosetta/archive/rosetta3/spanish/genlexif.p : /home/rosetta/archive/rosetta3/spanish/llkout ;
 
/home/rosetta/archive/rosetta3/spanish/llkout : /home/rosetta/archive/rosetta3/spanish/comlexrules1.pf  \
                            /home/rosetta/archive/rosetta3/spanish/comlexrules2.pf  \
                            /home/rosetta/archive/rosetta3/spanish/comlexrules3.pf  \
                            /home/rosetta/archive/rosetta3/spanish/lexlink.exe;
	touch $(language)/target/llkout
	@/home/rosetta/archive/rosetta3/actions/llk $(language)
  
/home/rosetta/archive/rosetta3/spanish/lsparams.pf : /home/rosetta/archive/rosetta3/spanish/mlkout ;
 
/home/rosetta/archive/rosetta3/spanish/ldmrules.p : /home/rosetta/archive/rosetta3/spanish/mlkout ;
 
/home/rosetta/archive/rosetta3/spanish/ldsubgrammars.p : /home/rosetta/archive/rosetta3/spanish/mlkout ;
 
/home/rosetta/archive/rosetta3/spanish/helpsubgrammars.pf : /home/rosetta/archive/rosetta3/spanish/mlkout ;
 
/home/rosetta/archive/rosetta3/spanish/helpsubgrammars.p : /home/rosetta/archive/rosetta3/spanish/mlkout ;
 
/home/rosetta/archive/rosetta3/spanish/ldanmrules.p : /home/rosetta/archive/rosetta3/spanish/mlkout ;
 
/home/rosetta/archive/rosetta3/spanish/ldgenmrules.p : /home/rosetta/archive/rosetta3/spanish/mlkout ;
 
 
/home/rosetta/archive/rosetta3/spanish/mlkout : /home/rosetta/archive/rosetta3/spanish/commrules1.pf \
           /home/rosetta/archive/rosetta3/spanish/commrules10.pf \
           /home/rosetta/archive/rosetta3/spanish/commrules100.pf \
           /home/rosetta/archive/rosetta3/spanish/commrules101.pf \
           /home/rosetta/archive/rosetta3/spanish/commrules102.pf \
           /home/rosetta/archive/rosetta3/spanish/commrules103.pf \
           /home/rosetta/archive/rosetta3/spanish/commrules104.pf \
           /home/rosetta/archive/rosetta3/spanish/commrules105.pf \
           /home/rosetta/archive/rosetta3/spanish/commrules106.pf \
           /home/rosetta/archive/rosetta3/spanish/commrules107.pf \
           /home/rosetta/archive/rosetta3/spanish/commrules108.pf \
           /home/rosetta/archive/rosetta3/spanish/commrules109.pf \
           /home/rosetta/archive/rosetta3/spanish/commrules11.pf \
           /home/rosetta/archive/rosetta3/spanish/commrules110.pf \
           /home/rosetta/archive/rosetta3/spanish/commrules111.pf \
           /home/rosetta/archive/rosetta3/spanish/commrules112.pf \
           /home/rosetta/archive/rosetta3/spanish/commrules113.pf \
           /home/rosetta/archive/rosetta3/spanish/commrules114.pf \
           /home/rosetta/archive/rosetta3/spanish/commrules115.pf \
           /home/rosetta/archive/rosetta3/spanish/commrules116.pf \
           /home/rosetta/archive/rosetta3/spanish/commrules117.pf \
           /home/rosetta/archive/rosetta3/spanish/commrules118.pf \
           /home/rosetta/archive/rosetta3/spanish/commrules119.pf \
           /home/rosetta/archive/rosetta3/spanish/commrules12.pf \
           /home/rosetta/archive/rosetta3/spanish/commrules120.pf \
           /home/rosetta/archive/rosetta3/spanish/commrules121.pf \
           /home/rosetta/archive/rosetta3/spanish/commrules122.pf \
           /home/rosetta/archive/rosetta3/spanish/commrules123.pf \
           /home/rosetta/archive/rosetta3/spanish/commrules124.pf \
           /home/rosetta/archive/rosetta3/spanish/commrules125.pf \
           /home/rosetta/archive/rosetta3/spanish/commrules126.pf \
           /home/rosetta/archive/rosetta3/spanish/commrules127.pf \
           /home/rosetta/archive/rosetta3/spanish/commrules128.pf \
           /home/rosetta/archive/rosetta3/spanish/commrules129.pf \
           /home/rosetta/archive/rosetta3/spanish/commrules13.pf \
           /home/rosetta/archive/rosetta3/spanish/commrules130.pf \
           /home/rosetta/archive/rosetta3/spanish/commrules131.pf \
           /home/rosetta/archive/rosetta3/spanish/commrules132.pf \
           /home/rosetta/archive/rosetta3/spanish/commrules133.pf \
           /home/rosetta/archive/rosetta3/spanish/commrules134.pf \
           /home/rosetta/archive/rosetta3/spanish/commrules135.pf \
           /home/rosetta/archive/rosetta3/spanish/commrules136.pf \
           /home/rosetta/archive/rosetta3/spanish/commrules137.pf \
           /home/rosetta/archive/rosetta3/spanish/commrules138.pf \
           /home/rosetta/archive/rosetta3/spanish/commrules139.pf \
           /home/rosetta/archive/rosetta3/spanish/commrules14.pf \
           /home/rosetta/archive/rosetta3/spanish/commrules140.pf \
           /home/rosetta/archive/rosetta3/spanish/commrules15.pf \
           /home/rosetta/archive/rosetta3/spanish/commrules16.pf \
           /home/rosetta/archive/rosetta3/spanish/commrules17.pf \
           /home/rosetta/archive/rosetta3/spanish/commrules18.pf \
           /home/rosetta/archive/rosetta3/spanish/commrules19.pf \
           /home/rosetta/archive/rosetta3/spanish/commrules2.pf \
           /home/rosetta/archive/rosetta3/spanish/commrules20.pf \
           /home/rosetta/archive/rosetta3/spanish/commrules21.pf \
           /home/rosetta/archive/rosetta3/spanish/commrules22.pf \
           /home/rosetta/archive/rosetta3/spanish/commrules23.pf \
           /home/rosetta/archive/rosetta3/spanish/commrules24.pf \
           /home/rosetta/archive/rosetta3/spanish/commrules25.pf \
           /home/rosetta/archive/rosetta3/spanish/commrules26.pf \
           /home/rosetta/archive/rosetta3/spanish/commrules27.pf \
           /home/rosetta/archive/rosetta3/spanish/commrules28.pf \
           /home/rosetta/archive/rosetta3/spanish/commrules29.pf \
           /home/rosetta/archive/rosetta3/spanish/commrules3.pf \
           /home/rosetta/archive/rosetta3/spanish/commrules30.pf \
           /home/rosetta/archive/rosetta3/spanish/commrules31.pf \
           /home/rosetta/archive/rosetta3/spanish/commrules32.pf \
           /home/rosetta/archive/rosetta3/spanish/commrules33.pf \
           /home/rosetta/archive/rosetta3/spanish/commrules34.pf \
           /home/rosetta/archive/rosetta3/spanish/commrules35.pf \
           /home/rosetta/archive/rosetta3/spanish/commrules36.pf \
           /home/rosetta/archive/rosetta3/spanish/commrules37.pf \
           /home/rosetta/archive/rosetta3/spanish/commrules38.pf \
           /home/rosetta/archive/rosetta3/spanish/commrules39.pf \
           /home/rosetta/archive/rosetta3/spanish/commrules4.pf \
           /home/rosetta/archive/rosetta3/spanish/commrules40.pf \
           /home/rosetta/archive/rosetta3/spanish/commrules41.pf \
           /home/rosetta/archive/rosetta3/spanish/commrules42.pf \
           /home/rosetta/archive/rosetta3/spanish/commrules43.pf \
           /home/rosetta/archive/rosetta3/spanish/commrules44.pf \
           /home/rosetta/archive/rosetta3/spanish/commrules45.pf \
           /home/rosetta/archive/rosetta3/spanish/commrules46.pf \
           /home/rosetta/archive/rosetta3/spanish/commrules47.pf \
           /home/rosetta/archive/rosetta3/spanish/commrules48.pf \
           /home/rosetta/archive/rosetta3/spanish/commrules49.pf \
           /home/rosetta/archive/rosetta3/spanish/commrules5.pf \
           /home/rosetta/archive/rosetta3/spanish/commrules50.pf \
           /home/rosetta/archive/rosetta3/spanish/commrules51.pf \
           /home/rosetta/archive/rosetta3/spanish/commrules52.pf \
           /home/rosetta/archive/rosetta3/spanish/commrules53.pf \
           /home/rosetta/archive/rosetta3/spanish/commrules54.pf \
           /home/rosetta/archive/rosetta3/spanish/commrules55.pf \
           /home/rosetta/archive/rosetta3/spanish/commrules56.pf \
           /home/rosetta/archive/rosetta3/spanish/commrules57.pf \
           /home/rosetta/archive/rosetta3/spanish/commrules58.pf \
           /home/rosetta/archive/rosetta3/spanish/commrules59.pf \
           /home/rosetta/archive/rosetta3/spanish/commrules6.pf \
           /home/rosetta/archive/rosetta3/spanish/commrules60.pf \
           /home/rosetta/archive/rosetta3/spanish/commrules61.pf \
           /home/rosetta/archive/rosetta3/spanish/commrules62.pf \
           /home/rosetta/archive/rosetta3/spanish/commrules63.pf \
           /home/rosetta/archive/rosetta3/spanish/commrules64.pf \
           /home/rosetta/archive/rosetta3/spanish/commrules65.pf \
           /home/rosetta/archive/rosetta3/spanish/commrules66.pf \
           /home/rosetta/archive/rosetta3/spanish/commrules67.pf \
           /home/rosetta/archive/rosetta3/spanish/commrules68.pf \
           /home/rosetta/archive/rosetta3/spanish/commrules69.pf \
           /home/rosetta/archive/rosetta3/spanish/commrules7.pf \
           /home/rosetta/archive/rosetta3/spanish/commrules70.pf \
           /home/rosetta/archive/rosetta3/spanish/commrules71.pf \
           /home/rosetta/archive/rosetta3/spanish/commrules72.pf \
           /home/rosetta/archive/rosetta3/spanish/commrules73.pf \
           /home/rosetta/archive/rosetta3/spanish/commrules74.pf \
           /home/rosetta/archive/rosetta3/spanish/commrules75.pf \
           /home/rosetta/archive/rosetta3/spanish/commrules76.pf \
           /home/rosetta/archive/rosetta3/spanish/commrules77.pf \
           /home/rosetta/archive/rosetta3/spanish/commrules78.pf \
           /home/rosetta/archive/rosetta3/spanish/commrules79.pf \
           /home/rosetta/archive/rosetta3/spanish/commrules8.pf \
           /home/rosetta/archive/rosetta3/spanish/commrules80.pf \
           /home/rosetta/archive/rosetta3/spanish/commrules81.pf \
           /home/rosetta/archive/rosetta3/spanish/commrules82.pf \
           /home/rosetta/archive/rosetta3/spanish/commrules83.pf \
           /home/rosetta/archive/rosetta3/spanish/commrules84.pf \
           /home/rosetta/archive/rosetta3/spanish/commrules85.pf \
           /home/rosetta/archive/rosetta3/spanish/commrules86.pf \
           /home/rosetta/archive/rosetta3/spanish/commrules87.pf \
           /home/rosetta/archive/rosetta3/spanish/commrules88.pf \
           /home/rosetta/archive/rosetta3/spanish/commrules89.pf \
           /home/rosetta/archive/rosetta3/spanish/commrules9.pf \
           /home/rosetta/archive/rosetta3/spanish/commrules90.pf \
           /home/rosetta/archive/rosetta3/spanish/commrules91.pf \
           /home/rosetta/archive/rosetta3/spanish/commrules92.pf \
           /home/rosetta/archive/rosetta3/spanish/commrules93.pf \
           /home/rosetta/archive/rosetta3/spanish/commrules94.pf \
           /home/rosetta/archive/rosetta3/spanish/commrules95.pf \
           /home/rosetta/archive/rosetta3/spanish/commrules96.pf \
           /home/rosetta/archive/rosetta3/spanish/commrules97.pf \
           /home/rosetta/archive/rosetta3/spanish/commrules98.pf \
           /home/rosetta/archive/rosetta3/spanish/commrules99.pf \
                            /home/rosetta/archive/rosetta3/spanish/mrulelink.exe;
	touch $(language)/target/mlkout
	@/home/rosetta/archive/rosetta3/actions/mlk $(language)
	@/home/rosetta/archive/rosetta3/actions/pas $(language) ldmrules
	@/home/rosetta/archive/rosetta3/actions/gen $(language) mrucom
	@/home/rosetta/archive/rosetta3/actions/idioms $(language) mrules107
	@/home/rosetta/archive/rosetta3/actions/idioms $(language) mrules117
  
/home/rosetta/archive/rosetta3/spanish/commrules1.o  \
/home/rosetta/archive/rosetta3/spanish/decommrules1.o  \
/home/rosetta/archive/rosetta3/spanish/commrules1.pf  \
/home/rosetta/archive/rosetta3/spanish/decommrules1.pf : /home/rosetta/archive/rosetta3/spanish/mrules1.out ;
 
/home/rosetta/archive/rosetta3/spanish/mrules1.out : /home/rosetta/archive/rosetta3/spanish/mrules1.mrule  \
                               /home/rosetta/archive/rosetta3/spanish/neededinmrules.pf;
	touch $(language)/target/mrules1.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules1
  
/home/rosetta/archive/rosetta3/spanish/commrules2.o  \
/home/rosetta/archive/rosetta3/spanish/decommrules2.o  \
/home/rosetta/archive/rosetta3/spanish/commrules2.pf  \
/home/rosetta/archive/rosetta3/spanish/decommrules2.pf : /home/rosetta/archive/rosetta3/spanish/mrules2.out ;
 
/home/rosetta/archive/rosetta3/spanish/mrules2.out : /home/rosetta/archive/rosetta3/spanish/mrules2.mrule  \
                               /home/rosetta/archive/rosetta3/spanish/neededinmrules.pf;
	touch $(language)/target/mrules2.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules2
  
/home/rosetta/archive/rosetta3/spanish/commrules3.o  \
/home/rosetta/archive/rosetta3/spanish/decommrules3.o  \
/home/rosetta/archive/rosetta3/spanish/commrules3.pf  \
/home/rosetta/archive/rosetta3/spanish/decommrules3.pf : /home/rosetta/archive/rosetta3/spanish/mrules3.out ;
 
/home/rosetta/archive/rosetta3/spanish/mrules3.out : /home/rosetta/archive/rosetta3/spanish/mrules3.mrule  \
                               /home/rosetta/archive/rosetta3/spanish/neededinmrules.pf;
	touch $(language)/target/mrules3.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules3
  
/home/rosetta/archive/rosetta3/spanish/commrules4.o  \
/home/rosetta/archive/rosetta3/spanish/decommrules4.o  \
/home/rosetta/archive/rosetta3/spanish/commrules4.pf  \
/home/rosetta/archive/rosetta3/spanish/decommrules4.pf : /home/rosetta/archive/rosetta3/spanish/mrules4.out ;
 
/home/rosetta/archive/rosetta3/spanish/mrules4.out : /home/rosetta/archive/rosetta3/spanish/mrules4.mrule  \
                               /home/rosetta/archive/rosetta3/spanish/neededinmrules.pf;
	touch $(language)/target/mrules4.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules4
  
/home/rosetta/archive/rosetta3/spanish/commrules5.o  \
/home/rosetta/archive/rosetta3/spanish/decommrules5.o  \
/home/rosetta/archive/rosetta3/spanish/commrules5.pf  \
/home/rosetta/archive/rosetta3/spanish/decommrules5.pf : /home/rosetta/archive/rosetta3/spanish/mrules5.out ;
 
/home/rosetta/archive/rosetta3/spanish/mrules5.out : /home/rosetta/archive/rosetta3/spanish/mrules5.mrule  \
                               /home/rosetta/archive/rosetta3/spanish/neededinmrules.pf;
	touch $(language)/target/mrules5.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules5
 
 
  
/home/rosetta/archive/rosetta3/spanish/commrules6.o  \
/home/rosetta/archive/rosetta3/spanish/decommrules6.o  \
/home/rosetta/archive/rosetta3/spanish/commrules6.pf  \
/home/rosetta/archive/rosetta3/spanish/decommrules6.pf : /home/rosetta/archive/rosetta3/spanish/mrules6.out ;
 
/home/rosetta/archive/rosetta3/spanish/mrules6.out : /home/rosetta/archive/rosetta3/spanish/mrules6.mrule  \
                               /home/rosetta/archive/rosetta3/spanish/neededinmrules.pf;
	touch $(language)/target/mrules6.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules6
 
 
  
  
/home/rosetta/archive/rosetta3/spanish/commrules7.o  \
/home/rosetta/archive/rosetta3/spanish/decommrules7.o  \
/home/rosetta/archive/rosetta3/spanish/commrules7.pf  \
/home/rosetta/archive/rosetta3/spanish/decommrules7.pf : /home/rosetta/archive/rosetta3/spanish/mrules7.out ;
 
/home/rosetta/archive/rosetta3/spanish/mrules7.out : /home/rosetta/archive/rosetta3/spanish/mrules7.mrule  \
                               /home/rosetta/archive/rosetta3/spanish/neededinmrules.pf;
	touch $(language)/target/mrules7.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules7
 
 
  
/home/rosetta/archive/rosetta3/spanish/commrules8.o  \
/home/rosetta/archive/rosetta3/spanish/decommrules8.o  \
/home/rosetta/archive/rosetta3/spanish/commrules8.pf  \
/home/rosetta/archive/rosetta3/spanish/decommrules8.pf : /home/rosetta/archive/rosetta3/spanish/mrules8.out ;
 
/home/rosetta/archive/rosetta3/spanish/mrules8.out : /home/rosetta/archive/rosetta3/spanish/mrules8.mrule  \
                               /home/rosetta/archive/rosetta3/spanish/neededinmrules.pf;
	touch $(language)/target/mrules8.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules8
 
 
  
  
/home/rosetta/archive/rosetta3/spanish/commrules9.o  \
/home/rosetta/archive/rosetta3/spanish/decommrules9.o  \
/home/rosetta/archive/rosetta3/spanish/commrules9.pf  \
/home/rosetta/archive/rosetta3/spanish/decommrules9.pf : /home/rosetta/archive/rosetta3/spanish/mrules9.out ;
 
/home/rosetta/archive/rosetta3/spanish/mrules9.out : /home/rosetta/archive/rosetta3/spanish/mrules9.mrule  \
                               /home/rosetta/archive/rosetta3/spanish/neededinmrules.pf;
	touch $(language)/target/mrules9.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules9
 
 
  
/home/rosetta/archive/rosetta3/spanish/commrules10.o  \
/home/rosetta/archive/rosetta3/spanish/decommrules10.o  \
/home/rosetta/archive/rosetta3/spanish/commrules10.pf  \
/home/rosetta/archive/rosetta3/spanish/decommrules10.pf : /home/rosetta/archive/rosetta3/spanish/mrules10.out ;
 
/home/rosetta/archive/rosetta3/spanish/mrules10.out : /home/rosetta/archive/rosetta3/spanish/mrules10.mrule  \
                               /home/rosetta/archive/rosetta3/spanish/neededinmrules.pf;
	touch $(language)/target/mrules10.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules10
 
 
  
/home/rosetta/archive/rosetta3/spanish/commrules11.o  \
/home/rosetta/archive/rosetta3/spanish/decommrules11.o  \
/home/rosetta/archive/rosetta3/spanish/commrules11.pf  \
/home/rosetta/archive/rosetta3/spanish/decommrules11.pf : /home/rosetta/archive/rosetta3/spanish/mrules11.out ;
 
/home/rosetta/archive/rosetta3/spanish/mrules11.out : /home/rosetta/archive/rosetta3/spanish/mrules11.mrule  \
                               /home/rosetta/archive/rosetta3/spanish/neededinmrules.pf;
	touch $(language)/target/mrules11.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules11
 
 
  
/home/rosetta/archive/rosetta3/spanish/commrules12.o  \
/home/rosetta/archive/rosetta3/spanish/decommrules12.o  \
/home/rosetta/archive/rosetta3/spanish/commrules12.pf  \
/home/rosetta/archive/rosetta3/spanish/decommrules12.pf : /home/rosetta/archive/rosetta3/spanish/mrules12.out ;
 
/home/rosetta/archive/rosetta3/spanish/mrules12.out : /home/rosetta/archive/rosetta3/spanish/mrules12.mrule  \
                               /home/rosetta/archive/rosetta3/spanish/neededinmrules.pf;
	touch $(language)/target/mrules12.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules12
 
 
  
/home/rosetta/archive/rosetta3/spanish/commrules13.o  \
/home/rosetta/archive/rosetta3/spanish/decommrules13.o  \
/home/rosetta/archive/rosetta3/spanish/commrules13.pf  \
/home/rosetta/archive/rosetta3/spanish/decommrules13.pf : /home/rosetta/archive/rosetta3/spanish/mrules13.out ;
 
/home/rosetta/archive/rosetta3/spanish/mrules13.out : /home/rosetta/archive/rosetta3/spanish/mrules13.mrule  \
                               /home/rosetta/archive/rosetta3/spanish/neededinmrules.pf;
	touch $(language)/target/mrules13.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules13
 
 
  
/home/rosetta/archive/rosetta3/spanish/commrules14.o  \
/home/rosetta/archive/rosetta3/spanish/decommrules14.o  \
/home/rosetta/archive/rosetta3/spanish/commrules14.pf  \
/home/rosetta/archive/rosetta3/spanish/decommrules14.pf : /home/rosetta/archive/rosetta3/spanish/mrules14.out ;
 
/home/rosetta/archive/rosetta3/spanish/mrules14.out : /home/rosetta/archive/rosetta3/spanish/mrules14.mrule  \
                               /home/rosetta/archive/rosetta3/spanish/neededinmrules.pf;
	touch $(language)/target/mrules14.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules14
 
 
  
  
/home/rosetta/archive/rosetta3/spanish/commrules15.o  \
/home/rosetta/archive/rosetta3/spanish/decommrules15.o  \
/home/rosetta/archive/rosetta3/spanish/commrules15.pf  \
/home/rosetta/archive/rosetta3/spanish/decommrules15.pf : /home/rosetta/archive/rosetta3/spanish/mrules15.out ;
 
/home/rosetta/archive/rosetta3/spanish/mrules15.out : /home/rosetta/archive/rosetta3/spanish/mrules15.mrule  \
                               /home/rosetta/archive/rosetta3/spanish/neededinmrules.pf;
	touch $(language)/target/mrules15.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules15
 
 
  
/home/rosetta/archive/rosetta3/spanish/commrules16.o  \
/home/rosetta/archive/rosetta3/spanish/decommrules16.o  \
/home/rosetta/archive/rosetta3/spanish/commrules16.pf  \
/home/rosetta/archive/rosetta3/spanish/decommrules16.pf : /home/rosetta/archive/rosetta3/spanish/mrules16.out ;
 
/home/rosetta/archive/rosetta3/spanish/mrules16.out : /home/rosetta/archive/rosetta3/spanish/mrules16.mrule  \
                               /home/rosetta/archive/rosetta3/spanish/neededinmrules.pf;
	touch $(language)/target/mrules16.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules16
 
 
  
  
/home/rosetta/archive/rosetta3/spanish/commrules17.o  \
/home/rosetta/archive/rosetta3/spanish/decommrules17.o  \
/home/rosetta/archive/rosetta3/spanish/commrules17.pf  \
/home/rosetta/archive/rosetta3/spanish/decommrules17.pf : /home/rosetta/archive/rosetta3/spanish/mrules17.out ;
 
/home/rosetta/archive/rosetta3/spanish/mrules17.out : /home/rosetta/archive/rosetta3/spanish/mrules17.mrule  \
                               /home/rosetta/archive/rosetta3/spanish/neededinmrules.pf;
	touch $(language)/target/mrules17.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules17
 
 
  
/home/rosetta/archive/rosetta3/spanish/commrules18.o  \
/home/rosetta/archive/rosetta3/spanish/decommrules18.o  \
/home/rosetta/archive/rosetta3/spanish/commrules18.pf  \
/home/rosetta/archive/rosetta3/spanish/decommrules18.pf : /home/rosetta/archive/rosetta3/spanish/mrules18.out ;
 
/home/rosetta/archive/rosetta3/spanish/mrules18.out : /home/rosetta/archive/rosetta3/spanish/mrules18.mrule  \
                               /home/rosetta/archive/rosetta3/spanish/neededinmrules.pf;
	touch $(language)/target/mrules18.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules18
 
 
  
  
/home/rosetta/archive/rosetta3/spanish/commrules19.o  \
/home/rosetta/archive/rosetta3/spanish/decommrules19.o  \
/home/rosetta/archive/rosetta3/spanish/commrules19.pf  \
/home/rosetta/archive/rosetta3/spanish/decommrules19.pf : /home/rosetta/archive/rosetta3/spanish/mrules19.out ;
 
/home/rosetta/archive/rosetta3/spanish/mrules19.out : /home/rosetta/archive/rosetta3/spanish/mrules19.mrule  \
                               /home/rosetta/archive/rosetta3/spanish/neededinmrules.pf;
	touch $(language)/target/mrules19.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules19
 
 
  
/home/rosetta/archive/rosetta3/spanish/commrules20.o  \
/home/rosetta/archive/rosetta3/spanish/decommrules20.o  \
/home/rosetta/archive/rosetta3/spanish/commrules20.pf  \
/home/rosetta/archive/rosetta3/spanish/decommrules20.pf : /home/rosetta/archive/rosetta3/spanish/mrules20.out ;
 
/home/rosetta/archive/rosetta3/spanish/mrules20.out : /home/rosetta/archive/rosetta3/spanish/mrules20.mrule  \
                               /home/rosetta/archive/rosetta3/spanish/neededinmrules.pf;
	touch $(language)/target/mrules20.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules20
 
 
  
/home/rosetta/archive/rosetta3/spanish/commrules21.o  \
/home/rosetta/archive/rosetta3/spanish/decommrules21.o  \
/home/rosetta/archive/rosetta3/spanish/commrules21.pf  \
/home/rosetta/archive/rosetta3/spanish/decommrules21.pf : /home/rosetta/archive/rosetta3/spanish/mrules21.out ;
 
/home/rosetta/archive/rosetta3/spanish/mrules21.out : /home/rosetta/archive/rosetta3/spanish/mrules21.mrule  \
                               /home/rosetta/archive/rosetta3/spanish/neededinmrules.pf;
	touch $(language)/target/mrules21.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules21
 
 
  
/home/rosetta/archive/rosetta3/spanish/commrules22.o  \
/home/rosetta/archive/rosetta3/spanish/decommrules22.o  \
/home/rosetta/archive/rosetta3/spanish/commrules22.pf  \
/home/rosetta/archive/rosetta3/spanish/decommrules22.pf : /home/rosetta/archive/rosetta3/spanish/mrules22.out ;
 
/home/rosetta/archive/rosetta3/spanish/mrules22.out : /home/rosetta/archive/rosetta3/spanish/mrules22.mrule  \
                               /home/rosetta/archive/rosetta3/spanish/neededinmrules.pf;
	touch $(language)/target/mrules22.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules22
 
 
  
/home/rosetta/archive/rosetta3/spanish/commrules23.o  \
/home/rosetta/archive/rosetta3/spanish/decommrules23.o  \
/home/rosetta/archive/rosetta3/spanish/commrules23.pf  \
/home/rosetta/archive/rosetta3/spanish/decommrules23.pf : /home/rosetta/archive/rosetta3/spanish/mrules23.out ;
 
/home/rosetta/archive/rosetta3/spanish/mrules23.out : /home/rosetta/archive/rosetta3/spanish/mrules23.mrule  \
                               /home/rosetta/archive/rosetta3/spanish/neededinmrules.pf;
	touch $(language)/target/mrules23.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules23
 
 
  
/home/rosetta/archive/rosetta3/spanish/commrules24.o  \
/home/rosetta/archive/rosetta3/spanish/decommrules24.o  \
/home/rosetta/archive/rosetta3/spanish/commrules24.pf  \
/home/rosetta/archive/rosetta3/spanish/decommrules24.pf : /home/rosetta/archive/rosetta3/spanish/mrules24.out ;
 
/home/rosetta/archive/rosetta3/spanish/mrules24.out : /home/rosetta/archive/rosetta3/spanish/mrules24.mrule  \
                               /home/rosetta/archive/rosetta3/spanish/neededinmrules.pf;
	touch $(language)/target/mrules24.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules24
 
 
  
  
/home/rosetta/archive/rosetta3/spanish/commrules25.o  \
/home/rosetta/archive/rosetta3/spanish/decommrules25.o  \
/home/rosetta/archive/rosetta3/spanish/commrules25.pf  \
/home/rosetta/archive/rosetta3/spanish/decommrules25.pf : /home/rosetta/archive/rosetta3/spanish/mrules25.out ;
 
/home/rosetta/archive/rosetta3/spanish/mrules25.out : /home/rosetta/archive/rosetta3/spanish/mrules25.mrule  \
                               /home/rosetta/archive/rosetta3/spanish/neededinmrules.pf;
	touch $(language)/target/mrules25.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules25
 
 
  
/home/rosetta/archive/rosetta3/spanish/commrules26.o  \
/home/rosetta/archive/rosetta3/spanish/decommrules26.o  \
/home/rosetta/archive/rosetta3/spanish/commrules26.pf  \
/home/rosetta/archive/rosetta3/spanish/decommrules26.pf : /home/rosetta/archive/rosetta3/spanish/mrules26.out ;
 
/home/rosetta/archive/rosetta3/spanish/mrules26.out : /home/rosetta/archive/rosetta3/spanish/mrules26.mrule  \
                               /home/rosetta/archive/rosetta3/spanish/neededinmrules.pf;
	touch $(language)/target/mrules26.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules26
 
 
  
  
/home/rosetta/archive/rosetta3/spanish/commrules27.o  \
/home/rosetta/archive/rosetta3/spanish/decommrules27.o  \
/home/rosetta/archive/rosetta3/spanish/commrules27.pf  \
/home/rosetta/archive/rosetta3/spanish/decommrules27.pf : /home/rosetta/archive/rosetta3/spanish/mrules27.out ;
 
/home/rosetta/archive/rosetta3/spanish/mrules27.out : /home/rosetta/archive/rosetta3/spanish/mrules27.mrule  \
                               /home/rosetta/archive/rosetta3/spanish/neededinmrules.pf;
	touch $(language)/target/mrules27.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules27
 
 
  
/home/rosetta/archive/rosetta3/spanish/commrules28.o  \
/home/rosetta/archive/rosetta3/spanish/decommrules28.o  \
/home/rosetta/archive/rosetta3/spanish/commrules28.pf  \
/home/rosetta/archive/rosetta3/spanish/decommrules28.pf : /home/rosetta/archive/rosetta3/spanish/mrules28.out ;
 
/home/rosetta/archive/rosetta3/spanish/mrules28.out : /home/rosetta/archive/rosetta3/spanish/mrules28.mrule  \
                               /home/rosetta/archive/rosetta3/spanish/neededinmrules.pf;
	touch $(language)/target/mrules28.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules28
 
 
  
  
/home/rosetta/archive/rosetta3/spanish/commrules29.o  \
/home/rosetta/archive/rosetta3/spanish/decommrules29.o  \
/home/rosetta/archive/rosetta3/spanish/commrules29.pf  \
/home/rosetta/archive/rosetta3/spanish/decommrules29.pf : /home/rosetta/archive/rosetta3/spanish/mrules29.out ;
 
/home/rosetta/archive/rosetta3/spanish/mrules29.out : /home/rosetta/archive/rosetta3/spanish/mrules29.mrule  \
                               /home/rosetta/archive/rosetta3/spanish/neededinmrules.pf;
	touch $(language)/target/mrules29.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules29
 
 
  
/home/rosetta/archive/rosetta3/spanish/commrules30.o  \
/home/rosetta/archive/rosetta3/spanish/decommrules30.o  \
/home/rosetta/archive/rosetta3/spanish/commrules30.pf  \
/home/rosetta/archive/rosetta3/spanish/decommrules30.pf : /home/rosetta/archive/rosetta3/spanish/mrules30.out ;
 
/home/rosetta/archive/rosetta3/spanish/mrules30.out : /home/rosetta/archive/rosetta3/spanish/mrules30.mrule  \
                               /home/rosetta/archive/rosetta3/spanish/neededinmrules.pf;
	touch $(language)/target/mrules30.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules30
 
 
  
/home/rosetta/archive/rosetta3/spanish/commrules31.o  \
/home/rosetta/archive/rosetta3/spanish/decommrules31.o  \
/home/rosetta/archive/rosetta3/spanish/commrules31.pf  \
/home/rosetta/archive/rosetta3/spanish/decommrules31.pf : /home/rosetta/archive/rosetta3/spanish/mrules31.out ;
 
/home/rosetta/archive/rosetta3/spanish/mrules31.out : /home/rosetta/archive/rosetta3/spanish/mrules31.mrule  \
                               /home/rosetta/archive/rosetta3/spanish/neededinmrules.pf;
	touch $(language)/target/mrules31.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules31
 
 
  
/home/rosetta/archive/rosetta3/spanish/commrules32.o  \
/home/rosetta/archive/rosetta3/spanish/decommrules32.o  \
/home/rosetta/archive/rosetta3/spanish/commrules32.pf  \
/home/rosetta/archive/rosetta3/spanish/decommrules32.pf : /home/rosetta/archive/rosetta3/spanish/mrules32.out ;
 
/home/rosetta/archive/rosetta3/spanish/mrules32.out : /home/rosetta/archive/rosetta3/spanish/mrules32.mrule  \
                               /home/rosetta/archive/rosetta3/spanish/neededinmrules.pf;
	touch $(language)/target/mrules32.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules32
 
 
  
/home/rosetta/archive/rosetta3/spanish/commrules33.o  \
/home/rosetta/archive/rosetta3/spanish/decommrules33.o  \
/home/rosetta/archive/rosetta3/spanish/commrules33.pf  \
/home/rosetta/archive/rosetta3/spanish/decommrules33.pf : /home/rosetta/archive/rosetta3/spanish/mrules33.out ;
 
/home/rosetta/archive/rosetta3/spanish/mrules33.out : /home/rosetta/archive/rosetta3/spanish/mrules33.mrule  \
                               /home/rosetta/archive/rosetta3/spanish/neededinmrules.pf;
	touch $(language)/target/mrules33.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules33
 
 
  
/home/rosetta/archive/rosetta3/spanish/commrules34.o  \
/home/rosetta/archive/rosetta3/spanish/decommrules34.o  \
/home/rosetta/archive/rosetta3/spanish/commrules34.pf  \
/home/rosetta/archive/rosetta3/spanish/decommrules34.pf : /home/rosetta/archive/rosetta3/spanish/mrules34.out ;
 
/home/rosetta/archive/rosetta3/spanish/mrules34.out : /home/rosetta/archive/rosetta3/spanish/mrules34.mrule  \
                               /home/rosetta/archive/rosetta3/spanish/neededinmrules.pf;
	touch $(language)/target/mrules34.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules34
 
 
  
  
/home/rosetta/archive/rosetta3/spanish/commrules35.o  \
/home/rosetta/archive/rosetta3/spanish/decommrules35.o  \
/home/rosetta/archive/rosetta3/spanish/commrules35.pf  \
/home/rosetta/archive/rosetta3/spanish/decommrules35.pf : /home/rosetta/archive/rosetta3/spanish/mrules35.out ;
 
/home/rosetta/archive/rosetta3/spanish/mrules35.out : /home/rosetta/archive/rosetta3/spanish/mrules35.mrule  \
                               /home/rosetta/archive/rosetta3/spanish/neededinmrules.pf;
	touch $(language)/target/mrules35.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules35
 
 
  
/home/rosetta/archive/rosetta3/spanish/commrules36.o  \
/home/rosetta/archive/rosetta3/spanish/decommrules36.o  \
/home/rosetta/archive/rosetta3/spanish/commrules36.pf  \
/home/rosetta/archive/rosetta3/spanish/decommrules36.pf : /home/rosetta/archive/rosetta3/spanish/mrules36.out ;
 
/home/rosetta/archive/rosetta3/spanish/mrules36.out : /home/rosetta/archive/rosetta3/spanish/mrules36.mrule  \
                               /home/rosetta/archive/rosetta3/spanish/neededinmrules.pf;
	touch $(language)/target/mrules36.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules36
 
 
  
  
/home/rosetta/archive/rosetta3/spanish/commrules37.o  \
/home/rosetta/archive/rosetta3/spanish/decommrules37.o  \
/home/rosetta/archive/rosetta3/spanish/commrules37.pf  \
/home/rosetta/archive/rosetta3/spanish/decommrules37.pf : /home/rosetta/archive/rosetta3/spanish/mrules37.out ;
 
/home/rosetta/archive/rosetta3/spanish/mrules37.out : /home/rosetta/archive/rosetta3/spanish/mrules37.mrule  \
                               /home/rosetta/archive/rosetta3/spanish/neededinmrules.pf;
	touch $(language)/target/mrules37.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules37
 
 
  
/home/rosetta/archive/rosetta3/spanish/commrules38.o  \
/home/rosetta/archive/rosetta3/spanish/decommrules38.o  \
/home/rosetta/archive/rosetta3/spanish/commrules38.pf  \
/home/rosetta/archive/rosetta3/spanish/decommrules38.pf : /home/rosetta/archive/rosetta3/spanish/mrules38.out ;
 
/home/rosetta/archive/rosetta3/spanish/mrules38.out : /home/rosetta/archive/rosetta3/spanish/mrules38.mrule  \
                               /home/rosetta/archive/rosetta3/spanish/neededinmrules.pf;
	touch $(language)/target/mrules38.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules38
 
 
  
  
/home/rosetta/archive/rosetta3/spanish/commrules39.o  \
/home/rosetta/archive/rosetta3/spanish/decommrules39.o  \
/home/rosetta/archive/rosetta3/spanish/commrules39.pf  \
/home/rosetta/archive/rosetta3/spanish/decommrules39.pf : /home/rosetta/archive/rosetta3/spanish/mrules39.out ;
 
/home/rosetta/archive/rosetta3/spanish/mrules39.out : /home/rosetta/archive/rosetta3/spanish/mrules39.mrule  \
                               /home/rosetta/archive/rosetta3/spanish/neededinmrules.pf;
	touch $(language)/target/mrules39.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules39
 
 
  
/home/rosetta/archive/rosetta3/spanish/commrules40.o  \
/home/rosetta/archive/rosetta3/spanish/decommrules40.o  \
/home/rosetta/archive/rosetta3/spanish/commrules40.pf  \
/home/rosetta/archive/rosetta3/spanish/decommrules40.pf : /home/rosetta/archive/rosetta3/spanish/mrules40.out ;
 
/home/rosetta/archive/rosetta3/spanish/mrules40.out : /home/rosetta/archive/rosetta3/spanish/mrules40.mrule  \
                               /home/rosetta/archive/rosetta3/spanish/neededinmrules.pf;
	touch $(language)/target/mrules40.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules40
 
 
  
/home/rosetta/archive/rosetta3/spanish/commrules41.o  \
/home/rosetta/archive/rosetta3/spanish/decommrules41.o  \
/home/rosetta/archive/rosetta3/spanish/commrules41.pf  \
/home/rosetta/archive/rosetta3/spanish/decommrules41.pf : /home/rosetta/archive/rosetta3/spanish/mrules41.out ;
 
/home/rosetta/archive/rosetta3/spanish/mrules41.out : /home/rosetta/archive/rosetta3/spanish/mrules41.mrule  \
                               /home/rosetta/archive/rosetta3/spanish/neededinmrules.pf;
	touch $(language)/target/mrules41.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules41
 
 
  
/home/rosetta/archive/rosetta3/spanish/commrules42.o  \
/home/rosetta/archive/rosetta3/spanish/decommrules42.o  \
/home/rosetta/archive/rosetta3/spanish/commrules42.pf  \
/home/rosetta/archive/rosetta3/spanish/decommrules42.pf : /home/rosetta/archive/rosetta3/spanish/mrules42.out ;
 
/home/rosetta/archive/rosetta3/spanish/mrules42.out : /home/rosetta/archive/rosetta3/spanish/mrules42.mrule  \
                               /home/rosetta/archive/rosetta3/spanish/neededinmrules.pf;
	touch $(language)/target/mrules42.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules42
 
 
  
/home/rosetta/archive/rosetta3/spanish/commrules43.o  \
/home/rosetta/archive/rosetta3/spanish/decommrules43.o  \
/home/rosetta/archive/rosetta3/spanish/commrules43.pf  \
/home/rosetta/archive/rosetta3/spanish/decommrules43.pf : /home/rosetta/archive/rosetta3/spanish/mrules43.out ;
 
/home/rosetta/archive/rosetta3/spanish/mrules43.out : /home/rosetta/archive/rosetta3/spanish/mrules43.mrule  \
                               /home/rosetta/archive/rosetta3/spanish/neededinmrules.pf;
	touch $(language)/target/mrules43.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules43
 
 
  
/home/rosetta/archive/rosetta3/spanish/commrules44.o  \
/home/rosetta/archive/rosetta3/spanish/decommrules44.o  \
/home/rosetta/archive/rosetta3/spanish/commrules44.pf  \
/home/rosetta/archive/rosetta3/spanish/decommrules44.pf : /home/rosetta/archive/rosetta3/spanish/mrules44.out ;
 
/home/rosetta/archive/rosetta3/spanish/mrules44.out : /home/rosetta/archive/rosetta3/spanish/mrules44.mrule  \
                               /home/rosetta/archive/rosetta3/spanish/neededinmrules.pf;
	touch $(language)/target/mrules44.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules44
 
 
  
  
/home/rosetta/archive/rosetta3/spanish/commrules45.o  \
/home/rosetta/archive/rosetta3/spanish/decommrules45.o  \
/home/rosetta/archive/rosetta3/spanish/commrules45.pf  \
/home/rosetta/archive/rosetta3/spanish/decommrules45.pf : /home/rosetta/archive/rosetta3/spanish/mrules45.out ;
 
/home/rosetta/archive/rosetta3/spanish/mrules45.out : /home/rosetta/archive/rosetta3/spanish/mrules45.mrule  \
                               /home/rosetta/archive/rosetta3/spanish/neededinmrules.pf;
	touch $(language)/target/mrules45.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules45
 
 
  
/home/rosetta/archive/rosetta3/spanish/commrules46.o  \
/home/rosetta/archive/rosetta3/spanish/decommrules46.o  \
/home/rosetta/archive/rosetta3/spanish/commrules46.pf  \
/home/rosetta/archive/rosetta3/spanish/decommrules46.pf : /home/rosetta/archive/rosetta3/spanish/mrules46.out ;
 
/home/rosetta/archive/rosetta3/spanish/mrules46.out : /home/rosetta/archive/rosetta3/spanish/mrules46.mrule  \
                               /home/rosetta/archive/rosetta3/spanish/neededinmrules.pf;
	touch $(language)/target/mrules46.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules46
 
 
  
  
/home/rosetta/archive/rosetta3/spanish/commrules47.o  \
/home/rosetta/archive/rosetta3/spanish/decommrules47.o  \
/home/rosetta/archive/rosetta3/spanish/commrules47.pf  \
/home/rosetta/archive/rosetta3/spanish/decommrules47.pf : /home/rosetta/archive/rosetta3/spanish/mrules47.out ;
 
/home/rosetta/archive/rosetta3/spanish/mrules47.out : /home/rosetta/archive/rosetta3/spanish/mrules47.mrule  \
                               /home/rosetta/archive/rosetta3/spanish/neededinmrules.pf;
	touch $(language)/target/mrules47.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules47
 
 
  
/home/rosetta/archive/rosetta3/spanish/commrules48.o  \
/home/rosetta/archive/rosetta3/spanish/decommrules48.o  \
/home/rosetta/archive/rosetta3/spanish/commrules48.pf  \
/home/rosetta/archive/rosetta3/spanish/decommrules48.pf : /home/rosetta/archive/rosetta3/spanish/mrules48.out ;
 
/home/rosetta/archive/rosetta3/spanish/mrules48.out : /home/rosetta/archive/rosetta3/spanish/mrules48.mrule  \
                               /home/rosetta/archive/rosetta3/spanish/neededinmrules.pf;
	touch $(language)/target/mrules48.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules48
 
 
  
  
/home/rosetta/archive/rosetta3/spanish/commrules49.o  \
/home/rosetta/archive/rosetta3/spanish/decommrules49.o  \
/home/rosetta/archive/rosetta3/spanish/commrules49.pf  \
/home/rosetta/archive/rosetta3/spanish/decommrules49.pf : /home/rosetta/archive/rosetta3/spanish/mrules49.out ;
 
/home/rosetta/archive/rosetta3/spanish/mrules49.out : /home/rosetta/archive/rosetta3/spanish/mrules49.mrule  \
                               /home/rosetta/archive/rosetta3/spanish/neededinmrules.pf;
	touch $(language)/target/mrules49.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules49
 
 
  
/home/rosetta/archive/rosetta3/spanish/commrules50.o  \
/home/rosetta/archive/rosetta3/spanish/decommrules50.o  \
/home/rosetta/archive/rosetta3/spanish/commrules50.pf  \
/home/rosetta/archive/rosetta3/spanish/decommrules50.pf : /home/rosetta/archive/rosetta3/spanish/mrules50.out ;
 
/home/rosetta/archive/rosetta3/spanish/mrules50.out : /home/rosetta/archive/rosetta3/spanish/mrules50.mrule  \
                               /home/rosetta/archive/rosetta3/spanish/neededinmrules.pf;
	touch $(language)/target/mrules50.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules50
 
 
  
/home/rosetta/archive/rosetta3/spanish/commrules51.o  \
/home/rosetta/archive/rosetta3/spanish/decommrules51.o  \
/home/rosetta/archive/rosetta3/spanish/commrules51.pf  \
/home/rosetta/archive/rosetta3/spanish/decommrules51.pf : /home/rosetta/archive/rosetta3/spanish/mrules51.out ;
 
/home/rosetta/archive/rosetta3/spanish/mrules51.out : /home/rosetta/archive/rosetta3/spanish/mrules51.mrule  \
                               /home/rosetta/archive/rosetta3/spanish/neededinmrules.pf;
	touch $(language)/target/mrules51.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules51
 
 
  
/home/rosetta/archive/rosetta3/spanish/commrules52.o  \
/home/rosetta/archive/rosetta3/spanish/decommrules52.o  \
/home/rosetta/archive/rosetta3/spanish/commrules52.pf  \
/home/rosetta/archive/rosetta3/spanish/decommrules52.pf : /home/rosetta/archive/rosetta3/spanish/mrules52.out ;
 
/home/rosetta/archive/rosetta3/spanish/mrules52.out : /home/rosetta/archive/rosetta3/spanish/mrules52.mrule  \
                               /home/rosetta/archive/rosetta3/spanish/neededinmrules.pf;
	touch $(language)/target/mrules52.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules52
 
 
  
/home/rosetta/archive/rosetta3/spanish/commrules53.o  \
/home/rosetta/archive/rosetta3/spanish/decommrules53.o  \
/home/rosetta/archive/rosetta3/spanish/commrules53.pf  \
/home/rosetta/archive/rosetta3/spanish/decommrules53.pf : /home/rosetta/archive/rosetta3/spanish/mrules53.out ;
 
/home/rosetta/archive/rosetta3/spanish/mrules53.out : /home/rosetta/archive/rosetta3/spanish/mrules53.mrule  \
                               /home/rosetta/archive/rosetta3/spanish/neededinmrules.pf;
	touch $(language)/target/mrules53.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules53
 
 
  
/home/rosetta/archive/rosetta3/spanish/commrules54.o  \
/home/rosetta/archive/rosetta3/spanish/decommrules54.o  \
/home/rosetta/archive/rosetta3/spanish/commrules54.pf  \
/home/rosetta/archive/rosetta3/spanish/decommrules54.pf : /home/rosetta/archive/rosetta3/spanish/mrules54.out ;
 
/home/rosetta/archive/rosetta3/spanish/mrules54.out : /home/rosetta/archive/rosetta3/spanish/mrules54.mrule  \
                               /home/rosetta/archive/rosetta3/spanish/neededinmrules.pf;
	touch $(language)/target/mrules54.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules54
 
 
  
  
/home/rosetta/archive/rosetta3/spanish/commrules55.o  \
/home/rosetta/archive/rosetta3/spanish/decommrules55.o  \
/home/rosetta/archive/rosetta3/spanish/commrules55.pf  \
/home/rosetta/archive/rosetta3/spanish/decommrules55.pf : /home/rosetta/archive/rosetta3/spanish/mrules55.out ;
 
/home/rosetta/archive/rosetta3/spanish/mrules55.out : /home/rosetta/archive/rosetta3/spanish/mrules55.mrule  \
                               /home/rosetta/archive/rosetta3/spanish/neededinmrules.pf;
	touch $(language)/target/mrules55.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules55
 
 
  
/home/rosetta/archive/rosetta3/spanish/commrules56.o  \
/home/rosetta/archive/rosetta3/spanish/decommrules56.o  \
/home/rosetta/archive/rosetta3/spanish/commrules56.pf  \
/home/rosetta/archive/rosetta3/spanish/decommrules56.pf : /home/rosetta/archive/rosetta3/spanish/mrules56.out ;
 
/home/rosetta/archive/rosetta3/spanish/mrules56.out : /home/rosetta/archive/rosetta3/spanish/mrules56.mrule  \
                               /home/rosetta/archive/rosetta3/spanish/neededinmrules.pf;
	touch $(language)/target/mrules56.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules56
 
 
  
  
/home/rosetta/archive/rosetta3/spanish/commrules57.o  \
/home/rosetta/archive/rosetta3/spanish/decommrules57.o  \
/home/rosetta/archive/rosetta3/spanish/commrules57.pf  \
/home/rosetta/archive/rosetta3/spanish/decommrules57.pf : /home/rosetta/archive/rosetta3/spanish/mrules57.out ;
 
/home/rosetta/archive/rosetta3/spanish/mrules57.out : /home/rosetta/archive/rosetta3/spanish/mrules57.mrule  \
                               /home/rosetta/archive/rosetta3/spanish/neededinmrules.pf;
	touch $(language)/target/mrules57.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules57
 
 
  
/home/rosetta/archive/rosetta3/spanish/commrules58.o  \
/home/rosetta/archive/rosetta3/spanish/decommrules58.o  \
/home/rosetta/archive/rosetta3/spanish/commrules58.pf  \
/home/rosetta/archive/rosetta3/spanish/decommrules58.pf : /home/rosetta/archive/rosetta3/spanish/mrules58.out ;
 
/home/rosetta/archive/rosetta3/spanish/mrules58.out : /home/rosetta/archive/rosetta3/spanish/mrules58.mrule  \
                               /home/rosetta/archive/rosetta3/spanish/neededinmrules.pf;
	touch $(language)/target/mrules58.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules58
 
 
  
  
/home/rosetta/archive/rosetta3/spanish/commrules59.o  \
/home/rosetta/archive/rosetta3/spanish/decommrules59.o  \
/home/rosetta/archive/rosetta3/spanish/commrules59.pf  \
/home/rosetta/archive/rosetta3/spanish/decommrules59.pf : /home/rosetta/archive/rosetta3/spanish/mrules59.out ;
 
/home/rosetta/archive/rosetta3/spanish/mrules59.out : /home/rosetta/archive/rosetta3/spanish/mrules59.mrule  \
                               /home/rosetta/archive/rosetta3/spanish/neededinmrules.pf;
	touch $(language)/target/mrules59.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules59
 
 
  
/home/rosetta/archive/rosetta3/spanish/commrules60.o  \
/home/rosetta/archive/rosetta3/spanish/decommrules60.o  \
/home/rosetta/archive/rosetta3/spanish/commrules60.pf  \
/home/rosetta/archive/rosetta3/spanish/decommrules60.pf : /home/rosetta/archive/rosetta3/spanish/mrules60.out ;
 
/home/rosetta/archive/rosetta3/spanish/mrules60.out : /home/rosetta/archive/rosetta3/spanish/mrules60.mrule  \
                               /home/rosetta/archive/rosetta3/spanish/neededinmrules.pf;
	touch $(language)/target/mrules60.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules60
 
 
  
/home/rosetta/archive/rosetta3/spanish/commrules61.o  \
/home/rosetta/archive/rosetta3/spanish/decommrules61.o  \
/home/rosetta/archive/rosetta3/spanish/commrules61.pf  \
/home/rosetta/archive/rosetta3/spanish/decommrules61.pf : /home/rosetta/archive/rosetta3/spanish/mrules61.out ;
 
/home/rosetta/archive/rosetta3/spanish/mrules61.out : /home/rosetta/archive/rosetta3/spanish/mrules61.mrule  \
                               /home/rosetta/archive/rosetta3/spanish/neededinmrules.pf;
	touch $(language)/target/mrules61.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules61
 
 
  
/home/rosetta/archive/rosetta3/spanish/commrules62.o  \
/home/rosetta/archive/rosetta3/spanish/decommrules62.o  \
/home/rosetta/archive/rosetta3/spanish/commrules62.pf  \
/home/rosetta/archive/rosetta3/spanish/decommrules62.pf : /home/rosetta/archive/rosetta3/spanish/mrules62.out ;
 
/home/rosetta/archive/rosetta3/spanish/mrules62.out : /home/rosetta/archive/rosetta3/spanish/mrules62.mrule  \
                               /home/rosetta/archive/rosetta3/spanish/neededinmrules.pf;
	touch $(language)/target/mrules62.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules62
 
 
  
/home/rosetta/archive/rosetta3/spanish/commrules63.o  \
/home/rosetta/archive/rosetta3/spanish/decommrules63.o  \
/home/rosetta/archive/rosetta3/spanish/commrules63.pf  \
/home/rosetta/archive/rosetta3/spanish/decommrules63.pf : /home/rosetta/archive/rosetta3/spanish/mrules63.out ;
 
/home/rosetta/archive/rosetta3/spanish/mrules63.out : /home/rosetta/archive/rosetta3/spanish/mrules63.mrule  \
                               /home/rosetta/archive/rosetta3/spanish/neededinmrules.pf;
	touch $(language)/target/mrules63.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules63
 
 
  
/home/rosetta/archive/rosetta3/spanish/commrules64.o  \
/home/rosetta/archive/rosetta3/spanish/decommrules64.o  \
/home/rosetta/archive/rosetta3/spanish/commrules64.pf  \
/home/rosetta/archive/rosetta3/spanish/decommrules64.pf : /home/rosetta/archive/rosetta3/spanish/mrules64.out ;
 
/home/rosetta/archive/rosetta3/spanish/mrules64.out : /home/rosetta/archive/rosetta3/spanish/mrules64.mrule  \
                               /home/rosetta/archive/rosetta3/spanish/neededinmrules.pf;
	touch $(language)/target/mrules64.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules64
 
 
  
  
/home/rosetta/archive/rosetta3/spanish/commrules65.o  \
/home/rosetta/archive/rosetta3/spanish/decommrules65.o  \
/home/rosetta/archive/rosetta3/spanish/commrules65.pf  \
/home/rosetta/archive/rosetta3/spanish/decommrules65.pf : /home/rosetta/archive/rosetta3/spanish/mrules65.out ;
 
/home/rosetta/archive/rosetta3/spanish/mrules65.out : /home/rosetta/archive/rosetta3/spanish/mrules65.mrule  \
                               /home/rosetta/archive/rosetta3/spanish/neededinmrules.pf;
	touch $(language)/target/mrules65.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules65
 
 
  
/home/rosetta/archive/rosetta3/spanish/commrules66.o  \
/home/rosetta/archive/rosetta3/spanish/decommrules66.o  \
/home/rosetta/archive/rosetta3/spanish/commrules66.pf  \
/home/rosetta/archive/rosetta3/spanish/decommrules66.pf : /home/rosetta/archive/rosetta3/spanish/mrules66.out ;
 
/home/rosetta/archive/rosetta3/spanish/mrules66.out : /home/rosetta/archive/rosetta3/spanish/mrules66.mrule  \
                               /home/rosetta/archive/rosetta3/spanish/neededinmrules.pf;
	touch $(language)/target/mrules66.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules66
 
 
  
  
/home/rosetta/archive/rosetta3/spanish/commrules67.o  \
/home/rosetta/archive/rosetta3/spanish/decommrules67.o  \
/home/rosetta/archive/rosetta3/spanish/commrules67.pf  \
/home/rosetta/archive/rosetta3/spanish/decommrules67.pf : /home/rosetta/archive/rosetta3/spanish/mrules67.out ;
 
/home/rosetta/archive/rosetta3/spanish/mrules67.out : /home/rosetta/archive/rosetta3/spanish/mrules67.mrule  \
                               /home/rosetta/archive/rosetta3/spanish/neededinmrules.pf;
	touch $(language)/target/mrules67.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules67
 
 
  
/home/rosetta/archive/rosetta3/spanish/commrules68.o  \
/home/rosetta/archive/rosetta3/spanish/decommrules68.o  \
/home/rosetta/archive/rosetta3/spanish/commrules68.pf  \
/home/rosetta/archive/rosetta3/spanish/decommrules68.pf : /home/rosetta/archive/rosetta3/spanish/mrules68.out ;
 
/home/rosetta/archive/rosetta3/spanish/mrules68.out : /home/rosetta/archive/rosetta3/spanish/mrules68.mrule  \
                               /home/rosetta/archive/rosetta3/spanish/neededinmrules.pf;
	touch $(language)/target/mrules68.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules68
 
 
  
  
/home/rosetta/archive/rosetta3/spanish/commrules69.o  \
/home/rosetta/archive/rosetta3/spanish/decommrules69.o  \
/home/rosetta/archive/rosetta3/spanish/commrules69.pf  \
/home/rosetta/archive/rosetta3/spanish/decommrules69.pf : /home/rosetta/archive/rosetta3/spanish/mrules69.out ;
 
/home/rosetta/archive/rosetta3/spanish/mrules69.out : /home/rosetta/archive/rosetta3/spanish/mrules69.mrule  \
                               /home/rosetta/archive/rosetta3/spanish/neededinmrules.pf;
	touch $(language)/target/mrules69.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules69
 
 
  
/home/rosetta/archive/rosetta3/spanish/commrules70.o  \
/home/rosetta/archive/rosetta3/spanish/decommrules70.o  \
/home/rosetta/archive/rosetta3/spanish/commrules70.pf  \
/home/rosetta/archive/rosetta3/spanish/decommrules70.pf : /home/rosetta/archive/rosetta3/spanish/mrules70.out ;
 
/home/rosetta/archive/rosetta3/spanish/mrules70.out : /home/rosetta/archive/rosetta3/spanish/mrules70.mrule  \
                               /home/rosetta/archive/rosetta3/spanish/neededinmrules.pf;
	touch $(language)/target/mrules70.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules70
 
 
  
/home/rosetta/archive/rosetta3/spanish/commrules71.o  \
/home/rosetta/archive/rosetta3/spanish/decommrules71.o  \
/home/rosetta/archive/rosetta3/spanish/commrules71.pf  \
/home/rosetta/archive/rosetta3/spanish/decommrules71.pf : /home/rosetta/archive/rosetta3/spanish/mrules71.out ;
 
/home/rosetta/archive/rosetta3/spanish/mrules71.out : /home/rosetta/archive/rosetta3/spanish/mrules71.mrule  \
                               /home/rosetta/archive/rosetta3/spanish/neededinmrules.pf;
	touch $(language)/target/mrules71.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules71
 
 
  
/home/rosetta/archive/rosetta3/spanish/commrules72.o  \
/home/rosetta/archive/rosetta3/spanish/decommrules72.o  \
/home/rosetta/archive/rosetta3/spanish/commrules72.pf  \
/home/rosetta/archive/rosetta3/spanish/decommrules72.pf : /home/rosetta/archive/rosetta3/spanish/mrules72.out ;
 
/home/rosetta/archive/rosetta3/spanish/mrules72.out : /home/rosetta/archive/rosetta3/spanish/mrules72.mrule  \
                               /home/rosetta/archive/rosetta3/spanish/neededinmrules.pf;
	touch $(language)/target/mrules72.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules72
 
 
  
/home/rosetta/archive/rosetta3/spanish/commrules73.o  \
/home/rosetta/archive/rosetta3/spanish/decommrules73.o  \
/home/rosetta/archive/rosetta3/spanish/commrules73.pf  \
/home/rosetta/archive/rosetta3/spanish/decommrules73.pf : /home/rosetta/archive/rosetta3/spanish/mrules73.out ;
 
/home/rosetta/archive/rosetta3/spanish/mrules73.out : /home/rosetta/archive/rosetta3/spanish/mrules73.mrule  \
                               /home/rosetta/archive/rosetta3/spanish/neededinmrules.pf;
	touch $(language)/target/mrules73.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules73
 
 
  
/home/rosetta/archive/rosetta3/spanish/commrules74.o  \
/home/rosetta/archive/rosetta3/spanish/decommrules74.o  \
/home/rosetta/archive/rosetta3/spanish/commrules74.pf  \
/home/rosetta/archive/rosetta3/spanish/decommrules74.pf : /home/rosetta/archive/rosetta3/spanish/mrules74.out ;
 
/home/rosetta/archive/rosetta3/spanish/mrules74.out : /home/rosetta/archive/rosetta3/spanish/mrules74.mrule  \
                               /home/rosetta/archive/rosetta3/spanish/neededinmrules.pf;
	touch $(language)/target/mrules74.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules74
 
 
  
  
/home/rosetta/archive/rosetta3/spanish/commrules75.o  \
/home/rosetta/archive/rosetta3/spanish/decommrules75.o  \
/home/rosetta/archive/rosetta3/spanish/commrules75.pf  \
/home/rosetta/archive/rosetta3/spanish/decommrules75.pf : /home/rosetta/archive/rosetta3/spanish/mrules75.out ;
 
/home/rosetta/archive/rosetta3/spanish/mrules75.out : /home/rosetta/archive/rosetta3/spanish/mrules75.mrule  \
                               /home/rosetta/archive/rosetta3/spanish/neededinmrules.pf;
	touch $(language)/target/mrules75.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules75
 
 
  
/home/rosetta/archive/rosetta3/spanish/commrules76.o  \
/home/rosetta/archive/rosetta3/spanish/decommrules76.o  \
/home/rosetta/archive/rosetta3/spanish/commrules76.pf  \
/home/rosetta/archive/rosetta3/spanish/decommrules76.pf : /home/rosetta/archive/rosetta3/spanish/mrules76.out ;
 
/home/rosetta/archive/rosetta3/spanish/mrules76.out : /home/rosetta/archive/rosetta3/spanish/mrules76.mrule  \
                               /home/rosetta/archive/rosetta3/spanish/neededinmrules.pf;
	touch $(language)/target/mrules76.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules76
 
 
  
  
/home/rosetta/archive/rosetta3/spanish/commrules77.o  \
/home/rosetta/archive/rosetta3/spanish/decommrules77.o  \
/home/rosetta/archive/rosetta3/spanish/commrules77.pf  \
/home/rosetta/archive/rosetta3/spanish/decommrules77.pf : /home/rosetta/archive/rosetta3/spanish/mrules77.out ;
 
/home/rosetta/archive/rosetta3/spanish/mrules77.out : /home/rosetta/archive/rosetta3/spanish/mrules77.mrule  \
                               /home/rosetta/archive/rosetta3/spanish/neededinmrules.pf;
	touch $(language)/target/mrules77.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules77
 
 
  
/home/rosetta/archive/rosetta3/spanish/commrules78.o  \
/home/rosetta/archive/rosetta3/spanish/decommrules78.o  \
/home/rosetta/archive/rosetta3/spanish/commrules78.pf  \
/home/rosetta/archive/rosetta3/spanish/decommrules78.pf : /home/rosetta/archive/rosetta3/spanish/mrules78.out ;
 
/home/rosetta/archive/rosetta3/spanish/mrules78.out : /home/rosetta/archive/rosetta3/spanish/mrules78.mrule  \
                               /home/rosetta/archive/rosetta3/spanish/neededinmrules.pf;
	touch $(language)/target/mrules78.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules78
 
 
  
  
/home/rosetta/archive/rosetta3/spanish/commrules79.o  \
/home/rosetta/archive/rosetta3/spanish/decommrules79.o  \
/home/rosetta/archive/rosetta3/spanish/commrules79.pf  \
/home/rosetta/archive/rosetta3/spanish/decommrules79.pf : /home/rosetta/archive/rosetta3/spanish/mrules79.out ;
 
/home/rosetta/archive/rosetta3/spanish/mrules79.out : /home/rosetta/archive/rosetta3/spanish/mrules79.mrule  \
                               /home/rosetta/archive/rosetta3/spanish/neededinmrules.pf;
	touch $(language)/target/mrules79.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules79
 
 
  
/home/rosetta/archive/rosetta3/spanish/commrules80.o  \
/home/rosetta/archive/rosetta3/spanish/decommrules80.o  \
/home/rosetta/archive/rosetta3/spanish/commrules80.pf  \
/home/rosetta/archive/rosetta3/spanish/decommrules80.pf : /home/rosetta/archive/rosetta3/spanish/mrules80.out ;
 
/home/rosetta/archive/rosetta3/spanish/mrules80.out : /home/rosetta/archive/rosetta3/spanish/mrules80.mrule  \
                               /home/rosetta/archive/rosetta3/spanish/neededinmrules.pf;
	touch $(language)/target/mrules80.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules80
 
 
  
/home/rosetta/archive/rosetta3/spanish/commrules81.o  \
/home/rosetta/archive/rosetta3/spanish/decommrules81.o  \
/home/rosetta/archive/rosetta3/spanish/commrules81.pf  \
/home/rosetta/archive/rosetta3/spanish/decommrules81.pf : /home/rosetta/archive/rosetta3/spanish/mrules81.out ;
 
/home/rosetta/archive/rosetta3/spanish/mrules81.out : /home/rosetta/archive/rosetta3/spanish/mrules81.mrule  \
                               /home/rosetta/archive/rosetta3/spanish/neededinmrules.pf;
	touch $(language)/target/mrules81.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules81
 
 
  
/home/rosetta/archive/rosetta3/spanish/commrules82.o  \
/home/rosetta/archive/rosetta3/spanish/decommrules82.o  \
/home/rosetta/archive/rosetta3/spanish/commrules82.pf  \
/home/rosetta/archive/rosetta3/spanish/decommrules82.pf : /home/rosetta/archive/rosetta3/spanish/mrules82.out ;
 
/home/rosetta/archive/rosetta3/spanish/mrules82.out : /home/rosetta/archive/rosetta3/spanish/mrules82.mrule  \
                               /home/rosetta/archive/rosetta3/spanish/neededinmrules.pf;
	touch $(language)/target/mrules82.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules82
 
 
  
/home/rosetta/archive/rosetta3/spanish/commrules83.o  \
/home/rosetta/archive/rosetta3/spanish/decommrules83.o  \
/home/rosetta/archive/rosetta3/spanish/commrules83.pf  \
/home/rosetta/archive/rosetta3/spanish/decommrules83.pf : /home/rosetta/archive/rosetta3/spanish/mrules83.out ;
 
/home/rosetta/archive/rosetta3/spanish/mrules83.out : /home/rosetta/archive/rosetta3/spanish/mrules83.mrule  \
                               /home/rosetta/archive/rosetta3/spanish/neededinmrules.pf;
	touch $(language)/target/mrules83.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules83
 
 
  
/home/rosetta/archive/rosetta3/spanish/commrules84.o  \
/home/rosetta/archive/rosetta3/spanish/decommrules84.o  \
/home/rosetta/archive/rosetta3/spanish/commrules84.pf  \
/home/rosetta/archive/rosetta3/spanish/decommrules84.pf : /home/rosetta/archive/rosetta3/spanish/mrules84.out ;
 
/home/rosetta/archive/rosetta3/spanish/mrules84.out : /home/rosetta/archive/rosetta3/spanish/mrules84.mrule  \
                               /home/rosetta/archive/rosetta3/spanish/neededinmrules.pf;
	touch $(language)/target/mrules84.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules84
 
 
  
  
/home/rosetta/archive/rosetta3/spanish/commrules85.o  \
/home/rosetta/archive/rosetta3/spanish/decommrules85.o  \
/home/rosetta/archive/rosetta3/spanish/commrules85.pf  \
/home/rosetta/archive/rosetta3/spanish/decommrules85.pf : /home/rosetta/archive/rosetta3/spanish/mrules85.out ;
 
/home/rosetta/archive/rosetta3/spanish/mrules85.out : /home/rosetta/archive/rosetta3/spanish/mrules85.mrule  \
                               /home/rosetta/archive/rosetta3/spanish/neededinmrules.pf;
	touch $(language)/target/mrules85.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules85
 
 
  
/home/rosetta/archive/rosetta3/spanish/commrules86.o  \
/home/rosetta/archive/rosetta3/spanish/decommrules86.o  \
/home/rosetta/archive/rosetta3/spanish/commrules86.pf  \
/home/rosetta/archive/rosetta3/spanish/decommrules86.pf : /home/rosetta/archive/rosetta3/spanish/mrules86.out ;
 
/home/rosetta/archive/rosetta3/spanish/mrules86.out : /home/rosetta/archive/rosetta3/spanish/mrules86.mrule  \
                               /home/rosetta/archive/rosetta3/spanish/neededinmrules.pf;
	touch $(language)/target/mrules86.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules86
 
 
  
  
/home/rosetta/archive/rosetta3/spanish/commrules87.o  \
/home/rosetta/archive/rosetta3/spanish/decommrules87.o  \
/home/rosetta/archive/rosetta3/spanish/commrules87.pf  \
/home/rosetta/archive/rosetta3/spanish/decommrules87.pf : /home/rosetta/archive/rosetta3/spanish/mrules87.out ;
 
/home/rosetta/archive/rosetta3/spanish/mrules87.out : /home/rosetta/archive/rosetta3/spanish/mrules87.mrule  \
                               /home/rosetta/archive/rosetta3/spanish/neededinmrules.pf;
	touch $(language)/target/mrules87.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules87
 
 
  
/home/rosetta/archive/rosetta3/spanish/commrules88.o  \
/home/rosetta/archive/rosetta3/spanish/decommrules88.o  \
/home/rosetta/archive/rosetta3/spanish/commrules88.pf  \
/home/rosetta/archive/rosetta3/spanish/decommrules88.pf : /home/rosetta/archive/rosetta3/spanish/mrules88.out ;
 
/home/rosetta/archive/rosetta3/spanish/mrules88.out : /home/rosetta/archive/rosetta3/spanish/mrules88.mrule  \
                               /home/rosetta/archive/rosetta3/spanish/neededinmrules.pf;
	touch $(language)/target/mrules88.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules88
 
 
  
  
/home/rosetta/archive/rosetta3/spanish/commrules89.o  \
/home/rosetta/archive/rosetta3/spanish/decommrules89.o  \
/home/rosetta/archive/rosetta3/spanish/commrules89.pf  \
/home/rosetta/archive/rosetta3/spanish/decommrules89.pf : /home/rosetta/archive/rosetta3/spanish/mrules89.out ;
 
/home/rosetta/archive/rosetta3/spanish/mrules89.out : /home/rosetta/archive/rosetta3/spanish/mrules89.mrule  \
                               /home/rosetta/archive/rosetta3/spanish/neededinmrules.pf;
	touch $(language)/target/mrules89.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules89
 
 
  
/home/rosetta/archive/rosetta3/spanish/commrules90.o  \
/home/rosetta/archive/rosetta3/spanish/decommrules90.o  \
/home/rosetta/archive/rosetta3/spanish/commrules90.pf  \
/home/rosetta/archive/rosetta3/spanish/decommrules90.pf : /home/rosetta/archive/rosetta3/spanish/mrules90.out ;
 
/home/rosetta/archive/rosetta3/spanish/mrules90.out : /home/rosetta/archive/rosetta3/spanish/mrules90.mrule  \
                               /home/rosetta/archive/rosetta3/spanish/neededinmrules.pf;
	touch $(language)/target/mrules90.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules90
 
 
  
/home/rosetta/archive/rosetta3/spanish/commrules91.o  \
/home/rosetta/archive/rosetta3/spanish/decommrules91.o  \
/home/rosetta/archive/rosetta3/spanish/commrules91.pf  \
/home/rosetta/archive/rosetta3/spanish/decommrules91.pf : /home/rosetta/archive/rosetta3/spanish/mrules91.out ;
 
/home/rosetta/archive/rosetta3/spanish/mrules91.out : /home/rosetta/archive/rosetta3/spanish/mrules91.mrule  \
                               /home/rosetta/archive/rosetta3/spanish/neededinmrules.pf;
	touch $(language)/target/mrules91.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules91
 
 
  
/home/rosetta/archive/rosetta3/spanish/commrules92.o  \
/home/rosetta/archive/rosetta3/spanish/decommrules92.o  \
/home/rosetta/archive/rosetta3/spanish/commrules92.pf  \
/home/rosetta/archive/rosetta3/spanish/decommrules92.pf : /home/rosetta/archive/rosetta3/spanish/mrules92.out ;
 
/home/rosetta/archive/rosetta3/spanish/mrules92.out : /home/rosetta/archive/rosetta3/spanish/mrules92.mrule  \
                               /home/rosetta/archive/rosetta3/spanish/neededinmrules.pf;
	touch $(language)/target/mrules92.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules92
 
 
  
/home/rosetta/archive/rosetta3/spanish/commrules93.o  \
/home/rosetta/archive/rosetta3/spanish/decommrules93.o  \
/home/rosetta/archive/rosetta3/spanish/commrules93.pf  \
/home/rosetta/archive/rosetta3/spanish/decommrules93.pf : /home/rosetta/archive/rosetta3/spanish/mrules93.out ;
 
/home/rosetta/archive/rosetta3/spanish/mrules93.out : /home/rosetta/archive/rosetta3/spanish/mrules93.mrule  \
                               /home/rosetta/archive/rosetta3/spanish/neededinmrules.pf;
	touch $(language)/target/mrules93.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules93
 
 
  
/home/rosetta/archive/rosetta3/spanish/commrules94.o  \
/home/rosetta/archive/rosetta3/spanish/decommrules94.o  \
/home/rosetta/archive/rosetta3/spanish/commrules94.pf  \
/home/rosetta/archive/rosetta3/spanish/decommrules94.pf : /home/rosetta/archive/rosetta3/spanish/mrules94.out ;
 
/home/rosetta/archive/rosetta3/spanish/mrules94.out : /home/rosetta/archive/rosetta3/spanish/mrules94.mrule  \
                               /home/rosetta/archive/rosetta3/spanish/neededinmrules.pf;
	touch $(language)/target/mrules94.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules94
 
 
  
  
/home/rosetta/archive/rosetta3/spanish/commrules95.o  \
/home/rosetta/archive/rosetta3/spanish/decommrules95.o  \
/home/rosetta/archive/rosetta3/spanish/commrules95.pf  \
/home/rosetta/archive/rosetta3/spanish/decommrules95.pf : /home/rosetta/archive/rosetta3/spanish/mrules95.out ;
 
/home/rosetta/archive/rosetta3/spanish/mrules95.out : /home/rosetta/archive/rosetta3/spanish/mrules95.mrule  \
                               /home/rosetta/archive/rosetta3/spanish/neededinmrules.pf;
	touch $(language)/target/mrules95.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules95
 
 
  
/home/rosetta/archive/rosetta3/spanish/commrules96.o  \
/home/rosetta/archive/rosetta3/spanish/decommrules96.o  \
/home/rosetta/archive/rosetta3/spanish/commrules96.pf  \
/home/rosetta/archive/rosetta3/spanish/decommrules96.pf : /home/rosetta/archive/rosetta3/spanish/mrules96.out ;
 
/home/rosetta/archive/rosetta3/spanish/mrules96.out : /home/rosetta/archive/rosetta3/spanish/mrules96.mrule  \
                               /home/rosetta/archive/rosetta3/spanish/neededinmrules.pf;
	touch $(language)/target/mrules96.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules96
 
 
  
  
/home/rosetta/archive/rosetta3/spanish/commrules97.o  \
/home/rosetta/archive/rosetta3/spanish/decommrules97.o  \
/home/rosetta/archive/rosetta3/spanish/commrules97.pf  \
/home/rosetta/archive/rosetta3/spanish/decommrules97.pf : /home/rosetta/archive/rosetta3/spanish/mrules97.out ;
 
/home/rosetta/archive/rosetta3/spanish/mrules97.out : /home/rosetta/archive/rosetta3/spanish/mrules97.mrule  \
                               /home/rosetta/archive/rosetta3/spanish/neededinmrules.pf;
	touch $(language)/target/mrules97.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules97
 
 
  
/home/rosetta/archive/rosetta3/spanish/commrules98.o  \
/home/rosetta/archive/rosetta3/spanish/decommrules98.o  \
/home/rosetta/archive/rosetta3/spanish/commrules98.pf  \
/home/rosetta/archive/rosetta3/spanish/decommrules98.pf : /home/rosetta/archive/rosetta3/spanish/mrules98.out ;
 
/home/rosetta/archive/rosetta3/spanish/mrules98.out : /home/rosetta/archive/rosetta3/spanish/mrules98.mrule  \
                               /home/rosetta/archive/rosetta3/spanish/neededinmrules.pf;
	touch $(language)/target/mrules98.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules98
 
 
  
/home/rosetta/archive/rosetta3/spanish/commrules99.o  \
/home/rosetta/archive/rosetta3/spanish/decommrules99.o  \
/home/rosetta/archive/rosetta3/spanish/commrules99.pf  \
/home/rosetta/archive/rosetta3/spanish/decommrules99.pf : /home/rosetta/archive/rosetta3/spanish/mrules99.out ;
 
/home/rosetta/archive/rosetta3/spanish/mrules99.out : /home/rosetta/archive/rosetta3/spanish/mrules99.mrule  \
                               /home/rosetta/archive/rosetta3/spanish/neededinmrules.pf;
	touch $(language)/target/mrules99.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules99
 
 
  
/home/rosetta/archive/rosetta3/spanish/commrules100.o  \
/home/rosetta/archive/rosetta3/spanish/decommrules100.o  \
/home/rosetta/archive/rosetta3/spanish/commrules100.pf  \
/home/rosetta/archive/rosetta3/spanish/decommrules100.pf : /home/rosetta/archive/rosetta3/spanish/mrules100.out ;
 
/home/rosetta/archive/rosetta3/spanish/mrules100.out : /home/rosetta/archive/rosetta3/spanish/mrules100.mrule  \
                               /home/rosetta/archive/rosetta3/spanish/neededinmrules.pf;
	touch $(language)/target/mrules100.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules100
 
 
  
/home/rosetta/archive/rosetta3/spanish/commrules101.o  \
/home/rosetta/archive/rosetta3/spanish/decommrules101.o  \
/home/rosetta/archive/rosetta3/spanish/commrules101.pf  \
/home/rosetta/archive/rosetta3/spanish/decommrules101.pf : /home/rosetta/archive/rosetta3/spanish/mrules101.out ;
 
/home/rosetta/archive/rosetta3/spanish/mrules101.out : /home/rosetta/archive/rosetta3/spanish/mrules101.mrule  \
                               /home/rosetta/archive/rosetta3/spanish/neededinmrules.pf;
	touch $(language)/target/mrules101.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules101
 
 
  
/home/rosetta/archive/rosetta3/spanish/commrules102.o  \
/home/rosetta/archive/rosetta3/spanish/decommrules102.o  \
/home/rosetta/archive/rosetta3/spanish/commrules102.pf  \
/home/rosetta/archive/rosetta3/spanish/decommrules102.pf : /home/rosetta/archive/rosetta3/spanish/mrules102.out ;
 
/home/rosetta/archive/rosetta3/spanish/mrules102.out : /home/rosetta/archive/rosetta3/spanish/mrules102.mrule  \
                               /home/rosetta/archive/rosetta3/spanish/neededinmrules.pf;
	touch $(language)/target/mrules102.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules102
 
 
  
/home/rosetta/archive/rosetta3/spanish/commrules103.o  \
/home/rosetta/archive/rosetta3/spanish/decommrules103.o  \
/home/rosetta/archive/rosetta3/spanish/commrules103.pf  \
/home/rosetta/archive/rosetta3/spanish/decommrules103.pf : /home/rosetta/archive/rosetta3/spanish/mrules103.out ;
 
/home/rosetta/archive/rosetta3/spanish/mrules103.out : /home/rosetta/archive/rosetta3/spanish/mrules103.mrule  \
                               /home/rosetta/archive/rosetta3/spanish/neededinmrules.pf;
	touch $(language)/target/mrules103.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules103
 
 
  
/home/rosetta/archive/rosetta3/spanish/commrules104.o  \
/home/rosetta/archive/rosetta3/spanish/decommrules104.o  \
/home/rosetta/archive/rosetta3/spanish/commrules104.pf  \
/home/rosetta/archive/rosetta3/spanish/decommrules104.pf : /home/rosetta/archive/rosetta3/spanish/mrules104.out ;
 
/home/rosetta/archive/rosetta3/spanish/mrules104.out : /home/rosetta/archive/rosetta3/spanish/mrules104.mrule  \
                               /home/rosetta/archive/rosetta3/spanish/neededinmrules.pf;
	touch $(language)/target/mrules104.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules104
 
 
  
  
/home/rosetta/archive/rosetta3/spanish/commrules105.o  \
/home/rosetta/archive/rosetta3/spanish/decommrules105.o  \
/home/rosetta/archive/rosetta3/spanish/commrules105.pf  \
/home/rosetta/archive/rosetta3/spanish/decommrules105.pf : /home/rosetta/archive/rosetta3/spanish/mrules105.out ;
 
/home/rosetta/archive/rosetta3/spanish/mrules105.out : /home/rosetta/archive/rosetta3/spanish/mrules105.mrule  \
                               /home/rosetta/archive/rosetta3/spanish/neededinmrules.pf;
	touch $(language)/target/mrules105.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules105
 
 
  
/home/rosetta/archive/rosetta3/spanish/commrules106.o  \
/home/rosetta/archive/rosetta3/spanish/decommrules106.o  \
/home/rosetta/archive/rosetta3/spanish/commrules106.pf  \
/home/rosetta/archive/rosetta3/spanish/decommrules106.pf : /home/rosetta/archive/rosetta3/spanish/mrules106.out ;
 
/home/rosetta/archive/rosetta3/spanish/mrules106.out : /home/rosetta/archive/rosetta3/spanish/mrules106.mrule  \
                               /home/rosetta/archive/rosetta3/spanish/neededinmrules.pf;
	touch $(language)/target/mrules106.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules106
 
 
  
#!!  
#!! idiom file 107, treated somewhat differently, see above   
#!!  
  
/home/rosetta/archive/rosetta3/spanish/commrules107.pf : /home/rosetta/archive/rosetta3/spanish/mrules107.mrule  \
                               /home/rosetta/archive/rosetta3/spanish/neededinmrules.pf;
	@/home/rosetta/archive/rosetta3/actions/mru $(language) mrules107
 
 
  
/home/rosetta/archive/rosetta3/spanish/commrules107.o  \
/home/rosetta/archive/rosetta3/spanish/decommrules107.o  \
/home/rosetta/archive/rosetta3/spanish/decommrules107.pf : /home/rosetta/archive/rosetta3/spanish/mrules107.out ;
 
/home/rosetta/archive/rosetta3/spanish/mrules107.out : /home/rosetta/archive/rosetta3/spanish/mrules107.mrule  \
                               /home/rosetta/archive/rosetta3/spanish/neededinmrules.pf;
	touch $(language)/target/mrules107.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules107
 
 
  
/home/rosetta/archive/rosetta3/spanish/commrules108.o  \
/home/rosetta/archive/rosetta3/spanish/decommrules108.o  \
/home/rosetta/archive/rosetta3/spanish/commrules108.pf  \
/home/rosetta/archive/rosetta3/spanish/decommrules108.pf : /home/rosetta/archive/rosetta3/spanish/mrules108.out ;
 
/home/rosetta/archive/rosetta3/spanish/mrules108.out : /home/rosetta/archive/rosetta3/spanish/mrules108.mrule  \
                               /home/rosetta/archive/rosetta3/spanish/neededinmrules.pf;
	touch $(language)/target/mrules108.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules108
 
 
  
/home/rosetta/archive/rosetta3/spanish/commrules109.o  \
/home/rosetta/archive/rosetta3/spanish/decommrules109.o  \
/home/rosetta/archive/rosetta3/spanish/commrules109.pf  \
/home/rosetta/archive/rosetta3/spanish/decommrules109.pf : /home/rosetta/archive/rosetta3/spanish/mrules109.out ;
 
/home/rosetta/archive/rosetta3/spanish/mrules109.out : /home/rosetta/archive/rosetta3/spanish/mrules109.mrule  \
                               /home/rosetta/archive/rosetta3/spanish/neededinmrules.pf;
	touch $(language)/target/mrules109.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules109
 
 
  
/home/rosetta/archive/rosetta3/spanish/commrules110.o  \
/home/rosetta/archive/rosetta3/spanish/decommrules110.o  \
/home/rosetta/archive/rosetta3/spanish/commrules110.pf  \
/home/rosetta/archive/rosetta3/spanish/decommrules110.pf : /home/rosetta/archive/rosetta3/spanish/mrules110.out ;
 
/home/rosetta/archive/rosetta3/spanish/mrules110.out : /home/rosetta/archive/rosetta3/spanish/mrules110.mrule  \
                               /home/rosetta/archive/rosetta3/spanish/neededinmrules.pf;
	touch $(language)/target/mrules110.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules110
 
 
  
/home/rosetta/archive/rosetta3/spanish/commrules111.o  \
/home/rosetta/archive/rosetta3/spanish/decommrules111.o  \
/home/rosetta/archive/rosetta3/spanish/commrules111.pf  \
/home/rosetta/archive/rosetta3/spanish/decommrules111.pf : /home/rosetta/archive/rosetta3/spanish/mrules111.out ;
 
/home/rosetta/archive/rosetta3/spanish/mrules111.out : /home/rosetta/archive/rosetta3/spanish/mrules111.mrule  \
                               /home/rosetta/archive/rosetta3/spanish/neededinmrules.pf;
	touch $(language)/target/mrules111.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules111
 
 
  
/home/rosetta/archive/rosetta3/spanish/commrules112.o  \
/home/rosetta/archive/rosetta3/spanish/decommrules112.o  \
/home/rosetta/archive/rosetta3/spanish/commrules112.pf  \
/home/rosetta/archive/rosetta3/spanish/decommrules112.pf : /home/rosetta/archive/rosetta3/spanish/mrules112.out ;
 
/home/rosetta/archive/rosetta3/spanish/mrules112.out : /home/rosetta/archive/rosetta3/spanish/mrules112.mrule  \
                               /home/rosetta/archive/rosetta3/spanish/neededinmrules.pf;
	touch $(language)/target/mrules112.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules112
 
 
  
/home/rosetta/archive/rosetta3/spanish/commrules113.o  \
/home/rosetta/archive/rosetta3/spanish/decommrules113.o  \
/home/rosetta/archive/rosetta3/spanish/commrules113.pf  \
/home/rosetta/archive/rosetta3/spanish/decommrules113.pf : /home/rosetta/archive/rosetta3/spanish/mrules113.out ;
 
/home/rosetta/archive/rosetta3/spanish/mrules113.out : /home/rosetta/archive/rosetta3/spanish/mrules113.mrule  \
                               /home/rosetta/archive/rosetta3/spanish/neededinmrules.pf;
	touch $(language)/target/mrules113.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules113
 
 
  
/home/rosetta/archive/rosetta3/spanish/commrules114.o  \
/home/rosetta/archive/rosetta3/spanish/decommrules114.o  \
/home/rosetta/archive/rosetta3/spanish/commrules114.pf  \
/home/rosetta/archive/rosetta3/spanish/decommrules114.pf : /home/rosetta/archive/rosetta3/spanish/mrules114.out ;
 
/home/rosetta/archive/rosetta3/spanish/mrules114.out : /home/rosetta/archive/rosetta3/spanish/mrules114.mrule  \
                               /home/rosetta/archive/rosetta3/spanish/neededinmrules.pf;
	touch $(language)/target/mrules114.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules114
 
 
  
  
/home/rosetta/archive/rosetta3/spanish/commrules115.o  \
/home/rosetta/archive/rosetta3/spanish/decommrules115.o  \
/home/rosetta/archive/rosetta3/spanish/commrules115.pf  \
/home/rosetta/archive/rosetta3/spanish/decommrules115.pf : /home/rosetta/archive/rosetta3/spanish/mrules115.out ;
 
/home/rosetta/archive/rosetta3/spanish/mrules115.out : /home/rosetta/archive/rosetta3/spanish/mrules115.mrule  \
                               /home/rosetta/archive/rosetta3/spanish/neededinmrules.pf;
	touch $(language)/target/mrules115.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules115
 
 
  
/home/rosetta/archive/rosetta3/spanish/commrules116.o  \
/home/rosetta/archive/rosetta3/spanish/decommrules116.o  \
/home/rosetta/archive/rosetta3/spanish/commrules116.pf  \
/home/rosetta/archive/rosetta3/spanish/decommrules116.pf : /home/rosetta/archive/rosetta3/spanish/mrules116.out ;
 
/home/rosetta/archive/rosetta3/spanish/mrules116.out : /home/rosetta/archive/rosetta3/spanish/mrules116.mrule  \
                               /home/rosetta/archive/rosetta3/spanish/neededinmrules.pf;
	touch $(language)/target/mrules116.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules116
 
 
  
#!!  
#!! idiom file 117, treated somewhat differently, see above   
#!!  
  
/home/rosetta/archive/rosetta3/spanish/commrules117.pf : /home/rosetta/archive/rosetta3/spanish/mrules117.mrule  \
                               /home/rosetta/archive/rosetta3/spanish/neededinmrules.pf;
	@/home/rosetta/archive/rosetta3/actions/mru $(language) mrules117
 
 
  
/home/rosetta/archive/rosetta3/spanish/commrules117.o  \
/home/rosetta/archive/rosetta3/spanish/decommrules117.o  \
/home/rosetta/archive/rosetta3/spanish/decommrules117.pf : /home/rosetta/archive/rosetta3/spanish/mrules117.out ;
 
/home/rosetta/archive/rosetta3/spanish/mrules117.out : /home/rosetta/archive/rosetta3/spanish/mrules117.mrule  \
                               /home/rosetta/archive/rosetta3/spanish/neededinmrules.pf;
	touch $(language)/target/mrules117.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules117
 
 
  
/home/rosetta/archive/rosetta3/spanish/commrules118.o  \
/home/rosetta/archive/rosetta3/spanish/decommrules118.o  \
/home/rosetta/archive/rosetta3/spanish/commrules118.pf  \
/home/rosetta/archive/rosetta3/spanish/decommrules118.pf : /home/rosetta/archive/rosetta3/spanish/mrules118.out ;
 
/home/rosetta/archive/rosetta3/spanish/mrules118.out : /home/rosetta/archive/rosetta3/spanish/mrules118.mrule  \
                               /home/rosetta/archive/rosetta3/spanish/neededinmrules.pf;
	touch $(language)/target/mrules118.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules118
 
 
  
/home/rosetta/archive/rosetta3/spanish/commrules119.o  \
/home/rosetta/archive/rosetta3/spanish/decommrules119.o  \
/home/rosetta/archive/rosetta3/spanish/commrules119.pf  \
/home/rosetta/archive/rosetta3/spanish/decommrules119.pf : /home/rosetta/archive/rosetta3/spanish/mrules119.out ;
 
/home/rosetta/archive/rosetta3/spanish/mrules119.out : /home/rosetta/archive/rosetta3/spanish/mrules119.mrule  \
                               /home/rosetta/archive/rosetta3/spanish/neededinmrules.pf;
	touch $(language)/target/mrules119.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules119
 
 
  
/home/rosetta/archive/rosetta3/spanish/commrules120.o  \
/home/rosetta/archive/rosetta3/spanish/decommrules120.o  \
/home/rosetta/archive/rosetta3/spanish/commrules120.pf  \
/home/rosetta/archive/rosetta3/spanish/decommrules120.pf : /home/rosetta/archive/rosetta3/spanish/mrules120.out ;
 
/home/rosetta/archive/rosetta3/spanish/mrules120.out : /home/rosetta/archive/rosetta3/spanish/mrules120.mrule  \
                               /home/rosetta/archive/rosetta3/spanish/neededinmrules.pf;
	touch $(language)/target/mrules120.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules120
 
 
  
/home/rosetta/archive/rosetta3/spanish/commrules121.o  \
/home/rosetta/archive/rosetta3/spanish/decommrules121.o  \
/home/rosetta/archive/rosetta3/spanish/commrules121.pf  \
/home/rosetta/archive/rosetta3/spanish/decommrules121.pf : /home/rosetta/archive/rosetta3/spanish/mrules121.out ;
 
/home/rosetta/archive/rosetta3/spanish/mrules121.out : /home/rosetta/archive/rosetta3/spanish/mrules121.mrule  \
                               /home/rosetta/archive/rosetta3/spanish/neededinmrules.pf;
	touch $(language)/target/mrules121.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules121
 
 
  
/home/rosetta/archive/rosetta3/spanish/commrules122.o  \
/home/rosetta/archive/rosetta3/spanish/decommrules122.o  \
/home/rosetta/archive/rosetta3/spanish/commrules122.pf  \
/home/rosetta/archive/rosetta3/spanish/decommrules122.pf : /home/rosetta/archive/rosetta3/spanish/mrules122.out ;
 
/home/rosetta/archive/rosetta3/spanish/mrules122.out : /home/rosetta/archive/rosetta3/spanish/mrules122.mrule  \
                               /home/rosetta/archive/rosetta3/spanish/neededinmrules.pf;
	touch $(language)/target/mrules122.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules122
 
 
  
/home/rosetta/archive/rosetta3/spanish/commrules123.o  \
/home/rosetta/archive/rosetta3/spanish/decommrules123.o  \
/home/rosetta/archive/rosetta3/spanish/commrules123.pf  \
/home/rosetta/archive/rosetta3/spanish/decommrules123.pf : /home/rosetta/archive/rosetta3/spanish/mrules123.out ;
 
/home/rosetta/archive/rosetta3/spanish/mrules123.out : /home/rosetta/archive/rosetta3/spanish/mrules123.mrule  \
                               /home/rosetta/archive/rosetta3/spanish/neededinmrules.pf;
	touch $(language)/target/mrules123.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules123
 
 
  
/home/rosetta/archive/rosetta3/spanish/commrules124.o  \
/home/rosetta/archive/rosetta3/spanish/decommrules124.o  \
/home/rosetta/archive/rosetta3/spanish/commrules124.pf  \
/home/rosetta/archive/rosetta3/spanish/decommrules124.pf : /home/rosetta/archive/rosetta3/spanish/mrules124.out ;
 
/home/rosetta/archive/rosetta3/spanish/mrules124.out : /home/rosetta/archive/rosetta3/spanish/mrules124.mrule  \
                               /home/rosetta/archive/rosetta3/spanish/neededinmrules.pf;
	touch $(language)/target/mrules124.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules124
 
 
  
  
/home/rosetta/archive/rosetta3/spanish/commrules125.o  \
/home/rosetta/archive/rosetta3/spanish/decommrules125.o  \
/home/rosetta/archive/rosetta3/spanish/commrules125.pf  \
/home/rosetta/archive/rosetta3/spanish/decommrules125.pf : /home/rosetta/archive/rosetta3/spanish/mrules125.out ;
 
/home/rosetta/archive/rosetta3/spanish/mrules125.out : /home/rosetta/archive/rosetta3/spanish/mrules125.mrule  \
                               /home/rosetta/archive/rosetta3/spanish/neededinmrules.pf;
	touch $(language)/target/mrules125.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules125
 
 
  
/home/rosetta/archive/rosetta3/spanish/commrules126.o  \
/home/rosetta/archive/rosetta3/spanish/decommrules126.o  \
/home/rosetta/archive/rosetta3/spanish/commrules126.pf  \
/home/rosetta/archive/rosetta3/spanish/decommrules126.pf : /home/rosetta/archive/rosetta3/spanish/mrules126.out ;
 
/home/rosetta/archive/rosetta3/spanish/mrules126.out : /home/rosetta/archive/rosetta3/spanish/mrules126.mrule  \
                               /home/rosetta/archive/rosetta3/spanish/neededinmrules.pf;
	touch $(language)/target/mrules126.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules126
 
 
  
/home/rosetta/archive/rosetta3/spanish/commrules127.o  \
/home/rosetta/archive/rosetta3/spanish/decommrules127.o  \
/home/rosetta/archive/rosetta3/spanish/commrules127.pf  \
/home/rosetta/archive/rosetta3/spanish/decommrules127.pf : /home/rosetta/archive/rosetta3/spanish/mrules127.out ;
 
/home/rosetta/archive/rosetta3/spanish/mrules127.out : /home/rosetta/archive/rosetta3/spanish/mrules127.mrule  \
                               /home/rosetta/archive/rosetta3/spanish/neededinmrules.pf;
	touch $(language)/target/mrules127.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules127
 
 
  
/home/rosetta/archive/rosetta3/spanish/commrules128.o  \
/home/rosetta/archive/rosetta3/spanish/decommrules128.o  \
/home/rosetta/archive/rosetta3/spanish/commrules128.pf  \
/home/rosetta/archive/rosetta3/spanish/decommrules128.pf : /home/rosetta/archive/rosetta3/spanish/mrules128.out ;
 
/home/rosetta/archive/rosetta3/spanish/mrules128.out : /home/rosetta/archive/rosetta3/spanish/mrules128.mrule  \
                               /home/rosetta/archive/rosetta3/spanish/neededinmrules.pf;
	touch $(language)/target/mrules128.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules128
 
 
  
/home/rosetta/archive/rosetta3/spanish/commrules129.o  \
/home/rosetta/archive/rosetta3/spanish/decommrules129.o  \
/home/rosetta/archive/rosetta3/spanish/commrules129.pf  \
/home/rosetta/archive/rosetta3/spanish/decommrules129.pf : /home/rosetta/archive/rosetta3/spanish/mrules129.out ;
 
/home/rosetta/archive/rosetta3/spanish/mrules129.out : /home/rosetta/archive/rosetta3/spanish/mrules129.mrule  \
                               /home/rosetta/archive/rosetta3/spanish/neededinmrules.pf;
	touch $(language)/target/mrules129.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules129
 
 
  
/home/rosetta/archive/rosetta3/spanish/commrules130.o  \
/home/rosetta/archive/rosetta3/spanish/decommrules130.o  \
/home/rosetta/archive/rosetta3/spanish/commrules130.pf  \
/home/rosetta/archive/rosetta3/spanish/decommrules130.pf : /home/rosetta/archive/rosetta3/spanish/mrules130.out ;
 
/home/rosetta/archive/rosetta3/spanish/mrules130.out : /home/rosetta/archive/rosetta3/spanish/mrules130.mrule  \
                               /home/rosetta/archive/rosetta3/spanish/neededinmrules.pf;
	touch $(language)/target/mrules130.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules130
 
 
  
/home/rosetta/archive/rosetta3/spanish/commrules131.o  \
/home/rosetta/archive/rosetta3/spanish/decommrules131.o  \
/home/rosetta/archive/rosetta3/spanish/commrules131.pf  \
/home/rosetta/archive/rosetta3/spanish/decommrules131.pf : /home/rosetta/archive/rosetta3/spanish/mrules131.out ;
 
/home/rosetta/archive/rosetta3/spanish/mrules131.out : /home/rosetta/archive/rosetta3/spanish/mrules131.mrule  \
                               /home/rosetta/archive/rosetta3/spanish/neededinmrules.pf;
	touch $(language)/target/mrules131.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules131
 
 
  
/home/rosetta/archive/rosetta3/spanish/commrules132.o  \
/home/rosetta/archive/rosetta3/spanish/decommrules132.o  \
/home/rosetta/archive/rosetta3/spanish/commrules132.pf  \
/home/rosetta/archive/rosetta3/spanish/decommrules132.pf : /home/rosetta/archive/rosetta3/spanish/mrules132.out ;
 
/home/rosetta/archive/rosetta3/spanish/mrules132.out : /home/rosetta/archive/rosetta3/spanish/mrules132.mrule  \
                               /home/rosetta/archive/rosetta3/spanish/neededinmrules.pf;
	touch $(language)/target/mrules132.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules132
 
 
  
/home/rosetta/archive/rosetta3/spanish/commrules133.o  \
/home/rosetta/archive/rosetta3/spanish/decommrules133.o  \
/home/rosetta/archive/rosetta3/spanish/commrules133.pf  \
/home/rosetta/archive/rosetta3/spanish/decommrules133.pf : /home/rosetta/archive/rosetta3/spanish/mrules133.out ;
 
/home/rosetta/archive/rosetta3/spanish/mrules133.out : /home/rosetta/archive/rosetta3/spanish/mrules133.mrule  \
                               /home/rosetta/archive/rosetta3/spanish/neededinmrules.pf;
	touch $(language)/target/mrules133.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules133
 
 
  
/home/rosetta/archive/rosetta3/spanish/commrules134.o  \
/home/rosetta/archive/rosetta3/spanish/decommrules134.o  \
/home/rosetta/archive/rosetta3/spanish/commrules134.pf  \
/home/rosetta/archive/rosetta3/spanish/decommrules134.pf : /home/rosetta/archive/rosetta3/spanish/mrules134.out ;
 
/home/rosetta/archive/rosetta3/spanish/mrules134.out : /home/rosetta/archive/rosetta3/spanish/mrules134.mrule  \
                               /home/rosetta/archive/rosetta3/spanish/neededinmrules.pf;
	touch $(language)/target/mrules134.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules134
 
 
  
  
/home/rosetta/archive/rosetta3/spanish/commrules135.o  \
/home/rosetta/archive/rosetta3/spanish/decommrules135.o  \
/home/rosetta/archive/rosetta3/spanish/commrules135.pf  \
/home/rosetta/archive/rosetta3/spanish/decommrules135.pf : /home/rosetta/archive/rosetta3/spanish/mrules135.out ;
 
/home/rosetta/archive/rosetta3/spanish/mrules135.out : /home/rosetta/archive/rosetta3/spanish/mrules135.mrule  \
                               /home/rosetta/archive/rosetta3/spanish/neededinmrules.pf;
	touch $(language)/target/mrules135.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules135
 
 
  
/home/rosetta/archive/rosetta3/spanish/commrules136.o  \
/home/rosetta/archive/rosetta3/spanish/decommrules136.o  \
/home/rosetta/archive/rosetta3/spanish/commrules136.pf  \
/home/rosetta/archive/rosetta3/spanish/decommrules136.pf : /home/rosetta/archive/rosetta3/spanish/mrules136.out ;
 
/home/rosetta/archive/rosetta3/spanish/mrules136.out : /home/rosetta/archive/rosetta3/spanish/mrules136.mrule  \
                               /home/rosetta/archive/rosetta3/spanish/neededinmrules.pf;
	touch $(language)/target/mrules136.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules136
 
 
  
/home/rosetta/archive/rosetta3/spanish/commrules137.o  \
/home/rosetta/archive/rosetta3/spanish/decommrules137.o  \
/home/rosetta/archive/rosetta3/spanish/commrules137.pf  \
/home/rosetta/archive/rosetta3/spanish/decommrules137.pf : /home/rosetta/archive/rosetta3/spanish/mrules137.out ;
 
/home/rosetta/archive/rosetta3/spanish/mrules137.out : /home/rosetta/archive/rosetta3/spanish/mrules137.mrule  \
                               /home/rosetta/archive/rosetta3/spanish/neededinmrules.pf;
	touch $(language)/target/mrules137.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules137
 
 
  
/home/rosetta/archive/rosetta3/spanish/commrules138.o  \
/home/rosetta/archive/rosetta3/spanish/decommrules138.o  \
/home/rosetta/archive/rosetta3/spanish/commrules138.pf  \
/home/rosetta/archive/rosetta3/spanish/decommrules138.pf : /home/rosetta/archive/rosetta3/spanish/mrules138.out ;
 
/home/rosetta/archive/rosetta3/spanish/mrules138.out : /home/rosetta/archive/rosetta3/spanish/mrules138.mrule  \
                               /home/rosetta/archive/rosetta3/spanish/neededinmrules.pf;
	touch $(language)/target/mrules138.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules138
 
 
  
/home/rosetta/archive/rosetta3/spanish/commrules139.o  \
/home/rosetta/archive/rosetta3/spanish/decommrules139.o  \
/home/rosetta/archive/rosetta3/spanish/commrules139.pf  \
/home/rosetta/archive/rosetta3/spanish/decommrules139.pf : /home/rosetta/archive/rosetta3/spanish/mrules139.out ;
 
/home/rosetta/archive/rosetta3/spanish/mrules139.out : /home/rosetta/archive/rosetta3/spanish/mrules139.mrule  \
                               /home/rosetta/archive/rosetta3/spanish/neededinmrules.pf;
	touch $(language)/target/mrules139.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules139
 
 
  
/home/rosetta/archive/rosetta3/spanish/commrules140.o  \
/home/rosetta/archive/rosetta3/spanish/decommrules140.o  \
/home/rosetta/archive/rosetta3/spanish/commrules140.pf  \
/home/rosetta/archive/rosetta3/spanish/decommrules140.pf : /home/rosetta/archive/rosetta3/spanish/mrules140.out ;
 
/home/rosetta/archive/rosetta3/spanish/mrules140.out : /home/rosetta/archive/rosetta3/spanish/mrules140.mrule  \
                               /home/rosetta/archive/rosetta3/spanish/neededinmrules.pf;
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
  
/home/rosetta/archive/rosetta3/spanish/neededinmrules.pf : /home/rosetta/archive/rosetta3/spanish/maket.pf  \
                            /home/rosetta/archive/rosetta3/spanish/copyt.pf  \
                            /home/rosetta/archive/rosetta3/spanish/lsauxdom.pf  \
                            /home/rosetta/archive/rosetta3/spanish/lsmruquo.pf  \
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
  
/home/rosetta/archive/rosetta3/spanish/gsuffix.svo \
/home/rosetta/archive/rosetta3/spanish/gsuffix.svs \
/home/rosetta/archive/rosetta3/spanish/gsuffix.sco \
/home/rosetta/archive/rosetta3/spanish/gsuffix.sso \
/home/rosetta/archive/rosetta3/spanish/gsuffix.sro \
/home/rosetta/archive/rosetta3/spanish/asuffix.svs \
/home/rosetta/archive/rosetta3/spanish/asuffix.svo \
/home/rosetta/archive/rosetta3/spanish/asuffix.sco \
/home/rosetta/archive/rosetta3/spanish/asuffix.sso \
/home/rosetta/archive/rosetta3/spanish/asuffix.sro : /home/rosetta/archive/rosetta3/spanish/suffix.seg \
                          /home/rosetta/archive/rosetta3/spanish/asegcom.exe \
                          /home/rosetta/archive/rosetta3/spanish/gsegcom.exe;
	@/home/rosetta/archive/rosetta3/actions/seg $(language) suffix
  
/home/rosetta/archive/rosetta3/spanish/gprefix.svo \
/home/rosetta/archive/rosetta3/spanish/gprefix.svs \
/home/rosetta/archive/rosetta3/spanish/gprefix.sco \
/home/rosetta/archive/rosetta3/spanish/gprefix.sso \
/home/rosetta/archive/rosetta3/spanish/gprefix.sro \
/home/rosetta/archive/rosetta3/spanish/aprefix.svs \
/home/rosetta/archive/rosetta3/spanish/aprefix.svo \
/home/rosetta/archive/rosetta3/spanish/aprefix.sco \
/home/rosetta/archive/rosetta3/spanish/aprefix.sso \
/home/rosetta/archive/rosetta3/spanish/aprefix.sro : /home/rosetta/archive/rosetta3/spanish/prefix.seg \
                          /home/rosetta/archive/rosetta3/spanish/asegcom.exe \
                          /home/rosetta/archive/rosetta3/spanish/gsegcom.exe;
	@/home/rosetta/archive/rosetta3/actions/seg $(language) prefix
  
/home/rosetta/archive/rosetta3/spanish/glglue.svo \
/home/rosetta/archive/rosetta3/spanish/glglue.svs \
/home/rosetta/archive/rosetta3/spanish/glglue.sco \
/home/rosetta/archive/rosetta3/spanish/glglue.sso \
/home/rosetta/archive/rosetta3/spanish/glglue.sro \
/home/rosetta/archive/rosetta3/spanish/alglue.svo \
/home/rosetta/archive/rosetta3/spanish/alglue.svs \
/home/rosetta/archive/rosetta3/spanish/alglue.sco \
/home/rosetta/archive/rosetta3/spanish/alglue.sso \
/home/rosetta/archive/rosetta3/spanish/alglue.sro : /home/rosetta/archive/rosetta3/spanish/lglue.seg \
                          /home/rosetta/archive/rosetta3/spanish/asegcom.exe \
                          /home/rosetta/archive/rosetta3/spanish/gsegcom.exe;
	@/home/rosetta/archive/rosetta3/actions/seg $(language) lglue
  
/home/rosetta/archive/rosetta3/spanish/grglue.svo \
/home/rosetta/archive/rosetta3/spanish/grglue.svs \
/home/rosetta/archive/rosetta3/spanish/grglue.sco \
/home/rosetta/archive/rosetta3/spanish/grglue.sso \
/home/rosetta/archive/rosetta3/spanish/grglue.sro \
/home/rosetta/archive/rosetta3/spanish/arglue.svo \
/home/rosetta/archive/rosetta3/spanish/arglue.svs \
/home/rosetta/archive/rosetta3/spanish/arglue.sco \
/home/rosetta/archive/rosetta3/spanish/arglue.sso \
/home/rosetta/archive/rosetta3/spanish/arglue.sro : /home/rosetta/archive/rosetta3/spanish/rglue.seg \
                          /home/rosetta/archive/rosetta3/spanish/asegcom.exe \
                          /home/rosetta/archive/rosetta3/spanish/gsegcom.exe;
	@/home/rosetta/archive/rosetta3/actions/seg $(language) rglue
  
/home/rosetta/archive/rosetta3/spanish/gmglue.svo \
/home/rosetta/archive/rosetta3/spanish/gmglue.svs \
/home/rosetta/archive/rosetta3/spanish/gmglue.sco \
/home/rosetta/archive/rosetta3/spanish/gmglue.sso \
/home/rosetta/archive/rosetta3/spanish/gmglue.sro \
/home/rosetta/archive/rosetta3/spanish/amglue.svo \
/home/rosetta/archive/rosetta3/spanish/amglue.svs \
/home/rosetta/archive/rosetta3/spanish/amglue.sco \
/home/rosetta/archive/rosetta3/spanish/amglue.sso \
/home/rosetta/archive/rosetta3/spanish/amglue.sro : /home/rosetta/archive/rosetta3/spanish/mglue.seg \
                          /home/rosetta/archive/rosetta3/spanish/asegcom.exe \
                          /home/rosetta/archive/rosetta3/spanish/gsegcom.exe;
	@/home/rosetta/archive/rosetta3/actions/seg $(language) mglue
  
spanish/target/ldprims.p : spanish/target/surout ;
 
spanish/target/surfrules.p : spanish/target/surout ;
 
spanish/target/surfrulesblocks.pf : spanish/target/surout ;
 
spanish/target/surfrulesblocks.p : spanish/target/surout ;
 
spanish/target/lsrulepars.pf : spanish/target/surout ;
 
spanish/target/ldsurfswitch.p : spanish/target/surout ;
 
spanish/target/surfrulesgraphs.p : spanish/target/surout ;
 
 
spanish/target/surout : spanish/target/surfrules1.sur  \
                                  spanish/target/surfrules2.sur  \
                                  spanish/target/surfrules3.sur  \
                                  spanish/target/surfrules4.sur  \
                                  /home/rosetta/archive/rosetta3/general/surfrulesblocks.pf  \
                                  spanish/target/surcom.exe  \
                                  spanish/target/surfcom.exe  \
                                  spanish/target/surflink.exe ;
	touch $(language)/target/surout
	@/home/rosetta/archive/rosetta3/actions/sur $(language) surfrules
	@/home/rosetta/archive/rosetta3/actions/surf $(language) surfrules1
	@/home/rosetta/archive/rosetta3/actions/surf $(language) surfrules2
	@/home/rosetta/archive/rosetta3/actions/surf $(language) surfrules3
	@/home/rosetta/archive/rosetta3/actions/surf $(language) surfrules4
	@/home/rosetta/archive/rosetta3/actions/slk $(language)
  
/home/rosetta/archive/rosetta3/spanish/ldanilrules.p : /home/rosetta/archive/rosetta3/spanish/traout ;
 
/home/rosetta/archive/rosetta3/spanish/ldgenilrules.p : /home/rosetta/archive/rosetta3/spanish/traout ;
 
/home/rosetta/archive/rosetta3/spanish/traout : /home/rosetta/archive/rosetta3/spanish/transferrules.trans  \
                               /home/rosetta/archive/rosetta3/spanish/tracom.exe;
	touch $(language)/target/traout
	@/home/rosetta/archive/rosetta3/actions/tra $(language) transferrules
  
/home/rosetta/archive/rosetta3/tools/neededforcompiler.pf : /home/rosetta/archive/rosetta3/tools/tstring.o \
                              /home/rosetta/archive/rosetta3/tools/tfiles.o \
                              /home/rosetta/archive/rosetta3/general/strtokey.o \
                              /home/rosetta/archive/rosetta3/general/mem.o \
                              /home/rosetta/archive/rosetta3/tools/mrudomcom.exe \
                              /home/rosetta/archive/rosetta3/tools/gencomp.exe ;
	@echo "empty" > tools/target/neededforcompiler.pf
 
/home/rosetta/archive/rosetta3/spanish/neededforcompiler.pf : /home/rosetta/archive/rosetta3/tools/neededforcompiler.pf \
                              /home/rosetta/archive/rosetta3/general/ldmrules.pf \
                              /home/rosetta/archive/rosetta3/general/lidomaint.pf \
                              /home/rosetta/archive/rosetta3/tools/tldstrtostr.o \
                              /home/rosetta/archive/rosetta3/tools/tldconvrec.o \
                              /home/rosetta/archive/rosetta3/spanish/ldcatsets.o \
                              /home/rosetta/archive/rosetta3/spanish/ldstrtotype.o \
                              /home/rosetta/archive/rosetta3/spanish/ldtypetostr.o ;
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
  
 
spanish/target/lsconstraints.p : /home/rosetta/archive/rosetta3/spanish/constraints.constr \
                                tools/target/constraintgen.exe;
	@/home/rosetta/archive/rosetta3/actions/constraint $(language) constraints
  
