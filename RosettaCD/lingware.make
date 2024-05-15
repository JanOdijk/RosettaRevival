 
  
/home/rosetta/archive/rosetta3/dutch/ldsucc.p : /home/rosetta/archive/rosetta3/dutch/morphexpr.afxpr \
                         /home/rosetta/archive/rosetta3/tools/afxpr.exe;
	@/home/rosetta/archive/rosetta3/actions/afxpr $(language) morphexpr
  
/home/rosetta/archive/rosetta3/dutch/lsauxdom.pf : /home/rosetta/archive/rosetta3/dutch/auxdomout ;
 
/home/rosetta/archive/rosetta3/dutch/lsauxdom.p : /home/rosetta/archive/rosetta3/dutch/auxdomout ;
 
/home/rosetta/archive/rosetta3/dutch/ldsubsttovar.p : /home/rosetta/archive/rosetta3/dutch/auxdomout ;
 
/home/rosetta/archive/rosetta3/dutch/auxdomout : /home/rosetta/archive/rosetta3/dutch/lsauxdomain.auxdom  \
                               /home/rosetta/archive/rosetta3/dutch/auxcom.exe;
	touch $(language)/target/auxdomout
	@/home/rosetta/archive/rosetta3/actions/auxdom $(language) lsauxdomain
  
/home/rosetta/archive/rosetta3/dutch/lstypetostr.p : /home/rosetta/archive/rosetta3/dutch/domout ;
 
/home/rosetta/archive/rosetta3/dutch/lstypetostr.pf : /home/rosetta/archive/rosetta3/dutch/domout ;
 
/home/rosetta/archive/rosetta3/dutch/lsstrtotype.p : /home/rosetta/archive/rosetta3/dutch/domout ;
 
/home/rosetta/archive/rosetta3/dutch/lsstrtotype.pf : /home/rosetta/archive/rosetta3/dutch/domout ;
 
/home/rosetta/archive/rosetta3/dutch/lsconvrec.p : /home/rosetta/archive/rosetta3/dutch/domout ;
 
/home/rosetta/archive/rosetta3/dutch/lsconvrec.pf : /home/rosetta/archive/rosetta3/dutch/domout ;
 
/home/rosetta/archive/rosetta3/dutch/lsconvattr.p : /home/rosetta/archive/rosetta3/dutch/domout ;
 
/home/rosetta/archive/rosetta3/dutch/lsconvattr.pf : /home/rosetta/archive/rosetta3/dutch/domout ;
 
/home/rosetta/archive/rosetta3/dutch/ldconvrec.p : /home/rosetta/archive/rosetta3/dutch/domout ;
 
/home/rosetta/archive/rosetta3/dutch/lsdomaint.pf : /home/rosetta/archive/rosetta3/dutch/domout ;
 
/home/rosetta/archive/rosetta3/dutch/maket.pf : /home/rosetta/archive/rosetta3/dutch/domout ;
 
/home/rosetta/archive/rosetta3/dutch/maket.p : /home/rosetta/archive/rosetta3/dutch/domout ;
 
/home/rosetta/archive/rosetta3/dutch/copyt.pf : /home/rosetta/archive/rosetta3/dutch/domout ;
 
/home/rosetta/archive/rosetta3/dutch/copyt.p : /home/rosetta/archive/rosetta3/dutch/domout ;
 
/home/rosetta/archive/rosetta3/dutch/ldstrtotype.p : /home/rosetta/archive/rosetta3/dutch/domout ;
 
/home/rosetta/archive/rosetta3/dutch/ldtypetostr.p : /home/rosetta/archive/rosetta3/dutch/domout ;
 
/home/rosetta/archive/rosetta3/dutch/ldstrtostr.p : /home/rosetta/archive/rosetta3/dutch/domout ;
 
/home/rosetta/archive/rosetta3/dutch/ldcatsets.p : /home/rosetta/archive/rosetta3/dutch/domout ;
 
/home/rosetta/archive/rosetta3/dutch/ldequal.p : /home/rosetta/archive/rosetta3/dutch/domout ;
 
/home/rosetta/archive/rosetta3/dutch/ldgetkey.p : /home/rosetta/archive/rosetta3/dutch/domout ;
 
/home/rosetta/archive/rosetta3/dutch/lsmorfdef.pf : /home/rosetta/archive/rosetta3/dutch/domout ;
 
/home/rosetta/archive/rosetta3/dutch/domout : /home/rosetta/archive/rosetta3/dutch/lsdomaint.dom \
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
  
  
/home/rosetta/archive/rosetta3/dutch/blex.dat : dutch/target/blex.dict \
                       /home/rosetta/archive/rosetta3/dutch/genblexisf.exe;
	@/home/rosetta/archive/rosetta3/actions/genblexdata $(language)
  
/home/rosetta/archive/rosetta3/dutch/iddict.dat : dutch/target/iddict.dict \
                         /home/rosetta/archive/rosetta3/dutch/geniddictdata.exe;
	@/home/rosetta/archive/rosetta3/actions/geniddictdata $(language)
  
/home/rosetta/archive/rosetta3/dutch/ildict.dat : dutch/target/ildict.dict \
                         /home/rosetta/archive/rosetta3/tools/genildictdata.exe;
	@/home/rosetta/archive/rosetta3/actions/genildictdata $(language)
  
/home/rosetta/archive/rosetta3/dutch/mdict.dat : dutch/target/mdict.dict \
                         /home/rosetta/archive/rosetta3/dutch/genmdictdata.exe;
	@/home/rosetta/archive/rosetta3/actions/genmdictdata $(language)
  
/home/rosetta/archive/rosetta3/dutch/sdict.dat : dutch/target/sdict.dict \
                         /home/rosetta/archive/rosetta3/tools/gensdictdata.exe;
	@/home/rosetta/archive/rosetta3/actions/gensdictdata $(language)
  
/home/rosetta/archive/rosetta3/dutch/siddict.dat : dutch/target/siddict.dict \
                         /home/rosetta/archive/rosetta3/tools/gensiddictdata.exe;
	@/home/rosetta/archive/rosetta3/actions/gensiddictdata $(language)
  
/home/rosetta/archive/rosetta3/dutch/fixid.dat : /home/rosetta/archive/rosetta3/dutch/fixid.fixid \
                        /home/rosetta/archive/rosetta3/tools/fixidgen.exe;
	@/home/rosetta/archive/rosetta3/actions/genfixiddata $(language)
  
  
  
#!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!keydefinitions  
  
/home/rosetta/archive/rosetta3/interlingua/bmkeydef.dat : /home/rosetta/archive/rosetta3/interlingua/bmkeydef.kdf \
                           /home/rosetta/archive/rosetta3/tools/strmkey.exe;
	@/home/rosetta/archive/rosetta3/actions/mkdf interlingua bmkeydef
  
  
/home/rosetta/archive/rosetta3/dutch/bskeydef.dat : dutch/target/bskeydef.kdf \
                           /home/rosetta/archive/rosetta3/tools/strkey.exe;
	@/home/rosetta/archive/rosetta3/actions/kdf $(language) bskeydef
  
  
#!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! 
  
/home/rosetta/archive/rosetta3/dutch/comlexrules1.p : /home/rosetta/archive/rosetta3/dutch/lex1out ;
 
/home/rosetta/archive/rosetta3/dutch/comlexrules1.pf : /home/rosetta/archive/rosetta3/dutch/lex1out ;
 
/home/rosetta/archive/rosetta3/dutch/decomlexrules1.p : /home/rosetta/archive/rosetta3/dutch/lex1out ;
 
/home/rosetta/archive/rosetta3/dutch/decomlexrules1.pf : /home/rosetta/archive/rosetta3/dutch/lex1out ;
  
/home/rosetta/archive/rosetta3/dutch/lex1out : /home/rosetta/archive/rosetta3/dutch/lexrules1.lex  \
                                 /home/rosetta/archive/rosetta3/dutch/lexcom.exe;
	touch $(language)/target/lex1out
	@/home/rosetta/archive/rosetta3/actions/lex $(language) lexrules1
  
 
/home/rosetta/archive/rosetta3/dutch/comlexrules2.p : /home/rosetta/archive/rosetta3/dutch/lex2out ;
 
/home/rosetta/archive/rosetta3/dutch/comlexrules2.pf : /home/rosetta/archive/rosetta3/dutch/lex2out ;
 
/home/rosetta/archive/rosetta3/dutch/decomlexrules2.p : /home/rosetta/archive/rosetta3/dutch/lex2out ;
 
/home/rosetta/archive/rosetta3/dutch/decomlexrules2.pf : /home/rosetta/archive/rosetta3/dutch/lex2out ;
  
/home/rosetta/archive/rosetta3/dutch/lex2out : /home/rosetta/archive/rosetta3/dutch/lexrules2.lex  \
                                 /home/rosetta/archive/rosetta3/dutch/lexcom.exe;
	touch $(language)/target/lex2out
	@/home/rosetta/archive/rosetta3/actions/lex $(language) lexrules2
 
/home/rosetta/archive/rosetta3/dutch/comlexrules3.p : /home/rosetta/archive/rosetta3/dutch/lex3out ;
 
/home/rosetta/archive/rosetta3/dutch/comlexrules3.pf : /home/rosetta/archive/rosetta3/dutch/lex3out ;
 
/home/rosetta/archive/rosetta3/dutch/decomlexrules3.p : /home/rosetta/archive/rosetta3/dutch/lex3out ;
 
/home/rosetta/archive/rosetta3/dutch/decomlexrules3.pf : /home/rosetta/archive/rosetta3/dutch/lex3out ;
  
/home/rosetta/archive/rosetta3/dutch/lex3out : /home/rosetta/archive/rosetta3/dutch/lexrules3.lex  \
                                 /home/rosetta/archive/rosetta3/dutch/lexcom.exe;
	touch $(language)/target/lex3out
	@/home/rosetta/archive/rosetta3/actions/lex $(language) lexrules3
  
  
/home/rosetta/archive/rosetta3/dutch/anlexif.p : /home/rosetta/archive/rosetta3/dutch/llkout ;
 
/home/rosetta/archive/rosetta3/dutch/genlexif.p : /home/rosetta/archive/rosetta3/dutch/llkout ;
 
/home/rosetta/archive/rosetta3/dutch/llkout : /home/rosetta/archive/rosetta3/dutch/comlexrules1.pf  \
                            /home/rosetta/archive/rosetta3/dutch/comlexrules2.pf  \
                            /home/rosetta/archive/rosetta3/dutch/comlexrules3.pf  \
                            /home/rosetta/archive/rosetta3/dutch/lexlink.exe;
	touch $(language)/target/llkout
	@/home/rosetta/archive/rosetta3/actions/llk $(language)
  
/home/rosetta/archive/rosetta3/dutch/lsparams.pf : /home/rosetta/archive/rosetta3/dutch/mlkout ;
 
/home/rosetta/archive/rosetta3/dutch/ldmrules.p : /home/rosetta/archive/rosetta3/dutch/mlkout ;
 
/home/rosetta/archive/rosetta3/dutch/ldsubgrammars.p : /home/rosetta/archive/rosetta3/dutch/mlkout ;
 
/home/rosetta/archive/rosetta3/dutch/helpsubgrammars.pf : /home/rosetta/archive/rosetta3/dutch/mlkout ;
 
/home/rosetta/archive/rosetta3/dutch/helpsubgrammars.p : /home/rosetta/archive/rosetta3/dutch/mlkout ;
 
/home/rosetta/archive/rosetta3/dutch/ldanmrules.p : /home/rosetta/archive/rosetta3/dutch/mlkout ;
 
