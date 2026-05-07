 
$(language)/ldsucc.p : $(language)/morphexpr.afxpr \
                         tools/afxpr.exe;
	@actions/afxpr $(language) morphexpr
 
$(language)/lsauxdom.pf : $(language)/auxdomout ;

$(language)/lsauxdom.p : $(language)/auxdomout ;

$(language)/ldsubsttovar.p : $(language)/auxdomout ;

$(language)/auxdomout : $(language)/lsauxdomain.auxdom  \
                               $(language)/auxcom.exe;
	touch $(language)/target/auxdomout
	@actions/auxdom $(language) lsauxdomain
 
$(language)/lstypetostr.p : $(language)/domout ;

$(language)/lstypetostr.pf : $(language)/domout ;

$(language)/lsstrtotype.p : $(language)/domout ;

$(language)/lsstrtotype.pf : $(language)/domout ;

$(language)/lsconvrec.p : $(language)/domout ;

$(language)/lsconvrec.pf : $(language)/domout ;

$(language)/lsconvattr.p : $(language)/domout ;

$(language)/lsconvattr.pf : $(language)/domout ;

$(language)/ldconvrec.p : $(language)/domout ;

$(language)/lsdomaint.pf : $(language)/domout ;

$(language)/maket.pf : $(language)/domout ;

$(language)/maket.p : $(language)/domout ;

$(language)/copyt.pf : $(language)/domout ;

$(language)/copyt.p : $(language)/domout ;

$(language)/ldstrtotype.p : $(language)/domout ;

$(language)/ldtypetostr.p : $(language)/domout ;

$(language)/ldstrtostr.p : $(language)/domout ;

$(language)/ldcatsets.p : $(language)/domout ;

$(language)/ldequal.p : $(language)/domout ;

$(language)/ldgetkey.p : $(language)/domout ;

$(language)/lsmorfdef.pf : $(language)/domout ;

$(language)/domout : $(language)/lsdomaint.dom \
                           tools/domcom.exe;
	touch $(language)/target/domout
	@actions/dom $(language) lsdomaint

interlingua/liilrules.pf : interlingua/ilaout ;

interlingua/liilrules.p : interlingua/ilaout ;

interlingua/ilaout : interlingua/ildefinition.ilan  \
                            tools/ilacom.exe;
	touch interlingua/target/ilaout
	@actions/ila interlingua ildefinition
 
 
#!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!lexicons 
 
 
$(language)/blex.dat : $(language)/blex.dict \
                       $(language)/genblexisf.exe;
	@actions/genblexdata $(language)
 
$(language)/iddict.dat : $(language)/iddict.dict \
                         $(language)/geniddictdata.exe;
	@actions/geniddictdata $(language)
 
$(language)/ildict.dat : $(language)/ildict.dict \
                         tools/genildictdata.exe;
	@actions/genildictdata $(language)
 
$(language)/mdict.dat : $(language)/mdict.dict \
                         $(language)/genmdictdata.exe;
	@actions/genmdictdata $(language)
 
$(language)/sdict.dat : $(language)/sdict.dict \
                         tools/gensdictdata.exe;
	@actions/gensdictdata $(language)
 
$(language)/siddict.dat : $(language)/siddict.dict \
                         tools/gensiddictdata.exe;
	@actions/gensiddictdata $(language)
 
$(language)/fixid.dat : $(language)/fixid.fixid \
                        tools/fixidgen.exe;
	@actions/genfixiddata $(language)
 
 
 
#!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!keydefinitions 
 
interlingua/bmkeydef.dat : interlingua/bmkeydef.kdf \
                           tools/strmkey.exe;
	@actions/mkdf interlingua bmkeydef
 
 
$(language)/bskeydef.dat : $(language)/bskeydef.kdf \
                           tools/strkey.exe;
	@actions/kdf $(language) bskeydef
 
 
#!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
 
$(language)/comlexrules1.p : $(language)/lex1out ;

$(language)/comlexrules1.pf : $(language)/lex1out ;

$(language)/decomlexrules1.p : $(language)/lex1out ;

$(language)/decomlexrules1.pf : $(language)/lex1out ;
 
$(language)/lex1out : $(language)/lexrules1.lex  \
                                 $(language)/lexcom.exe;
	touch $(language)/target/lex1out
	@actions/lex $(language) lexrules1
 

$(language)/comlexrules2.p : $(language)/lex2out ;

$(language)/comlexrules2.pf : $(language)/lex2out ;

$(language)/decomlexrules2.p : $(language)/lex2out ;

$(language)/decomlexrules2.pf : $(language)/lex2out ;
 
$(language)/lex2out : $(language)/lexrules2.lex  \
                                 $(language)/lexcom.exe;
	touch $(language)/target/lex2out
	@actions/lex $(language) lexrules2

$(language)/comlexrules3.p : $(language)/lex3out ;

$(language)/comlexrules3.pf : $(language)/lex3out ;

$(language)/decomlexrules3.p : $(language)/lex3out ;

$(language)/decomlexrules3.pf : $(language)/lex3out ;
 
$(language)/lex3out : $(language)/lexrules3.lex  \
                                 $(language)/lexcom.exe;
	touch $(language)/target/lex3out
	@actions/lex $(language) lexrules3
 
 
$(language)/anlexif.p : $(language)/llkout ;

$(language)/genlexif.p : $(language)/llkout ;

$(language)/llkout : $(language)/comlexrules1.pf  \
                            $(language)/comlexrules2.pf  \
                            $(language)/comlexrules3.pf  \
                            $(language)/lexlink.exe;
	touch $(language)/target/llkout
	@actions/llk $(language)
 
$(language)/lsparams.pf : $(language)/mlkout ;

$(language)/ldmrules.p : $(language)/mlkout ;

$(language)/ldsubgrammars.p : $(language)/mlkout ;

$(language)/helpsubgrammars.pf : $(language)/mlkout ;

$(language)/helpsubgrammars.p : $(language)/mlkout ;

$(language)/ldanmrules.p : $(language)/mlkout ;

$(language)/ldgenmrules.p : $(language)/mlkout ;