/home/rosetta/archive/rosetta3/dutch/ldgenmrules.p : /home/rosetta/archive/rosetta3/dutch/mlkout ;
 
 
/home/rosetta/archive/rosetta3/dutch/mlkout : /home/rosetta/archive/rosetta3/dutch/commrules1.pf \
           /home/rosetta/archive/rosetta3/dutch/commrules10.pf \
           /home/rosetta/archive/rosetta3/dutch/commrules100.pf \
           /home/rosetta/archive/rosetta3/dutch/commrules101.pf \
           /home/rosetta/archive/rosetta3/dutch/commrules102.pf \
           /home/rosetta/archive/rosetta3/dutch/commrules103.pf \
           /home/rosetta/archive/rosetta3/dutch/commrules104.pf \
           /home/rosetta/archive/rosetta3/dutch/commrules105.pf \
           /home/rosetta/archive/rosetta3/dutch/commrules106.pf \
           /home/rosetta/archive/rosetta3/dutch/commrules107.pf \
           /home/rosetta/archive/rosetta3/dutch/commrules108.pf \
           /home/rosetta/archive/rosetta3/dutch/commrules109.pf \
           /home/rosetta/archive/rosetta3/dutch/commrules11.pf \
           /home/rosetta/archive/rosetta3/dutch/commrules110.pf \
           /home/rosetta/archive/rosetta3/dutch/commrules111.pf \
           /home/rosetta/archive/rosetta3/dutch/commrules112.pf \
           /home/rosetta/archive/rosetta3/dutch/commrules113.pf \
           /home/rosetta/archive/rosetta3/dutch/commrules114.pf \
           /home/rosetta/archive/rosetta3/dutch/commrules115.pf \
           /home/rosetta/archive/rosetta3/dutch/commrules116.pf \
           /home/rosetta/archive/rosetta3/dutch/commrules117.pf \
           /home/rosetta/archive/rosetta3/dutch/commrules118.pf \
           /home/rosetta/archive/rosetta3/dutch/commrules119.pf \
           /home/rosetta/archive/rosetta3/dutch/commrules12.pf \
           /home/rosetta/archive/rosetta3/dutch/commrules120.pf \
           /home/rosetta/archive/rosetta3/dutch/commrules121.pf \
           /home/rosetta/archive/rosetta3/dutch/commrules122.pf \
           /home/rosetta/archive/rosetta3/dutch/commrules123.pf \
           /home/rosetta/archive/rosetta3/dutch/commrules124.pf \
           /home/rosetta/archive/rosetta3/dutch/commrules125.pf \
           /home/rosetta/archive/rosetta3/dutch/commrules126.pf \
           /home/rosetta/archive/rosetta3/dutch/commrules127.pf \
           /home/rosetta/archive/rosetta3/dutch/commrules128.pf \
           /home/rosetta/archive/rosetta3/dutch/commrules129.pf \
           /home/rosetta/archive/rosetta3/dutch/commrules13.pf \
           /home/rosetta/archive/rosetta3/dutch/commrules130.pf \
           /home/rosetta/archive/rosetta3/dutch/commrules131.pf \
           /home/rosetta/archive/rosetta3/dutch/commrules132.pf \
           /home/rosetta/archive/rosetta3/dutch/commrules133.pf \
           /home/rosetta/archive/rosetta3/dutch/commrules134.pf \
           /home/rosetta/archive/rosetta3/dutch/commrules135.pf \
           /home/rosetta/archive/rosetta3/dutch/commrules136.pf \
           /home/rosetta/archive/rosetta3/dutch/commrules137.pf \
           /home/rosetta/archive/rosetta3/dutch/commrules138.pf \
           /home/rosetta/archive/rosetta3/dutch/commrules139.pf \
           /home/rosetta/archive/rosetta3/dutch/commrules14.pf \
           /home/rosetta/archive/rosetta3/dutch/commrules140.pf \
           /home/rosetta/archive/rosetta3/dutch/commrules15.pf \
           /home/rosetta/archive/rosetta3/dutch/commrules16.pf \
           /home/rosetta/archive/rosetta3/dutch/commrules17.pf \
           /home/rosetta/archive/rosetta3/dutch/commrules18.pf \
           /home/rosetta/archive/rosetta3/dutch/commrules19.pf \
           /home/rosetta/archive/rosetta3/dutch/commrules2.pf \
           /home/rosetta/archive/rosetta3/dutch/commrules20.pf \
           /home/rosetta/archive/rosetta3/dutch/commrules21.pf \
           /home/rosetta/archive/rosetta3/dutch/commrules22.pf \
           /home/rosetta/archive/rosetta3/dutch/commrules23.pf \
           /home/rosetta/archive/rosetta3/dutch/commrules24.pf \
           /home/rosetta/archive/rosetta3/dutch/commrules25.pf \
           /home/rosetta/archive/rosetta3/dutch/commrules26.pf \
           /home/rosetta/archive/rosetta3/dutch/commrules27.pf \
           /home/rosetta/archive/rosetta3/dutch/commrules28.pf \
           /home/rosetta/archive/rosetta3/dutch/commrules29.pf \
           /home/rosetta/archive/rosetta3/dutch/commrules3.pf \
           /home/rosetta/archive/rosetta3/dutch/commrules30.pf \
           /home/rosetta/archive/rosetta3/dutch/commrules31.pf \
           /home/rosetta/archive/rosetta3/dutch/commrules32.pf \
           /home/rosetta/archive/rosetta3/dutch/commrules33.pf \
           /home/rosetta/archive/rosetta3/dutch/commrules34.pf \
           /home/rosetta/archive/rosetta3/dutch/commrules35.pf \
           /home/rosetta/archive/rosetta3/dutch/commrules36.pf \
           /home/rosetta/archive/rosetta3/dutch/commrules37.pf \
           /home/rosetta/archive/rosetta3/dutch/commrules38.pf \
           /home/rosetta/archive/rosetta3/dutch/commrules39.pf \
           /home/rosetta/archive/rosetta3/dutch/commrules4.pf \
           /home/rosetta/archive/rosetta3/dutch/commrules40.pf \
           /home/rosetta/archive/rosetta3/dutch/commrules41.pf \
           /home/rosetta/archive/rosetta3/dutch/commrules42.pf \
           /home/rosetta/archive/rosetta3/dutch/commrules43.pf \
           /home/rosetta/archive/rosetta3/dutch/commrules44.pf \
           /home/rosetta/archive/rosetta3/dutch/commrules45.pf \
           /home/rosetta/archive/rosetta3/dutch/commrules46.pf \
           /home/rosetta/archive/rosetta3/dutch/commrules47.pf \
           /home/rosetta/archive/rosetta3/dutch/commrules48.pf \
           /home/rosetta/archive/rosetta3/dutch/commrules49.pf \
           /home/rosetta/archive/rosetta3/dutch/commrules5.pf \
           /home/rosetta/archive/rosetta3/dutch/commrules50.pf \
           /home/rosetta/archive/rosetta3/dutch/commrules51.pf \
           /home/rosetta/archive/rosetta3/dutch/commrules52.pf \
           /home/rosetta/archive/rosetta3/dutch/commrules53.pf \
           /home/rosetta/archive/rosetta3/dutch/commrules54.pf \
           /home/rosetta/archive/rosetta3/dutch/commrules55.pf \
           /home/rosetta/archive/rosetta3/dutch/commrules56.pf \
           /home/rosetta/archive/rosetta3/dutch/commrules57.pf \
           /home/rosetta/archive/rosetta3/dutch/commrules58.pf \
           /home/rosetta/archive/rosetta3/dutch/commrules59.pf \
           /home/rosetta/archive/rosetta3/dutch/commrules6.pf \
           /home/rosetta/archive/rosetta3/dutch/commrules60.pf \
           /home/rosetta/archive/rosetta3/dutch/commrules61.pf \
           /home/rosetta/archive/rosetta3/dutch/commrules62.pf \
           /home/rosetta/archive/rosetta3/dutch/commrules63.pf \
           /home/rosetta/archive/rosetta3/dutch/commrules64.pf \
           /home/rosetta/archive/rosetta3/dutch/commrules65.pf \
           /home/rosetta/archive/rosetta3/dutch/commrules66.pf \
           /home/rosetta/archive/rosetta3/dutch/commrules67.pf \
           /home/rosetta/archive/rosetta3/dutch/commrules68.pf \
           /home/rosetta/archive/rosetta3/dutch/commrules69.pf \
           /home/rosetta/archive/rosetta3/dutch/commrules7.pf \
           /home/rosetta/archive/rosetta3/dutch/commrules70.pf \
           /home/rosetta/archive/rosetta3/dutch/commrules71.pf \
           /home/rosetta/archive/rosetta3/dutch/commrules72.pf \
           /home/rosetta/archive/rosetta3/dutch/commrules73.pf \
           /home/rosetta/archive/rosetta3/dutch/commrules74.pf \
           /home/rosetta/archive/rosetta3/dutch/commrules75.pf \
           /home/rosetta/archive/rosetta3/dutch/commrules76.pf \
           /home/rosetta/archive/rosetta3/dutch/commrules77.pf \
           /home/rosetta/archive/rosetta3/dutch/commrules78.pf \
           /home/rosetta/archive/rosetta3/dutch/commrules79.pf \
           /home/rosetta/archive/rosetta3/dutch/commrules8.pf \
           /home/rosetta/archive/rosetta3/dutch/commrules80.pf \
           /home/rosetta/archive/rosetta3/dutch/commrules81.pf \
           /home/rosetta/archive/rosetta3/dutch/commrules82.pf \
           /home/rosetta/archive/rosetta3/dutch/commrules83.pf \
           /home/rosetta/archive/rosetta3/dutch/commrules84.pf \
           /home/rosetta/archive/rosetta3/dutch/commrules85.pf \
           /home/rosetta/archive/rosetta3/dutch/commrules86.pf \
           /home/rosetta/archive/rosetta3/dutch/commrules87.pf \
           /home/rosetta/archive/rosetta3/dutch/commrules88.pf \
           /home/rosetta/archive/rosetta3/dutch/commrules89.pf \
           /home/rosetta/archive/rosetta3/dutch/commrules9.pf \
           /home/rosetta/archive/rosetta3/dutch/commrules90.pf \
           /home/rosetta/archive/rosetta3/dutch/commrules91.pf \
           /home/rosetta/archive/rosetta3/dutch/commrules92.pf \
           /home/rosetta/archive/rosetta3/dutch/commrules93.pf \
           /home/rosetta/archive/rosetta3/dutch/commrules94.pf \
           /home/rosetta/archive/rosetta3/dutch/commrules95.pf \
           /home/rosetta/archive/rosetta3/dutch/commrules96.pf \
           /home/rosetta/archive/rosetta3/dutch/commrules97.pf \
           /home/rosetta/archive/rosetta3/dutch/commrules98.pf \
           /home/rosetta/archive/rosetta3/dutch/commrules99.pf \
                            /home/rosetta/archive/rosetta3/dutch/mrulelink.exe;
	touch $(language)/target/mlkout
	@/home/rosetta/archive/rosetta3/actions/mlk $(language)
	@/home/rosetta/archive/rosetta3/actions/pas $(language) ldmrules
	@/home/rosetta/archive/rosetta3/actions/gen $(language) mrucom
	@/home/rosetta/archive/rosetta3/actions/idioms $(language) mrules107
	@/home/rosetta/archive/rosetta3/actions/idioms $(language) mrules117
  
/home/rosetta/archive/rosetta3/dutch/commrules1.o  \
/home/rosetta/archive/rosetta3/dutch/decommrules1.o  \
/home/rosetta/archive/rosetta3/dutch/commrules1.pf  \
/home/rosetta/archive/rosetta3/dutch/decommrules1.pf : /home/rosetta/archive/rosetta3/dutch/mrules1.out ;
 
/home/rosetta/archive/rosetta3/dutch/mrules1.out : /home/rosetta/archive/rosetta3/dutch/mrules1.mrule  \
                               /home/rosetta/archive/rosetta3/dutch/neededinmrules.pf;
	touch $(language)/target/mrules1.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules1
  
/home/rosetta/archive/rosetta3/dutch/commrules2.o  \
/home/rosetta/archive/rosetta3/dutch/decommrules2.o  \
/home/rosetta/archive/rosetta3/dutch/commrules2.pf  \
/home/rosetta/archive/rosetta3/dutch/decommrules2.pf : /home/rosetta/archive/rosetta3/dutch/mrules2.out ;
 
/home/rosetta/archive/rosetta3/dutch/mrules2.out : /home/rosetta/archive/rosetta3/dutch/mrules2.mrule  \
                               /home/rosetta/archive/rosetta3/dutch/neededinmrules.pf;
	touch $(language)/target/mrules2.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules2
  
/home/rosetta/archive/rosetta3/dutch/commrules3.o  \
/home/rosetta/archive/rosetta3/dutch/decommrules3.o  \
/home/rosetta/archive/rosetta3/dutch/commrules3.pf  \
/home/rosetta/archive/rosetta3/dutch/decommrules3.pf : /home/rosetta/archive/rosetta3/dutch/mrules3.out ;
 
/home/rosetta/archive/rosetta3/dutch/mrules3.out : /home/rosetta/archive/rosetta3/dutch/mrules3.mrule  \
                               /home/rosetta/archive/rosetta3/dutch/neededinmrules.pf;
	touch $(language)/target/mrules3.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules3
  
/home/rosetta/archive/rosetta3/dutch/commrules4.o  \
/home/rosetta/archive/rosetta3/dutch/decommrules4.o  \
/home/rosetta/archive/rosetta3/dutch/commrules4.pf  \
/home/rosetta/archive/rosetta3/dutch/decommrules4.pf : /home/rosetta/archive/rosetta3/dutch/mrules4.out ;
 
/home/rosetta/archive/rosetta3/dutch/mrules4.out : /home/rosetta/archive/rosetta3/dutch/mrules4.mrule  \
                               /home/rosetta/archive/rosetta3/dutch/neededinmrules.pf;
	touch $(language)/target/mrules4.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules4
  
/home/rosetta/archive/rosetta3/dutch/commrules5.o  \
/home/rosetta/archive/rosetta3/dutch/decommrules5.o  \
/home/rosetta/archive/rosetta3/dutch/commrules5.pf  \
/home/rosetta/archive/rosetta3/dutch/decommrules5.pf : /home/rosetta/archive/rosetta3/dutch/mrules5.out ;
 
/home/rosetta/archive/rosetta3/dutch/mrules5.out : /home/rosetta/archive/rosetta3/dutch/mrules5.mrule  \
                               /home/rosetta/archive/rosetta3/dutch/neededinmrules.pf;
	touch $(language)/target/mrules5.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules5
 
 
  
/home/rosetta/archive/rosetta3/dutch/commrules6.o  \
/home/rosetta/archive/rosetta3/dutch/decommrules6.o  \
/home/rosetta/archive/rosetta3/dutch/commrules6.pf  \
/home/rosetta/archive/rosetta3/dutch/decommrules6.pf : /home/rosetta/archive/rosetta3/dutch/mrules6.out ;
 
/home/rosetta/archive/rosetta3/dutch/mrules6.out : /home/rosetta/archive/rosetta3/dutch/mrules6.mrule  \
                               /home/rosetta/archive/rosetta3/dutch/neededinmrules.pf;
	touch $(language)/target/mrules6.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules6
 
 
  
  
/home/rosetta/archive/rosetta3/dutch/commrules7.o  \
/home/rosetta/archive/rosetta3/dutch/decommrules7.o  \
/home/rosetta/archive/rosetta3/dutch/commrules7.pf  \
/home/rosetta/archive/rosetta3/dutch/decommrules7.pf : /home/rosetta/archive/rosetta3/dutch/mrules7.out ;
 
/home/rosetta/archive/rosetta3/dutch/mrules7.out : /home/rosetta/archive/rosetta3/dutch/mrules7.mrule  \
                               /home/rosetta/archive/rosetta3/dutch/neededinmrules.pf;
	touch $(language)/target/mrules7.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules7
 
 
  
/home/rosetta/archive/rosetta3/dutch/commrules8.o  \
/home/rosetta/archive/rosetta3/dutch/decommrules8.o  \
/home/rosetta/archive/rosetta3/dutch/commrules8.pf  \
/home/rosetta/archive/rosetta3/dutch/decommrules8.pf : /home/rosetta/archive/rosetta3/dutch/mrules8.out ;
 
/home/rosetta/archive/rosetta3/dutch/mrules8.out : /home/rosetta/archive/rosetta3/dutch/mrules8.mrule  \
                               /home/rosetta/archive/rosetta3/dutch/neededinmrules.pf;
	touch $(language)/target/mrules8.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules8
 
 
  
  
/home/rosetta/archive/rosetta3/dutch/commrules9.o  \
/home/rosetta/archive/rosetta3/dutch/decommrules9.o  \
/home/rosetta/archive/rosetta3/dutch/commrules9.pf  \
/home/rosetta/archive/rosetta3/dutch/decommrules9.pf : /home/rosetta/archive/rosetta3/dutch/mrules9.out ;
 
/home/rosetta/archive/rosetta3/dutch/mrules9.out : /home/rosetta/archive/rosetta3/dutch/mrules9.mrule  \
                               /home/rosetta/archive/rosetta3/dutch/neededinmrules.pf;
	touch $(language)/target/mrules9.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules9
 
 
  
/home/rosetta/archive/rosetta3/dutch/commrules10.o  \
/home/rosetta/archive/rosetta3/dutch/decommrules10.o  \
/home/rosetta/archive/rosetta3/dutch/commrules10.pf  \
/home/rosetta/archive/rosetta3/dutch/decommrules10.pf : /home/rosetta/archive/rosetta3/dutch/mrules10.out ;
 
/home/rosetta/archive/rosetta3/dutch/mrules10.out : /home/rosetta/archive/rosetta3/dutch/mrules10.mrule  \
                               /home/rosetta/archive/rosetta3/dutch/neededinmrules.pf;
	touch $(language)/target/mrules10.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules10
 
 
  
/home/rosetta/archive/rosetta3/dutch/commrules11.o  \
/home/rosetta/archive/rosetta3/dutch/decommrules11.o  \
/home/rosetta/archive/rosetta3/dutch/commrules11.pf  \
/home/rosetta/archive/rosetta3/dutch/decommrules11.pf : /home/rosetta/archive/rosetta3/dutch/mrules11.out ;
 
/home/rosetta/archive/rosetta3/dutch/mrules11.out : /home/rosetta/archive/rosetta3/dutch/mrules11.mrule  \
                               /home/rosetta/archive/rosetta3/dutch/neededinmrules.pf;
	touch $(language)/target/mrules11.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules11
 
 
  
/home/rosetta/archive/rosetta3/dutch/commrules12.o  \
/home/rosetta/archive/rosetta3/dutch/decommrules12.o  \
/home/rosetta/archive/rosetta3/dutch/commrules12.pf  \
/home/rosetta/archive/rosetta3/dutch/decommrules12.pf : /home/rosetta/archive/rosetta3/dutch/mrules12.out ;
 
/home/rosetta/archive/rosetta3/dutch/mrules12.out : /home/rosetta/archive/rosetta3/dutch/mrules12.mrule  \
                               /home/rosetta/archive/rosetta3/dutch/neededinmrules.pf;
	touch $(language)/target/mrules12.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules12
 
 
  
/home/rosetta/archive/rosetta3/dutch/commrules13.o  \
/home/rosetta/archive/rosetta3/dutch/decommrules13.o  \
/home/rosetta/archive/rosetta3/dutch/commrules13.pf  \
/home/rosetta/archive/rosetta3/dutch/decommrules13.pf : /home/rosetta/archive/rosetta3/dutch/mrules13.out ;
 
/home/rosetta/archive/rosetta3/dutch/mrules13.out : /home/rosetta/archive/rosetta3/dutch/mrules13.mrule  \
                               /home/rosetta/archive/rosetta3/dutch/neededinmrules.pf;
	touch $(language)/target/mrules13.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules13
 
 
  
/home/rosetta/archive/rosetta3/dutch/commrules14.o  \
/home/rosetta/archive/rosetta3/dutch/decommrules14.o  \
/home/rosetta/archive/rosetta3/dutch/commrules14.pf  \
/home/rosetta/archive/rosetta3/dutch/decommrules14.pf : /home/rosetta/archive/rosetta3/dutch/mrules14.out ;
 
/home/rosetta/archive/rosetta3/dutch/mrules14.out : /home/rosetta/archive/rosetta3/dutch/mrules14.mrule  \
                               /home/rosetta/archive/rosetta3/dutch/neededinmrules.pf;
	touch $(language)/target/mrules14.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules14
 
 
  
  
/home/rosetta/archive/rosetta3/dutch/commrules15.o  \
/home/rosetta/archive/rosetta3/dutch/decommrules15.o  \
/home/rosetta/archive/rosetta3/dutch/commrules15.pf  \
/home/rosetta/archive/rosetta3/dutch/decommrules15.pf : /home/rosetta/archive/rosetta3/dutch/mrules15.out ;
 
/home/rosetta/archive/rosetta3/dutch/mrules15.out : /home/rosetta/archive/rosetta3/dutch/mrules15.mrule  \
                               /home/rosetta/archive/rosetta3/dutch/neededinmrules.pf;
	touch $(language)/target/mrules15.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules15
 
 
  
/home/rosetta/archive/rosetta3/dutch/commrules16.o  \
/home/rosetta/archive/rosetta3/dutch/decommrules16.o  \
/home/rosetta/archive/rosetta3/dutch/commrules16.pf  \
/home/rosetta/archive/rosetta3/dutch/decommrules16.pf : /home/rosetta/archive/rosetta3/dutch/mrules16.out ;
 
/home/rosetta/archive/rosetta3/dutch/mrules16.out : /home/rosetta/archive/rosetta3/dutch/mrules16.mrule  \
                               /home/rosetta/archive/rosetta3/dutch/neededinmrules.pf;
	touch $(language)/target/mrules16.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules16
 
 
  
  
/home/rosetta/archive/rosetta3/dutch/commrules17.o  \
/home/rosetta/archive/rosetta3/dutch/decommrules17.o  \
/home/rosetta/archive/rosetta3/dutch/commrules17.pf  \
/home/rosetta/archive/rosetta3/dutch/decommrules17.pf : /home/rosetta/archive/rosetta3/dutch/mrules17.out ;
 
/home/rosetta/archive/rosetta3/dutch/mrules17.out : /home/rosetta/archive/rosetta3/dutch/mrules17.mrule  \
                               /home/rosetta/archive/rosetta3/dutch/neededinmrules.pf;
	touch $(language)/target/mrules17.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules17
 
 
  
/home/rosetta/archive/rosetta3/dutch/commrules18.o  \
/home/rosetta/archive/rosetta3/dutch/decommrules18.o  \
/home/rosetta/archive/rosetta3/dutch/commrules18.pf  \
/home/rosetta/archive/rosetta3/dutch/decommrules18.pf : /home/rosetta/archive/rosetta3/dutch/mrules18.out ;
 
/home/rosetta/archive/rosetta3/dutch/mrules18.out : /home/rosetta/archive/rosetta3/dutch/mrules18.mrule  \
                               /home/rosetta/archive/rosetta3/dutch/neededinmrules.pf;
	touch $(language)/target/mrules18.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules18
 
 
  
  
/home/rosetta/archive/rosetta3/dutch/commrules19.o  \
/home/rosetta/archive/rosetta3/dutch/decommrules19.o  \
/home/rosetta/archive/rosetta3/dutch/commrules19.pf  \
/home/rosetta/archive/rosetta3/dutch/decommrules19.pf : /home/rosetta/archive/rosetta3/dutch/mrules19.out ;
 
/home/rosetta/archive/rosetta3/dutch/mrules19.out : /home/rosetta/archive/rosetta3/dutch/mrules19.mrule  \
                               /home/rosetta/archive/rosetta3/dutch/neededinmrules.pf;
	touch $(language)/target/mrules19.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules19
 
 
  
/home/rosetta/archive/rosetta3/dutch/commrules20.o  \
/home/rosetta/archive/rosetta3/dutch/decommrules20.o  \
/home/rosetta/archive/rosetta3/dutch/commrules20.pf  \
/home/rosetta/archive/rosetta3/dutch/decommrules20.pf : /home/rosetta/archive/rosetta3/dutch/mrules20.out ;
 
/home/rosetta/archive/rosetta3/dutch/mrules20.out : /home/rosetta/archive/rosetta3/dutch/mrules20.mrule  \
                               /home/rosetta/archive/rosetta3/dutch/neededinmrules.pf;
	touch $(language)/target/mrules20.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules20
 
 
  
/home/rosetta/archive/rosetta3/dutch/commrules21.o  \
/home/rosetta/archive/rosetta3/dutch/decommrules21.o  \
/home/rosetta/archive/rosetta3/dutch/commrules21.pf  \
/home/rosetta/archive/rosetta3/dutch/decommrules21.pf : /home/rosetta/archive/rosetta3/dutch/mrules21.out ;
 
/home/rosetta/archive/rosetta3/dutch/mrules21.out : /home/rosetta/archive/rosetta3/dutch/mrules21.mrule  \
                               /home/rosetta/archive/rosetta3/dutch/neededinmrules.pf;
	touch $(language)/target/mrules21.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules21
 
 
  
/home/rosetta/archive/rosetta3/dutch/commrules22.o  \
/home/rosetta/archive/rosetta3/dutch/decommrules22.o  \
/home/rosetta/archive/rosetta3/dutch/commrules22.pf  \
/home/rosetta/archive/rosetta3/dutch/decommrules22.pf : /home/rosetta/archive/rosetta3/dutch/mrules22.out ;
 
/home/rosetta/archive/rosetta3/dutch/mrules22.out : /home/rosetta/archive/rosetta3/dutch/mrules22.mrule  \
                               /home/rosetta/archive/rosetta3/dutch/neededinmrules.pf;
	touch $(language)/target/mrules22.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules22
 
 
  
/home/rosetta/archive/rosetta3/dutch/commrules23.o  \
/home/rosetta/archive/rosetta3/dutch/decommrules23.o  \
/home/rosetta/archive/rosetta3/dutch/commrules23.pf  \
/home/rosetta/archive/rosetta3/dutch/decommrules23.pf : /home/rosetta/archive/rosetta3/dutch/mrules23.out ;
 
/home/rosetta/archive/rosetta3/dutch/mrules23.out : /home/rosetta/archive/rosetta3/dutch/mrules23.mrule  \
                               /home/rosetta/archive/rosetta3/dutch/neededinmrules.pf;
	touch $(language)/target/mrules23.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules23
 
 
  
/home/rosetta/archive/rosetta3/dutch/commrules24.o  \
/home/rosetta/archive/rosetta3/dutch/decommrules24.o  \
/home/rosetta/archive/rosetta3/dutch/commrules24.pf  \
/home/rosetta/archive/rosetta3/dutch/decommrules24.pf : /home/rosetta/archive/rosetta3/dutch/mrules24.out ;
 
/home/rosetta/archive/rosetta3/dutch/mrules24.out : /home/rosetta/archive/rosetta3/dutch/mrules24.mrule  \
                               /home/rosetta/archive/rosetta3/dutch/neededinmrules.pf;
	touch $(language)/target/mrules24.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules24
 
 
  
  
/home/rosetta/archive/rosetta3/dutch/commrules25.o  \
/home/rosetta/archive/rosetta3/dutch/decommrules25.o  \
/home/rosetta/archive/rosetta3/dutch/commrules25.pf  \
/home/rosetta/archive/rosetta3/dutch/decommrules25.pf : /home/rosetta/archive/rosetta3/dutch/mrules25.out ;
 
/home/rosetta/archive/rosetta3/dutch/mrules25.out : /home/rosetta/archive/rosetta3/dutch/mrules25.mrule  \
                               /home/rosetta/archive/rosetta3/dutch/neededinmrules.pf;
	touch $(language)/target/mrules25.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules25
 
 
  
/home/rosetta/archive/rosetta3/dutch/commrules26.o  \
/home/rosetta/archive/rosetta3/dutch/decommrules26.o  \
/home/rosetta/archive/rosetta3/dutch/commrules26.pf  \
/home/rosetta/archive/rosetta3/dutch/decommrules26.pf : /home/rosetta/archive/rosetta3/dutch/mrules26.out ;
 
/home/rosetta/archive/rosetta3/dutch/mrules26.out : /home/rosetta/archive/rosetta3/dutch/mrules26.mrule  \
                               /home/rosetta/archive/rosetta3/dutch/neededinmrules.pf;
	touch $(language)/target/mrules26.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules26
 
 
  
  
/home/rosetta/archive/rosetta3/dutch/commrules27.o  \
/home/rosetta/archive/rosetta3/dutch/decommrules27.o  \
/home/rosetta/archive/rosetta3/dutch/commrules27.pf  \
/home/rosetta/archive/rosetta3/dutch/decommrules27.pf : /home/rosetta/archive/rosetta3/dutch/mrules27.out ;
 
/home/rosetta/archive/rosetta3/dutch/mrules27.out : /home/rosetta/archive/rosetta3/dutch/mrules27.mrule  \
                               /home/rosetta/archive/rosetta3/dutch/neededinmrules.pf;
	touch $(language)/target/mrules27.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules27
 
 
  
/home/rosetta/archive/rosetta3/dutch/commrules28.o  \
/home/rosetta/archive/rosetta3/dutch/decommrules28.o  \
/home/rosetta/archive/rosetta3/dutch/commrules28.pf  \
/home/rosetta/archive/rosetta3/dutch/decommrules28.pf : /home/rosetta/archive/rosetta3/dutch/mrules28.out ;
 
/home/rosetta/archive/rosetta3/dutch/mrules28.out : /home/rosetta/archive/rosetta3/dutch/mrules28.mrule  \
                               /home/rosetta/archive/rosetta3/dutch/neededinmrules.pf;
	touch $(language)/target/mrules28.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules28
 
 
  
  
/home/rosetta/archive/rosetta3/dutch/commrules29.o  \
/home/rosetta/archive/rosetta3/dutch/decommrules29.o  \
/home/rosetta/archive/rosetta3/dutch/commrules29.pf  \
/home/rosetta/archive/rosetta3/dutch/decommrules29.pf : /home/rosetta/archive/rosetta3/dutch/mrules29.out ;
 
/home/rosetta/archive/rosetta3/dutch/mrules29.out : /home/rosetta/archive/rosetta3/dutch/mrules29.mrule  \
                               /home/rosetta/archive/rosetta3/dutch/neededinmrules.pf;
	touch $(language)/target/mrules29.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules29
 
 
  
/home/rosetta/archive/rosetta3/dutch/commrules30.o  \
/home/rosetta/archive/rosetta3/dutch/decommrules30.o  \
/home/rosetta/archive/rosetta3/dutch/commrules30.pf  \
/home/rosetta/archive/rosetta3/dutch/decommrules30.pf : /home/rosetta/archive/rosetta3/dutch/mrules30.out ;
 
/home/rosetta/archive/rosetta3/dutch/mrules30.out : /home/rosetta/archive/rosetta3/dutch/mrules30.mrule  \
                               /home/rosetta/archive/rosetta3/dutch/neededinmrules.pf;
	touch $(language)/target/mrules30.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules30
 
 
  
/home/rosetta/archive/rosetta3/dutch/commrules31.o  \
/home/rosetta/archive/rosetta3/dutch/decommrules31.o  \
/home/rosetta/archive/rosetta3/dutch/commrules31.pf  \
/home/rosetta/archive/rosetta3/dutch/decommrules31.pf : /home/rosetta/archive/rosetta3/dutch/mrules31.out ;
 
/home/rosetta/archive/rosetta3/dutch/mrules31.out : /home/rosetta/archive/rosetta3/dutch/mrules31.mrule  \
                               /home/rosetta/archive/rosetta3/dutch/neededinmrules.pf;
	touch $(language)/target/mrules31.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules31
 
 
  
/home/rosetta/archive/rosetta3/dutch/commrules32.o  \
/home/rosetta/archive/rosetta3/dutch/decommrules32.o  \
/home/rosetta/archive/rosetta3/dutch/commrules32.pf  \
/home/rosetta/archive/rosetta3/dutch/decommrules32.pf : /home/rosetta/archive/rosetta3/dutch/mrules32.out ;
 
/home/rosetta/archive/rosetta3/dutch/mrules32.out : /home/rosetta/archive/rosetta3/dutch/mrules32.mrule  \
                               /home/rosetta/archive/rosetta3/dutch/neededinmrules.pf;
	touch $(language)/target/mrules32.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules32
 
 
  
/home/rosetta/archive/rosetta3/dutch/commrules33.o  \
/home/rosetta/archive/rosetta3/dutch/decommrules33.o  \
/home/rosetta/archive/rosetta3/dutch/commrules33.pf  \
/home/rosetta/archive/rosetta3/dutch/decommrules33.pf : /home/rosetta/archive/rosetta3/dutch/mrules33.out ;
 
/home/rosetta/archive/rosetta3/dutch/mrules33.out : /home/rosetta/archive/rosetta3/dutch/mrules33.mrule  \
                               /home/rosetta/archive/rosetta3/dutch/neededinmrules.pf;
	touch $(language)/target/mrules33.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules33
 
 
  
/home/rosetta/archive/rosetta3/dutch/commrules34.o  \
/home/rosetta/archive/rosetta3/dutch/decommrules34.o  \
/home/rosetta/archive/rosetta3/dutch/commrules34.pf  \
/home/rosetta/archive/rosetta3/dutch/decommrules34.pf : /home/rosetta/archive/rosetta3/dutch/mrules34.out ;
 
/home/rosetta/archive/rosetta3/dutch/mrules34.out : /home/rosetta/archive/rosetta3/dutch/mrules34.mrule  \
                               /home/rosetta/archive/rosetta3/dutch/neededinmrules.pf;
	touch $(language)/target/mrules34.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules34
 
 
  
  
/home/rosetta/archive/rosetta3/dutch/commrules35.o  \
/home/rosetta/archive/rosetta3/dutch/decommrules35.o  \
/home/rosetta/archive/rosetta3/dutch/commrules35.pf  \
/home/rosetta/archive/rosetta3/dutch/decommrules35.pf : /home/rosetta/archive/rosetta3/dutch/mrules35.out ;
 
/home/rosetta/archive/rosetta3/dutch/mrules35.out : /home/rosetta/archive/rosetta3/dutch/mrules35.mrule  \
                               /home/rosetta/archive/rosetta3/dutch/neededinmrules.pf;
	touch $(language)/target/mrules35.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules35
 
 
  
/home/rosetta/archive/rosetta3/dutch/commrules36.o  \
/home/rosetta/archive/rosetta3/dutch/decommrules36.o  \
/home/rosetta/archive/rosetta3/dutch/commrules36.pf  \
/home/rosetta/archive/rosetta3/dutch/decommrules36.pf : /home/rosetta/archive/rosetta3/dutch/mrules36.out ;
 
/home/rosetta/archive/rosetta3/dutch/mrules36.out : /home/rosetta/archive/rosetta3/dutch/mrules36.mrule  \
                               /home/rosetta/archive/rosetta3/dutch/neededinmrules.pf;
	touch $(language)/target/mrules36.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules36
 
 
  
  
/home/rosetta/archive/rosetta3/dutch/commrules37.o  \
/home/rosetta/archive/rosetta3/dutch/decommrules37.o  \
/home/rosetta/archive/rosetta3/dutch/commrules37.pf  \
/home/rosetta/archive/rosetta3/dutch/decommrules37.pf : /home/rosetta/archive/rosetta3/dutch/mrules37.out ;
 
/home/rosetta/archive/rosetta3/dutch/mrules37.out : /home/rosetta/archive/rosetta3/dutch/mrules37.mrule  \
                               /home/rosetta/archive/rosetta3/dutch/neededinmrules.pf;
	touch $(language)/target/mrules37.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules37
 
 
  