$(language)/mlkout : $(language)/commrules1.pf \
           $(language)/commrules10.pf \
           $(language)/commrules100.pf \
           $(language)/commrules101.pf \
           $(language)/commrules102.pf \
           $(language)/commrules103.pf \
           $(language)/commrules104.pf \
           $(language)/commrules105.pf \
           $(language)/commrules106.pf \
           $(language)/commrules107.pf \
           $(language)/commrules108.pf \
           $(language)/commrules109.pf \
           $(language)/commrules11.pf \
           $(language)/commrules110.pf \
           $(language)/commrules111.pf \
           $(language)/commrules112.pf \
           $(language)/commrules113.pf \
           $(language)/commrules114.pf \
           $(language)/commrules115.pf \
           $(language)/commrules116.pf \
           $(language)/commrules117.pf \
           $(language)/commrules118.pf \
           $(language)/commrules119.pf \
           $(language)/commrules12.pf \
           $(language)/commrules120.pf \
           $(language)/commrules121.pf \
           $(language)/commrules122.pf \
           $(language)/commrules123.pf \
           $(language)/commrules124.pf \
           $(language)/commrules125.pf \
           $(language)/commrules126.pf \
           $(language)/commrules127.pf \
           $(language)/commrules128.pf \
           $(language)/commrules129.pf \
           $(language)/commrules13.pf \
           $(language)/commrules130.pf \
           $(language)/commrules131.pf \
           $(language)/commrules132.pf \
           $(language)/commrules133.pf \
           $(language)/commrules134.pf \
           $(language)/commrules135.pf \
           $(language)/commrules136.pf \
           $(language)/commrules137.pf \
           $(language)/commrules138.pf \
           $(language)/commrules139.pf \
           $(language)/commrules14.pf \
           $(language)/commrules140.pf \
           $(language)/commrules15.pf \
           $(language)/commrules16.pf \
           $(language)/commrules17.pf \
           $(language)/commrules18.pf \
           $(language)/commrules19.pf \
           $(language)/commrules2.pf \
           $(language)/commrules20.pf \
           $(language)/commrules21.pf \
           $(language)/commrules22.pf \
           $(language)/commrules23.pf \
           $(language)/commrules24.pf \
           $(language)/commrules25.pf \
           $(language)/commrules26.pf \
           $(language)/commrules27.pf \
           $(language)/commrules28.pf \
           $(language)/commrules29.pf \
           $(language)/commrules3.pf \
           $(language)/commrules30.pf \
           $(language)/commrules31.pf \
           $(language)/commrules32.pf \
           $(language)/commrules33.pf \
           $(language)/commrules34.pf \
           $(language)/commrules35.pf \
           $(language)/commrules36.pf \
           $(language)/commrules37.pf \
           $(language)/commrules38.pf \
           $(language)/commrules39.pf \
           $(language)/commrules4.pf \
           $(language)/commrules40.pf \
           $(language)/commrules41.pf \
           $(language)/commrules42.pf \
           $(language)/commrules43.pf \
           $(language)/commrules44.pf \
           $(language)/commrules45.pf \
           $(language)/commrules46.pf \
           $(language)/commrules47.pf \
           $(language)/commrules48.pf \
           $(language)/commrules49.pf \
           $(language)/commrules5.pf \
           $(language)/commrules50.pf \
           $(language)/commrules51.pf \
           $(language)/commrules52.pf \
           $(language)/commrules53.pf \
           $(language)/commrules54.pf \
           $(language)/commrules55.pf \
           $(language)/commrules56.pf \
           $(language)/commrules57.pf \
           $(language)/commrules58.pf \
           $(language)/commrules59.pf \
           $(language)/commrules6.pf \
           $(language)/commrules60.pf \
           $(language)/commrules61.pf \
           $(language)/commrules62.pf \
           $(language)/commrules63.pf \
           $(language)/commrules64.pf \
           $(language)/commrules65.pf \
           $(language)/commrules66.pf \
           $(language)/commrules67.pf \
           $(language)/commrules68.pf \
           $(language)/commrules69.pf \
           $(language)/commrules7.pf \
           $(language)/commrules70.pf \
           $(language)/commrules71.pf \
           $(language)/commrules72.pf \
           $(language)/commrules73.pf \
           $(language)/commrules74.pf \
           $(language)/commrules75.pf \
           $(language)/commrules76.pf \
           $(language)/commrules77.pf \
           $(language)/commrules78.pf \
           $(language)/commrules79.pf \
           $(language)/commrules8.pf \
           $(language)/commrules80.pf \
           $(language)/commrules81.pf \
           $(language)/commrules82.pf \
           $(language)/commrules83.pf \
           $(language)/commrules84.pf \
           $(language)/commrules85.pf \
           $(language)/commrules86.pf \
           $(language)/commrules87.pf \
           $(language)/commrules88.pf \
           $(language)/commrules89.pf \
           $(language)/commrules9.pf \
           $(language)/commrules90.pf \
           $(language)/commrules91.pf \
           $(language)/commrules92.pf \
           $(language)/commrules93.pf \
           $(language)/commrules94.pf \
           $(language)/commrules95.pf \
           $(language)/commrules96.pf \
           $(language)/commrules97.pf \
           $(language)/commrules98.pf \
           $(language)/commrules99.pf \
                            $(language)/mrulelink.exe;
	touch $(language)/target/mlkout
	@actions/mlk $(language)
	@actions/pas $(language) ldmrules
	@actions/gen $(language) mrucom
	@actions/idioms $(language) mrules107
	@actions/idioms $(language) mrules117
 
$(language)/commrules1.o  \
$(language)/decommrules1.o  \
$(language)/commrules1.pf  \
$(language)/decommrules1.pf : $(language)/mrules1.mrule  \
                               $(language)/neededinmrules.pf;
	@actions/mruall $(language) mrules1
 
$(language)/commrules2.o  \
$(language)/decommrules2.o  \
$(language)/commrules2.pf  \
$(language)/decommrules2.pf : $(language)/mrules2.mrule  \
                               $(language)/neededinmrules.pf;
	@actions/mruall $(language) mrules2
 
$(language)/commrules3.o  \
$(language)/decommrules3.o  \
$(language)/commrules3.pf  \
$(language)/decommrules3.pf : $(language)/mrules3.mrule  \
                               $(language)/neededinmrules.pf;
	@actions/mruall $(language) mrules3
 
$(language)/commrules4.o  \
$(language)/decommrules4.o  \
$(language)/commrules4.pf  \
$(language)/decommrules4.pf : $(language)/mrules4.mrule  \
                               $(language)/neededinmrules.pf;
	@actions/mruall $(language) mrules4
 
$(language)/commrules5.o  \
$(language)/decommrules5.o  \
$(language)/commrules5.pf  \
$(language)/decommrules5.pf : $(language)/mrules5.mrule  \
                               $(language)/neededinmrules.pf;
	@actions/mruall $(language) mrules5


 
$(language)/commrules6.o  \
$(language)/decommrules6.o  \
$(language)/commrules6.pf  \
$(language)/decommrules6.pf : $(language)/mrules6.mrule  \
                               $(language)/neededinmrules.pf;
	@actions/mruall $(language) mrules6


 
 
$(language)/commrules7.o  \
$(language)/decommrules7.o  \
$(language)/commrules7.pf  \
$(language)/decommrules7.pf : $(language)/mrules7.mrule  \
                               $(language)/neededinmrules.pf;
	@actions/mruall $(language) mrules7


 
$(language)/commrules8.o  \
$(language)/decommrules8.o  \
$(language)/commrules8.pf  \
$(language)/decommrules8.pf : $(language)/mrules8.mrule  \
                               $(language)/neededinmrules.pf;
	@actions/mruall $(language) mrules8


 
 
$(language)/commrules9.o  \
$(language)/decommrules9.o  \
$(language)/commrules9.pf  \
$(language)/decommrules9.pf : $(language)/mrules9.mrule  \
                               $(language)/neededinmrules.pf;
	@actions/mruall $(language) mrules9


 
$(language)/commrules10.o  \
$(language)/decommrules10.o  \
$(language)/commrules10.pf  \
$(language)/decommrules10.pf : $(language)/mrules10.mrule  \
                               $(language)/neededinmrules.pf;
	@actions/mruall $(language) mrules10


 
$(language)/commrules11.o  \
$(language)/decommrules11.o  \
$(language)/commrules11.pf  \
$(language)/decommrules11.pf : $(language)/mrules11.mrule  \
                               $(language)/neededinmrules.pf;
	@actions/mruall $(language) mrules11


 