/home/rosetta/archive/rosetta3/dutch/commrules38.o  \
/home/rosetta/archive/rosetta3/dutch/decommrules38.o  \
/home/rosetta/archive/rosetta3/dutch/commrules38.pf  \
/home/rosetta/archive/rosetta3/dutch/decommrules38.pf : /home/rosetta/archive/rosetta3/dutch/mrules38.out ;
 
/home/rosetta/archive/rosetta3/dutch/mrules38.out : /home/rosetta/archive/rosetta3/dutch/mrules38.mrule  \
                               /home/rosetta/archive/rosetta3/dutch/neededinmrules.pf;
	touch $(language)/target/mrules38.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules38
 
 
  
  
/home/rosetta/archive/rosetta3/dutch/commrules39.o  \
/home/rosetta/archive/rosetta3/dutch/decommrules39.o  \
/home/rosetta/archive/rosetta3/dutch/commrules39.pf  \
/home/rosetta/archive/rosetta3/dutch/decommrules39.pf : /home/rosetta/archive/rosetta3/dutch/mrules39.out ;
 
/home/rosetta/archive/rosetta3/dutch/mrules39.out : /home/rosetta/archive/rosetta3/dutch/mrules39.mrule  \
                               /home/rosetta/archive/rosetta3/dutch/neededinmrules.pf;
	touch $(language)/target/mrules39.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules39
 
 
  
/home/rosetta/archive/rosetta3/dutch/commrules40.o  \
/home/rosetta/archive/rosetta3/dutch/decommrules40.o  \
/home/rosetta/archive/rosetta3/dutch/commrules40.pf  \
/home/rosetta/archive/rosetta3/dutch/decommrules40.pf : /home/rosetta/archive/rosetta3/dutch/mrules40.out ;
 
/home/rosetta/archive/rosetta3/dutch/mrules40.out : /home/rosetta/archive/rosetta3/dutch/mrules40.mrule  \
                               /home/rosetta/archive/rosetta3/dutch/neededinmrules.pf;
	touch $(language)/target/mrules40.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules40
 
 
  
/home/rosetta/archive/rosetta3/dutch/commrules41.o  \
/home/rosetta/archive/rosetta3/dutch/decommrules41.o  \
/home/rosetta/archive/rosetta3/dutch/commrules41.pf  \
/home/rosetta/archive/rosetta3/dutch/decommrules41.pf : /home/rosetta/archive/rosetta3/dutch/mrules41.out ;
 
/home/rosetta/archive/rosetta3/dutch/mrules41.out : /home/rosetta/archive/rosetta3/dutch/mrules41.mrule  \
                               /home/rosetta/archive/rosetta3/dutch/neededinmrules.pf;
	touch $(language)/target/mrules41.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules41
 
 
  
/home/rosetta/archive/rosetta3/dutch/commrules42.o  \
/home/rosetta/archive/rosetta3/dutch/decommrules42.o  \
/home/rosetta/archive/rosetta3/dutch/commrules42.pf  \
/home/rosetta/archive/rosetta3/dutch/decommrules42.pf : /home/rosetta/archive/rosetta3/dutch/mrules42.out ;
 
/home/rosetta/archive/rosetta3/dutch/mrules42.out : /home/rosetta/archive/rosetta3/dutch/mrules42.mrule  \
                               /home/rosetta/archive/rosetta3/dutch/neededinmrules.pf;
	touch $(language)/target/mrules42.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules42
 
 
  
/home/rosetta/archive/rosetta3/dutch/commrules43.o  \
/home/rosetta/archive/rosetta3/dutch/decommrules43.o  \
/home/rosetta/archive/rosetta3/dutch/commrules43.pf  \
/home/rosetta/archive/rosetta3/dutch/decommrules43.pf : /home/rosetta/archive/rosetta3/dutch/mrules43.out ;
 
/home/rosetta/archive/rosetta3/dutch/mrules43.out : /home/rosetta/archive/rosetta3/dutch/mrules43.mrule  \
                               /home/rosetta/archive/rosetta3/dutch/neededinmrules.pf;
	touch $(language)/target/mrules43.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules43
 
 
  
/home/rosetta/archive/rosetta3/dutch/commrules44.o  \
/home/rosetta/archive/rosetta3/dutch/decommrules44.o  \
/home/rosetta/archive/rosetta3/dutch/commrules44.pf  \
/home/rosetta/archive/rosetta3/dutch/decommrules44.pf : /home/rosetta/archive/rosetta3/dutch/mrules44.out ;
 
/home/rosetta/archive/rosetta3/dutch/mrules44.out : /home/rosetta/archive/rosetta3/dutch/mrules44.mrule  \
                               /home/rosetta/archive/rosetta3/dutch/neededinmrules.pf;
	touch $(language)/target/mrules44.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules44
 
 
  
  
/home/rosetta/archive/rosetta3/dutch/commrules45.o  \
/home/rosetta/archive/rosetta3/dutch/decommrules45.o  \
/home/rosetta/archive/rosetta3/dutch/commrules45.pf  \
/home/rosetta/archive/rosetta3/dutch/decommrules45.pf : /home/rosetta/archive/rosetta3/dutch/mrules45.out ;
 
/home/rosetta/archive/rosetta3/dutch/mrules45.out : /home/rosetta/archive/rosetta3/dutch/mrules45.mrule  \
                               /home/rosetta/archive/rosetta3/dutch/neededinmrules.pf;
	touch $(language)/target/mrules45.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules45
 
 
  
/home/rosetta/archive/rosetta3/dutch/commrules46.o  \
/home/rosetta/archive/rosetta3/dutch/decommrules46.o  \
/home/rosetta/archive/rosetta3/dutch/commrules46.pf  \
/home/rosetta/archive/rosetta3/dutch/decommrules46.pf : /home/rosetta/archive/rosetta3/dutch/mrules46.out ;
 
/home/rosetta/archive/rosetta3/dutch/mrules46.out : /home/rosetta/archive/rosetta3/dutch/mrules46.mrule  \
                               /home/rosetta/archive/rosetta3/dutch/neededinmrules.pf;
	touch $(language)/target/mrules46.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules46
 
 
  
  
/home/rosetta/archive/rosetta3/dutch/commrules47.o  \
/home/rosetta/archive/rosetta3/dutch/decommrules47.o  \
/home/rosetta/archive/rosetta3/dutch/commrules47.pf  \
/home/rosetta/archive/rosetta3/dutch/decommrules47.pf : /home/rosetta/archive/rosetta3/dutch/mrules47.out ;
 
/home/rosetta/archive/rosetta3/dutch/mrules47.out : /home/rosetta/archive/rosetta3/dutch/mrules47.mrule  \
                               /home/rosetta/archive/rosetta3/dutch/neededinmrules.pf;
	touch $(language)/target/mrules47.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules47
 
 
  
/home/rosetta/archive/rosetta3/dutch/commrules48.o  \
/home/rosetta/archive/rosetta3/dutch/decommrules48.o  \
/home/rosetta/archive/rosetta3/dutch/commrules48.pf  \
/home/rosetta/archive/rosetta3/dutch/decommrules48.pf : /home/rosetta/archive/rosetta3/dutch/mrules48.out ;
 
/home/rosetta/archive/rosetta3/dutch/mrules48.out : /home/rosetta/archive/rosetta3/dutch/mrules48.mrule  \
                               /home/rosetta/archive/rosetta3/dutch/neededinmrules.pf;
	touch $(language)/target/mrules48.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules48
 
 
  
  
/home/rosetta/archive/rosetta3/dutch/commrules49.o  \
/home/rosetta/archive/rosetta3/dutch/decommrules49.o  \
/home/rosetta/archive/rosetta3/dutch/commrules49.pf  \
/home/rosetta/archive/rosetta3/dutch/decommrules49.pf : /home/rosetta/archive/rosetta3/dutch/mrules49.out ;
 
/home/rosetta/archive/rosetta3/dutch/mrules49.out : /home/rosetta/archive/rosetta3/dutch/mrules49.mrule  \
                               /home/rosetta/archive/rosetta3/dutch/neededinmrules.pf;
	touch $(language)/target/mrules49.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules49
 
 
  
/home/rosetta/archive/rosetta3/dutch/commrules50.o  \
/home/rosetta/archive/rosetta3/dutch/decommrules50.o  \
/home/rosetta/archive/rosetta3/dutch/commrules50.pf  \
/home/rosetta/archive/rosetta3/dutch/decommrules50.pf : /home/rosetta/archive/rosetta3/dutch/mrules50.out ;
 
/home/rosetta/archive/rosetta3/dutch/mrules50.out : /home/rosetta/archive/rosetta3/dutch/mrules50.mrule  \
                               /home/rosetta/archive/rosetta3/dutch/neededinmrules.pf;
	touch $(language)/target/mrules50.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules50
 
 
  
/home/rosetta/archive/rosetta3/dutch/commrules51.o  \
/home/rosetta/archive/rosetta3/dutch/decommrules51.o  \
/home/rosetta/archive/rosetta3/dutch/commrules51.pf  \
/home/rosetta/archive/rosetta3/dutch/decommrules51.pf : /home/rosetta/archive/rosetta3/dutch/mrules51.out ;
 
/home/rosetta/archive/rosetta3/dutch/mrules51.out : /home/rosetta/archive/rosetta3/dutch/mrules51.mrule  \
                               /home/rosetta/archive/rosetta3/dutch/neededinmrules.pf;
	touch $(language)/target/mrules51.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules51
 
 
  
/home/rosetta/archive/rosetta3/dutch/commrules52.o  \
/home/rosetta/archive/rosetta3/dutch/decommrules52.o  \
/home/rosetta/archive/rosetta3/dutch/commrules52.pf  \
/home/rosetta/archive/rosetta3/dutch/decommrules52.pf : /home/rosetta/archive/rosetta3/dutch/mrules52.out ;
 
/home/rosetta/archive/rosetta3/dutch/mrules52.out : /home/rosetta/archive/rosetta3/dutch/mrules52.mrule  \
                               /home/rosetta/archive/rosetta3/dutch/neededinmrules.pf;
	touch $(language)/target/mrules52.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules52
 
 
  
/home/rosetta/archive/rosetta3/dutch/commrules53.o  \
/home/rosetta/archive/rosetta3/dutch/decommrules53.o  \
/home/rosetta/archive/rosetta3/dutch/commrules53.pf  \
/home/rosetta/archive/rosetta3/dutch/decommrules53.pf : /home/rosetta/archive/rosetta3/dutch/mrules53.out ;
 
/home/rosetta/archive/rosetta3/dutch/mrules53.out : /home/rosetta/archive/rosetta3/dutch/mrules53.mrule  \
                               /home/rosetta/archive/rosetta3/dutch/neededinmrules.pf;
	touch $(language)/target/mrules53.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules53
 
 
  
/home/rosetta/archive/rosetta3/dutch/commrules54.o  \
/home/rosetta/archive/rosetta3/dutch/decommrules54.o  \
/home/rosetta/archive/rosetta3/dutch/commrules54.pf  \
/home/rosetta/archive/rosetta3/dutch/decommrules54.pf : /home/rosetta/archive/rosetta3/dutch/mrules54.out ;
 
/home/rosetta/archive/rosetta3/dutch/mrules54.out : /home/rosetta/archive/rosetta3/dutch/mrules54.mrule  \
                               /home/rosetta/archive/rosetta3/dutch/neededinmrules.pf;
	touch $(language)/target/mrules54.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules54
 
 
  
  
/home/rosetta/archive/rosetta3/dutch/commrules55.o  \
/home/rosetta/archive/rosetta3/dutch/decommrules55.o  \
/home/rosetta/archive/rosetta3/dutch/commrules55.pf  \
/home/rosetta/archive/rosetta3/dutch/decommrules55.pf : /home/rosetta/archive/rosetta3/dutch/mrules55.out ;
 
/home/rosetta/archive/rosetta3/dutch/mrules55.out : /home/rosetta/archive/rosetta3/dutch/mrules55.mrule  \
                               /home/rosetta/archive/rosetta3/dutch/neededinmrules.pf;
	touch $(language)/target/mrules55.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules55
 
 
  
/home/rosetta/archive/rosetta3/dutch/commrules56.o  \
/home/rosetta/archive/rosetta3/dutch/decommrules56.o  \
/home/rosetta/archive/rosetta3/dutch/commrules56.pf  \
/home/rosetta/archive/rosetta3/dutch/decommrules56.pf : /home/rosetta/archive/rosetta3/dutch/mrules56.out ;
 
/home/rosetta/archive/rosetta3/dutch/mrules56.out : /home/rosetta/archive/rosetta3/dutch/mrules56.mrule  \
                               /home/rosetta/archive/rosetta3/dutch/neededinmrules.pf;
	touch $(language)/target/mrules56.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules56
 
 
  
  
/home/rosetta/archive/rosetta3/dutch/commrules57.o  \
/home/rosetta/archive/rosetta3/dutch/decommrules57.o  \
/home/rosetta/archive/rosetta3/dutch/commrules57.pf  \
/home/rosetta/archive/rosetta3/dutch/decommrules57.pf : /home/rosetta/archive/rosetta3/dutch/mrules57.out ;
 
/home/rosetta/archive/rosetta3/dutch/mrules57.out : /home/rosetta/archive/rosetta3/dutch/mrules57.mrule  \
                               /home/rosetta/archive/rosetta3/dutch/neededinmrules.pf;
	touch $(language)/target/mrules57.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules57
 
 
  
/home/rosetta/archive/rosetta3/dutch/commrules58.o  \
/home/rosetta/archive/rosetta3/dutch/decommrules58.o  \
/home/rosetta/archive/rosetta3/dutch/commrules58.pf  \
/home/rosetta/archive/rosetta3/dutch/decommrules58.pf : /home/rosetta/archive/rosetta3/dutch/mrules58.out ;
 
/home/rosetta/archive/rosetta3/dutch/mrules58.out : /home/rosetta/archive/rosetta3/dutch/mrules58.mrule  \
                               /home/rosetta/archive/rosetta3/dutch/neededinmrules.pf;
	touch $(language)/target/mrules58.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules58
 
 
  
  
/home/rosetta/archive/rosetta3/dutch/commrules59.o  \
/home/rosetta/archive/rosetta3/dutch/decommrules59.o  \
/home/rosetta/archive/rosetta3/dutch/commrules59.pf  \
/home/rosetta/archive/rosetta3/dutch/decommrules59.pf : /home/rosetta/archive/rosetta3/dutch/mrules59.out ;
 
/home/rosetta/archive/rosetta3/dutch/mrules59.out : /home/rosetta/archive/rosetta3/dutch/mrules59.mrule  \
                               /home/rosetta/archive/rosetta3/dutch/neededinmrules.pf;
	touch $(language)/target/mrules59.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules59
 
 
  
/home/rosetta/archive/rosetta3/dutch/commrules60.o  \
/home/rosetta/archive/rosetta3/dutch/decommrules60.o  \
/home/rosetta/archive/rosetta3/dutch/commrules60.pf  \
/home/rosetta/archive/rosetta3/dutch/decommrules60.pf : /home/rosetta/archive/rosetta3/dutch/mrules60.out ;
 
/home/rosetta/archive/rosetta3/dutch/mrules60.out : /home/rosetta/archive/rosetta3/dutch/mrules60.mrule  \
                               /home/rosetta/archive/rosetta3/dutch/neededinmrules.pf;
	touch $(language)/target/mrules60.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules60
 
 
  
/home/rosetta/archive/rosetta3/dutch/commrules61.o  \
/home/rosetta/archive/rosetta3/dutch/decommrules61.o  \
/home/rosetta/archive/rosetta3/dutch/commrules61.pf  \
/home/rosetta/archive/rosetta3/dutch/decommrules61.pf : /home/rosetta/archive/rosetta3/dutch/mrules61.out ;
 
/home/rosetta/archive/rosetta3/dutch/mrules61.out : /home/rosetta/archive/rosetta3/dutch/mrules61.mrule  \
                               /home/rosetta/archive/rosetta3/dutch/neededinmrules.pf;
	touch $(language)/target/mrules61.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules61
 
 
  