$(language)/commrules12.o  \
$(language)/decommrules12.o  \
$(language)/commrules12.pf  \
$(language)/decommrules12.pf : $(language)/mrules12.mrule  \
                               $(language)/neededinmrules.pf;
	@actions/mruall $(language) mrules12


 
$(language)/commrules13.o  \
$(language)/decommrules13.o  \
$(language)/commrules13.pf  \
$(language)/decommrules13.pf : $(language)/mrules13.mrule  \
                               $(language)/neededinmrules.pf;
	@actions/mruall $(language) mrules13


 
$(language)/commrules14.o  \
$(language)/decommrules14.o  \
$(language)/commrules14.pf  \
$(language)/decommrules14.pf : $(language)/mrules14.mrule  \
                               $(language)/neededinmrules.pf;
	@actions/mruall $(language) mrules14


 
 
$(language)/commrules15.o  \
$(language)/decommrules15.o  \
$(language)/commrules15.pf  \
$(language)/decommrules15.pf : $(language)/mrules15.mrule  \
                               $(language)/neededinmrules.pf;
	@actions/mruall $(language) mrules15


 
$(language)/commrules16.o  \
$(language)/decommrules16.o  \
$(language)/commrules16.pf  \
$(language)/decommrules16.pf : $(language)/mrules16.mrule  \
                               $(language)/neededinmrules.pf;
	@actions/mruall $(language) mrules16


 
 
$(language)/commrules17.o  \
$(language)/decommrules17.o  \
$(language)/commrules17.pf  \
$(language)/decommrules17.pf : $(language)/mrules17.mrule  \
                               $(language)/neededinmrules.pf;
	@actions/mruall $(language) mrules17


 
$(language)/commrules18.o  \
$(language)/decommrules18.o  \
$(language)/commrules18.pf  \
$(language)/decommrules18.pf : $(language)/mrules18.mrule  \
                               $(language)/neededinmrules.pf;
	@actions/mruall $(language) mrules18


 
 
$(language)/commrules19.o  \
$(language)/decommrules19.o  \
$(language)/commrules19.pf  \
$(language)/decommrules19.pf : $(language)/mrules19.mrule  \
                               $(language)/neededinmrules.pf;
	@actions/mruall $(language) mrules19


 
$(language)/commrules20.o  \
$(language)/decommrules20.o  \
$(language)/commrules20.pf  \
$(language)/decommrules20.pf : $(language)/mrules20.mrule  \
                               $(language)/neededinmrules.pf;
	@actions/mruall $(language) mrules20


 
$(language)/commrules21.o  \
$(language)/decommrules21.o  \
$(language)/commrules21.pf  \
$(language)/decommrules21.pf : $(language)/mrules21.mrule  \
                               $(language)/neededinmrules.pf;
	@actions/mruall $(language) mrules21


 
$(language)/commrules22.o  \
$(language)/decommrules22.o  \
$(language)/commrules22.pf  \
$(language)/decommrules22.pf : $(language)/mrules22.mrule  \
                               $(language)/neededinmrules.pf;
	@actions/mruall $(language) mrules22


 
$(language)/commrules23.o  \
$(language)/decommrules23.o  \
$(language)/commrules23.pf  \
$(language)/decommrules23.pf : $(language)/mrules23.mrule  \
                               $(language)/neededinmrules.pf;
	@actions/mruall $(language) mrules23


 
$(language)/commrules24.o  \
$(language)/decommrules24.o  \
$(language)/commrules24.pf  \
$(language)/decommrules24.pf : $(language)/mrules24.mrule  \
                               $(language)/neededinmrules.pf;
	@actions/mruall $(language) mrules24


 
 
$(language)/commrules25.o  \
$(language)/decommrules25.o  \
$(language)/commrules25.pf  \
$(language)/decommrules25.pf : $(language)/mrules25.mrule  \
                               $(language)/neededinmrules.pf;
	@actions/mruall $(language) mrules25


 
$(language)/commrules26.o  \
$(language)/decommrules26.o  \
$(language)/commrules26.pf  \
$(language)/decommrules26.pf : $(language)/mrules26.mrule  \
                               $(language)/neededinmrules.pf;
	@actions/mruall $(language) mrules26


 
 
$(language)/commrules27.o  \
$(language)/decommrules27.o  \
$(language)/commrules27.pf  \
$(language)/decommrules27.pf : $(language)/mrules27.mrule  \
                               $(language)/neededinmrules.pf;
	@actions/mruall $(language) mrules27


 
$(language)/commrules28.o  \
$(language)/decommrules28.o  \
$(language)/commrules28.pf  \
$(language)/decommrules28.pf : $(language)/mrules28.mrule  \
                               $(language)/neededinmrules.pf;
	@actions/mruall $(language) mrules28


 
 
$(language)/commrules29.o  \
$(language)/decommrules29.o  \
$(language)/commrules29.pf  \
$(language)/decommrules29.pf : $(language)/mrules29.mrule  \
                               $(language)/neededinmrules.pf;
	@actions/mruall $(language) mrules29


 
$(language)/commrules30.o  \
$(language)/decommrules30.o  \
$(language)/commrules30.pf  \
$(language)/decommrules30.pf : $(language)/mrules30.mrule  \
                               $(language)/neededinmrules.pf;
	@actions/mruall $(language) mrules30


 
$(language)/commrules31.o  \
$(language)/decommrules31.o  \
$(language)/commrules31.pf  \
$(language)/decommrules31.pf : $(language)/mrules31.mrule  \
                               $(language)/neededinmrules.pf;
	@actions/mruall $(language) mrules31


 
$(language)/commrules32.o  \
$(language)/decommrules32.o  \
$(language)/commrules32.pf  \
$(language)/decommrules32.pf : $(language)/mrules32.mrule  \
                               $(language)/neededinmrules.pf;
	@actions/mruall $(language) mrules32


 
$(language)/commrules33.o  \
$(language)/decommrules33.o  \
$(language)/commrules33.pf  \
$(language)/decommrules33.pf : $(language)/mrules33.mrule  \
                               $(language)/neededinmrules.pf;
	@actions/mruall $(language) mrules33


 
$(language)/commrules34.o  \
$(language)/decommrules34.o  \
$(language)/commrules34.pf  \
$(language)/decommrules34.pf : $(language)/mrules34.mrule  \
                               $(language)/neededinmrules.pf;
	@actions/mruall $(language) mrules34


 
 
$(language)/commrules35.o  \
$(language)/decommrules35.o  \
$(language)/commrules35.pf  \
$(language)/decommrules35.pf : $(language)/mrules35.mrule  \
                               $(language)/neededinmrules.pf;
	@actions/mruall $(language) mrules35


 
$(language)/commrules36.o  \
$(language)/decommrules36.o  \
$(language)/commrules36.pf  \
$(language)/decommrules36.pf : $(language)/mrules36.mrule  \
                               $(language)/neededinmrules.pf;
	@actions/mruall $(language) mrules36


 
 
$(language)/commrules37.o  \
$(language)/decommrules37.o  \
$(language)/commrules37.pf  \
$(language)/decommrules37.pf : $(language)/mrules37.mrule  \
                               $(language)/neededinmrules.pf;
	@actions/mruall $(language) mrules37


 
$(language)/commrules38.o  \
$(language)/decommrules38.o  \
$(language)/commrules38.pf  \
$(language)/decommrules38.pf : $(language)/mrules38.mrule  \
                               $(language)/neededinmrules.pf;
	@actions/mruall $(language) mrules38


 
 