/home/rosetta/archive/rosetta3/dutch/commrules62.o  \
/home/rosetta/archive/rosetta3/dutch/decommrules62.o  \
/home/rosetta/archive/rosetta3/dutch/commrules62.pf  \
/home/rosetta/archive/rosetta3/dutch/decommrules62.pf : /home/rosetta/archive/rosetta3/dutch/mrules62.out ;
 
/home/rosetta/archive/rosetta3/dutch/mrules62.out : /home/rosetta/archive/rosetta3/dutch/mrules62.mrule  \
                               /home/rosetta/archive/rosetta3/dutch/neededinmrules.pf;
	touch $(language)/target/mrules62.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules62
 
 
  
/home/rosetta/archive/rosetta3/dutch/commrules63.o  \
/home/rosetta/archive/rosetta3/dutch/decommrules63.o  \
/home/rosetta/archive/rosetta3/dutch/commrules63.pf  \
/home/rosetta/archive/rosetta3/dutch/decommrules63.pf : /home/rosetta/archive/rosetta3/dutch/mrules63.out ;
 
/home/rosetta/archive/rosetta3/dutch/mrules63.out : /home/rosetta/archive/rosetta3/dutch/mrules63.mrule  \
                               /home/rosetta/archive/rosetta3/dutch/neededinmrules.pf;
	touch $(language)/target/mrules63.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules63
 
 
  
/home/rosetta/archive/rosetta3/dutch/commrules64.o  \
/home/rosetta/archive/rosetta3/dutch/decommrules64.o  \
/home/rosetta/archive/rosetta3/dutch/commrules64.pf  \
/home/rosetta/archive/rosetta3/dutch/decommrules64.pf : /home/rosetta/archive/rosetta3/dutch/mrules64.out ;
 
/home/rosetta/archive/rosetta3/dutch/mrules64.out : /home/rosetta/archive/rosetta3/dutch/mrules64.mrule  \
                               /home/rosetta/archive/rosetta3/dutch/neededinmrules.pf;
	touch $(language)/target/mrules64.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules64
 
 
  
  
/home/rosetta/archive/rosetta3/dutch/commrules65.o  \
/home/rosetta/archive/rosetta3/dutch/decommrules65.o  \
/home/rosetta/archive/rosetta3/dutch/commrules65.pf  \
/home/rosetta/archive/rosetta3/dutch/decommrules65.pf : /home/rosetta/archive/rosetta3/dutch/mrules65.out ;
 
/home/rosetta/archive/rosetta3/dutch/mrules65.out : /home/rosetta/archive/rosetta3/dutch/mrules65.mrule  \
                               /home/rosetta/archive/rosetta3/dutch/neededinmrules.pf;
	touch $(language)/target/mrules65.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules65
 
 
  
/home/rosetta/archive/rosetta3/dutch/commrules66.o  \
/home/rosetta/archive/rosetta3/dutch/decommrules66.o  \
/home/rosetta/archive/rosetta3/dutch/commrules66.pf  \
/home/rosetta/archive/rosetta3/dutch/decommrules66.pf : /home/rosetta/archive/rosetta3/dutch/mrules66.out ;
 
/home/rosetta/archive/rosetta3/dutch/mrules66.out : /home/rosetta/archive/rosetta3/dutch/mrules66.mrule  \
                               /home/rosetta/archive/rosetta3/dutch/neededinmrules.pf;
	touch $(language)/target/mrules66.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules66
 
 
  
  
/home/rosetta/archive/rosetta3/dutch/commrules67.o  \
/home/rosetta/archive/rosetta3/dutch/decommrules67.o  \
/home/rosetta/archive/rosetta3/dutch/commrules67.pf  \
/home/rosetta/archive/rosetta3/dutch/decommrules67.pf : /home/rosetta/archive/rosetta3/dutch/mrules67.out ;
 
/home/rosetta/archive/rosetta3/dutch/mrules67.out : /home/rosetta/archive/rosetta3/dutch/mrules67.mrule  \
                               /home/rosetta/archive/rosetta3/dutch/neededinmrules.pf;
	touch $(language)/target/mrules67.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules67
 
 
  
/home/rosetta/archive/rosetta3/dutch/commrules68.o  \
/home/rosetta/archive/rosetta3/dutch/decommrules68.o  \
/home/rosetta/archive/rosetta3/dutch/commrules68.pf  \
/home/rosetta/archive/rosetta3/dutch/decommrules68.pf : /home/rosetta/archive/rosetta3/dutch/mrules68.out ;
 
/home/rosetta/archive/rosetta3/dutch/mrules68.out : /home/rosetta/archive/rosetta3/dutch/mrules68.mrule  \
                               /home/rosetta/archive/rosetta3/dutch/neededinmrules.pf;
	touch $(language)/target/mrules68.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules68
 
 
  
  
/home/rosetta/archive/rosetta3/dutch/commrules69.o  \
/home/rosetta/archive/rosetta3/dutch/decommrules69.o  \
/home/rosetta/archive/rosetta3/dutch/commrules69.pf  \
/home/rosetta/archive/rosetta3/dutch/decommrules69.pf : /home/rosetta/archive/rosetta3/dutch/mrules69.out ;
 
/home/rosetta/archive/rosetta3/dutch/mrules69.out : /home/rosetta/archive/rosetta3/dutch/mrules69.mrule  \
                               /home/rosetta/archive/rosetta3/dutch/neededinmrules.pf;
	touch $(language)/target/mrules69.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules69
 
 
  
/home/rosetta/archive/rosetta3/dutch/commrules70.o  \
/home/rosetta/archive/rosetta3/dutch/decommrules70.o  \
/home/rosetta/archive/rosetta3/dutch/commrules70.pf  \
/home/rosetta/archive/rosetta3/dutch/decommrules70.pf : /home/rosetta/archive/rosetta3/dutch/mrules70.out ;
 
/home/rosetta/archive/rosetta3/dutch/mrules70.out : /home/rosetta/archive/rosetta3/dutch/mrules70.mrule  \
                               /home/rosetta/archive/rosetta3/dutch/neededinmrules.pf;
	touch $(language)/target/mrules70.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules70
 
 
  
/home/rosetta/archive/rosetta3/dutch/commrules71.o  \
/home/rosetta/archive/rosetta3/dutch/decommrules71.o  \
/home/rosetta/archive/rosetta3/dutch/commrules71.pf  \
/home/rosetta/archive/rosetta3/dutch/decommrules71.pf : /home/rosetta/archive/rosetta3/dutch/mrules71.out ;
 
/home/rosetta/archive/rosetta3/dutch/mrules71.out : /home/rosetta/archive/rosetta3/dutch/mrules71.mrule  \
                               /home/rosetta/archive/rosetta3/dutch/neededinmrules.pf;
	touch $(language)/target/mrules71.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules71
 
 
  
/home/rosetta/archive/rosetta3/dutch/commrules72.o  \
/home/rosetta/archive/rosetta3/dutch/decommrules72.o  \
/home/rosetta/archive/rosetta3/dutch/commrules72.pf  \
/home/rosetta/archive/rosetta3/dutch/decommrules72.pf : /home/rosetta/archive/rosetta3/dutch/mrules72.out ;
 
/home/rosetta/archive/rosetta3/dutch/mrules72.out : /home/rosetta/archive/rosetta3/dutch/mrules72.mrule  \
                               /home/rosetta/archive/rosetta3/dutch/neededinmrules.pf;
	touch $(language)/target/mrules72.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules72
 
 
  
/home/rosetta/archive/rosetta3/dutch/commrules73.o  \
/home/rosetta/archive/rosetta3/dutch/decommrules73.o  \
/home/rosetta/archive/rosetta3/dutch/commrules73.pf  \
/home/rosetta/archive/rosetta3/dutch/decommrules73.pf : /home/rosetta/archive/rosetta3/dutch/mrules73.out ;
 
/home/rosetta/archive/rosetta3/dutch/mrules73.out : /home/rosetta/archive/rosetta3/dutch/mrules73.mrule  \
                               /home/rosetta/archive/rosetta3/dutch/neededinmrules.pf;
	touch $(language)/target/mrules73.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules73
 
 
  
/home/rosetta/archive/rosetta3/dutch/commrules74.o  \
/home/rosetta/archive/rosetta3/dutch/decommrules74.o  \
/home/rosetta/archive/rosetta3/dutch/commrules74.pf  \
/home/rosetta/archive/rosetta3/dutch/decommrules74.pf : /home/rosetta/archive/rosetta3/dutch/mrules74.out ;
 
/home/rosetta/archive/rosetta3/dutch/mrules74.out : /home/rosetta/archive/rosetta3/dutch/mrules74.mrule  \
                               /home/rosetta/archive/rosetta3/dutch/neededinmrules.pf;
	touch $(language)/target/mrules74.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules74
 
 
  
  
/home/rosetta/archive/rosetta3/dutch/commrules75.o  \
/home/rosetta/archive/rosetta3/dutch/decommrules75.o  \
/home/rosetta/archive/rosetta3/dutch/commrules75.pf  \
/home/rosetta/archive/rosetta3/dutch/decommrules75.pf : /home/rosetta/archive/rosetta3/dutch/mrules75.out ;
 
/home/rosetta/archive/rosetta3/dutch/mrules75.out : /home/rosetta/archive/rosetta3/dutch/mrules75.mrule  \
                               /home/rosetta/archive/rosetta3/dutch/neededinmrules.pf;
	touch $(language)/target/mrules75.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules75
 
 
  
/home/rosetta/archive/rosetta3/dutch/commrules76.o  \
/home/rosetta/archive/rosetta3/dutch/decommrules76.o  \
/home/rosetta/archive/rosetta3/dutch/commrules76.pf  \
/home/rosetta/archive/rosetta3/dutch/decommrules76.pf : /home/rosetta/archive/rosetta3/dutch/mrules76.out ;
 
/home/rosetta/archive/rosetta3/dutch/mrules76.out : /home/rosetta/archive/rosetta3/dutch/mrules76.mrule  \
                               /home/rosetta/archive/rosetta3/dutch/neededinmrules.pf;
	touch $(language)/target/mrules76.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules76
 
 
  
  
/home/rosetta/archive/rosetta3/dutch/commrules77.o  \
/home/rosetta/archive/rosetta3/dutch/decommrules77.o  \
/home/rosetta/archive/rosetta3/dutch/commrules77.pf  \
/home/rosetta/archive/rosetta3/dutch/decommrules77.pf : /home/rosetta/archive/rosetta3/dutch/mrules77.out ;
 
/home/rosetta/archive/rosetta3/dutch/mrules77.out : /home/rosetta/archive/rosetta3/dutch/mrules77.mrule  \
                               /home/rosetta/archive/rosetta3/dutch/neededinmrules.pf;
	touch $(language)/target/mrules77.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules77
 
 
  
/home/rosetta/archive/rosetta3/dutch/commrules78.o  \
/home/rosetta/archive/rosetta3/dutch/decommrules78.o  \
/home/rosetta/archive/rosetta3/dutch/commrules78.pf  \
/home/rosetta/archive/rosetta3/dutch/decommrules78.pf : /home/rosetta/archive/rosetta3/dutch/mrules78.out ;
 
/home/rosetta/archive/rosetta3/dutch/mrules78.out : /home/rosetta/archive/rosetta3/dutch/mrules78.mrule  \
                               /home/rosetta/archive/rosetta3/dutch/neededinmrules.pf;
	touch $(language)/target/mrules78.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules78
 
 
  
  
/home/rosetta/archive/rosetta3/dutch/commrules79.o  \
/home/rosetta/archive/rosetta3/dutch/decommrules79.o  \
/home/rosetta/archive/rosetta3/dutch/commrules79.pf  \
/home/rosetta/archive/rosetta3/dutch/decommrules79.pf : /home/rosetta/archive/rosetta3/dutch/mrules79.out ;
 
/home/rosetta/archive/rosetta3/dutch/mrules79.out : /home/rosetta/archive/rosetta3/dutch/mrules79.mrule  \
                               /home/rosetta/archive/rosetta3/dutch/neededinmrules.pf;
	touch $(language)/target/mrules79.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules79
 
 
  
/home/rosetta/archive/rosetta3/dutch/commrules80.o  \
/home/rosetta/archive/rosetta3/dutch/decommrules80.o  \
/home/rosetta/archive/rosetta3/dutch/commrules80.pf  \
/home/rosetta/archive/rosetta3/dutch/decommrules80.pf : /home/rosetta/archive/rosetta3/dutch/mrules80.out ;
 
/home/rosetta/archive/rosetta3/dutch/mrules80.out : /home/rosetta/archive/rosetta3/dutch/mrules80.mrule  \
                               /home/rosetta/archive/rosetta3/dutch/neededinmrules.pf;
	touch $(language)/target/mrules80.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules80
 
 
  
/home/rosetta/archive/rosetta3/dutch/commrules81.o  \
/home/rosetta/archive/rosetta3/dutch/decommrules81.o  \
/home/rosetta/archive/rosetta3/dutch/commrules81.pf  \
/home/rosetta/archive/rosetta3/dutch/decommrules81.pf : /home/rosetta/archive/rosetta3/dutch/mrules81.out ;
 
/home/rosetta/archive/rosetta3/dutch/mrules81.out : /home/rosetta/archive/rosetta3/dutch/mrules81.mrule  \
                               /home/rosetta/archive/rosetta3/dutch/neededinmrules.pf;
	touch $(language)/target/mrules81.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules81
 
 
  
/home/rosetta/archive/rosetta3/dutch/commrules82.o  \
/home/rosetta/archive/rosetta3/dutch/decommrules82.o  \
/home/rosetta/archive/rosetta3/dutch/commrules82.pf  \
/home/rosetta/archive/rosetta3/dutch/decommrules82.pf : /home/rosetta/archive/rosetta3/dutch/mrules82.out ;
 
/home/rosetta/archive/rosetta3/dutch/mrules82.out : /home/rosetta/archive/rosetta3/dutch/mrules82.mrule  \
                               /home/rosetta/archive/rosetta3/dutch/neededinmrules.pf;
	touch $(language)/target/mrules82.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules82
 
 
  
/home/rosetta/archive/rosetta3/dutch/commrules83.o  \
/home/rosetta/archive/rosetta3/dutch/decommrules83.o  \
/home/rosetta/archive/rosetta3/dutch/commrules83.pf  \
/home/rosetta/archive/rosetta3/dutch/decommrules83.pf : /home/rosetta/archive/rosetta3/dutch/mrules83.out ;
 
/home/rosetta/archive/rosetta3/dutch/mrules83.out : /home/rosetta/archive/rosetta3/dutch/mrules83.mrule  \
                               /home/rosetta/archive/rosetta3/dutch/neededinmrules.pf;
	touch $(language)/target/mrules83.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules83
 
 
  
/home/rosetta/archive/rosetta3/dutch/commrules84.o  \
/home/rosetta/archive/rosetta3/dutch/decommrules84.o  \
/home/rosetta/archive/rosetta3/dutch/commrules84.pf  \
/home/rosetta/archive/rosetta3/dutch/decommrules84.pf : /home/rosetta/archive/rosetta3/dutch/mrules84.out ;
 
/home/rosetta/archive/rosetta3/dutch/mrules84.out : /home/rosetta/archive/rosetta3/dutch/mrules84.mrule  \
                               /home/rosetta/archive/rosetta3/dutch/neededinmrules.pf;
	touch $(language)/target/mrules84.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules84
 
 
  
  
/home/rosetta/archive/rosetta3/dutch/commrules85.o  \
/home/rosetta/archive/rosetta3/dutch/decommrules85.o  \
/home/rosetta/archive/rosetta3/dutch/commrules85.pf  \
/home/rosetta/archive/rosetta3/dutch/decommrules85.pf : /home/rosetta/archive/rosetta3/dutch/mrules85.out ;
 