$(language)/commrules39.o  \
$(language)/decommrules39.o  \
$(language)/commrules39.pf  \
$(language)/decommrules39.pf : $(language)/mrules39.mrule  \
                               $(language)/neededinmrules.pf;
	@actions/mruall $(language) mrules39


 
$(language)/commrules40.o  \
$(language)/decommrules40.o  \
$(language)/commrules40.pf  \
$(language)/decommrules40.pf : $(language)/mrules40.mrule  \
                               $(language)/neededinmrules.pf;
	@actions/mruall $(language) mrules40


 
$(language)/commrules41.o  \
$(language)/decommrules41.o  \
$(language)/commrules41.pf  \
$(language)/decommrules41.pf : $(language)/mrules41.mrule  \
                               $(language)/neededinmrules.pf;
	@actions/mruall $(language) mrules41


 
$(language)/commrules42.o  \
$(language)/decommrules42.o  \
$(language)/commrules42.pf  \
$(language)/decommrules42.pf : $(language)/mrules42.mrule  \
                               $(language)/neededinmrules.pf;
	@actions/mruall $(language) mrules42


 
$(language)/commrules43.o  \
$(language)/decommrules43.o  \
$(language)/commrules43.pf  \
$(language)/decommrules43.pf : $(language)/mrules43.mrule  \
                               $(language)/neededinmrules.pf;
	@actions/mruall $(language) mrules43


 
$(language)/commrules44.o  \
$(language)/decommrules44.o  \
$(language)/commrules44.pf  \
$(language)/decommrules44.pf : $(language)/mrules44.mrule  \
                               $(language)/neededinmrules.pf;
	@actions/mruall $(language) mrules44


 
 
$(language)/commrules45.o  \
$(language)/decommrules45.o  \
$(language)/commrules45.pf  \
$(language)/decommrules45.pf : $(language)/mrules45.mrule  \
                               $(language)/neededinmrules.pf;
	@actions/mruall $(language) mrules45


 
$(language)/commrules46.o  \
$(language)/decommrules46.o  \
$(language)/commrules46.pf  \
$(language)/decommrules46.pf : $(language)/mrules46.mrule  \
                               $(language)/neededinmrules.pf;
	@actions/mruall $(language) mrules46


 
 
$(language)/commrules47.o  \
$(language)/decommrules47.o  \
$(language)/commrules47.pf  \
$(language)/decommrules47.pf : $(language)/mrules47.mrule  \
                               $(language)/neededinmrules.pf;
	@actions/mruall $(language) mrules47


 
$(language)/commrules48.o  \
$(language)/decommrules48.o  \
$(language)/commrules48.pf  \
$(language)/decommrules48.pf : $(language)/mrules48.mrule  \
                               $(language)/neededinmrules.pf;
	@actions/mruall $(language) mrules48


 
 
$(language)/commrules49.o  \
$(language)/decommrules49.o  \
$(language)/commrules49.pf  \
$(language)/decommrules49.pf : $(language)/mrules49.mrule  \
                               $(language)/neededinmrules.pf;
	@actions/mruall $(language) mrules49


 
$(language)/commrules50.o  \
$(language)/decommrules50.o  \
$(language)/commrules50.pf  \
$(language)/decommrules50.pf : $(language)/mrules50.mrule  \
                               $(language)/neededinmrules.pf;
	@actions/mruall $(language) mrules50


 
$(language)/commrules51.o  \
$(language)/decommrules51.o  \
$(language)/commrules51.pf  \
$(language)/decommrules51.pf : $(language)/mrules51.mrule  \
                               $(language)/neededinmrules.pf;
	@actions/mruall $(language) mrules51


 
$(language)/commrules52.o  \
$(language)/decommrules52.o  \
$(language)/commrules52.pf  \
$(language)/decommrules52.pf : $(language)/mrules52.mrule  \
                               $(language)/neededinmrules.pf;
	@actions/mruall $(language) mrules52


 
$(language)/commrules53.o  \
$(language)/decommrules53.o  \
$(language)/commrules53.pf  \
$(language)/decommrules53.pf : $(language)/mrules53.mrule  \
                               $(language)/neededinmrules.pf;
	@actions/mruall $(language) mrules53


 
$(language)/commrules54.o  \
$(language)/decommrules54.o  \
$(language)/commrules54.pf  \
$(language)/decommrules54.pf : $(language)/mrules54.mrule  \
                               $(language)/neededinmrules.pf;
	@actions/mruall $(language) mrules54


 
 
$(language)/commrules55.o  \
$(language)/decommrules55.o  \
$(language)/commrules55.pf  \
$(language)/decommrules55.pf : $(language)/mrules55.mrule  \
                               $(language)/neededinmrules.pf;
	@actions/mruall $(language) mrules55


 
$(language)/commrules56.o  \
$(language)/decommrules56.o  \
$(language)/commrules56.pf  \
$(language)/decommrules56.pf : $(language)/mrules56.mrule  \
                               $(language)/neededinmrules.pf;
	@actions/mruall $(language) mrules56


 
 
$(language)/commrules57.o  \
$(language)/decommrules57.o  \
$(language)/commrules57.pf  \
$(language)/decommrules57.pf : $(language)/mrules57.mrule  \
                               $(language)/neededinmrules.pf;
	@actions/mruall $(language) mrules57


 
$(language)/commrules58.o  \
$(language)/decommrules58.o  \
$(language)/commrules58.pf  \
$(language)/decommrules58.pf : $(language)/mrules58.mrule  \
                               $(language)/neededinmrules.pf;
	@actions/mruall $(language) mrules58


 
 
$(language)/commrules59.o  \
$(language)/decommrules59.o  \
$(language)/commrules59.pf  \
$(language)/decommrules59.pf : $(language)/mrules59.mrule  \
                               $(language)/neededinmrules.pf;
	@actions/mruall $(language) mrules59


 
$(language)/commrules60.o  \
$(language)/decommrules60.o  \
$(language)/commrules60.pf  \
$(language)/decommrules60.pf : $(language)/mrules60.mrule  \
                               $(language)/neededinmrules.pf;
	@actions/mruall $(language) mrules60


 
$(language)/commrules61.o  \
$(language)/decommrules61.o  \
$(language)/commrules61.pf  \
$(language)/decommrules61.pf : $(language)/mrules61.mrule  \
                               $(language)/neededinmrules.pf;
	@actions/mruall $(language) mrules61


 
$(language)/commrules62.o  \
$(language)/decommrules62.o  \
$(language)/commrules62.pf  \
$(language)/decommrules62.pf : $(language)/mrules62.mrule  \
                               $(language)/neededinmrules.pf;
	@actions/mruall $(language) mrules62


 
$(language)/commrules63.o  \
$(language)/decommrules63.o  \
$(language)/commrules63.pf  \
$(language)/decommrules63.pf : $(language)/mrules63.mrule  \
                               $(language)/neededinmrules.pf;
	@actions/mruall $(language) mrules63


 
$(language)/commrules64.o  \
$(language)/decommrules64.o  \
$(language)/commrules64.pf  \
$(language)/decommrules64.pf : $(language)/mrules64.mrule  \
                               $(language)/neededinmrules.pf;
	@actions/mruall $(language) mrules64


 
 
$(language)/commrules65.o  \
$(language)/decommrules65.o  \
$(language)/commrules65.pf  \
$(language)/decommrules65.pf : $(language)/mrules65.mrule  \
                               $(language)/neededinmrules.pf;
	@actions/mruall $(language) mrules65


 