/home/rosetta/archive/rosetta3/dutch/mrules85.out : /home/rosetta/archive/rosetta3/dutch/mrules85.mrule  \
                               /home/rosetta/archive/rosetta3/dutch/neededinmrules.pf;
	touch $(language)/target/mrules85.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules85
 
 
  
/home/rosetta/archive/rosetta3/dutch/commrules86.o  \
/home/rosetta/archive/rosetta3/dutch/decommrules86.o  \
/home/rosetta/archive/rosetta3/dutch/commrules86.pf  \
/home/rosetta/archive/rosetta3/dutch/decommrules86.pf : /home/rosetta/archive/rosetta3/dutch/mrules86.out ;
 
/home/rosetta/archive/rosetta3/dutch/mrules86.out : /home/rosetta/archive/rosetta3/dutch/mrules86.mrule  \
                               /home/rosetta/archive/rosetta3/dutch/neededinmrules.pf;
	touch $(language)/target/mrules86.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules86
 
 
  
  
/home/rosetta/archive/rosetta3/dutch/commrules87.o  \
/home/rosetta/archive/rosetta3/dutch/decommrules87.o  \
/home/rosetta/archive/rosetta3/dutch/commrules87.pf  \
/home/rosetta/archive/rosetta3/dutch/decommrules87.pf : /home/rosetta/archive/rosetta3/dutch/mrules87.out ;
 
/home/rosetta/archive/rosetta3/dutch/mrules87.out : /home/rosetta/archive/rosetta3/dutch/mrules87.mrule  \
                               /home/rosetta/archive/rosetta3/dutch/neededinmrules.pf;
	touch $(language)/target/mrules87.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules87
 
 
  
/home/rosetta/archive/rosetta3/dutch/commrules88.o  \
/home/rosetta/archive/rosetta3/dutch/decommrules88.o  \
/home/rosetta/archive/rosetta3/dutch/commrules88.pf  \
/home/rosetta/archive/rosetta3/dutch/decommrules88.pf : /home/rosetta/archive/rosetta3/dutch/mrules88.out ;
 
/home/rosetta/archive/rosetta3/dutch/mrules88.out : /home/rosetta/archive/rosetta3/dutch/mrules88.mrule  \
                               /home/rosetta/archive/rosetta3/dutch/neededinmrules.pf;
	touch $(language)/target/mrules88.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules88
 
 
  
  
/home/rosetta/archive/rosetta3/dutch/commrules89.o  \
/home/rosetta/archive/rosetta3/dutch/decommrules89.o  \
/home/rosetta/archive/rosetta3/dutch/commrules89.pf  \
/home/rosetta/archive/rosetta3/dutch/decommrules89.pf : /home/rosetta/archive/rosetta3/dutch/mrules89.out ;
 
/home/rosetta/archive/rosetta3/dutch/mrules89.out : /home/rosetta/archive/rosetta3/dutch/mrules89.mrule  \
                               /home/rosetta/archive/rosetta3/dutch/neededinmrules.pf;
	touch $(language)/target/mrules89.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules89
 
 
  
/home/rosetta/archive/rosetta3/dutch/commrules90.o  \
/home/rosetta/archive/rosetta3/dutch/decommrules90.o  \
/home/rosetta/archive/rosetta3/dutch/commrules90.pf  \
/home/rosetta/archive/rosetta3/dutch/decommrules90.pf : /home/rosetta/archive/rosetta3/dutch/mrules90.out ;
 
/home/rosetta/archive/rosetta3/dutch/mrules90.out : /home/rosetta/archive/rosetta3/dutch/mrules90.mrule  \
                               /home/rosetta/archive/rosetta3/dutch/neededinmrules.pf;
	touch $(language)/target/mrules90.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules90
 
 
  
/home/rosetta/archive/rosetta3/dutch/commrules91.o  \
/home/rosetta/archive/rosetta3/dutch/decommrules91.o  \
/home/rosetta/archive/rosetta3/dutch/commrules91.pf  \
/home/rosetta/archive/rosetta3/dutch/decommrules91.pf : /home/rosetta/archive/rosetta3/dutch/mrules91.out ;
 
/home/rosetta/archive/rosetta3/dutch/mrules91.out : /home/rosetta/archive/rosetta3/dutch/mrules91.mrule  \
                               /home/rosetta/archive/rosetta3/dutch/neededinmrules.pf;
	touch $(language)/target/mrules91.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules91
 
 
  
/home/rosetta/archive/rosetta3/dutch/commrules92.o  \
/home/rosetta/archive/rosetta3/dutch/decommrules92.o  \
/home/rosetta/archive/rosetta3/dutch/commrules92.pf  \
/home/rosetta/archive/rosetta3/dutch/decommrules92.pf : /home/rosetta/archive/rosetta3/dutch/mrules92.out ;
 
/home/rosetta/archive/rosetta3/dutch/mrules92.out : /home/rosetta/archive/rosetta3/dutch/mrules92.mrule  \
                               /home/rosetta/archive/rosetta3/dutch/neededinmrules.pf;
	touch $(language)/target/mrules92.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules92
 
 
  
/home/rosetta/archive/rosetta3/dutch/commrules93.o  \
/home/rosetta/archive/rosetta3/dutch/decommrules93.o  \
/home/rosetta/archive/rosetta3/dutch/commrules93.pf  \
/home/rosetta/archive/rosetta3/dutch/decommrules93.pf : /home/rosetta/archive/rosetta3/dutch/mrules93.out ;
 
/home/rosetta/archive/rosetta3/dutch/mrules93.out : /home/rosetta/archive/rosetta3/dutch/mrules93.mrule  \
                               /home/rosetta/archive/rosetta3/dutch/neededinmrules.pf;
	touch $(language)/target/mrules93.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules93
 
 
  
/home/rosetta/archive/rosetta3/dutch/commrules94.o  \
/home/rosetta/archive/rosetta3/dutch/decommrules94.o  \
/home/rosetta/archive/rosetta3/dutch/commrules94.pf  \
/home/rosetta/archive/rosetta3/dutch/decommrules94.pf : /home/rosetta/archive/rosetta3/dutch/mrules94.out ;
 
/home/rosetta/archive/rosetta3/dutch/mrules94.out : /home/rosetta/archive/rosetta3/dutch/mrules94.mrule  \
                               /home/rosetta/archive/rosetta3/dutch/neededinmrules.pf;
	touch $(language)/target/mrules94.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules94
 
 
  
  
/home/rosetta/archive/rosetta3/dutch/commrules95.o  \
/home/rosetta/archive/rosetta3/dutch/decommrules95.o  \
/home/rosetta/archive/rosetta3/dutch/commrules95.pf  \
/home/rosetta/archive/rosetta3/dutch/decommrules95.pf : /home/rosetta/archive/rosetta3/dutch/mrules95.out ;
 
/home/rosetta/archive/rosetta3/dutch/mrules95.out : /home/rosetta/archive/rosetta3/dutch/mrules95.mrule  \
                               /home/rosetta/archive/rosetta3/dutch/neededinmrules.pf;
	touch $(language)/target/mrules95.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules95
 
 
  
/home/rosetta/archive/rosetta3/dutch/commrules96.o  \
/home/rosetta/archive/rosetta3/dutch/decommrules96.o  \
/home/rosetta/archive/rosetta3/dutch/commrules96.pf  \
/home/rosetta/archive/rosetta3/dutch/decommrules96.pf : /home/rosetta/archive/rosetta3/dutch/mrules96.out ;
 
/home/rosetta/archive/rosetta3/dutch/mrules96.out : /home/rosetta/archive/rosetta3/dutch/mrules96.mrule  \
                               /home/rosetta/archive/rosetta3/dutch/neededinmrules.pf;
	touch $(language)/target/mrules96.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules96
 
 
  
  
/home/rosetta/archive/rosetta3/dutch/commrules97.o  \
/home/rosetta/archive/rosetta3/dutch/decommrules97.o  \
/home/rosetta/archive/rosetta3/dutch/commrules97.pf  \
/home/rosetta/archive/rosetta3/dutch/decommrules97.pf : /home/rosetta/archive/rosetta3/dutch/mrules97.out ;
 
/home/rosetta/archive/rosetta3/dutch/mrules97.out : /home/rosetta/archive/rosetta3/dutch/mrules97.mrule  \
                               /home/rosetta/archive/rosetta3/dutch/neededinmrules.pf;
	touch $(language)/target/mrules97.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules97
 
 
  
/home/rosetta/archive/rosetta3/dutch/commrules98.o  \
/home/rosetta/archive/rosetta3/dutch/decommrules98.o  \
/home/rosetta/archive/rosetta3/dutch/commrules98.pf  \
/home/rosetta/archive/rosetta3/dutch/decommrules98.pf : /home/rosetta/archive/rosetta3/dutch/mrules98.out ;
 
/home/rosetta/archive/rosetta3/dutch/mrules98.out : /home/rosetta/archive/rosetta3/dutch/mrules98.mrule  \
                               /home/rosetta/archive/rosetta3/dutch/neededinmrules.pf;
	touch $(language)/target/mrules98.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules98
 
 
  
/home/rosetta/archive/rosetta3/dutch/commrules99.o  \
/home/rosetta/archive/rosetta3/dutch/decommrules99.o  \
/home/rosetta/archive/rosetta3/dutch/commrules99.pf  \
/home/rosetta/archive/rosetta3/dutch/decommrules99.pf : /home/rosetta/archive/rosetta3/dutch/mrules99.out ;
 
/home/rosetta/archive/rosetta3/dutch/mrules99.out : /home/rosetta/archive/rosetta3/dutch/mrules99.mrule  \
                               /home/rosetta/archive/rosetta3/dutch/neededinmrules.pf;
	touch $(language)/target/mrules99.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules99
 
 
  
/home/rosetta/archive/rosetta3/dutch/commrules100.o  \
/home/rosetta/archive/rosetta3/dutch/decommrules100.o  \
/home/rosetta/archive/rosetta3/dutch/commrules100.pf  \
/home/rosetta/archive/rosetta3/dutch/decommrules100.pf : /home/rosetta/archive/rosetta3/dutch/mrules100.out ;
 
/home/rosetta/archive/rosetta3/dutch/mrules100.out : /home/rosetta/archive/rosetta3/dutch/mrules100.mrule  \
                               /home/rosetta/archive/rosetta3/dutch/neededinmrules.pf;
	touch $(language)/target/mrules100.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules100
 
 
  
/home/rosetta/archive/rosetta3/dutch/commrules101.o  \
/home/rosetta/archive/rosetta3/dutch/decommrules101.o  \
/home/rosetta/archive/rosetta3/dutch/commrules101.pf  \
/home/rosetta/archive/rosetta3/dutch/decommrules101.pf : /home/rosetta/archive/rosetta3/dutch/mrules101.out ;
 
/home/rosetta/archive/rosetta3/dutch/mrules101.out : /home/rosetta/archive/rosetta3/dutch/mrules101.mrule  \
                               /home/rosetta/archive/rosetta3/dutch/neededinmrules.pf;
	touch $(language)/target/mrules101.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules101
 
 
  
/home/rosetta/archive/rosetta3/dutch/commrules102.o  \
/home/rosetta/archive/rosetta3/dutch/decommrules102.o  \
/home/rosetta/archive/rosetta3/dutch/commrules102.pf  \
/home/rosetta/archive/rosetta3/dutch/decommrules102.pf : /home/rosetta/archive/rosetta3/dutch/mrules102.out ;
 
/home/rosetta/archive/rosetta3/dutch/mrules102.out : /home/rosetta/archive/rosetta3/dutch/mrules102.mrule  \
                               /home/rosetta/archive/rosetta3/dutch/neededinmrules.pf;
	touch $(language)/target/mrules102.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules102
 
 
  
/home/rosetta/archive/rosetta3/dutch/commrules103.o  \
/home/rosetta/archive/rosetta3/dutch/decommrules103.o  \
/home/rosetta/archive/rosetta3/dutch/commrules103.pf  \
/home/rosetta/archive/rosetta3/dutch/decommrules103.pf : /home/rosetta/archive/rosetta3/dutch/mrules103.out ;
 
/home/rosetta/archive/rosetta3/dutch/mrules103.out : /home/rosetta/archive/rosetta3/dutch/mrules103.mrule  \
                               /home/rosetta/archive/rosetta3/dutch/neededinmrules.pf;
	touch $(language)/target/mrules103.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules103
 
 
  
/home/rosetta/archive/rosetta3/dutch/commrules104.o  \
/home/rosetta/archive/rosetta3/dutch/decommrules104.o  \
/home/rosetta/archive/rosetta3/dutch/commrules104.pf  \
/home/rosetta/archive/rosetta3/dutch/decommrules104.pf : /home/rosetta/archive/rosetta3/dutch/mrules104.out ;
 
/home/rosetta/archive/rosetta3/dutch/mrules104.out : /home/rosetta/archive/rosetta3/dutch/mrules104.mrule  \
                               /home/rosetta/archive/rosetta3/dutch/neededinmrules.pf;
	touch $(language)/target/mrules104.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules104
 
 
  
  
/home/rosetta/archive/rosetta3/dutch/commrules105.o  \
/home/rosetta/archive/rosetta3/dutch/decommrules105.o  \
/home/rosetta/archive/rosetta3/dutch/commrules105.pf  \
/home/rosetta/archive/rosetta3/dutch/decommrules105.pf : /home/rosetta/archive/rosetta3/dutch/mrules105.out ;
 
/home/rosetta/archive/rosetta3/dutch/mrules105.out : /home/rosetta/archive/rosetta3/dutch/mrules105.mrule  \
                               /home/rosetta/archive/rosetta3/dutch/neededinmrules.pf;
	touch $(language)/target/mrules105.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules105
 
 
  
/home/rosetta/archive/rosetta3/dutch/commrules106.o  \
/home/rosetta/archive/rosetta3/dutch/decommrules106.o  \
/home/rosetta/archive/rosetta3/dutch/commrules106.pf  \
/home/rosetta/archive/rosetta3/dutch/decommrules106.pf : /home/rosetta/archive/rosetta3/dutch/mrules106.out ;
 
/home/rosetta/archive/rosetta3/dutch/mrules106.out : /home/rosetta/archive/rosetta3/dutch/mrules106.mrule  \
                               /home/rosetta/archive/rosetta3/dutch/neededinmrules.pf;
	touch $(language)/target/mrules106.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules106
 
 
  
#!!  
#!! idiom file 107, treated somewhat differently, see above   
#!!  
  
/home/rosetta/archive/rosetta3/dutch/commrules107.pf : /home/rosetta/archive/rosetta3/dutch/mrules107.mrule  \
                               /home/rosetta/archive/rosetta3/dutch/neededinmrules.pf;
	@/home/rosetta/archive/rosetta3/actions/mru $(language) mrules107
 
 
  
/home/rosetta/archive/rosetta3/dutch/commrules107.o  \
/home/rosetta/archive/rosetta3/dutch/decommrules107.o  \
/home/rosetta/archive/rosetta3/dutch/decommrules107.pf : /home/rosetta/archive/rosetta3/dutch/mrules107.out ;
 
/home/rosetta/archive/rosetta3/dutch/mrules107.out : /home/rosetta/archive/rosetta3/dutch/mrules107.mrule  \
                               /home/rosetta/archive/rosetta3/dutch/neededinmrules.pf;
	touch $(language)/target/mrules107.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules107
 
 
  
/home/rosetta/archive/rosetta3/dutch/commrules108.o  \
/home/rosetta/archive/rosetta3/dutch/decommrules108.o  \
/home/rosetta/archive/rosetta3/dutch/commrules108.pf  \
/home/rosetta/archive/rosetta3/dutch/decommrules108.pf : /home/rosetta/archive/rosetta3/dutch/mrules108.out ;
 
/home/rosetta/archive/rosetta3/dutch/mrules108.out : /home/rosetta/archive/rosetta3/dutch/mrules108.mrule  \
                               /home/rosetta/archive/rosetta3/dutch/neededinmrules.pf;
	touch $(language)/target/mrules108.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules108
 
 
  