$(language)/commrules66.o  \
$(language)/decommrules66.o  \
$(language)/commrules66.pf  \
$(language)/decommrules66.pf : $(language)/mrules66.mrule  \
                               $(language)/neededinmrules.pf;
	@actions/mruall $(language) mrules66


 
 
$(language)/commrules67.o  \
$(language)/decommrules67.o  \
$(language)/commrules67.pf  \
$(language)/decommrules67.pf : $(language)/mrules67.mrule  \
                               $(language)/neededinmrules.pf;
	@actions/mruall $(language) mrules67


 
$(language)/commrules68.o  \
$(language)/decommrules68.o  \
$(language)/commrules68.pf  \
$(language)/decommrules68.pf : $(language)/mrules68.mrule  \
                               $(language)/neededinmrules.pf;
	@actions/mruall $(language) mrules68


 
 
$(language)/commrules69.o  \
$(language)/decommrules69.o  \
$(language)/commrules69.pf  \
$(language)/decommrules69.pf : $(language)/mrules69.mrule  \
                               $(language)/neededinmrules.pf;
	@actions/mruall $(language) mrules69


 
$(language)/commrules70.o  \
$(language)/decommrules70.o  \
$(language)/commrules70.pf  \
$(language)/decommrules70.pf : $(language)/mrules70.mrule  \
                               $(language)/neededinmrules.pf;
	@actions/mruall $(language) mrules70


 
$(language)/commrules71.o  \
$(language)/decommrules71.o  \
$(language)/commrules71.pf  \
$(language)/decommrules71.pf : $(language)/mrules71.mrule  \
                               $(language)/neededinmrules.pf;
	@actions/mruall $(language) mrules71


 
$(language)/commrules72.o  \
$(language)/decommrules72.o  \
$(language)/commrules72.pf  \
$(language)/decommrules72.pf : $(language)/mrules72.mrule  \
                               $(language)/neededinmrules.pf;
	@actions/mruall $(language) mrules72


 
$(language)/commrules73.o  \
$(language)/decommrules73.o  \
$(language)/commrules73.pf  \
$(language)/decommrules73.pf : $(language)/mrules73.mrule  \
                               $(language)/neededinmrules.pf;
	@actions/mruall $(language) mrules73


 
$(language)/commrules74.o  \
$(language)/decommrules74.o  \
$(language)/commrules74.pf  \
$(language)/decommrules74.pf : $(language)/mrules74.mrule  \
                               $(language)/neededinmrules.pf;
	@actions/mruall $(language) mrules74


 
 
$(language)/commrules75.o  \
$(language)/decommrules75.o  \
$(language)/commrules75.pf  \
$(language)/decommrules75.pf : $(language)/mrules75.mrule  \
                               $(language)/neededinmrules.pf;
	@actions/mruall $(language) mrules75


 
$(language)/commrules76.o  \
$(language)/decommrules76.o  \
$(language)/commrules76.pf  \
$(language)/decommrules76.pf : $(language)/mrules76.mrule  \
                               $(language)/neededinmrules.pf;
	@actions/mruall $(language) mrules76


 
 
$(language)/commrules77.o  \
$(language)/decommrules77.o  \
$(language)/commrules77.pf  \
$(language)/decommrules77.pf : $(language)/mrules77.mrule  \
                               $(language)/neededinmrules.pf;
	@actions/mruall $(language) mrules77


 
$(language)/commrules78.o  \
$(language)/decommrules78.o  \
$(language)/commrules78.pf  \
$(language)/decommrules78.pf : $(language)/mrules78.mrule  \
                               $(language)/neededinmrules.pf;
	@actions/mruall $(language) mrules78


 
 
$(language)/commrules79.o  \
$(language)/decommrules79.o  \
$(language)/commrules79.pf  \
$(language)/decommrules79.pf : $(language)/mrules79.mrule  \
                               $(language)/neededinmrules.pf;
	@actions/mruall $(language) mrules79


 
$(language)/commrules80.o  \
$(language)/decommrules80.o  \
$(language)/commrules80.pf  \
$(language)/decommrules80.pf : $(language)/mrules80.mrule  \
                               $(language)/neededinmrules.pf;
	@actions/mruall $(language) mrules80


 
$(language)/commrules81.o  \
$(language)/decommrules81.o  \
$(language)/commrules81.pf  \
$(language)/decommrules81.pf : $(language)/mrules81.mrule  \
                               $(language)/neededinmrules.pf;
	@actions/mruall $(language) mrules81


 
$(language)/commrules82.o  \
$(language)/decommrules82.o  \
$(language)/commrules82.pf  \
$(language)/decommrules82.pf : $(language)/mrules82.mrule  \
                               $(language)/neededinmrules.pf;
	@actions/mruall $(language) mrules82


 
$(language)/commrules83.o  \
$(language)/decommrules83.o  \
$(language)/commrules83.pf  \
$(language)/decommrules83.pf : $(language)/mrules83.mrule  \
                               $(language)/neededinmrules.pf;
	@actions/mruall $(language) mrules83


 
$(language)/commrules84.o  \
$(language)/decommrules84.o  \
$(language)/commrules84.pf  \
$(language)/decommrules84.pf : $(language)/mrules84.mrule  \
                               $(language)/neededinmrules.pf;
	@actions/mruall $(language) mrules84


 
 
$(language)/commrules85.o  \
$(language)/decommrules85.o  \
$(language)/commrules85.pf  \
$(language)/decommrules85.pf : $(language)/mrules85.mrule  \
                               $(language)/neededinmrules.pf;
	@actions/mruall $(language) mrules85


 
$(language)/commrules86.o  \
$(language)/decommrules86.o  \
$(language)/commrules86.pf  \
$(language)/decommrules86.pf : $(language)/mrules86.mrule  \
                               $(language)/neededinmrules.pf;
	@actions/mruall $(language) mrules86


 
 
$(language)/commrules87.o  \
$(language)/decommrules87.o  \
$(language)/commrules87.pf  \
$(language)/decommrules87.pf : $(language)/mrules87.mrule  \
                               $(language)/neededinmrules.pf;
	@actions/mruall $(language) mrules87


 
$(language)/commrules88.o  \
$(language)/decommrules88.o  \
$(language)/commrules88.pf  \
$(language)/decommrules88.pf : $(language)/mrules88.mrule  \
                               $(language)/neededinmrules.pf;
	@actions/mruall $(language) mrules88


 
 
$(language)/commrules89.o  \
$(language)/decommrules89.o  \
$(language)/commrules89.pf  \
$(language)/decommrules89.pf : $(language)/mrules89.mrule  \
                               $(language)/neededinmrules.pf;
	@actions/mruall $(language) mrules89


 
$(language)/commrules90.o  \
$(language)/decommrules90.o  \
$(language)/commrules90.pf  \
$(language)/decommrules90.pf : $(language)/mrules90.mrule  \
                               $(language)/neededinmrules.pf;
	@actions/mruall $(language) mrules90


 
$(language)/commrules91.o  \
$(language)/decommrules91.o  \
$(language)/commrules91.pf  \
$(language)/decommrules91.pf : $(language)/mrules91.mrule  \
                               $(language)/neededinmrules.pf;
	@actions/mruall $(language) mrules91


 