/home/rosetta/archive/rosetta3/dutch/commrules109.o  \
/home/rosetta/archive/rosetta3/dutch/decommrules109.o  \
/home/rosetta/archive/rosetta3/dutch/commrules109.pf  \
/home/rosetta/archive/rosetta3/dutch/decommrules109.pf : /home/rosetta/archive/rosetta3/dutch/mrules109.out ;
 
/home/rosetta/archive/rosetta3/dutch/mrules109.out : /home/rosetta/archive/rosetta3/dutch/mrules109.mrule  \
                               /home/rosetta/archive/rosetta3/dutch/neededinmrules.pf;
	touch $(language)/target/mrules109.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules109
 
 
  
/home/rosetta/archive/rosetta3/dutch/commrules110.o  \
/home/rosetta/archive/rosetta3/dutch/decommrules110.o  \
/home/rosetta/archive/rosetta3/dutch/commrules110.pf  \
/home/rosetta/archive/rosetta3/dutch/decommrules110.pf : /home/rosetta/archive/rosetta3/dutch/mrules110.out ;
 
/home/rosetta/archive/rosetta3/dutch/mrules110.out : /home/rosetta/archive/rosetta3/dutch/mrules110.mrule  \
                               /home/rosetta/archive/rosetta3/dutch/neededinmrules.pf;
	touch $(language)/target/mrules110.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules110
 
 
  
/home/rosetta/archive/rosetta3/dutch/commrules111.o  \
/home/rosetta/archive/rosetta3/dutch/decommrules111.o  \
/home/rosetta/archive/rosetta3/dutch/commrules111.pf  \
/home/rosetta/archive/rosetta3/dutch/decommrules111.pf : /home/rosetta/archive/rosetta3/dutch/mrules111.out ;
 
/home/rosetta/archive/rosetta3/dutch/mrules111.out : /home/rosetta/archive/rosetta3/dutch/mrules111.mrule  \
                               /home/rosetta/archive/rosetta3/dutch/neededinmrules.pf;
	touch $(language)/target/mrules111.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules111
 
 
  
/home/rosetta/archive/rosetta3/dutch/commrules112.o  \
/home/rosetta/archive/rosetta3/dutch/decommrules112.o  \
/home/rosetta/archive/rosetta3/dutch/commrules112.pf  \
/home/rosetta/archive/rosetta3/dutch/decommrules112.pf : /home/rosetta/archive/rosetta3/dutch/mrules112.out ;
 
/home/rosetta/archive/rosetta3/dutch/mrules112.out : /home/rosetta/archive/rosetta3/dutch/mrules112.mrule  \
                               /home/rosetta/archive/rosetta3/dutch/neededinmrules.pf;
	touch $(language)/target/mrules112.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules112
 
 
  
/home/rosetta/archive/rosetta3/dutch/commrules113.o  \
/home/rosetta/archive/rosetta3/dutch/decommrules113.o  \
/home/rosetta/archive/rosetta3/dutch/commrules113.pf  \
/home/rosetta/archive/rosetta3/dutch/decommrules113.pf : /home/rosetta/archive/rosetta3/dutch/mrules113.out ;
 
/home/rosetta/archive/rosetta3/dutch/mrules113.out : /home/rosetta/archive/rosetta3/dutch/mrules113.mrule  \
                               /home/rosetta/archive/rosetta3/dutch/neededinmrules.pf;
	touch $(language)/target/mrules113.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules113
 
 
  
/home/rosetta/archive/rosetta3/dutch/commrules114.o  \
/home/rosetta/archive/rosetta3/dutch/decommrules114.o  \
/home/rosetta/archive/rosetta3/dutch/commrules114.pf  \
/home/rosetta/archive/rosetta3/dutch/decommrules114.pf : /home/rosetta/archive/rosetta3/dutch/mrules114.out ;
 
/home/rosetta/archive/rosetta3/dutch/mrules114.out : /home/rosetta/archive/rosetta3/dutch/mrules114.mrule  \
                               /home/rosetta/archive/rosetta3/dutch/neededinmrules.pf;
	touch $(language)/target/mrules114.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules114
 
 
  
  
/home/rosetta/archive/rosetta3/dutch/commrules115.o  \
/home/rosetta/archive/rosetta3/dutch/decommrules115.o  \
/home/rosetta/archive/rosetta3/dutch/commrules115.pf  \
/home/rosetta/archive/rosetta3/dutch/decommrules115.pf : /home/rosetta/archive/rosetta3/dutch/mrules115.out ;
 
/home/rosetta/archive/rosetta3/dutch/mrules115.out : /home/rosetta/archive/rosetta3/dutch/mrules115.mrule  \
                               /home/rosetta/archive/rosetta3/dutch/neededinmrules.pf;
	touch $(language)/target/mrules115.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules115
 
 
  
/home/rosetta/archive/rosetta3/dutch/commrules116.o  \
/home/rosetta/archive/rosetta3/dutch/decommrules116.o  \
/home/rosetta/archive/rosetta3/dutch/commrules116.pf  \
/home/rosetta/archive/rosetta3/dutch/decommrules116.pf : /home/rosetta/archive/rosetta3/dutch/mrules116.out ;
 
/home/rosetta/archive/rosetta3/dutch/mrules116.out : /home/rosetta/archive/rosetta3/dutch/mrules116.mrule  \
                               /home/rosetta/archive/rosetta3/dutch/neededinmrules.pf;
	touch $(language)/target/mrules116.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules116
 
 
  
#!!  
#!! idiom file 117, treated somewhat differently, see above   
#!!  
  
/home/rosetta/archive/rosetta3/dutch/commrules117.pf : /home/rosetta/archive/rosetta3/dutch/mrules117.mrule  \
                               /home/rosetta/archive/rosetta3/dutch/neededinmrules.pf;
	@/home/rosetta/archive/rosetta3/actions/mru $(language) mrules117
 
 
  
/home/rosetta/archive/rosetta3/dutch/commrules117.o  \
/home/rosetta/archive/rosetta3/dutch/decommrules117.o  \
/home/rosetta/archive/rosetta3/dutch/decommrules117.pf : /home/rosetta/archive/rosetta3/dutch/mrules117.out ;
 
/home/rosetta/archive/rosetta3/dutch/mrules117.out : /home/rosetta/archive/rosetta3/dutch/mrules117.mrule  \
                               /home/rosetta/archive/rosetta3/dutch/neededinmrules.pf;
	touch $(language)/target/mrules117.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules117
 
 
  
/home/rosetta/archive/rosetta3/dutch/commrules118.o  \
/home/rosetta/archive/rosetta3/dutch/decommrules118.o  \
/home/rosetta/archive/rosetta3/dutch/commrules118.pf  \
/home/rosetta/archive/rosetta3/dutch/decommrules118.pf : /home/rosetta/archive/rosetta3/dutch/mrules118.out ;
 
/home/rosetta/archive/rosetta3/dutch/mrules118.out : /home/rosetta/archive/rosetta3/dutch/mrules118.mrule  \
                               /home/rosetta/archive/rosetta3/dutch/neededinmrules.pf;
	touch $(language)/target/mrules118.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules118
 
 
  
/home/rosetta/archive/rosetta3/dutch/commrules119.o  \
/home/rosetta/archive/rosetta3/dutch/decommrules119.o  \
/home/rosetta/archive/rosetta3/dutch/commrules119.pf  \
/home/rosetta/archive/rosetta3/dutch/decommrules119.pf : /home/rosetta/archive/rosetta3/dutch/mrules119.out ;
 
/home/rosetta/archive/rosetta3/dutch/mrules119.out : /home/rosetta/archive/rosetta3/dutch/mrules119.mrule  \
                               /home/rosetta/archive/rosetta3/dutch/neededinmrules.pf;
	touch $(language)/target/mrules119.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules119
 
 
  
/home/rosetta/archive/rosetta3/dutch/commrules120.o  \
/home/rosetta/archive/rosetta3/dutch/decommrules120.o  \
/home/rosetta/archive/rosetta3/dutch/commrules120.pf  \
/home/rosetta/archive/rosetta3/dutch/decommrules120.pf : /home/rosetta/archive/rosetta3/dutch/mrules120.out ;
 
/home/rosetta/archive/rosetta3/dutch/mrules120.out : /home/rosetta/archive/rosetta3/dutch/mrules120.mrule  \
                               /home/rosetta/archive/rosetta3/dutch/neededinmrules.pf;
	touch $(language)/target/mrules120.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules120
 
 
  
/home/rosetta/archive/rosetta3/dutch/commrules121.o  \
/home/rosetta/archive/rosetta3/dutch/decommrules121.o  \
/home/rosetta/archive/rosetta3/dutch/commrules121.pf  \
/home/rosetta/archive/rosetta3/dutch/decommrules121.pf : /home/rosetta/archive/rosetta3/dutch/mrules121.out ;
 
/home/rosetta/archive/rosetta3/dutch/mrules121.out : /home/rosetta/archive/rosetta3/dutch/mrules121.mrule  \
                               /home/rosetta/archive/rosetta3/dutch/neededinmrules.pf;
	touch $(language)/target/mrules121.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules121
 
 
  
/home/rosetta/archive/rosetta3/dutch/commrules122.o  \
/home/rosetta/archive/rosetta3/dutch/decommrules122.o  \
/home/rosetta/archive/rosetta3/dutch/commrules122.pf  \
/home/rosetta/archive/rosetta3/dutch/decommrules122.pf : /home/rosetta/archive/rosetta3/dutch/mrules122.out ;
 
/home/rosetta/archive/rosetta3/dutch/mrules122.out : /home/rosetta/archive/rosetta3/dutch/mrules122.mrule  \
                               /home/rosetta/archive/rosetta3/dutch/neededinmrules.pf;
	touch $(language)/target/mrules122.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules122
 
 
  
/home/rosetta/archive/rosetta3/dutch/commrules123.o  \
/home/rosetta/archive/rosetta3/dutch/decommrules123.o  \
/home/rosetta/archive/rosetta3/dutch/commrules123.pf  \
/home/rosetta/archive/rosetta3/dutch/decommrules123.pf : /home/rosetta/archive/rosetta3/dutch/mrules123.out ;
 
/home/rosetta/archive/rosetta3/dutch/mrules123.out : /home/rosetta/archive/rosetta3/dutch/mrules123.mrule  \
                               /home/rosetta/archive/rosetta3/dutch/neededinmrules.pf;
	touch $(language)/target/mrules123.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules123
 
 
  
/home/rosetta/archive/rosetta3/dutch/commrules124.o  \
/home/rosetta/archive/rosetta3/dutch/decommrules124.o  \
/home/rosetta/archive/rosetta3/dutch/commrules124.pf  \
/home/rosetta/archive/rosetta3/dutch/decommrules124.pf : /home/rosetta/archive/rosetta3/dutch/mrules124.out ;
 
/home/rosetta/archive/rosetta3/dutch/mrules124.out : /home/rosetta/archive/rosetta3/dutch/mrules124.mrule  \
                               /home/rosetta/archive/rosetta3/dutch/neededinmrules.pf;
	touch $(language)/target/mrules124.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules124
 
 
  
  
/home/rosetta/archive/rosetta3/dutch/commrules125.o  \
/home/rosetta/archive/rosetta3/dutch/decommrules125.o  \
/home/rosetta/archive/rosetta3/dutch/commrules125.pf  \
/home/rosetta/archive/rosetta3/dutch/decommrules125.pf : /home/rosetta/archive/rosetta3/dutch/mrules125.out ;
 
/home/rosetta/archive/rosetta3/dutch/mrules125.out : /home/rosetta/archive/rosetta3/dutch/mrules125.mrule  \
                               /home/rosetta/archive/rosetta3/dutch/neededinmrules.pf;
	touch $(language)/target/mrules125.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules125
 
 
  
/home/rosetta/archive/rosetta3/dutch/commrules126.o  \
/home/rosetta/archive/rosetta3/dutch/decommrules126.o  \
/home/rosetta/archive/rosetta3/dutch/commrules126.pf  \
/home/rosetta/archive/rosetta3/dutch/decommrules126.pf : /home/rosetta/archive/rosetta3/dutch/mrules126.out ;
 
/home/rosetta/archive/rosetta3/dutch/mrules126.out : /home/rosetta/archive/rosetta3/dutch/mrules126.mrule  \
                               /home/rosetta/archive/rosetta3/dutch/neededinmrules.pf;
	touch $(language)/target/mrules126.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules126
 
 
  
/home/rosetta/archive/rosetta3/dutch/commrules127.o  \
/home/rosetta/archive/rosetta3/dutch/decommrules127.o  \
/home/rosetta/archive/rosetta3/dutch/commrules127.pf  \
/home/rosetta/archive/rosetta3/dutch/decommrules127.pf : /home/rosetta/archive/rosetta3/dutch/mrules127.out ;
 
/home/rosetta/archive/rosetta3/dutch/mrules127.out : /home/rosetta/archive/rosetta3/dutch/mrules127.mrule  \
                               /home/rosetta/archive/rosetta3/dutch/neededinmrules.pf;
	touch $(language)/target/mrules127.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules127
 
 
  
/home/rosetta/archive/rosetta3/dutch/commrules128.o  \
/home/rosetta/archive/rosetta3/dutch/decommrules128.o  \
/home/rosetta/archive/rosetta3/dutch/commrules128.pf  \
/home/rosetta/archive/rosetta3/dutch/decommrules128.pf : /home/rosetta/archive/rosetta3/dutch/mrules128.out ;
 
/home/rosetta/archive/rosetta3/dutch/mrules128.out : /home/rosetta/archive/rosetta3/dutch/mrules128.mrule  \
                               /home/rosetta/archive/rosetta3/dutch/neededinmrules.pf;
	touch $(language)/target/mrules128.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules128
 
 
  
/home/rosetta/archive/rosetta3/dutch/commrules129.o  \
/home/rosetta/archive/rosetta3/dutch/decommrules129.o  \
/home/rosetta/archive/rosetta3/dutch/commrules129.pf  \
/home/rosetta/archive/rosetta3/dutch/decommrules129.pf : /home/rosetta/archive/rosetta3/dutch/mrules129.out ;
 
/home/rosetta/archive/rosetta3/dutch/mrules129.out : /home/rosetta/archive/rosetta3/dutch/mrules129.mrule  \
                               /home/rosetta/archive/rosetta3/dutch/neededinmrules.pf;
	touch $(language)/target/mrules129.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules129
 
 
  
/home/rosetta/archive/rosetta3/dutch/commrules130.o  \
/home/rosetta/archive/rosetta3/dutch/decommrules130.o  \
/home/rosetta/archive/rosetta3/dutch/commrules130.pf  \
/home/rosetta/archive/rosetta3/dutch/decommrules130.pf : /home/rosetta/archive/rosetta3/dutch/mrules130.out ;
 
/home/rosetta/archive/rosetta3/dutch/mrules130.out : /home/rosetta/archive/rosetta3/dutch/mrules130.mrule  \
                               /home/rosetta/archive/rosetta3/dutch/neededinmrules.pf;
	touch $(language)/target/mrules130.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules130
 
 
  
/home/rosetta/archive/rosetta3/dutch/commrules131.o  \
/home/rosetta/archive/rosetta3/dutch/decommrules131.o  \
/home/rosetta/archive/rosetta3/dutch/commrules131.pf  \
/home/rosetta/archive/rosetta3/dutch/decommrules131.pf : /home/rosetta/archive/rosetta3/dutch/mrules131.out ;
 
/home/rosetta/archive/rosetta3/dutch/mrules131.out : /home/rosetta/archive/rosetta3/dutch/mrules131.mrule  \
                               /home/rosetta/archive/rosetta3/dutch/neededinmrules.pf;
	touch $(language)/target/mrules131.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules131
 
 
  