$(language)/commrules92.o  \
$(language)/decommrules92.o  \
$(language)/commrules92.pf  \
$(language)/decommrules92.pf : $(language)/mrules92.mrule  \
                               $(language)/neededinmrules.pf;
	@actions/mruall $(language) mrules92


 
$(language)/commrules93.o  \
$(language)/decommrules93.o  \
$(language)/commrules93.pf  \
$(language)/decommrules93.pf : $(language)/mrules93.mrule  \
                               $(language)/neededinmrules.pf;
	@actions/mruall $(language) mrules93


 
$(language)/commrules94.o  \
$(language)/decommrules94.o  \
$(language)/commrules94.pf  \
$(language)/decommrules94.pf : $(language)/mrules94.mrule  \
                               $(language)/neededinmrules.pf;
	@actions/mruall $(language) mrules94


 
 
$(language)/commrules95.o  \
$(language)/decommrules95.o  \
$(language)/commrules95.pf  \
$(language)/decommrules95.pf : $(language)/mrules95.mrule  \
                               $(language)/neededinmrules.pf;
	@actions/mruall $(language) mrules95


 
$(language)/commrules96.o  \
$(language)/decommrules96.o  \
$(language)/commrules96.pf  \
$(language)/decommrules96.pf : $(language)/mrules96.mrule  \
                               $(language)/neededinmrules.pf;
	@actions/mruall $(language) mrules96


 
 
$(language)/commrules97.o  \
$(language)/decommrules97.o  \
$(language)/commrules97.pf  \
$(language)/decommrules97.pf : $(language)/mrules97.mrule  \
                               $(language)/neededinmrules.pf;
	@actions/mruall $(language) mrules97


 
$(language)/commrules98.o  \
$(language)/decommrules98.o  \
$(language)/commrules98.pf  \
$(language)/decommrules98.pf : $(language)/mrules98.mrule  \
                               $(language)/neededinmrules.pf;
	@actions/mruall $(language) mrules98


 
$(language)/commrules99.o  \
$(language)/decommrules99.o  \
$(language)/commrules99.pf  \
$(language)/decommrules99.pf : $(language)/mrules99.mrule  \
                               $(language)/neededinmrules.pf;
	@actions/mruall $(language) mrules99


 
$(language)/commrules100.o  \
$(language)/decommrules100.o  \
$(language)/commrules100.pf  \
$(language)/decommrules100.pf : $(language)/mrules100.mrule  \
                               $(language)/neededinmrules.pf;
	@actions/mruall $(language) mrules100


 
$(language)/commrules101.o  \
$(language)/decommrules101.o  \
$(language)/commrules101.pf  \
$(language)/decommrules101.pf : $(language)/mrules101.mrule  \
                               $(language)/neededinmrules.pf;
	@actions/mruall $(language) mrules101


 
$(language)/commrules102.o  \
$(language)/decommrules102.o  \
$(language)/commrules102.pf  \
$(language)/decommrules102.pf : $(language)/mrules102.mrule  \
                               $(language)/neededinmrules.pf;
	@actions/mruall $(language) mrules102


 
$(language)/commrules103.o  \
$(language)/decommrules103.o  \
$(language)/commrules103.pf  \
$(language)/decommrules103.pf : $(language)/mrules103.mrule  \
                               $(language)/neededinmrules.pf;
	@actions/mruall $(language) mrules103


 
$(language)/commrules104.o  \
$(language)/decommrules104.o  \
$(language)/commrules104.pf  \
$(language)/decommrules104.pf : $(language)/mrules104.mrule  \
                               $(language)/neededinmrules.pf;
	@actions/mruall $(language) mrules104


 
 
$(language)/commrules105.o  \
$(language)/decommrules105.o  \
$(language)/commrules105.pf  \
$(language)/decommrules105.pf : $(language)/mrules105.mrule  \
                               $(language)/neededinmrules.pf;
	@actions/mruall $(language) mrules105


 
$(language)/commrules106.o  \
$(language)/decommrules106.o  \
$(language)/commrules106.pf  \
$(language)/decommrules106.pf : $(language)/mrules106.mrule  \
                               $(language)/neededinmrules.pf;
	@actions/mruall $(language) mrules106


 
#!! 
#!! idiom file 107, treated somewhat differently, see above  
#!! 
 
$(language)/commrules107.pf : $(language)/mrules107.mrule  \
                               $(language)/neededinmrules.pf;
	@actions/mru $(language) mrules107


 
$(language)/commrules107.o  \
$(language)/decommrules107.o  \
$(language)/decommrules107.pf : $(language)/mrules107.mrule  \
                               $(language)/neededinmrules.pf;
	@actions/mruall $(language) mrules107


 
$(language)/commrules108.o  \
$(language)/decommrules108.o  \
$(language)/commrules108.pf  \
$(language)/decommrules108.pf : $(language)/mrules108.mrule  \
                               $(language)/neededinmrules.pf;
	@actions/mruall $(language) mrules108


 
$(language)/commrules109.o  \
$(language)/decommrules109.o  \
$(language)/commrules109.pf  \
$(language)/decommrules109.pf : $(language)/mrules109.mrule  \
                               $(language)/neededinmrules.pf;
	@actions/mruall $(language) mrules109


 
$(language)/commrules110.o  \
$(language)/decommrules110.o  \
$(language)/commrules110.pf  \
$(language)/decommrules110.pf : $(language)/mrules110.mrule  \
                               $(language)/neededinmrules.pf;
	@actions/mruall $(language) mrules110


 
$(language)/commrules111.o  \
$(language)/decommrules111.o  \
$(language)/commrules111.pf  \
$(language)/decommrules111.pf : $(language)/mrules111.mrule  \
                               $(language)/neededinmrules.pf;
	@actions/mruall $(language) mrules111


 
$(language)/commrules112.o  \
$(language)/decommrules112.o  \
$(language)/commrules112.pf  \
$(language)/decommrules112.pf : $(language)/mrules112.mrule  \
                               $(language)/neededinmrules.pf;
	@actions/mruall $(language) mrules112


 
$(language)/commrules113.o  \
$(language)/decommrules113.o  \
$(language)/commrules113.pf  \
$(language)/decommrules113.pf : $(language)/mrules113.mrule  \
                               $(language)/neededinmrules.pf;
	@actions/mruall $(language) mrules113


 
$(language)/commrules114.o  \
$(language)/decommrules114.o  \
$(language)/commrules114.pf  \
$(language)/decommrules114.pf : $(language)/mrules114.mrule  \
                               $(language)/neededinmrules.pf;
	@actions/mruall $(language) mrules114


 
 
$(language)/commrules115.o  \
$(language)/decommrules115.o  \
$(language)/commrules115.pf  \
$(language)/decommrules115.pf : $(language)/mrules115.mrule  \
                               $(language)/neededinmrules.pf;
	@actions/mruall $(language) mrules115


 
$(language)/commrules116.o  \
$(language)/decommrules116.o  \
$(language)/commrules116.pf  \
$(language)/decommrules116.pf : $(language)/mrules116.mrule  \
                               $(language)/neededinmrules.pf;
	@actions/mruall $(language) mrules116


 
#!! 
#!! idiom file 117, treated somewhat differently, see above  
#!! 
 
$(language)/commrules117.pf : $(language)/mrules117.mrule  \
                               $(language)/neededinmrules.pf;
	@actions/mru $(language) mrules117


 
$(language)/commrules117.o  \
$(language)/decommrules117.o  \
$(language)/decommrules117.pf : $(language)/mrules117.mrule  \
                               $(language)/neededinmrules.pf;
	@actions/mruall $(language) mrules117


 
$(language)/commrules118.o  \
$(language)/decommrules118.o  \
$(language)/commrules118.pf  \
$(language)/decommrules118.pf : $(language)/mrules118.mrule  \
                               $(language)/neededinmrules.pf;
	@actions/mruall $(language) mrules118


 
$(language)/commrules119.o  \
$(language)/decommrules119.o  \
$(language)/commrules119.pf  \
$(language)/decommrules119.pf : $(language)/mrules119.mrule  \
                               $(language)/neededinmrules.pf;
	@actions/mruall $(language) mrules119


 
$(language)/commrules120.o  \
$(language)/decommrules120.o  \
$(language)/commrules120.pf  \
$(language)/decommrules120.pf : $(language)/mrules120.mrule  \
                               $(language)/neededinmrules.pf;
	@actions/mruall $(language) mrules120


 
$(language)/commrules121.o  \
$(language)/decommrules121.o  \
$(language)/commrules121.pf  \
$(language)/decommrules121.pf : $(language)/mrules121.mrule  \
                               $(language)/neededinmrules.pf;
	@actions/mruall $(language) mrules121


 
$(language)/commrules122.o  \
$(language)/decommrules122.o  \
$(language)/commrules122.pf  \
$(language)/decommrules122.pf : $(language)/mrules122.mrule  \
                               $(language)/neededinmrules.pf;
	@actions/mruall $(language) mrules122


 
$(language)/commrules123.o  \
$(language)/decommrules123.o  \
$(language)/commrules123.pf  \
$(language)/decommrules123.pf : $(language)/mrules123.mrule  \
                               $(language)/neededinmrules.pf;
	@actions/mruall $(language) mrules123


 
$(language)/commrules124.o  \
$(language)/decommrules124.o  \
$(language)/commrules124.pf  \
$(language)/decommrules124.pf : $(language)/mrules124.mrule  \
                               $(language)/neededinmrules.pf;
	@actions/mruall $(language) mrules124


 
 
$(language)/commrules125.o  \
$(language)/decommrules125.o  \
$(language)/commrules125.pf  \
$(language)/decommrules125.pf : $(language)/mrules125.mrule  \
                               $(language)/neededinmrules.pf;
	@actions/mruall $(language) mrules125


 
$(language)/commrules126.o  \
$(language)/decommrules126.o  \
$(language)/commrules126.pf  \
$(language)/decommrules126.pf : $(language)/mrules126.mrule  \
                               $(language)/neededinmrules.pf;
	@actions/mruall $(language) mrules126


 
$(language)/commrules127.o  \
$(language)/decommrules127.o  \
$(language)/commrules127.pf  \
$(language)/decommrules127.pf : $(language)/mrules127.mrule  \
                               $(language)/neededinmrules.pf;
	@actions/mruall $(language) mrules127


 
$(language)/commrules128.o  \
$(language)/decommrules128.o  \
$(language)/commrules128.pf  \
$(language)/decommrules128.pf : $(language)/mrules128.mrule  \
                               $(language)/neededinmrules.pf;
	@actions/mruall $(language) mrules128


 
$(language)/commrules129.o  \
$(language)/decommrules129.o  \
$(language)/commrules129.pf  \
$(language)/decommrules129.pf : $(language)/mrules129.mrule  \
                               $(language)/neededinmrules.pf;
	@actions/mruall $(language) mrules129


 
$(language)/commrules130.o  \
$(language)/decommrules130.o  \
$(language)/commrules130.pf  \
$(language)/decommrules130.pf : $(language)/mrules130.mrule  \
                               $(language)/neededinmrules.pf;
	@actions/mruall $(language) mrules130


 
$(language)/commrules131.o  \
$(language)/decommrules131.o  \
$(language)/commrules131.pf  \
$(language)/decommrules131.pf : $(language)/mrules131.mrule  \
                               $(language)/neededinmrules.pf;
	@actions/mruall $(language) mrules131


 
$(language)/commrules132.o  \
$(language)/decommrules132.o  \
$(language)/commrules132.pf  \
$(language)/decommrules132.pf : $(language)/mrules132.mrule  \
                               $(language)/neededinmrules.pf;
	@actions/mruall $(language) mrules132


 
$(language)/commrules133.o  \
$(language)/decommrules133.o  \
$(language)/commrules133.pf  \
$(language)/decommrules133.pf : $(language)/mrules133.mrule  \
                               $(language)/neededinmrules.pf;
	@actions/mruall $(language) mrules133


 
$(language)/commrules134.o  \
$(language)/decommrules134.o  \
$(language)/commrules134.pf  \
$(language)/decommrules134.pf : $(language)/mrules134.mrule  \
                               $(language)/neededinmrules.pf;
	@actions/mruall $(language) mrules134


 
 
$(language)/commrules135.o  \
$(language)/decommrules135.o  \
$(language)/commrules135.pf  \
$(language)/decommrules135.pf : $(language)/mrules135.mrule  \
                               $(language)/neededinmrules.pf;
	@actions/mruall $(language) mrules135


 
$(language)/commrules136.o  \
$(language)/decommrules136.o  \
$(language)/commrules136.pf  \
$(language)/decommrules136.pf : $(language)/mrules136.mrule  \
                               $(language)/neededinmrules.pf;
	@actions/mruall $(language) mrules136


 
$(language)/commrules137.o  \
$(language)/decommrules137.o  \
$(language)/commrules137.pf  \
$(language)/decommrules137.pf : $(language)/mrules137.mrule  \
                               $(language)/neededinmrules.pf;
	@actions/mruall $(language) mrules137


 
$(language)/commrules138.o  \
$(language)/decommrules138.o  \
$(language)/commrules138.pf  \
$(language)/decommrules138.pf : $(language)/mrules138.mrule  \
                               $(language)/neededinmrules.pf;
	@actions/mruall $(language) mrules138


 
$(language)/commrules139.o  \
$(language)/decommrules139.o  \
$(language)/commrules139.pf  \
$(language)/decommrules139.pf : $(language)/mrules139.mrule  \
                               $(language)/neededinmrules.pf;
	@actions/mruall $(language) mrules139


 
$(language)/commrules140.o  \
$(language)/decommrules140.o  \
$(language)/commrules140.pf  \
$(language)/decommrules140.pf : $(language)/mrules140.mrule  \
                               $(language)/neededinmrules.pf;
	@actions/mruall $(language) mrules140


 
#---removed from dependencies of neededinmrules.pf: 
#$(language)/maket.pf  \
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

 
$(language)/neededinmrules.pf : general/limatches.pf;
	@echo "empty" > $(language)/target/neededinmrules.pf
 

#!!!!!!!!!!!!!!!!!!!!!!!! 
 
#!! --------------segmentation data files------------------------------ 
 
$(language)/gsuffix.svo \
$(language)/gsuffix.svs \
$(language)/gsuffix.sco \
$(language)/gsuffix.sso \
$(language)/gsuffix.sro \
$(language)/asuffix.svs \
$(language)/asuffix.svo \
$(language)/asuffix.sco \
$(language)/asuffix.sso \
$(language)/asuffix.sro : $(language)/suffix.seg \
                          $(language)/asegcom.exe \
                          $(language)/gsegcom.exe;
	@actions/seg $(language) suffix
 