/home/rosetta/archive/rosetta3/dutch/commrules132.o  \
/home/rosetta/archive/rosetta3/dutch/decommrules132.o  \
/home/rosetta/archive/rosetta3/dutch/commrules132.pf  \
/home/rosetta/archive/rosetta3/dutch/decommrules132.pf : /home/rosetta/archive/rosetta3/dutch/mrules132.out ;
 
/home/rosetta/archive/rosetta3/dutch/mrules132.out : /home/rosetta/archive/rosetta3/dutch/mrules132.mrule  \
                               /home/rosetta/archive/rosetta3/dutch/neededinmrules.pf;
	touch $(language)/target/mrules132.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules132
 
 
  
/home/rosetta/archive/rosetta3/dutch/commrules133.o  \
/home/rosetta/archive/rosetta3/dutch/decommrules133.o  \
/home/rosetta/archive/rosetta3/dutch/commrules133.pf  \
/home/rosetta/archive/rosetta3/dutch/decommrules133.pf : /home/rosetta/archive/rosetta3/dutch/mrules133.out ;
 
/home/rosetta/archive/rosetta3/dutch/mrules133.out : /home/rosetta/archive/rosetta3/dutch/mrules133.mrule  \
                               /home/rosetta/archive/rosetta3/dutch/neededinmrules.pf;
	touch $(language)/target/mrules133.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules133
 
 
  
/home/rosetta/archive/rosetta3/dutch/commrules134.o  \
/home/rosetta/archive/rosetta3/dutch/decommrules134.o  \
/home/rosetta/archive/rosetta3/dutch/commrules134.pf  \
/home/rosetta/archive/rosetta3/dutch/decommrules134.pf : /home/rosetta/archive/rosetta3/dutch/mrules134.out ;
 
/home/rosetta/archive/rosetta3/dutch/mrules134.out : /home/rosetta/archive/rosetta3/dutch/mrules134.mrule  \
                               /home/rosetta/archive/rosetta3/dutch/neededinmrules.pf;
	touch $(language)/target/mrules134.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules134
 
 
  
  
/home/rosetta/archive/rosetta3/dutch/commrules135.o  \
/home/rosetta/archive/rosetta3/dutch/decommrules135.o  \
/home/rosetta/archive/rosetta3/dutch/commrules135.pf  \
/home/rosetta/archive/rosetta3/dutch/decommrules135.pf : /home/rosetta/archive/rosetta3/dutch/mrules135.out ;
 
/home/rosetta/archive/rosetta3/dutch/mrules135.out : /home/rosetta/archive/rosetta3/dutch/mrules135.mrule  \
                               /home/rosetta/archive/rosetta3/dutch/neededinmrules.pf;
	touch $(language)/target/mrules135.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules135
 
 
  
/home/rosetta/archive/rosetta3/dutch/commrules136.o  \
/home/rosetta/archive/rosetta3/dutch/decommrules136.o  \
/home/rosetta/archive/rosetta3/dutch/commrules136.pf  \
/home/rosetta/archive/rosetta3/dutch/decommrules136.pf : /home/rosetta/archive/rosetta3/dutch/mrules136.out ;
 
/home/rosetta/archive/rosetta3/dutch/mrules136.out : /home/rosetta/archive/rosetta3/dutch/mrules136.mrule  \
                               /home/rosetta/archive/rosetta3/dutch/neededinmrules.pf;
	touch $(language)/target/mrules136.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules136
 
 
  
/home/rosetta/archive/rosetta3/dutch/commrules137.o  \
/home/rosetta/archive/rosetta3/dutch/decommrules137.o  \
/home/rosetta/archive/rosetta3/dutch/commrules137.pf  \
/home/rosetta/archive/rosetta3/dutch/decommrules137.pf : /home/rosetta/archive/rosetta3/dutch/mrules137.out ;
 
/home/rosetta/archive/rosetta3/dutch/mrules137.out : /home/rosetta/archive/rosetta3/dutch/mrules137.mrule  \
                               /home/rosetta/archive/rosetta3/dutch/neededinmrules.pf;
	touch $(language)/target/mrules137.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules137
 
 
  
/home/rosetta/archive/rosetta3/dutch/commrules138.o  \
/home/rosetta/archive/rosetta3/dutch/decommrules138.o  \
/home/rosetta/archive/rosetta3/dutch/commrules138.pf  \
/home/rosetta/archive/rosetta3/dutch/decommrules138.pf : /home/rosetta/archive/rosetta3/dutch/mrules138.out ;
 
/home/rosetta/archive/rosetta3/dutch/mrules138.out : /home/rosetta/archive/rosetta3/dutch/mrules138.mrule  \
                               /home/rosetta/archive/rosetta3/dutch/neededinmrules.pf;
	touch $(language)/target/mrules138.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules138
 
 
  
/home/rosetta/archive/rosetta3/dutch/commrules139.o  \
/home/rosetta/archive/rosetta3/dutch/decommrules139.o  \
/home/rosetta/archive/rosetta3/dutch/commrules139.pf  \
/home/rosetta/archive/rosetta3/dutch/decommrules139.pf : /home/rosetta/archive/rosetta3/dutch/mrules139.out ;
 
/home/rosetta/archive/rosetta3/dutch/mrules139.out : /home/rosetta/archive/rosetta3/dutch/mrules139.mrule  \
                               /home/rosetta/archive/rosetta3/dutch/neededinmrules.pf;
	touch $(language)/target/mrules139.out
	@/home/rosetta/archive/rosetta3/actions/mruall $(language) mrules139
 
 
  
/home/rosetta/archive/rosetta3/dutch/commrules140.o  \
/home/rosetta/archive/rosetta3/dutch/decommrules140.o  \
/home/rosetta/archive/rosetta3/dutch/commrules140.pf  \
/home/rosetta/archive/rosetta3/dutch/decommrules140.pf : /home/rosetta/archive/rosetta3/dutch/mrules140.out ;
 
/home/rosetta/archive/rosetta3/dutch/mrules140.out : /home/rosetta/archive/rosetta3/dutch/mrules140.mrule  \
                               /home/rosetta/archive/rosetta3/dutch/neededinmrules.pf;
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
  
/home/rosetta/archive/rosetta3/dutch/neededinmrules.pf : /home/rosetta/archive/rosetta3/dutch/maket.pf  \
                            /home/rosetta/archive/rosetta3/dutch/copyt.pf  \
                            /home/rosetta/archive/rosetta3/dutch/lsauxdom.pf  \
                            /home/rosetta/archive/rosetta3/dutch/lsmruquo.pf  \
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
  
/home/rosetta/archive/rosetta3/dutch/gsuffix.svo \
/home/rosetta/archive/rosetta3/dutch/gsuffix.svs \
/home/rosetta/archive/rosetta3/dutch/gsuffix.sco \
/home/rosetta/archive/rosetta3/dutch/gsuffix.sso \
/home/rosetta/archive/rosetta3/dutch/gsuffix.sro \
/home/rosetta/archive/rosetta3/dutch/asuffix.svs \
/home/rosetta/archive/rosetta3/dutch/asuffix.svo \
/home/rosetta/archive/rosetta3/dutch/asuffix.sco \
/home/rosetta/archive/rosetta3/dutch/asuffix.sso \
/home/rosetta/archive/rosetta3/dutch/asuffix.sro : /home/rosetta/archive/rosetta3/dutch/suffix.seg \
                          /home/rosetta/archive/rosetta3/dutch/asegcom.exe \
                          /home/rosetta/archive/rosetta3/dutch/gsegcom.exe;
	@/home/rosetta/archive/rosetta3/actions/seg $(language) suffix
  
/home/rosetta/archive/rosetta3/dutch/gprefix.svo \
/home/rosetta/archive/rosetta3/dutch/gprefix.svs \
/home/rosetta/archive/rosetta3/dutch/gprefix.sco \
/home/rosetta/archive/rosetta3/dutch/gprefix.sso \
/home/rosetta/archive/rosetta3/dutch/gprefix.sro \
/home/rosetta/archive/rosetta3/dutch/aprefix.svs \
/home/rosetta/archive/rosetta3/dutch/aprefix.svo \
/home/rosetta/archive/rosetta3/dutch/aprefix.sco \
/home/rosetta/archive/rosetta3/dutch/aprefix.sso \
/home/rosetta/archive/rosetta3/dutch/aprefix.sro : /home/rosetta/archive/rosetta3/dutch/prefix.seg \
                          /home/rosetta/archive/rosetta3/dutch/asegcom.exe \
                          /home/rosetta/archive/rosetta3/dutch/gsegcom.exe;
	@/home/rosetta/archive/rosetta3/actions/seg $(language) prefix
  
/home/rosetta/archive/rosetta3/dutch/glglue.svo \
/home/rosetta/archive/rosetta3/dutch/glglue.svs \
/home/rosetta/archive/rosetta3/dutch/glglue.sco \
/home/rosetta/archive/rosetta3/dutch/glglue.sso \
/home/rosetta/archive/rosetta3/dutch/glglue.sro \
/home/rosetta/archive/rosetta3/dutch/alglue.svo \
/home/rosetta/archive/rosetta3/dutch/alglue.svs \
/home/rosetta/archive/rosetta3/dutch/alglue.sco \
/home/rosetta/archive/rosetta3/dutch/alglue.sso \
/home/rosetta/archive/rosetta3/dutch/alglue.sro : /home/rosetta/archive/rosetta3/dutch/lglue.seg \
                          /home/rosetta/archive/rosetta3/dutch/asegcom.exe \
                          /home/rosetta/archive/rosetta3/dutch/gsegcom.exe;
	@/home/rosetta/archive/rosetta3/actions/seg $(language) lglue
  
/home/rosetta/archive/rosetta3/dutch/grglue.svo \
/home/rosetta/archive/rosetta3/dutch/grglue.svs \
/home/rosetta/archive/rosetta3/dutch/grglue.sco \
/home/rosetta/archive/rosetta3/dutch/grglue.sso \
/home/rosetta/archive/rosetta3/dutch/grglue.sro \
/home/rosetta/archive/rosetta3/dutch/arglue.svo \
/home/rosetta/archive/rosetta3/dutch/arglue.svs \
/home/rosetta/archive/rosetta3/dutch/arglue.sco \
/home/rosetta/archive/rosetta3/dutch/arglue.sso \
/home/rosetta/archive/rosetta3/dutch/arglue.sro : /home/rosetta/archive/rosetta3/dutch/rglue.seg \
                          /home/rosetta/archive/rosetta3/dutch/asegcom.exe \
                          /home/rosetta/archive/rosetta3/dutch/gsegcom.exe;
	@/home/rosetta/archive/rosetta3/actions/seg $(language) rglue
  
/home/rosetta/archive/rosetta3/dutch/gmglue.svo \
/home/rosetta/archive/rosetta3/dutch/gmglue.svs \
/home/rosetta/archive/rosetta3/dutch/gmglue.sco \
/home/rosetta/archive/rosetta3/dutch/gmglue.sso \
/home/rosetta/archive/rosetta3/dutch/gmglue.sro \
/home/rosetta/archive/rosetta3/dutch/amglue.svo \
/home/rosetta/archive/rosetta3/dutch/amglue.svs \
/home/rosetta/archive/rosetta3/dutch/amglue.sco \
/home/rosetta/archive/rosetta3/dutch/amglue.sso \
/home/rosetta/archive/rosetta3/dutch/amglue.sro : /home/rosetta/archive/rosetta3/dutch/mglue.seg \
                          /home/rosetta/archive/rosetta3/dutch/asegcom.exe \
                          /home/rosetta/archive/rosetta3/dutch/gsegcom.exe;
	@/home/rosetta/archive/rosetta3/actions/seg $(language) mglue
  
/home/rosetta/archive/rosetta3/dutch/ldprims.p : /home/rosetta/archive/rosetta3/dutch/surout ;
 
/home/rosetta/archive/rosetta3/dutch/surfrules.p : /home/rosetta/archive/rosetta3/dutch/surout ;
 
/home/rosetta/archive/rosetta3/dutch/surfrulesblocks.pf : /home/rosetta/archive/rosetta3/dutch/surout ;
 
/home/rosetta/archive/rosetta3/dutch/surfrulesblocks.p : /home/rosetta/archive/rosetta3/dutch/surout ;
 
/home/rosetta/archive/rosetta3/dutch/lsrulepars.pf : /home/rosetta/archive/rosetta3/dutch/surout ;
 
/home/rosetta/archive/rosetta3/dutch/ldsurfswitch.p : /home/rosetta/archive/rosetta3/dutch/surout ;
 
/home/rosetta/archive/rosetta3/dutch/surfrulesgraphs.p : /home/rosetta/archive/rosetta3/dutch/surout ;
 
 
/home/rosetta/archive/rosetta3/dutch/surout : /home/rosetta/archive/rosetta3/dutch/surfrules1.sur  \
                                  /home/rosetta/archive/rosetta3/dutch/surfrules2.sur  \
                                  /home/rosetta/archive/rosetta3/dutch/surfrules3.sur  \
                                  /home/rosetta/archive/rosetta3/dutch/surfrules4.sur  \
                                  /home/rosetta/archive/rosetta3/general/surfrulesblocks.pf  \
                                  /home/rosetta/archive/rosetta3/dutch/surcom.exe  \
                                  /home/rosetta/archive/rosetta3/dutch/surfcom.exe  \
                                  /home/rosetta/archive/rosetta3/dutch/surflink.exe ;
	touch $(language)/target/surout
	@/home/rosetta/archive/rosetta3/actions/sur $(language) surfrules
	@/home/rosetta/archive/rosetta3/actions/surf $(language) surfrules1
	@/home/rosetta/archive/rosetta3/actions/surf $(language) surfrules2
	@/home/rosetta/archive/rosetta3/actions/surf $(language) surfrules3
	@/home/rosetta/archive/rosetta3/actions/surf $(language) surfrules4
	@/home/rosetta/archive/rosetta3/actions/slk $(language)
  
/home/rosetta/archive/rosetta3/dutch/ldanilrules.p : /home/rosetta/archive/rosetta3/dutch/traout ;
 
/home/rosetta/archive/rosetta3/dutch/ldgenilrules.p : /home/rosetta/archive/rosetta3/dutch/traout ;
 
/home/rosetta/archive/rosetta3/dutch/traout : /home/rosetta/archive/rosetta3/dutch/transferrules.trans  \
                               /home/rosetta/archive/rosetta3/dutch/tracom.exe;
	touch $(language)/target/traout
	@/home/rosetta/archive/rosetta3/actions/tra $(language) transferrules
  
/home/rosetta/archive/rosetta3/tools/neededforcompiler.pf : /home/rosetta/archive/rosetta3/tools/tstring.o \
                              /home/rosetta/archive/rosetta3/tools/tfiles.o \
                              /home/rosetta/archive/rosetta3/general/strtokey.o \
                              /home/rosetta/archive/rosetta3/general/mem.o \
                              /home/rosetta/archive/rosetta3/tools/mrudomcom.exe \
                              /home/rosetta/archive/rosetta3/tools/gencomp.exe ;
	@echo "empty" > tools/target/neededforcompiler.pf
 
/home/rosetta/archive/rosetta3/dutch/neededforcompiler.pf : /home/rosetta/archive/rosetta3/tools/neededforcompiler.pf \
                              /home/rosetta/archive/rosetta3/general/ldmrules.pf \
                              /home/rosetta/archive/rosetta3/general/lidomaint.pf \
                              /home/rosetta/archive/rosetta3/tools/tldstrtostr.o \
                              /home/rosetta/archive/rosetta3/tools/tldconvrec.o \
                              /home/rosetta/archive/rosetta3/dutch/ldcatsets.o \
                              /home/rosetta/archive/rosetta3/dutch/ldstrtotype.o \
                              /home/rosetta/archive/rosetta3/dutch/ldtypetostr.o ;
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
  
 
dutch/target/lsconstraints.p : /home/rosetta/archive/rosetta3/dutch/constraints.constr \
                                tools/target/constraintgen.exe;
	@/home/rosetta/archive/rosetta3/actions/constraint $(language) constraints
  