$(language)/gprefix.svo \
$(language)/gprefix.svs \
$(language)/gprefix.sco \
$(language)/gprefix.sso \
$(language)/gprefix.sro \
$(language)/aprefix.svs \
$(language)/aprefix.svo \
$(language)/aprefix.sco \
$(language)/aprefix.sso \
$(language)/aprefix.sro : $(language)/prefix.seg \
                          $(language)/asegcom.exe \
                          $(language)/gsegcom.exe;
	@actions/seg $(language) prefix
 
$(language)/glglue.svo \
$(language)/glglue.svs \
$(language)/glglue.sco \
$(language)/glglue.sso \
$(language)/glglue.sro \
$(language)/alglue.svo \
$(language)/alglue.svs \
$(language)/alglue.sco \
$(language)/alglue.sso \
$(language)/alglue.sro : $(language)/lglue.seg \
                          $(language)/asegcom.exe \
                          $(language)/gsegcom.exe;
	@actions/seg $(language) lglue
 
$(language)/grglue.svo \
$(language)/grglue.svs \
$(language)/grglue.sco \
$(language)/grglue.sso \
$(language)/grglue.sro \
$(language)/arglue.svo \
$(language)/arglue.svs \
$(language)/arglue.sco \
$(language)/arglue.sso \
$(language)/arglue.sro : $(language)/rglue.seg \
                          $(language)/asegcom.exe \
                          $(language)/gsegcom.exe;
	@actions/seg $(language) rglue
 
$(language)/gmglue.svo \
$(language)/gmglue.svs \
$(language)/gmglue.sco \
$(language)/gmglue.sso \
$(language)/gmglue.sro \
$(language)/amglue.svo \
$(language)/amglue.svs \
$(language)/amglue.sco \
$(language)/amglue.sso \
$(language)/amglue.sro : $(language)/mglue.seg \
                          $(language)/asegcom.exe \
                          $(language)/gsegcom.exe;
	@actions/seg $(language) mglue
 
$(language)/ldprims.p : $(language)/surout ;

$(language)/surfrules.p : $(language)/surout ;

$(language)/surfrulesblocks.pf : $(language)/surout ;

$(language)/surfrulesblocks.p : $(language)/surout ;

$(language)/lsrulepars.pf : $(language)/surout ;

$(language)/ldsurfswitch.p : $(language)/surout ;

$(language)/surfrulesgraphs.p : $(language)/surout ;


$(language)/surout : $(language)/surfrules1.sur  \
                                  $(language)/surfrules2.sur  \
                                  $(language)/surfrules3.sur  \
                                  $(language)/surfrules4.sur  \
                                  general/surfrulesblocks.pf  \
                                  $(language)/surcom.exe  \
                                  $(language)/surfcom.exe  \
                                  $(language)/surflink.exe ;
	touch $(language)/target/surout
	@actions/sur $(language) surfrules
	@actions/surf $(language) surfrules1
	@actions/surf $(language) surfrules2
	@actions/surf $(language) surfrules3
	@actions/surf $(language) surfrules4
	@actions/slk $(language)
 
$(language)/ldanilrules.p : $(language)/traout ;

$(language)/ldgenilrules.p : $(language)/traout ;

$(language)/traout : $(language)/transferrules.trans  \
                               $(language)/tracom.exe;
	touch $(language)/target/traout
	@actions/tra $(language) transferrules
 
tools/neededforcompiler.pf : tools/tstring.o \
                              tools/tfiles.o \
                              general/strtokey.o \
                              general/mem.o \
                              tools/mrudomcom.exe \
                              tools/gencomp.exe ;
	@echo "empty" > tools/target/neededforcompiler.pf

$(language)/neededforcompiler.pf : tools/neededforcompiler.pf \
                              general/ldmrules.pf \
                              general/lidomaint.pf \
                              tools/tldstrtostr.o \
                              tools/tldconvrec.o \
                              $(language)/ldcatsets.o \
                              $(language)/ldstrtotype.o \
                              $(language)/ldtypetostr.o ;
	@echo "empty" > $(language)/target/neededforcompiler.pf

##########domcom--gencomp

tools/domcomgraphdef.pf : tools/gencomgraphdef.pf \
                         tools/gencomp.exe;
	@actions/gencomp tools gencomgraphdef.pf domcomgraphdef.pf domcom

tools/domcomgraph.p : tools/gencomgraph.p \
                        tools/gencomp.exe;
	@actions/gencomp tools gencomgraph.p domcomgraph.p domcom
 
tools/domcomgraph.pf : tools/gencomgraph.pf \
                         tools/gencomp.exe;
	@actions/gencomp tools gencomgraph.pf domcomgraph.pf domcom
 

tools/domcomdecl.p : tools/gencomdecl.p \
                         tools/gencomp.exe;
	@actions/gencomp tools gencomdecl.p domcomdecl.p domcom

tools/domcomdecl.pf : tools/gencomdecl.pf \
                         tools/gencomp.exe;
	@actions/gencomp tools gencomdecl.pf domcomdecl.pf domcom

tools/domcomparser.p : tools/gencomparser.p \
                         tools/gencomp.exe;
	@actions/gencomp tools gencomparser.p domcomparser.p domcom

tools/domcomparser.pf : tools/gencomparser.pf \
                         tools/gencomp.exe;
	@actions/gencomp tools gencomparser.pf domcomparser.pf domcom
 
tools/domcomscanner.pf : tools/gencomscanner.pf \
                         tools/gencomp.exe;
	@actions/gencomp tools gencomscanner.pf domcomscanner.pf domcom


###---mrudomcom--gencomp

tools/mrudomcomgraphdef.pf : tools/gencomgraphdef.pf \
                         tools/gencomp.exe;
	@actions/gencomp tools gencomgraphdef.pf mrudomcomgraphdef.pf mrudomcom

tools/mrudomcomgraph.p : tools/gencomgraph.p \
                         tools/gencomp.exe;
	@actions/gencomp tools gencomgraph.p mrudomcomgraph.p mrudomcom
 
tools/mrudomcomgraph.pf : tools/gencomgraph.pf \
                         tools/gencomp.exe;
	@actions/gencomp tools gencomgraph.pf mrudomcomgraph.pf mrudomcom

tools/mrudomcomdecl.p : tools/gencomdecl.p \
                         tools/gencomp.exe;
	@actions/gencomp tools gencomdecl.p mrudomcomdecl.p mrudomcom

tools/mrudomcomdecl.pf : tools/gencomdecl.pf \
                         tools/gencomp.exe;
	@actions/gencomp tools gencomdecl.pf mrudomcomdecl.pf mrudomcom
 
tools/mrudomcomparser.p : tools/gencomparser.p \
                         tools/gencomp.exe;
	@actions/gencomp tools gencomparser.p mrudomcomparser.p mrudomcom
 
tools/mrudomcomparser.pf : tools/gencomparser.pf \
                         tools/gencomp.exe;
	@actions/gencomp tools gencomparser.pf mrudomcomparser.pf mrudomcom
 
tools/mrudomcomscanner.pf : tools/gencomscanner.pf \
                         tools/gencomp.exe;
	@actions/gencomp tools gencomscanner.pf mrudomcomscanner.pf mrudomcom
 

$(language)/lsconstraints.p : $(language)/constraints.constr \
                                tools/constraintgen.exe;
	@actions/constraint $(language) constraints
 
